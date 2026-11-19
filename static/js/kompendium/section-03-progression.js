// Kapitola 3 — techniky jedné rodiny EA podle podrodiny a úrovně rizika (ECharts, síť
// v kartézských souřadnicích). Rodinu určuje kód EA-N v textu nad grafem, techniky, kódy a názvy dává graf
// knihy, názvy podrodin a riziko katalog technik, hrany jsou odkazy mezi stránkami technik.
// Klik na bod → detail techniky, vazby a odkaz na její stránku.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('section-03-progression');
    if (!canvas) return;
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

    // Uzly stojí na osách (x = podrodina, y = úroveň rizika), hrany jsou odkazy mezi stránkami
    // technik. Najetí zvýrazní sousedy, klik vybere techniku (rámeček) a vypíše detail.
    K.chart(canvas, function (t, el) {
      var hd = K.head(t, el, fid + ' ' + K.familyName(fid) + ': ' + techs.length + ' stránek technik, ' +
        edges.length + ' vazeb podle odkazů v knize (klik = detail)', true);
      return {
        title: hd.title,
        legend: Object.assign(hd.legend, { data: subs.map(subLabel) }),
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          if (p.dataType !== 'node') return '';
          var x = techs[p.dataIndex];
          return '<b>' + L.esc(K.techniqueText(x)) + '</b><br>riziko ' + L.esc(risk[x.id].label) + ' | ' +
            L.count(nb[x.id].length, ['vazba', 'vazby', 'vazeb']);
        } }, K.V.tooltip(t)),
        grid: { left: 8, right: 16, top: hd.top + 22, bottom: 36 },
        xAxis: K.V.axis(t, { type: 'value', min: -0.6, max: subs.length - 0.4,
          name: 'Podrodina (kód z cesty stránky)', nameLocation: 'middle', nameGap: 26,
          axisTick: { customValues: subs.map(function (x, i) { return i; }) },
          splitLine: { show: false },
          axisLabel: { color: t.muted, customValues: subs.map(function (x, i) { return i; }),
            formatter: function (v) { return subs[Math.round(v)] || ''; } } }),
        yAxis: K.V.axis(t, { type: 'value', min: -0.6, max: levels.length - 0.4,
          name: 'Úroveň rizika (katalog technik)', nameLocation: 'end', nameGap: 10,
          nameTextStyle: { color: t.muted, align: 'left' },
          axisTick: { customValues: levels.map(function (x, i) { return i; }) },
          splitLine: { show: false },
          axisLabel: { color: t.muted, customValues: levels.map(function (x, i) { return i; }),
            formatter: function (v) { return levels[Math.round(v)] ? levels[Math.round(v)].label : ''; } } }),
        series: [{
          type: 'graph', coordinateSystem: 'cartesian2d', cursor: 'pointer', symbolSize: 14,
          selectedMode: 'single', select: { itemStyle: { borderColor: t.text, borderWidth: 3 } },
          emphasis: { focus: 'adjacency', lineStyle: { color: t.primary, opacity: 0.95, width: 2 } },
          blur: { itemStyle: { opacity: 0.25 }, lineStyle: { opacity: 0.06 } },
          categories: subs.map(function (sub, i) {
            return { name: subLabel(sub), itemStyle: { color: K.V.PALETTE[i % K.V.PALETTE.length] } };
          }),
          data: techs.map(function (x) {
            return { id: String(x.id), name: x.code, value: [pos[x.id].x, pos[x.id].y], category: subs.indexOf(x.sub),
              itemStyle: { borderColor: t.surface, borderWidth: 1 } };
          }),
          links: edges.map(function (e) { return { source: String(e.a), target: String(e.b) }; }),
          lineStyle: { color: t.edge, opacity: 0.45, width: 1 },
        }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.dataType === 'node' && techs[p.dataIndex]) show(techs[p.dataIndex]); });
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
