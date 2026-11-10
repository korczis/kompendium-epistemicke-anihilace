# Katalog NLP vzorců: přidat, upravit nebo zrecenzovat heslo

Sekce `content/kompendium/nlp-vzorce/` je odvozená z katalogu `data/nlp/` a drží ji pravidlo
`project.nlp-catalog` (`../rules/project/nlp-catalog.v1.md`). Platí i pravidla celé knihy:
`project.content-defensive-frame`, `project.content-sources-verifiable`,
`project.information-architecture` a `project.content-linked-and-built`. Pisatel nikdy
neupravuje ručně nic, co odvozuje `scripts/nlp-catalog.py`.

## 1. Větev a úkol

```sh
majordomus worktree create feature/nlp-<co>
cd "$(majordomus worktree path feature/nlp-<co>)"
majordomus start "NLP: <co>" --scope .
```

## 2. Záznam v katalogu

- Nové heslo patří do souboru své rodiny `data/nlp/<rodina>.toml` nebo jeho části
  `<rodina>.<část>.toml`. Rodiny a jejich kódy jsou v `data/nlp/_families.toml`; novou rodinu
  přidává jen úkol, který to výslovně říká.
- `id` je `NLP-<kód rodiny>.NN`, další volné číslo; zveřejněné `id` ani `slug` se nemění.
- Pole a jejich hodnoty popisuje docstring `scripts/nlp-catalog.py` (`validate_entry`).
  `related` stačí zapsat jednou, generátor ho zrcadlí; `broader` vede k obecnějšímu heslu;
  `kompendium` jen na stránky knihy mimo sekci, které splňují `detail`.
- `trainer`: aspoň dva původní výroky, aspoň jeden manipulativní a jeden neškodný kontrast,
  každý s detekčním znakem (`marker`) a obrannou odpovědí (`response`). Trenér cvičí
  rozpoznání a obranu, nikdy tvorbu výroků.

## 3. Stránka

- `content/kompendium/nlp-vzorce/<rodina>/<slug>.md` má ve front matter jen `description`
  a prózu od `## Definice`; povinné oddíly a jejich pořadí jsou v `REQUIRED` generátoru.
- Citace jen z `data/nlp/_sources.toml` v podobě `cite`, v závorce. Nový zdroj se do
  bibliografie přidává jen tehdy, když je jisté, že dílo existuje a říká to, co mu text
  připisuje. Vaknin 2008 se na stránce hesla necituje, dokud je vazba `inferred`.
- Mechanismus jen jako struktura, kterou pozorovatel pozná: žádné kroky, pořadí, formulace
  k použití ani rady k výběru cíle.

## 4. Odvození a brány

```sh
python3 scripts/nlp-catalog.py --part <soubor bez přípony>   # při psaní jedné části
python3 scripts/nlp-catalog.py                               # celý katalog, data trenéru a export
python3 scripts/link-terms.py                                # odkazy na nové názvy
python3 scripts/nlp-catalog.py --check                       # brána katalogu (CI)
bash scripts/verify-content.sh --fix                         # všechny brány obsahu na indexu
```

## 5. Recenze

`review = "agent"` znamená text, který napsal agent a který čeká na odbornou recenzi. Na
`owner` ho mění jen autor knihy, když heslo zrecenzoval; totéž platí pro `vaknin =
"observed"`, které vyžaduje ověření v legálně dostupném výtisku. Rozhodnutí autora se
zapisují přes `majordomus decision`.
