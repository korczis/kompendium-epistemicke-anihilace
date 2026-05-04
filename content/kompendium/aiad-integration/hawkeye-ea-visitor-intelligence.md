+++
title = "Hawkeye Agent & EA detection"
description = "Integrace agenta Hawkeye Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 32
[taxonomies]
tags = ["kompendium", "aiad-integration", "hawkeye-ea-visitor-intelligence"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["epistemic-pipeline-ea-detection", "gray-team-ea-edge-cases", "nabla-infinity-ea-pipeline", "operational-execution-ea-deployment"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Hawkeye Agent & EA detection

## Agent overview

Hawkeye monitoruje provozní telemetrii web aplikací — detekuje bot-net manipulaci, fake engagement, a coordinated review/comment kampaně jako EA na reputační ploše. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Hawkeye aplikuje EA taxonomii na **traffic-level data** — detekuje vzory, kde sami návštěvníci jsou součástí EA kampaně. Konzumuje **detection-signatures/** pro bot patterns.

## Detection mechanisms

Detekce: **behavioral baseline drift** — porovnává aktuální traffic vzory s historickou baseline; flagguje **coordinated bursts**, **synchronized timing**, **homogeneous fingerprints** jako bot-net suspect.

## Operational protocols

Provoz: streaming, sub-second latency pro real-time blocking. Výstup: **traffic events** s suspect classification a auto-blocking pro known-bad. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Hawkeye **nevidí motivaci** — vidí pouze chování. Sofistikovaný útočník s human-like timing může proklouznout. Vyžaduje human-in-the-loop pro nuance.

## Coordination

Krmí data **Perimeter Agent** pro asset-level kontext; spolupracuje s **OSINT Agent** pro IP/domain reputaci; eskaluje **Operational Execution** pro blocking.

## Cross-linky

- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — peer v rámci Domain Agents
- [Osint Ea Source Validation](@/kompendium/aiad-integration/osint-ea-source-validation.md) — peer v rámci Domain Agents
- [Dd Engine Ea Source Weighting](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) — peer v rámci Domain Agents
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

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
