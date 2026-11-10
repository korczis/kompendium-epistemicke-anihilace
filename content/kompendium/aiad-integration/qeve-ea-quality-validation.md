+++
title = "QEVE Agent & EA detection"
description = "Integrace agenta QEVE Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 26

[taxonomies]
tags = ["kompendium", "aiad-integration", "qeve-ea-quality-validation"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["perimeter-ea-attack-surface", "purple-team-ea-synthesis", "quality-monitor-ea-tracking", "red-team-ea-detection"]
parent = "kompendium-aiad-integration"
toc = true
+++

# QEVE Agent & EA detection

## Agent overview

QEVE (Quality Enforcement Verification Engine) validuje kvalitu detekčních pravidel — měří precision/recall, detekuje rule rot a doporučuje retiring zastaralých pravidel. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

QEVE konzumuje **detection-signatures/** jako svůj corpus a sleduje **temporal performance** každého pravidla. Pravidla, která ztratila relevanci, jsou markována pro deprecation.

## Detection mechanisms

Detekce: **rule-fitness scoring** — kombinace (recall × precision × recency × diversity-of-trigger) → fitness score. Pravidla pod prahem jsou flaggována.

## Operational protocols

Provoz: weekly fitness review. Výstup: **fitness report** s ranked pravidly a doporučením (retain, refresh, retire). Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

QEVE měří **historickou výkonnost**, ne futuristickou relevanci — nově vznikající EA techniky jsou pro něj neviditelné. Doplňuje, nenahrazuje, **Black Team**.

## Coordination

Spolupracuje s **AutoEvolve** na náhradu deprecated pravidel; krmí data **Quality Monitor**; výstupy review **Purple Team**.

## Cross-linky

- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — peer v rámci Specialized Agents
- [Autoheal Ea Regression Repair](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) — peer v rámci Specialized Agents
- [Nabla Infinity Ea Pipeline](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) — peer v rámci Specialized Agents
- [Decision Engine Ea Calibration](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) — peer v rámci Specialized Agents
- [Trinity Gate Ea Verification](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) — peer v rámci Specialized Agents
- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — cross-group koordinace
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
