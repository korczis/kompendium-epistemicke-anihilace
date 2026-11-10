// 3D síť protokolů zotavení (Three.js). Uzly = stránky oddílu protokolů zotavení z grafu
// knihy, vrstvy a barvy = fáze tak, jak je řadí rejstřík oddílu (nadpis a odkazy pod ním;
// stránky mimo fáze tvoří poslední vrstvu), hrany = odkazy mezi protokoly v knize.
// Klik na uzel → protokol, fáze, vazby a odkaz na jeho stránku.
// Plátno, jeho velikost (šířka hostitele, výška z poměru stran), smyčku, pauzu a popisek řídí
// komponentová vrstva (KompendiumVrstva.three); pozadí a barvy fází sledují téma.
(function () {
  'use strict';
  // Zdroj dat: rejstřík oddílu protokolů zotavení (cesta v grafu knihy).
  var SOURCE = 'kompendium/recovery-protocols/_index.md';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

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
    var V = window.KompendiumVrstva;
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
    // Barva fáze = odstín živé kategorické palety (přebarví se s tématem).
    function phaseColor(pi) { return V.PALETTE[pi % V.PALETTE.length]; }

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(55, 1, 0.1, 1000);
    // Odstup kamery: vrstvy fází (po 3 jednotkách) i přední uzly se vejdou nahoru i dolů.
    camera.position.z = 14 + phases.length * 1.7;
    var group = new THREE.Group();
    scene.add(group);

    var pos = {};
    var meshes = [];
    var lines = [];
    var geo = new THREE.SphereGeometry(0.4, 16, 16);
    phases.forEach(function (p, pi) {
      var y = ((phases.length - 1) / 2 - pi) * 3;
      p.nodes.forEach(function (n, i) {
        var a = (i / p.nodes.length) * Math.PI * 2;
        var r = 4 + (pi % 2) * 1.5;
        var v = new THREE.Vector3(r * Math.cos(a), y + (i % 2 ? 0.35 : -0.35), r * Math.sin(a));
        pos[n.id] = v;
        var mesh = new THREE.Mesh(geo, new THREE.MeshBasicMaterial());
        mesh.position.copy(v);
        mesh.userData = n;
        group.add(mesh);
        meshes.push(mesh);
      });
    });
    edges.forEach(function (e) {
      var g = new THREE.BufferGeometry().setFromPoints([pos[e.a], pos[e.b]]);
      var line = new THREE.Line(g, new THREE.LineBasicMaterial({
        transparent: true, opacity: e.mutual ? 0.55 : 0.3,
      }));
      line.userData = { phase: phaseOf[e.a] };
      group.add(line);
      lines.push(line);
    });

    // Barvy z tématu: povrch scény a fáze z živé palety.
    function applyTheme(th) {
      scene.background = new THREE.Color(th.surface);
      meshes.forEach(function (m) { m.material.color.set(phaseColor(phaseOf[m.userData.id])); });
      lines.forEach(function (l) { l.material.color.set(phaseColor(l.userData.phase)); });
    }
    applyTheme(V.theme());

    var rot = 0;
    var t = V.three(container, {
      aspect: 0.6875, minHeight: 340, maxHeight: 550,
      label: '3D síť protokolů zotavení: ' + nodes.length + ' protokolů ve ' + phases.length +
        ' vrstvách podle fází rejstříku, ' + edges.length + ' vazeb podle odkazů v knize.',
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

    function show(n) {
      if (!detail) return;
      K.clear(detail);
      detail.appendChild(K.h('h3', 'text-lg font-bold text-emerald-300', n.title));
      detail.appendChild(K.h('p', 'text-slate-400 mt-1 text-sm',
        'Fáze: ' + phases[phaseOf[n.id]].title));
      detail.appendChild(K.h('p', 'text-slate-300 mt-2 font-semibold',
        'Vazby na jiné protokoly podle odkazů v knize (' + nb[n.id].length + '):'));
      detail.appendChild(K.list(nb[n.id].map(function (id) { return byId[id]; })));
      var p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(n, '→ stránka protokolu'));
      detail.appendChild(p);
    }

    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-slate-300 text-sm', nodes.length + ' protokolů, ' +
        edges.length + ' vazeb podle odkazů v knize. Vrstvy shora: ' +
        phases.map(function (p) { return p.title + ' (' + p.nodes.length + ')'; }).join(' · ') +
        '.'));
      detail.appendChild(K.link(idx, '→ rejstřík protokolů zotavení'));
    }

    var ray = new THREE.Raycaster();
    var mouse = new THREE.Vector2();
    t.renderer.domElement.addEventListener('click', function (e) {
      var r = t.renderer.domElement.getBoundingClientRect();
      mouse.x = ((e.clientX - r.left) / r.width) * 2 - 1;
      mouse.y = -((e.clientY - r.top) / r.height) * 2 + 1;
      ray.setFromCamera(mouse, camera);
      var hits = ray.intersectObjects(meshes);
      if (hits.length) show(hits[0].object.userData);
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
