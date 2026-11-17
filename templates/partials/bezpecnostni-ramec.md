{#- The safety-framework table of the defensive sections. It was pasted on 40 technique
    pages, byte for byte, which is what duplicate-passage charges: a shared notice belongs
    in one place, and the rule names a Zola include as its remedy. The rows come from
    data/bezpecnostni-ramec.toml, so the table has one source and the pages have one copy. -#}
{% set ramec = load_data(path="data/bezpecnostni-ramec.toml") %}| Pojistka | Co znamená její nepřítomnost |
|---|---|
{% for p in ramec.pojistka %}| **{{ p.label }}** | {{ p.absence }} |
{% endfor %}
