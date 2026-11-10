+++
title = "Srovnávací presupozice"
description = "Srovnávací konstrukce, které mlčky předpokládají výchozí stav nebo měřítko srovnání: jak je rozpoznat a kdy slouží k vnesení nedoloženého hodnocení."
weight = 11
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Srovnávací presupozice", "Comparatives as presuppositions", "presupozice srovnání", "komparativ jako předpoklad", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.11"
catalog_slug = "srovnavaci-presupozice"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Comparatives as presuppositions"
catalog_aliases = ["presupozice srovnání", "komparativ jako předpoklad"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["srovnavaci-delece", "srovnavaci-delece-milton", "kvalifikatory-jen-i", "presupozice-v-reklame", "kontrastni-ramec"]
catalog_related_declared = ["srovnavaci-delece", "srovnavaci-delece-milton", "kvalifikatory-jen-i", "kontrastni-ramec", "presupozice-v-reklame"]
catalog_kompendium = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md", "kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md", "kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md", "kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md"]
catalog_prev = "kvalifikatory-jen-i"
catalog_next = "otazky-s-presupozici"
catalog_position = 11
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "cialdini-2009", "grice-1975", "herman-1992", "levinson-1983", "mcguire-1964", "passmore-rowson-2019", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["cialdini-2009", "herman-1992", "mcguire-1964", "passmore-rowson-2019", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.b.toml"
+++

# Srovnávací presupozice

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.11` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Comparatives as presuppositions |
| **Jiné názvy** | presupozice srovnání, komparativ jako předpoklad |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Srovnávací presupozice je předpoklad, který do výpovědi vnáší srovnávací konstrukce: druhý
a třetí stupeň přídavných jmen a příslovcí, spojení „víc než“, „méně než“, „stejně jako“ a
částice, které srovnání zesilují, například „ještě“ nebo „stále“. Výpověď „Jana je lepší
překladatelka než Eva“ tvrdí, že Jana překládá lépe, a zároveň předpokládá, že Eva je
překladatelka. Výpověď „dnes je to ještě horší“ předpokládá, že už včera to bylo špatné.
Lingvistická pragmatika řadí srovnání a kontrasty mezi spouštěče presupozic a připomíná, že
předpoklad přetrvává i pod záporem: „Jana není lepší překladatelka než Eva“ stále předpokládá,
že Eva překládá (Levinson 1983). Pro kompendium je podstatné, že srovnání umožňuje vnést
hodnocení výchozího stavu, aniž by ho mluvčí vyslovil, a tím ho vyjmout z diskuse.

Přesnost vyžaduje jedno rozlišení. Samotný druhý stupeň přídavného jména presupozici o
kladné vlastnosti obvykle nenese: „Petr je vyšší než Pavel“ neříká, že kdokoli z nich je
vysoký. Předpoklad vzniká teprve tam, kde srovnání obsahuje podstatné jméno, které přisuzuje
roli nebo vlastnost oběma stranám, nebo kde přistoupí částice typu „ještě“, „dokonce“ či
„zase“. Proto tato stránka úzce souvisí s heslem o
[částicích „jen“, „i“ a „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md).

## Původ a souvislosti

Srovnání jako zdroj nevyslovených předpokladů popsala lingvistika šedesátých a sedmdesátých
let v rámci širšího výzkumu presupozic; Levinson je ve svém přehledu uvádí spolu s
kontrastivním důrazem, kdy už samotné zdůraznění slova předpokládá srovnání s něčím, co
zůstalo nevysloveno (Levinson 1983). Z hlediska teorie konverzace se srovnání opírá o
princip kooperace. Posluchač předpokládá, že mluvčí uvádí srovnání, protože je relevantní,
a když měřítko chybí, doplní si nejpravděpodobnější výchozí bod sám (Grice 1975). Tato
ochota doplňovat dělá ze srovnání úsporný a zároveň zranitelný nástroj komunikace.

Neurolingvistické programování srovnání zpracovalo dvakrát a z opačných stran. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md)
ho popisuje jako jev vypouštění: věta „to je lepší“ neuvádí, oproti čemu, a meta-modelová
otázka má chybějící měřítko vyjádřit (Bandler a Grinder 1975). Tomuto pojetí se věnují
hesla [Srovnávací vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md) a
[Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md).
V popisu hypnotických vzorců Miltona Ericksona se srovnání objevuje obráceně, jako prostředek,
jímž výrok předkládá určitý stav jako už dosažený a hovoří jen o jeho prohloubení (Bandler a
Grinder 1975b). Presupoziční stránka srovnání, kterou popisuje tato stránka, leží mezi
oběma pohledy: nejde jen o to, co chybí, ale o to, co se mlčky přijímá za dané.

## Struktura vzorce

Srovnávací výpověď má tři složky: srovnávaný předmět, měřítko a vlastnost, podle níž se
srovnává. Výslovně se jedná jen o vztah mezi předmětem a měřítkem, tedy o to, zda je jedno
víc nebo méně než druhé. Vlastnost měřítka a jeho existence tvoří pozadí. Když vedoucí
řekne, že výkon „letos ještě poklesl“, debata se svádí k velikosti poklesu, zatímco to, že
byl výkon nízký už předtím, se přijme bez projednání. Strukturálně tedy srovnání přesouvá
hodnocení z popředí do pozadí výpovědi.

Psychologie úsudku popisuje dva mechanismy, které tento přesun podporují. Prvním je princip
kontrastu: to, co člověk posuzuje, hodnotí podle toho, s čím to bylo právě porovnáno, a
volba měřítka tak předurčuje závěr (Cialdini 2009). Druhým je ukotvení: výchozí hodnota, i
když je zvolená libovolně, posouvá následné odhady svým směrem (Tversky a Kahneman 1974).
Srovnávací presupozice spojuje obojí. Měřítko, které mluvčí zvolí, se stává kotvou, a
protože se o něm nediskutuje, posluchač nemá příležitost zvážit, zda je přiměřené.
Výzkum rámcování navíc ukázal, že logicky rovnocenné formulace vedou k odlišným volbám podle
toho, vůči jakému referenčnímu bodu je výsledek popsán (Tversky a Kahneman 1981).

Ke srovnávacím konstrukcím patří i třetí stupeň a přirovnání. Superlativ „nejlepší
nabídka na trhu“ předpokládá, že existuje vymezený soubor nabídek, které byly porovnány, a
že porovnání proběhlo; ani jedno se obvykle nedokládá. Přirovnání „stejně nespolehlivý jako
jeho otec“ přisuzuje vlastnost oběma stranám, ale výslovně se jedná jen o její míru, takže
hodnocení otce i syna se přijímá jako pozadí. Kontrastivní důraz, kdy mluvčí zdůrazní jediné
slovo, například „tentokrát jsi to pokazil ty“, předpokládá, že předtím to pokazil někdo jiný
nebo že pokažení je opakované (Levinson 1983). Ve všech těchto variantách platí totéž
pravidlo: čím víc se rozhovor soustředí na míru srovnání, tím pevněji se ukotví to, co
srovnání předpokládá.

## Detekční znaky

Prvním znakem je srovnání bez výslovného měřítka nebo s měřítkem, které nebylo nikdy
předloženo: „lepší“, „bezpečnější“, „zase horší“ bez údaje, oproti čemu. Druhým znakem je
spojení srovnání s částicí, která předpokládá výchozí stav, typicky „ještě“, „zase“, „stále“
nebo „dokonce“; právě tato kombinace nese nejsilnější hodnotící presupozici. Třetím znakem
je srovnání s anonymní skupinou, například „oproti ostatním“, kdy skupina ani její výsledky
nejsou dostupné ke kontrole. Čtvrtým znakem je opakované hodnocení téhož člověka
srovnávacími větami, které se navzájem podpírají: každé „ještě horší“ předpokládá předchozí
„špatně“, které nikdy nezaznělo jako samostatné tvrzení. Takový vzorec kompendium popisuje u
technik, které u člověka postupně pěstují pochybnost o vlastní kompetenci, jako je
[zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md).
Z hlediska teorie konverzace je varovné i to, když mluvčí na žádost o měřítko reaguje
podrážděně; kooperativní mluvčí měřítko obvykle snadno doplní, protože ho sám zná (Grice
1975).

## Legitimní a manipulativní užití

Legitimní srovnání má měřítko na stole. Lékař, který ukazuje dvě měření vedle sebe,
učitel, který porovnává práci studenta s jeho vlastní dřívější prací a obě má k dispozici,
nebo zpráva, která uvádí výchozí hodnotu i metodu, srovnávají otevřeně. Předpoklad, který
srovnání nese, je sdílený a ověřitelný, a posluchač může srovnání odmítnout, když měřítko
považuje za nepřiměřené. V terapeutické práci se srovnání používá i k zaznamenání pokroku,
například když klient sám popisuje, že se mu „daří o něco lépe“; tam presupozice vychází z
jeho vlastní zkušenosti, ne z přisouzení zvenčí.

Manipulativní srovnání se pozná podle toho, že měřítko je skryté, volené ve prospěch
mluvčího a že předpokládá hodnocení, které by adresát při výslovném vyslovení zpochybnil.
Typickými prostředími jsou hodnoticí rozhovory s nerovnou mocí, rodinná kritika, v níž se
„zase“ hromadí bez jediného konkrétního doložení, a komerční sdělení, kde se nabídka srovnává
s neurčenou konkurencí. Komerčnímu užití se podrobněji věnuje heslo
[Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md).
Psychologie přesvědčování popisuje, že pečlivě zvolené srovnání dokáže změnit vnímání nabídky,
aniž by se změnila nabídka sama (Cialdini 2009).

## Stav důkazů

Lingvistický popis srovnání jako spouštěče presupozic je dobře zavedený, i když se v
podrobnostech liší: odborná literatura diskutuje, které srovnávací konstrukce nesou
presupozici v užším smyslu a které spíše konverzační implikaturu, tedy závěr, který posluchač
vyvozuje z předpokladu kooperace a který lze zrušit (Levinson 1983; Grice 1975). Psychologické
mechanismy kontrastu, ukotvení a rámcování jsou experimentálně doložené, i když se zkoumaly
v jiném uspořádání než v přirozeném rozhovoru (Tversky a Kahneman 1974; Tversky a Kahneman
1981). Specifická tvrzení NLP, podle nichž srovnání v hypnotickém jazyce spolehlivě prohlubuje
stav nebo obchází kritické posouzení, kontrolovaný výzkum nepotvrdil; opírají se o rozbor
příkladů a přepisů sezení (Bandler a Grinder 1975b). Přehledy výzkumu NLP konstatují, že
testovatelná tvrzení oboru obecně podporu nenacházejí a že kvalitních studií je málo
(Witkowski 2010; Passmore a Rowson 2019). Poctivý závěr zní, že srovnávací presupozice je
reálný jazykový jev s doloženými psychologickými mechanismy v pozadí, ale že síla účinku,
kterou mu připisují příručky vlivu, nebyla změřena.

## Obrana a zotavení

Základní obranou je žádat měřítko. Otázka „ve srovnání s čím a podle jakých údajů?“ vrací
skrytou složku do popředí, kde ji lze ověřit nebo odmítnout. Druhou obranou je oddělit
srovnání od předpokladu a posoudit každé zvlášť: i když je pravda, že letošní výsledek je
nižší než loňský, neplyne z toho, že loňský byl špatný. Třetí obranou je zavést vlastní
měřítko, například srovnání se stanoveným cílem nebo s vlastní dřívější prací, místo
anonymní skupiny. Výzkum odolnosti vůči přesvědčování ukazuje, že předchozí seznámení s
oslabenou podobou vlivu a s jejím vyvrácením zvyšuje pozdější odolnost (McGuire 1964); znalost
toho, jak srovnání nese předpoklad, má podobnou ochrannou funkci. U lidí, jejichž výkon nebo
osobnost byly dlouhodobě hodnoceny řetězením srovnání bez doložení, je součástí zotavení
rekonstrukce: vypsat, co všechno se v takových větách předpokládalo, a ke každému předpokladu
hledat doklad. Tato práce probíhá nejlépe ve vztahu, kde má člověk znovu právo na vlastní
měřítka a na vlastní popis toho, co dokázal (Herman 1992). Další souvislosti se zkreslením
úsudku shrnuje kapitola o [kognitivních biasech](@/kompendium/03-zakladni-kategorie/biasy/_index.md).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Srovnávací vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md) – příbuzné heslo (Meta-model, Comparative deletion)
- [Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md) – příbuzné heslo (Milton-model, Comparative deletion (Milton Model))
- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – příbuzné heslo (Jazykové presupozice, Qualifiers only, even, too)
- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in advertising)
- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – příbuzné heslo (Reframing a rámce, Contrast frame)

**V kompendiu**

- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.5.2 Zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – předchozí heslo rodiny
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
