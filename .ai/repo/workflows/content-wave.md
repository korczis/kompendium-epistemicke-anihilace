# Vlna obsahu: rozvinout, přeložit a provázat stránky

Kniha má přes 1800 stránek a rozvíjí se po vlnách: v každé vlně několik pracovníků (lidí
nebo agentů) zpracuje každý svůj adresář `content/` a vlna se sloučí do `main` najednou.
Pravidla, která vlna plní: `project.content-defensive-frame`,
`project.content-czech-diacritics`, `project.content-sources-verifiable`,
`project.content-linked-and-built`. Postup pro jednu stránku je skill
`kompendium-page-expansion` (`majordomus://skill/kompendium-page-expansion`).

## 1. Větev a úkol

```sh
majordomus worktree create feature/content-<vlna>     # nikdy přímo na main
cd "$(majordomus worktree path feature/content-<vlna>)"
majordomus start "Vlna <n>: <adresáře>" --scope content --scope scripts
```

`static/css/app.css` je generovaný a ignorovaný: v novém worktree ho vytvoří `npm run css`
(nebo se zkopíruje z primárního checkoutu), jinak `zola build` selže na `get_url`.

## 2. Změř

Vyber adresáře, kde je obsah nejslabší. Měří se, nehádá:

| měřítko | hranice |
|---|---|
| slova na stránku (bez hlavičky) | pod 600 je tenká stránka |
| vnitřní odkazy `](@/` na stránku | pod 3 je slepá ulička |
| podíl slov s diakritikou | pod 3 % je bez diakritiky, pod 12 % částečná |
| anglická funkční slova (the, and, of, with, is) vs. česká | víc anglických je anglická stránka |

Skript měření je v historii úkolu `t-20261109233230-3768`; seznam cílů odkazů
(`@/cesta.md<TAB>název`) se vygeneruje před vlnou a předá se každému pracovníkovi.

## 3. Rozděl

Jeden pracovník = jeden adresář (u velkých adresářů rozsah čísel souborů). Dva pracovníci
nikdy nesdílí soubor. Každý dostane stejné zadání: rámec knihy, jazyk, co je „plný obsah“,
pravidla o zdrojích a mechaniku ověření (skill `kompendium-page-expansion`).

## 4. Ověř

Ověřuje se přesně strom, který se commituje: `scripts/verify-content.sh` (s `--fix` navíc
přegeneruje odvozené soubory ze staged stromu a přidá je do commitu) exportuje index do
dočasného adresáře a spustí v něm všechny kontroly níže v pořadí. Pracovní strom obsahuje rozpracované soubory ostatních
pracovníků a jeho výsledek nic nedokazuje. Artefakty platformy, na které vlna narazí, popisuje
`.ai/repo/knowledge/curated/platform-artifacts-in-content.md`.

```sh
zola build --force -o "$TMPDIR/kea-out"       # Done; nefunkční odkaz @/ je chyba
python3 scripts/normalize-front-matter.py --check  # popis a štítky tam, kde je Zola čte
python3 scripts/check-ia.py                        # žádné nové porušení IA
python3 scripts/link-terms.py <adresáře vlny>      # obecné provázání pojmů a kódů EA
python3 scripts/polish-markdown.py <adresáře vlny> # typografie
python3 scripts/polish-markdown.py --check         # exit 0
python3 scripts/build-graph.py                     # odvozená data pro mapu a stav
bash test/run.sh                                   # nástroje se chovají, jak mají
```

Recenze: aspoň vzorek každého adresáře proti pravidlům o obranném rámci a zdrojích; každé
hlášení pracovníka o vynechaných nejistých údajích se přečte.

## 5. Commit a předání

- Commit po adresářích: `docs(content): rozvinout a provázat <adresář>`; polish zvlášť
  `style(content): typografie a struktura Markdownu`.
- `git rebase origin/main`, znovu krok 4, `majordomus check`.
- Vlnu sloučí a nasadí vlastník `main` a nasazení; `majordomus finish --outcome completed
  --verify-command "zola build --force -o $TMPDIR/kea-out"`.
- Další vlna začíná znovu krokem 2: měření ukáže, co je teď nejslabší.
