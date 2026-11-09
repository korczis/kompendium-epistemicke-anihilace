+++
title = "Epistemic Pipeline & EA detection"
description = "Integrace agenta Epistemic Pipeline s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 27
[taxonomies]
tags = ["kompendium", "aiad-integration", "epistemic-pipeline-ea-detection"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["dd-engine-ea-source-weighting", "decision-engine-ea-calibration", "gray-team-ea-edge-cases", "hawkeye-ea-visitor-intelligence"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Epistemic Pipeline & EA detection

## Agent overview

Epistemic Pipeline je 14-stage analyzátor epistemické integrity každého výroku — od claim extrakce přes source weighting po contradiction detection a confidence kalibraci. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Epistemic Pipeline implementuje 14 axiomů z [07-teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md) jako sekvenční stages. Používán pro **deep analysis** podezřelých výroků flaggovaných výše.

## Detection mechanisms

Detekce: **claim-level granularita** — každý jednotlivý výrok prochází 14 stages (extract, normalize, weight, cross-reference, contradiction-check, ...) s aggregovaným epistemic-integrity skóre.

## Operational protocols

Provoz: on-demand pro flaggované výroky (ne pro všechny — drahý). Latency: 1-5s per claim. Výstup: **epistemic envelope** s per-stage scores a final verdict. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Epistemic Pipeline je **náročný** (~14× normální cost) — nelze použít na masový traffic. Také trpí **citation-availability bias** — kvalita závisí na dostupnosti zdrojů.

## Coordination

Volán **NABLA Infinity** pro hlubší analýzu; používán **DD Engine** pro investigation reports; výstupy konzumuje **Decision Engine**.

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
