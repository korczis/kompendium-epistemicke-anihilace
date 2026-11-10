---
id: project.content-academic-style
version: 1
kind: rule
title: Každá stránka je akademický text, každý bod odstavec s citací
description: Stránky knihy jsou psané odborným akademickým stylem v souvislých odstavcích; každý odstavec nese citaci a každý citovaný autor je v oddílu Literatura.
statement: Piš každou stránku v content/ akademickým stylem v souvislých odstavcích místo odrážek, opatři každý odstavec aspoň jednou citací autor–rok ověřitelného zdroje, uveď každé citované dílo v oddílu Literatura a rozviň stránku nejméně na 600 slov podstaty, obvykle 900–1600.
status: active
class: blocking
depends_on: [project.content-sources-verifiable@1, project.content-linked-and-built@1, project.content-no-placeholders@1]
tags: [content, style, sources, academic]
---

# Rationale

Kniha je určena psychiatrům, psychologům, vyšetřovatelům, právníkům a výzkumníkům. Tito
čtenáři posuzují text podle toho, zda každé tvrzení stojí na doložitelném zdroji a zda je
vyložené v souvislostech. Odrážka umí tvrzení jen vyjmenovat: chybí v ní důvod, vazba na
další tvrzení i zdroj, a v generovaném textu je odrážkový seznam nejčastějším tvarem vaty.
Odstavec s citací nutí autora tvrzení zdůvodnit a zdroj ověřit. Měření 2026-11-10 ukázalo,
že standard nesplňovala žádná z 1842 stránek: 1816 obsahovalo odrážky mimo seznam literatury,
1706 odstavce bez citace a 1811 nemělo oddíl Literatura.

# Required behaviour

| požadavek `check-ia.py` | co platí |
|---|---|
| `thin` | aspoň 600 slov textu; rozvíjená stránka 900–1600 slov podstaty, bez vaty |
| `bullets` | žádné odrážky ani číslované seznamy mimo oddíly `## Související` a `## Literatura` (a `Prameny`, `Reference`): každý bod je odstavec |
| `citations` | každý odstavec o 20 a více slovech nese citaci autor–rok: `(Lifton, 1961)`, `(Herman, 1992; Freyd, 1996)`, `Weber (1922) ukazuje`, `(Conger a Kanungo, 1987)`, nebo předpis `zákon č. 40/2009 Sb.` |
| `bibliography` | oddíl `## Literatura` s plnými záznamy „Příjmení, I. (rok). *Název*. Vydavatel.“ |
| `citation-unresolved` | první příjmení každé citace se vyskytuje v oddílu Literatura téže stránky |

Dále, kontrolou recenzenta:

- Odborný registr ve spisovné češtině (pravidlo `project.content-czech-diacritics`): třetí
  osoba, přesná terminologie, žádná hovorovost, žádná reklamní ani manažerská rétorika.
- Struktura podle druhu stránky (heslo, technika, protokol, kapitola, most) je popsaná ve
  skillu `kompendium-page-expansion`; vzorem je `content/glossary/charisma.md`.
- Každé dílo v Literatuře je v textu citované a každá citace odpovídá tomu, co dílo říká
  (pravidlo `project.content-sources-verifiable`). Kontrola ověřuje formu, recenzent obsah.
- Tabulky jsou přípustné tam, kde srovnávají; nenahrazují výklad v odstavcích.
- Rejstříky (`08-prilohy/rejstrik-*`) jsou z povahy tabulkové; úvod rejstříku je přesto
  akademický text s citacemi.

# Failure behaviour

Nová stránka nebo nové porušení na existující stránce: `scripts/check-ia.py` skončí kódem 1
a CI commit nepustí do `main`. Stránky, které standard nesplňovaly při zavedení pravidla, jsou
zapsané v `scripts/ia-baseline.json` (`check-ia.py --adopt <požadavek>`, jednorázově při
zavedení); základ se smí jen zmenšovat a každá další vlna obsahu ho zmenšuje, dokud není prázdný.

# Verification

```sh
python3 scripts/check-ia.py --page <cesta>   # "<cesta>: ok" pro každou novou/změněnou stránku
python3 scripts/check-ia.py                  # exit 0: žádné nové porušení
bash test/run.sh 02                          # brána odmítne odrážky a necitovaný odstavec
```
