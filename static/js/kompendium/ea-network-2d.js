// 2D síť nejodkazovanějších technik (síť vrstvy, KompendiumViz.network nad ECharts). Výběr = TOP stránek technik
// s nejvíce odkazy z celé knihy (graf: in), shluky = rodiny EA (kód z cesty, název z
// graph.families), hrany = odkazy mezi vybranými stránkami. Klik na uzel → sousedé + odkazy.
(function () {
  'use strict';
  var TOP = 30; // kolik nejodkazovanějších technik síť ukáže (zobrazovací mez, ne data)

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;
  var failed = window.KompendiumVrstva.failed;
  var L = window.KompendiumVrstva;

  function init() {
    var canvas = document.getElementById('ea-network-2d');
    if (!canvas) return;
    var detail = document.getElementById('ea-network-detail');
    kniha().then(function (K) { draw(K, canvas, detail); }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, canvas, detail) {
    var top = K.techniques.slice().sort(function (a, b) {
      return b.node.in - a.node.in || K.cmpCode(a.code, b.code);
    }).slice(0, TOP).sort(function (a, b) { return K.cmpCode(a.code, b.code); });
    var fams = [];
    top.forEach(function (t) { if (fams.indexOf(t.family) < 0) fams.push(t.family); });
    var edges = K.edgesAmong(top.map(function (t) { return t.id; }));
    var nb = {};
    var byId = {};
    top.forEach(function (t) { nb[t.id] = []; byId[t.id] = t; });
    edges.forEach(function (e) { nb[e.a].push(e.b); nb[e.b].push(e.a); });

    // shluk rodiny na kružnici, techniky rodiny na malé kružnici kolem jejího středu
    var pos = {};
    fams.forEach(function (fid, fi) {
      var a = (fi / fams.length) * Math.PI * 2 - Math.PI / 2;
      var cx = Math.cos(a) * 7;
      var cy = Math.sin(a) * 7;
      var members = top.filter(function (t) { return t.family === fid; });
      members.forEach(function (t, i) {
        var r = members.length > 1 ? 0.8 + members.length * 0.1 : 0;
        var b = (i / members.length) * Math.PI * 2;
        pos[t.id] = { x: cx + Math.cos(b) * r, y: cy + Math.sin(b) * r };
      });
    });

    function show(t) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', t.code + ' — ' + t.label));
      detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', K.familyLabel(t.family) + ' • odkazů z knihy: ' + t.node.in));
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-2 font-semibold', 'Sousední techniky podle odkazů v knize (' + nb[t.id].length + '):'));
      detail.appendChild(K.list(nb[t.id].map(function (id) { return byId[id].node; }), function (n) {
        return K.techniqueText(K.technique(n));
      }));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(t.node, '→ stránka techniky'));
      detail.appendChild(p);
    }

    // Pozice zůstávají spočítané výš (shluk rodiny na kružnici); síť je jen vykreslí. Klik
    // vybere techniku (rámeček, sousedství) a vypíše její sousedy.
    var net = null;
    var famIndex = {};
    fams.forEach(function (fid, i) { famIndex[fid] = i; });
    K.V.network(K.host(canvas), function () {
      return {
        title: top.length + ' nejodkazovanějších technik a ' + edges.length + ' vazeb podle odkazů v knize (klik = sousedé)',
        categories: fams.map(function (fid) { return { name: K.familyLabel(fid), color: K.familyColor(fid) }; }),
        nodes: top.map(function (t) {
          return { id: t.id, label: t.code, color: K.familyColor(t.family), category: famIndex[t.family],
            size: 14 + Math.sqrt(t.node.in) * 1.5, fontSize: 10, x: pos[t.id].x, y: pos[t.id].y,
            info: K.techniqueText(t) + ' · ' + K.familyLabel(t.family) + ' · ' +
              L.count(nb[t.id].length, ['soused', 'sousedé', 'sousedů']), data: t };
        }),
        edges: edges.map(function (e) { return { source: e.a, target: e.b, width: 1 }; }),
      };
    }, { layout: 'none', select: true, onClick: function (d) {
      show(d.data);
      if (net) net.select(d.id);
    } }).then(function (n) { net = n; });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
