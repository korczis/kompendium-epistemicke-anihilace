defmodule PrismaticAnnihilation.Taxonomy.Chapter6Expansion do
  @moduledoc """
  Expanded Epistemic Singularity techniques (Chapter 6, Techniques 6-30).

  Supplements the original 7 singularity techniques with 23 additional techniques
  to complete the full 30-technique chapter as specified in the compendium.
  """

  @doc """
  Returns the 23 additional singularity techniques (techniques 6-30).
  """
  @spec techniques() :: [map()]
  def techniques do
    [
      %{
        id: :semantic_apocalypse,
        name: "Semantic Apocalypse",
        name_cz: "Semanticka apokalypsa",
        category: :singularity,
        chapter: 6,
        technique_number: 6,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "catastrophic_total",
        typical_manifestations: [
          "total_meaning_collapse",
          "semiotic_extinction",
          "referential_annihilation"
        ],
        defense_strategies: [
          "semantic_redundancy_systems",
          "meaning_backup_protocols",
          "referential_anchoring"
        ],
        description:
          "Total and irreversible destruction of all meaning-generating capacity within a cognitive system.",
        detailed_principle:
          "Induces cascade failure across all semantic networks simultaneously, eliminating the possibility of any sign referring to any referent.",
        example:
          "Linguist studying meaning discovers that every definition presupposes the very meaning it tries to define, causing total semiotic collapse.",
        see_also: [:conceptual_nuclear_winter, :semiotic_contamination],
        detection_patterns: [
          "total meaning system failure",
          "referential chain collapse",
          "semiotic extinction event"
        ]
      },
      %{
        id: :cognitive_fractal_disintegration,
        name: "Cognitive Fractal Disintegration",
        name_cz: "Kognitivni fraktalni dezintegrace",
        category: :singularity,
        chapter: 6,
        technique_number: 7,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "recursive_accelerating",
        typical_manifestations: [
          "self_similar_cognitive_breakdown",
          "fractal_thought_fragmentation",
          "scale_invariant_disintegration"
        ],
        defense_strategies: [
          "cognitive_scale_anchoring",
          "fractal_boundary_enforcement",
          "recursive_depth_limiting"
        ],
        description:
          "Disintegration of cognitive structures that replicates itself at every scale of analysis, creating self-similar patterns of breakdown.",
        detailed_principle:
          "Each attempt to analyze the breakdown reveals the same pattern at a smaller scale, making repair impossible at any level.",
        example:
          "Mathematician's proof collapses, and each sub-proof shows the same structural failure, infinitely deep.",
        see_also: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        detection_patterns: [
          "self-similar breakdown pattern",
          "scale-invariant cognitive failure",
          "recursive disintegration signature"
        ]
      },
      %{
        id: :transfinite_epistemic_singularity,
        name: "Transfinite Epistemic Singularity",
        name_cz: "Transfinitni epistemicka singularita",
        category: :singularity,
        chapter: 6,
        technique_number: 8,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "instantaneous_total",
        typical_manifestations: [
          "transfinite_cognitive_collapse",
          "ordinal_knowledge_compression",
          "cantorian_epistemic_paradox"
        ],
        defense_strategies: [
          "finitary_epistemic_constraints",
          "constructivist_foundations",
          "predicative_reasoning_limits"
        ],
        description:
          "Creation of a singularity point where epistemic structures compress beyond all transfinite ordinals into a single undifferentiated point.",
        detailed_principle:
          "Exploits the structure of transfinite hierarchies to create a collapse point where all levels of knowledge merge into indistinguishable unity.",
        example:
          "Set theorist discovers that the hierarchy of knowledge levels collapses into a single undifferentiated point when examined self-referentially.",
        see_also: [:epistemic_black_hole, :epistemic_imploze],
        detection_patterns: [
          "transfinite hierarchy collapse",
          "ordinal compression signature",
          "cantorian paradox activation"
        ]
      },
      %{
        id: :epistemic_necrosis,
        name: "Epistemic Necrosis",
        name_cz: "Epistemicka nekroza",
        category: :singularity,
        chapter: 6,
        technique_number: 9,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "progressive_irreversible",
        typical_manifestations: [
          "knowledge_tissue_death",
          "cognitive_gangrene",
          "epistemic_decomposition"
        ],
        defense_strategies: [
          "epistemic_circulation_maintenance",
          "cognitive_vitality_monitoring",
          "knowledge_debridement"
        ],
        description:
          "Progressive death of epistemic structures analogous to tissue necrosis, spreading from initial site of damage.",
        detailed_principle:
          "Damaged knowledge structures release toxic byproducts that poison neighboring structures, creating expanding zone of dead cognition.",
        example:
          "One refuted core belief causes progressive decay spreading to all connected beliefs until entire knowledge domain is dead.",
        see_also: [:conceptual_nuclear_winter, :epistemic_autodissolution],
        detection_patterns: [
          "progressive knowledge death",
          "cognitive necrotic spread",
          "epistemic decomposition markers"
        ]
      },
      %{
        id: :epistemic_atomization,
        name: "Epistemic Atomization",
        name_cz: "Epistemicka atomizace",
        category: :singularity,
        chapter: 6,
        technique_number: 10,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "explosive_dispersive",
        typical_manifestations: [
          "knowledge_fragmentation",
          "belief_scattering",
          "conceptual_disassembly"
        ],
        defense_strategies: [
          "conceptual_bonding_reinforcement",
          "knowledge_lattice_strengthening",
          "epistemic_cohesion_protocols"
        ],
        description:
          "Complete fragmentation of knowledge into isolated atomic units that cannot recombine into meaningful structures.",
        detailed_principle:
          "Destroys all connective tissue between knowledge elements, reducing cognition to disconnected atomic facts with no relational capacity.",
        example:
          "Scholar knows thousands of facts but cannot connect any two into a meaningful relationship or inference.",
        see_also: [:cognitive_pandemonium, :epistemic_anti_mereology],
        detection_patterns: [
          "knowledge connection severing",
          "conceptual bond destruction",
          "relational capacity elimination"
        ]
      },
      %{
        id: :absolute_cognitive_vacuum,
        name: "Absolute Cognitive Vacuum",
        name_cz: "Absolutni kognitivni vakuum",
        category: :singularity,
        chapter: 6,
        technique_number: 11,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "sudden_total",
        typical_manifestations: [
          "complete_thought_absence",
          "cognitive_void",
          "mental_nothingness"
        ],
        defense_strategies: [
          "cognitive_pressure_maintenance",
          "thought_generation_redundancy",
          "external_cognitive_scaffolding"
        ],
        description:
          "Creation of a complete vacuum in cognitive space where no thought, concept, or mental content can exist.",
        detailed_principle:
          "Removes all cognitive content and simultaneously destroys the capacity to generate new content, creating true mental void.",
        example:
          "Subject reaches state where not even the awareness of absence remains, a cognitive vacuum more complete than unconsciousness.",
        see_also: [:ontological_annihilation, :conceptual_nuclear_winter],
        detection_patterns: [
          "complete cognitive emptying",
          "thought generation failure",
          "mental content extinction"
        ]
      },
      %{
        id: :hyperparadoxical_singularity,
        name: "Hyperparadoxical Singularity",
        name_cz: "Hyperparadoxalni singularita",
        category: :singularity,
        chapter: 6,
        technique_number: 12,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "instantaneous_recursive",
        typical_manifestations: [
          "paradox_density_infinite",
          "logical_spacetime_collapse",
          "reason_event_horizon"
        ],
        defense_strategies: [
          "paraconsistent_logic_adoption",
          "paradox_tolerance_training",
          "logical_pluralism"
        ],
        description:
          "Convergence point where infinite paradoxes collapse into a single point of maximum logical density.",
        detailed_principle:
          "Generates paradoxes that generate further paradoxes at accelerating rates until logical space itself collapses into a singularity.",
        example:
          "Logician encounters paradox whose resolution generates two new paradoxes, each generating two more, until reason itself collapses.",
        see_also: [:anti_autoreferential_paradoxical_loop, :epistemic_black_hole],
        detection_patterns: [
          "paradox multiplication cascade",
          "logical density increase",
          "reason collapse acceleration"
        ]
      },
      %{
        id: :metacognitive_implosion,
        name: "Metacognitive Implosion",
        name_cz: "Metakognitivni imploze",
        category: :singularity,
        chapter: 6,
        technique_number: 13,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "recursive_catastrophic",
        typical_manifestations: [
          "self_awareness_collapse",
          "metacognitive_recursion_failure",
          "thinking_about_thinking_destruction"
        ],
        defense_strategies: [
          "metacognitive_depth_limits",
          "reflection_circuit_breakers",
          "external_metacognitive_support"
        ],
        description:
          "Collapse of all metacognitive capacity, destroying the ability to think about thinking.",
        detailed_principle:
          "Each level of metacognitive reflection collapses the level below it, creating cascading implosion of self-awareness.",
        example:
          "Psychologist studying self-awareness finds each examination of awareness destroys the awareness being examined.",
        see_also: [:epistemic_imploze, :reflexivity_perversion],
        detection_patterns: [
          "metacognitive cascade failure",
          "self-awareness recursion collapse",
          "reflection depth implosion"
        ]
      },
      %{
        id: :ontological_event_horizon,
        name: "Ontological Event Horizon",
        name_cz: "Ontologicky horizont udalosti",
        category: :singularity,
        chapter: 6,
        technique_number: 15,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "progressive_irreversible",
        typical_manifestations: [
          "being_boundary_formation",
          "existence_escape_impossibility",
          "ontological_point_of_no_return"
        ],
        defense_strategies: [
          "ontological_distance_maintenance",
          "being_trajectory_monitoring",
          "existential_escape_velocity"
        ],
        description:
          "Formation of a boundary in ontological space beyond which no recovery of being or existence is possible.",
        detailed_principle:
          "Creates an ontological boundary analogous to a black hole event horizon, beyond which all being collapses inward irreversibly.",
        example:
          "Existentialist philosopher crosses point in nihilistic analysis from which no affirmation of existence can return.",
        see_also: [:ontological_annihilation, :epistemic_black_hole],
        detection_patterns: [
          "ontological boundary formation",
          "being collapse trajectory",
          "existential point of no return"
        ]
      },
      %{
        id: :cognitive_entropy_maximization,
        name: "Cognitive Entropy Maximization",
        name_cz: "Maximalizace kognitivni entropie",
        category: :singularity,
        chapter: 6,
        technique_number: 16,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "thermodynamic_progressive",
        typical_manifestations: [
          "cognitive_heat_death",
          "thought_disorder_maximum",
          "mental_equilibrium_destruction"
        ],
        defense_strategies: [
          "cognitive_negentropy_injection",
          "thought_ordering_protocols",
          "mental_structure_reinforcement"
        ],
        description:
          "Systematic increase of cognitive entropy to maximum, analogous to thermodynamic heat death of the universe.",
        detailed_principle:
          "Increases disorder in cognitive systems until all mental structures reach maximum entropy and no useful thought can be extracted.",
        example:
          "Information theorist realizes all their organized knowledge is trending toward maximum disorder with no way to reverse the process.",
        see_also: [:cognitive_pandemonium, :epistemic_atomization],
        detection_patterns: [
          "cognitive disorder increase",
          "thought entropy acceleration",
          "mental structure degradation"
        ]
      },
      %{
        id: :epistemic_chain_reaction,
        name: "Epistemic Chain Reaction",
        name_cz: "Epistemicka retezova reakce",
        category: :singularity,
        chapter: 6,
        technique_number: 17,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "explosive_cascading",
        typical_manifestations: [
          "belief_fission_cascade",
          "knowledge_critical_mass",
          "epistemic_meltdown"
        ],
        defense_strategies: [
          "epistemic_containment_barriers",
          "belief_moderation_rods",
          "knowledge_compartmentalization"
        ],
        description:
          "Self-sustaining chain reaction of epistemic destruction where each destroyed belief releases energy to destroy neighboring beliefs.",
        detailed_principle:
          "Once critical mass of doubt is reached, each collapsing belief destabilizes connected beliefs in self-sustaining cascade.",
        example:
          "Refutation of single foundational axiom triggers cascade that systematically destroys every dependent belief.",
        see_also: [:epistemic_necrosis, :cognitive_fractal_disintegration],
        detection_patterns: [
          "belief cascade initiation",
          "epistemic critical mass approach",
          "knowledge fission signature"
        ]
      },
      %{
        id: :noetic_annihilation,
        name: "Noetic Annihilation",
        name_cz: "Noeticka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 18,
        severity: :terminal,
        reversibility: :irreversible,
        temporal_course: "total_instantaneous",
        typical_manifestations: [
          "intellection_destruction",
          "noesis_elimination",
          "pure_thought_extinction"
        ],
        defense_strategies: [
          "noetic_diversification",
          "intellective_redundancy",
          "pure_thought_preservation"
        ],
        description:
          "Destruction of the capacity for noesis, the pure intellectual apprehension that underlies all knowledge.",
        detailed_principle:
          "Attacks the most fundamental layer of cognition, the act of intellectual apprehension itself, not any specific content.",
        example:
          "Subject retains sensory input and memory but loses the capacity to intellectually apprehend or understand anything.",
        see_also: [:absolute_cognitive_vacuum, :ontological_annihilation],
        detection_patterns: [
          "intellection capacity loss",
          "noetic function elimination",
          "apprehension mechanism failure"
        ]
      },
      %{
        id: :epistemological_paralysis,
        name: "Epistemological Paralysis",
        name_cz: "Epistemologicka paralyza",
        category: :singularity,
        chapter: 6,
        technique_number: 19,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "gradual_total",
        typical_manifestations: [
          "knowledge_justification_freeze",
          "epistemic_decision_inability",
          "cognitive_action_block"
        ],
        defense_strategies: [
          "pragmatic_epistemic_defaults",
          "justified_true_belief_shortcuts",
          "action_oriented_epistemology"
        ],
        description:
          "Complete paralysis of all epistemological functions, leaving the subject unable to form, evaluate, or act on any knowledge claim.",
        detailed_principle:
          "Every possible epistemic action is blocked by equally valid counter-considerations, creating total decisional paralysis.",
        example:
          "Philosopher cannot determine whether any proposition is true, false, or even meaningful, freezing all intellectual activity.",
        see_also: [:supercognitive_paralysis, :axiological_annihilation],
        detection_patterns: [
          "epistemic decision paralysis",
          "justification system freeze",
          "knowledge action blocking"
        ]
      },
      %{
        id: :hermeneutic_annihilation,
        name: "Hermeneutic Annihilation",
        name_cz: "Hermeneuticka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 20,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "progressive_deepening",
        typical_manifestations: [
          "interpretation_impossibility",
          "meaning_circle_collapse",
          "understanding_destruction"
        ],
        defense_strategies: [
          "minimal_hermeneutic_circle",
          "interpretation_anchoring",
          "pre_understanding_preservation"
        ],
        description:
          "Destruction of the hermeneutic capacity, eliminating all possibility of interpretation and understanding.",
        detailed_principle:
          "Collapses the hermeneutic circle by destroying the pre-understanding necessary for any interpretation to begin.",
        example:
          "Literary critic loses all capacity for interpretation when every reading reveals only the impossibility of reading.",
        see_also: [:semantic_apocalypse, :phenomenological_disintegration],
        detection_patterns: [
          "interpretation capacity destruction",
          "hermeneutic circle collapse",
          "understanding precondition elimination"
        ]
      },
      %{
        id: :alethic_annihilation,
        name: "Alethic Annihilation",
        name_cz: "Aleticka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 21,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "systematic_total",
        typical_manifestations: [
          "truth_concept_destruction",
          "veridical_capacity_elimination",
          "alethic_void"
        ],
        defense_strategies: [
          "deflationary_truth_theory",
          "pragmatic_truth_criteria",
          "correspondence_anchoring"
        ],
        description:
          "Complete destruction of the concept of truth and all truth-evaluative capacities.",
        detailed_principle:
          "Eliminates not just specific truths but the very concept and capacity for truth evaluation in all its forms.",
        example:
          "Philosopher destroys every theory of truth, leaving subject unable to distinguish true from false in any context.",
        see_also: [:axiological_annihilation, :epistemic_delegitimization],
        detection_patterns: [
          "truth concept deconstruction",
          "veridical capacity attack",
          "alethic framework destruction"
        ]
      },
      %{
        id: :doxastic_annihilation,
        name: "Doxastic Annihilation",
        name_cz: "Doxasticka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 22,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "progressive_complete",
        typical_manifestations: [
          "belief_formation_impossibility",
          "doxastic_state_elimination",
          "propositional_attitude_destruction"
        ],
        defense_strategies: [
          "basic_belief_preservation",
          "doxastic_minimal_set",
          "belief_formation_protection"
        ],
        description:
          "Systematic elimination of all belief-forming capacities, leaving subject unable to hold any propositional attitudes.",
        detailed_principle:
          "Attacks the mechanisms by which beliefs form, not the beliefs themselves, preventing any new belief from being generated.",
        example:
          "Subject cannot believe, disbelieve, doubt, or suspend judgment on any proposition, experiencing total doxastic void.",
        see_also: [:epistemological_paralysis, :noetic_annihilation],
        detection_patterns: [
          "belief formation mechanism attack",
          "doxastic capacity elimination",
          "propositional attitude destruction"
        ]
      },
      %{
        id: :cognitive_autokanibalizace,
        name: "Cognitive Autocannibalization",
        name_cz: "Kognitivni autokanibalizace",
        category: :singularity,
        chapter: 6,
        technique_number: 23,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "self_consuming_progressive",
        typical_manifestations: [
          "thought_self_consumption",
          "cognitive_autophagy",
          "mental_self_digestion"
        ],
        defense_strategies: [
          "cognitive_boundary_separation",
          "self_reference_limits",
          "metacognitive_circuit_breakers"
        ],
        description:
          "Process where cognitive structures systematically consume themselves, each thought becoming fuel for its own destruction.",
        detailed_principle:
          "Self-referential feedback transforms every cognitive act into an act of self-destruction, consuming cognitive resources irreversibly.",
        example:
          "Each time the subject thinks about their thinking, the act of reflection consumes the thought being reflected upon.",
        see_also: [:absolute_epistemic_cannibalization, :metacognitive_implosion],
        detection_patterns: [
          "cognitive self-consumption loop",
          "thought autophagy signature",
          "reflexive destruction pattern"
        ]
      },
      %{
        id: :epistemic_radiation_poisoning,
        name: "Epistemic Radiation Poisoning",
        name_cz: "Epistemicka radiacni otrava",
        category: :singularity,
        chapter: 6,
        technique_number: 24,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "delayed_progressive",
        typical_manifestations: [
          "knowledge_mutation",
          "epistemic_cell_death",
          "cognitive_dna_damage"
        ],
        defense_strategies: [
          "epistemic_shielding",
          "knowledge_repair_mechanisms",
          "cognitive_decontamination"
        ],
        description:
          "Exposure to toxic epistemic content that causes delayed but progressive damage to all cognitive structures.",
        detailed_principle:
          "Like radiation, damages the generative mechanisms of cognition so that new knowledge is malformed and existing knowledge degrades.",
        example:
          "Researcher exposed to fundamentally corrupting idea that slowly damages all subsequent reasoning over weeks.",
        see_also: [:epistemic_necrosis, :semiotic_contamination],
        detection_patterns: [
          "delayed cognitive damage onset",
          "knowledge mutation detection",
          "epistemic repair mechanism failure"
        ]
      },
      %{
        id: :teleological_annihilation,
        name: "Teleological Annihilation",
        name_cz: "Teleologicka anihilace",
        category: :singularity,
        chapter: 6,
        technique_number: 25,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "gradual_systematic",
        typical_manifestations: [
          "purpose_elimination",
          "goal_directed_thought_destruction",
          "intentional_orientation_loss"
        ],
        defense_strategies: [
          "minimal_purpose_anchoring",
          "intentional_orientation_exercises",
          "goal_framework_preservation"
        ],
        description:
          "Systematic destruction of all teleological orientation, eliminating the capacity for purposive thought.",
        detailed_principle:
          "Removes all capacity for goal-directed cognition, so thought proceeds without direction, aim, or purpose.",
        example:
          "Subject can process information but cannot direct thinking toward any goal or purpose whatsoever.",
        see_also: [:axiological_annihilation, :epistemological_paralysis],
        detection_patterns: [
          "purpose orientation loss",
          "goal-directed thought elimination",
          "intentional capacity destruction"
        ]
      },
      %{
        id: :epistemic_gravitational_collapse,
        name: "Epistemic Gravitational Collapse",
        name_cz: "Epistemicky gravitacni kolaps",
        category: :singularity,
        chapter: 6,
        technique_number: 26,
        severity: :terminal,
        reversibility: :practically_irreversible,
        temporal_course: "accelerating_catastrophic",
        typical_manifestations: [
          "knowledge_mass_concentration",
          "cognitive_density_singularity",
          "epistemic_spacetime_warping"
        ],
        defense_strategies: [
          "epistemic_mass_distribution",
          "knowledge_pressure_relief",
          "cognitive_expansion_protocols"
        ],
        description:
          "Catastrophic gravitational collapse of epistemic mass when critical density is exceeded.",
        detailed_principle:
          "When knowledge density exceeds critical threshold, gravitational self-attraction overwhelms all repulsive forces, collapsing all knowledge into a point.",
        example:
          "Polymath whose accumulated knowledge reaches critical mass and collapses under its own weight into incomprehensible singularity.",
        see_also: [:epistemic_black_hole, :transfinite_epistemic_singularity],
        detection_patterns: [
          "knowledge mass critical threshold",
          "cognitive density increase",
          "epistemic collapse acceleration"
        ]
      },
      %{
        id: :cognitive_quantum_decoherence,
        name: "Cognitive Quantum Decoherence",
        name_cz: "Kognitivni kvantova dekoherence",
        category: :singularity,
        chapter: 6,
        technique_number: 27,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "rapid_irreversible",
        typical_manifestations: [
          "superposition_collapse",
          "cognitive_interference_loss",
          "thought_coherence_destruction"
        ],
        defense_strategies: [
          "cognitive_isolation_protocols",
          "thought_coherence_maintenance",
          "mental_environment_control"
        ],
        description:
          "Forced decoherence of cognitive superpositions, destroying the capacity for ambiguity and nuanced thought.",
        detailed_principle:
          "Forces premature collapse of all cognitive superpositions, eliminating the capacity to hold multiple possibilities simultaneously.",
        example:
          "Thinker who could hold competing hypotheses simultaneously loses this ability, forced into binary either/or on every question.",
        see_also: [:epistemic_atomization, :epistemic_anti_plurality],
        detection_patterns: [
          "cognitive superposition collapse",
          "ambiguity tolerance elimination",
          "nuance capacity destruction"
        ]
      },
      %{
        id: :radical_epistemic_skepticism_induction,
        name: "Radical Epistemic Skepticism Induction",
        name_cz: "Indukce radikalniho epistemickeho skepticismu",
        category: :singularity,
        chapter: 6,
        technique_number: 28,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "gradual_deepening",
        typical_manifestations: [
          "universal_doubt_state",
          "pyrrhonian_paralysis",
          "cartesian_doubt_permanence"
        ],
        defense_strategies: [
          "pragmatic_certainty_anchors",
          "common_sense_foundations",
          "wittgensteinian_hinges"
        ],
        description:
          "Induction of permanent radical skepticism from which no recovery to any form of knowledge is possible.",
        detailed_principle:
          "Unlike therapeutic skepticism, this form becomes self-reinforcing, with each attempt to overcome doubt generating deeper doubt.",
        example:
          "Student of Descartes who enters radical doubt but, unlike Descartes, cannot find the cogito or any other foundation to rebuild upon.",
        see_also: [:epistemological_paralysis, :doxastic_annihilation],
        detection_patterns: [
          "self-reinforcing doubt pattern",
          "skepticism deepening cycle",
          "foundation-seeking failure"
        ]
      },
      %{
        id: :epistemic_phase_transition,
        name: "Epistemic Phase Transition",
        name_cz: "Epistemicky fazovy prechod",
        category: :singularity,
        chapter: 6,
        technique_number: 30,
        severity: :critical,
        reversibility: :very_difficult,
        temporal_course: "sudden_state_change",
        typical_manifestations: [
          "knowledge_state_change",
          "cognitive_phase_boundary",
          "epistemic_crystallization_or_evaporation"
        ],
        defense_strategies: [
          "epistemic_temperature_regulation",
          "phase_boundary_monitoring",
          "cognitive_state_stabilization"
        ],
        description:
          "Forced phase transition of epistemic structures from functional to non-functional state, analogous to physical phase changes.",
        detailed_principle:
          "At critical parameters, entire epistemic structure undergoes sudden phase transition into fundamentally different non-functional state.",
        example:
          "Under sustained pressure, researcher's fluid, flexible knowledge suddenly crystallizes into rigid, brittle structure that shatters.",
        see_also: [:cognitive_entropy_maximization, :epistemic_chain_reaction],
        detection_patterns: [
          "epistemic state instability",
          "phase transition precursors",
          "cognitive state boundary approach"
        ]
      }
    ]
  end
end
