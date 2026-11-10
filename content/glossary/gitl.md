+++
title = "GITL"
weight = 100
description = "GITL (GitLab Integration & Traceability Linkage): pilíř doktríny Prismatic Platform pro dohledatelnost změn – formát commitů a vazba na úkoly. Vztah ke Kompendiu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "evidence"]

[extra]
category = "doctrine"
abbreviation = "GITL"
related_terms = ["doctrine", "nclb", "chain-of-custody", "session-discipline", "nm-nd"]
keywords = ["GITL", "traceability", "dohledatelnost", "conventional commits", "GitLab", "doktrína"]
+++

## Definice

**GITL** (*GitLab Integration & Traceability Linkage*) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform, který zajišťuje **dohledatelnost změn**: ke každé změně v kódu má být zřejmé, proč vznikla a k jakému úkolu patří. Příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény *Traceability*, index pojmů jej popisuje jako doktrínu „pro commit-issue traceability“, tedy pro vazbu mezi záznamem změny (*commit*) a úkolem v systému správy úkolů (*issue*).

Pojem patří do kontextu platformy, ne do taxonomie epistemické anihilace.

## Původ a kontext pojmu

Název odkazuje na GitLab, službu pro správu repozitářů a úkolů, na níž platforma vznikala. Samotná myšlenka dohledatelnosti je však v softwarovém inženýrství mnohem starší: v regulovaných oborech (zdravotnická technika, letectví, bankovnictví) se od vývojářů dlouho vyžaduje, aby každý požadavek šlo sledovat až ke kódu, který ho plní, a ke zkoušce, která to ověřila. Systémy pro správu verzí (git) a úkolů tuto vazbu jen zlevnily – stačí, aby zpráva commitu nesla číslo úkolu.

Formát zpráv přebírá GITL z veřejné konvence *Conventional Commits* (Conventional Commits 1.0.0), podle níž zpráva začíná typem změny a krátkým popisem. Konvence vznikla proto, aby historie repozitáře byla čitelná pro lidi i pro nástroje, které z ní například generují seznam změn nebo určují číslo další verze.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy GITL zahrnuje:

- **formát zprávy commitu** podle konvence *Conventional Commits* – zpráva začíná typem změny, například `feat:`, `fix:`, `refactor:`, `perf:`, `docs:`, `test:` nebo `chore:`;
- **vazbu na úkol** – každý commit má obsahovat odkaz na číslo úkolu; v novějších verzích je tato vazba vynucena striktně a ruční výjimky byly odstraněny, s úzkými výjimkami (slučovací commity, vrácení sloučení, úplně první commit repozitáře a commity schváleného automatického účtu se zvláštní značkou);
- doporučení k používání štítků a milníků, která jsou jen poradní.

Kontrola formátu probíhá v CI před sloučením změny; vazba na úkol se v novějších verzích hlídá už při commitu. Aby pravidlo nebylo jen překážkou, nabízí platforma pomocný skript, který úkol založí a jeho číslo připraví k vložení do zprávy.

V historii repozitáře se pilíř projevuje tak, že u každé změny lze přejít od řádku kódu k commitu, od commitu k úkolu a od úkolu k diskusi, v níž se rozhodlo, proč změna vznikla.

## Mechanismus: proč takové pravidlo existuje

Rozsáhlý systém, na kterém pracuje mnoho lidí a automatizovaných agentů, potřebuje **paměť rozhodnutí**. Bez vazby mezi změnou a jejím důvodem nelze zpětně zjistit, proč kód vypadá tak, jak vypadá, kdo změnu odsouhlasil a zda opravdu řešila zadaný problém. Dohledatelnost je předpokladem auditu, přezkumu a odpovědnosti.

Strukturálně má dohledatelnost tři složky, které se v Kompendiu opakují i mimo software:

1. **Původ** – odkud změna (tvrzení, důkaz) pochází.
2. **Důvod** – na jakou otázku odpovídá.
3. **Řetěz** – přes koho a přes jaké kroky prošla, než se stala součástí celku.

Chybí-li kterákoli z nich, stává se celek neprůhledným: lze ho přijmout nebo odmítnout, ale ne přezkoumat. Právě neprůhlednost je přitom podmínkou mnoha manipulačních vzorců, které kniha popisuje.

Obecný příklad: v modulu, který hodnotí důvěryhodnost zdrojů, se po čase objeví neobvykle nízká váha pro určitý typ dokumentů. Bez dohledatelnosti by nezbylo než hádat, zda jde o chybu, nebo o záměr. S GITL vede řádek kódu ke commitu `fix: …` s číslem úkolu, úkol k hlášení o konkrétním případu podvrženého dokumentu a hlášení k rozhodnutí, které váhu snížilo. Kdo s rozhodnutím nesouhlasí, ví, s čím přesně nesouhlasí, a může navrhnout jinou změnu se stejnou dohledatelností.

## Odlišení

GITL se nejtěsněji dotýká pilíře [NCLB](@/glossary/nclb.md), ale každý z nich chrání dohledatelnost na jiné vrstvě: NCLB požaduje, aby tvrzení v dokumentaci byla doložena důkazem, GITL, aby změna kódu byla vázána na důvod. Od [Session Discipline](@/glossary/session-discipline.md) se liší tím, že kázeň pracovní relace se týká průběžného zapisování a odesílání práce, kdežto GITL formy a vazby jednotlivých zápisů.

Dohledatelnost je také třeba odlišit od dohledu. GITL sleduje změny, ne lidi; nejde o měření výkonu vývojářů, ale o to, aby rozhodnutí šla vysvětlit. Stejně tak dohledatelnost neznamená pravdivost – dohledatelný záznam může být chybný, dohledatelnost jen umožňuje chybu najít a opravit. A konečně se pravidlo míjí účinkem, stane-li se byrokracií: úkol založený jen proto, aby měl commit číslo, splní kontrolu, ale paměť rozhodnutí nevytvoří. Dokumentace platformy proto zjednodušuje zakládání úkolů, aby se vazba nevyplňovala formálně.

## Význam pro Kompendium

GITL sám o sobě není pojmem knihy, ale jeho princip má v Kompendiu jasnou obdobu. Kniha opakovaně trvá na tom, aby každé tvrzení bylo **dohledatelné ke zdroji**:

- ve forenzní práci odpovídá dohledatelnosti [řetězec úschovy důkazů](@/glossary/chain-of-custody.md) – u každého důkazu musí být zřejmé, odkud pochází a kdo s ním nakládal;
- v metodice knihy odpovídá dohledatelnosti pravidlo, že se cituje jen ověřitelná literatura, a pilíř [NCLB](@/glossary/nclb.md), podle něhož žádné tvrzení nezůstane bez doložení;
- v klinické dokumentaci odpovídá dohledatelnosti oddělení pozorování od interpretace a záznam toho, z čeho úsudek vychází.

Tyto paralely jsou interpretační: GITL řídí práci s kódem, ne práci s lidmi. Repozitář knihy však podobnou disciplínu uplatňuje i na vlastní historii – změny obsahu se zapisují konvenčními commity.

Obsahově je dohledatelnost obranou proti několika vzorcům, které kniha rozebírá. [Paměťová rekonstrukce](@/kompendium/techniques/ea-1-2-2-memorni-rekonstrukce.md) a [gaslighting](@/glossary/gaslighting.md) pracují s tím, že člověk nemá vlastní záznam událostí a musí přijmout výklad druhého. Proto obranné a zotavovací kapitoly doporučují vést si datovaný deník, uchovávat korespondenci a oddělovat zápis toho, co se stalo, od toho, co si o tom člověk myslí. Takový osobní „log“ je lidskou obdobou historie commitů: nedokazuje vše, ale dovoluje později ověřit, co bylo řečeno a kdy. Podrobněji to rozvádí [rekonstrukce biografické časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md).

## Meze přenosu

Úplná dohledatelnost je u softwaru žádoucí; u lidské zkušenosti nemusí být možná ani etická. Výpověď oběti, která nemá „číslo úkolu“ ani listinný důkaz, není méně pravdivá. Kompendium proto princip dohledatelnosti používá jako nárok na vlastní tvrzení, ne jako měřítko důvěryhodnosti lidí, kteří vypovídají; Miranda Fricker ukázala, že upírání důvěryhodnosti mluvčímu je samostatnou formou křivdy (Fricker 2007; srov. [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)).

Druhou mezí je bezpečí. Záznam, který chrání oběť, může v nesprávných rukou posloužit i kontrole – v prostředí [coercive control](@/glossary/coercive-control.md) je sledování zpráv, polohy a historie zařízení jedním z nástrojů ovládání (Stark 2007). Rada vést si záznamy proto vždy zahrnuje i otázku, kde je záznam v bezpečí a kdo k němu má přístup.

Otevřenou otázkou zůstává, jak dohledatelnost zachovat u práce automatizovaných agentů, kteří změny navrhují rychleji, než je člověk stačí číst. Vazba na úkol tu nestačí; potřebný je i záznam, kdo změnu schválil a na základě jakého ověření.

## Literatura

- *Conventional Commits 1.0.0* – veřejná specifikace formátu zpráv commitů, z níž GITL vychází.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press – k mezi, za kterou se požadavek doložení obrací proti vypovídajícím.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press – ke sledování jako nástroji kontroly.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [NCLB](@/glossary/nclb.md) – doložitelnost tvrzení.
- [Session Discipline](@/glossary/session-discipline.md) – kázeň pracovní relace, včetně průběžných commitů.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada.

**Kniha**

- [Chain of custody](@/glossary/chain-of-custody.md) – forenzní obdoba dohledatelnosti.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – proč dohledatelnost nesmí měřit důvěryhodnost lidí.
- [Rekonstrukce biografické časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md) – osobní záznam jako opora proti přepisování paměti.
- [Gaslighting](@/glossary/gaslighting.md) – vzorec, proti němuž chrání vlastní záznam událostí.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – souvislosti knihy a platformy.
