defmodule PrismaticAnnihilation.Patterns.GeneratorTest do
  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Patterns.Generator

  # ---------------------------------------------------------------------------
  # Module Generation from Spec
  # ---------------------------------------------------------------------------

  describe "from_spec/2" do
    test "generates a functional module" do
      module_name = unique_module_name("FromSpec")

      patterns = [
        test_pattern(:gen_spec_1, "Spec Pattern 1"),
        test_pattern(:gen_spec_2, "Spec Pattern 2")
      ]

      assert {:ok, result} =
               Generator.from_spec(module_name,
                 category: :spec_test,
                 subcategories: [default: patterns]
               )

      assert result.module == module_name
      assert result.pattern_count == 2
      assert result.validation_issues == []
      assert module_name.category() == :spec_test
      assert length(module_name.all()) == 2
    end

    test "rejects invalid patterns in spec" do
      module_name = unique_module_name("FromSpecInvalid")

      assert {:error, {:validation_failed, issues}} =
               Generator.from_spec(module_name,
                 category: :invalid_test,
                 subcategories: [default: [%{id: :bad}]]
               )

      assert length(issues) > 0
    end
  end

  # ---------------------------------------------------------------------------
  # Pattern Generation from Techniques
  # ---------------------------------------------------------------------------

  describe "patterns_from_techniques/2" do
    test "generates patterns from technique definitions" do
      techniques = [sample_technique()]
      patterns = Generator.patterns_from_techniques(techniques)

      assert is_list(patterns)
      assert length(patterns) > 0

      for pattern <- patterns do
        assert Map.has_key?(pattern, :id)
        assert Map.has_key?(pattern, :name)
        assert Map.has_key?(pattern, :keywords)
        assert Map.has_key?(pattern, :severity)
        assert Map.has_key?(pattern, :associated_techniques)
      end
    end

    test "uses technique metadata for pattern generation" do
      technique = sample_technique()
      patterns = Generator.patterns_from_techniques([technique])

      # Keyword pattern should use detection_patterns
      keyword_pattern =
        Enum.find(patterns, fn p ->
          p.id == :gen_test_technique_keywords
        end)

      if keyword_pattern do
        assert keyword_pattern.severity == :critical
        assert :test_technique in keyword_pattern.associated_techniques
      end
    end

    test "generates manifestation patterns when typical_manifestations present" do
      technique = sample_technique()
      patterns = Generator.patterns_from_techniques([technique])

      manifestation_pattern =
        Enum.find(patterns, fn p ->
          p.id == :gen_test_technique_manifestations
        end)

      assert manifestation_pattern != nil
      assert manifestation_pattern.detection_type == :keyword
    end

    test "respects confidence_base option" do
      technique = sample_technique()
      patterns = Generator.patterns_from_techniques([technique], confidence_base: 0.9)

      for pattern <- patterns do
        assert pattern.confidence_weight >= 0.8
      end
    end

    test "respects prefix option" do
      technique = sample_technique()
      patterns = Generator.patterns_from_techniques([technique], prefix: "custom")

      for pattern <- patterns do
        assert Atom.to_string(pattern.id) |> String.starts_with?("custom_")
      end
    end

    test "handles technique with no detection_patterns" do
      technique = %{
        id: :bare_technique,
        name: "Bare Technique",
        category: :test,
        severity: :low,
        typical_manifestations: ["manifestation one"],
        detection_patterns: [],
        defense_strategies: [],
        see_also: []
      }

      patterns = Generator.patterns_from_techniques([technique])
      # Should still generate manifestation pattern
      assert length(patterns) >= 1
    end

    test "handles empty techniques list" do
      assert [] == Generator.patterns_from_techniques([])
    end
  end

  describe "patterns_for_technique/2" do
    test "generates patterns for a single technique" do
      technique = sample_technique()
      patterns = Generator.patterns_for_technique(technique)
      assert is_list(patterns)
      assert length(patterns) > 0
    end
  end

  # ---------------------------------------------------------------------------
  # Test Generation
  # ---------------------------------------------------------------------------

  describe "generate_test_source/1" do
    test "generates valid test source for gravitational patterns" do
      assert {:ok, source} =
               Generator.generate_test_source(PrismaticAnnihilation.Patterns.GravitationalPatterns)

      assert is_binary(source)
      assert String.contains?(source, "defmodule")
      assert String.contains?(source, "ExUnit.Case")
      assert String.contains?(source, "category returns")
      assert String.contains?(source, "all patterns have required fields")
      assert String.contains?(source, "detect returns")
    end

    test "generates test source for all pattern modules" do
      modules = [
        PrismaticAnnihilation.Patterns.GravitationalPatterns,
        PrismaticAnnihilation.Patterns.CollapsePatterns,
        PrismaticAnnihilation.Patterns.InfectionPatterns,
        PrismaticAnnihilation.Patterns.ParadoxPatterns
      ]

      for module <- modules do
        assert {:ok, source} = Generator.generate_test_source(module)
        assert is_binary(source)
        assert String.length(source) > 100
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Documentation Generation
  # ---------------------------------------------------------------------------

  describe "generate_documentation/1" do
    test "generates markdown documentation" do
      assert {:ok, doc} =
               Generator.generate_documentation(
                 PrismaticAnnihilation.Patterns.GravitationalPatterns
               )

      assert is_binary(doc)
      assert String.contains?(doc, "gravitational")
      assert String.contains?(doc, "Pattern Count")
      assert String.contains?(doc, "Detection Type Distribution")
      assert String.contains?(doc, "Severity Distribution")
      assert String.contains?(doc, "Technique Coverage")
    end
  end

  # ---------------------------------------------------------------------------
  # Engine Specification
  # ---------------------------------------------------------------------------

  describe "engine_spec/3" do
    test "generates engine specification" do
      modules = [PrismaticAnnihilation.Patterns.GravitationalPatterns]
      spec = Generator.engine_spec(:gravitational, modules)

      assert spec.category == :gravitational
      assert spec.modules == modules
      assert spec.pool_size == 3
      assert spec.timeout_ms == 100
      assert spec.total_patterns > 0
      assert is_atom(spec.engine_module)
      assert is_map(spec.child_spec)
    end

    test "respects pool_size option" do
      spec = Generator.engine_spec(:test, [], pool_size: 5)
      assert spec.pool_size == 5
    end

    test "respects timeout_ms option" do
      spec = Generator.engine_spec(:test, [], timeout_ms: 200)
      assert spec.timeout_ms == 200
    end
  end

  # ---------------------------------------------------------------------------
  # Helpers
  # ---------------------------------------------------------------------------

  defp unique_module_name(prefix) do
    :"Elixir.PrismaticAnnihilation.Patterns.Test#{prefix}#{:rand.uniform(1_000_000)}"
  end

  defp test_pattern(id, name) do
    %{
      id: id,
      name: name,
      category: :test,
      subcategory: :default,
      detection_type: :keyword,
      regex: nil,
      keywords: ["test keyword", "detection"],
      semantic_markers: [],
      confidence_weight: 0.8,
      associated_techniques: [:test_technique],
      context_requirements: [:epistemic_discourse],
      false_positive_indicators: [],
      severity: :medium,
      description: "Test pattern: #{name}"
    }
  end

  defp sample_technique do
    %{
      id: :test_technique,
      name: "Test Technique",
      category: :singularity,
      severity: :critical,
      reversibility: :difficult,
      temporal_course: "rapid",
      typical_manifestations: [
        "cognitive_self_consumption",
        "epistemic_autophagy"
      ],
      defense_strategies: [
        "external_epistemic_anchoring",
        "cognitive_compartmentalization"
      ],
      description: "A test technique for pattern generation",
      detailed_principle: "Test principle",
      example: "Test example",
      see_also: [:related_technique],
      detection_patterns: [
        "self_reference_destroying_foundation",
        "recursive_epistemic_negation"
      ]
    }
  end
end
