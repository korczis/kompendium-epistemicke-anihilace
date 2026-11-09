+++
title = "Strategic Command & EA detection"
description = "Integrace agenta Strategic Command s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 18
[taxonomies]
tags = ["kompendium", "aiad-integration", "strategic-command-ea-coordination"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["quality-monitor-ea-tracking", "red-team-ea-detection", "supreme-commander-ea-strategy", "tactical-execution-ea-operations"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Strategic Command & EA detection

## Agent overview

Strategic Command překládá strategický záměr na taktické plány — koordinuje multi-agentní operace, spravuje závislosti a synchronizuje časování napříč týmy. V architektuře platformy zaujímá pozici v rámci **Strategic Agents** (strategic) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Strategic Command je **planning layer** mezi vrcholovou strategií a polní exekucí. Konzumuje **section-bridges/** a **cross-domain/** pro pochopení provázanosti EA kategorií napříč doménami.

## Detection mechanisms

Detekce: nepřímá — sleduje **drift mezi plánem a realitou** a triggeruje re-planning, když se taktická situace odchýlí od strategického záměru. Pracuje s **Gantt-like dependency grafem** operací.

## Operational protocols

Provoz: měsíční ops review + týdenní stand-up. Výstup: **operational plan** s task graphem, milestones a contingency triggery. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Strategic Command **necítí terén** — pracuje s mapou, nikoli teritoriem. Pokud terénní data zaostávají, plány se rozjedou s realitou.

## Coordination

Přijímá záměr od **Supreme Commander**; deleguje na **Tactical Execution**; koordinuje s **Operational Execution** pro deployment.

## Cross-linky

- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — peer v rámci Strategic Agents
- [Supreme Commander Ea Strategy](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) — peer v rámci Strategic Agents
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
