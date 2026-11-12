+++
title = "7.6 Computational epistemology"
description = "Computational epistemology jako disciplína — formalizace epistemických operací a Floridiho informační etika."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "teoreticke-reflexe", "computational-epistemology", "floridi"]
categories = ["academic", "theory", "computational"]

[extra]
related_terms = ["clark-andy-natural-born-cyborgs", "clark-extended-mind", "damasio-somatic-marker", "davidson-radical-interpretation"]
section_icon = "🪐"
toc = true
+++

# 7.6 Computational epistemology

**Computational epistemology** je interdisciplinární doména na rozhraní filosofie, kognitivních věd a informatiky. Její ústřední otázkou je: lze epistemické operace — akvizici, integraci, justifikaci, revizi a aplikaci poznání — formalizovat natolik, aby byly **algoritmicky implementovatelné**? A pokud ano, jaké jsou epistemologické důsledky takové implementace?

## Co je computational epistemology

### Filosofické fundamenty

Tradiční epistemologie (Platón, Descartes, Kant, Russell, Quine) tematizuje poznání **deskriptivně a normativně** — popisuje, čím je poznání, a stanovuje normy správného poznávání. Computational epistemology přidává **konstruktivní rozměr**: ptá se, jak epistemické operace **realizovat** algoritmicky, a co z této realizace vyplývá pro tradiční epistemologické otázky.

Klíčové průkopnické práce:

- **Goldman, *Epistemology and Cognition* (1986)** — Reliabilismus jako most mezi normativní epistemologií a kognitivní vědou.
- **Thagard, *Computational Philosophy of Science* (1988)** — Algoritmické modely vědeckého objevu, vysvětlení, koncepční změny.
- **Floridi, *The Philosophy of Information* (2011)** — Informace jako fundamentální ontologická a epistemologická kategorie; „fourth revolution“ (Turing) v lidském sebe-porozumění.
- **Pearl, *Causality* (2000) / *The Book of Why* (2018)** — Formální modely kauzální inference, do-calculus, counterfactual reasoning.

### Floridiho informační etika

Luciano Floridi rozšiřuje computational epistemology do **informační etiky**: pokud jsou epistemické subjekty informacemi v silném ontologickém smyslu (informational organisms, „inforgs“), pak manipulace informací je **manipulací ontologického statusu** subjektu. [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) v tomto rámci není pouze deformací poznání, ale **redukcí ontologické integrity** subjektu.

Floridi rozlišuje čtyři úrovně informačních patologií:

1. **Mis-information** — Neúmyslně nesprávná informace.
2. **Dis-information** — Úmyslně falešná informace s manipulační intencí.
3. **Mal-information** — Pravdivá informace, ale strategicky kontextualizovaná tak, aby způsobila škodu.
4. **Anti-information** — Strukturní destrukce schopnosti rozlišovat předchozí kategorie ([metakognitivní destrukce](@/glossary/metakognitivni-destrukce.md)).

Anti-information odpovídá nejhlubší vrstvě epistemické anihilace v terminologii kompendia — destrukci epistemických dispozic, jež umožňují kalibrovaně vyhodnocovat informace.

## Formální modely poznání a jeho změny

Nejlépe rozpracovanou částí oboru nejsou architektury systémů, ale formální modely epistemických stavů a jejich změn. Hintikka (1962) ukázal, že výrazy „ví, že“ a „věří, že“ lze zapsat jako modální operátory a že z volby relace dosažitelnosti mezi možnými světy vyplývají silné a leckdy nevítané důsledky — především logická všemohoucnost, totiž předpoklad, že kdo zná premisy, zná i všechny jejich důsledky. Právě nesouměřitelnost tohoto předpokladu se skutečným lidským poznáním je jedním z trvalých témat oboru: formalizace zviditelňuje, co model o poznávajícím mlčky předpokládá.

Druhou linii tvoří teorie revize přesvědčení. Alchourrón, Gärdenfors a Makinson (1985) formulovali postuláty pro operace expanze, kontrakce a revize souboru přesvědčení: nová informace má být přijata, výsledek má zůstat konzistentní a změna má být co nejmenší. Model tím činí výslovnou otázku, která je pro kompendium ústřední — co se stane, je-li revize vynucována zvenčí a „co nejmenší změna“ se soustavně počítá na úkor téhož jádra přesvědčení. *Interpretace knihy*: techniky popsané v oddílech 01–05 proto nelze vyčerpat jako dodávání nepravdivých informací; zasahují do samotné operace, jíž poznávající informace začleňuje.

Třetí linií je formální teorie učení. Gold (1967) zavedl pojem identifikace v limitě: metoda je úspěšná, ustálí-li se po konečném počtu kroků na správné hypotéze, i když není znám okamžik, kdy se tak stalo. Kelly (1996) z tohoto východiska rozvinul program, v němž se místo otázky „je toto přesvědčení oprávněné?“ klade otázka „směřuje tato metoda spolehlivě k pravdě, a za jakých podmínek?“. Posun od oprávnění jednotlivého přesvědčení k vlastnostem metody je pro obranu proti epistemické anihilaci podstatný: poznávající, jemuž byly rozvráceny metody, může mít nadále mnoho pravdivých přesvědčení, a přesto být bez obrany.

Čtvrtou linií je výpočetní sociální epistemologie, která simuluje šíření a prověřování poznatků v populaci. Hegselmann a Krause (2002) modelovali dynamiku mínění s omezenou důvěrou — každý aktér přejímá jen od těch, jejichž postoj není příliš vzdálený — a ukázali, jak z jediného pravidla vyrůstá buď shoda, nebo stabilní rozpad na oddělené skupiny. Zollman (2010) na modelech vědeckých komunit doložil, že přechodná různost přesvědčení může zvyšovat pravděpodobnost, že komunita nakonec najde lepší hypotézu, protože brání předčasnému sjednocení na první slibné možnosti. Oba výsledky mají obrannou čitelnost: zúžení okruhu zdrojů i tlak na rychlou jednomyslnost jsou v těchto modelech podmínkami horšího kolektivního poznání.

Jak se takové modely hodnotí, naznačuje už Thagard (1988): výpočetní model vědeckého usuzování
posuzoval podle toho, zda reprodukuje doložené epizody z dějin vědy. Kritérium má svou cenu i svou
slabinu — nutí model vystavit se historickému materiálu, ale odměňuje ty modely, jež se podobají
případům už vybraným jako poučné. Goldmanův reliabilismus (Goldman 1986) nabízí k témuž problému
jiné východisko: hodnotit ne jednotlivý výsledek, nýbrž spolehlivost procesu, jímž byl získán.

### Co formalizace nedokazuje

Žádný z uvedených modelů není důkazem o lidském poznávání. Model dává přesný závěr o svých vlastních předpokladech; o skutečném poznávajícím mluví jen natolik, nakolik tyto předpoklady platí, a to je otázka empirická, nikoli formální. Z toho, že lze epistemickou operaci zapsat algoritmicky, nevyplývá, že ji poznávající takto provádí, ani že by ji tak provádět měl: implementovatelnost není normou. Stejně tak výsledek simulace není nálezem o společnosti, nýbrž důsledkem zvoleného pravidla aktualizace, a s ním se mění. *Interpretace knihy*: hodnota těchto modelů pro kompendium je diagnostická — pojmenovávají, které články poznávacího procesu lze vůbec odděleně zasáhnout, a tím ukazují, kam se při obraně dívat; nenahrazují ani klinický nález, ani filosofický argument.

## Limitace a otevřené otázky

Computational epistemology není ucelenou disciplínou; je rozvíjejícím se programem s otevřenými problémy:

1. **Mechanizace versus normativita** — Lze formalizovat *všechny* epistemické operace? Některé (např. [hermeneutické](@/glossary/hermeneutika.md) interpretace, [fenomenologická](@/glossary/fenomenologie.md) redukce) se stavějí na odpor formalizaci.
2. **Adversariální zranitelnost** — Každá computational implementace zavádí *nové* zranitelnosti (model poisoning, prompt injection, jailbreak), jež nejsou redukovatelné na lidské epistemické zranitelnosti.
3. **Sociálně-epistemická vrstva** — Kolektivní poznání zahrnuje normativní strukturu (komunita, autorita, tradice), jež není algoritmicky redukovatelná.
4. **[Dual-use poznání](@/glossary/dual-use-poznani.md)** — Stejné formalismy, jež umožňují obranu proti EA, lze využít k její optimalizaci: každá defensivní architektura má svého útočného zrcadlového dvojníka.

Kompendium otevřeně přiznává tuto **dual-use** povahu: formalizace nuancí epistemické anihilace je nezbytná pro obranu, ale poskytuje útočníkovi přesnou mapu zranitelností. Etická odpovědnost je proto neredukovatelná na technickou implementaci.

## Literatura

- Alchourrón, C. E., Gärdenfors, P., & Makinson, D. (1985). On the logic of theory change: Partial meet contraction and revision functions. *The Journal of Symbolic Logic*.
- Floridi, L. (2011). *The Philosophy of Information*. Oxford University Press.
- Gold, E. M. (1967). Language identification in the limit. *Information and Control*.
- Goldman, A. I. (1986). *Epistemology and Cognition*. Harvard University Press.
- Hegselmann, R., & Krause, U. (2002). Opinion dynamics and bounded confidence: Models, analysis and simulation. *Journal of Artificial Societies and Social Simulation*.
- Hintikka, J. (1962). *Knowledge and Belief: An Introduction to the Logic of the Two Notions*. Cornell University Press.
- Kelly, K. T. (1996). *The Logic of Reliable Inquiry*. Oxford University Press.
- Pearl, J. (2000). *Causality: Models, Reasoning, and Inference*. Cambridge University Press.
- Pearl, J., & Mackenzie, D. (2018). *The Book of Why: The New Science of Cause and Effect*. Basic Books.
- Thagard, P. (1988). *Computational Philosophy of Science*. MIT Press.
- Zollman, K. J. S. (2010). The epistemic benefit of transient diversity. *Erkenntnis*.

## Související

- [7.1 Filozofické tradice](@/kompendium/07-teoreticke-reflexe/filozoficke-tradice/_index.md)
- [7.2 Kognitivní vědy a EA](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md)
- [7.3 EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md)
- [7.4 Politická a ideologická EA](@/kompendium/07-teoreticke-reflexe/politicka-ea.md)
- [7.5 Otevřené výzkumné otázky](@/kompendium/07-teoreticke-reflexe/otevrene-otazky.md)
- [Sekce 07 — Teoretické reflexe (úvod)](@/kompendium/07-teoreticke-reflexe/_index.md)
- [2.3 Teoretické základy](@/kompendium/02-uvod/teoreticke-zaklady.md)
- [Sekce 03 — Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md)
- [Sekce 04 — Klinika](@/kompendium/04-klinika/_index.md)
- [Sekce 05 — Kolektivní rozměr](@/kompendium/05-kolektivni-rozmer/_index.md)
- [Sekce 06 — Intervence a obrana](@/kompendium/06-intervence-a-obrana/_index.md)
- [Glosář: Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
- [Glosář: Kognitivní anihilace](@/glossary/kognitivni-anihilace.md)
- [Glosář: Kognitivní bias](@/glossary/kognitivni-bias.md)
- [Glosář: Konfirmační bias](@/glossary/konfirmacni-bias.md)
- [Glosář: Falsifikace](@/glossary/falsifikace.md)
- [Glosář: Lakatos](@/glossary/lakatos-vyzkumny-program.md)
- [Glosář: Hermeneutika](@/glossary/hermeneutika.md)
- [Glosář: Fenomenologie](@/glossary/fenomenologie.md)
- [Glosář: Metakognice](@/glossary/metakognice.md)
- [Glosář: Anankastický režim](@/glossary/anankasticky-rezim.md)
- [Glosář: Kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md)
- [Glosář: Epistemická alienace](@/glossary/epistemicka-alienace.md)
- [Glosář: Ontologická anihilace](@/glossary/ontologicka-anihilace.md)
- [Glosář: Metakognitivní destrukce](@/glossary/metakognitivni-destrukce.md)
- [Glosář: Taxonomie EA](@/glossary/taxonomie-ea.md)
- [Glosář: Dual-use poznání](@/glossary/dual-use-poznani.md)
- [Glosář: Kompendium EA](@/glossary/kompendium-ea.md)
- [Glosář: Gaslighting](@/glossary/gaslighting.md)
- [Glosář: Delegitimizace](@/glossary/delegitimizace.md)
- [Glosář: Epistemické trauma](@/glossary/epistemicke-trauma.md)

## Kritický krok

**Teoretické reflexe ne jsou závěry — jsou pozvánkami k myšlení.** Po četbě:

1. Identifikuj alespoň jeden bod, kde nesouhlasíš s autorovou formulací
2. Formuluj svou vlastní alternativní pozici v 3–5 větách
3. Najdi v [bibliografii](@/kompendium/08-prilohy/bibliografie.md) primární
   zdroj, který tvou alternativu podporuje (alespoň 1)

> **Mandatorní akce**: pasivní souhlas s teoretickou reflexí je sám o sobě
> formou epistemické pasivity. Aktivní oponentura je nepostradatelná
> součást doktríny.
