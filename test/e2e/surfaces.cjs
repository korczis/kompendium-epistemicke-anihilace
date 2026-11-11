#!/usr/bin/env node
// Gate interaktivních ploch: ověří na sestaveném webu, že grafy a komponenty skutečně
// vykreslují (ne jen že stránka vrací 200), že nejsou chyby v konzoli a že na telefonu
// (390 px) nic nepřetéká do šířky. Prázdný graf je chyba, ne úspěch.
//
// Použití: BASE_URL=http://127.0.0.1:18790/ [SITE_DIR=<sestavený web>] [ONLY=<regexp cesty>]
//          node test/e2e/surfaces.cjs
// (web sestavený s --base-url na tutéž adresu). Playwright: PLAYWRIGHT=<cesta k playwright-core>.
//
// Jako modul (bez prohlížeče): require('./test/e2e/surfaces.cjs') vrací { FIXED, derived,
// fromDir }. derived(load) vrací odvozené scénáře, které by běh použil; load(cesta) vrací text
// souboru webu, výchozí čte z BASE_URL, fromDir('public') ze sestaveného adresáře.
'use strict';

const fs = require('fs');
const path = require('path');
const { execFileSync } = require('node:child_process');

const BASE = (process.env.BASE_URL || 'http://127.0.0.1:18790/').replace(/\/?$/, '/');

// Pevné plochy aplikace. Stránky obsahu se vybírají až za běhu z odvozeného grafu
// (static/data/graph.json), aby test nezastaral, když se obsah přepíše nebo přejmenuje.
const FIXED = [
  { path: '', painted: 2, counts: [['a[href^="tel:"]', 3], ['#upozorneni-title', 1], ['[data-landing-block]', 4]], interact: 'landing', note: 'úvod: p5 síť pojmů, upozornění, rizika, karusel, přehled knihy (ECharts)' },
  { path: 'kompendium/02-uvod/v-kostce/', painted: 0, interact: 'kostka', note: 'vrstvy a model eskalace' },
  { path: 'mapa/', painted: 1, text: '[x-text="stats"]', note: 'Mapa knihy (cytoscape)' },
  { path: 'stav/', painted: 5, count: ['#stav-kpi > *', 8], note: 'Stav knihy (ECharts)' },
  { path: 'matice/', painted: 1, note: 'matice případů a technik (ECharts)' },
  { path: 'osy/', painted: 1, note: 'osy knihy: publikum × pilíř (ECharts)' },
  { path: 'osy/?publikum=klinik&pilir=rozpoznani', painted: 1, count: ['[data-osy-seznam] a[href]', 1], note: 'osy knihy: výběr z adresy vypíše stránky průniku' },
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

// Stav adresy webu (200/404). Se SITE_DIR z disku: Node fetch proti http.server v CI shazoval
// proces (undici assert(!this.paused), běhy 42810123032 a 2842943b), kontrola odkazů úvodu
// dělala požadavek za každý odkaz.
const BASE_PATH = new URL(BASE).pathname;
async function siteStatus(absUrl) {
  if (process.env.SITE_DIR) {
    const u = new URL(absUrl);
    let rel = decodeURIComponent(u.pathname);
    rel = rel.startsWith(BASE_PATH) ? rel.slice(BASE_PATH.length) : rel.replace(/^\//, '');
    const file = path.join(process.env.SITE_DIR, rel === '' || rel.endsWith('/') ? rel + 'index.html' : rel);
    return fs.existsSync(file) ? 200 : 404;
  }
  return (await fetch(absUrl)).status;
}
const siteJson = async (rel) => (process.env.SITE_DIR
  ? JSON.parse(fs.readFileSync(path.join(process.env.SITE_DIR, rel), 'utf8'))
  : (await fetch(BASE + rel)).json());

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
  // Odvozené pohledy (static/js/viz/oddil-prehled.js, protokol-tok.js, techniky-rozptyl.js,
  // teorie-pojmy.js, pripad-faze.js): stránka z grafu, pohled se ověří v jejím sestaveném HTML.
  const inDeg = {};
  g.edges.forEach((e) => { inDeg[e[1]] = (inDeg[e[1]] || 0) + 1; });
  const ranked = (section) => g.nodes.filter((n) => n.section === section && !/_index\.md$/.test(n.path))
    .sort((a, b) => (inDeg[b.id] || 0) - (inDeg[a.id] || 0));
  const index = (section) => g.nodes.filter((n) => n.path === section + '/_index.md');
  const firstWith = async (nodes, ...markers) => {
    for (const n of nodes) {
      const html = await load(page(n)).catch(() => '');
      if (markers.every((m) => html.includes(m))) return n;
    }
    return null;
  };
  const views = [
    ['oddil-prehled', index('kompendium/emergency-protocols'), [], 'treemap rozsahu a stavu stránek oddílu'],
    ['protokol-tok', ranked('kompendium/emergency-protocols'), [], 'tok rozhodovacích bodů nejodkazovanějšího protokolu'],
    ['techniky-rozptyl', index('kompendium/techniques'), [], 'rizikový profil rodin technik'],
    ['teorie-pojmy', ranked('kompendium/07-teoreticke-reflexe'), [], 'graf pojmů nejodkazovanější teoretické reflexe'],
    ['pripad-faze', ranked('kompendium/case-studies'), ['<th>Fáze</th>'], 'fáze kazuistiky z tabulky časové osy'],
    ['pripad-faze', ranked('kompendium/case-studies'), ['<strong>S1 '], 'stupně intervence S1–S5 kazuistiky'],
  ];
  for (const [pohled, nodes, markers, note] of views) {
    const n = await firstWith(nodes, `data-pohled="${pohled}"`, ...markers);
    if (n) out.push({ path: page(n), painted: 1, pohled, note: 'pohled ' + pohled + ': ' + note });
    else out.push({ path: nodes[0] ? page(nodes[0]) : '', painted: 0, pohled, missing: true, note: 'pohled ' + pohled + ': ' + note });
  }
  // První stránka knihy, jejíž HTML obsahuje diagram Mermaid (hledá se v sestaveném webu).
  for (const n of g.nodes) {
    if (!n.path.startsWith('kompendium/')) continue;
    const html = await load(page(n)).catch(() => '');
    if (html.includes('data-lang="mermaid"')) { out.push({ path: page(n), painted: 0, mermaid: 1, note: 'stránka s diagramem Mermaid' }); break; }
  }
  // Třída stránek (oddíl, graph.json section) bez scénáře na vlastní stránce: její
  // nejodkazovanější stránka (při shodě podle cesty), jejíž sestavené HTML vykresluje pohled.
  // Třída bez pohledu scénář nedostane a scripts/build-surfaces.py ji hlásí jako mezeru.
  const sectionOf = Object.fromEntries(g.nodes.map((n) => [page(n), n.section]));
  const tested = new Set(FIXED.concat(out).map((s) => sectionOf[s.path]).filter(Boolean));
  const byRank = (a, b) => (inDeg[b.id] || 0) - (inDeg[a.id] || 0) || (a.path < b.path ? -1 : a.path > b.path ? 1 : 0);
  for (const section of [...new Set(g.nodes.map((n) => n.section))].sort()) {
    if (tested.has(section)) continue;
    for (const n of g.nodes.filter((x) => x.section === section).sort(byRank)) {
      const s = classView(await load(page(n)).catch(() => ''));
      if (s) { out.push({ path: page(n), ...s, note: `třída ${section}: ${s.note}` }); break; }
    }
  }
  return out;
}

// Pohled třídy v sestaveném HTML stránky (jako views_of ve scripts/build-surfaces.py, bez
// obecného okolí a přehledu oddílu) a kontrola, že se vykreslil: odvozený pohled (pohled-graf)
// dojde do stavu „hotovo“ s textovou podobou a ovládáním, plátna grafů (chart_inline,
// viz_script) jsou vykreslená, diagramy Mermaid mají SVG. Bez pohledu vrací null.
function classView(html) {
  const canvases = (html.match(/<canvas\b/g) || []).length;
  const pohled = (html.match(/data-pohled="([\w-]+)"/) || [])[1];
  if (pohled) return { painted: canvases + 1, pohled, note: 'pohled ' + pohled };
  const charts = html.includes('data-chart="') || /\/js\/kompendium\/[\w-]+\.js/.test(html);
  if (charts && canvases) return { painted: canvases, note: `vykreslená plátna grafů (${canvases})` };
  const diagrams = (html.match(/data-lang="mermaid"/g) || []).length;
  if (diagrams) return { painted: 0, mermaid: diagrams, note: `diagramy Mermaid (${diagrams})` };
  return null;
}

let SURFACES = FIXED;

// Nerozpracované stránky podle brány informační architektury (scripts/check-ia.py: pravidla
// „detail“ a „generated“), jako adresy webu. Úvodní stránka na ně nesmí vést z karet ani akcí.
function weakUrls(g) {
  const root = path.resolve(__dirname, '..', '..');
  const list = (rule) => execFileSync('python3', ['scripts/check-ia.py', '--list', rule], { cwd: root, encoding: 'utf8' })
    .split('\n').filter(Boolean).map((p) => p.replace(/^content\//, ''));
  const weak = new Set(list('detail').concat(list('generated')));
  return new Set(g.nodes.filter((n) => weak.has(n.path)).map((n) => '/' + zolaPath(n.url)));
}

// Úvodní stránka: každá karta ve slotech úvodu je právě jeden odkaz na existující, rozpracovanou
// stránku; karusel se sám neposouvá (ani s prefers-reduced-motion), ovládání mění snímek
// a indikátor nese aria-current; přehled knihy vykreslí graf, šipka vybere pole a Enter ho
// otevře; tlačítko hledání otevře paletu.
async function landing(page, browser, viewport, failures) {
  const basePath = new URL(BASE).pathname.replace(/\/$/, '');
  const g = await siteJson('data/graph.json');
  const weak = weakUrls(g);
  // Karty a akce: jeden ovládací prvek, žádný vnořený, cíl existuje a není rozpracovaný.
  const cards = await page.$$eval('[data-landing-cards] > li, [data-landing-card], [data-landing-actions] > a', (els) => els.map((el) => {
    const targets = el.matches('a, button') ? [el] : [...el.querySelectorAll('a[href], button')];
    const nested = targets.some((x) => x.querySelector('a, button'));
    return { n: targets.length, nested, href: targets[0] && targets[0].getAttribute('href'), abs: targets[0] && targets[0].href, text: el.textContent.trim().slice(0, 50) };
  }));
  if (cards.length < 20) failures.push(`úvod: jen ${cards.length} karet ve slotech`);
  for (const c of cards) {
    if (c.n !== 1 || c.nested) failures.push(`karta „${c.text}“ má ${c.n} ovládacích prvků${c.nested ? ' (vnořené)' : ''}`);
  }
  // Každý odkaz ve slotech (karty, akce i odkazy v próze) vede na existující, rozpracovanou stránku.
  const links = await page.$$eval('[data-landing-block] a[href]', (els) => els.map((a) => [a.href, a.textContent.trim().slice(0, 50)]));
  const seen = new Set();
  for (const [abs, text] of links) {
    if (!abs.startsWith(new URL(BASE).origin)) continue;
    const u = new URL(abs);
    const rel = u.pathname.slice(basePath.length);
    if (weak.has(rel)) failures.push(`odkaz „${text}“ vede na nerozpracovanou stránku ${rel}`);
    if (seen.has(u.pathname)) continue;
    seen.add(u.pathname);
    const status = await siteStatus(u.origin + u.pathname);
    if (status !== 200) failures.push(`odkaz „${text}“: ${status} ${u.pathname}`);
  }
  // Karusel: statický (bez automatického posunu), jeden viditelný snímek, ovládání ho mění.
  const car = page.locator('[data-landing-carousel]');
  if (await car.locator('[data-carousel]').getAttribute('data-carousel') !== 'static') failures.push('karusel se posouvá sám (data-carousel není „static“)');
  const visible = () => car.locator('[data-carousel-item]').evaluateAll((els) => els.map((e, i) => [i, getComputedStyle(e).display !== 'none' && getComputedStyle(e).visibility !== 'hidden']).filter((x) => x[1]).map((x) => x[0]));
  const current = () => car.locator('[data-carousel-slide-to][aria-current="true"]').getAttribute('data-carousel-slide-to');
  const slides = await car.locator('[data-carousel-item]').count();
  if (slides < 2) failures.push(`karusel má ${slides} snímků`);
  else {
    if (JSON.stringify(await visible()) !== '[0]') failures.push(`karusel: na začátku je vidět ${JSON.stringify(await visible())}, ne první snímek`);
    await car.locator('[data-carousel-next]').click();
    await page.waitForTimeout(900);
    if (JSON.stringify(await visible()) !== '[1]' || await current() !== '1') failures.push(`karusel: „další“ neukáže druhý snímek (vidět ${JSON.stringify(await visible())}, aria-current ${await current()})`);
    await car.locator('[data-carousel-slide-to="0"]').click();
    await page.waitForTimeout(900);
    if (JSON.stringify(await visible()) !== '[0]' || await current() !== '0') failures.push('karusel: indikátor nevrátí první snímek');
    // Fokus klávesnice nepadne do karty mimo záběr: odkazy skrytých snímků nejsou viditelné.
    const hiddenFocusable = await car.locator('[data-carousel-item]').evaluateAll((els) => els.filter((e) => getComputedStyle(e).display === 'none' || getComputedStyle(e).visibility === 'hidden')
      .flatMap((e) => [...e.querySelectorAll('a')]).filter((a) => a.checkVisibility && a.checkVisibility({ visibilityProperty: true })).length);
    if (hiddenFocusable) failures.push(`karusel: ${hiddenFocusable} odkazů ve skrytých snímcích je viditelných`);
  }
  // Bez automatického posunu ani s prefers-reduced-motion: snímek se za 4 s nezmění.
  const rm = await browser.newPage({ viewport, reducedMotion: 'reduce' });
  await rm.goto(BASE, { waitUntil: 'networkidle' });
  const before = await rm.locator('[data-carousel-slide-to][aria-current="true"]').getAttribute('data-carousel-slide-to');
  await rm.waitForTimeout(4000);
  const after = await rm.locator('[data-carousel-slide-to][aria-current="true"]').getAttribute('data-carousel-slide-to');
  if (before !== '0' || after !== '0') failures.push(`karusel s prefers-reduced-motion se posunul (${before} → ${after})`);
  await rm.close();
  // Hledání: tlačítko v přehledu otevře existující paletu.
  await page.locator('[data-prehled] [data-paleta-open]').click();
  const dialog = page.locator('#paleta [role="dialog"]');
  await dialog.waitFor({ state: 'visible', timeout: 5000 }).catch(() => failures.push('tlačítko hledání neotevřelo paletu'));
  await page.keyboard.press('Escape');
  // Přehled knihy: graf je vykreslený, šipka vybere první pole seznamu, Enter ho otevře.
  const chart = page.locator('[data-prehled-chart]');
  await chart.scrollIntoViewIfNeeded();
  await page.waitForSelector('[data-prehled-chart][data-prehled-ready]', { timeout: 10000 }).catch(() => failures.push('přehled knihy se nevykreslil'));
  const first = await page.locator('[data-prehled-item]').first().evaluate((a) => a.href);
  await chart.focus();
  await page.keyboard.press('ArrowRight');
  const picked = await chart.getAttribute('data-prehled-current-url');
  const said = (await page.locator('[data-prehled-current]').textContent() || '').trim();
  if (picked !== first) failures.push(`přehled: šipka vybrala ${picked}, ne první položku seznamu ${first}`);
  if (!said) failures.push('přehled: výběr se neoznámí (prázdný popisek)');
  if (picked) {
    await Promise.all([page.waitForURL(picked, { timeout: 10000 }).catch(() => {}), page.keyboard.press('Enter')]);
    if (page.url() !== picked) failures.push(`přehled: Enter neotevřel ${picked} (${page.url()})`);
    await page.goBack({ waitUntil: 'networkidle' });
  }
}

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
  await page.waitForLoadState('networkidle', { timeout: 10000 }).catch(() => {});
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

// Odvozený pohled: vykreslí se, má textovou podobu s odkazy, šipka vybere položku a Enter
// přejde tam, kam ukazuje (stránka, řádek tabulky nebo filtr katalogu).
async function view(page, s, failures) {
  if (s.missing) { failures.push(`žádná stránka nenese pohled ${s.pohled}`); return; }
  const root = page.locator(`[data-pohled="${s.pohled}"]`).first();
  await root.scrollIntoViewIfNeeded().catch(() => {});
  const stav = await page.waitForFunction((p) => {
    const r = document.querySelector(`[data-pohled="${p}"]`);
    return r && r.getAttribute('data-pohled-stav');
  }, s.pohled, { timeout: 15000 }).then((h) => h.jsonValue(), () => null);
  if (stav !== 'hotovo') { failures.push(`pohled ${s.pohled}: stav „${stav}“, ne „hotovo“`); return; }
  const links = await root.locator('[data-pohled-seznam] li a[href]').count();
  if (links < 1) failures.push(`pohled ${s.pohled}: textová podoba nemá odkazy`);
  const graf = root.locator('[data-pohled-graf]');
  await graf.focus();
  await page.keyboard.press('ArrowRight');
  const cil = await graf.getAttribute('data-pohled-cil');
  if (!cil) { failures.push(`pohled ${s.pohled}: šipka nevybrala položku`); return; }
  const want = new URL(cil, page.url()).href;
  await Promise.all([page.waitForURL(want, { timeout: 10000 }).catch(() => {}), page.keyboard.press('Enter')]);
  if (page.url() !== want) failures.push(`pohled ${s.pohled}: Enter nepřešel na ${want} (${page.url()})`);
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

// Projede stránku po 600 px, aby se líné pohledy vykreslily. Výšku čte znovu (pohled pod ním
// stránku prodlouží a i ten se má vykreslit), ale nejvýš 400 kroků (240 000 px, 40 s):
// page.evaluate nemá timeout a smyčka, kterou rostoucí stránka nikdy nedožene, zasekla gate
// v CI na 51 minut (běh 42814054658; nalezla session 2e).
async function scrollThrough(page) {
  await page.evaluate(async () => {
    const STEP = 600;
    const MAX_STEPS = 400;
    for (let i = 0; i < MAX_STEPS && i * STEP < document.body.scrollHeight; i += 1) {
      window.scrollTo(0, i * STEP);
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
  if (s.interact === 'landing') await landing(page, browser, viewport, failures);
  const overflow = await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
  if (overflow > 0) failures.push(`vodorovné přetečení ${overflow} px`);
  if (s.pohled) await view(page, s, failures);
  await page.close();
  return failures;
}

async function main() {
  const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');
  // SITE_DIR=<sestavený web>: odvozené scénáře čte z disku, ne přes HTTP. Smyčka přes stránky
  // (hledání Mermaid) tak nedělá stovky požadavků na http.server; jeden z nich v CI shodil
  // Node (undici: assert(!this.paused), běh 42810123032).
  SURFACES = FIXED.concat(await derived(process.env.SITE_DIR ? fromDir(process.env.SITE_DIR) : undefined));
  // ONLY=<regexp cesty>: jen vybrané plochy (ladění; gate běží bez něj).
  if (process.env.ONLY) SURFACES = SURFACES.filter((s) => new RegExp(process.env.ONLY).test('/' + s.path));
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
