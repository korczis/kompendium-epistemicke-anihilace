// p5.js — simulace epistemické dezintegrace (model, ne data knihy). Částice = přesvědčení.
// Nic z knihy nezobrazuje (žádné kódy, počty ani odkazy), proto nic neodvozuje. Plátno zakládá
// komponentová vrstva (vrstva.js): šířka podle hostitele, výška z poměru stran; při změně
// velikosti se částice i jejich kotvy přepočítají poměrně k nové ploše.
(function () {
  'use strict';
  if (typeof window.p5 === 'undefined') return;
  var host = document.getElementById('epistemic-disintegration');
  if (!host) return;

  // stable -> perturbed -> fragmented -> reconstructed; na plátně česky
  var PHASE_LABEL = {
    stable: 'stabilní', perturbed: 'narušená', fragmented: 'fragmentovaná',
    reconstructed: 'obnovená',
  };

  window.KompendiumVrstva.p5(host, function (p, k) {
    var particles = [];
    var intensity = 0.3;
    var phase = 'stable';
    var phaseTimer = 0;
    var lastW = 0, lastH = 0;

    p.setup = function () {
      k.canvas();
      lastW = p.width; lastH = p.height;
      for (var i = 0; i < 80; i++) {
        particles.push({
          x: p.random(p.width), y: p.random(p.height), vx: 0, vy: 0,
          anchor: p.createVector(p.random(p.width), p.random(p.height)),
        });
      }
      // stopy kreslí průsvitné pozadí; první vrstva musí být plná, jinak je plátno průhledné
      p.background(15, 23, 42);
      var slider = document.getElementById('disintegration-intensity');
      if (slider && !slider.labels.length && !slider.hasAttribute('aria-label')) {
        slider.setAttribute('aria-label', 'Intenzita dezintegrace');
      }
      if (slider) {
        slider.addEventListener('input', function (e) { intensity = parseFloat(e.target.value); });
      }
    };

    p.draw = function () {
      p.background(15, 23, 42, 30);
      phaseTimer++;
      if (phaseTimer > 200) {
        phaseTimer = 0;
        phase = phase === 'stable' ? 'perturbed' : phase === 'perturbed' ? 'fragmented'
          : phase === 'fragmented' ? 'reconstructed' : 'stable';
      }
      // Text vlevo dole (pravý horní roh patří tlačítku Pozastavit z vrstvy) na plném
      // podkladu, aby stopy částic nesnižovaly jeho kontrast.
      p.noStroke();
      p.fill(15, 23, 42);
      p.rect(0, p.height - 32, Math.min(p.width, 300), 32);
      p.fill(241, 245, 249);
      p.textSize(14);
      p.text('Fáze: ' + PHASE_LABEL[phase] + ' | intenzita: ' + intensity.toFixed(2),
        16, p.height - 12);

      particles.forEach(function (part) {
        // přitažlivost ke kotvě (stabilní struktura přesvědčení)
        var dx = part.anchor.x - part.x;
        var dy = part.anchor.y - part.y;
        part.vx += dx * 0.005;
        part.vy += dy * 0.005;
        // tlumení
        part.vx *= 0.92;
        part.vy *= 0.92;
        // vychylování manipulačním tlakem
        if (phase === 'perturbed' || phase === 'fragmented') {
          part.vx += p.random(-1, 1) * intensity * 2;
          part.vy += p.random(-1, 1) * intensity * 2;
        }
        if (phase === 'fragmented') {
          // kotvy se rozjíždějí
          part.anchor.x += p.random(-0.5, 0.5);
          part.anchor.y += p.random(-0.5, 0.5);
        }
        part.x += part.vx;
        part.y += part.vy;
        var col = phase === 'stable' ? [99, 102, 241] : phase === 'perturbed' ? [245, 158, 11]
          : phase === 'fragmented' ? [239, 68, 68] : [16, 185, 129];
        p.fill(col[0], col[1], col[2], 200);
        p.ellipse(part.x, part.y, 6, 6);
      });
      // hrany mezi blízkými částicemi (vztahy mezi přesvědčeními)
      p.stroke(148, 163, 184, 30);
      for (var i = 0; i < particles.length; i++) {
        for (var j = i + 1; j < particles.length; j++) {
          var d = p.dist(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
          if (d < 50) p.line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        }
      }
    };

    // Nová velikost plátna: částice a kotvy se přeškálují, pozadí se vykreslí znovu celé.
    p.resized = function (w, h) {
      var sx = lastW ? w / lastW : 1, sy = lastH ? h / lastH : 1;
      particles.forEach(function (part) {
        part.x *= sx; part.y *= sy;
        part.anchor.x *= sx; part.anchor.y *= sy;
      });
      lastW = w; lastH = h;
      p.background(15, 23, 42);
    };
  }, {
    aspect: 0.625, minHeight: 280, maxHeight: 500,
    label: 'Simulace epistemické dezintegrace: částice představují přesvědčení, čáry vztahy ' +
      'mezi nimi; struktura cyklicky prochází fázemi stabilní, narušená, fragmentovaná ' +
      'a obnovená.',
  });
})();
