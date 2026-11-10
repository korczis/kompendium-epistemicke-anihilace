+++
title = "Tactical Execution a obranné operace proti EA"
description = "Jak úroveň L2 Tactical Execution na Prismatic Platform provádí obranné operace podle připravených postupů, kdy eskaluje a co z práce podle protokolu plyne pro krizovou a klinickou praxi."
weight = 19

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "operational"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["strategic-command-ea-coordination", "operational-execution-ea-deployment", "quality-monitor-ea-tracking", "archer-supreme-ea-orchestration", "autoheal-ea-regression-repair"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Tactical Execution a obranné operace proti EA

[Tactical Execution](@/glossary/tactical-execution.md) (taktická exekuce) je úroveň agentů L2 v hierarchii agentů Prismatic Platform, softwarové platformy, z níž kniha vzešla. Podle hesla glosáře jde o specialisty pro soustředěné operace v jedné doméně, kteří pod koordinací velitelů týmů provádějí konkrétní úlohy a opírají své výsledky o důkazy. Ve vztahu k taxonomii epistemických útoků (EA) je Tactical Execution vrstvou, která obranu skutečně provádí: spouští kontrolní cykly, aplikuje opravy a koordinuje reakci na zachycený incident podle připravených postupů. Stránka popisuje, jak tato vrstva pracuje, kdy předává rozhodnutí výš a proč je její logika – jednat podle protokolu a vědět, kdy protokol nestačí – blízká krizové péči, jak ji popisuje kniha.

## Agent v kostce

Glosář uvádí, že agenti L2 tvoří provozní páteř platformy; jejich počet odpovídá v době zápisu přibližně dvěma stovkám a půl. Provádějí úlohy jako simulace útoků v rámci [Red Teamu](@/kompendium/aiad-integration/red-team-ea-detection.md), detekci posunu v rámci [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md), validaci kontraktů v rámci [White Teamu](@/kompendium/aiad-integration/white-team-ea-verification.md) nebo průzkum hranic v rámci [Gray Teamu](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md). Pracují v časovém měřítku hodin až dnů – mezi strategickým plánováním a okamžitým provedením.

Původní verze této stránky popisuje práci podle postupů (*playbooks*): podle klasifikace incidentu se vybere odpovídající postup, provede se s telemetrickým záznamem každého kroku a sleduje se, zda se průběh od postupu neodchyluje. Odchylka je důvodem k eskalaci. Vstupem jsou úkoly od [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md), výstupem zprávy o úspěchu nebo neúspěchu jednotlivých úkolů.

## Proč se týká technik EA

Taxonomie knihy je pro taktickou vrstvu zdrojem klasifikace: podle toho, o jaký druh útoku jde, se volí postup. Původní stránka uvádí, že jako vzor postupů slouží i [akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) a [protokoly zotavení](@/kompendium/recovery-protocols/_index.md) knihy – nikoli proto, že by platforma léčila lidi, ale proto, že tyto protokoly mají stavbu, kterou dobrý obranný postup potřebuje: jasný vstupní stav, posloupnost kroků, kritéria úspěchu a body, v nichž se rozhoduje o eskalaci. Kniha tuto stavbu používá z opačné strany – u lidí, kteří prošli manipulací.

## Jak pracuje

Práce podle postupu má dvě strany. Na jedné straně snižuje chyby z opomenutí a umožňuje jednat rychle i pod tlakem; Gawande (2009) to doložil na kontrolních seznamech v chirurgii a letectví. Na druhé straně je postup vždy navržen pro situace, které autor předvídal. Klein (1998) ukázal, že zkušení odborníci v náročných situacích nejednají jen podle pravidel, ale rozpoznávají, kdy situace neodpovídá vzorci, a mění postup. Tactical Execution tento rozdíl řeší jednoznačně: odchylku od postupu nevyřeší sama, ale eskaluje ji na úroveň, která má širší pohled. Tím se vyhýbá dvěma chybám – slepému provádění postupu, který na situaci nesedí, a improvizaci bez pravomoci a přehledu.

Druhým principem je záznam. Každý krok je zaznamenán tak, aby bylo možné zpětně zjistit, co se stalo a proč. Reason (1990) ukázal, že většina selhání ve složitých systémech nevzniká jednou chybou, ale souhrou drobných selhání na více úrovních; bez záznamu nelze tuto souhru rekonstruovat a poučit se z ní.

## Spolupráce s dalšími agenty

Tactical Execution přijímá úkoly od [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) a konkrétní technické kroky deleguje na [Operational Execution](@/kompendium/aiad-integration/operational-execution-ea-deployment.md). Kvalitu provedení sleduje s [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md), opravy známých regresí může převzít [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) a v krizi se řídí rozdělením úkolů od [Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md).

## Příklad

[Blue Team](@/glossary/blue-team.md) zachytí soubor tvrzení, která se šíří znalostní bází platformy s chybějící proveniencí. Tactical Execution podle klasifikace incidentu vybere postup: označit dotčená tvrzení, zastavit jejich použití v doporučeních, dohledat jejich původ a ověřit, která rozhodnutí z nich vycházela. První tři kroky proběhnou podle postupu. Při čtvrtém se ukáže, že tvrzení byla použita i v doméně, kterou postup nepředvídal. Agent nepokračuje improvizací; zapíše odchylku a eskaluje ji na [Strategic Command](@/glossary/strategic-command.md), který rozhodne, zda rozšířit zásah. Zbytek postupu pokračuje beze změny a celý průběh je zaznamenán.

V krizové péči odpovídá tomuto příkladu situace, kdy protokol akutní stabilizace narazí na okolnost, s níž nepočítá – například na souběžnou somatickou komplikaci. Kniha v takovém případě doporučuje totéž: pokračovat v tom, co protokol bezpečně pokrývá, a pro zbytek přizvat odborníka s širší kompetencí (srov. [EA s medicínskou komorbiditou](@/kompendium/emergency-protocols/25-medical-comorbidity-EA.md)).

## Co z toho plyne pro čtenáře knihy

Pro kliniky a pracovníky krizových služeb je taktická vrstva ilustrací vztahu mezi protokolem a úsudkem. Protokoly knihy – například [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md) nebo [deeskalace v akutní situaci](@/kompendium/emergency-protocols/20-deescalation-EA.md) – nejsou algoritmy, které by nahradily odborný úsudek, ale opora, která zajišťuje, že na nic podstatného se nezapomene. Kdo pracuje podle protokolu, má vědět, kde protokol končí, a mít jasno, komu situaci předá.

Druhým poučením je **eskalace jako dovednost, nikoli selhání**. V mnoha prostředích, které kniha popisuje, je předání situace výš chápáno jako přiznání slabosti, a lidé proto improvizují za hranicí své kompetence. Platforma eskalaci odchylek vyžaduje; i v lidské praxi má být jasné, že předat případ supervizorovi nebo specialistovi je správný krok (viz [supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) a [žádost o druhý názor](@/kompendium/emergency-protocols/38-second-opinion-emergency.md)).

Třetím poučením je **záznam každého kroku**. V krizi se snadno zapomíná zapisovat. Pro pozdější péči i pro případné právní kroky je však záznam toho, co bylo uděláno, kdy a proč, nenahraditelný (viz [hlášení incidentů](@/kompendium/forensic-legal/39-incident-reporting.md)).

## Protokol, který se učí

Postup je užitečný jen tehdy, když odpovídá skutečnosti, a skutečnost se mění. Každá eskalovaná odchylka je proto i informací o postupu samém: ukazuje místo, kde postup nepočítal s tím, co nastalo. Weick a Sutcliffe (2007) popsali organizace s vysokou spolehlivostí jako ty, které se soustředí na selhání a malé odchylky, protože v nich vidí včasné varování, ne obtěžování. Pro taktickou vrstvu to znamená, že odchylky se nesmějí jen vyřešit, ale musí se vrátit do postupů, aby se příště neopakovaly. Pro kliniku a krizové služby z toho plyne obdobný požadavek: protokoly mají mít vlastníka, pravidelnou revizi a cestu, jak do nich vracet zkušenosti z případů, které se jimi nedaly zvládnout. Kniha k tomu odkazuje na [poincidentní učení](@/kompendium/organizational-defense/40-post-incident-learning.md) a na [revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md).

## Meze a otevřené otázky

Tactical Execution je vázán na postupy a nezvládá situace, které v nich nejsou popsány; proto závisí na kvalitě postupů a na funkční eskalaci. Postupy se navíc s časem odchylují od skutečnosti, pokud se pravidelně neaktualizují podle zkušeností. Údaj o počtu agentů L2 odpovídá stavu v době zápisu. Otevřenou otázkou je, jak zajistit, aby se z eskalovaných odchylek stávaly úpravy postupů, a ne jen jednorázová řešení – otázka, kterou si klade i klinická praxe při revizi vlastních protokolů.

## Literatura

- Weick, K. E., & Sutcliffe, K. M. (2007). *Managing the Unexpected: Resilient Performance in an Age of Uncertainty* (2nd ed.). San Francisco: Jossey-Bass.
- Gawande, A. (2009). *The Checklist Manifesto: How to Get Things Right*. New York: Metropolitan Books.
- Klein, G. (1998). *Sources of Power: How People Make Decisions*. Cambridge, MA: MIT Press.
- Reason, J. (1990). *Human Error*. Cambridge: Cambridge University Press.

## Související

**Agenti**

- [Strategic Command a koordinace](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) – zdroj úkolů a cíl eskalace.
- [Operational Execution a nasazení](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) – provádí technické kroky.
- [Quality Monitor a sledování](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – kontrola kvality provedení.

**Pojmy**

- [Tactical Execution](@/glossary/tactical-execution.md) – heslo glosáře.
- [Agent Tier](@/glossary/agent-tier.md) – úrovně oprávnění.

**Kniha**

- [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) – lidská obdoba postupů.
- [Akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md) – protokol a jeho meze.
- [Supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) – eskalace v klinice.
