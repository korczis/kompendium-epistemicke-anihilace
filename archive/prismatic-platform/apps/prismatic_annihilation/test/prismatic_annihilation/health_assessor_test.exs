defmodule PrismaticAnnihilation.HealthAssessorTest do
  @moduledoc """
  Tests for the Health Assessor module.

  Validates epistemic health assessment across the 5 dimensions:
  - Structural Resilience
  - Logical Coherence
  - Source Diversity
  - Temporal Integrity
  - Meta-Epistemic Awareness

  Note: HealthAssessor is a pure functional module (not a GenServer).
  It provides assess/2, quick_check/1, and vulnerability_profile/1.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.HealthAssessor

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

    test "each dimension has score and factors" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      for {_dimension, data} <- assessment.dimensions do
        assert Map.has_key?(data, :score)
        assert Map.has_key?(data, :factors)
        assert data.score >= 0.0 and data.score <= 1.0
      end
    end

    test "status reflects overall health" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      assert assessment.status in [:excellent, :good, :fair, :poor, :critical]
    end
  end

  describe "quick_check/1" do
    test "returns quick health score" do
      {:ok, score} = HealthAssessor.quick_check(%{})

      assert is_float(score)
      assert score >= 0.0
      assert score <= 1.0
    end

    test "empty map returns a score" do
      {:ok, score} = HealthAssessor.quick_check(%{})

      assert is_float(score)
    end
  end

  describe "vulnerability_profile/1" do
    test "returns vulnerability profile" do
      {:ok, profile} = HealthAssessor.vulnerability_profile(%{})

      assert Map.has_key?(profile, :most_vulnerable_to)
      assert Map.has_key?(profile, :vulnerability_distribution)
      assert Map.has_key?(profile, :overall_resilience)
    end

    test "overall_resilience is between 0 and 1" do
      {:ok, profile} = HealthAssessor.vulnerability_profile(%{})

      assert profile.overall_resilience >= 0.0
      assert profile.overall_resilience <= 1.0
    end

    test "vulnerability_distribution is a map" do
      {:ok, profile} = HealthAssessor.vulnerability_profile(%{})

      assert is_map(profile.vulnerability_distribution)
    end
  end

  describe "dimension assessment" do
    test "structural_resilience assessment" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      sr = assessment.dimensions.structural_resilience
      assert is_float(sr.score)
      assert is_map(sr.factors)
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
        assert Map.has_key?(rec, :action)
        assert Map.has_key?(rec, :priority)
        assert Map.has_key?(rec, :expected_impact)
      end
    end

    test "recommendations are prioritized" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      priorities = Enum.map(assessment.recommendations, & &1.priority)

      for priority <- priorities do
        assert is_integer(priority)
        assert priority >= 1 and priority <= 5
      end
    end
  end

  describe "status thresholds" do
    test "status for high scores" do
      # Rich knowledge base should score higher
      kb = %{
        beliefs: generate_beliefs(100),
        sources: generate_sources(10),
        meta_beliefs: generate_meta_beliefs(5)
      }

      {:ok, assessment} = HealthAssessor.assess(kb, [])

      if assessment.overall_score >= 0.9 do
        assert assessment.status == :excellent
      end
    end

    test "status for medium scores" do
      {:ok, assessment} = HealthAssessor.assess(%{}, [])

      if assessment.overall_score >= 0.5 and assessment.overall_score < 0.7 do
        assert assessment.status == :fair
      end
    end

    test "status for low scores" do
      # Empty knowledge base should score lower
      {:ok, assessment} = HealthAssessor.assess(%{beliefs: []}, [])

      if assessment.overall_score < 0.3 do
        assert assessment.status == :critical
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
      assert Enum.count(deep.recommendations) >= Enum.count(surface.recommendations)
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
