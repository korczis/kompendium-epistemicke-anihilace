+++
title = "Bridge: decision-engine"
description = "Glossary bridge — propojeni kompendia s glossary entry decision-engine."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "decision-engine", "cross-link"]
categories = ["academic", "reference"]
[extra]
related_terms = ["bridge-companion", "bridge-darvo", "bridge-deepfake", "bridge-delegitimizace"]
parent = "kompendium-glossary-bridges"
glossary_target = "decision-engine"
toc = false
+++

# Bridge — Decision Engine

## Glossary entry

[decision-engine](@/glossary/decision-engine.md) — Decision Engine.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Decision Engine je 10-stage runtime pipeline Prismatic platformy pro deterministické rozhodování pod nejistotou: normalize → signals → sources → anomalies → actors → score → uncertainty → hypotheses → recommend → explain. Vstupem je textový brief + accteurs metadata, výstupem je strukturovaný DecisionEnvelope s reasoning trace.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — Decision making**: DE jako jádro DD analytického workflow
- **Sekce 05 — 10-stage pipeline**: krok za krokem
- **Sekce 06 — Calibration loop**: Brier score, ECE, drift adaptation
- **Sekce 07 — Hypothesis testing**: competing hypotheses, posterior probabilities
- **Per-technique články**: DecisionEnvelope schema, OutcomeProcessor, integration patterns

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| využívá | ConfidenceLens, Calibration | support modules |
| produkuje | DecisionEnvelope | output |
| integruje | Nabla, Intelligence | epistemic layer |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Decision Engine materializuje princip transparentního rozhodování: každý krok je auditovatelný, každý signal je zpětně sledovatelný k zdroji, každý verdict má quantified uncertainty. Filosoficky reflektuje Bayesian rationality s feedback loop. Klinicky enforcuje epistemic humility — verdict 95+ confidence triggeruje overconfidence alert.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/decision-engine/](@/glossary/decision-engine.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/kompendium-epistemicke-anihilace)** | [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)
