+++
title = "Red Team a detekce technik EA"
description = "Jak Red Team Prismatic Platform v izolovaném prostředí simuluje epistemické útoky popsané v knize, aby prověřil obranu – a co z principu řízeného protivníka plyne pro čtenáře."
weight = 10

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "color-teams"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["blue-team-ea-defense", "purple-team-ea-synthesis", "white-team-ea-verification", "gray-team-ea-edge-cases", "black-team-ea-modeling"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Red Team a detekce technik EA

Tato stránka patří do oddílu [AIAD integrace](@/kompendium/aiad-integration/_index.md), který popisuje, jak agenti Prismatic Platform – softwarové platformy, z níž kniha vzešla – pracují s taxonomií epistemických útoků (EA). [Red Team](@/glossary/red-team.md) je jedním ze šesti [barevných týmů](@/glossary/color-teams.md) platformy. Jeho úkolem je hrát roli protivníka: v izolovaném prostředí simulovat útoky na integritu znalostních systémů platformy, aby se ukázalo, zda je obrana dokáže zachytit. Stránka popisuje, jak Red Team s taxonomií knihy zachází, s kým spolupracuje, kde jsou jeho meze a co z jeho principu plyne pro čtenáře, který s platformou nikdy pracovat nebude.

## Agent v kostce

Podle hesla glosáře je Red Team jednotkou útočné simulace v architektuře barevných týmů, jejichž společným cílem je epistemická bezpečnost – schopnost platformy utvářet přesná přesvědčení a odolávat manipulaci svých znalostních systémů. Red Team tvoří v době zápisu čtyři agenti v hierarchické velitelské struktuře. Simuluje útoky pomocí pěti definovaných primitiv a scénáře odvozuje z taxonomie útoků platformy. Všechny operace běží v sandboxu se syntetickými daty a bez síťového přístupu, takže simulace nemohou zasáhnout produkční systémy ani skutečná data. Glosář [barevných týmů](@/glossary/color-teams.md) dále uvádí, že činnost všech týmů je výhradně simulační a že probíhají průběžné etické kontroly.

Tradice red teamingu je starší než software. Zenko (2015) popisuje, jak vojenské, zpravodajské i firemní organizace zavádějí vyhrazené týmy, jejichž jediným úkolem je myslet jako protivník a hledat slabiny vlastních plánů a obrany. Epistemický red teaming, jak jej pojímá platforma, tuto tradici přenáší z infrastruktury na proces uvažování: necílí na síť a aplikace, ale na to, jak systém tvoří a ověřuje přesvědčení.

## Proč se týká technik EA

Taxonomie knihy je pro Red Team katalogem vzorců, proti nimž se má obrana platformy osvědčit. Technika jako [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) má na straně softwaru obdobu v podvržení jednostranného souboru zdrojů; [imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) v tvrzení, které je formulováno tak, aby obstálo v každé kontrole; [pseudokonsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) ve zdánlivé shodě mnoha zdrojů se společným původem. Red Team tyto vzorce převádí do simulovaných scénářů na úrovni struktury a sleduje, zda je obranné vrstvy zachytí.

Důležité je, co tento vztah neznamená. Red Team nepoužívá knihu jako sbírku návodů a kniha mu žádné návody neposkytuje: popisuje mechanismy strukturálně, s detekcí a obranou. Pro simulaci stačí struktura – například „tvrzení bez dohledatelného původu podepřené mnoha opakováními“ –, protože obrana platformy kontroluje právě strukturní vlastnosti přesvědčení, nikoli rétoriku.

## Jak pracuje

Podle popisu na původní verzi této stránky probíhá činnost Red Teamu v opakovaných cyklech se třemi fázemi: mapováním ploch, kde by obrana mohla selhat, generováním simulovaných scénářů z taxonomie a předáním nálezů k syntéze. Sledují se zejména čtyři otázky: jak rychle obranná vrstva zareaguje, kolik simulovaných útoků projde nezachyceno, jak hluboko se nezachycený útok dostane procesem a jak dlouho trvá návrat do bezpečného stavu. Každý krok je zaznamenán v telemetrii a rozhodnutí jsou dohledatelná v důkazním řetězci platformy (srov. [most NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md)).

Metodicky se tento postup podobá strukturovanému modelování hrozeb, jak je popisuje Shostack (2014): systematicky projít, kde a jak může systém selhat, a pro každé selhání stanovit, jak se má projevit a jak se mu brání. Taxonomie útočných technik a jejich mapování na obranu je obvyklou praxí i v klasické kybernetické bezpečnosti, kde se k tomu používá znalostní báze MITRE ATT&CK (Strom et al. 2018); platforma k ní podle hesla glosáře odkazuje jako k jednomu ze standardů.

## Spolupráce s dalšími agenty

Red Team nepracuje izolovaně. Jeho nálezy přebírá [Blue Team](@/kompendium/aiad-integration/blue-team-ea-defense.md), který podle nich upravuje obranu, a [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md), který má výhradní pravomoc rozhodnout, zda je nález uzavřen – tedy zda byla obrana skutečně opravena, a ne jen vzata na vědomí. Podle glosáře barevných týmů teče signál od [Gray Teamu](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md), který hledá mezery ve specifikacích, přes Red Team k Purple Teamu a dál k Blue Teamu. [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md) dodává konstruktivní důkazy, že opravené vlastnosti drží. Narazí-li Red Team na vzorec, který taxonomie dosud nepopisuje, eskaluje jej na úroveň strategické koordinace, například na [Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md).

## Co z toho plyne pro čtenáře knihy

Pro klinika, vyšetřovatele nebo právníka je Red Team zajímavý jako princip, ne jako software. Princip zní: obranu nelze považovat za funkční, dokud nebyla vystavena řízenému pokusu ji obejít. V lidských institucích se tento princip uplatňuje jako předběžná analýza selhání – Klein (2007) navrhl „premortem“, při němž tým před spuštěním projektu předpokládá, že projekt selhal, a hledá důvody. Pro organizaci, která chce být odolná vůči technikám popsaným v knize, to znamená ptát se, jak by její rozhodovací procesy mohl obejít člověk, který zná [techniky delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) – a podle odpovědí upravit [rozhodovací dohledatelnost](@/kompendium/organizational-defense/21-decision-traceability.md) nebo [mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md).

Druhý přenositelný princip je **izolace a abstrakce**. Red Team pracuje se syntetickými daty a v uzavřeném prostředí, protože i simulace útoku nese riziko. Kniha uplatňuje obdobnou zásadu ve výuce: [vzdělávací scénáře](@/kompendium/educational-scenarios/_index.md) pracují s modelovými situacemi a strukturálními popisy, nikoli se skutečnými lidmi a postupy. Kdo připravuje výcvik rozpoznávání manipulace, má se řídit stejnou logikou.

## Etický rámec simulace

Útočná simulace je činnost dvojího použití: znalost, jak obranu obejít, může sloužit k její opravě i k jejímu zneužití. Debata o výzkumu dvojího použití, jak ji shrnula zpráva Národní rady pro výzkum USA o biotechnologickém výzkumu (National Research Council 2004), doporučuje v takových případech kombinovat technická omezení, institucionální dohled a omezení podrobnosti zveřejňovaných výsledků. Platforma tyto prvky uplatňuje izolací v sandboxu, syntetickými daty a průběžnými etickými kontrolami; kniha totéž uplatňuje strukturálním popisem mechanismů a přístupovými úrovněmi (viz [bezpečnostní klasifikace](@/kompendium/01-predmluva/bezpecnostni-klasifikace.md) a příloha o [dvojí použitelnosti](@/kompendium/08-prilohy/dual-use.md)). Výsledky Red Teamu se proto ani v knize nepopisují jako postupy, jen jako zjištění o tom, kde obrana potřebovala posílit.

## Meze a otevřené otázky

Red Team je epistemicky vázán na existující taxonomii: vzorce, které taxonomie nepopisuje, simuluje jen tehdy, když je předem identifikuje [Gray Team](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) nebo [Black Team](@/kompendium/aiad-integration/black-team-ea-modeling.md). Není auditorem skutečného provozu, ale simulátorem; to, že simulovaný útok neprošel, neznamená, že neprojde žádný skutečný. Tato asymetrie je obecnou vlastností testování, kterou formuloval Dijkstra (1972): testování může ukázat přítomnost chyb, nikoli jejich nepřítomnost. Pro knihu z toho plyne stejná pokora: absence nalezené manipulace není důkazem, že k ní nedošlo. Konečně, údaje o složení týmu a o taxonomii útoků se mohou s vývojem platformy měnit; uvádějí se proto jen jako stav v době zápisu.

## Literatura

- National Research Council (2004). *Biotechnology Research in an Age of Terrorism*. Washington, DC: National Academies Press.
- Dijkstra, E. W. (1972). The humble programmer. *Communications of the ACM*, 15(10), 859–866.
- Klein, G. (2007). Performing a project premortem. *Harvard Business Review*, 85(9), 18–19.
- Shostack, A. (2014). *Threat Modeling: Designing for Security*. Indianapolis: Wiley.
- Strom, B. E., Applebaum, A., Miller, D. P., Nickels, K. C., Pennington, A. G., & Thomas, C. B. (2018). *MITRE ATT&CK: Design and Philosophy*. McLean, VA: The MITRE Corporation.
- Zenko, M. (2015). *Red Team: How to Succeed by Thinking Like the Enemy*. New York: Basic Books.

## Související

**Barevné týmy**

- [Blue Team a obrana proti EA](@/kompendium/aiad-integration/blue-team-ea-defense.md) – přebírá nálezy a staví obranu.
- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – rozhoduje o uzavření nálezů.
- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – dokládá, že oprava drží.
- [Gray Team a okrajové případy](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) – hledá mezery, z nichž Red Team vychází.

**Pojmy**

- [Red Team](@/glossary/red-team.md) – heslo glosáře s podrobnostmi o týmu.
- [Color Teams](@/glossary/color-teams.md) – architektura šesti týmů.
- [Epistemic Security](@/glossary/epistemic-security.md) – co týmy chrání.

**Kniha**

- [Základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) – zdroj vzorců pro simulaci.
- [Vzdělávací scénáře](@/kompendium/educational-scenarios/_index.md) – lidská obdoba řízené simulace.
