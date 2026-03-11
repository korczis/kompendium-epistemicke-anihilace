defmodule PrismaticAnnihilation.Compendium.Validation do
  @moduledoc """
  Validation module for parsed and built technique data.

  Ensures data integrity and consistency across the compendium:
  - Required fields presence validation
  - Severity value validation
  - Category consistency checking
  - Cross-reference validity verification
  - Schema compliance validation

  ## Usage

      # Validate a single technique
      {:ok, technique} = Validation.validate_technique(technique)
      {:error, errors} = Validation.validate_technique(invalid_technique)

      # Validate a list of techniques
      {:ok, valid_count} = Validation.validate_all(techniques)

      # Check cross-reference validity
      {:ok, refs} = Validation.validate_references(techniques)

  """

  @typedoc """
  Validation error with field and reason.
  """
  @type validation_error :: %{
          field: atom(),
          reason: atom() | String.t(),
          value: term()
        }

  @typedoc """
  Validation result.
  """
  @type validation_result :: {:ok, map()} | {:error, [validation_error()]}

  # Valid severity levels
  @valid_severities [:terminal, :critical, :high, :medium, :low, :unknown]

  # Valid reversibility levels
  @valid_reversibilities [
    :irreversible,
    :practically_irreversible,
    :very_difficult,
    :difficult,
    :moderate,
    :high,
    :unknown
  ]

  # Valid categories
  @valid_categories [
    :singularity,
    :metatranscendental,
    :hypertransformative,
    :paradoxical,
    :transconceptual,
    :academic_manipulation,
    :delegitimization,
    :diagnostic,
    :therapeutic,
    :preventive,
    :research
  ]

  # Required fields for a valid technique
  @required_fields [:id, :name, :name_cz, :category, :chapter, :severity, :description]

  # ==========================================================================
  # Public API
  # ==========================================================================

  @doc """
  Validates a single technique struct for completeness and consistency.

  Checks:
  - All required fields are present and non-empty
  - Severity is a valid value
  - Reversibility is a valid value (if present)
  - Category is a valid value
  - Chapter is in valid range (1-15)
  - ID is an atom
  - Names are non-empty strings

  ## Parameters

  - `technique` - Technique map to validate

  ## Returns

  - `{:ok, technique}` - Validation passed, returns sanitized technique
  - `{:error, [validation_error()]}` - Validation failed with list of errors

  ## Examples

      iex> {:ok, technique} = Validation.validate_technique(valid_technique)
      iex> technique.id
      :epistemic_imploze

      iex> {:error, errors} = Validation.validate_technique(%{})
      iex> length(errors) > 0
      true
  """
  @spec validate_technique(map()) :: validation_result()
  def validate_technique(technique) when is_map(technique) do
    errors =
      []
      |> validate_required_fields(technique)
      |> validate_id(technique)
      |> validate_names(technique)
      |> validate_severity(technique)
      |> validate_reversibility(technique)
      |> validate_category(technique)
      |> validate_chapter(technique)
      |> validate_description(technique)

    case errors do
      [] -> {:ok, sanitize_technique(technique)}
      errors -> {:error, Enum.reverse(errors)}
    end
  end

  @doc """
  Validates a list of techniques, returning count of valid ones.

  ## Parameters

  - `techniques` - List of technique maps to validate

  ## Returns

  - `{:ok, %{valid: count, invalid: count, errors: [...]}}` - Validation results

  ## Examples

      iex> {:ok, result} = Validation.validate_all(techniques)
      iex> result.valid > 0
      true
  """
  @spec validate_all([map()]) :: {:ok, map()}
  def validate_all(techniques) when is_list(techniques) do
    results =
      Enum.reduce(techniques, %{valid: 0, invalid: 0, errors: []}, fn technique, acc ->
        case validate_technique(technique) do
          {:ok, _} ->
            %{acc | valid: acc.valid + 1}

          {:error, errors} ->
            id = technique[:id] || technique[:name_cz] || "unknown"

            %{
              acc
              | invalid: acc.invalid + 1,
                errors: [{id, errors} | acc.errors]
            }
        end
      end)

    {:ok, %{results | errors: Enum.reverse(results.errors)}}
  end

  @doc """
  Validates cross-references between techniques.

  Checks that all `see_also` references point to valid technique IDs.

  ## Parameters

  - `techniques` - List of technique maps with see_also fields

  ## Returns

  - `{:ok, %{valid: [...], broken: [...]}}` - Reference validation result

  ## Examples

      iex> {:ok, refs} = Validation.validate_references(techniques)
      iex> refs.broken
      []
  """
  @spec validate_references([map()]) :: {:ok, map()}
  def validate_references(techniques) when is_list(techniques) do
    # Build set of all valid IDs
    valid_ids = MapSet.new(Enum.map(techniques, & &1[:id]))

    # Check all references
    {valid_refs, broken_refs} =
      techniques
      |> Enum.flat_map(fn technique ->
        see_also = technique[:see_also] || []

        Enum.map(see_also, fn ref ->
          {Map.get(technique, :id), ref, MapSet.member?(valid_ids, ref)}
        end)
      end)
      |> Enum.split_with(fn {_, _, valid} -> valid end)

    {:ok,
     %{
       valid:
         Enum.map(valid_refs, fn {from, to, _} ->
           %{from: from, to: to}
         end),
       broken:
         Enum.map(broken_refs, fn {from, to, _} ->
           %{from: from, to: to, reason: :target_not_found}
         end)
     }}
  end

  @doc """
  Validates category consistency within technique collections.

  Checks that techniques assigned to specific chapters match expected categories.

  ## Parameters

  - `techniques` - List of technique maps

  ## Returns

  - `{:ok, %{consistent: [...], inconsistent: [...]}}` - Consistency result
  """
  @spec validate_category_consistency([map()]) :: {:ok, map()}
  def validate_category_consistency(techniques) when is_list(techniques) do
    chapter_categories = %{
      6 => :singularity,
      7 => :metatranscendental,
      8 => :hypertransformative,
      9 => :paradoxical,
      10 => :transconceptual,
      11 => :diagnostic,
      12 => :therapeutic,
      13 => :preventive
    }

    {consistent, inconsistent} =
      techniques
      |> Enum.filter(&Map.has_key?(chapter_categories, &1[:chapter]))
      |> Enum.split_with(fn technique ->
        expected = Map.get(chapter_categories, technique[:chapter])
        Map.get(technique, :category) == expected
      end)

    {:ok,
     %{
       consistent: Enum.map(consistent, & &1[:id]),
       inconsistent:
         Enum.map(inconsistent, fn t ->
           expected = Map.get(chapter_categories, t[:chapter])

           %{
             id: Map.get(t, :id),
             chapter: Map.get(t, :chapter),
             actual_category: Map.get(t, :category),
             expected_category: expected
           }
         end)
     }}
  end

  @doc """
  Returns the list of valid severity values.
  """
  @spec valid_severities() :: [atom()]
  def valid_severities, do: @valid_severities

  @doc """
  Returns the list of valid reversibility values.
  """
  @spec valid_reversibilities() :: [atom()]
  def valid_reversibilities, do: @valid_reversibilities

  @doc """
  Returns the list of valid category values.
  """
  @spec valid_categories() :: [atom()]
  def valid_categories, do: @valid_categories

  @doc """
  Returns the list of required technique fields.
  """
  @spec required_fields() :: [atom()]
  def required_fields, do: @required_fields

  # ==========================================================================
  # Private: Field Validators
  # ==========================================================================

  defp validate_required_fields(errors, technique) do
    missing =
      @required_fields
      |> Enum.filter(fn field ->
        value = Map.get(technique, field)
        is_nil(value) or value == "" or value == []
      end)

    Enum.reduce(missing, errors, fn field, acc ->
      [%{field: field, reason: :required_field_missing, value: nil} | acc]
    end)
  end

  defp validate_id(errors, technique) do
    case Map.get(technique, :id) do
      nil ->
        errors

      id when is_atom(id) ->
        errors

      id ->
        [%{field: :id, reason: :must_be_atom, value: id} | errors]
    end
  end

  defp validate_names(errors, technique) do
    errors = validate_string_field(errors, technique, :name, min_length: 3)
    validate_string_field(errors, technique, :name_cz, min_length: 3)
  end

  defp validate_string_field(errors, technique, field, opts) do
    min_length = Keyword.get(opts, :min_length, 1)

    case technique[field] do
      nil ->
        errors

      value when is_binary(value) ->
        if String.length(value) < min_length do
          [%{field: field, reason: {:min_length, min_length}, value: value} | errors]
        else
          errors
        end

      value ->
        [%{field: field, reason: :must_be_string, value: value} | errors]
    end
  end

  defp validate_severity(errors, technique) do
    case Map.get(technique, :severity) do
      nil ->
        errors

      severity when severity in @valid_severities ->
        errors

      severity ->
        [%{field: :severity, reason: :invalid_severity, value: severity} | errors]
    end
  end

  defp validate_reversibility(errors, technique) do
    case Map.get(technique, :reversibility) do
      nil ->
        errors

      reversibility when reversibility in @valid_reversibilities ->
        errors

      reversibility ->
        [%{field: :reversibility, reason: :invalid_reversibility, value: reversibility} | errors]
    end
  end

  defp validate_category(errors, technique) do
    case Map.get(technique, :category) do
      nil ->
        errors

      category when category in @valid_categories ->
        errors

      category ->
        [%{field: :category, reason: :invalid_category, value: category} | errors]
    end
  end

  defp validate_chapter(errors, technique) do
    case Map.get(technique, :chapter) do
      nil ->
        errors

      chapter when is_integer(chapter) and chapter in 1..15 ->
        errors

      chapter ->
        [%{field: :chapter, reason: :invalid_chapter_range, value: chapter} | errors]
    end
  end

  defp validate_description(errors, technique) do
    case Map.get(technique, :description) do
      nil ->
        errors

      description when is_binary(description) ->
        if String.length(description) < 10 do
          [%{field: :description, reason: :description_too_short, value: description} | errors]
        else
          errors
        end

      description ->
        [%{field: :description, reason: :must_be_string, value: description} | errors]
    end
  end

  # ==========================================================================
  # Private: Sanitization
  # ==========================================================================

  defp sanitize_technique(technique) do
    technique
    |> sanitize_strings()
    |> sanitize_lists()
    |> ensure_defaults()
  end

  defp sanitize_strings(technique) do
    string_fields = [:name, :name_cz, :description, :temporal_course, :example, :detailed_principle]

    Enum.reduce(string_fields, technique, fn field, acc ->
      case Map.get(acc, field) do
        nil -> acc
        value when is_binary(value) -> Map.put(acc, field, String.trim(value))
        _ -> acc
      end
    end)
  end

  defp sanitize_lists(technique) do
    list_fields = [
      :typical_manifestations,
      :defense_strategies,
      :see_also,
      :detection_patterns,
      :keywords
    ]

    Enum.reduce(list_fields, technique, fn field, acc ->
      case Map.get(acc, field) do
        nil -> Map.put(acc, field, [])
        list when is_list(list) -> Map.put(acc, field, Enum.uniq(list))
        _ -> Map.put(acc, field, [])
      end
    end)
  end

  defp ensure_defaults(technique) do
    defaults = %{
      technique_number: 0,
      temporal_course: "",
      detailed_principle: nil,
      example: nil
    }

    Map.merge(defaults, technique)
  end
end
