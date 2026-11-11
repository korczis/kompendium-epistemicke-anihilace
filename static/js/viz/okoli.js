// Okolí stránky: malý graf stránky a jejích nejbližších sousedů (odkazy ven i sem), spočítaný
// jádrem knihy (static/js/viz/jadro.js).
// Načte se, až když se karta objeví v okně; klepnutí na uzel otevře sousední stránku.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var J = window.KompendiumJadro;
  var LIMIT = 28;
  // Okolí čte jen graf: jádro dostane platný, ale prázdný rejstřík hledání, takže stránka kvůli
  // okolí nestahuje search.json (ten se načte až s hledáním).
  var NO_SEARCH = { schema: 'kompendium-search/v1', fields: ['title', 'description', 'url', 'code',
    'kind', 'aliases', 'in'], entries: [] };

  function engineOf(G) {
    if (!G.engine) G.engine = J.create(NO_SEARCH, G.raw);
    return G.engine;
  }

  // Okolí podle jádra (kontrakt kompendium-engine/v1, operace neighbourhood): sousedé v hloubce
  // 1 seřazení podle příchozích odkazů a cesty; hrany drží směr odkazu.
  function render(el) {
    var path = el.getAttribute('data-okoli');
    Promise.all([V.graph(), J.ready()]).then(function (all) {
      var G = all[0];
      var res = engineOf(G).run({ op: 'neighbourhood', path: path, depth: 1, limit: LIMIT });
      if (!res.ok) {
        if (res.error.code === 'unknown_path') {
          V.empty(el, 'Stránka v grafu chybí', 'Graf se přegeneruje při příštím sestavení.');
        } else {
          V.empty(el, 'Okolí se nepodařilo spočítat', res.error.message);
        }
        return;
      }
      var centre = res.nodes[0];
      var around = res.nodes.slice(1);
      if (!around.length) { V.empty(el, 'Zatím bez vazeb', 'Na tuto stránku nic neodkazuje a ani ona neodkazuje jinam.'); return; }
      var dir = {};
      res.edges.forEach(function (e) {
        if (e.from === centre.path) dir[e.to] = (dir[e.to] || 0) | 1;
        if (e.to === centre.path) dir[e.from] = (dir[e.from] || 0) | 2;
      });
      var t = V.theme();
      var els = [{ data: { id: 'c', label: centre.title, color: t.accent, size: 26, fontSize: 11, focus: true } }];
      around.forEach(function (m, i) {
        var d = dir[m.path] || 1;
        els.push({ data: { id: 'n' + i, path: m.path, label: m.title, color: G.color(m.class),
          size: Math.min(22, 8 + Math.sqrt(m.in) * 2), fontSize: 8 } });
        if (d & 1) els.push({ data: { id: 'o' + i, source: 'c', target: 'n' + i, width: d === 3 ? 2 : 1 } });
        if (d === 2) els.push({ data: { id: 'i' + i, source: 'n' + i, target: 'c', width: 1 } });
      });
      return V.cytoscape(el, els, { name: 'concentric', concentric: function (x) { return x.data('focus') ? 10 : 1; },
        levelWidth: function () { return 1; }, minNodeSpacing: 10, animate: false, padding: 12 }).then(function (cy) {
        cy.userZoomingEnabled(false);
        cy.on('tap', 'node', function (ev) {
          var p = ev.target.data('path');
          if (p && G.byPath[p]) window.location.href = G.url(G.byPath[p]);
        });
        cy.on('mouseover', 'node', function () { el.style.cursor = 'pointer'; });
        cy.on('mouseout', 'node', function () { el.style.cursor = ''; });
        var note = el.parentElement.querySelector('[data-okoli-note]');
        var n = G.byPath[path];
        if (note) note.textContent = G.out[n.id].length + ' odkazů ven · ' + G.in[n.id].length + ' odkazů sem' +
          (res.truncated ? ' · zobrazeno ' + around.length + ' z ' + res.total + ' sousedů' : '');
      });
    }).catch(function (e) { V.empty(el, 'Graf se nepodařilo načíst', e.message); });
  }

  function init() {
    var els = document.querySelectorAll('[data-okoli]');
    if (!els.length) return;
    if (!('IntersectionObserver' in window)) { els.forEach(render); return; }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { io.unobserve(en.target); render(en.target); }
      });
    }, { rootMargin: '200px' });
    els.forEach(function (el) { io.observe(el); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
