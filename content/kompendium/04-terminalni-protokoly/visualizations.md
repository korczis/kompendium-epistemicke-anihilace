+++
title = "Vizualizace pro sekci 04 – strom odkazů terminálních protokolů"
description = "Interaktivní radiální strom sekce 04: kapitoly terminálních protokolů a oddíly knihy, na které odkazují, s počty odkazů; odvozeno z odkazů v knize."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "p5js", "terminalni-protokoly"]
categories = ["academic", "tools"]

[extra]
related_terms = ["pred-simulacni-screening", "ultimatni-scenar", "kontrolovana-rekonstituce"]
section_icon = "🌳"
toc = false
+++

# Strom odkazů terminálních protokolů

Tato vizualizace patří k [sekci 04](@/kompendium/04-terminalni-protokoly/_index.md), která popisuje terminální protokoly – systémové sekvence, jež mohou vést k hlubokému a dlouhodobému narušení poznávání a identity –, a k ochranným postupům, které je mají včas zachytit: [před-simulačnímu screeningu](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) a [intra-simulačnímu monitoringu](@/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring.md). Radiální strom ukazuje, kam jednotlivé kapitoly sekce čtenáře posílají: do glosáře, do klinických kapitol, do příloh nebo do filozofického rámce. Je určen těm, kdo odpovídají za bezpečí lidí v intenzivních výcvikových programech, v terapii nebo ve výzkumu a potřebují rychle najít, kde kniha k dané situaci říká víc. Strom je odvozen z odkazů v knize, nikoli z rozhodovacího algoritmu.

<div id="section-04-decision-tree" class="rounded-lg"></div>
<div id="tree-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="section-04-decision-tree" /> }}

## Co strom zobrazuje

**Kořen** uprostřed je rejstřík sekce 04. **Vnitřní prstenec** tvoří stránky sekce – kapitoly o [konceptuální](@/kompendium/04-terminalni-protokoly/konceptualni-dekonstrukce.md) a [identitní dekonstrukci](@/kompendium/04-terminalni-protokoly/identitni-dekonstrukce.md), o [institucionální anihilaci](@/kompendium/04-terminalni-protokoly/institucionalni-anihilace.md), o [kontrolované rekonstituci](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md), o [ultimátním scénáři](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md), ochranné protokoly a souhrnné kapitoly –, tak jak je skript najde v grafu odkazů knihy; tato stránka sama v prstenci není. Seznam se nepíše ručně: přibude-li v sekci kapitola, strom ji při příštím sestavení webu ukáže.

**Vnější prstenec** nese u každé kapitoly oddíly knihy, na které tato kapitola odkazuje. Popisek uzlu je název oddílu a v závorce počet odkazů, které z kapitoly do oddílu vedou; uzly jsou seřazeny od oddílu s nejvíce odkazy. Odkazy uvnitř sekce 04 a odkazy na rejstříkové stránky se nepočítají, aby strom ukazoval, kam kapitola vede ven, ne jak je sekce propojena sama se sebou. Barva vnějšího uzlu a čáry k němu označuje oddíl knihy a je stejná jako na ostatních vizualizacích, které oddíly barví; barva tedy nekóduje riziko ani naléhavost.

Úhlová šíře, kterou kapitola ve stromu zabírá, je pro všechny kapitoly stejná a dělí se rovným dílem mezi její oddíly. Velikost výseče proto nic nevyjadřuje; informaci nese jen popisek s počtem. Jacques Bertin rozlišoval vizuální proměnné, které nesou kvantitu, od těch, které nesou jen příslušnost (Bertin 1967): ve stromu nese příslušnost barva a kvantitu číslo, nikoli plocha.

## Proč strom netvrdí rozhodovací logiku

Dřívější verze této stránky slibovala rozhodovací strom s větvemi „ano – nejasné – ne“, s mírou projevu a s barvami rizika. Takovou logiku z dat knihy odvodit nelze: odkaz mezi stránkami neříká, co má posuzovatel v dané chvíli udělat. Skript proto zobrazuje jen to, co je doložené – strukturu odkazů – a rozhodování nechává textu kapitol, kam patří. Kritéria, podle nichž se pokračuje, zpomaluje nebo zastavuje, popisují kapitoly o screeningu a monitoringu; nezávislý dohled a institucionální pojistky rozebírá [kapitola 5 o specializovaných bezpečnostních protokolech](@/kompendium/04-terminalni-protokoly/kapitola-5.md).

Na tom, aby rozhodnutí o zastavení programu mělo pevnou oporu, nezáleží jen formálně. Simulace vězení na Stanfordu byla ukončena po šesti dnech z plánovaných dvou týdnů, protože se chování účastníků vymklo kontrole (Haney, Banks a Zimbardo 1973). Belmontská zpráva formulovala pro výzkum s lidmi zásadu, že riziko pro účastníka se posuzuje průběžně a jeho ochrana má přednost před cílem výzkumu (National Commission 1979). Strom tyto zásady neprovádí; pomáhá jen najít kapitoly, které je pro terminální protokoly konkretizují.

## Jak strom číst

Pohyb myši nad uzlem zobrazí jeho celý název, klepnutí otevře detail pod stromem. U kapitoly vnitřního prstence detail uvede, do kolika oddílů knihy kapitola odkazuje, a nabídne odkaz na její stránku. U uzlu vnějšího prstence vypíše stránky, na které kapitola v daném oddílu odkazuje, každou jako odkaz. Tak lze například od kapitoly o monitoringu přejít přímo ke klinickým stránkám, na které se odvolává, aniž by čtenář musel kapitolu číst celou.

Profil vnějšího prstence má i obsahovou výpověď. Kapitola, jejíž odkazy vedou převážně do glosáře, se opírá hlavně o vymezení pojmů; kapitola s odkazy do [sekce 06. Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) předává čtenáře klinické péči; odkazy do příloh vedou k nástrojům a etickým rámcům. Kdo připravuje program a chce si ověřit, zda má po ruce postupy pro situaci, kdy se signál objeví, hledá ve stromu právě kapitoly s vazbou na klinickou sekci – například na [diferenciální diagnostiku](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md), která má vyloučit, že pozorované změny mají jinou příčinu, třeba rozvíjející se psychotickou poruchu nebo reakci na nesouvisející zátěž.

Radiální uspořádání šetří místo a dobře ukazuje vztah celku k částem, ale úhly a radiální vzdálenosti se srovnávají hůř než poloha na společné ose; pořadí přesnosti, s jakou lidé čtou různé grafické veličiny, experimentálně doložili William Cleveland a Robert McGill (Cleveland a McGill 1984). Tamara Munznerová z toho vyvozuje, že rozvržení se má volit podle úlohy, kterou má čtenář řešit (Munzner 2014). Úlohou tohoto stromu je najít cestu, ne srovnávat množství, a proto jsou počty v popiscích, ne v délce čar.

## Jak se stromem pracovat

Před začátkem náročného programu může tým projít strom jako kontrolní seznam: vede každá kapitola, o kterou se program opírá, i ke klinickým a etickým stránkám, nebo jen k pojmům? Má tým nástroje, na které kapitoly odkazují – [self-report instrumenty](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md), [semistrukturovaný rozhovor](@/kompendium/06-klinicke-aplikace/semi-structured-interview-protokol.md), [supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)? Po skončení programu poslouží strom k rozboru: které kapitoly tým skutečně používal a které vazby zůstaly nevyužity.

Obecný příklad (kompozit): v několikadenním výcviku krizového vyjednávání si lektorka všimne, že jeden z účastníků přestal používat vlastní slova a opakuje formulace instruktora, i když se ho ptá na osobní zážitky. Signál není jednoznačný. Ve stromu najde kapitolu o intra-simulačním monitoringu, v jejím vnějším prstenci klinickou sekci a v detailu stránky o rozhovoru a diferenciální diagnostice. Místo aby čekala, zda se stav zlepší, domluví s účastníkem krátký rozhovor a požádá o nezávislé posouzení. Ukáže se, že účastník je po několika nocích téměř bez spánku a v osobní krizi, kterou výcvik prohloubil. Program pro něj přeruší a domluví navazující péči. Strom jí rozhodnutí neřekl; zkrátil jen cestu k textům, podle nichž se rozhodla.

## Náročný výcvik, nebo destruktivní protokol

Všechny kapitoly sekce předpokládají rozlišení, které je v praxi nejtěžší: ne každá intenzivní zkušenost je škodlivá. Náročný výcvik, psychoterapie, která otevírá bolestná témata, nebo přechodové rituály v profesních komunitách mohou přechodně oslabit jistoty člověka a přesto ho posílit. Rozhodující není samotná intenzita, ale to, zda účastník zůstává autorem svého rozhodnutí: zda může kdykoli odejít bez trestu, zda rozumí tomu, co se s ním děje, zda má přístup k lidem a informacím mimo program a zda se program po skončení snaží jeho samostatnost obnovit. Steven Hassan tyto otázky shrnuje jako rozdíl mezi prostředím, které respektuje svobodnou vůli, a prostředím, které ji soustavně omezuje kontrolou chování, informací, myšlení a emocí (Hassan 2015). Kapitola o kontrolované rekonstituci převádí tento rozdíl do znaků, podle nichž lze legitimní program poznat; ve stromu je to jedna z kapitol, od nichž se vyplatí začít.

## Co strom ukázat nemůže

Strom je ilustrativní orientační pomůcka nad strukturou knihy, ne validovaný klinický algoritmus ani klinická data. Počet odkazů vyjadřuje, jak hustě autor kapitolu provázal, nikoli to, jak důležitý je cílový oddíl pro bezpečí účastníka. Strom nenahrazuje klinické vyšetření, nepodává diagnózu a neurčuje léčbu; v situaci ohrožení života nebo zdraví mají přednost krizové služby a zdravotní péče. Edward Tufte varuje před grafikou, která svou formou sugeruje víc, než data unesou (Tufte 1983); proto tato stránka výslovně říká, co strom neobsahuje.

Strom také nepostihuje vliv autority a skupinového tlaku na samotného posuzovatele. Milgramovy pokusy ukázaly, jak silně může situace a autorita potlačit úsudek jednotlivce (Milgram 1974); lektor, který je součástí programu, nemusí být schopen nezávisle rozhodnout o jeho zastavení, a proto kniha trvá na nezávislém dohledu. Následky, které už nastaly, řeší sekce 06 a zotavení po pobytu v prostředí s vysokou mírou kontroly popisuje i Hermanové pojetí stadií zotavení (Herman 1992), z něhož vychází [vizualizace klinické cesty](@/kompendium/06-klinicke-aplikace/visualizations.md).

## Literatura

- Bertin, J. (1967). *Sémiologie graphique: Les diagrammes, les réseaux, les cartes*. Paris: Gauthier-Villars.
- Cleveland, W. S., & McGill, R. (1984). Graphical perception: Theory, experimentation, and application to the development of graphical methods. *Journal of the American Statistical Association*, 79(387), 531–554.
- Haney, C., Banks, W. C., & Zimbardo, P. G. (1973). Interpersonal dynamics in a simulated prison. *International Journal of Criminology and Penology*, 1.
- Hassan, S. (2015). *Combating Cult Mind Control* (rev. vyd.). Freedom of Mind Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Milgram, S. (1974). *Obedience to Authority: An Experimental View*. Harper & Row.
- Munzner, T. (2014). *Visualization Analysis and Design*. CRC Press.
- National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research (1979). *The Belmont Report*.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.

## Související

**Kapitoly sekce 04**

- [Před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) – vstupní posouzení před programem.
- [Intra-simulační monitoring](@/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring.md) – průběžné sledování a kritéria zastavení.
- [Kontrolovaná rekonstituce](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md) – odlišení legitimního výcviku od destruktivního.
- [Ultimátní scénář](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md) – nejtěžší konfigurace.
- [Kapitola 5: Specializované bezpečnostní protokoly](@/kompendium/04-terminalni-protokoly/kapitola-5.md) – nezávislý dohled a institucionální pojistky.

**Navazující péče**

- [Diferenciální diagnostika](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md) – vyloučení jiných příčin.
- [Supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) – ochrana účastníků i vedoucích.

**Další vizualizace**

- [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – techniky EA-1, méně závažné vzorce, o nichž pojednává sekce 03.
- [Vizualizace sekce 06](@/kompendium/06-klinicke-aplikace/visualizations.md) – klinická cesta zotavení.
- [Globální vizualizace](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.
