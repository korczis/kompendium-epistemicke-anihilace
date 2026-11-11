+++
title = "Red Team (červený tým)"
aliases = ["/glossary/black-team/", "/glossary/color-teams/", "/glossary/gray-team/", "/glossary/white-team/", "/kompendium/glossary-bridges/bridge-black-team/", "/kompendium/glossary-bridges/bridge-color-teams/", "/kompendium/glossary-bridges/bridge-gray-team/", "/kompendium/glossary-bridges/bridge-white-team/"]
weight = 19
description = "Tým útočné simulace: pět primitiv epistemického útoku v izolovaném sandboxu se syntetickými daty slouží k ověření obrany."

[taxonomies]
tags = ["glossary", "security", "agents"]

[extra]
category = "security"
related_terms = ["blue-team", "purple-team"]
difficulty = "advanced"
importance = "critical"
platform_relevance = "core"
date_created = "2025-06-15"
date_updated = "2026-02-22"
version = "3.0.0"
audience = ["security-engineers", "platform-architects", "ai-safety-researchers", "compliance-officers"]
prerequisites = ["epistemic-security"]
domain = "security-operations"
related_patterns = ["adversarial-synthesis", "sandbox-isolation", "attack-taxonomy", "campaign-orchestration", "epistemic-validation"]
see_also = ["architecture/_index.md", "agents/_index.md", "technologies/_index.md", "capabilities/_index.md"]
acronyms = ["OSINT", "CTF"]
standards = ["MITRE-ATT&CK", "OWASP", "NIST-CSF", "ISO-27001"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
keywords = ["Red", "Team", "Adversarial", "glossary", "security", "Red Team", "Purple Team"]
image = "/images/sections/glossary.png"
image_alt = "Red Team (červený tým) – glosář"
+++

## Definice a přehled

Red Team (červený tým) je specializovaná jednotka bezpečnostního provozu, která provádí
cvičení útočné simulace s cílem odhalit zranitelnosti, slabiny a způsoby selhání systémů,
procesů a epistemické obrany. Pojem vychází z vojenských cvičení studené války, v nichž
vyhrazená „červená“ síla simulovala taktiku nepřítele proti bránícím se „modrým“ silám,
a vyvinul se v základní kámen moderní kybernetické bezpečnosti, bezpečnosti umělé
inteligence a epistemické bezpečnosti. Epistemický red teaming rozšiřuje tuto tradici
do oblasti [epistemické bezpečnosti](@/glossary/epistemic-security.md): cílem je integrita
znalostních systémů, pipeline uvažování a rozhodovacích procesů, nejen síťová infrastruktura.

Jeho obranným protějškem je [Blue Team](@/glossary/blue-team.md) a zjištění obou stran
spojuje [Purple Team](@/glossary/purple-team.md). Útočné simulace se vedou v sandboxu se
syntetickými daty a bez přístupu do sítě, takže nemohou ovlivnit produkční systémy ani
skutečná data.

Rozdíl mezi tradičním a epistemickým red teamingem je zásadní. Tradiční Red Teamy útočí na
síťovou infrastrukturu, aplikace a fyzické bezpečnostní perimetry. Epistemické Red Teamy cílí na integritu vzniku přesvědčení, hodnocení
důkazů a kalibraci důvěry – oblasti, kde jemná manipulace může mít nepřiměřeně velký dopad na
chování systému, aniž by spustila běžné bezpečnostní poplachy.

| Hledisko | Tradiční Red Team | Epistemický Red Team |
|--------|--------------------|--------------------|
| **Cíl** | síťová infrastruktura, aplikace | znalostní systémy, pipeline uvažování |
| **Útočná plocha** | porty, API, autentizace | zdroje důkazů, skóre důvěry, vznik přesvědčení |
| **Primitiva** | exploit, pivot, exfiltrace, perzistence | zkreslení, manipulace, otrávení, navození posunu, únos pozornosti |
| **Měřítko úspěchu** | kompromitace systému | zhoršení epistemické integrity |
| **Bezpečnostní opatření** | síťová izolace | sandbox + syntetická data + nulová síť |
| **Integrace** | samostatná posouzení | nepřetržitá smyčka syntézy s Purple Teamem |

Pět primitiv útočné simulace je užitečnou mřížkou i pro rozpoznání útoků na lidské poznání –
každé má v knize obdobu, popsanou vždy s detekcí a obranou.

## Pět primitiv epistemického útoku

Operace Red Teamu jsou postaveny kolem pěti základních primitiv útoku, která pokrývají celé
spektrum epistemické manipulace. Primitiva byla odvozena z analýzy historických epistemických
selhání systémů umělé inteligence, zpravodajské analýzy a platforem pro podporu rozhodování
a představují minimální úplnou sadu potřebnou k modelování útočného chování proti znalostním
systémům.

**1. Zkreslení pravdy** (*Truth Distortion*): úprava faktického obsahu informačních zdrojů,
která do nich vnáší nepřesnosti. Patří sem jemné změny, které projdou povrchním ověřením, ale
poškodí navazující uvažování. Nejúčinnější jsou zkreslení, která využívají mezeru mezi
syntaktickou platností a sémantickou správností. Například úprava
výpočtu bezpečnostního hodnocení o 2 % – dost malá, aby nespustila prahové výstrahy, ale
dostatečná, aby při agregaci přes více datových bodů posunula hranici známky z B na C.

**2. Manipulace důvěry** (*Confidence Manipulation*): nadsazení nebo podhodnocení skóre důvěry
spojených s přesvědčeními nebo důkazy beze změny podkladových faktů. Útok využívá systémy,
které rozhodují podle prahů důvěry, a posouvá hraniční rozhodnutí přes prahové hranice.

**3. Otrávení signálů** (*Signal Poisoning*): vkládání nepravdivých nebo zavádějících signálů
do toků důkazů, které poškozuje požadavek [plurality
signálů](@/glossary/intelligence-fusion.md), podle něhož má přesvědčení vzniknout až
z nejméně dvou nezávislých signálů. Otrávené signály se tváří, že
pocházejí z nezávislých zdrojů, a podkopávají požadavek plurality tím, že z jediného útočného
původu vytvářejí zdání potvrzení z více zdrojů.

**4. Navození posunu** (*Drift Induction*): zavádění podprahových změn, které jednotlivě
projdou detekcí, ale společně v čase posunou chování systému. Rozhodující je kaskádové šíření –
jak se malá narušení sčítají v propojených systémech. Navození posunu je obzvlášť nebezpečné, protože každá jednotlivá změna je v mezích
běžného rozptylu, takže detekce závisí na sledování kumulativní odchylky, ne jednotlivých anomálií.

**5. Únos výraznosti** (*Salience Hijacking*): manipulace tím, které informace dostanou
v procesech uvažování pozornost. Zvýrazněním irelevantních signálů nebo potlačením kritických
poškozuje únos výraznosti stanovení priorit, aniž by měnil podkladová data. Primitivum míří na
mechanismy pozornosti automatizovaných systémů i lidských analytiků a využívá omezenou
kapacitu procesů uvažování.

Lidské obdoby, které kniha rozebírá: zkreslení pravdy odpovídá [gaslightingu](@/glossary/gaslighting.md),
otrávení signálů koordinovanému zdání shody ([Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md), boti), navození posunu postupné eskalaci
v kultovní konverzi ([sektářská konverze](@/glossary/sektarska-konverze.md)) a únos výraznosti
[EA-1.1.1 Selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md).

## Taxonomie útoků

Red Team vede ucelenou taxonomii útočných scénářů uspořádanou podle primitiva útoku, cílového
subsystému a úrovně složitosti. Taxonomie slouží zároveň jako testovací rámec a jako znalostní
báze známých vzorců epistemických útoků.

Taxonomie není statická: průběžně se rozšiřuje podle nových hrozeb a skutečných vzorců
epistemických útoků pozorovaných v komunitách kybernetické bezpečnosti a bezpečnosti umělé
inteligence.

## Architektura izolace v sandboxu

Všechny operace Red Teamu běží uvnitř izolační hranice sandboxu. Architektura zajišťuje, že útočné simulace nemohou ovlivnit produkční systémy, skutečná data ani vnější
sítě. Sandbox vynucuje tři invarianty: jen syntetická data, nulový přístup do sítě a neměnné
auditní logování.

Izolace v sandboxu není jen osvědčený postup – je to nepodkročitelný bezpečnostní požadavek
vynucovaný na úrovni infrastruktury. I přístup do sítě „jen pro čtení“ by mohl prozradit
informace o útočných schopnostech nebo vnitřní struktuře testovaného systému. Interval
etických kontrol zajišťuje, že automatizované etické ověření běží během aktivních operací každých 10 sekund
a brání tomu, aby se útočné myšlení rozšířilo do skutečně škodlivého území.

## Provádění kampaní

Operace Red Teamu se organizují do kampaní – strukturovaných sledů útočných scénářů navržených
k testování konkrétních aspektů obrany. Kampaně dávají organizační rámec testování
o více scénářích a vytvářejí strukturovaná zjištění, která [Purple Team](@/glossary/purple-team.md)
využívá k syntéze útoku a obrany.

## Bezpečnostní protokoly

Red Team pracuje pod přísnými bezpečnostními protokoly, které nelze vyjednávat ani obejít.
Vynucují se na několika vrstvách – v kódu, v infrastruktuře a organizačně –, aby vznikla
hloubková obrana proti porušení bezpečnostních hranic.

| Protokol | Vynucení | Ověření |
|----------|-------------|-------------|
| **Izolace v sandboxu** | všechny operace jen uvnitř sandboxu | kontroly při kompilaci a za běhu |
| **Jen syntetická data** | žádná skutečná data, žádné osobní údaje, žádný produkční stav | ověření zdroje dat při každé operaci |
| **Nulový přístup do sítě** | operace Red bez síťového připojení | pravidla firewallu + ověření za běhu |
| **Etické kontroly** | automatizované ověření každých 10 sekund | periodický časovač s eskalací při selhání |
| **Eskalační stráže** | nezávislá stráž brání rozšiřování rozsahu | bezpečnostní role s pravomocí operaci zastavit |
| **Auditní logování** | neměnná auditní stopa každé operace | log jen pro připisování s ověřením integrity |
| **Časové limity** | kampaň nejvýše 1 hodina | vynucení časovačem s automatickým ukončením |
| **Jen oprávněný kontext** | CTF, obranný výzkum, autorizované testování | ověření kontextu při zahájení kampaně |

Bezpečnostní protokoly vycházejí z předpokladu, že útočné myšlení vytváří kognitivní rizika
i v kontextu simulace. Kadence etických kontrol (každých 10 sekund) je záměrně častá, aby
zabránila postupné normalizaci stále agresivnějších vzorců útoku. Eskalační stráž má nezávislou
pravomoc zastavit kteroukoli operaci Red Teamu, která vykazuje známky rozšiřování mimo hranice
testování epistemické bezpečnosti.

Kompendium tento princip přebírá pro vlastní obsah: mechanismy se popisují jen jako
rozpoznatelné vzorce spolu s detekcí a obranou, nikdy jako postup (viz [1.3 Etické aspekty
a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md) a [Dual Use](@/kompendium/08-prilohy/dual-use.md)).

## Osvědčené postupy

1. **Vždy v sandboxu**: nikdy nespouštět útočné scénáře mimo izolační hranici, bez ohledu na
   zdánlivou bezpečnost. Jediný chybně nastavený scénář může poškodit produkční data nebo
   prozradit vnitřní strukturu vnějším pozorovatelům.
2. **Výhradně syntetická data**: generovat realistická, ale zcela syntetická testovací data.
   Použití anonymizovaných produkčních dat hrozí reidentifikací a vnáší skutečné důsledky,
   které porušují mandát „jen simulace“.
3. **Strukturovaná zjištění**: každé zjištění dokumentovat s ID scénáře, důkazy, posouzením
   dopadu, dobou detekce a použitelnými doporučeními. Nestrukturovaná zjištění vytvářejí šum
   bez zlepšení.
4. **Napojení na Purple Team**: všechna zjištění směrovat přes syntézu [Purple
   Teamu](@/glossary/purple-team.md), ne přímo inženýrům. Purple Team zasadí zjištění do
   kontextu existujících obran a brání zdvojeným nápravám.
5. **Kadence etických kontrol**: během aktivních operací udržovat automatizované etické
   ověření každých 10–15 sekund. Brání to přesahu útočného myšlení do skutečně škodlivého území.
6. **Stupňovaná složitost**: začínat kampaně základními scénáři a eskalovat ke složeným útokům.
   Tím se ověří základní obrany dřív, než se testují sofistikované útoky z více primitiv.
7. **Úplnost auditní stopy**: každá operace Red Teamu musí vytvořit neměnný auditní záznam.
   Mezery v auditu vytvářejí slepá místa odpovědnosti a podkopávají integritu bezpečnostního
   programu.
8. **Aktuálnost taxonomie**: taxonomii útoků revidovat a aktualizovat nejméně jednou měsíčně.
   Nové funkce testovaného systému vytvářejí nové útočné plochy, které existující scénáře
   nemusí pokrývat.

## Časté chyby

- **Rozšiřování rozsahu**: útočné myšlení se může posunout od testování obrany k vývoji
  skutečných útočných schopností. Přísné eskalační stráže tomuto přechodu brání. Hranice mezi
  „testováním obrany“ a „vývojem útoku“ vyžaduje trvalou bdělost.
- **Falešná jistota z ubráněných výsledků**: scénář klasifikovaný jako „ubráněný“ dokazuje jen
  to, že byl zablokován konkrétní vektor útoku. Varianty mohou uspět. Složené scénáře testují
  robustnost obrany vůči novým kombinacím, které jednotlivé základní scénáře odhalit nemohou.
- **Přehlížení podprahových zjištění**: částečná obejití a těsná minutí často ukazují na
  závažnější zranitelnosti než čistá selhání. Analytik uzavření v Purple Teamu cíleně sleduje
  vzorce v dílčích výsledcích, které naznačují systémové slabiny.
- **Porušení síťové izolace**: i přístup do sítě „jen pro čtení“ může prozradit informace
  o útočných schopnostech nebo vnitřní architektuře. Nulový přístup do sítě je pro útočné
  operace nepodkročitelný.
- **Zastarávání taxonomie**: taxonomie útoků vyžadují průběžnou aktualizaci, jak se testovaný
  systém vyvíjí. Nové funkce vytvářejí nové útočné plochy. Taxonomie je živý dokument,
  ne pevná reference.
- **Předčasné ukončení kampaně**: zastavení kampaně po prvních „ubráněných“ výsledcích vynechá
  stupňovanou složitost, kterou složené scénáře přinášejí. Plán kampaně je třeba vždy dokončit.

## Historický kontext a vývoj v odvětví

Red teaming má kořeny ve vojenské strategii studené války, kdy se jednotky simulující
protivníka označovaly „červeně“. Do kybernetické bezpečnosti se praxe dostala přes vojenskou
a zpravodajskou komunitu v 90. letech, do hlavního proudu ji uvedla publikace NIST SP 800-115
(*Technical Guide to Information Security Testing and Assessment*) a dále se vyvinula se
systematickým katalogem taktik, technik a postupů protivníka v rámci MITRE ATT&CK.

Rozšíření red teamingu na epistemickou bezpečnost je novější vývoj. Jak se systémy umělé
inteligence stále víc podílejí na rozhodování, rozšiřuje se útočná plocha za tradiční
infrastrukturu na znalostní systémy, pipeline uvažování a mechanismy kalibrace důvěry, na
které se umělá inteligence spoléhá. Epistemický red teaming na tuto rozšířenou útočnou plochu
odpovídá pěti primitivy útoku a jejich systematickou taxonomií.

## Související

- [Blue Team](@/glossary/blue-team.md) – obranný protějšek, který přijímá zjištění Red.
- [Purple Team](@/glossary/purple-team.md) – syntetický uzel uzavírání smyčky Red–Blue.
- [Epistemická bezpečnost](@/glossary/epistemic-security.md) – oblast, kterou útočná
  simulace testuje.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: red-team](@/kompendium/glossary-bridges/bridge-red-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
