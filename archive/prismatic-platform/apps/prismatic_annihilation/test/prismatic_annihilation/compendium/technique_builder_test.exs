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
      assert :dekonstruktivni_hyperkaskada = TechniqueBuilder.generate_id("Dekonstruktivní hyperkaskáda")
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
      assert :practically_irreversible = TechniqueBuilder.map_reversibility("Prakticky nereverzibilní")
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
      assert :singularity = TechniqueBuilder.determine_category(%{category: "Epistemická manipulace"}, [])
      assert :singularity = TechniqueBuilder.determine_category(%{category: "Patologický kognitivní vzorec"}, [])
      assert :metatranscendental = TechniqueBuilder.determine_category(%{category: "Artikulační epistemická negace"}, [])
      assert :delegitimization = TechniqueBuilder.determine_category(%{category: "Legitimizační destruktivní technika"}, [])
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
      raw = %{name_cz: "Absolutní epistemická imploze", description: "Test."}
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
  end
end
