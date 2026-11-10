+++
title = "Decision Engine (rozhodovací engine)"
weight = 100

description = "Systém založený na pravidlech nebo strojovém učení, který z vícefaktorových vstupů vytváří strukturovaná rozhodnutí s mírou důvěry; v Kompendiu kalibrace důvěry ve zdroje."

[taxonomies]
tags = ["glossary", "ai-systems", "prismatic", "decision-core"]

[extra]
category = "ai-systems"
related_terms = ["decision-core", "trinity-gate", "inference", "risk-score", "signal-plurality"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Definice

**Decision engine** (česky *rozhodovací engine*) je součást systému, která slučuje
vícefaktorové vstupy (důkazy, signály, heuristiky) do strukturovaného rozhodnutí s mírou
důvěry nebo s pořadím priorit. Rozhodovací enginy mohou být založené na pravidlech
(deterministické), pravděpodobnostní nebo postavené na neuronových sítích.

Prismatic Platform, z níž kniha vzešla, zapojuje rozhodovací enginy do ověřovacího procesu
[Trinity Gate](@/glossary/trinity-gate.md) a do systému skórování důvěry. Rozhodovací
engine přitom vyvažuje:

- kvalitu a původ signálu;
- časové stárnutí důkazů;
- řešení konfliktů mezi protichůdnými signály;
- prahy rizika nastavitelné uživatelem.

Jeho technické jádro s uzavřenou kalibrační smyčkou popisuje heslo [Decision
Core](@/glossary/decision-core.md). Pro související pojmy usuzování viz
[Inference](@/glossary/inference.md).

## Původ a kontext pojmu

Pojem pochází z informatiky a z oboru systémů pro podporu rozhodování. Jeho starší podobou
jsou **expertní systémy** sedmdesátých a osmdesátých let, které se snažily zachytit
znalosti odborníků do pravidel typu „jestliže – pak“; známým příkladem z medicíny je systém
MYCIN, vyvíjený na Stanfordu pro doporučování antibiotické léčby. Pozdější vývoj přidal
pravděpodobnostní modely, které místo pevných pravidel počítají s nejistotou, a nakonec
modely strojového učení, jejichž rozhodovací logika se odvozuje z dat.

Souběžně se v psychologii vedl spor, zda je přesnější lidský klinický úsudek, nebo
mechanické (statistické) pravidlo. Paul Meehl ukázal, že jednoduché formální postupy v řadě predikčních úloh dosahují stejné
nebo vyšší přesnosti než klinici (Meehl 1954); pozdější přehledy tento závěr opakovaně
potvrdily (Dawes, Faust a Meehl 1989). Pro Kompendium z toho neplyne, že by engine měl
nahradit odborníka, ale že **pravidla, která lze prohlédnout a změřit**, jsou užitečnou
kontrolou lidského úsudku – zvláště tam, kde na úsudek působí tlak, únava nebo manipulace.

## Mechanismus

Bez ohledu na technologii provádí rozhodovací engine několik kroků, které lze popsat
strukturálně:

1. **Normalizace vstupů** – signály z různých zdrojů se převedou na srovnatelnou podobu
   (typ, čas, původ, síla).
2. **Vážení podle původu** – každý signál dostane váhu podle důvěryhodnosti zdroje, podle
   nezávislosti na ostatních zdrojích a podle stáří.
3. **Řešení konfliktů** – protichůdné signály se nesčítají naslepo; jejich rozpor se
   zaznamená jako nejistota, ne jako průměr.
4. **Porovnání s prahy** – výsledné skóre se porovná s prahy rizika a důvěry, které
   nastavuje uživatel podle oboru a závažnosti rozhodnutí.
5. **Vysvětlení** – kvalitní engine vrací vedle výsledku i zdůvodnění: které signály
   rozhodly, které chyběly a jak blízko prahu výsledek leží.

U pravidlových enginů je každý krok čitelný. U enginů postavených na neuronových sítích
je logika rozhodnutí rozprostřena v naučených parametrech a vysvětlení se musí
rekonstruovat dodatečně; proto platforma pro rozhodnutí, která se mají obhajovat, preferuje
explicitní bodování a kalibraci ([Decision Core](@/glossary/decision-core.md)).

## Jak se projevuje

Ve výstupu platformy se rozhodovací engine projevuje jako **rozhodnutí s mírou důvěry**,
pořadí priorit nebo doporučení s odůvodněním: „zdroj A má nízkou váhu, protože je napojen
na zdroje B a C“, „závěr je hraniční, chybí nezávislé potvrzení“. Uživatel vidí, které
signály převážily, a může je zpochybnit. Typickým místem použití je prověrka v rámci
[due diligence](@/glossary/due-diligence.md), hodnocení [OSINT](@/glossary/osint.md)
zdrojů a ověřovací brána [Trinity Gate](@/glossary/trinity-gate.md).

## Odlišení

Rozhodovací engine je obecná role v systému; [Decision Core](@/glossary/decision-core.md) je konkrétní implementace platformy s deterministickým otiskem a kalibrační smyčkou. Od [inference](@/glossary/inference.md) se engine liší tím, že k usuzování z důkazů přidává rozhodovací pravidla, prahy a odpovědnost za výsledek, a od [Risk Score](@/glossary/risk-score.md) tím, že skóre rizika je jen jeden ze vstupů a samo o sobě neříká, co udělat.

Nejdůležitější je odlišení od doporučovacích systémů, s nimiž se rozhodovací enginy často zaměňují. Doporučovací systémy sociálních médií optimalizují zapojení uživatele, ne pravdivost závěru, a Shoshana Zuboff popsala, jak se z předpovídání a ovlivňování chování stal samostatný ekonomický model (Zuboff 2019). Kompendium je proto zmiňuje jako možný zdroj [epistemických bublin](@/glossary/epistemic-bubble.md), nikoli jako nástroj obrany: engine, který hodnotí zdroje, musí být optimalizován na kalibraci, ne na souhlas uživatele.

## Význam pro Kompendium

Mnohá hesla glosáře uvádějí, jak by měl rozhodovací engine zacházet se zdroji, které nesou
stopy manipulace. Jde o popis zásad platformy, nikoli o tvrzení o lidském úsudku; čtenáři
mimo platformu poslouží jako příklad toho, jak lze poznatky knihy převést do pravidel
hodnocení zdrojů:

- **Hodnocení zdrojů.** Vstupy z prostředí se zvýšeným skóre podle [BITE
  modelu](@/glossary/bite-model.md) jsou označeny jako podezřelé co do původu; nepodepsaná
  audiovizuální média z kanálů s nízkou důvěrou mají nižší váhu (viz
  [Deepfake](@/glossary/deepfake.md)).
- **Vzorce odvracení odpovědnosti.** Výpověď se třífázovým podpisem [DARVO](@/glossary/darvo.md)
  má nižší váhu; původní obvinění se tím nezvyšuje, ale přestává se snižovat.
- **Výpovědi traumatizovaných osob.** Výpověď přeživších s [C-PTSD](@/glossary/c-ptsd.md)
  nebo s [disociací](@/glossary/disociace.md) není obsahově méně spolehlivá; její
  fragmentovaná podoba vyžaduje jiné zpracování, ne nižší důvěru.
- **Strukturální rizika.** Vztahy s vysokou závislostí (viz [Betrayal
  trauma](@/glossary/betrayal-trauma.md)) a jednolitá informační strava (viz [Epistemic
  bubble](@/glossary/epistemic-bubble.md)) snižují důvěru v závěry, aniž by se zkoumal
  obsah jednotlivých tvrzení.
- **Delegitimizace.** Náhlé zhroucení reputace dříve důvěryhodných zdrojů se sleduje jako
  možný znak [delegitimizační kampaně](@/glossary/delegitimizace.md), ne jako běžná revize.
- **Zahlcení.** Velký objem slabých, navzájem si odporujících tvrzení (srov. [firehose of
  falsehood](@/glossary/firehose-of-falsehood.md)) se nevyhodnocuje jako silný signál,
  ale jako indikátor možné kampaně; rozhodující je počet nezávislých zdrojů, ne počet
  opakování ([pluralita signálů](@/glossary/signal-plurality.md)).

Podrobně tyto zásady rozvádějí stránky [Decision Engine: kalibrace
EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) a [DD engine: vážení
zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md); vztah knihy
k enginu vysvětluje kapitola [Vztah k Decision
Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md).

Asymetrie u výpovědí traumatizovaných osob je pro knihu zásadní. Kdyby engine považoval
fragmentovanou, časově nesouvislou nebo emočně zabarvenou výpověď za méně spolehlivou,
opakoval by v technické podobě [testimoniální
nespravedlnost](@/glossary/testimonialni-nespravedlnost.md), kterou Kompendium popisuje
jako jeden z mechanismů umlčování obětí.

Obecný příklad (kompozit): při prověrce organizace se objeví dvě skupiny podkladů. První
tvoří desítky shodně formulovaných příspěvků, které zpochybňují bývalou zaměstnankyni;
druhou její vlastní, místy nesouvislá a časově přeskakující výpověď a dva nezávislé
dokumenty. Engine postavený na počtu zmínek by dal za pravdu první skupině. Engine řízený
zásadami knihy zjistí, že příspěvky pocházejí z několika málo propojených účtů, a jejich
váhu sníží; výpověď nezpracuje jako méně spolehlivou kvůli formě, ale označí ji k ověření
proti nezávislým dokumentům. Výsledkem je hypotéza s vyznačenou nejistotou a s doporučením,
co ověřit, ne rozsudek nad osobou.

## Meze a obranné použití

Rozhodovací engine nenahrazuje klinický ani soudní úsudek. Jeho výstupy jsou hypotézy s mírou důvěry; u otázek, které se týkají duševního zdraví nebo bezpečí konkrétní osoby, mají platit cesty k odborné pomoci, nikoli automatizované závěry. Meehlova zjištění o síle formálních pravidel se týkají opakovaných predikčních úloh s měřitelným výsledkem (Meehl 1954), ne jedinečných rozhodnutí o lidech, kde chybí srovnatelné případy.

Engine je také jen tak dobrý jako jeho data. Koordinovaná kampaň, která vytvoří zdání nezávislých zdrojů, může jeho vážení obejít, a proto se nezávislost zdrojů ověřuje, ne předpokládá. Druhým rizikem je automatizační zkreslení: lidé mají sklon přebírat výstup stroje bez kontroly a přehlížet informace, které mu odporují (Parasuraman a Riley 1997). Výstup enginu má být podnětem k ověření, ne jeho náhradou. Třetím rizikem jsou skryté hodnoty – volba prahů a vah je hodnotové rozhodnutí, které musí být zapsané a přezkoumatelné, jinak se z „objektivního“ enginu stává nástroj neviditelné moci.

Obranně lze principy enginu použít i bez softwaru: zapsat si zdroje tvrzení, ověřit jejich nezávislost, oddělit rozpor od průměru a uvést, jak jistý si úsudkem jsem a proč. Kahneman, Sibony a Sunstein doporučují právě takové strukturované postupy jako „hygienu rozhodování“, která snižuje šum v lidském úsudku (Kahneman, Sibony a Sunstein 2021).

## Literatura

- Meehl, P. E. (1954). *Clinical versus Statistical Prediction: A Theoretical Analysis and
  a Review of the Evidence*. University of Minnesota Press.
- Parasuraman, R., & Riley, V. (1997). Humans and automation: Use, misuse, disuse, abuse. *Human Factors*, 39(2).
- Shortliffe, E. H. (1976). *Computer-Based Medical Consultations: MYCIN*. Elsevier.
- Dawes, R. M., Faust, D., & Meehl, P. E. (1989). Clinical versus actuarial judgment.
  *Science*, 243.
- Kahneman, D., Sibony, O., & Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment*.
  Little, Brown Spark.
- Zuboff, S. (2019). *The Age of Surveillance Capitalism*. PublicAffairs.

## Související

**Platforma**

- [Decision Core](@/glossary/decision-core.md) – kalibrační jádro rozhodovacího procesu.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací proces s rozhodovacími enginy.
- [Inference](@/glossary/inference.md) – usuzování z důkazů.
- [Risk Score](@/glossary/risk-score.md) – skóre rizika jako vstup rozhodnutí.

**Kompendium**

- [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – jak kniha
  s enginem souvisí.
- [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md)
  – kalibrace důvěry s ohledem na techniky EA.
- [DD engine: vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md)
  – jak se váží zdroje se stopami manipulace.
- [Pluralita signálů](@/glossary/signal-plurality.md) – nezávislost zdrojů jako základ
  důvěry.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – chyba, které
  se engine musí vyhnout u výpovědí obětí.
- [Glosář](@/glossary/_index.md) – rejstřík hesel.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: decision-engine](@/kompendium/glossary-bridges/bridge-decision-engine.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
