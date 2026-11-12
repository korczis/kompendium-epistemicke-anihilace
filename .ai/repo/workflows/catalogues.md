# Katalogy knihy: založit katalog, přidat, upravit nebo zrecenzovat heslo

Katalogy (NLP vzorce, argumentační fauly a další) jsou data a jeden engine,
`scripts/catalogs.py`, z nich odvozuje sekce, stránky, vazby, literaturu, exporty, průzkumníky
a ilustrace. Pravidlo: `project.content-catalogs` (`../rules/project/content-catalogs.v1.md`);
platí i pravidla celé knihy `project.content-defensive-frame`,
`project.content-sources-verifiable`, `project.information-architecture` a
`project.content-linked-and-built`. Nic, co engine odvozuje, se neupravuje ručně.

## 1. Větev a úkol

```sh
majordomus worktree create feature/katalog-<co>
cd "$(majordomus worktree path feature/katalog-<co>)"
majordomus start "Katalog: <co>" --scope .
```

## 2. Nový katalog

1. Blok `[[catalog]]` v `data/catalogs.toml` (adresář dat, sekce, předpona, štítek, ikona,
   pořadí, slovníky `types`/`uses`/`risks`, povinné oddíly `required`, oddíl důkazů
   `evidence`, exporty). Žádný nový skript, šablona ani brána: engine i šablony čtou
   deklaraci.
2. `<adresář>/_families.toml` s rodinami a neměnnými kódy a `<adresář>/_coverage.toml` s
   názvy, které uvádějí standardní přehledy oboru, každý s heslem nebo s důvodem, proč heslo
   nemá; přidat se smí jen název, který dílo prokazatelně uvádí.
3. Díla, která katalog potřebuje, do `data/sources.toml` – jen ta, o nichž je jisté, že
   existují a říkají, co jim text připisuje.
4. Rozcestník sekce `content/<sekce>/_index.md` (jen `description` a próza) a odkaz na sekci
   z `content/kompendium/_index.md`.

## 3. Heslo

- Záznam do `<adresář>/<rodina>.toml` nebo části `<rodina>.<část>.toml`; `id` je další volné
  `<předpona>-<kód>.NN`; zveřejněné `id` ani `slug` se nemění. Pole popisuje docstring enginu.
- **Bez duplicit:** má-li pojem v knize stránku (glosář, technika EA), dostane heslo
  `canonical = "<cesta>"` a žádnou vlastní stránku. Před založením stránky vždy vyhledat
  (`grep -ril "<název>" content/glossary content/kompendium/techniques`).
- `trainer`: aspoň dva původní příkladové výroky, jeden manipulativní nebo chybný a jeden
  neškodný kontrast, každý s `marker` a `response`. Jsou to ověřovaná zdrojová data, která se
  nikde nezveřejňují: veřejný web nemá plochu „text dovnitř, hesla ven“ (ADR 0008).
- Stránka `content/<sekce>/<rodina>/<slug>.md` má ve front matter jen `description` a prózu od
  `## Definice` s povinnými oddíly katalogu; citace jen z `data/sources.toml` v podobě `cite`.

## 4. Odvození a brány

```sh
python3 scripts/catalogs.py --part <soubor bez přípony>   # při psaní jedné části
python3 scripts/catalogs.py                               # všechny katalogy a exporty
python3 scripts/link-terms.py                             # odkazy na nové názvy
python3 scripts/catalogs.py --check                       # brána (CI)
bash scripts/verify-content.sh --fix                      # všechny brány obsahu na indexu
```

## 5. Recenze

`review = "agent"` je text agenta čekající na odbornou recenzi; na `owner` ho mění jen autor
knihy. Rozhodnutí autora se zapisují přes `majordomus decision`.
