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
// Přetečení (dokument i #main-content, který v Pro shellu roluje) a jeden levý okraj nadpisu
// a textu: společná definice s auditem (scripts/audit-ui.cjs).
const { measureLayout, layoutFindings } = require('./layout.cjs');

// Pevné plochy aplikace. Stránky obsahu se vybírají až za běhu z odvozeného grafu
// (static/data/graph.json), aby test nezastaral, když se obsah přepíše nebo přejmenuje.
const FIXED = [
  { path: '', painted: 2, counts: [['a[href^="tel:"]', 3], ['#upozorneni-title', 1], ['[data-landing-block]', 4]], interact: 'landing', note: 'úvod: p5 síť pojmů, upozornění, rizika, karusel, přehled knihy (ECharts)' },
  { path: 'kompendium/02-uvod/v-kostce/', painted: 0, interact: 'kostka', note: 'vrstvy a model eskalace' },
  { path: 'mapa/', painted: 1, text: '[x-text="stats"]', maxLink: true, note: 'Mapa knihy (síť ECharts)' },
  { path: 'stav/', painted: 5, count: ['#stav-kpi > *', 8], maxLink: true, note: 'Stav knihy (ECharts)' },
  { path: 'matice/', painted: 1, maxLink: true, note: 'matice případů a technik (ECharts)' },
  { path: 'osy/', painted: 1, maxLink: true, note: 'osy knihy: publikum × pilíř (ECharts)' },
  { path: 'osy/?publikum=klinik&pilir=rozpoznani', painted: 1, count: ['[data-osy-seznam] a[href]', 1], note: 'osy knihy: výběr z adresy vypíše stránky průniku' },
  { path: 'galerie/', painted: 3, maxLink: true, note: 'Galerie (p5)' },
  { path: 'kompendium/techniques/', painted: 1, note: 'průzkumník technik' },
  { path: 'kompendium/historical-cases/', painted: 1, note: 'časová osa historických případů' },
  { path: 'glossary/', painted: 1, interact: 'faseta', note: 'průzkumník glosáře: kategorie' },
  { path: 'kompendium/08-prilohy/index-pojmu/', painted: 1, count: ['[data-rj-item]', 2], interact: 'rejstrik', note: 'interaktivní rejstřík pojmů (ECharts)' },
  { path: 'tags/', painted: 1, note: 'štítky (treemap)' },
  { path: 'kompendium/case-studies/', painted: 1, note: 'přehled oddílu' },
  { path: 'kompendium/visualizations/', painted: 8, note: 'vizualizace knihy (ECharts, p5)' },
  { path: 'kompendium/nlp-vzorce/', painted: 1, note: 'průzkumník katalogu NLP (ECharts graf vazeb)' },
  { path: 'kompendium/nlp-vzorce/milton-model/', painted: 1, note: 'průzkumník rodiny katalogu s předvybranou rodinou' },
  { path: 'kompendium/argumentacni-fauly/', painted: 1, note: 'průzkumník katalogu argumentačních faulů' },
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
  // Stupně intervence bez tabulky fází: jen tak pohled dokazuje, že je čte, a ne že ho zachránila
  // tabulka.
  const firstWithout = async (nodes, absent, ...markers) => {
    for (const n of nodes) {
      const html = await load(page(n)).catch(() => '');
      if (markers.every((m) => html.includes(m)) && !html.includes(absent)) return n;
    }
    return null;
  };
  const views = [
    ['oddil-prehled', index('kompendium/emergency-protocols'), [], 'treemap rozsahu a stavu stránek oddílu'],
    ['protokol-tok', ranked('kompendium/emergency-protocols'), [], 'tok rozhodovacích bodů nejodkazovanějšího protokolu'],
    ['techniky-rozptyl', index('kompendium/techniques'), [], 'rizikový profil rodin technik'],
    ['teorie-pojmy', ranked('kompendium/07-teoreticke-reflexe'), [], 'graf pojmů nejodkazovanější teoretické reflexe'],
    ['pripad-faze', ranked('kompendium/case-studies'), ['<th>Fáze</th>'], 'fáze kazuistiky z tabulky časové osy'],
  ];
  for (const [pohled, nodes, markers, note] of views) {
    const n = await firstWith(nodes, `data-pohled="${pohled}"`, ...markers);
    if (n) out.push({ path: page(n), painted: 1, pohled, note: 'pohled ' + pohled + ': ' + note });
    else out.push({ path: nodes[0] ? page(nodes[0]) : '', painted: 0, pohled, missing: true, note: 'pohled ' + pohled + ': ' + note });
  }
  // Stupně intervence S1–S5 na kazuistice bez tabulky fází, jak je stránka napsaná, a táž stránka
  // s fixturou: každý štítek „S<n> – …“ zbavený zvýraznění a první z nich zalomený uprostřed. Pohled
  // musí v obou dojít do stavu „hotovo“ se všemi stupni, které stránka zmiňuje: nesmí záviset na
  // tučném písmu ani na tom, kde editor zalomil řádek.
  const stages = await firstWithout(ranked('kompendium/case-studies'), '<th>Fáze</th>', 'data-pohled="pripad-faze"', 'S1 –');
  for (const fixture of [null, 'plain-stages']) {
    const note = 'pohled pripad-faze: stupně intervence S1–S5 kazuistiky' + (fixture ? ', fixtura bez tučného písma a se zalomením' : '');
    if (stages) out.push({ path: page(stages), painted: 1, pohled: 'pripad-faze', stages: true, fixture, note });
    else out.push({ path: '', painted: 0, pohled: 'pripad-faze', missing: true, note });
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
  // chart_inline je plocha <div data-chart>, do které vrstva vykreslí graf ECharts (plátno).
  const inline = (html.match(/data-chart="/g) || []).length;
  const pohled = (html.match(/data-pohled="([\w-]+)"/) || [])[1];
  if (pohled) return { painted: canvases + inline + 1, pohled, note: 'pohled ' + pohled };
  const charts = inline || /\/js\/kompendium\/[\w-]+\.js/.test(html);
  if (charts && canvases + inline) return { painted: canvases + inline, note: `vykreslená plátna grafů (${canvases + inline})` };
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
// fokus na tlačítko. Ovládá se skutečným ťuknutím, ne jen klávesnicí: 2026-11-11 ležel
// backdrop Flowbite Draweru (z-30) nad sidebarem (z-20) a každé ťuknutí na odkaz drawer jen
// zavřelo, zatímco test fokusu a Escape procházel (.ai/repo/knowledge/curated/
// mobile-drawer-stacking.md). Proto: backdrop je viditelný a leží POD sidebarem, odkazy a
// přepínače skupin v otevřeném draweru přijímají ťuknutí (Playwright trial click hlásí
// „intercepts pointer events“), ťuknutí na skupinu drawer nezavře a ťuknutí mimo něj ano.
async function drawer(page, failures) {
  const state = () => page.evaluate(() => {
    const sb = document.getElementById('sidebar');
    const t = document.getElementById('toggleSidebarMobile');
    return { inert: sb.hasAttribute('inert'), inside: sb.contains(document.activeElement), focus: document.activeElement && document.activeElement.id, expanded: t && t.getAttribute('aria-expanded') };
  });
  if (!(await state()).inert) failures.push('zavřený drawer není inert');
  await page.locator('#toggleSidebarMobile').click();
  await page.waitForTimeout(500);
  const open = await state();
  if (open.inert) failures.push('otevřený drawer zůstal inert');
  if (!open.inside) failures.push('otevření draweru nepřesune fokus dovnitř');
  if (open.expanded !== 'true') failures.push(`otevřený drawer: tlačítko má aria-expanded="${open.expanded}"`);
  const stack = await page.evaluate(() => {
    const bd = document.querySelector('[drawer-backdrop]');
    if (!bd) return null;
    const z = (el) => parseInt(getComputedStyle(el).zIndex, 10) || 0;
    const bg = getComputedStyle(bd).backgroundColor;
    return { backdrop: z(bd), sidebar: z(document.getElementById('sidebar')), transparent: bg === 'rgba(0, 0, 0, 0)' || bg === 'transparent' };
  });
  if (!stack) failures.push('otevřený drawer nemá backdrop');
  else {
    if (stack.backdrop >= stack.sidebar) failures.push(`backdrop (z ${stack.backdrop}) leží nad sidebarem (z ${stack.sidebar}): ťuknutí v draweru ho jen zavře`);
    if (stack.transparent) failures.push('backdrop draweru je průhledný (barva se nevygenerovala)');
  }
  const targets = page.locator('#sidebar a[href]:visible, #sidebar [data-collapse-toggle]:visible');
  const n = Math.min(await targets.count(), 6);
  for (let i = 0; i < n; i++) {
    const err = await targets.nth(i).click({ trial: true, timeout: 2000 }).then(() => null, (e) => e.message.split('\n').find((l) => /intercepts|Timeout/.test(l)) || 'nedostupný');
    if (err) { failures.push(`prvek ${i + 1} v otevřeném draweru nepřijme ťuknutí: ${err.trim()}`); break; }
  }
  const group = page.locator('#sidebar [data-collapse-toggle]:visible').first();
  if (await group.count()) {
    const before = await group.getAttribute('aria-expanded');
    await group.click({ timeout: 2000 }).catch(() => {});
    await page.waitForTimeout(300);
    if ((await group.getAttribute('aria-expanded')) === before) failures.push('ťuknutí na skupinu v draweru ji nerozbalí ani nesbalí');
    if ((await state()).inert) failures.push('ťuknutí na skupinu v draweru drawer zavřelo');
    await group.click({ timeout: 2000 }).catch(() => {});
  }
  const vw = page.viewportSize();
  await page.mouse.click(vw.width - 10, Math.round(vw.height / 2));
  await page.waitForTimeout(500);
  if (!(await state()).inert) failures.push('ťuknutí na backdrop drawer nezavře');
  await page.locator('#toggleSidebarMobile').click();
  await page.waitForTimeout(500);
  await page.keyboard.press('Escape');
  await page.waitForTimeout(500);
  const closed = await state();
  if (!closed.inert) failures.push('drawer zavřený klávesou Escape není inert');
  if (closed.focus !== 'toggleSidebarMobile') failures.push(`po zavření draweru je fokus na „${closed.focus}“, ne na tlačítku`);
  if (closed.expanded !== 'false') failures.push(`zavřený drawer: tlačítko má aria-expanded="${closed.expanded}"`);
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
  if (s.stages) {
    // every stage the intervention section mentions, by its number, is in the list with a name
    const mentioned = await page.evaluate(() => {
      const h = document.querySelector('h2[id*="intervencni-strategie"]');
      if (!h) return [];
      let t = '';
      for (let e = h.nextElementSibling; e && e.tagName !== 'H2'; e = e.nextElementSibling) t += ' ' + e.textContent;
      return [...new Set([...t.replace(/\s+/g, ' ').matchAll(/(^|[^\w])S([1-5])\s*[–-]\s/g)].map((m) => m[2]))].sort();
    });
    const listed = await root.locator('[data-pohled-seznam] li a[href]').evaluateAll((as) =>
      as.map((a) => /^S([1-5]) – \S/.exec(a.textContent.trim())).filter(Boolean).map((m) => m[1]).sort());
    if (mentioned.length < 3) failures.push(`pohled ${s.pohled}: oddíl zmiňuje jen ${mentioned.length} stupně`);
    if (listed.join() !== mentioned.join()) failures.push(`pohled ${s.pohled}: stupně v textu ${mentioned.join()}, v seznamu ${listed.join()}`);
  }
  const graf = root.locator('[data-pohled-graf]');
  await graf.focus();
  await page.keyboard.press('ArrowRight');
  const cil = await graf.getAttribute('data-pohled-cil');
  if (!cil) { failures.push(`pohled ${s.pohled}: šipka nevybrala položku`); return; }
  const want = new URL(cil, page.url()).href;
  await Promise.all([page.waitForURL(want, { timeout: 10000 }).catch(() => {}), page.keyboard.press('Enter')]);
  if (page.url() !== want) failures.push(`pohled ${s.pohled}: Enter nepřešel na ${want} (${page.url()})`);
}

// Ovládání Maximalizovat vrstvy (KompendiumVrstva.frame): první graf stránky se zvětší na celé
// okno a adresa nese #max=<id>, Escape ho vrátí a kotvu smaže. U ploch s maxLink se navíc
// odkaz #max=<id> po načtení znovu otevře maximalizovaný (stav jde poslat odkazem).
async function maximize(page, s, failures) {
  const btn = page.locator('[data-vrstva-max]').first();
  if (!(await btn.count())) {
    if (s.painted > 0 && !s.pohled) failures.push('graf bez ovládání Maximalizovat ([data-vrstva-max])');
    return;
  }
  const id = await btn.getAttribute('data-vrstva-max');
  await btn.click();
  await page.waitForTimeout(400);
  const state = () => page.evaluate((x) => {
    const b = document.querySelector('[data-vrstva-max="' + x + '"]').closest('[data-vrstva-frame]');
    const r = b.getBoundingClientRect();
    return { full: r.top <= 0 && r.left <= 0 && r.width >= window.innerWidth - 1 && r.height >= window.innerHeight - 1,
      hash: window.location.hash, host: b.querySelector('[data-vrstva-max="on"]') !== null };
  }, id);
  let st = await state();
  if (!st.full || st.hash !== '#max=' + id) failures.push(`maximalizace ${id}: celé okno ${st.full}, adresa ${st.hash}`);
  await page.keyboard.press('Escape');
  await page.waitForTimeout(300);
  st = await state();
  if (st.full || /max=/.test(st.hash)) failures.push(`maximalizace ${id}: Escape ji nevrátil (${st.hash})`);
  if (!s.maxLink) return;
  await page.goto(BASE + s.path.split('#')[0] + '#max=' + id, { waitUntil: 'networkidle' });
  await page.waitForTimeout(2500);
  const deep = await page.evaluate((x) => {
    const b = document.querySelector('[data-vrstva-max="' + x + '"]');
    const r = b && b.closest('[data-vrstva-frame]').getBoundingClientRect();
    return !!r && r.width >= window.innerWidth - 1 && r.height >= window.innerHeight - 1;
  }, id);
  if (!deep) failures.push(`odkaz #max=${id} graf po načtení nemaximalizoval`);
  await page.keyboard.press('Escape');
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
  if (s.fixture === 'plain-stages') {
    // the page as served, its stage labels unbolded and the first one wrapped mid-label
    await page.route(BASE + s.path, async (route) => {
      const r = await route.fetch();
      let body = (await r.text()).replace(/<strong>(S[1-5]\s*[–-][^<]*)<\/strong>/g, '$1');
      body = body.replace(/(S1\s*[–-]\s*\S+) /, '$1\n');
      await route.fulfill({ response: r, body });
    });
  }
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
    // Filtr textem: dotaz si test volí sám tak, aby zúžení šlo dokázat — nejdelší slovo (aspoň
    // 4 písmena) prvního hesla, které takové má. Dřív bral první slovo prvního hesla; když glosář
    // začal „A priori“, dotaz „A“ ukazoval všechna hesla a gate padl na obsahu, ne na filtru.
    const shown = () => page.locator('[data-rj-item]:visible').count();
    const all = await page.locator('[data-rj-item]').count();
    const word = await page.locator('[data-rj-title]').evaluateAll((els) => {
      for (const el of els) {
        const words = (el.textContent || '').trim().split(/[^\p{L}\p{N}]+/u).filter((w) => w.length >= 4);
        if (words.length) return words.sort((a, b) => b.length - a.length)[0];
      }
      return '';
    });
    if (!word) failures.push('rejstřík: žádné heslo nemá slovo aspoň o 4 písmenech pro test filtru');
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
  await maximize(page, s, failures);
  layoutFindings(await measureLayout(page), viewport.width).forEach((f) => failures.push(f));
  if (s.pohled) await view(page, s, failures);
  await page.close();
  return failures;
}

// ---- Interakce: osnova, posuvník, řazení, stav v adrese, klávesnice -----------------------------
// Funkční audit 2026-11-18 našel ovládání, které nic nedělalo: osnova stránky nesledovala čtení,
// posuvník galerie při pauze nepřekreslil, hlavičky pracovního seznamu ve Stavu neřadily, filtry
// glosáře, rejstříku a záložek se neukládaly do adresy, pohled matice závisel na šířce okna
// a teplotní mapa os ani záložky nešly klávesnicí. Každá interakce má scénář tady; stránku vybírá
// odvozený graf (static/data/graph.json) podle značky, kterou šablona vykreslí, nikdy ruční seznam.
const DESKTOP = { width: 1440, height: 900 };
const PHONE = { width: 390, height: 844 };

// Značka v sestaveném HTML → interakce a šířky, na kterých se ověřuje.
const INTERACTIONS = [
  { interaction: 'osnova', marker: 'data-toc', viewports: [DESKTOP], note: 'osnova stránky sleduje čtení (aria-current)' },
  { interaction: 'posuvnik', marker: 'data-p5-intensity', viewports: [DESKTOP], note: 'posuvník intenzity překreslí pozastavené plátno' },
  { interaction: 'razeni', marker: 'data-rd-sort', viewports: [DESKTOP], note: 'hlavičky pracovního seznamu řadí myší i klávesnicí, řazení v adrese' },
  { interaction: 'glosar-adresa', marker: 'id="glosar-cat"', viewports: [DESKTOP, PHONE], note: 'kategorie a jazyk glosáře v adrese' },
  { interaction: 'rejstrik-adresa', marker: 'data-rejstrik', viewports: [DESKTOP], note: 'filtr rejstříku v adrese' },
  { interaction: 'zalozky', marker: 'data-eskalace', viewports: [DESKTOP, PHONE], note: 'záložky: roving tabindex, šipky, Home/End, výběr v adrese' },
  { interaction: 'matice-adresa', marker: 'kompendiumMatice', viewports: [DESKTOP], note: 'zvolený pohled matice platí na každé šířce' },
  { interaction: 'osy-klavesnice', marker: 'data-osy-graf', viewports: [DESKTOP], note: 'teplotní mapa os: šipky, Home/End, Enter vybere průnik' },
];

// Jako modul: interactions(load) vrací scénáře interakcí, které by běh použil.
// Stránky interakcí z grafu: pro každou značku nejodkazovanější stránka, jejíž sestavené HTML ji
// nese (při shodě podle cesty); osnova na nejdelší stránce knihy (slova z grafu) s aspoň čtyřmi
// odkazy osnovy, aby se mezi nadpisy dalo posouvat.
async function interactions(load = fromBase) {
  const g = JSON.parse(await load('data/graph.json'));
  const page = (n) => zolaPath(n.url);
  const inDeg = {};
  g.edges.forEach((e) => { inDeg[e[1]] = (inDeg[e[1]] || 0) + 1; });
  const out = [];
  const todo = INTERACTIONS.filter((x) => x.interaction !== 'osnova');
  const byRank = g.nodes.slice().sort((a, b) => (inDeg[b.id] || 0) - (inDeg[a.id] || 0) || (a.path < b.path ? -1 : 1));
  for (const n of byRank) {
    if (!todo.length) break;
    const html = await load(page(n)).catch(() => '');
    for (let i = todo.length - 1; i >= 0; i--) {
      if (html.includes(todo[i].marker)) { out.push({ ...todo[i], path: page(n) }); todo.splice(i, 1); }
    }
  }
  todo.forEach((x) => out.push({ ...x, path: '', missing: true }));
  const toc = INTERACTIONS.find((x) => x.interaction === 'osnova');
  const longest = g.nodes.filter((n) => n.path.startsWith('kompendium/')).sort((a, b) => (b.words || 0) - (a.words || 0));
  let tocPage = null;
  for (const n of longest.slice(0, 40)) {
    const html = await load(page(n)).catch(() => '');
    const i = html.indexOf('data-toc');
    const nav = i < 0 ? '' : html.slice(i, html.indexOf('</nav>', i));
    if ((nav.match(/href="[^"]*#/g) || []).length >= 4) { tocPage = n; break; }
  }
  out.push(tocPage ? { ...toc, path: page(tocPage) } : { ...toc, path: '', missing: true });
  const order = INTERACTIONS.map((x) => x.interaction);
  return out.sort((a, b) => order.indexOf(a.interaction) - order.indexOf(b.interaction));
}

async function openWatched(browser, url, viewport, failures) {
  const page = await browser.newPage({ viewport, colorScheme: 'light' });
  page.on('pageerror', (e) => failures.push('chyba stránky: ' + e.message));
  page.on('console', (m) => { if (m.type() === 'error') failures.push('konzole: ' + m.text().slice(0, 160)); });
  const res = await page.goto(url, { waitUntil: 'networkidle' });
  if (!res || res.status() !== 200) failures.push('HTTP ' + (res && res.status()) + ' ' + url);
  return page;
}
const param = (page, k) => new URL(page.url()).searchParams.get(k);

// Osnova: posun na nadpis z osnovy dá právě jeho odkazu aria-current="location".
async function osnova(page, failures) {
  const ids = await page.$$eval('[data-toc] a[href*="#"]', (as) => as.map((a) => decodeURIComponent(a.hash.slice(1))).filter(Boolean));
  if (ids.length < 4) { failures.push(`osnova má jen ${ids.length} odkazů`); return; }
  const seen = new Set();
  for (const id of [ids[1], ids[Math.floor(ids.length / 2)]]) {
    await page.evaluate((x) => {
      const h = document.getElementById(x);
      window.scrollTo({ top: h.getBoundingClientRect().top + window.scrollY - 100, behavior: 'instant' });
    }, id);
    await page.waitForTimeout(600);
    const cur = await page.$$eval('[data-toc] a[aria-current="location"]', (as) => as.map((a) => decodeURIComponent(a.hash.slice(1))));
    if (cur.length !== 1 || cur[0] !== id) failures.push(`osnova: po posunu na „${id}“ nese aria-current ${JSON.stringify(cur)}`);
    seen.add(cur.join());
  }
  if (seen.size < 2) failures.push('osnova: aria-current se při čtení nemění');
}

// Posuvník: pozastavené plátno stojí (dva snímky se rovnají) a změna intenzity ho překreslí.
async function posuvnik(page, failures) {
  const found = await page.evaluate(() => {
    const s = document.querySelector('[data-p5-intensity]');
    const host = [...document.querySelectorAll('[data-p5]')].find((el) => el.parentElement && el.parentElement.contains(s));
    if (!host) return false;
    host.setAttribute('data-test-posuvnik', '');
    return true;
  });
  if (!found) { failures.push('posuvník nemá plátno ve stejném obrázku'); return; }
  const host = page.locator('[data-test-posuvnik]');
  await host.scrollIntoViewIfNeeded();
  const pause = host.locator('[data-vrstva-pause]');
  if (await pause.getAttribute('aria-pressed') !== 'true') await pause.click();
  await page.waitForTimeout(400);
  const shot = () => host.locator('canvas').evaluate((c) => c.toDataURL());
  const a = await shot();
  await page.waitForTimeout(500);
  if (await shot() !== a) failures.push('posuvník: pozastavená animace se dál mění');
  await page.evaluate(() => {
    const s = document.querySelector('[data-p5-intensity]');
    s.value = Number(s.value) > 0.5 ? '0' : '1';
    s.dispatchEvent(new Event('input', { bubbles: true }));
  });
  await page.waitForTimeout(400);
  if (await shot() === a) failures.push('posuvník: změna intenzity pozastavené plátno nepřekreslí');
}

// Řazení: tlačítko v hlavičce sloupce řadí myší, Enterem i mezerníkem; hlavička nese aria-sort,
// adresa ?razeni= (výchozí řazení parametr smaže) a odkaz s ním otevře totéž řazení.
async function razeni(page, s, browser, failures) {
  const ready = (p) => p.waitForFunction(() => document.querySelector('#rd-radky tr') && document.querySelector('th[data-rd-sort][aria-sort]'), null, { timeout: 15000 }).catch(() => failures.push('pracovní seznam se nenačetl'));
  await page.locator('#redakce').scrollIntoViewIfNeeded();
  await ready(page);
  const sorts = (p) => p.$$eval('th[data-rd-sort]', (ths) => Object.fromEntries(ths.map((t) => [t.dataset.rdSort, t.getAttribute('aria-sort')])));
  const btn = (k) => page.locator(`th[data-rd-sort="${k}"] button`);
  const keys = await page.$$eval('th[data-rd-sort]', (ths) => ths.map((t) => t.dataset.rdSort));
  const initial = await sorts(page);
  const def = keys.find((k) => initial[k] !== 'none');
  const others = keys.filter((k) => k !== def);
  if (!def || others.length < 2) { failures.push(`řazení: hlavičky ${JSON.stringify(initial)}`); return; }
  const expect = async (k, how) => {
    await page.waitForTimeout(300);
    const now = await sorts(page);
    const on = Object.keys(now).filter((x) => now[x] !== 'none');
    if (on.join() !== k) failures.push(`řazení ${how}: aria-sort ${JSON.stringify(now)}, čekán sloupec ${k}`);
    const want = k === def ? null : k;
    if (param(page, 'razeni') !== want) failures.push(`řazení ${how}: ?razeni=${param(page, 'razeni')}, čekáno ${want}`);
  };
  await btn(others[0]).click();
  await expect(others[0], 'klepnutím');
  await btn(others[1]).focus();
  await page.keyboard.press('Enter');
  await expect(others[1], 'Enterem');
  await btn(def).focus();
  await page.keyboard.press(' ');
  await expect(def, 'mezerníkem');
  // Odkaz s řazením otevře totéž řazení.
  const url = new URL(page.url());
  url.searchParams.set('razeni', others[0]);
  const again = await openWatched(browser, url.href, DESKTOP, failures);
  await ready(again);
  const back = await sorts(again);
  if (back[others[0]] === 'none') failures.push(`řazení z adresy ?razeni=${others[0]} se neobnoví (${JSON.stringify(back)})`);
  await again.close();
}

// Glosář: kategorie a jazyk jsou v adrese a odkaz s nimi otevře týž výběr hesel.
async function glosarAdresa(page, browser, viewport, failures) {
  const cards = (p) => p.locator('#pruzkumnik-glosare section[aria-labelledby^="glosar-l-"] li').count();
  const value = await page.locator('#glosar-cat option').nth(1).getAttribute('value').catch(() => null);
  if (!value) { failures.push('glosář nemá kategorii k výběru'); return; }
  await page.locator('#glosar-cat').selectOption(value);
  const langs = page.locator('[aria-labelledby="glosar-lang-l"] button');
  await langs.nth(1).click();
  await page.waitForTimeout(400);
  const n = await cards(page);
  const lang = param(page, 'jazyk');
  if (param(page, 'kategorie') !== value) failures.push(`glosář: kategorie „${value}“ není v adrese (${page.url()})`);
  if (!lang) failures.push(`glosář: jazyk není v adrese (${page.url()})`);
  const again = await openWatched(browser, page.url(), viewport, failures);
  await again.waitForTimeout(1500);
  if (await again.locator('#glosar-cat').inputValue() !== value) failures.push('glosář: odkaz neobnoví kategorii');
  if (await again.locator('[aria-labelledby="glosar-lang-l"] button').nth(1).getAttribute('aria-pressed') !== 'true') failures.push('glosář: odkaz neobnoví jazyk');
  if (await cards(again) !== n) failures.push(`glosář: odkaz ukáže ${await cards(again)} hesel, výběr ${n}`);
  await again.close();
}

// Rejstřík: text a kategorie jsou v adrese a odkaz s nimi otevře týž výběr.
async function rejstrikAdresa(page, browser, viewport, failures) {
  const shown = (p) => p.locator('[data-rj-item]:visible').count();
  const word = await page.locator('[data-rj-title]').evaluateAll((els) => {
    for (const el of els) {
      const w = (el.textContent || '').trim().split(/[^\p{L}\p{N}]+/u).filter((x) => x.length >= 4);
      if (w.length) return w.sort((a, b) => b.length - a.length)[0];
    }
    return '';
  });
  await page.click('#rj-cat-button');
  const box = page.locator('[data-rj-cat]').first();
  await box.check();
  const cat = await box.inputValue();
  await page.keyboard.press('Escape');
  await page.fill('#rj-q', word.slice(0, 2));
  await page.waitForTimeout(300);
  const n = await shown(page);
  if (param(page, 'kategorie') !== cat) failures.push(`rejstřík: kategorie „${cat}“ není v adrese (${page.url()})`);
  if (param(page, 'hledat') !== word.slice(0, 2)) failures.push(`rejstřík: hledaný text není v adrese (${page.url()})`);
  const again = await openWatched(browser, page.url(), viewport, failures);
  if (await again.locator('#rj-q').inputValue() !== word.slice(0, 2)) failures.push('rejstřík: odkaz neobnoví hledaný text');
  if (!(await again.locator(`[data-rj-cat][value="${cat}"]`).isChecked())) failures.push('rejstřík: odkaz neobnoví kategorii');
  if (await shown(again) !== n) failures.push(`rejstřík: odkaz ukáže ${await shown(again)} pojmů, výběr ${n}`);
  await again.close();
}

// Záložky (WAI-ARIA Tabs): jedna zastávka Tab, šipky a Home/End přesouvají fokus i výběr, Tab
// opustí seznam; vybraná záložka i vrstva jsou v adrese a odkaz je obnoví.
async function zalozky(page, browser, viewport, failures) {
  const state = () => page.$$eval('[data-eskalace] [role="tab"]', (ts) => ({
    stops: ts.filter((t) => t.getAttribute('tabindex') !== '-1').map((t) => t.dataset.krok),
    selected: ts.filter((t) => t.getAttribute('aria-selected') === 'true').map((t) => t.dataset.krok),
    focus: document.activeElement && document.activeElement.dataset ? document.activeElement.dataset.krok : undefined,
    ids: ts.map((t) => t.dataset.krok),
    labelled: ts.every((t) => { const p = document.getElementById(t.getAttribute('aria-controls')); return p && p.getAttribute('aria-labelledby') === t.id; }),
  }));
  const st = await state();
  if (st.ids.length < 3) { failures.push(`záložky: jen ${st.ids.length}`); return; }
  if (!st.labelled) failures.push('záložky: panel nemá aria-labelledby své záložky');
  if (st.stops.length !== 1) failures.push(`záložky: ${st.stops.length} zastávek Tab, čekána 1`);
  const want = async (key, id) => {
    await page.keyboard.press(key);
    const now = await state();
    if (now.focus !== id || now.selected.join() !== id || now.stops.join() !== id) failures.push(`záložky: ${key} → fokus ${now.focus}, vybráno ${now.selected}, zastávka ${now.stops}; čekáno ${id}`);
  };
  await page.locator(`[data-krok="${st.stops[0]}"]`).focus();
  await want('ArrowRight', st.ids[1]);
  await want('End', st.ids[st.ids.length - 1]);
  await want('Home', st.ids[0]);
  await want('ArrowLeft', st.ids[st.ids.length - 1]);
  await page.keyboard.press('Tab');
  const out = await page.evaluate(() => document.activeElement && document.activeElement.getAttribute('role'));
  if (out === 'tab') failures.push('záložky: Tab neopustí seznam záložek');
  // Adresa: vybraná záložka a vrstva.
  const krok = st.ids[1];
  await page.locator(`[data-krok="${krok}"]`).click();
  const vrstva = await page.locator('[data-vrstva]').nth(3).getAttribute('data-vrstva');
  await page.locator(`[data-vrstva="${vrstva}"] text`).click();
  if (param(page, 'krok') !== krok) failures.push(`záložky: ?krok=${param(page, 'krok')}, čekáno ${krok}`);
  if (param(page, 'vrstva') !== vrstva) failures.push(`vrstvy: ?vrstva=${param(page, 'vrstva')}, čekáno ${vrstva}`);
  const again = await openWatched(browser, page.url(), viewport, failures);
  const shown = await again.evaluate(() => ({
    krok: [...document.querySelectorAll('[data-krok-panel]')].filter((x) => !x.hidden).map((x) => x.dataset.krokPanel).join(),
    vrstva: [...document.querySelectorAll('[data-vrstva-panel]')].filter((x) => !x.hidden).map((x) => x.dataset.vrstvaPanel).join(),
  }));
  if (shown.krok !== krok || shown.vrstva !== vrstva) failures.push(`záložky: odkaz ukáže ${JSON.stringify(shown)}, čekáno ${krok}/${vrstva}`);
  await again.close();
}

// Matice: pohled, který čtenář zvolil, je v adrese i tehdy, když je to výchozí pohled jeho šířky,
// a odkaz ho otevře i na telefonu (výchozí pohled tam je jiný).
async function maticeAdresa(page, browser, failures) {
  const ready = (p) => p.waitForFunction(() => {
    const el = document.querySelector('[x-data^="kompendiumMatice"]');
    return el && window.Alpine && window.Alpine.$data(el).ready;
  }, null, { timeout: 15000 }).catch(() => failures.push('matice se nenačetla'));
  const pressed = (p) => p.locator('button[aria-pressed="true"][\\@click^="setPohled"]').getAttribute('@click', { timeout: 5000 }).catch(() => null);
  await ready(page);
  for (const [from, to] of [[page, PHONE], [null, DESKTOP]]) {
    const src = from || await openWatched(browser, page.url().split('?')[0], PHONE, failures);
    if (!from) await ready(src);
    const chosen = await pressed(src);
    if (!chosen) { failures.push('matice: žádný pohled není zvolený'); break; }
    await src.locator(`button[\\@click="${chosen}"]`).click();
    const pohled = param(src, 'pohled');
    if (!pohled || !chosen.includes(`'${pohled}'`)) failures.push(`matice: zvolený pohled ${chosen} není v adrese (${src.url()})`);
    const again = await openWatched(browser, src.url(), to, failures);
    await ready(again);
    if (await pressed(again) !== chosen) failures.push(`matice: odkaz s ?pohled=${pohled} otevře na šířce ${to.width} pohled ${await pressed(again)}`);
    await again.close();
    if (!from) await src.close();
  }
}

// Teplotní mapa os: šipky posouvají kurzor po polích, Home/End na kraj řádku, Enter pole vybere
// (výběry i adresa ?publikum=&pilir=), Escape kurzor schová.
async function osyKlavesnice(page, failures) {
  const graf = page.locator('[data-osy-graf]');
  await page.waitForSelector('[data-osy-graf][data-osy-stav="hotovo"]', { timeout: 15000 }).catch(() => failures.push('mapa os se nevykreslila'));
  const pole = () => graf.getAttribute('data-osy-kurzor-pole');
  await graf.focus();
  await page.keyboard.press('ArrowRight');
  const a = await pole();
  if (!a) { failures.push('osy: šipka nevybrala pole'); return; }
  await page.keyboard.press('ArrowRight');
  const b = await pole();
  if (b === a) failures.push('osy: druhá šipka vpravo kurzor neposune');
  await page.keyboard.press('ArrowDown');
  const c = await pole();
  if (c === b || c.split(':')[1] !== b.split(':')[1]) failures.push(`osy: šipka dolů posune kurzor jinam než v témže sloupci (${b} → ${c})`);
  await page.keyboard.press('Home');
  const d = await pole();
  if (d.split(':')[0] !== c.split(':')[0] || d === c) failures.push(`osy: Home neskočí na začátek řádku (${c} → ${d})`);
  const said = ((await page.locator('[data-osy-kurzor]').textContent()) || '').trim();
  if (!said) failures.push('osy: kurzor se neoznámí');
  await page.keyboard.press('Enter');
  const [pub, pil] = d.split(':');
  if (await page.locator('[data-osy-publikum]').inputValue() !== pub || await page.locator('[data-osy-pilir]').inputValue() !== pil) failures.push(`osy: Enter nevybral průnik ${d}`);
  if (param(page, 'publikum') !== pub || param(page, 'pilir') !== pil) failures.push(`osy: průnik ${d} není v adrese (${page.url()})`);
  await page.keyboard.press('Escape');
  if (await pole()) failures.push('osy: Escape kurzor neschová');
}

async function checkInteraction(browser, s, viewport) {
  const failures = [];
  if (s.missing) return [`žádná stránka nenese značku ${s.marker}`];
  const page = await openWatched(browser, BASE + s.path, viewport, failures);
  if (s.interaction === 'osnova') await osnova(page, failures);
  if (s.interaction === 'posuvnik') await posuvnik(page, failures);
  if (s.interaction === 'razeni') await razeni(page, s, browser, failures);
  if (s.interaction === 'glosar-adresa') await glosarAdresa(page, browser, viewport, failures);
  if (s.interaction === 'rejstrik-adresa') await rejstrikAdresa(page, browser, viewport, failures);
  if (s.interaction === 'zalozky') await zalozky(page, browser, viewport, failures);
  if (s.interaction === 'matice-adresa') await maticeAdresa(page, browser, failures);
  if (s.interaction === 'osy-klavesnice') await osyKlavesnice(page, failures);
  await page.close();
  return failures;
}

// Spustí scénáře interakcí; vrací počet selhaných.
async function runInteractions(browser) {
  let list = await interactions(process.env.SITE_DIR ? fromDir(process.env.SITE_DIR) : undefined);
  if (process.env.ONLY) list = list.filter((s) => new RegExp(process.env.ONLY).test('/' + s.path));
  let failed = 0;
  let ran = 0;
  for (const s of list) {
    for (const viewport of s.viewports) {
      ran += 1;
      const f = await checkInteraction(browser, s, viewport);
      const name = `/${s.path} (interakce ${s.interaction}: ${s.note}, ${viewport.width} px)`;
      if (f.length) { failed += 1; console.log(`FAIL ${name}`); f.forEach((x) => console.log('     ' + x)); }
      else console.log(`ok   ${name}`);
    }
  }
  console.log(`surfaces: interakce ${ran - failed}/${ran} v pořádku`);
  return failed;
}

async function main() {
  const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');
  // SITE_DIR=<sestavený web>: odvozené scénáře čte z disku, ne přes HTTP. Smyčka přes stránky
  // (hledání Mermaid) tak nedělá stovky požadavků na http.server; jeden z nich v CI shodil
  // Node (undici: assert(!this.paused), běh 42810123032).
  SURFACES = FIXED.concat(await derived(process.env.SITE_DIR ? fromDir(process.env.SITE_DIR) : undefined));
  // ONLY=<regexp cesty>: jen vybrané plochy (ladění; gate běží bez něj).
  if (process.env.ONLY) SURFACES = SURFACES.filter((s) => new RegExp(process.env.ONLY).test('/' + s.path));
  // Prázdný výběr není úspěch: „0/0 v pořádku“ s kódem 0 vypadá jako zelená brána. ONLY se
  // porovnává s cestou začínající lomítkem (^/stav/, ne ^stav/).
  if (!SURFACES.length) {
    console.log(`surfaces: žádná plocha k ověření${process.env.ONLY ? ` (ONLY=${process.env.ONLY} nic nevybral; cesty začínají „/“)` : ''}`);
    process.exit(2);
  }
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
  const interactionsFailed = await runInteractions(browser);
  await browser.close();
  console.log(`surfaces: ${SURFACES.length * 2 - failed}/${SURFACES.length * 2} v pořádku`);
  process.exit(failed || interactionsFailed ? 1 : 0);
}

module.exports = { FIXED, derived, fromDir, interactions };
if (require.main === module) main();
