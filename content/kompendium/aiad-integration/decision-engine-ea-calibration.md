+++
title = "Decision Engine a kalibrace rozhodování o EA"
description = "Jak rozhodovací engine Prismatic Platform slučuje signály agentů do kalibrovaného a vysvětlitelného rozhodnutí o technikách EA a co z kalibrace důvěry plyne pro lidský úsudek."
weight = 24

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "decision-engine"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["nabla-infinity-ea-pipeline", "trinity-gate-ea-verification", "epistemic-pipeline-ea-detection", "qeve-ea-quality-validation", "dd-engine-ea-source-weighting"]
toc = true
+++

# Decision Engine a kalibrace rozhodování o EA

[Decision Engine](@/glossary/decision-engine.md) (rozhodovací engine) je součástí Prismatic Platform, softwarové platformy, z níž kniha vzešla, která slučuje vícefaktorové vstupy do strukturovaného rozhodnutí s vyjádřenou mírou důvěry. Kapitola [2.7 Vztah ke Decision Engine](@/kompendium/02-uvod/_index.md) jej popisuje jako deterministický proces o deseti krocích – od normalizace vstupu přes extrakci signálů, atribuci zdrojů, anomálie, modelování aktérů, skórování a rozklad nejistoty až po hypotézy, doporučení a vysvětlení. Ve vztahu k taxonomii epistemických útoků (EA) není engine primárním detektorem, ale **agregátorem**: skládá signály ostatních agentů do rozhodnutí, které je kalibrované a zpětně dohledatelné. Stránka popisuje tuto roli a vysvětluje, proč je kalibrace důvěry jednou z nejdůležitějších obran, které kniha doporučuje i lidem.

## Agent v kostce

Podle hesla glosáře vyvažuje engine kvalitu a původ signálu, časové stárnutí důkazů, řešení konfliktů mezi protichůdnými signály a prahy rizika. Kapitola 2.7 zdůrazňuje čtyři obranné mechanismy: kalibraci důvěry s oddělením nejistoty z nedostatku dat od nejistoty, kterou další data neodstraní; soupeřící hypotézy s výslovnými kritérii vyvrácení; vynucení plurality a nezávislosti zdrojů; a auditní stopu s úplnou proveniencí. Původní verze této stránky dodává, že výstupem každého rozhodnutí je „obálka“ s verdiktem, mírou důvěry, hlavními důvody a údajem, který umožní rozhodnutí zopakovat.

Engine je deterministický: pro stejný vstup vytvoří vždy stejný výstup. Původní stránka to popisuje jako sílu i slabost zároveň – sílu, protože rozhodnutí je auditovatelné a reprodukovatelné, a slabost, protože engine nereaguje na změnu kontextu, dokud není výslovně upraven.

## Proč se týká technik EA

Kapitola 2.7 páruje mechanismy enginu s technikami taxonomie. Soupeřící hypotézy s kritérii vyvrácení jsou obranou proti [imunizaci proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md); vynucení plurality a nezávislosti zdrojů proti [selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) a zdánlivé shodě mnoha zdrojů; auditní stopa proti [tematické diverzi](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md), která odvádí rozhodnutí od jeho důvodů. Kalibrace důvěry pak chrání před dvěma opačnými selháními, která kniha popisuje jako cíle manipulace: před falešnou jistotou a před paralýzou z pocitu, že nic není jisté. Původní stránka uvádí, že engine používá [detekční signatury](@/kompendium/detection-signatures/_index.md) jako základ pravidel a [případové studie](@/kompendium/case-studies/_index.md) jako historický materiál pro kalibraci.

## Jak pracuje

Kalibrace znamená shodu mezi vyjádřenou jistotou a skutečnou četností správných závěrů: systém, který říká „jsem si jistý na 80 procent“, by měl mít pravdu přibližně v osmi případech z deseti. Kapitola 2.7 uvádí, že engine sleduje Brierovo skóre, které navrhl Brier (1950) pro hodnocení pravděpodobnostních předpovědí počasí a které měří odchylku předpovězené pravděpodobnosti od skutečného výsledku. Tetlock (2005) ukázal na rozsáhlém souboru odborných předpovědí, že experti bývají často špatně kalibrovaní a že lépe obstojí ti, kdo pracují s více vysvětleními a opravují se podle výsledků.

Soupeřící hypotézy navazují na analytickou praxi, kterou popsal Heuer (1999): místo hledání důkazů pro oblíbené vysvětlení se hledají důkazy, které by jednotlivá vysvětlení vyvrátila, a rozhoduje se podle toho, které vysvětlení má nejméně protidůkazů. Tento postup přímo chrání před [potvrzovacím zkreslením](@/kompendium/03-zakladni-kategorie/biasy/konfirmacni.md), jehož všudypřítomnost shrnul Nickerson (1998).

## Spolupráce s dalšími agenty

Engine je hlavním konzumentem výstupů [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) a [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md) a využívá hloubkovou analýzu [epistemického procesu](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md). Rozhodnutí s vysokou sázkou ověřuje [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md), kvalitu závěrů [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) a auditní záznamy [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md). V prověrkách protistran spolupracuje s [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md).

## Příklad

Engine má rozhodnout, zda soubor online příspěvků o veřejné instituci nese znaky koordinované kampaně. Vstupem jsou signály z několika agentů: kontrola nezávislosti zdrojů ukazuje, že mnoho příspěvků odkazuje na jediný původní text; síťová analýza ukazuje synchronizované zveřejnění; jazyková analýza nachází opakované formulace. Engine nevydá jen verdikt „kampaň“. Sestaví tři hypotézy – koordinovaná kampaň, spontánní reakce na skutečnou událost, kombinace obojího –, ke každé uvede, co by ji vyvrátilo, a vyjádří míru důvěry s rozlišením, která nejistota by se dala snížit dalšími daty. Výsledek je možné zpětně dohledat ke konkrétním signálům. Člověk, který s výsledkem pracuje, tak ví nejen, co engine „myslí“, ale proč a jak moc si je jistý.

## Co z toho plyne pro čtenáře knihy

Nejdůležitějším přenositelným principem je **kalibrace důvěry**. Lidé vystavení manipulaci mají často narušenou kalibraci: buď přijmou cizí tvrzení s jistotou, kterou nemá, nebo ztratí důvěru ve vlastní úsudek i tam, kde je oprávněná. Kniha k tomu nabízí [kalibraci důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – postupné učení, jak často má člověk pravdu, když si je jistý, a jak rozlišit důvěru opřenou o důkazy od důvěry vynucené vztahem.

Druhým principem je **rozhodnutí s důvody**. Engine nikdy nevydá verdikt bez dohledatelných důvodů. V institucích, které kniha popisuje, je naopak častým znakem manipulace rozhodnutí bez zdůvodnění nebo se zdůvodněním, které se mění podle potřeby (viz [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md)). Požadavek [dohledatelnosti rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) je proto obranným opatřením.

Třetím principem je **více hypotéz**. Klinik, vyšetřovatel i člověk v zotavení mají ke každé důležité situaci položit otázku, jaká jiná vysvětlení existují a co by je vyvrátilo. Kniha tento postup popisuje ve [falsifikačním myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md) a ve vzdělávacím scénáři [vážení důkazů](@/kompendium/educational-scenarios/7-evidence-weighting.md).

## Rozhodnutí, nikoli verdikt o člověku

Rozhodovací engine pracuje s tvrzeními, signály a zdroji, nikoli s lidmi jako takovými. Tento rozdíl má v knize zásadní význam. Techniky EA se v praxi týkají lidí – jejich důvěryhodnosti, jejich vzpomínek, jejich úsudku – a rozhodnutí o lidech vyžadují jiný druh opatrnosti než rozhodnutí o tvrzeních. Kahneman, Sibony a Sunstein (2021) ukázali, že i odborné lidské úsudky o lidech – soudní, pojistné, lékařské – vykazují značný „šum“, tedy nežádoucí rozptyl mezi posuzovateli i u téhož posuzovatele v čase, a že strukturované postupy jej mohou snížit. Kniha z toho přebírá dvě poučení: strukturovat posuzování podle předem stanovených kritérií, jak to dělá engine, a zároveň nikdy nenechat strukturu nahradit rozhovor s člověkem, jehož se rozhodnutí týká. Klinický a forenzní závěr o konkrétní osobě má vždy stát na vyšetření, výpovědi a doložených skutečnostech (srov. [hodnocení věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md)).

## Meze a otevřené otázky

Engine je agregátorem a jeho rozhodnutí jsou jen tak dobrá jako vstupní signály. Determinismus usnadňuje audit, ale znamená, že bez výslovné úpravy nereaguje na změnu prostředí. Kapitola 2.7 uvádí prahové hodnoty důvěry pro přechod od zkoumání k provedení; tyto hodnoty patří do kontextu platformy a nemají se přenášet do lidského rozhodování. Původní stránka uváděla i časové parametry provozu; konkrétní hodnoty se s vývojem platformy mění, a proto se zde neuvádějí. Kniha zdůrazňuje, že engine nepomáhá posuzovat konkrétní lidi – klinické a forenzní posouzení zůstává úkolem odborníka (viz [most Decision Engine → Kompendium](@/kompendium/section-bridges/bridge-platform-decision-engine-to-kompendium.md)).

## Literatura

- Kahneman, D., Sibony, O., & Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment*. New York: Little, Brown Spark.
- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability. *Monthly Weather Review*, 78(1), 1–3.
- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Tetlock, P. E. (2005). *Expert Political Judgment: How Good Is It? How Can We Know?* Princeton: Princeton University Press.

## Související

**Agenti**

- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) – hlavní zdroj signálů.
- [Trinity Gate a ověřování](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – ověřuje rozhodnutí s vysokou sázkou.
- [DD Engine a vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – použití v prověrkách.

**Pojmy**

- [Decision Engine](@/glossary/decision-engine.md) – heslo glosáře.
- [Axiomy NABLA](@/glossary/nabla-axioms.md) – pravidla, která engine respektuje.

**Kniha**

- [2.7 Vztah ke Decision Engine](@/kompendium/02-uvod/_index.md) – podrobný popis enginu.
- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – lidská obdoba.
- [Most: Decision Engine → Kompendium](@/kompendium/section-bridges/bridge-platform-decision-engine-to-kompendium.md) – vztah enginu a knihy.
