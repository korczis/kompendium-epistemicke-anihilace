+++
title = "Důvěrnost v detekci EA"
description = "Záznamy o EA jsou citlivá data o postižených i o třetích osobách; GDPR, kontextová integrita a pojistky proti úniku, zneužití a automatizovanému rozhodování."
weight = 17

[taxonomies]
tags = ["kompendium", "critical-perspectives", "ethical", "ethics", "legal"]
categories = ["academic", "critical-theory"]

[extra]
related_terms = ["12-EA-stigma-risk", "15-consent-validity-question", "19-research-exploitation", "14-power-asymmetry-EA"]
toc = true
+++

# Důvěrnost v detekci EA

> **Okruh**: etická kritika · **Jádro námitky**: záznam o manipulaci je informace, kterou může zneužít právě ten, před kým má chránit

Kdo pracuje s rámcem [epistemické anihilace](@/glossary/epistemicka-anihilace.md), vytváří záznamy neobvyklé citlivosti: popisy intimních vztahů, vzpomínky, pochybnosti o vlastním úsudku, jména lidí, kteří údajně manipulovali, a výklady jejich jednání. Kritika důvěrnosti upozorňuje, že rámec, který se zabývá kontrolou nad informacemi, sám produkuje informace, jejichž únik nebo zneužití může způsobit škodu srovnatelnou s tou, kterou popisuje.

## Námitka v nejsilnější podobě

Alan Westin definoval soukromí jako nárok jednotlivců rozhodovat, kdy, jak a v jakém rozsahu se informace o nich sdělují druhým (Westin 1967). Daniel Solove ukázal, že ohrožení soukromí nevzniká jen únikem, ale v celém životním cyklu informace – při sběru, zpracování, šíření a zásahu do soukromé sféry (Solove 2006). Helen Nissenbaumová přidala pojem kontextové integrity: informace sdělená v jednom kontextu (terapie) se stává škodlivou, když přejde do jiného (soudní spor, personální spis) bez ohledu na normy, za nichž byla sdělena (Nissenbaum 2010).

U EA má tento problém tři zvláštnosti:

1. **Data o třetích osobách.** Záznam postiženého obsahuje informace o člověku, který o záznamu neví a nesouhlasil s ním – o údajném působícím. I on je subjektem údajů a jeho pověst je ohrožena.
2. **Zneužití působícím.** V rodinných a pracovních sporech se strana obviněná z manipulace může snažit získat terapeutické záznamy postiženého, aby zpochybnila jeho věrohodnost („sám přiznal, že nevěří svému úsudku“).
3. **Automatizace.** [Detekční signatury](@/kompendium/detection-signatures/_index.md) určené ke strojovému zpracování mohou vytvářet profily lidí ve velkém, bez jejich vědomí a mimo kontext, v němž by šlo výsledek posoudit.

## Kde zasahuje tuto knihu

Kniha má kapitoly o [datové bezpečnosti výzkumu](@/kompendium/research-methodology/data-security-EA-research.md), [anonymizaci](@/kompendium/research-methodology/anonymization-EA-research.md), [klinické dokumentaci](@/kompendium/forensic-legal/31-clinical-documentation-EA.md) a [klasifikaci informací](@/kompendium/organizational-defense/27-information-classification.md) a její [etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) obsahuje závazek anonymizace a důvěrnosti. Kniha ale mnohde doporučuje dokumentovat – vést deník, archivovat komunikaci, zapisovat vzorce – a dokumentace je dvojsečná: chrání postiženého jako důkaz a ohrožuje ho jako materiál, který může získat protistrana.

V Evropské unii se na takové záznamy vztahuje obecné nařízení o ochraně osobních údajů (GDPR). Údaje o zdraví patří mezi zvláštní kategorie podle čl. 9 a jejich zpracování je možné jen za přísnějších podmínek. Obecné zásady čl. 5 – omezení účelu, minimalizace údajů, omezení uložení – platí pro všechny záznamy. Čl. 22 dává lidem právo nebýt předmětem rozhodnutí založeného výhradně na automatizovaném zpracování, které má pro ně právní nebo obdobně závažné účinky; to je přímo relevantní pro jakékoli automatické označování „manipulativního“ chování. Zdravotnické záznamy navíc chrání povinnost mlčenlivosti podle zákona o zdravotních službách.

## Ilustrační případ

Obecný kompozit: zaměstnanec se svěří firemnímu poradci, že ho vedoucí podle něj manipuluje, a poradce si vede podrobné poznámky s kódy technik. Poznámky uloží do sdíleného systému, ke kterému má přístup personální oddělení. Při pozdější reorganizaci si vedoucí záznamy prohlédne, zjistí, kdo si stěžoval, a zaměstnanec je přeřazen. Žádný z kroků nebyl zlovolný – poradce chtěl mít podklady, systém byl prostě sdílený. Výsledkem je však přesně ta škoda, před kterou měl postup chránit, a vedoucí navíc figuruje v záznamech jako „působící“, aniž by se k tomu kdy mohl vyjádřit.

## Co námitka neprokazuje

Neprokazuje, že by se nemělo dokumentovat. Bez záznamů nelze doložit vzorec, poskytnout ochranu ani se obhájit u soudu (viz [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)). Důvěrnost také není absolutní: při bezprostředním ohrožení života a zdraví může být sdělení informací nezbytné; americký případ Tarasoff (1976) založil v některých jurisdikcích povinnost terapeuta varovat ohroženou osobu. Námitka žádá, aby každý záznam vznikal s vědomím, kdo ho může číst a k čemu.

## Pojistky pro praxi

- **Minimum nutného.** Zapisovat jen to, co slouží účelu záznamu; výklady a hypotézy odlišit od faktů a uchovávat odděleně.
- **Řízený přístup.** Záznamy o EA nesmí být ve sdílených systémech bez řízení přístupu a evidence nahlížení (viz [Řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md)).
- **Myslet na protistranu.** Při psaní předpokládat, že záznam může být jednou předložen soudu, a psát ho tak, aby neposkytl materiál k delegitimizaci postiženého.
- **Třetí osoby.** Informace o údajném působícím omezit na to, co je nutné, a nepsat o něm závěry, které nebyly ověřeny.
- **Žádné výhradně automatické rozhodování.** Výstup strojové detekce je podnět pro člověka, nikdy rozhodnutí.
- **Lhůty a výmaz.** Stanovit dobu uložení a po jejím uplynutí záznamy vymazat nebo anonymizovat.
- **Postup při úniku.** Mít předem připravený postup, jak informovat dotčené a omezit škodu.

## Co zůstává otevřené

Jak vyvážit potřebu postiženého dokumentovat s rizikem, že dokumentace bude použita proti němu? Jaká práva má mít údajný působící vůči záznamům, které o něm vznikají v cizí terapii? A jak zajistit kontextovou integritu u nástrojů, které – jako detekční signatury – mají fungovat automaticky a ve velkém?

## Literatura

- Westin, A. F. (1967). *Privacy and Freedom*. Atheneum.
- Solove, D. J. (2006). A taxonomy of privacy. *University of Pennsylvania Law Review*, 154(3).
- Nissenbaum, H. (2010). *Privacy in Context: Technology, Policy, and the Integrity of Social Life*. Stanford University Press.
- Nařízení Evropského parlamentu a Rady (EU) 2016/679 (obecné nařízení o ochraně osobních údajů), zejména čl. 5, 9 a 22.

## Související

**Kritické perspektivy**

- [Stigmatizace skrze kategorie EA](@/kompendium/critical-perspectives/12-EA-stigma-risk.md) – co se stane, když nálepka unikne.
- [Otázka platnosti souhlasu](@/kompendium/critical-perspectives/15-consent-validity-question.md) – k čemu člověk dal svolení.
- [Mocenská asymetrie v aplikaci EA](@/kompendium/critical-perspectives/14-power-asymmetry-EA.md) – kdo má k záznamům přístup.

**Kapitoly a postupy**

- [Datová bezpečnost EA výzkumu](@/kompendium/research-methodology/data-security-EA-research.md) – technické a organizační zajištění.
- [Klinická dokumentace](@/kompendium/forensic-legal/31-clinical-documentation-EA.md) – jak psát záznamy, které obstojí.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md) – organizační rámec citlivosti.
- [EU právo – EA rámec](@/kompendium/international/21-EU-law-EA/index.md) – evropský právní kontext.
- [Detection Signatures](@/kompendium/detection-signatures/_index.md) – automatizace, které se týká čl. 22 GDPR.

**Pojmy**

- [Dual-use poznání](@/glossary/dual-use-poznani.md) – záznam jako ochrana i zbraň.
