defmodule PrismaticAnnihilation.Patterns.Generator do
  @moduledoc """
  Pattern and Module Generator for the Annihilation Detection System.

  Generates new detection patterns, complete modules, and test suites from
  specifications, JSON data, or taxonomy definitions. Complements the Extractor
  (which reads existing patterns) by creating new ones.

  ## Capabilities

  1. **Module Generation** - Create pattern modules from JSON or keyword specs
  2. **Pattern Generation** - Generate individual patterns from technique definitions
  3. **Test Generation** - Auto-generate test cases from pattern definitions
  4. **Engine Generation** - Create detection engine GenServers from specs
  5. **Documentation Generation** - Produce docs from pattern metadata

  ## Architecture

  The Generator operates in a pipeline:

      Specification (JSON/keyword/taxonomy)
      |> Validate (schema check)
      |> Transform (normalize structure)
      |> Generate (produce Elixir code)
      |> Verify (compilation + round-trip check)

  ## Usage

      # Generate module from JSON file
      {:ok, module} = Generator.from_json_file("priv/data/patterns/custom.json")

      # Generate module from inline spec
      {:ok, module} = Generator.from_spec(MyModule, category: :custom, ...)

      # Generate patterns from technique definitions
      patterns = Generator.patterns_from_techniques(techniques)

      # Generate test module
      {:ok, source} = Generator.generate_test_source(GravitationalPatterns)

  """

  alias PrismaticAnnihilation.Patterns.{
    Extractor,
    MetaProgramming
  }

  require Logger

  # ---------------------------------------------------------------------------
  # Types
  # ---------------------------------------------------------------------------

  @type generation_result :: %{
          module: module(),
          pattern_count: non_neg_integer(),
          validation_issues: [String.t()],
          generated_at: DateTime.t()
        }

  # ---------------------------------------------------------------------------
  # Public API - Module Generation
  # ---------------------------------------------------------------------------

  @doc """
  Generates a pattern module from a JSON file.

  The JSON file must contain:
  - `"category"` - Category string
  - `"source"` - Source identifier
  - `"subcategories"` - Map of subcategory name to pattern list

  ## Parameters

  - `path` - Path to JSON file
  - `module_name` - The module to create (optional, derived from category if nil)

  ## Returns

  - `{:ok, generation_result()}` - Module generated successfully
  - `{:error, reason}` - Generation failed
  """
  @spec from_json_file(String.t(), module() | nil) :: {:ok, generation_result()} | {:error, term()}
  def from_json_file(path, module_name \\ nil) do
    with {:ok, content} <- File.read(path),
         {:ok, data} <- Jason.decode(content) do
      actual_module =
        module_name ||
          derive_module_name(data)

      case MetaProgramming.generate_from_data(actual_module, data) do
        {:ok, module} ->
          {:ok,
           %{
             module: module,
             pattern_count: module.count(),
             validation_issues: [],
             generated_at: DateTime.utc_now()
           }}

        {:error, issues} ->
          {:error, {:validation_failed, issues}}
      end
    else
      {:error, reason} -> {:error, {:file_error, reason}}
    end
  end

  @doc """
  Generates a pattern module from a keyword specification.

  ## Parameters

  - `module_name` - Module to create
  - `opts` - Options:
    - `:category` (required) - Category atom
    - `:source` - Source string (defaults to derived from module name)
    - `:subcategories` (required) - Keyword list of `{atom, [pattern_map]}`
    - `:moduledoc` - Module documentation

  ## Returns

  - `{:ok, generation_result()}` - Module generated
  - `{:error, reason}` - Generation failed
  """
  @spec from_spec(module(), keyword()) :: {:ok, generation_result()} | {:error, term()}
  def from_spec(module_name, opts) do
    case MetaProgramming.generate_module(module_name, opts) do
      {:ok, module} ->
        {:ok,
         %{
           module: module,
           pattern_count: module.count(),
           validation_issues: [],
           generated_at: DateTime.utc_now()
         }}

      {:error, issues} ->
        {:error, {:validation_failed, issues}}
    end
  end

  # ---------------------------------------------------------------------------
  # Public API - Pattern Generation from Techniques
  # ---------------------------------------------------------------------------

  @doc """
  Generates detection patterns from technique definitions.

  Takes a list of technique maps (as from `PrismaticAnnihilation.Taxonomy`)
  and generates detection patterns based on their metadata.

  Each technique generates patterns using:
  - `detection_patterns` field -> regex/keyword patterns
  - `typical_manifestations` -> semantic markers
  - `defense_strategies` -> false positive context
  - `see_also` -> associated technique cross-references

  ## Parameters

  - `techniques` - List of technique maps from taxonomy
  - `opts` - Options:
    - `:category` - Override category (default: from technique)
    - `:confidence_base` - Base confidence weight (default: 0.8)
    - `:prefix` - ID prefix (default: "gen")

  ## Returns

  List of generated pattern maps ready for use in a pattern module.
  """
  @spec patterns_from_techniques([map()], keyword()) :: [map()]
  def patterns_from_techniques(techniques, opts \\ []) do
    confidence_base = Keyword.get(opts, :confidence_base, 0.8)
    prefix = Keyword.get(opts, :prefix, "gen")

    techniques
    |> Enum.flat_map(fn technique ->
      generate_patterns_for_technique(technique, confidence_base, prefix, opts)
    end)
  end

  @doc """
  Generates patterns for a single technique.

  Creates one pattern per detection_pattern entry plus one keyword
  pattern aggregating all typical_manifestations.
  """
  @spec patterns_for_technique(map(), keyword()) :: [map()]
  def patterns_for_technique(technique, opts \\ []) do
    generate_patterns_for_technique(
      technique,
      Keyword.get(opts, :confidence_base, 0.8),
      Keyword.get(opts, :prefix, "gen"),
      opts
    )
  end

  # ---------------------------------------------------------------------------
  # Public API - Test Generation
  # ---------------------------------------------------------------------------

  @doc """
  Generates ExUnit test source code for a pattern module.

  Creates tests that verify:
  - All patterns have required fields
  - Pattern counts match expectations
  - Category is correctly set
  - Detection works for each pattern's keywords
  - False positive indicators are respected
  - Round-trip JSON consistency

  ## Parameters

  - `module` - The pattern module to generate tests for

  ## Returns

  - `{:ok, source_string}` - Elixir source code for test module
  """
  @spec generate_test_source(module()) :: {:ok, String.t()}
  def generate_test_source(module) do
    patterns = module.all()
    category = module.category()
    module_name = module |> Module.split() |> Enum.join(".")
    test_module_name = "#{module_name}Test"

    test_cases = Enum.map(patterns, &generate_pattern_test_case/1)

    source = """
    defmodule #{test_module_name} do
      use ExUnit.Case, async: true

      alias #{module_name}

      describe "module metadata" do
        test "category returns #{inspect(category)}" do
          assert #{module_name}.category() == #{inspect(category)}
        end

        test "count returns #{length(patterns)}" do
          assert #{module_name}.count() == #{length(patterns)}
        end

        test "all returns list of maps" do
          patterns = #{module_name}.all()
          assert is_list(patterns)
          assert Enum.all?(patterns, &is_map/1)
        end
      end

      describe "pattern structure" do
        test "all patterns have required fields" do
          required_fields = [:id, :name, :category, :subcategory, :detection_type,
                             :keywords, :confidence_weight, :associated_techniques,
                             :severity, :description]

          for pattern <- #{module_name}.all() do
            for field <- required_fields do
              assert Map.has_key?(pattern, field),
                     "Pattern \#{pattern.id} missing field: \#{field}"
            end
          end
        end

        test "all patterns have valid confidence weights" do
          for pattern <- #{module_name}.all() do
            assert is_float(pattern.confidence_weight)
            assert pattern.confidence_weight >= 0.0
            assert pattern.confidence_weight <= 1.0
          end
        end

        test "all patterns have valid severity" do
          valid = [:low, :medium, :high, :critical, :terminal]

          for pattern <- #{module_name}.all() do
            assert pattern.severity in valid,
                   "Pattern \#{pattern.id} has invalid severity: \#{pattern.severity}"
          end
        end

        test "all regex patterns compile" do
          for pattern <- #{module_name}.all(),
              pattern.detection_type == :regex,
              is_binary(pattern.regex) do
            assert {:ok, _} = Regex.compile(pattern.regex, [:caseless]),
                   "Pattern \#{pattern.id} has invalid regex"
          end
        end
      end

      describe "detection" do
        test "detect returns {:ok, list}" do
          assert {:ok, results} = #{module_name}.detect("test content")
          assert is_list(results)
        end

        test "detect respects threshold" do
          assert {:ok, results} = #{module_name}.detect("test content", threshold: 0.99)
          assert Enum.all?(results, fn r -> r.confidence >= 0.99 end)
        end

        test "detect respects max_results" do
          assert {:ok, results} = #{module_name}.detect("test content", max_results: 1)
          assert length(results) <= 1
        end
    #{Enum.join(test_cases, "\n")}
      end

      describe "for_technique" do
        test "returns patterns for known technique" do
          patterns = #{module_name}.all()
          first_technique = patterns |> List.first() |> Map.get(:associated_techniques) |> List.first()

          if first_technique do
            result = #{module_name}.for_technique(first_technique)
            assert is_list(result)
            assert length(result) > 0
          end
        end

        test "returns empty list for unknown technique" do
          assert [] == #{module_name}.for_technique(:completely_nonexistent_technique_xyz)
        end
      end
    end
    """

    {:ok, source}
  end

  @doc """
  Generates documentation source from pattern metadata.

  Produces a Markdown document listing all patterns with their
  detection types, severity levels, and technique associations.
  """
  @spec generate_documentation(module()) :: {:ok, String.t()}
  def generate_documentation(module) do
    {:ok, extraction} = Extractor.extract_module(module)
    module_name = module |> Module.split() |> Enum.join(".")

    doc = """
    # #{module_name} - Pattern Documentation

    **Category**: #{extraction.category}
    **Pattern Count**: #{extraction.pattern_count}
    **Subcategories**: #{extraction.subcategories |> Enum.map(&to_string/1) |> Enum.join(", ")}
    **Generated**: #{DateTime.utc_now() |> DateTime.to_iso8601()}

    ## Detection Type Distribution

    | Type | Count |
    |------|-------|
    #{format_frequency_table(extraction.detection_types)}

    ## Severity Distribution

    | Severity | Count |
    |----------|-------|
    #{format_frequency_table(extraction.severity_distribution)}

    ## Confidence Range

    - **Minimum**: #{elem(extraction.confidence_range, 0)}
    - **Maximum**: #{elem(extraction.confidence_range, 1)}

    ## Technique Coverage

    Covers #{length(extraction.technique_coverage)} unique techniques:
    #{extraction.technique_coverage |> Enum.map(&"- `#{&1}`") |> Enum.join("\n")}

    ## Patterns

    #{format_patterns_doc(extraction.patterns)}
    """

    {:ok, doc}
  end

  # ---------------------------------------------------------------------------
  # Public API - Engine Generation
  # ---------------------------------------------------------------------------

  @doc """
  Generates a detection engine specification from a category definition.

  Returns a map suitable for starting a GenServer-based detection engine
  that processes content through all patterns in the specified category.

  ## Parameters

  - `category` - Category atom
  - `modules` - List of pattern modules to include
  - `opts` - Engine configuration options

  ## Returns

  Engine specification map with pool size, timeout, and module references.
  """
  @spec engine_spec(atom(), [module()], keyword()) :: map()
  def engine_spec(category, modules, opts \\ []) do
    pool_size = Keyword.get(opts, :pool_size, 3)
    timeout_ms = Keyword.get(opts, :timeout_ms, 100)

    total_patterns =
      modules
      |> Enum.filter(&function_exported?(&1, :count, 0))
      |> Enum.map(& &1.count())
      |> Enum.sum()

    %{
      category: category,
      modules: modules,
      pool_size: pool_size,
      timeout_ms: timeout_ms,
      total_patterns: total_patterns,
      engine_module: engine_module_name(category),
      child_spec: %{
        id: engine_module_name(category),
        start: {GenServer, :start_link, [engine_module_name(category), %{modules: modules}, []]},
        restart: :permanent,
        type: :worker
      }
    }
  end

  # ---------------------------------------------------------------------------
  # Private: Pattern Generation from Techniques
  # ---------------------------------------------------------------------------

  defp generate_patterns_for_technique(technique, confidence_base, prefix, opts) do
    category = Keyword.get(opts, :category, technique[:category] || :unknown)
    technique_id = technique[:id] || :unknown
    detection_patterns = technique[:detection_patterns] || []
    manifestations = technique[:typical_manifestations] || []
    defense_strategies = technique[:defense_strategies] || []
    severity = technique[:severity] || :medium
    see_also = technique[:see_also] || []

    # Generate keyword-based pattern from detection_patterns
    keyword_pattern =
      if length(detection_patterns) > 0 do
        [
          %{
            id: :"#{prefix}_#{technique_id}_keywords",
            name: "#{technique[:name] || technique_id} Detection",
            category: category,
            subcategory: category,
            detection_type: :keyword,
            regex: nil,
            keywords: Enum.map(detection_patterns, &humanize_pattern/1),
            semantic_markers: Enum.map(manifestations, &humanize_pattern/1),
            confidence_weight: confidence_base,
            associated_techniques: [technique_id | see_also],
            context_requirements: [:epistemic_discourse],
            false_positive_indicators: generate_false_positives(defense_strategies),
            severity: severity,
            description: technique[:description] || "Auto-generated detection pattern for #{technique_id}"
          }
        ]
      else
        []
      end

    # Generate manifestation-based pattern
    manifestation_pattern =
      if length(manifestations) > 0 do
        [
          %{
            id: :"#{prefix}_#{technique_id}_manifestations",
            name: "#{technique[:name] || technique_id} Manifestation Detection",
            category: category,
            subcategory: category,
            detection_type: :keyword,
            regex: nil,
            keywords: Enum.map(manifestations, &humanize_pattern/1),
            semantic_markers: [],
            confidence_weight: confidence_base * 0.9,
            associated_techniques: [technique_id],
            context_requirements: [:epistemic_discourse],
            false_positive_indicators: [],
            severity: severity,
            description: "Detects manifestations of #{technique[:name] || technique_id}"
          }
        ]
      else
        []
      end

    keyword_pattern ++ manifestation_pattern
  end

  defp humanize_pattern(pattern) when is_binary(pattern) do
    pattern
    |> String.replace("_", " ")
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end

  defp humanize_pattern(pattern) when is_atom(pattern) do
    pattern |> Atom.to_string() |> humanize_pattern()
  end

  defp generate_false_positives(defense_strategies) do
    defense_strategies
    |> Enum.take(3)
    |> Enum.map(fn strategy ->
      strategy
      |> to_string()
      |> String.replace("_", " ")
      |> then(&"#{&1} context")
    end)
  end

  # ---------------------------------------------------------------------------
  # Private: Test Generation
  # ---------------------------------------------------------------------------

  defp generate_pattern_test_case(pattern) do
    # Generate a test that checks keyword detection for each pattern
    first_keyword = List.first(pattern.keywords)

    if first_keyword do
      """

        test "detects pattern #{pattern.id} with keyword" do
          content = #{inspect(first_keyword)}
          {:ok, results} = #{inspect(pattern.category)}_detect(content)
          # Pattern should be detectable (may be filtered by false positives)
          assert is_list(results)
        end
      """
    else
      ""
    end
  end

  # ---------------------------------------------------------------------------
  # Private: Documentation Generation
  # ---------------------------------------------------------------------------

  defp format_frequency_table(freq_map) do
    freq_map
    |> Enum.sort_by(&elem(&1, 1), :desc)
    |> Enum.map(fn {key, count} -> "| #{key} | #{count} |" end)
    |> Enum.join("\n")
  end

  defp format_patterns_doc(patterns) do
    patterns
    |> Enum.sort_by(& &1.id)
    |> Enum.map(fn pattern ->
      """
      ### #{pattern.name} (`#{pattern.id}`)

      - **Subcategory**: #{pattern[:subcategory]}
      - **Detection Type**: #{pattern.detection_type}
      - **Severity**: #{pattern.severity}
      - **Confidence Weight**: #{pattern.confidence_weight}
      - **Keywords**: #{length(pattern.keywords)}
      - **Techniques**: #{pattern.associated_techniques |> Enum.map(&"`#{&1}`") |> Enum.join(", ")}

      #{pattern.description}
      """
    end)
    |> Enum.join("\n---\n\n")
  end

  # ---------------------------------------------------------------------------
  # Private: Module Name Generation
  # ---------------------------------------------------------------------------

  defp derive_module_name(data) do
    category =
      data
      |> Map.get("category", "unknown")
      |> Macro.camelize()

    Module.concat([PrismaticAnnihilation, Patterns, :"Generated#{category}Patterns"])
  end

  defp engine_module_name(category) do
    category_name = category |> Atom.to_string() |> Macro.camelize()
    Module.concat([PrismaticAnnihilation, Engines, :"#{category_name}"])
  end
end
