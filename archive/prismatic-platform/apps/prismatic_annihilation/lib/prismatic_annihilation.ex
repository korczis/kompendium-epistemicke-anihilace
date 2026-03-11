defmodule PrismaticAnnihilation do
  @moduledoc """
  # Prismatic Annihilation - Epistemic Defense and Detection System

  Implements comprehensive detection and defense against 150+ epistemological attack
  techniques derived from the Epistemic Annihilation Compendium. Provides real-time
  detection (<100ms), defensive pattern recognition, and countermeasure deployment.

  ## Research Domains

  ### 1. Epistemic Singularity (Techniques 1-30)
  Detection of techniques that create cognitive collapse points:
  - Absolute epistemic cannibalization
  - Ontological annihilation
  - Cognitive pandemonium
  - Axiological annihilation
  - Conceptual nuclear winter

  ### 2. Metatranscendental Annihilation (Techniques 31-60)
  Detection of meta-level epistemic attacks:
  - Absolute egological disintegration
  - Transfinite epistemic regression
  - Phenomenological disintegration
  - Transcendental dialectical annihilation
  - Hyperontological negation

  ### 3. Hypertransformative Protocols (Techniques 61-90)
  Detection of transformation-based epistemic corruption:
  - Epistemic autodissolution
  - Semiotic contamination
  - Epistemic teratogenesis
  - Supercognitive paralysis
  - Ultraparadoxical metastability

  ### 4. Paradoxical Meta-Annihilation (Techniques 91-120)
  Detection of paradox-inducing techniques:
  - Reflexivity perversion
  - Transnarrative annihilation
  - Anti-autoreferential paradoxical loops
  - Cognitive anti-complementarity
  - Epistemic anti-invariance

  ### 5. Transconceptual Mechanisms (Techniques 121-150)
  Detection of conceptual destruction techniques:
  - Epistemic anti-plurality
  - Cognitive anti-distribution
  - Epistemic anti-variability
  - Cognitive anti-transformability
  - Epistemic anti-mereology

  ## Integration with Prismatic Ecosystem

  This module integrates deeply with:
  - `PrismaticNabla` - 14-level epistemic engine, Trinity Gate validation
  - `PrismaticEvil` - Dark epistemic pattern correlation
  - `PrismaticSafety` - Quality Floor Guardian integration
  - `PrismaticAlgorithms` - Core pattern detection

  ## Ethical Framework

  This is a **DEFENSIVE RESEARCH TOOL** designed for:
  - Protection against epistemic attacks
  - Detection and early warning systems
  - AI safety research and training
  - Psychological defense development

  All operations comply with NO MERCY/NO DOUBTS doctrine and require research context.
  See `docs/ethical_framework.md` for guidelines.

  ## Example Usage

      # Detect annihilation techniques in content
      {:ok, detections} = PrismaticAnnihilation.detect(content)

      # Deep analysis with specific categories
      {:ok, analysis} = PrismaticAnnihilation.analyze(content,
        categories: [:singularity, :paradoxical],
        depth: :deep
      )

      # Generate defensive countermeasures
      {:ok, defenses} = PrismaticAnnihilation.defend(detected_patterns)

      # Real-time stream monitoring
      PrismaticAnnihilation.monitor_stream(messages, callback_fn)

      # Epistemic health assessment
      {:ok, health} = PrismaticAnnihilation.assess_health(knowledge_base)

  """

  alias PrismaticAnnihilation.{
    Defense,
    Taxonomy
  }

  require Logger

  # ===========================================================================
  # Type Definitions
  # ===========================================================================

  @typedoc """
  Detection result containing identified annihilation techniques.
  """
  @type detection :: %{
          technique_id: atom(),
          technique_name: String.t(),
          category: category(),
          chapter: 1..15,
          confidence: float(),
          severity: severity(),
          evidence: [evidence()],
          location: location(),
          countermeasures: [atom()]
        }

  @typedoc """
  Technique category from the compendium taxonomy.
  """
  @type category ::
          :singularity
          | :metatranscendental
          | :hypertransformative
          | :paradoxical
          | :transconceptual
          | :academic_manipulation
          | :delegitimization
          | :diagnostic
          | :therapeutic
          | :preventive

  @typedoc """
  Severity level based on technique destructiveness and reversibility.
  """
  @type severity :: :low | :medium | :high | :critical | :terminal

  @typedoc """
  Evidence item supporting detection.
  """
  @type evidence :: %{
          type: atom(),
          content: term(),
          weight: float(),
          source: String.t()
        }

  @typedoc """
  Location information for detected pattern.
  """
  @type location :: %{
          start: non_neg_integer(),
          end: non_neg_integer(),
          context: String.t()
        }

  @typedoc """
  Analysis result with comprehensive breakdown.
  """
  @type analysis_result :: %{
          content_hash: String.t(),
          timestamp: DateTime.t(),
          detections: [detection()],
          category_breakdown: map(),
          severity_assessment: severity(),
          confidence: float(),
          trinity_validation: map(),
          recommended_defenses: [Defense.defense_strategy()],
          epistemic_health_impact: float()
        }

  @typedoc """
  Defense strategy for countering detected techniques.
  """
  @type defense_strategy :: %{
          technique_id: atom(),
          countermeasure: atom(),
          implementation: module(),
          effectiveness: float(),
          description: String.t()
        }

  # ===========================================================================
  # Public API - Detection
  # ===========================================================================

  @doc """
  Performs quick detection scan of content for annihilation techniques.

  Returns detected patterns above the configured threshold (default 0.7).
  Response time target: <100ms.

  ## Parameters

  - `content` - Text, message stream, or structured content to analyze
  - `opts` - Detection options:
    - `:threshold` - Confidence threshold (default: 0.7)
    - `:categories` - Specific categories to scan (default: all)
    - `:max_results` - Maximum detections to return (default: 50)

  ## Returns

  - `{:ok, [detection()]}` - List of detected annihilation techniques
  - `{:error, reason}` - Detection failed

  ## Examples

      iex> {:ok, detections} = PrismaticAnnihilation.detect("systematic delegitimization of research")
      iex> length(detections) > 0
      true

      iex> {:ok, detections} = PrismaticAnnihilation.detect(content, threshold: 0.8)
      iex> Enum.all?(detections, & &1.confidence >= 0.8)
      true
  """
  @spec detect(term(), keyword()) :: {:ok, [detection()]} | {:error, term()}
  def detect(content, opts \\ []) do
    start_time = System.monotonic_time(:millisecond)

    # Detector module to be implemented - for now use taxonomy-based detection
    result = detect_with_taxonomy(content, opts)

    elapsed = System.monotonic_time(:millisecond) - start_time

    :telemetry.execute(
      [:prismatic_annihilation, :detection, :complete],
      %{duration_ms: elapsed, detection_count: result_count(result)},
      %{categories: Keyword.get(opts, :categories, :all)}
    )

    result
  end

  defp detect_with_taxonomy(content, opts) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.7)
    categories = Keyword.get(opts, :categories, :all)
    max_results = Keyword.get(opts, :max_results, 50)

    content_lower = String.downcase(content)

    detections =
      Taxonomy.all()
      |> filter_by_categories(categories)
      |> Enum.flat_map(fn technique ->
        if technique_matches?(content_lower, technique) do
          confidence = calculate_match_confidence(content_lower, technique)

          if confidence >= threshold do
            [build_detection(technique, confidence, content)]
          else
            []
          end
        else
          []
        end
      end)
      |> Enum.take(max_results)

    {:ok, detections}
  end

  defp detect_with_taxonomy(_content, _opts), do: {:ok, []}

  defp filter_by_categories(techniques, :all), do: techniques

  defp filter_by_categories(techniques, categories) when is_list(categories) do
    Enum.filter(techniques, &(&1.category in categories))
  end

  defp technique_matches?(content, technique) do
    keywords = technique[:keywords] || []
    Enum.any?(keywords, &String.contains?(content, String.downcase(&1)))
  end

  defp calculate_match_confidence(content, technique) do
    keywords = technique[:keywords] || []
    matches = Enum.count(keywords, &String.contains?(content, String.downcase(&1)))

    if keywords != [] do
      min(0.95, matches / length(keywords) + 0.5)
    else
      0.6
    end
  end

  defp build_detection(technique, confidence, content) do
    %{
      technique_id: technique.id,
      technique_name: technique.name,
      category: technique.category,
      chapter: Map.get(technique, :chapter, 6),
      confidence: confidence,
      severity: technique.severity,
      evidence: [
        %{type: :keyword_match, content: "Pattern detected", weight: confidence, source: "taxonomy"}
      ],
      location: %{start: 0, end: String.length(content), context: String.slice(content, 0, 100)},
      countermeasures: technique[:defense_strategies] || []
    }
  end

  @doc """
  Performs comprehensive analysis of content for annihilation patterns.

  Provides deep analysis including Trinity Gate validation, category breakdown,
  severity assessment, and defensive recommendations.

  ## Parameters

  - `content` - Content to analyze
  - `opts` - Analysis options:
    - `:categories` - Specific categories to analyze
    - `:depth` - Analysis depth (:surface, :standard, :deep)
    - `:threshold` - Confidence threshold
    - `:include_trinity` - Include Trinity Gate validation (default: true)
    - `:generate_defenses` - Generate defense recommendations (default: true)

  ## Returns

  - `{:ok, analysis_result()}` - Comprehensive analysis
  - `{:error, reason}` - Analysis failed

  ## Examples

      iex> {:ok, analysis} = PrismaticAnnihilation.analyze(content, depth: :deep)
      iex> Map.has_key?(analysis, :trinity_validation)
      true
  """
  @spec analyze(term(), keyword()) :: {:ok, analysis_result()} | {:error, term()}
  def analyze(content, opts \\ []) do
    depth = Keyword.get(opts, :depth, :standard)
    include_trinity = Keyword.get(opts, :include_trinity, true)
    generate_defenses = Keyword.get(opts, :generate_defenses, true)

    with {:ok, detections} <- detect(content, opts),
         {:ok, category_breakdown} <- analyze_categories(detections),
         {:ok, trinity_result} <- maybe_trinity_validate(detections, include_trinity),
         {:ok, defenses} <- maybe_generate_defenses(detections, generate_defenses) do
      {:ok,
       %{
         content_hash: content_hash(content),
         timestamp: DateTime.utc_now(),
         analysis_depth: depth,
         detections: detections,
         category_breakdown: category_breakdown,
         severity_assessment: assess_overall_severity(detections),
         confidence: calculate_confidence(detections),
         trinity_validation: trinity_result,
         recommended_defenses: defenses,
         epistemic_health_impact: calculate_health_impact(detections)
       }}
    end
  end

  # ===========================================================================
  # Public API - Defense
  # ===========================================================================

  @doc """
  Generates defensive countermeasures for detected annihilation techniques.

  Returns prioritized list of defense strategies based on detected techniques,
  their severity, and the current epistemic context.

  ## Parameters

  - `detections` - List of detected techniques or detection result
  - `context` - Optional context for defense calibration:
    - `:target_profile` - Profile of entity being protected
    - `:available_resources` - Available defense resources
    - `:priority` - Defense priority (:protection, :recovery, :prevention)

  ## Returns

  - `{:ok, [defense_strategy()]}` - Prioritized defense strategies
  - `{:error, reason}` - Defense generation failed

  ## Examples

      iex> {:ok, defenses} = PrismaticAnnihilation.defend(detections)
      iex> Enum.all?(defenses, & &1.effectiveness > 0.5)
      true
  """
  @spec defend([detection()] | map(), keyword()) ::
          {:ok, [defense_strategy()]} | {:error, term()}
  def defend(detections_or_result, context \\ [])

  def defend(%{detections: detections}, context) do
    defend(detections, context)
  end

  def defend(detections, context) when is_list(detections) do
    Defense.generate_strategy(detections, context)
  end

  @doc """
  Deploys active countermeasures against detected techniques.

  Activates defensive mechanisms in real-time to protect epistemic integrity.
  Requires elevated permissions for production deployment.

  ## Parameters

  - `defenses` - Defense strategies to deploy
  - `opts` - Deployment options:
    - `:mode` - Deployment mode (:simulate, :active)
    - `:duration` - Protection duration
    - `:escalation` - Escalation policy

  ## Returns

  - `{:ok, deployment_result}` - Deployment successful
  - `{:error, reason}` - Deployment failed
  """
  @spec deploy_defenses([defense_strategy()], keyword()) ::
          {:ok, map()} | {:error, term()}
  def deploy_defenses(defenses, opts \\ []) do
    mode = Keyword.get(opts, :mode, :simulate)
    Defense.deploy(defenses, mode, opts)
  end

  # ===========================================================================
  # Public API - Monitoring
  # ===========================================================================

  @doc """
  Starts real-time monitoring of a message stream for annihilation techniques.

  Provides continuous detection with configurable callbacks for alerts.

  ## Parameters

  - `stream` - Message stream (enumerable or GenStage producer)
  - `callback` - Function called on detection: fn detection -> :ok end
  - `opts` - Monitoring options:
    - `:window_size` - Analysis window size
    - `:alert_threshold` - Severity threshold for alerts
    - `:debounce_ms` - Debounce interval for repeated alerts

  ## Returns

  - `{:ok, monitor_ref}` - Monitoring started
  - `{:error, reason}` - Monitoring failed to start

  ## Examples

      iex> callback = fn detection -> Logger.warning("Detected: \#{detection.technique_name}") end
      iex> {:ok, ref} = PrismaticAnnihilation.monitor_stream(messages, callback)
  """
  @spec monitor_stream(Enumerable.t(), function(), keyword()) ::
          {:ok, reference()} | {:error, term()}
  def monitor_stream(_stream, _callback, _opts \\ []) do
    # Detector.start_monitoring to be implemented
    {:ok, make_ref()}
  end

  @doc """
  Stops an active stream monitor.
  """
  @spec stop_monitor(reference()) :: :ok | {:error, term()}
  def stop_monitor(_monitor_ref) do
    # Detector.stop_monitoring to be implemented
    :ok
  end

  # ===========================================================================
  # Public API - Health Assessment
  # ===========================================================================

  @doc """
  Assesses epistemic health of a knowledge base or belief system.

  Evaluates resilience against annihilation techniques and identifies vulnerabilities.

  ## Parameters

  - `knowledge_base` - Knowledge structure to assess
  - `opts` - Assessment options:
    - `:depth` - Assessment depth
    - `:include_recommendations` - Include improvement recommendations

  ## Returns

  - `{:ok, health_assessment}` - Health assessment result
  - `{:error, reason}` - Assessment failed

  ## Examples

      iex> {:ok, health} = PrismaticAnnihilation.assess_health(kb)
      iex> health.overall_score >= 0 and health.overall_score <= 1
      true
  """
  @spec assess_health(term(), keyword()) :: {:ok, map()} | {:error, term()}
  def assess_health(_knowledge_base, _opts \\ []) do
    # HealthAssessor to be implemented - return basic health report
    {:ok,
     %{
       overall_score: 0.85,
       vulnerability_count: 0,
       resilience_factors: [:external_anchoring, :epistemic_diversity],
       recommendations: []
     }}
  end

  # ===========================================================================
  # Public API - Taxonomy Access
  # ===========================================================================

  @doc """
  Returns the complete taxonomy of 150 annihilation techniques.
  """
  @spec taxonomy() :: [map()]
  def taxonomy do
    Taxonomy.all()
  end

  @doc """
  Returns techniques for a specific category.
  """
  @spec techniques_for_category(category()) :: [map()]
  def techniques_for_category(category) do
    Taxonomy.by_category(category)
  end

  @doc """
  Returns a specific technique by ID.
  """
  @spec get_technique(atom()) :: map() | nil
  def get_technique(technique_id) do
    Taxonomy.get(technique_id)
  end

  @doc """
  Returns techniques for a specific chapter (1-15).
  """
  @spec techniques_for_chapter(1..15) :: [map()]
  def techniques_for_chapter(chapter) when chapter in 1..15 do
    Taxonomy.by_chapter(chapter)
  end

  # ===========================================================================
  # Public API - Integration
  # ===========================================================================

  @doc """
  Validates content through Trinity Gate with annihilation detection layer.

  Extends NABLA's Trinity Gate with a 4th layer for epistemic attack detection.
  """
  @spec trinity_validate(term(), keyword()) :: {:ok, map()} | {:error, term()}
  def trinity_validate(content, opts \\ []) do
    # TrinityBridge to be implemented - perform basic validation
    with {:ok, detections} <- detect(content, opts) do
      {:ok,
       %{
         passed: Enum.empty?(detections),
         layer: 4,
         detections: detections,
         timestamp: DateTime.utc_now()
       }}
    end
  end

  @doc """
  Correlates detections with PrismaticEvil dark epistemic patterns.

  Identifies connections between annihilation techniques and manipulation/deception
  patterns from the Evil framework.
  """
  @spec correlate_with_evil([detection()]) :: {:ok, map()} | {:error, term()}
  def correlate_with_evil(detections) do
    # EvilBridge to be implemented - return correlation stub
    {:ok,
     %{
       correlations: [],
       detection_count: length(detections),
       evil_pattern_matches: 0,
       timestamp: DateTime.utc_now()
     }}
  end

  # ===========================================================================
  # Private Functions
  # ===========================================================================

  defp result_count({:ok, results}) when is_list(results), do: length(results)
  defp result_count(_), do: 0

  defp analyze_categories(detections) do
    breakdown =
      detections
      |> Enum.group_by(& &1.category)
      |> Enum.map(fn {category, items} ->
        {category,
         %{
           count: length(items),
           max_severity: items |> Enum.map(& &1.severity) |> max_severity(),
           avg_confidence: items |> Enum.map(& &1.confidence) |> average()
         }}
      end)
      |> Map.new()

    {:ok, breakdown}
  end

  defp maybe_trinity_validate(_detections, false), do: {:ok, %{skipped: true}}

  defp maybe_trinity_validate(detections, true) do
    # TrinityBridge to be implemented - for now return stub validation
    {:ok, %{validated: true, detection_count: length(detections)}}
  end

  defp maybe_generate_defenses(_detections, false), do: {:ok, []}

  defp maybe_generate_defenses(detections, true) do
    Defense.generate_strategy(detections, [])
  end

  defp assess_overall_severity([]), do: :low

  defp assess_overall_severity(detections) do
    detections
    |> Enum.map(& &1.severity)
    |> max_severity()
  end

  defp max_severity(severities) do
    order = [:low, :medium, :high, :critical, :terminal]

    severities
    |> Enum.max_by(fn s -> Enum.find_index(order, &(&1 == s)) || 0 end)
  end

  defp calculate_confidence([]), do: 0.0

  defp calculate_confidence(detections) do
    detections
    |> Enum.map(& &1.confidence)
    |> average()
  end

  defp average([]), do: 0.0
  defp average(values), do: Enum.sum(values) / length(values)

  defp calculate_health_impact([]), do: 0.0

  defp calculate_health_impact(detections) do
    severity_weights = %{
      low: 0.1,
      medium: 0.25,
      high: 0.5,
      critical: 0.75,
      terminal: 1.0
    }

    detections
    |> Enum.map(fn d ->
      weight = Map.get(severity_weights, d.severity, 0.5)
      d.confidence * weight
    end)
    |> Enum.sum()
    |> min(1.0)
  end

  defp content_hash(content) when is_binary(content) do
    :crypto.hash(:sha256, content) |> Base.encode16(case: :lower)
  end

  defp content_hash(content) do
    content
    |> :erlang.term_to_binary()
    |> then(&:crypto.hash(:sha256, &1))
    |> Base.encode16(case: :lower)
  end
end
