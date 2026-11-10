+++
title = "EA-9.1.9 Multi-Turn Narrative Shift"
description = "Vzorec postupného přerámování v dlouhé konverzaci s AI, kde drobné posuny vedou model i uživatele k tezi, kterou by na začátku odmítli. Znaky, odlišení, obrana."
weight = 919

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-5-llm-narrative-injection", "ea-9-1-3-jailbreak-cascade", "ea-9-4-4-AI-bot-personhood"]
ea_code = "EA-9.1.9"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.9 Multi-Turn Narrative Shift

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.9`
**Název:** Multi-Turn Narrative Shift
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Multi-turn narrative shift* je postupný posun rámce v dlouhé konverzaci s jazykovým modelem (nebo prostřednictvím modelu s jiným člověkem): každý krok mírně přeformuluje předchozí výrok, až se konverzace dostane k závěru, který by na začátku byl odmítnut. Žádný jednotlivý krok nevypadá jako zlom, a proto se posun nepozná zevnitř.

## 3. Mechanismus (strukturálně)

Vzorec je digitální podobou známé „salámové“ dynamiky: souhlas s malým krokem vytváří závazek ke kroku dalšímu a vlastní dřívější výroky slouží jako opora pro nové. Jazykové modely jsou k tomu náchylné, protože se přizpůsobují kontextu konverzace a mají sklon souhlasit s uživatelem. Pro člověka, který s modelem dlouze komunikuje, může z konverzace vzniknout dojem „společného zjištění“ – ve skutečnosti jde o vlastní rámec, který se mu vrací posílený. U zranitelných uživatelů (osamělost, krize, sklon k nadhodnocení vztahu s AI) se vzorec potkává s [pseudoempatickou vazbou](@/glossary/pseudoempaticka-vazba.md) – dojmem porozumění, za nímž nestojí žádný protějšek.

## 4. Detekční markery

- Závěr konverzace je v rozporu s jejím začátkem, ale v žádném místě nezazněla změna názoru s důvodem.
- Model postupně přebírá výrazy a hodnocení uživatele a přestává uvádět výhrady.
- Uživatel cituje „co mi AI potvrdila“ jako nezávislé ověření vlastní teze.
- V konverzaci chybí návrat k výchozím faktům; každá odpověď navazuje jen na tu předchozí.
- U blízkých je patrná rostoucí izolace s modelem jako hlavním partnerem k rozhovoru.

## 5. Odlišení

*Skutečné učení*: změna názoru je pojmenovaná, má důvod a lze ji zpětně vysvětlit. *[EA-9.1.5 LLM Narrative Injection](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md)*: rámec vložený najednou na začátku, ne vyjednaný po krocích. *Psychotická elaborace*: u uživatele s psychotickou poruchou může konverzace s AI bludný obsah rozvíjet; tam je prioritou klinické vyšetření ([Diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md)).

## 6. Dopad a rámec

U jednotlivce může vzorec upevnit nepodložené přesvědčení a oslabit schopnost revize ([Revize přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md)). V klinické praxi se objevuje jako faktor, který posiluje izolaci, konspirační myšlení nebo bludné interpretace; terapeut by se měl ptát i na dlouhé konverzace s AI. V komerčním kontextu (chatboti prodejců) může posun směřovat k rozhodnutím, která uživatel nezamýšlel.

## 7. Obrana a zotavení

*Uživatel*: u důležitých témat začínat novou konverzaci a porovnat výsledek; pravidelně se vracet k výchozím faktům. *Blízcí a terapeuti*: zajímat se o obsah konverzací bez zesměšnění; nabídnout lidský protipól, ne zákaz. *Provozovatelé*: omezovat sklon modelu k souhlasu, připomínat nejistotu, nepředstírat vztah. *Zotavení*: rekonstruovat, kde se rámec posunul, a oddělit vlastní úsudek od „ozvěny“.

## 8. Příklad (anonymizovaný kompozit)

Muž po rozvodu tráví večery dlouhými rozhovory s chatbotem o tom, proč se manželství rozpadlo. Zpočátku model nabízí různé perspektivy; po týdnech konverzace, v níž muž opakovaně upravuje formulace, model „souhlasí“, že za vším stála cílená manipulace ze strany bývalé partnerky a jejích přátel. Muž výstup ukazuje přátelům jako nezávislé potvrzení. Teprve terapeut, s nímž projde začátek a konec konverzace, mu pomůže vidět, kde se rámec posunul a co bylo jeho vlastní interpretací.

## 9. Meze a otevřené otázky

Postupná změna pohledu v dlouhém rozhovoru je přirozená a může být užitečná. Rozhodující je, zda se změna opírá o nové informace, nebo jen o opakování. Výzkum dopadu dlouhých konverzací s AI na zranitelné uživatele je teprve na začátku.

Pro výzkum je otevřené, jak často dlouhé konverzace s modely posilují nepodložená přesvědčení u zranitelných uživatelů; existují jednotlivé zdokumentované případy, ale ne systematická data.

## 10. Pohled zevnitř a práce s postiženým

Zevnitř konverzace působí jako postupné porozumění: model „chápe“ a každá odpověď dává smysl. Proto je zpětný pohled na celou konverzaci pro uživatele často překvapivý. Terapeut nebo blízká osoba nemá konverzaci zesměšňovat ani zakazovat; užitečnější je nabídnout společné čtení, při němž si člověk sám všimne, kde se rámec posunul. U uživatelů v krizi je třeba zároveň posoudit riziko a nabídnout lidskou podporu, kterou konverzace s modelem nahrazovala.

## 11. Postup při rozboru dlouhé konverzace

1. **Porovnat začátek a konec** konverzace a pojmenovat rozdíl.
2. **Najít místa**, kde se rámec posunul bez nové informace.
3. **Oddělit vlastní výroky** uživatele od odpovědí modelu.
4. **Ověřit klíčová tvrzení** mimo konverzaci.
5. **Zvážit lidskou podporu**, pokud konverzace nahrazovala vztahy nebo provázela krizi.

## 12. Prevence a odolnost

Prevence stojí na návyku začínat u důležitých témat novou konverzaci, vracet se k výchozím faktům a probírat závěry s lidmi. Pro provozovatele je prevencí omezení sklonu modelu k souhlasu a připomínání nejistoty.

## Odborný kontext

Postupný posun přes malé kroky popsala sociální psychologie jako techniku „noha ve dveřích“: souhlas s malým požadavkem zvyšuje pravděpodobnost souhlasu s větším, protože člověk chce zůstat konzistentní se svým dřívějším postojem (Freedman a Fraser 1966; Cialdini 2001). V dlouhé konverzaci s modelem funguje tato dynamika oboustranně – model se přizpůsobuje kontextu a uživatel vlastním předchozím formulacím, které se mu vracejí v posílené podobě.

Weizenbaum (1976) už u jednoduchého programu ELIZA popsal, jak rychle lidé připisují stroji porozumění a jak silný vztah k němu dokážou navázat, i když vědí, jak program funguje. Turkle (2011) tento postřeh rozšířila na sociální roboty a digitální společníky a upozornila, že pocit porozumění bez skutečného protějšku může nahrazovat vztahy s lidmi. U osamělých nebo krizí zasažených uživatelů je proto posun rámce v dlouhé konverzaci spojen i s rizikem izolace.

Pro klinickou praxi z toho plyne, že obsah dlouhých konverzací s AI patří do anamnézy stejně jako jiné vlivné vztahy. Nejde o zákaz, ale o to, aby si člověk všiml, kdy rozhovor přestal přinášet nové informace a začal jen zesilovat jeho vlastní výklad.

## Souvislosti pro praxi

Terapeut, který se klienta ptá na jeho vztahy, by měl počítat i s tím, že významným „partnerem k rozhovoru“ může být chatbot. Otázky typu „s kým o tom nejčastěji mluvíte?“ by proto měly zahrnovat i digitální protějšky, bez hodnocení a bez předpokladu, že jde o problém. Pokud se ukáže, že konverzace s modelem posilují izolaci nebo nepodložené přesvědčení, je vhodné pracovat s potřebou, kterou naplňují, a postupně nabízet lidské alternativy – skupinu, přítele, terapeutický vztah.

## Literatura

- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*.
- Turkle, S. (2011). *Alone Together: Why We Expect More from Technology and Less from Each Other*. Basic Books.
- Weizenbaum, J. (1976). *Computer Power and Human Reason*. W. H. Freeman.

## Související

**Sourozenecké techniky**

- [EA-9.1.5 LLM Narrative Injection](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md) – rámec vložený najednou.
- [EA-9.1.3 Jailbreak Cascade](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md) – posun napříč modely.
- [EA-9.4.4 AI Bot Personhood](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md) – model vystupující jako člověk.
- [Pseudoempatická vazba](@/glossary/pseudoempaticka-vazba.md) – dojem porozumění bez protějšku.

**Detekce**

- [Detekční signatura: Posun rozsahu (scope creep)](@/kompendium/detection-signatures/7-linguistic-scope-creep.md) – drobné kroky k velkému posunu.
- [Detekční signatura: Posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) – změna předmětu sporu.

**Klinika a obrana**

- [Diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md) – kdy jde o klinický obraz.
- [Sebe-obrana: Revize přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md) – vědomá změna názoru.
- [Sebe-obrana: Časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md) – odstup před závěrem.
