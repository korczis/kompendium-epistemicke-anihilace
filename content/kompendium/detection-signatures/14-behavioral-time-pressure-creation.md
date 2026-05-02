+++
title = "Detekční signatura: Vytváření časového tlaku"
description = "EA detekční signatura — vytváření časového tlaku."
weight = 14
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "behavioral"]
categories = ["academic", "clinical", "security"]
[extra]
parent = "kompendium-detection-signatures"
toc = true
modality = "behavioral"
+++

## Definice signatury

Umělé generování naléhavosti — »rozhodnout musíš teď«, »tahle příležitost zítra zmizí«, »jiný kandidát čeká«, »pokud teď neuvěříš, ztratíš šanci«.

## Co indikuje

**Cognitive load attack** — eliminace deliberativní fáze rozhodnutí, vynucení reakce na System-1 (Kahneman). Klasická prodejní + kultovní + scammer technika.

## Detekční kritéria

1. Deadline tvrzení bez ověřitelného externího kotvení
2. »Jiní zájemci« bez doložitelné existence
3. Eskalace tlaku při kladení otázky o ověření
4. Reaktivace tlaku po každém pokusu o klid (»pokud váháš, je to jasná zpráva«)

## False positive analýza

Některé deadlines jsou skutečné (sleva do půlnoci, právní lhůty). Klíčové odlišení: **ověřitelnost externí kotvy**.

## Validační test

Externí ověření: Vyžádejte si zdroj deadlinu (URL, dokument, kontakt). Pokud nedostupný → signál.

## Doporučená akce

Nasaďte **Decelerační protokol**: »Vrátím se zítra s odpovědí«. Pokud agresor reaguje eskalací → potvrzení EA.

## Cross-linky

- [Akcelerace izolace](../13-behavioral-isolation-acceleration/)
- [Emocionální modulace](../16-behavioral-emotional-modulation/)
- [Nepřiměřená sebejistota](../9-behavioral-disproportionate-confidence/)
- [Emocionální otupení](../27-phenomenological-emotional-numbing/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
