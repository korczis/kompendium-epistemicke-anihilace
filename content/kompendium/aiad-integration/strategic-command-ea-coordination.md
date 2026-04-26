+++
title = "Strategic Command & EA detection"
description = "Integrace agenta Strategic Command s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 18
[taxonomies]
tags = ["kompendium", "aiad-integration", "strategic-command-ea-coordination"]
categories = ["academic", "platform-integration"]
[extra]
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

Provoz: měsíční ops review + týdenní stand-up. Výstup: **operational plan** s task graphem, milestones a contingency triggery. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Strategic Command **necítí terén** — pracuje s mapou, nikoli teritoriem. Pokud terénní data zaostávají, plány se rozjedou s realitou.

## Coordination

Přijímá záměr od **Supreme Commander**; deleguje na **Tactical Execution**; koordinuje s **Operational Execution** pro deployment.

## Cross-linky

- [Archer Supreme Ea Orchestration](/kompendium/aiad-integration/archer-supreme-ea-orchestration/) — peer v rámci Strategic Agents
- [Supreme Commander Ea Strategy](/kompendium/aiad-integration/supreme-commander-ea-strategy/) — peer v rámci Strategic Agents
- [Tactical Execution Ea Operations](/kompendium/aiad-integration/tactical-execution-ea-operations/) — peer v rámci Strategic Agents
- [Operational Execution Ea Deployment](/kompendium/aiad-integration/operational-execution-ea-deployment/) — peer v rámci Strategic Agents
- [Red Team Ea Detection](/kompendium/aiad-integration/red-team-ea-detection/) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](/kompendium/aiad-integration/autoevolve-ea-pattern-evolution/) — cross-group koordinace
- [Czech Ares Ea Screening](/kompendium/aiad-integration/czech-ares-ea-screening/) — cross-group koordinace
- [základní kategorie EA](/kompendium/03-zakladni-kategorie/) — EA taxonomie
- [terminální protokoly](/kompendium/04-terminalni-protokoly/) — EA taxonomie
- [ultramari techniky](/kompendium/05-ultramari-techniky/) — EA taxonomie
- [agent-tier](/glossary/agent-tier) — platform glossary
- [color-teams](/glossary/color-teams) — platform glossary
- [archer-supreme glossary](/glossary/archer-supreme) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
