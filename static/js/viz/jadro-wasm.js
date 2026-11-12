// The book's engine in WebAssembly: the loader of crates/kompendium-engine (contract
// kompendium-engine/v1, docs/engine/kompendium-engine-v1.md), for the browser and Node.
//
// The module is static/wasm/kompendium_engine.wasm (build: crates/kompendium-engine/README.md).
// The loader compiles it once, checks that it speaks contract v1 (contract(), an unknown op,
// the contract's normalisation), then gives every create() an instance of its own.
// KompendiumJadro.create (viz/jadro.js) uses it once it is ready and stays with JS until then.
//
//   browser: <script src=".../js/viz/jadro-wasm.js" [data-wasm="module URL"]></script>
//            loads by itself (instantiateStreaming; on a MIME error, instantiate over bytes)
//   Node:    var W = require('./jadro-wasm.js'); W.loadSync('static/wasm/kompendium_engine.wasm');
//
//   W.ready()                     true once the module is compiled and passed the check
//   W.create(searchDoc, graphDoc) {engine: 'wasm', run, runText, normalise}, or null
//   engine.run(request)           the contract's answer; null when the request cannot be
//                                 handed over as JSON (a lone UTF-16 surrogate), see jadro.js
(function (root, factory) {
  'use strict';
  if (typeof module === 'object' && module.exports) module.exports = factory();
  else root.KompendiumJadroWasm = factory();
})(typeof self !== 'undefined' ? self : this, function () {
  'use strict';

  var SCHEMA = 'kompendium-engine/v1';
  var NO_SEARCH = { schema: 'kompendium-search/v1', fields: ['title', 'description', 'url', 'code',
    'kind', 'aliases', 'in'], entries: [] };
  var NO_GRAPH = { schema: 'kompendium-graph/v2', nodes: [], edges: [] };
  // A lone surrogate in JSON.stringify's text (written as \udXXX). serde_json refuses such
  // text; a false match (a literal "\\udXXX") only sends the request to the JS engine, which
  // answers the same.
  var LONE_SURROGATE = /\\u[dD][89a-fA-F][0-9a-fA-F]{2}/;

  var compiled = null;  // the WebAssembly.Module that passed the check
  var loading = null;
  var encoder = new TextEncoder();
  var decoder = new TextDecoder('utf-8');

  function put(x, text) {
    var bytes = encoder.encode(text);
    var ptr = x.alloc(bytes.length);
    new Uint8Array(x.memory.buffer, ptr, bytes.length).set(bytes);
    return [ptr, bytes.length];
  }

  function result(x, ptr) {
    return decoder.decode(new Uint8Array(x.memory.buffer, ptr, x.result_len()));
  }

  // One instance holds one engine; null when the inputs cannot be written or init fails.
  function instance(module, search, graph) {
    var s;
    var g;
    try {
      s = JSON.stringify(search);
      g = JSON.stringify(graph);
    } catch (e) {
      return null;
    }
    if (typeof s !== 'string' || typeof g !== 'string') return null;
    var x = new WebAssembly.Instance(module, {}).exports;
    var a = put(x, s);
    var b = put(x, g);
    var status = x.init(a[0], a[1], b[0], b[1]);
    x.dealloc(a[0], a[1]);
    x.dealloc(b[0], b[1]);
    if (status !== 0) return null;

    function runText(text) {
      var r = put(x, text);
      var answer = result(x, x.run(r[0], r[1]));
      x.dealloc(r[0], r[1]);
      return answer;
    }

    return {
      engine: 'wasm',
      run: function (request) {
        var text = JSON.stringify(request);
        if (text === undefined) text = 'null';
        if (LONE_SURROGATE.test(text)) return null;
        return JSON.parse(runText(text));
      },
      // JSON text in and out, unconverted (test 06 compares the answer byte for byte).
      runText: runText,
      normalise: function (text) {
        var r = put(x, String(text));
        var out = result(x, x.normalise(r[0], r[1]));
        x.dealloc(r[0], r[1]);
        return out;
      },
    };
  }

  // The module speaks contract v1: its name, an unknown op, a normalisation example.
  function conformant(module) {
    try {
      var x = new WebAssembly.Instance(module, {}).exports;
      if (result(x, x.contract()) !== SCHEMA) return false;
      var e = instance(module, NO_SEARCH, NO_GRAPH);
      var r = e && e.run({ op: 'x' });
      return !!r && r.schema === SCHEMA && r.ok === false && r.error.code === 'bad_input' &&
        r.error.field === 'op' && e.normalise('Šikana  ') === 'sikana';
    } catch (err) {
      return false;
    }
  }

  function accept(module) {
    compiled = conformant(module) ? module : null;
    return compiled !== null;
  }

  // Browser: fetch and compile the module; the promise resolves true when it is ready.
  function load(url) {
    if (loading) return loading;
    loading = fetch(url).then(function (r) {
      if (!r.ok) throw new Error('HTTP ' + r.status);
      var copy = r.clone();
      var stream = WebAssembly.instantiateStreaming
        ? WebAssembly.instantiateStreaming(r, {}) : Promise.reject(new Error('no streaming'));
      return stream.catch(function () {
        return copy.arrayBuffer().then(function (buf) { return WebAssembly.instantiate(buf, {}); });
      });
    }).then(function (res) { return accept(res.module); }, function () { return false; });
    return loading;
  }

  // Node and tests: the module's bytes (or a file path), compiled synchronously.
  function loadSync(source) {
    var bytes = source;
    if (typeof source === 'string') bytes = require('fs').readFileSync(source);
    return accept(new WebAssembly.Module(bytes));
  }

  function create(search, graph) {
    return compiled ? instance(compiled, search, graph) : null;
  }

  // In a browser the module loads at once: data-wasm's URL, else ../../wasm/ from this script.
  if (typeof document !== 'undefined' && document.currentScript &&
      typeof WebAssembly === 'object' && typeof fetch === 'function') {
    var me = document.currentScript;
    var url = me.getAttribute('data-wasm') ||
      new URL('../../wasm/kompendium_engine.wasm', me.src).href;
    load(url);
  }

  return {
    SCHEMA: SCHEMA,
    load: load,
    loadSync: loadSync,
    create: create,
    ready: function () { return compiled !== null; },
    loading: function () { return loading; },
  };
});
