+++
title = "Black Team & EA detection"
description = "Integrace agenta Black Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 14

[taxonomies]
tags = ["kompendium", "aiad-integration", "black-team-ea-modeling"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["autoevolve-ea-pattern-evolution", "autoheal-ea-regression-repair", "blue-team-ea-defense", "compliance-ea-regulatory-screening"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Black Team & EA detection

## Agent overview

[Black Team](@/glossary/black-team.md) provádí hloubkové threat modeling — buduje profily protivníků, kalibruje motivace, a predikuje budoucí EA vektory mimo aktuální kompendium. V architektuře platformy zaujímá pozici v rámci **Color Teams** (color-teams) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Black Team se zaměřuje na **prediktivní rovinu**: zatímco [Red Team](@/glossary/red-team.md) simuluje známé útoky, Black Team modeluje **neznámé budoucí útočníky** — jejich kapacity, prostředky, motivace. Konzumuje **07-teoreticke-reflexe/** a externí threat-intel feedy.

## Detection mechanisms

Detekce: forward-looking — generuje **threat hypotheses** s pravděpodobnostními váhami, ne hard signatures. Používá **Bayesian belief networks** pro kombinaci slabých signálů (geopolitika, dark-web chatter, akademické publikace) do koherentních scénářů.

## Operational protocols

Provoz: čtvrtletní threat assessment + reactive briefings při major events. Výstup: TTPs (Tactics, Techniques, Procedures) v MITRE ATT&CK kompatibilním formátu rozšířeném o EA dimenze. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Black Team produkuje **hypotézy s nízkou jistotou** — vyžaduje lidský review před aktivací protiopatření. Není určen pro real-time obranu.

## Coordination

Krmí **Red Team** novými útočnými scénáři; informuje **[Strategic Command](@/glossary/strategic-command.md)** pro priority allocation; spolupracuje s **OSINT Agent** pro signal collection.

## Cross-linky

- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — peer v rámci Color Teams
- [Blue Team Ea Defense](@/kompendium/aiad-integration/blue-team-ea-defense.md) — peer v rámci Color Teams
- [Purple Team Ea Synthesis](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) — peer v rámci Color Teams
- [White Team Ea Verification](@/kompendium/aiad-integration/white-team-ea-verification.md) — peer v rámci Color Teams
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
