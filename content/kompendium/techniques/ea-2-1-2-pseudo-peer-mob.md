+++
title = "EA-2.1.2 Pseudo-peer mob"
description = "Detailní per-technique článek: technika pseudo-peer mob — koordinovaný útok skupiny prezentující se jako spontánní kolektivní reakce kolegů."
weight = 212
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-1-2", "pseudo-peer-mob", "delegitimizace", "expertni-diskvalifikace", "koordinovany-utok"]
categories = ["academic"]

[extra]
related_terms = ["ea-2-1-1-expertni-disinflation", "ea-2-1-10-credentials-rekonfigurace", "ea-2-1-3-credentialing-attack", "ea-2-1-4-publikacni-blokace"]
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

Technika exploituje **bayesovskou heuristiku** přihlížejícího: pokud N nezávislých expertů kritizuje X, je pravděpodobnost, že X je problematický, vysoká. Když je nezávislost iluzí, je [heuristika](@/glossary/heuristika.md) **systematicky klamná**.

## Struktura vzorce

Pseudo-peer mob se pozná podle rozporu mezi zdáním a doložitelnou nezávislostí: kritika přichází z mnoha stran, ale sdílí časování, formulace a okruh zdrojů. Pro přihlížejícího je přitom nezávislost rozhodující — počet hlasů má váhu jen tehdy, pokud se k témuž závěru dospělo odděleně. Noelle-Neumann (1974) popsala, co se děje, jakmile se jeden názor jeví jako převažující: nositelé opačného stanoviska mlčí, čímž převahu dále zdánlivě posilují.

Retrospektivně se dá rozlišit, v jakém pořadí znaky vystupují. Nejdříve bývá doložitelné jádro, které spolu komunikovalo mimo veřejný prostor. Pak se ukáže shoda ve slovníku a stavbě námitek, aniž by si je jednotliví autoři zjevně předávali. Následuje vlna vystoupení v krátkém časovém okně, po ní druhá vlna skutečně spontánní, která už ale pracuje s rámcem nastaveným první. Nakonec jsou třetí strany — redakce, instituce — dotázány na stanovisko a zdánlivá shoda odborníků je nutí brát věc vážně. Asch (1956) doložil, že i zjevně chybný většinový soud posune úsudek jednotlivce, a že stačí jediný nesouhlasící hlas, aby účinek zeslábl. Popsané pořadí je pozorovaný sled znaků, nikoli postup.

Detekční markery zachycené níže odpovídají téže struktuře: shodné formulace napříč autory, účastníci bez předchozí publikační stopy v daném tématu, hustá vzájemná propojenost a mlčení k věcným protiargumentům. Lewandowsky a kol. (2012) upozorňují, že opakování samo zvyšuje důvěryhodnost tvrzení nezávisle na jeho obsahu — proto působí i opakování z jednoho zdroje, rozdělené do mnoha hlasů.

*Interpretace knihy*: shodná kritika z více stran může být prostě správná a koordinace sama není proviněním. Rozlišujícím znakem je přiznaná organizovanost — zda je zřejmé, kdo vystoupení inicioval a jak vzniklo. Kde se organizovanost zastírá, nenese počet hlasů žádnou informaci o věci (Asch, 1956).

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

## Literatura

- Asch, S. E. (1956). Studies of independence and conformity: A minority of one against a unanimous majority. *Psychological Monographs: General and Applied*, 70(9).
- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., & Cook, J. (2012). Misinformation and its correction: Continued influence and successful debiasing. *Psychological Science in the Public Interest*, 13(3).
- Noelle-Neumann, E. (1974). The spiral of silence: A theory of public opinion. *Journal of Communication*, 24(2).

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
- **Filozofie**:
  - [Epistemic Integrity](@/philosophy/epistemic-integrity.md)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md)
