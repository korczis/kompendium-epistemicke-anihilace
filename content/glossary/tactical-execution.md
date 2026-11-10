+++
title = "Tactical Execution (taktická exekuce)"
weight = 16
description = "Úroveň agentů L2 v Prismatic Platform: specialisté pro soustředěné operace v jedné doméně v rámci šesti barevných týmů, s výsledky opřenými o důkazy."

[taxonomies]
tags = ["glossary", "prismatic", "agents", "color-teams", "architecture"]

[extra]
category = "agents"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "19 min"
difficulty = "intermediate"
quality_score = 97
date_created = "2026-02-22"
date_updated = "2026-02-22"
importance = "high"
abbreviation = "L2"
related_terms = ["agent-tier", "strategic-command", "aiad", "red-team", "blue-team", "white-team", "gray-team", "purple-team", "archer-supreme", "nabla-infinity"]
keywords = ["tactical execution", "L2 agents", "domain specialists", "color team operations", "agent tier hierarchy", "AIAD specification", "epistemic agents", "security operations"]
platforms = ["elixir", "phoenix", "prismatic"]
use_cases = ["adversarial-simulation", "defensive-analysis", "formal-verification", "boundary-exploration", "drift-detection"]
prerequisites = ["aiad", "agent-tier", "color-teams"]
key_takeaway = "L2 Tactical Execution agents are domain-focused specialists forming the operational backbone of the platform, executing precise tasks within defined authority boundaries under L3 commander coordination."
word_count = 1473
date_modified = "2026-11-10"
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Tactical Execution (taktická exekuce) – glosář"
+++

## Definice a přehled

Tactical Execution (taktická exekuce) je úroveň agentů L2, která v hierarchii agentů Prismatic
Platform odpovídá za soustředěné, doménově specifické operace v rámci jedné aplikace nebo oblasti
schopností. Agenti L2 jsou provozní páteří platformy – specialisté, kteří pod koordinací svého
velitele týmu L3 provádějí konkrétní úlohy, jako jsou epistemické útoky ([Red
Team](@/glossary/red-team.md)), detekce posunu ([Blue Team](@/glossary/blue-team.md)), validace
kontraktů ([White Team](@/glossary/white-team.md)) a průzkum hranic ([Gray
Team](@/glossary/gray-team.md)). S přibližně 250 agenty (údaj v době zápisu) tvoří specialisté L2
nejpočetnější skupinu flotily platformy, která tehdy čítala 530 agentů.

Výraz „taktický“ odlišuje tuto úroveň od strategické koordinace (L4, [Strategic
Command](@/glossary/strategic-command.md)) a nejvyšší autority (L5, [Supreme
Commander](@/glossary/supreme-commander.md)). Ve vojenské doktríně jsou taktické operace přímým
prováděním konkrétních misí v jasně vymezených parametrech, na rozdíl od strategického plánování,
které koordinuje více dějišť. Podobně agenti L2 pracují s hlubokou odborností v úzkých doménách
a specializované úlohy provádějí přesně, místo aby koordinovali napříč doménami. Toto zaměření
umožňuje každému agentovi L2 udržet expertní úroveň ve své specializaci – `red-epistemic-attacker`
nemusí rozumět posuzování obranného postavení a `blue-drift-detector` nemusí generovat útočné
scénáře.

Úroveň L2 stojí na průsečíku schopností a koordinace. Asistenční agenti L1 zajišťují základní
provádění úloh v rozsahu jedné funkce, zatímco agenti L2 uplatňují doménovou odbornost k řešení
složitých problémů ve své specializaci. Rozdíl je podstatný: agent L1 může naformátovat záznam
v logu, agent L2 analyzuje vzorce posunu chování v časových oknech a odhaluje podprahové změny
konfigurace. Agenti L2 hlásí zjištění nahoru velitelům týmů L3, kteří zprávy specialistů
syntetizují do posouzení na úrovni týmu.

V Prismatic Platform se agenti L2 definují standardem [AIAD](@/glossary/aiad.md), který stanoví
schopnosti každého agenta, hranice jeho pravomoci, komunikační rozhraní a bezpečnostní omezení.
Každý agent L2 má formální specifikaci v `.aiad/agents/`, která definuje jeho provozní parametry,
takže taktická exekuce probíhá v dobře zdokumentovaných mezích s dohledatelnou odpovědností.

Pro Kompendium je taktická exekuce pojmem z kontextu platformy. Knize je blízká zásada, že
specialista nesmí sám řešit rozpory mimo svou doménu, ale má je zachovat a předat k syntéze –
obdoba toho, jak má klinik postupovat u nejasných případů (viz [6.6 Supervizní rámce v klinické
praxi EA](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)).

## Historický kontext

Úroveň L2 byla formalizována v 7. generaci vývoje platformy, kdy populace agentů přerostla to,
co plochá hierarchie dokázala zvládat. Rané implementace agentů pracovaly bez formální
klasifikace úrovní – všichni agenti byli rovnocenní s různou mírou schopností. Plochá struktura
vytvářela problémy koordinace: agenti zdvojovali práci, vytvářeli protichůdná zjištění a chyběly
jim jasné eskalační cesty pro zjištění, která přesahovala jejich doménovou pravomoc.

Pětiúrovňová hierarchie (L1 až L5, viz [Agent Tier](@/glossary/agent-tier.md)) byla zavedena
k řešení těchto problémů. Úroveň L2 byla navržena tak, aby zachytila nejpočetnější třídu agentů:
doménové specialisty, kteří potřebovali autonomii ve své odbornosti, ale vyžadovali koordinaci
s ostatními specialisty přes velitelskou strukturu. Přirozené seskupení agentů L2 poskytla
organizace [barevných týmů](@/glossary/color-teams.md), v níž velitel L3 každého týmu řídí kohortu
specialistů L2.

Zavedení standardu AIAD v 8. generaci úroveň L2 dále formalizovalo, protože každý agent musel nést
strojově čitelnou specifikaci schopností, hranic pravomoci a bezpečnostních omezení. Standardizace
umožnila automatizovanou kontrolu souladu a dovolila platformě vyrůst z desítek na stovky agentů,
aniž by ztratila koordinační disciplínu.

## Technický rozbor

### Klasifikace agentů L2

Agenti L2 se třídí podle doménové specializace a provozního režimu:

```elixir
defmodule PrismaticAgents.Tier.TacticalExecution do
  @moduledoc """
  L2 Tactical Execution agent tier.
  Domain-specific specialists executing focused operations.
  """

  @type l2_agent :: %{
    call_sign: String.t(),
    tier: :l2_tactical,
    domain: atom(),
    team: color_team(),
    commander: module(),
    capabilities: [atom()],
    safety_constraints: [constraint()]
  }

  @type color_team :: :red | :blue | :purple | :white | :gray | :black
  @type constraint :: :read_only | :sandbox_only | :synthetic_data | :no_network

  @spec classify(module()) :: l2_agent()
  def classify(agent_module) do
    spec = agent_module.__aiad_spec__()

    %{
      call_sign: spec.call_sign,
      tier: :l2_tactical,
      domain: spec.domain,
      team: spec.team,
      commander: spec.reports_to,
      capabilities: spec.capabilities,
      safety_constraints: spec.safety_constraints
    }
  end

  @spec execute_task(l2_agent(), task()) :: {:ok, result()} | {:error, term()}
  def execute_task(agent, task) do
    with :ok <- verify_authority(agent, task),
         :ok <- verify_safety_constraints(agent, task),
         {:ok, context} <- build_execution_context(agent, task) do
      agent.commander
      |> apply(:dispatch, [agent.call_sign, task, context])
    end
  end

  defp verify_authority(agent, task) do
    if task.domain == agent.domain do
      :ok
    else
      {:error, {:authority_exceeded, "L2 agents operate within single domain"}}
    end
  end

  defp verify_safety_constraints(agent, task) do
    violations =
      agent.safety_constraints
      |> Enum.reject(fn constraint -> satisfies_constraint?(task, constraint) end)

    case violations do
      [] -> :ok
      violated -> {:error, {:safety_violation, violated}}
    end
  end
end
```

### Životní cyklus agenta L2

Každý agent L2 prochází definovaným životním cyklem od aktivace po doručení výsledku:

```elixir
defmodule PrismaticAgents.TacticalExecution.Lifecycle do
  @moduledoc """
  Manages the lifecycle of L2 Tactical Execution agents.
  Handles activation, execution, and result reporting.
  """

  use GenServer

  @type lifecycle_state :: :idle | :activated | :executing | :reporting | :completed

  @type execution_record :: %{
    agent: module(),
    task_id: String.t(),
    started_at: DateTime.t(),
    completed_at: DateTime.t() | nil,
    state: lifecycle_state(),
    result: term() | nil,
    telemetry_events: non_neg_integer()
  }

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @impl true
  def init(opts) do
    agent = Keyword.fetch!(opts, :agent)

    :telemetry.execute(
      [:prismatic, :agents, :l2, :init],
      %{},
      %{agent: agent.call_sign, team: agent.team}
    )

    {:ok, %{agent: agent, state: :idle, current_task: nil, history: []}}
  end

  @impl true
  def handle_call({:activate, task}, _from, %{state: :idle} = state) do
    record = %{
      agent: state.agent,
      task_id: task.id,
      started_at: DateTime.utc_now(),
      completed_at: nil,
      state: :activated,
      result: nil,
      telemetry_events: 0
    }

    :telemetry.execute(
      [:prismatic, :agents, :l2, :activated],
      %{},
      %{agent: state.agent.call_sign, task: task.id}
    )

    {:reply, {:ok, record}, %{state | state: :activated, current_task: record}}
  end

  @impl true
  def handle_call({:execute, params}, _from, %{state: :activated} = state) do
    result = execute_specialist_operation(state.agent, state.current_task, params)

    updated_task = %{state.current_task |
      completed_at: DateTime.utc_now(),
      state: :completed,
      result: result
    }

    :telemetry.execute(
      [:prismatic, :agents, :l2, :completed],
      %{duration_ms: DateTime.diff(updated_task.completed_at, updated_task.started_at, :millisecond)},
      %{agent: state.agent.call_sign, status: elem(result, 0)}
    )

    {:reply, result, %{state | state: :completed, current_task: updated_task,
      history: [updated_task | state.history]}}
  end

  defp execute_specialist_operation(agent, task, params) do
    case agent.team do
      :red -> execute_adversarial(agent, task, params)
      :blue -> execute_defensive(agent, task, params)
      :white -> execute_verification(agent, task, params)
      :gray -> execute_exploration(agent, task, params)
      :purple -> execute_synthesis(agent, task, params)
      :black -> execute_theoretical(agent, task, params)
    end
  end
end
```

### Operace specializovaných domén

Každý barevný tým má odlišné typy specialistů L2 s konkrétními provozními schopnostmi:

```elixir
defmodule PrismaticAgents.TacticalExecution.RedSpecialist do
  @moduledoc """
  L2 Red Team specialist for adversarial simulation.
  Executes epistemic attack scenarios in sandboxed environments.
  """

  @behaviour PrismaticAgents.TacticalExecution.Specialist

  @attack_primitives [
    :truth_distortion,
    :confidence_manipulation,
    :signal_poisoning,
    :drift_induction,
    :salience_hijacking
  ]

  @impl true
  def execute(scenario, context) do
    with :ok <- verify_sandbox_isolation(context),
         :ok <- verify_synthetic_data_only(context),
         {:ok, attack} <- compose_attack(scenario),
         {:ok, result} <- simulate_in_sandbox(attack, context) do
      {:ok, %{
        scenario: scenario.id,
        attack_primitives_used: attack.primitives,
        impact_assessment: assess_impact(result),
        defensive_recommendations: generate_recommendations(result),
        evidence: collect_evidence(result)
      }}
    end
  end

  defp compose_attack(scenario) do
    primitives =
      scenario.techniques
      |> Enum.filter(&(&1 in @attack_primitives))
      |> Enum.map(&build_primitive/1)

    {:ok, %{primitives: primitives, scenario: scenario}}
  end
end

defmodule PrismaticAgents.TacticalExecution.BlueSpecialist do
  @moduledoc """
  L2 Blue Team specialist for defensive analysis.
  Detects drift, anomalies, and defensive posture weaknesses.
  """

  @behaviour PrismaticAgents.TacticalExecution.Specialist

  @drift_categories [:behavioral, :configuration, :dependency, :performance]

  @impl true
  def execute(assessment_target, context) do
    drift_results =
      @drift_categories
      |> Task.async_stream(fn category ->
        {category, detect_drift(assessment_target, category, context)}
      end, max_concurrency: 4, timeout: 30_000)
      |> Enum.map(fn {:ok, result} -> result end)
      |> Map.new()

    {:ok, %{
      target: assessment_target,
      drift_findings: drift_results,
      overall_posture: assess_posture(drift_results),
      evidence: build_evidence_chain(drift_results),
      confidence: calculate_confidence(drift_results)
    }}
  end

  defp detect_drift(target, :behavioral, context) do
    baseline = load_behavioral_baseline(target)
    current = observe_current_behavior(target, context)
    compare_with_threshold(baseline, current, 0.05)
  end

  defp detect_drift(target, :configuration, context) do
    expected = load_expected_config(target)
    actual = read_current_config(target, context)
    diff_configurations(expected, actual)
  end
end
```

## Architektura a implementace

### Rozložení agentů L2 podle týmů

Přibližně 250 agentů L2 je rozděleno mezi šest barevných týmů a doménově specifické aplikace
(stav v době zápisu):

| Tým | Agenti L2 | Příklady specialistů | Hlavní doména |
|------|-----------|--------------------|----|
| Red Team | ~40 | `red-epistemic-attacker`, `red-drift-inducer`, `red-scenario-generator` | útočná simulace |
| Blue Team | ~45 | `blue-auth-sentinel`, `blue-drift-detector`, `blue-signal-aggregator` | obranná analýza |
| [Purple Team](@/glossary/purple-team.md) | ~30 | `purple-mapper`, `purple-closure-analyst`, `purple-regression-guard` | syntéza a uzavírání |
| White Team | ~25 | `white-contract-validator`, `white-invariant-prover` | formální ověření |
| Gray Team | ~20 | `gray-edge-finder`, `gray-escalation-guard` | průzkum hranic |
| doménové aplikace | ~90 | specialisté kvality, pracovníci EASM, obsluha API | podle aplikace |

### Hranice pravomoci

| Schopnost | L1 Assistant | L2 Tactical | L3 Commander |
|------------|-------------|-------------|-------------|
| Rozsah | jedna funkce | jedna doména | jeden tým |
| Rozhodovací pravomoc | žádná | v rámci parametrů domény | koordinace týmu |
| Přístup ke zdrojům | minimální | zdroje domény | zdroje týmu |
| Možnost přebít | žádná | žádná | L1–L2 v rámci týmu |
| Cíl eskalace | L2 nebo L3 | velitel L3 | L4 Strategic |
| Míra autonomie | řízená | poloautonomní | autonomní v rámci týmu |

### Komunikační architektura

```
L4 Strategic Command
    |
    +-- L3 Red Commander --------+-- L2 red-epistemic-attacker
    |                            +-- L2 red-drift-inducer
    |                            +-- L2 red-scenario-generator
    |
    +-- L3 Blue Commander -------+-- L2 blue-auth-sentinel
    |                            +-- L2 blue-drift-detector
    |                            +-- L2 blue-signal-aggregator
    |
    +-- L3 White Commander ------+-- L2 white-contract-validator
    |                            +-- L2 white-invariant-prover
    |
    +-- L3 Gray Commander -------+-- L2 gray-edge-finder
                                 +-- L2 gray-escalation-guard
```

### Hlášení výsledků L2

Agenti L2 vytvářejí strukturovaná zjištění, která proudí hierarchií nahoru:

```elixir
defmodule PrismaticAgents.TacticalExecution.FindingReport do
  @moduledoc """
  Structured finding report produced by L2 tactical agents.
  Standardized format for upward reporting to L3 commanders.
  """

  @type finding :: %{
    id: String.t(),
    agent: String.t(),
    team: atom(),
    severity: :critical | :high | :medium | :low | :info,
    category: atom(),
    title: String.t(),
    description: String.t(),
    evidence: [evidence_item()],
    confidence: float(),
    timestamp: DateTime.t(),
    recommendations: [String.t()]
  }

  @type evidence_item :: %{
    type: :observation | :measurement | :log | :test_result,
    content: term(),
    source: String.t(),
    collected_at: DateTime.t()
  }

  @spec submit(finding()) :: :ok | {:error, term()}
  def submit(finding) do
    with :ok <- validate_finding(finding),
         :ok <- verify_evidence_chain(finding.evidence),
         :ok <- check_confidence_threshold(finding) do
      :telemetry.execute(
        [:prismatic, :agents, :l2, :finding],
        %{confidence: finding.confidence},
        %{agent: finding.agent, team: finding.team, severity: finding.severity}
      )

      route_to_commander(finding)
    end
  end

  defp check_confidence_threshold(finding) do
    min_confidence = case finding.severity do
      :critical -> 0.95
      :high -> 0.85
      :medium -> 0.70
      :low -> 0.50
      :info -> 0.30
    end

    if finding.confidence >= min_confidence do
      :ok
    else
      {:error, {:insufficient_confidence, finding.confidence, min_confidence}}
    end
  end
end
```

## Napojení na NABLA

Agenti taktické exekuce L2 pracují v epistemickém rámci [NABLA Infinity](@/glossary/nabla-infinity.md),
který řídí, jak shromažďují důkazy, utvářejí závěry a hlásí zjištění. Klíčové požadavky NABLA na
agenty L2:

**Pluralita signálů** ([Signal Plurality](@/glossary/signal-plurality.md)): zjištění L2 musí
podporovat nejméně dva nezávislé signály. Jediné pozorování k podání zjištění nestačí.

**Povinná provenience**: každé zjištění musí nést úplný řetězec provenience od surového signálu
přes zpracování důkazů po konečný závěr. Axiom [Provenance
Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)
se strukturně vynucuje ve schématu zprávy o zjištění.

**Kalibrace důvěry**: agenti L2 musí kalibrovat skóre důvěry tak, aby odpovídalo skutečné síle
jejich důkazů. Systém prahů důvěry (0,95 pro kritická, 0,85 pro vysoká, 0,70 pro střední) brání
předčasné eskalaci nejistých zjištění.

**Zachování rozporu**: narazí-li agenti L2 na protichůdné důkazy, musí zachovat oba signály
a rozpor nahlásit veliteli L3, místo aby ho řešili jednostranně. Řešení rozporů napříč doménami
je odpovědností syntetických operací [Purple Teamu](@/glossary/purple-team.md).

## Užití v Prismatic Platform

### Aktivace agentů L2

```elixir
# Direct activation through L3 commander
{:ok, result} = PrismaticDark.Red.Commander.dispatch(
  :red_epistemic_attacker,
  %{scenario: "truth_distortion_cascade", target: "belief_network_alpha"}
)

# Batch activation for multi-specialist operations
results = PrismaticDark.Blue.Commander.fan_out([
  {:blue_drift_detector, %{target: "prismatic_perimeter", window: :timer.hours(24)}},
  {:blue_auth_sentinel, %{target: "prismatic_web", scope: :authentication}},
  {:blue_signal_aggregator, %{sources: [:telemetry, :logs, :metrics]}}
])
```

### Příkazy CLI

```bash
# View L2 agent status
/agent-status --tier=l2

# Activate specific L2 specialist
/red-team scenario --agent=red-epistemic-attacker --scenario=drift_cascade

# View findings from L2 agents
/agent-findings --tier=l2 --team=blue --severity=high
```

### Definice agenta v AIAD

Každý agent L2 má odpovídající specifikaci AIAD:

```yaml
# .aiad/agents/red-epistemic-attacker.agent.md (frontmatter)
agent-spec:
  id: red-epistemic-attacker
  name: Red Epistemic Attacker
  tier: L2
  team: red
  commander: red-commander
  domain: adversarial_simulation
  capabilities:
    - truth_distortion_simulation
    - confidence_manipulation
    - signal_poisoning
  safety_constraints:
    - sandbox_only
    - synthetic_data
    - no_network_access
  enforcement:
    doctrine: "no-mercy-no-doubts"
    compliance: mandatory
```

## Bezpečnost a soulad

Agenti L2, zejména v Red a Black Teamu ([Black Team](@/glossary/black-team.md)), pracují pod
přísnými bezpečnostními omezeními vynucovanými na úrovni infrastruktury:

| Omezení | Dotčené týmy | Vynucení | Reakce na porušení |
|------------|---------------|-------------|-------------------|
| izolace v sandboxu | Red, Black | izolace na úrovni procesu | L4 podle [Violation Protocol](@/glossary/violation-protocol.md) |
| jen syntetická data | Red, Black, Gray | ověření zdroje dat | odmítnutí L3 |
| bez přístupu do sítě | Red, Black | pravidla firewallu | blokace v infrastruktuře |
| operace jen pro čtení | Gray, White | oprávnění souborového systému | operace zamítnuta |
| auditní logování | všechny týmy | neměnný log jen pro připisování | vynucení systémem |

Omezení jsou nepodkročitelná a platí stejně v testovacím i produkčním prostředí. Blok vynucení
[doktríny NM/ND](@/glossary/no-mercy-no-doubts.md) ve specifikaci AIAD každého agenta činí soulad
povinným.

## Osvědčené postupy

1. **Udržovat hluboké doménové zaměření.** Agenti L2 čerpají hodnotu ze specializace. Agent, který
   se snaží pokrýt více domén, dává mělké výsledky ve srovnání se soustředěným specialistou.
   Vyžaduje-li úloha více domén, patří na L3 nebo L4.
2. **Vytvářet strukturovaná, důkazy podložená zjištění.** Každé zjištění L2 má obsahovat položky
   důkazů s uvedením zdroje, skóre důvěry a časová razítka. Nepodložená tvrzení porušují axiom
   provenience NABLA Infinity a pipeline hlášení je odmítne.
3. **Respektovat hranice pravomoci.** Agenti L2 pracují ve své vymezené doméně a hlásí nahoru.
   Nekoordinují se s jinými agenty L2 přímo – koordinace mezi specialisty je odpovědností velitelů
   L3. Boční komunikace obchází koordinační hierarchii a vytváří nesledované závislosti.
4. **Používat přiměřená bezpečnostní omezení.** Agenti L2 Red a Black Teamu pracují pod přísnými
   bezpečnostními omezeními (izolace v sandboxu, jen syntetická data, bez přístupu do sítě). Tato
   omezení jsou nepodkročitelná a vynucují se na úrovni infrastruktury, nejen politikou.
5. **Hlásit zjištění s kalibrovanou důvěrou.** Přehnaně sebejistá zjištění klamou velitele L3,
   příliš nejistá plýtvají časem šetření. Skóre důvěry má odpovídat skutečné síle důkazů, s vyššími
   prahy u závažnějších zjištění.
6. **Udržovat specifikaci AIAD aktuální.** Když se schopnosti agenta L2 vyvíjejí, musí se jeho
   specifikace AIAD okamžitě aktualizovat. Zastaralé specifikace vytvářejí rozpor mezi
   zdokumentovaným a skutečným chováním agenta.

## Časté chyby

- **Rozšiřování do sousedních domén**: agenti L2, kteří přesahují svou vymezenou doménu, vytvářejí
  koordinační konflikty a nesledované závislosti. Má-li zjištění důsledky napříč doménami, nahlásit
  ho veliteli L3 k eskalaci, místo aby ho agent šetřil sám.
- **Podhlášení zjištění nízké závažnosti**: zjištění nízké závažnosti od jednotlivých agentů L2
  mohou po agregaci na L3 odhalit významné vzorce. Nefiltrovat sám – hlásit vše a nechat význam
  určit velitele.
- **Přehlížení bezpečnostních omezení v testovacích prostředích**: bezpečnostní omezení (izolace
  v sandboxu, syntetická data) platí v testování i v produkci stejně. Obcházení omezení v testech
  vytváří návyky, které vedou k porušením v produkci.
- **Vázání agentů L2 na konkrétní implementace**: agenti L2 mají pracovat přes definovaná rozhraní
  (specifikace AIAD, kontrakty Sparkline), ne záviset na vnitřních implementačních detailech
  cílových systémů. Implementační vazba se rozbije, když se cíle vyvíjejí.
- **Chápat skóre důvěry binárně**: důvěra není prošlo/neprošlo. Zjištění s důvěrou 0,72 se
  podstatně liší od zjištění s důvěrou 0,95. Systém prahů důvěry existuje proto, aby bránil
  předčasnému jednání na základě nejistých zjištění a přitom zachytil cenné signály.

## Související

**Pojmy platformy v tomto glosáři**

- [Agent Tier](@/glossary/agent-tier.md) – úplná klasifikace L1–L5.
- [Strategic Command](@/glossary/strategic-command.md) – koordinační úroveň L4.
- [Supreme Commander](@/glossary/supreme-commander.md) – autorita L5 nad celou platformou.
- [Red Team](@/glossary/red-team.md), [Blue Team](@/glossary/blue-team.md),
  [White Team](@/glossary/white-team.md), [Gray Team](@/glossary/gray-team.md) – týmy se
  specialisty L2 pro útočnou simulaci, obranu, formální ověření a průzkum hranic.
- [AIAD](@/glossary/aiad.md) – standard definic agentů.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec zjištění L2.
- [Violation Protocol](@/glossary/violation-protocol.md) – protokol vynucení bezpečnostních omezení.

**Přehledy platformy mimo tuto knihu**

- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/).

**Kniha**

- [Tactical Execution a detekce EA](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) –
  specialisté L2 v detekci epistemických útoků.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
