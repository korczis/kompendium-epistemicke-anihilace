// Živý řádek souhrnné karty techniky (partials/technique-hero.html): kolik případů na techniku
// odkazuje, spočtené z grafu odkazů (data/graph.json, KompendiumViz.graph()) stejným pravidlem
// jako panel „Výskyt v případech“ (kontext.js), a kolik stránek odkazuje sem (page.backlinks
// ze sestavení, stejné číslo jako oddíl „Odkazují sem“). Graf se načte, až je karta v okně.
// Karta je úplná i bez JavaScriptu; tento skript jen doplňuje řádek a skok na výskyt.
// Třídy Tailwindu jsou jen v šabloně.
(function () {
  'use strict';

  var CASE_SECTIONS = { 'kompendium/case-studies': true, 'kompendium/historical-cases': true };
  var nf = new Intl.NumberFormat('cs-CZ');

  function isIndex(n) { return /(^|\/)_index(\.[a-z]+)?\.md$/.test(n.path); }

  // „v 1 případu“, „ve 2 případech“, „v 5 případech“.
  function inCases(n) {
    if (n === 0) return 'Zatím se nevyskytuje v žádném případu';
    var prep = n >= 2 && n <= 4 ? 've ' : 'v ';
    return 'Vyskytuje se ' + prep + nf.format(n) + (n === 1 ? ' případu' : ' případech');
  }

  function linkedHere(n) {
    if (n === 0) return 'zatím sem nic neodkazuje';
    if (n === 1) return 'odkazuje sem 1 stránka';
    if (n >= 2 && n <= 4) return 'odkazují sem ' + nf.format(n) + ' stránky';
    return 'odkazuje sem ' + nf.format(n) + ' stránek';
  }

  function render(root, V) {
    var path = root.getAttribute('data-technika');
    var backlinks = +root.getAttribute('data-technika-backlinks') || 0;
    var live = root.querySelector('[data-hx-live]');
    var text = root.querySelector('[data-hx-live-text]');
    var jump = root.querySelector('[data-hx-jump-kontext]');
    var kontext = document.querySelector('[data-kontext]');
    V.graph().then(function (G) {
      var n = G.byPath[path];
      if (!n) return;
      var seen = {};
      var cases = 0;
      G.in[n.id].forEach(function (id) {
        var m = G.byId[id];
        if (seen[id] || !m || isIndex(m) || !CASE_SECTIONS[m.section]) return;
        seen[id] = true;
        cases++;
      });
      text.textContent = inCases(cases) + ' · ' + linkedHere(backlinks);
      live.classList.remove('invisible');  // řádek má místo od začátku: nic se neposune
      // kontext.js panel skryje, když stránka v grafu nemá kód; skok pak nemá kam vést.
      var link = live.querySelector('a[href="#kontext-title"]');
      if (link && (!kontext || kontext.hidden || !cases)) link.hidden = true;
      if (jump && (!kontext || kontext.hidden)) jump.hidden = true;
    }).catch(function () { /* karta zůstává bez živého řádku */ });
  }

  var started = false;
  function init() {
    if (started) return;
    started = true;
    var V = window.KompendiumViz;
    var root = document.querySelector('[data-technika]');
    if (!root || !V) return;
    var num = +root.getAttribute('data-technika-color') || 1;
    var len = V.PALETTE.length;
    var color = V.PALETTE[((num - 1) % len + len) % len];
    root.querySelectorAll('[data-hx-dot]').forEach(function (d) { d.style.background = color; });
    var bar = root.querySelector('[data-hx-bar]');
    if (bar) bar.style.background = color;
    var jump = root.querySelector('[data-hx-jump-kontext]');
    if (jump && document.querySelector('[data-kontext]')) jump.hidden = false;
    if (!('IntersectionObserver' in window)) { render(root, V); return; }
    var io = new IntersectionObserver(function (entries) {
      if (entries.some(function (en) { return en.isIntersecting; })) {
        io.disconnect();
        render(root, V);
      }
    }, { rootMargin: '200px' });
    io.observe(root);
  }

  // Skripty s defer běží v pořadí dokumentu a kompendium-viz.js je až za tímto,
  // proto se čeká na DOMContentLoaded (přijde po všech odložených skriptech).
  if (document.readyState === 'complete') init();
  else {
    document.addEventListener('DOMContentLoaded', init);
    window.addEventListener('load', init);
  }
})();
