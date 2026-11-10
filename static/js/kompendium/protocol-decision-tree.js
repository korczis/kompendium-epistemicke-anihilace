// Strom akutních protokolů (Three.js 3D). Kořen = rejstřík oddílu akutních intervenčních
// protokolů, větve = jeho skupiny (nadpisy), listy = protokoly odkazované pod nimi; vše z grafu
// knihy a osnovy rejstříku. Klik na uzel → zvýraznění cesty od kořene a detail s odkazem.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;
  // Zdroj dat: rejstřík oddílu akutních protokolů (cesta v grafu knihy).
  var SOURCE = 'kompendium/emergency-protocols/_index.md';

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

  function init() {
    var container = document.getElementById('protocol-decision-tree');
    var detail = document.getElementById('protocol-tree-detail');
    if (!container || !detail || typeof THREE === 'undefined') return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, container, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, container, detail) {
    var LEVEL = ['rejstřík', 'skupina protokolů', 'protokol'];
    var tree = [{ id: 'root', lvl: 0, label: idx.title, node: idx, x: 0, y: 5, z: 0, parent: null }];
    var span = 22;
    groups.forEach(function (gr, gi) {
      var gx = groups.length > 1 ? -span / 2 + span * gi / (groups.length - 1) : 0;
      var gid = 'g' + gi;
      tree.push({ id: gid, lvl: 1, label: gr.title, text: gr.text, count: gr.nodes.length, x: gx, y: 1.5, z: 0, parent: 'root' });
      var cols = Math.ceil(gr.nodes.length / 2);
      var w = Math.min(span / groups.length - 1, cols * 0.9);
      gr.nodes.forEach(function (n, i) {
        var col = i % cols;
        var row = Math.floor(i / cols);
        tree.push({
          id: 'n' + n.id, lvl: 2, label: n.title, node: n, group: gr.title, parent: gid,
          x: gx - w / 2 + (cols > 1 ? w * col / (cols - 1) : w / 2), y: -2 - row * 1.4, z: row ? -1 : 1,
        });
      });
    });
    var byId = {};
    tree.forEach(function (n) { byId[n.id] = n; });

    var w = container.clientWidth || 800;
    var h = container.clientHeight || 500;
    var scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0f172a);
    var camera = new THREE.PerspectiveCamera(60, w / h, 0.1, 200);
    // vzdálenost kamery tak, aby se celá šířka stromu vešla i při natočení scény
    camera.position.set(0, 0, Math.max(16, (span / 2 + 8) / (Math.tan(Math.PI / 6) * (w / h))));
    var renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(w, h);
    container.appendChild(renderer.domElement);
    scene.add(new THREE.AmbientLight(0xffffff, 0.6));
    var dl = new THREE.DirectionalLight(0xffffff, 0.8);
    dl.position.set(5, 10, 7);
    scene.add(dl);

    var LVLCOLOR = [0xef4444, 0xf59e0b, 0x3b82f6];
    var RADIUS = [0.7, 0.5, 0.28];
    var meshes = [];
    tree.forEach(function (n) {
      var m = new THREE.Mesh(new THREE.SphereGeometry(RADIUS[n.lvl], 20, 20),
        new THREE.MeshPhongMaterial({ color: LVLCOLOR[n.lvl], emissive: LVLCOLOR[n.lvl], emissiveIntensity: 0.25 }));
      m.position.set(n.x, n.y, n.z);
      m.userData = n;
      scene.add(m);
      meshes.push(m);
    });
    var lines = [];
    tree.forEach(function (n) {
      if (!n.parent) return;
      var p = byId[n.parent];
      var l = new THREE.Line(new THREE.BufferGeometry().setFromPoints([new THREE.Vector3(p.x, p.y, p.z), new THREE.Vector3(n.x, n.y, n.z)]),
        new THREE.LineBasicMaterial({ color: 0x475569, transparent: true, opacity: 0.6 }));
      l.userData = { from: p.id, to: n.id };
      scene.add(l);
      lines.push(l);
    });

    function highlight(node) {
      var path = [];
      for (var cur = node; cur; cur = cur.parent ? byId[cur.parent] : null) path.push(cur.id);
      meshes.forEach(function (m) { m.material.emissiveIntensity = path.indexOf(m.userData.id) >= 0 ? 0.8 : 0.15; });
      lines.forEach(function (l) {
        l.material.color.setHex(path.indexOf(l.userData.to) >= 0 && path.indexOf(l.userData.from) >= 0 ? 0xfbbf24 : 0x475569);
      });
      K.clear(detail);
      detail.appendChild(K.h('h4', 'font-bold text-lg mb-2', node.label));
      detail.appendChild(K.h('p', 'text-xs text-slate-400 mb-2', 'Úroveň ' + node.lvl + ' · ' + LEVEL[node.lvl] +
        (node.group ? ' · ' + node.group : '') + (node.count ? ' · ' + node.count + ' protokolů' : '')));
      if (node.text) detail.appendChild(K.h('p', 'text-sm', node.text));
      if (node.lvl === 1) {
        detail.appendChild(K.list(tree.filter(function (x) { return x.parent === node.id; }).map(function (x) { return x.node; })));
      }
      if (node.node) {
        var p = K.h('p', 'mt-2 text-sm');
        p.appendChild(K.link(node.node, node.lvl ? '→ stránka protokolu' : '→ rejstřík akutních protokolů'));
        detail.appendChild(p);
      }
    }

    var raycaster = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    renderer.domElement.addEventListener('click', function (ev) {
      var r = renderer.domElement.getBoundingClientRect();
      mouse.x = ((ev.clientX - r.left) / r.width) * 2 - 1;
      mouse.y = -((ev.clientY - r.top) / r.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      var hits = raycaster.intersectObjects(meshes);
      if (hits.length) highlight(hits[0].object.userData);
    });
    (function loop() { requestAnimationFrame(loop); scene.rotation.y = Math.sin(Date.now() / 6000) * 0.2; renderer.render(scene, camera); })();
    K.clear(detail);
    detail.appendChild(K.h('p', null, groups.length + ' skupin a ' + (tree.length - 1 - groups.length) +
      ' protokolů podle rejstříku. Klikněte na uzel pro zvýraznění cesty a detail.'));
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
