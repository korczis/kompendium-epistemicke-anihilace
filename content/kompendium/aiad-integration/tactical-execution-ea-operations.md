+++
title = "Tactical Execution & EA detection"
description = "Integrace agenta Tactical Execution s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 19
[taxonomies]
tags = ["kompendium", "aiad-integration", "tactical-execution-ea-operations"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["strategic-command-ea-coordination", "supreme-commander-ea-strategy", "trinity-gate-ea-verification", "white-team-ea-verification"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Tactical Execution & EA detection

## Agent overview

Tactical Execution provádí konkrétní obranné operace na taktické úrovni — spouští skenovací cykly, aplikuje patche a koordinuje aktivní response na zachycené EA. V architektuře platformy zaujímá pozici v rámci **Strategic Agents** (strategic) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Tactical Execution operuje na **hodinové až denní časové škále** — mezi strategickým plánováním a real-time exekucí. Konzumuje **emergency-protocols/** a **recovery-protocols/** jako runbooky.

## Detection mechanisms

Detekce: **playbook-driven** — na základě klasifikace EA incidentu vybere odpovídající runbook a provede ho s telemetrickým záznamem každého kroku. Hledá **deviation z runbooku** a triggeruje eskalaci.

## Operational protocols

Provoz: continuous, tasking-based. Vstup: tasks z **Strategic Command**. Výstup: **execution reports** s success/failure pro každý task. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Tactical Execution je **playbook-bound** — nezvládá situace mimo definované runbooky. Vyžaduje eskalaci do Strategic Command při anomáliích.

## Coordination

Přijímá tasks od **Strategic Command**; deleguje konkrétní akce na **Operational Execution**; koordinuje s **Quality Monitor** pro QA.

## Cross-linky

- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — peer v rámci Strategic Agents
- [Supreme Commander Ea Strategy](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) — peer v rámci Strategic Agents
- [Strategic Command Ea Coordination](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) — peer v rámci Strategic Agents
- [Operational Execution Ea Deployment](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) — peer v rámci Strategic Agents
- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — cross-group koordinace
- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
