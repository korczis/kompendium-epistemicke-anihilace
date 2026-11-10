// Průzkumník glosáře: abecední lišta A–Ž (české pořadí včetně CH), filtr bez ohledu na
// diakritiku, karty hesel po písmenech, nejodkazovanější hesla (ECharts) a síť vzájemných
// odkazů mezi nimi (cytoscape). Hesla přicházejí inline z šablony (#glosar-data), jazyk
// a počty odkazů z grafu odkazů (static/data/graph.json). Stav drží Alpine.js.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var ALPHABET = ['#', 'A', 'B', 'C', 'Č', 'D', 'E', 'F', 'G', 'H', 'CH', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'Ř', 'S', 'Š', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'Ž'];
  var KEEP = { 'Č': true, 'Ř': true, 'Š': true, 'Ž': true };
  var LANG_COLOR = { cs: '#4f46e5', en: '#f59e0b' };
  var INDEX_PATH = 'glossary/_index.md';
  var TOP_CHART = 15;
  var TOP_NET = 40;

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function letterOf(title) {
    var t = String(title || '').trim();
    if (/^ch/i.test(t)) return 'CH';
    var c = t.charAt(0).toUpperCase();
    if (KEEP[c]) return c;
    var base = fold(c).toUpperCase();
    return /^[A-Z]$/.test(base) ? base : '#';
  }

  function slug(letter) {
    return letter === '#' ? 'cislice' : fold(letter) + (KEEP[letter] ? '-hacek' : '');
  }

  // 1 stránka, 2–4 stránky, 0 a 5+ stránek.
  function plural(n, one, few, many) {
    if (n === 1) return one;
    if (n >= 2 && n <= 4) return few;
    return many;
  }

  function readTerms() {
    var el = document.getElementById('glosar-data');
    var list = [];
    try { list = JSON.parse(el ? el.textContent : '[]'); } catch (e) { list = []; }
    return list.map(function (p) {
      return {
        title: p.title || p.path, url: p.url, description: p.description || '', words: p.words || 0,
        path: p.path, category: typeof p.category === 'string' ? p.category : '',
        letter: letterOf(p.title || p.path), haystack: fold((p.title || '') + ' ' + (p.description || '')),
        lang: '', refs: null, id: null,
      };
    }).sort(function (a, b) { return a.title.localeCompare(b.title, 'cs'); });
  }

  window.kompendiumGlosar = function () {
    return {
      booted: false,
      graphReady: false,
      graphError: '',
      terms: [],
      categories: [],
      top: [],
      alphabet: ALPHABET,
      q: '',
      cat: '',
      lang: '',

      init: function () {
        var self = this;
        this.terms = readTerms();
        var counts = {};
        this.terms.forEach(function (t) { if (t.category) counts[t.category] = (counts[t.category] || 0) + 1; });
        this.categories = Object.keys(counts).filter(function (c) { return counts[c] > 1; })
          .sort(function (a, b) { return counts[b] - counts[a] || a.localeCompare(b, 'cs'); })
          .map(function (c) { return { value: c, label: c + ' (' + counts[c] + ')' }; });
        var params = new URLSearchParams(location.search);
        if (params.get('hledat')) this.q = params.get('hledat');
        this.booted = true;
        if (!V) {
          this.graphError = 'Chybí vizualizační modul.';
          return;
        }
        V.graph().then(function (g) { self.attach(g); }).catch(function (e) {
          self.graphError = e.message;
          V.empty(self.$refs.chart, 'Graf se nepodařilo načíst', e.message);
          V.empty(self.$refs.net, 'Síť odkazů se nepodařilo načíst', e.message);
        });
      },

      // Doplní jazyk a počet odkazujících stránek (bez rejstříku glosáře, který odkazuje na vše).
      attach: function (g) {
        var index = g.byPath[INDEX_PATH];
        var skip = index ? index.id : -1;
        this.terms.forEach(function (t) {
          var n = g.byPath[t.path];
          if (!n) return;
          var src = {};
          g.in[n.id].forEach(function (s) { if (s !== skip) src[s] = true; });
          t.id = n.id;
          t.lang = n.lang;
          t.refs = Object.keys(src).length;
        });
        var ranked = this.terms.filter(function (t) { return t.id !== null; })
          .sort(function (a, b) { return b.refs - a.refs || a.title.localeCompare(b.title, 'cs'); });
        this.top = ranked.slice(0, TOP_CHART);
        this.graphReady = true;
        this.drawChart();
        this.drawNet(g, ranked.slice(0, TOP_NET));
      },

      drawChart: function () {
        var el = this.$refs.chart;
        var top = this.top.slice().reverse();
        if (!top.length) return V.empty(el, 'Žádná data', 'Graf odkazů neobsahuje hesla glosáře.');
        V.echarts(el, function (t) {
          var labelWidth = Math.max(90, Math.min(220, Math.round(el.clientWidth * 0.38)));
          return {
            tooltip: Object.assign({ trigger: 'axis', axisPointer: { type: 'shadow' }, formatter: function (ps) {
              var p = ps[0];
              return '<b>' + p.name + '</b><br>' + p.value + ' ' + plural(p.value, 'stránka', 'stránky', 'stránek') + ' odkazuje sem';
            } }, V.tooltip(t)),
            grid: { left: 8, right: 32, top: 8, bottom: 8, containLabel: true },
            xAxis: V.axis(t, { type: 'value', minInterval: 1 }),
            yAxis: V.axis(t, { type: 'category', data: top.map(function (x) { return x.title; }),
              axisLabel: { color: t.muted, fontSize: 11, width: labelWidth, overflow: 'truncate' } }),
            series: [{ type: 'bar', cursor: 'pointer',
              data: top.map(function (x) { return { value: x.refs, url: x.url }; }),
              itemStyle: { color: t.primary, borderRadius: [0, 3, 3, 0] },
              emphasis: { itemStyle: { color: '#4338ca' } },
              label: { show: true, position: 'right', color: t.muted } }],
          };
        }).then(function (chart) {
          chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
        });
      },

      drawNet: function (g, picked) {
        var el = this.$refs.net;
        if (!picked.length) return V.empty(el, 'Žádná data', 'Graf odkazů neobsahuje hesla glosáře.');
        var ids = {};
        picked.forEach(function (t) { ids[t.id] = t; });
        var pairs = {};
        picked.forEach(function (t) {
          g.out[t.id].forEach(function (dst) {
            if (!ids[dst] || dst === t.id) return;
            var a = Math.min(t.id, dst);
            var b = Math.max(t.id, dst);
            pairs[a + '-' + b] = (pairs[a + '-' + b] || 0) + 1;
          });
        });
        var max = picked[0].refs || 1;
        var els = picked.map(function (t) {
          return { data: { id: 'n' + t.id, label: t.title, url: t.url, color: LANG_COLOR[t.lang] || '#64748b',
            size: Math.round(14 + 34 * Math.sqrt(t.refs / max)), fontSize: t.refs / max > 0.3 ? 11 : 9 } };
        });
        Object.keys(pairs).forEach(function (k) {
          var ab = k.split('-');
          els.push({ data: { id: 'e' + k, source: 'n' + ab[0], target: 'n' + ab[1], width: pairs[k] > 1 ? 2.5 : 1 } });
        });
        V.cytoscape(el, els, { name: 'cose', animate: false, randomize: false, padding: 16,
          nodeRepulsion: 600000, idealEdgeLength: 110, nodeOverlap: 40, gravity: 0.6,
          componentSpacing: 60, numIter: 3000 }).then(function (cy) {
          // Malý přehledový graf: bez posouvání a přibližování, aby nekradl rolování stránky.
          cy.userZoomingEnabled(false);
          cy.userPanningEnabled(false);
          cy.autoungrabify(true);
          cy.on('tap', 'node', function (ev) { window.location.href = ev.target.data('url'); });
          cy.on('mouseover', 'node', function (ev) {
            var hood = ev.target.closedNeighborhood();
            cy.elements().not(hood).addClass('faded');
            hood.edges().addClass('hl');
            el.style.cursor = 'pointer';
          });
          cy.on('mouseout', 'node', function () {
            cy.elements().removeClass('faded hl');
            el.style.cursor = '';
          });
          window.addEventListener('resize', function () { cy.resize(); cy.fit(undefined, 16); });
        }).catch(function (e) {
          V.empty(el, 'Síť odkazů se nepodařilo vykreslit', e.message);
        });
      },

      countLang: function (code) {
        return this.terms.filter(function (t) { return t.lang === code; }).length;
      },

      refsLabel: function (n) {
        if (n === null || n === undefined) return '';
        return n + ' ' + plural(n, 'odkazující stránka', 'odkazující stránky', 'odkazujících stránek');
      },

      get filtered() {
        var q = fold(this.q.trim());
        var words = q ? q.split(/\s+/) : [];
        var cat = this.cat;
        var lang = this.lang;
        return this.terms.filter(function (t) {
          if (cat && t.category !== cat) return false;
          if (lang && t.lang !== lang) return false;
          for (var i = 0; i < words.length; i++) if (t.haystack.indexOf(words[i]) === -1) return false;
          return true;
        });
      },

      get groups() {
        var by = {};
        this.filtered.forEach(function (t) { (by[t.letter] = by[t.letter] || []).push(t); });
        return ALPHABET.filter(function (l) { return by[l]; })
          .map(function (l) { return { letter: l, slug: slug(l), items: by[l] }; });
      },

      get present() {
        var p = {};
        this.filtered.forEach(function (t) { p[t.letter] = true; });
        return p;
      },

      get summary() {
        var n = this.filtered.length;
        var all = this.terms.length;
        if (n === all) return 'Všech ' + all + ' hesel, abecedně podle českého pořadí.';
        return 'Zobrazeno ' + n + ' ' + plural(n, 'heslo', 'hesla', 'hesel') + ' z ' + all + '.';
      },

      jump: function (letter) {
        var h = document.getElementById('glosar-l-' + slug(letter));
        if (!h) return;
        var calm = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        h.scrollIntoView({ behavior: calm ? 'auto' : 'smooth', block: 'start' });
        h.focus({ preventScroll: true });
      },

      reset: function () {
        this.q = '';
        this.cat = '';
        this.lang = '';
        var input = document.getElementById('glosar-q');
        if (input) input.focus();
      },
    };
  };
})();
