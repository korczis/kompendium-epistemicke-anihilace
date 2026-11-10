+++
title = "Vzdělávací scénář: Detekce deepfake"
date = 2026-04-26
description = "Tři videa veřejné osobnosti, z toho dvě syntetická: technické artefakty, kontextové ověření a původ záznamu – a proč samotný „pohled na video“ nestačí."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "intermediate", "deepfake"]

[extra]
level = "Intermediate"
type = "educational-scenario"
+++

# Vzdělávací scénář: Detekce deepfake

> **Úroveň**: Intermediate
> **Učební cíl**: Rozpoznat syntetická média technicky i kontextuálně a vědět, kde jsou meze obou přístupů
> **Doporučená délka**: 120 minut
> **Pro koho**: novináři, ověřovatelé faktů, bezpečnostní týmy, právníci pracující s elektronickými důkazy, učitelé

[Deepfake](@/glossary/deepfake.md) – syntetické nebo upravené video, zvuk či obraz, které věrohodně
zobrazuje osobu, jak říká nebo dělá něco, co neřekla ani neudělala – mění epistemickou situaci dvojím
způsobem. Za prvé umožňuje vyrobit zdánlivý „důkaz“, za druhé umožňuje zpochybnit skutečný důkaz
tvrzením, že je podvržený; tento druhý efekt se v literatuře nazývá *liar's dividend*, dividenda
lháře, a je pokládán za společensky nebezpečnější než jednotlivá falešná videa, protože nahlodává
důvěru ke všem záznamům (Chesney & Citron, 2019). Scénář proto netrénuje jen hledání vad v obraze,
nýbrž celý postup ověření a zvlášť to, jak se zachovat, když jistota není dosažitelná.

## Učební cíle a jejich zdůvodnění

Cvičení směřuje k tomu, aby účastník popsal typy technických artefaktů syntetických médií a vysvětlil,
proč rychle zastarávají, aby provedl kontextové ověření (původ záznamu, první zveřejnění, souvislost
s doloženými událostmi, nezávislé záznamy téže situace) a aby posoudil metadata a údaje o původu
obsahu i jejich meze. Důraz na kontext místo na obraz vychází z poznatku, že schopnost rozpoznat
syntézu pouhým pohledem je omezená a klesá s každou generací generátorů, zatímco kontextové ověření
zůstává robustní; běžní diváci navíc syntetická videa spolehlivě neodhalí a jejich jistota přitom
neklesá (Vaccari & Chadwick, 2020). Dalším cílem je formulovat závěr ve stupních jistoty („ověřeno“,
„neověřeno“, „pravděpodobně upraveno“) místo binárního „pravé/falešné“ a rozpoznat opačnou chybu –
odmítnutí autentického záznamu.

## Scénář

Ověřovací tým regionální redakce dostane během dopoledne tři videa s fiktivním primátorem, všechna
kolující na sociálních sítích, a musí rozhodnout, zda o nich informovat. Video A, dlouhé čtyřicet
vteřin, zachycuje primátora na tiskové konferenci, jak oznamuje zdražení jízdného; záznam je ostrý,
osvětlení konzistentní a v pozadí je logo města. Video B, dlouhé dvacet pět vteřin, ukazuje primátora
v kanceláři, jak „přiznává“ úplatek; kvalita je nižší, pohyb rtů občas nesedí se slovy, světlo na
tváři se mírně liší od světla na stěně a zdrojem je účet bez historie. Video C, dlouhé šedesát vteřin,
zachycuje primátora na venkovní akci, jak pronáší urážlivý výrok o části obyvatel; je technicky bez
zjevných vad a kolují dvě verze, delší a kratší. Facilitátor ví, které video je autentické (pro účely
cvičení A) a jak byla ostatní vyrobena, zatímco účastníci to zjišťují; ve druhé části dostanou
oficiální záznam tiskové konference, kalendář primátora a výpověď organizátora venkovní akce. Práce
probíhá ve třech krocích: nejprve technická prohlídka bez kontextu, při níž tým hledá vizuální a
zvukové nesrovnalosti, poté kontextové ověření (kde se video poprvé objevilo, kdo je nahrál, zda
existují jiné záznamy téže události, zda odpovídá kalendář, počasí a oblečení) a nakonec formulace
stupně jistoty a doporučení redakci pro každé video. Zařazení videa C, které není syntézou, nýbrž
zavádějícím sestřihem autentického záznamu, odráží skutečnost, že většina reálně škodlivých záznamů
jsou právě takové levné úpravy, nikoli technicky náročné deepfaky (Paris & Donovan, 2019).

## Jak se vzorec pozná

Technické signály jsou pomocné, nikoli rozhodující: patří k nim nesoulad pohybu rtů a zvuku, neobvyklá
plynulost nebo „mrtvost“ mimiky, nekonzistentní osvětlení a stíny mezi tváří a okolím, artefakty na
hranách obličeje, vlasů, brýlí a zubů a hlas s neobvyklou intonací nebo bez přirozeného dýchání
(srovnej [klonování hlasu](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md)). Soustavná obrazová
forenzika dokáže část těchto stop odhalit analýzou konzistence osvětlení, stínů a kompresních
artefaktů, je však náročná a vyžaduje odborníka (Farid, 2016). Kontextové signály jsou robustnější:
první výskyt na účtu bez historie bez jiného záznamu téže události, nesoulad s doloženými údaji
(kalendář, místo, počasí), obsah, který příliš přesně „zapadá“ do probíhajícího sporu a přichází
v kritickém čase, a existence několika verzí s různou délkou, naznačující manipulaci střihem bez
syntézy ([video manipulace](@/kompendium/techniques/ea-9-2-5-video-manipulation-EA.md)). Právě tato
poslední možnost je důležitá: velká část škodlivých záznamů nejsou technicky náročné deepfaky, nýbrž
levné úpravy sestřihem a vytržením z kontextu, které nevyžadují žádnou syntézu (Paris & Donovan, 2019).

## Odlišení pravosti od manipulace

Video B působí podezřele technicky i kontextově, klíčové však je, že generátory se zlepšují rychleji,
než se šíří seznamy artefaktů, takže znaky spolehlivé před několika lety dnes často chybí a technická
prohlídka je filtr, nikoli verdikt. U videa C, které je technicky bez vad, rozhoduje kontext: výpověď
organizátora, jiné záznamy z akce a srovnání delší a kratší verze. V případu se ukáže, že výrok je
skutečný, ale kratší verze odstranila větu, v níž primátor citoval a odmítal cizí názor – nejde tedy
o syntézu, nýbrž o střih, stejně škodlivý. Z toho plyne, že samotný pojem „pravé versus falešné“ je
pro syntetická média nedostatečný a epistemicky zavádějící, protože deepfake neohrožuje poznání
primárně tím, že klame, ale tím, že oslabuje samu důkazní hodnotu záznamu jako takového (Chesney &
Citron, 2019). Proto má analytik pracovat se stupni jistoty a odlišovat syntézu, střih i autentický,
avšak zavádějícím způsobem zasazený záznam.

## Obrana a zotavení

Redakce se brání tím, že o neověřeném videu neinformuje jako o faktu; je-li video významné, informuje
o tom, že koluje a že jeho pravost nebyla ověřena, a uvede, co zjistila. Proti *liar's dividend* se
brání dokumentací původu – originálním souborem, svědky a nezávislými záznamy – nikoli pouhým
tvrzením, protože obhajoba pravosti stojí a padá s doložitelným řetězcem původu, ne s autoritou
mluvčího (Chesney & Citron, 2019). Instituce, jejichž představitelé mohou být cílem syntetických
médií, se chrání zveřejňováním oficiálních záznamů vystoupení s ověřitelným původem, připraveným
postupem rychlého vyjádření a dohodnutým ověřovacím kanálem pro citlivé pokyny
([AI-augmented spear phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md)). Zotavení
veřejné osoby zasažené falešným videem závisí hlavně na rychlosti a doložitelnosti protidůkazu,
protože pozdní oprava dohání již rozšířený záznam jen obtížně. Je třeba se vyhnout cynismu „dnes se
nedá věřit ničemu“, neboť právě tento stav plošné nedůvěry je tím, z čehož dividenda lháře těží
(Vaccari & Chadwick, 2020).

## Debriefing pro facilitátora

Facilitátor nejprve odhalí, které video bylo jaké, a nechá týmy porovnat výsledky technické a
kontextové fáze; obvykle se ukáže, že rozhodující bylo kontextové ověření. Pak se věnuje videu C,
jehož nejcennější poznatek zní, že technicky autentický záznam může klamat. Je třeba hlídat čtyři
časté chyby: spoléhání na jediný automatický detektor, který se mýlí oběma směry, binární závěr tam,
kde je poctivé „neověřeno“, přehlédnutí střihu při pozornosti upřené jen na syntézu a cynismus.
Syntetická média mohou zasáhnout i soukromé osoby, například intimní deepfaky; objeví-li se téma,
facilitátor uzná jeho závažnost, odkáže na odbornou a právní pomoc a nerozebírá konkrétní případy
ve skupině. Trvání na stupních jistoty místo binárního verdiktu má oporu v tom, že syntetická videa
u diváků zvyšují spíše celkovou nejistotu a nedůvěru než konkrétní klamnou víru, a právě s touto
nejistotou se analytik i redakce musí naučit pracovat (Vaccari & Chadwick, 2020).

## Meze a otevřené otázky

Scénář trénuje ověřovací postup, nikoli forenzní expertizu, a nenahrazuje soudně využitelné zajištění
důkazu. Otevřenou otázkou zůstává role automatických detektorů a kryptografických důkazů původu
(provenance), které slibují robustnější ověření, ale předpokládají, že je výrobci zařízení a platformy
plošně nasadí, což zatím neplatí. Diskutovat je rovněž třeba filosofickou stránku problému: pokud
žádný záznam není sám o sobě důkazem a vše závisí na řetězci původu, mění se samo postavení obrazu a
zvuku jako svědectví, a společnost teprve hledá, jak na tuto změnu institucionálně odpovědět
(Fallis, 2021).

## Literatura

- Chesney, R., & Citron, D. (2019). Deep Fakes: A Looming Challenge for Privacy, Democracy, and National Security. *California Law Review*, 107(6).
- Fallis, D. (2021). The Epistemic Threat of Deepfakes. *Philosophy & Technology*, 34(4).
- Farid, H. (2016). *Photo Forensics*. MIT Press.
- Paris, B., & Donovan, J. (2019). *Deepfakes and Cheap Fakes: The Manipulation of Audio and Visual Evidence*. Data & Society Research Institute.
- Vaccari, C., & Chadwick, A. (2020). Deepfakes and Disinformation: Exploring the Impact of Synthetic Political Video on Deception, Uncertainty, and Trust in News. *Social Media + Society*, 6(1).

## Související

**Navazující scénáře**

- [Verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md) – obecný postup ověřování.
- [Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – jak se syntetický obsah šíří.

**Techniky**

- [EA-2.3.7 Deepfake personalní](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) – útok na konkrétní osobu.
- [EA-9.2.1 Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) – syntetická persona.
- [EA-9.2.7 Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) – vyrobená svědectví.

**Sebe-obrana**

- [Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – praktický návod.
- [Časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md) – nezveřejnit dřív, než je ověřeno.

**Glosář a teorie**

- [Deepfake](@/glossary/deepfake.md) – definice a typy.
- [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – širší kontext generativní AI.
