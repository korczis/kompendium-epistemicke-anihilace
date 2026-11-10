// Rozsah a stav stránek oddílu (templates/partials/section-overview.html): treemap v ECharts,
// dlaždice je přímá stránka oddílu, plocha počet slov, barva stav podle pravidel informační
// architektury ze static/data/ia.json (scripts/check-ia.py): „generated“ = obsahuje strojově
// generovaný text, „detail“ = pod hranicí rozsahu, jinak rozvinutá. ia.json i ECharts se načtou,
// až se přehled přiblíží k oknu.
(function () {
  'use strict';

  var V;
  var nf = new Intl.NumberFormat('cs-CZ');
  // Stav → index v kategorické paletě vrstvy (smaragdová, jantarová, břidlicová). Rozpracovaná
  // stránka má navíc šrafování pod 45°: smaragdová a jantarová jsou si pro protanopy blízko.
  var STAV = {
    rozvinuta: { pal: 2, label: 'rozvinutá' },
    rozpracovana: { pal: 3, label: 'rozpracovaná' },
    generovana: { pal: 15, label: 's generovaným textem' },
  };

  var HATCH = { symbol: 'rect', symbolSize: 1, dashArrayX: [1, 0], dashArrayY: [2, 5], rotation: -Math.PI / 4,
    color: 'rgba(255,255,255,0.35)' };

  function plural(n, one, few, many) {
    if (n === 1) return one;
    if (n >= 2 && n <= 4) return few;
    return many;
  }

  // Přímé stránky oddílu jako v Zole (shodně s oddil.js): <dir>/<slug>.md nebo <dir>/<slug>/index.md.
  function isDirectPage(path, dir) {
    if (path.indexOf(dir) !== 0) return false;
    var rest = path.slice(dir.length);
    if (rest === '_index.md') return false;
    return rest.indexOf('/') === -1 || /^[^/]+\/index\.md$/.test(rest);
  }

  function stav(p) {
    var v = p.violations || [];
    if (v.indexOf('generated') >= 0) return 'generovana';
    if (v.indexOf('detail') >= 0) return 'rozpracovana';
    return 'rozvinuta';
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

  function color(key) {
    return V.PALETTE[STAV[key].pal % V.PALETTE.length];
  }

  // Společný začátek názvů všech stránek oddílu (např. „Akutní protokol: “) do popisku dlaždice
  // nepatří: jinak by se zkrácený popisek lišil až za hranou dlaždice. Celý název je v tooltipu.
  function commonPrefix(titles) {
    if (titles.length < 2) return '';
    var p = titles[0];
    titles.forEach(function (s) { while (s.indexOf(p) !== 0) p = p.slice(0, -1); });
    var m = /^(.*(?::|\s[–-]))\s/.exec(p);
    return m ? m[0] : '';
  }

  function paintLegend(root, counts) {
    Array.prototype.forEach.call(root.querySelectorAll('[data-pohled-stav-barva]'), function (sw) {
      var key = sw.getAttribute('data-pohled-stav-barva');
      sw.style.backgroundColor = color(key);
      sw.style.backgroundImage = key === 'rozpracovana' ?
        'repeating-linear-gradient(-45deg, rgba(255,255,255,.45) 0 1.5px, transparent 1.5px 4px)' : 'none';
    });
    if (!counts) return;
    Array.prototype.forEach.call(root.querySelectorAll('[data-pohled-pocet]'), function (n) {
      n.textContent = nf.format(counts[n.getAttribute('data-pohled-pocet')] || 0);
    });
  }

  function renderList(root, rows) {
    var list = root.querySelector('[data-pohled-seznam]');
    var tpl = root.querySelector('template[data-pohled-polozka]');
    if (!list || !tpl) return;
    list.innerHTML = '';
    rows.forEach(function (r) {
      var li = tpl.content.firstElementChild.cloneNode(true);
      var a = li.querySelector('[data-slot="odkaz"]');
      a.href = r.url;
      a.textContent = r.title;
      li.querySelector('[data-slot="popis"]').textContent = nf.format(r.words) + ' ' +
        plural(r.words, 'slovo', 'slova', 'slov') + ' · ' + STAV[r.stav].label;
      list.appendChild(li);
    });
  }

  function render(root) {
    var el = root.querySelector('[data-pohled-graf]');
    var caption = root.querySelector('[data-pohled-vyber]');
    var host = root.closest('[data-oddil]');
    var dir = (host && host.getAttribute('data-oddil-dir')) || '';
    paintLegend(root, null);
    return V.json('data/ia.json').then(function (ia) {
      var counts = {};
      var rows = ia.pages.filter(function (p) { return isDirectPage(p.path, dir); }).map(function (p) {
        var s = stav(p);
        counts[s] = (counts[s] || 0) + 1;
        return { title: p.title, words: p.words || 0, stav: s, url: V.basePath + V.pageUrl(p.url) };
      }).sort(function (a, b) { return b.words - a.words || a.title.localeCompare(b.title, 'cs'); });
      paintLegend(root, counts);
      if (!rows.length) {
        root.setAttribute('data-pohled-stav', 'prazdny');
        V.empty(el, 'Bez dat', 'Zpráva informační architektury zatím stránky tohoto oddílu neobsahuje.');
        return null;
      }
      renderList(root, rows);
      var shown = rows.filter(function (r) { return r.words > 0; });
      var prefix = commonPrefix(rows.map(function (r) { return r.title; }));
      var sel = -1;
      function data(t) {
        return shown.map(function (r, i) {
          var c = color(r.stav);
          return { name: r.title, short: r.title.slice(prefix.length) || r.title, value: r.words, url: r.url, stav: r.stav,
            itemStyle: Object.assign({ color: c }, r.stav === 'rozpracovana' ? { decal: Object.assign({}, HATCH) } : {},
              i === sel ? { borderColor: t.text, borderWidth: 3 } : {}),
            label: { color: ink(c) } };
        });
      }
      el.innerHTML = '';
      return V.echarts(el, function (t) {
        return {
          animation: !reduced(),
          tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
            var d = p.data;
            return '<b>' + esc(d.name) + '</b><br>' + nf.format(d.value) + ' ' +
              plural(d.value, 'slovo', 'slova', 'slov') + ' · ' + STAV[d.stav].label;
          } }, V.tooltip(t)),
          series: [{
            id: 'stranky', type: 'treemap', roam: false, nodeClick: false, breadcrumb: { show: false },
            left: 0, right: 0, top: 0, bottom: 0, cursor: 'pointer',
            label: { show: true, formatter: function (p) { return p.data.short; }, overflow: 'truncate', fontSize: 12 },
            itemStyle: { borderColor: t.surface, borderWidth: 2, gapWidth: 2 },
            emphasis: { itemStyle: { borderColor: t.text, borderWidth: 2 } },
            data: data(t),
          }],
        };
      }).then(function (chart) {
        function show(i) {
          sel = i;
          chart.setOption({ series: [{ id: 'stranky', data: data(V.theme()) }] });
          if (i < 0) {
            chart.dispatchAction({ type: 'hideTip' });
            caption.textContent = '';
            el.removeAttribute('data-pohled-cil');
            return;
          }
          var r = shown[i];
          caption.textContent = r.title + ': ' + nf.format(r.words) + ' ' + plural(r.words, 'slovo', 'slova', 'slov') +
            ', ' + STAV[r.stav].label + ' (' + (i + 1) + ' z ' + shown.length + '). Enter stránku otevře.';
          el.setAttribute('data-pohled-cil', r.url);
        }
        chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
        el.addEventListener('keydown', function (e) {
          var n = shown.length;
          var keys = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
          if (e.key in keys) { e.preventDefault(); show(sel < 0 ? 0 : (sel + keys[e.key] + n) % n); }
          else if (e.key === 'Home') { e.preventDefault(); show(0); }
          else if (e.key === 'End') { e.preventDefault(); show(n - 1); }
          else if (e.key === 'Enter' && sel >= 0) { e.preventDefault(); window.location.href = shown[sel].url; }
          else if (e.key === 'Escape') show(-1);
        });
        // Paleta vrstvy se při přepnutí tématu přepíše na místě dřív, než ECharts graf přestaví.
        document.addEventListener('dark-mode', function () { paintLegend(root, counts); });
        if ('ResizeObserver' in window) new ResizeObserver(function () { chart.resize(); }).observe(el);
        root.setAttribute('data-pohled-stav', 'hotovo');
        return chart;
      });
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Data se nepodařilo načíst', e.message);
    });
  }

  function init() {
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-pohled="oddil-prehled"]');
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
