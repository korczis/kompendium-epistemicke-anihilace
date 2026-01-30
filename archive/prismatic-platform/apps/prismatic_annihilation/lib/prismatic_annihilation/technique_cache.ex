defmodule PrismaticAnnihilation.TechniqueCache do
  @moduledoc """
  ETS-based Cache for Technique Patterns and Detection Data.

  Provides high-performance caching for:
  - Detection patterns per technique
  - Compiled regular expressions
  - Semantic signatures
  - Defense strategy mappings

  ## Performance

  - O(1) lookup time
  - Configurable TTL
  - Automatic cleanup of stale entries
  - Memory-efficient storage
  """

  use GenServer

  require Logger

  @table_name :prismatic_annihilation_technique_cache
  @default_ttl_ms 3_600_000  # 1 hour
  @cleanup_interval_ms 300_000  # 5 minutes

  # ===========================================================================
  # Client API
  # ===========================================================================

  @doc """
  Starts the cache GenServer.
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Gets a cached value for a technique.

  ## Parameters

  - `technique_id` - The technique identifier
  - `key` - The cache key (e.g., :patterns, :regex, :signatures)

  ## Returns

  - `{:ok, value}` - Cached value found
  - `:miss` - Cache miss
  """
  @spec get(atom(), atom()) :: {:ok, term()} | :miss
  def get(technique_id, key) do
    cache_key = {technique_id, key}

    case :ets.lookup(@table_name, cache_key) do
      [{^cache_key, value, expires_at}] ->
        if System.monotonic_time(:millisecond) < expires_at do
          {:ok, value}
        else
          # Expired entry
          :ets.delete(@table_name, cache_key)
          :miss
        end

      [] ->
        :miss
    end
  end

  @doc """
  Stores a value in the cache.

  ## Parameters

  - `technique_id` - The technique identifier
  - `key` - The cache key
  - `value` - The value to cache
  - `ttl_ms` - Optional TTL in milliseconds (default: 1 hour)
  """
  @spec put(atom(), atom(), term(), non_neg_integer()) :: :ok
  def put(technique_id, key, value, ttl_ms \\ @default_ttl_ms) do
    cache_key = {technique_id, key}
    expires_at = System.monotonic_time(:millisecond) + ttl_ms
    :ets.insert(@table_name, {cache_key, value, expires_at})
    :ok
  end

  @doc """
  Invalidates a cached entry.
  """
  @spec invalidate(atom(), atom()) :: :ok
  def invalidate(technique_id, key) do
    cache_key = {technique_id, key}
    :ets.delete(@table_name, cache_key)
    :ok
  end

  @doc """
  Invalidates all cached entries for a technique.
  """
  @spec invalidate_technique(atom()) :: :ok
  def invalidate_technique(technique_id) do
    # Use match spec to delete all entries for this technique
    match_spec = [{{{technique_id, :_}, :_, :_}, [], [true]}]
    :ets.select_delete(@table_name, match_spec)
    :ok
  end

  @doc """
  Clears the entire cache.
  """
  @spec clear() :: :ok
  def clear do
    :ets.delete_all_objects(@table_name)
    :ok
  end

  @doc """
  Returns cache statistics.
  """
  @spec stats() :: map()
  def stats do
    info = :ets.info(@table_name)

    %{
      size: Keyword.get(info, :size, 0),
      memory_bytes: Keyword.get(info, :memory, 0) * :erlang.system_info(:wordsize),
      table_name: @table_name
    }
  end

  # ===========================================================================
  # GenServer Implementation
  # ===========================================================================

  @impl true
  def init(_opts) do
    # Create ETS table
    table =
      :ets.new(@table_name, [
        :named_table,
        :public,
        :set,
        read_concurrency: true,
        write_concurrency: true
      ])

    # Schedule cleanup
    schedule_cleanup()

    Logger.info("[TechniqueCache] Initialized ETS cache: #{inspect(table)}")
    {:ok, %{table: table}}
  end

  @impl true
  def handle_info(:cleanup, state) do
    cleanup_expired()
    schedule_cleanup()
    {:noreply, state}
  end

  @impl true
  def handle_info(msg, state) do
    Logger.warning("[TechniqueCache] Unexpected message: #{inspect(msg)}")
    {:noreply, state}
  end

  # ===========================================================================
  # Private Functions
  # ===========================================================================

  defp schedule_cleanup do
    Process.send_after(self(), :cleanup, @cleanup_interval_ms)
  end

  defp cleanup_expired do
    now = System.monotonic_time(:millisecond)

    # Match spec for expired entries: {_, _, expires_at} where expires_at < now
    match_spec = [{{:_, :_, :"$1"}, [{:<, :"$1", now}], [true]}]

    deleted = :ets.select_delete(@table_name, match_spec)

    if deleted > 0 do
      Logger.debug("[TechniqueCache] Cleaned up #{deleted} expired entries")
    end
  end
end
