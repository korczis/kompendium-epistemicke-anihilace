+++
title = "Bridge: Red Team (červený tým)"
description = "Most mezi heslem Red Team a knihou: simulace protivníka jako nástroj obrany, pět primitiv útoku na poznání a jejich lidské obdoby, vždy spolu s detekcí a mezemi."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "red-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["red-team", "blue-team", "purple-team", "color-teams", "bridge-black-team", "bridge-gray-team"]
glossary_target = "red-team"
toc = false
+++

# Bridge: Red Team (červený tým)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Red Team](@/glossary/red-team.md) (červený tým) je v architektuře [barevných týmů](@/glossary/color-teams.md)
platformy Prismatic, z níž kniha vzešla, jednotka, která simuluje útoky s cílem odhalit zranitelnosti
systémů, procesů a epistemické obrany. Pojem pochází z vojenských cvičení, v nichž vyhrazená „červená“
síla hrála protivníka proti bránícím se „modrým“, a stal se základem kybernetické bezpečnosti. Platforma
ho podle hesla glosáře rozšiřuje na **epistemickou bezpečnost**: cílem útoku není jen síť, ale integrita
znalostních systémů, postupů uvažování a rozhodování. Výsledky červeného týmu přebírá
[Blue Team](@/glossary/blue-team.md), který staví obranu, a [Purple Team](@/glossary/purple-team.md),
který obě strany propojuje.

Heslo glosáře uvádí pět *primitiv* útoku na znalostní systémy: zkreslení pravdy, manipulaci důvěry,
otrávení signálů, navození posunu a únos výraznosti. Pro knihu jsou užitečnou mřížkou, protože každé
má lidskou obdobu, kterou kniha popisuje – vždy spolu s detekcí a obranou.

## Pojem v jeho vlastním oboru

Smyslem červeného týmu je překonat slepotu vlastní perspektivy. Zenko (2015) shrnul zkušenosti z armády,
zpravodajských služeb a firem: organizace, které si nechávají své plány soustavně zpochybňovat
nezávislým týmem, odhalují chyby, které by jinak přehlédly, ale jen tehdy, má-li tým skutečnou
nezávislost a vedení jeho výsledky bere vážně. Ve zpravodajské analýze jsou techniky „ďáblova advokáta“
a analýzy z pohledu protivníka součástí strukturovaných analytických metod (Heuer 1999; Heuer a Pherson
2010), které mají čelit kognitivním zkreslením analytika. Janis (1982) doporučoval obdobná opatření
jako ochranu proti skupinovému myšlení.

Podstatné je, že červený tým pracuje **s povolením a v hranicích**. Heslo glosáře popisuje, že eskalační
stráž [šedého týmu](@/glossary/gray-team.md) může zastavit kteroukoli operaci, která by se rozšiřovala
mimo hranice testování, a že tým nesmí normalizovat stále agresivnější vzorce útoku.

## Analogie, kterou kniha činí

Heslo glosáře přiřazuje primitivům lidské obdoby. **Zkreslení pravdy** – nepatrná úprava faktů, která
projde povrchní kontrolou – odpovídá [gaslightingu](@/kompendium/glossary-bridges/bridge-gaslighting.md),
v němž se drobnými změnami vyprávění podkopává důvěra v paměť. **Manipulace důvěry** – nadsazení nebo
podhodnocení jistoty beze změny faktů – odpovídá technikám, které člověku vnucují přehnanou jistotu nebo
naopak ochromující pochybnost; viz [EA-2.5.3 Kultivace sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md).
**Otrávení signálů** – zdání shody nezávislých zdrojů vytvořené jedním aktérem – odpovídá koordinovaným
kampaním a botům; viz [Bridge: Firehose of Falsehood](@/kompendium/glossary-bridges/bridge-firehose-of-falsehood.md)
a detekční signaturu [Koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md).
**Navození posunu** – podprahové změny, které se sčítají – odpovídá postupné eskalaci nároků v
manipulativních vztazích a skupinách. **Únos výraznosti** – řízení toho, čemu člověk věnuje pozornost –
odpovídá [EA-1.1.1 Selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md).

Kniha z červeného týmu přebírá také metodickou zásadu: **chcete-li se bránit, musíte rozumět útoku –
ale popisovat ho jen jako rozpoznatelný vzorec**. Heslo glosáře výslovně uvádí, že Kompendium tento
princip uplatňuje pro vlastní obsah a mechanismy popisuje jen spolu s detekcí a obranou, nikdy jako
postup; viz [1.3 Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md).

## Kde se pojem v knize vyskytuje

Platformní použití popisuje stránka [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md),
navazující obranu [Blue Team a obrana](@/kompendium/aiad-integration/blue-team-ea-defense.md) a syntézu
[Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md). Lidskou obdobu
„červeného týmu“ v analytické práci – soustavné zpochybňování vlastní hypotézy – popisují stránky
[EA × Due Diligence: Prevence systémového konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)
a [EA × Security: Atribuce](@/kompendium/cross-domain/23-ea-security-attribution-bias.md). Výukovou
podobu simulace – nácvik rozpoznání v chráněném prostředí – nabízejí [vzdělávací scénáře](@/kompendium/educational-scenarios/_index.md).

## Od pojmu k praxi

### Rozpoznání: legitimní a zneužité „testování“

Legitimní červený tým se pozná podle povolení, hranic a odpovědnosti: ti, jejichž systém se testuje,
o testu vědí (alespoň na úrovni vedení), existují pravidla, kdy se test zastaví, a výsledky slouží
obraně. Zneužitá podoba „testování“ se v lidských vztazích objevuje jako zkoušení loajality, provokace
„abych viděl, jak zareaguješ“ nebo záměrné vyvolávání nejistoty pod záminkou, že druhého „posiluje“.
Chybí v ní souhlas, hranice i prospěch toho, kdo je testován.

### Odlišení

Kritika a zpochybňování nejsou samy o sobě útokem. Dobrý oponent, recenzent nebo supervizor plní roli
červeného týmu v nejlepším smyslu: hledá slabiny, aby práce obstála. Rozdíl je v cíli – zlepšit, nebo
ponížit – a v symetrii: legitimní kritik se nechá sám zpochybnit a jeho kritika se týká práce, ne osoby.
Kniha tento rozdíl rozebírá u scénáře [Destruktivní „konstruktivní“ kritika](@/kompendium/03-zakladni-kategorie/scenar-h.md).

### Obrana

Pro analytiky, vyšetřovatele a kliniky je obranou vlastní „červený tým“: předem si zapsat, co by jejich
hypotézu vyvrátilo, nechat ji posoudit někým, kdo na ní nepracoval, a soustavně hledat alternativní
výklady. Klein (2007) navrhl techniku *premortem*: před rozhodnutím si představit, že projekt selhal, a
hledat důvody. Pro jednotlivce je obdobou příručka [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md).

### Rámec pro profesionály: simulace s lidmi

Kniha upozorňuje, že simulace manipulace s lidmi – ve výzkumu nebo výcviku – podléhá přísnějším pravidlům
než testování softwaru. Vyžaduje [informovaný souhlas](@/glossary/informed-consent.md), předem stanovená kritéria ukončení, možnost kdykoli
odstoupit a důkladný debriefing; viz [EA-4.1.7 Kritéria ukončení](@/kompendium/techniques/ea-4-1-7-termination-criteria.md),
[EA-4.2.6 Odvolání souhlasu](@/kompendium/techniques/ea-4-2-6-consent-withdrawal.md) a
[Debriefingový protokol](@/kompendium/research-methodology/debriefing-protocol-research.md).

## Časté omyly

Prvním omylem je myslet si, že červený tým je „útočníkem“ v morálním smyslu. Je nástrojem obrany a jeho
hodnota stojí na tom, že pracuje s povolením a pro obránce. Druhým omylem je domnívat se, že stačí
červený tým mít; bez ochoty vedení slyšet nepříjemné výsledky je jen rituálem. Třetím omylem je
přenášet do lidských vztahů logiku „testování odolnosti“ – u lidí bez souhlasu se taková praxe stává
sama formou manipulace.

## Příklad (anonymizovaný kompozit)

Analytický tým připravuje posudek o tom, zda kampaň na sociálních sítích proti místní neziskové
organizaci je koordinovaná. Vedoucí určí dvě kolegyně, aby hrály „červený tým“ a hledaly nejsilnější
argumenty pro opačný závěr – že jde o spontánní reakci veřejnosti. Jejich námitky odhalí, že část údajně
koordinovaných účtů patří skutečným lidem z obce. Posudek je nakonec opatrnější a přesnější: rozlišuje
koordinované jádro od spontánní vlny, která se k němu přidala.

## Meze a otevřené otázky

Červený tým odhalí jen to, co si dokáže představit; neznámé způsoby útoku zůstávají mimo jeho dosah.
Otevřenou otázkou je, jak testovat odolnost lidí a institucí vůči manipulaci, aniž by test sám
způsoboval škodu, a jak zajistit, aby se poznatky červeného týmu nestaly návodem. Kniha tuto mez řeší
tím, že primitiva popisuje na úrovni struktury, a otevřeně přiznává, že úplné bezpečí neexistuje.

## Literatura

- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Center for the Study of Intelligence, CIA.
- Heuer, R. J., & Pherson, R. H. (2010). *Structured Analytic Techniques for Intelligence Analysis*. CQ Press.
- Janis, I. L. (1982). *Groupthink: Psychological Studies of Policy Decisions and Fiascoes* (2nd ed.). Houghton Mifflin.
- Klein, G. (2007). Performing a project premortem. *Harvard Business Review*, 85(9), 18–19.
- Zenko, M. (2015). *Red Team: How to Succeed by Thinking Like the Enemy*. Basic Books.

## Související

**Glosář**

- [Red Team](@/glossary/red-team.md) – heslo, které tento most propojuje s knihou.
- [Blue Team](@/glossary/blue-team.md) – obrana, která výsledky přebírá.
- [Purple Team](@/glossary/purple-team.md) – syntéza útoku a obrany.

**Kniha**

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – použití v kontextu EA.
- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – lidská obdoba únosu výraznosti.
- [EA-4.1.7 Kritéria ukončení](@/kompendium/techniques/ea-4-1-7-termination-criteria.md) – hranice simulací s lidmi.
- [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md) – vlastní „červený tým“.

**Sesterské mosty**

- [Bridge: Black Team](@/kompendium/glossary-bridges/bridge-black-team.md) – abstraktní modelování hrozeb.
- [Bridge: Gray Team](@/kompendium/glossary-bridges/bridge-gray-team.md) – mezery a drift.
- [Bridge: Gaslighting](@/kompendium/glossary-bridges/bridge-gaslighting.md) – lidská obdoba zkreslení pravdy.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Red Team (červený tým)](@/glossary/red-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
