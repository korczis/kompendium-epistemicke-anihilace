+++
title = "EA-9.6.5 AI Credit Scoring Bias"
description = "Vzorec, v němž automatické úvěrové skórování přes zástupné proměnné (bydliště, jméno, chování online) systematicky znevýhodňuje skupiny lidí bez zjevné diskriminace."
weight = 965

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-10-AI-welfare-decision-EA", "ea-9-6-6-AI-hiring-narrative"]
ea_code = "EA-9.6.5"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.5 AI Credit Scoring Bias

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.5`
**Název:** AI Credit Scoring Bias
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*AI credit scoring bias* jsou diskriminační účinky automatických systémů hodnocení úvěruschopnosti. Systém nepoužívá chráněné vlastnosti přímo, ale pracuje s proměnnými, které je zastupují – bydliště, jméno, vzdělání, chování online, typ telefonu –, a výsledky se pak systematicky liší mezi skupinami. Odmítnutý žadatel dostane jen skóre, nikoli důvod.

## 3. Mechanismus (strukturálně)

Úvěrové skórování předpovídá riziko nesplacení z minulých dat. Pokud byly určité skupiny v minulosti vylučovány z úvěrů nebo měly horší podmínky, data to odrážejí a model to přenáší do budoucnosti. Alternativní data (chování na internetu, nákupy, kontakty) mohou zahrnout lidi bez úvěrové historie, ale také přinést nové zástupné proměnné. Protože skóre vypadá jako neutrální měření „spolehlivosti“, je jeho zaujatost těžko viditelná a postižení ji internalizují jako vlastní selhání. Jde o konkrétní případ [EA-9.6.1](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) s přímým dopadem na ekonomickou situaci.

## 4. Detekční markery

- Žadatelé s podobnými příjmy a historií dostávají rozdílné výsledky podle bydliště nebo jména.
- Zdůvodnění odmítnutí je obecné („nízké skóre“) bez konkrétních faktorů.
- Systém používá data, o jejichž sběru žadatel nevěděl.
- Rozdíly ve schvalování mezi čtvrtěmi nebo skupinami, které nejsou vysvětleny příjmem.
- Opravy chybných údajů nevedou ke změně skóre.

## 5. Odlišení

*Legitimní hodnocení rizika*: vychází z relevantních a ověřitelných údajů (příjem, závazky), je vysvětlitelné. *Chybné údaje*: jednotlivá chyba v registru; lze ji opravit. *[EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md)*: automatizace ve veřejných dávkách; zde v soukromém úvěrování.

## 6. Dopad a rámec

Zaujaté skórování může prohlubovat chudobu a segregaci: lidé bez přístupu k férovému úvěru se obracejí k dražším a rizikovějším zdrojům. Právní rámec zahrnuje pravidla spotřebitelského úvěru (povinnost posoudit úvěruschopnost), GDPR (právo na vysvětlení logiky automatizovaného rozhodnutí a na lidský zásah) a antidiskriminační právo. Akt o umělé inteligenci řadí hodnocení úvěruschopnosti fyzických osob mezi vysoce rizikové systémy.

## 7. Obrana a zotavení

*Žadatel*: vyžádat si důvody odmítnutí a údaje, z nichž systém vycházel; opravit chybné údaje; požádat o lidský přezkum. *Finanční poradci a dluhové poradny*: pomáhat klientům s žádostmi a odvoláním; dokumentovat vzorce. *Věřitelé*: testovat modely na rozdíly mezi skupinami, omezit zástupné proměnné. *Regulátoři*: dohled nad modely a jejich daty.

## 8. Příklad (anonymizovaný kompozit)

Mladá žena se stálým příjmem dostane zamítnutí malé půjčky „pro nízké skóre“. Její kolega se stejným příjmem a z jiného města půjčku dostane. Dluhová poradna jí pomůže vyžádat si údaje: skóre ovlivnila adresa v lokalitě s vysokou mírou exekucí a krátká historie u mobilního operátora. Po žádosti o lidský přezkum je půjčka schválena; poradna případ předá dohledovému orgánu.

## 9. Meze a otevřené otázky

Prokázat diskriminaci u jednotlivého rozhodnutí je obtížné; vzorec se ukáže až v datech. Otevřenou otázkou je, jak zajistit přístup k datům pro nezávislé audity a jak vážit přínos alternativních dat (zahrnutí lidí bez historie) proti riziku nových zaujatostí.

## 10. Pohled zevnitř a práce s postiženým

Odmítnutý žadatel často prožívá stud a pocit, že „není dost dobrý“. U lidí v tíživé finanční situaci může odmítnutí vést k zoufalým rozhodnutím. Pomáhá vysvětlit, že skóre není hodnocení člověka, a nabídnout konkrétní kroky – poradenství, přezkum, bezpečné alternativy.

## 11. Vztah k ostatním kategoriím EA

Vzorec je ekonomickou podobou [EA-9.6.1](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md); v širším rámci knihy souvisí s kritikou, že kategorie mohou samy nést kulturní zaujatost ([Kulturní zaujatost EA kategorií](@/kompendium/critical-perspectives/10-cultural-bias-critique.md)), a s politicko-ekonomickou perspektivou ([Political economy alternativa](@/kompendium/critical-perspectives/23-political-economy-alternative.md)).

## 12. Otázky pro rozhovor a šetření

- Jaký důvod odmítnutí jste dostali?
- Víte, jaké údaje o vás věřitel použil?
- Jsou v registrech o vás chybné údaje?
- Mají podobnou zkušenost lidé ve vašem okolí?
- Požádali jste o lidský přezkum?

## 13. Postup pro profesionály

1. **Dluhový poradce:** pomoci klientovi získat údaje a zdůvodnění, opravit chyby a požádat o přezkum.
2. **Právník:** posoudit, zda nejde o diskriminaci nebo porušení pravidel automatizovaného rozhodování.
3. **Věřitel:** zavést pravidelné testy modelu na rozdíly mezi skupinami.
4. **Dohledový orgán:** shromažďovat stížnosti a vyžadovat dokumentaci modelů.
5. **Novinář nebo výzkumník:** analyzovat data o schvalování podle lokalit.

## 14. Prevence a odolnost

Prevence stojí na transparentnosti modelů, omezení zástupných proměnných, pravidelných auditech a dostupnosti bezplatného dluhového poradenství. Pro jednotlivce je důležité znát svá práva a kontrolovat údaje v registrech.

## 15. Typický průběh

Žadatel je odmítnut, často opakovaně u různých věřitelů, kteří používají podobné modely nebo data. Obrací se k dražším nabídkám, jeho finanční situace se zhoršuje a další žádosti jsou odmítány s odkazem na novou historii. Teprve kontakt s poradnou nebo žádost o údaje ukáže faktory, které rozhodly; část z nich lze opravit, část zpochybnit.

## 16. Dokumentace a důkazy

Užitečné jsou písemná zamítnutí, odpovědi na žádosti o údaje, výpisy z registrů a srovnání s podobnými žadateli. Pro systémové doložení je třeba agregovaných dat, která má k dispozici spíše dohledový orgán nebo výzkumník než jednotlivec.

## Odborný kontext

Úvěrové skórování je nejstarší a nejlépe prozkoumanou oblastí automatizovaného hodnocení lidí. Citron a Pasquale (2014) ukázali, že skóre se ze specializovaného nástroje věřitelů stalo obecnou měnou důvěryhodnosti, která ovlivňuje bydlení, zaměstnání i pojištění, a že lidé mají jen omezenou možnost je pochopit a napadnout. O'Neil (2016) popsala zpětnou smyčku: nízké skóre vede k dražšímu úvěru, ten zvyšuje riziko nesplácení a nesplácení dál snižuje skóre.

Barocas a Selbst (2016) vysvětlili, proč zástupné proměnné představují hlavní cestu, jíž se diskriminace do modelů dostává i bez chráněných vlastností: bydliště, vzdělání nebo nákupní chování jsou s nimi korelovány, a model, který maximalizuje přesnost, je využije. Pro dohled a audit z toho plyne, že nestačí kontrolovat seznam vstupů; je třeba měřit výsledky podle skupin a hledat proměnné, které rozdíly vytvářejí.

## Souvislosti pro praxi

Dluhové poradny mohou klientům pomoci nejen s jednotlivým odvoláním, ale i s orientací v tom, jaké údaje o nich registry a věřitelé vedou a jak je opravit. Pro věřitele je dobrou praxí nabízet srozumitelné „hlavní důvody“ zamítnutí a cestu k přezkumu, což snižuje počet sporů i reputační rizika. Pro dohled je užitečné srovnávat výsledky schvalování podle lokalit a skupin a ptát se, které proměnné rozdíly vysvětlují. Pro jednotlivce platí, že zamítnutí není konečným hodnocením jejich spolehlivosti; lidský přezkum a oprava údajů mohou výsledek změnit.

Pro výzkum a novinářství je přínosné porovnávat výsledky různých věřitelů v téže lokalitě: pokud se odmítnutí soustřeďují do určitých čtvrtí napříč institucemi, ukazuje to na společná data nebo podobné modely, nikoli na individuální selhání žadatelů.

## Literatura

- Barocas, S., & Selbst, A. D. (2016). Big data's disparate impact. *California Law Review*.
- Citron, D. K., & Pasquale, F. (2014). The scored society: Due process for automated predictions. *Washington Law Review*.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.
- [EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) – automatizace v dávkách.
- [EA-9.6.6 AI Hiring Narrative](@/kompendium/techniques/ea-9-6-6-AI-hiring-narrative.md) – zaujatost v náboru.

**Kritika a compliance**

- [Kulturní zaujatost EA kategorií](@/kompendium/critical-perspectives/10-cultural-bias-critique.md) – zaujatost kategorií.
- [Political economy alternativa](@/kompendium/critical-perspectives/23-political-economy-alternative.md) – ekonomický rámec.
- [KYC a validace narativu](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – prověřování klientů ve finančnictví.

**Obrana a pojmy**

- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – skóre místo hlasu.
- [Risk score](@/glossary/risk-score.md) – co skóre je a není.
