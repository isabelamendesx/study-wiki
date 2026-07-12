# Assistente da Wiki de Estudos

Bem-vinda ao assistente da sua wiki de estudos. Este arquivo é a porta de entrada — leia aqui para entender como o sistema funciona.

## Arquitetura: Commands + Strategies + Wiki

```
study-wiki/
├── ASSISTANT.md          ← você está aqui
├── assistant/            ← engenharia do assistente
│   ├── strategies/       ← 21 estratégias reutilizáveis (tool-agnostic)
│   ├── adapters/         ← wrappers para cada ferramenta (Hermes, Claude, OpenCode)
│   │   └── hermes/       ← 9 skills instaláveis no Hermes
│   ├── domain/           ← modelo de domínio (tipos, competências, taxonomia)
│   ├── conventions/      ← regras de formatação e estilo
│   └── templates/        ← modelos para criar páginas
├── wiki/                 ← CONTEÚDO (o protagonista)
└── raw/                  ← fontes brutas imutáveis
```

## Skills disponíveis (Hermes)

| Skill | O que faz |
|---|---|
| `wiki-ingest` | Ingerir nova fonte de estudo → criar página(s) na wiki |
| `wiki-prepare` | Extrair capítulo de livro do EPUB e preencher TL;DR + Resumo |
| `wiki-ask` | Perguntar sobre conceitos estudados (com citações) |
| `wiki-assess` | Autoavaliação: gera perguntas, avalia respostas |
| `wiki-lint` | Verificação de saúde da wiki (links, frontmatter, órfãs, etc.) |
| `wiki-crystallize` | Destilar sessão de estudo em aprendizado consolidado |
| `wiki-progress` | Consultar progresso de leitura e gaps de competência |
| `wiki-roadmap` | Configurar ou revisar o plano de estudos (roadmap) |
| `wiki-review` | Resumo de estudos: o que estudou, revisar, progresso |

## 🎯 Como usar

> Este guia assume que você está conversando com a LLM assistente da wiki.

### Adicionar um livro novo

Coloque o EPUB em `raw/books/<nome-do-livro>/sources/livro.epub`.

```
raw/books/fundamentos-eng-software/
├── _index.md                      ← progresso de leitura
└── sources/
    └── livro.epub                 ← livro em formato EPUB
```

Depois peça: *"Cria o _index.md pro livro Fundamentos"*.

### Estudar um capítulo de livro

**`/wiki-prepare fundamentos-eng-software cap-5`**

A LLM extrai o capítulo do EPUB e cria o template com **TL;DR e Resumo preenchidos**. Você completa com insights, citações, dúvidas. Depois:

**`/wiki-ingest fundamentos-eng-software cap-5`**

A LLM lê suas anotações, discute os pontos principais e cria página(s) na wiki.

### Estudar artigos, cursos, palestras

Coloque a fonte em `raw/articles/`, `raw/courses/` ou `raw/talks/` e chame `/wiki-ingest` direto:

**`/wiki-ingest raw/articles/artigo-sobre-kafka.md`**

Sem `/wiki-prepare` — artigos não precisam de extração de EPUB.

### Verificar seu entendimento

**`/wiki-assess arquitetura-de-software`**

A LLM gera perguntas, você responde, e ela avalia atualizando o campo `understanding`.

### Ver progresso e gaps

**`/wiki-progress`**

Mostra cobertura por competência, gaps de estudo e progresso de leitura.

### No dia a dia

**`/wiki-crystallize`** — captura aprendizado de qualquer sessão.
**`/wiki-ask "o que é conascência?"`** — consulta a wiki com citações.
**`/wiki-lint`** — verifica saúde da wiki.

### Revisar estudos

**`/wiki-review`** — resumo da semana (padrão)
**`/wiki-review today`** — o que estudei hoje
**`/wiki-review month`** — resumo do mês

Mostra: o que estudou no período, conceitos que precisa revisar
(baseado em tempo desde última visita), e progresso no roadmap.

### Configurar seu plano de estudos

**`/wiki-roadmap`**

A LLM guia você por 3 etapas:
1. Define seu perfil (cargo, stacks, objetivo) e fontes de referência
2. Sugere áreas de foco baseadas em dados (roadmap.sh)
3. Detalha tópicos específicos pra cada área

O resultado é um roadmap em `assistant/domain/competencies.md` que
alimenta `/wiki-progress` e `/wiki-assess`.

## Ciclos de uso

```
Livro:    EPUB → /wiki-prepare → anotar → /wiki-ingest → /wiki-assess → /wiki-progress
Artigo:   raw/  → /wiki-ingest → /wiki-assess
Revisão:  /wiki-review → resumo + o que revisar
Dia a dia: /wiki-crystallize | /wiki-ask | /wiki-lint | /wiki-progress | /wiki-review
```

## Links

- `assistant/domain/` — tipos de página, competências, taxonomia
- `assistant/conventions/` — frontmatter, wikilinks, idioma, nomenclatura, enriquecimento visual
- `assistant/templates/` — modelos para cada tipo de página
