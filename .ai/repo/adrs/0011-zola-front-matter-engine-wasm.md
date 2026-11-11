---
schema: adr/v1
id: adr-0011
kind: adr
title: "Web je Zola s front matter a odvozenými daty; každý výpočet nad daty knihy jde přes jádro, cílem je WASM"
status: accepted
date: 2026-11-11
tags:
  - site
  - engine
  - enforcement
provenance:
  origin: authored
---

# 11. Web je Zola s front matter a odvozenými daty; každý výpočet nad daty knihy jde přes jádro, cílem je WASM

## Context

Web už je Zola: obsah je Markdown s front matter a data pro skripty (`static/data/*.json`)
odvozují skripty v `scripts/` z obsahu. Kontrakt jádra `kompendium-engine/v1`
(`docs/engine/kompendium-engine-v1.md`) definuje hledání a okolí stránky; JS implementace
`static/js/viz/jadro.js` a referenční `scripts/engine.py` reprodukují fixtury
`test/cases/engine/`, a kontrakt připouští pozdější WASM build, který je reprodukuje také.

Nevynucené zůstávalo, že výpočet nad daty knihy má jednoho vlastníka. Při zavedení tohoto
rozhodnutí mělo dvanáct skriptů vlastní kopii skládání textu bez diakritiky (`fold`), dva
vlastní kopii slugu adres a `mapa.js` vlastní řazení výsledků — filtr na stránce tak mohl
odpovídat jinak než hledání v záhlaví.

## Decision

Pokyn vlastníka (session `a70e6c7e-b525-4e86-bcd0-65a5d3593446`, 2026-11-11T21:35:10.964Z,
argument příkazu /loop, předaný vláknem obsahu 2e), doslovně:

> „after each iteration, feature implemented, issue fixed or milestone/pr closed -  show me
> deployed featueres
>     online in browser, use majordomus mesh use our best agents / skill / peers in parallel +
> backpropageate generic /evolve into ~/dev/prismatic-majordomus
>
> vse data driven, vse deployed after each implementation, vese derived, infered, generic,
> dynamic, documented, enforced, verified validated
>
> vse musi byt zola like powered / or zola powered, use front matter - be dynamic / generic /
> infered / derived / majordomus way, deployed asap, wasm powered, enforced from now on via
> .ai/ majordomus“

Z toho plyne, vynucené pravidlem `project.site-zola-engine`:

1. Každá plocha webu je obsah Zoly s front matter nebo šablona nad ním; data pro skripty se
   odvozují z obsahu skripty v `scripts/` a dokládají regenerací (`--check`), nikdy se nepíší
   ručně.
2. Každý výpočet nad daty knihy (hledání, okolí, skládání textu pro porovnání) jde přes jádro
   `KompendiumJadro` (kontrakt `kompendium-engine/v1`); slug adresy ve tvaru Zoly přes
   `KompendiumVrstva.slug`. Data načítají jen stávající zavaděče.
3. Produkčním jádrem bude WASM build (Rust crate, vlákno 2e), jakmile reprodukuje všechny
   fixtury `test/cases/engine/`; JS jádro zůstává funkční zálohou a stránka uvádí, které jádro
   odpovídalo. `.wasm` staví CI (Pages validate), necommituje se: binárku nelze revidovat ani
   doložit regenerací v rozpočtu pre-push brány.

## Consequences

- `scripts/check-viz-layer.py` odmítne `.normalize('NFD'/'NFKD')` mimo `viz/jadro.js` a
  `viz/vrstva.js` a `fetch(` mimo stávající zavaděče; `test/cases/23_engine_ownership.sh` to
  dokládá na kopii stromu. Dvanáct kopií skládání a dvě kopie slugu jsou nahrazené voláním
  jádra a vrstvy.
- WASM build dostane krok v CI: sestavení, fixtury proti sestavenému modulu, hlídání velikosti;
  `scripts/verify-all.sh` ho bez `cargo` přeskočí s výslovnou zprávou.
- Zpětné šíření obecného `/evolve` do `~/dev/prismatic-majordomus` je samostatný úkol v tom
  repozitáři, jeho vlastním postupem.
