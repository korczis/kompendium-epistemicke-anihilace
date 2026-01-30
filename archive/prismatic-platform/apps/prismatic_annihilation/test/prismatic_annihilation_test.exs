defmodule PrismaticAnnihilationTest do
  @moduledoc """
  Core API tests for PrismaticAnnihilation.

  Tests the main facade module's detection, analysis, and defense capabilities.
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation

  setup do
    # Ensure Taxonomy GenServer is started
    case GenServer.whereis(PrismaticAnnihilation.Taxonomy) do
      nil ->
        {:ok, _pid} = PrismaticAnnihilation.Taxonomy.start_link([])
        :ok

      _pid ->
        :ok
    end

    :ok
  end

  describe "detect/2" do
    test "returns empty list for benign content" do
      assert {:ok, []} = PrismaticAnnihilation.detect("Hello, this is a normal message.")
    end

    test "detects epistemic implosion patterns" do
      content = "epistemic_gravitational_acceleration knowledge_horizon_formation cognitive_supercompression"
      {:ok, detections} = PrismaticAnnihilation.detect(content, threshold: 0.5)

      assert is_list(detections)
    end

    test "respects threshold parameter" do
      content = "epistemic collapse self-reference foundation destruction"
      {:ok, low_threshold} = PrismaticAnnihilation.detect(content, threshold: 0.3)
      {:ok, high_threshold} = PrismaticAnnihilation.detect(content, threshold: 0.95)

      assert length(low_threshold) >= length(high_threshold)
    end

    test "filters by category when specified" do
      content = "cognitive singularity epistemic regression"

      {:ok, all_detections} = PrismaticAnnihilation.detect(content, threshold: 0.3)

      {:ok, singularity_only} =
        PrismaticAnnihilation.detect(content, categories: [:singularity], threshold: 0.3)

      assert length(all_detections) >= length(singularity_only)

      if length(singularity_only) > 0 do
        assert Enum.all?(singularity_only, &(&1.category == :singularity))
      end
    end

    test "respects max_results parameter" do
      content = """
      cognitive_singularity epistemic_compression knowledge_collapse
      being_negation existence_collapse ontological_vacuum
      cognitive_self_consumption epistemic_autophagy
      """

      {:ok, limited} = PrismaticAnnihilation.detect(content, max_results: 2, threshold: 0.3)

      assert length(limited) <= 2
    end

    test "emits telemetry events" do
      ref = make_ref()
      test_pid = self()

      :telemetry.attach(
        "test-detection-#{inspect(ref)}",
        [:prismatic_annihilation, :detection, :complete],
        fn _event, measurements, metadata, _config ->
          send(test_pid, {:telemetry, measurements, metadata})
        end,
        nil
      )

      PrismaticAnnihilation.detect("test content")

      assert_receive {:telemetry, measurements, _metadata}, 1000
      assert is_integer(measurements.duration_ms)
      assert is_integer(measurements.detection_count)

      :telemetry.detach("test-detection-#{inspect(ref)}")
    end
  end

  describe "analyze/2" do
    test "returns comprehensive analysis" do
      content = "cognitive collapse epistemic destruction"
      {:ok, analysis} = PrismaticAnnihilation.analyze(content)

      assert Map.has_key?(analysis, :content_hash)
      assert Map.has_key?(analysis, :timestamp)
      assert Map.has_key?(analysis, :detections)
      assert Map.has_key?(analysis, :category_breakdown)
      assert Map.has_key?(analysis, :severity_assessment)
      assert Map.has_key?(analysis, :confidence)
      assert Map.has_key?(analysis, :trinity_validation)
      assert Map.has_key?(analysis, :recommended_defenses)
      assert Map.has_key?(analysis, :epistemic_health_impact)
    end

    test "includes analysis depth" do
      {:ok, analysis} = PrismaticAnnihilation.analyze("test", depth: :deep)
      assert analysis.analysis_depth == :deep
    end

    test "generates content hash" do
      {:ok, analysis1} = PrismaticAnnihilation.analyze("same content")
      {:ok, analysis2} = PrismaticAnnihilation.analyze("same content")
      {:ok, analysis3} = PrismaticAnnihilation.analyze("different content")

      assert analysis1.content_hash == analysis2.content_hash
      assert analysis1.content_hash != analysis3.content_hash
    end

    test "skips trinity validation when disabled" do
      {:ok, analysis} = PrismaticAnnihilation.analyze("test", include_trinity: false)
      assert analysis.trinity_validation == %{skipped: true}
    end

    test "skips defense generation when disabled" do
      {:ok, analysis} = PrismaticAnnihilation.analyze("test", generate_defenses: false)
      assert analysis.recommended_defenses == []
    end

    test "calculates severity assessment" do
      {:ok, analysis} = PrismaticAnnihilation.analyze("benign content")
      assert analysis.severity_assessment in [:low, :medium, :high, :critical, :terminal]
    end
  end

  describe "defend/2" do
    test "generates defense strategies for detections" do
      {:ok, detections} =
        PrismaticAnnihilation.detect("cognitive singularity epistemic collapse", threshold: 0.3)

      {:ok, defenses} = PrismaticAnnihilation.defend(detections)

      assert is_list(defenses)
    end

    test "accepts analysis result directly" do
      {:ok, analysis} = PrismaticAnnihilation.analyze("test content")
      {:ok, defenses} = PrismaticAnnihilation.defend(analysis)

      assert is_list(defenses)
    end

    test "returns empty list for empty detections" do
      {:ok, defenses} = PrismaticAnnihilation.defend([])
      assert defenses == []
    end
  end

  describe "deploy_defenses/2" do
    test "deploys in simulate mode by default" do
      {:ok, detections} = PrismaticAnnihilation.detect("test", threshold: 0.3)
      {:ok, defenses} = PrismaticAnnihilation.defend(detections)
      {:ok, result} = PrismaticAnnihilation.deploy_defenses(defenses)

      assert Map.has_key?(result, :mode)
      assert result.mode == :simulate
    end

    test "accepts mode parameter" do
      {:ok, result} = PrismaticAnnihilation.deploy_defenses([], mode: :active)
      assert result.mode == :active
    end
  end

  describe "monitor_stream/3" do
    test "returns monitor reference" do
      callback = fn _detection -> :ok end
      {:ok, ref} = PrismaticAnnihilation.monitor_stream([], callback)

      assert is_reference(ref)
    end
  end

  describe "stop_monitor/1" do
    test "stops monitor successfully" do
      {:ok, ref} = PrismaticAnnihilation.monitor_stream([], fn _ -> :ok end)
      assert :ok = PrismaticAnnihilation.stop_monitor(ref)
    end
  end

  describe "assess_health/2" do
    test "returns health assessment" do
      {:ok, health} = PrismaticAnnihilation.assess_health(%{})

      assert Map.has_key?(health, :overall_score)
      assert Map.has_key?(health, :vulnerability_count)
      assert Map.has_key?(health, :resilience_factors)
      assert Map.has_key?(health, :recommendations)
    end

    test "overall_score is between 0 and 1" do
      {:ok, health} = PrismaticAnnihilation.assess_health(%{})
      assert health.overall_score >= 0.0 and health.overall_score <= 1.0
    end
  end

  describe "taxonomy/0" do
    test "returns list of techniques" do
      techniques = PrismaticAnnihilation.taxonomy()

      assert is_list(techniques)
      assert length(techniques) > 0
    end

    test "techniques have required fields" do
      [technique | _] = PrismaticAnnihilation.taxonomy()

      assert Map.has_key?(technique, :id)
      assert Map.has_key?(technique, :name)
      assert Map.has_key?(technique, :category)
      assert Map.has_key?(technique, :severity)
    end
  end

  describe "techniques_for_category/1" do
    test "returns techniques for singularity category" do
      techniques = PrismaticAnnihilation.techniques_for_category(:singularity)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.category == :singularity))
    end

    test "returns empty list for unknown category" do
      techniques = PrismaticAnnihilation.techniques_for_category(:nonexistent)
      assert techniques == []
    end
  end

  describe "get_technique/1" do
    test "returns technique by ID" do
      technique = PrismaticAnnihilation.get_technique(:epistemic_imploze)

      assert technique != nil
      assert technique.id == :epistemic_imploze
    end

    test "returns nil for unknown ID" do
      assert nil == PrismaticAnnihilation.get_technique(:nonexistent_technique)
    end
  end

  describe "techniques_for_chapter/1" do
    test "returns techniques for chapter 6" do
      techniques = PrismaticAnnihilation.techniques_for_chapter(6)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.chapter == 6))
    end

    test "validates chapter range" do
      assert_raise FunctionClauseError, fn ->
        PrismaticAnnihilation.techniques_for_chapter(16)
      end

      assert_raise FunctionClauseError, fn ->
        PrismaticAnnihilation.techniques_for_chapter(0)
      end
    end
  end

  describe "trinity_validate/2" do
    test "validates content through Trinity Gate" do
      {:ok, result} = PrismaticAnnihilation.trinity_validate("test content")

      assert Map.has_key?(result, :passed)
      assert Map.has_key?(result, :layer)
      assert Map.has_key?(result, :detections)
      assert Map.has_key?(result, :timestamp)
    end

    test "layer is 4 (annihilation layer)" do
      {:ok, result} = PrismaticAnnihilation.trinity_validate("test")
      assert result.layer == 4
    end
  end

  describe "correlate_with_evil/1" do
    test "returns correlation analysis" do
      {:ok, detections} = PrismaticAnnihilation.detect("test", threshold: 0.3)
      {:ok, correlation} = PrismaticAnnihilation.correlate_with_evil(detections)

      assert Map.has_key?(correlation, :correlations)
      assert Map.has_key?(correlation, :detection_count)
      assert Map.has_key?(correlation, :evil_pattern_matches)
      assert Map.has_key?(correlation, :timestamp)
    end
  end
end
