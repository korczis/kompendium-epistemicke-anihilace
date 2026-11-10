+++
title = "Addiction Recovery (princip epistemické bdělosti)"
weight = 50
description = "Princip epistemické disciplíny platformy: trvalá bdělost vůči racionalizaci důkazů, vybírání třešniček a předčasnému uzavírání rozporů, po vzoru prevence relapsu u závislosti."

[taxonomies]
tags = ["glossary", "epistemic", "nabla", "quality", "prismatic"]

[extra]
category = "epistemic"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "advanced"
quality_score = 95
technical_level = "advanced"
domain_category = "epistemic-hygiene"
related_concepts = ["nabla-infinity", "contradiction-preservation", "cherry-picking", "signal-plurality", "evidence-handling"]
implementation_status = "production"
authority_level = "L3"
difficulty_rating = 7
prerequisites = ["nabla-infinity", "contradiction-preservation", "belief-graph"]
learning_path = "epistemic-foundations"
interactive_demos = ["/labs/glossary/addiction-recovery"]
code_examples = ["PrismaticNabla.AddictionPreservation.check/1", "PrismaticNabla.VigilanceMonitor.scan/1"]
external_resources = ["Festinger - Cognitive Dissonance Theory (1957)", "Kahneman - Thinking Fast and Slow (2011)"]
version_introduced = "gen-8"
stability_level = "stable"
testing_scenarios = ["contradiction-suppression-detection", "rationalization-pattern-recognition", "cherry-pick-guard-validation"]
related_terms = ["nabla-infinity", "contradiction-preservation", "cherry-picking", "signal-plurality", "evidence-over-opinion", "belief-graph", "confidence-scoring", "trinity-gate", "provenance-mandatory", "epistemic-robustness", "time-decay", "qeve"]
date_modified = "2026-11-10"
+++

## Definice

**Addiction Recovery** (doslova *zotavení ze závislosti*) je základní princip epistemické
disciplíny Prismatic Platform. Ukládá trvalou, automatizovanou bdělost vůči lidskému
i systémovému sklonu odbýt nepohodlné důkazy racionalizací, potlačit rozpory a vybírat
data tak, aby podpořila předem daný závěr. Termín vědomě a přesně přirovnává epistemickou
hygienu k programům zotavení ze závislosti: tak jako člověk v zotavení musí trvale vědět, že
nutkání k relapsu nikdy úplně nezmizí, musí epistemický systém trvale počítat s tím, že
nutkání uhladit rozpory, odbýt odlehlé signály a vyrobit falešnou jistotu nikdy úplně
nezmizí. Princip je zakódován jako strukturální omezení v rámci [NABLA
Infinity](@/glossary/nabla-infinity.md) a vynucován automatickou detekcí vzorců
racionalizace ve všech operacích, které utvářejí přesvědčení. V kódu platformy nese
označení *Addiction Preservation* (`PrismaticNabla.AddictionPreservation`).

**Vztah ke knize:** princip patří do kontextu platformy, z níž Kompendium vzešlo, ale
přímo souvisí s jeho tématem. Vzorce racionalizace, které platforma blokuje ve svém grafu
přesvědčení, jsou strojovou obdobou zkreslení, jež Kompendium popisuje u lidí – od
[konfirmačního biasu](@/glossary/konfirmacni-bias.md) po [selektivní
expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md). Lidskou podobu stejné
bdělosti nabízí [osobní audit zkreslení](@/kompendium/self-defense-guides/38-bias-audit-personal.md)
a analogii s relapsem rozvádí [prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md)
v protokolech zotavení.

## Přehled

### Historický a filozofický kontext

Princip vznikl z kritického pozorování v raném vývoji platformy: epistemické systémy se
nezhoršují náhlými katastrofickými selháními, ale postupným hromaděním drobných,
jednotlivě rozumných ústupků. Jednorázové vyřazení protichůdného signálu se zdá neškodné.
Jednorázové zaokrouhlení skóre důvěry nahoru působí pragmaticky. Jednorázové zacházení se
souvisejícími zdroji jako s nezávislými vypadá jako poctivá chyba. Tyto drobné ústupky se
však sčítají. Během týdnů a měsíců narušují epistemické základy celého systému, až
závěry, které vypadají ověřeně, stojí na síti potlačených rozporů, nafouknuté důvěry
a nezpochybněných předpokladů.

Tento vzorec s nepříjemnou přesností zrcadlí dynamiku závislosti. Výzkumníci závislostí
dlouho vědí, že relaps nezačíná užitím látky. Začíná sledem kognitivních posunů:
zlehčováním („jedna sklenka nic neznamená“), racionalizací („vedl jsem si dobře, zasloužím
si to“) a selektivní pozorností („soustředím se na dobré stránky“). Každý posun je
jednotlivě malý a subjektivně rozumný. Dohromady znovu vystaví myšlenkový rámec, který
relaps umožní.

Platforma tento poznatek přenáší do epistemologie. Epistemický relaps – úpadek integrity
vědění – sleduje stejný vzorec. Nezačíná hrubým falšováním dat, ale sledem kognitivních
zkratek: zlehčováním („tenhle rozpor je asi šum“), racionalizací („máme dost podpůrných
důkazů, abychom tuto odlehlou hodnotu přebili“) a selektivní pozorností („silné signály
zjevně ukazují jedním směrem“). Každá zkratka je jednotlivě obhajitelná. Dohromady vytvoří
systém přesvědčení utvářený spíš pohodlím než důkazy. Psychologicky tomu odpovídá
Festingerova teorie kognitivní disonance (1957) a Kahnemanův popis rychlého, intuitivního
myšlení (2011).

### Základní metafora

Metafora zotavení ze závislosti není ozdobou. Pojmenovává konkrétní strukturální paralely
mezi zotavením ze závislosti a udržováním epistemické integrity:

| Zotavení ze závislosti | Epistemická integrita | Vynucení na platformě |
|-------------------|---------------------|---------------------|
| **Spouštěče** – vnější podněty, které aktivují bažení | **Spouštěče racionalizace** – situace, které svádějí k potlačení důkazů | automatická detekce spouštěčů v procesu přesvědčení |
| **Bdělost** – trvalé vědomí vlastní zranitelnosti | **Epistemická bdělost** – nepřetržité sledování vzorců zkreslení | kontrola souladu s axiomy NABLA v reálném čase |
| **Prevence relapsu** – strukturované postupy proti návratu | **Vynucení proti antivzorům** – tvrdé blokace známých epistemických selhání | úrovně vynucení E2/E3 bez možnosti obejití |
| **Sponzor a odpovědnost** – vnější ověření rozhodnutí | **[Trinity Gate](@/glossary/trinity-gate.md)** – vícevrstvé nezávislé ověření | brány strukturální, logické a formální konzistence |
| **Den po dni** – ne trvalé vyléčení, ale soustavná praxe | **Průběžné ověřování** – ne jednorázová validace, ale trvalý soulad | kontrola axiomů u každé operace, ne periodické audity |
| **Setkání a komunita** – sdílené struktury bdělosti | **[Color Teams](@/glossary/color-teams.md)** – dynamika útočných a obranných týmů | nepřetržitá výzva a ověřování šesti týmy |

Paralely spojuje poznatek, že zotavení ze závislosti ani epistemickou integritu nelze
„vyřešit“. Neexistuje bod, kdy by systém mohl prohlásit, že je vůči racionalizaci trvale
imunní, tak jako neexistuje bod, kdy by člověk v zotavení mohl prohlásit, že je trvale
imunní vůči relapsu. Správným postojem je trvalá, strukturovaná bdělost – ne paranoia, ale
disciplinované vědomí udržované automatickými systémy, které netrpí kognitivní únavou,
jež lidskou bdělost časem oslabuje.

### Význam v rámci platformy

Addiction Recovery není samostatným principem, ale rámcem na metaúrovni, který prostupuje
celý rámec [NABLA Infinity](@/glossary/nabla-infinity.md) (viz též [NABLA
Axioms](@/glossary/nabla-axioms.md)). Každý axiom NABLA lze chápat jako konkrétní
mechanismus proti relapsu:

- **[Signal Plurality](@/glossary/signal-plurality.md)** (pluralita signálů) – brání
  racionalizaci „tento jeden zdroj je dost autoritativní“;
- **Contradiction Preservation** (zachování rozporů) – brání zlehčení „tento nesoulad je
  asi jen šum“;
- **Absence Informative** (nepřítomnost je informace) – brání selektivní pozornosti „když
  není důkaz o problému, problém není“;
- **Time Decay** (časové stárnutí) – brání racionalizaci zastaralosti „tento důkaz je pořád
  dost dobrý“;
- **Unknown Valid** (neznámé je platná odpověď) – brání falešné jistotě „musíme odpovědět,
  i když si nejsme jisti“;
- **Source Independence** (nezávislost zdrojů) – brání slepotě ke korelaci „deset článků to
  potvrzuje“ (z téhož zdroje);
- **Provenance Mandatory** (povinný původ) – brání úniku od odpovědnosti „to přece ví
  každý“.

## Technické podrobnosti

### Taxonomie vzorců racionalizace

Princip definuje strukturovanou taxonomii vzorců epistemické racionalizace; každý odpovídá
určitému spouštěči relapsu u závislosti:

| Vzorec | Analogie u závislosti | Popis | Metoda detekce | Vynucení |
|---------|------------------|-------------|-----------------|-------------|
| **Odbytí rozporu** | „Jedna sklenka neuškodí.“ | vyřazení protichůdného důkazu jako šumu bez prošetření | kontrola integrity grafu na chybějící uzly rozporů | E2 BLOCK |
| **Nafouknutí důvěry** | „Tentokrát to zvládnu.“ | umělé zvýšení skóre důvěry nad míru, kterou podporují důkazy | statistická odchylka od kalibrovaného modelu důvěry | E2 BLOCK |
| **Praní zdrojů** | „Dělají to všichni.“ | zacházení se souvisejícími zdroji jako s nezávislými, aby se splnil požadavek plurality | analýza skupin nezávislosti v původu důkazů | E2 BLOCK |
| **Selektivní rámování** | „Dal jsem si jen trochu.“ | podání důkazů tak, aby se protichůdné signály zmenšily, aniž by se odstranily | analýza salience při šíření signálu dál | E1 WARNING |
| **Časový únik** | „To bylo dávno.“ | použití zastaralých důkazů bez časového stárnutí na podporu současných závěrů | analýza časových razítek s povinnou funkcí stárnutí | E2 BLOCK |
| **Slepota k nepřítomnosti** | „Žádné zprávy, dobré zprávy.“ | nesledování očekávaných, ale chybějících důkazů jako signálu | srovnání s registrem očekávaných signálů | E1 WARNING |
| **Předčasné uzavření** | „Už jsem vyléčený.“ | prohlášení rozporu za vyřešený bez nových důkazů | audit přechodů stavu řešení | E3 HALT |
| **Náhrada autoritou** | „Doktor říkal, že jsem v pořádku.“ | nahrazení plurality důkazů odvoláním na jediný autoritativní zdroj | sledování autority zdroje vs. nezávislosti | E2 BLOCK |

### Architektura bdělosti

Platforma uskutečňuje princip vícevrstvou architekturou bdělosti:

```elixir
defmodule PrismaticNabla.AddictionPreservation do
  @moduledoc """
  Implements the Addiction Recovery principle through continuous
  monitoring of belief-forming operations for rationalization
  patterns. Every operation that modifies the belief graph is
  checked against the rationalization pattern taxonomy.
  """

  alias PrismaticNabla.{BeliefGraph, ContradictionIndex, VigilanceMonitor}

  @type vigilance_result ::
    {:clean, map()}
    | {:warning, String.t(), map()}
    | {:block, String.t(), map()}
    | {:halt, String.t(), map()}

  @spec check(BeliefGraph.operation()) :: vigilance_result()
  def check(%{type: :evidence_removal} = operation) do
    case ContradictionIndex.affected_contradictions(operation) do
      [] ->
        {:clean, %{operation: operation, patterns_checked: 8}}

      contradictions ->
        {:block,
         "Contradiction Dismissal detected: removing evidence " <>
         "#{operation.evidence_id} would suppress #{length(contradictions)} " <>
         "active contradictions. Addiction Recovery protocol requires " <>
         "explicit contradiction resolution through new evidence.",
         %{pattern: :contradiction_dismissal, contradictions: contradictions}}
    end
  end

  def check(%{type: :confidence_update} = operation) do
    calibrated = VigilanceMonitor.calibrated_confidence(operation.hypothesis_id)
    proposed = operation.new_confidence

    deviation = abs(proposed - calibrated) / max(calibrated, 0.01)

    cond do
      deviation > 0.30 ->
        {:block,
         "Confidence Inflation detected: proposed confidence #{proposed} " <>
         "deviates #{Float.round(deviation * 100, 1)}% from calibrated " <>
         "value #{calibrated}. Addiction Recovery protocol blocks " <>
         "unsupported confidence adjustments.",
         %{pattern: :confidence_inflation, deviation: deviation}}

      deviation > 0.15 ->
        {:warning,
         "Potential Confidence Inflation: #{Float.round(deviation * 100, 1)}% " <>
         "deviation from calibrated confidence. Investigation recommended.",
         %{pattern: :confidence_inflation, deviation: deviation}}

      true ->
        {:clean, %{operation: operation, deviation: deviation}}
    end
  end

  def check(%{type: :resolution_transition} = operation) do
    case operation.new_status do
      :resolved ->
        if has_new_evidence?(operation) do
          {:clean, %{operation: operation, resolution_basis: :new_evidence}}
        else
          {:halt,
           "Premature Closure detected: attempting to resolve contradiction " <>
           "#{operation.contradiction_id} without new evidence. Addiction " <>
           "Recovery protocol requires evidence-backed resolution. " <>
           "Analyst judgment alone is insufficient.",
           %{pattern: :premature_closure, contradiction_id: operation.contradiction_id}}
        end

      _ ->
        {:clean, %{operation: operation}}
    end
  end

  defp has_new_evidence?(%{resolution_evidence: evidence}) when is_list(evidence) do
    Enum.any?(evidence, fn e ->
      DateTime.diff(DateTime.utc_now(), e.collected_at, :hour) < 72
    end)
  end

  defp has_new_evidence?(_), do: false
end
```
### Vigilance Monitor

Vigilance Monitor běží nepřetržitě a vyhledává vzorce, které naznačují epistemický posun
k racionalizaci:

```elixir
defmodule PrismaticNabla.VigilanceMonitor do
  @moduledoc """
  Continuous monitoring process implementing the Addiction Recovery
  principle. Tracks belief graph modifications over time to detect
  gradual rationalization patterns that individual operation checks
  might miss.
  """

  use GenServer

  @type state :: %{
    operation_history: [map()],
    pattern_counts: %{atom() => non_neg_integer()},
    vigilance_score: float(),
    last_scan: DateTime.t()
  }

  @scan_interval :timer.minutes(5)
  @pattern_threshold 3
  @vigilance_decay_rate 0.95

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec scan(keyword()) :: {:ok, map()} | {:warning, String.t(), map()}
  def scan(opts \\ []) do
    GenServer.call(__MODULE__, {:scan, opts})
  end

  @spec calibrated_confidence(String.t()) :: float()
  def calibrated_confidence(hypothesis_id) do
    GenServer.call(__MODULE__, {:calibrated_confidence, hypothesis_id})
  end

  @impl true
  def init(opts) do
    schedule_scan()
    {:ok, %{
      operation_history: [],
      pattern_counts: %{},
      vigilance_score: 1.0,
      last_scan: DateTime.utc_now(),
      window_hours: Keyword.get(opts, :window_hours, 24)
    }}
  end

  @impl true
  def handle_call({:scan, _opts}, _from, state) do
    {result, new_state} = perform_scan(state)
    {:reply, result, new_state}
  end

  def handle_call({:calibrated_confidence, hypothesis_id}, _from, state) do
    confidence = compute_calibrated_confidence(hypothesis_id, state)
    {:reply, confidence, state}
  end

  @impl true
  def handle_info(:scheduled_scan, state) do
    {_result, new_state} = perform_scan(state)
    schedule_scan()
    {:noreply, new_state}
  end

  defp perform_scan(state) do
    recent_ops = filter_recent(state.operation_history, state.window_hours)
    pattern_counts = count_patterns(recent_ops)

    elevated_patterns =
      pattern_counts
      |> Enum.filter(fn {_pattern, count} -> count >= @pattern_threshold end)

    vigilance_score = compute_vigilance_score(elevated_patterns, state.vigilance_score)

    new_state = %{state |
      pattern_counts: pattern_counts,
      vigilance_score: vigilance_score,
      last_scan: DateTime.utc_now()
    }

    result =
      if Enum.empty?(elevated_patterns) do
        {:ok, %{vigilance_score: vigilance_score, patterns: pattern_counts}}
      else
        {:warning,
         "Addiction Recovery alert: elevated rationalization patterns detected " <>
         "in last #{state.window_hours}h: #{inspect(elevated_patterns)}",
         %{vigilance_score: vigilance_score, elevated: elevated_patterns}}
      end

    {result, new_state}
  end

  defp filter_recent(history, hours) do
    cutoff = DateTime.add(DateTime.utc_now(), -hours, :hour)
    Enum.filter(history, fn op -> DateTime.compare(op.timestamp, cutoff) == :gt end)
  end

  defp count_patterns(operations) do
    operations
    |> Enum.map(& &1.pattern)
    |> Enum.frequencies()
  end

  defp compute_vigilance_score([], current), do: min(current * (1 / @vigilance_decay_rate), 1.0)
  defp compute_vigilance_score(elevated, current) do
    penalty = length(elevated) * 0.05
    max(current - penalty, 0.0)
  end

  defp compute_calibrated_confidence(hypothesis_id, state) do
    case fetch_hypothesis_evidence(hypothesis_id) do
      {:ok, evidence} ->
        base = compute_evidence_strength(evidence)
        base * state.vigilance_score

      {:error, _} ->
        0.0
    end
  end

  defp fetch_hypothesis_evidence(_hypothesis_id), do: {:ok, []}
  defp compute_evidence_strength(_evidence), do: 0.5

  defp schedule_scan do
    Process.send_after(self(), :scheduled_scan, @scan_interval)
  end
end
```
## Implementace v Prismatic Platform

### Integrace s NABLA Infinity

Princip je implementován jako metavrstva vynucení rámce [NABLA
Infinity](@/glossary/nabla-infinity.md). Zatímco NABLA definuje sedm axiomů, jimiž se řídí
utváření přesvědčení, Addiction Recovery definuje mechanismy sledování a vynucení, které
zajišťují, aby tyto axiomy nebyly postupně obcházeny hromaděním drobných ústupků.

Integrace působí na třech úrovních:

1. **Úroveň jednotlivé operace:** každá operace, která mění graf přesvědčení, prochází
   funkcí `AddictionPreservation.check/1`, která ji testuje proti taxonomii vzorců
   racionalizace. Tak se jednotlivá porušení zachytí v reálném čase.
2. **Úroveň časových vzorců:** GenServer `VigilanceMonitor` sleduje vzorce napříč
   operacemi v nastavitelných časových oknech (výchozí 24 hodin). Tak se zachytí postupný
   posun, který jednotlivé kontroly přehlédnou – například sled jednotlivě přípustných
   úprav důvěry, které dohromady nafouknou hypotézu nad její důkazní základnu.
3. **Strukturální úroveň:** periodické kontroly integrity grafu ověřují, že struktura grafu
   přesvědčení odpovídá požadavkům principu – žádné osiřelé důkazy, žádné chybějící uzly
   rozporů, žádné nesledované mezery v původu. Tyto kontroly zachytí poškození, které se
   mohlo dostat dovnitř cestami v kódu, jež zatím nejsou instrumentovány kontrolami
   jednotlivých operací.

### Integrace s Color Teams

[Red Team](@/glossary/red-team.md) testuje odolnost principu dvěma útočnými primitivy:

- **Manipulace důvěrou:** scénáře Red Teamu se pokoušejí nafouknout skóre důvěry sledem
  drobných, jednotlivě přípustných úprav. Detekce časových vzorců ve Vigilance Monitoru je
  kalibrována proti těmto scénářům.
- **Vyvolání posunu:** scénáře posunu zavádějí podprahové vzorce racionalizace a testují,
  zda Vigilance Monitor zachytí jejich kumulativní účinek. Na tyto útoky se specializuje
  agent `red-drift-inducer`.

[Blue Team](@/glossary/blue-team.md) udržuje obranný postoj proti porušením principu;
agent `blue-drift-detector` sleduje právě vzorce postupné eroze, na které princip míří.
[Purple Team](@/glossary/purple-team.md) slučuje zjištění Red Teamu s obrannými daty Blue
Teamu, kalibruje prahy detekce a aktualizuje taxonomii vzorců racionalizace.

### Eskalace vynucení

| Úroveň | Spouštěč | Reakce | Náprava |
|-------|---------|----------|-----------------|
| E1 | měkké varování před vzorcem (selektivní rámování, slepota k nepřítomnosti) | zapsáno VAROVÁNÍ, označeno k prošetření | přezkoumat označené operace do 24 h |
| E2 | detekce tvrdého vzorce (odbytí rozporu, nafouknutí důvěry, praní zdrojů) | BLOKACE operace, změna odmítnuta | opravit operaci, doložit platný důkazní základ |
| E3 | zjištěno předčasné uzavření nebo pohřbení rozporu | ZASTAVENÍ všech operací v dotčeném podgrafu hypotézy | nutný přezkum na nejvyšší úrovni, úplný audit posledních změn |
| E4 | soustavný vzorec napříč více hypotézami, který naznačuje koordinovanou racionalizaci | úplné šetření, audit všech změn grafu přesvědčení v okně | nutné nejvyšší schválení („cosmic clearance“), povinná analýza příčin |

## Srovnání s alternativami

| Přístup | Popis | Silné stránky | Slabé stránky |
|----------|-------------|-----------|------------|
| **Addiction Recovery (platforma)** | nepřetržitá automatická bdělost s taxonomií vzorců a vícestupňovým vynucením | zachytí postupný posun, nelze obejít, žádná lidská únava | vyžaduje pečlivou kalibraci, aby nevznikaly falešné poplachy |
| **Ruční revize kódu** | lidští recenzenti kontrolují kvalitu práce s důkazy | zachytí nové vzorce, rozumí kontextu | podléhá stejným zkreslením, která má odhalit; neškáluje |
| **Jen statická analýza** | jednorázové kontroly proti pevným pravidlům | rychlá, deterministická, snadno implementovatelná | nevidí časové vzorce, nezachytí postupný posun |
| **Kalibrace důvěry** | statistická rekalibrace skóre důvěry | dobře prozkoumaná metodika, silný teoretický základ | neřeší potlačení důkazů před vstupem |
| **Bayesovská aktualizace** | formální pravděpodobnostní rámec revize přesvědčení | matematicky přesná, dobře pochopená | předpokládá, že důkazy nejsou potlačeny dřív, než se k aktualizaci dostanou |
| **Samotné adversariální testování** | útoky Red Teamu bez strukturální prevence | účinně odhaluje slabiny | reaktivní, ne preventivní; zranitelnost trvá, dokud ji někdo neotestuje |

Klíčový rozdíl je v tom, že Addiction Recovery je **preventivní** mechanismus, nikoli
**detekční**. Tradiční přístupy odhalují problémy poté, co nastanou. Addiction Recovery
předchází podmínkám, které k problémům vedou, tím, že blokuje jednotlivé operace, které
jsou izolovaně zdánlivě neškodné, ale tvoří stavební kameny epistemického úpadku.

## Osvědčené postupy

1. **Nikdy nevypínat sledování.** Vigilance Monitor musí běžet nepřetržitě. Dočasné
   vypnutí „kvůli výkonu“ nebo „během dávkových operací“ vytváří právě tu mezeru, kterou
   postupná racionalizace využívá. Je-li problémem výkon, upraví se interval kontrol, ne
   samotné sledování.
2. **Kalibrovat podle výsledků Red Teamu.** Prahy detekce se kalibrují podle scénářů
   vyvolaného posunu jako podle referenční pravdy. Příliš necitlivé prahy přehlédnou
   skutečný posun; příliš citlivé vedou k únavě z poplachů a k ignorovaným varováním.
3. **Sledovat vývoj skóre bdělosti.** Skóre bdělosti má časem stoupat (k 1,0). Trvale
   klesající trend ukazuje, že systém hromadí vzorce racionalizace rychleji, než je řeší.
4. **Prošetřovat varování rychle.** Varování E1 nejsou informativní zprávy k přečtení,
   až bude čas. Signalizují raná stadia vzorců racionalizace; odklad dovolí, aby se
   složily do porušení E2 nebo E3.
5. **Uchovávat úplnou historii vzorců.** Historie operací se uchovává nejméně po dobu
   nastaveného okna (výchozí 24 hodin). Předčasné zkrácení historie znemožní detekci
   časových vzorců a fakticky princip oslepí.
6. **Zacházet se všemi změnami grafu přesvědčení stejně.** Žádná operace nesmí obejít
   bránu `AddictionPreservation.check/1`, bez ohledu na úroveň autority zdroje, naléhavost
   operace nebo zdánlivou bezvýznamnost změny. Obcházení podle autority je samo vzorcem
   racionalizace (náhrada autoritou).
7. **Dokumentovat každý zásah.** Když je operace zablokována nebo zastavena, zaznamená se
   důvod s plným kontextem. Vzniká tak institucionální paměť pokusů o racionalizaci, z níž
   vychází budoucí aktualizace taxonomie.

## Časté chyby

- **Brát princip jako metaforu, ne jako strukturu.** Addiction Recovery není filozofický
  postoj ani přání týmové kultury. Je to konkrétní soubor automatických kontrol vynucených
  v kódu, bez ručního obejití. Týmy, které jej chápou jako „nastavení mysli“, a ne jako
  mechanismus vynucení, uvidí, jak slábne s rostoucím organizačním tlakem.
- **Optimalizovat na méně falešných poplachů na úkor detekce.** Ladění prahů ke snížení
  falešně pozitivních výsledků nevyhnutelně snižuje i zachycení skutečných případů.
  Platí asymetrie nákladů: cena falešného poplachu (jedno zbytečné šetření) je mnohem nižší
  než cena přehlédnutého vzorce racionalizace (poškozený graf přesvědčení).
- **Předpokládat, že chytří lidé jsou vůči racionalizaci imunní.** Výzkum motivovaného
  uvažování naznačuje, že vyšší inteligence před zkreslením nechrání; chytří lidé spíše
  umějí sestavit přesvědčivěji znějící zdůvodnění zaujatých závěrů. Automatické vynucení
  je nutné právě proto, že lidský úsudek je bez ohledu na odbornost zranitelný (srov.
  [Kognitivní bias](@/glossary/kognitivni-bias.md)).
- **Zaměňovat epistemickou bdělost s epistemickou paralýzou.** Princip nebrání závěrům ani
  rozhodnutím. Brání závěrům a rozhodnutím postaveným na potlačených důkazech, nafouknuté
  důvěře nebo nevyřešených rozporech. Přesvědčení, které projde všemi kontrolami bdělosti
  s čistým grafem, může přejít k provedení s plným nasazením podle [NM/ND](@/glossary/nm-nd.md)
  (srov. [Paralysis by Analysis](@/glossary/paralysis-by-analysis.md)).
- **Zanedbat časový rozměr.** Jednotlivé operace mohou izolovaně vypadat čistě. Princip
  řeší právě případ, kdy sled jednotlivě čistých operací dohromady vytvoří racionalizaci.
  Bez analýzy časových vzorců ve Vigilance Monitoru tento způsob selhání zůstane
  neodhalen.
- **Brát vynucení jako trest, ne jako ochranu.** E2 BLOCK a E3 HALT nejsou tresty za
  špatné chování, ale bezpečnostní mechanismy, které brání epistemické škodě. Na rámování
  záleží: týmy, které vynucení vnímají jako trest, se mu brání; týmy, které je vnímají jako
  ochranu, je vítají.

## Případy užití

### Případ 1: integrita důkazů při due diligence

Při [due diligence](@/glossary/due-diligence.md) fúzí a akvizic princip brání běžnému
selhání, kdy první zjištění zkreslí další sběr důkazů. Naznačí-li první posouzení, že
cílová firma je málo riziková, přirozeně se dalším potvrzujícím důkazům přikládá větší
váha a protichůdné signály se berou jako anomálie. Vigilance Monitor tento vzorec odhalí
sledováním asymetrického pohybu důvěry: pokud se důvěra soustavně pohybuje jedním směrem
bez odpovídajícího řešení rozporů, vydá varování.

### Případ 2: ověřování zdrojů OSINT

Při práci s [OSINT](@/glossary/osint.md) princip chrání před praním zdrojů – sklonem
považovat více článků odkazujících na tentýž původní zdroj za nezávislá potvrzení.
Sledování skupin nezávislosti vystopuje řetězce původu sítěmi mediálního zesilování
a zajistí, že deset zpravodajských článků citujících tutéž tiskovou zprávu se počítá jako
jeden signál, ne deset (srov. detekční signatura [Kruhové
citace](@/kompendium/detection-signatures/18-network-citation-circularity.md)).

### Případ 3: kalibrace bezpečnostního hodnocení

Systém bezpečnostního hodnocení Prismatic Perimeter (viz [EASM](@/glossary/easm.md))
používá princip k zabránění posunu hodnocení. Hodnocení bezpečnosti firmy musí odrážet
aktuální důkazy se správně uplatněným časovým stárnutím. Detekce vzorce časového úniku
brání tomu, aby hodnocení zůstávalo uměle stabilní, když jeho důkazní základna zestárla
pod práh spolehlivosti.

### Případ 4: integrita uvažování agentů

[Agenti](@/glossary/agent.md) platformy utvářejí přesvědčení vícekrokovými řetězci
uvažování. Princip sleduje tyto řetězce kvůli postupnému nafukování důvěry – případům, kdy
každý krok usuzování mírně zvýší důvěru nad míru podloženou důkazy a výsledný závěr má
dramaticky nafouknutou důvěru. Kontrola jednotlivé operace zachytí každý pokus
o nafouknutí; Vigilance Monitor zachytí případy, kdy se jednotlivě přípustná zvýšení
nasčítají nad kalibrované meze.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Contradiction Preservation* (axiom nejpříměji
chráněný tímto principem), *Cherry Picking* (antivzor výběru důkazů, který princip
blokuje), *Belief Graph* (datová struktura sledovaná Vigilance Monitorem), *Confidence
Scoring* (kvantitativní systém chráněný před nafukováním), *Provenance Mandatory* (axiom
dohledatelnosti) a *Epistemic Robustness* (celková vlastnost systému, kterou princip chrání
před postupnou erozí).

## Související

**Platforma**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – nadřazený epistemický rámec, jehož sedm
  axiomů princip vynucuje nepřetržitou bdělostí.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom proti přesvědčením z jediného
  zdroje, posílený detekcí praní zdrojů.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána, která doplňuje časové
  sledování strukturální obranou.
- [Red Team](@/glossary/red-team.md) a [Blue Team](@/glossary/blue-team.md) – týmy, které
  odolnost principu testují a hájí.
- [QEVE](@/glossary/qeve.md) – ověřovací engine axiomů NABLA, u něhož princip sleduje
  pokusy o obejití.

**Kompendium**

- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – lidská podoba zkreslení, které princip
  blokuje.
- [Osobní audit zkreslení](@/kompendium/self-defense-guides/38-bias-audit-personal.md) –
  bdělost v praxi jednotlivce.
- [Prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) –
  klinický protějšek metafory.
