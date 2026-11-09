#!/usr/bin/env node
// Renderuje animaci „Rozpad sítě pojmů“ z p5.js skici do static/img/rozpad.gif (README, wiki).
// Potřebuje běžící `zola serve` (výchozí http://127.0.0.1:1111/), Playwright a ImageMagick.
// Použití: PLAYWRIGHT=<cesta k playwright-core> node scripts/render-p5-gif.cjs [base-url]
const { execFileSync } = require('node:child_process');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');

const BASE = process.argv[2] || 'http://127.0.0.1:1111/';
const OUT = path.join(__dirname, '..', 'static', 'img');
const FRAMES = 72;
const STEP_MS = 110;

(async () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'kea-gif-'));
  const browser = await chromium.launch();
  for (const scheme of ['dark', 'light']) {
    const page = await browser.newPage({ viewport: { width: 1000, height: 800 }, colorScheme: scheme, deviceScaleFactor: 1 });
    await page.goto(BASE + 'galerie/', { waitUntil: 'networkidle' });
    await page.evaluate(() => {
      const host = document.createElement('div');
      host.id = 'gif-host';
      host.style.cssText = 'position:fixed;left:0;top:0;width:960px;z-index:9999';
      host.innerHTML = '<div data-p5="rozpad" data-ratio="0.35" data-intensity="0.85" data-speed="3.2"></div>';
      document.body.appendChild(host);
      window.kompendiumGrafika.mount();
    });
    await page.waitForTimeout(2500);
    for (let i = 0; i < FRAMES; i++) {
      const data = await page.evaluate(() => document.querySelector('#gif-host canvas').toDataURL('image/png'));
      fs.writeFileSync(path.join(tmp, `${scheme}-${String(i).padStart(3, '0')}.png`), Buffer.from(data.split(',')[1], 'base64'));
      await page.waitForTimeout(STEP_MS);
    }
    await page.close();
    const frames = fs.readdirSync(tmp).filter((f) => f.startsWith(scheme)).sort().map((f) => path.join(tmp, f));
    const out = path.join(OUT, scheme === 'dark' ? 'rozpad.gif' : 'rozpad-svetly.gif');
    // Jedna sdílená paleta bez ditheringu: jinak každý snímek kvantizuje jinak a obraz bliká.
    const palette = path.join(tmp, `${scheme}-palette.png`);
    execFileSync('magick', [frames[0], frames[Math.floor(frames.length / 2)], '-append', '+dither', '-colors', '64', '-unique-colors', palette]);
    execFileSync('magick', ['-delay', '11', '-loop', '0', ...frames, '+dither', '-remap', palette, '-layers', 'OptimizeFrame', out]);
    console.log(`wrote ${path.relative(path.join(__dirname, '..'), out)} (${Math.round(fs.statSync(out).size / 1024)} KiB)`);
  }
  await browser.close();
  fs.rmSync(tmp, { recursive: true, force: true });
})();
