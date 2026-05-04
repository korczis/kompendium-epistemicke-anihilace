+++
title = "Detekční signatura: Cirkularita citací"
description = "EA detekční signatura — cirkularita citací."
weight = 18
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
related_terms = ["16-behavioral-emotional-modulation", "17-network-source-monoculture", "19-network-amplification-asymmetry", "2-linguistic-circular-definitions"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Síť zdrojů, kde A cituje B, B cituje C, C cituje A — bez externího kotvení v primárních datech, peer-reviewed studiích nebo nezávislé verifikaci.

## Co indikuje

**Pseudoautoritativnost** — vrstvenými citacemi vzniká dojem širokého konsensu, kde je ve skutečnosti jen 1 zdrojový claim.

## Detekční kritéria

1. Orientovaný cyklus délky < 4 v citation grafu
2. Žádný uzel cyklu necituje primární data nebo peer-reviewed zdroj
3. Externí citace cyklu (z renomovaných zdrojů) < 2 %
4. Top-cited claim v cyklu nemá dohledatelný primární zdroj

## False positive analýza

V mladých vědeckých polích se citační síť přirozeně koncentruje. Klíčové odlišení: **reach do primárních dat**.

## Validační test

Citation audit: Sledujte citation chain do primárního zdroje. Pokud chybí nebo je cyklický → signál.

## Doporučená akce

Nasaďte **Citation forensics**. Vyžadujte peer-reviewed primární zdroj nebo dokumentaci.

## Cross-linky

- [Monokultura zdrojů](../17-network-source-monoculture/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Reputation laundering](../23-network-reputation-laundering/)
- [Cirkulární definice](../2-linguistic-circular-definitions/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
