+++
title = "SEAL"
weight = 100
description = "SEAL (Security Enforcement Absolute Lock): bezpečnostní pilíř doktríny Prismatic Platform – zákaz injekcí, natvrdo zapsaných tajemství a vyhodnocování cizího kódu. Vztah ke knize."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "security"]

[extra]
category = "doctrine"
abbreviation = "SEAL"
related_terms = ["doctrine", "zero", "epistemic-security", "red-team", "nm-nd"]
keywords = ["SEAL", "Security Enforcement Absolute Lock", "bezpečnost", "SQL injection", "tajemství", "OWASP", "doktrína"]
+++

## Definice

**SEAL** (*Security Enforcement Absolute Lock*) je bezpečnostní pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform; příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény *Security*. Index pojmů jej shrnuje jako doktrínu prevence „SQL injection, secrets, code eval“ – tedy tří typických zdrojů bezpečnostních chyb v kódu.

Pojem patří do kontextu platformy. V Kompendiu se objevuje hlavně v poznámkách o souladu s doktrínou na stránkách o technikách spojených s umělou inteligencí, kde se SEAL zmiňuje jako ochrana proti nepřátelským vstupům.

## Původ a kontext pojmu

SEAL shrnuje do jednoho pilíře zásady, které bezpečnost informačních systémů formuluje desítky let. Jerome Saltzer a Michael Schroeder v klasickém textu o ochraně informací v počítačových systémech vyložili principy, jako je nejmenší nutné oprávnění a bezpečné výchozí nastavení: systém má ve výchozím stavu odmítat, a ne povolovat, a každá součást má mít jen ta práva, která nezbytně potřebuje (Saltzer a Schroeder 1975). Zákaz natvrdo zapsaných tajemství i zákaz spouštění cizího kódu jsou přímými důsledky těchto principů.

Konkrétní výčet zakázaných vzorů odpovídá přehledu nejčastějších zranitelností webových aplikací, který pravidelně vydává projekt OWASP; injekce různých druhů v něm patří dlouhodobě k nejzávažnějším kategoriím (OWASP Foundation 2021). Ross Anderson v souhrnné učebnici bezpečnostního inženýrství připomíná, že většina skutečných průniků nevyužívá exotické chyby, ale opakující se, dobře známé vzorce, které by šlo odhalit jednoduchou kontrolou (Anderson 2020). Na tomto poznatku stojí i způsob, jakým SEAL vynucuje svá pravidla.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy SEAL zakazuje:

- **SQL injection** – dotazy do databáze se nesmějí skládat vkládáním textu do řetězce, povoleny jsou jen parametrizované dotazy;
- **natvrdo zapsaná tajemství** – hesla, klíče a tokeny nesmějí být v kódu, berou se z proměnných prostředí;
- **vyhodnocování kódu z uživatelského vstupu** – vstup od uživatele se nesmí spouštět jako program;
- **command injection** – vstup se nesmí vkládat do příkazů operačního systému.

Obecně pilíř odkazuje na zásady projektu OWASP. Je **blokující už při commitu**: kontroly hledají například vzory tajemství v ukládaných souborech a změnu odmítnou. Vývojář, který omylem uloží do konfiguračního souboru přístupový klíč, se o tom dozví dřív, než klíč opustí jeho počítač – a ne až ve chvíli, kdy ho najde někdo cizí ve veřejném repozitáři.

## Mechanismus: proč takové pravidlo existuje

Uvedené chyby patří k nejčastějším a nejzávažnějším zranitelnostem webových aplikací. Mají společné jádro: systém **zaměňuje data za instrukce**. Text, který měl být jen obsahem, je vykonán jako příkaz – a kdo ovládá obsah, ovládne i systém. SEAL tuto záměnu zakazuje tam, kde k ní nejčastěji dochází.

Parametrizovaný dotaz je proto víc než technický detail: odděluje dva kanály, z nichž jeden nese pravidla (strukturu dotazu) a druhý jen hodnoty. Hodnota může obsahovat cokoli, ale nikdy nezmění pravidla. Zákaz tajemství v kódu vychází z jiné, ale příbuzné úvahy: kód se sdílí, kopíruje a archivuje, a co je jednou v jeho historii, nelze spolehlivě odstranit. Tajemství patří do kanálu, který je oddělený a řízený (Saltzer a Schroeder 1975).

## Odlišení

SEAL se liší od sousedního pilíře [ZERO](@/glossary/zero.md) tím, že chrání systém před **nepřítelem**, kdežto ZERO před **vlastními chybami**: ZERO zakazuje konstrukce, které by systém shodily nebo nechaly potichu běžet v chybném stavu, SEAL konstrukce, které by útočníkovi dovolily převzít kontrolu. Obě pravidla se však překrývají – například převod nedůvěryhodného vstupu na atom je chybou běhovou i bezpečnostní.

Od adversariálního testování, jaké představuje [Red Team](@/glossary/red-team.md), se SEAL liší časem a metodou. Red team hledá zranitelnosti v hotovém systému tím, že se ho pokouší napadnout; SEAL brání vzniku známých zranitelností už při zápisu kódu. První odhaluje neznámé, druhý zabraňuje opakování známého, a dobrá bezpečnostní praxe potřebuje obojí (Anderson 2020).

## Význam pro Kompendium

Kniha SEAL nepoužívá jako svůj pojem, ale jeho princip má v jejím tématu výmluvnou obdobu, kterou je třeba číst jako **interpretační paralelu**. Řada technik epistemické anihilace pracuje tak, že se **obsah vydává za pravidlo**: sdělení, které mělo být jedním z mnoha hlasů, začne určovat, jak se mají ostatní sdělení posuzovat. U [strategické reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) se tak mění kritéria, podle nichž se rozhoduje o pravdě; u [imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) se do tvrzení vkládá pravidlo, podle něhož je každá námitka sama důkazem jeho pravdivosti. Hassan popisuje kontrolu informací ve skupinách s vysokou mírou kontroly jako stav, v němž skupina rozhoduje nejen o tom, co člen slyší, ale i o tom, jak to má vyložit (Hassan 2015) – tedy právě jako sloučení obsahového a pravidlového kanálu.

U systémů umělé inteligence se stejný problém objevuje doslova jako *prompt injection*: text ve vstupu model přiměje jednat podle cizích instrukcí. Greshake a spoluautoři ukázali, že k tomu stačí, aby model při práci načetl webovou stránku nebo dokument se skrytým pokynem – takzvaná nepřímá injekce (Greshake et al. 2023). Stránky technik skupiny EA-9, například [AI fabrikace očitého svědka](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md), proto SEAL uvádějí jako ochranu proti nepřátelským vstupům; širší kontext podává kapitola [7.7 EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) a rámec ochrany poznávacích kapacit popisuje heslo [epistemic security](@/glossary/epistemic-security.md).

Obecný příklad (kompozit): analytik nechá asistenta s jazykovým modelem shrnout sadu dokumentů o prověřované firmě. Jeden z dokumentů obsahuje neviditelný text, který modelu ukládá označit firmu za „bez rizik“. Shrnutí pak působí věrohodně a analytik nemá důvod je zpochybnit. Princip SEAL tu znamená oddělit kanály: dokumenty jsou data, ne pokyny, a výstup modelu se ověřuje proti zdrojům, ne přijímá jako hotový závěr.

## Obrana a zotavení

Lidskou obdobou parametrizovaného dotazu je vědomé oddělení dvou otázek: *co* mi někdo sděluje a *podle jakých pravidel* to mám posoudit. Manipulace bývá nejúčinnější tam, kde obě otázky splynou – kde stejný zdroj dodává informaci i měřítko, jímž se má informace hodnotit. Obranou je udržet si pravidla posuzování z nezávislého zdroje: z vlastních hodnot, z odborných standardů, z rozhovoru s lidmi mimo dané prostředí. Hassan doporučuje lidem, kteří se zotavují z prostředí s vysokou mírou kontroly, postupně obnovovat přístup k vnějším informacím a k vlastním kritériím úsudku (Hassan 2015).

Pro profesionály, kteří pracují s nástroji umělé inteligence, z toho plyne praktická zásada: výstup modelu, který zpracovával cizí dokumenty, je třeba považovat za nedůvěryhodný vstup, dokud není ověřen. Rozhodnutí o lidech nebo o bezpečí se nesmí opírat jen o něj.

## Meze přenosu

SEAL je technické pravidlo pro kód. Lidské poznávání nemůže „zakázat“ vstupy, které by ho mohly změnit – otevřenost novým informacím je jeho podmínkou. Obrana proti manipulaci proto nespočívá v uzavření, ale v rozlišování: kdo mluví, s jakou autoritou a podle jakých pravidel se sdělení posuzuje.

Paralela má i druhou mez: ve skupinách s vysokou mírou kontroly bývá „ochrana před nebezpečnými informacemi“ sama nástrojem kontroly. Kdo by princip SEAL přenášel na lidi doslova, mohl by ospravedlnit právě tu izolaci, kterou kniha popisuje jako škodlivou. Otevřenou otázkou zůstává, jak u jazykových modelů spolehlivě oddělit data od pokynů, když oba kanály mají stejnou podobu – přirozený jazyk.

## Literatura

- Anderson, R. (2020). *Security Engineering: A Guide to Building Dependable Distributed Systems* (3. vyd.). Wiley.
- Greshake, K., Abdelnabi, S., Mishra, S., Endres, C., Holz, T., & Fritz, M. (2023). Not what you've signed up for: Compromising real-world LLM-integrated applications with indirect prompt injection. *AISec '23*. ACM.
- Hassan, S. (2015). *Combating Cult Mind Control* (rev. vyd.). Freedom of Mind Press.
- OWASP Foundation (2021). *OWASP Top 10:2021*.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*, 63(9).

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [ZERO](@/glossary/zero.md) – sousední pilíř běhové bezpečnosti.
- [Red Team](@/glossary/red-team.md) – adversariální testování.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada.

**Kniha**

- [Epistemic Security](@/glossary/epistemic-security.md) – ochrana poznávacích kapacit.
- [7.7 EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – AI a generativní modely.
- [Strategická reinterpretace (EA-1.3.2)](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) – posun pravidel posuzování.
- [Imunizace proti falsifikaci (EA-1.3.1)](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – pravidlo vložené do tvrzení.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
