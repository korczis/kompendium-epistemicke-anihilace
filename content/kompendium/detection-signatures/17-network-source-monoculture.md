+++
title = "Detekční signatura: Monokultura zdrojů"
description = "EA detekční signatura — monokultura zdrojů."
weight = 17
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
related_terms = ["15-behavioral-asymmetric-disclosure", "16-behavioral-emotional-modulation", "18-network-citation-circularity", "19-network-amplification-asymmetry"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Cílové populace přijímá informace převážně z jednoho zdroje nebo z malé skupiny vzájemně prolinkovaných zdrojů — chybí diverzita epistemic sources.

## Co indikuje

**Echo chamber** + zranitelnost vůči narativní injection. Když všechny zdroje patří do téže koalice, falsifikace je strukturálně nemožná.

## Detekční kritéria

1. Source-diversity-index < 0.3 (Shannon entropy zdrojů)
2. Top-3 zdroje pokrývají > 70 % konzumovaného obsahu
3. Mezi zdroji existují vlastnické nebo personální propojení
4. Cross-citation v rámci kohorty > 60 %, mimo kohortu < 5 %

## False positive analýza

Specializace (např. odborný software) přirozeně koncentruje zdroje. Klíčové odlišení: **téma** (politika, medicína vs. niche).

## Validační test

Source mapping: Vykreslete síťový graf zdrojů + jejich propojení. Hledejte cluster bez přemostění.

## Doporučená akce

Nasaďte **Diverzifikační protokol**. Doporučte 3+ ortogonální zdroje. Sledujte, zda se konzum mění.

## Cross-linky

- [Cirkularita citací](../18-network-citation-circularity/)
- [Asymetrie amplifikace](../19-network-amplification-asymmetry/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Reputation laundering](../23-network-reputation-laundering/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
