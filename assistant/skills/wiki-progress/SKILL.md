---
name: wiki-progress
description: "Consulta e atualiza o progresso de leitura e gaps de competência na Study Wiki."
disable-model-invocation: true
metadata:
  wiki_path: /Users/isabelam/Downloads/study-wiki
---

# /wiki-progress — Progresso e Gaps

Consulta o progresso de leitura dos livros e identifica gaps de cobertura por área de engenharia de software.

## Entrada

`/wiki-progress` — gaps de competência + progresso geral  
`/wiki-progress fundamentos-eng-software` — progresso de um livro específico

## Fluxo

1. **competency-gaps** — Identificar:
   - Áreas com zero páginas (gap total)
   - Áreas com 1-2 páginas (cobertura baixa)
   - Áreas com understanding médio = low (profundidade baixa)
   - Sugerir próximos temas de estudo
2. **reading-progress** — Atualizar progresso em `_index.md`:
   - Marcar capítulos concluídos com data
   - Reportar "X de Y capítulos (Z%)"
3. **update-log** — Registrar a atualização.

## Estratégias usadas

- `assistant/strategies/competency-gaps.md`
- `assistant/strategies/reading-progress.md`
- `assistant/strategies/update-log.md`
