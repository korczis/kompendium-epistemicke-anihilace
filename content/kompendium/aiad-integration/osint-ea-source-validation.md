+++
title = "OSINT Agent & EA detection"
description = "Integrace agenta OSINT Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 30

[taxonomies]
tags = ["kompendium", "aiad-integration", "osint-ea-source-validation"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["nabla-infinity-ea-pipeline", "operational-execution-ea-deployment", "perimeter-ea-attack-surface", "purple-team-ea-synthesis"]
parent = "kompendium-aiad-integration"
toc = true
+++

# OSINT Agent & EA detection

## Agent overview

OSINT Agent koordinuje 128+ samo-registrujících adapterů pro multi-source intelligence — agreguje veřejné zdroje a aplikuje **source weighting** pro detekci EA disinformačních kampaní. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

OSINT Agent je **primary input layer** pro mnoho EA detekcí. Konzumuje **case-studies/** pro známé disinfo kampaně a **detection-signatures/** pro source-poisoning vzory.

## Detection mechanisms

Detekce: **multi-source triangulation** — výrok podpořený jediným zdrojem = nízká confidence; výrok podpořený **diversifikovaně váženými zdroji** = vysoká confidence. Flagguje **echo chambers** jako EA suspect.

## Operational protocols

Provoz: per-query streaming. Latency: 1-30s podle počtu adapterů. Výstup: **multi-source envelope** se source-weighted findings. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

OSINT Agent je **slepý vůči closed-source pravdě** — pokud klíčové data nejsou veřejná, dostaneme jen partial picture. Také zranitelný vůči **coordinated source poisoning**.

## Coordination

Hlavní data zdroj pro **Czech ARES**, **DD Engine**, **Hawkeye**, **Black Team**; výstupy konzumuje **NABLA Infinity** a **Epistemic Pipeline**.

## Cross-linky

- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — peer v rámci Domain Agents
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
