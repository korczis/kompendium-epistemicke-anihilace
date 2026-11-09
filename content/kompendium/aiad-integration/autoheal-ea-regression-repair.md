+++
title = "AutoHeal & EA detection"
description = "Integrace agenta AutoHeal s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 22
[taxonomies]
tags = ["kompendium", "aiad-integration", "autoheal-ea-regression-repair"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["archer-supreme-ea-orchestration", "autoevolve-ea-pattern-evolution", "black-team-ea-modeling", "blue-team-ea-defense"]
parent = "kompendium-aiad-integration"
toc = true
+++

# AutoHeal & EA detection

## Agent overview

AutoHeal je samoopravný systém — detekuje regrese v detekčních vrstvách a automaticky obnovuje known-good konfigurace bez lidského zásahu. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

AutoHeal sleduje **recovery-protocols/** kompendia jako autoritativní reference pro post-incident recovery. Každý protokol je executable runbook s definovanými idempotentními kroky.

## Detection mechanisms

Detekce: **deviation detection** — sleduje **baseline metriky** (false-positive rate, latency, throughput) a triggeruje při statisticky významném drift od historické baseline (3-sigma rule).

## Operational protocols

Provoz: continuous monitoring + reactive repair. MTTR cíl: < 5 minut pro známé regrese. Výstup: **healing report** s root-cause hypotézou a aplikovanou opravou. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

AutoHeal opravuje pouze **známé třídy regresí** — nové třídy degradace vyžadují eskalaci na lidského operátora. Také může maskovat skutečný problém auto-restartem.

## Coordination

Triggerován **Blue Teamem** a **Quality Monitor**; spolupracuje s **AutoEvolve** na long-term fix; auditováno **White Teamem**.

## Cross-linky

- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — peer v rámci Specialized Agents
- [Nabla Infinity Ea Pipeline](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) — peer v rámci Specialized Agents
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
