+++
title = "Supreme Commander & EA detection"
description = "Integrace agenta Supreme Commander s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 17
[taxonomies]
tags = ["kompendium", "aiad-integration", "supreme-commander-ea-strategy"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["red-team-ea-detection", "strategic-command-ea-coordination", "tactical-execution-ea-operations", "trinity-gate-ea-verification"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Supreme Commander & EA detection

## Agent overview

Supreme Commander definuje dlouhodobou EA strategii platformy — alokuje rozpočty, schvaluje nové detekční vrstvy a stanovuje risk appetite napříč doménami. V architektuře platformy zaujímá pozici v rámci **Strategic Agents** (strategic) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Supreme Commander **nečte kompendium pro detekci** — čte ho pro **strategické plánování**: které kategorie EA jsou pro Prismatic prioritní, kam investovat detekční kapacitu, kde tolerovat reziduální riziko.

## Detection mechanisms

Detekce: na meta-úrovni — sleduje **KPIs portfolia obranných opatření** (coverage, MTTR, false-positive rate) a alokuje pozornost tam, kde je marginal return nejvyšší.

## Operational protocols

Provoz: čtvrtletní strategy review + roční roadmapa. Výstup: **strategic intent dokument** s prioritizovanými investicemi a měřitelnými cíli. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Supreme Commander je **odtržen od konkrétních útoků** — pracuje s agregáty. Není vhodný pro tactical decisions ani urgent response.

## Coordination

Nadřazen **Archer Supreme** v non-incident kontextu; deleguje exekuci na **Strategic Command** a **Tactical Execution**.

## Cross-linky

- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — peer v rámci Strategic Agents
- [Strategic Command Ea Coordination](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) — peer v rámci Strategic Agents
- [Tactical Execution Ea Operations](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) — peer v rámci Strategic Agents
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

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
