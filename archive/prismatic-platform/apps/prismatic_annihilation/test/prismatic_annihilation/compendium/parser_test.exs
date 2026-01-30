defmodule PrismaticAnnihilation.Compendium.ParserTest do
  @moduledoc """
  Tests for the Compendium Parser module.

  Validates parsing of markdown source files from the Epistemic
  Annihilation Compendium including detailed glossary, thematic
  index, and table of contents.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.Parser

  # Sample glossary entry for testing
  @sample_glossary_entry """
  ### Alethický režim {#alethicky-rezim}

  | Aspekt | Charakteristika |
  |--------|-----------------|
  | **Kategorie** | Epistemická manipulace |
  | **Úroveň závažnosti** | Střední až vysoká |
  | **Oblast působení** | Hodnotící kognitivní systémy |
  | **Časový průběh** | Postupný, metodický |
  | **Reverzibilita** | Částečně reverzibilní |
  | **Typické projevy** | Neschopnost určit pravdivostní hodnotu, epistemická nejistota |
  | **Obranné strategie** | Metakognitivní reflexe, epistemický pluralismus |

  Systém nebo struktura pravidel určujících, co může být považováno za pravdivé, nepravdivé nebo neurčité v rámci daného epistemického pole.

  #### Příklad

  *Vedoucí výzkumného týmu systematicky mění kritéria hodnocení vědeckých dat.*

  **Viz také:**
  * [Verikondicionalita anti-epistemická](#verikondicionalita-anti-epistemicka)
  * [Epistemická hyperinflace](#epistemicka-hyperinflace)
  """

  @sample_thematic_index """
  # TEMATICKÝ REJSTŘÍK TECHNIK EPISTEMICKÉ A KOGNITIVNÍ ANIHILACE

  ## EPISTEMICKÉ DESTRUKČNÍ TECHNIKY

  ### ZÁKLADNÍ EPISTEMICKÁ ANIHILACE
  - Absolutní epistemická imploze (14)
  - Absolutní epistemická dezintegrace (8)
  - Absolutní epistemická bezmocnost (19)

  ### METAEPISTEMICKÉ TECHNIKY
  - Absolutní epistemická rekurzivní negace (50)
  - Absolutní epistemická sebenegace (64)
  """

  @sample_toc """
  # STRUKTURA KOMPENDIA

  ## ČÁST I: ZÁKLADNÍ KATEGORIE

  ### KAPITOLA 1: AKADEMICKÉ TECHNIKY INTELEKTUÁLNÍ MANIPULACE
  ### KAPITOLA 2: SCÉNÁŘE EPISTEMICKÉ DELEGITIMIZACE

  ## ČÁST II: TERMINÁLNÍ PROTOKOLY

  ### KAPITOLA 6: EPISTEMICKÁ SINGULARITA (Techniky 1-30)
  ### KAPITOLA 7: METATRANSCENDENTÁLNÍ ANIHILACE (Techniky 31-60)
  """

  describe "parse_detailed_glossary/1" do
    test "parses a valid glossary content" do
      content = @sample_glossary_entry

      assert {:ok, techniques} = Parser.parse_detailed_glossary(content)
      assert is_list(techniques)
      assert length(techniques) > 0
    end

    test "extracts technique name and anchor" do
      assert {:ok, [technique | _]} = Parser.parse_detailed_glossary(@sample_glossary_entry)

      assert technique.name_cz == "Alethický režim"
      assert technique.anchor == "alethicky-rezim"
    end

    test "extracts metadata from table" do
      assert {:ok, [technique | _]} = Parser.parse_detailed_glossary(@sample_glossary_entry)

      assert technique.category == "Epistemická manipulace"
      assert technique.severity == "Střední až vysoká"
      assert technique.reversibility == "Částečně reverzibilní"
      assert String.contains?(technique.typical_manifestations, "Neschopnost určit pravdivostní hodnotu")
    end

    test "extracts description" do
      assert {:ok, [technique | _]} = Parser.parse_detailed_glossary(@sample_glossary_entry)

      assert String.contains?(technique.description, "Systém nebo struktura pravidel")
    end

    test "extracts example" do
      assert {:ok, [technique | _]} = Parser.parse_detailed_glossary(@sample_glossary_entry)

      assert technique.example != nil
      assert String.contains?(technique.example, "Vedoucí výzkumného týmu")
    end

    test "extracts see_also references" do
      assert {:ok, [technique | _]} = Parser.parse_detailed_glossary(@sample_glossary_entry)

      assert is_list(technique.see_also)
      assert "verikondicionalita-anti-epistemicka" in technique.see_also
      assert "epistemicka-hyperinflace" in technique.see_also
    end

    test "handles empty content gracefully" do
      assert {:ok, []} = Parser.parse_detailed_glossary("")
    end

    test "handles content without technique entries" do
      assert {:ok, []} = Parser.parse_detailed_glossary("# Just a heading\n\nSome text")
    end

    test "parses multiple entries" do
      content = """
      ### First Term {#first-term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      Description of first term.

      ### Second Term {#second-term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test 2 |

      Description of second term.
      """

      assert {:ok, techniques} = Parser.parse_detailed_glossary(content)
      assert length(techniques) == 2
    end
  end

  describe "parse_thematic_index/1" do
    test "parses thematic index content" do
      assert {:ok, result} = Parser.parse_thematic_index(@sample_thematic_index)

      assert is_map(result)
      assert Map.has_key?(result, :categories)
      assert Map.has_key?(result, :entries)
    end

    test "extracts category names" do
      assert {:ok, result} = Parser.parse_thematic_index(@sample_thematic_index)

      category_names = Map.keys(result.categories)
      assert "ZÁKLADNÍ EPISTEMICKÁ ANIHILACE" in category_names
      assert "METAEPISTEMICKÉ TECHNIKY" in category_names
    end

    test "extracts technique entries with page numbers" do
      assert {:ok, result} = Parser.parse_thematic_index(@sample_thematic_index)

      entry = Enum.find(result.entries, &(&1.name == "Absolutní epistemická imploze"))
      assert entry != nil
      assert entry.page_number == 14
    end

    test "assigns categories to entries" do
      assert {:ok, result} = Parser.parse_thematic_index(@sample_thematic_index)

      entry = Enum.find(result.entries, &(&1.name == "Absolutní epistemická imploze"))
      assert entry.category == "ZÁKLADNÍ EPISTEMICKÁ ANIHILACE"
    end

    test "handles empty content" do
      assert {:ok, result} = Parser.parse_thematic_index("")

      assert result.categories == %{}
      assert result.entries == []
    end
  end

  describe "parse_table_of_contents/1" do
    test "parses table of contents content" do
      assert {:ok, result} = Parser.parse_table_of_contents(@sample_toc)

      assert is_map(result)
      assert Map.has_key?(result, :chapters)
      assert Map.has_key?(result, :parts)
    end

    test "extracts chapter information" do
      assert {:ok, result} = Parser.parse_table_of_contents(@sample_toc)

      chapter_6 = Enum.find(result.chapters, &(&1.number == 6))
      assert chapter_6 != nil
      assert String.contains?(chapter_6.title, "EPISTEMICKÁ SINGULARITA")
    end

    test "extracts technique ranges from chapters" do
      assert {:ok, result} = Parser.parse_table_of_contents(@sample_toc)

      chapter_6 = Enum.find(result.chapters, &(&1.number == 6))
      assert chapter_6.technique_range == {1, 30}

      chapter_7 = Enum.find(result.chapters, &(&1.number == 7))
      assert chapter_7.technique_range == {31, 60}
    end

    test "extracts part information" do
      assert {:ok, result} = Parser.parse_table_of_contents(@sample_toc)

      assert Map.has_key?(result.parts, 1)
      assert Map.has_key?(result.parts, 2)
    end

    test "handles empty content" do
      assert {:ok, result} = Parser.parse_table_of_contents("")

      assert result.chapters == []
      assert result.parts == %{}
    end
  end

  describe "parse_technique_entry/1" do
    test "parses a complete entry" do
      technique = Parser.parse_technique_entry(@sample_glossary_entry)

      assert technique != nil
      assert is_map(technique)
      assert technique.name_cz == "Alethický režim"
    end

    test "returns nil for invalid entry" do
      assert nil == Parser.parse_technique_entry("Invalid content without headers")
    end

    test "handles entry without anchor" do
      entry = """
      ### Simple Term

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      A description.
      """

      technique = Parser.parse_technique_entry(entry)
      assert technique != nil
      assert technique.name_cz == "Simple Term"
      assert technique.anchor == nil
    end

    test "handles entry without example" do
      entry = """
      ### Term Without Example {#term-without-example}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      Description text here.

      **Viz také:**
      * [Other term](#other-term)
      """

      technique = Parser.parse_technique_entry(entry)
      assert technique != nil
      assert technique.example == nil
    end

    test "handles entry without see_also" do
      entry = """
      ### Isolated Term {#isolated-term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      Description of an isolated term.
      """

      technique = Parser.parse_technique_entry(entry)
      assert technique != nil
      assert technique.see_also == []
    end
  end

  describe "build_techniques/2" do
    test "builds techniques from raw parsed data" do
      raw_data = [
        %{
          name_cz: "Test Technique",
          anchor: "test-technique",
          category: "Epistemická manipulace",
          severity: "Vysoká",
          reversibility: "Obtížně reverzibilní",
          typical_manifestations: "Symptom 1, Symptom 2",
          defense_strategies: "Defense 1, Defense 2",
          description: "A detailed description of the test technique.",
          example: "An example case study.",
          see_also: ["related-term"]
        }
      ]

      assert {:ok, techniques} = Parser.build_techniques(raw_data, validate: false)
      assert length(techniques) == 1

      [technique] = techniques
      assert technique.id == :test_technique
      assert technique.severity == :high
      assert technique.reversibility == :difficult
    end

    test "filters out invalid techniques when validation enabled" do
      raw_data = [
        %{
          name_cz: "Valid Technique",
          anchor: "valid",
          category: "Epistemická manipulace",
          severity: "Vysoká",
          description: "A valid description that is long enough."
        },
        %{
          name_cz: "",
          anchor: "invalid",
          category: nil,
          severity: nil,
          description: ""
        }
      ]

      assert {:ok, techniques} = Parser.build_techniques(raw_data, validate: true)
      # Only the valid technique should pass validation
      assert length(techniques) <= 1
    end

    test "respects chapter option" do
      raw_data = [
        %{
          name_cz: "Chapter Test",
          category: "Epistemická manipulace",
          severity: "Vysoká",
          description: "Description for chapter test."
        }
      ]

      assert {:ok, [technique]} = Parser.build_techniques(raw_data, chapter: 9, validate: false)
      assert technique.chapter == 9
    end
  end

  describe "parse_compendium_sources/1" do
    @tag :integration
    test "parses all source files from valid path" do
      # This test requires the actual source files to be present
      base_path = "garden/gists/918701a95ea28eb31f3f3b717ea56e9b"

      case Parser.parse_compendium_sources(base_path) do
        {:ok, result} ->
          assert is_map(result)
          assert Map.has_key?(result, :glossary)
          assert Map.has_key?(result, :index)
          assert Map.has_key?(result, :toc)
          assert Map.has_key?(result, :parsed_at)

        {:error, {:file_read_error, _, :enoent}} ->
          # Skip if files not available in test environment
          :ok
      end
    end

    test "returns error for nonexistent path" do
      assert {:error, {:file_read_error, _, :enoent}} =
               Parser.parse_compendium_sources("/nonexistent/path")
    end
  end

  describe "UTF-8 handling" do
    test "handles Czech diacritics correctly" do
      entry = """
      ### Epistemická imploze {#epistemicka-imploze}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Fundamentální epistemická destrukce |
      | **Úroveň závažnosti** | Kritická |

      Dramatický fenomén náhlého zhroucení kognitivních struktur.
      """

      technique = Parser.parse_technique_entry(entry)

      assert technique.name_cz == "Epistemická imploze"
      assert String.contains?(technique.description, "Dramatický fenomén")
    end

    test "preserves Czech characters in all fields" do
      entry = """
      ### Axiologická anihilace {#axiologicka-anihilace}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Typické projevy** | Axiologický nihilismus, neschopnost evaluace |
      | **Obranné strategie** | Minimalistický axiologický pragmatismus |

      Systematická destrukce jakékoliv hodnotové báze.

      #### Příklad

      *Skupina studentů etiky je vystavena semestrovému semináři.*
      """

      technique = Parser.parse_technique_entry(entry)

      assert String.contains?(technique.typical_manifestations, "Axiologický nihilismus")
      assert String.contains?(technique.defense_strategies, "Minimalistický")
      assert String.contains?(technique.example, "semestrovému semináři")
    end
  end

  describe "edge cases" do
    test "handles entries with minimal content" do
      entry = """
      ### Minimal {#minimal}

      Short description.
      """

      technique = Parser.parse_technique_entry(entry)

      assert technique != nil
      assert technique.name_cz == "Minimal"
      assert technique.description == "Short description."
    end

    test "handles entries with extra whitespace" do
      entry = """


      ###    Spaced Term    {#spaced-term}


      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** |    Test Category    |


      Description with extra spacing.


      """

      technique = Parser.parse_technique_entry(entry)

      assert technique != nil
      assert technique.name_cz == "Spaced Term"
      assert technique.category == "Test Category"
    end

    test "handles nested markdown formatting" do
      entry = """
      ### **Bold** and *Italic* Term {#formatted}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      Description with **bold** and *italic* text.
      """

      technique = Parser.parse_technique_entry(entry)

      assert technique != nil
      # The name should be extracted including formatting
      assert String.contains?(technique.name_cz, "Bold")
    end
  end
end
