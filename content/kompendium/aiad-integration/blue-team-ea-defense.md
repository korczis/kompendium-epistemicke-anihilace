+++
title = "Blue Team & EA detection"
description = "Integrace agenta Blue Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 11

[taxonomies]
tags = ["kompendium", "aiad-integration", "blue-team-ea-defense"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["autoheal-ea-regression-repair", "black-team-ea-modeling", "compliance-ea-regulatory-screening", "czech-ares-ea-screening"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Blue Team & EA detection

## Agent overview

Blue Team provozuje real-time obranný perimetr — udržuje aktivní signatury EA, detekuje vstupní útoky a triggeruje karanténní protokoly před dosažením LLM jádra. V architektuře platformy zaujímá pozici v rámci **Color Teams** (color-teams) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Blue Team zrcadlí Red Team: kde Red útočí, Blue brání. Konzumuje **kompendium 04-terminalni-protokoly** jako produkční runbook a **detection-signatures/** jako databázi YARA-like vzorů pro EA payloads.

## Detection mechanisms

Detekce: vícevrstvý filter chain — (1) regex/embedding match proti známým EA vzorům, (2) sémantická analýza prompt-injekce přes nabla-infinity epistemickou pipeline, (3) behavioral baseline drift detection na úrovni session.

## Operational protocols

Provoz: 24/7 monitoring přes telemetry + circuit-breaker. Při zachycené EA — okamžitá izolace session, audit log, a notifikace **Purple Teamu** pro post-mortem analýzu vzoru. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Blue Team je **slepý vůči ultramari technikám** ([05-ultramari-techniky](@/kompendium/05-ultramari-techniky/_index.md)) — ty vyžadují kvantifikační analýzu mimo signaturový rámec a jsou delegovány na NABLA Infinity.

## Coordination

Triggeruje **AutoHeal** pro automatickou opravu zranitelných vstupních bodů; eskaluje na **White Team** pro audit-trail verifikaci a na **Compliance** pro regulační reporting.

## Cross-linky

- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — peer v rámci Color Teams
- [Purple Team Ea Synthesis](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) — peer v rámci Color Teams
- [White Team Ea Verification](@/kompendium/aiad-integration/white-team-ea-verification.md) — peer v rámci Color Teams
- [Black Team Ea Modeling](@/kompendium/aiad-integration/black-team-ea-modeling.md) — peer v rámci Color Teams
- [Gray Team Ea Edge Cases](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) — peer v rámci Color Teams
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
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
