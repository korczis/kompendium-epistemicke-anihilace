+++
title = "EA-2.1.2 Pseudo-peer mob"
description = "Detailní per-technique článek: technika pseudo-peer mob — koordinovaný útok skupiny prezentující se jako spontánní kolektivní reakce kolegů. Operační modus, fenomenologie, detekční markery, neutralizace."
weight = 212
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-1-2", "pseudo-peer-mob", "delegitimizace", "expertni-diskvalifikace", "koordinovany-utok"]
categories = ["academic"]

[extra]
related_terms = ["ea-2-1-1-expertni-disinflation", "ea-2-1-10-credentials-rekonfigurace", "ea-2-1-3-credentialing-attack", "ea-2-1-4-publikacni-blokace"]
parent = "kompendium-techniques"
ea_code = "EA-2.1.2"
ea_category = "2. Scénáře delegitimizace"
ea_subcategory = "2.1 Expertní diskvalifikace"
section_icon = "🎓"
toc = true
access_level = "L2"
risk_level = "high"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-2/"
+++

# EA-2.1.2 Pseudo-peer mob

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-2.1.2` |
| **Kategorie** | 2. Scénáře epistemické delegitimizace |
| **Subkategorie** | 2.1 Expertní diskvalifikace |
| **Přístupová úroveň** | L2 (pokročilá) |
| **Riziková úroveň** | Vysoká — produkuje iluzi konsensu, masivní reputační tlak |
| **Reverzibilita** | Nízká — sociální paměť útoku přetrvává |
| **Rodičovská kapitola** | [Kapitola 2 — Scénáře delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) |

## Definice

**Pseudo-peer mob** je koordinovaný útok skupiny, který je strukturálně **inscenován jako spontánní kolektivní reakce** kolegů (peers) cílového experta. Klíčový rozdíl oproti legitimní peer kritice spočívá v **organizaci**: útok je předem koordinován co do načasování, formulace a kanálů, ale prezentován jako organická konvergence nezávislých expertů.

Technika exploituje **bayesovskou heuristiku** přihlížejícího: pokud N nezávislých expertů kritizuje X, je pravděpodobnost, že X je problematický, vysoká. Když je nezávislost iluzí, je heuristika **systematicky klamná**.

## Operační modus

### Krok 1 — Etablování koordinačního jádra

Iniciátor (často soukromou komunikací — DM skupiny, mailing list, chat) **mobilizuje skupinu** kolegů sdílejících antipatii vůči cíli nebo společný strategický zájem.

### Krok 2 — Synchronizace narativu

Skupina **konverguje na společné formulace** — klíčová slova, frázování, "talking points". Žádný účastník nemusí znát plný plán; stačí, když souhlasí s několika body.

### Krok 3 — Distribuovaný launch

Útok je **kvazi-simultánně** publikován z různých účtů, časopisů, blogů. Dojem **nezávislé konvergence** je strukturálně klamný.

### Krok 4 — Amplifikace prostřednictvím retweetů

Druhá vlna účastníků (kteří nemusí být součástí koordinace) **přidává svou váhu** — sdílí, "thread", komentuje. Tato vlna je **autentická**, ale celé pole je již **rámováno** koordinovanou první vlnou.

### Krok 5 — Žádost o stanovisko

Třetí strany (média, instituce) jsou **dotazovány**, jak hodnotí situaci. Vzhledem k zdánlivé peer-konvergenci jsou **nuceny** brát útok vážně.

## Fenomenologické znaky

Co prožívá oběť pseudo-peer mob:

- **Pocit obklíčení** — zdánlivě ze všech stran současně
- **Iluze distribuovanosti** — útok vypadá jako **konsenzus**, ne jako koordinace
- **Disorientace v sítí** — kolegové, kteří dříve podporovali, se distancují nebo mlčí
- **Difikulta odpovědi** — na N útoků nelze odpovědět individuálně, agregovaná odpověď působí jako paranoidní
- **Časová tíseň** — vlna se šíří rychleji než je možné formulovat racionální odpověď
- **Sebepochybnost** — pokud N kolegů něco říká, neměl bych zvážit, že mají pravdu?

## Detekční markery

| Marker | Indikuje |
|--------|----------|
| **Synchronizovaný timing** publikací (řádově hodiny) | Koordinace |
| **Identické frázování** napříč účastníky | Sdílený "talking points" dokument |
| Účastníci **nikdy předtím** nepublikovali ke kritizovanému tématu | Mobilizace, ne expertíza |
| **Sociální propojení** účastníků (Twitter following, citace) | Existence koordinačního jádra |
| **Eskalační sekvence** — od mírnějších k ostřejším formulacím | Plánovaný build-up |
| Účastníci **nezareagují** na věcné protiargumenty | Účel je delegitimizace, ne diskuse |
| **Hashtag/tag konvergence** | Koordinovaná amplifikace |

## Rizikové kontexty

| Kontext | Manifestace |
|---------|-------------|
| **Sociální média** | Twitter/X dogpile, koordinované thready |
| **Akademické debaty** | Open letters s desítkami signatářů publikované simultánně |
| **Recenzní procesy** | Koordinované negativní recenze v jednom časopise |
| **Konference** | Skupinové bojkoty, koordinované otázky během prezentace |
| **Media pile-on** | Synchronizované publikační vlny v opinion sekcích |
| **Whistleblower retaliation** | Koordinovaná diskreditace bývalého kolegy |

## Neutralizační strategie

### Individuální

1. **Network analysis** — zmapuj sociální propojenost účastníků. Pokud existuje hustá síť, je to indikátor koordinace.
2. **Time-stamp analysis** — porovnej timing publikací. Klastrování v časových oknech indikuje koordinaci.
3. **Linguistic forensics** — porovnej formulace. Identické fráze přes vícero zdrojů jsou silným indikátorem.
4. **Substantive response** — odpověz **substantivně** na nejsilnější argumenty, ne na celý mob. Vystavuje slabost ostatních.
5. **Allies activation** — kontaktuj nezávislé kolegy s prosbou o **veřejné stanovisko k věci**, ne o obranu osoby.

### Institucionální

| Strategie | Implementace |
|-----------|--------------|
| **Coordination policy** | Profesní etika **explicitně** zakazuje koordinované peer útoky bez disclosure |
| **Open letter standards** | Open letters musí **jmenovat** organizátora a proces signing |
| **Forensic capability** | Instituce mají kapacitu pro **network forensics** v případech harassmentu |
| **Sanction precedent** | Účast v koordinovaném útoku **má profesní následky** |

## Vztah k jiným technikám

### Často se kombinuje s

- **[EA-2.1.1 Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md)** — mob jako distribuční mechanismus disinflace.
- **[EA-2.3.4 Mob coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md)** — mediální variace.
- **[EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)** — strukturální paralela.

### Eskaluje do

- **[EA-2.4.4 Leadership capture](@/kompendium/techniques/ea-2-4-4-leadership-capture.md)** — když mob získá institucionální autoritu.
- **[Scénář B](@/kompendium/03-zakladni-kategorie/kapitola-2.md)** — pedagogická koercion na komunitní úrovni.

## Vztah k Prismatic platformě

- **OSINT framework koordinační detekce** — pipelines analyzují **synchronizované publikační vzory** napříč sociálními sítěmi a flagují koordinované kampaně.
- **NABLA Infinity** epistemická citační síť rozlišuje **nezávislé** od **kolinearních** zdrojů.
- **Decision Engine** — penalizuje rozhodnutí založená na zdrojích s vysokou interní korelací (proxy pro koordinaci).

## Související

- **Rodičovská kapitola**: [Kapitola 2 — Scénáře delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md)
- **Sourozenecké techniky** (subkategorie 2.1):
  - [EA-2.1.1 Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md)
  - [EA-2.1.3 Credentialing attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md)
  - [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
- **Glossary**:
  - [Delegitimizace](@/glossary/delegitimizace.md)
  - [Taxonomie EA](@/glossary/taxonomie-ea.md)
  - [Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
- **Související platformové koncepty**:
  - {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }}
  - [NABLA Infinity](@/glossary/nabla-infinity.md)
- **Filozofie**:
  - [Epistemic Integrity](@/philosophy/epistemic-integrity.md)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
