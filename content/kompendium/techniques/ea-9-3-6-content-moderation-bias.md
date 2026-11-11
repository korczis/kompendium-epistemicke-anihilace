+++
title = "EA-9.3.6 Content Moderation Bias"
description = "Vzorec, v němž systematické zaujatosti automatické moderace – podle jazyka, dialektu nebo tématu – vedou k nerovnému umlčování a jsou zneužitelné proti oponentům."
weight = 936

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-3", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-3-5-shadowban-coordination", "ea-9-3-8-mass-reporting-coordination", "ea-9-6-3-automated-content-takedown"]
ea_code = "EA-9.3.6"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.3 Sociální platformy"
section_icon = "📱"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.3.6 Content Moderation Bias

> *Subkategorie 📱 **9.3 Sociální platformy** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.3.6`
**Název:** Content Moderation Bias
**Subkategorie:** 9.3 Sociální platformy
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Content moderation bias* označuje systematické zaujatosti automatických moderačních systémů – nadměrné odstraňování obsahu v určitém jazyce, dialektu, tématu nebo od určité skupiny a naopak přehlížení obsahu jiného – a jejich vědomé zneužití: aktéři formulují vlastní obsah tak, aby moderaci prošel, zatímco oponenty provokují k reakcím, které moderace zachytí.

## 3. Mechanismus (strukturálně)

Klasifikátory se učí na příkladech, které nemusí rovnoměrně pokrývat všechny jazyky, dialekty a kontexty. Výsledkem bývá vyšší míra chybných zásahů u menšinových jazyků, u slangu nebo u obsahu, který o násilí či nenávisti *informuje* (žurnalistika, osvěta, svědectví obětí). Kdo tyto slabiny zná, může je využít: vlastní nenávistný obsah zakódovat do eufemismů a kódových slov, a oponenty vyprovokovat k ostré reakci, za kterou budou potrestáni oni. Systém, který má chránit, tak nerovnoměrně umlčuje ty, kdo jsou už tak slabší.

## 4. Detekční markery

- Obsah obětí nebo novinářů popisující násilí je odstraňován, zatímco kódovaný nenávistný obsah zůstává.
- Výrazně vyšší míra zásahů u příspěvků v určitém jazyce nebo dialektu.
- Opakovaně úspěšná odvolání – znak, že první zásah byl chybný.
- Provokace následované hromadným nahlašováním reakce provokovaného.
- Eufemismy a kódová slova, která se rychle mění, když je moderace začne zachycovat.

## 5. Odlišení

*Nedokonalost moderace*: náhodné chyby bez systematického vzorce. *Rozdílná pravidla platforem*: legitimní, pokud jsou veřejná a uplatňovaná stejně. *[EA-9.3.5 Shadowban Coordination](@/kompendium/techniques/ea-9-3-5-shadowban-coordination.md)*: cílený útok na konkrétní účet; zde systémová nerovnost, kterou lze zneužít.

## 6. Dopad a rámec

Nerovnoměrná moderace umlčuje zranitelné skupiny a zároveň jim bere ochranu před nenávistí. Oslabuje důvěru v platformy a může vést k přesunu komunit na méně moderovaná místa. Rámcem jsou pravidla transparentnosti moderace, právo na zdůvodnění a odvolání (DSA v EU) a pravidla zákazu diskriminace. Pro výzkum je klíčový přístup k datům o moderaci.

Pro platformy je zaujatá moderace i reputačním a právním rizikem, protože podkopává důvěru menšinových uživatelů a může naplňovat znaky nepřímé diskriminace. Pro organizace zastupující zranitelné skupiny je užitečné nabízet platformám spolupráci na pravidlech a školení moderátorů, protože právě znalost kontextu je to, co automatickým systémům nejvíce chybí. Pro výzkum je otevřená otázka, jak měřit rovnost moderace mezi jazyky, které mají velmi rozdílný objem obsahu.

## 7. Obrana a zotavení

*Postižení uživatelé*: využívat odvolání, dokumentovat chybné zásahy, sdílet je s organizacemi, které moderaci sledují. *Novináři a osvětové organizace*: uvádět kontext u obsahu o násilí; spolupracovat s platformami na výjimkách. *Platformy*: pravidelné audity zaujatosti podle jazyka a skupiny, lidská revize u hraničních případů. *Regulátoři a výzkum*: zveřejňování statistik moderace a odvolání.

## 8. Příklad (anonymizovaný kompozit)

Romská aktivistka sdílí snímky nenávistných komentářů, které dostává, aby upozornila na problém. Její příspěvky jsou opakovaně odstraněny za „nenávistný obsah“, zatímco původní komentáře psané v kódových výrazech zůstávají. Organizace, která moderaci sleduje, shromáždí podobné případy a předá je platformě i regulátorovi; po revizi platforma upraví postup pro obsah, který nenávist dokumentuje.

## 9. Meze a otevřené otázky

Prokázat systematickou zaujatost bez přístupu k datům platforem je obtížné a jednotlivé případy mohou být nereprezentativní. Otevřenou otázkou je, jak moderovat ve stovkách jazyků s rovnou kvalitou a jak chránit svědectví o násilí.

Kniha neuvádí čísla o rozdílech v moderaci mezi jazyky a skupinami, protože veřejně dostupná data jsou neúplná; odkazuje na kvalitativní a případové poznatky výzkumu.

Otevřenou otázkou je i to, zda lze spravedlivě moderovat ve stovkách jazyků s rovnou kvalitou, a pokud ne, jak mají platformy o této nerovnosti informovat uživatele. Kniha považuje za minimum otevřené přiznání, kde moderace funguje hůř, aby uživatelé a regulátoři mohli jednat.

Pro zasažené uživatele je užitečné vědět, že úspěšné odvolání není výjimkou a že má smysl ho podat.

Jeden odstraněný příspěvek nedokládá zaujatost systému: klasifikátory chybují i bez jakéhokoli
vzorce a jednotlivý zásah je slučitelný s náhodou (Gorwa, Binns a Katzenbach 2020). Rozpoznání
nerovnosti rovněž neurčuje, kdo ji zavinil — nerovnoměrné pokrytí trénovacích dat není rozhodnutím
člověka, který zásah potvrdil.

*Interpretace knihy*: zjištěná nerovnost nevypovídá ani o oprávněnosti konkrétního zásahu a obojí
je třeba posuzovat odděleně. Následek je přesto epistemický: komu je slovo odebíráno soustavně,
ztrácí postavení svědka ve Frickerově (2007) smyslu, i kdyby byl každý jednotlivý zásah
obhajitelný.

## 10. Pohled zevnitř a práce s postiženým

Uživatel, který je opakovaně trestán za to, že se brání nebo mluví o vlastní zkušenosti, prožívá dvojí křivdu – útok a pak umlčení. Je to blízké tomu, co kniha popisuje jako [epistemickou nespravedlnost](@/glossary/epistemicka-injustice.md): jeho slovo má menší váhu. Pomáhá uznání křivdy a propojení s komunitou a organizacemi, které mohou jednat systémově.

Pro moderátory komunit, kteří vidí nerovnost zásahů, je důležité mít možnost ji eskalovat a nezůstat s pocitem bezmoci; i jejich zkušenost je cenným zdrojem pro audit.

## 11. Vztah k ostatním kategoriím EA

Nerovnost v tom, čí slovo platí, rozebírá teoreticky kapitola o [sociální epistemologii](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md) (Fricker 2007). Provokace s cílem vyvolat potrestatelnou reakci odpovídá dynamice [DARVO](@/glossary/darvo.md) v digitálním prostředí: útočník se stává „obětí“ a oběť „útočníkem“.

## 12. Postup při podezření na zaujatou moderaci

1. **Dokumentovat zásahy** – obsah, datum, zdůvodnění, výsledek odvolání.
2. **Porovnat s podobným obsahem**, který zůstal.
3. **Využít odvolání** s kontextem a odkazem na pravidla.
4. **Předat případy** organizacím, které moderaci sledují.
5. **Podat podnět** regulátorovi, pokud se vzorec opakuje.

## 13. Prevence a odolnost

Prevence stojí na auditech moderace podle jazyka a skupin, na lidské revizi hraničních případů a na spolupráci platforem s organizacemi zastupujícími zranitelné skupiny. Pro uživatele je užitečné uvádět kontext u obsahu, který dokumentuje nenávist nebo násilí.

## 14. Otázky pro rozhovor a šetření

- Jaký obsah byl odstraněn a s jakým zdůvodněním?
- Zůstal podobný obsah od jiných autorů?
- Bylo odvolání úspěšné?
- V jakém jazyce nebo dialektu byl obsah napsán?
- Předcházela zásahu provokace?

## Odborný kontext

Gillespie (2018) ukázal, že pravidla moderace i jejich uplatňování nesou hodnotová rozhodnutí a že platformy tato rozhodnutí činí ve velkém měřítku a s omezenou transparentností. Gorwa, Binns a Katzenbach (2020) upozornili, že automatické klasifikátory mají nerovnoměrnou přesnost napříč jazyky a kontexty a že chyby se systémově soustřeďují. Noble (2018) na příkladu vyhledávačů doložila, jak algoritmické systémy reprodukují rasové a genderové stereotypy.

Fricker (2007) popsala svědeckou nespravedlnost – situaci, kdy výpověď ztrácí váhu kvůli předsudku vůči mluvčímu. Zaujatá moderace je její technickou podobou: svědectví obětí o nenávisti je odstraněno, zatímco kódovaná nenávist zůstává. Kniha proto chápe nerovnou moderaci nejen jako technickou chybu, ale jako epistemickou nespravedlnost, která zesiluje existující nerovnosti v tom, čí slovo platí.

## Souvislosti pro praxi

Pro platformy je užitečné pravidelně zveřejňovat statistiky moderace a odvolání podle jazyků a kategorií. Pro neziskové organizace je cenné vést přehledy kódových výrazů, které moderace nezachycuje, a sdílet je s platformami. Pro výzkumníky je klíčový přístup k datům, který evropská regulace velkým platformám ukládá.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice*. Oxford University Press.
- Gillespie, T. (2018). *Custodians of the Internet*. Yale University Press.
- Gorwa, R., Binns, R., & Katzenbach, C. (2020). Algorithmic content moderation. *Big Data & Society*.
- Noble, S. U. (2018). *Algorithms of Oppression: How Search Engines Reinforce Racism*. NYU Press.

## Související

**Sourozenecké techniky**

- [EA-9.3.5 Shadowban Coordination](@/kompendium/techniques/ea-9-3-5-shadowban-coordination.md) – cílené ztlumení účtu.
- [EA-9.3.8 Mass Reporting Coordination](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md) – hromadné nahlašování.
- [EA-9.6.3 Automated Content Takedown](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md) – chybná automatická odstranění.

**Pojmy a teorie**

- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – čí slovo má váhu.
- [DARVO](@/glossary/darvo.md) – obrácení role oběti a útočníka.
- [Sociální epistemologie EA](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md) – teoretický rámec.

**Kritika a obrana**

- [Kulturní zaujatost EA kategorií](@/kompendium/critical-perspectives/10-cultural-bias-critique.md) – i kategorie mohou být zaujaté.
- [Sebe-obrana: Mobilizace podpory](@/kompendium/self-defense-guides/30-support-mobilization.md) – systémová reakce.
