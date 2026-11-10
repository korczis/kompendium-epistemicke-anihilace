+++
title = "Chain of custody"
description = "Jak zajistit nepřerušený a doložitelný řetěz nakládání s důkazy v kauzách EA, kde rozhodující stopy bývají digitální, soukromé a snadno zpochybnitelné."
weight = 7

[taxonomies]
tags = ["kompendium", "forensic-legal", "forensic-assessment"]
categories = ["academic", "legal", "clinical"]

[extra]
related_terms = ["1-forensic-interview-protocol", "10-forensic-documentation", "11-undue-influence-doctrine", "12-coercive-control-law"]
parent = "kompendium-forensic-legal"
toc = true
+++

# Chain of custody

Kapitola z [části o forenzním posouzení](@/kompendium/forensic-legal/_index.md) se týká
integrity důkazů – tedy toho, jak doložit, že předložený materiál je tentýž, který byl
zajištěn, a že s ním nikdo nemanipuloval. Je určena vyšetřovatelům, advokátům, znalcům
z oboru kybernetiky a také obětem a jejich podpůrcům, kteří materiály často shromažďují sami.

## Právní a forenzní kontext

[Chain of custody](@/glossary/chain-of-custody.md) (řetěz úschovy) je dokumentovaný sled
všech osob a úkonů, které s důkazem přišly do styku: kdo ho zajistil, kdy, jak, kde byl
uložen, kdo k němu měl přístup a jaké úkony s ním byly provedeny. Neslouží jen policejním
stopám. V civilních a rodinných sporech je stejně významný u zpráv, e-mailů, nahrávek,
fotografií a deníků. Soud hodnotí důkazy volně, ale materiál s nejasným původem má menší
váhu a protistrana jej snadno napadne. Pro digitální stopy existuje mezinárodní norma
ISO/IEC 27037, která popisuje identifikaci, sběr, získání a uchování digitálních důkazů.

## Specifika epistemického zneužívání

V kauzách EA se o řetěz úschovy vede spor častěji než jinde, a to z několika důvodů:

- **Důkazy shromažďuje oběť sama**, často bez znalosti postupů, pod stresem a v prostředí,
  k němuž má pachatel přístup.
- **Pachatel může mít přístup k zařízením a účtům** – sdílené počítače, rodinné cloudy,
  znalost hesel. Materiál tak mohl být změněn, smazán nebo podvržen kteroukoli stranou.
- **Zpochybnění autenticity je pokračováním gaslightingu.** Tvrzení „ta zpráva je
  podvrh“ nebo „ty fotky jsi upravila“ přenáší na oběť břemeno, které už jednou nesla –
  dokazovat vlastní realitu.
- **Syntetická média** ([deepfake](@/glossary/deepfake.md), klonovaný hlas) umožňují
  zpochybnit i pravý záznam námitkou, že může být uměle vytvořen.

Pečlivě vedený řetěz úschovy proto chrání nejen důkaz, ale i oběť před další vlnou
zpochybňování.

## Klíčové principy

- **Originál zůstává nedotčen.** Pracuje se s ověřenými kopiemi.
- **Každý přenos je zapsán.** Kdo, komu, kdy, proč, v jakém stavu.
- **Integrita je ověřitelná.** U digitálních souborů kryptografický otisk (hash) při zajištění
  a při každé další manipulaci.
- **Kontext je zachován.** Snímek obrazovky bez data, odesílatele a okolních zpráv má nízkou
  hodnotu.
- **Minimalizace přístupu.** Čím méně osob s materiálem pracuje, tím kratší a čistší je řetěz.

## Procedurální postup

1. **Identifikace.** Sepsat, jaké důkazy existují a kde jsou: zařízení, účty, papírové
   dokumenty, třetí osoby. Zvážit, které mohou rychle zaniknout (automatické mazání,
   zrušení účtu, přepis záznamu).
2. **Zajištění.** U digitálních stop přednostně exportem dat se zachováním metadat, nikoli
   jen snímky obrazovky. Pokud je k dispozici, odborné zajištění forenzní kopie zařízení.
   U papírových materiálů originály neupravovat, nepřepisovat ani nelepit.
3. **Záznam o zajištění.** Datum, čas, místo, osoba, popis předmětu, způsob zajištění,
   případně hash. U zajištění samotnou obětí stačí jednoduchý, ale soustavně vedený deník.
4. **Uložení.** Bezpečné místo bez přístupu pachatele; u digitálních dat šifrované úložiště
   a záloha. Podrobnosti v kapitole [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md).
5. **Předání.** Při předání advokátovi, policii nebo znalci předávací protokol a ověření
   integrity.
6. **Analýza.** Znalec pracuje na kopii a v posudku popisuje, z čeho vycházel a jak ověřil
   neporušenost.

## Markery a diferenciální úvahy

Na co si dát pozor při hodnocení materiálů:

- **Mezery v řetězu** – období, kdy není jasné, kdo měl materiál v rukou. Neznamenají
  automaticky manipulaci, ale je třeba je vysvětlit.
- **Nesoulad metadat a obsahu** – časová razítka, která neodpovídají popisovaným událostem.
- **Výběrovost** – předloženy jsou jen části konverzace. Výběr může být legitimní, ale
  protistrana může oprávněně požadovat celek.
- **Námitka podvrhu** – je třeba odlišit konkrétní, technicky podloženou námitku od
  obecného „to může být fake“, které samo o sobě důkaz nezpochybňuje.

## Riziková místa

- **Snímky obrazovky bez kontextu** a přeposílání zpráv, které mění metadata.
- **Úpravy „pro přehlednost“** – zvýraznění, oříznutí, začernění. Pracujte na kopii a
  originál uchovejte.
- **Úložiště, k nimž má přístup pachatel**, a sdílená zařízení.
- **Neoprávněné získání.** Přístup do cizího účtu nebo zařízení bez oprávnění může být
  protiprávní a důkaz znehodnotit. Před zajišťováním materiálů z cizích účtů je nutná
  právní konzultace.
- **Ztráta originálu** – výměna telefonu, zrušení účtu, smazání v dobré víře.

## Modelová situace (anonymizovaná)

Matka v opatrovnickém sporu předkládá stovky zpráv, v nichž otec dětí přepisuje dohody a
tvrdí, že „nikdy nic takového neřekl“. Protistrana namítá, že zprávy jsou vytržené
z kontextu a některé upravené. Advokátka proto zajistí znalecký export celé konverzace
z telefonu matky včetně metadat a s hashem; originální telefon je uložen. Znalec potvrdí,
že export odpovídá datům v zařízení a že konverzace je úplná za sledované období. Spor se
tím přesune od otázky „jsou zprávy pravé?“ k otázce, co obsahově ukazují.

## Doporučení pro praxi

### Pro dotčenou osobu

- Nemazejte nic, ani to, co vás bolí. Pokud nechcete zprávy vidět, archivujte je jinam.
- Veďte si jednoduchý záznam: co jste uložili, kdy a kam.
- Nevstupujte do účtů a zařízení druhé osoby; poraďte se nejprve s právníkem.
- Viz také [osobní archiv paměti](@/kompendium/self-defense-guides/43-memory-archive.md).

### Pro znalce

- Popište v posudku celý řetěz, včetně mezer a toho, jak je hodnotíte.
- Odlišujte technicky podložené pochybnosti o autenticitě od obecných námitek.

### Pro právníka a vyšetřovatele

- Zajistěte rychlou fixaci materiálů ohrožených zánikem.
- Používejte předávací protokoly a ověřování integrity i v civilních věcech.
- Na námitku podvrhu reagujte nabídkou znaleckého ověření, ne sporem o dojmy.

## Limity a otevřené otázky

Řetěz úschovy dokládá, že s důkazem nebylo manipulováno po zajištění. Nedokládá, že obsah
byl pravdivý v okamžiku vzniku, ani že jde o úplný obraz vztahu. S rozvojem syntetických médií
roste význam otázky, jak dokázat pravost záznamu, který vznikl mimo kontrolovaný proces –
například nahrávky pořízené obětí na vlastní telefon. Technické metody detekce syntetického
obsahu nejsou spolehlivé natolik, aby samy rozhodly; proto stoupá hodnota okolních důkazů a
dobře vedeného řetězu.

## Související

**V této sekci**

- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – praktické zajištění dřív, než stopy zmizí.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – metadata, exporty a syntetická média.
- [Důkazní řetěz a narativ](@/kompendium/forensic-legal/34-chain-evidence-narrative.md) – jak z jednotlivých důkazů složit vzorec.

**Glosář**

- [Chain of custody](@/glossary/chain-of-custody.md) – definice pojmu.
- [Deepfake](@/glossary/deepfake.md) – syntetická média a námitka podvrhu.
- [Gaslighting](@/glossary/gaslighting.md) – zpochybňování autenticity jako pokračování kontroly.

**Techniky a organizace**

- [AI Document Forgery](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md) – padělání dokumentů a jeho detekce.
- [Voice Cloning EA](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md) – zpochybnitelnost zvukových záznamů.
- [Standardy dokumentace v organizaci](@/kompendium/organizational-defense/24-documentation-standards.md) – řetěz úschovy v interním šetření.
