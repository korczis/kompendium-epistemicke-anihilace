+++
title = "Detekční signatura: Koordinace botů"
description = "Síťová signatura: skupina automatizovaných nebo řízených účtů jedná synchronně a jednotně, aby vytvořila dojem spontánního zájmu či nesouhlasu mnoha lidí."
weight = 20

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["19-network-amplification-asymmetry", "2-linguistic-circular-definitions", "21-network-platform-coordination", "22-network-narrative-injection"]
toc = true
modality = "network"
+++

## Definice signatury

Koordinace botů je pozorovatelná souhra mezi účty, které jsou plně či částečně automatizované nebo centrálně řízené (včetně tzv. *sock puppets*, falešných identit ovládaných lidmi). Účty sdílejí obsah ve stejném čase, se shodnými formulacemi, reagují na tytéž podněty a vytvářejí dojem, že jde o mnoho nezávislých hlasů. Platformy tento typ jednání označují jako „koordinované neautentické chování“ (*coordinated inauthentic behavior*), viz [EA-9.4.2](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md).

Signatura je jedním z hlavních technických zdrojů [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md). Rodinu souvisejících technik tvoří [EA-9.4.3 Sock Puppet Network](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md), [EA-9.4.5 Troll Farm EA](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md) a [EA-9.4.6 Mass Comment Coordination](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md).

## Co signatura indikuje

Neautentická síť simuluje to, co lidé považují za důležitý signál: že mnoho různých lidí nezávisle došlo k podobnému názoru. Simulace funguje na dvou úrovních. U lidí vytváří sociální důkaz a tlak na konformitu, nebo naopak pocit, že vlastní názor je menšinový. U algoritmů vytváří metriky aktivity, které obsah posunou do doporučení a tím ho vystaví skutečným uživatelům.

Epistemicky je podstatné, že koordinace botů **znehodnocuje celý kanál**: když uživatelé vědí, že část hlasů je falešná, přestávají věřit i hlasům skutečným. Tento „efekt kontaminace“ může být sám cílem – nejde o přesvědčení, ale o to, aby lidé přestali věřit čemukoli (srov. [firehose of falsehood](@/glossary/firehose-of-falsehood.md)).

Výzkum sociálních botů tento obraz podrobně dokumentuje. Ferrara et al. (2016) popsali, jak automatizované účty napodobují lidské chování, ovlivňují diskusi a mohou zkreslovat vnímanou popularitu názorů i osob; zároveň upozornili, že rozlišit pokročilé boty od lidí je stále obtížnější. Cresci (2020) v přehledu desetiletí výzkumu detekce ukázal, že se pozornost přesouvá od jednotlivých účtů k **chování skupin**, protože koordinace zanechává stopy, které jednotlivý účet skrýt nedokáže. Keller et al. (2020) na případu politického astroturfingu doložili, že i kampaně řízené lidmi, nikoli programy, lze rozpoznat podle společných časových vzorců a sdíleného obsahu, které vyplývají z centrálního řízení. Woolley a Howard (2018) zařazují tyto jevy do širšího rámce výpočetní propagandy. Efekt kontaminace kanálu má blízko k tomu, co Chesney a Citron (2019) nazvali „dividendou lháře“: jakmile je známo, že falešný obsah existuje, lze zpochybnit i obsah pravý.

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

**Legitimní automatizace** je běžnou součástí digitálního prostředí: zpravodajské, servisní a meteorologické účty automaticky publikují obsah, ale činí tak otevřeně a pod vlastní identitou. Automatizace sama proto signaturou není; je jí teprve zastírání automatizace a předstírání mnoha nezávislých lidí.

**Organizované kampaně** neziskových organizací, odborů nebo fanoušků vyzývají ke sdílení textu, a výsledkem mohou být stovky shodných příspěvků ve stejném čase. Účastníci jsou však skuteční lidé, vystupují pod svou identitou a koordinace je veřejně známá. Zde je nutné pečlivé odlišení, protože časová a obsahová shoda je stejná jako u neautentické sítě; rozhoduje autenticita účtů a otevřenost výzvy.

**Přirozená synchronizace** vzniká při živých událostech, jako jsou sportovní utkání, volby nebo přírodní katastrofy, kdy reagují tisíce lidí současně. Konečně **noví uživatelé** mohou přicházet ve vlně po mediální události, a stáří účtu tak samo o sobě o koordinaci nevypovídá.

## Dopad na jednotlivce a klinický rozměr

Člověk vystavený neautentické vlně – komentářům, zprávám nebo výhrůžkám – prožívá ohrožení jako skutečné, i když ho působí několik operátorů. Typické jsou úzkost, hypervigilance, poruchy spánku, vyhýbání se sítím a pocit, že „všichni jsou proti mně“. Profesionál by měl tuto zkušenost validovat a nesnižovat ji tím, že „jsou to jen boti“: psychický dopad nezávisí na tom, kolik skutečných lidí za útokem stojí, ale na tom, jak ho osoba prožívá.

Zároveň je třeba citlivě rozlišit situace, kdy osoba přesvědčení o koordinovaném útoku rozšiřuje na lidi ve svém okolí, na skryté zprávy v médiích nebo na technická zařízení bez doložitelných stop. Takový obraz může ukazovat na perzekuční přesvědčení a vyžaduje klinické posouzení kvalifikovaným odborníkem (srov. [psychotický zlom po EA](@/kompendium/emergency-protocols/3-psychotic-break-EA.md)). Rozlišovacím nástrojem jsou data: koordinace zanechává stopy, které lze nezávisle ověřit, a ověření by mělo předcházet jakémukoli klinickému závěru. Obě situace se navíc mohou kombinovat, protože skutečný útok může zhoršit existující zranitelnost.

## Riziko falešné pozitivity

Označení nesouhlasu za „boty“ je běžnou diskreditační strategií a samo je formou epistemické manipulace. Kdo tvrdí, že jeho kritici nejsou skuteční lidé, nemusí se zabývat obsahem jejich kritiky. Hodnotitel by proto měl obvinění z koordinace posuzovat stejně přísně jako koordinaci samotnou a požadovat k němu data.

Detekční nástroje mají nezanedbatelnou chybovost. Skuteční uživatelé s neobvyklým chováním – noční pracovníci, lidé s jazykovou bariérou, kteří používají překladač, nebo velmi aktivní nadšenci – mohou být chybně označeni, a Cresci (2020) upozorňuje, že výkon detektorů se mezi datovými soubory a obdobími výrazně liší. Konečně vygenerované profilové fotografie, generická jména nebo nové účty nejsou samy důkazem; mnoho lidí chrání své soukromí právě tím, že na sítích vystupuje anonymně.

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

Atribuce, tedy určení, kdo síť řídí, bývá bez přístupu k datům platforem nemožná. Veřejně dostupná data mohou ukázat koordinaci, ale ne jejího původce, a závěry o státních nebo komerčních aktérech proto vyžadují zdroje, které hodnotitel obvykle nemá.

Generativní umělá inteligence zvyšuje věrohodnost falešných účtů a snižuje účinnost obsahových markerů, jako jsou opakované formulace nebo jazykové chyby (srov. [EA-9.4.4 AI Bot Personhood](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md)). Detekce se tak bude dál přesouvat k síťovým a časovým vzorcům. Detekce je vždy pravděpodobnostní a závěr „tohle je bot“ u jednotlivého účtu je obvykle neodůvodněný; spolehlivější je tvrzení o síti jako celku. Otevřenou otázkou zůstává, jak tyto pravděpodobnostní závěry srozumitelně sdělit veřejnosti, aniž by přispěly k obecné nedůvěře, kterou koordinace sama vytváří.

## Literatura

- Chesney, R., & Citron, D. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*, 107(6), 1753–1820.
- Cresci, S. (2020). A decade of social bot detection. *Communications of the ACM*, 63(10), 72–83.
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The rise of social bots. *Communications of the ACM*, 59(7), 96–104.
- Keller, F. B., Schoch, D., Stier, S., & Yang, J. (2020). Political astroturfing on Twitter: How to coordinate a disinformation campaign. *Political Communication*, 37(2), 256–280.
- Paul, C., & Matthews, M. (2016). *The Russian „Firehose of Falsehood“ Propaganda Model: Why It Might Work and Options to Counter It*. RAND Corporation.
- Woolley, S. C., & Howard, P. N. (Eds.). (2018). *Computational Propaganda: Political Parties, Politicians, and Political Manipulation on Social Media*. Oxford University Press.

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
