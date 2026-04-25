+++
title = "7.3 Sociální epistemologie EA — Goldman, Fricker, Longino, Anderson"
description = "Sociální epistemologie EA — Goldmanův veritism a sociální reliabilismus, Frickerová a epistemická nespravedlnost (testimoniální + hermeneutická), Longino a kritický kontextový empirismus, Anderson a demokratická epistemologie."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "socialni-epistemologie", "goldman", "fricker", "longino", "anderson", "epistemic-injustice", "veritism"]
categories = ["academic", "epistemology"]

[extra]
parent = "kompendium-07-teoreticke-reflexe"
section_icon = "🪐"
toc = true
+++

# 7.3 Sociální epistemologie EA — Goldman, Fricker, Longino, Anderson

Sociální epistemologie — disciplína systematicky rozvíjená od 70. let 20. století — představuje pro kompendium EA **bezprecedentně relevantní** teoretický zdroj. Zatímco klasická epistemologie analyzuje individuální poznání izolovaného subjektu, sociální epistemologie zkoumá **kolektivní** dimenzi vědění: jak věříme druhým, jak operují epistemické instituce, jak distribuce moci formuje distribuci vědění a jak některé sociální struktury **systematicky znevýhodňují** určité epistemické subjekty.

Tato kapitola představuje čtyři kanonické pozice — Alvina Goldmana (veritism a sociální reliabilismus), Mirandu Fricker (epistemická nespravedlnost), Helen Longino (kritický kontextový empirismus) a Elizabeth Anderson (demokratická epistemologie) — a explicitně mapuje jejich vztah k taxonomii EA.

## 1. Alvin Goldman — veritism a sociální reliabilismus

### 1.1 Veritistická epistemologie

Alvin Goldman je **klíčovou** postavou anglo-saské sociální epistemologie. V *Knowledge in a Social World* (1999) formuluje **veritistickou** pozici: **primárním** epistemickým cílem je **pravda** (true belief), a sociální praktiky lze hodnotit podle toho, **jak efektivně** generují true beliefs ve své komunitě.

Klíčové komponenty:

- **Veritistická hodnota** — sociální praktika má pozitivní veritistickou hodnotu, pokud zvyšuje proporci true beliefs v populaci
- **Reliabilita** — kognitivní proces je epistemicky validní, pokud generuje pravdivá přesvědčení s vysokou frekvencí
- **Sociální reliabilismus** — extension reliabilismu na **sociální** procesy (testimony, peer review, demokratické deliberace)

### 1.2 Implikace pro EA taxonomii

Goldmanova perspektiva poskytuje kompendiu **kvantitativní** kritérium pro hodnocení EA technik:

| EA technika | Veritistická hodnota |
|-------------|------------------------|
| Selektivní expozice ([EA-1.1.1](/kompendium/techniques/ea-1-1-1-selektivni-expozice/)) | **Strongly negativní** — systematicky redukuje pravdivost přesvědčení |
| Falešné dilema ([EA-1.2.1](/kompendium/techniques/ea-1-2-1-falesne-dilema/)) | **Negativní** — vynucuje volbu mezi nepravdivými alternativami |
| Imunizace proti falsifikaci | **Strongly negativní** — chrání falešná přesvědčení před opravou |
| Tematická diverze | **Negativní** — odvádí od pravdivosti |
| Prosodická dominance | **Negativní** — váží přesvědčení podle síly hlasu, nikoli pravdivosti |

EA techniky lze **operacionalizovat** jako sociální praktiky se **systematicky negativní** veritistickou hodnotou — tj. praktiky, jež **systematicky** snižují podíl true beliefs v populaci, jež je jim vystavena.

### 1.3 Bayesovský update a sociální reliabilismus

Goldman dále rozvíjí **bayesovský** model sociální epistemologie: agent updateuje svá přesvědčení podle pravděpodobností přiřazených zdrojům informací. Spolehlivý zdroj generuje silnější update; nespolehlivý slabší.

Pro [Decision Engine](/glossary/decision-core/) Prismatic platformy je tento rámec **přímo aplikovatelný**:

- **Source diversity check** ↔ Goldmanova analýza, že agregace více nezávislých zdrojů zvyšuje veritistickou hodnotu
- **Confidence calibration** ↔ Goldmanův princip váženého update podle reliability zdroje
- **Provenance Mandatory** ([NABLA](/glossary/nabla-infinity/) Axiom 7) ↔ Goldmanova analýza, že **traceabilita** je nutnou podmínkou rationálního update

### 1.4 Limity Goldmanova rámce pro EA

Veritistická perspektiva má **dvě signifikantní** limity:

1. **Mocenská asymetrie** je v Goldmanově rámci **téměř neviditelná**. Veritism abstrahuje od skutečnosti, že distribuce epistemických zdrojů (přístup k informacím, kapacita k jejich zpracování, sociální legitimace) je **systematicky nerovnoměrná**. Frickerová (sekce 1.2) tuto mezeru explicitně řeší.
2. **Strukturální dimenze** — Goldman analyzuje **individuální** kognitivní procesy a **agregaci** individuálních přesvědčení. Strukturální fenomény (algoritmická amplifikace, kulturní kódování epistemických norem) zůstávají v jeho rámci nedostatečně rozpracované. Longino (sekce 1.3) tuto dimenzi explicitně tematizuje.

## 2. Miranda Fricker — epistemická nespravedlnost

### 2.1 Centrální pojem

Mirandy Frickerové kniha *Epistemic Injustice* (2007) představuje pro kompendium EA **bezprecedentní teoretický zdroj** — analyticky přesný rámec pro diagnostiku **strukturálních** mocenských asymetrií, jež **systematicky znevýhodňují** některé epistemické subjekty.

Frickerová rozlišuje **dva** centrální typy epistemické nespravedlnosti:

### 2.2 Testimoniální nespravedlnost

> *Testimoniální nespravedlnost** nastává, když posluchač přiřadí mluvčímu **deficitní úroveň důvěryhodnosti** kvůli identitnímu předsudku.*

Komponenty:

- **Identitní předsudek** (gender, rasa, třída, věk, zdravotní stav, akademická hierarchie...)
- **Systematická diskontace důvěryhodnosti** podle této identity
- **Strukturální** charakter — testimoniální nespravedlnost není individuální chybou, ale **vzorcem** napříč interakcemi

Příklady:

| Kontext | Testimoniální nespravedlnost |
|---------|--------------------------------|
| Akademie | Studentka filozofie je systematicky diskontována jako "subjektivní" |
| Klinika | Pacientka s chronickou bolestí je diskontována jako "hysterická" |
| Soud | Svědectví menšinového obviněného je diskontováno jako "nespolehlivé" |
| Profese | Stížnost na harassment je diskontována jako "přehnaná" |

### 2.3 Hermeneutická nespravedlnost

> *Hermeneutická nespravedlnost** nastává, když chybějí **konceptuální zdroje** k artikulaci určité zkušenosti — typicky proto, že dominantní hermeneutické zdroje byly formovány v zájmech mocenských skupin.*

Klasický příklad Frickerové: **sexuální harassment** byl strukturální zkušeností desítky let, **dříve** než pro něj existovala konceptuální kategorie. Oběti tedy nemohly **artikulovat** svou zkušenost jako specifickou formu nespravedlnosti — zůstávala v hermeneutické "tmě".

### 2.4 Direktní vztah k EA

Fricková nabízí kompendiu **fundamentální** rámec:

| EA dimenze | Frickerová kategorie |
|------------|------------------------|
| [Delegitimizace ekvivalencí](/kompendium/03-zakladni-kategorie/) (3.5) | **Testimoniální nespravedlnost** — předsudkem motivovaná diskontace mluvčího |
| Akademická manipulace | **Testimoniální** — váhování argumentu podle akademické hierarchie, nikoli kvality |
| Marginalizace whistleblowerů | **Testimoniální** — institucionalizovaná diskontace |
| Absence konceptu pro EA samotnou | **Hermeneutická** — kompendium ji explicitně řeší (!) |

### 2.5 Kompendium jako hermeneutický akt

**Klíčové uvědomění**: kompendium EA samotné je **hermeneutickým aktem** ve Frickerově smyslu. Vytváří **konceptuální zdroje** (notační systém EA-X.Y.Z, taxonomické kategorie, diferenciální markery), jež umožňují **artikulovat** zkušenosti, jež doposud zůstávaly v hermeneutické tmě.

Subjekt, jenž byl chronicky vystaven **gaslightingu**, **terminologické mystifikaci** a **iluzorní komplexitě**, často **postrádá** konceptuální aparát pro pojmenování své zkušenosti. Kompendium tento aparát poskytuje — a tím přispívá k **redukci hermeneutické nespravedlnosti**.

### 2.6 Epistemická ctnost a vice

Fricková dále rozvíjí **virtue-epistemologickou** dimenzi: existují **epistemické ctnosti** (zejména **testimoniální spravedlnost** a **hermeneutická senzitivita**) a **vice** (předsudečná diskontace, hermeneutická lhostejnost). Pro klinickou praxi (sekce 06) to znamená:

- Terapeut musí kultivovat **testimoniální spravedlnost** vůči pacientovi (akceptování validity jeho narativu)
- Terapeut musí být **hermeneuticky senzitivní** — rozpoznávat, kdy pacient artikuluje něco, pro co nemá adekvátní pojmosloví, a poskytovat hermeneutické zdroje (vč. kompendia EA)

## 3. Helen Longino — kritický kontextový empirismus

### 3.1 Sociální podmínky objektivity

Helen Longino v *Science as Social Knowledge* (1990) a *The Fate of Knowledge* (2002) formuluje **kritický kontextový empirismus** (CCE) — pozici, podle níž je vědecká objektivita **strukturálně sociální** vlastností, nikoli individuální.

Klíčové podmínky objektivity podle Longino:

1. **Veřejná dostupnost** kanálů kritiky
2. **Responsivita** ke kritice
3. **Veřejně sdílené standardy** evaluace
4. **Zmocněná rovnost** intelektuální autority

Pokud tyto podmínky nejsou splněny, sociální epistemická praktika **degeneruje** — bez ohledu na individuální dobré úmysly účastníků.

### 3.2 Aplikace na EA

Longino poskytuje kompendiu **strukturální** kritérium pro identifikaci patologicky operujících epistemických komunit. EA techniky lze nyní **strukturálně** klasifikovat podle toho, **kterou** z Longinových podmínek narušují:

| EA technika | Narušená podmínka |
|-------------|---------------------|
| Cenzura kritiků | Veřejná dostupnost kanálů kritiky |
| Ignorování kontradiktorní evidence | Responsivita ke kritice |
| Terminologická mystifikace | Veřejně sdílené standardy |
| Akademická hierarchie umlčující studenty | Zmocněná rovnost autority |
| Imunizace proti falsifikaci | Responsivita + veřejné standardy |
| Algoritmické filtrace | Veřejná dostupnost kanálů |

### 3.3 Color Teams jako Longino-implementation

Architektura **[Color Teams](/glossary/color-teams/)** v Prismatic platformě **přímo implementuje** Longino podmínky:

- **Red Team** zajišťuje veřejnou dostupnost kanálů kritiky (institucionalizovaná adversariální role)
- **Blue Team** zajišťuje responsivitu (povinnost reagovat na Red Team kritiku)
- **Purple Team** zajišťuje sdílené standardy (synthetizující meta-evaluaci)
- Symetrická struktura zajišťuje zmocněnou rovnost

### 3.4 Hodnotová neutralita: kritická revize

Longino kriticky revidoval pojem **hodnotové neutrality** vědy. Argumentuje, že **neutralita** je nedosažitelná — všechny vědecké rámce nutně vtělují **hodnotové předpoklady**. Klíčem není neutralita, ale **transparentnost** těchto předpokladů a **otevřenost** ke kritice.

Pro kompendium EA to má fundamentální důsledek: **kompendium samotné** vtěluje hodnotové předpoklady (závazek k epistemické integritě, k autonomii subjektu, k otevřené komunikaci). Tyto předpoklady jsou **explicitně deklarovány** ([2.5 Filosofický rámec](/kompendium/02-uvod/filosoficky-ramec/), [Filozofie: Epistemic Integrity](/philosophy/epistemic-integrity/)) — nikoli skryté pod fasádou "neutrality".

## 4. Elizabeth Anderson — demokratická epistemologie

### 4.1 Demokratická epistemologie a její podmínky

Elizabeth Anderson rozvíjí (zejména v *The Imperative of Integration*, 2010, a v četných článcích) **demokratickou epistemologii** — pozici, podle níž epistemicky zdravá společnost vyžaduje:

1. **Diversity** participantů
2. **Equality** v jejich epistemické autoritě
3. **Effective inclusion** marginalizovaných perspektiv
4. **Trust** mezi participanty
5. **Truth-conducive** institutions

### 4.2 Epistemická segregace

Anderson v *The Imperative of Integration* poskytuje kompendiu fundamentální koncept **epistemické segregace**: mocenské asymetrie produkují **systematicky oddělené** epistemické komunity, jež si **mezi sebou** nedůvěřují, **navzájem** se nečtou a **vzájemně** delegitimizují.

Pro EA to znamená:

- Mnohé EA techniky operují **populačně** — produkují **epistemicky segregované** subkomunity
- **Algoritmická bublina** je strukturálním analogem rasové segregace
- Důsledkem je **kolektivní hermeneutická chudoba** — společnost ztrácí kapacitu sdílet pojmosloví, hodnoty a interpretační rámce

### 4.3 Whistleblowing a institucionální epistemika

Anderson rozvíjí **etiku whistleblowingu** (např. *Whistleblowing as a Practice of Epistemic Justice*) — argumentuje, že whistleblower je **klíčovou** postavou demokratické epistemologie, neboť přerušuje institucionální imunizaci proti kritice.

Pro EA to má klíčový význam: **institucionální delegitimizace whistleblowerů** je zpravidla rozeznatelnou kategorií EA technik (kombinace testimoniální nespravedlnosti, prosodické dominance autorit a strukturální cenzury).

## 5. Komparativní syntéza čtyř pozic

| Dimenze | Goldman | Fricker | Longino | Anderson |
|---------|---------|---------|---------|----------|
| **Centrální pojem** | Veritistická hodnota | Epistemická nespravedlnost | Kritický kontextový empirismus | Demokratická epistemologie |
| **Hlavní přínos pro EA** | Kvantitativní hodnocení EA technik | Identifikace strukturálních asymetrií | Strukturální podmínky integrity | Společenský horizont integrace |
| **Slabina** | Slepota k mocenským asymetriím | Limitovaná operacionalizace | Idealizovaná představa vědy | Limitovaná implementace |
| **Architektonická implementace v Prismatic** | Decision Engine source weighting | Hermeneutický aparát kompendia | Color Teams | Cross-team collaboration |

## 6. Limity sociální epistemologie

Sociální epistemologie samotná **není dostačující** pro pokrytí fenoménů EA:

1. **Subjektivní zkušenost** — sociální epistemologie je převážně **strukturální** disciplínou; subjektivní fenomenologie traumatu (kapitola 7.2) zůstává mimo její primární záběr
2. **Klinická intervence** — sociální epistemologie analyzuje, ale primárně **neintervenuje**; klinická aplikace (sekce 06) vyžaduje další teoretické zdroje
3. **Kulturní specificita** — drtivá většina sociálně-epistemologických rámců je formulovaná v anglo-saském kontextu; cross-kulturní validace je limitovaná

## 7. Integrace do kompendia

Sociálně-epistemologické rámce jsou v kompendiu integrovány **napříč**:

- **Notační systém EA-X.Y.Z** ↔ Frickerová hermeneutický akt
- **Decision Engine** ↔ Goldman veritism + bayesovský update
- **Color Teams** ↔ Longino strukturální podmínky integrity
- **Cross-team collaboration** ↔ Anderson demokratická epistemologie
- **Klasifikace technik delegitimizace** (3.5) ↔ Frickerová testimoniální nespravedlnost

## Související

- [7. Teoretické reflexe (index)](/kompendium/07-teoreticke-reflexe/)
- [7.1 Filosofický rámec EA](/kompendium/07-teoreticke-reflexe/filosoficky-ramec/)
- [7.2 Vztah k epistemickému traumatu](/kompendium/07-teoreticke-reflexe/epistemicke-trauma/)
- [7.4 EA a postmodernismus](/kompendium/07-teoreticke-reflexe/postmodernismus/)
- [2.5 Filosofický rámec](/kompendium/02-uvod/filosoficky-ramec/)
- [2.3 Teoretické základy](/kompendium/02-uvod/teoreticke-zaklady/)
- [2.1 Definice](/kompendium/02-uvod/definice/)
- [Sekce 03 — Základní kategorie](/kompendium/03-zakladni-kategorie/)
- [Sekce 06 — Klinické aplikace](/kompendium/06-klinicke-aplikace/)
- [Glosář: Epistemická anihilace](/glossary/epistemicka-anihilace/)
- [Glosář: Kognitivní anihilace](/glossary/kognitivni-anihilace/)
- [Glosář: Anankastický režim](/glossary/anankasticky-rezim/)
- [Glosář: Epistemická alienace](/glossary/epistemicka-alienace/)
- [Glosář: Fenomenologie](/glossary/fenomenologie/)
- [Glosář: Hermeneutika](/glossary/hermeneutika/)
- [Glosář: Metakognice](/glossary/metakognice/)
- [Glosář: Falsifikace](/glossary/falsifikace/)
- [Glosář: Lakatosův výzkumný program](/glossary/lakatos-vyzkumny-program/)
- [Glosář: Dual-use poznání](/glossary/dual-use-poznani/)
- [Glosář: Epistemické trauma](/glossary/epistemicke-trauma/)
- [Glosář: Gaslighting](/glossary/gaslighting/)
- [Glosář: Delegitimizace](/glossary/delegitimizace/)
- [Glosář: NABLA Infinity](/glossary/nabla-infinity/)
- [Glosář: Color Teams](/glossary/color-teams/)
- [Glosář: Decision Core](/glossary/decision-core/)
- [Filozofie: Intellectual Sovereignty](/philosophy/intellectual-sovereignty/)
- [Filozofie: Epistemic Integrity](/philosophy/epistemic-integrity/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
