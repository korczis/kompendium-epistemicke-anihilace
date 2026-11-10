// Fáze zotavení podle knihy (Chart.js, vodorovné pruhy). Fáze a jejich orientační rámec čte
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

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

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
    if (!canvas || typeof Chart === 'undefined') return;
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

        K.chart(canvas, function (c) {
          return {
            type: 'bar',
            data: {
              labels: phases.map(function (p) { return [p.row.phase, '(' + p.row.frame + ')']; }),
              datasets: [{
                label: 'Protokoly fáze',
                data: phases.map(function (p) { return p.count; }),
                backgroundColor: phases.map(function (p, i) { return K.V.PALETTE[i % K.V.PALETTE.length] + 'B3'; }),
                borderColor: phases.map(function (p, i) { return K.V.PALETTE[i % K.V.PALETTE.length]; }),
                borderWidth: 2,
              }],
            },
            options: {
              indexAxis: 'y',
              responsive: true,
              plugins: {
                title: { display: true, text: 'Fáze zotavení podle rejstříku knihy (pořadí a orientační rámec)', color: c.text },
                legend: { display: false },
                tooltip: { callbacks: { label: function (ctx) {
                  var p = phases[ctx.dataIndex];
                  return p.row.frame + ' • ' + p.count + ' protokolů';
                } } },
              },
              scales: {
                x: { beginAtZero: true, ticks: { color: c.muted, precision: 0 }, grid: { color: c.grid },
                  title: { display: true, text: 'Počet protokolů v rejstříku', color: c.text } },
                y: { ticks: { color: c.muted }, grid: { color: c.grid } },
              },
              onClick: function (e, els) { if (els.length) show(phases[els[0].index]); },
            },
          };
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
