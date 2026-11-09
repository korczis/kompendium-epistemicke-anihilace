---
id: project.content-linked-and-built
version: 1
kind: rule
title: Stránky jsou provázané a web se sestaví
description: Každá stránka odkazuje na související stránky existujícími odkazy @/ a celý web projde zola build a polish-markdown --check.
statement: Propoj každou stránku s jejími souvisejícími stránkami vnitřními odkazy @/ na existující soubory, zakonči ji oddílem Související a před každým commitem ověř, že projde zola build a scripts/polish-markdown.py --check.
status: active
class: blocking
depends_on: [project.content-czech-diacritics@1]
tags: [content, links, build]
---

# Rationale

Kniha je síť pojmů: technika odkazuje na heslo glosáře, kazuistika na techniky a protokoly,
protokol na obranu a zotavení. Stránka bez odkazů je slepá ulička. Zola ohlásí každý
nefunkční odkaz `@/` jako chybu sestavení, takže sestavení je zároveň kontrola odkazů.

# Required behaviour

- První zmínka pojmu, který má vlastní stránku, je odkaz `[text](@/cesta.md)`.
- Stránka končí oddílem `## Související` s 6–12 vybranými odkazy seskupenými podle druhu,
  každý s krátkým důvodem.
- Odkazuje se jen na existující soubory; nikdy na vymyšlenou cestu.
- Typografie a struktura Markdownu odpovídají `scripts/polish-markdown.py` (idempotentní).
- Odvozené odkazy (zpětné odkazy, předchozí/další, související podle štítků) dodává šablona;
  ruční odkazy je nenahrazují.

# Failure behaviour

Commit, po kterém `zola build` selže nebo `polish-markdown.py --check` hlásí změny, se opraví
novým commitem dřív, než se sloučí do `main`.

# Verification

```sh
zola build --force -o "$TMPDIR/kea-out"   # vypíše Done; nefunkční @/ odkaz je chyba
python3 scripts/polish-markdown.py --check # exit 0
```
