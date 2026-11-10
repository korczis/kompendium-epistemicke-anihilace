+++
title = "Bridge: Clean Run (čistý běh)"
description = "Most mezi heslem Clean Run a knihou: nulová hladina šumu v sestavení softwaru a lidská obdoba – návyk na šum, v němž zaniká skutečný varovný signál."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "clean-run", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["clean-run", "zero-warning-policy", "qdp", "firehose-of-falsehood", "bridge-zero-warning-policy", "bridge-firehose-of-falsehood"]
parent = "kompendium-glossary-bridges"
glossary_target = "clean-run"
toc = false
+++

# Bridge: Clean Run (čistý běh)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Clean Run](@/glossary/clean-run.md) (čistý běh) je na platformě Prismatic, z níž kniha vzešla,
povinný standard kompilace a běhu: žádné varování kompilátoru, žádný nadbytečný informační ani
ladicí výstup v logu a úspěšné sestavení s přepínačem, který z každého varování dělá chybu.
Standard je vynucen na několika místech – při kompilaci, v háčcích před commitem, v branách
kvality průběžné integrace i při nasazení – a souvisí s [politikou nulových varování](@/glossary/zero-warning-policy.md)
a s měřením dluhu kvality v [QDP](@/glossary/qdp.md).

Heslo glosáře zdůvodňuje standard **únavou z varování**: kde sestavení vypisuje desítky varování,
přestanou je lidé číst a skutečně závažné upozornění zapadne v šumu. Nulová hladina zajišťuje,
že každé nové varování je hned vidět. Kniha z tohoto postřehu vychází, když popisuje, jak
zahlcení informacemi otupuje pozornost lidí a usnadňuje manipulaci.

## Pojem v jeho vlastním oboru

V softwarovém inženýrství je zásada „sestavení bez varování“ součástí širší praxe průběžné
integrace, v níž se každá změna okamžitě sestaví a otestuje a selhání se opravuje dřív, než se
na něj navrství další práce (Humble a Farley 2010). Smysl standardu není estetický: diagnostika
kompilátoru často upozorňuje na skutečné chyby – nepoužitou proměnnou, která prozrazuje
logický omyl, nebo volání funkce, která se brzy přestane chovat jako dřív. Pokud se varování
tolerují, ztrácí celý mechanismus informační hodnotu.

Obecnější podobu problému popsal Breznitz (1984) v psychologii falešných poplachů: opakované
poplachy, po nichž nic nenásleduje, snižují důvěru v signál a zpomalují reakci, když přijde
poplach skutečný. Zdravotnictví a průmyslová bezpečnost znají tentýž jev pod názvem únava
z alarmů. Clean Run je softwarovou odpovědí: místo filtrování šumu se šum nepřipouští vůbec.

## Analogie, kterou kniha činí

Lidská pozornost je omezený zdroj. Simon (1971) to vyjádřil slavnou formulací, že bohatství
informací vytváří chudobu pozornosti. Kniha popisuje techniky, které s touto chudobou pracují
záměrně: [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
zahlcuje člověka tolika podněty, že na posouzení žádného z nich nezbývá kapacita, a model
[Firehose of Falsehood](@/kompendium/glossary-bridges/bridge-firehose-of-falsehood.md), jak ho
popsali Paul a Matthews (2016), spoléhá na vysoký objem, rychlost a opakování sdělení bez ohledu
na jejich vzájemný soulad. Výsledkem je stav, v němž člověk přestane rozlišovat mezi podstatným
a nepodstatným – lidská obdoba sestavení se stovkami varování.

Druhou stranou analogie je **normalizace odchylky**. Vaughan (1996) při analýze havárie raketoplánu
Challenger ukázala, jak se v organizaci opakované drobné anomálie postupně stávaly přijatelnými,
až přestaly být chápány jako varování. Ve vztazích a skupinách probíhá podobný proces: první
ponižující poznámka vyvolá znepokojení, desátá už jen pokrčení ramen. Kniha tento posun sleduje
v detekční signatuře [Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md).

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisují stránky [Quality Monitor a sledování EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)
a [QEVE a validace kvality](@/kompendium/aiad-integration/qeve-ea-quality-validation.md).
Lidskou stranu – péči o pozornost a omezení šumu – rozvádějí příručky
[Řízení pozornosti](@/kompendium/self-defense-guides/9-attention-management.md),
[Rozpočet pozornosti](@/kompendium/self-defense-guides/34-attention-budget.md),
[Řízení kognitivní zátěže](@/kompendium/self-defense-guides/10-cognitive-load-management.md) a
[Informační půst](@/kompendium/self-defense-guides/39-information-fasting.md). Fenomenologický
projev zahlcení zachycuje detekční signatura [Kognitivní mlha](@/kompendium/detection-signatures/25-phenomenological-cognitive-fog.md).

## Od pojmu k praxi

### Rozpoznání

U člověka se „sestavení plné varování“ pozná podle toho, že přestává reagovat na věci, které by
ho dříve znepokojily, a zároveň si stěžuje na neustálou únavu a nesoustředěnost. Typické je, že
nedokáže říct, *co* ho trápí, jen že je toho „moc“. V organizaci se stejný stav projevuje
množstvím hlášení, která nikdo nečte, a kulturou, v níž se na upozornění odpovídá „to tu je
vždycky“. Pozorovatel si může položit otázku: kdy naposledy vedlo varování v tomto prostředí
k nějaké změně?

### Odlišení

Otupělost z přetížení je třeba odlišit od emocionálního otupění při traumatu nebo depresi,
které kniha popisuje v detekční signatuře [Emocionální otupění](@/kompendium/detection-signatures/27-phenomenological-emotional-numbing.md).
Přetížení bývá vázané na prostředí a po omezení podnětů ustupuje; traumatické otupění přetrvává
i v klidu a vyžaduje klinické posouzení. Zároveň platí, že ne každé zahlcení je manipulací:
moderní pracovní a mediální prostředí vytváří šum i bez úmyslu. Manipulace se pozná podle toho,
že šum je řízený a že z něj někdo systematicky těží.

### Obrana

Obrana nespočívá v tom, číst všechno, ale v tom, **snížit hladinu šumu tak, aby byl signál opět
vidět**. Prakticky to znamená omezit počet zdrojů, vyhradit si čas bez podnětů a u opakovaných
drobných „varování“ ve vztahu nebo v práci si je zapisovat – záznam ukáže vzorec, který se
v jednotlivých případech ztrácí. Na rozdíl od softwaru nejde u lidí o „nulovou toleranci“,
ale o to, aby se varovné signály nenormalizovaly bez povšimnutí.

### Zotavení a rámec pro profesionály

U klientů po dlouhodobém zahlcení začíná práce stabilizací a obnovou schopnosti soustředit se,
nikoli rozborem obsahu, který je přetížil. Postupy popisuje [Akutní informační kurace](@/kompendium/recovery-protocols/acute-information-curation.md).
Pro organizace je obdobou Clean Run pravidlo, že každé hlášení má vlastníka a odpověď; hlášení,
na něž nikdo nereaguje, učí lidi přestat hlásit.

## Časté omyly

Omylem je přenášet do lidských vztahů absolutní pravidlo „žádné varování“. Lidé nejsou
kompilátory a drobné třenice patří ke každému vztahu; kniha nežádá nulovou toleranci, ale
pozornost k vzorci. Druhým omylem je domnívat se, že čistý běh znamená absenci problémů.
Sestavení bez varování může obsahovat chyby, které kompilátor nevidí; stejně tak klidné prostředí
nemusí být bezpečné. Třetím omylem je chápat informační dietu jako únik od reality: cílem je
zachovat kapacitu pro to, na čem záleží.

## Příklad (anonymizovaný kompozit)

Zdravotní sestra na jednotce intenzivní péče si stěžuje, že během směny slyší tolik alarmů, že
je přestává vnímat. Vedoucí oddělení s týmem projde, které alarmy jsou nastavené zbytečně citlivě,
a upraví je; zároveň zavede pravidlo, že každý alarm musí mít jasnou odpověď. Po několika týdnech
sestry uvádějí, že alarmy znovu „slyší“. Tentýž princip pak sestra použije doma, když si
uvědomí, že partnerovy drobné výčitky přestala vnímat, ačkoli ji vyčerpávají – začne si je
zapisovat a teprve záznam jí ukáže, jak častými se staly.

## Meze a otevřené otázky

Analogie mezi kompilátorem a lidskou pozorností je zjednodušující: lidský systém pozornosti je
adaptivní a habituace na opakované podněty je normální a užitečná. Otevřené zůstává, jak odlišit
zdravou habituaci od škodlivé normalizace odchylky, a jak nastavit „hladinu šumu“ u lidí, kteří
žijí v prostředí, jež nemohou opustit.

## Literatura

- Breznitz, S. (1984). *Cry Wolf: The Psychology of False Alarms*. Lawrence Erlbaum.
- Humble, J., & Farley, D. (2010). *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Addison-Wesley.
- Paul, C., & Matthews, M. (2016). *The Russian „[Firehose of Falsehood](@/glossary/firehose-of-falsehood.md)“ [Propaganda](@/glossary/propaganda.md) Model*. RAND Corporation.
- Simon, H. A. (1971). Designing organizations for an information-rich world. In M. Greenberger (Ed.), *Computers, Communications, and the Public Interest* (pp. 37–72). Johns Hopkins Press.
- Vaughan, D. (1996). *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.

## Související

**Glosář**

- [Clean Run](@/glossary/clean-run.md) – heslo, které tento most propojuje s knihou.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – pravidlo, z něhož standard vychází.
- [QDP](@/glossary/qdp.md) – měření nahromaděného dluhu kvality.

**Kniha**

- [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – záměrné zahlcení pozornosti.
- [Detekční signatura: Kognitivní mlha](@/kompendium/detection-signatures/25-phenomenological-cognitive-fog.md) – projev zahlcení.
- [Řízení pozornosti](@/kompendium/self-defense-guides/9-attention-management.md) – obrana pozornosti.
- [Akutní informační kurace](@/kompendium/recovery-protocols/acute-information-curation.md) – první krok zotavení.

**Sesterské mosty**

- [Bridge: Firehose of Falsehood](@/kompendium/glossary-bridges/bridge-firehose-of-falsehood.md) – objem jako zbraň.
- [Bridge: Zero warning policy](@/kompendium/glossary-bridges/bridge-zero-warning-policy.md) – hladina šumu v pravidlech.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Clean Run (čistý běh)](@/glossary/clean-run.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
