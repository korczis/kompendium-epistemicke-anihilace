defmodule PrismaticAnnihilation.Patterns.Extractor do
  @moduledoc """
  Pattern Extraction Engine for the Annihilation Detection System.

  Extracts reusable pattern structures from existing detection modules,
  producing portable pattern definitions that can be serialized, transformed,
  analyzed, and used to generate new detection modules.

  ## Capabilities

  1. **Module Extraction** - Extract all patterns from a compiled module
  2. **Cross-Module Analysis** - Find shared patterns, overlaps, and gaps
  3. **Statistical Analysis** - Category distribution, confidence profiles
  4. **Structure Analysis** - Common fields, detection types, technique coverage
  5. **Export** - Serialize extracted patterns to JSON for external consumption

  ## Usage

      # Extract from a single module
      {:ok, extraction} = Extractor.extract_module(GravitationalPatterns)

      # Extract from all registered modules
      {:ok, full} = Extractor.extract_all()

      # Analyze cross-module patterns
      {:ok, analysis} = Extractor.analyze_overlaps()

      # Export to JSON
      json = Extractor.export_json()

  """

  alias PrismaticAnnihilation.Patterns.{
    CollapsePatterns,
    GravitationalPatterns,
    InfectionPatterns,
    MetaProgramming,
    ParadoxPatterns,
    PatternCompiler
  }

  @registered_modules [
    GravitationalPatterns,
    InfectionPatterns,
    ParadoxPatterns,
    CollapsePatterns
  ]

  # ---------------------------------------------------------------------------
  # Types
  # ---------------------------------------------------------------------------

  @type extraction :: %{
          module: module(),
          category: atom(),
          pattern_count: non_neg_integer(),
          patterns: [map()],
          subcategories: [atom()],
          detection_types: %{atom() => non_neg_integer()},
          severity_distribution: %{atom() => non_neg_integer()},
          confidence_range: {float(), float()},
          technique_coverage: [atom()],
          extracted_at: DateTime.t()
        }

  @type full_extraction :: %{
          modules: [extraction()],
          total_patterns: non_neg_integer(),
          total_techniques: non_neg_integer(),
          categories: [atom()],
          cross_references: map(),
          extracted_at: DateTime.t()
        }

  # ---------------------------------------------------------------------------
  # Public API - Module Extraction
  # ---------------------------------------------------------------------------

  @doc """
  Extracts all pattern data from a single module.

  Returns structured extraction with metadata about the patterns,
  their distribution, and coverage characteristics.
  """
  @spec extract_module(module()) :: {:ok, extraction()} | {:error, term()}
  def extract_module(module) do
    if function_exported?(module, :all, 0) and
         function_exported?(module, :category, 0) do
      patterns = module.all()
      category = module.category()

      extraction = %{
        module: module,
        category: category,
        pattern_count: length(patterns),
        patterns: patterns,
        subcategories: extract_subcategories(patterns),
        detection_types: patterns |> Enum.map(& &1.detection_type) |> Enum.frequencies(),
        severity_distribution: patterns |> Enum.map(& &1.severity) |> Enum.frequencies(),
        confidence_range: confidence_range(patterns),
        technique_coverage: extract_technique_coverage(patterns),
        extracted_at: DateTime.utc_now()
      }

      {:ok, extraction}
    else
      {:error, {:invalid_module, module, "must implement all/0 and category/0"}}
    end
  end

  @doc """
  Extracts patterns from all registered modules.

  Returns comprehensive extraction with cross-module analysis.
  """
  @spec extract_all() :: {:ok, full_extraction()}
  def extract_all do
    extractions =
      @registered_modules
      |> Enum.map(fn module ->
        case extract_module(module) do
          {:ok, extraction} -> extraction
          {:error, _} -> nil
        end
      end)
      |> Enum.reject(&is_nil/1)

    all_patterns = Enum.flat_map(extractions, & &1.patterns)
    all_techniques = all_patterns |> Enum.flat_map(& &1.associated_techniques) |> Enum.uniq()

    {:ok,
     %{
       modules: extractions,
       total_patterns: length(all_patterns),
       total_techniques: length(all_techniques),
       categories: Enum.map(extractions, & &1.category),
       cross_references: build_cross_references(all_patterns),
       extracted_at: DateTime.utc_now()
     }}
  end

  # ---------------------------------------------------------------------------
  # Public API - Analysis
  # ---------------------------------------------------------------------------

  @doc """
  Analyzes pattern overlaps across modules.

  Identifies techniques that are covered by multiple modules
  and patterns that share similar keyword sets.
  """
  @spec analyze_overlaps() :: {:ok, map()}
  def analyze_overlaps do
    {:ok, full} = extract_all()
    all_patterns = Enum.flat_map(full.modules, & &1.patterns)

    # Techniques covered by multiple categories
    technique_coverage =
      all_patterns
      |> Enum.flat_map(fn pattern ->
        Enum.map(pattern.associated_techniques, fn tech ->
          {tech, pattern.category}
        end)
      end)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_tech, categories} -> length(Enum.uniq(categories)) > 1 end)
      |> Map.new(fn {tech, categories} -> {tech, Enum.uniq(categories)} end)

    # Keyword overlap analysis
    keyword_overlap = analyze_keyword_overlaps(all_patterns)

    # Gap analysis - techniques without pattern coverage
    all_techniques =
      all_patterns
      |> Enum.flat_map(& &1.associated_techniques)
      |> Enum.uniq()

    {:ok,
     %{
       multi_category_techniques: technique_coverage,
       keyword_overlaps: keyword_overlap,
       total_unique_techniques: length(all_techniques),
       coverage_by_category:
         Enum.map(full.modules, fn ext ->
           {ext.category, length(ext.technique_coverage)}
         end)
         |> Map.new(),
       analyzed_at: DateTime.utc_now()
     }}
  end

  @doc """
  Extracts the common structure shared by all patterns.

  Returns the set of fields present in every pattern, their types,
  and value ranges. Useful for schema validation and code generation.
  """
  @spec extract_common_structure() :: {:ok, map()}
  def extract_common_structure do
    {:ok, full} = extract_all()
    all_patterns = Enum.flat_map(full.modules, & &1.patterns)

    if Enum.empty?(all_patterns) do
      {:ok, %{fields: %{}, pattern_count: 0}}
    else
      # Find fields present in all patterns
      field_sets =
        Enum.map(all_patterns, fn pattern ->
          pattern |> Map.keys() |> MapSet.new()
        end)

      universal_fields =
        Enum.reduce(field_sets, List.first(field_sets), &MapSet.intersection/2)

      # Analyze each universal field
      field_analysis =
        universal_fields
        |> Enum.map(fn field ->
          values = Enum.map(all_patterns, &Map.get(&1, field))
          {field, analyze_field_values(values)}
        end)
        |> Map.new()

      {:ok,
       %{
         fields: field_analysis,
         universal_field_count: MapSet.size(universal_fields),
         pattern_count: length(all_patterns),
         all_fields: field_sets |> Enum.reduce(&MapSet.union/2) |> MapSet.to_list()
       }}
    end
  end

  @doc """
  Generates a coverage report showing which techniques have
  detection patterns and which are uncovered.
  """
  @spec coverage_report() :: {:ok, map()}
  def coverage_report do
    {:ok, full} = extract_all()
    all_patterns = Enum.flat_map(full.modules, & &1.patterns)

    covered_techniques =
      all_patterns
      |> Enum.flat_map(& &1.associated_techniques)
      |> Enum.uniq()
      |> MapSet.new()

    patterns_per_technique =
      all_patterns
      |> Enum.flat_map(fn pattern ->
        Enum.map(pattern.associated_techniques, &{&1, pattern.id})
      end)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))

    {:ok,
     %{
       total_covered_techniques: MapSet.size(covered_techniques),
       patterns_per_technique: Map.new(patterns_per_technique, fn {k, v} -> {k, length(v)} end),
       well_covered: Enum.filter(patterns_per_technique, fn {_, pats} -> length(pats) >= 3 end) |> length(),
       under_covered: Enum.filter(patterns_per_technique, fn {_, pats} -> length(pats) == 1 end) |> length(),
       avg_patterns_per_technique:
         if map_size(patterns_per_technique) > 0 do
           patterns_per_technique
           |> Map.values()
           |> Enum.map(&length/1)
           |> Enum.sum()
           |> Kernel./(map_size(patterns_per_technique))
           |> Float.round(2)
         else
           0.0
         end,
       total_patterns: full.total_patterns,
       by_category:
         Enum.map(full.modules, fn ext ->
           {ext.category, %{patterns: ext.pattern_count, techniques: length(ext.technique_coverage)}}
         end)
         |> Map.new()
     }}
  end

  # ---------------------------------------------------------------------------
  # Public API - Export
  # ---------------------------------------------------------------------------

  @doc """
  Exports all patterns from all modules to a JSON-serializable structure.
  """
  @spec export_all() :: map()
  def export_all do
    @registered_modules
    |> Enum.map(fn module ->
      {to_string(module.category()), MetaProgramming.export_module(module)}
    end)
    |> Map.new()
    |> Map.put("exported_at", DateTime.utc_now() |> DateTime.to_iso8601())
    |> Map.put("module_count", length(@registered_modules))
    |> Map.put("total_patterns", PatternCompiler.total_count())
  end

  @doc """
  Exports patterns as JSON string.
  """
  @spec export_json() :: {:ok, String.t()} | {:error, term()}
  def export_json do
    data = export_all()

    case Jason.encode(data, pretty: true) do
      {:ok, json} -> {:ok, json}
      {:error, reason} -> {:error, {:json_encode_failed, reason}}
    end
  end

  @doc """
  Returns the list of registered pattern modules.
  """
  @spec registered_modules() :: [module()]
  def registered_modules, do: @registered_modules

  # ---------------------------------------------------------------------------
  # Private: Extraction Helpers
  # ---------------------------------------------------------------------------

  defp extract_subcategories(patterns) do
    patterns
    |> Enum.map(& &1[:subcategory])
    |> Enum.reject(&is_nil/1)
    |> Enum.uniq()
    |> Enum.sort()
  end

  defp confidence_range([]), do: {0.0, 0.0}

  defp confidence_range(patterns) do
    weights = Enum.map(patterns, & &1.confidence_weight)
    {Enum.min(weights), Enum.max(weights)}
  end

  defp extract_technique_coverage(patterns) do
    patterns
    |> Enum.flat_map(& &1.associated_techniques)
    |> Enum.uniq()
    |> Enum.sort()
  end

  defp build_cross_references(patterns) do
    patterns
    |> Enum.flat_map(fn pattern ->
      for tech <- pattern.associated_techniques do
        {tech, %{pattern_id: pattern.id, category: pattern.category}}
      end
    end)
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
  end

  defp analyze_keyword_overlaps(patterns) do
    # Build keyword -> pattern_id index
    keyword_index =
      patterns
      |> Enum.flat_map(fn pattern ->
        Enum.map(pattern.keywords, fn kw ->
          {String.downcase(kw), %{pattern_id: pattern.id, category: pattern.category}}
        end)
      end)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))

    # Find keywords shared across categories
    keyword_index
    |> Enum.filter(fn {_kw, refs} ->
      refs |> Enum.map(& &1.category) |> Enum.uniq() |> length() > 1
    end)
    |> Enum.map(fn {kw, refs} ->
      {kw, Enum.map(refs, & &1.pattern_id)}
    end)
    |> Map.new()
  end

  defp analyze_field_values(values) do
    types = values |> Enum.map(&type_of/1) |> Enum.uniq()

    %{
      types: types,
      unique_count: values |> Enum.uniq() |> length(),
      total_count: length(values),
      nullable: Enum.any?(values, &is_nil/1)
    }
  end

  defp type_of(nil), do: :nil
  defp type_of(v) when is_atom(v), do: :atom
  defp type_of(v) when is_binary(v), do: :string
  defp type_of(v) when is_integer(v), do: :integer
  defp type_of(v) when is_float(v), do: :float
  defp type_of(v) when is_list(v), do: :list
  defp type_of(v) when is_map(v), do: :map
  defp type_of(_), do: :other
end
