+++
title = "Galerie"
description = "Generativní grafika kompendia v p5.js: rozpad sítě pojmů, eroze paměti a rekonstituce."
weight = 905
[extra]
toc = false
+++

Tři generativní obrazy k ústředním motivům knihy. Nejde o simulace konkrétních technik, ale
o vizuální metafory: struktura poznání, která se rozpadá, a struktura, která se obnovuje.
Vykresluje je [p5.js](https://p5js.org/) přímo v prohlížeči; při zapnutém omezení pohybu
v systému se zobrazí jeden statický snímek.

## Rozpad sítě pojmů

Pravidelná síť představuje propojené pojmy, ze kterých člověk skládá obraz reality. V ohnisku
rozkladu se vztahy trhají, pojmy se vzdalují ze svého místa a rudnou; mimo ohnisko se síť
vrací do původního tvaru. Pohybem myši ohnisko posunete, posuvníkem měníte intenzitu.

<figure class="not-format my-6">
  <div class="overflow-hidden rounded-lg border border-gray-200 dark:border-gray-700" data-p5="rozpad" data-ratio="0.6" data-intensity="0.75"></div>
  <label class="mt-3 block text-sm text-gray-500 dark:text-gray-400">Intenzita rozkladu
    <input type="range" min="0" max="1" step="0.01" value="0.75" data-p5-intensity class="mt-1 h-2 w-full cursor-pointer appearance-none rounded-lg bg-gray-200 dark:bg-gray-700">
  </label>
</figure>

Souvisí s kapitolami [Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md) a
[Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md).

## Eroze paměti

Slova, o která se opírá úsudek: pravda, paměť, důvěra, význam. Písmena se postupně zaměňují
a mizí, tak jako se při rekonstrukci paměti ztrácí přesnost vzpomínky. Najetím myší na slovo
se obnoví: pozornost a ověřování drží význam pohromadě.

<figure class="not-format my-6">
  <div class="overflow-hidden rounded-lg border border-gray-200 dark:border-gray-700" data-p5="eroze" data-ratio="0.5"></div>
</figure>

Souvisí s heslem [EA-1.2.2 Paměťová rekonstrukce](@/kompendium/techniques/ea-1-2-2-memorni-rekonstrukce.md).

## Rekonstituce

Rozptýlené fragmenty se pomalu skládají zpět do soustředných kruhů vztahů. Obnova je
záměrně pomalejší než rozpad: zotavení je proces, ne okamžik. Kliknutím fragmenty znovu
rozptýlíte.

<figure class="not-format my-6">
  <div class="overflow-hidden rounded-lg border border-gray-200 dark:border-gray-700" data-p5="rekonstituce" data-ratio="0.6"></div>
</figure>

Souvisí s kapitolami [Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) a
[Protokoly zotavení](@/kompendium/recovery-protocols/_index.md).

## Další vizualizace

Interaktivní grafy, 3D modely a simulace k jednotlivým kapitolám jsou v sekci
[Vizualizace](@/kompendium/visualizations/_index.md).
