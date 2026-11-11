+++
title = "Intelligence fusion (fúze zpravodajství)"
aliases = ["/glossary/signal-plurality/"]
weight = 28
description = "Analytická disciplína, která koreluje informace z více nezávislých zdrojů, přiděluje jim míru jistoty a zachovává rozpory."

[taxonomies]
tags = ["glossary", "osint", "intelligence-fusion", "intelligence"]

[extra]
category = "osint"
related_terms = ["osint", "entity-resolution", "sanctions-screening"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Intelligence", "Fusion", "Multi-source", "glossary", "osint", "Source", "Level"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Intelligence fusion (fúze zpravodajství) – glosář"
+++

## Definice

**Fúze zpravodajství** (*intelligence fusion*) je analytická disciplína, která koreluje informace z více nezávislých zdrojů, přiděluje skóre jistoty podle spolehlivosti zdroje a síly potvrzení, řeší rozpory strukturovanou metodikou a vytváří jednotné zpravodajské produkty představující nejlepší dostupné porozumění předmětu. Na rozdíl od prosté agregace dat (spojení všech dostupných informací do jednoho pohledu) používá fúze strukturované analytické techniky, které váží kvalitu dokladů, posuzují nezávislost zdrojů, sledují původ informací a výslovně zacházejí s protichůdnými signály. Výsledkem jsou produkty, v nichž je celek prokazatelně víc než součet částí.

Fúze vychází ze základního předpokladu: **žádný jednotlivý zdroj nedává úplný ani dokonale spolehlivý obraz.** Každý zdroj má vlastní zkreslení, mezery v pokrytí, časová omezení a chybovost. Fúze tyto slabiny vyvažuje rozmanitostí zdrojů a vyžaduje, aby závěry podpíraly sbíhající se doklady z nezávislých metod sběru. Spojení domény s podezřelou IP adresou, které zaznamenal jediný skener, má střední jistotu; potvrdí-li je neobvyklé vzorce certifikátů a behaviorální ukazatele z jiných sběrných systémů, jistota škodlivého spojení podstatně vzroste.

## Původ a kontext pojmu

Disciplína má hluboké kořeny ve vojenské a státní zpravodajské analýze, kde se po desetiletí spojuje zpravodajství z elektronického průzkumu (SIGINT), z lidských zdrojů (HUMINT), ze snímkování (IMINT) a z otevřených zdrojů ([OSINT](@/glossary/osint.md)). V kybernetické bezpečnosti uplatňuje fúze obdobné principy při korelaci síťové telemetrie, kanálů hrozeb, dat o zranitelnostech, soupisů aktiv a behaviorální analytiky. Strukturované analytické techniky – analýza konkurenčních hypotéz (Heuer), strukturované analytické techniky obecně a bayesovská aktualizace – mají zajistit, že výstupy fúze jsou důsledné, průhledné a auditovatelné. Úrovně fúze uvedené níže odpovídají modelu, který se v oboru datové fúze ustálil (tzv. model JDL).

## Jak se projevuje

Životní cyklus fúze má pět navazujících fází, které mění surová data v použitelné zpravodajství:

**Plánování sběru.** Účinná fúze začíná určením mezer ve zpravodajství a zdrojů, které je mohou pokrýt. Plánování přiřazuje zpravodajské požadavky dostupným zdrojům, zajišťuje rozmanité pokrytí a odhaluje závislosti na jediném zdroji, které vytvářejí slepá místa.

**Integrace zdrojů.** Surová data z různorodých zdrojů je nutné před korelací převést do společného formátu. Integrace řeší rozdíly formátů, sémantické mapování, časové sladění a odstranění duplicit a přitom zachovává metadata o původu.

**Korelace a analýza.** Jádrem fúze je hledání vztahů mezi normalizovanými prvky napříč zdroji – od prostého porovnání atributů (stejná IP adresa ve více kanálech) po složité rozpoznávání behaviorálních vzorců (podobná metodika útoků v různých kampaních).

**Hodnocení jistoty.** Každý fúzovaný produkt dostane skóre jistoty, které odráží sílu podpůrných dokladů, spolehlivost zdrojů, čerstvost a hloubku potvrzení. Skóre umožňuje příjemcům reagovat úměrně jistotě zpravodajství.

**Šíření produktu.** Produkty se formátují a doručují podle rolí a potřeb příjemců. Taktičtí příjemci potřebují upozornění v reálném čase s minimem kontextu, strategičtí úplná hodnocení s analytickými podrobnostmi.

## Mechanismus

### Úrovně fúze

| úroveň | popis | vstup | výstup | příklad |
|-------|-------------|-------|--------|---------|
| **0: pod úrovní zdroje** | zpřesnění dat z jednoho zdroje | surová data senzorů | vyčištěná, normalizovaná data | parsování záznamů DNS |
| **1: objekt** | vícezdrojová [entity resolution](@/glossary/entity-resolution.md) | normalizované proudy dat | jednotné profily entit | sloučení dat o hostiteli z více skenerů |
| **2: situace** | analýza vztahů a vzorců | profily entit | hodnocení situace | topologie útočné plochy |
| **3: dopad** | analýza rizika a důsledků | hodnocení situace | předpovědi dopadu | výpočet bezpečnostního hodnocení |
| **4: proces** | metaanalýza účinnosti fúze | výstupy fúze + ověřená pravda | zlepšení procesu | nalezení mezer ve sběru |

### Rámec hodnocení jistoty

| faktor | váha | popis | příklad |
|--------|--------|-------------|---------|
| **spolehlivost zdroje** | 30 % | historická přesnost zdroje | dlouhodobě ověřený zdroj: 0,95, neznámý zdroj: 0,50 |
| **potvrzení** | 25 % | počet nezávislých potvrzujících zdrojů | 3 zdroje: 0,90, 1 zdroj: 0,60 |
| **čerstvost** | 20 % | stáří pozorování | < 24 h: 1,0, > 30 dní: 0,50 |
| **vnitřní soudržnost** | 15 % | absence vnitřních rozporů | soudržné: 1,0, rozporné: 0,30 |
| **metoda sběru** | 10 % | spolehlivost techniky sběru | aktivní sken: 0,95, pasivní: 0,80 |

### Zacházení s rozpory

```
Source A: "Domain X resolves to IP 1.2.3.4" (confidence: 0.90, observed: 2h ago)
Source B: "Domain X resolves to IP 5.6.7.8" (confidence: 0.85, observed: 1d ago)

Fusion Output:
  - Primary: Domain X -> 1.2.3.4 (confidence: 0.90, more recent)
  - Historical: Domain X -> 5.6.7.8 (confidence: 0.85, preserved as historical)
  - Assessment: Possible DNS migration or load balancing
  - CONTRADICTION PRESERVED
  - Both records retained with temporal context
```

## Odlišení

| přístup | strukturovaná fúze | tradiční korelace SIEM | platforma zpravodajství o hrozbách | ruční analýza |
|----------|----------------------|-----------------------------|-----------------------|-----------------|
| **zacházení s rozpory** | zachovány | vyřešeny (vyhrává nejvyšší jistota) | podle dodavatele | úsudek analytika |
| **hodnocení jistoty** | vícefaktorové | podle pravidel | proprietární | subjektivní |
| **pluralita zdrojů** | vynucena (nejméně 2 zdroje) | volitelná | různá | dobrá praxe |
| **sledování původu** | povinné | z logů | přiřazení zdroje | dokumentace |
| **časový úbytek** | automatický, nastavitelný | ruční práh | různý | ruční posouzení |

Fúzi je třeba odlišit i od **agregace**: kdo sečte deset zpráv, které všechny opisují tutéž agenturní zprávu, nemá deset zdrojů, ale jeden.

## Osvědčené postupy

1. **Vynucovat pluralitu zdrojů:** nikdy nevytvářet zpravodajské hodnocení z jediného zdroje. Závěry z jednoho zdroje jsou ze své podstaty křehké – podléhají jeho chybám, zkreslením a slepým místům. Pro každý použitelný produkt vyžadovat nejméně dva nezávislé zdroje.
2. **Zachovávat rozpory:** když se zdroje neshodnou, zachovat obě pozice s jejich skóre jistoty a časovým kontextem. Tiché zahazování protichůdných dokladů (antivzor „vybírání třešniček“) vytváří produkty, které působí jistěji, než doklady opravňují, a vedou k přehnaně sebejistým rozhodnutím.
3. **Sledovat původ od začátku do konce:** každé tvrzení ve fúzovaném produktu musí být dohledatelné k výchozímu zdroji, metodě sběru a času pozorování. Umožňuje to příjemcům posoudit kvalitu a analytikům vyšetřit chybné produkty.
4. **Uplatňovat časový úbytek:** zpravodajství stárne. Infrastruktura se mění, hrozby se vyvíjejí, vztahy mezi organizacemi se posouvají. Jistota pozorování, která nebyla znovu potvrzena, se má s časem snižovat.
5. **Kalibrovat prahy jistoty:** přizpůsobit požadavky na jistotu závažnosti rozhodnutí. Kritická rozhodnutí (bezpečnostní hodnocení, posouzení souladu) vyžadují jistotu 0,95; průzkumná analýza může pokračovat při 0,60. Nesprávné prahy vedou buď k [ochromení analýzou](@/glossary/paralysis-by-analysis.md), nebo k předčasnému jednání.
6. **Diverzifikovat metody sběru:** nezávislost zdrojů vyžaduje nezávislost metod. Dva zdroje, které v konečném důsledku čerpají ze stejné sběrné infrastruktury, neposkytují skutečné potvrzení. Mapovat závislosti zdrojů a hledat skryté jediné body selhání.

## Případy užití

- **Objevování aktiv na vnější útočné ploše:** fúze koreluje záznamy DNS, logy transparentnosti certifikátů, skeny portů a údaje WHOIS do úplných map útočné plochy; existenci a vlastnosti každého aktiva potvrzuje více nezávislých pozorování.
- **Prověrka sankcí:** jména entit z obchodních záznamů se fúzují se sankčními seznamy, negativními zprávami v médiích a databázemi politicky exponovaných osob. Neostré porovnávání entit napříč jazyky a přepisy vyžaduje fúzi k vyřešení nejednoznačné identity; viz [Sanctions Screening](@/glossary/sanctions-screening.md).
- **Přiřazení aktérů hrozeb:** behaviorální vzorce, ukazatele infrastruktury a taktické signatury z více míst sledování se fúzují, aby bylo možné škodlivou činnost přiřadit skupinám nebo kampaním.
- **Hodnocení rizika dodavatelského řetězce:** vztahy organizací, sdílení certifikátů, závislosti hostingu a data o vystavení zranitelnostem se fúzují do hodnocení rizika dodavatelského řetězce sledovaných entit.

## Význam pro Kompendium

Principy fúze jsou v knize obecnými pravidly epistemické hygieny, nejen technickým postupem. **Nezávislost zdrojů**, **zachování rozporů**, **sledování původu** a **časový úbytek** jsou přesně to, co manipulace podkopává: [monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) a [citační kruhovost](@/kompendium/detection-signatures/18-network-citation-circularity.md) vytvářejí zdání mnoha zdrojů tam, kde je jen jeden; potlačení rozporů je jádrem [konfirmačního biasu](@/glossary/konfirmacni-bias.md). Pro jednotlivce tytéž principy převádí do běžného života [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md), pro analytiky [křížová triangulace zdrojů v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) a [validace zpravodajství o hrozbách](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md).

## Mez čísel

Skóre, která tento rámec přiděluje, jsou účetní pomůckou, nikoli měřením. Váhy faktorů a prahy
uvedené výše jsou konvencí přijatou v daném postupu, ne empiricky zjištěnou hodnotou, a srovnatelné
jsou proto jen uvnitř organizace, která je používá stejně. Jistotu navíc nelze ověřit bez zpětné
vazby o tom, jak hodnocení dopadlo; bez ní čísla vypovídají o shodě analytiků, nikoli o přesnosti.
Nároky na dohledatelnost takového hodnocení stanoví
[metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

Obdobnou mez má i nezávislost zdrojů: tu nelze zjistit ze samotných zdrojů, nýbrž jen ze znalosti
jejich sběrné infrastruktury, a bez tohoto doložení zůstává pluralita domněnkou. Fúze proto dává
jazyk pro posuzování shody, ne nástroj, jímž by ji čtenář mohl změřit; k čemu je takový jazyk
v knize dobrý, vysvětluje [jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md).

## Související

- [OSINT](@/glossary/osint.md) – hlavní metodika poskytující surové zpravodajství.
- [Entity Resolution](@/glossary/entity-resolution.md) – rozlišení identity ve fúzovaném zpravodajství.

**Kniha**

- [Křížová triangulace zdrojů v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – princip fúze v kontextu EA.
- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – signatura, kterou fúze odhaluje.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – tytéž principy pro jednotlivce.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: intelligence-fusion](@/kompendium/glossary-bridges/bridge-intelligence-fusion.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
