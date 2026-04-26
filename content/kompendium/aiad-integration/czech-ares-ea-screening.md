+++
title = "Czech ARES Agent & EA detection"
description = "Integrace agenta Czech ARES Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 29
[taxonomies]
tags = ["kompendium", "aiad-integration", "czech-ares-ea-screening"]
categories = ["academic", "platform-integration"]
[extra]
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

Provoz: per-investigation (DD pipeline). Latency: 2-10s per entity. Výstup: **entity profile** s flagged anomáliemi a confidence skóre. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Czech ARES Agent je **vázán na český režim** — nepřenositelný na jiné jurisdikce bez doménového adapteru. Také závislý na úplnosti veřejných dat.

## Coordination

Spolupracuje s **OSINT Agent** pro doplnění; data využívá **DD Engine**; verdikty validuje **Compliance Agent**.

## Cross-linky

- [Osint Ea Source Validation](/kompendium/aiad-integration/osint-ea-source-validation/) — peer v rámci Domain Agents
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
