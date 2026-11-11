+++
title = "OSINT (zpravodajství z otevřených zdrojů)"
aliases = ["/glossary/censys/", "/glossary/easm/", "/glossary/greynoise/", "/glossary/hawkeye/", "/glossary/shodan/", "/kompendium/glossary-bridges/bridge-censys/", "/kompendium/glossary-bridges/bridge-easm/", "/kompendium/glossary-bridges/bridge-greynoise/", "/kompendium/glossary-bridges/bridge-hawkeye/", "/kompendium/glossary-bridges/bridge-shodan/"]
weight = 27
description = "Sběr a analýza informací z veřejně dostupných zdrojů: zpravodajský cyklus, typy zdrojů, ověřování a etické meze."

[taxonomies]
tags = ["glossary", "osint", "intelligence", "due-diligence", "evidence"]

[extra]
category = "osint"
abbreviation = "OSINT"
related_terms = ["intelligence-fusion", "entity-resolution", "sanctions-screening", "due-diligence"]
keywords = ["open source intelligence definition", "OSINT methodology guide", "intelligence gathering techniques", "OSINT source taxonomy", "public records intelligence", "digital forensics OSINT", "threat intelligence collection", "OSINT analysis framework"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "OSINT (zpravodajství z otevřených zdrojů) – glosář"
+++

## Definice a přehled

Zpravodajství z otevřených zdrojů (*Open Source Intelligence*, OSINT) je disciplína sběru,
zpracování, analýzy a předávání informací z veřejně dostupných zdrojů s cílem vytvořit použitelné
zpravodajské poznatky. Na rozdíl od signálového (SIGINT) nebo lidského (HUMINT) zpravodajství se
OSINT opírá výhradně o informace, které jsou veřejnosti legálně přístupné: veřejné rejstříky,
profily na sociálních sítích, registrace domén, logy Certificate Transparency, záznamy DNS, webový
obsah, odborné publikace, finanční výkazy, patentové databáze a komerční datové služby. OSINT
klade důraz na strukturované analytické postupy, ověřování zdrojů a etické metody sběru, které
respektují zákony o ochraně soukromí, podmínky užití a jurisdikční předpisy.

Historie OSINT je starší než digitální věk. Zpravodajští analytici vždy studovali noviny, rozhlasové
vysílání, odborné časopisy a veřejné záznamy. Změnilo se měřítko: digitální revoluce vytvořila
bezprecedentní objem veřejně dostupných informací. Problém se posunul od nedostatku informací
k informačnímu přetížení. Moderní praxe OSINT se soustředí na automatizovaný sběr, strukturovanou
analýzu, slučování entit napříč nesourodými zdroji a posouzení s kalibrovanou důvěrou, které
přiznává nejistotu.

OSINT se od jiných zpravodajských disciplín neliší jen zdroji, ale i metodikou. Tradiční
zpravodajství vychází z předpokladu, že důležité informace jsou skryté a je třeba je získat
skrytými prostředky. OSINT vychází z doplňujícího předpokladu, že důležité informace jsou často už
veřejně dostupné, ale zapadají v šumu obrovských datových sad. Dovednost analytika nespočívá
v získání přístupu, ale v rozpoznání relevance, korelaci signálů napříč zdroji a tvorbě posouzení,
podle nichž mohou rozhodující osoby jednat.

Zpravodajský cyklus OSINT sleduje standardní zpravodajský proces: plánování a řízení (na jaké
otázky je třeba odpovědět), sběr (získání dat ze zdrojů), zpracování (převod surových dat do
použitelné podoby), analýza (výklad zpracovaných dat a tvorba poznatků) a předání (doručení
poznatků spotřebitelům).

Pro Kompendium má OSINT dvojí roli. Je nástrojem ověřování – triangulace zdrojů je přímou obranou
proti dezinformacím (viz [EA × OSINT: Source Credibility under Epistemic
Attack](@/kompendium/cross-domain/1-ea-osint-source-credibility.md)). A zároveň je dvojího užití:
tytéž postupy umožňují pronásledování a [doxing](@/glossary/doxing.md). Kniha popisuje OSINT jen
v obranném a zákonném rámci; vyhledávání informací o soukromých osobách bez právního důvodu
nepopisuje.

## Historický kontext

Zpravodajská práce s otevřenými zdroji se institucionalizovala už za druhé světové války – ve
Spojených státech vznikla v roce 1941 služba pro monitorování zahraničního vysílání, později známá
jako *Foreign Broadcast Information Service* (FBIS), která sledovala a překládala zahraniční média
a za studené války se stala jádrem práce s otevřenými zdroji. (Původní verze hesla vznik FBIS
chybně kladla do pozdní studené války.) V 90. letech nástup internetu exponenciálně rozšířil objem
veřejně dostupných informací a na počátku 21. století zpravodajské služby po celém světě uznaly
OSINT za rovnocennou disciplínu vedle SIGINT, HUMINT, GEOINT a MASINT.

Zpráva americké komise pro 11. září (2004) upozornila na selhání zpravodajské komunity při syntéze
veřejně dostupných informací, které mohly poskytnout varování před útoky. To podnítilo
institucionální investice do schopností OSINT. Vznik Open Source Center (OSC) v roce 2005 a jeho
nástupce Open Source Enterprise (OSE) formalizoval roli OSINT v americké zpravodajské komunitě.

V soukromém sektoru získaly techniky OSINT význam díky výzkumu kybernetické bezpečnosti,
konkurenčnímu zpravodajství a šetřením v rámci [due diligence](@/glossary/due-diligence.md).

## Technický rozbor

### Taxonomie zdrojů OSINT

Zdroje OSINT se třídí podle typu, spolehlivosti a způsobu přístupu:

| Kategorie | Zdroje | Spolehlivost | Způsob přístupu |
|----------|---------|-------------|---------------|
| **Doménové zpravodajství** | záznamy DNS, WHOIS, výčet subdomén | vysoká | přímý dotaz (protokol DNS) |
| **Certifikátové zpravodajství** | logy Certificate Transparency, záznamy vydavatelů | velmi vysoká | API logů CT (crt.sh, Censys) |
| **Síťové zpravodajství** | rozsahy IP, mapování ASN, skeny portů | vysoká | Shodan, Censys, pasivní DNS |
| **Webové zpravodajství** | obsah webu, robots.txt, hlavičky | střední | požadavky HTTP, procházení webu |
| **Rejstříkové zpravodajství** | registrace firem, soudní záznamy, podání | velmi vysoká | vládní API, extrakce z webu |
| **Sociální zpravodajství** | profily na sociálních sítích, veřejné příspěvky | nízká až střední | API platforem, veřejné stránky |
| **Finanční zpravodajství** | podání SEC, výroční zprávy, patentové databáze | velmi vysoká | EDGAR, API patentových úřadů |
| **Akademické zpravodajství** | výzkumné články, sborníky konferencí | vysoká | akademické databáze, preprintové servery |
| **Geoprostorové zpravodajství** | satelitní snímky, mapová data, check-iny | střední | veřejná mapová API, služby snímků |

### Slučování entit

Klíčovou výzvou OSINT je [slučování entit](@/glossary/entity-resolution.md) (*entity
resolution*) – určení, zda odkazy z různých zdrojů označují tutéž entitu reálného světa. Jména se
liší (John Smith, J. Smith, John R. Smith), adresy se mění, organizace používají více názvů a lidé
se objevují v různých kontextech. Chybné sloučení dvou různých osob se stejným jménem je jednou z nejzávažnějších chyb OSINT,
protože může poškodit nevinného člověka; proto se sloučení s nízkou jistotou označuje a ověřuje.

### České právní a obchodní zpravodajství

České právní a obchodní zpravodajství má vlastní sadu veřejných zdrojů:

| Zdroj | API/metoda | Poskytovaná data |
|--------|-----------|---------------|
| **ARES** (Ministerstvo financí) | REST API | registrace firem, IČO, DIČ, adresy |
| **Obchodní rejstřík** (Justice.cz) | extrakce z webu + API | statutární orgány, společníci, listiny |
| **Insolvenční rejstřík** (ISIR) | REST API | insolvenční řízení, přihlášky pohledávek |
| **Živnostenský rejstřík** | extrakce z webu | živnostenská oprávnění, odpovědní zástupci |
| **Katastr nemovitostí** (ČÚZK) | REST API | vlastnictví nemovitostí, věcná břemena, zástavy |
| **Soudní rozhodnutí** | extrakce z webu | rozsudky, řízení, exekuční příkazy |

## Srovnání s jinými zpravodajskými disciplínami

| Disciplína | Zdroje | Právní omezení | Potenciál automatizace |
|------------|---------|-------------------|---------------------|
| **OSINT** | veřejná data | malá (podmínky užití, soukromí) | vysoký |
| **SIGINT** | komunikace | přísná (soudní povolení) | střední |
| **HUMINT** | lidské kontakty | přísná (právní a etická) | nízký |
| **GEOINT** | snímky/geoprostorová data | střední | vysoký |
| **MASINT** | měření/signatury | přísná | vysoký |
| **CYBINT** | kybernetické operace | střední | vysoký |

## Osvědčené postupy

**Ověřovat ve více nezávislých zdrojích.** U kritických poznatků se nikdy nespoléhat na jediný zdroj
OSINT. Zjištění křížově ověřit nejméně ve dvou nezávislých zdrojích (viz [fúze
zpravodajství](@/glossary/intelligence-fusion.md)). Záznam o registraci domény potvrzený logy Certificate
Transparency a záznamy DNS dává mnohem vyšší důvěru než kterýkoli zdroj sám.

**Pečlivě sledovat provenienci.** Každé zjištění musí obsahovat URL zdroje, časové razítko získání
a metodu sběru. Provenience umožňuje ověření, posouzení aktuálnosti a právní obhajitelnost. Bez provenience se zpravodajský
poznatek neliší od fámy.

**Respektovat limity a podmínky užití.** Agresivní extrakce nebo zneužívání API poškozují komunitu
OSINT, protože vedou poskytovatele k omezení přístupu. Zavést řádné omezení rychlosti, respektovat
robots.txt a dodržovat podmínky užití API. Udržitelný sběr zajišťuje dlouhodobý přístup.

**Uplatňovat časový rozpad na zjištění.** Data OSINT mají trvanlivost. Záznamy DNS se mění,
certifikáty vyprší, firmy se slučují a lidé se stěhují. Zavést automatické sledování aktuálnosti
a plány nového sběru, aby zastaralé poznatky nekontaminovaly analýzu.

**Zachovávat protichůdné informace.** Když se zdroje neshodnou, zachovat obě verze s jejich
proveniencí, místo aby se vybrala jedna. Rozpory jsou informativní – mohou ukazovat na rozdíly
v aktuálnosti dat, záměrný klam nebo legitimní nejednoznačnost.

**Zvažovat přiměřenost u osob.** Sběr informací o fyzických osobách má mít zákonný důvod
a odpovídat účelu (zásada minimalizace podle GDPR). Kompendium zdůrazňuje, že ani veřejně dostupná
data nesmějí sloužit k sestavení profilu, který by umožnil pronásledování nebo nátlak.

## Časté chyby

**Konfirmační bias při sběru.** Pokušení hledat jen informace podporující hypotézu je silné. Plán
sběru má zahrnovat zdroje, které by hypotézu mohly vyvrátit (srov. [konfirmační
bias](@/glossary/konfirmacni-bias.md) a [EA × Due Diligence: Confirmation
Bias](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md)). Požadavek plurality signálů
znamená aktivně hledat i protichůdné důkazy.

**Zaměňovat objem dat s kvalitou poznatků.** Shromáždění více dat automaticky nevede k lepším
poznatkům. Hodnota vzniká ve fázi analýzy, kde se surová data vykládají, korelují a posuzují.
Investice do sběru bez odpovídající investice do analýzy vytváří datové bažiny.

**Přehlížet právní a etické meze.** OSINT používá veřejné zdroje, ale „veřejné“ má právní nuance.
Extrakce dat za přihlašovací bránou, přístup k uloženým osobním údajům po žádosti o výmaz nebo sběr
dat v jurisdikcích s přísnými zákony o ochraně soukromí mohou vytvořit právní riziko. Je třeba znát
právní rámec každého zdroje.

**Jednojazyčné zkreslení.** Analýza OSINT, která pracuje jen v angličtině, mine poznatky dostupné
v jiných jazycích. Pro české obchodní zpravodajství jsou nejautoritativnější zdroje česky. Je třeba
zavést vícejazyčný sběr a analýzu.

**Chápat automatizovaný sběr jako konečný.** Automatizované nástroje OSINT výborně shromažďují data,
ale špatně vykládají kontext. Automatizovaná zjištění je třeba brát jako surový vstup vyžadující
přezkum analytikem, ne jako hotový zpravodajský produkt.

## Související

- [Intelligence Fusion](@/glossary/intelligence-fusion.md) – metodika korelace dat OSINT z více
  zdrojů.
- [Entity Resolution](@/glossary/entity-resolution.md) – neostré porovnávání napříč variantami
  zdrojů.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – regulatorní soulad s využitím zdrojů
  OSINT.
- [Doxing](@/glossary/doxing.md) – zneužití postupů OSINT proti osobám.
- [EA × OSINT: triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) –
  pluralita v investigativní praxi.
- [EA × OSINT: ARES Validation](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) –
  české rejstříky z pohledu EA.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: osint](@/kompendium/glossary-bridges/bridge-osint.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
