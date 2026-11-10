+++
title = "Doctrine"
weight = 100
description = "Doktrína Prismatic Platform: soustava pojmenovaných pilířů (NMND, NWB, NCLB, TACH, ZERO, SEAL…), které řídí vývoj platformy. Struktura, vynucování a vztah ke Kompendiu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "architecture"]

[extra]
category = "doctrine"
related_terms = ["nm-nd", "nclb", "nwb", "tach", "zero", "seal", "aiad"]
keywords = ["doctrine", "doktrína", "pilíře", "Prismatic Platform", "NMND", "vynucování", "kvalita"]
+++

## Definice

**Doctrine** (doktrína) je v kontextu Prismatic Platform, softwarové platformy, z níž Kompendium vzešlo, souhrnné označení pro **soustavu pojmenovaných pravidel – pilířů –**, které určují, jak se na platformě vyvíjí, testuje a dokumentuje. Každý pilíř má krátkou zkratku, vymezenou doménu a způsob vynucení. Index pojmů doktrínu shrnuje jako „18-pillar enforcement systém platformy“ a příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) uvádí osmnáct pilířů.

Počet pilířů se mezi verzemi platformy měnil: příloha knihy uvádí osmnáct, referenční modul vynucovacích protokolů platformy devatenáct a novější verze provozní dokumentace platformy vyjmenovávají dalších několik. Číslo je proto třeba chápat jako údaj z doby zápisu, ne jako pevnou vlastnost doktríny.

Doktrína **není součástí taxonomie epistemické anihilace**. Kniha ji zmiňuje proto, že vznikla v prostředí platformy a řada jejích stránek se na pilíře odvolává.

## Původ a kontext pojmu

Slovo „doktrína“ si platforma vypůjčila z vojenského a organizačního slovníku, kde označuje soubor zásad, podle nichž se jedná, když není čas na dlouhou poradu. V softwarovém inženýrství se podobným souborům obvykle říká *coding standards* nebo *engineering policies*; platforma zvolila silnější slovo, protože pilíře nejsou doporučením, ale pravidly, která za vývojáře kontroluje stroj.

Jednotlivé pilíře přebírají osvědčené postupy oboru: konvenční formát zpráv commitů ([GITL](@/glossary/gitl.md)), povinné testy v duchu vývoje řízeného testy ([TACH](@/glossary/tach.md); Beck 2002), zásady bezpečného kódu podle projektu OWASP ([SEAL](@/glossary/seal.md); OWASP Foundation 2021), strukturované zpracování chyb ([ZERO](@/glossary/zero.md)), dohledatelnost tvrzení v dokumentaci ([NCLB](@/glossary/nclb.md)). Nové je hlavně jejich **pojmenování a sevření do jednoho systému**, který se ověřuje automaticky. Podrobné specifikace jednotlivých pilířů platforma uchovává jako soubory zásad (*policy files*) a ke každému pilíři nabízí vlastní ověřovací příkaz.

## Pilíře

Přehled pilířů, jak je uvádí příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md), s odkazy na hesla, která je vysvětlují:

| Pilíř | Doména | Heslo |
|-------|--------|-------|
| **3NL** | architektura | [3NL](@/glossary/three-nested-loops.md) |
| **NMND** | disciplína provedení | [Doktrína NM/ND](@/glossary/nm-nd.md) |
| **NWB** | trvalost řešení | [NWB](@/glossary/nwb.md) |
| **FLLM** | čistota stylů UI | [FLLM](@/glossary/fllm.md) |
| **M5M** | granulární práce | [M5M](@/glossary/m5m.md) |
| **NCLB** | doložitelnost tvrzení | [NCLB](@/glossary/nclb.md) |
| **TACH** | testování | [TACH](@/glossary/tach.md) |
| **ZERO** | běhová bezpečnost | [ZERO](@/glossary/zero.md) |
| **SEAL** | bezpečnost | [SEAL](@/glossary/seal.md) |
| **GITL** | dohledatelnost změn | [GITL](@/glossary/gitl.md) |
| **KNOW** | pokrytí znalostí | [KNOW](@/glossary/know.md) |

Dalšími pilíři jsou PERF (výkon), DEPS (závislosti), DOCS (dokumentace), OTEL (telemetrie), RDME (README v každé aplikaci), NLLB (žádný nefunkční odkaz) a HYGIENE (čistota repozitáře).

## Jak se projevuje

Podle provozní dokumentace platformy se pilíře liší silou vynucení:

- **blokující při commitu** – změna, která pilíř poruší, se vůbec nezapíše (mj. NMND, TACH, ZERO, SEAL, PERF, DEPS, RDME, HYGIENE);
- **blokující v CI** – změna se zapíše, ale nesloučí (mj. NCLB, FLLM, GITL, NWB, DOCS, OTEL, NLLB);
- **poradní** – kontrola jen upozorní (mj. M5M, KNOW);
- **bez vynucovacího modulu** – 3NL slouží jako architektonická zásada.

Zastřešující zásadou je [Doktrína NM/ND](@/glossary/nm-nd.md) („[No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md)“): žádná nedokončená práce, žádné obcházení kontrol, rozhodování opřené o důkazy. Vynucení a obcházení řeší i platformní pojmy [Violation Protocol](@/glossary/violation-protocol.md), [Clean Run](@/glossary/clean-run.md) a [Trinity Gate](@/glossary/trinity-gate.md).

V každodenní práci je doktrína vidět jako řada automatických kontrol: háčky před zápisem změny (*pre-commit hooks*) odmítnou commit bez testů nebo s natvrdo zapsaným tajemstvím, kontroly v CI zastaví sloučení změny s neověřeným tvrzením v dokumentaci a definice agentů podle standardu [AIAD](@/glossary/aiad.md) nesou povinný blok, který říká, jak se na agenta pilíře vztahují. Obcházení kontrol (například přepínačem, který háčky vypne) doktrína výslovně zakazuje.

## Mechanismus

Proč systém pojmenovaných pilířů funguje lépe než obecná výzva „pišme kvalitní kód“, lze popsat ve třech bodech:

1. **Pojmenování** – krátká zkratka dělá z abstraktní hodnoty konkrétní pravidlo, na které se dá odkázat v revizi i ve zprávě o chybě.
2. **Vynucení strojem** – pravidlo, které hlídá automatická kontrola, neztrácí platnost s únavou, termínem ani autoritou toho, kdo změnu navrhuje.
3. **Odstupňování** – ne každé pravidlo je stejně důležité; rozdělení na blokující a poradní pilíře brání tomu, aby se přísnost stala šumem, který se naučí všichni ignorovat.

Slabinou téhož mechanismu je, že kontrola měří jen to, co měřit umí. Pilíř může být formálně splněn a přitom minout svůj smysl (test, který nic neověřuje; odkaz na úkol, který nic nevysvětluje). Doktrína proto počítá s lidskou revizí a s měřením, které se postupně zpřísňuje.

Obecný příklad: vývojář opraví chybu v modulu, který počítá skóre rizika, a chce změnu rychle zapsat. Háček TACH ji odmítne, protože k opravě chybí [regresní test](@/glossary/regression-test.md); po jeho doplnění změna projde, ale v CI ji zastaví NCLB, protože dokumentace modulu uvádí natvrdo zapsaný počet kontrol, který už neplatí. Nikdo z účastníků nemusel nic „hlídat“ – a přesto se do systému nedostala ani neověřená oprava, ani zastaralé tvrzení.

## Odlišení

Doktrínu platformy je nejprve třeba odlišit od ideologie. Doktrína je soubor ověřitelných technických pravidel: dá se změnit, když se ukáže jako chybná, a její dodržování kontroluje stroj podle zveřejněných kritérií. Ideologie naproti tomu vykládá svět jako celek a pravidla, podle nichž se dá zpochybnit, sama neposkytuje.

Ještě důležitější je odlišení od toho, co Robert Lifton nazval „doktrína nad člověkem“ (*doctrine over person*). Lifton tímto kritériem popsal prostředí [myšlenkové reformy](@/glossary/thought-reform.md), v němž skupina učí členy, že když se jejich prožitek neshoduje s učením, mýlí se prožitek, a člověk se tak musí přizpůsobit doktríně místo toho, aby doktrína odpovídala zkušenosti (Lifton 1961). Doktrína platformy se týká kódu, ne lidí, a nesmí se tak používat. Shoda slova je náhodná, ale je důvodem, proč kniha hranici výslovně vyznačuje: pravidla, která pro software dávají smysl právě svou neústupností, by v zacházení s lidmi reprodukovala vzorec, který kniha popisuje jako škodlivý.

Konečně je třeba odlišit doktrínu platformy od [Doktrinálního rámce](@/kompendium/02-doktrinalni-ramec/_index.md) knihy. Doktrinální rámec popisuje zásady, jimiž se řídí kniha samotná; doktrína platformy je jeho technickým předchůdcem, ne obsahem.

## Význam pro Kompendium

Kniha z doktríny převzala **několik zásad jako redakční pravidla**, nikoli jako obsah:

- z [NCLB](@/glossary/nclb.md) požadavek, aby žádné tvrzení nezůstalo bez ověřitelné opory;
- z [NWB](@/glossary/nwb.md) a NMND požadavek, aby stránka byla úplná, ne zástupný text;
- z NLLB a [KNOW](@/glossary/know.md) požadavek, aby každý odkaz vedl na existující stránku a každý pojem měl své heslo – to dnes hlídají kontroly repozitáře knihy.

Jak kniha s platformou souvisí, popisuje [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) a [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md).

Mechanismus doktríny – pojmenovat pravidlo, vynutit ho strojem a nechat lidi rozhodovat o výjimkách – se v repozitáři knihy opakuje: sestavení webu odhalí každý nefunkční odkaz, brána informační architektury hlídá metadata a rozsah stránek a její výchozí stav se smí jen zlepšovat. Pro čtenáře to znamená, že tvrzení knihy o sobě samé („každý pojem má heslo“) jsou kontrolovatelná, ne deklarativní.

## Meze přenosu

Doktrína je soubor pravidel pro vývoj softwaru a jeho slovník (nulová tolerance, žádná cesta zpět, absolutní zámek) je záměrně přísný. Pro práci s lidmi se nehodí: klinická, terapeutická a forenzní praxe stojí na úsudku, na kontextu, na možnosti změnit názor a na respektu k tempu člověka. Kompendium proto pilíře používá jen jako nárok na vlastní kvalitu – nikdy jako model zacházení s lidmi, o nichž píše. Tuto mez výslovně formuluje i heslo [Doktrína NM/ND](@/glossary/nm-nd.md) v oddílu o přenosu na lidské prostředí.

Otevřenou otázkou zůstává, jak velkou část kvality lze vůbec převést na automatické kontroly. Zkušenost s doktrínou ukazuje, že kontroly spolehlivě chytají opomenutí a hrubé chyby, ale o tom, zda je text pravdivý a srozumitelný nebo zda je kód správně navržený, rozhoduje stále člověk.

## Literatura

- Beck, K. (2002). *Test-Driven Development: By Example*. Addison-Wesley.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. W. W. Norton – zdroj kritéria *doctrine over person*, od něhož je třeba doktrínu platformy odlišit.
- OWASP Foundation (2021). *OWASP Top 10:2021*.

## Související

**Platforma**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada.
- [NCLB](@/glossary/nclb.md) – pilíř s největším významem pro knihu.
- [AIAD](@/glossary/aiad.md) – standard definic agentů s povinným blokem vynucení doktríny.
- [Violation Protocol](@/glossary/violation-protocol.md) – postup při porušení.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému doktrína předchází.

**Kniha**

- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – souvislosti.
- [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md) – zásady knihy.
- [Thought reform](@/glossary/thought-reform.md) – proč je „doktrína nad člověkem“ varovným znakem.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – terminologický rejstřík.
