// Redakční přehled ve Stavu knihy (/stav/): oddíl → stránka → co chybí. Data jsou
// static/data/ia.json (kompendium-ia/v1), které při sestavení odvozuje scripts/build-graph.py
// z pravidel brány scripts/check-ia.py. Graf (ECharts) ukazuje otevřené nálezy podle oddílů
// a pravidel, dlaždice pravidel slouží jako legenda i filtr, pracovní seznam se filtruje,
// hledá, řadí a stránkuje; stav se zrcadlí do URL (?pravidlo=, ?oddil=, ?jazyk=, ?q=,
// ?razeni=, ?strana=). Data se načtou, až se karta přiblíží k výřezu.
// Třídy Tailwindu jsou jen v šabloně (templates/stav.html): řádky, karty, odznaky a dlaždice
// se klonují z jejích <template>.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');
  var PAGE = 25;
  var TOP = 20;
  var SORTS = ['nalezy', 'slova', 'odkazy'];
  var LANGS = { cs: 'čeština', en: 'angličtina' };

  // Pravidla v pořadí scripts/check-ia.py; popis říká, co pravidlo vyžaduje. Barvy jsou
  // z palety KompendiumViz a v grafu i v odznacích stejné.
  var RULES = [
    ['front-matter', '#14b8a6', 'stránka má čitelnou hlavičku (front matter) s titulkem'],
    ['toml', '#84cc16', 'hlavička je v TOML (+++), jako na všech ostatních stránkách'],
    ['description', '#f59e0b', 'popis v hlavičce (ne pod [extra]) má 50–200 znaků'],
    ['tags', '#06b6d4', 'aspoň jeden štítek v [taxonomies] (ne pod [extra]); úvody oddílů jsou výjimkou'],
    ['czech', '#ec4899', 'text je česky: českých funkčních slov je víc než anglických (stránky od 50 slov)'],
    ['diacritics', '#a855f7', 'český text píše s diakritikou aspoň 3 % slov (stránky od 50 slov)'],
    ['related', '#10b981', 'stránka má sekci „## Související“; úvody oddílů jsou výjimkou'],
    ['links-out', '#0ea5e9', 'aspoň 3 interní odkazy @/ na existující stránky; úvody oddílů jsou výjimkou'],
    ['not-orphan', '#ef4444', 'na stránku odkazuje aspoň jedna jiná stránka; úvody oddílů jsou výjimkou'],
    ['broken-link', '#f97316', 'žádný odkaz @/ nevede na stránku, která neexistuje'],
    ['detail', '#4f46e5', 'stránka má aspoň 600 slov (karta rychlé reference 250, úvod oddílu 300); stránky s vlastní šablonou jsou výjimkou'],
    ['generated', '#64748b', 'žádný strojově vytvořený text: blok NLLB, strukturální stub, zástupná poznámka ani šablona „pojem v sekci … znalostní báze Prismatic Platform“'],
    ['term-page', '#eab308', 'každý pojem z rejstříku pojmů (08-prilohy/index-pojmu.md) má vlastní stránku v glosáři nebo v katalogu technik'],
  ];
  var RULE = {};
  RULES.forEach(function (r, i) { RULE[r[0]] = { id: r[0], color: r[1], text: r[2], order: i }; });

  var root = document.getElementById('redakce');
  if (!root || !V) return;

  function $(id) { return document.getElementById(id); }

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  }

  // České tvary: 1 stránka, 2–4 stránky, 5 a víc stránek.
  function plural(n, forms) {
    var w = n === 1 ? forms[0] : (n >= 2 && n <= 4 ? forms[1] : forms[2]);
    return nf.format(n) + ' ' + w;
  }

  function clone(id) {
    return $(id).content.firstElementChild.cloneNode(true);
  }

  function part(node, key) { return node.querySelector('[data-k="' + key + '"]'); }

  function params() {
    try { return new URLSearchParams(window.location.search); } catch (e) { return new URLSearchParams(); }
  }

  function reducedMotion() {
    return window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  }

  var state = { rule: '', section: '', lang: '', q: '', sort: 'nalezy', page: 1 };
  var items = [];
  var sections = [];
  var sectionSet = {};
  var chart = null;
  var chartRows = [];
  var activeRules = [];
  var data = null;

  // --- Data -----------------------------------------------------------------------------

  function prepare(d) {
    data = d;
    var bySection = {};
    d.pages.forEach(function (p) {
      var s = bySection[p.section] = bySection[p.section] || { id: p.section, open: 0, findings: 0, rules: {} };
      if (!p.violations.length) return;
      s.open++;
      s.findings += p.violations.length;
      p.violations.forEach(function (r) { s.rules[r] = (s.rules[r] || 0) + 1; });
      items.push({
        title: p.title || p.path, path: p.path, url: V.basePath + p.url, section: p.section,
        rules: p.violations.slice().sort(function (a, b) { return (RULE[a] ? RULE[a].order : 99) - (RULE[b] ? RULE[b].order : 99); }),
        words: p.words, lang: p.lang, in: p.in, out: p.out,
        hay: fold(p.title + ' ' + p.path), sortTitle: fold(p.title || p.path),
      });
    });
    // Pojmy bez vlastní stránky nejsou stránky; v seznamu je zastupuje rejstřík pojmů.
    var terms = d.terms_without_page || [];
    if (terms.length) {
      var idx = 'kompendium/08-prilohy';
      var s = bySection[idx] = bySection[idx] || { id: idx, open: 0, findings: 0, rules: {} };
      terms.forEach(function (slug) {
        s.open++;
        s.findings++;
        s.rules['term-page'] = (s.rules['term-page'] || 0) + 1;
        items.push({
          title: 'Pojem bez stránky: ' + slug, path: 'term:' + slug,
          url: V.basePath + '/kompendium/08-prilohy/index-pojmu/', section: idx, rules: ['term-page'],
          words: null, lang: 'cs', in: null, out: null, hay: fold(slug), sortTitle: fold(slug),
        });
      });
    }
    sections = Object.keys(bySection).map(function (k) { return bySection[k]; });
    sections.forEach(function (s) { sectionSet[s.id] = s; });
    activeRules = RULES.map(function (r) { return r[0]; }).filter(function (r) { return (d.rules || {})[r] > 0; });
  }

  // --- Filtr ----------------------------------------------------------------------------

  function filtered() {
    var terms = fold(state.q).split(/\s+/).filter(Boolean);
    var rows = items.filter(function (it) {
      if (state.rule && it.rules.indexOf(state.rule) < 0) return false;
      if (state.section && it.section !== state.section) return false;
      if (state.lang && it.lang !== state.lang) return false;
      for (var i = 0; i < terms.length; i++) if (it.hay.indexOf(terms[i]) < 0) return false;
      return true;
    });
    var byTitle = function (a, b) { return a.sortTitle.localeCompare(b.sortTitle, 'cs'); };
    var n = function (v) { return v === null ? Infinity : v; };
    var cmp = {
      nalezy: function (a, b) { return b.rules.length - a.rules.length || n(a.words) - n(b.words) || byTitle(a, b); },
      slova: function (a, b) { return n(a.words) - n(b.words) || b.rules.length - a.rules.length || byTitle(a, b); },
      odkazy: function (a, b) { return n(a.in) - n(b.in) || b.rules.length - a.rules.length || byTitle(a, b); },
    }[state.sort];
    return rows.sort(cmp);
  }

  function active() { return !!(state.rule || state.section || state.lang || state.q.trim()); }

  function readUrl() {
    var p = params();
    state.q = p.get('q') || '';
    state.rule = RULE[p.get('pravidlo')] ? p.get('pravidlo') : '';
    state.section = sectionSet[p.get('oddil')] ? p.get('oddil') : '';
    state.lang = LANGS[p.get('jazyk')] ? p.get('jazyk') : '';
    state.sort = SORTS.indexOf(p.get('razeni')) >= 0 ? p.get('razeni') : 'nalezy';
    state.page = Math.max(1, parseInt(p.get('strana'), 10) || 1);
  }

  function hasUrlState() {
    var p = params();
    return ['pravidlo', 'oddil', 'jazyk', 'q', 'razeni', 'strana'].some(function (k) { return p.has(k); });
  }

  function syncUrl() {
    try {
      var p = params();
      var set = function (k, v) { if (v) p.set(k, v); else p.delete(k); };
      set('pravidlo', state.rule);
      set('oddil', state.section);
      set('jazyk', state.lang);
      set('q', state.q.trim());
      set('razeni', state.sort === 'nalezy' ? '' : state.sort);
      set('strana', state.page > 1 ? String(state.page) : '');
      var qs = p.toString();
      window.history.replaceState(null, '', window.location.pathname + (qs ? '?' + qs : '') + window.location.hash);
    } catch (e) { /* bez History API zůstane filtr jen na stránce */ }
  }

  function setState(patch, keepPage) {
    Object.keys(patch).forEach(function (k) { state[k] = patch[k]; });
    if (!keepPage) state.page = 1;
    render();
  }

  // --- Vykreslení -----------------------------------------------------------------------

  function sectionName(id) { return V.sectionLabel(id); }

  function badge(rule) {
    var b = clone('rd-tpl-odznak');
    var meta = RULE[rule] || { color: '#64748b', text: '' };
    part(b, 'tecka').style.background = meta.color;
    part(b, 'id').textContent = rule;
    b.title = rule + ': ' + meta.text;
    return b;
  }

  function fmt(v) { return v === null || v === undefined ? '—' : nf.format(v); }

  function renderRules() {
    var ul = $('rd-pravidla');
    ul.textContent = '';
    RULES.forEach(function (r) {
      var id = r[0];
      var count = (data.rules || {})[id] || 0;
      var li = clone('rd-tpl-pravidlo');
      var btn = li.querySelector('button');
      var pocet = part(li, 'pocet');
      part(li, 'tecka').style.background = RULE[id].color;
      part(li, 'id').textContent = id;
      part(li, 'popis').textContent = RULE[id].text;
      pocet.textContent = nf.format(count);
      pocet.className += ' ' + (count ? pocet.getAttribute('data-open') : pocet.getAttribute('data-zero'));
      btn.setAttribute('data-rule', id);
      btn.setAttribute('aria-label', id + ': ' + (count ? plural(count, ['otevřený nález', 'otevřené nálezy', 'otevřených nálezů']) : 'splněno všude') +
        '. Požadavek: ' + RULE[id].text + '. Filtrovat pracovní seznam podle tohoto pravidla.');
      btn.addEventListener('click', function () { setState({ rule: state.rule === id ? '' : id }); });
      ul.appendChild(li);
    });
  }

  function fillSelects() {
    var oddil = $('rd-oddil');
    sections.slice().sort(function (a, b) { return sectionName(a.id).localeCompare(sectionName(b.id), 'cs'); })
      .forEach(function (s) {
        oddil.appendChild(new Option(sectionName(s.id) + ' (' + nf.format(s.open) + ')', s.id));
      });
    var pravidlo = $('rd-pravidlo');
    RULES.forEach(function (r) {
      pravidlo.appendChild(new Option(r[0] + ' (' + nf.format((data.rules || {})[r[0]] || 0) + ')', r[0]));
    });
  }

  function renderControls() {
    if ($('rd-q').value !== state.q) $('rd-q').value = state.q;
    $('rd-oddil').value = state.section;
    $('rd-pravidlo').value = state.rule;
    $('rd-jazyk').value = state.lang;
    $('rd-razeni').value = state.sort;
    Array.prototype.forEach.call($('rd-pravidla').querySelectorAll('button[data-rule]'), function (b) {
      b.setAttribute('aria-pressed', b.getAttribute('data-rule') === state.rule ? 'true' : 'false');
    });
    var sortDir = { nalezy: 'descending', slova: 'ascending', odkazy: 'ascending' };
    Array.prototype.forEach.call(root.querySelectorAll('th[data-rd-sort]'), function (th) {
      var k = th.getAttribute('data-rd-sort');
      th.setAttribute('aria-sort', k === state.sort ? sortDir[k] : 'none');
    });
    var tags = $('rd-aktivni-stitky');
    tags.textContent = '';
    function tag(text) { var t = clone('rd-tpl-stitek'); t.textContent = text; tags.appendChild(t); }
    if (state.section) tag('oddíl: ' + sectionName(state.section));
    if (state.rule) tag('pravidlo: ' + state.rule);
    if (state.lang) tag('jazyk: ' + LANGS[state.lang]);
    if (state.q.trim()) tag('„' + state.q.trim() + '“');
    $('rd-aktivni').hidden = !active();
  }

  function renderList() {
    var rows = filtered();
    var pages = Math.max(1, Math.ceil(rows.length / PAGE));
    if (state.page > pages) state.page = pages;
    var from = (state.page - 1) * PAGE;
    var visible = rows.slice(from, from + PAGE);

    var tbody = $('rd-radky');
    var cards = $('rd-karty');
    tbody.textContent = '';
    cards.textContent = '';
    var fragRows = document.createDocumentFragment();
    var fragCards = document.createDocumentFragment();
    visible.forEach(function (it) {
      var tr = clone('rd-tpl-radek');
      var a = part(tr, 'odkaz');
      a.href = it.url;
      a.textContent = it.title;
      part(tr, 'cesta').textContent = it.path;
      part(tr, 'oddil').textContent = sectionName(it.section);
      part(tr, 'oddil').title = it.section;
      part(tr, 'slova').textContent = fmt(it.words);
      part(tr, 'odkazy').textContent = fmt(it.in) + ' / ' + fmt(it.out);
      var bs = part(tr, 'odznaky');
      it.rules.forEach(function (r) { bs.appendChild(badge(r)); });
      fragRows.appendChild(tr);

      var li = clone('rd-tpl-karta');
      var ca = part(li, 'odkaz');
      ca.href = it.url;
      ca.textContent = it.title;
      part(li, 'oddil').textContent = sectionName(it.section) + ' · ' + it.path;
      part(li, 'slova').textContent = fmt(it.words);
      part(li, 'sem').textContent = fmt(it.in);
      part(li, 'ven').textContent = fmt(it.out);
      var cb = part(li, 'odznaky');
      it.rules.forEach(function (r) { cb.appendChild(badge(r)); });
      fragCards.appendChild(li);
    });
    tbody.appendChild(fragRows);
    cards.appendChild(fragCards);

    var any = rows.length > 0;
    $('rd-tabulka').hidden = !any;
    $('rd-karty').hidden = !any;
    $('rd-strankovani').hidden = !any;
    $('rd-prazdno').hidden = any;

    var findings = rows.reduce(function (n, it) { return n + (state.rule ? 1 : it.rules.length); }, 0);
    $('rd-pocet').textContent = any
      ? plural(rows.length, ['stránka', 'stránky', 'stránek']) + ' · ' +
        plural(findings, ['otevřený nález', 'otevřené nálezy', 'otevřených nálezů']) + (active() ? ' ve výběru' : '')
      : 'V tomto výběru nic nechybí.';
    $('rd-rozsah').textContent = any ? nf.format(from + 1) + '–' + nf.format(from + visible.length) : '0';
    $('rd-celkem').textContent = nf.format(rows.length);
    $('rd-strana').textContent = 'strana ' + nf.format(state.page) + ' z ' + nf.format(pages);
    $('rd-predchozi').disabled = state.page <= 1;
    $('rd-dalsi').disabled = state.page >= pages;
  }

  function render() {
    renderControls();
    renderList();
    syncUrl();
    updateChart();
  }

  // --- Graf -----------------------------------------------------------------------------

  function seriesFor() {
    return activeRules.map(function (r) {
      var dimRule = state.rule && state.rule !== r;
      return {
        name: r, type: 'bar', stack: 'ia', barMaxWidth: 22,
        itemStyle: { color: RULE[r].color },
        emphasis: { focus: 'series' },
        data: chartRows.map(function (s) {
          var dim = dimRule || (state.section && state.section !== s.id);
          return { value: s.rules[r] || 0, section: s.id, itemStyle: { opacity: dim ? 0.25 : 1 } };
        }),
      };
    });
  }

  function chartOption(t) {
    var el = $('rd-graf');
    var labelWidth = Math.max(90, Math.min(180, Math.round((el.clientWidth || 600) * 0.3)));
    return {
      tooltip: Object.assign({
        trigger: 'axis', axisPointer: { type: 'shadow' }, confine: true,
        formatter: function (ps) {
          if (!ps.length) return '';
          var s = sectionSet[ps[0].data.section];
          var lines = ps.filter(function (p) { return p.value > 0; }).map(function (p) {
            return p.marker + p.seriesName + ': <b>' + nf.format(p.value) + '</b>';
          });
          return '<b>' + sectionName(s.id) + '</b> <span style="opacity:.7">' + s.id + '</span><br>' +
            plural(s.open, ['stránka', 'stránky', 'stránek']) + ' k doplnění<br>' + lines.join('<br>');
        },
      }, V.tooltip(t)),
      legend: { show: false },
      grid: { left: 8, right: 16, top: 8, bottom: 8, containLabel: true },
      xAxis: V.axis(t, { type: 'value', minInterval: 1 }),
      yAxis: V.axis(t, {
        type: 'category', inverse: true, data: chartRows.map(function (s) { return sectionName(s.id); }),
        axisLabel: { color: t.muted, fontSize: 11, width: labelWidth, overflow: 'truncate' },
      }),
      series: seriesFor(),
    };
  }

  function updateChart() {
    if (chart) chart.setOption({ series: seriesFor() });
  }

  function drawChart() {
    var el = $('rd-graf');
    chartRows = sections.filter(function (s) { return s.findings > 0; })
      .sort(function (a, b) { return b.findings - a.findings || a.id.localeCompare(b.id); }).slice(0, TOP);
    if (!chartRows.length) {
      V.empty(el, 'Bez otevřených nálezů', 'Všechny stránky splňují pravidla informační architektury.');
      return;
    }
    el.textContent = '';
    el.setAttribute('aria-label', 'Skládaný vodorovný sloupcový graf otevřených nálezů ' + chartRows.length +
      ' oddílů s nejvíce nálezy, po pravidlech: ' + chartRows.map(function (s) {
        return sectionName(s.id) + ' ' + nf.format(s.findings);
      }).join(', ') + '. Stejný filtr nabízejí dlaždice pravidel a výběr oddílu v pracovním seznamu.');
    V.echarts(el, chartOption).then(function (c) {
      chart = c;
      chart.on('click', function (p) {
        if (p.componentType !== 'series' || !p.data) return;
        setState({ section: p.data.section, rule: p.seriesName });
        var target = $('rd-seznam');
        target.scrollIntoView({ block: 'start', behavior: reducedMotion() ? 'auto' : 'smooth' });
        $('h-rd-seznam').focus({ preventScroll: true });
      });
    }).catch(function (e) {
      V.empty(el, 'Graf se nepodařilo načíst', e.message + ' Filtr funguje i přes dlaždice pravidel a výběr oddílu.');
    });
  }

  // --- Ovládání -------------------------------------------------------------------------

  function bind() {
    var timer = null;
    $('rd-filtr').addEventListener('submit', function (e) { e.preventDefault(); });
    $('rd-q').addEventListener('input', function (e) {
      clearTimeout(timer);
      var v = e.target.value;
      timer = setTimeout(function () { setState({ q: v }); }, 150);
    });
    $('rd-oddil').addEventListener('change', function (e) { setState({ section: e.target.value }); });
    $('rd-pravidlo').addEventListener('change', function (e) { setState({ rule: e.target.value }); });
    $('rd-jazyk').addEventListener('change', function (e) { setState({ lang: e.target.value }); });
    $('rd-razeni').addEventListener('change', function (e) { setState({ sort: e.target.value }); });
    Array.prototype.forEach.call(root.querySelectorAll('[data-rd-reset]'), function (b) {
      b.addEventListener('click', function () {
        $('rd-q').value = '';
        setState({ q: '', rule: '', section: '', lang: '' });
      });
    });
    function go(delta) {
      state.page += delta;
      render();
      $('rd-seznam').scrollIntoView({ block: 'start', behavior: reducedMotion() ? 'auto' : 'smooth' });
    }
    $('rd-predchozi').addEventListener('click', function () { go(-1); });
    $('rd-dalsi').addEventListener('click', function () { go(1); });
  }

  // --- Start ----------------------------------------------------------------------------

  var started = false;
  function start() {
    if (started) return;
    started = true;
    var fromUrl = hasUrlState();
    $('rd-pocet').textContent = 'Načítám…';
    V.json('data/ia.json').then(function (d) {
      if (!d || d.schema !== 'kompendium-ia/v1') throw new Error('Neočekávané schéma dat: ' + (d && d.schema));
      prepare(d);
      $('rd-souhrn').textContent = plural(items.length, ['stránka', 'stránky', 'stránek']) + ' k doplnění z ' +
        nf.format(d.pages.length);
      renderRules();
      fillSelects();
      readUrl();
      bind();
      render();
      drawChart();
      if (fromUrl && !window.location.hash) $('rd-seznam').scrollIntoView({ block: 'start' });
    }).catch(function (e) {
      $('rd-pocet').textContent = '';
      V.empty($('rd-graf'), 'Data redakčního přehledu se nepodařilo načíst', e.message);
    });
  }

  function init() {
    if (hasUrlState() || !('IntersectionObserver' in window)) { start(); return; }
    var io = new IntersectionObserver(function (entries) {
      if (entries.some(function (en) { return en.isIntersecting; })) { io.disconnect(); start(); }
    }, { rootMargin: '400px 0px' });
    io.observe(root);
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
