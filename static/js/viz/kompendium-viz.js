// Sdílený vizualizační modul kompendia: data grafu odkazů (static/data/graph.json,
// kompendium-graph/v1) a metrik (metrics.json, kompendium-metrics/v1), barvy pro světlý
// i tmavý režim, prázdné stavy ve stylu Flowbite Pro a jediné dvě obálky Apache ECharts: graf
// (echarts) a síť (network). Knihovna se načítá až ve chvíli, kdy ji stránka potřebuje.
//
//   V.echarts(el, function (t) { return option; })  → Promise<chart>
//     Jediné místo, které volá echarts.init (ecInit). Plochu staví, až je vidět a má nenulovou
//     šířku i výšku; option je funkce tématu (t = KompendiumVrstva.theme()) a po přepnutí
//     tématu se přepočítá. Vrstva doplní pohyb (850 ms cubicOut, zpoždění min(i·14, 420) ms,
//     změny 380 ms; nic při prefers-reduced-motion), aria popis z aria-label plochy, paletu,
//     písmo, přepočet velikosti (ResizeObserver) a rámec s ovládáním Maximalizovat
//     (KompendiumVrstva.frame). Druhé volání nad touž plochou jen vymění option.
//   V.network(el, function (t, box) { return { nodes: [...], edges: [...] }; }, opts)
//     → Promise<net>; síť nad grafem ECharts (series graph), viz komentář u network().
(function () {
  'use strict';
  // Šablona ji může vložit víckrát (stránka i pohled); inicializuje se jen jednou.
  if (window.KompendiumViz) return;

  var body = document.body;
  var base = (body.getAttribute('data-base-url') || '').replace(/\/$/, '');
  var basePath = base.replace(/^https?:\/\/[^/]+/, '');
  var cache = {};

  // Barvy tématu a kategorická paleta mají jediný zdroj: komponentovou vrstvu (vrstva.js,
  // načtená synchronně v <head> každé stránky).
  var L = window.KompendiumVrstva;
  var PALETTE = L.PALETTE;
  var isDark = L.isDark;
  var theme = L.theme;

  function loadScript(name) {
    if (cache['js:' + name]) return cache['js:' + name];
    cache['js:' + name] = new Promise(function (resolve, reject) {
      var s = document.createElement('script');
      s.src = basePath + '/js/vendor/' + name;
      s.onload = resolve;
      s.onerror = function () { reject(new Error('Nepodařilo se načíst ' + name)); };
      document.head.appendChild(s);
    });
    return cache['js:' + name];
  }

  function json(path) {
    if (!cache[path]) {
      cache[path] = fetch(basePath + '/' + path).then(function (r) {
        if (!r.ok) throw new Error(path + ': HTTP ' + r.status);
        return r.json();
      });
    }
    return cache[path];
  }

  // Adresa, na které Zola stránku skutečně servíruje (slugify.paths = "on"): bez diakritiky,
  // malými písmeny, ostatní znaky jako pomlčka. Odvozená data nesou cestu podle názvu souboru
  // („…/12-EA-stigma-risk/“), kterou by GitHub Pages (rozlišuje velikost písmen) neobsloužil.
  // Stejné pravidlo má scripts/build-ui-data.py (slug).
  function pageUrl(url) {
    var parts = String(url || '').split('/').filter(Boolean).map(window.KompendiumVrstva.slug);
    return '/' + parts.join('/') + (parts.length ? '/' : '');
  }

  // Graf s indexy: podle id, podle cesty, sousedé dovnitř i ven, barva oddílu.
  function graph() {
    if (cache.graphIndex) return cache.graphIndex;
    // Táž adresa jako hledání v záhlaví (body[data-graph], s cachebust), ať se stáhne jednou.
    var src = document.body && document.body.getAttribute('data-graph');
    var load = src ? fetch(src).then(function (r) {
      if (!r.ok) throw new Error('data/graph.json: HTTP ' + r.status);
      return r.json();
    }) : json('data/graph.json');
    cache.graphIndex = load.then(function (g) {
      var byId = {};
      var byPath = {};
      var out = {};
      var inn = {};
      var sections = [];
      var sectionIndex = {};
      g.nodes.forEach(function (n) {
        n.url = pageUrl(n.url);
        byId[n.id] = n;
        byPath[n.path] = n;
        out[n.id] = [];
        inn[n.id] = [];
        if (!(n.section in sectionIndex)) {
          sectionIndex[n.section] = sections.length;
          sections.push(n.section);
        }
      });
      g.edges.forEach(function (e) {
        if (byId[e[0]] && byId[e[1]] && e[0] !== e[1]) {
          out[e[0]].push(e[1]);
          inn[e[1]].push(e[0]);
        }
      });
      return {
        raw: g, nodes: g.nodes, edges: g.edges, byId: byId, byPath: byPath, out: out, in: inn,
        // Názvy rodin technik odvozené při sestavení (graph v2 „families“, např. EA-1 → název).
        families: g.families || {},
        sections: sections,
        color: function (section) { return PALETTE[(sectionIndex[section] || 0) % PALETTE.length]; },
        url: function (n) { return basePath + n.url; },
      };
    });
    return cache.graphIndex;
  }

  function sectionLabel(section) {
    if (section === 'root') return 'Úvod';
    var last = section.split('/').pop();
    return last.replace(/^\d+-/, '').replace(/-/g, ' ');
  }

  // Prázdný stav místo grafu; graf, který na ploše byl, se uvolní (další V.echarts začne znovu).
  function empty(el, title, text) {
    var st = el.__vrstvaChart;
    if (st && st.chart && !st.chart.isDisposed()) st.chart.dispose();
    el.__vrstvaChart = null;
    el.__vrstvaNet = null;
    el.innerHTML = '<div class="flex h-full min-h-48 flex-col items-center justify-center p-6 text-center">' +
      '<svg class="mb-3 h-10 w-10 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z"/></svg>' +
      '<p class="text-base font-semibold text-gray-900 dark:text-white">' + title + '</p>' +
      '<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">' + text + '</p></div>';
  }

  // ---- Graf: jediná obálka ECharts (ecInit) ----------------------------------------------------

  // Plocha je vidět (KompendiumVrstva.lazy) a má nenulovou šířku i výšku; skrytý nebo nulový
  // box se nestaví (ECharts by ho nakreslil do 0 px a už nepřepočítal).
  function whenShown(el) {
    return new Promise(function (ok) {
      L.lazy(el, function () {
        if ((el.clientWidth && el.clientHeight) || !('ResizeObserver' in window)) { ok(); return; }
        var ro = new ResizeObserver(function () {
          if (el.clientWidth && el.clientHeight) { ro.disconnect(); ok(); }
        });
        ro.observe(el);
      });
    });
  }

  function motion(opt) {
    if (L.reducedMotion()) { opt.animation = false; return; }
    if (opt.animation === false) return;
    if (opt.animationDuration == null) opt.animationDuration = 850;
    if (opt.animationEasing == null) opt.animationEasing = 'cubicOut';
    if (opt.animationDelay == null) opt.animationDelay = function (i) { return Math.min(i * 14, 420); };
    if (opt.animationDurationUpdate == null) opt.animationDurationUpdate = 380;
    if (opt.animationEasingUpdate == null) opt.animationEasingUpdate = 'cubicOut';
  }

  function echartsIn(el, makeOption) {
    if (!el) return Promise.reject(new Error('graf nemá plochu'));
    var st = el.__vrstvaChart;
    if (st) {
      st.make = makeOption;
      return st.ready.then(function (chart) { st.render(); return chart; });
    }
    st = el.__vrstvaChart = { make: makeOption, hooks: [] };
    st.ready = Promise.all([loadScript('echarts.min.js'), whenShown(el)]).then(function () {
      L.frame(el);
      el.innerHTML = '';
      var chart = window.echarts.init(el, null, { renderer: 'canvas' });
      st.chart = chart;
      st.render = function () {
        if (chart.isDisposed()) return;
        var t = theme();
        var opt = st.make(t);
        opt.backgroundColor = 'transparent';
        opt.textStyle = Object.assign({ fontFamily: 'Inter, system-ui, sans-serif', color: t.text }, opt.textStyle || {});
        opt.color = opt.color || PALETTE;
        if (!opt.aria) opt.aria = { enabled: true, label: { description: el.getAttribute('aria-label') || '' } };
        motion(opt);
        chart.setOption(opt, true);
        st.hooks.forEach(function (fn) { fn(chart); });
      };
      st.render();
      // Popisky os se měří písmem; dokud se Inter nenačte, změřily by se jiným, takže graf se po
      // načtení písma vykreslí znovu.
      if (document.fonts && document.fonts.status !== 'loaded') document.fonts.ready.then(st.render);
      document.addEventListener('dark-mode', st.render);
      if ('ResizeObserver' in window) {
        new ResizeObserver(function () { if (!chart.isDisposed()) chart.resize(); }).observe(el);
      } else {
        window.addEventListener('resize', function () { chart.resize(); });
      }
      return chart;
    });
    return st.ready;
  }

  // ---- Síť: jediná obálka grafu uzlů a hran (ECharts series graph) ---------------------------
  //
  //   V.network(el, build, opts) → Promise<net>
  //   build(t, box) vrací { nodes, edges, title?, categories? } pro téma t a velikost plochy box = {w, h}; volá se
  //   znovu po přepnutí tématu (a při opts.relayout i po změně velikosti plochy).
  //     node: { id, label, color, size (číslo nebo [š, v]), shape ('circle' | 'box' | 'cap'),
  //             fontSize, labelShow ('show' | 'hover' | 'none'), labelPos, labelWidth,
  //             labelColor, labelWrap, labelBold, labelBg, focus, info (text bubliny), x, y, ring,
  //             category (index do categories), data }
  //     categories: [{ name, color }] = legenda, která skupiny uzlů skrývá a ukazuje
  //     edge: { source, target, width, color, opacity, dashed, arrow }
  //   opts: layout   'force'  rozmístění silami (Fruchterman–Reingold, deterministické: start na
  //                           spirále, pevný počet kroků), pak bez vlastního layoutu ECharts;
  //                  'rings'  soustředné kruhy (node.ring, jinak podle pořadí: první uzel nebo
  //                           uzly s focus uprostřed, další kruhy s rostoucí kapacitou);
  //                  'none'   souřadnice uzlů (x, y) v libovolných jednotkách, přizpůsobí se ploše;
  //                  'pixel'  souřadnice v pixelech plochy; je-li kresba větší než plocha, celá se
  //                           rovnoměrně zmenší (pozice, velikosti i písmo);
  //         force    { length, repulsion, gravity, iterations };
  //         roam     posun tažením, přiblížení Ctrl+kolečkem a tlačítky na liště (v maximalizovaném
  //                  rámci vždy); bez roam plocha nekrade rolování stránky;
  //         focus    false = bez zvýraznění sousedství při najetí (jinak 'adjacency');
  //         select   true = výběr uzlu (net.select), vybraný má rámeček a popisek;
  //         relayout true = build se volá znovu při změně velikosti plochy;
  //         labels   N = popisek mají jen uzly s N největšími velikostmi, ostatní při najetí;
  //         onClick(node, event), onDblClick(node), onHover(node | null).
  //   net: { chart, el, nodes(), select(id), fit() }

  // Fruchterman–Reingold s chlazením; vstup i výsledek jsou deterministické.
  function forceLayout(nodes, edges, o) {
    var n = nodes.length;
    var k = o.length || 60;
    var rep = o.repulsion || 1;
    var grav = o.gravity == null ? 0.04 : o.gravity;
    var iters = o.iterations || (n > 220 ? 160 : 300);
    var x = new Float64Array(n);
    var y = new Float64Array(n);
    var dx = new Float64Array(n);
    var dy = new Float64Array(n);
    var idx = {};
    // Poloměr uzlu v jednotkách rozvržení: velké uzly se odpuzují na větší vzdálenost.
    var rad = new Float64Array(n);
    nodes.forEach(function (d, i) {
      idx[d.id] = i;
      rad[i] = (Array.isArray(d.size) ? d.size[0] : d.size || 10) / 2;
      var r = k * 0.5 * Math.sqrt(i + 0.5);
      x[i] = r * Math.cos(i * 2.399963);
      y[i] = r * Math.sin(i * 2.399963);
    });
    var E = [];
    edges.forEach(function (e) {
      var a = idx[e.source];
      var b = idx[e.target];
      if (a !== undefined && b !== undefined && a !== b) E.push(a, b);
    });
    var temp = k * 2;
    var k2 = k * k * rep;
    for (var it = 0; it < iters; it++) {
      dx.fill(0);
      dy.fill(0);
      for (var i = 0; i < n; i++) {
        for (var j = i + 1; j < n; j++) {
          var ddx = x[i] - x[j];
          var ddy = y[i] - y[j];
          var d2 = ddx * ddx + ddy * ddy;
          if (d2 < 0.01) { ddx = 0.1 * ((i % 3) - 1 || 1); ddy = 0.1; d2 = 0.02; }
          var kk = k + rad[i] + rad[j];
          var f = k2 * (kk * kk) / (k * k) / d2;
          dx[i] += ddx * f; dy[i] += ddy * f;
          dx[j] -= ddx * f; dy[j] -= ddy * f;
        }
      }
      for (var e = 0; e < E.length; e += 2) {
        var a = E[e];
        var b = E[e + 1];
        var ex = x[a] - x[b];
        var ey = y[a] - y[b];
        var d = Math.sqrt(ex * ex + ey * ey) || 0.01;
        var g = d / k;
        dx[a] -= ex * g; dy[a] -= ey * g;
        dx[b] += ex * g; dy[b] += ey * g;
      }
      for (var m = 0; m < n; m++) {
        dx[m] -= grav * x[m] * k / 10;
        dy[m] -= grav * y[m] * k / 10;
        var disp = Math.sqrt(dx[m] * dx[m] + dy[m] * dy[m]);
        if (disp > 0) {
          var step = Math.min(disp, temp) / disp;
          x[m] += dx[m] * step;
          y[m] += dy[m] * step;
        }
      }
      temp = Math.max(k * 0.02, temp * 0.97);
    }
    nodes.forEach(function (d, i) { d.x = x[i]; d.y = y[i]; });
  }

  // Soustředné kruhy; elipsa podle poměru stran plochy, aby kresba vyplnila celý box.
  function ringLayout(nodes, box) {
    var ring = [];
    var auto = nodes.some(function (d) { return d.ring == null; });
    if (auto) {
      var centre = nodes.filter(function (d) { return d.focus; });
      if (!centre.length && nodes.length) centre = [nodes[0]];
      var rest = nodes.filter(function (d) { return centre.indexOf(d) < 0; });
      centre.forEach(function (d) { d.ring = 0; });
      var r = 1;
      var cap = 8;
      var used = 0;
      rest.forEach(function (d) {
        if (used >= cap) { r += 1; cap = 8 * r; used = 0; }
        d.ring = r;
        used += 1;
      });
    }
    nodes.forEach(function (d) { (ring[d.ring] = ring[d.ring] || []).push(d); });
    var ax = box && box.h ? Math.max(0.6, Math.min(2.2, box.w / box.h)) : 1;
    ring.forEach(function (list, r) {
      if (!list) return;
      list.forEach(function (d, i) {
        if (r === 0 && list.length === 1) { d.x = 0; d.y = 0; return; }
        var a = -Math.PI / 2 + (r % 2 ? 0 : Math.PI / list.length) + (2 * Math.PI * i) / list.length;
        var rr = r === 0 ? 0.35 : r;
        d.x = Math.cos(a) * rr * 100 * ax;
        d.y = Math.sin(a) * rr * 100;
      });
    });
  }

  // Kresba v pixelech plochy; větší než plocha se zmenší celá (pozice, velikosti i písmo).
  function pixelFit(nodes, box, pad) {
    var x0 = Infinity; var y0 = Infinity; var x1 = -Infinity; var y1 = -Infinity;
    nodes.forEach(function (d) {
      var s = Array.isArray(d.size) ? d.size : [d.size || 10, d.size || 10];
      x0 = Math.min(x0, d.x - s[0] / 2); x1 = Math.max(x1, d.x + s[0] / 2);
      y0 = Math.min(y0, d.y - s[1] / 2); y1 = Math.max(y1, d.y + s[1] / 2);
    });
    var k = Math.min(1, (box.w - 2 * pad) / Math.max(1, x1 - x0), (box.h - 2 * pad) / Math.max(1, y1 - y0));
    var ox = (box.w - (x1 - x0) * k) / 2 - x0 * k;
    var oy = (box.h - (y1 - y0) * k) / 2 - y0 * k;
    nodes.forEach(function (d) {
      d.x = d.x * k + ox;
      d.y = d.y * k + oy;
      if (k < 1) {
        d.size = Array.isArray(d.size) ? [d.size[0] * k, d.size[1] * k] : (d.size || 10) * k;
        d.fontSize = Math.max(7, (d.fontSize || 10) * k);
        if (d.labelWidth) d.labelWidth *= k;
      }
    });
    // Rámec série = obal středů uzlů, takže ECharts kreslí 1:1 (poměr stran souhlasí).
    var cx0 = Infinity; var cy0 = Infinity; var cx1 = -Infinity; var cy1 = -Infinity;
    nodes.forEach(function (d) {
      cx0 = Math.min(cx0, d.x); cx1 = Math.max(cx1, d.x);
      cy0 = Math.min(cy0, d.y); cy1 = Math.max(cy1, d.y);
    });
    if (cx1 - cx0 < 2) { cx0 -= 1; cx1 += 1; }
    if (cy1 - cy0 < 2) { cy0 -= 1; cy1 += 1; }
    return { left: cx0, top: cy0, width: cx1 - cx0, height: cy1 - cy0 };
  }

  function network(el, build, opts) {
    opts = opts || {};
    if (!el) return Promise.reject(new Error('síť nemá plochu'));
    var st = el.__vrstvaNet;
    if (!st) {
      st = el.__vrstvaNet = { zoom: 1, selected: null, nodes: [], posKey: '', pos: {} };
      st.api = {
        el: el,
        nodes: function () { return st.nodes; },
        select: function (id) {
          st.selected = id == null ? null : String(id);
          if (!st.chart) return;
          st.chart.dispatchAction({ type: 'unselect', seriesIndex: 0,
            dataIndex: st.nodes.map(function (d, i) { return i; }) });
          var i = st.index[st.selected];
          if (i !== undefined) st.chart.dispatchAction({ type: 'select', seriesIndex: 0, dataIndex: i });
        },
        fit: function () { st.zoom = 1; if (el.__vrstvaChart && el.__vrstvaChart.render) el.__vrstvaChart.render(); },
      };
    }
    st.build = build;
    st.opts = opts;

    function roams() {
      return !!(st.opts.roam || el.getAttribute('data-vrstva-max') === 'on');
    }

    function option(t) {
      var o = st.opts;
      var box = { w: el.clientWidth || 360, h: el.clientHeight || 300 };
      var m = st.build(t, box) || { nodes: [], edges: [] };
      var nodes = m.nodes.map(function (d) { return Object.assign({}, d, { id: String(d.id) }); });
      var edges = (m.edges || []).map(function (e) {
        return Object.assign({}, e, { source: String(e.source), target: String(e.target) });
      });
      var layout = o.layout || 'force';
      var rect = { left: 36, right: 36, top: 36, bottom: 36 };
      if (layout === 'force') {
        var key = nodes.map(function (d) { return d.id; }).join(',') + '|' +
          edges.map(function (e) { return e.source + '-' + e.target; }).join(',');
        if (key !== st.posKey) {
          forceLayout(nodes, edges, o.force || {});
          st.pos = {};
          nodes.forEach(function (d) { st.pos[d.id] = [d.x, d.y]; });
          st.posKey = key;
        } else {
          nodes.forEach(function (d) { d.x = st.pos[d.id][0]; d.y = st.pos[d.id][1]; });
        }
      } else if (layout === 'rings') {
        ringLayout(nodes, box);
      } else if (layout === 'pixel') {
        rect = pixelFit(nodes, box, o.padding == null ? 8 : o.padding);
      }
      var top = o.labels ? nodes.slice().sort(function (a, b) {
        var sa = Array.isArray(a.size) ? a.size[0] : a.size || 0;
        var sb = Array.isArray(b.size) ? b.size[0] : b.size || 0;
        return sb - sa;
      }).slice(0, o.labels) : null;
      st.nodes = nodes;
      st.index = {};
      nodes.forEach(function (d, i) { st.index[d.id] = i; });
      var clickable = !!(o.onClick || o.onDblClick);
      var data = nodes.map(function (d) {
        var shape = d.shape || 'circle';
        var show = d.labelShow || (top && top.indexOf(d) < 0 ? 'hover' : 'show');
        var fs = d.fontSize || 10;
        var label = {
          show: show === 'show', color: d.labelColor || t.text, fontSize: fs,
          fontWeight: d.labelBold ? 600 : 400,
          position: d.labelPos || (shape === 'circle' ? 'bottom' : 'inside'),
          width: d.labelWidth || (shape === 'circle' ? 140 : undefined),
          overflow: d.labelWrap ? 'break' : 'truncate', ellipsis: '…',
          lineHeight: Math.round(fs * 1.35),
        };
        if (d.labelBg) {
          Object.assign(label, { backgroundColor: t.surface, padding: [1, 3], borderRadius: 3 });
        }
        var item = {
          id: d.id, name: d.label, x: d.x, y: d.y, symbolSize: d.size || 10,
          symbol: shape === 'circle' ? 'circle' : 'rect',
          itemStyle: shape === 'cap' ? { color: 'transparent', opacity: 0 } : {
            color: d.color, borderColor: d.borderColor || (d.focus ? t.accent : t.surface),
            borderWidth: d.borderWidth != null ? d.borderWidth : d.focus ? 3 : shape === 'circle' ? 1 : 0,
          },
          label: label,
          emphasis: { label: { show: show !== 'none' } },
          select: { label: { show: show !== 'none' }, itemStyle: { borderColor: t.text, borderWidth: 3 } },
          cursor: shape === 'cap' || !clickable ? 'default' : 'pointer',
          selected: st.selected === d.id,
        };
        return item;
      });
      var links = edges.map(function (e) {
        return {
          source: e.source, target: e.target,
          symbol: e.arrow ? ['none', 'arrow'] : ['none', 'none'],
          lineStyle: { width: e.width || 1, color: e.color || t.edge,
            opacity: e.opacity == null ? 0.6 : e.opacity, type: e.dashed ? 'dashed' : 'solid', curveness: 0 },
        };
      });
      var byId = {};
      nodes.forEach(function (d) { byId[d.id] = d; });
      // Nadpis a legenda kategorií (přepínání skupin uzlů) nad sítí.
      var head = 6;
      var title;
      var legend;
      if (m.title) {
        var tw = Math.max(160, box.w - 64);
        title = { text: m.title, left: 8, top: head, textStyle: { color: t.text, fontSize: 13, fontWeight: 600,
          width: tw, overflow: 'break', lineHeight: 18 } };
        head += Math.ceil(m.title.length * 7.2 / tw) * 18 + 4;
      }
      if (m.categories) {
        legend = { type: 'scroll', top: head, left: 8, right: 8, textStyle: { color: t.muted },
          pageTextStyle: { color: t.muted }, data: m.categories.map(function (c) { return c.name; }) };
        head += 30;
        data.forEach(function (item, i) { if (nodes[i].category != null) item.category = nodes[i].category; });
      }
      if (layout !== 'pixel' && head > 6) rect.top = Math.max(rect.top, head + 24);
      return {
        title: title,
        legend: legend,
        tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
          if (p.dataType === 'node') {
            var d = nodes[p.dataIndex];
            return d.shape === 'cap' ? '' : L.esc(d.info || d.label || '');
          }
          var a = byId[p.data.source];
          var b = byId[p.data.target];
          return a && b ? L.esc(a.label + ' → ' + b.label) : '';
        } }, tooltip(t)),
        series: [Object.assign({
          type: 'graph', layout: 'none', data: data, links: links, edgeSymbolSize: 7,
          // Souřadnice se do plochy vejdou bez deformace (kruh zůstane kruhem).
          preserveAspect: 'contain',
          roam: roams() ? 'move' : false, zoom: st.zoom, scaleLimit: { min: 0.3, max: 8 },
          draggable: false, selectedMode: o.select ? 'single' : false,
          emphasis: { focus: o.focus === false ? 'none' : 'adjacency',
            lineStyle: { color: t.primary, opacity: 0.95 } },
          blur: { itemStyle: { opacity: 0.22 }, lineStyle: { opacity: 0.06 }, label: { opacity: 0.25 } },
          labelLayout: { hideOverlap: true },
          categories: m.categories ? m.categories.map(function (c) {
            return { name: c.name, itemStyle: { color: c.color } };
          }) : undefined,
        }, rect)],
      };
    }

    return echartsIn(el, option).then(function (chart) {
      st.chart = chart;
      if (st.bound) return st.api;
      st.bound = true;
      st.api.chart = chart;
      function nodeOf(p) { return p.dataType === 'node' ? st.nodes[p.dataIndex] || null : null; }
      chart.on('click', function (p) {
        var d = nodeOf(p);
        if (d && d.shape !== 'cap' && st.opts.onClick) st.opts.onClick(d, p.event && p.event.event);
      });
      chart.on('dblclick', function (p) {
        var d = nodeOf(p);
        if (d && d.shape !== 'cap' && st.opts.onDblClick) st.opts.onDblClick(d);
      });
      chart.on('mouseover', function (p) { var d = nodeOf(p); if (d && st.opts.onHover) st.opts.onHover(d); });
      chart.on('mouseout', function (p) { if (nodeOf(p) && st.opts.onHover) st.opts.onHover(null); });
      // Přiblížení: Ctrl+kolečko a tlačítka na liště rámce; stránka se kolečkem dál roluje.
      function zoomBy(k) {
        if (!roams()) return;
        st.zoom = Math.max(0.3, Math.min(8, st.zoom * k));
        chart.setOption({ series: [{ zoom: st.zoom }] });
      }
      el.addEventListener('wheel', function (e) {
        if (!e.ctrlKey || !roams()) return;
        e.preventDefault();
        zoomBy(e.deltaY < 0 ? 1.15 : 1 / 1.15);
      }, { passive: false });
      var f = el.__vrstvaFrame;
      if (f) {
        var old = f.bar.querySelector('[data-vrstva-zoom]');
        if (old) old.remove();
        var zoomBar = document.createElement('span');
        zoomBar.className = 'inline-flex gap-1';
        zoomBar.setAttribute('data-vrstva-zoom', '');
        [['+', 'Přiblížit', function () { zoomBy(1.25); }], ['−', 'Oddálit', function () { zoomBy(0.8); }],
          ['⟲', 'Celá síť', function () { st.api.fit(); }]].forEach(function (b) {
          var btn = document.createElement('button');
          btn.type = 'button';
          btn.className = f.btn.className + ' h-8 w-8';
          btn.title = b[1];
          btn.setAttribute('aria-label', b[1]);
          btn.textContent = b[0];
          btn.addEventListener('click', b[2]);
          zoomBar.appendChild(btn);
        });
        f.bar.insertBefore(zoomBar, f.bar.firstChild);
        function syncZoom() { zoomBar.hidden = !roams(); }
        syncZoom();
        f.onToggle(function () { syncZoom(); st.zoom = 1; el.__vrstvaChart.render(); });
      }
      var lastBox = el.clientWidth + 'x' + el.clientHeight;
      if ('ResizeObserver' in window) {
        new ResizeObserver(function () {
          var b = el.clientWidth + 'x' + el.clientHeight;
          if (b === lastBox || !el.clientWidth) return;
          lastBox = b;
          if (st.opts.relayout || st.opts.layout === 'rings' || st.opts.layout === 'pixel') el.__vrstvaChart.render();
        }).observe(el);
      }
      return st.api;
    });
  }

  function axis(t, extra) {
    return Object.assign({
      axisLine: { lineStyle: { color: t.grid } }, axisLabel: { color: t.muted },
      splitLine: { lineStyle: { color: t.grid, type: 'dashed' } }, nameTextStyle: { color: t.muted },
    }, extra || {});
  }

  function tooltip(t) {
    return { backgroundColor: t.surface, borderColor: t.grid, textStyle: { color: t.text },
      extraCssText: 'border-radius:0.5rem;box-shadow:0 10px 15px -3px rgb(0 0 0 / 0.1);' };
  }

  window.KompendiumViz = {
    PALETTE: PALETTE, theme: theme, isDark: isDark, json: json, graph: graph, empty: empty,
    loadScript: loadScript, echarts: echartsIn, network: network, axis: axis, tooltip: tooltip,
    sectionLabel: sectionLabel, basePath: basePath, pageUrl: pageUrl,
  };
})();
