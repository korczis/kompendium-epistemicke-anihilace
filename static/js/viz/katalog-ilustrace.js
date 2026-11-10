// Ilustrace katalogu (p5.js přes sdílenou vrstvu KompendiumVrstva.p5): původní generativní kresba
// odvozená z dat katalogu – každé heslo je hvězda, rodiny jsou souhvězdí rozložená po kruhu,
// vazby „obecnější heslo“ a „příbuzné“ jsou jemné spoje. Jedna komponenta pro každý katalog:
//   <div data-katalog-ilustrace="data/<slug>-katalog.json" data-rodina="<slug>?"></div>
// načte export, který odvozuje scripts/catalogs.py; nic se nepíše ručně. Velikost (mobile first),
// změnu šířky, pozastavení mimo obrazovku a při prefers-reduced-motion, popisek plátna i
// překreslení při změně tématu řídí vrstva (static/js/viz/vrstva.js, pravidlo check-viz-layer);
// barvy jsou kategorická paleta a tokeny tématu vrstvy. Klepnutí na hvězdu otevře heslo.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var L = window.KompendiumVrstva;

  // Deterministický pseudonáhodný generátor: stejná data dávají stejný obraz.
  function rng(seed) {
    var s = seed >>> 0;
    return function () {
      s = (s * 1664525 + 1013904223) >>> 0;
      return s / 4294967296;
    };
  }

  function hash(text) {
    var h = 2166136261;
    for (var i = 0; i < text.length; i++) { h ^= text.charCodeAt(i); h = Math.imul(h, 16777619); }
    return h >>> 0;
  }

  function layout(data, family, palette, width, height) {
    var fams = data.families.filter(function (f) { return !family || f.slug === family; });
    var cx = width / 2;
    var cy = height / 2;
    var ring = Math.min(width, height) * (family ? 0 : 0.34);
    var stars = [];
    var bySlug = {};
    fams.forEach(function (f, fi) {
      var angle = (fi / fams.length) * Math.PI * 2 - Math.PI / 2;
      var fx = cx + Math.cos(angle) * ring;
      var fy = cy + Math.sin(angle) * ring;
      var spread = Math.min(width, height) * (family ? 0.42 : 0.12);
      var rand = rng(hash(f.slug));
      var color = palette[(parseInt(f.code, 10) - 1) % palette.length];
      f.members.forEach(function (slug, i) {
        var e = data.byslug[slug];
        if (!e) return;
        // Zlatý úhel: rovnoměrné, organické rozložení hvězd uvnitř souhvězdí.
        var r = spread * Math.sqrt((i + 0.5) / f.members.length);
        var a = i * 2.39996 + rand() * 0.6;
        var star = {
          slug: slug, e: e, color: color,
          x: fx + Math.cos(a) * r, y: fy + Math.sin(a) * r,
          size: 3 + Math.min(6, (e.related || []).length + (e.narrower || []).length),
          phase: rand() * Math.PI * 2,
        };
        stars.push(star);
        bySlug[slug] = star;
      });
    });
    var links = [];
    stars.forEach(function (s) {
      if (s.e.broader && bySlug[s.e.broader]) links.push([bySlug[s.e.broader], s, 0.55]);
      (s.e.related || []).forEach(function (r) {
        if (bySlug[r] && r > s.slug) links.push([s, bySlug[r], 0.18]);
      });
    });
    return { stars: stars, links: links };
  }

  function sketchFor(data, family) {
    return function (p, k) {
      var scene = null;
      var hover = null;

      function build(w, h) { scene = layout(data, family, k.palette, w, h); }

      p.setup = function () {
        k.canvas();
        build(k.width(), k.height());
      };

      p.resized = function (w, h) { build(w, h); };

      p.draw = function () {
        var t = k.theme();
        var still = L.reducedMotion();
        var time = still ? 0 : p.millis() / 1000;
        p.clear();
        scene.links.forEach(function (l) {
          var c = p.color(l[0].color);
          c.setAlpha(255 * l[2] * (t.dark ? 0.9 : 0.7));
          p.stroke(c);
          p.strokeWeight(l[2] > 0.3 ? 1.2 : 0.6);
          p.line(l[0].x, l[0].y, l[1].x, l[1].y);
        });
        p.noStroke();
        var m = k.mouse();
        hover = null;
        scene.stars.forEach(function (s) {
          var twinkle = still ? 1 : 0.8 + 0.2 * Math.sin(time * 1.3 + s.phase);
          var c = p.color(s.color);
          c.setAlpha(t.dark ? 60 : 40);
          p.fill(c);
          p.circle(s.x, s.y, s.size * 3.2 * twinkle);
          c.setAlpha(255);
          p.fill(c);
          p.circle(s.x, s.y, s.size * twinkle);
          if (p.dist(m.x, m.y, s.x, s.y) < Math.max(8, s.size * 1.5)) hover = s;
        });
        if (hover) {
          p.fill(t.text);
          p.textSize(12);
          p.textAlign(p.LEFT, p.BOTTOM);
          var label = hover.e.id + ' ' + hover.e.cs;
          var x = Math.min(hover.x + 8, k.width() - p.textWidth(label) - 4);
          p.text(label, Math.max(4, x), Math.max(14, hover.y - 6));
          p.cursor(p.HAND);
        } else {
          p.cursor(p.ARROW);
        }
      };

      p.mouseMoved = function () { if (L.reducedMotion()) p.redraw(); };

      p.mouseClicked = function () {
        var m = k.mouse();
        if (hover && m.x >= 0 && m.y >= 0 && m.x <= k.width() && m.y <= k.height()) {
          window.location.href = V.basePath + '/' + hover.e.url;
        }
      };
    };
  }

  function init() {
    var nodes = document.querySelectorAll('[data-katalog-ilustrace]');
    if (!nodes.length || !L || !V) return;
    var ready = typeof window.p5 === 'undefined' ? V.loadScript('p5-1.7.0.min.js') : Promise.resolve();
    ready.then(function () {
      nodes.forEach(function (el) {
        V.json(el.getAttribute('data-katalog-ilustrace')).then(function (data) {
          data.byslug = {};
          (data.entries || []).forEach(function (e) { data.byslug[e.slug] = e; });
          L.p5(el, sketchFor(data, el.getAttribute('data-rodina') || ''), {
            aspect: function () { return el.clientWidth < 640 ? 0.9 : 0.55; },
            minHeight: 280, maxHeight: 520,
            label: 'Ilustrace katalogu ' + data.title + ': hesla jako hvězdy v souhvězdích rodin, ' +
              'vazby jako spoje. Stejné vazby uvádí oddíl Související každého hesla.',
          });
        });
      });
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
