+++
title = "Taxonomie EA"
weight = 60

[extra]
category = "epistemic"
description = "Hierarchický klasifikační systém technik epistemické anihilace s notací EA-X.Y.Z-α, pokrývající 8 primárních kategorií a aspirativně 150+ technik."
related_terms = ["epistemicka-anihilace", "kognitivni-anihilace", "taxonomy", "classification"]
acronym = "EA"
author = "Tomáš Korcak (korczis)"
reading_time = "3 min"
word_count = 540
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["taxonomie EA", "EA classification", "epistemic annihilation taxonomy", "EA-X.Y.Z notation"]
tags = ["glossary", "epistemic", "kompendium", "taxonomy"]
quality_score = 84
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Taxonomie EA - glossary"
+++

## Definition

**Taxonomie EA** is the hierarchical classification system of [epistemické anihilace](@/glossary/epistemicka-anihilace.md) techniques used in the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md). It assigns every technique a stable identifier in the form **`EA-X.Y.Z-α`**, where:

| Component | Meaning | Example |
|-----------|---------|---------|
| **EA** | Constant prefix (Epistemic Annihilation) | `EA` |
| **X** | Primary category (1–8) | `1` (Academic Manipulation) |
| **Y** | Subcategory within the primary category | `1` (Acquisition Disruption) |
| **Z** | Specific technique within the subcategory | `1` (Selective Exposure) |
| **α** | Variant suffix (optional, lowercase letter) | `a`, `b`, `c` |

For example, `EA-1.1.1` is [Selective Exposure](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) — primary category 1 (Academic Manipulation), subcategory 1 (Acquisition), technique 1 (Selective Exposure). The suffix `-a` would denote a documented variant of the same technique.

The eight primary categories are:

1. **Akademické techniky** intelektuální manipulace
2. **Scénáře epistemické delegitimizace**
3. **Pokročilá edukativní implementace** (constructive counterpart)
4. **Terminální protokoly** (advanced destructive sequences)
5. **Ultramární techniky** fundamentální dekonstrukce (150 techniques planned)
6. **Klinické aplikace** (diagnostic and therapeutic frameworks)
7. **Teoretické reflexe** (philosophical and interdisciplinary)
8. **Přílohy** (master index, case studies, glossary)

## Context

The notation is designed with five engineering properties relevant to long-term scholarship:

| Property | Rationale |
|----------|-----------|
| **Stability** | The EA code does not change even if presentation URLs are refactored |
| **Hierarchical readability** | Reader can infer category and subcategory from the code itself |
| **Variant extensibility** | Suffix `-α` allows variant designation without restructuring |
| **Machine indexability** | Easy parsing for automated analysis, bibliography systems, ML training |
| **Auditability** | Unambiguous reference in cross-disciplinary discourse |

Within the Prismatic Platform, EA codes serve as **first-class cross-references**:

- The [Kompendium hub](@/kompendium/_index.md) and [techniques index](@/kompendium/techniques/_index.md) use them as canonical anchors.
- The [Decision Engine](/hub/dd/decisions/) calibration logic references EA codes when flagging epistemic manipulation indicators in input sources.
- [Glossary](@/glossary/_index.md) entries link directly to relevant EA codes for context.
- Future automation (RAG over the kompendium, structured ML training) will use EA codes as the primary indexing key.

The taxonomy follows **semver discipline**: bug-fix reclassifications increment the patch version; addition of new techniques increments the minor version; breaking restructuring of the code system increments the major version. The current version is **v0.1.0** — initial publication, taxonomy in active expansion.

## See Also

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — The phenomenon being classified
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) — Related but distinct phenomenon
- [Kompendium hub](@/kompendium/_index.md) — The full taxonomic reference
- [Techniques index](@/kompendium/techniques/_index.md) — Per-technique deep-dives by EA code

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
