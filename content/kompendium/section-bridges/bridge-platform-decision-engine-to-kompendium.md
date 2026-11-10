+++
title = "Most: Decision Engine platformy → Kompendium"
description = "Co má rozhodovací engine Prismatic Platform společného s knihou: kalibrace důvěry, soupeřící hypotézy s kritérii vyvrácení, pluralita zdrojů a audit – a co z toho plyne pro lidský úsudek."
weight = 38

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace", "prismatic", "decision-engine"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-platform-nabla-to-kompendium", "bridge-01-to-02-predmluva-uvod", "bridge-03-to-07-techniky-teorie", "bridge-techniques-to-glossary"]
parent = "kompendium-section-bridges"
toc = false
+++

# Most: Decision Engine platformy → Kompendium

> **Z:** platformový [Decision Engine](@/glossary/decision-engine.md) → **Do:** [Kompendium](@/kompendium/_index.md), zejména [2.7 Vztah ke Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md)
> **Druh mostu:** mezi softwarovým prostředím, z něhož kniha vzešla, a obsahem knihy.

Kniha vznikla v prostředí Prismatic Platform, softwarové platformy pro rozhodovací podporu, [zpravodajství z otevřených zdrojů](@/glossary/osint.md) a prověrky protistran. Jednou z jejích ústředních součástí je rozhodovací engine (*Decision Engine*): podle popisu v kapitole [Vztah ke Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) je to deterministický proces o deseti krocích, který převádí strukturovaný vstup – texty, aktéry, důkazy – na rozhodnutelný výstup s vyjádřenou mírou důvěry, soupeřícími hypotézami a vysvětlitelnou stopou uvažování. Tento most ukazuje, jak se principy enginu vztahují k obsahu knihy, proč je pro čtenáře – kliniky, vyšetřovatele, právníky – užitečné o nich vědět, a kde je hranice mezi strojovým postupem a lidským úsudkem, kterým se kniha zabývá.

## Co pokrývá platformová strana

Popis enginu v knize uvádí deset kroků: normalizaci vstupu, extrakci signálů, atribuci zdrojů, identifikaci anomálií, modelování aktérů, skórování důvěry, rozklad nejistoty, tvorbu hypotéz, doporučení a vysvětlení. Kapitola zdůrazňuje čtyři mechanismy, které mají obrannou funkci: **kalibraci důvěry** s oddělením epistemické a aleatorické nejistoty, **soupeřící hypotézy** s explicitními kritérii vyvrácení, **vynucení plurality a nezávislosti zdrojů** podle [axiomů NABLA](@/glossary/nabla-axioms.md) a **auditní stopu** s úplnou proveniencí každého rozhodnutí. Engine je zapojen do širšího epistemického procesu platformy, do ověřovací brány [Trinity Gate](@/glossary/trinity-gate.md) a do testování barevnými týmy ([Color Teams](@/glossary/color-teams.md)). Glosář k tomu nabízí [most: Decision Engine](@/kompendium/glossary-bridges/bridge-decision-engine.md).

## Co pokrývá Kompendium

Kniha popisuje techniky, které narušují lidský úsudek – mezi nimi [selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md), [imunizaci proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md), [tematickou diverzi](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) nebo [pseudokonsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – a obrany, které člověku pomáhají úsudek udržet: [hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md), [triangulaci zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md), [falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md) a [kalibraci důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md). Pro oblast prověrek je důležitý oddíl [Cross-Domain](@/kompendium/cross-domain/_index.md), zejména stránka o [kalibraci rozhodovacího enginu v due diligence](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md).

## Proč přecházet od enginu ke knize

Mechanismy enginu jsou strojovou podobou zásad, které se v psychologii úsudku a ve zpravodajské analýze rozvíjejí desítky let. Kalibrace – shoda mezi vyjádřenou jistotou a skutečnou četností správných odpovědí – se měří od poloviny 20. století; Brierovo skóre, které engine podle knihy sleduje, navrhl Brier (1950) pro hodnocení pravděpodobnostních předpovědí počasí. Tetlock (2005) ukázal, že experti v politických předpovědích bývají špatně kalibrovaní a že lépe obstojí ti, kdo pracují s více soupeřícími vysvětleními. Analýza soupeřících hypotéz, kterou ve zpravodajství popsal Heuer (1999), staví na stejném principu jako krok tvorby hypotéz v enginu: místo hledání důkazů pro oblíbenou hypotézu se hledají důkazy, které by jednotlivé hypotézy vyvrátily. Pro čtenáře knihy je tato souvislost cenná, protože ukazuje, že obrany, které kniha doporučuje lidem, nejsou intuitivní rady, ale ověřené postupy, které lze dokonce formalizovat.

Druhým důvodem je **zrcadlení útoků a obran**. Kapitola [2.7](@/kompendium/02-uvod/vztah-k-decision-engine.md) výslovně páruje mechanismy enginu s technikami taxonomie: pluralita a nezávislost zdrojů je obranou proti selektivní expozici a iluzorní pluralitě, soupeřící hypotézy s kritérii vyvrácení obranou proti imunizaci, auditní stopa obranou proti tematické diverzi, která rozhodnutí odvádí od jeho důvodů. Čtenář, který toto párování zná, umí položit stejné otázky i lidskému rozhodování: Kolik nezávislých zdrojů tvrzení skutečně má? Co by hypotézu vyvrátilo? Lze dohledat, proč bylo rozhodnuto právě takto?

Třetím důvodem je **varování před falešnou jistotou**. Engine odděluje nejistotu z nedostatku dat od nejistoty, kterou žádná další data neodstraní. Lidé vystavení manipulaci obě nejistoty často slévají – buď přijmou falešnou jistotu, nebo upadnou do paralýzy, protože „nic není jisté“. Kniha popisuje obojí jako cíle technik a engine ukazuje, jak vypadá zdravá alternativa: jistota vyjádřená číslem, které se mění s důkazy, a otevřeně přiznané „nevím“.

## Konkrétní cesty mezi platformou a knihou

| Mechanismus enginu | Stránka knihy | Co přechod přidává |
|---|---|---|
| Kalibrace důvěry, Brierovo skóre | [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) | Lidská podoba kalibrace: učit se, jak často má člověk pravdu, když si je jistý. |
| Soupeřící hypotézy s kritérii vyvrácení | [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md), [EA-1.3.1](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) | Obrana proti imunizovaným tvrzením. |
| Pluralita a nezávislost zdrojů | [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md), [monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) | Jak poznat, že mnoho zdrojů má jeden původ. |
| Auditní stopa a provenience | [Rozhodovací dohledatelnost](@/kompendium/organizational-defense/21-decision-traceability.md) | Organizační obrana proti rozhodnutím bez důvodů. |
| Prověrky protistran | [EA × Due Diligence: vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) | Kde se taxonomie v praxi prověrek používá. |
| Testování barevnými týmy | [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) | Jak platforma ověřuje vlastní odolnost. |

## Příklad průchodu mostem

Analytička, která prověřuje protistranu před investicí, dostane od kolegy shrnutí: „Všechny zdroje se shodují, firma je spolehlivá.“ Ví, že rozhodovací engine by takový závěr nepřijal bez rozkladu zdrojů a hypotéz, a chce stejný postup uplatnit ručně.

Nejprve zjistí, kolik zdrojů shrnutí skutečně má, a v duchu [axiomů NABLA](@/glossary/nabla-axioms.md) prověří jejich nezávislost: z osmi článků jich šest vychází z jedné tiskové zprávy. Pak sestaví tři hypotézy – firma je spolehlivá, firma maskuje problém, informace jsou nedostatečné – a ke každé zapíše, jaký nález by ji vyvrátil. Teprve poté hledá nové údaje, mimo jiné ve veřejných rejstřících podle stránky [EA × OSINT: ověřování ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md). Výsledný závěr vyjádří s mírou jistoty a s výčtem toho, co neví. Tím nejen zpřesní vlastní práci, ale také se ochrání před [pseudokonsenzem](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md), který by jinak přijala jako skutečnou shodu zdrojů.

## Časté omyly

Prvním omylem je představa, že **engine dokáže rozpoznat manipulaci u člověka**. Engine pracuje s daty a tvrzeními v kontextu prověrek a analýz; klinické nebo forenzní posouzení konkrétní osoby je úkolem odborníka, nikoli softwaru.

Druhým omylem je **přenášet čísla enginu do lidského rozhodování**. Prahy důvěry, které kapitola 2.7 zmiňuje, patří do kontextu platformy. Lidský úsudek z enginu přebírá princip – vyjádřit jistotu, sledovat ji v čase a opravovat ji –, nikoli konkrétní hodnoty.

Třetím omylem je **považovat formální postup za záruku pravdy**. Kalibrace a audit snižují riziko omylu, ale neodstraňují ho; garbage in, garbage out platí i pro nejlépe navržený proces.

Čtvrtým omylem je **myslet si, že kniha je dokumentací enginu**. Kniha stojí na klinických, filosofických a právních základech; platformu popisuje jako prostředí svého vzniku a jako jedno z míst, kde se její principy uplatňují.

## Meze a otevřené otázky

Most se opírá o popis enginu v kapitole 2.7 a v glosáři; podrobnosti implementace a výsledky provozu platformy v knize nejsou a nejsou zde ani uváděny. Otevřenou otázkou je, nakolik lze strojové postupy využít jako *pomůcku* pro lidi, kteří se zotavují z manipulace – například jako strukturu pro deník rozhodování –, aniž by se z nich stal nový vnější zdroj autority. Kniha tuto otázku neuzavírá a připomíná, že obrana lidského úsudku nemůže spočívat v nahrazení úsudku jiným systémem.

## Literatura

- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability. *Monthly Weather Review*, 78(1), 1–3.
- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Tetlock, P. E. (2005). *Expert Political Judgment: How Good Is It? How Can We Know?* Princeton: Princeton University Press.

## Související

**Platforma**

- [Decision Engine](@/glossary/decision-engine.md) – heslo glosáře.
- [Most: Decision Engine](@/kompendium/glossary-bridges/bridge-decision-engine.md) – kde se pojem v knize objevuje.
- [Kalibrace rozhodovacího enginu – AIAD](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) – jak engine pracuje s technikami EA.

**Kniha**

- [2.7 Vztah ke Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – výchozí kapitola mostu.
- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – lidský protějšek kalibrace.
- [EA × Due Diligence: kalibrace](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – praxe prověrek.

**Sousední mosty**

- [Most: NABLA Infinity → Kompendium](@/kompendium/section-bridges/bridge-platform-nabla-to-kompendium.md) – epistemický rámec, nad nímž engine pracuje.
- [Most: Předmluva → Úvod](@/kompendium/section-bridges/bridge-01-to-02-predmluva-uvod.md) – kde kniha vysvětluje vztah k platformě.
