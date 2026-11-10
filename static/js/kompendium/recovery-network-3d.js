// 3D síť protokolů zotavení (Three.js). Uzly = stránky oddílu protokolů zotavení z grafu
// knihy, vrstvy a barvy = fáze tak, jak je řadí rejstřík oddílu (nadpis a odkazy pod ním;
// stránky mimo fáze tvoří poslední vrstvu), hrany = odkazy mezi protokoly v knize.
// Klik na uzel → protokol, fáze, vazby a odkaz na jeho stránku.
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

  function init() {
    var container = document.getElementById('recovery-network-3d');
    var detail = document.getElementById('recovery-network-detail');
    if (!container || typeof THREE === 'undefined') return;
    kniha().then(function (K) {
      var idx = K.g.byPath[SOURCE];
      if (!idx) throw new Error(SOURCE + ' není v grafu');
      return K.groups(idx).then(function (groups) { draw(K, idx, groups, container, detail); });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, idx, groups, container, detail) {
    var pages = K.pagesOf(idx.section);
    var phaseOf = {};
    groups.forEach(function (gr, gi) { gr.nodes.forEach(function (n) { phaseOf[n.id] = gi; }); });
    var rest = pages.filter(function (n) { return !(n.id in phaseOf); });
    var phases = groups.map(function (gr) { return { title: gr.title, nodes: gr.nodes }; });
    if (rest.length) {
      phases.push({ title: 'Mimo fáze rejstříku', nodes: rest });
      rest.forEach(function (n) { phaseOf[n.id] = phases.length - 1; });
    }
    var nodes = [];
    phases.forEach(function (p) { nodes = nodes.concat(p.nodes); });
    var edges = K.edgesAmong(nodes.map(function (n) { return n.id; }));
    var nb = {};
    nodes.forEach(function (n) { nb[n.id] = []; });
    edges.forEach(function (e) { nb[e.a].push(e.b); nb[e.b].push(e.a); });
    var byId = {};
    nodes.forEach(function (n) { byId[n.id] = n; });
    var colors = phases.map(function (p, i) { return new THREE.Color(K.V.PALETTE[i % K.V.PALETTE.length]); });

    var W = container.clientWidth || 800;
    var H = container.clientHeight || 550;
    var scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0f172a);
    var camera = new THREE.PerspectiveCamera(55, W / H, 0.1, 1000);
    camera.position.z = 20;
    var renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(W, H);
    container.appendChild(renderer.domElement);
    var group = new THREE.Group();
    scene.add(group);

    var pos = {};
    var meshes = [];
    var geo = new THREE.SphereGeometry(0.4, 16, 16);
    phases.forEach(function (p, pi) {
      var y = ((phases.length - 1) / 2 - pi) * 3;
      p.nodes.forEach(function (n, i) {
        var a = (i / p.nodes.length) * Math.PI * 2;
        var r = 4 + (pi % 2) * 1.5;
        var v = new THREE.Vector3(r * Math.cos(a), y + (i % 2 ? 0.35 : -0.35), r * Math.sin(a));
        pos[n.id] = v;
        var mesh = new THREE.Mesh(geo, new THREE.MeshBasicMaterial({ color: colors[pi] }));
        mesh.position.copy(v);
        mesh.userData = n;
        group.add(mesh);
        meshes.push(mesh);
      });
    });
    edges.forEach(function (e) {
      var g = new THREE.BufferGeometry().setFromPoints([pos[e.a], pos[e.b]]);
      group.add(new THREE.Line(g, new THREE.LineBasicMaterial({
        color: colors[phaseOf[e.a]], transparent: true, opacity: e.mutual ? 0.55 : 0.3,
      })));
    });

    function show(n) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-emerald-300', n.title));
      detail.appendChild(K.h('p', 'text-slate-400 mt-1 text-sm', 'Fáze: ' + phases[phaseOf[n.id]].title));
      detail.appendChild(K.h('p', 'text-slate-300 mt-2 font-semibold', 'Vazby na jiné protokoly podle odkazů v knize (' + nb[n.id].length + '):'));
      detail.appendChild(K.list(nb[n.id].map(function (id) { return byId[id]; })));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(n, '→ stránka protokolu'));
      detail.appendChild(p);
    }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', nodes.length + ' protokolů, ' + edges.length +
        ' vazeb podle odkazů v knize. Vrstvy shora: ' + phases.map(function (p) {
          return p.title + ' (' + p.nodes.length + ')';
        }).join(' · ') + '.'));
      detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
    }

    var ray = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    renderer.domElement.addEventListener('click', function (e) {
      var r = renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - r.left) / r.width) * 2 - 1;
      mouse.y = -((e.clientY - r.top) / r.height) * 2 + 1;
      ray.setFromCamera(mouse, camera);
      var hits = ray.intersectObjects(meshes);
      if (hits.length) show(hits[0].object.userData);
    });
    var t = 0;
    (function animate() {
      requestAnimationFrame(animate);
      t += 0.002;
      group.rotation.y = t;
      renderer.render(scene, camera);
    })();
    window.addEventListener('resize', function () {
      var w = container.clientWidth || 800;
      renderer.setSize(w, H);
      camera.aspect = w / H;
      camera.updateProjectionMatrix();
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
