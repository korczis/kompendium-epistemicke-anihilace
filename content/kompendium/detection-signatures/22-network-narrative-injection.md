+++
title = "Detekční signatura: Injekce narativu"
description = "Síťová signatura: nový narativ je do diskurzu vsazen přes důvěryhodné uzly tak, aby se jeho původ ztratil a šířil se dál jako spontánní, organický názor."
weight = 22

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["20-network-bot-coordination", "21-network-platform-coordination", "23-network-reputation-laundering", "24-network-deplatforming-cascade"]
toc = true
modality = "network"
+++

## Definice signatury

Injekce narativu je vsazení nového výkladového příběhu do veřejného nebo skupinového diskurzu takovým způsobem, že jeho původ zůstane skrytý a narativ se dále šíří jako by vznikl spontánně. Typicky vstupuje přes uzly s vysokou důvěryhodností – známé osobnosti, odborníky, oblíbená média, respektované členy komunity – kteří ho převezmou vědomě, za úplatu, nebo nevědomky. Odtud se rozšíří organicky.

Signatura odpovídá technikám [EA-9.4.9 Bot Narrative Injection](@/kompendium/techniques/ea-9-4-9-bot-narrative-injection.md), [EA-9.5.1 Meme Cascade Injection](@/kompendium/techniques/ea-9-5-1-meme-cascade-injection.md) a v prostředí AI systémů [EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md). V osobních vztazích má obdobu v tom, kdy zdroj vkládá do rodiny nebo týmu příběh o konkrétním člověku přes třetí osoby.

## Co signatura indikuje

Narativ je silnější než jednotlivé tvrzení: dává smysl mnoha událostem najednou a navrhuje, jak je hodnotit. Kdo dokáže vsadit narativ, ovlivňuje výklad budoucích událostí, ne jen jedné. Skrytý původ je podstatný: narativ, o němž se ví, že pochází od zainteresované strany, se posuzuje kriticky; narativ, který „všichni říkají“, se přijímá snáz.

Injekce využívá důvěru, kterou lidé chovají k uzlům svého prostředí. Když narativ vysloví oblíbený moderátor nebo respektovaný kolega, posluchač ho hodnotí podle důvěry k němu, nikoli podle původu sdělení. Tím se narativ „pere“ – souvisí to se signaturou [praní reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md).

Komunikační výzkum vysvětluje obě složky mechanismu. Fisher (1984) navrhl chápat člověka jako bytost, která hodnotí sdělení podle narativní soudržnosti a věrohodnosti, a ne jen podle logické správnosti jednotlivých tvrzení; přesvědčivý příběh proto obstojí i tam, kde by jednotlivé tvrzení neprošlo. Katz a Lazarsfeld (1955) ukázali v modelu dvoustupňového toku komunikace, že mediální sdělení se k lidem často dostávají přes názorové vůdce v jejich bezprostředním okolí, jimž věří. Hovland a Weiss (1951) doložili, že důvěryhodnost zdroje silně ovlivňuje okamžitý přesvědčovací účinek sdělení, a metaanalýza Kumkaleové a Albarracínové (2004) potvrdila tzv. efekt spáče: když se informace o původu sdělení oddělí od jeho obsahu, může vliv sdělení časem vzrůst. Skrytý původ tedy není jen okolností, ale podmínkou účinku. Rid (2020) a Bittman (1985) popsali, že vkládání příběhů přes zdánlivě nezávislé prostředníky patřilo k ustáleným postupům aktivních opatření; tato kniha je uvádí jako historicky doložený vzorec k rozpoznání, nikoli jako návod.

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

**Nové myšlenky** vstupují do diskurzu běžně a často přes vlivné osobnosti; tak se šíří vědecké objevy, umělecké směry i politické návrhy. Rozdíl oproti signatuře spočívá v transparentnosti původu a v absenci skrytých vazeb mezi původcem a těmi, kdo myšlenku šíří. Kdo nový narativ převezme a uvede, odkud ho má, nevytváří signaturu.

**Odhalení a investigativní žurnalistika** přinášejí nové narativy, které mohou zásadně změnit výklad událostí, ale opírají se o doložené zdroje a podrobují se kontrole. **Kulturní trendy** se šíří od vlivných uzlů dolů organicky a bez zadavatele; Katz a Lazarsfeld (1955) ostatně popsali vliv názorových vůdců jako běžnou součást společenského života, nikoli jako manipulaci. Konečně **osvětové kampaně** záměrně zavádějí nové rámce, například v oblasti veřejného zdraví, ale činí tak otevřeně a pod jménem zadavatele.

## Dopad na jednotlivce a klinický rozměr

U jednotlivce injekce narativu mění výklad vlastní zkušenosti: osoba začne vlastní život vysvětlovat příběhem, který převzala („všechny moje problémy způsobili…“). To může být úlevné, protože příběh dává chaosu smysl, a současně izolující, protože odděluje osobu od lidí, kteří příběh nesdílejí. McAdams (1993) popisuje životní příběh jako jádro identity, a převzatý narativ tak může zasáhnout hlouběji než jednotlivé přesvědčení.

Pokud je narativ namířen proti konkrétní osobě v rodině, na pracovišti nebo v komunitě, zažívá tato osoba ztrátu důvěry okolí, aniž by věděla proč. To je typická zkušenost cíle pomluvy; Allport a Postman (1947) popsali, jak se fáma při šíření zjednodušuje, přizpůsobuje očekáváním posluchačů a stává se tak hůře vyvratitelnou.

Při klinickém posouzení je třeba odlišit převzatý skupinový narativ od bludného systému: převzatý narativ lze dohledat ve zdrojích, které osoba sleduje, a sdílí ho s ostatními (srov. [diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md)). U osoby, která tvrdí, že o ní koluje vsazený příběh, je třeba ověřit, zda pro to existují doklady, a nebagatelizovat ji. Diagnostické závěry přísluší kvalifikovanému klinikovi.

## Riziko falešné pozitivity

Každý nový narativ, s nímž hodnotitel nesouhlasí, může působit jako „vsazený“. Tvrzení o skrytém původu je navíc samo o sobě narativem, který vysvětluje nepříjemný názor bez nutnosti se jím zabývat; hodnotitel, který ho přijme bez dokladů, opakuje vzorec, který chce odhalit.

Vazby uzlů na zájmové strany mohou být legitimní a přiznané – odborník, který spolupracuje s průmyslem a uvádí to, nevytváří signaturu. Organická popularita myšlenky může mít podobu rychlého šíření přes vlivné uzly, a samotná rychlost a vliv šiřitelů proto o injekci nevypovídají. Signaturu podporuje teprve doložená skrytá vazba a časová shoda, s níž narativ vstoupil přes více na sobě zdánlivě nezávislých uzlů.

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

Původ narativu je často nedohledatelný, a signatura pak zůstává na úrovni podezření. Historické případy, které Rid (2020) popisuje, byly odhaleny často až s odstupem let, díky archivům nebo výpovědím účastníků.

Injekce může být úspěšná právě proto, že narativ vystihuje skutečný problém. Rozpoznání původu proto neznamená vyvrácení obsahu, a obranná práce s narativem musí oddělit otázku „odkud to je“ od otázky „je to pravda“. Lewandowsky et al. (2012) navíc ukázali, že oprava dezinformace je účinnější, když nabízí alternativní vysvětlení, než když jen popírá; prosté odhalení původu nemusí převzatý narativ oslabit. Generativní umělá inteligence konečně usnadňuje vytváření variant téhož narativu a ztěžuje sledování obsahové shody; otevřenou otázkou zůstává, zda lze injekci rozpoznat podle struktury příběhu, nikoli podle jeho doslovného znění.

## Literatura

- Allport, G. W., & Postman, L. (1947). *The Psychology of Rumor*. Henry Holt.
- Bittman, L. (1985). *The KGB and Soviet Disinformation: An Insider's View*. Pergamon-Brassey's.
- Fisher, W. R. (1984). Narration as a human communication paradigm: The case of public moral argument. *Communication Monographs*, 51(1), 1–22.
- Hovland, C. I., & Weiss, W. (1951). The influence of source credibility on communication effectiveness. *Public Opinion Quarterly*, 15(4), 635–650.
- Katz, E., & Lazarsfeld, P. F. (1955). *Personal Influence: The Part Played by People in the Flow of Mass Communications*. Free Press.
- Kumkale, G. T., & Albarracín, D. (2004). The sleeper effect in persuasion: A meta-analytic review. *Psychological Bulletin*, 130(1), 143–172.
- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., & Cook, J. (2012). Misinformation and its correction: Continued influence and successful debiasing. *Psychological Science in the Public Interest*, 13(3), 106–131.
- McAdams, D. P. (1993). *The Stories We Live By: Personal Myths and the Making of the Self*. William Morrow.
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare*. Farrar, Straus and Giroux.

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

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
