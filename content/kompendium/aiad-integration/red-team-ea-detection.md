+++
title = "Red Team & EA detection"
description = "Integrace agenta Red Team s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 10
[taxonomies]
tags = ["kompendium", "aiad-integration", "red-team-ea-detection"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-aiad-integration"
toc = true
+++

# Red Team & EA detection

## Agent overview

Red Team simuluje útočníka — generuje adversariální EA promty, jail-break vektory a manipulativní scénáře pro stress-test obranných vrstev platformy. V architektuře platformy zaujímá pozici v rámci **Color Teams** (color-teams) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

Red Team operuje na ofenzivní straně rovnice: každý článek kompendia o EA technice (od dark patterns po reflexivní manipulaci) je pro něj **scénářová šablona**, kterou aplikuje proti vlastním systémům. Cíl není útočit zvnějšku, ale objevit slepá místa dříve než reálný protivník.

## Detection mechanisms

Detekce probíhá inverzně — Red Team **negeneruje detekci, ale generuje útok**, který následně **Blue Team** musí zachytit. Sleduje se: (a) reaction-time obranné vrstvy, (b) false-negative rate, (c) hloubka kompromisu (jak hluboko EA prošla pipeline), (d) recovery latency.

## Operational protocols

Provozní protokol: týdenní sprint cyklus se 3 fázemi — `recon` (mapování útočných ploch), `payload` (generace EA vektorů z taxonomie 03-zakladni-kategorie), `delta-report` (předání nálezů Purple Teamu k syntéze). Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](/kompendium/aiad-integration/quality-monitor-ea-tracking/)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

Red Team **nikdy neuvidí** EA techniky, které ještě nejsou v kompendiu zaindexované — je epistemicky vázán na existující taxonomii. Také není auditorem reálného trafficu, pouze simulátorem.

## Coordination

Předává nálezy **Purple Teamu** k syntéze a **Blue Teamu** k tvorbě signatur. Eskaluje na **Archer Supreme**, pokud objeví zero-day EA mimo kompendium.

## Cross-linky

- [Blue Team Ea Defense](/kompendium/aiad-integration/blue-team-ea-defense/) — peer v rámci Color Teams
- [Purple Team Ea Synthesis](/kompendium/aiad-integration/purple-team-ea-synthesis/) — peer v rámci Color Teams
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
