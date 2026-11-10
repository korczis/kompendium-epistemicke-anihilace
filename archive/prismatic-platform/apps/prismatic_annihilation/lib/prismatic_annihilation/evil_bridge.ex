defmodule PrismaticAnnihilation.EvilBridge do
  @moduledoc """
  Bridge to PrismaticEvil Dark Epistemic Research Framework.

  Correlates annihilation technique detections with PrismaticEvil's
  manipulation, deception, and cognitive warfare patterns to provide
  comprehensive epistemic threat analysis.

  ## Integration Points

  - `PrismaticEvil.DarkEpistemic` - Knowledge corruption correlation
  - `PrismaticEvil.CognitiveWarfare` - Cognitive attack mapping
  - `PrismaticEvil.Manipulation` - Manipulation technique cross-reference
  - `PrismaticEvil.Deception` - Deception pattern correlation

  ## Correlation Matrix

  | Annihilation Category | Evil Domain | Correlation Strength |
  |-----------------------|-------------|---------------------|
  | Singularity | DarkEpistemic | High |
  | Metatranscendental | DarkEpistemic | High |
  | Hypertransformative | CognitiveWarfare | Medium |
  | Paradoxical | Deception | High |
  | Transconceptual | Manipulation | Medium |

  ## Usage

      # Correlate detections with Evil patterns
      {:ok, correlation} = EvilBridge.correlate(detections)

      # Cross-reference specific technique
      {:ok, cross_ref} = EvilBridge.cross_reference(:epistemic_imploze)

  """

  require Logger

  @type correlation_result :: %{
          annihilation_detections: [map()],
          evil_correlations: [map()],
          combined_severity: atom(),
          threat_vectors: [atom()],
          recommended_response: atom()
        }

  # ===========================================================================
  # Category Mapping
  # ===========================================================================

  @category_domain_map %{
    singularity: [:dark_epistemic, :cognitive_warfare],
    metatranscendental: [:dark_epistemic],
    hypertransformative: [:cognitive_warfare, :manipulation],
    paradoxical: [:deception, :dark_epistemic],
    transconceptual: [:manipulation, :exploitation],
    academic_manipulation: [:manipulation, :deception],
    delegitimization: [:dark_epistemic, :manipulation]
  }

  @evil_technique_map %{
    epistemic_imploze: [
      :epistemic_closure,
      :reality_manipulation,
      :cognitive_overload
    ],
    ontological_annihilation: [
      :reality_manipulation,
      :truth_distortion,
      :source_poisoning
    ],
    cognitive_pandemonium: [
      :cognitive_overload,
      :attention_hijacking,
      :decision_paralysis
    ],
    axiological_annihilation: [
      :truth_distortion,
      :false_consensus
    ],
    reflexivity_perversion: [
      :metacognition_disruption,
      :gaslighting
    ],
    transnarrative_annihilation: [
      :reality_manipulation,
      :truth_distortion
    ]
  }

  # ===========================================================================
  # Public API
  # ===========================================================================

  @doc """
  Correlates annihilation detections with PrismaticEvil patterns.

  ## Parameters

  - `detections` - List of annihilation detections

  ## Returns

  - `{:ok, correlation_result()}` - Correlation analysis
  - `{:error, reason}` - Correlation failed
  """
  @spec correlate([map()]) :: {:ok, correlation_result()} | {:error, term()}
  def correlate(detections) do
    with {:ok, evil_correlations} <- find_evil_correlations(detections),
         {:ok, combined_analysis} <- analyze_combined_threat(detections, evil_correlations) do
      {:ok,
       %{
         annihilation_detections: detections,
         evil_correlations: evil_correlations,
         combined_severity: combined_analysis.severity,
         threat_vectors: combined_analysis.threat_vectors,
         recommended_response: combined_analysis.response,
         synergy_score: combined_analysis.synergy_score
       }}
    end
  end

  @doc """
  Cross-references a specific annihilation technique with Evil patterns.

  ## Parameters

  - `technique_id` - Annihilation technique identifier

  ## Returns

  - `{:ok, cross_reference}` - Cross-reference data
  - `{:error, reason}` - Cross-reference failed
  """
  @spec cross_reference(atom()) :: {:ok, map()} | {:error, term()}
  def cross_reference(technique_id) do
    evil_techniques = Map.get(@evil_technique_map, technique_id, [])

    cross_ref = %{
      annihilation_technique: technique_id,
      related_evil_techniques: evil_techniques,
      correlation_domains: get_domains_for_technique(technique_id),
      combined_indicators: build_combined_indicators(technique_id, evil_techniques)
    }

    {:ok, cross_ref}
  end

  @doc """
  Gets Evil domains relevant to an annihilation category.
  """
  @spec domains_for_category(atom()) :: [atom()]
  def domains_for_category(category) do
    Map.get(@category_domain_map, category, [:dark_epistemic])
  end

  @doc """
  Checks if PrismaticEvil is available for integration.
  """
  @spec evil_available?() :: boolean()
  def evil_available? do
    Code.ensure_loaded?(PrismaticEvil)
  end

  # ===========================================================================
  # Private: Correlation Engine
  # ===========================================================================

  defp find_evil_correlations(detections) do
    correlations =
      detections
      |> Enum.map(fn detection ->
        %{
          annihilation_technique: detection.technique_id,
          category: detection.category,
          domains: domains_for_category(detection.category),
          evil_patterns: find_related_evil_patterns(detection),
          correlation_confidence: calculate_correlation_confidence(detection)
        }
      end)

    {:ok, correlations}
  end

  defp find_related_evil_patterns(detection) do
    # Get mapped evil techniques
    direct_mappings = Map.get(@evil_technique_map, detection.technique_id, [])

    # Add domain-based patterns
    domain_patterns =
      detection.category
      |> domains_for_category()
      |> Enum.flat_map(&patterns_for_domain/1)

    (direct_mappings ++ domain_patterns) |> Enum.uniq() |> Enum.take(10)
  end

  defp patterns_for_domain(:dark_epistemic) do
    [
      :epistemic_closure,
      :truth_distortion,
      :reality_manipulation,
      :knowledge_suppression,
      :false_consensus,
      :source_poisoning
    ]
  end

  defp patterns_for_domain(:cognitive_warfare) do
    [
      :cognitive_overload,
      :attention_hijacking,
      :decision_paralysis,
      :bias_exploitation,
      :metacognition_disruption
    ]
  end

  defp patterns_for_domain(:manipulation) do
    [
      :social_proof_manufacturing,
      :authority_exploitation,
      :reciprocity_weaponization,
      :scarcity_fabrication
    ]
  end

  defp patterns_for_domain(:deception) do
    [
      :gaslighting,
      :strategic_ambiguity,
      :paltering,
      :omission_strategies
    ]
  end

  defp patterns_for_domain(:exploitation) do
    [
      :trust_exploitation,
      :emotional_vulnerability,
      :information_asymmetry,
      :power_differential
    ]
  end

  defp patterns_for_domain(_), do: []

  defp calculate_correlation_confidence(detection) do
    base =
      if Map.has_key?(@evil_technique_map, detection.technique_id) do
        0.85
      else
        0.6
      end

    # Boost for high-severity detections
    severity_boost =
      case detection.severity do
        :terminal -> 0.1
        :critical -> 0.05
        _ -> 0.0
      end

    min(0.95, base + severity_boost)
  end

  # ===========================================================================
  # Private: Combined Threat Analysis
  # ===========================================================================

  defp analyze_combined_threat(detections, correlations) do
    # Calculate synergy score (how much annihilation and evil patterns reinforce each other)
    synergy_score = calculate_synergy(detections, correlations)

    # Determine combined severity
    severity = determine_combined_severity(detections, synergy_score)

    # Identify threat vectors
    threat_vectors = identify_threat_vectors(detections, correlations)

    # Recommend response level
    response = recommend_response(severity, synergy_score)

    {:ok,
     %{
       severity: severity,
       threat_vectors: threat_vectors,
       response: response,
       synergy_score: synergy_score
     }}
  end

  defp calculate_synergy(detections, correlations) do
    if Enum.empty?(detections) or Enum.empty?(correlations) do
      0.0
    else
      # Count overlapping patterns
      total_correlations =
        correlations
        |> Enum.map(fn c -> length(c.evil_patterns) end)
        |> Enum.sum()

      # Normalize to 0-1 scale
      min(1.0, total_correlations / (length(detections) * 5))
    end
  end

  defp determine_combined_severity(detections, synergy_score) do
    base_severity =
      detections
      |> Enum.map(& &1.severity)
      |> max_severity()

    # Synergy can escalate severity
    cond do
      synergy_score > 0.8 and base_severity == :critical -> :terminal
      synergy_score > 0.6 and base_severity == :high -> :critical
      synergy_score > 0.4 and base_severity == :medium -> :high
      true -> base_severity
    end
  end

  defp max_severity([]), do: :low

  defp max_severity(severities) do
    order = [:low, :medium, :high, :critical, :terminal]

    severities
    |> Enum.max_by(fn s -> Enum.find_index(order, &(&1 == s)) || 0 end)
  end

  defp identify_threat_vectors(detections, correlations) do
    vectors = []

    # Check for multi-domain attacks
    domains =
      correlations
      |> Enum.flat_map(& &1.domains)
      |> Enum.uniq()

    vectors = if length(domains) > 2, do: [:multi_domain_attack | vectors], else: vectors

    # Check for category diversity
    categories =
      detections
      |> Enum.map(& &1.category)
      |> Enum.uniq()

    vectors =
      if length(categories) > 2,
        do: [:coordinated_multi_category | vectors],
        else: vectors

    # Check for high-severity concentration
    high_severity =
      detections
      |> Enum.count(&(&1.severity in [:critical, :terminal]))

    vectors =
      if high_severity > 2, do: [:severe_attack_concentration | vectors], else: vectors

    vectors
  end

  defp recommend_response(severity, synergy_score) do
    cond do
      severity == :terminal -> :emergency_defense
      severity == :critical or synergy_score > 0.7 -> :active_defense
      severity == :high or synergy_score > 0.5 -> :heightened_monitoring
      severity == :medium -> :standard_monitoring
      true -> :passive_monitoring
    end
  end

  # ===========================================================================
  # Private: Helpers
  # ===========================================================================

  defp get_domains_for_technique(technique_id) do
    # Get technique's category first
    case PrismaticAnnihilation.Taxonomy.get(technique_id) do
      nil -> [:dark_epistemic]
      technique -> domains_for_category(technique.category)
    end
  end

  defp build_combined_indicators(technique_id, evil_techniques) do
    # Build combined detection indicators
    annihilation_indicators =
      case PrismaticAnnihilation.Taxonomy.get(technique_id) do
        nil -> []
        technique -> technique.detection_patterns
      end

    evil_indicators =
      evil_techniques
      |> Enum.flat_map(&evil_technique_indicators/1)

    %{
      annihilation: annihilation_indicators,
      evil: evil_indicators,
      combined: Enum.uniq(annihilation_indicators ++ evil_indicators)
    }
  end

  defp evil_technique_indicators(:epistemic_closure) do
    ["filter bubble", "echo chamber", "confirmation bias", "selective exposure"]
  end

  defp evil_technique_indicators(:reality_manipulation) do
    ["alternative facts", "reality distortion", "perception manipulation"]
  end

  defp evil_technique_indicators(:cognitive_overload) do
    ["information flood", "decision fatigue", "analysis paralysis"]
  end

  defp evil_technique_indicators(:gaslighting) do
    ["questioning reality", "memory manipulation", "self-doubt induction"]
  end

  defp evil_technique_indicators(_), do: []
end
