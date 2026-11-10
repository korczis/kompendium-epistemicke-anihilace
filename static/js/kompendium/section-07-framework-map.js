// Kapitola 7 — mapa teoretických rámců (p5.js, silový layout). Uzly = stránky kapitoly, ve
// které graf leží (z grafu knihy; číslo, autor a téma z názvu stránky), barva = tradice podle
// přehledové stránky kapitoly „Filozofické tradice“ (nadpis a odkazy pod ním; stránky, které
// přehled nezařazuje, jsou šedé), hrany = odkazy mezi stránkami v knize. Hrana tedy není
// tvrzení o vlivu, jen „kniha mezi kapitolami odkazuje“ (oběma směry = silnější čára).
// Klik na uzel → kapitola, tradice, sousedé a odkaz na stránku. Plátno zakládá komponentová
// vrstva (vrstva.js): šířka podle hostitele, výška z poměru stran; délky layoutu se škálují
// kratší stranou plátna, při změně velikosti se uzly přeškálují.
(function() {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

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
      // Plátno má vlastní tmavé pozadí: tmavá paleta v obou tématech (kontrast aspoň 3:1).
      var onDark = window.KompendiumVrstva.paletteFor(true);
      var traditions = groups.map(function (g, i) {
        var t = { label: g.title, rgb: hexRgb(onDark[i % onDark.length]), count: g.nodes.length };
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
    if (!host || typeof window.p5 === 'undefined') return;
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

    window.KompendiumVrstva.p5(host, function(p, k) {
      let w = 0, h = 0;          // velikost plátna; nastaví ji setup a resized
      const nodes = [];
      const edges = [];
      let hovered = null;
      let selected = null;
      let dragNode = null;

      // Délky silového layoutu se škálují kratší stranou plátna (600 px = původní návrh).
      function unit() { return Math.min(w, h) / 600; }

      p.setup = function() {
        k.canvas();
        w = p.width; h = p.height;

        // Počáteční polohy deterministicky (bez Math.random, stejné po každém načtení)
        const R = Math.min(w, h) * 0.37;
        PHILOSOPHERS.forEach((ph, i) => {
          const a = (i / PHILOSOPHERS.length) * Math.PI * 2;
          nodes.push({
            data: ph,
            x: w / 2 + Math.cos(a) * R,
            y: h / 2 + Math.sin(a) * R,
            vx: 0, vy: 0,
            pinned: false
          });
        });

        const idx = {};
        nodes.forEach((n, i) => { idx[n.data.id] = i; });
        M.edges.forEach((e) => { edges.push({ a: idx[e.a], b: idx[e.b], mutual: e.mutual }); });
        // Bez animace (prefers-reduced-motion) se ukáže rovnou usazený layout.
        if (window.KompendiumVrstva.reducedMotion()) for (let s = 0; s < 300; s++) step();
      };

      // Nová velikost plátna (řídí ji vrstva): uzly se přeškálují do nové plochy.
      p.resized = function(nw, nh) {
        nodes.forEach((n) => { n.x *= nw / w; n.y *= nh / h; });
        w = nw; h = nh;
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
        const u = unit();
        // Repulsion
        for (let i = 0; i < nodes.length; i++) {
          for (let j = i + 1; j < nodes.length; j++) {
            const dx = nodes[j].x - nodes[i].x;
            const dy = nodes[j].y - nodes[i].y;
            const d2 = Math.max(64, dx * dx + dy * dy);
            const f = 1500 * u * u / d2;
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
          const target = 110 * u;
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
          // meze; nahoře místo pro popisek a tlačítko Pozastavit z vrstvy
          n.x = Math.max(20, Math.min(w - 20, n.x));
          n.y = Math.max(44, Math.min(h - 20, n.y));
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
        if (dragNode === null && p.isLooping()) step();

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
          const tx = Math.max(4, Math.min(p.mouseX + 10, w - tw - 4));
          const ty = Math.min(p.mouseY, h - 64);
          p.rect(tx, ty + 10, tw, 50, 4);
          p.noStroke();
          p.fill(241, 245, 249);
          p.textAlign(p.LEFT, p.TOP);
          p.textSize(11);
          p.text((n.data.num ? n.data.num + ' ' : '') + n.data.label, tx + 8, ty + 16);
          p.fill(148, 163, 184);
          p.textSize(10);
          p.text(n.data.concept, tx + 8, ty + 32, tw - 16, 14);
          p.text('Klik = výběr + odkaz', tx + 8, ty + 46);
        }
      };

      // Pozastavená animace: najetí, výběr a tažení se přesto překreslí.
      function redrawIfPaused() { if (!p.isLooping()) p.redraw(); }

      p.mouseMoved = function() {
        const before = hovered;
        hovered = pick(p.mouseX, p.mouseY);
        if (hovered !== null || before !== null) redrawIfPaused();
      };

      p.mousePressed = function() {
        const idx = pick(p.mouseX, p.mouseY);
        if (idx !== null) {
          selected = idx;
          dragNode = idx;
          nodes[idx].pinned = true;
          if (detail) setDetail(K, detail, nodes[idx].data, Array.from(neighborsOf(idx)).map((j) => nodes[j].data));
          redrawIfPaused();
        } else if (selected !== null) {
          selected = null;
          redrawIfPaused();
        }
      };

      p.mouseDragged = function() {
        if (dragNode !== null) {
          nodes[dragNode].x = Math.max(20, Math.min(w - 20, p.mouseX));
          nodes[dragNode].y = Math.max(44, Math.min(h - 20, p.mouseY));
          redrawIfPaused();
        }
      };

      p.mouseReleased = function() {
        dragNode = null;
      };
    }, {
      aspect: 0.75, minHeight: 480, maxHeight: 600,
      label: 'Mapa teoretických rámců: ' + PHILOSOPHERS.length + ' kapitol sekce jako uzly ' +
        'obarvené podle filozofické tradice, ' + M.edges.length + ' hran jsou odkazy mezi ' +
        'kapitolami v knize (silnější čára = odkazy oběma směry).',
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
