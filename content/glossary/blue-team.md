+++
title = "Blue Team"
weight = 20
description = "Tým epistemické obrany v Color Teams Prismatic Platform: slučování signálů, detekce posunu a strukturované důkazy místo výstrah, v souladu s axiomy NABLA."

[taxonomies]
tags = ["glossary", "security", "color-teams", "nabla", "prismatic"]

[extra]
category = "security"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "advanced"
quality_score = 95
technical_level = "expert"
domain_category = "Security Operations"
related_concepts = ["epistemic defense", "signal aggregation", "drift detection", "evidence synthesis", "defensive posture", "adversarial-defensive loop", "paraconsistent reasoning"]
implementation_status = "production"
authority_level = "L3-strategic"
difficulty_rating = "advanced"
prerequisites = ["color-teams", "nabla-infinity", "signal-plurality", "agent"]
learning_path = ["security-fundamentals", "color-team-operations", "epistemic-reasoning", "blue-team-operations", "defensive-posture-assessment"]
interactive_demos = ["/security", "/color-teams"]
code_examples = true
external_resources = ["https://hexdocs.pm/elixir/processes.html", "https://erlang.org/doc/design_principles/des_princ.html"]
version_introduced = "gen-8"
stability_level = "stable"
testing_scenarios = ["drift-detection-accuracy", "signal-aggregation-completeness", "evidence-synthesis-quality", "defensive-posture-validation"]
related_terms = ["color-teams", "red-team", "purple-team", "nabla-infinity", "signal-plurality", "white-team", "black-team", "gray-team", "blue-team", "contradiction-preservation", "epistemic-robustness", "confidence-scoring", "drift-detection"]
date_modified = "2026-11-10"
+++

## Definice

**Blue Team** je obranný tým v rámci [Color Teams](@/glossary/color-teams.md), složený ze
čtyř specializovaných [agentů](@/glossary/agent.md) zaměřených na epistemickou obranu
prostřednictvím syntézy důkazů. V tradiční kybernetické bezpečnosti brání blue team sítě
proti útokům. Na Prismatic Platform brání Blue Team **epistemickou integritu** znalostních
systémů platformy – stará se o to, aby přesvědčení byla dobře doložena, signály nebyly
poškozeny a uvažování platformy se neodchýlilo od ověřeného výchozího stavu.

Zásadní rozdíl mezi Blue Teamem platformy a běžnými blue teamy je v typu výstupu. Běžný
blue team vytváří **výstrahy**: „zjištěno podezřelé přihlášení“, „nalezen podpis malwaru“,
„pozorován neobvyklý provoz“. Blue Team platformy vytváří **strukturované důkazy**:
zdokumentovaná pozorování s původem, mírou důvěry, souladem s pluralitou signálů (viz
[Signal Plurality](@/glossary/signal-plurality.md)) a výslovnou kvantifikací nejistoty.
Výstrahy jsou pomíjivé a slouží k okamžité akci; důkazy jsou trvalé a lze je analyzovat.

Tento posun od výstrah k důkazům odráží rámec axiomů [NABLA
Infinity](@/glossary/nabla-infinity.md). Výstraha „zjištěn posun“ je jediný signál, který
může, ale nemusí vyžadovat akci. Strukturovaný důkazní artefakt, který posun dokumentuje,
přináší více nezávislých měření, zachovává protichůdná pozorování a vede své uvažování zpět
k surové telemetrii, je tvrzením o vědění, které lze ověřit, zpochybnit, zpřesnit
a prostřednictvím [Purple Teamu](@/glossary/purple-team.md) sloučit s jinými důkazy.

**Vztah ke knize:** Blue Team patří do kontextu platformy, z níž Kompendium vzešlo. Jeho
zásady – víc nezávislých zdrojů pro každé tvrzení, zachování rozporů, sledování postupného
posunu pod prahem pozornosti – jsou strojovou obdobou obrany, kterou kniha doporučuje lidem
(viz [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
a [Detekční signatury](@/kompendium/detection-signatures/_index.md)). Obranu proti technikám
EA na platformě popisuje stránka [Blue Team: obrana proti
EA](@/kompendium/aiad-integration/blue-team-ea-defense.md).

## Čtyři agenti Blue Teamu

Blue Team působí pod velením jediného strategického velitele L3 se třemi provozními
specialisty L2 (viz [Agent Tier](@/glossary/agent-tier.md)). Každý agent má samostatnou
doménovou odpovědnost a dohromady poskytují komplexní obranné pokrytí platformy.

### blue-commander (L3 Strategic Commander)

Blue-commander řídí všechny operace Blue Teamu. Slučuje důkazy od tří specialistů do
jednotného hodnocení obranného postoje, určuje priority šetření a předává důkazy [Purple
Teamu](@/glossary/purple-team.md) k syntéze s adversariálními zjištěními [Red
Teamu](@/glossary/red-team.md).

| Atribut | Hodnota |
|-----------|-------|
| **Klasifikace** | L3 Strategic Commander |
| **Oprávnění** | plná koordinace Blue Teamu, syntéza důkazů, hlášení Purple Teamu |
| **Vstupy** | důkazní zprávy specialistů, zjištění Red Teamu (přes Purple), telemetrie platformy |
| **Výstupy** | jednotný obranný postoj, pokyny k šetření, důkazní balíčky pro Purple |
| **Soulad s NABLA** | vynucuje všech 7 axiomů ve všech důkazních výstupech |

Hlavním výstupem blue-commandera je **hodnocení obranného postoje** (*Defensive Posture
Assessment*) – strukturovaný dokument, který zachycuje, jak Blue Team aktuálně rozumí
epistemickému zdraví platformy. Obsahuje:

- aktuální stav integrity přesvědčení ve všech doménách;
- aktivní trendy posunu (zlepšení, stabilita, zhoršení);
- otevřené rozpory, které vyžadují syntézu Purple Teamem;
- míru důvěry všech obranných závěrů;
- mezery v důkazech, kde je potřeba další šetření.

### blue-auth-sentinel (L2 Operational Specialist)

Blue-auth-sentinel sleduje hranice autentizace a autorizace v celé platformě. Odhaluje pokusy
o eskalaci oprávnění, vzorce neoprávněného přístupu a podmínky, za nichž lze autentizaci
obejít.

| Atribut | Hodnota |
|-----------|-------|
| **Klasifikace** | L2 Operational Specialist |
| **Oprávnění** | sledování hranic autentizace, přístup k platformě jen pro čtení |
| **Oblasti zaměření** | vzorce přihlašování, validace tokenů, vynucení RBAC, integrita relací |
| **Metody detekce** | behaviorální analýza, sledování prahů, porovnávání vzorů |
| **Formát výstupu** | důkazní artefakty s původem v přístupových logech |

Auth-sentinel působí na hranici mezi vnějšími uživateli a vnitřním stavem platformy.
Sleduje:

- **pokusy o autentizaci** – vzorce neúspěšných přihlášení, znaky zkoušení ukradených
  přihlašovacích údajů, detekci útoků hrubou silou;
- **hranice autorizace** – požadavky, které testují meze RBAC, sledy eskalace oprávnění,
  pokusy o záměnu rolí;
- **integritu tokenů** – selhání validace JWT, opakované použití tokenů, znaky fixace relace;
- **hranici API** – vzorce přístupu k REST API, spouštění omezení četnosti, pokusy
  o porušení schématu OpenAPI.

### blue-drift-detector (L2 Operational Specialist)

Blue-drift-detector je specialista Blue Teamu s nejširším záběrem. Sleduje čtyři rozměry
posunu ve všech (v době zápisu 90+) aplikacích umbrella projektu a odhaluje postupné změny,
které jednotlivě leží pod prahem výstrahy, ale dohromady ukazují na systémové zhoršení.

| Rozměr posunu | Co sleduje | Metoda detekce | Podmínka výstrahy |
|-----------------|-----------------|------------------|-----------------|
| **behaviorální** | vzorce volání funkcí, cesty provádění, rozložení výstupů | statistické srovnání s výchozím stavem | posun rozložení > 2 směrodatné odchylky |
| **konfigurační** | konfigurace aplikací, proměnné prostředí, přepínače funkcí | rozdíl proti zapsané konfiguraci | jakákoli neoprávněná nebo nezdokumentovaná změna |
| **závislostní** | verze knihoven, kontrakty vnějších API, datová schémata | sledování verzí, testování kontraktů | zpětně nekompatibilní změny, bezpečnostní upozornění |
| **výkonnostní** | latence odezvy, propustnost, využití zdrojů | analýza časových řad se sezonní úpravou | trvalá odchylka > 20 % od výchozího stavu |

Klíčovým přínosem detektoru je odhalení **posunu pod prahem**: změn, které jsou jednotlivě
příliš malé na spuštění běžné výstrahy, ale časem se nasčítají do významného zhoršení.
Odpovídá to známému přirovnání o „vařené žábě“: postupné zvyšování teploty nikdy nespustí
jednotlivý poplach, a přesto se nakonec stane smrtelným. Stejnou strukturu má mnoho technik
manipulace, které Kompendium popisuje – posun po malých krocích, z nichž žádný nevypadá jako
hranice (srov. [Gaslighting](@/glossary/gaslighting.md)).

```elixir
defmodule PrismaticSecurity.BlueDriftDetector do
  @moduledoc """
  Detects gradual drift across behavioral, configuration,
  dependency, and performance dimensions.
  Produces NABLA-compliant evidence artifacts.
  """

  @drift_dimensions [:behavioral, :configuration, :dependency, :performance]

  @spec detect_drift(app_id(), baseline(), current_state()) ::
          {:ok, [drift_evidence()]} | {:ok, :no_drift}
  def detect_drift(app_id, baseline, current) do
    drift_findings =
      @drift_dimensions
      |> Enum.flat_map(fn dimension ->
        case compare_dimension(dimension, baseline, current) do
          {:drift, evidence} -> [build_evidence(app_id, dimension, evidence)]
          :stable -> []
        end
      end)

    case drift_findings do
      [] -> {:ok, :no_drift}
      findings -> {:ok, findings}
    end
  end

  defp build_evidence(app_id, dimension, raw_evidence) do
    %{
      type: :drift_detection,
      app: app_id,
      dimension: dimension,
      magnitude: raw_evidence.magnitude,
      confidence: compute_confidence(raw_evidence),
      provenance: %{
        detector: "blue-drift-detector",
        baseline_timestamp: raw_evidence.baseline_timestamp,
        current_timestamp: DateTime.utc_now(),
        method: raw_evidence.detection_method,
        raw_data_hash: hash_evidence(raw_evidence)
      },
      signal_count: raw_evidence.signal_count,
      contradictions: raw_evidence.contradictions
    }
  end
end
```
### blue-signal-aggregator (L2 Operational Specialist)

Blue-signal-aggregator koreluje signály napříč doménami, vynucuje [pluralitu
signálů](@/glossary/signal-plurality.md) (nejméně 2 nezávislé signály na každé přesvědčení)
a vytváří syntetizované důkazy z více zdrojů. Je hlavním rozhraním Blue Teamu s rámcem axiomů
[NABLA Infinity](@/glossary/nabla-infinity.md).

| Atribut | Hodnota |
|-----------|-------|
| **Klasifikace** | L2 Operational Specialist |
| **Oprávnění** | korelace signálů napříč doménami, přístup k telemetrii všech domén jen pro čtení |
| **Hlavní funkce** | vynutit pluralitu signálů, korelovat nezávislé signály, vytvářet syntetizované důkazy |
| **Axiomy NABLA** | hlavní vynucovač Signal Plurality a Source Independence |
| **Výstup** | balíčky korelovaných signálů s osvědčením plurality |

Signal-aggregator odpovídá u každého zjištění Blue Teamu na zásadní otázku: **Opírá se toto
pozorování alespoň o dva nezávislé zdroje?** Jediné neobvyklé měření může být šum senzoru.
Dvě nezávislá měření téže anomálie z různých zdrojů jsou signál.

Sledování nezávislosti signálů vyžaduje porozumět korelaci zdrojů:

| Kombinace zdrojů | Nezávislost | Zdůvodnění |
|-------------------|--------------|-----------|
| sken [Shodan](@/glossary/shodan.md) + sken [Censys](@/glossary/censys.md) | vysoká | jiná skenovací infrastruktura, jiné metodiky |
| dva skeny Shodan | nízká | stejná infrastruktura i metodika, jiný čas |
| sken portů + banner služby | střední | stejný cíl, jiný typ pozorování |
| telemetrická metrika + záznam v logu | vysoká | jiné sběrné systémy, jiné typy dat |

## Hodnocení obranného postoje

Hlavním výstupem Blue Teamu je hodnocení obranného postoje (DPA), strukturovaný důkazní
dokument, který zachycuje aktuální stav epistemické obrany platformy. DPA není dashboard ani
metrika – je to formální důkazní artefakt, který prochází validací v [Trinity
Gate](@/glossary/trinity-gate.md).

| Oddíl | Obsah | Požadovaná důvěra |
|---------|---------|----------------------|
| **stav integrity** | zdraví grafu přesvědčení, míra souladu s axiomy | ≥ 0,90 |
| **aktivní trendy posunu** | analýza posunu podle rozměrů ve všech aplikacích | ≥ 0,80 |
| **otevřené rozpory** | nevyřešené protichůdné důkazy, které vyžadují syntézu | nepoužije se (rozpory se zachovávají, neřeší) |
| **mezery v důkazech** | oblasti, kde není splněna pluralita signálů | nepoužije se (mezery se dokumentují, nevyplňují) |
| **postoj k hrozbám** | hodnocení se zohledněním zjištění Red Teamu | ≥ 0,85 |
| **doporučení** | prioritizované kroky k posílení obrany | ≥ 0,80 |

DPA vzniká v pravidelném rytmu a na vyžádání při významných událostech (zjištění Red Teamu,
neúspěšné uzavření v Purple Teamu, aktualizace platformy). Každé DPA je verzované, opatřené
časovým razítkem a uložené s úplným původem, takže lze sledovat vývoj v čase.

## Ukotvení v axiomech NABLA

Tvorba důkazů Blue Teamu je zásadně ukotvena v axiomech [NABLA
Infinity](@/glossary/nabla-infinity.md) (viz [NABLA Axioms](@/glossary/nabla-axioms.md)).
Ukotvení není volitelné – je strukturálně vynuceno datovým modelem důkazů:

| Axiom | Uplatnění v Blue Teamu | Vynucení |
|-------|----------------------|-------------|
| **Signal Plurality** | každé zjištění vyžaduje 2+ nezávislé signály; signal-aggregator pluralitu osvědčuje | TVRDÉ – zjištění z jediného signálu jsou v karanténě, nezveřejňují se |
| **Contradiction Preservation** | když jeden detektor zjistí posun a druhý stabilitu, zachovají se obě pozorování | TVRDÉ – rozpory se opatří závažností a předají Purple |
| **Absence Informative** | sledují se očekávané signály, které chybějí; služba, která by měla vysílat telemetrii, a nevysílá, je sama zjištěním | MĚKKÉ – nepřítomnost se zapíše, spustí se šetření |
| **Time Decay** | důkazy starší než nastavený práh zastarání mají nižší váhu | TVRDÉ – zastaralé důkazy stárnou k neutrální důvěře |
| **Unknown Valid** | když důkazy na určení nestačí, Blue Team hlásí „neznámé“, místo aby hádal | TVRDÉ – vynucená určení jsou zakázána |
| **Source Independence** | signal-aggregator sleduje korelaci zdrojů a snižuje váhu korelovaných pozorování | MĚKKÉ – korelované zdroje se označí, přiloží se hodnocení nezávislosti |
| **Provenance Mandatory** | každý důkazní artefakt lze vystopovat k surové telemetrii přes zdokumentované kroky zpracování | TVRDÉ – důkazy bez původu se odmítají |

## Syntéza důkazů a generování výstrah

| Hledisko | Obrana založená na výstrahách | Obrana založená na důkazech (Blue Team) |
|-----------|--------------------|------------------------------------|
| **Výstup** | „Anomálie zjištěna ve 14:32“ | strukturovaný důkazní artefakt s řetězcem původu |
| **Důvěra** | binární (výstraha, nebo nic) | spojitá (0,0–1,0 s kvantifikací nejistoty) |
| **Práce s rozpory** | výstrahy si mohou odporovat bez řešení | rozpory se zachovávají, anotují a předávají Purple |
| **Použitelnost** | vyžaduje lidský výklad | Purple je může strojově zpracovat k syntéze |
| **Trvalost** | obvykle pomíjivé (výstraha se spustí a potvrdí) | trvalé důkazy vstupují do grafu přesvědčení |
| **Skládání** | jednotlivé výstrahy, obtížně kombinovatelné | důkazní balíčky se skládají do větších hodnocení |
| **Soulad s NABLA** | nepoužije se | povinný – všechny důkazy splňují 7 axiomů |

Tento přístup umožňuje Purple Teamu automatickou syntézu obranných důkazů Blue Teamu
s adversariálními zjištěními Red Teamu, takže smyčka útoku a obrany se uzavírá programově,
ne ručním procházením logů výstrah.

## Smyčka Red–Blue přes Purple

Blue Team s [Red Teamem](@/glossary/red-team.md) nekomunikuje přímo. Veškerá interakce Red–Blue
prochází [Purple Teamem](@/glossary/purple-team.md), který je syntetizačním uzlem smyčky útoku
a obrany:

```
Red Team                    Purple Team                    Blue Team
(adversarial)              (synthesis)                   (defensive)

  Scenarios ──────>  purple-mapper ───────> Defense improvements
  Findings ──────>  purple-closure ────────> Posture adjustments
                         ^                         |
                         |                         v
                   purple-regression ────── Evidence reports
                         |
                         v
                   Closure decision
                   (all 4 conditions)
```
Analýza uzavření v Purple Teamu vyžaduje před uzavřením cyklu Red–Blue čtyři podmínky:

1. **útok reprodukován** – scénář Red Teamu byl reprodukován v sandboxu;
2. **obrana ověřena** – protiopatření Blue Teamu řeší konkrétní útočný vektor;
3. **regrese otestována** – obrana nevnáší nové zranitelnosti;
4. **důkazy úplné** – důkazy Red i Blue splňují axiomy NABLA.

Příspěvek Blue Teamu je zde zásadní: musí vytvořit důkaz, který není jen reaktivní („výstrahu
jsme opravili“), ale strukturální („dvěma a více nezávislými signály jsme ověřili, že obrana
je účinná, s důvěrou 0,92, a řetězec důkazů vede od původního zjištění Red Teamu přes
implementaci obrany k validačnímu měření“).

## Ekosystém Color Teams

Blue Team působí v širším ekosystému 20 agentů v 6 [Color Teams](@/glossary/color-teams.md):

| Tým | Role | Interakce s Blue |
|------|------|----------------------|
| **[Gray Team](@/glossary/gray-team.md)** | průzkum hranic | odhaluje okrajové případy, které má Blue sledovat |
| **[Red Team](@/glossary/red-team.md)** | adversariální simulace | vytváří útočné scénáře, proti nimž se Blue brání |
| **Blue Team** | epistemická obrana | – |
| **[Purple Team](@/glossary/purple-team.md)** | syntéza | uzavírá smyčku Red–Blue, ověřuje obranu Blue |
| **[White Team](@/glossary/white-team.md)** | konstruktivní ověřování | formálně ověřuje důkazy a obranu Blue |
| **[Black Team](@/glossary/black-team.md)** | teoretické modelování hrozeb | abstraktní modely informují povědomí Blue o hrozbách |

Tok signálů má určenou cestu: Gray odhaluje hraniční podmínky, z nichž se mohou stát scénáře
Red. Red vytváří adversariální zjištění. Purple je slučuje s obrannými důkazy Blue. White
formálně ověřuje výsledná tvrzení o obraně. Black poskytuje teoretické modely, které
informují tvorbu útoků Red i návrh obrany Blue. Blue přijímá signály od všech ostatních týmů
(přes Purple) a vytváří důkazy, které se vracejí do ekosystému.

## Bezpečnostní protokoly

| Protokol | Vynucení |
|----------|-------------|
| **operace jen pro čtení** | agenti Blue mají ke stavu platformy přístup jen pro čtení; pozorují a měří, nikdy nemění |
| **syntetická data** | veškeré testování používá syntetická data; skutečné osobní údaje ani produkční data do analýzy nevstupují |
| **etické kontroly** | automatická validace každých 10–15 sekund u všech agentů Blue |
| **auditní logování** | každá operace se zapisuje do neměnné auditní stopy |
| **hranice rozsahu** | agenti Blue nemohou eskalovat do operací Gray nebo Red; rozsah je přísně obranný |

## Osvědčené postupy

1. **Ukotvit každé zjištění v axiomech NABLA.** Důkazy musí před zveřejněním splnit všech
   sedm axiomů. Důkaz, který nesplní jediný tvrdý axiom, jde do karantény. Tato kázeň brání
   běžnému selhání, kdy naléhavost přebije epistemickou přísnost.
2. **Udržovat nezávislé zdroje signálů pro každý sledovaný rozměr.** Každý kritický rozměr
   má mít alespoň dvě nezávislé cesty pozorování – jiné sběrné systémy, jiné metodiky, jiná
   místa pozorování.
3. **Výslovně zachovávat rozpory.** Když drift-detector a auth-sentinel hodnotí týž jev
   protichůdně, obě hodnocení se v DPA zachovají. Syntézu dělá Purple Team, zachování Blue
   Team.
4. **Vydávat strukturované důkazy, ne výstrahy.** Pokušení zredukovat důkaz pro jednoduchost
   na binární výstrahu je třeba odolat – právě struktura umožňuje strojově zpracovatelnou
   syntézu.
5. **Sledovat posun pod prahem.** Měření pod prahem výstrahy se mohou nasčítat do
   významného zhoršení; odhalit tyto postupné, jednotlivě neviditelné změny je hlavní
   hodnotou detektoru.
6. **Verzovat a označovat časem všechny důkazy.** Každý artefakt nese čas vzniku, výchozí
   stav, s nímž byl srovnán, a verzi detektoru, který jej vytvořil.
7. **Oddělit pozorování od výkladu.** Agenti Blue pozorují a měří, nevykládají a nedoporučují.
   Výklad je odpovědností Purple Teamu. Oddělení brání tomu, aby obranné důkazy zkreslily
   předčasné závěry.

## Časté chyby

1. **Únava z výstrah při příliš citlivé detekci posunu.** Příliš nízké prahy vytvoří záplavu
   slabých zjištění, která zahltí analytiky a zastřou skutečné hrozby. Prahy se kalibrují
   podle historických dat a míry falešných poplachů.
2. **Zjištění z jediného zdroje vydávaná za důkaz.** Takové zjištění nesplňuje požadavek
   plurality signálů. Je třeba odolat tlaku zveřejnit je jako „předběžný důkaz“ – musí být
   výslovně označeno jako neověřené pozorování.
3. **Směšování obrany Blue s útokem Red.** Agenti Blue mají přístup jen pro čtení a přísně
   obranný rozsah. Operace, která mění stav systému nebo simuluje útoky, porušila hranici
   rozsahu a musí být okamžitě zastavena.
4. **Přehlížení časové dynamiky.** Metrika, která se při hodinovém vzorkování zdá stabilní,
   může při minutovém rozlišení ukázat výrazný posun. Frekvence vzorkování má odpovídat
   očekávanému časovému měřítku posunu.
5. **Brát DPA jako metriku na dashboardu.** DPA je formální důkazní artefakt; jeho redukce
   na jediné číslo zahodí strukturovanou informaci, která je pro syntézu cenná.
6. **Neaktualizovat výchozí stav.** Detektor srovnává se zvoleným výchozím stavem; není-li
   po legitimních změnách aktualizován, vznikají falešné poplachy. Je třeba řízený postup
   aktualizace výchozího stavu s auditní stopou.

## Případy užití

### Sledování kvality platformy

Blue Team sleduje posun ve 13 doménách kvality platformy. Když se změní počet varování
kompilace, porušení Credo nebo chyb Dialyzeru, drift-detector změnu zachytí,
signal-aggregator ji dá do souvislosti s nedávnými změnami kódu a blue-commander vytvoří
důkazní balíček pro strážce minimální kvality.

### Hodnocení spolehlivosti zdrojů OSINT

Když zdroje [OSINT](@/glossary/osint.md) poskytují o téže entitě protichůdná data, Blue Team
rozpor zachová a vytvoří strukturovaný důkaz, který dokumentuje, které zdroje se rozcházejí,
jakou důvěru má každý zdroj a jaký může mít rozpor dopad na navazující hodnocení. Důkaz
vstupuje do výpočtu bezpečnostního hodnocení Prismatic Perimeter (viz [EASM](@/glossary/easm.md)).

### Sledování hranice autentizace

Auth-sentinel sleduje vzorce autentizace na koncových bodech REST API a LiveView. Když se
objeví neobvyklé vzorce – nárůst neúspěšných přihlášení z nového rozsahu IP adres, nečekaná
selhání validace tokenů, znaky fixace relace –, vytvoří důkazní artefakty pro hodnocení
obranného postoje.

### Sledování dodavatelského řetězce závislostí

Drift-detector sleduje verze závislostí ve všech (v době zápisu 115) aplikacích umbrella
projektu. Když závislost vydá bezpečnostní upozornění, detektor vytvoří důkaz o tom, kterých
aplikací se týká, jak je závažné a jaký má dopad na stromy supervize OTP. Důkaz umožňuje
nápravu podle priorit.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Contradiction Preservation*, *Provenance Mandatory*,
*Epistemic Robustness* (míra odolnosti obrany vůči epistemickému útoku) a *Confidence
Scoring* (kvantifikace nejistoty důkazů).

## Související

**Color Teams**

- [Red Team](@/glossary/red-team.md) – adversariální protějšek, proti jehož zjištěním se Blue
  brání.
- [Purple Team](@/glossary/purple-team.md) – syntetizační uzel smyčky Red–Blue.
- [White Team](@/glossary/white-team.md) – formální ověřování obrany.
- [Gray Team](@/glossary/gray-team.md) a [Black Team](@/glossary/black-team.md) – průzkum
  hranic a teoretické modely hrozeb.
- [Color Teams](@/glossary/color-teams.md) – přehled všech šesti týmů.

**Platforma a kniha**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec, v němž jsou důkazy
  ukotveny.
- [Signal Plurality](@/glossary/signal-plurality.md) – hlavní axiom, který signal-aggregator
  vynucuje.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána důkazů.
- [Blue Team: obrana proti EA](@/kompendium/aiad-integration/blue-team-ea-defense.md) –
  obrana proti technikám EA na platformě.
