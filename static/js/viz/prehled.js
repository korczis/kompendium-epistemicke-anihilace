// Přehled knihy na úvodní stránce (templates/partials/landing-intro.html): plošný graf
// (ECharts treemap) rodin technik a oddílů knihy. Jediným zdrojem dat je seznam odkazů pod
// grafem ([data-prehled-item]: skupina, počet stránek, název, adresa), který šablona odvodí
// z graph.json a nav.json a který zůstává textovou alternativou grafu; graf proto ukazuje
// přesně tytéž odkazy. ECharts se načte, až když se graf přiblíží k viditelné oblasti.
// Klávesnice: šipky vybírají pole, Home a End první a poslední, Enter otevře stránku,
// Escape výběr zruší. Texty rozhraní nese markup (content/_index.md [extra.landing]).
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var GROUP = ['#4338ca', '#374151'];   // primary-700 a gray-700: bílý popisek má kontrast AA
  var MARK = '#f59e0b';                  // vybrané pole: jantarový rámeček v obou tématech

  function items(root) {
    var groups = [];
    var byName = {};
    root.querySelectorAll('[data-prehled-item]').forEach(function (a) {
      var name = a.getAttribute('data-group');
      if (!(name in byName)) {
        byName[name] = groups.length;
        groups.push({ name: name, children: [] });
      }
      var title = a.querySelector('[data-prehled-title]');
      var count = a.querySelector('[data-prehled-count]');
      groups[byName[name]].children.push({
        name: (title ? title.textContent : a.textContent).trim(),
        value: Number(a.getAttribute('data-value')) || 0,
        url: a.href,
        count: count ? count.textContent.trim() : '',
      });
    });
    return groups;
  }

  function render(root) {
    var el = root.querySelector('[data-prehled-chart]');
    var caption = root.querySelector('[data-prehled-current]');
    var said = root.getAttribute('data-prehled-selected') || '';
    var groups = items(root);
    var leaves = [];
    groups.forEach(function (g) { g.children.forEach(function (c) { leaves.push(c); }); });
    if (!el || !leaves.length || !V) return;
    var current = -1;

    function option(t) {
      return {
        animation: false,
        tooltip: Object.assign({
          formatter: function (p) { return p.data && p.data.count ? p.name + '<br>' + p.data.count : p.name; },
        }, V.tooltip(t)),
        series: [{
          type: 'treemap', roam: false, nodeClick: false, breadcrumb: { show: false },
          top: 0, left: 0, right: 0, bottom: 0, cursor: 'pointer',
          label: { show: true, color: '#ffffff', fontSize: 12, overflow: 'truncate', formatter: '{b}' },
          upperLabel: { show: true, height: 24, color: '#ffffff', fontWeight: 600 },
          levels: [
            { itemStyle: { borderWidth: 0, gapWidth: 6, borderColor: t.surface } },
            { itemStyle: { borderWidth: 2, gapWidth: 2 } },
            { itemStyle: { borderWidth: 1, borderColor: t.surface } },
          ],
          data: groups.map(function (g, gi) {
            var color = GROUP[gi % GROUP.length];
            return {
              name: g.name, itemStyle: { color: color, borderColor: color },
              children: g.children.map(function (c) {
                var on = leaves[current] === c;
                return {
                  name: c.name, value: c.value, url: c.url, count: c.count,
                  itemStyle: { color: color, borderColor: on ? MARK : t.surface, borderWidth: on ? 4 : 1 },
                };
              }),
            };
          }),
        }],
      };
    }

    el.textContent = '';
    V.echarts(el, option).then(function (chart) {
      chart.on('click', function (p) {
        if (p.data && p.data.url) window.location.href = p.data.url;
      });
      function show(i) {
        current = i;
        chart.setOption(option(V.theme()), true);
        if (i < 0) { caption.textContent = ''; el.removeAttribute('data-prehled-current-url'); return; }
        caption.textContent = said.replace('{title}', leaves[i].name).replace('{count}', leaves[i].count);
        el.setAttribute('data-prehled-current-url', leaves[i].url);
      }
      el.addEventListener('keydown', function (e) {
        var n = leaves.length;
        var step = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
        if (e.key in step) {
          e.preventDefault();
          show(current < 0 ? (step[e.key] > 0 ? 0 : n - 1) : (current + step[e.key] + n) % n);
        } else if (e.key === 'Home' || e.key === 'End') {
          e.preventDefault();
          show(e.key === 'Home' ? 0 : n - 1);
        } else if (e.key === 'Enter' && current >= 0) {
          e.preventDefault();
          window.location.href = leaves[current].url;
        } else if (e.key === 'Escape' && current >= 0) {
          show(-1);
        }
      });
      el.setAttribute('data-prehled-ready', '');
    }).catch(function () {
      el.textContent = root.getAttribute('data-prehled-error') || '';
    });
  }

  function init() {
    var roots = Array.prototype.slice.call(document.querySelectorAll('[data-prehled]'));
    if (!roots.length) return;
    if (!('IntersectionObserver' in window)) { roots.forEach(render); return; }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        io.unobserve(entry.target);
        render(entry.target.closest('[data-prehled]'));
      });
    }, { rootMargin: '200px 0px' });
    roots.forEach(function (r) {
      var chart = r.querySelector('[data-prehled-chart]');
      if (chart) io.observe(chart);
    });
  }

  // Skript je deferred a stojí za sdíleným modulem kompendium-viz.js; DOMContentLoaded přijde
  // až po všech deferred skriptech, takže modul už je načtený.
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
