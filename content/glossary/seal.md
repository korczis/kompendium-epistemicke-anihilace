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

## Co pilíř vyžaduje

Podle provozní dokumentace platformy SEAL zakazuje:

- **SQL injection** – dotazy do databáze se nesmějí skládat vkládáním textu do řetězce, povoleny jsou jen parametrizované dotazy;
- **natvrdo zapsaná tajemství** – hesla, klíče a tokeny nesmějí být v kódu, berou se z proměnných prostředí;
- **vyhodnocování kódu z uživatelského vstupu** – vstup od uživatele se nesmí spouštět jako program;
- **command injection** – vstup se nesmí vkládat do příkazů operačního systému.

Obecně pilíř odkazuje na zásady projektu OWASP. Je **blokující už při commitu**: kontroly hledají například vzory tajemství v ukládaných souborech a změnu odmítnou.

## Proč takové pravidlo existuje

Uvedené chyby patří k nejčastějším a nejzávažnějším zranitelnostem webových aplikací. Mají společné jádro: systém **zaměňuje data za instrukce**. Text, který měl být jen obsahem, je vykonán jako příkaz – a kdo ovládá obsah, ovládne i systém. SEAL tuto záměnu zakazuje tam, kde k ní nejčastěji dochází.

## Vztah ke Kompendiu

Kniha SEAL nepoužívá jako svůj pojem, ale jeho princip má v jejím tématu výmluvnou obdobu, kterou je třeba číst jako **interpretační paralelu**:

- řada technik epistemické anihilace pracuje tak, že se **obsah vydává za pravidlo** – sdělení, které mělo být jedním z mnoha hlasů, začne určovat, jak se mají ostatní sdělení posuzovat (srov. [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md));
- u systémů umělé inteligence se stejný problém objevuje doslova jako *prompt injection*: text ve vstupu model přiměje jednat podle cizích instrukcí. Stránky technik skupiny EA-9, například [AI fabrikace očitého svědka](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md), proto SEAL uvádějí jako ochranu proti nepřátelským vstupům; širší kontext podává kapitola [7.7 EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md);
- širší rámec ochrany poznávacích kapacit popisuje heslo [epistemic security](@/glossary/epistemic-security.md).

## Meze přenosu

SEAL je technické pravidlo pro kód. Lidské poznávání nemůže „zakázat“ vstupy, které by ho mohly změnit – otevřenost novým informacím je jeho podmínkou. Obrana proti manipulaci proto nespočívá v uzavření, ale v rozlišování: kdo mluví, s jakou autoritou a podle jakých pravidel se sdělení posuzuje.

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
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
