// Site behaviour: Pro dark-mode toggle, mobile sidebar, search, Mermaid diagrams, Chart.js figures.
(function () {
  'use strict';

  var body = document.body;

  // --- Dark mode (Pro contract: localStorage 'color-theme', event 'dark-mode') -------------
  var toggle = document.getElementById('theme-toggle');
  var darkIcon = document.getElementById('theme-toggle-dark-icon');
  var lightIcon = document.getElementById('theme-toggle-light-icon');

  function syncThemeIcons() {
    var dark = document.documentElement.classList.contains('dark');
    if (darkIcon) darkIcon.classList.toggle('hidden', dark);
    if (lightIcon) lightIcon.classList.toggle('hidden', !dark);
  }

  if (toggle) {
    syncThemeIcons();
    toggle.addEventListener('click', function () {
      var dark = document.documentElement.classList.toggle('dark');
      try { localStorage.setItem('color-theme', dark ? 'dark' : 'light'); } catch (e) {}
      syncThemeIcons();
      document.dispatchEvent(new Event('dark-mode'));
    });
  }

  // --- Search over Zola's fuse_json index --------------------------------------------------
  var indexUrl = body.getAttribute('data-search-index');
  var indexPromise = null;

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function loadIndex() {
    if (!indexPromise) {
      indexPromise = fetch(indexUrl).then(function (r) { return r.json(); }).then(function (docs) {
        return docs.map(function (d) {
          return { title: d.title || '', description: d.description || '', path: d.path || d.url || '',
            hay: fold((d.title || '') + ' ' + (d.description || '')), t: fold(d.title || '') };
        });
      });
    }
    return indexPromise;
  }

  function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  function search(docs, query) {
    var terms = fold(query).split(/\s+/).filter(Boolean);
    if (!terms.length) return [];
    var hits = [];
    for (var i = 0; i < docs.length; i++) {
      var d = docs[i];
      var score = 0;
      var all = true;
      for (var j = 0; j < terms.length; j++) {
        if (d.hay.indexOf(terms[j]) === -1) { all = false; break; }
        score += d.t.indexOf(terms[j]) !== -1 ? 3 : 1;
      }
      if (all) hits.push({ d: d, score: score });
    }
    hits.sort(function (a, b) { return b.score - a.score || a.d.title.length - b.d.title.length; });
    return hits.slice(0, 12).map(function (h) { return h.d; });
  }

  function href(path) {
    if (/^https?:/.test(path)) return path;
    var base = body.getAttribute('data-base-url').replace(/\/$/, '');
    var basePath = base.replace(/^https?:\/\/[^/]+/, '');
    return path.indexOf(basePath + '/') === 0 ? path : basePath + path;
  }

  document.querySelectorAll('[data-search-form]').forEach(function (form) {
    var input = form.querySelector('[data-search-input]');
    var results = form.querySelector('[data-search-results]');
    var timer = null;

    function render(list, query) {
      if (!query) { results.classList.add('hidden'); results.innerHTML = ''; return; }
      if (!list.length) {
        results.innerHTML = '<p class="px-4 py-3 text-gray-500 dark:text-gray-400">Nic nenalezeno.</p>';
      } else {
        results.innerHTML = list.map(function (d) {
          return '<a role="option" href="' + escapeHtml(href(d.path)) + '" class="block border-b border-gray-100 px-4 py-2 hover:bg-gray-100 dark:border-gray-600 dark:hover:bg-gray-600">' +
            '<span class="block font-medium text-gray-900 dark:text-white">' + escapeHtml(d.title) + '</span>' +
            (d.description ? '<span class="block truncate text-xs text-gray-500 dark:text-gray-400">' + escapeHtml(d.description) + '</span>' : '') +
            '</a>';
        }).join('');
      }
      results.classList.remove('hidden');
    }

    input.addEventListener('input', function () {
      clearTimeout(timer);
      var q = input.value.trim();
      timer = setTimeout(function () {
        if (q.length < 2) { render([], ''); return; }
        loadIndex().then(function (docs) { render(search(docs, q), q); });
      }, 120);
    });
    input.addEventListener('focus', function () { loadIndex(); });
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') { input.value = ''; render([], ''); }
    });
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var first = results.querySelector('a');
      if (first) window.location.href = first.href;
    });
    document.addEventListener('click', function (e) {
      if (!form.contains(e.target)) results.classList.add('hidden');
    });
  });

  // --- Mermaid: Zola emits <pre><code data-lang="mermaid"> with highlight spans -------------
  var mermaidBlocks = document.querySelectorAll('pre code[data-lang="mermaid"], pre code.language-mermaid');

  function loadScript(src) {
    return new Promise(function (resolve, reject) {
      var s = document.createElement('script');
      s.src = src;
      s.onload = resolve;
      s.onerror = reject;
      document.head.appendChild(s);
    });
  }

  // Klikací uzly Mermaid:
  // 1. `click Uzel "@/glossary/heslo.md"` ve zdroji diagramu → odkaz na stránku webu
  //    (cesta se převede stejně jako interní odkazy Zola: _index.md → složka, .md → /);
  // 2. uzel bez odkazu, jehož popisek odpovídá názvu stránky, se propojí přes index hledání.
  function atPathToUrl(href) {
    var base = body.getAttribute('data-base-url').replace(/\/$/, '').replace(/^https?:\/\/[^/]+/, '');
    var m = /^@\/(.*?)(#.*)?$/.exec(href);
    if (!m) return href;
    var path = m[1].replace(/(^|\/)_index\.md$/, '$1').replace(/\.md$/, '/');
    return base + '/' + path + (m[2] || '');
  }

  function makeClickable(node, url, title) {
    node.style.cursor = 'pointer';
    node.setAttribute('role', 'link');
    node.setAttribute('tabindex', '0');
    node.setAttribute('aria-label', title);
    node.classList.add('kea-mermaid-link');
    node.addEventListener('click', function () { window.location.href = url; });
    node.addEventListener('keydown', function (e) { if (e.key === 'Enter') window.location.href = url; });
  }

  function linkDiagrams() {
    document.querySelectorAll('.mermaid svg a').forEach(function (a) {
      ['href', 'xlink:href'].forEach(function (attr) {
        var v = a.getAttribute(attr);
        if (v && v.indexOf('@/') === 0) a.setAttribute(attr, atPathToUrl(v));
      });
    });
    var unlinked = [];
    document.querySelectorAll('.mermaid svg g.node').forEach(function (g) {
      if (!g.closest('a')) unlinked.push(g);
    });
    if (!unlinked.length) return;
    loadIndex().then(function (docs) {
      var byTitle = {};
      docs.forEach(function (d) { if (!byTitle[d.t]) byTitle[d.t] = d; });
      unlinked.forEach(function (g) {
        var label = fold((g.textContent || '').replace(/\s+/g, ' ').trim());
        var d = byTitle[label];
        if (d && fold(href(d.path)) !== fold(window.location.pathname)) makeClickable(g, href(d.path), d.title);
      });
    }).catch(function () {});
  }

  if (mermaidBlocks.length) {
    var diagrams = [];
    mermaidBlocks.forEach(function (code) {
      var pre = code.closest('pre');
      var div = document.createElement('div');
      div.className = 'mermaid not-format my-6 overflow-x-auto';
      div.setAttribute('data-source', code.textContent);
      div.textContent = code.textContent;
      pre.replaceWith(div);
      diagrams.push(div);
    });
    loadScript(body.getAttribute('data-mermaid')).then(function () {
      function draw() {
        var dark = document.documentElement.classList.contains('dark');
        diagrams.forEach(function (d) {
          d.removeAttribute('data-processed');
          d.textContent = d.getAttribute('data-source');
        });
        // 'loose' povoluje v diagramech `click Uzel "@/cesta/stranka.md"`; zdroj diagramů je náš obsah.
        window.mermaid.initialize({ startOnLoad: false, securityLevel: 'loose', theme: dark ? 'dark' : 'default' });
        window.mermaid.run({ nodes: diagrams }).then(linkDiagrams).catch(function () {});
      }
      draw();
      document.addEventListener('dark-mode', draw);
    }).catch(function () {});
  }

  // --- Chart.js figures from the chart_inline component ------------------------------------
  var charts = document.querySelectorAll('canvas[data-chart]');
  if (charts.length) {
    var ready = window.Chart ? Promise.resolve() : loadScript(body.getAttribute('data-chartjs'));
    ready.then(function () {
      charts.forEach(function (canvas) {
        var slug = canvas.getAttribute('data-chart');
        var cfgEl = document.querySelector('script[data-chart-config="' + slug + '"]');
        if (!cfgEl) return;
        var cfg = JSON.parse(cfgEl.textContent);
        cfg.options = cfg.options || {};
        cfg.options.maintainAspectRatio = false;
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) cfg.options.animation = false;
        new window.Chart(canvas.getContext('2d'), cfg);
      });
    }).catch(function () {});
  }
})();
