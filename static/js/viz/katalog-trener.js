// Trenér rozpoznávání – jeden pro všechny katalogy knihy (NLP vzorce, argumentační fauly, …):
// dialog nad indexem static/data/katalogy.json a daty trenéru každého katalogu, které odvozuje
// scripts/catalogs.py. Nic se tu nepíše ručně: hesla, příklady, detekční znaky i obranné
// odpovědi jsou data; nový katalog se v trenéru objeví sám. Stav drží Alpine.js
// (x-data="kompendiumTrener(index)").
//
// Kolo: trenér ukáže výrok a kontext; čtenář nejdřív určí, zda jde o manipulativní, nebo
// neškodné užití, potom heslo (nabídka čtyř možností, nebo volný text, ke kterému trenér
// jen navrhne shody – nehodnotí potichu). Zpětná vazba nese detekční znak, obrannou odpověď
// a odkaz na stránku hesla. Opakování podle Leitnerových přihrádek se ukládá do localStorage;
// když úložiště chybí nebo selže, trenér běží v paměti.
(function () {
  'use strict';

  var STORE = 'kompendium-trener-v1';

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  function load() {
    try {
      var raw = window.localStorage.getItem(STORE);
      var data = raw ? JSON.parse(raw) : null;
      return data && data.v === 1 ? data : { v: 1, boxes: {}, right: 0, wrong: 0 };
    } catch (e) {
      return { v: 1, boxes: {}, right: 0, wrong: 0, memory: true };
    }
  }

  function save(state) {
    try {
      window.localStorage.setItem(STORE, JSON.stringify(state));
      return true;
    } catch (e) {
      return false;
    }
  }

  function shuffle(list) {
    var a = list.slice();
    for (var i = a.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1));
      var t = a[i]; a[i] = a[j]; a[j] = t;
    }
    return a;
  }

  function score(query, p) {
    var q = fold(query).trim();
    if (!q) return 0;
    var names = [p.cs, p.en].concat(p.aliases || []).map(fold);
    var best = 0;
    names.forEach(function (n) {
      if (n === q) best = Math.max(best, 100);
      else if (n.indexOf(q) === 0) best = Math.max(best, 80);
      else if (n.indexOf(q) !== -1) best = Math.max(best, 60);
      else {
        var words = q.split(/\s+/).filter(function (w) { return w.length > 2; });
        var hit = words.filter(function (w) { return n.indexOf(w) !== -1; }).length;
        if (words.length && hit) best = Math.max(best, Math.round(40 * hit / words.length));
      }
    });
    return best;
  }

  window.kompendiumTrener = function (indexPath) {
    var base = (document.body.getAttribute('data-base-url') || '').replace(/\/$/, '');
    var D = { patterns: [], items: [], families: [], byId: {}, catalogs: [] };

    return {
      ready: false,
      failed: false,
      memoryOnly: false,
      family: '',
      catalog: '',
      catalogs: [],
      families: [],
      messages: [],
      item: null,
      pattern: null,
      stage: 'idle',      // idle | benign | pattern | done
      choices: [],
      query: '',
      suggestions: [],
      state: load(),
      session: { right: 0, wrong: 0 },
      nextId: 1,

      init: function () {
        var self = this;
        self.memoryOnly = !!self.state.memory;
        function get(path) {
          return fetch(base + '/' + path).then(function (r) {
            if (!r.ok) throw new Error(r.status);
            return r.json();
          });
        }
        get(indexPath)
          .then(function (index) {
            D.catalogs = index.catalogs || [];
            return Promise.all(D.catalogs.map(function (c) { return get(c.trainer_data); }));
          })
          .then(function (all) {
            all.forEach(function (data, i) {
              var cat = D.catalogs[i];
              (data.patterns || []).forEach(function (p) { p.catalog = cat.slug; D.patterns.push(p); });
              (data.items || []).forEach(function (it) { D.items.push(it); });
              (data.families || []).forEach(function (f) {
                D.families.push({ slug: f.slug, code: f.code, title: f.title, catalog: cat.slug,
                  label: cat.id_prefix + '-' + f.code + ' ' + f.title });
              });
            });
            D.patterns.forEach(function (p) { D.byId[p.id] = p; });
            self.catalogs = D.catalogs;
            self.families = D.families;
            var params = new URLSearchParams(window.location.search);
            if (params.get('katalog')) self.catalog = params.get('katalog');
            if (params.get('rodina')) self.family = params.get('rodina');
            self.ready = true;
            self.say('bot', 'Ukážu vám výrok a situaci, ve které zazněl. Nejdřív posuďte, zda jde '
              + 'o manipulativní, nebo neškodné užití, potom určete heslo katalogu. Po každé odpovědi '
              + 'uvidíte detekční znak a obrannou odpověď.');
            self.next();
          })
          .catch(function () { self.failed = true; self.ready = true; });
      },

      get stats() {
        var boxes = this.state.boxes;
        var learned = Object.keys(boxes).filter(function (k) { return boxes[k] >= 3; }).length;
        return { learned: learned, total: this.pool().length };
      },

      get familyOptions() {
        var cat = this.catalog;
        return this.families.filter(function (f) { return !cat || f.catalog === cat; });
      },

      pool: function () {
        var fam = this.family;
        var cat = this.catalog;
        return D.items.filter(function (it) {
          var p = D.byId[it.pattern];
          return p && (!fam || p.family === fam) && (!cat || p.catalog === cat);
        });
      },

      say: function (role, text, extra) {
        this.messages.push(Object.assign({ id: this.nextId++, role: role, text: text }, extra || {}));
        var self = this;
        window.requestAnimationFrame(function () {
          var log = self.$refs && self.$refs.log;
          if (log) log.scrollTop = log.scrollHeight;
        });
      },

      next: function () {
        var pool = this.pool();
        if (!pool.length) {
          this.say('bot', 'Pro tento výběr nejsou žádné příklady. Zvolte jinou rodinu nebo druh.');
          this.stage = 'idle';
          return;
        }
        var boxes = this.state.boxes;
        var weighted = [];
        pool.forEach(function (it) {
          var box = boxes[it.id] || 0;
          var w = Math.max(1, 5 - box);
          for (var i = 0; i < w; i++) weighted.push(it);
        });
        var it = weighted[Math.floor(Math.random() * weighted.length)];
        if (this.item && pool.length > 1 && it.id === this.item.id) {
          it = pool[(pool.indexOf(it) + 1) % pool.length];
        }
        this.item = it;
        this.pattern = D.byId[it.pattern];
        this.stage = 'benign';
        this.query = '';
        this.suggestions = [];
        this.say('bot', it.utterance, { quote: true, context: it.context });
        this.say('bot', 'Je toto užití manipulativní, nebo neškodné?');
      },

      answerBenign: function (benign) {
        if (this.stage !== 'benign') return;
        var right = benign === this.item.benign;
        this.say('user', benign ? 'Neškodné užití.' : 'Manipulativní užití.');
        this.say('bot', (right ? 'Ano. ' : 'Ne tak docela. ') + (this.item.benign
          ? 'Tady jde o neškodné užití.' : 'Tady jde o manipulativní nebo nátlakové užití.'),
          { verdict: right ? 'ok' : 'miss' });
        this.firstRight = right;
        this.stage = 'pattern';
        this.choices = this.makeChoices();
        this.say('bot', 'Které heslo katalogu ve výroku poznáváte?');
      },

      makeChoices: function () {
        var p = this.pattern;
        var same = D.patterns.filter(function (x) { return x.family === p.family && x.id !== p.id; });
        var other = D.patterns.filter(function (x) { return x.family !== p.family && x.catalog === p.catalog; });
        var pick = shuffle(same).slice(0, 2);
        pick = pick.concat(shuffle(other).slice(0, 3 - pick.length));
        return shuffle([p].concat(pick));
      },

      suggest: function () {
        var q = this.query;
        this.suggestions = D.patterns
          .map(function (p) { return { p: p, s: score(q, p) }; })
          .filter(function (x) { return x.s >= 40; })
          .sort(function (a, b) { return b.s - a.s; })
          .slice(0, 4)
          .map(function (x) { return x.p; });
      },

      answerPattern: function (p) {
        if (this.stage !== 'pattern') return;
        var right = p.id === this.pattern.id;
        this.say('user', p.cs);
        var both = right && this.firstRight;
        var box = this.state.boxes[this.item.id] || 0;
        this.state.boxes[this.item.id] = both ? Math.min(box + 1, 5) : 0;
        if (both) { this.state.right++; this.session.right++; } else { this.state.wrong++; this.session.wrong++; }
        if (!save(this.state)) this.memoryOnly = true;
        this.say('bot', (right ? 'Správně: ' : 'Tady jde o heslo ') + this.pattern.cs + ' ('
          + this.pattern.en + ').',
          { verdict: right ? 'ok' : 'miss', link: base + '/' + this.pattern.url,
            linkText: 'Otevřít stránku: ' + this.pattern.cs });
        this.say('bot', 'Detekční znak: ' + this.item.marker, { marker: true });
        this.say('bot', (this.item.benign ? 'Proč je to neškodné: ' : 'Obranná odpověď: ')
          + this.item.response, { defence: true });
        this.stage = 'done';
      },

      setCatalog: function () {
        this.family = '';
        this.setFilter();
      },

      setFilter: function () {
        this.messages = [];
        this.say('bot', 'Výběr změněn. Pokračujeme příklady z nového výběru.');
        this.next();
      },

      reset: function () {
        this.state = { v: 1, boxes: {}, right: 0, wrong: 0 };
        this.session = { right: 0, wrong: 0 };
        if (!save(this.state)) this.memoryOnly = true;
        this.messages = [];
        this.say('bot', 'Pokrok smazán. Začínáme znovu.');
        this.next();
      }
    };
  };
})();
