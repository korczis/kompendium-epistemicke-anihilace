// Jádro knihy: implementace kontraktu kompendium-engine/v1 v JavaScriptu (prohlížeč i Node).
//
// Kontrakt je docs/engine/kompendium-engine-v1.md, schéma odpovědí
// data/schemas/kompendium-engine.v1.schema.json, referenční implementace scripts/engine.py.
// Tento soubor dává pro každý přípravek v test/cases/engine/ tutéž odpověď jako reference
// (ověřuje test/cases/05_engine_js.sh, který porovná i obě implementace mezi sebou). Řazení,
// normalizace a úrovně shody jsou jen tady: hledání v záhlaví (site.js), paleta příkazů
// (viz/paleta.js) i okolí stránky (viz/okoli.js) se ptají jádra a samy už neřadí.
//
//   var jadro = KompendiumJadro.create(searchDoc, graphDoc);
//   jadro.run({ op: 'search', query: 'EA-1.1.1' });
//   jadro.run({ op: 'neighbourhood', path: 'glossary/gaslighting.md', depth: 2 });
//
// Čisté: žádné I/O, žádná výjimka; chybný požadavek i chybná data vrátí objekt chyby.
//
// The same engine in WebAssembly (crates/kompendium-engine, loader viz/jadro-wasm.js): create
// uses it once the module is loaded and passed the loader's contract check (in a browser the
// global KompendiumJadroWasm, in Node useWasm(require('./jadro-wasm.js'))). Otherwise, and for
// a request the module cannot take, this JS engine answers. <html data-engine="wasm|js">
// names the one that does.
(function (root, factory) {
  'use strict';
  if (typeof module === 'object' && module.exports) module.exports = factory({});
  else root.KompendiumJadro = factory(root);
})(typeof self !== 'undefined' ? self : this, function (root) {
  'use strict';

  var SCHEMA = 'kompendium-engine/v1';
  var SEARCH_SCHEMAS = ['kompendium-search/v1'];
  var GRAPH_SCHEMAS = ['kompendium-graph/v2'];
  var SEARCH_FIELDS = ['title', 'description', 'url', 'code', 'kind', 'aliases', 'in'];
  var QUERY_MAX = 200;
  var PATH_MAX = 512;
  var SEARCH_LIMIT = [12, 50];
  var NEIGHBOURHOOD_LIMIT = [28, 200];
  var TIERS = ['exact_code', 'exact_title', 'exact_alias', 'title_prefix', 'title_word',
    'description'];
  var OPS = { search: ['op', 'query', 'limit'], neighbourhood: ['op', 'path', 'depth', 'limit'] };

  // Bílé znaky přesně podle kontraktu: \s JavaScriptu a U+0085.
  var WHITESPACE = new RegExp('[\\t\\n\\u000b\\f\\r \\u0085\\u00a0\\u1680\\u2000-\\u200a' +
    '\\u2028\\u2029\\u202f\\u205f\\u3000\\ufeff]+', 'g');
  var MARKS = /\p{M}/gu;
  var WORDCHAR = /[\p{L}\p{N}]/u;
  var CODE = /^ea[ -]?([0-9]+)(?:[.-]([0-9]+|[a-z]))?(?:[.-]([0-9]+|[a-z]))?$/;

  function trimSpaces(s) {
    var a = 0;
    var b = s.length;
    while (a < b && s.charCodeAt(a) === 32) a++;
    while (b > a && s.charCodeAt(b - 1) === 32) b--;
    return s.slice(a, b);
  }

  // NFKD, bez kombinujících značek (kategorie M*), malá písmena, sloučené bílé znaky.
  function normalise(text) {
    var bare = text.normalize('NFKD').replace(MARKS, '');
    return trimSpaces(bare.toLowerCase().replace(WHITESPACE, ' '));
  }

  // Nejdelší úseky písmen a číslic (kategorie L*, N*) normalizovaného řetězce.
  function tokens(norm) {
    var out = [];
    var word = '';
    for (var ch of norm) {
      if (WORDCHAR.test(ch)) word += ch;
      else if (word) { out.push(word); word = ''; }
    }
    if (word) out.push(word);
    return out;
  }

  function eaCode(norm) {
    var m = CODE.exec(norm);
    if (!m) return null;
    var parts = [m[1], m[2], m[3]].filter(function (g) { return g !== undefined; });
    return 'EA-' + parts.map(function (p) {
      return /^[0-9]+$/.test(p) ? String(parseInt(p, 10)) : p.toUpperCase();
    }).join('.');
  }

  function error(op, code, message, field) {
    return { schema: SCHEMA, ok: false, op: op === undefined ? null : op,
      error: { code: code, message: message, field: field === undefined ? null : field } };
  }

  // Celé číslo, které číslo JSON vyjadřuje (1 i 1.0), jinak null; logické hodnoty nejsou čísla.
  function integer(value) {
    return typeof value === 'number' && Number.isInteger(value) ? value : null;
  }

  // Vzestupně podle kódových bodů Unicode (stejné pořadí jako bajty UTF-8), ne podle UTF-16.
  function cmp(a, b) {
    var i = 0;
    var j = 0;
    while (i < a.length && j < b.length) {
      var x = a.codePointAt(i);
      var y = b.codePointAt(j);
      if (x !== y) return x < y ? -1 : 1;
      i += x > 0xffff ? 2 : 1;
      j += y > 0xffff ? 2 : 1;
    }
    if (i < a.length) return 1;
    if (j < b.length) return -1;
    return 0;
  }

  function isObject(v) {
    return typeof v === 'object' && v !== null && !Array.isArray(v);
  }

  function isStr(v) { return typeof v === 'string'; }

  function checkData(search, graph) {
    if (!isObject(search) || SEARCH_SCHEMAS.indexOf(search.schema) < 0) {
      return ['search.schema', 'search.json schema must be one of ' + SEARCH_SCHEMAS.join(', ')];
    }
    if (!isObject(graph) || GRAPH_SCHEMAS.indexOf(graph.schema) < 0) {
      return ['graph.schema', 'graph.json schema must be one of ' + GRAPH_SCHEMAS.join(', ')];
    }
    var fields = search.fields;
    if (!Array.isArray(fields) || SEARCH_FIELDS.some(function (f) { return fields.indexOf(f) < 0; })) {
      return ['search.fields', 'search.json fields must name ' + SEARCH_FIELDS.join(', ')];
    }
    var entries = search.entries;
    if (!Array.isArray(entries)) return ['search.entries', 'search.json entries must be a list'];
    var at = {};
    SEARCH_FIELDS.forEach(function (k) { at[k] = fields.indexOf(k); });
    for (var i = 0; i < entries.length; i++) {
      var e = entries[i];
      if (!Array.isArray(e) || e.length < fields.length ||
          ['title', 'description', 'url', 'code', 'kind'].some(function (k) { return !isStr(e[at[k]]); }) ||
          !Array.isArray(e[at.aliases]) || e[at.aliases].some(function (a) { return !isStr(a); })) {
        return ['search.entries', 'search.json entry ' + i + ' does not match its fields'];
      }
    }
    var nodes = graph.nodes;
    var edges = graph.edges;
    if (!Array.isArray(nodes) || !Array.isArray(edges)) {
      return ['graph.nodes', 'graph.json must carry nodes and edges lists'];
    }
    for (var n = 0; n < nodes.length; n++) {
      var node = nodes[n];
      if (!isObject(node) || integer(node.id) !== n ||
          ['path', 'url', 'title', 'section'].some(function (k) { return !isStr(node[k]); }) ||
          integer(node.in) === null) {
        return ['graph.nodes', 'graph.json node ' + n + ' lacks id, path, url, title, section or in'];
      }
    }
    for (var k = 0; k < edges.length; k++) {
      var ed = edges[k];
      if (!Array.isArray(ed) || ed.length !== 2 || ed.some(function (x) {
        return integer(x) === null || x < 0 || x >= nodes.length;
      })) {
        return ['graph.edges', 'graph.json edges must be [from, to] pairs of node ids'];
      }
    }
    return null;
  }

  var wasmApi = null;

  function wasm() {
    return wasmApi || root.KompendiumJadroWasm || null;
  }

  function mark(kind) {
    if (typeof document !== 'undefined' && document.documentElement) {
      document.documentElement.dataset.engine = kind;
    }
  }

  // The wasm engine when it is ready, else the JS engine (createJs).
  function create(search, graph) {
    var W = wasm();
    var fast = null;
    try {
      fast = W && W.ready() ? W.create(search, graph) : null;
    } catch (e) {
      fast = null;
    }
    if (!fast) {
      mark('js');
      return createJs(search, graph);
    }
    var slow = null;
    mark('wasm');
    return {
      engine: 'wasm', normalise: normalise, tokens: tokens, eaCode: eaCode,
      run: function (request) {
        var out = null;
        try {
          out = fast.run(request);
        } catch (e) {
          out = null;
        }
        if (out) return out;
        if (!slow) slow = createJs(search, graph);
        return slow.run(request);
      },
    };
  }

  function createJs(search, graph) {
    var problem = checkData(search, graph);
    var nodes;
    var byPath;
    var adjacent;
    var edges;
    var entries;

    if (!problem) {
      nodes = graph.nodes;
      byPath = new Map();
      var byUrl = new Map();
      nodes.forEach(function (n) { byPath.set(n.path, n); byUrl.set(n.url, n); });
      adjacent = nodes.map(function () { return new Set(); });
      var seen = new Set();
      edges = [];
      graph.edges.forEach(function (e) {
        var a = e[0];
        var b = e[1];
        if (a === b || seen.has(a + ',' + b)) return;
        seen.add(a + ',' + b);
        edges.push([a, b]);
        adjacent[a].add(b);
        adjacent[b].add(a);
      });
      var f = {};
      search.fields.forEach(function (name, i) { f[name] = i; });
      entries = [];
      for (var i = 0; i < search.entries.length; i++) {
        var e = search.entries[i];
        var node = byUrl.get(e[f.url]);
        if (!node) {
          problem = ['search.entries', 'a search.json entry has no graph.json node with its url; ' +
            'the two files are not from the same build'];
          break;
        }
        var normTitle = normalise(e[f.title]);
        var normAliases = e[f.aliases].map(normalise);
        var words = tokens(normTitle);
        normAliases.forEach(function (a) { words = words.concat(tokens(a)); });
        var code = e[f.code] || null;
        entries.push({
          path: node.path, url: node.url, title: e[f.title], code: code, kind: e[f.kind],
          in: node.in, ea: code ? eaCode(normalise(code)) : null,
          t: normTitle, aliases: normAliases, words: words,
          all: words.concat(tokens(normalise(e[f.description]))),
        });
      }
    }

    function limitOf(op, request, bounds) {
      if (!Object.prototype.hasOwnProperty.call(request, 'limit')) return { limit: bounds[0] };
      var limit = integer(request.limit);
      if (limit === null || limit < 1 || limit > bounds[1]) {
        return { err: error(op, 'bad_input', 'limit must be an integer from 1 to ' + bounds[1], 'limit') };
      }
      return { limit: limit };
    }

    function runSearch(request) {
      var query = request.query;
      if (!isStr(query)) return error('search', 'bad_input', 'query must be a string', 'query');
      if (Array.from(query).length > QUERY_MAX) {
        return error('search', 'bad_input', 'query must be at most ' + QUERY_MAX + ' code points', 'query');
      }
      var q = normalise(query);
      if (!q) return error('search', 'bad_input', 'query is empty after normalisation', 'query');
      var lim = limitOf('search', request, SEARCH_LIMIT);
      if (lim.err) return lim.err;
      var code = eaCode(q);
      if (code) q = normalise(code);
      var words = code ? [] : tokens(q);

      function every(pool) {
        return words.length > 0 && words.every(function (x) {
          return pool.some(function (w) { return w.startsWith(x); });
        });
      }

      var hits = [];
      entries.forEach(function (e) {
        var checks = [code !== null && e.ea === code, e.t === q, e.aliases.indexOf(q) >= 0,
          e.t.startsWith(q), every(e.words), every(e.all)];
        var tier = checks.indexOf(true);
        if (tier >= 0) hits.push([tier, e]);
      });
      hits.sort(function (a, b) {
        return a[0] - b[0] || b[1].in - a[1].in || cmp(a[1].path, b[1].path);
      });
      return {
        schema: SCHEMA, ok: true, op: 'search', query: query, normalised: q, code: code,
        limit: lim.limit, total: hits.length,
        hits: hits.slice(0, lim.limit).map(function (h) {
          var e = h[1];
          return { path: e.path, url: e.url, title: e.title, code: e.code, kind: e.kind,
            in: e.in, tier: h[0] + 1, why: TIERS[h[0]] };
        }),
      };
    }

    function runNeighbourhood(request) {
      var op = 'neighbourhood';
      var path = request.path;
      if (!isStr(path) || Array.from(path).length < 1 || Array.from(path).length > PATH_MAX) {
        return error(op, 'bad_input', 'path must be a string of 1 to ' + PATH_MAX + ' code points', 'path');
      }
      var depth = Object.prototype.hasOwnProperty.call(request, 'depth') ? integer(request.depth) : 1;
      if (depth !== 1 && depth !== 2) return error(op, 'bad_input', 'depth must be 1 or 2', 'depth');
      var lim = limitOf(op, request, NEIGHBOURHOOD_LIMIT);
      if (lim.err) return lim.err;
      var centre = byPath.get(path);
      if (!centre) return error(op, 'unknown_path', 'no page has this path in graph.json', 'path');
      var distance = new Map([[centre.id, 0]]);
      var frontier = [centre.id];
      for (var d = 1; d <= depth; d++) {
        var next = [];
        frontier.forEach(function (i) {
          adjacent[i].forEach(function (j) {
            if (!distance.has(j)) { distance.set(j, d); next.push(j); }
          });
        });
        frontier = next;
      }
      var around = Array.from(distance.keys()).filter(function (i) { return i !== centre.id; });
      around.sort(function (a, b) {
        return distance.get(a) - distance.get(b) || nodes[b].in - nodes[a].in ||
          cmp(nodes[a].path, nodes[b].path);
      });
      var chosen = [centre.id].concat(around.slice(0, lim.limit));
      var keep = new Set(chosen);
      var kept = edges.filter(function (e) { return keep.has(e[0]) && keep.has(e[1]); });
      kept.sort(function (x, y) {
        return cmp(nodes[x[0]].path, nodes[y[0]].path) || cmp(nodes[x[1]].path, nodes[y[1]].path);
      });
      return {
        schema: SCHEMA, ok: true, op: op, path: path, depth: depth, limit: lim.limit,
        total: around.length, truncated: around.length > lim.limit,
        nodes: chosen.map(function (i) {
          return { path: nodes[i].path, title: nodes[i].title, class: nodes[i].section,
            distance: distance.get(i), in: nodes[i].in };
        }),
        edges: kept.map(function (e) {
          return { from: nodes[e[0]].path, to: nodes[e[1]].path, kind: 'link' };
        }),
      };
    }

    function run(request) {
      var op = isObject(request) && isStr(request.op) && Object.prototype.hasOwnProperty.call(OPS, request.op)
        ? request.op : null;
      if (problem) return error(op, 'schema_mismatch', problem[1], problem[0]);
      if (!isObject(request)) return error(null, 'bad_input', 'the request must be a JSON object');
      if (!Object.prototype.hasOwnProperty.call(request, 'op') || !isStr(request.op)) {
        return error(null, 'bad_input', 'op must be a string', 'op');
      }
      if (op === null) {
        return error(null, 'bad_input', 'op must be one of ' + Object.keys(OPS).join(', '), 'op');
      }
      var unknown = Object.keys(request).filter(function (k) { return OPS[op].indexOf(k) < 0; }).sort(cmp);
      if (unknown.length) {
        return error(op, 'bad_input', unknown[0] + ' is not a field of ' + op, unknown[0]);
      }
      return op === 'search' ? runSearch(request) : runNeighbourhood(request);
    }

    return { engine: 'js', run: run, normalise: normalise, tokens: tokens, eaCode: eaCode };
  }

  return { SCHEMA: SCHEMA, create: create, createJs: createJs, normalise: normalise,
    tokens: tokens, eaCode: eaCode, useWasm: function (api) { wasmApi = api || null; } };
});
