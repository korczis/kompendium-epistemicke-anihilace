// Kapitola 3 — techniky jedné rodiny EA podle podrodiny a úrovně rizika (Chart.js scatter
// s vazbami). Rodinu určuje kód EA-N v textu nad grafem, techniky, kódy a názvy dává graf
// knihy, názvy podrodin a riziko katalog technik, hrany jsou odkazy mezi stránkami technik.
// Klik na bod → detail techniky, vazby a odkaz na její stránku.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var canvas = document.getElementById('section-03-progression');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('progression-detail');
    kniha().then(function (K) {
      return K.catalogue().catch(function () { return null; }).then(function (cat) { draw(K, cat, canvas, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, cat, canvas, detail) {
    var fid = K.familyNear(canvas);
    var techs = K.techniques.filter(function (t) { return t.family === fid; });
    var subs = [];
    techs.forEach(function (t) { if (subs.indexOf(t.sub) < 0) subs.push(t.sub); });
    var subName = K.subNames(cat);
    var levels = [];
    var risk = {};
    techs.forEach(function (t) {
      var r = cat ? K.riskOf(cat, t) : { id: '', label: 'neuvedeno', order: 99 };
      risk[t.id] = r;
      if (!levels.some(function (l) { return l.id === r.id; })) levels.push(r);
    });
    levels.sort(function (a, b) { return a.order - b.order; });
    var edges = K.edgesAmong(techs.map(function (t) { return t.id; }));
    var nb = {};
    techs.forEach(function (t) { nb[t.id] = []; });
    edges.forEach(function (e) { nb[e.a].push(e.b); nb[e.b].push(e.a); });

    // pozice: x = podrodina (s rozestupem v buňce), y = úroveň rizika
    var cell = {};
    var pos = {};
    techs.forEach(function (t) {
      var x = subs.indexOf(t.sub);
      var y = levels.indexOf(levels.filter(function (l) { return l.id === risk[t.id].id; })[0]);
      var k = x + '|' + y;
      (cell[k] = cell[k] || []).push(t);
      pos[t.id] = { x: x, y: y };
    });
    Object.keys(cell).forEach(function (k) {
      var list = cell[k];
      list.forEach(function (t, i) {
        var spread = Math.min(0.7, 0.14 * (list.length - 1));
        pos[t.id].x += list.length > 1 ? -spread / 2 + spread * i / (list.length - 1) : 0;
        pos[t.id].y += (i % 2 ? 0.12 : -0.12) * (list.length > 1 ? 1 : 0);
      });
    });
    var byId = {};
    techs.forEach(function (t) { byId[t.id] = t; });
    var selected = null;

    function subLabel(s) { return s + (subName[s] ? ' ' + subName[s] : ''); }

    function show(t) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', t.code + ' — ' + t.label));
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', 'Podrodina: ' + subLabel(t.sub)));
      detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', 'Úroveň rizika: ' + risk[t.id].label));
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-2 font-semibold',
        'Vazby na techniky ' + fid + ' podle odkazů v knize (' + nb[t.id].length + '):'));
      detail.appendChild(K.list(nb[t.id].map(function (id) { return byId[id].node; }), function (n) {
        return K.techniqueText(K.technique(n));
      }));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(t.node, '→ stránka techniky'));
      detail.appendChild(p);
    }

    K.chart(canvas, function (c) {
      var edgeData = [];
      edges.forEach(function (e) {
        edgeData.push(pos[e.a], pos[e.b], { x: NaN, y: NaN });
      });
      var sets = subs.map(function (s, i) {
        var col = K.V.PALETTE[i % K.V.PALETTE.length];
        return {
          label: subLabel(s),
          data: techs.filter(function (t) { return t.sub === s; }).map(function (t) {
            return { x: pos[t.id].x, y: pos[t.id].y, t: t };
          }),
          backgroundColor: col, borderColor: col, showLine: false,
          pointRadius: function (ctx) {
            var t = ctx.raw && ctx.raw.t;
            if (!selected || !t) return 7;
            if (t.id === selected) return 12;
            return nb[selected].indexOf(t.id) >= 0 ? 9 : 4;
          },
          pointHoverRadius: 11,
        };
      });
      return {
        type: 'scatter',
        data: { datasets: [{
          label: 'Vazby', data: edgeData, showLine: true, pointRadius: 0, borderWidth: 1,
          borderColor: c.dark ? 'rgba(148,163,184,0.25)' : 'rgba(100,116,139,0.3)', spanGaps: false,
        }].concat(sets) },
        options: {
          responsive: true,
          plugins: {
            title: { display: true, color: c.text,
              text: fid + ' ' + K.familyName(fid) + ': ' + techs.length + ' stránek technik, ' + edges.length +
                ' vazeb podle odkazů v knize (klik = detail)' },
            legend: { labels: { color: c.text, filter: function (item) { return item.datasetIndex > 0; } } },
            tooltip: {
              filter: function (ctx) { return ctx.raw && ctx.raw.t; },
              callbacks: {
                title: function (items) { return K.techniqueText(items[0].raw.t); },
                label: function (ctx) {
                  var t = ctx.raw.t;
                  return 'riziko ' + risk[t.id].label + ' | ' + nb[t.id].length + ' vazeb';
                },
              },
            },
          },
          scales: {
            x: {
              type: 'linear', min: -0.6, max: subs.length - 0.4, afterBuildTicks: K.intTicks(subs.length),
              ticks: { color: c.muted, stepSize: 1, callback: function (v) { return subs[v] || ''; } },
              grid: { color: c.grid },
              title: { display: true, text: 'Podrodina (kód z cesty stránky)', color: c.text },
            },
            y: {
              type: 'linear', min: -0.6, max: levels.length - 0.4, afterBuildTicks: K.intTicks(levels.length),
              ticks: { color: c.muted, stepSize: 1, callback: function (v) { return levels[v] ? levels[v].label : ''; } },
              grid: { color: c.grid },
              title: { display: true, text: 'Úroveň rizika (katalog technik)', color: c.text },
            },
          },
          onClick: function (e, els, chart) {
            var el = els.filter(function (x) { return x.datasetIndex > 0; })[0];
            if (!el) return;
            var t = chart.data.datasets[el.datasetIndex].data[el.index].t;
            selected = t.id;
            show(t);
            chart.update('none');
          },
        },
      };
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
