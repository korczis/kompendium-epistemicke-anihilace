// Distribuce technik napříč rodinami EA (ECharts, prstencový graf). Rodiny, jejich názvy, počty
// a odkazy se odvozují z grafu knihy (kniha.js): technika = stránka ea-N-…, rodina = EA-N
// z cesty, název rodiny = graph.families. Klik na výseč → techniky rodiny po podrodinách.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('taxonomy-distribution');
    if (!canvas) return;
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
        detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white',
          f.id + (f.name ? ' ' + f.name : '') + ' (' + f.items.length + ' stránek technik)'));
        var subs = [];
        f.items.forEach(function (t) { if (subs.indexOf(t.sub) < 0) subs.push(t.sub); });
        subs.forEach(function (s) {
          var items = f.items.filter(function (t) { return t.sub === s; });
          detail.appendChild(K.h('p', 'mt-3 font-semibold text-gray-800 dark:text-gray-200', s + ' (' + items.length + ')'));
          detail.appendChild(K.list(items.map(function (t) { return t.node; }), function (n) {
            return K.techniqueText(K.technique(n));
          }));
        });
      }

      K.chart(canvas, function (t, el) {
        var wide = el.clientWidth >= 640;
        var hd = K.head(t, el, 'Stránky technik podle rodin EA: ' + total + ' (klikněte pro detail)');
        return {
          title: hd.title,
          tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
            return L.esc(p.name) + ': ' + L.count(p.value, ['stránka', 'stránky', 'stránek']) +
              ' (' + p.percent + ' %)';
          } }, K.V.tooltip(t)),
          legend: Object.assign({ type: 'scroll', textStyle: { color: t.text }, pageTextStyle: { color: t.muted } },
            wide ? { orient: 'vertical', right: 8, top: hd.top + 8, bottom: 8 } : { bottom: 0, left: 8, right: 8 }),
          series: [{
            type: 'pie', radius: ['40%', '68%'], center: wide ? ['36%', '56%'] : ['50%', '48%'],
            avoidLabelOverlap: true, label: { show: wide, color: t.text, formatter: '{c}' },
            itemStyle: { borderColor: t.surface, borderWidth: 2 },
            emphasis: { focus: 'self', scaleSize: 6 },
            data: fams.map(function (f) {
              return { name: f.id + (f.name ? ' ' + f.name : ''), value: f.items.length, itemStyle: { color: f.color } };
            }),
          }],
        };
      }).then(function (chart) {
        chart.on('click', function (p) { if (p.componentType === 'series') show(fams[p.dataIndex]); });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
