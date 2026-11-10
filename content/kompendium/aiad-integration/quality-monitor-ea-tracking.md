+++
title = "Quality Monitor & EA detection"
description = "Integrace agenta Quality Monitor s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 28

[taxonomies]
tags = ["kompendium", "aiad-integration", "quality-monitor-ea-tracking"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["purple-team-ea-synthesis", "qeve-ea-quality-validation", "red-team-ea-detection", "strategic-command-ea-coordination"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Quality Monitor & EA detection

## Agent overview

Quality Monitor je telemetrický agregátor — sleduje real-time KPI obranných vrstev (TPR, FPR, latency, coverage) a triggeruje alerty při anomáliích. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Quality Monitor agreguje data ze **všech detekčních agentů** a vizualizuje **stav obranného portfolia** vůči **kompendiu jako celku** — která EA kategorie má jaké pokrytí, jakou recent performance.

## Detection mechanisms

Detekce: **drift detection** na KPI úrovni — sleduje **moving baseline** (7-day, 30-day) a triggeruje při překročení 2-sigma odchylky. Distinguishes seasonal vs. structural drift.

## Operational protocols

Provoz: 24/7 streaming. Dashboard latency: < 5s. Výstup: **alert events** + dashboards (Grafana-like). Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Quality Monitor **vidí jen co je instrumentováno** — pokud agent nemá telemetry hooks, je pro Quality Monitor neviditelný. Také trpí **alert fatigue**, pokud nejsou prahy dobře kalibrované.

## Coordination

Hlavní data konzument všech ostatních agentů; krmí data **[AutoHeal](@/glossary/autoheal.md)** a **[AutoEvolve](@/glossary/autoevolve.md)**; eskaluje **[Tactical Execution](@/glossary/tactical-execution.md)** při kritických alertech.

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
