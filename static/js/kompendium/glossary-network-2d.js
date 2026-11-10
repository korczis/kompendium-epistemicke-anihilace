// Síť nejodkazovanějších pojmů glosáře (p5.js, silový layout). Uzly = TOP stránek glosáře
// s nejvíce odkazy z celé knihy (graf knihy: in), hrany = odkazy mezi nimi v knize.
// Klik na uzel → zvýraznění sousedů, počty odkazů a odkazy na stránky pojmů. Plátno zakládá
// komponentová vrstva (vrstva.js): šířka podle hostitele, výška z poměru stran; délky
// layoutu se škálují kratší stranou plátna, při změně velikosti se uzly přeškálují.
(function () {
  'use strict';
  // Zdroj dat: oddíl glosáře v grafu knihy; TOP je zobrazovací mez, ne data.
  var SECTION = 'glossary';
  var TOP = 50;
  if (typeof window.p5 === 'undefined') return;
  var host = document.getElementById('glossary-network');
  var detail = document.getElementById('glossary-network-detail');
  if (!host || !detail) return;

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  kniha().then(function (K) {
    var TERMS = K.pagesOf(SECTION).sort(function (a, b) { return b.in - a.in || a.title.localeCompare(b.title, 'cs'); }).slice(0, TOP);
    var EDGES = K.edgesAmong(TERMS.map(function (n) { return n.id; })).map(function (e) { return [e.a, e.b]; });
    var byId = {};
    TERMS.forEach(function (n) { byId[n.id] = n; });

    function show(n, nbIds) {
      K.clear(detail);
      detail.appendChild(K.h('h4', 'font-bold text-lg mb-2', n.title));
      detail.appendChild(K.h('p', 'text-sm text-gray-500 dark:text-gray-400', 'Odkazuje sem ' + n.in + ' stránek knihy; ' + nbIds.length +
        ' sousedů mezi ' + TERMS.length + ' nejodkazovanějšími pojmy:'));
      detail.appendChild(K.list(nbIds.map(function (id) { return byId[id]; })));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(n, '→ stránka pojmu'));
      detail.appendChild(p);
    }

    window.KompendiumVrstva.p5(host, function (p, k) {
      var nodes = [];
      var byNode = {};          // uzly podle id (pro hrany)
      var sel = null;
      var lastW = 0, lastH = 0;
      // Délky silového layoutu se škálují kratší stranou plátna (600 px = původní návrh).
      function unit() { return Math.min(p.width, p.height) / 600; }

      p.setup = function () {
        k.canvas();
        var W = p.width, H = p.height, R = Math.min(W, H) * 0.35;
        TERMS.forEach(function (t, i) {
          var a = i / TERMS.length * Math.PI * 2;
          nodes.push({ id: t.id, label: t.title, x: W / 2 + Math.cos(a) * R,
            y: H / 2 + Math.sin(a) * R, vx: 0, vy: 0 });
        });
        nodes.forEach(function (n) { byNode[n.id] = n; });
        lastW = W; lastH = H;
        // Bez animace (prefers-reduced-motion) se ukáže rovnou usazený layout.
        if (window.KompendiumVrstva.reducedMotion()) for (var s = 0; s < 300; s++) step();
      };

      function adj(id) {
        var s = {};
        EDGES.forEach(function (e) { if (e[0] === id) s[e[1]] = 1; if (e[1] === id) s[e[0]] = 1; });
        return s;
      }

      // Jeden krok silového layoutu (Fruchterman–Reingold: odpuzování, pružiny hran, střed).
      function step() {
        var W = p.width, H = p.height, u = unit();
        for (var i = 0; i < nodes.length; i++) {
          for (var j = i + 1; j < nodes.length; j++) {
            var a = nodes[i], b = nodes[j];
            var dx = b.x - a.x, dy = b.y - a.y, d = Math.sqrt(dx * dx + dy * dy) + 0.1;
            var f = 800 * u * u / (d * d);
            a.vx -= dx / d * f; a.vy -= dy / d * f;
            b.vx += dx / d * f; b.vy += dy / d * f;
          }
        }
        EDGES.forEach(function (e) {
          var a = byNode[e[0]], b = byNode[e[1]];
          if (!a || !b) return;
          var dx = b.x - a.x, dy = b.y - a.y, d = Math.sqrt(dx * dx + dy * dy) + 0.1;
          var f = (d - 80 * u) * 0.02;
          a.vx += dx / d * f; a.vy += dy / d * f;
          b.vx -= dx / d * f; b.vy -= dy / d * f;
        });
        nodes.forEach(function (n) {
          n.vx += (W / 2 - n.x) * 0.001; n.vy += (H / 2 - n.y) * 0.001;
          n.vx *= 0.85; n.vy *= 0.85;
          n.x += n.vx; n.y += n.vy;
          n.x = Math.max(20, Math.min(W - 20, n.x));
          // nahoře místo pro popisek a tlačítko Pozastavit z vrstvy
          n.y = Math.max(44, Math.min(H - 20, n.y));
        });
      }

      p.draw = function () {
        p.background(15, 23, 42);
        if (p.isLooping()) step();

        var hi = sel ? adj(sel.id) : null;

        // Hrany
        EDGES.forEach(function (e) {
          var a = byNode[e[0]], b = byNode[e[1]];
          if (!a || !b) return;
          if (sel && (e[0] === sel.id || e[1] === sel.id)) p.stroke(251, 191, 36, 200);
          else p.stroke(71, 85, 105, 80);
          p.line(a.x, a.y, b.x, b.y);
        });

        // Uzly; popisky světlé na tmavém pozadí plátna (kontrast > 4.5:1)
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
          // pozastavená animace: výběr se přesto ukáže
          if (!p.isLooping()) p.redraw();
        }
      };

      // Nová velikost plátna (řídí ji vrstva): uzly se přeškálují do nové plochy.
      p.resized = function (w, h) {
        if (lastW && lastH) {
          nodes.forEach(function (n) { n.x *= w / lastW; n.y *= h / lastH; });
        }
        lastW = w; lastH = h;
      };
    }, {
      aspect: 0.75, minHeight: 380, maxHeight: 600,
      label: 'Síť ' + TERMS.length + ' nejodkazovanějších pojmů glosáře: uzly jsou pojmy, ' +
        EDGES.length + ' hran jsou odkazy mezi jejich stránkami v knize; vybraný pojem ' +
        'zvýrazní své sousedy.',
    });
    K.clear(detail);
    detail.appendChild(K.h('p', null, TERMS.length + ' nejodkazovanějších pojmů glosáře a ' + EDGES.length +
      ' vazeb podle odkazů v knize. Klikněte na uzel pro zvýraznění sousedů.'));
  }).catch(function (e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    detail.textContent = 'Data knihy se nepodařilo načíst.';
  });
})();
