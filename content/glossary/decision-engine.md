+++
title = "Decision Engine (rozhodovací engine)"
weight = 100

description = "Systém založený na pravidlech nebo strojovém učení, který z vícefaktorových vstupů vytváří strukturovaná rozhodnutí s mírou důvěry; v Kompendiu kalibrace důvěry ve zdroje."

[taxonomies]
tags = ["glossary", "ai-systems", "prismatic", "decision-core"]

[extra]
category = "ai-systems"
related_terms = ["rule-engine", "scoring", "confidence-scoring", "trinity-gate", "inference"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 70
+++

## Definice

**Decision engine** (česky *rozhodovací engine*) je součást systému, která slučuje
vícefaktorové vstupy (důkazy, signály, heuristiky) do strukturovaného rozhodnutí s mírou
důvěry nebo s pořadím priorit. Rozhodovací enginy mohou být založené na pravidlech
(deterministické), pravděpodobnostní nebo postavené na neuronových sítích.

Prismatic Platform, z níž kniha vzešla, zapojuje rozhodovací enginy do ověřovacího procesu
[Trinity Gate](@/glossary/trinity-gate.md) a do systému skórování důvěry. Rozhodovací
engine přitom vyvažuje:

- kvalitu a původ signálu;
- časové stárnutí důkazů;
- řešení konfliktů mezi protichůdnými signály;
- prahy rizika nastavitelné uživatelem.

Jeho technické jádro s uzavřenou kalibrační smyčkou popisuje heslo [Decision
Core](@/glossary/decision-core.md). Pro související pojmy usuzování viz
[Inference](@/glossary/inference.md).

## Jak se na engine odvolává Kompendium

Mnohá hesla glosáře uvádějí, jak by měl rozhodovací engine zacházet se zdroji, které nesou
stopy manipulace. Jde o popis zásad platformy, nikoli o tvrzení o lidském úsudku; čtenáři
mimo platformu poslouží jako příklad toho, jak lze poznatky knihy převést do pravidel
hodnocení zdrojů:

- **Hodnocení zdrojů.** Vstupy z prostředí se zvýšeným skóre podle [BITE
  modelu](@/glossary/bite-model.md) jsou označeny jako podezřelé co do původu; nepodepsaná
  audiovizuální média z kanálů s nízkou důvěrou mají nižší váhu (viz
  [Deepfake](@/glossary/deepfake.md)).
- **Vzorce odvracení odpovědnosti.** Výpověď se třífázovým podpisem [DARVO](@/glossary/darvo.md)
  má nižší váhu; původní obvinění se tím nezvyšuje, ale přestává se snižovat.
- **Výpovědi traumatizovaných osob.** Výpověď přeživších s [C-PTSD](@/glossary/c-ptsd.md)
  nebo s [disociací](@/glossary/disociace.md) není obsahově méně spolehlivá; její
  fragmentovaná podoba vyžaduje jiné zpracování, ne nižší důvěru.
- **Strukturální rizika.** Vztahy s vysokou závislostí (viz [Betrayal
  trauma](@/glossary/betrayal-trauma.md)) a jednolitá informační strava (viz [Epistemic
  bubble](@/glossary/epistemic-bubble.md)) snižují důvěru v závěry, aniž by se zkoumal
  obsah jednotlivých tvrzení.
- **Delegitimizace.** Náhlé zhroucení reputace dříve důvěryhodných zdrojů se sleduje jako
  možný znak [delegitimizační kampaně](@/glossary/delegitimizace.md), ne jako běžná revize.

Podrobně tyto zásady rozvádějí stránky [Decision Engine: kalibrace
EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) a [DD engine: vážení
zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md); vztah knihy
k enginu vysvětluje kapitola [Vztah k Decision
Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md).

## Meze

Rozhodovací engine nenahrazuje klinický ani soudní úsudek. Jeho výstupy jsou hypotézy
s mírou důvěry; u otázek, které se týkají duševního zdraví nebo bezpečí konkrétní osoby,
mají platit cesty k odborné pomoci, nikoli automatizované závěry.

## Související

**Platforma**

- [Decision Core](@/glossary/decision-core.md) – kalibrační jádro rozhodovacího procesu.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací proces s rozhodovacími enginy.
- [Inference](@/glossary/inference.md) – usuzování z důkazů.
- [Risk Score](@/glossary/risk-score.md) – skóre rizika jako vstup rozhodnutí.

**Kompendium**

- [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – jak kniha
  s enginem souvisí.
- [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md)
  – kalibrace důvěry s ohledem na techniky EA.
- [Glosář](@/glossary/_index.md) – rejstřík hesel.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: decision-engine](@/kompendium/glossary-bridges/bridge-decision-engine.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
