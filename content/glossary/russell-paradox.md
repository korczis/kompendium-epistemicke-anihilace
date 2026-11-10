+++
title = "Russellův paradox"
weight = 100
description = "Russellův paradox množiny všech množin, které nejsou prvky sebe sama: logika, teorie typů a proč záměna úrovní slouží i jako komunikační past."

[taxonomies]
tags = ["glossary", "kompendium", "paradox", "self-reference", "philosophy"]

[extra]
category = "logic"
related_terms = ["self-reference", "liaruv-paradox", "godeluv-teorem", "double-bind", "tautologie", "zenon-paradox"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 75
ref_count_at_creation = 1
+++

## Definice

**Russellův paradox** je logický rozpor, který vzniká, připustíme-li, že ke každé dobře formulované vlastnosti existuje množina všech věcí, které ji mají. Uvažme vlastnost „není prvkem sebe sama“ a množinu *R* všech množin, které tuto vlastnost mají. Je *R* prvkem sebe sama? Pokud ano, pak vlastnost nemá, a tedy prvkem sebe sama není. Pokud ne, pak vlastnost má, a tedy prvkem sebe sama je. Obě odpovědi vedou k opaku.

Paradox ukázal, že naivní představa množiny je vnitřně sporná, a přinutil logiku zavést pravidla, která zakazují určité druhy [sebereference](@/glossary/self-reference.md) – zejména míchání úrovní, kdy výrok nebo soubor mluví o sobě samém stejným jazykem, jakým mluví o svých prvcích.

## Původ a kontext pojmu

Bertrand Russell paradox objevil v roce 1901 a v roce 1902 o něm napsal Gottlobu Fregovi, jehož *Základní zákony aritmetiky* (*Grundgesetze der Arithmetik*) stavěly na právě takovém neomezeném pojmu množiny. Frege připojil k druhému svazku (1903) dodatek, v němž uznal, že základ jeho systému byl otřesen. Řešení šla dvěma směry. Russell navrhl **teorii typů**, podle níž se objekty a výroky řadí do hierarchie a výrok o souboru patří vždy o úroveň výš než prvky souboru; teorie se stala základem díla *Principia Mathematica* (Whitehead a Russell, 1910–1913). Ernst Zermelo (1908) zvolil **axiomatickou teorii množin**, která tvorbu množin omezuje tak, aby *R* nemohla vzniknout. Populární verze – holič, který holí všechny, kdo se neholí sami – ilustruje strukturu, ale vede jen k závěru, že takový holič neexistuje.

Paradox patří do rodiny sebereferenčních paradoxů spolu s [paradoxem lháře](@/glossary/liaruv-paradox.md) a Grellingovým paradoxem a otevřel cestu k výsledkům, jako je [Gödelův teorém](@/glossary/godeluv-teorem.md).

## Jak se projevuje

Mimo matematiku se struktura Russellova paradoxu objevuje jako **záměna úrovní** v komunikaci. Pozorovatelné znaky:

- pravidlo, které mluví samo o sobě a vyvrací se („jediné pravidlo je nemít pravidla“, „pochybuj o všem, co ti říkám, kromě tohoto“);
- požadavek, jehož splnění je zároveň jeho porušením („buď spontánní“, „přestaň mě poslouchat, protože to říkám já“);
- otázky, na které obě možné odpovědi slouží jako důkaz proti tázanému („pokud souhlasíš, jsi naivní; pokud nesouhlasíš, potvrzuješ, že máš problém“);
- **pocit zmatení a zahanbení**, protože člověk nedokáže formulovat, v čem chyba spočívá, a připisuje ji sobě.

## Mechanismus

Paradox vzniká, když se výrok o pravidlech vyslovuje uvnitř týchž pravidel. Logika tento problém řeší oddělením úrovní; v lidské komunikaci takové oddělení často chybí, a záměna úrovní proto může vytvářet situace, z nichž nelze správně vystoupit. Gregory Bateson a spolupracovníci (1956) výslovně čerpali z Russellovy teorie typů při formulaci teorie [dvojné vazby](@/glossary/double-bind.md): sdělení a metasdělení si protiřečí a adresát nesmí rozpor pojmenovat ani situaci opustit.

Kompendium tento vzorec popisuje jako [Russellovu violaci typové hierarchie (EA-5.4.2)](@/kompendium/techniques/ea-5-4-2-russell-typ-violace.md) a v širším smyslu jako [reflexivní paradoxii (EA-5.1.3)](@/kompendium/techniques/ea-5-1-3-reflexivni-paradoxie.md). Strukturálně rozpoznatelné je, že paradox **není předkládán k řešení**, ale jako trvalý stav: člověk má zůstat v situaci, kde každý krok je chybný, a tím se stává závislým na tom, kdo „ví, jak to myslel“.

## Odlišení

- **Logický paradox jako předmět studia.** V matematice a filosofii je paradox podnětem k objasnění pojmů; jeho studium je legitimní a obohacující.
- **Hra a humor.** Paradoxy v literatuře, koanu nebo vtipu fungují, protože obě strany vědí, že jde o hru, a mohou z ní vystoupit.
- **Dvojná vazba.** Je komunikační vzorec ve vztahu závislosti; Russellův paradox je její logický model, ne totéž.
- **Poruchy myšlení.** Rozvolněné asociace nebo nekoherentní řeč u psychotických stavů nejsou záměrnou záměnou úrovní; odlišení viz [diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md).
- **[Tautologie](@/glossary/tautologie.md).** Je vždy pravdivá a nic neříká; paradox je sporný a vede k oběma opakům.

## Význam pro Kompendium

Russellův paradox je klíčem k celé skupině technik paradoxální metaanihilace ([kapitola 9](@/kompendium/05-ultramari-techniky/kapitola-9.md)), od [aplikace lhářova paradoxu (EA-5.4.1)](@/kompendium/techniques/ea-5-4-1-lhar-paradox-aplikace.md) po [Grellingův paradox (EA-5.4.12)](@/kompendium/techniques/ea-5-4-12-grellingova-paradox-aplikace.md). Pro kliniky a vyšetřovatele je užitečný jako vysvětlení, proč oběť nedokáže popsat, „co bylo špatně“: rozpor nebyl v obsahu sdělení, ale v jejich úrovních.

## Obrana a zotavení

- **Pojmenovat úroveň.** Rozlišit, co je sdělení a co je sdělení o sdělení: „Říkáš mi, abych ti nevěřil – mám tomu věřit?“ Samo pojmenování obvykle paradox rozpustí.
- **Vystoupit z rámce.** Paradoxní požadavek nelze splnit, lze ho odmítnout. Odmítnutí není selhání, ale správná odpověď.
- **Metakomunikace** jako dovednost ([EA-3.2.4 Metakomunikační dovednost](@/kompendium/techniques/ea-3-2-4-metacommunication-skill.md)) – mluvit o tom, jak spolu mluvíme.
- **Pro profesionála:** u klientů s anamnézou paradoxní komunikace dávat jasné, jednoúrovňové instrukce; nepoužívat paradoxní intervence, dokud není obnovena důvěra.

## Literatura

- Russell, B. (1903). *The Principles of Mathematics*.
- Russell, B. (1908). Mathematical logic as based on the theory of types. *American Journal of Mathematics*, 30.
- Whitehead, A. N., Russell, B. (1910–1913). *Principia Mathematica*.
- Bateson, G., Jackson, D. D., Haley, J., Weakland, J. (1956). Toward a theory of schizophrenia. *Behavioral Science*, 1.

## Související

**Glosář**

- [Sebereference](@/glossary/self-reference.md) – obecná struktura, z níž paradox vychází.
- [Lhářův paradox](@/glossary/liaruv-paradox.md) – sémantický příbuzný.
- [Gödelův teorém](@/glossary/godeluv-teorem.md) – sebereference jako nástroj důkazu.
- [Dvojná vazba](@/glossary/double-bind.md) – komunikační obdoba záměny úrovní.

**Techniky**

- [EA-5.4.2 Russellova violace typové hierarchie](@/kompendium/techniques/ea-5-4-2-russell-typ-violace.md) – přímé zneužití struktury.
- [EA-5.1.3 Reflexivní paradoxie](@/kompendium/techniques/ea-5-1-3-reflexivni-paradoxie.md) – paradox jako trvalý stav.
- [Kapitola 9: Paradoxální metaanihilační protokoly](@/kompendium/05-ultramari-techniky/kapitola-9.md) – kontext celé skupiny.

**Obrana**

- [EA-3.2.4 Metakomunikační dovednost](@/kompendium/techniques/ea-3-2-4-metacommunication-skill.md) – oddělení úrovní v rozhovoru.
