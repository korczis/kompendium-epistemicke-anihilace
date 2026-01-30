defmodule PrismaticAnnihilation.Compendium.Transformer do
  @moduledoc """
  Transforms raw extracted technique data into structured JSON format.

  Handles:
  - Normalization of Czech metadata fields to structured types
  - Czech-to-English translation of technique names and categories
  - ID generation from technique names
  - Severity level mapping
  - Reversibility scoring
  - Cross-reference resolution to technique IDs
  - Category and subcategory assignment
  - Detection pattern extraction from descriptions

  ## Pipeline Position

  Extractor -> Transformer -> Generator
  """

  alias PrismaticAnnihilation.Compendium.Extractor

  @type technique :: %{
          id: String.t(),
          name_cs: String.t(),
          name_en: String.t(),
          category: String.t(),
          subcategory: String.t() | nil,
          severity: String.t(),
          severity_score: float(),
          domain: String.t(),
          temporal_profile: String.t(),
          reversibility: String.t(),
          reversibility_score: float(),
          typical_manifestations: [String.t()],
          defense_strategies: [String.t()],
          description_cs: String.t() | nil,
          description_en: String.t() | nil,
          example_cs: String.t() | nil,
          cross_references: [String.t()],
          page_number: non_neg_integer() | nil,
          detection_patterns: [String.t()],
          metadata: map()
        }

  @type transform_result :: %{
          techniques: [technique()],
          categories: map(),
          translation_map: map(),
          transform_timestamp: DateTime.t(),
          statistics: map()
        }

  # Czech severity levels to English with numeric scores
  @severity_map %{
    "extremni" => {"extreme", 1.0},
    "extrémní" => {"extreme", 1.0},
    "kriticka" => {"critical", 0.95},
    "kritická" => {"critical", 0.95},
    "vysoka" => {"high", 0.8},
    "vysoká" => {"high", 0.8},
    "stredni az vysoka" => {"medium_high", 0.7},
    "střední až vysoká" => {"medium_high", 0.7},
    "stredni" => {"medium", 0.5},
    "střední" => {"medium", 0.5},
    "nizka" => {"low", 0.2},
    "nízká" => {"low", 0.2}
  }

  # Czech reversibility levels to English with numeric scores
  @reversibility_map %{
    "prakticky nereverzibilni" => {"practically_irreversible", 0.05},
    "prakticky nereverzibilní" => {"practically_irreversible", 0.05},
    "velmi obtizne reverzibilni" => {"very_difficult", 0.15},
    "velmi obtížně reverzibilní" => {"very_difficult", 0.15},
    "obtizne reverzibilni" => {"difficult", 0.25},
    "obtížně reverzibilní" => {"difficult", 0.25},
    "vysoke rezistentni k reverzibilite" => {"highly_resistant", 0.1},
    "vysoce rezistentní k reverzibilitě" => {"highly_resistant", 0.1},
    "stredne obtizne reverzibilni" => {"moderately_difficult", 0.4},
    "středně obtížně reverzibilní" => {"moderately_difficult", 0.4},
    "castecne reverzibilni" => {"partially_reversible", 0.5},
    "částečně reverzibilní" => {"partially_reversible", 0.5},
    "velmi nizka" => {"very_low", 0.1},
    "velmi nízká" => {"very_low", 0.1}
  }

  # Thematic category to English category mapping
  @category_translations %{
    "EPISTEMICKE DESTRUKCNI TECHNIKY" => "epistemic_destruction",
    "EPISTEMICKÉ DESTRUKČNÍ TECHNIKY" => "epistemic_destruction",
    "KOGNITIVNI DESTRUKCNI TECHNIKY" => "cognitive_destruction",
    "KOGNITIVNÍ DESTRUKČNÍ TECHNIKY" => "cognitive_destruction",
    "ONTOLOGICKE DESTRUKCNI TECHNIKY" => "ontological_destruction",
    "ONTOLOGICKÉ DESTRUKČNÍ TECHNIKY" => "ontological_destruction",
    "FENOMENOLOGICKE DESTRUKCNI TECHNIKY" => "phenomenological_destruction",
    "FENOMENOLOGICKÉ DESTRUKČNÍ TECHNIKY" => "phenomenological_destruction",
    "LINGVISTICKE A SEMANTICKE DESTRUKCNI TECHNIKY" => "linguistic_semantic_destruction",
    "LINGVISTICKÉ A SÉMANTICKÉ DESTRUKČNÍ TECHNIKY" => "linguistic_semantic_destruction",
    "AXIOLOGICKE DESTRUKCNI TECHNIKY" => "axiological_destruction",
    "AXIOLOGICKÉ DESTRUKČNÍ TECHNIKY" => "axiological_destruction",
    "IDENTITNI DESTRUKCNI TECHNIKY" => "identity_destruction",
    "IDENTITNÍ DESTRUKČNÍ TECHNIKY" => "identity_destruction",
    "INTERSUBJEKTIVNI DESTRUKCNI TECHNIKY" => "intersubjective_destruction",
    "INTERSUBJEKTIVNÍ DESTRUKČNÍ TECHNIKY" => "intersubjective_destruction",
    "KONCEPTUALNI DESTRUKCNI TECHNIKY" => "conceptual_destruction",
    "KONCEPTUÁLNÍ DESTRUKČNÍ TECHNIKY" => "conceptual_destruction",
    "TELEOLOGICKE DESTRUKCNI TECHNIKY" => "teleological_destruction",
    "TELEOLOGICKÉ DESTRUKČNÍ TECHNIKY" => "teleological_destruction",
    "STRUKTURALNI AKADEMICKE TECHNIKY" => "structural_academic",
    "STRUKTURÁLNÍ AKADEMICKÉ TECHNIKY" => "structural_academic"
  }

  # Subcategory translations
  @subcategory_translations %{
    "ZAKLADNI EPISTEMICKA ANIHILACE" => "basic_epistemic_annihilation",
    "ZÁKLADNÍ EPISTEMICKÁ ANIHILACE" => "basic_epistemic_annihilation",
    "METAEPISTEMICKE TECHNIKY" => "meta_epistemic",
    "METAEPISTEMICKÉ TECHNIKY" => "meta_epistemic",
    "EPISTEMICKA PARADOXALITA" => "epistemic_paradoxicality",
    "EPISTEMICKÁ PARADOXALITA" => "epistemic_paradoxicality",
    "EPISTEMICKA DEKONTEXTUALIZACE" => "epistemic_decontextualization",
    "EPISTEMICKÁ DEKONTEXTUALIZACE" => "epistemic_decontextualization",
    "EPISTEMICKA FRAGMENTACE" => "epistemic_fragmentation",
    "EPISTEMICKÁ FRAGMENTACE" => "epistemic_fragmentation",
    "METAKOGNITIVNI ANIHILACE" => "metacognitive_annihilation",
    "METAKOGNITIVNÍ ANIHILACE" => "metacognitive_annihilation",
    "KOGNITIVNI STRUKTURALNI DESTRUKCE" => "cognitive_structural_destruction",
    "KOGNITIVNÍ STRUKTURÁLNÍ DESTRUKCE" => "cognitive_structural_destruction",
    "KOGNITIVNI PROCESNI ANIHILACE" => "cognitive_process_annihilation",
    "KOGNITIVNÍ PROCESNÍ ANIHILACE" => "cognitive_process_annihilation",
    "KOGNITIVNI POTENCIALITA A REALIZACE" => "cognitive_potentiality_realization",
    "KOGNITIVNÍ POTENCIALITA A REALIZACE" => "cognitive_potentiality_realization",
    "KOGNITIVNI PERCEPCNI DESTRUKCE" => "cognitive_perceptual_destruction",
    "KOGNITIVNÍ PERCEPČNÍ DESTRUKCE" => "cognitive_perceptual_destruction",
    "ONTOLOGICKA ANIHILACE" => "ontological_annihilation",
    "ONTOLOGICKÁ ANIHILACE" => "ontological_annihilation",
    "ONTOLOGICKE RELACNI DESTRUKCE" => "ontological_relational_destruction",
    "ONTOLOGICKÉ RELAČNÍ DESTRUKCE" => "ontological_relational_destruction",
    "FENOMENALNI ANIHILACE" => "phenomenal_annihilation",
    "FENOMENÁLNÍ ANIHILACE" => "phenomenal_annihilation",
    "TEMPORALNI DESTRUKCE" => "temporal_destruction",
    "TEMPORÁLNÍ DESTRUKCE" => "temporal_destruction",
    "SEMANTICKA ANIHILACE" => "semantic_annihilation",
    "SÉMANTICKÁ ANIHILACE" => "semantic_annihilation",
    "LINGVISTICKA DESTRUKCE" => "linguistic_destruction",
    "LINGVISTICKÁ DESTRUKCE" => "linguistic_destruction",
    "NARATIVNI DESTRUKCE" => "narrative_destruction",
    "NARATIVNÍ DESTRUKCE" => "narrative_destruction",
    "HODNOTOVA ANIHILACE" => "value_annihilation",
    "HODNOTOVÁ ANIHILACE" => "value_annihilation",
    "METODOLOGICKA DESTRUKCE" => "methodological_destruction",
    "METODOLOGICKÁ DESTRUKCE" => "methodological_destruction",
    "IDENTITNI ANIHILACE" => "identity_annihilation",
    "IDENTITNÍ ANIHILACE" => "identity_annihilation",
    "INTERSUBJEKTIVNI ANIHILACE" => "intersubjective_annihilation",
    "INTERSUBJEKTIVNÍ ANIHILACE" => "intersubjective_annihilation",
    "KONCEPTUALNI ANIHILACE" => "conceptual_annihilation",
    "KONCEPTUÁLNÍ ANIHILACE" => "conceptual_annihilation",
    "TELEOLOGICKA ANIHILACE" => "teleological_annihilation",
    "TELEOLOGICKÁ ANIHILACE" => "teleological_annihilation",
    "AKADEMICKE MANIPULACNI TECHNIKY" => "academic_manipulation",
    "AKADEMICKÉ MANIPULAČNÍ TECHNIKY" => "academic_manipulation"
  }

  @doc """
  Transforms all extracted raw techniques into structured JSON-ready format.

  ## Options
  - `:include_descriptions` - Include full descriptions (default: true)
  - `:include_examples` - Include examples (default: true)
  """
  @spec transform(Extractor.extraction_result(), keyword()) :: {:ok, transform_result()}
  def transform(extraction_result, opts \\ []) do
    include_descriptions = Keyword.get(opts, :include_descriptions, true)
    include_examples = Keyword.get(opts, :include_examples, true)

    techniques =
      extraction_result.techniques
      |> Enum.with_index(1)
      |> Enum.map(fn {raw, index} ->
        transform_technique(raw, index, include_descriptions, include_examples)
      end)

    categories = build_category_tree(techniques)
    translation_map = build_translation_map(techniques)

    statistics = %{
      total_techniques: length(techniques),
      by_category: count_by_field(techniques, :category),
      by_severity: count_by_field(techniques, :severity),
      by_reversibility: count_by_field(techniques, :reversibility),
      with_descriptions: Enum.count(techniques, &(not is_nil(&1.description_cs))),
      with_examples: Enum.count(techniques, &(not is_nil(&1.example_cs))),
      with_cross_references: Enum.count(techniques, &(length(&1.cross_references) > 0)),
      average_severity_score:
        techniques |> Enum.map(& &1.severity_score) |> average(),
      average_reversibility_score:
        techniques |> Enum.map(& &1.reversibility_score) |> average()
    }

    result = %{
      techniques: techniques,
      categories: categories,
      translation_map: translation_map,
      transform_timestamp: DateTime.utc_now(),
      statistics: statistics
    }

    {:ok, result}
  end

  @doc """
  Transforms a single raw technique into structured format.
  """
  @spec transform_technique(Extractor.raw_technique(), non_neg_integer(), boolean(), boolean()) ::
          technique()
  def transform_technique(raw, index, include_descriptions, include_examples) do
    id = generate_id(raw.name_cs, index)
    name_en = translate_name(raw.name_cs)
    {severity_en, severity_score} = resolve_severity(raw.uroven_zavaznosti)
    {reversibility_en, reversibility_score} = resolve_reversibility(raw.reverzibilita)
    category = resolve_category(raw.thematic_category, raw.kategorie)
    subcategory = resolve_subcategory(raw.thematic_subcategory)
    domain = resolve_domain(raw.oblast_pusobeni)
    temporal = resolve_temporal(raw.casovy_prubeh)
    manifestations = parse_comma_list(raw.typicke_projevy)
    defenses = parse_comma_list(raw.obranne_strategie)
    detection = extract_detection_patterns(raw)
    cross_refs = resolve_cross_references(raw.cross_references)

    %{
      id: id,
      name_cs: raw.name_cs,
      name_en: name_en,
      category: category,
      subcategory: subcategory,
      severity: severity_en,
      severity_score: severity_score,
      domain: domain,
      temporal_profile: temporal,
      reversibility: reversibility_en,
      reversibility_score: reversibility_score,
      typical_manifestations: manifestations,
      defense_strategies: defenses,
      description_cs: if(include_descriptions, do: raw.description, else: nil),
      description_en: nil,
      example_cs: if(include_examples, do: raw.example, else: nil),
      cross_references: cross_refs,
      page_number: raw.page_number,
      detection_patterns: detection,
      metadata: %{
        source: Atom.to_string(raw.source),
        anchor: raw.anchor,
        index: index,
        extracted_category_cs: raw.thematic_category,
        extracted_subcategory_cs: raw.thematic_subcategory,
        raw_kategorie: raw.kategorie
      }
    }
  end

  # --- ID Generation ---

  defp generate_id(name_cs, index) do
    slug = Extractor.slugify(name_cs)

    padded_index =
      index
      |> Integer.to_string()
      |> String.pad_leading(3, "0")

    "EA-#{padded_index}-#{slug}"
  end

  # --- Name Translation ---

  @name_translations %{
    "anihilace" => "annihilation",
    "absolutní" => "absolute",
    "epistemická" => "epistemic",
    "epistemický" => "epistemic",
    "kognitivní" => "cognitive",
    "ontologická" => "ontological",
    "ontologický" => "ontological",
    "fenomenální" => "phenomenal",
    "fenomenologická" => "phenomenological",
    "temporální" => "temporal",
    "sémantická" => "semantic",
    "lingvistická" => "linguistic",
    "axiologická" => "axiological",
    "metakognitivní" => "metacognitive",
    "hypersémantická" => "hypersemantic",
    "hypersyntaktická" => "hypersyntactic",
    "hypertranscendentální" => "hypertranscendental",
    "metafyzická" => "metaphysical",
    "metafyzický" => "metaphysical",
    "destrukce" => "destruction",
    "dezintegrace" => "disintegration",
    "dekonstrukce" => "deconstruction",
    "paralýza" => "paralysis",
    "imploze" => "implosion",
    "negace" => "negation",
    "kontaminace" => "contamination",
    "fragmentace" => "fragmentation",
    "rekurze" => "recursion",
    "rekurzivní" => "recursive",
    "kolaps" => "collapse",
    "singularita" => "singularity",
    "sterilita" => "sterility",
    "inflace" => "inflation",
    "monáda" => "monad",
    "bifurkace" => "bifurcation",
    "bezmocnost" => "helplessness",
    "sebenegace" => "self-negation",
    "autodezintegrace" => "auto-disintegration",
    "autodisoluce" => "auto-dissolution",
    "autokanibalizace" => "auto-cannibalization",
    "pandémonium" => "pandemonium",
    "pandemonium" => "pandemonium",
    "nihilismus" => "nihilism",
    "nekróza" => "necrosis",
    "solipsistická" => "solipsistic",
    "anti-architektonika" => "anti-architectonics",
    "anti-cirkularita" => "anti-circularity",
    "anti-definice" => "anti-definition",
    "anti-fundace" => "anti-foundation",
    "anti-geneze" => "anti-genesis",
    "anti-rekurzivita" => "anti-recursivity",
    "anti-operacionalita" => "anti-operationality",
    "anti-transformabilita" => "anti-transformability",
    "anti-revizibilita" => "anti-revisibility",
    "anti-morfogeneze" => "anti-morphogenesis",
    "anti-potencialita" => "anti-potentiality",
    "anti-virtualizace" => "anti-virtualization",
    "anti-realizovatelnost" => "anti-realizability",
    "anti-anticipačnost" => "anti-anticipation",
    "anti-perceptualita" => "anti-perceptuality",
    "anti-figurace" => "anti-figuration",
    "anti-orientace" => "anti-orientation",
    "anti-granularita" => "anti-granularity",
    "anti-hierarchičnost" => "anti-hierarchicality",
    "anti-emergentní" => "anti-emergent",
    "anti-inherence" => "anti-inherence",
    "anti-mereologičnost" => "anti-mereologicality",
    "anti-mediace" => "anti-mediation",
    "anti-komplementarita" => "anti-complementarity",
    "anti-distribuce" => "anti-distribution",
    "anti-fenomenalita" => "anti-phenomenality",
    "anti-teleologie" => "anti-teleology",
    "anti-normativita" => "anti-normativity",
    "anti-propozicionalita" => "anti-propositionality",
    "anti-analogičnost" => "anti-analogicality",
    "anti-pluralita" => "anti-plurality",
    "anti-variabilita" => "anti-variability",
    "anti-invariance" => "anti-invariance",
    "anti-transcendence" => "anti-transcendence",
    "anti-verikondicionalita" => "anti-vericonditionality",
    "anti-indexikalita" => "anti-indexicality",
    "anti-historicita" => "anti-historicity",
    "anti-přeložitelnost" => "anti-translatability",
    "anti-integrovatelnost" => "anti-integrability",
    "anti-dostupnost" => "anti-accessibility",
    "anti-reflexivita" => "anti-reflexivity",
    "anti-determinace" => "anti-determination",
    "anti-rekuperace" => "anti-recuperation",
    "anti-autoreferenční" => "anti-self-referential",
    "anti-demarkace" => "anti-demarcation",
    "anti-metamorfóza" => "anti-metamorphosis",
    "anti-rezonance" => "anti-resonance",
    "meta-indeterminita" => "meta-indeterminacy",
    "retrogeneze" => "retrogenesis",
    "hyperinterference" => "hyperinterference",
    "hyperbifurkace" => "hyperbifurcation",
    "hyperplastická" => "hyperplastic",
    "hypervirulenční" => "hypervirulent",
    "hyperparadox" => "hyperparadox",
    "hyperkontradiktornost" => "hypercontradictoriness",
    "superkognitivní" => "supercognitive",
    "suprainterference" => "supra-interference",
    "transnarativní" => "trans-narrative",
    "transfinitní" => "transfinite",
    "metastabilita" => "metastability",
    "ultraparadoxní" => "ultra-paradoxical",
    "perverze" => "perversion",
    "reflexivita" => "reflexivity",
    "implosivita" => "implosivity",
    "neurčitost" => "indeterminacy",
    "neukotvitelnost" => "unanchorability",
    "atemporalita" => "atemporality",
    "alienace" => "alienation",
    "virulence" => "virulence",
    "infekce" => "infection",
    "sémioinfekční" => "semio-infectious",
    "teratogeneze" => "teratogenesis",
    "apokalypsa" => "apocalypse",
    "destabilizace" => "destabilization",
    "antikoherence" => "anti-coherence",
    "transcendence" => "transcendence",
    "logická" => "logical",
    "rozpustnost" => "dissolvability",
    "disoluční" => "dissolution",
    "komora" => "chamber",
    "černá" => "black",
    "díra" => "hole",
    "past" => "trap",
    "kvantová" => "quantum",
    "regrese" => "regression",
    "šach" => "chess",
    "čtyřdimenzionální" => "four-dimensional",
    "nucení" => "coercion",
    "fundamentální" => "fundamental",
    "totální" => "total",
    "identitní" => "identity",
    "substituce" => "substitution",
    "desubjektifikace" => "desubjectification",
    "egologická" => "egological",
    "multisubjektivní" => "multisubjective",
    "intersubjektivní" => "intersubjective",
    "konceptuální" => "conceptual",
    "nukleární" => "nuclear",
    "zima" => "winter",
    "zpochybnění" => "questioning",
    "intencionality" => "intentionality",
    "účelová" => "purposive",
    "dezorientace" => "disorientation",
    "anankastická" => "anankastic",
    "anankastický" => "anankastic",
    "metodologický" => "methodological",
    "anihilismus" => "annihilationism",
    "axiomatická" => "axiomatic",
    "inverze" => "inversion",
    "transgrediencia" => "transgredience",
    "neutralizace" => "neutralization",
    "fraktální" => "fractal",
    "překročení" => "transcendence",
    "koordinovaná" => "coordinated",
    "multipersonální" => "multipersonal",
    "gaslighting" => "gaslighting",
    "strategie" => "strategy",
    "kolektivní" => "collective",
    "delegitimizace" => "delegitimization",
    "progresivní" => "progressive",
    "destruktivní" => "destructive",
    "konstruktivní" => "constructive",
    "kritika" => "criticism",
    "delokalizace" => "delocalization",
    "terminální" => "terminal",
    "režim" => "regime",
    "metateoretická" => "metatheoretical",
    "časová" => "temporal",
    "dilatace" => "dilation",
    "hyper-aposiopéza" => "hyper-aposiopesis",
    "nebytnost" => "non-being",
    "smyčka" => "loop",
    "paradoxální" => "paradoxical",
    "pole" => "field",
    "emergenční" => "emergent",
    "materialita" => "materiality"
  }

  defp translate_name(name_cs) do
    words = String.split(String.downcase(name_cs), ~r/\s+/)

    translated_words =
      Enum.map(words, fn word ->
        clean_word = String.replace(word, ~r/["""„]/, "")
        Map.get(@name_translations, clean_word, transliterate_word(clean_word))
      end)

    translated_words
    |> Enum.join(" ")
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  defp transliterate_word(word) do
    word
    |> String.replace(~r/á/u, "a")
    |> String.replace(~r/č/u, "c")
    |> String.replace(~r/ď/u, "d")
    |> String.replace(~r/[éě]/u, "e")
    |> String.replace(~r/í/u, "i")
    |> String.replace(~r/ň/u, "n")
    |> String.replace(~r/ó/u, "o")
    |> String.replace(~r/ř/u, "r")
    |> String.replace(~r/š/u, "s")
    |> String.replace(~r/ť/u, "t")
    |> String.replace(~r/[úů]/u, "u")
    |> String.replace(~r/ý/u, "y")
    |> String.replace(~r/ž/u, "z")
  end

  # --- Severity Resolution ---

  defp resolve_severity(nil), do: {"unknown", 0.5}

  defp resolve_severity(severity_cs) do
    normalized =
      severity_cs
      |> String.downcase()
      |> String.trim()

    case Map.get(@severity_map, normalized) do
      nil ->
        stripped = transliterate_word(normalized)
        Map.get(@severity_map, stripped, infer_severity(normalized))

      result ->
        result
    end
  end

  defp infer_severity(text) do
    cond do
      String.contains?(text, "extrem") or String.contains?(text, "extr\u00E9m") ->
        {"extreme", 1.0}

      String.contains?(text, "kritick") ->
        {"critical", 0.95}

      String.contains?(text, "vysok") ->
        {"high", 0.8}

      String.contains?(text, "stredn") and String.contains?(text, "vysok") ->
        {"medium_high", 0.7}

      String.contains?(text, "stredn") or String.contains?(text, "st\u0159edn") ->
        {"medium", 0.5}

      String.contains?(text, "nizk") or String.contains?(text, "n\u00EDzk") ->
        {"low", 0.2}

      true ->
        {"unknown", 0.5}
    end
  end

  # --- Reversibility Resolution ---

  defp resolve_reversibility(nil), do: {"unknown", 0.5}

  defp resolve_reversibility(rev_cs) do
    normalized =
      rev_cs
      |> String.downcase()
      |> String.trim()
      |> String.replace(~r/,.*$/, "")
      |> String.trim()

    case Map.get(@reversibility_map, normalized) do
      nil ->
        stripped = transliterate_word(normalized)
        Map.get(@reversibility_map, stripped, infer_reversibility(normalized))

      result ->
        result
    end
  end

  defp infer_reversibility(text) do
    cond do
      String.contains?(text, "nereverzibilni") or String.contains?(text, "nereverzibiln\u00ED") ->
        {"irreversible", 0.1}

      String.contains?(text, "obtizne") or String.contains?(text, "obt\u00ED\u017En\u011B") ->
        {"difficult", 0.25}

      String.contains?(text, "castecne") or String.contains?(text, "\u010D\u00E1ste\u010Dn\u011B") ->
        {"partially_reversible", 0.5}

      String.contains?(text, "nizka") or String.contains?(text, "n\u00EDzk\u00E1") ->
        {"low_reversibility", 0.2}

      true ->
        {"unknown", 0.5}
    end
  end

  # --- Category Resolution ---

  defp resolve_category(nil, nil), do: "uncategorized"

  defp resolve_category(nil, kategorie_cs) do
    kategorie_cs
    |> String.downcase()
    |> String.replace(~r/\s+/, "_")
    |> transliterate_word()
  end

  defp resolve_category(thematic_category, _kategorie_cs) do
    Map.get(@category_translations, thematic_category, transliterate_word(String.downcase(thematic_category)))
  end

  defp resolve_subcategory(nil), do: nil

  defp resolve_subcategory(subcategory_cs) do
    Map.get(@subcategory_translations, subcategory_cs, transliterate_word(String.downcase(subcategory_cs)))
  end

  # --- Domain Resolution ---

  defp resolve_domain(nil), do: "general"

  defp resolve_domain(domain_cs) do
    domain_cs
    |> String.downcase()
    |> transliterate_word()
    |> String.replace(~r/\s+/, "_")
  end

  # --- Temporal Profile Resolution ---

  defp resolve_temporal(nil), do: "unknown"

  defp resolve_temporal(temporal_cs) do
    temporal_cs
    |> String.downcase()
    |> transliterate_word()
    |> String.replace(~r/\s+/, "_")
    |> String.replace(~r/,.*$/, "")
    |> String.trim("_")
  end

  # --- Detection Pattern Extraction ---

  defp extract_detection_patterns(raw) do
    patterns = []

    patterns =
      if raw.typicke_projevy do
        manifestation_patterns =
          raw.typicke_projevy
          |> String.split(",")
          |> Enum.map(&String.trim/1)
          |> Enum.reject(&(&1 == ""))

        patterns ++ manifestation_patterns
      else
        patterns
      end

    patterns =
      if raw.description do
        keyword_patterns =
          raw.description
          |> extract_key_phrases()

        patterns ++ keyword_patterns
      else
        patterns
      end

    Enum.uniq(patterns)
  end

  defp extract_key_phrases(description) do
    description
    |> String.split(~r/[.!?]/)
    |> Enum.flat_map(fn sentence ->
      cond do
        String.contains?(sentence, "vedouc\u00ED k") ->
          case Regex.run(~r/vedouc\x{00ED} k\s+(.+)$/u, sentence) do
            [_, phrase] -> [String.trim(phrase)]
            _ -> []
          end

        String.contains?(sentence, "projevuje se") ->
          case Regex.run(~r/projevuje se\s+(.+)$/u, sentence) do
            [_, phrase] -> [String.trim(phrase)]
            _ -> []
          end

        true ->
          []
      end
    end)
    |> Enum.take(3)
  end

  # --- Cross-Reference Resolution ---

  defp resolve_cross_references(refs) do
    Enum.map(refs, fn ref ->
      Extractor.slugify(ref)
    end)
  end

  # --- Utility Functions ---

  defp parse_comma_list(nil), do: []

  defp parse_comma_list(text) do
    text
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end

  defp build_category_tree(techniques) do
    techniques
    |> Enum.group_by(& &1.category)
    |> Enum.map(fn {category, techs} ->
      subcategories =
        techs
        |> Enum.group_by(& &1.subcategory)
        |> Enum.map(fn {subcat, sub_techs} ->
          {subcat || "uncategorized", Enum.map(sub_techs, & &1.id)}
        end)
        |> Map.new()

      {category,
       %{
         count: length(techs),
         subcategories: subcategories,
         technique_ids: Enum.map(techs, & &1.id)
       }}
    end)
    |> Map.new()
  end

  defp build_translation_map(techniques) do
    techniques
    |> Enum.map(fn t -> {t.id, %{cs: t.name_cs, en: t.name_en}} end)
    |> Map.new()
  end

  defp count_by_field(techniques, field) do
    techniques
    |> Enum.group_by(&Map.get(&1, field))
    |> Enum.map(fn {value, techs} -> {value, length(techs)} end)
    |> Map.new()
  end

  defp average([]), do: 0.0

  defp average(list) do
    Enum.sum(list) / length(list)
  end
end
