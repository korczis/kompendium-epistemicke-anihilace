+++
title = "Detekční signatura: Injekce narativu"
description = "Síťová signatura: nový narativ je do diskurzu vsazen přes důvěryhodné uzly tak, aby se jeho původ ztratil a šířil se dál jako spontánní, organický názor."
weight = 22

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["20-network-bot-coordination", "21-network-platform-coordination", "23-network-reputation-laundering", "24-network-deplatforming-cascade"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Injekce narativu je vsazení nového výkladového příběhu do veřejného nebo skupinového diskurzu takovým způsobem, že jeho původ zůstane skrytý a narativ se dále šíří jako by vznikl spontánně. Typicky vstupuje přes uzly s vysokou důvěryhodností – známé osobnosti, odborníky, oblíbená média, respektované členy komunity – kteří ho převezmou vědomě, za úplatu, nebo nevědomky. Odtud se rozšíří organicky.

Signatura odpovídá technikám [EA-9.4.9 Bot Narrative Injection](@/kompendium/techniques/ea-9-4-9-bot-narrative-injection.md), [EA-9.5.1 Meme Cascade Injection](@/kompendium/techniques/ea-9-5-1-meme-cascade-injection.md) a v prostředí AI systémů [EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md). V osobních vztazích má obdobu v tom, kdy zdroj vkládá do rodiny nebo týmu příběh o konkrétním člověku přes třetí osoby.

## Co signatura indikuje

Narativ je silnější než jednotlivé tvrzení: dává smysl mnoha událostem najednou a navrhuje, jak je hodnotit. Kdo dokáže vsadit narativ, ovlivňuje výklad budoucích událostí, ne jen jedné. Skrytý původ je podstatný: narativ, o němž se ví, že pochází od zainteresované strany, se posuzuje kriticky; narativ, který „všichni říkají“, se přijímá snáz.

Injekce využívá důvěru, kterou lidé chovají k uzlům svého prostředí. Když narativ vysloví oblíbený moderátor nebo respektovaný kolega, posluchač ho hodnotí podle důvěry k němu, nikoli podle původu sdělení. Tím se narativ „pere“ – souvisí to se signaturou [praní reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md).

## Pozorovatelné markery

### Obsahové a lingvistické

- Nový výraz, slogan nebo rámec se náhle objeví u více uzlů a nahradí dřívější slovník.
- Narativ je jednoduchý, emočně silný a vysvětluje mnoho věcí najednou („za vším je…“).
- Původní zdroj je uváděn vágně („začíná se mluvit o tom, že…“, „lidé si všímají…“).

### Síťové a časové

- Narativ se nejprve objeví u několika uzlů s vysokým dosahem nebo důvěrou, teprve pak u běžných uživatelů.
- V komunitě, kde dosud nebyl, se objeví během krátké doby.
- Jeho šíření předchází nebo provází koordinovaná amplifikace (viz [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md)).

### Aktérské a institucionální

- Uzly, které narativ zavedly, mají nepřiznané vazby na zainteresovanou stranu (financování, spolupráci).
- Narativ se opakovaně vrací v době, kdy se rozhoduje o věci, které se týká.
- V organizaci se o člověku začne vyprávět příběh, jehož původ nikdo nedokáže určit, ale všichni ho slyšeli od „důvěryhodného kolegy“.

## Detekční kritéria

1. Narativ je v daném prostředí nový a jeho výskyt má identifikovatelný začátek.
2. Rané šíření probíhá přes uzly s vysokou důvěrou nebo dosahem, nikoli zdola.
3. Původ narativu je zastřený nebo nepřiznaný.
4. Narativ slouží zájmu identifikovatelné strany.

Pozitivní při splnění bodů 1–3; bod 4 posiluje signaturu, ale je nutné ho doložit, ne jen předpokládat.

## Odlišení od benigních podob

- **Nové myšlenky** vstupují do diskurzu běžně a často přes vlivné osobnosti; rozdíl je v transparentnosti původu a v absenci skrytých vazeb.
- **Odhalení a investigativní žurnalistika** přinášejí nové narativy s doloženými zdroji.
- **Kulturní trendy** se šíří od vlivných uzlů dolů organicky a bez zadavatele.
- **Osvětové kampaně** záměrně zavádějí nové rámce (např. veřejné zdraví), ale otevřeně.

## Dopad na jednotlivce a klinický rozměr

U jednotlivce injekce narativu mění výklad vlastní zkušenosti: osoba začne vlastní život vysvětlovat příběhem, který převzala („všechny moje problémy způsobili…“). To může být úlevné a současně izolující. Pokud je narativ namířen proti konkrétní osobě (v rodině, na pracovišti, v komunitě), zažívá tato osoba ztrátu důvěry okolí, aniž by věděla proč – to je typická zkušenost cíle pomluvy.

Při klinickém posouzení je třeba odlišit převzatý skupinový narativ od bludného systému: převzatý narativ lze dohledat ve zdrojích, které osoba sleduje, a sdílí ho s ostatními (srov. [diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md)). U osoby, která tvrdí, že o ní koluje vsazený příběh, je třeba ověřit, zda pro to existují doklady, a nebagatelizovat ji.

## Riziko falešné pozitivity

- Každý nový narativ, s nímž hodnotitel nesouhlasí, může působit jako „vsazený“.
- Vazby uzlů na zájmové strany mohou být legitimní a přiznané.
- Organická popularita myšlenky může mít podobu rychlého šíření přes vlivné uzly.

## Validační test

**Rekonstrukce trajektorie.** Narativ se dohledá zpět k prvním výskytům: kdo ho vyslovil, kdy, s jakým zdrojem a s jakými vazbami. Následně se porovná pořadí výskytů (shora dolů, nebo zdola nahoru) a obsahová shoda raných výskytů. U organizačních narativů o osobě lze s jejím souhlasem a v rámci [interního vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) zjistit, od koho kdo příběh slyšel.

## Dokumentace v praxi

Zachytit rané výskyty s metadaty a vazbami uzlů; uchovat zdroje, na které se narativ odvolává; zapsat postup rekonstrukce. U pomluvy v organizaci zaznamenat výpovědi o tom, kdy a od koho kdo příběh slyšel, s ohledem na ochranu svědků.

## Doporučený postup

**Pro čtenáře:** u narativu, který náhle „všichni říkají“, se ptát, kdo ho řekl první a proč. Viz [správa narativu](@/kompendium/self-defense-guides/41-narrative-stewardship.md) a [verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md).

**Pro osobu, o níž narativ koluje:** dokumentovat, kde a od koho se o něm dozvěděla, opřít se o lidi, kteří ji znají, a zvážit právní pomoc (viz [pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)).

**Pro profesionála a organizaci:** u citlivých témat sledovat vznik nových narativů a jejich původ; v redakcích ověřovat vazby zdrojů; v týmech pojmenovat pomluvu jako problém procesu, ne jen vztahů.

**Eskalace:** pokud narativ vede k výhrůžkám nebo k akutní krizi cíle, viz [legal emergency](@/kompendium/emergency-protocols/39-legal-emergency.md) a [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* V diskusní skupině rodičů se během týdne rozšíří přesvědčení, že nový školní program je „ideologický experiment“. Rekonstrukce ukáže, že výraz poprvé použili tři populární profily v jeden den, všechny s odkazem na tentýž web bez uvedeného autora, a teprve poté ho převzali rodiče. Web je financován organizací, která nabízí konkurenční vzdělávací program. Ředitel školy nevede spor o slova, ale zveřejní obsah programu a pozve rodiče na otevřenou hodinu.

## Limity a otevřené otázky

- Původ narativu je často nedohledatelný; signatura pak zůstává na úrovni podezření.
- Injekce může být úspěšná právě proto, že narativ vystihuje skutečný problém – rozpoznání původu neznamená vyvrácení obsahu.
- Generativní AI usnadňuje vytváření variant téhož narativu a ztěžuje sledování obsahové shody.

## Související

**Sourozenecké signatury**

- [Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – šíření napříč prostředími.
- [Fragmentace narativu](@/kompendium/detection-signatures/6-linguistic-narrative-fragmentation.md) – rozbitý příběh, do něhož se vsazuje nový.
- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – prostředí bez korektivu.

**Techniky a pojmy**

- [EA-9.4.9 Bot Narrative Injection](@/kompendium/techniques/ea-9-4-9-bot-narrative-injection.md) – injekce s pomocí sítí účtů.
- [EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md) – injekce do znalostních zdrojů AI.
- [Metanarrative Collapse](@/glossary/metanarrative-collapse.md) – rozpad velkých příběhů, který injekci usnadňuje.

**Obrana a výuka**

- [Vzdělávací scénář: Injekce narativu](@/kompendium/educational-scenarios/15-narrative-injection.md) – nácvik rozpoznání.
- [EA × OSINT: Narrative Injection Attacks](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – metodika pro vyšetřovatele.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
