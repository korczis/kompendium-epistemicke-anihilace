+++
title = "Detekční signatura: Platformní koordinace"
description = "Síťová signatura: tentýž narativ se v krátkém okně objeví na více platformách se shodnými sděleními, obrazy a hesly, aniž by se kampaň přihlásila ke svému původu."
weight = 21

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["2-linguistic-circular-definitions", "20-network-bot-coordination", "22-network-narrative-injection", "23-network-reputation-laundering"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Platformní koordinace je souběžný výskyt téhož narativu na více komunikačních platformách – sociálních sítích, videoplatformách, podcastech, blozích, diskusních fórech, komunikátorech i v tradičních médiích – v krátkém časovém okně, se shodnými klíčovými sděleními, vizuálním zpracováním a hesly, a bez přiznaného společného zadavatele. Napříč platformami vzniká dojem, že totéž si „myslí všichni všude“.

Na rozdíl od [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md), která se týká sítě účtů na jedné platformě, zachycuje tato signatura **koordinaci napříč prostředími**, často s účastí skutečných lidí (influencerů, autorů, moderátorů). Technicky odpovídá [EA-2.3.6 Platform Coordinated Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) a [EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md).

## Co signatura indikuje

Lidé, kteří se setkají se stejným sdělením na různých místech, ho považují za nezávisle potvrzené. Rozdílné platformy působí jako rozdílné zdroje, i když obsah má společný původ. Koordinace navíc obchází moderaci: zásah na jedné platformě nezastaví šíření na ostatních, a smazaný obsah se vrací jako „cenzurovaný“, což mu dodá přitažlivost.

Signatura bývá spojována s informačními operacemi státních i nestátních aktérů (viz [info-ops](@/glossary/info-ops.md)), ale stejnou strukturu mají i korporátní PR útoky, organizované kampaně proti jednotlivcům a mobilizace uzavřených skupin. Bez dalších důkazů nelze z koordinace samotné určit, kdo za ní stojí.

## Pozorovatelné markery

### Obsahové a lingvistické

- Shodné formulace klíčových tvrzení, i v překladu.
- Opakující se vizuální šablony (grafika, barvy, typ písma, střih videa).
- Shodná „odhalení“ nebo „úniky“, publikované na různých místech během hodin.

### Síťové a časové

- Výskyt na několika platformách v krátkém okně, bez zjevného původního zdroje, z něhož by se šířil.
- Shodné hashtagy nebo klíčová slova vytvořená zároveň.
- Přechody mezi platformami, které neodpovídají běžnému organickému šíření (např. obsah se na velkých platformách objeví dřív než na malé, z níž údajně pochází).

### Aktérské a institucionální

- Influenceři a autoři z různých platforem publikují podobný obsah zároveň, bez označení spolupráce.
- Placené příspěvky bez označení zadavatele.
- Zapojení médií, která citují „rozruch na sítích“ jako zprávu.

## Detekční kritéria

1. Narativ se objevil na více platformách v krátkém časovém okně.
2. Obsahová shoda (formulace, vizuály, hesla) přesahuje to, co by vzniklo nezávislým převzetím.
3. Společný zdroj nebo kampaň nejsou přiznány.
4. Časový a síťový průběh neodpovídá organickému šíření z jednoho bodu.

Pozitivní při splnění bodů 1–3; bod 4 zvyšuje jistotu. Atribuci (kdo koordinuje) signatura sama neurčuje.

## Odlišení od benigních podob

- **Přiznané kampaně**: veřejné osvětové, politické nebo marketingové kampaně používají jednotné materiály otevřeně a s označením zadavatele.
- **Mediální cyklus**: velká událost vyvolá pokrytí na všech platformách, s rozdílnými formulacemi a pohledy.
- **Meme kultura**: úspěšné meme se šíří napříč platformami organicky a mění se, kdežto koordinované sdělení zůstává jednotné.
- **Tiskové zprávy**: média přebírají tiskové zprávy institucí; původ je znám.

## Dopad na jednotlivce a klinický rozměr

Jednotlivec, kterého koordinovaný narativ obklopuje ze všech stran, může ztrácet schopnost posoudit jeho pravdivost – všude, kam se podívá, najde potvrzení. Pokud je narativ namířen proti němu, prožívá útok jako všudypřítomný, bez místa, kam by se mohl stáhnout. To zvyšuje riziko úzkostných a depresivních reakcí a vyčerpání.

Klinicky je třeba odlišit doložitelnou kampaň od přesvědčení o všudypřítomném pronásledování, u něhož osoba vidí skryté zprávy i v nesouvisejícím obsahu (reklamy, pořady, náhodné poznámky). Pro rozlišení pomáhá společný přehled konkrétních výskytů s odkazy: u kampaně jsou výskyty doložitelné a obsahově shodné, u perzekučního přesvědčení jde o interpretace bez společného obsahu.

## Riziko falešné pozitivity

- Obvinění z „koordinované kampaně“ se snadno použije k diskreditaci legitimní kritiky, která se objevila na více místech proto, že je oprávněná.
- Shoda může vzniknout, protože různí autoři čerpají ze stejného veřejného zdroje.
- Algoritmy platforem doporučují podobný obsah zároveň, bez vnějšího koordinátora.

## Validační test

**Křížová časová osa.** Pro narativ se na každé platformě dohledá nejstarší výskyt a sestaví se společná časová osa. K výskytům se zapíší autoři, obsahová shoda a případné vazby. Organické šíření ukáže jeden počátek a postupné převzetí s variacemi; koordinace ukáže souběžné počátky s jednotným obsahem. Metodicky viz [EA × OSINT: Narrative Injection](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) a [EA × OSINT: Cross-Source Triangulation](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md).

## Dokumentace v praxi

Ukládat výskyty se všemi metadaty (platforma, autor, čas, URL, archivní kopie), sestavit časovou osu a zaznamenat postup vyhledávání. Pro právní účely je důležité doložit i dopad (ztráta zakázek, výhrůžky). Viz [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) a [pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md).

## Doporučený postup

**Pro čtenáře:** u sdělení, které je „všude“, hledat jeho první výskyt a původní zdroj. Viz [rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md) a [informační dieta](@/kompendium/self-defense-guides/33-information-diet.md).

**Pro osobu, která je terčem:** nevyvracet narativ na každé platformě zvlášť; zvolit jeden kanál pro věcné vyjádření, dokumentovat a hledat právní a psychologickou podporu.

**Pro organizaci:** mít monitoring napříč platformami a připravený komunikační plán ([PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md)); spolupracovat s platformami a ověřovateli faktů.

**Eskalace:** při výhrůžkách, zveřejnění osobních údajů nebo akutní krizi cíle viz [legal emergency](@/kompendium/emergency-protocols/39-legal-emergency.md) a [akutní dekompenzace](@/kompendium/emergency-protocols/1-acute-decompensation-EA.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* Výzkumnice zveřejní studii, která zpochybňuje účinnost jednoho doplňku stravy. Během dvou dnů se na několika videoplatformách, ve dvou podcastech a na diskusních fórech objeví stejné tvrzení, že „studii zaplatila konkurence“, ilustrované stejným grafem. Žádný z autorů nepřizná spolupráci. Univerzitní tiskové oddělení sestaví časovou osu a zjistí, že obsah se objevil na všech platformách během několika hodin, aniž by existoval jeden původní zdroj. Univerzita vydá věcné vyjádření o financování studie a nabídne výzkumnici právní a psychologickou podporu.

## Limity a otevřené otázky

- Koordinaci lze často doložit jen pravděpodobnostně; přímé důkazy o zadání bývají nedostupné.
- Uzavřené komunikátory a soukromé skupiny unikají pozorování.
- Rozlišit placenou spolupráci influencerů od jejich nezávislého názoru je bez přístupu ke smlouvám obtížné.

## Související

**Sourozenecké signatury**

- [Koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) – koordinace na úrovni účtů.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – vstup nového narativu do diskurzu.
- [Praní reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – přenos důvěryhodnosti mezi platformami.

**Techniky a pojmy**

- [EA-2.3.6 Platform Coordinated Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) – útok napříč platformami.
- [EA-9.5.6 Frame War Coordination](@/kompendium/techniques/ea-9-5-6-frame-war-coordination.md) – koordinovaný boj o rámec.
- [Propaganda](@/glossary/propaganda.md) – historický a teoretický kontext.

**Obrana a výuka**

- [Vzdělávací scénář: Koordinace na více cílů](@/kompendium/educational-scenarios/28-multi-target-coordination.md) – nácvik rozpoznání.
- [EA × Security: Enterprise Disinformation Defense](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – obrana organizací.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
