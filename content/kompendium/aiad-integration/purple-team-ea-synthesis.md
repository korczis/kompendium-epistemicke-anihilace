+++
title = "Purple Team & EA detection"
description = "Integrace agenta Purple Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 12
[taxonomies]
tags = ["kompendium", "aiad-integration", "purple-team-ea-synthesis"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["osint-ea-source-validation", "perimeter-ea-attack-surface", "qeve-ea-quality-validation", "quality-monitor-ea-tracking"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Purple Team & EA detection

## Agent overview

Purple Team syntetizuje výstupy Red a Blue Teamů — extrahuje vzory útok-obrana, generuje nové detekční pravidla a uzavírá smyčku zpětné vazby do AutoEvolve. V architektuře platformy zaujímá pozici v rámci **Color Teams** (color-teams) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Purple Team je epistemickým mostem mezi ofenzí a obranou: čte **case-studies/** pro historický kontext a produkuje **detection-signatures/** pro budoucí zachycení. Zaměřuje se na **vzájemně se posilující kombinace EA technik**, které jednotlivé týmy přehlédnou.

## Detection mechanisms

Detekce: meta-analýza — koreluje Red útoky × Blue zachycení matice, identifikuje **non-obvious gaps** (kombinace, které prošly), a generuje hypotézy pro nové detekční signatury.

## Operational protocols

Provoz: bi-weekly retrospective + průběžný stream telemetrie. Výstupem je **Pull Request do detection-signatures/** s testovacími fixturami a confidence scorem. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Purple Team je závislý na kvalitě dat z Red i Blue — pokud je některý tým podvyživený, syntéza zdegeneruje na vágní generalizace.

## Coordination

Konzumuje výstupy **Red Teamu** a **Blue Teamu**; produkuje pravidla pro **AutoEvolve**; auditováno **White Teamem**.

## Cross-linky

- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — peer v rámci Color Teams
- [Blue Team Ea Defense](@/kompendium/aiad-integration/blue-team-ea-defense.md) — peer v rámci Color Teams
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
