// Rozhodovací body akutního protokolu jako tok (templates/page.html, oddíl emergency-protocols).
// Zdroj je jen to, co stránka sama nese: tabulka pod nadpisem „Rozhodovací body…“ se dvěma
// sloupci (situace → postup) a odkazy v buňce postupu. Řádky tabulky nejsou větve stromu a jejich
// pořadí není pořadí kroků, proto je tok kreslí jako souběžné dvojice situace → postup → navazující
// stránka, ve stejném pořadí jako tabulka. Bez tabulky v očekávaném tvaru se nic nekreslí.
// Graf (cytoscape přes KompendiumViz.cytoscape) se sestaví, až se přiblíží k oknu.
(function () {
  'use strict';

  var V;

  function heading(article) {
    var hs = article.querySelectorAll('h2[id^="rozhodovaci-body"]');
    return hs.length ? hs[0] : null;
  }

  // Tabulka mezi nadpisem a dalším H2, se dvěma sloupci v hlavičce i v každém řádku.
  function parse(article) {
    var h = heading(article);
    if (!h) return null;
    var table = null;
    for (var el = h.nextElementSibling; el && el.tagName !== 'H2'; el = el.nextElementSibling) {
      // site.js balí široké tabulky do posuvného obalu, tabulka tedy může být o úroveň níž.
      table = el.tagName === 'TABLE' ? el : el.querySelector('table');
      if (table) break;
    }
    if (!table || !table.tHead || !table.tBodies.length) return null;
    var th = table.tHead.querySelectorAll('th');
    if (th.length !== 2) return null;
    var rows = [];
    Array.prototype.forEach.call(table.tBodies[0].rows, function (tr, i) {
      if (tr.cells.length !== 2) return;
      if (!tr.id) tr.id = h.id + '-' + (i + 1);
      var links = [];
      Array.prototype.forEach.call(tr.cells[1].querySelectorAll('a[href]'), function (a) {
        if (!links.some(function (l) { return l.href === a.href; })) {
          links.push({ href: a.href, text: a.textContent.trim() });
        }
      });
      rows.push({ id: tr.id, cond: tr.cells[0].textContent.trim(), act: tr.cells[1].textContent.trim(), links: links });
    });
    if (!rows.length) return null;
    return { title: h.textContent.trim(), head: [th[0].textContent.trim(), th[1].textContent.trim()], rows: rows };
  }

  // Výška boxu z délky textu (zalamuje se po slovech, proto rezerva).
  function boxHeight(text, w, fs, pad) {
    var perLine = Math.max(8, Math.floor((w - 2 * pad) / (fs * 0.56)));
    var lines = Math.ceil(text.length / perLine * 1.1);
    return lines * Math.round(fs * 1.35) + 2 * pad;
  }

  // Rozvržení v pixelech hostitele: široký displej má tři sloupce, telefon dva a navazující
  // stránky leží pod postupem. Výška se nepředpokládá; graf se do pevné výšky karty vejde fit().
  function elements(m, W) {
    var narrow = W < 640;
    var fs = narrow ? 11 : 12;
    var pad = 8;
    var gap = narrow ? 18 : 32;
    var inner = W - 16;
    var cw = narrow ? (inner - gap) / 2 : inner * 0.36;
    var aw = cw;
    var lw = narrow ? aw : inner - cw - aw - 2 * gap;
    var x0 = 8 + cw / 2;
    var x1 = 8 + cw + gap + aw / 2;
    var x2 = narrow ? x1 : 8 + cw + gap + aw + gap + lw / 2;
    var out = [];
    var grid = [];
    var y = 12;
    var caps = [m.head[0], m.head[1]].concat(narrow ? [] : ['Navazující stránky']);
    [x0, x1, x2].slice(0, caps.length).forEach(function (x, i) {
      out.push({ group: 'nodes', classes: 'cap', position: { x: x, y: y },
        data: { id: 'cap' + i, label: caps[i], w: i ? (i === 2 ? lw : aw) : cw, h: 18, tw: i === 2 ? lw : cw,
          color: 'transparent', size: 18, fontSize: fs } });
    });
    y += 22;
    m.rows.forEach(function (r, i) {
      var hc = boxHeight(r.cond, cw, fs, pad);
      var ha = boxHeight(r.act, aw, fs, pad);
      var lh = r.links.map(function (l) { return boxHeight(l.text, lw, fs, 6); });
      var stack = narrow ? ha + lh.reduce(function (s, h) { return s + h + 14; }, 0) : ha;
      var linkStack = narrow ? 0 : lh.reduce(function (s, h) { return s + h + 8; }, -8);
      var rowH = Math.max(hc, stack, linkStack);
      var top = y;
      var row = [];
      function box(id, cls, x, cy, w, h, label, target) {
        out.push({ group: 'nodes', classes: 'box ' + cls, position: { x: x, y: cy },
          data: { id: id, label: label, w: w, h: h, tw: w - 2 * pad, color: 'transparent', size: h, fontSize: fs, target: target } });
        row.push(id);
      }
      box('c' + i, 'cond', x0, top + rowH / 2, cw, hc, r.cond, '#' + r.id);
      var ay = narrow ? top + ha / 2 : top + rowH / 2;
      box('a' + i, 'act', x1, ay, aw, ha, r.act, '#' + r.id);
      out.push({ group: 'edges', classes: 'flow', data: { id: 'e' + i, source: 'c' + i, target: 'a' + i, width: 1.5 } });
      var ly = narrow ? top + ha + 14 : top + (rowH - linkStack) / 2;
      r.links.forEach(function (l, j) {
        box('l' + i + '-' + j, 'link', x2, ly + lh[j] / 2, lw, lh[j], l.text, l.href);
        out.push({ group: 'edges', classes: 'flow', data: { id: 'f' + i + '-' + j, source: 'a' + i, target: 'l' + i + '-' + j, width: 1.5 } });
        ly += lh[j] + (narrow ? 14 : 8);
      });
      grid.push(row);
      y += rowH + (narrow ? 16 : 14);
    });
    return { elements: out, grid: grid };
  }

  // Barva textu na ploše: tmavá (gray-900), nebo bílá, podle toho, která má vyšší kontrast (WCAG).
  function ink(hex) {
    var n = parseInt(String(hex).slice(1), 16);
    var lum = [n >> 16, (n >> 8) & 255, n & 255].map(function (v) {
      v /= 255;
      return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    });
    var L = 0.2126 * lum[0] + 0.7152 * lum[1] + 0.0722 * lum[2];
    var dark = (L + 0.05) / (0.0092 + 0.05); // relativní jas #111827
    var light = 1.05 / (L + 0.05);
    return dark >= light ? '#111827' : '#ffffff';
  }

  // Doplňkový styl nad jednotným stylem vrstvy; po přepnutí tématu se přidá znovu.
  function extra(t) {
    return [
      { selector: 'node.box', style: { 'shape': 'round-rectangle', 'width': 'data(w)', 'height': 'data(h)',
        'background-color': t.surface, 'border-width': 1.5, 'border-color': t.muted, 'color': t.text,
        'text-valign': 'center', 'text-halign': 'center', 'text-wrap': 'wrap', 'text-max-width': 'data(tw)',
        'text-margin-y': 0, 'line-height': 1.35, 'font-size': 'data(fontSize)' } },
      { selector: 'node.cond', style: { 'border-color': t.primary, 'border-width': 2 } },
      { selector: 'node.link', style: { 'background-color': t.primary, 'border-width': 0, 'color': ink(t.primary),
        'font-weight': 600 } },
      { selector: 'node.cap', style: { 'shape': 'rectangle', 'width': 'data(w)', 'height': 'data(h)',
        'background-opacity': 0, 'color': t.muted, 'text-valign': 'center', 'text-margin-y': 0,
        'font-weight': 600, 'text-transform': 'uppercase', 'events': 'no' } },
      { selector: 'node.box:selected', style: { 'border-width': 3, 'border-color': t.accent } },
      { selector: 'edge.flow', style: { 'curve-style': 'straight', 'line-color': t.muted, 'opacity': 1,
        'target-arrow-shape': 'triangle', 'target-arrow-color': t.muted, 'arrow-scale': 0.9 } },
    ];
  }

  function restyle(cy) {
    var s = cy.style();
    extra(V.theme()).forEach(function (r) { s = s.selector(r.selector).style(r.style); });
    s.update();
  }

  function renderList(root, m) {
    var list = root.querySelector('[data-pohled-seznam]');
    var tpl = root.querySelector('template[data-pohled-polozka]');
    if (!list || !tpl) return;
    list.innerHTML = '';
    function item(href, text, desc) {
      var li = tpl.content.firstElementChild.cloneNode(true);
      var a = li.querySelector('[data-slot="odkaz"]');
      a.href = href;
      a.textContent = text;
      li.querySelector('[data-slot="popis"]').textContent = desc;
      list.appendChild(li);
    }
    m.rows.forEach(function (r) {
      item('#' + r.id, r.cond, m.head[1] + ': ' + r.act);
      r.links.forEach(function (l) { item(l.href, l.text, 'Navazuje na postup: ' + r.act); });
    });
  }

  function render(root, article) {
    var el = root.querySelector('[data-pohled-graf]');
    var caption = root.querySelector('[data-pohled-vyber]');
    var m = parse(article);
    if (!m) {
      root.setAttribute('data-pohled-stav', 'prazdny');
      V.empty(el, 'Tabulka rozhodovacích bodů chybí', 'Tok se kreslí jen z tabulky situací a postupů na této stránce.');
      return null;
    }
    renderList(root, m);
    var built = elements(m, el.clientWidth || 360);
    var grid = built.grid;
    return V.cytoscape(el, built.elements, { name: 'preset', fit: true, padding: 8 }).then(function (cy) {
      cy.userZoomingEnabled(false);
      cy.userPanningEnabled(false);
      cy.autoungrabify(true);
      restyle(cy);
      document.addEventListener('dark-mode', function () { restyle(cy); });

      var lastW = el.clientWidth;
      if ('ResizeObserver' in window) {
        new ResizeObserver(function () {
          if (Math.abs(el.clientWidth - lastW) < 8) { cy.resize(); cy.fit(undefined, 8); return; }
          lastW = el.clientWidth;
          var next = elements(m, lastW);
          cy.elements().remove();
          cy.add(next.elements);
          grid = next.grid;
          cy.resize();
          cy.fit(undefined, 8);
          if (cur) show(cur[0], cur[1]);
        }).observe(el);
      }

      var cur = null;
      function kind(id) {
        return id[0] === 'c' ? m.head[0] : id[0] === 'a' ? m.head[1] : 'Navazující stránka';
      }
      function show(r, c) {
        cy.$(':selected').unselect();
        if (r < 0) { cur = null; caption.textContent = ''; el.removeAttribute('data-pohled-cil'); return; }
        r = Math.max(0, Math.min(grid.length - 1, r));
        c = Math.max(0, Math.min(grid[r].length - 1, c));
        cur = [r, c];
        var n = cy.getElementById(grid[r][c]);
        n.select();
        var target = n.data('target');
        caption.textContent = kind(n.id()) + ': ' + n.data('label') + '. ' +
          (target.charAt(0) === '#' ? 'Enter přejde na řádek tabulky.' : 'Enter otevře stránku.');
        el.setAttribute('data-pohled-cil', target);
      }
      function open(n) {
        var target = n.data('target');
        if (!target) return;
        if (target.charAt(0) === '#') window.location.hash = target.slice(1);
        else window.location.href = target;
      }
      cy.on('tap', 'node.box', function (ev) { open(ev.target); });
      cy.on('mouseover', 'node.box', function () { el.style.cursor = 'pointer'; });
      cy.on('mouseout', 'node.box', function () { el.style.cursor = ''; });
      el.addEventListener('keydown', function (e) {
        var r = cur ? cur[0] : -1;
        var c = cur ? cur[1] : 0;
        var moves = { ArrowDown: [1, 0], ArrowUp: [-1, 0], ArrowRight: [0, 1], ArrowLeft: [0, -1] };
        if (e.key in moves) {
          e.preventDefault();
          if (!cur) return show(0, 0);
          show(r + moves[e.key][0], c + moves[e.key][1]);
        } else if (e.key === 'Home') { e.preventDefault(); show(0, 0); }
        else if (e.key === 'End') { e.preventDefault(); show(grid.length - 1, 0); }
        else if (e.key === 'Enter' && cur) { e.preventDefault(); open(cy.getElementById(grid[r][c])); }
        else if (e.key === 'Escape') show(-1);
      });
      root.setAttribute('data-pohled-stav', 'hotovo');
      return cy;
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Tok se nepodařilo sestavit', e.message);
    });
  }

  function init() {
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-pohled="protokol-tok"]');
    if (!V || !roots.length) return;
    Array.prototype.forEach.call(roots, function (root) {
      var article = root.closest('article') || document;
      if (!('IntersectionObserver' in window)) { render(root, article); return; }
      var io = new IntersectionObserver(function (entries) {
        if (!entries.some(function (en) { return en.isIntersecting; })) return;
        io.disconnect();
        render(root, article);
      }, { rootMargin: '200px 0px' });
      io.observe(root);
    });
  }

  // Skript je deferred a v těle stránky stojí před kompendium-viz.js: DOMContentLoaded přijde až
  // po všech deferred skriptech, takže vrstva už je načtená.
  if (document.readyState === 'complete') init();
  else document.addEventListener('DOMContentLoaded', init);
})();
