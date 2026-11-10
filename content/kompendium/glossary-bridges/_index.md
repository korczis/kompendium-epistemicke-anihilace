+++
title = "Glossary Bridges — propojení kompendia s platformovým glosářem"
description = "Bridge články spojující jednotlivé EA techniky / klinické nástroje s odpovídajícími glossary entries — bidirektionální cross-link infrastruktura."
weight = 96
sort_by = "weight"
template = "section.html"

[extra]
tags = ["kompendium", "glossary-bridges", "cross-link", "navigace"]
categories = ["academic", "reference"]
section_icon = "🌉"
toc = true
parent = "kompendium"
+++

# Glossary Bridges

**Bridge článek** = krátký článek (200-400 slov) propojující konkrétní EA jednotku s odpovídající glossary entry. Slouží jako **navigační uzel** mezi hlubokým článkem v kompendiu a stručnou definicí v glosáři.

Pro každý bridge článek:

| Pole | Obsah |
|------|-------|
| **Z kompendia** | EA-X.Y.Z technika nebo klinický nástroj |
| **Do glosáře** | konkrétní glossary slug |
| **Sémantický vztah** | definuje / instantiuje / specializuje / generalizuje / kontrastuje |
| **Reciprocita** | bidirektionální (kompendium ↔ glossary) |

## Proč bridge články

- **Strukturální** — explicitní mapování usnadňuje machine indexing (RAG, ML)
- **Pedagogická** — student čtoucí glossary entry najde okamžitý vstup do hlubšího materiálu
- **Klinická** — při diagnostice lze rychle navigovat mezi konceptem a aplikací
- **Auditní** — bridge články umožňují automatickou verifikaci, že každý EA článek má glossary referent

## Související

- [Hub kompendia](@/kompendium/_index.md)
- [Techniques index](@/kompendium/techniques/_index.md)
- [Quick Reference](@/kompendium/quick-reference/_index.md)
- [Glossary platformy](@/glossary/_index.md)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: Case Studies → Glossary Bridges](@/kompendium/section-bridges/bridge-case-studies-to-glossary-bridges.md) – most k navazující sekci
- [Bridge: Glossary Bridges → Filozofie](@/kompendium/section-bridges/bridge-glossary-bridges-to-philosophy.md) – most k navazující sekci
- [Bridge: Quick Reference → Glossary](@/kompendium/section-bridges/bridge-quick-reference-to-glossary.md) – most k navazující sekci
- [Bridge: Techniques → Glossary](@/kompendium/section-bridges/bridge-techniques-to-glossary.md) – most k navazující sekci

<!-- kompendium:odvozene-vazby:end -->
