+++
title = "Russellův paradox"
weight = 100
description = "Russellův paradox množiny všech množin, které nejsou prvky sebe samých: krize základů matematiky, teorie typů a její ozvěna v teorii dvojné vazby."

[taxonomies]
tags = ["glossary", "logika", "filozofie", "komunikace", "kompendium"]

[extra]
category = "logika a jazyk"
related_terms = ["self-reference", "liaruv-paradox", "godeluv-teorem", "double-bind", "infinitni-regress", "logicka-koherence"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Vymezení

Russellův paradox je logický rozpor, který vzniká, pokud připustíme, že jakákoli
dobře definovaná vlastnost určuje množinu. Uvažujme množinu R všech množin, které nejsou
svými vlastními prvky. Je-li R prvkem sebe sama, pak podle definice prvkem sebe sama není;
není-li prvkem sebe sama, pak podle definice prvkem sebe sama je. Bertrand Russell paradox
objevil při práci na základech matematiky a publikoval ho v *Principles of Mathematics*
(Russell, 1903). Paradox ukázal, že neomezený princip vytváření množin, z něhož vycházel
Gottlob Frege, vede ke sporu.

Toto heslo pojednává Russellův paradox jako konkrétní výsledek v dějinách logiky a jako
pojmový model, s nímž pracovala teorie komunikace. Obecnější jev, totiž výroky a systémy,
které odkazují samy na sebe, rozvádí heslo [sebereference](@/glossary/self-reference.md);
sémantickou obdobu v podobě výroku „tato věta je nepravdivá“ heslo
[lhářův paradox](@/glossary/liaruv-paradox.md). Pro kompendium je Russellův paradox důležitý
proto, že řešení, které Russell navrhl, tedy rozlišení logických typů, se stalo
východiskem teorie [dvojné vazby](@/glossary/double-bind.md) (Bateson, Jackson, Haley a
Weakland, 1956).

## Pojmová historie

Frege v *Základních zákonech aritmetiky* usiloval odvodit aritmetiku z čisté logiky a jako
jeden z axiomů přijal princip, podle něhož každému pojmu odpovídá jeho rozsah (Frege, 1893).
Russell mu v roce 1902 napsal dopis, v němž ukázal, že z tohoto principu lze odvodit spor;
Frege dopis přijal s velkou poctivostí a v doslovu druhého svazku uznal, že základ jeho
stavby byl otřesen (Frege, 1903). Korespondence je dnes dostupná ve standardní antologii
textů o základech matematiky (van Heijenoort, 1967).

Russell sám navrhl řešení v podobě teorie typů: objekty jsou uspořádány do hierarchie úrovní
a o množině lze smysluplně vypovídat jen pomocí objektů nižšího typu, takže otázka, zda je
množina prvkem sebe sama, není nepravdivá, ale nesmyslná (Russell, 1908). Teorie typů se
stala základem *Principia Mathematica*, kterou Russell napsal s Alfredem Northem Whiteheadem
(Whitehead a Russell, 1910). Ernst Zermelo zvolil jinou cestu: axiomatizoval teorii množin
tak, že nové množiny lze vydělovat jen z množin již existujících, čímž konstrukce
problematické množiny R není možná (Zermelo, 1908). Zermelova axiomatika, rozšířená Fraenkelem,
se stala standardním základem matematiky.

## Mechanismus a pozorovatelné znaky

Strukturně paradox spojuje tři prvky: sebereferenci, tedy otázku, zda něco patří samo do
sebe, negaci, tedy definici pomocí nepříslušnosti, a neomezenou totalitu, tedy požadavek, aby
definice zahrnovala všechny objekty dané povahy. Kurt Gödel později ukázal, že kombinace
sebereference a dostatečně silného formálního systému vede k větám, které systém nemůže
dokázat ani vyvrátit; nejde o tentýž výsledek, ale o příbuznou strukturu, jak rozvádí heslo
[Gödelův teorém](@/glossary/godeluv-teorem.md) (Gödel, 1931).

Gregory Bateson a jeho spolupracovníci převzali Russellovo rozlišení logických typů jako model
pro komunikaci, v níž se mísí sdělení různých úrovní. V jejich popisu dvojné vazby dostává
člověk primární příkaz, současně sekundární sdělení na jiné úrovni, často neverbální, které
primárnímu odporuje, a třetí, implicitní zákaz z této situace uniknout nebo ji komentovat
(Bateson, Jackson, Haley a Weakland, 1956). Paul Watzlawick s kolegy na to navázal analýzou
pragmatických paradoxů, jako je požadavek „buď spontánní“, který nelze splnit, protože
spontánnost na příkaz popírá sama sebe (Watzlawick, Beavin a Jackson, 1967).

Pozorovatel takové komunikace vidí, že adresát nemůže odpovědět správně: jakákoli reakce
porušuje jedno ze sdělení. Typickým znakem je také zákaz metakomunikace, tedy rozhovoru o tom,
jak spolu strany mluví, protože právě metakomunikace by umožnila rozlišit úrovně, které
paradox spojuje (Watzlawick, Beavin a Jackson, 1967). Kompendium tento vzorec rozvádí v
kapitole o [paradoxálních metaanihilačních protokolech](@/kompendium/05-ultramari-techniky/kapitola-9.md).

## Odlišení od příbuzných jevů

Russellův paradox je třeba odlišit od lhářova paradoxu. Lhářův paradox je sémantický: vzniká z
pojmu pravdivosti a jeho řešení se hledá v teorii pravdy. Russellův paradox je
množinově-teoretický: vzniká z pojmu příslušnosti k množině a jeho řešení spočívá v
axiomatice (Russell, 1908; Zermelo, 1908). Od logické chyby nebo nedorozumění se paradox liší
tím, že vychází z premis, které se jeví jako zřejmé, a spor z nich plyne korektně. Proto
nelze paradox odstranit opravou úsudku, ale jen revizí premis.

V oblasti komunikace je nutné odlišit dvojnou vazbu od běžné ambivalence. Člověk může
vyjadřovat smíšené pocity, aniž by tím druhého uvěznil; dvojná vazba vzniká až tehdy, když jsou
protichůdná sdělení spojena s ohrožením a se zákazem situaci pojmenovat nebo opustit (Bateson,
Jackson, Haley a Weakland, 1956). Původní hypotéza, že dvojná vazba způsobuje schizofrenii,
nebyla empiricky potvrzena a současná psychiatrie ji nepřijímá; trvalou hodnotu má teorie jako
popis komunikačního vzorce, nikoli jako etiologie poruchy (American Psychiatric Association,
2013).

## Klinický, právní a organizační rámec

V klinické praxi je Russellovo rozlišení úrovní užitečné jako nástroj porozumění rodinné
nebo partnerské komunikaci, v níž se klient cítí uvězněn. Watzlawick s kolegy ukázali, že
paradoxní komunikace se stává patologickou zejména ve vztazích, které nelze snadno opustit,
například mezi rodičem a dítětem nebo v uzavřené skupině, a že klíčem k uvolnění je
schopnost komunikovat o komunikaci (Watzlawick, Beavin a Jackson, 1967). Rodinná terapie
odvozená z této tradice se proto soustředí na pojmenování úrovní a pravidel vztahu, nikoli
jen na obsah sporů.

V organizacích se dvojná vazba objevuje například tam, kde je zaměstnancům oficiálně
deklarována otevřenost vůči kritice, ale kritika je fakticky trestána, a o tomto rozporu nelze
mluvit. Obranou je strukturní oddělení úrovní: nezávislý kanál pro zpětnou vazbu, který není
podřízen tomu, na koho se kritika vztahuje, jak popisuje stránka
[anonymní zpětná vazba](@/kompendium/organizational-defense/14-anonymous-feedback.md) (Watzlawick,
Beavin a Jackson, 1967).

## Obrana a zotavení

Logika dává obraně jednoduchou lekci: paradox se nerozřeší hledáním správné odpovědi na
úrovni, kde vznikl, ale přechodem na úroveň vyšší. Russell otázku, zda je R prvkem sebe sama,
neřešil odpovědí ano nebo ne, ale ukázal, že otázka je špatně utvořená (Russell, 1908). V
komunikaci tomu odpovídá metakomunikace: pojmenovat, že dvě sdělení si odporují, a odmítnout
povinnost splnit obě současně (Watzlawick, Beavin a Jackson, 1967).

Zotavení po dlouhodobé zkušenosti s paradoxní komunikací vyžaduje obnovit důvěru, že rozpor,
který člověk vnímal, byl skutečný a nikoli projevem jeho vlastní nedostatečnosti. Bateson s
kolegy zdůraznili, že nejzraňujícím prvkem dvojné vazby je právě zákaz rozpor vnímat a
komentovat (Bateson, Jackson, Haley a Weakland, 1956). Terapeutický rozhovor, v němž je
metakomunikace dovolena a bezpečná, je proto sám o sobě korektivní zkušeností. Praktické
postupy rozvádí návod [asertivní komunikace](@/kompendium/self-defense-guides/24-communication-assertiveness.md).

## Meze a otevřené otázky

Přenos pojmu logického typu z matematiky do teorie komunikace je metaforický: lidská
komunikace nemá přesnou hierarchii úrovní a hranice mezi sdělením a metasdělením je často
nejasná. Kritici Batesonovy školy upozorňovali, že teorie dvojné vazby se empiricky těžko
testuje, protože vymezení jejích složek je volné (Watzlawick, Beavin a Jackson, 1967).
Kompendium proto Russellův paradox používá jako strukturní analogii, nikoli jako důkaz, že
komunikační paradoxy mají povahu logického sporu. V samotné logice zůstává otevřenou
filozofickou otázkou, zda axiomatická řešení paradox vysvětlují, nebo ho jen obcházejí (Gödel,
1931).

## Literatura

- American Psychiatric Association. (2013). *Diagnostic and statistical manual of mental
  disorders* (5th ed.). American Psychiatric Publishing.
- Bateson, G., Jackson, D. D., Haley, J., & Weakland, J. (1956). Toward a theory of
  schizophrenia. *Behavioral Science, 1*(4), 251–264.
- Frege, G. (1893). *Grundgesetze der Arithmetik* (Vol. 1). Hermann Pohle.
- Frege, G. (1903). *Grundgesetze der Arithmetik* (Vol. 2). Hermann Pohle.
- Gödel, K. (1931). Über formal unentscheidbare Sätze der Principia Mathematica und
  verwandter Systeme I. *Monatshefte für Mathematik und Physik, 38*, 173–198.
- Russell, B. (1903). *The principles of mathematics*. Cambridge University Press.
- Russell, B. (1908). Mathematical logic as based on the theory of types. *American Journal of
  Mathematics, 30*(3), 222–262.
- van Heijenoort, J. (Ed.). (1967). *From Frege to Gödel: A source book in mathematical logic,
  1879–1931*. Harvard University Press.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of human communication*.
  W. W. Norton.
- Whitehead, A. N., & Russell, B. (1910). *Principia mathematica* (Vol. 1). Cambridge
  University Press.
- Zermelo, E. (1908). Untersuchungen über die Grundlagen der Mengenlehre I. *Mathematische
  Annalen, 65*, 261–281.

## Související

**Pojmy glosáře**

- [Sebereference](@/glossary/self-reference.md) – obecný jev, jehož je Russellův paradox
  případem.
- [Lhářův paradox](@/glossary/liaruv-paradox.md) – sémantická obdoba Russellova paradoxu.
- [Gödelův teorém](@/glossary/godeluv-teorem.md) – příbuzný výsledek o mezích formálních
  systémů.
- [Dvojná vazba](@/glossary/double-bind.md) – komunikační vzorec odvozený z teorie logických
  typů.
- [Logická koherence](@/glossary/logicka-koherence.md) – požadavek bezespornosti, který paradox
  ohrožuje.

**Techniky a kapitoly**

- [Paradoxální metaanihilační protokoly](@/kompendium/05-ultramari-techniky/kapitola-9.md) –
  kapitola o zneužití paradoxních struktur.
- [Epimenidovská implantace](@/kompendium/techniques/ea-5-4-7-epimenidovska-implantace.md) –
  technika EA pracující se sebevztažným sporem.
- [Gödelovská sebereflexe](@/kompendium/techniques/ea-5-4-4-godel-reflexivita.md) – technika
  využívající rétoriku neúplnosti.

**Obrana**

- [Asertivní komunikace](@/kompendium/self-defense-guides/24-communication-assertiveness.md) –
  metakomunikace jako cesta z paradoxní situace.
- [Anonymní zpětná vazba](@/kompendium/organizational-defense/14-anonymous-feedback.md) –
  organizační oddělení úrovní komunikace.
