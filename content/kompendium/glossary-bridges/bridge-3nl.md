+++
title = "Bridge: 3NL (tři vnořené úrovně)"
description = "Most mezi heslem 3NL a knihou: vrstvená architektura platformy, z níž kniha vzešla, a analogie úrovní, na nichž manipulace zasahuje do poznávání."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "3nl", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["3nl", "three-nested-loops", "bounded-context", "nabla-infinity", "bridge-bounded-context", "bridge-mereologicka-rekonstrukce"]
parent = "kompendium-glossary-bridges"
glossary_target = "3nl"
toc = false
+++

# Bridge: 3NL (tři vnořené úrovně)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[3NL](@/glossary/3nl.md) (*Three Nested Levels*, tři vnořené úrovně) je architektonický rámec
platformy Prismatic, z níž Kompendium vzešlo. Člení každou součást platformy do tří úrovní
abstrakce: strategická úroveň (L1) určuje, *co* systém dělá a jaké rozhraní nabízí navenek;
taktická úroveň (L2) určuje, *jak* spolu součásti spolupracují; operační úroveň (L3) určuje,
*jak věci skutečně fungují* v kódu a v běhovém prostředí. Každá úroveň zapouzdřuje složitost
úrovně pod sebou, takže změna v L3 se nemá přelévat do veřejného rozhraní v L1. Glosář vedle
toho uvádí i heslo *Three-Nested-Loops*, které stejnou zkratku vykládá jako tři vnořené řídicí
smyčky; obě hesla popisují architekturu platformy z jiného úhlu a pro knihu platí totéž: jde
o kontext jejího vzniku, nikoli o součást taxonomie technik.

Pro čtenáře knihy je pojem užitečný jako **pomůcka k orientaci v úrovních**. Kniha opakovaně
rozlišuje, zda manipulace zasahuje do obsahu přesvědčení, do postupů, jimiž člověk přesvědčení
ověřuje, nebo do samotných kritérií, podle nichž rozhoduje, co je důkaz. Vrstvený model
platformy tu slouží jako analogie, ne jako tvrzení o stavbě mysli.

## Pojem v jeho vlastním oboru

Vrstvení je jednou z nejstarších strategií softwarového inženýrství pro zvládání složitosti.
Dijkstra (1968) popsal operační systém THE jako hierarchii vrstev, z nichž každá smí využívat
jen služby vrstev pod sebou; tím se dala každá vrstva ověřit samostatně. Parnas (1972) doplnil
princip skrývání informací: modul má navenek nabízet rozhraní a skrývat rozhodnutí, která se
pravděpodobně změní. 3NL na tyto zásady navazuje: úroveň L1 je smlouvou s okolím, L3 je místem,
kde se smí měnit implementace, a L2 je vrstvou koordinace mezi nimi.

Obecnější zdůvodnění podal Simon (1962) v eseji o architektuře složitosti: složité systémy,
které přežívají a vyvíjejí se, bývají *téměř rozložitelné* hierarchie, v nichž jsou vazby uvnitř
podsystémů silnější než vazby mezi nimi. Doménově řízený návrh pak tutéž myšlenku přenesl do
modelování významu – každý [ohraničený kontext](@/glossary/bounded-context.md) má vlastní
slovník a komunikuje přes výslovné rozhraní (Evans 2003). V ekosystému Erlang/OTP, na němž
platforma stojí, vynucují hranice úrovní procesy, předávání zpráv a stromy supervize
(Armstrong 2003); 3NL je tedy spíše pojmenováním osvědčené praxe než novým vynálezem.

## Analogie, kterou kniha činí

Kniha si z vrstveného modelu bere jediný postřeh: **zásah na vyšší úrovni je závažnější než
zásah na nižší, protože mění pravidla, podle nichž se posuzuje všechno pod ní.** Spor o fakt
lze rozhodnout důkazem. Spor o postup ověřování lze vyřešit dohodou na metodě. Jakmile ale
někdo mění samotná kritéria toho, co se počítá jako důkaz, nebo zpochybňuje právo druhého
cokoli posuzovat, běžné opravné mechanismy přestanou fungovat. Proto kniha řadí
[imunizaci proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md)
a [modifikaci evidenčních kritérií](@/kompendium/techniques/ea-4-3-5-evidential-criteria-modification.md)
mezi techniky meta-úrovně: nepracují s jednotlivými tvrzeními, ale s pravidly jejich hodnocení.

V humanitních a sociálních vědách má myšlenka vnořených úrovní vlastní tradici. Bronfenbrenner
(1979) popsal vývoj člověka v soustavě vnořených systémů – od bezprostředních vztahů přes
instituce až po kulturní rámec – a ukázal, že stejná událost má jiný význam podle toho, na
které úrovni působí. Kniha s touto logikou pracuje v oddílech o
[kolektivních a institucionálních intervencích](@/kompendium/06-klinicke-aplikace/kolektivni-intervence.md)
a o [prevenci a rezilienci](@/kompendium/prevention-resilience/_index.md): ochrana jednotlivce
nestačí, pokud prostředí, v němž žije, systematicky podkopává jeho úsudek.

## Kde se pojem v knize vyskytuje

Přímo se ke 3NL vztahují kapitoly, které vysvětlují vznik knihy a její napojení na platformu.
Kapitola [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md)
popisuje, jak se taxonomie technik promítá do detekčních pravidel a kalibračních smyček;
kapitoly [2.3 Teoretické základy](@/kompendium/02-uvod/teoreticke-zaklady.md) a
[2.6 Vztah k NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) ukazují, na které úrovni
epistemický proces platformy pracuje s axiomy, inferencemi a meta-inferencemi.

Pro čtenáře, který chce vidět platformní stranu, je výchozím bodem oddíl
[AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md), zejména stránka
[NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md).
Teoretickou reflexi výpočetního modelování poznání nabízí kapitola
[7.6 Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md),
která zároveň upozorňuje na meze přenosu formálních modelů na lidské poznávání.

## Od pojmu k praxi

### Rozpoznání

Praktickou otázkou, kterou vrstvený model nabízí klinikovi, vyšetřovateli i zasaženému, je:
*na které úrovni se právě vede spor?* Na úrovni obsahu se diskutuje o tom, co se stalo. Na
úrovni postupu se diskutuje o tom, jak to zjistit. Na úrovni základů se diskutuje o tom, kdo
má právo to posoudit a co vůbec platí jako doklad. Varovným znakem je nenápadný posun sporu
směrem nahoru, při němž se z věcné námitky stane otázka duševní způsobilosti mluvčího. Kniha
tento posun popisuje v detekčních signaturách
[Nefalsifikovatelná tvrzení](@/kompendium/detection-signatures/3-linguistic-unfalsifiable-claims.md)
a [Cirkulární definice](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md).

### Odlišení

Ne každý spor o kritéria je manipulací. Věda postupuje i tím, že mění standardy toho, co
považuje za dobrou otázku a dobré vysvětlení (Kuhn 1962); legitimní spor o paradigma se však
vede veřejně, s argumenty a s ochotou nechat se vyvrátit. Manipulativní posun kritérií bývá
naopak jednostranný, nevyslovený a vždy výhodný pro toho, kdo ho provádí. Rozlišovacím
znakem je symetrie: platí nová pravidla i pro toho, kdo je zavedl?

### Obrana

Obrana spočívá v udržení úrovní odděleně. Na obsah se odpovídá doklady, na postup výslovnou
dohodou o metodě a na útok na základy oporou mimo vztah, v němž útok probíhá – v nezávislých
zdrojích, v dalších lidech a v záznamech pořízených v čase. Konkrétní postupy nabízejí
příručky [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md),
[Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md) a
[Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md). [Heuristika](@/glossary/heuristika.md) sama
o sobě nechrání; chrání to, že člověk dokáže říct, *o čem* se vlastně přít nechce nechat.

### Rámec pro profesionály

V terapii a supervizi má rozlišení úrovní praktický důsledek pro pořadí práce. U člověka,
jehož kritéria hodnocení byla dlouhodobě podkopávána, nelze začít výkladem obsahu, protože
nástroj výkladu je sám poškozen. Kniha proto doporučuje postup zdola: nejprve stabilizaci
a obnovu základních schopností, teprve potom práci s příběhem – viz
[Bridge: Mereologická rekonstrukce](@/kompendium/glossary-bridges/bridge-mereologicka-rekonstrukce.md)
a [6.4 Protokoly epistemické rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md).

## Časté omyly

Prvním omylem je číst 3NL jako psychologický model. Rámec popisuje software; kniha ho používá
jen jako analogii a nikde netvrdí, že lidská mysl má tři úrovně. Druhým omylem je spojovat
tři úrovně s populárními „trojdílnými“ modely mozku. Představa mozku složeného z plazího,
savčího a lidského patra je v neurovědě dávno opuštěná (Cesario, Johnson a Eisthen 2020)
a kniha se o ni neopírá. Třetím omylem je přenášet do lidských vztahů jazyk „přísných hranic
mezi úrovněmi“: co je v softwaru dobrá praxe, by ve skupině lidí mohlo znamenat utajování
rozhodnutí před těmi, jichž se týkají.

## Příklad (anonymizovaný kompozit)

Doktorandka předloží výsledky, s nimiž školitel nesouhlasí. Nejprve zpochybní data (obsah).
Když obstojí, změní požadavky na to, jaká analýza je přijatelná (postup), a to jen pro její
práci. Nakonec naznačí, že doktorandka „zatím nemá úsudek na to, aby posoudila, co je
v oboru podstatné“ (základy). Členka oborové rady, která o průběhu ví, si všimne posunu mezi
úrovněmi a navrhne posouzení třetím oponentem podle předem zveřejněných kritérií. Spor se tím
vrátí na úroveň, na níž se dá rozhodnout. Podobné situace rozebírají kapitola
[6.8 Případová studie: Doktorské vedení](@/kompendium/06-klinicke-aplikace/pripad-doktorat.md)
a technika [EA-2.4.5 Přepis hodnoticích kritérií](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md).

## Meze a otevřené otázky

Analogie mezi vrstvenou architekturou a úrovněmi poznávání je heuristická. Neexistuje
empirická studie, která by ukázala, že lidé spory spontánně dělí na tři úrovně, a hranice
mezi „postupem“ a „základy“ bývá v praxi neostrá. Otevřená je i otázka, zda se dá úroveň
zásahu spolehlivě určit z jednoho rozhovoru, nebo jen z delšího průběhu. Kniha proto
doporučuje používat rozlišení úrovní jako otázku do rozhovoru a supervize, ne jako
diagnostické kritérium.

## Literatura

- Armstrong, J. (2003). *Making Reliable Distributed Systems in the Presence of Software Errors* (disertační práce). Royal Institute of Technology (KTH), Stockholm.
- Bronfenbrenner, U. (1979). *The Ecology of Human Development: Experiments by Nature and Design*. Harvard University Press.
- Cesario, J., Johnson, D. J., & Eisthen, H. L. (2020). Your brain is not an onion with a tiny reptile inside. *Current Directions in Psychological Science*, 29(3), 255–260.
- Dijkstra, E. W. (1968). The structure of the „THE“-multiprogramming system. *Communications of the ACM*, 11(5), 341–346.
- Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley.
- Kuhn, T. S. (1962). *The Structure of Scientific Revolutions*. University of Chicago Press.
- Parnas, D. L. (1972). On the criteria to be used in decomposing systems into modules. *Communications of the ACM*, 15(12), 1053–1058.
- Simon, H. A. (1962). The architecture of complexity. *Proceedings of the American Philosophical Society*, 106(6), 467–482.

## Související

**Glosář**

- [3NL](@/glossary/3nl.md) – heslo, které tento most propojuje s knihou.
- [Bounded Context](@/glossary/bounded-context.md) – hranice významu, na které 3NL navazuje.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – proces, který úrovně platformy prochází.

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co kniha z platformy přebírá.
- [2.6 Vztah k NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – axiomy, inference a meta-inference.
- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – typická technika meta-úrovně.
- [6.4 Protokoly epistemické rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md) – postup obnovy zdola.

**Sesterské mosty**

- [Bridge: Bounded Context](@/kompendium/glossary-bridges/bridge-bounded-context.md) – změna kontextu jako nástroj manipulace.
- [Bridge: Mereologická rekonstrukce](@/kompendium/glossary-bridges/bridge-mereologicka-rekonstrukce.md) – vztah částí a celku v terapii.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [3NL](@/glossary/3nl.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
