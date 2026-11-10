+++
title = "Epistemic bubble (epistemická bublina)"
weight = 60

description = "Epistemická struktura, v níž relevantní protihlasy jednoduše chybějí (Nguyen 2020); na rozdíl od ozvěnové komory, kde jsou protihlasy aktivně zdiskreditovány."

[taxonomies]
tags = ["glossary", "epistemic", "kompendium", "manipulace", "digitalni"]

[extra]
category = "epistemic"
related_terms = ["epistemicka-anihilace", "kompendium-ea", "taxonomie-ea", "epistemic-pipeline", "nabla-infinity", "epistemicka-alienace"]
author = "Tomáš Korcak (korczis)"
reading_time = "6 min"
word_count = 1050
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["epistemic bubble", "epistemická bublina", "echo chamber", "ozvěnová komora", "Nguyen", "filtrovací bublina", "algoritmická kurace"]
quality_score = 84
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Epistemic bubble – glosář"
+++

## Definice

**Epistemická bublina** (angl. *epistemic bubble*) je podle C. Thi Nguyena („Echo Chambers
and Epistemic Bubbles“, *Episteme*, 2020) strukturální epistemické prostředí, v němž
**relevantní alternativní hlasy chybějí**. Rozhodujícím rysem je *nepřítomnost
z výchozího stavu*: člověk v bublině není vystaven vyvracejícím důkazům ne proto, že by je
odmítal, ale proto, že se k němu nikdy nedostanou. Mechanismem je **opomenutí**, nikoli
**vyvracení**.

Nguyenovo rozlišení **bubliny** a **ozvěnové komory** (*echo chamber*) je pro praxi
zásadní:

| | Epistemická bublina | Ozvěnová komora |
|---|---|---|
| Mechanismus | strukturální opomenutí protihlasů | aktivní diskreditace protihlasů |
| Odolnost | *snadno se protrhne* – po předložení vyvracejícího důkazu člověk normálně reviduje | *odolává protržení* – vyvracející důkaz je preventivně označen za nedůvěryhodný, *dřív* než přijde |
| Kde je škoda | v prostředí, ne uvnitř člověka | uvnitř, ve struktuře důvěry |
| Co pomáhá | expozice | oprava struktury důvěry |

## Původ a kontext pojmu

Nguyen navázal na diskuse o „filtrovacích bublinách“ algoritmických doporučení a ukázal, že
se v nich mísí dva odlišné jevy. Bubliny se při expozici rozpouštějí; ozvěnové komory se při
expozici posilují – protihlas byl *předpovězen* a jeho příchod potvrzuje vyprávění komory.
Ozvěnová komora tak má blízko k [delegitimizaci](@/glossary/delegitimizace.md) a k imunizačním
technikám.

V dnešní digitální infrastruktuře je hlavním mechanismem vzniku bublin **algoritmická
kurace**: doporučovací systémy optimalizované na zapojení vytvářejí jednolitou informační
stravu, aniž by alternativy záměrně vylučovaly. Bublina je emergentní, ne navržená. To
komplikuje odpovědnost: neexistuje zlovolný aktér, ale epistemická škoda je skutečná.

## Jak se projevuje

- člověk o protichůdném názoru „nikdy neslyšel“, ale když se s ním setká, je ochoten jej
  zvážit (bublina);
- člověk protichůdný názor zná jen ve zkreslené podobě, kterou mu předložila vlastní
  skupina, a předem ví, proč je „lživý“ (komora);
- všechny zdroje, které člověk sleduje, pocházejí z jedné rodiny – i když jsou jednotlivě
  kvalitní (viz detekční signatura [Monokultura
  zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md));
- překvapení z výsledků voleb, rozhodnutí nebo reakcí okolí, které „nikdo nečekal“.

## Mechanismus

Bublina působí **zúžením vstupu**, nikoli změnou zpracování. Proto je v modelu hrozeb
chápána jako **výchozí podmínka** několika technik [epistemické
anihilace](@/glossary/epistemicka-anihilace.md), nikoli jako EA v pravém smyslu.
Konkrétně [EA-1.1.1 Selektivní
expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) a [EA-1.1.2 Informační
přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) působí tak, že již
existující bublinu *prohlubují*, dokud se epistemické pole člověka nezhroutí na jediný
zdroj (souhrnné heslo: [EA-1-1-1](@/kompendium/techniques/ea-1-1-1.md)). Bublina, do níž
někdo začne aktivně vkládat diskreditaci vnějších hlasů, se mění v komoru; z komory, která
pohltí i sociální vztahy, se může stát [High Control Group](@/glossary/high-control-group.md).

## Odlišení

- **Ozvěnová komora** – viz tabulka výše.
- **[Epistemická monokultura](@/glossary/epistemicka-monokultura.md)** – stav celého
  ekosystému (instituce, obor, společnost), nikoli jednotlivce.
- **[Konfirmační bias](@/glossary/konfirmacni-bias.md)** – vnitřní sklon vybírat potvrzující
  informace; bublina je vnější struktura, která tento sklon zesiluje.
- **Specializace** – odborník, který čte jen literaturu svého oboru, je v bublině jen
  tehdy, chybějí-li mu hlasy relevantní pro jeho úsudek.

## Význam pro Kompendium

Na platformě, z níž kniha vzešla, implementuje proces [NABLA
Infinity](@/glossary/nabla-infinity.md) **hodnocení rozmanitosti zdrojů** jako
strukturální obranu: příchozí signály jsou označeny původem a metrikami rozmanitosti;
pokud skóre rozmanitosti v klouzavém okně klesne pod práh, [Decision
Engine](@/glossary/decision-engine.md) uplatní na každé rozhodnutí čerpající z dat tohoto
okna penalizaci důvěry `BUBBLE_RISK`. Tím se Nguyenovo doporučení převádí do provozu:
*měřit strukturální vlastnost, nikoli propoziční obsah*. Souvislost s celkovou architekturou
popisuje [Epistemic Pipeline](@/glossary/epistemic-pipeline.md).

Pro postupy [OSINT](@/glossary/osint.md) platí stejná logika: šetření, která stojí na
jediné rodině zdrojů – i když jsou zdroje jednotlivě kvalitní –, se označují. Adaptéry
zdrojů OSINT (v době zápisu jich platforma uváděla 128) jsou roztříděny podle rodin
zdrojů právě proto, aby bylo možné automaticky auditovat rozmanitost napříč šetřeními.

## Obrana a zotavení

Rozlišení bubliny a komory určuje i odlišný postup v [protokolech
zotavení](@/kompendium/recovery-protocols/_index.md): zotavení z bubliny klade důraz na
expoziční protokoly, zotavení z komory na opravu struktury důvěry.

- **Bublina:** vědomě rozšiřovat zdroje (viz [Kurátorství
  zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) a [Rutina napříč
  zdroji](@/kompendium/self-defense-guides/36-cross-source-routine.md)); omezit algoritmická
  doporučení.
- **Komora:** expozice nestačí, může ji i posílit; nejdřív obnova důvěry k alespoň jednomu
  vnějšímu člověku, pak postupné otevírání.
- **Pro organizace:** do rozhodování záměrně zapojovat odlišné perspektivy, měřit
  rozmanitost zdrojů v analýzách.

## Literatura

- C. Thi Nguyen: „Echo Chambers and Epistemic Bubbles“, *Episteme* (2020).
- Eli Pariser: *The Filter Bubble* (2011).

## Související

**Pojmy**

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – nadřazený rámec hrozeb.
- [Kompendium EA](@/glossary/kompendium-ea.md) – úplná taxonomická reference.
- [Taxonomie EA](@/glossary/taxonomie-ea.md) – klasifikace `EA-X.Y.Z-α`.
- [Epistemická alienace](@/glossary/epistemicka-alienace.md) – příbuzný jev odcizení.
- [Epistemická monokultura](@/glossary/epistemicka-monokultura.md) – obdoba na úrovni
  ekosystému.

**Platforma**

- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – epistemická architektura
  platformy.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – měření rozmanitosti zdrojů.

**Detekce a obrana**

- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) –
  detekční signatura.
- [Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) – svépomocná
  obrana.
