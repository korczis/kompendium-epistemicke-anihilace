+++
title = "EA-9.6.7 AI Medical Decision EA"
description = "Vzorec AI v klinickém rozhodování – diagnostika, triáž, doporučení léčby –, kde zaujatá data snižují přesnost pro určité skupiny a klinik výstupu přesto důvěřuje."
weight = 967

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-10-AI-welfare-decision-EA", "ea-9-6-2-AI-judgment-laundering"]
ea_code = "EA-9.6.7"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.7 AI Medical Decision EA

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.7`
**Název:** AI Medical Decision EA
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI medical decision EA* označuje rizika automatizovaných systémů v klinickém rozhodování – diagnostických modelů, triážních systémů, doporučovačů léčby –, které jsou trénovány na datech nerovnoměrně zastupujících pacienty. Pro skupiny, o nichž je v datech méně informací (ženy, menšiny, starší, lidé se vzácnými onemocněními), mají systémy nižší přesnost, a klinik, který výstupu důvěřuje, může chybu převzít.

## 3. Mechanismus (strukturálně)

Medicína historicky zkoumala některé skupiny méně a data to odrážejí. Model, který se z nich učí, je méně přesný tam, kde data chybějí; souhrnná čísla o přesnosti přitom tento rozdíl skryjí. Další zdroj zaujatosti vzniká volbou cíle: doložený příklad popsali Obermeyer a kol. (2019, *Science*) u algoritmu, který k určení potřeby péče používal minulé náklady na péči, a tím systematicky podceňoval potřeby pacientů, kteří k péči měli horší přístup. Epistemickým jádrem je [automatizační zkreslení](@/glossary/kognitivni-bias.md): klinik pod časovým tlakem přebírá výstup systému a vlastní pochybnost potlačí.

## 4. Detekční markery

- Výsledky systému se liší mezi skupinami pacientů s podobným klinickým obrazem.
- Klinici přestávají ověřovat výstupy a dokumentace odkazuje na „doporučení systému“.
- Pacienti z určitých skupin si stěžují, že jejich příznaky nebyly brány vážně.
- Validace systému proběhla na populaci, která neodpovídá místním pacientům.
- Provozovatel nezná ani nezveřejňuje přesnost podle podskupin.

## 5. Odlišení

*Klinická chyba bez AI*: lidské selhání, které nesouvisí se systémem. *Dobře validovaný nástroj*: ověřený na relevantní populaci, s přiznanými mezemi, používaný jako podpora. *[EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md)*: obecný vzorec; v medicíně má přímý dopad na zdraví a život.

## 6. Dopad a rámec

Zaujaté klinické systémy mohou vést k pozdní diagnóze, nedostatečné léčbě a zhoršení zdravotních nerovností. Rámcem jsou pravidla pro zdravotnické prostředky (software jako zdravotnický prostředek), akt o umělé inteligenci, profesní odpovědnost lékaře a práva pacienta na informace. Odpovědnost za rozhodnutí zůstává na klinikovi ([Zdravotnická pochybení a EA](@/kompendium/forensic-legal/18-medical-malpractice-EA.md)).

## 7. Obrana a zotavení

*Pacient*: ptát se, zda bylo rozhodnutí podpořeno systémem, a požádat o vysvětlení; u přetrvávajících příznaků trvat na dalším vyšetření nebo [druhém názoru](@/kompendium/emergency-protocols/38-second-opinion-emergency.md). *Klinik*: používat systém jako podporu, ne náhradu úsudku; dokumentovat vlastní posouzení. *Nemocnice*: validovat systémy na vlastní populaci, sledovat přesnost podle skupin. *Regulátoři*: vyžadovat zveřejnění přesnosti podle podskupin.

## 8. Příklad (anonymizovaný kompozit)

Triážní systém na urgentním příjmu zařadí ženu s bolestí na hrudi do nízké priority; příznaky neodpovídají „typickému“ obrazu, na němž byl systém trénován. Zkušená sestra má pochybnosti a požádá lékaře o vyšetření; ukáže se infarkt. Nemocnice poté zjistí, že systém byl validován převážně na mužích, a zavede pravidlo, že sestra může prioritu vždy zvýšit.

## 9. Meze a otevřené otázky

AI systémy mohou přesnost v medicíně i zvyšovat; otázkou je jejich validace a způsob použití. Otevřenou otázkou je, jak zajistit reprezentativní data bez ohrožení soukromí a jak udržet klinický úsudek v prostředí, kde systém „obvykle má pravdu“.

## 10. Pohled zevnitř a práce s postiženým

Pacient, jehož příznaky byly podceněny, prožívá nedůvěru ke zdravotnictví a pocit, že mu nikdo nevěří – zkušenost blízká [epistemické nespravedlnosti](@/glossary/epistemicka-injustice.md). U pacientů s předchozími zkušenostmi s diskriminací se tato nedůvěra prohlubuje. Pomáhá uznání chyby, vysvětlení a obnovení vztahu s ošetřujícím týmem.

## 11. Vztah k ostatním kategoriím EA

Vzorec se dotýká kapitoly 6: diagnostika EA sama musí čelit riziku zkreslení nástrojů ([6.1.1 Screeningové instrumenty](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md)) a [iatrogenního poškození](@/glossary/iatrogenic-harm.md). V kritických perspektivách knihy souvisí s [medikalizací](@/kompendium/critical-perspectives/1-medicalization-critique.md).

## 12. Otázky pro rozhovor a šetření

- Podílel se na rozhodnutí o vaší péči automatizovaný systém?
- Bylo vaše vlastní hodnocení příznaků vzato v úvahu?
- Na jaké populaci byl systém ověřen?
- Měl klinik možnost systém přehlasovat a využil ji?
- Jak je dokumentováno vlastní posouzení klinika?

## 13. Postup pro profesionály

1. **Klinik:** dokumentovat vlastní úsudek vedle výstupu systému; při nesouladu jednat podle klinického obrazu.
2. **Vedení nemocnice:** zavést lokální validaci a monitorování přesnosti podle skupin.
3. **Etická komise:** posoudit nasazení systému a informování pacientů.
4. **Právník pacienta:** posoudit, zda byl dodržen standard péče.
5. **Výzkumník:** publikovat analýzy přesnosti podle podskupin.

## 14. Prevence a odolnost

Prevence stojí na reprezentativních datech, lokální validaci, vzdělávání kliniků o automatizačním zkreslení a na kultuře, v níž je pochybnost o výstupu systému žádoucí. Pacientům pomáhá znalost práva na informace a na druhý názor.

## 15. Typický průběh

Systém se zavede s doloženou průměrnou přesností. V provozu ho klinici začnou používat jako rychlou orientaci, pak jako rozhodnutí. Chyby u méně zastoupených skupin se objevují sporadicky a jsou vysvětlovány individuálně. Vzorec se ukáže až při analýze výsledků podle skupin nebo po závažné události. Náprava vyžaduje úpravu systému i postupů.

## 16. Dokumentace a důkazy

Klíčová je zdravotnická dokumentace s vlastním posouzením klinika, záznamy výstupů systému, validační dokumentace a statistiky přesnosti podle skupin. Pacient má právo na nahlédnutí do své dokumentace.

## Odborný kontext

Obermeyer et al. (2019) analyzovali algoritmus široce používaný v americkém zdravotnictví k výběru pacientů pro programy intenzivnější péče a zjistili, že při stejném skóre byli černí pacienti nemocnější než bílí; příčinou bylo, že algoritmus předpovídal náklady na péči, nikoli potřebu péče, a náklady odrážely nerovný přístup ke zdravotnictví. Studie je cenná tím, že ukazuje zaujatost vzniklou z volby cílové proměnné, nikoli ze zlého úmyslu, a tím, že autoři navrhli a ověřili opravu.

Druhým zdrojem rizika je lidská strana. Parasuraman a Manzey (2010) shrnují výzkum, podle něhož lidé pod zátěží méně kontrolují výstupy automatizace a mají sklon jim dávat přednost před vlastním pozorováním; v medicíně se tento jev projevuje jako přebírání doporučení systému i tam, kde klinický obraz neodpovídá. Fricker (2007) pojmenovává dopad na pacienty: pokud jejich výpověď o příznacích nemá stejnou váhu jako výstup systému, dochází k epistemické nespravedlnosti, která prohlubuje existující nerovnosti v péči.

## Souvislosti pro praxi

Pro nemocnice je praktickým krokem zavést u každého klinického systému „pravidlo přehlasování“: sestra nebo lékař mohou výstup systému vždy změnit a změna se eviduje bez nutnosti zdůvodňovat ji nadřízeným. Evidence přehlasování je zároveň cenným zdrojem dat o tom, kde systém selhává. Pro výuku zdravotníků je užitečné zařadit případy, kdy systém chyboval u netypických pacientů, a trénovat rozpoznávání automatizačního zkreslení. Pacientským organizacím se vyplácí sledovat, zda jejich skupina byla zastoupena v datech, na nichž byl systém ověřen.

Pro etické komise je vhodné posuzovat nasazení klinických systémů podobně jako jiné zásahy do péče: s ohledem na informování pacientů, na rozdělení rizik mezi skupiny a na možnost sledovat dopady po zavedení.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Obermeyer, Z., Powers, B., Vogeli, C., & Mullainathan, S. (2019). Dissecting racial bias in an algorithm used to manage the health of populations. *Science*.
- Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors*.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.
- [EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) – automatizace v sociálním systému.
- [EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – odpovědnost skrytá za systémem.

**Klinika a právo**

- [Zdravotnická pochybení a EA](@/kompendium/forensic-legal/18-medical-malpractice-EA.md) – odpovědnost klinika.
- [Emergency: Akutní second opinion](@/kompendium/emergency-protocols/38-second-opinion-emergency.md) – druhý názor.
- [6.1.1 Screeningové instrumenty](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md) – meze nástrojů.

**Pojmy a kritika**

- [Iatrogenní poškození](@/glossary/iatrogenic-harm.md) – škoda způsobená péčí.
- [Medikalizace etického aktérství](@/kompendium/critical-perspectives/1-medicalization-critique.md) – kritický rámec.
