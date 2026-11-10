// Interaktivní štítky: /tags/ (filtr bez ohledu na diakritiku, řazení, stromová mapa
// nejpoužívanějších štítků) a /tags/<štítek>/ (rozložení podle oddílů, nejodkazovanější
// stránky, související štítky). Vše se odvozuje ze serverem vykresleného seznamu a ze
// static/data/graph.json; bez JavaScriptu zůstávají čisté seznamy odkazů.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');
  var TREEMAP_TOP = 60;
  var TREEMAP_TOP_NARROW = 30;
  var TOP_LINKED = 10;
  var RELATED = 24;
  // Odstíny primární barvy pro dlaždice; všechny nesou bílý popisek s dostatečným kontrastem.
  var SHADES = ['#312e81', '#3730a3', '#4338ca', '#4f46e5'];

  function $(sel, root) { return (root || document).querySelector(sel); }

  // Porovnání bez diakritiky a velikosti písmen; úvodní # se ignoruje.
  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '')
      .toLowerCase().replace(/^#+/, '').trim();
  }

  // Stejný tvar adresy jako Zola (slugify = "on"): ASCII, malá písmena, pomlčky.
  function slug(s) {
    return String(s).normalize('NFKD').replace(/[̀-ͯ]/g, '').toLowerCase()
      .replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
  }

  function plural(n, one, few, many) {
    if (n === 1) return one;
    return n >= 2 && n <= 4 ? few : many;
  }

  function pagesWord(n) { return plural(n, 'stránka', 'stránky', 'stránek'); }

  // Graf se inicializuje, až když je jeho kontejner (téměř) vidět.
  function lazy(el, fn) {
    if (!el) return;
    if (!('IntersectionObserver' in window)) { fn(); return; }
    var io = new IntersectionObserver(function (entries) {
      if (entries.some(function (e) { return e.isIntersecting; })) { io.disconnect(); fn(); }
    }, { rootMargin: '200px 0px' });
    io.observe(el);
  }

  function reveal(root) {
    root.querySelectorAll('[data-js]').forEach(function (el) {
      el.classList.remove('hidden');
      if (el.hasAttribute('data-js-flex')) el.classList.add('flex');
    });
  }

  function fill(tpl, fields) {
    var node = tpl.content.firstElementChild.cloneNode(true);
    Object.keys(fields).forEach(function (k) {
      var f = node.querySelector('[data-f="' + k + '"]');
      if (f) f.textContent = fields[k];
    });
    return node;
  }

  // ---------------------------------------------------------------- /tags/ ----------
  function initList(root) {
    var list = $('#stitky-seznam', root);
    var input = $('#stitky-q', root);
    var status = $('#stitky-stav', root);
    var none = $('#stitky-prazdne', root);
    var buttons = root.querySelectorAll('[data-sort]');
    var isTags = root.getAttribute('data-kind') === 'tags';
    var items = Array.prototype.slice.call(list.children).map(function (li) {
      var name = li.getAttribute('data-name');
      return { li: li, name: name, key: fold(name), count: Number(li.getAttribute('data-c')) || 0,
        url: li.querySelector('a').href };
    });
    var byCount = items.slice().sort(function (a, b) {
      return b.count - a.count || a.name.localeCompare(b.name, 'cs');
    });
    var byName = items.slice().sort(function (a, b) { return a.name.localeCompare(b.name, 'cs'); });
    var noun = isTags ? ['štítek', 'štítky', 'štítků'] : ['kategorie', 'kategorie', 'kategorií'];
    var state = { q: '', sort: 'pocet' };

    var params = new URLSearchParams(location.search);
    if (params.get('q')) state.q = params.get('q');
    if (params.get('razeni') === 'abeceda') state.sort = 'abeceda';
    input.value = state.q;

    function remember() {
      try {
        var url = new URL(location.href);
        if (state.q) url.searchParams.set('q', state.q); else url.searchParams.delete('q');
        if (state.sort === 'abeceda') url.searchParams.set('razeni', 'abeceda');
        else url.searchParams.delete('razeni');
        history.replaceState(null, '', url);
      } catch (e) { /* bez historie se jen nezapamatuje */ }
    }

    function filter() {
      var q = fold(state.q);
      var shown = 0;
      var pages = 0;
      items.forEach(function (it) {
        var hit = !q || it.key.indexOf(q) !== -1;
        it.li.hidden = !hit;
        if (hit) { shown += 1; pages += it.count; }
      });
      none.classList.toggle('hidden', shown > 0);
      status.textContent = q
        ? 'Filtru „' + state.q.trim() + '“ odpovídá ' + nf.format(shown) + ' ' +
          plural(shown, noun[0], noun[1], noun[2]) + ' z ' + nf.format(items.length) + ' (' +
          nf.format(pages) + ' ' + pagesWord(pages) + ' celkem).'
        : 'Zobrazeno všech ' + nf.format(items.length) + ' ' + noun[2] + '.';
    }

    function sort() {
      var frag = document.createDocumentFragment();
      (state.sort === 'abeceda' ? byName : byCount).forEach(function (it) { frag.appendChild(it.li); });
      list.appendChild(frag);
      buttons.forEach(function (b) {
        b.setAttribute('aria-pressed', String(b.getAttribute('data-sort') === state.sort));
      });
    }

    input.addEventListener('input', function () { state.q = input.value; filter(); remember(); });
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && input.value) { input.value = ''; state.q = ''; filter(); remember(); }
    });
    buttons.forEach(function (b) {
      b.addEventListener('click', function () {
        state.sort = b.getAttribute('data-sort');
        sort(); remember();
      });
    });

    reveal(root);
    sort();
    filter();

    var box = $('#stitky-treemap', root);
    lazy(box, function () {
      var n = box.clientWidth < 640 ? TREEMAP_TOP_NARROW : TREEMAP_TOP;
      treemap(box, byCount.slice(0, n), isTags);
    });
  }

  function treemap(el, top, isTags) {
    var max = top.length ? top[0].count : 1;
    var min = top.length ? top[top.length - 1].count : 0;
    function shade(c) {
      var r = max === min ? 1 : (c - min) / (max - min);
      return SHADES[Math.min(SHADES.length - 1, Math.floor((1 - Math.sqrt(r)) * SHADES.length))];
    }
    return V.echarts(el, function (t) {
      return {
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          return '<b>' + (isTags ? '#' : '') + p.name + '</b><br>' + nf.format(p.value) + ' ' +
            pagesWord(p.value) + '<br><span style="color:' + t.muted + '">Klepnutím otevřete</span>';
        } }, V.tooltip(t)),
        series: [{
          type: 'treemap', roam: false, nodeClick: false, breadcrumb: { show: false },
          width: '100%', height: '100%', top: 0, left: 0, right: 0, bottom: 0,
          label: { color: '#fff', fontSize: 12, overflow: 'truncate',
            formatter: function (p) { return (isTags ? '#' : '') + p.name + '\n' + nf.format(p.value); } },
          itemStyle: { borderColor: t.surface, borderWidth: 2, gapWidth: 2 },
          emphasis: { itemStyle: { color: '#6366f1' } },
          data: top.map(function (it) {
            return { name: it.name, value: it.count, url: it.url, itemStyle: { color: shade(it.count) } };
          }),
        }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
      el.style.cursor = 'pointer';
    }).catch(function (e) { V.empty(el, 'Graf se nepodařilo načíst', e.message); });
  }

  // ------------------------------------------------------- /tags/<štítek>/ ----------
  function sectionInfo(g, section) {
    var index = g.byPath[section === 'root' ? '_index.md' : section + '/_index.md'];
    var name = section === 'root' ? 'Úvod' : (index && index.title) || V.sectionLabel(section);
    return { key: section, name: name, url: index ? g.url(index) : null, color: g.color(section) };
  }

  function initTag(root) {
    var tag = root.getAttribute('data-stitek');
    var listUrl = root.getAttribute('data-list-url');
    root.classList.remove('hidden');
    var chartEl = $('#stitek-oddily', root);
    var sectionList = $('#stitek-oddily-seznam', root);
    var linkedList = $('#stitek-odkazovane', root);
    var relatedList = $('#stitek-souvisejici', root);

    V.graph().then(function (g) {
      var tagged = g.nodes.filter(function (n) { return (n.tags || []).indexOf(tag) !== -1; });
      if (!tagged.length) {
        V.empty(chartEl, 'Bez dat', 'Štítek v grafu knihy nemá žádnou stránku.');
        linkedList.innerHTML = '';
        relatedList.innerHTML = '';
        return;
      }

      // Oddíly
      var counts = {};
      tagged.forEach(function (n) { counts[n.section] = (counts[n.section] || 0) + 1; });
      var sections = Object.keys(counts).map(function (s) {
        var info = sectionInfo(g, s);
        info.count = counts[s];
        return info;
      }).sort(function (a, b) { return b.count - a.count || a.name.localeCompare(b.name, 'cs'); });
      var popis = $('[data-f="oddily-popis"]', root);
      popis.textContent = nf.format(tagged.length) + ' ' + pagesWord(tagged.length) + ' v ' +
        nf.format(sections.length) + ' ' + plural(sections.length, 'oddílu', 'oddílech', 'oddílech') +
        '. Klepnutím na sloupec otevřete oddíl.';
      var tplSection = $('#tpl-stitek-oddil', root);
      sectionList.innerHTML = '';
      sections.forEach(function (s) {
        var li = fill(tplSection, { name: s.name, count: nf.format(s.count) });
        var a = li.querySelector('a');
        if (s.url) a.href = s.url; else a.removeAttribute('href');
        a.setAttribute('aria-label', s.name + ': ' + s.count + ' ' + pagesWord(s.count));
        sectionList.appendChild(li);
      });
      chartEl.style.height = Math.max(160, sections.length * 28 + 24) + 'px';
      lazy(chartEl, function () { sectionsChart(chartEl, sections); });

      // Nejodkazovanější stránky
      var tplPage = $('#tpl-stitek-stranka', root);
      linkedList.innerHTML = '';
      tagged.slice().sort(function (a, b) {
        return (b.in || 0) - (a.in || 0) || a.title.localeCompare(b.title, 'cs');
      }).slice(0, TOP_LINKED).forEach(function (n, i) {
        var inn = n.in || 0;
        var li = fill(tplPage, { rank: String(i + 1), title: n.title,
          section: sectionInfo(g, n.section).name, count: nf.format(inn) + ' ' + plural(inn, 'odkaz', 'odkazy', 'odkazů') });
        var a = li.querySelector('a');
        a.href = g.url(n);
        a.setAttribute('aria-label', (i + 1) + '. ' + n.title + ', ' + inn + ' ' +
          plural(inn, 'odkaz', 'odkazy', 'odkazů') + ' sem');
        linkedList.appendChild(li);
      });

      // Související štítky: nejčastější společný výskyt na stejných stránkách.
      var co = {};
      tagged.forEach(function (n) {
        (n.tags || []).forEach(function (t) { if (t !== tag) co[t] = (co[t] || 0) + 1; });
      });
      var related = Object.keys(co).sort(function (a, b) {
        return co[b] - co[a] || a.localeCompare(b, 'cs');
      }).slice(0, RELATED);
      var tplRel = $('#tpl-stitek-souvisejici', root);
      relatedList.innerHTML = '';
      if (!related.length) {
        relatedList.innerHTML = '<li class="text-sm text-gray-500 dark:text-gray-400">Štítek se s žádným jiným nepotkává.</li>';
      }
      related.forEach(function (t) {
        var li = fill(tplRel, { name: '#' + t, count: nf.format(co[t]) });
        var a = li.querySelector('a');
        a.href = listUrl + slug(t) + '/';
        a.setAttribute('aria-label', '#' + t + ': ' + co[t] + ' ' + plural(co[t], 'společná stránka', 'společné stránky', 'společných stránek'));
        relatedList.appendChild(li);
      });
    }).catch(function (e) {
      V.empty(chartEl, 'Data se nepodařilo načíst', e.message);
      linkedList.innerHTML = '';
      relatedList.innerHTML = '';
    });
  }

  function sectionsChart(el, sections) {
    return V.echarts(el, function (t) {
      var labelWidth = Math.max(90, Math.min(220, Math.round(el.clientWidth * 0.42)));
      return {
        tooltip: Object.assign({ trigger: 'item', formatter: function (p) {
          return '<b>' + p.name + '</b><br>' + nf.format(p.value) + ' ' + pagesWord(p.value) +
            (p.data.url ? '<br><span style="color:' + t.muted + '">Klepnutím otevřete oddíl</span>' : '');
        } }, V.tooltip(t)),
        grid: { left: 8, right: 36, top: 4, bottom: 4, containLabel: true },
        xAxis: V.axis(t, { type: 'value', minInterval: 1, axisLabel: { show: false }, splitLine: { show: false } }),
        yAxis: V.axis(t, { type: 'category', inverse: true, data: sections.map(function (s) { return s.name; }),
          axisTick: { show: false },
          axisLabel: { color: t.muted, fontSize: 11, width: labelWidth, overflow: 'truncate' } }),
        series: [{ type: 'bar', barMaxWidth: 18,
          data: sections.map(function (s) { return { value: s.count, url: s.url }; }),
          itemStyle: { color: t.primary, borderRadius: [0, 3, 3, 0] },
          emphasis: { itemStyle: { color: '#6366f1' } },
          label: { show: true, position: 'right', color: t.muted, fontSize: 11 } }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) { if (p.data && p.data.url) window.location.href = p.data.url; });
    }).catch(function (e) { V.empty(el, 'Graf se nepodařilo načíst', e.message); });
  }

  function init() {
    if (!V) return;
    var list = document.querySelector('[data-stitky-list]');
    if (list && $('#stitky-seznam', list)) initList(list);
    var detail = document.getElementById('stitek-detail');
    if (detail) initTag(detail);
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
