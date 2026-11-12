+++
title = "EA-9.6.8 AI Legal Decision EA"
description = "Vzorec AI v justici – predikce recidivy, doporučení trestu, hodnocení rizika při podmínečném propuštění –, kde zaujatá data a neprůhlednost ohrožují spravedlivý proces."
weight = 968

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-9-AI-immigration-decision", "ea-9-6-2-AI-judgment-laundering"]
ea_code = "EA-9.6.8"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.8 AI Legal Decision EA

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.8`
**Název:** AI Legal Decision EA
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*AI legal decision EA* označuje rizika automatizovaných systémů v justici a vězeňství: predikce recidivy, doporučení výše trestu, hodnocení rizika při rozhodování o vazbě a podmínečném propuštění. Systémy se učí z historických dat policie a soudů, které nesou nerovnosti (například nerovnoměrnou policejní kontrolu různých čtvrtí), a jejich skóre může ovlivnit svobodu člověka, aniž by mohl jeho logiku zpochybnit.

## 3. Mechanismus (strukturálně)

Predikce recidivy předpovídá budoucí zatčení nebo odsouzení, nikoli budoucí trestnou činnost; kde je policejní dohled intenzivnější, je i víc zatčení, a model to čte jako vyšší riziko. Skóre se pak dostane k soudci jako zdánlivě neutrální údaj. Nejznámější veřejná debata se vedla kolem systému COMPAS v USA po analýze organizace ProPublica (2016), podle níž systém u černých obžalovaných častěji chybně předpovídal vysoké riziko; výrobce analýzu zpochyboval a spor ukázal, že různá kritéria spravedlnosti nelze splnit současně. Epistemicky je problémem i neprůhlednost: obžalovaný nemůže vyslýchat algoritmus jako svědka.

## 4. Detekční markery

- Rozhodnutí o vazbě nebo trestu odkazuje na rizikové skóre bez vysvětlení faktorů.
- Obhajoba nemá přístup k metodice systému s odkazem na obchodní tajemství.
- Skóre zohledňuje faktory, za které obžalovaný nemůže (bydliště, rodinné zázemí, okolí).
- Rozdíly v doporučeních mezi skupinami s podobnou trestní historií.
- Soudci přebírají doporučení bez vlastního odůvodnění.

## 5. Odlišení

*Strukturované hodnocení rizika odborníkem*: transparentní kritéria, posouzení člověkem, možnost konfrontace. *Trestní historie jako faktor*: legitimní, pokud je relevantní a vysvětlená. *[EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md)*: zakrytí lidského rozhodnutí; v justici se prolíná s tímto vzorcem.

## 6. Dopad a rámec

Zaujaté systémy mohou prodlužovat vazbu a tresty určitým skupinám a ohrožovat právo na spravedlivý proces (možnost konfrontovat důkazy, odůvodnění rozhodnutí). Akt o umělé inteligenci řadí systémy pro výkon spravedlnosti a pro hodnocení rizika fyzických osob v trestním řízení mezi vysoce rizikové; profilování za účelem předpovědi trestné činnosti založené pouze na osobnostních rysech je zakázáno. V českém prostředí se podobné nástroje zatím používají spíše omezeně; kniha proto popisuje vzorec obecně.

## 7. Obrana a zotavení

*Obhajoba*: vyžadovat přístup k metodice a datům, napadat použití skóre bez vysvětlení ([Znalec a EA](@/kompendium/forensic-legal/21-expert-witness-EA.md)). *Soudci*: používat skóre jen jako jeden z podkladů, vždy s vlastním odůvodněním. *Justiční správa*: nasazovat jen transparentní a validované nástroje s pravidelným auditem. *Výzkumníci a novináři*: analyzovat výsledky systémů a jejich dopad.

## 8. Příklad (anonymizovaný kompozit)

Mladý muž je obviněn z drobné krádeže. Nástroj pro hodnocení rizika ho zařadí do vysokého rizika, především kvůli bydlišti a kontaktům s lidmi s trestní historií. Soud navrhuje vazbu. Obhájkyně namítne, že skóre zohledňuje okolnosti, za které obviněný nemůže, a že metodika není přístupná. Soud vazbu nenařídí a v odůvodnění uvede vlastní posouzení konkrétních okolností.

## 9. Meze a otevřené otázky

Lidské rozhodování v justici je také zaujaté; nástroje mohou nekonzistenci snížit, pokud jsou transparentní a dobře navržené. Spor o COMPAS ukázal, že matematicky nelze splnit všechna kritéria spravedlnosti současně – volba je hodnotová a patří do veřejné debaty, ne do technické specifikace.

Užitečné je oddělit, co je v tomto sporu matematické a co procesní. Chouldechova (2017) a Kleinberg, Mullainathan a Raghavan (2017) nezávisle na sobě dokázali, že některá kritéria spravedlnosti nemohou platit současně, pokud se základní míry mezi skupinami liší; jde o důsledek, který lepšími daty ani lepším modelem odstranit nelze, a spor po analýze, kterou zveřejnili Angwin a kolektiv (2016), proto nebylo možné rozhodnout měřením. Vedle toho stojí vada jiného druhu: skóre je svědectvím o záznamech zatčení, zachází se s ním však jako s posudkem o člověku, a obžalovaný nemá nástroj, jímž by je konfrontoval. Tato vada je procesní a trvala by i u modelu, který by všechna statistická kritéria splňoval.

## 10. Pohled zevnitř a práce s postiženým

Obviněný, o jehož svobodě rozhoduje číslo, prožívá bezmoc a pocit, že je posuzován podle toho, odkud je, ne podle toho, co udělal. To prohlubuje nedůvěru k justici. Pomáhá srozumitelné vysvětlení a obhajoba, která skóre aktivně zpochybní.

## 11. Vztah k ostatním kategoriím EA

Vzorec navazuje na [EA-9.6.1](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) a na forenzní kapitoly knihy o [hodnocení věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md) a o [vzorcových důkazech](@/kompendium/forensic-legal/38-pattern-evidence.md). Teoretický rámec dodává Foucaultova analýza [panoptismu](@/glossary/panopticism.md).

## 12. Otázky pro rozhovor a šetření

- Byl v řízení použit nástroj pro hodnocení rizika?
- Jaké faktory skóre ovlivnily?
- Měla obhajoba přístup k metodice?
- Odůvodnil soud rozhodnutí vlastním posouzením?
- Byl nástroj validován na místní populaci?

## 13. Postup pro profesionály

1. **Obhájce:** vyžádat si metodiku a vstupy, napadnout neprůhledné skóre.
2. **Soudce:** odůvodnit rozhodnutí vlastním posouzením a uvést, jakou váhu skóre mělo.
3. **Justiční správa:** zavést audit a zveřejňování výsledků nástrojů.
4. **Znalec:** posoudit vědeckou validitu nástroje.
5. **Novinář nebo výzkumník:** analyzovat výsledky podle skupin.

## 14. Prevence a odolnost

Prevence stojí na transparentnosti, validaci, lidském rozhodování s odůvodněním a na právu obhajoby nástroj zpochybnit. Veřejná debata o tom, jaká kritéria spravedlnosti použít, by měla předcházet nasazení.

## 15. Typický průběh

Nástroj se zavede s cílem sjednotit rozhodování a snížit přeplněnost věznic. Soudci ho nejdřív používají opatrně, pak rutinně. Rozdíly mezi skupinami se objeví až v analýze dat. Následuje veřejná debata, právní spory o přístup k metodice a případné úpravy nebo ukončení používání.

## 16. Dokumentace a důkazy

Pro obhajobu jsou klíčové spis s hodnocením rizika, metodika nástroje, vstupní údaje a odůvodnění rozhodnutí. Pro systémové doložení agregovaná data o výsledcích podle skupin a o souladu skóre se skutečnou recidivou.

## Odborný kontext

Debata o rizikových skóre v trestní justici se soustředila kolem analýzy, kterou zveřejnili Angwin et al. (2016) v organizaci ProPublica: podle ní systém COMPAS u černých obžalovaných častěji chybně předpovídal vysoké riziko a u bílých častěji chybně nízké. Výrobce analýzu zpochybnil s tím, že skóre jsou kalibrována stejně pro obě skupiny. Chouldechova (2017) a Kleinberg, Mullainathan a Raghavan (2017) nezávisle ukázali, že obě strany mohou mít pravdu zároveň: pokud se skupiny liší v základní míře opětovného zatčení, nelze současně splnit kalibraci a rovnost chybovosti.

Pro knihu je tento spor důležitý ze dvou důvodů. Ukazuje, že „spravedlnost algoritmu“ není technická vlastnost, ale hodnotová volba, kterou je třeba učinit otevřeně. A ukazuje, že předpovídaná veličina – zatčení, nikoli spáchaný čin – nese v sobě rozložení policejní kontroly. Eubanks (2018) a O'Neil (2016) upozorňují, že takové systémy mohou vytvářet zpětnou smyčku, v níž intenzivnější dohled vede k vyššímu skóre a vyšší skóre k intenzivnějšímu dohledu.

## Souvislosti pro praxi

Pro obhájce je užitečné připravit si standardní námitky proti neprůhledným skóre: požadavek na metodiku, na validační studie na místní populaci a na vysvětlení faktorů, které skóre ovlivnily. Pro soudce a státní zástupce je klíčové vzdělávání o tom, co skóre předpovídá a co ne, a o tom, že různá kritéria spravedlnosti si odporují. Justiční akademie mohou do výuky zařadit spor o COMPAS jako případovou studii hodnotových voleb skrytých v technickém nástroji. Pro výzkum je důležitý přístup k anonymizovaným datům, bez něhož nelze nástroje nezávisle hodnotit.

## Literatura

- Angwin, J., Larson, J., Mattu, S., & Kirchner, L. (2016). Machine bias. *ProPublica*, 23. 5. 2016.
- Chouldechova, A. (2017). Fair prediction with disparate impact: A study of bias in recidivism prediction instruments. *Big Data*.
- Eubanks, V. (2018). *Automating Inequality: How High-Tech Tools Profile, Police, and Punish the Poor*. St. Martin's Press.
- Kleinberg, J., Mullainathan, S., & Raghavan, M. (2017). Inherent trade-offs in the fair determination of risk scores. *Proceedings of ITCS 2017*.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.
- [EA-9.6.9 AI Immigration Decision](@/kompendium/techniques/ea-9-6-9-AI-immigration-decision.md) – automatizace v migraci.
- [EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – rozhodnutí skryté za skóre.

**Forenzní kapitoly**

- [Hodnocení věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md) – posuzování bez zkratek.
- [Vzorcové důkazy](@/kompendium/forensic-legal/38-pattern-evidence.md) – práce se statistickými vzorci.
- [Znalec a EA](@/kompendium/forensic-legal/21-expert-witness-EA.md) – posouzení validity nástroje.

**Pojmy**

- [Panoptismus](@/glossary/panopticism.md) – dohled a moc.
- [Risk score](@/glossary/risk-score.md) – co skóre je a není.
