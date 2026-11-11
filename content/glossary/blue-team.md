+++
title = "Blue Team"
weight = 20
description = "Tým epistemické obrany: slučování signálů, detekce posunu a strukturované důkazy místo výstrah."

[taxonomies]
tags = ["glossary", "security"]

[extra]
category = "security"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "advanced"
technical_level = "expert"
domain_category = "Security Operations"
related_concepts = ["epistemic defense", "signal aggregation", "drift detection", "evidence synthesis", "defensive posture", "adversarial-defensive loop", "paraconsistent reasoning"]
implementation_status = "production"
authority_level = "L3-strategic"
difficulty_rating = "advanced"
prerequisites = ["agent"]
learning_path = ["security-fundamentals", "epistemic-reasoning", "blue-team-operations", "defensive-posture-assessment"]
interactive_demos = ["/security"]
code_examples = true
external_resources = ["https://hexdocs.pm/elixir/processes.html", "https://erlang.org/doc/design_principles/des_princ.html"]
version_introduced = "gen-8"
stability_level = "stable"
testing_scenarios = ["drift-detection-accuracy", "signal-aggregation-completeness", "evidence-synthesis-quality", "defensive-posture-validation"]
related_terms = ["red-team", "purple-team", "agent"]
date_modified = "2026-11-10"
+++

## Definice

**Blue Team** je tým čtyř specializovaných [agentů](@/glossary/agent.md) zaměřených na
epistemickou obranu prostřednictvím syntézy důkazů. V tradiční kybernetické bezpečnosti
brání blue team sítě proti útokům; epistemický Blue Team brání **epistemickou integritu**
znalostních systémů – stará se o to, aby přesvědčení byla dobře doložena, signály nebyly
poškozeny a uvažování systému se neodchýlilo od ověřeného výchozího stavu.

Zásadní rozdíl mezi epistemickým a běžným blue teamem je v typu výstupu. Běžný
blue team vytváří **výstrahy**: „zjištěno podezřelé přihlášení“, „nalezen podpis malwaru“,
„pozorován neobvyklý provoz“. Epistemický Blue Team vytváří **strukturované důkazy**:
zdokumentovaná pozorování s původem, mírou důvěry, souladem s [pluralitou
signálů](@/glossary/intelligence-fusion.md) a výslovnou kvantifikací nejistoty.
Výstrahy jsou pomíjivé a slouží k okamžité akci; důkazy jsou trvalé a lze je analyzovat.

Výstraha „zjištěn posun“ je jediný signál, který
může, ale nemusí vyžadovat akci. Strukturovaný důkazní artefakt, který posun dokumentuje,
přináší více nezávislých měření, zachovává protichůdná pozorování a vede své uvažování zpět
k surové telemetrii, je tvrzením o vědění, které lze ověřit, zpochybnit, zpřesnit
a prostřednictvím [Purple Teamu](@/glossary/purple-team.md) sloučit s jinými důkazy.

**Vztah ke knize:** zásady Blue Teamu – víc nezávislých zdrojů pro každé tvrzení, zachování
rozporů, sledování postupného posunu pod prahem pozornosti – jsou strojovou obdobou obrany, kterou kniha doporučuje lidem
(viz [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
a [Detekční signatury](@/kompendium/detection-signatures/_index.md)).

## Čtyři agenti Blue Teamu

Blue Team působí pod velením jediného strategického velitele L3 se třemi provozními
specialisty L2. Každý agent má samostatnou doménovou odpovědnost a dohromady poskytují
komplexní obranné pokrytí.

### blue-commander (L3 strategický velitel)

Blue-commander řídí všechny operace Blue Teamu. Slučuje důkazy od tří specialistů do
jednotného hodnocení obranného postoje, určuje priority šetření a předává důkazy [Purple
Teamu](@/glossary/purple-team.md) k syntéze s adversariálními zjištěními [Red
Teamu](@/glossary/red-team.md).

| Atribut | Hodnota |
|-----------|-------|
| **Klasifikace** | L3 strategický velitel |
| **Oprávnění** | plná koordinace Blue Teamu, syntéza důkazů, hlášení Purple Teamu |
| **Vstupy** | důkazní zprávy specialistů, zjištění Red Teamu (přes Purple), telemetrie platformy |
| **Výstupy** | jednotný obranný postoj, pokyny k šetření, důkazní balíčky pro Purple |

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
posunu ve všech aplikacích umbrella projektu a odhaluje postupné změny,
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

### blue-signal-aggregator (L2 Operational Specialist)

Blue-signal-aggregator koreluje signály napříč doménami, vynucuje [pluralitu
signálů](@/glossary/intelligence-fusion.md) (nejméně 2 nezávislé signály na každé
přesvědčení) a vytváří syntetizované důkazy z více zdrojů.

| Atribut | Hodnota |
|-----------|-------|
| **Klasifikace** | L2 Operational Specialist |
| **Oprávnění** | korelace signálů napříč doménami, přístup k telemetrii všech domén jen pro čtení |
| **Hlavní funkce** | vynutit pluralitu signálů, korelovat nezávislé signály, vytvářet syntetizované důkazy |
| **Výstup** | balíčky korelovaných signálů s osvědčením plurality |

Signal-aggregator odpovídá u každého zjištění Blue Teamu na zásadní otázku: **Opírá se toto
pozorování alespoň o dva nezávislé zdroje?** Jediné neobvyklé měření může být šum senzoru.
Dvě nezávislá měření téže anomálie z různých zdrojů jsou signál.

Sledování nezávislosti signálů vyžaduje porozumět korelaci zdrojů:

| Kombinace zdrojů | Nezávislost | Zdůvodnění |
|-------------------|--------------|-----------|
| dva skeny týmž skenerem | nízká | stejná infrastruktura i metodika, jiný čas |
| sken portů + banner služby | střední | stejný cíl, jiný typ pozorování |
| telemetrická metrika + záznam v logu | vysoká | jiné sběrné systémy, jiné typy dat |

## Hodnocení obranného postoje

Hlavním výstupem Blue Teamu je hodnocení obranného postoje (DPA), strukturovaný důkazní
dokument, který zachycuje aktuální stav epistemické obrany. DPA není dashboard ani
metrika – je to formální důkazní artefakt.

| Oddíl | Obsah | Požadovaná důvěra |
|---------|---------|----------------------|
| **stav integrity** | zdraví grafu přesvědčení, doložení přesvědčení původem | ≥ 0,90 |
| **aktivní trendy posunu** | analýza posunu podle rozměrů ve všech aplikacích | ≥ 0,80 |
| **otevřené rozpory** | nevyřešené protichůdné důkazy, které vyžadují syntézu | nepoužije se (rozpory se zachovávají, neřeší) |
| **mezery v důkazech** | oblasti, kde není splněna pluralita signálů | nepoužije se (mezery se dokumentují, nevyplňují) |
| **postoj k hrozbám** | hodnocení se zohledněním zjištění Red Teamu | ≥ 0,85 |
| **doporučení** | prioritizované kroky k posílení obrany | ≥ 0,80 |

DPA vzniká v pravidelném rytmu a na vyžádání při významných událostech (zjištění Red Teamu,
neúspěšné uzavření v Purple Teamu, aktualizace platformy). Každé DPA je verzované, opatřené
časovým razítkem a uložené s úplným původem, takže lze sledovat vývoj v čase.

## Syntéza důkazů a generování výstrah

| Hledisko | Obrana založená na výstrahách | Obrana založená na důkazech (Blue Team) |
|-----------|--------------------|------------------------------------|
| **Výstup** | „Anomálie zjištěna ve 14:32“ | strukturovaný důkazní artefakt s řetězcem původu |
| **Důvěra** | binární (výstraha, nebo nic) | spojitá (0,0–1,0 s kvantifikací nejistoty) |
| **Práce s rozpory** | výstrahy si mohou odporovat bez řešení | rozpory se zachovávají, anotují a předávají Purple |
| **Použitelnost** | vyžaduje lidský výklad | Purple je může strojově zpracovat k syntéze |
| **Trvalost** | obvykle pomíjivé (výstraha se spustí a potvrdí) | trvalé důkazy vstupují do grafu přesvědčení |
| **Skládání** | jednotlivé výstrahy, obtížně kombinovatelné | důkazní balíčky se skládají do větších hodnocení |

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
4. **důkazy úplné** – důkazy Red i Blue mají doložený původ a splňují pluralitu signálů.

Příspěvek Blue Teamu je zde zásadní: musí vytvořit důkaz, který není jen reaktivní („výstrahu
jsme opravili“), ale strukturální („dvěma a více nezávislými signály jsme ověřili, že obrana
je účinná, s důvěrou 0,92, a řetězec důkazů vede od původního zjištění Red Teamu přes
implementaci obrany k validačnímu měření“).

## Bezpečnostní protokoly

| Protokol | Vynucení |
|----------|-------------|
| **operace jen pro čtení** | agenti Blue mají ke stavu platformy přístup jen pro čtení; pozorují a měří, nikdy nemění |
| **syntetická data** | veškeré testování používá syntetická data; skutečné osobní údaje ani produkční data do analýzy nevstupují |
| **etické kontroly** | automatická validace každých 10–15 sekund u všech agentů Blue |
| **auditní logování** | každá operace se zapisuje do neměnné auditní stopy |
| **hranice rozsahu** | agenti Blue nemohou eskalovat do útočných operací; rozsah je přísně obranný |

## Osvědčené postupy

1. **Ukotvit každé zjištění v důkazních požadavcích.** Důkaz, který nemá doložený původ
   nebo nesplňuje pluralitu signálů, jde do karantény. Tato kázeň brání běžnému selhání,
   kdy naléhavost přebije epistemickou přísnost.
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

### Hodnocení spolehlivosti zdrojů OSINT

Když zdroje [OSINT](@/glossary/osint.md) poskytují o téže entitě protichůdná data, Blue Team
rozpor zachová a vytvoří strukturovaný důkaz, který dokumentuje, které zdroje se rozcházejí,
jakou důvěru má každý zdroj a jaký může mít rozpor dopad na navazující hodnocení.

### Sledování hranice autentizace

Auth-sentinel sleduje vzorce autentizace na koncových bodech REST API a LiveView. Když se
objeví neobvyklé vzorce – nárůst neúspěšných přihlášení z nového rozsahu IP adres, nečekaná
selhání validace tokenů, znaky fixace relace –, vytvoří důkazní artefakty pro hodnocení
obranného postoje.

### Sledování dodavatelského řetězce závislostí

Drift-detector sleduje verze závislostí ve všech aplikacích umbrella projektu. Když závislost vydá bezpečnostní upozornění, detektor vytvoří důkaz o tom, kterých
aplikací se týká, jak je závažné a jaký má dopad na stromy supervize OTP. Důkaz umožňuje
nápravu podle priorit.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Epistemic Robustness* (míra odolnosti obrany vůči
epistemickému útoku) a *Confidence Scoring* (kvantifikace nejistoty důkazů).

## Související

- [Red Team](@/glossary/red-team.md) – adversariální protějšek, proti jehož zjištěním se Blue
  brání.
- [Purple Team](@/glossary/purple-team.md) – syntetizační uzel smyčky Red–Blue.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: blue-team](@/kompendium/glossary-bridges/bridge-blue-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
