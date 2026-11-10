+++
title = "Chain of custody"
description = "Jak zajistit nepřerušený a doložitelný řetěz nakládání s důkazy v kauzách EA, kde rozhodující stopy bývají digitální, soukromé a snadno zpochybnitelné."
weight = 7

[taxonomies]
tags = ["kompendium", "forensic-legal", "forensic-assessment"]
categories = ["academic", "legal", "clinical"]

[extra]
related_terms = ["1-forensic-interview-protocol", "10-forensic-documentation", "11-undue-influence-doctrine", "12-coercive-control-law"]
toc = true
+++

# Chain of custody

Kapitola z [části o forenzním posouzení](@/kompendium/forensic-legal/_index.md) se týká integrity důkazů – tedy toho, jak doložit, že předložený materiál je tentýž, který byl zajištěn, a že s ním nikdo nemanipuloval. Je určena vyšetřovatelům, advokátům, znalcům z oboru kybernetiky a také obětem a jejich podpůrcům, kteří materiály často shromažďují sami. Casey (2011) zdůrazňuje, že u digitálních stop je integrita důkazu stejně důležitá jako jeho obsah: bez doložitelného původu se i pravdivý záznam stává pouhým tvrzením.

V kauzách epistemického zneužívání má tato otázka zvláštní rozměr. Spor o to, co se stalo, je zde často sporem o to, čí verze reality platí, a důkaz, jehož původ nelze doložit, vrací oběť do pozice, v níž musí dokazovat vlastní vnímání. Pečlivě vedený řetěz úschovy je proto nejen technickou, ale i ochrannou praxí (Sweet, 2019, popisuje gaslighting jako jev, který staví na nerovném přístupu k uznávané verzi reality).

## Právní a forenzní kontext

[Chain of custody](@/glossary/chain-of-custody.md) (řetěz úschovy) je dokumentovaný sled všech osob a úkonů, které s důkazem přišly do styku: kdo ho zajistil, kdy, jak, kde byl uložen, kdo k němu měl přístup a jaké úkony s ním byly provedeny. Neslouží jen policejním stopám; v civilních a rodinných sporech je stejně významný u zpráv, e-mailů, nahrávek, fotografií a deníků. Pro digitální stopy existuje mezinárodní norma ISO/IEC 27037, která popisuje identifikaci, sběr, získání a uchování digitálních důkazů a zdůrazňuje dokumentaci každého kroku (ISO/IEC, 2012).

Soud hodnotí důkazy volně: v civilním řízení podle zákona č. 99/1963 Sb., občanského soudního řádu, v trestním řízení podle zákona č. 141/1961 Sb., trestního řádu. Volné hodnocení neznamená, že na původu nezáleží – materiál s nejasným původem má menší váhu a protistrana jej snadno napadne. Praktické zásady pro policejní práci s digitálními stopami shrnuje britský průvodce ACPO, podle něhož se nemá měnit původní data, každý přístup k originálu má provádět kompetentní osoba a o všech úkonech má existovat auditní stopa, kterou může nezávislá třetí strana zopakovat (ACPO, 2012).

## Specifika epistemického zneužívání

V kauzách EA se o řetěz úschovy vede spor častěji než jinde. **Důkazy shromažďuje oběť sama**, často bez znalosti postupů, pod stresem a v prostředí, k němuž má pachatel přístup. **Pachatel může mít přístup k zařízením a účtům** – sdílené počítače, rodinné cloudy, znalost hesel –, takže materiál mohl být změněn, smazán nebo podvržen kteroukoli stranou. Casey (2011) upozorňuje, že u sdílených zařízení je přiřazení konkrétní činnosti konkrétní osobě jednou z nejobtížnějších otázek digitální forenzní analýzy.

**Zpochybnění autenticity je pokračováním [gaslightingu](@/glossary/gaslighting.md).** Tvrzení „ta zpráva je podvrh“ nebo „ty fotky jsi upravila“ přenáší na oběť břemeno, které už jednou nesla – dokazovat vlastní realitu. Sweet (2019) ukazuje, že gaslighting využívá nerovnosti v tom, komu instituce věří; řízení, v němž je výpověď oběti automaticky podezřelá a výpověď protistrany ne, tuto nerovnost reprodukuje. Doložitelný řetěz úschovy ji naopak oslabuje, protože přesouvá spor od důvěryhodnosti osob k ověřitelným faktům.

**Syntetická média** – [deepfake](@/glossary/deepfake.md), klonovaný hlas – umožňují zpochybnit i pravý záznam námitkou, že může být uměle vytvořen. Chesney a Citron (2019) tento jev nazvali „dividendou lháře“ (*liar's dividend*): samotná existence věrohodných padělků dává tomu, kdo chce pravý záznam popřít, snadný argument. Pečlivě vedený řetěz úschovy proto chrání nejen důkaz, ale i oběť před další vlnou zpochybňování.

## Klíčové principy

Prvním principem je, že **originál zůstává nedotčen** a pracuje se s ověřenými kopiemi (ACPO, 2012). Druhým je, že **každý přenos je zapsán**: kdo, komu, kdy, proč a v jakém stavu. Třetím principem je **ověřitelná integrita**: u digitálních souborů se při zajištění a při každé další manipulaci počítá kryptografický otisk (*hash*), jehož shoda dokládá, že se obsah nezměnil (Casey, 2011). Tyto principy odpovídají požadavkům normy ISO/IEC 27037 na auditovatelnost, opakovatelnost a obhajitelnost postupu (ISO/IEC, 2012).

Čtvrtým principem je **zachování kontextu**: snímek obrazovky bez data, odesílatele a okolních zpráv má nízkou hodnotu, protože ho nelze zasadit do průběhu komunikace. Pátým principem je **minimalizace přístupu** – čím méně osob s materiálem pracuje, tím kratší a čistší je řetěz. Kent a kol. (2006) v příručce NIST doporučují, aby každá organizace měla předem stanovené role a postupy pro nakládání s digitálními stopami, protože improvizace v okamžiku zajištění je nejčastějším zdrojem chyb.

## Postup v praxi

Postup začíná **identifikací**: sepsat, jaké důkazy existují a kde jsou – zařízení, účty, papírové dokumenty, třetí osoby – a zvážit, které mohou rychle zaniknout kvůli automatickému mazání, zrušení účtu nebo přepisu záznamu. Následuje **zajištění**: u digitálních stop přednostně exportem dat se zachováním metadat, nikoli jen snímky obrazovky, a je-li to možné, odborným pořízením forenzní kopie zařízení. U papírových materiálů se originály neupravují, nepřepisují ani nelepí (ACPO, 2012).

Třetím krokem je **záznam o zajištění** – datum, čas, místo, osoba, popis předmětu, způsob zajištění, případně hash. U zajištění samotnou obětí stačí jednoduchý, ale soustavně vedený deník; jeho hodnota roste s pravidelností a s tím, že vzniká současně s událostmi (Casey, 2011). Čtvrtým krokem je **uložení** na bezpečném místě bez přístupu pachatele, u digitálních dat v šifrovaném úložišti se zálohou; podrobnosti uvádí kapitola [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md).

Pátým krokem je **předání** advokátovi, policii nebo znalci s předávacím protokolem a ověřením integrity. Šestým je **analýza**, při níž znalec pracuje na kopii a v posudku popisuje, z čeho vycházel a jak ověřil neporušenost (ISO/IEC, 2012). Kent a kol. (2006) rozdělují forenzní proces do fází sběru, prozkoumání, analýzy a zprávy; každá fáze má mít vlastní dokumentaci, aby bylo možné postup zpětně přezkoumat (viz [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md)).

## Markery a diferenciální úvahy

Při hodnocení materiálů je třeba sledovat **mezery v řetězu**, tedy období, kdy není jasné, kdo měl materiál v rukou; neznamenají automaticky manipulaci, ale je třeba je vysvětlit. Varovným znakem je **nesoulad metadat a obsahu**, například časová razítka, která neodpovídají popisovaným událostem. Casey (2011) připomíná, že metadata se mohou měnit i legitimními úkony – kopírováním, synchronizací, změnou časového pásma –, a proto nesoulad vyžaduje technické vysvětlení, nikoli okamžitý závěr.

Dalším bodem je **výběrovost**: předloženy jsou jen části konverzace. Výběr může být legitimní, ale protistrana může oprávněně požadovat celek. Konečně je třeba posoudit **námitku podvrhu** a odlišit konkrétní, technicky podloženou námitku od obecného „to může být fake“, které samo o sobě důkaz nezpochybňuje. Chesney a Citron (2019) upozorňují, že pokud by obecná námitka stačila, získal by výhodu každý, kdo chce pravdivý záznam popřít.

## Riziková místa

Rizikem jsou **snímky obrazovky bez kontextu** a přeposílání zpráv, které mění metadata, a **úpravy „pro přehlednost“** – zvýraznění, oříznutí, začernění. Pracovat se má na kopii a originál uchovat (ACPO, 2012). Rizikem jsou i **úložiště, k nimž má přístup pachatel**, a sdílená zařízení, na nichž lze materiál změnit, aniž by to oběť zjistila; Casey (2011) proto doporučuje co nejdříve oddělit kopii důkazu od prostředí, které je předmětem sporu.

Zvláštním rizikem je **neoprávněné získání**: přístup do cizího účtu nebo zařízení bez oprávnění může být protiprávní a důkaz znehodnotit, a před zajišťováním materiálů z cizích účtů je proto nutná právní konzultace. Posledním rizikem je **ztráta originálu** – výměna telefonu, zrušení účtu nebo smazání v dobré víře. Kent a kol. (2006) zdůrazňují, že rychlé zajištění těkavých dat často rozhoduje o tom, zda bude důkaz vůbec k dispozici.

## Modelová situace (anonymizovaná)

Matka v opatrovnickém sporu předkládá stovky zpráv, v nichž otec dětí přepisuje dohody a tvrdí, že „nikdy nic takového neřekl“. Protistrana namítá, že zprávy jsou vytržené z kontextu a některé upravené. Advokátka proto zajistí znalecký export celé konverzace z telefonu matky včetně metadat a s hashem; originální telefon je uložen. Znalec potvrdí, že export odpovídá datům v zařízení a že konverzace je úplná za sledované období. Spor se tím přesune od otázky „jsou zprávy pravé?“ k otázce, co obsahově ukazují. Kompozit odpovídá zásadám auditovatelnosti a opakovatelnosti podle normy ISO/IEC 27037 (ISO/IEC, 2012).

## Obrana a zotavení

Dotčená osoba by neměla nic mazat, ani to, co ji bolí; pokud nechce zprávy vidět, může je archivovat jinam. Pomáhá vést si jednoduchý záznam o tom, co uložila, kdy a kam, a nevstupovat do účtů a zařízení druhé osoby bez porady s právníkem (viz [osobní archiv paměti](@/kompendium/self-defense-guides/43-memory-archive.md)). Dokumentace má i ochrannou funkci pro zotavení: Herman (1992) popisuje, že oběti dlouhodobého zneužívání často pochybují o vlastní paměti, a vlastní, soustavně vedený archiv může tuto pochybnost oslabit, protože poskytuje oporu nezávislou na výkladu pachatele.

Znalci mají v posudku popsat celý řetěz včetně mezer a toho, jak je hodnotí, a odlišovat technicky podložené pochybnosti o autenticitě od obecných námitek. Právníci a vyšetřovatelé mají zajistit rychlou fixaci materiálů ohrožených zánikem, používat předávací protokoly a ověřování integrity i v civilních věcech a na námitku podvrhu reagovat nabídkou znaleckého ověření, ne sporem o dojmy (ACPO, 2012; Casey, 2011).

## Limity a otevřené otázky

Řetěz úschovy dokládá, že s důkazem nebylo manipulováno po zajištění. Nedokládá, že obsah byl pravdivý v okamžiku vzniku, ani že jde o úplný obraz vztahu. S rozvojem syntetických médií roste význam otázky, jak dokázat pravost záznamu, který vznikl mimo kontrolovaný proces – například nahrávky pořízené obětí na vlastní telefon. Technické metody detekce syntetického obsahu nejsou spolehlivé natolik, aby samy rozhodly; proto stoupá hodnota okolních důkazů a dobře vedeného řetězu (Chesney a Citron, 2019).

## Literatura

- ACPO (2012). *ACPO Good Practice Guide for Digital Evidence* (verze 5). Association of Chief Police Officers.
- Casey, E. (2011). *Digital Evidence and Computer Crime: Forensic Science, Computers and the Internet* (3rd ed.). Academic Press.
- Chesney, R., & Citron, D. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*, 107(6).
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- ISO/IEC (2012). *ISO/IEC 27037:2012 Information technology – Security techniques – Guidelines for identification, collection, acquisition and preservation of digital evidence*. International Organization for Standardization.
- Kent, K., Chevalier, S., Grance, T., & Dang, H. (2006). *Guide to Integrating Forensic Techniques into Incident Response* (NIST Special Publication 800-86). National Institute of Standards and Technology.
- Sweet, P. L. (2019). The sociology of gaslighting. *American Sociological Review*, 84(5).

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
