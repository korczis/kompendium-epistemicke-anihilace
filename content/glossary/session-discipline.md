+++
title = "Session discipline (disciplína sezení)"
weight = 69
description = "Protokol P0 Prismatic Platform pro každé vývojové sezení: sledování v GitLabu, průběžné atomické commity, okamžitý push a hooky bez obcházení."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "architecture"]

[extra]
category = "architecture"
related_terms = ["gitlab-ci", "pre-commit-hooks", "quality-gates", "nm-nd", "git-trees", "violation-protocol"]
author = "Tomas Korcak (korczis)"
reading_time = "4 min"
word_count = 822
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Session", "Discipline", "Mandatory", "GitLab", "glossary", "architecture", "Prismatic Platform", "Every"]
quality_score = 77
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Session discipline (disciplína sezení) – glosář"
+++

## Definice a přehled

Disciplína sezení (*Session Discipline*) je protokol úrovně P0 (absolutní), který předepisuje,
aby každé vývojové sezení dodržovalo přísné provozní postupy zajišťující dohledatelnost,
prevenci ztráty práce a průběžné vynucování kvality. Protokol vyžaduje založení issue v GitLabu
pro každou pracovní položku, průběžné atomické commity místo dávkování, okamžitý push na
vzdálený repozitář po každém commitu, lokální testování před každým commitem, průchod všemi git
hooky bez přepínačů obchvatu a uchování kontextu sezení pro kontinuitu mezi sezeními.

Protokol řeší základní problém vývoje s asistencí umělé inteligence: sezení jsou pomíjivá, ale
změny kódu jsou trvalé. Bez disciplíny může produktivní sezení vytvořit výborný kód, který se
ztratí přerušeným spojením, nepushnutým commitem nebo netestovanou změnou, jež rozbije
sestavení. Disciplína sezení mění přirozeně nestálou povahu vývojových sezení ve spolehlivý,
dohledatelný a auditovatelný proces, v němž se každá změna sleduje, testuje, commituje
a pushuje průběžně, místo aby se hromadila na riskantní dávkovou operaci na konci sezení.

Disciplína sezení je přímým výrazem doktríny [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md)
uplatněné na vývojový postup. NO MERCY znamená nulovou toleranci k nepushnutým commitům,
netestovaným změnám a chybějícímu sledování v issue. NO DOUBTS znamená, že každý krok je
uvážený, ověřený a dohledatelný. Protokol není doporučující – vynucují ho automatické hooky,
automatizace životního cyklu sezení a eskalace porušení, která u nejzávažnějších prohřešků, jako
je použití přepínače `--no-verify`, může spustit L4 Supreme Review.

Pro Kompendium je disciplína sezení pojmem z kontextu platformy. Kniha samotná vzniká podobným
způsobem – v malých ověřených krocích s kontrolou sestavení –, ale heslo se netýká klinických
„sezení“ ani terapie.

## Technický rozbor

### Požadavky protokolu

Protokol disciplíny sezení předepisuje šest nepodkročitelných požadavků:

| Požadavek | Popis | Vynucení |
|-------------|-------------|-------------|
| sledování v GitLabu | každá pracovní položka má odpovídající issue v GitLabu | bez issue je sezení ZABLOKOVÁNO |
| průběžné commity | změny se commitují atomicky a okamžitě | ŽÁDNÉ DÁVKOVÁNÍ |
| push na vzdálený repozitář | každý commit se okamžitě pushne na origin | nepushnutá práce = nedokončené sezení |
| lokální testování | všechny změny se před commitem lokálně otestují | netestovaný kód = odmítnut |
| všechny hooky projdou | hooky pre-commit, commit-msg a pre-push projdou | ŽÁDNÉ přepínače obchvatu |
| uchování kontextu | stav sezení se ukládá do `.claude/session-context/` | kontext sezení zůstane zachován |

### Zakázané kroky

Protokol za všech okolností výslovně zakazuje tyto kroky:

```elixir
defmodule PrismaticClaude.SessionDiscipline do
  @moduledoc """
  Enforces session discipline protocol.
  All forbidden actions trigger immediate violation response.
  """

  @forbidden_actions [
    {:git_no_verify_commit, "git commit --no-verify",
     :l4_supreme_review, "Bypasses pre-commit quality gates"},
    {:git_no_verify_push, "git push --no-verify",
     :l4_supreme_review, "Bypasses pre-push validation"},
    {:batch_commit, "Multiple unrelated changes in one commit",
     :l3_rejection, "Violates atomic commit requirement"},
    {:untested_commit, "Committing without local test verification",
     :l3_rejection, "Violates test-before-commit requirement"},
    {:no_ticket_work, "Working without GitLab ticket",
     :l3_rejection, "Violates issue tracking requirement"},
    {:unpushed_session_end, "Session ending with unpushed commits",
     :l2_block, "Violates immediate push requirement"}
  ]

  @type violation_level :: :l2_block | :l3_rejection | :l4_supreme_review

  @spec check_forbidden(String.t()) :: :ok | {:violation, violation_level(), String.t()}
  def check_forbidden(command) do
    case Enum.find(@forbidden_actions, fn {_id, pattern, _level, _reason} ->
      String.contains?(command, pattern)
    end) do
      nil -> :ok
      {_id, _pattern, level, reason} -> {:violation, level, reason}
    end
  end
end
```

### Průběh sezení

Každé sezení se řídí povinným třífázovým průběhem:

```elixir
defmodule PrismaticClaude.SessionDiscipline.ExecutionFlow do
  @moduledoc """
  Manages the mandatory session execution flow.
  Each phase has specific requirements and validation.
  """

  @type session_phase :: :start | :active | :end

  @spec session_start(map()) :: {:ok, map()} | {:error, term()}
  def session_start(context) do
    with {:ok, issues} <- create_gitlab_issues(context),
         {:ok, prev_context} <- load_session_context(),
         {:ok, baseline} <- run_quality_baseline() do
      {:ok, %{
        phase: :active,
        issues: issues,
        previous_context: prev_context,
        baseline: baseline,
        commits: [],
        start_time: DateTime.utc_now()
      }}
    end
  end

  @spec during_session(map(), map()) :: {:ok, map()} | {:error, term()}
  def during_session(state, change) do
    with {:ok, _} <- run_local_tests(change),
         {:ok, commit} <- atomic_commit(change),
         {:ok, _} <- push_to_remote(commit),
         {:ok, _} <- update_gitlab_issue(state.issues, commit) do
      {:ok, %{state | commits: [commit | state.commits]}}
    end
  end

  @spec session_end(map()) :: {:ok, map()} | {:error, term()}
  def session_end(state) do
    with :ok <- verify_all_pushed(state.commits),
         :ok <- save_session_context(state),
         :ok <- close_gitlab_issues(state.issues) do
      {:ok, %{state | phase: :end}}
    end
  end
end
```

### Protokol eskalace porušení

Porušení disciplíny sezení spouštějí eskalaci podle závažnosti (obecně viz [Violation
Protocol](@/glossary/violation-protocol.md)):

| Úroveň | Popis | Spouštěč | Akce |
|-------|-------------|---------|--------|
| L1 | drobná odchylka | opožděný push, nepřesná zpráva commitu | varování + okamžitá oprava |
| L2 | porušení postupu | nepushnuté commity na konci sezení | blokace + povinný push |
| L3 | porušení protokolu | chybí issue v GitLabu, netestovaný commit, dávkový commit | odmítnutí + restart z čistého stavu |
| L4 | ohrožení integrity | použití `--no-verify`, obejití hooku | Supreme Review + šetření |

```elixir
defmodule PrismaticClaude.SessionDiscipline.ViolationHandler do
  @moduledoc """
  Handles session discipline violations with appropriate escalation.
  """

  require Logger

  @spec handle_violation(violation_level(), String.t(), map()) :: :ok
  def handle_violation(:l1_warning, reason, context) do
    Logger.warning("Session Discipline L1: #{reason}")
    :telemetry.execute(
      [:prismatic_claude, :session_discipline, :violation],
      %{level: 1},
      %{reason: reason, session: context.session_id}
    )
  end

  def handle_violation(:l2_block, reason, context) do
    Logger.error("Session Discipline L2 BLOCK: #{reason}")
    :telemetry.execute(
      [:prismatic_claude, :session_discipline, :violation],
      %{level: 2},
      %{reason: reason, session: context.session_id}
    )
    block_further_operations(context)
  end

  def handle_violation(:l3_rejection, reason, context) do
    Logger.error("Session Discipline L3 REJECTION: #{reason}")
    reject_and_restart(context)
  end

  def handle_violation(:l4_supreme_review, reason, context) do
    Logger.error("Session Discipline L4 SUPREME REVIEW: #{reason}")
    escalate_to_supreme(context, reason)
  end
end
```

## Architektura a implementace

### Napojení na GenServer SessionLifecycle

Disciplínu sezení vynucuje GenServer SessionLifecycle, který automatizuje spouštění hooků na
hranicích sezení:

```elixir
defmodule PrismaticClaude.SessionLifecycle do
  @moduledoc """
  OTP GenServer managing session lifecycle with discipline enforcement.
  Executes hooks at session boundaries with circuit breaker protection.
  """

  use GenServer

  # 905 lines of implementation including:
  # - Priority-based hook registration
  # - Enable/disable per hook
  # - Circuit breaker (opens after 3 failures, resets after 60s)
  # - Telemetry event emission at all lifecycle points

  @impl true
  def handle_call({:trigger, :session_start}, _from, state) do
    # Execute mandatory hooks:
    # 1. Load session context
    # 2. Create GitLab issues
    # 3. Run mix autoheal.baseline
    # 4. Run mix autoevolve status --brief
    result = execute_hooks(:session_start, state)
    {:reply, result, update_state(state, :active)}
  end

  @impl true
  def handle_call({:trigger, :session_end}, _from, state) do
    # Execute mandatory hooks:
    # 1. Verify all commits pushed
    # 2. Save session context
    # 3. Run mix autoheal.cycle
    # 4. Close/update GitLab issues
    result = execute_hooks(:session_end, state)
    {:reply, result, update_state(state, :ended)}
  end
end
```

### Formát uchování kontextu

Kontext sezení se ukládá do `.claude/session-context/` ve strukturovaném formátu Markdown:

```markdown
# Session Context: 2026-02-15 Feature Development

## Objectives
- Implement EASM dashboard filters
- Fix certificate expiry detection

## Actions Taken
1. Added LiveView filter component (commit abc123)
2. Fixed cert expiry parsing (commit def456)
3. Added regression tests (commit ghi789)

## Files Modified
- apps/prismatic_perimeter/lib/easm/dashboard_live.ex
- apps/prismatic_perimeter/lib/easm/cert_scanner.ex
- apps/prismatic_perimeter/test/easm/cert_scanner_test.exs

## Quality State
- Quality Score: doctrine-enforced
- Tests: All passing
- QDP: 0

## GitLab Issues
- #1290: EASM dashboard filters (closed)
- #1291: Certificate expiry fix (closed)

## Next Steps
- Implement dashboard export functionality
- Add compliance trend charts
```

### Vynucení atomických commitů

Protokol vynucuje atomické commity validací v pre-commitu:

```elixir
defmodule PrismaticClaude.SessionDiscipline.AtomicCommitValidator do
  @moduledoc """
  Validates that commits are atomic - single logical change per commit.
  Rejects commits that bundle unrelated changes.
  """

  @spec validate(list()) :: :ok | {:error, :non_atomic, String.t()}
  def validate(staged_files) do
    domains = categorize_files(staged_files)

    cond do
      length(Map.keys(domains)) > 2 ->
        {:error, :non_atomic, "Commit spans #{length(Map.keys(domains))} domains: #{inspect(Map.keys(domains))}"}

      mixed_test_and_source?(staged_files) and not regression_fix?(staged_files) ->
        {:error, :non_atomic, "Mixing unrelated test and source changes"}

      true ->
        :ok
    end
  end

  defp categorize_files(files) do
    Enum.group_by(files, fn file ->
      cond do
        String.contains?(file, "prismatic_perimeter") -> :perimeter
        String.contains?(file, "prismatic_web") -> :web
        String.contains?(file, "prismatic_agents") -> :agents
        String.contains?(file, "prismatic_safety") -> :safety
        true -> :other
      end
    end)
  end
end
```

## Užití v Prismatic Platform

### Příkazy pracovního postupu sezení

```bash
# Session start (automated via SessionLifecycle)
mix autoheal.baseline && mix autoevolve status

# During session - commit and push cycle
mix test apps/prismatic_perimeter/test/changed_test.exs  # Test first
git add apps/prismatic_perimeter/lib/changed_file.ex     # Stage specific files
git commit -m "fix(perimeter): correct certificate expiry parsing"  # Atomic commit
git push origin feature/cert-fix                          # Immediate push

# Session end (automated via SessionLifecycle)
mix autoheal.cycle && mix autoevolve.mega
```

### Napojení na GitLab

```bash
# Set GitLab credentials
export GITLAB_TOKEN="glpat-xxx"
export GITLAB_PROJECT_ID="korczis/prismatic-platform"

# Create session issue
glab issue create --title "Session: EASM dashboard improvements" --label "session"

# Update progress
glab issue note 1290 --message "Completed filter implementation, starting tests"

# Close on session end
glab issue close 1290 --comment "Session complete. All changes pushed and tested."
```

## Osvědčené postupy

1. **Zakládat issue v GitLabu dřív, než se začne psát kód.** Vývoj začínající issue zajišťuje,
   že každou změnu lze dohledat k požadavku, a dává infrastrukturu pro sledování pokroku.
2. **Commitovat po každé logické změně.** Změny nehromadit. Každá dokončená funkce, opravená
   chyba nebo přidaný test má být vlastním commitem. To maximalizuje dohledatelnost
   a minimalizuje riziko.
3. **Pushovat hned po commitu.** Doba mezi commitem a pushem je oknem zranitelnosti. Výpadek sítě,
   proudu nebo vypršení sezení v tomto okně může vést ke ztrátě práce.
4. **Testovat před každým commitem, ne jen na konci sezení.** Spouštění testů před každým
   commitem zachytí regrese okamžitě, kdy je změna v kontextu čerstvá a snadno se opraví (viz
   [Regression Test](@/glossary/regression-test.md)).
5. **Ukládat kontext i u krátkých sezení.** Kontext sezení je mechanismem kontinuity mezi
   sezeními. I patnáctiminutové sezení má svůj kontext uložit, aby ho další sezení mohlo načíst.

## Časté chyby

- **Brát disciplínu sezení jako režii**: protokol přidává režii u každého commitu (testy, push),
  ale odstraňuje mnohem větší náklady ze ztracené práce, rozbitých sestavení a nedohledatelných
  změn.
- **Dávkovat „malé“ změny**: neexistuje práh, pod nímž by bylo dávkování přijatelné. I změny
  jednoho řádku se mají commitovat atomicky, pokud představují úplnou logickou změnu.
- **Zapomenout pushnout před koncem sezení**: nejčastější porušení. Automatické hooky na konci
  sezení ho zachytí, ale spoléhání na automatizaci místo návyku vede k selháním, když hooky
  nejsou aktivní.
- **Zakládat příliš široké issue**: issue typu „vylepšit platformu“ nemá žádnou hodnotu pro
  sledování. Issue mají být natolik konkrétní, aby je šlo uzavřít s jasnou definicí hotového.
- **Vynechat uložení kontextu u „nedůležitých“ sezení**: každé sezení vytváří kontext cenný pro
  budoucí sezení. Vynechání vytváří mezery v příběhu zlepšování kvality.

## Meze a souvislosti

Protokol popisuje vývojovou praxi platformy v době zápisu (GitLab, hooky, adresář
`.claude/`). Nástroje se mohou měnit; podstatou je, že výsledek práce má být vždy dohledatelný
a nikdy nezávislý na paměti jednoho sezení. Navazuje na [Clean Run](@/glossary/clean-run.md),
[Zero Warning Policy](@/glossary/zero-warning-policy.md) a [QDP](@/glossary/qdp.md).

## Související

**Pojmy platformy v tomto glosáři**

- [NM/ND](@/glossary/nm-nd.md) – řídicí rámec, který standardy sezení předepisuje.
- [Violation Protocol](@/glossary/violation-protocol.md) – eskalace při porušení disciplíny.
- [AIAD](@/glossary/aiad.md) – standard agentů se souladem s disciplínou sezení.
- [Regression Test](@/glossary/regression-test.md) – testy, které se spouštějí před commitem.
- [QDP](@/glossary/qdp.md) – kvóta dluhu kvality na sezení.

**Hesla a přehledy platformy mimo tuto knihu**

- [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
  [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Quality DNA](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-dna/),
  [GitLab CI](https://prismatic-reality-com.github.io/prismatic-promo/glossary/gitlab-ci/) –
  mechanismy vynucení a kontinuity.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/).

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co
  kniha z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
