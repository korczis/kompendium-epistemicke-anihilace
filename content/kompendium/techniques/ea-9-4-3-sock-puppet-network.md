+++
title = "EA-9.4.3 Sock Puppet Network"
description = "Vzorec sítě falešných identit jednoho operátora, které z různých „úhlů“ podporují tentýž narativ a vytvářejí iluzi nezávislých hlasů. Znaky, odlišení, obrana."
weight = 943

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-4", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-4-2-coordinated-inauthentic-behavior", "ea-9-4-6-mass-comment-coordination", "ea-9-2-10-AI-personhood-claim", "ea-2-1-2-pseudo-peer-mob"]
ea_code = "EA-9.4.3"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.4 Bot networks"
section_icon = "🕸️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.4.3 Sock Puppet Network

> *Subkategorie 🕸️ **9.4 Bot networks** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.4.3`
**Název:** Sock Puppet Network
**Subkategorie:** 9.4 Bot networks
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Sock puppet network* (síť „loutek“) je soubor falešných identit, které provozuje jeden operátor nebo malá skupina. Loutky mají odlišné „osobnosti“ – věk, bydliště, profesi, styl psaní – a z různých úhlů podporují tentýž narativ, chválí operátora, napadají jeho kritiky nebo vytvářejí zdání sporu, v němž „rozumná“ strana vždy vyhraje.

## 3. Mechanismus (strukturálně)

Loutky využívají toho, že čtenář přisuzuje váhu rozmanitosti hlasů: když s něčím souhlasí žena z jednoho města, muž z jiného a student, působí to jako široká shoda. Loutky také umožňují obcházet pravidla – vyhnout se zákazu, hlasovat vícekrát, obejít omezení komentářů. Na rozdíl od botů bývají loutky ručně psané a jejich odhalení vyžaduje pozornost k jemným shodám: styl, chyby, časy, sdílené znalosti. Klasickým prostředím jsou diskusní fóra, recenze, encyklopedie s otevřenou editací a komentáře pod články.

## 4. Detekční markery

- Různé účty mají shodné typografické zvyklosti, chyby a oblíbené fráze.
- Účty se nikdy neobjevují současně v živé diskusi, ale střídají se.
- Podpora pro tutéž osobu nebo produkt z účtů, které jinak nemají žádnou aktivitu.
- Účty znají detaily, které by znal jen operátor.
- Spor mezi „loutkami“ vždy skončí vítězstvím stejného názoru.

## 5. Odlišení

*Pseudonymy jednoho člověka v různých kontextech*: legitimní, pokud je nepoužívá k vzájemné podpoře nebo klamání o počtu hlasů. *[EA-9.4.2 CIB](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md)*: širší, často s automatizací a infrastrukturou. *[EA-9.2.10 AI Personhood Claim](@/kompendium/techniques/ea-9-2-10-AI-personhood-claim.md)*: jedna propracovaná syntetická persona; loutky jsou spíš levné a početné.

## 6. Dopad a rámec

Loutky zkreslují online diskuse, recenze a hlasování a mohou sloužit k obtěžování: operátor napadá cíl z mnoha účtů a vytváří dojem, že ho odsuzuje komunita. V komerčním kontextu jde o klamavé obchodní praktiky (falešné recenze); v redakčních komunitách o porušení pravidel; při obtěžování může jít o trestné jednání podle okolností.

Pro organizace a komunity je loutková kampaň i otázkou důvěry: po jejím odhalení může vzniknout podezíravost vůči každému novému hlasu, a moderátoři by proto měli komunikovat otevřeně, co se stalo a jak to bylo ověřeno, aby se neprávem nepodezírali skuteční noví členové.

## 7. Obrana a zotavení

*Moderátoři komunit*: sledovat shody v metadatech a stylu, mít pravidla proti vícenásobným účtům. *Čtenář*: nepřisuzovat váhu počtu hlasů, pokud nelze ověřit, že patří různým lidem. *Cíl obtěžování*: dokumentovat a nahlásit vzorec, ne jednotlivé účty; vyhledat podporu. *Platformy*: ověřování a omezování vícenásobných účtů při zachování práva na anonymitu.

## 8. Příklad (anonymizovaný kompozit)

V diskusi o místní škole se objeví několik „rodičů“, kteří chválí ředitele a útočí na učitelku, jež si stěžovala na šikanu vedení. Moderátorka si všimne, že účty používají stejné neobvyklé zkratky a nikdy nepíší ve stejnou hodinu. Technická kontrola ukáže sdílené připojení. Účty jsou odstraněny; učitelka dostane omluvu a diskuse se vrátí k věci.

## 9. Meze a otevřené otázky

Stylometrická podobnost není důkaz – lidé ze stejného prostředí píší podobně. Odhalení vyžaduje kombinaci znaků a opatrnost, aby nebyli obviněni skuteční lidé. Otevřenou otázkou je ochrana anonymity zranitelných lidí při potírání loutek.

Kniha neuvádí, jak rozšířené jsou loutkové účty v diskusích; spolehlivá data chybějí a odhady se liší podle prostředí. Výzkum se opírá převážně o případové studie a o technické analýzy jednotlivých komunit.

Otevřené je také, jak loutky rozpoznat v malých komunitách, kde chybějí data pro srovnání.

Od širšího koordinovaného neautentického chování se tento vzorec liší i tím, co je vůbec třeba dokázat. Tvrzení o loutkové síti je atribuční: říká, že za řadou identit stojí jeden operátor, a vyžaduje tedy důkazy spojující identity s osobou – podstatně vyšší nárok než doložení samotné koordinace. Goldman (2001) formuloval, že počet souhlasných svědectví zvyšuje jejich váhu jen tehdy, jsou-li zdroje navzájem nezávislé. Loutková síť míří přesně na tuto podmínku: nezneužívá naivitu čtenáře, nýbrž legitimní epistemické pravidlo, podle něhož se čtenář rozumně řídí. Z toho plyne i obrana – neptat se, kolik hlasů něco tvrdí, ale zda jsou na sobě nezávislé.

## 10. Pohled zevnitř a práce s postiženým

Cíl loutkové kampaně prožívá pocit, že se proti němu obrátila komunita; zjištění, že šlo o jednoho člověka, přináší úlevu i vztek. Pro komunity je odhalení loutek příležitostí obnovit důvěru – a zároveň riziko, že začnou podezírat každý nový hlas.

Pro moderátory, kteří loutky odhalí, je zátěží i následná nedůvěra v komunitě; pomáhá otevřená komunikace o postupu a jasná pravidla, která platí pro všechny stejně. Pro operátora loutek, pokud je to člen komunity, může být odhalení příležitostí ke změně, pokud komunita nabídne cestu zpět za jasných podmínek.

Kniha proto doporučuje opatrnost.

## 11. Vztah k ostatním kategoriím EA

V akademickém prostředí popisuje příbuzný vzorec [EA-2.1.2 Pseudo-peer mob](@/kompendium/techniques/ea-2-1-2-pseudo-peer-mob.md): zdánlivě nezávislí kolegové, kteří se shodují v útoku. Obtěžování z mnoha účtů souvisí s [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md).

## 12. Postup při podezření na loutkové účty

1. **Shromáždit příspěvky** podezřelých účtů s časy.
2. **Porovnat styl** – zkratky, chyby, fráze, typografii.
3. **Sledovat časování** – střídání účtů, nikdy současná přítomnost.
4. **Požádat správce** komunity o technickou kontrolu.
5. **Jednat podle pravidel** komunity a chránit cíl obtěžování.

## 13. Prevence a odolnost

Prevence stojí na pravidlech komunit proti vícenásobným účtům, na pozornosti moderátorů a na kultuře, v níž se váha hlasu neodvozuje od počtu účtů. Pro platformy je výzvou omezit loutky a zároveň chránit legitimní anonymitu zranitelných lidí.

Pro komunity je užitečné mít pravidla, která vícenásobné účty výslovně zakazují a zároveň umožňují anonymitu tam, kde chrání zranitelné lidi; správci by měli vědět, jak tyto dva požadavky vyvážit, a mít pro sporné případy jasný postup.

## 14. Otázky pro rozhovor a šetření

- Objevují se účty někdy současně v živé diskusi?
- Sdílejí neobvyklé jazykové zvyklosti?
- Znají detaily, které by měl znát jen jeden člověk?
- Mají aktivitu mimo podporu jedné osoby či názoru?
- Komu jejich činnost prospívá?

## Odborný kontext

Výzkum online diskusí dlouhodobě dokumentuje „loutkové“ účty jako způsob, jak jeden aktér vytváří dojem mnoha nezávislých hlasů. Goldman (2001) vysvětlil, proč na tom záleží: shoda více zdrojů má důkazní hodnotu jen při jejich nezávislosti. Loutky tuto podmínku porušují přímo – za mnoha jmény stojí jeden člověk. Cialdini (2001) popsal sociální důkaz jako jeden z hlavních principů vlivu; loutky ho padělají v měřítku jedné komunity.

Phillips (2015) a Marwick a Lewis (2017) ukázali, že vícenásobné účty jsou běžným nástrojem online obtěžování: operátor útočí na cíl z mnoha stran a vytváří dojem, že ho odsuzuje celé společenství. Stylometrické srovnání může loutky odhalit, ale samo o sobě není důkazem, protože lidé z téhož prostředí píší podobně; kniha proto doporučuje kombinovat jazykové, časové a technické znaky.

## Souvislosti pro praxi

Pro moderátory je užitečné mít jasný postup, kdy a jak podezření ověřit a jak informovat komunitu, aby se odhalení nezměnilo v hon na každý nový hlas. Pro instituce, jejichž zaměstnanci čelí obtěžování z mnoha účtů, je vhodné vnímat ho jako pracovní riziko a nabídnout podporu.

## Literatura

- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*.
- Marwick, A., & Lewis, R. (2017). *Media Manipulation and Disinformation Online*. Data & Society.
- Phillips, W. (2015). *This Is Why We Can't Have Nice Things*. MIT Press.

## Související

**Sourozenecké techniky**

- [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) – širší rámec.
- [EA-9.4.6 Mass Comment Coordination](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md) – zahlcení komentáři.
- [EA-9.2.10 AI Personhood Claim](@/kompendium/techniques/ea-9-2-10-AI-personhood-claim.md) – propracovaná syntetická persona.

**Kapitola 2**

- [EA-2.1.2 Pseudo-peer mob](@/kompendium/techniques/ea-2-1-2-pseudo-peer-mob.md) – zdánlivě nezávislí kolegové.

**Detekce a obrana**

- [Detekční signatura: Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – mnoho hlasů, jeden původ.
- [Sebe-obrana: Mobilizace podpory](@/kompendium/self-defense-guides/30-support-mobilization.md) – odpověď na obtěžování.
- [Psychologické bezpečí v organizaci](@/kompendium/organizational-defense/16-psychological-safety.md) – prostředí, kde lze mluvit pod vlastním jménem.
