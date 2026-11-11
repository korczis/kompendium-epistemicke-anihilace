+++
title = "Purple Team (fialový tým)"
weight = 21
description = "Syntetický uzel mezi útočným a obranným bezpečnostním týmem s výhradní pravomocí uzavírat smyčku Red–Blue a bezpečnostní nálezy."

[taxonomies]
tags = ["glossary", "security"]

[extra]
category = "security"
related_terms = ["red-team", "blue-team"]
complexity = "advanced"
domain = "security-operations"
layer = "synthesis"
paradigm = "adversarial-defensive-synthesis"
quality_impact = "high"
safety_level = "safety-critical"
documentation_required = true
see_also = ["red-team", "blue-team"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Purple", "Team", "Red-Blue", "glossary", "security", "Purple Team", "Red Team", "Blue Team"]
image = "/images/sections/glossary.png"
image_alt = "Purple Team (fialový tým) – glosář"
+++

## Definice a přehled

Purple Team (fialový tým) je specializovaná jednotka bezpečnostního provozu, která slouží jako
ústřední syntetický uzel mezi útočným (Red) a obranným (Blue) bezpečnostním týmem. Na rozdíl
od tradičních modelů, v nichž Red a Blue Team pracují nezávisle, zajišťuje Purple Team
nepřetržité zpětné vazby, mapuje útočná zjištění na obranné schopnosti a má výhradní
pravomoc k přechodům do stavu uzavření. Tím brání předčasnému odbytí bezpečnostních nálezů
a zajišťuje, že každá zjištěná zranitelnost byla skutečně vyřešena, ne jen vzata na vědomí.

V širším odvětví kybernetické bezpečnosti vznikl purple teaming z poznání, že Red a Blue
Team pracující izolovaně často nepředávají poznatky účinně. Zjištění se ztrácejí, obrana
zůstává netestovaná proti známým útokům a organizace si vytvářejí slepá místa. Model
Purple Teamu to řeší vyhrazenou syntetickou funkcí, která propojuje útočnou a obrannou
perspektivu, aby každý scénář útoku odpovídal ověřené obraně a každá obrana byla ověřena
proti realistickým hrozbám.

Pro Kompendium je podstatná myšlenka, že „uzavřít“ problém smí jen ten, kdo ověřil skutečnou
nápravu, nikoli ten, komu uzavření přináší úlevu – v oblasti EA to platí pro intervence
i pro hodnocení zotavení.

## Historický kontext a vývoj v odvětví

Koncept purple teamingu vychází z omezení pozorovaných u tradičních cvičení Red Team / Blue
Team. Organizace kybernetické bezpečnosti po desetiletí pořádaly periodická cvičení, v nichž
se útoční specialisté snažili prolomit obranu a Blue Team pak analyzoval, co přehlédl a jak
se zlepšit. Zásadním problémem tohoto sekvenčního modelu je mezera v předávání znalostí:
Red Team píše zprávy, Blue Team je čte a převod od „útok uspěl“ k „obrana se zlepšila“ často
ztratí podstatné nuance.

Termín „Purple Team“ se v komunitě kybernetické bezpečnosti prosadil zhruba v polovině
10. let 21. století, zpočátku pro společná cvičení, při nichž členové Red a Blue Teamu
pracují bok po boku. Organizace jako SANS Institute metodiky purple teamingu formalizovaly
a zdůraznily zpětnou vazbu v reálném čase mezi provedením útoku a ověřením obrany. Většina
implementací v odvětví však chápe purple teaming jako periodickou činnost – plánované
workshopy nebo čtvrtletní cvičení –, ne jako nepřetržitou provozní funkci.

Analogii nabízí bezpečnost letectví, kde se „uzavírání smyčky“ u bezpečnostních zjištění
přísně vynucuje regulatorními rámci, jako jsou systémy řízení bezpečnosti (SMS, *Safety
Management Systems*). V letectví nelze bezpečnostní zjištění uzavřít, dokud není nápravné
opatření zavedeno, ověřeno a prokazatelně nebrání opakování.

## Mapování na katalog chování protivníka

Současná praxe purple teamingu se opírá o veřejné katalogy chování protivníka, především o rámec
MITRE ATT&CK (Strom a kol. 2018). Ten popisuje taktiky a techniky pozorované u skutečných
útočníků a dává útočné i obranné straně společný slovník: útočné zjištění lze zapsat jako
identifikátor techniky a obranné opatření jako tvrzení, že právě tuto techniku organizace
detekuje. Teprve tím se smyčka Red–Blue uzavírá nad něčím ověřitelným — nad soupisem tvrzení
o detekci, která lze jedno po druhém zkoušet. Detekční pravidlo se v tomto pojetí chápe jako
hypotéza: má-li smysl, musí být možné popsat pozorování, které by je vyvrátilo.

Mapování na katalog však vede k vlastní epistemické chybě, na niž upozorňují sami autoři rámce:
ATT&CK zachycuje chování, které už někdo zaznamenal. Pokrytí katalogu je proto pokrytím známého,
nikoli pokrytím prostoru hrozeb, a vysoké „pokrytí ATT&CK“ není mírou bezpečnosti. Jakmile se
takto spočítaným pokrytím začne vykazovat obranná vyspělost, platí pro ně táž výhrada jako pro
míru uzavření zjištění v následujícím oddílu.

## Vynucení antimetrik

Charakteristickým rysem Purple Teamu je filosofie vynucení antimetrik: aktivní odolávání
pobídkám k uzavírání řízenému metrikami. Mezi běžné antivzorce
bezpečnostního provozu patří uzavírání zjištění kvůli splnění KPI míry uzavření, snižování
závažnosti, aby nedošlo k zablokování nasazení, nebo přijímání částečných oprav kvůli lepším
statistikám. Výhradní pravomoc Purple Teamu nad přechody do uzavření brání tomu, aby tyto
organizační tlaky ohrozily bezpečnostní integritu.

### Odhalované a blokované antivzorce

| Antivzorec | Metoda detekce | Reakce |
|-------------|-----------------|----------|
| **Uzavírání kvůli KPI** | skoky míry uzavření bez úměrné aktivity oprav | blokace + šetření |
| **Snižování závažnosti** | změny závažnosti bez nových důkazů | vyžadovat důkazy pro překlasifikaci |
| **Přijetí částečné opravy** | oprava řeší příznak, ne kořenovou příčinu | ponechat otevřené, sledovat dílčí pokrok |
| **Vypršení časem** | automatické uzavření po časovém prahu | zakázáno – zjištění nikdy nevyprší |
| **Uzavírání kopírováním** | totožné zdůvodnění uzavření u více zjištění | označit k individuálnímu přezkumu |

Filosofie antimetrik vychází z pozorování, že Goodhartův zákon (v často citované formulaci
Marilyn Strathernové: „Když se míra stane cílem, přestane být dobrou mírou“) platí pro
bezpečnostní metriky obzvlášť silně. Jakmile organizace měří „míru uzavření zjištění“,
optimalizuje uzavírání zjištění, ne zlepšování bezpečnosti. Nezávislost Purple Teamu na
termínech dodávek a výkonnostních metrikách zajišťuje, že rozhodnutí o uzavření stojí jen na
důkazech.

Stejný vzorec zná Kompendium z institucí, které „uzavírají“ stížnosti obětí kvůli
statistikám nebo pověsti; obranou je i tam oddělení toho, kdo uzavírá, od toho, komu uzavření
prospívá (viz [Riziko obětování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md)).

## Detekce falešného uzavření

Na falešné uzavření ukazují tyto vzorce:

- **Opravy na úrovni příznaku**: záplaty, které řeší konkrétní exploit, ale ne podkladovou
  třídu zranitelnosti. Pravidlo WAF blokuje konkrétní payload SQL injection, zatímco problém
  s parametrizací dotazů trvá.
- **Opravy závislé na prostředí**: obrany, které fungují v testování, ale ne v produkčních
  konfiguracích. Bezpečnostní hlavička přidaná do testovací konfigurace, ale ne do
  produkčních nasazovacích skriptů.
- **Částečné pokrytí**: opravy, které uzavřou jeden vektor útoku a příbuzné ponechají
  zneužitelné. Záplata jednoho endpointu, zatímco jiné endpointy mají tutéž zranitelnost.
- **Časem oslabené obrany**: obrany, které byly v době uzavření účinné, ale oslabily kvůli
  změnám infrastruktury, aktualizacím závislostí nebo posunu konfigurace.

## Co uzavřená smyčka nedokazuje

Úspěšná detekce v testu nedokazuje, že by detekce zafungovala v provozu: test běží ve známém
čase, ze známého místa a často v prostředí, z něhož je část provozního šumu odstraněna.
Nedokazuje ani, že by se skutečný protivník touto cestou vydal — volba cesty závisí na jeho
záměru a možnostech, o nichž simulace nevypovídá. A konečně uzavřené zjištění nedokazuje, že
riziko zmizelo; dokazuje nejvýš, že jeden ověřitelný projev rizika byl odstraněn.
*Interpretace knihy*: právě tato tři rozlišení jsou důvod, proč kniha analogii purple teamingu
užívá jen k rozpoznávání vzorců a nikdy jako důkaz o záměru druhého člověka — ověřená detekce
vzorce říká, co se stalo, ne proč.

## Osvědčené postupy

1. **Odolávat tlaku zúčastněných stran na uzavření.** Hodnota Purple Teamu spočívá právě
   v nezávislosti na termínech dodávek. Slevit ze standardů uzavření kvůli termínům podkopává
   celý model bezpečnostního provozu.
2. **Nikdy neuzavírat zjištění automaticky podle času.** Na rozdíl od úkolů v řízení projektů
   bezpečnostní zjištění stářím neztrácejí relevanci. Neopravená zranitelnost je po šesti
   měsících stejně nebezpečná jako v den objevení.

## Časté chyby

- **Chápat uzavření binárně**: zjištění existují na škále vyřešení. Částečné opravy mohou
  snížit riziko, aniž by dosáhly úplného uzavření. Purple Team sleduje dílčí nápravu jako
  snížení rizika a zjištění ponechává otevřené.
- **Organizační odpor**: bezpečnostní týmy zvyklé uzavírat zjištění jednostranně mohou
  pravomoci Purple Teamu vzdorovat. Odpor je očekávatelný a je třeba ho řešit vzděláváním
  o nákladech falešného uzavření.

## Literatura

- Strathern, M. (1997). „Improving ratings“: audit in the British University system. *European Review*.
- Strom, B. E., a kol. (2018). *MITRE ATT&CK: Design and Philosophy*. MITRE.

## Související

- [Red Team](@/glossary/red-team.md) – útočná simulace, jejíž zjištění Purple syntetizuje.
- [Blue Team](@/glossary/blue-team.md) – obranný tým dodávající data o obranném postavení.
- [Riziko obětování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md) –
  institucionální „uzavírání“ stížností kvůli statistikám.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: purple-team](@/kompendium/glossary-bridges/bridge-purple-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
