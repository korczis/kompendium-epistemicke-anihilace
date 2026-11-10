+++
title = "ZERO"
weight = 100
description = "ZERO (Zero Error Runtime Operations): pilíř doktríny Prismatic Platform proti pádům a tichým chybám za běhu – bez holých rescue a bez String.to_atom. Vztah ke knize."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "security"]

[extra]
category = "doctrine"
abbreviation = "ZERO"
related_terms = ["doctrine", "seal", "tach", "zero-warning-policy", "clean-run"]
keywords = ["ZERO", "Zero Error Runtime Operations", "běhová bezpečnost", "bare rescue", "String.to_atom", "Elixir", "doktrína"]
+++

## Definice

**ZERO** (*Zero Error Runtime Operations*) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform v doméně *Runtime safety*. Jeho cílem je **předcházet pádům a tichým chybám za běhu systému**. Index pojmů ho shrnuje heslem „žádné bare rescue, String.to_atom“ – dvěma typickými konstrukcemi jazyka Elixir, v němž je platforma napsána, které pilíř zakazuje.

Pojem patří do kontextu platformy a nezaměňuje se s heslem [Zero Warning Policy](@/glossary/zero-warning-policy.md), které popisuje jinou zásadu – překlad kódu bez jediného varování.

## Původ a kontext pojmu

Platforma běží na virtuálním stroji jazyka Erlang, jehož filozofii spolehlivosti formuloval Joe Armstrong. Podle ní se systém nemá snažit každé chybě předejít uvnitř jednotlivého procesu; proces, který se dostane do neočekávaného stavu, má raději spadnout a nadřízený „supervizor“ ho spustí znovu v čistém stavu (Armstrong 2003). Tento přístup, známý jako „nech to spadnout“, předpokládá jediné: chyba musí být **vidět**. Pád je informace, kterou supervizor i provozovatel dostanou; spolknutá výjimka je informace ztracená.

ZERO je proto s erlangovskou filozofií v souladu, ne v rozporu. Nezakazuje, aby procesy padaly, ale zakazuje konstrukce, které chybu skryjí, nebo naopak takové, které neohrozí jeden proces, nýbrž celý virtuální stroj – jako je vyčerpání tabulky atomů nebo blokování procesu, který má obsluhovat zprávy.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy ZERO zakazuje:

- **holé zachycení výjimky** (*bare rescue*, např. `rescue _ -> …`), které chybu tiše spolkne a systém pokračuje, jako by se nic nestalo;
- **`String.to_atom/1` na nedůvěryhodném vstupu** – atomy se v prostředí Erlang/Elixir neuvolňují z paměti, takže převod libovolného vstupu na atom může vyčerpat tabulku atomů a shodit celý systém;
- **nebezpečné `:erlang.binary_to_term/1`** bez volby `:safe`;
- **`Process.sleep` v obsluze procesů GenServer**, který blokuje zpracování zpráv.

Požaduje se **strukturované zpracování chyb**: chyba se má zachytit cíleně (jen konkrétní druh výjimky), zaznamenat a ošetřit; místo převodu na nový atom se používá převod na atom již existující nebo výběr z povoleného seznamu. ZERO je **blokující už při commitu** – kontroly vyhledávají zakázané vzory v ukládaném kódu a změnu odmítnou.

## Mechanismus: proč takové pravidlo existuje

Nejnebezpečnější chyba není ta, která systém shodí, ale ta, která proběhne **potichu**: systém dál běží, ale s poškozenými daty nebo v neplatném stavu, a nikdo o tom neví. Holé zachycení výjimek takové chyby skrývá; neomezené vytváření atomů a blokující volání vedou k selháním, která se projeví až pod zátěží. ZERO vynucuje, aby chyby byly **viditelné a ošetřené**.

Tento poznatek není omezen na software. James Reason ve studii lidského omylu rozlišil aktivní chyby, které se projeví okamžitě, a latentní podmínky, které v systému dřímají, dokud se nespojí s dalším selháním (Reason 1990). Tichá chyba v kódu je přesně takovou latentní podmínkou: sama nic nezpůsobí, ale vytvoří prostor, v němž se pozdější drobná odchylka promění v havárii, jejíž příčinu už nikdo nedohledá.

## Odlišení

ZERO se liší od [Zero Warning Policy](@/glossary/zero-warning-policy.md) tím, že ta hlídá varování překladače, tedy problémy, které lze odhalit před spuštěním; ZERO hlídá konstrukce, jejichž škodlivost se projeví až za běhu. Od pilíře [SEAL](@/glossary/seal.md) se odlišuje motivací – SEAL chrání před útočníkem, ZERO před vlastní chybou –, i když se oba překrývají u nedůvěryhodného vstupu. Od [TACH](@/glossary/tach.md) se liší tím, že nepožaduje důkaz správného chování, ale zakazuje konstrukce, které by chybné chování zamaskovaly.

Zásadní je také odlišení „nulové chybovosti“ od „nulových tichých chyb“. Název pilíře by mohl svádět k představě, že systém nesmí nikdy selhat. Ve skutečnosti pilíř počítá se selháním a trvá jen na tom, aby bylo hlasité, zaznamenané a ošetřené (Armstrong 2003).

## Význam pro Kompendium

Kniha ZERO nepoužívá jako svůj pojem. V poznámkách o souladu s doktrínou na stránkách technik spojených s umělou inteligencí se objevuje ve smyslu „žádná tichá selhání v detekčních procesech“. Interpretačně má princip „chyba nesmí proběhnout potichu“ obdobu v tématu knihy.

Řada jevů epistemické anihilace je škodlivá právě proto, že **probíhá nepozorovaně**: člověk se postupně přestává spoléhat na vlastní úsudek, aniž by zaznamenal okamžik selhání (srov. [kognitivní stagnace](@/glossary/kognitivni-stagnace.md)). Paige Sweet ukazuje, že [gaslighting](@/glossary/gaslighting.md) nepůsobí jednorázovým klamem, ale postupným přesouváním důvěryhodnosti, které se opírá o sociální nerovnosti a které oběť dlouho nedokáže pojmenovat (Sweet 2019). Evan Stark popisuje [coercive control](@/glossary/coercive-control.md) jako vzorec, jehož jednotlivé projevy vypadají drobně a teprve v souhrnu tvoří systém ovládání (Stark 2007). V obou případech je škoda „latentní podmínkou“ ve smyslu Reasonově: neprojeví se okamžitě, ale připravuje půdu pro pozdější zhroucení.

Obranné principy knihy proto kladou důraz na **zviditelnění**: zapisovat si, co se děje, pojmenovat vzorec, nechat úsudek ověřit někým zvenčí. V klinické a institucionální praxi odpovídá ZERO požadavku dokumentovat pochybení a nežádoucí účinky péče místo jejich tichého přecházení (srov. [iatrogenní poškození](@/glossary/iatrogenic-harm.md)). Zpráva amerického Institute of Medicine o bezpečnosti zdravotní péče ukázala, že chyby se v nemocnicích opakují hlavně tam, kde se o nich nemluví, a že bezpečnost roste se systémy, které hlášení chyb usnadňují místo trestání (Kohn, Corrigan a Donaldson 2000).

Obecný příklad (kompozit): v poradně si tým všimne, že několik klientů po určitém typu skupinového setkání ukončí spolupráci. Nikdo si nestěžoval a záznamy jsou „bez nálezu“. Teprve když tým začne odchody zaznamenávat a rozebírat, ukáže se, že setkání nevědomky opakovala dynamiku, kterou klienti znali ze skupin s vysokou mírou kontroly. Tichá chyba se stala viditelnou a dala se opravit.

## Obrana a zotavení

Lidskou obdobou zákazu holého zachycení výjimky je zásada nepřecházet vlastní nesouhlas mlčením. Kdo opakovaně „spolkne“ rozpor mezi tím, co vidí, a tím, co mu je řečeno, ztrácí postupně schopnost rozpor vůbec zaznamenat. Zapsat si ho – i bez okamžité reakce – znamená zachovat informaci, ke které se lze vrátit. Pro týmy a instituce to znamená vytvářet prostředí, v němž se chyby a pochybnosti hlásí bez obav; Amy Edmondson ukázala, že týmy s vyšší psychologickou bezpečností hlásí víc chyb a víc se z nich učí (Edmondson 1999).

## Meze přenosu

U softwaru lze chyby do značné míry vyloučit pravidly. U lidí je omyl nevyhnutelnou součástí poznávání a učení; cílem není „nulová chybovost“, ale schopnost chyby rozpoznat a opravit. Kniha ze ZERO přebírá jen tuto druhou část. Otevřenou otázkou zůstává, jak zviditelňovat tiché škody, které si postižený sám neuvědomuje, aniž by se z vnějšího pozorování stal další druh kontroly.

## Literatura

- Armstrong, J. (2003). *Making Reliable Distributed Systems in the Presence of Software Errors* (disertace). Royal Institute of Technology (KTH), Stockholm.
- Edmondson, A. (1999). Psychological safety and learning behavior in work teams. *Administrative Science Quarterly*, 44(2).
- Kohn, L. T., Corrigan, J. M., & Donaldson, M. S. (Eds.) (2000). *To Err Is Human: Building a Safer Health System*. National Academy Press.
- Reason, J. (1990). *Human Error*. Cambridge University Press.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Sweet, P. L. (2019). The sociology of gaslighting. *American Sociological Review*, 84(5).

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [SEAL](@/glossary/seal.md) – bezpečnostní pilíř.
- [TACH](@/glossary/tach.md) – testovací pilíř.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – odlišná zásada překladu bez varování.
- [Clean Run](@/glossary/clean-run.md) – běh bez chyb a varování.

**Kniha**

- [Iatrogenní poškození](@/glossary/iatrogenic-harm.md) – nepřehlížet škody péče.
- [Kognitivní stagnace](@/glossary/kognitivni-stagnace.md) – nepozorované selhání poznávání.
- [Gaslighting](@/glossary/gaslighting.md) – postupné, nenápadné podkopávání úsudku.
- [Coercive control](@/glossary/coercive-control.md) – drobné projevy, které tvoří systém.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
