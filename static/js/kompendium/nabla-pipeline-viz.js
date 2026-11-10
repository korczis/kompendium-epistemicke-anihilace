// Epistemická pipeline NABLA (Three.js, prstence nad sebou + animovaný tok částic). Úrovně,
// jejich počet, názvy a popisy přebírá ze stránky knihy o epistemické pipeline: oddíl h2
// s nejvíce podnadpisy h3, každý h3 („L0: příjem surových signálů“) je jedna úroveň a první
// odstavec pod ním její popis. Klik na prstenec → úroveň a odkaz na její místo ve stránce.
// Plátno, jeho velikost (šířka hostitele, výška z poměru stran), smyčku, pauzu a popisek řídí
// komponentová vrstva (KompendiumVrstva.three); pozadí scény sleduje téma.
(function() {
  'use strict';
  // Zdroj dat: stránka glosáře o epistemické pipeline (cesta v grafu knihy).
  var SOURCE = 'glossary/epistemic-pipeline.md';
  let LEVELS = [];
  let SOURCE_NODE = null;
  let K = null;
  let highlightedIndex = -1;

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  // Úrovně = h3 pod tím h2, který jich má nejvíc.
  function levelsFrom(heads) {
    let best = null;
    let bestN = 0;
    heads.forEach((h) => {
      if (h.level !== 2) return;
      const n = heads.filter((x) => x.parent === h).length;
      if (n > bestN) { best = h; bestN = n; }
    });
    return heads.filter((x) => best && x.parent === best).map((x) => {
      const m = /^([^:]+):\s*(.*)$/.exec(x.title);
      return { id: m ? m[1].trim() : x.title, name: m ? m[2].trim() : '', desc: x.text,
        anchor: x.id, group: best.title };
    });
  }

  function setDetail(container, idx) {
    K.clear(container);
    const lvl = LEVELS[idx];
    container.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white',
      lvl.id + (lvl.name ? ' — ' + lvl.name : '')));
    if (lvl.desc) container.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 mt-1', lvl.desc));
    container.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-xs mt-2',
      'Úroveň ' + (idx + 1) + ' z ' + LEVELS.length + ' (' + lvl.group + ')'));
    const a = K.link(SOURCE_NODE, '→ úroveň ve stránce „' + SOURCE_NODE.title + '“');
    if (a.href && lvl.anchor) a.href += '#' + lvl.anchor;
    const p = K.h('p', 'mt-2 text-sm');
    p.appendChild(a);
    container.appendChild(p);
  }

  function levelColor(idx) {
    // Gradient: modrá (první úroveň) → tyrkysová → zelená → žlutá → červená (poslední)
    const t = idx / Math.max(1, LEVELS.length - 1);
    if (t < 0.33) {
      const k = t / 0.33;
      return new THREE.Color(0.1 + k * 0.0, 0.2 + k * 0.6, 0.6 + k * 0.4);
    } else if (t < 0.66) {
      const k = (t - 0.33) / 0.33;
      return new THREE.Color(0.1 + k * 0.5, 0.8, 0.7 - k * 0.5);
    } else {
      const k = (t - 0.66) / 0.34;
      return new THREE.Color(0.6 + k * 0.4, 0.8 - k * 0.5, 0.2 - k * 0.1);
    }
  }

  function init() {
    const container = document.getElementById('nabla-pipeline-viz');
    if (!container || typeof THREE === 'undefined') return;
    const detail = document.getElementById('nabla-pipeline-detail');
    kniha().then(function (k) {
      K = k;
      SOURCE_NODE = K.g.byPath[SOURCE];
      if (!SOURCE_NODE) throw new Error(SOURCE + ' není v grafu');
      return K.outline(SOURCE_NODE).then(function (heads) {
        LEVELS = levelsFrom(heads);
        if (!LEVELS.length) throw new Error('stránka pipeline nemá úrovně');
        if (detail) {
          K.clear(detail);
          detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm',
            LEVELS.length + ' úrovní podle oddílu „' + LEVELS[0].group +
            '“. Klikněte na prstenec.'));
        }
        draw(container, detail);
      });
    }).catch(function (e) { failed(detail, e); });
  }

  function draw(container, detail) {
    const V = window.KompendiumVrstva;
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 1000);

    scene.add(new THREE.AmbientLight(0xffffff, 0.6));
    const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
    dirLight.position.set(10, 20, 10);
    scene.add(dirLight);

    // Prstence úrovní nad sebou
    const rings = [];
    const RING_SPACING = 0.9;
    const RING_RADIUS = 5;
    const RING_TUBE = 0.18;
    const TOTAL_HEIGHT = LEVELS.length * RING_SPACING;
    const Y_OFFSET = -TOTAL_HEIGHT / 2 + RING_SPACING / 2;

    LEVELS.forEach((lvl, i) => {
      const color = levelColor(i);
      const geom = new THREE.TorusGeometry(RING_RADIUS, RING_TUBE, 16, 64);
      const mat = new THREE.MeshStandardMaterial({
        color: color,
        emissive: color,
        emissiveIntensity: 0.35,
        transparent: true,
        opacity: 0.55,
        metalness: 0.2,
        roughness: 0.4
      });
      const ring = new THREE.Mesh(geom, mat);
      ring.rotation.x = Math.PI / 2;
      ring.position.y = Y_OFFSET + i * RING_SPACING;
      ring.userData = { index: i, baseColor: color.clone(), baseOpacity: 0.55 };
      scene.add(ring);
      rings.push(ring);

      // Popisek úrovně (sprite s vlastním tmavým štítkem, čitelný v obou tématech)
      const canvas2d = document.createElement('canvas');
      canvas2d.width = 256;
      canvas2d.height = 64;
      const ctx = canvas2d.getContext('2d');
      ctx.fillStyle = 'rgba(15,23,42,0.85)';
      ctx.fillRect(0, 0, 256, 64);
      ctx.fillStyle = '#f1f5f9';
      ctx.font = 'bold 22px sans-serif';
      ctx.textAlign = 'left';
      ctx.fillText(lvl.id + '  ' + lvl.name, 12, 40, 236);
      const tex = new THREE.CanvasTexture(canvas2d);
      tex.needsUpdate = true;
      const spriteMat = new THREE.SpriteMaterial({ map: tex, transparent: true });
      const sprite = new THREE.Sprite(spriteMat);
      sprite.position.set(RING_RADIUS + 3, ring.position.y, 0);
      sprite.scale.set(4, 1, 1);
      scene.add(sprite);
    });

    // Částice proudící mezi sousedními úrovněmi (rychlost v podílu přechodu za sekundu)
    const PARTICLE_COUNT = 30;
    const particles = [];
    const partGeom = new THREE.SphereGeometry(0.08, 8, 8);
    for (let i = 0; i < PARTICLE_COUNT; i++) {
      const startLevel = Math.floor(Math.random() * (LEVELS.length - 1));
      const angle = Math.random() * Math.PI * 2;
      const partMat = new THREE.MeshBasicMaterial({ color: 0xffffff });
      const part = new THREE.Mesh(partGeom, partMat);
      part.userData = {
        startLevel: startLevel,
        progress: Math.random(),
        speed: 0.24 + Math.random() * 0.36,
        angle: angle
      };
      scene.add(part);
      particles.push(part);
    }

    function updateParticles(dt) {
      particles.forEach((p) => {
        const ud = p.userData;
        ud.progress += ud.speed * dt;
        if (ud.progress >= 1) {
          ud.progress = 0;
          ud.startLevel = (ud.startLevel + 1) % (LEVELS.length - 1);
          ud.angle = Math.random() * Math.PI * 2;
        }
        const startY = Y_OFFSET + ud.startLevel * RING_SPACING;
        const endY = Y_OFFSET + (ud.startLevel + 1) * RING_SPACING;
        const y = startY + (endY - startY) * ud.progress;
        const radius = RING_RADIUS * (1 - 0.15 * Math.sin(ud.progress * Math.PI));
        p.position.set(
          Math.cos(ud.angle) * radius,
          y,
          Math.sin(ud.angle) * radius
        );
        const c = levelColor(ud.startLevel);
        p.material.color.copy(c);
      });
    }

    // Kamera obíhá kolem osy pipeline (úhel v radiánech). Míří pod střed sloupce prstenců:
    // kamera je nad ním, takže při pohledu na počátek perspektiva ořízne spodní úroveň.
    let theta = 0;
    function placeCamera() {
      camera.position.set(Math.cos(theta) * 22, 8, Math.sin(theta) * 22);
      camera.lookAt(0, -1.5, 0);
    }
    placeCamera();
    updateParticles(0);

    // Pozadí scény z tématu (povrch); prstence a štítky mají vlastní barvy úrovní.
    function applyTheme(th) { scene.background = new THREE.Color(th.surface); }
    applyTheme(V.theme());

    const t = V.three(container, {
      aspect: 0.75, minHeight: 360, maxHeight: 600,
      label: 'Epistemická pipeline: ' + LEVELS.length + ' prstenců nad sebou, jeden za každou ' +
        'úroveň (' + LEVELS.map((l) => l.id).join(', ') + '); částice naznačují tok mezi nimi.',
      frame: function (dt) {
        theta += 0.15 * dt;
        placeCamera();
        updateParticles(dt);
      },
      render: function () { t.renderer.render(scene, camera); },
      resize: function (w, h) { camera.aspect = w / h; camera.updateProjectionMatrix(); },
      theme: applyTheme,
    });
    if (!t) return;
    // Výšku určuje plátno (poměr stran), ne pevná výška hostitele ze stránky.
    container.style.height = 'auto';
    const canvas = t.renderer.domElement;

    // Souřadnice ukazatele v NDC vůči aktuální velikosti plátna (i po změně velikosti)
    const raycaster = new THREE.Raycaster();
    const mouse = new THREE.Vector2();
    function pick(e) {
      const rect = canvas.getBoundingClientRect();
      mouse.x = ((e.clientX - rect.left) / rect.width) * 2 - 1;
      mouse.y = -((e.clientY - rect.top) / rect.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      return raycaster.intersectObjects(rings);
    }

    // Klik → zvýraznění prstence
    canvas.addEventListener('click', (e) => {
      const hits = pick(e);
      if (hits.length && detail) {
        const idx = hits[0].object.userData.index;
        highlightedIndex = idx;
        setDetail(detail, idx);
        rings.forEach((r, i) => {
          if (i === idx) {
            r.material.opacity = 0.95;
            r.material.emissiveIntensity = 0.9;
          } else {
            r.material.opacity = r.userData.baseOpacity;
            r.material.emissiveIntensity = 0.35;
          }
        });
        t.render();
      }
    });

    // Kurzor nad prstencem
    canvas.addEventListener('mousemove', (e) => {
      canvas.style.cursor = pick(e).length ? 'pointer' : 'default';
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
