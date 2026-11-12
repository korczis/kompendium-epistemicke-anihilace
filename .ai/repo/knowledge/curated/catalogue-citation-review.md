---
schema: knowledge/v1
id: catalogue-citation-review
kind: knowledge
class: lesson
title: "Catalogue citation pass of 2026-11-10: attributions awaiting the owner's check"
description: "When reviewing citations on NLP-pattern or fallacy pages, or when a catalogue paragraph cites a work for a claim the work may not make."
status: verified
epistemics: observed
date: 2026-11-10
tags:
  - content
  - catalogues
  - sources
provenance:
  origin: authored
---

# Catalogue citation pass of 2026-11-10: attributions awaiting the owner's check

Main's IA requirement `citations` (every prose paragraph of 20+ words carries an author-year
citation) found 729 uncited paragraphs on 366 catalogue pages. Sixteen writers (agents of
session a70e6c7e) fixed them, each paragraph in one of four ways: a citation from
`data/sources.toml` the writer was confident of, a merge with an adjacent cited paragraph of
the same argument, a method-page link for the book's own frame (at most three per page), or a
more careful sentence that a listed work supports. Nothing was shortened, split or unlinked.

What follows for later work:

- The list below is every attribution a writer reported as less than fully sure. It is a
  reading of each work from memory, not a checked passage: verify against the book, and
  where a passage does not support the claim, weaken the sentence or cite a better work.
- Claims with no work in `data/sources.toml`: Miller and Sanjurjo's revision of the hot-hand
  study (`statisticke/horka-ruka`), dialectical behaviour therapy (`metaprogramy/emocni-zvladani`).
  Adding a work to the bibliography is the fix, never an invented citation.
- Pre-existing, not from this pass: Hahn a Oaksford 2007 is applied to ad populum, appeals to
  wealth and to consequences (`relevance`); the paper treats argument from ignorance,
  circularity and slippery slope.
- Merges to read as one argument: 16 in `relevance`, a few in other families.
- Instrument lesson: a helper that re-implements a gate's paragraph walk drifts from it (it
  missed the method-page exemption and read "1974) a ..." as a list item). Count with the
  gate's own function, `ia_model.academic_profile()`.

## Attributions reported as uncertain, by family

### raport-a-kalibrace (34 -> 0)
- Bandler a Grinder 1975b: linkage, analogue marking
- Grinder a Bandler 1981: slowing speech
- O'Connor a Seymour 1990: examples
- Rogers 1951: student-centred teaching
- Charvet 1997: placement

### submodality (45 -> 0; 36 cite, 9 rewrite)
- auditivni-submodality: (Rogers 1951; Satir 1972) inner evaluation forms; Satir loose
- swish: Bandler 1985 "trigger not reasons" is a reading; Singer a Lalich 1995 distance restores judgement
- kinesteticke-submodality: Singer a Lalich 1995 exhaustion/sleep (no page)
- mapovani-napric: Kirsch a Lynn 1995 expectations shape suggestion responses
- vyhozeni-kompulze: Gilovich 1991 natural fluctuation
- prostorove-umisteni-obrazu: James a Woodsmall 1988 spatial coding of time
- zmena-presvedceni-submodalitami + inner critic/voice: Beck 1976 evidence-testing beliefs
- vzorec-godiva, kinesteticky-swish: Cialdini 2009 liking defence
- zmena-kriticke-sebeprezentace: Lifton 1961 authority replaces judgement

### fauly/formalni (37 -> 0; 29 cite, 1 merge, 7 rewrite)
- klam-maskovaneho-muze: Hamblin 1970 Sophistical Refutations background (weakest)
- klam-maskovaneho-muze, klam-modalniho-rozsahu: Copi, Cohen a McMahon 2014 only as textbook definition
- _index, zamena-kvantifikatoru, vylucujici-premisy: Copi chapters unchecked
- klam-klamu: Damer 2009 charity principle
- klam-modalniho-rozsahu: Kahneman 2011 outcome bias
- klam-modalniho-rozsahu, zamena-kvantifikatoru: Bandler a Grinder 1975 modal operators / universal quantifiers

### kriticke-hodnoceni + integrace-casti + urovne-a-pozice (38 -> 0; 37 cite, 1 merge)
- systematicky-prehled-zdravi: Sturt a kol. 2012 NHS-resources conclusion
- delfska-studie: Norcross, Koocher a Garofalo 2006 (x2)
- delfska-studie, nlp-v-koucinku-vyzkum, stav-dukazu-nlp: Lilienfeld, Lynn a Lohr 2015 delay of effective care
- kriticke-hodnoceni/_index: Lilienfeld, Lynn a Lohr 2015 (x2) demarcation, burden of proof
- nlp-jako-pseudoveda: Tosey a Mathison 2009 differentiated appraisal
- treti-pozice, prvni-pozice: Herman 1992

### presupozice (42 -> 0; 42 cite)
- komentarova-adverbia, predikaty-uvedomeni, presupozice-casovych-vet: Bandler a Grinder 1975b examples unchecked
- presupozice-casovych-vet, poradove-cislovky: Singer a Lalich 1995
- presupozice-nebo: Erickson, Rossi a Rossi 1976 "all possibilities"
- srovnavaci-presupozice: Grice 1975 applied reading

### fauly/statisticke (32 -> 0; 22 cite, 1 merge, 9 rewrite)
- hracsky-klam: Damer 2009 dependent-case contrast
- horka-ruka: Miller-Sanjurjo finding uncited in substance (not in sources.toml) -> candidate source addition
- zkresleny-vyber: Huff 1954 (x3) general attributions
- _index: Gigerenzer 2002 professions list; Hahn a Oaksford 2007 reading

### jazykove-vzorce (36 -> 0; 31 cite, 2 merge, 3 rewrite)
- rozptylovac: Erickson, Rossi a Rossi 1976 confusion
- chunking-nahoru: O'Connor a Seymour 1990 value questions
- _index: Satir 1972 examples
- zatim: Bandler a Grinder 1975b
- smirovatel, obvinovatel: Herman 1992; Stark 2007
- zkusit: Levinson 1983 reasoning

### zakladni-pojmy + metaprogramy (41 -> 0; 37 cite, 1 merge, 3 rewrite)
- ekologicka-kontrola: Singer a Lalich 1995 LGAT chapter
- kongruence: O'Connor a Seymour 1990; logicke-urovne-pojem: Dilts 1990
- modelovani-pojem: Grinder a Bostic St. Clair 2001; percepcni-pozice-pojem: Grinder a DeLozier 1987
- predikaty: Bandler a Grinder 1979; uptime-a-downtime: Grinder a Bandler 1981
- vizualni-system: Roderique-Davies 2009
- emocni-zvladani: Vrij 2008 first cite; DBT sentence uncited (no DBT work in sources) -> candidate source
- metaprogramy-v-naboru: Charvet 1997 (x2)

### predpoklady (61 -> 0; 58 cite, 3 merge)
- nelze-nekomunikovat: Stark 2007 microregulation
- odpor-jako-nedostatek-raportu: Herman 1992 autonomy suppression
- respekt-k-modelu-sveta: Singer a Lalich 1995 doubt suppression; Cialdini 2009 time pressure
- lide-maji-potrebne-zdroje: Singer a Lalich 1995 upselling; Herman 1992 recovery via support
- clovek-neni-sve-chovani: Stark 2007 humiliation; Lifton 1961 doctrine over person
- neni-selhani-jen-zpetna-vazba: Festinger 1957 general dissonance (not effort justification)
- zkusenost-ma-strukturu: Ekman 2003
- _index: Bateson 1972 cybernetic loop; O'Connor a Seymour 1990; Lifton 1961 asymmetry
- mysl-a-telo, lide-maji-potrebne-zdroje, zkusenost-ma-strukturu: Lilienfeld, Lynn a Lohr 2015 general

### disociace-a-trauma + fauly/kauzalni (34 -> 0 gate; 33 cite/rewrite, 1 method link)
- alergicky-vzorec: method link [eticky kodex] on medical-responsibility paragraph (no confident source)
- alergicky-vzorec: Gilovich 1991 natural fluctuation; Singer a Lalich 1995 stress vulnerability
- _index: Lilienfeld, Lynn a Lohr 2015 EMDR exposure critique
- rewind, rychla-lecba-fobie: Lilienfeld, Lynn a Lohr 2015 pseudoscience warning signs
- reakce-na-kritiku: Herman 1992 self-blame
- vzorec-zalu: Andreas a Andreas 1989 grief pattern details
- kauzalni/_index: Damer 2009 causal group

### reframing + ericksonovska-hypnoza (49 -> 0; 46 cite, 3 reflow)
- amnezie-sugesci: Erickson, Rossi a Rossi 1976 distraction amnesia
- levitace-ruky: Kirsch a Lynn 1995 ideomotor scale items (inference)
- indukce-podanim-ruky: Kirsch a Lynn 1995 expectation > induction type
- ramec-dukazu: Herman 1992 petty rules
- predramcovani: Hassan 1988 doubt = weakness
- vnorene-smycky: Miller 1956 capacity only


### milton-model (59 -> 0; 58 cite, 1 rewrite)
- analogove-znaceni: Copi, Cohen a McMahon 2014 accent incl. typography
- ano-sada, truismy: Erickson, Rossi a Rossi 1976
- presupozice-milton: Bandler a Grinder 1975b disjunction trigger
- _index: Bandler a Grinder 1975b clustering in transcripts
- interpunkcni-dvojznacnost: Bandler a Grinder 1975b three forms; Petty a Cacioppo 1986 distraction
- negativni-prikazy: Damer 2009 innuendo (x2)
- nespecifikovana-slovesa-milton: Lifton 1961 applied
- rozsahova-dvojznacnost: Herman 1992 self-blame applied outside abuse context
- modalni-operatory-milton: Stark 2007; ztraceny-performativ-milton: Walton 2008

### cile-a-vysledky + casova-osa + sleight-of-mouth + vliv-a-zneuziti (48 -> 0 gate; 42 cite, 5 method link)
- dobre-formulovany-vysledek, kontext-cile, od-problemu-k-vysledku: O'Connor a Seymour 1990
- pruchod-casovou-osou: Dilts 1990
- terapie-casove-osy, korenova-pricina, limitujici-rozhodnuti, uvolneni-negativnich-emoci: James a Woodsmall 1988 procedure
- budouci-prehravani: Bandler a Grinder 1979; casove-kodovani: Bandler 1985; Andreas a Andreas 1987
- struktura-presvedceni-som: Beck 1976; Dilts 1990
- som-redefinice, som-hierarchie-kriterii, som-strategie-reality: Dilts 1999 paraphrase
- som-meta-ramec: Damer 2009 genetic; som-aplikace-na-sebe: Copi tu quoque
- konverzacni-hypnoza: Kirsch a Lynn 1995

### fauly/relevance (60 -> 0; 41 cite, 16 merge, 3 rewrite)
- otraveni-studny: Walton 2008 self-sealing variant
- _index: Walton 2008 ad hominem variants; Damer 2009 irrelevant appeals; Copi relevance
- lichotka: Copi vanity/snobbery; odvolani-na-autoritu: Copi celebrity endorsement
- genetic-klam: Damer 2009 positive evaluation
- anonymni-autorita: Huff 1954 unnamed lab
- cerveny-sled, tu-quoque: Watzlawick, Beavin a Jackson 1967
- odvolani-na-bohatstvi, irelevantni-zaver, chronologicky-snobismus, ad-populum: Lifton 1961 / Singer a Lalich 1995 / Hassan 1988 applied
- odvolani-na-dusledky, odvolani-na-soucit: Herman 1992
- odvolani-na-prirozenost: Gilovich 1991; odvolani-na-novost: Lilienfeld, Lynn a Lohr 2015
- odvolani-na-emoce: Tversky a Kahneman 1981 general framing only
- PRE-EXISTING: Hahn a Oaksford 2007 applied to ad populum / wealth / consequences (paper covers ignorance, circularity, slippery slope) -> owner check
- 16 merges: review that merged paragraphs read as one argument

### meta-model + kotveni + presvedceni (48 -> 0; 39 cite, 2 merge, 3 method link, 3 rewrite)
- kolaps-kotev: Bandler a Grinder 1979 stronger resource state (O'Connor a Seymour 1990 safer?)
- posuvna-kotva: Herman 1992 helping-relationship power imbalance
- limitujici-presvedceni: Singer a Lalich 1995 after-effects (merge)
- pricina-a-nasledek: Stark 2007 inference
- kruh-excelence, retezeni-kotev, stohovani-kotev: Singer a Lalich 1995 LGAT general

### remaining fauly + strategie + section indexes (62 -> 0; 55 cite, 2 merge, 5 method link)
- hodnoty-a-veda/_index: Boykoff a Boykoff 2004 policy delay; Lilienfeld, Lynn a Lohr 2015 self-correction
- kafkapast, bayesovske-pojeti-klamu: Hahn a Oaksford 2007 likelihood ratio
- falesna-vyvazenost: Cook, Lewandowsky a Ecker 2017
- pravopisna-strategie: Sharpley 1984 eye movements uncertain; Wiseman a kol. 2012 lying only
- strategie-a-modelovani/_index: Dilts a kol. 1980 utilization
- strategie-lasky: Herman 1992 intermittent favour
- kluzky-svah: Walton, Reed a Macagno 2008 three schemes
- zamlceni-dukazu: Grice 1975 applied
- sugestivni-otazka: Copi complex question; vytrzeni-z-kontextu: Copi accent
- posouvani-branek, ocelovy-panak: van Eemeren a Grootendorst 2004 applied

## Coverage entries of 2026-11-11 (owner review)

Fourteen entries were written to close the gaps the coverage gate found against the standard
references (data/<catalogue>/_coverage.toml); each cites only data/sources.toml and passes the
gate, but these attributions were reported as uncertain by their writers:

- Coverage sources: Damer 2009 and Govier 2010 lists could not be verified from a legitimate
  copy (only unofficial full texts exist online), so no coverage row rests on them; pages that
  cite them do so for general claims only. Hamblin 1970 rows rest on its chapter titles
  (library record of the 1993 reprint). Dilts 1999 is not a coverage source until the owner
  accepts verification through Dilts a DeLozier 2000.
- nedovolena-konverze: Hamblin 1970 (Aristotle's consequent), Whately 1826, Mill 1843
  (conversion among fallacies of ratiocination), Kahneman 2011 (example is a syllogism, not a
  conversion), Stanovich a West 2000 (general individual differences only).
- falesna-analogie, odvolani-na-precedent, nekonzistence: Govier 2010 (three uses), Damer 2009,
  Dilts 1999, Bentham 1824 (no-precedent and ancestors' wisdom), Walton, Reed a Macagno 2008
  (precedent and exceptions), Walton 2008 (pragmatic inconsistency), Hamblin 1970 (commitment
  stores), Paul a Matthews 2016, Bateson a kol. 1956.
- vagnost, rozliseni-bez-rozdilu, falesna-utecha: Tindale 2007 on vagueness (chapter verified,
  content paraphrased), Damer 2009 (misuse of a vague expression; distinction without a
  difference, from memory), Bentham 1824 (sham distinctions example; false consolation among
  fallacies of delay; vague generalities paraphrased), Herman 1992 and Festinger 1957 applied.
- vytvoreni-nove-casti, zmena-hodnot, zmena-metaprogramu, skryte-kotveni: Bandler a Grinder 1982
  (the new-part variant), James a Woodsmall 1988 (Massey periods, significant emotional events,
  meta-programs changing), Hall a Bodenhamer 1997, Charvet 1997, Dilts a DeLozier 2000 (covert
  anchoring headword), Hassan 1988, Bandler a Grinder 1979, Singer a Lalich 1995. An uncited
  origin clause (Cameron-Bandler) was removed from zmena-metaprogramu.
- obsah-a-vztah, interpunkce-komunikace, symetricka-a-komplementarni-interakce: Bateson 1972
  (deutero-learning and punctuation), Watzlawick, Beavin a Jackson 1967 (metacomplementarity,
  pseudosymmetry), Tosey a Mathison 2009 paraphrases, Walton 2008 cited for ad baculum and "two
  wrongs" (probably too broad), Satir 1972 wording, Stark 2007, Hassan 1988, O'Connor a Seymour
  1990 used as links drawn by the catalogue.
