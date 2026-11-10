+++
title = "Bridge: shodan"
description = "Glossary bridge — propojeni kompendia s glossary entry shodan."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "shodan", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-sealioning", "bridge-session-discipline", "bridge-simulacra", "bridge-strategic-command"]
parent = "kompendium-glossary-bridges"
glossary_target = "shodan"
toc = false
+++

# Bridge — shodan

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[shodan](@/glossary/shodan.md) — Shodan je vyhledávač internetově-připojených zařízení a služeb, který indexuje banner responses, otevřené porty, ICS/SCADA systémy, kamery a IoT. Slouží jako klíčový OSINT zdroj pro attack surface mapping i defensivní inventory discovery vlastní expozice.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 03 — OSINT zdroje**: Shodan v multi-source pipeline
- **Per-technique: Attack Surface Mapping**: operativní využití Shodan dorks
- **Sekce 06 — Defenzivní využití**: self-discovery vlastní expozice
- **Sekce 08 — Etika**: limity legitimního použití

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **Shodan** | indexuje | Internet-facing zařízení, banners, ICS/SCADA |
| **Shodan** | slouží | Attack surface mapping (red) + asset discovery (blue) |
| **Shodan** | kontrastuje s | Censys (komplementární databáze) |

## Bezpečnostní implikace

Defenzivní hodnota Shodanu spočívá v continuous self-discovery — organizace, která nezná svou expozici, ji nemůže redukovat. Periodický Shodan scan vlastních ASN, doménových IP rozsahů a third-party services je minimální disciplinou attack surface managementu, který předchází incidentům, ne reaguje na ně.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/shodan/](@/glossary/shodan.md)
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
