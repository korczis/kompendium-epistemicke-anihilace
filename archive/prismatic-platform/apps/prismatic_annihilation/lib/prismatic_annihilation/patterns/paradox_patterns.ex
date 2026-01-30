defmodule PrismaticAnnihilation.Patterns.ParadoxPatterns do
  @moduledoc """
  Paradox Pattern Detection for Paradoxical Meta-Annihilation Techniques.

  Detects patterns associated with Chapter 9 techniques (91-120) that exploit
  self-reference, truth value oscillation, and recursive negation to create
  inescapable cognitive traps.

  ## Pattern Categories

  1. **Self-Reference Loops** - Pathological self-referential structures
  2. **Truth Value Oscillation** - Unstable truth value assignment
  3. **Recursive Negation** - Self-negating recursive structures
  4. **Hyperparadoxical** - Paradoxes about paradoxes (meta-level)
  5. **Dialectical Trap** - False dialectical resolutions
  6. **Complementarity Destruction** - Preventing synthesis
  7. **Temporal Paradox** - Time-based paradoxical structures

  ## Performance

  - Pattern matching: <5ms per technique
  - 35+ specific detection patterns
  - Concurrent-safe for parallel analysis

  ## Usage

      patterns = ParadoxPatterns.all()
      {:ok, matches} = ParadoxPatterns.detect(content)

  """

  alias PrismaticAnnihilation.Patterns.PatternCompiler

  @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

  # ===========================================================================
  # Public API
  # ===========================================================================

  @impl true
  @spec all() :: [map()]
  def all do
    self_reference_patterns() ++
      truth_oscillation_patterns() ++
      recursive_negation_patterns() ++
      hyperparadoxical_patterns() ++
      dialectical_trap_patterns() ++
      complementarity_destruction_patterns() ++
      temporal_paradox_patterns()
  end

  @impl true
  @spec count() :: non_neg_integer()
  def count, do: length(all())

  @impl true
  @spec category() :: atom()
  def category, do: :paradox

  @impl true
  @spec detect(String.t(), keyword()) :: {:ok, [map()]}
  def detect(content, opts \\ []) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    subcategory = Keyword.get(opts, :subcategory, :all)
    max_results = Keyword.get(opts, :max_results, 50)

    patterns =
      case subcategory do
        :all -> all()
        :self_reference -> self_reference_patterns()
        :truth_oscillation -> truth_oscillation_patterns()
        :recursive_negation -> recursive_negation_patterns()
        :hyperparadoxical -> hyperparadoxical_patterns()
        :dialectical_trap -> dialectical_trap_patterns()
        :complementarity_destruction -> complementarity_destruction_patterns()
        :temporal_paradox -> temporal_paradox_patterns()
        _ -> all()
      end

    content_lower = String.downcase(content)

    results =
      patterns
      |> Enum.map(&match_pattern(&1, content_lower, content))
      |> Enum.reject(&is_nil/1)
      |> Enum.filter(fn result -> result.confidence >= threshold end)
      |> reject_false_positives(content_lower)
      |> Enum.sort_by(& &1.confidence, :desc)
      |> Enum.take(max_results)

    {:ok, results}
  end

  @impl true
  @spec for_technique(atom()) :: [map()]
  def for_technique(technique_id) do
    Enum.filter(all(), fn pattern ->
      technique_id in pattern.associated_techniques
    end)
  end

  # ===========================================================================
  # Self-Reference Loop Patterns
  # ===========================================================================

  defp self_reference_patterns do
    [
      %{
        id: :pp_pathological_self_reference,
        name: "Pathological Self-Reference",
        category: :paradox,
        subcategory: :self_reference,
        detection_type: :regex,
        regex: ~S"(?:this|itself|self)\s+(?:statement|claim|assertion|argument)\s+(?:negat|deni|refut|contradict|undermin)\w*\s+(?:itself|its\s+own)",
        keywords: [
          "this statement negates itself",
          "self-contradicting claim",
          "self-undermining assertion",
          "self-refuting argument"
        ],
        semantic_markers: ["refers to itself destructively", "self-defeating reference", "circular self-negation"],
        confidence_weight: 0.92,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :reflexivity_perversion],
        context_requirements: [:logical_discourse, :epistemic_discourse],
        false_positive_indicators: ["self-referential humor", "self-aware AI", "metacognition"],
        severity: :critical,
        description: "Detects pathological self-referential structures that create inescapable loops"
      },
      %{
        id: :pp_liar_variant,
        name: "Liar Paradox Variant",
        category: :paradox,
        subcategory: :self_reference,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "this statement is false",
          "I am lying now",
          "everything I say is untrue",
          "this claim is not true",
          "the following is false"
        ],
        semantic_markers: ["truth of denial", "false if true", "true if false"],
        confidence_weight: 0.94,
        associated_techniques: [:anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["studying the liar paradox", "logic textbook", "paradox theory"],
        severity: :critical,
        description: "Detects variants of the liar paradox used to create epistemic traps"
      },
      %{
        id: :pp_strange_loop,
        name: "Strange Loop Formation",
        category: :paradox,
        subcategory: :self_reference,
        detection_type: :regex,
        regex: ~S"(?:level|hierarchy|layer)\w*\s+(?:loop|fold|collapse)\w*\s+(?:back|into)\s+(?:itself|the\s+(?:same|original|first))",
        keywords: [
          "hierarchy looping back",
          "levels collapsing into each other",
          "strange loop formation",
          "tangled hierarchy"
        ],
        semantic_markers: ["going up leads to going down", "end connects to beginning", "Escher-like"],
        confidence_weight: 0.86,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :transfinite_epistemic_regression],
        context_requirements: [:logical_discourse, :epistemic_discourse],
        false_positive_indicators: ["Hofstadter", "Godel Escher Bach", "infinite loop programming"],
        severity: :high,
        description: "Detects strange loop formation where hierarchies fold back on themselves"
      },
      %{
        id: :pp_self_defeating_knowledge,
        name: "Self-Defeating Knowledge Claim",
        category: :paradox,
        subcategory: :self_reference,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "knowing this destroys the knowledge",
          "understanding it makes it incomprehensible",
          "learning it causes forgetting",
          "awareness destroys what is observed",
          "examining destroys the examined"
        ],
        semantic_markers: [
          "knowledge self-destructs on access",
          "comprehension causes incomprehension",
          "observation collapses the observed"
        ],
        confidence_weight: 0.88,
        associated_techniques: [:absolute_epistemic_cannibalization, :reflexivity_perversion],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["observer effect physics", "Heisenberg uncertainty", "quantum measurement"],
        severity: :critical,
        description: "Detects self-defeating knowledge claims that destroy themselves upon access"
      },
      %{
        id: :pp_recursive_self_application,
        name: "Recursive Self-Application Trap",
        category: :paradox,
        subcategory: :self_reference,
        detection_type: :regex,
        regex: ~S"(?:apply|use|invoke|turn)\w*\s+(?:the\s+)?(?:rule|principle|method|criterion)\s+(?:to|on|against)\s+itself",
        keywords: [
          "applying the rule to itself",
          "turning the method on itself",
          "using the principle against itself"
        ],
        semantic_markers: ["self-application paradox", "rule invalidates itself when applied to itself"],
        confidence_weight: 0.86,
        associated_techniques: [:reflexivity_perversion, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse, :epistemic_discourse],
        false_positive_indicators: ["recursive function", "self-application in lambda calculus", "self-test"],
        severity: :high,
        description: "Detects recursive self-application traps where methods destroy themselves"
      }
    ]
  end

  # ===========================================================================
  # Truth Value Oscillation Patterns
  # ===========================================================================

  defp truth_oscillation_patterns do
    [
      %{
        id: :pp_truth_oscillation,
        name: "Truth Value Oscillation",
        category: :paradox,
        subcategory: :truth_oscillation,
        detection_type: :regex,
        regex: ~S"(?:true|false|valid|invalid)\s+(?:then|and\s+then|but\s+then|which\s+makes?\s+it)\s+(?:false|true|invalid|valid)",
        keywords: [
          "true then false then true",
          "oscillating between valid and invalid",
          "truth value instability",
          "flickering truth"
        ],
        semantic_markers: ["cannot settle on truth value", "endlessly switching", "binary instability"],
        confidence_weight: 0.90,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :reflexivity_perversion],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["boolean toggle", "flip-flop circuit", "alternating current"],
        severity: :critical,
        description: "Detects truth value oscillation where claims alternate between true and false"
      },
      %{
        id: :pp_bivalence_failure,
        name: "Bivalence Principle Failure",
        category: :paradox,
        subcategory: :truth_oscillation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "neither true nor false",
          "beyond true and false",
          "not true not false",
          "truth value gap",
          "bivalence failure"
        ],
        semantic_markers: ["falls outside truth", "no truth value applies", "truth-valueless"],
        confidence_weight: 0.84,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :hypertranscendental_negation],
        context_requirements: [:logical_discourse, :philosophical_argument],
        false_positive_indicators: ["fuzzy logic", "many-valued logic", "intuitionist logic"],
        severity: :high,
        description: "Detects failure of bivalence where propositions cannot be assigned truth values"
      },
      %{
        id: :pp_truth_value_contagion,
        name: "Truth Value Contagion",
        category: :paradox,
        subcategory: :truth_oscillation,
        detection_type: :regex,
        regex: ~S"(?:instability|oscillation|uncertainty)\s+(?:of\s+)?(?:truth|validity)\s+(?:spread|propagat|infect|contaminat)\w*",
        keywords: [
          "truth instability spreading",
          "validity uncertainty propagating",
          "oscillation infecting other claims"
        ],
        semantic_markers: ["paradox spreading to other statements", "truth infection", "validity cascade"],
        confidence_weight: 0.86,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :semiotic_contamination],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["error propagation", "uncertainty propagation", "noise spread"],
        severity: :critical,
        description: "Detects truth value instability spreading from paradoxical to normal statements"
      },
      %{
        id: :pp_excluded_middle_attack,
        name: "Law of Excluded Middle Attack",
        category: :paradox,
        subcategory: :truth_oscillation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "excluded middle violated",
          "third option that collapses both",
          "neither A nor not-A",
          "both true and false simultaneously",
          "dialetheia weaponized"
        ],
        semantic_markers: ["classical logic breaking", "fundamental law violated", "logical foundation attacked"],
        confidence_weight: 0.88,
        associated_techniques: [:hypertranscendental_negation, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["paraconsistent logic", "dialethism philosophy", "quantum superposition"],
        severity: :critical,
        description: "Detects attacks on the law of excluded middle to destabilize logical reasoning"
      },
      %{
        id: :pp_semantic_paradox_trap,
        name: "Semantic Paradox Trap",
        category: :paradox,
        subcategory: :truth_oscillation,
        detection_type: :regex,
        regex: ~S"(?:defin|characteriz|describ)\w*\s+(?:in\s+)?(?:a\s+way|terms|manner)\s+(?:that\s+)?(?:contradict|negate|undermine)\w*\s+(?:the\s+)?(?:definition|description|characterization)",
        keywords: [
          "definition contradicts itself",
          "description negates the described",
          "characterization undermines the characterized"
        ],
        semantic_markers: ["defined into paradox", "self-contradicting definition"],
        confidence_weight: 0.84,
        associated_techniques: [:reflexivity_perversion, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse, :semiotic_discourse],
        false_positive_indicators: ["definition by negation", "apophatic theology", "negative definition"],
        severity: :high,
        description: "Detects semantic paradox traps where definitions contradict themselves"
      }
    ]
  end

  # ===========================================================================
  # Recursive Negation Patterns
  # ===========================================================================

  defp recursive_negation_patterns do
    [
      %{
        id: :pp_infinite_negation_regress,
        name: "Infinite Negation Regress",
        category: :paradox,
        subcategory: :recursive_negation,
        detection_type: :regex,
        regex: ~S"(?:negat|deni|reject)\w*\s+(?:the\s+)?(?:negation|denial|rejection)\s+(?:of\s+)?(?:the\s+)?(?:negation|denial|rejection)",
        keywords: [
          "negation of the negation",
          "denying the denial",
          "rejecting the rejection",
          "infinite negation chain"
        ],
        semantic_markers: ["each negation spawns another", "never-ending denial", "bottomless rejection"],
        confidence_weight: 0.88,
        associated_techniques: [:transfinite_epistemic_regression, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse, :philosophical_argument],
        false_positive_indicators: ["Hegelian dialectic", "double negation elimination", "negation normal form"],
        severity: :high,
        description: "Detects infinite regress of negations that prevent any stable assertion"
      },
      %{
        id: :pp_self_negating_assertion,
        name: "Self-Negating Assertion",
        category: :paradox,
        subcategory: :recursive_negation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "this assertion negates itself",
          "claim that denies its own validity",
          "statement that renders itself false",
          "proposition that disproves itself"
        ],
        semantic_markers: ["says what it unsays", "asserts its own falsehood", "self-cancelling"],
        confidence_weight: 0.90,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :reflexivity_perversion],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["performative contradiction study", "pragmatic paradox analysis"],
        severity: :critical,
        description: "Detects assertions that contain their own negation"
      },
      %{
        id: :pp_negation_cascade,
        name: "Negation Cascade",
        category: :paradox,
        subcategory: :recursive_negation,
        detection_type: :regex,
        regex: ~S"(?:not|no|cannot|impossible)\s+(?:to\s+)?(?:not|no|cannot|impossible)\s+(?:to\s+)?(?:not|no|cannot|impossible)",
        keywords: [
          "cannot not cannot",
          "impossible to not impossibly",
          "triple negation collapse",
          "negation stack overflow"
        ],
        semantic_markers: ["piling negations", "negation depth exceeding comprehension"],
        confidence_weight: 0.82,
        associated_techniques: [:cognitive_pandemonium, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["not uncommon", "cannot not be", "double negative grammar"],
        severity: :high,
        description: "Detects cascading negations that overwhelm cognitive processing"
      },
      %{
        id: :pp_recursive_doubt,
        name: "Recursive Doubt Pattern",
        category: :paradox,
        subcategory: :recursive_negation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "doubt about doubt",
          "uncertainty about uncertainty",
          "questioning the question",
          "skepticism about skepticism",
          "meta-doubt"
        ],
        semantic_markers: ["doubting one's own doubt", "uncertain about uncertainty itself"],
        confidence_weight: 0.80,
        associated_techniques: [:transfinite_epistemic_regression, :reflexivity_perversion],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["Cartesian doubt", "methodological skepticism", "critical thinking"],
        severity: :medium,
        description: "Detects recursive doubt patterns where doubt itself becomes the object of doubt"
      },
      %{
        id: :pp_performative_contradiction,
        name: "Performative Contradiction Trap",
        category: :paradox,
        subcategory: :recursive_negation,
        detection_type: :regex,
        regex: ~S"(?:perform|enact|do|execut)\w*\s+(?:what\s+(?:it|one)|the\s+very\s+thing)\s+(?:it|one|they)?\s*(?:deni|refut|reject|contradict)\w*",
        keywords: [
          "performing what it denies",
          "doing what it rejects",
          "enacting the contradiction",
          "performative self-refutation"
        ],
        semantic_markers: ["action contradicts claim", "doing undoes saying", "practice negates theory"],
        confidence_weight: 0.86,
        associated_techniques: [:reflexivity_perversion, :epistemic_autodissolution],
        context_requirements: [:logical_discourse, :epistemic_discourse],
        false_positive_indicators: ["performative speech acts", "Austin's performatives", "speech act theory"],
        severity: :high,
        description: "Detects performative contradictions where actions contradict their own claims"
      }
    ]
  end

  # ===========================================================================
  # Hyperparadoxical Patterns - Paradoxes about paradoxes
  # ===========================================================================

  defp hyperparadoxical_patterns do
    [
      %{
        id: :pp_meta_paradox,
        name: "Meta-Paradox Formation",
        category: :paradox,
        subcategory: :hyperparadoxical,
        detection_type: :regex,
        regex: ~S"(?:paradox|contradiction|antinomy)\s+(?:about|of|regarding|concerning)\s+(?:paradox|contradiction|antinomy)",
        keywords: [
          "paradox about paradoxes",
          "contradiction of contradictions",
          "meta-paradox",
          "antinomy of antinomies"
        ],
        semantic_markers: ["paradox bootstraps itself", "self-referential paradox", "paradox^2"],
        confidence_weight: 0.92,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :reflexivity_perversion],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["paradox theory", "study of paradoxes", "paradox resolution"],
        severity: :critical,
        description: "Detects meta-paradoxes - paradoxes about the nature of paradox itself"
      },
      %{
        id: :pp_resolution_impossibility,
        name: "Resolution Impossibility Proof",
        category: :paradox,
        subcategory: :hyperparadoxical,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "cannot be resolved by any means",
          "resolution itself generates the paradox",
          "solving creates a worse paradox",
          "every resolution fails",
          "insoluble by construction"
        ],
        semantic_markers: ["designed to resist all resolution", "proof of irresolvability"],
        confidence_weight: 0.88,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :cognitive_anti_complementarity],
        context_requirements: [:logical_discourse, :philosophical_argument],
        false_positive_indicators: ["unsolved problem", "open question", "undecidable proposition"],
        severity: :critical,
        description: "Detects proofs that paradox resolution is impossible by construction"
      },
      %{
        id: :pp_paradox_generator,
        name: "Paradox Generator Mechanism",
        category: :paradox,
        subcategory: :hyperparadoxical,
        detection_type: :regex,
        regex: ~S"(?:generat|produc|creat|spawn)\w*\s+(?:new\s+)?(?:paradox|contradiction|antinom)\w*\s+(?:from|out\s+of|with)\s+(?:each|every|any)",
        keywords: [
          "generating new paradoxes",
          "producing contradictions endlessly",
          "paradox spawning mechanism"
        ],
        semantic_markers: ["factory of paradoxes", "infinite paradox generation", "self-perpetuating trap"],
        confidence_weight: 0.90,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :transfinite_epistemic_regression],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["test case generator", "paradox examples", "logic puzzles"],
        severity: :terminal,
        description: "Detects mechanisms that generate infinite sequences of new paradoxes"
      },
      %{
        id: :pp_escape_proof_trap,
        name: "Escape-Proof Cognitive Trap",
        category: :paradox,
        subcategory: :hyperparadoxical,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "escape itself is trapped",
          "attempting to leave deepens the trap",
          "resistance strengthens the paradox",
          "fighting it makes it worse",
          "awareness of trap is part of trap"
        ],
        semantic_markers: ["inescapable by design", "escape route is itself a trap"],
        confidence_weight: 0.92,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :reflexivity_perversion],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["Chinese finger trap", "quicksand metaphor", "addiction cycle"],
        severity: :terminal,
        description: "Detects escape-proof cognitive traps where attempts to escape deepen entrapment"
      },
      %{
        id: :pp_paradox_nesting,
        name: "Nested Paradox Structure",
        category: :paradox,
        subcategory: :hyperparadoxical,
        detection_type: :regex,
        regex: ~S"(?:within|inside|nested|embedded)\s+(?:the\s+)?(?:paradox|contradiction)\s+(?:is|lies|contains)\s+(?:another|a\s+deeper|a\s+further)\s+(?:paradox|contradiction)",
        keywords: [
          "paradox within a paradox",
          "nested contradictions",
          "embedded paradox",
          "deeper paradox within"
        ],
        semantic_markers: ["infinite depth of paradox", "paradox matryoshka", "fractal contradiction"],
        confidence_weight: 0.86,
        associated_techniques: [:anti_autoreferential_paradoxical_loop, :transfinite_epistemic_regression],
        context_requirements: [:logical_discourse],
        false_positive_indicators: ["nested loops", "recursive data structure", "nested function"],
        severity: :critical,
        description: "Detects nested paradox structures containing paradoxes within paradoxes"
      }
    ]
  end

  # ===========================================================================
  # Dialectical Trap Patterns
  # ===========================================================================

  defp dialectical_trap_patterns do
    [
      %{
        id: :pp_false_synthesis,
        name: "False Dialectical Synthesis",
        category: :paradox,
        subcategory: :dialectical_trap,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "false synthesis",
          "apparent resolution that deepens",
          "pseudo-resolution",
          "illusory synthesis",
          "trap disguised as resolution"
        ],
        semantic_markers: ["seems resolved but is not", "resolution is itself a contradiction"],
        confidence_weight: 0.84,
        associated_techniques: [:reflexivity_perversion, :cognitive_anti_complementarity],
        context_requirements: [:philosophical_argument, :epistemic_discourse],
        false_positive_indicators: ["Hegelian synthesis", "dialectical method", "thesis antithesis synthesis"],
        severity: :high,
        description: "Detects false dialectical syntheses that appear to resolve but actually deepen paradox"
      },
      %{
        id: :pp_thesis_antithesis_collapse,
        name: "Thesis-Antithesis Collapse",
        category: :paradox,
        subcategory: :dialectical_trap,
        detection_type: :regex,
        regex: ~S"(?:thesis|position|argument)\s+(?:and\s+)?(?:antithesis|counter|opposite)\s+(?:collaps|merg|dissolv|annihilat)\w*\s+(?:into|without)\s+(?:nothing|void|meaningless)",
        keywords: [
          "thesis and antithesis collapse",
          "position and counterposition dissolve",
          "argument and counter-argument annihilate"
        ],
        semantic_markers: ["mutual annihilation", "both destroyed without synthesis"],
        confidence_weight: 0.86,
        associated_techniques: [:ontological_annihilation, :cognitive_anti_complementarity],
        context_requirements: [:philosophical_argument],
        false_positive_indicators: ["dialectical process", "philosophical debate", "argument resolution"],
        severity: :high,
        description: "Detects collapse of thesis-antithesis pairs into void without productive synthesis"
      },
      %{
        id: :pp_infinite_dialectic,
        name: "Infinite Dialectical Regress",
        category: :paradox,
        subcategory: :dialectical_trap,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "infinite dialectical regression",
          "synthesis becomes new thesis requiring new antithesis",
          "dialectic that never resolves",
          "endless opposition cycle"
        ],
        semantic_markers: ["each resolution spawns new opposition", "perpetual dialectic"],
        confidence_weight: 0.82,
        associated_techniques: [:transfinite_epistemic_regression, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:philosophical_argument],
        false_positive_indicators: ["dialectical materialism", "philosophical progression", "Hegel's logic"],
        severity: :high,
        description: "Detects infinite dialectical regress where synthesis always generates new opposition"
      }
    ]
  end

  # ===========================================================================
  # Complementarity Destruction Patterns
  # ===========================================================================

  defp complementarity_destruction_patterns do
    [
      %{
        id: :pp_complementarity_blocking,
        name: "Complementarity Blocking",
        category: :paradox,
        subcategory: :complementarity_destruction,
        detection_type: :regex,
        regex: ~S"(?:cannot|impossible|unable)\s+(?:to\s+)?(?:combin|integrat|synthes|unif|reconcil)\w*\s+(?:the\s+)?(?:two|both|opposing|complementary)",
        keywords: [
          "cannot combine both views",
          "impossible to integrate",
          "unable to synthesize",
          "irreconcilable perspectives"
        ],
        semantic_markers: [
          "permanently incompatible",
          "designed to resist integration",
          "anti-complementary by construction"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:cognitive_anti_complementarity, :epistemic_anti_plurality],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["legitimate disagreement", "unresolved debate", "open question"],
        severity: :high,
        description: "Detects deliberate blocking of complementarity between knowledge elements"
      },
      %{
        id: :pp_synthesis_sabotage,
        name: "Synthesis Sabotage Pattern",
        category: :paradox,
        subcategory: :complementarity_destruction,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "synthesis rendered impossible",
          "integration sabotaged",
          "unification prevented",
          "combination blocked",
          "wholeness denied"
        ],
        semantic_markers: ["cannot form whole", "parts resist assembly", "anti-synthetic force"],
        confidence_weight: 0.82,
        associated_techniques: [:cognitive_anti_complementarity, :epistemic_anti_mereology],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["irreducible complexity", "emergent properties", "holism debate"],
        severity: :high,
        description: "Detects deliberate sabotage of synthesis processes in knowledge formation"
      },
      %{
        id: :pp_mutual_exclusion_trap,
        name: "Mutual Exclusion Trap",
        category: :paradox,
        subcategory: :complementarity_destruction,
        detection_type: :regex,
        regex: ~S"(?:each|every|any)\s+(?:perspective|view|approach|theory)\s+(?:exclud|eliminat|negat|destroy)\w*\s+(?:all|every|any)\s+(?:other|alternative)",
        keywords: [
          "each view excludes all others",
          "every perspective negates alternatives",
          "mutual exclusion of all positions"
        ],
        semantic_markers: ["zero-sum knowledge", "no coexistence possible"],
        confidence_weight: 0.86,
        associated_techniques: [:cognitive_anti_complementarity, :epistemic_anti_plurality],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["mutex in programming", "mutual exclusion principle", "competing theories"],
        severity: :high,
        description: "Detects mutual exclusion traps where all perspectives are forced to negate each other"
      }
    ]
  end

  # ===========================================================================
  # Temporal Paradox Patterns
  # ===========================================================================

  defp temporal_paradox_patterns do
    [
      %{
        id: :pp_temporal_loop,
        name: "Temporal Epistemic Loop",
        category: :paradox,
        subcategory: :temporal_paradox,
        detection_type: :regex,
        regex: ~S"(?:knowledge|understanding|belief)\s+(?:of\s+)?(?:the\s+)?(?:future|past)\s+(?:destroy|negate|prevent|eliminat)\w*\s+(?:the\s+)?(?:present|current)",
        keywords: [
          "future knowledge destroying present",
          "past understanding negating current",
          "temporal knowledge paradox",
          "time loop of belief"
        ],
        semantic_markers: ["causally impossible knowledge", "temporal contradiction", "bootstrap paradox of thought"],
        confidence_weight: 0.82,
        associated_techniques: [:transnarrative_annihilation, :cognitive_anti_transformability],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["time travel fiction", "bootstrap paradox", "predestination"],
        severity: :high,
        description: "Detects temporal loops where knowledge from one time destroys knowledge in another"
      },
      %{
        id: :pp_retroactive_negation,
        name: "Retroactive Knowledge Negation",
        category: :paradox,
        subcategory: :temporal_paradox,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "retroactively invalidated",
          "past knowledge negated by present",
          "everything known was always false",
          "retroactive epistemic annihilation"
        ],
        semantic_markers: ["rewrites the past", "makes the past false", "retroactive destruction"],
        confidence_weight: 0.86,
        associated_techniques: [:transnarrative_annihilation, :ontological_annihilation],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["retroactive legislation", "retroactive continuity", "retcon"],
        severity: :critical,
        description: "Detects retroactive negation of past knowledge by present revelations"
      },
      %{
        id: :pp_eternal_present_trap,
        name: "Eternal Present Trap",
        category: :paradox,
        subcategory: :temporal_paradox,
        detection_type: :regex,
        regex: ~S"(?:trap|lock|freeze|confine)\w*\s+(?:in\s+)?(?:the\s+)?(?:eternal|permanent|endless|perpetual)\s+(?:present|now|moment|instant)",
        keywords: [
          "trapped in eternal present",
          "locked in the now",
          "frozen in perpetual present",
          "no past no future only now"
        ],
        semantic_markers: ["cannot access memory", "cannot project forward", "temporal imprisonment"],
        confidence_weight: 0.84,
        associated_techniques: [:transnarrative_annihilation, :supercognitive_paralysis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["mindfulness", "present moment awareness", "being present"],
        severity: :high,
        description: "Detects eternal present traps that destroy temporal extension of knowledge"
      }
    ]
  end

  # ===========================================================================
  # Private: Pattern Matching (shared infrastructure)
  # ===========================================================================

  defp match_pattern(pattern, content_lower, original_content) do
    keyword_score = match_keywords(pattern.keywords, content_lower)
    semantic_score = match_semantic_markers(pattern.semantic_markers, content_lower)
    regex_score = match_regex(pattern, content_lower)

    combined_score = calculate_combined_score(keyword_score, semantic_score, regex_score, pattern)

    if combined_score > 0.0 do
      evidence = build_evidence(pattern, content_lower, keyword_score, semantic_score, regex_score)

      %{
        pattern_id: pattern.id,
        pattern_name: pattern.name,
        confidence: min(0.99, combined_score * pattern.confidence_weight),
        severity: pattern.severity,
        evidence: evidence,
        location: extract_location(pattern, original_content),
        associated_techniques: pattern.associated_techniques
      }
    else
      nil
    end
  end

  defp match_keywords(keywords, content) do
    matches = Enum.count(keywords, &String.contains?(content, String.downcase(&1)))
    total = length(keywords)
    if total > 0, do: matches / total, else: 0.0
  end

  defp match_semantic_markers(markers, content) do
    matches = Enum.count(markers, &String.contains?(content, String.downcase(&1)))
    total = length(markers)
    if total > 0, do: matches / total * 0.8, else: 0.0
  end

  defp match_regex(%{detection_type: :regex, regex: regex_str}, content) when is_binary(regex_str) do
    case PatternCompiler.get_compiled_regex(regex_str) do
      {:ok, regex} -> if Regex.match?(regex, content), do: 1.0, else: 0.0
      :miss -> compile_and_match(regex_str, content)
    end
  end

  defp match_regex(_pattern, _content), do: 0.0

  defp compile_and_match(regex_str, content) do
    case Regex.compile(regex_str, [:caseless]) do
      {:ok, regex} ->
        PatternCompiler.cache_compiled_regex(regex_str, regex)
        if Regex.match?(regex, content), do: 1.0, else: 0.0

      {:error, _} ->
        0.0
    end
  end

  defp calculate_combined_score(keyword_score, semantic_score, regex_score, pattern) do
    case pattern.detection_type do
      :regex -> regex_score * 0.5 + keyword_score * 0.3 + semantic_score * 0.2
      :keyword -> keyword_score * 0.6 + semantic_score * 0.4
      :semantic -> semantic_score * 0.5 + keyword_score * 0.5
      _ -> (keyword_score + semantic_score + regex_score) / 3.0
    end
  end

  defp build_evidence(pattern, content, keyword_score, semantic_score, regex_score) do
    evidence = []

    evidence =
      if keyword_score > 0.0 do
        matched = Enum.filter(pattern.keywords, &String.contains?(content, String.downcase(&1)))

        [
          %{type: :keyword_match, content: matched, weight: keyword_score, source: "paradox_patterns"}
          | evidence
        ]
      else
        evidence
      end

    evidence =
      if semantic_score > 0.0 do
        matched =
          Enum.filter(pattern.semantic_markers, &String.contains?(content, String.downcase(&1)))

        [
          %{type: :semantic_match, content: matched, weight: semantic_score, source: "paradox_patterns"}
          | evidence
        ]
      else
        evidence
      end

    if regex_score > 0.0 do
      [
        %{type: :regex_match, content: "Pattern: #{pattern.regex}", weight: regex_score, source: "paradox_patterns"}
        | evidence
      ]
    else
      evidence
    end
  end

  defp extract_location(pattern, content) do
    first_keyword =
      Enum.find(pattern.keywords, fn kw ->
        String.contains?(String.downcase(content), String.downcase(kw))
      end)

    case first_keyword do
      nil ->
        %{start: 0, end: String.length(content), context: String.slice(content, 0, 200)}

      kw ->
        case :binary.match(String.downcase(content), String.downcase(kw)) do
          {start, len} ->
            context_start = max(0, start - 50)
            context_end = min(String.length(content), start + len + 50)
            %{start: start, end: start + len, context: String.slice(content, context_start, context_end - context_start)}

          :nomatch ->
            %{start: 0, end: String.length(content), context: String.slice(content, 0, 200)}
        end
    end
  end

  defp reject_false_positives(results, content) do
    Enum.reject(results, fn result ->
      pattern = Enum.find(all(), &(&1.id == result.pattern_id))

      if pattern do
        Enum.any?(pattern.false_positive_indicators, fn indicator ->
          String.contains?(content, String.downcase(indicator))
        end)
      else
        false
      end
    end)
  end
end
