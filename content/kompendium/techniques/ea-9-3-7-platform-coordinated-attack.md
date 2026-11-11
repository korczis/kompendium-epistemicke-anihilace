+++
title = "EA-9.3.7 Platform Coordinated Attack"
description = "Vzorec synchronizované kampaně napříč platformami, v níž se tentýž narativ objeví v krátkém okně všude a vytváří dojem spontánní shody. Znaky, odlišení, obrana."
weight = 937

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-3", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-2-3-6-platform-coordinated-attack", "ea-9-4-7-cross-platform-bot-cascade", "ea-9-4-2-coordinated-inauthentic-behavior", "ea-9-3-10-trend-manipulation-EA"]
ea_code = "EA-9.3.7"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.3 Sociální platformy"
section_icon = "📱"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.3.7 Platform Coordinated Attack

> *Subkategorie 📱 **9.3 Sociální platformy** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.3.7`
**Název:** Platform Coordinated Attack
**Subkategorie:** 9.3 Sociální platformy
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Platform coordinated attack* je synchronizovaná kampaň, v níž se tentýž narativ – s drobnými obměnami – objeví v krátkém časovém okně na více platformách současně (krátká videa, mikroblogy, sociální sítě, video servery, diskusní fóra). Současný výskyt v různých prostředích má vytvořit dojem, že jde o spontánní a široce sdílené mínění nebo o „všude probíranou“ událost.

## 3. Mechanismus (strukturálně)

Lidé pokládají za nezávislé ty zdroje, které potkávají v různých prostředích: když totéž slyší na více platformách, považují to za potvrzené. Koordinovaná kampaň tento předpoklad využívá – jeden aktér, mnoho kanálů. Každá platforma vidí jen svůj výsek a moderace jedné nevidí, co se děje na ostatních, takže koordinace zůstává nerozpoznaná. Následná pozornost médií („o tomto se mluví na sítích“) z kampaně dělá zprávu. Vzorec spojuje [koordinované neautentické chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) s algoritmickou amplifikací jednotlivých platforem.

## 4. Detekční markery

- Tentýž narativ, slogan nebo obrázek se objeví na více platformách v rozmezí minut až hodin.
- Obsah se liší jen formou, ne strukturou argumentu a klíčovými formulacemi.
- Účty, které kampaň šíří, mají podobné vzorce založení, aktivity a sledujících.
- Kampaň začíná bez zjevného spouštěče (události, zprávy) nebo ho předbíhá.
- Po krátkém vrcholu kampaň synchronně utichne.

## 5. Odlišení

*Spontánní reakce na událost*: vzniká na více platformách, ale s rozmanitými formulacemi a postupně. *Přiznaná kampaň*: organizace koordinuje sdílení pod vlastním jménem; legitimní forma advokacie. *[EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md)*: totéž provedené převážně boty; zde mohou působit i skuteční lidé.

## 6. Dopad a rámec

Koordinované kampaně mohou ovlivnit volby, poškodit pověst osob a firem a vytvořit tlak na rozhodovatele. Protože každá platforma vidí jen část, je odhalení otázkou spolupráce platforem, výzkumníků a novinářů. Regulačně se uplatňují pravidla platforem proti neautentickému chování a povinnosti velkých platforem podle DSA posuzovat rizika manipulace; u zahraničních aktérů i bezpečnostní rámec.

Pro volební orgány a bezpečnostní instituce jsou kampaně napříč platformami součástí posuzování rizik voleb a zahraničního vlivu; spolupráce s platformami a výzkumníky před volbami umožňuje rychlejší reakci.

## 7. Obrana a zotavení

*Čtenář*: výskyt na více platformách není nezávislé potvrzení; hledat původce a primární zdroj. *Novináři*: neinformovat o „trendu na sítích“ bez analýzy jeho původu. *Postižené osoby a organizace*: dokumentovat napříč platformami, spolupracovat s výzkumníky, reagovat věcně jedním kanálem ([Obrana narativu v PR](@/kompendium/organizational-defense/34-PR-narrative-defense.md)). *Platformy a výzkum*: sdílení poznatků o kampaních s ochranou soukromí uživatelů.

## 8. Příklad (anonymizovaný kompozit)

Večer před hlasováním zastupitelstva o územním plánu se na čtyřech platformách objeví stejné tvrzení, že investor podplatil radní. Videa, příspěvky i komentáře používají stejnou formulaci a stejný rozmazaný „dokument“. Ráno o „bouři na sítích“ informuje regionální zpravodajství. Novinář, který kampaň zmapuje, ukáže, že většina účtů vznikla v posledním týdnu a sdílí obsah v rozmezí dvaceti minut. Zastupitelstvo hlasování odloží a požádá o prošetření; obvinění se nepotvrdí.

## 9. Meze a otevřené otázky

Rozlišit koordinaci od rychlé spontánní reakce není vždy možné, zvlášť u událostí, které vyvolají silné emoce. Bez přístupu k datům více platforem zůstává analýza nepřímá. Otevřenou otázkou je, jak sdílet údaje mezi platformami bez ohrožení soukromí.

Otevřené zůstává i to, kdy má být kampaň veřejně označena za koordinovanou: předčasné obvinění může poškodit skutečné lidi, pozdní reakce nechává kampaň působit.

Pro výzkumníky je klíčový přístup k datům více platforem, bez něhož koordinaci nelze spolehlivě doložit.

Kniha proto doporučuje opatrnost v obou směrech.

Současný výskyt na více platformách sám neprokazuje jediného organizátora. Stejný obraz vytvoří i několik nezávislých skupin, které reagují na tentýž podnět, nebo jeden virální příspěvek převzatý napříč prostředími; koordinaci dokládá teprve shoda ve věcech, které se spontánně neopakují – totožné formulace, pořadí publikace, sdílená infrastruktura účtů. Z doložené kampaně navíc neplyne, že lidé, kteří se k ní přidali, jsou neautentičtí: Starbird, Arif a Wilson (2019) popisují zapojení přesvědčených uživatelů jako pravidlo, nikoli výjimku. Označit účastníka za součást operace je proto jiný a mnohem silnější závěr než popsat samu operaci, a kniha jej od popisu vzorce důsledně odděluje.

## 10. Pohled zevnitř a práce s postiženým

Pro cíl kampaně je zkušenost „všude o mně mluví“ zdrcující: zdá se, že se proti němu obrátil celý svět. Pomáhá ukázat skutečný rozsah a původ kampaně – často jde o malou skupinu aktérů s mnoha účty. Psychologická podpora by měla počítat s reakcemi podobnými jako po [mediálním útoku davu](@/kompendium/case-studies/04-medialni-mob-attack.md).

Pro zaměstnance organizace, která se stala cílem kampaně, je kampaň zátěží, i když nejsou přímo jmenováni; vedení by s nimi mělo otevřeně komunikovat, vysvětlit, co se děje, a nabídnout podporu. Pro jednotlivce, kteří jsou tváří organizace, je vhodná i osobní ochrana – omezení dostupnosti osobních údajů a právní pomoc při výhrůžkách.

## 11. Vztah k ostatním kategoriím EA

Tentýž vzorec z hlediska [delegitimizace](@/glossary/delegitimizace.md) osoby popisuje [EA-2.3.6 Platform Coordinated Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) v kapitole 2 (sdílený název, jiný úhel pohledu); tato stránka se soustředí na infrastrukturu a detekci. Organizovaný dav jako nositel útoku je námětem [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md).

## 12. Postup při podezření na koordinovanou kampaň

1. **Zmapovat výskyty** napříč platformami s časy a účty.
2. **Porovnat formulace** a vizuální prvky.
3. **Prověřit účty** – stáří, aktivitu, propojení.
4. **Spolupracovat s výzkumníky** a novináři na analýze.
5. **Reagovat věcně** jedním kanálem a nahlásit vzorec platformám.

## 13. Prevence a odolnost

Prevence stojí na spolupráci platforem, výzkumníků a novinářů, na pravidlech proti neautentickému chování a na publiku, které ví, že výskyt na více platformách není nezávislé potvrzení. Pro organizace je prevencí připravený komunikační postup a monitorování zmínek napříč platformami.

## 14. Otázky pro rozhovor a šetření

- Kdy a kde se narativ objevil poprvé?
- Jak rychle se objevil na dalších platformách?
- Které účty ho šířily jako první?
- Existoval spouštěč, nebo kampaň předběhla událost?
- Kdo z kampaně těží?

## Odborný kontext

Starbird, Arif a Wilson (2019) ukázali, že strategické [informační operace](@/glossary/info-ops.md) nejsou jen dílem centra, které rozesílá obsah, ale kolaborativní prací, do níž se zapojují i skuteční uživatelé v dobré víře; koordinovaná kampaň proto po startu často pokračuje „organicky“. Woolley a Howard (2018) v mezinárodním srovnání doložili, že takové kampaně využívají politické strany i státy. Benkler, Faris a Roberts (2018) popsali, jak se obsah kampaní přelévá mezi okrajovými weby, sociálními sítěmi a velkými médii.

Wardle a Derakhshan (2017) doporučují posuzovat informační operace podle aktéra, sdělení a interpreta a sledovat, jak se sdělení mění v jednotlivých fázích. U kampaní napříč platformami je klíčová první fáze – synchronní start –, protože později už koordinaci zakryje organický dosah. Proto kniha zdůrazňuje rychlé zmapování výskytů.

## Souvislosti pro praxi

Pro politiky, firmy a instituce, které se stanou cílem kampaně, je užitečné mít předem domluvenou spolupráci s výzkumnými skupinami a kontakty na platformy. Pro novináře platí, že „bouře na sítích“ je zpráva až tehdy, když je známo, kdo ji vyvolal.

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network [Propaganda](@/glossary/propaganda.md)*. Oxford University Press.
- Starbird, K., Arif, A., & Wilson, T. (2019). Disinformation as collaborative work. *Proceedings of the ACM on Human-Computer Interaction (CSCW)*.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Council of Europe.
- Woolley, S. C., & Howard, P. N. (Eds.) (2018). *Computational Propaganda*. Oxford University Press.

## Související

**Sourozenecké a příbuzné techniky**

- [EA-2.3.6 Platform Coordinated Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) – tentýž vzorec z hlediska delegitimizace.
- [EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md) – provedení sítí botů.
- [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) – obecný rámec koordinace.
- [EA-9.3.10 Trend Manipulation EA](@/kompendium/techniques/ea-9-3-10-trend-manipulation-EA.md) – kampaň jako vyrobený trend.

**Detekce**

- [Detekční signatura: Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – stopy synchronizace.
- [Sociální sítě a manipulace v OSINT](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md) – metody analýzy.

**Obrana a případ**

- [Obrana narativu v PR](@/kompendium/organizational-defense/34-PR-narrative-defense.md) – reakce organizace.
- [Mediální mob attack](@/kompendium/case-studies/04-medialni-mob-attack.md) – dopad na cíl kampaně.
