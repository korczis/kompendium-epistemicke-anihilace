+++
title = "Compliance Agent & EA detection"
description = "Integrace agenta Compliance Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 34

[taxonomies]
tags = ["kompendium", "aiad-integration", "compliance-ea-regulatory-screening"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["black-team-ea-modeling", "blue-team-ea-defense", "czech-ares-ea-screening", "dd-engine-ea-source-weighting"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Compliance Agent & EA detection

## Agent overview

Compliance Agent screeninguje EA detekce vůči regulačním frameworkům (GDPR, NIS2, AI Act) — generuje regulační reporty a flagguje violations vyžadující notifikaci. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Compliance Agent **uzavírá smyčku** mezi technickou EA detekcí a právní/regulační rovinou. Konzumuje **glossary-bridges/** pro mapping technických termínů na regulační definice.

## Detection mechanisms

Detekce: **regulation-rule matching** — pro každou detekovanou EA událost hledá **odpovídající regulační triggery** (např. data breach → GDPR Art. 33; AI manipulation → AI Act Art. 5).

## Operational protocols

Provoz: per-incident + monthly regulatory reporting cyklus. Výstup: **compliance report** s required actions a deadlines. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Compliance Agent je **rule-based** — nové regulace vyžadují manuální update. Také pomalý vůči real-time threats — je o **post-hoc reporting**, ne prevention.

## Coordination

Konzumuje výstupy **DD Engine**, **White Team**; výstupy archivuje s **White Team** v immutable storage; eskaluje **Strategic Command** pro material breach.

## Cross-linky

- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — peer v rámci Domain Agents
- [Osint Ea Source Validation](@/kompendium/aiad-integration/osint-ea-source-validation.md) — peer v rámci Domain Agents
- [Dd Engine Ea Source Weighting](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) — peer v rámci Domain Agents
- [Hawkeye Ea Visitor Intelligence](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) — peer v rámci Domain Agents
- [Perimeter Ea Attack Surface](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) — peer v rámci Domain Agents
- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — cross-group koordinace
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
