+++
title = "Taxonomie EA"
weight = 60

description = "Hierarchický klasifikační systém technik epistemické anihilace s notací EA-X.Y.Z-α: struktura kódů, primární kategorie, vlastnosti notace a jak s ní pracovat."

[taxonomies]
tags = ["glossary", "kompendium", "ea-taxonomy", "epistemic", "reference"]

[extra]
category = "epistemic"
related_terms = ["epistemicka-anihilace", "kognitivni-anihilace", "taxonomy", "classification"]
acronym = "EA"
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["taxonomie EA", "EA classification", "epistemic annihilation taxonomy", "EA-X.Y.Z notation"]
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Taxonomie EA – glosář"
+++

## Definice

**Taxonomie EA** je hierarchický klasifikační systém technik [epistemické
anihilace](@/glossary/epistemicka-anihilace.md), který používá [Kompendium epistemické
a kognitivní anihilace](@/kompendium/_index.md). Každé technice přiřazuje stálý identifikátor ve
tvaru **`EA-X.Y.Z-α`**, kde:

| Složka | Význam | Příklad |
|-----------|---------|---------|
| **EA** | stálá předpona (epistemická anihilace) | `EA` |
| **X** | primární kategorie | `1` (akademická manipulace) |
| **Y** | podkategorie uvnitř primární kategorie | `1` (narušení získávání informací) |
| **Z** | konkrétní technika v podkategorii | `1` (selektivní expozice) |
| **α** | přípona varianty (nepovinná, malé písmeno) | `a`, `b`, `c` |

Například `EA-1.1.1` je [Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) –
primární kategorie 1 (akademická manipulace), podkategorie 1 (získávání informací), technika 1
(selektivní expozice). Přípona `-a` by označovala zdokumentovanou variantu téže techniky.

Taxonomie je klasifikací pro *rozpoznání*: kód pojmenovává vzorec, aby ho kliničtí pracovníci,
vyšetřovatelé a výzkumníci mohli jednoznačně identifikovat, odlišit a propojit s detekcí,
obranou a zotavením. Není to katalog postupů k použití (viz [1.3 Etické aspekty
a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md)).

## Původ a kontext pojmu

Původní verze hesla uváděla osm primárních kategorií, které odpovídají kapitolám knihy:

1. **Akademické techniky intelektuální manipulace** (kapitola [3.1](@/kompendium/03-zakladni-kategorie/kapitola-1.md));
2. **Scénáře epistemické [delegitimizace](@/glossary/delegitimizace.md)** (kapitola [3.2](@/kompendium/03-zakladni-kategorie/kapitola-2.md));
3. **Pokročilá [edukativní implementace](@/glossary/edukativni-implementace.md)** – konstruktivní protějšek (kapitola
   [3.3](@/kompendium/03-zakladni-kategorie/kapitola-3.md));
4. **Terminální protokoly** – pokročilé destruktivní sekvence, popsané strukturně pro rozpoznání
   ([04. Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md));
5. **Ultramární techniky fundamentální dekonstrukce** – v době zápisu plánováno 150 technik
   ([05. Ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md));
6. **Klinické aplikace** – diagnostické a terapeutické rámce ([06. Klinické
   aplikace](@/kompendium/06-klinicke-aplikace/_index.md));
7. **Teoretické reflexe** – filosofické a interdisciplinární ([7. Teoretické
   reflexe](@/kompendium/07-teoreticke-reflexe/_index.md));
8. **Přílohy** – hlavní rejstřík, případové studie, glosář ([08. Přílohy](@/kompendium/08-prilohy/_index.md)).

V současném rejstříku technik ([Techniky](@/kompendium/techniques/_index.md) a [Kompletní
rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md)) se kódy EA-6.x používají pro
klinické protokoly, EA-7.x pro teoretické rozbory (např. [EA-7.1.1 Foucault:
Power/Knowledge](@/kompendium/techniques/ea-7-1-1-foucault-power-knowledge.md)), EA-8.x pro
model BITE a základní literaturu a nově přibyla rodina **EA-9.x** pro digitální a algoritmické
jevy (např. [EA-9.1.1 LLM Hallucination
Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)). Číslování
primárních kategorií tak není totožné s číslováním kapitol a čtenář má vycházet z rejstříku.

## Jak se projevuje

Taxonomie se v knize projevuje jako jednotný systém odkazů:

- každá stránka techniky nese svůj kód v názvu a v adrese;
- [rychlé referenční karty](@/kompendium/quick-reference/_index.md) mají tvar `qr-ea-X-Y-Z`;
- kazuistiky, detekční signatury a protokoly zotavení odkazují na kódy technik, které popisují;
- [index pojmů](@/kompendium/08-prilohy/index-pojmu.md) a [klasifikační
  schéma](@/kompendium/08-prilohy/klasifikace.md) vysvětlují metaúroveň.

## Mechanismus

Notace je navržena s pěti inženýrskými vlastnostmi, které jsou důležité pro dlouhodobou odbornou
práci:

| Vlastnost | Zdůvodnění |
|----------|-----------|
| **Stabilita** | kód EA se nemění, ani když se změní adresy stránek |
| **Hierarchická čitelnost** | čtenář z kódu vyčte kategorii i podkategorii |
| **Rozšiřitelnost o varianty** | přípona `-α` umožňuje označit variantu bez přestavby |
| **Strojová indexovatelnost** | snadné zpracování pro automatickou analýzu, bibliografické systémy a strojové učení |
| **Auditovatelnost** | jednoznačný odkaz v mezioborové diskusi |

V Prismatic Platform slouží kódy EA jako **plnohodnotné křížové odkazy**:

- [rozcestník Kompendia](@/kompendium/_index.md) a [rejstřík technik](@/kompendium/techniques/_index.md)
  je používají jako kanonické kotvy;
- kalibrační logika [Decision Engine](@/glossary/decision-engine.md) na kódy EA odkazuje, když
  ve vstupních zdrojích označuje ukazatele epistemické manipulace;
- hesla [glosáře](@/glossary/_index.md) odkazují přímo na příslušné kódy EA;
- budoucí automatizace (RAG nad Kompendiem, strukturované strojové učení) má kódy EA používat
  jako hlavní indexační klíč.

Taxonomie se řídí **disciplínou sémantického verzování**: opravné překlasifikace zvyšují
opravnou verzi, přidání nových technik vedlejší verzi a zásadní přestavba systému kódů hlavní
verzi. V době zápisu původního hesla byla aktuální verze **v0.1.0** – první zveřejnění, taxonomie
v aktivním rozšiřování.

## Odlišení

- **Od diagnostických klasifikací (MKN, DSM)** – taxonomie EA neklasifikuje poruchy ani
  osoby, ale vzorce působení; kód techniky není diagnóza a nemá se tak používat.
- **Od [modelu BITE](@/glossary/bite-model.md)** – BITE třídí oblasti kontroly (chování,
  informace, myšlení, emoce); taxonomie EA třídí konkrétní epistemické vzorce a je s BITE
  propojena v rodině EA-8.x.
- **Od obecných katalogů logických klamů** – taxonomie zahrnuje i dlouhodobé, institucionální
  a somatické vzorce, které nejsou chybou argumentu.

## Význam pro Kompendium

Taxonomie je páteří knihy: umožňuje propojit popis fenoménu s detekcí ([detekční
signatury](@/kompendium/detection-signatures/_index.md)), klinickým rámcem, kazuistikami
a protokoly zotavení. Kritické kapitoly upozorňují na její meze – riziko esencialismu
([Esencialistický klam v EA
kategoriích](@/kompendium/critical-perspectives/9-essentialism-critique.md)), přílišného rozšíření
([Framework overreach](@/kompendium/critical-perspectives/3-framework-overreach.md)) a stigmatizace.

## Obrana a zotavení

Pro dotčeného může mít pojmenování vzorce samo o sobě úlevný a orientační účinek („to, co se
dělo, má jméno a je popsané“). Kód ale nemá nahradit vlastní vyprávění – v zotavení je důležité,
aby člověk svou zkušenost formuloval sám a taxonomii používal jako pomůcku, ne jako nový rámec,
do něhož se musí vejít (srov. [narativní identita](@/glossary/narativni-identita.md)).

## Související

**Pojmy**

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – klasifikovaný fenomén.
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) – příbuzný, ale odlišný fenomén.
- [Kompendium EA](@/glossary/kompendium-ea.md) – úplná taxonomická reference.

**Kniha**

- [Rozcestník Kompendia](@/kompendium/_index.md) – úplná taxonomická reference.
- [Rejstřík technik](@/kompendium/techniques/_index.md) – rozbory technik podle kódu EA.
- [Kompletní rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) – hlavní index.
- [Klasifikační schéma a taxonomie – metaúroveň](@/kompendium/08-prilohy/klasifikace.md) –
  principy třídění.
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) –
  metodologie.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: taxonomie-ea](@/kompendium/glossary-bridges/bridge-taxonomie-ea.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
