+++
title = "Detekční signatura: Koordinace botů"
description = "Síťová signatura: skupina automatizovaných nebo řízených účtů jedná synchronně a jednotně, aby vytvořila dojem spontánního zájmu či nesouhlasu mnoha lidí."
weight = 20

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["19-network-amplification-asymmetry", "2-linguistic-circular-definitions", "21-network-platform-coordination", "22-network-narrative-injection"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Koordinace botů je pozorovatelná souhra mezi účty, které jsou plně či částečně automatizované nebo centrálně řízené (včetně tzv. *sock puppets*, falešných identit ovládaných lidmi). Účty sdílejí obsah ve stejném čase, se shodnými formulacemi, reagují na tytéž podněty a vytvářejí dojem, že jde o mnoho nezávislých hlasů. Platformy tento typ jednání označují jako „koordinované neautentické chování“ (*coordinated inauthentic behavior*), viz [EA-9.4.2](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md).

Signatura je jedním z hlavních technických zdrojů [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md). Rodinu souvisejících technik tvoří [EA-9.4.3 Sock Puppet Network](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md), [EA-9.4.5 Troll Farm EA](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md) a [EA-9.4.6 Mass Comment Coordination](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md).

## Co signatura indikuje

Neautentická síť simuluje to, co lidé považují za důležitý signál: že mnoho různých lidí nezávisle došlo k podobnému názoru. Simulace funguje na dvou úrovních. U lidí vytváří sociální důkaz a tlak na konformitu, nebo naopak pocit, že vlastní názor je menšinový. U algoritmů vytváří metriky aktivity, které obsah posunou do doporučení a tím ho vystaví skutečným uživatelům.

Epistemicky je podstatné, že koordinace botů **znehodnocuje celý kanál**: když uživatelé vědí, že část hlasů je falešná, přestávají věřit i hlasům skutečným. Tento „efekt kontaminace“ může být sám cílem – nejde o přesvědčení, ale o to, aby lidé přestali věřit čemukoli (srov. [firehose of falsehood](@/glossary/firehose-of-falsehood.md)).

## Pozorovatelné markery

### Obsahové a lingvistické

- Shodné nebo téměř shodné texty, překlepy a hashtagy u mnoha účtů.
- Generické profily: obecná jména, převzaté nebo vygenerované fotografie, prázdné biografie.
- Obsah bez osobních detailů a bez reakcí na kontext konverzace.

### Síťové a časové

- Synchronní aktivita: mnoho účtů publikuje nebo sdílí v rozmezí sekund až minut.
- Nepřirozený denní rytmus (aktivita nepřetržitě, nebo v hodinách neodpovídajících deklarované lokalitě).
- Účty vytvořené v krátkém období, s podobnou historií a vzájemným sledováním.
- Účty se aktivují vždy u stejných témat nebo stejných cílů.

### Aktérské a institucionální

- Síť účtů se po zrušení rychle obnovuje pod novými jmény.
- Účty přecházejí mezi tématy podle zájmu téhož aktéra.
- Zapojení do [hromadného nahlašování](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md) proti určitým osobám.

## Detekční kritéria

1. Skupina účtů vykazuje časovou synchronizaci aktivity, která přesahuje náhodnou shodu.
2. Obsahová podobnost (texty, média, hashtagy) je vyšší, než odpovídá nezávislým autorům.
3. Účty mají znaky neautenticity (stáří, profil, rytmus, absence osobní interakce).

Pozitivní při splnění alespoň dvou kritérií u dostatečného vzorku účtů. Jediný podezřelý účet signaturu nezakládá; jde o vlastnost sítě, ne jednotlivce.

## Odlišení od benigních podob

- **Legitimní automatizace**: zpravodajské a servisní účty automaticky publikují obsah, otevřeně a pod vlastní identitou.
- **Organizované kampaně**: neziskové organizace, odbory nebo fanoušci vyzývají ke sdílení textu; účastníci jsou skuteční lidé a vystupují pod svou identitou.
- **Přirozená synchronizace**: živé události (sportovní utkání, volby) vyvolají současnou reakci tisíců lidí.
- **Noví uživatelé**: vlna nových účtů může vzniknout po mediální události, aniž by šlo o koordinaci.

## Dopad na jednotlivce a klinický rozměr

Člověk vystavený neautentické vlně (komentáře, zprávy, výhrůžky) prožívá ohrožení jako skutečné, i když ho působí několik operátorů. Typické jsou úzkost, hypervigilance, poruchy spánku, vyhýbání se sítím a pocit, že „všichni jsou proti mně“. Profesionál by měl tuto zkušenost validovat a nesnižovat ji tím, že „jsou to jen boti“.

Zároveň je třeba citlivě rozlišit situace, kdy osoba přesvědčení o koordinovaném útoku rozšiřuje na lidi ve svém okolí, na skryté zprávy v médiích nebo na technická zařízení bez doložitelných stop. Takový obraz může ukazovat na perzekuční přesvědčení a vyžaduje klinické posouzení (srov. [psychotický zlom po EA](@/kompendium/emergency-protocols/3-psychotic-break-EA.md)). Rozlišovacím nástrojem jsou data: koordinace zanechává stopy, které lze nezávisle ověřit.

## Riziko falešné pozitivity

- Označení nesouhlasu za „boty“ je běžnou diskreditační strategií a samo je formou epistemické manipulace.
- Detekční nástroje mají chybovost; skuteční uživatelé s neobvyklým chováním (noční pracovníci, lidé s jazykovou bariérou) mohou být chybně označeni.
- Vygenerované profilové fotografie nebo generická jména nejsou samy důkazem.

## Validační test

**Analýza vzorku sítě.** Z účtů zapojených do vlny se vybere vzorek a u každého se posoudí: datum vzniku, historie aktivity, profil, rytmus, vztahy s ostatními účty a obsahová podobnost. Výsledky se porovnají s náhodným vzorkem účtů, které se k tématu vyjadřují mimo vlnu. Statisticky významný rozdíl v synchronizaci a podobnosti podporuje signaturu. Postup a nástroje viz [EA × OSINT: Bot Detection](@/kompendium/cross-domain/6-ea-osint-bot-detection.md).

## Dokumentace v praxi

Archivovat obsah s metadaty (čas, ID účtu, URL), uchovat surová data a zaznamenat postup výběru vzorku a použité nástroje. Vlastní analýzu oddělit od surových dat, aby ji bylo možné přezkoumat. U forenzního použití dodržet [chain of custody](@/glossary/chain-of-custody.md); u výzkumu etické zásady práce s daty uživatelů.

## Doporučený postup

**Pro čtenáře:** při náhlé vlně jednotných reakcí zpomalit a podívat se na profily účtů. Viz [detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md).

**Pro osobu, která je terčem:** dokumentovat, nahlásit platformě jako koordinované chování, omezit expozici a nechat si pomoci s monitoringem od druhé osoby. Výhrůžky hlásit policii.

**Pro profesionála a organizaci:** zavést monitoring, který rozliší organickou kritiku od koordinace, a připravit krizovou komunikaci (viz [reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md)).

**Eskalace:** akutní úzkost, panika nebo sebevražedné myšlenky u cíle kampaně vyžadují postup podle [panické ataky](@/kompendium/emergency-protocols/6-panic-attack-EA.md) nebo [akutního suicidálního rizika](@/kompendium/emergency-protocols/2-suicide-risk-EA.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* Malý spolek zveřejní kritickou zprávu o hospodaření místní firmy. Během noci pod příspěvkem přibudou stovky komentářů obviňujících spolek z lží, mnohé s totožnými formulacemi a vložené v rozmezí několika minut. Dobrovolník spolku vybere vzorek účtů: většina vznikla během posledního měsíce, nemá přátele z regionu a kromě tohoto tématu nepublikuje nic. Spolek data archivuje, nahlásí síť platformě a ve veřejném vyjádření popíše, co zjistil, bez obviňování konkrétního zadavatele, kterého nelze doložit.

## Limity a otevřené otázky

- Atribuce – kdo síť řídí – bývá bez přístupu k datům platforem nemožná.
- Generativní AI zvyšuje věrohodnost falešných účtů a snižuje účinnost obsahových markerů (srov. [EA-9.4.4 AI Bot Personhood](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md)).
- Detekce je vždy pravděpodobnostní; závěr „tohle je bot“ u jednotlivého účtu je obvykle neodůvodněný.

## Související

**Sourozenecké signatury**

- [Asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) – výsledný nepoměr dosahu.
- [Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – koordinace napříč platformami.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – co sítě účtů často šíří.

**Techniky a pojmy**

- [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) – obecný rámec.
- [EA-9.4.3 Sock Puppet Network](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md) – falešné identity řízené lidmi.
- [Info-Ops](@/glossary/info-ops.md) – informační operace jako širší kontext.

**Obrana a výuka**

- [Vzdělávací scénář: Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – nácvik rozpoznání.
- [EA × OSINT: Bot Detection](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – metodika.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
