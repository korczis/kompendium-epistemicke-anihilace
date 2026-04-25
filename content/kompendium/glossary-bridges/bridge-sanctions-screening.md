+++
title = "Bridge: sanctions-screening"
description = "Glossary bridge — propojeni kompendia s glossary entry sanctions-screening."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "sanctions-screening", "cross-link"]
categories = ["academic", "reference"]
[extra]
parent = "kompendium-glossary-bridges"
glossary_target = "sanctions-screening"
toc = false
+++

# Bridge — sanctions-screening

**Z kompendia → do glossary**: tento bridge článek navigačně propojuje kompendium s odpovídajícím glossary heslem a poskytuje rozšířený interpretační kontext propojení.

## Definice z glossary

[sanctions-screening](/glossary/sanctions-screening/) — Sanctions screening je systematická kontrola subjektů (osoby, firmy, plavidla) proti seznamům sankcí (OFAC, EU, UN, UK, národní). Slouží compliance povinnostem v bankingu, M&A, supply chain a vyžaduje fuzzy matching, transliteraci a periodický rescan při změnách seznamů.

Glossary entry slouží jako kanonický referenční bod platformy; bridge článek rozšiřuje stručnou definici o platformový a interpretační kontext, v němž koncept skutečně operuje.

## Pozice v kompendiu

Tento koncept se vyskytuje napříč kompendiem v následujících kontextech:

- **Sekce 04 — Compliance**: regulační povinnosti dle AML/CFT
- **Per-technique: Name Matching**: fuzzy matching, transliterace, alias resolution
- **Sekce 05 — False Positive Management**: kalibrace prahů a manuální review
- **Sekce 08 — Audit Trail**: evidence pro regulační inspekci

Každý z těchto výskytů přidává specifickou perspektivu — operativní pipeline, teoretické pozadí, klinickou aplikaci nebo metodologickou reflexi.

## Konceptuální mapa

| Subjekt | Vztah | Objekt |
|---------|-------|--------|
| **Sanctions screening** | kontroluje | Subjekty proti OFAC, EU, UN, UK seznamům |
| **Sanctions screening** | vyžaduje | Fuzzy matching, transliteraci, periodický rescan |
| **Sanctions screening** | produkuje | False positives → manuální review |

## Bezpečnostní implikace

Hodnota screeningu nevzniká z prvotního scanu, nýbrž z continuous monitoring — sankce se mění denně a subjekt, který byl čistý při onboardingu, může být sankcionován za měsíc. Disciplinovaná praxe spojuje real-time alerty, audit trail pro každý hit i miss a periodickou revizi konfigurace fuzzy match prahů.

## Cross-linky

- **Hub kompendia**: [/kompendium/](/kompendium/)
- **Glossary entry**: [/glossary/sanctions-screening/](/glossary/sanctions-screening/)
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
