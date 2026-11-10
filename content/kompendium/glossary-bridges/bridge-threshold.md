+++
title = "Bridge: Práh (threshold)"
weight = 100
description = "Most mezi pojmem prahu a knihou: prahy pro detekci, eskalaci, oznámení a přerušení intervence, jejich nastavení a rizika falešně pozitivních i negativních závěrů."

[taxonomies]
tags = ["glossary-bridge", "kompendium", "cross-link", "diagnostika"]

[extra]
category = "kompendium-bridge"
related_terms = ["risk-score", "bridge-kontraindikace", "bridge-readiness", "decision-engine", "pattern-evidence", "screening-instrumenty-detail"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 75
+++

# Bridge: Práh (threshold)

> **Most** spojuje pojem prahu s místy knihy, kde se z pozorování stává rozhodnutí: kdy považovat
> vzorec za manipulaci, kdy eskalovat k akutní péči, kdy oznámit, kdy intervenci přerušit. Přehled
> mostů je v rejstříku [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

**Práh** je hodnota nebo kombinace znaků, při jejímž dosažení se mění postup. V klinické praxi jde
například o hraniční skóre dotazníku, v právu o podmínky povinnosti oznámit, v detekci o počet a
sílu znaků, při nichž pozorovatel považuje vzorec za doložený.

Každý práh je **kompromisem mezi dvěma chybami**: příliš nízký vede k falešně pozitivním závěrům
(nálepkování, zbytečné zásahy, stigmatizace), příliš vysoký k falešně negativním (přehlédnutá
manipulace, pozdní pomoc). Volba prahu proto není technická, ale etická otázka: kterou chybu jsme
v dané situaci ochotni riskovat víc?

## Typy prahů v knize

| Typ prahu | Co spouští | Kde je popsán |
|---|---|---|
| Detekční | závěr, že jde o vzorec techniky | [Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md) |
| Screeningový | doporučení podrobného vyšetření | [Screeningové instrumenty](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md) |
| Eskalační | přechod k akutní péči | [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) |
| Oznamovací | povinnost nebo oprávnění informovat úřady | [Povinné oznámení v kontextu EA](@/kompendium/emergency-protocols/9-mandatory-reporting-EA.md) |
| Ukončovací | přerušení cvičení nebo intervence | [Termination criteria](@/kompendium/techniques/ea-4-1-7-termination-criteria.md) |
| Důkazní | váha vzorce v řízení | [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) |

## Sémantický vztah

| Vztah | Cílový pojem | Typ vazby |
|---|---|---|
| kvantifikuje | [Risk Score](@/glossary/risk-score.md) | skóre, k němuž se práh vztahuje |
| rozhoduje o | [Bridge: Readiness](@/kompendium/glossary-bridges/bridge-readiness.md) | kdy začít |
| rozhoduje o | [Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md) | kdy nezačínat nebo přerušit |
| opírá se o | [Pattern evidence](@/glossary/pattern-evidence.md) | vzorec místo jednotlivé události |

## Klinické a praktické implikace

1. **Vzorec, ne jednotlivost** – jednotlivý znak práh nepřekračuje; rozhoduje kombinace, opakování
   v čase a vazba na prostředí.
2. **Asymetrie podle závažnosti** – u rizika pro život (suicidalita, násilí, ohrožení dítěte) se
   práh pro jednání posouvá níž; u nálepkování vztahu jako „manipulativního“ výš.
3. **Prahy nástrojů nejsou diagnózy** – hraniční skóre dotazníku vede k dalšímu vyšetření, ne
   k závěru.
4. **Dokumentovat zdůvodnění** – proč byl práh považován za překročený nebo nepřekročený.
5. **Revidovat** – prahy je třeba ověřovat na zkušenosti a upravovat; viz
   [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md).

## Vztah k platformě

Na platformě Prismatic, z níž kniha vzešla, se prahy používají při převodu signálů na skóre rizika
a doporučení v rozhodovacím modulu; viz [Decision Engine](@/glossary/decision-engine.md). V knize
mají prahy stejnou logiku, ale vždy podléhají klinickému nebo právnímu úsudku člověka.

## Časté omyly

- „Pevný práh je objektivní“ – každý práh v sobě nese hodnotové rozhodnutí o tom, kterou chybu
  preferujeme.
- „Pod prahem není nic“ – podprahové znaky jsou důvodem ke sledování, ne k nečinnosti.

## Související

**Sesterské mosty**

- [Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md) – prahy pro nezahájení a přerušení.
- [Bridge: Readiness](@/kompendium/glossary-bridges/bridge-readiness.md) – prahy pro zahájení.

**Klinika a detekce**

- [Screeningové instrumenty](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md) – hraniční skóre a rozhodovací pravidla.
- [Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – kombinace znaků.
- [Observační hodnocení](@/kompendium/06-klinicke-aplikace/observational-assessment.md) – sledování ukazatelů v čase.

**Kritika a právo**

- [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) – cena nízkého prahu.
- [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) – práh v řízení.
