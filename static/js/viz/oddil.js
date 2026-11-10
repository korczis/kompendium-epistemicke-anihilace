// Přehled oddílu (templates/partials/section-overview.html): čísla, bodový graf stránek
// a pět nejodkazovanějších stránek, vše odvozené z static/data/graph.json. Graf odkazů
// (~0,9 MB) i ECharts se načtou až ve chvíli, kdy se přehled přiblíží k viditelné oblasti.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');

  function plural(n, one, few, many) {
    if (n === 1) return one;
    if (n >= 2 && n <= 4) return few;
    return many;
  }

  function unique(list) {
    var seen = {};
    return list.filter(function (x) {
      if (seen[x]) return false;
      seen[x] = true;
      return true;
    });
  }

  // Přímé stránky oddílu jako v Zole: <dir>/<slug>.md nebo <dir>/<slug>/index.md.
  function isDirectPage(path, dir) {
    if (path.indexOf(dir) !== 0) return false;
    var rest = path.slice(dir.length);
    if (rest === '_index.md') return false;
    return rest.indexOf('/') === -1 || /^[^/]+\/index\.md$/.test(rest);
  }

  function collect(g, dir) {
    var pages = g.nodes.filter(function (n) { return isDirectPage(n.path, dir); });
    var inside = {};
    pages.forEach(function (n) { inside[n.id] = true; });
    var index = g.byPath[dir + '_index.md'];
    if (index) inside[index.id] = true;
    var words = 0;
    var linksIn = 0;
    var linksOut = 0;
    var rows = pages.map(function (n) {
      words += n.words || 0;
      var sources = unique(g.in[n.id]);
      linksIn += sources.filter(function (s) { return !inside[s]; }).length;
      linksOut += unique(g.out[n.id]).filter(function (d) { return !inside[d]; }).length;
      return { node: n, words: n.words || 0, linkedBy: sources.length, url: g.url(n) };
    });
    return { rows: rows, words: words, linksIn: linksIn, linksOut: linksOut };
  }

  function setStat(root, key, value) {
    var dd = root.querySelector('[data-oddil-stat="' + key + '"]');
    if (dd) dd.textContent = nf.format(value);
  }

  function renderTop(root, rows) {
    var list = root.querySelector('[data-oddil-top]');
    var tpl = root.querySelector('template[data-oddil-item]');
    if (!list || !tpl) return;
    var top = rows.slice().sort(function (a, b) {
      return b.linkedBy - a.linkedBy || b.words - a.words ||
        a.node.title.localeCompare(b.node.title, 'cs');
    }).slice(0, 5);
    list.innerHTML = '';
    top.forEach(function (r) {
      var li = tpl.content.firstElementChild.cloneNode(true);
      var a = li.querySelector('a');
      a.href = r.url;
      a.setAttribute('aria-label', r.node.title + ', odkazuje sem ' + r.linkedBy + ' ' +
        plural(r.linkedBy, 'stránka', 'stránky', 'stránek'));
      li.querySelector('[data-slot="title"]').textContent = r.node.title;
      li.querySelector('[data-slot="words"]').textContent =
        nf.format(r.words) + ' ' + plural(r.words, 'slovo', 'slova', 'slov');
      var badge = li.querySelector('[data-slot="in"]');
      badge.textContent = nf.format(r.linkedBy);
      badge.title = 'Počet stránek, které sem odkazují';
      list.appendChild(li);
    });
  }

  // Hranice logaritmické osy zaokrouhlené na jednu platnou číslici, aby body nebyly natlačené
  // u jedné dekády (většina oddílů má stránky v rozmezí stovek až nízkých tisíců slov).
  function niceFloor(v) {
    var p = Math.pow(10, Math.floor(Math.log10(Math.max(1, v))));
    return Math.max(1, Math.floor(v / p) * p);
  }

  function niceCeil(v) {
    var p = Math.pow(10, Math.floor(Math.log10(Math.max(1, v))));
    var c = Math.ceil(v / p) * p;
    return c <= v ? c + p : c;
  }

  function renderChart(root, rows) {
    var el = root.querySelector('[data-oddil-chart]');
    if (!el) return null;
    el.innerHTML = '';
    var data = rows.map(function (r) {
      return { value: [Math.max(1, r.words), r.linkedBy], name: r.node.title, url: r.url };
    });
    var xs = data.map(function (d) { return d.value[0]; });
    var minWords = Math.min.apply(null, xs);
    var maxWords = Math.max.apply(null, xs);
    return V.echarts(el, function (t) {
      return {
        tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
          var d = p.data;
          var title = String(d.name).replace(/[&<>"]/g, function (c) {
            return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
          });
          return '<b>' + title + '</b><br>' + nf.format(d.value[0]) + ' slov · ' +
            d.value[1] + ' ' + plural(d.value[1], 'stránka odkazuje', 'stránky odkazují', 'stránek odkazuje') +
            ' sem';
        } }, V.tooltip(t)),
        grid: { left: 8, right: 24, top: 32, bottom: 28, containLabel: true },
        xAxis: V.axis(t, { type: 'log', name: 'slov (log)', nameLocation: 'middle', nameGap: 28,
          min: niceFloor(minWords), max: niceCeil(maxWords), splitLine: { show: false },
          axisLabel: { color: t.muted, hideOverlap: true, formatter: function (v) { return nf.format(v); } } }),
        yAxis: V.axis(t, { type: 'value', name: 'odkazů sem', minInterval: 1,
          nameTextStyle: { color: t.muted, align: 'left' } }),
        series: [{
          type: 'scatter', data: data, symbolSize: rows.length > 60 ? 8 : 10, cursor: 'pointer',
          itemStyle: { color: t.dark ? '#818cf8' : t.primary, opacity: 0.8 },
          emphasis: { itemStyle: { color: t.accent, opacity: 1 } },
        }],
      };
    }).then(function (chart) {
      chart.on('click', function (p) {
        if (p.data && p.data.url) window.location.href = p.data.url;
      });
      return chart;
    });
  }

  function render(root) {
    var dir = root.getAttribute('data-oddil-dir') || '';
    return V.graph().then(function (g) {
      var s = collect(g, dir);
      if (!s.rows.length) {
        V.empty(root.querySelector('[data-oddil-chart]'), 'Bez dat',
          'Graf odkazů zatím stránky tohoto oddílu neobsahuje.');
        root.querySelector('[data-oddil-top]').innerHTML = '';
        return null;
      }
      setStat(root, 'pages', s.rows.length);
      setStat(root, 'words', s.words);
      setStat(root, 'in', s.linksIn);
      setStat(root, 'out', s.linksOut);
      renderTop(root, s.rows);
      return renderChart(root, s.rows);
    }).catch(function (e) {
      V.empty(root.querySelector('[data-oddil-chart]'), 'Data se nepodařilo načíst', e.message);
    });
  }

  function init() {
    if (!V) return;
    var roots = Array.prototype.slice.call(document.querySelectorAll('[data-oddil]'));
    if (!roots.length) return;
    if (!('IntersectionObserver' in window)) {
      roots.forEach(render);
      return;
    }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        io.unobserve(entry.target);
        render(entry.target);
      });
    }, { rootMargin: '200px 0px' });
    roots.forEach(function (r) { io.observe(r); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
