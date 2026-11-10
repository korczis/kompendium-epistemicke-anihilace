+++
title = "Anonymizace a pseudonymizace výzkumných dat"
description = "Jak chránit identitu účastníků výzkumu manipulace: přímé a nepřímé identifikátory, malé komunity, kvalitativní citace, k-anonymita a riziko reidentifikace."
weight = 34

[taxonomies]
tags = ["kompendium", "research-methodology", "ethics"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["data-security-EA-research", "informed-consent-EA-research", "publication-ethics-EA", "case-study-design-EA"]
toc = true
+++

Pro účastníky výzkumu [epistemické anihilace](@/glossary/epistemicka-anihilace.md) může být
odhalení identity nebezpečné: bývalý partner, skupina nebo zaměstnavatel se může dozvědět,
že o nich mluvili. Zároveň platí požadavek otevřené vědy, aby data byla sdílena a výsledky
ověřitelné. Anonymizace je soubor postupů, které tyto dva požadavky smiřují – a v tomto
oboru je obtížnější, než se obvykle předpokládá, protože komunity bývalých členů skupin
jsou malé a příběhy jedinečné.

## Vymezení

GDPR (nařízení (EU) 2016/679) rozlišuje:

- **pseudonymizaci** – údaje nelze přiřadit konkrétní osobě bez dodatečných informací
  (klíče), které jsou uchovávány odděleně; pseudonymizovaná data jsou stále osobními údaji;
- **anonymizaci** – údaje nelze přiřadit osobě žádnými rozumně dostupnými prostředky;
  anonymní data přestávají být osobními údaji.

Identifikátory se dělí na **přímé** (jméno, adresa, telefon, fotografie, hlas) a **nepřímé**
(kvazi-identifikátory: věk, povolání, obec, datum události, název skupiny), které v kombinaci
mohou osobu jednoznačně určit. Latanya Sweeneyová ukázala, že kombinace několika běžných
údajů stačí k identifikaci velké části populace, a navrhla koncept **k-anonymity**
(Sweeney 2002): každá kombinace kvazi-identifikátorů se v datech vyskytuje alespoň u *k*
osob. Navazující koncepty (l-diverzita, t-blízkost) chrání i citlivé atributy. Pro agregované
statistiky existuje **diferenciální soukromí** (Dwork 2006), které do výsledků přidává
kalibrovaný šum.

## Kdy je téma klíčové

- Při **sdílení dat** v repozitářích a při jejich předání jiným týmům.
- Při **publikaci** citací, kazuistik a tabulek s malými počty.
- Při práci s **nahrávkami, dokumenty a síťovými daty**, které obsahují údaje o třetích osobách.
- Při **dlouhodobém uchovávání** dat – riziko reidentifikace roste s tím, jak přibývá
  veřejně dostupných informací.

## Postup

1. **Minimalizace sběru** – nesbírat, co není nutné. Nejlepší ochrana identifikátoru je,
   že neexistuje.
2. **Oddělení identifikačních údajů** od výzkumných dat od prvního kontaktu; kódový klíč
   uložený zvlášť s omezeným přístupem.
3. **Pseudonymizace během zpracování** – kódy místo jmen v přepisech, souborech a poznámkách.
4. **Úprava přepisů** – odstranění nebo zobecnění jmen, míst, dat, názvů skupin,
   neobvyklých událostí a jazykových zvláštností.
5. **Posouzení rizika reidentifikace** před sdílením nebo publikací – kdo by mohl účastníka
   poznat (motivovaný útočník, člen skupiny, rodina) a s jakými informacemi.
6. **Volba úrovně sdílení** – veřejný repozitář, řízený přístup na základě žádosti, nebo
   nesdílení s odůvodněním.
7. **Zničení klíče**, jakmile už není potřeba (podle protokolu).

## Specifika výzkumu epistemické manipulace

**Malé komunity, silné detaily.** V komunitě bývalých členů jedné skupiny se lidé znají.
Údaj „žena, 40 let, ve skupině 12 let, odešla s dětmi“ může stačit k identifikaci, i když
neobsahuje jméno. Kvalitativní data se proto anonymizují pečlivěji než kvantitativní:
mění se nebo vynechávají detaily, které nejsou pro analýzu podstatné, a zobecňují se ty,
které podstatné jsou („dlouholetá členka“ místo přesného počtu let).

**Jazyk jako identifikátor.** Specifický slovník skupiny, přezdívky, interní názvy obřadů
nebo míst prozradí skupinu i bez jejího jména. Výzkumník musí zvážit, zda je identifikace
skupiny pro výzkum nutná, a pokud ne, zobecnit i jazyk.

**Motivovaný útočník.** Obvyklé posouzení rizika počítá s náhodným čtenářem. Ve výzkumu
manipulace je reálným útočníkem osoba nebo skupina s motivací zjistit, kdo mluvil – a s
detailní znalostí kontextu. Anonymizace musí obstát i proti ní.

**Třetí osoby.** Výpovědi obsahují údaje o lidech, kteří s výzkumem nesouhlasili – o
partnerovi, vedení skupiny, dětech. I tyto osoby se anonymizují; zvlášť opatrně u údajů,
které by mohly být chápány jako obvinění (viz [Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)).

**Anonymizace kazuistik.** Kniha pracuje s anonymizovanými kompozity
(viz [Případové studie](@/kompendium/case-studies/_index.md)) – kombinací prvků z více případů,
aby žádný nebyl rozpoznatelný. Kompozit je vhodný pro výuku, ne pro výzkumná data, protože
mění samotná data; ve výzkumné zprávě musí být jasné, zda jde o skutečný případ, nebo kompozit.

**Spojování datových souborů.** Riziko reidentifikace nevzniká jen z jednoho souboru, ale
ze spojení s jinými, veřejně dostupnými daty. Narayanan a Shmatikov (2008) ukázali na
údajně anonymizovaných hodnoceních filmů, že několik málo známých údajů o osobě stačí
k jejímu nalezení v rozsáhlém souboru. Pro výzkum manipulace z toho plyne, že i zdánlivě
neškodné atributy – data událostí, pořadí změn bydliště, veřejně sdílené příspěvky – mohou
po spojení s profilem na sociální síti nebo s informacemi skupiny o vlastních členech
odhalit, kdo se studie účastnil. Posouzení rizika proto musí zahrnout i to, jaké informace
má k dispozici osoba, před níž je účastník chráněn.

**Hlas a obraz.** Nahrávky hlasu a videa nelze plně anonymizovat bez ztráty informace.
Sdílejí se zpravidla jen přepisy; pokud je zvuk pro analýzu nutný, zůstává v zabezpečeném
úložišti týmu (viz [datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Minimalizace | které identifikátory se nesbíraly |
| Oddělení | kde a jak je uložen klíč, kdo k němu má přístup |
| Úprava dat | pravidla úpravy přepisů a citací |
| Riziko | posouzení reidentifikace včetně motivovaného útočníka |
| Sdílení | úroveň přístupu a její zdůvodnění |
| Životní cyklus | kdy a jak se klíč a surová data ničí |

## Vztah k ostatním etickým pojistkám

Anonymizace navazuje na [informovaný souhlas](@/kompendium/research-methodology/informed-consent-EA-research.md)
(účastník ví, co se s daty stane, a souhlasí se sdílením nebo ne) a na [datovou bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md)
(ochrana dat před anonymizací). Rozhodnutí o sdílení dat je součástí [publikační etiky](@/kompendium/research-methodology/publication-ethics-EA.md);
požadavek otevřenosti nemá přednost před bezpečím účastníků.

## Časté chyby

- odstranění jmen považované za anonymizaci;
- citace s jedinečnými detaily („jako jediná z kurzu jsem…“);
- tabulky s buňkami o jednom nebo dvou lidech;
- klíč uložený ve stejné složce jako data;
- zapomenutí na metadata souborů (autor dokumentu, souřadnice fotografie);
- sdílení dat v repozitáři bez posouzení rizika v malé komunitě.

## Ilustrativní příklad

*Hypotetický postup.* Tým připravuje sdílení přepisů dvaceti rozhovorů s bývalými členy
několika skupin. Nejprve nahradí jména kódy a odstraní místa. Pak dva členové týmu nezávisle
čtou přepisy z pohledu „člověka ze skupiny“ a označují místa, podle nichž by účastníka poznali:
neobvyklá funkce ve skupině, konkrétní konflikt, který byl ve skupině známý, výrazná fráze.
Tato místa se zobecní nebo vynechají. Tři přepisy zůstanou i po úpravě rizikové – účastníci
byli ve skupině příliš viditelní. Tým se s nimi spojí; dva souhlasí jen s řízeným přístupem,
jeden žádá, aby jeho přepis nebyl sdílen vůbec. Repozitář tak obsahuje sedmnáct přepisů
s řízeným přístupem a popis toho, proč tři chybí.

## Využití v praxi

Stejné principy platí pro poradny, které zveřejňují příběhy klientů, pro novináře, pro
organizace, které publikují výsledky [interních vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md),
i pro autory kazuistik v odborných časopisech. Otázka „poznal by ho někdo, kdo ho zná
a chce ho poznat?“ je užitečnější než kontrolní seznam odstraněných údajů.

## Jak posoudit studii z tohoto hlediska

- **Popisuje studie, jak anonymizovala**, nebo jen tvrdí, že data jsou anonymní?
- **Obsahují citace jedinečné detaily?**
- **Jsou data sdílena** a pokud ne, je to zdůvodněno?
- **Jsou malé buňky v tabulkách potlačeny nebo sloučeny?**

## Meze a otevřené otázky

Úplná anonymizace kvalitativních dat často znamená ztrátu kontextu, který je pro porozumění
nezbytný. Otevřenou otázkou je, jak sdílet bohatá data o jedinečných zkušenostech, aniž by se
ohrozili lidé, kteří je poskytli, a jak se postavit k rostoucím možnostem automatické
reidentifikace z textu.

## Literatura

- Sweeney, L. (2002). k-anonymity: A model for protecting privacy.
- Dwork, C. (2006). Differential privacy.
- Narayanan, A., Shmatikov, V. (2008). Robust de-anonymization of large sparse datasets.
- Nařízení Evropského parlamentu a Rady (EU) 2016/679 (GDPR), zejména čl. 4 a čl. 89.

## Související

**Etika v této sekci**

- [Datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md) – ochrana dat před anonymizací.
- [Informovaný souhlas](@/kompendium/research-methodology/informed-consent-EA-research.md) – souhlas se sdílením.
- [Publikační etika](@/kompendium/research-methodology/publication-ethics-EA.md) – otevřenost a její meze.
- [Design případové studie](@/kompendium/research-methodology/case-study-design-EA.md) – jedinečný případ a identifikace.

**Právo a praxe**

- [Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md) – údaje o třetích osobách.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md) – organizační obdoba.

**Kritika a pojmy**

- [Důvěrnost v EA detekci](@/kompendium/critical-perspectives/17-confidentiality-EA.md) – důvěrnost v klinice.
- [Doxing](@/glossary/doxing.md) – co hrozí při odhalení identity.
