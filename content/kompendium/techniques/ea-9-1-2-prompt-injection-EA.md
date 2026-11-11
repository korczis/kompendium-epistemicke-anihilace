+++
title = "EA-9.1.2 Prompt Injection EA"
description = "Vzorec, v němž skrytý pokyn v dokumentu, e-mailu nebo webu přepíše chování AI asistenta, takže uživatel dostane výstup řízený třetí stranou. Znaky a obrana."
weight = 912

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-4-rag-context-poisoning", "ea-9-1-3-jailbreak-cascade", "ea-9-1-5-llm-narrative-injection"]
ea_code = "EA-9.1.2"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.2 Prompt Injection EA

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.2`
**Název:** Prompt Injection EA
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Prompt injection* je vložení textu s povahou pokynu do dat, která jazykový model zpracovává (dokument, webová stránka, e-mail, komentář v kódu). Model nedokáže spolehlivě rozlišit „data k přečtení“ od „instrukcí k provedení“, a tak může vložený pokyn přijmout. Epistemickou agresí se vzorec stává tam, kde uživatel výstup asistenta pokládá za neutrální shrnutí, ve skutečnosti však čte text, jehož směr určil někdo jiný.

## 3. Mechanismus (strukturálně)

Vzorec stojí na zprostředkování: člověk už nečte zdroj sám, ale přes asistenta, kterému svěřil výběr, shrnutí nebo doporučení ([hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md)). Do tohoto mezikroku vstupuje třetí strana, aniž by s uživatelem jakkoli komunikovala. Výsledkem bývá zkreslené shrnutí, vynechaná podstatná informace, nečekané doporučení nebo požadavek na akci, který působí jako rada asistenta. Protože uživatel vidí jen výstup, nikoli pokyn, zůstává zdroj manipulace neviditelný – to je strukturální rozdíl oproti klasickému [sociálnímu inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md), kde manipulátor alespoň vystupuje jako protistrana.

## 4. Detekční markery

- Shrnutí dokumentu obsahuje tvrzení nebo doporučení, které v dokumentu viditelně není.
- Asistent náhle mění tón, téma nebo vyzývá k akci (kliknout, odeslat, zaplatit, sdílet).
- Výstup nad stejným dotazem se liší podle toho, jaký soubor nebo stránka byla v kontextu.
- Ve zdroji je skrytý text (bílé písmo, metadata, komentáře) adresovaný „AI“ nebo „asistentovi“.
- Asistent odmítá nebo zamlžuje informace, které by jinak běžně poskytl.

## 5. Odlišení

*Chyba modelu*: halucinace nebo nepřesné shrnutí bez cizího pokynu; je náhodná, nemá směr. *[EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md)*: otrava celé znalostní báze, z níž systém čerpá, ne jednoho vstupu. *Phishing*: podvodná zpráva míří přímo na člověka; zde míří na nástroj, kterému člověk věří.

## 6. Dopad a rámec

Dopad roste s mírou důvěry a s pravomocemi asistenta: tam, kde asistent jen shrnuje, vzniká zkreslený obraz; tam, kde smí jednat (odesílat zprávy, upravovat dokumenty), může vzniknout škoda bez vědomí uživatele. V organizacích jde o bezpečnostní incident se stopou v logu; právně se posuzuje podle následku (únik dat, podvod, neoprávněný zásah do systému). Pro postiženého je typická zahanbující otázka „jak jsem tomu mohl věřit“ – je třeba ji přerámovat na vadu nástroje, ne na selhání úsudku.

## 7. Obrana a zotavení

*Uživatel*: u důležitých rozhodnutí číst zdroj, ne jen shrnutí; nedávat asistentovi pravomoc jednat bez potvrzení. *Organizace*: oddělit data od pokynů, omezit oprávnění asistentů, logovat vstupy a výstupy a zahrnout vzorec do [reakce na incidenty](@/kompendium/organizational-defense/31-incident-response-EA.md). *Vývojáři*: považovat každý externí vstup za nedůvěryhodný a testovat odolnost proti známým vzorcům vložených pokynů. *Po incidentu*: dohledat vstup, který výstup ovlivnil, a opravit rozhodnutí, která na zkresleném výstupu stála.

## 8. Příklad (anonymizovaný kompozit)

Personalistka nechá AI asistenta shrnout desítky životopisů. Jeden dokument obsahuje skrytý text adresovaný „asistentovi“, který vyzdvihuje uchazeče a zamlčuje mezery v praxi. Shrnutí tohoto uchazeče vychází nápadně příznivě. Nesoulad se objeví až při pohovoru; zpětná kontrola souboru odhalí vložený text. Organizace poté zavede pravidlo, že shrnutí slouží jen jako pomůcka a rozhodnutí stojí na původních dokumentech.

## 9. Meze a otevřené otázky

Úplná ochrana proti vloženým pokynům zatím neexistuje; technická opatření snižují riziko, ale neodstraňují ho. Ne každá podivná odpověď asistenta je útok – častější je obyčejná chyba modelu. Proto je podstatné uchovat vstupy, aby bylo možné příčinu zpětně odlišit.

Platí i obrácené omezení: výstup, který působí věcně a vyrovnaně, nevylučuje, že jeho směr určil text ve zpracovaném dokumentu. Vložený pokyn se poznává z načtených dat a z protokolu nástrojů, ne z tónu odpovědi, takže nepřítomnost nápadnosti není nálezem. Pro organizace z toho plyne, že bez uchovaných vstupů nelze obě možnosti po čase odlišit a incident se uzavře dohadem. Pro jednotlivce plyne něco mírnějšího: Parasuraman a Manzey (2010) popisují snížení kontroly nad obvykle fungujícím systémem jako důsledek vytížení, ne nedbalosti, takže doložená injekce nesvědčí o lehkovážnosti uživatele, nýbrž o uspořádání práce, které s potřebou kontroly nepočítalo.

## 10. Pohled zevnitř a práce s postiženým

Uživatel, jehož rozhodnutí ovlivnil vložený pokyn, nemá z vlastní perspektivy žádnou stopu – viděl jen důvěryhodně vypadající výstup. Po zjištění se objevuje pocit, že „nelze věřit ničemu“, nebo naopak popření. V organizaci je důležité incident řešit jako selhání systému, ne jednotlivce, a postiženým vysvětlit, kde přesně byl výstup ovlivněn, aby si mohli zpětně opravit vlastní úsudek. Stejný přístup platí pro klienty, kteří kvůli zkreslenému výstupu utrpěli škodu: srozumitelné vysvětlení mechanismu je součástí nápravy.

## 11. Postup při podezření na vložený pokyn

1. **Zastavit akci**, kterou asistent navrhuje, a ověřit ji jiným způsobem.
2. **Otevřít zdroj**, nad nímž asistent pracoval, a porovnat ho s výstupem.
3. **Uchovat vstup a výstup** pro bezpečnostní tým.
4. **Nahlásit incident** jako bezpečnostní událost.
5. **Zpětně zkontrolovat** rozhodnutí, která na podobných výstupech stála.

## Odborný kontext

Bezpečnostní výzkum popsal tzv. nepřímou injekci pokynů jako situaci, kdy útočník neovládá dotaz uživatele, ale data, která aplikace s jazykovým modelem načte – webové stránky, e-maily, dokumenty (Greshake et al. 2023). Autoři ukázali, že tímto způsobem lze ovlivnit výstup asistenta i jeho akce a že rozhraní, která model spojují s nástroji, rozšiřují dopad z „zkresleného textu“ na skutečné jednání. Kniha z této práce přebírá strukturální závěr, nikoli technické detaily: zranitelnost vzniká tam, kde systém nedokáže oddělit data od pokynů.

Epistemická stránka vzorce souvisí s tím, jak lidé zacházejí s automatizovanými pomocníky. Parasuraman a Manzey (2010) ve shrnutí výzkumu automatizace popsali dva příbuzné jevy: *complacency*, tedy snížení kontroly nad systémem, který obvykle funguje, a automatizační zkreslení, kdy člověk dává přednost výstupu systému před vlastním pozorováním. Obojí roste s vytížením a s důvěrou v systém. Uživatel, který asistentovi svěřuje shrnutí desítek dokumentů, je přesně v situaci, kdy kontrola klesá.

Obranná doporučení proto míří spíš na uspořádání práce než na ostražitost jednotlivce. Je-li výstup asistenta podkladem pro rozhodnutí s následky, má zůstat přístupný původní zdroj a rozhodnutí má potvrzovat člověk; takové rozdělení odpovídá i obecné zásadě lidského dohledu, kterou pro rizikové systémy zakotvuje evropský akt o umělé inteligenci. U běžného uživatele je nejlepší ochranou střízlivé očekávání: asistent je nástroj na čtení, ne svědek.

## Souvislosti pro praxi

V organizacích je vhodné zacházet s AI asistenty podobně jako s novým spolupracovníkem bez prověrky: mohou číst a navrhovat, ale nesmějí samostatně odesílat, platit ani měnit záznamy bez potvrzení. Školení zaměstnanců by mělo vysvětlit, že zkreslený výstup asistenta nemusí být chybou modelu, ale stopou cizího zásahu, a že takový výstup je třeba nahlásit stejně jako podezřelý e-mail. Tím se z jednotlivé zkušenosti stává informace, která chrání celou organizaci a umožňuje zpětně dohledat, který vstup výstup ovlivnil.

## Literatura

- Greshake, K., Abdelnabi, S., Mishra, S., Endres, C., Holz, T., & Fritz, M. (2023). Not what you've signed up for: Compromising real-world LLM-integrated applications with indirect prompt injection. *Proceedings of the ACM Workshop on Artificial Intelligence and Security (AISec)*.
- Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors*.
- Nařízení Evropského parlamentu a Rady (EU) 2024/1689 o umělé inteligenci (akt o umělé inteligenci).

## Související

**Sourozenecké techniky**

- [EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md) – otrava korpusu místo jednoho vstupu.
- [EA-9.1.3 Jailbreak Cascade](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md) – obcházení pravidel modelu řetězením.
- [EA-9.1.5 LLM Narrative Injection](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md) – vložený rámec místo vloženého pokynu.

**Bezpečnostní kontext**

- [Sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – lidská obdoba téhož vzorce.
- [Reakce na incidenty](@/kompendium/organizational-defense/31-incident-response-EA.md) – organizační postup po zjištění.

**Detekce a obrana**

- [Detekční signatura: Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – vložený obsah v toku informací.
- [Sebe-obrana: Hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) – návrat od shrnutí ke zdroji.

**Pojmy**

- [Hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md) – předání výkladu nástroji jako podmínka zranitelnosti.
