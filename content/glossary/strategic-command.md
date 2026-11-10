+++
title = "Strategic Command (strategické velení)"
weight = 15
description = "Úroveň agentů L4 v hierarchii AIAD Prismatic Platform: koordinace napříč doménami mezi specializovanými týmy a nejvyšší autoritou."

[taxonomies]
tags = ["glossary", "prismatic", "agents", "architecture", "doctrine"]

[extra]
category = "agents"
related_terms = ["agent-tier", "tactical-execution", "supreme-commander", "aiad", "archer-supreme", "red-team", "blue-team", "purple-team", "color-teams"]
difficulty = "advanced"
importance = "high"
platform_relevance = "core"
date_created = "2025-05-01"
date_updated = "2026-02-22"
version = "2.0.0"
audience = ["platform-architects", "agent-developers", "operations-engineers", "security-engineers"]
prerequisites = ["aiad", "agent-tier", "otp"]
domain = "agent-systems"
related_patterns = ["command-hierarchy", "escalation-protocol", "multi-domain-coordination", "topological-task-execution", "delegation-pattern"]
see_also = ["architecture", "agents", "commands"]
acronyms = ["AIAD", "L1", "L2", "L3", "L4", "L5", "DAG", "SEADF"]
standards = ["AIAD-Agent-Specification-v2", "NO-MERCY-NO-DOUBTS-Doctrine"]
tools = ["mix", "telemetry", "genserver", "task-supervisor"]
platforms = ["beam", "otp", "prismatic-platform"]
keywords = ["strategic command agent", "multi-domain coordination", "agent hierarchy L4", "cross-cutting operations", "escalation protocol", "agent orchestration", "command and control", "AIAD strategic tier"]
author = "Tomas Korcak (korczis)"
reading_time = "6 min"
word_count = 1192
date_modified = "2026-11-10"
quality_score = 80
image = "/images/sections/glossary.png"
image_alt = "Strategic Command (strategické velení) – glosář"
+++

## Definice a přehled

Strategic Command (strategické velení) je úroveň agentů L4, která v hierarchii agentů
[AIAD](@/glossary/aiad.md) Prismatic Platform odpovídá za koordinaci napříč doménami a za řízení
průřezových operací. Agenti L4 propojují doménové specialisty L2–L3, kteří pracují v úzce
vymezených oblastech, s agenty L5 Supreme, kteří mají pravomoc nad celou platformou. Řídí složité
postupy přesahující hranice aplikací, koordinují specializované týmy a slouží jako eskalační
brána k nejvyšší autoritě, když operace přesáhnou jejich vymezený rozsah.

Ve vojenské a organizační teorii stojí strategické velení mezi taktickou exekucí (praktičtí
specialisté) a nejvyšším velením (konečná autorita). Tato střední úroveň je kritická, protože
většina skutečných operací přesahuje hranice domén: zlepšení bezpečnosti zahrnuje brány kvality,
změny kódu, testování, nasazení i monitorování – žádná jednotlivá specializovaná doména nepokrývá
všechny tyto stránky. Bez strategické koordinace doménoví specialisté optimalizují lokálně, ale
nedodají integrovaný výsledek.

Hierarchie agentů Prismatic Platform má pět úrovní ([Agent Tier](@/glossary/agent-tier.md)) a úroveň
L4 je v ní koordinačním uzlem, který převádí cíle vysoké úrovně od [Supreme
Commander](@/glossary/supreme-commander.md) na proveditelné vícefázové plány prováděné
specialisty L2–L3 ([Tactical Execution](@/glossary/tactical-execution.md)). Počty uvádí
dokumentace platformy v době zápisu:

| Úroveň | Stupeň | Počet | Role | Rozsah |
|------|-------|-------|------|-------|
| L1 | Assistant | ~50 | základní provádění úloh | jedna funkce |
| L2 | Specialist | ~250 | doménová odbornost | jedna doména |
| L3 | Commander | ~80 | koordinace týmu | jeden tým |
| **L4** | **Strategic** | **~20** | **koordinace více domén** | **napříč doménami** |
| L5 | Supreme | ~4 | pravomoc nad celou platformou | celá platforma |

Agenti strategického velení tvoří přibližně 4 % flotily (v době zápisu 530 agentů), ale zvládají
provozně nejsložitější scénáře, protože musí rozumět více doménám natolik, aby mezi nimi dokázali
účinně koordinovat. Každý agent L4 udržuje koordinační model zahrnující 2–4 domény, úlohy jedné
domény deleguje dolů a záležitosti celé platformy eskaluje nahoru. (Označení úrovní není
v dokumentaci platformy zcela jednotné – např. koordinátoři barevných týmů se uvádějí jako
„L3 Strategic Commander“.)

Pro Kompendium je strategické velení pojmem z kontextu platformy, bez přímého protějšku
v taxonomii EA. Kniha z něj nepřebírá hierarchický model: v lidských organizacích je naopak
důležité, aby eskalace k vyšší autoritě nebyla jedinou cestou, jak zpochybnit rozhodnutí (srov.
[Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)).

## Historický kontext a zdůvodnění návrhu

Úroveň L4 vznikla během vývoje platformy v generacích 8–10, kdy rostoucí počet agentů (z přibližně
100 na přibližně 300) ukázal, že plochá nebo dvouúrovňová hierarchie neumí operace napříč
doménami zvládat efektivně. V raných verzích se o koordinaci napříč doménami pokoušeli velitelé
L3, což vytvářelo dvě selhání:

1. **Mezery v pravomoci**: agenti L3 v doméně A nemohli řídit agenty L3 v doméně B, takže při
   potřebě spolupráce napříč doménami docházelo k uváznutí.
2. **Přetížení nejvyšší úrovně**: bez střední úrovně eskalovala každá operace napříč doménami
   na L5 a zahlcovala čtyři agenty Supreme rutinními koordinačními úlohami.

Zavedení úrovně L4 v generaci 10 vyřešilo obojí vytvořením výslovné pravomoci nad více doménami
s jasnými kritérii eskalace. Návrh volně navazuje na organizační teorii (James D. Thompson,
*Organizations in Action*, 1967), v níž zprostředkující technologie (*mediating technology*)
propojuje vzájemně závislé jednotky – agenti L4 jsou zprostředkující technologií platformy.

Doktrína [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md) se na úrovni L4 uplatňuje jinak
než na ostatních úrovních. Agenti L4 pracují v přechodové zóně mezi fází zkoumání [NABLA
Infinity](@/glossary/nabla-infinity.md) (kde se mapuje nejistota a zachovávají rozpory) a fází
rozhodné exekuce. Musí určit, kdy je práh důvěry (0,95 u kritických rozhodnutí) splněn napříč
více doménami, než se zaváží ke koordinačnímu plánu.

## Klasifikace agentů L4

Agenti L4 se třídí podle rozsahu koordinace a hranic pravomoci:

```elixir
defmodule PrismaticAgents.Tier.StrategicCommand do
  @moduledoc """
  L4 Strategic Command agent tier.
  Coordinates multi-domain operations and manages escalation
  between L2-L3 specialists and L5 Supreme authority.
  """

  @type l4_agent :: %{
    call_sign: String.t(),
    tier: :l4_strategic,
    coordination_domains: [atom()],
    authority_scope: authority_scope(),
    escalation_target: module(),
    subordinate_teams: [atom()],
    max_concurrent_operations: pos_integer()
  }

  @type authority_scope :: %{
    can_coordinate: [atom()],
    can_override: [atom()],
    must_escalate: [atom()],
    max_resource_allocation: non_neg_integer(),
    max_domains: pos_integer()
  }

  @spec classify_operation(map()) ::
          {:delegate, :l3_commander, atom()}
          | {:l4_strategic, map()}
          | {:escalate, :l5_supreme}
  def classify_operation(operation) do
    domains = identify_domains(operation)

    cond do
      length(domains) <= 1 ->
        {:delegate, :l3_commander, List.first(domains)}

      length(domains) <= 4 and within_authority?(operation) ->
        {:l4_strategic, %{
          domains: domains,
          coordination_plan: plan_coordination(domains),
          estimated_complexity: estimate_complexity(operation),
          estimated_duration: estimate_duration(operation)
        }}

      true ->
        {:escalate, :l5_supreme}
    end
  end

  defp within_authority?(operation) do
    not requires_platform_override?(operation) and
      not involves_critical_infrastructure?(operation) and
      estimated_impact(operation) < :high
  end
end
```

## Engine koordinace více domén

Základní schopností agentů L4 je řízení práce napříč více doménovými týmy. Koordinační engine
rozkládá cíle vysoké úrovně do orientovaného acyklického grafu (DAG) doménových fází, řeší
závislosti mezi fázemi a provádí je s přiměřenou souběžností:

```elixir
defmodule PrismaticAgents.StrategicCommand.Coordinator do
  @moduledoc """
  Orchestrates multi-domain operations by decomposing high-level
  objectives into domain-specific tasks and managing their execution.
  Implements topological sorting for dependency resolution and
  parallel execution within dependency-safe groups.
  """

  use GenServer

  @type coordination_plan :: %{
    objective: String.t(),
    domains: [atom()],
    phases: [phase()],
    dependencies: [{atom(), atom()}],
    timeout: non_neg_integer(),
    rollback_strategy: :compensate | :abort | :manual
  }

  @type phase :: %{
    name: atom(),
    domain: atom(),
    tasks: [task()],
    depends_on: [atom()],
    status: :pending | :active | :completed | :failed | :rolled_back
  }

  @type task :: %{
    id: String.t(),
    domain: atom(),
    agent: module(),
    action: atom(),
    args: map(),
    status: :pending | :running | :completed | :failed,
    result: term() | nil
  }

  @spec execute_plan(coordination_plan()) :: {:ok, map()} | {:error, term()}
  def execute_plan(plan) do
    GenServer.call(__MODULE__, {:execute, plan}, plan.timeout)
  end

  @impl true
  def handle_call({:execute, plan}, _from, state) do
    :telemetry.execute(
      [:prismatic, :agents, :strategic_command, :plan_started],
      %{phase_count: length(plan.phases)},
      %{objective: plan.objective, domains: plan.domains}
    )

    result =
      plan.phases
      |> topological_sort(plan.dependencies)
      |> execute_sorted_phases(plan)

    :telemetry.execute(
      [:prismatic, :agents, :strategic_command, :plan_completed],
      %{},
      %{objective: plan.objective, result: elem(result, 0)}
    )

    {:reply, result, state}
  end

  defp execute_sorted_phases(sorted_phases, plan) do
    Enum.reduce_while(sorted_phases, {:ok, %{}}, fn phase_group, {:ok, results} ->
      case execute_phase_group(phase_group, results) do
        {:ok, group_results} ->
          {:cont, {:ok, Map.merge(results, group_results)}}

        {:error, reason} ->
          case plan.rollback_strategy do
            :compensate -> {:halt, compensate(results, reason)}
            :abort -> {:halt, {:error, reason}}
            :manual -> {:halt, {:error, {:manual_intervention, reason, results}}}
          end
      end
    end)
  end

  defp execute_phase_group(phases, previous_results) do
    phases
    |> Task.async_stream(fn phase ->
      context = build_context(phase, previous_results)
      execute_phase(phase, context)
    end, max_concurrency: 4, timeout: 30_000)
    |> Enum.reduce({:ok, %{}}, fn
      {:ok, {:ok, {name, result}}}, {:ok, acc} -> {:ok, Map.put(acc, name, result)}
      {:ok, {:error, reason}}, _acc -> {:error, reason}
      {:exit, reason}, _acc -> {:error, {:task_exit, reason}}
    end)
  end
end
```

## Protokol eskalace

Agenti L4 postupují u operací, které přesahují jejich pravomoc, podle definovaného protokolu
eskalace. Protokol je implementován jako plnohodnotný modul s instrumentací
[telemetrie](https://prismatic-reality-com.github.io/prismatic-promo/glossary/telemetry/) kvůli
souladu auditní stopy:

```elixir
defmodule PrismaticAgents.StrategicCommand.EscalationProtocol do
  @moduledoc """
  Manages escalation from L4 Strategic Command to L5 Supreme agents.
  Defines clear criteria for when operations must be escalated.
  All escalations are logged via telemetry for audit compliance.
  """

  @type escalation_reason ::
    :authority_exceeded
    | :critical_infrastructure
    | :platform_override_needed
    | :cross_cutting_impact
    | :emergency_situation
    | :confidence_below_threshold

  @escalation_criteria [
    {:authority_exceeded, "Operation requires override of more than 4 domain restrictions"},
    {:critical_infrastructure, "Operation modifies supervision trees, release config, or deployment"},
    {:platform_override_needed, "Operation requires bypassing quality gates or safety checks"},
    {:cross_cutting_impact, "Operation impacts more than 50% of umbrella applications"},
    {:emergency_situation, "Operation is triggered by EMERGENCY enforcement level"},
    {:confidence_below_threshold, "NABLA confidence < 0.95 for critical decision"}
  ]

  @spec should_escalate?(map()) :: {:escalate, escalation_reason()} | :proceed
  def should_escalate?(operation) do
    Enum.find_value(@escalation_criteria, :proceed, fn {reason, _desc} ->
      if matches_criterion?(operation, reason) do
        {:escalate, reason}
      end
    end)
  end

  @spec escalate_to_supreme(map(), escalation_reason()) :: {:ok, term()} | {:error, term()}
  def escalate_to_supreme(operation, reason) do
    :telemetry.execute(
      [:prismatic, :agents, :escalation],
      %{timestamp: System.monotonic_time()},
      %{from: :l4_strategic, to: :l5_supreme, reason: reason, operation: operation.id}
    )

    PrismaticAgents.SupremeCommander.handle_escalation(operation, reason)
  end
end
```

## Syntéza napříč týmy

Agenti L4 koordinují [barevné týmy](@/glossary/color-teams.md), když operace vyžadují vstupy
z více bezpečnostních perspektiv. Je to nejsložitější vzor koordinace, protože zahrnuje dynamiku
soupeření a spolupráce zároveň:

```elixir
defmodule PrismaticAgents.StrategicCommand.CrossTeamSynthesis do
  @moduledoc """
  Coordinates cross-team operations between Color Teams.
  Ensures findings from different teams are synthesized coherently.
  Implements the Red-Blue-Purple synthesis loop.
  """

  @type audit_result :: %{
    target: String.t(),
    red_findings: [map()],
    blue_posture: map(),
    white_proofs: [map()],
    purple_synthesis: map(),
    overall_assessment: :secure | :at_risk | :compromised
  }

  @spec coordinate_security_audit(String.t()) :: {:ok, audit_result()} | {:error, term()}
  def coordinate_security_audit(target) do
    # Phase 1: Parallel assessment by Red, Blue, and White teams
    tasks = %{
      red: Task.async(fn -> PrismaticDark.Red.Commander.assess(target) end),
      blue: Task.async(fn -> PrismaticDark.Blue.Commander.assess(target) end),
      white: Task.async(fn -> PrismaticDark.White.Commander.verify(target) end)
    }

    # Collect results with timeouts
    results = Map.new(tasks, fn {team, task} ->
      {team, Task.await(task, 60_000)}
    end)

    # Phase 2: Purple Team synthesis of all findings
    case PrismaticDark.Purple.Coordinator.synthesize(%{
      red: results.red,
      blue: results.blue,
      white: results.white,
      target: target
    }) do
      {:ok, synthesis} ->
        {:ok, %{
          target: target,
          red_findings: extract_findings(results.red),
          blue_posture: extract_posture(results.blue),
          white_proofs: extract_proofs(results.white),
          purple_synthesis: synthesis,
          overall_assessment: synthesis.assessment
        }}

      {:error, reason} ->
        {:error, {:synthesis_failed, reason}}
    end
  end
end
```

## Agenti L4 v platformě

Platforma zahrnuje přibližně 20 agentů strategického velení, každý s vymezeným pokrytím domén
a koordinační pravomocí:

| Agent | Pokrytí domén | Hlavní funkce | Max. domén |
|-------|----------------|-----------------|-------------|
| Security Audit Coordinator | Red + Blue + White + Purple | bezpečnostní posouzení více týmy | 4 |
| Quality Campaign Manager | kvalita + bezpečnost + CI | zlepšování kvality napříč doménami | 3 |
| Deployment Coordinator | CI + vydání + monitorování | vícefázové řízení nasazení | 3 |
| EASM Orchestrator | Perimeter + zpravodajství + hodnocení | koordinace vnějšího posouzení | 3 |
| Evolution Strategist | [AutoEvolve](@/glossary/autoevolve.md) + SEADF + Quality DNA | plánování vývoje platformy | 3 |
| Compliance Coordinator | SOC2 + NIS2 + ZKB + GDPR | soulad s více rámci | 4 |
| OSINT Campaign Manager | české + globální zdroje + sankce | sběr zpravodajství z více zdrojů | 3 |

## Hierarchie velení a řízení

```
L5 Supreme Commander / Archer Supreme (4 agents)
        |
        +-- L4 Strategic Command (cross-domain coordination, ~20 agents)
        |       |
        |       +-- L3 Red Commander (red team coordination)
        |       +-- L3 Blue Commander (blue team coordination)
        |       +-- L3 Purple Coordinator (synthesis coordination)
        |       +-- L3 White Commander (verification coordination)
        |       +-- L3 Quality Gate Operator
        |       +-- L3 QDP Elimination Lead
        |
        +-- L4 Quality Campaign Manager
        |       |
        |       +-- L2 Domain Specialists (13 quality domains)
        |       +-- L2 Credo Specialists
        |       +-- L2 Dialyzer Specialists
        |
        +-- L4 EASM Orchestrator
                |
                +-- L3 Perimeter Scanner Coordinator
                +-- L2 DNS Enumeration Specialist
                +-- L2 Certificate Transparency Specialist
                +-- L2 Security Rating Calculator
```

## Hranice pravomoci

| Pravomoc | L4 smí | L4 musí eskalovat |
|-----------|----------|-----------------|
| Koordinace | koordinovat až 4 domény | 5 a více domén vyžaduje L5 |
| Přebití | přebít rozhodnutí L2–L3 v rámci rozsahu | přebití v celé platformě vyžaduje L5 |
| Zdroje | přidělovat v rámci předem stanovených rozpočtů | rozpočet nad prahem vyžaduje L5 |
| Časový rámec | řídit operace do 1 týdne | vícetýdenní operace vyžadují L5 |
| Dopad | změny dotýkající se konkrétních domén | změny dotýkající se 50 % a více platformy (57+ aplikací) |
| Brány kvality | vynucovat v koordinovaných doménách | obejití bran kvality vyžaduje L5 |
| Vytváření agentů | spouštět dočasné agenty L1 | vytvoření trvalých agentů vyžaduje L5 |

## Užití v Prismatic Platform

### Vyvolání strategického velení

```elixir
# Multi-domain security audit
{:ok, result} = PrismaticAgents.StrategicCommand.coordinate_security_audit("example.com")

# Cross-domain quality campaign
{:ok, result} = PrismaticAgents.StrategicCommand.Coordinator.execute_plan(%{
  objective: "Eliminate remaining QDP in perimeter domain",
  domains: [:quality, :perimeter, :testing],
  phases: [
    %{name: :audit, domain: :quality, tasks: [...]},
    %{name: :fix, domain: :perimeter, tasks: [...]},
    %{name: :verify, domain: :testing, tasks: [...]}
  ],
  dependencies: [{:fix, :audit}, {:verify, :fix}],
  timeout: :timer.hours(2),
  rollback_strategy: :compensate
})
```

### Příkazy CLI

```bash
# Activate strategic coordination
/orchestrate --scope=security --target=perimeter

# View L4 agent status
/agent-status --tier=l4

# Escalate to Supreme
/escalate --reason=critical_infrastructure

# View coordination plans
/strategic-command plans --active
```

## Osvědčené postupy

1. **Jasně vymezit hranice pravomoci.** Agenti L4 mají přesně vědět, co smějí a kdy musí
   eskalovat. Nejasné hranice vedou buď k paralýze (stálé eskalování), nebo k překročení
   pravomoci (nikdy neeskalovat). Prismatic Platform kóduje hranice jako data ve specifikaci
   agenta, nespoléhá na úsudek za běhu.
2. **Plánovat koordinační fáze před exekucí.** Operace napříč doménami se mají plánovat jako
   orientovaný acyklický graf fází s výslovnými závislostmi, ne provádět jako nahodilé sledy.
   Topologické řazení zaručuje pořadí exekuce bez uváznutí.
3. **Sledovat závislosti fází kvůli uváznutí.** Závisejí-li fáze na sobě navzájem, mohou kruhové
   závislosti způsobit uváznutí. Topologickým řazením lze cykly odhalit před začátkem exekuce.
   Koordinátor při zjištění cyklu vrací `{:error, :circular_dependency}`.
4. **Komunikovat napříč týmy strukturovanými rozhraními.** Agenti L4 nemají zasahovat do vnitřku
   agentů L2–L3. Pro veškerou komunikaci mezi týmy se používají definovaná příkazová rozhraní,
   což zachovává zapouzdření a umožňuje nezávislý vývoj specializovaných agentů.
5. **Zaznamenávat koordinační rozhodnutí pro audit.** Strategická rozhodnutí o koordinaci domén,
   přidělení zdrojů a eskalaci se zaznamenávají přes telemetrii pro přezkum po operaci a jako
   doklad souladu.
6. **Zavést strategie návratu.** Operace napříč doménami mohou selhat v průběhu. Agenti L4 musí
   pro každý koordinační plán definovat strategii návratu (kompenzovat, přerušit, nebo ručně),
   aby byla zachována konzistence systému.

## Časté chyby

- **Stát se úzkým hrdlem**: musí-li veškerá komunikace napříč doménami procházet přes L4, stane se
  koordinační vrstva úzkým hrdlem propustnosti. U rutinních operací, které strategický dohled
  nepotřebují, povolit přímou komunikaci L3–L3.
- **Překoordinovávat jednoduché operace**: ne každá operace napříč doménami potřebuje koordinaci
  L4. Operace dvou domén s jasnými hranicemi lze řešit na úrovni L3 přímým delegováním.
- **Příliš agresivně eskalovat**: agenti L5 Supreme mají pravomoc nad celou platformou. Eskalace
  rutinních operací napříč doménami plýtvá nejvyšší autoritou na taktická rozhodnutí.
- **Přehlížet kritéria eskalace**: neeskalovat, když jsou kritéria splněna, je stejně nebezpečné
  jako eskalovat příliš. Změny kritické infrastruktury musí vždy dojít k L5 bez ohledu na míru
  důvěry L4.
- **Míchat koordinaci s exekucí**: agenti L4 koordinují, doménové úlohy přímo neprovádějí. Agent
  L4, který začne dělat práci L2, ztratil koordinační perspektivu.

## Související

**Pojmy platformy v tomto glosáři**

- [Agent Tier](@/glossary/agent-tier.md) – úplná klasifikace L1–L5.
- [Tactical Execution](@/glossary/tactical-execution.md) – specialisté L2 koordinovaní úrovní L4.
- [Supreme Commander](@/glossary/supreme-commander.md) – autorita L5, která přijímá eskalace L4.
- [Archer Supreme](@/glossary/archer-supreme.md) – agent L5 zaměřený na krize.
- [AIAD](@/glossary/aiad.md) – standard definic agentů všech úrovní.
- [Purple Team](@/glossary/purple-team.md) – syntéza napříč týmy na úrovni L3.
- [Color Teams](@/glossary/color-teams.md) – rámec šesti bezpečnostních týmů koordinovaný L4.

**Hesla a přehledy platformy mimo tuto knihu**

- [GenServer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/genserver/),
  [Telemetry](https://prismatic-reality-com.github.io/prismatic-promo/glossary/telemetry/) – procesní
  model OTP a instrumentace koordinace.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/).

**Kniha**

- [Strategic Command a detekce EA](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) –
  koordinace detekce epistemických útoků.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
