defmodule PrismaticAnnihilation.Compendium.PipelineTest do
  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.Compendium.Pipeline

  @project_root Path.expand("../../../../", __DIR__)

  describe "run/1" do
    @tag timeout: 60_000
    test "runs complete pipeline end-to-end" do
      # Use a temporary output directory to avoid polluting priv/data
      tmp_dir = Path.join(System.tmp_dir!(), "compendium_test_#{System.unique_integer([:positive])}")
      File.mkdir_p!(tmp_dir)

      on_exit(fn -> File.rm_rf!(tmp_dir) end)

      {:ok, result} =
        Pipeline.run(
          base_path: @project_root,
          output_dir: tmp_dir,
          reload_taxonomy: false,
          pretty: true
        )

      # Verify extraction
      assert result.extraction.total_count > 0
      assert is_list(result.extraction.techniques)

      # Verify transformation
      assert result.transformation.statistics.total_techniques > 0
      assert map_size(result.transformation.categories) > 0

      # Verify generation
      assert result.generation.files_written > 0
      assert length(result.generation.taxonomy_files) > 0
      assert length(result.generation.pattern_files) > 0
      assert length(result.generation.relationship_files) >= 3
      assert length(result.generation.schema_files) >= 4

      # Verify pipeline metadata
      assert result.pipeline_duration_ms > 0
      assert %DateTime{} = result.pipeline_timestamp

      # Verify files on disk
      assert File.exists?(Path.join(tmp_dir, "technique_index.json"))
      assert File.exists?(Path.join(tmp_dir, "translations_cs_en.json"))

      # Verify taxonomy directory has files
      taxonomy_files = File.ls!(Path.join(tmp_dir, "taxonomy"))
      assert length(taxonomy_files) > 0

      # Verify schema files exist
      schema_files = File.ls!(Path.join(tmp_dir, "schemas"))
      assert length(schema_files) >= 4

      # Verify master index is valid JSON
      {:ok, index_content} = File.read(Path.join(tmp_dir, "technique_index.json"))
      {:ok, index} = Jason.decode(index_content)
      assert Map.get(index, "total_techniques") > 0
      assert is_list(Map.get(index, "techniques"))
    end
  end

  describe "extract/1" do
    test "runs extraction stage" do
      {:ok, result} = Pipeline.extract(base_path: @project_root)

      assert result.total_count > 0
      assert length(result.sources_parsed) > 0
    end
  end

  describe "validate/1" do
    test "validates non-existent data" do
      tmp_dir = Path.join(System.tmp_dir!(), "compendium_validate_#{System.unique_integer([:positive])}")
      File.mkdir_p!(tmp_dir)

      on_exit(fn -> File.rm_rf!(tmp_dir) end)

      {:ok, result} = Pipeline.validate(output_dir: tmp_dir)

      assert result.index_valid == false
      assert result.total_techniques_in_index == 0
    end
  end

  describe "status/0" do
    test "returns status string" do
      status = Pipeline.status()
      assert is_binary(status)
      assert String.contains?(status, "Pipeline")
    end
  end
end
