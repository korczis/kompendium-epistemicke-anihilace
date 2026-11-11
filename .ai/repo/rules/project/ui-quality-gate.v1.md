---
id: project.ui-quality-gate
version: 1
kind: rule
title: Změna UI projde prohlížečovou branou interaktivity a přístupnosti
description: Každá změna šablon, stylů nebo skriptů webu projde v reálném prohlížeči smoke testem interaktivity a auditem WCAG 2.2 AA, rozvržení a stability bez nálezu.
statement: Před sloučením každé změny v templates/, styles/ nebo static/js/ spusť npm run verify a opravuj, dokud smoke test interaktivity i audit WCAG 2.2 AA, chyb konzole, vodorovného přetečení a CLS neskončí bez nálezu.
status: active
class: blocking
depends_on: [project.ui-uses-flowbite-pro@1, project.page-polish@1]
tags: [ui, accessibility, testing, performance]
---

# Rationale

Úspěšný `zola build` ani zkompilované CSS neříkají nic o tom, zda drawer jde zavřít
klávesou Escape, zda vyhledávání vybírá výsledky šipkami nebo zda je text čitelný v tmavém
režimu. Audit z 2026-11-10 (13 tříd stránek × 6 šířek × 2 témata) našel na stránkách, které
se sestavovaly bez chyby, `aria-hidden-focus` na každé stránce, až 1963 uzlů s nedostatečným
kontrastem, nepopsaná pole formulářů a posun rozvržení úvodní stránky 0,171. Tyto vady
odhalí jen prohlížeč.

# Required behaviour

- `npm run verify` (`scripts/verify-all.sh`) sestaví web pod produkčním prefixem cesty
  (`/kompendium-epistemicke-anihilace/`, jako GitHub Pages) a spustí:
  - scénáře v `test/e2e/surfaces.cjs`: každá třída stránek se načte bez chyby JS a sítě; Mermaid,
    Okolí stránky, Mapa, Stav, vizualizace, filtr a fasety glosáře, podstromy sidebaru,
    vyhledávání (Ctrl+K, šipky, Enter, kód EA na prvním místě) a mobilní drawer (fokus
    dovnitř a zpět, zavřený drawer `inert`, `aria-expanded` na tlačítku, viditelný backdrop
    pod sidebarem, odkazy a skupiny v otevřeném draweru přijímají ťuknutí, ťuknutí mimo něj
    drawer zavře) fungují;
  - `scripts/audit-ui.cjs`: žádné porušení axe-core WCAG 2.2 AA (375 a 1440 px, světlý i
    tmavý režim), žádná chyba konzole či sítě, žádné vodorovné přetečení (320–1920 px),
    CLS nejvýše 0,1.
- Nová interaktivní funkce dostane scénář v `test/e2e/surfaces.cjs`; nová třída stránek
  řádek v seznamu stránek auditu i scénářů.
- Překryvná vrstva (drawer, modal, dropdown, paleta) se testuje skutečným ťuknutím na prvky,
  které má zpřístupnit, ne jen fokusem a klávesnicí: fokus projde i pod průhledným backdropem
  (`.ai/repo/knowledge/curated/mobile-drawer-stacking.md`). Vrstvy používají stupnici Pro
  admin shellu: navigační lišta `z-30` > sidebar `z-20` > backdrop sidebaru `z-10`.
- Interaktivní komponenty řídí Flowbite JS; projektový JS jen doplňuje stav přístupnosti
  nebo funkce, které Flowbite nemá (vyhledávání, grafy, vizualizace).
- Vizualizační knihovny se načítají jen tam, kde je skript stránky volá
  (`static/data/viz-deps.json` z `scripts/build-graph.py`), nikdy plošně.
- Automatický audit nenahrazuje ruční test klávesnicí a čtečkou; zbývající neověřené oblasti
  se zapisují do popisu změny.

# Failure behaviour

Změna, po které `npm run verify` skončí nenulovým kódem, se opraví dřív, než se sloučí.
CI (job `ui`) běží na každém pull requestu a před nasazením.

# Verification

Brána rozšiřuje, nenahrazuje `project.page-polish`: jeden místní vstup pro celé CI.

```sh
npm run verify                # scripts/verify-all.sh: zrcadlo CI; s větví feature/ui-app-shell-v2
                              # jeho kroky scripts/audit-ui.cjs (axe WCAG 2.2 AA, přetečení,
                              # chyby konzole, CLS) a scénáře interaktivity v test/e2e/surfaces.cjs
npm run verify -- --fast      # rychlá část
```

Dokud krok auditu není na `main`, je jeho úspěch ve větvi UI podmínkou jejího sloučení.
