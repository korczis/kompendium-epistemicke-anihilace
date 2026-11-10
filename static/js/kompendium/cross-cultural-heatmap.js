// Mezinárodní perspektivy × rodiny EA (Chart.js heatmapa ze scatteru). Řádky = stránky oddílu
// mezinárodních perspektiv seskupené podle jeho rejstříku (nadpisy a odkazy pod nimi), sloupce
// = rodiny EA z grafu knihy, hodnota = počet odkazů ze stránky regionu na stránky technik
// dané rodiny. Kniha neuvádí prevalenci, proto graf žádnou nepočítá ani neodhaduje.
// Klik na buňku → region, rodina a odkazované techniky.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: rejstřík oddílu mezinárodních perspektiv (cesta v grafu knihy).
  var SOURCE = 'kompendium/international/_index.md';

  function kniha() {
    if (!window.__kniha) {
      window.__kniha = (window.KompendiumKniha ? Promise.resolve() : new Promise(function (ok, fail) {
        var s = document.createElement('script');
        s.src = SRC.replace(/[^/]*$/, 'kniha.js');
        s.onload = ok;
        s.onerror = function () { fail(new Error('kniha.js se nenačetl')); };
        document.head.appendChild(s);
      })).then(function () { return window.KompendiumKniha.ready(); });
    }
    return window.__kniha;
  }

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var canvas = document.getElementById('cross-cultural-heatmap');
    var detail = document.getElementById('cross-cultural-detail');
    if (!canvas || typeof Chart === 'undefined') return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, canvas, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, canvas, detail) {
    var fams = K.familyIds;
    var rows = [];
    groups.forEach(function (gr) {
      gr.nodes.forEach(function (n) {
        var cells = {};
        K.g.out[n.id].forEach(function (b) {
          var t = K.technique(K.g.byId[b]);
          if (t) (cells[t.family] = cells[t.family] || []).push(t);
        });
        if (Object.keys(cells).length) rows.push({ node: n, group: gr.title, cells: cells });
      });
    });
    var max = 1;
    var data = [];
    rows.forEach(function (r, y) {
      fams.forEach(function (fid, x) {
        var items = r.cells[fid] || [];
        max = Math.max(max, items.length);
        data.push({ x: x, y: y, v: items.length, row: r, fam: fid, items: items });
      });
    });

    function rowLabel(r) { return K.parseTitle(r.node.title).head; }

    function show(d) {
      if (!detail) return;
      K.clear(detail);
      var h = K.h('h3', 'text-lg font-bold text-amber-300');
      h.appendChild(K.link(d.row.node, rowLabel(d.row), 'text-amber-300 underline'));
      h.appendChild(document.createTextNode(' × ' + d.fam + ' ' + K.familyName(d.fam)));
      detail.appendChild(h);
      detail.appendChild(K.h('p', 'text-slate-400 text-sm mt-1', d.row.group));
      detail.appendChild(K.h('p', 'text-slate-300 mt-1', d.v ? 'Stránka odkazuje na ' + d.v + ' stránek technik této rodiny:'
        : 'Stránka na techniky této rodiny neodkazuje.'));
      if (d.v) detail.appendChild(K.list(d.items.map(function (t) { return t.node; }), function (n) {
        return K.techniqueText(K.technique(n));
      }));
    }

    function shade(v, dark) {
      if (!v) return dark ? 'rgba(51,65,85,0.35)' : 'rgba(203,213,225,0.45)';
      var a = 0.3 + 0.7 * v / max;
      return 'rgba(245,158,11,' + a.toFixed(2) + ')';
    }

    K.chart(canvas, function (c) {
      return {
        type: 'scatter',
        data: { datasets: [{
          label: 'Odkazy na techniky', data: data, pointStyle: 'rect',
          backgroundColor: function (ctx) { return ctx.raw ? shade(ctx.raw.v, c.dark) : 'transparent'; },
          borderWidth: 0,
          pointRadius: function (ctx) {
            var a = ctx.chart.chartArea;
            if (!a) return 6;
            var cw = (a.right - a.left) / fams.length;
            var ch = (a.bottom - a.top) / rows.length;
            return Math.max(2, Math.min(cw, ch) * 0.45 * Math.SQRT2);
          },
          pointHoverRadius: function (ctx) {
            var a = ctx.chart.chartArea;
            if (!a) return 7;
            return Math.max(3, Math.min((a.right - a.left) / fams.length, (a.bottom - a.top) / rows.length) * 0.55 * Math.SQRT2);
          },
        }] },
        options: {
          responsive: true,
          aspectRatio: Math.max(0.6, 800 / (rows.length * 20 + 140)),
          plugins: {
            legend: { display: false },
            title: { display: true, color: c.text,
              text: 'Mezinárodní perspektivy × rodiny EA: odkazy ze stránek na techniky (' + rows.length + ' stránek)' },
            tooltip: { callbacks: { label: function (ctx) {
              var d = ctx.raw;
              return rowLabel(d.row) + ' × ' + d.fam + ': ' + d.v + ' odkazů';
            } } },
          },
          scales: {
            x: {
              type: 'linear', min: -0.5, max: fams.length - 0.5, position: 'top',
              afterBuildTicks: K.intTicks(fams.length),
              ticks: { color: c.muted, callback: function (v) { return fams[v] || ''; } },
              grid: { display: false },
            },
            y: {
              type: 'linear', min: -0.5, max: rows.length - 0.5, reverse: true,
              afterBuildTicks: K.intTicks(rows.length),
              ticks: { color: c.muted, autoSkip: false, font: { size: 10 },
                callback: function (v) { return rows[v] ? rowLabel(rows[v]) : ''; } },
              grid: { display: false },
            },
          },
          onClick: function (_e, els) { if (els.length) show(data[els[0].index]); },
        },
      };
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
