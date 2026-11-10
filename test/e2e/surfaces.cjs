#!/usr/bin/env node
// Gate interaktivních ploch: ověří na sestaveném webu, že grafy a komponenty skutečně
// vykreslují (ne jen že stránka vrací 200), že nejsou chyby v konzoli a že na telefonu
// (390 px) nic nepřetéká do šířky. Prázdný graf je chyba, ne úspěch.
//
// Použití: BASE_URL=http://127.0.0.1:18790/ node test/e2e/surfaces.cjs
// (web sestavený s --base-url na tutéž adresu). Playwright: PLAYWRIGHT=<cesta k playwright-core>.
'use strict';

const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');

const BASE = (process.env.BASE_URL || 'http://127.0.0.1:18790/').replace(/\/?$/, '/');

// Pevné plochy aplikace. Stránky obsahu se vybírají až za běhu z odvozeného grafu
// (static/data/graph.json), aby test nezastaral, když se obsah přepíše nebo přejmenuje.
const FIXED = [
  { path: '', painted: 1, counts: [['a[href^="tel:"]', 3], ['#upozorneni-title', 1]], note: 'úvod: p5 síť pojmů, upozornění s kontakty pomoci' },
  { path: 'kompendium/02-uvod/v-kostce/', painted: 0, interact: 'kostka', note: 'vrstvy a model eskalace' },
  { path: 'mapa/', painted: 1, text: '[x-text="stats"]', note: 'Mapa knihy (cytoscape)' },
  { path: 'stav/', painted: 5, count: ['#stav-kpi > *', 8], note: 'Stav knihy (ECharts)' },
  { path: 'matice/', painted: 1, note: 'matice případů a technik (ECharts)' },
  { path: 'galerie/', painted: 3, note: 'Galerie (p5)' },
  { path: 'kompendium/techniques/', painted: 1, note: 'průzkumník technik' },
  { path: 'kompendium/historical-cases/', painted: 1, note: 'časová osa historických případů' },
  { path: 'glossary/', painted: 1, note: 'průzkumník glosáře' },
  { path: 'kompendium/08-prilohy/index-pojmu/', painted: 1, count: ['[data-rj-item]', 2], interact: 'rejstrik', note: 'interaktivní rejstřík pojmů (ECharts)' },
  { path: 'tags/', painted: 1, note: 'štítky (treemap)' },
  { path: 'kompendium/case-studies/', painted: 1, note: 'přehled oddílu' },
  { path: 'kompendium/visualizations/', painted: 8, note: 'vizualizace knihy (Chart.js, p5)' },
  { path: 'kompendium/nlp-vzorce/', painted: 1, note: 'průzkumník katalogu NLP (ECharts graf vazeb)' },
  { path: 'kompendium/nlp-vzorce/milton-model/', painted: 1, note: 'průzkumník rodiny NLP s předvybranou rodinou' },
  { path: 'kompendium/nlp-vzorce/trener/', painted: 0, count: ['[data-trener-msg]', 2], note: 'trenér rozpoznávání NLP vzorců' },
];

// Nejodkazovanější stránka oddílu: stabilní reprezentant, který se mění jen s obsahem.
function top(g, section) {
  const inDeg = {};
  g.edges.forEach((e) => { inDeg[e[1]] = (inDeg[e[1]] || 0) + 1; });
  const pages = g.nodes.filter((n) => n.section === section && !/_index\.md$/.test(n.path));
  pages.sort((a, b) => (inDeg[b.id] || 0) - (inDeg[a.id] || 0));
  return pages[0];
}

async function derived() {
  const g = await (await fetch(BASE + 'data/graph.json')).json();
  const page = (n) => n.url.replace(/^\//, '');
  const out = [];
  const tech = top(g, 'kompendium/techniques');
  if (tech) out.push({ path: page(tech), painted: 1, counts: [['[data-kontext] a[href]', 1], ['[data-hx-family]', 1]], note: 'nejodkazovanější technika: karta, okolí a kontext' });
  const kase = top(g, 'kompendium/case-studies');
  if (kase) out.push({ path: page(kase), painted: 1, count: ['[data-kontext] a[href]', 1], note: 'nejodkazovanější kazuistika: kontext' });
  const term = top(g, 'glossary');
  if (term) out.push({ path: page(term), painted: 1, count: ['[data-kontext] a[href]', 3], interact: 'paleta', note: 'nejodkazovanější heslo: kontext a paleta' });
  // První stránka knihy, jejíž HTML obsahuje diagram Mermaid (hledá se v sestaveném webu).
  for (const n of g.nodes) {
    if (!n.path.startsWith('kompendium/')) continue;
    const html = await (await fetch(BASE + page(n))).text().catch(() => '');
    if (html.includes('data-lang="mermaid"')) { out.push({ path: page(n), painted: 0, mermaid: 1, note: 'stránka s diagramem Mermaid' }); break; }
  }
  return out;
}

let SURFACES = FIXED;

async function paintedCanvases(page) {
  return page.evaluate(() => {
    let n = 0;
    document.querySelectorAll('canvas').forEach((c) => {
      if (!c.width || !c.height) return;
      let ctx = null;
      try { ctx = c.getContext('2d', { willReadFrequently: true }); } catch (e) { return; }
      if (!ctx) { n += 1; return; } // WebGL: kontext existuje, obsah z 2D nečteme
      try {
        const d = ctx.getImageData(0, 0, c.width, c.height).data;
        for (let i = 3; i < d.length; i += 64) { if (d[i] > 0) { n += 1; return; } }
      } catch (e) { n += 1; }
    });
    return n;
  });
}

async function scrollThrough(page) {
  await page.evaluate(async () => {
    for (let y = 0; y < document.body.scrollHeight; y += 600) {
      window.scrollTo(0, y);
      await new Promise((r) => setTimeout(r, 100));
    }
    window.scrollTo(0, 0);
  });
}

async function check(browser, s, viewport, scheme) {
  const failures = [];
  const page = await browser.newPage({ viewport, colorScheme: scheme });
  const origin = new URL(BASE).origin;
  page.on('pageerror', (e) => failures.push('chyba stránky: ' + e.message));
  page.on('console', (m) => { if (m.type() === 'error') failures.push('konzole: ' + m.text().slice(0, 160)); });
  page.on('response', (r) => { if (r.status() >= 400 && r.url().startsWith(origin)) failures.push(r.status() + ' ' + r.url()); });
  const res = await page.goto(BASE + s.path, { waitUntil: 'networkidle' });
  if (!res || res.status() !== 200) failures.push('HTTP ' + (res && res.status()));
  await scrollThrough(page);
  await page.waitForTimeout(2500);

  const painted = await paintedCanvases(page);
  if (painted < s.painted) failures.push(`vykreslená plátna: ${painted}, očekáváno aspoň ${s.painted}`);
  if (s.text) {
    const t = await page.locator(s.text).first().textContent().catch(() => '');
    if (!t || !t.trim()) failures.push(`prázdný text ${s.text}`);
  }
  for (const c of (s.counts || []).concat(s.count ? [s.count] : [])) {
    const n = await page.locator(c[0]).count();
    if (n < c[1]) failures.push(`${c[0]}: ${n} < ${c[1]}`);
  }
  if (s.mermaid) {
    const n = await page.locator('.mermaid svg').count();
    if (n < s.mermaid) failures.push(`diagramy Mermaid: ${n} < ${s.mermaid}`);
  }
  if (s.interact === 'kostka') {
    const visible = () => page.evaluate(() => ({
      layer: [...document.querySelectorAll('[data-vrstva-panel]')].filter((x) => !x.hidden).map((x) => x.dataset.vrstvaPanel).join(),
      step: [...document.querySelectorAll('[data-krok-panel]')].filter((x) => !x.hidden).map((x) => x.dataset.krokPanel).join(),
    }));
    const before = await visible();
    await page.locator('[data-vrstva="ontologicka"] text').click();
    await page.locator('[data-krok="krize"]').click();
    const after = await visible();
    if (after.layer !== 'ontologicka') failures.push(`vrstvy nereagují (vybráno „${after.layer}“, dříve „${before.layer}“)`);
    if (after.step !== 'krize') failures.push(`model eskalace nereaguje (vybráno „${after.step}“)`);
  }
  if (s.interact === 'paleta') {
    await page.keyboard.press('Control+k');
    const dialog = page.locator('[role="dialog"]').first();
    await dialog.waitFor({ state: 'visible', timeout: 5000 }).catch(() => failures.push('paleta se neotevřela (Ctrl+K)'));
    await page.keyboard.type('gaslight');
    await page.waitForTimeout(1500);
    const hits = await page.locator('[role="dialog"] [role="option"]').count();
    if (hits < 1) failures.push('paleta nenašla „gaslight“');
    await page.keyboard.press('Escape');
  }
  if (s.interact === 'rejstrik') {
    // Filtr textem: první slovo prvního hesla zúží seznam a stav to oznámí.
    const shown = () => page.locator('[data-rj-item]:visible').count();
    const all = await page.locator('[data-rj-item]').count();
    const word = ((await page.locator('[data-rj-title]').first().textContent()) || '').trim().split(/\s+/)[0];
    await page.fill('#rj-q', word);
    const hit = await shown();
    const status = (await page.locator('[data-rj-status]').textContent()) || '';
    if (!(hit >= 1 && hit < all)) failures.push(`filtr „${word}“ ukazuje ${hit} z ${all}`);
    if (!status.includes(String(hit))) failures.push(`stav neoznamuje počet (${status.trim()})`);
    await page.fill('#rj-q', '');
    // Kategorie z Flowbite dropdownu: zůstanou jen hesla zaškrtnuté kategorie.
    await page.click('#rj-cat-button');
    const box = page.locator('[data-rj-cat]').first();
    await box.check();
    const cat = await box.inputValue();
    const cats = await page.locator('[data-rj-item]:visible').evaluateAll((els) => els.map((e) => e.dataset.category));
    if (!cats.length || cats.some((c) => c !== cat) || cats.length === all) failures.push(`kategorie „${cat}“ nefiltruje (${cats.length} z ${all})`);
    await page.keyboard.press('Escape');
    await page.locator('[data-rj-reset="toolbar"]').click();
    // Uzel grafu z klávesnice: šipka vybere heslo, Enter ho otevře.
    await page.focus('[data-rj-chart]');
    await page.keyboard.press('ArrowRight');
    const url = await page.locator('[data-rj-chart]').getAttribute('data-rj-current-url');
    if (!url) failures.push('graf: šipka nevybrala heslo');
    else {
      await Promise.all([page.waitForURL(url, { timeout: 10000 }).catch(() => {}), page.keyboard.press('Enter')]);
      if (page.url() !== url) failures.push(`graf: Enter neotevřel heslo (${page.url()})`);
      await page.goBack({ waitUntil: 'networkidle' });
    }
  }
  const overflow = await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
  if (overflow > 0) failures.push(`vodorovné přetečení ${overflow} px`);
  await page.close();
  return failures;
}

(async () => {
  SURFACES = FIXED.concat(await derived());
  const browser = await chromium.launch();
  let failed = 0;
  for (const s of SURFACES) {
    for (const [label, viewport, scheme] of [['desktop/tmavý', { width: 1440, height: 900 }, 'dark'], ['telefon/světlý', { width: 390, height: 844 }, 'light']]) {
      const f = await check(browser, s, viewport, scheme);
      const name = `/${s.path} (${s.note}, ${label})`;
      if (f.length) { failed += 1; console.log(`FAIL ${name}`); f.forEach((x) => console.log('     ' + x)); }
      else console.log(`ok   ${name}`);
    }
  }
  await browser.close();
  console.log(`surfaces: ${SURFACES.length * 2 - failed}/${SURFACES.length * 2} v pořádku`);
  process.exit(failed ? 1 : 0);
})();
