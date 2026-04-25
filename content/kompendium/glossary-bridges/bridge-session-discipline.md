+++
title = "Bridge: session-discipline"
description = "Glossary bridge — propojeni kompendia s glossary entry session-discipline."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "session-discipline", "cross-link"]
categories = ["academic", "reference"]
[extra]
parent = "kompendium-glossary-bridges"
glossary_target = "session-discipline"
toc = false
+++

# Bridge — session-discipline

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[session-discipline](/glossary/session-discipline/) — Session discipline je doctrinální požadavek Prismatic platformy strukturovat každou pracovní session: GitLab issue, kontinuální commits, push k remote, zákaz --no-verify a regression test pro každý bug fix. Cílem je auditovatelnost a kumulativní progrese.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 08 — Doctrina NM/ND**: session discipline jako součást orthopraxe
- **Per-technique: Session Workflow**: issue → branch → continuous commits → MR
- **Sekce 09 — Pre-commit Hooks**: automatizovaná detekce porušení
- **Sekce 10 — Audit Trail**: session jako epistemický artefakt

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **Session discipline** | vyžaduje | Issue + continuous commits + push + regression test |
| **Session discipline** | zakazuje | --no-verify a amend po hook failure |
| **Session discipline** | produkuje | Auditovatelnou kumulativní progresi |

## Platformové implikace

Bez session discipline degraduje práce na velký commit s neznámou historií — kód, který funguje, ale nikdo neví proč ani jaká byla cesta. Disciplinovaná session zachycuje rozhodovací stopu, alternativy zvážené i zavržené, a tím transformuje práci z výsledku na dokumentovaný proces, který lze později replikovat a kritizovat.

## Cross-linky

- **Hub kompendia**: [/kompendium/](/kompendium/)
- **Glossary entry**: [/glossary/session-discipline/](/glossary/session-discipline/)
- **Quick reference**: [/kompendium/quick-reference/](/kompendium/quick-reference/)
- **Visualizations**: [/kompendium/visualizations/](/kompendium/visualizations/)
- **Per-technique články**: [/kompendium/techniques/](/kompendium/techniques/)
- **Sekce 02 — Úvod**: [/kompendium/02-uvod/](/kompendium/02-uvod/)
- **Sekce 06 — Klinické aplikace**: [/kompendium/06-klinicke/](/kompendium/06-klinicke/)
- **Sekce 07 — Teoretické reflexe**: [/kompendium/07-teoreticke/](/kompendium/07-teoreticke/)
- **Sekce 08 — Etika a doktrína**: [/kompendium/08-etika/](/kompendium/08-etika/)
- **Glossary hub**: [/glossary/](/glossary/)

---

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis/prismatic-platform)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
