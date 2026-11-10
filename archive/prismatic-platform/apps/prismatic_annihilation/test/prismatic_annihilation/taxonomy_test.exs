defmodule PrismaticAnnihilation.TaxonomyTest do
  @moduledoc """
  Tests for the Taxonomy GenServer.

  Validates the complete taxonomy of 150 annihilation techniques,
  their structure, and query capabilities.
  """

  use ExUnit.Case, async: true

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

  describe "all/0" do
    test "returns list of techniques" do
      techniques = Taxonomy.all()

      assert is_list(techniques)
      assert length(techniques) > 0
    end

    test "each technique has required fields" do
      techniques = Taxonomy.all()

      for technique <- techniques do
        assert Map.has_key?(technique, :id)
        assert Map.has_key?(technique, :name)
        assert Map.has_key?(technique, :name_cz)
        assert Map.has_key?(technique, :category)
        assert Map.has_key?(technique, :chapter)
        assert Map.has_key?(technique, :severity)
        assert Map.has_key?(technique, :reversibility)
        assert Map.has_key?(technique, :description)
        assert Map.has_key?(technique, :defense_strategies)
      end
    end

    test "technique IDs are unique" do
      techniques = Taxonomy.all()
      ids = Enum.map(techniques, & &1.id)

      assert length(ids) == length(Enum.uniq(ids))
    end

    test "all techniques have valid severity levels" do
      valid_severities = [:low, :medium, :high, :critical, :terminal]
      techniques = Taxonomy.all()

      for technique <- techniques do
        assert technique.severity in valid_severities,
               "Invalid severity #{inspect(technique.severity)} for #{technique.id}"
      end
    end

    test "all techniques have valid categories" do
      valid_categories = [
        :singularity,
        :metatranscendental,
        :hypertransformative,
        :paradoxical,
        :transconceptual,
        :academic_manipulation,
        :delegitimization,
        :diagnostic,
        :therapeutic,
        :preventive
      ]

      techniques = Taxonomy.all()

      for technique <- techniques do
        assert technique.category in valid_categories,
               "Invalid category #{inspect(technique.category)} for #{technique.id}"
      end
    end

    test "chapters are in valid range 1-15" do
      techniques = Taxonomy.all()

      for technique <- techniques do
        assert technique.chapter in 1..15,
               "Invalid chapter #{technique.chapter} for #{technique.id}"
      end
    end
  end

  describe "by_category/1" do
    test "returns techniques for singularity category" do
      techniques = Taxonomy.by_category(:singularity)

      assert is_list(techniques)
      assert length(techniques) > 0
      assert Enum.all?(techniques, &(&1.category == :singularity))
    end

    test "returns techniques for metatranscendental category" do
      techniques = Taxonomy.by_category(:metatranscendental)

      assert is_list(techniques)
      assert length(techniques) > 0
      assert Enum.all?(techniques, &(&1.category == :metatranscendental))
    end

    test "returns techniques for paradoxical category" do
      techniques = Taxonomy.by_category(:paradoxical)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.category == :paradoxical))
    end

    test "returns empty list for nonexistent category" do
      techniques = Taxonomy.by_category(:nonexistent)
      assert techniques == []
    end
  end

  describe "by_chapter/1" do
    test "returns techniques for chapter 6 (Singularity)" do
      techniques = Taxonomy.by_chapter(6)

      assert is_list(techniques)
      assert length(techniques) > 0
      assert Enum.all?(techniques, &(&1.chapter == 6))
    end

    test "returns techniques for chapter 7 (Metatranscendental)" do
      techniques = Taxonomy.by_chapter(7)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.chapter == 7))
    end

    test "returns techniques for chapter 9 (Paradoxical)" do
      techniques = Taxonomy.by_chapter(9)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.chapter == 9))
    end

    test "validates chapter is in range 1-15" do
      assert_raise FunctionClauseError, fn ->
        Taxonomy.by_chapter(0)
      end

      assert_raise FunctionClauseError, fn ->
        Taxonomy.by_chapter(16)
      end
    end
  end

  describe "get/1" do
    test "returns epistemic_imploze technique" do
      technique = Taxonomy.get(:epistemic_imploze)

      assert technique != nil
      assert technique.id == :epistemic_imploze
      assert technique.category == :singularity
      assert technique.name == "Epistemic Implosion"
      assert technique.name_cz == "Epistemicka imploze"
    end

    test "returns ontological_annihilation technique" do
      technique = Taxonomy.get(:ontological_annihilation)

      assert technique != nil
      assert technique.id == :ontological_annihilation
      assert technique.severity == :terminal
    end

    test "returns nil for unknown technique" do
      assert nil == Taxonomy.get(:nonexistent_technique)
    end

    test "returns technique with all expected fields" do
      technique = Taxonomy.get(:cognitive_pandemonium)

      assert technique != nil
      assert is_atom(technique.id)
      assert is_binary(technique.name)
      assert is_binary(technique.name_cz)
      assert is_atom(technique.category)
      assert is_integer(technique.chapter)
      assert is_atom(technique.severity)
      assert is_atom(technique.reversibility)
      assert is_binary(technique.description)
      assert is_list(technique.defense_strategies)
      assert is_list(technique.typical_manifestations)
      assert is_list(technique.detection_patterns)
    end
  end

  describe "search/1" do
    test "finds techniques by name pattern" do
      techniques = Taxonomy.search("epistemic")

      assert is_list(techniques)
      assert length(techniques) > 0

      for technique <- techniques do
        assert String.contains?(String.downcase(technique.name), "epistemic") or
                 String.contains?(String.downcase(technique.description), "epistemic")
      end
    end

    test "finds techniques by description pattern" do
      techniques = Taxonomy.search("cognitive")

      assert is_list(techniques)
      assert length(techniques) > 0
    end

    test "returns empty list for no matches" do
      techniques = Taxonomy.search("xyznonexistent123")
      assert techniques == []
    end

    test "search is case insensitive" do
      lower = Taxonomy.search("epistemic")
      upper = Taxonomy.search("EPISTEMIC")
      mixed = Taxonomy.search("Epistemic")

      assert length(lower) == length(upper)
      assert length(lower) == length(mixed)
    end
  end

  describe "by_severity/1" do
    test "returns terminal severity techniques" do
      techniques = Taxonomy.by_severity(:terminal)

      assert is_list(techniques)
      assert length(techniques) > 0
      assert Enum.all?(techniques, &(&1.severity == :terminal))
    end

    test "returns critical severity techniques" do
      techniques = Taxonomy.by_severity(:critical)

      assert is_list(techniques)
      assert Enum.all?(techniques, &(&1.severity == :critical))
    end

    test "returns empty list for no matches" do
      techniques = Taxonomy.by_severity(:nonexistent_severity)
      assert techniques == []
    end
  end

  describe "count/0" do
    test "returns total number of techniques" do
      count = Taxonomy.count()

      assert is_integer(count)
      assert count > 0
      assert count == length(Taxonomy.all())
    end
  end

  describe "category_stats/0" do
    test "returns statistics for all categories" do
      stats = Taxonomy.category_stats()

      assert is_map(stats)
      assert map_size(stats) > 0
    end

    test "each category stat has count, severities, and chapters" do
      stats = Taxonomy.category_stats()

      for {_category, stat} <- stats do
        assert Map.has_key?(stat, :count)
        assert Map.has_key?(stat, :severities)
        assert Map.has_key?(stat, :chapters)

        assert is_integer(stat.count)
        assert is_map(stat.severities)
        assert is_list(stat.chapters)
      end
    end

    test "category counts sum to total" do
      stats = Taxonomy.category_stats()
      total_from_stats = stats |> Map.values() |> Enum.map(& &1.count) |> Enum.sum()

      assert total_from_stats == Taxonomy.count()
    end
  end

  describe "specific techniques" do
    test "absolute_epistemic_cannibalization exists" do
      technique = Taxonomy.get(:absolute_epistemic_cannibalization)

      assert technique != nil
      assert technique.severity == :terminal
      assert technique.reversibility == :irreversible
      assert technique.category == :singularity
      assert technique.chapter == 6
    end

    test "transfinite_epistemic_regression exists" do
      technique = Taxonomy.get(:transfinite_epistemic_regression)

      assert technique != nil
      assert technique.category == :metatranscendental
      assert technique.chapter == 7
    end

    test "anti_autoreferential_paradoxical_loop exists" do
      technique = Taxonomy.get(:anti_autoreferential_paradoxical_loop)

      assert technique != nil
      assert technique.category == :paradoxical
      assert technique.chapter == 9
    end

    test "epistemic_anti_mereology exists" do
      technique = Taxonomy.get(:epistemic_anti_mereology)

      assert technique != nil
      assert technique.category == :transconceptual
      assert technique.chapter == 10
    end
  end
end
