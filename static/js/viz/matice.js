// Případy × techniky: matice kazuistik a historických případů proti technikám EA, na které
// jejich text odkazuje (static/data/graph.json, Apache ECharts; volitelná síť v cytoscape.js).
// Vše se odvozuje z odkazů při sestavení; stav filtrů drží Alpine.js (x-data="kompendiumMatice()")
// a zrcadlí se do URL (?typ=&rodina=&q=&pohled=&razeni=).
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var CASE_SECTIONS = { 'kompendium/case-studies': 'kazuistiky', 'kompendium/historical-cases': 'historicke' };
  var TECH_SECTION = 'kompendium/techniques';
  // Názvy rodin se plní z odvozeného grafu (graph.json „families“), nic se nepíše ručně.
  var FAMILIES = {};
  var ROW_H = 18;

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function esc(s) {
    return String(s).replace(/[&<>"]/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
    });
  }

  // Čeština: 1 případ, 2–4 případy, 5+ případů.
  function plural(n, one, few, many) { return n + ' ' + (n === 1 ? one : n > 1 && n < 5 ? few : many); }

  function famColor(f) { return V.PALETTE[(f - 1) % V.PALETTE.length]; }
  function famLabel(f) { return 'EA-' + f + ' ' + (FAMILIES[f] || ''); }

  // `ea-1-2-2-falesna-ekvivalence.md` → kód EA-1.2.2, rodina 1; název z titulku bez kódu.
  function technique(n) {
    var file = n.path.split('/').pop();
    var m = /^ea-(\d+)-(\d+)(?:-(\d+))?(?:-|\.md$)/.exec(file);
    if (!m) return null;
    var parts = [m[1], m[2]].concat(m[3] ? [m[3]] : []).map(Number);
    var name = n.title.replace(/^EA[-\s]?\d+(?:[.-]\d+)*\s*[-–:]?\s*/i, '').trim();
    if (name && name.indexOf(' ') === -1 && name.indexOf('-') !== -1) {
      name = name.replace(/-/g, ' ');
      name = name.charAt(0).toUpperCase() + name.slice(1);
    }
    var code = 'EA-' + parts.join('.');
    return { id: n.id, code: code, name: name || code, fam: parts[0], title: n.title,
      key: parts[0] * 1e6 + parts[1] * 1e3 + (parts[2] || 0), cases: [] };
  }

  function caseItem(n, type) {
    var file = n.path.split('/').pop();
    if (file === '_index.md') return null;
    var num = parseInt(file, 10) || 0;
    var short = type === 'kazuistiky'
      ? n.title.replace(/^Případ\s+/, '')
      : 'H' + num + ': ' + n.title.replace(/^Historický případ:\s*/, '');
    return { id: n.id, type: type, num: num, title: n.title, label: short, techs: {} };
  }

  window.kompendiumMatice = function () {
    var chart = null;
    var cy = null;
    var D = null; // { cases, techs, byCase, byTech, G }
    var view = null; // aktuálně vykreslená matice
    var narrow = window.matchMedia('(max-width: 767px)').matches;

    return {
      ready: false,
      error: '',
      typ: '',
      rodina: '',
      q: '',
      pohled: narrow ? 'rodiny' : 'techniky',
      razeni: 'zaber',
      families: [],
      totals: { cases: 0, techs: 0, links: 0 },
      summary: '',
      isEmpty: false,
      topTech: [],
      topCases: [],
      list: [],
      listOpen: false,
      netN: 20,
      netShown: false,
      netNote: '',
      netHover: '',

      init: function () {
        var self = this;
        var p = new URLSearchParams(location.search);
        if (p.get('typ') === 'kazuistiky' || p.get('typ') === 'historicke') this.typ = p.get('typ');
        var r = /^(?:EA-)?([1-9])$/i.exec(p.get('rodina') || '');
        if (r) this.rodina = r[1];
        this.q = p.get('q') || '';
        if (p.get('pohled') === 'rodiny' || p.get('pohled') === 'techniky') this.pohled = p.get('pohled');
        if (p.get('razeni') === 'kniha') this.razeni = 'kniha';
        V.graph().then(function (G) {
          Object.keys(G.families).forEach(function (k) {
            var num = /^EA-(\d+)$/.exec(k);
            if (num) FAMILIES[Number(num[1])] = G.families[k];
          });
          D = self.index(G);
          self.families = Object.keys(FAMILIES).map(Number).filter(function (f) {
            return D.techs.some(function (t) { return t.fam === f && t.cases.length; });
          }).map(function (f) { return { value: String(f), label: famLabel(f) }; });
          return V.echarts(self.$refs.chart, function (t) { return self.option(t); });
        }).then(function (c) {
          chart = c;
          chart.on('click', function (e) { self.click(e); });
          self.ready = true;
          self.apply();
        }).catch(function (e) {
          self.error = e.message;
          V.empty(self.$refs.chart, 'Matici se nepodařilo načíst', esc(e.message));
        });
      },

      // Případy, techniky a jejich vazby (jen odkazy případ → technika, bez rozcestníků).
      index: function (G) {
        var cases = [];
        var techById = {};
        G.nodes.forEach(function (n) {
          if (CASE_SECTIONS[n.section]) {
            var c = caseItem(n, CASE_SECTIONS[n.section]);
            if (c) { c.url = G.url(n); cases.push(c); }
          } else if (n.section === TECH_SECTION) {
            var t = technique(n);
            if (t) { t.url = G.url(n); techById[n.id] = t; }
          }
        });
        var links = 0;
        cases.forEach(function (c) {
          G.out[c.id].forEach(function (dst) {
            var t = techById[dst];
            if (!t || c.techs[dst]) return;
            c.techs[dst] = true;
            t.cases.push(c.id);
            links += 1;
          });
        });
        var byCase = {};
        cases.forEach(function (c) { byCase[c.id] = c; });
        var techs = Object.keys(techById).map(function (k) { return techById[k]; })
          .sort(function (a, b) { return a.key - b.key || a.id - b.id; });
        var used = techs.filter(function (t) { return t.cases.length; });
        this.totals = { cases: cases.length, techs: used.length, links: links };
        return { G: G, cases: cases, techs: used, byCase: byCase, byTech: techById };
      },

      setTyp: function (v) { this.typ = v; this.apply(); },
      setPohled: function (v) { this.pohled = v; this.apply(); },
      reset: function () { this.typ = ''; this.rodina = ''; this.q = ''; this.razeni = 'zaber'; this.apply(); },

      remember: function () {
        var url = new URL(location.href);
        var vals = { typ: this.typ, rodina: this.rodina ? 'EA-' + this.rodina : '', q: this.q.trim(),
          pohled: this.pohled === (narrow ? 'rodiny' : 'techniky') ? '' : this.pohled,
          razeni: this.razeni === 'kniha' ? 'kniha' : '' };
        Object.keys(vals).forEach(function (k) {
          if (vals[k]) url.searchParams.set(k, vals[k]); else url.searchParams.delete(k);
        });
        history.replaceState(null, '', url);
      },

      // Filtry → viditelné řádky (případy) a sloupce (techniky) s vazbami.
      compute: function () {
        var self = this;
        var fam = this.rodina ? Number(this.rodina) : 0;
        var rows = D.cases.filter(function (c) { return !self.typ || c.type === self.typ; });
        var cols = D.techs.filter(function (t) { return !fam || t.fam === fam; });
        var fq = fold(this.q.trim());
        if (fq) {
          var rowSet = {};
          var colSet = {};
          var colOk = {};
          cols.forEach(function (t) { colOk[t.id] = true; });
          var hitTech = cols.filter(function (t) { return fold(t.code + ' ' + t.name + ' ' + t.title).indexOf(fq) !== -1; });
          var hitCase = rows.filter(function (c) { return fold(c.title).indexOf(fq) !== -1; });
          hitTech.forEach(function (t) {
            colSet[t.id] = true;
            t.cases.forEach(function (id) { rowSet[id] = true; });
          });
          hitCase.forEach(function (c) {
            rowSet[c.id] = true;
            Object.keys(c.techs).forEach(function (id) { if (colOk[id]) colSet[id] = true; });
          });
          rows = rows.filter(function (c) { return rowSet[c.id]; });
          cols = cols.filter(function (t) { return colSet[t.id]; });
        }
        var colIn = {};
        cols.forEach(function (t) { colIn[t.id] = true; });
        rows = rows.map(function (c) {
          var ts = Object.keys(c.techs).filter(function (id) { return colIn[id]; }).map(Number);
          return { c: c, techs: ts };
        }).filter(function (r) { return r.techs.length; });
        var rowIn = {};
        rows.forEach(function (r) { rowIn[r.c.id] = true; });
        cols = cols.map(function (t) {
          return { t: t, cases: t.cases.filter(function (id) { return rowIn[id]; }) };
        }).filter(function (x) { return x.cases.length; });
        var typeOrder = { kazuistiky: 0, historicke: 1 };
        rows.sort(function (a, b) {
          return (typeOrder[a.c.type] - typeOrder[b.c.type]) ||
            (self.razeni === 'zaber' ? b.techs.length - a.techs.length : 0) || a.c.num - b.c.num;
        });
        return { rows: rows, cols: cols, links: rows.reduce(function (s, r) { return s + r.techs.length; }, 0) };
      },

      apply: function () {
        if (!D) return;
        if (this.rodina && this.pohled === 'rodiny') this.pohled = 'techniky';
        this.remember();
        var v = this.compute();
        var techView = this.pohled === 'techniky';
        v.techView = techView;
        v.fams = [];
        if (!techView) {
          var seen = {};
          v.cols.forEach(function (x) { seen[x.t.fam] = true; });
          v.fams = Object.keys(seen).map(Number).sort(function (a, b) { return a - b; });
        }
        view = v;
        this.isEmpty = !v.rows.length;
        var n = v.rows.length;
        var rowsText = this.typ === 'kazuistiky' ? plural(n, 'kazuistika', 'kazuistiky', 'kazuistik')
          : this.typ === 'historicke' ? plural(n, 'historický případ', 'historické případy', 'historických případů')
            : plural(n, 'případ', 'případy', 'případů');
        this.summary = this.isEmpty ? 'Filtrům neodpovídá žádný případ.'
          : rowsText + ' × ' + (techView ? plural(v.cols.length, 'technika', 'techniky', 'technik')
            : plural(v.fams.length, 'rodina', 'rodiny', 'rodin')) +
            ' · ' + plural(v.links, 'vazba', 'vazby', 'vazeb') + (this.rodina ? ' · rodina ' + famLabel(Number(this.rodina)) : '');
        this.topTech = v.cols.slice().sort(function (a, b) {
          return b.cases.length - a.cases.length || a.t.key - b.t.key;
        }).slice(0, 15).map(function (x) {
          return { code: x.t.code, name: x.t.name, url: x.t.url, count: x.cases.length, color: famColor(x.t.fam),
            aria: x.t.code + ' ' + x.t.name + ': ' + plural(x.cases.length, 'případ', 'případy', 'případů') };
        });
        var maxT = this.topTech.length ? this.topTech[0].count : 1;
        this.topTech.forEach(function (x) { x.pct = Math.max(4, Math.round(100 * x.count / maxT)); });
        this.topCases = v.rows.slice().sort(function (a, b) {
          return b.techs.length - a.techs.length || a.c.type.localeCompare(b.c.type) || a.c.num - b.c.num;
        }).slice(0, 10).map(function (r) {
          return { label: r.c.label, url: r.c.url, count: r.techs.length, hist: r.c.type === 'historicke',
            aria: r.c.label + ': ' + plural(r.techs.length, 'technika', 'techniky', 'technik') };
        });
        var maxC = this.topCases.length ? this.topCases[0].count : 1;
        this.topCases.forEach(function (x) { x.pct = Math.max(4, Math.round(100 * x.count / maxC)); });
        if (this.listOpen) this.buildList();
        this.draw();
        if (this.netShown) this.showNet();
      },

      buildList: function () {
        this.list = view.rows.map(function (r) {
          return { id: r.c.id, label: r.c.label, url: r.c.url, techs: r.techs.map(function (id) { return D.byTech[id]; })
            .sort(function (a, b) { return a.key - b.key; })
            .map(function (t) { return { id: t.id, code: t.code, name: t.name, url: t.url }; }) };
        });
      },

      toggleList: function (open) {
        this.listOpen = open;
        if (open && view) this.buildList();
      },

      draw: function () {
        if (!chart) return;
        var el = this.$refs.chart;
        // okraj nahoře (posuvník) + popisky osy x + legenda dole + řádky
        var head = view.techView ? 30 + 62 : 12 + 40;
        el.style.height = Math.max(320, head + 44 + Math.max(view.rows.length, 6) * ROW_H) + 'px';
        chart.resize();
        var t = V.theme();
        var opt = this.option(t);
        opt.backgroundColor = 'transparent';
        opt.textStyle = { fontFamily: 'Inter, system-ui, sans-serif', color: t.text };
        chart.setOption(opt, true);
      },

      option: function (t) {
        if (!view) return { series: [] };
        var v = view;
        var w = this.$refs.chart.clientWidth || 360;
        var labelW = w < 520 ? 104 : 220;
        var yLabels = {};
        v.rows.forEach(function (r) { yLabels[r.c.id] = r.c.label; });
        var cells = [];
        var xData;
        var visualMap;
        var dataZoom = [];
        var xLabel;
        if (v.techView) {
          xData = v.cols.map(function (x) { return String(x.t.id); });
          var colIndex = {};
          v.cols.forEach(function (x, i) { colIndex[x.t.id] = i; });
          v.rows.forEach(function (r, y) {
            r.techs.forEach(function (id) { cells.push([colIndex[id], y, D.byTech[id].fam]); });
          });
          var famsPresent = {};
          v.cols.forEach(function (x) { famsPresent[x.t.fam] = true; });
          visualMap = { type: 'piecewise', dimension: 2, orient: 'horizontal', left: 'center', bottom: 0,
            itemWidth: 12, itemHeight: 12, itemGap: 8, textStyle: { color: t.muted, fontSize: 11 },
            pieces: Object.keys(famsPresent).map(Number).sort(function (a, b) { return a - b; })
              .map(function (f) { return { value: f, label: 'EA-' + f, color: famColor(f) }; }) };
          xLabel = { color: t.muted, fontSize: 10, rotate: 90, interval: 0,
            formatter: function (id) { return D.byTech[id] ? D.byTech[id].code : id; } };
          var fit = Math.max(8, Math.floor((w - labelW - 40) / 15));
          if (xData.length > fit) {
            dataZoom = [{ type: 'slider', xAxisIndex: 0, top: 6, height: 16, startValue: 0, endValue: fit - 1,
              showDetail: false, brushSelect: false, borderColor: t.grid, textStyle: { color: t.muted },
              fillerColor: 'rgba(79,70,229,0.18)', handleStyle: { color: '#4f46e5' }, moveHandleSize: 0 }];
          }
        } else {
          xData = v.fams.map(String);
          var famIndex = {};
          v.fams.forEach(function (f, i) { famIndex[f] = i; });
          var max = 1;
          v.rows.forEach(function (r, y) {
            var counts = {};
            r.techs.forEach(function (id) { var f = D.byTech[id].fam; counts[f] = (counts[f] || 0) + 1; });
            Object.keys(counts).forEach(function (f) {
              cells.push([famIndex[f], y, counts[f]]);
              max = Math.max(max, counts[f]);
            });
          });
          // Číslo v buňce musí mít kontrast vůči světlému i tmavému konci škály.
          cells = cells.map(function (c) {
            var high = c[2] > max / 2;
            return { value: c, label: { color: high === !t.dark ? '#ffffff' : '#111827' } };
          });
          visualMap = { type: 'continuous', dimension: 2, min: 1, max: max, orient: 'horizontal', left: 'center',
            bottom: 0, itemHeight: 140, itemWidth: 10, calculable: false, text: ['více technik', 'méně'],
            textStyle: { color: t.muted, fontSize: 11 },
            inRange: { color: t.dark ? ['#4338ca', '#e0e7ff'] : ['#a5b4fc', '#312e81'] } };
          xLabel = { color: t.muted, fontSize: 11, interval: 0, rotate: w < 520 ? 90 : 0,
            formatter: function (f) { return 'EA-' + f; } };
        }
        return {
          animation: false,
          tooltip: Object.assign({ trigger: 'item', confine: true, formatter: function (p) {
            if (p.componentType !== 'series') return '';
            var r = v.rows[p.value[1]];
            if (!r) return '';
            var head = '<b>' + esc(r.c.title) + '</b><br>';
            if (v.techView) {
              var tch = v.cols[p.value[0]].t;
              return head + esc(tch.code + ' ' + tch.name) + '<br><span style="color:' + t.muted + '">' +
                esc(famLabel(tch.fam)) + ' · klepnutím otevřete případ</span>';
            }
            var f = v.fams[p.value[0]];
            var list = r.techs.map(function (id) { return D.byTech[id]; }).filter(function (x) { return x.fam === f; })
              .sort(function (a, b) { return a.key - b.key; });
            return head + esc(famLabel(f)) + ': ' + plural(list.length, 'technika', 'techniky', 'technik') +
              '<br>' + list.slice(0, 8).map(function (x) { return esc(x.code + ' ' + x.name); }).join('<br>') +
              (list.length > 8 ? '<br>…' : '') + '<br><span style="color:' + t.muted + '">klepnutím otevřete případ</span>';
          } }, V.tooltip(t)),
          grid: { left: 8, right: 12, top: v.techView && dataZoom.length ? 30 : 12, bottom: 44, containLabel: true },
          xAxis: { type: 'category', position: 'top', data: xData, triggerEvent: true,
            axisLine: { lineStyle: { color: t.grid } }, axisTick: { show: false }, axisLabel: xLabel,
            splitArea: { show: false } },
          yAxis: { type: 'category', inverse: true, data: v.rows.map(function (r) { return String(r.c.id); }),
            triggerEvent: true, axisLine: { lineStyle: { color: t.grid } }, axisTick: { show: false },
            axisLabel: { color: t.muted, fontSize: 11, width: labelW, overflow: 'truncate', interval: 0,
              formatter: function (id) { return yLabels[id] || id; } } },
          dataZoom: dataZoom,
          visualMap: visualMap,
          series: [{ type: 'heatmap', data: cells,
            label: { show: !v.techView, fontSize: 10, formatter: function (p) { return p.value[2]; } },
            itemStyle: { borderColor: t.surface, borderWidth: 1, borderRadius: 2 },
            emphasis: { itemStyle: { borderColor: t.text, borderWidth: 1.5 } } }],
        };
      },

      click: function (e) {
        var v = view;
        if (!v) return;
        if (e.componentType === 'series' && e.value && v.rows[e.value[1]]) {
          window.location.href = v.rows[e.value[1]].c.url;
        } else if (e.componentType === 'yAxis' && D.byCase[e.value]) {
          window.location.href = D.byCase[e.value].url;
        } else if (e.componentType === 'xAxis') {
          if (v.techView && D.byTech[e.value]) window.location.href = D.byTech[e.value].url;
          else if (!v.techView && FAMILIES[e.value]) { this.rodina = String(e.value); this.pohled = 'techniky'; this.apply(); }
        }
      },

      // Bipartitní síť: N nejčastějších technik aktuálního výběru a případy, které na ně odkazují.
      showNet: function () {
        var self = this;
        if (!view) return;
        this.netShown = true;
        var top = view.cols.slice().sort(function (a, b) { return b.cases.length - a.cases.length || a.t.key - b.t.key; })
          .slice(0, Number(this.netN));
        if (cy) { cy.destroy(); cy = null; }
        var el = this.$refs.net;
        if (!top.length) { V.empty(el, 'Žádné techniky', 'Filtrům neodpovídá žádná vazba.'); this.netNote = ''; return; }
        var els = [];
        var caseSeen = {};
        top.forEach(function (x) {
          els.push({ data: { id: 't' + x.t.id, label: x.t.code, color: famColor(x.t.fam), fontSize: 10,
            size: Math.round(14 + Math.sqrt(x.cases.length) * 5), url: x.t.url,
            info: x.t.code + ' ' + x.t.name + ' · ' + plural(x.cases.length, 'případ', 'případy', 'případů') } });
          x.cases.forEach(function (id) {
            var c = D.byCase[id];
            if (!caseSeen[id]) {
              caseSeen[id] = true;
              els.push({ data: { id: 'c' + id, label: c.type === 'historicke' ? 'H' + c.num : 'K' + c.num,
                color: c.type === 'historicke' ? '#64748b' : '#94a3b8', fontSize: 8, size: 9, url: c.url, info: c.title } });
            }
            els.push({ data: { id: 'e' + id + '-' + x.t.id, source: 'c' + id, target: 't' + x.t.id, width: 0.8 } });
          });
        });
        this.netNote = plural(top.length, 'technika', 'techniky', 'technik') + ', ' +
          plural(Object.keys(caseSeen).length, 'případ', 'případy', 'případů') + '. Barva techniky = rodina, šedě případy (K = kazuistika, H = historický případ). Klepnutím otevřete stránku.';
        return V.cytoscape(el, els, { name: 'cose', animate: false, nodeRepulsion: 60000, idealEdgeLength: 60, padding: 20 })
          .then(function (c) {
            cy = c;
            if (narrow) { cy.userZoomingEnabled(false); cy.userPanningEnabled(false); }
            cy.on('tap', 'node', function (ev) { window.location.href = ev.target.data('url'); });
            cy.on('mouseover', 'node', function (ev) {
              var n = ev.target;
              self.netHover = n.data('info');
              cy.elements().addClass('faded');
              n.closedNeighborhood().removeClass('faded');
              n.connectedEdges().addClass('hl');
            });
            cy.on('mouseout', 'node', function () { self.netHover = ''; cy.elements().removeClass('faded hl'); });
          }).catch(function (e) { V.empty(el, 'Síť se nepodařilo načíst', esc(e.message)); });
      },
    };
  };
})();
