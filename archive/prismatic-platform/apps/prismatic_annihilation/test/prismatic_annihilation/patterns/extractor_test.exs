defmodule PrismaticAnnihilation.Patterns.ExtractorTest do
  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Patterns.Extractor

  alias PrismaticAnnihilation.Patterns.{
    CollapsePatterns,
    GravitationalPatterns,
    InfectionPatterns,
    ParadoxPatterns
  }

  # ---------------------------------------------------------------------------
  # Module Extraction
  # ---------------------------------------------------------------------------

  describe "extract_module/1" do
    test "extracts gravitational patterns module" do
      assert {:ok, extraction} = Extractor.extract_module(GravitationalPatterns)
      assert extraction.category == :gravitational
      assert extraction.pattern_count > 0
      assert is_list(extraction.patterns)
      assert length(extraction.patterns) == extraction.pattern_count
      assert is_list(extraction.subcategories)
      assert is_map(extraction.detection_types)
      assert is_map(extraction.severity_distribution)
      assert is_tuple(extraction.confidence_range)
      assert is_list(extraction.technique_coverage)
    end

    test "extracts collapse patterns module" do
      assert {:ok, extraction} = Extractor.extract_module(CollapsePatterns)
      assert extraction.category == :collapse
      assert extraction.pattern_count > 0
    end

    test "extracts infection patterns module" do
      assert {:ok, extraction} = Extractor.extract_module(InfectionPatterns)
      assert extraction.category == :infection
      assert extraction.pattern_count > 0
    end

    test "extracts paradox patterns module" do
      assert {:ok, extraction} = Extractor.extract_module(ParadoxPatterns)
      assert extraction.category == :paradox
      assert extraction.pattern_count > 0
    end

    test "returns error for invalid module" do
      assert {:error, {:invalid_module, _, _}} = Extractor.extract_module(String)
    end

    test "extraction contains valid subcategories" do
      {:ok, extraction} = Extractor.extract_module(GravitationalPatterns)
      assert :horizon in extraction.subcategories
      assert :compression in extraction.subcategories
      assert :singularity in extraction.subcategories
    end

    test "extraction has valid confidence range" do
      {:ok, extraction} = Extractor.extract_module(GravitationalPatterns)
      {min_conf, max_conf} = extraction.confidence_range
      assert min_conf >= 0.0
      assert max_conf <= 1.0
      assert min_conf <= max_conf
    end

    test "extraction detection types are valid" do
      {:ok, extraction} = Extractor.extract_module(GravitationalPatterns)
      valid_types = [:regex, :keyword, :semantic, :structural]

      for {type, _count} <- extraction.detection_types do
        assert type in valid_types
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Full Extraction
  # ---------------------------------------------------------------------------

  describe "extract_all/0" do
    test "extracts all registered modules" do
      assert {:ok, full} = Extractor.extract_all()
      assert length(full.modules) == 4
      assert full.total_patterns > 0
      assert full.total_techniques > 0
      assert is_list(full.categories)
      assert length(full.categories) == 4
      assert is_map(full.cross_references)
    end

    test "categories include all four types" do
      {:ok, full} = Extractor.extract_all()
      assert :gravitational in full.categories
      assert :collapse in full.categories
      assert :infection in full.categories
      assert :paradox in full.categories
    end

    test "cross references map techniques to patterns" do
      {:ok, full} = Extractor.extract_all()

      for {_tech, refs} <- full.cross_references do
        assert is_list(refs)

        for ref <- refs do
          assert Map.has_key?(ref, :pattern_id)
          assert Map.has_key?(ref, :category)
        end
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Analysis
  # ---------------------------------------------------------------------------

  describe "analyze_overlaps/0" do
    test "returns overlap analysis" do
      assert {:ok, analysis} = Extractor.analyze_overlaps()
      assert is_map(analysis.multi_category_techniques)
      assert is_map(analysis.keyword_overlaps)
      assert is_integer(analysis.total_unique_techniques)
      assert is_map(analysis.coverage_by_category)
    end

    test "finds techniques covered by multiple categories" do
      {:ok, analysis} = Extractor.analyze_overlaps()

      # epistemic_imploze is referenced in multiple pattern categories
      if Map.has_key?(analysis.multi_category_techniques, :epistemic_imploze) do
        categories = analysis.multi_category_techniques[:epistemic_imploze]
        assert length(categories) > 1
      end
    end

    test "coverage by category has all four categories" do
      {:ok, analysis} = Extractor.analyze_overlaps()
      assert Map.has_key?(analysis.coverage_by_category, :gravitational)
      assert Map.has_key?(analysis.coverage_by_category, :collapse)
      assert Map.has_key?(analysis.coverage_by_category, :infection)
      assert Map.has_key?(analysis.coverage_by_category, :paradox)
    end
  end

  describe "extract_common_structure/0" do
    test "returns common field analysis" do
      assert {:ok, structure} = Extractor.extract_common_structure()
      assert is_map(structure.fields)
      assert structure.pattern_count > 0
      assert is_integer(structure.universal_field_count)
      assert is_list(structure.all_fields)
    end

    test "identifies core fields present in all patterns" do
      {:ok, structure} = Extractor.extract_common_structure()
      core_fields = [:id, :name, :category, :keywords, :severity]

      for field <- core_fields do
        assert Map.has_key?(structure.fields, field),
               "Expected #{field} to be in common structure"
      end
    end
  end

  describe "coverage_report/0" do
    test "returns comprehensive coverage report" do
      assert {:ok, report} = Extractor.coverage_report()
      assert is_integer(report.total_covered_techniques)
      assert report.total_covered_techniques > 0
      assert is_map(report.patterns_per_technique)
      assert is_integer(report.well_covered)
      assert is_integer(report.under_covered)
      assert is_float(report.avg_patterns_per_technique)
      assert is_integer(report.total_patterns)
      assert is_map(report.by_category)
    end

    test "by_category has entries for all modules" do
      {:ok, report} = Extractor.coverage_report()

      for category <- [:gravitational, :collapse, :infection, :paradox] do
        assert Map.has_key?(report.by_category, category)
        entry = report.by_category[category]
        assert is_integer(entry.patterns)
        assert is_integer(entry.techniques)
        assert entry.patterns > 0
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Export
  # ---------------------------------------------------------------------------

  describe "export_all/0" do
    test "exports all modules to JSON-serializable format" do
      result = Extractor.export_all()
      assert is_map(result)
      assert is_binary(result["exported_at"])
      assert result["module_count"] == 4
      assert is_integer(result["total_patterns"])
    end

    test "exported data includes all categories" do
      result = Extractor.export_all()
      assert Map.has_key?(result, "gravitational")
      assert Map.has_key?(result, "collapse")
      assert Map.has_key?(result, "infection")
      assert Map.has_key?(result, "paradox")
    end
  end

  describe "export_json/0" do
    test "produces valid JSON string" do
      assert {:ok, json} = Extractor.export_json()
      assert is_binary(json)
      assert {:ok, decoded} = Jason.decode(json)
      assert is_map(decoded)
    end
  end

  describe "registered_modules/0" do
    test "returns all four pattern modules" do
      modules = Extractor.registered_modules()
      assert length(modules) == 4
      assert GravitationalPatterns in modules
      assert CollapsePatterns in modules
      assert InfectionPatterns in modules
      assert ParadoxPatterns in modules
    end
  end
end
