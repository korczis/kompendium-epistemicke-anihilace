// 3D graf technik (Three.js): uzly = všechny stránky technik z grafu knihy, seřazené podle kódu
// po Fibonacciho sféře, barva = rodina EA, hrany = odkazy mezi stránkami technik v knize.
// Klik na uzel → kód, název, rodina, počet vazeb a odkaz na stránku techniky.
(function () {
  'use strict';
  var SRC = document.currentScript && document.currentScript.src;

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
    var container = document.getElementById('technique-graph-3d');
    if (!container || typeof THREE === 'undefined') return;
    var detail = document.getElementById('graph-detail');
    kniha().then(function (K) { draw(K, container, detail); }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, container, detail) {
    var techs = K.techniques;
    var edges = K.edgesAmong(techs.map(function (t) { return t.id; }));
    var degree = {};
    edges.forEach(function (e) { degree[e.a] = (degree[e.a] || 0) + 1; degree[e.b] = (degree[e.b] || 0) + 1; });

    var W = container.clientWidth || 800;
    var H = container.clientHeight || 500;
    var scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0f172a);
    var camera = new THREE.PerspectiveCamera(60, W / H, 0.1, 1000);
    camera.position.z = 15;
    var renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(W, H);
    container.appendChild(renderer.domElement);

    var group = new THREE.Group();
    scene.add(group);
    var geo = new THREE.SphereGeometry(1, 10, 10);
    var meshes = [];
    var pos = {};
    var R = 7;
    techs.forEach(function (t, i) {
      var n = techs.length;
      var phi = Math.acos(1 - (2 * (i + 0.5)) / n);
      var theta = Math.PI * (1 + Math.sqrt(5)) * i;
      var col = new THREE.Color(K.familyColor(t.family));
      var mesh = new THREE.Mesh(geo, new THREE.MeshStandardMaterial({ color: col, emissive: col, emissiveIntensity: 0.4 }));
      var s = 0.09 + Math.min(0.2, Math.sqrt(degree[t.id] || 0) * 0.03);
      mesh.scale.set(s, s, s);
      mesh.position.set(R * Math.sin(phi) * Math.cos(theta), R * Math.sin(phi) * Math.sin(theta), R * Math.cos(phi));
      mesh.userData = t;
      pos[t.id] = mesh.position;
      group.add(mesh);
      meshes.push(mesh);
    });
    var pts = [];
    edges.forEach(function (e) { pts.push(pos[e.a], pos[e.b]); });
    var lines = new THREE.LineSegments(new THREE.BufferGeometry().setFromPoints(pts),
      new THREE.LineBasicMaterial({ color: 0x64748b, opacity: 0.18, transparent: true }));
    group.add(lines);
    scene.add(new THREE.AmbientLight(0xffffff, 0.5));
    var light = new THREE.PointLight(0xffffff, 1.0, 100);
    light.position.set(10, 10, 10);
    scene.add(light);

    function show(t) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-slate-100', t.code));
      detail.appendChild(K.h('p', 'text-slate-300 mt-1', t.label));
      detail.appendChild(K.h('p', 'text-slate-400 text-sm', t.family + (K.familyName(t.family) ? ' ' + K.familyName(t.family) : '') +
        ' • ' + (degree[t.id] || 0) + ' vazeb na jiné techniky podle odkazů v knize'));
      detail.appendChild(K.link(t.node, '→ otevřít stránku techniky', 'text-blue-400 underline'));
    }

    if (detail && !detail.firstChild) {
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', techs.length + ' stránek technik, ' + edges.length +
        ' vazeb podle odkazů v knize. Klikněte na uzel.'));
    }

    var raycaster = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    container.addEventListener('click', function (e) {
      var rect = renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - rect.left) / rect.width) * 2 - 1;
      mouse.y = -((e.clientY - rect.top) / rect.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      var hits = raycaster.intersectObjects(meshes);
      if (hits.length) show(hits[0].object.userData);
    });
    var t = 0;
    function animate() {
      requestAnimationFrame(animate);
      t += 0.002;
      group.rotation.y = t;
      renderer.render(scene, camera);
    }
    animate();
    window.addEventListener('resize', function () {
      var w = container.clientWidth || 800;
      renderer.setSize(w, H);
      camera.aspect = w / H;
      camera.updateProjectionMatrix();
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
