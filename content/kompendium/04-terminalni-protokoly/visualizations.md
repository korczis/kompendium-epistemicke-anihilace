+++
title = "Vizualizace pro Sekci 04 — Rozhodovací strom terminálních protokolů"
description = "Interaktivní rozhodovací strom pro identifikaci terminálních protokolů: detekce → eskalační úroveň → typ intervence, čtyři úrovně hloubky, barevné kódování podle rizika."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "p5js", "terminalni-protokoly", "rozhodovaci-strom"]
categories = ["academic", "tools"]

[extra]
parent = "kompendium-04-terminalni-protokoly"
section_icon = "🌳"
toc = false
+++

# Rozhodovací strom terminálních protokolů

Tato sekce-specifická vizualizace operacionalizuje [pre-simulační screening](/kompendium/04-terminalni-protokoly/pred-simulacni-screening/) a [intra-simulační monitoring](/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring/) jako **radiální rozhodovací strom**:

- **Úroveň 1 — Detekce**: Byly detekovány signály terminálních protokolů? (ano / ne / nejasné)
- **Úroveň 2 — Eskalační úroveň**: Jak hluboká je manifestace? (mírná / střední / těžká / extrémní)
- **Úroveň 3 — Typ protokolu**: Který terminální protokol dominuje? (konceptuální dekonstrukce / identitní dekonstrukce / institucionální anihilace / ultimátní scénář)
- **Úroveň 4 — Typ intervence**: Jaká odpověď je indikována? (monitoring / kontejnment / kontrolovaná rekonstituce / tvrdá zastávka)

Listy stromu jsou **barevně kódované** podle úrovně rizika a klikatelné pro detail.

<div id="section-04-decision-tree" class="rounded bg-slate-900"></div>
<div id="tree-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="https://cdn.jsdelivr.net/npm/p5@1.9.0/lib/p5.min.js"></script>
<script src="/js/kompendium/section-04-decision-tree.js"></script>

## Jak číst strom

- **Kořen** uprostřed = aktuální posuzovaný případ.
- **Větve** se rozvíjejí ve čtyřech soustředných úrovních.
- **Klik na uzel** = zobrazení popisu rozhodovacího kritéria a odkazu na relevantní protokol.
- **Barvy**: zelená (bezpečné), žlutá (sledovat), oranžová (intervenovat), červená (kritická akce).

## Související

- [4.1 Pre-simulační screening](/kompendium/04-terminalni-protokoly/pred-simulacni-screening/)
- [4.2 Intra-simulační monitoring](/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring/)
- [Konceptuální dekonstrukce](/kompendium/04-terminalni-protokoly/konceptualni-dekonstrukce/)
- [Identitní dekonstrukce](/kompendium/04-terminalni-protokoly/identitni-dekonstrukce/)
- [Institucionální anihilace](/kompendium/04-terminalni-protokoly/institucionalni-anihilace/)
- [Kontrolovaná rekonstituce](/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce/)
- [Ultimátní scénář](/kompendium/04-terminalni-protokoly/ultimatni-scenar/)
- [Globální vizualizace EA taxonomie](/kompendium/visualizations/)
- [Glossary: Taxonomie EA](/glossary/taxonomie-ea/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
