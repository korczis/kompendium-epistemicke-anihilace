// Komponentová vrstva vizualizací: jediné místo, kde se berou barvy tématu a kategorická paleta,
// načítá data knihy (kniha.js) a zakládají plátna p5.js a three.js. Načítá se synchronně v <head>
// každé stránky (base.html), takže ji skripty v těle stránky mají k dispozici hned.
//
// Plátno (p5 i three) od vrstvy dostane totéž chování, které si dřív každý skript psal sám a
// většinou vůbec ne:
//   - mobile first: šířka = šířka hostitele, výška z poměru stran (aspect) v mezích
//     minHeight..maxHeight (aspect smí být funkce, např. jiný poměr na telefonu); při změně
//     šířky (ResizeObserver) se plátno přepočítá;
//   - pevný návrhový prostor (design: [šířka, výška]): skica kreslí v souřadnicích návrhu a
//     vrstva ji škáluje na skutečnou velikost; k.mouse() vrací myš v týchž souřadnicích;
//   - mimo obrazovku animace stojí (IntersectionObserver), při prefers-reduced-motion se
//     nespustí sama; animované plátno má v rohu tlačítko Pozastavit/Spustit (WCAG 2.2, 2.2.2);
//   - plátno je role="img" s popiskem (opts.label, jinak titulek obrázku nebo nadpis);
//   - při přepnutí tématu (událost dark-mode) se překreslí a k.theme() vrací nové barvy.
//
// Použití:
//   KompendiumVrstva.p5(host, function (p, k) { p.setup = function () { k.canvas(); };
//     p.draw = function () { ... k.theme().text ... k.mouse().x ... }; },
//     { design: [800, 400], label: 'Simulace …' });
//   var t = KompendiumVrstva.three(host, { aspect: 0.6, label: '…', frame: function (dt) { … },
//     resize: function (w, h) { camera.aspect = w / h; camera.updateProjectionMatrix(); } });
//   t.scene, t.renderer; kamera a scéna patří skriptu, smyčku a velikost řídí vrstva.
//   KompendiumVrstva.kniha().then(function (K) { … })   // data knihy, viz kniha.js
(function () {
  'use strict';
  if (window.KompendiumVrstva) return;
  var SRC = document.currentScript && document.currentScript.src;

  function isDark() {
    return document.documentElement.classList.contains('dark');
  }

  // Kategorické barvy: světlé téma Tailwind 600 (žlutá 700), tmavé 400; každá aspoň 3:1 vůči
  // povrchu (white, gray-800; WCAG 2.2, 1.4.11). Pořadí odstínů je v obou tématech stejné.
  var PALETTE_LIGHT = ['#4f46e5', '#0284c7', '#059669', '#d97706', '#dc2626', '#9333ea', '#0d9488',
    '#ea580c', '#db2777', '#65a30d', '#c026d3', '#0891b2', '#a16207', '#7c3aed', '#16a34a', '#475569'];
  var PALETTE_DARK = ['#818cf8', '#38bdf8', '#34d399', '#fbbf24', '#f87171', '#c084fc', '#2dd4bf',
    '#fb923c', '#f472b6', '#a3e635', '#e879f9', '#22d3ee', '#facc15', '#a78bfa', '#4ade80', '#94a3b8'];
  // Jedno živé pole: při přepnutí tématu se přepíše na místě dřív, než se grafy přestaví
  // (posluchač je registrován při načtení vrstvy, tedy před posluchači grafů).
  var PALETTE = [];
  function syncPalette() {
    PALETTE.length = 0;
    Array.prototype.push.apply(PALETTE, isDark() ? PALETTE_DARK : PALETTE_LIGHT);
  }
  syncPalette();
  document.addEventListener('dark-mode', syncPalette);

  // Paleta pro povrch daného tónu bez ohledu na téma stránky: plátno s vlastním tmavým pozadím
  // (např. #0f172a) potřebuje tmavou paletu i ve světlém tématu.
  function paletteFor(dark) {
    return (dark ? PALETTE_DARK : PALETTE_LIGHT).slice();
  }

  function theme() {
    var dark = isDark();
    return {
      dark: dark,
      text: dark ? '#e5e7eb' : '#111827',
      muted: dark ? '#9ca3af' : '#6b7280',
      grid: dark ? '#374151' : '#e5e7eb',
      surface: dark ? '#1f2937' : '#ffffff',
      edge: dark ? '#4b5563' : '#cbd5e1',
      primary: dark ? '#818cf8' : '#4f46e5',
      accent: dark ? '#f87171' : '#dc2626',
    };
  }

  function reducedMotion() {
    return !!(window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches);
  }

  // Data knihy: kniha.js se načte jednou pro celou stránku, ze stejné složky jako skripty knihy.
  var knihaPromise = null;
  function kniha() {
    if (!knihaPromise) {
      knihaPromise = (window.KompendiumKniha ? Promise.resolve() : new Promise(function (ok, fail) {
        var s = document.createElement('script');
        s.src = SRC.replace(/js\/viz\/[^/]*$/, 'js/kompendium/kniha.js');
        s.onload = ok;
        s.onerror = function () { fail(new Error('kniha.js se nenačetl')); };
        document.head.appendChild(s);
      })).then(function () { return window.KompendiumKniha.ready(); });
    }
    return knihaPromise;
  }

  function hostOf(host) {
    return typeof host === 'string' ? document.getElementById(host) : host;
  }

  // Popisek plátna: výslovný, jinak titulek obrázku, jinak nejbližší předchozí nadpis.
  function labelFor(host, opts) {
    if (opts.label) return opts.label;
    var fig = host.closest('figure');
    var cap = fig && fig.querySelector('figcaption');
    if (cap && cap.textContent.trim()) return cap.textContent.trim();
    var el = host;
    while (el && el !== document.body) {
      var prev = el.previousElementSibling;
      while (prev) {
        if (/^H[2-4]$/.test(prev.tagName)) return 'Vizualizace: ' + prev.textContent.trim();
        prev = prev.previousElementSibling;
      }
      el = el.parentElement;
    }
    return 'Interaktivní vizualizace';
  }

  function sizeFor(host, opts) {
    var w = host.clientWidth || (host.parentElement && host.parentElement.clientWidth) || 360;
    if (opts.maxWidth) w = Math.min(w, opts.maxWidth);
    var aspect = typeof opts.aspect === 'function' ? opts.aspect() : opts.aspect;
    aspect = aspect || (opts.design ? opts.design[1] / opts.design[0] : 0.5);
    var h = Math.round(w * aspect);
    var minH = opts.minHeight == null ? 240 : opts.minHeight;
    h = Math.max(minH, Math.min(opts.maxHeight || 560, h));
    if (opts.design) {
      // Návrhový prostor se škáluje rovnoměrně; výška plátna drží poměr návrhu (bez deformace).
      h = Math.min(Math.round(w * opts.design[1] / opts.design[0]), opts.maxHeight || 1e9);
    }
    return { w: Math.max(1, Math.floor(w)), h: Math.max(1, h) };
  }

  // Tlačítko Pozastavit/Spustit v rohu animovaného plátna (Flowbite alternative button).
  // Překrývá plátno, takže jeho vložení nic neposune (CLS 0).
  function pauseControl(host, state) {
    if (window.getComputedStyle(host).position === 'static') host.style.position = 'relative';
    var b = document.createElement('button');
    b.type = 'button';
    b.className = 'absolute right-2 top-2 z-10 rounded-lg border border-gray-200 bg-white/90 ' +
      'px-3 py-1.5 text-xs font-medium ' +
      'text-gray-900 hover:bg-gray-100 hover:text-primary-700 focus:outline-none focus:ring-4 ' +
      'focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-300 ' +
      'dark:hover:bg-gray-700 dark:hover:text-white dark:focus:ring-gray-700';
    b.setAttribute('data-vrstva-pause', '');
    function sync() {
      b.textContent = state.paused ? 'Spustit animaci' : 'Pozastavit animaci';
      b.setAttribute('aria-pressed', state.paused ? 'true' : 'false');
    }
    b.addEventListener('click', function () { state.paused = !state.paused; sync(); state.apply(); });
    sync();
    host.appendChild(b);
    return sync;
  }

  // Společné řízení smyčky: běží, jen když je plátno vidět a uživatel ji nepozastavil.
  function loopControl(host, opts, run, stop) {
    var state = { paused: opts.animate === false || reducedMotion(), visible: true };
    state.apply = function () { if (state.visible && !state.paused) run(); else stop(); };
    if (opts.animate !== false) pauseControl(host, state);
    if ('IntersectionObserver' in window) {
      new IntersectionObserver(function (entries) {
        state.visible = entries[entries.length - 1].isIntersecting;
        state.apply();
      }).observe(host);
    }
    return state;
  }

  function onResize(host, fn) {
    var last = host.clientWidth;
    if ('ResizeObserver' in window) {
      new ResizeObserver(function () {
        if (host.clientWidth !== last) { last = host.clientWidth; fn(); }
      }).observe(host);
    } else {
      window.addEventListener('resize', fn);
    }
  }

  function labelCanvas(canvas, text) {
    canvas.setAttribute('role', 'img');
    canvas.setAttribute('aria-label', text);
    canvas.style.maxWidth = '100%';
    canvas.style.display = 'block';
  }

  function p5In(host, sketch, opts) {
    host = hostOf(host);
    opts = opts || {};
    if (!host || typeof window.p5 === 'undefined') return null;
    var label = labelFor(host, opts);
    var size = sizeFor(host, opts);
    var scale = opts.design ? size.w / opts.design[0] : 1;
    var inst = null;
    var k = {
      width: function () { return opts.design ? opts.design[0] : size.w; },
      height: function () { return opts.design ? opts.design[1] : size.h; },
      theme: theme,
      palette: PALETTE,
      mouse: function () { return { x: inst.mouseX / scale, y: inst.mouseY / scale }; },
      canvas: function (renderer) {
        var c = renderer ? inst.createCanvas(size.w, size.h, renderer) : inst.createCanvas(size.w, size.h);
        c.parent(host);
        labelCanvas(c.elt, label);
        return c;
      },
    };
    // Stav smyčky existuje dřív než instance: p5 může spustit setup už v konstruktoru.
    var state = loopControl(host, opts,
      function () { if (inst) inst.loop(); }, function () { if (inst) inst.noLoop(); });
    new window.p5(function (p) {
      inst = p;
      sketch(p, k);
      if (opts.design && p.draw) {
        var draw = p.draw;
        p.draw = function () { p.push(); p.scale(scale); draw.apply(p, arguments); p.pop(); };
      }
      var setup = p.setup;
      p.setup = function () {
        if (setup) setup.apply(p, arguments);
        // První snímek se vykreslí vždy; smyčka pak běží, jen když smí.
        if (state.paused || !state.visible) { p.noLoop(); p.redraw(); }
      };
    }, host);
    onResize(host, function () {
      size = sizeFor(host, opts);
      scale = opts.design ? size.w / opts.design[0] : 1;
      inst.resizeCanvas(size.w, size.h);
      if (typeof inst.resized === 'function') inst.resized(k.width(), k.height());
      inst.redraw();
    });
    document.addEventListener('dark-mode', function () { inst.redraw(); });
    return inst;
  }

  function threeIn(host, opts) {
    host = hostOf(host);
    opts = opts || {};
    var THREE = window.THREE;
    if (!host || !THREE) return null;
    var size = sizeFor(host, opts);
    var renderer = new THREE.WebGLRenderer({ antialias: true, alpha: !!opts.alpha });
    renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
    renderer.setSize(size.w, size.h);
    labelCanvas(renderer.domElement, labelFor(host, opts));
    host.appendChild(renderer.domElement);
    var api = { renderer: renderer, THREE: THREE, theme: theme, palette: PALETTE,
      width: function () { return size.w; }, height: function () { return size.h; },
      render: function () { if (opts.render) opts.render(); } };
    var last = performance.now();
    function tick(now) {
      var dt = Math.min(0.1, (now - last) / 1000);
      last = now;
      if (opts.frame) opts.frame(dt);
      api.render();
    }
    var state = loopControl(host, opts,
      function () { last = performance.now(); renderer.setAnimationLoop(tick); },
      function () { renderer.setAnimationLoop(null); });
    if (opts.resize) opts.resize(size.w, size.h);
    setTimeout(function () { api.render(); state.apply(); }, 0);
    onResize(host, function () {
      size = sizeFor(host, opts);
      renderer.setSize(size.w, size.h);
      if (opts.resize) opts.resize(size.w, size.h);
      api.render();
    });
    document.addEventListener('dark-mode', function () {
      if (opts.theme) opts.theme(theme());
      api.render();
    });
    return api;
  }

  window.KompendiumVrstva = {
    PALETTE: PALETTE, paletteFor: paletteFor, theme: theme, isDark: isDark,
    reducedMotion: reducedMotion,
    kniha: kniha, p5: p5In, three: threeIn,
  };
})();
