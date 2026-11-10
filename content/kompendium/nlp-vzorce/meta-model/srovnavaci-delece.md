+++
title = "Srovnávací vypuštění"
description = "Srovnání bez uvedeného měřítka („lepší“, „víc“, „málo“): kde jde o běžnou zkratku a kde o posuvnou laťku, kterou nelze nikdy dosáhnout ani zpochybnit."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-meta-model", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Srovnávací vypuštění", "Comparative deletion", "srovnávací delece", "nespecifikované srovnání", "Meta-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-03.06"
nlp_slug = "srovnavaci-delece"
nlp_family = "meta-model"
nlp_family_code = "03"
nlp_family_title = "Meta-model"
nlp_family_en = "Meta Model"
nlp_part = "meta-model"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Comparative deletion"
nlp_aliases = ["srovnávací delece", "nespecifikované srovnání"]
nlp_use = "vliv"
nlp_use_cs = "převážně vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "meta-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["meta-model"]
nlp_related = ["vypousteni", "prosta-delece", "srovnavaci-delece-milton", "kvalifikatory-jen-i", "srovnavaci-presupozice", "kontrastni-ramec", "nlp-v-reklame"]
nlp_related_declared = ["prosta-delece", "srovnavaci-delece-milton", "srovnavaci-presupozice", "nlp-v-reklame"]
nlp_kompendium = ["kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/prosta-delece.md", "kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md", "kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md", "kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
nlp_prev = "prosta-delece"
nlp_next = "ztraceny-performativ"
nlp_position = 6
nlp_family_size = 17
nlp_sources = ["bandler-grinder-1975", "beck-1976", "cialdini-2009", "grice-1975", "herman-1992", "mcguire-1964", "oconnor-seymour-1990", "passmore-rowson-2019", "sharpley-1987", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010", "van-der-linden-2023"]
nlp_sources_primary = ["bandler-grinder-1975", "oconnor-seymour-1990"]
nlp_sources_roots = ["grice-1975"]
nlp_sources_critical = ["beck-1976", "cialdini-2009", "herman-1992", "mcguire-1964", "passmore-rowson-2019", "sharpley-1987", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010", "van-der-linden-2023"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/meta-model.toml"
+++

# Srovnávací vypuštění

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-03.06` |
| **Rodina** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Comparative deletion |
| **Jiné názvy** | srovnávací delece, nespecifikované srovnání |
| **Obecnější vzorec** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Srovnávací vypuštění je v meta-modelu kategorie vět, ve kterých se používá srovnání, ale
chybí to, s čím se srovnává, nebo měřítko, podle kterého se srovnává. Věty „mohl by ses víc
snažit“, „tohle je lepší řešení“, „jsi moc citlivá“ nebo „nejsi dost dobrý“ obsahují druhý
stupeň přídavného jména, příslovce míry nebo slovo vyjadřující nedostatečnost, ale
posluchač z nich nepozná, oproti čemu je něco lepší, kolik je „víc“ a kde je hranice
„dost“. Autoři meta-modelu řadili tuto kategorii mezi vypouštění: ve hloubkové struktuře je
srovnání dvoučlenné, v povrchové větě zůstal jen jeden člen (Bandler a Grinder 1975). Jde o
zvláštní případ [prostého vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md),
který si zaslouží samostatnou pozornost, protože srovnání bez měřítka je jedním z
nejčastějších prostředků nenápadného hodnocení. V reklamě slibuje výhodu, kterou nelze
ověřit; ve vztazích, škole a práci vytváří laťku, kterou nelze dosáhnout, protože nikdo
neřekl, kde leží. Heslo patří do rodiny [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md).

## Původ a souvislosti

Kategorie pochází z rozboru terapeutických rozhovorů, v nichž si Bandler a Grinder všímali,
jak klienti o sobě mluví ve srovnáních bez měřítka: „nejsem dost dobrý rodič“, „ostatní to
zvládají lépe“. Terapeut podle nich takové věty otevírá otázkou, s kým nebo s čím se klient
srovnává a podle jakého kritéria, a tím často zjistí, že srovnávací skupina je idealizovaná
nebo že kritérium nikdy nebylo vysloveno (Bandler a Grinder 1975). Pozdější učebnice NLP
uvádějí srovnávací vypuštění mezi základními kategoriemi vypouštění (O'Connor a Seymour 1990).
V obráceném, záměrně neurčitém užití se srovnání bez měřítka objevuje v Milton-modelu a v
reklamě; heslo [Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md)
popisuje tuto podobu podrobněji. Mimo NLP je téma dobře známé z výzkumu úsudku. Tversky a
Kahneman ukázali, že lidé při odhadech vycházejí z výchozího bodu a upravují ho jen
nedostatečně (Tversky a Kahneman 1974), a že táž možnost se hodnotí jinak podle toho, k
jakému referenčnímu bodu se vztahuje (Tversky a Kahneman 1981). Cialdini popisuje princip
kontrastu, podle něhož se táž věc jeví jinak podle toho, co jí bezprostředně předcházelo
(Cialdini 2009). Srovnávací vypuštění tyto mechanismy využívá: protože měřítko není
vysloveno, posluchač si dosadí to, které mu nabízí kontext, nebo to, které ho nejvíc
znejišťuje.

## Struktura vzorce

Strukturálně má každé srovnání tři prvky: srovnávanou věc, srovnávací člen a hledisko
srovnání. Ve větě „tento model je o třetinu úspornější než loňský při stejném výkonu“ jsou
přítomny všechny tři. Ve větě „tento model je úspornější“ chybí srovnávací člen i přesné
hledisko. Ve větě „mohla bys být lepší“ chybí srovnávací člen, hledisko i míra, kterou by
bylo třeba dosáhnout. Meta-model rozlišuje několik podob téže mezery: druhý a třetí stupeň
bez srovnávacího členu („lepší“, „nejlepší“), příslovce míry bez hranice („moc“, „málo“,
„příliš“) a slova nedostatečnosti bez kritéria („nedost“, „ne úplně“). Na všechny odpovídá
otázkou po chybějícím prvku: ve srovnání s čím, podle čeho, kolik by stačilo. Autoři meta-modelu přitom zdůrazňovali,
že cílem otázky není spor o to, zda je hodnocení správné, ale obnovení informace, bez které se
o jeho správnosti vůbec nedá uvažovat (Bandler a Grinder 1975). Z pragmatického hlediska je
srovnání bez měřítka přijatelné tam, kde je srovnávací člen zřejmý z kontextu; kde zřejmý není,
mluvčí porušuje očekávání, že řekne tolik, kolik je pro porozumění potřeba (Grice 1975).

Druhým strukturálním rysem je posuvnost měřítka. Protože měřítko není vysloveno, mluvčí ho
může měnit, aniž by si toho posluchač všiml. Kdo splní jednu představu „lepšího“, slyší, že
„to ještě není ono“, protože srovnávací člen se mezitím posunul. Třetím rysem je
asymetrie odpovědnosti: mluvčí nic konkrétního netvrdil, a nemůže být tedy přistižen při
chybě, kdežto posluchač nese břemeno nekonečného zlepšování. V kombinaci se srovnávacími
presupozicemi, kdy věta předpokládá, že srovnání už proběhlo („ještě lepší“), se mezera
zakrývá ještě účinněji; podrobněji ji rozebírá heslo
[Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md).

## Detekční znaky

Srovnání bez měřítka je v řeči časté a často neškodné; „dnes je tepleji“ nikoho
neznejišťuje, protože srovnávací člen (včerejšek) je zřejmý z kontextu. Nátlakovou podobu
poznáme podle několika znaků. Prvním je hodnocení osoby, které nikdy neuvádí kritérium:
„mohla bys být lepší“, „nejsi dost samostatný“, „pořád to není ono“. Druhým je srovnání s
neurčenou skupinou: „ostatní jsou dál“, „normální lidé by to zvládli“, kde se srovnávací
skupina nedá ověřit a často je idealizovaná. Třetím je posouvání laťky, kdy splnění
jednoho požadavku vede k novému srovnání bez měřítka. Čtvrtým je odmítnutí upřesnit: na
otázku „co přesně by stačilo?“ přichází odpověď, že to člověk má poznat sám. Kompendium tyto
znaky podrobně rozebírá u [pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md)
a u [zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md),
kde neurčité srovnání udržuje člověka v trvalém pocitu nedostatečnosti. U člověka, na
kterého je takové hodnocení dlouhodobě uplatňováno, se objevuje neschopnost poznat, kdy je
práce hotová, přepracovanost, strach z dokončení a [vnitřní hlas](@/kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md), který srovnání bez
měřítka opakuje i v nepřítomnosti mluvčího. Kognitivní terapie popisuje příbuzné vzorce
jako nepřiměřené standardy, které se nedají splnit, a proto udržují depresivní hodnocení
vlastní osoby (Beck 1976).

## Legitimní a manipulativní užití

Legitimní srovnání má vyslovené nebo z kontextu zřejmé měřítko a je otevřené kontrole.
Školitel, který řekne, že „druhá kapitola je slabší než první, protože chybí rozbor
metod“, srovnává, ale uvádí, s čím a proč. Lékař, který řekne, že „tlak je vyšší než
minule“, má záznam, se kterým lze hodnotu porovnat. V terapii se otázka po měřítku
používá k tomu, aby klient rozpoznal, s kým se srovnává a zda je takové srovnání férové;
kognitivní terapie podobně vede k ověřování absolutních nebo nedosažitelných standardů na
konkrétních příkladech (Beck 1976). Manipulativní užití nastává, když srovnání bez měřítka
slouží k udržování závislosti na hodnocení mluvčího. Kdo jediný ví, kde je laťka, ten
rozhoduje o tom, zda druhý obstál. V reklamě se tatáž struktura používá k vytvoření dojmu
výhody bez ověřitelného tvrzení („účinnější“, „o polovinu více“ bez údaje, oproti čemu);
tuto oblast popisuje heslo [NLP v reklamě](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md).

## Stav důkazů

Vliv referenčního bodu a výchozí hodnoty na úsudek patří k nejlépe doloženým jevům
psychologie rozhodování (Tversky a Kahneman 1974; Tversky a Kahneman 1981). Tato zjištění
podporují obecnou myšlenku, že neurčené srovnání může ovlivnit hodnocení, ale nepocházejí z
NLP a nepotvrzují specifické tvrzení meta-modelu, že otázka po srovnávacím členu má sama
terapeutický účinek. Kontrolované studie, které by takový účinek izolovaly, v přehledech
výzkumu NLP chybějí; přehledy se soustředily hlavně na [reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md) a predikáty a
celkově nenašly oporu pro hlavní tvrzení oboru (Sharpley 1987; Witkowski 2010). Kritický
přehled užití NLP v koučinku konstatuje nedostatek kvalitních studií (Passmore a Rowson
2019). Pro čtenáře kompendia z toho plyne, že kategorie srovnávacího vypuštění je spolehlivý
pojem pro rozbor řeči, jehož opora leží v psychologii úsudku, ne v důkazech o NLP.

## Obrana a zotavení

Základní obranou je vyžádat si měřítko. Kdo slyší „mohla bys být lepší“, má legitimní nárok
zeptat se, v čem, oproti čemu a podle jakého kritéria, a pokud odpověď nepřijde, zacházet s
výrokem jako s neurčitým dojmem, ne s hodnocením. Ve škole a v práci pomáhá převést hodnocení
do písemné podoby s uvedenými kritérii; pak je zřejmé, zda se laťka posouvá. Druhou obranou je
všímat si srovnávací skupiny. Pokud se „ostatní“ nedají jmenovat nebo pokud jde o vybrané
nejlepší výkony, je srovnání nefér už svou stavbou. Třetí obranou je vlastní měřítko:
člověk, který si předem stanoví, co považuje za hotové, se méně snadno nechá vtáhnout do
nekonečného zlepšování podle cizí, nevyslovené laťky. Znalost vzorce působí podobně jako
očkování proti přesvědčování: kdo mechanismus pozná předem, je vůči němu odolnější (McGuire
1964; van der Linden 2023). V zotavení po dlouhodobém působení neurčitého srovnání pomáhá
rozpoznat vnitřní hlas, který laťku opakuje, a nahradit ho konkrétními kritérii, o kterých
člověk rozhoduje sám. Herman zdůrazňuje, že obnova sebeúcty po vztazích, v nichž
druhý soustavně určoval hodnotu člověka, probíhá postupně, ve vztazích, které posilují vlastní rozhodování člověka, a ne v izolaci
(Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Vypouštění](@/kompendium/nlp-vzorce/zakladni-pojmy/vypousteni.md) – příbuzný vzorec (Základní pojmy NLP, Deletion)
- [Prosté vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md) – příbuzný vzorec (Meta-model, Simple deletion)
- [Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md) – příbuzný vzorec (Milton-model, Comparative deletion (Milton Model))
- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – příbuzný vzorec (Jazykové presupozice, Qualifiers only, even, too)
- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Comparatives as presuppositions)
- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – příbuzný vzorec (Reframing a rámce, Contrast frame)
- [NLP v reklamě](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md) – příbuzný vzorec (Vliv a zneužití NLP, NLP in advertising)

**V kompendiu**

- [EA-2.5.2 Zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.5.3 Pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Prosté vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md) – předchozí vzorec rodiny
- [Ztracený performativ](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
