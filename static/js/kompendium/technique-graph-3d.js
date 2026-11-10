// 3D graf technik (Three.js): uzly = všechny stránky technik z grafu knihy, seřazené podle kódu
// po Fibonacciho sféře, barva = rodina EA, hrany = odkazy mezi stránkami technik v knize.
// Klik na uzel → kód, název, rodina, počet vazeb a odkaz na stránku techniky.
// Plátno, jeho velikost (šířka hostitele, výška z poměru stran), smyčku, pauzu a popisek řídí
// komponentová vrstva (KompendiumVrstva.three); pozadí, hrany a barvy rodin sledují téma.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function init() {
    var container = document.getElementById('technique-graph-3d');
    if (!container || typeof THREE === 'undefined') return;
    var detail = document.getElementById('graph-detail');
    kniha().then(function (K) { draw(K, container, detail); })
      .catch(function (e) { failed(detail, e); });
  }

  function draw(K, container, detail) {
    var V = window.KompendiumVrstva;
    var techs = K.techniques;
    var edges = K.edgesAmong(techs.map(function (t) { return t.id; }));
    var degree = {};
    edges.forEach(function (e) {
      degree[e.a] = (degree[e.a] || 0) + 1;
      degree[e.b] = (degree[e.b] || 0) + 1;
    });

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(60, 1, 0.1, 1000);
    camera.position.z = 15;

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
      var mesh = new THREE.Mesh(geo,
        new THREE.MeshStandardMaterial({ emissiveIntensity: 0.4 }));
      var s = 0.09 + Math.min(0.2, Math.sqrt(degree[t.id] || 0) * 0.03);
      mesh.scale.set(s, s, s);
      mesh.position.set(R * Math.sin(phi) * Math.cos(theta), R * Math.sin(phi) * Math.sin(theta),
        R * Math.cos(phi));
      mesh.userData = t;
      pos[t.id] = mesh.position;
      group.add(mesh);
      meshes.push(mesh);
    });
    var pts = [];
    edges.forEach(function (e) { pts.push(pos[e.a], pos[e.b]); });
    var lineMat = new THREE.LineBasicMaterial({ opacity: 0.18, transparent: true });
    group.add(new THREE.LineSegments(new THREE.BufferGeometry().setFromPoints(pts), lineMat));
    scene.add(new THREE.AmbientLight(0xffffff, 0.5));
    var light = new THREE.PointLight(0xffffff, 1.0, 100);
    light.position.set(10, 10, 10);
    scene.add(light);

    // Barvy z tématu: povrch, hrany a živá kategorická paleta (rodina EA → odstín).
    function applyTheme(th) {
      scene.background = new THREE.Color(th.surface);
      lineMat.color.set(th.muted);
      lineMat.opacity = th.dark ? 0.18 : 0.3;
      meshes.forEach(function (m) {
        var col = new THREE.Color(K.familyColor(m.userData.family));
        m.material.color.copy(col);
        m.material.emissive.copy(col);
      });
    }
    applyTheme(V.theme());

    var rot = 0;
    var t = V.three(container, {
      aspect: 0.625, minHeight: 320, maxHeight: 500,
      label: '3D graf technik: ' + techs.length + ' stránek technik, ' + edges.length +
        ' vazeb podle odkazů v knize; barva uzlu je rodina EA.',
      frame: function (dt) {
        rot += 0.12 * dt;
        group.rotation.y = rot;
      },
      render: function () { t.renderer.render(scene, camera); },
      resize: function (w, h) { camera.aspect = w / h; camera.updateProjectionMatrix(); },
      theme: applyTheme,
    });
    if (!t) return;
    // Výšku určuje plátno (poměr stran), ne pevná výška hostitele ze stránky.
    container.style.height = 'auto';

    function show(tech) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', tech.code));
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', tech.label));
      detail.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', tech.family +
        (K.familyName(tech.family) ? ' ' + K.familyName(tech.family) : '') +
        ' • ' + (degree[tech.id] || 0) + ' vazeb na jiné techniky podle odkazů v knize'));
      detail.appendChild(K.link(tech.node, '→ otevřít stránku techniky',
        'text-primary-700 dark:text-primary-400 underline'));
    }

    if (detail && !detail.firstChild) {
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm', techs.length + ' stránek technik, ' +
        edges.length + ' vazeb podle odkazů v knize. Klikněte na uzel.'));
    }

    var raycaster = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    t.renderer.domElement.addEventListener('click', function (e) {
      var rect = t.renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - rect.left) / rect.width) * 2 - 1;
      mouse.y = -((e.clientY - rect.top) / rect.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      var hits = raycaster.intersectObjects(meshes);
      if (hits.length) show(hits[0].object.userData);
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
