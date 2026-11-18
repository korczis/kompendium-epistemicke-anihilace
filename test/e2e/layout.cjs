// Shared layout assertions of test/e2e/surfaces.cjs and scripts/audit-ui.cjs (one definition, so
// the two gates cannot disagree about what "aligned" or "overflows" means).
//
// The page scrolls inside #main-content (the Pro admin shell), not only in the document, so a
// sideways overflow is measured in both: document.documentElement and #main-content.
//
// One left edge (templates/macros/layout.html): the page title (the header's H1) starts where the
// first paragraph of the text does, or, on a page without text, where the content of the first
// card does (its left edge plus its padding; a flush card's first padded block). Measured from
// 1440 px up, where the sidebar is fixed and the edge is a single number per page.
'use strict';

const ALIGN_MIN_WIDTH = 1440;
const ALIGN_TOLERANCE = 1;  // px: sub-pixel rounding only

async function measureLayout(page) {
  return page.evaluate(() => {
    const visible = (el) => !!el && el.getClientRects().length > 0 && getComputedStyle(el).visibility !== 'hidden';
    const main = document.getElementById('main-content');
    const out = {
      overflow: document.documentElement.scrollWidth - window.innerWidth,
      mainOverflow: main ? main.scrollWidth - main.clientWidth : 0,
      kind: (document.querySelector('[data-page-kind]') || { dataset: {} }).dataset.pageKind || '',
      h1: null, edge: null, edgeOf: '',
    };
    const h1 = [...document.querySelectorAll('#main h1')].filter(visible)[0];
    if (h1) out.h1 = Math.round(h1.getBoundingClientRect().left * 10) / 10;
    const body = document.querySelector('[data-page-body]');
    if (!body) return out;
    const inRail = (el) => !!el.closest('aside');
    const para = [...body.querySelectorAll('.format > p')].filter((p) => visible(p) && !inRail(p))[0];
    if (para) {
      out.edge = Math.round(para.getBoundingClientRect().left * 10) / 10;
      out.edgeOf = 'první odstavec textu';
      return out;
    }
    const padded = (el) => parseFloat(getComputedStyle(el).paddingLeft) > 0;
    const card = [...body.querySelectorAll('[data-card]')].filter((c) => visible(c) && !inRail(c))[0];
    if (!card) return out;
    const box = padded(card) ? card : [...card.children].filter((c) => visible(c) && padded(c))[0];
    if (!box) return out;
    out.edge = Math.round((box.getBoundingClientRect().left + parseFloat(getComputedStyle(box).paddingLeft)) * 10) / 10;
    out.edgeOf = 'obsah první karty';
    return out;
  });
}

// Findings (Czech, like the gates' other messages) for one measurement at one viewport width.
function layoutFindings(m, width) {
  const f = [];
  if (m.overflow > 0) f.push(`vodorovné přetečení ${m.overflow} px`);
  if (m.mainOverflow > 0) f.push(`vodorovné přetečení #main-content ${m.mainOverflow} px`);
  if (width >= ALIGN_MIN_WIDTH) {
    if (m.h1 === null) f.push('stránka nemá viditelný nadpis H1 v hlavičce');
    else if (m.edge === null) f.push('stránka nemá text ani kartu, se kterou by se nadpis zarovnal');
    else if (Math.abs(m.h1 - m.edge) > ALIGN_TOLERANCE) {
      f.push(`levý okraj nadpisu ${m.h1} px ≠ ${m.edgeOf} ${m.edge} px (druh stránky ${m.kind || '?'})`);
    }
  }
  return f;
}

module.exports = { measureLayout, layoutFindings, ALIGN_MIN_WIDTH };
