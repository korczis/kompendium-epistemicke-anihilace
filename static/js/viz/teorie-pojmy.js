// Graf pojmů stránky nebo koncového rozcestníku číslované kapitoly (partials/pohled-stranky.html): stránka
// uprostřed, v prvním kruhu související pojmy z její hlavičky (extra.related_terms, přeložené na
// stránky přes static/data/terms.json), ve druhém stránky, na které odkazuje v textu, a mezi všemi
// odkazy z grafu knihy (static/data/graph.json). Na rozdíl od „Okolí stránky“ ukazuje i vazby mezi
// pojmy navzájem. Graf (síť vrstvy, KompendiumViz.network) se sestaví, až se přiblíží k oknu.
(function () {
  'use strict';

  var L = window.KompendiumVrstva;
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

  // Rozmístění v pixelech plochy: stránka uprostřed, související pojmy na vnitřní elipse,
  // ostatní na vnější, obě přes celou plochu. Popisek leží od středu ven (vlevo, vpravo, nad,
  // pod), aby se popisky vnitřního kruhu nepřekrývaly se středem ani navzájem. Popisek nesou
  // jen související pojmy; ostatní uzly ho ukážou při najetí nebo výběru (celý seznam je
  // v textové podobě).
  function elements(G, m, t, W, H) {
    var col = colors(t);
    var cx = W / 2;
    var cyy = H / 2;
    var rx = Math.max(40, W / 2 - 22);
    var ry = Math.max(40, H / 2 - 22);
    var nodes = [{ id: 'n' + m.c.id, label: m.c.title, color: col.c, size: 26, fontSize: 11, focus: true,
      x: cx, y: cyy, labelShow: 'hover', labelBg: true, labelWidth: 160 }];
    function ring(ids, k, phase) {
      ids.forEach(function (id, i) {
        var n = G.byId[id];
        var role = m.isRel[id] ? 'rel' : 'out';
        var a = -Math.PI / 2 + phase + (2 * Math.PI * i) / ids.length;
        var x = cx + Math.cos(a) * rx * k;
        var y = cyy + Math.sin(a) * ry * k;
        var c = Math.cos(a);
        var side = c > 0.35 ? 'right' : c < -0.35 ? 'left' : Math.sin(a) < 0 ? 'top' : 'bottom';
        var room = side === 'right' ? W - x - 16 : side === 'left' ? x - 16 : Math.min(x, W - x) * 2 - 16;
        nodes.push({ id: 'n' + id, label: n.title, color: col[role], x: x, y: y,
          size: role === 'rel' ? 18 : Math.min(16, 8 + Math.sqrt(m.degree[id] || 0) * 2),
          fontSize: role === 'rel' ? 11 : 10, labelShow: role === 'rel' ? 'show' : 'hover', labelBg: true,
          labelPos: side, labelWidth: Math.max(60, Math.min(180, room)), data: { nid: id } });
      });
    }
    var rel = m.ids.filter(function (id) { return m.isRel[id]; });
    var out = m.ids.filter(function (id) { return !m.isRel[id]; });
    ring(rel, 0.46, rel.length > 1 ? Math.PI / rel.length : Math.PI / 2);
    ring(out, 1, 0);
    var edges = m.ids.map(function (id) {
      var r = m.isRel[id];
      return { source: 'n' + m.c.id, target: 'n' + id, width: r ? 2 : 1, dashed: r,
        color: r ? t.primary : t.edge, opacity: r ? 0.9 : 0.6 };
    });
    m.between.forEach(function (e) {
      edges.push({ source: 'n' + e[0], target: 'n' + e[1], width: 1, opacity: 0.35 });
    });
    return { nodes: nodes, edges: edges };
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
      var order = m.ids;
      var cur = -1;
      var net = null;
      function show(i) {
        cur = i;
        if (i < 0) {
          caption.textContent = ''; el.removeAttribute('data-pohled-cil');
          if (net) net.select(null);
          return;
        }
        var n = G.byId[order[i]];
        if (net) net.select('n' + order[i]);
        caption.textContent = (m.isRel[order[i]] ? 'Související pojem' : 'Odkaz v textu') + ': ' + n.title +
          ' (' + (i + 1) + ' z ' + order.length + '). Enter stránku otevře.';
        el.setAttribute('data-pohled-cil', G.url(n));
      }
      // Rozmístění se počítá z velikosti plochy; po její změně ho síť vrstvy spočítá znovu.
      return V.network(el, function (t, box) {
        return elements(G, m, t, box.w, box.h);
      }, { layout: 'pixel', padding: 0, select: true, onClick: function (d) {
        if (d.data && d.data.nid !== undefined) window.location.href = G.url(G.byId[d.data.nid]);
      } }).then(function (n) {
        net = n;
        el.addEventListener('keydown', function (e) {
          var len = order.length;
          var keys = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
          if (e.key in keys) { e.preventDefault(); show(cur < 0 ? 0 : (cur + keys[e.key] + len) % len); }
          else if (e.key === 'Home') { e.preventDefault(); show(0); }
          else if (e.key === 'End') { e.preventDefault(); show(len - 1); }
          else if (e.key === 'Enter' && cur >= 0) { e.preventDefault(); window.location.href = G.url(G.byId[order[cur]]); }
          else if (e.key === 'Escape' && cur >= 0) { e.stopPropagation(); show(-1); }
        });
        root.setAttribute('data-pohled-stav', 'hotovo');
        return n;
      });
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Graf se nepodařilo načíst', e.message);
    });
  }

  // Každý výskyt pohledu se sestaví, až je vidět (KompendiumVrstva.mount).
  L.mount('teorie-pojmy', function (root, KV) {
    V = KV;
    render(root);
  });
})();
