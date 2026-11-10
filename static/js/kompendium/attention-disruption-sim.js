// p5.js — simulace narušení pozornosti (model, ne data). Technika, kterou ilustruje, se bere
// z textu nad simulací (odkaz nebo kód EA) přes graf knihy; její kód a název simulace vypíše
// a pod plátno přidá odkaz na její stránku.
(function () {
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

  // Techniky, na které odkazuje text nad simulací (odkazy a kódy EA-x.y.z); pod plátno
  // přidá odkazy na jejich stránky. Vrací je v pořadí zmínky.
  function techniquesNear(host) {
    return kniha().then(function (K) {
      var ts = K.contextNodes(host).map(K.technique).filter(Boolean);
      if (ts.length) {
        var p = K.h('p', 'mt-1 text-sm text-slate-400', 'Simulace ilustruje: ');
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
  var subject = '';
  if (host) techniquesNear(host).then(function (ts) { if (ts[0]) subject = ts[0].code + ' ' + ts[0].label; });

new p5((p) => {
  let stream = [];
  let captured = 0;
  let missed = 0;
  let rate = 1.0;
  p.setup = function() {
    const c = p.createCanvas(host ? Math.min(800, host.clientWidth || 800) : 800, 400);
    const target = document.getElementById('attention-disruption');
    if (target) c.parent('attention-disruption');
    const slider = document.getElementById('attention-rate');
    if (slider && !slider.labels.length && !slider.hasAttribute('aria-label')) slider.setAttribute('aria-label', 'Rychlost narušování pozornosti');
    if (slider) slider.addEventListener('input', (e) => { rate = parseFloat(e.target.value); });
  };
  p.draw = function() {
    p.background(15, 23, 42);
    if (p.random() < rate * 0.1) {
      stream.push({ x: 0, y: p.random(50, p.height - 50), captured: false });
    }
    p.noStroke();
    p.fill(241, 245, 249);
    p.textSize(14);
    p.text(`Tempo: ${rate.toFixed(1)} | Zachyceno: ${captured} | Uniklo: ${missed}`, 16, 24);
    if (subject) {
      p.fill(148, 163, 184);
      p.textSize(11);
      p.text(subject, 16, 42);
    }
    // attention "window" follows mouse
    const ax = p.mouseX, ay = p.mouseY;
    p.noFill();
    p.stroke(99, 102, 241, 200);
    p.strokeWeight(2);
    p.ellipse(ax, ay, 80, 80);
    // particles
    p.noStroke();
    stream = stream.filter((s) => {
      s.x += 3 + rate;
      const inWindow = p.dist(s.x, s.y, ax, ay) < 40;
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
}, 'attention-disruption');
})();
