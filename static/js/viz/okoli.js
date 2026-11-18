// Okolí stránky: malý graf stránky a jejích nejbližších sousedů (odkazy ven i sem), spočítaný
// jádrem knihy (static/js/viz/jadro.js).
// Načte se, až když se karta objeví v okně; klepnutí na uzel otevře sousední stránku.
(function () {
  'use strict';

  var L = window.KompendiumVrstva;
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
      // Stránka uprostřed, sousedé v kruhu kolem (síť vrstvy, KompendiumViz.network); šipka
      // ukazuje směr odkazu, oboustranný odkaz je silnější čára bez šipky.
      return V.network(el, function (t) {
        var nodes = [{ id: 'c', label: centre.title, color: t.accent, size: 26, fontSize: 11, focus: true, labelBg: true }];
        var edges = [];
        around.forEach(function (m, i) {
          var d = dir[m.path] || 1;
          nodes.push({ id: 'n' + i, label: m.title, color: G.color(m.class), labelBg: true,
            size: Math.min(22, 8 + Math.sqrt(m.in) * 2), fontSize: 9, ring: 1, data: { path: m.path } });
          if (d === 3) edges.push({ source: 'c', target: 'n' + i, width: 2 });
          else if (d & 1) edges.push({ source: 'c', target: 'n' + i, width: 1, arrow: true });
          else edges.push({ source: 'n' + i, target: 'c', width: 1, arrow: true });
        });
        nodes[0].ring = 0;
        return { nodes: nodes, edges: edges };
      }, { layout: 'rings', labels: 8, onClick: function (d) {
        var p = d.data && d.data.path;
        if (p && G.byPath[p]) window.location.href = G.url(G.byPath[p]);
      } }).then(function () {
        var note = el.closest('[data-vrstva-frame]').parentElement.querySelector('[data-okoli-note]');
        var n = G.byPath[path];
        if (note) note.textContent = G.out[n.id].length + ' odkazů ven · ' + G.in[n.id].length + ' odkazů sem' +
          (res.truncated ? ' · zobrazeno ' + around.length + ' z ' + res.total + ' sousedů' : '');
      });
    }).catch(function (e) { V.empty(el, 'Graf se nepodařilo načíst', e.message); });
  }

  function init() {
    var els = document.querySelectorAll('[data-okoli]');
    if (!els.length) return;
    els.forEach(function (el) { L.lazy(el, function () { render(el); }, '200px'); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
