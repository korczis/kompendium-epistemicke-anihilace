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
| **Přístupová úroveň** | L2 (omezená — výhradně pro kvalifikovanou klinickou, forenzní a doktrinální analýzu) |
| **Riziková úroveň** | Vysoká — terminální protokoly vyžadují přísný supervizní rámec, [IRB](@/glossary/irb-review.md) přezkum a doložitelnou klinickou kompetenci |
| **Reverzibilita** | Střední — návrat vyžaduje supervidovanou rekonstrukční fázi v řádu měsíců až let |
| **Rodičovská kapitola** | [Kapitola 4 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) |

## Definice

**Documentation chain of custody** představuje dokumentační řetězec všech artefaktů protokolu s ověřitelnou integritou a auditovatelností. V rámci kompendia je technika klasifikována jako **terminální protokol** — operace, jejíž důsledky pro subjekt jsou strukturálně nevratné bez explicitní rekonstrukční fáze a jejíž aplikace mimo přísně supervizní rámec naplňuje definici poškození.

Tento článek **nemá operační charakter**: jeho účelem je výhradně defenzivní rozpoznání, detekce neúmyslné manifestace a supervidovaná intervence. Jakékoliv ofenzivní použití techniky je v rozporu s [doktrinou platformy](@/kompendium/02-doktrinalni-ramec/_index.md) a její aplikace bez doložitelného etického rámce je explicitně zakázána.

Mechanismus, kterým technika operuje uvnitř supervidovaného rámce, spočívá v: kryptografické podepisování záznamů, časové razítkování, omezený přístup s logováním a periodický integritní audit. Tento popis slouží jako referenční rámec pro detekci, nikoliv jako návod k provedení.

## Struktura vzorce

Doložitelný řetězec záznamů je kontrolní mechanismus; rozpoznatelným vzorcem je prostředí, v němž záznam o tom, co se stalo, neexistuje nebo existuje jen ve verzi jedné strany. Pozorovatel to vidí na tom, že klíčové okamžiky nejsou nikde zapsány, že zápisy vznikají zpětně a že přístup k nim má jen ten, kdo je zároveň aktérem. Prostředí, které si kontroluje vlastní záznam, si tím zároveň kontroluje vlastní výklad (Lifton, 1961).

V anamnéze se znaky obvykle objeví v tomto sledu: chybějící zápis, rozpor mezi verzemi, převzetí cizí verze subjektem a nakonec rozporuplné biografické údaje při opakovaných anamnézách. Popsané pořadí je pozorovaný sled znaků, nikoli postup. Právě posledně jmenovaný marker uvádí tato stránka v klinických markerech a jeho výskyt se kryje s poznatky o tom, jak snadno se vzpomínka přepíše opakovaným převyprávěním zvenčí (Loftus & Pickrell, 1995).

Zasažený člověk referuje, že „si to už nepamatuje přesně“, a svou nejistotu přičítá sobě. Rozlišení od běžné nepřesnosti paměti stojí na asymetrii: chybějící záznam je systematicky ve prospěch jedné strany (Herman, 1992).

*Interpretace knihy*: dokumentace je zde popsána jako předpoklad pozdější forenzní rekonstrukce a jako znak, jehož nepřítomnost se dá rozpoznat. Metodologický rámec této čtenářské pozice vymezují [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

## Bezpečnostní rámec

| Mechanismus | Implementace |
|--------------|--------------|
| **IRB přezkum** | Vícepatrový etický přezkum nezávislými komisemi před spuštěním |
| **Informed consent** | Explicitní, opakovaně ověřovaný souhlas s právem kdykoliv odstoupit |
| **Real-time monitoring** | Kontinuální sledování biopsychosociálních markerů |
| **Eskalační hierarchie** | Předem definované prahy a postup intervence |
| **External audit** | Nezávislá komise s pravomocí pozastavení protokolu |
| **Documentation** | Podepsaný a auditovatelný řetězec záznamů ([chain of custody](@/glossary/chain-of-custody.md)) |
| **Whistleblower channel** | Anonymní kanál pro hlášení etických porušení |

## Okolnosti, které expozici vylučují

Tato stránka nevypočítává případy, v nichž by zásah do záznamu o průběhu byl přípustný; o přípustnosti čehokoli takového nerozhoduje popis vzorce, nýbrž [etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md). Následující přehled uvádí pouze okolnosti vylučující a důvod vyloučení.

| Vylučující okolnost | Proč vylučuje |
|---------------------|---------------|
| Akutní psychiatrická krize, suicidální ideace nebo dekompenzovaná komorbidita | Přednost má krizová péče; žádná úroveň auditovatelnosti záznamu ji nemůže zastoupit ani odložit |
| Nedostatečná podpůrná síť nebo závislé sociální postavení subjektu | Bez vlastního okolí nemá subjekt komu doložit rozpor v záznamu a zůstává odkázán na výklad jedné strany |
| Operátor je zároveň nadřízeným, zadavatelem nebo jediným supervizorem subjektu | Kdo vede záznam a má nad subjektem moc, kontroluje i jeho pozdější výklad; souhlas tam nelze považovat za svobodný |
| Komerční, kompetitivní nebo politický cíl | Takový cíl mění dokumentaci v nástroj vlastní obhajoby zadavatele, nikoli v ochranu subjektu |

## Klinické markery (neúmyslná manifestace)

Co může klinik nebo supervizor pozorovat, pokud se technika manifestuje mimo supervidovaný rámec — v důsledku patologické sociální struktury, kultovního prostředí, abusivního vztahu nebo neetické instituce:

| Marker | Indikuje |
|--------|----------|
| Subjekt popisuje epizody dezorientace bez identifikovatelného spouštěče | Možnou expozici nestrukturovanému ekvivalentu protokolu |
| Změny v narativní koherenci sebepopisu napříč konzultacemi | Probíhající identitní destabilizaci |
| Zvýšená závislost na externí validaci pro běžné rozhodnutí | Erozi self-funkce |
| Rozporuplné biografické údaje při opakovaných anamnézách | Aktivní rekontextualizační tlak |
| [Sociální izolace](@/glossary/socialni-izolace.md) s jediným referenčním zdrojem autority | Strukturální rizikový kontext |
| Časová dezorientace ve vztahu k vlastnímu životnímu příběhu | Indukovanou temporální disrupci |

Detekce vyžaduje **diferenciální diagnózu** vůči primárním psychiatrickým stavům (disociativní poruchy, PTSD, psychotická spektra) a vůči [legitimní transformativní zkušenosti](@/glossary/transformative-experience.md).

## Klinické pozadí

Technika **EA-4.2.7** se historicky vyvinula z konvergence několika klinických tradic: psychoanalytické práce s traumatickým přenosem (Ferenczi, Sándor), kognitivně-behaviorální tradice expoziční terapie (Foa, Edna B.), neurobiologického modelu [polyvagální teorie](@/glossary/polyvagalni-teorie.md) (Porges, Stephen W.) a specifického korpusu post-cult psychologické literatury (Singer, Margaret T.; Hassan, Steven). V kontextu kompendia EA představuje etická governance vysokorizikové výzkumné nebo intervenční expozice.

**Klinické zacílení**: etické rámce pre/inter/post-engagement supervize ve studiích s extrémní expozicí (forenzní psychiatry, vojenský výzkum, kult-deconstruction protokoly). Specificita techniky vůči tradičním psychoterapeutickým modalitám spočívá v explicitním uchopení epistemicko-afektivní složky traumatu — tj. poškození samotných struktur, jimiž subjekt rozumí svému světu a sobě v něm.

**Trauma spektrum kontext**: aplikace techniky vyžaduje explicitní stratifikaci subjektu na škále jednoduchého akutního traumatu (Type I trauma per Terr) versus komplexního opakovaného relačního traumatu (Type II trauma). U Type II profilů s dlouhodobou expozicí v dětství je nutná modifikace standardního protokolu — zkrácení sezení, posílení titrace expozičních prvků, zvýšení frekvence stabilizačních intervalů. Ignorance této stratifikace je dokumentovanou cestou k iatrogennímu zhoršení.

**Klinická tradice ukotvení**: česká psychiatrická a psychologická tradice (Vondráček, Mečíř, Kratochvíl, Höschl, Praško) poskytuje specifický rámec pro adaptaci globálních [evidence-based](@/glossary/evidence-based.md) přístupů na středoevropské sociokulturní specifika — postkomunistická intergenerační traumata, religijně-sektářská specifika regionu, vzorce institucionálního násilí v rámci totalitního dědictví.

## Vulnerabilní podpopulace

Aplikace techniky **EA-4.2.7** vyžaduje specifickou modifikaci v následujících podpopulacích, kde standardní protokol nese zvýšené iatrogenní riziko:

**Děti a adolescenti (< 18 let)**: vývojově citlivá adaptace s explicitním zapojením pečující osoby (model TF-CBT), zkrácená sezení proti dospělému standardu, vyšší frekvence stabilizačních prvků, hra a kreativní expresivní techniky jako preferovaný kanál. Riziko: dlouhodobá identifikace s rolí pacienta (sick role internalization). Doporučené nástroje: UCLA PTSD-RI, CAPS-CA-5, Trauma Symptom Checklist for Children.

**Geriatrická populace (> 65 let)**: kognitivní akomodace (delší pauzy, opakování klíčových konceptů, písemné podpůrné materiály), screening pro early-stage demenci (MoCA), zohlednění kohortně specifické historie (postkomunistická intergenerační traumata), častá komorbidita s chronickými somatickými onemocněními.

**Komorbidní psychotické spektrum**: technika vyžaduje předchozí farmakologickou stabilizaci (atypická antipsychotika), úzká spolupráce s psychiatrem, redukce konfrontačních elementů, posílené reality-testing protokoly. Riziko: psychotická dekompenzace pod expozičním tlakem.

**Komorbidní substance use disorders**: doporučená sekvence — primární léčba závislosti do funkční remise, poté trauma-fokusovaná intervence. Paralelní integrované přístupy (Seeking Safety) jsou alternativou pro pacienty neschopné dosáhnout primární abstinence.

**Komorbidní borderline personality disorder**: rozšířená stabilizační fáze (nácvik dovedností DBT) předchází trauma expozičním komponentám. Riziko regresivní idealizace/devalvace v terapeutickém vztahu vyžaduje peer-supervizi.

**Pregnancy a perinatální období**: relativní kontraindikace pro vysokoexpoziční varianty; v těhotenství a v poporodním období jsou preferovány sensorimotorické a stabilizační intervence.

## Intervenční variace

Klinický kontext **EA-4.2.7** připouští následující dokumentované adaptace pro specifické setting a populace, vždy se zachováním jádra evidence-based protokolu:

**Telehealth varianta**: pandemie covidu-19 urychlila adopci video-mediovaných verzí. Literatura o telehealth formátech popisuje srovnatelnou efektivitu s osobním kontaktem, s výjimkou pacientů s aktivní disociativní symptomatologií, kde si osobní setting zachovává klinickou výhodu (regulace skrze kotvící fyzickou přítomnost terapeuta). Praktické modifikace: technické rituály (kvalita připojení), explicitní bezpečnostní plán pro případ fyzické nedostupnosti, rozšířená dokumentace.

**Skupinový formát**: malá uzavřená skupina s doplňkovými individuálními moduly. Efektivita bývá popisována jako nižší než u individuálního formátu a kompenzovaná ekonomickou dostupností a peer-support komponentou. Kontraindikace: aktivní psychotická symptomatologie, závažná interpersonální agresivita, nestabilní disociativní obraz.

**Krátká intervence**: pro vybrané populace s Type I traumatem, vysokou compliance a dostupnou podpůrnou sítí. Komprimovaný protokol s hustěji řazenými sezeními je v literatuře popisován jako noninferiorní standardní variantě; kompendium konkrétní počty sezení neuvádí, protože je žádný zdroj na této stránce nedokládá.

**Adjuvantní farmakoterapie**: indikace, volba přípravku a dávkování jsou výhradně v kompetenci ošetřujícího psychiatra a řídí se platnými doporučenými postupy. Kompendium je neuvádí: jde o defenzivní taxonomii pro rozpoznání vzorce, nikoli o terapeutický manuál.

**Kulturně senzitivní adaptace**: česká adaptace zohledňuje (a) jazyk a metaforický rámec specifický pro středoevropské vyprávění o traumatu, (b) postkomunistická intergenerační traumata jako kontext, (c) explicitní eskalační cesty v rámci hrazené péče. Slovenská a polská adaptace sdílejí s českou většinu rámce.

**Crisis-modifikovaná verze**: redukce expozičních komponent ve prospěch posílených stabilizačních modulů pro aktuálně dekompenzované pacienty; přechod do standardního protokolu až po dosažení klinické stabilizace.

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

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md)
