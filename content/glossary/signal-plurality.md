+++
title = "Signal plurality (pluralita signálů)"
weight = 33
description = "Tvrdě vynucovaný axiom NABLA Infinity: přesvědčení smí vzniknout až ze dvou nezávislých signálů, aby v Prismatic Platform nevznikalo jediné místo epistemického selhání."

[taxonomies]
tags = ["glossary", "nabla", "evidence", "epistemic", "prismatic", "intelligence"]

[extra]
category = "epistemic"
related_terms = ["nabla-infinity", "intelligence-fusion", "blue-team", "confidence-threshold", "provenance-mandatory", "censys", "risk-score", "trinity-gate", "contradiction-preservation", "time-decay", "shodan", "greynoise"]
use_cases = ["OSINT intelligence fusion", "Security rating validation", "Color Team assessments", "Quality evaluations", "Threat intelligence correlation"]
key_benefit = "Prevents single-point epistemic failure by requiring independent corroboration for all beliefs"
platforms = ["Prismatic Platform"]
programming_languages = ["Elixir"]
difficulty = "Advanced"
prerequisites = ["NABLA Infinity framework", "Epistemic reasoning", "OSINT concepts"]
axiom_number = 1
enforcement_level = "HARD - E2 BLOCK"
minimum_signals = 2
violation_response = "Immediate rejection, cannot proceed"
override_authority = "None - no authority level can bypass"
scope = "All beliefs, claims, and decisions platform-wide"
framework = "NABLA Infinity"
independence_requirement = "Signals must not share upstream dependencies"
weighting_model = "Freshness and source reliability weighted"
date_created = "2026-02-22"
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
keywords = ["Signal", "Plurality", "Hard-enforced", "NABLA", "Infinity", "Prismatic", "Platform", "glossary", "epistemic", "Prismatic Platform"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Signal plurality (pluralita signálů) – glosář"
+++

## Definice a přehled

Pluralita signálů (*Signal Plurality*) je tvrdě vynucovaný axiom epistemického rámce [NABLA
Infinity](@/glossary/nabla-infinity.md), který vyžaduje nejméně dva nezávislé signály dřív, než
může vzniknout jakékoli přesvědčení, být přijato jakékoli tvrzení nebo padnout jakékoli
rozhodnutí. Tvrzení z jediného zdroje nestačí bez ohledu na věrohodnost zdroje, naléhavost nebo
úroveň autority. Axiom brání jedinému místu epistemického selhání a zajišťuje, že veškeré vědění
platformy má potvrzující důkazy ze skutečně nezávislých původů. Je prvním ze sedmi [axiomů
NABLA](@/glossary/nabla-axioms.md).

Axiom řeší základní zranitelnost znalostních systémů: závislost na jediném zdroji vytváří
katastrofální způsoby selhání. Jediný kompromitovaný zdroj, jediné zkreslené posouzení nebo
jediný chybně nastavený senzor může šířit nesprávná přesvědčení celým systémem, pokud neexistuje
požadavek nezávislého potvrzení. Pluralita signálů mění tento vzorec jediného místa selhání na
distribuovaný model ověřování, v němž každé přesvědčení vyžaduje nejméně dva nezávislé podpůrné
signály.

Pluralita signálů je přísnější než prostý požadavek „druhého názoru“ v tradičních rozhodovacích
rámcích. Axiom nevyžaduje jen více signálů, ale signály skutečně nezávislé – ze zdrojů, které
nesdílejí společné závislosti proti proudu, metodiky ani datové toky. Dva signály odvozené
z téhož podkladového zdroje dat se počítají jako jeden signál, ať jsou prezentovány jakkoli
odlišně. Požadavek nezávislosti brání iluzi plurality, kdy více nominálně odlišných zdrojů vede
k jedinému původu.

V Prismatic Platform se pluralita signálů vynucuje na úrovni E2 (blokace a odmítnutí). Porušení
nejsou varování – jsou to tvrdé blokace, které nevyhovujícímu tvrzení zabrání vstoupit do
systému přesvědčení. Vynucení platí ve všech systémech platformy: ve [fúzi
zpravodajských informací](@/glossary/intelligence-fusion.md) z OSINT, v bezpečnostních
hodnoceních [EASM](@/glossary/easm.md), v posouzeních [barevných týmů](@/glossary/color-teams.md)
i v hodnoceních kvality.

Pro Kompendium je pluralita signálů nejpřímějším mostem mezi platformou a knihou: u lidí je
přístup k více nezávislým zdrojům a svědkům základní ochranou poznání, a právě ten techniky
izolace systematicky ruší (viz [sociální izolace](@/glossary/socialni-izolace.md)).

## Historický kontext a motivace

Axiom čerpá z několika intelektuálních tradic. Ve zpravodajské analýze se princip vzájemného
ověřování z více druhů zpravodajství praktikuje přinejmenším od druhé světové války, kdy se
porovnávalo signálové (SIGINT), lidské (HUMINT) a obrazové (IMINT) zpravodajství. Nedodržení
tohoto principu vedlo k doloženým zpravodajským selháním; nejznámější je spoléhání na nepotvrzené
informace jediného zdroje s krycím jménem „Curveball“ v době před válkou v Iráku (2003), které
ovlivnily politická rozhodnutí.

Ve vědecké metodologii plní stejnou funkci požadavek nezávislé replikace. Vědecké tvrzení se
nepřijímá na základě jediného experimentu; vyžaduje nezávislou replikaci jinými výzkumníky,
nejlépe odlišnými metodami. [Replikační krize](@/glossary/replication-crisis.md) ve společenských
vědách (od 10. let 21. století) ukázala, co se stane, když se tento standard uvolní.

V inženýrství distribuovaných systémů je technickou obdobou plurality signálů konsenzus kvora
(požadavek shody více uzlů před přijetím zápisu). Systémy jako Raft a Paxos vyžadují shodu
většiny právě proto, že jednotlivé uzly mohou selhat, být odříznuty nebo vracet zastaralá data.

To, že Prismatic Platform přijala pluralitu signálů jako tvrdý axiom, odráží poznání, že
automatizované systémy čelí stejným epistemickým rizikům jako lidští zpravodajští analytici
a distribuované databáze. Když platforma posuzuje bezpečnostní postavení, klasifikuje hrozbu
nebo hodnotí kvalitu kódu, je posouzení jen tak spolehlivé jako důkazy, které ho podporují.
Důkazy z jediného zdroje, ať působí jakkoli autoritativně, nechávají posouzení zranitelné vůči
selhání zdroje.

## Technický rozbor

### Specifikace axiomu

Pluralita signálů je jedním ze sedmi nepodkročitelných axiomů rámce NABLA Infinity:

| Vlastnost | Hodnota |
|----------|-------|
| Číslo axiomu | 1 (pluralita signálů) |
| Vynucení | TVRDÉ – nelze obejít ani přebít |
| Minimum signálů | 2 nezávislé zdroje |
| Reakce na porušení | E2 BLOCK – okamžité odmítnutí |
| Autorita k přebití | žádná – nemůže ji obejít žádná úroveň oprávnění |
| Rozsah | všechna přesvědčení, tvrzení a rozhodnutí v celé platformě |

### Ověření nezávislosti

Určení nezávislosti signálů vyžaduje analýzu provenience zdroje. Dva signály jsou nezávislé
právě tehdy, mají-li různý původ, žádné sdílené zdroje proti proudu a různé metodiky sběru:

```elixir
defmodule Prismatic.Epistemic.SignalPlurality do
  @moduledoc """
  Enforces the Signal Plurality axiom: minimum 2 independent signals
  for any belief. Hard enforcement with E2 block on violation.

  ## Independence Criteria

  Two signals are considered independent when:
  1. They originate from different sources
  2. They share no upstream data dependencies
  3. They use different collection methodologies
  4. They belong to different independence classes

  ## Enforcement

  Violations result in immediate E2 BLOCK. No authority level
  can bypass this axiom. Claims that fail plurality checking
  are rejected and cannot enter the belief system.
  """

  @type signal :: %{
    source: String.t(),
    content: term(),
    timestamp: DateTime.t(),
    confidence: float(),
    provenance: provenance()
  }

  @type provenance :: %{
    origin: String.t(),
    methodology: String.t(),
    upstream_sources: [String.t()],
    collection_method: atom(),
    independence_class: String.t()
  }

  @type plurality_result ::
    {:ok, :plural, [signal()]}
    | {:error, :insufficient_plurality, String.t()}

  @spec verify_plurality([signal()]) :: plurality_result()
  def verify_plurality(signals) when length(signals) < 2 do
    {:error, :insufficient_plurality,
     "Only #{length(signals)} signal(s) provided. Minimum 2 independent signals required."}
  end

  def verify_plurality(signals) do
    independent_groups = group_by_independence(signals)

    if map_size(independent_groups) >= 2 do
      {:ok, :plural, signals}
    else
      {:error, :insufficient_plurality,
       "#{length(signals)} signals found but only #{map_size(independent_groups)} " <>
       "independent source(s). Signals share upstream dependencies."}
    end
  end

  @spec are_independent?(signal(), signal()) :: boolean()
  def are_independent?(signal_a, signal_b) do
    prov_a = signal_a.provenance
    prov_b = signal_b.provenance

    # Different origins
    prov_a.origin != prov_b.origin and
      # No shared upstream sources
      MapSet.disjoint?(
        MapSet.new(prov_a.upstream_sources),
        MapSet.new(prov_b.upstream_sources)
      ) and
      # Different collection methodologies
      prov_a.methodology != prov_b.methodology
  end

  defp group_by_independence(signals) do
    signals
    |> Enum.group_by(fn signal ->
      signal.provenance.independence_class
    end)
  end
end
```

## Architektura vynucení

### Body vynucení v celé platformě

Pluralita signálů se vynucuje v každém bodě, kde vznikají přesvědčení nebo tvrzení:

| Systém | Bod vynucení | Potřebné signály |
|--------|------------------|-----------------|
| Fúze zpravodajských informací | vznik posouzení z OSINT | 2+ poskytovatelé OSINT |
| Bezpečnostní hodnocení | skórování po dimenzích | 2+ zdroje důkazů na dimenzi |
| Barevné týmy | ověření zjištění Red Teamu | 2+ potvrzení vektoru útoku |
| Blue Team | posouzení obranného postavení | 2+ monitorovací signály |
| Posouzení kvality | skórování oblastí kvality | 2+ ověřovací nástroje |
| Zpravodajství o hrozbách | přijetí indikátoru hrozby | 2+ feedy hrozeb |
| Posouzení souladu | ověření zjištění souladu | 2+ kontroly souladu |

### Napojení na vynucovač axiomů

Vynucení plurality signálů je napojeno na širší systém kontroly axiomů NABLA:

```elixir
defmodule Prismatic.Epistemic.AxiomEnforcer do
  @moduledoc """
  Enforces all NABLA Infinity axioms with appropriate violation levels.
  Signal Plurality is Axiom 1 with E2 (hard block) enforcement.

  ## Enforcement Levels

  - E1: Warning + correction request (soft axioms)
  - E2: BLOCK + rejection (hard axioms including Signal Plurality)
  - E3: HALT + review required (Trinity Gate failures)
  - E4: Investigation + audit (multiple axiom violations)
  """

  require Logger

  @type enforcement_level :: :e1_warning | :e2_block | :e3_halt | :e4_investigation

  @axioms [
    {:signal_plurality, :hard, :e2_block},
    {:contradiction_preservation, :hard, :e2_block},
    {:absence_informative, :soft, :e1_warning},
    {:time_decay, :hard, :e2_block},
    {:unknown_valid, :hard, :e2_block},
    {:source_independence, :soft, :e1_warning},
    {:provenance_mandatory, :hard, :e2_block}
  ]

  @spec enforce_all([signal()], map()) :: {:ok, map()} | {:error, enforcement_level(), String.t()}
  def enforce_all(signals, claim) do
    Enum.reduce_while(@axioms, {:ok, claim}, fn {axiom, _hardness, level}, {:ok, acc} ->
      case check_axiom(axiom, signals, acc) do
        :ok ->
          {:cont, {:ok, acc}}

        {:violation, reason} ->
          Logger.error("NABLA Axiom violation: #{axiom} - #{reason}")

          :telemetry.execute(
            [:prismatic, :epistemic, :axiom_violation],
            %{count: 1},
            %{axiom: axiom, level: level}
          )

          {:halt, {:error, level, "#{axiom}: #{reason}"}}
      end
    end)
  end

  defp check_axiom(:signal_plurality, signals, _claim) do
    case Prismatic.Epistemic.SignalPlurality.verify_plurality(signals) do
      {:ok, :plural, _} -> :ok
      {:error, :insufficient_plurality, reason} -> {:violation, reason}
    end
  end

  defp check_axiom(:provenance_mandatory, signals, _claim) do
    missing = Enum.filter(signals, fn s -> is_nil(s.provenance) end)
    if Enum.empty?(missing), do: :ok, else: {:violation, "#{length(missing)} signals lack provenance"}
  end

  defp check_axiom(:contradiction_preservation, signals, _claim) do
    # Contradictions between signals must be preserved, not resolved
    :ok
  end

  defp check_axiom(:time_decay, signals, _claim) do
    missing_timestamps = Enum.filter(signals, fn s -> is_nil(s.timestamp) end)
    if Enum.empty?(missing_timestamps), do: :ok, else: {:violation, "Signals missing timestamps"}
  end

  defp check_axiom(:unknown_valid, _signals, _claim), do: :ok
  defp check_axiom(:absence_informative, _signals, _claim), do: :ok
  defp check_axiom(:source_independence, _signals, _claim), do: :ok
end
```

## Vynucení v bezpečnostním hodnocení

Systém bezpečnostního hodnocení [EASM](@/glossary/easm.md) vynucuje pluralitu signálů na úrovni
dimenzí. Skóre žádné dimenze se nepřijme bez nejméně dvou nezávislých zdrojů důkazů (viz [Risk
Score](@/glossary/risk-score.md)):

```elixir
defmodule PrismaticPerimeter.Rating.PluralityEnforcer do
  @moduledoc """
  Enforces signal plurality for each security rating dimension.
  No dimension score is accepted without at least 2 independent
  evidence sources. This prevents single-tool bias from distorting
  security ratings.

  ## Rating Dimensions

  Each dimension (network security, application security, DNS health,
  TLS configuration, etc.) must have evidence from at least two
  independent sources before a score can be assigned.
  """

  @type dimension :: atom()
  @type dimension_score :: %{
    value: float(),
    evidence: [evidence()],
    confidence: float()
  }
  @type evidence :: %{source: String.t(), data: term(), timestamp: DateTime.t()}

  @spec enforce_dimension_plurality(%{dimension() => dimension_score()}) ::
    {:ok, %{dimension() => dimension_score()}} | {:error, [dimension()]}
  def enforce_dimension_plurality(dimension_scores) do
    insufficient =
      dimension_scores
      |> Enum.filter(fn {_dim, score} ->
        independent_sources = count_independent_sources(score.evidence)
        independent_sources < 2
      end)
      |> Enum.map(fn {dim, _} -> dim end)

    case insufficient do
      [] -> {:ok, dimension_scores}
      dims -> {:error, dims}
    end
  end

  @spec count_independent_sources([evidence()]) :: non_neg_integer()
  defp count_independent_sources(evidence) do
    evidence
    |> Enum.map(& &1.source)
    |> Enum.uniq()
    |> length()
  end
end
```

## Vážení kvality signálů

Ne všechny signály mají stejnou váhu. Pluralita sice vyžaduje nejméně dva signály, ale systém
signály váží podle faktorů kvality. Minimum dvou nezávislých signálů se tak vynucuje vždy,
a výsledná důvěra v přesvědčení přitom odráží kvalitu přispívajících signálů:

```elixir
defmodule Prismatic.Epistemic.SignalWeighting do
  @moduledoc """
  Weights signals based on quality factors while maintaining
  the hard minimum of 2 independent signals for plurality.

  ## Weighting Factors

  - Freshness: Recent signals carry more weight (time decay)
  - Source reliability: Historically accurate sources weight higher
  - Methodology rigor: Formal verification > heuristic analysis
  - Corroboration count: More corroborating signals increase confidence
  """

  @type quality_factors :: %{
    freshness: float(),
    source_reliability: float(),
    methodology_rigor: float(),
    corroboration_count: non_neg_integer()
  }

  @spec weighted_confidence([signal()]) :: float()
  def weighted_confidence(signals) do
    total_weight =
      signals
      |> Enum.map(&signal_weight/1)
      |> Enum.sum()

    weighted_sum =
      signals
      |> Enum.map(fn s -> s.confidence * signal_weight(s) end)
      |> Enum.sum()

    weighted_sum / max(total_weight, 1.0)
  end

  @spec signal_weight(signal()) :: float()
  defp signal_weight(signal) do
    freshness = calculate_freshness(signal.timestamp)
    reliability = signal.provenance |> Map.get(:source_reliability, 0.5)

    freshness * 0.4 + reliability * 0.6
  end

  @spec calculate_freshness(DateTime.t()) :: float()
  defp calculate_freshness(timestamp) do
    age_hours = DateTime.diff(DateTime.utc_now(), timestamp, :hour)

    cond do
      age_hours < 1 -> 1.0
      age_hours < 24 -> 0.9
      age_hours < 168 -> 0.7
      age_hours < 720 -> 0.4
      true -> 0.1
    end
  end
end
```

## Zacházení s rozpory u plurálních signálů

Když si plurální signály odporují, má přednost axiom [zachování
rozporu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/).
Rozpory mezi platnými signály se zachovávají jako informativní datové body, místo aby se řešily
zahozením jednoho ze signálů:

```elixir
defmodule Prismatic.Epistemic.ContradictionHandler do
  @moduledoc """
  Handles contradictions between plural signals.
  Contradictions are preserved, not resolved by discarding one signal.
  The existence of a contradiction is itself a signal that
  warrants investigation.
  """

  @type contradiction :: %{
    signal_a: signal(),
    signal_b: signal(),
    description: String.t(),
    detected_at: DateTime.t()
  }

  @spec detect_contradictions([signal()]) :: {:ok, :no_contradictions} | {:contradiction, [contradiction()]}
  def detect_contradictions(signals) do
    pairs = for a <- signals, b <- signals, a.source != b.source, do: {a, b}

    contradictions =
      pairs
      |> Enum.filter(fn {a, b} -> contradicts?(a.content, b.content) end)
      |> Enum.map(fn {a, b} ->
        %{
          signal_a: a,
          signal_b: b,
          description:
            "Signals from #{a.provenance.origin} and #{b.provenance.origin} contradict. " <>
            "Both preserved per Contradiction Preservation axiom.",
          detected_at: DateTime.utc_now()
        }
      end)
      |> Enum.uniq_by(fn c -> {c.signal_a.source, c.signal_b.source} end)

    case contradictions do
      [] -> {:ok, :no_contradictions}
      found -> {:contradiction, found}
    end
  end

  defp contradicts?(content_a, content_b) do
    # Domain-specific contradiction detection
    # For example, one source says port 443 is open, another says it's closed
    content_a != content_b and covers_same_domain?(content_a, content_b)
  end

  defp covers_same_domain?(a, b) do
    Map.keys(a) -- Map.keys(b) == [] or Map.keys(b) -- Map.keys(a) == []
  end
end
```

## Příklady užití

### Kontrola plurality signálů

```elixir
# Verify plurality before forming a belief about a domain's security posture
signals = [
  %{
    source: "shodan",
    content: %{ports: [80, 443]},
    timestamp: DateTime.utc_now(),
    confidence: 0.9,
    provenance: %{
      origin: "shodan",
      methodology: "active_scanning",
      upstream_sources: ["shodan_crawl_db"],
      collection_method: :active_scan,
      independence_class: "shodan"
    }
  },
  %{
    source: "censys",
    content: %{ports: [80, 443, 8080]},
    timestamp: DateTime.utc_now(),
    confidence: 0.85,
    provenance: %{
      origin: "censys",
      methodology: "zmap_scanning",
      upstream_sources: ["censys_universal_dataset"],
      collection_method: :active_scan,
      independence_class: "censys"
    }
  }
]

case Prismatic.Epistemic.SignalPlurality.verify_plurality(signals) do
  {:ok, :plural, verified_signals} ->
    # Safe to form belief - plurality satisfied
    form_belief(verified_signals)

  {:error, :insufficient_plurality, reason} ->
    # BLOCKED - cannot proceed
    Logger.error("Signal Plurality violation: #{reason}")
end
```

### Běžné integrační vzory

| Vzor | Implementace | Příklad |
|---------|---------------|---------|
| fúze OSINT | dotazy na více poskytovatelů | [Shodan](@/glossary/shodan.md) + [Censys](@/glossary/censys.md) pro skenování portů |
| ověření certifikátů | dotazy do více logů CT | Certificate Transparency + přímý sken SSL |
| ověření DNS | dotazy na více resolverů | veřejné DNS + autoritativní jmenný server |
| kontrola reputace | více reputačních databází | [GreyNoise](@/glossary/greynoise.md) + AbuseIPDB |
| posouzení souladu | více kontrol souladu | nezávislá posouzení NIS2 a ZKB |

## Vztah k ostatním axiomům NABLA

Pluralita signálů nepůsobí izolovaně. S ostatními šesti axiomy NABLA interaguje konkrétními
způsoby:

| Axiom | Vztah k pluralitě signálů |
|-------|----------------------------------|
| **[Zachování rozporu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/)** | když si plurální signály odporují, zachovají se oba |
| **Informativní absence** | chybějící druhý signál je sám údajem – šetří se jako možná mezera |
| **[Časový rozpad](https://prismatic-reality-com.github.io/prismatic-promo/glossary/time-decay/)** | plurální signály musí být časově aktuální; staré signály ztrácejí váhu |
| **Platnost neznáma** | „nedostatek signálů“ je platný stav; pluralita se nesmí vymýšlet |
| **Nezávislost zdrojů** | vážení zvýhodňuje nezávislé zdroje; sdílený zdroj proti proudu snižuje důvěru |
| **[Povinná provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)** | ověření nezávislosti vyžaduje provenienci; signály bez ní se odmítají |

## Osvědčené postupy

**Navrhovat sběr dat pro pluralitu od začátku**: nestavět systémy s jediným zdrojem a nesnažit
se pluralitu přidat později. Výchozím vzorem sběru má být více nezávislých zdrojů.

**Důsledně ověřovat nezávislost**: dvě API od téhož dodavatele nejsou nezávislá. Dvě analýzy
téže datové sady nejsou nezávislé. Nezávislost vyžaduje skutečně oddělený původ dat.

**Dokumentovat provenienci všech signálů**: bez provenience nelze nezávislost ověřit. Každý signál
vstupující do systému musí nést svůj původ, metodiku a závislosti proti proudu.

**Výslovně počítat s cenou plurality**: dotazování více zdrojů stojí více času a prostředků.
Systémy je třeba navrhnout s přiměřenou souběžností a ošetřením timeoutů pro plurální sběr.

**Neoslabovat požadavky plurality pod tlakem**: axiom se vynucuje tvrdě právě proto, že pod
tlakem jsou chyby z jediného zdroje nejnebezpečnější.

## Časté chyby

- **Zaměňovat množství s pluralitou**: deset signálů z téhož zdroje se stále počítá jako jeden
  nezávislý signál. Pluralita vyžaduje nezávislý původ, ne velký objem.
- **Předpokládat nezávislost API**: různé endpointy téhož poskytovatele sdílejí stejná podkladová
  data. Nepředstavují nezávislé signály.
- **Uvolňovat pluralitu u „důvěryhodných“ zdrojů**: žádný zdroj není tak důvěryhodný, aby mohl
  pluralitu obejít. I nejspolehlivější zdroj může být kompromitován, chybně nastaven nebo
  zastaralý.
- **Považovat pluralitu za postačující pro pravdu**: pluralita je nutná, ale ne postačující.
  Dva nezávislé signály se mohou mýlit oba. Pluralita epistemické riziko snižuje, ale neodstraňuje.
- **Vymýšlet signály, aby se axiomu vyhovělo**: vytváření umělých signálů ke splnění minima
  dvou porušuje ducha i účel axiomu. Axiom platnosti neznáma výslovně dovoluje přiznat
  nedostatek důkazů místo jejich vymýšlení.

## Pluralita signálů u lidí

Kompendium přenáší princip na lidské poznávání jako kritérium zdravého informačního prostředí,
ne jako požadavek „dvou svědků“ pro každou vzpomínku:

- **izolace ruší pluralitu** – když všechny informace o světě i o sobě přicházejí od jediné
  osoby nebo skupiny, ztrácí člověk možnost cokoli nezávisle ověřit (viz [detekční signaturu
  Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md));
- **falešná pluralita** – skupina, v níž všichni opakují tutéž verzi, vypadá jako mnoho zdrojů,
  ale je jedním (srov. [High Control Group](@/glossary/high-control-group.md));
- **obnova plurality** je součástí zotavení – návrat ke starým přátelům, dokumentům a nezávislým
  odborníkům ([Akutní sociální
  rekonekce](@/kompendium/recovery-protocols/acute-social-reconnection.md));
- **ve forenzní praxi** odpovídá principu potvrzení třetí osobou ([Třetiosobní
  potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md)), u něhož se ovšem
  nesmí zapomínat, že mnohé formy psychického násilí probíhají bez svědků a absence potvrzení
  neznamená nepravdivost výpovědi.

## Související

**Pojmy v tomto glosáři**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – nadřazený epistemický rámec, který axiom
  definuje.
- [Axiomy NABLA](@/glossary/nabla-axioms.md) – všech sedm axiomů a jejich implementace.
- [Intelligence Fusion](@/glossary/intelligence-fusion.md) – korelace více zdrojů, která
  pluralitu vyžaduje.
- [Blue Team](@/glossary/blue-team.md) – agregace signálů s vynucením plurality.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána doplňující požadavky plurality.
- [Shodan](@/glossary/shodan.md), [Censys](@/glossary/censys.md), [GreyNoise](@/glossary/greynoise.md),
  [EASM](@/glossary/easm.md) – zdroje signálů a oblast, která pluralitu vynucuje po dimenzích.
- [Sociální izolace](@/glossary/socialni-izolace.md) – lidská obdoba ztráty plurality.

**Hesla a přehledy platformy mimo tuto knihu**

- [Confidence Threshold](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/),
  [Contradiction Preservation](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/),
  [Time Decay](https://prismatic-reality-com.github.io/prismatic-promo/glossary/time-decay/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/).

**Kniha**

- [EA × OSINT: triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) –
  pluralita v investigativní praxi.
- [2.6 Vztah ke Prismatic NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – jak axiomy
  vstupují do knihy.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
