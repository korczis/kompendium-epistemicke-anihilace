+++
title = "Purple Team (fialový tým)"
weight = 21
description = "Ústřední syntetický uzel barevných týmů Prismatic Platform s výhradní pravomocí uzavírat smyčku Red–Blue a bezpečnostní nálezy."

[taxonomies]
tags = ["glossary", "prismatic", "color-teams", "security", "agents"]

[extra]
category = "security"
related_terms = ["color-teams", "red-team", "blue-team", "trinity-gate", "regression-test", "white-team", "black-team", "gray-team"]
platform_relevance = "critical"
complexity = "advanced"
domain = "security-operations"
layer = "synthesis"
paradigm = "adversarial-defensive-synthesis"
agent_count = 4
agent_classifications = ["L3", "L4"]
closure_conditions = 4
prismatic_usage = "security-finding-lifecycle-management"
quality_impact = "high"
safety_level = "safety-critical"
documentation_required = true
testing_strategy = "closure-state-machine-verification"
commander = "purple-coordinator"
signal_flow = "red-findings -> purple-synthesis -> blue-defense"
anti_metric_enforcement = true
related_apps = ["prismatic_dark", "prismatic_agents", "prismatic_safety"]
closure_model = "4-condition-mandatory"
see_also = ["color-teams", "red-team", "blue-team", "white-team", "trinity-gate", "regression-test"]
author = "Tomas Korcak (korczis)"
reading_time = "10 min"
word_count = 2000
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Purple", "Team", "Central", "Red-Blue", "glossary", "security", "Prismatic Platform", "Purple Team", "Red Team", "Blue Team"]
quality_score = 90
image = "/images/sections/glossary.png"
image_alt = "Purple Team (fialový tým) – glosář"
+++

## Definice a přehled

Purple Team (fialový tým) je specializovaná jednotka bezpečnostního provozu, která slouží jako
ústřední syntetický uzel mezi útočným (Red) a obranným (Blue) bezpečnostním týmem. Na rozdíl
od tradičních modelů, v nichž Red a Blue Team pracují nezávisle, zajišťuje Purple Team
nepřetržité zpětné vazby, mapuje útočná zjištění na obranné schopnosti a má výhradní
pravomoc k přechodům do stavu uzavření. Tím brání předčasnému odbytí bezpečnostních nálezů
a zajišťuje, že každá zjištěná zranitelnost byla skutečně vyřešena, ne jen vzata na vědomí.

V širším odvětví kybernetické bezpečnosti vznikl purple teaming z poznání, že Red a Blue
Team pracující izolovaně často nepředávají poznatky účinně. Zjištění se ztrácejí, obrana
zůstává netestovaná proti známým útokům a organizace si vytvářejí slepá místa. Model
Purple Teamu to řeší vyhrazenou syntetickou funkcí, která propojuje útočnou a obrannou
perspektivu, aby každý scénář útoku odpovídal ověřené obraně a každá obrana byla ověřena
proti realistickým hrozbám.

Prismatic Platform posouvá koncept Purple Teamu od workshopů řízených lidmi k trvalé,
autonomní syntetické vrstvě řízené agenty. Purple Team v Prismatic tvoří čtyři
specializovaní agenti na úrovních klasifikace L3–L4, kteří nepřetržitě sledují smyčku
Red–Blue a vynucují přísné podmínky uzavření, jež brání falešnému vyřešení bezpečnostních
nálezů. Tým pracuje pod doktrínou [NO
MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/) (viz [NO
MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md)) a uplatňuje nulovou toleranci při
uzavírání nálezů a prevenci regresí.

Pro Kompendium je Purple Team pojmem z kontextu platformy. Kniha z něj přebírá myšlenku, že
„uzavřít“ problém smí jen ten, kdo ověřil skutečnou nápravu, nikoli ten, komu uzavření
přináší úlevu – v oblasti EA to platí pro intervence i pro hodnocení zotavení (viz [Purple
Team a detekce EA](@/kompendium/aiad-integration/purple-team-ea-synthesis.md)).

## Historický kontext a vývoj v odvětví

Koncept purple teamingu vychází z omezení pozorovaných u tradičních cvičení Red Team / Blue
Team. Organizace kybernetické bezpečnosti po desetiletí pořádaly periodická cvičení, v nichž
se útoční specialisté snažili prolomit obranu a Blue Team pak analyzoval, co přehlédl a jak
se zlepšit. Zásadním problémem tohoto sekvenčního modelu je mezera v předávání znalostí:
Red Team píše zprávy, Blue Team je čte a převod od „útok uspěl“ k „obrana se zlepšila“ často
ztratí podstatné nuance.

Termín „Purple Team“ se v komunitě kybernetické bezpečnosti prosadil zhruba v polovině
10. let 21. století, zpočátku pro společná cvičení, při nichž členové Red a Blue Teamu
pracují bok po boku. Organizace jako SANS Institute metodiky purple teamingu formalizovaly
a zdůraznily zpětnou vazbu v reálném čase mezi provedením útoku a ověřením obrany. Většina
implementací v odvětví však chápe purple teaming jako periodickou činnost – plánované
workshopy nebo čtvrtletní cvičení –, ne jako nepřetržitou provozní funkci.

Inovací Prismatic Platform je učinit z Purple Teamu trvalou, autonomní vrstvu agentů místo
periodické lidské činnosti. V návaznosti na rámec [AIAD](@/glossary/aiad.md) pracují agenti
Purple Teamu nepřetržitě: zpracovávají zjištění Red Teamu, jakmile přijdou, udržují živá
obousměrná mapování mezi útoky a obranami a vynucují podmínky uzavření, které brání
organizační setrvačnosti, kvůli níž se zjištění obvykle založí a zapomenou.

Přístup ovlivnily zkušenosti z bezpečnosti letectví, kde se „uzavírání smyčky“ u
bezpečnostních zjištění přísně vynucuje regulatorními rámci, jako jsou systémy řízení
bezpečnosti (SMS, *Safety Management Systems*). V letectví nelze bezpečnostní zjištění
uzavřít, dokud není nápravné opatření zavedeno, ověřeno a prokazatelně nebrání opakování.
Purple Team v Prismatic uplatňuje stejnou přísnost na kybernetická zjištění prostřednictvím
modelu uzavření se čtyřmi podmínkami.

## Technický rozbor

### Složení agentů Purple Teamu

Purple Team pracuje se čtyřmi agenty, z nichž každý plní odlišnou syntetickou funkci.

| Agent | Klasifikace | Role | Hlavní funkce |
|-------|---------------|------|-----------------|
| `purple-coordinator` | L3 Strategic Commander | syntetický uzel | řídí všechny operace Purple, spravuje pravomoc uzavírat, vynucuje antimetriky |
| `purple-mapper` | L4 Operational Specialist | obousměrné mapování | mapuje zjištění Red na obrany Blue a naopak, odhaluje mezery v pokrytí |
| `purple-closure-analyst` | L4 Operational Specialist | hodnocení uzavření | posuzuje čtyři podmínky uzavření, odhaluje vzorce falešného uzavření |
| `purple-regression-guard` | L4 Safety-Critical | prevence regresí | hlídá pasti regresí napříč nasazeními, vynucuje brány nasazení |

Agent `purple-coordinator` má klasifikaci L3 ([Strategic Command](@/glossary/strategic-command.md)),
která mu dává pravomoc řídit operace napříč Purple Teamem a jednat přímo s koordinátory Red
a Blue Teamu. `purple-regression-guard` nese označení „Safety-Critical“: jeho rozhodnutí
o bránách nasazení nelze přebít běžnou provozní pravomocí – blokaci strážce regresí může
obejít jen zásah úrovně Supreme ([Supreme Commander](@/glossary/supreme-commander.md)).

### Model uzavření se čtyřmi podmínkami

Žádné bezpečnostní zjištění nelze uzavřít bez současného splnění všech čtyř podmínek. Model
brání běžnému problému odvětví – předčasnému uzavření, kdy organizace označí zranitelnost za
„vyřešenou“ bez přiměřeného ověření.

1. **Potvrzení Red**: [Red Team](@/glossary/red-team.md) potvrdí, že navržená obrana
   neutralizovala původní vektor útoku. Nejde o teoretické posouzení, ale o nové provedení
   scénáře útoku proti opravenému systému. Dosáhne-li Red Team cíle útoku původním vektorem,
   zjištění zůstává otevřené bez ohledu na hodnocení Blue Teamu.
2. **Ověření Blue**: [Blue Team](@/glossary/blue-team.md) ověří, že obranné opatření je
   v provozu, je monitorováno a produkuje očekávané telemetrické signály. Obrana, která
   existuje, ale není aktivně sledována, dává falešnou jistotu. Ověření Blue vyžaduje doklad,
   že obranná telemetrie proudí, pravidla výstrah jsou nastavena a obrana by při zjištění
   útoku spustila upozornění.
3. **Důkaz White**: [White Team](@/glossary/white-team.md) dodá formální nebo poloformální
   ověření, že oprava řeší kořenovou příčinu, ne jen příznak. Tím se brání povrchním
   záplatám, které nechávají podkladové zranitelnosti zneužitelné variantními technikami.
   Důkaz White může podle kritičnosti zjištění zahrnovat testování založené na vlastnostech,
   validaci kontraktů nebo formální důkazy v Lean4.
4. **Regresní zámek**: Purple Regression Guard potvrdí, že existují automatizované regresní
   testy, které odhalí jakékoli budoucí opakování. Bez této podmínky se dříve opravené
   zranitelnosti mohou tiše vrátit při refaktoringu nebo aktualizaci závislostí. [Regresní
   test](@/glossary/regression-test.md) musí bez opravy selhat a s opravou projít, čímž
   dokládá platnost testu i účinnost opravy.

### Architektura toku signálů

Purple Team stojí na průsečíku všech toků signálů [barevných týmů](@/glossary/color-teams.md).

```
Gray (boundary seeds) --> Red (adversarial scenarios) --> Purple (synthesis) --> Blue (defense)
                                    ^                          |       ^           |
                                    |                          v       |           v
                               Black (threat models)     White (proofs)    Platform Defense
```

Purple přijímá vstupy ze zjištění Red Teamu, z hodnocení obranného postavení Blue Teamu,
z ověřovacích důkazů White Teamu a ze zpráv [Gray Teamu](@/glossary/gray-team.md) o průzkumu
hranic. Vytváří rozhodnutí o uzavření, požadavky na regresní testy a akce vynucení bran
nasazení.

Tok signálů je navržen jako jednosměrný se zpětnými smyčkami. Zjištění Red Teamu proudí do
Purple k syntéze. Purple vytváří požadavky na obranu, které proudí k Blue. Doklady Blue
o implementaci proudí zpět do Purple k ověření. Důkazy White Teamu proudí do Purple a plní
podmínku formálního ověření. Tento kruhový tok zajišťuje, že žádné zjištění se v systému
„neztratí“ – každé má výslovný stav ve stavovém automatu uzavření a každý přechod stavu
vyžaduje doklad.

## Architektura a implementace

### Stavový automat uzavření

Purple Team spravuje pro každé bezpečnostní zjištění formální stavový automat. Přechody stavů
jsou přísně uspořádané a každý vyžaduje doklad.

```elixir
defmodule PrismaticDark.Purple.ClosureStateMachine do
  @moduledoc """
  Manages the lifecycle of security finding closure.
  Findings progress through states with strict transition rules.
  No state can be skipped, and each transition requires evidence
  from the corresponding color team.
  """

  @type finding_state ::
    :open
    | :red_confirmed
    | :blue_verified
    | :white_proven
    | :regression_locked
    | :closed

  @type closure_conditions :: %{
    red_confirmation: boolean(),
    blue_verification: boolean(),
    white_proof: boolean(),
    regression_lock: boolean()
  }

  @type transition_evidence :: %{
    team: atom(),
    agent_id: String.t(),
    evidence_type: String.t(),
    evidence_data: map(),
    timestamp: DateTime.t()
  }

  @spec evaluate_closure(closure_conditions()) :: {:ok, :closed} | {:error, [atom()]}
  def evaluate_closure(conditions) do
    missing =
      conditions
      |> Enum.filter(fn {_key, value} -> value == false end)
      |> Enum.map(fn {key, _value} -> key end)

    case missing do
      [] -> {:ok, :closed}
      failed -> {:error, failed}
    end
  end

  @spec transition(finding_state(), atom(), transition_evidence()) ::
    {:ok, finding_state()} | {:error, :invalid_transition | :insufficient_evidence}
  def transition(:open, :red_confirms, evidence) when evidence.team == :red do
    {:ok, :red_confirmed}
  end
  def transition(:red_confirmed, :blue_verifies, evidence) when evidence.team == :blue do
    {:ok, :blue_verified}
  end
  def transition(:blue_verified, :white_proves, evidence) when evidence.team == :white do
    {:ok, :white_proven}
  end
  def transition(:white_proven, :regression_locks, evidence) when evidence.team == :purple do
    {:ok, :regression_locked}
  end
  def transition(:regression_locked, :close, _evidence) do
    {:ok, :closed}
  end
  def transition(_state, _event, _evidence) do
    {:error, :invalid_transition}
  end
end
```

### Engine obousměrného mapování

Agent `purple-mapper` udržuje obousměrnou grafovou strukturu, která mapuje každé zjištění Red
Teamu na odpovídající obranu Blue Teamu a naopak. Mapování odhaluje mezery v pokrytí:
zjištění bez obran a obrany bez modelů hrozeb.

```elixir
defmodule PrismaticDark.Purple.BidirectionalMapper do
  @moduledoc """
  Maps Red Team findings to Blue Team defenses bidirectionally.
  Identifies coverage gaps where findings lack defenses or
  defenses lack threat models. Maintains a live graph of the
  attack-defense relationship space.
  """

  use GenServer

  @type mapping :: %{
    finding_id: String.t(),
    defense_ids: [String.t()],
    coverage_score: float(),
    gap_analysis: [String.t()]
  }

  @type coverage_report :: %{
    total_findings: non_neg_integer(),
    mapped_findings: non_neg_integer(),
    unmapped_findings: [String.t()],
    total_defenses: non_neg_integer(),
    validated_defenses: non_neg_integer(),
    unmapped_defenses: [String.t()],
    coverage_percentage: float()
  }

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    state = %{
      finding_to_defense: %{},
      defense_to_finding: %{},
      unmapped_findings: MapSet.new(),
      unmapped_defenses: MapSet.new()
    }
    {:ok, state}
  end

  @spec map_finding_to_defense(String.t(), String.t()) :: :ok
  def map_finding_to_defense(finding_id, defense_id) do
    GenServer.call(__MODULE__, {:map, finding_id, defense_id})
  end

  @spec coverage_gaps() :: coverage_report()
  def coverage_gaps do
    GenServer.call(__MODULE__, :coverage_gaps)
  end

  @spec coverage_score() :: float()
  def coverage_score do
    GenServer.call(__MODULE__, :coverage_score)
  end

  @impl true
  def handle_call({:map, finding_id, defense_id}, _from, state) do
    new_f2d = Map.update(state.finding_to_defense, finding_id, [defense_id], &[defense_id | &1])
    new_d2f = Map.update(state.defense_to_finding, defense_id, [finding_id], &[finding_id | &1])

    new_state = %{state |
      finding_to_defense: new_f2d,
      defense_to_finding: new_d2f,
      unmapped_findings: MapSet.delete(state.unmapped_findings, finding_id),
      unmapped_defenses: MapSet.delete(state.unmapped_defenses, defense_id)
    }

    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call(:coverage_gaps, _from, state) do
    report = %{
      total_findings: map_size(state.finding_to_defense) + MapSet.size(state.unmapped_findings),
      mapped_findings: map_size(state.finding_to_defense),
      unmapped_findings: MapSet.to_list(state.unmapped_findings),
      total_defenses: map_size(state.defense_to_finding) + MapSet.size(state.unmapped_defenses),
      validated_defenses: map_size(state.defense_to_finding),
      unmapped_defenses: MapSet.to_list(state.unmapped_defenses),
      coverage_percentage: calculate_coverage(state)
    }

    {:reply, report, state}
  end

  defp calculate_coverage(state) do
    total = map_size(state.finding_to_defense) + MapSet.size(state.unmapped_findings)
    if total == 0, do: 100.0, else: map_size(state.finding_to_defense) / total * 100.0
  end
end
```

### Implementace strážce regresí

`purple-regression-guard` pracuje jako bezpečnostně kritický agent, který brání tomu, aby se
dříve uzavřená zjištění nepozorovaně vrátila. Vede registr regresních testů přiřazených ke
každému uzavřenému zjištění a před povolením nasazení ověřuje, že stále procházejí.

```elixir
defmodule PrismaticDark.Purple.RegressionGuard do
  @moduledoc """
  Monitors deployment gates and regression test suites to prevent
  previously-closed security findings from resurfacing. This agent
  carries Safety-Critical classification - its gate decisions cannot
  be overridden by standard operational authority.
  """

  @type regression_check :: %{
    finding_id: String.t(),
    test_file: String.t(),
    test_name: String.t(),
    last_verified: DateTime.t(),
    status: :passing | :failing | :missing
  }

  @spec verify_regression_coverage(String.t()) :: {:ok, regression_check()} | {:error, :no_test}
  def verify_regression_coverage(finding_id) do
    case lookup_regression_test(finding_id) do
      {:ok, test} -> execute_and_report(test)
      :not_found -> {:error, :no_test}
    end
  end

  @spec deployment_gate_check([String.t()]) :: :pass | {:block, [String.t()]}
  def deployment_gate_check(finding_ids) do
    results =
      finding_ids
      |> Task.async_stream(&verify_regression_coverage/1, max_concurrency: 4, timeout: 30_000)
      |> Enum.map(fn
        {:ok, result} -> result
        {:exit, reason} -> {:error, {:timeout, reason}}
      end)

    failed =
      results
      |> Enum.filter(fn
        {:error, _} -> true
        {:ok, %{status: :failing}} -> true
        {:ok, %{status: :missing}} -> true
        _ -> false
      end)

    case failed do
      [] -> :pass
      blocked -> {:block, blocked}
    end
  end

  @spec register_regression_test(String.t(), String.t(), String.t()) :: :ok
  def register_regression_test(finding_id, test_file, test_name) do
    # Store mapping from finding to its regression test
    PrismaticStorage.ETS.put({:regression_test, finding_id}, %{
      test_file: test_file,
      test_name: test_name,
      registered_at: DateTime.utc_now()
    })
    :ok
  end

  defp lookup_regression_test(finding_id) do
    case PrismaticStorage.ETS.get({:regression_test, finding_id}) do
      {:ok, test} -> {:ok, test}
      {:error, :not_found} -> :not_found
    end
  end

  defp execute_and_report(test) do
    case System.cmd("mix", ["test", test.test_file, "--only", "test:#{test.test_name}"],
           stderr_to_stdout: true) do
      {_, 0} -> {:ok, %{test | status: :passing, last_verified: DateTime.utc_now()}}
      {_, _} -> {:ok, %{test | status: :failing, last_verified: DateTime.utc_now()}}
    end
  end
end
```

## Vynucení antimetrik

Charakteristickým rysem Purple Teamu je filosofie vynucení antimetrik. `purple-coordinator`
aktivně odolává pobídkám k uzavírání řízenému metrikami. Mezi běžné antivzorce
bezpečnostního provozu patří uzavírání zjištění kvůli splnění KPI míry uzavření, snižování
závažnosti, aby nedošlo k zablokování nasazení, nebo přijímání částečných oprav kvůli lepším
statistikám. Výhradní pravomoc Purple Teamu nad přechody do uzavření brání tomu, aby tyto
organizační tlaky ohrozily bezpečnostní integritu.

### Odhalované a blokované antivzorce

| Antivzorec | Metoda detekce | Reakce |
|-------------|-----------------|----------|
| **Uzavírání kvůli KPI** | skoky míry uzavření bez úměrné aktivity oprav | blokace + šetření |
| **Snižování závažnosti** | změny závažnosti bez nových důkazů | vyžadovat důkazy pro překlasifikaci |
| **Přijetí částečné opravy** | oprava řeší příznak, ne kořenovou příčinu | ponechat otevřené, sledovat dílčí pokrok |
| **Vypršení časem** | automatické uzavření po časovém prahu | zakázáno – zjištění nikdy nevyprší |
| **Uzavírání kopírováním** | totožné zdůvodnění uzavření u více zjištění | označit k individuálnímu přezkumu |

Filosofie antimetrik vychází z pozorování, že Goodhartův zákon (v často citované formulaci
Marilyn Strathernové: „Když se míra stane cílem, přestane být dobrou mírou“) platí pro
bezpečnostní metriky obzvlášť silně. Jakmile organizace měří „míru uzavření zjištění“,
optimalizuje uzavírání zjištění, ne zlepšování bezpečnosti. Nezávislost Purple Teamu na
termínech dodávek a výkonnostních metrikách zajišťuje, že rozhodnutí o uzavření stojí jen na
důkazech.

Stejný vzorec zná Kompendium z institucí, které „uzavírají“ stížnosti obětí kvůli
statistikám nebo pověsti; obranou je i tam oddělení toho, kdo uzavírá, od toho, komu uzavření
prospívá (viz [Riziko obětování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md)).

## Detekce falešného uzavření

`purple-closure-analyst` cíleně hledá vzorce, které ukazují na falešné uzavření.

- **Opravy na úrovni příznaku**: záplaty, které řeší konkrétní exploit, ale ne podkladovou
  třídu zranitelnosti. Pravidlo WAF blokuje konkrétní payload SQL injection, zatímco problém
  s parametrizací dotazů trvá.
- **Opravy závislé na prostředí**: obrany, které fungují v testování, ale ne v produkčních
  konfiguracích. Bezpečnostní hlavička přidaná do testovací konfigurace, ale ne do
  produkčních nasazovacích skriptů.
- **Částečné pokrytí**: opravy, které uzavřou jeden vektor útoku a příbuzné ponechají
  zneužitelné. Záplata jednoho endpointu, zatímco jiné endpointy mají tutéž zranitelnost.
- **Časem oslabené obrany**: obrany, které byly v době uzavření účinné, ale oslabily kvůli
  změnám infrastruktury, aktualizacím závislostí nebo posunu konfigurace.

```elixir
defmodule PrismaticDark.Purple.FalseClosureDetector do
  @moduledoc """
  Analyzes closure attempts for patterns indicating false resolution.
  Applies heuristics and historical pattern matching to identify
  closures that may not represent genuine security improvement.
  """

  @type analysis_result :: %{
    finding_id: String.t(),
    risk_level: :low | :medium | :high,
    indicators: [String.t()],
    recommendation: :approve | :investigate | :reject
  }

  @spec analyze_closure(String.t(), map()) :: {:ok, analysis_result()} | {:error, term()}
  def analyze_closure(finding_id, closure_evidence) do
    indicators = []

    indicators = if symptom_level_fix?(closure_evidence), do:
      ["Symptom-level fix detected" | indicators], else: indicators

    indicators = if environment_specific?(closure_evidence), do:
      ["Environment-specific fix detected" | indicators], else: indicators

    indicators = if partial_coverage?(closure_evidence), do:
      ["Partial coverage detected" | indicators], else: indicators

    risk_level = case length(indicators) do
      0 -> :low
      1 -> :medium
      _ -> :high
    end

    recommendation = case risk_level do
      :low -> :approve
      :medium -> :investigate
      :high -> :reject
    end

    {:ok, %{
      finding_id: finding_id,
      risk_level: risk_level,
      indicators: indicators,
      recommendation: recommendation
    }}
  end
end
```

## Integrační body

| Systém | Integrace | Účel |
|--------|------------|---------|
| [Red Team](@/glossary/red-team.md) | příjem zjištění | přijímá útočné scénáře k mapování na obrany |
| [Blue Team](@/glossary/blue-team.md) | data obranného postavení | přijímá hodnocení obranných schopností |
| [White Team](@/glossary/white-team.md) | ověřovací důkazy | přijímá formální důkazy pro podmínky uzavření |
| [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/) | blokace nasazení | blokuje nasazení s neuzavřenými kritickými zjištěními |
| registr AIAD | koordinace agentů | spravuje životní cyklus a komunikaci agentů Purple |
| telemetrie | vysílání událostí | vysílá události uzavření pro monitorování celé platformy |
| [Trinity Gate](@/glossary/trinity-gate.md) | sladění ověření | důkazy uzavření procházejí validací Trinity Gate |

## Osvědčené postupy

1. **Nikdy neobcházet model čtyř podmínek.** Každá podmínka existuje proto, že zkušenost
   ukázala, že vynechání kterékoli z nich vede k falešnému uzavření. Podmínky jsou minimální
   životaschopnou sadou ověření.
2. **Průběžně udržovat obousměrné mapování.** Mapování není periodická činnost. Každé nové
   zjištění Red Teamu má být namapováno na obrany během hodin a každá nová obrana Blue Teamu
   ověřena proti známým zjištěním.
3. **Selhání strážce regresí brát jako incident P0.** Selhávající regresní test znamená, že se
   dříve uzavřené zjištění mohlo vrátit. To vyžaduje okamžité šetření bez ohledu na priority
   sprintu.
4. **Odolávat tlaku zúčastněných stran na uzavření.** Hodnota Purple Teamu spočívá právě
   v nezávislosti na termínech dodávek. Slevit ze standardů uzavření kvůli termínům podkopává
   celý model bezpečnostního provozu.
5. **Podrobně dokumentovat zdůvodnění uzavření.** Každé rozhodnutí o uzavření má obsahovat
   řetězec důkazů ze všech čtyř podmínek, aby byly budoucí audity a šetření regresí
   dohledatelné.
6. **Pravidelně revidovat obousměrnou mapu.** Nenamapovaná zjištění jsou vektory útoku bez
   obran. Nenamapované obrany jsou bezpečnostní investice bez ověřených modelů hrozeb. Obojí
   ukazuje na mezery v bezpečnostním postavení.
7. **Nikdy neuzavírat zjištění automaticky podle času.** Na rozdíl od úkolů v řízení projektů
   bezpečnostní zjištění stářím neztrácejí relevanci. Neopravená zranitelnost je po šesti
   měsících stejně nebezpečná jako v den objevení.

## Časté chyby

- **Zaměňovat Purple Team se společnými cvičeními Red–Blue**: tradiční „purple team
  cvičení“ jsou časově ohraničené workshopy. Purple Team v Prismatic je trvalá, autonomní
  syntetická vrstva, která pracuje nepřetržitě.
- **Chápat uzavření binárně**: zjištění existují na škále vyřešení. Částečné opravy mohou
  snížit riziko, aniž by dosáhly úplného uzavření. Purple Team sleduje dílčí nápravu jako
  snížení rizika a zjištění ponechává otevřené.
- **Zanedbávat strážce regresí**: nejčastějším selháním je správné uzavření zjištění
  a následné neudržení regresního pokrytí, jak se kódová základna vyvíjí. Strážce regresí
  tomuto posunu brání.
- **Přílišné spoléhání na automatické uzavření**: model čtyř podmínek se sice vyhodnocuje
  programově, ale samy podmínky vyžadují úsudek na lidské úrovni. Úspěšný automatický test
  neznamená automaticky, že je zjištění skutečně vyřešeno.
- **Organizační odpor**: bezpečnostní týmy zvyklé uzavírat zjištění jednostranně mohou
  pravomoci Purple Teamu vzdorovat. Odpor je očekávatelný a je třeba ho řešit vzděláváním
  o nákladech falešného uzavření.

## Související

**Pojmy platformy v tomto glosáři**

- [Red Team](@/glossary/red-team.md) – útočná simulace, jejíž zjištění Purple syntetizuje.
- [Blue Team](@/glossary/blue-team.md) – obranný tým dodávající data o obranném postavení.
- [White Team](@/glossary/white-team.md) – ověřovací tým, jehož důkazy vstupují do uzavření.
- [Black Team](@/glossary/black-team.md) – teoretické modelování hrozeb pro hodnocení rizik.
- [Gray Team](@/glossary/gray-team.md) – průzkum hranic, který dodává hraniční případy.
- [Color Teams](@/glossary/color-teams.md) – přehled všech šesti barevných týmů.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána doplňující požadavky na uzavření.
- [Regression Test](@/glossary/regression-test.md) – vzor prevence opakování na úrovni kódu.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec standardů důkazů.

**Hesla a přehledy platformy mimo tuto knihu**

- [Audit Trail](https://prismatic-reality-com.github.io/prismatic-promo/glossary/audit-trail/) –
  neměnný záznam rozhodnutí o uzavření a důkazů.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/) – přehledy platformy.

**Kniha**

- [Purple Team a detekce EA](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) –
  syntéza zjištění o epistemických útocích.
- [2.7 Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/vztah-k-decision-engine.md) –
  jak barevné týmy vstupují do knihy.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
