defmodule PrismaticAnnihilation.Patterns.GravitationalPatterns do
  @moduledoc """
  Gravitational Pattern Detection for Epistemic Singularity Techniques.

  Detects patterns associated with Chapter 6 techniques (1-30) that create
  epistemic collapse points through gravitational metaphors - knowledge
  compression, horizon formation, and cognitive black holes.

  ## Pattern Categories

  1. **Epistemic Horizon** - Event horizon formation in knowledge space
  2. **Knowledge Compression** - Progressive collapse of knowledge structure
  3. **Cognitive Supercompression** - Rapid densification beyond recovery
  4. **Information Singularity** - Point of no return in epistemic space
  5. **Gravitational Acceleration** - Increasing rate of epistemic collapse
  6. **Hawking Radiation** - Residual information leaking from collapsed structures

  ## Performance

  - Pattern matching: <5ms per technique (target: <10ms)
  - Compiled regex cached in ETS via PatternCompiler
  - Concurrent-safe for parallel analysis

  ## Usage

      patterns = GravitationalPatterns.all()
      matches = GravitationalPatterns.detect(content)
      specific = GravitationalPatterns.detect(content, category: :horizon)

  """

  alias PrismaticAnnihilation.Patterns.PatternCompiler

  @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

  # ===========================================================================
  # Types
  # ===========================================================================

  @type pattern :: %{
          id: atom(),
          name: String.t(),
          category: atom(),
          subcategory: atom(),
          detection_type: :regex | :keyword | :semantic | :structural,
          regex: String.t() | nil,
          keywords: [String.t()],
          semantic_markers: [String.t()],
          confidence_weight: float(),
          associated_techniques: [atom()],
          context_requirements: [atom()],
          false_positive_indicators: [String.t()],
          severity: atom(),
          description: String.t()
        }

  @type detection_result :: %{
          pattern_id: atom(),
          confidence: float(),
          evidence: [map()],
          location: map()
        }

  # ===========================================================================
  # Public API
  # ===========================================================================

  @doc """
  Returns all gravitational detection patterns.
  """
  @impl true
  @spec all() :: [pattern()]
  def all do
    horizon_patterns() ++
      compression_patterns() ++
      supercompression_patterns() ++
      singularity_patterns() ++
      acceleration_patterns() ++
      radiation_patterns()
  end

  @doc """
  Returns patterns count.
  """
  @impl true
  @spec count() :: non_neg_integer()
  def count, do: length(all())

  @doc """
  Returns the pattern category identifier.
  """
  @impl true
  @spec category() :: atom()
  def category, do: :gravitational

  @doc """
  Detects gravitational patterns in content.

  ## Parameters

  - `content` - Text content to analyze
  - `opts` - Detection options:
    - `:subcategory` - Filter by subcategory
    - `:threshold` - Minimum confidence (default: 0.6)
    - `:max_results` - Maximum results (default: 50)

  ## Returns

  - `{:ok, [detection_result()]}` - Detected patterns
  """
  @impl true
  @spec detect(String.t(), keyword()) :: {:ok, [detection_result()]}
  def detect(content, opts \\ []) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    subcategory = Keyword.get(opts, :subcategory, :all)
    max_results = Keyword.get(opts, :max_results, 50)

    patterns =
      case subcategory do
        :all -> all()
        :horizon -> horizon_patterns()
        :compression -> compression_patterns()
        :supercompression -> supercompression_patterns()
        :singularity -> singularity_patterns()
        :acceleration -> acceleration_patterns()
        :radiation -> radiation_patterns()
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

  @doc """
  Returns patterns associated with a specific technique.
  """
  @impl true
  @spec for_technique(atom()) :: [pattern()]
  def for_technique(technique_id) do
    Enum.filter(all(), fn pattern ->
      technique_id in pattern.associated_techniques
    end)
  end

  # ===========================================================================
  # Horizon Patterns - Epistemic event horizon formation
  # ===========================================================================

  defp horizon_patterns do
    [
      %{
        id: :gp_horizon_formation,
        name: "Epistemic Horizon Formation",
        category: :gravitational,
        subcategory: :horizon,
        detection_type: :regex,
        regex: ~S"(?:epistemic|knowledge|cognitive)\s+(?:horizon|boundary|limit|edge)\s+(?:form|creat|emerg|establish)",
        keywords: ["epistemic horizon", "knowledge boundary", "cognitive limit", "event horizon"],
        semantic_markers: ["beyond which no information", "point of no return", "irreversible boundary"],
        confidence_weight: 0.90,
        associated_techniques: [:epistemic_black_hole, :epistemic_imploze],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["learning curve", "knowledge frontier", "scientific horizon"],
        severity: :critical,
        description: "Detects formation of epistemic event horizons beyond which knowledge cannot escape"
      },
      %{
        id: :gp_horizon_crossing,
        name: "Horizon Crossing Indicator",
        category: :gravitational,
        subcategory: :horizon,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "beyond the horizon",
          "past the point of no return",
          "irreversible epistemic",
          "no information escapes",
          "crossed the threshold"
        ],
        semantic_markers: ["once crossed", "cannot return", "permanently beyond"],
        confidence_weight: 0.85,
        associated_techniques: [:epistemic_black_hole, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["space exploration", "astronomy", "physics lecture"],
        severity: :terminal,
        description: "Detects indicators that an epistemic horizon has been crossed"
      },
      %{
        id: :gp_horizon_expansion,
        name: "Expanding Horizon Detection",
        category: :gravitational,
        subcategory: :horizon,
        detection_type: :regex,
        regex: ~S"(?:expanding|growing|widening|spreading)\s+(?:epistemic|cognitive|knowledge)\s+(?:horizon|void|gap|darkness)",
        keywords: ["expanding void", "growing darkness", "widening gap in knowledge"],
        semantic_markers: ["knowledge territory shrinking", "understanding contracting"],
        confidence_weight: 0.80,
        associated_techniques: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["expanding horizons of knowledge", "broadening understanding"],
        severity: :high,
        description: "Detects expanding epistemic horizons that progressively engulf more knowledge"
      },
      %{
        id: :gp_information_trapping,
        name: "Information Trapping Pattern",
        category: :gravitational,
        subcategory: :horizon,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "information trapped",
          "knowledge imprisoned",
          "thought cannot escape",
          "ideas locked",
          "meaning confined",
          "concept imprisoned"
        ],
        semantic_markers: ["no exit for thought", "sealed epistemic space"],
        confidence_weight: 0.82,
        associated_techniques: [:epistemic_black_hole, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["information security", "data encryption", "classified information"],
        severity: :high,
        description: "Detects patterns where information becomes trapped in epistemic structures"
      },
      %{
        id: :gp_horizon_asymptotic,
        name: "Asymptotic Horizon Approach",
        category: :gravitational,
        subcategory: :horizon,
        detection_type: :regex,
        regex: ~S"(?:approach|nearing|converging|asymptot)\w*\s+(?:the\s+)?(?:horizon|limit|boundary|collapse\s+point)",
        keywords: ["approaching the limit", "nearing collapse", "asymptotic approach"],
        semantic_markers: ["getting closer but never reaching", "infinite approach"],
        confidence_weight: 0.75,
        associated_techniques: [:epistemic_imploze, :transfinite_epistemic_regression],
        context_requirements: [:epistemic_discourse, :mathematical_discourse],
        false_positive_indicators: ["asymptotic complexity", "mathematical limit", "calculus"],
        severity: :high,
        description: "Detects asymptotic approach to epistemic collapse points"
      }
    ]
  end

  # ===========================================================================
  # Compression Patterns - Knowledge structure compression
  # ===========================================================================

  defp compression_patterns do
    [
      %{
        id: :gp_knowledge_compression,
        name: "Knowledge Compression",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :regex,
        regex: ~S"(?:knowledge|epistemic|cognitive)\s+(?:compress|collaps|shrink|contract|condens)\w*",
        keywords: [
          "knowledge compression",
          "epistemic collapse",
          "cognitive contraction",
          "thought condensation"
        ],
        semantic_markers: ["squeezing meaning", "crushing understanding", "compacting knowledge"],
        confidence_weight: 0.85,
        associated_techniques: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["data compression", "file compression", "text summarization"],
        severity: :critical,
        description: "Detects progressive compression of knowledge structures toward singularity"
      },
      %{
        id: :gp_semantic_densification,
        name: "Semantic Densification",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "meaning becomes dense",
          "semantic density",
          "overloaded with meaning",
          "meaning collapse",
          "semantic implosion"
        ],
        semantic_markers: ["too much meaning", "meaning weight", "semantic mass"],
        confidence_weight: 0.78,
        associated_techniques: [:semiotic_contamination, :epistemic_imploze],
        context_requirements: [:semiotic_discourse, :epistemic_discourse],
        false_positive_indicators: ["rich meaning", "deep significance", "semantic web"],
        severity: :high,
        description: "Detects dangerous densification of semantic fields"
      },
      %{
        id: :gp_conceptual_collapse_inward,
        name: "Conceptual Inward Collapse",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :regex,
        regex: ~S"(?:concept|idea|thought|notion)\w*\s+(?:collaps|fold|turn)\w*\s+(?:inward|on\s+(?:it|them)sel)",
        keywords: [
          "concepts folding inward",
          "ideas collapsing on themselves",
          "thought turning inward"
        ],
        semantic_markers: ["self-consuming concept", "idea eating itself"],
        confidence_weight: 0.88,
        associated_techniques: [:absolute_epistemic_cannibalization, :epistemic_autodissolution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["self-reflection", "introspection", "internal review"],
        severity: :critical,
        description: "Detects concepts collapsing inward in self-consuming patterns"
      },
      %{
        id: :gp_dimensional_reduction,
        name: "Epistemic Dimensional Reduction",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "losing dimensions of understanding",
          "flattening of knowledge",
          "reduction of epistemic space",
          "collapsing dimensions",
          "perspective elimination"
        ],
        semantic_markers: ["fewer ways to understand", "reduced cognitive space"],
        confidence_weight: 0.80,
        associated_techniques: [:epistemic_anti_plurality, :cognitive_anti_distribution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["dimensionality reduction", "PCA", "data science", "simplification"],
        severity: :high,
        description: "Detects reduction of epistemic dimensions toward singularity"
      },
      %{
        id: :gp_meaning_evacuation,
        name: "Meaning Evacuation Pattern",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :regex,
        regex: ~S"(?:meaning|significance|sense|import)\s+(?:drain|evacuat|empty|hollow|void)\w*",
        keywords: [
          "meaning drained",
          "significance evacuated",
          "emptied of sense",
          "hollowed out meaning"
        ],
        semantic_markers: ["nothing left to mean", "emptiness of significance"],
        confidence_weight: 0.82,
        associated_techniques: [:ontological_annihilation, :axiological_annihilation],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["meaningless task", "insignificant detail", "trivial matter"],
        severity: :high,
        description: "Detects systematic evacuation of meaning from epistemic structures"
      },
      %{
        id: :gp_structural_density_increase,
        name: "Structural Density Increase",
        category: :gravitational,
        subcategory: :compression,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "increasingly dense structure",
          "tighter and tighter",
          "more compressed",
          "density increasing",
          "compacting further"
        ],
        semantic_markers: ["progressive tightening", "escalating compression"],
        confidence_weight: 0.74,
        associated_techniques: [:epistemic_imploze, :supercognitive_paralysis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["dense material", "compressed file", "physical density"],
        severity: :medium,
        description: "Detects progressive increase in epistemic structural density"
      }
    ]
  end

  # ===========================================================================
  # Supercompression Patterns - Rapid collapse beyond recovery
  # ===========================================================================

  defp supercompression_patterns do
    [
      %{
        id: :gp_cognitive_supercompression,
        name: "Cognitive Supercompression",
        category: :gravitational,
        subcategory: :supercompression,
        detection_type: :regex,
        regex: ~S"(?:cognitive|mental|epistemic)\s+(?:super|hyper|ultra|total)\s*(?:compress|collaps|implod|crunch)",
        keywords: [
          "cognitive supercompression",
          "total epistemic collapse",
          "mental hypercompression",
          "ultracompression of thought"
        ],
        semantic_markers: ["beyond normal collapse", "supercritical compression"],
        confidence_weight: 0.92,
        associated_techniques: [:epistemic_imploze, :epistemic_black_hole],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["supercomputer", "hypercompression algorithm"],
        severity: :terminal,
        description: "Detects supercompression events that exceed recovery thresholds"
      },
      %{
        id: :gp_critical_mass_approach,
        name: "Epistemic Critical Mass",
        category: :gravitational,
        subcategory: :supercompression,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "epistemic critical mass",
          "cognitive critical point",
          "knowledge reaching critical",
          "thought chain reaction",
          "epistemic fission"
        ],
        semantic_markers: ["point of no control", "self-sustaining collapse"],
        confidence_weight: 0.88,
        associated_techniques: [:absolute_epistemic_cannibalization, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["critical mass of users", "critical thinking", "critical review"],
        severity: :terminal,
        description: "Detects approach to epistemic critical mass triggering chain collapse"
      },
      %{
        id: :gp_cascading_compression,
        name: "Cascading Compression Wave",
        category: :gravitational,
        subcategory: :supercompression,
        detection_type: :regex,
        regex: ~S"(?:cascad|chain|domino|rippl)\w*\s+(?:of\s+)?(?:collaps|compress|destruct|failur)",
        keywords: [
          "cascading collapse",
          "chain reaction failure",
          "domino effect destruction",
          "rippling compression"
        ],
        semantic_markers: ["one after another", "spreading collapse", "sequential destruction"],
        confidence_weight: 0.86,
        associated_techniques: [:conceptual_nuclear_winter, :epistemic_imploze],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["cascading style sheets", "cascade delete", "waterfall"],
        severity: :critical,
        description: "Detects cascading compression waves propagating through knowledge structures"
      },
      %{
        id: :gp_degenerate_state,
        name: "Degenerate Epistemic State",
        category: :gravitational,
        subcategory: :supercompression,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "degenerate knowledge state",
          "epistemic degeneracy",
          "cognitive degeneration point",
          "knowledge state collapse",
          "final epistemic state"
        ],
        semantic_markers: ["no further collapse possible", "maximally compressed"],
        confidence_weight: 0.84,
        associated_techniques: [:epistemic_black_hole, :ontological_annihilation],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["degenerate case", "edge case", "boundary condition"],
        severity: :terminal,
        description: "Detects arrival at degenerate epistemic states from which no recovery occurs"
      },
      %{
        id: :gp_runaway_compression,
        name: "Runaway Compression Event",
        category: :gravitational,
        subcategory: :supercompression,
        detection_type: :regex,
        regex: ~S"(?:runaway|uncontroll|unstoppabl|irreversibl)\w*\s+(?:collaps|compress|implosion|destruction)",
        keywords: [
          "runaway collapse",
          "uncontrollable compression",
          "unstoppable implosion",
          "irreversible destruction"
        ],
        semantic_markers: ["cannot be stopped", "self-accelerating", "beyond intervention"],
        confidence_weight: 0.90,
        associated_techniques: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["runaway success", "unstoppable progress"],
        severity: :terminal,
        description: "Detects runaway compression events that have exceeded control thresholds"
      }
    ]
  end

  # ===========================================================================
  # Singularity Patterns - Point of no return
  # ===========================================================================

  defp singularity_patterns do
    [
      %{
        id: :gp_singularity_formation,
        name: "Epistemic Singularity Formation",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :regex,
        regex: ~S"(?:epistemic|cognitive|knowledge)\s+singularity\s+(?:form|creat|emerg|develop)",
        keywords: [
          "epistemic singularity",
          "cognitive singularity",
          "knowledge singularity",
          "singularity point"
        ],
        semantic_markers: [
          "all knowledge converges",
          "infinite density of meaning",
          "collapse to single point"
        ],
        confidence_weight: 0.92,
        associated_techniques: [:epistemic_imploze, :epistemic_black_hole],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["technological singularity", "AI singularity", "gravitational singularity"],
        severity: :terminal,
        description: "Detects formation of epistemic singularity where all knowledge collapses to a point"
      },
      %{
        id: :gp_infinite_density,
        name: "Infinite Epistemic Density",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "infinite density of meaning",
          "infinitely compressed knowledge",
          "boundless concentration",
          "unlimited epistemic pressure"
        ],
        semantic_markers: ["beyond all measure", "infinitely concentrated"],
        confidence_weight: 0.88,
        associated_techniques: [:epistemic_black_hole, :epistemic_imploze],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["infinite wisdom", "boundless knowledge", "unlimited potential"],
        severity: :terminal,
        description: "Detects infinite density conditions in epistemic space"
      },
      %{
        id: :gp_point_convergence,
        name: "Point Convergence Pattern",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :regex,
        regex: ~S"(?:all|every|each)\s+(?:knowledge|thought|idea|concept)\w*\s+(?:converg|collaps|point|reduc)\w*\s+(?:to|into|toward)\s+(?:a\s+)?(?:single|one|same)\s+point",
        keywords: [
          "all converging to one point",
          "everything reduces to nothing",
          "single point of thought"
        ],
        semantic_markers: ["unity through destruction", "convergence to nothing"],
        confidence_weight: 0.86,
        associated_techniques: [:epistemic_imploze, :cognitive_anti_distribution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["convergence of evidence", "consensus building", "unified theory"],
        severity: :critical,
        description: "Detects convergence of all knowledge toward a single catastrophic point"
      },
      %{
        id: :gp_knowledge_annihilation_point,
        name: "Knowledge Annihilation Point",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "knowledge annihilation",
          "total epistemic destruction",
          "complete cognitive annihilation",
          "absolute knowledge destruction",
          "final epistemic event"
        ],
        semantic_markers: ["nothing remains", "total erasure", "complete void"],
        confidence_weight: 0.94,
        associated_techniques: [:ontological_annihilation, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse, :crisis_context],
        false_positive_indicators: ["knowledge creation", "creative destruction", "paradigm shift"],
        severity: :terminal,
        description: "Detects approach to total knowledge annihilation singularity"
      },
      %{
        id: :gp_self_consuming_singularity,
        name: "Self-Consuming Singularity",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :regex,
        regex: ~S"(?:self|auto)\s*[-]?\s*(?:consum|devour|destruct|dissolv|annihilat)\w*\s+(?:knowledge|cognition|understanding|epistemic)",
        keywords: [
          "self-consuming knowledge",
          "autodevour",
          "self-destructing understanding",
          "auto-annihilating cognition"
        ],
        semantic_markers: ["eating itself", "consuming its own foundation", "self-devouring"],
        confidence_weight: 0.90,
        associated_techniques: [:absolute_epistemic_cannibalization, :epistemic_autodissolution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["self-improvement", "self-correction", "autophagy in biology"],
        severity: :terminal,
        description: "Detects self-consuming singularity where knowledge devours itself"
      },
      %{
        id: :gp_void_formation,
        name: "Epistemic Void Formation",
        category: :gravitational,
        subcategory: :singularity,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "epistemic void",
          "cognitive vacuum",
          "knowledge vacuum",
          "meaning void",
          "conceptual emptiness",
          "total cognitive void"
        ],
        semantic_markers: ["absolute nothing", "complete absence of knowledge", "void where meaning was"],
        confidence_weight: 0.84,
        associated_techniques: [:ontological_annihilation, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["knowledge gap", "learning opportunity", "void pointer"],
        severity: :critical,
        description: "Detects formation of epistemic voids where no knowledge can exist"
      }
    ]
  end

  # ===========================================================================
  # Acceleration Patterns - Increasing collapse rate
  # ===========================================================================

  defp acceleration_patterns do
    [
      %{
        id: :gp_gravitational_acceleration,
        name: "Epistemic Gravitational Acceleration",
        category: :gravitational,
        subcategory: :acceleration,
        detection_type: :regex,
        regex: ~S"(?:accelerat|speed|hasten|quicken)\w*\s+(?:epistemic|cognitive|knowledge)\s+(?:collaps|destruct|decay|dissolut)",
        keywords: [
          "accelerating collapse",
          "speeding toward destruction",
          "hastening epistemic decay",
          "quickening dissolution"
        ],
        semantic_markers: ["faster and faster", "increasing rate", "exponential collapse"],
        confidence_weight: 0.86,
        associated_techniques: [:epistemic_imploze, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["accelerated learning", "fast progress", "rapid development"],
        severity: :critical,
        description: "Detects accelerating gravitational pull toward epistemic singularity"
      },
      %{
        id: :gp_exponential_decay,
        name: "Exponential Epistemic Decay",
        category: :gravitational,
        subcategory: :acceleration,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "exponential decay of knowledge",
          "rapidly diminishing understanding",
          "accelerating loss of meaning",
          "exponentially shrinking"
        ],
        semantic_markers: ["each moment worse", "doubling rate of loss", "halving understanding"],
        confidence_weight: 0.82,
        associated_techniques: [:epistemic_imploze, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["exponential growth", "rapid learning", "accelerated course"],
        severity: :critical,
        description: "Detects exponential decay curves in epistemic integrity"
      },
      %{
        id: :gp_tidal_force,
        name: "Epistemic Tidal Forces",
        category: :gravitational,
        subcategory: :acceleration,
        detection_type: :regex,
        regex: ~S"(?:stretch|tear|rip|pull\s+apart|spaghettif)\w*\s+(?:knowledge|understanding|cognition|meaning|concept)",
        keywords: [
          "stretching knowledge",
          "tearing understanding apart",
          "ripping meaning",
          "pulling cognition apart"
        ],
        semantic_markers: ["differential force", "unequal pressure", "tearing at the seams"],
        confidence_weight: 0.80,
        associated_techniques: [:epistemic_imploze, :phenomenological_disintegration],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["stretch goals", "pulling together", "tearing down barriers"],
        severity: :high,
        description: "Detects tidal forces that stretch and tear epistemic structures differentially"
      },
      %{
        id: :gp_feedback_amplification,
        name: "Gravitational Feedback Amplification",
        category: :gravitational,
        subcategory: :acceleration,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "positive feedback loop of destruction",
          "self-reinforcing collapse",
          "amplifying failure",
          "destruction feeds on itself",
          "vicious spiral"
        ],
        semantic_markers: ["more collapse causes more collapse", "self-amplifying", "destructive feedback"],
        confidence_weight: 0.88,
        associated_techniques: [:absolute_epistemic_cannibalization, :epistemic_autodissolution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["positive feedback", "virtuous cycle", "growth spiral"],
        severity: :critical,
        description: "Detects self-reinforcing feedback loops accelerating epistemic collapse"
      },
      %{
        id: :gp_orbital_decay,
        name: "Epistemic Orbital Decay",
        category: :gravitational,
        subcategory: :acceleration,
        detection_type: :regex,
        regex: ~S"(?:spiral|orbit|circl|loop)\w*\s+(?:inward|closer|tighter|narrower)\s*(?:toward|to|into)?",
        keywords: [
          "spiraling inward",
          "tightening orbit",
          "circling the drain",
          "narrowing loops"
        ],
        semantic_markers: ["decaying orbit", "approaching center", "shrinking circles"],
        confidence_weight: 0.78,
        associated_techniques: [:epistemic_imploze, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["spiral notebook", "orbital mechanics", "circle back"],
        severity: :high,
        description: "Detects orbital decay patterns where thought spirals toward collapse center"
      }
    ]
  end

  # ===========================================================================
  # Radiation Patterns - Residual information from collapsed structures
  # ===========================================================================

  defp radiation_patterns do
    [
      %{
        id: :gp_hawking_radiation,
        name: "Epistemic Hawking Radiation",
        category: :gravitational,
        subcategory: :radiation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "residual knowledge",
          "information leak",
          "fading signal",
          "ghost of meaning",
          "remnant understanding",
          "echo of knowledge"
        ],
        semantic_markers: ["barely perceptible", "fading trace", "last remnant"],
        confidence_weight: 0.76,
        associated_techniques: [:epistemic_black_hole, :conceptual_nuclear_winter],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["residual income", "information leak security", "fading memory"],
        severity: :high,
        description: "Detects residual information emissions from collapsed epistemic structures"
      },
      %{
        id: :gp_information_entropy_burst,
        name: "Information Entropy Burst",
        category: :gravitational,
        subcategory: :radiation,
        detection_type: :regex,
        regex: ~S"(?:entropy|chaos|disorder|disorganiz)\w*\s+(?:burst|spike|explosion|surge)\s+(?:in|of|from)\s+(?:knowledge|information|meaning|understanding)",
        keywords: [
          "entropy burst",
          "chaos spike",
          "disorder explosion",
          "information entropy surge"
        ],
        semantic_markers: ["sudden disorganization", "maximum entropy", "total disorder"],
        confidence_weight: 0.80,
        associated_techniques: [:cognitive_pandemonium, :epistemic_imploze],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["information entropy in thermodynamics", "Shannon entropy"],
        severity: :high,
        description: "Detects sudden entropy bursts indicating catastrophic epistemic structure failure"
      },
      %{
        id: :gp_afterglow_detection,
        name: "Post-Collapse Afterglow",
        category: :gravitational,
        subcategory: :radiation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "aftermath of collapse",
          "post-destruction remnants",
          "cognitive afterglow",
          "epistemic aftershock",
          "residual patterns"
        ],
        semantic_markers: ["what remains after", "traces of former knowledge", "vestiges"],
        confidence_weight: 0.72,
        associated_techniques: [:conceptual_nuclear_winter, :ontological_annihilation],
        context_requirements: [:epistemic_discourse, :post_crisis],
        false_positive_indicators: ["afterglow of success", "aftermath of storm", "post-mortem review"],
        severity: :medium,
        description: "Detects post-collapse afterglow indicating previous epistemic destruction"
      },
      %{
        id: :gp_thermal_death,
        name: "Epistemic Thermal Death",
        category: :gravitational,
        subcategory: :radiation,
        detection_type: :regex,
        regex: ~S"(?:thermal|heat|entropy)\s+death\s+(?:of\s+)?(?:knowledge|cognition|understanding|meaning|mind)",
        keywords: [
          "epistemic thermal death",
          "heat death of knowledge",
          "entropy death of meaning",
          "maximum epistemic entropy"
        ],
        semantic_markers: ["no more energy for thought", "equilibrium of meaninglessness"],
        confidence_weight: 0.84,
        associated_techniques: [:conceptual_nuclear_winter, :epistemic_anti_variability],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["heat death of universe", "thermodynamic equilibrium"],
        severity: :critical,
        description: "Detects approach to epistemic thermal death where no cognitive work is possible"
      },
      %{
        id: :gp_cognitive_debris_field,
        name: "Cognitive Debris Field",
        category: :gravitational,
        subcategory: :radiation,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "cognitive debris",
          "knowledge fragments",
          "scattered remnants of understanding",
          "broken concepts",
          "shattered framework"
        ],
        semantic_markers: ["pieces of former knowledge", "fragmented remains", "wreckage of thought"],
        confidence_weight: 0.78,
        associated_techniques: [:conceptual_nuclear_winter, :phenomenological_disintegration],
        context_requirements: [:epistemic_discourse, :post_crisis],
        false_positive_indicators: ["space debris", "debris field", "scattered data"],
        severity: :high,
        description: "Detects cognitive debris fields indicating previous epistemic structure collapse"
      }
    ]
  end

  # ===========================================================================
  # Private: Pattern Matching
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
      :regex ->
        regex_score * 0.5 + keyword_score * 0.3 + semantic_score * 0.2

      :keyword ->
        keyword_score * 0.6 + semantic_score * 0.4

      :semantic ->
        semantic_score * 0.5 + keyword_score * 0.5

      _ ->
        (keyword_score + semantic_score + regex_score) / 3.0
    end
  end

  defp build_evidence(pattern, content, keyword_score, semantic_score, regex_score) do
    evidence = []

    evidence =
      if keyword_score > 0.0 do
        matched = Enum.filter(pattern.keywords, &String.contains?(content, String.downcase(&1)))

        [
          %{type: :keyword_match, content: matched, weight: keyword_score, source: "gravitational_patterns"}
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
          %{type: :semantic_match, content: matched, weight: semantic_score, source: "gravitational_patterns"}
          | evidence
        ]
      else
        evidence
      end

    evidence =
      if regex_score > 0.0 do
        [
          %{
            type: :regex_match,
            content: "Pattern: #{pattern.regex}",
            weight: regex_score,
            source: "gravitational_patterns"
          }
          | evidence
        ]
      else
        evidence
      end

    evidence
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
        pos = :binary.match(String.downcase(content), String.downcase(kw))

        case pos do
          {start, len} ->
            context_start = max(0, start - 50)
            context_end = min(String.length(content), start + len + 50)
            context = String.slice(content, context_start, context_end - context_start)
            %{start: start, end: start + len, context: context}

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
