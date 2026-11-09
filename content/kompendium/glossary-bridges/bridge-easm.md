+++
title = "Bridge: easm"
description = "Glossary bridge — propojeni kompendia s glossary entry easm."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "easm", "cross-link"]
categories = ["academic", "reference"]
[extra]
related_terms = ["bridge-disociace", "bridge-dual-use-poznani", "bridge-embodied-cognition", "bridge-entity-resolution"]
parent = "kompendium-glossary-bridges"
glossary_target = "easm"
toc = false
+++

# Bridge — EASM (External Attack Surface Management)

## Glossary entry

[easm](@/glossary/easm.md) — EASM (External Attack Surface Management).

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

External Attack Surface Management (EASM) je doména kybernetické bezpečnosti zaměřená na kontinuální discovery, inventory a monitoring exponovaných digitálních aktiv organizace z perspektivy externího útočníka. Protichůdně k internímu vulnerability managementu (assumes known assets) EASM předpokládá, že útočník má lepší přehled než defendant.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — Security operations**: EASM jako proaktivní defensive layer
- **Sekce 05 — Prismatic Perimeter**: implementační příklad EASM v platformě
- **Sekce 06 — Asset discovery**: Censys, Shodan, GreyNoise integrace
- **Sekce 07 — Risk scoring**: CVSS + business context
- **Per-technique články**: EASM workflow, false positive management

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| doména | Cybersecurity | kategorie |
| využívá | Censys, Shodan, certificate transparency | data sources |
| integruje | Vulnerability management | downstream |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

EASM operacionalizuje princip 'attacker's view': defendant musí vidět svojí infrastrukturu očima protivníka. Filosoficky reflektuje epistemic asymmetry — defendant má insider knowledge ale outsider blind spots. Klinicky umožňuje katching shadow IT, deprecated služby, certificate sprawl před tím, než to udělá útočník.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/easm/](@/glossary/easm.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/kompendium-epistemicke-anihilace)** | [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)
