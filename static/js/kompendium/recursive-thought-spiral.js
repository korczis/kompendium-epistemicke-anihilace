// Rekurzivní spirála myšlení — p5.js (model, ne data). Pásma hloubky rekurze nesou jména
// technik, které jmenuje text nad simulací (kódy EA / odkazy, v pořadí zmínky), s názvy
// z grafu knihy; pod plátno se přidají odkazy na jejich stránky. Plátno zakládá komponentová
// vrstva (vrstva.js): šířka podle hostitele, výška z poměru stran; poloměry spirál se škálují
// kratší stranou plátna, takže se spirála vejde i na telefon.
(function () {
  'use strict';
  if (typeof window.p5 === 'undefined') return;

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  // Techniky, na které odkazuje text nad simulací (odkazy a kódy EA-x.y.z); pod plátno
  // přidá odkazy na jejich stránky. Vrací je v pořadí zmínky.
  function techniquesNear(host) {
    return kniha().then(function (K) {
      var ts = K.contextNodes(host).map(K.technique).filter(Boolean);
      if (ts.length) {
        var p = K.h('p', 'mt-1 text-sm text-gray-500 dark:text-gray-400', 'Simulace ilustruje: ');
        ts.forEach(function (t, i) {
          if (i) p.appendChild(document.createTextNode(', '));
          p.appendChild(K.link(t.node, K.techniqueText(t)));
        });
        host.insertAdjacentElement('afterend', p);
      }
      return ts;
    }).catch(function (e) {
      if (window.console) console.warn('vizualizace knihy:', e);
      return [];
    });
  }

  var host = document.getElementById('recursive-thought-spiral');
  if (!host) return;
  // pásma 5–6 a 7–9 patří první a druhé technice z textu; dokud data nejsou, zůstávají popisná
  var named = ['Hyperreflexní pásmo', 'Rekurzivní pásmo'];
  techniquesNear(host).then(function (ts) {
    ts.slice(0, 2).forEach(function (t, i) { named[i] = t.code + ' ' + t.label; });
  });


  window.KompendiumVrstva.p5(host, function (p, k) {
    var depth = 5;            // hloubka rekurze (1–12), řídí ji svislá poloha myši
    var phase = 0;            // fáze animace
    var fragments = [];       // odtržené úlomky spirál
    var fragTimer = 0;
    var label = '';
    var TOP = 40;             // nahoře volno: pravý horní roh patří tlačítku Pozastavit z vrstvy
    // Textový pruh dole: na úzkém plátně se hloubka a pásmo píší na dva řádky.
    function bottom() { return p.width < 480 ? 90 : 64; }

    function depthLabel(d) {
      if (d <= 2) return 'Funkční reflexe';
      if (d <= 4) return 'Sebe-monitoring';
      if (d <= 6) return named[0];
      if (d <= 9) return named[1];
      return 'Metakognitivní paralýza';
    }

    // Střed a měřítko spirály v ploše mezi textovými pruhy (vejde se i na úzké plátno).
    function frame() {
      var avail = Math.max(120, p.height - TOP - bottom());
      return {
        cx: p.width / 2,
        cy: TOP + avail / 2,
        s: Math.min(1, Math.min(p.width - 16, avail) / 270),
      };
    }

    function inside() {
      return p.mouseX > 0 && p.mouseY > 0 && p.mouseX < p.width && p.mouseY < p.height;
    }

    p.setup = function () {
      k.canvas();
      p.angleMode(p.RADIANS);
      label = depthLabel(depth);
      // stopy kreslí průsvitné pozadí; první vrstva musí být plná, jinak je plátno průhledné
      p.background(15, 23, 42);
    };

    p.draw = function () {
      p.background(15, 23, 42, 25);
      phase += 0.012;

      // Svislá poloha myši → hloubka rekurze (1..12); výš = hlubší spirála
      if (inside()) {
        var norm = 1 - (p.mouseY / p.height);
        depth = Math.max(1, Math.min(12, Math.floor(norm * 12) + 1));
      }
      label = depthLabel(depth);

      var f = frame();
      var cx = f.cx;
      var cy = f.cy;
      var s = f.s;

      // Rekurzivní spirála — každá vrstva je myšlenka, která reflektuje tu předchozí
      p.noFill();
      for (var layer = 0; layer < depth; layer++) {
        var layerPhase = phase + layer * 0.8;
        var radiusBase = (20 + layer * 18) * s;
        var collapseFactor = layer > 6 ? Math.pow(0.85, layer - 6) : 1;
        var r = radiusBase * collapseFactor;

        // Barva přechází od indiga (funkční) k červené (paralýza)
        var tDeep = layer / 12;
        var rC = p.lerp(99, 239, tDeep);
        var gC = p.lerp(102, 68, tDeep);
        var bC = p.lerp(241, 68, tDeep);
        var alpha = 200 - layer * 12;

        p.stroke(rC, gC, bC, Math.max(60, alpha));
        p.strokeWeight(layer < 4 ? 2 : 1.5);

        // Dráha spirály
        p.beginShape();
        var turns = 2.5 + layer * 0.3;
        var steps = 80;
        for (var i = 0; i <= steps; i++) {
          var t = i / steps;
          var angle = t * turns * p.TWO_PI + layerPhase;
          var radius = r * t;
          var fragJitter = layer > 5 ? p.random(-2, 2) * (layer / 12) : 0;
          p.vertex(cx + Math.cos(angle) * radius + fragJitter,
            cy + Math.sin(angle) * radius + fragJitter);
        }
        p.endShape();
      }

      // Fragmentace od hloubky 7 — spirály ztrácejí úlomky
      fragTimer++;
      if (depth >= 7 && fragTimer > Math.max(2, 10 - depth)) {
        fragTimer = 0;
        var a = p.random(p.TWO_PI);
        var fr = (40 + p.random(80)) * s;
        fragments.push({
          x: cx + Math.cos(a) * fr,
          y: cy + Math.sin(a) * fr,
          vx: Math.cos(a) * (1 + (depth - 6) * 0.5) * s,
          vy: Math.sin(a) * (1 + (depth - 6) * 0.5) * s,
          life: 100,
          size: 3 + p.random(4),
        });
        if (fragments.length > 200) fragments.shift();
      }

      // Vykreslení a posun úlomků
      fragments.forEach(function (fg) {
        fg.x += fg.vx;
        fg.y += fg.vy;
        fg.life -= 1;
        p.noStroke();
        p.fill(239, 68, 68, (fg.life / 100) * 220);
        p.ellipse(fg.x, fg.y, fg.size, fg.size);
      });
      fragments = fragments.filter(function (fg) {
        return fg.life > 0 && fg.x > 0 && fg.x < p.width && fg.y > 0 && fg.y < p.height;
      });

      // Střed „já“ — s hloubkou se rozpadá
      var deep = depth >= 9;
      var eyeSize = deep ? 4 + p.random(-2, 2) : 8;
      p.noStroke();
      if (deep) p.fill(239, 68, 68); else p.fill(99, 102, 241);
      p.ellipse(cx, cy, eyeSize, eyeSize);

      // Textový pruh dole kreslí plné pozadí, aby stopy spirál nesnižovaly kontrast textu
      var B = bottom();
      var y0 = p.height - B;
      p.noStroke();
      p.fill(15, 23, 42);
      p.rect(0, y0 + 4, p.width, B - 4);
      p.textAlign(p.LEFT, p.BASELINE);
      p.fill(241, 245, 249);
      var narrow = p.width < 480;
      p.textSize(narrow ? 12 : 14);
      var y = y0 + 20;
      if (narrow) {
        p.text('Hloubka rekurze: ' + depth + '/12', 16, y);
        p.text(label, 16, y += 15);
      } else {
        p.text('Hloubka rekurze: ' + depth + '/12 — ' + label, 16, y);
      }
      p.fill(148, 163, 184);
      p.textSize(11);
      p.text('Pohni myší vertikálně (nahoru = hlubší rekurze)', 16, y += 16);

      // Varování při extrémní hloubce
      if (depth >= 10) {
        p.fill(248, 113, 113);
        p.textSize(narrow ? 11 : 12);
        p.text('⚠ paralýza — myšlení reflektuje samo sebe bez ukotvení', 16, y += 18);
      }
    };

    // Pozastavená animace: pohyb myši nad plátnem přesto ukáže zvolenou hloubku.
    p.mouseMoved = function () {
      if (!p.isLooping() && inside()) p.redraw();
    };

    // Nová velikost plátna: úlomky staré geometrie zmizí, pozadí se vykreslí znovu celé.
    p.resized = function () {
      fragments = [];
      p.background(15, 23, 42);
    };
  }, {
    aspect: 0.625, minHeight: 340, maxHeight: 500,
    label: 'Simulace rekurzivní spirály myšlení: svislá poloha ukazatele řídí hloubku rekurze ' +
      'od 1 do 12; s rostoucí hloubkou se spirálové dráhy trhají a střed se rozpadá.',
  });
})();
