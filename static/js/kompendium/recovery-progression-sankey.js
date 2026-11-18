// Průběh zotavení jako sankey (ECharts). Fáze a jejich protokoly přebírá
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
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('recovery-sankey');
    var detail = document.getElementById('recovery-sankey-detail');
    if (!canvas) return;
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

    function show(s) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h4', 'font-bold text-lg mb-2', s.group.title));
      if (s.group.text) detail.appendChild(K.h('p', 'mb-3', s.group.text));
      detail.appendChild(K.h('h5', 'font-semibold mb-1 text-gray-700 dark:text-gray-300', 'Protokoly fáze podle rejstříku (' + s.ids.length + '):'));
      detail.appendChild(K.list(s.group.nodes));
    }

    // Uzel = fáze (hodnota = počet protokolů, sloupec = pořadí fáze), pás = odkazy mezi
    // protokoly sousedních fází. Fáze bez odkazů zůstává ve svém sloupci (depth).
    K.chart(canvas, function (t, el) {
      var hd = K.head(t, el, 'Výška sloupce = počet protokolů fáze; pás = odkazy mezi protokoly sousedních fází v knize.');
      var last = stages.length - 1;
      return {
        title: hd.title,
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          if (p.dataType === 'edge') {
            return L.esc(p.data.source + ' → ' + p.data.target) + ': ' + L.count(p.data.value, ['odkaz', 'odkazy', 'odkazů']);
          }
          var st = stages[p.dataIndex];
          return '<b>' + L.esc(st.group.title) + '</b><br>' + L.count(st.ids.length, ['protokol', 'protokoly', 'protokolů']);
        } }, K.V.tooltip(t)),
        series: [{
          type: 'sankey', left: 16, right: 16, top: hd.top + 8, bottom: 52, nodeWidth: 22, nodeGap: 12,
          layoutIterations: 0, draggable: false, cursor: 'pointer',
          emphasis: { focus: 'adjacency' },
          lineStyle: { color: 'gradient', curveness: 0.5, opacity: 0.45 },
          label: { color: t.text, fontSize: 11 },
          data: stages.map(function (s, i) {
            return {
              name: s.title, depth: i, value: Math.max(1, s.ids.length),
              itemStyle: { color: s.color, borderColor: s.color },
              label: { position: 'bottom', distance: 6, align: i === 0 ? 'left' : i === last ? 'right' : 'center',
                formatter: s.title + (s.note ? '\n' + s.note : '') + '\n' +
                  L.count(s.ids.length, ['protokol', 'protokoly', 'protokolů']) },
            };
          }),
          links: flows.map(function (f, i) {
            return f ? { source: stages[i].title, target: stages[i + 1].title, value: f } : null;
          }).filter(Boolean),
        }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.dataType === 'node' && stages[p.dataIndex]) show(stages[p.dataIndex]); });
    });

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', null, 'Klikněte na sloupec fáze pro výpis jejích protokolů. '));
      detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
