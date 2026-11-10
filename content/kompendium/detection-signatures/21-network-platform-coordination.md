+++
title = "Detekční signatura: Platformní koordinace"
description = "Síťová signatura: tentýž narativ se v krátkém okně objeví na více platformách se shodnými sděleními, obrazy a hesly, aniž by se kampaň přihlásila ke svému původu."
weight = 21

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["2-linguistic-circular-definitions", "20-network-bot-coordination", "22-network-narrative-injection", "23-network-reputation-laundering"]
toc = true
modality = "network"
+++

## Definice signatury

Platformní koordinace je souběžný výskyt téhož narativu na více komunikačních platformách – sociálních sítích, videoplatformách, podcastech, blozích, diskusních fórech, komunikátorech i v tradičních médiích – v krátkém časovém okně, se shodnými klíčovými sděleními, vizuálním zpracováním a hesly, a bez přiznaného společného zadavatele. Napříč platformami vzniká dojem, že totéž si „myslí všichni všude“.

Na rozdíl od [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md), která se týká sítě účtů na jedné platformě, zachycuje tato signatura **koordinaci napříč prostředími**, často s účastí skutečných lidí (influencerů, autorů, moderátorů). Technicky odpovídá [EA-2.3.6 Platform Coordinated Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) a [EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md).

## Co signatura indikuje

Lidé, kteří se setkají se stejným sdělením na různých místech, ho považují za nezávisle potvrzené. Rozdílné platformy působí jako rozdílné zdroje, i když obsah má společný původ. Koordinace navíc obchází moderaci: zásah na jedné platformě nezastaví šíření na ostatních, a smazaný obsah se vrací jako „cenzurovaný“, což mu dodá přitažlivost.

Signatura bývá spojována s informačními operacemi státních i nestátních aktérů (viz [info-ops](@/glossary/info-ops.md)), ale stejnou strukturu mají i korporátní PR útoky, organizované kampaně proti jednotlivcům a mobilizace uzavřených skupin. Bez dalších důkazů nelze z koordinace samotné určit, kdo za ní stojí.

Epistemologicky jde o zneužití téhož předpokladu nezávislosti, který Goldman (2001) formuloval pro hodnocení svědectví: shoda více zdrojů zvyšuje oprávnění jen tehdy, když zdroje nejsou ozvěnou jednoho původce. Rozdílnost platforem tento předpoklad zakrývá, protože vytváří vnější znaky nezávislosti – jiný formát, jiného mluvčího, jiné publikum. Starbird, Arif a Wilson (2019) ukázali, že dezinformační kampaně jsou často **kolaborativní práce**, v níž se k řízenému jádru připojují skuteční lidé, kteří obsah dále přetvářejí a šíří z vlastního přesvědčení; právě proto je hranice mezi koordinací a organickým šířením neostrá. Benkler, Faris a Roberts (2018) popsali, jak se v propojeném mediálním ekosystému tvrzení přesouvají mezi okrajovými weby, sociálními sítěmi a velkými médii, a Marwick a Lewis (2017) zmapovali, jak online subkultury cíleně „hackují“ pozornost tradičních médií. Návrat smazaného obsahu jako „cenzurovaného“ odpovídá jevu, který Jansen a Martin (2015) popsali jako zpětný účinek cenzury.

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

**Přiznané kampaně** – veřejné osvětové, politické nebo marketingové – používají jednotné materiály napříč platformami otevřeně a s označením zadavatele. Jednotnost obsahu zde není podezřelá, protože původ je znám a publikum může váhu sdělení správně odhadnout.

**Mediální cyklus** vyvolá při velké události pokrytí na všech platformách, ale s rozdílnými formulacemi, pohledy a zdroji. Rozmanitost zpracování je zde znakem nezávislosti, zatímco shodná hesla a vizuály v krátkém okně ukazují spíše na společné zadání. Podobně **meme kultura** šíří úspěšné obsahy napříč platformami organicky; Shifman (2014) však zdůrazňuje, že internetové meme se při šíření proměňuje a vytváří varianty, kdežto koordinované sdělení zůstává jednotné. Konečně **tiskové zprávy** institucí přebírají média běžně a jejich původ je znám; shoda textu zde vyplývá z otevřeně uvedeného společného zdroje.

## Dopad na jednotlivce a klinický rozměr

Jednotlivec, kterého koordinovaný narativ obklopuje ze všech stran, může ztrácet schopnost posoudit jeho pravdivost, protože všude, kam se podívá, najde potvrzení. Opakované setkání s týmž sdělením navíc samo zvyšuje jeho hodnocenou pravdivost, jak ukazuje výzkum efektu iluzorní pravdy. Pokud je narativ namířen proti němu, prožívá útok jako všudypřítomný, bez místa, kam by se mohl stáhnout. To zvyšuje riziko úzkostných a depresivních reakcí a vyčerpání a může vést ke stažení z veřejného i profesního života.

Klinicky je třeba odlišit doložitelnou kampaň od přesvědčení o všudypřítomném pronásledování, u něhož osoba vidí skryté zprávy i v nesouvisejícím obsahu, jako jsou reklamy, pořady nebo náhodné poznámky. Pro rozlišení pomáhá společný přehled konkrétních výskytů s odkazy: u kampaně jsou výskyty doložitelné a obsahově shodné, u perzekučního přesvědčení jde o interpretace bez společného obsahu. Obě situace se mohou kombinovat, a klinické posouzení přísluší kvalifikovanému odborníkovi poté, co byla fakta ověřena.

## Riziko falešné pozitivity

Obvinění z „koordinované kampaně“ se snadno použije k diskreditaci legitimní kritiky, která se objevila na více místech proto, že je oprávněná. Mnoho lidí může nezávisle dojít ke stejnému závěru, když je podnět dostatečně zřejmý, a hodnotitel, který v souběžnosti vidí automaticky koordinaci, se stává nástrojem toho, kdo se chce kritice vyhnout.

Shoda formulací může vzniknout i tím, že různí autoři čerpají ze stejného veřejného zdroje, například z tiskové konference nebo z jednoho virálního příspěvku. Algoritmy platforem navíc doporučují podobný obsah zároveň a mohou vytvářet souběžnost bez vnějšího koordinátora. Signatura proto vyžaduje, aby byla vyloučena tato vysvětlení, a pracuje s kombinací časové, obsahové a vizuální shody, nikoli s jedním z těchto znaků.

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

Koordinaci lze často doložit jen pravděpodobnostně, protože přímé důkazy o zadání – smlouvy, interní komunikace, platby – bývají nedostupné. Rid (2020) v historii aktivních opatření ukazuje, že i u dobře zdokumentovaných operací se jejich rozsah a původ často odhalí až s velkým zpožděním a díky archivům nebo únikům.

Uzavřené komunikátory a soukromé skupiny unikají pozorování, a značná část koordinace tak zůstává neviditelná. Rozlišit placenou spolupráci influencerů od jejich nezávislého názoru je bez přístupu ke smlouvám obtížné, i když některé právní řády ukládají povinnost označovat reklamní obsah. Otevřenou otázkou zůstává, jak detekovat koordinaci, jejíž účastníci jsou skuteční lidé s upřímným přesvědčením a jejichž „zadání“ má podobu sdílené ideologie, nikoli objednávky.

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network Propaganda: Manipulation, Disinformation, and Radicalization in American Politics*. Oxford University Press.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*, 63(1), 85–110.
- Jansen, S. C., & Martin, B. (2015). The Streisand effect and censorship backfire. *International Journal of Communication*, 9, 656–671.
- Marwick, A., & Lewis, R. (2017). *Media Manipulation and Disinformation Online*. Data & Society Research Institute.
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare*. Farrar, Straus and Giroux.
- Shifman, L. (2014). *Memes in Digital Culture*. MIT Press.
- Starbird, K., Arif, A., & Wilson, T. (2019). Disinformation as collaborative work: Surfacing the participatory nature of strategic information operations. *Proceedings of the ACM on Human-Computer Interaction*, 3(CSCW), 127.

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
