+++
title = "Jazykové presupozice"
description = "Rodina vzorců, ve kterých výpověď mlčky předpokládá sporný obsah: lingvistický základ presupozic, jejich dvojí užití v NLP, detekce, stav důkazů a obrana."
weight = 6
sort_by = "weight"
template = "kompendium/section.html"
page_template = "kompendium/page.html"
insert_anchor_links = "right"

[extra]
tags = ["nlp", "nlp-presupozice"]
categories = ["academic"]
parent = "kompendium-nlp-vzorce"
toc = true
lang = "cs"
keywords = ["Jazykové presupozice", "Linguistic presuppositions", "NLP"]
schema_type = "DefinedTermSet"
nlp_schema = 1
nlp_family = "presupozice"
nlp_code = "06"
nlp_en = "Linguistic presuppositions"
nlp_size = 19
nlp_members = ["jazykove-presupozice", "existencni-presupozice", "presupozice-casovych-vet", "poradove-cislovky", "presupozice-nebo", "predikaty-uvedomeni", "komentarova-adverbia", "slovesa-zmeny-casu", "opakovaci-slova", "kvalifikatory-jen-i", "srovnavaci-presupozice", "otazky-s-presupozici", "vztazne-vety-presupozice", "kontrafaktualni-podminky", "faktivni-slovesa", "implikativni-slovesa", "rozstepene-vety", "presupozice-v-reklame", "presupozice-ve-vyslechu"]
nlp_types = ["pattern"]
nlp_words = 1243
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "chomsky-1965", "druckman-swets-1988", "erickson-rossi-rossi-1976", "grice-1975", "herman-1992", "kahneman-2011", "levinson-1983", "lifton-1961", "loftus-palmer-1974", "mcguire-1964", "oconnor-seymour-1990", "passmore-rowson-2019", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010"]
+++

# Jazykové presupozice

## Co rodina zahrnuje

Rodina jazykových presupozic shromažďuje vzorce, ve kterých výpověď nepodává sporný obsah
jako tvrzení, ale jako předpoklad, ze kterého se vychází. Zastřešující heslo
[Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) popisuje
mechanismus obecně; další hesla se věnují jednotlivým gramatickým cestám, kterými se
předpoklad do věty dostává. Patří k nim pojmenování a přivlastnění, která předpokládají
existenci věci ([existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md)),
časové věty se spojkami „až“, „než“ nebo „poté co“
([presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md)),
pořadové výrazy, které předpokládají řadu
([pořadové číslovky](@/kompendium/nlp-vzorce/presupozice/poradove-cislovky.md)), nabídka mezi
variantami téhož ([presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md)),
slovesa vědění a uvědomění ([predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md)),
hodnoticí příslovce ([komentářová příslovce](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md)),
slovesa začátku, konce a trvání ([slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md)),
slova opakování ([opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md)) a
částice, které předpokládají další osoby nebo vyloučené výklady
([částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md)).
Druhou část rodiny tvoří srovnání, otázky s vneseným předpokladem, vztažné věty,
kontrafaktuální podmínky, faktivní a implikativní slovesa a vytýkací konstrukce, a dále dvě
hesla, která sledují presupozice v konkrétních prostředích: v reklamě a ve
[výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).

Rodina se překrývá se dvěma jinými rodinami katalogu. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) obsahuje heslo
[Presupozice v meta-modelu](@/kompendium/nlp-vzorce/meta-model/presupozice-v-meta-modelu.md),
které popisuje, jak se má předpoklad v řeči klienta rozpoznat a zpochybnit, a [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md)
obsahuje heslo [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md),
které popisuje opačný směr, tedy jak se předpoklady používají v hypnotickém jazyce. Tato
rodina stojí mezi nimi: popisuje jazykový mechanismus samotný, nezávisle na tom, kdo ho
používá a s jakým záměrem.

## Původ

Pojem presupozice vznikl ve filozofii jazyka a v lingvistice dávno před NLP. Levinson ve
svém přehledu pragmatiky sleduje jeho vývoj od úvah o tom, co předpokládá vlastní jméno, přes
spor o věty, jejichž předpoklad selhal, až k lingvistickým seznamům spouštěčů a k problému,
proč se presupozice ve složených větách někdy zachovávají a jindy mizí (Levinson 1983).
Paralelně vznikla Griceova teorie konverzace, podle níž posluchač vychází z předpokladu, že
mluvčí spolupracuje, tedy říká tolik, kolik je třeba, pravdivě, k věci a srozumitelně, a
doplňuje si to, co doslovné znění nevyjadřuje (Grice 1975). Právě tato ochota doplňovat
vysvětluje, proč posluchač nevyslovený předpoklad obvykle přijme bez námitky.

Bandler a Grinder znali lingvistiku své doby a v první knize o meta-modelu zařadili
presupozice mezi jevy, kterými si člověk ochuzuje [model světa](@/kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md); připojili i přehled
syntaktických prostředí, ve kterých se presupozice v angličtině vyskytují (Bandler a Grinder
1975; Chomsky 1965). V knize o hypnotických vzorcích Miltona Ericksona popsali tytéž konstrukce
z opačné strany, jako prostředek, kterým terapeut předkládá žádoucí výsledek jako samozřejmý
(Bandler a Grinder 1975b). Erickson a jeho spolupracovníci sami mluvili o implikaci a o
nepřímých formách sugesce, které ponechávají klientovi pocit, že závěr vyvodil sám (Erickson,
Rossi a Rossi 1976). Pozdější učebnice NLP převzaly zkrácené seznamy spouštěčů, většinou bez
lingvistického aparátu, ze kterého vzešly (O'Connor a Seymour 1990). Pro českého čtenáře je
podstatné, že tyto seznamy vznikly pro angličtinu. Čeština nemá členy, určitost vyjadřuje
zájmeny a slovosledem a částice se v ní vážou k aktuálnímu členění věty, takže řada
presupozic se v ní skrývá jinde, než naznačují překlady příruček.

## Jak rodinu číst defenzivně

Všechna hesla rodiny popisují tentýž dvouvrstvý mechanismus. Výpověď má vrstvu, o které se
jedná a ke které lze říct „ne“, a vrstvu předpokladů, které tvoří pozadí. Přímá odpověď na
první vrstvu druhou vrstvu nezpochybňuje, ale potvrzuje. V běžné komunikaci je to nezbytné a
neškodné: předpoklady nesou to, co je oběma stranám známé, a šetří slova. Pragmatika popisuje
i jev akomodace, kdy posluchač mlčky přijme předpoklad, který dosud sdílený nebyl, aby
rozhovor mohl plynout (Levinson 1983). Manipulativní užití staví právě na akomodaci. Do
vrstvy předpokladů se umístí sporný obsah, tedy vina, závislost, nevyhnutelné rozhodnutí,
souhlas skupiny nebo hodnocení adresáta, a jeho odmítnutí pak vyžaduje přerušit tok rozhovoru
a pojmenovat něco, co nikdo výslovně neřekl.

Pro defenzivní čtení je proto rozhodující jediná otázka: je předpoklad sdílený a ověřitelný,
nebo je nový a sporný? Každé heslo rodiny k tomu nabízí kontrolní postup, který spočívá v
tom, že pozorovatel předpoklad vytáhne z věty a vysloví ho jako samostatné tvrzení. Pokud by
takové tvrzení vyvolalo námitku nebo vyžadovalo doklad, výpověď ho zakrývala. Druhým
společným prvkem je mocenské uspořádání rozhovoru. Presupozice působí nejsilněji tam, kde
adresát nemá prostor zastavit se, kde mluví s autoritou nebo kde je pod časovým tlakem. Model
pravděpodobnosti elaborace popisuje, že při nízké motivaci nebo kapacitě zpracovávat sdělení
lidé hodnotí obsah podle okrajových vodítek, nikoli podle argumentů (Petty a Cacioppo 1986).
Presupozice argument vůbec nepodává, takže dokud si ho posluchač sám nevyjádří, není co
hodnotit.

Třetím společným prvkem je kumulace. Jednotlivá presupozice je zřídka sama o sobě
nebezpečná. Nebezpečí vzniká opakováním, kdy se tentýž předpoklad objevuje v mnoha
rozhovorech, a hromaděním, kdy jedna výpověď nese několik předpokladů naráz. Kahneman
popisuje, že známost a snadnost zpracování vyvolávají pocit pravdivosti (Kahneman 2011);
předpoklad, který se opakuje, se stává známým, a tím i důvěryhodným, přestože nikdy nebyl
vysloven jako tvrzení. V kontrolujících vztazích a uzavřených skupinách tak vzniká sdílená
verze skutečnosti, která se nikdy neprojednávala. Kompendium tento jev sleduje v
[detekční signatuře gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md)
a v souvislosti s jazykem ideologických systémů ho Lifton popsal jako jazyk, který nálepkami
a hotovými formulemi ukončuje přemýšlení (Lifton 1961).

## Stav důkazů

U této rodiny je třeba pečlivě oddělit dvě úrovně tvrzení. První úrovní je lingvistický
popis: spouštěče presupozic, test zachování pod záporem, vyvratitelnost v kontextu a problém
projekce patří do standardního obsahu pragmatiky a nejsou sporné (Levinson 1983). K této
úrovni patří i dobře doložené zjištění, že formulace otázky může posunout odpovědi a pozdější
vzpomínky dotazovaného, které má přímé důsledky pro výslech a svědeckou výpověď (Loftus a
Palmer 1974). Druhou úrovní jsou specifická tvrzení NLP: že presupozice obcházejí vědomou
kritiku, prohlubují trans nebo spolehlivě vedou k přijetí sugesce. Tato tvrzení se v primární
literatuře opírají o rozbor přepisů sezení a o zkušenost praktiků, ne o kontrolované
experimenty (Bandler a Grinder 1975b).

Přehledy výzkumu NLP se týkají převážně jiných tvrzení oboru, zejména reprezentačních
systémů, a nenacházejí podporu ani tam, kde testovatelná tvrzení existují (Sharpley 1987;
Witkowski 2010). Hodnocení amerických národních akademií nenašlo pro tvrzení NLP o ovlivňování
lidí dostatečnou empirickou oporu (Druckman a Swets 1988) a kritický přehled z oblasti
koučinku konstatuje přetrvávající nedostatek kvalitních studií (Passmore a Rowson 2019).
Poctivý závěr pro celou rodinu zní, že mechanismus, o který se opírá, je reálný a dobře
popsaný, ale síla a spolehlivost účinku, kterou mu NLP připisuje, nebyly ověřeny. Hesla
rodiny proto popisují presupozice jako rozpoznatelnou strukturu rozhovoru, nikoli jako
techniku s prokázaným samostatným účinkem.

## Obrana

Obrana proti všem vzorcům rodiny vychází ze stejného principu: předpoklad vyslovit. Kdo
převede nevyslovené tvrzení na samostatnou větu, vrací ho do vrstvy, o které se jedná, a kde
ho lze odmítnout nebo ověřit. Druhou společnou obranou je neodpovídat na otázku, jejíž každá
odpověď předpoklad potvrzuje, a místo toho zpochybnit její východisko. Třetí obranou je
zpomalit, protože presupozice působí nejsilněji v rychlém sledu, kdy není prostor se vrátit;
prosba o čas, o písemnou formu nebo o přeformulování otázky je legitimní odpovědí. Výzkum
očkování proti přesvědčování ukazuje, že předchozí seznámení s oslabenou formou působení a s
jeho vyvrácením zvyšuje odolnost vůči pozdějšímu plnému působení (McGuire 1964); znalost
nejčastějších spouštěčů, kterou tato rodina nabízí, má podobnou funkci.

U lidí, na které se presupozice uplatňovaly dlouhodobě v kontrolujícím vztahu nebo v uzavřené
skupině, je součástí zotavení i zpětná rekonstrukce. Pomáhá vypsat, co o nich bylo v
rozhovorech předpokládáno, jaká „fakta“ o jejich minulosti, vlastnostech a budoucnosti se
opakovaly, a ke každému z nich doplnit, zda pro něj existuje nezávislý doklad. Takové
zmapování obvykle ukáže, že velká část obrazu, který člověk o sobě převzal, nebyla nikdy
tvrzena ani doložena, jen předpokládána. Herman popisuje obnovu vlastního hlasu a vlastního
výkladu zkušenosti jako jádro zotavení po dlouhodobém nátlaku (Herman 1992) a tato práce
probíhá nejlépe v bezpečném vztahu, ve kterém má člověk znovu právo na vlastní popis událostí.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Vzorce rodiny

| Kód | Vzorec | Anglicky | Druh | Užití | Riziko |
|-----|--------|----------|------|-------|--------|
| `NLP-06.01` | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) | Linguistic presuppositions | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.02` | [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) | Existential presupposition | vzorec | terapeutické i vlivové | střední |
| `NLP-06.03` | [Presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) | Subordinate clauses of time | vzorec | terapeutické i vlivové | střední |
| `NLP-06.04` | [Pořadové číslovky](@/kompendium/nlp-vzorce/presupozice/poradove-cislovky.md) | Ordinal numerals | vzorec | terapeutické i vlivové | střední |
| `NLP-06.05` | [Presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md) | Use of „or“ | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.06` | [Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) | Awareness predicates | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.07` | [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) | Commentary adverbs and adjectives | vzorec | terapeutické i vlivové | střední |
| `NLP-06.08` | [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) | Change-of-time verbs and adverbs | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.09` | [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) | Repetitive cue words | vzorec | terapeutické i vlivové | střední |
| `NLP-06.10` | [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) | Qualifiers only, even, too | vzorec | terapeutické i vlivové | střední |
| `NLP-06.11` | [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) | Comparatives as presuppositions | vzorec | terapeutické i vlivové | střední |
| `NLP-06.12` | [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) | Loaded questions | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.13` | [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) | Relative clauses | vzorec | terapeutické i vlivové | střední |
| `NLP-06.14` | [Kontrafaktuální podmínky](@/kompendium/nlp-vzorce/presupozice/kontrafaktualni-podminky.md) | Counterfactual conditionals | vzorec | terapeutické i vlivové | střední |
| `NLP-06.15` | [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) | Factive verbs | vzorec | terapeutické i vlivové | vysoké |
| `NLP-06.16` | [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) | Implicative verbs | vzorec | terapeutické i vlivové | střední |
| `NLP-06.17` | [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) | Cleft sentences | vzorec | terapeutické i vlivové | střední |
| `NLP-06.18` | [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) | Presuppositions in advertising | vzorec | převážně vlivové | střední |
| `NLP-06.19` | [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) | Presuppositions in questioning and testimony | vzorec | převážně vlivové | vysoké |

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

- [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) – celý katalog a jeho rodiny
- [Ericksonovská hypnóza](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/_index.md) – předchozí rodina katalogu
- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) – další rodina katalogu
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání vzorců této rodiny

<!-- kompendium:nlp-vazby:end -->
