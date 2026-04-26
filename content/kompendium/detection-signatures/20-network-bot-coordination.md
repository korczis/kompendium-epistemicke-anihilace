+++
title = "Detekční signatura: Bot coordination"
description = "EA detekční signatura — bot coordination."
weight = 20
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Detekovatelná koordinace mezi automatizovanými nebo polo-automatizovanými účty — synchronní sharing, identický wording, geografická distribuce, časové vzorce.

## Co indikuje

**Influence operation infrastructure**. Cíl: simulovat spontánní popularitu a pohyb veřejného mínění.

## Detekční kritéria

1. 3+ účty postují identický nebo near-identical text v okně < 5 minut
2. Bio similarity > 0.7 mezi účty (template-based generation)
3. Account age < 90 dní u > 50 % amplifikujících účtů
4. Posting cadence příliš pravidelná (Poisson likelihood test fails)

## False positive analýza

Legitimní synchronizovaný sharing: oficiální kampaně (politici, brands), sportovní eventy. Klíčové: **deklarovanost** sponzorství.

## Validační test

Botometer + Hoaxy + Indiana University tooling. Network analysis (Gephi, igraph).

## Doporučená akce

Nasaďte **Coordinated behavior report**. Platformní eskalace. Diluce signálu.

## Cross-linky

- [Asymetrie amplifikace](../19-network-amplification-asymmetry/)
- [Platformní koordinace](../21-network-platform-coordination/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Reputation laundering](../23-network-reputation-laundering/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](/developers/) | [Glossary](/glossary/) | [Kompendium](/kompendium/)*
