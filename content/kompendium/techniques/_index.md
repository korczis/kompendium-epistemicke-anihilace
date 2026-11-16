+++
title = "Techniques — detailní per-technique články"
description = "Hloubkové samostatné články pro jednotlivé techniky epistemické anihilace."
weight = 100
sort_by = "weight"
template = "section.html"

[extra]
tags = ["kompendium", "techniques", "detailni-clanky", "manipulace", "epistemic-security"]
categories = ["academic", "reference"]
section_icon = "🔍"
toc = true
insert_anchor_links = "right"
+++

# Techniques — detailní per-technique články

Každá zaznamenaná technika v kompendiu má **samostatný hloubkový článek** s rozšířenou deskripcí, fenomenologií, detekčními markery, neutralizačními strategiemi a případovými studiemi. Jak se kniha čte jako celek a kam z této knihovny vést další krok, popisuje [průvodce knihou](@/kompendium/01-predmluva/jak-pouzivat.md).

## Šablona článku

Všechny technique-články dodržují stejnou strukturu:

| Sekce | Obsah |
|-------|-------|
| **Identifikace** | EA kód, kategorie, přístupová úroveň |
| **Definice** | Stručné vymezení techniky |
| **Struktura vzorce** | Mechanismus, jak technika funguje |
| **Fenomenologické znaky** | Co prožívá subjekt techniky |
| **Detekční markery** | Co pozoruje pozorovatel zvenčí |
| **Rizikové kontexty** | Kde se technika typicky vyskytuje |
| **Neutralizační strategie** | Individuální a institucionální obrana |
| **Případové studie** | Anonymizované příklady |
| **Vztah k jiným technikám** | Konjunkce, eskalační řetězce, alternativy |
| **Reference do kompendia** | Cross-link do hlavní kapitoly |

## Index technik

{% set cat = load_data(path="static/data/listings/techniques.json") %}Každý kód má tvar `EA-X.Y.Z` a čte se zleva doprava: první číslo určuje kapitolu taxonomie, druhé rodinu uvnitř kapitoly a třetí konkrétní fenomén; písmeno připojené za kód odlišuje variantu téhož fenoménu. Kód je stabilní identifikátor, který se po přidělení nemění, a když se dvě stránky ukázaly pod jedním kódem, dostala jedna z nich nový kód a stará adresa na ni přesměrovává. Pravidla přidělování kódů a výklad notace podává [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md), metodická východiska celé taxonomie shrnují [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

Index níže uvádí {{ cat.entries | length }} technik v {{ cat.groups | length }} rodinách a {{ cat.parents | length }} kapitolách. Žádný jeho řádek se nepíše ručně: kód, název a jednovětý popis přebírá ze záhlaví stránky, na kterou vede, takže řádek nemůže pojmenovat jinou techniku, než jakou stránka pod svým kódem popisuje. Rodina, kterou kniha dosud nikde nepojmenovala, je uvedena jen kódem, protože se název nedomýšlí. Názvy kapitol a rodin mají v knize jediný zdroj, z něhož čte tento index, [rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) i tabulky kapitol, takže se jeden název nemůže na dvou místech lišit. Každá stránka techniky má stavbu popsanou výše v šabloně článku a slouží k rozpoznání, odlišení a obraně, nikdy jako návod k provedení; hranice studia a použití vymezuje [etický kodex](@/kompendium/08-prilohy/eticky-kodex.md).

{% for ch, fams in cat.parents %}{% set chname = cat.parent_names[ch] | default(value="") %}

### Kapitola {{ ch }}{% if chname %} — {{ chname }}{% endif %}

{% for f in fams %}{% set fname = cat.group_names[f] | default(value="") %}

#### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| EA | Technika | Shrnutí |
|----|----------|---------|
{% for t in cat.groups[f] %}| **[{{ t.code }}](@/kompendium/techniques/{{ t.slug }}.md)** | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}{% endfor %}

## Doplňkové podknihovny

| Sekce | Obsah | URL |
|-------|-------|-----|
| **Case Studies** | Anonymizované klinické a forenzní kazuistiky | [/kompendium/case-studies/](@/kompendium/case-studies/_index.md) |
| **Quick Reference** | Stručné karty pro rozpoznání techniky | [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md) |
| **Glossary Bridges** | Můstky mezi kompendiem a glosářem | [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md) |
| **Section Bridges** | Můstky mezi sekcemi kompendia | [/kompendium/section-bridges/](@/kompendium/section-bridges/_index.md) |
| **Recovery Protocols** | Strukturované postupy zotavení | [/kompendium/recovery-protocols/](@/kompendium/recovery-protocols/_index.md) |
| **Emergency Protocols** | Akutní intervenční postupy | [/kompendium/emergency-protocols/](@/kompendium/emergency-protocols/_index.md) |
| **Cross-Domain** | Aplikace v dalších oborech (OSINT, [due diligence](@/glossary/due-diligence.md), HR, právo) | [/kompendium/cross-domain/](@/kompendium/cross-domain/_index.md) |
| **Educational Scenarios** | Výukové scénáře | [/kompendium/educational-scenarios/](@/kompendium/educational-scenarios/_index.md) |
| **Historical Cases** | Historické případové studie | [/kompendium/historical-cases/](@/kompendium/historical-cases/_index.md) |
| **Detection Signatures** | Strojově čitelné detekční signatury | [/kompendium/detection-signatures/](@/kompendium/detection-signatures/_index.md) |
| **Vizualizace** | Interaktivní vizualizace | [/kompendium/visualizations/](@/kompendium/visualizations/_index.md) |

## Související

- [Hub kompendia](@/kompendium/_index.md)
- [Sekce 02 — Úvod do epistemické anihilace](@/kompendium/02-uvod/_index.md)
- [Sekce 03 — Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md)
- [Sekce 04 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- [Sekce 05 — Ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md)
- [Kapitola 6 — Epistemická singularita](@/kompendium/05-ultramari-techniky/kapitola-6.md)
- [Kapitola 7 — Metatranscendentální anihilace](@/kompendium/05-ultramari-techniky/kapitola-7.md)
- [Kapitola 8 — Hypertransformativní protokoly](@/kompendium/05-ultramari-techniky/kapitola-8.md)
- [Kapitola 9 — Paradoxální metaanihilační protokoly](@/kompendium/05-ultramari-techniky/kapitola-9.md)
- [Kapitola 10 — Transkonceptuální mechanismy](@/kompendium/05-ultramari-techniky/kapitola-10.md)
- [Sekce 06 — Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
- [Sekce 07 — Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md)
- [Sekce 08 — Přílohy](@/kompendium/08-prilohy/_index.md)
- [Case Studies](@/kompendium/case-studies/_index.md) — anonymizované kazuistiky
- [Quick Reference](@/kompendium/quick-reference/_index.md) — karty pro rozpoznání techniky
- [Glossary Bridges](@/kompendium/glossary-bridges/_index.md) — můstky mezi kompendiem a glosářem
- [Vizualizace](@/kompendium/visualizations/_index.md) — interaktivní vizualizace
- [Glossary: Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
- [Glossary: Taxonomie EA](@/glossary/taxonomie-ea.md)
- [Glossary](@/glossary/_index.md)

## ⚡ Kritický krok

**Než si techniku nastuduješ** (i pro účely diagnostiky) ověř:

- Tvoje **přístupová úroveň** odpovídá `access_level` v záhlaví článku
  (L1 = volný přístup, L2 = doložená kvalifikace, L3 = omezený doktrinální
  rámec)
- Máš [supervizní rámec](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)
  pro úroveň této techniky
- Pokud diagnostikuješ na sobě, použij
  [diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md)
  a konzultuj výsledek se supervizí

> **Mandatorní akce**: bez ověření přístupové úrovně a supervize necti
> tuto techniku jako instrumentum — pouze jako fenomenologický popis.
