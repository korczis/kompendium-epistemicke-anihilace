// Osy knihy: každá stránka podle toho, komu slouží (publikum) a k čemu v obraně je (pilíř).
// Obě osy odvozuje scripts/build-graph.py z data/categories.toml do static/data/graph.json
// (categories.publikum, categories.pilir: popisek, popis a uzly). Tady se nic nevymýšlí:
// teplotní mapa ukazuje průniky os, seznam stránky průniku. Filtr jde nastavit klepnutím do
// mapy, oběma výběry (klávesnice, čtečka) i adresou ?publikum=…&pilir=…, kterou lze sdílet.
(function () {
  'use strict';

  var L = window.KompendiumVrstva;
  var LIST_MAX = 60;
  var PAGES = ['stránka', 'stránky', 'stránek'];

  function el(tag, cls, text) {
    var e = document.createElement(tag);
    if (cls) e.className = cls;
    if (text !== undefined) e.textContent = text;
    return e;
  }

  function init() {
    var root = document.querySelector('[data-osy]');
    var V = window.KompendiumViz;
    if (!root || !V) return;
    var chartEl = root.querySelector('[data-osy-graf]');
    var listEl = root.querySelector('[data-osy-seznam]');
    var noteEl = root.querySelector('[data-osy-vyber]');
    var selA = root.querySelector('[data-osy-publikum]');
    var selB = root.querySelector('[data-osy-pilir]');

    V.graph().then(function (G) {
      var cats = (G.raw && G.raw.categories) || {};
      var A = cats.publikum || {};
      var B = cats.pilir || {};
      var aKeys = Object.keys(A).sort(function (x, y) { return A[y].nodes.length - A[x].nodes.length; });
      var bKeys = Object.keys(B).sort(function (x, y) { return B[y].nodes.length - B[x].nodes.length; });
      if (!aKeys.length || !bKeys.length) {
        V.empty(chartEl, 'Osy chybí v datech', 'graph.json nenese kategorie publikum a pilíř.');
        return;
      }
      var setA = {};
      var setB = {};
      aKeys.forEach(function (k) { setA[k] = new Set(A[k].nodes); });
      bKeys.forEach(function (k) { setB[k] = new Set(B[k].nodes); });

      function nodesOf(a, b) {
        var base = a ? A[a].nodes : b ? B[b].nodes : [];
        return base.filter(function (id) { return (!a || setA[a].has(id)) && (!b || setB[b].has(id)); });
      }

      // Výběry z dat; prázdná volba = celá osa.
      function fill(sel, keys, defs, allLabel) {
        sel.innerHTML = '';
        sel.appendChild(new Option(allLabel, ''));
        keys.forEach(function (k) {
          sel.appendChild(new Option(defs[k].label + ' (' + defs[k].nodes.length + ')', k));
        });
      }
      fill(selA, aKeys, A, '— každé publikum —');
      fill(selB, bKeys, B, '— každý pilíř —');

      var q = L.urlState.get();
      var state = { a: A[q.get('publikum')] ? q.get('publikum') : '', b: B[q.get('pilir')] ? q.get('pilir') : '' };

      function sync() {
        selA.value = state.a;
        selB.value = state.b;
        L.urlState.set({ publikum: state.a, pilir: state.b });
      }

      function renderList() {
        listEl.innerHTML = '';
        if (!state.a && !state.b) {
          noteEl.textContent = 'Vyberte publikum, pilíř nebo pole mapy; zobrazí se stránky průniku.';
          return;
        }
        var ids = nodesOf(state.a, state.b).sort(function (x, y) {
          return G.in[y].length - G.in[x].length || (G.byId[x].title < G.byId[y].title ? -1 : 1);
        });
        var label = [state.a && A[state.a].label, state.b && B[state.b].label].filter(Boolean).join(' × ');
        noteEl.textContent = label + ': ' + ids.length + ' ' + L.plural(ids.length, PAGES) +
          (ids.length > LIST_MAX ? ', zobrazeno ' + LIST_MAX + ' nejodkazovanějších' : '');
        ids.slice(0, LIST_MAX).forEach(function (id) {
          var n = G.byId[id];
          var li = el('li', 'flex flex-col gap-0.5 py-2');
          var a = el('a', 'break-words text-sm font-medium text-primary-700 hover:underline dark:text-primary-400', n.title);
          a.href = G.url(n);
          li.appendChild(a);
          li.appendChild(el('span', 'text-xs text-gray-500 dark:text-gray-400',
            V.sectionLabel(n.section) + ' · ' + G.in[id].length + ' odkazů sem'));
          listEl.appendChild(li);
        });
      }

      function set(a, b) {
        state.a = a;
        state.b = b;
        sync();
        renderList();
      }

      selA.addEventListener('change', function () { set(selA.value, state.b); });
      selB.addEventListener('change', function () { set(state.a, selB.value); });
      root.querySelector('[data-osy-zrusit]').addEventListener('click', function () { set('', ''); });

      var cells = [];
      var max = 1;
      aKeys.forEach(function (a, y) {
        bKeys.forEach(function (b, x) {
          var v = nodesOf(a, b).length;
          if (v > max) max = v;
          cells.push([x, y, v]);
        });
      });

      V.echarts(chartEl, function (t) {
        return {
          tooltip: Object.assign(V.tooltip(t), { formatter: function (p) {
            return A[aKeys[p.data[1]]].label + ' × ' + B[bKeys[p.data[0]]].label + ': ' + p.data[2] + ' ' + L.plural(p.data[2], PAGES);
          } }),
          grid: { left: 8, right: 8, top: 8, bottom: 64 },
          xAxis: V.axis(t, { type: 'category', data: bKeys.map(function (k) { return B[k].label; }),
            axisLabel: { color: t.muted, interval: 0, rotate: 30 } }),
          yAxis: V.axis(t, { type: 'category', data: aKeys.map(function (k) { return A[k].label; }),
            axisLabel: { color: t.muted } }),
          visualMap: { min: 0, max: max, calculable: false, orient: 'horizontal', left: 'center', bottom: 0,
            textStyle: { color: t.muted }, inRange: { color: [t.surface, t.primary] } },
          series: [{ type: 'heatmap', data: cells, label: { show: true, color: t.text },
            emphasis: { itemStyle: { borderColor: t.accent, borderWidth: 2 } } }],
        };
      }).then(function (chart) {
        chart.on('click', function (p) {
          if (p.data) set(aKeys[p.data[1]], bKeys[p.data[0]]);
        });
        keyboard(chart);
        chartEl.setAttribute('data-osy-stav', 'hotovo');
      });

      // Klávesnice: šipky posouvají kurzor po polích mapy (nahoru = vyšší řádek, jak je mapa
      // nakreslená), Home a End na kraj řádku, Enter nebo mezerník pole vybere jako filtr,
      // Escape kurzor schová. Kurzor se oznamuje a nese ho data-osy-kurzor-pole (publikum:pilíř).
      var cursorEl = root.querySelector('[data-osy-kurzor]');
      function keyboard(chart) {
        var cur = null;
        function show(x, y) {
          chart.dispatchAction({ type: 'downplay', seriesIndex: 0 });
          cur = x === null ? null : { x: x, y: y };
          if (!cur) {
            chart.dispatchAction({ type: 'hideTip' });
            chartEl.removeAttribute('data-osy-kurzor-pole');
            if (cursorEl) cursorEl.textContent = '';
            return;
          }
          var i = y * bKeys.length + x;
          chart.dispatchAction({ type: 'highlight', seriesIndex: 0, dataIndex: i });
          chart.dispatchAction({ type: 'showTip', seriesIndex: 0, dataIndex: i });
          chartEl.setAttribute('data-osy-kurzor-pole', aKeys[y] + ':' + bKeys[x]);
          if (cursorEl) {
            cursorEl.textContent = A[aKeys[y]].label + ' × ' + B[bKeys[x]].label + ': ' +
              L.count(cells[i][2], PAGES) + '. Enter pole vybere.';
          }
        }
        chartEl.addEventListener('keydown', function (e) {
          var nx = bKeys.length;
          var ny = aKeys.length;
          if (e.key === 'Escape') { if (cur) { e.preventDefault(); show(null); } return; }
          if ((e.key === 'Enter' || e.key === ' ') && cur) {
            e.preventDefault();
            set(aKeys[cur.y], bKeys[cur.x]);
            return;
          }
          var moves = { ArrowRight: [1, 0], ArrowLeft: [-1, 0], ArrowUp: [0, 1], ArrowDown: [0, -1] };
          if (!(e.key in moves) && e.key !== 'Home' && e.key !== 'End') return;
          e.preventDefault();
          if (!cur) {
            // První stisk: vybrané pole, jinak levé horní.
            var ax = bKeys.indexOf(state.b);
            var ay = aKeys.indexOf(state.a);
            return show(ax < 0 ? 0 : ax, ay < 0 ? ny - 1 : ay);
          }
          if (e.key === 'Home') return show(0, cur.y);
          if (e.key === 'End') return show(nx - 1, cur.y);
          var m = moves[e.key];
          show(Math.min(nx - 1, Math.max(0, cur.x + m[0])), Math.min(ny - 1, Math.max(0, cur.y + m[1])));
        });
        chartEl.addEventListener('blur', function () { if (cur) chart.dispatchAction({ type: 'hideTip' }); });
      }

      sync();
      renderList();
    }).catch(function (e) { V.empty(chartEl, 'Data knihy se nepodařilo načíst', e.message); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
