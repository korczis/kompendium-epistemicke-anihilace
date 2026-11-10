+++
title = "Decision Engine & EA detection"
description = "Integrace agenta Decision Engine s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 24

[taxonomies]
tags = ["kompendium", "aiad-integration", "decision-engine-ea-calibration"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["czech-ares-ea-screening", "dd-engine-ea-source-weighting", "epistemic-pipeline-ea-detection", "gray-team-ea-edge-cases"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Decision Engine & EA detection

## Agent overview

[Decision Engine](@/glossary/decision-engine.md) je deterministický rozhodovací motor — kombinuje signály z multiple agentů přes 10-stage pipeline a produkuje kalibrované rozhodnutí s výpočetně reprodukovatelnou explanací. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Decision Engine konzumuje **detection-signatures/** jako rule-base a **case-studies/** jako historickou kalibrační sadu. Každé rozhodnutí o EA klasifikaci prochází stejnými 10 fázemi pro auditovatelnost.

## Detection mechanisms

Detekce: **agregátor**, ne primární detektor — kombinuje signály (signature match, NABLA confidence, behavioral baseline, historical precedent) přes vážený scoring s post-decision Brier-score kalibrací.

## Operational protocols

Provoz: per-decision sync call. Latency: < 100ms. Výstup: **decision envelope** s verdict, confidence, top-k rationale, replay-hash. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Decision Engine je **deterministický** — vždy produkuje stejný výstup pro stejný vstup. To je síla (auditovatelnost) i slabost (slepota vůči context drift bez explicitního re-trainu).

## Coordination

Hlavní konzument výstupů **[NABLA Infinity](@/glossary/nabla-infinity.md)** a **Blue Teamu**; výstupy ukládá **[Trinity Gate](@/glossary/trinity-gate.md)** pro verifikaci; rozhodnutí auditována **White Teamem**.

## Cross-linky

- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — peer v rámci Specialized Agents
- [Autoheal Ea Regression Repair](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) — peer v rámci Specialized Agents
- [Nabla Infinity Ea Pipeline](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) — peer v rámci Specialized Agents
- [Trinity Gate Ea Verification](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) — peer v rámci Specialized Agents
- [Qeve Ea Quality Validation](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) — peer v rámci Specialized Agents
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
