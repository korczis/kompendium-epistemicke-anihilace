#!/usr/bin/env node
// Gate interaktivních ploch: ověří na sestaveném webu, že grafy a komponenty skutečně
// vykreslují (ne jen že stránka vrací 200), že nejsou chyby v konzoli a že na telefonu
// (390 px) nic nepřetéká do šířky. Prázdný graf je chyba, ne úspěch.
//
// Použití: BASE_URL=http://127.0.0.1:18790/ node test/e2e/surfaces.cjs
// (web sestavený s --base-url na tutéž adresu). Playwright: PLAYWRIGHT=<cesta k playwright-core>.
//
// Jako modul (bez prohlížeče): require('./test/e2e/surfaces.cjs') vrací { FIXED, derived,
// fromDir }. derived(load) vrací odvozené scénáře, které by běh použil; load(cesta) vrací text
// souboru webu, výchozí čte z BASE_URL, fromDir('public') ze sestaveného adresáře.
'use strict';

const fs = require('fs');
const path = require('path');

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
  { path: 'glossary/', painted: 1, interact: 'faseta', note: 'průzkumník glosáře: kategorie' },
  { path: 'kompendium/08-prilohy/index-pojmu/', painted: 1, count: ['[data-rj-item]', 2], interact: 'rejstrik', note: 'interaktivní rejstřík pojmů (ECharts)' },
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

// Adresa, na které Zola stránku servíruje (bez diakritiky, malými písmeny), z cesty v grafu.
const zolaPath = (url) => url.split('/').filter(Boolean)
  .map((s) => s.normalize('NFKD').replace(/[\u0300-\u036f]/g, '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, ''))
  .map((s) => s + '/').join('');

const fromBase = (p) => fetch(BASE + p).then((r) => {
  if (!r.ok) throw new Error(`${p}: HTTP ${r.status}`);
  return r.text();
});
const fromDir = (dir) => (p) => fs.promises.readFile(
  path.join(dir, p === '' || p.endsWith('/') ? p + 'index.html' : p), 'utf8');

async function derived(load = fromBase) {
  const g = JSON.parse(await load('data/graph.json'));
  const page = (n) => zolaPath(n.url);
  const out = [];
  const tech = top(g, 'kompendium/techniques');
  // Kód EA techniky z odvozeného rejstříku hledání (static/data/search.json), ne z obsahu.
  const idx = JSON.parse(await load('data/search.json'));
  const F = Object.fromEntries(idx.fields.map((f, i) => [f, i]));
  const techEntry = tech && idx.entries.find((e) => e[F.url] === '/' + zolaPath(tech.url));
  // Kód může nést víc stránek (graph.json code_shared_with): na prvním místě musí být jedna z nich.
  const code = techEntry && techEntry[F.code];
  const codeUrls = idx.entries.filter((e) => code && e[F.code] === code).map((e) => e[F.url]);
  if (tech) out.push({ path: page(tech), painted: 1, counts: [['[data-kontext] a[href]', 1], ['[data-hx-family]', 1]], interact: 'hledani', code, codeUrls, url: '/' + zolaPath(tech.url), note: 'nejodkazovanější technika: karta, okolí, kontext, hledání a podstrom sidebaru' });
  const kase = top(g, 'kompendium/case-studies');
  if (kase) out.push({ path: page(kase), painted: 1, count: ['[data-kontext] a[href]', 1], note: 'nejodkazovanější kazuistika: kontext' });
  const term = top(g, 'glossary');
  if (term) out.push({ path: page(term), painted: 1, count: ['[data-kontext] a[href]', 3], interact: 'paleta', note: 'nejodkazovanější heslo: kontext, paleta a mobilní drawer' });
  // První stránka knihy, jejíž HTML obsahuje diagram Mermaid (hledá se v sestaveném webu).
  for (const n of g.nodes) {
    if (!n.path.startsWith('kompendium/')) continue;
    const html = await load(page(n)).catch(() => '');
    if (html.includes('data-lang="mermaid"')) { out.push({ path: page(n), painted: 0, mermaid: 1, note: 'stránka s diagramem Mermaid' }); break; }
  }
  return out;
}

let SURFACES = FIXED;

// Mobilní drawer: zavřený je inert, otevření přesune fokus dovnitř, Escape ho zavře a vrátí
// fokus na tlačítko.
async function drawer(page, failures) {
  const state = () => page.evaluate(() => {
    const sb = document.getElementById('sidebar');
    return { inert: sb.hasAttribute('inert'), inside: sb.contains(document.activeElement), focus: document.activeElement && document.activeElement.id };
  });
  if (!(await state()).inert) failures.push('zavřený drawer není inert');
  await page.locator('#toggleSidebarMobile').click();
  await page.waitForTimeout(500);
  const open = await state();
  if (open.inert) failures.push('otevřený drawer zůstal inert');
  if (!open.inside) failures.push('otevření draweru nepřesune fokus dovnitř');
  await page.keyboard.press('Escape');
  await page.waitForTimeout(500);
  const closed = await state();
  if (!closed.inert) failures.push('drawer zavřený klávesou Escape není inert');
  if (closed.focus !== 'toggleSidebarMobile') failures.push(`po zavření draweru je fokus na „${closed.focus}“, ne na tlačítku`);
}

// Vyhledávání v horní liště (ARIA combobox): kód EA dá svou techniku na první místo, šipka ji
// vybere, Enter ji otevře. Sidebar ukazuje aktuální stránku v podstromu aktivní větve.
async function combobox(page, s, failures) {
  // Sidebar: aktivní větev ukáže podstrom z nav.json až k aktuální stránce (aria-current).
  if (!(await page.locator('#sidebar a[aria-current="page"]').first().isVisible().catch(() => false))) failures.push('sidebar neukazuje aktuální stránku (aria-current="page")');
  if (!s.code) { failures.push('technika nemá v rejstříku kód EA'); return; }
  const input = page.locator('#topbar-search');
  await input.click();
  await input.fill(s.code);
  await page.waitForTimeout(1200);
  if (await input.getAttribute('aria-expanded') !== 'true') failures.push('combobox nerozbalil výsledky');
  const first = await page.locator('#topbar-search-results [role="option"]').first().getAttribute('data-href').catch(() => null);
  if (!first || !s.codeUrls.some((u) => first.endsWith(u))) failures.push(`kód ${s.code} nedá techniku s tímto kódem na první místo (${first})`);
  await page.keyboard.press('ArrowDown');
  const active = await input.getAttribute('aria-activedescendant');
  if (!active) failures.push('šipka dolů nevybere výsledek');
  await page.keyboard.press('Escape');
  await input.fill(s.code);
  await page.waitForTimeout(800);
  await page.keyboard.press('ArrowDown');
  const chosen = await page.locator('#topbar-search-results [role="option"][aria-selected="true"]').first().getAttribute('data-href').catch(() => null);
  // Vybraný výsledek může být i tatáž stránka: čeká se na skutečnou navigaci, ne jen na adresu.
  const navigated = page.waitForEvent('framenavigated', { predicate: (f) => f === page.mainFrame(), timeout: 5000 }).then(() => true, () => false);
  await page.keyboard.press('Enter');
  const ok = await navigated;
  await page.waitForLoadState('networkidle').catch(() => {});
  if (!ok || !chosen || new URL(page.url()).pathname !== new URL(chosen, page.url()).pathname) failures.push(`Enter neotevře vybraný výsledek (${chosen})`);
}

// Průzkumník glosáře: výběr kategorie zúží karty hesel, zrušení filtru je vrátí.
async function facet(page, failures) {
  const cards = page.locator('#pruzkumnik-glosare section[aria-labelledby^="glosar-l-"] li');
  const total = await cards.count();
  const value = await page.locator('#glosar-cat option').nth(1).getAttribute('value').catch(() => null);
  if (!value) { failures.push('glosář nemá žádnou kategorii k výběru'); return; }
  await page.locator('#glosar-cat').selectOption(value);
  await page.waitForTimeout(400);
  const narrowed = await cards.count();
  if (!(narrowed >= 1 && narrowed < total)) failures.push(`kategorie „${value}“ nezúží hesla (${narrowed} z ${total})`);
  await page.locator('#glosar-cat').selectOption('');
  await page.waitForTimeout(400);
  if (await cards.count() !== total) failures.push('zrušení kategorie nevrátí všechna hesla');
}

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
  // Strukturovaná data: každý blok JSON-LD je platný JSON a stránka má drobečkovou navigaci.
  const ld = await page.evaluate(() => [...document.querySelectorAll('script[type="application/ld+json"]')].map((x) => x.textContent));
  const types = [];
  ld.forEach((text, i) => { try { types.push(JSON.parse(text)['@type']); } catch (e) { failures.push(`JSON-LD ${i + 1} není platný JSON: ${e.message}`); } });
  if (!types.includes('BreadcrumbList')) failures.push(`JSON-LD bez BreadcrumbList (${types.join(', ')})`);
  if (s.interact === 'paleta' && viewport.width < 1024) await drawer(page, failures);
  if (s.interact === 'hledani' && viewport.width >= 1024) await combobox(page, s, failures);
  if (s.interact === 'faseta') await facet(page, failures);
  const overflow = await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
  if (overflow > 0) failures.push(`vodorovné přetečení ${overflow} px`);
  await page.close();
  return failures;
}

async function main() {
  const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');
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
}

module.exports = { FIXED, derived, fromDir };
if (require.main === module) main();
