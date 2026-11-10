// p5.js — simulace narušení pozornosti (model, ne data). Technika, kterou ilustruje, se bere
// z textu nad simulací (odkaz nebo kód EA) přes graf knihy; její kód a název simulace vypíše
// a pod plátno přidá odkaz na její stránku. Plátno zakládá komponentová vrstva (vrstva.js):
// šířka podle hostitele, výška z poměru stran, pozastavení a popisek; simulace kreslí
// v p.width × p.height, takže se na telefonu jen zúží.
(function () {
  'use strict';
  if (typeof window.p5 === 'undefined') return;

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var V = window.KompendiumVrstva;
  var kniha = V.kniha;

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

  var host = document.getElementById('attention-disruption');
  if (!host) return;
  var subject = '';
  techniquesNear(host).then(function (ts) {
    if (ts[0]) subject = ts[0].code + ' ' + ts[0].label;
  });

  V.p5(host, function (p, k) {
    var stream = [];
    var captured = 0;
    var missed = 0;
    var rate = 1.0;

    p.setup = function () {
      k.canvas();
      var slider = document.getElementById('attention-rate');
      if (slider && !slider.labels.length && !slider.hasAttribute('aria-label')) {
        slider.setAttribute('aria-label', 'Rychlost narušování pozornosti');
      }
      if (slider) {
        slider.addEventListener('input', function (e) { rate = parseFloat(e.target.value); });
      }
    };

    p.draw = function () {
      // vlastní tmavé pozadí plátna; texty na něm drží kontrast aspoň 4.5:1
      p.background(15, 23, 42);
      if (p.random() < rate * 0.1) {
        stream.push({ x: 0, y: p.random(50, Math.max(51, p.height - 50)), captured: false });
      }
      // Počítadlo vlevo dole: pravý horní roh patří tlačítku Pozastavit z vrstvy.
      p.noStroke();
      p.fill(241, 245, 249);
      p.textSize(p.width < 480 ? 12 : 14);
      p.text('Tempo: ' + rate.toFixed(1) + ' | Zachyceno: ' + captured + ' | Uniklo: ' + missed,
        16, p.height - (subject ? 30 : 14));
      if (subject) {
        p.fill(148, 163, 184);
        p.textSize(11);
        p.text(subject, 16, p.height - 12);
      }
      // „okno“ pozornosti sleduje myš
      var ax = p.mouseX, ay = p.mouseY;
      p.noFill();
      p.stroke(99, 102, 241, 200);
      p.strokeWeight(2);
      p.ellipse(ax, ay, 80, 80);
      // částice proudu informací
      p.noStroke();
      stream = stream.filter(function (s) {
        s.x += 3 + rate;
        var inWindow = p.dist(s.x, s.y, ax, ay) < 40;
        if (inWindow && !s.captured) { s.captured = true; captured++; }
        if (s.x > p.width) {
          if (!s.captured) missed++;
          return false;
        }
        p.fill(s.captured ? [16, 185, 129] : [148, 163, 184], 220);
        p.ellipse(s.x, s.y, 8, 8);
        return true;
      });
    };

    // Nová výška plátna: částice pod spodním okrajem se vrátí do proudu.
    p.resized = function (w, h) {
      stream.forEach(function (s) { s.y = Math.min(s.y, Math.max(51, h - 50)); });
    };
  }, {
    aspect: 0.5, minHeight: 260, maxHeight: 400,
    label: 'Simulace narušení pozornosti: kruh, který sleduje ukazatel, zachycuje body ' +
      'proudu informací; počítadlo ukazuje tempo proudu a počet zachycených a uniklých bodů.',
  });
})();
