+++
title = "NCLB"
weight = 100
description = "NCLB (No Claim Left Behind): pilíř doktríny Prismatic Platform, podle něhož žádné tvrzení nezůstane bez ověřitelného důkazu. Co vyžaduje a proč je obranným principem knihy."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "evidence", "quality"]

[extra]
category = "doctrine"
abbreviation = "NCLB"
related_terms = ["doctrine", "falsifikovatelnost", "evidence-based", "chain-of-custody", "signal-plurality"]
keywords = ["NCLB", "No Claim Left Behind", "doložitelnost tvrzení", "evidence", "ověřitelnost", "doktrína"]
+++

## Definice

**NCLB** (*No Claim Left Behind*, volně „žádné tvrzení bez opory“) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform v doméně *Evidence integrity*. Požaduje, aby **každé tvrzení**, které platforma vysloví – v dokumentaci, v reportu, v analýze –, bylo **podloženo ověřitelným důkazem**. Index pojmů jej shrnuje jako doktrínu „evidence-based platform integrity“.

Na rozdíl od většiny ostatních pilířů má NCLB pro knihu přímý obsahový význam: podrobně ho rozebírá [most k pojmu NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md). Toto heslo shrnuje jeho platformní podobu a vztah ke Kompendiu.

## Co pilíř vyžaduje

Podle provozní dokumentace platformy NCLB zahrnuje:

- **univerzální ověřování tvrzení** – každé tvrzení platformy musí být podloženo ověřitelným důkazem;
- **dynamický sběr důkazů** – čísla a metriky se mají brát z běžícího systému, ne psát natvrdo;
- **validační proces** – tvrzení a jejich důkazy se dávkově ověřují v CI;
- **konzistenci napříč platformou** – dokumentace má odpovídat živým datům.

Pilíř je v CI **blokující**: změna, jejíž tvrzení neprojdou ověřením, se nesloučí. Na mnoha stránkách Kompendia, které vznikly v prostředí platformy, se NCLB uvádí v poznámce o souladu s doktrínou – například že tvrzení odvozená umělou inteligencí musí být doložena.

## Proč takové pravidlo existuje

Dokumentace velkého systému zastarává rychleji, než ji kdo stačí opravit, a čísla v ní („tolik modulů“, „tolik agentů“) se brzy rozejdou se skutečností. Tvrzení bez zdroje pak mate uživatele i autory. NCLB nahrazuje víru v dokumentaci jejím průběžným ověřováním.

## Vztah ke Kompendiu

Kniha o tom, jak se ničí důvěra v poznání, nesmí sama vyrábět tvrzení bez opory. Proto Kompendium uplatňuje princip NCLB na sebe:

- **zdroje** – cituje se jen literatura, o jejíž existenci a obsahu není pochyb; čísla jen se zdrojem; interpretace se označuje jako interpretace; citovanou literaturu shromažďuje generovaný [přehled literatury](@/references.md);
- **čísla o knize** se nepíší ručně, ale odvozují se z obsahu skripty;
- **falsifikovatelnost** – u závěru má být zřejmé, co by ho vyvrátilo (viz [falsifikovatelnost](@/glossary/falsifikovatelnost.md)).

Obsahově je NCLB obranou proti vzorcům, které kniha popisuje: proti pseudokonsenzu, proti cirkulárním citacím a proti tvrzením, která nic nemůže vyvrátit. Klinická, forenzní a analytická praxe má vlastní obdoby – oddělení pozorování od interpretace, [řetězec úschovy důkazů](@/glossary/chain-of-custody.md), [pluralitu signálů](@/glossary/signal-plurality.md).

## Meze přenosu

NCLB je nárok na **vlastní tvrzení** – platformy nebo autora knihy. Nesmí se obrátit proti lidem, kteří vypovídají o své zkušenosti: výpověď oběti bez listinného důkazu není bezcenná a požadavek důkazu nemá sloužit k umlčení (srov. [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)). V klinické praxi se výpověď zaznamenává jako výpověď a teprve úsudek o ní se opírá o důkazy.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Most k pojmu NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md) – podrobný výklad pro knihu.
- [GITL](@/glossary/gitl.md) – dohledatelnost změn.

**Kniha**

- [Falsifikovatelnost](@/glossary/falsifikovatelnost.md) – co by tvrzení vyvrátilo.
- [Evidence-based](@/glossary/evidence-based.md) – praxe založená na důkazech.
- [Chain of custody](@/glossary/chain-of-custody.md) – forenzní dohledatelnost.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – mez požadavku důkazu.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
