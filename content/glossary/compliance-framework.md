+++
title = "Compliance Framework (rámec souladu)"
weight = 59
description = "Strukturovaný soubor regulatorních požadavků a kontrolních opatření, které musí organizace splnit (GDPR, NIS2, ISO 27001); a jeho stinná stránka, soulad na papíře."

[taxonomies]
tags = ["glossary", "security", "compliance", "legal"]

[extra]
category = "security"
related_terms = ["gdpr", "nis2", "zkb", "iso-27001", "security-rating"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Compliance framework**, česky rámec souladu, je strukturovaný soubor požadavků, pravidel
a kontrolních opatření, která musí organizace zavést a doložit, aby splnila zákonnou,
regulatorní nebo smluvní povinnost. Rámec převádí obecně formulovaný cíl zákonodárce na
soubor konkrétních opatření a na způsob, jak se jejich zavedení prokazuje; tím vzniká
auditovatelný standard, podle něhož lze stav organizace posuzovat zvenčí (Power, 1997).
K nejčastěji uplatňovaným rámcům patří evropské nařízení o ochraně osobních údajů, směrnice
o bezpečnosti sítí a informací, norma pro systémy řízení bezpečnosti informací
(ISO/IEC 27001, 2022) a dobrovolný rámec amerického normalizačního institutu (NIST, 2018).

Pojem patří do kontextu bezpečnostní a regulatorní praxe, z níž tato kniha vzešla; pro
samotné Kompendium je podstatná jeho druhá, méně přívětivá stránka. Rámec souladu je
nástrojem důkazu, a každý nástroj důkazu lze napodobit: organizace může mít úplnou
dokumentaci, certifikát a čistý auditní nález, a přitom nemít ochranu, kterou tyto artefakty
slibují (Krawiec, 2003). Kniha tento rozdíl mezi prokázaným souladem a skutečnou odolností
pokládá za epistemický problém, ne za technický nedostatek, a popisuje ho v hesle [Scam
Compliance](@/glossary/scam-compliance.md).

## Původ a kontext pojmu

Historicky vyrůstá rámec souladu ze dvou linií. První je sociologie organizací: Meyer
a Rowan ukázali, že organizace přijímají formální struktury nejen pro jejich účinnost, ale
také proto, že jsou v okolí považovány za legitimní, a že se tyto struktury mohou od
skutečného provozu oddělit (Meyer a Rowan, 1977). Druhou linií je regulatorní teorie, v níž
Ayres a Braithwaite popsali odstupňované vynucování: stát nejprve spoléhá na vlastní
kontrolní mechanismy regulovaného subjektu a tvrdší nástroje nasazuje teprve tam, kde tyto
mechanismy selžou (Ayres a Braithwaite, 1992).

Spojení obou linií vysvětluje, proč rámce souladu vznikly a proč současně nesou vlastní
riziko. Stát nemá kapacitu kontrolovat každý systém každé organizace, a proto přenáší část
dohledu na organizaci samu a na auditora, který její doklady ověří. Power tento posun popsal
jako vznik „auditní společnosti“, v níž objem kontroly roste a kontrola se zároveň vzdaluje
od věci, kterou má posuzovat, protože se posuzují zprávy o činnosti, nikoli činnost sama
(Power, 1997).

Edelman na materiálu amerického antidiskriminačního práva doložila, že organizace si samy
vytvářejí výklad toho, co zákon vyžaduje, a že soudy tento výklad časem přejímají jako
měřítko souladu; vzniká tak symbolický soulad, který je právně uznán, aniž by prokazatelně
chránil ty, o něž šlo (Edelman, 2016). Totéž zjištění lze přenést na bezpečnostní rámce: co
se stane standardem, je soubor dokladů, jejichž předložení auditor očekává.

## Jak se projevuje

Rámec souladu se v organizaci projevuje jako soustava dokumentů, rolí a periodických
činností: bezpečnostní politika, posouzení rizik, evidence aktiv, plán zvládání incidentů,
plán obnovy, hodnocení dodavatelů a záznamy, které mají dokládat, že se vše uvedené
skutečně děje. Anderson upozornil, že bezpečnostní opatření se v organizacích rozdělují podle
toho, kdo nese náklady a kdo riziko, takže opatření snadno skončí tam, kde je dobře vidět,
a ne tam, kde je nejvíc potřeba (Anderson, 2001).

Pozorovatelným znakem zdravého rámce je, že se jeho artefakty mění, když se mění provoz:
posouzení rizik reaguje na nový systém, evidence aktiv odpovídá tomu, co je skutečně
nasazeno, a zkoušky obnovy mají zaznamenané výsledky včetně neúspěchů. Znakem rámce
vyprázdněného je naopak dokumentace, která zůstává beze změny, zatímco infrastruktura se
proměnila, a nálezy, jež se každý rok opakují se stejnou formulací o plánované nápravě
(Power, 1997).

Vaughan na rozboru rozhodování před havárií raketoplánu Challenger popsala, jak se odchylka
od vlastního standardu postupně stane normou, protože se opakovaně obejde bez následku
a organizace si ji vyloží jako přijatelnou; formální proces přitom běží dál a odchylku
zaznamená jako schválenou (Vaughan, 1996). Pro posuzování souladu z toho plyne, že samotná
existence procesu nevypovídá o tom, co proces propouští.

## Mechanismus

Strukturně stojí rámec souladu na převodu nejistoty na seznam. Obecný cíl – „organizace musí
chránit osobní údaje“ – se rozloží na opatření, která lze zavést a doložit; tím se stane
posuzovatelným, ale také konečným. Co na seznam nepatří, přestane být předmětem pozornosti,
i když k původnímu cíli patří. Krawiec tento posun nazval kosmetickým souladem: organizace
investuje do té části opatření, která je viditelná pro kontrolora, protože právě ta snižuje
její právní riziko (Krawiec, 2003).

Druhou složkou je přenos důvěryhodnosti. Certifikát i auditní nález jsou tvrzení
o organizaci, které třetí strana přijímá, aniž by měla přístup k podkladům; funkce těchto
dokladů je tedy epistemická, ne technická (Power, 1997). *Interpretace knihy*: tam, kde
doklad nese důvěryhodnost místo skutečnosti, vzniká povrch, na který lze zaútočit týmiž
prostředky jako na kterýkoli jiný zdroj důvěry – předložením dokladu, který formální podmínky
splňuje a obsahové nikoli.

Třetí složkou je zahlcení. Organizace působící v několika jurisdikcích plní několik
překrývajících se rámců současně a část kapacity spotřebuje na mapování jednoho rámce na
druhý. Ayres a Braithwaite ukázali, že odstupňované vynucování předpokládá funkční vnitřní
kontrolu; kde ji přetížení formální agendou oslabí, zbyde z celé konstrukce jen vrchní vrstva
dokladů (Ayres a Braithwaite, 1992).

## Právní rámec

Evropské nařízení o ochraně osobních údajů (nařízení (EU) 2016/679) stanoví u nejtěžších
porušení správní pokuty ve výši až 4 % celkového celosvětového ročního obratu, u méně
závažných až 2 %; směrnice o opatřeních k zajištění vysoké společné úrovně kybernetické
bezpečnosti (směrnice (EU) 2022/2555, NIS2) ukládá subjektům v určených odvětvích povinnost
řídit rizika a hlásit významné incidenty, s horní hranicí pokut deset milionů eur nebo 2 %
celosvětového obratu u základních subjektů. Právě tato konstrukce vysvětluje, proč organizace
investují do prokazatelnosti: sankce se odvozuje nejen od škody, ale i od toho, zda organizace
dokáže doložit přijatá opatření (Power, 1997).

| Kategorie rámce | Čím je vynucen | Co nese riziko při nedodržení |
|---|---|---|
| regulatorní povinnost | zákon nebo přímo použitelné nařízení | správní sankce a dozorové opatření |
| oborový standard | smlouva s odběratelem nebo platební sítí | ztráta obchodního vztahu |
| dobrovolná norma | certifikace a periodický audit | odnětí certifikátu |
| vnitřní politika | rozhodnutí vedení organizace | vnitřní odpovědnost a pracovněprávní důsledky |

V České republice je výchozím předpisem zákon č. 181/2014 Sb., o kybernetické bezpečnosti,
který zavedl povinnosti pro správce informačních systémů kritické informační infrastruktury
a významných informačních systémů a svěřil dozor Národnímu úřadu pro kybernetickou
a informační bezpečnost. Transpozice směrnice NIS2 do českého práva proběhla novou úpravou;
tato kniha neuvádí číslo tohoto předpisu, protože bylo převzato z nástroje platformy
a nebylo pro účely knihy ověřeno (*interpretace knihy*). Při citování povinností je proto
namístě vycházet z platného znění předpisu, ne z přehledové tabulky nástroje.

## Odlišení

Rámec souladu je třeba odlišit od bezpečnosti. Soulad je tvrzení o tom, že organizace splnila
stanovené požadavky; bezpečnost je vlastnost systému vůči skutečnému útočníkovi. Obě se mohou
rozcházet v obou směrech: organizace může být v souladu a zranitelná, nebo odolná a formálně
nevyhovující, protože zvolila jiné, rovnocenné opatření (Anderson, 2001).

Od auditu se rámec liší tím, že audit je činnost posuzování, zatímco rámec je měřítko, proti
němuž se posuzuje; ztotožnění obou vede k tomu, že se za bezpečnost považuje to, co auditor
umí zkontrolovat (Power, 1997). Od řízení rizik se rámec liší zdrojem priorit: řízení rizik
vychází z modelu hrozby dané organizace, rámec z normativního seznamu, který je pro celé
odvětví stejný (NIST, 2018).

Od předstíraného souladu, který kniha popisuje jako [Scam
Compliance](@/glossary/scam-compliance.md), se legitimní rámec liší tím, že jeho artefakty
odpovídají skutečnému provozu a že organizace nese důsledky, když neodpovídají. Rozdíl není
v kvalitě dokumentace, ale v tom, zda dokumentace něco popisuje (Krawiec, 2003).

## Organizační obrana

Pro organizaci, která chce mít soulad i ochranu, vyplývá z literatury několik souběžných
požadavků. Doklady mají být získávány ze systémů samých, a ne vytvářeny pro audit, protože
ručně sestavovaný důkaz zastarává dřív, než je předložen, a popisuje stav v okamžiku, který už
neplatí (Anderson, 2001). Nálezy mají být sledovány do uzavření, včetně těch, které se
opakují, protože opakovaný nález bez nápravy je přesně tím místem, kde se podle Vaughan
odchylka normalizuje (Vaughan, 1996).

Rozhodující je, kdo smí posoudit, že je požadavek splněn. Edelman doložila, že výklad
požadavku si organizace tvoří sama a že tento výklad se časem stane standardem; obranou je
proto oddělení toho, kdo opatření zavádí, od toho, kdo posuzuje jeho dostatečnost, a doložená
nezávislost druhé role (Edelman, 2016). Širší organizační opatření, včetně revizních cyklů
politik, popisuje kapitola [Organizační
obrana](@/kompendium/organizational-defense/_index.md) a stránka [Cykly revize
politik](@/kompendium/organizational-defense/8-policy-review-cycles.md).

## Meze a kritika

Pojem má dvě známé meze. První je záměna měřitelného za podstatné: rámce vybírají požadavky,
které lze posoudit jednotně napříč organizacemi, a tato jednotnost je jejich přednost i jejich
slabina, protože model hrozby konkrétní organizace do seznamu nevstupuje (NIST, 2018). Druhou
mezí je sklon rámců k růstu: čím více rámců organizace plní, tím větší podíl kapacity padne na
správu souladu samého, a Power upozorňuje, že tento nárůst se obvykle neměří, protože měřit by
ho musel týž aparát, který roste (Power, 1997).

Kritika pojmu z pozice knihy je užší: rámec souladu je dobrý nástroj důkazu a špatný nástroj
důvěry. Kde se z certifikátu stane důvod nedívat se dál, nahradí doklad poznání, a to je
struktura, kterou kniha rozebírá u [epistemické
anihilace](@/glossary/epistemicka-anihilace.md) obecně (*interpretace knihy*). Zda existuje
rámec, který by této záměně odolal, je otevřená otázka; dostupná literatura o symbolickém
souladu zatím ukazuje, že záměna je spíše pravidlem než výjimkou (Edelman, 2016).

## Literatura

- Anderson, R. (2001). *Why Information Security is Hard: An Economic Perspective*. Proceedings of the Annual Computer Security Applications Conference.
- Ayres, I., & Braithwaite, J. (1992). *Responsive Regulation: Transcending the Deregulation Debate*. Oxford University Press.
- Edelman, L. B. (2016). *Working Law: Courts, Corporations, and Symbolic Civil Rights*. University of Chicago Press.
- ISO/IEC 27001 (2022). *Information security, cybersecurity and privacy protection — Information security management systems — Requirements*.
- Krawiec, K. D. (2003). *Cosmetic Compliance and the Failure of Negotiated Governance*. Washington University Law Quarterly.
- Meyer, J. W., & Rowan, B. (1977). *Institutionalized Organizations: Formal Structure as Myth and Ceremony*. American Journal of Sociology.
- NIST (2018). *Framework for Improving Critical Infrastructure Cybersecurity, Version 1.1*. National Institute of Standards and Technology.
- Nařízení (EU) 2016/679 (2016). *Obecné nařízení o ochraně osobních údajů (GDPR)*.
- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford University Press.
- Směrnice (EU) 2022/2555 (2022). *O opatřeních k zajištění vysoké společné úrovně kybernetické bezpečnosti v Unii (NIS2)*.
- Vaughan, D. (1996). *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.
- Zákon č. 181/2014 Sb. (2014). *Zákon o kybernetické bezpečnosti*.

## Související

**Příbuzné kontroly**

- [Risk Score](@/glossary/risk-score.md) – souhrnné skóre rizika a jeho výklad.
- [Due Diligence](@/glossary/due-diligence.md) – prověrka, v níž je soulad jedním z hledisek.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – příbuzná regulatorní kontrola.
- [Chain of custody](@/glossary/chain-of-custody.md) – doložitelnost důkazu jako vlastnost procesu.

**Kompendium**

- [Scam Compliance](@/glossary/scam-compliance.md) – předstíraný soulad jako nástroj klamu.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – rámec, do něhož kniha záměnu dokladu za poznání zařazuje.
- [Organizační obrana](@/kompendium/organizational-defense/_index.md) – instituce odolné vůči manipulaci.
- [Cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) – údržba dokumentace, která má odpovídat provozu.
