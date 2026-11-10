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

## Co pilíř vyžaduje

Podle provozní dokumentace platformy GITL zahrnuje:

- **formát zprávy commitu** podle konvence *Conventional Commits* – zpráva začíná typem změny, například `feat:`, `fix:`, `refactor:`, `docs:` nebo `test:`;
- **vazbu na úkol** – každý commit má obsahovat odkaz na číslo úkolu; v novějších verzích je tato vazba vynucena striktně a ruční výjimky byly odstraněny, s úzkými výjimkami (např. slučovací commity);
- doporučení k používání štítků a milníků, která jsou jen poradní.

Kontrola formátu probíhá v CI před sloučením změny; vazba na úkol se v novějších verzích hlídá už při commitu.

## Proč takové pravidlo existuje

Rozsáhlý systém, na kterém pracuje mnoho lidí a automatizovaných agentů, potřebuje **paměť rozhodnutí**. Bez vazby mezi změnou a jejím důvodem nelze zpětně zjistit, proč kód vypadá tak, jak vypadá, kdo změnu odsouhlasil a zda opravdu řešila zadaný problém. Dohledatelnost je předpokladem auditu, přezkumu a odpovědnosti.

## Vztah ke Kompendiu

GITL sám o sobě není pojmem knihy, ale jeho princip má v Kompendiu jasnou obdobu. Kniha opakovaně trvá na tom, aby každé tvrzení bylo **dohledatelné ke zdroji**:

- ve forenzní práci odpovídá dohledatelnosti [řetězec úschovy důkazů](@/glossary/chain-of-custody.md) – u každého důkazu musí být zřejmé, odkud pochází a kdo s ním nakládal;
- v metodice knihy odpovídá dohledatelnosti pravidlo, že se cituje jen ověřitelná literatura, a pilíř [NCLB](@/glossary/nclb.md), podle něhož žádné tvrzení nezůstane bez doložení;
- v klinické dokumentaci odpovídá dohledatelnosti oddělení pozorování od interpretace a záznam toho, z čeho úsudek vychází.

Tyto paralely jsou interpretační: GITL řídí práci s kódem, ne práci s lidmi. Repozitář knihy však podobnou disciplínu uplatňuje i na vlastní historii – změny obsahu se zapisují konvenčními commity.

## Meze přenosu

Úplná dohledatelnost je u softwaru žádoucí; u lidské zkušenosti nemusí být možná ani etická. Výpověď oběti, která nemá „číslo úkolu“ ani listinný důkaz, není méně pravdivá. Kompendium proto princip dohledatelnosti používá jako nárok na vlastní tvrzení, ne jako měřítko důvěryhodnosti lidí, kteří vypovídají (srov. [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)).

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [NCLB](@/glossary/nclb.md) – doložitelnost tvrzení.
- [Session Discipline](@/glossary/session-discipline.md) – kázeň pracovní relace, včetně průběžných commitů.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada.

**Kniha**

- [Chain of custody](@/glossary/chain-of-custody.md) – forenzní obdoba dohledatelnosti.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – proč dohledatelnost nesmí měřit důvěryhodnost lidí.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – souvislosti knihy a platformy.
