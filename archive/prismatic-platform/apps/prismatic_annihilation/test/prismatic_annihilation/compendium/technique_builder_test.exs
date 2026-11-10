defmodule PrismaticAnnihilation.Compendium.TechniqueBuilderTest do
  @moduledoc """
  Tests for the TechniqueBuilder module.

  Validates building complete technique structs from parsed data,
  including ID generation, severity mapping, and category assignment.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.TechniqueBuilder

  describe "generate_id/1" do
    test "generates atom ID from simple Czech name" do
      assert :epistemicka_imploze = TechniqueBuilder.generate_id("Epistemická imploze")
    end

    test "handles multiple words" do
      assert :absolutni_egologicka_dezintegrace =
               TechniqueBuilder.generate_id("Absolutní egologická dezintegrace")
    end

    test "transliterates all Czech diacritics" do
      # Test all Czech special characters
      assert :prilis_zlutoucky_kun_upel_dabelske_ody =
               TechniqueBuilder.generate_id("Příliš žluťoučký kůň úpěl ďábelské ódy")
    end

    test "handles mixed case" do
      id1 = TechniqueBuilder.generate_id("Epistemická Imploze")
      id2 = TechniqueBuilder.generate_id("EPISTEMICKÁ IMPLOZE")
      id3 = TechniqueBuilder.generate_id("epistemická imploze")

      assert id1 == id2
      assert id2 == id3
    end

    test "removes special characters" do
      assert :test_term = TechniqueBuilder.generate_id("Test (term)!")
      assert :anti_something = TechniqueBuilder.generate_id("Anti-something")
    end

    test "trims whitespace" do
      assert :trimmed = TechniqueBuilder.generate_id("  Trimmed  ")
    end

    test "handles empty string" do
      assert :"" = TechniqueBuilder.generate_id("")
    end

    test "handles specific compendium terms" do
      assert :alethicky_rezim = TechniqueBuilder.generate_id("Alethický režim")
      assert :axiologicka_anihilace = TechniqueBuilder.generate_id("Axiologická anihilace")
      assert :bifurkace_epistemicka = TechniqueBuilder.generate_id("Bifurkace epistemická")
      assert :cirkularita_destruktivni = TechniqueBuilder.generate_id("Cirkularita destruktivní")

      assert :dekonstruktivni_hyperkaskada =
               TechniqueBuilder.generate_id("Dekonstruktivní hyperkaskáda")
    end
  end

  describe "map_severity/1" do
    test "maps 'Extrémní' to :terminal" do
      assert :terminal = TechniqueBuilder.map_severity("Extrémní")
    end

    test "maps 'Kritická' to :critical" do
      assert :critical = TechniqueBuilder.map_severity("Kritická")
    end

    test "maps 'Vysoká' to :high" do
      assert :high = TechniqueBuilder.map_severity("Vysoká")
    end

    test "maps 'Střední' to :medium" do
      assert :medium = TechniqueBuilder.map_severity("Střední")
    end

    test "maps 'Nízká' to :low" do
      assert :low = TechniqueBuilder.map_severity("Nízká")
    end

    test "maps 'Střední až vysoká' to :high" do
      assert :high = TechniqueBuilder.map_severity("Střední až vysoká")
    end

    test "handles nil" do
      assert :unknown = TechniqueBuilder.map_severity(nil)
    end

    test "handles unknown values" do
      assert :unknown = TechniqueBuilder.map_severity("Something else")
    end

    test "is case insensitive" do
      assert :critical = TechniqueBuilder.map_severity("KRITICKÁ")
      assert :critical = TechniqueBuilder.map_severity("kritická")
      assert :critical = TechniqueBuilder.map_severity("Kritická")
    end

    test "handles extra whitespace" do
      assert :critical = TechniqueBuilder.map_severity("  Kritická  ")
    end
  end

  describe "map_reversibility/1" do
    test "maps 'Prakticky nereverzibilní' to :practically_irreversible" do
      assert :practically_irreversible =
               TechniqueBuilder.map_reversibility("Prakticky nereverzibilní")
    end

    test "maps 'Velmi obtížně reverzibilní' to :very_difficult" do
      assert :very_difficult = TechniqueBuilder.map_reversibility("Velmi obtížně reverzibilní")
    end

    test "maps 'Obtížně reverzibilní' to :difficult" do
      assert :difficult = TechniqueBuilder.map_reversibility("Obtížně reverzibilní")
    end

    test "maps 'Částečně reverzibilní' to :moderate" do
      assert :moderate = TechniqueBuilder.map_reversibility("Částečně reverzibilní")
    end

    test "maps 'Relativně reverzibilní' to :moderate" do
      assert :moderate = TechniqueBuilder.map_reversibility("Relativně reverzibilní")
    end

    test "handles nil" do
      assert :unknown = TechniqueBuilder.map_reversibility(nil)
    end

    test "handles unknown values" do
      assert :unknown = TechniqueBuilder.map_reversibility("Something else")
    end

    test "is case insensitive" do
      assert :difficult = TechniqueBuilder.map_reversibility("OBTÍŽNĚ REVERZIBILNÍ")
    end
  end

  describe "determine_category/2" do
    test "uses category from metadata when available" do
      raw = %{category: "Fundamentální epistemická destrukce"}

      assert :singularity = TechniqueBuilder.determine_category(raw, [])
    end

    test "respects category option override" do
      raw = %{category: "Fundamentální epistemická destrukce"}

      assert :paradoxical = TechniqueBuilder.determine_category(raw, category: :paradoxical)
    end

    test "defaults to :singularity when no category found" do
      raw = %{}

      assert :singularity = TechniqueBuilder.determine_category(raw, [])
    end

    test "maps various Czech category names" do
      assert :singularity =
               TechniqueBuilder.determine_category(%{category: "Epistemická manipulace"}, [])

      assert :singularity =
               TechniqueBuilder.determine_category(%{category: "Patologický kognitivní vzorec"}, [])

      assert :metatranscendental =
               TechniqueBuilder.determine_category(
                 %{category: "Artikulační epistemická negace"},
                 []
               )

      assert :delegitimization =
               TechniqueBuilder.determine_category(
                 %{category: "Legitimizační destruktivní technika"},
                 []
               )
    end
  end

  describe "determine_chapter/2" do
    test "returns correct chapter for singularity" do
      assert 6 = TechniqueBuilder.determine_chapter(:singularity, [])
    end

    test "returns correct chapter for metatranscendental" do
      assert 7 = TechniqueBuilder.determine_chapter(:metatranscendental, [])
    end

    test "returns correct chapter for hypertransformative" do
      assert 8 = TechniqueBuilder.determine_chapter(:hypertransformative, [])
    end

    test "returns correct chapter for paradoxical" do
      assert 9 = TechniqueBuilder.determine_chapter(:paradoxical, [])
    end

    test "returns correct chapter for transconceptual" do
      assert 10 = TechniqueBuilder.determine_chapter(:transconceptual, [])
    end

    test "respects chapter option override" do
      assert 12 = TechniqueBuilder.determine_chapter(:singularity, chapter: 12)
    end

    test "validates chapter range" do
      assert 6 = TechniqueBuilder.determine_chapter(:singularity, chapter: 0)
      assert 6 = TechniqueBuilder.determine_chapter(:singularity, chapter: 16)
    end
  end

  describe "build_from_raw/3" do
    test "builds complete technique from raw data" do
      raw = %{
        name_cz: "Epistemická imploze",
        anchor: "epistemicka-imploze",
        category: "Fundamentální epistemická destrukce",
        severity: "Kritická",
        reversibility: "Velmi obtížně reverzibilní",
        domain: "Celková kognitivní architektura",
        temporal_course: "Náhlý, katastrofický",
        typical_manifestations: "Kognitivní kolaps, epistemický šok",
        defense_strategies: "Externí epistemická podpora, postupná rekonstrukce",
        description: "Proces náhlého zhroucení kognitivních struktur do sebe.",
        example: "Logik objeví fundamentální kontradikci...",
        see_also: ["epistemicka-cerna-dira", "kognitivni-singularita"]
      }

      technique = TechniqueBuilder.build_from_raw(raw, 14)

      assert technique.id == :epistemicka_imploze
      assert technique.name == "Epistemic Implosion"
      assert technique.name_cz == "Epistemická imploze"
      assert technique.category == :singularity
      assert technique.chapter == 6
      assert technique.technique_number == 14
      assert technique.severity == :critical
      assert technique.reversibility == :very_difficult
      assert technique.temporal_course == "Náhlý, katastrofický"
      assert "Kognitivní kolaps" in technique.typical_manifestations
      assert "epistemický šok" in technique.typical_manifestations
      assert is_list(technique.defense_strategies)
      assert is_binary(technique.description)
      assert is_binary(technique.example)
      assert is_list(technique.see_also)
      assert is_list(technique.detection_patterns)
      assert is_list(technique.keywords)
    end

    test "returns nil for empty name" do
      raw = %{name_cz: "", category: "Test", severity: "Vysoká"}

      assert nil == TechniqueBuilder.build_from_raw(raw, 1)
    end

    test "handles minimal raw data" do
      raw = %{
        name_cz: "Minimal Test",
        description: "A minimal description."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique != nil
      assert technique.id == :minimal_test
      assert technique.severity == :unknown
      assert technique.category == :singularity
    end

    test "generates detection patterns" do
      raw = %{
        name_cz: "Test Pattern",
        typical_manifestations: "Pattern A, Pattern B",
        description: "Description with destrukce and anihilace keywords."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert is_list(technique.detection_patterns)
      assert length(technique.detection_patterns) > 0
    end

    test "generates keywords from name and description" do
      raw = %{
        name_cz: "Epistemická destrukce",
        description: "Process of epistemic destruction that leads to destruction."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert is_list(technique.keywords)
      assert "epistemicka" in technique.keywords or "epistemic" in technique.keywords
    end

    test "converts see_also anchors to atoms" do
      raw = %{
        name_cz: "Test",
        description: "Test description.",
        see_also: ["related-term", "another-term"]
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert :related_term in technique.see_also
      assert :another_term in technique.see_also
    end

    test "extracts detailed_principle from description" do
      raw = %{
        name_cz: "Test",
        description: "The first sentence is the principle. The rest is additional detail."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique.detailed_principle == "The first sentence is the principle."
    end

    test "respects chapter option" do
      raw = %{name_cz: "Test", description: "Description."}

      technique = TechniqueBuilder.build_from_raw(raw, 1, chapter: 9)

      assert technique.chapter == 9
    end

    test "respects category option" do
      raw = %{name_cz: "Test", description: "Description."}

      technique = TechniqueBuilder.build_from_raw(raw, 1, category: :paradoxical)

      assert technique.category == :paradoxical
    end
  end

  describe "name translation" do
    test "translates common Czech terms to English" do
      raw = %{name_cz: "Epistemická anihilace", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Epistemic Annihilation"

      raw = %{name_cz: "Kognitivní dezintegrace", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Cognitive Disintegration"

      raw = %{name_cz: "Ontologická destrukce", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Ontological Destruction"
    end

    test "handles compound terms" do
      # Note: translate_name uses String.replace with exact case-sensitive patterns.
      # "Epistemická " with capital E is replaced but "epistemická " with lowercase is not.
      raw = %{name_cz: "Absolutní Epistemická imploze", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Absolute Epistemic Implosion"
    end

    test "handles special terms" do
      raw = %{name_cz: "Epistemická černá díra", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Epistemic Black Hole"

      raw = %{name_cz: "Koncepcní nukleární zima", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert String.contains?(technique.name, "Nuclear Winter")
    end

    test "translates additional verb forms" do
      raw = %{name_cz: "Epistemická fragmentace", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Epistemic Fragmentation"

      raw = %{name_cz: "Epistemická regrese", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Epistemic Regression"
    end

    test "translates metacognitive prefix" do
      raw = %{name_cz: "Metakognitivní paralyza", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      assert technique.name == "Metacognitive Paralysis"
    end

    test "preserves untranslated Czech terms in name" do
      raw = %{name_cz: "Neznámý termín", description: "Test."}
      technique = TechniqueBuilder.build_from_raw(raw, 1)
      # Untranslated words remain as-is
      assert is_binary(technique.name)
      assert String.length(technique.name) > 0
    end
  end

  describe "list field parsing" do
    test "parses comma-separated manifestations" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: "First symptom, Second symptom, Third symptom"
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert length(technique.typical_manifestations) == 3
      assert "First symptom" in technique.typical_manifestations
    end

    test "handles nil list fields" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: nil,
        defense_strategies: nil
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique.typical_manifestations == []
      assert technique.defense_strategies == []
    end

    test "handles already-list fields" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: ["Already", "A", "List"]
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique.typical_manifestations == ["Already", "A", "List"]
    end

    test "trims whitespace in comma-separated fields" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: "  Symptom A  ,  Symptom B  ,  Symptom C  "
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert "Symptom A" in technique.typical_manifestations
      assert "Symptom B" in technique.typical_manifestations
      assert "Symptom C" in technique.typical_manifestations
    end

    test "filters empty entries from comma-separated fields" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: "Symptom A,,, Symptom B,"
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert length(technique.typical_manifestations) == 2
    end

    test "handles single-item list fields" do
      raw = %{
        name_cz: "Test",
        description: "Description.",
        typical_manifestations: "Single symptom"
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique.typical_manifestations == ["Single symptom"]
    end
  end

  # ===========================================================================
  # Property-Based Style Tests: ID Generation Invariants
  # ===========================================================================

  describe "ID generation invariants" do
    @czech_names [
      "Epistemická imploze",
      "Absolutní egologická dezintegrace",
      "Kognitivní pandemonium",
      "Axiologická anihilace",
      "Transfinitní epistemická regrese",
      "Fenomenologická dezintegrace",
      "Hyperontologická negace",
      "Superkognitivní paralýza",
      "Reflexivita perverze",
      "Epistemická anti-pluralita"
    ]

    test "ID generation is deterministic for all sample names" do
      for name <- @czech_names do
        id1 = TechniqueBuilder.generate_id(name)
        id2 = TechniqueBuilder.generate_id(name)

        assert id1 == id2,
               "Non-deterministic ID for '#{name}': #{inspect(id1)} vs #{inspect(id2)}"
      end
    end

    test "all generated IDs are atoms" do
      for name <- @czech_names do
        id = TechniqueBuilder.generate_id(name)
        assert is_atom(id), "ID for '#{name}' is not an atom: #{inspect(id)}"
      end
    end

    test "all generated IDs contain only valid characters" do
      for name <- @czech_names do
        id = TechniqueBuilder.generate_id(name)
        id_str = Atom.to_string(id)

        assert Regex.match?(~r/^[a-z0-9_]*$/, id_str),
               "ID #{inspect(id)} from '#{name}' contains invalid characters"
      end
    end

    test "distinct names produce distinct IDs" do
      ids = Enum.map(@czech_names, &TechniqueBuilder.generate_id/1)
      assert length(ids) == length(Enum.uniq(ids)), "Duplicate IDs found among distinct names"
    end

    test "case variation produces same ID" do
      for name <- @czech_names do
        upper = TechniqueBuilder.generate_id(String.upcase(name))
        lower = TechniqueBuilder.generate_id(String.downcase(name))
        original = TechniqueBuilder.generate_id(name)

        assert upper == lower, "Case sensitivity in ID generation for '#{name}'"
        assert original == lower, "Original vs lowercase mismatch for '#{name}'"
      end
    end
  end

  # ===========================================================================
  # Property-Based Style Tests: Severity Mapping Invariants
  # ===========================================================================

  describe "severity mapping invariants" do
    @all_czech_severities [
      {"Extrémní", :terminal},
      {"Terminální", :terminal},
      {"Kritická", :critical},
      {"Vysoká", :high},
      {"Střední", :medium},
      {"Střední až vysoká", :high},
      {"Nízká", :low}
    ]

    test "severity mapping covers all known values" do
      for {czech, expected} <- @all_czech_severities do
        result = TechniqueBuilder.map_severity(czech)

        assert result == expected,
               "'#{czech}' mapped to #{inspect(result)}, expected #{inspect(expected)}"
      end
    end

    test "severity always returns valid atom from known set" do
      valid_results = [:terminal, :critical, :high, :medium, :low, :unknown]

      test_inputs = [
        "Extrémní",
        "Kritická",
        "Vysoká",
        "Střední",
        "Nízká",
        nil,
        "",
        "Random",
        "Not a severity"
      ]

      for input <- test_inputs do
        result = TechniqueBuilder.map_severity(input)

        assert result in valid_results,
               "map_severity(#{inspect(input)}) returned #{inspect(result)}"
      end
    end

    test "fuzzy matching via substring handles variants" do
      # These contain the key substrings and should resolve correctly
      assert :terminal == TechniqueBuilder.map_severity("Extrémně vysoká")
      assert :critical == TechniqueBuilder.map_severity("Kritická a nebezpečná")
      assert :high == TechniqueBuilder.map_severity("Vysoká intenzita")
      assert :low == TechniqueBuilder.map_severity("Nízká pravděpodobnost")
    end
  end

  # ===========================================================================
  # Property-Based Style Tests: Reversibility Mapping Invariants
  # ===========================================================================

  describe "reversibility mapping invariants" do
    @all_czech_reversibilities [
      {"Prakticky nereverzibilní", :practically_irreversible},
      {"Nereverzibilní", :irreversible},
      {"Velmi obtížně reverzibilní", :very_difficult},
      {"Obtížně reverzibilní", :difficult},
      {"Částečně reverzibilní", :moderate},
      {"Relativně reverzibilní", :moderate},
      {"Středně obtížně reverzibilní", :moderate}
    ]

    test "reversibility mapping covers all known values" do
      for {czech, expected} <- @all_czech_reversibilities do
        result = TechniqueBuilder.map_reversibility(czech)

        assert result == expected,
               "'#{czech}' mapped to #{inspect(result)}, expected #{inspect(expected)}"
      end
    end

    test "reversibility always returns valid atom from known set" do
      valid_results = [
        :irreversible,
        :practically_irreversible,
        :very_difficult,
        :difficult,
        :moderate,
        :high,
        :unknown
      ]

      test_inputs = [
        "Prakticky nereverzibilní",
        "Obtížně reverzibilní",
        nil,
        "",
        "Random"
      ]

      for input <- test_inputs do
        result = TechniqueBuilder.map_reversibility(input)

        assert result in valid_results,
               "map_reversibility(#{inspect(input)}) returned #{inspect(result)}"
      end
    end
  end

  # ===========================================================================
  # Category Mapping Comprehensive Tests
  # ===========================================================================

  describe "category mapping comprehensive" do
    @category_test_cases [
      {"Fundamentální epistemická destrukce", :singularity},
      {"Epistemická manipulace", :singularity},
      {"Patologický kognitivní vzorec", :singularity},
      {"Strukturální epistemická destrukce", :singularity},
      {"Artikulační epistemická negace", :metatranscendental},
      {"Logický destruktivní mechanismus", :metatranscendental},
      {"Strukturální fragmentační technika", :hypertransformative},
      {"Dissoluční epistemická technika", :hypertransformative},
      {"Rekurzivní kognitivní porucha", :paradoxical},
      {"Destruktivní metakognitivní proces", :paradoxical},
      {"Legitimizační destruktivní technika", :delegitimization},
      {"Subjektivní disociační technika", :transconceptual}
    ]

    test "all known Czech category names map correctly" do
      for {czech_name, expected_category} <- @category_test_cases do
        raw = %{category: czech_name}
        result = TechniqueBuilder.determine_category(raw, [])

        assert result == expected_category,
               "'#{czech_name}' mapped to #{inspect(result)}, expected #{inspect(expected_category)}"
      end
    end

    test "nil category defaults to :singularity" do
      assert :singularity == TechniqueBuilder.determine_category(%{category: nil}, [])
      assert :singularity == TechniqueBuilder.determine_category(%{}, [])
    end

    test "option override takes precedence over metadata" do
      raw = %{category: "Fundamentální epistemická destrukce"}

      for category <- [
            :singularity,
            :metatranscendental,
            :hypertransformative,
            :paradoxical,
            :transconceptual
          ] do
        result = TechniqueBuilder.determine_category(raw, category: category)
        assert result == category
      end
    end
  end

  # ===========================================================================
  # Chapter Determination Comprehensive Tests
  # ===========================================================================

  describe "chapter determination comprehensive" do
    @category_chapter_map %{
      singularity: 6,
      metatranscendental: 7,
      hypertransformative: 8,
      paradoxical: 9,
      transconceptual: 10,
      diagnostic: 11,
      therapeutic: 12,
      preventive: 13
    }

    test "each category maps to correct chapter" do
      for {category, expected_chapter} <- @category_chapter_map do
        result = TechniqueBuilder.determine_chapter(category, [])

        assert result == expected_chapter,
               "Category #{category} mapped to chapter #{result}, expected #{expected_chapter}"
      end
    end

    test "chapter override only accepts valid range 1-15" do
      # Valid chapter overrides should work
      for chapter <- 1..15 do
        result = TechniqueBuilder.determine_chapter(:singularity, chapter: chapter)
        assert result == chapter
      end

      # Invalid chapters should fall back to category default
      assert 6 == TechniqueBuilder.determine_chapter(:singularity, chapter: 0)
      assert 6 == TechniqueBuilder.determine_chapter(:singularity, chapter: 16)
      assert 6 == TechniqueBuilder.determine_chapter(:singularity, chapter: -1)
    end
  end

  # ===========================================================================
  # Build Pipeline Integration
  # ===========================================================================

  describe "build pipeline integration" do
    test "full build pipeline produces complete technique" do
      raw = %{
        name_cz: "Epistemická dezintegrace",
        anchor: "epistemicka-dezintegrace",
        category: "Fundamentální epistemická destrukce",
        severity: "Kritická",
        reversibility: "Obtížně reverzibilní",
        domain: "Epistemické pole",
        temporal_course: "Postupný",
        typical_manifestations: "Fragmentace, rozpad, ztráta koherence",
        defense_strategies: "Epistemická stabilizace, kognitivní podpora",
        description:
          "Proces postupného rozpadu kognitivních struktur vedoucí ke kompletní dezintegraci.",
        example: "Student filozofie postupně ztrácí koherenci.",
        see_also: ["epistemicka-imploze", "kognitivni-kolaps"]
      }

      technique = TechniqueBuilder.build_from_raw(raw, 42)

      # Verify all required fields are populated
      assert technique.id == :epistemicka_dezintegrace
      assert is_binary(technique.name)
      assert technique.name_cz == "Epistemická dezintegrace"
      assert technique.category == :singularity
      assert technique.chapter == 6
      assert technique.technique_number == 42
      assert technique.severity == :critical
      assert technique.reversibility == :difficult
      assert technique.temporal_course == "Postupný"
      assert length(technique.typical_manifestations) == 3
      assert length(technique.defense_strategies) == 2
      assert String.contains?(technique.description, "dezintegraci")
      assert is_binary(technique.detailed_principle)
      assert is_binary(technique.example)
      assert length(technique.see_also) == 2
      assert is_list(technique.detection_patterns)
      assert is_list(technique.keywords)
    end

    test "build_from_raw handles all-nil optional fields" do
      raw = %{
        name_cz: "Test Only Required",
        anchor: nil,
        category: nil,
        severity: nil,
        reversibility: nil,
        domain: nil,
        temporal_course: nil,
        typical_manifestations: nil,
        defense_strategies: nil,
        description: nil,
        example: nil,
        see_also: nil
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      assert technique != nil
      assert technique.id == :test_only_required
      assert technique.severity == :unknown
      assert technique.reversibility == :unknown
      assert technique.typical_manifestations == []
      assert technique.defense_strategies == []
      assert technique.see_also == []
      assert technique.temporal_course == ""
      assert technique.description == ""
    end

    test "keyword generation includes both name and description words" do
      raw = %{
        name_cz: "Epistemická fragmentace strukturální",
        description:
          "Process of epistemic fragmentation. The fragmentation leads to complete " <>
            "fragmentation of all structures. This fragmentation cannot be reversed."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      # Keywords from name retain original Czech characters (not transliterated).
      # The generate_keywords function splits on non-alpha chars and filters by length > 3.
      # Czech keywords include diacritics: "epistemická", "fragmentace", "strukturální"
      assert "epistemická" in technique.keywords or "epistemicka" in technique.keywords,
             "Expected epistemic keyword not found in #{inspect(technique.keywords)}"

      assert "fragmentace" in technique.keywords,
             "'fragmentace' should appear in keywords: #{inspect(technique.keywords)}"

      # Description keywords that appear >= 2 times and > 5 chars should be included
      assert "fragmentation" in technique.keywords,
             "'fragmentation' should appear in keywords: #{inspect(technique.keywords)}"
    end

    test "detection pattern generation from manifestations and description" do
      raw = %{
        name_cz: "Test Detection",
        typical_manifestations: "Cognitive collapse, Epistemic failure, Knowledge loss",
        description: "This involves destrukce and anihilace of cognitive systems."
      }

      technique = TechniqueBuilder.build_from_raw(raw, 1)

      # Manifestations should be converted to snake_case detection patterns
      assert "cognitive_collapse" in technique.detection_patterns
      assert "epistemic_failure" in technique.detection_patterns
      assert "knowledge_loss" in technique.detection_patterns

      # Description keywords should generate patterns
      assert "destrukce_pattern" in technique.detection_patterns
      assert "anihilace_pattern" in technique.detection_patterns
    end
  end

  # ===========================================================================
  # Performance Tests
  # ===========================================================================

  describe "build performance" do
    test "generating 100 IDs completes in under 50ms" do
      names =
        for i <- 1..100 do
          "Epistemická technika číslo #{i}"
        end

      start = System.monotonic_time(:millisecond)

      for name <- names do
        TechniqueBuilder.generate_id(name)
      end

      elapsed = System.monotonic_time(:millisecond) - start

      assert elapsed < 50, "100 ID generations took #{elapsed}ms"
    end

    test "building 50 techniques completes in under 100ms" do
      raws =
        for i <- 1..50 do
          %{
            name_cz: "Technika #{i}",
            description: "Popis techniky číslo #{i} s dostatečným textem.",
            severity: "Kritická",
            category: "Fundamentální epistemická destrukce",
            typical_manifestations: "Projev A, Projev B",
            defense_strategies: "Obrana A, Obrana B"
          }
        end

      start = System.monotonic_time(:millisecond)

      for {raw, i} <- Enum.with_index(raws, 1) do
        TechniqueBuilder.build_from_raw(raw, i)
      end

      elapsed = System.monotonic_time(:millisecond) - start

      assert elapsed < 100, "Building 50 techniques took #{elapsed}ms"
    end
  end
end
