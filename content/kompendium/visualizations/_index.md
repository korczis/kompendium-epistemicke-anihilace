+++
title = "Interaktivní vizualizace"
description = "Klikatelné grafy taxonomie EA odvozené z odkazů a katalogu knihy: rodiny technik, úrovně rizika, sítě vazeb, fáze zotavení, protokoly a didaktické simulace."
weight = 90
sort_by = "weight"
template = "kompendium/section.html"

[extra]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "threejs", "p5js"]
categories = ["academic", "tools"]
section_icon = "📊"
toc = true
+++

# Interaktivní vizualizace taxonomie EA

Tato sekce sdružuje interaktivní grafy, které ukazují strukturu knihy o [epistemické a kognitivní anihilaci](@/glossary/epistemicka-anihilace.md): jak se techniky dělí do rodin, jak je katalog řadí podle rizika, jak na sebe stránky odkazují, jak jsou uspořádány protokoly zotavení a krizové protokoly a kde se v knize potkávají techniky s regiony, signaturami nebo historickými případy. Každý graf je odvozen z odkazů a katalogu knihy: stránky, kódy, rodiny, počty, odkazy i skupiny čte skript při načtení z grafu odkazů (`static/data/graph.json`), z [katalogu technik](@/kompendium/techniques/_index.md) a z osnovy rejstříkových stránek jednotlivých sekcí. Nic z toho, co grafy ukazují, se nepíše ručně, a proto tato stránka neuvádí počty ani seznamy uzlů – zastaraly by s první úpravou knihy. Vazby jsou všude „vazby podle odkazů v knize“, ne empiricky zjištěné souvislosti.

Tři položky (5, 6 a 9) nejsou grafy dat, ale didaktické simulace: modelují jev, o němž kniha píše, a z dat knihy přebírají nanejvýš název a odkaz techniky, kterou ilustrují.

## Jak vizualizace číst

Všechny grafy používají stejný slovník. **Uzel** nebo bod je stránka knihy a klepnutí na něj vede k detailu s odkazem na tuto stránku; žádný uzel není ozdobou bez cíle. **Hrana** mezi dvěma uzly znamená, že mezi jejich stránkami vede v knize odkaz – jedním, nebo oběma směry. Barva kóduje kategorii (rodinu EA, podrodinu, oddíl knihy, fázi podle rejstříku), nikdy pořadí nebo míru. Jacques Bertin ukázal, že barevný tón je vhodný k rozlišení skupin, kdežto pořadí a množství se lépe čtou z polohy a velikosti (Bertin 1967); grafy se toho drží. Kde velikost nese počet, roste plocha bubliny úměrně počtu, ne její poloměr, aby graf nepřeháněl rozdíly – Edward Tufte takové zkreslení nazývá „faktorem lži“ (Tufte 1983).

Interakce sleduje Shneidermanovu zásadu „nejdřív přehled, potom přiblížení a filtr, podrobnosti na vyžádání“ (Shneiderman 1996): graf ukáže celek, klepnutí vybere část a okno pod grafem vypíše stránky s odkazy. Grafy, které vybírají „nejodkazovanější“ stránky, řadí podle počtu stránek knihy, které na danou stránku odkazují. Počet příchozích odkazů je v teorii sítí obvyklým, ale hrubým ukazatelem významu (Kleinberg 1999; Newman 2010): říká, jak často se k pojmu text vrací, ne jak je pojem důležitý pro konkrétního člověka.

Tamara Munznerová doporučuje u každé vizualizace oddělit tři otázky – jaká data zobrazuje, k jaké úloze slouží a jak data kóduje (Munzner 2014). U každého grafu níže je proto uvedeno, odkud bere data, co kóduje poloha, barva a velikost a kam čtenáře vede.

## 1. Distribuce technik napříč kategoriemi (Chart.js)

Prstencový graf rozděluje stránky technik podle rodin EA. Rodinou se rozumí první číslo kódu, který skript čte z cesty stránky; název rodiny pochází z grafu knihy a velikost výseče je počet stránek technik v rodině. Klepnutí na výseč vypíše techniky rodiny po podrodinách, každou jako odkaz. Graf ukazuje, jak podrobně kniha jednotlivé rodiny zpracovává, ne jak časté jsou techniky ve skutečnosti; kódový systém vysvětluje heslo [Taxonomie EA](@/glossary/taxonomie-ea.md).

<canvas id="taxonomy-distribution" width="800" height="500"></canvas>
<div id="taxonomy-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="taxonomy-distribution-chart" /> }}

## 2. Rodiny EA × úroveň rizika (Chart.js)

Bublinový graf kříží rodiny EA s úrovněmi rizika, které stránkám technik přiřazuje katalog technik, v pořadí legendy katalogu. Plocha bubliny odpovídá počtu stránek v buňce a barva rodině. Klepnutí na bublinu vypíše techniky, které v buňce leží. Úroveň rizika je katalogová klasifikace typického dopadu techniky, ne měřená závažnost: v konkrétním případě může technika nižší úrovně zasáhnout člověka v krizi velmi vážně. Jak katalog s úrovněmi zachází, popisuje [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md).

<canvas id="severity-matrix" width="800" height="500"></canvas>
<div id="severity-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="severity-matrix-chart" /> }}

## 3. 3D graf vztahů technik (Three.js)

Prostorový graf rozmisťuje všechny stránky technik po povrchu koule v pořadí jejich kódů, takže sousední kódy leží blízko sebe. Barva uzlu je rodina EA a čáry jsou odkazy mezi stránkami technik v knize. Klepnutí na uzel ukáže kód, název, rodinu, počet vazeb a odkaz na stránku techniky. Poloha na kouli tedy nese pořadí v taxonomii, ne podobnost; podobnost naznačují jen čáry, a to jen tam, kde ji text knihy výslovně propojil. Úplný výčet kódů je v [rejstříku technik](@/kompendium/08-prilohy/rejstrik-technik.md).

<div id="technique-graph-3d"></div>
<div id="graph-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="technique-graph-3d" /> }}

## 4. Fáze zotavení v čase (Chart.js)

Graf plovoucích pruhů ukazuje fáze zotavení na logaritmické ose času. Fáze, jejich orientační rozpětí a protokoly přebírá z rejstříku [longitudinálních rekonstruktivních protokolů](@/kompendium/recovery-protocols/_index.md): rozpětí čte z nadpisu fáze (například „týdny“, „měsíce“, „roky“ s čísly), protokoly z odkazů pod ním. Skupiny bez časového rozpětí vypíše pod grafem a neuvádí-li rejstřík rozpětí u žádné fáze, graf se nevykreslí a oznámí, že data chybí. Pruh neukazuje průběh příznaků ani „zbytkový deficit“ – takové hodnoty kniha neuvádí; ukazuje jen, v jakém časovém rámci kniha fázi popisuje. Rejstřík sám zdůrazňuje, že rámce jsou orientační a fáze se prolínají a vracejí.

<canvas id="recovery-trajectory" width="800" height="400"></canvas>
<div id="recovery-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="recovery-trajectory-chart" /> }}

## 5. Simulace epistemické dezintegrace (p5.js)

Animace je model, ne graf dat knihy: částice představují přesvědčení, která drží „kotvy“ stabilní struktury, a simulace cyklicky prochází stavy stabilní, narušený, fragmentovaný a obnovený. Posuvník mění intenzitu tlaku, kterým se částice vychylují. Simulace z knihy nic neodvozuje a nic nedokazuje; má jen názorně ukázat myšlenku, že poškození poznávání nespočívá v jednotlivém mylném přesvědčení, ale v rozpadu vztahů mezi přesvědčeními, a že obnova je možná. Klinický obraz tohoto stavu popisuje heslo [epistemické trauma](@/glossary/epistemicke-trauma.md).

<div id="epistemic-disintegration"></div>
<input id="disintegration-intensity" type="range" min="0" max="1" step="0.01" value="0.3" class="w-full mt-2">
<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Intenzita manipulačního tlaku (0 = stabilita, 1 = totální fragmentace)</p>
{{ <viz_script name="epistemic-disintegration-sim" /> }}

## 6. Simulace narušení pozornosti (p5.js)

Simulace je model jevu, který kniha popisuje jako [EA-1.1.2 informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md). Pohyb myši představuje pozornost; posuvník mění tempo proudu informací a počítadlo ukazuje, kolik jich pozornost zachytí a kolik unikne. Kód a název techniky přebírá simulace z odkazu v tomto odstavci a pod plátnem na ni přidá odkaz. Čísla počítadla patří simulaci, ne lidem: model jen zviditelňuje, že od určitého tempa nestačí sebelepší soustředění, a obrana proto spočívá ve zpomalení a omezení proudu, ne ve vyšším úsilí.

<div id="attention-disruption"></div>
<input id="attention-rate" type="range" min="0.1" max="5" step="0.1" value="1" class="w-full mt-2">
<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Tempo informačního streamu (0.1 = pomalé, 5 = přetížení)</p>
{{ <viz_script name="attention-disruption-sim" /> }}

## 7. Detekční signatury po skupinách (Chart.js)

Bodový graf ukazuje stránky [detekčních signatur](@/kompendium/detection-signatures/_index.md) seskupené tak, jak je řadí rejstřík sekce (podle jeho nadpisů, například jazykové, behaviorální či síťové signatury); jedna barevná stopa je jedna skupina. Vodorovná osa je pořadí signatury v rejstříku, svislá počet stránek knihy, které na signaturu odkazují. Klepnutí na bod vypíše signaturu, její skupinu a odkaz na stránku. Starší verze grafu slibovala průběh intenzity příznaků v čase; kniha takové hodnoty neuvádí, a graf je proto neukazuje. Signatury jsou znaky k rozpoznání, ne diagnostická kritéria.

<canvas id="phenomenology-timeline" width="800" height="500"></canvas>
<div id="phenomenology-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="phenomenology-timeline-chart" /> }}

## 8. 2D síť EA technik (Chart.js)

Rovinná síť ukazuje nejodkazovanější stránky technik – ty, na které v knize odkazuje nejvíc jiných stránek; kolik jich graf ukáže, je zobrazovací mez skriptu, ne vlastnost dat. Body jsou seskupeny podle rodin EA a obarveny jejich barvou, čáry jsou odkazy mezi vybranými stránkami. Klepnutí na bod zvýrazní sousedy a vypíše je s odkazy. Síť je dobrým vstupem pro čtenáře, který neví, kde začít: ukazuje techniky, ke kterým se kniha nejčastěji vrací. Nejodkazovanější však neznamená nejčastější ani nejnebezpečnější.

<canvas id="ea-network-2d" width="800" height="600"></canvas>
<div id="ea-network-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="ea-network-2d" /> }}

## 9. Rekurzivní spirála myšlení (p5.js)

Simulace je model sebereflexe, která se zacyklí. Ilustruje jevy, které kniha popisuje jako [hyperreflexivitu (EA-5.1.13)](@/kompendium/techniques/ea-5-1-13-hyperreflexivita.md) a [referenční rekurzi (EA-5.1.7)](@/kompendium/techniques/ea-5-1-7-referencni-rekurze.md): svislá poloha myši řídí hloubku rekurze a spirálové dráhy se s rostoucí hloubkou trhají. Pásma hloubky nesou názvy obou technik v pořadí, v jakém je jmenuje tento odstavec, a pod plátnem se objeví odkazy na jejich stránky. Hranice pásem patří modelu, ne klinice; simulace má jen ukázat, že přemýšlení o vlastním myšlení je od určité hloubky ochromující, a připomenout, že obrana spočívá v návratu k vnějším kotvám a činnosti, ne v další analýze.

<div id="recursive-thought-spiral"></div>
<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Pohni myší: vertikální poloha řídí hloubku rekurze (1–12). Nad 9 = metakognitivní paralýza.</p>
{{ <viz_script name="recursive-thought-spiral" /> }}

## 10. Historické případy na časové ose (Chart.js)

Bodový graf ukazuje stránky [historických případů](@/kompendium/historical-cases/_index.md) na časové ose. Kategorie, místo a období jsou pole záhlaví každé stránky: vodorovná poloha je začátek období, čára jeho trvání a u případů, které trvají dodnes, vede čára do současnosti; svislá osa a barva nesou kategorii případu. Klepnutí na bod vypíše případ a odkaz na jeho stránku. Graf nepřiřazuje případům žádnou „závažnost“ – srovnávat utrpení obětí totalitních režimů, kultů a dezinformačních kampaní na jedné stupnici by bylo metodicky i eticky pochybné. Výklad každého případu, jeho mechanismů a dokladů patří na jeho stránku.

<canvas id="historical-cases-timeline" width="800" height="500"></canvas>
<div id="historical-cases-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="historical-cases-timeline" /> }}

## 11. Strom akutních protokolů (Three.js 3D)

Trojrozměrný strom má za kořen rejstřík [akutních intervenčních protokolů](@/kompendium/emergency-protocols/_index.md), za větve jeho skupiny (nadpisy rejstříku) a za listy protokoly, na které rejstřík pod každým nadpisem odkazuje. Klepnutí na uzel zvýrazní cestu od kořene a ukáže detail s odkazem. Strom zobrazuje uspořádání sekce, ne rozhodovací algoritmus: o tom, který protokol je v dané situaci namístě, rozhoduje kvalifikovaný posuzovatel podle textu protokolu. V akutním ohrožení mají přednost krizové služby.

<div id="protocol-decision-tree" class="w-full rounded-lg"></div>
<div id="protocol-tree-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="protocol-decision-tree" /> }}

## 12. Síť nejodkazovanějších pojmů glosáře (p5.js)

Silově uspořádaná síť ukazuje pojmy [glosáře](@/glossary/_index.md), na které kniha odkazuje nejčastěji; kolik jich síť zahrne, je opět zobrazovací mez. Hrany jsou odkazy mezi stránkami pojmů. Rozvržení vzniká silovým algoritmem, který propojené uzly přitahuje a ostatní odpuzuje (Fruchterman a Reingold 1991), takže blízkost vyjadřuje hustotu odkazů, ne příbuznost významu. Klepnutí na uzel zvýrazní sousedy a vypíše počet stránek, které na pojem odkazují, a odkazy na sousední pojmy.

<div id="glossary-network"></div>
<div id="glossary-network-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="glossary-network-2d" /> }}

## 13. Průběh zotavení po fázích (Chart.js)

Tokový graf ve stylu Sankeyova diagramu přebírá fáze a jejich protokoly z rejstříku protokolů zotavení. Výška sloupce je počet protokolů fáze a šířka pásu mezi sousedními fázemi počet odkazů z protokolů jedné fáze na protokoly další podle grafu knihy. Klepnutí na sloupec vypíše popis fáze z rejstříku a její protokoly. Pás tedy nevyjadřuje podíl pacientů, kteří do další fáze postoupí – kniha žádné takové podíly neuvádí –, ale to, jak hustě kniha fáze provazuje. Klinickou cestu z pohledu sekce 06 ukazuje [vizualizace klinické cesty](@/kompendium/06-klinicke-aplikace/visualizations.md).

<canvas id="recovery-sankey" width="800" height="450"></canvas>
<div id="recovery-sankey-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="recovery-progression-sankey" /> }}

## 14. Digitální útočná plocha EA-9 (Three.js)

Koule představuje epistemickou plochu člověka a vektory, které na ni zvenčí míří, jsou stránky technik rodiny, kterou jmenuje nadpis tohoto oddílu – současné digitální EA, od manipulací s jazykovými modely po syntetická média. Kódy a názvy přebírá graf z grafu knihy, barvu vektoru určuje podrodina s názvem z katalogu technik. Klepnutí na hrot vektoru ukáže techniku, podrodinu a odkaz na stránku; úvodní text pod grafem vypíše podrodiny a počty stránek z aktuálních dat. Obraz útočné plochy je metafora pro rozpoznání: každá stránka popisuje znaky techniky a obranu, nikoli postup.

<div id="ea9-attack-surface"></div>
<div id="ea9-attack-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="ea9-digital-attack-surface" /> }}

## 15. Mezinárodní perspektivy × rodiny EA (Chart.js)

Tepelná mapa má v řádcích stránky sekce [mezinárodních perspektiv](@/kompendium/international/_index.md), seskupené podle nadpisů jejího rejstříku, a ve sloupcích rodiny EA. Hodnota buňky je počet odkazů ze stránky regionu nebo tématu na stránky technik dané rodiny. Klepnutí na buňku vypíše region, rodinu a odkazované techniky. Mapa neukazuje prevalenci technik v kultuře ani regionu – kniha žádnou prevalenci neuvádí a graf ji neodhaduje; ukazuje jen, o kterých technikách stránky o daném regionu píší.

<canvas id="cross-cultural-heatmap" width="800" height="500"></canvas>
<div id="cross-cultural-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="cross-cultural-heatmap" /> }}

## 16. Forenzní tok důkazů (p5.js)

Animace přebírá stádia a jejich kapitoly z rejstříku [forenzního a právního rozměru](@/kompendium/forensic-legal/_index.md): každá jeho část (forenzní posouzení, právní rámce, svědectví, dokumentace, specializované oblasti) je jedno stádium. Velikost kruhu odpovídá počtu kapitol stádia a hustota částic mezi sousedními stádii počtu odkazů z kapitol jednoho stádia na kapitoly dalšího. Klepnutí na stádium vypíše jeho kapitoly s odkazy. Tok nepopisuje průběh konkrétního řízení; procesní pravidla se liší podle jurisdikce a patří do jednotlivých kapitol.

<div id="forensic-evidence-flow"></div>
<div id="forensic-evidence-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="forensic-evidence-flow" /> }}

## 17. 3D síť protokolů zotavení (Three.js)

Prostorová síť zobrazuje stránky sekce protokolů zotavení. Vrstvy a barvy odpovídají fázím tak, jak je řadí rejstřík sekce (nadpis a odkazy pod ním); stránky, které rejstřík k žádné fázi neřadí, například průřezové protokoly, tvoří poslední vrstvu. Hrany jsou odkazy mezi protokoly v knize. Klepnutí na uzel ukáže protokol, jeho fázi, vazby a odkaz na stránku. Hrana není předepsané pořadí kroků; logiku pořadí rozebírá průřezový text [Sekvence](@/kompendium/recovery-protocols/sekvence.md).

<div id="recovery-network-3d"></div>
<div id="recovery-network-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="recovery-network-3d" /> }}

## Co vizualizace ukázat nemohou

Všechny grafy této sekce jsou ilustrativní pomůcky k orientaci ve struktuře knihy, ne klinická data, epidemiologické údaje ani diagnostické nástroje. Ukazují, co kniha obsahuje a jak je provázaná: odkaz vyjadřuje rozhodnutí autora poslat čtenáře jinam, ne doložený kauzální či empirický vztah. Graf je proto jen tak úplný, jak úplné jsou odkazy v knize, a chybějící hrana neznamená, že spolu jevy nesouvisejí. Starší verze grafů obsahovaly smyšlené fáze, skóre závažnosti, prevalenci, podíly pacientů a vlivové vazby; ty byly odstraněny, protože pro ně kniha nemá podklad.

Alberto Cairo připomíná, že poctivá vizualizace má sdělit i nejistotu svých dat (Cairo 2016). Nejistota těchto grafů neleží v měření, ale v redakčních rozhodnutích – v tom, jak autor řadí stránky pod nadpisy rejstříků, jakou úroveň rizika zapíše do katalogu a kam odkáže. Kdo chce graf změnit, mění text knihy; graf se při dalším sestavení webu přizpůsobí.

## Vizualizace jednotlivých sekcí

Vedle tohoto přehledu mají čtyři sekce knihy vlastní vizualizaci, která čte data z kontextu
své sekce. [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) ukazuje
techniky EA-1 podle podrodiny a úrovně rizika, tedy stránky jedné rodiny a jejich vazby;
[vizualizace sekce 04](@/kompendium/04-terminalni-protokoly/visualizations.md) kreslí strom
odkazů terminálních protokolů, z něhož je vidět, kam kapitoly čtenáře posílají;
[vizualizace sekce 06](@/kompendium/06-klinicke-aplikace/visualizations.md) sleduje klinickou
cestu zotavení po fázích péče, jejich stránkách a odkazech mezi nimi; a
[vizualizace sekce 07](@/kompendium/07-teoreticke-reflexe/visualizations.md) mapuje kapitoly
teoretické sekce podle tradic a vzájemných odkazů. Všechny čtyři sdílejí zásadu celé stránky:
zobrazují strukturu odkazů knihy, ne empirická data (Munzner, 2014).

## Literatura

- Bertin, J. (1967). *Sémiologie graphique: Les diagrammes, les réseaux, les cartes*. Paris: Gauthier-Villars.
- Cairo, A. (2016). *The Truthful Art: Data, Charts, and Maps for Communication*. New Riders.
- Fruchterman, T. M. J., & Reingold, E. M. (1991). Graph drawing by force-directed placement. *Software: Practice and Experience*, 21(11), 1129–1164.
- Kleinberg, J. M. (1999). Authoritative sources in a hyperlinked environment. *Journal of the ACM*, 46(5), 604–632.
- Munzner, T. (2014). *Visualization Analysis and Design*. CRC Press.
- Newman, M. E. J. (2010). *Networks: An Introduction*. Oxford University Press.
- Shneiderman, B. (1996). The eyes have it: A task by data type taxonomy for information visualizations. In *Proceedings of the IEEE Symposium on Visual Languages*, 336–343.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.

## Související

**Kompendium a katalog**

- [Hub kompendia](@/kompendium/_index.md) – vstup do celé knihy.
- [Katalog technik](@/kompendium/techniques/_index.md) – zdroj kódů, podrodin a úrovní rizika.
- [Kompletní rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) – všechny kódy na jednom místě.
- [Galerie](@/galerie.md) – další obrazové přehledy knihy.

**Zdrojové rejstříky grafů**

- [Longitudinální rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) – fáze zotavení pro grafy 4, 14 a 18.
- [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) – skupiny protokolů pro graf 12.
- [Detekční signatury](@/kompendium/detection-signatures/_index.md) – skupiny signatur pro graf 7.

**Glosář**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – systém kódů, z něhož grafy čtou rodiny.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – základní pojem knihy.
