+++
title = "Operational Execution a nasazení obrany proti EA"
description = "Jak nejnižší výkonná vrstva Prismatic Platform nasazuje obranné změny, proč vykonává bez otázek a proto potřebuje ověření nad sebou – a co z toho plyne pro poslušnost v lidských organizacích."
weight = 20

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "operational"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["tactical-execution-ea-operations", "strategic-command-ea-coordination", "autoheal-ea-regression-repair", "quality-monitor-ea-tracking", "archer-supreme-ea-orchestration"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Operational Execution a nasazení obrany proti EA

Operational Execution je podle původní verze této stránky nejnižší výkonnou vrstvou ve velitelské hierarchii agentů Prismatic Platform, softwarové platformy, z níž kniha vzešla. Nasazuje změny do provozu, restartuje služby, obměňuje klíče a provádí okamžité reakce, které jí zadá vyšší vrstva. Ve vztahu k taxonomii epistemických útoků (EA) sama nic nedetekuje: sleduje jen to, zda každá operace uspěla, a výsledek hlásí výš. Právě tato vlastnost – vykonávat bez otázek – z ní dělá zajímavý příklad pro knihu. V softwaru je to žádoucí a bezpečné jen díky ověření nad ní; v lidských organizacích je tatáž vlastnost jedním z předpokladů, na nichž stojí manipulace.

## Agent v kostce

Operational Execution pracuje v časovém měřítku minut až hodin a je k dispozici nepřetržitě. Vstupem jsou konkrétní příkazy od [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md), výstupem záznamy o nasazení se stavem před změnou a po ní a s podmínkami pro návrat k předchozímu stavu. Původní stránka uvádí, že agent nezná kontext: provádí příkazy a neptá se, a špatný příkaz se tedy provede stejně rychle jako dobrý. Proto vyžaduje robustní ověřování na vyšších úrovních.

Glosář [úrovní agentů](@/glossary/agent-tier.md) vysvětluje obecný princip, který to umožňuje: oprávnění jsou odstupňovaná, agent nižší úrovně nemůže přepsat rozhodnutí vyšší úrovně ani si sám zvýšit oprávnění a tato omezení se vynucují za běhu. Výkonná vrstva tedy může být „poslušná“, protože kontrola je zabudována jinde.

## Proč se týká technik EA

Na první pohled se Operational Execution taxonomie netýká – nečte texty, nehodnotí zdroje, nerozpoznává vzorce. Ve skutečnosti je posledním článkem, jímž se rozhodnutí obrany stávají skutečností. Pokud by do rozhodovacího řetězce nad ní pronikl manipulovaný podklad – například tvrzení s podvrženou proveniencí, které by vedlo k vypnutí kontroly –, provedla by výkonná vrstva i chybný krok. Obrana proti technikám EA proto musí být umístěna nad ní: v kontrole nezávislosti zdrojů, v [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md), v ověřování [White Teamem](@/kompendium/aiad-integration/white-team-ea-verification.md). Původní stránka uvádí, že agent pro rychlou orientaci používá i [rychlé referenční karty](@/kompendium/quick-reference/_index.md) a [historické případy](@/kompendium/historical-cases/_index.md) jako precedenty.

## Jak pracuje

Bezpečné nasazování změn je v softwarovém inženýrství dobře propracovanou disciplínou. Humble a Farley (2010) popsali průběžné doručování, v němž každá změna prochází automatizovanými kontrolami a lze ji kdykoli vrátit; Beyer a kolegové (2016) shrnuli praxi provozní spolehlivosti, v níž se změny nasazují postupně, sledují se jejich dopady a návrat k předchozímu stavu je připraven předem. Záznam stavu před změnou a po ní, který Operational Execution vytváří, je nezbytnou podmínkou takového návratu.

Druhým principem je oddělení rozhodnutí od provedení. Operational Execution nerozhoduje o tom, co se má udělat; to rozhodují vyšší vrstvy. Toto oddělení má v návrhu systémů dlouhou tradici a souvisí se zásadou nejmenšího oprávnění (Saltzer a Schroeder 1975): výkonná součást má jen ta oprávnění, která potřebuje k provedení, ne k rozhodování.

Třetím principem je postupnost. Změna se nenasazuje všude najednou, ale tak, aby se její dopad dal sledovat a případně zastavit dřív, než zasáhne celý systém.

## Spolupráce s dalšími agenty

Operational Execution přijímá příkazy od [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) a v krizi od rozdělení úkolů [Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md). Spolupracuje s [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) při samoopravě a jeho záznamy zpracovává [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md). Nasazení koordinuje se [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md).

## Příklad

[Tactical Execution](@/glossary/tactical-execution.md) zadá nasazení upravené kontroly nezávislosti zdrojů. Operational Execution zaznamená stav před změnou, změnu nasadí, ověří, že služby běží, a záznam předá dál. Quality Monitor po nasazení zjistí, že míra zachycených tvrzení bez provenience se nečekaně zvýšila tak, že zablokovala i legitimní tvrzení. Návrat k předchozímu stavu je připraven, a změna se proto vrátí během krátké doby, aniž by byla zasažena data. Operational Execution nehodnotí, zda byla změna dobrá nebo špatná; zajistí, že ji lze bezpečně provést i bezpečně vrátit, a hodnocení ponechá vrstvám, které k němu mají informace.

## Co z toho plyne pro čtenáře knihy

Nejdůležitější poučení je kontrastní. V softwaru je výkonná vrstva, která „neptá se“, bezpečná proto, že nemá vlastní zájmy, nemůže být zastrašena ani okouzlena a nad ní existuje několik nezávislých kontrol. V lidských organizacích je situace opačná. Výzkum poslušnosti vůči autoritě (Milgram 1974) ukázal, jak snadno lidé provádějí pokyny, s nimiž by sami nesouhlasili, pokud je vydává autorita a odpovědnost se zdá ležet jinde. Arendtová (1963) popsala, jak rozsáhlé škody mohou působit lidé, kteří přestali posuzovat, co provádějí. Kniha proto nepřebírá model „výkonné vrstvy bez otázek“ do lidské roviny; naopak jej považuje za jednu z podmínek, za nichž se manipulativní struktura udrží (srov. [prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md) a stránku [Arendtová: banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md)).

Přenositelné jsou dva jiné principy. Prvním je **vratnost**: každý zásah, který se dělá, má mít připravenou cestu zpět. V klinice tomu odpovídá zásada, že intervence nemá uzavírat možnosti, a v organizacích, že zásadní rozhodnutí o lidech mají mít mechanismus přezkumu. Druhým je **záznam stavu před a po**: kdo chce posoudit, zda zásah pomohl, musí vědět, jak situace vypadala předtím. Kniha k tomu doporučuje [dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md) a v klinice [observační posouzení](@/kompendium/06-klinicke-aplikace/observational-assessment.md).

## Vratnost jako etická zásada

Připravený návrat k předchozímu stavu je v provozu softwaru technickou samozřejmostí. V knize má tatáž myšlenka etický rozměr. Etický rámec [Předmluvy](@/kompendium/01-predmluva/eticke-aspekty.md) i pojistky [terminálních protokolů](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md) požadují, aby každý intenzivní zásah do lidského prožívání měl předem připravenou cestu zpět a fázi obnovy. Destruktivní sekvence se od legitimních programů liší právě tím, že návrat neumožňují: odchod je trestán, dřívější vztahy jsou přerušeny, minulost je přepsána. Operational Execution tak nepřímo ilustruje kritérium, které kniha používá k rozlišení: zásah, který nelze vrátit, vyžaduje mimořádné zdůvodnění a mimořádnou kontrolu. Beauchamp a Childress (2019) formulují obdobnou úvahu v rámci principu nepoškozování, který vyžaduje vážit nevratná rizika přísněji než vratná.

## Meze a otevřené otázky

Operational Execution nezná kontext a nemůže zachytit chybný příkaz; spoléhá na ověření nad sebou. Pokud vyšší vrstvy selžou, provede chybu stejně spolehlivě jako správný krok. Původní stránka uvádí i časová měřítka provozu; konkrétní hodnoty se s vývojem platformy mění, a proto se zde neuvádějí. Otevřenou otázkou pro lidské organizace zůstává, jak vytvořit prostředí, v němž lidé na výkonných pozicích mohou bezpečně odmítnout pokyn, který považují za škodlivý – kniha k tomu odkazuje na [psychologické bezpečí](@/kompendium/organizational-defense/16-psychological-safety.md) a [ochranu oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md).

## Literatura

- Beauchamp, T. L., & Childress, J. F. (2019). *Principles of Biomedical Ethics* (8th ed.). New York: Oxford University Press.
- Arendt, H. (1963). *Eichmann in Jerusalem: A Report on the Banality of Evil*. New York: Viking Press.
- Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.) (2016). *Site Reliability Engineering: How Google Runs Production Systems*. Sebastopol, CA: O'Reilly Media.
- Humble, J., & Farley, D. (2010). *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Upper Saddle River, NJ: Addison-Wesley.
- Milgram, S. (1974). *Obedience to Authority: An Experimental View*. New York: Harper & Row.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*, 63(9), 1278–1308.

## Související

**Agenti**

- [Tactical Execution a operace](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) – zdroj příkazů.
- [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – samooprava.
- [Trinity Gate a ověřování](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – kontrola nad výkonnou vrstvou.

**Pojmy**

- [Agent Tier](@/glossary/agent-tier.md) – odstupňovaná oprávnění.
- [Prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md) – poslušnost bez otázek u lidí.

**Kniha**

- [Arendtová: banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md) – proč model nepřenášet na lidi.
- [Psychologické bezpečí](@/kompendium/organizational-defense/16-psychological-safety.md) – prostor pro odmítnutí pokynu.
