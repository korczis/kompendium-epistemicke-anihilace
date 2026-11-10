// Síť nejodkazovanějších pojmů glosáře (p5.js, silový layout). Uzly = TOP stránek glosáře
// s nejvíce odkazy z celé knihy (graf knihy: in), hrany = odkazy mezi nimi v knize.
// Klik na uzel → zvýraznění sousedů, počty odkazů a odkazy na stránky pojmů.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: oddíl glosáře v grafu knihy; TOP je zobrazovací mez, ne data.
  var SECTION = 'glossary';
  var TOP = 50;
  if (typeof p5 === 'undefined') return;
  var host = document.getElementById('glossary-network');
  var detail = document.getElementById('glossary-network-detail');
  if (!host || !detail) return;

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

  kniha().then(function (K) {
    var TERMS = K.pagesOf(SECTION).sort(function (a, b) { return b.in - a.in || a.title.localeCompare(b.title, 'cs'); }).slice(0, TOP);
    var EDGES = K.edgesAmong(TERMS.map(function (n) { return n.id; })).map(function (e) { return [e.a, e.b]; });
    var byId = {};
    TERMS.forEach(function (n) { byId[n.id] = n; });

    function show(n, nbIds) {
      K.clear(detail);
      detail.appendChild(K.h('h4', 'font-bold text-lg mb-2', n.title));
      detail.appendChild(K.h('p', 'text-sm text-slate-400', 'Odkazuje sem ' + n.in + ' stránek knihy; ' + nbIds.length +
        ' sousedů mezi ' + TERMS.length + ' nejodkazovanějšími pojmy:'));
      detail.appendChild(K.list(nbIds.map(function (id) { return byId[id]; })));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(n, '→ stránka pojmu'));
      detail.appendChild(p);
    }

    var sketch = function (p) {
      var nodes = [], W = 0, H = 600;
      var sel = null;

      p.setup = function () {
        W = host.clientWidth || 800;
        var cnv = p.createCanvas(W, H);
        cnv.parent(host);
        TERMS.forEach(function (t, i) {
          nodes.push({ id: t.id, label: t.title, x: W / 2 + Math.cos(i / TERMS.length * Math.PI * 2) * 200, y: H / 2 + Math.sin(i / TERMS.length * Math.PI * 2) * 200, vx: 0, vy: 0 });
        });
      };

      function adj(id) {
        var s = {};
        EDGES.forEach(function (e) { if (e[0] === id) s[e[1]] = 1; if (e[1] === id) s[e[0]] = 1; });
        return s;
      }

      p.draw = function () {
        p.background(15, 23, 42);

        // Force layout
        for (var i = 0; i < nodes.length; i++) {
          for (var j = i + 1; j < nodes.length; j++) {
            var a = nodes[i], b = nodes[j];
            var dx = b.x - a.x, dy = b.y - a.y, d = Math.sqrt(dx * dx + dy * dy) + 0.1;
            var f = 800 / (d * d);
            a.vx -= dx / d * f; a.vy -= dy / d * f;
            b.vx += dx / d * f; b.vy += dy / d * f;
          }
        }
        EDGES.forEach(function (e) {
          var a = nodes.find(function (n) { return n.id === e[0]; });
          var b = nodes.find(function (n) { return n.id === e[1]; });
          if (!a || !b) return;
          var dx = b.x - a.x, dy = b.y - a.y, d = Math.sqrt(dx * dx + dy * dy) + 0.1;
          var f = (d - 80) * 0.02;
          a.vx += dx / d * f; a.vy += dy / d * f;
          b.vx -= dx / d * f; b.vy -= dy / d * f;
        });
        nodes.forEach(function (n) {
          n.vx += (W / 2 - n.x) * 0.001; n.vy += (H / 2 - n.y) * 0.001;
          n.vx *= 0.85; n.vy *= 0.85;
          n.x += n.vx; n.y += n.vy;
          n.x = Math.max(20, Math.min(W - 20, n.x));
          n.y = Math.max(20, Math.min(H - 20, n.y));
        });

        var hi = sel ? adj(sel.id) : null;

        // Edges
        EDGES.forEach(function (e) {
          var a = nodes.find(function (n) { return n.id === e[0]; });
          var b = nodes.find(function (n) { return n.id === e[1]; });
          if (!a || !b) return;
          if (sel && (e[0] === sel.id || e[1] === sel.id)) p.stroke(251, 191, 36, 200);
          else p.stroke(71, 85, 105, 80);
          p.line(a.x, a.y, b.x, b.y);
        });

        // Nodes
        nodes.forEach(function (n) {
          var on = !sel || n.id === sel.id || (hi && hi[n.id]);
          p.noStroke();
          p.fill(on ? p.color(59, 130, 246) : p.color(71, 85, 105, 120));
          p.circle(n.x, n.y, on ? 14 : 8);
          if (on) {
            p.fill(226, 232, 240);
            p.textSize(10);
            p.textAlign(p.CENTER);
            p.text(n.label, n.x, n.y - 12);
          }
        });
      };

      p.mousePressed = function () {
        var hit = null, mind = 1e9;
        nodes.forEach(function (n) {
          var d = p.dist(p.mouseX, p.mouseY, n.x, n.y);
          if (d < 18 && d < mind) { mind = d; hit = n; }
        });
        if (hit) {
          sel = hit;
          show(byId[hit.id], Object.keys(adj(hit.id)).map(Number));
        }
      };

      p.windowResized = function () {
        W = host.clientWidth || 800;
        p.resizeCanvas(W, H);
      };
    };

    new p5(sketch);
    K.clear(detail);
    detail.appendChild(K.h('p', null, TERMS.length + ' nejodkazovanějších pojmů glosáře a ' + EDGES.length +
      ' vazeb podle odkazů v knize. Klikněte na uzel pro zvýraznění sousedů.'));
  }).catch(function (e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    detail.textContent = 'Data knihy se nepodařilo načíst.';
  });
})();
