+++
title = "Archer Supreme & EA detection"
description = "Integrace agenta Archer Supreme s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 16
[taxonomies]
tags = ["kompendium", "aiad-integration", "archer-supreme-ea-orchestration"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-aiad-integration"
toc = true
+++

# Archer Supreme & EA detection

## Agent overview

Archer Supreme je nejvyšší autoritou platformy — orchestruje multi-tým odpověď na kritické EA incidenty s pravomocí přebít individuální agentní rozhodnutí. V architektuře platformy zaujímá pozici v rámci **Strategic Agents** (strategic) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Archer Supreme je aktivován pouze při **terminálních protokolech** ([04-terminalni-protokoly/](/kompendium/04-terminalni-protokoly/)) — situace, kde EA prošla individuální obrany a vyžaduje **cross-team koordinaci** s exekutivní pravomocí.

## Detection mechanisms

Detekce: agreguje signály ze všech ostatních agentů a vyhodnocuje **escalation criteria** (počet zasažených systémů, regulační dopad, reputační riziko). Triggeruje při překročení tří současných red-flagů.

## Operational protocols

Provoz: na vyžádání. Vstup: incident manifest. Výstup: **operation order** s rozdělením úkolů, deadlines, success criteria. Archer Supreme **nepíše kód**, ale rozděluje práci. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Archer Supreme je **drahý zdroj** — nelze ho použít na rutinní operace. Také závisí na kvalitě vstupních signálů; garbage in = garbage out na strategické úrovni.

## Coordination

Nadřazen všem ostatním agentům v incident kontextu; spolupracuje s **Supreme Commander** na strategickém plánování a **Strategic Command** na taktickém rozdělení.

## Cross-linky

- [Supreme Commander Ea Strategy](/kompendium/aiad-integration/supreme-commander-ea-strategy/) — peer v rámci Strategic Agents
- [Strategic Command Ea Coordination](/kompendium/aiad-integration/strategic-command-ea-coordination/) — peer v rámci Strategic Agents
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
