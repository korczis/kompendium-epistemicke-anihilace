---
id: project.site-zola-engine
version: 1
kind: rule
title: Web je Zola nad front matter a odvozenými daty a každý výpočet nad daty knihy má jedno jádro
description: Plochy webu vznikají z obsahu Zoly s front matter a z dat odvozených skripty; hledání, okolí a skládání textu dělá jen jádro kompendium-engine/v1 (JS dnes, WASM jako cíl), slug adres jen komponentová vrstva.
statement: Stav každou plochu webu z obsahu Zoly s front matter a z dat odvozených scripts/, počítej nad daty knihy jen přes KompendiumJadro (kompendium-engine/v1) a KompendiumVrstva.slug a ověř to scripts/check-viz-layer.py, test/cases/23_engine_ownership.sh a fixturami test/cases/engine/.
status: active
class: blocking
depends_on: [project.viz-component-layer@1, project.site-derived-surfaces@3, project.ui-quality-gate@1]
tags: [site, engine, derived, wasm]
---

# Rationale

ADR 0011 (pokyn vlastníka 2026-11-11). Dvanáct skriptů mělo vlastní skládání textu bez
diakritiky a dva vlastní slug adres; filtr na stránce pak mohl najít něco jiného než hledání
v záhlaví a odkaz složený jinak než Zola na GitHub Pages (rozlišují velikost písmen) vedl na 404.
Jedno jádro s fixturami je také jediná cesta, jak WASM build dokázat rovnocenný.

# Required behaviour

- Obsah je Markdown s front matter (`data/front-matter.toml`, `scripts/normalize-front-matter.py`);
  data pro skripty (`static/data/*.json`) odvozují `scripts/build-*.py` a dokládá je
  `scripts/check-derived-currency.sh` regenerací.
- Hledání, okolí stránky a skládání textu pro porovnání volají `KompendiumJadro`
  (`static/js/viz/jadro.js`, kontrakt `docs/engine/kompendium-engine-v1.md`); slug adresy
  `KompendiumVrstva.slug`. Skript neskládá text (`.normalize('NFD'/'NFKD')`) ani nenačítá
  `static/data` (`fetch`) sám; zavaděči jsou `kompendium/kniha.js`, `viz/kompendium-viz.js`,
  `site.js` a `viz/paleta.js`.
- WASM build jádra se stává produkčním, až reprodukuje každou fixturu `test/cases/engine/`;
  JS jádro zůstává funkční zálohou a stránka uvádí, které jádro odpovídalo. `.wasm` staví CI,
  necommituje se.

# Failure behaviour

`scripts/check-viz-layer.py` skončí kódem 1 a vypíše soubor, řádek a vlastníka, přes kterého se
má počítat; změna se opraví dřív, než se sloučí.

# Verification

```sh
python3 scripts/check-viz-layer.py          # vlastnictví vizualizací, skládání textu a načítání dat
bash test/cases/23_engine_ownership.sh      # brána odmítne vlastní skládání i fetch, přijme jádro
bash test/cases/05_engine_js.sh             # JS jádro = referenční jádro na fixturách a sweepu
```
