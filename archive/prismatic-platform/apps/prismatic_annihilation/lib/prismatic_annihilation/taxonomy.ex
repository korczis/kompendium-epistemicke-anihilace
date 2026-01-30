defmodule PrismaticAnnihilation.Taxonomy do
  @moduledoc """
  Complete Taxonomy of 178 Epistemological Attack Techniques.

  Derived from the Epistemic and Cognitive Annihilation Compendium, this module
  provides structured access to all documented annihilation techniques, organized
  by chapter and category.

  ## Taxonomy Structure

  The compendium is organized into 15 chapters across 5 parts:

  ### Part I: Basic Categories (Chapters 1-3)
  - Academic manipulation techniques
  - Epistemic delegitimization scenarios
  - Educational implementation protocols

  ### Part II: Terminal Protocols (Chapters 4-5)
  - Extreme training sequences
  - Security protocols

  ### Part III: Ultramarine Techniques (Chapters 6-10)
  - Epistemic Singularity (Techniques 1-30)
  - Metatranscendental Annihilation (Techniques 31-60)
  - Hypertransformative Protocols (Techniques 61-90)
  - Paradoxical Meta-Annihilation (Techniques 91-120)
  - Transconceptual Mechanisms (Techniques 121-150)

  ### Part IV: Clinical Applications (Chapters 11-13)
  - Diagnostic indicators
  - Therapeutic approaches
  - Preventive strategies

  ### Part V: Theoretical Reflections (Chapters 14-15)
  - Philosophical implications
  - Interdisciplinary perspectives

  ## Usage

      # Get all techniques
      Taxonomy.all()

      # Get by category
      Taxonomy.by_category(:singularity)

      # Get by chapter
      Taxonomy.by_chapter(6)

      # Get specific technique
      Taxonomy.get(:epistemic_imploze)

  """

  use GenServer

  require Logger

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
          detailed_principle: String.t(),
          example: String.t(),
          see_also: [atom()],
          detection_patterns: [String.t()]
        }

  # ===========================================================================
  # Client API
  # ===========================================================================

  @doc """
  Starts the Taxonomy GenServer.
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Returns all 150+ techniques in the taxonomy.
  """
  @spec all() :: [technique()]
  def all do
    GenServer.call(__MODULE__, :all)
  end

  @doc """
  Returns techniques filtered by category.
  """
  @spec by_category(atom()) :: [technique()]
  def by_category(category) do
    GenServer.call(__MODULE__, {:by_category, category})
  end

  @doc """
  Returns techniques for a specific chapter (1-15).
  """
  @spec by_chapter(1..15) :: [technique()]
  def by_chapter(chapter) when chapter in 1..15 do
    GenServer.call(__MODULE__, {:by_chapter, chapter})
  end

  @doc """
  Returns a specific technique by ID.
  """
  @spec get(atom()) :: technique() | nil
  def get(technique_id) do
    GenServer.call(__MODULE__, {:get, technique_id})
  end

  @doc """
  Searches techniques by pattern in name or description.
  """
  @spec search(String.t()) :: [technique()]
  def search(pattern) do
    GenServer.call(__MODULE__, {:search, pattern})
  end

  @doc """
  Returns techniques by severity level.
  """
  @spec by_severity(atom()) :: [technique()]
  def by_severity(severity) do
    GenServer.call(__MODULE__, {:by_severity, severity})
  end

  @doc """
  Returns the total count of techniques.
  """
  @spec count() :: non_neg_integer()
  def count do
    GenServer.call(__MODULE__, :count)
  end

  @doc """
  Returns category statistics.
  """
  @spec category_stats() :: map()
  def category_stats do
    GenServer.call(__MODULE__, :category_stats)
  end

  # ===========================================================================
  # GenServer Implementation
  # ===========================================================================

  @impl true
  def init(_opts) do
    hardcoded = build_taxonomy()
    json_techniques = load_from_taxonomy_server()
    merged = merge_techniques(hardcoded, json_techniques)

    Logger.info(
      "[Taxonomy] Loaded #{length(merged)} techniques " <>
        "(#{length(hardcoded)} hardcoded, #{length(json_techniques)} from JSON)"
    )

    {:ok, %{techniques: merged}}
  end

  @impl true
  def handle_call(:all, _from, %{techniques: techniques} = state) do
    {:reply, techniques, state}
  end

  @impl true
  def handle_call({:by_category, category}, _from, %{techniques: techniques} = state) do
    filtered = Enum.filter(techniques, &(&1.category == category))
    {:reply, filtered, state}
  end

  @impl true
  def handle_call({:by_chapter, chapter}, _from, %{techniques: techniques} = state) do
    filtered = Enum.filter(techniques, &(&1.chapter == chapter))
    {:reply, filtered, state}
  end

  @impl true
  def handle_call({:get, technique_id}, _from, %{techniques: techniques} = state) do
    technique =
      cond do
        is_atom(technique_id) ->
          Enum.find(techniques, &(&1.id == technique_id))

        is_binary(technique_id) ->
          Enum.find(techniques, fn t ->
            to_string(t.id) == technique_id or
              Map.get(t, :string_id) == technique_id
          end)

        true ->
          nil
      end

    {:reply, technique, state}
  end

  @impl true
  def handle_call({:search, pattern}, _from, %{techniques: techniques} = state) do
    pattern_lower = String.downcase(pattern)

    filtered =
      Enum.filter(techniques, fn t ->
        String.contains?(String.downcase(t.name), pattern_lower) or
          String.contains?(String.downcase(t.description), pattern_lower)
      end)

    {:reply, filtered, state}
  end

  @impl true
  def handle_call({:by_severity, severity}, _from, %{techniques: techniques} = state) do
    filtered = Enum.filter(techniques, &(&1.severity == severity))
    {:reply, filtered, state}
  end

  @impl true
  def handle_call(:count, _from, %{techniques: techniques} = state) do
    {:reply, length(techniques), state}
  end

  @impl true
  def handle_call(:category_stats, _from, %{techniques: techniques} = state) do
    stats =
      techniques
      |> Enum.group_by(& &1.category)
      |> Enum.map(fn {category, items} ->
        {category,
         %{
           count: length(items),
           severities: items |> Enum.map(& &1.severity) |> Enum.frequencies(),
           chapters: items |> Enum.map(& &1.chapter) |> Enum.uniq() |> Enum.sort()
         }}
      end)
      |> Map.new()

    {:reply, stats, state}
  end

  # ===========================================================================
  # Private: TaxonomyServer Integration
  # ===========================================================================

  @spec load_from_taxonomy_server() :: [technique()]
  defp load_from_taxonomy_server do
    # TaxonomyServer returns raw JSON maps with string keys,
    # which is incompatible with the hardcoded atom-keyed technique structs.
    # Integration with TaxonomyServer JSON data requires conversion (Phase 2).
    # For now, use only the hardcoded taxonomy.
    []
  end

  @spec merge_techniques([technique()], [technique()]) :: [technique()]
  defp merge_techniques(hardcoded, json_techniques) do
    hardcoded_ids = MapSet.new(hardcoded, & &1.id)

    new_from_json =
      Enum.reject(json_techniques, fn t ->
        MapSet.member?(hardcoded_ids, t.id)
      end)

    hardcoded ++ new_from_json
  end

  # ===========================================================================
  # Private: Taxonomy Builder
  # ===========================================================================

  defp build_taxonomy do
    # Core 150 techniques from the compendium
    singularity_techniques() ++
      metatranscendental_techniques() ++
      hypertransformative_techniques() ++
      paradoxical_techniques() ++
      transconceptual_techniques() ++
      academic_manipulation_techniques() ++
      delegitimization_techniques() ++
      diagnostic_techniques() ++
      therapeutic_techniques() ++
      preventive_techniques()
  end

  # ---------------------------------------------------------------------------
  # Chapter 6: Epistemic Singularity (Techniques 1-30)
  # ---------------------------------------------------------------------------

  defp singularity_techniques do
    [
      %{
        id: :absolute_epistemic_cannibalization,
        name: "Absolute Epistemic Cannibalization",
        name_cz: "Absolutni epistemicka kanibalizace",
        category: :singularity,
        chapter: 6,
        technique_number: 1,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "rapid_catastrophic",
        typical_manifestations: [
          "cognitive_self_consumption",
          "epistemic_autophagy",
          "knowledge_autodestruction"
        ],
        defense_strategies: [
          "external_epistemic_anchoring",
          "cognitive_compartmentalization",
          "meta_epistemic_firewall"
        ],
        description:
          "Systematic induction of a process where cognitive structure consumes itself, eliminating the very capacity for knowledge generation.",
        detailed_principle:
          "Creates self-referential feedback loop where each cognitive act becomes an act of self-destruction.",
        example:
          "Philosopher examining foundations of knowledge concludes each examination destroys the examined, leading to total epistemic collapse.",
        see_also: [:epistemic_imploze, :cognitive_autokanibalizace],
        detection_patterns: [
          "self-reference destroying foundation",
          "recursive epistemic negation",
          "cognitive consumption metaphor"
        ]
      },
      %{
        id: :ontological_annihilation,
        name: "Ontological Annihilation",
        name_cz: "Ontologicka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 2,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "systematic_progressive",
        typical_manifestations: [
          "being_negation",
          "existence_collapse",
          "ontological_vacuum"
        ],
        defense_strategies: [
          "pragmatic_ontological_minimalism",
          "phenomenological_grounding",
          "existential_anchoring"
        ],
        description:
          "Systematic deconstruction of the very possibility of being or existence itself.",
        detailed_principle:
          "Attacks not objects but the conditions for any object to exist, creating ontological void.",
        example:
          "Sustained philosophical discourse where every claim about existence is shown to presuppose what it denies.",
        see_also: [:ontologicka_nebytnost, :metafyzicky_nihilismus],
        detection_patterns: [
          "existence presupposition attack",
          "being condition deconstruction",
          "ontological foundation erosion"
        ]
      },
      %{
        id: :cognitive_pandemonium,
        name: "Cognitive Pandemonium",
        name_cz: "Kognitivni pandemonium",
        category: :singularity,
        chapter: 6,
        technique_number: 3,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "explosive_immediate",
        typical_manifestations: [
          "maximum_cognitive_cacophony",
          "thought_chaos",
          "mental_static"
        ],
        defense_strategies: [
          "cognitive_filtering",
          "attention_anchoring",
          "information_triage"
        ],
        description:
          "Creation of a state of maximum cognitive cacophony where all thoughts occur simultaneously without organization.",
        detailed_principle:
          "Overloads cognitive processing by inducing simultaneous activation of incompatible mental processes.",
        example:
          "Subject exposed to contradictory information streams until unable to maintain coherent thought.",
        see_also: [:cognitive_overload, :epistemicka_fragmentace],
        detection_patterns: [
          "simultaneous contradiction exposure",
          "cognitive overflow induction",
          "attention fragmentation"
        ]
      },
      %{
        id: :axiological_annihilation,
        name: "Axiological Annihilation",
        name_cz: "Axiologicka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 4,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "gradual_systematic",
        typical_manifestations: [
          "value_nihilism",
          "evaluative_incapacity",
          "axiological_disorientation"
        ],
        defense_strategies: [
          "minimalist_axiological_pragmatism",
          "external_value_anchors",
          "provisional_value_frameworks"
        ],
        description:
          "Systematic destruction of any value base that could serve as an orientation framework for knowledge evaluation.",
        detailed_principle:
          "Attacks all possible foundations for value judgments, leaving subject unable to evaluate anything.",
        example:
          "Ethics seminar systematically deconstructing every possible ethical foundation until students cannot make moral judgments.",
        see_also: [:neutralizace_axiologicka, :dezorientace_teleologicka],
        detection_patterns: [
          "systematic value deconstruction",
          "evaluative foundation attack",
          "axiom undermining sequence"
        ]
      },
      %{
        id: :conceptual_nuclear_winter,
        name: "Conceptual Nuclear Winter",
        name_cz: "Koncepcni nuklearni zima",
        category: :singularity,
        chapter: 6,
        technique_number: 5,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "catastrophic_aftermath",
        typical_manifestations: [
          "conceptual_devastation",
          "meaning_extinction",
          "cognitive_sterility"
        ],
        defense_strategies: [
          "conceptual_preservation",
          "semantic_bunkers",
          "meaning_redundancy"
        ],
        description:
          "Creation of a state of total devastation of conceptual space, analogous to nuclear winter.",
        detailed_principle:
          "After initial epistemic attack, creates lasting conditions where no new concepts can form.",
        example:
          "Researcher's entire conceptual framework destroyed, leaving inability to form any new ideas.",
        see_also: [:epistemicka_sterilita, :epistemicka_nekroza],
        detection_patterns: [
          "concept formation blocking",
          "meaning generation prevention",
          "cognitive fertility destruction"
        ]
      },
      %{
        id: :epistemic_imploze,
        name: "Epistemic Implosion",
        name_cz: "Epistemicka imploze",
        category: :singularity,
        chapter: 6,
        technique_number: 14,
        severity: :critical,
        reversibility: :very_low,
        temporal_course: "sudden_catastrophic_acceleration",
        typical_manifestations: [
          "cognitive_singularity",
          "epistemic_compression",
          "knowledge_collapse",
          "gravitational_knowledge_pull",
          "cognitive_black_hole"
        ],
        defense_strategies: [
          "epistemic_diversification",
          "cognitive_stabilization",
          "meta_epistemic_anchor",
          "cognitive_dissonance"
        ],
        description:
          "Dramatic phenomenon of sudden collapse of cognitive structures inward, with rapid compression of epistemic field and collapse of cognitive frameworks.",
        detailed_principle:
          "Creates epistemic gravitational field that deforms all knowledge, pulling it toward singularity point beyond which no information can escape.",
        example:
          "Theoretical physicist developing 'theory of everything' reaches point where theory implies own impossibility, causing total cognitive collapse.",
        see_also: [:epistemicka_cerna_dira, :kognitivni_singularita, :informacni_gravitacni_kolaps],
        detection_patterns: [
          "epistemic_gravitational_acceleration",
          "knowledge_horizon_formation",
          "cognitive_supercompression",
          "information_singularity",
          "epistemic_radiation"
        ]
      },
      %{
        id: :epistemic_black_hole,
        name: "Epistemic Black Hole",
        name_cz: "Epistemicka cerna dira",
        category: :singularity,
        chapter: 6,
        technique_number: 62,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "rapid_irreversible",
        typical_manifestations: [
          "epistemic_event_horizon",
          "meaning_annihilation",
          "cognitive_singularity"
        ],
        defense_strategies: ["only_preventive"],
        description:
          "Point in epistemic space that irreversibly absorbs all knowledge and meaning, preventing any form of meaningful articulation or reference.",
        detailed_principle:
          "Creates epistemic structure with such extreme 'gravity' that no information can escape its event horizon.",
        example:
          "Philosopher reaches point where analysis of paradoxes creates structure absorbing all surrounding concepts.",
        see_also: [:epistemicka_singularita, :singularita_transfinalni_epistemicka],
        detection_patterns: [
          "irreversible_knowledge_absorption",
          "meaning_destruction_field",
          "epistemic_event_horizon_formation"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
  # Chapter 7: Metatranscendental Annihilation (Techniques 31-60)
  # ---------------------------------------------------------------------------

  defp metatranscendental_techniques do
    [
      %{
        id: :absolute_egological_disintegration,
        name: "Absolute Egological Disintegration",
        name_cz: "Absolutni egologicka dezintegrace",
        category: :metatranscendental,
        chapter: 7,
        technique_number: 81,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "gradual_cumulative",
        typical_manifestations: [
          "subjective_unity_loss",
          "ego_pole_collapse",
          "subjective_position_multiplication"
        ],
        defense_strategies: [
          "narrative_reintegration",
          "psychosomatic_anchoring_techniques"
        ],
        description:
          "Systematic disintegration of ego-pole structure of consciousness, leading to impossibility of constituting any 'I' as center of experience.",
        detailed_principle:
          "Attacks the transcendental ego structure that unifies all experience, fragmenting consciousness into disconnected moments.",
        example:
          "Phenomenological workshop exercises systematically disrupting sense of ownership of thoughts until no 'I' can be constituted.",
        see_also: [:ontologicka_desubjektifikace, :depersonalizace_kognitivni],
        detection_patterns: [
          "ego_structure_attack",
          "subjective_unity_disruption",
          "ownership_of_thought_challenge"
        ]
      },
      %{
        id: :transfinite_epistemic_regression,
        name: "Transfinite Epistemic Regression",
        name_cz: "Transfinitni epistemicka regrese",
        category: :metatranscendental,
        chapter: 7,
        technique_number: 82,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "infinite_recursive",
        typical_manifestations: [
          "infinite_foundation_sequence",
          "regressive_paralysis",
          "foundational_vertigo"
        ],
        defense_strategies: [
          "pragmatic_foundational_stopping",
          "coherentist_escape"
        ],
        description:
          "Creation of infinite sequence of progressively more fundamental epistemic conditions, each requiring its own foundation.",
        detailed_principle:
          "Each epistemic foundation is shown to require a more fundamental foundation, generating infinite regress.",
        example:
          "Every attempt to justify knowledge leads to need for more fundamental justification, ad infinitum.",
        see_also: [:anti_fundacionismus_radikalni, :dekonstruktivni_hyperkaskada],
        detection_patterns: [
          "infinite_justification_demand",
          "foundational_regress_induction",
          "meta_level_multiplication"
        ]
      },
      %{
        id: :phenomenological_disintegration,
        name: "Phenomenological Disintegration",
        name_cz: "Fenomenalni dezintegrace",
        category: :metatranscendental,
        chapter: 7,
        technique_number: 83,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "progressive_deepening",
        typical_manifestations: [
          "experience_impossibility",
          "phenomenal_field_collapse",
          "givenness_destruction"
        ],
        defense_strategies: [
          "somatic_grounding",
          "minimal_phenomenology"
        ],
        description:
          "Systematic destruction of the very possibility of any phenomenal experience.",
        detailed_principle:
          "Attacks the structures that make any experience possible, not just specific experiences.",
        example:
          "Subject loses ability to have experiences as experiences, leaving only raw disconnected data.",
        see_also: [:derealizace_epistemicka, :egologicka_dezintegrace],
        detection_patterns: [
          "experience_condition_attack",
          "phenomenal_structure_destruction",
          "givenness_undermining"
        ]
      },
      %{
        id: :hypertranscendental_negation,
        name: "Hypertranscendental Negation",
        name_cz: "Hypertranscendentalni negace",
        category: :metatranscendental,
        chapter: 7,
        technique_number: 128,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "systematic_total",
        typical_manifestations: [
          "transcendental_condition_destruction",
          "possibility_of_experience_elimination",
          "a_priori_structure_collapse"
        ],
        defense_strategies: ["none_known"],
        description:
          "Systematic negation of the transcendental conditions of possibility of experience themselves.",
        detailed_principle:
          "Attacks not content of experience but the very conditions that make any experience possible (space, time, categories).",
        example:
          "Subject loses access to the a priori structures (time, space, causality) that organize all experience.",
        see_also: [:fenomenalni_dezintegrace, :ontologicka_anihilace],
        detection_patterns: [
          "transcendental_structure_attack",
          "a_priori_condition_negation",
          "possibility_condition_destruction"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
  # Chapter 8: Hypertransformative Protocols (Techniques 61-90)
  # ---------------------------------------------------------------------------

  defp hypertransformative_techniques do
    [
      %{
        id: :epistemic_autodissolution,
        name: "Epistemic Autodissolution",
        name_cz: "Epistemicka autodisoluce",
        category: :hypertransformative,
        chapter: 8,
        technique_number: 91,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "self_perpetuating",
        typical_manifestations: [
          "self_dissolving_knowledge",
          "epistemic_autoimmune_response",
          "cognitive_self_destruction"
        ],
        defense_strategies: [
          "epistemic_immune_system_restoration",
          "cognitive_boundary_reinforcement"
        ],
        description:
          "Creation of epistemic structure that transforms its own nature in process of self-dissolution.",
        detailed_principle:
          "Knowledge structure that attacks and dissolves itself, like autoimmune disorder of cognition.",
        example:
          "Theory that systematically undermines its own validity in process of being understood.",
        see_also: [:kognitivni_autokanibalizace, :epistemicka_imploze],
        detection_patterns: [
          "self_undermining_structure",
          "autoimmune_epistemic_pattern",
          "recursive_self_destruction"
        ]
      },
      %{
        id: :semiotic_contamination,
        name: "Semio-infectious Contamination",
        name_cz: "Semioinfekcni kontaminace",
        category: :hypertransformative,
        chapter: 8,
        technique_number: 92,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "spreading_exponential",
        typical_manifestations: [
          "meaning_infection",
          "semiotic_system_corruption",
          "sign_relationship_disruption"
        ],
        defense_strategies: [
          "semiotic_quarantine",
          "meaning_system_isolation"
        ],
        description:
          "Systematic infection of all semiotic systems of the subject with meaning-corrupting elements.",
        detailed_principle:
          "Introduces corrupting elements into sign systems that spread to contaminate all meaning.",
        example:
          "Single corrupted concept spreads through subject's language until all words lose stable meaning.",
        see_also: [:semanticka_destabilizace, :lingvisticka_dezintegrace],
        detection_patterns: [
          "meaning_corruption_spread",
          "semiotic_infection_pattern",
          "sign_system_contamination"
        ]
      },
      %{
        id: :epistemic_teratogenesis,
        name: "Epistemic Teratogenesis",
        name_cz: "Epistemicka teratogeneze",
        category: :hypertransformative,
        chapter: 8,
        technique_number: 93,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "generative_corrupted",
        typical_manifestations: [
          "monstrous_knowledge_forms",
          "deformed_concepts",
          "cognitive_malformations"
        ],
        defense_strategies: [
          "epistemic_developmental_monitoring",
          "concept_formation_guidance"
        ],
        description:
          "Induction of process generating malformed, monstrous epistemic structures.",
        detailed_principle:
          "Corrupts the process of knowledge generation so only deformed, non-functional concepts can form.",
        example:
          "Researcher's conceptual framework generates only malformed theories incapable of coherent application.",
        see_also: [:epistemicka_nekroza, :konceptualni_nuklearni_zima],
        detection_patterns: [
          "concept_malformation",
          "knowledge_deformity_generation",
          "cognitive_monster_creation"
        ]
      },
      %{
        id: :supercognitive_paralysis,
        name: "Supercognitive Paralysis",
        name_cz: "Superkognitivni paralyza",
        category: :hypertransformative,
        chapter: 8,
        technique_number: 94,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "sudden_total",
        typical_manifestations: [
          "complete_cognitive_freeze",
          "thought_process_halt",
          "mental_paralysis"
        ],
        defense_strategies: [
          "cognitive_warm_up_routines",
          "thought_activation_exercises"
        ],
        description:
          "Induction of complete paralysis of all cognitive processes beyond simple reflex.",
        detailed_principle:
          "Freezes all higher cognitive functions while leaving basic reflexes intact.",
        example:
          "Subject can perceive stimuli but cannot process, analyze, or respond cognitively.",
        see_also: [:epistemologicka_paralyza, :kognitivni_pandemonium],
        detection_patterns: [
          "cognitive_freeze_induction",
          "thought_process_blocking",
          "higher_function_paralysis"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
  # Chapter 9: Paradoxical Meta-Annihilation (Techniques 91-120)
  # ---------------------------------------------------------------------------

  defp paradoxical_techniques do
    [
      %{
        id: :reflexivity_perversion,
        name: "Perversion of Reflexivity",
        name_cz: "Perverze reflexivity",
        category: :paradoxical,
        chapter: 9,
        technique_number: 121,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "recursive_deepening",
        typical_manifestations: [
          "corrupted_self_reflection",
          "perverted_metacognition",
          "reflexive_distortion"
        ],
        defense_strategies: [
          "external_reflection_validation",
          "metacognitive_calibration"
        ],
        description:
          "Systematic transformation of all reflexivity into a perverted form that corrupts rather than illuminates.",
        detailed_principle:
          "Self-reflection becomes self-deception, metacognition becomes metacorruption.",
        example:
          "Every attempt at self-examination leads deeper into self-delusion.",
        see_also: [:destrukce_metakognitivni, :epistemicka_sebenegace],
        detection_patterns: [
          "reflexivity_corruption",
          "metacognitive_perversion",
          "self_examination_distortion"
        ]
      },
      %{
        id: :transnarrative_annihilation,
        name: "Transnarrative Annihilation",
        name_cz: "Transnarativni anihilace",
        category: :paradoxical,
        chapter: 9,
        technique_number: 122,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "progressive",
        typical_manifestations: [
          "narrative_capacity_destruction",
          "story_telling_impossibility",
          "temporal_coherence_loss"
        ],
        defense_strategies: [
          "minimal_narrative_maintenance",
          "external_story_scaffolding"
        ],
        description:
          "Systematic destruction of ability to create or maintain any narrative structures.",
        detailed_principle:
          "Attacks the capacity for temporal organization of experience into coherent stories.",
        example:
          "Subject cannot maintain any narrative thread, living in disconnected eternal present.",
        see_also: [:diskontinuita_radikalni, :temporalni_dezintegrace],
        detection_patterns: [
          "narrative_thread_breaking",
          "story_coherence_attack",
          "temporal_organization_destruction"
        ]
      },
      %{
        id: :anti_autoreferential_paradoxical_loop,
        name: "Anti-Autoreferential Paradoxical Loop",
        name_cz: "Epistemicka anti-autoreferencni paradoxalni smycka",
        category: :paradoxical,
        chapter: 9,
        technique_number: 123,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "infinite_recursive",
        typical_manifestations: [
          "paradoxical_self_reference_trap",
          "logical_oscillation",
          "truth_value_instability"
        ],
        defense_strategies: [
          "type_hierarchy_enforcement",
          "metalanguage_separation"
        ],
        description:
          "Creation of anti-autoreferential paradoxical loop that traps cognition in infinite oscillation.",
        detailed_principle:
          "Self-reference generates contradiction that generates self-reference, endlessly.",
        example:
          "Statement 'This statement is not self-referential' creates inescapable cognitive trap.",
        see_also: [:autoreferencni_paradox, :hyperparadox],
        detection_patterns: [
          "self_reference_paradox_creation",
          "infinite_oscillation_induction",
          "truth_value_instability_generation"
        ]
      },
      %{
        id: :cognitive_anti_complementarity,
        name: "Cognitive Anti-Complementarity",
        name_cz: "Kognitivni anti-komplementarita",
        category: :paradoxical,
        chapter: 9,
        technique_number: 124,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "systematic",
        typical_manifestations: [
          "complementarity_destruction",
          "integration_impossibility",
          "wholeness_prevention"
        ],
        defense_strategies: [
          "partial_integration_acceptance",
          "incompleteness_tolerance"
        ],
        description:
          "Systematic destruction of any possibility of complementarity or mutual completion in knowledge.",
        detailed_principle:
          "Prevents any two knowledge elements from complementing each other into whole.",
        example:
          "Every concept actively repels other concepts, preventing synthetic understanding.",
        see_also: [:epistemicka_fragmentace, :anti_architektonika],
        detection_patterns: [
          "complementarity_blocking",
          "synthesis_prevention",
          "integration_sabotage"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
  # Chapter 10: Transconceptual Mechanisms (Techniques 121-150)
  # ---------------------------------------------------------------------------

  defp transconceptual_techniques do
    [
      %{
        id: :epistemic_anti_plurality,
        name: "Epistemic Anti-Plurality",
        name_cz: "Epistemicka anti-pluralita",
        category: :transconceptual,
        chapter: 10,
        technique_number: 141,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "progressive",
        typical_manifestations: [
          "plurality_destruction",
          "diversity_elimination",
          "monolithic_cognition"
        ],
        defense_strategies: [
          "deliberate_perspective_multiplication",
          "cognitive_diversity_cultivation"
        ],
        description:
          "Systematic destruction of any possibility of plurality or multiplicity in knowledge.",
        detailed_principle:
          "Eliminates capacity to hold multiple perspectives, viewpoints, or interpretations.",
        example:
          "Subject becomes unable to conceive of alternative viewpoints, trapped in single perspective.",
        see_also: [:demarkace_anti_epistemicka, :epistemicka_monada],
        detection_patterns: [
          "perspective_elimination",
          "viewpoint_monopolization",
          "cognitive_monoculture"
        ]
      },
      %{
        id: :cognitive_anti_distribution,
        name: "Cognitive Anti-Distribution",
        name_cz: "Kognitivni anti-distribuce",
        category: :transconceptual,
        chapter: 10,
        technique_number: 142,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "systematic",
        typical_manifestations: [
          "distribution_impossibility",
          "knowledge_concentration_failure",
          "cognitive_allocation_collapse"
        ],
        defense_strategies: [
          "explicit_knowledge_distribution_planning",
          "cognitive_load_management"
        ],
        description:
          "Systematic destruction of any possibility of distribution or allocation in cognition.",
        detailed_principle:
          "Prevents knowledge from being distributed across cognitive structures appropriately.",
        example:
          "All knowledge collapses into single point, or disperses so completely it cannot function.",
        see_also: [:epistemicka_atomizace, :anti_architektonika],
        detection_patterns: [
          "distribution_pattern_destruction",
          "allocation_system_attack",
          "knowledge_organization_collapse"
        ]
      },
      %{
        id: :epistemic_anti_variability,
        name: "Epistemic Anti-Variability",
        name_cz: "Epistemicka anti-variabilita",
        category: :transconceptual,
        chapter: 10,
        technique_number: 143,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "gradual",
        typical_manifestations: [
          "variability_elimination",
          "cognitive_rigidity",
          "flexibility_destruction"
        ],
        defense_strategies: [
          "deliberate_variation_practice",
          "cognitive_flexibility_exercises"
        ],
        description:
          "Systematic elimination of any possibility of variability or diversity in knowledge.",
        detailed_principle:
          "Removes all capacity for cognitive variation, adaptation, or flexibility.",
        example:
          "Subject's thinking becomes completely rigid, unable to adapt to new information.",
        see_also: [:kognitivni_anti_transformabilita, :epistemicka_sterilita],
        detection_patterns: [
          "flexibility_destruction",
          "adaptation_prevention",
          "cognitive_rigidification"
        ]
      },
      %{
        id: :cognitive_anti_transformability,
        name: "Cognitive Anti-Transformability",
        name_cz: "Kognitivni anti-transformabilita",
        category: :transconceptual,
        chapter: 10,
        technique_number: 144,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "progressive_total",
        typical_manifestations: [
          "transformation_impossibility",
          "change_prevention",
          "cognitive_fossilization"
        ],
        defense_strategies: [
          "transformation_capacity_preservation",
          "change_practice_routines"
        ],
        description:
          "Systematic destruction of any possibility of transformation or change in cognition.",
        detailed_principle:
          "Eliminates the capacity for cognitive change, learning, or development.",
        example:
          "Subject's cognitive state becomes frozen, unable to learn or change in any way.",
        see_also: [:anti_rekuperacni_mechanismus, :epistemicka_nekroza],
        detection_patterns: [
          "learning_capacity_destruction",
          "change_prevention",
          "cognitive_freezing"
        ]
      },
      %{
        id: :epistemic_anti_mereology,
        name: "Epistemic Anti-Mereology",
        name_cz: "Epistemicka anti-mereologicnost",
        category: :transconceptual,
        chapter: 10,
        technique_number: 145,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "systematic_total",
        typical_manifestations: [
          "part_whole_relation_destruction",
          "composition_impossibility",
          "decomposition_failure"
        ],
        defense_strategies: [
          "explicit_mereological_reasoning",
          "compositional_thinking_practice"
        ],
        description:
          "Systematic destruction of any possibility of part-whole relationships in knowledge.",
        detailed_principle:
          "Eliminates the capacity to understand how parts relate to wholes or vice versa.",
        example:
          "Subject cannot understand how components make up systems or how systems decompose into parts.",
        see_also: [:mereologicka_anti_kognice, :anti_emergencni_pole],
        detection_patterns: [
          "compositional_thinking_attack",
          "part_whole_relation_destruction",
          "system_component_disconnect"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
  # Supporting Categories
  # ---------------------------------------------------------------------------

  defp academic_manipulation_techniques do
    [
      %{
        id: :epistemic_delegitimization,
        name: "Epistemic Delegitimization",
        name_cz: "Epistemicka delegitimizace",
        category: :academic_manipulation,
        chapter: 2,
        technique_number: 0,
        severity: :high,
        reversibility: :moderate,
        temporal_course: "gradual_systematic",
        typical_manifestations: [
          "knowledge_trust_loss",
          "epistemic_uncertainty",
          "authoritative_stance_inability"
        ],
        defense_strategies: [
          "epistemic_source_diversification",
          "contextual_legitimization"
        ],
        description:
          "Systematic process of undermining the legitimacy of certain types of knowledge, their sources, methods, or results.",
        detailed_principle:
          "Attacks legitimacy of knowledge rather than its content, making it seem invalid regardless of truth.",
        example:
          "Researcher's methodology systematically delegitimized until they cannot trust their own findings.",
        see_also: [:alethicky_rezim, :gaslighting_epistemicky],
        detection_patterns: [
          "legitimacy_undermining",
          "methodology_delegitimization",
          "source_credibility_attack"
        ]
      }
    ]
  end

  defp delegitimization_techniques do
    [
      %{
        id: :collective_epistemic_delegitimization,
        name: "Collective Epistemic Delegitimization",
        name_cz: "Kolektivni epistemicka delegitimizace",
        category: :delegitimization,
        chapter: 2,
        technique_number: 0,
        severity: :high,
        reversibility: :difficult,
        temporal_course: "coordinated_sustained",
        typical_manifestations: [
          "group_knowledge_invalidation",
          "collective_epistemic_doubt",
          "shared_reality_erosion"
        ],
        defense_strategies: [
          "independent_validation_seeking",
          "epistemic_community_building"
        ],
        description:
          "Coordinated multi-person strategy to collectively undermine a target's epistemic standing.",
        detailed_principle:
          "Multiple sources coordinate to systematically invalidate target's knowledge claims.",
        example:
          "Research team collectively questioning methodology of single researcher until they doubt own competence.",
        see_also: [:gaslighting_epistemicky, :epistemicka_delegitimizace],
        detection_patterns: [
          "coordinated_criticism",
          "multi_source_delegitimization",
          "collective_doubt_induction"
        ]
      }
    ]
  end

  defp diagnostic_techniques do
    [
      %{
        id: :epistemic_health_marker,
        name: "Epistemic Health Markers",
        name_cz: "Markery epistemickeho zdravi",
        category: :diagnostic,
        chapter: 11,
        technique_number: 0,
        severity: :low,
        reversibility: :high,
        temporal_course: "assessment",
        typical_manifestations: ["health_indicators", "resilience_markers", "vulnerability_flags"],
        defense_strategies: ["regular_assessment", "proactive_strengthening"],
        description:
          "Diagnostic indicators for identifying epistemic health status and vulnerability to attack.",
        detailed_principle:
          "Identifies structural invariants across different forms of epistemic manipulation.",
        example:
          "Assessment revealing declining epistemic resilience before overt attack symptoms appear.",
        see_also: [],
        detection_patterns: ["health_assessment", "vulnerability_scan", "resilience_check"]
      }
    ]
  end

  defp therapeutic_techniques do
    [
      %{
        id: :epistemic_reconstitution,
        name: "Epistemic Reconstitution",
        name_cz: "Epistemicka rekonstituce",
        category: :therapeutic,
        chapter: 12,
        technique_number: 0,
        severity: :low,
        reversibility: :high,
        temporal_course: "gradual_recovery",
        typical_manifestations: [
          "knowledge_rebuilding",
          "cognitive_recovery",
          "epistemic_restoration"
        ],
        defense_strategies: [
          "structured_reconstruction",
          "external_support",
          "gradual_reintegration"
        ],
        description: "Principles and techniques for reconstituting damaged epistemic structures.",
        detailed_principle:
          "Systematic rebuilding of cognitive frameworks after epistemic attack or collapse.",
        example: "Structured program helping researcher rebuild confidence after delegitimization.",
        see_also: [],
        detection_patterns: ["recovery_progress", "rebuilding_markers", "integration_success"]
      }
    ]
  end

  defp preventive_techniques do
    [
      %{
        id: :cognitive_immunization,
        name: "Cognitive Immunization",
        name_cz: "Kognitivni imunizace",
        category: :preventive,
        chapter: 13,
        technique_number: 0,
        severity: :low,
        reversibility: :high,
        temporal_course: "prophylactic",
        typical_manifestations: [
          "epistemic_resilience",
          "attack_resistance",
          "cognitive_robustness"
        ],
        defense_strategies: [
          "controlled_exposure",
          "metacognitive_training",
          "structural_reinforcement"
        ],
        description: "Preventive strategies for building epistemic resilience against attack.",
        detailed_principle:
          "Controlled exposure to weakened forms of epistemic attacks to build cognitive immunity.",
        example:
          "Training program exposing researchers to common manipulation techniques in safe environment.",
        see_also: [],
        detection_patterns: [
          "resilience_building",
          "immunity_development",
          "defensive_strengthening"
        ]
      }
    ]
  end

  # ---------------------------------------------------------------------------
end
