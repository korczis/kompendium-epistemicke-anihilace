// Fáze zotavení podle knihy (ECharts, vodorovné pruhy). Fáze a jejich orientační rámec čte
// z tabulky „Fáze | Orientační rámec | Klíčový úkol“ v rejstříku protokolů zotavení; délka
// pruhu je počet protokolů, které rejstřík k fázi řadí. Kniha fáze záměrně neváže na přesné
// týdny ani měsíce, proto graf nemá časovou osu: pořadí fází je pořadí v tabulce a rámec
// („první týdny“, „roky“…) je jen popisek. Klik na pruh → protokoly fáze.
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu protokolů zotavení (cesta v grafu knihy).
  var SOURCE = 'kompendium/recovery-protocols/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  // Řádky tabulky, jejíž hlavička obsahuje „Orientační rámec“: [{phase, frame, task}].
  function phaseTable(doc, K) {
    var tables = doc.querySelectorAll('table');
    for (var i = 0; i < tables.length; i++) {
      var head = Array.prototype.map.call(tables[i].querySelectorAll('thead th, tr:first-child th'), function (th) {
        return K.fold(th.textContent || '');
      });
      var fi = head.findIndex(function (t) { return t.indexOf('oriental') >= 0 || t.indexOf('orientacni') >= 0; });
      if (fi < 0) continue;
      var rows = [];
      tables[i].querySelectorAll('tbody tr').forEach(function (tr) {
        var td = tr.querySelectorAll('td');
        if (td.length < 2) return;
        rows.push({
          phase: (td[0].textContent || '').trim(),
          frame: (td[fi].textContent || '').trim(),
          task: td[fi + 1] ? (td[fi + 1].textContent || '').replace(/\s+/g, ' ').trim() : '',
        });
      });
      return rows;
    }
    return [];
  }

  function init() {
    var canvas = document.getElementById('recovery-trajectory');
    if (!canvas) return;
    var detail = document.getElementById('recovery-detail');
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return Promise.all([K.doc(idx), K.groups(idx)]).then(function (r) {
        var rows = phaseTable(r[0], K);
        var groups = r[1];
        if (!rows.length) throw new Error('rejstřík neobsahuje tabulku fází s orientačním rámcem');
        // Fázi přiřadit skupinu rejstříku, jejíž nadpis fázi jmenuje („Akutní“ ↔ „Akutní fáze“).
        var phases = rows.map(function (row) {
          var key = K.fold(row.phase);
          var gr = groups.filter(function (g) { return K.fold(g.title).indexOf(key) === 0; })[0] || null;
          return { row: row, group: gr, count: gr ? gr.nodes.length : 0 };
        });

        function show(p) {
          if (!detail) return;
          K.clear(detail);
          detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', p.row.phase + ' fáze'));
          detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', 'Orientační rámec: ' + p.row.frame + (p.row.task ? ' · klíčový úkol: ' + p.row.task : '')));
          if (p.group && p.group.nodes.length) {
            detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm mt-1', p.group.nodes.length + ' protokolů podle rejstříku:'));
            detail.appendChild(K.list(p.group.nodes));
          } else {
            detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
          }
        }

        if (detail) {
          K.clear(detail);
          detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm', 'Kniha fáze záměrně neváže na přesné týdny či měsíce; rámec je orientační. Klepnutím na fázi zobrazíte její protokoly.'));
          detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
        }

        K.chart(canvas, function (t, el) {
          var hd = K.head(t, el, 'Fáze zotavení podle rejstříku knihy (pořadí a orientační rámec)');
          return {
            title: hd.title,
            tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
              var x = phases[p.dataIndex];
              return '<b>' + L.esc(x.row.phase) + '</b><br>' + L.esc(x.row.frame) + ' • ' +
                L.count(x.count, ['protokol', 'protokoly', 'protokolů']);
            } }, K.V.tooltip(t)),
            grid: { left: 8, right: 32, top: hd.top, bottom: 28 },
            xAxis: K.V.axis(t, { type: 'value', minInterval: 1, name: 'Počet protokolů v rejstříku',
              nameLocation: 'middle', nameGap: 26 }),
            yAxis: K.V.axis(t, { type: 'category', inverse: true,
              data: phases.map(function (p) { return p.row.phase + '\n(' + p.row.frame + ')'; }),
              axisLabel: { color: t.muted, fontSize: 11, lineHeight: 14 } }),
            series: [{
              type: 'bar', name: 'Protokoly fáze', cursor: 'pointer', barMaxWidth: 36,
              data: phases.map(function (p, i) {
                return { value: p.count, itemStyle: { color: K.V.PALETTE[i % K.V.PALETTE.length], borderRadius: [0, 4, 4, 0] } };
              }),
              label: { show: true, position: 'right', color: t.muted },
            }],
          };
        }).then(function (chart) {
          chart.on('click', function (p) { if (p.componentType === 'series') show(phases[p.dataIndex]); });
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
