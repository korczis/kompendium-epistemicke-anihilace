// Site behaviour: Pro dark-mode toggle, mobile sidebar, search, Mermaid diagrams, Chart.js figures.
(function () {
  'use strict';

  var body = document.body;

  // --- Dark mode (Pro contract: localStorage 'color-theme', event 'dark-mode') -------------
  var toggle = document.getElementById('theme-toggle');
  var darkIcon = document.getElementById('theme-toggle-dark-icon');
  var lightIcon = document.getElementById('theme-toggle-light-icon');

  // The icons follow the `dark` class through CSS (dark:hidden / dark:block), so they are right
  // before any script runs and the navbar does not shift; this only keeps the accessible name.
  function syncThemeIcons() {
    var dark = document.documentElement.classList.contains('dark');
    if (toggle) toggle.setAttribute('aria-pressed', dark ? 'true' : 'false');
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

  // --- Search: one engine (static/js/viz/jadro.js, contract kompendium-engine/v1) -----------
  // Ranking, normalisation and EA codes belong to the engine, which the build checks against
  // the reference scripts/engine.py (test/cases/05_engine_js.sh). Here only the presentation:
  // the first 12 hits, an honest total, and the description from search.json.
  var indexUrl = body.getAttribute('data-search-index');
  var graphUrl = body.getAttribute('data-graph');
  var indexPromise = null;
  var J = window.KompendiumJadro;
  var SHOWN = 12;

  function fetchJson(url) {
    return fetch(url).then(function (r) {
      if (!r.ok) throw new Error('HTTP ' + r.status);
      return r.json();
    });
  }

  // {engine, describe(url), docs}; docs (url, title, normalised title) serve the diagram links.
  function loadIndex() {
    if (!indexPromise) {
      indexPromise = Promise.all([fetchJson(indexUrl), fetchJson(graphUrl)]).then(function (r) {
        var data = r[0];
        var f = {};
        data.fields.forEach(function (name, i) { f[name] = i; });
        var desc = {};
        var docs = data.entries.map(function (e) {
          desc[e[f.url]] = e[f.description];
          return { url: e[f.url], title: e[f.title], t: J.normalise(e[f.title]) };
        });
        return { engine: J.create(data, r[1]), describe: function (url) { return desc[url] || ''; },
          docs: docs };
      });
      indexPromise.catch(function () { indexPromise = null; });  // a failed fetch may be retried
    }
    return indexPromise;
  }

  // {hits, total} for a query; an error answer (blank query, too long) is no hits.
  function search(index, query) {
    var res = index.engine.run({ op: 'search', query: query, limit: SHOWN });
    if (!res.ok) return { hits: [], total: 0 };
    return { hits: res.hits.map(function (h) {
      return { title: h.title, path: h.url, code: h.code, kind: h.kind, description: index.describe(h.url) };
    }), total: res.total };
  }

  function isCode(q) {
    return !!J.eaCode(J.normalise(q));
  }

  function href(path) {
    if (/^https?:/.test(path)) return path;
    var base = body.getAttribute('data-base-url').replace(/\/$/, '');
    var basePath = base.replace(/^https?:\/\/[^/]+/, '');
    return path.indexOf(basePath + '/') === 0 ? path : basePath + path;
  }

  function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  document.querySelectorAll('[data-search-form]').forEach(function (form, n) {
    var input = form.querySelector('[data-search-input]');
    var results = form.querySelector('[data-search-results]');
    var status = form.querySelector('[data-search-status]');
    var listId = results.id || ('search-results-' + n);
    var timer = null;
    var active = -1;
    results.id = listId;
    input.setAttribute('role', 'combobox');
    input.setAttribute('aria-autocomplete', 'list');
    input.setAttribute('aria-controls', listId);
    input.setAttribute('aria-expanded', 'false');

    function options() { return results.querySelectorAll('[role="option"]'); }

    function close() {
      results.classList.add('hidden');
      input.setAttribute('aria-expanded', 'false');
      input.removeAttribute('aria-activedescendant');
      active = -1;
    }

    function announce(text) { if (status) status.textContent = text; }

    function highlight(i) {
      var opts = options();
      if (!opts.length) return;
      active = (i + opts.length) % opts.length;
      opts.forEach(function (o, k) {
        o.setAttribute('aria-selected', k === active ? 'true' : 'false');
        o.classList.toggle('bg-gray-100', k === active);
        o.classList.toggle('dark:bg-gray-600', k === active);
      });
      input.setAttribute('aria-activedescendant', opts[active].id);
      opts[active].scrollIntoView({ block: 'nearest' });
    }

    function render(found, query) {
      var list = found.hits;
      if (!query) { results.innerHTML = ''; close(); announce(''); return; }
      if (!list.length) {
        results.innerHTML = '<li class="px-4 py-3 text-gray-600 dark:text-gray-300">Nic nenalezeno. Zkuste jiný tvar slova nebo kód techniky, např. <kbd class="rounded border border-gray-200 px-1 dark:border-gray-500">EA-1.1.1</kbd>.</li>';
        announce('Nic nenalezeno');
      } else {
        results.innerHTML = list.map(function (d, k) {
          return '<li id="' + listId + '-' + k + '" role="option" aria-selected="false" data-href="' + escapeHtml(href(d.path)) + '" class="cursor-pointer border-b border-gray-100 px-4 py-2 last:border-0 hover:bg-gray-100 dark:border-gray-600 dark:hover:bg-gray-600">' +
            '<span class="flex items-center gap-2"><span class="min-w-0 flex-1 truncate font-medium text-gray-900 dark:text-white">' + escapeHtml(d.title) + '</span>' +
            (d.code ? '<span class="shrink-0 rounded bg-primary-100 px-1.5 font-mono text-xs text-primary-800 dark:bg-primary-900 dark:text-primary-200">' + escapeHtml(d.code) + '</span>' : '') +
            '<span class="shrink-0 rounded bg-gray-100 px-1.5 text-xs text-gray-700 dark:bg-gray-700 dark:text-gray-200">' + escapeHtml(d.kind) + '</span></span>' +
            (d.description ? '<span class="block truncate text-xs text-gray-600 dark:text-gray-300">' + escapeHtml(d.description) + '</span>' : '') +
            '</li>';
        }).join('');
        var n = found.total;
        var noun = n === 1 ? ' výsledek' : n >= 2 && n <= 4 ? ' výsledky' : ' výsledků';
        if (n > list.length) {
          results.insertAdjacentHTML('beforeend', '<li class="px-4 py-2 text-xs text-gray-600 dark:text-gray-300" aria-hidden="true">Zobrazeno ' + list.length + ' z ' + n + noun + '; upřesněte dotaz.</li>');
        }
        announce(n + noun + (n > list.length ? ', zobrazeno ' + list.length : '') + ', šipkami vyberte, Enter otevře');
      }
      results.classList.remove('hidden');
      input.setAttribute('aria-expanded', 'true');
      active = -1;
      input.removeAttribute('aria-activedescendant');
    }

    function go(i) {
      var opts = options();
      var o = opts[i < 0 ? 0 : i];
      if (o) window.location.href = o.getAttribute('data-href');
    }

    input.addEventListener('input', function () {
      clearTimeout(timer);
      var q = input.value.trim();
      timer = setTimeout(function () {
        if (q.length < 2 && !isCode(q)) { render({ hits: [], total: 0 }, ''); return; }
        announce('Hledám…');
        loadIndex().then(function (index) { render(search(index, q), q); }, function () {
          results.innerHTML = '<li class="px-4 py-3 text-red-700 dark:text-red-400">Index vyhledávání se nepodařilo načíst. Zkuste to znovu.</li>';
          results.classList.remove('hidden');
          input.setAttribute('aria-expanded', 'true');
          announce('Chyba načtení vyhledávání');
        });
      }, 120);
    });
    input.addEventListener('focus', function () { loadIndex().catch(function () {}); });
    input.addEventListener('keydown', function (e) {
      if (e.key === 'ArrowDown') { e.preventDefault(); highlight(active + 1); }
      else if (e.key === 'ArrowUp') { e.preventDefault(); highlight(active - 1); }
      else if (e.key === 'Enter') { e.preventDefault(); go(active); }
      else if (e.key === 'Escape') {
        if (input.getAttribute('aria-expanded') === 'true') { close(); }
        else { input.value = ''; render([], ''); input.blur(); }
      }
    });
    results.addEventListener('mousedown', function (e) {
      var o = e.target.closest('[role="option"]');
      if (o) { e.preventDefault(); window.location.href = o.getAttribute('data-href'); }
    });
    form.addEventListener('submit', function (e) { e.preventDefault(); go(active); });
    document.addEventListener('click', function (e) { if (!form.contains(e.target)) close(); });
  });

  // "/" and Ctrl/Cmd+K belong to the command palette (static/js/viz/paleta.js), which searches
  // the same index; the navbar combobox is reached by Tab or by a click.

  // --- Sidebar: Flowbite Drawer owns open/close, Escape, backdrop and body scroll. ------------
  // This bridge only keeps the accessibility state right: on the desktop shell (lg) the sidebar
  // is always visible, so it must not be aria-hidden; on mobile a closed drawer is inert (its
  // links leave the tab order) and opening it moves focus in, closing returns focus to the
  // toggle. Owners: this bridge writes only aria-hidden, inert and focus on #sidebar; the inline
  // script in partials/sidebar.html owns the remembered group collapse (aria-expanded and
  // hidden on [data-nav-group] lists) and scrolling to the active item.
  var sidebar = document.getElementById('sidebar');
  var sidebarToggle = document.getElementById('toggleSidebarMobile');
  var desktopMq = window.matchMedia('(min-width: 1024px)');
  // Attributes are written only when they change: a MutationObserver watches them, and an
  // unconditional write would notify it again forever.
  function setAttr(name, value) {
    if (value === null) { if (sidebar.hasAttribute(name)) sidebar.removeAttribute(name); }
    else if (sidebar.getAttribute(name) !== value) sidebar.setAttribute(name, value);
  }
  function syncSidebar() {
    if (!sidebar) return;
    if (desktopMq.matches) {
      setAttr('aria-hidden', null);
      setAttr('inert', null);
    } else {
      var closed = sidebar.getAttribute('aria-hidden') === 'true' || sidebar.classList.contains('-translate-x-full');
      setAttr('inert', closed ? '' : null);
      if (closed) setAttr('aria-hidden', 'true');
    }
  }
  if (sidebar) {
    var wasOpen = false;
    new MutationObserver(function () {
      syncSidebar();
      if (desktopMq.matches) return;
      var open = !sidebar.hasAttribute('inert');
      if (open && !wasOpen) {
        var first = sidebar.querySelector('#mobile-search, a[href]');
        if (first && document.activeElement !== document.getElementById('mobile-search')) first.focus();
      } else if (!open && wasOpen && sidebarToggle && sidebar.contains(document.activeElement)) {
        sidebarToggle.focus();
      } else if (!open && wasOpen && sidebarToggle && document.activeElement === document.body) {
        sidebarToggle.focus();
      }
      wasOpen = open;
    }).observe(sidebar, { attributes: true, attributeFilter: ['aria-hidden', 'class'] });  // not 'inert': we write it
    (desktopMq.addEventListener ? desktopMq.addEventListener('change', syncSidebar) : desktopMq.addListener(syncSidebar));
    window.addEventListener('load', syncSidebar);
    syncSidebar();
  }

  // --- Wide tables and code: a focusable, labelled scroll region (WCAG scrollable-region) ------
  document.querySelectorAll('.format table').forEach(function (t, i) {
    if (t.parentElement && t.parentElement.classList.contains('kea-table-scroll')) return;
    var wrap = document.createElement('div');
    wrap.className = 'kea-table-scroll';
    wrap.setAttribute('role', 'region');
    wrap.setAttribute('tabindex', '0');
    var cap = t.querySelector('caption');
    var head = t.querySelector('th');
    wrap.setAttribute('aria-label', 'Tabulka ' + (i + 1) + (cap ? ': ' + cap.textContent.trim() : head ? ': ' + head.textContent.trim() : ''));
    t.parentNode.insertBefore(wrap, t);
    wrap.appendChild(t);
  });
  document.querySelectorAll('.format pre').forEach(function (pre) {
    if (pre.scrollWidth > pre.clientWidth) { pre.setAttribute('tabindex', '0'); pre.setAttribute('role', 'region'); pre.setAttribute('aria-label', 'Ukázka kódu'); }
  });

  // --- Reading aids: current heading in the outline, heading links, progress, back to top -----
  var article = document.querySelector('article .format');
  if (article) {
    var heads = Array.prototype.slice.call(article.querySelectorAll('h2[id], h3[id]'));
    var tocLinks = Array.prototype.slice.call(document.querySelectorAll('[data-toc] a[href^="#"]'));
    heads.forEach(function (h) {
      var a = document.createElement('a');
      a.href = '#' + h.id;
      a.className = 'kea-anchor ml-2 text-gray-500 no-underline opacity-0 transition-opacity group-hover:opacity-100 focus:opacity-100 dark:text-gray-400';
      a.setAttribute('aria-label', 'Odkaz na oddíl ' + h.textContent.trim());
      a.textContent = '#';
      a.addEventListener('click', function () {
        try { navigator.clipboard.writeText(location.href.split('#')[0] + '#' + h.id); } catch (err) { /* optional */ }
      });
      h.classList.add('group', 'scroll-mt-24');
      h.appendChild(a);
    });
    if (tocLinks.length && 'IntersectionObserver' in window) {
      var byId = {};
      tocLinks.forEach(function (l) { byId[decodeURIComponent(l.getAttribute('href').slice(1))] = l; });
      var visibleHeads = {};
      var spy = new IntersectionObserver(function (entries) {
        entries.forEach(function (en) { visibleHeads[en.target.id] = en.isIntersecting; });
        var currentId = null;
        for (var i = 0; i < heads.length; i++) {
          if (heads[i].getBoundingClientRect().top < 140) currentId = heads[i].id;
        }
        tocLinks.forEach(function (l) {
          var on = byId[currentId] === l;
          l.classList.toggle('font-semibold', on);
          l.classList.toggle('text-primary-700', on);
          l.classList.toggle('dark:text-primary-400', on);
          if (on) l.setAttribute('aria-current', 'location'); else l.removeAttribute('aria-current');
        });
      }, { rootMargin: '-80px 0px -60% 0px', threshold: [0, 1] });
      heads.forEach(function (h) { spy.observe(h); });
    }
    var bar = document.querySelector('[data-reading-progress]');
    var topBtn = document.querySelector('[data-back-to-top]');
    var ticking = false;
    window.addEventListener('scroll', function () {
      if (ticking) return;
      ticking = true;
      requestAnimationFrame(function () {
        var rect = article.getBoundingClientRect();
        var total = rect.height - window.innerHeight * 0.6;
        var done = Math.min(1, Math.max(0, -rect.top / (total > 0 ? total : 1)));
        if (bar) bar.style.transform = 'scaleX(' + done + ')';
        if (topBtn) topBtn.classList.toggle('hidden', window.scrollY < 800);
        ticking = false;
      });
    }, { passive: true });
    if (topBtn) topBtn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 'auto' : 'smooth' });
      var main = document.getElementById('main');
      if (main) main.focus({ preventScroll: true });
    });
  }

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
    loadIndex().then(function (index) {
      var byTitle = {};
      index.docs.forEach(function (d) { if (!byTitle[d.t]) byTitle[d.t] = d; });
      unlinked.forEach(function (g) {
        var label = J.normalise(g.textContent || '');
        var d = byTitle[label];
        if (d && J.normalise(href(d.url)) !== J.normalise(window.location.pathname)) makeClickable(g, href(d.url), d.title);
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
