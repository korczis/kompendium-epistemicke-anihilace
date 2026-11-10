defmodule PrismaticAnnihilation.Compendium.Taxonomy do
  @moduledoc """
  GenServer for loading and serving all 150 epistemic annihilation techniques.

  Loads technique data from generated JSON files in `priv/data/taxonomy/`
  and the master index at `priv/data/technique_index.json`.

  Provides runtime access to:
  - Individual technique lookup by ID
  - Category-based queries
  - Czech-to-English translation
  - Severity-based filtering
  - Cross-reference traversal
  - Full-text search across technique names and descriptions

  ## Supervision

  Started as part of the PrismaticAnnihilation supervision tree.
  Loads data on init and supports hot-reload via `reload/0`.

  ## Usage

      # Get a technique by ID
      {:ok, technique} = Taxonomy.get_technique("EA-001-absolutni-epistemicka-imploze")

      # List all techniques in a category
      techniques = Taxonomy.by_category("epistemic_destruction")

      # Find techniques by severity
      critical = Taxonomy.by_severity("critical")

      # Translate name
      {:ok, name_en} = Taxonomy.translate("Absolutni epistemicka imploze")

      # Search
      results = Taxonomy.search("paralysis")
  """

  use GenServer

  require Logger

  @type state :: %{
          techniques: %{String.t() => map()},
          by_category: %{String.t() => [String.t()]},
          by_severity: %{String.t() => [String.t()]},
          by_subcategory: %{String.t() => [String.t()]},
          translations: %{String.t() => %{cs: String.t(), en: String.t()}},
          index: map(),
          loaded_at: DateTime.t() | nil,
          technique_count: non_neg_integer()
        }

  @priv_dir :code.priv_dir(:prismatic_evil)

  # --- Client API ---

  @doc """
  Starts the Taxonomy GenServer.
  """
  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, opts, name: name)
  end

  @doc """
  Returns a technique by its ID.
  """
  @spec get_technique(String.t()) :: {:ok, map()} | {:error, :not_found}
  def get_technique(id) do
    GenServer.call(__MODULE__, {:get_technique, id})
  end

  @doc """
  Returns all techniques in a category.
  """
  @spec by_category(String.t()) :: [map()]
  def by_category(category) do
    GenServer.call(__MODULE__, {:by_category, category})
  end

  @doc """
  Returns all techniques with a given severity level.
  """
  @spec by_severity(String.t()) :: [map()]
  def by_severity(severity) do
    GenServer.call(__MODULE__, {:by_severity, severity})
  end

  @doc """
  Returns all techniques in a subcategory.
  """
  @spec by_subcategory(String.t()) :: [map()]
  def by_subcategory(subcategory) do
    GenServer.call(__MODULE__, {:by_subcategory, subcategory})
  end

  @doc """
  Translates a technique name from Czech to English.
  Accepts either a technique ID or a Czech name.
  """
  @spec translate(String.t()) :: {:ok, String.t()} | {:error, :not_found}
  def translate(id_or_name) do
    GenServer.call(__MODULE__, {:translate, id_or_name})
  end

  @doc """
  Searches techniques by name, description, or detection patterns.
  Returns matching techniques sorted by relevance.
  """
  @spec search(String.t(), keyword()) :: [map()]
  def search(query, opts \\ []) do
    GenServer.call(__MODULE__, {:search, query, opts})
  end

  @doc """
  Returns all available categories with technique counts.
  """
  @spec categories() :: %{String.t() => non_neg_integer()}
  def categories do
    GenServer.call(__MODULE__, :categories)
  end

  @doc """
  Returns techniques cross-referenced by the given technique.
  """
  @spec cross_references(String.t()) :: [map()]
  def cross_references(technique_id) do
    GenServer.call(__MODULE__, {:cross_references, technique_id})
  end

  @doc """
  Returns all techniques as a list.
  """
  @spec all() :: [map()]
  def all do
    GenServer.call(__MODULE__, :all)
  end

  @doc """
  Returns the total number of loaded techniques.
  """
  @spec count() :: non_neg_integer()
  def count do
    GenServer.call(__MODULE__, :count)
  end

  @doc """
  Returns statistics about the loaded taxonomy.
  """
  @spec statistics() :: map()
  def statistics do
    GenServer.call(__MODULE__, :statistics)
  end

  @doc """
  Reloads all technique data from disk.
  """
  @spec reload() :: :ok
  def reload do
    GenServer.call(__MODULE__, :reload)
  end

  # --- Server Callbacks ---

  @impl true
  def init(opts) do
    data_dir = Keyword.get(opts, :data_dir, Path.join(@priv_dir, "data"))

    state = load_state(data_dir)

    Logger.info("[Compendium.Taxonomy] Loaded #{state.technique_count} techniques from #{data_dir}")

    {:ok, Map.put(state, :data_dir, data_dir)}
  end

  @impl true
  def handle_call({:get_technique, id}, _from, state) do
    result =
      case Map.get(state.techniques, id) do
        nil -> {:error, :not_found}
        technique -> {:ok, technique}
      end

    {:reply, result, state}
  end

  @impl true
  def handle_call({:by_category, category}, _from, state) do
    ids = Map.get(state.by_category, category, [])
    techniques = resolve_ids(ids, state.techniques)
    {:reply, techniques, state}
  end

  @impl true
  def handle_call({:by_severity, severity}, _from, state) do
    ids = Map.get(state.by_severity, severity, [])
    techniques = resolve_ids(ids, state.techniques)
    {:reply, techniques, state}
  end

  @impl true
  def handle_call({:by_subcategory, subcategory}, _from, state) do
    ids = Map.get(state.by_subcategory, subcategory, [])
    techniques = resolve_ids(ids, state.techniques)
    {:reply, techniques, state}
  end

  @impl true
  def handle_call({:translate, id_or_name}, _from, state) do
    result =
      case Map.get(state.translations, id_or_name) do
        %{en: en} when is_binary(en) ->
          {:ok, en}

        _ ->
          # Try to find by Czech name
          found =
            Enum.find_value(state.translations, fn {_id, %{cs: cs, en: en}} ->
              if String.downcase(cs) == String.downcase(id_or_name), do: en
            end)

          case found do
            nil -> {:error, :not_found}
            en -> {:ok, en}
          end
      end

    {:reply, result, state}
  end

  @impl true
  def handle_call({:search, query, opts}, _from, state) do
    limit = Keyword.get(opts, :limit, 20)
    fields = Keyword.get(opts, :fields, [:name_cs, :name_en, :description_cs, :detection_patterns])

    query_lower = String.downcase(query)

    results =
      state.techniques
      |> Map.values()
      |> Enum.map(fn technique ->
        score = calculate_search_score(technique, query_lower, fields)
        {technique, score}
      end)
      |> Enum.filter(fn {_t, score} -> score > 0 end)
      |> Enum.sort_by(fn {_t, score} -> score end, :desc)
      |> Enum.take(limit)
      |> Enum.map(&elem(&1, 0))

    {:reply, results, state}
  end

  @impl true
  def handle_call(:categories, _from, state) do
    category_counts =
      state.by_category
      |> Enum.map(fn {cat, ids} -> {cat, length(ids)} end)
      |> Map.new()

    {:reply, category_counts, state}
  end

  @impl true
  def handle_call({:cross_references, technique_id}, _from, state) do
    case Map.get(state.techniques, technique_id) do
      nil ->
        {:reply, [], state}

      technique ->
        cross_ref_slugs = Map.get(technique, "cross_references", [])

        # Find techniques whose anchor matches cross references
        referenced =
          state.techniques
          |> Map.values()
          |> Enum.filter(fn t ->
            anchor = get_in(t, ["metadata", "anchor"])
            anchor in cross_ref_slugs
          end)

        {:reply, referenced, state}
    end
  end

  @impl true
  def handle_call(:all, _from, state) do
    {:reply, Map.values(state.techniques), state}
  end

  @impl true
  def handle_call(:count, _from, state) do
    {:reply, state.technique_count, state}
  end

  @impl true
  def handle_call(:statistics, _from, state) do
    stats = %{
      technique_count: state.technique_count,
      category_count: map_size(state.by_category),
      severity_distribution:
        Enum.map(state.by_severity, fn {s, ids} -> {s, length(ids)} end) |> Map.new(),
      loaded_at: state.loaded_at,
      categories: Enum.map(state.by_category, fn {c, ids} -> {c, length(ids)} end) |> Map.new()
    }

    {:reply, stats, state}
  end

  @impl true
  def handle_call(:reload, _from, state) do
    new_state = load_state(state.data_dir)

    Logger.info("[Compendium.Taxonomy] Reloaded #{new_state.technique_count} techniques")

    {:reply, :ok, Map.put(new_state, :data_dir, state.data_dir)}
  end

  # --- Private Functions ---

  defp load_state(data_dir) do
    techniques = load_techniques(data_dir)

    by_category =
      techniques
      |> Enum.group_by(fn {_id, t} -> Map.get(t, "category", "uncategorized") end)
      |> Enum.map(fn {cat, entries} -> {cat, Enum.map(entries, &elem(&1, 0))} end)
      |> Map.new()

    by_severity =
      techniques
      |> Enum.group_by(fn {_id, t} -> get_in(t, ["severity", "level"]) || "unknown" end)
      |> Enum.map(fn {sev, entries} -> {sev, Enum.map(entries, &elem(&1, 0))} end)
      |> Map.new()

    by_subcategory =
      techniques
      |> Enum.group_by(fn {_id, t} -> Map.get(t, "subcategory") || "uncategorized" end)
      |> Enum.map(fn {sub, entries} -> {sub, Enum.map(entries, &elem(&1, 0))} end)
      |> Map.new()

    translations = load_translations(data_dir)

    technique_map = Map.new(techniques)

    %{
      techniques: technique_map,
      by_category: by_category,
      by_severity: by_severity,
      by_subcategory: by_subcategory,
      translations: translations,
      index: load_index(data_dir),
      loaded_at: DateTime.utc_now(),
      technique_count: map_size(technique_map)
    }
  end

  defp load_techniques(data_dir) do
    taxonomy_dir = Path.join(data_dir, "taxonomy")

    case File.ls(taxonomy_dir) do
      {:ok, files} ->
        files
        |> Enum.filter(&String.ends_with?(&1, ".json"))
        |> Enum.flat_map(fn file ->
          path = Path.join(taxonomy_dir, file)

          case load_json(path) do
            {:ok, data} ->
              id = Map.get(data, "id", Path.basename(file, ".json"))
              [{id, data}]

            {:error, _} ->
              []
          end
        end)

      {:error, _} ->
        Logger.warning("[Compendium.Taxonomy] Taxonomy directory not found: #{taxonomy_dir}")
        []
    end
  end

  defp load_translations(data_dir) do
    path = Path.join(data_dir, "translations_cs_en.json")

    case load_json(path) do
      {:ok, %{"translations" => translations}} ->
        translations
        |> Enum.map(fn {id, %{"cs" => cs, "en" => en}} ->
          {id, %{cs: cs, en: en}}
        end)
        |> Map.new()

      _ ->
        %{}
    end
  end

  defp load_index(data_dir) do
    path = Path.join(data_dir, "technique_index.json")

    case load_json(path) do
      {:ok, index} -> index
      _ -> %{}
    end
  end

  defp load_json(path) do
    case File.read(path) do
      {:ok, content} ->
        case Jason.decode(content) do
          {:ok, data} -> {:ok, data}
          {:error, reason} -> {:error, {:decode_failed, path, reason}}
        end

      {:error, reason} ->
        {:error, {:read_failed, path, reason}}
    end
  end

  defp resolve_ids(ids, techniques) do
    Enum.flat_map(ids, fn id ->
      case Map.get(techniques, id) do
        nil -> []
        technique -> [technique]
      end
    end)
  end

  defp calculate_search_score(technique, query_lower, fields) do
    Enum.reduce(fields, 0, fn field, score ->
      field_value = get_searchable_value(technique, field)

      cond do
        is_nil(field_value) ->
          score

        String.contains?(String.downcase(field_value), query_lower) ->
          weight = field_weight(field)

          bonus =
            if String.downcase(field_value) == query_lower do
              weight * 2.0
            else
              0.0
            end

          score + weight + bonus

        true ->
          score
      end
    end)
  end

  defp get_searchable_value(technique, :name_cs) do
    get_in(technique, ["name", "cs"])
  end

  defp get_searchable_value(technique, :name_en) do
    get_in(technique, ["name", "en"])
  end

  defp get_searchable_value(technique, :description_cs) do
    get_in(technique, ["description", "cs"])
  end

  defp get_searchable_value(technique, :detection_patterns) do
    case Map.get(technique, "detection_patterns") do
      patterns when is_list(patterns) -> Enum.join(patterns, " ")
      _ -> nil
    end
  end

  defp get_searchable_value(_technique, _field), do: nil

  defp field_weight(:name_cs), do: 3.0
  defp field_weight(:name_en), do: 3.0
  defp field_weight(:description_cs), do: 1.0
  defp field_weight(:detection_patterns), do: 2.0
  defp field_weight(_), do: 1.0
end
