// Průzkumník katalogu (x-data="kompendiumKatalog(data, rodina)"): jedna komponenta pro každý
// katalog knihy. Data (export katalogu, který odvozuje scripts/catalogs.py) i předvybraná
// rodina přicházejí z front matter sekce; druhy a užití se berou ze slovníku katalogu v datech.
// Hledání, filtry, souhrny, graf vazeb (ECharts) a seznam; stav filtrů se zrcadlí do URL
// (?q=&rodina=&druh=&riziko=&razeni=), aby šel výběr sdílet.
(function () {
  'use strict';

  var V = window.KompendiumViz;

  function fold(s) {
    return window.KompendiumJadro.normalise(String(s || ''));
  }

  window.kompendiumKatalog = function (dataPath, fixedFamily) {
    var D = { entries: [], families: [], edges: [], works: 0, vocab: { types: {}, uses: {} } };
    var chart = null;

    return {
      ready: false,
      q: '',
      family: fixedFamily || '',
      kind: '',
      risk: '',
      sort: 'id',
      limit: 50,
      families: [],
      prefix: '',
      kindOptions: [],
      typeSummary: '',
      shown: [],
      counts: { vysoke: 0, works: 0 },

      get page() { return this.shown.slice(0, this.limit); },

      init: function () {
        var self = this;
        var params = new URLSearchParams(window.location.search);
        self.q = params.get('q') || '';
        self.family = params.get('rodina') || self.family;
        self.kind = params.get('druh') || '';
        self.risk = params.get('riziko') || '';
        self.sort = params.get('razeni') || 'id';
        V.json(dataPath).then(function (data) {
          D.entries = (data.entries || []).map(function (e) {
            e.href = V.basePath + '/' + e.url;
            e.hay = fold([e.id, e.cs, e.en].concat(e.aliases || []).join(' '));
            e.degree = (e.related || []).length + (e.narrower || []).length + (e.broader ? 1 : 0);
            return e;
          });
          D.families = data.families || [];
          D.edges = data.edges || [];
          D.works = Object.keys(data.sources || {}).length;
          D.vocab = data.vocab || D.vocab;
          self.prefix = data.id_prefix || '';
          self.families = D.families;
          self.kindOptions = Object.keys(D.vocab.types || {}).map(function (k) {
            return { value: 'type:' + k, label: D.vocab.types[k] };
          }).concat(Object.keys(D.vocab.uses || {}).map(function (k) {
            return { value: 'use:' + k, label: D.vocab.uses[k] };
          }));
          self.ready = true;
          self.apply();
        });
      },

      apply: function () {
        var self = this;
        var q = fold(this.q).trim();
        var kind = this.kind.split(':');
        this.shown = D.entries.filter(function (e) {
          if (self.family && e.family !== self.family) return false;
          if (kind.length === 2 && e[kind[0]] !== kind[1]) return false;
          if (self.risk && e.risk !== self.risk) return false;
          return !q || e.hay.indexOf(q) !== -1;
        });
        var by = this.sort;
        this.shown.sort(function (a, b) {
          if (by === 'cs') return a.cs.localeCompare(b.cs, 'cs');
          if (by === 'links') return b.degree - a.degree || a.id.localeCompare(b.id);
          return a.id.localeCompare(b.id);
        });
        this.limit = 50;
        var c = { vysoke: 0, works: 0 };
        var types = {};
        var works = {};
        this.shown.forEach(function (e) {
          types[e.type] = (types[e.type] || 0) + 1;
          if (e.risk === 'vysoke') c.vysoke++;
          (e.sources || []).forEach(function (k) { works[k] = true; });
        });
        c.works = Object.keys(works).length;
        this.counts = c;
        this.typeSummary = Object.keys(types).map(function (k) {
          return types[k] + ' × ' + ((D.vocab.types || {})[k] || k);
        }).join(', ') || '—';
        this.syncUrl();
        this.draw();
      },

      syncUrl: function () {
        var p = new URLSearchParams();
        if (this.q) p.set('q', this.q);
        if (this.family && this.family !== fixedFamily) p.set('rodina', this.family);
        if (this.kind) p.set('druh', this.kind);
        if (this.risk) p.set('riziko', this.risk);
        if (this.sort !== 'id') p.set('razeni', this.sort);
        var s = p.toString();
        window.history.replaceState(null, '', window.location.pathname + (s ? '?' + s : ''));
      },

      draw: function () {
        var self = this;
        var el = this.$refs.graph;
        if (!el) return;
        var bySlug = {};
        this.shown.forEach(function (e) { bySlug[e.slug] = e; });
        var famIndex = {};
        D.families.forEach(function (f, i) { famIndex[f.slug] = i; });
        var nodes = this.shown.map(function (e) {
          return { id: e.slug, name: e.cs, value: e.id, url: e.href, category: famIndex[e.family],
            symbolSize: 6 + Math.min(14, e.degree * 2) };
        });
        var seen = {};
        var links = [];
        D.edges.forEach(function (x) {
          if ((x.type !== 'broader' && x.type !== 'related') || !bySlug[x.from] || !bySlug[x.to]) return;
          var key = [x.from, x.to].sort().join('|') + x.type;
          if (seen[key]) return;
          seen[key] = true;
          links.push({ source: x.from, target: x.to,
            lineStyle: x.type === 'broader' ? { width: 1.6, opacity: 0.7 } : { width: 0.6, opacity: 0.35 } });
        });
        var option = function (t) {
          return {
            tooltip: Object.assign(V.tooltip(t), {
              formatter: function (p) { return p.dataType === 'node' ? p.data.value + ' ' + p.data.name : ''; },
            }),
            legend: { show: false },
            series: [{
              type: 'graph', layout: 'force', roam: true, draggable: true,
              categories: D.families.map(function (f) { return { name: f.title }; }),
              data: nodes, links: links,
              force: { repulsion: nodes.length > 150 ? 40 : 90, edgeLength: [20, 70], gravity: 0.08 },
              label: { show: nodes.length <= 40, position: 'right', color: t.text, fontSize: 10 },
              lineStyle: { color: t.muted, curveness: 0.05 },
              emphasis: { focus: 'adjacency', label: { show: true } },
            }],
          };
        };
        if (chart) {
          chart.setOption(option(V.theme()), true);
          return;
        }
        V.echarts(el, option).then(function (c) {
          chart = c;
          chart.on('click', function (p) { if (p.dataType === 'node' && p.data.url) window.location.href = p.data.url; });
          chart.setOption(option(V.theme()), true);
        });
        if (!nodes.length) V.empty(el, 'Žádná hesla', 'Výběru neodpovídá žádné heslo.');
        void self;
      },
    };
  };
})();
