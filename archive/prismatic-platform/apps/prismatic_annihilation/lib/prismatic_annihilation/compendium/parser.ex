defmodule PrismaticAnnihilation.Compendium.Parser do
  @moduledoc """
  Parser for Epistemic Annihilation Compendium markdown sources.

  Extracts technique definitions from compendium files including:
  - `vykladovy-slovnik-detailni.md` - Detailed glossary (primary source)
  - `tematicky-rejstrik.md` - Thematic index
  - `obsah.md` - Table of contents

  ## Parsing Strategy

  The primary source `vykladovy-slovnik-detailni.md` follows this structure:

  ```markdown
  ### Term Name {#anchor-id}

  | Aspekt | Charakteristika |
  |--------|-----------------|
  | **Kategorie** | Category name |
  | **Úroveň závažnosti** | Severity level |
  | **Oblast působení** | Domain of effect |
  | **Časový průběh** | Temporal course |
  | **Reverzibilita** | Reversibility |
  | **Typické projevy** | Typical manifestations |
  | **Obranné strategie** | Defense strategies |

  Description paragraph...

  #### Příklad
  Example case...

  **Viz také:**
  * [Related term](#anchor)
  ```

  ## Usage

      # Parse detailed glossary file
      {:ok, techniques} = Parser.parse_detailed_glossary(content)

      # Parse all source files from paths
      {:ok, result} = Parser.parse_compendium_sources(base_path)

      # Parse single technique entry
      {:ok, technique} = Parser.parse_technique_entry(entry_text)

  """

  require Logger

  alias PrismaticAnnihilation.Compendium.MarkdownExtractor
  alias PrismaticAnnihilation.Compendium.TechniqueBuilder

  @typedoc """
  Raw parsed technique data before building into full Technique struct.
  """
  @type raw_technique :: %{
          name_cz: String.t(),
          anchor: String.t() | nil,
          category: String.t() | nil,
          severity: String.t() | nil,
          domain: String.t() | nil,
          temporal_course: String.t() | nil,
          reversibility: String.t() | nil,
          typical_manifestations: String.t() | nil,
          defense_strategies: String.t() | nil,
          description: String.t(),
          example: String.t() | nil,
          see_also: [String.t()]
        }

  @typedoc """
  Index entry from thematic or alphabetical indexes.
  """
  @type index_entry :: %{
          name: String.t(),
          description: String.t() | nil,
          page_number: non_neg_integer() | nil,
          category: String.t() | nil
        }

  @typedoc """
  Chapter information from table of contents.
  """
  @type chapter_info :: %{
          number: non_neg_integer(),
          title: String.t(),
          part: non_neg_integer() | nil,
          technique_range: {non_neg_integer(), non_neg_integer()} | nil
        }

  # ==========================================================================
  # Public API
  # ==========================================================================

  @doc """
  Parses the detailed glossary file (`vykladovy-slovnik-detailni.md`).

  Extracts all technique definitions with their full metadata including
  category, severity, reversibility, examples, and cross-references.

  ## Parameters

  - `content` - UTF-8 encoded markdown content

  ## Returns

  - `{:ok, [raw_technique()]}` - List of parsed technique data
  - `{:error, reason}` - Parsing failed

  ## Examples

      iex> {:ok, content} = File.read("vykladovy-slovnik-detailni.md")
      iex> {:ok, techniques} = Parser.parse_detailed_glossary(content)
      iex> length(techniques) > 100
      true
  """
  @spec parse_detailed_glossary(String.t()) :: {:ok, [raw_technique()]} | {:error, term()}
  def parse_detailed_glossary(content) when is_binary(content) do
    {:ok, entries} = MarkdownExtractor.split_into_entries(content)

    techniques =
      entries
      |> Enum.map(&parse_technique_entry/1)
      |> Enum.reject(&is_nil/1)

    {:ok, techniques}
  rescue
    e ->
      Logger.error("[Parser] Failed to parse detailed glossary: #{inspect(e)}")
      {:error, {:parse_error, e}}
  end

  @doc """
  Parses the thematic index file (`tematicky-rejstrik.md`).

  Extracts technique names organized by category/theme with page references.

  ## Parameters

  - `content` - UTF-8 encoded markdown content

  ## Returns

  - `{:ok, %{categories: map(), entries: [index_entry()]}}` - Categorized index
  - `{:error, reason}` - Parsing failed
  """
  @spec parse_thematic_index(String.t()) :: {:ok, map()} | {:error, term()}
  def parse_thematic_index(content) when is_binary(content) do
    lines = String.split(content, "\n")

    {categories, entries} = parse_index_lines(lines, nil, %{}, [])

    {:ok, %{categories: categories, entries: entries}}
  rescue
    e ->
      Logger.error("[Parser] Failed to parse thematic index: #{inspect(e)}")
      {:error, {:parse_error, e}}
  end

  @doc """
  Parses the table of contents file (`obsah.md`).

  Extracts chapter structure including part organization and technique ranges.

  ## Parameters

  - `content` - UTF-8 encoded markdown content

  ## Returns

  - `{:ok, %{chapters: [chapter_info()], parts: map()}}` - TOC structure
  - `{:error, reason}` - Parsing failed
  """
  @spec parse_table_of_contents(String.t()) :: {:ok, map()} | {:error, term()}
  def parse_table_of_contents(content) when is_binary(content) do
    lines = String.split(content, "\n")

    chapters = extract_chapters(lines)
    parts = extract_parts(lines)

    {:ok, %{chapters: chapters, parts: parts}}
  rescue
    e ->
      Logger.error("[Parser] Failed to parse table of contents: #{inspect(e)}")
      {:error, {:parse_error, e}}
  end

  @doc """
  Parses all compendium source files from a base directory path.

  Loads and parses:
  - vykladovy-slovnik-detailni.md (detailed glossary)
  - tematicky-rejstrik.md (thematic index)
  - obsah.md (table of contents)

  ## Parameters

  - `base_path` - Path to the gist directory containing source files

  ## Returns

  - `{:ok, %{glossary: [...], index: map(), toc: map()}}` - All parsed data
  - `{:error, reason}` - Loading or parsing failed
  """
  @spec parse_compendium_sources(String.t()) :: {:ok, map()} | {:error, term()}
  def parse_compendium_sources(base_path) when is_binary(base_path) do
    glossary_path = Path.join(base_path, "vykladovy-slovnik-detailni.md")
    index_path = Path.join(base_path, "tematicky-rejstrik.md")
    toc_path = Path.join(base_path, "obsah.md")

    with {:ok, glossary_content} <- read_file_utf8(glossary_path),
         {:ok, index_content} <- read_file_utf8(index_path),
         {:ok, toc_content} <- read_file_utf8(toc_path),
         {:ok, glossary_data} <- parse_detailed_glossary(glossary_content),
         {:ok, index_data} <- parse_thematic_index(index_content),
         {:ok, toc_data} <- parse_table_of_contents(toc_content) do
      {:ok,
       %{
         glossary: glossary_data,
         index: index_data,
         toc: toc_data,
         source_path: base_path,
         parsed_at: DateTime.utc_now()
       }}
    end
  end

  @doc """
  Parses a single technique entry from the detailed glossary.

  Entry starts with `### Term Name {#anchor}` and continues until the next `### `.

  ## Parameters

  - `entry_text` - Single entry text block

  ## Returns

  - `raw_technique()` map or nil if parsing fails
  """
  @spec parse_technique_entry(String.t()) :: raw_technique() | nil
  def parse_technique_entry(entry_text) when is_binary(entry_text) do
    first_line = entry_text |> String.split("\n") |> List.first() || ""

    with {:ok, header} <- MarkdownExtractor.extract_header(first_line),
         metadata <- extract_metadata_via_extractor(entry_text),
         {:ok, description} <- MarkdownExtractor.extract_description(entry_text),
         {:ok, example} <- MarkdownExtractor.extract_example(entry_text),
         {:ok, see_also_anchors} <- MarkdownExtractor.extract_cross_reference_anchors(entry_text) do
      %{
        name_cz: header.name,
        anchor: header.anchor,
        category: metadata[:category],
        severity: metadata[:severity],
        domain: metadata[:domain],
        temporal_course: metadata[:temporal_course],
        reversibility: metadata[:reversibility],
        typical_manifestations: metadata[:typical_manifestations],
        defense_strategies: metadata[:defense_strategies],
        description: description,
        example: example,
        see_also: see_also_anchors
      }
    else
      _ -> nil
    end
  end

  @doc """
  Builds full Technique structs from parsed raw data.

  Combines raw parsed data with TechniqueBuilder to create complete
  technique definitions ready for use in the taxonomy.

  ## Parameters

  - `raw_techniques` - List of raw_technique() maps from parsing
  - `opts` - Build options:
    - `:base_chapter` - Starting chapter for technique numbering (default: 6)
    - `:validate` - Whether to validate built techniques (default: true)

  ## Returns

  - `{:ok, [Technique.t()]}` - List of complete technique structs
  - `{:error, reason}` - Building failed
  """
  @spec build_techniques([raw_technique()], keyword()) :: {:ok, [map()]} | {:error, term()}
  def build_techniques(raw_techniques, opts \\ []) do
    validate = Keyword.get(opts, :validate, true)

    techniques =
      raw_techniques
      |> Enum.with_index(1)
      |> Enum.map(fn {raw, index} ->
        TechniqueBuilder.build_from_raw(raw, index, opts)
      end)
      |> Enum.reject(&is_nil/1)

    if validate do
      valid_techniques =
        Enum.filter(techniques, fn t ->
          case PrismaticAnnihilation.Compendium.Validation.validate_technique(t) do
            {:ok, _} -> true
            {:error, _} -> false
          end
        end)

      {:ok, valid_techniques}
    else
      {:ok, techniques}
    end
  end

  # ==========================================================================
  # Private: Metadata Extraction via MarkdownExtractor
  # ==========================================================================

  # Bridge function: delegates metadata extraction to the MarkdownExtractor module
  # and normalizes the result into a keyword-accessible map.
  defp extract_metadata_via_extractor(entry_text) do
    case MarkdownExtractor.extract_metadata_table(entry_text) do
      {:ok, metadata} -> metadata
      {:error, _} -> %{}
    end
  end

  # ==========================================================================
  # Private: File Operations
  # ==========================================================================

  defp read_file_utf8(path) do
    case File.read(path) do
      {:ok, content} ->
        # Ensure proper UTF-8 encoding for Czech text
        {:ok, ensure_utf8(content)}

      {:error, reason} ->
        Logger.warning("[Parser] Failed to read file #{path}: #{inspect(reason)}")
        {:error, {:file_read_error, path, reason}}
    end
  end

  defp ensure_utf8(content) do
    case :unicode.characters_to_binary(content, :utf8) do
      {:error, _, _} ->
        # Try latin1 fallback for legacy files
        :unicode.characters_to_binary(content, :latin1)

      {:incomplete, partial, _} ->
        partial

      binary when is_binary(binary) ->
        binary
    end
  end

  # ==========================================================================
  # Private: Index Parsing
  # ==========================================================================

  defp parse_index_lines([], _current_category, categories, entries) do
    {categories, Enum.reverse(entries)}
  end

  defp parse_index_lines([line | rest], current_category, categories, entries) do
    cond do
      # Category header (## or ###)
      String.match?(line, ~r/^##[#]?\s+/) ->
        category_name = extract_category_name(line)
        new_categories = Map.put(categories, category_name, [])
        parse_index_lines(rest, category_name, new_categories, entries)

      # Index entry (- Name (page))
      String.starts_with?(String.trim(line), "- ") ->
        case parse_index_line(line) do
          {:ok, entry} ->
            entry_with_category = Map.put(entry, :category, current_category)
            updated_categories = update_category_entries(categories, current_category, entry)
            parse_index_lines(rest, current_category, updated_categories, [entry_with_category | entries])

          _ ->
            parse_index_lines(rest, current_category, categories, entries)
        end

      true ->
        parse_index_lines(rest, current_category, categories, entries)
    end
  end

  defp extract_category_name(line) do
    line
    |> String.replace(~r/^##[#]?\s+/, "")
    |> String.trim()
  end

  defp parse_index_line(line) do
    case Regex.run(~r/-\s+(.+?)\s*\((\d+)\)/, line) do
      [_, name, page] ->
        {:ok, %{name: String.trim(name), page_number: String.to_integer(page), description: nil}}

      _ ->
        # Try without page number
        case Regex.run(~r/-\s+(.+)/, line) do
          [_, name] ->
            {:ok, %{name: String.trim(name), page_number: nil, description: nil}}

          _ ->
            {:error, :invalid_entry}
        end
    end
  end

  defp update_category_entries(categories, nil, _entry), do: categories

  defp update_category_entries(categories, category, entry) do
    current = Map.get(categories, category, [])
    Map.put(categories, category, [entry | current])
  end

  # ==========================================================================
  # Private: TOC Parsing
  # ==========================================================================

  defp extract_chapters(lines) do
    lines
    |> Enum.filter(&String.contains?(&1, "KAPITOLA"))
    |> Enum.map(&parse_chapter_line/1)
    |> Enum.reject(&is_nil/1)
  end

  defp parse_chapter_line(line) do
    case Regex.run(~r/KAPITOLA\s+(\d+):\s*(.+?)(?:\s*\((?:Techniky|Techniques)\s*(\d+)-(\d+)\))?$/i, line) do
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

  defp extract_parts(lines) do
    lines
    |> Enum.filter(&String.contains?(&1, "ČÁST"))
    |> Enum.map(&parse_part_line/1)
    |> Enum.reject(&is_nil/1)
    |> Map.new(fn p -> {p.number, p} end)
  end

  defp parse_part_line(line) do
    case Regex.run(~r/ČÁST\s+([IVX]+):\s*(.+)/i, line) do
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
