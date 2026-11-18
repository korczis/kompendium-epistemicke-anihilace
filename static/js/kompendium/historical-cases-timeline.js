// Historické případy na časové ose (ECharts, bodový graf s čarami trvání). Případy, jejich kategorie, místo
// a období jsou pole stránek historických případů v grafu knihy (category, place,
// period_start, period_end, ongoing). X = začátek období, čára = trvání (u trvajících do
// současnosti), Y = kategorie. Klik na bod → případ a odkaz na jeho stránku.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('historical-cases-timeline');
    var detail = document.getElementById('historical-cases-detail');
    if (!canvas) return;
    kniha().then(function (K) {
      var now = new Date().getFullYear();
      var all = K.g.nodes.filter(function (n) { return n.category && !K.isIndex(n); });
      var dated = all.filter(function (n) { return typeof n.period_start === 'number'; });
      var undated = all.filter(function (n) { return typeof n.period_start !== 'number'; });
      var cats = [];
      dated.forEach(function (n) { if (cats.indexOf(n.category) < 0) cats.push(n.category); });
      cats.sort(function (a, b) { return a.localeCompare(b, 'cs'); });
      var minY = Math.min.apply(null, dated.map(function (n) { return n.period_start; }));
      var maxY = Math.max.apply(null, dated.map(function (n) { return n.ongoing ? now : (n.period_end || n.period_start); }));
      var lane = {};
      var owner = [];
      dated.sort(function (a, b) { return a.period_start - b.period_start; });

      function name(n) {
        var t = K.parseTitle(n.title);
        return t.rest || t.full;
      }
      function period(n) {
        if (n.ongoing) return 'od ' + n.period_start;
        return n.period_end && n.period_end !== n.period_start ? n.period_start + '–' + n.period_end : String(n.period_start);
      }

      var sets = cats.map(function (cat, ci) {
        var items = dated.filter(function (n) { return n.category === cat; });
        return {
          label: cat + ' (' + items.length + ')', color: K.V.PALETTE[ci % K.V.PALETTE.length],
          data: items.map(function (n) {
            var k = (lane[cat] = (lane[cat] || 0) + 1);
            return { x: n.period_start, y: ci + ((k % 5) - 2) * 0.13, n: n };
          }),
        };
      });

      function show(n) {
        if (!detail) return;
        K.clear(detail);
        detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', name(n)));
        detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm mt-1', n.category + ' • ' + period(n) + (n.place ? ' • ' + n.place : '')));
        var p = K.h('p', 'mt-2 text-sm');
        p.appendChild(K.link(n, '→ stránka případu'));
        detail.appendChild(p);
      }

      if (detail && undated.length) {
        K.clear(detail);
        detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm', 'Bez určeného období (' + undated.length + '):'));
        detail.appendChild(K.list(undated, name));
      }

      K.chart(canvas, function (t, el) {
        var hd = K.head(t, el, dated.length + ' historických případů knihy podle začátku období (čára = trvání)', true);
        var series = [];
        owner = [];
        sets.forEach(function (ds) {
          var spans = ds.data.filter(function (pt) {
            var end = pt.n.ongoing ? now : pt.n.period_end;
            return end && end > pt.n.period_start;
          });
          // Trvání (do současnosti čárkovaně) pod body téže řady; legenda přepíná obojí.
          if (spans.length) {
            owner.push(null);
            series.push({
              type: 'lines', name: ds.label, coordinateSystem: 'cartesian2d', silent: true, z: 1,
              data: spans.map(function (pt) {
                return { coords: [[pt.n.period_start, pt.y], [pt.n.ongoing ? now : pt.n.period_end, pt.y]],
                  lineStyle: { type: pt.n.ongoing ? 'dashed' : 'solid' } };
              }),
              lineStyle: { color: ds.color, width: 2, opacity: 0.6 },
            });
          }
          owner.push(ds);
          series.push({
            type: 'scatter', name: ds.label, cursor: 'pointer', z: 3, symbolSize: 12,
            itemStyle: { color: ds.color, borderColor: t.surface, borderWidth: 1 },
            emphasis: { scale: 1.5 },
            data: ds.data.map(function (pt) { return [pt.x, pt.y]; }),
          });
        });
        return {
          title: hd.title,
          legend: Object.assign(hd.legend, { data: sets.map(function (ds) { return { name: ds.label, icon: 'circle' }; }) }),
          tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
            var pt = owner[p.seriesIndex] && owner[p.seriesIndex].data[p.dataIndex];
            return pt ? '<b>' + L.esc(name(pt.n)) + '</b><br>' + L.esc(period(pt.n)) : '';
          } }, K.V.tooltip(t)),
          grid: { left: 8, right: 16, top: hd.top, bottom: 56, containLabel: true },
          xAxis: K.V.axis(t, { type: 'value', min: minY - 5, max: maxY + 5, name: 'Rok', nameLocation: 'middle',
            nameGap: 26, axisLabel: { color: t.muted, formatter: function (v) { return String(v); } } }),
          yAxis: K.V.axis(t, { type: 'value', inverse: true, min: -0.6, max: cats.length - 0.4,
            axisTick: { show: false }, splitLine: { show: false },
            axisLabel: { color: t.muted, fontSize: 11, width: 140, overflow: 'truncate',
              customValues: cats.map(function (c, i) { return i; }),
              formatter: function (v) { return cats[Math.round(v)] || ''; } } }),
          dataZoom: [{ type: 'slider', xAxisIndex: 0, height: 16, bottom: 6, filterMode: 'none',
            textStyle: { color: t.muted }, borderColor: t.grid },
            { type: 'inside', xAxisIndex: 0, filterMode: 'none', zoomOnMouseWheel: 'ctrl', moveOnMouseWheel: false }],
          series: series,
        };
      }).then(function (chart) {
        chart.on('click', function (p) {
          if (p.seriesType !== 'scatter') return;
          var pt = owner[p.seriesIndex] && owner[p.seriesIndex].data[p.dataIndex];
          if (pt) show(pt.n);
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
