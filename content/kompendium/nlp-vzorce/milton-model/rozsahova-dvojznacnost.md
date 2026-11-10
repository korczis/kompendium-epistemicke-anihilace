+++
title = "Rozsahová dvojznačnost"
description = "Vzorec Milton-modelu, v němž není jasné, jak daleko ve větě sahá přívlastek, zápor nebo podmínka: rozpoznání, důkazy, obrana v nabídkách a výsleších."
weight = 13
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Rozsahová dvojznačnost", "Scope ambiguity", "dvojznačnost dosahu", "Milton-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-04.13"
nlp_slug = "rozsahova-dvojznacnost"
nlp_family = "milton-model"
nlp_family_code = "04"
nlp_family_title = "Milton-model"
nlp_family_en = "Milton Model"
nlp_part = "milton-model.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Scope ambiguity"
nlp_aliases = ["dvojznačnost dosahu"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "milton-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["milton-model"]
nlp_related = ["fonologicka-dvojznacnost", "syntakticka-dvojznacnost", "interpunkcni-dvojznacnost", "presupozice-milton", "otazky-s-presupozici"]
nlp_related_declared = ["syntakticka-dvojznacnost", "interpunkcni-dvojznacnost", "presupozice-milton", "otazky-s-presupozici", "fonologicka-dvojznacnost"]
nlp_kompendium = ["kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md"]
nlp_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/milton-model/presupozice-milton.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md"]
nlp_prev = "syntakticka-dvojznacnost"
nlp_next = "interpunkcni-dvojznacnost"
nlp_position = 13
nlp_family_size = 30
nlp_sources = ["bandler-grinder-1975b", "chomsky-1965", "erickson-rossi-rossi-1976", "grice-1975", "grinder-bandler-1981", "heap-1988", "levinson-1983", "loftus-palmer-1974", "mcguire-1964", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975b", "grinder-bandler-1981"]
nlp_sources_roots = ["chomsky-1965", "erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
nlp_sources_critical = ["heap-1988", "loftus-palmer-1974", "mcguire-1964", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/milton-model.b.toml"
+++

# Rozsahová dvojznačnost

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.13` |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Scope ambiguity |
| **Jiné názvy** | dvojznačnost dosahu |
| **Obecnější vzorec** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Rozsahová dvojznačnost nastává tehdy, když z věty nelze s jistotou určit, jak velkou část
výpovědi zasahuje určitý prvek: přívlastek, zápor, kvantifikátor, podmínka nebo vedlejší věta.
Ve spojení „unavení rodiče a děti“ není jasné, zda jsou unavení jen rodiče, nebo i děti. Ve
větě „Nemusíte to podepsat dnes“ zůstává otevřené, zda podpis není nutný vůbec, nebo jen ne
dnes. Ve výroku „Všichni účastníci si vybrali jeden kurz“ se nedá rozhodnout, zda šlo o týž
kurz, nebo o kurz pro každého jiný. Bandler a Grinder zařadili rozsahovou dvojznačnost mezi
druhy dvojznačnosti, které podle nich tvoří součást Ericksonova hypnotického jazyka, a
popsali ji jako situaci, kdy z kontextu nelze poznat, kam až určitý jazykový prvek sahá
(Bandler a Grinder 1975b). Pro kompendium má vzorec zvláštní význam ve dvou prostředích: v
nabídkách a smlouvách, kde se výhoda zdá širší, než je, a ve výslechu nebo svědecké výpovědi,
kde jedna odpověď může nechtěně potvrdit víc, než tazatel výslovně řekl.

## Původ a souvislosti

Pojem rozsahu pochází z logiky a sémantiky, kde se rozlišuje úzký a široký dosah záporu,
kvantifikátorů a modálních výrazů. Tato rozlišení nejsou vynálezem NLP; Bandler a Grinder je
převzali z lingvistiky své doby spolu s celkovým rámcem transformační gramatiky, v němž
dvojznačná věta odpovídá více hloubkovým strukturám (Chomsky 1965). Pragmatika ukázala, že
rozsah záporu úzce souvisí s presupozicemi: některé předpoklady věty přežijí zápor, jiné ne,
podle toho, jak široce ho posluchač chápe (Levinson 1983). Proto se rozsahová dvojznačnost v
Milton-modelu často prolíná s
[presupozicemi](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md): věta, která na
první pohled nabízí volbu nebo úlevu, může v širším čtení předpokládat právě to, co má
posluchač přijmout.

V hypnotickém kontextu Milton-model rozsahovou dvojznačnost popisuje jako prostředek, jímž se
sugesce „rozlije“ na širší část výpovědi, než by odpovídalo pečlivému čtení (Grinder a Bandler
1981). V běžném vlivovém užití je důležitější jiná funkce: mluvčí si ponechává volbu, které
čtení bude později platit. Posluchač slyší výhodnější, mluvčí se dovolá užšího.

## Struktura vzorce

Strukturálně má rozsahová dvojznačnost tři prvky. Prvním je operátor, tedy slovo nebo
konstrukce, jejíž působnost má být určena: přídavné jméno před souřadným spojením, zápor
spojený se slovesem a příslovečným určením, kvantifikátor typu „všichni“ či „jeden“, podmínka
na konci věty nebo vztažná věta za výčtem. Druhým prvkem jsou dvě možné domény působnosti,
úzká a široká, které dávají odlišný význam. Třetím je kontext, který na povrchu podporuje jedno
čtení, nejčastěji to, které je pro posluchače přijatelnější. Dvojznačnost nevzniká chybou v
gramatice, ale tím, že jazyk dosah operátorů obvykle výslovně nevyznačuje a spoléhá na
spolupráci posluchače.

Zvláštní případ představuje složená otázka. Tazatel spojí dvě tvrzení do jedné otázky, na kterou
je možné odpovědět jediným „ano“, a tím vznikne nejasnost, zda odpověď platí pro obě části,
nebo jen pro jednu. Ve výslechu a ve svědecké výpovědi tak může odpověď nabýt širšího rozsahu,
než svědek zamýšlel. Kompendium tento problém popisuje v kontextu
[forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md), kde se
složeným a sugestivním otázkám záměrně vyhýbá. Výzkum svědecké paměti ukázal, že i drobná
změna znění otázky ovlivní odpověď a později i to, co si svědek pamatuje (Loftus a Palmer
1974).

## Detekční znaky

Rozsahovou dvojznačnost lze rozpoznat podle několika míst ve větě, kde se typicky skrývá. Jsou
to přívlastky před výčtem („noví a stávající…“, „všechny smlouvy a dodatky uzavřené…“),
podmínky připojené na konec dlouhé věty („…pro věrné zákazníky“, „…při splnění podmínek“),
zápory spojené s časovým určením („nemusíte hned“, „není nutné teď“) a kvantifikátory, které
lze vztáhnout k různým skupinám. V mluvené řeči se k tomu přidává prozódie: důraz může jedno
čtení zesílit a druhé ztlumit. Silným znakem je situace, kdy se mluvčí později dovolává užšího
čtení, než jaké posluchač pochopil, a tvrdí, že „to přece bylo řečeno“. Ve výslechu je znakem
otázka obsahující víc tvrzení najednou, na kterou je očekávána jednoslovná odpověď.

U posluchače se vzorec projevuje až zpětně, typicky zklamáním: nabídka byla užší, závazek
širší, souhlas obsáhlejší, než se zdálo. Takový rozdíl mezi slyšeným a „platným“ obsahem je
strukturně příbuzný s tím, co kompendium popisuje jako
[iluzorní komplexitu](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md); u rozsahové
dvojznačnosti ale nejde o množství textu, nýbrž o jeden přesně umístěný operátor.

Pro rozlišení náhodné a úmyslné dvojznačnosti je užitečné sledovat opakování. Náhodná
rozsahová dvojznačnost se objeví jednou a mluvčí ji při dotazu ochotně rozřeší. Úmyslná se
vrací vždy na stejném místě, typicky u podmínek, které omezují výhodu, nebo u závazků, které
rozšiřují povinnost, a při dotazu se mluvčí raději odvolá na obecnou formulaci. Grice
upozornil, že posluchač běžně předpokládá spolupráci mluvčího a vyvozuje z výpovědi to, co by
mluvčí musel myslet, kdyby spolupracoval (Grice 1975). Kde se tento předpoklad opakovaně
ukáže jako mylný, jde o informaci o mluvčím, nikoli o selhání posluchače.

## Legitimní a manipulativní užití

Rozsahová dvojznačnost je v běžné řeči všudypřítomná a většinou neškodná, protože kontext a
spolupráce mluvčího ji rozřeší. Legitimní je také v literatuře a v humoru, kde je s ní hraní
vědomé. Legislativní a smluvní praxe se snaží rozsahové dvojznačnosti odstraňovat, protože
vedou ke sporům; přesná formulace podmínek je tam známkou poctivosti. V ericksonovské hypnóze
se nepřímé formulace odůvodňují tím, že klientovi ponechávají prostor, jak na sugesci odpoví
(Erickson, Rossi a Rossi 1976), a rozsahová dvojznačnost je v tomto výkladu jednou z cest k
takové otevřenosti.

Manipulativní užití staví na asymetrii: mluvčí ví, které čtení bude rozhodující, posluchač ne.
V prodeji tak vzniká dojem širší výhody, ve smlouvách širší závazek, ve skupinových pravidlech
prostor pro dodatečně přísnější výklad a ve výslechu odpověď, která potvrzuje víc, než
vyslýchaný chtěl. Tversky a Kahneman ukázali, že už samotný způsob, jakým jsou volby
formulovány, mění rozhodnutí lidí, i když jsou věcně totožné (Tversky a Kahneman 1981).
Rozsahová dvojznačnost tuto citlivost na formulaci vyhrocuje tím, že věcný obsah přímo
ponechává nejistý.

## Stav důkazů

Rozsah operátorů je dobře popsaný sémantický jev a jeho vliv na porozumění je nesporný
(Levinson 1983). Tvrzení Milton-modelu, že rozsahová dvojznačnost má zvláštní hypnotickou nebo
sugestivní účinnost, však empiricky ověřeno není. Přehledy výzkumu NLP nenacházejí podporu
pro ústřední tvrzení oboru a upozorňují na metodologické slabiny dostupných studií (Heap 1988;
Witkowski 2010). Studie, která by izolovala právě rozsahovou dvojznačnost jako nástroj vlivu,
v těchto přehledech uváděna není.

Výzkum mimo NLP však podporuje opatrnost. Práce o rámování rozhodnutí doložila, že formulace
mění volbu (Tversky a Kahneman 1981), a výzkum svědecké paměti doložil, že znění otázky mění
odpověď i vzpomínku (Loftus a Palmer 1974). Oba výsledky se týkají jazyka obecně, ne
Milton-modelu, ale vysvětlují, proč je rozsahová dvojznačnost v nabídkách a výsleších
nebezpečná i bez jakékoli hypnózy. Pro čtenáře kompendia je tedy rozumné brát vzorec vážně
jako zdroj nedorozumění a zneužití, a zároveň nepřisuzovat mu skrytou moc, kterou mu připisují
výcvikové texty.

## Obrana a zotavení

Obranou je výslovné určení dosahu. Otázka „vztahuje se ta podmínka i na…?“ nebo parafráze
„rozumím tomu tak, že… platí pro obojí, je to tak?“ přiměje mluvčího rozhodnout. U nabídek a
smluv pomáhá trvat na písemném znění a číst podmínky odděleně od prodejní řeči. Ve výslechu a
při svědecké výpovědi je legitimní odpovídat na složené otázky po částech a požádat o jejich
rozdělení; kvalitní postupy forenzního rozhovoru takové otázky samy nepoužívají. Výzkum
odolnosti vůči přesvědčování ukazuje, že znalost technik předem zvyšuje schopnost odolat jim
(McGuire 1964), a pomalé, záměrné čtení podmínek je přesně ten druh pečlivého zpracování,
který snižuje vliv okrajových podnětů (Petty a Cacioppo 1986).

Zotavení se týká hlavně situací, kdy člověk kvůli rozsahové dvojznačnosti přijal závazek,
který by při jasné formulaci odmítl. Kromě právní a finanční pomoci je důležité i
psychologické zpracování: lidé mají sklon vinit se z „hlouposti“, přestože dvojznačnost byla
vytvořena právě tak, aby ji běžný posluchač nezachytil. Pojmenování mechanismu pomáhá přesunout
odpovědnost tam, kam patří, a obnovit důvěru ve vlastní úsudek.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – příbuzný vzorec (Milton-model, Phonological ambiguity)
- [Syntaktická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/syntakticka-dvojznacnost.md) – příbuzný vzorec (Milton-model, Syntactic ambiguity)
- [Interpunkční dvojznačnost](@/kompendium/nlp-vzorce/milton-model/interpunkcni-dvojznacnost.md) – příbuzný vzorec (Milton-model, Punctuation ambiguity)
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – příbuzný vzorec (Milton-model, Presuppositions (Milton Model))
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzný vzorec (Jazykové presupozice, Loaded questions)

**V kompendiu**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Syntaktická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/syntakticka-dvojznacnost.md) – předchozí vzorec rodiny
- [Interpunkční dvojznačnost](@/kompendium/nlp-vzorce/milton-model/interpunkcni-dvojznacnost.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
