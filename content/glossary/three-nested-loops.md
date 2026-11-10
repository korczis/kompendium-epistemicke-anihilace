+++
title = "3NL – Three-Nested-Loops (tři vnořené smyčky)"
weight = 50
description = "Výklad zkratky 3NL v Prismatic Platform jako tří vnořených řídicích smyček – mise, epochy a cyklu –, z nichž každá má vlastní stav, telemetrii a kritéria ukončení."

[taxonomies]
tags = ["glossary", "prismatic", "methodology", "architecture", "3nl"]

[extra]
category = "methodology"
related_terms = [
  "3nl",
  "nabla-infinity",
  "epistemic-pipeline",
  "aiad",
  "nm-nd",
  "session-discipline",
]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 75
+++

## Definice

**3NL – Three-Nested-Loops** (tři vnořené smyčky) je výklad zkratky 3NL, který v Prismatic
Platform označuje základní architektonickou filozofii řízení práce: tři **soustředné řídicí
smyčky**, z nichž každá běží v jiném časovém měřítku.

| smyčka | rozsah | typické časové měřítko |
|---|---|---|
| **vnější** | mise (*mission scope*) | dny až týdny |
| **střední** | epocha (*epoch scope*) | hodiny |
| **vnitřní** | cyklus (*cycle scope*) | sekundy až minuty |

Každá smyčka má **vlastní stav, vlastní telemetrii a vlastní kritéria ukončení**. Vnitřní
smyčka vykonává jednotlivé kroky, střední smyčka seskupuje kroky do ucelených etap a hodnotí
jejich výsledek, vnější smyčka drží cíl mise a rozhoduje, zda a jak pokračovat.

Tato stránka se týká **platformy**, z níž Kompendium vzešlo, ne technik epistemické
anihilace. Pro čtenáře knihy je kontextem: vysvětluje, jak platforma organizuje práci,
v níž se [taxonomie EA](@/glossary/taxonomie-ea.md) používá.

## Původ a kontext pojmu

Zkratka 3NL má v glosáři i druhý výklad, [3NL – Three Nested Levels](@/glossary/3nl.md), který
ji čte jako tři vnořené úrovně abstrakce architektury (strategickou, taktickou a operační).
Obě hesla popisují platformu z různých úhlů: úrovně odpovídají na otázku, *co* je kde
odděleno, smyčky na otázku, *jak* se práce řídí v čase.

Myšlenka vnořených řídicích smyček má dlouhou tradici mimo software. Kybernetika Norberta
Wienera (*Cybernetics*, 1948) popsala řízení zpětnou vazbou; regulační technika zná
kaskádní regulaci, kde rychlá vnitřní smyčka stabilizuje veličinu, kterou pomalejší vnější
smyčka nastavuje. V rozhodování je známý cyklus OODA Johna Boyda (pozoruj – orientuj se –
rozhodni – jednej). 3NL přebírá obecný princip: **rychlé smyčky se starají o provedení,
pomalé o směr**, a žádná smyčka nemá přebírat úkol jiné.

V dokumentaci platformy se 3NL uvádí jako architektonický pilíř spolu s doktrínou
[NM/ND](@/glossary/nm-nd.md) a s pravidly [Session Discipline](@/glossary/session-discipline.md);
souvisí s metodikou [AIAD](@/glossary/aiad.md) a s epistemickým rámcem [NABLA
Infinity](@/glossary/nabla-infinity.md).

## Jak se projevuje

V práci řízené podle 3NL lze rozpoznat tyto znaky:

- **Oddělená kritéria ukončení.** Cyklus končí, když je krok ověřen; epocha, když je
  dosažen dílčí výsledek; mise, když je splněn cíl nebo je rozhodnuto o změně směru.
- **Telemetrie na každé úrovni.** Každá smyčka zaznamenává vlastní stav, aby bylo možné
  zpětně zjistit, kde a proč došlo k odchylce.
- **Eskalace směrem ven.** Problém, který vnitřní smyčka nevyřeší, se předává střední
  smyčce, a ta případně vnější – místo aby se řešil donekonečna na nejnižší úrovni.
- **Stabilita směru.** Krátkodobé neúspěchy ve vnitřní smyčce nemění cíl mise, dokud je
  nevyhodnotí smyčka střední.

## Mechanismus

Strukturálně stojí 3NL na **oddělení časových měřítek**. Rychlá smyčka reaguje na okamžité
výsledky, ale nemá přehled o celku; pomalá smyčka má přehled, ale nemůže řídit každý krok.
Vnoření umožňuje, aby každá úroveň dělala to, na co má informace, a aby se chyby zachytily
na úrovni, kde je lze nejlépe posoudit. Vlastní stav a telemetrie každé smyčky brání tomu,
aby se chyba z jedné úrovně nepozorovaně šířila do další.

V platformě s tímto principem souvisejí mechanismy průběžné kontroly kvality a samoopravy,
popsané v heslech [AutoHeal](@/glossary/autoheal.md) a [Clean Run](@/glossary/clean-run.md),
a [Epistemic Pipeline](@/glossary/epistemic-pipeline.md), která řídí tok tvrzení od zdroje
k závěru.

## Odlišení

- **Od [3NL – Three Nested Levels](@/glossary/3nl.md):** úrovně jsou prostorové (vrstvy
  architektury), smyčky časové (rytmy řízení). Jde o dva výklady téže zkratky.
- **Od prosté iterace:** opakování téhož kroku není vnořená smyčka; 3NL vyžaduje, aby každá
  úroveň měla jiný cíl a jiná kritéria ukončení.
- **Od hierarchie rozhodovací moci:** smyčky nejsou nadřízenými a podřízenými lidmi, ale
  rytmy řízení téže práce.

## Význam pro Kompendium

Pro obsah knihy nemá 3NL přímý význam – nepopisuje žádný jev epistemické anihilace. Kompendium
ho uvádí kvůli **transparentnosti původu**: oddíl [Vztah ke Prismatic
Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) a kapitola [Vztah k
NABLA](@/kompendium/02-uvod/vztah-k-nabla.md) vysvětlují, jak se taxonomie EA zapojuje do
procesů platformy. Napojení na detekci EA rozebírá oddíl [AIAD Integration & EA
detection](@/kompendium/aiad-integration/_index.md); propojení s knihou shrnuje [Bridge:
3nl](@/kompendium/glossary-bridges/bridge-3nl.md).

Jako myšlenková analogie může čtenáři posloužit jedno pozorování: i [Longitudinální
rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) Kompendia jsou členěny
podle časových měřítek (akutní, subakutní, středně-dobá a dlouhodobá fáze), protože obnova
po epistemické anihilaci vyžaduje současně rychlou stabilizaci a pomalou změnu směru. Jde
o analogii, nikoli o tvrzení, že protokoly jsou na 3NL založeny.

## Související

**Platforma**

- [3NL – Three Nested Levels](@/glossary/3nl.md) – druhý výklad téže zkratky.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec platformy.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – tok tvrzení od zdroje k závěru.
- [AIAD](@/glossary/aiad.md) – metodika vývoje, s níž 3NL souvisí.
- [NM/ND Doctrine](@/glossary/nm-nd.md) – doktrína provedení uváděná spolu s 3NL.
- [Session Discipline](@/glossary/session-discipline.md) – kázeň pracovní relace.

**Vztah ke knize**

- [Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – jak kniha
  vznikla z platformy.
- [Bridge: 3nl](@/kompendium/glossary-bridges/bridge-3nl.md) – propojení pojmu s Kompendiem.
