// Kapitola 6 — klinická cesta zotavení (Chart.js sloupce + oblouky vazeb). Fáze, jejich popis
// a stránky přebírá z číslovaného seznamu v textu stránky nad grafem (tučný název fáze, odkazy
// v položce); čísla kapitol z názvů stránek v grafu knihy; oblouky = počet odkazů mezi
// stránkami fází podle grafu. Klik na sloupec → fáze, její stránky a vazby.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  // Fáze ze seznamu <ol> nad grafem: „**Assessment** — popis, [odkaz](…), …“.
  function stagesNear(el, K) {
    var ol = null;
    for (var p = K.anchor(el).previousElementSibling; p && !ol; p = p.previousElementSibling) {
      if (p.tagName === 'OL') ol = p;
      else if (p.querySelector) ol = p.querySelector('ol');
    }
    if (!ol) return [];
    return Array.prototype.map.call(ol.children, function (li, i) {
      var strong = li.querySelector('strong, b');
      var name = strong ? strong.textContent.trim() : li.textContent.split(/\s[—–-]\s/)[0].trim();
      var desc = li.textContent.replace(name, '').replace(/^\s*[—–-]\s*/, '').trim();
      var nodes = [];
      li.querySelectorAll('a[href]').forEach(function (a) {
        var n = K.nodeOfHref(a.getAttribute('href'));
        if (n && nodes.indexOf(n) < 0) nodes.push(n);
      });
      return { id: i + 1, name: name, desc: desc, nodes: nodes, color: K.V.PALETTE[i % K.V.PALETTE.length] };
    });
  }

  function pageLabel(K, n) {
    var t = K.parseTitle(n.title);
    return (t.num ? t.num + ' ' : '') + t.full.replace(/^\d+(\.\d+)*\s+/, '');
  }

  function init() {
    var canvas = document.getElementById('section-06-recovery-flow');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('recovery-flow-detail');
    kniha().then(function (K) {
      var stages = stagesNear(canvas, K);
      if (!stages.length) throw new Error('nad grafem chybí seznam fází');
      var flows = [];
      stages.forEach(function (a) {
        stages.forEach(function (b) {
          if (a === b) return;
          var n = K.linksFrom(a.nodes.map(function (x) { return x.id; }), b.nodes.map(function (x) { return x.id; }));
          if (n) flows.push({ from: a.id, to: b.id, weight: n });
        });
      });
      var maxW = Math.max.apply(null, flows.map(function (f) { return f.weight; }).concat([1]));
      var maxN = Math.max.apply(null, stages.map(function (s) { return s.nodes.length; }).concat([1]));
      var selected = null;

      function show(s) {
        if (!detail) return;
        K.clear(detail);
        detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', 'Fáze ' + s.id + ' — ' + s.name));
        if (s.desc) detail.appendChild(K.h('p', 'text-slate-300 mt-1', s.desc));
        detail.appendChild(K.h('p', 'text-slate-300 mt-3 font-semibold', 'Stránky knihy u této fáze (' + s.nodes.length + '):'));
        if (s.nodes.length) {
          detail.appendChild(K.list(s.nodes, function (n) { return pageLabel(K, n); }));
        } else {
          detail.appendChild(K.h('p', 'text-slate-400 text-sm', 'Text stránky u této fáze žádnou stránku neodkazuje.'));
        }
        var rel = flows.filter(function (f) { return f.from === s.id || f.to === s.id; });
        if (rel.length) {
          detail.appendChild(K.h('p', 'text-slate-300 mt-3 font-semibold', 'Odkazy mezi fázemi podle grafu knihy:'));
          var ul = K.h('ul', 'text-slate-300 list-disc list-inside text-sm');
          rel.forEach(function (f) {
            ul.appendChild(K.h('li', null, stages[f.from - 1].name + ' → ' + stages[f.to - 1].name + ': ' + f.weight));
          });
          detail.appendChild(ul);
        }
      }

      K.chart(canvas, function (c) {
        return {
          type: 'bar',
          data: {
            labels: stages.map(function (s) { return s.name; }),
            datasets: [{
              label: 'Stránky fáze',
              data: stages.map(function (s) { return s.nodes.length; }),
              backgroundColor: stages.map(function (s) { return s.color + 'CC'; }),
              borderColor: stages.map(function (s) { return s.color; }),
              borderWidth: stages.map(function (s) { return s.id === selected ? 5 : 2; }),
              maxBarThickness: 70,
            }],
          },
          options: {
            responsive: true,
            interaction: { mode: 'index', intersect: false },
            layout: { padding: { top: 10 } },
            plugins: {
              title: { display: true, color: c.text,
                text: 'Klinická cesta: stránky fází a odkazy mezi nimi podle knihy (klik na fázi)' },
              legend: { display: false },
              tooltip: { callbacks: { label: function (ctx) { return ctx.parsed.y + ' stránek knihy'; } } },
            },
            scales: {
              x: { ticks: { color: c.muted }, grid: { color: c.grid },
                title: { display: true, text: 'Fáze (podle textu stránky)', color: c.text } },
              y: { min: 0, suggestedMax: maxN * 2 + 1, ticks: { color: c.muted, stepSize: 1 }, grid: { color: c.grid },
                title: { display: true, text: 'Odkazované stránky', color: c.text } },
            },
            onClick: function (e, els, chart) {
              if (!els.length) return;
              var s = stages[els[0].index];
              selected = s.id;
              show(s);
              chart.data.datasets[0].borderWidth = stages.map(function (x) { return x.id === selected ? 5 : 2; });
              chart.update('none');
            },
          },
          plugins: [{
            id: 'flowOverlay',
            afterDraw: function (chart) {
              var ctx = chart.ctx;
              var meta = chart.getDatasetMeta(0);
              var yBase = chart.scales.y.getPixelForValue(maxN + 0.5);
              ctx.save();
              flows.forEach(function (f) {
                var a = meta.data[f.from - 1];
                var b = meta.data[f.to - 1];
                if (!a || !b) return;
                var fwd = f.to > f.from;
                var x1 = a.x;
                var x2 = b.x;
                var lift = (Math.abs(f.to - f.from) * 22 + 14) * (fwd ? 1 : -0.6);
                var y = yBase - (fwd ? 0 : -8);
                var yArc = y - lift;
                ctx.beginPath();
                ctx.moveTo(x1, y);
                ctx.bezierCurveTo(x1, yArc, x2, yArc, x2, y);
                var alpha = 0.25 + 0.6 * f.weight / maxW;
                ctx.strokeStyle = c.dark ? 'rgba(148,163,184,' + alpha + ')' : 'rgba(71,85,105,' + alpha + ')';
                ctx.lineWidth = 1 + 4 * f.weight / maxW;
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo(x2, y);
                ctx.lineTo(x2 - 4, y - (fwd ? 8 : -8));
                ctx.lineTo(x2 + 4, y - (fwd ? 8 : -8));
                ctx.closePath();
                ctx.fillStyle = ctx.strokeStyle;
                ctx.fill();
                ctx.fillStyle = c.muted;
                ctx.font = '10px sans-serif';
                ctx.textAlign = 'center';
                ctx.fillText(String(f.weight), (x1 + x2) / 2, y - lift * 0.75 - (fwd ? 2 : -10));
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
