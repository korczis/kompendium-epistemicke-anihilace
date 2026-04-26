+++
title = "Operational Execution & EA detection"
description = "Integrace agenta Operational Execution s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 20
[taxonomies]
tags = ["kompendium", "aiad-integration", "operational-execution-ea-deployment"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-aiad-integration"
toc = true
+++

# Operational Execution & EA detection

## Agent overview

Operational Execution je polní exekutiva — nasazuje detekční pravidla do produkce, restartuje služby, rotuje klíče a provádí immediate-response akce. V architektuře platformy zaujímá pozici v rámci **Strategic Agents** (strategic) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Operational Execution operuje na **minutové až hodinové škále** — nejnižší vrstva v command hierarchii. Konzumuje **quick-reference/** pro rychlou orientaci a **historical-cases/** pro precedenty.

## Detection mechanisms

Detekce: minimální — **execution-only**. Sleduje pouze **success/failure každé operace** a hlásí výsledky nahoru. Detekce je responsibility vyšších vrstev.

## Operational protocols

Provoz: 24/7 on-call. Vstup: konkrétní příkazy. Výstup: **deployment logs** s before/after snapshoty a rollback triggery. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Operational Execution **nezná kontext** — vykonává příkazy, neptá se. Špatný příkaz se provede stejně rychle jako dobrý. Vyžaduje robustní validaci výše.

## Coordination

Přijímá rozkazy od **Tactical Execution**; spolupracuje s **AutoHeal** pro self-repair; logy konzumuje **Quality Monitor**.

## Cross-linky

- [Archer Supreme Ea Orchestration](/kompendium/aiad-integration/archer-supreme-ea-orchestration/) — peer v rámci Strategic Agents
- [Supreme Commander Ea Strategy](/kompendium/aiad-integration/supreme-commander-ea-strategy/) — peer v rámci Strategic Agents
- [Strategic Command Ea Coordination](/kompendium/aiad-integration/strategic-command-ea-coordination/) — peer v rámci Strategic Agents
- [Tactical Execution Ea Operations](/kompendium/aiad-integration/tactical-execution-ea-operations/) — peer v rámci Strategic Agents
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
