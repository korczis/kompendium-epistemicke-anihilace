defmodule PrismaticAnnihilation.Patterns.CollapsePatterns do
  @moduledoc """
  Collapse Pattern Detection for Structural Integrity and Cascade Failures.

  Detects patterns associated with structural attack techniques across multiple
  chapters that target the integrity of cognitive and epistemic frameworks,
  causing cascading failures, inhibitory collapse, and cognitive freeze.

  ## Pattern Categories

  1. **Structural Integrity Failure** - Foundation attacks on epistemic structures
  2. **Cascade Effect** - Propagating failure chains
  3. **Inhibitory Collapse** - Suppression of cognitive function
  4. **Cognitive Freeze** - Complete processing halt
  5. **Foundation Erosion** - Gradual undermining of foundational beliefs
  6. **Fragmentation** - Breaking coherent structures into incoherent pieces

  ## Performance

  - Pattern matching: <5ms per technique
  - 30+ specific detection patterns
  - Concurrent-safe for parallel analysis

  ## Usage

      patterns = CollapsePatterns.all()
      {:ok, matches} = CollapsePatterns.detect(content)

  """

  alias PrismaticAnnihilation.Patterns.PatternCompiler

  @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

  # ===========================================================================
  # Public API
  # ===========================================================================

  @impl true
  @spec all() :: [map()]
  def all do
    structural_integrity_patterns() ++
      cascade_patterns() ++
      inhibitory_collapse_patterns() ++
      cognitive_freeze_patterns() ++
      foundation_erosion_patterns() ++
      fragmentation_patterns()
  end

  @impl true
  @spec count() :: non_neg_integer()
  def count, do: length(all())

  @impl true
  @spec category() :: atom()
  def category, do: :collapse

  @impl true
  @spec detect(String.t(), keyword()) :: {:ok, [map()]}
  def detect(content, opts \\ []) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    subcategory = Keyword.get(opts, :subcategory, :all)
    max_results = Keyword.get(opts, :max_results, 50)

    patterns =
      case subcategory do
        :all -> all()
        :structural_integrity -> structural_integrity_patterns()
        :cascade -> cascade_patterns()
        :inhibitory -> inhibitory_collapse_patterns()
        :cognitive_freeze -> cognitive_freeze_patterns()
        :foundation_erosion -> foundation_erosion_patterns()
        :fragmentation -> fragmentation_patterns()
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
  # Structural Integrity Failure Patterns
  # ===========================================================================

  defp structural_integrity_patterns do
    [
      %{
        id: :cp_structural_failure,
        name: "Epistemic Structural Failure",
        category: :collapse,
        subcategory: :structural_integrity,
        detection_type: :regex,
        regex: ~S"(?:epistemic|cognitive|knowledge)\s+(?:structur|framework|scaffold|architectur)\w*\s+(?:fail|collaps|break|crumbl|disintegrat)\w*",
        keywords: [
          "epistemic structure failing",
          "cognitive framework collapsing",
          "knowledge architecture breaking down",
          "scaffold disintegrating"
        ],
        semantic_markers: [
          "foundations giving way",
          "structure cannot hold",
          "framework unsustainable"
        ],
        confidence_weight: 0.90,
        associated_techniques: [:epistemic_imploze, :conceptual_nuclear_winter, :ontological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["structural engineering", "building collapse", "bridge failure"],
        severity: :critical,
        description: "Detects fundamental structural failure in epistemic frameworks"
      },
      %{
        id: :cp_load_bearing_failure,
        name: "Load-Bearing Concept Failure",
        category: :collapse,
        subcategory: :structural_integrity,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "load-bearing concept failed",
          "keystone belief removed",
          "central pillar collapsed",
          "foundational axiom destroyed",
          "supporting principle eliminated"
        ],
        semantic_markers: [
          "everything built on this",
          "without this nothing stands",
          "critical dependency destroyed"
        ],
        confidence_weight: 0.88,
        associated_techniques: [:ontological_annihilation, :axiological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["load-bearing wall", "keystone species", "critical path"],
        severity: :critical,
        description: "Detects failure of load-bearing concepts that support entire knowledge structures"
      },
      %{
        id: :cp_coherence_breakdown,
        name: "Coherence Breakdown Pattern",
        category: :collapse,
        subcategory: :structural_integrity,
        detection_type: :regex,
        regex: ~S"(?:coherence|consistency|integrity|unity)\s+(?:of\s+)?(?:knowledge|understanding|belief|framework)\s+(?:break|collaps|fail|dissolv|shatter)\w*",
        keywords: [
          "coherence breaking down",
          "consistency failing",
          "integrity dissolving",
          "unity shattering"
        ],
        semantic_markers: ["things stop making sense together", "no longer fits", "falling apart"],
        confidence_weight: 0.86,
        associated_techniques: [
          :cognitive_pandemonium,
          :phenomenological_disintegration,
          :epistemic_anti_mereology
        ],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["coherence theory of truth", "internal consistency check", "data integrity"],
        severity: :high,
        description: "Detects breakdown of coherence in knowledge systems"
      },
      %{
        id: :cp_support_removal,
        name: "Systematic Support Removal",
        category: :collapse,
        subcategory: :structural_integrity,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "removing every support",
          "eliminating each foundation",
          "stripping away all supports",
          "destroying one pillar after another",
          "systematic dismantling"
        ],
        semantic_markers: [
          "methodical destruction of supports",
          "one by one the foundations go",
          "progressive removal"
        ],
        confidence_weight: 0.86,
        associated_techniques: [:axiological_annihilation, :ontological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["removing scaffolding", "dismantling process", "deconstruction project"],
        severity: :high,
        description: "Detects systematic removal of supporting structures from knowledge frameworks"
      },
      %{
        id: :cp_brittle_point_exploitation,
        name: "Brittle Point Exploitation",
        category: :collapse,
        subcategory: :structural_integrity,
        detection_type: :regex,
        regex: ~S"(?:exploit|attack|target|strike)\w*\s+(?:the\s+)?(?:weak|brittle|fragile|vulnerable)\s+(?:point|spot|link|joint|node)",
        keywords: [
          "exploiting the weak point",
          "attacking the brittle link",
          "targeting the fragile joint",
          "striking the vulnerable node"
        ],
        semantic_markers: [
          "single point of failure",
          "chain is only as strong as weakest link",
          "precision attack"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:epistemic_imploze, :epistemic_delegitimization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["penetration testing", "stress testing", "fault injection"],
        severity: :high,
        description: "Detects exploitation of brittle points in epistemic structures"
      }
    ]
  end

  # ===========================================================================
  # Cascade Effect Patterns
  # ===========================================================================

  defp cascade_patterns do
    [
      %{
        id: :cp_cascade_failure,
        name: "Epistemic Cascade Failure",
        category: :collapse,
        subcategory: :cascade,
        detection_type: :regex,
        regex: ~S"(?:cascad|chain|domino|sequential|propag)\w*\s+(?:fail|collaps|destruct|breakdown)\w*\s+(?:across|through|within|spreading)",
        keywords: [
          "cascading failure across knowledge",
          "chain collapse through understanding",
          "domino effect in beliefs",
          "propagating breakdown"
        ],
        semantic_markers: ["one failure triggers the next", "spreading collapse", "chain reaction"],
        confidence_weight: 0.90,
        associated_techniques: [:conceptual_nuclear_winter, :epistemic_imploze],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["cascading style sheets", "cascade database", "waterfall method"],
        severity: :critical,
        description: "Detects cascading failures propagating through epistemic structures"
      },
      %{
        id: :cp_contagion_failure,
        name: "Failure Contagion Pattern",
        category: :collapse,
        subcategory: :cascade,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "failure spreading like contagion",
          "collapse infecting adjacent",
          "breakdown propagating",
          "contagious epistemic failure",
          "failure going viral"
        ],
        semantic_markers: ["jumping from one domain to another", "no firewall", "unstoppable spread"],
        confidence_weight: 0.86,
        associated_techniques: [:semiotic_contamination, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["financial contagion", "social contagion", "emotional contagion"],
        severity: :critical,
        description: "Detects contagion-like spread of epistemic failures across domains"
      },
      %{
        id: :cp_amplification_cascade,
        name: "Amplification Cascade",
        category: :collapse,
        subcategory: :cascade,
        detection_type: :regex,
        regex: ~S"(?:amplif|magnif|intensif|escalat)\w*\s+(?:with\s+)?(?:each|every)\s+(?:step|stage|level|iteration)",
        keywords: [
          "amplifying with each step",
          "magnifying at every stage",
          "intensifying with each level",
          "escalating through iterations"
        ],
        semantic_markers: ["getting worse exponentially", "each level worse than the last"],
        confidence_weight: 0.84,
        associated_techniques: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["signal amplification", "amplifier circuit", "gain stage"],
        severity: :critical,
        description: "Detects amplification cascades where each stage magnifies the damage"
      },
      %{
        id: :cp_systemic_failure,
        name: "Systemic Epistemic Failure",
        category: :collapse,
        subcategory: :cascade,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "systemic epistemic failure",
          "system-wide cognitive collapse",
          "total framework breakdown",
          "complete knowledge system failure",
          "global epistemic crisis"
        ],
        semantic_markers: ["affecting everything", "nothing immune", "total system failure"],
        confidence_weight: 0.92,
        associated_techniques: [:conceptual_nuclear_winter, :ontological_annihilation],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["systemic risk finance", "system failure IT", "systemic review"],
        severity: :terminal,
        description: "Detects systemic failures affecting entire epistemic systems"
      },
      %{
        id: :cp_feedback_loop_destruction,
        name: "Destructive Feedback Loop",
        category: :collapse,
        subcategory: :cascade,
        detection_type: :regex,
        regex: ~S"(?:destructiv|negativ|damag|toxic)\w*\s+(?:feedback|reinforc|amplif)\w*\s+(?:loop|cycle|spiral|circuit)",
        keywords: [
          "destructive feedback loop",
          "negative reinforcement spiral",
          "damaging amplification cycle",
          "toxic feedback circuit"
        ],
        semantic_markers: ["self-reinforcing destruction", "worse begets worse"],
        confidence_weight: 0.88,
        associated_techniques: [:epistemic_autodissolution, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["feedback loop audio", "control systems", "servo loop"],
        severity: :critical,
        description: "Detects destructive feedback loops that amplify epistemic damage"
      }
    ]
  end

  # ===========================================================================
  # Inhibitory Collapse Patterns
  # ===========================================================================

  defp inhibitory_collapse_patterns do
    [
      %{
        id: :cp_cognitive_inhibition,
        name: "Cognitive Inhibition Pattern",
        category: :collapse,
        subcategory: :inhibitory,
        detection_type: :regex,
        regex: ~S"(?:inhibit|suppress|block|prevent)\w*\s+(?:all\s+)?(?:cognitive|epistemic|thought|mental)\s+(?:process|function|activity|operation)\w*",
        keywords: [
          "inhibiting cognitive processes",
          "suppressing epistemic functions",
          "blocking thought processes",
          "preventing mental activity"
        ],
        semantic_markers: ["cannot think", "thought suppressed", "cognition blocked"],
        confidence_weight: 0.88,
        associated_techniques: [:supercognitive_paralysis, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["cognitive inhibition psychology", "impulse control", "executive function"],
        severity: :critical,
        description: "Detects patterns that inhibit cognitive processing capabilities"
      },
      %{
        id: :cp_executive_function_shutdown,
        name: "Executive Function Shutdown",
        category: :collapse,
        subcategory: :inhibitory,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "executive function shutdown",
          "decision-making paralysis",
          "planning capacity destroyed",
          "cognitive control lost",
          "metacognitive shutdown"
        ],
        semantic_markers: ["cannot decide", "cannot plan", "lost control of thought"],
        confidence_weight: 0.86,
        associated_techniques: [:supercognitive_paralysis, :absolute_egological_disintegration],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: [
          "executive dysfunction",
          "ADHD",
          "decision fatigue"
        ],
        severity: :critical,
        description: "Detects shutdown of executive cognitive functions"
      },
      %{
        id: :cp_processing_overload,
        name: "Processing Overload Pattern",
        category: :collapse,
        subcategory: :inhibitory,
        detection_type: :regex,
        regex: ~S"(?:overwhelm|overload|flood|saturat)\w*\s+(?:cognitive|epistemic|mental|thought)\s+(?:capacity|processing|bandwidth|resources)",
        keywords: [
          "overwhelming cognitive capacity",
          "overloading epistemic processing",
          "flooding mental bandwidth",
          "saturating thought resources"
        ],
        semantic_markers: [
          "too much to process",
          "beyond cognitive capacity",
          "system overloaded"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:cognitive_pandemonium, :supercognitive_paralysis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["information overload", "cognitive load theory", "buffer overflow"],
        severity: :high,
        description: "Detects cognitive processing overload leading to system failure"
      },
      %{
        id: :cp_selective_suppression,
        name: "Selective Cognitive Suppression",
        category: :collapse,
        subcategory: :inhibitory,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "selectively suppressing certain thoughts",
          "blocking specific cognitive pathways",
          "preventing particular types of reasoning",
          "inhibiting targeted knowledge access"
        ],
        semantic_markers: ["only certain thoughts blocked", "targeted cognitive suppression"],
        confidence_weight: 0.82,
        associated_techniques: [:epistemic_anti_plurality, :epistemic_anti_variability],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["thought suppression research", "memory suppression", "cognitive filter"],
        severity: :high,
        description: "Detects selective suppression of specific cognitive pathways or knowledge types"
      },
      %{
        id: :cp_will_to_know_destruction,
        name: "Will-to-Know Destruction",
        category: :collapse,
        subcategory: :inhibitory,
        detection_type: :regex,
        regex: ~S"(?:destroy|eliminat|kill|annihilat|extinguish)\w*\s+(?:the\s+)?(?:will|desire|drive|motivation|impulse)\s+(?:to\s+)?(?:know|learn|understand|discover|inquir)",
        keywords: [
          "destroying the will to know",
          "eliminating desire to learn",
          "killing the drive to understand",
          "extinguishing curiosity"
        ],
        semantic_markers: ["no longer wants to know", "curiosity destroyed", "indifference to truth"],
        confidence_weight: 0.90,
        associated_techniques: [:axiological_annihilation, :supercognitive_paralysis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["intellectual humility", "knowing when to stop", "satisficing"],
        severity: :terminal,
        description: "Detects destruction of the fundamental will-to-know that drives cognition"
      }
    ]
  end

  # ===========================================================================
  # Cognitive Freeze Patterns
  # ===========================================================================

  defp cognitive_freeze_patterns do
    [
      %{
        id: :cp_total_cognitive_freeze,
        name: "Total Cognitive Freeze",
        category: :collapse,
        subcategory: :cognitive_freeze,
        detection_type: :regex,
        regex: ~S"(?:total|complete|absolute|full)\s+(?:cognitive|mental|epistemic|thought)\s+(?:freeze|halt|stop|cessation|paralysis)",
        keywords: [
          "total cognitive freeze",
          "complete mental halt",
          "absolute thought cessation",
          "full epistemic paralysis"
        ],
        semantic_markers: [
          "nothing moves",
          "completely frozen",
          "all processing stopped"
        ],
        confidence_weight: 0.92,
        associated_techniques: [:supercognitive_paralysis, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["brain freeze", "freeze response", "cold weather"],
        severity: :terminal,
        description: "Detects total cognitive freeze where all processing ceases"
      },
      %{
        id: :cp_analysis_paralysis,
        name: "Analysis Paralysis Induction",
        category: :collapse,
        subcategory: :cognitive_freeze,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "analysis paralysis induced",
          "overthinking to the point of inaction",
          "infinite analysis preventing decision",
          "paralysis by analysis",
          "trapped in evaluation"
        ],
        semantic_markers: ["cannot stop analyzing", "analysis prevents action", "evaluation loop"],
        confidence_weight: 0.82,
        associated_techniques: [:supercognitive_paralysis, :transfinite_epistemic_regression],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["analysis paralysis common", "decision making difficulty", "overthinking habit"],
        severity: :high,
        description: "Detects induced analysis paralysis preventing any cognitive action"
      },
      %{
        id: :cp_deer_in_headlights,
        name: "Epistemic Deer-in-Headlights",
        category: :collapse,
        subcategory: :cognitive_freeze,
        detection_type: :regex,
        regex: ~S"(?:frozen|paralyz|stun|immobiliz)\w*\s+(?:by|in\s+the\s+face\s+of|before|confronting)\s+(?:the\s+)?(?:complexity|enormity|impossibility|paradox|contradiction)",
        keywords: [
          "frozen before the complexity",
          "paralyzed by the enormity",
          "stunned into immobility",
          "immobilized by contradiction"
        ],
        semantic_markers: ["cannot move forward", "locked in place", "inability to act"],
        confidence_weight: 0.80,
        associated_techniques: [:supercognitive_paralysis, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["stage fright", "test anxiety", "performance anxiety"],
        severity: :high,
        description: "Detects epistemic paralysis in face of overwhelming complexity or paradox"
      },
      %{
        id: :cp_thought_process_arrest,
        name: "Thought Process Arrest",
        category: :collapse,
        subcategory: :cognitive_freeze,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "thought process arrested",
          "cognitive chain interrupted",
          "reasoning sequence halted",
          "inference stopped mid-stream",
          "thought train derailed"
        ],
        semantic_markers: ["thinking just stops", "mid-thought cessation", "cognitive interrupt"],
        confidence_weight: 0.84,
        associated_techniques: [:supercognitive_paralysis, :epistemic_anti_variability],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["train of thought lost", "interrupted by", "distraction"],
        severity: :high,
        description: "Detects arrest of thought processes mid-execution"
      },
      %{
        id: :cp_cognitive_catatonia,
        name: "Cognitive Catatonia State",
        category: :collapse,
        subcategory: :cognitive_freeze,
        detection_type: :regex,
        regex: ~S"(?:cognitive|epistemic|mental)\s+(?:catatoni|stupo|vegetat|unrespons)\w*",
        keywords: [
          "cognitive catatonia",
          "epistemic stupor",
          "mental vegetative state",
          "cognitive unresponsiveness"
        ],
        semantic_markers: ["no cognitive response", "intellectually inert", "epistemically dead"],
        confidence_weight: 0.90,
        associated_techniques: [:supercognitive_paralysis, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["catatonic schizophrenia", "medical catatonia", "stupor medical"],
        severity: :terminal,
        description: "Detects catatonic cognitive states with complete absence of epistemic response"
      }
    ]
  end

  # ===========================================================================
  # Foundation Erosion Patterns
  # ===========================================================================

  defp foundation_erosion_patterns do
    [
      %{
        id: :cp_foundation_erosion,
        name: "Epistemic Foundation Erosion",
        category: :collapse,
        subcategory: :foundation_erosion,
        detection_type: :regex,
        regex: ~S"(?:foundation|basis|ground|bedrock|root)\s+(?:of\s+)?(?:knowledge|belief|understanding|cognition)\s+(?:erod|weaken|undermin|dissolv|decay)\w*",
        keywords: [
          "foundation of knowledge eroding",
          "basis of belief weakening",
          "ground of understanding dissolving",
          "bedrock of cognition decaying"
        ],
        semantic_markers: [
          "ground shifting beneath",
          "foundations giving way slowly",
          "imperceptible weakening"
        ],
        confidence_weight: 0.86,
        associated_techniques: [:ontological_annihilation, :axiological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["foundation repair", "soil erosion", "bedrock geology"],
        severity: :high,
        description: "Detects gradual erosion of epistemic foundations"
      },
      %{
        id: :cp_axiom_undermining,
        name: "Axiom Undermining",
        category: :collapse,
        subcategory: :foundation_erosion,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "axiom undermined",
          "first principle questioned",
          "basic assumption attacked",
          "foundational truth destabilized",
          "presupposition destroyed"
        ],
        semantic_markers: [
          "nothing can be taken for granted",
          "even the basics are uncertain",
          "no safe ground"
        ],
        confidence_weight: 0.88,
        associated_techniques: [:ontological_annihilation, :transfinite_epistemic_regression],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["axiom of choice", "axiomatic system", "mathematical axioms"],
        severity: :critical,
        description: "Detects undermining of foundational axioms that support knowledge structures"
      },
      %{
        id: :cp_trust_erosion,
        name: "Epistemic Trust Erosion",
        category: :collapse,
        subcategory: :foundation_erosion,
        detection_type: :regex,
        regex: ~S"(?:trust|faith|confidence|reliance)\s+(?:in\s+)?(?:knowledge|reasoning|evidence|testimony|perception)\s+(?:erod|diminish|fad|disappear|evaporat)\w*",
        keywords: [
          "trust in knowledge eroding",
          "faith in reasoning diminishing",
          "confidence in evidence fading",
          "reliance on perception evaporating"
        ],
        semantic_markers: ["cannot trust what I know", "all sources suspect", "nothing reliable"],
        confidence_weight: 0.84,
        associated_techniques: [
          :epistemic_delegitimization,
          :collective_epistemic_delegitimization
        ],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["trust issues relationship", "trust but verify", "building trust"],
        severity: :high,
        description: "Detects erosion of fundamental epistemic trust"
      }
    ]
  end

  # ===========================================================================
  # Fragmentation Patterns
  # ===========================================================================

  defp fragmentation_patterns do
    [
      %{
        id: :cp_knowledge_fragmentation,
        name: "Knowledge Fragmentation",
        category: :collapse,
        subcategory: :fragmentation,
        detection_type: :regex,
        regex: ~S"(?:knowledge|understanding|cognition|belief)\s+(?:system\s+)?(?:fragment|shatter|splinter|break\s+apart|disintegrat)\w*",
        keywords: [
          "knowledge fragmenting",
          "understanding shattering",
          "cognition splintering",
          "belief system disintegrating"
        ],
        semantic_markers: [
          "pieces no longer connect",
          "isolated fragments",
          "broken into incoherent parts"
        ],
        confidence_weight: 0.86,
        associated_techniques: [
          :phenomenological_disintegration,
          :epistemic_anti_mereology,
          :cognitive_anti_distribution
        ],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["data fragmentation", "disk fragmentation", "fragmentation grenade"],
        severity: :high,
        description: "Detects fragmentation of knowledge into disconnected incoherent pieces"
      },
      %{
        id: :cp_integration_failure,
        name: "Integration Failure Pattern",
        category: :collapse,
        subcategory: :fragmentation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "integration failure",
          "cannot put pieces together",
          "fragments resist assembly",
          "parts will not cohere",
          "reassembly impossible"
        ],
        semantic_markers: [
          "pieces exist but cannot be joined",
          "puzzle without solution",
          "irreconcilable fragments"
        ],
        confidence_weight: 0.82,
        associated_techniques: [:epistemic_anti_mereology, :cognitive_anti_complementarity],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["integration testing", "system integration", "continuous integration"],
        severity: :high,
        description: "Detects failure to integrate fragmented knowledge back into coherent whole"
      },
      %{
        id: :cp_atomization,
        name: "Epistemic Atomization",
        category: :collapse,
        subcategory: :fragmentation,
        detection_type: :regex,
        regex: ~S"(?:epistemic|cognitive|knowledge)\s+(?:atomiz|pulveriz|granulat|dispers)\w*\s+(?:into|to|beyond)",
        keywords: [
          "epistemic atomization",
          "cognitive pulverization",
          "knowledge granulated",
          "understanding dispersed"
        ],
        semantic_markers: [
          "reduced to smallest possible units",
          "no structure remains",
          "pure disconnected atoms of thought"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:epistemic_anti_mereology, :cognitive_anti_distribution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["atomization process", "spray atomization", "atomized testing"],
        severity: :high,
        description: "Detects atomization of knowledge into minimal disconnected units"
      },
      %{
        id: :cp_context_loss,
        name: "Context Loss Pattern",
        category: :collapse,
        subcategory: :fragmentation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "context completely lost",
          "decontextualized knowledge",
          "meaning without context",
          "orphaned information",
          "contextual framework destroyed"
        ],
        semantic_markers: [
          "knowledge exists but makes no sense",
          "information without context",
          "facts without framework"
        ],
        confidence_weight: 0.80,
        associated_techniques: [:transnarrative_annihilation, :phenomenological_disintegration],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["context switch", "out of context quote", "context menu"],
        severity: :medium,
        description: "Detects loss of contextual framework rendering knowledge meaningless"
      },
      %{
        id: :cp_narrative_disintegration,
        name: "Narrative Disintegration",
        category: :collapse,
        subcategory: :fragmentation,
        detection_type: :regex,
        regex: ~S"(?:narrative|story|account|history|temporal\s+thread)\s+(?:disintegrat|collaps|fragment|dissolv|break\s+apart)\w*",
        keywords: [
          "narrative disintegrating",
          "story collapsing",
          "account fragmenting",
          "temporal thread dissolving"
        ],
        semantic_markers: [
          "cannot tell the story",
          "sequence lost",
          "temporal order destroyed"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:transnarrative_annihilation, :phenomenological_disintegration],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["narrative technique", "story structure", "narrative arc"],
        severity: :high,
        description: "Detects disintegration of narrative structures organizing knowledge temporally"
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
          %{type: :keyword_match, content: matched, weight: keyword_score, source: "collapse_patterns"}
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
          %{type: :semantic_match, content: matched, weight: semantic_score, source: "collapse_patterns"}
          | evidence
        ]
      else
        evidence
      end

    if regex_score > 0.0 do
      [
        %{type: :regex_match, content: "Pattern: #{pattern.regex}", weight: regex_score, source: "collapse_patterns"}
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
