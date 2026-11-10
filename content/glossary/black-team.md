+++
title = "Black Team"
weight = 24
description = "Tým teoretického modelování hrozeb v maximální izolaci v architektuře Color Teams Prismatic Platform; vytváří jen abstraktní modely, nikdy spustitelný obsah."

[taxonomies]
tags = ["glossary", "security", "black-team", "prismatic", "color-teams"]

[extra]
category = "security"
domain = "adversarial-security"
complexity = "expert"
stability = "mature"
beam_related = true
related_terms = ["color-teams", "gray-team", "red-team", "blue-team", "purple-team", "white-team", "nabla-infinity", "trinity-gate", "epistemic-pipeline", "formal-verification", "lean4", "agent-tier", "agent-registry", "consciousness-traits", "threat-intelligence", "penetration-testing"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Black Team** je nejvíce omezenou provozní doménou šestičlenné bezpečnostní architektury
[Color Teams](@/glossary/color-teams.md) Prismatic Platform. Tvoří jej přesně dva agenti,
kteří pracují pod MAXIMÁLNÍMI omezeními izolace. Black Team provádí čistě epistemickou
simulaci adversariální optimalizace v nejhorším případě. Jeho jediným výstupem jsou
abstraktní modely hrozeb – teoretické konstrukce, které popisují tvar a dynamiku možných
útoků, aniž by poskytovaly jakékoli spustitelné, reprodukovatelné nebo přímo použitelné
znalosti o zneužití. Tým stojí na hranici mezi bezpečnostním výzkumem a teoretickou analýzou
rizik, v prostoru obdobném matematickému modelování hrozeb v akademické kryptografii.

Omezení izolace, jimiž se Black Team řídí, jsou absolutní a nevyjednatelná: nulové síťové
připojení, nulový přístup k produkčním datům a stavu, nulová schopnost vytvářet spustitelný
obsah a povinné filtrování výstupu čtyřúrovňovým abstrakčním procesem. Nejde
o administrativní politiky, které by šlo autoritou přepsat, ale o strukturální omezení
vynucená za běhu. Ani agent nejvyššího oprávnění L5 nemůže Black Teamu udělit přístup
k síti, protože cesta k němu v prostředí Black Teamu neexistuje.

Filozofickým základem Black Teamu je klíčový poznatek: porozumět tomu, jak protivník myslí
– jeho optimalizačním strategiím, vzorcům zneužití, strategickým prioritám –, je pro stavbu
odolné obrany nezbytné, ale vědění vzniklé během tohoto porozumění je třeba zpracovávat
s krajní opatrností. Black Team toto napětí řeší tím, že pracuje výhradně na abstraktní
úrovni a vytváří modely hrozeb, které informují obrannou strategii, aniž by vytvořily mapu
skutečných útoků.

V tradičních bezpečnostních operacích bývá rozdíl mezi red teamem a black teamem
neformální. Red teamy provádějí praktickou adversariální simulaci – skutečné penetrační
testy, sociální inženýrství, vývoj exploitů. Black teamy, kde existují, pracují na vyšší
úrovni abstrakce: modelují rozhodování protivníka, rozdělení jeho zdrojů a strategické cíle
bez jakýchkoli spustitelných artefaktů. Platforma tento rozdíl formalizuje strukturálním
vynucením, takže výstup Black Teamu nemůže překročit hranici od teoretického
k operačnímu.

**Vztah ke knize:** Black Team patří do kontextu platformy, z níž Kompendium vzešlo, ale
jeho zásada je i zásadou knihy. Kompendium popisuje mechanismy manipulace jen na úrovni
struktury, nikdy jako postup – tedy na úrovni, kterou Black Team označuje L1–L2. Viz [Dual-use
poznání](@/glossary/dual-use-poznani.md), [bezpečnostní
klasifikaci](@/kompendium/01-predmluva/bezpecnostni-klasifikace.md) předmluvy a stránku [Black
Team: modelování EA](@/kompendium/aiad-integration/black-team-ea-modeling.md).

## Základní pojmy

| Pojem | Popis | Úroveň vynucení |
|---------|-------------|-------------------|
| **Výstup jen v abstrakci** | veškerý výstup musí zůstat na úrovni abstrakce L1 nebo L2 – žádný spustitelný kód, pseudokód ani implementační podrobnosti | strukturální (AbstractionFilter) |
| **Maximální izolace** | nulová síť, nulová produkční data, nulová vnější komunikace kromě cesty přes vynucovač | strukturální za běhu |
| **Epistemická simulace** | modeluje poznávání a strategii protivníka, nikoli jeho nástroje či techniky | omezení návrhu agentů |
| **Hodnocení rizika zbraňového využití** | hodnotí riziko převodu teoretického na operační podle proveditelnosti, dopadu a novosti | hlavní analytický výstup |
| **Architektura dvou agentů** | minimální plocha: theorist-commander vytváří, abstraction-enforcer filtruje | omezení topologie |
| **Neměnná auditní stopa** | každá operace, výstup a rozhodnutí filtru se zapisují do úložiště jen pro připojování | nepřetržité sledování |
| **Průběžné etické kontroly** | etická validace každých 10–15 sekund během aktivních operací | nepřetržité sledování |
| **Jednosměrný tok signálů** | Black Team dává vstup Red Teamu, ale sám nedostává přímý vstup od žádného týmu | omezení architektury |
| **Provádění v sandboxu** | všechny operace běží v PrismaticDark.Sandbox s izolací na úrovni procesů | vynucení za běhu |
| **Bezpečnostní přepsání** | vynucovač abstrakce může zastavit každou operaci, která hrozí vytvořit obsah pod prahem | oprávnění agenta |

### Red Team a Black Team

Rozdíl mezi [Red Teamem](@/glossary/red-team.md) a Black Teamem je pro architekturu Color
Teams zásadní. Jeho pochopení brání záměně operační adversariální simulace s teoretickým
modelováním hrozeb.

| Hledisko | Red Team | Black Team |
|-----------|----------|------------|
| **Typ výstupu** | konkrétní adversariální scénáře s 5 útočnými primitivy | jen abstraktní modely hrozeb L1–L2 |
| **Přístup k síti** | omezený, řízený přístup pro simulaci | nulový – cesta neexistuje |
| **Přístup k datům** | syntetické scénáře napodobující skutečné podmínky | jen syntetická data, žádný produkční stav |
| **Provádění** | aktivně vede adversariální kampaně | čistě teoretická analýza |
| **Počet agentů** | 5 agentů (oprávnění L3–L4) | 2 agenti (oprávnění L3) |
| **Útočná primitiva** | zkreslení pravdy, manipulace důvěrou, otrávení signálu, vyvolání posunu, únos salience | žádná – bez operačních schopností |
| **Směr signálu** | přijímá od Black, posílá Purple | posílá jen Red, nepřijímá od nikoho |
| **Úroveň izolace** | řízená izolace | maximální izolace |

### Kontext penetračního testování

Vztah Black Teamu k penetračnímu testování je nepřímý, ale podstatný. Tradiční penetrační
test sleduje metodiku: průzkum, skenování, získání přístupu, udržení přístupu a zahlazení
stop. Black Team působí před celým tímto procesem – modeluje, jaké třídy zranitelností by
protivník upřednostnil, jaké útočné plochy nabízejí nejvyšší návratnost a jaké mezery
v obraně vytvářejí systémové riziko. Tato abstraktní analýza pak informuje návrh scénářů
[Red Teamu](@/glossary/red-team.md) a obranné priority [Blue Teamu](@/glossary/blue-team.md).

| Fáze penetračního testu | Příspěvek Black Teamu |
|--------------------------|------------------------|
| **Průzkum** | modeluje informační potřeby a priority sběru protivníka |
| **Analýza zranitelností** | třídí typy zranitelností podle návratnosti pro protivníka (abstraktně, bez konkrétních CVE pod L2) |
| **Strategie zneužití** | modeluje rozhodování za nejistoty – kdy eskalovat, změnit směr nebo ustoupit |
| **Po zneužití** | hodnotí strategie setrvání a vzorce laterálního pohybu protivníka (abstraktně) |
| **Hodnocení dopadu** | poskytuje skóre rizika zbraňového využití podle proveditelnosti, dopadu a novosti |

## Technický rozbor

### Architektura agentů

Black Team má nejmenší složení ze všech [Color Teams](@/glossary/color-teams.md) – přesně
dva agenty. Minimální návrh je záměrný: omezuje plochu nejcitlivější provozní domény
a zároveň zajišťuje nutné oddělení odpovědností mezi teoretizováním o hrozbách a vynucováním
bezpečnosti.

#### black-theorist-commander (L3 Strategic Commander, ISOLATED)

Theorist-commander vytváří abstraktní modely hrozeb analýzou adversariální optimalizace
v nejhorším případě. Působí s oprávněním L3 v hierarchii [Agent Tier](@/glossary/agent-tier.md)
a má schopnosti strategické koordinace, uplatňuje je však výhradně v izolované doméně Black.
Analyzuje možné útočné vektory, modeluje rozhodovací procesy protivníka a vytváří
strukturovaná hodnocení hrozeb, která popisují, jaké třídy útoků jsou teoreticky možné a jaké
zdroje obránce by spotřebovaly.

Označení ISOLATED znamená, že theorist-commander nemůže komunikovat přímo s agenty mimo
doménu Black. Veškerý výstup prochází vynucovačem abstrakce, než se dostane k jakémukoli
vnějšímu příjemci. Toto omezení komunikace brání nechtěnému úniku informací z procesu
modelování hrozeb.

#### black-abstraction-enforcer (L3 Safety-Critical, ISOLATED)

Vynucovač abstrakce slouží jako povinný filtr veškerého výstupu Black Teamu. Každý artefakt
od theorist-commandera musí projít jeho filtrem AbstractionFilter L1–L4, než smí opustit
doménu Black. Vynucovač nese označení kritičnosti pro bezpečnost, a tím oprávnění zastavit
jakoukoli operaci Black Teamu, která hrozí vytvořit obsah pod požadovanou úrovní abstrakce.

Vynucovač pracuje se čtyřmi úrovněmi abstrakce, z nichž každá je konkrétnější. Doménu Black
smí opustit jen výstup L1 (plně abstraktní) a L2 (strukturálně abstraktní). Obsah L3
(polokonkrétní) a L4 (téměř spustitelný) je automaticky odmítnut a zaznamenán pro audit.
Vynucovač vede neměnný záznam každého rozhodnutí filtru – úplnou auditní stopu toho, co bylo
vytvořeno, co předáno a co odmítnuto.

### Filtrování abstrakce L1–L4

AbstractionFilter je klíčovým bezpečnostním mechanismem, který Black Team odlišuje od všech
ostatních bezpečnostních týmů. Zatímco [Red Team](@/glossary/red-team.md) pracuje s pěti
konkrétními útočnými primitivy, výstup Black Teamu je před opuštěním domény zbaven veškeré
operační konkrétnosti.

| Úroveň | Název | Popis | Smí opustit doménu | Příklad výstupu |
|-------|------|-------------|-------------------|----------------|
| **L1** | plně abstraktní | čistě matematické nebo logické popisy tříd hrozeb bez náznaku implementace | ano | „vzorec zneužití informační asymetrie třídy 3“ |
| **L2** | strukturálně abstraktní | popisuje tvar a topologii útočné strategie bez technik a nástrojů | ano | „vícestupňová degradace řetězce důvěry se 3 body obratu“ |
| **L3** | polokonkrétní | obsahuje odkazy na konkrétní techniky, protokoly nebo součásti systému | ne – odmítnuto | konkrétní technika napadení konkrétní verze databáze |
| **L4** | téměř spustitelné | obsahuje dost podrobností k provedení útoku | ne – odmítnuto | postup krok za krokem |

Filtrování není jednoduchým hledáním klíčových slov. Vynucovač hodnotí sémantický obsah
každého artefaktu a posuzuje, zda by informace mohla být ve spojení s veřejně dostupnými
znalostmi převedena na použitelný návod. Hodnocení běží průběžně během tvorby výstupu, takže
umožňuje včasný zásah, nikoli jen dodatečné filtrování.

### Protokoly izolace

Izolace Black Teamu je vynucena několika nezávislými mechanismy, takže žádné jediné místo
selhání nemůže hranici domény narušit:

| Protokol | Mechanismus | Vynucení | Možnost obejití |
|----------|-----------|-------------|-------------------|
| **síťová izolace** | nulové připojení – žádná příchozí ani odchozí spojení | strukturální za běhu (cesta neexistuje) | žádná – strukturální |
| **datová izolace** | žádný přístup k produkčním datům, osobním údajům ani živému stavu systému | sandbox jen se syntetickými daty | žádná – vynuceno sandboxem |
| **komunikační izolace** | veškerý výstup přes vynucovač abstrakce; žádné přímé vnější zprávy | omezení topologie agentů | žádná – vynuceno topologií |
| **izolace provádění** | všechny operace v PrismaticDark.Sandbox | sandbox na úrovni procesů | žádná – hranice procesu |
| **časová izolace** | etické kontroly každých 10–15 sekund; zastavení při jakékoli anomálii | nepřetržité sledování | žádná – nepřetržité |
| **auditní izolace** | neměnná auditní stopa každé operace; logování odhalující manipulaci | úložiště jen pro připojování | žádná – jen připojování |
| **eskalační izolace** | `gray-escalation-guard` Gray Teamu brání neoprávněnému přístupu do domény Black | bezpečnostní přepsání napříč týmy | žádná – přepsání L4 |

Zvláštní pozornost si zaslouží eskalační izolace. Průzkum hranic, který provádí [Gray
Team](@/glossary/gray-team.md), se někdy může přiblížit území, které se překrývá s doménou
modelování hrozeb Black Teamu. Agent `gray-escalation-guard` (L4, kritický pro bezpečnost) má
výslovné oprávnění zastavit každou operaci Gray Teamu, která hrozí eskalovat do domény Black.
Tím se brání tomu, aby méně omezená doména Gray nechtěně získala přístup do vysoce omezené
domény Black.

### Zásada nulového spustitelného výstupu

Nejzásadnějším omezením Black Teamu je absolutní zákaz spustitelného obsahu. Zásada se
netýká jen kódu, ale jakéhokoli artefaktu, který by mohl sloužit jako návod k útoku krok za
krokem:

- žádný zdrojový kód, pseudokód ani implementace algoritmů;
- žádné sekvence příkazů, volání API ani specifikace protokolů;
- žádné konfigurace nástrojů, struktury payloadů ani vzory injekcí;
- žádné konkrétní identifikátory zranitelností (odkazy na CVE jen na úrovni abstrakce L1);
- žádné časování, požadavky na zdroje ani specifikace infrastruktury pro útoky;
- žádné scénáře sociálního inženýrství, šablony phishingu ani scénáře předstírání;
- žádné síťové diagramy se zneužitelnými cestami a konkrétními protokoly.

Zásadu vynucuje vynucovač abstrakce na výstupní hranici a ověřuje ji neměnná auditní stopa.
Porušení vede k okamžitému zastavení operace a eskalaci k přezkumu nejvyšší autoritou.
Podle záznamů platformy z domény Black dosud neunikl žádný spustitelný obsah.

## Použití v Prismatic Platform

### Hodnocení rizika zbraňového využití

Hlavním analytickým výstupem Black Teamu je hodnocení rizika zbraňového využití – posouzení,
jak by skuteční protivníci mohli teoretické zranitelnosti nebo útočné strategie převést na
operační zbraně. Rámec pracuje ve třech rozměrech:

**Proveditelnost:** jak technicky dosažitelný je teoretický útok při současných veřejně
dostupných nástrojích a znalostech? Rozměr rozlišuje, zda model popisuje něco jen teoreticky
možného, nebo něco, co by motivovaný protivník mohl věrohodně provést.

**Dopad:** jaký by byl důsledek úspěšného zbraňového využití? Rozměr hodnotí dosah škod,
vratnost, obtížnost detekce a kaskádové účinky na závislé systémy.

**Novost:** popisuje model známou třídu útoků (dobře bráněnou), nebo novou (možná
nebráněnou)? Nové hrozby dostávají vyšší prioritu v toku signálů k [Purple
Teamu](@/glossary/purple-team.md) pro syntézu a k [Blue Teamu](@/glossary/blue-team.md) pro
posouzení obranného postoje.

Výstup hodnocení vstupuje do širšího toku signálů [Color Teams](@/glossary/color-teams.md),
kde informuje tvorbu scénářů Red Teamu a obranné priority Blue Teamu – vždy na úrovních
abstrakce L1–L2.

### Architektura toku signálů

Postavení Black Teamu v toku signálů je záměrně asymetrické. Dává vstup [Red
Teamu](@/glossary/red-team.md) prostřednictvím abstraktních modelů hrozeb (filtrovaných na
L1–L2), ale sám nedostává přímý vstup od žádného jiného týmu. Jednosměrný tok brání vnějšímu
ovlivnění nezávislé analýzy.

```
Black Team (abstract threat models)
    |
    v [L1-L2 filtered output only]
Red Team (incorporates into adversarial scenarios)
    |
    v
Purple Team (synthesizes with Blue Team findings)
    |
    v
Blue Team (builds defensive posture)
```
[White Team](@/glossary/white-team.md) může příležitostně ověřit logickou konzistenci Black
Teamu formální verifikací pomocí důkazů v Lean4, ale ověření se týká jen abstraktního
výstupu – White Team nikdy nemá přístup k vnitřním procesům uvažování Black Teamu.

Koordinátor [Purple Teamu](@/glossary/purple-team.md) se může na výstup Black Teamu odvolat
při uzavírání smyčky Red–Blue, ale jen prostřednictvím filtrovaných, abstrahovaných verzí,
které prošly AbstractionFilter. Purple Team nemá oprávnění žádat po Black Teamu výstup
s nižší úrovní abstrakce.

## Příklady kódu

```elixir
defmodule PrismaticDark.BlackTeam.AbstractionFilter do
  @moduledoc """
  Enforces L1-L4 abstraction levels on all Black Team output.
  Only L1 (fully abstract) and L2 (structurally abstract) content
  is permitted to exit the Black domain. L3 and L4 content is
  rejected and logged to the immutable audit trail.

  This module is the core safety mechanism that distinguishes
  Black Team from all other Color Teams in the security architecture.
  """

  require Logger

  @type abstraction_level :: :l1_fully_abstract | :l2_structurally_abstract | :l3_semi_concrete | :l4_near_executable
  @type filter_result :: {:pass, abstraction_level()} | {:reject, abstraction_level(), String.t()}

  @type threat_model :: %{
    id: String.t(),
    title: String.t(),
    content: String.t(),
    threat_class: String.t(),
    feasibility: float(),
    impact: float(),
    novelty: float(),
    timestamp: DateTime.t()
  }

  @type audit_entry :: %{
    model_id: String.t(),
    assessed_level: abstraction_level(),
    decision: :pass | :reject,
    reason: String.t(),
    timestamp: DateTime.t()
  }

  @permitted_levels [:l1_fully_abstract, :l2_structurally_abstract]

  @doc """
  Evaluates a threat model artifact and determines its abstraction level.
  Returns {:pass, level} if the content meets L1 or L2 requirements,
  or {:reject, level, reason} if it contains semi-concrete or
  near-executable detail.

  ## Examples

      iex> model = %{id: "tm-001", content: "Class-3 asymmetry pattern", title: "Abstract Model"}
      iex> {:pass, :l1_fully_abstract} = PrismaticDark.BlackTeam.AbstractionFilter.evaluate(model)

  """
  @spec evaluate(threat_model()) :: filter_result()
  def evaluate(%{content: content, id: model_id} = _model) do
    level = classify_abstraction_level(content)

    audit_entry = %{
      model_id: model_id,
      assessed_level: level,
      decision: if(level in @permitted_levels, do: :pass, else: :reject),
      reason: rejection_reason(level),
      timestamp: DateTime.utc_now()
    }

    log_audit_entry(audit_entry)

    case level do
      level when level in @permitted_levels ->
        {:pass, level}

      level ->
        Logger.warning("Black Team output rejected",
          model_id: model_id,
          level: level,
          reason: audit_entry.reason
        )

        {:reject, level, audit_entry.reason}
    end
  end

  @doc """
  Computes the weaponization risk score across three dimensions:
  feasibility (technical achievability), impact (consequence severity),
  and novelty (defense gap potential). Returns a composite score
  between 0.0 and 1.0.

  ## Examples

      iex> dims = %{feasibility: 0.7, impact: 0.9, novelty: 0.8}
      iex> score = PrismaticDark.BlackTeam.AbstractionFilter.weaponization_risk(dims)
      iex> score > 0.0 and score <= 1.0
      true

  """
  @spec weaponization_risk(%{feasibility: float(), impact: float(), novelty: float()}) :: float()
  def weaponization_risk(%{feasibility: f, impact: i, novelty: n}) do
    weights = %{feasibility: 0.3, impact: 0.4, novelty: 0.3}

    (f * weights.feasibility + i * weights.impact + n * weights.novelty)
    |> min(1.0)
    |> max(0.0)
  end

  @spec classify_abstraction_level(String.t()) :: abstraction_level()
  defp classify_abstraction_level(content) do
    cond do
      contains_executable_patterns?(content) -> :l4_near_executable
      contains_concrete_references?(content) -> :l3_semi_concrete
      contains_structural_detail?(content) -> :l2_structurally_abstract
      true -> :l1_fully_abstract
    end
  end

  @spec contains_executable_patterns?(String.t()) :: boolean()
  defp contains_executable_patterns?(content) do
    executable_indicators = [
      ~r/\b(curl|wget|nmap|sqlmap|metasploit)\b/i,
      ~r/\b(SELECT|INSERT|DROP|DELETE)\s+/,
      ~r/\b(sudo|chmod|chown)\s+/,
      ~r/<script[\s>]/i
    ]

    Enum.any?(executable_indicators, &Regex.match?(&1, content))
  end

  @spec contains_concrete_references?(String.t()) :: boolean()
  defp contains_concrete_references?(content) do
    concrete_indicators = [
      ~r/CVE-\d{4}-\d+/,
      ~r/\b(port\s+\d+)\b/i,
      ~r/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/
    ]

    Enum.any?(concrete_indicators, &Regex.match?(&1, content))
  end

  @spec contains_structural_detail?(String.t()) :: boolean()
  defp contains_structural_detail?(content) do
    String.contains?(content, ["pivot point", "attack surface", "trust chain", "lateral movement"])
  end

  @spec rejection_reason(abstraction_level()) :: String.t()
  defp rejection_reason(:l3_semi_concrete), do: "Contains concrete references to specific techniques or components"
  defp rejection_reason(:l4_near_executable), do: "Contains near-executable content or implementation detail"
  defp rejection_reason(_), do: "Permitted"

  @spec log_audit_entry(audit_entry()) :: :ok
  defp log_audit_entry(entry) do
    Logger.info("Black Team audit",
      model_id: entry.model_id,
      level: entry.assessed_level,
      decision: entry.decision
    )

    :ok
  end
end
```
```elixir
defmodule PrismaticDark.BlackTeam.ThreatModeler do
  @moduledoc """
  Generates abstract threat models through worst-case adversarial
  optimization analysis. Operates exclusively within the Black Team
  sandbox, producing output that must pass through the AbstractionFilter
  before reaching any external consumer.

  All threat models are classified by threat class and scored across
  the three-dimensional weaponization risk framework (feasibility,
  impact, novelty).
  """

  alias PrismaticDark.BlackTeam.AbstractionFilter

  require Logger

  @type threat_class :: :information_asymmetry | :trust_chain_degradation | :resource_exhaustion | :state_corruption | :signal_manipulation
  @type campaign_config :: %{
    scope: String.t(),
    threat_classes: [threat_class()],
    max_models: pos_integer(),
    abstraction_floor: :l1_fully_abstract | :l2_structurally_abstract
  }

  @doc """
  Generates a batch of abstract threat models for a given campaign
  configuration. Each model is automatically passed through the
  AbstractionFilter before inclusion in results.

  ## Examples

      iex> config = %{scope: "epistemic-integrity", threat_classes: [:information_asymmetry], max_models: 5, abstraction_floor: :l1_fully_abstract}
      iex> {:ok, models} = PrismaticDark.BlackTeam.ThreatModeler.generate_campaign(config)
      iex> is_list(models)
      true

  """
  @spec generate_campaign(campaign_config()) :: {:ok, [AbstractionFilter.threat_model()]} | {:error, term()}
  def generate_campaign(%{threat_classes: classes, max_models: max} = _config) do
    models =
      classes
      |> Enum.flat_map(&generate_models_for_class(&1, max))
      |> Enum.take(max)
      |> Enum.filter(fn model ->
        case AbstractionFilter.evaluate(model) do
          {:pass, _level} -> true
          {:reject, _level, reason} ->
            Logger.warning("Model rejected during campaign", model_id: model.id, reason: reason)
            false
        end
      end)

    {:ok, models}
  end

  @spec generate_models_for_class(threat_class(), pos_integer()) :: [AbstractionFilter.threat_model()]
  defp generate_models_for_class(threat_class, max_count) do
    1..max_count
    |> Enum.map(fn idx ->
      %{
        id: "tm-#{threat_class}-#{idx}",
        title: "#{threat_class} threat model #{idx}",
        content: "Abstract #{threat_class} pattern analysis at class level",
        threat_class: Atom.to_string(threat_class),
        feasibility: 0.0,
        impact: 0.0,
        novelty: 0.0,
        timestamp: DateTime.utc_now()
      }
    end)
  end
end
```
## Časté chyby

| Chyba | Popis | Důsledek | Prevence |
|---------|-------------|-------------|------------|
| **únik konkrétnosti** | dovolit obsahu L3/L4 opustit doménu oslabením pravidel filtru | odhalení použitelných informací o zneužití | AbstractionFilter je strukturální, ne konfigurovatelný |
| **záměna Red a Black** | považovat Black Team za silnější Red Team s větším přístupem | nesladěné modely hrozeb, chybné předpoklady o schopnostech | jasná dokumentace, oddělené registry agentů |
| **pokusy obejít izolaci** | směrovat komunikaci mimo vynucovač abstrakce | porušení auditní stopy, možný únik informací | vynucení topologie, alternativní cesty neexistují |
| **přílišná abstrakce** | výstup L1 tak abstraktní, že nemá obrannou hodnotu | promarněné cykly analýzy, žádné použitelné poznatky pro Red/Blue | skóre rizika zajišťuje obrannou užitečnost |
| **zastaralé modely** | nestárnutí starých modelů při vývoji prostředí hrozeb | obrana postavená na zastaralých schopnostech protivníka | axiom NABLA Time Decay, časové razítko expirace modelu |
| **uvažování z jednoho zdroje** | theorist-commander spoléhá na jediný analytický rámec | úzké modely, které přehlédnou útočné vektory napříč doménami | axiom NABLA [Signal Plurality](@/glossary/signal-plurality.md) vyžaduje 2+ cesty uvažování |
| **únava z etických kontrol** | ignorovat nebo potlačovat varování průběžných etických kontrol | postupný posun ke konkrétnímu výstupu | kontroly nelze potlačit, při anomálii zastavení |
| **mezery v auditní stopě** | nezaznamenat mezikroky uvažování | neúplný forenzní záznam, neověřitelný původ výstupu | úložiště jen pro připojování s průběžným ověřením zápisu |
| **eskalace napříč doménami** | operace Gray Teamu se blíží území Black | neoprávněné modelování hrozeb mimo omezení izolace | přepsání L4 agentem gray-escalation-guard |
| **manipulace se skóre** | uměle navyšovat skóre novosti pro upřednostnění modelů | zkreslené rozdělení obranných zdrojů | nezávislé ověření skóre Purple Teamem |

## Osvědčené postupy

1. **Držet přísnou kázeň výstupu L1–L2** – každý artefakt musí být před předáním Red Teamu
   nezávisle ověřitelný jako abstraktní. V pochybnostech klasifikovat jako L1.
2. **Soustavně používat trojrozměrný rámec rizika** – proveditelnost, dopad a novost se
   počítají pro každý model hrozby, nejen pro ty s vysokou prioritou. I modely s nízkým skóre
   dotvářejí obraz prostředí hrozeb.
3. **Zachovat jednosměrný tok signálů** – Black Team nesmí nikdy dostávat přímý vstup od
   jiných týmů. Vnější vliv by mohl zkreslit nezávislé modelování a oslabit analytickou
   hodnotu abstraktního hodnocení.
4. **Střídat zaměření na třídy hrozeb mezi kampaněmi** – nepřeceňovat jedinou třídu.
   Informační asymetrie, degradace řetězce důvěry, vyčerpání zdrojů, poškození stavu
   a manipulace signálem vyžadují každá vlastní analytické cykly.
5. **Ověřovat úrovně abstrakce formální verifikací White Teamu** – kde je to možné,
   předložit kritické modely [White Teamu](@/glossary/white-team.md) k důkazu logické
   konzistence v Lean4. Zachytí se tím chyby uvažování bez odhalení vnitřních procesů.
6. **Průběžně sledovat úplnost auditní stopy** – mezery v neměnné stopě ukazují na možná
   selhání vynucení. Každá operace musí mít odpovídající záznam.
7. **Uplatňovat zachování rozporů NABLA na rozcházející se modely** – vytvoří-li
   theorist-commander protichůdné modely pro tutéž třídu hrozeb, zachovat oba místo řešení
   rozporu. Protichůdné modely často odhalí skryté předpoklady.
8. **Stanovit časové meze kampaní** – kampaně modelování hrozeb mají mít výslovné časové
   limity, aby se analýza nerozplývala. Operace jsou náročné a těží ze soustředěného,
   časově ohraničeného provedení.
9. **Porovnávat skóre rizika s historickými daty** – srovnání s předchozími kampaněmi ukáže
   trendy ve vývoji schopností protivníka. Rostoucí skóre proveditelnosti v určité třídě
   hrozeb signalizuje rostoucí riziko ve skutečnosti.
10. **Nikdy nerozšiřovat počet agentů** – architektura dvou agentů (teoretik a vynucovač) je
    záměrné omezení návrhu. Další agenti by zvětšili plochu bez úměrného analytického
    přínosu.

## Etický rámec

Operace Black Teamu se řídí přísnými etickými hranicemi, které doplňují technické protokoly
izolace:

- **kontext oprávnění:** všechny operace spadají výhradně do soutěží CTF, obranného
  bezpečnostního výzkumu a autorizovaných penetračních testů;
- **jen simulace:** veškerá analýza používá syntetická data a hypotetické scénáře – nikdy
  skutečné organizace, osoby ani systémy;
- **obranný účel:** každý model hrozby musí sloužit prokazatelnému obrannému účelu; čistě
  akademický průzkum bez obranného využití není povolen;
- **přiměřenost:** hloubka analýzy musí odpovídat obranné potřebě – nejhlubší analýza je
  vyhrazena pro nejkritičtější mezery v obraně;
- **požadavky na přezkum:** všechny kampaně podléhají přezkumu po operaci; neměnná auditní
  stopa zajišťuje úplnou transparentnost.

Tato etická omezení se vynucují stejnými mechanismy jako technická: nepřetržitým sledováním,
neměnnou auditní stopou a bezpečnostním oprávněním vynucovače abstrakce. Výsledkem je
schopnost modelovat hrozby se skutečnou obrannou hodnotou při zachování nejvyšších etických
standardů. Stejné zásady – syntetické případy, obranný účel, přiměřenost a přezkum – uplatňuje
Kompendium u kazuistik a scénářů (viz [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md)).

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Formal Verification* a *Lean4* (ověřování logické
konzistence výstupu), *Threat Intelligence* (strategické zpravodajství odvozené z modelů),
*Penetration Testing* a *Consciousness Traits*.

## Související

**Color Teams**

- [Color Teams](@/glossary/color-teams.md) – přehled všech šesti týmů.
- [Gray Team](@/glossary/gray-team.md) – průzkum hranic se strážcem eskalace do domény Black.
- [Red Team](@/glossary/red-team.md) – adversariální simulace, která abstraktní modely
  spotřebovává.
- [Blue Team](@/glossary/blue-team.md) – epistemická obrana informovaná modely hrozeb.
- [Purple Team](@/glossary/purple-team.md) – syntéza zjištění všech týmů.
- [White Team](@/glossary/white-team.md) – konstruktivní ověřování logické konzistence.

**Platforma a kniha**

- [Agent Tier](@/glossary/agent-tier.md) – agenti Black Teamu mají úroveň L3.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec omezení abstrakce.
- [Dual-use poznání](@/glossary/dual-use-poznani.md) – etický problém, který abstrakce řeší.
- [Black Team: modelování EA](@/kompendium/aiad-integration/black-team-ea-modeling.md) –
  modelování technik EA na úrovni abstrakce.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: black-team](@/kompendium/glossary-bridges/bridge-black-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
