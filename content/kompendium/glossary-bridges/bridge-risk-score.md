+++
title = "Bridge: risk-score"
description = "Glossary bridge — propojeni kompendia s glossary entry risk-score."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "risk-score", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-regression-test", "bridge-replication-crisis", "bridge-sanctions-screening", "bridge-sealioning"]
parent = "kompendium-glossary-bridges"
glossary_target = "risk-score"
toc = false
+++

# Bridge — risk-score

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[risk-score](@/glossary/risk-score.md) — Risk score je kvantifikované hodnocení rizika subjektu, transakce nebo události na základě multi-faktoriální analýzy. Slouží k prioritizaci pozornosti, ale nese rizika spojená s redukcí komplexity, optimalizací proti metrice (Goodhartův zákon) a etickými dopady automatizovaného rozhodování.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 03 — Architektura intelligence**: vztah risk score k [decision engine](@/glossary/decision-engine.md)
- **Per-technique: Risk Calibration**: operativní kalibrace skóre
- **Sekce 06 — Quality assurance**: audit fairness a accuracy
- **Sekce 08 — Etika**: limity automatizovaného rozhodování

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **Risk score** | kvantifikuje | Multi-faktoriální hodnocení rizika |
| **Risk score** | umožňuje | Prioritizaci pozornosti a triage |
| **Risk score** | ohrožen | Goodhartovým zákonem a fairness biasem |

## Bezpečnostní implikace

Kalibrovaný risk score je nástrojem, ne soudcem — automatizované rozhodnutí s vysokou consequence (zamítnutí, blokace, hlášení) vyžaduje human-in-the-loop a auditní stopu. Periodická revize falešně-pozitivních a falešně-negativních případů, fairness metriky a transparentní explicability jsou minimálním etickým standardem.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/risk-score/](@/glossary/risk-score.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Per-technique články**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Sekce 02 — Úvod**: [/kompendium/02-uvod/](@/kompendium/02-uvod/_index.md)
- **Sekce 06 — Klinické aplikace**: [/kompendium/06-klinicke/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Sekce 07 — Teoretické reflexe**: [/kompendium/07-teoreticke/](@/kompendium/07-teoreticke-reflexe/_index.md)
- **Sekce 08 — Etika a doktrína**: [/kompendium/08-etika/](@/kompendium/08-prilohy/_index.md)
- **Glossary hub**: [/glossary/](@/glossary/_index.md)

---

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis/kompendium-epistemicke-anihilace)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Meet the Creator](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
