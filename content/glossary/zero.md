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

## Co pilíř vyžaduje

Podle provozní dokumentace platformy ZERO zakazuje:

- **holé zachycení výjimky** (*bare rescue*, např. `rescue _ -> …`), které chybu tiše spolkne a systém pokračuje, jako by se nic nestalo;
- **`String.to_atom/1` na nedůvěryhodném vstupu** – atomy se v prostředí Erlang/Elixir neuvolňují z paměti, takže převod libovolného vstupu na atom může vyčerpat tabulku atomů a shodit celý systém;
- **nebezpečné `:erlang.binary_to_term/1`** bez volby `:safe`;
- **`Process.sleep` v obsluze procesů GenServer**, který blokuje zpracování zpráv.

Požaduje se **strukturované zpracování chyb**: chyba se má zachytit cíleně, zaznamenat a ošetřit. ZERO je **blokující už při commitu** – kontroly vyhledávají zakázané vzory v ukládaném kódu a změnu odmítnou.

## Proč takové pravidlo existuje

Nejnebezpečnější chyba není ta, která systém shodí, ale ta, která proběhne **potichu**: systém dál běží, ale s poškozenými daty nebo v neplatném stavu, a nikdo o tom neví. Holé zachycení výjimek takové chyby skrývá; neomezené vytváření atomů a blokující volání vedou k selháním, která se projeví až pod zátěží. ZERO vynucuje, aby chyby byly **viditelné a ošetřené**.

## Vztah ke Kompendiu

Kniha ZERO nepoužívá jako svůj pojem. V poznámkách o souladu s doktrínou na stránkách technik spojených s umělou inteligencí se objevuje ve smyslu „žádná tichá selhání v detekčních procesech“. Interpretačně má princip „chyba nesmí proběhnout potichu“ obdobu v tématu knihy:

- řada jevů epistemické anihilace je škodlivá právě proto, že **probíhá nepozorovaně** – člověk se postupně přestává spoléhat na vlastní úsudek, aniž by zaznamenal okamžik selhání (srov. [kognitivní stagnace](@/glossary/kognitivni-stagnace.md));
- obranné principy knihy kladou důraz na **zviditelnění**: zapisovat si, co se děje, pojmenovat vzorec, nechat úsudek ověřit někým zvenčí;
- v klinické a institucionální praxi odpovídá ZERO požadavku dokumentovat pochybení a nežádoucí účinky péče místo jejich tichého přecházení (srov. [iatrogenní poškození](@/glossary/iatrogenic-harm.md)).

## Meze přenosu

U softwaru lze chyby do značné míry vyloučit pravidly. U lidí je omyl nevyhnutelnou součástí poznávání a učení; cílem není „nulová chybovost“, ale schopnost chyby rozpoznat a opravit. Kniha ze ZERO přebírá jen tuto druhou část.

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
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
