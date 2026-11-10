// Fáze zotavení v čase (Chart.js, plovoucí pruhy na logaritmické ose měsíců). Fáze, jejich
// časové rozpětí a protokoly přebírá z rejstříku longitudinálních protokolů knihy: nadpis
// „Akutní fáze (týdny 1–4)“ dává fázi i rozpětí, odkazy pod ním její protokoly. Žádné
// smyšlené průběhy: graf ukazuje jen to, co kniha uvádí. Klik na pruh → protokoly fáze.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: rejstřík oddílu protokolů zotavení (cesta v grafu knihy).
  var SOURCE = 'kompendium/recovery-protocols/_index.md';

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

  // „(týdny 1–4)“, „(měsíce 3–12)“, „(roky 1–3)“ → rozpětí v měsících.
  function span(title) {
    var m = /(týd[^\s\d]*|měs[^\s\d]*|rok[^\s\d]*|let)\s*(\d+)\s*[–-]\s*(\d+)/i.exec(title);
    if (!m) return null;
    var u = m[1].toLowerCase();
    var f = /^týd/.test(u) ? 12 / 52 : /^měs/.test(u) ? 1 : 12;
    return [+m[2] * f, +m[3] * f, m[0]];
  }

  function months(v) {
    if (v < 1) return Math.round(v * 52 / 12) + ' týd.';
    if (v < 12) return Math.round(v) + ' měs.';
    return Math.round(v / 12) + ' r.';
  }

  function init() {
    var canvas = document.getElementById('recovery-trajectory');
    if (!canvas || typeof Chart === 'undefined') return;
    var detail = document.getElementById('recovery-detail');
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) {
        var phases = [];
        var other = [];
        groups.forEach(function (gr) {
          var s = span(gr.title);
          if (s) phases.push({ title: gr.title.replace(/\s*\(.*\)\s*$/, ''), span: s, group: gr });
          else other.push(gr);
        });
        if (!phases.length) throw new Error('rejstřík neuvádí časová rozpětí fází');
        var ticks = [];
        phases.forEach(function (p) { [p.span[0], p.span[1]].forEach(function (v) { if (ticks.indexOf(v) < 0) ticks.push(v); }); });
        ticks.sort(function (a, b) { return a - b; });
        // na logaritmické ose by se značky blízkých hodnot (4 týdny, 1 měsíc) překrývaly
        ticks = ticks.filter(function (v, i) { return !i || v / ticks[i - 1] > 1.25; });
        var lo = ticks[0] / 1.5;
        var hi = ticks[ticks.length - 1] * 1.5;

        function show(p) {
          if (!detail) return;
          K.clear(detail);
          detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', p.group.title));
          if (p.group.text) detail.appendChild(K.h('p', 'text-slate-300 mt-1', p.group.text));
          detail.appendChild(K.h('p', 'text-slate-400 text-sm mt-1', p.group.nodes.length + ' protokolů podle rejstříku:'));
          detail.appendChild(K.list(p.group.nodes));
        }

        if (detail && other.length) {
          K.clear(detail);
          detail.appendChild(K.h('p', 'text-slate-300 text-sm', 'Bez časového rozpětí v rejstříku: ' +
            other.map(function (o) { return o.title + ' (' + o.nodes.length + ')'; }).join(', ') + '.'));
          detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
        }

        K.chart(canvas, function (c) {
          return {
            type: 'bar',
            data: {
              labels: phases.map(function (p) { return p.title; }),
              datasets: [{
                label: 'Rozpětí fáze',
                data: phases.map(function (p) { return [p.span[0], p.span[1]]; }),
                backgroundColor: phases.map(function (p, i) { return K.V.PALETTE[i % K.V.PALETTE.length] + 'B3'; }),
                borderColor: phases.map(function (p, i) { return K.V.PALETTE[i % K.V.PALETTE.length]; }),
                borderWidth: 2, borderSkipped: false,
              }],
            },
            options: {
              indexAxis: 'y',
              responsive: true,
              plugins: {
                title: { display: true, text: 'Fáze zotavení v čase podle rejstříku protokolů knihy', color: c.text },
                legend: { display: false },
                tooltip: { callbacks: { label: function (ctx) {
                  var p = phases[ctx.dataIndex];
                  return p.span[2] + ' • ' + p.group.nodes.length + ' protokolů';
                } } },
              },
              scales: {
                x: {
                  type: 'logarithmic', min: lo, max: hi,
                  afterBuildTicks: function (axis) { axis.ticks = ticks.map(function (v) { return { value: v }; }); },
                  ticks: { color: c.muted, callback: function (v) { return months(v); } },
                  grid: { color: c.grid },
                  title: { display: true, text: 'Čas od začátku zotavení (logaritmicky)', color: c.text },
                },
                y: { ticks: { color: c.muted }, grid: { color: c.grid } },
              },
              onClick: function (e, els) { if (els.length) show(phases[els[0].index]); },
            },
          };
        });
      });
    }).catch(function (e) { failed(detail, e); });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
