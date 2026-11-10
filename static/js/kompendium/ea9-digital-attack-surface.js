// Digitální útočná plocha (Three.js): koule = epistemická plocha osoby, vektory = stránky
// technik rodiny EA-N, kterou jmenuje nadpis nad grafem (kód a název z grafu knihy), barva =
// podrodina (název z katalogu technik). Klik na hrot vektoru → technika, podrodina a odkaz.
// Plátno, jeho velikost (šířka hostitele, výška z poměru stran), smyčku, pauzu a popisek řídí
// komponentová vrstva (KompendiumVrstva.three); pozadí, koule a barvy podrodin sledují téma.
(function () {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

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
    var V = window.KompendiumVrstva;
    var fid = K.familyNear(container);
    var vectors = K.techniques.filter(function (t) { return t.family === fid; });
    var subs = [];
    vectors.forEach(function (t) { if (subs.indexOf(t.sub) < 0) subs.push(t.sub); });
    // Barva podrodiny = odstín živé kategorické palety (posun o 4, jako dosud).
    function subColor(s) {
      return V.PALETTE[(subs.indexOf(s) + 4) % V.PALETTE.length];
    }
    function subLabel(s) { return s + (subName[s] ? ' ' + subName[s] : ''); }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', fid + ' ' + K.familyName(fid) +
        ': ' + vectors.length + ' stránek technik. Podrodiny: ' + subs.map(function (s) {
          return subLabel(s) + ' (' +
            vectors.filter(function (t) { return t.sub === s; }).length + ')';
        }).join(' · ') + '.'));
    }

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(60, 1, 0.1, 1000);
    var sphereMat = new THREE.MeshBasicMaterial({ wireframe: true, transparent: true,
      opacity: 0.6 });
    var sphere = new THREE.Mesh(new THREE.SphereGeometry(4, 32, 32), sphereMat);
    scene.add(sphere);

    var tips = [];
    var rays = [];
    vectors.forEach(function (v, i) {
      var phi = Math.acos(1 - (2 * (i + 0.5)) / vectors.length);
      var theta = Math.PI * (1 + Math.sqrt(5)) * i;
      var dir = new THREE.Vector3(Math.cos(theta) * Math.sin(phi),
        Math.sin(theta) * Math.sin(phi), Math.cos(phi));
      var outer = dir.clone().multiplyScalar(11);
      var line = new THREE.Line(
        new THREE.BufferGeometry().setFromPoints([outer, dir.clone().multiplyScalar(4.1)]),
        new THREE.LineBasicMaterial({ transparent: true, opacity: 0.7 }));
      line.userData = v;
      scene.add(line);
      rays.push(line);
      var tip = new THREE.Mesh(new THREE.SphereGeometry(0.22, 8, 8),
        new THREE.MeshBasicMaterial());
      tip.position.copy(outer);
      tip.userData = v;
      scene.add(tip);
      tips.push(tip);
    });

    // Barvy z tématu: povrch scény, drátěná koule a podrodiny z živé palety.
    function applyTheme(th) {
      scene.background = new THREE.Color(th.surface);
      sphereMat.color.set(th.edge);
      rays.concat(tips).forEach(function (o) { o.material.color.set(subColor(o.userData.sub)); });
    }
    applyTheme(V.theme());

    var time = 0;
    var t = V.three(container, {
      aspect: 0.625, minHeight: 320, maxHeight: 500,
      label: 'Digitální útočná plocha: koule s ' + vectors.length + ' vektory, stránkami ' +
        'technik rodiny ' + fid + '; barva vektoru je podrodina.',
      frame: function (dt) {
        time += 0.18 * dt;
        sphere.rotation.y = time;
        scene.rotation.y = time * 0.3;
      },
      render: function () { t.renderer.render(scene, camera); },
      resize: function (w, h) {
        camera.aspect = w / h;
        // Odstup kamery tak, aby hroty vektorů (poloměr 11) zůstaly v záběru i na úzkém plátně.
        camera.position.z = 13 / (Math.tan(Math.PI / 6) * Math.min(1, w / h));
        camera.updateProjectionMatrix();
      },
      theme: applyTheme,
    });
    if (!t) return;
    // Výšku určuje plátno (poměr stran), ne pevná výška hostitele ze stránky.
    container.style.height = 'auto';

    function show(tech) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-red-300',
        tech.code + ' — ' + tech.label));
      detail.appendChild(K.h('p', 'text-slate-300 mt-1 text-sm',
        'Podrodina: ' + subLabel(tech.sub)));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(tech.node, '→ stránka techniky'));
      detail.appendChild(p);
    }

    var ray = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    t.renderer.domElement.addEventListener('click', function (e) {
      var r = t.renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - r.left) / r.width) * 2 - 1;
      mouse.y = -((e.clientY - r.top) / r.height) * 2 + 1;
      ray.setFromCamera(mouse, camera);
      var hits = ray.intersectObjects(tips);
      if (hits.length) show(hits[0].object.userData);
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
