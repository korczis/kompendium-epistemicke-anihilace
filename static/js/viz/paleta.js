// Příkazová paleta: ⌘K / Ctrl K, „/“ mimo pole formuláře a tlačítko v horní liště.
// Hledá ve stránkách, v kódech technik a v akcích nad jediným rejstříkem webu
// static/data/search.json (oddíly, příchozí odkazy, štítky; scripts/build-ui-data.py).
// Nic těžkého se nenačte, dokud se paleta poprvé neotevře. Markup a třídy jsou
// v templates/partials/paleta.html; tady se jen klonují šablony.
(function () {
  'use strict';

  var root = document.querySelector('[data-paleta]');
  var cfgEl = document.querySelector('script[data-paleta-config]');
  if (!root || !cfgEl) return;

  var body = document.body;
  var cfg = {};
  try { cfg = JSON.parse(cfgEl.textContent); } catch (e) { cfg = { apps: [] }; }

  var dialog = root.querySelector('[data-paleta-dialog]');
  var input = root.querySelector('[data-paleta-input]');
  var results = root.querySelector('[data-paleta-results]');
  var status = root.querySelector('[data-paleta-status]');
  var MAX_RESULTS = 40;
  var MAX_PER_GROUP = 15;
  var RECENT_KEY = 'kea-recent';
  var RECENT_MAX = 8;
  var isMac = /Mac|iPhone|iPad|iPod/.test(navigator.platform || navigator.userAgent || '');

  var base = (body.getAttribute('data-base-url') || '').replace(/\/$/, '');
  var basePath = base.replace(/^https?:\/\/[^/]+/, '');

  // --- Pomocné funkce ----------------------------------------------------------------------
  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function words(s) {
    return s.split(/[^a-z0-9]+/).filter(Boolean);
  }

  function href(path) {
    if (/^https?:/.test(path)) return path;
    return path.indexOf(basePath + '/') === 0 ? path : basePath + path;
  }

  // Cesta stránky bez základní cesty webu, vždy se lomítkem na konci (klíč pro spojení dat).
  function key(url) {
    var p = String(url || '').replace(/^https?:\/\/[^/]+/, '').replace(/[?#].*$/, '');
    if (basePath && p.indexOf(basePath + '/') === 0) p = p.slice(basePath.length);
    if (p.slice(-1) !== '/' && !/\.[a-z0-9]+$/i.test(p)) p += '/';
    return p || '/';
  }

  function tpl(name) {
    var t = document.querySelector('template[data-paleta-tpl="' + name + '"]');
    return t.content.firstElementChild.cloneNode(true);
  }

  function icon(kind) {
    var t = document.querySelector('template[data-paleta-icon="' + kind + '"]') ||
      document.querySelector('template[data-paleta-icon="page"]');
    return t.content.firstElementChild.cloneNode(true);
  }

  // Kód techniky ve tvaru 1.2.2 z „EA-1.2.2“, „ea-1-2-2“, „ea 1.2.2“ nebo z adresy.
  var CODE_RE = /(?:^|[^a-z0-9])ea[\s._-]*(\d+(?:[._-]\d+)*)/;
  function codeOf(title, url) {
    var m = CODE_RE.exec(fold(title)) || /\/(?:qr-)?ea-(\d+(?:-\d+)*)(?:-|\/|$)/.exec(url || '');
    return m ? m[1].replace(/[._-]/g, '.') : '';
  }

  // Kód v dotazu: s předponou „ea“ stačí jedna úroveň, bez ní aspoň dvě (1.2, 1.2.2).
  function queryCode(q) {
    var m = /(?:^|\s)(ea[\s._-]*)?(\d+(?:[\s._-]+\d+)*)(?=\s|$)/.exec(q);
    if (!m) return null;
    var parts = m[2].split(/[\s._-]+/);
    if (!m[1] && parts.length < 2) return null;
    return { code: parts.join('.'), rest: (q.slice(0, m.index) + ' ' + q.slice(m.index + m[0].length)).trim() };
  }

  // --- Nedávné stránky (localStorage, jen pohodlí čtenáře) ---------------------------------
  function readRecent() {
    try {
      var list = JSON.parse(localStorage.getItem(RECENT_KEY) || '[]');
      return Array.isArray(list) ? list.filter(function (r) { return r && r.u && r.t; }) : [];
    } catch (e) { return []; }
  }

  function pageTitle() {
    return document.title.split(' · ')[0].replace(/\s+/g, ' ').trim().slice(0, 160);
  }

  function recordVisit() {
    if (!cfg.record) return;
    try {
      var u = key(location.pathname);
      var list = readRecent().filter(function (r) { return r.u !== u; });
      list.unshift({ u: u, t: pageTitle() });
      localStorage.setItem(RECENT_KEY, JSON.stringify(list.slice(0, RECENT_MAX)));
    } catch (e) {}
  }

  // --- Data ---------------------------------------------------------------------------------
  // Jediný rejstřík webu: static/data/search.json (scripts/build-ui-data.py), týž, který čte
  // vyhledávání v horní liště. Nese kód EA, oddíl, počet příchozích odkazů i štítky, takže
  // paleta nepotřebuje rejstřík Zoly ani graf knihy.
  var dataPromise = null;
  var docs = null;

  // Zdrojová cesta stránky z adresy a druhu souboru (0 stránka.md, 1 _index.md, 2 index.md).
  function sourcePath(url, file) {
    var p = key(url).replace(/^\/|\/$/g, '');
    if (file === 1) return p ? p + '/_index.md' : '_index.md';
    return file === 2 ? p + '/index.md' : p + '.md';
  }

  // Oddíl stránky stejně jako scripts/ia_model.py (section_of).
  function sectionOf(path) {
    var parts = path.split('/');
    if (parts[0] === 'kompendium' && parts.length > 2) return 'kompendium/' + parts[1];
    return parts.length > 1 ? parts[0] : 'root';
  }

  function fallbackLabel(section) {
    return section.split('/').pop().replace(/^\d+-/, '').replace(/-/g, ' ');
  }

  function makeDoc(o) {
    var t = fold(o.title);
    o.t = t;
    o.tw = words(t);
    o.hay = fold(o.title + ' ' + (o.description || '') + ' ' + (o.keywords || '') + ' ' + (o.badge || ''));
    o.hw = words(o.hay);
    o.code = o.code || '';
    o.inLinks = o.inLinks || 0;
    return o;
  }

  function loadData() {
    if (dataPromise) return dataPromise;
    dataPromise = fetch(body.getAttribute('data-search-index')).then(function (r) {
      if (!r.ok) throw new Error('Rejstřík hledání: HTTP ' + r.status);
      return r.json();
    }).then(function (data) {
      var f = {};
      data.fields.forEach(function (name, i) { f[name] = i; });
      var labels = data.sections || {};
      var appKeys = {};
      (cfg.apps || []).forEach(function (a) { appKeys[key(a.url)] = true; });
      var byKey = {};
      var seen = {};
      var list = [];
      data.entries.forEach(function (e) {
        var k = key(e[f.url]);
        var title = e[f.title];
        var path = sourcePath(e[f.url], e[f.file]);
        byKey[k] = { path: path };
        if (seen[k] || appKeys[k] || !title) return;
        seen[k] = true;
        var section = sectionOf(path);
        var code = codeOf(title, k) || String(e[f.code] || '').replace(/^ea-?/i, '');
        var kind = 'page';
        if (e[f.file] === 1) kind = 'section';
        else if (code || section === 'kompendium/techniques') kind = 'technique';
        else if (section === 'glossary') kind = 'glossary';
        list.push(makeDoc({
          kind: kind, title: title, description: e[f.description] || '', url: href(k), k: k,
          badge: labels[section] || fallbackLabel(section), code: code, inLinks: e[f['in']] || 0,
          keywords: (e[f.tags] || []).join(' '), path: path,
        }));
      });
      docs = { list: list, byKey: byKey };
      return docs;
    });
    dataPromise.catch(function () { dataPromise = null; });
    return dataPromise;
  }

  // --- Akce a stránky aplikace --------------------------------------------------------------
  function toggleTheme() {
    var btn = document.getElementById('theme-toggle');
    if (btn) { btn.click(); return; }
    var dark = document.documentElement.classList.toggle('dark');
    try { localStorage.setItem('color-theme', dark ? 'dark' : 'light'); } catch (e) {}
    document.dispatchEvent(new Event('dark-mode'));
  }

  function currentNode(d) {
    return d && d.byKey[key(location.pathname)];
  }

  var ACTIONS = [
    makeDoc({ kind: 'action', id: 'theme', title: 'Přepnout světlý/tmavý režim', keywords: 'tema motiv dark light tmavy svetly rezim barvy',
      description: 'Změní barevný režim celého webu', run: function () { close(false); toggleTheme(); } }),
    makeDoc({ kind: 'action', id: 'mapa', title: 'Otevřít aktuální stránku v Mapě knihy', keywords: 'mapa graf okoli sousede odkazy',
      description: 'Okolí této stránky v síti odkazů', run: function (newTab) {
        loadData().catch(function () { return null; }).then(function (d) {
          var n = currentNode(d);
          go(cfg.mapa + (n ? '?stranka=' + encodeURIComponent(n.path) : ''), newTab);
        });
      } }),
    makeDoc({ kind: 'action', id: 'random', title: 'Náhodná stránka', keywords: 'nahoda nahodny objevovat random',
      description: 'Otevře náhodně vybranou stránku knihy', run: function (newTab) {
        loadData().then(function (d) {
          var pool = d.list.filter(function (x) { return x.kind !== 'section' && x.k !== key(location.pathname); });
          if (pool.length) go(pool[Math.floor(Math.random() * pool.length)].url, newTab);
        }).catch(function () {});
      } }),
  ];

  var APPS = (cfg.apps || []).map(function (a) {
    return makeDoc({ kind: 'app', title: a.title, description: a.hint, keywords: a.keywords, url: a.url, k: key(a.url) });
  });

  // --- Hledání a řazení ---------------------------------------------------------------------
  var GROUPS = [
    { kind: 'recent', label: 'Nedávno navštívené' },
    { kind: 'action', label: 'Akce' },
    { kind: 'app', label: 'Stránky aplikace' },
    { kind: 'section', label: 'Kapitoly a oddíly' },
    { kind: 'technique', label: 'Techniky' },
    { kind: 'glossary', label: 'Pojmy glosáře' },
    { kind: 'page', label: 'Ostatní stránky' },
  ];

  function termScore(d, term) {
    if (d.t === term) return 14;
    if (d.t.indexOf(term) === 0) return 10;
    var w = false;
    var wp = false;
    for (var i = 0; i < d.tw.length; i++) {
      if (d.tw[i] === term) { w = true; break; }
      if (d.tw[i].indexOf(term) === 0) wp = true;
    }
    if (w) return 8;
    if (wp) return 6;
    if (d.t.indexOf(term) !== -1) return 3;
    for (var j = 0; j < d.hw.length; j++) if (d.hw[j].indexOf(term) === 0) return 2;
    return d.hay.indexOf(term) !== -1 ? 1 : 0;
  }

  function score(d, terms, qc) {
    var s = 0;
    if (qc) {
      if (!d.code) return 0;
      if (d.code === qc) s += 30;
      else if (d.code.indexOf(qc + '.') === 0) s += 12;
      else return 0;
    }
    for (var i = 0; i < terms.length; i++) {
      var ts = termScore(d, terms[i]);
      if (!ts) return 0;
      s += ts;
    }
    return s;
  }

  function search(q) {
    var fq = fold(q).trim();
    var qc = queryCode(fq);
    var terms = words(qc ? qc.rest : fq).filter(function (t) { return !(qc && t === 'ea'); });
    if (!qc && !terms.length) return [];
    var pool = ACTIONS.concat(APPS, docs ? docs.list : []);
    var hits = [];
    for (var i = 0; i < pool.length; i++) {
      var s = score(pool[i], terms, qc && qc.code);
      if (s) hits.push({ d: pool[i], s: s });
    }
    hits.sort(function (a, b) {
      return b.s - a.s || b.d.inLinks - a.d.inLinks || a.d.title.length - b.d.title.length;
    });
    return hits.map(function (h) { return { d: h.d, s: h.s }; });
  }

  // Výsledky do skupin; skupiny řadí jejich nejlepší výsledek, takže první řádek je nejlepší shoda.
  function grouped(hits) {
    var by = {};
    var best = {};
    var total = 0;
    hits.forEach(function (h) {
      var k = h.d.kind;
      by[k] = by[k] || [];
      if (by[k].length >= MAX_PER_GROUP || total >= MAX_RESULTS) return;
      by[k].push(h.d);
      total++;
      if (!(k in best)) best[k] = h.s;
    });
    return GROUPS.map(function (g, i) { return { g: g, i: i, items: by[g.kind] || [], best: best[g.kind] || 0 }; })
      .filter(function (x) { return x.items.length; })
      .sort(function (a, b) { return b.best - a.best || a.i - b.i; });
  }

  function emptyQueryGroups() {
    var here = key(location.pathname);
    var recent = readRecent().filter(function (r) { return r.u !== here; }).map(function (r) {
      var d = docs && docs.list.filter(function (x) { return x.k === r.u; })[0];
      return { kind: 'recent', title: r.t, url: href(r.u), description: '', badge: d ? d.badge : '' };
    });
    return [
      { g: GROUPS[0], items: recent },
      { g: GROUPS[2], items: APPS },
      { g: GROUPS[1], items: ACTIONS },
    ].filter(function (x) { return x.items.length; });
  }

  // --- Vykreslení ---------------------------------------------------------------------------
  var rows = [];
  var active = -1;
  var renderSeq = 0;

  function setStatus(text) { status.textContent = text; }

  function showState(name, title, text) {
    results.innerHTML = '';
    rows = [];
    active = -1;
    input.removeAttribute('aria-activedescendant');
    var el = tpl(name);
    if (title) el.querySelector('[data-paleta-empty-title]').textContent = title;
    if (text) el.querySelector('[data-paleta-empty-text]').textContent = text;
    results.appendChild(el);
  }

  function renderGroups(groups) {
    results.innerHTML = '';
    rows = [];
    var n = 0;
    groups.forEach(function (grp, gi) {
      var g = tpl('group');
      var labelId = 'paleta-g' + gi;
      var lab = g.querySelector('[data-paleta-group-label]');
      lab.id = labelId;
      lab.textContent = grp.g.label;
      g.setAttribute('aria-labelledby', labelId);
      grp.items.forEach(function (d) {
        var row = tpl('row');
        row.id = 'paleta-r' + (n++);
        if (d.url) row.href = d.url; else row.removeAttribute('href');
        row.querySelector('[data-paleta-icon]').appendChild(icon(d.kind));
        row.querySelector('[data-paleta-title]').textContent = d.title;
        var sub = row.querySelector('[data-paleta-sub]');
        if (d.description) sub.textContent = d.description; else sub.remove();
        var badge = row.querySelector('[data-paleta-badge]');
        if (d.badge) { badge.textContent = d.badge; badge.classList.remove('hidden'); }
        else badge.remove();
        row._paleta = d;
        g.appendChild(row);
        rows.push(row);
      });
      results.appendChild(g);
    });
    setActive(rows.length ? 0 : -1, false);
    setStatus(rows.length + ' ' + (rows.length === 1 ? 'výsledek' : rows.length < 5 && rows.length ? 'výsledky' : 'výsledků'));
  }

  function render() {
    var q = input.value;
    var seq = ++renderSeq;
    pending = false;
    if (!q.trim()) { renderGroups(emptyQueryGroups()); return; }
    if (!docs) {
      showState('loading');
      loadData().then(function () {
        if (seq !== renderSeq) return;
        render();
        if (enterAfterLoad && rows.length) activate(0, enterAfterLoad.tab);
        enterAfterLoad = null;
      }, function (e) {
        if (seq !== renderSeq) return;
        // Bez dat aspoň akce a stránky aplikace; jinak chybový stav.
        var g = grouped(search(q));
        if (g.length) renderGroups(g);
        else showState('empty', 'Rejstřík se nepodařilo načíst', e.message);
      });
      return;
    }
    var groups = grouped(search(q));
    if (!groups.length) {
      showState('empty', 'Nic nenalezeno', 'Zkuste jiné slovo, kód techniky (např. EA-1.2.2) nebo název pojmu.');
      setStatus('Nic nenalezeno');
      return;
    }
    renderGroups(groups);
  }

  function setActive(i, scroll) {
    if (active >= 0 && rows[active]) rows[active].setAttribute('aria-selected', 'false');
    active = i;
    if (i < 0 || !rows[i]) { input.removeAttribute('aria-activedescendant'); return; }
    rows[i].setAttribute('aria-selected', 'true');
    input.setAttribute('aria-activedescendant', rows[i].id);
    if (scroll !== false) rows[i].scrollIntoView({ block: 'nearest' });
  }

  function go(url, newTab) {
    if (newTab) { window.open(url, '_blank', 'noopener'); return; }
    close(false);
    window.location.href = url;
  }

  function activate(i, newTab) {
    var row = rows[i];
    if (!row) return;
    var d = row._paleta;
    if (d.run) d.run(newTab);
    else if (d.url) go(d.url, newTab);
  }

  // --- Otevření, zavření, past na fokus -----------------------------------------------------
  var opener = null;
  var timer = null;
  var pending = false;
  var enterAfterLoad = null;

  function isOpen() { return !root.classList.contains('hidden'); }

  function open() {
    if (isOpen()) { input.select(); return; }
    opener = document.activeElement && document.activeElement !== body ? document.activeElement : null;
    root.classList.remove('hidden');
    root.setAttribute('aria-hidden', 'false');
    body.style.overflow = 'hidden';
    document.querySelectorAll('[data-paleta-open]').forEach(function (b) { b.setAttribute('aria-expanded', 'true'); });
    input.value = '';
    render();
    input.focus();
    loadData().then(function () { if (!input.value.trim() && isOpen()) render(); }).catch(function () {});
  }

  function close(restore) {
    if (!isOpen()) return;
    root.classList.add('hidden');
    root.setAttribute('aria-hidden', 'true');
    body.style.overflow = '';
    document.querySelectorAll('[data-paleta-open]').forEach(function (b) { b.setAttribute('aria-expanded', 'false'); });
    if (restore !== false && opener && document.contains(opener)) opener.focus();
    opener = null;
  }

  function focusables() {
    return Array.prototype.filter.call(
      dialog.querySelectorAll('input, button, [href]:not([tabindex="-1"]), [tabindex]:not([tabindex="-1"])'),
      function (el) { return !el.disabled && el.offsetParent !== null; });
  }

  input.addEventListener('input', function () {
    clearTimeout(timer);
    pending = true;
    enterAfterLoad = null;
    timer = setTimeout(render, docs ? 40 : 0);
  });

  dialog.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); return; }
    if (e.key === 'Tab') {
      var f = focusables();
      if (!f.length) return;
      var first = f[0];
      var last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
      return;
    }
    if (e.target !== input) return;
    if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
      e.preventDefault();
      if (!rows.length) return;
      var step = e.key === 'ArrowDown' ? 1 : -1;
      setActive((active + step + rows.length) % rows.length);
    } else if ((e.key === 'Home' && e.ctrlKey) || e.key === 'PageUp') {
      if (rows.length) { e.preventDefault(); setActive(0); }
    } else if ((e.key === 'End' && e.ctrlKey) || e.key === 'PageDown') {
      if (rows.length) { e.preventDefault(); setActive(rows.length - 1); }
    } else if (e.key === 'Enter' && !e.isComposing) {
      e.preventDefault();
      var newTab = e.metaKey || e.ctrlKey;
      if (pending) { clearTimeout(timer); render(); } // Enter míří na aktuální dotaz
      if (!rows.length && !docs && input.value.trim()) { enterAfterLoad = { tab: newTab }; return; }
      activate(active < 0 ? 0 : active, newTab);
    }
  });

  results.addEventListener('mousemove', function (e) {
    var row = e.target.closest('[role="option"]');
    var i = rows.indexOf(row);
    if (i !== -1 && i !== active) setActive(i, false);
  });

  results.addEventListener('click', function (e) {
    var row = e.target.closest('[role="option"]');
    var i = rows.indexOf(row);
    if (i === -1) return;
    var d = row._paleta;
    var newTab = e.metaKey || e.ctrlKey || e.shiftKey || e.button === 1;
    if (d.run) { e.preventDefault(); d.run(newTab); return; }
    if (newTab) return; // nechat prohlížeč otevřít odkaz v nové kartě
    close(false);
  });

  root.querySelector('[data-paleta-backdrop]').addEventListener('click', function () { close(); });
  root.querySelector('[data-paleta-close]').addEventListener('click', function () { close(); });
  root.addEventListener('mousedown', function (e) {
    // Kliknutí mimo panel (do okolí na širokém displeji) zavře paletu.
    if (!dialog.contains(e.target)) { e.preventDefault(); close(); }
  });

  function typingIn(el) {
    if (!el || el === body) return false;
    var tag = el.tagName;
    return tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT' || el.isContentEditable;
  }

  document.addEventListener('keydown', function (e) {
    var k = e.key && e.key.toLowerCase();
    if (k === 'k' && (e.metaKey || e.ctrlKey) && !e.altKey && !e.shiftKey) {
      e.preventDefault();
      if (isOpen()) close(); else open();
    } else if (e.key === '/' && !e.metaKey && !e.ctrlKey && !e.altKey && !isOpen() && !typingIn(e.target)) {
      e.preventDefault();
      open();
    }
  });

  document.querySelectorAll('[data-paleta-open]').forEach(function (b) {
    b.addEventListener('click', function (e) { e.preventDefault(); open(); });
  });

  // Klávesová nápověda podle platformy.
  document.querySelectorAll('[data-paleta-mod]').forEach(function (el) { el.textContent = isMac ? '⌘' : 'Ctrl'; });
  document.querySelectorAll('[data-paleta-shortcut]').forEach(function (el) { el.textContent = isMac ? '⌘K' : 'Ctrl K'; });
  document.querySelectorAll('[data-paleta-open]').forEach(function (b) {
    b.setAttribute('aria-keyshortcuts', isMac ? 'Meta+K /' : 'Control+K /');
  });

  recordVisit();
})();
