# Assistente da Wiki de Estudos

Bem-vinda ao assistente da sua wiki de estudos. Este arquivo é a porta de entrada — leia aqui para entender como o sistema funciona.

## Arquitetura: Commands + Strategies + Wiki

```
study-wiki/
├── ASSISTANT.md          ← você está aqui
├── assistant/            ← engenharia do assistente
│   ├── strategies/       ← 21 estratégias reutilizáveis (tool-agnostic)
│   ├── adapters/         ← wrappers para cada ferramenta (Hermes, Claude, OpenCode)
│   │   └── hermes/       ← 7 skills instaláveis no Hermes
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
| `wiki-progress` | Consultar progresso de leitura e gaps de competência

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

**`/prepare fundamentos-eng-software cap-5`**

A LLM extrai o capítulo do EPUB e cria o template com **TL;DR e Resumo preenchidos**. Você completa com insights, citações, dúvidas. Depois:

**`/ingest fundamentos-eng-software cap-5`**

A LLM lê suas anotações, discute os pontos principais e cria página(s) na wiki.

### Estudar artigos, cursos, palestras

Coloque a fonte em `raw/articles/`, `raw/courses/` ou `raw/talks/` e chame `/ingest` direto:

**`/ingest raw/articles/artigo-sobre-kafka.md`**

Sem `/prepare` — artigos não precisam de extração de EPUB.

### Verificar seu entendimento

**`/assess arquitetura-de-software`**

A LLM gera perguntas, você responde, e ela avalia atualizando o campo `understanding`.

### Ver progresso e gaps

**`/progress`**

Mostra cobertura por competência, gaps de estudo e progresso de leitura.

### No dia a dia

**`/crystallize`** — captura aprendizado de qualquer sessão.  
**`/ask "o que é conascência?"`** — consulta a wiki com citações.  
**`/lint`** — verifica saúde da wiki.

## Ciclos de uso

```
Livro:    EPUB → /prepare → anotar → /ingest → /assess → /progress
Artigo:   raw/  → /ingest → /assess
Dia a dia: /crystallize | /ask | /lint | /progress
```

## Links

- `assistant/domain/` — tipos de página, competências, taxonomia
- `assistant/conventions/` — frontmatter, wikilinks, idioma, nomenclatura, enriquecimento visual
- `assistant/templates/` — modelos para cada tipo de página
