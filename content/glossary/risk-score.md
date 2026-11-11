+++
title = "Risk score (rizikové skóre)"
weight = 9
description = "Číselné hodnocení bezpečnostního rizika jednotlivého aktiva nebo zjištění, vždy s mírou důvěry a řetězcem důkazů."

[taxonomies]
tags = ["glossary", "security", "due-diligence", "evidence"]

[extra]
category = "security"
related_terms = ["blue-team", "purple-team", "due-diligence", "sanctions-screening"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Risk", "Score", "Numeric", "glossary", "security", "Monte Carlo"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Risk score (rizikové skóre) – glosář"
+++

## Definice

Rizikové skóre (*risk score*) je číselná hodnota, která kvantifikuje bezpečnostní riziko
spojené s konkrétním aktivem, zjištěním nebo zranitelností. Na rozdíl od souhrnného
bezpečnostního hodnocení (*Security Rating*, které hodnotí celou organizaci známkou A až F) se
riziková skóre vztahují k jednotlivým položkám: konkrétnímu otevřenému portu, chybně nastavené
službě, prošlému certifikátu, zranitelnosti přenosu zóny DNS. Každé skóre obsahuje míru důvěry,
která vyjadřuje, jak jisté je posouzení, a řetězec důkazů, který skóre spojuje s konkrétními
pozorovatelnými daty.

Riziková skóre jsou atomickými stavebními kameny systémů bezpečnostního hodnocení. Počítají se z pozorovatelných důkazů metodikou odpovídající principům CVSS (*Common
Vulnerability Scoring System*), upravenou pro pozorování výhradně zvenčí. Skóre se pak agregují,
váží podle kritičnosti aktiv a závažnosti zjištění, a vzniká celkové bezpečnostní hodnocení
A–F, s nímž pracují organizace, pracovníci compliance a analytici [due
diligence](@/glossary/due-diligence.md).

Epistemologické stanovisko zabudované do systému rizikového skórování zní: **riziko není jediné
číslo, ale rozdělení s nejistotou**. Rizikové skóre 72 s důvěrou 0,95 znamená něco zásadně
jiného než rizikové skóre 72 s důvěrou 0,45. První je dobře doložené posouzení, druhé
Zralý systém zachází se skóre i s jeho důvěrou jako s plnohodnotnými daty, takže navazující spotřebitelé mohou rozlišit zjištění s vysokou důvěrou od předběžných
posouzení.

Pro Kompendium je rizikové skóre pojmem z oblasti bezpečnosti infrastruktury, ne hodnocení
lidí. Kniha z něj přebírá jediný princip: číslo bez míry jistoty a bez dohledatelných
důkazů nemá rozhodovat o člověku – to platí i pro screeningové nástroje EA (viz [Riziko falešně
pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md)).

## Metodika skórování

Metodika rizikového skórování pracuje s číselnou stupnicí 0–100, která se pro lidské čtenáře
převádí na známky. Zohledňuje více dimenzí rizika, z nichž každá přispívá do složeného skóre
váženým vzorcem.

### Číselná stupnice a převod na známky

| Rozsah skóre | Známka | Výklad | Typické rysy |
|-------------|-------|---------------|------------------------|
| 90–100 | A | výborné | minimální expozice, silná opatření, aktuální záplaty |
| 80–89 | B | dobré | drobné problémy, celkově dobře udržované |
| 70–79 | C | přiměřené | znatelné mezery, některé zastaralé služby |
| 60–69 | D | podprůměrné | významná expozice, více zjištění |
| 0–59 | F | kritické | závažné zranitelnosti, nutná urgentní náprava |

Alternativní stupnice používaná v některých kontextech je 300–900 (podobně jako úvěrová skóre),
kde A = 800–900, B = 700–799, C = 600–699, D = 500–599, F = 300–499. Skórovací engine podporuje
obě stupnice; interně se používá 0–100, stupnice 300–900 je k dispozici pro externí výkaznictví.

### Vícerozměrné rizikové faktory

Jednotlivá riziková skóre se počítají z několika pozorovatelných dimenzí:

| Dimenze | Váha | Zdroje důkazů | Příklady zjištění |
|-----------|--------|-----------------|-----------------|
| **Síťová expozice** | 25 % | skeny portů, bannery služeb | otevřené databázové porty, nešifrované služby |
| **Kryptografické postavení** | 20 % | analýza TLS, kontrola certifikátů | prošlé certifikáty, slabé šifry, chybějící HSTS |
| **Aktuálnost záplat** | 20 % | detekce verzí, korelace s CVE | zastaralý software, známé zranitelnosti |
| **Konfigurační hygiena** | 15 % | analýza hlaviček, záznamy DNS | chybějící bezpečnostní hlavičky, mezery v SPF/DKIM |
| **Únik informací** | 10 % | analýza obsahu, kontrola metadat | odhalené administrační panely, ladicí endpointy |
| **Signály reputace** | 10 % | korelace s blocklisty, databáze zneužití | IP na blocklistech, doména ve feedech hrozeb |

## Agregace do bezpečnostního hodnocení

V kontextu správy vnější útočné plochy se riziková skóre agregují do bezpečnostních hodnocení, která dávají celkový obraz
vnějšího bezpečnostního postavení organizace. Agregace má hierarchickou strukturu:

```
Organization Security Rating (A-F)
|
+-- Domain Risk Scores
|   +-- example.com: 82 (B)
|   +-- api.example.com: 67 (D)
|   +-- mail.example.com: 91 (A)
|
+-- IP Range Risk Scores
|   +-- 203.0.113.0/24: 75 (C)
|   +-- 198.51.100.0/24: 88 (B)
|
+-- Certificate Risk Scores
|   +-- *.example.com: 95 (A)
|   +-- legacy.example.com: 42 (F)
|
+-- Service Risk Scores
    +-- HTTPS (443): 90 (A)
    +-- SMTP (25): 71 (C)
    +-- MySQL (3306): 23 (F) -- exposed database!
```

Agregace uplatňuje vážení kritičnosti aktiv: zjištění na primární doméně váží víc než totéž
zjištění na vývojové subdoméně. Kritická produkční databáze má vyšší dopad než testovací
prostředí. Vážení zajišťuje, že souhrnné bezpečnostní hodnocení odpovídá skutečnému rizikovému
profilu a nezkreslují ho četná, ale bezvýznamná zjištění na nekritických aktivech.

## Ověření metodou Monte Carlo

U kritických posouzení rizik (organizace posuzované kvůli akvizici, regulatornímu souladu nebo
strategickému partnerství) slouží k validaci rozdělení rizikových skóre ověření metodou Monte
Carlo. Simulace Monte Carlo místo jediného bodového odhadu vytváří rozdělení pravděpodobnosti
možných rizikových skóre.

Postup simulace:

1. **Vzorkování důkazů**: pro každé zjištění vzorkovat z rozdělení důvěry (se zohledněním
   nejistoty měření, spolehlivosti zdroje a časového rozpadu).
2. **Narušení vah**: náhodně narušit váhy dimenzí v ověřených rozmezích (vyjadřuje nejistotu
   samotného modelu vážení).
3. **Agregace**: spočítat složené skóre pro každý pokus Monte Carlo.
4. **Analýza rozdělení**: po 10 000 a více pokusech analyzovat výsledné rozdělení skóre.

Výstup obsahuje:

| Metrika | Popis | Příklad |
|--------|-------------|---------|
| **Průměrné skóre** | průměr všech pokusů | 73,2 |
| **Medián skóre** | 50. percentil | 74 |
| **Dolní mez 95% IS** | 2,5. percentil | 68 |
| **Horní mez 95% IS** | 97,5. percentil | 79 |
| **Pravděpodobnost známky** | pravděpodobnost každé známky | C: 72 %, B: 18 %, D: 10 % |

Pravděpodobnostní přístup je cenný zejména pro due diligence, kde bodový odhad „známka C“ je
méně užitečný než vědomí „72% pravděpodobnost C, 18% pravděpodobnost B, 10% pravděpodobnost D“.
Rozdělení Monte Carlo zachycuje nejistotu, která je pozorování výhradně zvenčí vlastní.

## Uplatnění v due diligence

Riziková skóre mají v kontextu due diligence konkrétní účel: umožnit informovaná rozhodnutí
o obchodních vztazích (akvizice, partnerství, výběr dodavatelů) kvantifikací vnějšího
bezpečnostního postavení cíle. Případ užití v due diligence klade další požadavky nad rámec
běžného bezpečnostního monitorování a vytváří samostatný analytický rámec.

| Požadavek | Implementace | Zdůvodnění | Technické podrobnosti |
|-------------|---------------|-----------|-------------------|
| **Snímek k určitému datu** | skóre spočtená z důkazů shromážděných v definovaném okně posouzení | závěry due diligence musí odkazovat ke konkrétnímu datu | období sběru důkazů obvykle 7–14 dní pro úplné pokrytí |
| **Srovnávací benchmarking** | skóre obsahují percentil v odvětví | „známka C“ znamená v různých odvětvích různé věci | klasifikace odvětví podle kódů NAICS, rozdělení skóre srovnatelných subjektů |
| **Analýza trendu** | historická trajektorie skóre z dostupných datových bodů | pro posouzení rizika záleží na tom, zda se postavení zlepšuje, nebo zhoršuje | pokud jsou data, nejméně 90denní ohlédnutí, intervaly spolehlivosti trendu |
| **Materialita zjištění** | riziková zjištění tříděná podle materiality (kritická/významná/drobná) | ne všechna zjištění jsou pro obchodní rozhodnutí podstatná | hodnocení dopadu odvozené z CVSS s vážením obchodního kontextu |
| **Odhad nákladů nápravy** | zjištění obsahují odhad úsilí potřebného k nápravě | slouží k vyjednávání a úpravám ocenění v due diligence | nákladové modely podle typu zjištění, velikosti organizace a složitosti |

### Rámec klasifikace materiality

Posouzení due diligence rozlišuje zjištění podstatná pro obchodní rozhodnutí od těch, která
představují běžnou bezpečnostní hygienu:

**Kritická (blokují obchod)**:

- odhalené databáze obsahující osobní údaje;
- indikátory aktivního zneužívání ve zpravodajství o hrozbách;
- zranitelnosti kritické infrastruktury (CVSS ≥ 9,0);
- vypršení certifikátu v průběhu transakce.

**Významná (ovlivňují ocenění)**:

- významné kryptografické slabiny (slabé TLS, prošlé certifikáty);
- neopravené zranitelnosti s veřejnými exploity;
- otevřené služby u kritických obchodních aplikací;
- mezery v regulatorním souladu (GDPR, SOX apod.).

**Drobná (vyžadují monitorování)**:

- odhalení informací (bannery serverů, ladicí stránky);
- chybějící bezpečnostní hlavičky;
- zastaralé verze softwaru bez aktivních exploitů;
- zlepšení konfigurace DNS.

Klasifikace přímo ovlivňuje strukturu obchodu: kritická zjištění mohou transakci zablokovat
nebo vyžadovat zádržné na úschovném účtu, významná ovlivňují vyjednávání o ocenění a drobná se
stávají součástí plánu integrace.

## Vztah ke skórování důvěry

Skórování důvěry a rizikové skórování jsou příbuzné, ale odlišné pojmy:

| Dimenze | Rizikové skóre | Skóre důvěry |
|-----------|-----------|-----------------|
| **Co měří** | jak rizikové je aktivum/zjištění? | jak jistí si jsme tvrzením? |
| **Stupnice** | 0–100 (vyšší = bezpečnější) | 0,0–1,0 (vyšší = jistější) |
| **Předmět** | aktivum, zjištění nebo organizace | přesvědčení, tvrzení nebo posouzení |
| **Může být nejisté?** | ano – právě to vyjadřuje skóre důvěry | ne – důvěra je sama mírou nejistoty |

Každé rizikové skóre nese skóre důvěry. Rizikové skóre říká „tento port je nebezpečný“ (jak
rizikové), skóre důvěry říká „tímto posouzením jsme si jisti z 87 %“ (jak jisté). Společně
dávají posouzení i metaposouzení jeho spolehlivosti.

## Vztah k epistemické robustnosti

Epistemická robustnost měří, jak dobře rizikové skóre odolá útočnému zpochybnění. Rizikové
skóre je epistemicky robustní, pokud by přežilo epistemické útoky [Red Teamu](@/glossary/red-team.md): zkreslení
pravdy, manipulaci důvěry, otrávení signálů, navození posunu a únos výraznosti.

### Rámec ověření robustnosti

Vícevrstvý ověřovací systém zajišťuje, že riziková skóre si zachovají epistemickou integritu
i v útočných podmínkách. [Blue Team](@/glossary/blue-team.md) robustnost rizikových skóre
průběžně ověřuje:

- **agregací signálů** – ověřuje, že každé zjištění podporuje více nezávislých zdrojů,
  a vzájemně koreluje zjištění z nezávislých skenerů kvůli odhalení nesrovnalostí;
- **detekcí posunu** – sleduje postupné podprahové změny, které by mohly skóre manipulovat,
  a statistickým řízením procesu odhaluje posuny výchozího stavu;
- **monitorováním autentizačních hranic** – zajišťuje, že zdroje dat nebyly kompromitovány:
  ověřuje odpovědi API, hledá neočekávané vzorce dat a sleduje metriky zdraví zdrojů;
- **syntézou důkazů** – vytváří strukturované důkazní artefakty místo prostých posouzení
  založených na výstrahách a udržuje úplné auditní stopy od surových dat skenu po konečná skóre;
- **validací napříč časem** – srovnává stabilitu rizikových skóre ve více oknech posouzení
  a odhaluje pokusy o manipulaci;
- **analýzou korelace zdrojů** – odhaluje, když údajně nezávislé zdroje dávají podezřele
  podobné výsledky, což ukazuje na možnou kompromitaci nebo koordinaci.

### Prahy robustnosti a akce

Riziková skóre, která neprojdou kontrolami epistemické robustnosti, podléhají stupňovaným
protokolům reakce:

| Skóre robustnosti | Akce | Autorita | Časový rámec |
|------------------|--------|-----------|----------|
| **0,90–1,00** | publikovat normálně | automaticky | v reálném čase |
| **0,75–0,89** | publikovat s varováním o robustnosti | Blue Team | 1–4 hodiny |
| **0,60–0,74** | pozdržet k syntéze Purple Teamu | Purple Team | 4–24 hodin |
| **pod 0,60** | karanténa do prošetření | triáda Red–Blue–Purple | ruční přezkum |

Riziková skóre, která kontrolami epistemické robustnosti neprojdou, se označí sníženou důvěrou
a před publikací se směrují k [Purple Teamu](@/glossary/purple-team.md) k syntéze a ověření.
Purple Team provede obousměrné mapování mezi útočnými scénáři Red Teamu a obrannými důkazy Blue
Teamu, aby určil, zda selhání robustnosti představuje skutečnou nejistotu, nebo systematický útok.

## Související

- [Blue Team](@/glossary/blue-team.md) – obranný tým, který ověřuje integritu skóre.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – další vrstva rizikového posouzení
  v due diligence.
- [EA × Due Diligence: Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) –
  stupňování kvality důkazů.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: risk-score](@/kompendium/glossary-bridges/bridge-risk-score.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
