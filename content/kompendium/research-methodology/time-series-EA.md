+++
title = "Časové řady a ekologické momentové hodnocení"
description = "Intenzivní opakované měření v běžném životě: jak sledovat kolísání důvěry ve vlastní vnímání, spouštěče a zotavení metodou ESM/EMA a modely časových řad."
weight = 16

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["longitudinal-study-EA", "network-analysis-EA", "causal-inference-EA", "data-security-EA-research"]
toc = true
+++

Mnoho prožitků spojených s [epistemickou anihilací](@/glossary/epistemicka-anihilace.md) se
mění ze dne na den i z hodiny na hodinu: nejistota o tom, co se skutečně stalo, vlna studu po
telefonátu s bývalým partnerem, „mlha“ po setkání s autoritou skupiny. Retrospektivní dotazník
tyto výkyvy zprůměruje. Intenzivní longitudinální metody je zachytí v reálném čase a v běžném
prostředí člověka.

## Vymezení

**Metoda vzorkování zkušenosti** (*experience sampling method*, ESM) a **ekologické
momentové hodnocení** (*ecological momentary assessment*, EMA; Shiffman, Stone a Hufford 2008)
označují opakované krátké dotazování během dne, obvykle přes mobilní telefon, po dobu dnů
až týdnů. Vedle náhodných či pravidelných výzev existuje záznam vázaný na událost („vyplňte
po každém kontaktu s…“). Data mají podobu **časové řady** pro každého účastníka. Analyzují
se víceúrovňovými modely (rozlišení variability mezi lidmi a uvnitř člověka) a dynamickými
modely, které odhadují, jak stav v jednom okamžiku souvisí se stavem v dalším.

Příbuzné jsou **designy jednoho případu** a **přerušené časové řady**, kde se srovnává průběh
před zásahem a po něm – například před zahájením terapie a po něm, nebo na populační úrovni
před změnou pravidel platformy a po ní.

## Kdy metodu použít

- **Spouštěče a jejich dynamika**: co předchází epizodám nejistoty o vlastním vnímání –
  kontakt s určitou osobou, konflikt, únava ([kognitivní mlha](@/kompendium/detection-signatures/25-phenomenological-cognitive-fog.md),
  [skok sebepochybnosti](@/kompendium/detection-signatures/26-phenomenological-self-doubt-spike.md)).
- **Mechanismus zotavení**: zda dny s více sociálním kontaktem předcházejí dnům s větší
  důvěrou ve vlastní úsudek, nebo naopak.
- **Jemné sledování účinku zásahu** u jednotlivce, např. nácviku [uzemňovacích technik](@/kompendium/self-defense-guides/14-grounding-techniques.md).
- **Populační změny v čase**: např. objem sdílení určitého narativu před zásahem platformy a po něm.

## Postup

1. **Otázka na úrovni člověka.** ESM odpovídá na otázky typu „když je u tohoto člověka X
   vyšší než obvykle, je pak Y vyšší?“ – ne na otázky o rozdílech mezi lidmi.
2. **Protokol výzev.** Počet výzev denně, délka sledování, okno pro odpověď. Je to kompromis
   mezi jemností dat a zátěží; nadměrná frekvence vede k únavě a mechanickým odpovědím.
3. **Krátké položky.** Jedna až dvě položky na konstrukt, ověřené na citlivost ke změně.
   Položky nemají obsahovat hodnoticí nálepky a mají fungovat i na malé obrazovce.
4. **Pilot** se sledováním míry odpovědí a zpětnou vazbou účastníků.
5. **Analýza**: víceúrovňové modely, oddělení efektů mezi lidmi a uvnitř člověka,
   ošetření časového trendu (odstranění trendu před analýzou autokorelace), modely
   s časovým zpožděním; u designů jednoho případu vizuální analýza doplněná statistikou.
6. **Zacházení s chybějícími výzvami** – chybějí často nenáhodně (člověk neodpoví právě
   v nejhorších chvílích).

## Specifika výzkumu epistemické manipulace

**Telefon jako bezpečnostní riziko.** Aplikace s otázkami o manipulaci na telefonu, který
může kontrolovat druhá osoba, účastníka ohrožuje. Studie s lidmi, kteří jsou stále v rizikovém
vztahu, vyžadují nenápadný vzhled aplikace, neutrální upozornění, zámek, možnost rychlého
skrytí a lokální šifrování (viz [datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md)).
Někdy je správné rozhodnutí takové lidi do ESM studie nezařazovat a zvolit jinou metodu.

**Reaktivita.** Opakované otázky na nejistotu o vlastní paměti mohou nejistotu zesilovat –
nebo naopak sloužit jako užitečná sebereflexe a „paměťový archiv“
([paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md)). Reaktivitu je
třeba měřit a hlásit.

**Záznam jako podpora reality.** Pro lidi, jimž bylo soustavně zpochybňováno vnímání, může
být vlastní časově razítkovaný záznam mimořádně cenný. To je výhoda pro účastníka, ale
zároveň zdroj zkreslení: účastníci se mohou začít chovat jinak, protože si vedou záznam.

**Malé efekty uvnitř člověka.** Souvislosti mezi okamžiky jsou obvykle slabé; analýza síly
testu pro víceúrovňové designy je proto nutná ([analýza síly testu](@/kompendium/research-methodology/power-analysis-EA.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Protokol | počet a rozložení výzev, okno odpovědi, délka sledování |
| Položky | zdroj, citlivost ke změně, reliabilita uvnitř člověka |
| Odpovídání | míra odpovědí, její pokles v čase, souvislost s obsahem |
| Analýza | oddělení úrovní, ošetření trendu a autokorelace |
| Reaktivita | ověření, zda se odpovědi mění s délkou účasti |
| Bezpečnost | popis ochrany zařízení a dat |

## Etika a ochrana účastníků

Na začátku se s účastníkem probírá, kdo má k jeho telefonu přístup a zda je účast bezpečná.
Aplikace obsahuje trvale dostupný kontakt na pomoc. Je třeba předem stanovit, co se stane,
když odpovědi naznačí akutní riziko (sebepoškození, násilí): ESM data se zpravidla nesledují
v reálném čase, a proto účastník musí vědět, že aplikace není krizová služba. Pokud studie
monitorování v reálném čase slibuje, musí mít kapacitu na něj reagovat (viz
[akutní suicidální riziko](@/kompendium/emergency-protocols/2-suicide-risk-EA.md)).

## Časté chyby

- interpretace souvislosti mezi lidmi jako souvislosti uvnitř člověka (a naopak);
- ignorování časového trendu, který vytvoří zdánlivé souvislosti;
- příliš mnoho výzev a pak analýza jen „spolehlivých“ účastníků;
- standardní aplikace s výrazným názvem studie na zařízení účastníka v rizikovém vztahu.

## Ilustrativní příklad

*Hypotetický návrh.* Dospělí v prvním roce po odchodu z kontrolujícího párového vztahu
odpovídají po dobu tří týdnů čtyřikrát denně na krátké otázky: jak jistě si pamatují
poslední důležitý rozhovor, jak moc se stydí, zda byli v kontaktu s bývalým partnerem
a s blízkými lidmi. Víceúrovňový model může ukázat, že kontakt s bývalým partnerem předchází
poklesu jistoty a kontakt s blízkými jejímu vzestupu. Takový výsledek by podpořil doporučení
týkající se [vztahových kotev](@/kompendium/self-defense-guides/42-relational-anchors.md) –
ale jen jako hypotéza, kterou je třeba ověřit dalším designem.

## Jak číst studii tohoto typu

Intenzivní data působí „blízko k životu“, a proto se jim snadno věří víc, než unesou. Při
čtení je užitečné ověřit:

- **Kolik výzev lidé skutečně vyplnili** a zda chybějící odpovědi souvisejí s obsahem.
  Pokud lidé neodpovídají ve chvílích největšího stresu, data systematicky podhodnocují
  nejtěžší okamžiky.
- **Zda jsou výsledky uvnitř člověka a mezi lidmi odděleny.** Tvrzení „když je člověk
  osamělejší, pochybuje víc o své paměti“ je jiné než „osamělejší lidé pochybují víc“.
  Ze stejných dat mohou vyjít opačná znaménka.
- **Jak byly položky vybrány a ověřeny.** Jednopoložkové míry jsou v ESM běžné, ale jejich
  reliabilita má být doložena.
- **Jaké bylo časové zpoždění v modelu.** Souvislost „o několik hodin později“ závisí na
  rozestupu výzev; při jiném rozestupu může vyjít jinak.
- **Zda se zkoumala reaktivita** – tedy zda samotné měření neovlivnilo to, co se měřilo.
- **Jak byla zajištěna bezpečnost účastníků.** U citlivých populací by zpráva měla popsat,
  jak se předcházelo riziku odhalení účasti.

U designů jednoho případu (jeden klient, opakované měření před zásahem a po něm) platí, že
přesvědčivost roste se stabilní výchozí fází, s opakováním efektu při opakovaném zavedení
zásahu a s replikací u dalších klientů. Jediná křivka jednoho člověka je cenný klinický
údaj, ale ne důkaz účinnosti metody.

## Meze a otevřené otázky

ESM zachytí kolísání, ne pomalé změny v řádu let – na ně jsou [longitudinální studie](@/kompendium/research-methodology/longitudinal-study-EA.md).
Kauzální výklad souvislostí s časovým zpožděním je omezený (viz
[kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md)). Otevřenou
otázkou je, jak bezpečně studovat lidi právě v období, kdy jsou manipulaci vystaveni, aniž
by je výzkum ohrozil.

## Literatura

- Shiffman, S., Stone, A. A., Hufford, M. R. (2008). Ecological momentary assessment.
- Csikszentmihalyi, M., Larson, R. (1987). Validity and reliability of the Experience-Sampling Method.
- Box, G. E. P., Jenkins, G. M. (1970). *Time Series Analysis: Forecasting and Control.*

## Související

**Metody v této sekci**

- [Longitudinální studie](@/kompendium/research-methodology/longitudinal-study-EA.md) – pomalé změny v řádu měsíců a let.
- [Síťová analýza](@/kompendium/research-methodology/network-analysis-EA.md) – sítě prožitků odhadnuté z časových řad.
- [Datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md) – ochrana zařízení a dat.

**Detekční signatury**

- [Kognitivní mlha](@/kompendium/detection-signatures/25-phenomenological-cognitive-fog.md) – kolísající prožitek, který ESM zachytí.
- [Temporální dezorientace](@/kompendium/detection-signatures/29-phenomenological-temporal-disorientation.md) – narušení časové orientace.

**Sebeobrana**

- [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) – záznam jako opora vlastního vnímání.
- [Vztahové kotvy](@/kompendium/self-defense-guides/42-relational-anchors.md) – lidé, kteří pomáhají ukotvit realitu.

**Pojmy**

- [Reality testing](@/glossary/reality-testing.md) – ověřování vnímání proti vnějším oporám.
