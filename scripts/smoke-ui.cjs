// Interaktivita webu: každý druh stránky se načte bez chyb JS a bez chybějících souborů a každá
// interaktivní funkce dělá, co má (Mermaid, Okolí stránky, Mapa, Stav, vizualizace, filtr a fasety
// glosáře, podstromy sidebaru, vyhledávání, mobilní drawer).
// Potřebuje sestavený web servírovaný pod produkčním prefixem a Playwright:
//   zola build -u http://127.0.0.1:1112/kompendium-epistemicke-anihilace -o "$TMPDIR/kea-root/kompendium-epistemicke-anihilace"
//   (cd "$TMPDIR/kea-root" && python3 -m http.server 1112) &
//   PLAYWRIGHT=<cesta k playwright-core> node scripts/smoke-ui.cjs http://127.0.0.1:1112/kompendium-epistemicke-anihilace [složka-snímků]
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');
const base = process.argv[2];
const shots = process.argv[3] || require('node:os').tmpdir();

const pages = [
  ['/', 'home'],
  ['/kompendium/', 'kompendium'],
  ['/kompendium/01-predmluva/eticke-aspekty/', 'eticke'],
  ['/kompendium/techniques/ea-1-1-1-selektivni-expozice/', 'technique'],
  ['/kompendium/03-manipulacni-vzorce/', 'mermaid'],
  ['/kompendium/visualizations/', 'viz'],
  ['/kompendium/03-zakladni-kategorie/visualizations/', 'viz2'],
  ['/galerie/', 'galerie'],
  ['/mapa/', 'mapa'],
  ['/stav/', 'stav'],
  ['/glossary/', 'glossary'],
  ['/glossary/charisma/', 'term'],
  ['/philosophy/', 'philosophy'],
  ['/references/', 'references'],
  ['/tags/', 'tags'],
];

(async () => {
  const b = await chromium.launch();
  let failures = 0;
  const fail = (m) => { failures++; console.log('FAIL', m); };
  for (const [path, name] of pages) {
    const ctx = await b.newContext({ viewport: { width: 1440, height: 1000 } });
    const p = await ctx.newPage();
    const errs = [];
    p.on('pageerror', (e) => errs.push('pageerror: ' + e.message));
    p.on('console', (m) => { if (m.type() === 'error' && !/Failed to load resource/.test(m.text())) errs.push('console: ' + m.text()); });
    p.on('response', (r) => { if (r.status() >= 400) errs.push(r.status() + ' ' + r.url()); });
    await p.goto(base + path, { waitUntil: 'networkidle', timeout: 60000 });
    await p.waitForTimeout(800);
    if (await p.locator('[data-okoli]').count()) { await p.locator('[data-okoli]').scrollIntoViewIfNeeded(); await p.waitForTimeout(2500); }
    const facts = await p.evaluate(() => ({
      mermaidBlocks: document.querySelectorAll('pre code[data-lang="mermaid"], .mermaid').length,
      mermaidSvg: document.querySelectorAll('.mermaid svg').length,
      canvases: document.querySelectorAll('canvas').length,
      okoli: !!document.querySelector('[data-okoli]'),
      okoliDrawn: !!document.querySelector('[data-okoli] canvas, [data-okoli] svg'),
      echarts: document.querySelectorAll('[_echarts_instance_]').length,
      sidebarLinks: document.querySelectorAll('#sidebar a').length,
      current: !!document.querySelector('#sidebar [aria-current="page"]'),
    }));
    await p.screenshot({ path: `${shots}/${name}.png` });
    if (errs.length) fail(`${name}: ${errs.slice(0, 4).join(' | ')}`);
    if (facts.mermaidBlocks && !facts.mermaidSvg) fail(`${name}: mermaid blocks not rendered`);
    if (facts.okoli && !facts.okoliDrawn) fail(`${name}: Okolí stránky graph not drawn`);
    if (name === 'mapa' && !facts.canvases) fail('mapa: no canvas (cytoscape)');
    if (name === 'stav' && !facts.echarts) fail('stav: no ECharts instance');
    console.log(name, JSON.stringify(facts));

    if (name === 'glossary') {
      const total = await p.locator('[data-glossary-term]').count();
      await p.fill('[data-glossary-filter]', 'charisma');
      await p.waitForTimeout(300);
      const shown = await p.locator('[data-glossary-term]:not(.hidden)').count();
      if (!(shown >= 1 && shown < total)) fail(`glossary filter: ${shown} of ${total}`);
      await p.fill('[data-glossary-filter]', '');
      await p.locator('[data-glossary-cat]').nth(1).click();
      await p.waitForTimeout(300);
      const cat = await p.locator('[data-glossary-term]:not(.hidden)').count();
      if (!(cat >= 1 && cat < total)) fail(`glossary facet: ${cat} of ${total}`);
      if (!/kategorie=/.test(p.url())) fail('glossary facet not in URL');
      console.log('glossary interaction', { total, shown, cat });
    }
    if (name === 'technique') {
      const btn = p.locator('#sidebar button[data-collapse-toggle^="sub-"][aria-expanded="false"]').first();
      if (await btn.count()) {
        const target = await btn.getAttribute('aria-controls');
        await btn.click();
        await p.waitForTimeout(300);
        const hidden = await p.locator('#' + target).evaluate((el) => el.classList.contains('hidden'));
        if (hidden) fail('sidebar subtree does not expand');
        else console.log('sidebar expand ok', target);
      }
      // Search: Ctrl+K focuses, typing lists options, arrows select, Enter opens; an EA code
      // ranks its technique first.
      await p.locator('body').click({ position: { x: 900, y: 600 } });
      await p.keyboard.press('Control+k');
      const focused = await p.evaluate(() => document.activeElement && document.activeElement.id);
      if (focused !== 'topbar-search') fail('Ctrl+K does not focus search (' + focused + ')');
      await p.keyboard.type('gaslighting');
      await p.waitForTimeout(1200);
      const hits = await p.locator('#topbar-search-results [role="option"]').count();
      if (!hits) fail('search returns nothing for gaslighting');
      await p.keyboard.press('ArrowDown');
      const sel = await p.getAttribute('#topbar-search', 'aria-activedescendant');
      if (!sel) fail('ArrowDown does not select a result');
      await p.fill('#topbar-search', 'EA-1.6.2');
      await p.waitForTimeout(800);
      const first = await p.locator('#topbar-search-results [role="option"]').first().getAttribute('data-href');
      if (!/ea-1-6-2/.test(first || '')) fail('EA code does not rank its technique first: ' + first);
      await p.keyboard.press('Enter');
      await p.waitForURL(/ea-1-6-2/, { timeout: 5000 }).catch(() => fail('Enter does not open the selected result'));
      console.log('search hits', hits, 'first for EA-1.6.2:', first);
    }
    await ctx.close();
  }
  // Mobile: the drawer opens.
  const m = await (await b.newContext({ viewport: { width: 390, height: 844 } })).newPage();
  await m.goto(base + '/glossary/charisma/', { waitUntil: 'networkidle' });
  await m.click('#toggleSidebarMobile');
  await m.waitForTimeout(500);
  const open = await m.locator('#sidebar').evaluate((el) => !el.classList.contains('-translate-x-full'));
  if (!open) fail('mobile drawer does not open');
  const inDrawer = await m.evaluate(() => document.getElementById('sidebar').contains(document.activeElement));
  if (!inDrawer) fail('opening the drawer does not move focus into it');
  await m.keyboard.press('Escape');
  await m.waitForTimeout(500);
  const back = await m.evaluate(() => document.activeElement && document.activeElement.id);
  const inert = await m.evaluate(() => document.getElementById('sidebar').hasAttribute('inert'));
  if (back !== 'toggleSidebarMobile') fail('closing the drawer does not return focus to its toggle (' + back + ')');
  if (!inert) fail('a closed drawer is not inert');
  await m.screenshot({ path: `${shots}/mobile-drawer.png` });
  await b.close();
  console.log(failures ? `smoke: ${failures} failure(s)` : 'smoke: all ok');
  process.exit(failures ? 1 : 0);
})();
