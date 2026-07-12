# synthesize-source-summary

## Objetivo
Criar ou atualizar uma página de sumário em `wiki/summaries/` que agrega
todos os conceitos vindos de uma mesma fonte (livro, curso, artigo, talk).

## Quando usar
- `/wiki-ingest` — após `update-index`, se a fonte ainda não tem sumário
- Sob demanda: "cria um sumário do livro Fundamentos"

## Entrada
- Fonte primária (ex: `raw/books/fundamentos-eng-software/`)
- Páginas da wiki cujo frontmatter `sources` referencia essa fonte
- `raw/books/<livro>/_index.md` — progresso de leitura (se for livro)

## Passos

1. **Identificar páginas** que referenciam a fonte no campo `sources`.
2. **Agrupar por tipo** (concepts, comparisons, recipes, queries).
3. **Extrair metadados**:
   - Para livros: progresso de leitura do `_index.md`
   - Para cursos: módulos concluídos
   - Para artigos/talks: entendimento (`understanding`)
4. **Criar ou atualizar** a página em `wiki/summaries/<slug-da-fonte>.md`.

### Template da página

```markdown
---
title: "Fundamentos de Engenharia de Software"
created: "2026-06-18"
updated: "2026-07-12"
type: summary
tags:
  - book-notes
  - architecture
sources:
  - raw/books/fundamentos-eng-software/
competencies:
  - architecture
  - technical-breadth
understanding: high
aliases:
  - Fundamentals of Software Architecture
  - Ford Richards
---

# Fundamentos de Engenharia de Software

**Autores:** Mark Richards, Neal Ford
**Progresso:** 7/12 capítulos (58%)

## Conceitos

| # | Conceito | Cap | Entendimento |
|---|----------|-----|-------------|
| 1 | [[arquitetura-de-software|Arquitetura de Software]] | 1-2 | high |
| 2 | [[modularidade|Modularidade]] | 3 | high |
| 3 | [[conascencia|Conascência]] | 3 | medium |
| 4 | [[caracteristicas-arquiteturais|Características Arquiteturais]] | 4 | high |
| 5 | [[identificacao-caracteristicas-arquiteturais|Identificação de Características]] | 5 | high |
| 6 | [[medicao-caracteristicas-arquiteturais|Medição de Características]] | 6 | high |
| 7 | [[fitness-functions|Fitness Functions]] | 6 | medium |
| 8 | [[architecture-quantum|Architecture Quantum]] | 7 | high |

## Capítulos

- [x] Cap 1-2: Introdução e Pensamento Arquitetônico — 21 Jun 2026
- [x] Cap 3: Modularidade — 21 Jun 2026
- [x] Cap 4: Definição das Características da Arquitetura — 1 Jul 2026
- [x] Cap 5: Identificando Características Arquiteturais — 6 Jul 2026
- [x] Cap 6: Medindo e Controlando as Características Arquiteturais — 8 Jul 2026
- [x] Cap 7: Escopo das Características Arquiteturais — 8 Jul 2026
- [ ] Cap 8: ...

## Conexões

- `assistant/domain/competencies.md` — este livro cobre architecture e technical-breadth
```

### Para fontes que não são livros

Adaptar o template:
- **Artigos:** sem seção de capítulos. Incluir URL original e data de leitura.
- **Cursos:** incluir módulos/seções em vez de capítulos.
- **Talks:** incluir link, evento, data.

## Saída
- `wiki/summaries/<slug>.md` criado ou atualizado
- `index.md` atualizado com entrada na seção Summaries

## Estratégias relacionadas
- `update-index` — passo seguinte
- `update-log` — registrar criação
