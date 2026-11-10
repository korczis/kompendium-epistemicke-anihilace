// Sankey-like průběh zotavení (Chart.js, vlastní plugin). Fáze a jejich protokoly přebírá
// z rejstříku longitudinálních protokolů knihy (nadpisy a odkazy pod nimi); výška sloupce =
// počet protokolů fáze, šířka pásu mezi sousedními fázemi = počet odkazů z protokolů jedné
// fáze na protokoly další podle grafu knihy. Žádné smyšlené podíly pacientů.
// Klik na sloupec → popis fáze z rejstříku a její protokoly.
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu protokolů zotavení (cesta v grafu knihy).
  var SOURCE = 'kompendium/recovery-protocols/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var canvas = document.getElementById('recovery-sankey');
    var detail = document.getElementById('recovery-sankey-detail');
    if (!canvas || typeof Chart === 'undefined') return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, canvas, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, canvas, detail) {
    var stages = groups.map(function (gr, i) {
      var m = /^(.*?)\s*\((.*)\)\s*$/.exec(gr.title);
      return {
        group: gr, title: m ? m[1] : gr.title, note: m ? m[2] : '',
        ids: gr.nodes.map(function (n) { return n.id; }),
        color: K.V.PALETTE[i % K.V.PALETTE.length],
      };
    });
    var flows = stages.slice(0, -1).map(function (s, i) { return K.linksFrom(s.ids, stages[i + 1].ids); });
    var maxN = Math.max.apply(null, stages.map(function (s) { return s.ids.length; }).concat([1]));
    var maxF = Math.max.apply(null, flows.concat([1]));
    var bars = [];

    function show(s) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h4', 'font-bold text-lg mb-2', s.group.title));
      if (s.group.text) detail.appendChild(K.h('p', 'mb-3', s.group.text));
      detail.appendChild(K.h('h5', 'font-semibold mb-1 text-slate-300', 'Protokoly fáze podle rejstříku (' + s.ids.length + '):'));
      detail.appendChild(K.list(s.group.nodes));
    }

    var plugin = {
      id: 'sankeyFlow',
      afterDraw: function (chart) {
        var c = K.chartColors();
        var ctx = chart.ctx;
        var area = chart.chartArea;
        if (!area) return;
        var W = area.right - area.left;
        var H = area.bottom - area.top;
        var n = stages.length;
        var bw = W / n * 0.6;
        var gap = W / n * 0.4;
        ctx.save();
        bars = stages.map(function (s, i) {
          var bh = Math.max(4, (s.ids.length / maxN) * H * 0.62);
          return { x: area.left + i * (bw + gap) + gap / 2, y: area.top + 34 + (H * 0.62 - bh) / 2, bw: bw, bh: bh, s: s };
        });
        for (var i = 0; i < bars.length - 1; i++) {
          var a = bars[i];
          var b = bars[i + 1];
          if (!flows[i]) continue;
          var ha = a.bh * 0.85 * flows[i] / maxF;
          var hb = b.bh * 0.85 * flows[i] / maxF;
          var ya = a.y + (a.bh - ha) / 2;
          var yb = b.y + (b.bh - hb) / 2;
          var mid = (a.x + a.bw + b.x) / 2;
          var grad = ctx.createLinearGradient(a.x + a.bw, 0, b.x, 0);
          grad.addColorStop(0, a.s.color);
          grad.addColorStop(1, b.s.color);
          ctx.fillStyle = grad;
          ctx.globalAlpha = 0.45;
          ctx.beginPath();
          ctx.moveTo(a.x + a.bw, ya);
          ctx.bezierCurveTo(mid, ya, mid, yb, b.x, yb);
          ctx.lineTo(b.x, yb + hb);
          ctx.bezierCurveTo(mid, yb + hb, mid, ya + ha, a.x + a.bw, ya + ha);
          ctx.closePath();
          ctx.fill();
          ctx.globalAlpha = 1;
          ctx.fillStyle = c.muted;
          ctx.font = '11px sans-serif';
          ctx.textAlign = 'center';
          ctx.fillText(flows[i] + ' odk.', mid, Math.min(ya, yb) - 6);
        }
        bars.forEach(function (b) {
          ctx.fillStyle = b.s.color;
          ctx.fillRect(b.x, b.y, b.bw, b.bh);
          ctx.textAlign = 'center';
          ctx.fillStyle = c.text;
          ctx.font = 'bold 12px sans-serif';
          ctx.fillText(b.s.title, b.x + b.bw / 2, area.top + 12, b.bw + gap * 0.9);
          if (b.s.note) {
            ctx.fillStyle = c.muted;
            ctx.font = '11px sans-serif';
            ctx.fillText(b.s.note, b.x + b.bw / 2, area.top + 26, b.bw + gap * 0.9);
          }
          ctx.fillStyle = c.muted;
          ctx.font = '11px sans-serif';
          ctx.fillText(b.s.ids.length + ' protokolů', b.x + b.bw / 2, b.y + b.bh + 16);
        });
        ctx.fillStyle = c.muted;
        ctx.font = '11px sans-serif';
        ctx.textAlign = 'left';
        ctx.fillText('Výška sloupce = počet protokolů fáze; pás = odkazy mezi protokoly sousedních fází v knize.',
          area.left, area.bottom - 4, W);
        ctx.restore();
      },
    };

    K.chart(canvas, function () {
      return {
        type: 'bar',
        data: { labels: stages.map(function (s) { return s.title; }), datasets: [{ data: stages.map(function () { return 0; }), backgroundColor: 'rgba(0,0,0,0)' }] },
        options: {
          responsive: true,
          plugins: { legend: { display: false }, tooltip: { enabled: false } },
          scales: { x: { display: false }, y: { display: false, beginAtZero: true, max: 1 } },
        },
        plugins: [plugin],
      };
    });

    canvas.addEventListener('click', function (ev) {
      var r = canvas.getBoundingClientRect();
      var sx = canvas.clientWidth / r.width;
      var mx = (ev.clientX - r.left) * sx;
      var my = (ev.clientY - r.top) * sx;
      bars.forEach(function (b) {
        if (mx >= b.x && mx <= b.x + b.bw && my >= b.y - 4 && my <= b.y + b.bh + 4) show(b.s);
      });
    });

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', null, 'Klikněte na sloupec fáze pro výpis jejích protokolů. '));
      detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
