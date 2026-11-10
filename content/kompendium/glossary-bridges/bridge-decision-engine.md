+++
title = "Bridge: Decision Engine (rozhodovací engine)"
description = "Most mezi heslem Decision Engine a knihou: slučování signálů do kalibrovaného úsudku, automatizační zkreslení, skryté hodnoty ve vahách a ochrana výpovědí traumatizovaných lidí."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "decision-engine", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["decision-engine", "decision-core", "risk-score", "signal-plurality", "testimonialni-nespravedlnost", "color-teams"]
glossary_target = "decision-engine"
toc = false
+++

# Bridge: Decision Engine (rozhodovací engine)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Decision engine](@/glossary/decision-engine.md) (rozhodovací engine) je součást systému, která slučuje
vícefaktorové vstupy – důkazy, signály a heuristiky – do strukturovaného rozhodnutí s mírou důvěry nebo
s pořadím priorit. Může být postaven na pravidlech, na pravděpodobnostních modelech nebo na strojovém
učení. Na platformě, z níž Kompendium vzešlo, slučuje rozhodovací engine signály agentů do kalibrovaného
a vysvětlitelného úsudku; jeho jádro popisuje heslo [Decision Core](@/glossary/decision-core.md) a jeho
číselný výstup heslo [Risk Score](@/glossary/risk-score.md).

Spor o to, zda formální pravidla rozhodují lépe než lidský úsudek, otevřel Meehl (1954): u opakovaných
predikčních úloh s měřitelným výsledkem vycházela jednoduchá statistická pravidla často lépe než
klinický odhad. Dawes (1979) ukázal, že i „nedokonalé“ lineární modely s jednoduchými vahami bývají
robustní. Kniha z této tradice přebírá důraz na výslovná pravidla a kalibraci, ale zdůrazňuje i její
meze, k nimž se most vrací níže.

## Rozhodovací engine očima knihy

Kniha s rozhodovacím enginem zachází ve dvou rovinách. První je **operacionalizace taxonomie**: kapitola
[Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/vztah-k-decision-engine.md) popisuje, jak
se poznatky o technikách EA převádějí do pravidel hodnocení zdrojů – na hypotézy, kalibrovanou důvěru a
kritéria, která by hypotézu vyvrátila. Druhou rovinou je **engine jako model lidského úsudku**: co
engine dělá výslovně (zapisuje zdroje, ověřuje jejich nezávislost, vyznačuje nejistotu), může člověk
dělat jako vědomou disciplínu.

Kalibrace znamená, že vyjádřená jistota odpovídá četnosti, s jakou se závěr ukáže jako správný. Brier
(1950) navrhl míru, jíž se kalibrace pravděpodobnostních předpovědí hodnotí dodnes, a Kent (1964)
upozornil, že slovní vyjádření jistoty („pravděpodobně“, „nelze vyloučit“) čtou různí lidé velmi
rozdílně. Pro knihu je kalibrace obrannou dovedností: manipulace často nepůsobí tím, že člověku vnutí
nepravdu, ale tím, že mu rozladí cit pro to, jak moc si má být čímkoli jistý.

Nejdůležitější zásadou, kterou kniha do enginu vnáší, je ochrana výpovědí traumatizovaných osob.
Fragmentovaná, časově nesouvislá nebo emočně zabarvená výpověď není méně pravdivá; vyžaduje jiné
zpracování, ne nižší váhu. Engine, který by formu zaměňoval za spolehlivost, by v technické podobě
opakoval [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md), jak ji popsala
Fricker (2007): přisouzení menší důvěryhodnosti mluvčímu z důvodů, které s pravdivostí nesouvisejí.

## Kde se pojem v knize vyskytuje

Kalibraci důvěry a vysvětlitelnost rozhodnutí o technikách EA popisuje stránka
[Decision Engine a EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md); vážení zdrojů
při prověrkách protistran a matici rozporů stránka
[DD Engine a EA](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md). Aplikaci v [due diligence](@/glossary/due-diligence.md)
– skóre rizika, šum v úsudku, automatizační zkreslení a právo na lidské posouzení – rozebírá kapitola
[Decision Engine Kalibrace v DD](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md).

Rizika automatizovaného rozhodování o lidech popisuje oddíl technik digitálního věku, zejména
[EA-9.6.1 Algoritmické zkreslení rozhodování](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md)
a [EA-9.6.2 Praní úsudku přes AI](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md), kde se
lidské rozhodnutí skryje za výstup stroje, aby se vyhnulo odpovědnosti. Lidskou obdobu kalibrace
rozvíjí detekční stránka [Epistemická kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md).

## Od pojmu k praxi

### Rozpoznání

Kniha upozorňuje na tři vzorce, které ukazují, že rozhodovací engine – technický nebo lidský – selhává.
Prvním je **automatizační zkreslení**: Skitka, Mosier a Burdick (1999) experimentálně doložili, že lidé
s automatizovanou pomůckou přehlížejí informace, které jí odporují, a přebírají její chybná doporučení.
Druhým je **počítání opakování místo zdrojů**: velký objem shodně formulovaných tvrzení z propojených
účtů vypadá jako silný signál, ačkoli jde o jeden zdroj. Třetím jsou **skryté hodnoty ve vahách**:
O'Neil (2016) a Eubanks (2018) popsali, jak modely nasazené ve veřejné správě a ve finančnictví
přenášejí hodnotová rozhodnutí do čísel, která pak nikdo nezpochybňuje.

### Obrana

Obranou je, aby každý výstup enginu byl hypotézou s vyznačenou nejistotou a s uvedením, co by ji
vyvrátilo; aby váhy a prahy byly zapsány a přezkoumatelné; a aby u rozhodnutí o lidech existovala cesta
k lidskému posouzení. Evropské právo ochrany osobních údajů to vyjadřuje v nařízení (EU) 2016/679 (GDPR),
jehož článek 22 omezuje rozhodování založené výhradně na automatizovaném zpracování. Kahneman, Sibony a
Sunstein (2021) doporučují pro lidský úsudek obdobnou „hygienu rozhodování“: rozložit úsudek na
nezávislé dílčí posouzení a sloučit je až nakonec.

### Náprava

Když se zjistí, že rozhodnutí o člověku stálo na chybném nebo zmanipulovaném vstupu, má náprava tři
části: opravit rozhodnutí, opravit vstup a zjistit, proč kontrola selhala. Kapitola
[Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) popisuje,
jak vést záznam, který takovou revizi umožní. Pro zasaženého člověka je podstatné, aby se oprava
neomezila na tichou změnu skóre, ale aby se dozvěděl, co se stalo a proč.

### Rámec pro profesionály

Klinik pracuje s rozhodovacími pomůckami nejčastěji v podobě screeningových nástrojů a škál. Swets,
Dawes a Monahan (2000) ukázali, že u diagnostických rozhodnutí lze kvalitu zlepšit výslovnou volbou
prahu podle toho, jak vážné jsou falešně pozitivní a falešně negativní chyby; volba prahu je přitom
hodnotové rozhodnutí, ne technický detail. Kniha proto u svých nástrojů zdůrazňuje, že skóre je
podnětem k rozhovoru, ne diagnózou – viz
[Screeningové instrumenty pro EA](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md).
Pro soudní znalce platí obdobně, že výstup nástroje patří do posudku spolu s jeho mezemi a s tím, jak
by závěr vypadal při jiném prahu.

## Odlišení od příbuzných pojmů

Rozhodovací engine je třeba odlišit od [Decision Core](@/glossary/decision-core.md), které je jeho
výpočetním jádrem, a od [Risk Score](@/glossary/risk-score.md), které je jen jedním z jeho výstupů.
Od expertního systému v užším smyslu se liší tím, že nemusí reprezentovat znalost experta, ale může
slučovat signály statisticky. Od lidského úsudku se neliší kvalitou per se, ale tím, že jeho pravidla
lze zapsat – a proto i přezkoumat, pokud jsou zapsána.

## Časté omyly

Prvním omylem je domněnka, že číselný výstup je objektivní. Číslo je výsledkem voleb, které někdo
učinil. Druhým omylem je přenášet Meehlova zjištění na jedinečná rozhodnutí o lidech, kde chybí
srovnatelné případy a měřitelný výsledek. Třetím omylem je opačná krajnost – odmítnout formální
nástroje úplně; i lidský úsudek je zatížen šumem a výslovná pravidla ho mohou zpřesnit.

## Příklad (anonymizovaný kompozit)

Personální oddělení středně velké firmy používá nástroj, který hodnotí uchazeče podle veřejné
stopy na internetu. Uchazečka dostane nízké skóre kvůli desítkám negativních příspěvků. Personalistka,
která zná riziko počítání opakování, si příspěvky projde a zjistí, že pocházejí ze čtyř propojených
účtů a vznikly během jednoho týdne po jejím veřejném vystoupení. Skóre označí jako nespolehlivé, firma
uchazečku pozve k pohovoru a do nástroje doplní pravidlo, které zohledňuje nezávislost zdrojů.

## Meze a otevřené otázky

Rozhodovací engine nenahrazuje klinický ani soudní úsudek a kniha ho tak ani nepoužívá. Otevřená
zůstává otázka, jak vysvětlit rozhodnutí modelu, jehož vnitřní pravidla nejsou lidsky čitelná, a jak
zabránit tomu, aby koordinovaná kampaň vytvořila zdání nezávislých zdrojů. Druhou otázkou je, kdo
odpovídá za hodnotová rozhodnutí skrytá ve vahách, když je model převzat od dodavatele.

## Literatura

- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability. *Monthly Weather Review*, 78(1), 1–3.
- Dawes, R. M. (1979). The robust beauty of improper linear models in decision making. *American Psychologist*, 34(7), 571–582.
- Eubanks, V. (2018). *Automating Inequality*. St. Martin's Press.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Kahneman, D., Sibony, O., & Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment*. Little, Brown Spark.
- Kent, S. (1964). Words of estimative probability. *Studies in Intelligence*, 8(4), 49–65.
- Meehl, P. E. (1954). *Clinical versus Statistical Prediction*. University of Minnesota Press.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.
- Skitka, L. J., Mosier, K. L., & Burdick, M. (1999). Does automation bias decision-making? *International Journal of Human-Computer Studies*, 51(5), 991–1006.
- Swets, J. A., Dawes, R. M., & Monahan, J. (2000). Psychological science can improve diagnostic decisions. *Psychological Science in the Public Interest*, 1(1), 1–26.

## Související

**Glosář**

- [Decision Engine](@/glossary/decision-engine.md) – heslo, které most propojuje.
- [Risk Score](@/glossary/risk-score.md) – číselný výstup enginu.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – riziko, před nímž engine chrání výpovědi.
- [Signal Plurality](@/glossary/signal-plurality.md) – počet zdrojů místo počtu opakování.

**Kniha**

- [Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/vztah-k-decision-engine.md) – operacionalizace taxonomie.
- [Decision Engine a EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) – kalibrace důvěry.
- [EA-9.6.2 Praní úsudku přes AI](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – odpovědnost skrytá za strojem.
- [Epistemická kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md) – lidská obdoba kalibrace.

**Sesterské mosty**

- [Bridge: Color Teams](@/kompendium/glossary-bridges/bridge-color-teams.md) – adversariální test rozhodování.
- [Bridge: Intelligence fusion](@/kompendium/glossary-bridges/bridge-intelligence-fusion.md) – slučování zdrojů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Decision Engine (rozhodovací engine)](@/glossary/decision-engine.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
