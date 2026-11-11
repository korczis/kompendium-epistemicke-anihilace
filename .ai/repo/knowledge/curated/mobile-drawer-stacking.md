---
schema: knowledge/v1
id: mobile-drawer-stacking
kind: knowledge
class: lesson
title: "Backdrop mobilního draweru musí ležet pod sidebarem; test fokusu nestačí, drawer se testuje ťuknutím"
description: "Když se mění sidebar, navigační lišta, z-index, Flowbite Drawer nebo jeho test v test/e2e/surfaces.cjs."
status: verified
epistemics: observed
date: 2026-11-11
tags:
  - ui
  - mobile
  - testing
provenance:
  origin: authored
---

# Backdrop mobilního draweru musí ležet pod sidebarem; test fokusu nestačí, drawer se testuje ťuknutím

## Co se stalo

Na telefonu (do 1023 px) šel obsah knihy otevřít hamburgerem, ale žádný odkaz ani přepínač
skupiny v otevřeném draweru nefungoval: každé ťuknutí drawer jen zavřelo. Vlastník to nahlásil
2026-11-11. Produkce 270492a0 při 390 × 844 px: `document.elementFromPoint` nad odkazem „Úvod“
vrátil `<div drawer-backdrop class="bg-dark-backdrop/70 fixed inset-0 z-30">`, ne odkaz;
Playwright hlásil „intercepts pointer events“.

## Příčina

Dvě vrstvy Flowbite s různou stupnicí z-indexu:

- Sidebar je převzatý z Flowbite Pro admin shellu: `#sidebar` `fixed z-20`, navigační lišta
  `z-30`. Pro shell má vlastní backdrop `fixed inset-0 z-10 bg-gray-900/50 dark:bg-gray-900/90`
  (`flowbite-admin-dashboard/src/html/index.html`, `#sidebarBackdrop`), tedy **pod** sidebarem.
- Otevírání ale řídil obecný Flowbite `Drawer` z atributů `data-drawer-target` /
  `data-drawer-toggle`. Jeho výchozí backdrop je `bg-dark-backdrop/70 fixed inset-0 z-30`,
  navržený pro drawery na `z-40`. Nad sidebarem `z-20` proto ležel průhledný backdrop
  a jeho obsluha kliknutí drawer zavřela.
- Barva `bg-dark-backdrop/70` se navíc nevygenerovala (Tailwind ji ve zdrojích nevidí), takže
  backdrop byl neviditelný a vada nebyla vidět ani na snímku.

## Proč to brány nechytily

Scénář `drawer` v `test/e2e/surfaces.cjs` ověřoval jen klávesnici: zavřený drawer je `inert`,
otevření přesune fokus dovnitř, Escape ho zavře. Fokus i klávesnice backdrop obejdou, takže
test procházel. Audit axe-core ani snímek vadu neukážou, protože backdrop byl průhledný.

## Oprava a prevence

- Drawer dál vzniká z atributů `data-drawer-*` na tlačítku (tak to chce kontrola Pro shellu,
  signál S5 `flowbite-pro/verify.mjs`). `static/js/site.js` po inicializaci Flowbite
  (událost `load`) nastaví instanci `Drawer` „sidebar“ backdrop Pro shellu
  (`DRAWER_BACKDROP`, `z-10`); backdrop vzniká při každém otevření z těchto voleb. Tlačítko
  `#toggleSidebarMobile` nese `aria-expanded`. Vlastní instance `new Drawer(...)` místo atributů
  by S5 odmítl; vlastní backdrop vedle Flowbite by byl druhá implementace téhož.
- Scénář `drawer` teď ťuká: backdrop existuje, je viditelný a jeho z-index je menší než
  u sidebaru; prvních šest odkazů a přepínačů v otevřeném draweru projde zkušebním kliknutím
  Playwrightu (`click({ trial: true })`, který odmítne prvek zakrytý jiným); ťuknutí na skupinu
  ji přepne a drawer nechá otevřený; ťuknutí na backdrop drawer zavře. Na produkci před opravou
  hlásil šest nálezů, po opravě žádný.
- Pravidlo `project.ui-quality-gate` to vyžaduje pro každou překryvnou vrstvu: interaktivní
  prvek se testuje ťuknutím, ne jen fokusem.

## Obecné poučení

Přebírá-li se komponenta z Pro šablony a chování z obecné knihovny, musí obě používat jednu
stupnici z-indexu. Překryvná vrstva, která zavírá při kliknutí, se ověřuje skutečným ťuknutím
na prvky pod ní; zkouška fokusem projde i tehdy, když prst nedosáhne na nic.
