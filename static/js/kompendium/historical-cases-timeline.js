// Historické případy na časové ose (Chart.js scatter). Případy, jejich kategorie, místo
// a období jsou pole stránek historických případů v grafu knihy (category, place,
// period_start, period_end, ongoing). X = začátek období, čára = trvání (u trvajících do
// současnosti), Y = kategorie. Klik na bod → případ a odkaz na jeho stránku.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var canvas = document.getElementById('historical-cases-timeline');
    var detail = document.getElementById('historical-cases-detail');
    if (!canvas || typeof Chart === 'undefined') return;
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
        var col = K.V.PALETTE[ci % K.V.PALETTE.length];
        return {
          label: cat + ' (' + dated.filter(function (n) { return n.category === cat; }).length + ')',
          data: dated.filter(function (n) { return n.category === cat; }).map(function (n) {
            var k = (lane[cat] = (lane[cat] || 0) + 1);
            return { x: n.period_start, y: ci + ((k % 5) - 2) * 0.13, n: n };
          }),
          backgroundColor: col + 'D9', borderColor: col, pointRadius: 6, pointHoverRadius: 9,
        };
      });

      function show(n) {
        if (!detail) return;
        K.clear(detail);
        detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', name(n)));
        detail.appendChild(K.h('p', 'text-slate-400 text-sm mt-1', n.category + ' • ' + period(n) + (n.place ? ' • ' + n.place : '')));
        var p = K.h('p', 'mt-2 text-sm');
        p.appendChild(K.link(n, '→ stránka případu'));
        detail.appendChild(p);
      }

      if (detail && undated.length) {
        K.clear(detail);
        detail.appendChild(K.h('p', 'text-slate-300 text-sm', 'Bez určeného období (' + undated.length + '):'));
        detail.appendChild(K.list(undated, name));
      }

      K.chart(canvas, function (c) {
        return {
          type: 'scatter',
          data: { datasets: sets },
          options: {
            responsive: true,
            plugins: {
              title: { display: true, color: c.text,
                text: dated.length + ' historických případů knihy podle začátku období (čára = trvání)' },
              legend: { labels: { color: c.text } },
              tooltip: { callbacks: { label: function (ctx) { return name(ctx.raw.n) + ' (' + period(ctx.raw.n) + ')'; } } },
            },
            scales: {
              x: { title: { display: true, text: 'Rok', color: c.text }, min: minY - 5, max: maxY + 5,
                ticks: { color: c.muted, callback: function (v) { return String(v); } }, grid: { color: c.grid } },
              y: { min: -0.6, max: cats.length - 0.4, reverse: true, afterBuildTicks: K.intTicks(cats.length),
                ticks: { stepSize: 1, color: c.muted, callback: function (v) { return cats[v] || ''; } },
                grid: { color: c.grid } },
            },
            onClick: function (e, els, chart) {
              if (els.length) show(chart.data.datasets[els[0].datasetIndex].data[els[0].index].n);
            },
          },
          plugins: [{
            id: 'trvani',
            beforeDatasetsDraw: function (chart) {
              var ctx = chart.ctx;
              ctx.save();
              chart.data.datasets.forEach(function (ds, di) {
                ds.data.forEach(function (pt) {
                  var n = pt.n;
                  var end = n.ongoing ? now : n.period_end;
                  if (!end || end <= n.period_start) return;
                  var y = chart.scales.y.getPixelForValue(pt.y);
                  ctx.strokeStyle = ds.borderColor;
                  ctx.globalAlpha = 0.6;
                  ctx.lineWidth = 2;
                  ctx.setLineDash(n.ongoing ? [4, 3] : []);
                  ctx.beginPath();
                  ctx.moveTo(chart.scales.x.getPixelForValue(n.period_start), y);
                  ctx.lineTo(chart.scales.x.getPixelForValue(end), y);
                  ctx.stroke();
                });
              });
              ctx.restore();
            },
          }],
        };
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
