+++
title = "M5M"
weight = 100
description = "M5M (Max 5 Minutes): poradní pilíř doktríny Prismatic Platform pro granulární práci v krocích do pěti minut. Co vyžaduje, proč vznikl a jak souvisí s Kompendiem."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "methodology"]

[extra]
category = "doctrine"
abbreviation = "M5M"
related_terms = ["doctrine", "session-discipline", "paralysis-by-analysis", "archer-supreme", "nm-nd"]
keywords = ["M5M", "Max 5 Minutes", "granulární exekuce", "dekompozice úkolů", "doktrína", "Prismatic Platform"]
+++

## Definice

**M5M** (*Max 5 Minutes*, nejvýš pět minut) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform, který se týká **rozdělení práce na malé kroky**. Příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény *Granular execution*, index pojmů jej popisuje jako „platformovou doktrínu: granulární exekuce“. Každý úkol se má rozložit na kroky, z nichž žádný netrvá déle než pět minut.

Pojem patří do kontextu platformy a jejího způsobu práce, ne do taxonomie epistemické anihilace.

## Původ a kontext pojmu

Myšlenka práce v krátkých, časově ohraničených úsecích je v řízení práce rozšířená. Známá je technika, která střídá zhruba půlhodinové bloky soustředění s krátkou přestávkou, a v agilním vývoji softwaru se obecně prosazuje zásada malých, často dokončovaných přírůstků místo velkých, dlouho rozpracovaných změn. M5M tyto přístupy dovádí do krajnosti: limit je výrazně kratší a vztahuje se na každý jednotlivý krok, ne na blok práce.

Důvod je specifický pro platformu. Velkou část práce na ní vykonávají automatizovaní agenti postavení na jazykových modelech. U nich se ukazuje, že dlouhý, neohraničený úkol vede k „driftu“ – agent se postupně vzdaluje zadání, hromadí předpoklady, které nikdo neověřil, a chyba se projeví až na konci. Krátký krok s jasným výsledkem dovoluje drift zachytit včas. Toto zdůvodnění je výkladem z kontextu platformy; dokumentace pilíře sama uvádí jen pravidla.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy M5M zahrnuje:

- rozdělení všech úkolů na kroky v délce **nejvýše pěti minut**;
- **jednominutovou přestávku** po každém pětiminutovém kroku;
- průběžné sledování dokončení kroků a jejich trvání.

Vynucení je **poradní**: kontrola upozorňuje na odchylky napříč agenty a pracovními postupy, ale commit neblokuje. Příbuzný protokol proti zkratkám, který dokumentace spojuje s agentem ARCHER SUPREME, pracuje s delším limitem pro celé úlohy a s trojím zanořením úkolů (úloha, dílčí úlohy, mikroúlohy); viz [Archer Supreme](@/glossary/archer-supreme.md).

V praxi se pilíř projevuje plánem práce, který místo jedné položky „přidat ověřování zdrojů“ obsahuje řadu drobných kroků: přečíst stávající modul, napsat jeden test, upravit jednu funkci, spustit testy, zapsat výsledek. U každého kroku je vidět, zda skončil, jak dlouho trval a co z něj vzešlo.

## Mechanismus: proč takové pravidlo existuje

Velké, neohraničené úkoly svádějí k odkládání, k dlouhému plánování bez výsledku a k chybám, které se objeví až pozdě. Malé kroky s jasným koncem dávají rychlou zpětnou vazbu, dovolují včas zjistit, že se postup ubírá špatným směrem, a usnadňují navázání po přerušení. M5M je tak obranou proti stavu, který glosář popisuje jako [paralysis by analysis](@/glossary/paralysis-by-analysis.md).

Strukturálně působí pilíř čtyřmi mechanismy:

1. **Zkrácení zpětné vazby** – čím kratší krok, tím dříve se ukáže, zda funguje.
2. **Lokalizace chyby** – selže-li krok, je zřejmé, kde hledat příčinu.
3. **Snížení kognitivní zátěže** – v pracovní paměti stačí udržet jeden malý cíl.
4. **Pravidelné zastavení** – povinná pauza vytváří okamžik, kdy se lze podívat na celek a zeptat se, zda práce stále směřuje k cíli.

## Odlišení

M5M se liší od [Session Discipline](@/glossary/session-discipline.md) tím, že kázeň relace se týká toho, jak se práce zapisuje a odesílá, kdežto M5M toho, jak velké jsou jednotlivé kroky. Od protokolu spojeného s agentem Archer Supreme se liší úrovní: Archer Supreme ohraničuje celé úlohy a jejich zanoření, M5M jednotlivé kroky uvnitř nich.

Pilíř je také třeba odlišit od mikromanagementu. Je pravidlem pro plánování vlastní práce a práce agentů, ne nástrojem dohledu nad lidmi; měření trvání kroků slouží k odhalení zaseknutí, ne k hodnocení výkonu. A rozdělení na malé kroky neznamená povrchnost – naopak vyžaduje, aby byl celek promyšlen předem, jinak se kroky nedají správně vymezit. Kahneman připomíná, že plány se soustavně podceňují, pokud se odhadují zevnitř, z pohledu jednotlivých kroků, bez srovnání s podobnými celky (Kahneman 2011); malé kroky proto potřebují i pohled zvnějšku.

## Význam pro Kompendium

M5M přímo není pojmem knihy a nemá v ní roli diagnostického ani terapeutického pravidla. Interpretačně však má blízko k několika jejím tématům:

- **dekompozice jako obrana proti zahlcení** – stejně jako se v softwaru velký úkol rozkládá na kroky, doporučuje kniha při [informačním přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) a [inferenční paralýze](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) vracet se k jedné otázce a jednomu kroku;
- **stabilizace v malých krocích** – protokoly akutní fáze zotavení (např. [akutní kognitivní ukotvení](@/kompendium/recovery-protocols/acute-cognitive-anchoring.md)) pracují s krátkými, zvládnutelnými úkony a s pravidelnými pauzami;
- **pravidelná přestávka** – zásada odpočinku po soustředěné práci se objevuje i v kapitolách o péči o profesionály.

M5M zmiňují heslo [paralysis by analysis](@/glossary/paralysis-by-analysis.md) v souvislosti s rozhodovací paralýzou a [most k pojmu 3NL](@/kompendium/glossary-bridges/bridge-3nl.md), podle něhož patří M5M spolu s 3NL, NMND a NWB mezi první pilíře doktríny.

Paralela s klinickou praxí má oporu v traumatologii. Judith Herman popsala zotavení z traumatu jako postup, jehož prvním stadiem je bezpečí a stabilizace, a teprve pak přichází zpracování vzpomínek a obnova vztahů (Herman 1992). Ve fázi stabilizace se pracuje s malými, opakovatelnými úkony, které člověku vracejí pocit, že něco zvládne a dokončí. Pojem „okno tolerance“ (Siegel 1999) zase popisuje pásmo vzrušení, v němž je člověk schopen přemýšlet a učit se; krátké kroky a pauzy pomáhají v tomto pásmu zůstat.

Obecný příklad (kompozit): muž po letech v prostředí s vysokou mírou kontroly nedokáže vyřídit žádnou úřední záležitost; každý dopis vyvolá zahlcení a odklad. Sociální pracovnice s ním místo úkolu „vyřídit dávky“ sestaví řadu drobných kroků – otevřít obálku, přečíst první odstavec, podtrhnout datum, zavolat na jedno číslo – s přestávkou po každém. Délku kroků neurčují hodiny, ale to, kdy zahlcení roste. Po několika týdnech zvládá delší úseky sám.

## Obrana a zotavení

Z principu malých kroků si lze vzít několik obecných zásad, které nepotřebují pevný časový limit:

- **Jedna otázka najednou** – při zahlcení informacemi si zapsat jedinou otázku, na kterou chci teď odpovědět, a ostatní odložit na papír.
- **Krok s viditelným koncem** – volit úkony, u nichž je jasné, kdy jsou hotové; dokončení je samo o sobě stabilizující.
- **Pauza jako součást práce** – přestávka není selhání, ale místo, kde se ověří směr.
- **Pro profesionály:** plánovat intervenci v krocích, které klient dokáže sám vyhodnotit, a tempo přizpůsobovat jeho stavu, ne plánu.

## Meze přenosu

Pevný pětiminutový limit je provozní pravidlo pro práci se softwarem a s automatizovanými agenty. Na terapeutickou práci, na zpracování traumatu ani na rozhovor s klientem se mechanicky přenášet nedá: tam má tempo určovat stav člověka, ne hodiny. Kompendium z M5M přebírá jen obecnou myšlenku, že zahlcení se zvládá rozdělením na menší, uchopitelné kroky.

Dekompozice má i své riziko: člověk, který se soustředí jen na nejbližší krok, může ztratit ze zřetele, kam celek směřuje. V prostředí manipulace se toho dá zneužít – řada malých, jednotlivě nevinných ústupků může vést k výsledku, který by člověk jako celek odmítl. Malé kroky proto potřebují pravidelný pohled na celek.

## Literatura

- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books – stadia zotavení, stabilizace jako první fáze.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.
- Siegel, D. J. (1999). *The Developing Mind*. Guilford Press – pojem okna tolerance.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Archer Supreme](@/glossary/archer-supreme.md) – agent, s nímž je spojen protokol proti zkratkám.
- [Session Discipline](@/glossary/session-discipline.md) – kázeň pracovní relace.
- [3NL](@/glossary/three-nested-loops.md) – architektonický pilíř, s nímž se M5M uvádí.

**Kniha**

- [Paralysis by Analysis](@/glossary/paralysis-by-analysis.md) – paralýza z nadměrné analýzy.
- [Inferenční paralýza (EA-5.1.16)](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) – neschopnost dospět k závěru.
- [Informační přetížení (EA-1.1.2)](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – zahlcení, proti němuž pomáhá dekompozice.
- [Akutní kognitivní ukotvení](@/kompendium/recovery-protocols/acute-cognitive-anchoring.md) – malé kroky ve stabilizaci.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
