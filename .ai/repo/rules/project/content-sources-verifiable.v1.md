---
id: project.content-sources-verifiable
version: 1
kind: rule
title: Zdroje, zákony a fakta jsou ověřitelné
description: Kniha necituje nic, co neexistuje, a neuvádí čísla, paragrafy ani historická fakta, která nejsou jistá.
statement: Cituj jen literaturu, předpisy a události, o jejichž existenci a obsahu není pochyb, a kde jistota chybí, popiš myšlenku bez citace místo vymyšleného zdroje.
status: active
class: blocking
depends_on: [project.content-defensive-frame@1]
tags: [content, sources, accuracy]
---

# Rationale

Odborný čtenář kontroluje zdroje. Jediná vymyšlená citace, statistika nebo číslo paragrafu
zpochybní celou knihu. Generovaný text má sklon zdroje dotvářet; proto je pravidlo blokující.

# Required behaviour

- Literatura: autor, rok a název jen u děl, o kterých je jisté, že existují a říkají to, co
  jim text připisuje (např. Lifton 1961, Herman 1992, Stark 2007, Fricker 2007, Freyd 1996).
- Právo: číslo zákona nebo paragrafu jen tam, kde je jisté; jinak obecný popis institutu.
- Statistiky a čísla jen se zdrojem; odhad je označen jako odhad.
- Historické případy: jen dobře doložená fakta; interpretace je označena jako interpretace.
- Odkazy na literaturu, které stránky skutečně cituje, shromažďuje generovaný
  `content/references.md` (`scripts/build-references.py`).

# Failure behaviour

Nejistý nebo neověřitelný údaj se odstraní nebo přeformuluje bez citace; vymyšlený zdroj je
blokující nález.

# Verification

Recenzent ověří každou nově přidanou citaci, předpis a datum; u vln generovaných agenty
uvádí každý agent v hlášení, co vynechal pro nejistotu.
