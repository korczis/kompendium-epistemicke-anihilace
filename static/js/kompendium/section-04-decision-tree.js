// Kapitola 4 — radiální strom odkazů kapitoly (p5.js). Kořen = kapitola, ve které graf leží,
// první prstenec = její stránky, druhý = oddíly knihy, na které daná stránka odkazuje (počet
// odkazů v závorce); vše z grafu knihy. Klik na uzel → stránka nebo seznam odkazovaných stránek
// oddílu s odkazy. Rozhodovací logika se z dat knihy odvodit nedá, proto ji strom netvrdí.
// Plátno zakládá komponentová vrstva (vrstva.js): šířka podle hostitele, čtvercová plocha
// v mezích výšky; poloměry prstenců se počítají z kratší strany plátna.
(function() {
  'use strict';

  // Data knihy přes komponentovou vrstvu (vrstva.js): kniha.js se načte jednou za stránku.
  var kniha = window.KompendiumVrstva.kniha;

  function failed(el, e) {
    if (window.console) console.warn('vizualizace knihy:', e);
    if (el) el.textContent = 'Data knihy se nepodařilo načíst.';
  }

  function hexRgb(hex) {
    var n = parseInt(hex.slice(1), 16);
    return [n >> 16, (n >> 8) & 255, n & 255];
  }

  // Strom: kapitola → její stránky → oddíly, na které stránka odkazuje.
  function buildTree(K) {
    var here = K.current;
    var section = here ? here.section : '';
    var root = K.indexOf(section);
    var pages = K.pagesOf(section).filter(function (n) { return !here || n.id !== here.id; });
    function sectionTitle(sec) {
      var ix = K.indexOf(sec);
      return ix ? ix.title : K.V.sectionLabel(sec);
    }
    return {
      id: 'root', label: root ? K.parseTitle(root.title).full : section, node: root, rgb: [148, 163, 184],
      children: pages.map(function (n) {
        var bySec = {};
        K.g.out[n.id].forEach(function (b) {
          var m = K.g.byId[b];
          if (m.section === section || K.isIndex(m)) return;
          (bySec[m.section] = bySec[m.section] || []).push(m);
        });
        var t = K.parseTitle(n.title);
        return {
          id: 'p' + n.id, label: t.head, full: n.title, node: n, rgb: [99, 102, 241],
          children: Object.keys(bySec).sort(function (a, b) { return bySec[b].length - bySec[a].length; }).map(function (sec) {
            return {
              id: 'p' + n.id + ':' + sec, label: sectionTitle(sec) + ' (' + bySec[sec].length + ')', section: sec,
              targets: bySec[sec], from: n, rgb: hexRgb(K.g.color(sec)),
            };
          }),
        };
      }),
    };
  }

  // Layout: assign each node an angle and depth recursively
  function layout(node, depth, startA, endA, list) {
    node._depth = depth;
    node._angle = (startA + endA) / 2;
    list.push(node);
    if (node.children && node.children.length) {
      const span = (endA - startA) / node.children.length;
      node.children.forEach((c, i) => {
        layout(c, depth + 1, startA + i * span, startA + (i + 1) * span, list);
      });
    }
  }

  function setDetail(K, container, node) {
    K.clear(container);
    container.appendChild(K.h('h3', 'text-lg font-bold text-gray-900 dark:text-white', node.full || node.label));
    if (node.targets) {
      container.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', 'Stránka „' + node.from.title + '“ sem odkazuje ' +
        node.targets.length + '×:'));
      container.appendChild(K.list(node.targets));
      return;
    }
    if (node.children) {
      container.appendChild(K.h('p', 'text-gray-500 dark:text-gray-400 text-sm', node._depth === 0
        ? node.children.length + ' stránek kapitoly'
        : 'Odkazuje do ' + node.children.length + ' oddílů knihy.'));
    }
    if (node.node) {
      const p = K.h('p', 'mt-2 text-sm');
      p.appendChild(K.link(node.node, '→ Otevřít stránku'));
      container.appendChild(p);
    }
  }

  function init() {
    const host = document.getElementById('section-04-decision-tree');
    if (!host || typeof window.p5 === 'undefined') return;
    const detail = document.getElementById('tree-detail');
    kniha().then(function (K) { draw(K, buildTree(K), host, detail); }).catch(function (e) { failed(detail, e); });
  }

  function draw(K, TREE, host, detail) {
    const flatList = [];
    layout(TREE, 0, -Math.PI, Math.PI, flatList);
    if (detail) {
      K.clear(detail);
      detail.appendChild(K.h('p', 'text-gray-700 dark:text-gray-300 text-sm', 'Vnitřní prstenec: ' + TREE.children.length +
        ' stránek kapitoly; vnější: oddíly knihy, na které odkazují (barva = oddíl). Klikněte na uzel.'));
    }

    // Strom je statický: kreslí se jen při změně (najetí, klik, velikost, téma), bez smyčky.
    window.KompendiumVrstva.p5(host, function (p, k) {
      let cx, cy;
      let radii = [0, 0, 0];
      let hovered = null;

      // Geometrie podle skutečné velikosti plátna (vrstva ji přepočítá při změně šířky).
      function geometry() {
        const R = Math.min(p.width, p.height) / 2 - 30;
        cx = p.width / 2; cy = p.height / 2;
        radii = [0, R * 0.48, R * 0.95];
      }

      p.setup = function() {
        k.canvas();
        geometry();
      };

      p.resized = function() {
        geometry();
      };

      p.draw = function() {
        p.background(15, 23, 42);
        // Nejdřív hrany
        p.strokeWeight(1.2);
        p.noFill();
        flatList.forEach((node) => {
          if (!node.children) return;
          const r1 = radii[node._depth];
          const r2 = radii[node._depth + 1];
          node.children.forEach((c) => {
            const x1 = cx + r1 * Math.cos(node._angle);
            const y1 = cy + r1 * Math.sin(node._angle);
            const x2 = cx + r2 * Math.cos(c._angle);
            const y2 = cy + r2 * Math.sin(c._angle);
            const col = c.rgb;
            p.stroke(col[0], col[1], col[2], 90);
            p.line(x1, y1, x2, y2);
          });
        });

        // Uzly; popisky jsou světlé na tmavém pozadí plátna (kontrast > 4.5:1). Na úzkém
        // plátně se zkracují víc, aby se popisky prvního prstence méně překrývaly.
        const maxChars = p.width < 560 ? 16 : 26;
        flatList.forEach((node) => {
          const r = radii[node._depth];
          const x = cx + r * Math.cos(node._angle);
          const y = cy + r * Math.sin(node._angle);
          const col = node.rgb;
          const baseR = [14, 8, 5][node._depth];
          const isHover = hovered && hovered.id === node.id;
          p.noStroke();
          p.fill(col[0], col[1], col[2], isHover ? 255 : 200);
          p.ellipse(x, y, isHover ? baseR * 2 + 6 : baseR * 2);

          if (node._depth <= 1 || isHover) {
            p.fill(241, 245, 249);
            p.textAlign(p.CENTER, p.CENTER);
            p.textSize(node._depth === 0 ? 12 : (node._depth === 1 ? 11 : 10));
            const ty = node._depth === 0 ? y + baseR + 10 : y - baseR - 8;
            const text = node.label.length > maxChars
              ? node.label.slice(0, maxChars - 1) + '…' : node.label;
            p.text(text, x, ty);
          }
        });

        // bublina u uzlu pod ukazatelem
        if (hovered) {
          const w = p.width;
          p.fill(15, 23, 42, 230);
          p.stroke(148, 163, 184, 180);
          p.strokeWeight(1);
          p.textSize(11);
          const tip = hovered.full || hovered.label;
          const tw = Math.min(w - 20, Math.max(180, p.textWidth(tip) + 30));
          const tx = Math.max(4, Math.min(p.mouseX + 10, w - tw - 4));
          const ty = Math.min(p.mouseY + 10, p.height - 44);
          p.rect(tx, ty, tw, 40, 4);
          p.noStroke();
          p.fill(241, 245, 249);
          p.textAlign(p.LEFT, p.TOP);
          p.text(tip, tx + 8, ty + 6, tw - 16, 14);
          p.fill(148, 163, 184);
          p.text('Klik pro detail', tx + 8, ty + 20);
        }
      };

      function pickNodeAt(mx, my) {
        let best = null;
        let bestD = 9999;
        flatList.forEach((node) => {
          const r = radii[node._depth];
          const x = cx + r * Math.cos(node._angle);
          const y = cy + r * Math.sin(node._angle);
          const d = Math.sqrt((mx - x) * (mx - x) + (my - y) * (my - y));
          if (d < 12 && d < bestD) { best = node; bestD = d; }
        });
        return best;
      }

      p.mouseMoved = function() {
        const before = hovered;
        hovered = pickNodeAt(p.mouseX, p.mouseY);
        // překreslit jen při změně nebo když bublina sleduje ukazatel
        if (hovered || before) p.redraw();
      };

      p.mousePressed = function() {
        const node = pickNodeAt(p.mouseX, p.mouseY);
        if (node && detail) setDetail(K, detail, node);
        if (node) { hovered = node; p.redraw(); }
      };
    }, {
      animate: false, aspect: 1, minHeight: 360, maxHeight: 640,
      label: 'Radiální strom odkazů sekce ' + (TREE.label || '') + ': kořen uprostřed, vnitřní ' +
        'prstenec ' + TREE.children.length + ' stránek kapitoly, vnější prstenec oddíly knihy, ' +
        'na které jednotlivé stránky odkazují (barva = oddíl).',
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
