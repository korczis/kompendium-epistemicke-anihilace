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

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](@/developers/_index.md)
