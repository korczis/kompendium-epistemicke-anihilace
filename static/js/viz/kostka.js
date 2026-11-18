// Interaktivita komponent vrstvy_anihilace a model_eskalace (templates/components.html).
// Bez JavaScriptu zůstávají vidět všechny panely; se skriptem je vidět vždy jeden vybraný.
// Výběr se zrcadlí do adresy (?vrstva=, ?krok=; dřívější odkaz s kotvou #<id> platí dál), takže
// odkaz otevře týž stav. Záložky modelu eskalace mají roving tabindex (WAI-ARIA Tabs): do
// seznamu vede jedna zastávka Tab, šipky, Home a End vybírají.
(function () {
  'use strict';

  var L = window.KompendiumVrstva;

  function selectable(root, itemSel, panelSel, attr, panelAttr, param, onSelect) {
    var items = Array.prototype.slice.call(root.querySelectorAll(itemSel));
    var panels = Array.prototype.slice.call(root.querySelectorAll(panelSel));
    if (!items.length || !panels.length) return;

    var tabs = items[0].getAttribute('role') === 'tab';

    // user: a choice of the reader (written to the address); the initial selection is not.
    function select(id, focus, user) {
      items.forEach(function (it) {
        var on = it.getAttribute(attr) === id;
        it.setAttribute(tabs ? 'aria-selected' : 'aria-pressed', on ? 'true' : 'false');
        if (tabs) it.setAttribute('tabindex', on ? '0' : '-1');
        it.classList.toggle('is-active', on);
        if (on && focus) it.focus();
      });
      panels.forEach(function (p) { p.hidden = p.getAttribute(panelAttr) !== id; });
      if (user) {
        var v = {};
        v[param] = id === items[0].getAttribute(attr) ? '' : id;
        L.urlState.set(v);
      }
      if (onSelect) onSelect(id);
    }

    items.forEach(function (it, i) {
      it.addEventListener('click', function () { select(it.getAttribute(attr), false, true); });
      it.addEventListener('mouseenter', function () { if (root.hasAttribute('data-hover')) select(it.getAttribute(attr)); });
      it.addEventListener('keydown', function (e) {
        var next = null;
        if (e.key === 'ArrowRight' || e.key === 'ArrowDown') next = items[(i + 1) % items.length];
        if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') next = items[(i - 1 + items.length) % items.length];
        if (e.key === 'Home') next = items[0];
        if (e.key === 'End') next = items[items.length - 1];
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); select(it.getAttribute(attr), false, true); }
        if (next) { e.preventDefault(); select(next.getAttribute(attr), true, true); }
      });
    });
    var wanted = L.urlState.get().get(param) || window.location.hash.replace('#', '');
    var initial = items.filter(function (it) { return it.getAttribute(attr) === wanted; })[0] || items[0];
    select(initial.getAttribute(attr));
  }

  document.querySelectorAll('[data-vrstvy]').forEach(function (root) {
    root.setAttribute('data-hover', '');
    selectable(root, '[data-vrstva]', '[data-vrstva-panel]', 'data-vrstva', 'data-vrstva-panel', 'vrstva');
  });

  document.querySelectorAll('[data-eskalace]').forEach(function (root) {
    var order = Array.prototype.map.call(root.querySelectorAll('[data-krok]'), function (b) { return b.getAttribute('data-krok'); });
    selectable(root, '[data-krok]', '[data-krok-panel]', 'data-krok', 'data-krok-panel', 'krok', function (id) {
      var reached = order.indexOf(id);
      root.querySelectorAll('[data-krok]').forEach(function (b, i) {
        var dot = b.querySelector('.kea-step-dot');
        if (!dot) return;
        dot.classList.toggle('bg-primary-700', i <= reached);
        dot.classList.toggle('text-white', i <= reached);
        dot.classList.toggle('dark:bg-primary-600', i <= reached);
        dot.classList.toggle('bg-gray-100', i > reached);
        dot.classList.toggle('text-gray-700', i > reached);
        dot.classList.toggle('dark:bg-gray-700', i > reached);
      });
    });
  });
})();
