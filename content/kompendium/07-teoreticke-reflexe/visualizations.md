+++
title = "Vizualizace pro sekci 07 – mapa teoretických rámců"
description = "Interaktivní silová mapa kapitol sekce 7: barva podle filozofické tradice z přehledu tradic, vazby podle odkazů mezi kapitolami v knize, ne podle vlivu."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "p5js", "filosofie", "teoreticky-ramec"]
categories = ["academic", "tools"]

[extra]
related_terms = ["tononi-iit", "varela-enactivism", "wardle-disinformation-typology", "williams-truth-and-truthfulness"]
parent = "kompendium-07-teoreticke-reflexe"
section_icon = "🧠"
toc = false
+++

# Mapa teoretických rámců

Tato vizualizace patří k [sekci 7](@/kompendium/07-teoreticke-reflexe/_index.md) a zobrazuje její kapitoly – tematické úvahy i kapitoly věnované jednotlivým myslitelům, jejichž práce pomáhají porozumět [epistemické anihilaci](@/glossary/epistemicka-anihilace.md) – jako silově uspořádaný graf. Neslouží jako dějiny filozofie ani jako mapa vlivů mezi mysliteli. Je to orientační mapa knihy: ukazuje, z jakých tradic sekce čerpá, mezi kterými kapitolami kniha sama odkazuje a kde najít podrobný výklad. Uzly, barvy i vazby jsou odvozeny z odkazů a katalogu knihy.

<div id="section-07-framework-map" class="rounded-lg"></div>
<div id="framework-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="section-07-framework-map" /> }}

## Co mapa zobrazuje

Každý **uzel** je jedna stránka sekce 7, tak jak ji skript najde v grafu odkazů knihy; tato stránka a rejstříkové stránky v mapě nejsou. Popisek uzlu tvoří první část názvu kapitoly – u kapitol o myslitelích jméno autora, u tematických kapitol jejich téma –, okno detailu k němu přidá číslo kapitoly a zbytek názvu, tedy pojem, pro který je kapitola v knize důležitá. Když sekce získá novou kapitolu, objeví se v mapě při příštím sestavení webu sama; proto zde není uveden ani počet uzlů, ani jejich seznam.

Barva uzlu označuje filozofickou tradici, a to podle přehledové stránky [Filozofické tradice](@/kompendium/07-teoreticke-reflexe/filozoficke-tradice/_index.md). Skript přečte její nadpisy a odkazy pod nimi a každou kapitolu přiřadí k tomu nadpisu, pod nímž je odkazována spolu s nejvíce dalšími kapitolami sekce. Pořadí barev odpovídá pořadí nadpisů v přehledu. Kapitola, kterou přehled k žádné tradici nezařazuje, je šedá. Barvu tedy neurčuje skript ani tato stránka, ale text přehledu – a kdo chce zařazení změnit, mění přehled, ne graf.

**Hrany** spojují dvě kapitoly, mezi nimiž v knize vede odkaz. Vede-li odkaz oběma směry, je hrana silnější a sytější a uzly se k sobě přitahují víc. Úvodní text v okně detailu vypíše počet kapitol, počet vazeb a počet kapitol v každé tradici tak, jak je skript spočte z aktuálních dat, a nabídne odkaz na přehled tradic.

## Hrana není vliv

Dřívější verze této stránky mluvila o „vlivových vazbách“ mezi mysliteli. Takové tvrzení z dat knihy odvodit nelze: odkaz mezi dvěma kapitolami říká jen to, že autor při výkladu jedné myšlenky považoval za užitečné poslat čtenáře k druhé. Může jít o skutečný historický vliv, o polemiku, o souběžné, nezávisle vzniklé myšlenky, nebo jen o tematickou příbuznost, kterou kniha využívá. Dějiny myšlení jsou plné vlivů, které se v textech nijak neodkazují, a odkazů, které vliv nevyjadřují.

Tento problém dobře zná bibliometrie. Eugene Garfield navrhl citační rejstříky jako nástroj, který sleduje „asociace myšlenek“ mezi texty, nikoli jejich původ (Garfield 1955), a Derek de Solla Price ukázal, že sítě citací mají vlastní strukturu, která odráží komunikační zvyky oboru stejně jako jeho obsah (Price 1965). Mapa sekce 7 je takovou sítí v malém: vypovídá o tom, jak kniha své teoretické zdroje propojuje, a jen nepřímo o tom, jak spolu souvisejí samy.

## Tradice a jejich přínos

Přehled tradic, z něhož mapa čerpá barvy, vychází z toho, že teorie epistemické anihilace nevznikla z jedné školy, ale z rozhovoru několika tradic. Fenomenologie a [hermeneutika](@/glossary/hermeneutika.md) dávají knize slovník pro prožitek a porozumění: Martin Heidegger a Maurice Merleau-Ponty popsali člověka jako bytost, která je vždy již zasazena do světa a tělesně ho vnímá (Heidegger 1927; Merleau-Ponty 1945), a kapitoly o [bytí-ve-světě](@/kompendium/07-teoreticke-reflexe/heidegger-byt-ve-svete.md) a o [vtělené percepci](@/kompendium/07-teoreticke-reflexe/merleau-ponty-vtelena-percepce.md) z toho vyvozují, jak manipulace mění samozřejmou půdu, na níž člověk stojí. Kritická teorie přidává analýzu moci: Michel Foucault ukázal, jak se moc uplatňuje skrze dohled a normy (Foucault 1975), Max Horkheimer a Theodor Adorno popsali proměnu rozumu v nástroj ovládání (Horkheimer a Adorno 1947) a Jürgen Habermas proti tomu postavil ideál komunikace, v níž rozhoduje síla lepšího argumentu (Habermas 1981); tyto rámce shrnuje kapitola [7.1 o filosofickém rámci EA](@/kompendium/07-teoreticke-reflexe/filosoficky-ramec.md).

Filozofie jazyka a epistemologie přispívají přesností v otázkách významu a ospravedlnění. Ludwig Wittgenstein ukázal, že význam slov je dán jejich užitím ve sdílených jazykových hrách (Wittgenstein 1953), což [kapitola 7.10](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md) používá k výkladu, proč skupina s vlastním jazykem může členům změnit i to, co jsou schopni myslet. Willard Van Orman Quine popsal přesvědčení jako síť, v níž lze při rozporu upravit téměř kterýkoli uzel (Quine 1951), Donald Davidson formuloval princip vstřícného výkladu (Davidson 1973) a Thomas Kuhn ukázal, jak paradigmata určují, co se vůbec považuje za fakt (Kuhn 1962). Sociální epistemologie, kterou rozebírá [kapitola 7.3](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md), přináší pojem epistemické nespravedlnosti (Fricker 2007), a Bernard Williams rozlišil ctnosti přesnosti a upřímnosti, bez nichž nemůže fungovat žádné společenství sdíleného poznání (Williams 2002).

Filozofie mysli a kognitivní věda dodávají modely zpracování informací: Karl Friston popsal mozek jako systém, který předpovídá své vstupy a minimalizuje překvapení (Friston 2010), a [kapitola o aktivní inferenci](@/kompendium/07-teoreticke-reflexe/friston-active-inference.md) z toho vyvozuje, proč soustavné zpochybňování vnímání tak hluboce destabilizuje; Michael Polanyi popsal tichou znalost, kterou člověk má, ale nedokáže ji plně vyslovit (Polanyi 1966). Etika a politická filozofie se ptají, co je v sázce: Hannah Arendtová ukázala, jak bezmyšlenkovitost umožňuje podílet se na zlu bez zlého úmyslu (Arendt 1963), a Axel Honneth popsal uznání jako podmínku sebedůvěry a sebeúcty (Honneth 1992). Pro knihu jsou tyto rámce důležité proto, že ukazují epistemickou anihilaci jako újmu na lidské důstojnosti, nejen jako kognitivní poškození.

## Jak mapu číst

Rozvržení vzniká silovým algoritmem: uzly se navzájem odpuzují, hrany je k sobě přitahují a soustava se postupně ustálí. Tento přístup ke kreslení grafů, který popsali Thomas Fruchterman a Edward Reingold, dává shluky hustě propojených uzlů a rozprostírá ty, které spolu nesouvisejí (Fruchterman a Reingold 1991). Výchozí rozmístění je pevné, aby se mapa při každém načtení ustálila podobně. Blízkost na obrazovce vyjadřuje jen hustotu odkazů, ne míru shody mezi mysliteli; vzdálenost nemá měřítko a osy nic neznamenají.

Pohyb myši nad uzlem zobrazí číslo, autora a pojem kapitoly; uzel lze přetáhnout a připnout. Klepnutí uzel vybere, zvýrazní jeho sousedy a v okně detailu vypíše tradici, pojem, seznam kapitol, na které je napojen, a odkaz na plný článek. Barvy se doporučuje číst jako hrubou orientaci a Bertinovým jazykem jako proměnnou příslušnosti, ne pořadí (Bertin 1967): žádná tradice není „výš“ nebo „níž“.

## Jak s mapou pracovat

Mapa se dá využít třemi způsoby. Čtenář, který zná jednoho autora, z něj vyjde a podle hran najde kapitoly, na které kniha od něj odkazuje. Čtenář, který řeší konkrétní otázku – třeba proč je ztráta sdíleného jazyka tak ničivá –, si vybere barvu tradice a projde její uzly. Učitel může mapou ukázat, že teorie epistemické anihilace stojí na rozhovoru tradic, které se v jiných souvislostech často míjejí, a že kapitoly šedé barvy jsou místa, kde kniha tradici zatím výslovně nepřiřadila.

Obecný příklad (kompozit): terapeutka pracuje s klientkou, která po letech v uzavřené skupině říká, že „neumí přemýšlet vlastními slovy“. Na mapě vyjde od kapitoly o Wittgensteinovi (význam jako užití ve sdíleném společenství) a hledá, kam kniha odtud vede; v detailu najde napojené kapitoly a přes přehled tradic se dostane ke kapitolám o [Davidsonovi](@/kompendium/07-teoreticke-reflexe/davidson-radical-interpretation.md) (porozumění jako vstřícný výklad druhého) a o [Honnethovi](@/kompendium/07-teoreticke-reflexe/honneth-rozpoznani.md) (uznání jako podmínka sebedůvěry). Tři kapitoly jí dají tři různé, ale spojené pohledy: klientka ztratila společenství, v němž její slova platila, ztratila zkušenost, že jí někdo rozumí, a s tím i důvěru, že její hlas má váhu. Mapa jí to nesdělila; pomohla jí jen najít texty, z nichž to vyčetla.

## Co mapa ukázat nemůže

Výběr kapitol i jejich zařazení do tradic jsou kurátorským rozhodnutím autora knihy, ne úplným ani neutrálním obrazem dějin myšlení. Zařazení zjednodušuje: Michael Polanyi byl chemikem i filozofem vědy, Hannah Arendtová vyšla z fenomenologie, a přesto je přehled řadí jen k jedné tradici. Mapa neobsahuje autory, o něž se kniha opírá v jiných sekcích, a nerozlišuje odkaz souhlasný od polemického. Kdo potřebuje přesné vymezení vztahu mezi dvěma mysliteli, má sáhnout po příslušné kapitole a po primárních textech, ne po hraně v grafu.

Mapa je ilustrativní pomůcka k orientaci, ne klinická data ani výsledek obsahové analýzy. Edward Tufte varuje před grafikou, která formou sugeruje přesnost, jakou data nemají (Tufte 1983), a Tamara Munznerová připomíná, že silové rozvržení je vhodné k hledání shluků a sousedství, nikoli ke čtení přesných hodnot (Munzner 2014). Proto mapa žádné hodnoty neukazuje, a čísla, která vypíše, jsou jen počty stránek a odkazů.

## Literatura

- Arendt, H. (1963). *Eichmann in Jerusalem: A Report on the Banality of Evil*. Viking.
- Bertin, J. (1967). *Sémiologie graphique: Les diagrammes, les réseaux, les cartes*. Paris: Gauthier-Villars.
- Davidson, D. (1973). Radical interpretation. *Dialectica*, 27(3–4).
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Friston, K. (2010). The free-energy principle: A unified brain theory? *Nature Reviews Neuroscience*, 11(2).
- Fruchterman, T. M. J., & Reingold, E. M. (1991). Graph drawing by force-directed placement. *Software: Practice and Experience*, 21(11), 1129–1164.
- Garfield, E. (1955). Citation indexes for science: A new dimension in documentation through association of ideas. *Science*, 122(3159), 108–111.
- Habermas, J. (1981). *Theorie des kommunikativen Handelns*. Suhrkamp.
- Heidegger, M. (1927). *Sein und Zeit*. Niemeyer.
- Honneth, A. (1992). *Kampf um Anerkennung*. Suhrkamp.
- Horkheimer, M., & Adorno, T. W. (1947). *Dialektik der Aufklärung*. Querido.
- Kuhn, T. S. (1962). *The Structure of Scientific Revolutions*. University of Chicago Press.
- Merleau-Ponty, M. (1945). *Phénoménologie de la perception*. Gallimard.
- Munzner, T. (2014). *Visualization Analysis and Design*. CRC Press.
- Polanyi, M. (1966). *The Tacit Dimension*. Doubleday.
- Price, D. J. de Solla (1965). Networks of scientific papers. *Science*, 149(3683), 510–515.
- Quine, W. V. O. (1951). Two dogmas of empiricism. *The Philosophical Review*, 60(1).
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.
- Williams, B. (2002). *Truth and Truthfulness: An Essay in Genealogy*. Princeton University Press.
- Wittgenstein, L. (1953). *Philosophische Untersuchungen / Philosophical Investigations*. Blackwell.

## Související

**Kapitoly sekce 7**

- [Filozofické tradice](@/kompendium/07-teoreticke-reflexe/filozoficke-tradice/_index.md) – přehled, z něhož mapa čerpá barvy.
- [7.1 Filosofický rámec EA](@/kompendium/07-teoreticke-reflexe/filosoficky-ramec.md) – Foucault, Adorno, Sloterdijk, Habermas.
- [7.3 Sociální epistemologie EA](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md) – epistemická nespravedlnost a důvěra.
- [7.10 Wittgenstein: jazykové hry](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md) – význam jako užití.
- [7.18 Arendt: banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md) – krize úsudku.
- [7.22 Honneth: rozpoznání](@/kompendium/07-teoreticke-reflexe/honneth-rozpoznani.md) – uznání jako podmínka sebedůvěry.
- [7.40 Friston: aktivní inference](@/kompendium/07-teoreticke-reflexe/friston-active-inference.md) – predikční mysl.

**Další vizualizace a glosář**

- [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – techniky, které teorie vysvětluje.
- [Vizualizace sekce 04](@/kompendium/04-terminalni-protokoly/visualizations.md) – strom odkazů terminálních protokolů.
- [Globální vizualizace](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – základní pojem knihy.
