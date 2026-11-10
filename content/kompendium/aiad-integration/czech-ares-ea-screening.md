+++
title = "Czech ARES Agent & EA detection"
description = "Integrace agenta Czech ARES Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 29

[taxonomies]
tags = ["kompendium", "aiad-integration", "czech-ares-ea-screening"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["blue-team-ea-defense", "compliance-ea-regulatory-screening", "dd-engine-ea-source-weighting", "decision-engine-ea-calibration"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Czech ARES Agent & EA detection

## Agent overview

Czech ARES Agent integruje český obchodní rejstřík s EA detekcí — odhaluje fake-entity manipulace, beneficial ownership obfuskaci a regulační arbitráž v M&A kontextech. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Czech ARES Agent aplikuje EA taxonomii na **konkrétní doménu českého firemního prostředí**. Konzumuje **case-studies/** pro precedenty manipulace s firemními daty (např. casecase Casper-Rondax z 2026-04-01 reportu).

## Detection mechanisms

Detekce: **cross-reference-based** — porovnává deklarace v ARES s realitou (CER databáze, OSINT, beneficial ownership registry). Flagguje **incoherence** jako suspect EA.

## Operational protocols

Provoz: per-investigation (DD pipeline). Latency: 2-10s per entity. Výstup: **entity profile** s flagged anomáliemi a confidence skóre. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Czech ARES Agent je **vázán na český režim** — nepřenositelný na jiné jurisdikce bez doménového adapteru. Také závislý na úplnosti veřejných dat.

## Coordination

Spolupracuje s **OSINT Agent** pro doplnění; data využívá **DD Engine**; verdikty validuje **Compliance Agent**.

## Cross-linky

- [Osint Ea Source Validation](@/kompendium/aiad-integration/osint-ea-source-validation.md) — peer v rámci Domain Agents
- [Dd Engine Ea Source Weighting](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) — peer v rámci Domain Agents
- [Hawkeye Ea Visitor Intelligence](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) — peer v rámci Domain Agents
- [Perimeter Ea Attack Surface](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) — peer v rámci Domain Agents
- [Compliance Ea Regulatory Screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) — peer v rámci Domain Agents
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
