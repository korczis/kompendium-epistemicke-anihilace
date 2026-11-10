// Rizikový profil rodin technik (templates/partials/explorer-techniques.html): bublinový rozptyl
// v ECharts, vodorovně rodina EA-n, svisle úroveň rizika, plocha bubliny počet technik.
// Data jsou tatáž, která průzkumník už má v inline JSON: #techniky-data (front matter ea_code,
// ea_category a risk_level, odvozené ze section.pages) a #techniky-rizika (pořadí a názvy úrovní).
// Reverzibilita v front matter není (je jen volným textem v tabulce stránky), proto ji graf
// nepoužívá. Bublina vyfiltruje katalog pod grafem (na místě přes Alpine průzkumníka, bez něj
// odkazem ?rodina=&riziko=).
(function () {
  'use strict';

  var V;
  var nf = new Intl.NumberFormat('cs-CZ');
  var RISK_ALIASES = { 'kritická': 'critical', 'kriticka': 'critical' };

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function readJson(id, fallback) {
    var node = document.getElementById(id);
    if (!node) return fallback;
    try { return JSON.parse(node.textContent); } catch (e) { return fallback; }
  }

  // Rodina z kódu front matter, jinak z názvu souboru (shodně s techniky.js).
  function familyOf(r) {
    var m = /^EA-(\d+)/i.exec(String(r.code || '').trim()) ||
      /(?:^|\/)ea-(\d+)-\d+/i.exec(r.path || '');
    return m ? +m[1] : null;
  }

  function riskId(raw) {
    var r = fold(raw).trim();
    return RISK_ALIASES[r] || r;
  }

  function plural(n, one, few, many) {
    if (n === 1) return one;
    if (n >= 2 && n <= 4) return few;
    return many;
  }

  // Barva textu na ploše: tmavá (gray-900), nebo bílá, podle toho, která má vyšší kontrast (WCAG).
  function ink(hex) {
    var n = parseInt(String(hex).slice(1), 16);
    var lum = [n >> 16, (n >> 8) & 255, n & 255].map(function (v) {
      v /= 255;
      return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    });
    var L = 0.2126 * lum[0] + 0.7152 * lum[1] + 0.0722 * lum[2];
    var dark = (L + 0.05) / (0.0092 + 0.05); // relativní jas #111827
    var light = 1.05 / (L + 0.05);
    return dark >= light ? '#111827' : '#ffffff';
  }

  function esc(s) {
    return String(s).replace(/[&<>"]/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
    });
  }

  function reduced() {
    var L = window.KompendiumVrstva;
    if (L && L.reducedMotion) return L.reducedMotion();
    return !!(window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches);
  }

  function model() {
    var raw = readJson('techniky-data', []);
    var RISKS = readJson('techniky-rizika', {});
    var fam = {};
    var risk = {};
    var cells = {};
    raw.forEach(function (r) {
      var n = familyOf(r);
      if (n === null) return;
      var f = fam[n] = fam[n] || { n: n, id: 'EA-' + n, cats: {} };
      if (r.category) {
        var cat = String(r.category).replace(/^\s*\d+\.\s*/, '');
        f.cats[cat] = (f.cats[cat] || 0) + 1;
      }
      var rid = riskId(r.risk);
      var meta = RISKS[rid] || RISKS[''] || {};
      risk[rid] = risk[rid] || { id: rid, label: meta.label || rid, order: meta.order || 50 };
      var key = n + '|' + rid;
      cells[key] = (cells[key] || 0) + 1;
    });
    var families = Object.keys(fam).map(function (k) { return fam[k]; }).sort(function (a, b) { return a.n - b.n; })
      .map(function (f, i) {
        var name = Object.keys(f.cats).sort(function (a, b) { return f.cats[b] - f.cats[a]; })[0];
        return { n: f.n, id: f.id, name: name || 'Rodina ' + f.id, i: i };
      });
    // Neuvedená úroveň není stupeň rizika: leží dole, pod celou škálou, ne nad nejvyšší úrovní.
    var risks = Object.keys(risk).map(function (k) { return risk[k]; })
      .sort(function (a, b) { return (a.id ? 1 : 0) - (b.id ? 1 : 0) || a.order - b.order; });
    var list = [];
    families.forEach(function (f, x) {
      risks.forEach(function (r, y) {
        var c = cells[f.n + '|' + r.id];
        if (c) list.push({ x: x, y: y, count: c, family: f, risk: r });
      });
    });
    var max = list.reduce(function (m, c) { return Math.max(m, c.count); }, 1);
    return { families: families, risks: risks, cells: list, max: max };
  }

  function target(c) {
    var p = new URLSearchParams();
    p.set('rodina', c.family.id);
    if (c.risk.id) p.set('riziko', c.risk.id);
    return window.location.pathname + '?' + p.toString() + '#tk-h-katalog';
  }

  function renderList(root, m) {
    var list = root.querySelector('[data-pohled-seznam]');
    var tpl = root.querySelector('template[data-pohled-polozka]');
    if (!list || !tpl) return;
    list.innerHTML = '';
    m.cells.forEach(function (c) {
      var li = tpl.content.firstElementChild.cloneNode(true);
      var a = li.querySelector('[data-slot="odkaz"]');
      a.href = target(c);
      a.textContent = c.family.id + ' ' + c.family.name + ', riziko ' + c.risk.label;
      a.addEventListener('click', function (e) { if (filterInPlace(c)) e.preventDefault(); });
      li.querySelector('[data-slot="popis"]').textContent = nf.format(c.count) + ' ' +
        plural(c.count, 'technika', 'techniky', 'technik');
      list.appendChild(li);
    });
  }

  // Průzkumník (Alpine, x-data="kompendiumTechniky()") vyfiltruje katalog na místě; adresu si
  // zrcadlí sám (?rodina=&riziko=), kotva katalog posune do okna.
  function filterInPlace(c) {
    var host = document.getElementById('techniky');
    var A = window.Alpine;
    if (!host || !A || !A.$data) return false;
    var d = A.$data(host);
    if (!d || !('family' in d)) return false;
    d.q = '';
    d.family = c.family.id;
    d.risk = c.risk.id;
    window.setTimeout(function () {
      var url = target(c);
      try { window.history.replaceState(null, '', url.replace(/#.*$/, '')); } catch (e) { /* bez History API */ }
      var h = document.getElementById('tk-h-katalog');
      if (window.location.hash === '#tk-h-katalog' && h) h.scrollIntoView();
      else window.location.hash = 'tk-h-katalog';
    }, 0);
    return true;
  }

  function activate(c) {
    if (!filterInPlace(c)) window.location.href = target(c);
  }

  function render(root) {
    var el = root.querySelector('[data-pohled-graf]');
    var caption = root.querySelector('[data-pohled-vyber]');
    var m = model();
    if (!m.cells.length) {
      root.setAttribute('data-pohled-stav', 'prazdny');
      V.empty(el, 'Bez dat', 'Katalog zatím nemá techniky s kódem rodiny.');
      return null;
    }
    renderList(root, m);
    var sel = -1;
    function maxSize() {
      var w = el.clientWidth || 320;
      var h = el.clientHeight || 320;
      var cw = (w - (w < 640 ? 96 : 130)) / m.families.length;
      var ch = (h - 56) / m.risks.length;
      return Math.max(14, Math.min(cw, ch) * 0.92);
    }
    function data(t) {
      var size = maxSize();
      return m.cells.map(function (c, i) {
        var col = V.PALETTE[c.family.i % V.PALETTE.length];
        var s = Math.max(8, Math.sqrt(c.count / m.max) * size);
        var inside = s >= 20;
        // Na úzkém displeji by se popisky vedle malých bublin překrývaly se sousedy; počet je pak
        // v tooltipu, v řádku pod grafem a v textové podobě.
        var narrow = (el.clientWidth || 320) < 640;
        return { value: [c.x, c.y, c.count], symbolSize: s,
          itemStyle: { color: col, borderColor: i === sel ? t.text : t.surface, borderWidth: i === sel ? 3 : 1.5 },
          label: { show: inside || !narrow, position: inside ? 'inside' : 'right', color: inside ? ink(col) : t.text,
            fontSize: 11, fontWeight: 600, formatter: String(c.count) } };
      });
    }
    el.innerHTML = '';
    return V.echarts(el, function (t) {
      var narrow = (el.clientWidth || 320) < 640;
      return {
        animation: !reduced(),
        grid: { left: 12, right: 12, top: 12, bottom: 4, containLabel: true },
        tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
          var c = m.cells[p.dataIndex];
          return '<b>' + esc(c.family.id + ' ' + c.family.name) + '</b><br>riziko ' + esc(c.risk.label) + ': ' +
            nf.format(c.count) + ' ' + plural(c.count, 'technika', 'techniky', 'technik');
        } }, V.tooltip(t)),
        xAxis: V.axis(t, { type: 'category', data: m.families.map(function (f) { return f.id; }),
          axisLabel: { color: t.muted, interval: 0, fontSize: narrow ? 10 : 12,
            formatter: function (v) { return narrow ? v.replace('EA-', '') : v; } },
          splitLine: { show: true, lineStyle: { color: t.grid, type: 'dashed' } }, axisTick: { show: false } }),
        yAxis: V.axis(t, { type: 'category', data: m.risks.map(function (r) { return r.label; }),
          axisLabel: { color: t.muted, fontSize: narrow ? 10 : 12 },
          splitLine: { show: true, lineStyle: { color: t.grid, type: 'dashed' } }, axisTick: { show: false } }),
        series: [{ id: 'rodiny', type: 'scatter', cursor: 'pointer', data: data(t),
          emphasis: { scale: 1.1, itemStyle: { borderColor: t.text, borderWidth: 2 } } }],
      };
    }).then(function (chart) {
      function show(i) {
        sel = i;
        chart.setOption({ series: [{ id: 'rodiny', data: data(V.theme()) }] });
        if (i < 0) {
          chart.dispatchAction({ type: 'hideTip' });
          caption.textContent = '';
          el.removeAttribute('data-pohled-cil');
          return;
        }
        chart.dispatchAction({ type: 'showTip', seriesIndex: 0, dataIndex: i });
        var c = m.cells[i];
        caption.textContent = c.family.id + ' ' + c.family.name + ', riziko ' + c.risk.label + ': ' +
          nf.format(c.count) + ' ' + plural(c.count, 'technika', 'techniky', 'technik') + '. Enter ' +
          (c.risk.id ? 'je vyfiltruje v katalogu.' : 'vyfiltruje rodinu v katalogu (úroveň rizika neuvedena).');
        el.setAttribute('data-pohled-cil', new URL(target(c), window.location.href).href);
      }
      // Šipky po mřížce: vlevo a vpravo rodina, nahoru a dolů úroveň rizika (nejbližší obsazená buňka).
      function move(dx, dy) {
        if (sel < 0) return show(0);
        var c = m.cells[sel];
        var best = -1;
        var bestD = Infinity;
        m.cells.forEach(function (o, i) {
          var ddx = o.x - c.x;
          var ddy = o.y - c.y;
          if (dx && Math.sign(ddx) !== dx) return;
          if (dy && Math.sign(ddy) !== dy) return;
          var d = dx ? Math.abs(ddx) * 10 + Math.abs(ddy) : Math.abs(ddy) * 10 + Math.abs(ddx);
          if (d < bestD) { bestD = d; best = i; }
        });
        if (best >= 0) show(best);
      }
      chart.on('click', function (p) { if (p.dataIndex !== undefined) activate(m.cells[p.dataIndex]); });
      el.addEventListener('keydown', function (e) {
        var moves = { ArrowRight: [1, 0], ArrowLeft: [-1, 0], ArrowUp: [0, 1], ArrowDown: [0, -1] };
        if (e.key in moves) { e.preventDefault(); move(moves[e.key][0], moves[e.key][1]); }
        else if (e.key === 'Home') { e.preventDefault(); show(0); }
        else if (e.key === 'End') { e.preventDefault(); show(m.cells.length - 1); }
        else if (e.key === 'Enter' && sel >= 0) { e.preventDefault(); activate(m.cells[sel]); }
        else if (e.key === 'Escape') show(-1);
      });
      el.addEventListener('blur', function () { chart.dispatchAction({ type: 'hideTip' }); });
      if ('ResizeObserver' in window) {
        new ResizeObserver(function () {
          chart.resize();
          chart.setOption({ series: [{ id: 'rodiny', data: data(V.theme()) }] });
        }).observe(el);
      }
      root.setAttribute('data-pohled-stav', 'hotovo');
      return chart;
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Graf se nepodařilo načíst', e.message);
    });
  }

  function init() {
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-pohled="techniky-rozptyl"]');
    if (!V || !roots.length) return;
    Array.prototype.forEach.call(roots, function (root) {
      if (!('IntersectionObserver' in window)) { render(root); return; }
      var io = new IntersectionObserver(function (entries) {
        if (!entries.some(function (en) { return en.isIntersecting; })) return;
        io.disconnect();
        render(root);
      }, { rootMargin: '200px 0px' });
      io.observe(root);
    });
  }

  // Skript je deferred a v těle stránky stojí před kompendium-viz.js: DOMContentLoaded přijde až
  // po všech deferred skriptech, takže vrstva už je načtená.
  if (document.readyState === 'complete') init();
  else document.addEventListener('DOMContentLoaded', init);
})();
