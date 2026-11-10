// Interaktivita komponent vrstvy_anihilace a model_eskalace (templates/components.html).
// Bez JavaScriptu zůstávají vidět všechny panely; se skriptem je vidět vždy jeden vybraný.
(function () {
  'use strict';

  function selectable(root, itemSel, panelSel, attr, panelAttr, onSelect) {
    var items = Array.prototype.slice.call(root.querySelectorAll(itemSel));
    var panels = Array.prototype.slice.call(root.querySelectorAll(panelSel));
    if (!items.length || !panels.length) return;

    function select(id, focus) {
      items.forEach(function (it) {
        var on = it.getAttribute(attr) === id;
        it.setAttribute('aria-selected', on ? 'true' : 'false');
        it.classList.toggle('is-active', on);
        if (on && focus) it.focus();
      });
      panels.forEach(function (p) { p.hidden = p.getAttribute(panelAttr) !== id; });
      if (onSelect) onSelect(id);
    }

    items.forEach(function (it, i) {
      it.addEventListener('click', function () { select(it.getAttribute(attr)); });
      it.addEventListener('mouseenter', function () { if (root.hasAttribute('data-hover')) select(it.getAttribute(attr)); });
      it.addEventListener('keydown', function (e) {
        var next = null;
        if (e.key === 'ArrowRight' || e.key === 'ArrowDown') next = items[(i + 1) % items.length];
        if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') next = items[(i - 1 + items.length) % items.length];
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); select(it.getAttribute(attr)); }
        if (next) { e.preventDefault(); select(next.getAttribute(attr), true); }
      });
    });
    var hash = window.location.hash.replace('#', '');
    var initial = items.filter(function (it) { return it.getAttribute(attr) === hash; })[0] || items[0];
    select(initial.getAttribute(attr));
  }

  document.querySelectorAll('[data-vrstvy]').forEach(function (root) {
    root.setAttribute('data-hover', '');
    selectable(root, '[data-vrstva]', '[data-vrstva-panel]', 'data-vrstva', 'data-vrstva-panel');
  });

  document.querySelectorAll('[data-eskalace]').forEach(function (root) {
    var order = Array.prototype.map.call(root.querySelectorAll('[data-krok]'), function (b) { return b.getAttribute('data-krok'); });
    selectable(root, '[data-krok]', '[data-krok-panel]', 'data-krok', 'data-krok-panel', function (id) {
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
