// Okolí stránky: malý graf stránky a jejích nejbližších sousedů (odkazy ven i sem).
// Načte se, až když se karta objeví v okně; klepnutí na uzel otevře sousední stránku.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var LIMIT = 28;

  function render(el) {
    var path = el.getAttribute('data-okoli');
    V.graph().then(function (G) {
      var n = G.byPath[path];
      if (!n) { V.empty(el, 'Stránka v grafu chybí', 'Graf se přegeneruje při příštím sestavení.'); return; }
      var around = {};
      G.out[n.id].forEach(function (x) { around[x] = (around[x] || 0) | 1; });
      G.in[n.id].forEach(function (x) { around[x] = (around[x] || 0) | 2; });
      delete around[n.id];
      var ids = Object.keys(around).map(Number)
        .sort(function (a, b) { return (around[b] === 3) - (around[a] === 3) || G.in[b].length - G.in[a].length; })
        .slice(0, LIMIT);
      if (!ids.length) { V.empty(el, 'Zatím bez vazeb', 'Na tuto stránku nic neodkazuje a ani ona neodkazuje jinam.'); return; }
      var t = V.theme();
      var els = [{ data: { id: 'c', label: n.title, color: t.accent, size: 26, fontSize: 11, focus: true } }];
      ids.forEach(function (id) {
        var m = G.byId[id];
        els.push({ data: { id: 'n' + id, nid: id, label: m.title, color: G.color(m.section),
          size: Math.min(22, 8 + Math.sqrt(G.in[id].length) * 2), fontSize: 8 } });
        els.push({ data: { id: 'e' + id, source: around[id] & 2 ? 'n' + id : 'c', target: around[id] & 2 ? 'c' : 'n' + id,
          width: around[id] === 3 ? 2 : 1 } });
      });
      return V.cytoscape(el, els, { name: 'concentric', concentric: function (x) { return x.data('focus') ? 10 : 1; },
        levelWidth: function () { return 1; }, minNodeSpacing: 10, animate: false, padding: 12 }).then(function (cy) {
        cy.userZoomingEnabled(false);
        cy.on('tap', 'node', function (ev) {
          var id = ev.target.data('nid');
          if (id !== undefined) window.location.href = G.url(G.byId[id]);
        });
        cy.on('mouseover', 'node', function () { el.style.cursor = 'pointer'; });
        cy.on('mouseout', 'node', function () { el.style.cursor = ''; });
        var note = el.parentElement.querySelector('[data-okoli-note]');
        if (note) note.textContent = G.out[n.id].length + ' odkazů ven · ' + G.in[n.id].length + ' odkazů sem' +
          (Object.keys(around).length > LIMIT ? ' · zobrazeno ' + LIMIT + ' nejvýznamnějších sousedů' : '');
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
