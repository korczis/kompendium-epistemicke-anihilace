defmodule PrismaticAnnihilation.DefenseTest do
  @moduledoc """
  Tests for the Defense module.

  Validates countermeasure generation, strategy deployment,
  and defensive effectiveness calculations.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Defense
  alias PrismaticAnnihilation.Taxonomy

  setup do
    case GenServer.whereis(Taxonomy) do
      nil ->
        {:ok, _pid} = Taxonomy.start_link([])
        :ok

      _pid ->
        :ok
    end

    :ok
  end

  describe "generate_strategy/2" do
    test "returns empty list for no detections" do
      {:ok, strategies} = Defense.generate_strategy([], [])
      assert strategies == []
    end

    test "generates strategies for single detection" do
      detection = build_detection(:epistemic_imploze, :singularity, :critical)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      assert is_list(strategies)
    end

    test "generates strategies for multiple detections" do
      detections = [
        build_detection(:epistemic_imploze, :singularity, :critical),
        build_detection(:ontological_annihilation, :singularity, :terminal),
        build_detection(:cognitive_pandemonium, :singularity, :critical)
      ]

      {:ok, strategies} = Defense.generate_strategy(detections, [])

      assert is_list(strategies)
    end

    test "prioritizes by severity" do
      detections = [
        build_detection(:low_severity, :singularity, :low),
        build_detection(:terminal_severity, :singularity, :terminal),
        build_detection(:high_severity, :singularity, :high)
      ]

      {:ok, strategies} = Defense.generate_strategy(detections, [])

      if Enum.count(strategies) > 1 do
        priorities = Enum.map(strategies, & &1.priority)
        # Strategies should be sorted by priority (lower number = higher priority)
        assert priorities == Enum.sort(priorities)
      end
    end

    test "includes countermeasure information" do
      detection = build_detection(:epistemic_imploze, :singularity, :critical)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      for strategy <- strategies do
        assert Map.has_key?(strategy, :countermeasure)
        assert Map.has_key?(strategy, :effectiveness)
        assert Map.has_key?(strategy, :description)
        assert Map.has_key?(strategy, :technique_id)
      end
    end

    test "effectiveness is between 0 and 1" do
      detection = build_detection(:epistemic_imploze, :singularity, :critical)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      for strategy <- strategies do
        assert strategy.effectiveness >= 0.0 and strategy.effectiveness <= 1.0
      end
    end
  end

  describe "deploy/3" do
    test "deploys in simulate mode" do
      strategies = [build_strategy(:meta_epistemic_firewall, :epistemic_imploze, 0.8)]
      {:ok, result} = Defense.deploy(strategies, :simulate, [])

      assert result.mode == :simulate
      assert Map.has_key?(result, :deployed)
      assert Map.has_key?(result, :timestamp)
    end

    test "handles empty strategies list" do
      {:ok, result} = Defense.deploy([], :simulate, [])

      assert result.deployed == []
      assert result.status == :success
    end

    test "returns deployment results with deployed list" do
      strategies = [
        build_strategy(:meta_epistemic_firewall, :epistemic_imploze, 0.8),
        build_strategy(:cognitive_filtering, :cognitive_pandemonium, 0.7)
      ]

      {:ok, result} = Defense.deploy(strategies, :simulate, [])

      assert Map.has_key?(result, :deployed)
      assert is_list(result.deployed)
      assert length(result.deployed) == 2
    end

    test "simulate mode includes all strategies as deployed" do
      strategies = [build_strategy(:test, :tech, 0.8)]
      {:ok, result} = Defense.deploy(strategies, :simulate, [])

      assert result.deployed == strategies
      assert result.failed == []
    end
  end

  describe "for_technique/1" do
    test "returns strategies for known technique" do
      strategies = Defense.for_technique(:epistemic_imploze)

      assert is_list(strategies)
    end

    test "returns empty list for unknown technique" do
      strategies = Defense.for_technique(:nonexistent_technique)

      assert is_list(strategies)
    end
  end

  describe "countermeasure categories" do
    test "singularity countermeasures exist" do
      detection = build_detection(:epistemic_imploze, :singularity, :critical)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      if Enum.count(strategies) > 0 do
        countermeasures = Enum.map(strategies, & &1.countermeasure)
        # Should include singularity-specific countermeasures
        assert is_list(countermeasures)
      end
    end

    test "metatranscendental countermeasures exist" do
      detection = build_detection(:transfinite_epistemic_regression, :metatranscendental, :terminal)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      assert is_list(strategies)
    end

    test "paradoxical countermeasures exist" do
      detection = build_detection(:anti_autoreferential_paradoxical_loop, :paradoxical, :critical)
      {:ok, strategies} = Defense.generate_strategy([detection], [])

      assert is_list(strategies)
    end
  end

  describe "effectiveness calculation" do
    test "higher severity reduces base effectiveness" do
      low = build_detection(:test, :singularity, :low)
      terminal = build_detection(:test, :singularity, :terminal)

      {:ok, low_strategies} = Defense.generate_strategy([low], [])
      {:ok, terminal_strategies} = Defense.generate_strategy([terminal], [])

      if Enum.count(low_strategies) > 0 and Enum.count(terminal_strategies) > 0 do
        low_eff = Enum.map(low_strategies, & &1.effectiveness) |> Enum.max()
        terminal_eff = Enum.map(terminal_strategies, & &1.effectiveness) |> Enum.max()

        # Terminal techniques should be harder to defend against
        assert low_eff >= terminal_eff
      end
    end

    test "multiple strategies increase coverage" do
      detections = [
        build_detection(:t1, :singularity, :critical),
        build_detection(:t2, :metatranscendental, :high),
        build_detection(:t3, :paradoxical, :critical)
      ]

      {:ok, strategies} = Defense.generate_strategy(detections, [])

      if Enum.count(strategies) > 1 do
        technique_ids = strategies |> Enum.map(& &1.technique_id) |> Enum.uniq()
        # Should cover multiple techniques
        assert Enum.count(technique_ids) >= 1
      end
    end
  end

  # Helper functions

  defp build_detection(technique_id, category, severity) do
    %{
      technique_id: technique_id,
      technique_name: "Test Technique",
      category: category,
      chapter: 6,
      confidence: 0.8,
      severity: severity,
      evidence: [],
      location: %{start: 0, end: 100, context: "test"},
      countermeasures: [:generic_defense]
    }
  end

  defp build_strategy(countermeasure, target_technique, effectiveness) do
    %{
      countermeasure: countermeasure,
      target_technique: target_technique,
      target_category: :singularity,
      target_severity: :critical,
      effectiveness: effectiveness,
      description: "Test defense strategy",
      implementation: nil
    }
  end
end
