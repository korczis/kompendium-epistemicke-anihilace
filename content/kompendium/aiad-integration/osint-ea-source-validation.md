+++
title = "OSINT Agent & EA detection"
description = "Integrace agenta OSINT Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 30
[taxonomies]
tags = ["kompendium", "aiad-integration", "osint-ea-source-validation"]
categories = ["academic", "platform-integration"]
[extra]
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

Provoz: per-query streaming. Latency: 1-30s podle počtu adapterů. Výstup: **multi-source envelope** se source-weighted findings. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

OSINT Agent je **slepý vůči closed-source pravdě** — pokud klíčové data nejsou veřejná, dostaneme jen partial picture. Také zranitelný vůči **coordinated source poisoning**.

## Coordination

Hlavní data zdroj pro **Czech ARES**, **DD Engine**, **Hawkeye**, **Black Team**; výstupy konzumuje **NABLA Infinity** a **Epistemic Pipeline**.

## Cross-linky

- [Czech Ares Ea Screening](/kompendium/aiad-integration/czech-ares-ea-screening/) — peer v rámci Domain Agents
- [Dd Engine Ea Source Weighting](/kompendium/aiad-integration/dd-engine-ea-source-weighting/) — peer v rámci Domain Agents
- [Hawkeye Ea Visitor Intelligence](/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence/) — peer v rámci Domain Agents
- [Perimeter Ea Attack Surface](/kompendium/aiad-integration/perimeter-ea-attack-surface/) — peer v rámci Domain Agents
- [Compliance Ea Regulatory Screening](/kompendium/aiad-integration/compliance-ea-regulatory-screening/) — peer v rámci Domain Agents
- [Red Team Ea Detection](/kompendium/aiad-integration/red-team-ea-detection/) — cross-group koordinace
- [Archer Supreme Ea Orchestration](/kompendium/aiad-integration/archer-supreme-ea-orchestration/) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](/kompendium/aiad-integration/autoevolve-ea-pattern-evolution/) — cross-group koordinace
- [základní kategorie EA](/kompendium/03-zakladni-kategorie/) — EA taxonomie
- [terminální protokoly](/kompendium/04-terminalni-protokoly/) — EA taxonomie
- [ultramari techniky](/kompendium/05-ultramari-techniky/) — EA taxonomie
- [agent-tier](/glossary/agent-tier) — platform glossary
- [color-teams](/glossary/color-teams) — platform glossary
- [archer-supreme glossary](/glossary/archer-supreme) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
