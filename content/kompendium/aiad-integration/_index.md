+++
title = "AIAD integrace a detekce technik EA"
description = "Jak agenti Prismatic Platform, z níž kniha vzešla, pracují s taxonomií epistemických útoků: barevné týmy, strategičtí, specializovaní a doménoví agenti – a co z toho plyne pro čtenáře."
weight = 90
sort_by = "weight"

[extra]
tags = ["kompendium", "aiad-integration", "platform", "agents"]
categories = ["academic", "platform-integration"]
parent = "kompendium"
toc = true
+++

# AIAD integrace a detekce technik EA

Kniha vznikla v prostředí Prismatic Platform, softwarové platformy pro rozhodovací podporu, [zpravodajství z otevřených zdrojů](@/glossary/osint.md) a prověrky protistran. Autonomní součásti platformy – agenti – jsou popsány standardem [AIAD](@/glossary/aiad.md) (*AI-Agent Interface Definition*), který pro každého agenta určuje úroveň oprávnění, schopnosti, vstupy a výstupy a povinný soulad s doktrínou platformy. Tento oddíl popisuje, jak vybraní agenti pracují s taxonomií epistemických útoků (EA), kterou kniha rozvíjí: jak ji používají k obraně vlastních znalostních systémů, jak spolupracují a kde jsou jejich meze. Počty agentů a aplikací, které platforma uvádí, se s jejím vývojem mění; kde se v jednotlivých heslech objevují, jde o stav v době zápisu.

## Proč tento oddíl v knize je

Oddíl nemá čtenáře naučit pracovat se softwarem. Má ukázat, že obranné zásady, které kniha doporučuje lidem – trvat na více nezávislých zdrojích, zachovat si rozpor, smět říct „nevím“, uzavírat problém až po ověřené nápravě, nesvěřovat neomezenou moc nikomu bez auditu –, lze formulovat tak přesně, že je dokáže vynucovat i stroj. Srovnání má dvojí užitek. Ukazuje, že obrany knihy nejsou intuitivní rady, ale ověřitelné postupy. A ukazuje i to, kde strojová analogie končí: člověk vystavený manipulaci často ví, co by měl ověřit, ale nemůže si to „dovolit“, protože zdrojem informací je někdo, na kom závisí (Freyd 1996). Kniha proto ke každé strojové zásadě dodává to, co platforma nepotřebuje – bezpečí, vztahy a péči.

Druhým důvodem je poctivost vůči původu knihy. Předmluva v kapitole [Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) a Úvod v kapitolách [Vztah k NABLA](@/kompendium/02-uvod/vztah-k-nabla.md) a [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) popisují, jak se taxonomie promítá do platformy. Tento oddíl jde o krok dál – k jednotlivým agentům.

## Barevné týmy

Šest [barevných týmů](@/glossary/color-teams.md) chrání epistemickou integritu platformy syntézou útoku a obrany. Všechny jejich operace jsou simulační, se syntetickými daty a v izolovaném prostředí.

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – řízený protivník, který prověřuje obranu; princip, že obrana není funkční, dokud nebyla vystavena pokusu ji obejít.
- [Blue Team a obrana](@/kompendium/aiad-integration/blue-team-ea-defense.md) – strukturované důkazy místo výstrah a sledování pozvolného posunu.
- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – výhradní pravomoc uzavírat nálezy; „uzavřít“ smí jen ten, kdo ověřil nápravu.
- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – konstruktivní důkazy a kvalita záznamu; „nenalezeno“ není „doloženo“.
- [Black Team a modelování hrozeb](@/kompendium/aiad-integration/black-team-ea-modeling.md) – výhradně abstraktní modely; zásada strukturálního popisu, na níž stojí i kniha.
- [Gray Team a okrajové případy](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) – pouze čtecí hledání mezer ve specifikacích a pozvolného driftu.

## Strategičtí agenti

Hierarchie oprávnění L1–L5 ([Agent Tier](@/glossary/agent-tier.md)) určuje, kdo smí co rozhodnout. Stránky této skupiny se zabývají hlavně tím, jak se soustředěná pravomoc kontroluje – a proč kniha jazyk vojenského velení do lidské roviny nepřebírá.

- [Archer Supreme a orchestrace](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) – mimořádná pravomoc v krizi a její audit.
- [Supreme Commander a strategie](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) – priority obrany a přiznané zbytkové riziko.
- [Strategic Command a koordinace](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) – koordinace napříč doménami; nesouhlas nemá vést jen přes hierarchii.
- [Tactical Execution a operace](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) – práce podle postupu a eskalace odchylek.
- [Operational Execution a nasazení](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) – vratnost zásahů; proč „poslušnost bez otázek“ nepatří k lidem.

## Specializovaní agenti

Tito agenti tvoří epistemické jádro platformy – způsob, jakým vznikají, ověřují se a přijímají přesvědčení.

- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) – sedm axiomů jako strojová podoba lidských obran.
- [Epistemický proces a detekce](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md) – šestnáct úrovní od signálu k vědění.
- [Decision Engine a kalibrace](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) – kalibrovaná a vysvětlitelná rozhodnutí.
- [QEVE a ověřování závěrů](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – který důkaz nese celý závěr?
- [Trinity Gate a ověřování přesvědčení](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – je zdůvodnění kruhové, přesahuje závěr premisy, je nutný, nebo jen možný?
- [Quality Monitor a sledování](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – měří se jen to, co se měří.
- [AutoEvolve a vývoj vzorců](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) – zlepšování s možností návratu a riziko optimalizace podle jediné míry.
- [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – přiměřenost zásahu a návrat ke známému dobrému stavu.

## Doménoví agenti

Doménoví agenti uplatňují taxonomii v konkrétních oblastech – v prověrkách, v otevřených zdrojích, v souladu s předpisy a v bezpečnosti.

- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – triangulace a dvojí použití otevřených zdrojů.
- [Czech ARES a screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) – rejstříková data a jejich meze.
- [DD Engine a vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – matice rozporů v prověrkách.
- [Compliance a regulatorní screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) – regulatorní povinnosti a soulad „jen na papíře“.
- [HAWKEYE a koordinované chování](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) – chování bez motivace a cena sledování.
- [Perimeter a útočná plocha](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) – obrana proti sociálnímu inženýrství stojí na lidech.

## Jak oddíl číst

Stránky mají jednotnou stavbu: agent v kostce, proč se týká technik EA, jak pracuje, spolupráce s dalšími agenty, příklad, co z toho plyne pro čtenáře knihy, meze a otevřené otázky, literatura a související stránky. Čtenář bez technického zájmu může u každé stránky začít oddílem „Co z toho plyne pro čtenáře knihy“ a k popisu platformy se vracet jen podle potřeby. Kdo chce pochopit celek, začne u barevných týmů, které ukazují základní logiku útoku a obrany, pokračuje přes specializované agenty, kteří tvoří epistemické jádro, a skončí u doménových agentů, v nichž se taxonomie uplatňuje v praxi. Strategické agenty je dobré číst spolu s oddílem [obrany organizací](@/kompendium/organizational-defense/_index.md), protože jejich hlavním poučením je kontrola moci.

Platformové pojmy mají vlastní hesla v [glosáři](@/glossary/_index.md) a mosty v oddílu [Glossary Bridges](@/kompendium/glossary-bridges/_index.md). Vztah platformy a knihy shrnují také [Most: Decision Engine → Kompendium](@/kompendium/section-bridges/bridge-platform-decision-engine-to-kompendium.md) a [Most: NABLA Infinity → Kompendium](@/kompendium/section-bridges/bridge-platform-nabla-to-kompendium.md).

## Meze oddílu

Popisy agentů vycházejí z dokumentace platformy, jak ji zachycují glosář a původní verze stránek; kde se zdroje rozcházely, řídí se tento oddíl podrobnějším heslem glosáře. Kniha neuvádí provozní údaje platformy – časy odezvy, prahové hodnoty, počty – jinak než jako stav v době zápisu, a nepopisuje podrobnosti, které by mohly sloužit k obcházení obrany. Agenti chrání znalostní systémy platformy; nejsou nástroji klinického ani forenzního posouzení lidí a jejich výstupy takové posouzení nenahrazují. Konečně: jazyk, jímž platforma některé agenty popisuje – „nulová tolerance“, „nejvyšší sebejistota“, „nemožné mise“ –, patří do inženýrského kontextu. V lidské skupině by byl spíše varovným znakem [prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md), a kniha jej proto do lidské roviny nepřenáší.

## Literatura

- Freyd, J. J. (1996). *[Betrayal Trauma](@/glossary/betrayal-trauma.md): The Logic of Forgetting Childhood Abuse*. Cambridge, MA: Harvard University Press.
- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Zenko, M. (2015). *[Red Team](@/glossary/red-team.md): How to Succeed by Thinking Like the Enemy*. New York: Basic Books.

## Související

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – původ knihy v prostředí platformy.
- [2.6 Vztah ke NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – mapování taxonomie na [epistemický proces](@/glossary/epistemic-pipeline.md).
- [2.7 Vztah ke Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – kalibrace a hypotézy.
- [Color Teams](@/glossary/color-teams.md) – architektura barevných týmů.
- [AIAD](@/glossary/aiad.md) – standard definic agentů.
- [Detekční signatury](@/kompendium/detection-signatures/_index.md) – stopy technik, které agenti i lidé zachytávají.
- [Cross-Domain](@/kompendium/cross-domain/_index.md) – taxonomie v prověrkách, bezpečnosti a souladu.
