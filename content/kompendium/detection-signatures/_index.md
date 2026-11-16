+++
title = "Detekční signatury EA technik"
description = "Katalog 30 detekčních signatur a tří průřezových signatur, podle nichž lze v textu, chování, sítích a prožívání rozpoznat epistemickou manipulaci."
weight = 50
sort_by = "weight"
template = "kompendium/section.html"
page_template = "kompendium/page.html"

[extra]
tags = ["kompendium", "detection-signature", "diagnostika", "ea-techniques"]
categories = ["academic", "clinical", "security"]
toc = true
section_id = "kompendium-detection-signatures"
+++

## Detekční signatury epistemických útoků

Detekční signatura je **pozorovatelný vzorec**, který zvyšuje pravděpodobnost, že na člověka, skupinu nebo informační prostředí působí některá z technik epistemické manipulace popsaných v [katalogu technik](@/kompendium/techniques/_index.md). Signatury nejsou diagnózy ani důkazy viny. Jsou to nástroje pro kvalifikované čtenáře – kliniky, terapeuty, vyšetřovatele, právníky, compliance pracovníky a výzkumníky –, kteří potřebují vzorec rozpoznat, odlišit od benigních a klinických podob, zdokumentovat a navázat na správnou pomoc.

{% set l = load_data(path="static/data/listings/detection-signatures.json") %}Sekce obsahuje **{{ l.count }} signatur** ve {{ l.group_order | length }} skupinách; průřezové signatury popisují společné jádro několika modalit.

Pojem signatury je převzat z bezpečnostní praxe, kde označuje rozpoznatelný otisk určitého typu útoku, ale v této knize má užší a opatrnější význam. Signatura neurčuje, *kdo* působí ani *proč*; popisuje vzorec, který lze pozorovat, zaznamenat a ověřit. Tento přístup navazuje na tradici výzkumu nátlakových prostředí, která od Bidermana (1957) a Liftona (1961) po Starkovou (2007) popisovala manipulaci nikoli podle úmyslů aktérů, ale podle struktury prostředí a jejích dopadů na člověka. Stark přitom zdůraznila, že nátlaková kontrola (*[coercive control](@/glossary/coercive-control.md)*) je vzorec jednání, nikoli klinická diagnóza – a totéž platí pro všechny signatury v této sekci, včetně gaslightingu.

## Struktura sekce

| Skupina | Počet | Co zachycuje |
|---|---|---|
{% for g in l.group_order %}| **{{ l.group_names[g] }}** | {{ l.groups[g] | length }} | {{ l.group_notes[g] }} |
{% endfor %}
{% for g in l.group_order %}
### {{ l.group_names[g] }}

| Signatura | Co zachycuje |
|---|---|
{% for t in l.groups[g] %}| [{{ t.name }}](@/{{ t.path }}) | {{ t.listing_note | default(value="") }} |
{% endfor %}
{% endfor %}
## Jak signatury číst

Každá stránka má stejnou kostru: definici, popis toho, co signatura indikuje na úrovni struktury, pozorovatelné markery, detekční kritéria, odlišení od benigních podob, klinickou diferenciální diagnostiku, rizika falešné pozitivity, validační test, zásady dokumentace, doporučený postup s eskalací na krizové protokoly, anonymizovaný ilustrativní příklad, limity a otevřené otázky a seznam literatury, o niž se výklad opírá. Pro práci s nimi platí několik zásad, které vyplývají z dlouhé tradice výzkumu klinického a forenzního úsudku.

**Konvergence, ne jednotlivý znak.** Jedna signatura je slabý signál. Teprve sbíhání více signatur z různých modalit – například [akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md), [gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md) a [skok sebepochybnosti](@/kompendium/detection-signatures/26-phenomenological-self-doubt-spike.md) – podporuje závěr o působení. Meehl (1954) ukázal, že intuitivní klinický úsudek bývá méně spolehlivý než systematické skládání více ukazatelů, a Tversky a Kahneman (1974) doložili, jak snadno lidé přeceňují jednotlivý nápadný znak a přehlížejí základní četnost jevu. Signatury proto neobsahují pevné číselné prahy; kde stránky uvádějí orientační míry, vztahují se vždy k výchozímu stavu dané osoby nebo prostředí.

**Nejprve vyloučit jiné příčiny.** Zvlášť u fenomenologických signatur platí, že zdravotní, psychiatrické a toxické příčiny se zvažují dříve než vnější působení (viz [6.2 Diferenciální diagnostika](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md)). Signatura je podkladem pro kvalifikovaného odborníka, který jediný může stanovit diagnózu a ověřit, zda vzorec skutečně odpovídá působení prostředí.

**Popisovat vzorec, ne motivaci.** Dokumentace zaznamenává pozorovatelné jednání a jeho dopad; úmysl zdroje je interpretace, kterou lze doložit jen výjimečně (viz [forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md)). Tento přístup chrání před konfirmačním zkreslením, které Nickerson (1998) popsal jako sklon hledat a vykládat doklady ve prospěch předem přijaté hypotézy.

**Bezpečí před konfrontací.** Validační testy jsou určeny profesionálovi. Konfrontace zdroje zasaženou osobou může v násilných vztazích zvýšit riziko, a Herman (1992) proto klade nastolení bezpečí na začátek každé práce s traumatizovanou osobou.

**Pozor na zneužití detekce.** Signatury mohou být samy použity jako nálepky proti nepohodlným lidem nebo proti oprávněné kritice. Fricker (2007) ukázala, jak předsudek o mluvčím snižuje váhu jeho svědectví; detekce, která by se takovým předsudkem řídila, by epistemickou nespravedlnost sama vytvářela. Kritické ohledy shrnují [riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) a [EA jako mocenský nástroj](@/kompendium/critical-perspectives/18-EA-as-power-tool.md).

## Literatura

- Biderman, A. D. (1957). Communist attempts to elicit false confessions from Air Force prisoners of war. *Bulletin of the New York Academy of Medicine*, 33(9), 616–625.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Meehl, P. E. (1954). *Clinical versus Statistical Prediction: A Theoretical Analysis and a Review of the Evidence*. University of Minnesota Press.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

## Kam pokračovat

| Sekce | Proč na ni navázat |
|---|---|
| [Katalog technik](@/kompendium/techniques/_index.md) | Mechanismy, které signatury zachycují. |
| [Klinické aplikace a diagnostika](@/kompendium/06-klinicke-aplikace/_index.md) | Zařazení signatur do vyšetření. |
| [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) | Postup v krizi. |
| [Longitudinální rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) | Obnova po působení. |
| [Sebe-obrana](@/kompendium/self-defense-guides/_index.md) | Praktické návody pro zasažené osoby. |
| [Forenzní a právní rozměr](@/kompendium/forensic-legal/_index.md) | Dokumentace a důkazy. |
| [Vzdělávací scénáře](@/kompendium/educational-scenarios/_index.md) | Nácvik rozpoznávání. |
| [Glossary Bridges](@/kompendium/glossary-bridges/_index.md) | Propojení s platformovým glosářem. |

---

*Diagnostika není obvinění. Je to výchozí bod ověření.*
