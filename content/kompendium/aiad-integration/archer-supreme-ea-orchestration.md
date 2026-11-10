+++
title = "Archer Supreme a orchestrace obrany proti EA"
description = "Jak agent nejvyšší úrovně L5 na Prismatic Platform koordinuje obranu při kritických incidentech a proč soustředěná pravomoc vyžaduje audit – poučení, které kniha přenáší na lidské organizace."
weight = 16

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "governance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["supreme-commander-ea-strategy", "strategic-command-ea-coordination", "tactical-execution-ea-operations", "operational-execution-ea-deployment", "red-team-ea-detection"]
toc = true
+++

# Archer Supreme a orchestrace obrany proti EA

[Archer Supreme](@/glossary/archer-supreme.md) je agent s nejvyšší úrovní oprávnění L5 na Prismatic Platform, softwarové platformě, z níž kniha vzešla. Podle hesla glosáře se specializuje na krizové zásahy a úkoly, které přesahují možnosti agentů jedné domény: má přístup ke zdrojům celé platformy a oprávnění přepsat rozhodnutí agentů nižších úrovní, přičemž každá jeho mise podléhá povinnému auditu. Ve vztahu k taxonomii epistemických útoků (EA) je Archer Supreme koordinátorem posledního stupně – aktivuje se tam, kde incident prošel jednotlivými obranami a vyžaduje sladěnou reakci více týmů. Stránka popisuje jeho roli, jeho meze a především poučení, které kniha z modelu soustředěné pravomoci vyvozuje pro lidské instituce.

## Agent v kostce

Glosář [úrovní agentů](@/glossary/agent-tier.md) popisuje pět úrovní oprávnění L1–L5, z nichž každá má vymezený rozsah, přístup ke zdrojům a možnost přepsání. Archer Supreme stojí na vrcholu této hierarchie spolu se [Supreme Commanderem](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md); zatímco [Supreme Commander](@/glossary/supreme-commander.md) zajišťuje průběžné strategické řízení, Archer Supreme se aktivuje v mimořádných situacích. Glosář uvádí, že každá jeho mise sleduje formální čtyřfázový postup – posouzení, plán, provedení a ověření výsledku – a že agent působí pod doktrínou [NM/ND](@/glossary/nm-nd.md), která vyžaduje dokončení úkolu v plné kvalitě, nebo jeho nezahájení.

Podle původní verze této stránky Archer Supreme sám kód nepíše a nenahrazuje práci specializovaných agentů; jeho výstupem je rozdělení úkolů s termíny a kritérii úspěchu. Aktivuje se na vyžádání, při eskalaci porušení pravidel nebo při mimořádné události v kvalitě a vyhodnocuje kritéria eskalace, jako je počet zasažených systémů, regulatorní dopad a riziko poškození důvěryhodnosti.

## Proč se týká technik EA

Taxonomie knihy rozlišuje izolované techniky, terminální sekvence a nejhlubší vrstvu. Obrana platformy je odstupňovaná podobně: většinu signálů zpracují [barevné týmy](@/glossary/color-teams.md) a specializovaní agenti, a teprve incident, který prošel více vrstvami a zasahuje více domén, vyžaduje koordinaci shora. Původní stránka spojuje aktivaci Archer Supreme s situacemi odpovídajícími [terminálním protokolům](@/kompendium/04-terminalni-protokoly/_index.md) – tedy s koordinovaným působením, které žádná jednotlivá obrana nezachytí. Úloha Archer Supreme je v tomto smyslu obdobou krizového týmu, který kniha popisuje u lidí (viz [nasazení krizového týmu](@/kompendium/emergency-protocols/13-crisis-team-deployment.md)).

## Jak pracuje

Koordinace na nejvyšší úrovni stojí na dvou předpokladech: že vstupní signály jsou kvalitní a že rozhodnutí je dohledatelné. První předpoklad je zároveň největší slabinou – rozhodnutí na strategické úrovni nemůže být lepší než informace, z nichž vychází. Proto Archer Supreme podle původní stránky agreguje signály od ostatních agentů a nepracuje s vlastními „dojmy“. Druhý předpoklad zajišťuje povinný audit: každé rozhodnutí je zaznamenáno v telemetrii a v důkazním řetězci platformy (srov. [most NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md)).

Model soustředěné pravomoci s povinným auditem odpovídá klasickým zásadám bezpečného návrhu systémů. Saltzer a Schroeder (1975) formulovali zásadu nejmenšího oprávnění: každá součást má mít jen ta oprávnění, která nezbytně potřebuje. Výjimka v podobě agenta s plnými oprávněními je proto přípustná jen tehdy, je-li vyvážena silným záznamem a možností zpětné kontroly.

Dohledatelnost má ještě jednu funkci: umožňuje zpětně posoudit, zda byla eskalace oprávněná. Mimořádná pravomoc, kterou nelze přezkoumat, se snadno stává pravomocí, kterou nikdo nezpochybní.

## Spolupráce s dalšími agenty

V incidentu je Archer Supreme nadřazen ostatním agentům. Se [Supreme Commanderem](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) spolupracuje na strategickém rámci, se [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) na rozdělení úkolů, které pak provádějí [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) a [Operational Execution](@/kompendium/aiad-integration/operational-execution-ea-deployment.md). Eskalaci k němu může vyvolat například [Red Team](@/kompendium/aiad-integration/red-team-ea-detection.md), pokud narazí na vzorec mimo dosavadní taxonomii.

## Příklad

Několik agentů současně hlásí odchylky: kontrola nezávislosti zdrojů zachytila neobvyklé množství tvrzení se společným původem, monitorování kvality ukazuje pokles přesnosti v jedné doméně a regulatorní screening upozorňuje na možnou povinnost hlášení. Žádný z agentů nemá pravomoc ani přehled, aby situaci řešil sám. Archer Supreme sloučí hlášení, posoudí kritéria eskalace a vydá rozdělení úkolů: jeden tým ověří rozsah zasažení, druhý zastaví použití dotčených tvrzení v doporučeních, třetí připraví podklady pro hlášení. Každý krok má kritérium úspěchu a po jeho splnění následuje ověření, nikoli jen konstatování, že úkol byl proveden.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře doplňuje k popisu agenta poznámku, která je pro knihu podstatná: soustředění neomezené moci do jednoho místa vyžaduje silný audit a vnější kontrolu, a to platí i v lidských organizacích. Kniha popisuje řadu prostředí, v nichž jeden člověk – vedoucí, školitel, guru – drží výlučnou rozhodovací i výkladovou pravomoc bez možnosti přezkumu (viz [vzorec guru a adepta](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) a [kult osobnosti](@/glossary/kult-osobnosti.md)). Rozdíl mezi takovým prostředím a modelem Archer Supreme není v míře pravomoci, ale v tom, zda je pravomoc auditovatelná, časově omezená a vázaná na kritéria.

Výzkum poslušnosti vůči autoritě (Milgram 1974) a skupinového myšlení (Janis 1972) ukazuje, proč na tom záleží: lidé mají silný sklon podřídit se autoritě a skupiny se silným vůdcem snadno potlačují nesouhlas. Organizace, která chce být odolná vůči technikám EA, potřebuje pro případy soustředěné pravomoci obdobu auditu – [výbor pro audit](@/kompendium/organizational-defense/5-audit-committee-EA.md), [mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md) a [oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md).

Třetím přenositelným principem je **ověření výsledku jako součást mise**. Krizový zásah, který skončí „provedením“ bez ověření, že situace je skutečně stabilizována, je neúplný. Totéž platí pro krizovou péči o lidi: kniha zdůrazňuje [přemostění po propuštění](@/kompendium/emergency-protocols/31-post-discharge-bridge.md) a [rozpoznání relapsu](@/kompendium/emergency-protocols/33-relapse-recognition.md).

## Mimořádná pravomoc a její návrat

Pro posouzení každé mimořádné pravomoci – v softwaru i v instituci – jsou rozhodující tři otázky: kdy se aktivuje, jak dlouho trvá a jak se vrací k běžnému stavu. U Archer Supreme je aktivace vázána na kritéria eskalace a mise končí ověřením výsledku; pravomoc tedy není trvalým stavem, ale nástrojem pro konkrétní situaci. Weber (1922) popsal, jak se mimořádná, charismatická autorita v organizacích postupně mění v trvalou strukturu, a upozornil, že právě tento přechod je místem, kde se ztrácí kontrola. V lidských skupinách, které kniha popisuje, se „krizový režim“ často stává normálem: vůdce si ponechává výjimečné pravomoci, protože krize nikdy nekončí. Kontrolní otázkou pro organizaci proto je, zda má pro výjimečné pravomoci stanoven konec a kdo jej může vyhlásit. Stránky [řízení nástupnictví](@/kompendium/organizational-defense/20-succession-planning-EA.md) a [nahrazení vedení](@/kompendium/organizational-defense/38-leadership-replacement.md) popisují, jak tuto otázku řešit.

## Meze a otevřené otázky

Archer Supreme je nákladným zdrojem a nehodí se pro běžné operace. Jeho rozhodnutí jsou jen tak dobrá jako vstupní signály. Model soustředěné pravomoci je navíc citlivý na chybu na vrcholu: pokud selže koordinátor, selžou všichni, kdo mu jsou podřízeni. Proto glosář klade takový důraz na audit. Údaje o rozsahu platformy uvedené v glosáři odpovídají stavu v době zápisu. Jazyk „nemožných misí“ a „nejvyšší sebejistoty“, jímž platforma agenta popisuje, kniha nepřebírá; v lidském prostředí by byl spíše varovným znakem (srov. [prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md)).

## Literatura

- Janis, I. L. (1972). *Victims of Groupthink*. Boston: Houghton Mifflin.
- Milgram, S. (1974). *Obedience to Authority: An Experimental View*. New York: Harper & Row.
- Weber, M. (1922). *Wirtschaft und Gesellschaft*. Tübingen: J. C. B. Mohr (Paul Siebeck).
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*, 63(9), 1278–1308.

## Související

**Strategičtí agenti**

- [Supreme Commander a strategie](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) – trvalá strategická vrstva.
- [Strategic Command a koordinace](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) – rozdělení úkolů.
- [Tactical Execution a operace](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) – provedení.

**Pojmy**

- [Archer Supreme](@/glossary/archer-supreme.md) – heslo glosáře.
- [Agent Tier](@/glossary/agent-tier.md) – úrovně oprávnění L1–L5.
- [Kult osobnosti](@/glossary/kult-osobnosti.md) – lidský protějšek neauditované moci.

**Kniha**

- [Výbor pro audit](@/kompendium/organizational-defense/5-audit-committee-EA.md) – kontrola soustředěné pravomoci.
- [Nasazení krizového týmu](@/kompendium/emergency-protocols/13-crisis-team-deployment.md) – lidská obdoba koordinace v krizi.
