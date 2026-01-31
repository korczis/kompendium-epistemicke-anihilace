defmodule Mix.Tasks.Compendium.Extract do
  @shortdoc "Extract all 178 epistemic annihilation techniques from Garden sources"

  @moduledoc """
  Runs the complete Compendium extraction pipeline.

  Extracts, transforms, and generates JSON data files for all 178
  epistemic annihilation techniques from Garden sources.

  ## Usage

      # Full pipeline (extract + transform + generate)
      mix compendium.extract

      # Extract only (print extraction results)
      mix compendium.extract --stage extract

      # Validate existing generated data
      mix compendium.extract --validate

      # Specify custom base path
      mix compendium.extract --base-path /path/to/project

      # Status check
      mix compendium.extract --status

  ## Options

  - `--stage` - Run specific stage: `extract`, `transform`, `generate`, or `all` (default: `all`)
  - `--validate` - Validate existing generated data
  - `--status` - Print pipeline status
  - `--base-path` - Override project root path
  - `--output-dir` - Override output directory
  - `--no-pretty` - Disable pretty-printing of JSON
  - `--no-reload` - Skip TaxonomyServer reload after generation

  ## Output

  Generated files are written to `apps/prismatic_annihilation/priv/data/`:

  - `taxonomy/` - 178 individual technique JSON files
  - `patterns/` - Detection patterns by category
  - `relationships/` - Cross-reference and category graphs
  - `schemas/` - JSON Schema validation files
  - `technique_index.json` - Master index
  - `translations_cs_en.json` - Czech-English translation map
  """

  use Mix.Task

  alias PrismaticAnnihilation.Compendium.Pipeline

  @impl Mix.Task
  def run(args) do
    {opts, _, _} =
      OptionParser.parse(args,
        switches: [
          stage: :string,
          validate: :boolean,
          status: :boolean,
          base_path: :string,
          output_dir: :string,
          no_pretty: :boolean,
          no_reload: :boolean
        ],
        aliases: [
          s: :stage,
          v: :validate,
          b: :base_path,
          o: :output_dir
        ]
      )

    Mix.Task.run("app.start")

    cond do
      Keyword.get(opts, :status) ->
        run_status()

      Keyword.get(opts, :validate) ->
        run_validate(opts)

      true ->
        stage = Keyword.get(opts, :stage, "all")
        run_stage(stage, opts)
    end
  end

  defp run_status do
    status = Pipeline.status()
    Mix.shell().info(status)
  end

  defp run_validate(opts) do
    pipeline_opts = build_pipeline_opts(opts)

    case Pipeline.validate(pipeline_opts) do
      {:ok, result} ->
        Mix.shell().info("Validation Results:")
        Mix.shell().info("  Index valid: #{result.index_valid}")
        Mix.shell().info("  Total techniques: #{result.total_techniques_in_index}")
        Mix.shell().info("  Taxonomy files: #{result.taxonomy_files_count}")
        Mix.shell().info("  Files match index: #{result.files_match_index}")
        Mix.shell().info("  Schemas present: #{result.schemas_present}")
        Mix.shell().info("  Patterns present: #{result.patterns_present}")
        Mix.shell().info("  Relationships present: #{result.relationships_present}")

        if Map.get(result, :message) do
          Mix.shell().info("\n  #{result.message}")
        end

      {:error, reason} ->
        Mix.shell().error("Validation failed: #{inspect(reason)}")
    end
  end

  defp run_stage("all", opts) do
    pipeline_opts = build_pipeline_opts(opts)

    Mix.shell().info("Running complete Compendium extraction pipeline...")

    case Pipeline.run(pipeline_opts) do
      {:ok, result} ->
        Mix.shell().info("\nPipeline complete!")
        Mix.shell().info("  Techniques extracted: #{result.extraction.total_count}")

        Mix.shell().info(
          "  Techniques transformed: #{result.transformation.statistics.total_techniques}"
        )

        Mix.shell().info("  Files generated: #{result.generation.files_written}")
        Mix.shell().info("  Duration: #{result.pipeline_duration_ms}ms")
        Mix.shell().info("  Warnings: #{length(result.extraction.warnings)}")

        if length(result.extraction.warnings) > 0 do
          Mix.shell().info("\nWarnings:")

          Enum.each(result.extraction.warnings, fn w ->
            Mix.shell().info("  - #{w}")
          end)
        end

        print_statistics(result.transformation.statistics)

      {:error, reason} ->
        Mix.shell().error("Pipeline failed: #{inspect(reason)}")
    end
  end

  defp run_stage("extract", opts) do
    pipeline_opts = build_pipeline_opts(opts)

    Mix.shell().info("Running extraction stage...")

    case Pipeline.extract(pipeline_opts) do
      {:ok, result} ->
        Mix.shell().info("\nExtraction complete!")
        Mix.shell().info("  Total techniques: #{result.total_count}")
        Mix.shell().info("  Sources: #{Enum.join(result.sources_parsed, ", ")}")
        Mix.shell().info("  Warnings: #{length(result.warnings)}")

        if length(result.warnings) > 0 do
          Mix.shell().info("\nWarnings:")

          Enum.each(result.warnings, fn w ->
            Mix.shell().info("  - #{w}")
          end)
        end

      {:error, reason} ->
        Mix.shell().error("Extraction failed: #{inspect(reason)}")
    end
  end

  defp run_stage("transform", opts) do
    pipeline_opts = build_pipeline_opts(opts)

    Mix.shell().info("Running extract + transform stages...")

    with {:ok, extracted} <- Pipeline.extract(pipeline_opts),
         {:ok, transformed} <- Pipeline.transform(extracted, pipeline_opts) do
      Mix.shell().info("\nTransformation complete!")
      print_statistics(transformed.statistics)
    else
      {:error, reason} ->
        Mix.shell().error("Transform failed: #{inspect(reason)}")
    end
  end

  defp run_stage("generate", opts) do
    pipeline_opts = build_pipeline_opts(opts)

    Mix.shell().info("Running full pipeline with generation...")

    with {:ok, extracted} <- Pipeline.extract(pipeline_opts),
         {:ok, transformed} <- Pipeline.transform(extracted, pipeline_opts),
         {:ok, generated} <- Pipeline.generate(transformed, pipeline_opts) do
      Mix.shell().info("\nGeneration complete!")
      Mix.shell().info("  Files written: #{generated.files_written}")
      Mix.shell().info("  Taxonomy files: #{length(generated.taxonomy_files)}")
      Mix.shell().info("  Pattern files: #{length(generated.pattern_files)}")
      Mix.shell().info("  Relationship files: #{length(generated.relationship_files)}")
      Mix.shell().info("  Schema files: #{length(generated.schema_files)}")
    else
      {:error, reason} ->
        Mix.shell().error("Generation failed: #{inspect(reason)}")
    end
  end

  defp run_stage(unknown, _opts) do
    Mix.shell().error("Unknown stage: #{unknown}")
    Mix.shell().info("Valid stages: all, extract, transform, generate")
  end

  defp build_pipeline_opts(opts) do
    pipeline_opts = []

    pipeline_opts =
      case Keyword.get(opts, :base_path) do
        nil -> pipeline_opts
        path -> [{:base_path, path} | pipeline_opts]
      end

    pipeline_opts =
      case Keyword.get(opts, :output_dir) do
        nil -> pipeline_opts
        dir -> [{:output_dir, dir} | pipeline_opts]
      end

    pipeline_opts =
      if Keyword.get(opts, :no_pretty) do
        [{:pretty, false} | pipeline_opts]
      else
        pipeline_opts
      end

    pipeline_opts =
      if Keyword.get(opts, :no_reload) do
        [{:reload_taxonomy, false} | pipeline_opts]
      else
        pipeline_opts
      end

    pipeline_opts
  end

  defp print_statistics(stats) do
    Mix.shell().info("\nStatistics:")
    Mix.shell().info("  Total techniques: #{stats.total_techniques}")
    Mix.shell().info("  With descriptions: #{stats.with_descriptions}")
    Mix.shell().info("  With examples: #{stats.with_examples}")
    Mix.shell().info("  With cross-references: #{stats.with_cross_references}")
    Mix.shell().info("  Average severity score: #{Float.round(stats.average_severity_score, 3)}")

    Mix.shell().info(
      "  Average reversibility score: #{Float.round(stats.average_reversibility_score, 3)}"
    )

    Mix.shell().info("\n  By Category:")

    stats.by_category
    |> Enum.sort_by(fn {_cat, count} -> count end, :desc)
    |> Enum.each(fn {cat, count} ->
      Mix.shell().info("    #{cat}: #{count}")
    end)

    Mix.shell().info("\n  By Severity:")

    stats.by_severity
    |> Enum.sort_by(fn {_sev, count} -> count end, :desc)
    |> Enum.each(fn {sev, count} ->
      Mix.shell().info("    #{sev}: #{count}")
    end)
  end
end
