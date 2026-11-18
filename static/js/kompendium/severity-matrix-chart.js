// Matice rodina EA × úroveň rizika (ECharts, bublinový graf; velikost = počet stránek technik).
// Rodiny z grafu knihy, úrovně rizika a jejich pořadí z katalogu technik (risk_level stránek,
// legenda katalogu); nic se nepočítá ručně. Klik na bublinu → techniky v buňce.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('severity-matrix');
    if (!canvas) return;
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


        function show(p) {
          if (!detail) return;
          K.clear(detail);
          detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', K.familyLabel(p.fam) + ' • riziko ' + p.level.label));
          detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', p.count + ' stránek technik s touto úrovní rizika.'));
          detail.appendChild(K.list(p.items.map(function (t) { return t.node; }), function (n) {
            return K.techniqueText(K.technique(n));
          }));
        }

        K.chart(canvas, function (t, el) {
          var hd = K.head(t, el, 'Rodina EA × úroveň rizika (podle katalogu technik)');
          var cell = Math.min((el.clientWidth - 120) / Math.max(1, levels.length), (el.clientHeight - hd.top - 60) / Math.max(1, fams.length));
          return {
            title: hd.title,
            tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
              var d = points[p.dataIndex];
              return L.esc(K.familyLabel(d.fam) + ' / ' + d.level.label) + ': ' +
                L.count(d.count, ['stránka', 'stránky', 'stránek']);
            } }, K.V.tooltip(t)),
            grid: { left: 8, right: 16, top: hd.top + 16, bottom: 36, containLabel: true },
            xAxis: K.V.axis(t, { type: 'category', data: levels.map(function (l) { return l.label; }),
              name: 'Úroveň rizika (risk_level stránky)', nameLocation: 'middle', nameGap: 28,
              splitLine: { show: true, lineStyle: { color: t.grid, type: 'dashed' } } }),
            yAxis: K.V.axis(t, { type: 'category', inverse: true, data: fams, name: 'Rodina EA',
              nameLocation: 'start', splitLine: { show: true, lineStyle: { color: t.grid, type: 'dashed' } } }),
            series: [{
              type: 'scatter', name: 'Stránky technik', cursor: 'pointer',
              data: points.map(function (p) {
                var col = K.familyColor(p.fam);
                return { value: [p.x, p.y, p.count], itemStyle: { color: col, borderColor: col },
                  label: { color: L.ink(col) } };
              }),
              symbolSize: function (v) { return Math.max(8, Math.sqrt(v[2] / max) * Math.max(20, cell * 0.85)); },
              label: { show: true, formatter: function (p) { return p.value[2]; }, fontSize: 11, position: 'inside' },
              emphasis: { focus: 'self', itemStyle: { borderColor: t.text, borderWidth: 2 } },
            }],
          };
        }).then(function (chart) {
          chart.on('click', function (p) { if (p.componentType === 'series') show(points[p.dataIndex]); });
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
