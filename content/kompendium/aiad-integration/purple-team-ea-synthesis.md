+++
title = "Purple Team & EA detection"
description = "Integrace agenta Purple Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 12
[taxonomies]
tags = ["kompendium", "aiad-integration", "purple-team-ea-synthesis"]
categories = ["academic", "platform-integration"]
[extra]
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

Provoz: bi-weekly retrospective + průběžný stream telemetrie. Výstupem je **Pull Request do detection-signatures/** s testovacími fixturami a confidence scorem. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Purple Team je závislý na kvalitě dat z Red i Blue — pokud je některý tým podvyživený, syntéza zdegeneruje na vágní generalizace.

## Coordination

Konzumuje výstupy **Red Teamu** a **Blue Teamu**; produkuje pravidla pro **AutoEvolve**; auditováno **White Teamem**.

## Cross-linky

- [Red Team Ea Detection](/kompendium/aiad-integration/red-team-ea-detection/) — peer v rámci Color Teams
- [Blue Team Ea Defense](/kompendium/aiad-integration/blue-team-ea-defense/) — peer v rámci Color Teams
- [White Team Ea Verification](/kompendium/aiad-integration/white-team-ea-verification/) — peer v rámci Color Teams
- [Black Team Ea Modeling](/kompendium/aiad-integration/black-team-ea-modeling/) — peer v rámci Color Teams
- [Gray Team Ea Edge Cases](/kompendium/aiad-integration/gray-team-ea-edge-cases/) — peer v rámci Color Teams
- [Archer Supreme Ea Orchestration](/kompendium/aiad-integration/archer-supreme-ea-orchestration/) — cross-group koordinace
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
