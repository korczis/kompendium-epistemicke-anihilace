+++
title = "Chain of custody (řetězec úschovy důkazů)"
weight = 5
description = "Nepřetržitá, zdokumentovaná kontrola nad důkazem od zajištění po předložení, která prokazuje jeho pravost, neporušenost a použitelnost v řízení i v due diligence."

[taxonomies]
tags = ["glossary", "forensic", "legal", "compliance", "due-diligence"]

[extra]
category = "forensic"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
abbreviation = "CoC"
date_created = "2026-05-03"
date_updated = "2026-11-10"
importance = "critical"
related_terms = ["evidence", "verifiable-evidence", "evidence-over-opinion", "due-diligence", "forensic-interview", "pattern-evidence", "expert-witness"]
key_takeaway = "Chain of custody je nepřerušený, průběžně vedený záznam, který dokládá, že důkaz zůstal pravý a nezměněný od okamžiku zajištění do okamžiku rozhodnutí. Každá nevysvětlená mezera může jinak průkazný důkaz učinit nepoužitelným."
+++

## Definice

**Chain of custody** (CoC, česky *řetězec úschovy* nebo *řetězec nakládání s důkazem*) je
chronologický, zdokumentovaný sled zajištění, předání, analýzy a naložení s fyzickým nebo
digitálním důkazem. Zaznamenává se každá osoba, která s předmětem nakládala, čas každého
předání a účel každé manipulace. Smyslem záznamu je prokázat dvě věci: že jde o tentýž předmět,
který byl zajištěn, a že je v podstatě v nezměněném stavu (Federal Rules of Evidence, 1975).

Řetězec úschovy je předpokladem každé forenzní operace i každé [due
diligence](@/glossary/due-diligence.md): bez souvislé dokumentace se i průkazný nález stává
procesně bezcenným, protože nelze vyloučit záměnu, kontaminaci nebo úpravu (ISO, 2012).

Princip se neomezuje na fyzické předměty. Vztahuje se i na digitální artefakty – obrazy disků,
výpisy paměti, exporty databází a logy – u nichž je neporušenost prokazována kryptografickým
otiskem a práce probíhá na ověřené kopii, nikoli na originálu (Casey, 2011). Stejný požadavek
dopadá na zjištění z [OSINT](@/glossary/osint.md), u nichž je třeba doložit, kdo, kdy a odkud
informaci získal (Kent a kol., 2006).

## Původ a kontext pojmu

Doktrína vyrostla z angloamerického dokazování, zejména z požadavku na prokázání pravosti
(*authentication*): strana, která důkaz předkládá, musí předložit tvrzení a podklady dostatečné
k závěru, že předmět je tím, čím se být tvrdí (Federal Rules of Evidence, 1975). Na týž
požadavek navazuje americké kritérium přípustnosti odborného důkazu, podle něhož musí být
metoda a její použití přezkoumatelné (Daubert, 1993).

V českém trestním řízení není řetězec úschovy pojmenovaným institutem, ale plyne z požadavku,
aby důkaz byl získán a proveden zákonným způsobem a aby bylo možné ověřit jeho původ; obecná
úprava dokazování je v trestním řádu, zákon č. 141/1961 Sb., § 89 a následující.

V digitální forenzní analýze je standard přísnější a mezinárodně kodifikovaný: norma ISO/IEC
27037 upravuje identifikaci, sběr, získání a uchování digitálních důkazů tak, aby byla
doložitelná jejich neporušenost (ISO, 2012). Pro reakci na incidenty popsal obdobný rámec
přehled amerického normalizačního institutu (Kent a kol., 2006), pro archivaci webového obsahu
slouží formát WARC kodifikovaný jako norma (ISO, 2017).

## Jak se projevuje

Řetězec v pořádku je rozpoznatelný podle toho, že na každou otázku „kde byl tento předmět v
tomto čase“ existuje odpověď v záznamu, a to včetně účelu a podpisu obou stran předání;
u digitálních kopií se otisk ze zajištění shoduje s otiskem před analýzou (Casey, 2011).

Typické vady jsou naopak rozpoznatelné z mezer: porušené pečeti, chybějící podpis v předávacím
protokolu, nezdokumentované „vypůjčení“ důkazu, uložení v prostředí bez auditu přístupu nebo
snímek obrazovky bez data, adresy a metadat. Právě takové mezery bývají důvodem, pro nějž je
jinak relevantní nález zpochybněn nebo odmítnut (Federal Rules of Evidence, 1975).

Zvláštní podobou vady je analýza prováděná na originálu místo na ověřené kopii, protože
znemožňuje opakování zkoumání jinou stranou a tím i jeho přezkoumatelnost (Daubert, 1993).

## Mechanismus, který řetězec zajišťuje

Řetězec úschovy převádí důvěru v osoby na ověřitelnost záznamů. Soud ani regulátor nemusí
věřit, že vyšetřovatel jednal poctivě; stačí, že každý krok je zachycen tak, aby jej bylo možné
zpětně přezkoumat – a přezkoumatelnost je přesně to, co kritérium přípustnosti odborného důkazu
žádá (Daubert, 1993).

U digitálních stop je tento převod proveden matematicky: kryptografický otisk zachycuje stav
nosiče na úrovni bitů, takže změna jediného bitu je zjistitelná bez ohledu na to, kdo ji
způsobil (Casey, 2011). Záznam tak chrání důkaz před zpochybněním a zároveň chrání toho, kdo
jej předkládá, před obviněním z manipulace (ISO, 2012).

## Etický rámec

Vedení řetězce úschovy není eticky neutrální úkon. Záznam, který prokazuje neporušenost
důkazu, zároveň shromažďuje údaje o lidech, kteří s ním nakládali, i o těch, jichž se důkaz
týká, a norma pro digitální důkazy proto váže sběr na vymezený účel a na doložitelnou
odpovědnost konkrétní osoby (ISO, 2012). U osob v tísni z toho plyne praktický důsledek:
záznam vedený obětí je její vlastní, nikoli podklad k předání bez jejího souhlasu (Stark,
2007).

Druhým etickým požadavkem je přezkoumatelnost na obě strany. Řetězec, který není
zdokumentován tak, aby jej mohla zkoumat i protistrana, neplní svůj účel, protože přípustnost
odborného důkazu je vázána právě na možnost nezávislého přezkumu metody (Daubert, 1993).

## Odlišení

Od pravosti obsahu je třeba řetězec úschovy odlišit nejdůrazněji: dokládá, že důkaz je tentýž
a nezměněný, ale neříká nic o tom, zda je jeho obsah pravdivý; pravost a vypovídací hodnota se
posuzují zvlášť (Federal Rules of Evidence, 1975).

Od dokumentace vyšetřování je užší. Dokumentace zahrnuje i postup, hypotézy a jejich
vyvracení, tedy to, co u odborného důkazu posuzuje kritérium metody (Daubert, 1993); podrobně
to rozvádí [forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md).

Od [forensic interview](@/glossary/forensic-interview.md) se liší druhem důkazu: u výpovědi
nelze zajistit předmět, a proto se dokládá způsob získání a záznamu, nikoli neporušenost
nosiče (Kent a kol., 2006).

Od [pattern evidence](@/glossary/pattern-evidence.md) se liší rovinou: důkaz vzorcem stojí na
souboru jednotlivostí, z nichž každá musí mít vlastní doložený řetězec, jinak se vzorec
zhroutí s první spornou položkou (Casey, 2011).

## Význam pro Kompendium

Pro témata knihy má řetězec úschovy dvojí význam. Prvním je obrana dotčeného: lidé vystavení
[gaslightingu](@/glossary/gaslighting.md) nebo [coercive control](@/glossary/coercive-control.md)
často nemají jak doložit, co se stalo, protože druhá strana zpochybňuje jejich paměť; vedení
datovaných záznamů a bezpečné uchovávání originálů zpráv je svépomocnou podobou téhož principu
(Stark, 2007). Praktickou oporu nabízejí [archiv
vzpomínek](@/kompendium/self-defense-guides/43-memory-archive.md) a [uchování
důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md).

Druhým je odolnost proti obrácení role. Harseyová a Freydová doložily, že strategie popření,
útoku a převrácení role oběti a pachatele snižuje vnímanou věrohodnost oběti u pozorovatelů
(Harsey a Freyd, 2020); doložený řetězec úschovy tento účinek oslabuje, protože přesouvá spor
z důvěryhodnosti osob na přezkoumatelnost záznamů. V knize se tomu věnuje heslo
[DARVO](@/glossary/darvo.md).

Pro elektronické důkazy rozvádí specifika kapitola [elektronické
důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md); postup pro forenzní a právní
praxi popisuje kapitola [řetězec úschovy
důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md).

## Kde se uplatňuje

Při fúzích a akvizicích řetězec úschovy určuje, jak se mezi advokáty, poradci a budoucím
kupujícím předávají exporty z datové místnosti a podklady forenzního účetnictví; bez toho nelze
později prokázat, který stav dokumentů byl podkladem rozhodnutí (Casey, 2011).

V šetření z otevřených zdrojů jde především o to, že webový obsah je proměnlivý: proto se
zachycují časově označené odpovědi protokolu HTTP a archivní záznamy ve formátu WARC, který je
pro dlouhodobé uchování kodifikován jako norma (ISO, 2017).

Při reakci na incidenty se řetězec vede nad obrazy disků, výpisy paměti a exporty logů, které
mohou později podpořit trestní oznámení; právě proto je sběr popsán jako samostatná fáze
s vlastní dokumentací (Kent a kol., 2006).

## Meze a kritika

První mezí je, že řetězec úschovy je nutnou, ne dostatečnou podmínkou. Dokonale vedený záznam
nic nevypovídá o tom, zda byl předmět relevantní, ani o kvalitě metody, kterou byl zkoumán;
právě tento rozdíl odděluje přípustnost od vypovídací hodnoty (Daubert, 1993).

Druhou mezí je asymetrie nákladů. Požadavky kodifikované pro profesionální forenzní praxi
(ISO, 2012) jsou pro jednotlivce nedosažitelné, a soudy proto u záznamů vedených obětí váží
dosažitelnou míru doložitelnosti, nikoli normu určenou laboratořím. Pro knihu z toho plyne, že
svépomocný záznam má cenu i tehdy, když profesionálnímu standardu nedostojí (Stark, 2007).

Otevřenou otázkou zůstává nakládání s důkazy, jež vznikají a mizí v cizí infrastruktuře –
zprávami v uzavřených aplikacích, obsahem generovaným na vyžádání nebo stavem účtu u třetí
strany –, kde zajištění originálu není v moci strany, která jej potřebuje (Kent a kol., 2006).

## Literatura

- Casey, E. (2011). *Digital Evidence and Computer Crime* (3. vydání). Academic Press.
- Daubert v. Merrell Dow Pharmaceuticals, Inc. (1993). Rozsudek Nejvyššího soudu Spojených států o přípustnosti odborného důkazu.
- Federal Rules of Evidence (1975), Rule 901 – *Authenticating or Identifying Evidence* (USA).
- Harsey, S., & Freyd, J. J. (2020). *Deny, attack, and reverse victim and offender (DARVO): What is the influence on perceived perpetrator and victim credibility?* Journal of Aggression, Maltreatment & Trauma.
- ISO/IEC (2012). *ISO/IEC 27037:2012 – Guidelines for identification, collection, acquisition and preservation of digital evidence*.
- ISO (2017). *ISO 28500:2017 – WARC file format*.
- Kent, K., Chevalier, S., Grance, T., & Dang, H. (2006). *Guide to Integrating Forensic Techniques into Incident Response* (NIST SP 800-86).
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Zákon č. 141/1961 Sb., o trestním řízení soudním (trestní řád), ustanovení o dokazování.

## Související

**Pojmy**

- [Due diligence](@/glossary/due-diligence.md) – postup, v němž je řetězec úschovy povinný.
- [Forensic interview](@/glossary/forensic-interview.md) – sesterský postup pro výpovědní důkazy.
- [Expert witness](@/glossary/expert-witness.md) – znalec, který řetězec dokládá před soudem.
- [Pattern evidence](@/glossary/pattern-evidence.md) – důkaz vzorcem, který stojí na jednotlivostech.
- [DARVO](@/glossary/darvo.md) – obrácení role, proti němuž záznam chrání.

**Forenzní a právní praxe**

- [Řetězec úschovy důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – podrobný rozbor.
- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – jak důkazy zajistit včas.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – specifika digitálních stop.
- [Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md) – širší záznam vyšetřování.

**Obrana dotčeného**

- [Archiv vzpomínek](@/kompendium/self-defense-guides/43-memory-archive.md) – svépomocná podoba řetězce.
- [Coercive control](@/glossary/coercive-control.md) – prostředí, v němž je záznam nejcennější.
