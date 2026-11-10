// Distribuce technik napříč rodinami EA (Chart.js doughnut). Rodiny, jejich názvy, počty
// a odkazy se odvozují z grafu knihy (kniha.js): technika = stránka ea-N-…, rodina = EA-N
// z cesty, název rodiny = graph.families. Klik na výseč → techniky rodiny po podrodinách.
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

  function init() {
    var canvas = document.getElementById('taxonomy-distribution');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('taxonomy-detail');
    kniha().then(function (K) {
      var fams = K.familyIds.map(function (fid) {
        return {
          id: fid, name: K.familyName(fid), color: K.familyColor(fid),
          items: K.techniques.filter(function (t) { return t.family === fid; }),
        };
      });
      var total = K.techniques.length;

      function show(f) {
        if (!detail) return;
        K.clear(detail);
        detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100',
          f.id + (f.name ? ' ' + f.name : '') + ' (' + f.items.length + ' stránek technik)'));
        var subs = [];
        f.items.forEach(function (t) { if (subs.indexOf(t.sub) < 0) subs.push(t.sub); });
        subs.forEach(function (s) {
          var items = f.items.filter(function (t) { return t.sub === s; });
          detail.appendChild(K.h('p', 'mt-3 font-semibold text-slate-200', s + ' (' + items.length + ')'));
          detail.appendChild(K.list(items.map(function (t) { return t.node; }), function (n) {
            return K.techniqueText(K.technique(n));
          }));
        });
      }

      K.chart(canvas, function (c) {
        return {
          type: 'doughnut',
          data: {
            labels: fams.map(function (f) { return f.id + (f.name ? ' ' + f.name : ''); }),
            datasets: [{
              data: fams.map(function (f) { return f.items.length; }),
              backgroundColor: fams.map(function (f) { return f.color; }),
              borderWidth: 2, borderColor: c.surface,
            }],
          },
          options: {
            responsive: true,
            plugins: {
              legend: { position: 'right', labels: { color: c.text } },
              title: {
                display: true, color: c.text,
                text: 'Stránky technik podle rodin EA: ' + total + ' (klikněte pro detail)',
              },
              tooltip: { callbacks: { label: function (ctx) { return ctx.label + ': ' + ctx.parsed + ' stránek'; } } },
            },
            onClick: function (evt, elems) { if (elems.length) show(fams[elems[0].index]); },
          },
        };
      });
    }).catch(function (e) { failed(detail, e); });
  }

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
