// Digitální útočná plocha (Three.js): koule = epistemická plocha osoby, vektory = stránky
// technik rodiny EA-N, kterou jmenuje nadpis nad grafem (kód a název z grafu knihy), barva =
// podrodina (název z katalogu technik). Klik na hrot vektoru → technika, podrodina a odkaz.
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
    var container = document.getElementById('ea9-attack-surface');
    var detail = document.getElementById('ea9-attack-detail');
    if (!container || typeof THREE === 'undefined') return;
    kniha().then(function (K) {
      return K.catalogue().catch(function () { return null; }).then(function (cat) {
        draw(K, K.subNames(cat), container, detail);
      });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, subName, container, detail) {
    var fid = K.familyNear(container);
    var vectors = K.techniques.filter(function (t) { return t.family === fid; });
    var subs = [];
    vectors.forEach(function (t) { if (subs.indexOf(t.sub) < 0) subs.push(t.sub); });
    var colors = subs.map(function (s, i) { return new THREE.Color(K.V.PALETTE[(i + 4) % K.V.PALETTE.length]); });
    function subLabel(s) { return s + (subName[s] ? ' ' + subName[s] : ''); }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', fid + ' ' + K.familyName(fid) + ': ' + vectors.length +
        ' stránek technik. Podrodiny: ' + subs.map(function (s) {
          return subLabel(s) + ' (' + vectors.filter(function (t) { return t.sub === s; }).length + ')';
        }).join(' · ') + '.'));
    }

    var W = container.clientWidth || 800;
    var H = container.clientHeight || 500;
    var scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0a0a0a);
    var camera = new THREE.PerspectiveCamera(60, W / H, 0.1, 1000);
    camera.position.z = 18;
    var renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(W, H);
    container.appendChild(renderer.domElement);
    var sphere = new THREE.Mesh(new THREE.SphereGeometry(4, 32, 32),
      new THREE.MeshBasicMaterial({ color: 0x1e293b, wireframe: true, transparent: true, opacity: 0.6 }));
    scene.add(sphere);

    var tips = [];
    vectors.forEach(function (v, i) {
      var phi = Math.acos(1 - (2 * (i + 0.5)) / vectors.length);
      var theta = Math.PI * (1 + Math.sqrt(5)) * i;
      var dir = new THREE.Vector3(Math.cos(theta) * Math.sin(phi), Math.sin(theta) * Math.sin(phi), Math.cos(phi));
      var col = colors[subs.indexOf(v.sub)];
      var outer = dir.clone().multiplyScalar(11);
      scene.add(new THREE.Line(new THREE.BufferGeometry().setFromPoints([outer, dir.clone().multiplyScalar(4.1)]),
        new THREE.LineBasicMaterial({ color: col, transparent: true, opacity: 0.7 })));
      var tip = new THREE.Mesh(new THREE.SphereGeometry(0.22, 8, 8), new THREE.MeshBasicMaterial({ color: col }));
      tip.position.copy(outer);
      tip.userData = v;
      scene.add(tip);
      tips.push(tip);
    });

    function show(t) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-red-300', t.code + ' — ' + t.label));
      detail.appendChild(K.h('p', 'text-slate-300 mt-1 text-sm', 'Podrodina: ' + subLabel(t.sub)));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(t.node, '→ stránka techniky'));
      detail.appendChild(p);
    }

    var ray = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    renderer.domElement.addEventListener('click', function (e) {
      var r = renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - r.left) / r.width) * 2 - 1;
      mouse.y = -((e.clientY - r.top) / r.height) * 2 + 1;
      ray.setFromCamera(mouse, camera);
      var hits = ray.intersectObjects(tips);
      if (hits.length) show(hits[0].object.userData);
    });
    var t = 0;
    (function animate() {
      requestAnimationFrame(animate);
      t += 0.003;
      sphere.rotation.y = t;
      scene.rotation.y = t * 0.3;
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
