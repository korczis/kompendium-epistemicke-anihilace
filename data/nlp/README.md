# Katalog NLP vzorců

Zdroj pravdy sekce [`content/kompendium/nlp-vzorce/`](../../content/kompendium/nlp-vzorce/):
rodiny, hesla a ověřená bibliografie. Vše, co z nich plyne, odvozuje
[`scripts/nlp-catalog.py`](../../scripts/nlp-catalog.py) a nic z toho se nepíše ručně.
Pravidlo: [`project.nlp-catalog`](../../.ai/repo/rules/project/nlp-catalog.v1.md); postup:
[`.ai/repo/workflows/nlp-catalogue.md`](../../.ai/repo/workflows/nlp-catalogue.md); původ
katalogu: [`nlp-catalogue-provenance`](../../.ai/repo/knowledge/curated/nlp-catalogue-provenance.md).

| soubor | obsah |
|---|---|
| `_families.toml` | rodiny v pořadí katalogu, neměnný dvoumístný kód, český a anglický název |
| `_sources.toml` | jediná díla, která smějí stránky citovat; `cite` je podoba citace v textu, `group` je `primary`, `roots` nebo `critical` |
| `<rodina>.toml`, `<rodina>.<část>.toml` | hesla `[[pattern]]` rodiny; části umožňují psát rodinu paralelně (`--part`) |

Co z katalogu vzniká: front matter každé stránky (pole `nlp_*`), identifikační tabulka,
oddíly Literatura a Související, výpisy rodin a souhrny sekce, data trenéru
`static/data/nlp-trener.json` a úplný export `static/data/nlp-katalog.json`.

```sh
python3 scripts/nlp-catalog.py           # zapsat vše odvozené
python3 scripts/nlp-catalog.py --check   # brána (CI, verify-all.sh, verify-content.sh)
python3 scripts/nlp-catalog.py --stats   # počty podle rodiny, druhu, užití, rizika a recenze
```
