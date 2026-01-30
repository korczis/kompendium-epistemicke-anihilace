defmodule PrismaticAnnihilation.Compendium.ExtractorTest do
  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.Extractor

  @project_root Path.expand("../../../../", __DIR__)

  describe "extract_all/1" do
    test "extracts techniques from all Garden sources" do
      {:ok, result} = Extractor.extract_all(base_path: @project_root)

      assert result.total_count > 0
      assert is_list(result.techniques)
      assert is_list(result.sources_parsed)
      assert is_list(result.warnings)
      assert %DateTime{} = result.extraction_timestamp
    end

    test "returns techniques with required fields" do
      {:ok, result} = Extractor.extract_all(base_path: @project_root)

      Enum.each(result.techniques, fn technique ->
        assert is_binary(technique.name_cs)
        assert technique.name_cs != ""
        assert technique.source in [:primary, :index, :archive]
        assert is_list(technique.cross_references)
      end)
    end

    test "deduplicates techniques across sources" do
      {:ok, result} = Extractor.extract_all(base_path: @project_root)

      names =
        result.techniques
        |> Enum.map(& &1.name_cs)
        |> Enum.map(&String.downcase/1)

      # After merging, each name should appear at most once
      unique_names = Enum.uniq(names)
      assert length(unique_names) == length(names)
    end
  end

  describe "extract_primary/1" do
    test "extracts techniques from detailed dictionary" do
      {:ok, techniques, _warnings} = Extractor.extract_primary(@project_root)

      assert length(techniques) > 0

      # Primary source should have metadata tables
      with_metadata =
        Enum.filter(techniques, fn t ->
          not is_nil(t.kategorie) or not is_nil(t.uroven_zavaznosti)
        end)

      assert length(with_metadata) > 0
    end

    test "extracts metadata fields from Czech tables" do
      {:ok, techniques, _warnings} = Extractor.extract_primary(@project_root)

      # Find a technique that has full metadata
      with_full_metadata =
        Enum.find(techniques, fn t ->
          not is_nil(t.kategorie) and not is_nil(t.uroven_zavaznosti)
        end)

      if with_full_metadata do
        assert is_binary(with_full_metadata.kategorie)
        assert is_binary(with_full_metadata.uroven_zavaznosti)
      end
    end

    test "extracts cross-references" do
      {:ok, techniques, _warnings} = Extractor.extract_primary(@project_root)

      with_refs = Enum.filter(techniques, fn t -> length(t.cross_references) > 0 end)
      assert length(with_refs) > 0
    end
  end

  describe "extract_index/1" do
    test "extracts techniques from thematic index" do
      {:ok, techniques, _warnings} = Extractor.extract_index(@project_root)

      # The thematic index should have 100+ entries
      assert length(techniques) >= 100
    end

    test "assigns thematic categories" do
      {:ok, techniques, _warnings} = Extractor.extract_index(@project_root)

      with_categories =
        Enum.filter(techniques, fn t ->
          not is_nil(t.thematic_category)
        end)

      assert length(with_categories) > 0
    end

    test "extracts page numbers" do
      {:ok, techniques, _warnings} = Extractor.extract_index(@project_root)

      with_pages =
        Enum.filter(techniques, fn t ->
          not is_nil(t.page_number)
        end)

      assert length(with_pages) > 0

      Enum.each(with_pages, fn t ->
        assert is_integer(t.page_number)
        assert t.page_number > 0
      end)
    end
  end

  describe "extract_archive/1" do
    test "extracts techniques from archive markdown files" do
      {:ok, techniques, _warnings} = Extractor.extract_archive(@project_root)

      # Archive has 36 markdown files (excluding _index.md and .prompt.md)
      assert length(techniques) > 30
    end

    test "extracts Zola front matter" do
      {:ok, techniques, _warnings} = Extractor.extract_archive(@project_root)

      # Archive files should have names extracted from front matter
      Enum.each(techniques, fn t ->
        assert is_binary(t.name_cs)
        assert t.name_cs != ""
        assert t.source == :archive
      end)
    end
  end

  describe "slugify/1" do
    test "converts Czech text to URL-safe slug" do
      assert Extractor.slugify("Absolutni epistemicka imploze") ==
               "absolutni-epistemicka-imploze"
    end

    test "handles diacritics" do
      assert Extractor.slugify("Epistemicka anihilace") ==
               "epistemicka-anihilace"
    end

    test "handles special characters" do
      assert Extractor.slugify("Anti-architektonika") ==
               "anti-architektonika"
    end
  end
end
