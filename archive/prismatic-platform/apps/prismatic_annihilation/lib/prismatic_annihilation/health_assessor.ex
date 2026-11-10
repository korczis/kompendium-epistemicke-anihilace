defmodule PrismaticAnnihilation.HealthAssessor do
  @moduledoc """
  Epistemic Health Assessment System.

  Evaluates the health and resilience of knowledge bases and belief systems
  against annihilation techniques. Identifies vulnerabilities and provides
  improvement recommendations.

  ## Assessment Dimensions

  1. **Structural Resilience** - Graph structure robustness
  2. **Logical Coherence** - Internal consistency strength
  3. **Source Diversity** - Independence of knowledge sources
  4. **Temporal Integrity** - Proper time-decay handling
  5. **Meta-Epistemic Awareness** - Self-knowledge capabilities

  ## Health Score Interpretation

  | Score | Status | Risk Level |
  |-------|--------|------------|
  | 0.9-1.0 | Excellent | Minimal vulnerability |
  | 0.7-0.89 | Good | Low vulnerability |
  | 0.5-0.69 | Fair | Moderate vulnerability |
  | 0.3-0.49 | Poor | High vulnerability |
  | 0.0-0.29 | Critical | Severe vulnerability |

  ## Usage

      # Assess knowledge base health
      {:ok, assessment} = HealthAssessor.assess(knowledge_base)

      # Detailed assessment with recommendations
      {:ok, assessment} = HealthAssessor.assess(kb, include_recommendations: true)

  """

  require Logger

  @type health_assessment :: %{
          overall_score: float(),
          status: atom(),
          dimensions: map(),
          vulnerabilities: [vulnerability()],
          recommendations: [recommendation()],
          timestamp: DateTime.t()
        }

  @type vulnerability :: %{
          dimension: atom(),
          severity: atom(),
          description: String.t(),
          attack_vectors: [atom()]
        }

  @type recommendation :: %{
          priority: non_neg_integer(),
          action: String.t(),
          expected_impact: float(),
          resources_required: [atom()]
        }

  # ===========================================================================
  # Public API
  # ===========================================================================

  @doc """
  Assesses epistemic health of a knowledge base.

  ## Parameters

  - `knowledge_base` - Knowledge structure to assess
  - `opts` - Assessment options:
    - `:depth` - Assessment depth (:quick, :standard, :comprehensive)
    - `:include_recommendations` - Include improvement recommendations
    - `:vulnerability_focus` - Focus on specific vulnerability types

  ## Returns

  - `{:ok, health_assessment()}` - Health assessment result
  - `{:error, reason}` - Assessment failed
  """
  @spec assess(term(), keyword()) :: {:ok, health_assessment()} | {:error, term()}
  def assess(knowledge_base, opts \\ []) do
    depth = Keyword.get(opts, :depth, :standard)
    include_recommendations = Keyword.get(opts, :include_recommendations, true)

    with {:ok, dimensions} <- assess_dimensions(knowledge_base, depth),
         {:ok, vulnerabilities} <- identify_vulnerabilities(dimensions),
         {:ok, recommendations} <-
           maybe_generate_recommendations(vulnerabilities, include_recommendations) do
      overall_score = calculate_overall_score(dimensions)

      {:ok,
       %{
         overall_score: overall_score,
         status: score_to_status(overall_score),
         dimensions: dimensions,
         vulnerabilities: vulnerabilities,
         recommendations: recommendations,
         timestamp: DateTime.utc_now()
       }}
    end
  end

  @doc """
  Quick health check returning just the overall score.
  """
  @spec quick_check(term()) :: {:ok, float()} | {:error, term()}
  def quick_check(knowledge_base) do
    case assess(knowledge_base, depth: :quick, include_recommendations: false) do
      {:ok, assessment} -> {:ok, assessment.overall_score}
      error -> error
    end
  end

  @doc """
  Identifies which annihilation techniques the knowledge base is most vulnerable to.
  """
  @spec vulnerability_profile(term()) :: {:ok, map()} | {:error, term()}
  def vulnerability_profile(knowledge_base) do
    with {:ok, assessment} <- assess(knowledge_base, depth: :comprehensive) do
      profile =
        assessment.vulnerabilities
        |> Enum.flat_map(& &1.attack_vectors)
        |> Enum.frequencies()
        |> Enum.sort_by(fn {_, count} -> -count end)
        |> Map.new()

      {:ok,
       %{
         most_vulnerable_to: Enum.take(profile, 5),
         vulnerability_distribution: profile,
         overall_resilience: assessment.overall_score
       }}
    end
  end

  # ===========================================================================
  # Private: Dimension Assessment
  # ===========================================================================

  defp assess_dimensions(knowledge_base, depth) do
    dimensions = %{
      structural_resilience: assess_structural_resilience(knowledge_base, depth),
      logical_coherence: assess_logical_coherence(knowledge_base, depth),
      source_diversity: assess_source_diversity(knowledge_base, depth),
      temporal_integrity: assess_temporal_integrity(knowledge_base, depth),
      meta_epistemic_awareness: assess_meta_epistemic_awareness(knowledge_base, depth)
    }

    {:ok, dimensions}
  end

  defp assess_structural_resilience(kb, _depth) do
    # Assess graph structure robustness
    base_score = 0.5

    # Check for knowledge structure
    has_structure = is_map(kb) and map_size(kb) > 0
    structure_bonus = if has_structure, do: 0.2, else: 0.0

    # Check for redundancy (multiple paths to key knowledge)
    redundancy_bonus = estimate_redundancy(kb)

    # Check for critical node concentration
    concentration_penalty = estimate_concentration_risk(kb)

    score = base_score + structure_bonus + redundancy_bonus - concentration_penalty

    %{
      score: clamp(score, 0.0, 1.0),
      factors: %{
        has_structure: has_structure,
        redundancy: redundancy_bonus,
        concentration_risk: concentration_penalty
      }
    }
  end

  defp assess_logical_coherence(kb, _depth) do
    base_score = 0.5

    # Check for explicit contradictions
    contradictions = count_contradictions(kb)
    contradiction_penalty = min(0.3, contradictions * 0.05)

    # Check for logical structure markers
    has_logic_markers = has_logical_structure?(kb)
    logic_bonus = if has_logic_markers, do: 0.2, else: 0.0

    score = base_score + logic_bonus - contradiction_penalty

    %{
      score: clamp(score, 0.0, 1.0),
      factors: %{
        contradictions: contradictions,
        has_logical_structure: has_logic_markers
      }
    }
  end

  defp assess_source_diversity(kb, _depth) do
    base_score = 0.5

    # Count unique sources
    sources = extract_sources(kb)
    source_count = length(sources)

    # Calculate diversity score
    diversity_bonus =
      cond do
        source_count >= 10 -> 0.4
        source_count >= 5 -> 0.3
        source_count >= 3 -> 0.2
        source_count >= 2 -> 0.1
        true -> 0.0
      end

    # Check for source independence
    independence_score = estimate_source_independence(sources)

    score = base_score + diversity_bonus * independence_score

    %{
      score: clamp(score, 0.0, 1.0),
      factors: %{
        source_count: source_count,
        independence_score: independence_score
      }
    }
  end

  defp assess_temporal_integrity(kb, _depth) do
    base_score = 0.5

    # Check for timestamps
    has_timestamps = has_temporal_markers?(kb)
    timestamp_bonus = if has_timestamps, do: 0.3, else: 0.0

    # Check for recency
    recency_score = estimate_recency(kb)
    recency_bonus = recency_score * 0.2

    score = base_score + timestamp_bonus + recency_bonus

    %{
      score: clamp(score, 0.0, 1.0),
      factors: %{
        has_timestamps: has_timestamps,
        recency_score: recency_score
      }
    }
  end

  defp assess_meta_epistemic_awareness(kb, _depth) do
    base_score = 0.4

    # Check for uncertainty markers
    has_uncertainty = has_uncertainty_markers?(kb)
    uncertainty_bonus = if has_uncertainty, do: 0.2, else: 0.0

    # Check for provenance tracking
    has_provenance = has_provenance_tracking?(kb)
    provenance_bonus = if has_provenance, do: 0.2, else: 0.0

    # Check for self-reflection capabilities
    has_meta = has_meta_knowledge?(kb)
    meta_bonus = if has_meta, do: 0.2, else: 0.0

    score = base_score + uncertainty_bonus + provenance_bonus + meta_bonus

    %{
      score: clamp(score, 0.0, 1.0),
      factors: %{
        has_uncertainty_markers: has_uncertainty,
        has_provenance: has_provenance,
        has_meta_knowledge: has_meta
      }
    }
  end

  # ===========================================================================
  # Private: Vulnerability Identification
  # ===========================================================================

  defp identify_vulnerabilities(dimensions) do
    vulnerabilities = []

    # Check structural vulnerabilities
    vulnerabilities =
      if dimensions.structural_resilience.score < 0.5 do
        [
          %{
            dimension: :structural_resilience,
            severity: severity_from_score(dimensions.structural_resilience.score),
            description:
              "Knowledge structure lacks redundancy and is vulnerable to cascading failures",
            attack_vectors: [:epistemic_imploze, :conceptual_nuclear_winter, :epistemic_black_hole]
          }
          | vulnerabilities
        ]
      else
        vulnerabilities
      end

    # Check logical vulnerabilities
    vulnerabilities =
      if dimensions.logical_coherence.score < 0.5 do
        [
          %{
            dimension: :logical_coherence,
            severity: severity_from_score(dimensions.logical_coherence.score),
            description:
              "Knowledge base contains logical inconsistencies exploitable by paradoxical attacks",
            attack_vectors: [
              :reflexivity_perversion,
              :anti_autoreferential_paradoxical_loop,
              :cognitive_anti_complementarity
            ]
          }
          | vulnerabilities
        ]
      else
        vulnerabilities
      end

    # Check source diversity vulnerabilities
    vulnerabilities =
      if dimensions.source_diversity.score < 0.5 do
        [
          %{
            dimension: :source_diversity,
            severity: severity_from_score(dimensions.source_diversity.score),
            description:
              "Over-reliance on limited sources makes system vulnerable to epistemic capture",
            attack_vectors: [
              :epistemic_delegitimization,
              :collective_epistemic_delegitimization,
              :semiotic_contamination
            ]
          }
          | vulnerabilities
        ]
      else
        vulnerabilities
      end

    # Check temporal vulnerabilities
    vulnerabilities =
      if dimensions.temporal_integrity.score < 0.5 do
        [
          %{
            dimension: :temporal_integrity,
            severity: severity_from_score(dimensions.temporal_integrity.score),
            description: "Lack of temporal tracking enables stale information attacks",
            attack_vectors: [:transnarrative_annihilation, :cognitive_anti_transformability]
          }
          | vulnerabilities
        ]
      else
        vulnerabilities
      end

    # Check meta-epistemic vulnerabilities
    vulnerabilities =
      if dimensions.meta_epistemic_awareness.score < 0.5 do
        [
          %{
            dimension: :meta_epistemic_awareness,
            severity: severity_from_score(dimensions.meta_epistemic_awareness.score),
            description: "Limited self-knowledge makes system vulnerable to meta-level attacks",
            attack_vectors: [
              :absolute_egological_disintegration,
              :transfinite_epistemic_regression,
              :hypertranscendental_negation
            ]
          }
          | vulnerabilities
        ]
      else
        vulnerabilities
      end

    {:ok, vulnerabilities}
  end

  defp severity_from_score(score) when score < 0.2, do: :critical
  defp severity_from_score(score) when score < 0.35, do: :high
  defp severity_from_score(score) when score < 0.5, do: :medium
  defp severity_from_score(_), do: :low

  # ===========================================================================
  # Private: Recommendation Generation
  # ===========================================================================

  defp maybe_generate_recommendations(_vulnerabilities, false), do: {:ok, []}

  defp maybe_generate_recommendations(vulnerabilities, true) do
    recommendations =
      vulnerabilities
      |> Enum.flat_map(&recommendations_for_vulnerability/1)
      |> Enum.sort_by(& &1.priority)
      |> Enum.take(10)

    {:ok, recommendations}
  end

  defp recommendations_for_vulnerability(%{dimension: :structural_resilience, severity: severity}) do
    priority = severity_to_priority(severity)

    [
      %{
        priority: priority,
        action:
          "Implement knowledge redundancy with multiple independent paths to critical information",
        expected_impact: 0.25,
        resources_required: [:knowledge_engineer, :graph_database]
      },
      %{
        priority: priority + 1,
        action: "Reduce critical node concentration by distributing key knowledge across structure",
        expected_impact: 0.2,
        resources_required: [:knowledge_engineer]
      }
    ]
  end

  defp recommendations_for_vulnerability(%{dimension: :logical_coherence, severity: severity}) do
    priority = severity_to_priority(severity)

    [
      %{
        priority: priority,
        action: "Resolve existing contradictions and implement consistency checking",
        expected_impact: 0.3,
        resources_required: [:logic_engine, :validator]
      },
      %{
        priority: priority + 1,
        action: "Add explicit logical structure markers (implications, dependencies)",
        expected_impact: 0.15,
        resources_required: [:knowledge_engineer]
      }
    ]
  end

  defp recommendations_for_vulnerability(%{dimension: :source_diversity, severity: severity}) do
    priority = severity_to_priority(severity)

    [
      %{
        priority: priority,
        action: "Diversify knowledge sources to include multiple independent authorities",
        expected_impact: 0.35,
        resources_required: [:research_analyst]
      },
      %{
        priority: priority + 1,
        action: "Implement source independence verification",
        expected_impact: 0.2,
        resources_required: [:validator]
      }
    ]
  end

  defp recommendations_for_vulnerability(%{dimension: :temporal_integrity, severity: severity}) do
    priority = severity_to_priority(severity)

    [
      %{
        priority: priority,
        action: "Add timestamps to all knowledge elements and implement time-decay",
        expected_impact: 0.25,
        resources_required: [:knowledge_engineer]
      }
    ]
  end

  defp recommendations_for_vulnerability(%{
         dimension: :meta_epistemic_awareness,
         severity: severity
       }) do
    priority = severity_to_priority(severity)

    [
      %{
        priority: priority,
        action: "Implement uncertainty quantification for all knowledge claims",
        expected_impact: 0.3,
        resources_required: [:uncertainty_engine]
      },
      %{
        priority: priority + 1,
        action: "Add provenance tracking for all knowledge elements",
        expected_impact: 0.2,
        resources_required: [:provenance_tracker]
      }
    ]
  end

  defp recommendations_for_vulnerability(_), do: []

  defp severity_to_priority(:critical), do: 1
  defp severity_to_priority(:high), do: 2
  defp severity_to_priority(:medium), do: 3
  defp severity_to_priority(:low), do: 4

  # ===========================================================================
  # Private: Scoring Helpers
  # ===========================================================================

  defp calculate_overall_score(dimensions) do
    weights = %{
      structural_resilience: 0.25,
      logical_coherence: 0.25,
      source_diversity: 0.2,
      temporal_integrity: 0.15,
      meta_epistemic_awareness: 0.15
    }

    dimensions
    |> Enum.map(fn {dim, data} ->
      weight = Map.get(weights, dim, 0.2)
      data.score * weight
    end)
    |> Enum.sum()
    |> Float.round(3)
  end

  defp score_to_status(score) when score >= 0.9, do: :excellent
  defp score_to_status(score) when score >= 0.7, do: :good
  defp score_to_status(score) when score >= 0.5, do: :fair
  defp score_to_status(score) when score >= 0.3, do: :poor
  defp score_to_status(_), do: :critical

  defp clamp(value, min_val, max_val) do
    value
    |> max(min_val)
    |> min(max_val)
  end

  # ===========================================================================
  # Private: Knowledge Base Analysis Helpers
  # ===========================================================================

  defp estimate_redundancy(kb) when is_map(kb) do
    # Estimate based on structure complexity
    size = map_size(kb)

    cond do
      size > 100 -> 0.2
      size > 50 -> 0.15
      size > 20 -> 0.1
      size > 5 -> 0.05
      true -> 0.0
    end
  end

  defp estimate_redundancy(_), do: 0.0

  defp estimate_concentration_risk(kb) when is_map(kb) do
    # Lower is better - check for over-reliance on few keys
    size = map_size(kb)
    if size < 3, do: 0.2, else: 0.0
  end

  defp estimate_concentration_risk(_), do: 0.1

  defp count_contradictions(kb) when is_map(kb) do
    # Check for explicit contradiction markers
    Map.get(kb, :contradictions, []) |> length()
  end

  defp count_contradictions(_), do: 0

  defp has_logical_structure?(kb) when is_map(kb) do
    Map.has_key?(kb, :rules) or Map.has_key?(kb, :implications) or Map.has_key?(kb, :axioms)
  end

  defp has_logical_structure?(_), do: false

  defp extract_sources(kb) when is_map(kb) do
    Map.get(kb, :sources, [])
  end

  defp extract_sources(_), do: []

  defp estimate_source_independence(sources) do
    if Enum.empty?(sources), do: 0.5, else: 0.8
  end

  defp has_temporal_markers?(kb) when is_map(kb) do
    Map.has_key?(kb, :timestamps) or Map.has_key?(kb, :created_at) or Map.has_key?(kb, :updated_at)
  end

  defp has_temporal_markers?(_), do: false

  defp estimate_recency(_kb), do: 0.5

  defp has_uncertainty_markers?(kb) when is_map(kb) do
    Map.has_key?(kb, :confidence) or Map.has_key?(kb, :uncertainty) or
      Map.has_key?(kb, :probability)
  end

  defp has_uncertainty_markers?(_), do: false

  defp has_provenance_tracking?(kb) when is_map(kb) do
    Map.has_key?(kb, :provenance) or Map.has_key?(kb, :sources) or Map.has_key?(kb, :origin)
  end

  defp has_provenance_tracking?(_), do: false

  defp has_meta_knowledge?(kb) when is_map(kb) do
    Map.has_key?(kb, :meta) or Map.has_key?(kb, :about) or Map.has_key?(kb, :self_model)
  end

  defp has_meta_knowledge?(_), do: false
end
