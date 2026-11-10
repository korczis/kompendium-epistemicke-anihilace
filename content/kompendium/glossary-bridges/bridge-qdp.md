+++
title = "Bridge: QDP (body dluhu kvality)"
description = "Most mezi heslem QDP a knihou: měření nedostatků jedním číslem, proč je viditelná evidence lepší než zamlčování a proč číslo nesmí rozhodovat o člověku."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "qdp", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["qdp", "quality-debt", "clean-run", "purple-team", "bridge-quality-debt", "bridge-risk-score"]
glossary_target = "qdp"
toc = false
+++

# Bridge: QDP (body dluhu kvality)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[QDP](@/glossary/qdp.md) (*Quality Debt Points*, body dluhu kvality) je kvantitativní metrika platformy
Prismatic, z níž kniha vzešla. Každé porušení standardu kvality – chybějící typová specifikace,
varování kompilátoru, porušení statické analýzy, zakázaný vzor v kódu – se podle závažnosti počítá
jako jeden nebo více bodů. Součet dává jediné číslo nahromaděného [dluhu kvality](@/glossary/quality-debt.md),
které lze sledovat v čase, srovnávat mezi sezeními a použít jako bránu: změna, která QDP zvýší, se do
kódu nedostane. Heslo glosáře popisuje i kampaň, v níž platforma podle vlastní dokumentace v době
zápisu dosáhla nulového stavu; kniha tato čísla nepřebírá a neověřuje.

Kniha z pojmu přebírá podle hesla glosáře jediný princip: **nedostatek se má počítat a viditelně
evidovat, ne skrývat**. Zároveň k němu připojuje výhradu, kterou zná z hodnocení lidí: jakmile se
metrika stane cílem, hrozí, že se optimalizuje číslo, ne skutečnost.

## Pojem v jeho vlastním oboru

Měření kvality softwaru jedním číslem má výhodu srozumitelnosti a nevýhodu redukce. QDP se opírá
o kategorie, které umějí odhalit automatické nástroje; co nástroje nevidí, do čísla nevstupuje. Heslo
glosáře to výslovně uvádí v oddílu o mezích metriky: nulové QDP znamená, že žádná *sledovaná*
kategorie nemá porušení, nikoli že kód nemá vady. To je obecná vlastnost každého ukazatele. Porter
(1995) ukázal v historii vědy a správy, že čísla získávají autoritu právě tím, že působí neosobně a
objektivně, a že tato autorita může zakrýt rozhodnutí, která do jejich konstrukce vstoupila.

## Analogie, kterou kniha činí

V hodnocení lidí se měření nedostatků jedním číslem objevuje v podobě skóre dotazníků, škál a
screeningových nástrojů. Kniha je používá – přehled nabízí [Diagnostické dotazníky a nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md)
a technika [EA-6.1.2 Sebeposuzovací instrument](@/kompendium/techniques/ea-6-1-2-self-report-instrument.md) –,
ale trvá na tom, že skóre je ukazatelem, nikoli skutečností. Psychometrie to vyjadřuje pojmem
*validity konstruktu*: číslo má smysl jen tehdy, je-li doloženo, že měří to, co měřit má (Cronbach a
Meehl 1955), a validita se netýká nástroje samého, ale výkladu a použití jeho výsledků (Messick 1995).
Nulové skóre ve screeningovém dotazníku proto neznamená, že člověk není pod vlivem manipulace – může
to znamenat, že manipulace zasáhla právě jeho schopnost vypovídat o sobě.

Druhou stranou analogie je **tlak na číslo**. Campbell (1979) upozornil, že čím víc se kvantitativní
ukazatel používá k rozhodování, tím víc podléhá zkreslení, a Strathernová (1997) shrnula tutéž
zkušenost formulací, že ukazatel, který se stane cílem, přestává být dobrým ukazatelem. Muller (2018)
doložil na příkladech z medicíny, školství a policie, jak tlak na metriky vede k jejich obcházení.
V manipulativních prostředích se číslo může stát nástrojem kontroly: „body“ za oddanost, žebříčky
výkonu, veřejné skóre, které člověka zahanbuje. Heslo glosáře odkazuje na rozbor Goodhartova zákona
v hesle [Purple Team](@/glossary/purple-team.md).

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisují stránky [Quality Monitor a sledování EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)
a [QEVE a validace kvality](@/kompendium/aiad-integration/qeve-ea-quality-validation.md). Metodologické
otázky měření rozebírají kapitoly [Survey design v EA výzkumu](@/kompendium/research-methodology/survey-design-EA.md)
a [Effect size v EA studiích](@/kompendium/research-methodology/effect-size-EA.md); obecné riziko,
že se z výsledků výzkumu stane číslo bez obsahu, připomíná [Bridge: Replication crisis](@/kompendium/glossary-bridges/bridge-replication-crisis.md).
Kniha sama pracuje s obdobou QDP: její obsah prochází kontrolami informační architektury, které
počítají stránky bez diakritiky, bez odkazů nebo s nedostatečným rozsahem a nesmějí stav zhoršit –
nedostatky textu jsou tedy evidovány a odstraňovány po vlnách, nikoli zamlčeny.

## Od pojmu k praxi

### Rozpoznání zneužití metriky

Varovným znakem je, když se číslo odtrhne od toho, co mělo měřit: když se v organizaci mluví víc
o skóre než o lidech, jichž se týká; když se jednotlivce hodnotí podle čísla, k jehož konstrukci
nemají přístup; a když se nesouhlas s hodnocením vykládá jako odpor proti „objektivitě“. V
kontrolujících skupinách se zneužití metriky pozná podle toho, že kritéria se mění, ale číslo vždy
ukazuje, že člověk „ještě nestačí“.

### Odlišení

Měření samo není manipulací. Evidence nedostatků je předpokladem jejich nápravy a pravidelné měření
výsledků léčby je znakem dobré klinické praxe. Rozhodující je, zda měření slouží tomu, koho se týká,
zda zná kritéria a může se k výsledku vyjádřit, a zda se číslo kombinuje s dalšími zdroji poznání.

### Obrana

Pro instituce je obranou trvat na tom, aby každé číslo mělo uvedené meze – co měří, co neměří a s jakou
jistotou –, a aby žádné rozhodnutí o člověku nestálo jen na jednom skóre. Kniha to podrobně rozvádí
v [Bridge: Risk score](@/kompendium/glossary-bridges/bridge-risk-score.md). Pro jednotlivce je obranou
ptát se, kdo číslo vytvořil, k čemu slouží a co z něj vypadlo.

### Rámec pro profesionály

Klinik, který používá škálu, by měl výsledek číst jako jeden údaj mezi dalšími: vedle rozhovoru,
pozorování a informací od blízkých. U lidí po manipulaci je zvláště důležité ověřit, zda je
sebeposouzení vůbec spolehlivé, protože manipulace mohla zasáhnout právě schopnost sebereflexe. Kniha
k tomu nabízí [EA-6.1.4 Observační hodnocení](@/kompendium/techniques/ea-6-1-4-observational-assessment.md)
a [EA-6.1.3 Kolaterální rozhovor](@/kompendium/techniques/ea-6-1-3-collateral-interview.md).

## Časté omyly

Prvním omylem je myslet si, že nulová hodnota znamená dokonalost. Znamená jen to, že ve sledovaných
kategoriích nebyl nalezen problém. Druhým omylem je přenášet na lidi představu jediného souhrnného
skóre; lidské zdraví a poznávání nejsou součtem bodů. Třetím omylem je opačný extrém – odmítat měření
úplně. Bez evidence se nedostatky skrývají a ti, kdo na ně upozorňují, nemají oporu.

## Příklad (anonymizovaný kompozit)

Neziskové poradenské centrum zavede pro pracovníky ukazatel „počet uzavřených případů za měsíc“.
Během půl roku čísla rostou, ale klienti si stěžují, že je pracovníci odbývají. Supervizorka si
všimne, že se uzavírají snadné případy a obtížné se odkládají. Centrum ukazatel nezruší, ale doplní
ho o zpětnou vazbu klientů a o kvalitativní supervizi případů. Číslo zůstane, ale přestane být
cílem a stane se jedním z několika signálů.

## Meze a otevřené otázky

Analogie mezi metrikou kvality kódu a měřením u lidí je omezená: kód lze zkontrolovat úplně, lidskou
zkušenost nikdy. Otevřenou otázkou je, jak měřit dopady manipulace a průběh zotavení tak, aby měření
pomáhalo a neškodilo, a jak zabránit tomu, aby se z výzkumných škál staly nálepky. Pro samotnou knihu
zůstává otázkou, nakolik počty v kontrolách informační architektury vypovídají o skutečné kvalitě
textu; i zde platí, že číslo je jen ukazatelem.

## Literatura

- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and Program Planning*, 2(1), 67–90.
- Cronbach, L. J., & Meehl, P. E. (1955). Construct validity in psychological tests. *Psychological Bulletin*, 52(4), 281–302.
- Messick, S. (1995). Validity of psychological assessment. *American Psychologist*, 50(9), 741–749.
- Muller, J. Z. (2018). *The Tyranny of Metrics*. Princeton University Press.
- Porter, T. M. (1995). *Trust in Numbers: The Pursuit of Objectivity in Science and Public Life*. Princeton University Press.
- Strathern, M. (1997). „Improving ratings“: Audit in the British University system. *European Review*, 5(3), 305–321.

## Související

**Glosář**

- [QDP](@/glossary/qdp.md) – heslo, které tento most propojuje s knihou.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, který QDP měří.
- [Purple Team](@/glossary/purple-team.md) – rozbor Goodhartova zákona.

**Kniha**

- [Diagnostické dotazníky a nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) – měření v klinické praxi.
- [EA-6.1.2 Sebeposuzovací instrument](@/kompendium/techniques/ea-6-1-2-self-report-instrument.md) – meze sebeposouzení.
- [Survey design v EA výzkumu](@/kompendium/research-methodology/survey-design-EA.md) – konstrukce měření.
- [Quality Monitor a sledování EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – platformní použití.

**Sesterské mosty**

- [Bridge: Quality debt](@/kompendium/glossary-bridges/bridge-quality-debt.md) – co se hromadí, když se nedostatky odkládají.
- [Bridge: Risk score](@/kompendium/glossary-bridges/bridge-risk-score.md) – číslo a rozhodování o člověku.
- [Bridge: Replication crisis](@/kompendium/glossary-bridges/bridge-replication-crisis.md) – meze čísel ve vědě.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [QDP (body dluhu kvality)](@/glossary/qdp.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
