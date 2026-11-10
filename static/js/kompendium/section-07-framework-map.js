// Kapitola 7 — mapa teoretických rámců (p5.js, silový layout). Uzly = stránky kapitoly, ve
// které graf leží (z grafu knihy; číslo, autor a téma z názvu stránky), barva = tradice podle
// přehledové stránky kapitoly „Filozofické tradice“ (nadpis a odkazy pod ním; stránky, které
// přehled nezařazuje, jsou šedé), hrany = odkazy mezi stránkami v knize. Hrana tedy není
// tvrzení o vlivu, jen „kniha mezi kapitolami odkazuje“ (oběma směry = silnější čára).
// Klik na uzel → kapitola, tradice, sousedé a odkaz na stránku.
(function() {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;

  function kniha() {
    if (!window.__kniha) {
      window.__kniha = (window.KompendiumKniha ? Promise.resolve() : new Promise(function (ok, fail) {
        var s = document.createElement('script');
        s.src = SRC.replace(/[^/]*$/, 'kniha.js');
        s.onload = ok;
        s.onerror = function () { fail(new Error('kniha.js se nenačetl')); };
        document.head.appendChild(s);
      })).then(function () { return window.KompendiumKniha.ready(); });
    }
    return window.__kniha;
  }

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  var UNGROUPED = [100, 116, 139];

  function hexRgb(hex) {
    var n = parseInt(hex.slice(1), 16);
    return [n >> 16, (n >> 8) & 255, n & 255];
  }

  // Data mapy: stránky kapitoly, tradice z přehledové podstránky, hrany z grafu.
  function model(K) {
    var here = K.current;
    var section = here ? here.section : '';
    var pages = K.pagesOf(section).filter(function (n) { return !here || n.id !== here.id; });
    var subIndexes = K.g.nodes.filter(function (n) {
      return n.section === section && K.isIndex(n) && n.path !== section + '/_index.md';
    });
    return Promise.all(subIndexes.map(function (ix) {
      return K.groups(ix, pages).then(function (g) { return { index: ix, groups: g }; });
    })).then(function (all) {
      function size(c) { return c.groups.reduce(function (s, g) { return s + g.nodes.length; }, 0); }
      var best = all.sort(function (a, b) { return size(b) - size(a); })[0] || { index: null, groups: [] };
      var groups = best.groups;
      var trad = {};
      var traditions = groups.map(function (g, i) {
        var t = { label: g.title, rgb: hexRgb(K.V.PALETTE[i % K.V.PALETTE.length]), count: g.nodes.length };
        g.nodes.forEach(function (n) { trad[n.id] = t; });
        return t;
      });
      var none = { label: 'Přehled tradic stránku nezařazuje', rgb: UNGROUPED, count: 0 };
      var data = pages.map(function (n) {
        var t = K.parseTitle(n.title);
        if (!trad[n.id]) none.count++;
        var label = t.head.length > 24 ? t.head.slice(0, 23) + '…' : t.head;
        return { id: n.id, node: n, num: t.num, label: label, concept: t.rest || t.full, trad: trad[n.id] || none };
      });
      var edges = K.edgesAmong(pages.map(function (n) { return n.id; }));
      return { data: data, edges: edges, traditions: none.count ? traditions.concat([none]) : traditions,
        source: best.index };
    });
  }

  function setDetail(K, container, node, neighbors) {
    K.clear(container);
    container.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', (node.num ? node.num + ' ' : '') + node.label));
    container.appendChild(K.h('p', 'text-slate-400 text-sm', 'Tradice: ' + node.trad.label));
    container.appendChild(K.h('p', 'text-slate-300 mt-2 text-sm', node.concept));
    container.appendChild(K.h('p', 'text-slate-300 mt-2 font-semibold', 'Vazby podle odkazů v knize (' + neighbors.length + '):'));
    container.appendChild(K.list(neighbors.map(function (d) { return d.node; })));
    var p = K.h('p', 'mt-2 text-sm');
    p.appendChild(K.link(node.node, '→ Otevřít plný článek'));
    container.appendChild(p);
  }

  function init() {
    const host = document.getElementById('section-07-framework-map');
    if (!host || typeof p5 === 'undefined') return;
    const detail = document.getElementById('framework-detail');
    kniha().then(function (K) {
      return model(K).then(function (m) { draw(K, m, host, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, M, host, detail) {
    const PHILOSOPHERS = M.data;
    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', PHILOSOPHERS.length + ' kapitol, ' + M.edges.length +
        ' vazeb podle odkazů v knize. Barvy: ' + M.traditions.map(function (t) { return t.label + ' (' + t.count + ')'; }).join(' · ') + '.'));
      if (M.source) detail.appendChild(K.link(M.source, '→ přehled filozofických tradic'));
    }

    new p5(function(p) {
      let w = host.clientWidth || 800, h = 600;
      const nodes = [];
      const edges = [];
      let hovered = null;
      let selected = null;
      let dragNode = null;

      p.setup = function() {
        const cnv = p.createCanvas(w, h);
        cnv.parent(host);

        // Initialize node positions deterministically (no Math.random for reproducibility across reloads)
        PHILOSOPHERS.forEach((ph, i) => {
          const a = (i / PHILOSOPHERS.length) * Math.PI * 2;
          nodes.push({
            data: ph,
            x: w / 2 + Math.cos(a) * 220,
            y: h / 2 + Math.sin(a) * 220,
            vx: 0, vy: 0,
            pinned: false
          });
        });

        const idx = {};
        nodes.forEach((n, i) => { idx[n.data.id] = i; });
        M.edges.forEach((e) => { edges.push({ a: idx[e.a], b: idx[e.b], mutual: e.mutual }); });
      };

      function neighborsOf(nodeIdx) {
        const set = new Set();
        edges.forEach((e) => {
          if (e.a === nodeIdx) set.add(e.b);
          if (e.b === nodeIdx) set.add(e.a);
        });
        return set;
      }

      function step() {
        // Repulsion
        for (let i = 0; i < nodes.length; i++) {
          for (let j = i + 1; j < nodes.length; j++) {
            const dx = nodes[j].x - nodes[i].x;
            const dy = nodes[j].y - nodes[i].y;
            const d2 = Math.max(64, dx * dx + dy * dy);
            const f = 1500 / d2;
            const d = Math.sqrt(d2);
            const fx = (dx / d) * f;
            const fy = (dy / d) * f;
            nodes[i].vx -= fx; nodes[i].vy -= fy;
            nodes[j].vx += fx; nodes[j].vy += fy;
          }
        }
        // Spring on edges
        edges.forEach((e) => {
          const a = nodes[e.a], b = nodes[e.b];
          const dx = b.x - a.x;
          const dy = b.y - a.y;
          const d = Math.max(1, Math.sqrt(dx * dx + dy * dy));
          const k = e.mutual ? 0.0018 : 0.0006;
          const target = 110;
          const f = k * (d - target);
          const fx = (dx / d) * f;
          const fy = (dy / d) * f;
          a.vx += fx; a.vy += fy;
          b.vx -= fx; b.vy -= fy;
        });
        // Centering
        nodes.forEach((n) => {
          n.vx += (w / 2 - n.x) * 0.0005;
          n.vy += (h / 2 - n.y) * 0.0005;
        });
        // Integrate
        nodes.forEach((n) => {
          if (n.pinned) { n.vx = 0; n.vy = 0; return; }
          n.vx *= 0.85; n.vy *= 0.85;
          n.x += n.vx; n.y += n.vy;
          // bounds
          n.x = Math.max(20, Math.min(w - 20, n.x));
          n.y = Math.max(20, Math.min(h - 20, n.y));
        });
      }

      function pick(mx, my) {
        let best = null, bestD = 9999;
        nodes.forEach((n, i) => {
          const dx = mx - n.x, dy = my - n.y;
          const d = Math.sqrt(dx * dx + dy * dy);
          if (d < 16 && d < bestD) { best = i; bestD = d; }
        });
        return best;
      }

      p.draw = function() {
        p.background(15, 23, 42);
        if (!dragNode) step();

        const selectedNeighbors = selected !== null ? neighborsOf(selected) : null;

        // Edges
        edges.forEach((e) => {
          const a = nodes[e.a], b = nodes[e.b];
          let alpha = e.mutual ? 70 : 28;
          if (selected !== null && (e.a === selected || e.b === selected)) alpha = 220;
          else if (selected !== null) alpha = 12;
          p.stroke(148, 163, 184, alpha);
          p.strokeWeight(e.mutual ? 1.4 : 0.7);
          p.line(a.x, a.y, b.x, b.y);
        });

        // Nodes
        nodes.forEach((n, i) => {
          const col = n.data.trad.rgb;
          let r = 12;
          let alpha = 220;
          if (selected !== null) {
            if (i === selected) { r = 18; alpha = 255; }
            else if (selectedNeighbors && selectedNeighbors.has(i)) { r = 14; alpha = 230; }
            else { r = 9; alpha = 110; }
          }
          if (hovered === i) r += 2;
          p.noStroke();
          p.fill(col[0], col[1], col[2], alpha);
          p.ellipse(n.x, n.y, r * 2);

          if (selected === null || i === selected || (selectedNeighbors && selectedNeighbors.has(i)) || hovered === i) {
            p.fill(241, 245, 249, alpha);
            p.textAlign(p.CENTER, p.CENTER);
            p.textSize(10);
            p.text(n.data.label, n.x, n.y - r - 7);
          }
        });

        // tooltip
        if (hovered !== null) {
          const n = nodes[hovered];
          p.fill(15, 23, 42, 230);
          p.stroke(148, 163, 184, 180);
          p.strokeWeight(1);
          p.textSize(10);
          const tw = Math.min(w - 20, Math.max(220, p.textWidth(n.data.concept) + 30));
          const tx = Math.min(p.mouseX + 10, w - tw - 4);
          p.rect(tx, p.mouseY + 10, tw, 50, 4);
          p.noStroke();
          p.fill(241, 245, 249);
          p.textAlign(p.LEFT, p.TOP);
          p.textSize(11);
          p.text((n.data.num ? n.data.num + ' ' : '') + n.data.label, tx + 8, p.mouseY + 16);
          p.fill(148, 163, 184);
          p.textSize(10);
          p.text(n.data.concept, tx + 8, p.mouseY + 32, tw - 16, 14);
          p.text('Klik = výběr + odkaz', tx + 8, p.mouseY + 46);
        }
      };

      p.mouseMoved = function() {
        hovered = pick(p.mouseX, p.mouseY);
      };

      p.mousePressed = function() {
        const idx = pick(p.mouseX, p.mouseY);
        if (idx !== null) {
          selected = idx;
          dragNode = idx;
          nodes[idx].pinned = true;
          if (detail) setDetail(K, detail, nodes[idx].data, Array.from(neighborsOf(idx)).map((j) => nodes[j].data));
        } else {
          selected = null;
        }
      };

      p.mouseDragged = function() {
        if (dragNode !== null) {
          nodes[dragNode].x = p.mouseX;
          nodes[dragNode].y = p.mouseY;
        }
      };

      p.mouseReleased = function() {
        dragNode = null;
      };
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
