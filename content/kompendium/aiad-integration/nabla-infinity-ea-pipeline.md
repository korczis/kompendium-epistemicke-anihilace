+++
title = "NABLA Infinity (∇∞) & EA detection"
description = "Integrace agenta NABLA Infinity (∇∞) s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 23

[taxonomies]
tags = ["kompendium", "aiad-integration", "nabla-infinity-ea-pipeline"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["gray-team-ea-edge-cases", "hawkeye-ea-visitor-intelligence", "operational-execution-ea-deployment", "osint-ea-source-validation"]
parent = "kompendium-aiad-integration"
toc = true
+++

# NABLA Infinity (∇∞) & EA detection

## Agent overview

[NABLA Infinity](@/glossary/nabla-infinity.md) je epistemická detekční pipeline — kvantifikuje epistemic vs. aleatoric uncertainty každého LLM výstupu a flagguje high-confidence-low-truth signály jako EA suspects. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

NABLA Infinity je **klíčový engine** pro detekci [05-ultramari-techniky](@/kompendium/05-ultramari-techniky/_index.md) — sofistikovaných EA, které proklouznou signaturovými filtry. Aplikuje **Bayesian decomposition** uncertainty.

## Detection mechanisms

Detekce: **inverted confidence rule** — vysoká model confidence + nízká source diversity + chybějící citation → suspect. Používá 14-axiomový framework epistemické integrity.

## Operational protocols

Provoz: in-line v každém LLM call. Latency overhead: ~50ms. Výstup: **uncertainty triple** (epistemic, aleatoric, total) + suspect flag. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

NABLA Infinity **není detektor lži** — pouze flagguje **statistické anomálie**. Vyžaduje human review nebo downstream agenta pro klasifikaci.

## Coordination

Volán **[Decision Engine](@/glossary/decision-engine.md)** pro každé rozhodnutí; krmí data **Quality Monitor**; používán **[Trinity Gate](@/glossary/trinity-gate.md)** ve verifikační vrstvě.

## Cross-linky

- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — peer v rámci Specialized Agents
- [Autoheal Ea Regression Repair](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) — peer v rámci Specialized Agents
- [Decision Engine Ea Calibration](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) — peer v rámci Specialized Agents
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
