---
name: wiki-ask
description: "Responde perguntas sobre conceitos da Study Wiki com citações das fontes e links para as páginas relevantes."
disable-model-invocation: true
metadata:
  wiki_path: /Users/isabelam/Downloads/study-wiki
---

# /wiki-ask — Perguntar à Wiki

Responde perguntas sobre conceitos estudados com citações das fontes e links para páginas relevantes.

## Entrada

`/wiki-ask <pergunta>`

Ex: `/wiki-ask "Qual a diferença entre conascência estática e dinâmica?"`

## Fluxo

1. **search-wiki** — Buscar páginas relevantes na wiki por título, conteúdo, tags, aliases.
2. **cite-sources** — Montar resposta com:
   - Resumo em pt-BR
   - Citações das fontes (com caminho)
   - Links para páginas da wiki
   - Indicação de nível de cobertura (completa / parcial / não coberta)

## Estratégias usadas

- `assistant/strategies/search-wiki.md`
- `assistant/strategies/cite-sources.md`
