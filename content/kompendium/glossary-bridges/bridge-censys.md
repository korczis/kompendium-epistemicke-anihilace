+++
title = "Bridge: censys"
description = "Glossary bridge — propojeni kompendia s glossary entry censys."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "censys", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-bounded-context", "bridge-c-ptsd", "bridge-clean-run", "bridge-coercive-control"]
parent = "kompendium-glossary-bridges"
glossary_target = "censys"
toc = false
+++

# Bridge — Censys

## Glossary entry

[censys](@/glossary/censys.md) — Censys.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Censys je internet-wide skenovací platforma poskytující kontinuální mapování exponovaných služeb, certifikátů a infrastruktury. V Prismatic OSINT toolboxu je Censys integrován jako adapter pro EASM (External Attack Surface Management), entity enrichment a threat intelligence.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — OSINT adapters**: Censys mezi 128 self-registering tools
- **Sekce 05 — EASM workflow**: Censys + Shodan + [GreyNoise](@/glossary/greynoise.md) integrace
- **Sekce 06 — Certificate transparency**: CT logs jako data source
- **Sekce 07 — Limity**: rate limits, paid tier, ethical use
- **Per-technique články**: Censys query syntax, automation, false positives

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| instance | OSINT adapter | implementace |
| doplňuje | Shodan, GreyNoise | komplementární zdroje |
| zásobuje | EASM, Perimeter | downstream subsystem |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Censys umožňuje pre-attack reconnaissance i defenzivní inventarizaci vlastní attack surface. Filosoficky problematizuje koncept publicity — co je publikováno (TLS certifikát) implicitně je nyní explicitně zranitelné. Eticky: OSINT z Censys je pasivní, ale agregace pasivních dat může produkovat aktivní threat profil.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/censys/](@/glossary/censys.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Censys](@/glossary/censys.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
