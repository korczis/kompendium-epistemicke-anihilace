+++
title = "Violation protocol (protokol porušení)"
weight = 4
description = "Úrovně eskalace L1–L4 pro porušení doktríny NM/ND v Prismatic Platform: deterministické vynucení, auditní stopa a pevně dané postupy nápravy."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "architecture"]

[extra]
category = "doctrine"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
abbreviation = "VP"
date_created = "2026-02-22"
date_updated = "2026-02-22"
importance = "critical"
related_terms = ["nm-nd", "no-mercy", "no-doubts", "quality-gates", "regression-test", "archer-supreme", "violation-protocol", "pre-commit-hooks", "credo", "dialyzer", "clean-run", "zero-warning-policy"]
keywords = ["violation protocol", "escalation levels", "quality enforcement", "NM/ND doctrine", "L1 L2 L3 L4 violations", "automated enforcement", "audit trail", "violation state machine", "supreme review"]
platforms = ["elixir", "phoenix", "prismatic"]
use_cases = ["quality-enforcement", "violation-detection", "audit-compliance", "pre-commit-validation", "ci-pipeline-gating"]
prerequisites = ["nm-nd", "quality-gates", "pre-commit-hooks"]
key_takeaway = "The Violation Protocol transforms quality enforcement from an informal process into a formal state machine with four deterministic escalation levels, ensuring every deviation receives a proportional, auditable response."
date_modified = "2026-11-10"
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Violation protocol (protokol porušení) – glosář"
+++

## Definice a přehled

Protokol porušení (*Violation Protocol*) je formální rámec eskalace a vynucení, který v Prismatic
Platform řídí reakce na porušení [doktríny NO MERCY, NO DOUBTS (NM/ND)](@/glossary/nm-nd.md).
Definuje čtyři přesně odstupňované úrovně eskalace – L1 až L4 –, z nichž každá odpovídá konkrétní
kategorii závažnosti porušení, předepsané reakci vynucení a autoritě, která porušení řeší.
Protokol zajišťuje, že každá odchylka od kvality, neúplná dodávka nebo kompromitace doktríny dostane
přiměřenou, deterministickou a auditovatelnou odpověď.

V tradičním softwarovém inženýrství se porušení kvality řeší neformálně: komentáři při code
review, tikety v Jiře nebo v lepším případě selháními CI pipeline, které mohou vývojáři zopakovat
nebo přebít. Protokol porušení tento přístup zásadně odmítá. Chápe vynucení kvality jako formální
systém s definovanými stavy, přechody a invarianty. Každé porušení má právě jednu správnou úroveň
eskalace, jednu předepsanou reakci a jednu cestu k vyřešení. Neexistuje nejednoznačnost,
vyjednávání ani obchvat.

Protokol působí současně ve třech oblastech vynucení: v automatizovaných nástrojích (pre-commit
hooky, CI pipeline, brány kvality), v dohledu agentů (agenti [AIAD](@/glossary/aiad.md) sledující
kvalitu kódu v reálném čase) a v přezkumu nejvyšší autoritou (agenti L5, jako je [Archer
Supreme](@/glossary/archer-supreme.md), u nejzávažnějších porušení). Vrstvené vynucení zajišťuje,
že porušení se zachytí co nejdříve a eskaluje se jen tehdy, když jeho závažnost vyšší autoritu
vyžaduje.

Čtyři úrovně eskalace tvoří přísnou hierarchii:

| Úroveň | Klasifikace | Spouštěč | Reakce | Autorita |
|-------|---------------|---------|----------|-----------|
| **L1** | drobná odchylka | problémy stylu, nejednotné pojmenování | varování + okamžitá oprava | agent |
| **L2** | porušení kvality | varování při kompilaci, neprošlé testy, porušení Credo | blokace + povinná oprava | systém |
| **L3** | neúplná dodávka | stuby, zástupné kódy, TODO, chybějící testy | odmítnutí + restart | pipeline |
| **L4** | kompromitováno pochybností | pokusy obejít hooky, `--no-verify`, zfalšované výsledky | odmítnutí + Supreme Review | L5 Supreme |

Pro Kompendium je protokol porušení pojmem z kontextu platformy a týká se výhradně softwarových
artefaktů. Kniha upozorňuje, že stupňované tresty, „restart od nuly“ a přezkum nejvyšší autoritou
mají v lidských skupinách opačný význam – jsou typickými prvky kontroly chování v prostředích
s vysokou mírou kontroly (viz [model BITE](@/glossary/bite-model.md)); u lidí kniha vychází
z odpovědnosti s možností odvolání a z ochrany toho, kdo chybu přizná.

## Historický kontext a motivace

Protokol porušení byl formalizován v 6. generaci vývoje Prismatic Platform, v období systematického
zavádění [bran kvality](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/).
Před jeho vznikem bylo vynucení kvality binární: kontroly buď prošly, nebo neprošly, bez rozlišení
mezi drobnou chybou formátování a záměrným pokusem obejít hook. Tento nedostatek jemnosti vytvářel
dva problémy.

Zaprvé vývojáři zacházeli se všemi selháními stejně a vynaložili minimum úsilí, aby branou prošli,
bez ohledu na závažnost podkladového problému. Varování při kompilaci dostalo stejnou pozornost
jako stub, přestože ten představuje zásadně jinou kategorii rizika kvality. Zadruhé neexistovala
eskalační cesta pro systémová porušení. Když vzorec opakovaných selhání ukazoval na hlubší problém
procesu, a ne na ojedinělou chybu v kódu, neměl systém vynucení mechanismus, jak eskalovat nad
rámec okamžité blokace.

Čtyřúrovňová klasifikace vznikla z analýzy historických porušení v prvních pěti generacích
platformy. Analýza odhalila čtyři přirozené shluky závažnosti: kosmetické odchylky, které
neovlivňují správnost (L1), funkční selhání kvality zachycená nástroji (L2), zásadní selhání
úplnosti vyžadující přepracování (L3) a porušení integrity, která podkopávají samotný systém
vynucení (L4). Každý shluk vyžadoval odlišnou strategii reakce a protokol tyto reakce formalizoval
do deterministického rámce.

Rozhodnutí udělat z protokolu formální stavový automat místo souboru doporučení bylo záměrné.
Stavové automaty mají ověřitelné vlastnosti správnosti: každý stav má definované přechody, každý
přechod má předpoklady a chování systému je deterministické a auditovatelné. Tato formálnost
odpovídá širšímu závazku platformy chápat vynucení kvality jako inženýrskou disciplínu, ne jako
společenskou konvenci.

## Technický rozbor

### Sémantika úrovní eskalace

Každá úroveň porušení nese přesný význam, který určuje reakci vynucení i cestu k vyřešení.

**L1 – drobná odchylka** představuje kosmetické nebo stylistické odchylky od standardů
platformy: nejednotné pojmenování proměnných, méně vhodné, ale funkční vzory kódu, chybějící
dokumentaci interních pomocných funkcí nebo drobné odchylky formátování. Porušení L1 neovlivňují
správnost ani bezpečnost. Reakcí je varování s očekávanou okamžitou opravou v témže commitu nebo
pracovním sezení. Porušení L1 se sledují, ale neblokují postup.

**L2 – porušení kvality** představuje funkční selhání kvality odhalená automatizovanými nástroji.
Varování při kompilaci (pod `--warnings-as-errors`), striktní porušení
[Credo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/credo/), typové chyby
[Dialyzeru](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/), neprošlé
jednotkové testy a regrese pokrytí spouštějí L2. Reakcí je tvrdá blokace: commit, sloučení nebo
nasazení se odmítne, dokud se porušení neopraví. Porušení L2 vyžaduje, aby vývojář nebo agent
problém opravil a znovu ho odeslal celou pipeline bran kvality.

**L3 – neúplná dodávka** představuje výsledek práce, který nesplňuje standard úplnosti NM/ND.
Stuby, zástupné funkce vracející natvrdo zadané hodnoty, komentáře TODO nebo FIXME ponechané
v produkčním kódu, mock implementace tam, kde je potřeba skutečná, a chybějící [regresní
testy](@/glossary/regression-test.md) u oprav chyb spouštějí L3. Reakcí je odmítnutí s restartem:
celá dodávka se odmítne a práce se musí udělat znovu od začátku, ne postupně záplatovat. Tím se
zajistí, že na neúplné práci se nikdy nestaví.

**L4 – kompromitováno pochybností** představuje nejzávažnější kategorii: porušení, která
podkopávají integritu samotného systému vynucení. Použití `git commit --no-verify` k obejití
pre-commit hooků, `git push --no-verify`, falšování výsledků testů, vypínání bran kvality nebo
jakýkoli pokus obejít pipeline vynucení spouští L4. Reakcí je odmítnutí a Supreme Review agenty
autority L5. Porušení L4 ukazují na systémovou hrozbu integritě platformy a vyžadují šetření
[Archer Supreme](@/glossary/archer-supreme.md) nebo [Supreme
Commandera](@/glossary/supreme-commander.md).

### Mechanismy detekce porušení

Protokol porušení se opírá o několik vrstev detekce působících v různých fázích životního cyklu
vývoje:

```
Developer Action
    |
    v
[Pre-Commit Hook] -----> L1/L2 Detection (compile, credo, format)
    |
    v
[Commit-Msg Hook] -----> L1 Detection (conventional commits format)
    |
    v
[Pre-Push Hook] -------> L2/L3 Detection (tests, coverage, quality gates)
    |
    v
[CI Pipeline] ----------> L2/L3/L4 Detection (full quality suite)
    |
    v
[Agent Review] ----------> L1-L4 Detection (semantic analysis)
    |
    v
[Supreme Review] --------> L4 Investigation (integrity analysis)
```

### Algoritmus klasifikace porušení

Klasifikační algoritmus používá porovnávání se vzorem k deterministickému přiřazení úrovně porušení
podle jeho typu. Algoritmus je navržen jako úplný – pokrývá každou známou kategorii porušení bez
nejednoznačnosti:

```elixir
defmodule PrismaticSafety.ViolationClassifier do
  @moduledoc """
  Classifies detected issues into violation levels using deterministic
  pattern matching. Ensures every violation type maps to exactly one level.
  """

  @type violation_type ::
    :style_deviation | :naming_inconsistency | :missing_doc |
    :compilation_warning | :test_failure | :credo_violation |
    :dialyzer_error | :coverage_regression |
    :stub_implementation | :missing_regression_test |
    :todo_in_production | :placeholder_code | :mock_in_production |
    :hook_bypass | :no_verify_flag | :falsified_results |
    :quality_gate_disabled

  @l1_types [:style_deviation, :naming_inconsistency, :missing_doc]
  @l2_types [:compilation_warning, :test_failure, :credo_violation,
             :dialyzer_error, :coverage_regression]
  @l3_types [:stub_implementation, :missing_regression_test,
             :todo_in_production, :placeholder_code, :mock_in_production]
  @l4_types [:hook_bypass, :no_verify_flag, :falsified_results,
             :quality_gate_disabled]

  @spec classify(violation_type()) :: {:ok, :l1 | :l2 | :l3 | :l4}
  def classify(type) when type in @l1_types, do: {:ok, :l1}
  def classify(type) when type in @l2_types, do: {:ok, :l2}
  def classify(type) when type in @l3_types, do: {:ok, :l3}
  def classify(type) when type in @l4_types, do: {:ok, :l4}
end
```

## Architektura a implementace

### Stavový automat porušení

Protokol porušení implementuje formální stavový automat, v němž každé porušení prochází
definovanými stavy:

```elixir
defmodule PrismaticSafety.ViolationProtocol do
  @moduledoc """
  Implements the L1-L4 violation escalation protocol for NM/ND doctrine enforcement.
  Each violation follows a deterministic state machine from detection through resolution.
  """

  @type level :: :l1 | :l2 | :l3 | :l4
  @type state :: :detected | :blocked | :rejected | :under_review | :resolved | :escalated

  @type violation :: %{
    id: String.t(),
    level: level(),
    state: state(),
    source: String.t(),
    description: String.t(),
    detected_at: DateTime.t(),
    detected_by: atom(),
    resolution: map() | nil
  }

  @spec classify(map()) :: {:ok, level()} | {:error, :unclassifiable}
  def classify(%{type: :style_deviation}), do: {:ok, :l1}
  def classify(%{type: :compilation_warning}), do: {:ok, :l2}
  def classify(%{type: :test_failure}), do: {:ok, :l2}
  def classify(%{type: :credo_violation}), do: {:ok, :l2}
  def classify(%{type: :stub_implementation}), do: {:ok, :l3}
  def classify(%{type: :missing_regression_test}), do: {:ok, :l3}
  def classify(%{type: :todo_in_production}), do: {:ok, :l3}
  def classify(%{type: :hook_bypass}), do: {:ok, :l4}
  def classify(%{type: :no_verify_flag}), do: {:ok, :l4}
  def classify(%{type: :falsified_results}), do: {:ok, :l4}
  def classify(_), do: {:error, :unclassifiable}

  @spec enforce(violation()) :: {:ok, state()} | {:error, term()}
  def enforce(%{level: :l1} = violation) do
    violation
    |> log_warning()
    |> request_correction()
    |> transition(:detected, :resolved)
  end

  def enforce(%{level: :l2} = violation) do
    violation
    |> block_progress()
    |> require_correction()
    |> transition(:detected, :blocked)
  end

  def enforce(%{level: :l3} = violation) do
    violation
    |> reject_deliverable()
    |> require_restart()
    |> transition(:detected, :rejected)
  end

  def enforce(%{level: :l4} = violation) do
    violation
    |> reject_deliverable()
    |> escalate_to_supreme()
    |> transition(:detected, :under_review)
  end
end
```

### Napojení na pipeline vynucení

Protokol porušení je napojen na vícefázovou pipeline vynucení platformy. Každý bod vynucení
odpovídá za odhalení konkrétních kategorií porušení a jejich přiměřenou eskalaci:

```elixir
defmodule PrismaticSafety.EnforcementPipeline do
  @moduledoc """
  Multi-stage enforcement pipeline integrating violation detection
  across pre-commit, CI, and agent review stages.
  """

  @spec run_pre_commit_checks(list(String.t())) :: :pass | {:violations, list(violation())}
  def run_pre_commit_checks(staged_files) do
    violations =
      staged_files
      |> Enum.flat_map(fn file ->
        []
        |> check_compilation_warnings(file)
        |> check_credo_strict(file)
        |> check_formatting(file)
        |> check_no_todos(file)
        |> check_no_stubs(file)
      end)
      |> Enum.map(&ViolationProtocol.classify/1)
      |> Enum.filter(&match?({:ok, _}, &1))

    case violations do
      [] -> :pass
      found -> {:violations, found}
    end
  end

  @spec check_bypass_attempt(map()) :: :clean | {:l4_violation, violation()}
  def check_bypass_attempt(%{flags: flags}) do
    if "--no-verify" in flags or "--no-gpg-sign" in flags do
      {:l4_violation, %{
        type: :hook_bypass,
        description: "Attempted to bypass enforcement hooks",
        severity: :critical
      }}
    else
      :clean
    end
  end
end
```

### Auditní stopa

Každé porušení vytváří neměnný auditní záznam. Auditní stopa zachycuje celý životní cyklus
porušení od detekce po vyřešení a zajišťuje dohledatelnost pro soulad i analýzu po incidentu:

| Pole | Popis | Příklad |
|-------|-------------|---------|
| `violation_id` | jedinečný identifikátor | `VP-2026-00847` |
| `level` | úroveň eskalace | `:l2` |
| `detected_at` | časové razítko UTC | `2026-02-15T10:32:18Z` |
| `detected_by` | mechanismus detekce | `:pre_commit_hook` |
| `source_file` | soubor, který porušení vyvolal | `apps/prismatic_web/lib/router.ex` |
| `description` | popis srozumitelný člověku | `Unused variable warning on line 47` |
| `resolution` | jak bylo vyřešeno | `Variable removed in commit abc123` |
| `resolved_at` | razítko vyřešení | `2026-02-15T10:35:42Z` |

## Postupy řešení porušení

Každá úroveň porušení má odlišný postup řešení, kodifikovaný v procesní dokumentaci platformy
a vynucovaný stavovým automatem.

### Řešení L1

Porušení L1 se řeší okamžitou opravou. Vývojář dostane varování s označením problému a jeho
umístění. Oprava se očekává v témže pracovním sezení. Porušení L1 se sledují kvůli odhalování
vzorců, ale aktuální commit neblokují. Opakuje-li se porušení L1 v témže souboru více než třikrát,
systém ho automaticky eskaluje na L2, protože odráží přetrvávající problém disciplíny kvality.

### Řešení L2

Porušení L2 blokují aktuální krok (commit, sloučení nebo nasazení). Vývojář musí konkrétní problém
opravit, lokálně ověřit, že oprava projde všemi kontrolami kvality, a znovu ji odeslat. Oprava se
znovu ověří celou pipeline bran kvality. Možnost „protlačit se přes L2“ neexistuje – blokace platí
absolutně, dokud není podkladový problém vyřešen.

### Řešení L3

Porušení L3 vyžadují úplný restart dodávky. Klíčový rozdíl oproti L2 je v tom, že L3 ukazuje na
zásadní neúplnost, ne na ojedinělé chyby. Postupné záplatování neúplné implementace obvykle vede
k roztříštěnému, špatně integrovanému kódu. Požadavek restartu vynucuje nový přístup, který často
vede k čistšímu návrhu. Odmítnutá dodávka se pro informaci uchová v auditní stopě, ale nepoužije se
jako výchozí bod.

### Řešení L4

Porušení L4 spouštějí nejrozsáhlejší postup. Dodávka se odmítne a zahájí se Supreme Review. Agent
autority L5 (obvykle Archer Supreme) porušení prošetří a určí, zda bylo náhodné (chyba vývojáře),
nebo záměrné (obcházení procesu). Šetření zkoumá historii gitu, konkrétní použité přepínače
a kontext porušení. Vyřešení vyžaduje opravit okamžitý problém i kořenovou příčinu, která
k porušení integrity vedla.

## Užití v Prismatic Platform

Protokol porušení je hluboce zapojen do každé stránky vývojového postupu Prismatic Platform.
Působí nepřetržitě napříč všemi aplikacemi umbrelly (v době zápisu 115) a celou kódovou základnou.

### Vynucení v pre-commit hooku

Skript `.githooks/pre-commit` implementuje vícefázovou kontrolu kvality. Každá fáze odpovídá
konkrétním úrovním porušení:

- **fáze 1**: kontrola formátování (porušení L1);
- **fáze 2**: kompilace s `--warnings-as-errors` (porušení L2);
- **fáze 3**: striktní analýza Credo (porušení L2);
- **fáze 4**: spuštění testů pro změněné soubory (porušení L2);
- **fáze 5**: detekce stubů a zástupných kódů (porušení L3);
- **fáze 8**: validace šablon (porušení L2);
- **fáze 10**: konzistence designu (porušení L1).

### Napojení na brány kvality

Úloha `mix quality.gates` řídí celou sadu detekce porušení. Spouští všechny kontroly za sebou
a vytváří souhrnnou zprávu o porušeních. Každé porušení L2 a vyšší způsobí selhání brány
s nenulovým návratovým kódem, které zablokuje pipeline sloučení.

### Vynucení agenty

Agenti AIAD průběžně sledují změny kódu a klasifikují porušení v reálném čase. Agent [Quality
Floor Guardian](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/)
udržuje výchozí skóre kvality a spouští porušení, když skóre klesne pod stanovené prahy. Porušení
zjištěná agenty sledují stejnou eskalační cestu L1–L4 jako porušení zjištěná automatizovanými
nástroji.

## Příklady kódu

### Zpracování reakcí na porušení

```elixir
defmodule PrismaticSafety.ViolationHandler do
  @moduledoc """
  Handles violation responses according to escalation level.
  Emits telemetry events and routes to appropriate resolution workflow.
  """

  alias PrismaticSafety.ViolationProtocol

  @spec handle(ViolationProtocol.violation()) :: :ok | {:error, term()}
  def handle(%{level: :l1} = v) do
    Logger.warning("L1 Violation: #{v.description}")
    Telemetry.emit([:violation, :l1], %{file: v.source})
    :ok
  end

  def handle(%{level: :l2} = v) do
    Logger.error("L2 Violation - BLOCKED: #{v.description}")
    Telemetry.emit([:violation, :l2], %{file: v.source})
    {:error, {:blocked, v}}
  end

  def handle(%{level: :l3} = v) do
    Logger.error("L3 Violation - REJECTED: #{v.description}")
    Telemetry.emit([:violation, :l3], %{file: v.source})
    AuditLog.record(:rejection, v)
    {:error, {:rejected, v}}
  end

  def handle(%{level: :l4} = v) do
    Logger.critical("L4 Violation - SUPREME REVIEW: #{v.description}")
    Telemetry.emit([:violation, :l4], %{file: v.source})
    AuditLog.record(:supreme_review, v)
    SupremeReview.request(v)
    {:error, {:supreme_review, v}}
  end
end
```

### Sběr metrik porušení

```elixir
defmodule PrismaticSafety.ViolationMetrics do
  @moduledoc """
  Collects and reports violation metrics for platform health monitoring.
  Tracks trends, repeat offenders, and escalation rates across time windows.
  """

  @spec summary(Date.Range.t()) :: map()
  def summary(date_range) do
    violations = AuditLog.query(date_range)

    %{
      total: length(violations),
      by_level: Enum.frequencies_by(violations, & &1.level),
      mean_resolution_time: calculate_mean_resolution(violations),
      repeat_offenders: find_repeat_sources(violations),
      escalation_rate: calculate_escalation_rate(violations)
    }
  end

  @spec trend_analysis(non_neg_integer()) :: list(map())
  def trend_analysis(weeks_back \\ 12) do
    Enum.map(1..weeks_back, fn week_offset ->
      end_date = Date.utc_today() |> Date.add(-7 * (week_offset - 1))
      start_date = Date.add(end_date, -7)
      range = Date.range(start_date, end_date)

      %{
        week: week_offset,
        range: range,
        summary: summary(range)
      }
    end)
  end
end
```

### Telemetrický přehled porušení

```elixir
defmodule PrismaticSafety.ViolationDashboard do
  @moduledoc """
  LiveView dashboard component for real-time violation monitoring.
  Displays current violation state across all enforcement layers.
  """

  @spec current_state() :: map()
  def current_state do
    %{
      active_violations: count_active_violations(),
      by_level: %{
        l1: count_by_level(:l1),
        l2: count_by_level(:l2),
        l3: count_by_level(:l3),
        l4: count_by_level(:l4)
      },
      enforcement_layers: %{
        pre_commit: layer_status(:pre_commit),
        ci_pipeline: layer_status(:ci_pipeline),
        agent_review: layer_status(:agent_review),
        supreme_review: layer_status(:supreme_review)
      },
      last_violation: last_violation_timestamp(),
      streak_days: violation_free_streak()
    }
  end
end
```

## Srovnání s přístupy v odvětví

Přístup protokolu porušení jako formálního stavového automatu se ostře liší od toho, jak vynucení
kvality řeší většina softwarových organizací:

| Přístup | Model vynucení | Eskalace | Auditovatelnost | Odolnost vůči obcházení |
|----------|------------------|------------|--------------|-------------------|
| **Protokol porušení (Prismatic)** | formální stavový automat | deterministická L1–L4 | úplná auditní stopa | L4 spouští Supreme Review |
| **Komentáře v code review** | společenská konvence | nahodilá, závislá na recenzentovi | jen historie komentářů | snadno odbyté |
| **Selhání CI pipeline** | binární prošlo/neprošlo | žádná – všechna selhání stejná | logy sestavení | opakování/nové spuštění |
| **Tikety v Jiře** | ruční sledování | štítky priority (P1–P4) | historie tiketu | lze odkládat neomezeně |
| **Brány kvality Sonar** | podle prahů | úrovně závažnosti | metriky v přehledu | nastavitelné výjimky |
| **Povinné kontroly GitHubu** | stav kontroly prošlo/neprošlo | žádná | logy běhů kontrol | obchvat pro administrátora |

Klíčový rozdíl je v tom, že protokol porušení spojuje deterministickou klasifikaci, přiměřenou
reakci, auditní dohledatelnost a odolnost vůči obcházení do jediného integrovaného rámce. Většina
přístupů v odvětví implementuje jen jednu nebo dvě z těchto vlastností.

## Osvědčené postupy

1. **Opravovat porušení okamžitě**: porušení L2 nikdy neodkládat na pozdější commit. Pipeline
   vynucení blokuje postup právě proto, aby se nehromadil [dluh kvality](@/glossary/quality-debt.md).
2. **Brát varování L1 vážně**: porušení L1 sice neblokují, ale jejich vzorec naznačuje
   upadající disciplínu kódu, která nakonec vyvolá porušení L2 a vyšší.
3. **Nikdy se nepokoušet o obchvat**: porušení L4 mají nejzávažnější důsledky. Použití
   `--no-verify` čas neušetří; spustí Supreme Review, které stojí výrazně víc času a podkopává
   důvěru.
4. **Psát regresní testy preventivně**: povinný protokol [regresních
   testů](@/glossary/regression-test.md) existuje, aby bránil opakovaným porušením. Každá oprava
   chyby musí obsahovat test, který by původní problém zachytil.
5. **Rozumět klasifikaci**: před řešením porušení pochopit, proč bylo zařazeno právě na danou
   úroveň. Odmítnutí L3 znamená, že dodávka potřebuje zásadní přepracování, ne postupné záplaty.
6. **Sledovat trendy porušení**: ke sledování vzorců používat `ViolationMetrics.summary/1`.
   Rostoucí počet L2 v konkrétní aplikaci signalizuje systémové problémy, které vyžadují
   architektonickou pozornost.
7. **Používat auditní stopu k učení**: auditní stopa porušení není jen artefakt souladu, ale zdroj
   poučení. Analýza historických porušení odhaluje opakující se vzorce, které lze řešit zlepšením
   nástrojů, dokumentace nebo architektury.

## Časté chyby

- **Postupně záplatovat porušení L3**: L3 (neúplná dodávka) vyžaduje restart, ne záplaty. Vývojáři,
  kteří se snaží doplnit chybějící části do odmítnuté dodávky bez restartu, často vytvoří
  roztříštěný, špatně integrovaný kód.
- **Přehlížet hromadění L1**: porušení L1 jsou jednotlivě neškodná, ale společně ukazují na
  upadající disciplínu kvality. Týmy, které trvalá porušení L1 tolerují, nakonec zažijí nárůst
  L2 a L3.
- **Zaměňovat úroveň porušení s potřebným úsilím**: porušení L2 (varování při kompilaci) může zabrat
  30 sekund. Porušení L1 (nejednotné pojmenování) může vyžadovat přejmenování v 50 souborech.
  Úroveň vyjadřuje závažnost pro integritu platformy, ne úsilí potřebné k nápravě.
- **Předpokládat, že CI zachytí všechno**: [pre-commit
  hooky](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/) jsou
  první obrannou linií. Spoléhat se při detekci porušení jen na CI zavádí zpoždění mezi porušením
  a zpětnou vazbou a snižuje produktivitu vývojářů.
- **Chápat protokol jako trestající**: protokol porušení je mechanismus zajištění kvality, ne systém
  trestů. Existuje, aby udržoval stav platformy [bez varování](@/glossary/zero-warning-policy.md)
  a bez dluhu v celé kódové základně.
- **Nerozlišovat kořenovou příčinu od příznaku**: varování při kompilaci (L2) může být příznakem
  hlubšího architektonického problému. Oprava varování bez prošetření kořenové příčiny vede
  k opakovaným porušením v téže oblasti.

## Napojení na disciplínu sezení

Protokol porušení spolupracuje s protokolem [Session Discipline](@/glossary/session-discipline.md),
aby se porušení řešila v sezení, v němž vznikla. Disciplína sezení vyžaduje průběžné commity,
okamžité pushe a lokální ověření testů před každým commitem. Když se během sezení zjistí porušení,
protokol disciplíny sezení vývojáři nedovolí opravu odložit na pozdější sezení.

Napojení vytváří uzavřenou zpětnou smyčku: porušení se odhalí okamžitě (pre-commit hooky), opraví
okamžitě (disciplína sezení) a ověří okamžitě (nové spuštění bran kvality). Smyčka odstraňuje mezeru
mezi detekcí porušení a jeho vyřešením, která sužuje většinu vývojových postupů.

## Související

**Pojmy platformy v tomto glosáři**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – řídicí rámec, který protokol vynucuje.
- [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md) – obě ramena doktríny.
- [Archer Supreme](@/glossary/archer-supreme.md) – agent L5, který provádí Supreme Review u L4.
- [Regression Test](@/glossary/regression-test.md) – povinný test proti opakovaným porušením.
- [Quality Debt](@/glossary/quality-debt.md) – nahromaděná porušení sledovaná jako QDP.
- [Clean Run](@/glossary/clean-run.md) – stav kompilace a testů, který vynucení vyžaduje.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – politika, která z varování dělá L2.
- [Session Discipline](@/glossary/session-discipline.md) – řešení porušení v témže sezení.

**Hesla a přehledy platformy mimo tuto knihu**

- [NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [NO DOUBTS](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/),
  [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
  [Credo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/credo/),
  [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/),
  [Schopnosti](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/).

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co kniha
  z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: violation-protocol](@/kompendium/glossary-bridges/bridge-violation-protocol.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
