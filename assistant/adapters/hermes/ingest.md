---
name: wiki-ingest
description: "Ingere uma fonte de estudo (capítulo de livro, artigo) e cria páginas na Study Wiki, discutindo com o usuário antes de sintetizar."
metadata:
  wiki_path: "/Users/isabelam/Downloads/study-wiki"
---

# /ingest — Ingestão de Fonte

Lê uma fonte e a transforma em página(s) na wiki, discutindo os pontos principais com o usuário primeiro.

## Entrada

`/ingest <caminho-da-fonte>` ou `/ingest <livro> <capítulo>`

Ex: `/ingest fundamentos-eng-software cap-5`

## Fluxo

1. **discuss-source** — Ler a fonte, resumir, destacar novidades, perguntar. Aguardar OK do usuário.
2. **synthesize-page** — Criar página(s) na wiki usando o template adequado (`assistant/templates/`).
3. **enrich-visuals** — Adicionar diagramas Mermaid (paleta Minimalista TCC), tabelas, callouts.
4. **map-competencies** — Mapear para áreas de engenharia de software.
5. **update-graph** — Adicionar wikilinks (pipe syntax, mínimo 2).
6. **update-index** — Atualizar `index.md`.
7. **update-competency-map** — Atualizar `acompanhamento-competencias.md`.
8. **update-log** — Registrar a ingestão em `log.md`.

## Estratégias usadas

- `assistant/strategies/discuss-source.md`
- `assistant/strategies/synthesize-page.md`
- `assistant/strategies/enrich-visuals.md`
- `assistant/strategies/map-competencies.md`
- `assistant/strategies/update-graph.md`
- `assistant/strategies/update-index.md`
- `assistant/strategies/update-competency-map.md`
- `assistant/strategies/update-log.md`

## Convenções

- `assistant/conventions/frontmatter.md`
- `assistant/conventions/wikilinks.md`
- `assistant/conventions/language.md`
- `assistant/conventions/visual-enrichment.md`

## Domínio

- `assistant/domain/page-types.md`
- `assistant/domain/competencies.md`
- `assistant/domain/taxonomy.md`

## Templates

- `assistant/templates/` — usar o template correspondente ao tipo de página
