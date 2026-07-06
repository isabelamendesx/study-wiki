# Frontmatter YAML

Toda página em `wiki/concepts/`, `wiki/comparisons/`, `wiki/queries/`, `wiki/recipes/` e `wiki/summaries/` deve começar com o seguinte bloco frontmatter.

## Template

```yaml
---
title: "Título da Página"
created: "2026-06-18"
updated: "2026-06-18"
type: concept             # concept | comparison | query | recipe | summary
tags:
  - ai-engineering
  - code-agents
sources:
  - raw/articles/artigo-sobre-agentes.md
competencies:             # Áreas de engenharia de software que esta página cobre
  - technical-breadth
  - ai-engineering
understanding: high       # high | medium | low — o quanto EU entendi
aliases:
  - Nome alternativo 1
  - Nome alternativo 2
---
```

## Semântica dos campos

| Campo | Obrigatório | Descrição |
|---|---|---|
| `title` | sim | Título de exibição; igual ao H1 da página. |
| `created` | sim | Data ISO (YYYY-MM-DD) de criação da página. |
| `updated` | sim | Data ISO (YYYY-MM-DD) da última edição significativa. |
| `type` | sim | Um de: `concept`, `comparison`, `query`, `recipe`, `summary`. |
| `tags` | sim | Lista de tags da taxonomia aprovada (ver `assistant/domain/taxonomy.md`). Mínimo 1. |
| `sources` | sim | Lista de caminhos para fontes brutas em `raw/` que sustentam esta página. Para `recipe`, pode ser `[]` (know-how da experiência). |
| `competencies` | sim | Lista de slugs das áreas de engenharia de software que esta página cobre. |
| `understanding` | sim | `high` (dominei), `medium` (entendi mas precisa revisitar), `low` (ainda confuso). |
| `aliases` | sim | Lista de nomes alternativos para busca e autocomplete no Obsidian. |
