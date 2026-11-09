---
id: project.information-architecture
version: 1
kind: rule
title: Informační architektura knihy je vynucená a odvozená
description: Každá stránka má metadata tam, kde je Zola čte, patří do sítě odkazů a nic, co z obsahu plyne, se nepíše ručně.
statement: Udržuj každou stránku v content/ v jednotné informační architektuře – TOML hlavička s title, description a štítky v [taxonomies], oddíl Související, aspoň tři vnitřní odkazy a aspoň jeden příchozí – a ověř ji před každým commitem skriptem scripts/check-ia.py, který smí stav jen zlepšit.
status: active
class: blocking
depends_on: [project.content-linked-and-built@1]
tags: [content, information-architecture, navigation, seo]
---

# Rationale

Kniha má přes 1800 stránek v desítkách sekcí. Čtenář se v ní orientuje jen přes metadata
a odkazy: popis stránky (vyhledávače, náhledy na sociálních sítích, výpisy sekcí), štítky
(související stránky, výpisy štítků), drobečkovou navigaci a síť odkazů (zpětné odkazy, mapa
knihy). Při měření 2026-11-10 bylo 781 popisů mimo rozsah nebo ukrytých pod `[extra]`,
458 stránek bez štítků v `[taxonomies]`, 72 stránek s YAML hlavičkou a 576 stránek, na které
nevedl žádný odkaz. Takové stránky šablony nevidí, i když na disku jsou.

# Required behaviour

Pro každou stránku (`_index.md` sekcí jsou vyňaty z požadavků na štítky, oddíl Související,
odchozí a příchozí odkazy):

| požadavek | co platí |
|---|---|
| `front-matter`, `toml` | hlavička `+++` (TOML), která se načte, s `title` |
| `description` | nejvyšší úroveň hlavičky, 50–200 znaků, česky; ne pod `[extra]` |
| `tags` | aspoň jeden štítek v `[taxonomies]`; ne pod `[extra]` |
| `czech`, `diacritics` | text je česky a s diakritikou (pravidlo `project.content-czech-diacritics`) |
| `related` | oddíl `## Související` |
| `links-out` | aspoň 3 vnitřní odkazy `@/` na existující stránky |
| `not-orphan` | aspoň jedna jiná stránka sem odkazuje |
| `broken-link` | žádný odkaz `@/` na neexistující stránku |

Odvozená data se negenerují ručně: `scripts/build-graph.py` zapisuje
`static/data/graph.json` (stránky a jejich odkazy) a `static/data/metrics.json` (čísla pro
přehledy); šablony a vizualizace čtou jen tato data. `scripts/normalize-front-matter.py`
opraví umístění popisu a štítků a převede YAML na TOML beze změny čehokoli jiného.

# Failure behaviour

`scripts/check-ia.py` skončí kódem 1 při každém porušení, které není v
`scripts/ia-baseline.json`. Základ obsahuje jen stav z doby zavedení pravidla a smí se jen
zmenšovat (`--update-baseline` odmítne cokoli přidat). Commit, který pravidlo poruší, se
opraví dřív, než se sloučí do `main`.

# Verification

```sh
python3 scripts/normalize-front-matter.py --check  # exit 0
python3 scripts/check-ia.py                        # exit 0; vypíše zbývající porušení
python3 scripts/build-graph.py --check             # exit 0
```
