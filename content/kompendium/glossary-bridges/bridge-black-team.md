+++
title = "Bridge: Black Team (černý tým)"
description = "Most mezi heslem Black Team a knihou: modelování hrozeb jen na abstraktní úrovni jako zásada, podle níž kniha popisuje manipulaci strukturou, nikdy postupem."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "black-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["black-team", "color-teams", "red-team", "dual-use-poznani", "bridge-dual-use-poznani", "bridge-red-team"]
parent = "kompendium-glossary-bridges"
glossary_target = "black-team"
toc = false
+++

# Bridge: Black Team (černý tým)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Black Team](@/glossary/black-team.md) je nejpřísněji omezenou doménou bezpečnostní architektury
[Color Teams](@/glossary/color-teams.md) platformy Prismatic, z níž kniha vzešla. Podle hesla
glosáře ho tvoří dva agenti, kteří pracují bez síťového připojení, bez přístupu k produkčním
datům a bez možnosti vytvářet spustitelný obsah; jejich výstup prochází víceúrovňovým filtrem
abstrakce. Jediným produktem černého týmu jsou **abstraktní modely hrozeb**: popisy tvaru a
dynamiky možných útoků, které informují obranu, ale nedávají návod k jejich provedení. Rozdíl
oproti [červenému týmu](@/glossary/red-team.md) je v míře konkrétnosti: červený tým simuluje
útok prakticky, černý tým modeluje rozhodování protivníka na úrovni, z níž nelze přímo jednat.

Pro knihu je pojem důležitější, než by se zdálo u technického oddílu platformy. Heslo glosáře
výslovně říká, že zásada černého týmu je i zásadou Kompendia: mechanismy manipulace kniha
popisuje jen na úrovni **struktury**, vždy spolu s detekcí a obranou, nikdy jako postup.

## Pojem v jeho vlastním oboru

Modelování hrozeb je ustálenou disciplínou bezpečnostního inženýrství. Schneier (1999) navrhl
*útočné stromy* jako způsob, jak systematicky popsat cíle útočníka a cesty k nim, a Shostack
(2014) shrnul modelování hrozeb jako otázku „co se může pokazit a co s tím uděláme“, kladenou
už při návrhu systému. Obě tradice pracují s abstrakcí: model nemá být receptem, ale mapou
zranitelných míst, podle níž se rozhoduje o obraně.

Napětí, které černý tým řeší, popsal obecně Bostrom (2011) jako problém *informačních rizik*:
některé pravdivé informace mohou škodit tím, že se dostanou k někomu, kdo je zneužije. Biologická
bezpečnost zná totéž jako dilema výzkumu dvojího užití, jak ho formulovala zpráva National
Research Council (2004). Černý tým je technickou odpovědí na toto dilema: poznání o útoku se
připouští jen v takové podobě, která slouží obraně, a omezení je vynuceno architekturou, nikoli
dobrou vůlí.

## Analogie, kterou kniha činí

Kniha je v podobné pozici jako černý tým. Aby kliniky, vyšetřovatele a zasažené naučila
manipulaci rozpoznat, musí popsat, jak funguje; kdyby ji však popsala jako postup, sama by se
stala nástrojem. Proto každá stránka techniky ve sbírce [Techniky](@/kompendium/techniques/_index.md)
popisuje vzorec tak, jak ho vidí pozorovatel – strukturu, znaky, odlišení, obranu a zotavení –
a vynechává vše, co by sloužilo jen tomu, kdo by chtěl vzorec použít. Zásady tohoto rozhodnutí
vykládají kapitoly [1.3 Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md)
a [1.5 Bezpečnostní klasifikace přístupu](@/kompendium/01-predmluva/bezpecnostni-klasifikace.md)
a podrobně [Bridge: Dual-use poznání](@/kompendium/glossary-bridges/bridge-dual-use-poznani.md).

Etické zásady černého týmu – jen syntetické scénáře, prokazatelný obranný účel, přiměřenost
hloubky analýzy a přezkum – se v knize promítají do pravidel pro kazuistiky: všechny jsou
anonymizované kompozity, slouží výuce rozpoznání a podléhají [Etickému kodexu výzkumníka EA](@/kompendium/08-prilohy/eticky-kodex.md).

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisuje oddíl [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md),
kde černý tým stojí vedle týmů, které se zabývají praktickou simulací a obranou:
[Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md),
[Blue Team a obrana](@/kompendium/aiad-integration/blue-team-ea-defense.md) a
[Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md). Výzkumnou
stranu stejného napětí rozebírají kapitoly [Publikační etika EA výzkumu](@/kompendium/research-methodology/publication-ethics-EA.md)
a [Datová bezpečnost EA výzkumu](@/kompendium/research-methodology/data-security-EA-research.md).

## Od pojmu k praxi

### Rozpoznání: kdy text překračuje hranici

Užitečnou otázkou pro autora, recenzenta i čtenáře je, komu by text pomohl, kdyby ho četl
někdo se zlým úmyslem. Text na úrovni struktury popisuje, *co* se děje a *jak to poznat*:
například že kontrolující osoba postupně omezuje kontakty partnera a že se to projevuje určitými
znaky. Text na úrovni postupu by popisoval, *jak to udělat účinně*: v jakém pořadí, s jakými
formulacemi, jak se vyhnout odhalení. Hranicí tedy není téma, ale funkce textu. Kniha se drží
první úrovně i u nejzávažnějších jevů, jak ukazují kapitoly o
[pokročilých technikách](@/kompendium/05-ultramari-techniky/_index.md).

### Odlišení

Abstraktní model hrozby není cenzurou. Kniha nezamlčuje, že manipulace existuje, ani jak
závažná může být; pojmenovává ji přesně. Rozdíl je mezi poznáním, které umožňuje škodu
rozpoznat a zastavit, a dovedností, která by ji umožňovala působit. Stejně tak abstrakce
neznamená vágnost: model hrozby může být velmi konkrétní v tom, co je ohroženo a jak se to
pozná, a přitom neobsahovat žádný návod.

### Obrana

Pro instituce, které pracují s citlivým poznáním o manipulaci – kliniky, výzkumná pracoviště,
vzdělávací programy –, plyne z černého týmu jednoduchá praxe: oddělit materiál pro rozpoznání,
který může být otevřený, od podrobností o konkrétních případech, které patří jen do chráněné
dokumentace; vyžadovat u každého výstupu uvedení obranného účelu; a nechat výstupy posoudit
někým, kdo na nich nepracoval. Kniha tyto zásady uplatňuje u
[vzdělávacích scénářů](@/kompendium/educational-scenarios/_index.md).

### Rámec pro profesionály

Klinik nebo soudní znalec, který píše posudek, se ocitá v obdobné situaci: musí popsat
manipulativní vzorec dost přesně, aby ho soud pochopil, ale nemá vytvářet text, který by se dal
použít jako návod. Kniha doporučuje popisovat pozorované chování a jeho účinek na posuzovanou
osobu, ne „techniku“ v abstraktní podobě, kterou by bylo možné přenést jinam – viz
[Znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md).

## Časté omyly

Omylem je považovat černý tým za „ještě útočnější“ červený tým; je to naopak tým s nejpřísnějším
omezením. Druhým omylem je domnívat se, že dostatečně abstraktní text je vždy bezpečný.
Abstrakce snižuje riziko, ale neodstraňuje ho, a proto kniha spojuje úroveň popisu s dalšími
pojistkami – s cílovým čtenářem, s obranným rámcem každé stránky a s přezkumem. Třetím omylem je
myslet si, že obrana se bez znalosti útoku obejde. Shostack (2014) i celá tradice modelování
hrozeb ukazují opak: kdo nerozumí tomu, co se může pokazit, nedokáže se připravit.

## Příklad (anonymizovaný kompozit)

Výzkumný tým připravuje výukový modul pro sociální pracovníky o manipulaci seniorů. První
verze obsahuje podrobný rozbor telefonického podvodu včetně přesných formulací. Recenzentka
upozorní, že modul by mohl sloužit jako šablona. Tým text přepracuje: místo formulací popisuje
fáze kontaktu, znaky, podle nichž je pracovník pozná, a otázky, které má senior položit,
než cokoli udělá. Výukový účinek zůstane zachován, ale modul už nelze použít jako scénář.

## Meze a otevřené otázky

Hranice mezi strukturou a postupem není ostrá a posuzuje se vždy v kontextu: co je pro
odborníka abstraktní, může být pro jiného čtenáře dostatečně konkrétní. Otevřenou otázkou je,
jak hranici držet v době generativních modelů, které umějí z abstraktního popisu vytvořit
konkrétní text. Kniha na to odpovídá spíše opatrností v míře podrobnosti než technickým
řešením a tuto mez otevřeně přiznává.

## Literatura

- Bostrom, N. (2011). Information hazards: A typology of potential harms from knowledge. *Review of Contemporary Philosophy*, 10, 44–79.
- National Research Council (2004). *Biotechnology Research in an Age of Terrorism*. National Academies Press.
- Schneier, B. (1999). Attack trees. *Dr. Dobb's Journal*, 24(12), 21–29.
- Shostack, A. (2014). *Threat Modeling: Designing for Security*. Wiley.

## Související

**Glosář**

- [Black Team](@/glossary/black-team.md) – heslo, které tento most propojuje s knihou.
- [Color Teams](@/glossary/color-teams.md) – architektura barevných týmů.
- [Red Team](@/glossary/red-team.md) – praktická simulace útoku.

**Kniha**

- [1.5 Bezpečnostní klasifikace přístupu](@/kompendium/01-predmluva/bezpecnostni-klasifikace.md) – úrovně podrobnosti v knize.
- [1.3 Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md) – proč kniha popisuje strukturu, ne postup.
- [Etický kodex výzkumníka EA](@/kompendium/08-prilohy/eticky-kodex.md) – zásady pro kazuistiky a výzkum.
- [Publikační etika EA výzkumu](@/kompendium/research-methodology/publication-ethics-EA.md) – co a jak zveřejňovat.

**Sesterské mosty**

- [Bridge: Dual-use poznání](@/kompendium/glossary-bridges/bridge-dual-use-poznani.md) – etický rámec dvojího užití.
- [Bridge: Red Team](@/kompendium/glossary-bridges/bridge-red-team.md) – sesterský tým praktické simulace.
- [Bridge: Gray Team](@/kompendium/glossary-bridges/bridge-gray-team.md) – mezery ve specifikacích.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Black Team](@/glossary/black-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
