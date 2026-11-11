#!/usr/bin/env node
// Audit přístupnosti a rozvržení: pro každou třídu stránek při 375 a 1440 px, ve světlém
// i tmavém tématu změří porušení WCAG 2.2 AA (axe-core), chyby konzole a sítě, vodorovné
// přetečení, CLS a přenesená data (přetečení a chyby navíc při 320, 768, 1024 a 1920 px); nakonec ověří každý interní odkaz, který stránky vykreslily
// (a každou adresu rejstříku hledání). Brána: jakýkoli nález (porušení axe, chyba, přetečení,
// CLS nad 0,1, odkaz se stavem 400+ nebo bez základní cesty) ukončí běh kódem 1.
//
// Stránky obsahu se vybírají za běhu z odvozeného grafu (static/data/graph.json), stejně
// jako v test/e2e/surfaces.cjs, takže audit nezastará, když se obsah přejmenuje.
//
// Použití: BASE_URL=http://127.0.0.1:18790/kompendium-epistemicke-anihilace/ \
//            node scripts/audit-ui.cjs [--json <soubor>] [--shots <složka>] [--only <regexp jména>]
// (web sestavený s --base-url na tutéž adresu; scripts/verify-all.sh to dělá sám).
// Playwright: PLAYWRIGHT=<cesta k playwright-core>; axe-core: AXE=<cesta k axe.min.js>.
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');

const BASE = (process.env.BASE_URL || 'http://127.0.0.1:18790/').replace(/\/?$/, '/');
const AXE = fs.readFileSync(process.env.AXE || require.resolve('axe-core/axe.min.js'), 'utf8');
const args = process.argv.slice(2);
const opt = (name) => { const i = args.indexOf(name); return i === -1 ? null : args[i + 1]; };
const JSON_OUT = opt('--json');
const SHOTS = opt('--shots');
const ONLY = opt('--only') ? new RegExp(opt('--only')) : null;  // jen třídy stránek podle jména
const TAGS = ['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'];
const RUNS = [[375, 'light'], [375, 'dark'], [1440, 'light'], [1440, 'dark']];
// Další šířky jen na vodorovné přetečení a chyby (bez axe): pravidlo project.ui-quality-gate
// žádá rozvržení bez přetečení od 320 do 1920 px.
const LAYOUT_WIDTHS = [320, 768, 1024, 1920];
const CLS_LIMIT = 0.1;

// Plochy aplikace (šablony, ne obsah) a jedna stránka za každou třídu obsahu.
const FIXED = [
  ['úvod', ''],
  ['obsah', 'kompendium/'],
  ['průzkumník technik', 'kompendium/techniques/'],
  ['časová osa', 'kompendium/historical-cases/'],
  ['glosář', 'glossary/'],
  ['mapa', 'mapa/'],
  ['stav', 'stav/'],
  ['matice', 'matice/'],
  ['vizualizace', 'kompendium/visualizations/'],
  ['reference', 'references/'],
  ['štítky', 'tags/'],
  ['404', '404.html'],
];

function inDegree(g) {
  const d = {};
  g.edges.forEach((e) => { d[e[1]] = (d[e[1]] || 0) + 1; });
  return d;
}

// Adresa, na které Zola stránku servíruje (bez diakritiky, malými písmeny), z cesty v grafu.
const zolaPath = (url) => url.split('/').filter(Boolean)
  .map((s) => s.normalize('NFKD').replace(/[\u0300-\u036f]/g, '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, ''))
  .map((s) => s + '/').join('');

async function derived() {
  const g = await siteJson('data/graph.json');
  const deg = inDegree(g);
  const url = (n) => zolaPath(n.url);
  const pages = g.nodes.filter((n) => !/_index\.md$/.test(n.path));
  const best = (list) => list.slice().sort((a, b) => (deg[b.id] || 0) - (deg[a.id] || 0) || a.id - b.id)[0];
  const out = [];
  const tech = best(pages.filter((n) => n.section === 'kompendium/techniques'));
  if (tech) out.push(['technika', url(tech)]);
  const term = best(pages.filter((n) => n.section === 'glossary'));
  if (term) out.push(['heslo', url(term)]);
  const chapter = best(g.nodes.filter((n) => /^kompendium\/\d[^/]*\/_index\.md$/.test(n.path)));
  if (chapter) out.push(['kapitola', url(chapter)]);
  const long = pages.filter((n) => n.path.startsWith('kompendium/')).sort((a, b) => b.words - a.words)[0];
  if (long) out.push(['dlouhý článek', url(long)]);
  return out;
}

async function measure(browser, name, rel, width, scheme, full = true) {
  const ctx = await browser.newContext({ viewport: { width, height: 900 }, colorScheme: scheme, reducedMotion: 'reduce' });
  const page = await ctx.newPage();
  const origin = new URL(BASE).origin;
  const errors = [];
  let bytes = 0;
  page.on('pageerror', (e) => errors.push('chyba stránky: ' + e.message));
  page.on('console', (m) => { if (m.type() === 'error') errors.push('konzole: ' + m.text().slice(0, 160)); });
  page.on('response', (r) => {
    if (r.status() >= 400 && r.url().startsWith(origin)) errors.push(r.status() + ' ' + r.url());
    bytes += Number(r.headers()['content-length'] || 0);
  });
  await page.addInitScript(() => {
    window.__cls = 0;
    window.__shifts = [];
    const describe = (n) => {
      if (!n || !n.tagName) return '?';
      const id = n.id ? '#' + n.id : '';
      const cls = typeof n.className === 'string' ? '.' + n.className.trim().split(/\s+/).slice(0, 3).join('.') : '';
      return n.tagName.toLowerCase() + id + (id ? '' : cls);
    };
    try {
      new PerformanceObserver((l) => {
        for (const e of l.getEntries()) {
          if (e.hadRecentInput) continue;
          window.__cls += e.value;
          window.__shifts.push({ value: e.value, nodes: (e.sources || []).map((x) => describe(x.node)) });
        }
      }).observe({ type: 'layout-shift', buffered: true });
    } catch (e) { /* starší prohlížeč */ }
  });
  const res = await page.goto(BASE + rel, { waitUntil: 'networkidle', timeout: 90000 });
  if (!res || res.status() !== 200) errors.push('HTTP ' + (res && res.status()));
  await page.waitForTimeout(800);
  const facts = await page.evaluate(() => ({
    overflow: document.documentElement.scrollWidth - window.innerWidth,
    cls: Math.round(window.__cls * 1000) / 1000,
    shifts: window.__shifts.sort((x, y) => y.value - x.value).slice(0, 3)
      .map((x) => Math.round(x.value * 1000) / 1000 + ' ' + x.nodes.slice(0, 3).join(', ')),
  }));
  if (!full) {
    await ctx.close();
    return { name, path: rel, width, scheme, errors, kb: Math.round(bytes / 1024), axe: [], hrefs: [], ...facts };
  }
  const hrefs = await page.evaluate(() => [...document.querySelectorAll('a[href]')].map((a) => [a.getAttribute('href'), a.href]));
  await page.addScriptTag({ content: AXE });
  const axe = await page.evaluate(async (tags) => {
    const r = await window.axe.run(document, { runOnly: { type: 'tag', values: tags } });
    return r.violations.map((v) => ({ id: v.id, impact: v.impact, nodes: v.nodes.length,
      targets: v.nodes.slice(0, 3).map((n) => n.target.join(' ')) }));
  }, TAGS);
  if (SHOTS) {
    fs.mkdirSync(SHOTS, { recursive: true });
    await page.screenshot({ path: path.join(SHOTS, `${name.replace(/\W+/g, '-')}-${width}-${scheme}.png`) });
  }
  await ctx.close();
  return { name, path: rel, width, scheme, errors, kb: Math.round(bytes / 1024), axe, hrefs, ...facts };
}

// Odkazy vykreslené šablonami a skripty (sidebar, štítky, související pojmy, drobečky,
// předchozí/další, výsledky hledání a palety): každý interní odkaz musí vést na existující
// stránku a nést produkční základní cestu (jinak se na GitHub Pages rozbije).
const LINKS = new Map();  // adresa bez fragmentu -> stránka, kde se našla
const LINK_FAILURES = [];
const fail = (m) => { if (!LINK_FAILURES.includes(m)) LINK_FAILURES.push(m); };
const BASE_PATH = new URL(BASE).pathname;
// SITE_DIR=<sestavený web>: stav odkazů a data čte z disku. Tisíce požadavků HEAD (16 souběžně)
// proti http.server jsou v CI riziko pádu Node (undici assert(!this.paused)); stejný soubor
// na disku je stejný důkaz, že adresa existuje.
function siteFile(absUrl) {
  let rel = decodeURIComponent(new URL(absUrl).pathname);
  rel = rel.startsWith(BASE_PATH) ? rel.slice(BASE_PATH.length) : rel.replace(/^\//, '');
  return path.join(process.env.SITE_DIR, rel === '' || rel.endsWith('/') ? rel + 'index.html' : rel);
}
const siteJson = async (rel) => (process.env.SITE_DIR
  ? JSON.parse(fs.readFileSync(path.join(process.env.SITE_DIR, rel), 'utf8'))
  : (await fetch(BASE + rel)).json());

function collect(r) {
  const origin = new URL(BASE).origin;
  for (const [raw, abs] of r.hrefs) {
    if (!abs.startsWith(origin)) continue;
    if (raw.startsWith('/') && !raw.startsWith(BASE_PATH)) fail(`/${r.path}: odkaz bez základní cesty ${raw}`);
    const u = new URL(abs);
    // Zola servíruje cesty malými písmeny bez diakritiky a GitHub Pages rozlišuje velikost
    // písmen; místní souborový systém (macOS) by takový odkaz omylem obsloužil.
    const p = decodeURIComponent(u.pathname);
    if (p !== p.toLowerCase() || /[^\x00-\x7f]/.test(p)) fail(`/${r.path}: odkaz mimo tvar adres Zoly (velká písmena nebo diakritika) ${raw}`);
    u.hash = '';
    u.search = '';
    if (!LINKS.has(u.href)) LINKS.set(u.href, '/' + r.path);
  }
}

async function checkLinks() {
  const idx = await siteJson('data/search.json');
  const urlField = idx.fields.indexOf('url');
  idx.entries.forEach((e) => {
    const u = new URL(BASE_PATH.replace(/\/$/, '') + e[urlField], BASE).href;
    if (!LINKS.has(u)) LINKS.set(u, 'data/search.json');
  });
  const queue = [...LINKS.entries()];
  async function worker() {
    while (queue.length) {
      const [url, from] = queue.shift();
      const res = process.env.SITE_DIR
        ? { status: fs.existsSync(siteFile(url)) ? 200 : 404 }
        : await fetch(url, { method: 'HEAD' }).catch((e) => ({ status: 0, statusText: e.message }));
      if (res.status >= 400 || res.status === 0) fail(`${res.status} ${url} (odkaz z ${from})`);
    }
  }
  // Z disku souběh nevadí; přes síť nejvýš 4 požadavky naráz (16 souběžných HEAD shodilo Node,
  // undici assert(!this.paused); upozornila session 2e).
  await Promise.all(Array.from({ length: process.env.SITE_DIR ? 16 : 4 }, worker));
  return LINKS.size;
}

(async () => {
  const pages = FIXED.concat(await derived()).filter(([name]) => !ONLY || ONLY.test(name));
  const browser = await chromium.launch();
  const results = [];
  let failed = 0;
  for (const [name, rel] of pages) {
    for (const [width, scheme, full] of RUNS.map((x) => x.concat(true)).concat(LAYOUT_WIDTHS.map((w) => [w, 'light', false]))) {
      const r = await measure(browser, name, rel, width, scheme, full);
      results.push(r);
      collect(r);
      delete r.hrefs;
      const findings = r.axe.map((v) => `axe ${v.id} (${v.impact}) ×${v.nodes}: ${v.targets.join(' | ')}`)
        .concat(r.errors, r.overflow > 0 ? [`vodorovné přetečení ${r.overflow} px`] : [],
          r.cls > CLS_LIMIT ? [`CLS ${r.cls} > ${CLS_LIMIT}; největší posuny: ${r.shifts.join(' | ')}`] : []);
      const label = `/${rel} (${name}, ${width}/${scheme === 'dark' ? 'tmavý' : 'světlý'}${full ? '' : ', jen rozvržení'}) cls=${r.cls} ${r.kb} kB`;
      if (findings.length) { failed += 1; console.log(`FAIL ${label}`); findings.forEach((f) => console.log('     ' + f)); }
      else console.log(`ok   ${label}`);
    }
  }
  await browser.close();
  const checked = await checkLinks();
  LINK_FAILURES.forEach((f) => console.log('FAIL odkaz ' + f));
  console.log(`odkazy: ${checked} interních adres ověřeno, ${LINK_FAILURES.length} nálezů`);
  if (LINK_FAILURES.length) failed += 1;
  if (JSON_OUT) fs.writeFileSync(JSON_OUT, JSON.stringify(results, null, 1));
  const byRule = {};
  results.forEach((r) => r.axe.forEach((v) => { byRule[v.id] = (byRule[v.id] || 0) + v.nodes; }));
  const rules = Object.keys(byRule).sort().map((k) => `${k}=${byRule[k]}`).join(' ');
  console.log(`audit: ${results.length - failed}/${results.length} bez nálezu` + (rules ? `; axe uzly podle pravidla: ${rules}` : ''));
  process.exit(failed ? 1 : 0);
})();
