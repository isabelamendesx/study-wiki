---
name: wiki-prepare
description: "Extrai um capítulo de livro do EPUB, cria o source e preenche TL;DR + Resumo no template para a Study Wiki."
metadata:
  wiki_path: "/Users/isabelam/Downloads/study-wiki"
---

# /prepare — Preparar Fonte para Estudo

Extrai um capítulo de livro do EPUB (via pandoc), cria o `.source.md`, e preenche o template com TL;DR + Resumo.

## Entrada

O usuário informa o livro e o capítulo: `/prepare <livro> <capítulo>`

Ex: `/prepare fundamentos-eng-software cap-5`

## Fluxo

1. **Localizar o EPUB** em `raw/books/<livro>/sources/livro.epub`
2. **Extrair o capítulo** com pandoc
3. **Limpar artefatos** (marcadores HTML, linhas de página quebradas)
4. **Salvar source** em `raw/books/<livro>/sources/cap-NN.source.md`
5. **Ler o source** e preencher **TL;DR e Resumo** no template (em pt-BR)
6. **Criar o arquivo** em `raw/books/<livro>/<NN> - <título em pt-BR>.md`
7. **Dizer ao usuário**: "Pronto! Complete com seus insights e depois chame /ingest"

## Estratégias usadas

- `assistant/strategies/extract-source.md`

## Convenções

- Idioma: `assistant/conventions/language.md`
- Títulos de arquivo sempre em português
- Template segue o modelo de `config/templates/capitulo-livro.md`
