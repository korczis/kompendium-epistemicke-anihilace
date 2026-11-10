#!/usr/bin/env node
// Renderuje obrázky pro README a wiki z živých stránek webu: Mapa knihy (pohled oddílů)
// a Stav knihy (KPI a grafy). Potřebuje běžící `zola serve` (výchozí http://127.0.0.1:1111/).
// Použití: PLAYWRIGHT=<cesta k playwright-core> node scripts/render-readme-graphics.cjs [base-url]
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');

const BASE = process.argv[2] || 'http://127.0.0.1:1111/';
const OUT = path.join(__dirname, '..', 'static', 'img');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 1400, height: 900 }, colorScheme: 'dark', deviceScaleFactor: 1 });
  await page.goto(BASE + 'mapa/', { waitUntil: 'networkidle' });
  await page.waitForTimeout(3500);
  await page.locator('[x-ref=canvas]').screenshot({ path: path.join(OUT, 'mapa-knihy.png') });
  await page.goto(BASE + 'stav/', { waitUntil: 'networkidle' });
  await page.waitForTimeout(3500);
  const box = await page.locator('#stav-kpi').boundingBox();
  const charts = await page.locator('#h-sekce').locator('xpath=../..').boundingBox();
  await page.screenshot({ path: path.join(OUT, 'stav-knihy.png'),
    clip: { x: box.x, y: box.y, width: box.width, height: Math.min(900, charts.y + 560 - box.y) }, fullPage: true });
  await browser.close();
  console.log('wrote static/img/mapa-knihy.png, static/img/stav-knihy.png');
})();
