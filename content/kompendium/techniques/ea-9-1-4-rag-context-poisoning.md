+++
title = "EA-9.1.4 RAG Context Poisoning"
description = "Vzorec, v němž zavádějící dokumenty vložené do znalostní báze AI systému (RAG) model cituje jako autoritativní zdroj. Znaky, odlišení, obrana organizace."
weight = 914

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-2-prompt-injection-EA", "ea-9-1-10-llm-recursion-loop", "ea-9-1-6-llm-source-attribution-bypass"]
ea_code = "EA-9.1.4"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.4 RAG Context Poisoning

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.4`
**Název:** RAG Context Poisoning
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*RAG context poisoning* je znečištění znalostní báze, z níž systém s *retrieval-augmented generation* (RAG) vybírá podklady k odpovědi – interní wiki, dokumentové úložiště, vektorový index. Do báze se dostanou dokumenty zavádějící, zastaralé nebo účelově formulované, systém je při dotazu vyhledá a model je podá jako ověřený zdroj s citací. Uživatel vidí odkaz na „firemní dokument“ a důvěřuje mu víc než obecné odpovědi.

## 3. Mechanismus (strukturálně)

RAG přenáší důvěru: model sám nic „neví“, ale opírá se o dokument, který byl do báze přijat, a uživatel předpokládá, že přijetí do báze znamená ověření. Kdo ovlivní, co v bázi leží, ovlivní i odpovědi všech, kdo se ptají – bez přístupu k modelu a bez kontaktu s uživatelem. Vzorec je tichý a dlouhodobý: jeden dokument může zkreslovat odpovědi měsíce. Strukturálně odpovídá [skrytému přepisování pravidel instituce](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md), jen v automatizované podobě.

## 4. Detekční markery

- Odpovědi systému se v určitém tématu změnily, aniž by se změnila oficiální politika nebo fakta.
- Citované dokumenty mají neznámého autora, nedávné datum vložení nebo nezapadají do struktury úložiště.
- Více různě formulovaných dotazů vede na tentýž neobvyklý dokument.
- Obsah citovaného dokumentu je v rozporu s primárními předpisy nebo s jinými dokumenty báze.
- V logu vyhledávání se objevují dokumenty, které nikdo z odpovědných lidí nezná.

## 5. Odlišení

*Zastaralá báze*: neúmyslné stárnutí dokumentů; projeví se rovnoměrně, ne cíleně v jednom tématu. *[EA-9.1.2 Prompt Injection EA](@/kompendium/techniques/ea-9-1-2-prompt-injection-EA.md)*: jednorázový pokyn ve vstupu, ne trvalá kontaminace zdroje. *Vnitřní spor o výklad*: legitimní, pokud oba dokumenty mají autora a schválení; problémem je skrytý původ.

## 6. Dopad a rámec

Zasaženi jsou především zaměstnanci, klienti a pacienti, kteří se systému ptají v dobré víře: dostávají špatné postupy, chybné informace o nárocích nebo zkreslené shrnutí. Organizace nese odpovědnost za informace, které její systém poskytuje; jde o otázku správy dat, řízení přístupu a [dokumentačních standardů](@/kompendium/organizational-defense/24-documentation-standards.md). Forenzně je podstatné zachovat historii báze, aby se dalo zjistit, kdy a kým byl dokument vložen.

## 7. Obrana a zotavení

*Správa báze*: přijímat dokumenty jen s autorem, datem a schválením; verzovat a pravidelně auditovat. *Systém*: zobrazovat uživateli zdroj, datum a autora citace; u citlivých témat preferovat primární předpisy. *Uživatelé*: u rozhodnutí s následky ověřit citovaný dokument a jeho platnost. *Po zjištění*: odstranit dokument, dohledat odpovědi, které na něm stály, a informovat dotčené.

## 8. Příklad (anonymizovaný kompozit)

Interní asistent velké nemocnice odpovídá zaměstnancům na dotazy o postupech. Po několika týdnech si sestry všimnou, že u jednoho postupu dostávají jiné pokyny než dříve. Audit báze ukáže dokument nahraný z neověřeného účtu, který kopíruje strukturu oficiálních směrnic, ale obsahuje zastaralý postup. Dokument se odstraní, dotčená oddělení dostanou opravu a nemocnice zavede schvalování nových dokumentů před indexací.

## 9. Meze a otevřené otázky

Ne každé zkreslení odpovědi RAG systému je otrava – častější je špatná kvalita dokumentů nebo nevhodné vyhledávání. Otevřenou otázkou zůstává, jak auditovat velké báze průběžně, aniž by se z nich stala nepoužitelná byrokracie.

Otevřenou otázkou je, jak auditovat báze, které se mění denně, a kdo má v organizaci nést odpovědnost za jejich obsah.

Nález dokumentu bez doloženého původu neprokazuje, že jej někdo do báze vložil se zlým záměrem:
tentýž stav vzniká běžným provozem, kde pracovní poznámka skončí vedle schváleného předpisu.
Pasquale (2015) klade požadavek průhlednosti na správce systému, čímž zároveň naznačuje hranici
takového zjištění — chybějící původ je vada správy, nikoli doklad o aktérovi.

*Interpretace knihy*: změna odpovědi bez změny předpisu je proto důvodem k nahlédnutí do báze, ne
závěrem o kontaminaci. Rozpoznání vzorce rovněž nevypovídá o tom, nakolik odpověď ovlivnila
rozhodování; ochota přijímat výstup systému bez kontroly je doložena obecně (Parasuraman a Manzey
2010), nikoli pro jednotlivý případ.

## 10. Pohled zevnitř a práce s postiženým

Zaměstnanec, který podle chybné odpovědi jednal, se často obává postihu, ačkoli postupoval v dobré víře podle systému, který mu organizace dala. Po incidentu je proto důležité jasně říct, že odpovědnost nese správa báze, a umožnit lidem nahlásit podezřelé odpovědi bez obav. Klienti, kterých se chybná informace dotkla, mají dostat srozumitelnou opravu a cestu k nápravě následků. Tím se obnovuje i důvěra v systém, bez níž by ho lidé přestali používat, nebo ho naopak používali bez jakékoli kontroly.

## 11. Postup při podezření na kontaminaci báze

1. **Zaznamenat sporné odpovědi** s datem, dotazem a citovanými dokumenty.
2. **Dohledat citované dokumenty**, jejich autora, datum vložení a schválení.
3. **Porovnat s primárními předpisy** a s historií báze.
4. **Odstranit nebo karanténovat** sporný dokument a dokumentovat zásah.
5. **Informovat uživatele**, kteří mohli podle odpovědí jednat.

## 12. Prevence a odolnost

Prevence stojí na správě znalostní báze jako kritické infrastruktury: přijímání dokumentů se schválením, verzování, pravidelné audity a oddělení závazných předpisů od pracovních materiálů. Uživatelé by měli být vedeni k tomu, aby u rozhodnutí s následky citovaný dokument otevřeli.

## Odborný kontext

Systémy s vyhledáváním podkladů přenášejí problém důvěryhodnosti z modelu na korpus: kvalita odpovědi závisí na tom, co leží v bázi, a uživatel vidí citaci, nikoli proces výběru. Bezpečnostní práce o nepřímé injekci pokynů ukázala, že obsah, který systém načte z externích zdrojů, může jeho výstup řídit stejně účinně jako přímý dotaz (Greshake et al. 2023). U interních znalostních bází jde o tentýž princip v dlouhodobé podobě – jeden dokument ovlivňuje odpovědi mnoha lidem po dlouhou dobu.

Organizační rozměr vzorce popisuje literatura o automatizaci: lidé méně kontrolují systémy, které se obvykle osvědčují, a výstupu systému dávají přednost před vlastním úsudkem (Parasuraman a Manzey 2010). Citace „firemního dokumentu“ tento efekt ještě posiluje, protože propůjčuje odpovědi institucionální autoritu. Pasquale (2015) v obecnější rovině upozorňuje, že neprůhledné informační systémy přesouvají moc k těm, kdo řídí jejich vstupy, a že bez možnosti nahlédnout do nich nelze odpovědnost uplatnit.

Pro správu bází z toho vyplývá požadavek, který zná archivnictví i forenzní praxe: u každého dokumentu musí být doložen původ, autor, datum a schválení, a změny musí být dohledatelné. Bez těchto údajů nelze po incidentu zjistit, kdy kontaminace začala a které odpovědi ovlivnila.

## Souvislosti pro praxi

V praxi se osvědčuje rozdělit znalostní bázi na vrstvy podle závaznosti: primární předpisy a schválené postupy, pracovní dokumenty a neformální poznámky. Systém by měl u každé odpovědi ukázat, z jaké vrstvy čerpal, a u citlivých témat (zdraví, právo, bezpečnost) odpovídat jen z první vrstvy. Pravidelný audit by měl zahrnovat i namátkové dotazy na sporná témata a porovnání odpovědí v čase; náhlá změna odpovědi bez změny předpisu je nejspolehlivějším vodítkem k tomu, že se v bázi něco změnilo.

## Literatura

- Greshake, K., Abdelnabi, S., Mishra, S., Endres, C., Holz, T., & Fritz, M. (2023). Not what you've signed up for: Compromising real-world LLM-integrated applications with indirect prompt injection. *Proceedings of AISec*.
- Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors*.
- Pasquale, F. (2015). *The Black Box Society: The Secret Algorithms That Control Money and Information*. Harvard University Press.

## Související

**Sourozenecké techniky**

- [EA-9.1.2 Prompt Injection EA](@/kompendium/techniques/ea-9-1-2-prompt-injection-EA.md) – jednorázový vstup místo kontaminace báze.
- [EA-9.1.10 LLM Recursion Loop](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md) – kontaminace trénovacích dat v širším měřítku.
- [EA-9.1.6 LLM Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – citace dodávající falešnou autoritu.

**Organizační obrana**

- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md) – původ a schválení dokumentů.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md) – kdo smí co do báze vložit.
- [Reakce na incidenty](@/kompendium/organizational-defense/31-incident-response-EA.md) – postup po odhalení kontaminace.

**Detekce a forenzní stopa**

- [Detekční signatura: Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – vložený obsah v informačním toku.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – zachování historie báze.
