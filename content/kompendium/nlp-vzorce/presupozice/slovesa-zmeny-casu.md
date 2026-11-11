+++
title = "Slovesa změny času a stavu"
description = "Slovesa začít, přestat, pokračovat a příslovce už, ještě, pořád předpokládají předchozí stav; jak se tím vkládá minulost, kterou nikdo nedoložil, a jak tomu čelit."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Slovesa změny času a stavu", "Change-of-time verbs and adverbs", "slovesa změny stavu", "přestat, začít, ještě, už", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.08"
catalog_slug = "slovesa-zmeny-casu"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Change-of-time verbs and adverbs"
catalog_aliases = ["slovesa změny stavu", "přestat, začít, ještě, už"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["presupozice-casovych-vet", "opakovaci-slova", "otazky-s-presupozici", "implikativni-slovesa", "presupozice-ve-vyslechu", "casove-kodovani", "zatim", "casove-presuny-v-jazyce"]
catalog_related_declared = ["presupozice-casovych-vet", "opakovaci-slova", "otazky-s-presupozici", "casove-presuny-v-jazyce", "presupozice-ve-vyslechu"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/presupozice/opakovaci-slova.md", "kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md", "kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
catalog_prev = "komentarova-adverbia"
catalog_next = "opakovaci-slova"
catalog_position = 8
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "erickson-rossi-rossi-1976", "grice-1975", "heap-1988", "herman-1992", "levinson-1983", "loftus-palmer-1974", "mcguire-1964", "sturt-2012"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
catalog_sources_critical = ["heap-1988", "herman-1992", "loftus-palmer-1974", "mcguire-1964", "sturt-2012"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.toml"
+++

# Slovesa změny času a stavu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.08` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Change-of-time verbs and adverbs |
| **Jiné názvy** | slovesa změny stavu, přestat, začít, ještě, už |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Slovesa změny času a stavu jsou výrazy, které popisují začátek, konec nebo trvání děje:
„začít“, „přestat“, „pokračovat“, „skončit“, „zůstat“, „změnit se“, a s nimi příslovce „už“,
„ještě“, „pořád“, „stále“, „dosud“, „dál“ a „konečně“. Každý z nich předpokládá stav, který
předcházel. Věta „Přestal jsi pít“ předpokládá, že adresát pil; otázka „Pokračuješ ještě v
těch lžích?“ předpokládá, že lhal a že to trvá. Lingvistické přehledy řadí slovesa změny
stavu mezi základní spouštěče presupozic a ukazují, že předpoklad přetrvává i tehdy, když se
věta zneguje (Levinson 1983). V NLP jsou tato slova uvedena jak mezi presupozicemi, které
[meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) pomáhá u klienta rozpoznat, tak mezi prostředky Milton-modelu, kterými lze
žádoucí změnu předložit jako něco, co už probíhá (Bandler a Grinder 1975; Bandler a Grinder
1975b). Pro kompendium je vzorec mimořádně závažný, protože dokáže do rozhovoru vložit
minulost, o které se nikdy nejednalo.

## Původ a souvislosti

Nejznámějším příkladem tohoto vzorce je otázka, zda už dotazovaný přestal bít svou ženu,
kterou logika a rétorika uvádějí jako školní případ otázky s komplexním předpokladem: odpověď
„ano“ i „ne“ přiznává, že k bití docházelo. Lingvistika na podobných větách studovala, jak
se presupozice chovají v otázkách, záporech a podmínkách, a jak je kontext může zrušit
(Levinson 1983). Z hlediska konverzační logiky platí, že mluvčí by porušil zásady kooperace,
kdyby mluvil o ukončení děje, který nikdy neprobíhal, a posluchač proto předpokládá, že
probíhal (Grice 1975). Právě tato ochota je zdrojem síly vzorce.

Bandler a Grinder začlenili slovesa změny stavu do seznamu syntaktických prostředí, ve
kterých se presupozice objevují, a doporučovali terapeutům všímat si, co klient těmito
slovesy o své minulosti předpokládá (Bandler a Grinder 1975). V knize o hypnotických vzorcích
pak tatáž slova popsali jako způsob, jak o změně mluvit tak, jako by už začala (Bandler a
Grinder 1975b). Pro češtinu je důležité, že význam změny nese často i slovesný vid a
příslovce „už“ a „ještě“. Spojení „už ne“ a „ještě pořád“ předpokládají opačné stavy v
minulosti a čeština je užívá velmi hojně, takže vzorec může být méně nápadný než v
angličtině.

## Struktura vzorce

Vzorec spojuje dva časové body. Pozdější bod, o kterém výpověď mluví, nese tvrzení nebo
otázku. Dřívější bod, stav před změnou, se předpokládá. Manipulativní užití staví do
dřívějšího bodu sporný obsah, nejčastěji obvinění nebo negativní vlastnost, a do pozdějšího
bodu otázku, na kterou se dá snadno odpovědět. Kdo odpoví na pozdější bod, potvrdí dřívější, protože předpoklad slovesa změny stavu
přetrvává v otázce i pod záporem (Levinson 1983).
Příslovce „pořád“ a „ještě“ přidávají další vrstvu: předpokládají nejen dřívější stav, ale i
to, že trvá, a tím z jedné události dělají vlastnost. Příslovce „konečně“ naopak předpokládá,
že změna byla dlouho očekávána, a vkládá do výpovědi hodnocení dosavadního stavu jako
nežádoucího.

Ve výslechu a ve svědecké výpovědi má vzorec zvláštní riziko. Otázka, která předpokládá
dřívější stav, může dotazovaného vést k tomu, aby ho začal pokládat za skutečný. Experimenty
ukázaly, že formulace otázky ovlivňuje odhady i pozdější vzpomínky na událost (Loftus a
Palmer 1974). Proto standardy [forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)
doporučují otázky, které nepředpokládají nic, co dotazovaný sám neuvedl. Podrobněji tento
kontext rozebírá heslo [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).

## Varianty

Vzorec má tři hlavní podoby. Ukončovací slovesa („přestat“, „skončit“, „nechat“) předpokládají
dřívější děj a typicky slouží k obvinění, které se nevysloví. Počáteční slovesa („začít“,
„dostat se k“, „objevit se“) předpokládají předchozí absenci a v terapeutickém jazyce slouží
k tomu, aby se o žádoucí změně mluvilo jako o probíhající, například „kdy jste začal
pozorovat první zlepšení“ (Bandler a Grinder 1975b). Trvací slova („pokračovat“, „pořád“, „ještě“, „stále“) předpokládají
dřívější i současný stav a v obviňující řeči mění jednotlivou událost v trvalý rys. Úzce s
nimi souvisejí [opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md),
která předpokládají dřívější výskyt téhož děje, a [časové věty](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md),
které předpokládají celý děj vedlejší věty.

## Detekční znaky

Prvním znakem je sloveso ukončení nebo trvání vztažené k ději, který adresát nikdy
nepotvrdil, zejména k negativnímu chování nebo vlastnosti. Kontrolní postup spočívá v tom,
že pozorovatel z otázky vytáhne předpokládaný dřívější stav a vysloví ho samostatně: „Přestal
jsi lhát?“ se změní na „Tvrdím, že jsi lhal.“ Pokud tvrzení v této podobě vyžaduje doklad,
otázka ho zakrývala. Druhým znakem je spojení „už“ s otázkou typu ano–ne, při kterém obě
odpovědi potvrzují předpoklad. Třetím znakem je opakované „pořád“ nebo „ještě“ u popisu
adresátových reakcí, které z jednotlivých událostí vytváří charakteristiku („pořád se
urážíš“). Čtvrtým znakem je, že se předpokládaná minulost v rozhovorech postupně ustaluje a
začíná se o ní mluvit jako o známé věci. U adresáta to může vést k nejistotě ve vlastní
paměti a k přebírání cizího popisu vlastní minulosti; tento posun kompendium popisuje u
[pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md), kde se
opakované vnější hodnocení mění v sebepopis (Herman 1992).

## Legitimní a manipulativní užití

Legitimní užití je běžné tam, kde předchozí stav je doložený nebo nesporný. Lékař, který se
ptá, zda pacient pokračuje v užívání předepsaného léku, vychází ze záznamu. V terapii se
slovesa změny užívají k tomu, aby se pozornost klienta obrátila k pokroku, který sám popsal,
nebo aby se o změně mluvilo s nadějí. Erickson a jeho spolupracovníci pracovali s jazykem,
který změnu nepřikazuje, ale počítá s ní, a chápali ho jako nepřímou podporu klientovy
vlastní schopnosti měnit se (Erickson, Rossi a Rossi 1976). Hranicí je, zda předpokládaný
stav odpovídá zkušenosti klienta a zda klient může předpoklad bez obtíží opravit.

Manipulativní užití vkládá do předpokladu obvinění, diagnózu nebo trvalou negativní
vlastnost. Je typické v obviňujících rozhovorech v rodině a v partnerství, v nátlakových
rozhovorech na pracovišti a ve výslechu vedeném s předem hotovou verzí událostí. Jeho
nebezpečnost spočívá v tom, že adresát, který na otázku odpoví, předpoklad potvrdí (Levinson 1983), a ten
se pak může objevit v pozdějším shrnutí jako jeho vlastní výpověď.

## Stav důkazů

Lingvistický popis sloves změny stavu jako spouštěčů presupozic je pevný (Levinson 1983) a
vliv formulace otázek na výpovědi a vzpomínky je experimentálně doložen (Loftus a Palmer
1974). Tvrzení NLP, že tato slovesa v terapeutickém nebo hypnotickém jazyce spolehlivě
navozují změnu, však kontrolovanými studiemi ověřena nebyla (Bandler a Grinder 1975b).
Systematický přehled účinků NLP na zdravotní výsledky nenašel dostatek kvalitních studií, ze
kterých by bylo možné účinnost metody vyvodit (Sturt a kol. 2012), a rané hodnocení NLP
dospělo k obdobně skeptickému závěru o empiricky testovaných tvrzeních oboru (Heap 1988).
Pro čtenáře kompendia platí, že riziko vzorce ve výslechu je doložené obecnějším výzkumem
svědecké výpovědi, kdežto jeho terapeutický přínos zůstává nedoložený.

## Obrana a zotavení

Základní obranou je neodpovídat v rámci otázky a vrátit se k předpokladu: „Ptáš se, jestli
jsem přestal; já netvrdím, že jsem to dělal.“ Taková odpověď je pro adresáta mnohem
bezpečnější než „ano“ nebo „ne“. Druhou obranou je trvat na konkrétnosti: kdy, kde a jak se
předpokládaný stav projevoval a kdo ho pozoroval. Třetí obranou je v úředních a právních
situacích požádat o přeformulování otázky nebo o zaznamenání, že předpoklad otázky nebyl
přijat. Kdo zná nejčastější podoby vzorce předem, rozpozná je v reálné situaci rychleji;
výzkum očkování proti přesvědčování ukazuje, že předchozí seznámení s oslabenou formou
působení zvyšuje odolnost vůči jeho plné formě (McGuire 1964). Při zotavení po dlouhodobém
působení pomáhá rekonstruovat vlastní minulost z nezávislých zdrojů, jako jsou zápisky,
korespondence nebo svědectví blízkých, a oddělit to, co se skutečně dělo, od toho, co bylo v
rozhovorech jen předpokládáno. Herman zdůrazňuje, že obnova souvislého vyprávění vlastní
minulosti je jádrem zotavení po dlouhodobém nátlaku (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Sturt, J., Ali, S., Robertson, W., Metcalfe, D., Grove, A., Bourne, C., & Bridle, C. (2012). Neurolinguistic programming: A systematic review of the effects on health outcomes. *British Journal of General Practice*, 62(604), e757–e764.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) – příbuzné heslo (Jazykové presupozice, Subordinate clauses of time)
- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – příbuzné heslo (Jazykové presupozice, Repetitive cue words)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) – příbuzné heslo (Jazykové presupozice, Implicative verbs)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Časové kódování zkušenosti](@/kompendium/nlp-vzorce/casova-osa/casove-kodovani.md) – příbuzné heslo (Časová osa, Temporal coding of experience)
- [Slovo „zatím“](@/kompendium/nlp-vzorce/jazykove-vzorce/zatim.md) – příbuzné heslo (Jazykové vzorce, Yet)
- [Časové posuny v jazyce](@/kompendium/nlp-vzorce/jazykove-vzorce/casove-presuny-v-jazyce.md) – příbuzné heslo (Jazykové vzorce, Verb tense shifts)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.5.3 Pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – předchozí heslo rodiny
- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
