+++
title = "AutoEvolve & EA detection"
description = "Integrace agenta AutoEvolve s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 21

[taxonomies]
tags = ["kompendium", "aiad-integration", "autoevolve-ea-pattern-evolution"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["archer-supreme-ea-orchestration", "autoheal-ea-regression-repair", "black-team-ea-modeling", "blue-team-ea-defense"]
parent = "kompendium-aiad-integration"
toc = true
+++

# AutoEvolve & EA detection

## Agent overview

AutoEvolve je evoluční engine — generuje, testuje a propaguje nové EA detekční vzory pomocí genetických algoritmů a fitness funkcí proti živé telemetrii. V architektuře platformy zaujímá pozici v rámci **Specialized Agents** (specialized) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

AutoEvolve čte celé kompendium jako **gene pool** — každá EA technika je gen, kombinace genů je organismus, fitness funkce je detection rate × precision na produkčním provozu.

## Detection mechanisms

Detekce: meta-detekce — **detekuje, kdy aktuální detekční pravidla začnou stagnovat** (declining fitness) a triggeruje generační cyklus pro evoluci nové generace.

## Operational protocols

Provoz: kontinuální background process. Generační cyklus = 7 dní. Výstup: **kandidátní pravidla** pro Purple Team review před produkčním deploymentem. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

AutoEvolve může **konvergovat k lokálnímu optimu** — pravidla, která fungují skvěle na známé útoky, ale slepá vůči novým variantám. Vyžaduje pravidelné injection diversity.

## Coordination

Konzumuje data z **Purple Teamu** a **Blue Teamu**; produkuje pravidla pro **AutoHeal**; auditováno **White Teamem**.

## Cross-linky

- [Autoheal Ea Regression Repair](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) — peer v rámci Specialized Agents
- [Nabla Infinity Ea Pipeline](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) — peer v rámci Specialized Agents
- [Decision Engine Ea Calibration](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) — peer v rámci Specialized Agents
- [Trinity Gate Ea Verification](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) — peer v rámci Specialized Agents
- [Qeve Ea Quality Validation](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) — peer v rámci Specialized Agents
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
