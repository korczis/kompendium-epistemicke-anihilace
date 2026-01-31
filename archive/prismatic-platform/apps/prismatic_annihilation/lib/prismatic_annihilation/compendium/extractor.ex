defmodule PrismaticAnnihilation.Compendium.Extractor do
  @moduledoc """
  Extracts all 150+ epistemic annihilation techniques from Garden sources.

  Parses Czech markdown sources from three Garden locations:
  - Primary compendium: detailed dictionary with full metadata tables
  - Thematic index: 150 technique names organized by category
  - Archive: 36 individual article files with extended descriptions

  ## Source Formats

  The primary source uses a consistent Czech markdown structure:
  - `### Term {#anchor}` headings
  - Metadata tables with Aspekt/Charakteristika columns
  - `#### Priklad` example sections
  - `**Viz take:**` cross-reference sections

  The thematic index uses:
  - `## CATEGORY` sections
  - `### SUBCATEGORY` subsections
  - `- Technique Name (page_number)` entries

  The archive uses Zola front matter (`+++`) with full article bodies.

  ## Pipeline Position

  Extractor -> Transformer -> Generator
  """

  require Logger

  @type raw_technique :: %{
          name_cs: String.t(),
          anchor: String.t() | nil,
          kategorie: String.t() | nil,
          uroven_zavaznosti: String.t() | nil,
          oblast_pusobeni: String.t() | nil,
          casovy_prubeh: String.t() | nil,
          reverzibilita: String.t() | nil,
          typicke_projevy: String.t() | nil,
          obranne_strategie: String.t() | nil,
          description: String.t() | nil,
          example: String.t() | nil,
          cross_references: [String.t()],
          source: :primary | :index | :archive,
          page_number: non_neg_integer() | nil,
          thematic_category: String.t() | nil,
          thematic_subcategory: String.t() | nil
        }

  @type extraction_result :: %{
          techniques: [raw_technique()],
          total_count: non_neg_integer(),
          sources_parsed: [String.t()],
          extraction_timestamp: DateTime.t(),
          warnings: [String.t()]
        }

  @garden_gist_path "garden/gists/918701a95ea28eb31f3f3b717ea56e9b"
  @garden_archive_path "garden/prismatic-legacy/sites/blog/.tmp/anihilace"

  @doc """
  Executes full extraction from all Garden sources.

  Returns a merged, deduplicated set of all techniques with
  maximum metadata from all available sources.

  ## Options
  - `:base_path` - Override base path for Garden sources (default: project root)
  - `:sources` - List of sources to parse: `:primary`, `:index`, `:archive` (default: all)
  """
  @spec extract_all(keyword()) :: {:ok, extraction_result()} | {:error, term()}
  def extract_all(opts \\ []) do
    base_path = Keyword.get(opts, :base_path, find_project_root())
    sources = Keyword.get(opts, :sources, [:primary, :index, :archive])

    Logger.info("[Compendium.Extractor] Starting extraction from #{length(sources)} sources")

    {techniques, warnings} =
      sources
      |> Enum.reduce({[], []}, fn source, {acc_techniques, acc_warnings} ->
        case extract_source(source, base_path) do
          {:ok, source_techniques, source_warnings} ->
            {acc_techniques ++ source_techniques, acc_warnings ++ source_warnings}

          {:error, reason} ->
            warning = "Failed to extract from #{source}: #{inspect(reason)}"
            Logger.warning("[Compendium.Extractor] #{warning}")
            {acc_techniques, [warning | acc_warnings]}
        end
      end)

    merged = merge_techniques(techniques)

    result = %{
      techniques: merged,
      total_count: length(merged),
      sources_parsed: Enum.map(sources, &Atom.to_string/1),
      extraction_timestamp: DateTime.utc_now(),
      warnings: Enum.reverse(warnings)
    }

    Logger.info(
      "[Compendium.Extractor] Extracted #{result.total_count} techniques with #{length(result.warnings)} warnings"
    )

    {:ok, result}
  end

  @doc """
  Extracts techniques from the primary detailed dictionary.

  Parses `vykladovy-slovnik-detailni.md` which contains full metadata tables,
  descriptions, examples, and cross-references for each term.
  """
  @spec extract_primary(String.t()) :: {:ok, [raw_technique()], [String.t()]} | {:error, term()}
  def extract_primary(base_path) do
    path = Path.join([base_path, @garden_gist_path, "vykladovy-slovnik-detailni.md"])
    extract_from_detailed_dictionary(path)
  end

  @doc """
  Extracts techniques from the thematic index.

  Parses `tematicky-rejstrik.md` which lists all 150 technique names
  organized by thematic category with page references.
  """
  @spec extract_index(String.t()) :: {:ok, [raw_technique()], [String.t()]} | {:error, term()}
  def extract_index(base_path) do
    path = Path.join([base_path, @garden_gist_path, "tematicky-rejstrik.md"])
    extract_from_thematic_index(path)
  end

  @doc """
  Extracts techniques from the archive of individual article files.

  Parses 36 individual Zola markdown files from the archive directory,
  each containing an extended description of one technique.
  """
  @spec extract_archive(String.t()) :: {:ok, [raw_technique()], [String.t()]} | {:error, term()}
  def extract_archive(base_path) do
    dir = Path.join([base_path, @garden_archive_path])
    extract_from_archive_directory(dir)
  end

  # --- Primary Dictionary Parser ---

  defp extract_from_detailed_dictionary(path) do
    case File.read(path) do
      {:ok, content} ->
        {techniques, warnings} = parse_detailed_entries(content)
        {:ok, techniques, warnings}

      {:error, reason} ->
        {:error, {:file_read_failed, path, reason}}
    end
  end

  defp parse_detailed_entries(content) do
    # Split on H3 headings that define technique entries
    sections =
      content
      |> String.split(~r/(?=^### )/m)
      |> Enum.reject(&(String.trim(&1) == ""))
      |> Enum.reject(&String.starts_with?(String.trim(&1), "# "))

    techniques_and_warnings =
      sections
      |> Enum.map(&parse_detailed_entry/1)
      |> Enum.reject(&is_nil/1)

    techniques = Enum.map(techniques_and_warnings, &elem(&1, 0))
    warnings = techniques_and_warnings |> Enum.flat_map(&elem(&1, 1))

    {techniques, warnings}
  end

  defp parse_detailed_entry(section) do
    case extract_heading_and_anchor(section) do
      {name, anchor} ->
        metadata = extract_metadata_table(section)
        description = extract_description(section)
        example = extract_example(section)
        cross_refs = extract_cross_references(section)

        technique = %{
          name_cs: name,
          anchor: anchor,
          kategorie: get_meta(metadata, "kategorie"),
          uroven_zavaznosti: get_meta(metadata, "uroven zavaznosti"),
          oblast_pusobeni: get_meta(metadata, "oblast pusobeni"),
          casovy_prubeh: get_meta(metadata, "casovy prubeh"),
          reverzibilita: get_meta(metadata, "reverzibilita"),
          typicke_projevy: get_meta(metadata, "typicke projevy"),
          obranne_strategie: get_meta(metadata, "obranne strategie"),
          description: description,
          example: example,
          cross_references: cross_refs,
          source: :primary,
          page_number: nil,
          thematic_category: nil,
          thematic_subcategory: nil
        }

        warnings =
          if is_nil(get_meta(metadata, "kategorie")) do
            ["Missing Kategorie for: #{name}"]
          else
            []
          end

        {technique, warnings}

      nil ->
        nil
    end
  end

  defp extract_heading_and_anchor(section) do
    case Regex.run(~r/^### (.+?)\s*\{#(.+?)\}\s*$/m, section) do
      [_, name, anchor] ->
        {String.trim(name), String.trim(anchor)}

      _ ->
        case Regex.run(~r/^### (.+?)$/m, section) do
          [_, name] -> {String.trim(name), slugify(String.trim(name))}
          _ -> nil
        end
    end
  end

  defp extract_metadata_table(section) do
    # Match table rows with | **Key** | Value | pattern
    Regex.scan(~r/\|\s*\*\*(.+?)\*\*\s*\|\s*(.+?)\s*\|/m, section)
    |> Enum.map(fn [_, key, value] ->
      normalized_key =
        key
        |> String.trim()
        |> normalize_czech_key()
        |> String.downcase()

      {normalized_key, String.trim(value)}
    end)
    |> Map.new()
  end

  defp get_meta(metadata, key) do
    Map.get(metadata, String.downcase(key))
  end

  defp extract_description(section) do
    # Get text between the metadata table and the example section
    parts = String.split(section, ~r/####\s*(?:Priklad|Příklad)/u, parts: 2)

    case parts do
      [before_example | _] ->
        # Remove the heading and metadata table
        before_example
        |> String.split(~r/\n\n/, parts: 3)
        |> case do
          [_, _, description_text] ->
            description_text
            |> String.split(~r/####/)
            |> List.first()
            |> clean_markdown_text()

          [_, description_text] ->
            description_text
            |> String.split(~r/####/)
            |> List.first()
            |> clean_markdown_text()

          _ ->
            nil
        end

      _ ->
        nil
    end
  end

  defp extract_example(section) do
    case Regex.run(~r/####\s*(?:Priklad|Příklad)\s*\n+([\s\S]+?)(?=\n\*\*(?:Viz|See)|$)/u, section) do
      [_, example_text] ->
        example_text
        |> String.trim()
        |> String.replace(~r/^\*|\*$/m, "")
        |> String.trim()

      _ ->
        nil
    end
  end

  defp extract_cross_references(section) do
    case Regex.run(~r/\*\*Viz tak[ée]:\*\*\s*\n([\s\S]+?)(?=\n###|\z)/u, section) do
      [_, refs_text] ->
        Regex.scan(~r/\[(.+?)\]/u, refs_text)
        |> Enum.map(fn [_, ref] -> String.trim(ref) end)

      _ ->
        []
    end
  end

  # --- Thematic Index Parser ---

  defp extract_from_thematic_index(path) do
    case File.read(path) do
      {:ok, content} ->
        {techniques, warnings} = parse_thematic_entries(content)
        {:ok, techniques, warnings}

      {:error, reason} ->
        {:error, {:file_read_failed, path, reason}}
    end
  end

  defp parse_thematic_entries(content) do
    lines = String.split(content, "\n")

    {techniques, _state, warnings} =
      Enum.reduce(lines, {[], %{category: nil, subcategory: nil}, []}, fn line,
                                                                          {acc, state, warns} ->
        cond do
          # Category header: ## CATEGORY
          String.match?(line, ~r/^##\s+[A-Z]/) ->
            category = line |> String.replace(~r/^##\s+/, "") |> String.trim()
            {acc, %{state | category: category, subcategory: nil}, warns}

          # Subcategory header: ### SUBCATEGORY
          String.match?(line, ~r/^###\s+/) ->
            subcategory = line |> String.replace(~r/^###\s+/, "") |> String.trim()
            {acc, %{state | subcategory: subcategory}, warns}

          # Technique entry: - Name (page_number)
          String.match?(line, ~r/^-\s+.+\(\d+\)/) ->
            case parse_index_entry(line, state) do
              {:ok, technique} ->
                {[technique | acc], state, warns}

              {:error, reason} ->
                {acc, state, [reason | warns]}
            end

          # Scenario entries: - Name (Scenar X)
          String.match?(line, ~r/^-\s+.+\(Scen/) ->
            case parse_scenario_entry(line, state) do
              {:ok, technique} ->
                {[technique | acc], state, warns}

              {:error, reason} ->
                {acc, state, [reason | warns]}
            end

          true ->
            {acc, state, warns}
        end
      end)

    {Enum.reverse(techniques), Enum.reverse(warnings)}
  end

  defp parse_index_entry(line, state) do
    case Regex.run(~r/^-\s+(.+?)\s*\((\d+)\)\s*$/, line) do
      [_, name, page] ->
        technique = %{
          name_cs: String.trim(name),
          anchor: slugify(String.trim(name)),
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
          page_number: String.to_integer(page),
          thematic_category: state.category,
          thematic_subcategory: state.subcategory
        }

        {:ok, technique}

      _ ->
        {:error, "Failed to parse index entry: #{line}"}
    end
  end

  defp parse_scenario_entry(line, state) do
    case Regex.run(~r/^-\s+(.+?)\s*\((Scen[^)]+)\)\s*$/, line) do
      [_, name, scenario_ref] ->
        technique = %{
          name_cs: String.trim(name),
          anchor: slugify(String.trim(name)),
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
          thematic_category: state.category,
          thematic_subcategory: state.subcategory
        }

        _ = scenario_ref
        {:ok, technique}

      _ ->
        {:error, "Failed to parse scenario entry: #{line}"}
    end
  end

  # --- Archive Parser ---

  defp extract_from_archive_directory(dir) do
    case File.ls(dir) do
      {:ok, files} ->
        md_files =
          files
          |> Enum.filter(&String.ends_with?(&1, ".md"))
          |> Enum.reject(&(&1 == "_index.md"))
          |> Enum.reject(&(&1 == ".prompt.md"))

        results =
          md_files
          |> Enum.map(fn file ->
            path = Path.join(dir, file)

            case parse_archive_file(path) do
              {:ok, technique} -> {:ok, technique}
              {:error, reason} -> {:error, "#{file}: #{inspect(reason)}"}
            end
          end)

        techniques =
          results
          |> Enum.filter(&match?({:ok, _}, &1))
          |> Enum.map(&elem(&1, 1))

        warnings =
          results
          |> Enum.filter(&match?({:error, _}, &1))
          |> Enum.map(&elem(&1, 1))

        {:ok, techniques, warnings}

      {:error, reason} ->
        {:error, {:directory_read_failed, dir, reason}}
    end
  end

  defp parse_archive_file(path) do
    case File.read(path) do
      {:ok, content} ->
        {front_matter, body} = split_zola_front_matter(content)
        metadata = extract_metadata_table(body)

        name =
          case Map.get(front_matter, "title") do
            nil -> extract_archive_heading(body)
            title -> title
          end

        description_text =
          case Regex.run(~r/####\s*(?:Popis|Detailní princip)\s*\n+([\s\S]+?)(?=\n####|\z)/u, body) do
            [_, desc] -> clean_markdown_text(desc)
            _ -> extract_description(body)
          end

        example = extract_example(body)
        cross_refs = extract_cross_references(body)

        technique = %{
          name_cs: name || Path.basename(path, ".md"),
          anchor: slugify(name || Path.basename(path, ".md")),
          kategorie: get_meta(metadata, "kategorie"),
          uroven_zavaznosti: get_meta(metadata, "uroven zavaznosti"),
          oblast_pusobeni: get_meta(metadata, "oblast pusobeni"),
          casovy_prubeh: get_meta(metadata, "casovy prubeh"),
          reverzibilita: get_meta(metadata, "reverzibilita"),
          typicke_projevy: get_meta(metadata, "typicke projevy"),
          obranne_strategie: get_meta(metadata, "obranne strategie"),
          description: description_text,
          example: example,
          cross_references: cross_refs,
          source: :archive,
          page_number: nil,
          thematic_category: nil,
          thematic_subcategory: nil
        }

        {:ok, technique}

      {:error, reason} ->
        {:error, {:file_read_failed, path, reason}}
    end
  end

  defp split_zola_front_matter(content) do
    case Regex.run(~r/\A\+\+\+\n([\s\S]+?)\n\+\+\+\n([\s\S]*)\z/u, content) do
      [_, fm_text, body] ->
        front_matter =
          fm_text
          |> String.split("\n")
          |> Enum.map(fn line ->
            case String.split(line, "=", parts: 2) do
              [key, value] ->
                {String.trim(key), value |> String.trim() |> String.trim("\"")}

              _ ->
                nil
            end
          end)
          |> Enum.reject(&is_nil/1)
          |> Map.new()

        {front_matter, body}

      _ ->
        {%{}, content}
    end
  end

  defp extract_archive_heading(body) do
    case Regex.run(~r/^###\s+(.+?)(?:\s*\{#.+?\})?\s*$/m, body) do
      [_, name] -> String.trim(name)
      _ -> nil
    end
  end

  # --- Merging Logic ---

  defp merge_techniques(all_techniques) do
    all_techniques
    |> Enum.group_by(&normalize_technique_key/1)
    |> Enum.map(fn {_key, group} ->
      merge_technique_group(group)
    end)
    |> Enum.sort_by(& &1.name_cs)
  end

  defp normalize_technique_key(technique) do
    technique.name_cs
    |> String.downcase()
    |> String.replace(~r/[^\p{L}\p{N}]+/u, "_")
    |> String.trim("_")
  end

  defp merge_technique_group([single]), do: single

  defp merge_technique_group(group) do
    # Prefer primary source, then archive, then index
    sorted =
      Enum.sort_by(group, fn t ->
        case t.source do
          :primary -> 0
          :archive -> 1
          :index -> 2
        end
      end)

    base = List.first(sorted)

    Enum.reduce(tl(sorted), base, fn override, acc ->
      %{
        acc
        | kategorie: acc.kategorie || override.kategorie,
          uroven_zavaznosti: acc.uroven_zavaznosti || override.uroven_zavaznosti,
          oblast_pusobeni: acc.oblast_pusobeni || override.oblast_pusobeni,
          casovy_prubeh: acc.casovy_prubeh || override.casovy_prubeh,
          reverzibilita: acc.reverzibilita || override.reverzibilita,
          typicke_projevy: acc.typicke_projevy || override.typicke_projevy,
          obranne_strategie: acc.obranne_strategie || override.obranne_strategie,
          description: acc.description || override.description,
          example: acc.example || override.example,
          cross_references: merge_lists(acc.cross_references, override.cross_references),
          page_number: acc.page_number || override.page_number,
          thematic_category: acc.thematic_category || override.thematic_category,
          thematic_subcategory: acc.thematic_subcategory || override.thematic_subcategory
      }
    end)
  end

  defp merge_lists(list_a, list_b) do
    (list_a ++ list_b) |> Enum.uniq()
  end

  # --- Source Resolution ---

  defp extract_source(:primary, base_path), do: extract_primary(base_path)
  defp extract_source(:index, base_path), do: extract_index(base_path)
  defp extract_source(:archive, base_path), do: extract_archive(base_path)

  # --- Utility Functions ---

  defp normalize_czech_key(key) do
    key
    |> String.replace(~r/[áÁ]/u, "a")
    |> String.replace(~r/[čČ]/u, "c")
    |> String.replace(~r/[ďĎ]/u, "d")
    |> String.replace(~r/[éÉěĚ]/u, "e")
    |> String.replace(~r/[íÍ]/u, "i")
    |> String.replace(~r/[ňŇ]/u, "n")
    |> String.replace(~r/[óÓ]/u, "o")
    |> String.replace(~r/[řŘ]/u, "r")
    |> String.replace(~r/[šŠ]/u, "s")
    |> String.replace(~r/[ťŤ]/u, "t")
    |> String.replace(~r/[úÚůŮ]/u, "u")
    |> String.replace(~r/[ýÝ]/u, "y")
    |> String.replace(~r/[žŽ]/u, "z")
  end

  @doc """
  Converts a Czech technique name to a URL-safe slug.
  """
  @spec slugify(String.t()) :: String.t()
  def slugify(text) do
    text
    |> String.downcase()
    |> normalize_czech_key()
    |> String.replace(~r/[^\p{L}\p{N}\s-]/u, "")
    |> String.replace(~r/\s+/, "-")
    |> String.replace(~r/-+/, "-")
    |> String.trim("-")
  end

  defp clean_markdown_text(nil), do: nil

  defp clean_markdown_text(text) do
    text
    |> String.trim()
    |> String.replace(~r/\n{3,}/, "\n\n")
    |> String.replace(~r/^\|.+\|$/m, "")
    |> String.replace(~r/^\|-+\|$/m, "")
    |> String.trim()
  end

  defp find_project_root do
    case System.get_env("PRISMATIC_ROOT") do
      nil ->
        # Walk up from priv dir to find project root
        app_dir = Application.app_dir(:prismatic_annihilation, "priv")

        app_dir
        |> Path.join("../../..")
        |> Path.expand()

      root ->
        root
    end
  end
end
