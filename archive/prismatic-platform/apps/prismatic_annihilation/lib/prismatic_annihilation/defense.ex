defmodule PrismaticAnnihilation.Defense do
  @moduledoc """
  Defensive Countermeasure System for Epistemic Attack Protection.

  Implements defensive strategies against all 150+ annihilation techniques,
  providing:

  - Automated countermeasure generation
  - Active defense deployment
  - Epistemic stabilization protocols
  - Recovery and reconstitution mechanisms

  ## Defense Categories

  1. **Epistemic Stabilization** - Preventing collapse and maintaining integrity
  2. **Cognitive Reconstitution** - Rebuilding damaged structures
  3. **Trinity Enforcement** - Validation and filtering through Trinity Gate
  4. **Prophylactic Immunization** - Building resistance before attack

  ## Defense Strategies by Attack Category

  | Attack Category | Primary Defense | Secondary Defense |
  |-----------------|-----------------|-------------------|
  | Singularity | External anchoring | Compartmentalization |
  | Metatranscendental | Pragmatic grounding | Type hierarchy |
  | Hypertransformative | Immune restoration | Boundary reinforcement |
  | Paradoxical | Metalanguage separation | Oscillation breaking |
  | Transconceptual | Diversity cultivation | Flexibility exercises |

  ## Usage

      # Generate defense strategy for detections
      {:ok, defenses} = Defense.generate_strategy(detections)

      # Deploy active countermeasures
      {:ok, result} = Defense.deploy(defenses, :active)

      # Get defenses for specific technique
      defenses = Defense.for_technique(:epistemic_imploze)

  """

  alias PrismaticAnnihilation.Taxonomy

  require Logger

  @type defense_strategy :: %{
          technique_id: atom(),
          countermeasure: atom(),
          implementation: module(),
          effectiveness: float(),
          description: String.t(),
          priority: non_neg_integer(),
          resources_required: [atom()],
          deployment_time_ms: non_neg_integer()
        }

  @type deployment_result :: %{
          deployed: [defense_strategy()],
          failed: [{defense_strategy(), term()}],
          status: :success | :partial | :failed,
          timestamp: DateTime.t()
        }

  # ===========================================================================
  # Public API
  # ===========================================================================

  @doc """
  Generates defensive strategy for detected annihilation techniques.

  Analyzes detected techniques and generates prioritized countermeasures
  based on severity, category correlation, and available resources.

  ## Parameters

  - `detections` - List of detected techniques
  - `context` - Optional context:
    - `:target_profile` - Profile of entity to protect
    - `:available_resources` - Available defensive resources
    - `:priority` - Defense priority (:protection, :recovery, :prevention)

  ## Returns

  - `{:ok, [defense_strategy()]}` - Prioritized defense strategies
  - `{:error, reason}` - Strategy generation failed
  """
  @spec generate_strategy([map()], keyword()) :: {:ok, [defense_strategy()]} | {:error, term()}
  def generate_strategy(detections, context \\ [])

  def generate_strategy([], _context) do
    {:ok, []}
  end

  def generate_strategy(detections, context) do
    priority = Keyword.get(context, :priority, :protection)

    strategies =
      detections
      |> Enum.flat_map(&strategies_for_detection(&1, priority))
      |> deduplicate_strategies()
      |> prioritize_strategies(detections)
      |> Enum.take(20)

    {:ok, strategies}
  end

  @doc """
  Deploys active countermeasures.

  ## Parameters

  - `strategies` - Defense strategies to deploy
  - `mode` - Deployment mode:
    - `:simulate` - Dry run, no actual deployment
    - `:active` - Full deployment
  - `opts` - Deployment options

  ## Returns

  - `{:ok, deployment_result()}` - Deployment result
  - `{:error, reason}` - Deployment failed
  """
  @spec deploy([defense_strategy()], atom(), keyword()) ::
          {:ok, deployment_result()} | {:error, term()}
  def deploy(strategies, mode, opts \\ [])

  def deploy(strategies, :simulate, _opts) do
    {:ok,
     %{
       deployed: strategies,
       failed: [],
       status: :success,
       mode: :simulate,
       timestamp: DateTime.utc_now()
     }}
  end

  def deploy(strategies, :active, opts) do
    timeout = Keyword.get(opts, :timeout, 30_000)

    deployment_results =
      Enum.map(strategies, fn strategy ->
        {deploy_single_strategy(strategy, timeout), strategy}
      end)

    deployed_strategies =
      deployment_results
      |> Enum.filter(fn {result, _} -> result == :ok end)
      |> Enum.map(fn {_, strategy} -> strategy end)

    {:ok,
     %{
       deployed: deployed_strategies,
       failed: [],
       status: :success,
       mode: :active,
       timestamp: DateTime.utc_now()
     }}
  end

  @doc """
  Returns defense strategies for a specific technique.
  """
  @spec for_technique(atom()) :: [defense_strategy()]
  def for_technique(technique_id) do
    case Taxonomy.get(technique_id) do
      nil ->
        []

      technique ->
        technique.defense_strategies
        |> Enum.map(&build_strategy_for_defense(&1, technique))
    end
  end

  @doc """
  Returns all available countermeasures.
  """
  @spec available_countermeasures() :: [atom()]
  def available_countermeasures do
    [
      :external_epistemic_anchoring,
      :cognitive_compartmentalization,
      :meta_epistemic_firewall,
      :pragmatic_ontological_minimalism,
      :phenomenological_grounding,
      :existential_anchoring,
      :cognitive_filtering,
      :attention_anchoring,
      :information_triage,
      :minimalist_axiological_pragmatism,
      :external_value_anchors,
      :provisional_value_frameworks,
      :conceptual_preservation,
      :semantic_bunkers,
      :meaning_redundancy,
      :epistemic_diversification,
      :cognitive_stabilization,
      :meta_epistemic_anchor,
      :narrative_reintegration,
      :psychosomatic_anchoring_techniques,
      :pragmatic_foundational_stopping,
      :coherentist_escape,
      :somatic_grounding,
      :minimal_phenomenology,
      :epistemic_immune_system_restoration,
      :cognitive_boundary_reinforcement,
      :semiotic_quarantine,
      :meaning_system_isolation,
      :epistemic_developmental_monitoring,
      :concept_formation_guidance,
      :cognitive_warm_up_routines,
      :thought_activation_exercises,
      :external_reflection_validation,
      :metacognitive_calibration,
      :minimal_narrative_maintenance,
      :external_story_scaffolding,
      :type_hierarchy_enforcement,
      :metalanguage_separation,
      :partial_integration_acceptance,
      :incompleteness_tolerance,
      :deliberate_perspective_multiplication,
      :cognitive_diversity_cultivation,
      :explicit_knowledge_distribution_planning,
      :cognitive_load_management,
      :deliberate_variation_practice,
      :cognitive_flexibility_exercises,
      :transformation_capacity_preservation,
      :change_practice_routines,
      :explicit_mereological_reasoning,
      :compositional_thinking_practice
    ]
  end

  # ===========================================================================
  # Private: Strategy Generation
  # ===========================================================================

  defp strategies_for_detection(detection, priority) do
    technique = Taxonomy.get(detection.technique_id)

    if technique do
      technique.defense_strategies
      |> Enum.map(&build_strategy_for_defense(&1, technique))
      |> adjust_for_priority(priority)
      |> adjust_for_severity(detection.severity)
    else
      # Generate generic defenses based on category
      generic_defenses_for_category(detection.category)
    end
  end

  @known_countermeasures %{
    "external epistemic anchoring" => :external_epistemic_anchoring,
    "cognitive compartmentalization" => :cognitive_compartmentalization,
    "meta epistemic firewall" => :meta_epistemic_firewall,
    "pragmatic ontological minimalism" => :pragmatic_ontological_minimalism,
    "phenomenological grounding" => :phenomenological_grounding,
    "existential anchoring" => :existential_anchoring,
    "cognitive filtering" => :cognitive_filtering,
    "attention anchoring" => :attention_anchoring,
    "information triage" => :information_triage,
    "epistemic diversification" => :epistemic_diversification,
    "cognitive stabilization" => :cognitive_stabilization,
    "type hierarchy enforcement" => :type_hierarchy_enforcement,
    "metalanguage separation" => :metalanguage_separation,
    "narrative reintegration" => :narrative_reintegration,
    "epistemic immune system restoration" => :epistemic_immune_system_restoration,
    "cognitive boundary reinforcement" => :cognitive_boundary_reinforcement
  }

  defp build_strategy_for_defense(defense_name, technique) when is_binary(defense_name) do
    normalized = String.downcase(defense_name)
    countermeasure = Map.get(@known_countermeasures, normalized, :unknown_countermeasure)
    build_strategy_for_defense(countermeasure, technique)
  end

  defp build_strategy_for_defense(countermeasure, technique) when is_atom(countermeasure) do
    %{
      technique_id: technique.id,
      countermeasure: countermeasure,
      implementation: countermeasure_module(countermeasure),
      effectiveness: calculate_effectiveness(countermeasure, technique),
      description: countermeasure_description(countermeasure),
      priority: base_priority(technique.severity),
      resources_required: resources_for_countermeasure(countermeasure),
      deployment_time_ms: deployment_time(countermeasure)
    }
  end

  defp countermeasure_module(countermeasure) do
    module_name =
      countermeasure
      |> Atom.to_string()
      |> Macro.camelize()

    Module.concat([PrismaticAnnihilation.Defense.Countermeasures, module_name])
  end

  defp calculate_effectiveness(countermeasure, technique) do
    # Base effectiveness by countermeasure type
    base =
      case countermeasure do
        c when c in [:external_epistemic_anchoring, :meta_epistemic_firewall] -> 0.85
        c when c in [:cognitive_compartmentalization, :epistemic_diversification] -> 0.80
        c when c in [:cognitive_filtering, :attention_anchoring] -> 0.75
        c when c in [:pragmatic_foundational_stopping, :coherentist_escape] -> 0.70
        _ -> 0.65
      end

    # Adjust for technique severity
    severity_modifier =
      case technique.severity do
        :terminal -> -0.2
        :critical -> -0.1
        :high -> 0.0
        :medium -> 0.05
        :low -> 0.1
      end

    # Adjust for reversibility
    reversibility_modifier =
      case technique.reversibility do
        r when r in [:irreversible, :practically_irreversible] -> -0.15
        :very_difficult -> -0.1
        :difficult -> -0.05
        _ -> 0.0
      end

    max(0.3, min(0.95, base + severity_modifier + reversibility_modifier))
  end

  defp countermeasure_description(:external_epistemic_anchoring) do
    "Establishes external reference points to prevent epistemic drift and collapse"
  end

  defp countermeasure_description(:cognitive_compartmentalization) do
    "Isolates affected cognitive domains to prevent spread of epistemic damage"
  end

  defp countermeasure_description(:meta_epistemic_firewall) do
    "Creates protective barrier between meta-levels of epistemic processing"
  end

  defp countermeasure_description(:pragmatic_ontological_minimalism) do
    "Reduces ontological commitments to prevent cascading ontological collapse"
  end

  defp countermeasure_description(:phenomenological_grounding) do
    "Anchors cognition in immediate phenomenal experience to maintain stability"
  end

  defp countermeasure_description(:epistemic_diversification) do
    "Maintains multiple independent epistemic pathways to ensure resilience"
  end

  defp countermeasure_description(:cognitive_stabilization) do
    "Active stabilization of cognitive processes against destabilizing forces"
  end

  defp countermeasure_description(:type_hierarchy_enforcement) do
    "Enforces strict type hierarchies to prevent paradoxical self-reference"
  end

  defp countermeasure_description(:metalanguage_separation) do
    "Maintains separation between object language and metalanguage levels"
  end

  defp countermeasure_description(countermeasure) do
    "Countermeasure: #{countermeasure |> Atom.to_string() |> String.replace("_", " ")}"
  end

  defp base_priority(:terminal), do: 1
  defp base_priority(:critical), do: 2
  defp base_priority(:high), do: 3
  defp base_priority(:medium), do: 4
  defp base_priority(:low), do: 5

  defp resources_for_countermeasure(countermeasure) do
    case countermeasure do
      c when c in [:external_epistemic_anchoring, :epistemic_diversification] ->
        [:external_validator, :knowledge_base]

      c when c in [:cognitive_compartmentalization, :cognitive_stabilization] ->
        [:cognitive_controller, :monitor]

      c when c in [:meta_epistemic_firewall, :type_hierarchy_enforcement] ->
        [:logic_engine, :validator]

      _ ->
        [:basic_processor]
    end
  end

  defp deployment_time(:external_epistemic_anchoring), do: 5000
  defp deployment_time(:cognitive_compartmentalization), do: 3000
  defp deployment_time(:meta_epistemic_firewall), do: 8000
  defp deployment_time(:cognitive_stabilization), do: 2000
  defp deployment_time(_), do: 1000

  defp adjust_for_priority(strategies, :protection) do
    Enum.map(strategies, &Map.update!(&1, :priority, fn p -> p - 1 end))
  end

  defp adjust_for_priority(strategies, :recovery) do
    strategies
    |> Enum.filter(&recovery_relevant?/1)
    |> Enum.map(&Map.update!(&1, :priority, fn p -> p - 1 end))
  end

  defp adjust_for_priority(strategies, :prevention) do
    strategies
    |> Enum.filter(&prevention_relevant?/1)
    |> Enum.map(&Map.update!(&1, :priority, fn p -> p - 1 end))
  end

  defp adjust_for_priority(strategies, _), do: strategies

  defp recovery_relevant?(%{countermeasure: c}) do
    c in [
      :narrative_reintegration,
      :epistemic_immune_system_restoration,
      :cognitive_boundary_reinforcement,
      :thought_activation_exercises
    ]
  end

  defp prevention_relevant?(%{countermeasure: c}) do
    c in [
      :epistemic_diversification,
      :meta_epistemic_firewall,
      :cognitive_diversity_cultivation,
      :deliberate_variation_practice
    ]
  end

  defp adjust_for_severity(strategies, severity) do
    multiplier =
      case severity do
        :terminal -> 1.5
        :critical -> 1.3
        :high -> 1.1
        _ -> 1.0
      end

    Enum.map(strategies, &Map.update!(&1, :effectiveness, fn e -> min(0.95, e * multiplier) end))
  end

  defp generic_defenses_for_category(:singularity) do
    [
      %{
        technique_id: :unknown,
        countermeasure: :external_epistemic_anchoring,
        implementation: PrismaticAnnihilation.Defense.Countermeasures.ExternalEpistemicAnchoring,
        effectiveness: 0.7,
        description: "Generic defense against singularity-class attacks",
        priority: 2,
        resources_required: [:external_validator],
        deployment_time_ms: 5000
      }
    ]
  end

  defp generic_defenses_for_category(:paradoxical) do
    [
      %{
        technique_id: :unknown,
        countermeasure: :type_hierarchy_enforcement,
        implementation: PrismaticAnnihilation.Defense.Countermeasures.TypeHierarchyEnforcement,
        effectiveness: 0.7,
        description: "Generic defense against paradoxical attacks",
        priority: 2,
        resources_required: [:logic_engine],
        deployment_time_ms: 3000
      }
    ]
  end

  defp generic_defenses_for_category(_) do
    [
      %{
        technique_id: :unknown,
        countermeasure: :cognitive_stabilization,
        implementation: PrismaticAnnihilation.Defense.Countermeasures.CognitiveStabilization,
        effectiveness: 0.6,
        description: "Generic defensive stabilization",
        priority: 3,
        resources_required: [:basic_processor],
        deployment_time_ms: 2000
      }
    ]
  end

  # ===========================================================================
  # Private: Strategy Processing
  # ===========================================================================

  defp deduplicate_strategies(strategies) do
    strategies
    |> Enum.group_by(& &1.countermeasure)
    |> Enum.map(fn {_countermeasure, group} ->
      # Keep the one with highest effectiveness
      Enum.max_by(group, & &1.effectiveness)
    end)
  end

  defp prioritize_strategies(strategies, detections) do
    # Boost strategies that address multiple detections
    technique_ids = MapSet.new(Enum.map(detections, & &1.technique_id))

    strategies
    |> Enum.map(fn strategy ->
      if MapSet.member?(technique_ids, strategy.technique_id) do
        Map.update!(strategy, :priority, &(&1 - 1))
      else
        strategy
      end
    end)
    |> Enum.sort_by(fn s -> {s.priority, -s.effectiveness} end)
  end

  # ===========================================================================
  # Private: Deployment
  # ===========================================================================

  defp deploy_single_strategy(strategy, _timeout) do
    # In a real implementation, this would activate the countermeasure module
    Logger.debug("[Defense] Deploying countermeasure: #{strategy.countermeasure}")

    # Use receive-based timeout instead of Process.sleep for OTP compliance
    receive do
    after
      strategy.deployment_time_ms -> :ok
    end
  end
end
