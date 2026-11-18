// Rozhodovací body akutního protokolu jako tok (templates/page.html, oddíl emergency-protocols).
// Zdroj je jen to, co stránka sama nese: tabulka pod nadpisem „Rozhodovací body…“ se dvěma
// sloupci (situace → postup) a odkazy v buňce postupu. Řádky tabulky nejsou větve stromu a jejich
// pořadí není pořadí kroků, proto je tok kreslí jako souběžné dvojice situace → postup → navazující
// stránka, ve stejném pořadí jako tabulka. Bez tabulky v očekávaném tvaru se nic nekreslí.
// Graf (síť vrstvy, KompendiumViz.network) se sestaví, až se přiblíží k oknu.
(function () {
  'use strict';

  var L = window.KompendiumVrstva;
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
  // stránky leží pod postupem. Výška se nepředpokládá; síť vrstvy kresbu větší než plocha
  // rovnoměrně zmenší (layout 'pixel').
  function elements(m, W, t) {
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
    var nodes = [];
    var edges = [];
    var grid = [];
    var y = 12;
    var caps = [m.head[0], m.head[1]].concat(narrow ? [] : ['Navazující stránky']);
    [x0, x1, x2].slice(0, caps.length).forEach(function (x, i) {
      var w = i ? (i === 2 ? lw : aw) : cw;
      nodes.push({ id: 'cap' + i, shape: 'cap', x: x, y: y, size: [w, 18], label: caps[i].toUpperCase(),
        labelColor: t.muted, labelBold: true, fontSize: fs, labelWidth: w });
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
      function box(id, kind, x, cy, w, h, label, target) {
        var link = kind === 'link';
        nodes.push({ id: id, shape: 'box', x: x, y: cy, size: [w, h], label: label, labelWrap: true,
          labelWidth: w - 2 * pad, fontSize: fs, labelBold: link, labelColor: link ? L.ink(t.primary) : t.text,
          color: link ? t.primary : t.surface, borderColor: kind === 'cond' ? t.primary : t.muted,
          borderWidth: link ? 0 : kind === 'cond' ? 2 : 1.5, data: { target: target, kind: kind } });
        row.push(id);
      }
      box('c' + i, 'cond', x0, top + rowH / 2, cw, hc, r.cond, '#' + r.id);
      var ay = narrow ? top + ha / 2 : top + rowH / 2;
      box('a' + i, 'act', x1, ay, aw, ha, r.act, '#' + r.id);
      edges.push({ source: 'c' + i, target: 'a' + i, width: 1.5, color: t.muted, opacity: 1, arrow: true });
      var ly = narrow ? top + ha + 14 : top + (rowH - linkStack) / 2;
      r.links.forEach(function (l, j) {
        box('l' + i + '-' + j, 'link', x2, ly + lh[j] / 2, lw, lh[j], l.text, l.href);
        edges.push({ source: 'a' + i, target: 'l' + i + '-' + j, width: 1.5, color: t.muted, opacity: 1, arrow: true });
        ly += lh[j] + (narrow ? 14 : 8);
      });
      grid.push(row);
      y += rowH + (narrow ? 16 : 14);
    });
    return { nodes: nodes, edges: edges, grid: grid };
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
    var grid = [];
    var byId = {};
    var net = null;
    var cur = null;
    function kind(id) {
      return id[0] === 'c' ? m.head[0] : id[0] === 'a' ? m.head[1] : 'Navazující stránka';
    }
    function open(d) {
      var target = d && d.data && d.data.target;
      if (!target) return;
      if (target.charAt(0) === '#') window.location.hash = target.slice(1);
      else window.location.href = target;
    }
    function show(r, c) {
      if (r < 0) {
        cur = null; caption.textContent = ''; el.removeAttribute('data-pohled-cil');
        if (net) net.select(null);
        return;
      }
      r = Math.max(0, Math.min(grid.length - 1, r));
      c = Math.max(0, Math.min(grid[r].length - 1, c));
      cur = [r, c];
      var d = byId[grid[r][c]];
      if (net) net.select(d.id);
      var target = d.data.target;
      caption.textContent = kind(d.id) + ': ' + d.label + '. ' +
        (target.charAt(0) === '#' ? 'Enter přejde na řádek tabulky.' : 'Enter otevře stránku.');
      el.setAttribute('data-pohled-cil', target);
    }
    // Kresba se počítá z šířky plochy; po změně velikosti ji síť vrstvy sestaví znovu.
    return V.network(el, function (t, box) {
      var built = elements(m, box.w || 360, t);
      grid = built.grid;
      byId = {};
      built.nodes.forEach(function (d) { byId[d.id] = d; });
      return built;
    }, { layout: 'pixel', focus: false, select: true, onClick: open }).then(function (n) {
      net = n;
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
        else if (e.key === 'Enter' && cur) { e.preventDefault(); open(byId[grid[r][c]]); }
        else if (e.key === 'Escape' && cur) { e.stopPropagation(); show(-1); }
      });
      root.setAttribute('data-pohled-stav', 'hotovo');
      return n;
    }).catch(function (e) {
      root.setAttribute('data-pohled-stav', 'chyba');
      V.empty(el, 'Tok se nepodařilo sestavit', e.message);
    });
  }

  // Každý výskyt pohledu se sestaví, až je vidět (KompendiumVrstva.mount).
  L.mount('protokol-tok', function (root, KV) {
    V = KV;
    render(root, root.closest('article') || document);
  });
})();
