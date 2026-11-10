// Detekční signatury knihy po skupinách (Chart.js scatter, jedna stopa = jedna skupina).
// Skupiny (lingvistické, behaviorální, síťové, fenomenologické, průřezové…) a jejich stránky
// přebírá z rejstříku oddílu detekčních signatur (nadpisy a odkazy pod nimi); X = pořadí
// v rejstříku, Y = počet stránek knihy, které na signaturu odkazují (graf: in). Kniha neuvádí
// průběh intenzity příznaků v čase, proto graf žádné takové hodnoty neukazuje.
// Klik na bod → signatura, její skupina a odkaz na stránku.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: rejstřík oddílu detekčních signatur (cesta v grafu knihy).
  var SOURCE = 'kompendium/detection-signatures/_index.md';

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
    var canvas = document.getElementById('phenomenology-timeline');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('phenomenology-detail');
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) {
        var order = 0;
        var tracks = groups.map(function (gr, gi) {
          return {
            group: gr, color: K.V.PALETTE[gi % K.V.PALETTE.length],
            points: gr.nodes.map(function (n) { order += 1; return { x: order, y: n.in, n: n, gi: gi }; }),
          };
        });
        var maxIn = Math.max.apply(null, K.g.nodes.filter(function (n) { return n.section === idx.section; })
          .map(function (n) { return n.in; }).concat([1]));

        function show(pt) {
          if (!detail) return;
          var gr = tracks[pt.gi].group;
          K.clear(detail);
          detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', pt.n.title));
          detail.appendChild(K.h('p', 'text-slate-400 text-sm', gr.title + ' • odkazuje sem ' + pt.n.in + ' stránek knihy'));
          if (gr.text) detail.appendChild(K.h('p', 'text-slate-300 mt-2', gr.text));
          var p = K.h('p', 'mt-2 text-sm');
          p.appendChild(K.link(pt.n, '→ stránka signatury'));
          detail.appendChild(p);
        }

        K.chart(canvas, function (c) {
          return {
            type: 'scatter',
            data: { datasets: tracks.map(function (tr) {
              return {
                label: tr.group.title + ' (' + tr.points.length + ')', data: tr.points,
                borderColor: tr.color, backgroundColor: tr.color + '40', pointBackgroundColor: tr.color,
                pointRadius: 6, pointHoverRadius: 9, showLine: false,
              };
            }) },
            options: {
              responsive: true,
              plugins: {
                title: { display: true, color: c.text,
                  text: 'Detekční signatury knihy po skupinách: jak často na ně kniha odkazuje' },
                legend: { labels: { color: c.text } },
                tooltip: { callbacks: {
                  title: function (items) { return items[0].raw.n.title; },
                  label: function (ctx) { return ctx.raw.n.in + ' odkazů z knihy'; },
                } },
              },
              scales: {
                x: { min: 0, max: order + 1, ticks: { color: c.muted, stepSize: 1 }, grid: { color: c.grid },
                  title: { display: true, text: 'Pořadí v rejstříku signatur', color: c.text } },
                y: { min: 0, suggestedMax: maxIn + 1, ticks: { color: c.muted }, grid: { color: c.grid },
                  title: { display: true, text: 'Stránky knihy, které na signaturu odkazují', color: c.text } },
              },
              onClick: function (e, els, chart) {
                if (els.length) show(chart.data.datasets[els[0].datasetIndex].data[els[0].index]);
              },
            },
          };
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
