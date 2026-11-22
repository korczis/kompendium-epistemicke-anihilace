{#- The technique page's metadata table, rendered from front matter (duplicate-table, ADR 0013/0016):
    EA kód and Subkategorie from [extra], Kategorie from data/ea-categories.toml keyed by ea_category,
    and the page's own Riziková úroveň / Reverzibilita from extra.ea_risk_text / ea_reversibility_text.
    The page keeps the header, the separator and the Rodičovská kapitola row; this is one row-block,
    so a table reads exactly as before. scripts/extract-metadata-table.py made the move and proved
    every page expands back byte for byte. -#}
{%- set cat = load_data(path="data/ea-categories.toml") -%}
| **EA kód** | `{{ page.extra.ea_code }}` |
| **Kategorie** | {{ cat[page.extra.ea_category] }} |
| **Subkategorie** | {{ page.extra.ea_subcategory }} |
| **Riziková úroveň** | {{ page.extra.ea_risk_text }} |
| **Reverzibilita** | {{ page.extra.ea_reversibility_text }} |
{#- -#}
