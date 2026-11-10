// Ilustrace katalogu (p5.js): původní generativní kresba odvozená z dat katalogu – každé heslo
// je hvězda, rodiny jsou souhvězdí rozložená po kruhu, vazby „obecnější heslo“ a „příbuzné“
// jsou jemné spoje. Jedna komponenta pro každý katalog: prvek
//   <div data-katalog-ilustrace="data/<slug>-katalog.json" data-rodina="<slug>?"></div>
// načte export, který odvozuje scripts/catalogs.py; nic se nepíše ručně. Barvy jsou paleta knihy
// (KompendiumViz.PALETTE) a téma (světlé/tmavé); pohyb je jemný a vypne se při
// prefers-reduced-motion; šířka sleduje kontejner (mobile-first); klepnutí na hvězdu otevře heslo.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var still = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

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

  function layout(data, family, width, height) {
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
      var color = V.PALETTE[(parseInt(f.code, 10) - 1) % V.PALETTE.length];
      f.members.forEach(function (slug, i) {
        var e = data.byslug[slug];
        if (!e) return;
        // Zlatý úhel: rovnoměrné, organické rozložení hvězd uvnitř souhvězdí.
        var r = spread * Math.sqrt((i + 0.5) / f.members.length);
        var a = i * 2.39996 + rand() * 0.6;
        var star = {
          slug: slug, e: e, color: color, family: f.title,
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

  function draw(el, data) {
    var family = el.getAttribute('data-rodina') || '';
    var holder = el;
    new window.p5(function (p) {
      var scene = null;
      var hover = null;

      function size() {
        var w = Math.max(280, holder.clientWidth);
        return { w: w, h: Math.round(Math.min(520, Math.max(260, w * 0.62))) };
      }

      function build() {
        var s = size();
        p.resizeCanvas(s.w, s.h);
        scene = layout(data, family, s.w, s.h);
      }

      p.setup = function () {
        var s = size();
        var c = p.createCanvas(s.w, s.h);
        c.parent(holder);
        c.elt.setAttribute('role', 'img');
        c.elt.setAttribute('aria-label', 'Ilustrace katalogu: ' + data.title + ', hesla jako hvězdy ' +
          'v souhvězdích rodin, vazby jako spoje. Stejné vazby uvádí oddíl Související každého hesla.');
        p.pixelDensity(Math.min(2, window.devicePixelRatio || 1));
        scene = layout(data, family, s.w, s.h);
        if (still) p.noLoop();
        document.addEventListener('dark-mode', function () { p.redraw(); });
      };

      p.windowResized = function () { build(); p.redraw(); };

      p.draw = function () {
        var t = V.theme();
        var dark = V.isDark();
        p.clear();
        var time = still ? 0 : p.millis() / 1000;
        scene.links.forEach(function (l) {
          var c = p.color(l[0].color);
          c.setAlpha(255 * l[2] * (dark ? 0.9 : 0.7));
          p.stroke(c);
          p.strokeWeight(l[2] > 0.3 ? 1.2 : 0.6);
          p.line(l[0].x, l[0].y, l[1].x, l[1].y);
        });
        p.noStroke();
        hover = null;
        scene.stars.forEach(function (s) {
          var twinkle = still ? 1 : 0.8 + 0.2 * Math.sin(time * 1.3 + s.phase);
          var c = p.color(s.color);
          c.setAlpha(dark ? 60 : 40);
          p.fill(c);
          p.circle(s.x, s.y, s.size * 3.2 * twinkle);
          c.setAlpha(255);
          p.fill(c);
          p.circle(s.x, s.y, s.size * twinkle);
          if (p.dist(p.mouseX, p.mouseY, s.x, s.y) < Math.max(8, s.size * 1.5)) hover = s;
        });
        if (hover) {
          p.fill(t.text);
          p.textSize(12);
          p.textAlign(p.LEFT, p.BOTTOM);
          var label = hover.e.id + ' ' + hover.e.cs;
          var x = Math.min(hover.x + 8, p.width - p.textWidth(label) - 4);
          p.text(label, Math.max(4, x), Math.max(14, hover.y - 6));
          p.cursor(p.HAND);
        } else {
          p.cursor(p.ARROW);
        }
      };

      p.mouseMoved = function () { if (still) p.redraw(); };

      p.mouseClicked = function () {
        if (hover && p.mouseX >= 0 && p.mouseY >= 0 && p.mouseX <= p.width && p.mouseY <= p.height) {
          window.location.href = V.basePath + '/' + hover.e.url;
        }
      };
    });
  }

  function init() {
    var nodes = document.querySelectorAll('[data-katalog-ilustrace]');
    if (!nodes.length) return;
    V.loadScript('p5-1.7.0.min.js').then(function () {
      nodes.forEach(function (el) {
        V.json(el.getAttribute('data-katalog-ilustrace')).then(function (data) {
          data.byslug = {};
          (data.entries || []).forEach(function (e) { data.byslug[e.slug] = e; });
          draw(el, data);
        });
      });
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
