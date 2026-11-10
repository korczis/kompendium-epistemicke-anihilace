+++
title = "EA-2.1.6 Funding Attack"
description = "Delegitimizační technika — Funding Attack."
weight = 2106

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-1-6", "delegitimizace"]
categories = ["academic"]

[extra]
related_terms = ["ea-2-1-4-publikacni-blokace", "ea-2-1-5-citation-suppression", "ea-2-1-7-institucionalni-vyloucenni", "ea-2-1-8-reputation-laundering-inverze"]
parent = "kompendium-techniques"
ea_code = "EA-2.1.6"
ea_category = "2. Scénáře delegitimizace"
ea_subcategory = "2.1 Expertní diskvalifikace"
section_icon = "🎓"
toc = true
access_level = "L2"
risk_level = "high"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-2/"
+++

# EA-2.1.6 Funding Attack

## Identifikace

| Atribut | Hodnota |
|---------|---------|
| **EA kód** | EA-2.1.6 |
| **Název** | Funding Attack |
| **Kategorie** | 2. Scénáře [delegitimizace](@/glossary/delegitimizace.md) |
| **Subkategorie** | 2.1 Expertní diskvalifikace |
| **Risk level** | High |
| **Access level** | L2 |
| **Parent chapter** | [Kapitola 2](@/kompendium/03-zakladni-kategorie/kapitola-2.md) |

## Definice

Útok na grantové a finanční zdroje experta skrze ovlivnění grantových komisí, sponsorů či výzkumných agentur.

Tato technika představuje konkrétní operacionalizaci širšího vzorce **Expertní diskvalifikace** v rámci taxonomie **EA — Epistemic Attack**. Cílem není pouze útok na jednotlivý výrok či pozici, ale **systematická eroze legitimity** cíle, jeho hlasu a jeho institucionální váhy.

## Operační modus

Technika **EA-2.1.6** typicky probíhá ve třech fázích:

### Fáze 1 — Příprava terénu

Útočník identifikuje cíl, mapuje jeho **epistemickou síť** (kolegy, instituce, publikační kanály, mediální zázemí) a vyhledává **zranitelná místa**: závislosti na grantech, slabé spojence, kontroverzní výroky v minulosti, izolovatelné subkomunity.

### Fáze 2 — Aktivace techniky

Aktivace probíhá synchronně přes více vektorů. **Funding Attack** se nezavede jednorázovou akcí, ale **kaskádou koordinovaných drobných pohybů**, které jednotlivě působí marginálně, ale v součtu produkují **systémový posun**.

### Fáze 3 — Stabilizace nového stavu

Po dosažení primárního efektu útočník stabilizuje nový stav skrze **institucionální fakty**, **dokumentaci** a **revizionistický narativ**, který činí návrat k předchozímu stavu nákladným nebo nemožným.

## Detekce

| Indikátor | Popis | Závažnost | Reakce |
|-----------|-------|-----------|--------|
| **Koordinovaná synchronicita** | Více aktérů provádí podobné kroky v krátkém časovém okně | Vysoká | Síťová analýza, mapování koordinace |
| **Asymetrie kritiky** | Kritika cíle je tvrdší než stejná kritika srovnatelných případů | Střední | Dokumentace asymetrie, externí audit |
| **Eroze procedurálních standardů** | Standardy se náhle mění specificky pro daný případ | Vysoká | Procedurální archeologie, právní revize |
| **Narativní konvergence** | Různé zdroje začnou používat identické formulace | Střední | Lingvistická forenzika, šíření narativu |

## Neutralizace

### Individuální obrana

1. **Dokumentace v reálném čase** — Vést **veřejnou kroniku** všech kroků útoku s časovými razítky, jmény aktérů a citacemi.
2. **Diverzifikace závislostí** — Snížit **single points of failure** v kariéře (více grantů, více platforem, více institucí).
3. **Spojenecká síť** — Aktivně kultivovat **epistemickou koalici** přesahující jednu instituci nebo jeden okruh kolegů.

### Institucionální obrana

1. **Procedurální transparence** — Pevné, **veřejně dostupné procedury** pro recenze, evaluace, jmenování, granty.
2. **Externí audit** — Pravidelné **nezávislé audity** klíčových rozhodovacích procesů institucí.

## Vztah k jiným technikám

Technika **EA-2.1.6** se v praxi téměř nikdy nevyskytuje izolovaně. Typicky se kombinuje s technikami **EA-1.X.Y** (přímé útoky na jednotlivé výroky) jako **operační vrstvou** a s ostatními technikami **EA-2.X.Y** (institucionální delegitimizace) jako **strategickou vrstvou**. Identifikace primární techniky pomáhá rozeznat **strukturu kampaně** jako celku.

## Vztah k platformě

Prismatic Platform poskytuje pro detekci a analýzu této techniky následující komponenty:

- **[Decision Engine](@/glossary/decision-engine.md)** — vícezdrojová evidence + uncertainty estimator pro vyhodnocení důvěryhodnosti narativů kolem cíle
- **OSINT Toolbox** — 128+ adapterů pro mapování koordinace napříč platformami a institucemi
- **Nabla (∇∞)** — epistemický engine pro modelování útoků na epistemické autority a důvěru
- **Hawkeye** — síťová analýza pro detekci koordinovaných kampaní a zachycených struktur

## Související

- [Kapitola 2 — Scénáře delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) (parent)
- [Taxonomie EA](@/kompendium/glossary-bridges/taxonomie-ea.md) (klasifikační rámec)
- [Delegitimizace](@/kompendium/glossary-bridges/delegitimizace.md) (konceptuální základ)
- [EA-2.1.5](@/kompendium/techniques/ea-2-1-5-citation-suppression.md) (sister)
- [EA-2.1.7](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md) (sister)
- [EA-2.1.4](@/kompendium/techniques/ea-2-1-4-publikacni-blokace.md) (sister)
- [Gaslighting](@/kompendium/glossary-bridges/gaslighting.md) (související psychologický mechanismus)
- [Epistemické trauma](@/kompendium/glossary-bridges/epistemicke-trauma.md) (důsledek pro cíl)

## Connect

- **Kompendium**: [Hlavní rozcestník](@/kompendium/_index.md) | [Kapitola 2](@/kompendium/03-zakladni-kategorie/kapitola-2.md) | [Glossary](@/glossary/_index.md)
- **Platforma**: {{ <cross_link path="/decisions/" text="Decision Engine" /> }} | [OSINT Toolbox](https://prismatic-reality-com.github.io/prismatic-promo/osint/) | {{ <cross_link path="/nabla/" text="Nabla" /> }}
- **Zpětná vazba**: Pro hlášení nových případů této techniky kontaktujte [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
