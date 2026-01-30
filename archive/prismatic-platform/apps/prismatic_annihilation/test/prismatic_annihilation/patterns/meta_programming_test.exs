defmodule PrismaticAnnihilation.Patterns.MetaProgrammingTest do
  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Patterns.MetaProgramming

  # ---------------------------------------------------------------------------
  # Pattern Schema & Validation
  # ---------------------------------------------------------------------------

  describe "pattern_schema/0" do
    test "returns schema with required, optional, and defaults" do
      schema = MetaProgramming.pattern_schema()
      assert is_map(schema)
      assert is_list(schema.required)
      assert is_list(schema.optional)
      assert is_map(schema.defaults)
      assert :id in schema.required
      assert :name in schema.required
      assert :keywords in schema.required
    end
  end

  describe "validate_pattern/1" do
    test "validates a well-formed pattern" do
      pattern = valid_pattern()
      assert {:ok, validated} = MetaProgramming.validate_pattern(pattern)
      assert validated.id == :test_pattern
      assert validated.semantic_markers == []
    end

    test "applies defaults for missing optional fields" do
      pattern = valid_pattern() |> Map.delete(:semantic_markers)
      assert {:ok, validated} = MetaProgramming.validate_pattern(pattern)
      assert validated.semantic_markers == []
      assert validated.false_positive_indicators == []
    end

    test "rejects pattern missing required fields" do
      pattern = %{id: :incomplete}
      assert {:error, issues} = MetaProgramming.validate_pattern(pattern)
      assert is_list(issues)
      assert length(issues) > 0
      assert Enum.any?(issues, &String.contains?(&1, "Missing required field"))
    end

    test "rejects invalid confidence_weight" do
      pattern = valid_pattern() |> Map.put(:confidence_weight, 1.5)
      assert {:error, issues} = MetaProgramming.validate_pattern(pattern)
      assert Enum.any?(issues, &String.contains?(&1, "confidence_weight"))
    end

    test "rejects invalid detection_type" do
      pattern = valid_pattern() |> Map.put(:detection_type, :invalid_type)
      assert {:error, issues} = MetaProgramming.validate_pattern(pattern)
      assert Enum.any?(issues, &String.contains?(&1, "detection_type"))
    end

    test "validates regex compilation for regex patterns" do
      pattern = valid_pattern() |> Map.merge(%{detection_type: :regex, regex: "[invalid"})
      assert {:error, issues} = MetaProgramming.validate_pattern(pattern)
      assert Enum.any?(issues, &String.contains?(&1, "regex"))
    end

    test "accepts valid regex patterns" do
      pattern = valid_pattern() |> Map.merge(%{detection_type: :regex, regex: "test\\s+pattern"})
      assert {:ok, _} = MetaProgramming.validate_pattern(pattern)
    end
  end

  describe "validate_patterns/1" do
    test "separates valid and invalid patterns" do
      patterns = [
        valid_pattern(),
        %{id: :incomplete},
        valid_pattern() |> Map.put(:id, :second_valid)
      ]

      result = MetaProgramming.validate_patterns(patterns)
      assert length(result.valid) == 2
      assert length(result.invalid) == 1
    end

    test "returns empty lists for empty input" do
      result = MetaProgramming.validate_patterns([])
      assert result.valid == []
      assert result.invalid == []
    end
  end

  # ---------------------------------------------------------------------------
  # Core Detection Functions
  # ---------------------------------------------------------------------------

  describe "match_keywords/2" do
    test "returns fraction of matching keywords" do
      keywords = ["alpha", "beta", "gamma"]
      content = "this has alpha and gamma in it"
      score = MetaProgramming.match_keywords(keywords, content)
      assert_in_delta score, 2 / 3, 0.01
    end

    test "returns 0.0 for no matches" do
      assert MetaProgramming.match_keywords(["xyz"], "abc") == 0.0
    end

    test "returns 0.0 for empty keywords" do
      assert MetaProgramming.match_keywords([], "any content") == 0.0
    end

    test "returns 1.0 when all keywords match" do
      keywords = ["one", "two"]
      content = "one and two"
      assert MetaProgramming.match_keywords(keywords, content) == 1.0
    end
  end

  describe "match_semantic_markers/2" do
    test "returns weighted fraction of matching markers" do
      markers = ["point of no return", "beyond recovery"]
      content = "this is beyond recovery"
      score = MetaProgramming.match_semantic_markers(markers, content)
      assert score > 0.0
      assert score <= 0.8
    end

    test "returns 0.0 for empty markers" do
      assert MetaProgramming.match_semantic_markers([], "any") == 0.0
    end
  end

  describe "match_regex/2" do
    test "returns 1.0 for regex match" do
      pattern = %{detection_type: :regex, regex: "test\\s+content"}
      score = MetaProgramming.match_regex(pattern, "test content here")
      assert score == 1.0
    end

    test "returns 0.0 for no regex match" do
      pattern = %{detection_type: :regex, regex: "xyz\\s+abc"}
      score = MetaProgramming.match_regex(pattern, "test content here")
      assert score == 0.0
    end

    test "returns 0.0 for non-regex patterns" do
      pattern = %{detection_type: :keyword}
      assert MetaProgramming.match_regex(pattern, "any") == 0.0
    end

    test "returns 0.0 for nil regex" do
      pattern = %{detection_type: :regex, regex: nil}
      assert MetaProgramming.match_regex(pattern, "any") == 0.0
    end
  end

  describe "calculate_combined_score/4" do
    test "weights regex patterns correctly" do
      pattern = %{detection_type: :regex}
      score = MetaProgramming.calculate_combined_score(0.5, 0.5, 1.0, pattern)
      expected = 1.0 * 0.5 + 0.5 * 0.3 + 0.5 * 0.2
      assert_in_delta score, expected, 0.001
    end

    test "weights keyword patterns correctly" do
      pattern = %{detection_type: :keyword}
      score = MetaProgramming.calculate_combined_score(1.0, 0.5, 0.0, pattern)
      expected = 1.0 * 0.6 + 0.5 * 0.4
      assert_in_delta score, expected, 0.001
    end

    test "weights semantic patterns correctly" do
      pattern = %{detection_type: :semantic}
      score = MetaProgramming.calculate_combined_score(0.5, 1.0, 0.0, pattern)
      expected = 1.0 * 0.5 + 0.5 * 0.5
      assert_in_delta score, expected, 0.001
    end
  end

  describe "match_pattern/4" do
    test "returns detection result for matching content" do
      pattern = valid_pattern()
      content = "epistemic horizon formation detected"
      content_lower = String.downcase(content)

      result = MetaProgramming.match_pattern(pattern, content_lower, content, "test")
      assert is_map(result)
      assert result.pattern_id == :test_pattern
      assert result.confidence > 0.0
      assert result.severity == :high
      assert is_list(result.evidence)
    end

    test "returns nil for non-matching content" do
      pattern = valid_pattern()
      content = "completely unrelated text about cooking recipes"
      content_lower = String.downcase(content)

      assert is_nil(MetaProgramming.match_pattern(pattern, content_lower, content, "test"))
    end
  end

  describe "detect_patterns/4" do
    test "returns {:ok, list} with matches above threshold" do
      patterns = [valid_pattern()]
      content = "epistemic horizon formation in the text"

      assert {:ok, results} = MetaProgramming.detect_patterns(content, patterns, [], "test")
      assert is_list(results)
    end

    test "respects threshold option" do
      patterns = [valid_pattern()]
      content = "epistemic horizon formation"

      assert {:ok, results} = MetaProgramming.detect_patterns(
               content, patterns, [threshold: 0.99], "test"
             )
      assert Enum.all?(results, fn r -> r.confidence >= 0.99 end)
    end

    test "respects max_results option" do
      patterns = [
        valid_pattern(),
        valid_pattern() |> Map.put(:id, :test_pattern_2) |> Map.put(:keywords, ["epistemic"])
      ]
      content = "epistemic horizon"

      assert {:ok, results} = MetaProgramming.detect_patterns(
               content, patterns, [max_results: 1], "test"
             )
      assert length(results) <= 1
    end

    test "handles empty content" do
      assert {:ok, []} = MetaProgramming.detect_patterns("", [valid_pattern()], [], "test")
    end

    test "handles empty patterns" do
      assert {:ok, []} = MetaProgramming.detect_patterns("some content", [], [], "test")
    end
  end

  # ---------------------------------------------------------------------------
  # JSON Conversion (Bidirectional)
  # ---------------------------------------------------------------------------

  describe "json_to_pattern/1" do
    test "converts JSON map to pattern with atom keys" do
      json = %{
        "id" => "test_id",
        "name" => "Test Pattern",
        "category" => "gravitational",
        "subcategory" => "horizon",
        "detection_type" => "keyword",
        "keywords" => ["word1", "word2"],
        "confidence_weight" => 0.85,
        "associated_techniques" => ["tech_1"],
        "severity" => "high",
        "description" => "A test pattern"
      }

      pattern = MetaProgramming.json_to_pattern(json)
      assert pattern.id == :test_id
      assert pattern.category == :gravitational
      assert pattern.detection_type == :keyword
      assert pattern.severity == :high
      assert pattern.confidence_weight == 0.85
      assert pattern.associated_techniques == [:tech_1]
    end

    test "applies defaults for missing fields" do
      json = %{
        "id" => "minimal",
        "name" => "Minimal"
      }

      pattern = MetaProgramming.json_to_pattern(json)
      assert pattern.keywords == []
      assert pattern.semantic_markers == []
      assert pattern.false_positive_indicators == []
    end
  end

  describe "pattern_to_json/1" do
    test "converts pattern map to JSON-serializable structure" do
      pattern = valid_pattern()
      json = MetaProgramming.pattern_to_json(pattern)

      assert json["id"] == "test_pattern"
      assert json["name"] == "Test Pattern"
      assert json["severity"] == "high"
      assert is_list(json["keywords"])
      assert is_float(json["confidence_weight"])
    end
  end

  describe "verify_round_trip/1" do
    test "succeeds for well-formed patterns" do
      patterns = [valid_pattern()]
      assert {:ok, :consistent} = MetaProgramming.verify_round_trip(patterns)
    end

    test "succeeds for multiple patterns" do
      patterns = [
        valid_pattern(),
        valid_pattern() |> Map.put(:id, :second_pattern) |> Map.put(:name, "Second")
      ]

      assert {:ok, :consistent} = MetaProgramming.verify_round_trip(patterns)
    end
  end

  describe "export_module/1" do
    test "exports a pattern module to JSON-serializable format" do
      result = MetaProgramming.export_module(
        PrismaticAnnihilation.Patterns.GravitationalPatterns
      )

      assert result["category"] == "gravitational"
      assert is_integer(result["pattern_count"])
      assert result["pattern_count"] > 0
      assert is_map(result["subcategories"])
      assert is_binary(result["exported_at"])
    end
  end

  # ---------------------------------------------------------------------------
  # Module Generation
  # ---------------------------------------------------------------------------

  describe "generate_module/2" do
    test "generates a functional module from spec" do
      module_name = :"Elixir.PrismaticAnnihilation.Patterns.TestGenerated#{:rand.uniform(100_000)}"

      result = MetaProgramming.generate_module(module_name, [
        category: :test_generated,
        subcategories: [
          sub_a: [valid_pattern()],
          sub_b: [valid_pattern() |> Map.put(:id, :pattern_b)]
        ]
      ])

      assert {:ok, ^module_name} = result
      assert module_name.category() == :test_generated
      assert module_name.count() == 2
      assert length(module_name.all()) == 2
    end

    test "rejects specs with invalid patterns" do
      module_name = :"Elixir.PrismaticAnnihilation.Patterns.TestInvalid#{:rand.uniform(100_000)}"

      result = MetaProgramming.generate_module(module_name, [
        category: :test_invalid,
        subcategories: [
          sub_a: [%{id: :incomplete_pattern}]
        ]
      ])

      assert {:error, issues} = result
      assert is_list(issues)
      assert length(issues) > 0
    end
  end

  describe "generate_from_data/2" do
    test "generates module from JSON-like data" do
      module_name = :"Elixir.PrismaticAnnihilation.Patterns.TestFromData#{:rand.uniform(100_000)}"

      data = %{
        "category" => "data_driven",
        "source" => "test_data",
        "subcategories" => %{
          "alpha" => [
            %{
              "id" => "dd_pattern_1",
              "name" => "Data-Driven Pattern",
              "category" => "data_driven",
              "subcategory" => "alpha",
              "detection_type" => "keyword",
              "keywords" => ["test keyword"],
              "confidence_weight" => 0.8,
              "associated_techniques" => ["some_technique"],
              "severity" => "medium",
              "description" => "A data-driven test pattern"
            }
          ]
        }
      }

      assert {:ok, ^module_name} = MetaProgramming.generate_from_data(module_name, data)
      assert module_name.category() == :data_driven
      assert module_name.count() == 1
    end
  end

  # ---------------------------------------------------------------------------
  # Helpers
  # ---------------------------------------------------------------------------

  defp valid_pattern do
    %{
      id: :test_pattern,
      name: "Test Pattern",
      category: :test,
      subcategory: :test_sub,
      detection_type: :keyword,
      regex: nil,
      keywords: ["epistemic horizon", "knowledge boundary"],
      semantic_markers: [],
      confidence_weight: 0.85,
      associated_techniques: [:epistemic_imploze],
      context_requirements: [:epistemic_discourse],
      false_positive_indicators: ["learning curve"],
      severity: :high,
      description: "A test detection pattern"
    }
  end
end
