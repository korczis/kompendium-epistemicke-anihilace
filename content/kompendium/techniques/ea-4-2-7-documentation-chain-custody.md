+++
title = "EA-4.2.7 Documentation chain of custody"
description = "Terminální protokol — Documentation chain of custody: dokumentační řetězec všech artefaktů protokolu s ověřitelnou integritou a auditovatelností."
weight = 427
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-4-2", "terminalni-protokoly", "documentation-chain-custody"]
categories = ["academic", "research"]

[extra]
related_terms = ["ea-4-2-5-whistleblower-protection", "ea-4-2-6-consent-withdrawal", "ea-4-2-8-long-term-followup", "ea-4-2-9-decompensation-response"]
ea_code = "EA-4.2.7"
ea_category = "4. Terminální protokoly"
ea_subcategory = "4.2 Bezpečnostní protokoly"
section_icon = "⚠️"
toc = true
access_level = "L2"
risk_level = "high"
parent_chapter = "/kompendium/04-terminalni-protokoly/"
+++

# EA-4.2.7 Documentation chain of custody

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-4.2.7` |
| **Kategorie** | 4. Terminální protokoly |
| **Subkategorie** | 4.2 Bezpečnostní protokoly |
| **Riziková úroveň** | Vysoká — terminální protokoly vyžadují přísný supervizní rámec, [IRB](@/glossary/irb-review.md) přezkum a doložitelnou klinickou kompetenci |
| **Reverzibilita** | Střední — návrat vyžaduje supervidovanou rekonstrukční fázi v řádu měsíců až let |
| **Rodičovská kapitola** | [Kapitola 4 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) |

## Definice

**Documentation chain of custody** představuje dokumentační řetězec všech artefaktů protokolu s ověřitelnou integritou a auditovatelností. V rámci kompendia je technika klasifikována jako **[terminální protokol](@/kompendium/04-terminalni-protokoly/_index.md)** — operace, jejíž důsledky pro subjekt jsou strukturálně nevratné bez explicitní rekonstrukční fáze a jejíž aplikace mimo přísně supervizní rámec naplňuje definici poškození.

{% include "partials/tento-clanek-nema-operacni-charakter.md" %}

Mechanismus, kterým technika operuje uvnitř supervidovaného rámce, spočívá v: kryptografické podepisování záznamů, časové razítkování, omezený přístup s logováním a periodický integritní audit. Tento popis slouží jako referenční rámec pro detekci, nikoliv jako návod k provedení.

## Struktura vzorce

Doložitelný řetězec záznamů je kontrolní mechanismus; rozpoznatelným vzorcem je prostředí, v němž záznam o tom, co se stalo, neexistuje nebo existuje jen ve verzi jedné strany. Pozorovatel to vidí na tom, že klíčové okamžiky nejsou nikde zapsány, že zápisy vznikají zpětně a že přístup k nim má jen ten, kdo je zároveň aktérem. Prostředí, které si kontroluje vlastní záznam, si tím zároveň kontroluje vlastní výklad (Lifton, 1961).

V anamnéze se znaky obvykle objeví v tomto sledu: chybějící zápis, rozpor mezi verzemi, převzetí cizí verze subjektem a nakonec rozporuplné biografické údaje při opakovaných anamnézách. Popsané pořadí je pozorovaný sled znaků, nikoli postup. Právě posledně jmenovaný marker uvádí tato stránka v klinických markerech a jeho výskyt se kryje s poznatky o tom, jak snadno se vzpomínka přepíše opakovaným převyprávěním zvenčí (Loftus & Pickrell, 1995).

Zasažený člověk referuje, že „si to už nepamatuje přesně“, a svou nejistotu přičítá sobě. Rozlišení od běžné nepřesnosti paměti stojí na asymetrii: chybějící záznam je systematicky ve prospěch jedné strany (Herman, 1992).

*Interpretace knihy*: dokumentace je zde popsána jako předpoklad pozdější forenzní rekonstrukce a jako znak, jehož nepřítomnost se dá rozpoznat. Metodologický rámec této čtenářské pozice vymezují [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

## Bezpečnostní rámec

U doložitelného řetězce záznamů je chybějící pojistka rozpoznatelná stejně jako chybějící zápis sám.

Stránka takové nakládání se záznamem nepředepisuje ani k němu neopravňuje; popisuje je jen jako nález.

{% include "partials/bezpecnostni-ramec.md" %}

## Okolnosti, které expozici vylučují

Tato stránka nevypočítává případy, v nichž by zásah do záznamu o průběhu byl přípustný; o přípustnosti čehokoli takového nerozhoduje popis vzorce, nýbrž [etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md). Následující přehled uvádí pouze okolnosti vylučující a důvod vyloučení.

| Vylučující okolnost | Proč vylučuje |
|---------------------|---------------|
| Akutní psychiatrická krize, suicidální ideace nebo dekompenzovaná komorbidita | Přednost má krizová péče; žádná úroveň auditovatelnosti záznamu ji nemůže zastoupit ani odložit |
| Nedostatečná podpůrná síť nebo závislé sociální postavení subjektu | Bez vlastního okolí nemá subjekt komu doložit rozpor v záznamu a zůstává odkázán na výklad jedné strany |
| Operátor je zároveň nadřízeným, zadavatelem nebo jediným supervizorem subjektu | Kdo vede záznam a má nad subjektem moc, kontroluje i jeho pozdější výklad; souhlas tam nelze považovat za svobodný |
| Komerční, kompetitivní nebo politický cíl | Takový cíl mění dokumentaci v nástroj vlastní obhajoby zadavatele, nikoli v ochranu subjektu |

## Klinické markery (neúmyslná manifestace)

{% include "partials/co-muze-klinik-nebo-supervizor.md" %}

| Marker | Indikuje |
|--------|----------|
| Subjekt popisuje epizody dezorientace bez identifikovatelného spouštěče | Možnou expozici nestrukturovanému ekvivalentu protokolu |
| Změny v narativní koherenci sebepopisu napříč konzultacemi | Probíhající identitní destabilizaci |
| Zvýšená závislost na externí validaci pro běžné rozhodnutí | Erozi self-funkce |
| Rozporuplné biografické údaje při opakovaných anamnézách | Aktivní rekontextualizační tlak |
| [Sociální izolace](@/glossary/socialni-izolace.md) s jediným referenčním zdrojem autority | Strukturální rizikový kontext |
| Časová dezorientace ve vztahu k vlastnímu životnímu příběhu | Indukovanou temporální disrupci |

{% include "partials/detekce-vyzaduje-diferencialni-diagnozu-vuci.md" %}

## Klinické pozadí

Kniha vede techniku **EA-4.2.7** jako režim správy záznamů: předmětem není zásah do člověka, ale ověřitelnost toho, co bylo při vysokorizikové výzkumné nebo intervenční expozici zaznamenáno, kým a kdy. Etická governance takové expozice je tím, k čemu stránka slouží; o přípustnosti samotné expozice nerozhoduje dokumentační řetězec, ale etická komise a supervize.

{% include "partials/klinicke-zacileni-eticke-ramce-pre.md" %}

**Trauma spektrum kontext**: rozlišení jednorázové akutní události od opakované relační expozice v dětství zavedla do klinické literatury Terr (1991). Pro správu záznamů je to podstatné proto, že u druhého profilu se dokumentovaná historie skládá z mnoha dílčích epizod a chybějící část řetězce mění výklad celku. Jaký důsledek z toho pro konkrétního člověka plyne, nerozhoduje tato stránka, ale odpovědný klinik ve supervizi (Herman, 1992).

**Klinická tradice ukotvení**: *interpretace knihy* — způsob, jakým se dokumentační nároky na záznam o expozici uplatní, je vázán na místní zdravotnickou a výzkumnou praxi, v níž se [evidence-based](@/glossary/evidence-based.md) postupy přebírají; středoevropská zkušenost s institucionálním násilím a s nepřístupnými záznamy z doby totalitního režimu je důvodem, proč kniha přístupnost záznamu dotčenému člověku uvádí jako podmínku, a nikoli jako doplněk.

## Vulnerabilní podpopulace

Dokumentační řetězec zasahuje toho, o kom je vedený. Několik skupin je vůči tomu, co o nich záznam tvrdí, vystaveno víc, protože samy k němu nemají přístup.

**Děti a adolescenti**: o dítěti mluví záznam pořízený dospělými a dítě jeho obsah samo neopraví. Riziko: dlouhodobá identifikace s rolí pacienta (sick role internalization).

Jmenovány bývají: model TF-CBT, UCLA PTSD-RI, CAPS-CA-5, Trauma Symptom Checklist for Children.

**Geriatrická populace**: záznam o starém člověku bývá úplnější než jeho vlastní verze a v rozhodování o něm ji převáží; kohortní zkušenost s úředním spisem to zesiluje.

Při odlišení počínající demence se v záznamech uvádí MoCA.

**Komorbidní psychotické spektrum**: tvrzení o sledování a shromažďování údajů se v tomto obraze potvrzuje samo. Riziko: psychotická dekompenzace pod expozičním tlakem.

**Komorbidní substance use disorders**: údaj o užívání jednou zapsaný v řetězci přežívá svou platnost a vysvětluje pak všechno ostatní.

Mezi jmenovanými přístupy stojí Seeking Safety.

**Komorbidní borderline personality disorder**: diagnóza v záznamu předchází člověku. Riziko: regresivní idealizace a devalvace v terapeutickém vztahu.

V dokumentaci bývá jmenován nácvik dovedností DBT.

**Gravidita a perinatální období**: záznam z tohoto období se váže i k dítěti a přežívá situaci, o níž vznikl.

## Intervenční variace

{% include "partials/klinicky-kontext-pripousti-nasledujici-dokumentovane.md" %}

{% include "partials/telehealth-varianta-pandemie-covidu-19.md" %}

## Vztah k jiným technikám

### V rámci subkategorie 4.2 Bezpečnostní protokoly

  - [EA-4.2.1 Pre-engagement screening](@/kompendium/techniques/ea-4-2-1-pre-engagement-screening.md)
  - [EA-4.2.2 Real-time monitoring](@/kompendium/techniques/ea-4-2-2-real-time-monitoring.md)
  - [EA-4.2.3 Post-engagement reintegration](@/kompendium/techniques/ea-4-2-3-post-engagement-reintegration.md)
  - [EA-4.2.4 IRB review multi-tier](@/kompendium/techniques/ea-4-2-4-irb-review-multi-tier.md)
  - [EA-4.2.5 Whistleblower protection](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md)

### Provázanost mezi subkategoriemi 4

  - [EA-4.3.1 Systematic conceptual disassembly](@/kompendium/techniques/ea-4-3-1-systematic-conceptual-disassembly.md)

### Cross-kategoriální vazby

- **[EA 1 2 1 FALESNE DILEMA](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md)** — akademická vrstva, jejíž eskalace může vést k terminální fázi.
- **[EA 2 1 3 CREDENTIALING ATTACK](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md)** — související vstupní mechanismus.
- **[EA 5 1 2 KONCEPTUALNI NIHILACE](@/kompendium/techniques/ea-5-1-2-konceptualni-nihilace.md)** — ultramární technika strukturálně příbuzná, vyžadující ostřejší distinktivní detekci.

## Literatura

- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Loftus, E. F., & Pickrell, J. E. (1995). The formation of false memories. *Psychiatric Annals*, 25(12), 720–725.
- National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research (1979). *The Belmont Report*.
- Terr, L. C. (1991). Childhood traumas: An outline and overview. *American Journal of Psychiatry*, 148(1), 10–20.

## Související

- **Rodičovská kapitola**: [Kapitola 4 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- **Sourozenecké techniky** (subkategorie 4.2 Bezpečnostní protokoly):
  - [EA-4.2.1 Pre-engagement screening](@/kompendium/techniques/ea-4-2-1-pre-engagement-screening.md)
  - [EA-4.2.2 Real-time monitoring](@/kompendium/techniques/ea-4-2-2-real-time-monitoring.md)
  - [EA-4.2.3 Post-engagement reintegration](@/kompendium/techniques/ea-4-2-3-post-engagement-reintegration.md)
  - [EA-4.2.4 IRB review multi-tier](@/kompendium/techniques/ea-4-2-4-irb-review-multi-tier.md)
  - [EA-4.2.5 Whistleblower protection](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md)
- **Cross-kategoriální techniky**:
  - [ea-1-2-1-falesne-dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md)
  - [ea-2-1-3-credentialing-attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md)
  - [ea-5-1-2-konceptualni-nihilace](@/kompendium/techniques/ea-5-1-2-konceptualni-nihilace.md)
- **Glossary**:
  - [IRB review](@/glossary/irb-review.md)
  - [Informed consent](@/glossary/informed-consent.md)
  - [Chain of custody](@/glossary/chain-of-custody.md)
  - [Individual risk map](@/glossary/individual-risk-map.md)
  - [Transformative experience](@/glossary/transformative-experience.md)
  - [Taxonomie EA](@/glossary/taxonomie-ea.md)
  - [Dual-use poznání](@/glossary/dual-use-poznani.md)
- **Forward-references**:
  - [Kapitola 5 — Ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md)
  - [Kapitola 6 — Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
