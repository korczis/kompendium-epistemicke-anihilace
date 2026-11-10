+++
title = "EA-9.6.6 AI Hiring Narrative"
description = "Vzorec AI nástrojů v náboru – třídění životopisů, analýzy videopohovorů, prediktory „vhodnosti“ –, které přenášejí historické zaujatosti a vydávají je za objektivní výběr."
weight = 966

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-2-AI-judgment-laundering", "ea-9-6-5-AI-credit-scoring-bias", "ea-2-1-3-credentialing-attack"]
ea_code = "EA-9.6.6"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.6 AI Hiring Narrative

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.6`
**Název:** AI Hiring Narrative
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI hiring narrative* označuje použití automatizovaných nástrojů v náboru – třídičů životopisů, analyzátorů videopohovorů, osobnostních prediktorů – a narativ „objektivního výběru“, který je provází. Nástroje se učí z dat o dřívějších přijatých a úspěšných zaměstnancích, a pokud byli převážně z určité skupiny, nástroj tuto skupinu zvýhodňuje. Kandidát je odmítnut „systémem“, aniž by se dozvěděl proč.

## 3. Mechanismus (strukturálně)

Nábor je oblast, kde se rozhoduje pod tlakem času a při velkém počtu uchazečů, a slib automatizace – rychlost a nestrannost – je lákavý. Nástroj ale „nestrannost“ definuje podobností s minulými úspěšnými kandidáty; tím reprodukuje minulý výběr. Známým doloženým případem je experimentální náborový nástroj velké technologické firmy, o jehož ukončení informovala agentura Reuters v roce 2018, protože znevýhodňoval životopisy žen. Analýzy videa a hlasu navíc pracují s projevy (přízvuk, mimika, oční kontakt), které souvisejí s kulturou, postižením nebo neurodiverzitou, ne s pracovní schopností. Narativ objektivity brání tomu, aby se výsledky zpochybňovaly.

## 4. Detekční markery

- Kandidáti z určitých skupin (ženy, starší, lidé s postižením, absolventi méně známých škol) jsou odmítáni v prvním kole nápadně často.
- Odmítnutí přichází okamžitě a automaticky, bez lidského kontaktu.
- Nástroj hodnotí rysy, které s prací nesouvisejí (mimika, tón hlasu, slovník).
- Zaměstnavatel neumí vysvětlit, podle čeho nástroj rozhoduje.
- Rozmanitost nově přijatých se po nasazení nástroje snížila.

## 5. Odlišení

*Strukturované hodnocení*: předem stanovená a s prací související kritéria, posuzovaná lidmi. *Legitimní automatické třídění*: vyřazení podle jednoznačných a přiznaných podmínek (např. požadovaná licence). *[EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md)*: vědomé zakrytí rozhodnutí; v náboru se oba vzorce často prolínají.

## 6. Dopad a rámec

Zaujaté nástroje mohou ve velkém měřítku vylučovat celé skupiny z pracovního trhu. Antidiskriminační právo (rovné zacházení v přístupu k zaměstnání) se uplatní i na automatizované nástroje; akt o umělé inteligenci řadí systémy pro nábor a výběr zaměstnanců mezi vysoce rizikové. GDPR dává kandidátům právo na informace o automatizovaném rozhodování a na lidský zásah ([Pracovní právo a EA](@/kompendium/forensic-legal/44-employment-law-EA.md)).

## 7. Obrana a zotavení

*Kandidát*: zeptat se, zda je použit automatizovaný nástroj, a požádat o lidské posouzení; dokumentovat odmítnutí. *Zaměstnavatelé*: auditovat nástroje na rozdíly mezi skupinami, používat jen kritéria související s prací, zachovat lidské rozhodnutí. *Personalisté*: nepřebírat výstup nástroje bez kontroly; sledovat rozmanitost. *Regulátoři a odbory*: vyžadovat transparentnost náborových nástrojů.

## 8. Příklad (anonymizovaný kompozit)

Zkušená účetní po padesátce podá třicet žádostí přes portály s automatickým tříděním a pokaždé dostane během minut zamítnutí. Kamarádka jí pomůže upravit životopis – odstraní rok ukončení studia – a během týdne přijdou dvě pozvánky. Personalistka jedné firmy pak připustí, že nástroj „preferuje kratší praxi“. Účetní se obrátí na poradnu pro rovné zacházení.

## 9. Meze a otevřené otázky

Lidský nábor je také zaujatý; automatizace nemusí být horší, pokud je dobře navržena a kontrolována. Otázkou je transparentnost a možnost zpochybnění. Otevřené zůstává, jak auditovat nástroje, jejichž dodavatelé odmítají zveřejnit fungování.

## 10. Pohled zevnitř a práce s postiženým

Opakovaná automatická odmítnutí vedou k pocitu bezcennosti a k rezignaci, zvláště u lidí, kteří jsou dlouho bez práce. Kariérní poradce nebo terapeut pomáhá, když odmítnutí oddělí od hodnoty člověka a nabídne strategie, jak se k lidskému posouzení dostat (doporučení, přímý kontakt).

## 11. Vztah k ostatním kategoriím EA

Vzorec je pracovní podobou [EA-9.6.1](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) a v akademickém prostředí mu odpovídá [EA-2.1.3 Credentialing Attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md), kde se zpochybňují kvalifikace. Organizační obranu popisuje [Prověřování vedoucích](@/kompendium/organizational-defense/18-supervisor-evaluation.md).

## 12. Otázky pro rozhovor a šetření

- Kolik žádostí bylo odmítnuto a jak rychle?
- Používal zaměstnavatel automatizovaný nástroj?
- Byl jste vyzván k videopohovoru s automatickým hodnocením?
- Změnil se výsledek, když jste upravil životopis?
- Požádal jste o lidské posouzení?

## 13. Postup pro profesionály

1. **Personalista:** ověřit, podle čeho nástroj třídí, a pravidelně kontrolovat odmítnuté kandidáty.
2. **Vedení firmy:** zadat nezávislý audit nástroje na rozdíly mezi skupinami.
3. **Kariérní poradce:** pomoci klientovi s žádostí o lidský přezkum a s alternativními cestami.
4. **Právník:** posoudit nepřímou diskriminaci.
5. **Odborová organizace:** vyjednat transparentnost nástrojů.

## 14. Prevence a odolnost

Prevence stojí na kritériích souvisejících s prací, na auditech, na zachování lidského rozhodnutí a na právu kandidátů na vysvětlení. Rozmanité týmy, které nástroje vybírají a kontrolují, snižují riziko přehlédnutí zaujatosti.

## 15. Typický průběh

Nástroj se zavede kvůli úspoře času. Personalisté vidí méně kandidátů a ti, které vidí, jsou si „podobní“. Rozmanitost přijatých klesá, ale nikdo si toho nevšimne, protože odmítnutí nejsou vidět. Teprve stížnost, audit nebo interní analýza ukáže vzorec. Náprava vyžaduje úpravu nástroje i zpětné posouzení odmítnutých.

## 16. Dokumentace a důkazy

Kandidát by měl uchovávat inzeráty, odeslané žádosti, data a odpovědi. Pro zaměstnavatele je důležitá dokumentace nastavení nástroje, statistiky výsledků podle skupin a záznamy o lidských zásazích do výsledků.

## Odborný kontext

Případ experimentálního náborového nástroje, o němž informoval Dastin (2018), se stal učebnicovým příkladem toho, jak model trénovaný na historii přijímání reprodukuje její nerovnosti: nástroj se naučil znevýhodňovat výrazy spojené se ženami, protože v datech převažovali přijatí muži. Barocas a Selbst (2016) tento mechanismus popisují obecně – volba cílové proměnné („podobnost s úspěšnými zaměstnanci“) sama nese minulá rozhodnutí. Buolamwini a Gebru (2018) navíc doložili, že komerční systémy analýzy obličeje mají výrazně vyšší chybovost u žen s tmavší pletí, což zpochybňuje nástroje, které z videa usuzují na vlastnosti kandidátů.

O'Neil (2016) upozornila na specifický rys náboru: odmítnutý kandidát se o důvodech obvykle nedozví a zaměstnavatel se o chybných odmítnutích nedozví nikdy, takže systém nedostává zpětnou vazbu, která by ho mohla opravit. Kniha z toho vyvozuje, že u náborových nástrojů je audit odmítnutých stejně důležitý jako audit přijatých.

## Souvislosti pro praxi

Personální oddělení, která nástroje používají, by měla pravidelně procházet vzorek automaticky odmítnutých kandidátů a ověřit, zda mezi nimi nejsou vhodní lidé; je to nejjednodušší a nejlevnější audit. Kariérní poradci mohou kandidátům vysvětlit, jak automatické třídění funguje, a pomoci jim hledat cesty k lidskému posouzení – doporučení, přímý kontakt s týmem, profesní sítě. Pro odbory a zástupce zaměstnanců je téma vhodné do kolektivního vyjednávání: transparentnost nástrojů, právo na lidské posouzení a pravidelné vyhodnocení dopadů na rozmanitost.

Pro dodavatele nástrojů je dobrou praxí zveřejňovat, na jakých datech byl nástroj vyvinut, jaké vlastnosti hodnotí a jaké rozdíly mezi skupinami naměřili, aby zaměstnavatelé mohli zodpovědně rozhodnout o jeho nasazení.

## Literatura

- Barocas, S., & Selbst, A. D. (2016). Big data's disparate impact. *California Law Review*.
- Buolamwini, J., & Gebru, T. (2018). Gender shades: Intersectional accuracy disparities in commercial gender classification. *Proceedings of FAT* 2018*.
- Dastin, J. (2018). Amazon scraps secret AI recruiting tool that showed bias against women. *Reuters*, 10. 10. 2018.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.
- [EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – rozhodnutí skryté za systémem.
- [EA-9.6.5 AI Credit Scoring Bias](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md) – zaujatost v úvěrech.

**Právo a organizace**

- [Pracovní právo a EA](@/kompendium/forensic-legal/44-employment-law-EA.md) – právní rámec.
- [Prověřování vedoucích](@/kompendium/organizational-defense/18-supervisor-evaluation.md) – organizační kontrola.
- [EA-2.1.3 Credentialing Attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md) – zpochybnění kvalifikací.

**Obrana a pojmy**

- [Sebe-obrana: Asertivní komunikace](@/kompendium/self-defense-guides/24-communication-assertiveness.md) – žádost o lidské posouzení.
- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – hlas, který systém neslyší.
