// Stav knihy: přehled zdraví knihy nad static/data/metrics.json a graph.json (Apache ECharts).
// Všechna čísla jsou odvozená při sestavení (scripts/build-graph.py); nic se nepíše ručně.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');

  function el(id) { return document.getElementById(id); }

  // Mapa knihy s předvybraným oddílem; odkaz na stránku v rámci webu podle base path.
  function mapUrl(section) {
    return V.basePath + '/mapa/' + (section ? '?oddil=' + encodeURIComponent(section) : '');
  }

  function escapeHtml(s) {
    return String(s).replace(/[&<>"]/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
    });
  }

  // Každá karta vede tam, kde se s číslem dá něco dělat (mapa, obsah, příslušný graf níže).
  function kpis(m) {
    var items = [
      ['Stránek', m.pages, 'včetně glosáře a filozofie', V.basePath + '/kompendium/', 'Otevřít obsah kompendia'],
      ['Slov', m.words, 'celý text knihy', '#h-slova', 'Přejít na graf rozsahu textu'],
      ['Odkazů', m.links, 'interní @/ odkazy mezi stránkami', mapUrl(), 'Otevřít Mapu knihy'],
      ['Nefunkčních odkazů', m.broken_links, 'sestavení je jako chybu odmítne', '#h-kvalita', 'Přejít na přehled nedokončené práce'],
      ['Sirotků', m.orphans, 'stránky, na které nic neodkazuje', mapUrl(), 'Otevřít Mapu knihy'],
      ['Se „Související“', m.pages_with_related, 'stránky se sekcí souvisejících pojmů', '#h-sekce', 'Přejít na graf stránek podle oddílů'],
      ['Tenkých stránek', m.thin_pages, 'pod hranicí rozsahu, čekají na rozvinutí', '#h-rozptyl', 'Přejít na graf rozsahu a provázanosti stránek'],
      ['Stránek v angličtině', m.english_pages, 'čekají na převod do češtiny', V.basePath + '/glossary/', 'Otevřít glosář, kde je většina nepřeložených stránek'],
    ];
    el('stav-kpi').innerHTML = items.map(function (x) {
      var pct = typeof x[1] === 'number' && x[0] !== 'Stránek' && x[0] !== 'Slov' && x[0] !== 'Odkazů'
        ? '<span class="ml-2 text-sm font-medium text-gray-500 dark:text-gray-400">' + Math.round(100 * x[1] / m.pages) + ' %</span>' : '';
      return '<a href="' + escapeHtml(x[3]) + '" aria-label="' + escapeHtml(x[0] + ': ' + nf.format(x[1]) + '. ' + x[4]) + '" ' +
        'class="group block rounded-lg bg-white p-4 shadow hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-800 sm:p-6 dark:bg-gray-800 dark:hover:bg-gray-700">' +
        '<span class="flex items-start justify-between gap-2"><span>' +
        '<span class="text-2xl font-bold leading-none text-gray-900 sm:text-3xl dark:text-white">' + nf.format(x[1]) + '</span>' + pct + '</span>' +
        '<svg class="h-5 w-5 shrink-0 text-gray-400 group-hover:text-primary-700 dark:group-hover:text-primary-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/></svg></span>' +
        '<h3 class="text-base font-normal text-gray-500 dark:text-gray-400">' + x[0] + '</h3>' +
        '<p class="mt-3 border-t border-gray-200 pt-3 text-xs text-gray-500 dark:border-gray-700 dark:text-gray-400">' + x[2] + '</p></a>';
    }).join('');
  }

  // Klepnutí na sloupec nebo popisek osy otevře oddíl v Mapě knihy.
  function openSectionOnClick(chart, rows, axisKey) {
    var byLabel = {};
    rows.forEach(function (r) { byLabel[V.sectionLabel(r.section)] = r.section; });
    chart.on('click', function (p) {
      var section = null;
      if (p.componentType === 'series' && rows[p.dataIndex]) section = rows[p.dataIndex].section;
      else if (p.componentType === axisKey && byLabel[p.value]) section = byLabel[p.value];
      if (section) window.location.href = mapUrl(section);
    });
    return chart;
  }

  function sectionsChart(m) {
    var rows = m.sections.slice().sort(function (a, b) { return a.pages - b.pages; });
    return V.echarts(el('stav-sekce'), function (t) {
      return {
        tooltip: Object.assign({ trigger: 'axis', axisPointer: { type: 'shadow' } }, V.tooltip(t)),
        legend: { textStyle: { color: t.muted }, top: 0 },
        grid: { left: 8, right: 16, top: 36, bottom: 8, containLabel: true },
        xAxis: V.axis(t, { type: 'value' }),
        yAxis: V.axis(t, { type: 'category', data: rows.map(function (r) { return V.sectionLabel(r.section); }),
          triggerEvent: true, axisLabel: { color: t.muted, fontSize: 11, width: 170, overflow: 'truncate' } }),
        series: [
          { name: 'stránky celkem', type: 'bar', data: rows.map(function (r) { return r.pages; }), itemStyle: { color: '#4f46e5', borderRadius: [0, 3, 3, 0] } },
          { name: 'se „Související“', type: 'bar', data: rows.map(function (r) { return r.with_related; }), itemStyle: { color: '#10b981', borderRadius: [0, 3, 3, 0] } },
        ],
      };
    }).then(function (chart) { return openSectionOnClick(chart, rows, 'yAxis'); });
  }

  function wordsChart(m) {
    var rows = m.sections.slice().sort(function (a, b) { return b.words - a.words; }).slice(0, 20);
    return V.echarts(el('stav-slova'), function (t) {
      return {
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) { return p.name + '<br>' + nf.format(p.value) + ' slov'; } }, V.tooltip(t)),
        series: [{ type: 'treemap', roam: false, nodeClick: false, breadcrumb: { show: false },
          label: { color: '#fff', fontSize: 11, formatter: function (p) { return p.name + '\n' + nf.format(p.value); } },
          itemStyle: { borderColor: t.surface, borderWidth: 2, gapWidth: 2 },
          data: rows.map(function (r, i) { return { name: V.sectionLabel(r.section), value: r.words, section: r.section, itemStyle: { color: V.PALETTE[i % V.PALETTE.length] } }; }) }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.data && p.data.section) window.location.href = mapUrl(p.data.section); });
      return chart;
    });
  }

  function qualityChart(m) {
    var rows = m.sections.filter(function (r) { return r.orphans + r.english + r.without_diacritics > 0; })
      .sort(function (a, b) { return (b.orphans + b.english + b.without_diacritics) - (a.orphans + a.english + a.without_diacritics); });
    if (!rows.length) { V.empty(el('stav-kvalita'), 'Bez nálezů', 'Žádný oddíl nemá sirotky ani nepřeložené stránky.'); return; }
    return V.echarts(el('stav-kvalita'), function (t) {
      function s(name, key, color) {
        return { name: name, type: 'bar', stack: 'q', data: rows.map(function (r) { return r[key]; }), itemStyle: { color: color } };
      }
      return {
        tooltip: Object.assign({ trigger: 'axis', axisPointer: { type: 'shadow' } }, V.tooltip(t)),
        legend: { textStyle: { color: t.muted }, top: 0 },
        grid: { left: 8, right: 16, top: 36, bottom: 8, containLabel: true },
        xAxis: V.axis(t, { type: 'category', data: rows.map(function (r) { return V.sectionLabel(r.section); }),
          triggerEvent: true, axisLabel: { color: t.muted, rotate: 40, fontSize: 10, width: 110, overflow: 'truncate' } }),
        yAxis: V.axis(t, { type: 'value' }),
        series: [s('sirotci', 'orphans', '#ef4444'), s('v angličtině', 'english', '#f59e0b'), s('bez diakritiky', 'without_diacritics', '#a855f7')],
      };
    }).then(function (chart) { return openSectionOnClick(chart, rows, 'xAxis'); });
  }

  function linkedChart(g) {
    var top = g.nodes.slice().sort(function (a, b) { return g.in[b.id].length - g.in[a.id].length; }).slice(0, 15).reverse();
    return V.echarts(el('stav-odkazovane'), function (t) {
      return {
        tooltip: Object.assign({ trigger: 'axis', axisPointer: { type: 'shadow' } }, V.tooltip(t)),
        grid: { left: 8, right: 24, top: 8, bottom: 8, containLabel: true },
        xAxis: V.axis(t, { type: 'value' }),
        yAxis: V.axis(t, { type: 'category', data: top.map(function (n) { return n.title; }),
          axisLabel: { color: t.muted, fontSize: 11, width: 200, overflow: 'truncate' } }),
        series: [{ type: 'bar', data: top.map(function (n) { return { value: g.in[n.id].length, url: g.url(n) }; }),
          itemStyle: { color: '#4f46e5', borderRadius: [0, 3, 3, 0] }, label: { show: true, position: 'right', color: t.muted } }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
    });
  }

  function scatterChart(g) {
    var bySection = {};
    g.nodes.forEach(function (n) {
      if (n.section === 'root') return;
      (bySection[n.section] = bySection[n.section] || []).push(
        { value: [Math.max(1, n.words), g.in[n.id].length], name: n.title, url: g.url(n) });
    });
    var sections = Object.keys(bySection).sort(function (a, b) { return bySection[b].length - bySection[a].length; });
    return V.echarts(el('stav-rozptyl'), function (t) {
      return {
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          return '<b>' + p.data.name + '</b><br>' + nf.format(p.data.value[0]) + ' slov · ' + p.data.value[1] + ' odkazů sem'; } }, V.tooltip(t)),
        legend: { type: 'scroll', textStyle: { color: t.muted }, top: 0, pageTextStyle: { color: t.muted } },
        grid: { left: 8, right: 16, top: 40, bottom: 8, containLabel: true },
        xAxis: V.axis(t, { type: 'log', name: 'slov (log)', nameLocation: 'middle', nameGap: 24 }),
        yAxis: V.axis(t, { type: 'value', name: 'odkazů sem' }),
        series: sections.map(function (s) {
          return { name: V.sectionLabel(s), type: 'scatter', symbolSize: 6, data: bySection[s], itemStyle: { color: g.color(s), opacity: 0.75 } };
        }),
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
    });
  }

  function init() {
    if (!el('stav-kpi')) return;
    Promise.all([V.json('data/metrics.json'), V.graph()]).then(function (r) {
      var m = r[0];
      var g = r[1];
      kpis(m);
      return Promise.all([sectionsChart(m), wordsChart(m), qualityChart(m), linkedChart(g), scatterChart(g)]);
    }).catch(function (e) {
      V.empty(el('stav-kpi'), 'Data se nepodařilo načíst', e.message);
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
