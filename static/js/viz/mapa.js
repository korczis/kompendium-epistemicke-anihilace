// Mapa knihy: interaktivní graf odkazů nad static/data/graph.json (cytoscape.js).
// Pohledy: oddíly → stránky oddílu → okolí stránky; filtr podle štítku; hledání.
// Ovládání je značkování ze šablony templates/mapa.html (háčky data-mapa-*); tento skript
// jen plní hodnoty (textContent) a přepíná atributy hidden / aria-pressed. Třídy Tailwindu
// zůstávají v šabloně, kterou Tailwind prochází.
(function () {
  'use strict';

  var V = window.KompendiumViz;

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function size(deg, min, max) {
    return Math.round(Math.min(max, min + Math.sqrt(deg) * 4));
  }

  function classes(el, name) {
    return (el.getAttribute(name) || '').split(/\s+/).filter(Boolean);
  }

  function init(root) {
    function $(sel) { return root.querySelector(sel); }

    var ui = {
      modeButtons: Array.prototype.slice.call(root.querySelectorAll('[data-mapa-mode]')),
      fitButton: $('[data-mapa-action="fit"]'),
      section: $('[data-mapa-select="section"]'),
      tag: $('[data-mapa-select="tag"]'),
      form: $('[data-mapa-search]'),
      query: $('#mapa-q'),
      titles: $('#mapa-titles'),
      canvas: $('[data-mapa-canvas]'),
      loading: $('[data-mapa-loading]'),
      stats: $('[data-mapa-stats]'),
      detail: $('[data-mapa-detail]'),
      tags: $('[data-mapa-tags]'),
      tagTemplate: $('[data-mapa-tag-template]'),
      egoButton: $('[data-mapa-action="ego"]'),
      sectionButton: $('[data-mapa-action="section"]'),
    };

    var cy = null;
    var G = null;
    var selected = null;

    // --- Ovládací panel -----------------------------------------------------------------------

    function setStats(text) { ui.stats.textContent = text; }

    // Aktivní tlačítko pohledu: třídy z data-class-on, ostatní z data-class-off, plus aria-pressed.
    function setMode(mode) {
      ui.modeButtons.forEach(function (b) {
        var on = b.getAttribute('data-mapa-mode') === mode;
        b.classList.remove.apply(b.classList, classes(b, on ? 'data-class-off' : 'data-class-on'));
        b.classList.add.apply(b.classList, classes(b, on ? 'data-class-on' : 'data-class-off'));
        b.setAttribute('aria-pressed', on ? 'true' : 'false');
      });
    }

    // Vybraná je volba se shodnou hodnotou, jinak první („— … —“).
    function setSelect(select, value) {
      Array.prototype.forEach.call(select.options, function (o) {
        o.selected = o.value === value;
      });
    }

    function setControls(mode, section, tag) {
      setMode(mode);
      setSelect(ui.section, section);
      setSelect(ui.tag, tag);
    }

    function field(name) { return ui.detail.querySelector('[data-mapa-field="' + name + '"]'); }

    // Karta vybraného uzlu; null ji skryje.
    function select(d) {
      selected = d;
      ui.detail.hidden = !d;
      if (!d) return;
      field('section').textContent = d.section;
      field('title').textContent = d.title;
      field('words').textContent = d.words == null ? '' : String(d.words);
      field('out').textContent = String(d.out);
      field('in').textContent = String(d.in);
      field('url').setAttribute('href', d.url);
      ui.tags.textContent = '';
      d.tags.forEach(function (t) {
        var b = ui.tagTemplate.content.firstElementChild.cloneNode(true);
        b.textContent = '#' + t;
        b.addEventListener('click', function () { showTag(t); });
        ui.tags.appendChild(b);
      });
    }

    function fillOptions(target, items) {
      var frag = document.createDocumentFragment();
      items.forEach(function (o) {
        var opt = document.createElement('option');
        opt.value = o.value;
        if (o.label != null) opt.textContent = o.label;
        frag.appendChild(opt);
      });
      target.appendChild(frag);
    }

    // --- Graf ---------------------------------------------------------------------------------

    function draw(elements, layout, note) {
      setStats(note);
      if (cy) cy.destroy();
      return V.cytoscape(ui.canvas, elements, layout).then(function (c) {
        cy = c;
        cy.on('tap', 'node', function (ev) { tap(ev.target.data()); });
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
    }

    function remember(key, value) {
      var url = new URL(location.href);
      ['oddil', 'stranka', 'stitek'].forEach(function (k) { url.searchParams.delete(k); });
      if (key) url.searchParams.set(key, value);
      history.replaceState(null, '', url);
    }

    function showSections() {
      setControls('sections', '', '');
      select(null);
      remember();
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
        els.push({ data: { id: 's:' + s, kind: 'section', section: s,
          label: V.sectionLabel(s) + ' · ' + count[s],
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
      var sections = els.filter(function (e) { return !e.data.source; }).length;
      return draw(els,
        { name: 'cose', animate: false, nodeRepulsion: 900000, idealEdgeLength: 120, padding: 30 },
        sections + ' oddílů; síla čáry = počet odkazů mezi oddíly. Klepnutím otevřete oddíl.');
    }

    function pageNode(n, opts) {
      var deg = G.in[n.id].length;
      return { data: { id: 'p:' + n.id, nid: n.id, kind: 'page', label: n.title,
        color: G.color(n.section), size: size(deg, 8, opts && opts.max || 40),
        fontSize: opts && opts.font || 8, focus: opts && opts.focus } };
    }

    function subgraph(ids, extra) {
      var set = {};
      ids.forEach(function (id) { set[id] = true; });
      var els = ids.map(function (id) { return pageNode(G.byId[id], extra && extra[id]); });
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
    }

    function showSection(section) {
      if (!section) return showSections();
      setControls('section', section, '');
      select(null);
      remember('oddil', section);
      var ids = G.nodes.filter(function (n) { return n.section === section; })
        .map(function (n) { return n.id; });
      var els = subgraph(ids);
      var layout = ids.length > 220
        ? { name: 'concentric', concentric: function (n) { return n.data('size'); },
          levelWidth: function () { return 4; }, minNodeSpacing: 6, animate: false }
        : { name: 'cose', animate: false, nodeRepulsion: 120000, idealEdgeLength: 70, padding: 20 };
      return draw(els, layout, ids.length + ' stránek oddílu „' + V.sectionLabel(section) +
        '“; velikost = počet odkazujících stránek.');
    }

    function showTag(tag) {
      if (!tag) return showSections();
      setControls('tag', '', tag);
      select(null);
      remember('stitek', tag);
      var ids = G.nodes.filter(function (n) { return (n.tags || []).indexOf(tag) !== -1; })
        .sort(function (a, b) { return G.in[b.id].length - G.in[a.id].length; }).slice(0, 300)
        .map(function (n) { return n.id; });
      return draw(subgraph(ids),
        { name: 'cose', animate: false, nodeRepulsion: 120000, idealEdgeLength: 70 },
        ids.length + ' stránek se štítkem #' + tag +
        (ids.length === 300 ? ' (nejodkazovanějších 300)' : '') + '.');
    }

    function showEgo(id) {
      var n = G.byId[id];
      if (!n) return;
      setControls('ego', '', '');
      select(describe(n));
      remember('stranka', n.path);
      var around = {};
      G.out[id].concat(G.in[id]).forEach(function (x) { if (x !== id) around[x] = true; });
      var ids = Object.keys(around).map(Number)
        .sort(function (a, b) { return G.in[b].length - G.in[a].length; }).slice(0, 70);
      var extra = {};
      extra[id] = { focus: true, max: 54, font: 12 };
      var els = subgraph([id].concat(ids), extra);
      return draw(els,
        { name: 'concentric',
          concentric: function (x) { return x.data('focus') ? 100 : x.data('size'); },
          levelWidth: function () { return 6; }, minNodeSpacing: 14, animate: false },
        '„' + n.title + '“: ' + G.out[id].length + ' odkazů ven, ' + G.in[id].length +
        ' odkazů sem' +
        (Object.keys(around).length > 70 ? ' (zobrazeno 70 nejodkazovanějších sousedů)' : '') +
        '.');
    }

    function describe(n) {
      return { id: n.id, title: n.title, section: V.sectionLabel(n.section), sectionKey: n.section,
        words: n.words, out: G.out[n.id].length, in: G.in[n.id].length,
        tags: (n.tags || []).slice(0, 8), url: G.url(n), lang: n.lang };
    }

    function tap(d) {
      if (d.kind === 'section') return showSection(d.section);
      select(describe(G.byId[d.nid]));
    }

    function search() {
      var raw = ui.query.value;
      var q = fold(raw.trim());
      if (!q) return;
      var best = null;
      G.nodes.forEach(function (n) {
        var t = fold(n.title);
        var score = t === q ? 3 : t.indexOf(q) === 0 ? 2 : t.indexOf(q) !== -1 ? 1 : 0;
        if (score && (!best || score > best.s ||
          (score === best.s && G.in[n.id].length > G.in[best.n.id].length))) {
          best = { s: score, n: n };
        }
      });
      if (best) showEgo(best.n.id);
      else setStats('Nic nenalezeno pro „' + raw + '“.');
    }

    // --- Události (ovládání reaguje až s načteným grafem) -------------------------------------

    function whenReady(fn) { return function () { if (G) fn(); }; }

    ui.modeButtons.forEach(function (b) { b.addEventListener('click', whenReady(showSections)); });
    ui.fitButton.addEventListener('click', function () { if (cy) cy.fit(undefined, 30); });
    ui.section.addEventListener('change', whenReady(function () {
      showSection(ui.section.value);
    }));
    ui.tag.addEventListener('change', whenReady(function () { showTag(ui.tag.value); }));
    ui.form.addEventListener('submit', function (ev) {
      ev.preventDefault();
      if (G) search();
    });
    ui.egoButton.addEventListener('click', function () { if (selected) showEgo(selected.id); });
    ui.sectionButton.addEventListener('click', function () {
      if (selected) showSection(selected.sectionKey);
    });

    // --- Načtení ------------------------------------------------------------------------------

    V.graph().then(function (g) {
      G = g;
      var counts = {};
      g.nodes.forEach(function (n) { counts[n.section] = (counts[n.section] || 0) + 1; });
      fillOptions(ui.section, g.sections.filter(function (s) { return s !== 'root'; })
        .map(function (s) {
          return { value: s, label: V.sectionLabel(s) + ' (' + counts[s] + ')' };
        })
        .sort(function (a, b) { return a.label.localeCompare(b.label, 'cs'); }));
      var tags = {};
      g.nodes.forEach(function (n) {
        (n.tags || []).forEach(function (t) { tags[t] = (tags[t] || 0) + 1; });
      });
      fillOptions(ui.tag, Object.keys(tags).filter(function (t) { return tags[t] > 2; })
        .sort(function (a, b) { return tags[b] - tags[a]; }).slice(0, 150)
        .map(function (t) { return { value: t, label: '#' + t + ' (' + tags[t] + ')' }; }));
      fillOptions(ui.titles, g.nodes.map(function (n) { return { value: n.title }; }));
      var params = new URLSearchParams(location.search);
      if (params.get('stranka') && g.byPath[params.get('stranka')]) {
        showEgo(g.byPath[params.get('stranka')].id);
      } else if (params.get('oddil')) showSection(params.get('oddil'));
      else if (params.get('stitek')) showTag(params.get('stitek'));
      else showSections();
      ui.loading.hidden = true;
    }).catch(function (e) {
      ui.loading.hidden = true;
      V.empty(ui.canvas, 'Mapu se nepodařilo načíst', e.message);
    });
  }

  function start() {
    var root = document.querySelector('[data-mapa]');
    if (root) init(root);
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start);
  else start();
})();
