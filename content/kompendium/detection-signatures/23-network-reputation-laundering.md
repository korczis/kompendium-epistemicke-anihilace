+++
title = "Detekční signatura: Reputation laundering"
description = "EA detekční signatura — reputation laundering."
weight = 23
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Postupná legitimizace pochybného zdroje, narativu nebo aktéra — postupné přijímání do mainstream platforem, citace renomovanými outlety, akademické přijetí — bez vyřešení původních epistemic deficits.

## Co indikuje

**Trust transfer attack**. Cíl: dosáhnout, aby pochybný claim/aktér získal halo effect z důvěryhodných zdrojů.

## Detekční kritéria

1. Aktér posuzný na fringe platforms migruje na mainstream během < 12 měsíců
2. Mainstream uvedení nezahrnují substantial fact-check
3. Citace v akademii rostou, ale primary source quality klesá
4. Halo effect: aktér je citován jako »expert« mimo svou kvalifikaci

## False positive analýza

Skutečné expertise cestuje od fringe k mainstream legitimně. Klíčové odlišení: **kvalita primárních důkazů**.

## Validační test

Reputation audit: Sledujte primary source quality trajectory. Pokud klesá s rostoucí mainstream adoption → signál.

## Doporučená akce

Nasaďte **Source-level epistemic discount**. Komunikujte fact-checkerům, akademii, platformám.

## Cross-linky

- [Monokultura zdrojů](../17-network-source-monoculture/)
- [Cirkularita citací](../18-network-citation-circularity/)
- [Asymetrie amplifikace](../19-network-amplification-asymmetry/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
