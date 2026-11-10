// Fáze kazuistiky (templates/page.html, oddíl case-studies) jako svislá časová osa v ECharts.
// Zdroj je jen to, co text stránky nese ve stálém tvaru:
//   - tabulka pod nadpisem „Časová osa…“, jejíž první sloupec je „Fáze“ (fáze expozice; ostatní
//     sloupce, např. trvání a klíčové události, se převezmou tak, jak jsou napsané);
//   - stupně intervence zapsané tučně jako „S1 – …“ až „S5 – …“ v oddílu „Intervenční strategie“.
// Osa je pořadí fází, ne kalendář: data se nevymýšlejí ani nepřepočítávají. Fáze popsané jen
// souvislým textem se nerozpoznávají (šablona pohled na takové stránce vůbec nevloží).
(function () {
  'use strict';

  var V;
  var S_RE = /^S([1-5])\s*[–-]\s*(.+?)\.?$/;

  // Text nadpisu bez kotvy „#“ (insert_anchor_links) a bez čísla oddílu („7. “).
  function cleanHeading(h) {
    var c = h.cloneNode(true);
    Array.prototype.forEach.call(c.querySelectorAll('a'), function (a) {
      if (a.textContent.trim() === '#' || a.classList.contains('zola-anchor')) a.remove();
    });
    return c.textContent.replace(/#\s*$/, '').trim().replace(/^\d+\.\s*/, '');
  }

  function sectionOf(h) {
    var els = [];
    for (var el = h.nextElementSibling; el && el.tagName !== 'H2'; el = el.nextElementSibling) els.push(el);
    return els;
  }

  function fromTable(article) {
    var h = article.querySelector('h2[id*="casova-osa"]');
    if (!h) return null;
    // site.js balí široké tabulky do posuvného obalu, tabulka tedy může být o úroveň níž.
    var table = sectionOf(h).map(function (el) { return el.tagName === 'TABLE' ? el : el.querySelector('table'); })
      .filter(Boolean)[0];
    if (!table || !table.tHead || !table.tBodies.length) return null;
    var th = Array.prototype.map.call(table.tHead.querySelectorAll('th'), function (x) { return x.textContent.trim(); });
    if (th[0] !== 'Fáze') return null;
    var items = Array.prototype.map.call(table.tBodies[0].rows, function (tr, i) {
      if (!tr.id) tr.id = h.id + '-' + (i + 1);
      var cells = Array.prototype.map.call(tr.cells, function (c) { return c.textContent.trim(); });
      return { id: tr.id, name: cells[0], detail: cells.slice(1).filter(Boolean).join(' · '),
        full: cells.slice(1).map(function (c, j) { return th[j + 1] + ': ' + c; }).join('; ') };
    }).filter(function (x) { return x.name; });
    return items.length ? { title: cleanHeading(h), items: items } : null;
  }

  function fromStages(article) {
    var h = article.querySelector('h2[id*="intervencni-strategie"]');
    if (!h) return null;
    var seen = {};
    var items = [];
    sectionOf(h).forEach(function (el) {
      Array.prototype.forEach.call(el.querySelectorAll('strong'), function (s) {
        var m = S_RE.exec(s.textContent.trim());
        if (!m || seen[m[1]]) return;
        seen[m[1]] = true;
        if (!s.id) s.id = 'stupen-s' + m[1];
        items.push({ id: s.id, n: +m[1], name: 'S' + m[1] + ' – ' + m[2], detail: '', full: '' });
      });
    });
    items.sort(function (a, b) { return a.n - b.n; });
    return items.length ? { title: cleanHeading(h), items: items } : null;
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

  function renderList(root, tracks) {
    var list = root.querySelector('[data-pohled-seznam]');
    var tpl = root.querySelector('template[data-pohled-polozka]');
    if (!list || !tpl) return;
    list.innerHTML = '';
    tracks.forEach(function (tr) {
      tr.items.forEach(function (it, i) {
        var li = tpl.content.firstElementChild.cloneNode(true);
        var a = li.querySelector('[data-slot="odkaz"]');
        a.href = '#' + it.id;
        a.textContent = it.name;
        li.querySelector('[data-slot="popis"]').textContent = tr.title + ', ' + (i + 1) + '. z ' +
          tr.items.length + (it.full ? '; ' + it.full : '');
        list.appendChild(li);
      });
    });
  }

  function render(root, article) {
    var el = root.querySelector('[data-pohled-graf]');
    var caption = root.querySelector('[data-pohled-vyber]');
    var tracks = [fromTable(article), fromStages(article)].filter(Boolean);
    if (!tracks.length) {
      root.setAttribute('data-pohled-stav', 'prazdny');
      V.empty(el, 'Fáze nejsou rozpoznané', 'Pohled se kreslí jen z tabulky fází nebo ze stupňů S1–S5 v textu.');
      return null;
    }
    renderList(root, tracks);
    var flat = [];
    tracks.forEach(function (tr, col) {
      tr.items.forEach(function (it, row) { flat.push({ col: col, row: row, n: tr.items.length, it: it, track: tr }); });
    });
    var sel = -1;
    function data() {
      return flat.map(function (f, i) { return { value: [f.col, f.row, i === sel ? 1 : 0], name: f.it.name }; });
    }
    el.innerHTML = '';
    return V.echarts(el, function (t) {
      var top = 44;
      var bottom = 18;
      return {
        animation: !reduced(),
        tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
          var f = flat[p.dataIndex];
          return '<b>' + esc(f.it.name) + '</b>' + (f.it.full ? '<br>' + esc(f.it.full) : '') +
            '<br><span style="opacity:.75">' + esc(f.track.title) + ', ' + (f.row + 1) + '. z ' + f.n + '</span>';
        } }, V.tooltip(t)),
        series: [{
          id: 'faze', type: 'custom', coordinateSystem: 'none', data: data(), cursor: 'pointer',
          renderItem: function (params, api) {
            var f = flat[params.dataIndex];
            var W = api.getWidth();
            var H = api.getHeight();
            var colW = W / tracks.length;
            var x = f.col * colW + 22;
            var step = f.n > 1 ? (H - top - bottom) / (f.n - 1) : 0;
            var y = top + f.row * step;
            var selected = api.value(2) === 1;
            var tw = Math.max(40, colW - 60);
            var children = [];
            if (f.row === 0) {
              children.push({ type: 'text', style: { x: x - 14, y: 10, text: f.track.title.toUpperCase(), fill: t.muted,
                font: '600 11px Inter, system-ui, sans-serif', width: colW - 16, overflow: 'truncate' } });
            }
            if (f.row < f.n - 1) {
              children.push({ type: 'line', silent: true, shape: { x1: x, y1: y + 12, x2: x, y2: y + step - 12 },
                style: { stroke: t.muted, lineWidth: 2 } });
            }
            children.push({ type: 'circle', shape: { cx: x, cy: y, r: 12 },
              style: { fill: t.primary, stroke: selected ? t.accent : t.surface, lineWidth: selected ? 3 : 2 } });
            children.push({ type: 'text', silent: true, style: { x: x, y: y, text: String(f.row + 1), fill: ink(t.primary),
              font: '600 11px Inter, system-ui, sans-serif', align: 'center', verticalAlign: 'middle' } });
            children.push({ type: 'text', style: { x: x + 22, y: y - (f.it.detail ? 15 : 8), text: f.it.name, fill: t.text,
              font: (selected ? '700 ' : '600 ') + '13px Inter, system-ui, sans-serif', width: tw, overflow: 'truncate' } });
            if (f.it.detail) {
              children.push({ type: 'text', style: { x: x + 22, y: y + 2, text: f.it.detail, fill: t.muted,
                font: '12px Inter, system-ui, sans-serif', width: tw, overflow: 'truncate' } });
            }
            return { type: 'group', children: children };
          },
        }],
      };
    }).then(function (chart) {
      function go(i) { window.location.hash = flat[i].it.id; }
      function show(i) {
        sel = i;
        chart.setOption({ series: [{ id: 'faze', data: data() }] });
        if (i < 0) {
          chart.dispatchAction({ type: 'hideTip' });
          caption.textContent = '';
          el.removeAttribute('data-pohled-cil');
          return;
        }
        chart.dispatchAction({ type: 'showTip', seriesIndex: 0, dataIndex: i });
        var f = flat[i];
        caption.textContent = f.track.title + ', ' + (f.row + 1) + '. z ' + f.n + ': ' + f.it.name +
          '. Enter přejde na místo v textu.';
        el.setAttribute('data-pohled-cil', '#' + f.it.id);
      }
      chart.on('click', function (p) { if (p.dataIndex !== undefined) go(p.dataIndex); });
      el.addEventListener('keydown', function (e) {
        var n = flat.length;
        var keys = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
        if (e.key in keys) { e.preventDefault(); show(sel < 0 ? 0 : (sel + keys[e.key] + n) % n); }
        else if (e.key === 'Home') { e.preventDefault(); show(0); }
        else if (e.key === 'End') { e.preventDefault(); show(n - 1); }
        else if (e.key === 'Enter' && sel >= 0) { e.preventDefault(); go(sel); }
        else if (e.key === 'Escape') show(-1);
      });
      el.addEventListener('blur', function () { chart.dispatchAction({ type: 'hideTip' }); });
      if ('ResizeObserver' in window) new ResizeObserver(function () { chart.resize(); }).observe(el);
      root.setAttribute('data-pohled-stav', 'hotovo');
      return chart;
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Osu se nepodařilo sestavit', e.message);
    });
  }

  function init() {
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-pohled="pripad-faze"]');
    if (!V || !roots.length) return;
    Array.prototype.forEach.call(roots, function (root) {
      var article = root.closest('article') || document;
      if (!('IntersectionObserver' in window)) { render(root, article); return; }
      var io = new IntersectionObserver(function (entries) {
        if (!entries.some(function (en) { return en.isIntersecting; })) return;
        io.disconnect();
        render(root, article);
      }, { rootMargin: '200px 0px' });
      io.observe(root);
    });
  }

  // Skript je deferred a v těle stránky stojí před kompendium-viz.js: DOMContentLoaded přijde až
  // po všech deferred skriptech, takže vrstva už je načtená.
  if (document.readyState === 'complete') init();
  else document.addEventListener('DOMContentLoaded', init);
})();
