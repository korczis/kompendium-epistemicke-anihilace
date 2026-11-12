# Katalog NLP vzorců

Zdroj pravdy sekce [`content/kompendium/nlp-vzorce/`](../../content/kompendium/nlp-vzorce/):
rodiny, hesla a ověřená bibliografie. Vše, co z nich plyne, odvozuje
jeden engine všech katalogů [`scripts/catalogs.py`](../../scripts/catalogs.py) podle deklarace [`data/catalogs.toml`](../catalogs.toml) a nic z toho se nepíše ručně.
Pravidlo: [`project.content-catalogs`](../../.ai/repo/rules/project/content-catalogs.v1.md); postup:
[`.ai/repo/workflows/catalogues.md`](../../.ai/repo/workflows/catalogues.md); původ
katalogu: [`nlp-catalogue-provenance`](../../.ai/repo/knowledge/curated/nlp-catalogue-provenance.md).

| soubor | obsah |
|---|---|
| `_coverage.toml` | názvy ze standardních přehledů (Meta-model, Miltonův model, Satir) a heslo, které je pokrývá, nebo důvod, proč heslo nemá; brána odmítne název bez obojího |
| `_families.toml` | rodiny v pořadí katalogu, neměnný dvoumístný kód, český a anglický název |
| `<rodina>.toml`, `<rodina>.<část>.toml` | hesla `[[pattern]]` rodiny; části umožňují psát rodinu paralelně (`--part`) |

Bibliografie je společná všem katalogům: [`data/sources.toml`](../sources.toml). Co z katalogu
vzniká: front matter každé stránky (`catalog` a pole `catalog_*`), identifikační tabulka,
oddíly Literatura a Související, výpisy a mapy rodin, souhrny sekce a úplný export
`static/data/nlp-katalog.json`, který čte průzkumník a ilustrace. Příkladové výroky hesel
(`trainer`) jsou ověřovaná zdrojová data a nikde se nezveřejňují (ADR 0008).

```sh
python3 scripts/catalogs.py                    # zapsat vše odvozené (všechny katalogy)
python3 scripts/catalogs.py --catalog nlp      # jen tento katalog
python3 scripts/catalogs.py --check            # brána (CI, verify-all.sh, verify-content.sh)
python3 scripts/catalogs.py --stats            # počty podle katalogu, rodiny, druhu, užití a rizika
```
