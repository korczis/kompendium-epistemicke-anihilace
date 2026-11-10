// Matice rodina EA × úroveň rizika (Chart.js bubble, velikost = počet stránek technik).
// Rodiny z grafu knihy, úrovně rizika a jejich pořadí z katalogu technik (risk_level stránek,
// legenda katalogu); nic se nepočítá ručně. Klik na bublinu → techniky v buňce.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;

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
    var canvas = document.getElementById('severity-matrix');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('severity-detail');
    kniha().then(function (K) {
      return K.catalogue().then(function (cat) {
        var levels = [];
        var levelIdx = {};
        var cells = {};
        K.techniques.forEach(function (t) {
          var r = K.riskOf(cat, t);
          if (!(r.id in levelIdx)) { levelIdx[r.id] = levels.length; levels.push(r); }
          var k = t.family + '|' + r.id;
          (cells[k] = cells[k] || []).push(t);
        });
        levels.sort(function (a, b) { return a.order - b.order || a.label.localeCompare(b.label, 'cs'); });
        levels.forEach(function (l, i) { levelIdx[l.id] = i; });
        var fams = K.familyIds;
        var max = 1;
        Object.keys(cells).forEach(function (k) { max = Math.max(max, cells[k].length); });
        var points = [];
        fams.forEach(function (fid, y) {
          levels.forEach(function (l, x) {
            var items = cells[fid + '|' + l.id];
            if (!items) return;
            points.push({
              x: x, y: y, r: 4 + Math.sqrt(items.length / max) * 26,
              count: items.length, fam: fid, level: l, items: items,
            });
          });
        });

        function famLabel(fid) { return fid + (K.familyName(fid) ? ' ' + K.familyName(fid) : ''); }

        function show(p) {
          if (!detail) return;
          K.clear(detail);
          detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', famLabel(p.fam) + ' • riziko ' + p.level.label));
          detail.appendChild(K.h('p', 'text-slate-300 mt-1', p.count + ' stránek technik s touto úrovní rizika.'));
          detail.appendChild(K.list(p.items.map(function (t) { return t.node; }), function (n) {
            return K.techniqueText(K.technique(n));
          }));
        }

        K.chart(canvas, function (c) {
          return {
            type: 'bubble',
            data: { datasets: [{
              label: 'Stránky technik', data: points,
              backgroundColor: points.map(function (p) { return K.familyColor(p.fam) + 'CC'; }),
              borderColor: points.map(function (p) { return K.familyColor(p.fam); }),
            }] },
            options: {
              responsive: true,
              scales: {
                x: {
                  type: 'linear', min: -0.5, max: levels.length - 0.5, afterBuildTicks: K.intTicks(levels.length),
                  ticks: { stepSize: 1, color: c.muted, callback: function (v) { return levels[v] ? levels[v].label : ''; } },
                  grid: { color: c.grid },
                  title: { display: true, text: 'Úroveň rizika (risk_level stránky)', color: c.text },
                },
                y: {
                  type: 'linear', min: -0.5, max: fams.length - 0.5, reverse: true, afterBuildTicks: K.intTicks(fams.length),
                  ticks: { stepSize: 1, color: c.muted, callback: function (v) { return fams[v] || ''; } },
                  grid: { color: c.grid },
                  title: { display: true, text: 'Rodina EA', color: c.text },
                },
              },
              plugins: {
                legend: { display: false },
                tooltip: { callbacks: { label: function (ctx) {
                  return famLabel(ctx.raw.fam) + ' / ' + ctx.raw.level.label + ': ' + ctx.raw.count + ' stránek';
                } } },
                title: { display: true, text: 'Rodina EA × úroveň rizika (podle katalogu technik)', color: c.text },
              },
              onClick: function (e, els) { if (els.length) show(points[els[0].index]); },
            },
          };
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
