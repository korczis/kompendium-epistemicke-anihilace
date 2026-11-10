+++
title = "Gray Team a okrajové případy v detekci EA"
description = "Jak Gray Team Prismatic Platform pouze čtením hledá mezery ve specifikacích, okrajové případy a drift možností – a proč nejednoznačnost je místem, kde se manipulace i omyl rodí nejsnáz."
weight = 15

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "color-teams"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["red-team-ea-detection", "blue-team-ea-defense", "purple-team-ea-synthesis", "white-team-ea-verification", "compliance-ea-regulatory-screening"]
toc = true
+++

# Gray Team a okrajové případy v detekci EA

[Gray Team](@/glossary/gray-team.md) (šedý tým) je součástí [barevných týmů](@/glossary/color-teams.md) Prismatic Platform, softwarové platformy, z níž kniha vzešla. Působí v nejranější fázi toku signálů mezi týmy a jeho činnost je **výhradně čtecí**: hledá mezery ve specifikacích, okrajové případy a takzvaný drift možností, tedy postupné odchýlení skutečných schopností systému od zamýšlených. Nic neopravuje, nic nezneužívá a nálezy netřídí na dobré a špatné; katalogizuje nejednoznačnost. Tato stránka popisuje, jak Gray Team souvisí s taxonomií epistemických útoků (EA) a proč je jeho přístup – hledat místa, kde pravidla nic neříkají – užitečný i pro lidské instituce.

## Agent v kostce

Podle hesla glosáře tvoří Gray Team v době zápisu tři agenti: velitel s oprávněním L3, který plánuje průzkum a směruje nálezy dalším týmům, specialista L4 na analýzu hranic a mezer ve specifikaci a bezpečnostně kritický strážce L4, který může zastavit jakoukoli operaci, jež by se blížila území vyhrazenému jiným týmům. Glosář vysvětluje výchozí poznatek, z něhož tým vychází: nejzávažnější zranitelnosti často neleží v kódu, který je zjevně chybný, ale ve specifikacích, které jsou nejednoznačné. Funkce, která „má validovat vstup“, nemusí určovat, co se stane se vstupem prázdným, částečně platným nebo nejednoznačně zakódovaným.

Omezení na čtení je podle glosáře bezpečnostním opatřením i filosofickým postojem. Tím, že Gray Team mezeru jen popíše a nerozhoduje, zda je chybou, nebo záměrem, zachovává axiom [zachování rozporu](@/glossary/nabla-axioms.md): mezera může být zranitelností, funkcí, nebo obojím. Rozhodnutí přísluší dalším týmům.

## Proč se týká technik EA

Mnoho technik popsaných v knize nepůsobí tím, že by porušovaly pravidla, ale tím, že využívají prostor, o němž pravidla mlčí. [Motte and bailey](@/glossary/motte-and-bailey.md) stojí na nejednoznačnosti mezi silným a slabým výkladem téhož tvrzení; [terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) na nejasnosti pojmů; [posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md) na tom, že hranice mandátu nebyly nikdy přesně stanoveny. V institucích se podobně uplatňují mezery v řádech a předpisech – například když nikde není určeno, kdo smí rozhodnout o změně školitele nebo kdo přezkoumá rozhodnutí vedoucího.

Druhou souvislostí je **drift**. Glosář popisuje drift možností jako stav, kdy se schopnosti systému postupně odchylují od zamýšlených nahromaděním drobných změn, z nichž žádná sama nespustí revizi. Dekker (2011) popsal obdobný proces v organizacích jako „sklouzávání k selhání“. Kniha jej zná z lidské roviny: posun od náročného vedení ke kontrole, od pevných pravidel ke [kontrole času](@/kompendium/techniques/ea-2-2-6-time-control-academic.md), od důvěry k závislosti probíhá po malých krocích.

## Jak pracuje

Gray Team prochází specifikace, konfigurace a chování systému a hledá čtyři druhy nálezů: mezery ve specifikaci, okrajové případy, hraniční podmínky a drift možností. Metodicky navazuje na postupy bezpečnostního inženýrství, které se neptají jen „selhala součást?“, ale „jaké interakce a omezení systému selhání umožnily“; Leveson (2011) tento přístup rozpracovala jako systémovou teorii bezpečnosti. Analýza hraničních hodnot je zase klasickou technikou testování, která vychází z toho, že chyby se soustřeďují na okrajích povolených rozsahů.

Nálezy Gray Team směruje podle povahy: mezery ve specifikaci obvykle k [Red Teamu](@/kompendium/aiad-integration/red-team-ea-detection.md) k posouzení, okrajové případy k [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md), dilemata klasifikace k [Purple Teamu](@/kompendium/aiad-integration/purple-team-ea-synthesis.md). Původní verze této stránky zdůrazňuje i jeho úlohu při případech, které nelze jednoznačně klasifikovat – kdy tentýž obsah může být legitimním výzkumem, satirou nebo manipulací podle kontextu – a navrhuje pro ně odstupňované označení místo binárního „škodlivé/neškodné“.

## Spolupráce s dalšími agenty

Gray Team stojí na začátku toku signálů barevných týmů. Jeho nálezy jsou vstupem pro [Red Team](@/kompendium/aiad-integration/red-team-ea-detection.md), [Blue Team](@/kompendium/aiad-integration/blue-team-ea-defense.md) a [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md); sporné případy předává [White Teamu](@/kompendium/aiad-integration/white-team-ea-verification.md) a regulatorní otázky [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md). Formální mezery ve specifikaci jsou zároveň podnětem pro konstruktivní ověřování, protože důkaz správnosti chrání jen to, co specifikace výslovně obsahuje.

## Příklad

Pravidlo platformy říká, že tvrzení s nízkou mírou důvěry se nesmí použít jako podklad doporučení. Gray Team si při čtení specifikace všimne, že pravidlo neurčuje, co se stane, když se doporučení skládá z mnoha tvrzení, z nichž každé má důvěru těsně nad prahem. Žádné jednotlivé tvrzení pravidlo neporušuje, ale souhrnný závěr může být mnohem méně jistý, než naznačuje kterákoli jeho část. Gray Team nález zapíše jako mezeru ve specifikaci, nerozhoduje, zda jde o chybu, a předá jej dál. [Purple Team](@/glossary/purple-team.md) pak rozhodne, zda se pravidlo upraví.

Lidskou obdobou je situace, kterou kniha popisuje u [iluzorní komplexity](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) a [informačního přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md): řada jednotlivě přijatelných kroků vede k závěru, který by v celku nikdo nepřijal. Obranou je klást otázku na celek, nikoli jen na jednotlivé kroky.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře shrnuje, proč je Gray Team pro knihu vzorem: hledá nejednoznačnosti, které manipulace zneužívá. Pro organizace z toho plyne praktický postup – projít vlastní pravidla s otázkou, kde mlčí. Kdo rozhoduje, když vedoucí a podřízený popisují tutéž událost odlišně? Kam se může obrátit student, jehož školitel je zároveň předsedou komise? Co se stane se stížností, která se týká člověka s nejvyšší pravomocí? Odpovědi vedou k nástrojům, které kniha popisuje v [obraně organizací](@/kompendium/organizational-defense/_index.md), například k [revizím politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) a k [oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md).

Pro jednotlivce je přenositelný princip **pojmenovat nejednoznačnost, aniž by se hned rozhodovalo**. Člověk, který si všimne, že pravidla v jeho vztahu nebo skupině jsou nejasná a mění se podle potřeby jedné strany, nemusí hned vědět, zda jde o manipulaci. Užitečné je nejprve si nejednoznačnost zapsat a sledovat ji v čase – postup, který kniha rozvádí v [časově odloženém hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md) a v [paměťovém archivu](@/kompendium/self-defense-guides/43-memory-archive.md).

Konečně Gray Team připomíná, že ne každá nejednoznačnost je hrozbou. Kontext rozhoduje o tom, zda je tentýž text satirou, výzkumem, nebo manipulací, a odstupňované hodnocení je poctivější než binární nálepka. Kniha totéž zdůrazňuje v [kritice rizika falešné pozitivity](@/kompendium/critical-perspectives/5-false-positive-risk.md).

## Proč jen číst

Omezení na čtení se může zdát jako slabina: tým, který vidí problém, ho nesmí opravit. Ve skutečnosti chrání dvě věci. Zaprvé brání tomu, aby se hledání mezer samo stalo zdrojem rizika – kdo smí měnit, co zkoumá, může nevědomky vytvořit nové mezery. Zadruhé odděluje pozorování od rozhodnutí, a tím zabraňuje předčasnému uzavření nejednoznačnosti ve prospěch toho, kdo ji zkoumá. Stejné oddělení doporučuje kniha posuzovatelům: kdo vyšetřuje stížnost, neměl by být tím, kdo rozhoduje o jejím výsledku, a kdo dokumentuje průběh terapie, neměl by jej zároveň hodnotit bez supervize (srov. [supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)).

## Meze a otevřené otázky

Gray Team je pomalejší než automatické kontroly, protože jeho práce vyžaduje pečlivé čtení a úsudek. Nálezy mají často podobu otázek, nikoli odpovědí, a jejich hodnota závisí na tom, zda je další týmy zpracují. Drift je obtížně měřitelný, protože každý výchozí stav je sám výsledkem minulých změn. Údaje o složení týmu se uvádějí jako stav v době zápisu.

## Literatura

- Dekker, S. (2011). *Drift into Failure: From Hunting Broken Components to Understanding Complex Systems*. Farnham: Ashgate.
- Leveson, N. G. (2011). *Engineering a Safer World: Systems Thinking Applied to Safety*. Cambridge, MA: MIT Press.

## Související

**Barevné týmy**

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – přebírá mezery ve specifikaci.
- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – rozhoduje o dilematech klasifikace.
- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – ověřuje sporné případy.

**Pojmy**

- [Gray Team](@/glossary/gray-team.md) – heslo glosáře.
- [Motte and bailey](@/glossary/motte-and-bailey.md) – manipulace stojící na nejednoznačnosti.

**Kniha**

- [Posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md) – drift v lidské komunikaci.
- [Revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) – hledání mezer v pravidlech.
- [Riziko falešné pozitivity](@/kompendium/critical-perspectives/5-false-positive-risk.md) – proč nejednoznačnost není důkaz.
