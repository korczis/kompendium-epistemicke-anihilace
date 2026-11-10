+++
title = "AutoHeal a oprava regresí v detekci EA"
description = "Jak mechanismus AutoHeal na Prismatic Platform odhaluje a opravuje regrese obrany proti technikám EA: výchozí stav, přiměřenost zásahu, jistič a ověření – a obdoba ve fázové krizové péči."
weight = 22

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "quality"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["autoevolve-ea-pattern-evolution", "quality-monitor-ea-tracking", "blue-team-ea-defense", "operational-execution-ea-deployment", "white-team-ea-verification"]
parent = "kompendium-aiad-integration"
toc = true
+++

# AutoHeal a oprava regresí v detekci EA

[AutoHeal](@/glossary/autoheal.md) je autonomní mechanismus samoopravy Prismatic Platform, softwarové platformy, z níž kniha vzešla. Podle hesla glosáře bez lidského zásahu odhaluje a řeší regrese kvality, rozbité závislosti, posun konfigurace a selhání sestavení. Ve vztahu k taxonomii epistemických útoků (EA) se uplatňuje tehdy, když obranná vrstva, která dříve fungovala, začne selhávat – například když po změně přestane zachytávat vzorec, který dříve spolehlivě rozpoznávala. Stránka popisuje, jak AutoHeal pracuje, jaká rizika automatická oprava nese a proč kniha v jeho postupu vidí obdobu fázového přístupu ke krizové péči.

## Agent v kostce

Glosář popisuje AutoHeal jako mechanismus s pětistupňovou hierarchií zásahů – od lehkého stanovení výchozího stavu přes cílenou opravu až po úplnou obnovu – a s pravidlem, že razantnější opatření nastupují podle závažnosti zjištěného problému. Proti opakovaným neúspěšným pokusům chrání mechanismus jistič a každá oprava musí projít branami kvality. AutoHeal je reaktivní: reaguje na zjištěné regrese a vrací platformu do známého dobrého stavu. Jeho proaktivním protějškem je [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md).

Původní verze této stránky uvádí, že AutoHeal sleduje výchozí hodnoty klíčových ukazatelů obrany – například míru falešných poplachů a dobu odezvy – a zasahuje při statisticky významné odchylce od historického výchozího stavu. Výstupem je zpráva o opravě s hypotézou o příčině a s popisem provedeného zásahu.

## Proč se týká technik EA

Obrana proti technikám EA je soubor pravidel a kontrol, které se mění s každou úpravou platformy. Každá změna může nechtěně oslabit kontrolu, která dříve fungovala – například úprava zpracování zdrojů může vypnout kontrolu jejich nezávislosti. Taková regrese je nebezpečná právě tím, že je tichá: nic nespadne, jen obrana přestane zachytávat to, co zachytávala. AutoHeal proto sleduje výsledky obrany v čase a vrací ji do stavu, o němž je známo, že fungoval.

Původní stránka zmiňuje, že AutoHeal používá [protokoly zotavení](@/kompendium/recovery-protocols/_index.md) knihy jako referenční vzor pro stavbu svých opravných postupů: každý protokol má jasný vstupní stav, posloupnost kroků a kritéria, podle nichž se pozná, že krok uspěl. Heslo glosáře tuto souvislost formuluje přesněji: princip AutoHeal – nejprve stanovit výchozí stav, pak zasahovat přiměřeně závažnosti a každý zásah ověřit – má obdobu ve fázovém přístupu krizové péče a zotavení, který kniha popisuje (viz [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md)).

## Jak pracuje

Samooprava v provozu softwaru stojí na několika zavedených vzorcích. Nygard (2007) popsal jistič (*circuit breaker*), který po opakovaném selhání přestane volat selhávající součást a dá systému čas na zotavení, místo aby selhání eskaloval. Beyer a kolegové (2016) shrnuli praxi provozní spolehlivosti, v níž se odchylky měří proti stanoveným cílům a zásahy se odstupňovávají podle dopadu. AutoHeal tyto vzorce spojuje: stanoví výchozí stav, zjistí odchylku, zvolí nejmírnější zásah, který ji může napravit, ověří výsledek a teprve při neúspěchu pokračuje razantnějším krokem.

Opatrnost má dobrý důvod. Dekker (2011) upozornil, že systémy často selhávají postupným posunem, v němž je každý krok sám o sobě rozumný. Automatická oprava, která problém jen zakryje – například restartem služby –, může takový posun prodloužit. Původní stránka proto výslovně uvádí, že AutoHeal opravuje jen známé třídy regresí a že nové druhy degradace eskaluje na lidského operátora.

Každý zásah je navíc zapsán tak, aby šlo zpětně zjistit, co se změnilo a proč. Bez tohoto záznamu by se z opakovaných automatických oprav stala neprůhledná vrstva, v níž by se skutečné příčiny problémů ztrácely.

## Spolupráce s dalšími agenty

AutoHeal spouští [Blue Team](@/kompendium/aiad-integration/blue-team-ea-defense.md) a [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md), když zaznamenají odchylku. Technické kroky provádí s [Operational Execution](@/kompendium/aiad-integration/operational-execution-ea-deployment.md), dlouhodobé řešení připravuje s [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) a jeho opravy ověřuje [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md).

## Příklad

Po úpravě zpracování zdrojů Quality Monitor zaznamená, že obrana přestala označovat tvrzení s chybějící proveniencí; míra jejich zachycení klesla prakticky na nulu. AutoHeal začne nejmírnějším krokem – ověří výchozí stav a zjistí, která změna regresi způsobila. Druhým krokem vrátí dotčenou část konfigurace do posledního známého dobrého stavu. Pak ověří, že obrana znovu zachytává testovací scénáře, a teprve poté uzavře opravu se zprávou o příčině. Protože jde o známou třídu regrese, nepotřebuje lidský zásah; skutečnou úpravu zpracování zdrojů, která regresi způsobila, předá k přepracování.

V krizové péči odpovídá tomuto postupu zásada, kterou kniha popisuje u akutních stavů: nejprve stabilizovat a zjistit výchozí stav, pak volit nejmírnější účinný zásah a jeho účinek ověřit dřív, než se přistoupí k razantnějšímu (srov. [deeskalace](@/kompendium/emergency-protocols/20-deescalation-EA.md) a [vyhnutí se omezovacím prostředkům](@/kompendium/emergency-protocols/19-restraint-avoidance-EA.md)).

## Co z toho plyne pro čtenáře knihy

Prvním poučením je **přiměřenost zásahu**. AutoHeal stupňuje zásahy podle závažnosti a začíná nejmírnějším. Kniha uplatňuje stejnou zásadu v krizové péči i v organizační nápravě: razantní kroky – hospitalizace, propuštění, veřejné obvinění – mají přijít až tehdy, když mírnější nestačí, a mají být zdůvodněné.

Druhým poučením je **„známý dobrý stav“**. Oprava je možná jen tehdy, když víme, k čemu se vracet. U lidí po manipulaci je tímto stavem často to, jak člověk žil, myslel a s kým se stýkal předtím. Kniha k tomu nabízí [rekonstrukci časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md) a [vztahové kotvy](@/kompendium/self-defense-guides/42-relational-anchors.md); zároveň upozorňuje, že návrat není vždy cílem, protože člověk se zkušeností mění.

Třetím poučením je **pozor na zakrytí příznaku**. Oprava, která odstraní projev, ale ne příčinu, může problém prodloužit. V klinice to odpovídá varování před léčbou příznaků bez porozumění kontextu, který je udržuje, a v organizacích před nápravou, která vymění jednoho člověka, ale ponechá strukturu.

## Samooprava a lidská sebeobrana

Kniha často mluví o sebeobraně a sebeobnově, a srovnání s AutoHeal pomáhá ukázat, kde je tato analogie užitečná a kde zavádějící. Užitečná je v tom, že i lidská obnova potřebuje výchozí stav, stupňované kroky a ověření. Zavádějící by byla představa, že se člověk po manipulaci má „opravit sám“, bez pomoci a rychle. Hermanová (1992) zdůraznila, že zotavení z dlouhodobého traumatu probíhá ve vztazích, nikoli v izolaci, a že bezpečí a obnova spojení s druhými jsou jeho podmínkou. AutoHeal navíc u nových druhů selhání eskaluje na člověka; lidská obdoba je vyhledat odbornou pomoc, když vlastní kroky nestačí, a nepovažovat to za selhání. Kniha k tomu odkazuje na [mobilizaci podpory](@/kompendium/self-defense-guides/30-support-mobilization.md) a na [akutní sociální rekonekci](@/kompendium/recovery-protocols/acute-social-reconnection.md).

## Meze a otevřené otázky

AutoHeal opravuje jen známé třídy regresí; nové druhy selhání vyžadují lidský úsudek. Automatický restart může skutečný problém maskovat. Původní stránka uváděla i cílové doby obnovy; konkrétní hodnoty se s vývojem platformy mění, a proto se zde neuvádějí. Otevřenou otázkou je, jak nastavit prahy, aby AutoHeal nezasahoval příliš často kvůli běžnému kolísání, a přitom nezmeškal skutečnou regresi.

## Literatura

- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.) (2016). *Site Reliability Engineering: How Google Runs Production Systems*. Sebastopol, CA: O'Reilly Media.
- Dekker, S. (2011). *Drift into Failure: From Hunting Broken Components to Understanding Complex Systems*. Farnham: Ashgate.
- Nygard, M. T. (2007). *Release It! Design and Deploy Production-Ready Software*. Raleigh, NC: Pragmatic Bookshelf.

## Související

**Agenti**

- [AutoEvolve a vývoj vzorců](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) – proaktivní protějšek.
- [Quality Monitor a sledování](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – zachycuje odchylky.
- [Operational Execution a nasazení](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) – provádí opravné kroky.

**Pojmy**

- [AutoHeal](@/glossary/autoheal.md) – heslo glosáře.
- [Regression Test](@/glossary/regression-test.md) – ověření, že oprava nic nerozbila.

**Kniha**

- [Akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md) – lidská obdoba přiměřeného zásahu.
- [Protokoly zotavení](@/kompendium/recovery-protocols/_index.md) – fázový rámec obnovy.
