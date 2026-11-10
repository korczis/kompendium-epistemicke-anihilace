+++
title = "Perimeter Agent & EA detection"
description = "Integrace agenta Perimeter Agent s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 33

[taxonomies]
tags = ["kompendium", "aiad-integration", "perimeter-ea-attack-surface"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["operational-execution-ea-deployment", "osint-ea-source-validation", "purple-team-ea-synthesis", "qeve-ea-quality-validation"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Perimeter Agent & EA detection

## Agent overview

Perimeter Agent provozuje External Attack Surface Management — mapuje exposed assets, detekuje shadow IT a koreluje vulnerability data s EA scénáři proti organizaci. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Perimeter Agent integruje **05-ultramari-techniky** EA s konvenční cybersecurity — útoky, kde je **technická exploitace** kombinována s **psychologickou manipulací** (např. spear-phishing s deepfake).

## Detection mechanisms

Detekce: **asset-aware threat modeling** — pro každý asset (doména, IP, certifikát, leak) hodnotí **kombinovanou hrozbu** (CVE × EA exposure × business criticality).

## Operational protocols

Provoz: kontinuální scanning + on-demand investigations. Výstup: **attack surface map** s prioritizovanými remediations. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Perimeter Agent vidí **externí povrch** — interní hrozby (insider EA) jsou mimo jeho scope. Také závislý na úplnosti asset inventory.

## Coordination

Krmí data **Hawkeye** pro traffic kontext; spolupracuje s **Black Team** na threat modeling; výstupy konzumuje **Strategic Command** pro investice.

## Cross-linky

- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — peer v rámci Domain Agents
- [Osint Ea Source Validation](@/kompendium/aiad-integration/osint-ea-source-validation.md) — peer v rámci Domain Agents
- [Dd Engine Ea Source Weighting](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) — peer v rámci Domain Agents
- [Hawkeye Ea Visitor Intelligence](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) — peer v rámci Domain Agents
- [Compliance Ea Regulatory Screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) — peer v rámci Domain Agents
- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — cross-group koordinace
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
