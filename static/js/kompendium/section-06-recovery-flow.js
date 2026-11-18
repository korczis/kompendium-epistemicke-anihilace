// Kapitola 6 — klinická cesta zotavení (ECharts, sloupce a oblouky vazeb). Fáze, jejich popis
// a stránky přebírá z číslovaného seznamu v textu stránky nad grafem (tučný název fáze, odkazy
// v položce); čísla kapitol z názvů stránek v grafu knihy; oblouky = počet odkazů mezi
// stránkami fází podle grafu. Klik na sloupec → fáze, její stránky a vazby.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

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
    if (!canvas) return;
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

      function show(s) {
        if (!detail) return;
        K.clear(detail);
        detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', 'Fáze ' + s.id + ' — ' + s.name));
        if (s.desc) detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', s.desc));
        detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-3 font-semibold', 'Stránky knihy u této fáze (' + s.nodes.length + '):'));
        if (s.nodes.length) {
          detail.appendChild(K.list(s.nodes, function (n) { return pageLabel(K, n); }));
        } else {
          detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', 'Text stránky u této fáze žádnou stránku neodkazuje.'));
        }
        var rel = flows.filter(function (f) { return f.from === s.id || f.to === s.id; });
        if (rel.length) {
          detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-3 font-semibold', 'Odkazy mezi fázemi podle grafu knihy:'));
          var ul = K.h('ul', 'text-gray-700 dark:text-gray-300 list-disc list-inside text-sm');
          rel.forEach(function (f) {
            ul.appendChild(K.h('li', null, stages[f.from - 1].name + ' → ' + stages[f.to - 1].name + ': ' + f.weight));
          });
          detail.appendChild(ul);
        }
      }

      // Sloupec = stránky fáze; oblouk = odkazy mezi stránkami dvou fází (dopředu nad osou,
      // zpět pod ní), tloušťka podle počtu. Vybraná fáze má rámeček (výběr řady ECharts).
      K.chart(canvas, function (t, el) {
        var hd = K.head(t, el, 'Klinická cesta: stránky fází a odkazy mezi nimi podle knihy (klik na fázi)');
        var names = stages.map(function (s) { return s.name; });
        var base = maxN + 0.5;
        var opt = {
          title: hd.title,
          tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
            if (p.seriesType === 'lines') {
              var f = flows[p.dataIndex];
              return L.esc(stages[f.from - 1].name + ' → ' + stages[f.to - 1].name) + ': ' +
                L.count(f.weight, ['odkaz', 'odkazy', 'odkazů']);
            }
            return '<b>' + L.esc(p.name) + '</b><br>' + L.count(p.value, ['stránka', 'stránky', 'stránek']) + ' knihy';
          } }, K.V.tooltip(t)),
          grid: { left: 40, right: 16, top: hd.top, bottom: 36, containLabel: true },
          xAxis: K.V.axis(t, { type: 'category', data: names, name: 'Fáze (podle textu stránky)',
            nameLocation: 'middle', nameGap: 28, axisLabel: { color: t.muted, interval: 0, width: 90, overflow: 'truncate' } }),
          yAxis: K.V.axis(t, { type: 'value', min: 0, max: maxN * 2 + 1, minInterval: 1, name: 'Odkazované stránky',
            nameLocation: 'middle', nameGap: 30 }),
          series: [{
            type: 'bar', name: 'Stránky fáze', barMaxWidth: 70, cursor: 'pointer', selectedMode: 'single',
            data: stages.map(function (s) {
              return { value: s.nodes.length, itemStyle: { color: s.color, borderColor: s.color, borderWidth: 2 } };
            }),
            select: { itemStyle: { borderColor: t.text, borderWidth: 4 } },
          }, {
            type: 'lines', name: 'Odkazy mezi fázemi', coordinateSystem: 'cartesian2d', z: 4,
            symbol: ['none', 'arrow'], symbolSize: 8,
            data: flows.map(function (f) {
              return {
                coords: [[names[f.from - 1], base], [names[f.to - 1], base]],
                lineStyle: { width: 1 + 4 * f.weight / maxW, opacity: 0.35 + 0.6 * f.weight / maxW,
                  curveness: f.to > f.from ? -0.35 : -0.25 },
                label: { show: true, formatter: String(f.weight) },
              };
            }),
            lineStyle: { color: t.muted },
            label: { show: true, position: 'middle', color: t.muted, fontSize: 10 },
          }],
        };
        if (!flows.length) opt.series.length = 1;
        return opt;
      }).then(function (chart) {
        chart.on('click', function (p) {
          if (p.seriesType === 'bar' && stages[p.dataIndex]) show(stages[p.dataIndex]);
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
