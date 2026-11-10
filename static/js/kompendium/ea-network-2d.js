// 2D síť nejodkazovanějších technik (Chart.js scatter s hranami). Výběr = TOP stránek technik
// s nejvíce odkazy z celé knihy (graf: in), shluky = rodiny EA (kód z cesty, název z
// graph.families), hrany = odkazy mezi vybranými stránkami. Klik na uzel → sousedé + odkazy.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  var TOP = 30; // kolik nejodkazovanějších technik síť ukáže (zobrazovací mez, ne data)

  function kniha() {
    if (!window.__kniha) {
      window.__kniha = (window.KompendiumKniha ? Promise.resolve() : new Promise(function (ok, fail) {
        var s = document.createElement('script');
        s.src = SRC.replace(/[^/]*$/, 'kniha.js');
        s.onload = ok;
        s.onerror = function () { fail(new Error('kniha.js se nenačetl')); };
        document.head.appendChild(s);
      })).then(function () { return window.KompendiumKniha.ready(); });
    }
    return window.__kniha;
  }

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var canvas = document.getElementById('ea-network-2d');
    if (!canvas || typeof Chart === 'undefined') return;
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
    var selected = null;

    function famLabel(fid) { return fid + (K.familyName(fid) ? ' ' + K.familyName(fid) : ''); }

    function show(t) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', t.code + ' — ' + t.label));
      detail.appendChild(K.h('p', 'text-slate-400 text-sm', famLabel(t.family) + ' • odkazů z knihy: ' + t.node.in));
      detail.appendChild(K.h('p', 'text-slate-300 mt-2 font-semibold', 'Sousední techniky podle odkazů v knize (' + nb[t.id].length + '):'));
      detail.appendChild(K.list(nb[t.id].map(function (id) { return byId[id].node; }), function (n) {
        return K.techniqueText(K.technique(n));
      }));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(t.node, '→ stránka techniky'));
      detail.appendChild(p);
    }

    K.chart(canvas, function (c) {
      var edgeData = [];
      edges.forEach(function (e) { edgeData.push(pos[e.a], pos[e.b], { x: NaN, y: NaN }); });
      var sets = fams.map(function (fid) {
        var col = K.familyColor(fid);
        return {
          label: famLabel(fid),
          data: top.filter(function (t) { return t.family === fid; }).map(function (t) {
            return { x: pos[t.id].x, y: pos[t.id].y, t: t };
          }),
          backgroundColor: col, borderColor: col, showLine: false,
          pointRadius: function (ctx) {
            var t = ctx.raw && ctx.raw.t;
            if (!selected || !t) return 8;
            if (t.id === selected) return 14;
            return nb[selected].indexOf(t.id) >= 0 ? 11 : 5;
          },
          pointHoverRadius: 12,
        };
      });
      return {
        type: 'scatter',
        data: { datasets: [{
          label: 'Vazby', data: edgeData, showLine: true, pointRadius: 0, borderWidth: 1,
          borderColor: c.dark ? 'rgba(148,163,184,0.3)' : 'rgba(100,116,139,0.35)',
        }].concat(sets) },
        options: {
          responsive: true,
          plugins: {
            title: { display: true, color: c.text,
              text: top.length + ' nejodkazovanějších technik a ' + edges.length + ' vazeb podle odkazů v knize (klik = sousedé)' },
            legend: { labels: { color: c.text, filter: function (item) { return item.datasetIndex > 0; } } },
            tooltip: {
              filter: function (ctx) { return ctx.raw && ctx.raw.t; },
              callbacks: {
                title: function (items) { return K.techniqueText(items[0].raw.t); },
                label: function (ctx) { return famLabel(ctx.raw.t.family) + ' | ' + nb[ctx.raw.t.id].length + ' sousedů'; },
              },
            },
          },
          scales: {
            x: { display: false, min: -10.5, max: 10.5 },
            y: { display: false, min: -10.5, max: 10.5 },
          },
          onClick: function (e, els, chart) {
            var el = els.filter(function (x) { return x.datasetIndex > 0; })[0];
            if (!el) return;
            var t = chart.data.datasets[el.datasetIndex].data[el.index].t;
            selected = t.id;
            show(t);
            chart.update('none');
          },
        },
      };
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
