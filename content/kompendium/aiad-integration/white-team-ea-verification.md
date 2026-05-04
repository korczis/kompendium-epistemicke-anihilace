+++
title = "White Team & EA detection"
description = "Integrace agenta White Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 13
[taxonomies]
tags = ["kompendium", "aiad-integration", "white-team-ea-verification"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["tactical-execution-ea-operations", "trinity-gate-ea-verification", "supreme-commander-ea-strategy"]
parent = "kompendium-aiad-integration"
toc = true
+++

# White Team & EA detection

## Agent overview

White Team poskytuje nezávislou verifikaci — auditní traily, regulační compliance, a důkazní řetězce pro každou detekovanou EA událost s právní vahou. V architektuře platformy zaujímá pozici v rámci **Color Teams** (color-teams) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

White Team operuje **mimo Red/Blue/Purple smyčku** — je epistemicky neutrální audit, který validuje, že detekce a obrany byly provedeny v souladu s **GDPR, NIS2, AI Act** a interními politikami. Konzumuje celé kompendium jako **referenční korpus pro důkazní standardy**.

## Detection mechanisms

Detekce: nepřímá — neauditují EA samy o sobě, ale **kvalitu auditního záznamu** o nich. Hledá: chybějící timestampy, nekompletní chain-of-custody, nepodepsané důkazy, expirované hash-anchory.

## Operational protocols

Provoz: měsíční audit cyklus + ad-hoc reviews na vyžádání Compliance. Výstup: signed audit reports v immutable storage (Postgres + WORM bucket). Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

White Team **nezachycuje EA v reálném čase** — je retrospektivní. Také není odborníkem na samotné EA techniky, pouze na důkazní standardy.

## Coordination

Validuje výstupy všech ostatních týmů; eskaluje **Compliance Agent** pro regulační reporting; spolupracuje s **Trinity Gate** na multi-stage verifikaci.

## Cross-linky

- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — peer v rámci Color Teams
- [Blue Team Ea Defense](@/kompendium/aiad-integration/blue-team-ea-defense.md) — peer v rámci Color Teams
- [Purple Team Ea Synthesis](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) — peer v rámci Color Teams
- [Black Team Ea Modeling](@/kompendium/aiad-integration/black-team-ea-modeling.md) — peer v rámci Color Teams
- [Gray Team Ea Edge Cases](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) — peer v rámci Color Teams
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — cross-group koordinace
- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
