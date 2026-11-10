+++
title = "Czech ARES a screening subjektů s ohledem na EA"
description = "Jak doménový agent Czech ARES na Prismatic Platform porovnává údaje českých veřejných rejstříků s dalšími zdroji a hledá nesoulad, který může nést stopy manipulace – a kde jsou meze rejstříkových dat."
weight = 29

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "due-diligence"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["osint-ea-source-validation", "dd-engine-ea-source-weighting", "compliance-ea-regulatory-screening", "epistemic-pipeline-ea-detection", "decision-engine-ea-calibration"]
toc = true
+++

# Czech ARES a screening subjektů s ohledem na EA

Czech ARES je podle původní verze této stránky doménovým agentem Prismatic Platform, softwarové platformy, z níž kniha vzešla, který propojuje údaje z českých veřejných rejstříků s detekcí stop epistemických útoků (EA). ARES – Administrativní registr ekonomických subjektů – je informační systém Ministerstva financí České republiky, který zpřístupňuje údaje o ekonomických subjektech z veřejných rejstříků a dalších zdrojů veřejné správy. Agent tyto údaje porovnává s tím, co o subjektu tvrdí jiné zdroje, a nesoulad označuje jako podnět k prověření. Uplatňuje se v prověrkách protistran, při posuzování vlastnických struktur a při hledání zdánlivých subjektů. Stránka popisuje jeho roli, jeho vztah k taxonomii knihy a meze, které je třeba znát při práci s rejstříkovými daty.

## Agent v kostce

Agent pracuje na principu křížového ověřování: porovnává deklarace o subjektu s údaji v ARES, s informacemi o skutečných majitelích, s dalšími veřejnými zdroji a s výstupy agenta [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md). Nesoulad – například jiný předmět činnosti, než subjekt uvádí, nebo vlastnická struktura, která se v jednotlivých zdrojích liší – označí s mírou důvěry. Výstupem je profil subjektu s označenými odchylkami. Agent je součástí procesu prověrek, který řídí [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md).

Právní rámec dat, s nimiž agent pracuje, tvoří zejména zákon č. 304/2013 Sb., o veřejných rejstřících právnických a fyzických osob, a zákon č. 37/2021 Sb., o evidenci skutečných majitelů. Pro knihu není podstatné jejich podrobné znění, ale to, že veřejné rejstříky jsou deklarativními zdroji: obsahují to, co bylo zapsáno, a jejich pravdivost závisí na tom, kdo a jak údaje zapsal.

## Proč se týká technik EA

Taxonomie knihy popisuje techniky, které pracují s důvěryhodností zdrojů. V oblasti obchodních subjektů mají konkrétní podobu: **zdánlivá legitimita**, kdy zápis v rejstříku slouží jako doklad důvěryhodnosti, i když o skutečné činnosti nic neříká; **zastření vlastnictví** prostřednictvím řetězců subjektů a zprostředkovatelů; a **narativní konstrukce**, kdy subjekt o sobě šíří příběh, který rejstříková data nepodporují. Kniha tyto jevy rozvádí na stránkách [EA × OSINT: ověřování ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md), [EA × OSINT: Justice.cz](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) a [EA × Due Diligence: dezinformace o skutečném vlastnictví](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md).

Agent podle původní stránky využívá i [případové studie](@/kompendium/case-studies/_index.md) jako precedenty manipulace s firemními údaji. Kniha přitom pracuje výhradně s anonymizovanými kompozity; konkrétní subjekty se v této souvislosti nejmenují.

## Jak pracuje

Jádrem práce agenta je sjednocování záznamů o téže entitě napříč zdroji, které se zapisují odlišně – s různými tvary jmen, adres a identifikátorů. Tato úloha se v informatice nazývá *entity resolution* a má dlouhou tradici; Fellegi a Sunter (1969) formulovali její pravděpodobnostní teorii a Christen (2012) shrnul současné metody. Pro knihu je podstatné, že každé sjednocení je hypotézou s mírou jistoty: dvě osoby se stejným jménem a příjmením nemusí být totožné a záměna může mít vážné následky pro konkrétního člověka (viz heslo [Entity Resolution](@/glossary/entity-resolution.md)).

Druhým principem je **nesoulad jako podnět, ne jako závěr**. Rozdíl mezi zdroji může znamenat manipulaci, ale také zpoždění zápisu, chybu v datech nebo legitimní změnu. Agent proto nesoulad označí a předá k posouzení; o jeho významu rozhodují další kroky prověrky. To odpovídá [axiomu zachování rozporu](@/glossary/nabla-axioms.md): rozpor se nezahazuje ani nevykládá předčasně.

## Spolupráce s dalšími agenty

Czech ARES spolupracuje s agentem [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md), který doplňuje údaje z dalších veřejných zdrojů; jeho data využívá [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) a jeho závěry z hlediska regulatorních povinností posuzuje [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md). Hloubkovou analýzu jednotlivých tvrzení může provést [epistemický proces](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md).

## Příklad

Prověrka se týká dodavatele, který o sobě uvádí dlouholetou historii a rozsáhlou činnost v určitém oboru. Agent zjistí, že subjekt byl zapsán teprve nedávno, že jeho předmět podnikání v rejstříku uvedenému oboru neodpovídá a že v evidenci skutečných majitelů je uveden jiný člověk, než kterého subjekt prezentuje jako zakladatele. Agent nevydá závěr „podvodný subjekt“. Označí tři nesoulady s mírou důvěry, uvede možná vysvětlení – například přeměnu nebo převzetí činnosti od jiného subjektu – a doporučí ověřit je ve sbírce listin a u dalších zdrojů. Teprve DD Engine a lidský analytik rozhodnou, co nesoulady znamenají.

## Co z toho plyne pro čtenáře knihy

Prvním poučením je **zápis není důkaz důvěryhodnosti**. Lidé často vnímají existenci záznamu v úředním rejstříku jako potvrzení, že je se subjektem vše v pořádku. Kniha upozorňuje, že úřední forma může sloužit jako nástroj zdánlivé legitimity – stejně jako tituly, certifikáty nebo členství v organizacích u jednotlivců (srov. [rekonfiguraci kvalifikací](@/kompendium/techniques/ea-2-1-10-credentials-rekonfigurace.md)). Obranou je ptát se, co záznam skutečně dokládá a co ne.

Druhým poučením je **opatrnost se ztotožněním osob**. Kdo pracuje s veřejnými daty o lidech, může snadno zaměnit dvě osoby a poškodit nevinného. Kniha zdůrazňuje, že vyhledávání informací o soukromých osobách bez právního důvodu je v rozporu s jejím rámcem a že OSINT má dvojí použití (viz heslo [OSINT](@/glossary/osint.md) a [doxing](@/glossary/doxing.md)).

Třetím poučením je **rozpor jako otázka**. Nesoulad mezi tím, co o sobě někdo tvrdí, a tím, co dokládají nezávislé zdroje, je v knize jedním z obecných znaků manipulace – v obchodu i ve vztazích. Kniha však varuje před tím, aby se každý nesoulad četl jako úmysl; vede k tomu, aby se nesoulad zapsal a ověřil (srov. [verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md)).

## Rejstřík jako zdroj s historií

Užitečné je chápat rejstřík nikoli jako snímek, ale jako záznam s historií. Změny sídla, statutárních orgánů, společníků nebo předmětu činnosti v čase často vypovídají víc než současný stav. Rychlé a opakované změny mohou mít legitimní důvody, ale v kombinaci s jinými signály – například s narativem o dlouholeté stabilitě – vytvářejí nesoulad, který stojí za ověření. Agent proto podle povahy prověrky nepracuje jen s aktuálním výpisem, ale i s historií zápisů. Lidskou obdobou je zásada, kterou kniha uplatňuje v klinice i ve forenzní práci: posuzovat průběh, ne jednotlivý okamžik (srov. [rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md)). Stejně jako u lidí platí, že změna sama o sobě není podezřelá; podezřelý je rozpor mezi změnou a tím, jak o ní subjekt mluví.

## Meze a otevřené otázky

Agent je vázán na český právní a rejstříkový režim a pro jiné jurisdikce by potřeboval odpovídající přizpůsobení. Je závislý na úplnosti a aktuálnosti veřejných dat; tam, kde údaje chybějí nebo jsou zapsány nepravdivě, může nesoulad přehlédnout, nebo naopak označit nesoulad, který vzniká jen chybou v datech. Původní stránka uváděla i časové parametry zpracování a odkaz na konkrétní případ; ty se zde neuvádějí. Otevřenou otázkou je, jak vyvážit užitečnost veřejných rejstříků pro prověrky s ochranou soukromí osob, které jsou v nich zapsány.

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection*. Berlin: Springer.
- Fellegi, I. P., & Sunter, A. B. (1969). A theory for record linkage. *Journal of the American Statistical Association*, 64(328), 1183–1210.
- Zákon č. 304/2013 Sb., o veřejných rejstřících právnických a fyzických osob a o evidenci svěřenských fondů.
- Zákon č. 37/2021 Sb., o evidenci skutečných majitelů.

## Související

**Agenti**

- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – doplňuje veřejné údaje.
- [DD Engine a vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – využívá výstupy agenta.
- [Compliance a regulatorní screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) – posuzuje povinnosti.

**Pojmy**

- [Entity Resolution](@/glossary/entity-resolution.md) – sjednocování záznamů.
- [Due Diligence](@/glossary/due-diligence.md) – prověrka protistrany.
- [OSINT](@/glossary/osint.md) – dvojí použití otevřených zdrojů.

**Kniha**

- [EA × OSINT: ověřování ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) – podrobný rozbor.
- [Dezinformace o skutečném vlastnictví](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – zastření vlastnictví.
