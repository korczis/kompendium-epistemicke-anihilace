// Interaktivní rejstřík pojmů (příloha Index pojmů): filtr textem bez ohledu na diakritiku,
// podle kategorie (Flowbite dropdown) a počátečního písmene, k tomu kruhový graf shluků hesel
// podle kategorií (ECharts, uzly = hesla, čáry = related_terms). Data čte jen ze seznamu, který
// šablona vyrenderovala z glosáře (data-* atributy), abecedu z tlačítek A–Ž; nic není vypsáno
// ručně. Graf se načte, až když se karta přiblíží k oknu.
(function () {
  'use strict';

  // Kategorie s vlastní barvou; další kategorie sdílí šedou „ostatní“ (stabilní pořadí podle
  // počtu hesel, takže filtr barvy nepřebarví).
  var OWN_COLOURS = 8;
  var OTHER = '#64748b';

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function esc(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  // 1 pojem, 2–4 pojmy, 0 a 5+ pojmů.
  function plural(n, one, few, many) {
    if (n === 1) return one;
    if (n >= 2 && n <= 4) return few;
    return many;
  }

  function init() {
    var root = document.querySelector('[data-rejstrik]');
    if (!root) return;
    var V = window.KompendiumViz;
    var list = root.querySelector('[data-rj-list]');
    var input = root.querySelector('#rj-q');
    var status = root.querySelector('[data-rj-status]');
    var empty = root.querySelector('[data-rj-empty]');
    var toolbarReset = root.querySelector('[data-rj-reset="toolbar"]');
    var catCount = root.querySelector('[data-rj-cat-count]');
    var boxes = [].slice.call(root.querySelectorAll('[data-rj-cat]'));
    var letterButtons = [].slice.call(root.querySelectorAll('[data-rj-letter]'));
    var letterSet = {};
    letterButtons.forEach(function (b) {
      var l = b.getAttribute('data-rj-letter');
      if (l) letterSet[l] = true;
    });

    function letterOf(title) {
      var t = String(title || '').trim();
      if (letterSet.CH && /^ch/i.test(t)) return 'CH';
      var c = t.charAt(0).toUpperCase();
      if (letterSet[c]) return c;
      var b = fold(c).toUpperCase();
      return letterSet[b] ? b : '#';
    }

    var items = [].slice.call(list.querySelectorAll('[data-rj-item]')).map(function (el) {
      var a = el.querySelector('[data-rj-title]');
      var title = a.textContent.trim();
      return {
        el: el, title: title, url: a.href, slug: el.getAttribute('data-slug'),
        category: el.getAttribute('data-category') || '',
        related: (el.getAttribute('data-related') || '').split(/\s+/).filter(Boolean),
        q: fold(el.getAttribute('data-q')), letter: letterOf(title), match: true,
      };
    });
    items.sort(function (a, b) { return a.title.localeCompare(b.title, 'cs'); });
    var frag = document.createDocumentFragment();
    items.forEach(function (it) { frag.appendChild(it.el); });
    list.appendChild(frag);

    // Pořadí kategorií podle počtu hesel (při shodě abecedně), z něj barvy.
    var counts = {};
    items.forEach(function (it) { counts[it.category] = (counts[it.category] || 0) + 1; });
    var cats = Object.keys(counts).sort(function (a, b) {
      return counts[b] - counts[a] || a.localeCompare(b, 'cs');
    });
    var rank = {};
    cats.forEach(function (c, i) { rank[c] = i; });
    // Nabídka kategorií ve stejném pořadí jako legenda (šablona řadí jen podle počtu).
    boxes.sort(function (a, b) { return rank[a.value] - rank[b.value]; });
    boxes.forEach(function (b) { b.parentElement.parentElement.appendChild(b.parentElement); });
    var palette = V ? V.PALETTE : [];
    function colour(cat) {
      var r = rank[cat];
      return r < OWN_COLOURS && palette[r] ? palette[r] : OTHER;
    }
    items.forEach(function (it) {
      var sw = it.el.querySelector('[data-rj-swatch]');
      if (sw) sw.style.backgroundColor = colour(it.category);
    });

    var state = { q: '', cats: {}, letter: '' };
    var onChange = [];

    function apply() {
      var words = fold(state.q.trim()).split(/\s+/).filter(Boolean);
      var anyCat = Object.keys(state.cats).length > 0;
      var lettersAvail = {};
      var shown = 0;
      items.forEach(function (it) {
        var ok = !anyCat || state.cats[it.category];
        for (var i = 0; ok && i < words.length; i++) if (it.q.indexOf(words[i]) === -1) ok = false;
        if (ok) lettersAvail[it.letter] = true;
        it.match = ok && (!state.letter || it.letter === state.letter);
        it.el.hidden = !it.match;
        if (it.match) shown += 1;
      });
      letterButtons.forEach(function (b) {
        var l = b.getAttribute('data-rj-letter');
        b.setAttribute('aria-pressed', String(l === state.letter));
        b.disabled = !!l && !lettersAvail[l] && l !== state.letter;
      });
      var all = items.length;
      status.textContent = shown === all
        ? 'Všech ' + all + ' ' + plural(all, 'pojem', 'pojmy', 'pojmů') + ', abecedně podle českého pořadí.'
        : 'Zobrazeno ' + shown + ' ' + plural(shown, 'pojem', 'pojmy', 'pojmů') + ' z ' + all + '.';
      empty.hidden = shown > 0;
      var nCats = Object.keys(state.cats).length;
      catCount.hidden = nCats === 0;
      catCount.textContent = String(nCats);
      toolbarReset.hidden = !(state.q || nCats || state.letter);
      onChange.forEach(function (f) { f(); });
    }

    input.addEventListener('input', function () { state.q = input.value; apply(); });
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && input.value) { input.value = ''; state.q = ''; apply(); }
    });
    boxes.forEach(function (b) {
      b.addEventListener('change', function () {
        if (b.checked) state.cats[b.value] = true;
        else delete state.cats[b.value];
        apply();
      });
    });
    letterButtons.forEach(function (b) {
      b.addEventListener('click', function () {
        var l = b.getAttribute('data-rj-letter');
        state.letter = state.letter === l ? '' : l;
        apply();
      });
    });
    [].forEach.call(root.querySelectorAll('[data-rj-reset]'), function (b) {
      b.addEventListener('click', function () {
        state.q = '';
        state.cats = {};
        state.letter = '';
        input.value = '';
        boxes.forEach(function (x) { x.checked = false; });
        apply();
        input.focus();
      });
    });
    var params = new URLSearchParams(location.search);
    if (params.get('hledat')) { input.value = params.get('hledat'); state.q = input.value; }
    apply();

    var chartEl = root.querySelector('[data-rj-chart]');
    if (!V) { chartEl.textContent = 'Graf není k dispozici: chybí vizualizační modul.'; return; }
    legend(root, cats, counts, colour);
    lazy(chartEl, function () { draw(V, root, chartEl, items, cats, colour, onChange); });
  }

  function legend(root, cats, counts, colour) {
    var ul = root.querySelector('[data-rj-legend]');
    var tpl = root.querySelector('[data-rj-legend-item]');
    if (!ul || !tpl) return;
    var rows = cats.slice(0, OWN_COLOURS).map(function (c) {
      return { label: c + ' (' + counts[c] + ')', colour: colour(c) };
    });
    var rest = cats.slice(OWN_COLOURS);
    if (rest.length) {
      var n = rest.reduce(function (s, c) { return s + counts[c]; }, 0);
      rows.push({ label: 'ostatní kategorie: ' + rest.length + ' (' + n + ')', colour: OTHER });
    }
    rows.forEach(function (r) {
      var li = tpl.content.firstElementChild.cloneNode(true);
      li.querySelector('[data-rj-swatch]').style.backgroundColor = r.colour;
      li.querySelector('[data-rj-label]').textContent = r.label;
      ul.appendChild(li);
    });
  }

  function lazy(el, run) {
    if (!('IntersectionObserver' in window)) { run(); return; }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { io.disconnect(); run(); }
      });
    }, { rootMargin: '300px' });
    io.observe(el);
  }

  function draw(V, root, el, items, cats, colour, onChange) {
    var rank = {};
    cats.forEach(function (c, i) { rank[c] = i; });
    // Uzly po obvodu: kategorie za sebou (podle počtu hesel), uvnitř abecedně.
    var nodes = items.slice().sort(function (a, b) {
      return rank[a.category] - rank[b.category] || a.title.localeCompare(b.title, 'cs');
    });
    var index = {};
    nodes.forEach(function (n, i) { index[n.slug] = i; });
    var pairs = {};
    var degree = nodes.map(function () { return 0; });
    nodes.forEach(function (n, i) {
      n.related.forEach(function (s) {
        var j = index[s];
        if (j === undefined || j === i) return;
        var k = Math.min(i, j) + '-' + Math.max(i, j);
        if (pairs[k]) return;
        pairs[k] = [Math.min(i, j), Math.max(i, j)];
        degree[i] += 1;
        degree[j] += 1;
      });
    });
    var links = Object.keys(pairs).map(function (k) { return pairs[k]; });
    var groups = cats.slice(0, OWN_COLOURS);
    var hasOther = cats.length > OWN_COLOURS;
    function group(cat) { return rank[cat] < OWN_COLOURS ? rank[cat] : OWN_COLOURS; }

    var note = root.querySelector('[data-rj-note]');
    if (note) {
      note.textContent = nodes.length + ' ' + plural(nodes.length, 'heslo', 'hesla', 'hesel') + ' a ' +
        links.length + ' ' + plural(links.length, 'vazba', 'vazby', 'vazeb') +
        ' mezi nimi (souvisejících pojmů, které v glosáři existují).';
    }

    function option(t) {
      var categories = groups.map(function (c) { return { name: c, itemStyle: { color: colour(c) } }; });
      if (hasOther) categories.push({ name: 'ostatní', itemStyle: { color: OTHER } });
      return {
        tooltip: Object.assign({ confine: true, formatter: function (p) {
          if (p.dataType === 'edge') {
            return esc(nodes[p.data.source].title) + ' — ' + esc(nodes[p.data.target].title);
          }
          var n = nodes[p.dataIndex];
          var d = degree[p.dataIndex];
          return '<b>' + esc(n.title) + '</b><br>Kategorie: ' + esc(n.category) + '<br>' + d + ' ' +
            plural(d, 'související pojem', 'související pojmy', 'souvisejících pojmů');
        } }, V.tooltip(t)),
        animation: false,
        series: [{
          type: 'graph', layout: 'circular', circular: { rotateLabel: true },
          top: 24, bottom: 24, left: 24, right: 24, roam: false, cursor: 'pointer',
          categories: categories,
          data: nodes.map(function (n, i) {
            return {
              name: n.title, category: group(n.category), url: n.url,
              symbolSize: Math.min(22, 6 + 3 * Math.sqrt(degree[i])),
              itemStyle: { opacity: n.match ? 1 : 0.12, borderColor: t.surface, borderWidth: 1 },
            };
          }),
          links: links.map(function (l) {
            var on = nodes[l[0]].match && nodes[l[1]].match;
            return { source: l[0], target: l[1], lineStyle: { opacity: on ? 0.28 : 0.04 } };
          }),
          label: { show: false, color: t.text, fontSize: 11 },
          lineStyle: { color: 'source', width: 1, curveness: 0.3 },
          emphasis: { focus: 'adjacency', label: { show: true }, lineStyle: { width: 2, opacity: 0.9 } },
        }],
      };
    }

    el.textContent = '';
    V.echarts(el, option).then(function (chart) {
      chart.on('click', function (p) {
        if (p.dataType === 'node' && p.data && p.data.url) window.location.href = p.data.url;
      });
      var raf = 0;
      onChange.push(function () {
        cancelAnimationFrame(raf);
        raf = requestAnimationFrame(function () { chart.setOption(option(V.theme()), true); });
      });

      // Klávesnice: šipky procházejí zobrazená hesla po obvodu, Enter otevře vybrané.
      var current = -1;
      var caption = root.querySelector('[data-rj-current]');
      function show(i) {
        chart.dispatchAction({ type: 'downplay', seriesIndex: 0 });
        current = i;
        if (i < 0) { caption.textContent = ''; chart.dispatchAction({ type: 'hideTip' }); return; }
        chart.dispatchAction({ type: 'highlight', seriesIndex: 0, dataIndex: i });
        chart.dispatchAction({ type: 'showTip', seriesIndex: 0, dataIndex: i });
        caption.textContent = 'Vybráno: ' + nodes[i].title + ' (' + nodes[i].category + '). Enter heslo otevře.';
        el.setAttribute('data-rj-current-url', nodes[i].url);
      }
      function step(dir) {
        var n = nodes.length;
        var i = current;
        for (var k = 0; k < n; k++) {
          i = dir === 'first' ? k : dir === 'last' ? n - 1 - k : (i + dir + n) % n;
          if (nodes[i].match) return show(i);
        }
      }
      el.addEventListener('keydown', function (e) {
        var keys = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1, Home: 'first', End: 'last' };
        if (e.key in keys) {
          e.preventDefault();
          step(current < 0 && typeof keys[e.key] === 'number' ? 'first' : keys[e.key]);
        } else if (e.key === 'Enter' && current >= 0) {
          e.preventDefault();
          window.location.href = nodes[current].url;
        } else if (e.key === 'Escape') {
          show(-1);
        }
      });
      el.addEventListener('blur', function () { if (current >= 0) chart.dispatchAction({ type: 'hideTip' }); });
    }).catch(function (e) {
      V.empty(el, 'Graf se nepodařilo načíst', e.message);
    });
  }

  // Skript je deferred a stojí v těle stránky před sdíleným modulem kompendium-viz.js;
  // DOMContentLoaded přijde až po všech deferred skriptech, takže modul už je načtený.
  document.addEventListener('DOMContentLoaded', init);
})();
