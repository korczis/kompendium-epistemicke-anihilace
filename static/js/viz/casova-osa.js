// Časová osa historických případů (/kompendium/historical-cases/): graf období po kategoriích
// (ECharts, vlastní řada typu „Gantt“), filtry kategorie, hledání bez ohledu na diakritiku,
// „jen probíhající“ a souběžný seznam karet seřazený podle roku začátku.
// Data: období, místo a kategorie z data/graph.json (kompendium-graph/v2, KompendiumViz.graph()),
// popisy a odkazy z inline JSON #osa-data (odvozený ze section.pages při sestavení), barvy
// a třídy kategorií z #osa-kategorie. Stav drží Alpine.js (x-data="kompendiumCasovaOsa()";
// init() volá Alpine sám) a zrcadlí se do URL (?kategorie=a,b&q=&probiha=1).
// Třídy Tailwindu jsou jen v šabloně (partials/explorer-historical.html), aby je CSS našlo.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');
  var SECTION = 'kompendium/historical-cases';
  var TECHNIQUES = 'kompendium/techniques';
  var NOW = new Date().getFullYear();
  var DEFAULT_START = 1900;
  var ROW = 24;       // výška řádku případu i záhlaví dráhy (px)
  var BAR = 14;       // výška pruhu (px)
  var TOP = 28;       // osa let nahoře
  var BOTTOM = 56;    // jezdec přiblížení dole
  var FONT = '500 11px Inter, system-ui, sans-serif';
  var HEAD_FONT = '600 12px Inter, system-ui, sans-serif';

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function readJson(id, fallback) {
    var node = document.getElementById(id);
    if (!node) return fallback;
    try { return JSON.parse(node.textContent); } catch (e) { return fallback; }
  }

  function params() {
    try { return new URLSearchParams(window.location.search); } catch (e) { return new URLSearchParams(); }
  }

  // Barva textu podle jasu pruhu (bílá na tmavém, gray-900 na světlém).
  function ink(hex) {
    var n = parseInt(hex.slice(1), 16);
    var l = (0.299 * (n >> 16) + 0.587 * ((n >> 8) & 255) + 0.114 * (n & 255)) / 255;
    return l > 0.62 ? '#111827' : '#ffffff';
  }

  function alpha(hex, a) {
    var n = parseInt(hex.slice(1), 16);
    return 'rgba(' + (n >> 16) + ',' + ((n >> 8) & 255) + ',' + (n & 255) + ',' + a + ')';
  }

  var measureCtx = null;
  function textWidth(text, font) {
    try {
      if (!measureCtx) measureCtx = document.createElement('canvas').getContext('2d');
      measureCtx.font = font;
      return measureCtx.measureText(text).width;
    } catch (e) {
      return text.length * 6.5;
    }
  }

  function periodLabel(c) {
    if (c.start === null) return 'období neuvedeno';
    if (c.ongoing) return 'od ' + c.start + ', probíhá';
    if (c.end === null || c.end === c.start) return String(c.start);
    return c.start + '–' + c.end;
  }

  function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, function (ch) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[ch];
    });
  }

  window.kompendiumCasovaOsa = function () {
    var chart = null;
    var layout = [];   // případy v pořadí dat řady grafu (dataIndex → případ)
    var lanes = [];
    var CATS = readJson('osa-kategorie', {});

    function catMeta(label) {
      return CATS[label] || CATS[''] || { order: 99, slug: 'ostatni', short: label, color: '#64748b', cls: '' };
    }

    return {
      items: [],
      categories: [],
      q: '',
      cats: [],
      ongoingOnly: false,
      ready: false,
      failed: false,
      minYear: DEFAULT_START,
      maxYear: NOW + 3,
      zoomStart: DEFAULT_START,
      zoomEnd: NOW + 3,

      init: function () {
        var self = this;
        var inline = readJson('osa-data', []);
        var byPath = {};
        inline.forEach(function (r) { byPath[r.path] = r; });
        // Bez grafu odkazů zůstane aspoň seznam z inline dat (bez období).
        this.items = inline.map(function (r) { return self.makeItem(r, null, null); });
        this.sortItems();
        this.buildCategories();

        var p = params();
        this.q = p.get('q') || '';
        this.ongoingOnly = p.get('probiha') === '1';
        this.applyCatsParam(p.get('kategorie'));

        ['q', 'cats', 'ongoingOnly'].forEach(function (k) {
          self.$watch(k, function () { self.syncUrl(); self.render(); });
        });

        V.graph().then(function (g) {
          var nodes = g.nodes.filter(function (n) {
            return n.section === SECTION && typeof n.period_start === 'number';
          });
          if (!nodes.length) throw new Error('graph.json neobsahuje období případů (očekáváno kompendium-graph/v2).');
          self.items = nodes.map(function (n) {
            var techs = {};
            (g.out[n.id] || []).forEach(function (id) {
              var m = g.byId[id];
              if (m && m.section === TECHNIQUES) techs[id] = true;
            });
            return self.makeItem(byPath[n.path] || {}, n, Object.keys(techs).map(Number), g.url(n));
          });
          self.sortItems();
          self.buildCategories();
          self.applyCatsParam(params().get('kategorie'));
          var starts = self.items.map(function (c) { return c.start; });
          self.minYear = Math.floor(Math.min.apply(null, starts.concat([DEFAULT_START])) / 10) * 10;
          self.zoomStart = Math.max(self.minYear, DEFAULT_START);
          self.ready = true;
          self.drawChart();
        }).catch(function (e) {
          self.ready = true;
          self.failed = true;
          var el = self.$refs.chart;
          if (el) {
            el.style.height = 'auto';
            V.empty(el, 'Časovou osu se nepodařilo načíst', escapeHtml(e.message) +
              ' Případy najdete v seznamu níže.');
          }
        });
      },

      makeItem: function (r, n, techs, graphUrl) {
        var title = r.title || (n && n.title) || r.path || '';
        var category = (n && n.category) || '';
        var meta = catMeta(category);
        var start = n && typeof n.period_start === 'number' ? n.period_start : null;
        var end = n && typeof n.period_end === 'number' ? n.period_end : null;
        var item = {
          path: r.path || (n && n.path) || '',
          url: r.permalink || graphUrl || '#',
          title: title,
          short: title.replace(/^\s*Historický případ:\s*/i, ''),
          description: r.description || '',
          category: category,
          categoryLabel: category || 'Ostatní',
          categoryShort: meta.short || category || 'Ostatní',
          slug: meta.slug,
          color: meta.color,
          cls: meta.cls,
          order: meta.order,
          place: (n && n.place) || '',
          start: start,
          end: end,
          ongoing: !!(n && n.ongoing),
          techniques: techs ? techs.length : 0,
          techIds: techs || [],
        };
        item.periodLabel = periodLabel(item);
        item.hay = fold([item.title, item.place, item.categoryLabel, item.description, item.periodLabel,
          item.ongoing ? 'probiha' : ''].join(' '));
        item.sortTitle = fold(item.short);
        return item;
      },

      sortItems: function () {
        this.items.sort(function (a, b) {
          var sa = a.start === null ? 1e9 : a.start;
          var sb = b.start === null ? 1e9 : b.start;
          return sa - sb || a.sortTitle.localeCompare(b.sortTitle, 'cs');
        });
      },

      buildCategories: function () {
        var seen = {};
        this.items.forEach(function (c) {
          var k = c.slug;
          if (!seen[k]) seen[k] = { slug: k, label: c.categoryLabel, short: c.categoryShort, color: c.color, order: c.order, count: 0 };
          seen[k].count++;
        });
        this.categories = Object.keys(seen).map(function (k) { return seen[k]; })
          .sort(function (a, b) { return a.order - b.order || a.label.localeCompare(b.label, 'cs'); });
        // Bez grafu nejsou kategorie známé: jediná „Ostatní“ nemá smysl jako filtr.
        if (this.categories.length === 1 && this.categories[0].slug === 'ostatni') this.categories = [];
      },

      applyCatsParam: function (raw) {
        var known = this.categories.map(function (c) { return c.slug; });
        var want = String(raw || '').split(',').map(function (s) { return s.trim(); })
          .filter(function (s) { return known.indexOf(s) >= 0; });
        if (want.join(',') !== this.cats.join(',')) this.cats = want;
      },

      get active() { return !!(this.q.trim() || this.cats.length || this.ongoingOnly); },

      get ongoingCount() { return this.items.filter(function (c) { return c.ongoing; }).length; },

      get filtered() {
        var self = this;
        var terms = fold(this.q).split(/\s+/).filter(Boolean);
        return this.items.filter(function (c) {
          if (self.cats.length && self.cats.indexOf(c.slug) < 0) return false;
          if (self.ongoingOnly && !c.ongoing) return false;
          for (var i = 0; i < terms.length; i++) if (c.hay.indexOf(terms[i]) < 0) return false;
          return true;
        });
      },

      get stats() {
        var rows = this.filtered;
        var techs = {};
        var ongoing = 0;
        var lo = Infinity;
        var hi = -Infinity;
        rows.forEach(function (c) {
          if (c.ongoing) ongoing++;
          c.techIds.forEach(function (id) { techs[id] = true; });
          if (c.start !== null) {
            lo = Math.min(lo, c.start);
            hi = Math.max(hi, c.ongoing ? NOW : (c.end === null ? c.start : c.end));
          }
        });
        var span = lo === Infinity ? '—' : (lo === hi ? String(lo) : lo + '–' + (hi === NOW && rows.some(function (c) { return c.ongoing; }) ? 'dnes' : hi));
        return { ongoing: ongoing, techniques: Object.keys(techs).length, span: span };
      },

      get summary() {
        var n = this.filtered.length;
        var total = this.items.length;
        if (!this.active) return nf.format(total) + ' případů na časové ose';
        return nf.format(n) + ' z ' + nf.format(total) + ' případů odpovídá filtru';
      },

      get defaultLabel() { return Math.max(this.minYear, DEFAULT_START) + '–dnes'; },

      get zoomPreset() {
        var near = function (a, b) { return Math.abs(a - b) < 0.75; };
        if (near(this.zoomStart, this.minYear) && near(this.zoomEnd, this.maxYear)) return 'all';
        if (near(this.zoomStart, Math.max(this.minYear, DEFAULT_START)) && near(this.zoomEnd, this.maxYear)) return 'default';
        return '';
      },

      get zoomLabel() {
        var s = Math.round(this.zoomStart);
        var e = Math.round(this.zoomEnd);
        return s + '–' + (e >= NOW ? 'dnes' : e);
      },

      get chartLabel() {
        var rows = this.filtered;
        return 'Časová osa ' + nf.format(rows.length) + ' historických případů po kategoriích, zobrazené období ' +
          this.zoomLabel + ': ' + rows.map(function (c) { return c.short + ' ' + c.periodLabel; }).join('; ') +
          '. Stejné případy jsou dostupné jako odkazy v seznamu pod grafem.';
      },

      fmt: function (n) { return nf.format(n || 0); },

      techWord: function (n) {
        if (n === 1) return 'technika';
        if (n >= 2 && n <= 4) return 'techniky';
        return 'technik';
      },

      toggleCategory: function (slug) {
        var i = this.cats.indexOf(slug);
        this.cats = i >= 0 ? this.cats.filter(function (s) { return s !== slug; }) : this.cats.concat([slug]);
      },

      reset: function () { this.q = ''; this.cats = []; this.ongoingOnly = false; },

      syncUrl: function () {
        try {
          var p = params();
          var set = function (k, v) { if (v) p.set(k, v); else p.delete(k); };
          set('kategorie', this.cats.join(','));
          set('q', this.q.trim());
          set('probiha', this.ongoingOnly ? '1' : '');
          var qs = p.toString().replace(/%2C/g, ',');
          window.history.replaceState(null, '', window.location.pathname + (qs ? '?' + qs : '') + window.location.hash);
        } catch (e) { /* bez History API zůstane filtr jen na stránce */ }
      },

      // Řádky grafu: záhlaví dráhy kategorie, pod ním její případy (každý na vlastní stopě).
      buildLayout: function () {
        var rows = this.filtered.filter(function (c) { return c.start !== null; });
        var groups = {};
        var order = [];
        rows.forEach(function (c) {
          if (!groups[c.slug]) { groups[c.slug] = []; order.push(c); }
          groups[c.slug].push(c);
        });
        order.sort(function (a, b) { return a.order - b.order; });
        layout = [];
        lanes = [];
        var row = 0;
        order.forEach(function (head, li) {
          var list = groups[head.slug];
          lanes.push({ top: row, bottom: row + 1 + list.length, label: head.categoryLabel, short: head.categoryShort, color: head.color, count: list.length, idx: li });
          row++;
          list.forEach(function (c) { layout.push({ c: c, row: row }); row++; });
        });
        return row;
      },

      option: function (t) {
        var self = this;
        var total = this.buildLayout();
        var narrow = (this.$refs.chart && this.$refs.chart.clientWidth < 560) || false;

        var laneData = lanes.map(function (l) { return [0, l.top, l.bottom, l.idx]; });
        var caseData = layout.map(function (r, i) {
          var c = r.c;
          var endDrawn = c.ongoing ? NOW + 1 : (c.end === null ? c.start : c.end) + 1;
          return { value: [c.start, endDrawn, r.row, i], name: c.short };
        });

        function renderLane(params, api) {
          var l = lanes[api.value(3)];
          var cs = params.coordSys;
          var y0 = api.coord([self.zoomStart, api.value(1)])[1];
          var y1 = api.coord([self.zoomStart, api.value(2)])[1];
          var head = y0 + ROW / 2;
          var label = (narrow ? l.short : l.label) + '  ·  ' + l.count;
          return {
            type: 'group',
            children: [
              { type: 'rect', shape: { x: cs.x, y: y0 + 1, width: cs.width, height: y1 - y0 - 2, r: 6 },
                style: { fill: alpha(l.color, t.dark ? 0.12 : 0.07) } },
              { type: 'rect', shape: { x: cs.x + 8, y: head - 5, width: 10, height: 10, r: 2 }, style: { fill: l.color } },
              { type: 'text', style: { text: label, x: cs.x + 24, y: head, fill: t.text, font: HEAD_FONT,
                verticalAlign: 'middle', width: cs.width - 32, overflow: 'truncate' } },
            ],
          };
        }

        function renderCase(params, api) {
          var r = layout[api.value(3)];
          var c = r.c;
          var cs = params.coordSys;
          var box = { x: cs.x, y: cs.y, width: cs.width, height: cs.height };
          var y = api.coord([c.start, r.row + 0.5])[1];
          var x0 = api.coord([api.value(0), 0])[0];
          var x1 = api.coord([api.value(1), 0])[0];
          if (x1 - x0 < 6) { var mid = (x0 + x1) / 2; x0 = mid - 3; x1 = mid + 3; }
          var rect = window.echarts.graphic.clipRectByRect({ x: x0, y: y - BAR / 2, width: x1 - x0, height: BAR }, box);
          var children = [];
          var right = cs.x + cs.width;
          var endVisible = x1 <= right + 0.5;
          if (rect) {
            var fill = c.color;
            if (c.ongoing && endVisible && rect.width > 24) {
              var fadeFrom = Math.max(0, 1 - Math.min(60, rect.width * 0.4) / rect.width);
              fill = new window.echarts.graphic.LinearGradient(0, 0, 1, 0, [
                { offset: 0, color: c.color }, { offset: fadeFrom, color: c.color },
                { offset: 1, color: alpha(c.color, 0.25) },
              ]);
            }
            children.push({ type: 'rect', shape: { x: rect.x, y: rect.y, width: rect.width, height: rect.height, r: 3 },
              style: { fill: fill }, emphasis: { style: { stroke: t.text, lineWidth: 2 } } });
          }
          var tipX = x1;
          if (c.ongoing && endVisible && rect) {
            children.push({ type: 'polygon', shape: { points: [[x1, y - BAR / 2 - 2], [x1 + 8, y], [x1, y + BAR / 2 + 2]] },
              style: { fill: alpha(c.color, 0.6) } });
            tipX = x1 + 9;
          }
          // Popisek: v pruhu, když se vejde celý; jinak na tu stranu pruhu, kde se vejde celý;
          // když nikde, na stranu s více místem (zkrácený).
          var text = c.short + (c.ongoing ? ' · probíhá' : '');
          var tw = textWidth(text, FONT) + 4;
          var inside = rect ? rect.width - 12 : 0;
          var after = right - Math.max(tipX, cs.x) - 6;
          var before = Math.min(x0, right) - cs.x - 6;
          var label;
          if (rect && inside >= tw) {
            label = { x: rect.x + 6, width: inside, align: 'left', fill: ink(c.color) };
          } else if (after >= tw || (before < tw && after >= before)) {
            label = { x: Math.max(tipX, cs.x) + 4, width: Math.max(after, 0), align: 'left', fill: t.text };
          } else {
            label = { x: Math.min(x0, right) - 4, width: Math.max(before, 0), align: 'right', fill: t.text };
          }
          if (label.width > 16) {
            children.push({ type: 'text', style: { text: text, x: label.x, y: y, fill: label.fill, font: FONT,
              align: label.align, verticalAlign: 'middle', width: label.width, overflow: 'truncate' } });
          }
          return { type: 'group', children: children };
        }

        var sliderText = { color: t.muted, fontSize: 11 };
        return {
          animation: false,
          grid: { left: 8, right: 16, top: TOP, bottom: BOTTOM, containLabel: false },
          tooltip: Object.assign({
            trigger: 'item', confine: true,
            formatter: function (p) {
              if (p.seriesIndex !== 1) return '';
              var c = layout[p.dataIndex].c;
              return '<div style="max-width:18rem;white-space:normal">' +
                '<b>' + escapeHtml(c.short) + '</b><br>' +
                '<span style="color:' + c.color + '">●</span> ' + escapeHtml(c.categoryLabel) + '<br>' +
                'Období: ' + escapeHtml(c.periodLabel) + '<br>' +
                (c.place ? 'Místo: ' + escapeHtml(c.place) + '<br>' : '') +
                'Odkazované techniky: ' + nf.format(c.techniques) + '<br>' +
                '<span style="color:' + t.muted + '">Klepnutím otevřete případ</span></div>';
            },
          }, V.tooltip(t)),
          xAxis: V.axis(t, {
            type: 'value', position: 'top', min: this.minYear, max: this.maxYear, minInterval: 1,
            splitNumber: narrow ? 4 : 8,
            axisLabel: { color: t.muted, formatter: function (v) { return v > NOW ? '' : String(Math.round(v)); } },
            axisTick: { show: false },
          }),
          yAxis: { type: 'value', inverse: true, min: 0, max: Math.max(total, 1), show: false },
          dataZoom: [
            { type: 'slider', xAxisIndex: 0, filterMode: 'none', startValue: this.zoomStart, endValue: this.zoomEnd,
              left: 40, right: 40, bottom: 12, height: 22, showDataShadow: false, brushSelect: false, minValueSpan: 5,
              labelFormatter: function (v) { return v >= NOW ? 'dnes' : String(Math.round(v)); },
              borderColor: t.grid, backgroundColor: 'transparent', fillerColor: alpha('#4f46e5', t.dark ? 0.25 : 0.15),
              handleStyle: { color: t.surface, borderColor: t.primary }, moveHandleStyle: { color: alpha('#4f46e5', 0.5) },
              textStyle: sliderText, emphasis: { handleStyle: { borderColor: t.primary } } },
            { type: 'inside', xAxisIndex: 0, filterMode: 'none', disabled: narrow, minValueSpan: 5,
              zoomOnMouseWheel: 'ctrl', moveOnMouseWheel: false, moveOnMouseMove: true, preventDefaultMouseMove: false },
          ],
          series: [
            { type: 'custom', name: 'kategorie', silent: true, renderItem: renderLane, data: laneData,
              encode: { x: 0, y: [1, 2] }, clip: true, z: 1 },
            { type: 'custom', name: 'případy', renderItem: renderCase, data: caseData,
              encode: { x: [0, 1], y: 2, tooltip: [0, 1] }, clip: true, z: 2, cursor: 'pointer' },
          ],
        };
      },

      chartHeight: function () {
        var rows = this.filtered.filter(function (c) { return c.start !== null; });
        var laneCount = {};
        rows.forEach(function (c) { laneCount[c.slug] = true; });
        return TOP + BOTTOM + (rows.length + Object.keys(laneCount).length) * ROW;
      },

      drawChart: function () {
        var self = this;
        var el = this.$refs.chart;
        if (!el || !this.items.length) return;
        el.style.height = Math.max(this.chartHeight(), 160) + 'px';
        V.echarts(el, function (t) { return self.option(t); }).then(function (c) {
          chart = c;
          chart.on('click', function (p) {
            if (p.seriesIndex === 1 && layout[p.dataIndex]) window.location.href = layout[p.dataIndex].c.url;
          });
          chart.on('datazoom', function () {
            var dz = chart.getOption().dataZoom[0];
            self.zoomStart = dz.startValue;
            self.zoomEnd = dz.endValue;
          });
          // Po změně šířky se mění zkrácené popisky drah i to, zda je zapnuté přibližování gestem.
          var lastNarrow = el.clientWidth < 560;
          window.addEventListener('resize', function () {
            var n = el.clientWidth < 560;
            if (n !== lastNarrow) { lastNarrow = n; self.render(); }
          });
        }).catch(function (e) {
          self.failed = true;
          el.style.height = 'auto';
          V.empty(el, 'Časovou osu se nepodařilo načíst', escapeHtml(e.message) + ' Případy najdete v seznamu níže.');
        });
      },

      render: function () {
        if (!chart || !this.filtered.length) return;
        var self = this;
        var el = this.$refs.chart;
        // Graf mohl být skrytý (prázdný výběr): rozměr se přepočítá až po zobrazení.
        this.$nextTick(function () {
          el.style.height = Math.max(self.chartHeight(), 160) + 'px';
          chart.setOption(self.option(V.theme()), true);
          chart.resize();
        });
      },

      zoomTo: function (preset) {
        if (!chart) return;
        var start = preset === 'all' ? this.minYear : Math.max(this.minYear, DEFAULT_START);
        chart.dispatchAction({ type: 'dataZoom', dataZoomIndex: 0, startValue: start, endValue: this.maxYear });
        chart.dispatchAction({ type: 'dataZoom', dataZoomIndex: 1, startValue: start, endValue: this.maxYear });
        this.zoomStart = start;
        this.zoomEnd = this.maxYear;
      },

      hover: function (c, on) {
        if (!chart) return;
        var i = -1;
        for (var k = 0; k < layout.length; k++) if (layout[k].c === c) { i = k; break; }
        if (i < 0) return;
        chart.dispatchAction({ type: on ? 'highlight' : 'downplay', seriesIndex: 1, dataIndex: i });
      },
    };
  };
})();
