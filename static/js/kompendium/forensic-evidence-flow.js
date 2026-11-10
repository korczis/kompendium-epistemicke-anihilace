// Forenzní a právní tok (p5.js, animované částice mezi stádii). Stádia a jejich kapitoly
// přebírá z rejstříku oddílu forenzního a právního rozměru (nadpisy „Část N: …“ a odkazy pod
// nimi); velikost kruhu = počet kapitol, hustota částic mezi sousedními stádii = počet odkazů
// z kapitol jednoho stádia na kapitoly dalšího podle grafu knihy.
// Klik na stádium → jeho kapitoly s odkazy. Plátno zakládá komponentová vrstva (vrstva.js):
// šířka podle hostitele, výška z poměru stran; stádia se rozloží po šířce plátna a na úzkém
// plátně se kruhy zmenší. Barvy stádií jsou kategorická paleta vrstvy (sleduje téma).
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu forenzního a právního rozměru (cesta v grafu knihy).
  var SOURCE = 'kompendium/forensic-legal/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var container = document.getElementById('forensic-evidence-flow');
    var detail = document.getElementById('forensic-evidence-detail');
    if (!container || typeof window.p5 === 'undefined') return;
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
        ci: i,
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
      // Panel je tmavý (text-gray-700 dark:text-gray-300) v obou tématech: tmavá paleta.
      h.style.color = window.KompendiumVrstva.paletteFor(true)[s.ci % 16];
      detail.appendChild(h);
      if (s.group.text) detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1 text-sm', s.group.text));
      detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 mt-2 text-sm', 'Kapitoly stádia podle rejstříku (' + s.ids.length + '):'));
      detail.appendChild(K.list(s.group.nodes));
    }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm', 'Klikněte na stádium. Částice mezi stádii: ' +
        flows.map(function (f, i) { return stages[i].label + ' → ' + stages[i + 1].label + ' ' + f + ' odkazů'; }).join(' · ') + '. '));
      detail.appendChild(K.link(idx, '→ rejstřík oddílu'));
    }

    window.KompendiumVrstva.p5(container, function (p, k) {
      var particles = [];
      // Stádia leží na vodorovné ose; na úzkém plátně se kruhy zmenší, aby se nepřekrývaly.
      function slot() { return p.width / stages.length; }
      function sx(i) { return slot() * (i + 0.5); }
      function rScale() { return Math.min(1, slot() / 90); }
      function radius(s) { return (14 + 22 * Math.sqrt(s.ids.length / maxN)) * rScale(); }
      // Plátno má vlastní tmavé pozadí: tmavá paleta v obou tématech (kontrast aspoň 3:1).
      var onDark = window.KompendiumVrstva.paletteFor(true);
      function colorOf(i) { return onDark[stages[i].ci % onDark.length]; }
      // Barva textu na výplni kruhu: tmavá nebo světlá, podle toho, která má s výplní vyšší
      // kontrast (relativní jas podle WCAG 2.2).
      function lin(v) {
        v /= 255;
        return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
      }
      function inkOn(c) {
        var l = 0.2126 * lin(p.red(c)) + 0.7152 * lin(p.green(c)) + 0.0722 * lin(p.blue(c));
        var light = 0.96 / (l + 0.05);   // proti slate-100 (relativní jas ≈ 0.91)
        var dark = (l + 0.05) / 0.059;   // proti slate-900 (relativní jas ≈ 0.009)
        return dark > light ? p.color(15, 23, 42) : p.color(241, 245, 249);
      }

      p.setup = function () {
        k.canvas();
        flows.forEach(function (f, i) {
          var n = Math.round(36 * f / maxF);
          for (var j = 0; j < n; j++) {
            particles.push({ seg: i, progress: Math.random(), speed: 0.002 + Math.random() * 0.003,
              offsetY: (Math.random() - 0.5) * 30 });
          }
        });
      };

      p.draw = function () {
        p.background(15, 23, 42);
        var yMid = p.height / 2 - 20;
        var u = rScale();
        p.stroke(71, 85, 105);
        flows.forEach(function (f, i) {
          p.strokeWeight(1 + 4 * f / maxF);
          p.line(sx(i), yMid, sx(i + 1), yMid);
        });
        p.noStroke();
        particles.forEach(function (part) {
          var x = p.lerp(sx(part.seg), sx(part.seg + 1), part.progress);
          var c = p.color(colorOf(part.seg));
          c.setAlpha(200);
          p.fill(c);
          p.circle(x, yMid + part.offsetY * u, 4);
          if (p.isLooping()) {
            part.progress += part.speed;
            if (part.progress >= 1) part.progress = 0;
          }
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
          var c = p.color(colorOf(i));
          // výplň smíchaná s pozadím plátna, aby barva textu vycházela ze skutečného odstínu
          var a = highlight === i ? 230 / 255 : 170 / 255;
          var fillC = p.color(p.red(c) * a + 15 * (1 - a), p.green(c) * a + 23 * (1 - a),
            p.blue(c) * a + 42 * (1 - a));
          p.fill(fillC);
          p.circle(x, yMid, r * 2);
          p.fill(241, 245, 249);
          p.textSize(p.width < 480 ? 10 : 11);
          p.textAlign(p.CENTER, p.TOP);
          p.text(s.label, x - slot() / 2 + 2, yMid + 36 * u + 14, slot() - 4, 80);
          p.textAlign(p.CENTER, p.CENTER);
          p.textSize(10);
          p.fill(inkOn(fillC));
          p.text(String(s.ids.length), x, yMid);
        });
      };

      p.mouseClicked = function () {
        var yMid = p.height / 2 - 20;
        for (var i = 0; i < stages.length; i++) {
          var dx = p.mouseX - sx(i);
          var dy = p.mouseY - yMid;
          var r = radius(stages[i]) + 6;
          if (dx * dx + dy * dy < r * r) {
            show(i);
            // pozastavená animace: zvýraznění se přesto ukáže
            if (!p.isLooping()) p.redraw();
            break;
          }
        }
      };
    }, {
      aspect: 0.525, minHeight: 320, maxHeight: 420,
      label: 'Tok forenzního a právního rozměru: ' + stages.length + ' stádií (' +
        stages.map(function (s) { return s.label; }).join(', ') + ') jako kruhy, velikost = ' +
        'počet kapitol; částice mezi sousedními stádii = odkazy mezi jejich kapitolami.',
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
