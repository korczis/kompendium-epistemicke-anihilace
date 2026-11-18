// V8 JS coverage of the site's own scripts during a test/e2e/surfaces.cjs run (COVERAGE_OUT).
//
// instrument(browser, base) wraps browser.newPage: every page records JS coverage from before its
// first navigation (resetOnNavigation false, so a page that navigates keeps what it ran), and
// collects it when it closes; collect() takes what pages still open ran. write(file) merges every
// page per file under static/js (vendored bundles and *.min.js excluded) and writes JSON:
//
//   { schema, files: { "static/js/<rel>": { functions, coveredFunctions, bytes, coveredBytes,
//                                          uncoveredFunctions: ["name@line", ...] } },
//     total: { files, functions, coveredFunctions, bytes, coveredBytes } }
//
// A function is covered when any page called it. The script's own top level is not a function.
// Bytes count non-whitespace characters only, so formatting does not dilute them; a byte is
// covered when the innermost V8 range holding it ran on any page. scripts/check-js-coverage.py
// compares the result with test/js-coverage-baseline.json.
'use strict';

const fs = require('fs');

function create(basePath) {
  const files = {};  // rel -> { source, bits: Uint8Array, fns: { key: { name, start, hit } } }

  function relOf(url) {
    let p;
    try { p = decodeURIComponent(new URL(url).pathname); } catch (e) { return null; }
    if (!p.startsWith(basePath)) return null;
    const rel = p.slice(basePath.length);
    if (!/^js\/.+\.js$/.test(rel) || rel.startsWith('js/vendor/') || /\.min\.js$/.test(rel)) return null;
    return 'static/' + rel;
  }

  function add(entries) {
    for (const e of entries) {
      const rel = relOf(e.url);
      if (!rel || typeof e.source !== 'string') continue;
      const len = e.source.length;
      let f = files[rel];
      if (!f) f = files[rel] = { source: e.source, bits: new Uint8Array(len), fns: {} };
      if (f.source !== e.source) continue;  // a different build of the file: not comparable
      // Innermost range wins: outer ranges first (start ascending, longer first), inner ones after.
      const ranges = [];
      for (const fn of e.functions) for (const r of fn.ranges) ranges.push(r);
      ranges.sort((a, b) => a.startOffset - b.startOffset || b.endOffset - a.endOffset);
      const run = new Uint8Array(len);
      for (const r of ranges) run.fill(r.count > 0 ? 1 : 0, r.startOffset, Math.min(r.endOffset, len));
      for (let i = 0; i < len; i += 1) if (run[i]) f.bits[i] = 1;
      for (const fn of e.functions) {
        const r0 = fn.ranges[0];
        if (!fn.functionName && r0.startOffset === 0 && r0.endOffset >= len) continue;  // top level
        const key = r0.startOffset + ':' + r0.endOffset;
        const g = f.fns[key] || (f.fns[key] = { name: fn.functionName || '(anonymous)', start: r0.startOffset, hit: false });
        if (r0.count > 0) g.hit = true;
      }
    }
  }

  function summary() {
    const out = {};
    const total = { files: 0, functions: 0, coveredFunctions: 0, bytes: 0, coveredBytes: 0 };
    for (const rel of Object.keys(files).sort()) {
      const f = files[rel];
      let bytes = 0;
      let coveredBytes = 0;
      for (let i = 0; i < f.source.length; i += 1) {
        if (/\s/.test(f.source[i])) continue;
        bytes += 1;
        if (f.bits[i]) coveredBytes += 1;
      }
      const fns = Object.values(f.fns).sort((a, b) => a.start - b.start);
      const lineOf = (off) => f.source.slice(0, off).split('\n').length;
      const row = {
        functions: fns.length,
        coveredFunctions: fns.filter((x) => x.hit).length,
        bytes,
        coveredBytes,
        uncoveredFunctions: fns.filter((x) => !x.hit).map((x) => x.name + '@' + lineOf(x.start)),
      };
      out[rel] = row;
      total.files += 1;
      for (const k of ['functions', 'coveredFunctions', 'bytes', 'coveredBytes']) total[k] += row[k];
    }
    return { schema: 'kompendium-js-coverage/v1', files: out, total };
  }

  return { add, summary };
}

function instrument(browser, base) {
  const acc = create(new URL(base).pathname);
  const open = new Set();
  async function stop(page) {
    if (!open.has(page)) return;
    open.delete(page);
    try { acc.add(await page.coverage.stopJSCoverage()); } catch (e) { console.error('coverage: ' + e.message); }
  }
  const newPage = browser.newPage.bind(browser);
  browser.newPage = async (...args) => {
    const page = await newPage(...args);
    await page.coverage.startJSCoverage({ resetOnNavigation: false });
    open.add(page);
    const close = page.close.bind(page);
    page.close = async (...a) => { await stop(page); return close(...a); };
    return page;
  };
  return {
    collect: () => Promise.all([...open].map(stop)),
    write(file) {
      const s = acc.summary();
      fs.writeFileSync(file, JSON.stringify(s, null, 1) + '\n');
      const pct = (a, b) => (b ? (100 * a / b).toFixed(1) : '100.0');
      console.log(`coverage: ${s.total.files} files, functions ${pct(s.total.coveredFunctions, s.total.functions)} % ` +
        `(${s.total.coveredFunctions}/${s.total.functions}), bytes ${pct(s.total.coveredBytes, s.total.bytes)} % -> ${file}`);
    },
  };
}

module.exports = { create, instrument };
