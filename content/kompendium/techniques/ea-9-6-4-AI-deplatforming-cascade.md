+++
title = "EA-9.6.4 AI Deplatforming Cascade"
description = "Vzorec, v němž automatický zásah proti účtu na jedné platformě spustí přes sdílené signály zásahy na dalších, takže se člověk musí odvolávat všude zvlášť."
weight = 964

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-3-automated-content-takedown", "ea-9-3-8-mass-reporting-coordination", "ea-9-6-10-AI-welfare-decision-EA"]
parent = "kompendium-techniques"
ea_code = "EA-9.6.4"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.4 AI Deplatforming Cascade

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.4`
**Název:** AI [Deplatforming](@/glossary/deplatforming.md) Cascade
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI deplatforming cascade* je kaskáda zásahů proti účtu napříč platformami a službami: označení na jedné platformě se přes sdílené signály, seznamy nebo automatické systémy přenese na další – sociální sítě, platební služby, hostingy, obchody s aplikacemi. Postižený ztrácí přístup k více službám současně a musí se odvolávat na každé zvlášť, často bez informace, co zásah spustilo.

## 3. Mechanismus (strukturálně)

Služby si stále častěji sdílejí signály o rizikových účtech – v dobrém úmyslu, aby zastavily podvody, násilný extremismus nebo zneužívání. Tento systém ale přenáší i chyby: chybné označení na jedné platformě se stává „důkazem“ pro další, aniž by kdokoli posoudil původní případ. Protože každá služba vidí jen signál, nikoli důvod, nemůže chybu odhalit. Výsledkem je [deplatforming](@/glossary/deplatforming.md), který nemá autora ani srozumitelné zdůvodnění. Jako epistemická agrese se vzorec uplatní tam, kde ho někdo vědomě spustí – například koordinovaným nahlašováním ([EA-9.3.8](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md)) –, aby cíl vytlačil z veřejného prostoru.

## 4. Detekční markery

- Ztráta přístupu k více službám během krátké doby bez zjevné příčiny.
- Obecná zdůvodnění typu „porušení podmínek“ bez konkrétního obsahu.
- Předcházející zásah na jedné platformě nebo kampaň nahlašování.
- Odvolání na jedné službě nemá vliv na ostatní.
- Postiženi jsou lidé určitého zaměření (novináři, aktivisté, menšiny).

## 5. Odlišení

*Oprávněný zásah*: účet skutečně porušuje pravidla nebo zákon na více službách. *[EA-9.6.3 Automated Content Takedown](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md)*: odstranění obsahu na jedné platformě; kaskáda zasahuje celou digitální existenci. *Sankční seznamy*: zákonné omezení s právním základem a cestou k přezkumu.

## 6. Dopad a rámec

Kaskáda může člověka připravit o komunikaci, příjmy, přístup k platbám i o profesní existenci. Je zvlášť zničující pro lidi, jejichž práce závisí na digitálních službách. V EU ukládá DSA platformám povinnost zdůvodnit zásahy a umožnit stížnost; sdílení signálů mezi službami ale zůstává málo transparentní. Pro postižené je klíčové domáhat se přezkumu u každé služby a dokumentovat celý řetězec.

## 7. Obrana a zotavení

*Postižený*: dokumentovat každý zásah, podat odvolání všude, kontaktovat organizace hájící digitální práva; mít zálohu kontaktů a dat mimo platformy. *Platformy*: sdílet signály jen s lidským ověřením a s možností odvolání, které se přenáší stejně jako zásah. *Regulátoři*: požadovat transparentnost sdílení signálů mezi službami. *Zaměstnavatelé a partneři*: nepovažovat deplatforming za důkaz viny.

## 8. Příklad (anonymizovaný kompozit)

Novinář píšící o extremismu sdílí snímky extremistických příspěvků jako dokumentaci. Jedna platforma jeho účet zablokuje; během týdne přijde o přístup k dalším dvěma sítím a k platební službě, přes kterou dostával příspěvky od čtenářů. Po měsíci odvolání a s pomocí organizace hájící svobodu tisku získá přístup zpět ke třem službám; čtvrtá zásah nezruší.

## 9. Meze a otevřené otázky

Sdílení signálů mezi službami má legitimní účel a pomáhá zastavit skutečné zneužívání. Otevřenou otázkou je, jak zachovat jeho přínos a zároveň zajistit, aby se s chybným zásahem šířila i jeho oprava.

## 10. Pohled zevnitř a práce s postiženým

Ztráta digitální přítomnosti je pro mnoho lidí ztrátou sociálních vazeb, práce a identity. Postižený prožívá bezmoc vůči neviditelnému systému a může začít podezírat všechny. Pomáhá praktická podpora, obnovení kontaktů mimo platformy a uznání, že jde o systémové selhání.

## 11. Vztah k ostatním kategoriím EA

Vzorec je technickou podobou [Detekční signatura: Deplatformingová kaskáda](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md) a navazuje na [EA-9.6.3](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md); v institucionálním prostředí mu odpovídá [EA-2.1.7 Institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md).

## 12. Otázky pro rozhovor a šetření

- Kdy a kde došlo k prvnímu zásahu?
- Jaké služby následovaly a v jakém pořadí?
- Předcházela zásahu kampaň nebo spor?
- Jaká zdůvodnění jste dostal?
- Které služby po odvolání zásah zrušily?

## 13. Postup pro profesionály

1. **Právník:** zmapovat řetězec zásahů a podat odvolání u každé služby, s odkazem na zrušení jinde.
2. **Organizace pro digitální práva:** eskalovat případ u platforem a regulátorů.
3. **Analytik:** doložit, zda zásahům předcházela koordinovaná kampaň.
4. **Zaměstnavatel nebo partner:** posoudit situaci podle faktů, ne podle zásahů platforem.
5. **Terapeut:** podpořit postiženého ve zvládání izolace a ztráty.

## 14. Prevence a odolnost

Odolnost stojí na nezávislosti na jedné službě: vlastní kontakty, záloha dat, alternativní platební kanály a vlastní web. Systémově pomáhá, když se opravy zásahů šíří stejnými kanály jako zásahy.

## 15. Typický průběh

Kaskáda začíná jedním zásahem – oprávněným, chybným nebo vyvolaným kampaní. Během dnů následují další služby, které signál převezmou. Postižený nejdřív nechápe souvislost, pak zjistí, že zásahy jsou propojené. Odvolání probíhá paralelně a s různým výsledkem. Část služeb zásah zruší, část ne, a postižený zůstává ve stavu neúplné digitální existence.

## 16. Dokumentace a důkazy

Užitečná je časová osa všech zásahů, kopie oznámení, zdůvodnění a odpovědí na odvolání a doklady o případné předcházející kampani. Zrušení zásahu na jedné službě je důležitým argumentem pro ostatní.

## Odborný kontext

Suzor (2019) popisuje, jak pravidla platforem fungují jako soukromé právo, které rozhoduje o přístupu ke komunikaci, publiku a příjmům, ale postrádá záruky běžné ve veřejném právu: zdůvodnění, předvídatelnost a nezávislý přezkum. Kaskáda deplatformingu tento problém násobí, protože jedno rozhodnutí se přenáší do dalších systémů bez nového posouzení. Gillespie (2018) upozorňuje, že platformy sdílejí nejen technologie, ale i normy a seznamy, a že tím vzniká koordinovaná správa projevu, kterou veřejnost téměř nevidí.

Citron a Pasquale (2014) navrhli pro automatizované hodnocení lidí princip, který je pro kaskády klíčový: kdo je hodnocen, musí se dozvědět, že hodnocení existuje, a mít možnost ho napadnout. U sdílených signálů mezi službami tato podmínka obvykle chybí. Kniha proto doporučuje chápat jakoukoli opravu chybného zásahu jako informaci, která se má šířit stejnými kanály jako zásah sám.

## Souvislosti pro praxi

Organizace hájící digitální práva mohou postiženým pomoci tím, že shromažďují kontakty na odvolací kanály jednotlivých služeb a vzory odvolání, které odkazují na zrušení zásahu jinde. Pro zaměstnavatele, banky a partnery je důležité pravidlo, že zablokování účtu na platformě není důkazem protiprávního jednání a nemá samo o sobě vést k dalším sankcím. Pro tvůrce a malé podniky, kteří jsou na digitálních službách existenčně závislí, je prevencí plán kontinuity: kde budou komunikovat se zákazníky, kdyby hlavní kanál zmizel, a jak se dostanou ke svým datům. Pro výzkum a regulátory je klíčové zmapovat, které služby si signály sdílejí a na jakém základě.

Pro terapeuty a poradce je užitečné vědět, že ztráta digitální přítomnosti se u části klientů prožívá podobně jako vyloučení z komunity, se studem a pocitem nespravedlnosti. Při práci s nimi pomáhá oddělit otázku viny od otázky postupu a obnovit vztahy, které na platformách nezávisejí.

## Literatura

- Citron, D. K., & Pasquale, F. (2014). The scored society: Due process for automated predictions. *Washington Law Review*.
- Gillespie, T. (2018). *Custodians of the Internet*. Yale University Press.
- Suzor, N. P. (2019). *Lawless: The Secret Rules That Govern Our Digital Lives*. Cambridge University Press.

## Související

**Sourozenecké techniky**

- [EA-9.6.3 Automated Content Takedown](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md) – odstranění obsahu.
- [EA-9.3.8 Mass Reporting Coordination](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md) – kampaň jako spouštěč.
- [EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) – kaskáda následků automatického označení.

**Detekce a pojmy**

- [Detekční signatura: Deplatformingová kaskáda](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md) – rozpoznání vzorce.
- [Deplatforming](@/glossary/deplatforming.md) – obecné heslo.

**Obrana**

- [Sebe-obrana: Diverzifikace sítě](@/kompendium/self-defense-guides/25-network-diversification.md) – nezávislost na jedné službě.
- [Sebe-obrana: Mobilizace podpory](@/kompendium/self-defense-guides/30-support-mobilization.md) – pomoc komunity.
