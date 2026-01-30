defmodule PrismaticAnnihilation.Compendium.ValidationTest do
  @moduledoc """
  Tests for the Compendium Validation module.

  Validates the validation logic for technique structs including
  required fields, severity values, categories, and cross-references.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.Compendium.Validation

  # Valid technique fixture for testing
  @valid_technique %{
    id: :test_technique,
    name: "Test Technique",
    name_cz: "Testovací technika",
    category: :singularity,
    chapter: 6,
    technique_number: 1,
    severity: :critical,
    reversibility: :difficult,
    temporal_course: "Postupný",
    typical_manifestations: ["Symptom 1", "Symptom 2"],
    defense_strategies: ["Defense 1", "Defense 2"],
    description: "A detailed description of the test technique that is long enough.",
    detailed_principle: "The core principle.",
    example: "An example case.",
    see_also: [:related_technique],
    detection_patterns: ["pattern_1", "pattern_2"],
    keywords: ["test", "technique"]
  }

  describe "validate_technique/1" do
    test "validates a complete valid technique" do
      assert {:ok, technique} = Validation.validate_technique(@valid_technique)
      assert technique.id == :test_technique
    end

    test "returns sanitized technique on success" do
      technique_with_spaces = %{@valid_technique | name: "  Spaced Name  "}

      assert {:ok, technique} = Validation.validate_technique(technique_with_spaces)
      assert technique.name == "Spaced Name"
    end

    test "fails for missing required fields" do
      invalid = %{}

      assert {:error, errors} = Validation.validate_technique(invalid)
      assert is_list(errors)
      assert length(errors) > 0

      field_names = Enum.map(errors, & &1.field)
      assert :id in field_names
      assert :name in field_names
      assert :category in field_names
    end

    test "fails for nil required fields" do
      invalid = %{
        id: nil,
        name: nil,
        name_cz: nil,
        category: nil,
        chapter: nil,
        severity: nil,
        description: nil
      }

      assert {:error, errors} = Validation.validate_technique(invalid)
      assert length(errors) >= 7
    end

    test "fails for empty required string fields" do
      invalid = %{
        id: :test,
        name: "",
        name_cz: "",
        category: :singularity,
        chapter: 6,
        severity: :high,
        description: ""
      }

      assert {:error, errors} = Validation.validate_technique(invalid)

      field_names = Enum.map(errors, & &1.field)
      assert :name in field_names
      assert :name_cz in field_names
      assert :description in field_names
    end

    test "fails for non-atom id" do
      invalid = %{@valid_technique | id: "string_id"}

      assert {:error, errors} = Validation.validate_technique(invalid)

      id_error = Enum.find(errors, &(&1.field == :id))
      assert id_error.reason == :must_be_atom
    end

    test "fails for invalid severity" do
      invalid = %{@valid_technique | severity: :invalid_severity}

      assert {:error, errors} = Validation.validate_technique(invalid)

      severity_error = Enum.find(errors, &(&1.field == :severity))
      assert severity_error.reason == :invalid_severity
    end

    test "fails for invalid reversibility" do
      invalid = %{@valid_technique | reversibility: :invalid_reversibility}

      assert {:error, errors} = Validation.validate_technique(invalid)

      rev_error = Enum.find(errors, &(&1.field == :reversibility))
      assert rev_error.reason == :invalid_reversibility
    end

    test "fails for invalid category" do
      invalid = %{@valid_technique | category: :invalid_category}

      assert {:error, errors} = Validation.validate_technique(invalid)

      cat_error = Enum.find(errors, &(&1.field == :category))
      assert cat_error.reason == :invalid_category
    end

    test "fails for invalid chapter" do
      invalid = %{@valid_technique | chapter: 0}

      assert {:error, errors} = Validation.validate_technique(invalid)

      chapter_error = Enum.find(errors, &(&1.field == :chapter))
      assert chapter_error.reason == :invalid_chapter_range

      invalid2 = %{@valid_technique | chapter: 16}
      assert {:error, errors2} = Validation.validate_technique(invalid2)

      chapter_error2 = Enum.find(errors2, &(&1.field == :chapter))
      assert chapter_error2.reason == :invalid_chapter_range
    end

    test "fails for name too short" do
      invalid = %{@valid_technique | name: "AB"}

      assert {:error, errors} = Validation.validate_technique(invalid)

      name_error = Enum.find(errors, &(&1.field == :name))
      assert name_error.reason == {:min_length, 3}
    end

    test "fails for description too short" do
      invalid = %{@valid_technique | description: "Short"}

      assert {:error, errors} = Validation.validate_technique(invalid)

      desc_error = Enum.find(errors, &(&1.field == :description))
      assert desc_error.reason == :description_too_short
    end

    test "accepts all valid severity values" do
      for severity <- Validation.valid_severities() do
        technique = %{@valid_technique | severity: severity}
        assert {:ok, _} = Validation.validate_technique(technique)
      end
    end

    test "accepts all valid reversibility values" do
      for reversibility <- Validation.valid_reversibilities() do
        technique = %{@valid_technique | reversibility: reversibility}
        assert {:ok, _} = Validation.validate_technique(technique)
      end
    end

    test "accepts all valid category values" do
      for category <- Validation.valid_categories() do
        technique = %{@valid_technique | category: category}
        assert {:ok, _} = Validation.validate_technique(technique)
      end
    end

    test "accepts chapters 1-15" do
      for chapter <- 1..15 do
        technique = %{@valid_technique | chapter: chapter}
        assert {:ok, _} = Validation.validate_technique(technique)
      end
    end

    test "sanitizes list fields to empty lists" do
      technique = %{@valid_technique | typical_manifestations: nil, defense_strategies: nil}

      assert {:ok, sanitized} = Validation.validate_technique(technique)
      assert sanitized.typical_manifestations == []
      assert sanitized.defense_strategies == []
    end

    test "deduplicates list fields" do
      technique = %{@valid_technique | keywords: ["test", "test", "unique"]}

      assert {:ok, sanitized} = Validation.validate_technique(technique)
      assert sanitized.keywords == ["test", "unique"]
    end
  end

  describe "validate_all/1" do
    test "validates list of techniques" do
      techniques = [
        @valid_technique,
        %{@valid_technique | id: :second_technique}
      ]

      assert {:ok, result} = Validation.validate_all(techniques)
      assert result.valid == 2
      assert result.invalid == 0
      assert result.errors == []
    end

    test "counts invalid techniques" do
      techniques = [
        @valid_technique,
        %{},
        %{@valid_technique | id: :third, severity: :invalid}
      ]

      assert {:ok, result} = Validation.validate_all(techniques)
      assert result.valid == 1
      assert result.invalid == 2
      assert length(result.errors) == 2
    end

    test "includes technique ID in error list" do
      techniques = [
        %{@valid_technique | id: :bad_technique, severity: :invalid}
      ]

      assert {:ok, result} = Validation.validate_all(techniques)

      [{id, _errors}] = result.errors
      assert id == :bad_technique
    end

    test "handles empty list" do
      assert {:ok, result} = Validation.validate_all([])
      assert result.valid == 0
      assert result.invalid == 0
    end
  end

  describe "validate_references/1" do
    test "validates valid cross-references" do
      techniques = [
        %{@valid_technique | id: :technique_a, see_also: [:technique_b]},
        %{@valid_technique | id: :technique_b, see_also: [:technique_a]}
      ]

      assert {:ok, result} = Validation.validate_references(techniques)
      assert length(result.valid) == 2
      assert result.broken == []
    end

    test "identifies broken references" do
      techniques = [
        %{@valid_technique | id: :technique_a, see_also: [:nonexistent]}
      ]

      assert {:ok, result} = Validation.validate_references(techniques)
      assert length(result.broken) == 1

      [broken] = result.broken
      assert broken.from == :technique_a
      assert broken.to == :nonexistent
      assert broken.reason == :target_not_found
    end

    test "handles techniques with no references" do
      techniques = [
        %{@valid_technique | id: :isolated, see_also: []}
      ]

      assert {:ok, result} = Validation.validate_references(techniques)
      assert result.valid == []
      assert result.broken == []
    end

    test "handles nil see_also" do
      techniques = [
        %{@valid_technique | id: :nil_refs, see_also: nil}
      ]

      assert {:ok, result} = Validation.validate_references(techniques)
      assert result.valid == []
      assert result.broken == []
    end

    test "handles empty list" do
      assert {:ok, result} = Validation.validate_references([])
      assert result.valid == []
      assert result.broken == []
    end
  end

  describe "validate_category_consistency/1" do
    test "identifies consistent techniques" do
      techniques = [
        %{@valid_technique | id: :t1, chapter: 6, category: :singularity},
        %{@valid_technique | id: :t2, chapter: 7, category: :metatranscendental}
      ]

      assert {:ok, result} = Validation.validate_category_consistency(techniques)
      assert :t1 in result.consistent
      assert :t2 in result.consistent
      assert result.inconsistent == []
    end

    test "identifies inconsistent techniques" do
      techniques = [
        %{@valid_technique | id: :wrong, chapter: 6, category: :paradoxical}
      ]

      assert {:ok, result} = Validation.validate_category_consistency(techniques)
      assert result.consistent == []
      assert length(result.inconsistent) == 1

      [inconsistent] = result.inconsistent
      assert inconsistent.id == :wrong
      assert inconsistent.chapter == 6
      assert inconsistent.actual_category == :paradoxical
      assert inconsistent.expected_category == :singularity
    end

    test "skips chapters without expected category mapping" do
      techniques = [
        %{@valid_technique | id: :unmapped, chapter: 1, category: :academic_manipulation}
      ]

      assert {:ok, result} = Validation.validate_category_consistency(techniques)
      # Chapter 1 is not in the strict mapping, so it's skipped
      assert result.consistent == []
      assert result.inconsistent == []
    end

    test "handles empty list" do
      assert {:ok, result} = Validation.validate_category_consistency([])
      assert result.consistent == []
      assert result.inconsistent == []
    end
  end

  describe "valid_severities/0" do
    test "returns list of valid severity atoms" do
      severities = Validation.valid_severities()

      assert is_list(severities)
      assert :terminal in severities
      assert :critical in severities
      assert :high in severities
      assert :medium in severities
      assert :low in severities
    end
  end

  describe "valid_reversibilities/0" do
    test "returns list of valid reversibility atoms" do
      reversibilities = Validation.valid_reversibilities()

      assert is_list(reversibilities)
      assert :irreversible in reversibilities
      assert :practically_irreversible in reversibilities
      assert :very_difficult in reversibilities
      assert :difficult in reversibilities
      assert :moderate in reversibilities
    end
  end

  describe "valid_categories/0" do
    test "returns list of valid category atoms" do
      categories = Validation.valid_categories()

      assert is_list(categories)
      assert :singularity in categories
      assert :metatranscendental in categories
      assert :hypertransformative in categories
      assert :paradoxical in categories
      assert :transconceptual in categories
    end
  end

  describe "required_fields/0" do
    test "returns list of required field atoms" do
      fields = Validation.required_fields()

      assert is_list(fields)
      assert :id in fields
      assert :name in fields
      assert :name_cz in fields
      assert :category in fields
      assert :chapter in fields
      assert :severity in fields
      assert :description in fields
    end
  end

  describe "error structure" do
    test "errors contain field, reason, and value" do
      invalid = %{@valid_technique | severity: :invalid}

      assert {:error, errors} = Validation.validate_technique(invalid)
      [error | _] = errors

      assert Map.has_key?(error, :field)
      assert Map.has_key?(error, :reason)
      assert Map.has_key?(error, :value)
    end

    test "error values reflect actual invalid values" do
      invalid = %{@valid_technique | severity: :bad_severity}

      assert {:error, errors} = Validation.validate_technique(invalid)
      error = Enum.find(errors, &(&1.field == :severity))

      assert error.value == :bad_severity
    end
  end

  describe "sanitization" do
    test "trims string fields" do
      technique = %{@valid_technique | name: "  Spaced  ", description: "  Description with spaces  "}

      assert {:ok, sanitized} = Validation.validate_technique(technique)
      assert sanitized.name == "Spaced"
      assert sanitized.description == "Description with spaces"
    end

    test "ensures default values" do
      technique = Map.drop(@valid_technique, [:technique_number, :temporal_course])

      assert {:ok, sanitized} = Validation.validate_technique(technique)
      assert sanitized.technique_number == 0
      assert sanitized.temporal_course == ""
    end

    test "converts nil lists to empty lists" do
      technique = %{
        @valid_technique
        | typical_manifestations: nil,
          defense_strategies: nil,
          see_also: nil,
          detection_patterns: nil,
          keywords: nil
      }

      assert {:ok, sanitized} = Validation.validate_technique(technique)
      assert sanitized.typical_manifestations == []
      assert sanitized.defense_strategies == []
      assert sanitized.see_also == []
      assert sanitized.detection_patterns == []
      assert sanitized.keywords == []
    end
  end
end
