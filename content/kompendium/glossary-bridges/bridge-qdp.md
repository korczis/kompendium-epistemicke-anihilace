+++
title = "Bridge: qdp"
description = "Glossary bridge — propojeni kompendia s glossary entry qdp."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "qdp", "cross-link"]
categories = ["academic", "reference"]
[extra]
parent = "kompendium-glossary-bridges"
glossary_target = "qdp"
toc = false
+++

# Bridge — qdp

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[qdp](@/glossary/qdp.md) — QDP (Quality Debt Pillar) je systematická správa technického dluhu v Prismatic platformě, kvantifikující dluhové položky podle dopadu, urgence a remediation cost. Slouží jako rozhodovací nástroj pro prioritizaci refaktorovacích sprintů a balance mezi feature work a debt remediation.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 08 — Quality Gates**: vztah QDP k credo, dialyzer, doctrine pillarům
- **Per-technique: Debt Inventory**: metodologie evidence dluhu
- **Sekce 09 — Sprint Planning**: balance feature work vs. debt remediation
- **Sekce 10 — Metriky**: debt ratio, remediation velocity

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **QDP** | kvantifikuje | Položky dluhu podle dopadu × urgence × remediation cost |
| **QDP** | podporuje | Prioritizaci refaktorovacích sprintů |
| **QDP** | integruje s | Credo, Dialyzer, doctrine pillary |

## Platformové implikace

Bez QDP se technický dluh akumuluje invisibilně, dokud nepřekročí kritickou hranici a nezablokuje feature development. Disciplinovaná evidence dluhu, periodická review a explicitní remediation rozpočet (typicky 15–25 % sprint kapacity) jsou strukturálním předpokladem dlouhodobé udržitelnosti rozsáhlých kódových bází.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/qdp/](@/glossary/qdp.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Per-technique články**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Sekce 02 — Úvod**: [/kompendium/02-uvod/](@/kompendium/02-uvod/_index.md)
- **Sekce 06 — Klinické aplikace**: [/kompendium/06-klinicke/](/kompendium/06-klinicke-aplikace/)
- **Sekce 07 — Teoretické reflexe**: [/kompendium/07-teoreticke/](/kompendium/07-teoreticke-reflexe/)
- **Sekce 08 — Etika a doktrína**: [/kompendium/08-etika/](/kompendium/08-prilohy/)
- **Glossary hub**: [/glossary/](@/glossary/_index.md)

---

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis/prismatic-platform)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
