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
  { path: '', painted: 1, note: 'úvod: p5 síť pojmů' },
  { path: 'kompendium/02-uvod/v-kostce/', painted: 0, interact: 'kostka', note: 'vrstvy a model eskalace' },
  { path: 'mapa/', painted: 1, text: '[x-text="stats"]', note: 'Mapa knihy (cytoscape)' },
  { path: 'stav/', painted: 5, count: ['#stav-kpi > *', 8], note: 'Stav knihy (ECharts)' },
  { path: 'matice/', painted: 1, note: 'matice případů a technik (ECharts)' },
  { path: 'galerie/', painted: 3, note: 'Galerie (p5)' },
  { path: 'kompendium/techniques/', painted: 1, note: 'průzkumník technik' },
  { path: 'kompendium/historical-cases/', painted: 1, note: 'časová osa historických případů' },
  { path: 'glossary/', painted: 1, note: 'průzkumník glosáře' },
  { path: 'tags/', painted: 1, note: 'štítky (treemap)' },
  { path: 'kompendium/case-studies/', painted: 1, note: 'přehled oddílu' },
  { path: 'kompendium/visualizations/', painted: 8, note: 'vizualizace knihy (Chart.js, p5)' },
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
  if (tech) out.push({ path: page(tech), painted: 1, count: ['[data-kontext] a[href]', 1], note: 'nejodkazovanější technika: okolí a kontext' });
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
  if (s.count) {
    const n = await page.locator(s.count[0]).count();
    if (n < s.count[1]) failures.push(`${s.count[0]}: ${n} < ${s.count[1]}`);
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
