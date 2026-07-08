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

## Diretrizes de Estilo Didático

O TL;DR e o Resumo devem ser **didáticos e envolventes**, não resumos secos. O usuário aprende melhor com:

### Estrutura narrativa em atos

Organize o Resumo como uma história com começo, meio e fim:
- **Ato 1 — O problema:** contexto, premissa antiga, o que estava errado
- **Ato 2 — A solução:** os conceitos novos, com definições claras e exemplos
- **Ato 3 — A aplicação prática:** caso de uso, kata, exemplo concreto que amarra tudo

### Elementos obrigatórios

- **Metáforas concretas:** use analogias do mundo real para explicar conceitos abstratos
- **Antes × Depois:** contraste a abordagem antiga com a nova (ex: "Antigamente fazia-se X. Agora, com Y, faz-se Z.")
- **Exemplos numéricos:** quando o capítulo trouxer números, use-os (ex: "Se o serviço A processa 1000 req/s e B aguenta 100 req/s...")
- **Diagramas ASCII:** para conceitos estruturais, use diagramas de bloco simples:
  ```
  ┌──────────┐     ┌──────────┐
  │  Quantum A │────▶│  Quantum B │
  └──────────┘     └──────────┘
  ```
- **Tabelas comparativas:** quando houver múltiplas entidades com atributos diferentes
- **Litmus tests:** se o capítulo oferecer um teste prático para decidir entre opções, destaque-o
- **Frase-resumo de uma sentença:** no final do Resumo ou do TL;DR, uma frase que capture a essência

### O que evitar

- Parágrafos longos sem quebra visual
- Listas genéricas de tópicos sem exemplos
- Jargão sem explicação
- Resumos que só repetem o índice do capítulo

## Estratégias usadas

- `assistant/strategies/extract-source.md`

## Convenções

- Idioma: `assistant/conventions/language.md`
- Títulos de arquivo sempre em português
- Template segue o modelo de capítulos anteriores como referência de estrutura

## Pitfalls

### EPUB (pandoc)

1. **Template de notas no final do source.** Alguns EPUBs da O'Reilly incluem um template de "Chapter Notes" como conteúdo do capítulo. Após extrair, verifique o final e remova qualquer template de notas — é artefato, não conteúdo real.
2. **Artefatos do pandoc.** O output contém marcadores HTML (`[]{#index_split...}`) e classes CSS (`{.xflip}`). Limpe com Python (`re.sub`) antes de salvar.
3. **Headers de página com número.** O source contém headers como `**92 | Chapter 7: Scope**`. Remova com regex.
4. **Palavras quebradas entre páginas.** O EPUB quebra palavras com hífen no limite de página: `syn‐\n\nchronous`. Reúna com Python: `re.sub(r'(\w)[\‐\-]\s*\n\s*(\w)', r'\1\2', content)`.
