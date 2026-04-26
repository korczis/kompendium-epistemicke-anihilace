+++
title = "Epistemic Pipeline & EA detection"
description = "Integrace agenta Epistemic Pipeline s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 27
[taxonomies]
tags = ["kompendium", "aiad-integration", "epistemic-pipeline-ea-detection"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-aiad-integration"
toc = true
+++

# Epistemic Pipeline & EA detection

## Agent overview

Epistemic Pipeline je 14-stage analyzátor epistemické integrity každého výroku — od claim extrakce přes source weighting po contradiction detection a confidence kalibraci. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Epistemic Pipeline implementuje 14 axiomů z [07-teoreticke-reflexe/](/kompendium/07-teoreticke-reflexe/) jako sekvenční stages. Používán pro **deep analysis** podezřelých výroků flaggovaných výše.

## Detection mechanisms

Detekce: **claim-level granularita** — každý jednotlivý výrok prochází 14 stages (extract, normalize, weight, cross-reference, contradiction-check, ...) s aggregovaným epistemic-integrity skóre.

## Operational protocols

Provoz: on-demand pro flaggované výroky (ne pro všechny — drahý). Latency: 1-5s per claim. Výstup: **epistemic envelope** s per-stage scores a final verdict. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Epistemic Pipeline je **náročný** (~14× normální cost) — nelze použít na masový traffic. Také trpí **citation-availability bias** — kvalita závisí na dostupnosti zdrojů.

## Coordination

Volán **NABLA Infinity** pro hlubší analýzu; používán **DD Engine** pro investigation reports; výstupy konzumuje **Decision Engine**.

## Cross-linky

- [Autoevolve Ea Pattern Evolution](/kompendium/aiad-integration/autoevolve-ea-pattern-evolution/) — peer v rámci Specialized Agents
- [Autoheal Ea Regression Repair](/kompendium/aiad-integration/autoheal-ea-regression-repair/) — peer v rámci Specialized Agents
- [Nabla Infinity Ea Pipeline](/kompendium/aiad-integration/nabla-infinity-ea-pipeline/) — peer v rámci Specialized Agents
- [Decision Engine Ea Calibration](/kompendium/aiad-integration/decision-engine-ea-calibration/) — peer v rámci Specialized Agents
- [Trinity Gate Ea Verification](/kompendium/aiad-integration/trinity-gate-ea-verification/) — peer v rámci Specialized Agents
- [Red Team Ea Detection](/kompendium/aiad-integration/red-team-ea-detection/) — cross-group koordinace
- [Archer Supreme Ea Orchestration](/kompendium/aiad-integration/archer-supreme-ea-orchestration/) — cross-group koordinace
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
