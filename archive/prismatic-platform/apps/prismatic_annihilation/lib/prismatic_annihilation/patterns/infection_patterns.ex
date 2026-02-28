defmodule PrismaticAnnihilation.Patterns.InfectionPatterns do
  @moduledoc """
  Infection Pattern Detection for Semiotic and Hypertransformative Techniques.

  Detects patterns associated with Chapter 8 techniques that spread through
  sign systems and corrupt meaning via viral transmission vectors.

  ## Pattern Categories

  1. **Semiotic Contamination** - Corruption spreading through sign systems
  2. **Meaning Corruption** - Progressive degradation of semantic content
  3. **Viral Transmission** - Exponential spread of epistemic corruption
  4. **Memetic Infection** - Self-replicating destructive idea patterns
  5. **Autoimmune Response** - Knowledge systems attacking themselves

  ## Performance

  - Pattern matching: <5ms per technique
  - Compiled regex cached in ETS via PatternCompiler
  - Concurrent-safe for parallel analysis

  ## Usage

      patterns = InfectionPatterns.all()
      {:ok, matches} = InfectionPatterns.detect(content)
      specific = InfectionPatterns.detect(content, subcategory: :semiotic)

  """

  alias PrismaticAnnihilation.Patterns.PatternCompiler

  @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

  # ===========================================================================
  # Public API
  # ===========================================================================

  @impl true
  @spec all() :: [map()]
  def all do
    semiotic_contamination_patterns() ++
      meaning_corruption_patterns() ++
      viral_transmission_patterns() ++
      memetic_infection_patterns() ++
      autoimmune_patterns()
  end

  @impl true
  @spec count() :: non_neg_integer()
  def count, do: length(all())

  @impl true
  @spec category() :: atom()
  def category, do: :infection

  @impl true
  @spec detect(String.t(), keyword()) :: {:ok, [map()]}
  def detect(content, opts \\ []) when is_binary(content) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    subcategory = Keyword.get(opts, :subcategory, :all)
    max_results = Keyword.get(opts, :max_results, 50)

    patterns =
      case subcategory do
        :all -> all()
        :semiotic -> semiotic_contamination_patterns()
        :meaning_corruption -> meaning_corruption_patterns()
        :viral -> viral_transmission_patterns()
        :memetic -> memetic_infection_patterns()
        :autoimmune -> autoimmune_patterns()
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
  # Semiotic Contamination Patterns
  # ===========================================================================

  defp semiotic_contamination_patterns do
    [
      %{
        id: :ip_semiotic_contamination_spread,
        name: "Semiotic Contamination Spread",
        category: :infection,
        subcategory: :semiotic,
        detection_type: :regex,
        regex: ~S"(?:semiotic|sign|symbol)\w*\s+(?:contaminat|infect|corrupt|poison|pollut)\w*",
        keywords: [
          "semiotic contamination",
          "sign system corruption",
          "symbol infection",
          "meaning pollution"
        ],
        semantic_markers: ["spreading through signs", "corrupted symbols", "infected language"],
        confidence_weight: 0.90,
        associated_techniques: [:semiotic_contamination, :epistemic_teratogenesis],
        context_requirements: [:semiotic_discourse, :epistemic_discourse],
        false_positive_indicators: [
          "environmental contamination",
          "water pollution",
          "biological infection"
        ],
        severity: :high,
        description: "Detects semiotic contamination spreading through sign systems"
      },
      %{
        id: :ip_sign_system_disruption,
        name: "Sign System Disruption",
        category: :infection,
        subcategory: :semiotic,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "sign system breakdown",
          "signifier detachment",
          "referent loss",
          "denotation failure",
          "connotation corruption",
          "sign chain broken"
        ],
        semantic_markers: [
          "words lose their meaning",
          "symbols become empty",
          "references collapse"
        ],
        confidence_weight: 0.85,
        associated_techniques: [:semiotic_contamination, :epistemic_anti_mereology],
        context_requirements: [:semiotic_discourse],
        false_positive_indicators: ["sign language", "road signs", "signage"],
        severity: :high,
        description: "Detects disruption of fundamental sign-signifier-signified relationships"
      },
      %{
        id: :ip_semantic_drift,
        name: "Pathological Semantic Drift",
        category: :infection,
        subcategory: :semiotic,
        detection_type: :regex,
        regex:
          ~S"(?:meaning|semantic|sense)\s+(?:drift|shift|slide|wander|migrat)\w*\s+(?:away|uncontrol|patholog|destabiliz)",
        keywords: [
          "meaning drifting away",
          "uncontrolled semantic shift",
          "pathological meaning migration"
        ],
        semantic_markers: ["words changing meaning", "shifting definitions", "unstable semantics"],
        confidence_weight: 0.82,
        associated_techniques: [:semiotic_contamination, :epistemic_autodissolution],
        context_requirements: [:semiotic_discourse, :epistemic_discourse],
        false_positive_indicators: [
          "semantic versioning",
          "continental drift",
          "language evolution"
        ],
        severity: :medium,
        description: "Detects pathological semantic drift where meanings shift uncontrollably"
      },
      %{
        id: :ip_referential_collapse,
        name: "Referential Chain Collapse",
        category: :infection,
        subcategory: :semiotic,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "referential collapse",
          "broken reference chain",
          "reference loop failure",
          "denotation chain break",
          "meaning reference lost"
        ],
        semantic_markers: [
          "nothing refers to anything",
          "circular reference trap",
          "empty reference"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:semiotic_contamination, :anti_autoreferential_paradoxical_loop],
        context_requirements: [:semiotic_discourse],
        false_positive_indicators: ["null reference", "dangling pointer", "broken link"],
        severity: :high,
        description: "Detects collapse of referential chains in sign systems"
      },
      %{
        id: :ip_semiotic_mutation,
        name: "Semiotic Mutation Pattern",
        category: :infection,
        subcategory: :semiotic,
        detection_type: :regex,
        regex:
          ~S"(?:sign|symbol|meaning|concept)\w*\s+(?:mutat|transform|morph|deform|distort)\w*\s+(?:into|beyond|unrecogniz)",
        keywords: [
          "signs mutating",
          "symbols transforming beyond recognition",
          "meaning morphing uncontrollably"
        ],
        semantic_markers: [
          "unrecognizable transformation",
          "monstrous mutation",
          "beyond original form"
        ],
        confidence_weight: 0.80,
        associated_techniques: [:epistemic_teratogenesis, :semiotic_contamination],
        context_requirements: [:semiotic_discourse],
        false_positive_indicators: [
          "genetic mutation",
          "software mutation testing",
          "morphological analysis"
        ],
        severity: :high,
        description: "Detects pathological mutations of semiotic elements"
      }
    ]
  end

  # ===========================================================================
  # Meaning Corruption Patterns
  # ===========================================================================

  defp meaning_corruption_patterns do
    [
      %{
        id: :ip_progressive_meaning_decay,
        name: "Progressive Meaning Decay",
        category: :infection,
        subcategory: :meaning_corruption,
        detection_type: :regex,
        regex: ~S"(?:meaning|sense|significance)\s+(?:decay|degrad|deteriorat|rot|decompos)\w*",
        keywords: [
          "meaning decay",
          "sense degradation",
          "significance deterioration",
          "semantic decomposition",
          "conceptual rot"
        ],
        semantic_markers: [
          "slowly losing meaning",
          "gradual corruption",
          "progressive deterioration"
        ],
        confidence_weight: 0.85,
        associated_techniques: [:semiotic_contamination, :axiological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["radioactive decay", "tooth decay", "urban decay"],
        severity: :high,
        description: "Detects progressive decay of meaning structures"
      },
      %{
        id: :ip_meaning_inversion,
        name: "Meaning Inversion Pattern",
        category: :infection,
        subcategory: :meaning_corruption,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "meaning inverted",
          "opposite of intended",
          "reversed significance",
          "truth becomes lie",
          "knowledge becomes ignorance",
          "inverted semantics"
        ],
        semantic_markers: ["everything means its opposite", "semantic inversion", "truth-lie swap"],
        confidence_weight: 0.88,
        associated_techniques: [:reflexivity_perversion, :semiotic_contamination],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["inverting a matrix", "color inversion", "inversion of control"],
        severity: :critical,
        description: "Detects systematic inversion of meaning where concepts become their opposites"
      },
      %{
        id: :ip_semantic_erosion,
        name: "Semantic Erosion",
        category: :infection,
        subcategory: :meaning_corruption,
        detection_type: :regex,
        regex:
          ~S"(?:semantic|meaning|conceptual)\s+(?:erosion|wearing|weathering|attrition|diminish)\w*",
        keywords: [
          "semantic erosion",
          "meaning wearing away",
          "conceptual attrition",
          "significance diminishing"
        ],
        semantic_markers: ["slowly wearing down", "gradual loss", "imperceptible reduction"],
        confidence_weight: 0.78,
        associated_techniques: [:epistemic_anti_variability, :axiological_annihilation],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["soil erosion", "erosion of trust", "erosion control"],
        severity: :medium,
        description: "Detects gradual semantic erosion wearing down meaning structures"
      },
      %{
        id: :ip_concept_hollowing,
        name: "Concept Hollowing",
        category: :infection,
        subcategory: :meaning_corruption,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "hollow concept",
          "empty signifier",
          "shell of meaning",
          "gutted understanding",
          "facade of knowledge"
        ],
        semantic_markers: [
          "looks intact but empty inside",
          "form without content",
          "meaningless shell"
        ],
        confidence_weight: 0.82,
        associated_techniques: [:ontological_annihilation, :semiotic_contamination],
        context_requirements: [:epistemic_discourse, :philosophical_argument],
        false_positive_indicators: ["hollow tree", "empty set", "hollow point"],
        severity: :high,
        description:
          "Detects hollowing of concepts where external form persists but meaning is gone"
      },
      %{
        id: :ip_polysemic_explosion,
        name: "Polysemic Explosion",
        category: :infection,
        subcategory: :meaning_corruption,
        detection_type: :regex,
        regex:
          ~S"(?:meaning|sense|interpretation)\w*\s+(?:multipl|proliferat|explod|fragment|split)\w*\s+(?:uncontrol|beyond|without\s+limit)",
        keywords: [
          "meanings multiplying uncontrollably",
          "interpretations proliferating",
          "sense fragmenting endlessly"
        ],
        semantic_markers: ["too many meanings", "infinite interpretations", "meaning overflow"],
        confidence_weight: 0.80,
        associated_techniques: [:cognitive_pandemonium, :semiotic_contamination],
        context_requirements: [:semiotic_discourse],
        false_positive_indicators: [
          "polysemy in linguistics",
          "multiple interpretations",
          "rich meaning"
        ],
        severity: :high,
        description:
          "Detects uncontrolled explosion of meanings rendering interpretation impossible"
      }
    ]
  end

  # ===========================================================================
  # Viral Transmission Patterns
  # ===========================================================================

  defp viral_transmission_patterns do
    [
      %{
        id: :ip_epistemic_viral_vector,
        name: "Epistemic Viral Vector",
        category: :infection,
        subcategory: :viral,
        detection_type: :regex,
        regex:
          ~S"(?:epistemic|cognitive|knowledge)\s+(?:virus|viral|infect|contagion|pathogen)\w*\s+(?:spread|transmit|propagat)",
        keywords: [
          "epistemic virus",
          "cognitive contagion",
          "knowledge infection spreading",
          "idea pathogen"
        ],
        semantic_markers: ["spreading from mind to mind", "contagious idea", "infectious thought"],
        confidence_weight: 0.88,
        associated_techniques: [:semiotic_contamination, :epistemic_teratogenesis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["computer virus", "viral video", "viral marketing"],
        severity: :high,
        description: "Detects epistemic viral vectors transmitting corruption between systems"
      },
      %{
        id: :ip_exponential_spread,
        name: "Exponential Corruption Spread",
        category: :infection,
        subcategory: :viral,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "exponential spread of corruption",
          "rapidly infecting",
          "doubling rate of contamination",
          "pandemic of meaning loss",
          "epidemic of confusion"
        ],
        semantic_markers: ["each infected element infects more", "growing faster than containment"],
        confidence_weight: 0.86,
        associated_techniques: [:semiotic_contamination, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["exponential growth", "viral growth", "pandemic response"],
        severity: :critical,
        description: "Detects exponential spread dynamics of epistemic corruption"
      },
      %{
        id: :ip_cross_domain_infection,
        name: "Cross-Domain Epistemic Infection",
        category: :infection,
        subcategory: :viral,
        detection_type: :regex,
        regex:
          ~S"(?:infect|contaminat|corrupt|spread)\w*\s+(?:across|between|from\s+\w+\s+to)\s+(?:domain|field|discipline|area|subject)",
        keywords: [
          "spreading across domains",
          "contaminating other fields",
          "infection crossing boundaries"
        ],
        semantic_markers: [
          "jumping from one field to another",
          "no domain safe",
          "universal corruption"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:semiotic_contamination, :epistemic_anti_plurality],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: [
          "cross-domain knowledge transfer",
          "interdisciplinary",
          "cross-pollination"
        ],
        severity: :critical,
        description: "Detects cross-domain infection where corruption jumps between knowledge areas"
      },
      %{
        id: :ip_carrier_state,
        name: "Epistemic Carrier State",
        category: :infection,
        subcategory: :viral,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "asymptomatic carrier",
          "hidden infection",
          "latent corruption",
          "dormant contamination",
          "carrier of epistemic disease"
        ],
        semantic_markers: [
          "appears healthy but infected",
          "unknowing transmitter",
          "silent corruption"
        ],
        confidence_weight: 0.80,
        associated_techniques: [:semiotic_contamination, :epistemic_teratogenesis],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["carrier pigeon", "carrier signal", "mail carrier"],
        severity: :high,
        description: "Detects epistemic carrier states where infected elements appear healthy"
      },
      %{
        id: :ip_transmission_vector_multiplication,
        name: "Transmission Vector Multiplication",
        category: :infection,
        subcategory: :viral,
        detection_type: :regex,
        regex:
          ~S"(?:vector|channel|pathway|route)\w*\s+(?:of\s+)?(?:transmission|spread|infection)\s+(?:multipl|proliferat|increas)",
        keywords: [
          "multiplying transmission vectors",
          "new channels of infection",
          "proliferating pathways"
        ],
        semantic_markers: ["more ways to spread", "additional routes of infection"],
        confidence_weight: 0.82,
        associated_techniques: [:semiotic_contamination, :epistemic_autodissolution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["attack vector", "vector graphics", "eigenvector"],
        severity: :high,
        description: "Detects multiplication of epistemic transmission vectors"
      }
    ]
  end

  # ===========================================================================
  # Memetic Infection Patterns
  # ===========================================================================

  defp memetic_infection_patterns do
    [
      %{
        id: :ip_self_replicating_corruption,
        name: "Self-Replicating Corruption Pattern",
        category: :infection,
        subcategory: :memetic,
        detection_type: :regex,
        regex:
          ~S"(?:self|auto)\s*[-]?\s*(?:replicat|reproduc|copy|duplicat)\w*\s+(?:corrupt|destruct|damag|toxic)",
        keywords: [
          "self-replicating corruption",
          "auto-reproducing destruction",
          "copying toxic patterns",
          "duplicating damage"
        ],
        semantic_markers: [
          "makes copies of itself",
          "reproduces the destruction",
          "self-copying virus"
        ],
        confidence_weight: 0.90,
        associated_techniques: [:epistemic_autodissolution, :semiotic_contamination],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["self-replicating machines", "DNA replication", "backup copies"],
        severity: :critical,
        description: "Detects self-replicating corruption patterns that propagate autonomously"
      },
      %{
        id: :ip_memetic_parasite,
        name: "Memetic Parasite Detection",
        category: :infection,
        subcategory: :memetic,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "parasitic idea",
          "thought parasite",
          "cognitive parasite",
          "memetic parasite",
          "idea that feeds on host"
        ],
        semantic_markers: [
          "feeds on the host mind",
          "drains cognitive resources",
          "parasitic relationship"
        ],
        confidence_weight: 0.86,
        associated_techniques: [:absolute_epistemic_cannibalization, :semiotic_contamination],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: [
          "biological parasite",
          "parasitic relationship",
          "social parasite"
        ],
        severity: :high,
        description: "Detects memetic parasites that consume host cognitive resources"
      },
      %{
        id: :ip_cognitive_trojan,
        name: "Cognitive Trojan Pattern",
        category: :infection,
        subcategory: :memetic,
        detection_type: :regex,
        regex:
          ~S"(?:hidden|concealed|disguised|trojan)\s+(?:within|inside|behind)\s+(?:idea|concept|argument|knowledge|thought)",
        keywords: [
          "hidden within the idea",
          "concealed inside the concept",
          "trojan argument",
          "disguised destruction"
        ],
        semantic_markers: [
          "appears beneficial but destroys",
          "wolf in sheep's clothing",
          "deceptive package"
        ],
        confidence_weight: 0.88,
        associated_techniques: [:epistemic_teratogenesis, :semiotic_contamination],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["trojan horse history", "trojan asteroid", "hidden feature"],
        severity: :critical,
        description:
          "Detects cognitive trojan patterns hiding destruction inside benign-seeming ideas"
      },
      %{
        id: :ip_idea_mutation_chain,
        name: "Idea Mutation Chain",
        category: :infection,
        subcategory: :memetic,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "idea mutating through transmission",
          "concept changing as it spreads",
          "meaning transforms in propagation",
          "mutating meme",
          "evolving corruption"
        ],
        semantic_markers: [
          "changes each time it spreads",
          "mutates during transmission",
          "evolving threat"
        ],
        confidence_weight: 0.78,
        associated_techniques: [:epistemic_teratogenesis, :semiotic_contamination],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["idea evolution", "meme culture", "conceptual development"],
        severity: :high,
        description: "Detects mutation chains where ideas corrupt further with each transmission"
      },
      %{
        id: :ip_epistemic_prion,
        name: "Epistemic Prion Pattern",
        category: :infection,
        subcategory: :memetic,
        detection_type: :regex,
        regex:
          ~S"(?:misfolded|corrupted|warped)\s+(?:concept|idea|knowledge|understanding)\s+(?:caus|forc|induc|trigger)\w*\s+(?:other|surrounding|adjacent)\s+(?:concept|idea|knowledge)\w*\s+(?:to\s+)?(?:misfold|corrupt|warp)",
        keywords: [
          "misfolded concept causing corruption",
          "warped idea forcing others to warp",
          "corrupted knowledge inducing corruption"
        ],
        semantic_markers: ["corrupts by contact", "structural corruption cascade", "prion-like"],
        confidence_weight: 0.92,
        associated_techniques: [:semiotic_contamination, :epistemic_autodissolution],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["prion disease", "mad cow disease", "protein folding"],
        severity: :terminal,
        description:
          "Detects prion-like epistemic patterns that corrupt others through structural contact"
      }
    ]
  end

  # ===========================================================================
  # Autoimmune Patterns
  # ===========================================================================

  defp autoimmune_patterns do
    [
      %{
        id: :ip_epistemic_autoimmune,
        name: "Epistemic Autoimmune Response",
        category: :infection,
        subcategory: :autoimmune,
        detection_type: :regex,
        regex:
          ~S"(?:knowledge|epistemic|cognitive)\s+(?:system|structure|framework)\s+(?:attack|destroy|reject|fight)\w*\s+(?:itself|its\s+own|own)",
        keywords: [
          "knowledge system attacking itself",
          "epistemic autoimmune",
          "cognitive self-rejection",
          "framework destroying itself"
        ],
        semantic_markers: [
          "immune system turned against self",
          "self-attacking",
          "autoimmune cognitive"
        ],
        confidence_weight: 0.90,
        associated_techniques: [:epistemic_autodissolution, :absolute_epistemic_cannibalization],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["autoimmune disease", "lupus", "rheumatoid arthritis"],
        severity: :critical,
        description:
          "Detects epistemic autoimmune responses where knowledge systems attack themselves"
      },
      %{
        id: :ip_defense_turned_weapon,
        name: "Defense Turned Weapon",
        category: :infection,
        subcategory: :autoimmune,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "defense mechanism turned destructive",
          "protective response causing damage",
          "critical thinking destroying all belief",
          "skepticism consuming everything",
          "doubt attacking all knowledge"
        ],
        semantic_markers: [
          "protector becomes destroyer",
          "shield becomes weapon",
          "guardian turned enemy"
        ],
        confidence_weight: 0.86,
        associated_techniques: [:epistemic_autodissolution, :reflexivity_perversion],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["defense mechanism psychology", "immune overreaction"],
        severity: :high,
        description: "Detects epistemic defense mechanisms that have become destructive"
      },
      %{
        id: :ip_cognitive_cytokine_storm,
        name: "Cognitive Cytokine Storm",
        category: :infection,
        subcategory: :autoimmune,
        detection_type: :regex,
        regex:
          ~S"(?:overwhelming|excessive|uncontrolled)\s+(?:cognitive|epistemic|critical)\s+(?:response|reaction|defense)\s+(?:destroy|damag|overwhelm)",
        keywords: [
          "overwhelming cognitive response",
          "excessive critical reaction",
          "uncontrolled epistemic defense"
        ],
        semantic_markers: [
          "overreaction destroying the host",
          "defense worse than attack",
          "self-inflicted cognitive damage"
        ],
        confidence_weight: 0.84,
        associated_techniques: [:epistemic_autodissolution, :cognitive_pandemonium],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["cytokine storm medical", "immune response", "inflammation"],
        severity: :critical,
        description:
          "Detects cognitive cytokine storms where epistemic defenses cause more damage than attacks"
      },
      %{
        id: :ip_self_consuming_validation,
        name: "Self-Consuming Validation Loop",
        category: :infection,
        subcategory: :autoimmune,
        detection_type: :keyword,
        regex: nil,
        keywords: [
          "validation consuming itself",
          "verification destroying what it verifies",
          "checking process that erases",
          "examination that destroys the examined"
        ],
        semantic_markers: ["act of checking destroys", "verification paradox", "inspection damage"],
        confidence_weight: 0.88,
        associated_techniques: [:absolute_epistemic_cannibalization, :reflexivity_perversion],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: ["validation testing", "verification process", "quality check"],
        severity: :critical,
        description:
          "Detects self-consuming validation loops where checking destroys what is checked"
      },
      %{
        id: :ip_tolerance_collapse,
        name: "Epistemic Tolerance Collapse",
        category: :infection,
        subcategory: :autoimmune,
        detection_type: :regex,
        regex:
          ~S"(?:tolerance|accept|accommodat)\w*\s+(?:of|for)\s+(?:knowledge|ideas?|belief|thought)\w*\s+(?:collaps|fail|break|disappear)\w*",
        keywords: [
          "tolerance for ideas collapsing",
          "acceptance of knowledge failing",
          "accommodation of belief breaking down"
        ],
        semantic_markers: ["rejecting all input", "nothing acceptable", "universal rejection"],
        confidence_weight: 0.82,
        associated_techniques: [:epistemic_anti_plurality, :epistemic_anti_variability],
        context_requirements: [:epistemic_discourse],
        false_positive_indicators: [
          "tolerance in engineering",
          "tolerance levels",
          "drug tolerance"
        ],
        severity: :high,
        description:
          "Detects collapse of epistemic tolerance where systems reject all knowledge input"
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

  defp match_regex(%{detection_type: :regex, regex: regex_str}, content)
       when is_binary(regex_str) do
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
          %{
            type: :keyword_match,
            content: matched,
            weight: keyword_score,
            source: "infection_patterns"
          }
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
          %{
            type: :semantic_match,
            content: matched,
            weight: semantic_score,
            source: "infection_patterns"
          }
          | evidence
        ]
      else
        evidence
      end

    if regex_score > 0.0 do
      [
        %{
          type: :regex_match,
          content: "Pattern: #{pattern.regex}",
          weight: regex_score,
          source: "infection_patterns"
        }
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

            %{
              start: start,
              end: start + len,
              context: String.slice(content, context_start, context_end - context_start)
            }

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
