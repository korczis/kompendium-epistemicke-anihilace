// Sdílený vizualizační modul kompendia: data grafu odkazů (static/data/graph.json,
// kompendium-graph/v1) a metrik (metrics.json, kompendium-metrics/v1), barvy pro světlý
// i tmavý režim, prázdné stavy ve stylu Flowbite Pro a obálky pro cytoscape.js a ECharts.
// Knihovny se načítají až ve chvíli, kdy je stránka potřebuje.
(function () {
  'use strict';

  var body = document.body;
  var base = (body.getAttribute('data-base-url') || '').replace(/\/$/, '');
  var basePath = base.replace(/^https?:\/\/[^/]+/, '');
  var cache = {};

  // Kategorická paleta (dostatečný kontrast na bílé i na gray-900), pořadí je stabilní.
  // Kategorické barvy podle tématu: na světlém povrchu (white) odstíny Tailwind 600 (žlutá 700),
  // na tmavém (gray-800) odstíny 400, každá s kontrastem aspoň 3:1 vůči povrchu (WCAG 2.2,
  // 1.4.11). PALETTE je jedno pole, které se při přepnutí tématu (událost dark-mode) přepíše na
  // místě dřív, než se grafy znovu sestaví, takže každý graf, který barvy čte při sestavení,
  // dostane ty správné. Pořadí odstínů je v obou tématech stejné.
  var PALETTE_LIGHT = ['#4f46e5', '#0284c7', '#059669', '#d97706', '#dc2626', '#9333ea', '#0d9488',
    '#ea580c', '#db2777', '#65a30d', '#c026d3', '#0891b2', '#a16207', '#7c3aed', '#16a34a', '#475569'];
  var PALETTE_DARK = ['#818cf8', '#38bdf8', '#34d399', '#fbbf24', '#f87171', '#c084fc', '#2dd4bf',
    '#fb923c', '#f472b6', '#a3e635', '#e879f9', '#22d3ee', '#facc15', '#a78bfa', '#4ade80', '#94a3b8'];
  var PALETTE = [];
  function syncPalette() {
    var src = isDark() ? PALETTE_DARK : PALETTE_LIGHT;
    PALETTE.length = 0;
    Array.prototype.push.apply(PALETTE, src);
  }
  syncPalette();
  // Registrováno při načtení jádra, tedy před posluchači grafů: ty se přestaví už s novými barvami.
  document.addEventListener('dark-mode', syncPalette);

  function isDark() {
    return document.documentElement.classList.contains('dark');
  }

  function theme() {
    var dark = isDark();
    return {
      dark: dark,
      text: dark ? '#e5e7eb' : '#111827',
      muted: dark ? '#9ca3af' : '#6b7280',
      grid: dark ? '#374151' : '#e5e7eb',
      surface: dark ? '#1f2937' : '#ffffff',
      edge: dark ? '#4b5563' : '#cbd5e1',
      primary: dark ? '#818cf8' : '#4f46e5',
      accent: dark ? '#f87171' : '#dc2626',
    };
  }

  function loadScript(name) {
    if (cache['js:' + name]) return cache['js:' + name];
    cache['js:' + name] = new Promise(function (resolve, reject) {
      var s = document.createElement('script');
      s.src = basePath + '/js/vendor/' + name;
      s.onload = resolve;
      s.onerror = function () { reject(new Error('Nepodařilo se načíst ' + name)); };
      document.head.appendChild(s);
    });
    return cache['js:' + name];
  }

  function json(path) {
    if (!cache[path]) {
      cache[path] = fetch(basePath + '/' + path).then(function (r) {
        if (!r.ok) throw new Error(path + ': HTTP ' + r.status);
        return r.json();
      });
    }
    return cache[path];
  }

  // Adresa, na které Zola stránku skutečně servíruje (slugify.paths = "on"): bez diakritiky,
  // malými písmeny, ostatní znaky jako pomlčka. Odvozená data nesou cestu podle názvu souboru
  // („…/12-EA-stigma-risk/“), kterou by GitHub Pages (rozlišuje velikost písmen) neobsloužil.
  // Stejné pravidlo má scripts/build-ui-data.py (slug).
  function pageUrl(url) {
    var parts = String(url || '').split('/').filter(Boolean).map(function (seg) {
      return seg.normalize('NFKD').replace(/[\u0300-\u036f]/g, '').toLowerCase()
        .replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
    });
    return '/' + parts.join('/') + (parts.length ? '/' : '');
  }

  // Graf s indexy: podle id, podle cesty, sousedé dovnitř i ven, barva oddílu.
  function graph() {
    if (cache.graphIndex) return cache.graphIndex;
    cache.graphIndex = json('data/graph.json').then(function (g) {
      var byId = {};
      var byPath = {};
      var out = {};
      var inn = {};
      var sections = [];
      var sectionIndex = {};
      g.nodes.forEach(function (n) {
        n.url = pageUrl(n.url);
        byId[n.id] = n;
        byPath[n.path] = n;
        out[n.id] = [];
        inn[n.id] = [];
        if (!(n.section in sectionIndex)) {
          sectionIndex[n.section] = sections.length;
          sections.push(n.section);
        }
      });
      g.edges.forEach(function (e) {
        if (byId[e[0]] && byId[e[1]] && e[0] !== e[1]) {
          out[e[0]].push(e[1]);
          inn[e[1]].push(e[0]);
        }
      });
      return {
        raw: g, nodes: g.nodes, edges: g.edges, byId: byId, byPath: byPath, out: out, in: inn,
        // Názvy rodin technik odvozené při sestavení (graph v2 „families“, např. EA-1 → název).
        families: g.families || {},
        sections: sections,
        color: function (section) { return PALETTE[(sectionIndex[section] || 0) % PALETTE.length]; },
        url: function (n) { return basePath + n.url; },
      };
    });
    return cache.graphIndex;
  }

  function sectionLabel(section) {
    if (section === 'root') return 'Úvod';
    var last = section.split('/').pop();
    return last.replace(/^\d+-/, '').replace(/-/g, ' ');
  }

  function empty(el, title, text) {
    el.innerHTML = '<div class="flex h-full min-h-48 flex-col items-center justify-center p-6 text-center">' +
      '<svg class="mb-3 h-10 w-10 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z"/></svg>' +
      '<p class="text-base font-semibold text-gray-900 dark:text-white">' + title + '</p>' +
      '<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">' + text + '</p></div>';
  }

  function cyStyle() {
    var t = theme();
    return [
      { selector: 'node', style: {
        'background-color': 'data(color)', 'label': 'data(label)', 'color': t.text,
        'font-size': 'data(fontSize)', 'font-family': 'Inter, system-ui, sans-serif',
        'text-valign': 'bottom', 'text-margin-y': 4, 'width': 'data(size)', 'height': 'data(size)',
        'text-wrap': 'ellipsis', 'text-max-width': 140, 'min-zoomed-font-size': 7,
        'border-width': 0 } },
      { selector: 'node[?focus]', style: { 'border-width': 3, 'border-color': t.accent } },
      { selector: 'node:selected', style: { 'border-width': 3, 'border-color': t.text } },
      { selector: 'node.faded', style: { 'opacity': 0.25 } },
      { selector: 'edge', style: {
        'width': 'data(width)', 'line-color': t.edge, 'opacity': 0.55, 'curve-style': 'haystack',
        'haystack-radius': 0.4 } },
      { selector: 'edge.faded', style: { 'opacity': 0.08 } },
      { selector: 'edge.hl', style: { 'line-color': t.primary, 'opacity': 0.9 } },
    ];
  }

  // Cytoscape s jednotným vzhledem; při přepnutí tématu se styl přepočítá.
  function cytoscapeIn(el, elements, layout) {
    return loadScript('cytoscape.min.js').then(function () {
      el.innerHTML = '';
      var cy = window.cytoscape({
        container: el, elements: elements, style: cyStyle(), layout: layout,
        wheelSensitivity: 0.25, minZoom: 0.1, maxZoom: 3, boxSelectionEnabled: false,
      });
      document.addEventListener('dark-mode', function () { cy.style(cyStyle()); });
      return cy;
    });
  }

  // ECharts s barvami tématu; option je funkce tématu, aby šla po přepnutí přepočítat.
  function echartsIn(el, makeOption) {
    return loadScript('echarts.min.js').then(function () {
      var chart = window.echarts.init(el, null, { renderer: 'canvas' });
      function render() {
        var t = theme();
        var opt = makeOption(t);
        opt.backgroundColor = 'transparent';
        opt.textStyle = Object.assign({ fontFamily: 'Inter, system-ui, sans-serif', color: t.text }, opt.textStyle || {});
        opt.color = opt.color || PALETTE;
        chart.setOption(opt, true);
      }
      render();
      document.addEventListener('dark-mode', render);
      window.addEventListener('resize', function () { chart.resize(); });
      return chart;
    });
  }

  function axis(t, extra) {
    return Object.assign({
      axisLine: { lineStyle: { color: t.grid } }, axisLabel: { color: t.muted },
      splitLine: { lineStyle: { color: t.grid, type: 'dashed' } }, nameTextStyle: { color: t.muted },
    }, extra || {});
  }

  function tooltip(t) {
    return { backgroundColor: t.surface, borderColor: t.grid, textStyle: { color: t.text },
      extraCssText: 'border-radius:0.5rem;box-shadow:0 10px 15px -3px rgb(0 0 0 / 0.1);' };
  }

  window.KompendiumViz = {
    PALETTE: PALETTE, theme: theme, isDark: isDark, json: json, graph: graph, empty: empty,
    loadScript: loadScript, cytoscape: cytoscapeIn, echarts: echartsIn, axis: axis, tooltip: tooltip,
    sectionLabel: sectionLabel, basePath: basePath, pageUrl: pageUrl,
  };
})();
