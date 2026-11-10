+++
title = "EA-9.2.1 Deepfake Personality"
description = "Vzorec, v němž syntetické video a hlas skutečné osoby „mluví“ jejím jménem a šíří sdělení, které nikdy neřekla. Znaky deepfaku, odlišení, právní rámec a obrana."
weight = 921

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-2", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-2-2-voice-cloning-EA", "ea-9-2-5-video-manipulation-EA", "ea-9-2-8-AI-eyewitness-fabrication"]
parent = "kompendium-techniques"
ea_code = "EA-9.2.1"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.2 Generativní média"
section_icon = "🎬"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.2.1 Deepfake Personality

> *Subkategorie 🎬 **9.2 Generativní média** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.2.1`
**Název:** [Deepfake](@/glossary/deepfake.md) Personality
**Subkategorie:** 9.2 Generativní média
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Deepfake personality* je syntetická audiovizuální podoba skutečné osoby – obličej, mimika a hlas – vytvořená generativními modely tak, aby osoba v záznamu pronášela sdělení, které nikdy neřekla: přiznání, urážku, výzvu, slib. Na rozdíl od satiry se záznam vydává za autentický a jeho cílem je změnit, co si publikum o osobě nebo o události myslí. Obecný pojem rozebírá heslo [deepfake](@/glossary/deepfake.md).

## 3. Mechanismus (strukturálně)

Vzorec využívá důvěru, kterou lidé tradičně vkládají do obrazu a hlasu („viděl jsem to na vlastní oči“). Video se šíří rychleji než jakékoli ověření a první dojem přetrvá i po vyvrácení. Druhým účinkem je tzv. „dividenda lháře“: jakmile je veřejnost s deepfaky obeznámená, může kdokoli zpochybnit i pravý záznam tvrzením, že jde o podvrh. Vzorec tak poškozuje jak konkrétní osobu, tak obecnou použitelnost audiovizuálního důkazu. Strukturálně jde o zfalšování svědectví, nikoli jen o lež: falešný záznam se tváří jako stopa události samé.

## 4. Detekční markery

- Záznam se objevuje bez známého původce a první sdílení vede k anonymním nebo novým účtům.
- Obsah je pro danou osobu nečekaný a přichází v citlivý okamžik (volby, soudní spor, krize).
- Technické nesrovnalosti: nepřirozené mrkání, rozmazané okraje obličeje, nesoulad rtů a zvuku, nepřirozené stíny.
- K záznamu chybí kontext – kde a kdy vznikl, kdo byl přítomen, existuje-li delší verze.
- Osoba nebo její okolí autenticitu popírá a nabízí ověřitelné alibi (jiné místo, jiný čas).

## 5. Odlišení

*Satira a parodie*: zjevně označené, nepředstírají autenticitu. *[EA-9.2.5 Video Manipulation EA](@/kompendium/techniques/ea-9-2-5-video-manipulation-EA.md)*: úprava dílčích prvků pravého videa; deepfake vytváří projev osoby jako celek. *Vytržení z kontextu*: pravý záznam s zavádějícím popiskem; řeší se kontextem, ne forenzní analýzou obrazu.

## 6. Dopad a rámec

Pro zobrazenou osobu jde o zásah do pověsti, soukromí a důstojnosti; zvlášť závažné jsou sexuální deepfaky, které nesou rysy sexuálního obtěžování a mají těžké psychické následky. Právně se uplatní ochrana osobnosti a podle okolností trestné činy jako pomluva, vydírání nebo podvod; v Evropské unii se k tomu přidávají povinnosti označovat syntetický obsah. Pro důkazní řízení to znamená vyšší nároky na původ a [řetězec opatrování důkazu](@/glossary/chain-of-custody.md).

## 7. Obrana a zotavení

*Postižená osoba*: zajistit kopie a odkazy s časem, nahlásit obsah platformám, rychle a věcně veřejně popřít a nabídnout ověřitelné údaje; vyhledat právní pomoc. *Média*: nezveřejňovat záznam bez ověření původu; při zpravování o deepfaku neukazovat jeho nejpůsobivější část. *Instituce a firmy*: mít připravený postup komunikace pro případ podvrhu vedení ([Obrana narativu v PR](@/kompendium/organizational-defense/34-PR-narrative-defense.md)). *Platformy*: podporovat standardy původu obsahu (např. C2PA) a viditelné označení syntetického obsahu.

## 8. Příklad (anonymizovaný kompozit)

Dva dny před komunálními volbami se objeví video, v němž kandidátka údajně zesměšňuje své voliče. Video má nízké rozlišení, je bez zdroje a šíří se v místních skupinách. Kandidátka zveřejní záznam celé akce, na níž měla údajně mluvit, a místní redakce nechá video posoudit; analýza najde nesoulad rtů a zvuku. Oprava se rozšíří, ale část voličů si pamatuje jen původní video.

## 9. Meze a otevřené otázky

Technické znaky deepfaků se s vývojem modelů ztrácejí a detekční nástroje mají omezenou spolehlivost; žádný nástroj nedává jistotu. Proto roste význam původu záznamu a kontextu oproti analýze obrazu samého. Otevřenou otázkou je, jak chránit autenticitu pravých záznamů před „dividendou lháře“.

## 10. Pohled zevnitř a práce s postiženým

Osoba zobrazená v deepfaku prožívá bezmoc a ztrátu kontroly nad vlastní tváří a hlasem; reakce připomínají reakce na jiné formy narušení hranic. Kromě právní a komunikační pomoci potřebuje i psychologickou podporu a ujištění, že její okolí rozumí, co se stalo. Terapeut by měl počítat s opakovanou retraumatizací, kdykoli se obsah znovu objeví.

## 11. Vztah k ostatním kategoriím EA

Tentýž jev popisuje z hlediska [delegitimizace](@/glossary/delegitimizace.md) osoby [EA-2.3.7 Deepfake Personalní](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) v subkategorii mediální delegitimizace; tato stránka se soustředí na technologický nosič a na důkazní hodnotu záznamu. S [EA-2.3.1 Clip Takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md) sdílí cíl – vytvořit z jednoho záznamu nálepku –, liší se tím, že záznam neexistoval.

## 12. Postup při podezření na deepfake

1. **Zajistit stopu:** uložit záznam, odkazy, čas a účty, které ho šíří; nesdílet ho dál.
2. **Ověřit původ:** dohledat první zveřejnění, delší verzi a kontext; kontaktovat zobrazenou osobu nebo její zástupce.
3. **Posoudit technicky:** požádat o forenzní posouzení odborníka; výsledky nástrojů brát jako pravděpodobnost, ne jako jistotu.
4. **Reagovat komunikačně:** věcné popření s ověřitelnými údaji, jedním kanálem a rychle.
5. **Podpořit postiženého:** právní kroky, nahlášení platformám, psychologická pomoc.

## Odborný kontext

Chesney a Citron (2019) v první systematické právní analýze deepfaků popsali dvojí riziko: přímou škodu – falešné video poškodí konkrétního člověka nebo ovlivní volby – a nepřímou škodu, kterou nazvali „dividendou lháře“. Jakmile veřejnost ví, že videa lze věrohodně padělat, může každý, kdo byl zachycen na skutečném záznamu, prohlásit, že jde o podvrh. Deepfaky tak neohrožují jen pravdivost jednotlivých záznamů, ale důkazní hodnotu audiovizuálního materiálu jako celku.

Empirický výzkum ukazuje, že účinek nemusí spočívat v přesvědčení. Vaccari a Chadwick (2020) v experimentu s politickým deepfakem zjistili, že video diváky častěji nepřesvědčilo, ale zvýšilo jejich nejistotu, a nejistota pak snižovala důvěru ve zprávy na sociálních sítích obecně. Nightingale a Farid (2022) doložili, že lidé nedokážou spolehlivě odlišit generované tváře od skutečných a generované tváře dokonce hodnotili jako důvěryhodnější. Spoléhat na „poznám to na první pohled“ je proto chybné.

Pro forenzní a klinickou praxi z toho plyne posun od otázky „vypadá to pravě?“ k otázce „odkud záznam pochází a co ho potvrzuje?“. Farid (2016) v příručce obrazové forenziky zdůrazňuje, že technická analýza je jen jednou z cest a že kontext, původ a nezávislé záznamy mají často větší váhu.

## Souvislosti pro praxi

Organizace, jejichž představitelé jsou veřejně známí, by měly mít připravený postup pro případ deepfaku: kdo rozhodne o reakci, jaké ověřitelné údaje lze rychle zveřejnit (kalendář, záznamy, svědci) a jak kontaktovat platformy. Pro terapeuty je důležité vědět, že zejména sexuální deepfaky mají dopad srovnatelný s jinými formami sexuálního obtěžování a že postižení se často stydí vyhledat pomoc. Pro školy je téma součástí prevence kyberšikany, protože deepfaky spolužáků se objevují i mezi dospívajícími.

## Literatura

- Chesney, R., & Citron, D. K. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*.
- Farid, H. (2016). *Photo Forensics*. MIT Press.
- Nightingale, S. J., & Farid, H. (2022). AI-synthesized faces are indistinguishable from real faces and more trustworthy. *PNAS*.
- Vaccari, C., & Chadwick, A. (2020). Deepfakes and disinformation: Exploring the impact of synthetic political video on deception, uncertainty, and trust in news. *Social Media + Society*.

## Související

**Sourozenecké techniky**

- [EA-9.2.2 Voice Cloning EA](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md) – hlasová složka téhož vzorce.
- [EA-9.2.5 Video Manipulation EA](@/kompendium/techniques/ea-9-2-5-video-manipulation-EA.md) – dílčí úprava pravého videa.
- [EA-9.2.8 AI Eyewitness Fabrication](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md) – smyšlená událost místo smyšleného projevu.

**Pojmy**

- [Deepfake](@/glossary/deepfake.md) – obecné heslo.
- [Řetězec opatrování důkazu](@/glossary/chain-of-custody.md) – proč rozhoduje původ záznamu.

**Obrana a právo**

- [Sebe-obrana: Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – co lze rozpoznat a co ne.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – zajištění a posouzení záznamu.
- [Pomluva a EA](@/kompendium/forensic-legal/14-defamation-EA.md) – právní cesty postižené osoby.
