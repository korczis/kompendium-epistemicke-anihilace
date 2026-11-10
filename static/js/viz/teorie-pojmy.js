// Graf pojmů stránky nebo koncového rozcestníku číslované kapitoly (partials/pohled-stranky.html): stránka
// uprostřed, v prvním kruhu související pojmy z její hlavičky (extra.related_terms, přeložené na
// stránky přes static/data/terms.json), ve druhém stránky, na které odkazuje v textu, a mezi všemi
// odkazy z grafu knihy (static/data/graph.json). Na rozdíl od „Okolí stránky“ ukazuje i vazby mezi
// pojmy navzájem. Graf (cytoscape přes KompendiumViz.cytoscape) se sestaví, až se přiblíží k oknu.
(function () {
  'use strict';

  var V;
  var LIMIT = 32; // nejvýš uzlů v grafu, aby popisky zůstaly čitelné i na telefonu

  function unique(list) {
    var seen = {};
    return list.filter(function (x) { return seen[x] ? false : (seen[x] = true); });
  }

  function model(G, T, path, slugs) {
    var c = G.byPath[path];
    if (!c) return null;
    var byUrl = {};
    G.nodes.forEach(function (n) { byUrl[n.url] = n; });
    var related = unique(slugs.map(function (s) {
      var t = T.terms[s];
      var n = t && byUrl[V.pageUrl(t[0])];
      return n && n.id !== c.id ? n.id : null;
    }).filter(function (x) { return x !== null; }));
    var isRel = {};
    related.forEach(function (id) { isRel[id] = true; });
    var outs = unique(G.out[c.id]).filter(function (id) { return id !== c.id && !isRel[id]; })
      .sort(function (a, b) {
        return G.in[b].length - G.in[a].length || G.byId[a].title.localeCompare(G.byId[b].title, 'cs');
      });
    var linked = {};
    G.out[c.id].forEach(function (id) { linked[id] = true; });
    var ids = related.concat(outs).slice(0, Math.max(related.length, LIMIT));
    var inside = {};
    ids.forEach(function (id) { inside[id] = true; });
    var between = [];
    var degree = {};
    ids.forEach(function (a) {
      unique(G.out[a]).forEach(function (b) {
        if (inside[b] && a !== b) {
          between.push([a, b]);
          degree[a] = (degree[a] || 0) + 1;
          degree[b] = (degree[b] || 0) + 1;
        }
      });
    });
    return { c: c, ids: ids, isRel: isRel, linked: linked, between: between, degree: degree,
      hidden: related.length + outs.length - ids.length };
  }

  function colors(t) {
    return { c: t.accent, rel: t.primary, out: t.muted };
  }

  function elements(G, m, t) {
    var col = colors(t);
    var els = [{ data: { id: 'n' + m.c.id, label: m.c.title, color: col.c, size: 26, fontSize: 11, focus: true, role: 'c',
      ha: 'center', va: 'bottom', tw: 160 } }];
    m.ids.forEach(function (id) {
      var n = G.byId[id];
      var role = m.isRel[id] ? 'rel' : 'out';
      els.push({ data: { id: 'n' + id, nid: id, label: n.title, color: col[role], role: role, ha: 'center', va: 'bottom', tw: 140,
        size: role === 'rel' ? 18 : Math.min(16, 8 + Math.sqrt(m.degree[id] || 0) * 2), fontSize: role === 'rel' ? 11 : 10 } });
      els.push({ classes: role === 'rel' ? 'rel' : '', data: { id: 'c' + id, source: 'n' + m.c.id, target: 'n' + id,
        width: role === 'rel' ? 2 : 1 } });
    });
    m.between.forEach(function (e, i) {
      els.push({ classes: 'mezi', data: { id: 'b' + i, source: 'n' + e[0], target: 'n' + e[1], width: 1 } });
    });
    return els;
  }

  // Rozmístění: stránka uprostřed, související pojmy na vnitřní elipse, ostatní na vnější, obě
  // přes celou plochu hostitele. Popisek leží od středu ven (vlevo, vpravo, nad, pod), aby se
  // popisky vnitřního kruhu nepřekrývaly se středem ani navzájem.
  function place(cy, W, H) {
    var cx = W / 2;
    var cyy = H / 2;
    var rx = Math.max(40, W / 2 - 22);
    var ry = Math.max(40, H / 2 - 22);
    function ring(nodes, k, phase) {
      var n = nodes.length;
      nodes.forEach(function (node, i) {
        var a = -Math.PI / 2 + phase + (2 * Math.PI * i) / n;
        var x = cx + Math.cos(a) * rx * k;
        var y = cyy + Math.sin(a) * ry * k;
        var c = Math.cos(a);
        var side = c > 0.35 ? 'right' : c < -0.35 ? 'left' : 'center';
        var room = side === 'right' ? W - x - 16 : side === 'left' ? x - 16 : Math.min(x, W - x) * 2 - 16;
        node.position({ x: x, y: y });
        node.data({ ha: side, va: side === 'center' ? (Math.sin(a) < 0 ? 'top' : 'bottom') : 'center',
          tw: Math.max(60, Math.min(180, room)) });
      });
    }
    cy.getElementById(cy.nodes('[role = "c"]').id()).position({ x: cx, y: cyy });
    var rel = cy.nodes('[role = "rel"]');
    ring(rel, 0.46, rel.length > 1 ? Math.PI / rel.length : Math.PI / 2);
    ring(cy.nodes('[role = "out"]'), 1, 0);
    cy.zoom(1);
    cy.pan({ x: 0, y: 0 });
  }

  function restyle(cy) {
    var t = V.theme();
    var col = colors(t);
    cy.nodes().forEach(function (n) { n.data('color', col[n.data('role')]); });
    // Popisek nesou jen související pojmy; ostatní uzly ho ukážou při najetí nebo výběru, jinak by
    // se popisky v kruhu překrývaly (celý seznam je v textové podobě).
    var label = { 'text-background-color': t.surface, 'text-background-opacity': 0.9, 'text-background-padding': 2,
      'text-background-shape': 'roundrectangle', 'color': t.text, 'text-halign': 'data(ha)', 'text-valign': 'data(va)',
      'text-margin-x': 0, 'text-margin-y': 0, 'text-max-width': 'data(tw)', 'text-wrap': 'ellipsis' };
    cy.style().selector('edge.rel').style({ 'line-color': t.primary, 'line-style': 'dashed', 'opacity': 0.9 })
      .selector('edge.mezi').style({ 'opacity': 0.35 })
      .selector('node').style(label)
      .selector('node[role = "c"], node[role = "out"]').style({ 'label': '' })
      .selector('node[role = "out"].hover, node[role = "out"]:selected').style({ 'label': 'data(label)', 'z-index': 10 })
      .selector('node:selected').style({ 'border-width': 3, 'border-color': t.text })
      .update();
  }

  function renderList(root, G, m) {
    var list = root.querySelector('[data-pohled-seznam]');
    var tpl = root.querySelector('template[data-pohled-polozka]');
    if (!list || !tpl) return;
    list.innerHTML = '';
    m.ids.forEach(function (id) {
      var n = G.byId[id];
      var li = tpl.content.firstElementChild.cloneNode(true);
      var a = li.querySelector('[data-slot="odkaz"]');
      a.href = G.url(n);
      a.textContent = n.title;
      var role = m.isRel[id] ? (m.linked[id] ? 'související pojem, odkaz i v textu' : 'související pojem z hlavičky') : 'odkaz v textu';
      var d = m.degree[id] || 0;
      li.querySelector('[data-slot="popis"]').textContent = role +
        (d ? '; vazby s dalšími pojmy v grafu: ' + d : '');
      list.appendChild(li);
    });
    if (m.hidden > 0) {
      var more = tpl.content.firstElementChild.cloneNode(true);
      more.querySelector('[data-slot="odkaz"]').remove();
      more.querySelector('[data-slot="popis"]').textContent = 'Graf ukazuje ' + m.ids.length +
        ' nejodkazovanějších stránek; dalších ' + m.hidden + ' odkazů je jen v textu.';
      list.appendChild(more);
    }
  }

  function render(root) {
    var el = root.querySelector('[data-pohled-graf]');
    var caption = root.querySelector('[data-pohled-vyber]');
    var path = root.getAttribute('data-pohled-stranka');
    var slugs = (root.getAttribute('data-pohled-pojmy') || '').split(/\s+/).filter(Boolean);
    return Promise.all([V.graph(), V.json('data/terms.json')]).then(function (r) {
      var G = r[0];
      var m = model(G, r[1], path, slugs);
      if (!m || !m.ids.length) {
        root.setAttribute('data-pohled-stav', 'prazdny');
        V.empty(el, 'Zatím bez pojmů', 'Stránka nemá související pojmy ani odkazy v grafu knihy.');
        return null;
      }
      renderList(root, G, m);
      return V.cytoscape(el, elements(G, m, V.theme()), { name: 'preset', fit: false }).then(function (cy) {
        cy.userZoomingEnabled(false);
        cy.userPanningEnabled(false);
        cy.autoungrabify(true);
        place(cy, el.clientWidth, el.clientHeight);
        restyle(cy);
        document.addEventListener('dark-mode', function () { restyle(cy); });
        if ('ResizeObserver' in window) {
          new ResizeObserver(function () { cy.resize(); place(cy, el.clientWidth, el.clientHeight); }).observe(el);
        }
        var order = m.ids;
        var cur = -1;
        function show(i) {
          cy.$(':selected').unselect();
          cur = i;
          if (i < 0) { caption.textContent = ''; el.removeAttribute('data-pohled-cil'); return; }
          var n = G.byId[order[i]];
          cy.getElementById('n' + order[i]).select();
          caption.textContent = (m.isRel[order[i]] ? 'Související pojem' : 'Odkaz v textu') + ': ' + n.title +
            ' (' + (i + 1) + ' z ' + order.length + '). Enter stránku otevře.';
          el.setAttribute('data-pohled-cil', G.url(n));
        }
        cy.on('tap', 'node', function (ev) {
          var id = ev.target.data('nid');
          if (id !== undefined) window.location.href = G.url(G.byId[id]);
        });
        cy.on('mouseover', 'node', function (ev) {
          ev.target.addClass('hover');
          if (ev.target.data('nid') !== undefined) el.style.cursor = 'pointer';
        });
        cy.on('mouseout', 'node', function (ev) { ev.target.removeClass('hover'); el.style.cursor = ''; });
        el.addEventListener('keydown', function (e) {
          var n = order.length;
          var keys = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
          if (e.key in keys) { e.preventDefault(); show(cur < 0 ? 0 : (cur + keys[e.key] + n) % n); }
          else if (e.key === 'Home') { e.preventDefault(); show(0); }
          else if (e.key === 'End') { e.preventDefault(); show(n - 1); }
          else if (e.key === 'Enter' && cur >= 0) { e.preventDefault(); window.location.href = G.url(G.byId[order[cur]]); }
          else if (e.key === 'Escape') show(-1);
        });
        root.setAttribute('data-pohled-stav', 'hotovo');
        return cy;
      });
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Graf se nepodařilo načíst', e.message);
    });
  }

  function init() {
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-pohled="teorie-pojmy"]');
    if (!V || !roots.length) return;
    Array.prototype.forEach.call(roots, function (root) {
      if (!('IntersectionObserver' in window)) { render(root); return; }
      var io = new IntersectionObserver(function (entries) {
        if (!entries.some(function (en) { return en.isIntersecting; })) return;
        io.disconnect();
        render(root);
      }, { rootMargin: '200px 0px' });
      io.observe(root);
    });
  }

  // Skript je deferred a v těle stránky stojí před kompendium-viz.js: DOMContentLoaded přijde až
  // po všech deferred skriptech, takže vrstva už je načtená.
  if (document.readyState === 'complete') init();
  else document.addEventListener('DOMContentLoaded', init);
})();
