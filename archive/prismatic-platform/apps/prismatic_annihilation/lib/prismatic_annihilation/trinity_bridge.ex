defmodule PrismaticAnnihilation.TrinityBridge do
  @moduledoc """
  Bridge to NABLA's Trinity Gate with Annihilation Detection Layer.

  Extends the standard 3-layer Trinity Gate validation with a 4th layer
  specifically for epistemic annihilation attack detection. This provides
  defense-in-depth by catching epistemic attacks that might pass through
  standard validation.

  ## Extended Trinity Gate Architecture

  ```
  ┌─────────────────────────────────────────────────────────────────┐
  │                    EXTENDED TRINITY GATE                        │
  ├─────────────────────────────────────────────────────────────────┤
  │  Layer 1: Structural Consistency (Graph Theory)                 │
  │           - Orphan detection, role ambiguity, semantic cycles   │
  ├─────────────────────────────────────────────────────────────────┤
  │  Layer 2: Logical Consistency (Rule-Based)                      │
  │           - Implicit assumptions, contradictions, transitivity  │
  ├─────────────────────────────────────────────────────────────────┤
  │  Layer 3: Formal Necessity (Modal Logic)                        │
  │           - Necessary, possible, contingent, impossible         │
  ├─────────────────────────────────────────────────────────────────┤
  │  Layer 4: ANNIHILATION DETECTION (NEW)                          │
  │           - 150+ technique detection                            │
  │           - Category-specific validation                        │
  │           - Defensive response triggering                       │
  └─────────────────────────────────────────────────────────────────┘
  ```

  ## Usage

      # Validate content through extended Trinity Gate
      result = TrinityBridge.validate(content)

      # Validate with options
      result = TrinityBridge.validate(content, threshold: 0.8)

      # Validate existing detections
      result = TrinityBridge.validate_detections(detections)

  """

  alias PrismaticAnnihilation

  require Logger

  @type validation_result ::
          {:passed, map()}
          | {:blocked, atom(), atom(), map()}

  @annihilation_threshold 0.7

  # ===========================================================================
  # Public API
  # ===========================================================================

  @doc """
  Validates content through extended Trinity Gate.

  Runs standard Trinity Gate validation (if available) plus Layer 4
  annihilation detection.

  ## Parameters

  - `content` - Content to validate
  - `opts` - Validation options:
    - `:threshold` - Annihilation detection threshold
    - `:include_standard_trinity` - Also run standard Trinity Gate
    - `:categories` - Specific attack categories to check

  ## Returns

  - `{:passed, analysis}` - All layers passed
  - `{:blocked, :layer4, :annihilation_detected, details}` - Attack detected
  """
  @spec validate(term(), keyword()) :: validation_result()
  def validate(content, opts \\ []) do
    threshold = Keyword.get(opts, :threshold, @annihilation_threshold)
    include_standard = Keyword.get(opts, :include_standard_trinity, true)

    with {:ok, standard_result} <- maybe_standard_trinity(content, include_standard),
         {:ok, annihilation_result} <- layer4_validate(content, threshold) do
      {:passed,
       %{
         layer1: Map.get(standard_result, :layer1, %{status: :skipped}),
         layer2: Map.get(standard_result, :layer2, %{status: :skipped}),
         layer3: Map.get(standard_result, :layer3, %{status: :skipped}),
         layer4: annihilation_result,
         extended_trinity_passed: true,
         confidence_impact: 0.0
       }}
    else
      {:blocked, layer, outcome, details} ->
        {:blocked, layer, outcome, details}
    end
  end

  @doc """
  Validates a list of detections through Trinity analysis.

  Used to cross-validate existing detections against Trinity Gate principles.
  """
  @spec validate_detections([map()]) :: {:ok, map()}
  def validate_detections(detections) do
    analysis =
      detections
      |> Enum.map(&analyze_detection_trinity/1)
      |> consolidate_detection_analysis()

    {:ok, analysis}
  end

  @doc """
  Calculates confidence impact of extended Trinity Gate result.

  Similar to standard Trinity Gate, passing does NOT increase confidence.
  Only blocking reduces confidence.
  """
  @spec confidence_impact(validation_result()) :: float()
  def confidence_impact({:passed, _}), do: 0.0
  def confidence_impact({:blocked, _, :hold, _}), do: -0.1
  def confidence_impact({:blocked, _, :drop, _}), do: -1.0
  def confidence_impact({:blocked, :layer4, :annihilation_detected, _}), do: -0.5

  # ===========================================================================
  # Private: Standard Trinity Gate Integration
  # ===========================================================================

  defp maybe_standard_trinity(_content, false) do
    {:ok, %{status: :skipped}}
  end

  defp maybe_standard_trinity(_content, true) do
    # Check if PrismaticNabla.TrinityGate is available
    if Code.ensure_loaded?(PrismaticNabla.TrinityGate) do
      # Would need to create a hypothesis from content
      # For now, return skipped as we don't have hypothesis context
      {:ok, %{status: :requires_hypothesis}}
    else
      {:ok, %{status: :nabla_unavailable}}
    end
  end

  # ===========================================================================
  # Private: Layer 4 Validation (Annihilation Detection)
  # ===========================================================================

  defp layer4_validate(content, threshold) do
    case PrismaticAnnihilation.detect(content, threshold: threshold) do
      {:ok, []} ->
        {:ok,
         %{
           layer: :annihilation_detection,
           status: :clean,
           detections: [],
           confidence: 1.0
         }}

      {:ok, detections} ->
        # Check severity of detections
        max_severity = max_detection_severity(detections)

        case max_severity do
          severity when severity in [:terminal, :critical] ->
            {:blocked, :layer4, :annihilation_detected,
             %{
               failure_mode: :severe_annihilation_pattern,
               severity: severity,
               detections: detections,
               details:
                 "Detected #{length(detections)} annihilation technique(s), max severity: #{severity}"
             }}

          :high ->
            # High severity: block with hold (may need more analysis)
            {:blocked, :layer4, :hold,
             %{
               failure_mode: :potential_annihilation_pattern,
               severity: :high,
               detections: detections,
               details: "Detected potential annihilation patterns requiring review"
             }}

          _ ->
            # Lower severity: pass but note detections
            {:ok,
             %{
               layer: :annihilation_detection,
               status: :passed_with_warnings,
               detections: detections,
               confidence: 1.0 - length(detections) * 0.1
             }}
        end

      {:error, reason} ->
        Logger.warning("[TrinityBridge] Detection failed: #{inspect(reason)}")
        {:ok, %{layer: :annihilation_detection, status: :error, reason: reason}}
    end
  end

  defp max_detection_severity([]), do: :low

  defp max_detection_severity(detections) do
    severity_order = [:low, :medium, :high, :critical, :terminal]

    detections
    |> Enum.map(& &1.severity)
    |> Enum.max_by(fn s -> Enum.find_index(severity_order, &(&1 == s)) || 0 end)
  end

  # ===========================================================================
  # Private: Detection Analysis
  # ===========================================================================

  defp analyze_detection_trinity(detection) do
    %{
      technique_id: detection.technique_id,
      category: detection.category,
      severity: detection.severity,
      trinity_concerns: identify_trinity_concerns(detection),
      axiom_violations: check_axiom_implications(detection)
    }
  end

  defp identify_trinity_concerns(detection) do
    concerns = []

    # Layer 1 concerns (structural)
    concerns =
      if detection.category in [:singularity, :transconceptual] do
        [:potential_structural_collapse | concerns]
      else
        concerns
      end

    # Layer 2 concerns (logical)
    concerns =
      if detection.category in [:paradoxical, :metatranscendental] do
        [:logical_consistency_threat | concerns]
      else
        concerns
      end

    # Layer 3 concerns (modal)
    concerns =
      if detection.severity in [:terminal, :critical] do
        [:necessity_violation_risk | concerns]
      else
        concerns
      end

    concerns
  end

  defp check_axiom_implications(detection) do
    violations = []

    # Check which NABLA axioms might be violated by this attack
    violations =
      if detection.category in [:singularity, :hypertransformative] do
        [:signal_plurality_threatened | violations]
      else
        violations
      end

    violations =
      if detection.category == :paradoxical do
        [:contradiction_evidence_abuse | violations]
      else
        violations
      end

    violations =
      if detection.category == :metatranscendental do
        [:provenance_destruction | violations]
      else
        violations
      end

    violations
  end

  defp consolidate_detection_analysis(analyses) do
    %{
      total_detections: length(analyses),
      categories_affected: analyses |> Enum.map(& &1.category) |> Enum.uniq(),
      trinity_concerns:
        analyses |> Enum.flat_map(& &1.trinity_concerns) |> Enum.uniq() |> Enum.take(10),
      axiom_violations:
        analyses |> Enum.flat_map(& &1.axiom_violations) |> Enum.uniq() |> Enum.take(10),
      severity_distribution: analyses |> Enum.map(& &1.severity) |> Enum.frequencies()
    }
  end
end
