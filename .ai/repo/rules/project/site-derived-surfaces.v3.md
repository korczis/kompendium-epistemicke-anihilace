---
id: project.site-derived-surfaces
version: 3
kind: rule
title: Navigační a datové plochy webu jsou odvozené a interaktivní
description: Mapa knihy, stav knihy, shell, graf okolí, zpětné odkazy, karty a metadata každé stránky se odvozují z obsahu a dat, nikdy se nepíšou ručně, a každá karta je odkaz.
statement: Stav, mapu, shell (boční navigace, hledání, paleta), okolí, zpětné odkazy, související stránky, karty a metadata (SEO, Open Graph, Twitter, JSON-LD) každé stránky vykresluj obecnou šablonou z obsahu a z odvozených dat ve static/data/, ne ručně na stránce; každá dlaždice, karta, uzel a položka přehledu je právě jeden odkaz na stránku, kterou představuje.
status: active
class: blocking
depends_on: [project.information-architecture@1, project.ui-uses-flowbite-pro@1]
tags: [ui, information-architecture, seo, interactivity, accessibility]
---

# Rationale

Kniha má přes tisíc stránek; cokoli psané na stránku ručně zastará a nebude jednotné. Obsah
a odkazy jsou data (`scripts/build-graph.py`), takže každou navigační a přehledovou plochu
lze odvodit jednou šablonou pro všechny stránky – a pak je i stejně interaktivní a stejně
vypadá (Flowbite Pro). Verze 2 přidává odvozený shell z druhé verze rozhraní a požadavky
autora na karty, úvodní stránku a vizualizace.

Požadavek autora doslova (bez diakritiky, jak byl napsán; předala session
`kompendium-epistemicke-anihilace-2e` se souhlasem session `dev-31`, 2026-11-10):
„kazda card clicable / kazda card link / preferably interavtive if posssibel“.

# Required behaviour

- `/mapa/` (Cytoscape.js nad `graph.json`; parametry `?oddil=`, `?stitek=`, `?stranka=`)
  a `/stav/` (ECharts nad `metrics.json`, čísla KPI vykreslená při sestavení) čtou jen
  odvozená data.
- Shell (boční navigace podstromů, horní lišta, hledání a paleta) čte odvozená data shellu
  (`scripts/build-ui-data.py`, dočasně samostatně, později součást `build-graph.py`); hledání
  v liště i paleta používají jeden a týž rejstřík.
- Úvodní stránka a přehledy oddílů ukazují jen odvozená čísla; žádný počet stránek, technik
  ani pojmů se nepíše ručně.
- **Úvodní stránka** (pokyny autora 2026-11-10: „vymazli landing page“, „kazdy jeden link,
  kazdy jeden odkaz, kazdy jeden text, kaazdty jedn odstavec“): pořadí bloků je hero,
  upozornění „Proč tato kniha není pro každého“, karusel a úvod, přehled knihy, statistiky;
  každý viditelný text je buď odvozený z titulků a popisů stránek, nebo napsaný jednou
  v `content/_index.md` (šablona ho jen vykreslí); odstavce úvodu splňují akademický standard
  knihy (citace autor–rok, Literatura); snímky karuselu a uzly přehledu se odvozují
  z `graph.json` a `nav.json` a vedou jen na rozvinuté stránky (ne na stránky v seznamu
  `check-ia.py --list detail`); grafika oddílů a OG obrázky se generují
  (`scripts/render-section-graphics.py --check`, výstup jen do `static/img/generated/`).
- Každá stránka ukazuje graf okolí, zpětné odkazy („Odkazují sem“) a související stránky
  podle štítků; nese SEO, Open Graph, Twitter a JSON-LD metadata odvozená z `title`,
  `description` a třídy stránky (technika, pojem, případ, oddíl).
- **Karty:** každá karta je právě jeden odkaz na stránku, kterou představuje (celá karta je
  `<a>` nebo má roztažený odkaz), bez vnořených interaktivních prvků; kde to dává smysl, je
  interaktivní (stav při najetí a fokusu). Totéž platí pro dlaždice, uzly grafu, sloupce
  grafu a položky seznamu.
- Mermaid v obsahu: uzel je klikací přes `click Uzel "@/glossary/heslo.md"` (volitelně
  `#kotva`); uzel, jehož popisek se rovná názvu stránky, je klikací automaticky.
- Knihovny (Cytoscape.js, ECharts, Chart.js, p5.js, Mermaid, Flowbite) jsou vendorované
  s pevnou verzí podle manifestu knihoven vizualizací; žádná stránka nenačítá vlastní kopii
  ani CDN.
- Plochy splňují WCAG 2.2 AA, nepřetékají na šířce telefonu a nemají posun rozvržení (CLS).
- **Vizualizace** (každý skript ve `static/js/viz/` a `static/js/kompendium/`; pokyn autora
  2026-11-10: „pridavej interaktivityu - vyuzivej p5.js, cytoscape.js, apache ec chartss,
  ... etc / enforce it via .ai/**“):
  1. je uvedená v manifestu knihoven vizualizací (`static/data/viz-deps.json`, odvozuje ho
     `scripts/build-ui-data.py`) a stránka načte jen knihovny svých vizualizací, přes sdílený
     zavaděč `static/js/viz/kompendium-viz.js`, nikdy dvě kopie téže knihovny;
  2. uzly, řady a popisky bere z odvozených dat (`graph.json`, `metrics.json`, `ia.json`,
     `search.json`) nebo z dat, která šablona vykreslí z obsahu; skript neobsahuje čísla,
     názvy ani seznamy stránek obsahu (konstanty vzhledu a paleta nejsou obsah);
  3. má textovou alternativu: `role="img"` s `aria-label` a text (seznam, tabulka, odstavec)
     odkázaný přes `aria-describedby`; uzly vedoucí na stránky jsou dosažitelné klávesnicí,
     nebo tytéž odkazy nabízí textová alternativa;
  4. má v `test/e2e/surfaces.cjs` tvrzení nad sestaveným webem (vykreslí se neprázdná, bez
     chyby v konzoli, vybraný uzel vede na existující stránku), s fixturami z `graph.json`;
  5. přebarví se při změně `color-theme` a respektuje `prefers-reduced-motion` (p5.js a
     Three.js zastaví animaci, karusel nepřehrává sám).

- **Interaktivní pohled pro každou třídu stránek** (pokyn autora 2026-11-10, předala session
  2e: „pridej grafy, visualizc, simulace, interaktivitu, bsude, enforce it for fure via .ai/“):
  každá třída stránek (oddíl podle `scripts/ia_model.py:section_of`) má aspoň jeden odvozený
  interaktivní pohled, který na stránce této třídy ověřuje scénář `test/e2e/surfaces.cjs`.
  Katalog ploch `static/data/surfaces.json` (šablony, data, skripty, pohledy a scénáře každé
  třídy) se odvozuje z obsahu, šablon a sestaveného webu a nikdy se nepíše ručně; třída bez
  pokrytého pohledu, která není na seznamu `KNOWN_GAPS`, sestavení zastaví, a seznam se smí jen
  zmenšovat.

# Failure behaviour

Plocha, která něco píše ručně, ukazuje prázdný graf, nevede na stránky, nebo karta, která
není právě jedním odkazem na existující stránku, je nález recenze třídy `blocking` a opraví
se dřív, než se sloučí do `main`.

# Verification

`npm run verify` (`scripts/verify-all.sh`): `test/e2e/surfaces.cjs` (`/mapa/`, `/stav/`,
`/galerie/`, shell, `graph.json`, `metrics.json`, vendorované knihovny), audit
`scripts/audit-ui.cjs` (axe-core WCAG 2.2 AA, přetečení, CLS, každý vnitřní `href` vrací 200
pod produkční cestou) a jeho kontrola karet (každý kontejner karty je právě jeden odkaz na
existující stránku; vlastní malá větev hned po této verzi, do té doby ji ověřuje recenze);
`node ~/.claude/skills/flowbite-pro/verify.mjs .` s 0 nálezy; data hlídá
`python3 scripts/build-graph.py --check`, `python3 scripts/build-surfaces.py --check` (katalog
ploch a pokrytí tříd stránek po sestavení, také ve `verify-content.sh`), `python3 scripts/build-ui-data.py --check`
(manifest viz-deps odpovídá skriptům, bod 1 vizualizací) a
`python3 scripts/render-section-graphics.py --check` (až přistane větev úvodní stránky; do té
doby recenze); text úvodu hlídá `scripts/check-ia.py` nad `content/_index.md`. Bod 3 vizualizací hlídá axe
(`role-img-alt`, `svg-img-alt`) jen zčásti; body 2, klávesová dosažitelnost uzlů a bod 5
ověřuje recenze, dokud je nekontroluje žádný příkaz.
