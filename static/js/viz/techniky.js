// Průzkumník katalogu technik (/kompendium/techniques/): hledání bez ohledu na diakritiku,
// filtr rodiny EA-n a úrovně rizika, řazení, stránkování a graf rodin (ECharts treemap).
// Data: inline JSON #techniky-data (odvozený ze section.pages při sestavení) a počty odkazů
// sem z data/graph.json (KompendiumViz.graph()). Stav ovládání drží Alpine.js
// (x-data="kompendiumTechniky()"; init() volá Alpine sám, proto bez x-init). Filtr se
// zrcadlí do URL (?q=, ?rodina=, ?riziko=, ?razeni=).
// Třídy Tailwindu jsou jen v šabloně (partials/explorer-techniques.html), aby je CSS našlo.
(function () {
  'use strict';

  var V = window.KompendiumViz;
  var nf = new Intl.NumberFormat('cs-CZ');
  var STEP = 25;
  var SORTS = ['kod', 'nazev', 'rozsah', 'odkazy'];
  var RISK_ALIASES = { 'kritická': 'critical', 'kriticka': 'critical' };

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function readJson(id, fallback) {
    var node = document.getElementById(id);
    if (!node) return fallback;
    try { return JSON.parse(node.textContent); } catch (e) { return fallback; }
  }

  // Kód z front matter, jinak z názvu souboru (ea-1-3-2-….md → EA-1.3.2, ea-4-1-….md → EA-4.1).
  function codeOf(r) {
    if (r.code) return String(r.code).trim();
    var m = /(?:^|\/)ea-(\d+)-(\d+)(?:-(\d+))?(?=[-.])/i.exec(r.path || '');
    return m ? 'EA-' + m[1] + '.' + m[2] + (m[3] ? '.' + m[3] : '') : '';
  }

  function codeKey(code) {
    var m = /^EA-(\d+)(?:\.(\d+))?(?:\.(\d+))?/i.exec(code || '');
    return m ? [+m[1], +(m[2] || 0), +(m[3] || 0)] : [999, 0, 0];
  }

  function cmpKey(a, b) {
    for (var i = 0; i < 3; i++) if (a[i] !== b[i]) return a[i] - b[i];
    return 0;
  }

  function riskId(raw) {
    var r = fold(raw).trim();
    return RISK_ALIASES[r] || r;
  }

  // Barva textu podle jasu dlaždice (bílá na tmavé, gray-900 na světlé).
  function ink(hex) {
    var n = parseInt(hex.slice(1), 16);
    var l = (0.299 * (n >> 16) + 0.587 * ((n >> 8) & 255) + 0.114 * (n & 255)) / 255;
    return l > 0.62 ? '#111827' : '#ffffff';
  }

  function params() {
    try { return new URLSearchParams(window.location.search); } catch (e) { return new URLSearchParams(); }
  }

  window.kompendiumTechniky = function () {
    var chart = null;
    var RISKS = readJson('techniky-rizika', {});

    return {
      items: [],
      families: [],
      risks: [],
      q: '',
      family: '',
      risk: '',
      sort: 'kod',
      limit: STEP,
      step: STEP,
      linksReady: false,

      init: function () {
        var self = this;
        var raw = readJson('techniky-data', []);
        var fam = {};
        var riskCount = {};
        this.items = raw.map(function (r) {
          var code = codeOf(r);
          var key = codeKey(code);
          var fid = key[0] === 999 ? 'EA-?' : 'EA-' + key[0];
          var rid = riskId(r.risk);
          var f = fam[fid] = fam[fid] || { id: fid, n: key[0], count: 0, cats: {} };
          f.count++;
          if (r.category) {
            var cat = String(r.category).replace(/^\s*\d+\.\s*/, '');
            f.cats[cat] = (f.cats[cat] || 0) + 1;
          }
          if (rid) riskCount[rid] = (riskCount[rid] || 0) + 1;
          return {
            title: r.title || code || r.path, permalink: r.permalink, description: r.description || '',
            words: +r.words || 0, code: code, key: key, family: fid, risk: rid,
            subcategory: r.subcategory || '', path: r.path, inLinks: null,
            hay: fold([code, code.replace(/\./g, '-'), r.title, r.description, r.subcategory, r.category].join(' ')),
            sortTitle: fold(r.title),
          };
        });
        this.families = Object.keys(fam).map(function (k) { return fam[k]; })
          .sort(function (a, b) { return a.n - b.n; })
          .map(function (f, i) {
            var name = Object.keys(f.cats).sort(function (a, b) { return f.cats[b] - f.cats[a]; })[0];
            var color = V.PALETTE[i % V.PALETTE.length];
            return { id: f.id, name: name || (f.id === 'EA-?' ? 'Bez kódu' : 'Rodina ' + f.id), count: f.count, color: color };
          });
        this.risks = Object.keys(riskCount).map(function (k) {
          var meta = RISKS[k] || {};
          return { id: k, label: meta.label || k, order: meta.order || 50, count: riskCount[k] };
        }).sort(function (a, b) { return a.order - b.order; });

        var p = params();
        this.q = p.get('q') || '';
        if (this.families.some(function (f) { return f.id === p.get('rodina'); })) this.family = p.get('rodina');
        if (this.risks.some(function (r) { return r.id === p.get('riziko'); })) this.risk = p.get('riziko');
        if (SORTS.indexOf(p.get('razeni')) >= 0) this.sort = p.get('razeni');

        ['q', 'family', 'risk', 'sort'].forEach(function (k) {
          self.$watch(k, function () { self.limit = STEP; self.syncUrl(); self.updateChart(); });
        });

        V.graph().then(function (g) {
          self.items.forEach(function (t) {
            var n = g.byPath[t.path];
            t.inLinks = n ? g.in[n.id].length : 0;
          });
          self.linksReady = true;
        }).catch(function () {
          self.items.forEach(function (t) { t.inLinks = 0; });
          self.linksReady = true;
        });

        this.drawChart();
      },

      get active() { return !!(this.q.trim() || this.family || this.risk); },

      // Filtr bez rodiny: z něj graf počítá, kolik každé rodiny odpovídá.
      matchesOther: function (t, terms) {
        if (this.risk && t.risk !== this.risk) return false;
        for (var i = 0; i < terms.length; i++) if (t.hay.indexOf(terms[i]) < 0) return false;
        return true;
      },

      terms: function () { return fold(this.q).split(/\s+/).filter(Boolean); },

      get filtered() {
        var self = this;
        var terms = this.terms();
        var rows = this.items.filter(function (t) {
          return (!self.family || t.family === self.family) && self.matchesOther(t, terms);
        });
        var s = this.sort;
        var byCode = function (a, b) { return cmpKey(a.key, b.key) || a.sortTitle.localeCompare(b.sortTitle, 'cs'); };
        var cmp = {
          kod: byCode,
          nazev: function (a, b) { return a.sortTitle.localeCompare(b.sortTitle, 'cs') || byCode(a, b); },
          rozsah: function (a, b) { return b.words - a.words || byCode(a, b); },
          odkazy: function (a, b) { return (b.inLinks || 0) - (a.inLinks || 0) || byCode(a, b); },
        }[s];
        // Odkazy dorazí asynchronně; čtení linksReady zajistí přepočet řazení.
        if (s === 'odkazy' && !this.linksReady) return rows.sort(byCode);
        return rows.sort(cmp);
      },

      get visible() { return this.filtered.slice(0, this.limit); },

      get summary() {
        var n = this.filtered.length;
        var total = this.items.length;
        if (!this.active) return nf.format(total) + ' technik v katalogu';
        return nf.format(n) + ' z ' + nf.format(total) + ' technik odpovídá filtru';
      },

      get chartLabel() {
        return 'Stromová mapa rodin technik podle počtu stránek: ' + this.families.map(function (f) {
          return f.id + ' ' + f.name + ' ' + f.count;
        }).join(', ') + '. Klepnutí na rodinu filtruje tabulku.';
      },

      fmt: function (n) { return nf.format(n || 0); },
      riskLabel: function (r) { return (RISKS[r] && RISKS[r].label) || r || ''; },
      riskClass: function (r) { return (RISKS[r] || RISKS[''] || {}).cls || ''; },

      toggleFamily: function (id) { this.family = this.family === id ? '' : id; },
      more: function () { this.limit += STEP; },
      all: function () { this.limit = this.filtered.length; },
      reset: function () { this.q = ''; this.family = ''; this.risk = ''; },

      syncUrl: function () {
        try {
          var p = params();
          var set = function (k, v) { if (v) p.set(k, v); else p.delete(k); };
          set('q', this.q.trim());
          set('rodina', this.family);
          set('riziko', this.risk);
          set('razeni', this.sort === 'kod' ? '' : this.sort);
          var qs = p.toString();
          window.history.replaceState(null, '', window.location.pathname + (qs ? '?' + qs : '') + window.location.hash);
        } catch (e) { /* bez History API zůstane filtr jen na stránce */ }
      },

      seriesData: function (t) {
        var self = this;
        var terms = this.terms();
        var narrowed = !!(terms.length || this.risk);
        var hits = {};
        if (narrowed) {
          this.items.forEach(function (it) {
            if (self.matchesOther(it, terms)) hits[it.family] = (hits[it.family] || 0) + 1;
          });
        }
        return this.families.map(function (f) {
          var dim = (self.family && self.family !== f.id) || (narrowed && !hits[f.id]);
          return {
            id: f.id, name: f.id, value: f.count, familyName: f.name, hits: narrowed ? (hits[f.id] || 0) : null,
            itemStyle: {
              color: f.color, opacity: dim ? 0.3 : 1,
              borderColor: self.family === f.id ? t.text : t.surface, borderWidth: self.family === f.id ? 3 : 2,
            },
            label: { color: ink(f.color) },
          };
        });
      },

      option: function (t) {
        return {
          tooltip: Object.assign({
            trigger: 'item',
            formatter: function (p) {
              var d = p.data;
              var s = '<b>' + d.id + '</b> · ' + d.familyName + '<br>' + nf.format(d.value) + ' stránek';
              if (d.hits !== null) s += '<br>' + nf.format(d.hits) + ' odpovídá filtru';
              return s;
            },
          }, V.tooltip(t)),
          series: [{
            type: 'treemap', roam: false, nodeClick: false, breadcrumb: { show: false },
            left: 0, right: 0, top: 0, bottom: 0, squareRatio: 1.2,
            label: {
              show: true, fontSize: 12, overflow: 'truncate',
              formatter: function (p) {
                var d = p.data;
                return '{b|' + d.id + '}  ' + (d.hits !== null ? nf.format(d.hits) + ' / ' : '') + nf.format(d.value) + '\n' + d.familyName;
              },
              rich: { b: { fontWeight: 'bold', fontSize: 13 } },
            },
            upperLabel: { show: false },
            // Mezery mezi dlaždicemi mají barvu kořene: v tmavém režimu povrch karty, ne bílou.
            levels: [{ itemStyle: { borderColor: t.surface, borderWidth: 0, gapWidth: 2 } }],
            emphasis: { itemStyle: { opacity: 1 } },
            data: this.seriesData(t),
          }],
        };
      },

      drawChart: function () {
        var self = this;
        var el = this.$refs.chart;
        if (!el || !this.families.length) return;
        V.echarts(el, function (t) { return self.option(t); }).then(function (c) {
          chart = c;
          chart.on('click', function (p) { if (p.data && p.data.id) self.toggleFamily(p.data.id); });
        }).catch(function (e) {
          V.empty(el, 'Graf rodin se nepodařilo načíst', e.message + ' Filtr podle rodiny funguje i tlačítky níže.');
        });
      },

      updateChart: function () {
        if (!chart) return;
        chart.setOption({ series: [{ data: this.seriesData(V.theme()) }] });
      },
    };
  };
})();
