// Kontext stránky podle typu, odvozený z grafu odkazů (data/graph.json, kompendium-graph/v1):
// technika → případy, které na ni odkazují, a sousedé v rodině EA-n; případ → použité
// techniky po rodinách a případy s nejvíce společnými technikami; heslo glosáře → oddíly
// a stránky, které pojem používají. Graf se načte, až se panel objeví v okně. Řádky se
// klonují z <template> v partials/page-context.html (tam jsou i všechny třídy pro Tailwind).
(function () {
  'use strict';

  var TECH = 'kompendium/techniques/';
  var CASE_KIND = { 'kompendium/case-studies': 'study', 'kompendium/historical-cases': 'hist' };
  var SHOW_CASES = 6;
  var SHOW_SIMILAR = 5;
  var SHOW_SECTIONS = 8;
  var SHOW_TOP = 6;
  var SHOW_SUB = 12;
  var nf = new Intl.NumberFormat('cs-CZ');
  var V = null;

  function plural(n, one, few, many) {
    return nf.format(n) + ' ' + (n === 1 ? one : n >= 2 && n <= 4 ? few : many);
  }

  // ea-1-2-2-….md → EA-1.2.2, rodina EA-1, podskupina EA-1.2 (stejně jako techniky.js).
  function codeOf(path) {
    var m = /(?:^|\/)ea-(\d+)-(\d+)(?:-(\d+))?(?=[-.])/i.exec(path || '');
    if (!m) return null;
    return {
      code: 'EA-' + m[1] + '.' + m[2] + (m[3] ? '.' + m[3] : ''),
      key: [+m[1], +m[2], +(m[3] || 0)],
      n: +m[1],
      family: 'EA-' + m[1],
      sub: 'EA-' + m[1] + '.' + m[2],
    };
  }

  function cmpKey(a, b) {
    for (var i = 0; i < 3; i++) if (a[i] !== b[i]) return a[i] - b[i];
    return 0;
  }

  function byCode(a, b) {
    return cmpKey(codeOf(a.path).key, codeOf(b.path).key) || a.path.localeCompare(b.path);
  }

  function byTitle(a, b) {
    return String(a.title).localeCompare(String(b.title), 'cs', { numeric: true });
  }

  function isIndex(n) { return /(^|\/)_index(\.[a-z]+)?\.md$/.test(n.path); }
  function isTech(n) { return n.path.indexOf(TECH) === 0 && !isIndex(n) && !!codeOf(n.path); }
  function caseKind(n) { return isIndex(n) ? '' : CASE_KIND[n.section] || ''; }

  // Barva rodiny: stejné pořadí palety jako graf rodin v katalogu technik.
  function familyColor(num) {
    var len = V.PALETTE.length;
    return V.PALETTE[((num - 1) % len + len) % len];
  }

  function techTitle(n) {
    var t = String(n.title || '').replace(/^EA[-\s]?\d+(?:[.\-]\d+)*\s*[-–—:]?\s*/i, '');
    if (!t) return n.title || n.path;
    if (t.indexOf(' ') < 0 && t.indexOf('-') > 0) t = t.replace(/-/g, ' ');
    return t.charAt(0).toUpperCase() + t.slice(1);
  }

  function caseTitle(n) { return String(n.title || n.path).replace(/^Historický případ:\s*/i, ''); }

  function uniqueNodes(G, ids, keep) {
    var seen = {};
    var res = [];
    ids.forEach(function (id) {
      var m = G.byId[id];
      if (m && !seen[id] && keep(m)) {
        seen[id] = true;
        res.push(m);
      }
    });
    return res;
  }

  // --- šablony -------------------------------------------------------------------------
  function tpl(root, name) {
    var t = root.querySelector('template[data-kx-tpl="' + name + '"]');
    return t.content.firstElementChild.cloneNode(true);
  }

  function f(el, name) { return el.querySelector('[data-f="' + name + '"]'); }

  function link(el, G, n) {
    el.setAttribute('href', G.url(n));
    return el;
  }

  function panel(root, title, count) {
    var p = tpl(root, 'panel');
    f(p, 'title').textContent = title;
    var c = f(p, 'count');
    if (count === null) c.remove();
    else c.textContent = nf.format(count);
    return { el: p, body: f(p, 'body') };
  }

  function emptyNote(root, text) {
    var e = tpl(root, 'empty');
    f(e, 'text').textContent = text;
    return e;
  }

  function subhead(root, text) {
    var s = tpl(root, 'subhead');
    s.textContent = text;
    return s;
  }

  // Prvních `limit` položek, zbytek za tlačítkem „Zobrazit další“.
  function listWithMore(root, box, items, limit, make, label) {
    items.slice(0, limit).forEach(function (x) { box.appendChild(make(x)); });
    if (items.length <= limit) return;
    var b = tpl(root, 'more');
    b.textContent = label(items.length - limit);
    b.addEventListener('click', function () {
      var first = null;
      items.slice(limit).forEach(function (x) {
        var el = make(x);
        first = first || el;
        box.insertBefore(el, b);
      });
      b.remove();
      if (first) (first.matches('a') ? first : first.querySelector('a') || first).focus();
    });
    box.appendChild(b);
  }

  function badge(root, kind) { return tpl(root, kind === 'hist' ? 'badge-hist' : 'badge-study'); }

  function chip(root, G, n) {
    var c = codeOf(n.path);
    var el = link(tpl(root, 'chip'), G, n);
    var color = familyColor(c.n);
    f(el, 'dot').style.background = color;
    el.style.borderColor = color;
    f(el, 'code').textContent = c.code;
    var t = techTitle(n);
    if (t && t !== n.title) f(el, 'title').textContent = t;
    else f(el, 'title').remove();
    el.title = c.code + ' ' + t;
    return el;
  }

  function catalogUrl(root, family) {
    var base = root.getAttribute('data-kontext-catalog') || V.basePath + '/kompendium/techniques/';
    return base + '?rodina=' + encodeURIComponent(family);
  }

  // --- technika ------------------------------------------------------------------------
  function familyPosition(root, me, code, family, idx) {
    var familyName = (root.getAttribute('data-kontext-family') || '').replace(/^\s*\d+\.\s*/, '');
    var color = familyColor(me.n);
    var pos = tpl(root, 'position');
    f(pos, 'dot').style.background = color;
    f(pos, 'code').textContent = code;
    var fa = f(pos, 'family');
    fa.textContent = me.family;
    fa.setAttribute('href', catalogUrl(root, me.family));
    fa.title = 'Katalog technik rodiny ' + me.family;
    if (familyName) f(pos, 'name').textContent = familyName;
    else f(pos, 'name').remove();
    f(pos, 'count').textContent = plural(family.length, 'technika', 'techniky', 'technik');
    var bar = f(pos, 'bar');
    bar.style.background = color;
    bar.style.width = Math.max(4, ((idx + 1) / Math.max(1, family.length)) * 100) + '%';
    f(pos, 'pos').textContent = idx < 0 ? '' :
      'Pozice ' + nf.format(idx + 1) + ' z ' + nf.format(family.length) + ' podle kódu';
    return pos;
  }

  function neighbours(root, G, me, family, idx) {
    var nb = tpl(root, 'neighbours');
    [
      [idx - 1, '← Předchozí', 'Začátek rodiny ' + me.family],
      [idx + 1, 'Další →', 'Konec rodiny ' + me.family],
    ].forEach(function (s) {
      var m = idx >= 0 ? family[s[0]] : null;
      if (!m) {
        var e = tpl(root, 'edge');
        e.textContent = s[2];
        nb.appendChild(e);
        return;
      }
      var el = link(tpl(root, 'neighbour'), G, m);
      f(el, 'dir').textContent = s[1];
      f(el, 'code').textContent = codeOf(m.path).code;
      f(el, 'title').textContent = techTitle(m);
      el.title = m.title;
      nb.appendChild(el);
    });
    return nb;
  }

  function renderTechnique(root, G, n, body, meta) {
    var me = codeOf(n.path);
    var code = root.getAttribute('data-kontext-code') || me.code;
    var family = G.nodes.filter(function (m) { return isTech(m) && codeOf(m.path).n === me.n; })
      .sort(byCode);
    var idx = family.indexOf(n);

    var cases = uniqueNodes(G, G.in[n.id], caseKind).sort(function (a, b) {
      return (caseKind(a) === 'hist') - (caseKind(b) === 'hist') || byTitle(a, b);
    });
    meta.textContent = plural(cases.length, 'případ', 'případy', 'případů') + ' · ' + code;

    var p1 = panel(root, 'Výskyt v případech', cases.length);
    if (!cases.length) {
      p1.body.appendChild(emptyNote(root, 'Zatím žádný případ na tuto techniku neodkazuje.'));
    } else {
      listWithMore(root, p1.body, cases, SHOW_CASES, function (c) {
        var el = link(tpl(root, 'case'), G, c);
        f(el, 'badge').replaceWith(badge(root, caseKind(c)));
        var used = uniqueNodes(G, G.out[c.id], isTech).length;
        f(el, 'meta').textContent = plural(used, 'technika', 'techniky', 'technik');
        f(el, 'title').textContent = caseTitle(c);
        return el;
      }, function (rest) {
        return 'Zobrazit další ' + plural(rest, 'případ', 'případy', 'případů');
      });
    }

    var p2 = panel(root, 'Sousední techniky v rodině', null);
    p2.body.appendChild(familyPosition(root, me, code, family, idx));
    p2.body.appendChild(neighbours(root, G, me, family, idx));
    var sub = family.filter(function (m) { return m !== n && codeOf(m.path).sub === me.sub; });
    if (sub.length) {
      var label = 'Podskupina ' + me.sub + ' · ' + plural(sub.length, 'další', 'další', 'dalších');
      p2.body.appendChild(subhead(root, label));
      var chips = tpl(root, 'chips');
      listWithMore(root, chips, sub, SHOW_SUB, function (m) { return chip(root, G, m); },
        function (rest) { return '+ ' + nf.format(rest); });
      p2.body.appendChild(chips);
    }

    body.appendChild(p1.el);
    body.appendChild(p2.el);
  }

  // --- případ --------------------------------------------------------------------------
  function similarCases(G, n, techs) {
    var mine = {};
    techs.forEach(function (m) { mine[m.id] = true; });
    var res = [];
    G.nodes.forEach(function (c) {
      if (c === n || !caseKind(c)) return;
      var other = uniqueNodes(G, G.out[c.id], isTech);
      var shared = other.filter(function (m) { return mine[m.id]; }).length;
      if (shared) {
        var union = techs.length + other.length - shared;
        res.push({ n: c, shared: shared, jaccard: shared / union });
      }
    });
    return res.sort(function (a, b) {
      return b.shared - a.shared || b.jaccard - a.jaccard || byTitle(a.n, b.n);
    });
  }

  function renderCase(root, G, n, body, meta) {
    var techs = uniqueNodes(G, G.out[n.id], isTech);
    var groups = {};
    techs.forEach(function (m) {
      var num = codeOf(m.path).n;
      (groups[num] = groups[num] || []).push(m);
    });
    var nums = Object.keys(groups).map(Number).sort(function (a, b) { return a - b; });
    meta.textContent = plural(techs.length, 'technika', 'techniky', 'technik') + ' · ' +
      plural(nums.length, 'rodina', 'rodiny', 'rodin');

    var p1 = panel(root, 'Použité techniky', techs.length);
    if (!techs.length) {
      p1.body.appendChild(emptyNote(root, 'Případ zatím neodkazuje na žádnou techniku.'));
    }
    nums.forEach(function (num) {
      var g = tpl(root, 'group');
      var list = groups[num].sort(byCode);
      f(g, 'dot').style.background = familyColor(num);
      var fa = f(g, 'family');
      fa.textContent = 'Rodina EA-' + num;
      fa.setAttribute('href', catalogUrl(root, 'EA-' + num));
      f(g, 'count').textContent = nf.format(list.length);
      var box = f(g, 'chips');
      list.forEach(function (m) { box.appendChild(chip(root, G, m)); });
      p1.body.appendChild(g);
    });

    var similar = techs.length ? similarCases(G, n, techs) : [];
    var p2 = panel(root, 'Podobné případy', null);
    if (!similar.length) {
      p2.body.appendChild(emptyNote(root,
        'Žádný jiný případ zatím nesdílí s tímto případem techniku.'));
    } else {
      p2.body.className = 'space-y-1';
      similar.slice(0, SHOW_SIMILAR).forEach(function (s) {
        var el = link(tpl(root, 'similar'), G, s.n);
        f(el, 'badge').replaceWith(badge(root, caseKind(s.n)));
        f(el, 'title').textContent = caseTitle(s.n);
        var c = f(el, 'count');
        var word = s.shared === 1 ? 'společná' : s.shared <= 4 ? 'společné' : 'společných';
        c.textContent = nf.format(s.shared) + ' ' + word;
        c.title = plural(s.shared, 'společná technika', 'společné techniky', 'společných technik');
        p2.body.appendChild(el);
      });
    }

    body.appendChild(p1.el);
    body.appendChild(p2.el);
  }

  // --- heslo glosáře -------------------------------------------------------------------
  function sectionNode(G, s) { return G.byPath[s === 'root' ? '_index.md' : s + '/_index.md']; }

  function sectionTitle(G, s) {
    var idx = sectionNode(G, s);
    return idx ? idx.title : V.sectionLabel(s);
  }

  function sectionRow(root, G, s, count, max) {
    var el = tpl(root, 'section');
    var idx = sectionNode(G, s);
    el.setAttribute('href', idx ? G.url(idx) : V.basePath + '/' + s + '/');
    f(el, 'dot').style.background = G.color(s);
    f(el, 'title').textContent = sectionTitle(G, s);
    var c = f(el, 'count');
    c.textContent = nf.format(count);
    c.title = plural(count, 'stránka', 'stránky', 'stránek') + ' z oddílu používá pojem';
    var bar = f(el, 'bar');
    bar.style.background = G.color(s);
    bar.style.width = Math.max(3, (count / max) * 100) + '%';
    return el;
  }

  function pageRow(root, G, m) {
    var el = link(tpl(root, 'page'), G, m);
    var inCount = G.in[m.id].length;
    f(el, 'title').textContent = m.title;
    f(el, 'section').textContent =
      isIndex(m) ? 'Úvodní stránka oddílu' : sectionTitle(G, m.section);
    var c = f(el, 'count');
    c.textContent = nf.format(inCount);
    c.title = plural(inCount, 'stránka odkazuje', 'stránky odkazují', 'stránek odkazuje') + ' sem';
    return el;
  }

  function renderGlossary(root, G, n, body, meta) {
    var users = uniqueNodes(G, G.in[n.id], function (m) { return m !== n; });
    var count = {};
    users.forEach(function (m) { count[m.section] = (count[m.section] || 0) + 1; });
    var sections = Object.keys(count).sort(function (a, b) {
      return count[b] - count[a] || sectionTitle(G, a).localeCompare(sectionTitle(G, b), 'cs');
    });
    meta.textContent = !users.length ? '' :
      plural(users.length, 'stránka', 'stránky', 'stránek') + ' · ' +
      plural(sections.length, 'oddíl', 'oddíly', 'oddílů');

    var p1 = panel(root, 'Kde se pojem používá', sections.length);
    var p2 = panel(root, 'Nejodkazovanější stránky s pojmem', null);
    if (!users.length) {
      p1.body.appendChild(emptyNote(root, 'Na tento pojem zatím žádná stránka neodkazuje.'));
      p2.body.appendChild(emptyNote(root, 'Pojem zatím nepoužívá žádná stránka.'));
    } else {
      var max = count[sections[0]];
      p1.body.className = 'space-y-1';
      listWithMore(root, p1.body, sections, SHOW_SECTIONS,
        function (s) { return sectionRow(root, G, s, count[s], max); },
        function (rest) { return 'Zobrazit další ' + plural(rest, 'oddíl', 'oddíly', 'oddílů'); });
      p2.body.className = 'space-y-1';
      users.slice()
        .sort(function (a, b) { return G.in[b.id].length - G.in[a.id].length || byTitle(a, b); })
        .slice(0, SHOW_TOP)
        .forEach(function (m) { p2.body.appendChild(pageRow(root, G, m)); });
    }
    body.appendChild(p1.el);
    body.appendChild(p2.el);
  }

  var RENDER = { technique: renderTechnique, 'case': renderCase, glossary: renderGlossary };

  function render(root) {
    var body = root.querySelector('[data-kx-body]');
    var meta = root.querySelector('[data-kx-meta]');
    var type = root.getAttribute('data-kontext-type');
    var path = root.getAttribute('data-kontext');
    V.graph().then(function (G) {
      body.innerHTML = '';
      var n = G.byPath[path];
      if (!n) {
        body.appendChild(emptyNote(root,
          'Stránka v grafu chybí; graf se přegeneruje při příštím sestavení.'));
      } else if (!RENDER[type] || (type === 'technique' && !codeOf(n.path))) {
        root.hidden = true;
      } else {
        RENDER[type](root, G, n, body, meta);
      }
      body.removeAttribute('aria-busy');
    }).catch(function (e) {
      body.innerHTML = '';
      body.appendChild(emptyNote(root, 'Kontext se nepodařilo načíst: ' + e.message));
      body.removeAttribute('aria-busy');
    });
  }

  var started = false;
  function init() {
    if (started) return;
    started = true;
    V = window.KompendiumViz;
    var roots = document.querySelectorAll('[data-kontext]');
    if (!roots.length || !V) return;
    roots.forEach(function (r) { r.hidden = false; });
    if (!('IntersectionObserver' in window)) {
      roots.forEach(render);
      return;
    }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) {
          io.unobserve(en.target);
          render(en.target);
        }
      });
    }, { rootMargin: '200px' });
    roots.forEach(function (r) { io.observe(r); });
  }

  // Skripty s defer běží v pořadí dokumentu a kompendium-viz.js je až za tímto,
  // proto se čeká na DOMContentLoaded (přijde po všech odložených skriptech).
  if (document.readyState === 'complete') init();
  else {
    document.addEventListener('DOMContentLoaded', init);
    window.addEventListener('load', init);
  }
})();
