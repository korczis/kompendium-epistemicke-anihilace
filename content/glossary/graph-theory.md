+++
title = "Teorie grafů (graph theory)"
weight = 50
description = "Matematika vrcholů a hran: formální základ úloh o souvislosti, cestách a cyklech; v knize nástroj analýzy sítí a rozpoznání kruhového zdůvodnění."

[taxonomies]
tags = ["glossary", "mathematics", "graph", "algorithms", "formal-methods", "verification"]

[extra]
category = "mathematics"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "advanced"
date_created = "2026-02-22"
date_updated = "2026-02-22"
version = "2.0.0"
related_terms = ["entity-resolution", "cirkularni-argumentace"]
audience = ["engineers", "architects", "mathematicians", "formal-methods-practitioners"]
prerequisite_knowledge = ["mathematics", "data-structures", "algorithms"]
date_modified = "2026-11-10"
keywords = ["Graph", "Theory", "glossary", "mathematics", "teorie grafů", "DAG"]
image = "/images/sections/glossary.png"
image_alt = "Teorie grafů – glosář"
+++

## Definice

**Teorie grafů** (*graph theory*) je odvětví diskrétní matematiky, které studuje grafy – matematické struktury tvořené vrcholy (uzly) spojenými hranami (vazbami) – a vlastnosti, algoritmy a věty, jimiž se řídí. Graf `G = (V, E)` je určen množinou vrcholů `V` a množinou hran `E`, kde každá hrana spojuje dva vrcholy. Teorie grafů dává formální základ úlohám o souvislosti, cestách, cyklech, tocích, barvení, párování a rovinnosti.

Pro knihu je na teorii grafů podstatné dvojí: **kruhové zdůvodnění je v řeči grafů cyklus** a síťová analýza zdrojů je jedním z nástrojů detekce EA.

## Původ a kontext pojmu

Teorie grafů vznikla v roce 1736, kdy Leonhard Euler vyřešil úlohu sedmi mostů města Královce (Königsberg): dokázal, že žádná procházka městem nemůže přejít každý ze sedmi mostů právě jednou. Eulerův klíčový vhled spočíval v abstrakci úlohy od fyzické geografie k matematické struktuře – pevnina se stala vrcholy, mosty hranami a otázka se proměnila v otázku existence eulerovského tahu ve výsledném grafu. Tento akt abstrakce – převedení skutečné úlohy na její grafovou podstatu – zůstává ústřední metodou teorie grafů i po téměř třech stoletích.

Obor od Eulerovy doby nesmírně vyrostl. Mezi milníky patří:

- **1847:** Kirchhoffova věta o kostrách pro elektrické obvody;
- **1852:** problém čtyř barev (dokázán s pomocí počítače v roce 1976);
- **1936:** Kőnigova první učebnice teorie grafů;
- **1956:** Dijkstrův algoritmus nejkratší cesty;
- **1962:** Edmondsův algoritmus maximálního párování;
- **70. léta:** NP-úplnost mnoha grafových úloh (hamiltonovská kružnice, barvení grafu aj.);
- **2000. léta:** PageRank (Google) jako grafový algoritmus nad grafem webu;
- **2010. léta:** grafové neuronové sítě propojující teorii grafů a strojové učení;
- **2020. léta:** grafové databáze s vlastnostmi, které přinášejí teorii grafů do praktické správy dat.

V softwarovém inženýrství se teorie grafů objevuje všude: řešení závislostí, sestavovací systémy, směrování v sítích, stavové automaty, workflow, optimalizace překladačů (grafy toku řízení), správa paměti (grafy dosažitelnosti) a správa verzí (DAG commitů).

## Technické podrobnosti

### Základní typy grafů

Pro další výklad jsou podstatné tyto typy grafů:

**Neorientovaný graf:** hrany nemají směr. Je-li `(u, v)` hrana, lze přejít z `u` do `v` i z `v` do `u`. Slouží k modelování symetrických vztahů jako „zná“ nebo „je podobný“.

**Orientovaný graf (digraf):** každá hrana má směr; `(u, v)` znamená z `u` do `v`. Slouží k modelování asymetrických vztahů jako „závisí na“, „dohlíží na“ nebo „implikuje“.

**Orientovaný acyklický graf (DAG):** orientovaný graf bez cyklů. Je klíčový pro řešení závislostí a pořadí sestavení; v grafu zdůvodnění by cyklus znamenal, že tvrzení podporuje samo sebe, což je epistemicky neplatné.

**Ohodnocený graf:** hrany nesou číselné váhy představující cenu, vzdálenost, kapacitu nebo jistotu. Používá se v algoritmech nejkratší cesty, při optimalizaci toků a v entity resolution vážené jistotou.

**Graf s vlastnostmi (*property graph*):** uzly a hrany nesou vlastnosti typu klíč–hodnota. Je to datový model většiny moderních grafových databází.

**Strom:** souvislý acyklický neorientovaný graf; ekvivalentně souvislý graf s `n-1` hranami pro `n` vrcholů.

## Srovnání

### Teorie grafů a teorie množin

Teorie množin se zabývá souhrny prvků bez vnitřní struktury. Teorie grafů přidává párové vztahy mezi prvky. Graf lze sice reprezentovat jako množinu uspořádaných dvojic, ale grafově specifické algoritmy (nejkratší cesta, detekce cyklů, toky) nemají přirozené množinové ekvivalenty.

### Teorie grafů a teorie kategorií

Teorie kategorií teorii grafů zobecňuje tím, že přidává skládání šipek (morfismů). Každý graf lze chápat jako volnou kategorii, ale kategorie mají další strukturu (identické morfismy, asociativní skládání), kterou grafy nemají.

### Orientované a neorientované použití

| použití | typ grafu | důvod |
|---|---|---|
| řešení závislostí | orientovaný (DAG) | závislosti jsou asymetrické |
| analýza sociálních sítí | neorientovaný | „zná“ je symetrické |
| mapování útočné plochy | orientovaný | „překládá se na“ má směr |
| shlukování podle podobnosti | neorientovaný ohodnocený | podobnost je symetrická |
| grafy zdůvodnění | orientovaný (DAG) | „podporuje“ má směr a je acyklické |

## Osvědčené postupy

### 1. Zvolit správnou reprezentaci grafu

Seznamy sousedů jsou efektivní pro řídké grafy (většinu grafů ze skutečného světa). Matice sousednosti jsou efektivní pro husté grafy a pro operace jako násobení matic.

### 2. Ověřit vlastnosti grafu včas

Před spuštěním algoritmu ověřte, že graf má očekávané vlastnosti (acykličnost u DAG, souvislost u cest, nezáporné váhy u Dijkstry). Cena ověření je zanedbatelná ve srovnání s laděním chybných výsledků algoritmu na poškozeném grafu.

### 3. Řešit závislosti topologickým řazením

Kdykoli existuje vztah „musí proběhnout před“, modelujte jej jako DAG a seřaďte topologicky. Platí to pro sestavovací systémy i pro pořadí migrací.

### 4. Odhalovat a hlásit cykly

Cykly v grafech závislostí jsou vždy chybou. Odhalujte je proaktivně (Tarjanův algoritmus silně souvislých komponent) a hlaste je s úplnou cestou cyklu, aby vývojáři mohli opravit skutečnou příčinu.

### 5. Omezit hloubku průchodu

V provozních grafových operacích vždy omezte maximální hloubku. Neomezené BFS/DFS na velkých grafech může spotřebovat nadměrnou paměť a čas. Většina praktických dotazů potřebuje nejvýše 3–5 kroků průchodu.

### 6. Znát složitost algoritmů

Znejte časovou složitost používaných algoritmů: BFS/DFS je O(V+E), Dijkstra s haldou O((V+E) log V), topologické řazení O(V+E) a SCC O(V+E). U velkých grafů záleží i na konstantách.

## Časté chyby

### Záměna orientovaných a neorientovaných operací

Kontrola souvislosti pro neorientovaný graf spuštěná na orientovaném grafu může dát zavádějící výsledky. Orientovaný graf může být slabě souvislý (souvislý při ignorování směru hran), ale ne silně souvislý. Používejte algoritmus odpovídající typu grafu.

### Přehlížení změn grafu

Mnoho grafových algoritmů předpokládá, že se graf během výpočtu nemění. Úprava grafu (přidání či odebrání vrcholů nebo hran) během průchodu může způsobit nenápadné chyby: vynechané vrcholy, nekonečné smyčky nebo nesprávné výsledky. Před algoritmickou operací pořiďte snímek grafu.

### Exponenciální výčet cest

Počítání nebo výčet všech cest mezi dvěma vrcholy v obecném grafu může mít exponenciální složitost. Potřebujete-li najít všechny cesty, přidejte omezení (maximální délka, vyloučené vrcholy), aby výpočet zůstal zvládnutelný.

### Paměťová náročnost velkých grafů

Ukládání explicitních objektů hran s vlastnostmi může u velkých grafů spotřebovat značnou paměť. Pro úlohy s převahou čtení zvažte komprimované reprezentace (formát CSR/CSC), pro grafy, které se nevejdou do paměti, proudové zpracování.

### Opomíjení teorie grafů u „jednoduchých“ úloh

Mnoho úloh, které zdánlivě s grafy nesouvisejí, jsou ve skutečnosti grafové úlohy v přestrojení. Stavové automaty jsou grafy, hierarchie typů jsou stromy, směrování v síti je úloha nejkratší cesty a rozvrhování je barvení grafu. Rozpoznání grafové struktury umožní použít dobře prozkoumané algoritmy.

## Význam pro Kompendium

Pro čtenáře knihy je teorie grafů užitečná ve třech ohledech. Za prvé, **[kruhová argumentace](@/glossary/cirkularni-argumentace.md) je cyklus**: tvrzení, které se po několika krocích opírá samo o sebe, lze v grafu zdůvodnění přímo ukázat. Za druhé, **citační a zdrojové sítě** odhalují koordinaci a uzavřenost – signatury [citační kruhovosti](@/kompendium/detection-signatures/18-network-citation-circularity.md) a [monokultury zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) jsou grafové vlastnosti. Za třetí, výzkum EA pracuje se [síťovou analýzou](@/kompendium/research-methodology/network-analysis-EA.md) vztahů ve skupinách, kde se izolace projevuje jako rozpad hran k vnějšímu světu. Teorie grafů tu nic nediagnostikuje; dává jen přesný jazyk pro strukturu, kterou pak musí vyložit kliník nebo analytik.

## Mez nástroje

Hranice teorie grafů v této knize leží v kroku, který není matematický: v rozhodnutí, co bude vrchol
a co hrana. Cyklus v grafu zdůvodnění je vlastností sestaveného grafu, nikoli argumentu samého —
tentýž text lze zapsat jako cyklus i jako řetěz podle toho, zda se dvě formulace téhož tvrzení
ztotožní, nebo rozliší. Nález cyklu proto nedokazuje, že jsou tvrzení nepravdivá; dokazuje, že
v daném zápisu nevede z okruhu cesta k nezávislé opoře. Nároky na dohledatelnost takového zápisu
stanoví [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

Totéž platí o sítích zdrojů: shluk, který se navzájem cituje, je grafová vlastnost a neříká nic o
tom, zda si jeho členové koordinaci domluvili. Teorie grafů dává přesný jazyk a současně mez
takového tvrzení; výklad patří klinikovi nebo analytikovi a čtenářský rámec vymezuje
[jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md).

## Související

- [Entity Resolution](@/glossary/entity-resolution.md) – sloučení záznamů nad grafem entit.
- [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) – kruhové zdůvodnění jako cyklus.
- [Citační kruhovost](@/kompendium/detection-signatures/18-network-citation-circularity.md) – síťová signatura EA.
- [Síťová analýza ve výzkumu EA](@/kompendium/research-methodology/network-analysis-EA.md) – metodika.
