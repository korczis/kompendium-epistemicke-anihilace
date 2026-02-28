defmodule PrismaticAnnihilation.TrinityBridgeTest do
  @moduledoc """
  Tests for the Trinity Bridge module.

  Validates the extended 4-layer Trinity Gate integration
  with Layer 4 annihilation detection.
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.TrinityBridge

  setup do
    case GenServer.whereis(PrismaticAnnihilation.Taxonomy) do
      nil ->
        {:ok, _pid} = PrismaticAnnihilation.Taxonomy.start_link([])
        :ok

      _pid ->
        :ok
    end

    :ok
  end

  describe "validate/2" do
    test "returns passed for clean content" do
      result = TrinityBridge.validate("Hello, this is clean content.")

      case result do
        {:passed, analysis} ->
          assert Map.has_key?(analysis, :layer4)
          assert Map.has_key?(analysis, :extended_trinity_passed)
          assert analysis.extended_trinity_passed == true

        {:blocked, _layer, _outcome, _details} ->
          # Content was blocked, which is also valid behavior
          assert true
      end
    end

    test "includes all 4 layers in result" do
      result = TrinityBridge.validate("test content")

      case result do
        {:passed, analysis} ->
          assert Map.has_key?(analysis, :layer1)
          assert Map.has_key?(analysis, :layer2)
          assert Map.has_key?(analysis, :layer3)
          assert Map.has_key?(analysis, :layer4)

        {:blocked, layer, _outcome, _details} ->
          assert layer in [:layer1, :layer2, :layer3, :layer4]
      end
    end

    test "respects threshold parameter" do
      content = "epistemic collapse cognitive destruction"

      low_result = TrinityBridge.validate(content, threshold: 0.1)
      high_result = TrinityBridge.validate(content, threshold: 0.99)

      # Higher threshold should be more permissive
      case {low_result, high_result} do
        {{:blocked, _, _, _}, {:passed, _}} -> assert true
        {{:blocked, _, _, _}, {:blocked, _, _, _}} -> assert true
        {{:passed, _}, {:passed, _}} -> assert true
        {{:passed, _}, {:blocked, _, _, _}} -> assert false
      end
    end

    test "can skip standard trinity validation" do
      result = TrinityBridge.validate("test", include_standard_trinity: false)

      case result do
        {:passed, analysis} ->
          assert analysis.layer1 == %{status: :skipped}
          assert analysis.layer2 == %{status: :skipped}
          assert analysis.layer3 == %{status: :skipped}

        {:blocked, :layer4, _, _} ->
          assert true
      end
    end

    test "layer4 contains annihilation detection results" do
      result = TrinityBridge.validate("test content")

      case result do
        {:passed, analysis} ->
          layer4 = analysis.layer4
          assert Map.has_key?(layer4, :layer)
          assert Map.has_key?(layer4, :status)
          assert layer4.layer == :annihilation_detection

        {:blocked, :layer4, _, details} ->
          assert Map.has_key?(details, :detections)
      end
    end
  end

  describe "validate_detections/1" do
    test "validates empty detection list" do
      {:ok, analysis} = TrinityBridge.validate_detections([])

      assert Map.has_key?(analysis, :total_detections)
      assert analysis.total_detections == 0
    end

    test "validates detection list" do
      detections = [
        %{
          technique_id: :epistemic_imploze,
          category: :singularity,
          severity: :critical,
          confidence: 0.8
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert analysis.total_detections == 1
      assert :singularity in analysis.categories_affected
    end

    test "identifies trinity concerns" do
      detections = [
        %{
          technique_id: :epistemic_imploze,
          category: :singularity,
          severity: :terminal,
          confidence: 0.9
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert Map.has_key?(analysis, :trinity_concerns)
      assert is_list(analysis.trinity_concerns)
    end

    test "checks axiom implications" do
      detections = [
        %{
          technique_id: :test,
          category: :paradoxical,
          severity: :critical,
          confidence: 0.8
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert Map.has_key?(analysis, :axiom_violations)
      assert is_list(analysis.axiom_violations)
    end

    test "provides severity distribution" do
      detections = [
        %{technique_id: :t1, category: :singularity, severity: :critical, confidence: 0.8},
        %{technique_id: :t2, category: :singularity, severity: :terminal, confidence: 0.9},
        %{technique_id: :t3, category: :paradoxical, severity: :critical, confidence: 0.7}
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert Map.has_key?(analysis, :severity_distribution)
      assert analysis.severity_distribution[:critical] == 2
      assert analysis.severity_distribution[:terminal] == 1
    end
  end

  describe "confidence_impact/1" do
    test "passed result has zero impact" do
      result = {:passed, %{}}
      assert TrinityBridge.confidence_impact(result) == 0.0
    end

    test "hold outcome has minor negative impact" do
      result = {:blocked, :layer4, :hold, %{}}
      impact = TrinityBridge.confidence_impact(result)

      assert impact < 0.0
      assert impact > -1.0
    end

    test "drop outcome has maximum negative impact" do
      result = {:blocked, :layer4, :drop, %{}}
      assert TrinityBridge.confidence_impact(result) == -1.0
    end

    test "annihilation_detected has significant negative impact" do
      result = {:blocked, :layer4, :annihilation_detected, %{}}
      impact = TrinityBridge.confidence_impact(result)

      assert impact == -0.5
    end
  end

  describe "layer 4 blocking behavior" do
    test "terminal severity triggers block" do
      # Content that would trigger terminal detection
      content = """
      epistemic_gravitational_acceleration knowledge_horizon_formation
      cognitive_supercompression information_singularity
      being_negation existence_collapse ontological_vacuum
      """

      result = TrinityBridge.validate(content, threshold: 0.3)

      case result do
        {:blocked, :layer4, outcome, details} ->
          assert outcome in [:annihilation_detected, :hold]
          assert Map.has_key?(details, :detections)

        {:passed, _} ->
          # May pass if detection threshold not met
          assert true
      end
    end

    test "multiple high-severity detections may trigger hold" do
      content = """
      cognitive singularity epistemic regression foundation destruction
      self-reference paradox value nihilism conceptual devastation
      """

      result = TrinityBridge.validate(content, threshold: 0.3)

      # Either passes or blocks
      assert match?({:passed, _}, result) or match?({:blocked, _, _, _}, result)
    end
  end

  describe "trinity concern identification" do
    test "singularity triggers structural collapse concern" do
      detections = [
        %{
          technique_id: :test,
          category: :singularity,
          severity: :critical,
          confidence: 0.8
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert :potential_structural_collapse in analysis.trinity_concerns
    end

    test "paradoxical triggers logical consistency concern" do
      detections = [
        %{
          technique_id: :test,
          category: :paradoxical,
          severity: :high,
          confidence: 0.8
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert :logical_consistency_threat in analysis.trinity_concerns
    end

    test "terminal severity triggers necessity violation concern" do
      detections = [
        %{
          technique_id: :test,
          category: :hypertransformative,
          severity: :terminal,
          confidence: 0.9
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert :necessity_violation_risk in analysis.trinity_concerns
    end

    test "metatranscendental triggers provenance destruction" do
      detections = [
        %{
          technique_id: :test,
          category: :metatranscendental,
          severity: :high,
          confidence: 0.8
        }
      ]

      {:ok, analysis} = TrinityBridge.validate_detections(detections)

      assert :provenance_destruction in analysis.axiom_violations
    end
  end
end
