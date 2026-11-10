defmodule PrismaticAnnihilation.Patterns.PatternCompiler do
  @moduledoc """
  Pattern Compiler and Registry for Epistemic Attack Detection.

  Compiles, indexes, and manages all detection patterns across the five attack
  categories. Provides O(1) pattern lookup, compiled regex caching, confidence
  weight generation, and pattern overlap resolution.

  ## Responsibilities

  1. **Compilation** - Compile patterns to optimized forms (regex, keyword indexes)
  2. **Indexing** - Create ETS-backed indexes for O(1) lookup by technique, category, severity
  3. **Caching** - Cache compiled regular expressions for reuse
  4. **Weight Generation** - Calculate and normalize confidence weights
  5. **Overlap Resolution** - Handle pattern overlaps and conflicts between categories

  ## Performance

  - O(1) lookup by technique ID, category, or pattern ID
  - Compiled regex cached in ETS (no recompilation overhead)
  - Memory target: <100MB for all 200+ patterns
  - Thread-safe for concurrent access via ETS public tables

  ## Architecture

  Uses ETS tables for high-performance concurrent reads:
  - `:pattern_compiler_cache` - Cached compiled regex objects (legacy, preserved)
  - `:annihilation_pattern_index` - Pattern lookup by ID
  - `:annihilation_technique_index` - Patterns by technique ID
  - `:annihilation_category_index` - Patterns by category
  - `:annihilation_severity_index` - Patterns by severity level

  ## Usage

      # ETS tables are lazily initialized on first access
      # Compile all patterns and build indexes
      PatternCompiler.compile_all()

      # O(1) pattern lookup
      {:ok, patterns} = PatternCompiler.patterns_for_technique(:epistemic_imploze)

      # Get compiled regex from cache
      {:ok, regex} = PatternCompiler.get_compiled_regex(regex_string)

      # Full detection across all categories
      {:ok, results} = PatternCompiler.detect_all(content)

      # Regex cache (backward compatible)
      PatternCompiler.cache_compiled_regex("pattern", compiled)
      {:ok, regex} = PatternCompiler.get_compiled_regex("pattern")

  """

  require Logger

  alias PrismaticAnnihilation.Patterns.{
    CollapsePatterns,
    GravitationalPatterns,
    InfectionPatterns,
    ParadoxPatterns
  }

  # ===========================================================================
  # Constants
  # ===========================================================================

  @regex_cache_table :pattern_compiler_cache
  @pattern_index_table :annihilation_pattern_index
  @technique_index_table :annihilation_technique_index
  @category_index_table :annihilation_category_index
  @severity_index_table :annihilation_severity_index

  @all_tables [
    @regex_cache_table,
    @pattern_index_table,
    @technique_index_table,
    @category_index_table,
    @severity_index_table
  ]

  @pattern_modules [
    GravitationalPatterns,
    InfectionPatterns,
    ParadoxPatterns,
    CollapsePatterns
  ]

  # ===========================================================================
  # Types
  # ===========================================================================

  @type compiled_state :: %{
          total_patterns: non_neg_integer(),
          categories: [atom()],
          compiled_at: DateTime.t(),
          regex_cache_size: non_neg_integer(),
          pattern_modules: [module()]
        }

  @type detection_result :: %{
          pattern_id: atom(),
          pattern_name: String.t(),
          confidence: float(),
          severity: atom(),
          evidence: [map()],
          location: map(),
          associated_techniques: [atom()]
        }

  # ===========================================================================
  # Public API - Regex Cache (backward compatible)
  # ===========================================================================

  @doc """
  Looks up a pre-compiled regex by its source string.

  Returns `{:ok, %Regex{}}` on cache hit, or `:miss` on cache miss.
  Lazily initializes the ETS table on first call.
  """
  @spec get_compiled_regex(String.t()) :: {:ok, Regex.t()} | :miss
  def get_compiled_regex(regex_str) when is_binary(regex_str) do
    ensure_table_exists(@regex_cache_table)

    case :ets.lookup(@regex_cache_table, regex_str) do
      [{^regex_str, compiled}] -> {:ok, compiled}
      [] -> :miss
    end
  rescue
    ArgumentError -> :miss
  end

  @doc """
  Stores a compiled regex in the cache keyed by its source string.

  Overwrites any existing entry for the same key. This is safe because
  Regex.compile/2 is deterministic for the same input.
  """
  @spec cache_compiled_regex(String.t(), Regex.t()) :: :ok
  def cache_compiled_regex(regex_str, compiled) when is_binary(regex_str) do
    ensure_table_exists(@regex_cache_table)
    :ets.insert(@regex_cache_table, {regex_str, compiled})
    :ok
  rescue
    ArgumentError -> :ok
  end

  @doc """
  Returns the number of cached compiled regexes.
  """
  @spec cache_size() :: non_neg_integer()
  def cache_size do
    ensure_table_exists(@regex_cache_table)
    :ets.info(@regex_cache_table, :size)
  rescue
    ArgumentError -> 0
  end

  @doc """
  Clears all cached compiled regexes. Useful for testing.
  """
  @spec clear_cache() :: :ok
  def clear_cache do
    if table_exists?(@regex_cache_table) do
      :ets.delete_all_objects(@regex_cache_table)
    end

    :ok
  rescue
    ArgumentError -> :ok
  end

  # ===========================================================================
  # Public API - Pattern Compilation
  # ===========================================================================

  @doc """
  Compiles all patterns from all modules and builds ETS indexes.

  Called explicitly or lazily on first index access. Safe to call multiple
  times (idempotent - clears and rebuilds indexes).

  ## Returns

  - `{:ok, compiled_state()}` - Compilation successful with stats
  """
  @spec compile_all() :: {:ok, compiled_state()}
  def compile_all do
    state = do_compile_all()

    Logger.info(
      "[PatternCompiler] Compiled #{state.total_patterns} patterns across #{length(state.categories)} categories"
    )

    {:ok, state}
  end

  @doc """
  Returns all patterns across all categories.

  Falls back to direct module calls if indexes are not yet built.
  """
  @spec all_patterns() :: [map()]
  def all_patterns do
    if table_exists?(@pattern_index_table) and ets_size(@pattern_index_table) > 0 do
      :ets.tab2list(@pattern_index_table)
      |> Enum.map(fn {_id, pattern} -> pattern end)
    else
      Enum.flat_map(@pattern_modules, & &1.all())
    end
  end

  @doc """
  Returns total count of all patterns across all modules.
  """
  @spec total_count() :: non_neg_integer()
  def total_count do
    if table_exists?(@pattern_index_table) and ets_size(@pattern_index_table) > 0 do
      ets_size(@pattern_index_table)
    else
      Enum.sum(Enum.map(@pattern_modules, & &1.count()))
    end
  end

  @doc """
  Returns the list of registered pattern modules.
  """
  @spec pattern_modules() :: [module()]
  def pattern_modules, do: @pattern_modules

  # ===========================================================================
  # Public API - O(1) Lookups
  # ===========================================================================

  @doc """
  O(1) lookup of a pattern by pattern ID.

  ## Parameters

  - `pattern_id` - The pattern identifier atom

  ## Returns

  - `{:ok, pattern}` - Pattern found
  - `:not_found` - Pattern not in index
  """
  @spec get_pattern(atom()) :: {:ok, map()} | :not_found
  def get_pattern(pattern_id) do
    ensure_indexes_built()

    case :ets.lookup(@pattern_index_table, pattern_id) do
      [{^pattern_id, pattern}] -> {:ok, pattern}
      [] -> :not_found
    end
  rescue
    ArgumentError -> :not_found
  end

  @doc """
  O(1) lookup of patterns associated with a specific technique.

  ## Parameters

  - `technique_id` - The technique identifier atom

  ## Returns

  - `{:ok, [pattern]}` - Patterns linked to this technique
  """
  @spec patterns_for_technique(atom()) :: {:ok, [map()]}
  def patterns_for_technique(technique_id) do
    ensure_indexes_built()

    case :ets.lookup(@technique_index_table, technique_id) do
      [{^technique_id, pattern_ids}] ->
        patterns =
          pattern_ids
          |> Enum.map(&get_pattern/1)
          |> Enum.filter(&match?({:ok, _}, &1))
          |> Enum.map(fn {:ok, p} -> p end)

        {:ok, patterns}

      [] ->
        # Fallback to module-level search
        patterns = Enum.flat_map(@pattern_modules, & &1.for_technique(technique_id))
        {:ok, patterns}
    end
  rescue
    ArgumentError ->
      patterns = Enum.flat_map(@pattern_modules, & &1.for_technique(technique_id))
      {:ok, patterns}
  end

  @doc """
  O(1) lookup of patterns by category.

  ## Parameters

  - `category` - The pattern category atom (:gravitational, :infection, :paradox, :collapse)

  ## Returns

  - `{:ok, [pattern]}` - Patterns in the given category
  """
  @spec patterns_for_category(atom()) :: {:ok, [map()]}
  def patterns_for_category(category) do
    ensure_indexes_built()

    case :ets.lookup(@category_index_table, category) do
      [{^category, pattern_ids}] ->
        patterns =
          pattern_ids
          |> Enum.map(&get_pattern/1)
          |> Enum.filter(&match?({:ok, _}, &1))
          |> Enum.map(fn {:ok, p} -> p end)

        {:ok, patterns}

      [] ->
        {:ok, []}
    end
  rescue
    ArgumentError -> {:ok, []}
  end

  @doc """
  O(1) lookup of patterns by severity level.

  ## Parameters

  - `severity` - Severity atom (:low, :medium, :high, :critical, :terminal)
  """
  @spec patterns_by_severity(atom()) :: {:ok, [map()]}
  def patterns_by_severity(severity)
      when severity in [:low, :medium, :high, :critical, :terminal] do
    ensure_indexes_built()

    case :ets.lookup(@severity_index_table, severity) do
      [{^severity, pattern_ids}] ->
        patterns =
          pattern_ids
          |> Enum.map(&get_pattern/1)
          |> Enum.filter(&match?({:ok, _}, &1))
          |> Enum.map(fn {:ok, p} -> p end)

        {:ok, patterns}

      [] ->
        {:ok, []}
    end
  rescue
    ArgumentError -> {:ok, []}
  end

  # ===========================================================================
  # Public API - Detection
  # ===========================================================================

  @doc """
  Runs detection across all pattern categories simultaneously.

  ## Parameters

  - `content` - Text content to analyze
  - `opts` - Detection options:
    - `:threshold` - Minimum confidence (default: 0.6)
    - `:categories` - Filter by categories (default: all)
    - `:max_results` - Maximum results (default: 100)
    - `:resolve_overlaps` - Resolve overlapping detections (default: true)

  ## Returns

  - `{:ok, [detection_result()]}` - All detected patterns sorted by confidence
  """
  @spec detect_all(String.t(), keyword()) :: {:ok, [detection_result()]}
  def detect_all(content, opts \\ []) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    categories = Keyword.get(opts, :categories, :all)
    max_results = Keyword.get(opts, :max_results, 100)
    resolve_overlaps = Keyword.get(opts, :resolve_overlaps, true)

    start_time = System.monotonic_time(:microsecond)

    modules = select_modules(categories)

    results =
      modules
      |> Enum.flat_map(fn module ->
        case module.detect(content, threshold: threshold) do
          {:ok, detections} -> detections
          _ -> []
        end
      end)

    results =
      if resolve_overlaps do
        resolve_pattern_overlaps(results)
      else
        results
      end

    results =
      results
      |> Enum.sort_by(& &1.confidence, :desc)
      |> Enum.take(max_results)

    elapsed_us = System.monotonic_time(:microsecond) - start_time

    :telemetry.execute(
      [:prismatic_annihilation, :pattern_compiler, :detect_all],
      %{duration_us: elapsed_us, result_count: length(results), pattern_count: total_count()},
      %{categories: categories}
    )

    {:ok, results}
  end

  # ===========================================================================
  # Public API - Analysis and Validation
  # ===========================================================================

  @doc """
  Returns confidence weight summary per category.
  """
  @spec confidence_weights() :: map()
  def confidence_weights do
    all_patterns()
    |> Enum.group_by(& &1.category)
    |> Enum.map(fn {category, patterns} ->
      weights = Enum.map(patterns, & &1.confidence_weight)

      {category,
       %{
         count: length(patterns),
         min_weight: Enum.min(weights),
         max_weight: Enum.max(weights),
         avg_weight: Float.round(Enum.sum(weights) / length(weights), 3),
         severity_distribution: patterns |> Enum.map(& &1.severity) |> Enum.frequencies()
       }}
    end)
    |> Map.new()
  end

  @doc """
  Validates all pattern definitions for structural correctness.

  Checks required fields, regex compilability, associated techniques, and
  confidence weight bounds.

  ## Returns

  - `{:ok, validation_report}` - All patterns valid
  - `{:error, [issue]}` - Validation issues found
  """
  @spec validate_patterns() :: {:ok, map()} | {:error, [map()]}
  def validate_patterns do
    issues =
      all_patterns()
      |> Enum.flat_map(&validate_single_pattern/1)

    if Enum.empty?(issues) do
      {:ok,
       %{
         status: :valid,
         total_patterns: total_count(),
         categories: Enum.map(@pattern_modules, & &1.category()),
         validated_at: DateTime.utc_now()
       }}
    else
      {:error, issues}
    end
  end

  @doc """
  Returns compilation and index statistics.
  """
  @spec stats() :: map()
  def stats do
    %{
      total_patterns: total_count(),
      categories: Enum.map(@pattern_modules, & &1.category()),
      regex_cache_size: cache_size(),
      pattern_index_size: ets_size(@pattern_index_table),
      technique_index_size: ets_size(@technique_index_table),
      category_index_size: ets_size(@category_index_table),
      severity_index_size: ets_size(@severity_index_table),
      memory_bytes: total_memory(),
      pattern_modules: @pattern_modules,
      per_module:
        Enum.map(@pattern_modules, fn mod ->
          %{module: mod, category: mod.category(), count: mod.count()}
        end)
    }
  end

  # ===========================================================================
  # Private: Compilation
  # ===========================================================================

  defp do_compile_all do
    # Ensure all tables exist
    for table <- @all_tables, do: ensure_table_exists(table)

    # Clear existing indexes (not regex cache - those are still valid)
    for table <- [
          @pattern_index_table,
          @technique_index_table,
          @category_index_table,
          @severity_index_table
        ] do
      if table_exists?(table), do: :ets.delete_all_objects(table)
    end

    # Gather all patterns from all modules
    all = Enum.flat_map(@pattern_modules, & &1.all())

    # Build pattern index (O(1) by pattern_id)
    for pattern <- all do
      :ets.insert(@pattern_index_table, {pattern.id, pattern})
    end

    # Build technique index (O(1) by technique_id -> [pattern_id])
    technique_map =
      all
      |> Enum.flat_map(fn pattern ->
        Enum.map(pattern.associated_techniques, fn tech_id ->
          {tech_id, pattern.id}
        end)
      end)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))

    for {technique_id, pattern_ids} <- technique_map do
      :ets.insert(@technique_index_table, {technique_id, Enum.uniq(pattern_ids)})
    end

    # Build category index (O(1) by category -> [pattern_id])
    category_map = Enum.group_by(all, & &1.category, & &1.id)

    for {category, pattern_ids} <- category_map do
      :ets.insert(@category_index_table, {category, pattern_ids})
    end

    # Build severity index (O(1) by severity -> [pattern_id])
    severity_map = Enum.group_by(all, & &1.severity, & &1.id)

    for {severity, pattern_ids} <- severity_map do
      :ets.insert(@severity_index_table, {severity, pattern_ids})
    end

    # Pre-compile all regex patterns into the cache
    precompile_regex_patterns(all)

    categories = all |> Enum.map(& &1.category) |> Enum.uniq()

    %{
      total_patterns: length(all),
      categories: categories,
      compiled_at: DateTime.utc_now(),
      regex_cache_size: cache_size(),
      pattern_modules: @pattern_modules
    }
  end

  defp precompile_regex_patterns(patterns) do
    patterns
    |> Enum.filter(fn p -> p.detection_type == :regex and is_binary(p.regex) end)
    |> Enum.each(fn pattern ->
      case Regex.compile(pattern.regex, [:caseless]) do
        {:ok, compiled} ->
          cache_compiled_regex(pattern.regex, compiled)

        {:error, reason} ->
          Logger.warning(
            "[PatternCompiler] Failed to compile regex for #{pattern.id}: #{inspect(reason)}"
          )
      end
    end)
  end

  # ===========================================================================
  # Private: Module Selection
  # ===========================================================================

  defp select_modules(:all), do: @pattern_modules

  defp select_modules(categories) when is_list(categories) do
    category_set = MapSet.new(categories)

    Enum.filter(@pattern_modules, fn module ->
      MapSet.member?(category_set, module.category())
    end)
  end

  defp select_modules(_), do: @pattern_modules

  # ===========================================================================
  # Private: Overlap Resolution
  # ===========================================================================

  defp resolve_pattern_overlaps(results) do
    results
    |> Enum.group_by(fn result ->
      List.first(result.associated_techniques)
    end)
    |> Enum.flat_map(fn {_technique, group} ->
      if length(group) > 3 do
        group
        |> Enum.sort_by(& &1.confidence, :desc)
        |> Enum.take(3)
      else
        group
      end
    end)
  end

  # ===========================================================================
  # Private: Validation
  # ===========================================================================

  defp validate_single_pattern(pattern) do
    issues = []

    issues =
      if is_nil(Map.get(pattern, :id)) do
        [%{pattern: inspect(pattern), issue: "Missing :id field"} | issues]
      else
        issues
      end

    issues =
      if is_nil(Map.get(pattern, :name)) do
        [%{pattern: pattern[:id], issue: "Missing :name field"} | issues]
      else
        issues
      end

    issues =
      if is_nil(Map.get(pattern, :category)) do
        [%{pattern: pattern[:id], issue: "Missing :category field"} | issues]
      else
        issues
      end

    issues =
      if is_nil(Map.get(pattern, :confidence_weight)) or Map.get(pattern, :confidence_weight) < 0.0 or
           Map.get(pattern, :confidence_weight) > 1.0 do
        [%{pattern: pattern[:id], issue: "Invalid :confidence_weight (must be 0.0-1.0)"} | issues]
      else
        issues
      end

    issues =
      if Enum.empty?(pattern[:keywords] || []) and is_nil(pattern[:regex]) do
        [
          %{pattern: pattern[:id], issue: "Pattern has no keywords and no regex - undetectable"}
          | issues
        ]
      else
        issues
      end

    issues =
      if is_binary(Map.get(pattern, :regex)) do
        case Regex.compile(pattern.regex, [:caseless]) do
          {:ok, _} ->
            issues

          {:error, reason} ->
            [%{pattern: pattern[:id], issue: "Invalid regex: #{inspect(reason)}"} | issues]
        end
      else
        issues
      end

    if Enum.empty?(pattern[:associated_techniques] || []) do
      [%{pattern: pattern[:id], issue: "No associated techniques"} | issues]
    else
      issues
    end
  end

  # ===========================================================================
  # Private: ETS Helpers
  # ===========================================================================

  defp ensure_table_exists(table) do
    unless table_exists?(table) do
      try do
        :ets.new(table, [:set, :public, :named_table, read_concurrency: true])
      rescue
        ArgumentError ->
          # Table already created by a concurrent process - safe to ignore
          :ok
      end
    end
  end

  defp ensure_indexes_built do
    ensure_table_exists(@pattern_index_table)

    if ets_size(@pattern_index_table) == 0 do
      do_compile_all()
    end
  end

  defp table_exists?(table) do
    :ets.whereis(table) != :undefined
  end

  defp ets_size(table) do
    if table_exists?(table) do
      :ets.info(table, :size)
    else
      0
    end
  rescue
    ArgumentError -> 0
  end

  defp total_memory do
    word_size = :erlang.system_info(:wordsize)

    @all_tables
    |> Enum.map(fn table ->
      if table_exists?(table) do
        :ets.info(table, :memory) * word_size
      else
        0
      end
    end)
    |> Enum.sum()
  rescue
    ArgumentError -> 0
  end
end
