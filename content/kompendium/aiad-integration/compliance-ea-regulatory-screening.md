+++
title = "Compliance a regulatorní screening událostí EA"
description = "Jak agent Compliance na Prismatic Platform přiřazuje zjištěné události EA k regulatorním povinnostem (GDPR, NIS2, AI Act), proč je jeho úlohou následné hlášení a co znamená soulad „jen na papíře“."
weight = 34

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "compliance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["white-team-ea-verification", "dd-engine-ea-source-weighting", "czech-ares-ea-screening", "gray-team-ea-edge-cases", "strategic-command-ea-coordination"]
toc = true
+++

# Compliance a regulatorní screening událostí EA

Agent Compliance je podle původní verze této stránky doménovým agentem Prismatic Platform, softwarové platformy, z níž kniha vzešla, který posuzuje zjištěné události epistemických útoků (EA) z hlediska regulatorních rámců – zejména ochrany osobních údajů, kybernetické bezpečnosti a regulace umělé inteligence. Hledá, které povinnosti z události plynou, připravuje regulatorní zprávy a upozorňuje na případy, které vyžadují oznámení. Uzavírá tak smyčku mezi technickou detekcí a právní rovinou. Stránka popisuje tuto roli, její meze a pojem, na který kniha v souvislosti se souladem upozorňuje nejvíc: soulad, který vytváří zdání kontroly bez skutečné ochrany.

## Agent v kostce

Heslo [Compliance Framework](@/glossary/compliance-framework.md) vysvětluje obecný pojem: rámec souladu je strukturovaný soubor pokynů, předpisů a kontrolních opatření, které musí organizace zavést, aby splnila zákonné, regulatorní nebo oborové požadavky. Rámce převádějí záměr zákonodárce na konkrétní, měřitelná opatření, a tím dávají auditovatelný standard. Agent Compliance tyto rámce uplatňuje na události zjištěné ostatními agenty.

Původní stránka popisuje jeho postup jako porovnávání událostí s regulatorními spouštěči: pro každou zjištěnou událost hledá, zda odpovídá situaci, s níž předpis spojuje povinnost. Jako příklady uvádí porušení zabezpečení osobních údajů, s nímž obecné nařízení o ochraně osobních údajů spojuje povinnost ohlásit je dozorovému úřadu (Nařízení (EU) 2016/679, čl. 33), a manipulativní praktiky systémů umělé inteligence, které akt o umělé inteligenci řadí mezi zakázané (Nařízení (EU) 2024/1689, čl. 5). Pro terminologickou konzistenci využívá agent [mosty glosáře](@/kompendium/glossary-bridges/_index.md), které spojují technické pojmy s regulatorními definicemi. Výstupem je zpráva o souladu s požadovanými kroky a lhůtami.

## Proč se týká technik EA

Taxonomie knihy popisuje techniky na úrovni struktury, regulace popisuje povinnosti na úrovni práva. Obě roviny se setkávají tam, kde technika má právně relevantní dopad – když zasahuje osobní údaje, kritickou infrastrukturu informací nebo když ji provádí systém umělé inteligence. Kniha tyto průniky rozvádí na stránkách [Cross-Domain](@/kompendium/cross-domain/_index.md): [NIS2 a integrita informací](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md), [GDPR a ochrana osobního narativu](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md), [AML a rozpoznávání vzorců](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md), [KYC a validace narativu](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) a [detekce regulatorního zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md). Agent Compliance je na platformě místem, kde se tyto průniky převádějí na konkrétní povinnosti.

## Jak pracuje

Agent pracuje podle pravidel: regulatorní spouštěče jsou předem zapsány a nová regulace vyžaduje ruční aktualizaci. Původní stránka zdůrazňuje, že jeho úlohou je **následné hlášení**, nikoli prevence – reaguje na události, které již nastaly a byly zjištěny jinými agenty. Pracuje jak u jednotlivých incidentů, tak v pravidelném cyklu regulatorního výkaznictví.

Pravidlový přístup má v oblasti souladu výhody i rizika. Výhodou je předvídatelnost a auditovatelnost: lze zpětně doložit, proč byla událost vyhodnocena určitým způsobem. Rizikem je, že pravidla zachycují jen to, co v nich je, a že soulad se může smrsknout na splnění formálních požadavků. Power (1997) popsal „společnost auditu“, v níž se kontrola mění v rituál ověřování: organizace vykazuje soulad, ale skutečný stav, který má soulad chránit, zůstává mimo pohled.

Agent také nerozhoduje o tom, zda se povinnost skutečně uplatní; připravuje podklad pro rozhodnutí člověka s odpovídající odpovědností. Toto oddělení je podstatné, protože regulatorní posouzení vyžaduje znalost okolností, které v datech nemusí být – například smluvních vztahů nebo povahy dotčené organizace. Pravidlový agent tedy zajišťuje, aby se na povinnost nezapomnělo, nikoli aby ji sám vyložil.

## Spolupráce s dalšími agenty

Agent Compliance zpracovává výstupy [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md), [Czech ARES](@/kompendium/aiad-integration/czech-ares-ea-screening.md) a [White Teamu](@/kompendium/aiad-integration/white-team-ea-verification.md); své výstupy archivuje s White Teamem v nepřepisovatelném úložišti; při závažném porušení eskaluje na [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md). S [Gray Teamem](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) konzultuje sporné případy, v nichž není zřejmé, zda událost spadá pod regulatorní definici.

## Příklad

[Blue Team](@/glossary/blue-team.md) zachytí soubor obsahu, který šíří nepravdivá tvrzení o konkrétní osobě a kombinuje je s jejími osobními údaji získanými z různých veřejných zdrojů. Agent Compliance posoudí, které rámce se mohou uplatnit: zda jde o zpracování osobních údajů s povinnostmi podle obecného nařízení, zda se událost týká provozovatele, na kterého dopadá směrnice o kybernetické bezpečnosti (Směrnice (EU) 2022/2555), a zda se na šíření podílel systém umělé inteligence. Připraví zprávu s možnými povinnostmi a lhůtami a označí body, které vyžadují posouzení právníkem. Nevydává právní závěr; dává podklad, aby nic podstatného nebylo přehlédnuto.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře uvádí, že pro knihu je důležitá stinná stránka souladu – soulad „na papíře“, který vytváří zdání kontroly bez skutečné ochrany (viz [Scam Compliance](@/glossary/scam-compliance.md)). Instituce, která má etický kodex, školení a formulář pro stížnosti, ale nikdy nikoho nechránila, je v souladu jen formálně. Kniha proto v [obraně organizací](@/kompendium/organizational-defense/_index.md) klade otázku, zda mechanismy skutečně fungují: zda [mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md) někdy vedl ke změně, zda [interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) někdy dospělo k závěru nepříjemnému pro vedení.

Druhým poučením je **rozlišení mezi regulatorní povinností a ochranou člověka**. Většina technik, které kniha popisuje, nespadá pod žádnou konkrétní regulatorní povinnost – manipulativní vedení, zpochybňování odbornosti nebo izolace v pracovním kolektivu nemusí porušit žádný předpis. Kdo se spoléhá jen na soulad, takové jevy přehlédne. Kniha proto pro právní rovinu odkazuje i na obecnější instituty, například [doktrínu nepřiměřeného vlivu](@/kompendium/forensic-legal/11-undue-influence-doctrine.md) a [pracovní právo](@/kompendium/forensic-legal/44-employment-law-EA.md).

Třetím poučením je **lhůta**. Regulatorní povinnosti mají lhůty a jejich zmeškání má následky. U lidí po manipulaci kniha upozorňuje na obdobné lhůty – promlčecí doby, lhůty pro podání stížnosti, lhůty pro uchování důkazů – a doporučuje je včas zjistit (viz [právní naléhavost](@/kompendium/emergency-protocols/39-legal-emergency.md) a [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)).

## Soulad a regulatorní zajetí

Zvláštní pozornost si zaslouží situace, kdy se manipulace netýká jednotlivce, ale samotného regulatorního procesu – kdy regulovaný subjekt ovlivňuje pravidla nebo jejich výklad ve svůj prospěch. Kniha tento jev popisuje jako [detekci regulatorního zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md) a v taxonomii jako techniky ovládnutí institucí, například [přepisování politik](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md). Pravidlový agent je vůči takovému zajetí bezbranný: pokud se změní pravidla, změní se i jeho závěry. Ochranou je, že pravidla jsou veřejná, jejich změny jsou zaznamenány a lze je zpětně porovnat.

## Meze a otevřené otázky

Agent Compliance je pravidlový a nové regulace musí být doplněny ručně; je pomalý vůči hrozbám v reálném čase a slouží následnému hlášení. Jeho výstupy nejsou právním poradenstvím a vyžadují posouzení odborníkem. Regulatorní rámce se vyvíjejí a jejich výklad se upřesňuje; tato stránka uvádí předpisy v podobě známé v době zápisu.

Pro čtenáře knihy z toho plyne praktická rada: u každé právní souvislosti, na kterou kniha odkazuje, ověřit aktuální znění předpisu a jeho výklad u odborníka, protože i obecně platný rámec se v jednotlivých státech provádí odlišně.

## Literatura

- Nařízení Evropského parlamentu a Rady (EU) 2016/679 ze dne 27. dubna 2016 o ochraně fyzických osob v souvislosti se zpracováním osobních údajů (obecné nařízení o ochraně osobních údajů).
- Nařízení Evropského parlamentu a Rady (EU) 2024/1689 ze dne 13. června 2024, kterým se stanoví harmonizovaná pravidla pro umělou inteligenci (akt o umělé inteligenci).
- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford: Oxford University Press.
- Směrnice Evropského parlamentu a Rady (EU) 2022/2555 ze dne 14. prosince 2022 o opatřeních k zajištění vysoké společné úrovně kybernetické bezpečnosti v Unii (směrnice NIS 2).

## Související

**Agenti**

- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – archivuje a ověřuje záznamy.
- [DD Engine a vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – zdroj podkladů z prověrek.
- [Czech ARES a screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) – rejstříková data.

**Pojmy**

- [Compliance Framework](@/glossary/compliance-framework.md) – heslo glosáře.
- [Scam Compliance](@/glossary/scam-compliance.md) – soulad bez ochrany.

**Kniha**

- [EA × Compliance: NIS2](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md) – integrita informací.
- [Detekce regulatorního zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md) – manipulace samotné regulace.
