+++
title = "EA-9.3.10 Trend Manipulation EA"
description = "Vzorec uměle vyrobeného trendu, kdy koordinované účty (lidé i boti) v krátkém okně zesílí téma tak, že ho algoritmus označí za „trendující“. Znaky, odlišení, obrana."
weight = 940

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-3", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-3-1-algorithmic-amplification", "ea-9-3-9-tag-hijacking-EA", "ea-9-3-7-platform-coordinated-attack", "ea-9-4-1-bot-amplification-coordinated"]
ea_code = "EA-9.3.10"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.3 Sociální platformy"
section_icon = "📱"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.3.10 Trend Manipulation EA

> *Subkategorie 📱 **9.3 Sociální platformy** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.3.10`
**Název:** Trend Manipulation EA
**Subkategorie:** 9.3 Sociální platformy
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Trend manipulation* je umělé vyvolání trendu: koordinovaná skupina účtů – skutečných i automatizovaných – publikuje a zesiluje obsah k jednomu tématu v krátkém časovém okně tak, aby ho systém platformy označil za „trendující“. Jakmile se téma objeví v přehledech trendů, přidají se skuteční uživatelé a média, a z vyrobeného trendu se stane skutečná pozornost.

## 3. Mechanismus (strukturálně)

Přehledy trendů slouží uživatelům jako mapa toho, „o čem se právě mluví“, a médiím jako zdroj témat. Algoritmus trendů reaguje na rychlost nárůstu, ne na počet nezávislých lidí ani na hodnotu tématu. Koordinace tento rozdíl využívá: dostatečně rychlý start stačí. Po zařazení do trendů získá téma organický dosah a původní koordinace se v něm ztratí. Epistemický účinek je dvojí – téma získá zdání významnosti a jiná témata jsou vytlačena. Vzorec stojí na [algoritmické amplifikaci](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md) a často využívá [bot amplification](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md).

## 4. Detekční markery

- Téma vystoupá do trendů bez odpovídající události nebo zprávy.
- V prvních minutách přispívá úzký okruh účtů s podobnými vzorci aktivity.
- Příspěvky používají shodné formulace, obrázky a hashtagy.
- Neobvyklé geografické rozložení – trend v zemi, kde téma nemá kontext.
- Média o trendu informují dřív, než se k němu přidají skuteční uživatelé ve větším počtu.

## 5. Odlišení

*Organický trend*: roste z různých komunit, často po události, s rozmanitými příspěvky. *Přiznaná kampaň*: organizace vyzve k sdílení pod vlastním jménem. *[EA-9.3.9 Tag Hijacking EA](@/kompendium/techniques/ea-9-3-9-tag-hijacking-EA.md)*: zneužití existujícího trendu, ne výroba nového.

## 6. Dopad a rámec

Vyrobené trendy ovlivňují agendu médií a veřejné debaty, mohou vytlačit důležitá témata a vytvořit dojem masové podpory. V politice slouží k demonstraci síly, v obchodě k marketingu bez označení. Rámcem jsou pravidla platforem proti manipulaci a neautentickému chování a pravidla pro skrytou reklamu; u velkých platforem i povinnosti posuzovat rizika podle DSA.

Pro firmy a instituce může být vyrobený trend krizí, na niž je třeba reagovat, i když za ní stojí jen malá skupina účtů. Připravený postup, který nejdřív ověří původ trendu a teprve potom volí reakci, chrání před přehnanými kroky, jako je odvolání akce nebo omluva za neexistující pochybení. Pro politiky a veřejné činitele platí totéž: trend proti nim neznamená, že se proti nim obrátila veřejnost, a jeho analýza je prvním krokem před jakoukoli reakcí. Pro média je vyrobený trend testem redakčních standardů – kdo o něm informuje bez ověření, stává se součástí kampaně.

## 7. Obrana a zotavení

*Uživatel*: trend není důkaz významnosti; ptát se, kdo a proč o tématu mluví. *Novináři*: neinformovat o trendech bez analýzy jejich původu; „trenduje na sítích“ není zpráva. *Platformy*: brát v úvahu nezávislost přispěvatelů, ne jen rychlost; zveřejňovat zásahy proti manipulaci. *Výzkum*: sledovat a zveřejňovat vyrobené trendy, aby veřejnost poznala vzorec.

## 8. Příklad (anonymizovaný kompozit)

Pozdě večer se do přehledu trendů dostane heslo vyzývající k odstoupení ministryně. Během hodiny o „masové vlně nespokojenosti“ informuje zpravodajský web. Analytik, který si data prohlédne, zjistí, že většina příspěvků v první půlhodině pochází od několika stovek účtů vytvořených v posledních týdnech, které sdílejí stejný obrázek. Druhý den o trendu informují média znovu – tentokrát jako o případu manipulace.

## 9. Meze a otevřené otázky

Rychlá, koordinovaná reakce skutečných lidí (např. fanouškovských komunit) může vypadat podobně jako manipulace; rozhodují znaky neautenticity účtů. Otevřenou otázkou je, zda by přehledy trendů neměly zohledňovat nezávislost zdrojů, a jak to udělat transparentně.

Otevřenou otázkou je i to, jak by měly platformy informovat o trendech, u nichž zjistily manipulaci: tiché odstranění z přehledu chrání před dalším zesílením, ale neučí veřejnost vzorec rozpoznat. Kniha se kloní k transparentnosti, ale připouští, že každé zveřejnění manipulace jí může dodat další pozornost.

Otevřenou otázkou zůstává i to, jak vysvětlovat vyrobené trendy veřejnosti bez dalšího zesílení.

Z vyrobeného trendu neplyne, co si veřejnost myslí – ale neplyne z něj ani opak. Zjištění, že téma do přehledu dostala malá skupina účtů, nevypovídá o rozšířenosti postoje, který téma nese; ten může být mezi lidmi běžný i vzácný a trend o tom neříká nic ani v jednom směru. Druhou mezí je určení účtů: Ferrara et al. (2016) popisují odlišení automatizovaných účtů od lidských jako úlohu s chybou v obou směrech, takže podíl „botů“ v trendu je odhadem metody, ne zjištěným faktem. Pro firmu nebo politika, který zvažuje reakci, je proto užitečnější otázka než číslo: komu by trend sloužil, kdyby nikdo nereagoval.

## 10. Pohled zevnitř a práce s postiženým

Osoba, proti níž trend směřuje, zažívá podobně jako u jiných koordinovaných kampaní pocit masového odmítnutí. Pomáhá věcně ukázat strukturu trendu a jeho původ. Pro uživatele, kteří se k trendu připojili, může být zjištění manipulace nepříjemné; užitečnější než výsměch je vysvětlení, jak trendy vznikají.

Pro lidi, kteří se ke kampani přidali v dobré víře, je důležité vědět, že jejich názor může být legitimní, i když trend, k němuž se připojili, byl vyroben; oddělit vlastní postoj od manipulace, která ho využila, jim pomůže zůstat v debatě bez pocitu, že byli „jen loutkami“.

## 11. Vztah k ostatním kategoriím EA

Vyrobený trend je platformní podobou [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) a palivem pro [EA-2.3.5 Pseudo-kontroverze Amplifikace](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md). Synchronizaci napříč platformami popisuje [EA-9.3.7](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md).

## 12. Postup při posuzování trendu

1. **Zjistit spouštěč** – událost, zprávu, výrok.
2. **Prověřit první přispěvatele** – stáří účtů, aktivitu, propojení.
3. **Porovnat obsah** příspěvků v první fázi.
4. **Posoudit geografii** a časování.
5. **Informovat o trendu** jen s analýzou jeho původu.

## 13. Prevence a odolnost

Prevence stojí na publiku, které ví, že trend není důkaz významnosti, na médiích, která trendy nepřebírají bez analýzy, a na platformách, které při určování trendů zohledňují nezávislost přispěvatelů.

## 14. Otázky pro rozhovor a šetření

- Co trend spustilo a kdy?
- Kdo přispíval v první půlhodině?
- Liší se příspěvky obsahem, nebo opakují šablonu?
- Proč o trendu informují média?
- Kdo z trendu těží?

## Odborný kontext

Woolley a Howard (2018) doložili, že politické kampaně a státní aktéři v řadě zemí používají automatizované účty a koordinované skupiny k ovlivňování toho, co se na sociálních sítích jeví jako populární. Ferrara et al. (2016) popsali, jak sociální boti dokážou ovlivnit vnímání popularity a jak obtížné je je odlišit od lidí. Výroba trendu je nejviditelnějším výsledkem této činnosti, protože přehledy trendů slouží uživatelům i médiím jako ukazatel toho, „o čem se mluví“.

Cialdini (2001) vysvětluje sílu sociálního důkazu: v nejistotě se řídíme tím, co dělají druzí. Trend je sociálním důkazem v nejčistší podobě – číslo a pořadí bez obsahu. Benkler, Faris a Roberts (2018) ukázali, že zpravodajská média přebírají témata ze sociálních sítí a tím jim dodávají legitimitu, kterou samy nemají.

## Souvislosti pro praxi

Pro redakce je dobrou praxí neinformovat o tom, že něco „trenduje“, bez ověření, kdo trend vyvolal. Pro výzkumníky je užitečné zveřejňovat analýzy vyrobených trendů, aby veřejnost poznala vzorec.

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network [Propaganda](@/glossary/propaganda.md)*. Oxford University Press.
- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The rise of social bots. *Communications of the ACM*.
- Woolley, S. C., & Howard, P. N. (Eds.) (2018). *Computational Propaganda*. Oxford University Press.

## Související

**Sourozenecké techniky**

- [EA-9.3.1 Algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md) – infrastruktura zesílení.
- [EA-9.3.9 Tag Hijacking EA](@/kompendium/techniques/ea-9-3-9-tag-hijacking-EA.md) – zneužití existujícího trendu.
- [EA-9.3.7 Platform Coordinated Attack](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md) – synchronizace napříč platformami.
- [EA-9.4.1 Bot Amplification Coordinated](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md) – boti jako startovací motor trendu.

**Detekce**

- [Detekční signatura: Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md) – znaky koordinace účtů.
- [Detekční signatura: Asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) – dosah bez opory.

**Obrana**

- [Sebe-obrana: Rozpočet pozornosti](@/kompendium/self-defense-guides/34-attention-budget.md) – trend nemusí dostat mou pozornost.
- [Programy mediální gramotnosti](@/kompendium/population-health/15-media-literacy-program.md) – vysvětlování, jak trendy vznikají.
