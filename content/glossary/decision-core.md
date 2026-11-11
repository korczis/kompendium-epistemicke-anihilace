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
related_terms = ["decision-engine", "epistemicka-pokora", "konfirmacni-bias", "signal-plurality", "risk-score"]
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
manipulaci (viz kapitola [Vztah k Decision Engine](@/kompendium/02-uvod/_index.md)).

## Původ a kontext pojmu

Decision Core vznikl v aplikaci `prismatic_dd`, tedy v části platformy určené pro
[due diligence](@/glossary/due-diligence.md) – prověrky firem, transakcí a protistran, kde
rozhodnutí musí být obhajitelné před klientem, auditorem i soudem. Odtud plyne jeho hlavní
nárok: nestačí, aby rozhodnutí bylo dobré, musí být také **zpětně vysvětlitelné** – kdo co
zadal, jaké výklady se zvažovaly, proč jeden zvítězil a jak dobře podobná rozhodnutí
v minulosti obstála.

Myšlenkově se Decision Core řadí k tradici, která v analytické práci odděluje generování
hypotéz od jejich hodnocení a trvá na kalibraci úsudku podle skutečnosti. Tato souvislost je
výkladová: platforma ji v dokumentaci neuvádí jako zdroj, ale principy jsou shodné. Patří
sem metoda soupeřících hypotéz, kterou pro zpravodajskou analýzu popsal Richards Heuer
(Heuer 1999), měření kvality pravděpodobnostních předpovědí (Brier 1950) a výzkum přesnosti
expertních odhadů (Tetlock 2005), z něhož vyplývá, že kalibrace – shoda mezi deklarovanou jistotou a skutečnou
úspěšností – je dovednost, kterou lze měřit a zlepšovat.

## Mechanismus

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

Podstatné je, co vzorec dělá s chybějícími a protichůdnými údaji: nechybí-li jen podpora,
ale i data, důvěra klesá (`missing_data_penalty`), a rozpor mezi signály se nepřičítá
k důvěře, nýbrž k nejistotě (`signal_conflict`). Hypotéza, která vypadá přesvědčivě jen
proto, že o ní nikdo nic protichůdného neví, tak nedostane vysoké skóre.

### Deterministický otisk

Každé rozhodnutí nese otisk SHA-256 odvozený z normalizovaného vstupu, verze enginu
a bodovacího profilu. Opakované spuštění se stejnými vstupy a stejným stavem kalibrace dá
vždy totéž rozhodnutí. Determinismus tu slouží auditu: kdo chce rozhodnutí zpochybnit, může
ho přesně zopakovat a ukázat, který vstup by výsledek změnil.

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

## Jak se projevuje

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

Uživatel tedy nevidí jen výsledek, ale celou **trasu rozhodnutí**: zadání, soupeřící
hypotézy s jejich skóre, zvolenou variantu, odstup od prahu a později i zaznamenaný skutečný
výsledek. Pohled „kalibrace“ ukazuje, zda systém soustavně přeceňuje, nebo podceňuje svou
jistotu.

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

### Osvědčené postupy

1. **Vždy dodat `structured_data`** – více datových polí dává jemnější hypotézy.
2. **Používat oborové profily** – finanční rozhodnutí potřebují jiné vážení rizika než
   personální.
3. **Soustavně zaznamenávat výsledky** – kalibrační smyčka se zlepšuje jen se zpětnou
   vazbou ze skutečnosti.
4. **Sledovat zdraví kalibrace** – `Calibrator.health_check/1` odhalí soustavné zkreslení.
5. **Brát vážně metriky stability** – je-li pravděpodobnost překlopení vyšší než 0,3, je
   rozhodnutí hraniční a potřebuje víc dat.

## Odlišení

Decision Core je třeba odlišit nejprve od obecnějšího pojmu [Decision Engine](@/glossary/decision-engine.md). Decision Engine označuje jakoukoli součást, která slučuje signály do rozhodnutí; Decision Core je konkrétní implementace platformy, kterou od jiných enginů odlišuje uzavřená kalibrační smyčka a deterministický otisk. Od [Risk Score](@/glossary/risk-score.md) se liší tím, že skóre rizika je jen jedním ze vstupů a jednou ze složek hodnocení: vysoké riziko může vyvážit vysoká důvěra, kdežto nízké riziko při vysoké nejistotě rozhodnutí nezachrání.

Podstatné je rozlišení mezi kalibrací a přesností. Systém může mít často pravdu, a přesto být špatně kalibrovaný, protože nedokáže říct, kdy ji nemá; jiný systém může být méně přesný, ale jeho „70 %“ opravdu znamená, že se zhruba sedm z deseti takových úsudků potvrdí. Brierovo skóre obě složky spojuje do jedné míry kvality pravděpodobnostní předpovědi (Brier 1950) a výzkum expertních odhadů ukázal, že právě kalibrace odlišuje dobré prognostiky od špatných (Tetlock 2005). Decision Core měří a koriguje tuto druhou vlastnost.

Determinismus nelze zaměňovat se správností. Opakovatelnost zaručuje, že rozhodnutí lze přezkoumat, ne že je pravdivé; chybný vstup dá deterministicky chybný výstup. Kahneman, Sibony a Sunstein však ukazují, že nesoulad mezi úsudky různých lidí – „šum“ – je v lidském rozhodování samostatným zdrojem chyb, který se dá omezit právě pevnými postupy (Kahneman, Sibony a Sunstein 2021). Konečně se Decision Core liší od klinického úsudku: klinik také zvažuje soupeřící hypotézy (srov. [diferenciální diagnostiku](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md)), ale pracuje s jedinečným člověkem, s kontextem a se vztahem, které do vzorce převést nelze.

## Význam pro Kompendium

Decision Core ukazuje, jak lze principy, které Kompendium formuluje pro lidské poznávání,
přenést do rozhodovacího systému: soupeřící hypotézy místo jediného výkladu (obrana proti
[konfirmačnímu biasu](@/glossary/konfirmacni-bias.md)), explicitní nejistota, záznam
výsledku a kalibrace podle skutečnosti (srov. [Epistemická
pokora](@/glossary/epistemicka-pokora.md)). Kalibraci s ohledem na techniky EA rozebírá
stránka [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md).

Pro knihu je cenný i obrácený pohled. Řada technik epistemické anihilace útočí právě na
to, co Decision Core chrání: [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
zahlcuje vstup, [falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md)
zužuje prostor hypotéz na dvě předem zvolené, [imunizace proti
falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) brání tomu,
aby výsledek zpětně opravil úsudek. Člověk vystavený dlouhodobé manipulaci tak ztrácí
vlastní „kalibrační smyčku“: přestává porovnávat své odhady se skutečností a přebírá cizí
míru jistoty. Zotavení pak podle kapitoly [Epistemická
rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md) zahrnuje
obnovu právě této schopnosti – drobné, ověřitelné předpovědi a jejich klidné porovnání
s tím, co se stalo.

Obecný příklad (kompozit): analytik prověřuje firmu, o níž koluje série negativních zpráv
z navzájem provázaných zdrojů. Decision Core vygeneruje vedle hypotézy „firma je
problematická“ i hypotézu „jde o koordinovanou kampaň“; nízká [pluralita
signálů](@/glossary/signal-plurality.md) zvýší nejistotu a stabilita rozhodnutí vyjde jako
hraniční. Výsledkem není verdikt, ale požadavek na nezávislý zdroj.

## Meze a otevřené otázky

První mezí je kvalita vstupu. Kalibrace opraví soustavné zkreslení, ne podvržená data; kdo ovládá vstupy, ovlivní i výstup, a proto platforma klade důraz na původ signálů. Heuer upozorňuje, že analytici mají sklon přeceňovat důkazy, které jsou živé a konkrétní, a podceňovat jejich spolehlivost (Heuer 1999) – stejné zkreslení se do systému dostává, pokud jsou takové důkazy nadreprezentovány ve vstupních datech.

Druhou mezí jsou vzácné a nejasné výsledky. Kalibrace potřebuje mnoho zaznamenaných výsledků; v oblastech, kde se „správnost“ rozhodnutí ukáže po letech nebo nikdy, zůstává smyčka slabá. Tetlock a Gardner ukazují, že kalibraci lze zlepšovat jen tam, kde existuje rychlá a jednoznačná zpětná vazba (Tetlock a Gardner 2015).

Třetí mezí je riziko falešné objektivity: číslo s desetinnou čárkou působí přesněji, než je, a výstup je hypotéza s mírou důvěry, ne fakt. U otázek duševního zdraví, bezpečí nebo viny konkrétní osoby proto automatizovaný závěr nenahrazuje odborný a soudní úsudek a Kompendium ho takto nepoužívá.

## Literatura

- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability.
  *Monthly Weather Review*, 78(1).
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. CIA Center for the Study of
  Intelligence.
- Tetlock, P. E. (2005). *Expert Political Judgment: How Good Is It? How Can We Know?*
  Princeton University Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.
- Kahneman, D., Sibony, O., & Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment*. Little, Brown Spark.
- Tetlock, P. E., & Gardner, D. (2015). *Superforecasting: The Art and Science of
  Prediction*. Crown.

## Související

**Platforma**

- [Decision Engine](@/glossary/decision-engine.md) – obecnější pojem rozhodovacího enginu.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací proces, do něhož jsou rozhodovací
  enginy zapojeny.
- [Risk Score](@/glossary/risk-score.md) – skóre rizika jako vstup rozhodnutí.
- [Due Diligence](@/glossary/due-diligence.md) – hlavní oblast použití.

**Kompendium**

- [Vztah k Decision Engine](@/kompendium/02-uvod/_index.md) – jak kniha
  s rozhodovacím enginem souvisí.
- [Decision Engine: kalibrace EA](@/kompendium/aiad-integration/decision-engine-ea-calibration.md)
  – kalibrace důvěry s ohledem na manipulaci.
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – lidský protějšek kalibrace.
- [Pluralita signálů](@/glossary/signal-plurality.md) – proč nezávislé zdroje snižují
  nejistotu.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – zkreslení, proti němuž chrání
  soupeřící hypotézy.
- [Epistemická rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md)
  – obnova lidské „kalibrační smyčky“ po manipulaci.
