+++
title = "Bridge: red-team"
description = "Glossary bridge — propojeni kompendia s glossary entry red-team."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "red-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-quality-debt", "bridge-readiness", "bridge-regression-test", "bridge-replication-crisis"]
parent = "kompendium-glossary-bridges"
glossary_target = "red-team"
toc = false
+++

# Bridge — red-team

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[red-team](@/glossary/red-team.md) — Red team je strukturovaná adversariální skupina simulující reálnou hrozbu proti vlastní organizaci. Liší se od pentestu šíří záběru (lidé, procesy, fyzická bezpečnost), dlouhodobou perspektivou a cílem testovat detekci a reakci, ne pouze technické zranitelnosti.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 04 — Bezpečnostní architektura**: vztah k blue, purple, white teamům
- **Per-technique: Engagement Planning**: scope, ROE, deconfliction
- **Sekce 05 — TTPs**: MITRE ATT&CK mapping
- **Sekce 08 — Metriky**: MTTD, MTTR, coverage

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **Red team** | simuluje | Reálnou hrozbu proti vlastní organizaci |
| **Red team** | testuje | Detekci, reakci, ne jen technické díry |
| **Red team** | vyžaduje | Scope, ROE, deconfliction s blue týmem |

## Bezpečnostní implikace

Red team bez integrace s blue/purple cyklem produkuje izolovaný report, který organizace neumí absorbovat. Hodnota vzniká z continuous engagement: red týmu, jehož TTPs se převádí do detekčních pravidel a jehož post-mortem feeduje sprint planning. Red team je investice do organizačního učení, ne do jednorázového ujištění.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/red-team/](@/glossary/red-team.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Per-technique články**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Sekce 02 — Úvod**: [/kompendium/02-uvod/](@/kompendium/02-uvod/_index.md)
- **Sekce 06 — Klinické aplikace**: [/kompendium/06-klinicke/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Sekce 07 — Teoretické reflexe**: [/kompendium/07-teoreticke/](@/kompendium/07-teoreticke-reflexe/_index.md)
- **Sekce 08 — Etika a doktrína**: [/kompendium/08-etika/](@/kompendium/08-prilohy/_index.md)
- **Glossary hub**: [/glossary/](@/glossary/_index.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Meet the Creator](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Red Team (červený tým)](@/glossary/red-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
