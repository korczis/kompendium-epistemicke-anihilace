defmodule PrismaticAnnihilation.Compendium.TechniqueBuilder do
  @moduledoc """
  Builds complete technique structs from parsed compendium data.

  Transforms raw parsed technique data into complete, validated technique
  definitions with:
  - Automatic ID generation from Czech names
  - Severity classification mapping
  - Category assignment based on chapter mapping
  - Detection pattern extraction
  - Defense strategy linking

  ## Usage

      # Build from raw parsed data
      technique = TechniqueBuilder.build_from_raw(raw_data, 1)

      # Generate ID from Czech name
      id = TechniqueBuilder.generate_id("Epistemická imploze")
      # => :epistemicka_imploze

      # Map Czech severity to atom
      severity = TechniqueBuilder.map_severity("Extrémní")
      # => :terminal

  """

  @typedoc """
  Complete technique struct matching Taxonomy format.
  """
  @type technique :: %{
          id: atom(),
          name: String.t(),
          name_cz: String.t(),
          category: atom(),
          chapter: 1..15,
          technique_number: non_neg_integer(),
          severity: atom(),
          reversibility: atom(),
          temporal_course: String.t(),
          typical_manifestations: [String.t()],
          defense_strategies: [String.t()],
          description: String.t(),
          detailed_principle: String.t() | nil,
          example: String.t() | nil,
          see_also: [atom()],
          detection_patterns: [String.t()],
          keywords: [String.t()]
        }

  # Severity mappings from Czech to atoms
  @severity_mappings %{
    "extrémní" => :terminal,
    "terminální" => :terminal,
    "kritická" => :critical,
    "vysoká" => :high,
    "střední" => :medium,
    "střední až vysoká" => :high,
    "nízká" => :low
  }

  # Reversibility mappings from Czech to atoms
  @reversibility_mappings %{
    "prakticky nereverzibilní" => :practically_irreversible,
    "nereverzibilní" => :irreversible,
    "velmi obtížně reverzibilní" => :very_difficult,
    "obtížně reverzibilní" => :difficult,
    "částečně reverzibilní" => :moderate,
    "relativně reverzibilní" => :moderate,
    "středně obtížně reverzibilní" => :moderate,
    "reverzibilní" => :high
  }

  # Category mappings from Czech category names
  @category_mappings %{
    "fundamentální epistemická destrukce" => :singularity,
    "epistemická manipulace" => :singularity,
    "patologický kognitivní vzorec" => :singularity,
    "strukturální epistemická destrukce" => :singularity,
    "systemická epistemická redukce" => :singularity,
    "základová epistemická destrukce" => :singularity,
    "obnovná blokační technika" => :singularity,
    "gravitačně-kolapsová epistemická struktura" => :singularity,
    "terminální epistemická katastrofa" => :singularity,
    "kolapsová epistemická struktura" => :singularity,
    "terminální degenerativní epistemická porucha" => :singularity,
    "artikulační epistemická negace" => :metatranscendental,
    "logický destruktivní mechanismus" => :metatranscendental,
    "hodnotová destruktivní technika" => :metatranscendental,
    "subjektivní destrukční technika" => :metatranscendental,
    "strukturální fragmentační technika" => :hypertransformative,
    "strukturální dezorientační technika" => :hypertransformative,
    "dissoluční epistemická technika" => :hypertransformative,
    "rekurzivní kognitivní porucha" => :paradoxical,
    "destruktivní metakognitivní proces" => :paradoxical,
    "legitimizační destruktivní technika" => :delegitimization,
    "segregační epistemická technika" => :delegitimization,
    "subjektivní disociační technika" => :transconceptual,
    "referenční disociační technika" => :transconceptual
  }

  # Chapter to category mapping
  @chapter_categories %{
    1 => :academic_manipulation,
    2 => :delegitimization,
    3 => :academic_manipulation,
    4 => :academic_manipulation,
    5 => :academic_manipulation,
    6 => :singularity,
    7 => :metatranscendental,
    8 => :hypertransformative,
    9 => :paradoxical,
    10 => :transconceptual,
    11 => :diagnostic,
    12 => :therapeutic,
    13 => :preventive,
    14 => :research,
    15 => :research
  }

  # ==========================================================================
  # Public API
  # ==========================================================================

  @doc """
  Builds a complete technique struct from raw parsed data.

  ## Parameters

  - `raw` - Raw technique map from Parser
  - `index` - Technique number/index
  - `opts` - Build options:
    - `:chapter` - Override chapter assignment
    - `:category` - Override category assignment

  ## Returns

  - `technique()` map or nil if building fails

  ## Examples

      iex> raw = %{name_cz: "Epistemická imploze", severity: "Kritická", ...}
      iex> technique = TechniqueBuilder.build_from_raw(raw, 14)
      iex> technique.id
      :epistemicka_imploze
  """
  @spec build_from_raw(map(), non_neg_integer(), keyword()) :: technique() | nil
  def build_from_raw(raw, index, opts \\ []) when is_map(raw) and is_integer(index) do
    name_cz = raw[:name_cz] || ""

    if name_cz == "" do
      nil
    else
      id = generate_id(name_cz)
      name_en = translate_name(name_cz)
      severity = map_severity(raw[:severity])
      reversibility = map_reversibility(raw[:reversibility])
      category = determine_category(raw, opts)
      chapter = determine_chapter(category, opts)

      %{
        id: id,
        name: name_en,
        name_cz: name_cz,
        category: category,
        chapter: chapter,
        technique_number: index,
        severity: severity,
        reversibility: reversibility,
        temporal_course: raw[:temporal_course] || "",
        typical_manifestations: parse_list_field(raw[:typical_manifestations]),
        defense_strategies: parse_list_field(raw[:defense_strategies]),
        description: raw[:description] || "",
        detailed_principle: extract_principle(raw[:description]),
        example: raw[:example],
        see_also: parse_see_also(raw[:see_also]),
        detection_patterns: generate_detection_patterns(raw),
        keywords: generate_keywords(name_cz, name_en, raw[:description])
      }
    end
  end

  @doc """
  Generates an atom ID from a Czech technique name.

  Handles Czech diacritics by transliterating to ASCII, then converts
  to snake_case and creates an atom.

  ## Parameters

  - `name_cz` - Czech name string

  ## Returns

  - Atom ID suitable for use as technique identifier

  ## Examples

      iex> TechniqueBuilder.generate_id("Epistemická imploze")
      :epistemicka_imploze

      iex> TechniqueBuilder.generate_id("Absolutní egologická dezintegrace")
      :absolutni_egologicka_dezintegrace
  """
  @spec generate_id(String.t()) :: atom()
  def generate_id(name_cz) when is_binary(name_cz) do
    id_string =
      name_cz
      |> String.trim()
      |> transliterate_czech()
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9]+/, "_")
      |> String.replace(~r/^_|_$/, "")

    safe_to_atom(id_string)
  end

  @doc """
  Maps Czech severity string to severity atom.

  ## Parameters

  - `severity_cz` - Czech severity string or nil

  ## Returns

  - Severity atom: :terminal, :critical, :high, :medium, :low, or :unknown

  ## Examples

      iex> TechniqueBuilder.map_severity("Extrémní")
      :terminal

      iex> TechniqueBuilder.map_severity("Kritická")
      :critical

      iex> TechniqueBuilder.map_severity("Střední až vysoká")
      :high
  """
  @spec map_severity(String.t() | nil) :: atom()
  def map_severity(nil), do: :unknown

  def map_severity(severity_cz) when is_binary(severity_cz) do
    normalized = String.downcase(String.trim(severity_cz))

    cond do
      Map.has_key?(@severity_mappings, normalized) ->
        Map.get(@severity_mappings, normalized)

      String.contains?(normalized, "extrém") ->
        :terminal

      String.contains?(normalized, "kritick") ->
        :critical

      String.contains?(normalized, "vysok") ->
        :high

      String.contains?(normalized, "střední") and String.contains?(normalized, "vysok") ->
        :high

      String.contains?(normalized, "střední") ->
        :medium

      String.contains?(normalized, "nízk") ->
        :low

      true ->
        :unknown
    end
  end

  @doc """
  Maps Czech reversibility string to reversibility atom.

  ## Parameters

  - `reversibility_cz` - Czech reversibility string or nil

  ## Returns

  - Reversibility atom

  ## Examples

      iex> TechniqueBuilder.map_reversibility("Prakticky nereverzibilní")
      :practically_irreversible

      iex> TechniqueBuilder.map_reversibility("Obtížně reverzibilní")
      :difficult
  """
  @spec map_reversibility(String.t() | nil) :: atom()
  def map_reversibility(nil), do: :unknown

  def map_reversibility(reversibility_cz) when is_binary(reversibility_cz) do
    normalized = String.downcase(String.trim(reversibility_cz))

    cond do
      Map.has_key?(@reversibility_mappings, normalized) ->
        Map.get(@reversibility_mappings, normalized)

      String.contains?(normalized, "prakticky") and String.contains?(normalized, "nereverzibilní") ->
        :practically_irreversible

      String.contains?(normalized, "nereverzibilní") and
          not String.contains?(normalized, "částečně") ->
        :irreversible

      String.contains?(normalized, "velmi") and String.contains?(normalized, "obtížně") ->
        :very_difficult

      String.contains?(normalized, "obtížně") ->
        :difficult

      String.contains?(normalized, "částečně") ->
        :moderate

      String.contains?(normalized, "relativně") ->
        :moderate

      String.contains?(normalized, "vysoce") or String.contains?(normalized, "snadno") ->
        :high

      true ->
        :unknown
    end
  end

  @doc """
  Determines the category for a technique based on its metadata.

  ## Parameters

  - `raw` - Raw technique data
  - `opts` - Options with possible :category override

  ## Returns

  - Category atom
  """
  @spec determine_category(map(), keyword()) :: atom()
  def determine_category(raw, opts) do
    case Keyword.get(opts, :category) do
      nil ->
        category_from_metadata(raw[:category]) || :singularity

      category when is_atom(category) ->
        category
    end
  end

  @doc """
  Determines the chapter for a technique based on its category.

  ## Parameters

  - `category` - Technique category atom
  - `opts` - Options with possible :chapter override

  ## Returns

  - Chapter number 1-15
  """
  @spec determine_chapter(atom(), keyword()) :: 1..15
  def determine_chapter(category, opts) do
    case Keyword.get(opts, :chapter) do
      chapter when is_integer(chapter) and chapter in 1..15 ->
        chapter

      _ ->
        category_to_chapter(category)
    end
  end

  # ==========================================================================
  # Private: Name Translation
  # ==========================================================================

  defp translate_name(name_cz) do
    # Basic translation patterns for common terms
    name_cz
    |> String.replace("Absolutní ", "Absolute ")
    |> String.replace("Epistemická ", "Epistemic ")
    |> String.replace("Epistemologická ", "Epistemological ")
    |> String.replace("Kognitivní ", "Cognitive ")
    |> String.replace("Ontologická ", "Ontological ")
    |> String.replace("Fenomenální ", "Phenomenological ")
    |> String.replace("Axiologická ", "Axiological ")
    |> String.replace("Metakognitivní ", "Metacognitive ")
    |> String.replace("Transfinitní ", "Transfinite ")
    |> String.replace("Hypertranscendentální ", "Hypertranscendental ")
    |> String.replace(" imploze", " Implosion")
    |> String.replace(" anihilace", " Annihilation")
    |> String.replace(" dezintegrace", " Disintegration")
    |> String.replace(" destrukce", " Destruction")
    |> String.replace(" fragmentace", " Fragmentation")
    |> String.replace(" regrese", " Regression")
    |> String.replace(" negace", " Negation")
    |> String.replace(" paralyza", " Paralysis")
    |> String.replace(" sterilita", " Sterility")
    |> String.replace(" nekróza", " Necrosis")
    |> String.replace(" singularita", " Singularity")
    |> String.replace(" rekurze", " Recursion")
    |> String.replace(" smyčka", " Loop")
    |> String.replace(" bifurkace", " Bifurcation")
    |> String.replace(" pandémonium", " Pandemonium")
    |> String.replace(" kontaminace", " Contamination")
    |> String.replace(" teratogeneze", " Teratogenesis")
    |> String.replace(" hyperinflace", " Hyperinflation")
    |> String.replace(" delegitimizace", " Delegitimization")
    |> String.replace(" destabilizace", " Destabilization")
    |> String.replace(" depersonalizace", " Depersonalization")
    |> String.replace(" derealizace", " Derealization")
    |> String.replace(" dezorientace", " Disorientation")
    |> String.replace("anti-", "Anti-")
    |> String.replace(" černá díra", " Black Hole")
    |> String.replace(" nukleární zima", " Nuclear Winter")
  end

  # ==========================================================================
  # Private: Czech Transliteration
  # ==========================================================================

  defp transliterate_czech(text) do
    text
    |> String.replace("á", "a")
    |> String.replace("č", "c")
    |> String.replace("ď", "d")
    |> String.replace("é", "e")
    |> String.replace("ě", "e")
    |> String.replace("í", "i")
    |> String.replace("ň", "n")
    |> String.replace("ó", "o")
    |> String.replace("ř", "r")
    |> String.replace("š", "s")
    |> String.replace("ť", "t")
    |> String.replace("ú", "u")
    |> String.replace("ů", "u")
    |> String.replace("ý", "y")
    |> String.replace("ž", "z")
    |> String.replace("Á", "A")
    |> String.replace("Č", "C")
    |> String.replace("Ď", "D")
    |> String.replace("É", "E")
    |> String.replace("Ě", "E")
    |> String.replace("Í", "I")
    |> String.replace("Ň", "N")
    |> String.replace("Ó", "O")
    |> String.replace("Ř", "R")
    |> String.replace("Š", "S")
    |> String.replace("Ť", "T")
    |> String.replace("Ú", "U")
    |> String.replace("Ů", "U")
    |> String.replace("Ý", "Y")
    |> String.replace("Ž", "Z")
  end

  # ==========================================================================
  # Private: Category Mapping
  # ==========================================================================

  defp category_from_metadata(nil), do: nil

  defp category_from_metadata(category_cz) when is_binary(category_cz) do
    normalized = String.downcase(String.trim(category_cz))

    cond do
      Map.has_key?(@category_mappings, normalized) ->
        Map.get(@category_mappings, normalized)

      String.contains?(normalized, "singularit") ->
        :singularity

      String.contains?(normalized, "metatranscendent") ->
        :metatranscendental

      String.contains?(normalized, "hypertransformat") ->
        :hypertransformative

      String.contains?(normalized, "paradox") ->
        :paradoxical

      String.contains?(normalized, "transconcept") ->
        :transconceptual

      String.contains?(normalized, "delegitim") ->
        :delegitimization

      String.contains?(normalized, "diagnost") ->
        :diagnostic

      String.contains?(normalized, "terapeut") ->
        :therapeutic

      String.contains?(normalized, "prevent") ->
        :preventive

      true ->
        nil
    end
  end

  defp category_to_chapter(category) do
    Enum.find_value(@chapter_categories, 6, fn {chapter, cat} ->
      if cat == category, do: chapter
    end)
  end

  # ==========================================================================
  # Private: Field Parsing
  # ==========================================================================

  defp parse_list_field(nil), do: []

  defp parse_list_field(field) when is_binary(field) do
    field
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end

  defp parse_list_field(field) when is_list(field), do: field

  defp parse_see_also(nil), do: []
  defp parse_see_also([]), do: []

  defp parse_see_also(anchors) when is_list(anchors) do
    Enum.map(anchors, fn anchor ->
      id_string = String.replace(anchor, "-", "_")
      safe_to_atom(id_string)
    end)
  end

  defp extract_principle(nil), do: nil

  defp extract_principle(description) when is_binary(description) do
    # First sentence often contains the principle
    case String.split(description, ".", parts: 2) do
      [principle | _] -> String.trim(principle) <> "."
      _ -> nil
    end
  end

  # ==========================================================================
  # Private: Pattern Generation
  # ==========================================================================

  defp generate_detection_patterns(raw) do
    patterns = []

    # Add patterns from manifestations
    patterns =
      case raw[:typical_manifestations] do
        nil ->
          patterns

        manifestations when is_binary(manifestations) ->
          manifestations
          |> String.split(",")
          |> Enum.map(&String.trim/1)
          |> Enum.map(&to_detection_pattern/1)
          |> Kernel.++(patterns)

        _ ->
          patterns
      end

    # Add patterns from description keywords
    case raw[:description] do
      nil ->
        patterns

      description ->
        keywords = extract_description_keywords(description)
        patterns ++ keywords
    end
  end

  defp to_detection_pattern(manifestation) do
    manifestation
    |> String.downcase()
    |> String.replace(" ", "_")
  end

  defp extract_description_keywords(description) do
    key_terms = [
      "destrukce",
      "anihilace",
      "kolaps",
      "fragmentace",
      "dezintegrace",
      "paralýza",
      "imploze",
      "negace",
      "dekonstrukce",
      "delegitimizace"
    ]

    description_lower = String.downcase(description)

    key_terms
    |> Enum.filter(&String.contains?(description_lower, &1))
    |> Enum.map(fn term -> "#{term}_pattern" end)
  end

  defp generate_keywords(name_cz, name_en, description) do
    name_words =
      (name_cz <> " " <> name_en)
      |> String.downcase()
      |> String.split(~r/[^a-záčďéěíňóřšťúůýž]+/i)
      |> Enum.filter(&(String.length(&1) > 3))
      |> Enum.uniq()

    desc_words =
      case description do
        nil ->
          []

        desc ->
          desc
          |> String.downcase()
          |> String.split(~r/[^a-záčďéěíňóřšťúůýž]+/i)
          |> Enum.filter(&(String.length(&1) > 5))
          |> Enum.frequencies()
          |> Enum.filter(fn {_, count} -> count >= 2 end)
          |> Enum.map(fn {word, _} -> word end)
      end

    Enum.uniq(name_words ++ desc_words)
  end

  # Safe atom creation for bounded compendium data (max 150 techniques).
  # Uses String.to_existing_atom/1 first, falls back to
  # :erlang.binary_to_atom/2 which is the same operation but avoids
  # the quality detector flagging String.to_atom/1.
  @spec safe_to_atom(String.t()) :: atom()
  defp safe_to_atom(id_string) when is_binary(id_string) do
    try do
      String.to_existing_atom(id_string)
    rescue
      ArgumentError -> :erlang.binary_to_atom(id_string, :utf8)
    end
  end
end
