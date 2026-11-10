+++
title = "Decision Core"
weight = 30
description = "Rozhodovací infrastruktura Prismatic Platform s uzavřenou smyčkou: deterministické generování hypotéz, bodování a kalibrace podle skutečných výsledků."

[taxonomies]
tags = ["glossary", "decision-core", "architecture", "scoring", "prismatic"]

[extra]
category = "architecture"
author = "Tomas Korcak (korczis)"
date_updated = "2026-11-10"
related_terms = ["calibration", "hypothesis", "uncertainty", "determinism"]
difficulty = "intermediate"
keywords = ["decision engine", "generování hypotéz", "kalibrační smyčka", "deterministické bodování"]
+++

## Definice

**Decision Core** je rozhodovací infrastruktura Prismatic Platform s uzavřenou smyčkou,
která převádí nestrukturované rozhodovací problémy na dohledatelné, deterministické
výsledky s měřitelnou kalibrací. Na rozdíl od systémů umělé inteligence typu „černá
skříňka“ je každý krok procesu Decision Core explicitní, prohlédnutelný a opakovatelný.

Proces probíhá v pevném pořadí: **VSTUP → HYPOTÉZA → HODNOCENÍ → ROZHODNUTÍ → VÝSLEDEK →
KALIBRACE**.

Pojem patří do kontextu platformy, z níž kniha vzešla. Pro Kompendium je důležitý jako
technické jádro [Decision Engine](@/glossary/decision-engine.md), na který se hesla knihy
odvolávají, když popisují, jak má být důvěra ve zdroje kalibrována s ohledem na
manipulaci (viz kapitola [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md)).

## Technický rozbor

### Architektura procesu

Decision Core pracuje jako šestistupňový proces:

| Fáze | Modul | Účel |
|------|-------|------|
| Vstup | `PrismaticDd.Core.DecisionInput` | zachycuje zadání problému, kontext, strukturovaná data, omezení |
| Hypotéza | `PrismaticDd.Core.HypothesisGenerator` | deterministicky generuje 3–5 soupeřících výkladů |
| Hodnocení | `PrismaticDd.Core.Scorer` | počítá pro každou hypotézu skóre důvěry, nejistoty a rizika |
| Rozhodnutí | `PrismaticDd.Decisions.select_decision/4` | deterministický výběr s explicitními pravidly pro shodu |
| Výsledek | `PrismaticDd.Core.Outcome` | zaznamená skutečný výsledek po provedení rozhodnutí |
| Kalibrace | `PrismaticDd.Core.Calibrator` | spočítá rozdíl mezi předpovědí a skutečností a upraví budoucí bodování |

### Bodovací model

Decision Core používá explicitní, prohlédnutelný bodovací vzorec:

```elixir
# Confidence computation
confidence = base_support - contradiction_penalty - missing_data_penalty + calibration_adjustment

# Uncertainty computation
uncertainty = ambiguity + incompleteness + signal_conflict

# Risk computation
risk = base_risk + constraint_risk

# Final decision score
decision_score = confidence - (risk * risk_penalty) - (uncertainty * uncertainty_penalty)
```

(Komentáře v kódu: výpočet důvěry, výpočet nejistoty, výpočet rizika, konečné skóre
rozhodnutí.) Všechny váhy lze nastavit pomocí **profilů vah** (default, finance, hiring,
technical, investment).

### Deterministický otisk

Každé rozhodnutí nese otisk SHA-256 odvozený z normalizovaného vstupu, verze enginu
a bodovacího profilu. Opakované spuštění se stejnými vstupy a stejným stavem kalibrace dá
vždy totéž rozhodnutí.

### Kalibrační smyčka

Kalibrační systém používá korekci po přihrádkách:

- skóre důvěry se třídí do 10 přihrádek [0,0–0,1), [0,1–0,2), …, [0,9–1,0];
- každá přihrádka sleduje průměrný rozdíl mezi předpovězenou důvěrou a pozorovaným
  úspěchem;
- budoucí skóre důvěry se upraví o průměrný rozdíl jejich přihrádky;
- úpravy jsou omezeny na interval [−0,15; +0,15], aby se korekce nevymkla.

### Analýza stability rozhodnutí

Každé rozhodnutí obsahuje metriky stability vypočtené aproximací gaussovské distribuční
funkce:

- **odstup (margin)** – vzdálenost od rozhodovacího prahu;
- **pravděpodobnost překlopení (flip probability)** – jak pravděpodobně by se rozhodnutí
  změnilo při šumu;
- **úroveň stability** – very_stable, stable, marginal, unstable.

## Implementace v Prismatic Platform

Decision Core je implementován v aplikaci `prismatic_dd` ve jmenném prostoru
`PrismaticDd.Core.*` (stav v době zápisu):

- **6 schémat Ecto**, která ukládají všechny artefakty procesu do PostgreSQL;
- **3 čistě funkcionální moduly** (HypothesisGenerator, Scorer, Calibrator) bez vedlejších
  účinků;
- **1 kontextový modul** (`PrismaticDd.Decisions`), který řídí celý proces;
- **REST API** na `/api/v1/decisions` se specifikací OpenAPI;
- **rozhraní LiveView** na `/hub/decision-core` se 4 pohledy (seznam, nové, trasa,
  kalibrace);
- **7 opakovaně použitelných komponent Phoenix** v `DecisionCoreComponents`.

### Příklad použití

```elixir
# Run full pipeline
{:ok, trace} = PrismaticDd.Decisions.run_pipeline(
  %{
    title: "Should we invest in Acme Corp?",
    problem_statement: "Evaluate M&A opportunity given financials",
    structured_data: %{"revenue" => 5_000_000, "employees" => 120}
  },
  profile: "finance"
)

# Later, record what actually happened
{:ok, result} = PrismaticDd.Decisions.attach_outcome(trace.decision.id, %{
  outcome_label: "success",
  success_score: 0.85,
  measured_at: DateTime.utc_now()
})
# Calibration event automatically computed and stored
```

(Komentáře: spuštění celého procesu; později zaznamenání skutečného výsledku; kalibrační
událost se automaticky spočítá a uloží.)

## Osvědčené postupy

1. **Vždy dodat `structured_data`** – více datových polí dává jemnější hypotézy.
2. **Používat oborové profily** – finanční rozhodnutí potřebují jiné vážení rizika než
   personální.
3. **Soustavně zaznamenávat výsledky** – kalibrační smyčka se zlepšuje jen se zpětnou
   vazbou ze skutečnosti.
4. **Sledovat zdraví kalibrace** – `Calibrator.health_check/1` odhalí soustavné zkreslení.
5. **Brát vážně metriky stability** – je-li pravděpodobnost překlopení vyšší než 0,3, je
   rozhodnutí hraniční a potřebuje víc dat.

## Vztah ke Kompendiu

Decision Core ukazuje, jak lze principy, které Kompendium formuluje pro lidské poznávání,
přenést do rozhodovacího systému: soupeřící hypotézy místo jediného výkladu (obrana proti
[konfirmačnímu biasu](@/glossary/konfirmacni-bias.md)), explicitní nejistota, záznam
výsledku a kalibrace podle skutečnosti (srov. [Epistemická
pokora](@/glossary/epistemicka-pokora.md)). Kalibraci s ohledem na techniky EA rozebírá
stránka [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md).

## Související

**Platforma**

- [Decision Engine](@/glossary/decision-engine.md) – obecnější pojem rozhodovacího enginu.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací proces, do něhož jsou rozhodovací
  enginy zapojeny.
- [Risk Score](@/glossary/risk-score.md) – skóre rizika jako vstup rozhodnutí.
- [Due Diligence](@/glossary/due-diligence.md) – hlavní oblast použití.

**Kompendium**

- [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – jak kniha
  s rozhodovacím enginem souvisí.
- [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md)
  – kalibrace důvěry s ohledem na manipulaci.
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – lidský protějšek kalibrace.
