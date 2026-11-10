# TACH:EXEMPT - Pre-existing test gap, change was moduledoc or atom fix only
defmodule PrismaticAnnihilation.Compendium.MarkdownExtractor do
  @moduledoc """
  Low-level markdown extraction for Czech epistemic annihilation compendium files.

  Extracts structured data from markdown elements:
  - Headers with optional anchor IDs: `### Term Name {#anchor-id}`
  - Markdown tables with Czech field labels: `| Aspekt | Charakteristika |`
  - Definition paragraphs between structural elements
  - Example sections under `#### Priklad`
  - Cross-reference sections under `**Viz take:**`
  - Special characters and Czech diacritics (full UTF-8 support)

  This module provides the foundational extraction primitives used by
  `PrismaticAnnihilation.Compendium.Parser` for higher-level compendium parsing.

  ## Architecture

  The extraction pipeline follows a layered approach:

      Markdown Content
          |
          v
      MarkdownExtractor  (this module - raw extraction)
          |
          v
      Parser             (orchestration, file loading, entry splitting)
          |
          v
      TechniqueBuilder   (struct construction, classification)

  ## Usage

      # Extract header from a line
      {:ok, "Term Name", "anchor-id"} = MarkdownExtractor.extract_header("### Term Name {#anchor-id}")

      # Extract metadata table from entry text
      {:ok, metadata} = MarkdownExtractor.extract_metadata_table(entry_text)

      # Extract all structured data from a single entry
      {:ok, data} = MarkdownExtractor.extract_entry_data(entry_text)

  """

  @typedoc """
  Extracted header with name and optional anchor.
  """
  @type header :: %{
          name: String.t(),
          anchor: String.t() | nil,
          level: pos_integer()
        }

  @typedoc """
  Extracted metadata from an aspect/characteristic table.
  """
  @type metadata :: %{
          optional(:category) => String.t(),
          optional(:severity) => String.t(),
          optional(:domain) => String.t(),
          optional(:temporal_course) => String.t(),
          optional(:reversibility) => String.t(),
          optional(:typical_manifestations) => String.t(),
          optional(:defense_strategies) => String.t()
        }

  @typedoc """
  Extracted cross-reference with display name and anchor target.
  """
  @type cross_reference :: %{
          name: String.t(),
          anchor: String.t()
        }

  @typedoc """
  Complete extracted entry data.
  """
  @type entry_data :: %{
          name: String.t(),
          anchor: String.t() | nil,
          metadata: metadata(),
          description: String.t(),
          example: String.t() | nil,
          see_also: [cross_reference()]
        }

  # Czech metadata field label to atom key mapping.
  # Keys are downcased Czech labels from the compendium tables.
  @czech_field_mappings %{
    "kategorie" => :category,
    "uroven zavaznosti" => :severity,
    "úroveň závažnosti" => :severity,
    "oblast pusobeni" => :domain,
    "oblast působení" => :domain,
    "casovy prubeh" => :temporal_course,
    "časový průběh" => :temporal_course,
    "reverzibilita" => :reversibility,
    "typicke projevy" => :typical_manifestations,
    "typické projevy" => :typical_manifestations,
    "obranne strategie" => :defense_strategies,
    "obranné strategie" => :defense_strategies
  }

  # ============================================================================
  # Public API: Header Extraction
  # ============================================================================

  @doc """
  Extracts a header from a markdown header line.

  Supports headers with optional anchor IDs in the format:
  - `### Term Name {#anchor-id}`
  - `### Term Name` (no anchor)
  - `## Section Name` (level 2)

  ## Parameters

  - `line` - Single line of markdown text

  ## Returns

  - `{:ok, header()}` - Successfully extracted header
  - `{:error, :not_a_header}` - Line is not a valid markdown header

  ## Examples

      iex> MarkdownExtractor.extract_header("### Alethicky rezim {#alethicky-rezim}")
      {:ok, %{name: "Alethicky rezim", anchor: "alethicky-rezim", level: 3}}

      iex> MarkdownExtractor.extract_header("### Simple Name")
      {:ok, %{name: "Simple Name", anchor: nil, level: 3}}

      iex> MarkdownExtractor.extract_header("Not a header")
      {:error, :not_a_header}

  """
  @spec extract_header(String.t()) :: {:ok, header()} | {:error, :not_a_header}
  def extract_header(line) when is_binary(line) do
    trimmed = String.trim(line)

    case Regex.run(~r/^(\#{2,6})\s+(.+?)\s*\{#(.+?)\}\s*$/, trimmed) do
      [_, hashes, name, anchor] ->
        {:ok, %{name: String.trim(name), anchor: String.trim(anchor), level: String.length(hashes)}}

      _ ->
        case Regex.run(~r/^(\#{2,6})\s+(.+)$/, trimmed) do
          [_, hashes, name] ->
            {:ok, %{name: String.trim(name), anchor: nil, level: String.length(hashes)}}

          _ ->
            {:error, :not_a_header}
        end
    end
  end

  @doc """
  Extracts all headers from markdown content at a specific level.

  ## Parameters

  - `content` - Full markdown content
  - `level` - Header level to extract (2-6)

  ## Returns

  - `{:ok, [header()]}` - List of extracted headers

  ## Examples

      iex> MarkdownExtractor.extract_headers_at_level("### A\\n### B\\n## C", 3)
      {:ok, [%{name: "A", anchor: nil, level: 3}, %{name: "B", anchor: nil, level: 3}]}

  """
  @spec extract_headers_at_level(String.t(), pos_integer()) :: {:ok, [header()]}
  def extract_headers_at_level(content, level) when is_binary(content) and level in 2..6 do
    prefix = String.duplicate("#", level)

    headers =
      content
      |> String.split("\n")
      |> Enum.filter(&String.starts_with?(String.trim(&1), prefix <> " "))
      |> Enum.map(&extract_header/1)
      |> Enum.filter(&match?({:ok, _}, &1))
      |> Enum.map(fn {:ok, header} -> header end)
      |> Enum.filter(&(&1.level == level))

    {:ok, headers}
  end

  # ============================================================================
  # Public API: Table Extraction
  # ============================================================================

  @doc """
  Extracts metadata from a Czech aspect/characteristic markdown table.

  Parses tables with the format:
  ```
  | Aspekt | Charakteristika |
  |--------|-----------------|
  | **Kategorie** | Category name |
  | **Uroven zavaznosti** | Severity level |
  ```

  ## Parameters

  - `text` - Text block containing the table

  ## Returns

  - `{:ok, metadata()}` - Extracted metadata key-value pairs
  - `{:error, :no_table_found}` - No valid metadata table found

  ## Examples

      iex> text = "| Aspekt | Charakteristika |\\n|--|--|\\n| **Kategorie** | Test |"
      iex> {:ok, metadata} = MarkdownExtractor.extract_metadata_table(text)
      iex> metadata.category
      "Test"

  """
  @spec extract_metadata_table(String.t()) :: {:ok, metadata()} | {:error, :no_table_found}
  def extract_metadata_table(text) when is_binary(text) do
    table_regex = ~r/\| Aspekt \| Charakteristika \|[\s\S]*?(?=\n\n|\n####|\n###|\n\*\*Viz|\z)/

    case Regex.run(table_regex, text) do
      [table_text] ->
        metadata = parse_table_rows(table_text)
        {:ok, metadata}

      _ ->
        {:error, :no_table_found}
    end
  end

  @doc """
  Extracts a generic markdown table into a list of row maps.

  Each row is returned as a list of cell values with leading/trailing
  whitespace trimmed.

  ## Parameters

  - `text` - Text block containing the table

  ## Returns

  - `{:ok, %{headers: [String.t()], rows: [[String.t()]]}}` - Parsed table
  - `{:error, :no_table_found}` - No valid table found

  ## Examples

      iex> text = "| A | B |\\n|--|--|\\n| 1 | 2 |\\n| 3 | 4 |"
      iex> {:ok, table} = MarkdownExtractor.extract_table(text)
      iex> table.headers
      ["A", "B"]
      iex> table.rows
      [["1", "2"], ["3", "4"]]

  """
  @spec extract_table(String.t()) :: {:ok, map()} | {:error, :no_table_found}
  def extract_table(text) when is_binary(text) do
    lines =
      text
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, "|"))
      |> Enum.reject(&String.match?(&1, ~r/^\s*\|[\s\-:|]+\s*$/))

    case lines do
      [] ->
        {:error, :no_table_found}

      [header_line | data_lines] ->
        headers = parse_table_cells(header_line)

        rows =
          data_lines
          |> Enum.map(&parse_table_cells/1)
          |> Enum.reject(&Enum.empty?/1)

        {:ok, %{headers: headers, rows: rows}}
    end
  end

  # ============================================================================
  # Public API: Description Extraction
  # ============================================================================

  @doc """
  Extracts the definition/description paragraph from an entry.

  The description is the text block after the metadata table and before
  any sub-sections (`####`), cross-references (`**Viz take:**`), or
  the next entry (`###`).

  ## Parameters

  - `entry_text` - Full text of a single entry

  ## Returns

  - `{:ok, String.t()}` - Extracted description text
  - `{:ok, ""}` - No description found

  ## Examples

      iex> entry = "### Term\\n| Aspekt |...\\n\\nDescription paragraph.\\n\\n#### Priklad"
      iex> {:ok, desc} = MarkdownExtractor.extract_description(entry)
      iex> desc
      "Description paragraph."

  """
  @spec extract_description(String.t()) :: {:ok, String.t()}
  def extract_description(entry_text) when is_binary(entry_text) do
    description =
      entry_text
      |> String.split("\n")
      |> skip_to_after_table()
      |> take_until_section_boundary()
      |> Enum.reject(&(String.trim(&1) == ""))
      |> Enum.join("\n")
      |> String.trim()

    if description == "" do
      {:ok, extract_description_before_table(entry_text)}
    else
      {:ok, description}
    end
  end

  # ============================================================================
  # Public API: Example Extraction
  # ============================================================================

  @doc """
  Extracts the example section from an entry.

  Examples are in `#### Priklad` sub-sections and typically wrapped in
  italic markers (`*...*`).

  ## Parameters

  - `entry_text` - Full text of a single entry

  ## Returns

  - `{:ok, String.t()}` - Extracted example text (italic markers stripped)
  - `{:ok, nil}` - No example section found

  ## Examples

      iex> entry = "### Term\\n...\\n#### Priklad\\n\\n*An example case.*"
      iex> {:ok, example} = MarkdownExtractor.extract_example(entry)
      iex> example
      "An example case."

  """
  @spec extract_example(String.t()) :: {:ok, String.t() | nil}
  def extract_example(entry_text) when is_binary(entry_text) do
    case Regex.run(~r/####\s*P[rř][ií]klad\s*\n+([\s\S]*?)(?=\n\*\*Viz|\n###|\z)/i, entry_text) do
      [_, example_text] ->
        example =
          example_text
          |> String.trim()
          |> strip_italic_markers()
          |> String.trim()

        if example == "" do
          {:ok, nil}
        else
          {:ok, example}
        end

      _ ->
        {:ok, nil}
    end
  end

  # ============================================================================
  # Public API: Cross-Reference Extraction
  # ============================================================================

  @doc """
  Extracts cross-references from the "Viz take:" section.

  Parses markdown links in the format `[Display Name](#anchor-id)`.

  ## Parameters

  - `entry_text` - Full text of a single entry

  ## Returns

  - `{:ok, [cross_reference()]}` - List of extracted references
  - `{:ok, []}` - No cross-references found

  ## Examples

      iex> entry = "**Viz take:**\\n* [Term A](#term-a)\\n* [Term B](#term-b)"
      iex> {:ok, refs} = MarkdownExtractor.extract_cross_references(entry)
      iex> length(refs)
      2

  """
  @spec extract_cross_references(String.t()) :: {:ok, [cross_reference()]}
  def extract_cross_references(entry_text) when is_binary(entry_text) do
    case Regex.run(~r/\*\*Viz tak[ée]?:\*\*\s*([\s\S]*?)(?=\n###|\z)/i, entry_text) do
      [_, see_also_text] ->
        references =
          see_also_text
          |> String.split("\n")
          |> Enum.filter(&String.contains?(&1, "["))
          |> Enum.map(&extract_link/1)
          |> Enum.reject(&is_nil/1)

        {:ok, references}

      _ ->
        {:ok, []}
    end
  end

  @doc """
  Extracts anchor IDs only from cross-references (for backward compatibility).

  Returns just the anchor strings rather than full cross_reference maps.

  ## Parameters

  - `entry_text` - Full text of a single entry

  ## Returns

  - `{:ok, [String.t()]}` - List of anchor IDs

  ## Examples

      iex> entry = "**Viz take:**\\n* [Term A](#term-a)\\n* [Term B](#term-b)"
      iex> {:ok, anchors} = MarkdownExtractor.extract_cross_reference_anchors(entry)
      iex> anchors
      ["term-a", "term-b"]

  """
  @spec extract_cross_reference_anchors(String.t()) :: {:ok, [String.t()]}
  def extract_cross_reference_anchors(entry_text) when is_binary(entry_text) do
    {:ok, references} = extract_cross_references(entry_text)
    anchors = Enum.map(references, & &1.anchor)
    {:ok, anchors}
  end

  # ============================================================================
  # Public API: Complete Entry Extraction
  # ============================================================================

  @doc """
  Extracts all structured data from a single entry text block.

  Combines header, metadata table, description, example, and cross-reference
  extraction into a single entry_data result.

  ## Parameters

  - `entry_text` - Full text of a single entry (starting with `### `)

  ## Returns

  - `{:ok, entry_data()}` - Complete extracted data
  - `{:error, :invalid_entry}` - Entry lacks required header

  ## Examples

      iex> entry = "### Term {#anchor}\\n| Aspekt |...\\nDescription.\\n**Viz take:**\\n* [Ref](#ref)"
      iex> {:ok, data} = MarkdownExtractor.extract_entry_data(entry)
      iex> data.name
      "Term"

  """
  @spec extract_entry_data(String.t()) :: {:ok, entry_data()} | {:error, :invalid_entry}
  def extract_entry_data(entry_text) when is_binary(entry_text) do
    first_line = entry_text |> String.split("\n") |> List.first() || ""

    case extract_header(first_line) do
      {:ok, header} ->
        metadata =
          case extract_metadata_table(entry_text) do
            {:ok, m} -> m
            {:error, _} -> %{}
          end

        {:ok, description} = extract_description(entry_text)
        {:ok, example} = extract_example(entry_text)
        {:ok, see_also} = extract_cross_references(entry_text)

        {:ok,
         %{
           name: header.name,
           anchor: header.anchor,
           metadata: metadata,
           description: description,
           example: example,
           see_also: see_also
         }}

      {:error, _} ->
        {:error, :invalid_entry}
    end
  end

  # ============================================================================
  # Public API: Content Splitting
  # ============================================================================

  @doc """
  Splits markdown content into individual entry blocks at H3 headers.

  Each entry starts with `### ` and continues until the next `### ` or end of content.

  ## Parameters

  - `content` - Full markdown content with multiple entries

  ## Returns

  - `{:ok, [String.t()]}` - List of entry text blocks

  ## Examples

      iex> {:ok, entries} = MarkdownExtractor.split_into_entries("### A\\nText\\n### B\\nMore")
      iex> length(entries)
      2

  """
  @spec split_into_entries(String.t()) :: {:ok, [String.t()]}
  def split_into_entries(content) when is_binary(content) do
    entries =
      content
      |> String.split(~r/(?=^### )/m)
      |> Enum.filter(&String.starts_with?(String.trim(&1), "### "))
      |> Enum.filter(&(String.trim(&1) != ""))

    {:ok, entries}
  end

  @doc """
  Splits markdown content into sections at H2 headers.

  Returns a map from section name to section content.

  ## Parameters

  - `content` - Full markdown content

  ## Returns

  - `{:ok, %{String.t() => String.t()}}` - Map of section name to content

  ## Examples

      iex> {:ok, sections} = MarkdownExtractor.split_into_sections("## A\\nText A\\n## B\\nText B")
      iex> Map.keys(sections)
      ["A", "B"]

  """
  @spec split_into_sections(String.t()) :: {:ok, %{String.t() => String.t()}}
  def split_into_sections(content) when is_binary(content) do
    sections =
      content
      |> String.split(~r/(?=^## )/m)
      |> Enum.filter(&String.starts_with?(String.trim(&1), "## "))
      |> Enum.map(fn section ->
        [header_line | rest] = String.split(section, "\n", parts: 2)

        name =
          header_line
          |> String.replace(~r/^##\s+/, "")
          |> String.trim()

        body = List.first(rest) || ""
        {name, String.trim(body)}
      end)
      |> Map.new()

    {:ok, sections}
  end

  # ============================================================================
  # Public API: UTF-8 Utilities
  # ============================================================================

  @doc """
  Ensures content is valid UTF-8, falling back to latin1 conversion.

  Handles legacy files that may not be properly encoded as UTF-8.

  ## Parameters

  - `content` - Binary content to validate/convert

  ## Returns

  - UTF-8 encoded binary string

  ## Examples

      iex> MarkdownExtractor.ensure_utf8("Prilis zlutoucky")
      "Prilis zlutoucky"

  """
  @spec ensure_utf8(binary()) :: String.t()
  def ensure_utf8(content) when is_binary(content) do
    case :unicode.characters_to_binary(content, :utf8) do
      {:error, _, _} ->
        case :unicode.characters_to_binary(content, :latin1) do
          result when is_binary(result) -> result
          _ -> content
        end

      {:incomplete, partial, _} ->
        partial

      binary when is_binary(binary) ->
        binary
    end
  end

  @doc """
  Transliterates Czech diacritics to ASCII equivalents.

  Converts characters like a, c, d, e, e, i, n, o, r, s, t, u, u, y, z
  to their base ASCII forms for use in ID generation and pattern matching.

  ## Parameters

  - `text` - Text containing Czech diacritics

  ## Returns

  - ASCII-transliterated string

  ## Examples

      iex> MarkdownExtractor.transliterate_czech("Prilis zlutoucky kun upel dabelske ody")
      "Prilis zlutoucky kun upel dabelske ody"

      iex> MarkdownExtractor.transliterate_czech("Epistemicka imploze")
      "Epistemicka imploze"

  """
  @spec transliterate_czech(String.t()) :: String.t()
  def transliterate_czech(text) when is_binary(text) do
    text
    |> String.graphemes()
    |> Enum.map(&transliterate_grapheme/1)
    |> Enum.join()
  end

  # ============================================================================
  # Public API: Index Extraction
  # ============================================================================

  @doc """
  Extracts index entries from thematic/alphabetical index content.

  Parses lines in the format `- Technique Name (page_number)`.

  ## Parameters

  - `content` - Index markdown content

  ## Returns

  - `{:ok, [%{name: String.t(), page_number: integer() | nil, category: String.t() | nil}]}`

  ## Examples

      iex> {:ok, entries} = MarkdownExtractor.extract_index_entries("- Imploze (14)\\n- Anihilace (8)")
      iex> length(entries)
      2

  """
  @spec extract_index_entries(String.t()) :: {:ok, [map()]}
  def extract_index_entries(content) when is_binary(content) do
    lines = String.split(content, "\n")
    {_categories, entries} = parse_index_lines(lines, nil, [])
    {:ok, Enum.reverse(entries)}
  end

  @doc """
  Extracts categorized index entries with category assignments.

  Returns both the category structure and individual entries with their
  assigned category names.

  ## Parameters

  - `content` - Index markdown content with category headers

  ## Returns

  - `{:ok, %{categories: %{String.t() => [map()]}, entries: [map()]}}`

  ## Examples

      iex> content = "## Category A\\n- Entry 1 (10)\\n## Category B\\n- Entry 2 (20)"
      iex> {:ok, result} = MarkdownExtractor.extract_categorized_index(content)
      iex> Map.keys(result.categories)
      ["Category A", "Category B"]

  """
  @spec extract_categorized_index(String.t()) :: {:ok, map()}
  def extract_categorized_index(content) when is_binary(content) do
    lines = String.split(content, "\n")
    {category_map, entries} = parse_categorized_index_lines(lines, nil, %{}, [])

    {:ok,
     %{
       categories: category_map,
       entries: Enum.reverse(entries)
     }}
  end

  # ============================================================================
  # Public API: Chapter Extraction
  # ============================================================================

  @doc """
  Extracts chapter information from table of contents content.

  Parses lines containing "KAPITOLA" with optional technique ranges.

  ## Parameters

  - `content` - Table of contents markdown content

  ## Returns

  - `{:ok, [%{number: integer(), title: String.t(), technique_range: tuple() | nil}]}`

  ## Examples

      iex> content = "### KAPITOLA 6: EPISTEMICKA SINGULARITA (Techniky 1-30)"
      iex> {:ok, [chapter]} = MarkdownExtractor.extract_chapters(content)
      iex> chapter.number
      6

  """
  @spec extract_chapters(String.t()) :: {:ok, [map()]}
  def extract_chapters(content) when is_binary(content) do
    chapters =
      content
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, "KAPITOLA"))
      |> Enum.map(&parse_chapter_line/1)
      |> Enum.reject(&is_nil/1)

    {:ok, chapters}
  end

  @doc """
  Extracts part (CAST) information from table of contents content.

  Parses Roman numeral part designations.

  ## Parameters

  - `content` - Table of contents markdown content

  ## Returns

  - `{:ok, %{integer() => %{number: integer(), roman: String.t(), title: String.t()}}}`

  ## Examples

      iex> content = "## CAST I: ZAKLADNI KATEGORIE"
      iex> {:ok, parts} = MarkdownExtractor.extract_parts(content)
      iex> parts[1].title
      "ZAKLADNI KATEGORIE"

  """
  @spec extract_parts(String.t()) :: {:ok, map()}
  def extract_parts(content) when is_binary(content) do
    parts =
      content
      |> String.split("\n")
      |> Enum.filter(fn line ->
        String.contains?(line, "ČÁST") or String.contains?(line, "CAST")
      end)
      |> Enum.map(&parse_part_line/1)
      |> Enum.reject(&is_nil/1)
      |> Map.new(fn p -> {p.number, p} end)

    {:ok, parts}
  end

  # ============================================================================
  # Private: Table Parsing
  # ============================================================================

  defp parse_table_rows(table_text) do
    table_text
    |> String.split("\n")
    |> Enum.filter(&String.contains?(&1, "**"))
    |> Enum.reduce(%{}, fn line, acc ->
      case parse_metadata_row(line) do
        {key, value} -> Map.put(acc, key, value)
        nil -> acc
      end
    end)
  end

  defp parse_metadata_row(line) do
    case Regex.run(~r/\|\s*\*\*(.+?)\*\*\s*\|\s*(.+?)\s*\|/, line) do
      [_, key_cz, value] ->
        key = normalize_czech_key(key_cz)
        {key, String.trim(value)}

      _ ->
        nil
    end
  end

  defp normalize_czech_key(key_cz) do
    normalized =
      key_cz
      |> String.trim()
      |> String.downcase()

    case Map.get(@czech_field_mappings, normalized) do
      nil ->
        # ZERO:SAFE - fallback: convert to existing atom only
        normalized
        |> String.replace(" ", "_")
        |> String.to_existing_atom()

      mapped_key ->
        mapped_key
    end
  end

  defp parse_table_cells(line) do
    line
    |> String.split("|")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end

  # ============================================================================
  # Private: Description Extraction Helpers
  # ============================================================================

  defp skip_to_after_table(lines) do
    lines
    |> Enum.drop_while(&(not String.starts_with?(String.trim(&1), "|")))
    |> Enum.drop_while(&String.starts_with?(String.trim(&1), "|"))
  end

  defp take_until_section_boundary(lines) do
    Enum.take_while(lines, fn line ->
      trimmed = String.trim(line)

      not String.starts_with?(trimmed, "####") and
        not String.starts_with?(trimmed, "**Viz") and
        not String.starts_with?(trimmed, "### ")
    end)
  end

  defp extract_description_before_table(entry_text) do
    entry_text
    |> String.split("\n")
    |> Enum.drop(1)
    |> Enum.take_while(&(not String.starts_with?(String.trim(&1), "|")))
    |> Enum.reject(&(String.trim(&1) == ""))
    |> Enum.join("\n")
    |> String.trim()
  end

  # ============================================================================
  # Private: Example Extraction Helpers
  # ============================================================================

  defp strip_italic_markers(text) do
    text
    |> String.replace(~r/^\*/, "")
    |> String.replace(~r/\*$/, "")
  end

  # ============================================================================
  # Private: Link Extraction
  # ============================================================================

  defp extract_link(line) do
    case Regex.run(~r/\[(.+?)\]\(#(.+?)\)/, line) do
      [_, name, anchor] ->
        %{name: String.trim(name), anchor: String.trim(anchor)}

      _ ->
        nil
    end
  end

  # ============================================================================
  # Private: Czech Transliteration
  # ============================================================================

  # Mapping of Czech diacritical characters to ASCII equivalents.
  # Covers all characters with hacek, carky, and krouzek.
  @transliteration_map %{
    "á" => "a",
    "č" => "c",
    "ď" => "d",
    "é" => "e",
    "ě" => "e",
    "í" => "i",
    "ň" => "n",
    "ó" => "o",
    "ř" => "r",
    "š" => "s",
    "ť" => "t",
    "ú" => "u",
    "ů" => "u",
    "ý" => "y",
    "ž" => "z",
    "Á" => "A",
    "Č" => "C",
    "Ď" => "D",
    "É" => "E",
    "Ě" => "E",
    "Í" => "I",
    "Ň" => "N",
    "Ó" => "O",
    "Ř" => "R",
    "Š" => "S",
    "Ť" => "T",
    "Ú" => "U",
    "Ů" => "U",
    "Ý" => "Y",
    "Ž" => "Z"
  }

  defp transliterate_grapheme(grapheme) do
    Map.get(@transliteration_map, grapheme, grapheme)
  end

  # ============================================================================
  # Private: Index Parsing
  # ============================================================================

  defp parse_index_lines([], _current_category, entries) do
    {nil, entries}
  end

  defp parse_index_lines([line | rest], current_category, entries) do
    trimmed = String.trim(line)

    cond do
      String.match?(trimmed, ~r/^##[#]?\s+/) ->
        category_name =
          trimmed
          |> String.replace(~r/^##[#]?\s+/, "")
          |> String.trim()

        parse_index_lines(rest, category_name, entries)

      String.starts_with?(trimmed, "- ") ->
        case parse_index_line(trimmed) do
          {:ok, entry} ->
            entry_with_category = Map.put(entry, :category, current_category)
            parse_index_lines(rest, current_category, [entry_with_category | entries])

          {:error, _} ->
            parse_index_lines(rest, current_category, entries)
        end

      true ->
        parse_index_lines(rest, current_category, entries)
    end
  end

  defp parse_categorized_index_lines([], _current_category, categories, entries) do
    {categories, entries}
  end

  defp parse_categorized_index_lines([line | rest], current_category, categories, entries) do
    trimmed = String.trim(line)

    cond do
      String.match?(trimmed, ~r/^##[#]?\s+/) ->
        category_name =
          trimmed
          |> String.replace(~r/^##[#]?\s+/, "")
          |> String.trim()

        new_categories = Map.put(categories, category_name, [])
        parse_categorized_index_lines(rest, category_name, new_categories, entries)

      String.starts_with?(trimmed, "- ") ->
        case parse_index_line(trimmed) do
          {:ok, entry} ->
            entry_with_category = Map.put(entry, :category, current_category)

            updated_categories =
              if current_category do
                current = Map.get(categories, current_category, [])
                Map.put(categories, current_category, [entry | current])
              else
                categories
              end

            parse_categorized_index_lines(
              rest,
              current_category,
              updated_categories,
              [entry_with_category | entries]
            )

          {:error, _} ->
            parse_categorized_index_lines(rest, current_category, categories, entries)
        end

      true ->
        parse_categorized_index_lines(rest, current_category, categories, entries)
    end
  end

  defp parse_index_line(line) do
    case Regex.run(~r/-\s+(.+?)\s*\((\d+)\)/, line) do
      [_, name, page] ->
        {:ok, %{name: String.trim(name), page_number: String.to_integer(page)}}

      _ ->
        case Regex.run(~r/-\s+(.+)/, line) do
          [_, name] ->
            {:ok, %{name: String.trim(name), page_number: nil}}

          _ ->
            {:error, :invalid_entry}
        end
    end
  end

  # ============================================================================
  # Private: Chapter/Part Parsing
  # ============================================================================

  defp parse_chapter_line(line) do
    case Regex.run(
           ~r/KAPITOLA\s+(\d+):\s*(.+?)(?:\s*\((?:Techniky|Techniques)\s*(\d+)-(\d+)\))?$/i,
           line
         ) do
      [_, number, title, start_tech, end_tech] ->
        %{
          number: String.to_integer(number),
          title: String.trim(title),
          technique_range: {String.to_integer(start_tech), String.to_integer(end_tech)},
          part: nil
        }

      [_, number, title] ->
        %{
          number: String.to_integer(number),
          title: String.trim(title),
          technique_range: nil,
          part: nil
        }

      _ ->
        nil
    end
  end

  defp parse_part_line(line) do
    case Regex.run(~r/[ČC][ÁA]ST\s+([IVX]+):\s*(.+)/i, line) do
      [_, roman, title] ->
        %{
          number: roman_to_integer(roman),
          roman: roman,
          title: String.trim(title)
        }

      _ ->
        nil
    end
  end

  defp roman_to_integer(roman) do
    roman
    |> String.upcase()
    |> String.graphemes()
    |> Enum.reduce({0, 0}, fn char, {total, prev} ->
      value = roman_value(char)

      if value > prev do
        {total + value - 2 * prev, value}
      else
        {total + value, value}
      end
    end)
    |> elem(0)
  end

  defp roman_value("I"), do: 1
  defp roman_value("V"), do: 5
  defp roman_value("X"), do: 10
  defp roman_value("L"), do: 50
  defp roman_value("C"), do: 100
  defp roman_value("D"), do: 500
  defp roman_value("M"), do: 1000
  defp roman_value(_), do: 0
end
