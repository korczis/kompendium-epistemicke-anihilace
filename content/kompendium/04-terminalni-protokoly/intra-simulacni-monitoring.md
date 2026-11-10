+++
title = "Intra-simulační monitoring"
description = "Strukturální rámec průběžného bezpečnostního monitoringu během intenzivních simulací."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "terminalni-protokoly", "intra-simulacni-monitoring", "bezpecnostni-protokoly", "klinicka-supervize", "safe-word", "eskalacni-prahy"]
categories = ["academic", "research"]

[extra]
related_terms = ["identitni-dekonstrukce", "institucionalni-anihilace", "kapitola-4", "kapitola-5"]
parent = "kompendium-04-terminalni-protokoly"
section_icon = "⚠️"
toc = true
access_level = "L2"
risk_level = "high"
status = "publikovano"
+++

# Intra-simulační monitoring

> ⚠️ **L2 — Analytické porozumění.** Tato studie popisuje strukturu **průběžného bezpečnostního monitoringu** během intenzivních simulačních protokolů. Doplňuje [Kapitolu 5: Specializované bezpečnostní protokoly](@/kompendium/04-terminalni-protokoly/kapitola-5.md) a navazuje na [před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md).

## Postavení v bezpečnostním rámci

Intra-simulační monitoring je druhá z trojice bezpečnostních vrstev (pre-, intra-, post-engagement). Jeho cílem je **kontinuální detekce eskalujícího iatrogenního rizika** v průběhu expozice a aktivace odpovídajících safeguardů — od mikro-modulace intenzity po okamžité ukončení protokolu.

Klíčový strukturální princip: monitoring je **multikanálový a redundantní**. Žádný jednotlivý kanál není dostačující; každý zachycuje různé fasety dynamiky a každý má vlastní falešně-negativní profil. Redundance kanálů je analogická redundanci v leteckém safety designu.

## Čtyři kanály monitoringu

### Kanál 1: somatický

Komponenty:

- **Kontinuální vitální parametry** — tep, krevní tlak, saturace kyslíku, dýchání, tělesná teplota,
- **Telemetrie** — vzdálené sledování parametrů s alarmovými prahy,
- **Periodické laboratorní vyšetření** v dlouhodobých protokolech (glykémie, elektrolyty, hydratace, kortizol),
- **Kontinuální zdravotnický dozor** s pravomocí přerušit protokol,
- **Zdravotnická infrastruktura** — pohotovostní zdravotnický tým s definovaným reakčním časem.

Eskalační prahy:

| Parametr | Práh varování | Práh ukončení |
|----------|---------------|---------------|
| Tep | Definováno individuálně dle baseline | Individuální horní mez |
| Krevní tlak | Hypertenzní krize, hypotenze | Akutní dekompenzace |
| Saturace | Pokles pod individuální baseline | Akutní hypoxie |
| Tělesná teplota | Hypotermie, hypertermie | Mimo bezpečné rozsahy |
| Glykémie | Symptomatická | Akutní hypoglykémie |

(Konkrétní hodnoty jsou individuálně kalibrovány v rámci [před-simulačního screeningu](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) a nejsou publikovatelné jako generický standard.)

### Kanál 2: behaviorální a kognitivní

Komponenty:

- **Kontinuální video/audio monitoring** s časovou synchronizací,
- **Behavioral coding** — kódování behaviorálních markerů zkušeným pozorovatelem,
- **Performance monitoring** — sledování úspěšnosti subjektu na úkolech protokolu,
- **Speech analysis** — analýza prozodie, koherence, lexikální variability,
- **Motor activity** — sledování motorických markerů stresu a disociace.

Eskalační markery:

- ztráta koherence ve verbální produkci,
- výrazné prozodické změny (monotonie, fragmentace),
- repetitivní behaviorální vzorce,
- katatonní rysy nebo akutní agitace,
- ztráta orientace v úkolu,
- regresivní chování,
- somatické markery disociace (dotyky obličeje, ztráta motorické koordinace).

### Kanál 3: afektivní a fenomenologický

Komponenty:

- **Mikroexprese** — sledování faciálních mikromarkerů,
- **Afektivní coding** — kódování pozorovatelného afektu,
- **Periodické fenomenologické check-ins** v intervalech protokolu,
- **Self-report markery** — krátké sebehodnotící škály v kontrolovaných intervalech.

Eskalační markery:

- plochý afekt v kontextu, kde by měl být přítomen,
- nesoulad mezi verbálním a non-verbálním afektem,
- akutní emoční dysregulace,
- depersonalizační nebo derealizační zážitky reportované v check-in,
- *flat-with-smile* fenomén (úsměv bez emocionální resonance),
- explicitní vyjádření přání ukončit s bezprostřední negací.

### Kanál 4: sociometrický a interaktivní

Komponenty:

- **Sledování interakcí s instruktory** — kvalita rapportu, ko-regulace,
- **Sledování interakcí s peer-skupinou** — sociometrické markery,
- **Buddy-system reporting** — peer-partner subjektu reportuje pozorování,
- **Skupinová dynamika** — markery kolektivní dezintegrace nebo cohesion.

Eskalační markery:

- ztráta rapportu s instruktory,
- separace od peer-skupiny,
- buddy-partner reportuje obavy,
- kolektivní dynamika přechází do sub-skupinového konfliktu,
- subjekt přestává reagovat na sociální výzvy.

## Eskalační prahy a odpovídající akce

Eskalační prahy jsou strukturovány do čtyř úrovní s definovanými odpovědními protokoly.

### Úroveň E1: zvýšená pozornost

**Markery:** Drobné odchylky v jednom kanálu bez konvergence s ostatními.

**Akce:** Intenzifikace monitoringu; klinický supervizor informován; protokol pokračuje beze změn.

### Úroveň E2: aktivní intervence

**Markery:** Konvergence markerů v dvou nebo více kanálech; nebo závažný marker v jednom kanálu.

**Akce:** Klinický supervizor aktivně přítomen; mikro-modulace intenzity protokolu; kontaktní bod se subjektem (krátký check-in); reevaluace pokračování v krátkém čase.

### Úroveň E3: ohraničení a stabilizace

**Markery:** Závažné markery ve více kanálech; subjekt vykazuje známky akutní dekompenzace; somatické parametry mimo bezpečnostní rozsah.

**Akce:** Pozastavení expozice; subjekt přesunut do stabilizačního prostředí; somatická a klinická intervence; reevaluace pokračování s vysokou prahovou hodnotou.

### Úroveň E4: okamžité ukončení a klinická intervence

**Markery:** Kritický marker (akutní psychotické symptomy, suicidální ideace, somatický kolaps, závažná disociace, identitní kolaps); aktivace safe-wordu; rozhodnutí klinického supervizora.

**Akce:** Okamžité ukončení protokolu; aktivace klinické intervence; transfer do klinického prostředí; aktivace post-expoziční rekonstrukční sekvence (viz [Kontrolovaná rekonstituce](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md)).

## Safe-word infrastruktura

Klíčový bezpečnostní prvek: **funkční safe-word systém**. Nedostatečně funkční safe-word systém je často hlavním rozdílem mezi legitimním protokolem a strukturálně koercitivním.

### Strukturální požadavky

1. **Specifický signál** — verbální nebo neverbální, předem definovaný a procvičený se subjektem během [před-simulačního screeningu](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md).
2. **Univerzální dostupnost** — subjekt může signál použít kdykoli a v jakékoli situaci protokolu.
3. **Imediátní efekt** — aktivace signálu vede k **okamžitému** ukončení nebo eskalovanému monitoringu, bez negociace.
4. **Bez sankcí** — aktivace signálu nevede k žádným kariérním, finančním nebo sociálním sankcím.
5. **Redundantní kanály** — signál je dostupný i v případě selhání primárního komunikačního kanálu (záložní gesto, záložní klíčové slovo, záložní fyzický signál).
6. **Procvičování** — subjekt signál procvičil v low-stress kontextu před expozicí.
7. **Auditability** — aktivace signálu je dokumentována s časovou stopou.

### Strukturální patologie safe-word systémů

Z dokumentovaných případů selhání lze identifikovat následující patologie, které **strukturálně defektní** safe-word činí:

- **Příliš komplexní signál**, který subjekt v dezintegrovaném stavu nedokáže aktivovat,
- **Negociovatelná aktivace** — instruktor po aktivaci vyjednává ohledně skutečnosti záměru,
- **Strukturální sankce** — implicitní sociální nebo kariérní cena za aktivaci,
- **Single-channel** — pokud primární kanál selže, aktivace není možná,
- **Neprocvičený** — subjekt nemá kódovanou behaviorální paměť aktivace,
- **Re-defined** — význam signálu je v průběhu protokolu modifikován.

Detekce kterékoli z těchto patologií indikuje **strukturálně defektní bezpečnostní rámec**.

## Role klinického supervizora

Klinický supervizor je **autonomní autorita** s pravomocí ukončit protokol. Jeho role je strukturálně klíčová a musí splňovat:

- **Nezávislost** — supervizor nepatří do výcvikové instituce v hierarchické pozici, která by mohla kompromitovat jeho úsudek.
- **Kontinuální přítomnost** — supervizor je fyzicky nebo telemetricky přítomen po celou dobu protokolu.
- **Pravomoc autonomního rozhodnutí** — supervizor může ukončit protokol bez souhlasu provádějících instruktorů.
- **Klinická kompetence** — supervizor disponuje klinickou kvalifikací odpovídající rizikovému profilu protokolu.
- **Profesní odpovědnost** — supervizor nese profesní odpovědnost vůči externí komoře.
- **Auditability** — všechna rozhodnutí supervizora jsou dokumentována.

Strukturální patologie: pokud má supervizor pouze poradní roli bez pravomoci ukončení, nebo pokud je hierarchicky podřízen vedení instituce, bezpečnostní rámec je strukturálně defektní.

## Audit-trail

Veškerá monitorovací data jsou kontinuálně dokumentována a archivována. Komponenty audit-trailu:

- časově synchronizovaný video/audio záznam,
- vitální parametry s časovou stopou,
- behaviorální coding s identifikací coderů,
- afektivní coding,
- self-report responses subjektu,
- rozhodovací body supervizora s časovou stopou a rationale,
- veškerá komunikace mezi supervizorem a instruktory,
- aktivace safe-word signálu (i v případě, že vedla k pokračování po negociaci — strukturálně problematickému scénáři).

Audit-trail slouží:

- pro post-expoziční klinickou rekonstrukci,
- pro institucionální učení,
- pro nezávislý etický audit,
- pro forenzní rekonstrukci v případě komplikace.

Přístup k audit-trailu je striktně omezen na klinický personál, etickou komisi a forenzní orgány v případě potřeby.

## Specifické rozšíření pro Capstone protokoly

Pro protokoly úrovně Capstone (viz [Ultimátní výcvikový scénář](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md)) jsou nezbytné dodatečné monitorovací vrstvy:

- **Disociogenní monitoring** — specializovaný coding pro detekci ranných disociativních markerů,
- **Identitní monitoring** — monitoring narativních markerů identitní integrity,
- **Reflexivní monitoring** — periodické testy přístupu k druhořádovému poznání,
- **Předem etablovaná klinická pohotovost** s reakčním časem v řádu minut,
- **Druhý nezávislý supervizor** s nezávislou pravomocí ukončit protokol.

## Etické limity monitoringu

Monitoring sám představuje etickou zátěž:

- **Privátnost** — kontinuální monitoring produkuje extrémně citlivá data,
- **Surveillance fatigue** — rozsáhlý monitoring může indukovat behaviorální adaptace u subjektu i monitorujících,
- **False security** — monitoring nemůže detekovat všechny formy iatrogenního poškození,
- **Data security** — archivovaná data představují bezpečnostní riziko, pokud nejsou chráněna.

Doporučení: monitoring je implementován v **proporcionalitě** k rizikovému profilu protokolu, s explicitním souhlasem subjektu, a s robustními safeguards pro data security.

## Související materiály

- [Kapitola 4: Extrémní výcviková sekvence](@/kompendium/04-terminalni-protokoly/kapitola-4.md)
- [Kapitola 5: Specializované bezpečnostní protokoly](@/kompendium/04-terminalni-protokoly/kapitola-5.md)
- [Ultimátní výcvikový scénář](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md)
- [Konceptuální dekonstrukce](@/kompendium/04-terminalni-protokoly/konceptualni-dekonstrukce.md)
- [Identitní dekonstrukce](@/kompendium/04-terminalni-protokoly/identitni-dekonstrukce.md)
- [Institucionální anihilace](@/kompendium/04-terminalni-protokoly/institucionalni-anihilace.md)
- [Kontrolovaná rekonstituce](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md)
- [Před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md)
- [Sekce 03: Základní kategorie epistemických manipulací](@/kompendium/03-zakladni-kategorie/_index.md)
- [Sekce 06: Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
- Glosář: [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) · [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) · [Ontologická anihilace](@/glossary/ontologicka-anihilace.md) · [Metakognitivní destrukce](@/glossary/metakognitivni-destrukce.md) · [Anankastický režim](@/glossary/anankasticky-rezim.md) · [Epistemická alienace](@/glossary/epistemicka-alienace.md) · [Kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md) · [Taxonomie EA](@/glossary/taxonomie-ea.md) · [Dual-use poznání](@/glossary/dual-use-poznani.md) · [Epistemické trauma](@/glossary/epistemicke-trauma.md) · [Gaslighting](@/glossary/gaslighting.md) · [Delegitimizace](@/glossary/delegitimizace.md)
- Filozofie: [Intelektuální suverenita](@/philosophy/intellectual-sovereignty.md) · [Epistemická integrita](@/philosophy/epistemic-integrity.md) · [Boundary ethics](@/philosophy/boundary-ethics.md)
- Platforma: {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }} · [NABLA Infinity](@/glossary/nabla-infinity.md) · [Color Teams](@/glossary/color-teams.md)

## ⚡ Kritický krok

**Tato sekce není použitelná bez supervize.** Před aplikací jakéhokoli
terminálního protokolu (i v rámci sebe-monitoringu) ověř:

1. Existující písemný [eticky-kodex](@/kompendium/08-prilohy/eticky-kodex.md)
   schválený tvou institucí
2. Aktivní [supervizní rámec](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)
   s minimálně měsíčním kontaktem
3. [Pred-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md)
   uplynulých 7 dní

> **Mandatorní akce**: aplikace bez splnění všech tří bodů je porušením
> doktríny tohoto kompendia. Bez nich vrať tento materiál na úroveň
> [03 Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md).

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }}
