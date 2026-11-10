defmodule PrismaticAnnihilation.Compendium.TransformerTest do
  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.{Extractor, Transformer}

  @project_root Path.expand("../../../../", __DIR__)

  setup_all do
    {:ok, extraction} = Extractor.extract_all(base_path: @project_root)
    {:ok, transformation} = Transformer.transform(extraction)
    %{extraction: extraction, transformation: transformation}
  end

  describe "transform/2" do
    test "transforms all extracted techniques", %{transformation: result} do
      assert length(result.techniques) > 0
      assert is_map(result.categories)
      assert is_map(result.translation_map)
      assert %DateTime{} = result.transform_timestamp
      assert is_map(result.statistics)
    end

    test "generates unique IDs for each technique", %{transformation: result} do
      ids = Enum.map(result.techniques, & &1.id)
      assert length(Enum.uniq(ids)) == length(ids)

      Enum.each(ids, fn id ->
        assert String.starts_with?(id, "EA-")
        assert String.match?(id, ~r/^EA-\d{3}-.+$/)
      end)
    end

    test "translates Czech names to English", %{transformation: result} do
      Enum.each(result.techniques, fn t ->
        assert is_binary(t.name_en)
        assert t.name_en != ""
        # English names should not contain Czech diacritics
        refute String.match?(t.name_en, ~r/[ěščřžýáíéúůďťň]/u)
      end)
    end

    test "resolves severity levels with scores", %{transformation: result} do
      Enum.each(result.techniques, fn t ->
        assert is_binary(t.severity)
        assert is_float(t.severity_score) or is_integer(t.severity_score)
        assert t.severity_score >= 0.0 and t.severity_score <= 1.0
      end)
    end

    test "resolves reversibility with scores", %{transformation: result} do
      Enum.each(result.techniques, fn t ->
        assert is_binary(t.reversibility)
        assert is_float(t.reversibility_score) or is_integer(t.reversibility_score)
        assert t.reversibility_score >= 0.0 and t.reversibility_score <= 1.0
      end)
    end

    test "assigns categories", %{transformation: result} do
      Enum.each(result.techniques, fn t ->
        assert is_binary(t.category)
        assert t.category != ""
      end)
    end

    test "generates statistics", %{transformation: result} do
      stats = result.statistics
      assert stats.total_techniques > 0
      assert is_map(stats.by_category)
      assert is_map(stats.by_severity)
      assert is_map(stats.by_reversibility)
      assert is_number(stats.average_severity_score)
      assert is_number(stats.average_reversibility_score)
    end

    test "builds category tree", %{transformation: result} do
      assert map_size(result.categories) > 0

      Enum.each(result.categories, fn {_cat, info} ->
        assert is_integer(info.count)
        assert info.count > 0
        assert is_map(info.subcategories)
        assert is_list(info.technique_ids)
      end)
    end

    test "builds translation map", %{transformation: result} do
      assert map_size(result.translation_map) > 0

      Enum.each(result.translation_map, fn {id, translation} ->
        assert String.starts_with?(id, "EA-")
        assert is_binary(translation.cs)
        assert is_binary(translation.en)
      end)
    end
  end

  describe "translation map integrity (regression)" do
    # Regression test: prevents duplicate keys in module attribute maps.
    # Previously, "reflexivity" (English) was erroneously included as a key
    # in the Czech-to-English @name_translations map alongside "reflexivita" (Czech),
    # creating a redundant entry where an English word mapped to itself.

    @name_translations_source Path.expand(
                                "../../lib/prismatic_annihilation/compendium/transformer.ex",
                                __DIR__
                              )

    test "no duplicate keys in @name_translations" do
      content = File.read!(@name_translations_source)

      # Extract the @name_translations block (between its %{ and closing })
      {keys, _} = extract_map_keys(content, "@name_translations")

      frequencies = Enum.frequencies(keys)
      duplicates = Enum.filter(frequencies, fn {_k, count} -> count > 1 end)

      assert duplicates == [],
             "Duplicate keys found in @name_translations: #{inspect(Enum.map(duplicates, &elem(&1, 0)))}"
    end

    test "no duplicate keys in @severity_map" do
      content = File.read!(@name_translations_source)
      {keys, _} = extract_map_keys(content, "@severity_map")
      frequencies = Enum.frequencies(keys)
      duplicates = Enum.filter(frequencies, fn {_k, count} -> count > 1 end)

      assert duplicates == [],
             "Duplicate keys found in @severity_map: #{inspect(Enum.map(duplicates, &elem(&1, 0)))}"
    end

    test "no duplicate keys in @reversibility_map" do
      content = File.read!(@name_translations_source)
      {keys, _} = extract_map_keys(content, "@reversibility_map")
      frequencies = Enum.frequencies(keys)
      duplicates = Enum.filter(frequencies, fn {_k, count} -> count > 1 end)

      assert duplicates == [],
             "Duplicate keys found in @reversibility_map: #{inspect(Enum.map(duplicates, &elem(&1, 0)))}"
    end

    test "no duplicate keys in @category_translations" do
      content = File.read!(@name_translations_source)
      {keys, _} = extract_map_keys(content, "@category_translations")
      frequencies = Enum.frequencies(keys)
      duplicates = Enum.filter(frequencies, fn {_k, count} -> count > 1 end)

      assert duplicates == [],
             "Duplicate keys found in @category_translations: #{inspect(Enum.map(duplicates, &elem(&1, 0)))}"
    end

    test "no duplicate keys in @subcategory_translations" do
      content = File.read!(@name_translations_source)
      {keys, _} = extract_map_keys(content, "@subcategory_translations")
      frequencies = Enum.frequencies(keys)
      duplicates = Enum.filter(frequencies, fn {_k, count} -> count > 1 end)

      assert duplicates == [],
             "Duplicate keys found in @subcategory_translations: #{inspect(Enum.map(duplicates, &elem(&1, 0)))}"
    end

    test "@name_translations keys are Czech, not English self-mappings" do
      content = File.read!(@name_translations_source)
      {keys, values} = extract_map_keys_and_values(content, "@name_translations")

      # Known loanwords that are intentionally identical in Czech and English.
      # These are legitimate self-mappings, not translation errors.
      known_loanwords =
        MapSet.new([
          "pandemonium",
          "gaslighting",
          "virulence",
          "transcendence",
          "hyperinterference",
          "hyperparadox",
          "anti-inherence",
          "anti-invariance",
          "anti-transcendence"
        ])

      # A key that equals its value AND is NOT a known loanword is likely a bug
      self_mappings =
        Enum.zip(keys, values)
        |> Enum.filter(fn {key, val} ->
          key == val and not MapSet.member?(known_loanwords, key)
        end)

      assert self_mappings == [],
             "Self-mapping keys found (English words mapping to themselves): #{inspect(Enum.map(self_mappings, &elem(&1, 0)))}"
    end

    test "no transliteration collisions produce conflicting values" do
      content = File.read!(@name_translations_source)
      {keys, values} = extract_map_keys_and_values(content, "@name_translations")

      pairs = Enum.zip(keys, values)

      # Group by transliterated (ASCII) form of key
      groups =
        pairs
        |> Enum.group_by(fn {k, _v} -> transliterate_for_test(k) end)
        |> Enum.filter(fn {_ascii, entries} -> length(entries) > 1 end)

      # All entries in a collision group must map to the same English value
      conflicting =
        Enum.filter(groups, fn {_ascii, entries} ->
          entries |> Enum.map(&elem(&1, 1)) |> Enum.uniq() |> length() > 1
        end)

      assert conflicting == [],
             "Transliteration collisions with conflicting values: #{inspect(conflicting)}"
    end

    # Helper: extract map keys from a named module attribute
    defp extract_map_keys(content, attr_name) do
      {keys, _values} = extract_map_keys_and_values(content, attr_name)
      {keys, nil}
    end

    defp extract_map_keys_and_values(content, attr_name) do
      # Find the attribute definition and extract key => value pairs
      lines = String.split(content, "\n")

      # Find start line
      start_idx =
        Enum.find_index(lines, fn line ->
          String.contains?(line, "#{attr_name} %{")
        end)

      if start_idx do
        # Collect lines until closing }
        map_lines =
          lines
          |> Enum.drop(start_idx)
          |> Enum.reduce_while([], fn line, acc ->
            acc = [line | acc]

            if String.trim(line) == "}" do
              {:halt, Enum.reverse(acc)}
            else
              {:cont, acc}
            end
          end)
          |> Enum.join("\n")

        keys =
          Regex.scan(~r/"([^"]+)"\s*=>/, map_lines)
          |> Enum.map(fn [_, key] -> key end)

        values =
          Regex.scan(~r/=>\s*\{?"([^"{}]+)"/, map_lines)
          |> Enum.map(fn [_, val] -> val end)

        {keys, values}
      else
        {[], []}
      end
    end

    defp transliterate_for_test(word) do
      word
      |> String.replace(~r/\x{00E1}/u, "a")
      |> String.replace(~r/\x{010D}/u, "c")
      |> String.replace(~r/\x{010F}/u, "d")
      |> String.replace(~r/[\x{00E9}\x{011B}]/u, "e")
      |> String.replace(~r/\x{00ED}/u, "i")
      |> String.replace(~r/\x{0148}/u, "n")
      |> String.replace(~r/\x{00F3}/u, "o")
      |> String.replace(~r/\x{0159}/u, "r")
      |> String.replace(~r/\x{0161}/u, "s")
      |> String.replace(~r/\x{0165}/u, "t")
      |> String.replace(~r/[\x{00FA}\x{016F}]/u, "u")
      |> String.replace(~r/\x{00FD}/u, "y")
      |> String.replace(~r/\x{017E}/u, "z")
    end
  end

  describe "transform_technique/4" do
    test "handles technique with full metadata" do
      raw = %{
        name_cs: "Absolutni epistemicka imploze",
        anchor: "absolutni-epistemicka-imploze",
        kategorie: "Epistemicka destrukce",
        uroven_zavaznosti: "Kriticka",
        oblast_pusobeni: "Poznavaci struktury",
        casovy_prubeh: "Nahly, katastroficky",
        reverzibilita: "Velmi obtizne reverzibilni",
        typicke_projevy: "Kognitivni singularita, epistemicka komprese",
        obranne_strategie: "Epistemicka diverzifikace, poznavaci stabilizace",
        description: "Epistemicka imploze predstavuje dramaticky fenomen.",
        example: "Uznavany fyzik...",
        cross_references: ["epistemicka-singularita", "epistemicka-nekroza"],
        source: :primary,
        page_number: 14,
        thematic_category: nil,
        thematic_subcategory: nil
      }

      result = Transformer.transform_technique(raw, 1, true, true)

      assert result.id == "EA-001-absolutni-epistemicka-imploze"
      assert result.name_cs == "Absolutni epistemicka imploze"
      assert is_binary(result.name_en)
      assert result.severity_score > 0
      assert result.reversibility_score > 0
      assert length(result.typical_manifestations) > 0
      assert length(result.defense_strategies) > 0
      assert length(result.cross_references) == 2
      assert result.page_number == 14
    end

    test "handles technique with minimal metadata" do
      raw = %{
        name_cs: "Test technique",
        anchor: "test-technique",
        kategorie: nil,
        uroven_zavaznosti: nil,
        oblast_pusobeni: nil,
        casovy_prubeh: nil,
        reverzibilita: nil,
        typicke_projevy: nil,
        obranne_strategie: nil,
        description: nil,
        example: nil,
        cross_references: [],
        source: :index,
        page_number: nil,
        thematic_category: nil,
        thematic_subcategory: nil
      }

      result = Transformer.transform_technique(raw, 1, true, true)

      assert is_binary(result.id)
      assert result.severity == "unknown"
      assert result.reversibility == "unknown"
      assert result.category == "uncategorized"
    end
  end
end
