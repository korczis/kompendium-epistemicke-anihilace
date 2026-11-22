{#- The technique page's metadata table, rendered from front matter (duplicate-table, ADR 0013/0016/0017):
    EA kód from [extra]; Kategorie from data/ea-categories.toml keyed by ea_category (the canonical
    chapter-title label, ADR 0017); Subkategorie the plain extra.ea_subcategory, or a display-label
    override from data/ea-subcategories.toml where that subcategory links a glossary term; the page's
    own Riziková úroveň / Reverzibilita from extra.ea_risk_text / ea_reversibility_text.
    The page keeps the header, the separator and the Rodičovská kapitola row; this is one row-block,
    so a table reads exactly as before. scripts/extract-metadata-table.py made the move and proved
    every page expands back byte for byte (the Kategorie cell to its canonical label). -#}
{%- set cat = load_data(path="data/ea-categories.toml") -%}
{%- set sub = load_data(path="data/ea-subcategories.toml") -%}
| **EA kód** | `{{ page.extra.ea_code }}` |
| **Kategorie** | {{ cat[page.extra.ea_category] }} |
| **Subkategorie** | {{ sub[page.extra.ea_subcategory] | default(value=page.extra.ea_subcategory) }} |
| **Riziková úroveň** | {{ page.extra.ea_risk_text }} |
| **Reverzibilita** | {{ page.extra.ea_reversibility_text }} |
{#- -#}
