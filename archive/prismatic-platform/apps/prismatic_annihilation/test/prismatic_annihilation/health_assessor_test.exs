defmodule PrismaticAnnihilation.HealthAssessorTest do
  @moduledoc """
  Tests for the Health Assessor module.

  Validates epistemic health assessment across the 5 dimensions:
  - Structural Resilience
  - Logical Coherence
  - Source Diversity
  - Temporal Integrity
  - Meta-Epistemic Awareness
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.HealthAssessor

  setup do
    case GenServer.whereis(HealthAssessor) do
      nil ->
        {:ok, _pid} = HealthAssessor.start_link([])
        :ok

      _pid ->
        :ok
    end

    :ok
  end

  describe "assess/2" do
    test "returns comprehensive health assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert Map.has_key?(assessment, :overall_score)
      assert Map.has_key?(assessment, :dimensions)
      assert Map.has_key?(assessment, :vulnerabilities)
      assert Map.has_key?(assessment, :recommendations)
      assert Map.has_key?(assessment, :status)
      assert Map.has_key?(assessment, :timestamp)
    end

    test "overall_score is between 0 and 1" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert assessment.overall_score >= 0.0
      assert assessment.overall_score <= 1.0
    end

    test "dimensions contains all 5 assessment dimensions" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert Map.has_key?(assessment.dimensions, :structural_resilience)
      assert Map.has_key?(assessment.dimensions, :logical_coherence)
      assert Map.has_key?(assessment.dimensions, :source_diversity)
      assert Map.has_key?(assessment.dimensions, :temporal_integrity)
      assert Map.has_key?(assessment.dimensions, :meta_epistemic_awareness)
    end

    test "each dimension has score and indicators" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      for {_dimension, data} <- assessment.dimensions do
        assert Map.has_key?(data, :score)
        assert Map.has_key?(data, :indicators)
        assert data.score >= 0.0 and data.score <= 1.0
      end
    end

    test "status reflects overall health" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert assessment.status in [:healthy, :warning, :critical, :compromised]
    end
  end

  describe "quick_check/1" do
    test "returns quick health status" do
      {:ok, result} = HealthAssessor.quick_check(%{})

      assert Map.has_key?(result, :healthy)
      assert Map.has_key?(result, :score)
      assert is_boolean(result.healthy)
    end

    test "score matches quick assessment" do
      {:ok, result} = HealthAssessor.quick_check(%{})

      # Healthy if score is above threshold (0.6)
      if result.score >= 0.6 do
        assert result.healthy == true
      else
        assert result.healthy == false
      end
    end
  end

  describe "vulnerability_scan/2" do
    test "returns list of vulnerabilities" do
      {:ok, vulnerabilities} = HealthAssessor.vulnerability_scan(%{}, [])

      assert is_list(vulnerabilities)
    end

    test "vulnerabilities have required structure" do
      {:ok, vulnerabilities} = HealthAssessor.vulnerability_scan(%{}, [])

      for vuln <- vulnerabilities do
        assert Map.has_key?(vuln, :type)
        assert Map.has_key?(vuln, :severity)
        assert Map.has_key?(vuln, :description)
      end
    end

    test "severity is valid level" do
      {:ok, vulnerabilities} = HealthAssessor.vulnerability_scan(%{}, [])

      for vuln <- vulnerabilities do
        assert vuln.severity in [:low, :medium, :high, :critical]
      end
    end
  end

  describe "dimension assessment" do
    test "structural_resilience assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      sr = assessment.dimensions.structural_resilience
      assert is_float(sr.score)
      assert is_list(sr.indicators)
    end

    test "logical_coherence assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      lc = assessment.dimensions.logical_coherence
      assert is_float(lc.score)
    end

    test "source_diversity assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      sd = assessment.dimensions.source_diversity
      assert is_float(sd.score)
    end

    test "temporal_integrity assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      ti = assessment.dimensions.temporal_integrity
      assert is_float(ti.score)
    end

    test "meta_epistemic_awareness assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      mea = assessment.dimensions.meta_epistemic_awareness
      assert is_float(mea.score)
    end
  end

  describe "recommendations" do
    test "returns list of recommendations" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert is_list(assessment.recommendations)
    end

    test "recommendations have required structure" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      for rec <- assessment.recommendations do
        assert Map.has_key?(rec, :dimension)
        assert Map.has_key?(rec, :action)
        assert Map.has_key?(rec, :priority)
      end
    end

    test "recommendations are prioritized" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      priorities = Enum.map(assessment.recommendations, & &1.priority)

      for priority <- priorities do
        assert priority in [:high, :medium, :low]
      end
    end
  end

  describe "status thresholds" do
    test "healthy status for high scores" do
      # Mock high-scoring knowledge base
      kb = %{
        beliefs: generate_beliefs(100),
        sources: generate_sources(10),
        meta_beliefs: generate_meta_beliefs(5)
      }

      {:ok, assessment} = HealthAssessor.assess(kb, [])

      if assessment.overall_score >= 0.8 do
        assert assessment.status == :healthy
      end
    end

    test "warning status for medium scores" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      if assessment.overall_score >= 0.5 and assessment.overall_score < 0.8 do
        assert assessment.status in [:healthy, :warning]
      end
    end

    test "critical status for low scores" do
      # Empty knowledge base should score low
      {:ok, assessment} = HealthAssessor.assess(%{beliefs: []}, [])

      if assessment.overall_score < 0.3 do
        assert assessment.status in [:critical, :compromised]
      end
    end
  end

  describe "depth options" do
    test "surface depth is fast" do
      start = System.monotonic_time(:millisecond)
      {:ok, _} = HealthAssessor.assess(%{}, depth: :surface)
      elapsed = System.monotonic_time(:millisecond) - start

      # Surface assessment should be quick
      assert elapsed < 1000
    end

    test "deep depth provides more detail" do
      {:ok, surface} = HealthAssessor.assess(%{}, depth: :surface)
      {:ok, deep} = HealthAssessor.assess(%{}, depth: :deep)

      # Deep should have at least as many recommendations
      assert length(deep.recommendations) >= length(surface.recommendations)
    end
  end

  # Helper functions

  defp generate_beliefs(count) do
    Enum.map(1..count, fn i ->
      %{
        id: "belief_#{i}",
        content: "Test belief #{i}",
        confidence: :rand.uniform(),
        sources: ["source_#{rem(i, 5) + 1}"]
      }
    end)
  end

  defp generate_sources(count) do
    Enum.map(1..count, fn i ->
      %{
        id: "source_#{i}",
        type: Enum.random([:academic, :empirical, :testimonial, :analytical]),
        reliability: 0.5 + :rand.uniform() * 0.5
      }
    end)
  end

  defp generate_meta_beliefs(count) do
    Enum.map(1..count, fn i ->
      %{
        id: "meta_#{i}",
        about: "belief_#{i}",
        type: :confidence_assessment
      }
    end)
  end
end
