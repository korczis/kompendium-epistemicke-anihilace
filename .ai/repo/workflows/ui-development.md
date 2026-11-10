# Vývoj UI: shell Flowbite Pro, komponenty a brána kvality

Krátký postup pro každou změnu šablon, stylů a skriptů webu. Pravidla, která plní:
`project.ui-uses-flowbite-pro`, `project.ui-quality-gate`.

## Spuštění

```sh
npm ci                               # Tailwind 4, Flowbite 4, knihovny vizualizací, Playwright, axe
npm run dev                          # vendor + CSS + zola serve (http://127.0.0.1:1111)
npm run css                          # po změně tříd v šablonách (Tailwind skenuje templates/ a site.js)
scripts/verify-content.sh --fix      # po změně obsahu: graph.json, metrics.json, ia.json
                                     # a data shellu (build-ui-data.py: nav, search, viz-deps …)
```

`static/css/app.css` a `static/js/vendor/` jsou generované a ignorované; nikdy se needitují.

## Kde je co

| plocha | soubor | Pro předloha |
|---|---|---|
| shell (navbar, sidebar, obsah) | `templates/base.html`, `partials/nav.html`, `partials/sidebar*.html` | admin dashboard 1.1.1 `src/html/index.html` (navbar, `aside#sidebar`, `#main-content`) |
| podstromy sidebaru | `partials/sidebar_node.html`, `sidebar_pages.html` | admin dashboard: sidebar s rozbalovacími skupinami (`data-collapse-toggle`) |
| hlavička stránky, drobečky | `partials/header.html`, `partials/subnav.html` | admin dashboard: page header s breadcrumb; záložky „underline tabs“ |
| čtení | `page.html`, `partials/toc*.html`, třída `format` | Publisher UI blocks 1.0.0 (článek, typografie `flowbite-typography`) |
| glosář | `templates/glossary/list.html`, `static/js/glossary.js` | admin dashboard: stat cards, toolbar s vyhledáváním a filtry, karty |
| vyhledávání | `partials/nav.html`, `static/js/site.js` | admin dashboard: navbar search; výsledky jako dropdown seznam |

Licencované zdroje: `~/dev/poppyhead/assets/vendor/flowbite/` (jen lokálně, nikdy do repozitáře;
veřejné repo smí obsahovat jen adaptovaný markup). Vlastníkova adaptace:
`~/dev/poppyhead/lib/poppyhead_web/components/layouts/flowbite.html.heex`. Skill `flowbite-pro`.

## Postup změny

1. Najdi v Pro předloze odpovídající blok a převezmi jeho strukturu a třídy; nevymýšlej
   komponentu, kterou Pro sada má.
2. Navigace a přehledy se **odvozují z dat**, ne ručně: `scripts/build-graph.py` zapisuje
   `static/data/nav.json` (strom sekcí a pořadí stránek), `terms.json`, `glossary.json`,
   `search.json`, `viz-deps.json`; šablony je čtou přes `load_data`.
3. Interaktivitu řídí Flowbite JS přes `data-*` atributy. Projektový JS (`static/js/site.js`)
   jen doplňuje stav přístupnosti a funkce knihy; atribut zapisuj jen při změně (observer).
4. Barvy jen z tokenů: `primary-*` (indigo), šedé texty nejméně `gray-500` na bílé a
   `gray-400` na `gray-800` (AA); odkazy v próze řídí `styles/app.css`.
5. Nová vizualizace: skript do `static/js/kompendium/`, knihovnu (`Chart`, `p5`, `THREE`)
   pozná `build-graph.py` ze zdroje a `base.html` ji načte jen na stránkách se skriptem.
   Posuvníkům a ovládacím prvkům dej popisek (`<label>` nebo `aria-label`).

## Ověření před commitem

```sh
scripts/ui-test.sh                                   # smoke + audit (WCAG 2.2 AA, přetečení, CLS)
node ~/.claude/skills/flowbite-pro/verify.mjs .      # shoda s Flowbite Pro: PASS
~/.claude/skills/flowbite-pro/licence-check.sh . main  # žádný Pro soubor zkopírovaný celý
python3 scripts/build-graph.py --check && bash test/run.sh
```

Snímky auditu (`scripts/audit-ui.cjs <base> <složka>`, `shots/*.png` pro 375 a 1440 px ve
světlém i tmavém režimu) slouží k porovnání před/po; porovnej je u každé vizuální změny.
