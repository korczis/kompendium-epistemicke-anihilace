// Generativní grafika kompendia (p5.js, instance mode).
// Každý prvek <div data-p5="nazev"> dostane vlastní skicu. Barvy sledují světlý/tmavý režim,
// při prefers-reduced-motion se vykreslí jeden statický snímek.
(function () {
  'use strict';

  var INDIGO = ['#312e81', '#3730a3', '#4338ca', '#4f46e5', '#6366f1', '#818cf8', '#a5b4fc'];
  var ACCENT = '#ef4444';
  var reduced = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  function isDark() {
    return document.documentElement.classList.contains('dark');
  }

  function palette() {
    return isDark()
      ? { bg: '#111827', node: INDIGO[6], edge: INDIGO[5], dim: INDIGO[3], text: '#e5e7eb', muted: '#9ca3af' }
      : { bg: '#ffffff', node: INDIGO[3], edge: INDIGO[4], dim: INDIGO[6], text: '#111827', muted: '#6b7280' };
  }

  // Přestavět jen při změně šířky: na mobilu mění výšku okna adresní lišta při scrollování.
  function widthChanged(el, dims) {
    return Math.max(280, el.clientWidth || 600) !== dims.w;
  }

  function size(el, ratio) {
    var w = Math.max(280, el.clientWidth || 600);
    return { w: w, h: Math.round(w * ratio) };
  }

  // Deterministický pseudonáhodný generátor, aby snímky pro README byly opakovatelné.
  function rng(seed) {
    var s = seed >>> 0;
    return function () {
      s = (s * 1664525 + 1013904223) >>> 0;
      return s / 4294967296;
    };
  }

  // --- 1. Rozpad sítě pojmů -----------------------------------------------------------------
  // Pravidelná síť pojmů; ohnisko rozkladu putuje (nebo sleduje myš), hrany se trhají, uzly
  // se odchylují a rudnou. Mimo ohnisko se síť vrací do původního tvaru: rozklad a obnova.
  function rozpad(el) {
    return function (p) {
      var nodes = [];
      var edges = [];
      var dims;
      var rand = rng(11);
      var intensity = parseFloat(el.getAttribute('data-intensity') || '0.75');
      var focus = { x: 0, y: 0 };
      var t = 0;

      function build() {
        nodes = [];
        edges = [];
        var step = Math.max(26, Math.round(dims.w / 24));
        var rowH = step * 0.866;
        var cols = Math.ceil(dims.w / step) + 2;
        var rows = Math.ceil(dims.h / rowH) + 2;
        for (var r = 0; r < rows; r++) {
          for (var c = 0; c < cols; c++) {
            nodes.push({
              hx: c * step + (r % 2 ? step / 2 : 0) - step / 2,
              hy: r * rowH - rowH / 2,
              x: 0, y: 0, d: 0,
              phase: rand() * Math.PI * 2,
              keep: rand(),
              r: c, row: r,
            });
          }
        }
        var idx = function (r, c) { return r * cols + c; };
        for (var r2 = 0; r2 < rows; r2++) {
          for (var c2 = 0; c2 < cols; c2++) {
            var a = idx(r2, c2);
            if (c2 + 1 < cols) edges.push([a, idx(r2, c2 + 1), rand()]);
            if (r2 + 1 < rows) {
              edges.push([a, idx(r2 + 1, c2), rand()]);
              var c3 = c2 + (r2 % 2 ? 1 : -1);
              if (c3 >= 0 && c3 < cols) edges.push([a, idx(r2 + 1, c3), rand()]);
            }
          }
        }
        nodes.forEach(function (n) { n.x = n.hx; n.y = n.hy; });
      }

      p.setup = function () {
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.62'));
        var cnv = p.createCanvas(dims.w, dims.h);
        cnv.elt.setAttribute('role', 'img');
        cnv.elt.setAttribute('aria-label', el.getAttribute('data-label') || 'Síť pojmů, která se rozpadá a znovu obnovuje.');
        p.pixelDensity(Math.min(2, window.devicePixelRatio || 1));
        build();
        focus.x = dims.w * 0.55;
        focus.y = dims.h * 0.5;
        if (reduced) { t = 2.2; p.noLoop(); }
        var slider = el.parentElement && el.parentElement.querySelector('[data-p5-intensity]');
        if (slider) {
          slider.addEventListener('input', function () { intensity = parseFloat(slider.value); if (reduced) p.redraw(); });
        }
      };

      p.windowResized = function () {
        if (!widthChanged(el, dims)) return;
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.62'));
        p.resizeCanvas(dims.w, dims.h);
        build();
      };

      p.draw = function () {
        var c = palette();
        p.background(c.bg);
        if (!reduced) t += (p.deltaTime / 1000) * parseFloat(el.getAttribute('data-speed') || '1');
        var inside = p.mouseX > 0 && p.mouseY > 0 && p.mouseX < dims.w && p.mouseY < dims.h;
        var tx = inside ? p.mouseX : dims.w * (0.5 + 0.28 * Math.sin(t * 0.21));
        var ty = inside ? p.mouseY : dims.h * (0.5 + 0.22 * Math.sin(t * 0.33 + 1.3));
        focus.x += (tx - focus.x) * 0.06;
        focus.y += (ty - focus.y) * 0.06;
        if (reduced) { focus.x = dims.w * 0.58; focus.y = dims.h * 0.48; }
        var radius = Math.min(dims.w, dims.h) * (0.38 + 0.26 * intensity);
        var breath = 0.88 + 0.12 * Math.sin(t * 0.6);

        nodes.forEach(function (n) {
          var dist = Math.hypot(n.hx - focus.x, n.hy - focus.y) / radius;
          var target = Math.min(1, Math.max(0, 1 - dist) * 1.35) * intensity * breath;
          n.d += (target - n.d) * (reduced ? 1 : 0.12);
          var drift = n.d * n.d * 34 * (0.6 + n.keep);
          n.x = n.hx + Math.cos(n.phase + t * 0.7) * drift;
          n.y = n.hy + Math.sin(n.phase * 1.3 + t * 0.5) * drift;
        });

        p.strokeWeight(1);
        edges.forEach(function (e) {
          var a = nodes[e[0]];
          var b = nodes[e[1]];
          var d = Math.max(a.d, b.d);
          if (e[2] < d * 1.25) return;
          var col = p.color(d > 0.55 ? ACCENT : c.edge);
          col.setAlpha(255 * (0.55 - d * 0.4));
          p.stroke(col);
          p.line(a.x, a.y, b.x, b.y);
        });

        p.noStroke();
        nodes.forEach(function (n) {
          if (n.d > 0.92) return;
          var col = p.color(n.d > 0.6 ? ACCENT : n.d > 0.3 ? c.dim : c.node);
          col.setAlpha(255 * (0.95 - n.d * 0.5));
          p.fill(col);
          var s = n.d > 0.6 ? 4.2 : 3.4 - n.d * 1.8;
          p.circle(n.x, n.y, s);
        });
      };
    };
  }

  // --- 2. Eroze paměti ----------------------------------------------------------------------
  // Klíčové pojmy knihy; písmena se postupně zaměňují a vytrácejí (rekonstrukce paměti),
  // najetím myší nebo dotykem se slovo obnoví.
  function eroze(el) {
    var WORDS = ['pravda', 'paměť', 'důvěra', 'význam', 'úsudek', 'realita', 'identita', 'svědectví',
      'kontext', 'souvislost', 'jistota', 'vztah', 'jazyk', 'zkušenost', 'smysl', 'autonomie'];
    var GLYPHS = 'abcdefghijklmnopqrstuvwxyzáčďéěíňóřšťúůýž·:;/\\|-_';
    return function (p) {
      var dims;
      var items = [];
      var rand = rng(5);
      var t = 0;

      function build() {
        items = [];
        var cols = dims.w > 640 ? 4 : 2;
        var rows = Math.ceil(WORDS.length / cols);
        WORDS.forEach(function (w, i) {
          items.push({
            word: w,
            x: ((i % cols) + 0.5) * (dims.w / cols),
            y: (Math.floor(i / cols) + 0.5) * (dims.h / rows),
            decay: rand() * 0.4,
            speed: 0.03 + rand() * 0.05,
            seed: rand() * 1000,
          });
        });
      }

      p.setup = function () {
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.5'));
        var cnv = p.createCanvas(dims.w, dims.h);
        cnv.elt.setAttribute('role', 'img');
        cnv.elt.setAttribute('aria-label', 'Slova jako pravda, paměť a důvěra, jejichž písmena se postupně rozpadají a obnovují.');
        p.textFont('Inter, system-ui, sans-serif');
        p.textAlign(p.CENTER, p.CENTER);
        build();
        if (reduced) { items.forEach(function (it, i) { it.decay = (i % 5) / 5; }); p.noLoop(); }
      };

      p.windowResized = function () {
        if (!widthChanged(el, dims)) return;
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.5'));
        p.resizeCanvas(dims.w, dims.h);
        build();
      };

      p.draw = function () {
        var c = palette();
        p.background(c.bg);
        if (!reduced) t += p.deltaTime / 1000;
        var fs = Math.max(16, Math.min(30, dims.w / 26));
        p.textSize(fs);
        items.forEach(function (it) {
          var near = Math.hypot(p.mouseX - it.x, p.mouseY - it.y) < fs * 3;
          if (!reduced) it.decay = near ? Math.max(0, it.decay - 0.08) : Math.min(1, it.decay + it.speed * p.deltaTime / 1000);
          if (!reduced && it.decay >= 1) it.decay = 0;
          var out = '';
          for (var k = 0; k < it.word.length; k++) {
            var h = Math.abs(Math.sin(it.seed + k * 12.9898 + Math.floor(t * 3)) * 43758.5453) % 1;
            if (h < it.decay * 0.55) out += ' ';
            else if (h < it.decay) out += GLYPHS.charAt(Math.floor(h * 997) % GLYPHS.length);
            else out += it.word.charAt(k);
          }
          var col = p.color(it.decay > 0.7 ? ACCENT : c.text);
          col.setAlpha(255 * (1 - it.decay * 0.65));
          p.fill(col);
          p.noStroke();
          p.text(out, it.x, it.y);
        });
        p.fill(c.muted);
        p.textSize(12);
        p.textAlign(p.LEFT, p.BOTTOM);
        p.text('najeďte myší na slovo: obnoví se', 12, dims.h - 10);
        p.textAlign(p.CENTER, p.CENTER);
      };
    };
  }

  // --- 3. Rekonstituce ----------------------------------------------------------------------
  // Rozptýlené fragmenty se pomalu skládají zpět do koherentního kruhu vztahů. Kliknutí je
  // znovu rozptýlí; obnova je pomalejší než rozpad.
  function rekonstituce(el) {
    return function (p) {
      var dims;
      var pts = [];
      var rand = rng(23);
      var N = 72;

      function scatter() {
        pts.forEach(function (q) {
          q.x = rand() * dims.w;
          q.y = rand() * dims.h;
          q.vx = (rand() - 0.5) * 4;
          q.vy = (rand() - 0.5) * 4;
        });
      }

      function build() {
        pts = [];
        var cx = dims.w / 2;
        var cy = dims.h / 2;
        var R = Math.min(dims.w, dims.h) * 0.36;
        for (var i = 0; i < N; i++) {
          var ring = i % 3;
          var perRing = N / 3;
          var a = (Math.floor(i / 3) / perRing) * Math.PI * 2 + ring * (Math.PI / perRing);
          var rr = R * (0.45 + ring * 0.27);
          pts.push({ hx: cx + Math.cos(a) * rr, hy: cy + Math.sin(a) * rr, x: 0, y: 0, vx: 0, vy: 0 });
        }
        scatter();
      }

      p.setup = function () {
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.6'));
        var cnv = p.createCanvas(dims.w, dims.h);
        cnv.elt.setAttribute('role', 'img');
        cnv.elt.setAttribute('aria-label', 'Rozptýlené body se pomalu skládají zpět do soustředných kruhů propojených vztahy.');
        build();
        cnv.mousePressed(scatter);
        if (reduced) { pts.forEach(function (q) { q.x = q.hx; q.y = q.hy; }); p.noLoop(); }
      };

      p.windowResized = function () {
        if (!widthChanged(el, dims)) return;
        dims = size(el, parseFloat(el.getAttribute('data-ratio') || '0.6'));
        p.resizeCanvas(dims.w, dims.h);
        build();
      };

      p.draw = function () {
        var c = palette();
        p.background(c.bg);
        var settled = 0;
        pts.forEach(function (q) {
          if (!reduced) {
            q.vx = (q.vx + (q.hx - q.x) * 0.0035) * 0.94;
            q.vy = (q.vy + (q.hy - q.y) * 0.0035) * 0.94;
            q.x += q.vx;
            q.y += q.vy;
          }
          if (Math.hypot(q.hx - q.x, q.hy - q.y) < 8) settled++;
        });
        var coherence = settled / N;
        p.strokeWeight(1);
        for (var i = 0; i < N; i++) {
          for (var j = i + 1; j < N; j++) {
            var a = pts[i];
            var b = pts[j];
            var dh = Math.hypot(a.hx - b.hx, a.hy - b.hy);
            if (dh > Math.min(dims.w, dims.h) * 0.16) continue;
            var dd = Math.hypot(a.x - b.x, a.y - b.y);
            if (dd > dh * 1.8 + 12) continue;
            var strain = Math.min(1, Math.abs(dd - dh) / 40);
            var col = p.color(strain > 0.6 ? ACCENT : c.edge);
            col.setAlpha(255 * (0.6 - strain * 0.5));
            p.stroke(col);
            p.line(a.x, a.y, b.x, b.y);
          }
        }
        p.noStroke();
        pts.forEach(function (q) {
          var off = Math.min(1, Math.hypot(q.hx - q.x, q.hy - q.y) / 120);
          p.fill(off > 0.5 ? ACCENT : c.node);
          p.circle(q.x, q.y, 5 - off * 2);
        });
        p.fill(c.muted);
        p.textSize(12);
        p.text('koherence ' + Math.round(coherence * 100) + ' %  ·  kliknutím rozptýlit', 12, dims.h - 12);
      };
    };
  }

  var SKETCHES = { rozpad: rozpad, eroze: eroze, rekonstituce: rekonstituce };

  function mount() {
    if (typeof window.p5 === 'undefined') return;
    document.querySelectorAll('[data-p5]').forEach(function (el) {
      var make = SKETCHES[el.getAttribute('data-p5')];
      if (make && !el.__p5) el.__p5 = new window.p5(make(el), el);
    });
  }

  // Pro skript, který z plátna renderuje animaci do README a wiki (scripts/render-p5-gif.cjs).
  window.kompendiumGrafika = { mount: mount };

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', mount);
  else mount();
})();
