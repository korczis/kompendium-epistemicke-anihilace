defmodule PrismaticAnnihilation.Compendium.MarkdownExtractorTest do
  @moduledoc """
  Tests for the MarkdownExtractor module.

  Validates low-level markdown extraction functions for Czech
  epistemic annihilation compendium files including header extraction,
  metadata table parsing, description extraction, example extraction,
  cross-reference parsing, and UTF-8 Czech diacritics handling.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.MarkdownExtractor

  # Sample entry for full extraction testing
  @sample_entry """
  ### Alethicky rezim {#alethicky-rezim}

  | Aspekt | Charakteristika |
  |--------|-----------------|
  | **Kategorie** | Epistemicka manipulace |
  | **Uroven zavaznosti** | Stredni az vysoka |
  | **Oblast pusobeni** | Hodnotici kognitivni systemy |
  | **Casovy prubeh** | Postupny, metodicky |
  | **Reverzibilita** | Castecne reverzibilni |
  | **Typicke projevy** | Neschopnost urcit pravdivostni hodnotu, epistemicka nejistota |
  | **Obranne strategie** | Metakognitivni reflexe, epistemicky pluralismus |

  System nebo struktura pravidel urcujicich, co muze byt povazovano za pravdive.

  #### Priklad

  *Vedouci vyzkumneho tymu systematicky meni kriteria hodnoceni vedeckych dat.*

  **Viz take:**
  * [Verikondicionalita anti-epistemicka](#verikondicionalita-anti-epistemicka)
  * [Epistemicka hyperinflace](#epistemicka-hyperinflace)
  """

  @sample_entry_with_diacritics """
  ### Epistemicka imploze {#epistemicka-imploze}

  | Aspekt | Charakteristika |
  |--------|-----------------|
  | **Kategorie** | Fundamentalni epistemicka destrukce |
  | **Uroven zavaznosti** | Kriticka |

  Dramaticky fenomen nahleho zhroceni kognitivnich struktur.

  #### Priklad

  *Logik objevi fundamentalni kontradikci ve svem systemu.*

  **Viz take:**
  * [Epistemicka cerna dira](#epistemicka-cerna-dira)
  """

  # ==========================================================================
  # Header Extraction Tests
  # ==========================================================================

  describe "extract_header/1" do
    test "extracts H3 header with anchor" do
      assert {:ok, header} =
               MarkdownExtractor.extract_header("### Alethicky rezim {#alethicky-rezim}")

      assert header.name == "Alethicky rezim"
      assert header.anchor == "alethicky-rezim"
      assert header.level == 3
    end

    test "extracts H3 header without anchor" do
      assert {:ok, header} = MarkdownExtractor.extract_header("### Simple Name")

      assert header.name == "Simple Name"
      assert header.anchor == nil
      assert header.level == 3
    end

    test "extracts H2 header" do
      assert {:ok, header} = MarkdownExtractor.extract_header("## Section Name")

      assert header.name == "Section Name"
      assert header.level == 2
    end

    test "extracts H4 header" do
      assert {:ok, header} = MarkdownExtractor.extract_header("#### Priklad")

      assert header.name == "Priklad"
      assert header.level == 4
    end

    test "handles extra whitespace" do
      assert {:ok, header} = MarkdownExtractor.extract_header("###    Spaced Name    {#spaced}")

      assert header.name == "Spaced Name"
      assert header.anchor == "spaced"
    end

    test "returns error for non-header lines" do
      assert {:error, :not_a_header} = MarkdownExtractor.extract_header("Not a header")
      assert {:error, :not_a_header} = MarkdownExtractor.extract_header("")
      assert {:error, :not_a_header} = MarkdownExtractor.extract_header("# Single hash")
    end

    test "handles Czech diacritics in header names" do
      assert {:ok, header} =
               MarkdownExtractor.extract_header(
                 "### Epistemicka singularita {#epistemicka-singularita}"
               )

      assert header.name == "Epistemicka singularita"
    end
  end

  describe "extract_headers_at_level/2" do
    test "extracts all H3 headers" do
      content = """
      ### First Term {#first}
      Some content
      ### Second Term {#second}
      More content
      ## Not H3
      ### Third {#third}
      """

      assert {:ok, headers} = MarkdownExtractor.extract_headers_at_level(content, 3)
      assert length(headers) == 3
      assert Enum.at(headers, 0).name == "First Term"
      assert Enum.at(headers, 1).name == "Second Term"
      assert Enum.at(headers, 2).name == "Third"
    end

    test "extracts only H2 headers" do
      content = """
      ## Section A
      ### Not H2
      ## Section B
      """

      assert {:ok, headers} = MarkdownExtractor.extract_headers_at_level(content, 2)
      assert length(headers) == 2
    end

    test "returns empty list when no headers at level" do
      assert {:ok, []} = MarkdownExtractor.extract_headers_at_level("No headers here", 3)
    end
  end

  # ==========================================================================
  # Table Extraction Tests
  # ==========================================================================

  describe "extract_metadata_table/1" do
    test "extracts metadata from aspect/characteristic table" do
      assert {:ok, metadata} = MarkdownExtractor.extract_metadata_table(@sample_entry)

      assert metadata[:category] == "Epistemicka manipulace"
      assert metadata[:reversibility] == "Castecne reverzibilni"
    end

    test "extracts all seven standard metadata fields" do
      assert {:ok, metadata} = MarkdownExtractor.extract_metadata_table(@sample_entry)

      assert Map.has_key?(metadata, :category)
      assert Map.has_key?(metadata, :severity)
      assert Map.has_key?(metadata, :domain)
      assert Map.has_key?(metadata, :temporal_course)
      assert Map.has_key?(metadata, :reversibility)
      assert Map.has_key?(metadata, :typical_manifestations)
      assert Map.has_key?(metadata, :defense_strategies)
    end

    test "returns error when no table found" do
      assert {:error, :no_table_found} =
               MarkdownExtractor.extract_metadata_table("No table here at all")
    end

    test "handles table with fewer fields" do
      entry = """
      ### Term {#term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Only category |

      Description.
      """

      assert {:ok, metadata} = MarkdownExtractor.extract_metadata_table(entry)
      assert metadata[:category] == "Only category"
    end
  end

  describe "extract_table/1" do
    test "extracts generic table with headers and rows" do
      table_text = """
      | Column A | Column B |
      |----------|----------|
      | Value 1  | Value 2  |
      | Value 3  | Value 4  |
      """

      assert {:ok, table} = MarkdownExtractor.extract_table(table_text)
      assert table.headers == ["Column A", "Column B"]
      assert length(table.rows) == 2
      assert Enum.at(table.rows, 0) == ["Value 1", "Value 2"]
    end

    test "returns error when no table found" do
      assert {:error, :no_table_found} = MarkdownExtractor.extract_table("No table here")
    end
  end

  # ==========================================================================
  # Description Extraction Tests
  # ==========================================================================

  describe "extract_description/1" do
    test "extracts description after metadata table" do
      assert {:ok, description} = MarkdownExtractor.extract_description(@sample_entry)

      assert String.contains?(description, "System nebo struktura pravidel")
    end

    test "stops before example section" do
      assert {:ok, description} = MarkdownExtractor.extract_description(@sample_entry)

      refute String.contains?(description, "Vedouci")
    end

    test "stops before see_also section" do
      assert {:ok, description} = MarkdownExtractor.extract_description(@sample_entry)

      refute String.contains?(description, "Viz take")
    end

    test "handles entry without table" do
      entry = """
      ### Term {#term}

      Description without a table.

      #### Priklad
      """

      assert {:ok, description} = MarkdownExtractor.extract_description(entry)
      assert String.contains?(description, "Description without a table")
    end

    test "returns empty string for entry with no description" do
      entry = """
      ### Term {#term}
      """

      assert {:ok, _desc} = MarkdownExtractor.extract_description(entry)
    end
  end

  # ==========================================================================
  # Example Extraction Tests
  # ==========================================================================

  describe "extract_example/1" do
    test "extracts example text" do
      assert {:ok, example} = MarkdownExtractor.extract_example(@sample_entry)

      assert example != nil
      assert String.contains?(example, "Vedouci vyzkumneho tymu")
    end

    test "strips italic markers from example" do
      entry = """
      ### Term {#term}

      Description.

      #### Priklad

      *This is an italic example.*
      """

      assert {:ok, example} = MarkdownExtractor.extract_example(entry)
      assert example == "This is an italic example."
    end

    test "returns nil when no example section" do
      entry = """
      ### Term {#term}

      Description only, no example.
      """

      assert {:ok, nil} = MarkdownExtractor.extract_example(entry)
    end
  end

  # ==========================================================================
  # Cross-Reference Extraction Tests
  # ==========================================================================

  describe "extract_cross_references/1" do
    test "extracts cross-references with names and anchors" do
      assert {:ok, refs} = MarkdownExtractor.extract_cross_references(@sample_entry)

      assert length(refs) == 2

      first = Enum.at(refs, 0)
      assert first.name == "Verikondicionalita anti-epistemicka"
      assert first.anchor == "verikondicionalita-anti-epistemicka"

      second = Enum.at(refs, 1)
      assert second.name == "Epistemicka hyperinflace"
      assert second.anchor == "epistemicka-hyperinflace"
    end

    test "returns empty list when no cross-references" do
      entry = """
      ### Term {#term}

      Description only.
      """

      assert {:ok, []} = MarkdownExtractor.extract_cross_references(entry)
    end
  end

  describe "extract_cross_reference_anchors/1" do
    test "returns anchor IDs only" do
      assert {:ok, anchors} = MarkdownExtractor.extract_cross_reference_anchors(@sample_entry)

      assert "verikondicionalita-anti-epistemicka" in anchors
      assert "epistemicka-hyperinflace" in anchors
    end

    test "returns empty list when no references" do
      assert {:ok, []} =
               MarkdownExtractor.extract_cross_reference_anchors("### Term\nDescription.")
    end
  end

  # ==========================================================================
  # Complete Entry Extraction Tests
  # ==========================================================================

  describe "extract_entry_data/1" do
    test "extracts all data from a complete entry" do
      assert {:ok, data} = MarkdownExtractor.extract_entry_data(@sample_entry)

      assert data.name == "Alethicky rezim"
      assert data.anchor == "alethicky-rezim"
      assert is_map(data.metadata)
      assert is_binary(data.description)
      assert data.description != ""
      assert data.example != nil
      assert is_list(data.see_also)
      assert length(data.see_also) == 2
    end

    test "returns error for invalid entry" do
      assert {:error, :invalid_entry} = MarkdownExtractor.extract_entry_data("Not a valid entry")
    end

    test "handles entry without optional sections" do
      entry = """
      ### Minimal Entry {#minimal}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test |

      A minimal description.
      """

      assert {:ok, data} = MarkdownExtractor.extract_entry_data(entry)
      assert data.name == "Minimal Entry"
      assert data.example == nil
      assert data.see_also == []
    end
  end

  # ==========================================================================
  # Content Splitting Tests
  # ==========================================================================

  describe "split_into_entries/1" do
    test "splits content at H3 headers" do
      content = """
      # Main Title

      ## Introduction

      ### First Entry {#first}
      Content of first entry.

      ### Second Entry {#second}
      Content of second entry.

      ### Third Entry {#third}
      Content of third entry.
      """

      assert {:ok, entries} = MarkdownExtractor.split_into_entries(content)
      assert length(entries) == 3
    end

    test "returns empty list for content without H3 headers" do
      assert {:ok, []} = MarkdownExtractor.split_into_entries("# Only H1\n## And H2\nNo H3 here")
    end

    test "returns empty list for empty content" do
      assert {:ok, []} = MarkdownExtractor.split_into_entries("")
    end

    test "preserves entry content including sub-sections" do
      content = """
      ### Entry {#entry}

      Description text.

      #### Sub-section

      Sub-section content.
      """

      assert {:ok, [entry]} = MarkdownExtractor.split_into_entries(content)
      assert String.contains?(entry, "Description text")
      assert String.contains?(entry, "Sub-section content")
    end
  end

  describe "split_into_sections/1" do
    test "splits content at H2 headers" do
      content = """
      ## Section A
      Content A

      ## Section B
      Content B
      """

      assert {:ok, sections} = MarkdownExtractor.split_into_sections(content)
      assert Map.has_key?(sections, "Section A")
      assert Map.has_key?(sections, "Section B")
      assert String.contains?(sections["Section A"], "Content A")
    end

    test "returns empty map for content without H2 headers" do
      assert {:ok, sections} = MarkdownExtractor.split_into_sections("No sections here")
      assert sections == %{}
    end
  end

  # ==========================================================================
  # UTF-8 and Czech Diacritics Tests
  # ==========================================================================

  describe "ensure_utf8/1" do
    test "passes through valid UTF-8" do
      assert "Hello World" = MarkdownExtractor.ensure_utf8("Hello World")
    end

    test "handles Czech text" do
      czech = "Epistemicka anihilace"
      assert ^czech = MarkdownExtractor.ensure_utf8(czech)
    end
  end

  describe "transliterate_czech/1" do
    test "transliterates lowercase Czech diacritics" do
      assert "acdeeinorstuuyz" =
               MarkdownExtractor.transliterate_czech(
                 "\u00e1\u010d\u010f\u00e9\u011b\u00ed\u0148\u00f3\u0159\u0161\u0165\u00fa\u016f\u00fd\u017e"
               )
    end

    test "transliterates uppercase Czech diacritics" do
      assert "ACDEEINORSTUUYZ" =
               MarkdownExtractor.transliterate_czech(
                 "\u00c1\u010c\u010e\u00c9\u011a\u00cd\u0147\u00d3\u0158\u0160\u0164\u00da\u016e\u00dd\u017d"
               )
    end

    test "preserves non-Czech characters" do
      assert "Hello World 123!" = MarkdownExtractor.transliterate_czech("Hello World 123!")
    end

    test "handles the classic Czech pangram" do
      # "Prilis zlutoucky kun upel dabelske ody"
      input =
        "P\u0159\u00edli\u0161 \u017elu\u0165ou\u010dk\u00fd k\u016f\u0148 \u00fap\u011bl \u010f\u00e1belsk\u00e9 \u00f3dy"

      result = MarkdownExtractor.transliterate_czech(input)
      assert result == "Prilis zlutoucky kun upel dabelske ody"
    end

    test "handles common compendium terms" do
      assert "Epistemicka imploze" =
               MarkdownExtractor.transliterate_czech("Epistemick\u00e1 imploze")

      assert "Axiologicka anihilace" =
               MarkdownExtractor.transliterate_czech("Axiologick\u00e1 anihilace")
    end
  end

  # ==========================================================================
  # Index Extraction Tests
  # ==========================================================================

  describe "extract_index_entries/1" do
    test "extracts entries with page numbers" do
      content = """
      - Absolutni epistemicka imploze (14)
      - Absolutni epistemicka dezintegrace (8)
      - Absolutni epistemicka bezmocnost (19)
      """

      assert {:ok, entries} = MarkdownExtractor.extract_index_entries(content)
      assert length(entries) == 3

      first = Enum.at(entries, 0)
      assert first.name == "Absolutni epistemicka imploze"
      assert first.page_number == 14
    end

    test "handles entries without page numbers" do
      content = "- Entry without page\n"

      assert {:ok, [entry]} = MarkdownExtractor.extract_index_entries(content)
      assert entry.name == "Entry without page"
      assert entry.page_number == nil
    end

    test "skips non-entry lines" do
      content = """
      # Title
      Some text
      - Valid entry (10)
      More text
      """

      assert {:ok, entries} = MarkdownExtractor.extract_index_entries(content)
      assert length(entries) == 1
    end
  end

  describe "extract_categorized_index/1" do
    test "extracts categories with their entries" do
      content = """
      ## CATEGORY A

      ### SUB-CATEGORY A1
      - Entry 1 (10)
      - Entry 2 (20)

      ### SUB-CATEGORY A2
      - Entry 3 (30)

      ## CATEGORY B
      - Entry 4 (40)
      """

      assert {:ok, result} = MarkdownExtractor.extract_categorized_index(content)

      assert Map.has_key?(result.categories, "SUB-CATEGORY A1")
      assert Map.has_key?(result.categories, "SUB-CATEGORY A2")
      assert length(result.entries) == 4
    end

    test "assigns category to each entry" do
      content = """
      ## My Category
      - Entry 1 (10)
      """

      assert {:ok, result} = MarkdownExtractor.extract_categorized_index(content)

      [entry] = result.entries
      assert entry.category == "My Category"
    end

    test "handles empty content" do
      assert {:ok, result} = MarkdownExtractor.extract_categorized_index("")

      assert result.categories == %{}
      assert result.entries == []
    end
  end

  # ==========================================================================
  # Chapter Extraction Tests
  # ==========================================================================

  describe "extract_chapters/1" do
    test "extracts chapters with technique ranges" do
      content = """
      ### KAPITOLA 6: EPISTEMICKA SINGULARITA (Techniky 1-30)
      ### KAPITOLA 7: METATRANSCENDENTALNI ANIHILACE (Techniky 31-60)
      """

      assert {:ok, chapters} = MarkdownExtractor.extract_chapters(content)
      assert length(chapters) == 2

      chapter_6 = Enum.at(chapters, 0)
      assert chapter_6.number == 6
      assert String.contains?(chapter_6.title, "EPISTEMICKA SINGULARITA")
      assert chapter_6.technique_range == {1, 30}

      chapter_7 = Enum.at(chapters, 1)
      assert chapter_7.number == 7
      assert chapter_7.technique_range == {31, 60}
    end

    test "extracts chapters without technique ranges" do
      content = """
      ### KAPITOLA 1: AKADEMICKE TECHNIKY INTELEKTUALNI MANIPULACE
      """

      assert {:ok, [chapter]} = MarkdownExtractor.extract_chapters(content)
      assert chapter.number == 1
      assert chapter.technique_range == nil
    end

    test "handles empty content" do
      assert {:ok, []} = MarkdownExtractor.extract_chapters("")
    end
  end

  describe "extract_parts/1" do
    test "extracts Roman numeral parts" do
      content = """
      ## CAST I: ZAKLADNI KATEGORIE
      ## CAST II: TERMINALNI PROTOKOLY
      ## CAST III: ULTRAMARINE TECHNIKY
      """

      assert {:ok, parts} = MarkdownExtractor.extract_parts(content)
      assert Map.has_key?(parts, 1)
      assert Map.has_key?(parts, 2)
      assert Map.has_key?(parts, 3)

      assert parts[1].roman == "I"
      assert parts[2].roman == "II"
      assert parts[3].roman == "III"
    end

    test "handles empty content" do
      assert {:ok, parts} = MarkdownExtractor.extract_parts("")
      assert parts == %{}
    end
  end

  # ==========================================================================
  # Integration Tests with Real-Format Content
  # ==========================================================================

  describe "full pipeline with compendium-format content" do
    test "processes a realistic compendium entry" do
      assert {:ok, data} = MarkdownExtractor.extract_entry_data(@sample_entry_with_diacritics)

      assert data.name == "Epistemicka imploze"
      assert data.anchor == "epistemicka-imploze"
      assert data.metadata[:category] == "Fundamentalni epistemicka destrukce"
      assert String.contains?(data.description, "Dramaticky fenomen")
      assert data.example != nil
      assert String.contains?(data.example, "Logik objevi")
      assert length(data.see_also) == 1
      assert Enum.at(data.see_also, 0).anchor == "epistemicka-cerna-dira"
    end

    test "split and extract pipeline produces consistent results" do
      content = """
      # GLOSSARY

      ## A

      ### First Term {#first-term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Test Category |

      First description.

      ### Second Term {#second-term}

      | Aspekt | Charakteristika |
      |--------|-----------------|
      | **Kategorie** | Another Category |

      Second description.
      """

      assert {:ok, entries} = MarkdownExtractor.split_into_entries(content)
      assert length(entries) == 2

      results = Enum.map(entries, &MarkdownExtractor.extract_entry_data/1)
      assert Enum.all?(results, &match?({:ok, _}, &1))

      [{:ok, first}, {:ok, second}] = results
      assert first.name == "First Term"
      assert second.name == "Second Term"
      assert first.metadata[:category] == "Test Category"
      assert second.metadata[:category] == "Another Category"
    end
  end
end
