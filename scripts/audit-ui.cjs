// Audit uživatelského rozhraní: pro každou třídu stránek a šířku okna změří vodorovné přetečení,
// chyby konzole a sítě, porušení WCAG 2.2 AA (axe-core), přenesená data, LCP a CLS a uloží snímky.
// Slouží k porovnání před/po a jako regresní měření; čísla jsou laboratorní, ne terénní.
//
//   zola build -u http://127.0.0.1:1112/kompendium-epistemicke-anihilace -o "$TMPDIR/kea-root/kompendium-epistemicke-anihilace"
//   (cd "$TMPDIR/kea-root" && python3 -m http.server 1112) &
//   PLAYWRIGHT=<playwright-core> AXE=<axe-core/axe.min.js> \
//     node scripts/audit-ui.cjs http://127.0.0.1:1112/kompendium-epistemicke-anihilace <výstupní-složka>
//
// Výstup: <složka>/audit.json (všechna měření) a <složka>/shots/*.png; na stdout souhrn.
const fs = require('node:fs');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');

const base = process.argv[2];
const out = process.argv[3] || 'ui-audit';
const axeSource = fs.readFileSync(process.env.AXE || require.resolve('axe-core/axe.min.js'), 'utf8');

const PAGES = [
  ['home', '/'],
  ['kompendium', '/kompendium/'],
  ['section', '/kompendium/03-zakladni-kategorie/'],
  ['technique', '/kompendium/techniques/ea-1-1-1-selektivni-expozice/'],
  ['long-article', '/kompendium/historical-cases/11-jonestown/'],
  ['glossary', '/glossary/'],
  ['term', '/glossary/charisma/'],
  ['mapa', '/mapa/'],
  ['stav', '/stav/'],
  ['viz', '/kompendium/visualizations/'],
  ['references', '/references/'],
  ['tags', '/tags/'],
  ['404', '/404.html'],
];
const WIDTHS = [320, 375, 768, 1024, 1440, 1920];
const SHOT_WIDTHS = new Set([375, 1440]);

async function measure(browser, name, url, width, scheme) {
  const ctx = await browser.newContext({ viewport: { width, height: 900 }, colorScheme: scheme,
    reducedMotion: 'reduce' });
  const page = await ctx.newPage();
  const errors = [];
  let bytes = 0;
  let requests = 0;
  page.on('pageerror', (e) => errors.push('pageerror: ' + e.message));
  page.on('console', (m) => { if (m.type() === 'error' && !/Failed to load resource/.test(m.text())) errors.push('console: ' + m.text()); });
  page.on('response', async (r) => {
    requests += 1;
    if (r.status() >= 400 && !(name === '404' && r.url().endsWith('/404.html'))) errors.push(r.status() + ' ' + r.url());
    const len = Number(r.headers()['content-length'] || 0);
    if (len) bytes += len;
  });
  await page.addInitScript(() => {
    window.__lcp = 0; window.__cls = 0;
    try {
      new PerformanceObserver((l) => { for (const e of l.getEntries()) window.__lcp = e.startTime; })
        .observe({ type: 'largest-contentful-paint', buffered: true });
      new PerformanceObserver((l) => { for (const e of l.getEntries()) if (!e.hadRecentInput) window.__cls += e.value; })
        .observe({ type: 'layout-shift', buffered: true });
    } catch (e) { /* older engines */ }
  });
  await page.goto(base + url, { waitUntil: 'networkidle', timeout: 90000 });
  await page.waitForTimeout(700);
  const facts = await page.evaluate(() => ({
    overflowX: document.documentElement.scrollWidth - window.innerWidth,
    h1: document.querySelectorAll('h1').length,
    lcp: Math.round(window.__lcp),
    cls: Math.round(window.__cls * 1000) / 1000,
    domNodes: document.getElementsByTagName('*').length,
    fontPx: parseFloat(getComputedStyle(document.querySelector('main') || document.body).fontSize),
    proseWidth: (() => { const f = document.querySelector('.format'); return f ? Math.round(f.getBoundingClientRect().width) : 0; })(),
  }));
  let axe = null;
  if (axeSource && (width === 375 || width === 1440)) {
    await page.addScriptTag({ content: axeSource });
    axe = await page.evaluate(async () => {
      const r = await window.axe.run(document, { runOnly: { type: 'tag', values: ['wcag2a', 'wcag2aa', 'wcag21aa', 'wcag22aa'] } });
      return r.violations.map((v) => ({ id: v.id, impact: v.impact, nodes: v.nodes.length }));
    });
  }
  if (SHOT_WIDTHS.has(width)) {
    await page.screenshot({ path: path.join(out, 'shots', `${name}-${width}-${scheme}.png`) });
  }
  await ctx.close();
  return { name, url, width, scheme, errors, bytes, requests, axe, ...facts };
}

(async () => {
  fs.mkdirSync(path.join(out, 'shots'), { recursive: true });
  const browser = await chromium.launch();
  const results = [];
  for (const [name, url] of PAGES) {
    for (const width of WIDTHS) {
      for (const scheme of ['light', 'dark']) {
        if (scheme === 'dark' && !SHOT_WIDTHS.has(width)) continue;
        results.push(await measure(browser, name, url, width, scheme));
      }
    }
  }
  await browser.close();
  fs.writeFileSync(path.join(out, 'audit.json'), JSON.stringify(results, null, 1));
  const rows = {};
  for (const r of results) {
    const row = rows[r.name] || (rows[r.name] = { overflow: [], errors: 0, axe: {}, kb: 0, lcp: 0, cls: 0, nodes: 0, prose: 0 });
    if (r.overflowX > 0) row.overflow.push(`${r.width}${r.scheme === 'dark' ? 'd' : ''}:+${r.overflowX}`);
    row.errors += r.errors.length;
    for (const v of r.axe || []) row.axe[`${v.id}(${v.impact})`] = Math.max(row.axe[`${v.id}(${v.impact})`] || 0, v.nodes);
    if (r.width === 1440 && r.scheme === 'light') { row.kb = Math.round(r.bytes / 1024); row.lcp = r.lcp; row.cls = r.cls; row.nodes = r.domNodes; row.prose = r.proseWidth; }
  }
  // Gate: any WCAG violation, console/network error, horizontal overflow or CLS above 0.1 fails.
  let failures = 0;
  for (const r of results) {
    if ((r.axe || []).length || r.errors.length || r.overflowX > 0 || r.cls > 0.1) failures += 1;
  }
  process.exitCode = failures ? 1 : 0;
  for (const [name, row] of Object.entries(rows)) {
    console.log(`${name.padEnd(13)} kB=${String(row.kb).padStart(5)} lcp=${row.lcp}ms cls=${row.cls} dom=${row.nodes} prose=${row.prose}px errors=${row.errors}`
      + ` overflow=[${row.overflow.join(' ')}] axe=${JSON.stringify(row.axe)}`);
  }
  console.log(failures ? `audit: FAIL — ${failures} measurement(s) with findings` : 'audit: all clean');
})();
