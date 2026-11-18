// Detekční signatury knihy po skupinách (ECharts, bodový graf; jedna řada = jedna skupina).
// Skupiny (lingvistické, behaviorální, síťové, fenomenologické, průřezové…) a jejich stránky
// přebírá z rejstříku oddílu detekčních signatur (nadpisy a odkazy pod nimi); X = pořadí
// v rejstříku, Y = počet stránek knihy, které na signaturu odkazují (graf: in). Kniha neuvádí
// průběh intenzity příznaků v čase, proto graf žádné takové hodnoty neukazuje.
// Klik na bod → signatura, její skupina a odkaz na stránku.
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu detekčních signatur (cesta v grafu knihy).
  var SOURCE = 'kompendium/detection-signatures/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('phenomenology-timeline');
    if (!canvas) return;
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
          detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', pt.n.title));
          detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', gr.title + ' • odkazuje sem ' + pt.n.in + ' stránek knihy'));
          if (gr.text) detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-2', gr.text));
          var p = K.h('p', 'mt-2 text-sm');
          p.appendChild(K.link(pt.n, '→ stránka signatury'));
          detail.appendChild(p);
        }

        K.chart(canvas, function (t, el) {
          var hd = K.head(t, el, 'Detekční signatury knihy po skupinách: jak často na ně kniha odkazuje', true);
          return {
            title: hd.title,
            legend: hd.legend,
            tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
              var pt = tracks[p.seriesIndex].points[p.dataIndex];
              return '<b>' + L.esc(pt.n.title) + '</b><br>' + L.count(pt.n.in, ['odkaz', 'odkazy', 'odkazů']) + ' z knihy';
            } }, K.V.tooltip(t)),
            grid: { left: 36, right: 16, top: hd.top, bottom: 28, containLabel: true },
            xAxis: K.V.axis(t, { type: 'value', min: 0, max: order + 1, minInterval: 1,
              name: 'Pořadí v rejstříku signatur', nameLocation: 'middle', nameGap: 26 }),
            yAxis: K.V.axis(t, { type: 'value', min: 0, max: function (v) { return Math.max(v.max, maxIn) + 1; },
              minInterval: 1, name: 'Stránky knihy, které na signaturu odkazují', nameLocation: 'middle', nameGap: 36 }),
            series: tracks.map(function (tr) {
              return {
                type: 'scatter', name: tr.group.title + ' (' + tr.points.length + ')', cursor: 'pointer',
                symbolSize: 12, itemStyle: { color: tr.color },
                emphasis: { focus: 'series', scale: 1.5 },
                data: tr.points.map(function (pt) { return [pt.x, pt.y]; }),
              };
            }),
          };
        }).then(function (chart) {
          chart.on('click', function (p) {
            if (p.componentType === 'series') show(tracks[p.seriesIndex].points[p.dataIndex]);
          });
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
