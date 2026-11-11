// Mapa knihy: interaktivní graf odkazů nad static/data/graph.json (cytoscape.js).
// Pohledy: oddíly → stránky oddílu → okolí stránky; filtr podle štítku; hledání.
// Stav ovládání drží Alpine.js (x-data="kompendiumMapa()").
(function () {
  'use strict';

  var V = window.KompendiumViz;

  function fold(s) {
    return window.KompendiumJadro.normalise(String(s || ''));
  }

  function size(deg, min, max) {
    return Math.round(Math.min(max, min + Math.sqrt(deg) * 4));
  }

  window.kompendiumMapa = function () {
    var cy = null;
    var G = null;

    return {
      ready: false,
      error: '',
      mode: 'sections',
      section: '',
      tag: '',
      query: '',
      focus: null,
      selected: null,
      stats: '',
      sectionOptions: [],
      tagOptions: [],
      titles: [],

      init: function () {
        var self = this;
        V.graph().then(function (g) {
          G = g;
          var counts = {};
          g.nodes.forEach(function (n) { counts[n.section] = (counts[n.section] || 0) + 1; });
          self.sectionOptions = g.sections.filter(function (s) { return s !== 'root'; })
            .map(function (s) { return { value: s, label: V.sectionLabel(s) + ' (' + counts[s] + ')' }; })
            .sort(function (a, b) { return a.label.localeCompare(b.label, 'cs'); });
          var tags = {};
          g.nodes.forEach(function (n) { (n.tags || []).forEach(function (t) { tags[t] = (tags[t] || 0) + 1; }); });
          self.tagOptions = Object.keys(tags).filter(function (t) { return tags[t] > 2; })
            .sort(function (a, b) { return tags[b] - tags[a]; }).slice(0, 150)
            .map(function (t) { return { value: t, label: '#' + t + ' (' + tags[t] + ')' }; });
          self.titles = g.nodes.map(function (n) { return n.title; });
          var params = new URLSearchParams(location.search);
          if (params.get('stranka') && g.byPath[params.get('stranka')]) self.showEgo(g.byPath[params.get('stranka')].id);
          else if (params.get('oddil')) self.showSection(params.get('oddil'));
          else if (params.get('stitek')) self.showTag(params.get('stitek'));
          else self.showSections();
          self.ready = true;
        }).catch(function (e) {
          self.error = e.message;
          V.empty(self.$refs.canvas, 'Mapu se nepodařilo načíst', e.message);
        });
      },

      draw: function (elements, layout, note) {
        var self = this;
        this.stats = note;
        if (cy) cy.destroy();
        return V.cytoscape(this.$refs.canvas, elements, layout).then(function (c) {
          cy = c;
          cy.on('tap', 'node', function (ev) { self.tap(ev.target.data()); });
          cy.on('dbltap', 'node', function (ev) {
            var d = ev.target.data();
            if (d.kind === 'page') window.location.href = G.url(G.byId[d.nid]);
          });
          cy.on('mouseover', 'node', function (ev) {
            var n = ev.target;
            cy.elements().addClass('faded');
            n.closedNeighborhood().removeClass('faded');
            n.connectedEdges().addClass('hl');
          });
          cy.on('mouseout', 'node', function () { cy.elements().removeClass('faded hl'); });
        });
      },

      remember: function (key, value) {
        var url = new URL(location.href);
        ['oddil', 'stranka', 'stitek'].forEach(function (k) { url.searchParams.delete(k); });
        if (key) url.searchParams.set(key, value);
        history.replaceState(null, '', url);
      },

      showSections: function () {
        this.mode = 'sections'; this.section = ''; this.tag = ''; this.focus = null; this.selected = null;
        this.remember();
        var count = {};
        var links = {};
        G.nodes.forEach(function (n) { count[n.section] = (count[n.section] || 0) + 1; });
        G.edges.forEach(function (e) {
          var a = G.byId[e[0]].section;
          var b = G.byId[e[1]].section;
          if (a === b || a === 'root' || b === 'root') return;
          var k = a < b ? a + '|' + b : b + '|' + a;
          links[k] = (links[k] || 0) + 1;
        });
        var els = [];
        G.sections.forEach(function (s) {
          if (s === 'root') return;
          els.push({ data: { id: 's:' + s, kind: 'section', section: s, label: V.sectionLabel(s) + ' · ' + count[s],
            color: G.color(s), size: size(count[s], 18, 70), fontSize: 11 } });
        });
        var max = 1;
        Object.keys(links).forEach(function (k) { max = Math.max(max, links[k]); });
        Object.keys(links).forEach(function (k) {
          var p = k.split('|');
          if (links[k] < 3) return;
          els.push({ data: { id: 'l:' + k, source: 's:' + p[0], target: 's:' + p[1],
            width: 0.5 + 6 * Math.log(1 + links[k]) / Math.log(1 + max) } });
        });
        return this.draw(els, { name: 'cose', animate: false, nodeRepulsion: 900000, idealEdgeLength: 120, padding: 30 },
          (els.filter(function (e) { return !e.data.source; }).length) + ' oddílů; síla čáry = počet odkazů mezi oddíly. Klepnutím otevřete oddíl.');
      },

      pageNode: function (n, opts) {
        var deg = G.in[n.id].length;
        return { data: { id: 'p:' + n.id, nid: n.id, kind: 'page', label: n.title, color: G.color(n.section),
          size: size(deg, 8, opts && opts.max || 40), fontSize: opts && opts.font || 8, focus: opts && opts.focus } };
      },

      subgraph: function (ids, extra) {
        var set = {};
        ids.forEach(function (id) { set[id] = true; });
        var self = this;
        var els = ids.map(function (id) { return self.pageNode(G.byId[id], extra && extra[id]); });
        var seen = {};
        ids.forEach(function (a) {
          G.out[a].forEach(function (b) {
            if (!set[b]) return;
            var k = a < b ? a + '-' + b : b + '-' + a;
            if (seen[k]) return;
            seen[k] = true;
            els.push({ data: { id: 'e:' + k, source: 'p:' + a, target: 'p:' + b, width: 0.8 } });
          });
        });
        return els;
      },

      showSection: function (section) {
        if (!section) return this.showSections();
        this.mode = 'section'; this.section = section; this.tag = ''; this.focus = null; this.selected = null;
        this.remember('oddil', section);
        var ids = G.nodes.filter(function (n) { return n.section === section; }).map(function (n) { return n.id; });
        var els = this.subgraph(ids);
        var layout = ids.length > 220
          ? { name: 'concentric', concentric: function (n) { return n.data('size'); }, levelWidth: function () { return 4; }, minNodeSpacing: 6, animate: false }
          : { name: 'cose', animate: false, nodeRepulsion: 120000, idealEdgeLength: 70, padding: 20 };
        return this.draw(els, layout, ids.length + ' stránek oddílu „' + V.sectionLabel(section) + '“; velikost = počet odkazujících stránek.');
      },

      showTag: function (tag) {
        if (!tag) return this.showSections();
        this.mode = 'tag'; this.tag = tag; this.section = ''; this.focus = null; this.selected = null;
        this.remember('stitek', tag);
        var ids = G.nodes.filter(function (n) { return (n.tags || []).indexOf(tag) !== -1; })
          .sort(function (a, b) { return G.in[b.id].length - G.in[a.id].length; }).slice(0, 300)
          .map(function (n) { return n.id; });
        return this.draw(this.subgraph(ids), { name: 'cose', animate: false, nodeRepulsion: 120000, idealEdgeLength: 70 },
          ids.length + ' stránek se štítkem #' + tag + (ids.length === 300 ? ' (nejodkazovanějších 300)' : '') + '.');
      },

      showEgo: function (id) {
        var n = G.byId[id];
        if (!n) return;
        this.mode = 'ego'; this.focus = n; this.selected = this.describe(n); this.section = ''; this.tag = '';
        this.remember('stranka', n.path);
        var around = {};
        G.out[id].concat(G.in[id]).forEach(function (x) { if (x !== id) around[x] = true; });
        var ids = Object.keys(around).map(Number)
          .sort(function (a, b) { return G.in[b].length - G.in[a].length; }).slice(0, 70);
        var extra = {};
        extra[id] = { focus: true, max: 54, font: 12 };
        var els = this.subgraph([id].concat(ids), extra);
        return this.draw(els, { name: 'concentric', concentric: function (x) { return x.data('focus') ? 100 : x.data('size'); },
          levelWidth: function () { return 6; }, minNodeSpacing: 14, animate: false },
          '„' + n.title + '“: ' + G.out[id].length + ' odkazů ven, ' + G.in[id].length + ' odkazů sem' +
          (Object.keys(around).length > 70 ? ' (zobrazeno 70 nejodkazovanějších sousedů)' : '') + '.');
      },

      describe: function (n) {
        return { id: n.id, title: n.title, section: V.sectionLabel(n.section), sectionKey: n.section,
          words: n.words, out: G.out[n.id].length, in: G.in[n.id].length, tags: (n.tags || []).slice(0, 8),
          url: G.url(n), lang: n.lang };
      },

      tap: function (d) {
        if (d.kind === 'section') return this.showSection(d.section);
        this.selected = this.describe(G.byId[d.nid]);
      },

      search: function () {
        var q = fold(this.query.trim());
        if (!q) return;
        var best = null;
        G.nodes.forEach(function (n) {
          var t = fold(n.title);
          var score = t === q ? 3 : t.indexOf(q) === 0 ? 2 : t.indexOf(q) !== -1 ? 1 : 0;
          if (score && (!best || score > best.s || (score === best.s && G.in[n.id].length > G.in[best.n.id].length))) best = { s: score, n: n };
        });
        if (best) this.showEgo(best.n.id);
        else this.stats = 'Nic nenalezeno pro „' + this.query + '“.';
      },

      fit: function () { if (cy) cy.fit(undefined, 30); },
    };
  };
})();
