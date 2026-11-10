+++
title = "OSINT a validace zdrojů s ohledem na EA"
description = "Jak agent OSINT na Prismatic Platform shromažďuje a váží veřejné zdroje, rozpoznává ozvěnové komory a otrávené zdroje – a proč kniha OSINT popisuje jen jako obranný a zákonný nástroj."
weight = 30

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["czech-ares-ea-screening", "dd-engine-ea-source-weighting", "hawkeye-ea-visitor-intelligence", "epistemic-pipeline-ea-detection", "nabla-infinity-ea-pipeline"]
parent = "kompendium-aiad-integration"
toc = true
+++

# OSINT a validace zdrojů s ohledem na EA

Agent OSINT je podle původní verze této stránky doménovým agentem Prismatic Platform, softwarové platformy, z níž kniha vzešla, který koordinuje sběr informací z veřejně dostupných zdrojů prostřednictvím řady samostatných adaptérů, slučuje je a uplatňuje na ně vážení podle spolehlivosti a nezávislosti. Pro mnoho detekčních úloh platformy je primární vstupní vrstvou. Ve vztahu k taxonomii epistemických útoků (EA) má dvojí roli: je nástrojem ověřování, protože triangulace zdrojů je přímou obranou proti dezinformacím, a zároveň je sám cílem manipulace, protože veřejné zdroje lze cíleně zaplavit nebo otrávit. Stránka popisuje obě role a etický rámec, v němž kniha o OSINT mluví.

## Agent v kostce

Heslo [OSINT](@/glossary/osint.md) vymezuje zpravodajství z otevřených zdrojů jako disciplínu sběru, zpracování, analýzy a předávání informací z veřejně dostupných zdrojů s cílem vytvořit použitelné poznatky. Na rozdíl od jiných zpravodajských disciplín se opírá výhradně o informace, které jsou veřejnosti legálně přístupné – veřejné rejstříky, profesní publikace, finanční výkazy, záznamy o doménách, veřejný obsah na webu – a klade důraz na ověřování zdrojů a na etické metody sběru, které respektují ochranu soukromí, podmínky užití a jurisdikční předpisy. Glosář zdůrazňuje, že problém se v digitálním věku posunul od nedostatku informací k jejich nadbytku a k obtížnosti rozlišit spolehlivé od nespolehlivých.

Původní stránka popisuje princip detekce jako triangulaci napříč zdroji: tvrzení podložené jediným zdrojem má nízkou důvěru, tvrzení podložené rozmanitými a nezávislými zdroji vysokou. Jako podezřelé označuje ozvěnové komory – situace, kdy se tvrzení šíří uzavřeným okruhem zdrojů, které se navzájem citují.

## Proč se týká technik EA

Pro knihu je OSINT nejvýznamnějším průnikem mezi platformou a lidskou praxí. Kniha mu věnuje celou řadu stránek [Cross-Domain](@/kompendium/cross-domain/_index.md): [důvěryhodnost zdrojů pod epistemickým útokem](@/kompendium/cross-domain/1-ea-osint-source-credibility.md), [sociální sítě jako bojiště](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md), [detekce botů ve vyšetřování](@/kompendium/cross-domain/6-ea-osint-bot-detection.md), [vkládání narativů](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md), [triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) a [atribuční zkreslení sankčních seznamů](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md). Techniky, které se na otevřené zdroje zaměřují nejčastěji, jsou [vkládání narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md), [praní pověsti](@/kompendium/detection-signatures/23-network-reputation-laundering.md) a [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md). Původní stránka dodává, že agent využívá [případové studie](@/kompendium/case-studies/_index.md) jako popisy známých vzorců dezinformačních kampaní a [detekční signatury](@/kompendium/detection-signatures/_index.md) jako popisy vzorců otravování zdrojů.

## Jak pracuje

Triangulace zdrojů je jádrem analytické metodiky. Heuer (1999) zdůraznil, že analytik musí rozlišovat mezi počtem zpráv a počtem nezávislých zdrojů a že opakování téhož údaje různými kanály nezvyšuje jeho věrohodnost. Wardleová a Derakhshan (2017) navrhli rámec „informační poruchy“, který rozlišuje nepravdivý obsah šířený bez úmyslu škodit, nepravdivý obsah šířený záměrně a pravdivý obsah použitý k poškození, a zdůraznili, že ověřování musí brát v úvahu aktéra, sdělení i interpreta. Agent OSINT tyto zásady uplatňuje strojově: sleduje původ a nezávislost zdrojů v souladu s [axiomy NABLA](@/glossary/nabla-axioms.md) a jeho výstupy procházejí [epistemickým procesem](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md).

Lowenthal (2017) připomíná obecnější zásadu zpravodajské práce, která platí i zde: hodnota informace se odvíjí od otázky, na niž má odpovědět, a sběr bez jasné otázky vede k zahlcení, nikoli k poznání.

## Spolupráce s dalšími agenty

OSINT je hlavním zdrojem dat pro [Czech ARES](@/kompendium/aiad-integration/czech-ares-ea-screening.md), [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) a [HAWKEYE](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md); jeho výstupy zpracovávají [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) a [epistemický proces](@/glossary/epistemic-pipeline.md). Abstraktní modely hrozeb pro oblast otevřených zdrojů může dodat [Black Team](@/kompendium/aiad-integration/black-team-ea-modeling.md).

## Příklad

Při prověrce se objeví tvrzení, že vedoucí pracovník protistrany byl v minulosti odsouzen. Agent najde několik webových stránek, které to uvádějí. Při ověření původu zjistí, že všechny přebírají text z jednoho anonymního blogu a že žádná nezávislá databáze ani zpravodajský zdroj s ověřenou redakční prací tvrzení nepotvrzuje; navíc se v jednom zdroji objevuje jiné datum narození, což naznačuje možnou záměnu osob. Výstupem je tvrzení s nízkou důvěrou, s jedním nezávislým původem a s upozorněním na možnou záměnu. Agent je nepředává jako fakt a doporučuje ověření v úředních zdrojích. Kdyby tvrzení prošlo bez kontroly, mohlo by poškodit nevinného člověka a stát se součástí [praní pověsti v opačném směru](@/kompendium/techniques/ea-2-1-8-reputation-laundering-inverze.md).

## Co z toho plyne pro čtenáře knihy

Heslo glosáře shrnuje dvojí roli OSINT v knize. Je nástrojem ověřování – triangulace zdrojů je přímou obranou proti dezinformacím (viz [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) a [rutina ověřování napříč zdroji](@/kompendium/self-defense-guides/36-cross-source-routine.md)). A zároveň je dvojího užití: tytéž postupy umožňují pronásledování a [doxing](@/glossary/doxing.md). Kniha proto popisuje OSINT jen v obranném a zákonném rámci; vyhledávání informací o soukromých osobách bez právního důvodu stojí mimo její účel.

Druhým poučením je **pozor na ozvěnové komory**. Pocit, že „všude se o tom píše“, je jedním z nejsilnějších zdrojů přesvědčení a jednou z nejsnáze zneužitelných iluzí. Kniha k jejímu rozpoznání nabízí signatury [monokultury zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) a [cirkularity citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) a heslo [epistemická bublina](@/glossary/epistemic-bubble.md).

Třetím poučením je **ochrana posuzovaných**. Kdo používá otevřené zdroje k posuzování lidí, nese odpovědnost za to, aby nešířil nepodložená tvrzení a nezaměnil osoby. Profesní posuzovatelé by měli rozlišovat mezi ověřeným faktem a nepotvrzeným tvrzením a údaje o soukromých osobách používat jen v nezbytném rozsahu.

## Otevřené zdroje a zranitelnost vůči otrávení

Původní stránka uvádí, že agent je zranitelný vůči koordinovanému otravování zdrojů – situaci, kdy je veřejný prostor záměrně zaplněn obsahem, který má změnit to, co se o tématu „ví“. Tato zranitelnost je vlastností otevřených zdrojů jako takových, nikoli jen agenta. Obranou je důraz na zdroje s ověřitelnou redakční prací a na primární dokumenty, sledování času vzniku obsahu a ochota připustit, že o tématu nelze z otevřených zdrojů nic spolehlivého zjistit. Totéž kniha doporučuje lidem v [kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md).

## Čas jako rozměr zdroje

Otevřené zdroje se mění: stránky mizí, příspěvky se upravují, archivované verze se liší od současných. Pro ověřování je proto důležité nejen *co* zdroj říká, ale *kdy* to řekl a zda to tak říkal od začátku. Axiom časového rozpadu v rámci NABLA požaduje, aby se stáří důkazu promítlo do jeho váhy; v praxi OSINT to znamená zaznamenávat datum získání každého údaje a uchovávat jeho podobu v okamžiku, kdy byl použit. Kniha totéž doporučuje ve forenzní rovině, kde se elektronické důkazy musí uchovávat tak, aby bylo možné doložit jejich původní stav (viz [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) a [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)). Pro jednotlivce je obdobou [paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md): záznam, který chrání před tím, aby se minulost dodatečně přepisovala – v síti i ve vztazích.

## Meze a otevřené otázky

Agent je slepý vůči informacím, které nejsou veřejné; z otevřených zdrojů lze získat jen část obrazu. Je zranitelný vůči koordinovanému otravování zdrojů. Původní stránka uváděla počet adaptérů a časové parametry dotazů; tyto údaje se s vývojem platformy mění a zde se neuvádějí. Otevřenou otázkou je, jak vyvážit užitečnost otevřených zdrojů s ochranou soukromí a s rizikem, že se i obranné použití stane zdrojem škody.

## Literatura

- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Lowenthal, M. M. (2017). *Intelligence: From Secrets to Policy* (7th ed.). Thousand Oaks, CA: CQ Press.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policymaking*. Strasbourg: Council of Europe.

## Související

**Agenti**

- [Czech ARES a screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) – rejstříková data.
- [DD Engine a vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – prověrky.
- [HAWKEYE a zpravodajství o návštěvnících](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) – reputace zdrojů provozu.

**Pojmy**

- [OSINT](@/glossary/osint.md) – heslo glosáře a etické meze.
- [Doxing](@/glossary/doxing.md) – zneužití otevřených zdrojů.
- [Epistemic Bubble](@/glossary/epistemic-bubble.md) – uzavřený okruh zdrojů.

**Kniha**

- [EA × OSINT: důvěryhodnost zdrojů](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) – podrobný rozbor.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – lidská obdoba.
