// Sdílená data knihy pro vizualizace ze static/js/kompendium/*.js. Nic se tu nepíše ručně:
// stránky, kódy, rodiny, počty, URL a skupiny se odvozují z grafu odkazů
// (static/data/graph.json přes KompendiumViz.graph()), z katalogu technik (JSON vložený při
// sestavení do stránky /kompendium/techniques/) a z osnovy rejstříkových stránek knihy
// (nadpisy a odkazy pod nimi). Skripty si modul načtou samy (window.__kniha), stránka ho
// nemusí vkládat.
(function () {
  'use strict';
  if (window.KompendiumKniha) return;

  var self = document.currentScript && document.currentScript.src;
  var root = self ? new URL(self).pathname.replace(/\/js\/kompendium\/[^/]*$/, '') : '';
  var cache = {};

  function loadViz() {
    if (window.KompendiumViz) return Promise.resolve(window.KompendiumViz);
    return new Promise(function (ok, fail) {
      var s = document.createElement('script');
      s.src = root + '/js/viz/kompendium-viz.js';
      s.onload = function () { ok(window.KompendiumViz); };
      s.onerror = function () { fail(new Error('kompendium-viz.js se nenačetl')); };
      document.head.appendChild(s);
    });
  }

  // --- kódy technik z cesty: ea-1-2-2-….md → EA-1.2.2, ea-4-1-….md → EA-4.1 -----------------
  var CODE = /(?:^|\/)ea-(\d+)-(\d+)(?:-(\d+))?(?=[-.])/i;

  function codeOfPath(path) {
    var m = CODE.exec(path || '');
    return m ? 'EA-' + (+m[1]) + '.' + (+m[2]) + (m[3] ? '.' + (+m[3]) : '') : '';
  }

  function codeKey(code) {
    var m = /^EA-(\d+)(?:\.(\d+))?(?:\.(\d+))?/i.exec(code || '');
    return m ? [+m[1], +(m[2] || 0), +(m[3] || 0)] : [999, 0, 0];
  }

  function cmpCode(a, b) {
    var x = codeKey(a);
    var y = codeKey(b);
    for (var i = 0; i < 3; i++) if (x[i] !== y[i]) return x[i] - y[i];
    return 0;
  }

  // Název bez úvodního kódu („EA-1.1.1 Selektivní expozice“ → „Selektivní expozice“). Stránka,
  // jejímž názvem je jen slug („EA-1-3-1-immunization-…“), dostane slova slugu, holý kód nic.
  function techniqueLabel(title) {
    var t = String(title || '').replace(/^\s*EA[-\s]?\d+(?:[.-]\d+)*\s*[:—–-]?\s*/i, '').trim();
    if (t && !/\s/.test(t)) t = t.replace(/-/g, ' ');
    return t;
  }

  // „7.18 Arendt: Banalita zla“ → {num: '7.18', head: 'Arendt', rest: 'Banalita zla'}
  function parseTitle(title) {
    var t = String(title || '').trim();
    var num = '';
    var m = /^(\d+(?:\.\d+)*(?:\.[A-Z])?)\.?\s+/.exec(t);
    if (m) { num = m[1]; t = t.slice(m[0].length); }
    var cut = t.search(/\s[—–]\s|:\s/);
    var head = cut > 0 ? t.slice(0, cut).trim() : t;
    var rest = cut > 0 ? t.slice(cut).replace(/^\s*[—–:]\s*/, '').trim() : '';
    return { num: num, head: head, rest: rest, full: t };
  }

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  }

  // Cesta tak, jak ji Zola zapíše na web (slugify: malá písmena, bez diakritiky, ostatní znaky
  // na pomlčku). Pole url v grafu nese tvar podle názvu souboru (např. „…-EA/“, „myslení/“),
  // který na webu neexistuje; odkazy i párování odkazů proto jdou přes tento tvar.
  function sitePath(url) {
    return String(url || '').split('/').map(function (seg) {
      return fold(seg).replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
    }).join('/');
  }

  // Blok, ve kterém prvek v textu stránky stojí: Markdown balí samotné <canvas> do <p>.
  function anchor(el) {
    var p = el && el.parentElement;
    return p && p.tagName === 'P' && p.children.length === 1 && !(p.textContent || '').trim() ? p : el;
  }

  function build(V, g) {
    var basePath = V.basePath;
    var byUrl = {};
    g.nodes.forEach(function (n) { byUrl[sitePath(n.url)] = n; });
    function urlOf(n) { return basePath + sitePath(n.url); }

    function nodeOfHref(href) {
      if (!href) return null;
      var u;
      try { u = new URL(href, window.location.href); } catch (e) { return null; }
      if (u.origin !== window.location.origin) return null;
      var p = decodeURI(u.pathname);
      if (basePath && p.indexOf(basePath) === 0) p = p.slice(basePath.length);
      if (!/\/$/.test(p)) p += '/';
      return byUrl[sitePath(p)] || null;
    }

    var techniques = [];
    var byNode = {};
    g.nodes.forEach(function (n) {
      var code = /(?:^|\/)ea-\d+-\d+/i.test(n.path) && !/_index\.md$/.test(n.path) ? codeOfPath(n.path) : '';
      if (!code) return;
      var key = codeKey(code);
      var t = {
        node: n, id: n.id, code: code, key: key,
        family: 'EA-' + key[0], sub: 'EA-' + key[0] + '.' + key[1],
        label: techniqueLabel(n.title) || code,
      };
      techniques.push(t);
      byNode[n.id] = t;
    });
    techniques.sort(function (a, b) { return cmpCode(a.code, b.code) || a.label.localeCompare(b.label, 'cs'); });

    var familyIds = [];
    techniques.forEach(function (t) { if (familyIds.indexOf(t.family) < 0) familyIds.push(t.family); });
    familyIds.sort(cmpCode);

    function familyName(fid) { return g.families[fid] || ''; }
    function familyColor(fid) { return V.PALETTE[(codeKey(fid)[0] - 1 + V.PALETTE.length) % V.PALETTE.length]; }

    var current = nodeOfHref(window.location.href);

    function dir(n) { return n.path.replace(/[^/]*$/, ''); }
    function isIndex(n) { return /(^|\/)_index\.md$/.test(n.path); }

    // Stránky oddílu (bez rejstříkových _index.md).
    function pagesOf(section) {
      return g.nodes.filter(function (n) { return n.section === section && !isIndex(n); });
    }

    // Rejstřík oddílu (_index.md v kořeni oddílu).
    function indexOf(section) { return g.byPath[section + '/_index.md'] || null; }

    // Hrany grafu mezi uzly množiny (neorientované, bez duplicit; mutual = odkaz oběma směry).
    function edgesAmong(ids) {
      var inSet = {};
      ids.forEach(function (id) { inSet[id] = true; });
      var seen = {};
      var out = [];
      ids.forEach(function (a) {
        g.out[a].forEach(function (b) {
          if (!inSet[b] || a === b) return;
          var k = a < b ? a + '-' + b : b + '-' + a;
          if (seen[k]) { seen[k].mutual = true; return; }
          seen[k] = { a: a, b: b, mutual: false };
          out.push(seen[k]);
        });
      });
      return out;
    }

    // Počet odkazů v knize ze stránek A na stránky B.
    function linksFrom(aIds, bIds) {
      var inB = {};
      bIds.forEach(function (id) { inB[id] = true; });
      var n = 0;
      aIds.forEach(function (a) { g.out[a].forEach(function (b) { if (inB[b]) n++; }); });
      return n;
    }

    function fetchDoc(n) {
      var key = 'doc:' + n.path;
      if (!cache[key]) {
        cache[key] = fetch(urlOf(n)).then(function (r) {
          if (!r.ok) throw new Error(n.url + ': HTTP ' + r.status);
          return r.text();
        }).then(function (html) { return new DOMParser().parseFromString(html, 'text/html'); });
      }
      return cache[key];
    }

    function headingText(h) {
      return (h.textContent || '').replace(/[#¶🔗]+\s*$/u, '').replace(/\s+/g, ' ').trim();
    }

    // Osnova stránky: nadpisy h2/h3 v pořadí, u každého odkazy (uzly grafu) pod ním až po další
    // nadpis a první odstavec textu.
    function outline(n) {
      return fetchDoc(n).then(function (doc) {
        var art = doc.querySelector('main article') || doc.querySelector('main') || doc.body;
        var heads = [];
        var cur = null;
        var walker = doc.createTreeWalker(art, NodeFilter.SHOW_ELEMENT);
        for (var el = walker.currentNode; el; el = walker.nextNode()) {
          var tag = el.tagName;
          if (tag === 'H2' || tag === 'H3') {
            cur = { level: tag === 'H2' ? 2 : 3, title: headingText(el), id: el.id || '', nodes: [], text: '', parent: null };
            if (cur.level === 3) {
              for (var i = heads.length - 1; i >= 0; i--) if (heads[i].level === 2) { cur.parent = heads[i]; break; }
            }
            heads.push(cur);
          }
          if (!cur) continue;
          if (tag === 'A') {
            var m = nodeOfHref(el.getAttribute('href'));
            if (m && cur.nodes.indexOf(m) < 0) cur.nodes.push(m);
          } else if (tag === 'P' && !cur.text) {
            cur.text = (el.textContent || '').replace(/\s+/g, ' ').trim();
          }
        }
        return heads;
      });
    }

    // Skupiny stránek tak, jak je řadí rejstříková stránka: každá členská stránka patří pod ten
    // nadpis, který ji odkazuje spolu s nejvíce dalšími členy. Pořadí skupin = pořadí nadpisů.
    function groups(indexNode, members) {
      var memberIds = {};
      (members || pagesOf(indexNode.section)).forEach(function (m) {
        if (m.id !== indexNode.id) memberIds[m.id] = true;
      });
      return outline(indexNode).then(function (heads) {
        heads.forEach(function (h) {
          h.members = h.nodes.filter(function (m) { return memberIds[m.id]; });
        });
        var owner = {};
        heads.forEach(function (h) {
          h.members.forEach(function (m) {
            if (!owner[m.id] || owner[m.id].members.length < h.members.length) owner[m.id] = h;
          });
        });
        return heads.map(function (h) {
          return {
            title: h.title, text: h.text, level: h.level,
            nodes: h.members.filter(function (m) { return owner[m.id] === h; }),
          };
        }).filter(function (gr) { return gr.nodes.length; });
      });
    }

    // Katalog technik vložený do stránky /kompendium/techniques/ při sestavení (riziko,
    // kategorie, subkategorie, popis), klíčovaný cestou stránky.
    function catalogue() {
      if (cache.catalogue) return cache.catalogue;
      var idx = techniques.length ? indexOf(techniques[0].node.section) : null;
      if (!idx) return Promise.reject(new Error('katalog technik nemá stránku'));
      cache.catalogue = fetchDoc(idx).then(function (doc) {
        function read(id) {
          var el = doc.getElementById(id);
          if (!el) return null;
          try { return JSON.parse(el.textContent); } catch (e) { return null; }
        }
        var items = read('techniky-data');
        if (!items) throw new Error('katalog technik chybí');
        var byPath = {};
        items.forEach(function (it) { byPath[it.path] = it; });
        return { byPath: byPath, risks: read('techniky-rizika') || {} };
      });
      return cache.catalogue;
    }

    // Úroveň rizika položky katalogu: id z legendy katalogu, jinak hodnota tak, jak je zapsaná.
    function riskOf(cat, t) {
      var it = cat.byPath[t.node.path];
      var raw = it ? String(it.risk || '').trim() : '';
      var meta = cat.risks[raw];
      if (meta) return { id: raw, label: meta.label || raw, order: meta.order || 50 };
      if (!raw) {
        var none = cat.risks[''] || {};
        return { id: '', label: none.label || 'neuvedeno', order: none.order || 99 };
      }
      return { id: raw, label: raw, order: 98 };
    }

    // Uzly, na které odkazuje text stránky od posledního nadpisu h2 až po prvek el: odkazy a
    // kódy technik zapsané v textu („EA-5.1.13“).
    function contextNodes(el) {
      var found = [];
      function add(n) { if (n && found.indexOf(n) < 0) found.push(n); }
      var prev = anchor(el).previousElementSibling;
      var chunk = [];
      while (prev && prev.tagName !== 'H2') { chunk.unshift(prev); prev = prev.previousElementSibling; }
      if (prev) chunk.unshift(prev);
      chunk.forEach(function (c) {
        c.querySelectorAll('a[href]').forEach(function (a) { add(nodeOfHref(a.getAttribute('href'))); });
        if (c.tagName === 'A') add(nodeOfHref(c.getAttribute('href')));
        var re = /EA-\d+\.\d+(?:\.\d+)?/g;
        var m;
        var text = c.textContent || '';
        while ((m = re.exec(text))) {
          var code = m[0];
          if (found.some(function (n) { return byNode[n.id] && byNode[n.id].code === code; })) continue;
          var all = techniques.filter(function (t) { return t.code === code; });
          var named = all.filter(function (t) { return /\s/.test(t.node.title); });
          (named.length ? named : all).forEach(function (t) { add(t.node); });
        }
      });
      return found;
    }

    // Rodina EA-N zmíněná v textu nad prvkem (po nejbližší nadpis h1/h2 včetně), jinak první.
    function familyNear(el) {
      var text = '';
      for (var p = anchor(el).previousElementSibling; p; p = p.previousElementSibling) {
        text = (p.textContent || '') + ' ' + text;
        if (p.tagName === 'H1' || p.tagName === 'H2') break;
      }
      var m = /EA-(\d+)/.exec(text);
      var fid = m ? 'EA-' + (+m[1]) : '';
      return familyIds.indexOf(fid) >= 0 ? fid : familyIds[0];
    }

    // Názvy podrodin (EA-1.1 → „Narušení procesů akvizice poznání“): nejčastější
    // ea_subcategory stránek podrodiny v katalogu, bez úvodního čísla.
    function subNames(cat) {
      var votes = {};
      techniques.forEach(function (t) {
        var it = cat && cat.byPath[t.node.path];
        if (!it || !it.subcategory) return;
        var v = String(it.subcategory).replace(/^\s*\d+(\.\d+)*\s*/, '');
        var b = votes[t.sub] = votes[t.sub] || {};
        b[v] = (b[v] || 0) + 1;
      });
      var out = {};
      Object.keys(votes).forEach(function (s) {
        out[s] = Object.keys(votes[s]).sort(function (a, b) { return votes[s][b] - votes[s][a]; })[0];
      });
      return out;
    }

    // --- DOM ------------------------------------------------------------------------------
    function h(tag, cls, text) {
      var e = document.createElement(tag);
      if (cls) e.className = cls;
      if (text != null) e.textContent = text;
      return e;
    }

    function clear(el) { while (el && el.firstChild) el.removeChild(el.firstChild); }

    // Odkaz na stránku knihy jen přes její URL v grafu; uzel bez stránky odkaz nedostane.
    function link(n, text, cls) {
      if (n && n.url) {
        var a = h('a', cls || 'text-primary-700 dark:text-primary-400 underline', text || n.title);
        a.href = urlOf(n);
        return a;
      }
      return h('span', 'text-gray-500 dark:text-gray-400', (text || '') + ' (bez stránky)');
    }

    // Seznam odkazů na uzly (s volitelným popiskem uzlu).
    function list(nodes, labelOf) {
      var ul = h('ul', 'mt-2 space-y-1 text-sm text-gray-700 dark:text-gray-300 list-disc list-inside');
      nodes.forEach(function (n) {
        var li = h('li');
        li.appendChild(link(n, labelOf ? labelOf(n) : n.title));
        ul.appendChild(li);
      });
      return ul;
    }

    function techniqueText(t) { return t.code + ' ' + t.label; }

    // Barvy Chart.js podle tématu stránky; graf se při přepnutí tématu postaví znovu.
    function chartColors() {
      var t = V.theme();
      return { text: t.text, muted: t.muted, grid: t.grid, surface: t.surface, dark: t.dark, edge: t.edge };
    }

    function chart(canvas, makeConfig) {
      var c = new window.Chart(canvas, makeConfig(chartColors()));
      var api = { chart: c };
      document.addEventListener('dark-mode', function () {
        api.chart.destroy();
        api.chart = new window.Chart(canvas, makeConfig(chartColors()));
      });
      return api;
    }

    // Celočíselné značky osy 0..n-1 (kategorie na lineární ose).
    function intTicks(n) {
      return function (axis) {
        var t = [];
        for (var i = 0; i < n; i++) t.push({ value: i });
        axis.ticks = t;
      };
    }

    function fail(el, text) {
      if (!el) return;
      clear(el);
      el.appendChild(h('p', 'text-gray-700 dark:text-gray-300 text-sm', text));
    }

    return {
      V: V, g: g, basePath: basePath, current: current, url: urlOf,
      techniques: techniques, technique: function (n) { return n ? byNode[n.id] || null : null; },
      familyIds: familyIds, familyName: familyName, familyColor: familyColor,
      codeOfPath: codeOfPath, codeKey: codeKey, cmpCode: cmpCode, parseTitle: parseTitle, fold: fold,
      nodeOfHref: nodeOfHref, pagesOf: pagesOf, indexOf: indexOf, isIndex: isIndex, dir: dir,
      edgesAmong: edgesAmong, linksFrom: linksFrom,
      outline: outline, groups: groups, catalogue: catalogue, riskOf: riskOf, doc: fetchDoc,
      contextNodes: contextNodes, familyNear: familyNear, anchor: anchor, subNames: subNames,
      h: h, clear: clear, link: link, list: list, techniqueText: techniqueText,
      chartColors: chartColors, chart: chart, intTicks: intTicks, fail: fail,
    };
  }

  var ready = null;
  window.KompendiumKniha = {
    ready: function () {
      if (!ready) {
        ready = loadViz().then(function (V) {
          return V.graph().then(function (g) { return build(V, g); });
        });
      }
      return ready;
    },
  };
})();
