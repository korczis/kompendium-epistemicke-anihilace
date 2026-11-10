// Forenzní a právní tok (p5.js, animované částice mezi stádii). Stádia a jejich kapitoly
// přebírá z rejstříku oddílu forenzního a právního rozměru (nadpisy „Část N: …“ a odkazy pod
// nimi); velikost kruhu = počet kapitol, hustota částic mezi sousedními stádii = počet odkazů
// z kapitol jednoho stádia na kapitoly dalšího podle grafu knihy.
// Klik na stádium → jeho kapitoly s odkazy.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: rejstřík oddílu forenzního a právního rozměru (cesta v grafu knihy).
  var SOURCE = 'kompendium/forensic-legal/_index.md';

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

  function init() {
    var container = document.getElementById('forensic-evidence-flow');
    var detail = document.getElementById('forensic-evidence-detail');
    if (!container || typeof p5 === 'undefined') return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, container, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, container, detail) {
    var stages = groups.map(function (gr, i) {
      return {
        group: gr,
        label: gr.title.replace(/^[^:]*:\s*/, '').replace(/\s*\(.*\)\s*$/, ''),
        ids: gr.nodes.map(function (n) { return n.id; }),
        color: K.V.PALETTE[i % K.V.PALETTE.length],
      };
    });
    var flows = stages.slice(0, -1).map(function (s, i) { return K.linksFrom(s.ids, stages[i + 1].ids); });
    var maxF = Math.max.apply(null, flows.concat([1]));
    var maxN = Math.max.apply(null, stages.map(function (s) { return s.ids.length; }).concat([1]));
    var highlight = null;

    function show(i) {
      highlight = i;
      if (!detail) return;
      var s = stages[i];
      K.clear(detail);
      var h = K.h('h3', 'text-lg font-bold', s.group.title);
      h.style.color = s.color;
      detail.appendChild(h);
      if (s.group.text) detail.appendChild(K.h('p', 'text-slate-300 mt-1 text-sm', s.group.text));
      detail.appendChild(K.h('p', 'text-slate-400 mt-2 text-sm', 'Kapitoly stádia podle rejstříku (' + s.ids.length + '):'));
      detail.appendChild(K.list(s.group.nodes));
    }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', 'Klikněte na stádium. Částice mezi stádii: ' +
        flows.map(function (f, i) { return stages[i].label + ' → ' + stages[i + 1].label + ' ' + f + ' odkazů'; }).join(' · ') + '. '));
      detail.appendChild(K.link(idx, '→ rejstřík oddílu'));
    }

    new p5(function (p) {
      var W;
      var H = 420;
      var particles = [];
      function sx(i) { return W * (i + 0.5) / stages.length; }
      function radius(s) { return 14 + 22 * Math.sqrt(s.ids.length / maxN); }

      p.setup = function () {
        W = container.clientWidth || 800;
        p.createCanvas(W, H).parent(container);
        flows.forEach(function (f, i) {
          var n = Math.round(36 * f / maxF);
          for (var k = 0; k < n; k++) {
            particles.push({ seg: i, progress: Math.random(), speed: 0.002 + Math.random() * 0.003, offsetY: (Math.random() - 0.5) * 30 });
          }
        });
      };

      p.draw = function () {
        p.background(15, 23, 42);
        var yMid = H / 2;
        p.stroke(71, 85, 105);
        flows.forEach(function (f, i) {
          p.strokeWeight(1 + 4 * f / maxF);
          p.line(sx(i), yMid, sx(i + 1), yMid);
        });
        p.noStroke();
        particles.forEach(function (part) {
          var x = p.lerp(sx(part.seg), sx(part.seg + 1), part.progress);
          var c = p.color(stages[part.seg].color);
          c.setAlpha(200);
          p.fill(c);
          p.circle(x, yMid + part.offsetY, 4);
          part.progress += part.speed;
          if (part.progress >= 1) part.progress = 0;
        });
        p.textAlign(p.CENTER);
        flows.forEach(function (f, i) {
          p.fill(148, 163, 184);
          p.textSize(10);
          p.text(f + ' odk.', (sx(i) + sx(i + 1)) / 2, yMid - 26);
        });
        stages.forEach(function (s, i) {
          var x = sx(i);
          var r = radius(s) + (highlight === i ? 6 : 0);
          var c = p.color(s.color);
          c.setAlpha(highlight === i ? 230 : 170);
          p.fill(c);
          p.circle(x, yMid, r * 2);
          p.fill(241, 245, 249);
          p.textSize(11);
          p.textAlign(p.CENTER, p.TOP);
          p.text(s.label, x - W / stages.length / 2 + 4, yMid + 46, W / stages.length - 8, 60);
          p.textAlign(p.CENTER, p.CENTER);
          p.textSize(10);
          p.text(String(s.ids.length), x, yMid);
        });
      };

      p.mouseClicked = function () {
        var yMid = H / 2;
        for (var i = 0; i < stages.length; i++) {
          var dx = p.mouseX - sx(i);
          var dy = p.mouseY - yMid;
          var r = radius(stages[i]) + 6;
          if (dx * dx + dy * dy < r * r) { show(i); break; }
        }
      };
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
