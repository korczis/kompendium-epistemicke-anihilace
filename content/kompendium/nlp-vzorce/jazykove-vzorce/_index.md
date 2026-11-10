+++
title = "Jazykové vzorce"
description = "Rodina jazykových vzorců NLP: pohyb po úrovních obecnosti, komunikační postoje Satirové, metafory a jednotlivá slova s vlivovým účinkem; původ, defenzivní čtení, důkazy a obrana."
weight = 20
sort_by = "weight"
template = "kompendium/section.html"
page_template = "kompendium/page.html"
insert_anchor_links = "right"

[extra]
tags = ["nlp", "nlp-jazykove-vzorce"]
categories = ["academic"]
toc = true
lang = "cs"
keywords = ["Jazykové vzorce", "Language patterns", "NLP"]
schema_type = "DefinedTermSet"
nlp_schema = 1
nlp_family = "jazykove-vzorce"
nlp_code = "20"
nlp_en = "Language patterns"
nlp_size = 20
nlp_members = ["hierarchie-idei", "chunking-nahoru", "chunking-dolu", "lateralni-chunking", "kategorie-satirove", "smirovatel", "obvinovatel", "pocitac", "rozptylovac", "vyrovnany", "terapeuticka-metafora", "izomorfni-metafora", "ale-a-a", "protoze", "zatim", "zkusit", "predstavte-si", "otazky-misto-tvrzeni", "slovni-baliky", "casove-presuny-v-jazyce"]
nlp_types = ["concept", "pattern"]
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "bateson-1972", "dilts-1999", "gordon-1978", "grice-1975", "haley-1973", "korzybski-1933", "langer-1978", "loftus-palmer-1974", "mcguire-1964", "miller-1956", "oconnor-seymour-1990", "passmore-rowson-2019", "satir-1972", "tosey-mathison-2009", "witkowski-2010", "van-der-linden-2023"]
+++

# Jazykové vzorce

## Co rodina zahrnuje

Rodina jazykových vzorců shromažďuje prvky řeči, které neurolingvistické programování popisuje mimo své dva velké jazykové modely, meta-model a Milton-model, a které se v tréninkové literatuře objevují jako samostatné nástroje. Na rozdíl od ostatních rodin nemá jednoho autora ani jednotnou teorii. Spojuje ji spíše to, že každý vzorec se dá rozpoznat přímo v řeči, často na jediném slově nebo na jediném přesunu v rozhovoru, a že u každého lze rozlišit užití, které porozumění otevírá, od užití, které ho uzavírá.

Rodina má čtyři skupiny. První tvoří pohyb po úrovních obecnosti: [hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) jako mapa a tři směry pohybu po ní, [chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) k třídám, účelům a hodnotám, [chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) k případům a podrobnostem a [laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) k jiným případům téže třídy (O'Connor a Seymour 1990). Druhou skupinu tvoří [komunikační kategorie Virginie Satirové](@/kompendium/nlp-vzorce/jazykove-vzorce/kategorie-satirove.md), pět postojů, kterými lidé reagují pod tlakem: [usmiřovatel](@/kompendium/nlp-vzorce/jazykove-vzorce/smirovatel.md), [obviňovatel](@/kompendium/nlp-vzorce/jazykove-vzorce/obvinovatel.md), [počítač](@/kompendium/nlp-vzorce/jazykove-vzorce/pocitac.md), [rozptylovač](@/kompendium/nlp-vzorce/jazykove-vzorce/rozptylovac.md) a [vyrovnaný](@/kompendium/nlp-vzorce/jazykove-vzorce/vyrovnany.md) postoj (Satir 1972). Každý z nich má v katalogu vlastní stránku, protože každý má jiné detekční znaky, jinou diferenciální diagnostiku a jiná rizika zneužití.

Třetí skupinu tvoří metafory: [terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) a její strukturně přesná podoba, [izomorfní metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/izomorfni-metafora.md), tedy příběh o jiné situaci, jehož vztahy odpovídají situaci posluchače (Gordon 1978). Čtvrtou skupinu tvoří jednotlivá slova a konstrukce, kterým NLP přisuzuje zvláštní účinek: záměna „ale“ za „a“, slova „protože“, „zatím“ a „zkusit“, výzva „představte si“, otázky místo tvrzení, [hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) a časové posuny v jazyce. Společné mají to, že působí na rovině, které si posluchač obvykle nevšímá, protože jde o malá, běžná slova.

## Původ

Jazykové vzorce této rodiny mají různý původ. Pohyb po úrovních obecnosti navazuje na Korzybského obecnou sémantiku, která upozorňovala na nebezpečí zaměňování úrovní abstrakce (Korzybski 1933), na Batesonovu práci s logickými typy (Bateson 1972) a na Millerův pojem seskupování informací do celků, z něhož pochází slovo „chunk“ (Miller 1956). V samotném NLP se dva zakládající jazykové modely dají číst jako dva směry tohoto pohybu: meta-model vede řeč dolů ke konkrétnímu (Bandler a Grinder 1975) a Milton-model nahoru k obecnému a neurčitému (Bandler a Grinder 1975b). Dilts později zařadil zobecnění, [rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) a analogii mezi konverzační vzorce, kterými se mění rámec přesvědčení (Dilts 1999).

Komunikační kategorie pocházejí od Virginie Satirové, jedné ze tří terapeutek a terapeutů, jejichž práci Bandler a Grinder v sedmdesátých letech modelovali (Satir 1972). Metafory mají kořen v práci Miltona Ericksona, který podle svých vykladačů často místo přímé rady vyprávěl příběh (Haley 1973), a v NLP je soustavně rozpracoval David Gordon (Gordon 1978). Jednotlivá slova s údajným vlivovým účinkem pocházejí převážně z pozdější tréninkové literatury a seminářů a jejich původ je obtížné doložit. Některá z nich mají nezávislou oporu ve výzkumu sociální psychologie: Langer a spolupracovníci například ukázali, že žádost doplněná o zdánlivé zdůvodnění se slovem „protože“ zvýšila ochotu vyhovět u drobné prosby, i když zdůvodnění nic nového neříkalo, kdežto u náročnější prosby tento účinek zmizel (Langer, Blank a Chanowitz 1978). Výzkum Loftusové a Palmera zase ukázal, jak volba jediného slova v otázce mění to, co si svědek vybaví (Loftus a Palmer 1974).

## Jak rodinu číst defenzivně

Pro defenzivní čtení této rodiny platí tři zásady. První zásadou je, že vzorec sám není manipulací. Pohyb nahoru k hodnotám, konkretizace, analogie, metafora i slovo „protože“ jsou běžnou součástí každého rozhovoru. Manipulací se stávají teprve tehdy, když slouží ke skrytému přesunu odpovědnosti, souhlasu nebo pozornosti, ze kterého těží mluvčí na úkor posluchače. Pozorovatel se proto nemá ptát, zda mluvčí vzorec použil, ale k čemu ho použil a zda posluchač mohl přesun rozpoznat a odmítnout.

Druhou zásadou je, že vzorce této rodiny působí hlavně tím, že zůstávají nepozorovány. Kdo si všimne, že odpověď na jeho otázku po ceně se přesunula k hodnotě svobody, že srovnání s jinými případy rozpustilo konkrétní odpovědnost nebo že slovo „zatím“ vložilo do věty předpoklad budoucí změny, má přesun v moci. Grice ukázal, že posluchač z porušení konverzačních zásad vyvozuje skrytý význam (Grice 1975); defenzivní čtení spočívá v tom, že si posluchač tento proces uvědomí a skrytý význam vysloví nahlas.

Třetí zásadou, která se týká zvláště komunikačních kategorií Satirové, je, že popis postoje není diagnóza osoby. Kategorie popisují reakce lidí pod tlakem, ne jejich povahu, a jejich nejčastější zneužití spočívá v tom, že se z nich stanou nálepky, kterými se stížnost člověka vysvětlí jeho „typem“. Usmiřování může být rozumnou ochranou ve vztahu, kde nesouhlas přináší trest, a rozptylování projevem úzkosti nebo traumatu. Kompendium proto u každého postoje uvádí i diferenciální rozlišení od klinických stavů a od kulturních norem.

V živém rozhovoru se vzorce této rodiny zřídka vyskytují samostatně. Obviňující postoj se často spojuje s univerzálními zobecněními, superrozumný postoj s nominalizacemi a odborným slovníkem, rozptylování s laterálními přesuny k jiným tématům a usmiřování s rychlým souhlasem na úrovni obecných hodnot. Pozorovatel proto nemusí určit každý vzorec zvlášť. Stačí, když si všimne směru, kterým se rozhovor pohybuje, a otázky, kterou po sobě zanechal nezodpovězenou. Tento pohled spojuje rodinu s jinými částmi kompendia, například s popisem [tematické diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md).

## Stav důkazů

Důkazní stav rodiny je nerovnoměrný a pro každou skupinu je třeba ho posuzovat zvlášť. Pohyb po úrovních obecnosti má solidní zázemí v logice, filozofii jazyka a teorii komunikace (Korzybski 1933; Bateson 1972), ale specifická tvrzení NLP o „chunkingu“ jako o naučitelné dovednosti se zvláštním účinkem kontrolovaným výzkumem ověřena nebyla. Komunikační kategorie Satirové jsou klinickým popisem z rodinné terapie, ne výzkumně ověřenou typologií (Satir 1972). Terapeutická metafora je v NLP doložena hlavně případovými popisy. Jednotlivá vlivová slova mají místy oporu ve výzkumu sociální psychologie, ale tento výzkum vznikl mimo NLP a jeho výsledky jsou zpravidla skromnější a podmíněnější, než jak je podává tréninková literatura (Langer, Blank a Chanowitz 1978).

Pro NLP jako celek platí závěry kritických přehledů. Witkowski na základě databáze výzkumů NLP dospěl k závěru, že naprostá většina kontrolovaných studií tvrzení oboru nepodporuje (Witkowski 2010). Tosey a Mathison upozorňují, že NLP často přebírá myšlenky z jiných oborů a při tom posouvá jejich obsah, aniž by k nim přidalo vlastní empirické ověření (Tosey a Mathison 2009). Kritický přehled pro oblast koučinku konstatuje nedostatek kvalitních studií (Passmore a Rowson 2019). Pro čtenáře kompendia z toho plyne rozlišení, které prochází celou rodinou: jazykové jevy, které vzorce popisují, jsou skutečné a některé dobře prozkoumané, ale tvrzení, že NLP nabízí zvláštní metodu, jak je používat účinněji než jiné tradice, doloženo není.

## Obrana

Obrana proti jazykovým vzorcům této rodiny stojí na jejich zviditelnění. U pohybu po úrovních obecnosti pomáhá pojmenovat úroveň, na které je shoda, a oddělit souhlas s hodnotou od souhlasu s konkrétním krokem. U analogií pomáhá ptát se, v čem se srovnávané případy liší. U komunikačních postojů pomáhá všímat si nesouladu mezi slovy a situací a odmítat typologii jako argument o faktech. U jednotlivých slov pomáhá zpomalit a ptát se, jaký předpoklad slovo do věty vkládá: co znamená „zatím“, co vlastně zdůvodňuje „protože“, co se skrývá za „zkusit“.

Výzkum odolnosti vůči přesvědčování ukazuje, že předchozí setkání s oslabenou podobou útoku a s jeho vyvrácením zvyšuje schopnost odolat (McGuire 1964), a novější práce o předběžném očkování proti dezinformacím dospívají k podobnému závěru pro rozpoznávání manipulativních technik obecně (van der Linden 2023). Smyslem této rodiny v kompendiu je právě takové očkování: kdo zná tvar vzorce, rozpozná ho i v podobě, se kterou se dosud nesetkal. U lidí, kteří byli dlouho vystaveni prostředí, kde se jazyk těchto vzorců používal soustavně, bývá součástí zotavení návrat ke konkrétnímu, ověřitelnému a osobnímu jazyku, ve kterém lze znovu samostatně posoudit, co se stalo a kdo za co odpovídá. Souvislosti s dalšími jazykovými rodinami katalogu nabízí [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) a [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Vzorce rodiny

| Kód | Vzorec | Anglicky | Druh | Užití | Riziko |
|-----|--------|----------|------|-------|--------|
| `NLP-20.01` | [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) | Hierarchy of ideas | pojem | terapeutické i vlivové | střední |
| `NLP-20.02` | [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) | Chunking up | vzorec | terapeutické i vlivové | vysoké |
| `NLP-20.03` | [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) | Chunking down | vzorec | terapeutické i vlivové | střední |
| `NLP-20.04` | [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) | Lateral chunking | vzorec | terapeutické i vlivové | střední |
| `NLP-20.05` | [Komunikační kategorie Virginie Satirové](@/kompendium/nlp-vzorce/jazykove-vzorce/kategorie-satirove.md) | Satir categories | pojem | terapeutické i vlivové | střední |
| `NLP-20.06` | [Usmiřovatel](@/kompendium/nlp-vzorce/jazykove-vzorce/smirovatel.md) | Placater | pojem | terapeutické i vlivové | střední |
| `NLP-20.07` | [Obviňovatel](@/kompendium/nlp-vzorce/jazykove-vzorce/obvinovatel.md) | Blamer | pojem | terapeutické i vlivové | střední |
| `NLP-20.08` | [Počítač](@/kompendium/nlp-vzorce/jazykove-vzorce/pocitac.md) | Computer (super-reasonable) | pojem | terapeutické i vlivové | střední |
| `NLP-20.09` | [Rozptylovač](@/kompendium/nlp-vzorce/jazykove-vzorce/rozptylovac.md) | Distracter | pojem | terapeutické i vlivové | nízké |
| `NLP-20.10` | [Vyrovnaný](@/kompendium/nlp-vzorce/jazykove-vzorce/vyrovnany.md) | Leveller | pojem | převážně terapeutické | nízké |
| `NLP-20.11` | [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) | Therapeutic metaphor | vzorec | terapeutické i vlivové | střední |
| `NLP-20.12` | [Izomorfní metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/izomorfni-metafora.md) | Isomorphic metaphor | vzorec | terapeutické i vlivové | střední |
| `NLP-20.13` | [Záměna „ale“ za „a“](@/kompendium/nlp-vzorce/jazykove-vzorce/ale-a-a.md) | But versus and | vzorec | terapeutické i vlivové | nízké |
| `NLP-20.14` | [Slovo „protože“](@/kompendium/nlp-vzorce/jazykove-vzorce/protoze.md) | Because | vzorec | převážně vlivové | střední |
| `NLP-20.15` | [Slovo „zatím“](@/kompendium/nlp-vzorce/jazykove-vzorce/zatim.md) | Yet | vzorec | terapeutické i vlivové | nízké |
| `NLP-20.16` | [Slovo „zkusit“](@/kompendium/nlp-vzorce/jazykove-vzorce/zkusit.md) | Try | vzorec | terapeutické i vlivové | nízké |
| `NLP-20.17` | [Výzva „představte si“](@/kompendium/nlp-vzorce/jazykove-vzorce/predstavte-si.md) | Imagine | vzorec | terapeutické i vlivové | střední |
| `NLP-20.18` | [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) | Questions instead of statements | vzorec | terapeutické i vlivové | střední |
| `NLP-20.19` | [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) | Loaded words | vzorec | převážně vlivové | vysoké |
| `NLP-20.20` | [Časové posuny v jazyce](@/kompendium/nlp-vzorce/jazykove-vzorce/casove-presuny-v-jazyce.md) | Verb tense shifts | vzorec | terapeutické i vlivové | střední |

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Gordon, D. (1978). *Therapeutic Metaphors: Helping Others through the Looking Glass*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Haley, J. (1973). *Uncommon Therapy: The Psychiatric Techniques of Milton H. Erickson, M.D.* New York: W. W. Norton.
- Korzybski, A. (1933). *Science and Sanity: An Introduction to Non-Aristotelian Systems and General Semantics*. Lancaster: International Non-Aristotelian Library.
- Langer, E. J., Blank, A., & Chanowitz, B. (1978). The mindlessness of ostensibly thoughtful action: The role of „placebic“ information in interpersonal interaction. *Journal of Personality and Social Psychology*, 36(6), 635–642.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review*, 63(2), 81–97.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Satir, V. (1972). *Peoplemaking*. Palo Alto: Science and Behavior Books.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

- [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) – celý katalog a jeho rodiny
- [Cíle a výsledky](@/kompendium/nlp-vzorce/cile-a-vysledky/_index.md) – předchozí rodina katalogu
- [Vliv a zneužití NLP](@/kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md) – další rodina katalogu
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání vzorců této rodiny

<!-- kompendium:nlp-vazby:end -->
