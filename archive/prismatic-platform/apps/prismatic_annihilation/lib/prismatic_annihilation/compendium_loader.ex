defmodule PrismaticAnnihilation.CompendiumLoader do
  @moduledoc """
  Loads and parses source materials from the Epistemic Annihilation Compendium.

  Handles loading from:
  - Primary compendium (garden/gists/918701a95ea28eb31f3f3b717ea56e9b/)
  - Secondary archive (garden/prismatic-legacy/sites/blog/.tmp/anihilace/)
  - Compiled JSON data (priv/data/)

  ## Source Files

  ### Primary Compendium
  - obsah.md - Table of contents (15 chapters)
  - vykladovy-slovnik-detailni.md - Detailed glossary (73KB)
  - tematicky-rejstrik.md - Thematic index (150 techniques)
  - abecedni-rejstrik.md - Alphabetical index

  ### Secondary Archive (35+ files, 520KB+)
  - epistemicka-imploze.md - Epistemic implosion (52KB)
  - hypertranscendentalni-negace.md - Hypertranscendental negation (38KB)
  - kognitivni-pandemonium.md - Cognitive pandemonium (27KB)
  - ontologicka-nebytnost.md - Ontological non-being (25KB)
  - And 30+ more technique files

  """

  use GenServer

  require Logger

  @primary_compendium_path "garden/gists/918701a95ea28eb31f3f3b717ea56e9b"
  @secondary_archive_path "garden/prismatic-legacy/sites/blog/.tmp/anihilace"
  # @compiled_data_path "priv/data"  # Reserved for future compiled data loading

  # ===========================================================================
  # Client API
  # ===========================================================================

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Returns the loaded compendium data.
  """
  @spec get_compendium() :: {:ok, map()} | {:error, term()}
  def get_compendium do
    GenServer.call(__MODULE__, :get_compendium)
  end

  @doc """
  Returns a specific technique from the compendium by Czech name.
  """
  @spec get_technique_by_name_cz(String.t()) :: {:ok, map()} | {:error, :not_found}
  def get_technique_by_name_cz(name_cz) do
    GenServer.call(__MODULE__, {:get_by_name_cz, name_cz})
  end

  @doc """
  Reloads compendium data from sources.
  """
  @spec reload() :: :ok | {:error, term()}
  def reload do
    GenServer.call(__MODULE__, :reload)
  end

  @doc """
  Returns loading statistics.
  """
  @spec stats() :: map()
  def stats do
    GenServer.call(__MODULE__, :stats)
  end

  # ===========================================================================
  # GenServer Implementation
  # ===========================================================================

  @impl true
  def init(_opts) do
    state = %{
      compendium: %{},
      techniques_by_name: %{},
      loaded_at: nil,
      source_files: [],
      stats: %{}
    }

    # Schedule initial load
    send(self(), :load)

    {:ok, state}
  end

  @impl true
  def handle_call(:get_compendium, _from, state) do
    {:reply, {:ok, state.compendium}, state}
  end

  @impl true
  def handle_call({:get_by_name_cz, name_cz}, _from, state) do
    case Map.get(state.techniques_by_name, String.downcase(name_cz)) do
      nil -> {:reply, {:error, :not_found}, state}
      technique -> {:reply, {:ok, technique}, state}
    end
  end

  @impl true
  def handle_call(:reload, _from, state) do
    case load_compendium() do
      {:ok, new_state} ->
        {:reply, :ok, Map.merge(state, new_state)}

      {:error, reason} ->
        {:reply, {:error, reason}, state}
    end
  end

  @impl true
  def handle_call(:stats, _from, state) do
    {:reply, state.stats, state}
  end

  @impl true
  def handle_info(:load, state) do
    case load_compendium() do
      {:ok, new_state} ->
        {:noreply, Map.merge(state, new_state)}

      {:error, reason} ->
        Logger.warning("[CompendiumLoader] Failed to load compendium: #{inspect(reason)}")
        {:noreply, state}
    end
  end

  # ===========================================================================
  # Private: Loading Functions
  # ===========================================================================

  defp load_compendium do
    Logger.info("[CompendiumLoader] Loading epistemic annihilation compendium...")

    base_path = get_base_path()

    with {:ok, primary_data} <- load_primary_compendium(base_path),
         {:ok, secondary_data} <- load_secondary_archive(base_path),
         {:ok, compiled_data} <- load_compiled_data() do
      compendium = merge_sources(primary_data, secondary_data, compiled_data)
      techniques_by_name = build_name_index(compendium)

      stats = %{
        primary_files: length(primary_data.files),
        secondary_files: length(secondary_data.files),
        total_techniques: map_size(techniques_by_name),
        total_bytes: primary_data.bytes + secondary_data.bytes
      }

      Logger.info("[CompendiumLoader] Loaded #{stats.total_techniques} techniques from #{stats.primary_files + stats.secondary_files} files")

      {:ok,
       %{
         compendium: compendium,
         techniques_by_name: techniques_by_name,
         loaded_at: DateTime.utc_now(),
         source_files: primary_data.files ++ secondary_data.files,
         stats: stats
       }}
    end
  end

  defp get_base_path do
    # Try to find the platform root
    cond do
      File.exists?("garden") -> "."
      File.exists?("../../garden") -> "../.."
      File.exists?("../../../garden") -> "../../.."
      true -> "."
    end
  end

  defp load_primary_compendium(base_path) do
    path = Path.join(base_path, @primary_compendium_path)

    if File.dir?(path) do
      files =
        path
        |> File.ls!()
        |> Enum.filter(&String.ends_with?(&1, ".md"))
        |> Enum.map(fn file ->
          full_path = Path.join(path, file)
          content = File.read!(full_path)
          {file, content}
        end)

      bytes = files |> Enum.map(fn {_, content} -> byte_size(content) end) |> Enum.sum()

      {:ok, %{files: files, bytes: bytes, parsed: parse_primary_files(files)}}
    else
      Logger.debug("[CompendiumLoader] Primary compendium path not found: #{path}")
      {:ok, %{files: [], bytes: 0, parsed: %{}}}
    end
  end

  defp load_secondary_archive(base_path) do
    path = Path.join(base_path, @secondary_archive_path)

    if File.dir?(path) do
      files =
        path
        |> File.ls!()
        |> Enum.filter(&String.ends_with?(&1, ".md"))
        |> Enum.reject(&String.starts_with?(&1, "."))
        |> Enum.map(fn file ->
          full_path = Path.join(path, file)
          content = File.read!(full_path)
          {file, content}
        end)

      bytes = files |> Enum.map(fn {_, content} -> byte_size(content) end) |> Enum.sum()

      {:ok, %{files: files, bytes: bytes, parsed: parse_secondary_files(files)}}
    else
      Logger.debug("[CompendiumLoader] Secondary archive path not found: #{path}")
      {:ok, %{files: [], bytes: 0, parsed: %{}}}
    end
  end

  defp load_compiled_data do
    # Check for pre-compiled JSON data
    priv_path = :code.priv_dir(:prismatic_annihilation) |> to_string()
    data_path = Path.join(priv_path, "data")

    if File.dir?(data_path) do
      case File.ls(data_path) do
        {:ok, files} ->
          json_files = Enum.filter(files, &String.ends_with?(&1, ".json"))

          data =
            Enum.reduce(json_files, %{}, fn file, acc ->
              full_path = Path.join(data_path, file)

              case File.read(full_path) do
                {:ok, content} ->
                  case Jason.decode(content) do
                    {:ok, parsed} -> Map.put(acc, file, parsed)
                    _ -> acc
                  end

                _ ->
                  acc
              end
            end)

          {:ok, data}

        _ ->
          {:ok, %{}}
      end
    else
      {:ok, %{}}
    end
  rescue
    _ -> {:ok, %{}}
  end

  # ===========================================================================
  # Private: Parsing Functions
  # ===========================================================================

  defp parse_primary_files(files) do
    files
    |> Enum.map(fn {filename, content} ->
      parsed =
        case filename do
          "obsah.md" -> parse_table_of_contents(content)
          "tematicky-rejstrik.md" -> parse_thematic_index(content)
          "abecedni-rejstrik.md" -> parse_alphabetical_index(content)
          "vykladovy-slovnik-detailni.md" -> parse_detailed_glossary(content)
          _ -> %{raw: content}
        end

      {filename, parsed}
    end)
    |> Map.new()
  end

  defp parse_secondary_files(files) do
    files
    |> Enum.map(fn {filename, content} ->
      technique_id = filename |> String.replace(".md", "") |> String.replace("-", "_")
      parsed = parse_technique_file(content, technique_id)
      {filename, parsed}
    end)
    |> Map.new()
  end

  defp parse_table_of_contents(content) do
    chapters =
      content
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, "KAPITOLA"))
      |> Enum.map(&extract_chapter_info/1)

    %{type: :table_of_contents, chapters: chapters}
  end

  defp extract_chapter_info(line) do
    case Regex.run(~r/KAPITOLA\s+(\d+):\s*(.+)/, line) do
      [_, number, title] ->
        %{number: String.to_integer(number), title: String.trim(title)}

      _ ->
        %{raw: line}
    end
  end

  defp parse_thematic_index(content) do
    techniques =
      content
      |> String.split("\n")
      |> Enum.filter(&String.starts_with?(&1, "- "))
      |> Enum.map(&parse_index_entry/1)

    %{type: :thematic_index, techniques: techniques}
  end

  defp parse_alphabetical_index(content) do
    entries =
      content
      |> String.split("\n")
      |> Enum.filter(&String.starts_with?(&1, "- **"))
      |> Enum.map(&parse_alphabetical_entry/1)

    %{type: :alphabetical_index, entries: entries}
  end

  defp parse_alphabetical_entry(line) do
    case Regex.run(~r/- \*\*(.+?)\*\*\s*[–-]\s*(.+?)\s*\((\d+)\)/, line) do
      [_, name, description, number] ->
        %{
          name: String.trim(name),
          description: String.trim(description),
          technique_number: String.to_integer(number)
        }

      _ ->
        %{raw: line}
    end
  end

  defp parse_index_entry(line) do
    case Regex.run(~r/- (.+?)\s*\((\d+)\)/, line) do
      [_, name, number] ->
        %{name: String.trim(name), technique_number: String.to_integer(number)}

      _ ->
        %{raw: line}
    end
  end

  defp parse_detailed_glossary(content) do
    # Extract terms from the detailed glossary
    sections =
      content
      |> String.split(~r/^### /m)
      |> Enum.drop(1)
      |> Enum.map(&parse_glossary_section/1)

    %{type: :detailed_glossary, sections: sections}
  end

  defp parse_glossary_section(section) do
    lines = String.split(section, "\n", parts: 2)

    case lines do
      [title | rest] ->
        %{
          term: String.trim(title) |> String.replace(~r/\s*\{.*\}/, ""),
          content: List.first(rest) || ""
        }

      _ ->
        %{raw: section}
    end
  end

  defp parse_technique_file(content, technique_id) do
    %{
      technique_id: technique_id,
      title: extract_title(content),
      description: extract_description(content),
      severity: extract_severity(content),
      reversibility: extract_reversibility(content),
      defense_strategies: extract_defense_strategies(content),
      raw_content: content
    }
  end

  defp extract_title(content) do
    case Regex.run(~r/title\s*=\s*"(.+?)"/, content) do
      [_, title] -> title
      _ -> nil
    end
  end

  defp extract_description(content) do
    case Regex.run(~r/description\s*=\s*"(.+?)"/, content) do
      [_, desc] -> desc
      _ -> nil
    end
  end

  defp extract_severity(content) do
    case Regex.run(~r/\*\*Úroveň závažnosti\*\*\s*\|\s*(.+?)\s*\|/, content) do
      [_, severity] -> parse_severity(severity)
      _ -> :unknown
    end
  end

  defp parse_severity(text) do
    text_lower = String.downcase(text)

    cond do
      String.contains?(text_lower, "kritická") -> :critical
      String.contains?(text_lower, "extrémní") -> :terminal
      String.contains?(text_lower, "vysoká") -> :high
      String.contains?(text_lower, "střední") -> :medium
      String.contains?(text_lower, "nízká") -> :low
      true -> :unknown
    end
  end

  defp extract_reversibility(content) do
    case Regex.run(~r/\*\*Reverzibilita\*\*\s*\|\s*(.+?)\s*\|/, content) do
      [_, rev] -> parse_reversibility(rev)
      _ -> :unknown
    end
  end

  defp parse_reversibility(text) do
    text_lower = String.downcase(text)

    cond do
      String.contains?(text_lower, "prakticky nereverzibilní") -> :practically_irreversible
      String.contains?(text_lower, "velmi") and String.contains?(text_lower, "nízká") ->
        :very_difficult

      String.contains?(text_lower, "obtížně") -> :difficult
      String.contains?(text_lower, "částečně") -> :moderate
      true -> :unknown
    end
  end

  defp extract_defense_strategies(content) do
    case Regex.run(~r/\*\*Obranné strategie\*\*\s*\|\s*(.+?)\s*\|/, content) do
      [_, strategies] ->
        strategies
        |> String.split(",")
        |> Enum.map(&String.trim/1)

      _ ->
        []
    end
  end

  # ===========================================================================
  # Private: Merging and Indexing
  # ===========================================================================

  defp merge_sources(primary, secondary, compiled) do
    %{
      primary: primary.parsed,
      secondary: secondary.parsed,
      compiled: compiled
    }
  end

  defp build_name_index(compendium) do
    # Build index from secondary archive technique files
    secondary = Map.get(compendium, :secondary, %{})

    secondary
    |> Enum.filter(fn {_k, v} -> is_map(v) and Map.has_key?(v, :title) end)
    |> Enum.map(fn {_k, v} -> {String.downcase(v.title || ""), v} end)
    |> Enum.reject(fn {k, _v} -> k == "" end)
    |> Map.new()
  end
end
