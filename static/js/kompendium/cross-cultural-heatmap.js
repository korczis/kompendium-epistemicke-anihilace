// Mezinárodní perspektivy × rodiny EA (ECharts, teplotní mapa). Řádky = stránky oddílu
// mezinárodních perspektiv seskupené podle jeho rejstříku (nadpisy a odkazy pod nimi), sloupce
// = rodiny EA z grafu knihy, hodnota = počet odkazů ze stránky regionu na stránky technik
// dané rodiny. Kniha neuvádí prevalenci, proto graf žádnou nepočítá ani neodhaduje.
// Klik na buňku → region, rodina a odkazované techniky.
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu mezinárodních perspektiv (cesta v grafu knihy).
  var SOURCE = 'kompendium/international/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('cross-cultural-heatmap');
    var detail = document.getElementById('cross-cultural-detail');
    if (!canvas) return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, canvas, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, canvas, detail) {
    var fams = K.familyIds;
    var rows = [];
    groups.forEach(function (gr) {
      gr.nodes.forEach(function (n) {
        var cells = {};
        K.g.out[n.id].forEach(function (b) {
          var t = K.technique(K.g.byId[b]);
          if (t) (cells[t.family] = cells[t.family] || []).push(t);
        });
        if (Object.keys(cells).length) rows.push({ node: n, group: gr.title, cells: cells });
      });
    });
    var max = 1;
    var data = [];
    rows.forEach(function (r, y) {
      fams.forEach(function (fid, x) {
        var items = r.cells[fid] || [];
        max = Math.max(max, items.length);
        data.push({ x: x, y: y, v: items.length, row: r, fam: fid, items: items });
      });
    });

    function rowLabel(r) { return K.parseTitle(r.node.title).head; }

    function show(d) {
      if (!detail) return;
      K.clear(detail);
      var h = K.h('h3', 'text-lg font-bold text-amber-300');
      h.appendChild(K.link(d.row.node, rowLabel(d.row), 'text-amber-300 underline'));
      h.appendChild(document.createTextNode(' × ' + d.fam + ' ' + K.familyName(d.fam)));
      detail.appendChild(h);
      detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm mt-1', d.row.group));
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', d.v ? 'Stránka odkazuje na ' + d.v + ' stránek technik této rodiny:'
        : 'Stránka na techniky této rodiny neodkazuje.'));
      if (d.v) detail.appendChild(K.list(d.items.map(function (t) { return t.node; }), function (n) {
        return K.techniqueText(K.technique(n));
      }));
    }

    // Řádek = stránka regionu, sloupec = rodina EA, barva = počet odkazů (0 = šedá buňka).
    // Výška plochy roste s počtem řádků, aby popisky zůstaly čitelné.
    K.chart(canvas, function (t, el) {
      var hd = K.head(t, el, 'Mezinárodní perspektivy × rodiny EA: odkazy ze stránek na techniky (' + rows.length + ' stránek)');
      return {
        title: hd.title,
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          var d = data[p.dataIndex];
          return L.esc(rowLabel(d.row) + ' × ' + d.fam) + ': ' + L.count(d.v, ['odkaz', 'odkazy', 'odkazů']);
        } }, K.V.tooltip(t)),
        grid: { left: 8, right: 16, top: hd.top + 24, bottom: 48 },
        xAxis: { type: 'category', position: 'top', data: fams, axisTick: { show: false },
          axisLine: { lineStyle: { color: t.grid } }, axisLabel: { color: t.muted } },
        yAxis: { type: 'category', inverse: true, data: rows.map(rowLabel), axisTick: { show: false },
          axisLine: { lineStyle: { color: t.grid } },
          axisLabel: { color: t.muted, fontSize: 10, interval: 0, width: 160, overflow: 'truncate' } },
        visualMap: { type: 'continuous', min: 0, max: max, calculable: true, orient: 'horizontal', left: 'center',
          bottom: 4, itemHeight: 120, textStyle: { color: t.muted },
          inRange: { color: t.dark ? ['#334155', '#b45309', '#fbbf24'] : ['#e2e8f0', '#f59e0b', '#b45309'] } },
        series: [{
          type: 'heatmap', cursor: 'pointer',
          data: data.map(function (d) { return [d.x, d.y, d.v]; }),
          label: { show: true, fontSize: 10, color: t.text, textBorderColor: t.surface, textBorderWidth: 2,
            formatter: function (p) { return p.value[2] || ''; } },
          itemStyle: { borderColor: t.surface, borderWidth: 2, borderRadius: 2 },
          emphasis: { itemStyle: { borderColor: t.text, borderWidth: 1.5 } },
        }],
      };
    }, { height: Math.max(360, rows.length * 24 + 170) }).then(function (chart) {
      chart.on('click', function (p) { if (p.componentType === 'series') show(data[p.dataIndex]); });
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
