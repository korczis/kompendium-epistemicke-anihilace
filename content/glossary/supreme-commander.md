+++
title = "Supreme Commander (nejvyšší velitel)"
weight = 14
description = "Agent úrovně L5 v Prismatic Platform s pravomocí strategické koordinace a orchestrace celé platformy; jeho rozhodnutí podléhají auditu a axiomům NABLA."

[taxonomies]
tags = ["glossary", "prismatic", "agents", "architecture", "doctrine"]

[extra]
category = "agents"
related_terms = ["agent-tier", "archer-supreme", "aiad", "strategic-command", "agent-registry"]
tier = "TIER 1"
domain = "Agent Orchestration"
platform_integration = "PrismaticAgents"
maturity = "Production"
complexity = "Expert"
audience = ["platform-architects", "agent-developers", "operations-engineers"]
key_benefits = ["parallel-orchestration", "cross-domain-coordination", "10x-efficiency", "strategic-governance"]
prerequisites = ["agent-tier", "aiad", "genserver"]
authority_level = "L5 Supreme"
scope = "Platform-wide"
activation_commands = ["/orchestrate", "/supreme-coordinator"]
override_capability = "All L1-L4 agents"
audit_requirement = "Mandatory"
escalation_target = "None (highest authority)"
process_model = "GenServer"
telemetry_namespace = "prismatic.supreme_commander"
coordination_model = "Topological layer parallelism"
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Supreme", "Commander", "Platform-wide", "glossary", "agents", "Prismatic Platform", "Supreme Commander", "Archer Supreme"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Supreme Commander (nejvyšší velitel) – glosář"
+++

## Definice a přehled

Supreme Commander je agent nejvyšší autority úrovně L5, který odpovídá za strategickou
koordinaci a orchestraci v celém ekosystému Prismatic Platform. Pracuje na nejvyšší úrovni
klasifikace v hierarchii agentů: řídí operace napříč doménami, koordinuje současně více týmů
agentů, zajišťuje strategické sladění všech aplikací (v době zápisu 115) a má konečnou
rozhodovací pravomoc u složitých operací, které přesahují rozsah agentů L4 [Strategic
Command](@/glossary/strategic-command.md).

Na rozdíl od [Archer Supreme](@/glossary/archer-supreme.md), který se specializuje na krizové
zásahy a „nemožné mise“, zajišťuje Supreme Commander průběžné strategické řízení běžných
složitých operací. Archer Supreme se aktivuje v nouzi, Supreme Commander je trvalou orchestrační
vrstvou, která zajišťuje, že běhoví agenti platformy (v době zápisu přes 530) pracují soudržně ke
strategickým cílům. Rozdíl je obdobný jako mezi stálou vojenskou velitelskou strukturou (Supreme
Commander) a jednotkou zvláštních operací nasazenou pro konkrétní krize (Archer Supreme).

Klasifikace L5 dává Supreme Commanderovi schopnosti, které nižší úrovně nemají: přidělování
zdrojů v celé platformě, pravomoc přebít jakékoli rozhodnutí agenta L1–L4, řízení priorit napříč
doménami a možnost v reálném čase přestavět vzorce koordinace agentů. S těmito schopnostmi jde
ruku v ruce odpovídající odpovědnost – rozhodnutí Supreme Commandera se auditují v registru
[AIAD](@/glossary/aiad.md) a podléhají epistemickým požadavkům [NABLA
Infinity](@/glossary/nabla-infinity.md).

Supreme Commander se aktivuje příkazy `/supreme-coordinator` a `/orchestrate`. Desetinásobná
efektivita, kterou dokumentace s `/orchestrate` spojuje, vychází ze schopnosti Supreme Commandera
rozpoznat paralelizovatelné operace napříč doménami a provést je souběžně místo postupně, čímž se
výrazně zkracuje celková doba dokončení složitých vícedoménových postupů. Jde o tvrzení
dokumentace platformy, ne o nezávisle změřenou hodnotu.

Pro Kompendium je Supreme Commander pojmem z kontextu platformy. Kniha k němu dodává jedinou
poznámku: i nejvyšší autorita v systému zůstává auditovatelná a vázaná axiomy – opak toho, co
kniha popisuje u charismatických vůdců uzavřených skupin, jejichž rozhodnutí nelze zpochybnit
(srov. [kult osobnosti](@/glossary/kult-osobnosti.md) a [charisma](@/glossary/charisma.md)).

## Hierarchie agentů a model pravomocí

Úroveň L5 je vrcholem hierarchie agentů Prismatic. Pochopení celé hierarchie je nezbytné pro
pochopení rozsahu pravomoci Supreme Commandera a omezení, jimiž se její výkon řídí.

### Úplná hierarchie

Počty agentů uvádí dokumentace v době zápisu; mezi hesly platformy se liší (heslo Strategic
Command uvádí jiné rozložení), proto je berte orientačně.

| Úroveň | Označení | Rozsah | Počet agentů | Příklad |
|-------|-------|-------|-------------|---------|
| **L5** | Supreme | celá platforma | 2 | Supreme Commander, Archer Supreme |
| **L4** | Strategic Command | více domén (až 4) | ~10 | Evolution Strategist, Quality Director |
| **L3** | Team Commander | jedna doména | ~50 | Red Commander, Blue Commander, Elixir Architect |
| **L2** | Specialist | konkrétní funkce | ~200 | Epistemic Attacker, Drift Detector, Contract Validator |
| **L1** | Worker | konkrétní úloha | ~270 | jednotlivé kontroly, formátovače, skenery |

Model pravomocí sleduje přísnou hierarchii, v níž agenti vyšší úrovně mohou přebít, přeřadit nebo
ukončit operace na nižších úrovních. Jen Supreme Commander může přebít rozhodnutí L4, koordinovat
všechny barevné týmy současně a přidělovat zdroje v celé platformě bez schválení kterýmkoli jiným
agentem (viz [Agent Tier](@/glossary/agent-tier.md)).

### Hranice pravomoci

I na úrovni L5 pracuje Supreme Commander ve vymezených hranicích:

```elixir
defmodule PrismaticAgents.SupremeCommander.AuthorityBoundary do
  @moduledoc "Defines the authority boundaries and constraints for L5 Supreme operations."

  @type authority :: %{
    level: :l5_supreme,
    scope: :platform_wide,
    override: :all_lower_tiers,
    resource_limit: :unlimited,
    escalation_target: :none,
    audit_requirement: :mandatory,
    nabla_compliance: :required,
    doctrine_compliance: :no_mercy_no_doubts
  }

  @type constraint :: %{
    max_concurrent_orchestrations: pos_integer(),
    safety_checks_required: boolean(),
    rollback_capability: :mandatory,
    epistemic_validation: :trinity_gate
  }

  @spec validate_authority(map()) :: {:ok, :authorized} | {:error, term()}
  def validate_authority(operation) do
    with :ok <- check_doctrine_compliance(operation),
         :ok <- check_nabla_axioms(operation),
         :ok <- check_safety_constraints(operation),
         :ok <- check_audit_trail(operation) do
      {:ok, :authorized}
    end
  end

  defp check_doctrine_compliance(%{priority: :p0_critical}), do: :ok
  defp check_doctrine_compliance(%{quality_gates_passed: true}), do: :ok
  defp check_doctrine_compliance(_), do: {:error, :doctrine_violation}

  defp check_nabla_axioms(%{evidence_sources: sources}) when length(sources) >= 2, do: :ok
  defp check_nabla_axioms(_), do: {:error, :signal_plurality_violation}

  defp check_safety_constraints(%{rollback_plan: plan}) when not is_nil(plan), do: :ok
  defp check_safety_constraints(_), do: {:error, :missing_rollback_plan}

  defp check_audit_trail(%{audit_enabled: true}), do: :ok
  defp check_audit_trail(_), do: {:error, :audit_trail_required}
end
```

## Technický rozbor

### Model pravomoci L5

Supreme Commander pracuje s nejvyšší úrovní pravomoci v platformě:

```elixir
defmodule PrismaticAgents.SupremeCommander do
  @moduledoc """
  L5 Supreme authority agent for platform-wide orchestration.
  Highest classification with full platform access and override.
  """

  use GenServer

  @type orchestration_request :: %{
    objective: String.t(),
    domains: [atom()],
    priority: :p0_critical | :p1_high | :p2_normal | :p3_low,
    constraints: map(),
    requestor: String.t()
  }

  @type orchestration_result :: %{
    status: :completed | :partial | :failed,
    phases_completed: non_neg_integer(),
    phases_total: non_neg_integer(),
    duration_ms: non_neg_integer(),
    domain_results: %{atom() => term()},
    efficiency_multiplier: float()
  }

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    {:ok, %{
      active_orchestrations: %{},
      agent_registry: load_agent_registry(),
      resource_allocations: %{},
      audit_log: []
    }}
  end

  @spec orchestrate(orchestration_request()) :: {:ok, orchestration_result()} | {:error, term()}
  def orchestrate(request) do
    GenServer.call(__MODULE__, {:orchestrate, request}, :infinity)
  end

  @impl true
  def handle_call({:orchestrate, request}, _from, state) do
    :telemetry.execute(
      [:prismatic, :supreme_commander, :orchestration_start],
      %{domains: length(request.domains)},
      %{objective: request.objective, priority: request.priority}
    )

    result = execute_orchestration(request, state)

    :telemetry.execute(
      [:prismatic, :supreme_commander, :orchestration_complete],
      %{duration_ms: result.duration_ms, efficiency: result.efficiency_multiplier},
      %{objective: request.objective, status: result.status}
    )

    new_state = record_audit_entry(state, request, result)
    {:reply, {:ok, result}, new_state}
  end

  defp record_audit_entry(state, request, result) do
    entry = %{
      timestamp: DateTime.utc_now(),
      objective: request.objective,
      domains: request.domains,
      priority: request.priority,
      status: result.status,
      duration_ms: result.duration_ms,
      efficiency: result.efficiency_multiplier
    }
    %{state | audit_log: [entry | state.audit_log]}
  end
end
```

### Paralelní orchestrace domén

Desetinásobná efektivita plyne z inteligentní paralelizace doménových operací:

```elixir
defmodule PrismaticAgents.SupremeCommander.ParallelOrchestrator do
  @moduledoc """
  Analyzes operation dependencies and maximizes parallelism
  across domain operations for order-of-magnitude efficiency gains.
  """

  @type dependency_graph :: %{atom() => [atom()]}

  @spec build_execution_plan(orchestration_request()) :: {:ok, [[atom()]]} | {:error, term()}
  def build_execution_plan(request) do
    graph = analyze_dependencies(request.domains)

    case detect_cycles(graph) do
      :no_cycles ->
        {:ok, topological_layers(graph)}

      {:cycle, path} ->
        {:error, {:dependency_cycle, path}}
    end
  end

  @spec execute_parallel(orchestration_request()) :: orchestration_result()
  def execute_parallel(request) do
    start_time = System.monotonic_time(:millisecond)

    case build_execution_plan(request) do
      {:ok, layers} ->
        results =
          Enum.reduce(layers, %{}, fn layer, acc ->
            layer_results =
              layer
              |> Task.async_stream(fn domain ->
                context = build_domain_context(domain, acc, request)
                {domain, execute_domain(domain, context)}
              end, max_concurrency: length(layer), timeout: 120_000)
              |> Enum.map(fn {:ok, result} -> result end)
              |> Map.new()

            Map.merge(acc, layer_results)
          end)

        end_time = System.monotonic_time(:millisecond)
        duration = end_time - start_time
        sequential_estimate = estimate_sequential_time(request.domains)
        efficiency = sequential_estimate / max(duration, 1)

        %{
          status: determine_status(results),
          phases_completed: map_size(results),
          phases_total: length(request.domains),
          duration_ms: duration,
          domain_results: results,
          efficiency_multiplier: Float.round(efficiency, 1)
        }

      {:error, reason} ->
        %{
          status: :failed,
          phases_completed: 0,
          phases_total: length(request.domains),
          duration_ms: 0,
          domain_results: %{},
          efficiency_multiplier: 0.0
        }
    end
  end

  defp topological_layers(graph) do
    do_topological_layers(graph, [], MapSet.new())
  end

  defp do_topological_layers(graph, layers, processed) do
    remaining = Map.drop(graph, MapSet.to_list(processed))

    if map_size(remaining) == 0 do
      Enum.reverse(layers)
    else
      layer =
        remaining
        |> Enum.filter(fn {_domain, deps} ->
          Enum.all?(deps, &MapSet.member?(processed, &1))
        end)
        |> Enum.map(fn {domain, _deps} -> domain end)

      new_processed = MapSet.union(processed, MapSet.new(layer))
      do_topological_layers(graph, [layer | layers], new_processed)
    end
  end
end
```

## Zpracování eskalací

Supreme Commander přijímá eskalace od agentů L4 Strategic Command, když operace přesáhnou jejich
rozsah:

```elixir
defmodule PrismaticAgents.SupremeCommander.EscalationHandler do
  @moduledoc """
  Handles escalations from L4 Strategic Command agents.
  Applies Supreme authority to resolve operations exceeding L4 scope.
  """

  require Logger

  @type escalation_type :: :authority_exceeded | :critical_infrastructure | :emergency_situation | :cross_domain_conflict

  @spec handle_escalation(map(), escalation_type()) :: {:ok, term()} | {:error, term()}
  def handle_escalation(operation, :authority_exceeded) do
    Logger.info("Supreme Commander: Handling authority escalation for #{operation.objective}")
    grant_temporary_authority(operation)
  end

  def handle_escalation(operation, :critical_infrastructure) do
    Logger.warning("Supreme Commander: Critical infrastructure operation - #{operation.objective}")
    with {:ok, _} <- verify_safety(operation),
         {:ok, _} <- create_rollback_point(operation),
         {:ok, result} <- execute_with_monitoring(operation) do
      {:ok, result}
    end
  end

  def handle_escalation(operation, :emergency_situation) do
    Logger.error("Supreme Commander: EMERGENCY escalation - #{operation.objective}")
    PrismaticAgents.ArcherSupreme.activate(operation)
  end

  def handle_escalation(operation, :cross_domain_conflict) do
    Logger.warning("Supreme Commander: Cross-domain conflict resolution - #{operation.objective}")
    with {:ok, assessment} <- assess_conflict(operation),
         {:ok, resolution} <- resolve_conflict(assessment),
         :ok <- notify_affected_agents(resolution) do
      {:ok, resolution}
    end
  end

  defp verify_safety(operation) do
    checks = [
      &check_supervision_tree_impact/1,
      &check_data_integrity_impact/1,
      &check_availability_impact/1,
      &check_security_posture_impact/1
    ]

    Enum.reduce_while(checks, {:ok, operation}, fn check, {:ok, op} ->
      case check.(op) do
        :safe -> {:cont, {:ok, op}}
        {:unsafe, reason} -> {:halt, {:error, {:safety_check_failed, reason}}}
      end
    end)
  end
end
```

## Koordinace více týmů

Supreme Commander koordinuje všechny [barevné týmy](@/glossary/color-teams.md) při bezpečnostních
operacích v celé platformě. Tato schopnost je vyhrazena pravomoci L5 – žádná nižší úroveň nemůže
řídit všech šest týmů současně:

```elixir
defmodule PrismaticAgents.SupremeCommander.ColorTeamCoordinator do
  @moduledoc """
  Coordinates all six Color Teams for platform-wide operations.
  Only L5 Supreme authority can orchestrate all teams simultaneously.
  """

  @type team_result :: {:ok, map()} | {:error, term()}

  @spec full_security_assessment() :: {:ok, map()} | {:error, term()}
  def full_security_assessment do
    gray = Task.async(fn -> PrismaticDark.Gray.Commander.explore() end)
    red = Task.async(fn -> PrismaticDark.Red.Commander.simulate() end)
    blue = Task.async(fn -> PrismaticDark.Blue.Commander.assess() end)
    white = Task.async(fn -> PrismaticDark.White.Commander.verify() end)
    black = Task.async(fn -> PrismaticDark.Black.Commander.model() end)

    results = %{
      gray: Task.await(gray, 120_000),
      red: Task.await(red, 120_000),
      blue: Task.await(blue, 120_000),
      white: Task.await(white, 120_000),
      black: Task.await(black, 120_000)
    }

    # Purple Team synthesizes all findings
    PrismaticDark.Purple.Coordinator.full_synthesis(results)
  end

  @spec targeted_assessment(atom(), keyword()) :: {:ok, map()} | {:error, term()}
  def targeted_assessment(focus_area, opts \\ []) do
    teams = select_teams_for_focus(focus_area)
    timeout = Keyword.get(opts, :timeout, 120_000)

    tasks = Enum.map(teams, fn {team, task_fn} ->
      {team, Task.async(task_fn)}
    end)

    results = Map.new(tasks, fn {team, task} ->
      {team, Task.await(task, timeout)}
    end)

    synthesize_targeted_results(focus_area, results)
  end

  defp select_teams_for_focus(:epistemic_security), do: [
    gray: fn -> PrismaticDark.Gray.Commander.explore() end,
    red: fn -> PrismaticDark.Red.Commander.simulate() end,
    blue: fn -> PrismaticDark.Blue.Commander.assess() end
  ]

  defp select_teams_for_focus(:formal_verification), do: [
    white: fn -> PrismaticDark.White.Commander.verify() end,
    blue: fn -> PrismaticDark.Blue.Commander.assess() end
  ]

  defp select_teams_for_focus(:threat_modeling), do: [
    black: fn -> PrismaticDark.Black.Commander.model() end,
    red: fn -> PrismaticDark.Red.Commander.simulate() end
  ]
end
```

## Architektura a implementace

### Pozice v hierarchii agentů

```
Supreme Commander (L5)          Archer Supreme (L5)
   |  [ongoing governance]          |  [crisis intervention]
   |                                |
   +-- L4 Strategic Command --------+
   |       |
   |       +-- L3 Team Commanders
   |       |       +-- L2 Specialists
   |       |       +-- L2 Specialists
   |       |
   |       +-- L3 Quality Leaders
   |               +-- L2 Domain Experts
   |
   +-- L4 Evolution Strategist
           +-- L3 SEADF Coordinators
                   +-- L2 Subsystem Workers
```

### Pravomoc přidělovat zdroje

| Zdroj | Rozpočet L4 | Rozpočet L5 |
|----------|----------|----------|
| souběžní agenti | až 20 | neomezeně |
| doba operace | až 1 týden | neomezeně |
| rozsah domén | až 4 domény | všech 115 aplikací |
| pravomoc přebít | L2–L3 v rámci rozsahu | všechny úrovně v celé platformě |
| obejití bran kvality | žádné | nouzové obejití s auditem |
| přístup k barevným týmům | jeden tým | všech 6 týmů současně |

### Auditní stopa

Všechna rozhodnutí Supreme Commandera se kvůli odpovědnosti zaznamenávají:

```elixir
defmodule PrismaticAgents.SupremeCommander.AuditLog do
  @moduledoc """
  Immutable audit trail for Supreme Commander decisions.
  Required by AIAD standard for L5 authority actions.
  """

  @type audit_entry :: %{
    id: String.t(),
    timestamp: DateTime.t(),
    action: atom(),
    objective: String.t(),
    domains_affected: [atom()],
    agents_coordinated: non_neg_integer(),
    result: atom(),
    duration_ms: non_neg_integer(),
    epistemic_compliance: boolean(),
    doctrine_compliance: boolean()
  }

  @spec log_decision(audit_entry()) :: :ok
  def log_decision(entry) do
    :telemetry.execute(
      [:prismatic, :supreme_commander, :audit],
      %{domains: length(entry.domains_affected), agents: entry.agents_coordinated},
      entry
    )

    persist_audit_entry(entry)
  end

  @spec query_audit_log(keyword()) :: {:ok, [audit_entry()]} | {:error, term()}
  def query_audit_log(filters \\ []) do
    since = Keyword.get(filters, :since, DateTime.add(DateTime.utc_now(), -7, :day))
    status = Keyword.get(filters, :status, :all)

    entries = load_audit_entries()
    |> Enum.filter(fn entry -> DateTime.compare(entry.timestamp, since) != :lt end)
    |> Enum.filter(fn entry -> status == :all or entry.result == status end)

    {:ok, entries}
  end
end
```

## Provozní vzory

### Životní cyklus orchestrace

Každá orchestrace Supreme Commandera prochází definovaným životním cyklem:

| Fáze | Trvání | Činnost | Ošetření selhání |
|-------|----------|----------|-----------------|
| **Plánování** | < 1 s | analýza závislostí, sestavení vrstev | odmítnout při zjištění cyklů |
| **Přidělení zdrojů** | < 1 s | rezervace slotů agentů a výpočetního výkonu | zařadit do fronty, nejsou-li zdroje |
| **Exekuce** | proměnlivé | paralelní doménové operace | opakování po doménách se záložním postupem |
| **Syntéza** | < 5 s | sběr a sloučení výsledků | přijmout dílčí výsledky |
| **Audit** | < 100 ms | zaznamenat rozhodnutí a výsledek | telemetrie „vystřel a zapomeň“ |

### Vzory zotavení ze selhání

Supreme Commander implementuje tři strategie zotavení ze selhání:

| Strategie | Spouštěč | Akce |
|----------|---------|--------|
| **Opakování domény** | selhání jedné domény | opakovat selhanou doménu až třikrát |
| **Částečné dokončení** | selhání více domén | přijmout úspěšné výsledky, ohlásit selhání |
| **Úplný návrat** | selhání kritické infrastruktury | spustit plán návratu, eskalovat k Archer Supreme |

## Užití v Prismatic Platform

### Aktivační příkazy

```bash
# Full platform orchestration
/orchestrate --objective="Deploy perimeter security improvements"

# Strategic coordination
/supreme-coordinator --scope=all-domains

# View orchestration status
/orchestrate --status

# Targeted domain orchestration
/orchestrate --objective="Quality improvement" --domains=quality,safety,testing
```

### Programové užití

```elixir
# Request orchestration
{:ok, result} = PrismaticAgents.SupremeCommander.orchestrate(%{
  objective: "Platform-wide quality improvement campaign",
  domains: [:quality, :safety, :testing, :ci, :perimeter],
  priority: :p1_high,
  constraints: %{max_duration: :timer.hours(4)},
  requestor: "session-2026-02-22"
})

# Check efficiency
IO.puts("Efficiency: #{result.efficiency_multiplier}x")
IO.puts("Completed: #{result.phases_completed}/#{result.phases_total}")
```

## Osvědčené postupy

1. **Vyhradit Supreme Commandera pro skutečně průřezové operace.** Operace jedné nebo dvou domén
   je lepší řešit na úrovních L3–L4. Nadužívání pravomoci L5 oslabuje její účinnost a vytváří
   zbytečnou auditní režii.
2. **U požadavků na orchestraci stanovit výslovná omezení.** Neohraničené operace mohou spotřebovávat
   zdroje platformy neomezeně dlouho. Vždy uvádět maximální dobu trvání a úroveň priority.
3. **Sledovat auditní stopu.** Rozhodnutí Supreme Commandera ovlivňují celou platformu. Pravidelný
   přezkum auditu zajišťuje, že rozhodnutí odpovídají strategickým cílům a souladu s doktrínou.
4. **Pro desetinásobnou efektivitu používat `/orchestrate`.** Paralelní orchestrační engine přináší
   největší hodnotu, když operace zahrnují více nezávislých domén, které mohou běžet souběžně.
5. **Odlišovat řízení od krizové reakce.** Supreme Commander zajišťuje průběžné řízení, Archer
   Supreme krize. Použití nesprávného agenta pro nesprávnou situaci vede buď k nedostatečné reakci
   na nouzi, nebo k přehnané reakci na rutinní operace.
6. **Upřednostňovat cílená posouzení před úplnými.** Funkce `targeted_assessment/2` umožňuje
   soustředit se na konkrétní bezpečnostní otázky bez mobilizace všech šesti barevných týmů.

## Časté chyby

- **Nadužívání nejvyšší pravomoci**: eskaluje-li se každá operace na L5, nemá koordinační hierarchie
  žádnou hodnotu. Většina operací má skončit na úrovních L2–L4.
- **Neuvedení omezení operace**: neomezené orchestrace mohou zasahovat do probíhající práce v celé
  platformě a spotřebovávat neomezené zdroje.
- **Přehlížení auditní stopy**: kroky Supreme Commandera mají dopad na celou platformu.
  Nepřezkoumané auditní stopy mohou skrývat systematické problémy v koordinačních rozhodnutích.
- **Zaměňování Supreme Commandera s Archer Supreme**: sdílejí pravomoc L5, ale slouží odlišným
  účelům. Použití Supreme Commandera pro krizovou reakci nebo Archer Supreme pro rutinní řízení
  nesladí schopnosti s potřebami.
- **Vynechávání bezpečnostních kontrol kvůli rychlosti**: i pod časovým tlakem musí bezpečnostní
  ověření předcházet operacím na kritické infrastruktuře. Plán návratu není volitelný.

## Související

**Pojmy platformy v tomto glosáři**

- [Archer Supreme](@/glossary/archer-supreme.md) – agent L5 zaměřený na krize.
- [Strategic Command](@/glossary/strategic-command.md) – koordinační úroveň L4.
- [Agent Tier](@/glossary/agent-tier.md) – úplná klasifikace L1–L5.
- [AIAD](@/glossary/aiad.md) – standard definic agentů.
- [Agent Registry](@/glossary/agent-registry.md) – katalog všech agentů.
- [Tactical Execution](@/glossary/tactical-execution.md) – specialisté L2 koordinovaní přes
  hierarchii.
- [NABLA Infinity](@/glossary/nabla-infinity.md), [Trinity Gate](@/glossary/trinity-gate.md) –
  epistemický rámec a ověřovací brána rozhodnutí s vysokými sázkami.

**Hesla a přehledy platformy mimo tuto knihu**

- [GenServer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/genserver/) – chování
  OTP, které proces Supreme Commandera implementuje.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/).

**Kniha**

- [Supreme Commander a detekce EA](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) –
  strategická koordinace detekce epistemických útoků.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: supreme-commander](@/kompendium/glossary-bridges/bridge-supreme-commander.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
