defmodule PrismaticAnnihilation.Patterns.MetaProgramming do
  @moduledoc """
  Meta-Programming Infrastructure for Pattern Detection Modules.

  Eliminates the massive code duplication across pattern detection modules
  (GravitationalPatterns, CollapsePatterns, InfectionPatterns, ParadoxPatterns)
  by providing macros that generate all shared detection infrastructure from
  a declarative specification.

  ## Problem Solved

  Each pattern module previously contained 160+ lines of identical private
  functions for matching, scoring, evidence building, location extraction,
  and false positive rejection. These 9 functions were copy-pasted across
  4 modules with only the `source` string varying.

  ## Architecture

  This module provides three levels of meta-programming:

  1. **`__using__` macro** - Injects all shared detection infrastructure
  2. **`defpattern_module/2`** - Generates a complete pattern module from spec
  3. **`defpattern/2`** - Defines individual patterns with validation

  ## Usage

  ### Level 1: Use as foundation for hand-written modules

      defmodule MyPatterns do
        use PrismaticAnnihilation.Patterns.MetaProgramming,
          category: :my_category,
          source: "my_patterns"

        # Only define pattern data functions - all infrastructure injected
        def subcategory_map do
          %{
            :all => &all/0,
            :sub_a => &sub_a_patterns/0
          }
        end

        defp sub_a_patterns, do: [%{id: :pattern_1, ...}]
      end

  ### Level 2: Generate entire module from specification

      PrismaticAnnihilation.Patterns.MetaProgramming.defpattern_module(
        MyPatterns,
        category: :my_category,
        subcategories: [
          sub_a: [%{id: :p1, name: "Pattern 1", ...}],
          sub_b: [%{id: :p2, name: "Pattern 2", ...}]
        ]
      )

  ### Level 3: Data-driven generation from JSON

      patterns = Jason.decode!(json_data)
      PrismaticAnnihilation.Patterns.MetaProgramming.generate_from_data(
        MyPatterns, patterns
      )

  """

  alias PrismaticAnnihilation.Patterns.PatternCompiler

  # Pattern definition schema. All pattern maps must conform to this structure.
  @pattern_schema %{
    required: [
      :id,
      :name,
      :category,
      :subcategory,
      :detection_type,
      :keywords,
      :confidence_weight,
      :associated_techniques,
      :severity,
      :description
    ],
    optional: [:regex, :semantic_markers, :context_requirements, :false_positive_indicators],
    defaults: %{
      regex: nil,
      semantic_markers: [],
      context_requirements: [],
      false_positive_indicators: []
    }
  }

  @doc """
  Returns the pattern definition schema for validation.
  """
  @spec pattern_schema() :: map()
  def pattern_schema, do: @pattern_schema

  @doc """
  Validates a pattern map against the schema.

  Returns `{:ok, pattern}` with defaults applied, or `{:error, issues}`.
  """
  @spec validate_pattern(map()) :: {:ok, map()} | {:error, [String.t()]}
  def validate_pattern(pattern) when is_map(pattern) do
    issues = []

    issues =
      Enum.reduce(@pattern_schema.required, issues, fn field, acc ->
        if Map.has_key?(pattern, field) do
          acc
        else
          ["Missing required field: #{field}" | acc]
        end
      end)

    issues =
      if is_float(pattern[:confidence_weight]) and
           pattern[:confidence_weight] >= 0.0 and
           pattern[:confidence_weight] <= 1.0 do
        issues
      else
        if Map.has_key?(pattern, :confidence_weight) do
          ["Invalid confidence_weight: must be float 0.0-1.0" | issues]
        else
          issues
        end
      end

    issues =
      if pattern[:detection_type] in [:regex, :keyword, :semantic, :structural] do
        issues
      else
        if Map.has_key?(pattern, :detection_type) do
          ["Invalid detection_type: #{inspect(pattern[:detection_type])}" | issues]
        else
          issues
        end
      end

    issues =
      if pattern[:detection_type] == :regex and is_binary(pattern[:regex]) do
        case Regex.compile(pattern[:regex], [:caseless]) do
          {:ok, _} -> issues
          {:error, reason} -> ["Invalid regex: #{inspect(reason)}" | issues]
        end
      else
        issues
      end

    if Enum.empty?(issues) do
      {:ok, apply_defaults(pattern)}
    else
      {:error, Enum.reverse(issues)}
    end
  end

  @doc """
  Validates a list of patterns, returning all valid patterns and issues.
  """
  @spec validate_patterns([map()]) :: %{valid: [map()], invalid: [{map(), [String.t()]}]}
  def validate_patterns(patterns) when is_list(patterns) do
    Enum.reduce(patterns, %{valid: [], invalid: []}, fn pattern, acc ->
      case validate_pattern(pattern) do
        {:ok, validated} ->
          %{acc | valid: [validated | acc.valid]}

        {:error, issues} ->
          %{acc | invalid: [{pattern, issues} | acc.invalid]}
      end
    end)
    |> Map.update!(:valid, &Enum.reverse/1)
    |> Map.update!(:invalid, &Enum.reverse/1)
  end

  # ---------------------------------------------------------------------------
  # Core Detection Functions (shared implementation)
  # ---------------------------------------------------------------------------

  @doc """
  Matches a single pattern against content. Returns detection result or nil.

  This is the canonical implementation used by all pattern modules.
  """
  @spec match_pattern(map(), String.t(), String.t(), String.t()) :: map() | nil
  def match_pattern(pattern, content_lower, original_content, source) do
    keyword_score = match_keywords(pattern.keywords, content_lower)
    semantic_score = match_semantic_markers(pattern[:semantic_markers] || [], content_lower)
    regex_score = match_regex(pattern, content_lower)

    combined_score =
      calculate_combined_score(
        keyword_score,
        semantic_score,
        regex_score,
        pattern
      )

    if combined_score > 0.0 do
      evidence =
        build_evidence(
          pattern,
          content_lower,
          keyword_score,
          semantic_score,
          regex_score,
          source
        )

      %{
        pattern_id: pattern.id,
        pattern_name: pattern.name,
        confidence: min(0.99, combined_score * pattern.confidence_weight),
        severity: pattern.severity,
        evidence: evidence,
        location: extract_location(pattern, original_content),
        associated_techniques: pattern.associated_techniques
      }
    else
      nil
    end
  end

  @doc """
  Runs the full detection pipeline on content against a list of patterns.
  """
  @spec detect_patterns(String.t(), [map()], keyword(), String.t()) :: {:ok, [map()]}
  def detect_patterns(content, patterns, opts, source) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    max_results = Keyword.get(opts, :max_results, 50)
    content_lower = String.downcase(content)

    results =
      patterns
      |> Enum.map(&match_pattern(&1, content_lower, content, source))
      |> Enum.reject(&is_nil/1)
      |> Enum.filter(fn result -> result.confidence >= threshold end)
      |> reject_false_positives(patterns, content_lower)
      |> Enum.sort_by(& &1.confidence, :desc)
      |> Enum.take(max_results)

    {:ok, results}
  end

  @doc """
  Calculates keyword match score.
  """
  @spec match_keywords([String.t()], String.t()) :: float()
  def match_keywords(keywords, content) do
    total = length(keywords)

    if total > 0 do
      matches = Enum.count(keywords, &String.contains?(content, String.downcase(&1)))
      matches / total
    else
      0.0
    end
  end

  @doc """
  Calculates semantic marker match score (weighted at 0.8x).
  """
  @spec match_semantic_markers([String.t()], String.t()) :: float()
  def match_semantic_markers(markers, content) do
    total = length(markers)

    if total > 0 do
      matches = Enum.count(markers, &String.contains?(content, String.downcase(&1)))
      matches / total * 0.8
    else
      0.0
    end
  end

  @doc """
  Matches regex pattern with ETS cache lookup.
  """
  @spec match_regex(map(), String.t()) :: float()
  def match_regex(%{detection_type: :regex, regex: regex_str}, content)
      when is_binary(regex_str) do
    case PatternCompiler.get_compiled_regex(regex_str) do
      {:ok, regex} ->
        if Regex.match?(regex, content), do: 1.0, else: 0.0

      :miss ->
        compile_and_match(regex_str, content)
    end
  end

  def match_regex(_pattern, _content), do: 0.0

  @doc """
  Calculates combined score based on detection type weighting.
  """
  @spec calculate_combined_score(float(), float(), float(), map()) :: float()
  def calculate_combined_score(keyword_score, semantic_score, regex_score, pattern) do
    case pattern.detection_type do
      :regex -> regex_score * 0.5 + keyword_score * 0.3 + semantic_score * 0.2
      :keyword -> keyword_score * 0.6 + semantic_score * 0.4
      :semantic -> semantic_score * 0.5 + keyword_score * 0.5
      _ -> (keyword_score + semantic_score + regex_score) / 3.0
    end
  end

  # ---------------------------------------------------------------------------
  # __using__ Macro - Injects shared infrastructure into pattern modules
  # ---------------------------------------------------------------------------

  @doc """
  Injects all shared detection infrastructure into a pattern module.

  ## Options

  - `:category` (required) - The pattern category atom
  - `:source` (required) - Source identifier for evidence attribution

  ## Generated Functions

  All behaviour callbacks get default implementations that delegate to
  the module's `subcategory_map/0` and the shared detection infrastructure.
  The module only needs to define pattern data functions.
  """
  defmacro __using__(opts) do
    category = Keyword.fetch!(opts, :category)
    source = Keyword.fetch!(opts, :source)

    quote do
      @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

      alias PrismaticAnnihilation.Patterns.MetaProgramming

      @pattern_source unquote(source)
      @pattern_category unquote(category)

      @impl true
      @spec category() :: atom()
      def category, do: @pattern_category

      @impl true
      @spec count() :: non_neg_integer()
      def count, do: length(all())

      @impl true
      @spec for_technique(atom()) :: [map()]
      def for_technique(technique_id) do
        Enum.filter(all(), fn pattern ->
          technique_id in pattern.associated_techniques
        end)
      end

      @impl true
      @spec detect(String.t(), keyword()) :: {:ok, [map()]}
      def detect(content, opts \\ []) when is_binary(content) do
        subcategory = Keyword.get(opts, :subcategory, :all)

        patterns =
          case subcategory do
            :all ->
              all()

            sub ->
              case Map.get(subcategory_map(), sub) do
                fun when is_function(fun, 0) -> fun.()
                _ -> all()
              end
          end

        MetaProgramming.detect_patterns(content, patterns, opts, @pattern_source)
      end

      @doc """
      Returns a map of subcategory atoms to zero-arity functions
      returning patterns for that subcategory.

      Override this in implementing modules to enable subcategory filtering.
      """
      @spec subcategory_map() :: %{atom() => (-> [map()])}
      def subcategory_map, do: %{}

      defoverridable subcategory_map: 0
    end
  end

  # ---------------------------------------------------------------------------
  # Module Generation from Specifications
  # ---------------------------------------------------------------------------

  @doc """
  Generates a complete pattern module from a declarative specification.

  ## Parameters

  - `module_name` - The module to define (e.g., `MyApp.Patterns.Custom`)
  - `opts` - Specification options:
    - `:category` - Category atom (required)
    - `:source` - Source string for evidence (defaults to module name)
    - `:subcategories` - Keyword list of `{subcategory_atom, [pattern_map]}` (required)
    - `:moduledoc` - Module documentation string (optional)

  ## Returns

  - `{:ok, module}` - Module successfully generated
  - `{:error, reasons}` - Generation failed with validation errors
  """
  @spec generate_module(module(), keyword()) :: {:ok, module()} | {:error, [String.t()]}
  def generate_module(module_name, opts) do
    category = Keyword.fetch!(opts, :category)

    source =
      Keyword.get(opts, :source, module_name |> Module.split() |> List.last() |> Macro.underscore())

    subcategories = Keyword.fetch!(opts, :subcategories)
    moduledoc = Keyword.get(opts, :moduledoc, "Auto-generated pattern module for #{category}")

    # Validate all patterns
    all_patterns = Enum.flat_map(subcategories, fn {_name, patterns} -> patterns end)
    validation = validate_patterns(all_patterns)

    if Enum.empty?(validation.invalid) do
      do_generate_module(module_name, category, source, subcategories, moduledoc)
    else
      issues =
        Enum.flat_map(validation.invalid, fn {pattern, errors} ->
          Enum.map(errors, &"Pattern #{inspect(pattern[:id])}: #{&1}")
        end)

      {:error, issues}
    end
  end

  defp do_generate_module(module_name, category, source, subcategories, moduledoc) do
    # Build the all/0 function body
    all_patterns = Enum.flat_map(subcategories, fn {_name, patterns} -> patterns end)

    # Build subcategory map
    subcat_entries =
      Enum.map(subcategories, fn {name, patterns} ->
        {name, patterns}
      end)

    contents =
      quote do
        @moduledoc unquote(moduledoc)

        use PrismaticAnnihilation.Patterns.MetaProgramming,
          category: unquote(category),
          source: unquote(source)

        @all_patterns unquote(Macro.escape(all_patterns))
        @subcategory_data unquote(Macro.escape(subcat_entries))

        @impl true
        @spec all() :: [map()]
        def all, do: @all_patterns

        @spec subcategory_map() :: %{atom() => (-> [map()])}
        def subcategory_map do
          @subcategory_data
          |> Enum.map(fn {name, patterns} ->
            {name, fn -> patterns end}
          end)
          |> Map.new()
        end
      end

    Module.create(module_name, contents, Macro.Env.location(__ENV__))
    {:ok, module_name}
  end

  # ---------------------------------------------------------------------------
  # Data-Driven Generation (JSON -> Elixir)
  # ---------------------------------------------------------------------------

  @doc """
  Generates a pattern module from parsed JSON data.

  Expects a map with:
  - `"category"` - Category string (converted to atom)
  - `"source"` - Source identifier
  - `"subcategories"` - Map of subcategory name to list of pattern objects

  Each pattern object must have string keys matching the schema.
  """
  @spec generate_from_data(module(), map()) :: {:ok, module()} | {:error, [String.t()]}
  def generate_from_data(module_name, data) when is_map(data) do
    category = data |> Map.get("category", "unknown") |> safe_to_atom()
    source = Map.get(data, "source", Macro.underscore(inspect(module_name)))

    subcategories =
      data
      |> Map.get("subcategories", %{})
      |> Enum.map(fn {name, patterns} ->
        {safe_to_atom(name), Enum.map(patterns, &json_to_pattern/1)}
      end)

    generate_module(module_name,
      category: category,
      source: source,
      subcategories: subcategories
    )
  end

  @doc """
  Converts a JSON pattern object (string keys) to an Elixir pattern map (atom keys).
  """
  @spec json_to_pattern(map()) :: map()
  def json_to_pattern(json) when is_map(json) do
    %{
      id: json |> Map.get("id", "unknown") |> safe_to_atom(),
      name: Map.get(json, "name", "Unknown Pattern"),
      category: json |> Map.get("category", "unknown") |> safe_to_atom(),
      subcategory: json |> Map.get("subcategory", "unknown") |> safe_to_atom(),
      detection_type: json |> Map.get("detection_type", "keyword") |> safe_to_atom(),
      regex: Map.get(json, "regex"),
      keywords: Map.get(json, "keywords", []),
      semantic_markers: Map.get(json, "semantic_markers", []),
      confidence_weight: Map.get(json, "confidence_weight", 0.7) |> ensure_float(),
      associated_techniques:
        json
        |> Map.get("associated_techniques", [])
        |> Enum.map(&safe_to_atom/1),
      context_requirements:
        json
        |> Map.get("context_requirements", [])
        |> Enum.map(&safe_to_atom/1),
      false_positive_indicators: Map.get(json, "false_positive_indicators", []),
      severity: json |> Map.get("severity", "medium") |> safe_to_atom(),
      description: Map.get(json, "description", "")
    }
  end

  # ---------------------------------------------------------------------------
  # Bidirectional: Elixir Pattern -> JSON
  # ---------------------------------------------------------------------------

  @doc """
  Converts an Elixir pattern map to a JSON-serializable map (string keys).
  """
  @spec pattern_to_json(map()) :: map()
  def pattern_to_json(pattern) when is_map(pattern) do
    %{
      "id" => to_string(pattern.id),
      "name" => pattern.name,
      "category" => to_string(pattern.category),
      "subcategory" => to_string(pattern[:subcategory]),
      "detection_type" => to_string(pattern.detection_type),
      "regex" => pattern[:regex],
      "keywords" => pattern.keywords,
      "semantic_markers" => pattern[:semantic_markers] || [],
      "confidence_weight" => pattern.confidence_weight,
      "associated_techniques" => Enum.map(pattern.associated_techniques, &to_string/1),
      "context_requirements" => Enum.map(pattern[:context_requirements] || [], &to_string/1),
      "false_positive_indicators" => pattern[:false_positive_indicators] || [],
      "severity" => to_string(pattern.severity),
      "description" => pattern.description
    }
  end

  @doc """
  Exports all patterns from a module to JSON-serializable format.
  """
  @spec export_module(module()) :: map()
  def export_module(module) do
    patterns = module.all()

    subcategories =
      patterns
      |> Enum.group_by(& &1.subcategory)
      |> Enum.map(fn {subcat, pats} ->
        {to_string(subcat), Enum.map(pats, &pattern_to_json/1)}
      end)
      |> Map.new()

    %{
      "category" => to_string(module.category()),
      "source" => module |> Module.split() |> List.last() |> Macro.underscore(),
      "pattern_count" => module.count(),
      "subcategories" => subcategories,
      "exported_at" => DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end

  @doc """
  Verifies round-trip consistency: Elixir -> JSON -> Elixir.

  Returns `{:ok, :consistent}` if all patterns survive the round trip,
  or `{:error, mismatches}` with details of inconsistencies.
  """
  @spec verify_round_trip([map()]) :: {:ok, :consistent} | {:error, [map()]}
  def verify_round_trip(patterns) when is_list(patterns) do
    mismatches =
      patterns
      |> Enum.map(fn original ->
        reconstructed =
          original
          |> pattern_to_json()
          |> json_to_pattern()

        if patterns_equivalent?(original, reconstructed) do
          nil
        else
          %{
            original_id: original.id,
            differences: diff_patterns(original, reconstructed)
          }
        end
      end)
      |> Enum.reject(&is_nil/1)

    if Enum.empty?(mismatches) do
      {:ok, :consistent}
    else
      {:error, mismatches}
    end
  end

  # ---------------------------------------------------------------------------
  # Technique Definition Macros
  # ---------------------------------------------------------------------------

  @doc """
  Macro for defining technique specifications that can generate detectors.

  Used in taxonomy modules to define techniques with all their metadata,
  from which detection engines and tests can be auto-generated.
  """
  defmacro deftechnique(id, attrs) do
    quote do
      @techniques {unquote(id), unquote(Macro.escape(attrs))}
    end
  end

  # ---------------------------------------------------------------------------
  # Private Helpers
  # ---------------------------------------------------------------------------

  defp compile_and_match(regex_str, content) do
    case Regex.compile(regex_str, [:caseless]) do
      {:ok, regex} ->
        PatternCompiler.cache_compiled_regex(regex_str, regex)
        if Regex.match?(regex, content), do: 1.0, else: 0.0

      {:error, _} ->
        0.0
    end
  end

  defp build_evidence(pattern, content, keyword_score, semantic_score, regex_score, source) do
    evidence = []

    evidence =
      if keyword_score > 0.0 do
        matched = Enum.filter(pattern.keywords, &String.contains?(content, String.downcase(&1)))

        [
          %{type: :keyword_match, content: matched, weight: keyword_score, source: source}
          | evidence
        ]
      else
        evidence
      end

    evidence =
      if semantic_score > 0.0 do
        markers = pattern[:semantic_markers] || []
        matched = Enum.filter(markers, &String.contains?(content, String.downcase(&1)))

        [
          %{type: :semantic_match, content: matched, weight: semantic_score, source: source}
          | evidence
        ]
      else
        evidence
      end

    if regex_score > 0.0 do
      [
        %{
          type: :regex_match,
          content: "Pattern: #{pattern[:regex]}",
          weight: regex_score,
          source: source
        }
        | evidence
      ]
    else
      evidence
    end
  end

  defp extract_location(pattern, content) do
    first_keyword =
      Enum.find(pattern.keywords, fn kw ->
        String.contains?(String.downcase(content), String.downcase(kw))
      end)

    case first_keyword do
      nil ->
        %{start: 0, end: String.length(content), context: String.slice(content, 0, 200)}

      kw ->
        case :binary.match(String.downcase(content), String.downcase(kw)) do
          {start, len} ->
            context_start = max(0, start - 50)
            context_end = min(String.length(content), start + len + 50)
            context = String.slice(content, context_start, context_end - context_start)
            %{start: start, end: start + len, context: context}

          :nomatch ->
            %{start: 0, end: String.length(content), context: String.slice(content, 0, 200)}
        end
    end
  end

  defp reject_false_positives(results, all_patterns, content) do
    pattern_index = Map.new(all_patterns, &{&1.id, &1})

    Enum.reject(results, fn result ->
      case Map.get(pattern_index, result.pattern_id) do
        nil ->
          false

        pattern ->
          indicators = pattern[:false_positive_indicators] || []

          Enum.any?(indicators, fn indicator ->
            String.contains?(content, String.downcase(indicator))
          end)
      end
    end)
  end

  defp apply_defaults(pattern) do
    Enum.reduce(@pattern_schema.defaults, pattern, fn {key, default}, acc ->
      Map.put_new(acc, key, default)
    end)
  end

  defp safe_to_atom(value) when is_atom(value), do: value

  defp safe_to_atom(value) when is_binary(value) do
    try do
      String.to_existing_atom(value)
    rescue
      ArgumentError ->
        # For unknown atoms, use a safe default mapping
        case value do
          "high" -> :high
          "medium" -> :medium
          "low" -> :low
          "critical" -> :critical
          "keyword" -> :keyword
          "regex" -> :regex
          "semantic" -> :semantic
          "unknown" -> :unknown
          _ -> :unknown
        end
    end
  end

  defp ensure_float(value) when is_float(value), do: value
  defp ensure_float(value) when is_integer(value), do: value / 1
  defp ensure_float(_), do: 0.7

  defp patterns_equivalent?(a, b) do
    a.id == b.id and
      a.name == b.name and
      a.category == b.category and
      a.detection_type == b.detection_type and
      a.keywords == b.keywords and
      a.severity == b.severity and
      abs(a.confidence_weight - b.confidence_weight) < 0.001
  end

  defp diff_patterns(a, b) do
    [:id, :name, :category, :detection_type, :keywords, :severity, :confidence_weight]
    |> Enum.flat_map(fn field ->
      va = Map.get(a, field)
      vb = Map.get(b, field)

      if va == vb do
        []
      else
        [%{field: field, original: va, reconstructed: vb}]
      end
    end)
  end
end
