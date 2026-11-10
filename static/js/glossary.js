// Glossary toolbar: instant filter, category facets, A–Z letters. It only shows and hides the
// server-rendered term cards, so every term stays a plain link without JavaScript. The state
// lives in the URL (?q=…&kategorie=…), so a filtered view can be shared.
(function () {
  'use strict';

  var list = document.querySelector('[data-glossary-list]');
  if (!list) return;

  var input = document.querySelector('[data-glossary-filter]');
  var count = document.querySelector('[data-glossary-count]');
  var empty = document.querySelector('[data-glossary-empty]');
  var catButtons = Array.prototype.slice.call(document.querySelectorAll('[data-glossary-cat]'));
  var letters = Array.prototype.slice.call(document.querySelectorAll('[data-glossary-letter]'));
  var groups = Array.prototype.slice.call(list.querySelectorAll('[data-glossary-group]'));
  var terms = Array.prototype.slice.call(list.querySelectorAll('[data-glossary-term]'));

  function fold(s) {
    return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
  }

  terms.forEach(function (t) { t._hay = fold(t.getAttribute('data-hay')); });

  var params = new URLSearchParams(window.location.search);
  var state = { q: params.get('q') || '', cat: params.get('kategorie') || '' };

  function plural(n) {
    if (n === 1) return '1 pojem';
    if (n >= 2 && n <= 4) return n + ' pojmy';
    return n + ' pojmů';
  }

  function apply() {
    var words = fold(state.q).split(/\s+/).filter(Boolean);
    var shown = 0;
    terms.forEach(function (t) {
      var ok = (!state.cat || t.getAttribute('data-category') === state.cat) &&
        words.every(function (w) { return t._hay.indexOf(w) !== -1; });
      t.classList.toggle('hidden', !ok);
      if (ok) shown += 1;
    });
    var live = {};
    groups.forEach(function (g) {
      var any = g.querySelector('[data-glossary-term]:not(.hidden)') !== null;
      g.classList.toggle('hidden', !any);
      if (any) live[g.getAttribute('data-glossary-group')] = true;
    });
    letters.forEach(function (a) {
      var on = !!live[a.getAttribute('data-glossary-letter')];
      a.classList.toggle('opacity-30', !on);
      a.classList.toggle('pointer-events-none', !on);
      a.setAttribute('aria-disabled', on ? 'false' : 'true');
    });
    catButtons.forEach(function (b) {
      b.setAttribute('aria-pressed', b.getAttribute('data-glossary-cat') === state.cat ? 'true' : 'false');
    });
    if (count) count.textContent = plural(shown) + (shown !== terms.length ? ' z ' + terms.length : '');
    if (empty) empty.classList.toggle('hidden', shown !== 0);

    var url = new URL(window.location.href);
    if (state.q) url.searchParams.set('q', state.q); else url.searchParams.delete('q');
    if (state.cat) url.searchParams.set('kategorie', state.cat); else url.searchParams.delete('kategorie');
    window.history.replaceState(null, '', url);
  }

  if (input) {
    input.value = state.q;
    var timer = null;
    input.addEventListener('input', function () {
      clearTimeout(timer);
      timer = setTimeout(function () { state.q = input.value; apply(); }, 80);
    });
    document.addEventListener('keydown', function (e) {
      var tag = (document.activeElement && document.activeElement.tagName) || '';
      if (e.key === '/' && tag !== 'INPUT' && tag !== 'TEXTAREA') {
        e.preventDefault();
        input.focus();
      } else if (e.key === 'Escape' && document.activeElement === input) {
        input.value = '';
        state.q = '';
        apply();
      }
    });
  }

  catButtons.forEach(function (b) {
    b.addEventListener('click', function () {
      var c = b.getAttribute('data-glossary-cat');
      state.cat = state.cat === c ? '' : c;
      apply();
    });
  });

  apply();
})();
