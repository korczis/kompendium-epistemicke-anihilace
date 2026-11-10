defmodule PrismaticAnnihilation.Compendium.Pipeline do
  @moduledoc """
  End-to-end pipeline orchestrator for extracting, transforming, and loading
  all 178 epistemic annihilation techniques from Garden sources.

  Coordinates the full ETL process:
  1. **Extract** - Parse Czech markdown from Garden gists and archive
  2. **Transform** - Normalize, translate, categorize, score
  3. **Generate** - Write JSON files, schemas, relationship graphs
  4. **Load** - Hot-reload Taxonomy GenServer with new data

  ## Usage

      # Run full pipeline
      {:ok, result} = Pipeline.run()

      # Run with options
      {:ok, result} = Pipeline.run(base_path: "/path/to/project", pretty: true)

      # Run individual stages
      {:ok, extracted} = Pipeline.extract(base_path: "/path/to/project")
      {:ok, transformed} = Pipeline.transform(extracted)
      {:ok, generated} = Pipeline.generate(transformed)

  ## Mix Task Integration

  This module backs the `mix compendium.extract` mix task:

      mix compendium.extract              # Full pipeline
      mix compendium.extract --stage extract  # Extract only
      mix compendium.extract --stage transform # Transform only
      mix compendium.extract --validate    # Validate existing data
  """

  alias PrismaticAnnihilation.Compendium.{Extractor, Transformer, Generator}
  alias PrismaticAnnihilation.Compendium.TaxonomyServer

  require Logger

  @type pipeline_result :: %{
          extraction: Extractor.extraction_result(),
          transformation: Transformer.transform_result(),
          generation: Generator.generation_result(),
          pipeline_duration_ms: non_neg_integer(),
          pipeline_timestamp: DateTime.t()
        }

  @doc """
  Runs the complete extraction pipeline end-to-end.

  ## Options
  - `:base_path` - Project root path (default: auto-detect)
  - `:output_dir` - Output directory for generated files (default: priv/data)
  - `:pretty` - Pretty-print JSON output (default: true)
  - `:sources` - Garden sources to extract from (default: [:primary, :index, :archive])
  - `:reload_taxonomy` - Reload Taxonomy GenServer after generation (default: true)
  - `:include_descriptions` - Include full descriptions in output (default: true)
  - `:include_examples` - Include examples in output (default: true)
  """
  @spec run(keyword()) :: {:ok, pipeline_result()} | {:error, term()}
  def run(opts \\ []) do
    start_time = System.monotonic_time(:millisecond)

    Logger.info("[Compendium.Pipeline] Starting full extraction pipeline")

    with {:ok, extraction} <- extract(opts),
         {:ok, transformation} <- transform(extraction, opts),
         {:ok, generation} <- generate(transformation, opts) do
      if Keyword.get(opts, :reload_taxonomy, true) do
        reload_taxonomy()
      end

      duration = System.monotonic_time(:millisecond) - start_time

      result = %{
        extraction: extraction,
        transformation: transformation,
        generation: generation,
        pipeline_duration_ms: duration,
        pipeline_timestamp: DateTime.utc_now()
      }

      Logger.info(
        "[Compendium.Pipeline] Pipeline complete: #{transformation.statistics.total_techniques} techniques, " <>
          "#{generation.files_written} files, #{duration}ms"
      )

      {:ok, result}
    end
  end

  @doc """
  Runs the extraction stage only.
  """
  @spec extract(keyword()) :: {:ok, Extractor.extraction_result()} | {:error, term()}
  def extract(opts \\ []) do
    base_path = Keyword.get(opts, :base_path)
    sources = Keyword.get(opts, :sources, [:primary, :index, :archive])

    extract_opts =
      [sources: sources]
      |> then(fn o -> if base_path, do: [{:base_path, base_path} | o], else: o end)

    Extractor.extract_all(extract_opts)
  end

  @doc """
  Runs the transformation stage on extracted data.
  """
  @spec transform(Extractor.extraction_result(), keyword()) ::
          {:ok, Transformer.transform_result()} | {:error, term()}
  def transform(extraction_result, opts \\ []) do
    include_descriptions = Keyword.get(opts, :include_descriptions, true)
    include_examples = Keyword.get(opts, :include_examples, true)

    Transformer.transform(extraction_result,
      include_descriptions: include_descriptions,
      include_examples: include_examples
    )
  end

  @doc """
  Runs the generation stage on transformed data.
  """
  @spec generate(Transformer.transform_result(), keyword()) ::
          {:ok, Generator.generation_result()} | {:error, term()}
  def generate(transform_result, opts \\ []) do
    output_dir = Keyword.get(opts, :output_dir)
    pretty = Keyword.get(opts, :pretty, true)

    generate_opts =
      [pretty: pretty]
      |> then(fn o -> if output_dir, do: [{:output_dir, output_dir} | o], else: o end)

    Generator.generate_all(transform_result, generate_opts)
  end

  @doc """
  Validates existing generated data against schemas.
  """
  @spec validate(keyword()) :: {:ok, map()} | {:error, term()}
  def validate(opts \\ []) do
    output_dir =
      Keyword.get(
        opts,
        :output_dir,
        Path.join(:code.priv_dir(:prismatic_annihilation), "data")
      )

    Logger.info("[Compendium.Pipeline] Validating data in #{output_dir}")

    index_path = Path.join(output_dir, "technique_index.json")

    case File.read(index_path) do
      {:ok, content} ->
        case Jason.decode(content) do
          {:ok, index} ->
            total = Map.get(index, "total_techniques", 0)

            taxonomy_dir = Path.join(output_dir, "taxonomy")

            taxonomy_files =
              case File.ls(taxonomy_dir) do
                {:ok, files} -> Enum.filter(files, &String.ends_with?(&1, ".json"))
                _ -> []
              end

            validation_result = %{
              index_valid: true,
              total_techniques_in_index: total,
              taxonomy_files_count: length(taxonomy_files),
              files_match_index: length(taxonomy_files) == total,
              schemas_present: check_schemas(output_dir),
              patterns_present: check_patterns(output_dir),
              relationships_present: check_relationships(output_dir)
            }

            {:ok, validation_result}

          {:error, reason} ->
            {:error, {:invalid_index, reason}}
        end

      {:error, :enoent} ->
        {:ok,
         %{
           index_valid: false,
           total_techniques_in_index: 0,
           taxonomy_files_count: 0,
           files_match_index: false,
           schemas_present: false,
           patterns_present: false,
           relationships_present: false,
           message: "No generated data found. Run Pipeline.run() first."
         }}

      {:error, reason} ->
        {:error, {:file_read_failed, reason}}
    end
  end

  @doc """
  Returns a human-readable summary of the pipeline state.
  """
  @spec status() :: String.t()
  def status do
    case validate() do
      {:ok, result} ->
        """
        Compendium Pipeline Status
        --------------------------
        Index valid: #{result.index_valid}
        Total techniques: #{result.total_techniques_in_index}
        Taxonomy files: #{result.taxonomy_files_count}
        Files match index: #{result.files_match_index}
        Schemas present: #{result.schemas_present}
        Patterns present: #{result.patterns_present}
        Relationships present: #{result.relationships_present}
        """
        |> String.trim()

      {:error, reason} ->
        "Pipeline status check failed: #{inspect(reason)}"
    end
  end

  # --- Private Functions ---

  defp reload_taxonomy do
    case Process.whereis(TaxonomyServer) do
      nil ->
        Logger.info("[Compendium.Pipeline] TaxonomyServer not running, skip reload")
        :ok

      _pid ->
        TaxonomyServer.reload()
    end
  end

  defp check_schemas(output_dir) do
    schemas_dir = Path.join(output_dir, "schemas")

    case File.ls(schemas_dir) do
      {:ok, files} ->
        schema_files = Enum.filter(files, &String.ends_with?(&1, ".schema.json"))
        length(schema_files) >= 4

      _ ->
        false
    end
  end

  defp check_patterns(output_dir) do
    patterns_dir = Path.join(output_dir, "patterns")

    case File.ls(patterns_dir) do
      {:ok, files} -> files != []
      _ -> false
    end
  end

  defp check_relationships(output_dir) do
    rel_dir = Path.join(output_dir, "relationships")

    case File.ls(rel_dir) do
      {:ok, files} -> length(files) >= 3
      _ -> false
    end
  end
end
