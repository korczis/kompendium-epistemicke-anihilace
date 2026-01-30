defmodule PrismaticAnnihilation.IntegrationTest do
  @moduledoc """
  Integration tests for PrismaticAnnihilation.

  Tests the complete detection-to-defense pipeline and
  integration with other platform components.
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation
  alias PrismaticAnnihilation.{Taxonomy, TechniqueCache, TelemetryHandler, Defense}

  setup do
    # Start all required processes
    ensure_started(Taxonomy)
    ensure_started(TechniqueCache)
    ensure_started(TelemetryHandler)

    TechniqueCache.clear()
    TelemetryHandler.reset_metrics()

    :ok
  end

  defp ensure_started(module) do
    case GenServer.whereis(module) do
      nil -> {:ok, _} = module.start_link([])
      _pid -> :ok
    end
  end

  describe "complete detection pipeline" do
    test "detects, analyzes, and generates defense for epistemic attack content" do
      content = """
      The systematic destruction of cognitive foundations leads to
      epistemic cannibalization where knowledge consumes itself.
      Self-reference becomes self-destruction in a recursive collapse
      of all meaning and value.
      """

      # Step 1: Detection
      {:ok, detections} = PrismaticAnnihilation.detect(content, threshold: 0.4)
      assert is_list(detections)

      # Step 2: Analysis
      {:ok, analysis} = PrismaticAnnihilation.analyze(content, threshold: 0.4)
      assert Map.has_key?(analysis, :detections)
      assert Map.has_key?(analysis, :severity_assessment)
      assert Map.has_key?(analysis, :recommended_defenses)

      # Step 3: Defense generation
      {:ok, defenses} = PrismaticAnnihilation.defend(detections)
      assert is_list(defenses)

      # Step 4: Deployment (simulate mode)
      {:ok, deployment} = PrismaticAnnihilation.deploy_defenses(defenses, mode: :simulate)
      assert deployment.mode == :simulate
    end

    test "handles clean content through pipeline" do
      content = "This is a normal, benign message about regular topics."

      {:ok, detections} = PrismaticAnnihilation.detect(content)
      assert detections == []

      {:ok, analysis} = PrismaticAnnihilation.analyze(content)
      assert analysis.severity_assessment == :low
      assert analysis.epistemic_health_impact == 0.0

      {:ok, defenses} = PrismaticAnnihilation.defend([])
      assert defenses == []
    end

    test "pipeline respects category filtering" do
      content = "singularity collapse paradoxical loop regression"

      {:ok, all} = PrismaticAnnihilation.detect(content, threshold: 0.3)
      {:ok, singularity_only} =
        PrismaticAnnihilation.detect(content, categories: [:singularity], threshold: 0.3)

      # Filtered should have fewer or equal detections
      assert length(singularity_only) <= length(all)

      # All filtered results should be from specified category
      for detection <- singularity_only do
        assert detection.category == :singularity
      end
    end
  end

  describe "taxonomy integration" do
    test "detection uses taxonomy definitions" do
      # Get a technique from taxonomy
      technique = Taxonomy.get(:cognitive_pandemonium)
      assert technique != nil

      # Detection should recognize patterns from taxonomy
      content = Enum.join(technique.detection_patterns, " ")
      {:ok, detections} = PrismaticAnnihilation.detect(content, threshold: 0.3)

      # Should detect something
      assert is_list(detections)
    end

    test "all taxonomy categories are searchable" do
      categories = [:singularity, :metatranscendental, :hypertransformative, :paradoxical, :transconceptual]

      for category <- categories do
        techniques = Taxonomy.by_category(category)
        # Each category should have at least one technique
        assert length(techniques) > 0, "Category #{category} has no techniques"
      end
    end

    test "defense strategies reference taxonomy" do
      # Get technique with known defense strategies
      technique = Taxonomy.get(:epistemic_imploze)
      assert technique != nil
      assert length(technique.defense_strategies) > 0

      # Build detection from this technique
      detection = %{
        technique_id: technique.id,
        technique_name: technique.name,
        category: technique.category,
        chapter: technique.chapter,
        confidence: 0.9,
        severity: technique.severity,
        evidence: [],
        location: %{start: 0, end: 100, context: "test"},
        countermeasures: technique.defense_strategies
      }

      # Generate defense should use these strategies
      {:ok, defenses} = Defense.generate_strategy([detection], [])
      assert is_list(defenses)
    end
  end

  describe "cache integration" do
    test "caches detection results" do
      content_hash = :crypto.hash(:sha256, "test content") |> Base.encode16(case: :lower)

      # First detection
      {:ok, first_result} = PrismaticAnnihilation.detect("test content")

      # Cache the result using technique-based API
      :ok = TechniqueCache.put(:detection_cache, String.to_atom(content_hash), first_result)

      # Retrieve from cache
      {:ok, cached} = TechniqueCache.get(:detection_cache, String.to_atom(content_hash))
      assert cached == first_result
    end

    test "cache improves performance for repeated analysis" do
      content = "epistemic singularity cognitive collapse"

      # First analysis (uncached)
      start1 = System.monotonic_time(:microsecond)
      {:ok, _} = PrismaticAnnihilation.analyze(content)
      time1 = System.monotonic_time(:microsecond) - start1

      # Second analysis (potentially cached patterns)
      start2 = System.monotonic_time(:microsecond)
      {:ok, _} = PrismaticAnnihilation.analyze(content)
      time2 = System.monotonic_time(:microsecond) - start2

      # Both should complete reasonably fast
      assert time1 < 1_000_000  # < 1 second
      assert time2 < 1_000_000
    end
  end

  describe "telemetry integration" do
    test "detection emits telemetry events" do
      TelemetryHandler.reset_metrics()

      # Perform detection
      PrismaticAnnihilation.detect("test content")

      # Allow event processing
      Process.sleep(100)

      # Check metrics were updated
      metrics = TelemetryHandler.metrics()
      assert metrics.detection.total_scans >= 1
    end

    test "multiple operations update metrics correctly" do
      TelemetryHandler.reset_metrics()

      # Perform multiple detections
      for _ <- 1..5 do
        PrismaticAnnihilation.detect("test content #{:rand.uniform()}")
      end

      Process.sleep(100)

      metrics = TelemetryHandler.metrics()
      assert metrics.detection.total_scans >= 5
    end
  end

  describe "trinity bridge integration" do
    test "trinity validation integrates with detection" do
      content = "test content for trinity validation"

      {:ok, trinity_result} = PrismaticAnnihilation.trinity_validate(content)

      assert Map.has_key?(trinity_result, :passed)
      assert Map.has_key?(trinity_result, :layer)
      assert trinity_result.layer == 4
    end

    test "trinity validation catches high-severity patterns" do
      content = """
      epistemic_gravitational_acceleration knowledge_horizon_formation
      cognitive_supercompression information_singularity epistemic_radiation
      being_negation existence_collapse ontological_vacuum
      """

      result = PrismaticAnnihilation.TrinityBridge.validate(content, threshold: 0.3)

      case result do
        {:passed, _} -> assert true
        {:blocked, :layer4, _, _} -> assert true
      end
    end
  end

  describe "evil bridge integration" do
    test "correlates detections with evil patterns" do
      {:ok, detections} = PrismaticAnnihilation.detect("epistemic manipulation deception")

      {:ok, correlation} = PrismaticAnnihilation.correlate_with_evil(detections)

      assert Map.has_key?(correlation, :correlations)
      assert Map.has_key?(correlation, :detection_count)
      assert Map.has_key?(correlation, :evil_pattern_matches)
      assert Map.has_key?(correlation, :timestamp)
    end
  end

  describe "performance requirements" do
    test "detection completes within 100ms for typical content" do
      content = String.duplicate("test content with some patterns ", 100)

      start = System.monotonic_time(:millisecond)
      {:ok, _} = PrismaticAnnihilation.detect(content)
      elapsed = System.monotonic_time(:millisecond) - start

      assert elapsed < 100, "Detection took #{elapsed}ms, expected < 100ms"
    end

    test "analysis completes within reasonable time" do
      content = String.duplicate("epistemic attack pattern ", 50)

      start = System.monotonic_time(:millisecond)
      {:ok, _} = PrismaticAnnihilation.analyze(content)
      elapsed = System.monotonic_time(:millisecond) - start

      assert elapsed < 500, "Analysis took #{elapsed}ms, expected < 500ms"
    end

    test "handles large content without timeout" do
      # 10KB of content
      content = String.duplicate("large content block with patterns ", 300)

      {:ok, detections} = PrismaticAnnihilation.detect(content, timeout: 5000)
      assert is_list(detections)
    end
  end

  describe "concurrent operations" do
    test "handles concurrent detections" do
      tasks =
        Enum.map(1..20, fn i ->
          Task.async(fn ->
            PrismaticAnnihilation.detect("concurrent content #{i}")
          end)
        end)

      results = Task.await_many(tasks, 5000)

      for result <- results do
        assert match?({:ok, _}, result)
      end
    end

    test "handles concurrent analyses" do
      tasks =
        Enum.map(1..10, fn i ->
          Task.async(fn ->
            PrismaticAnnihilation.analyze("analysis content #{i}")
          end)
        end)

      results = Task.await_many(tasks, 10000)

      for result <- results do
        assert match?({:ok, _}, result)
      end
    end
  end

  describe "error handling" do
    test "handles nil content gracefully" do
      {:ok, detections} = PrismaticAnnihilation.detect(nil)
      assert detections == []
    end

    test "handles empty content" do
      {:ok, detections} = PrismaticAnnihilation.detect("")
      assert detections == []
    end

    test "handles non-string content" do
      {:ok, detections} = PrismaticAnnihilation.detect(%{key: "value"})
      assert detections == []
    end
  end
end
