---
name: wiki-prepare
description: "Extrai um capítulo de livro do EPUB, cria o source e preenche TL;DR + Resumo no template para a Study Wiki."
metadata:
  wiki_path: /Users/isabela.gomes/SandBoxes/study-wiki
---

# /prepare — Preparar Fonte para Estudo

Extrai um capítulo de livro do EPUB (via pandoc), cria o `.source.md`, e preenche o template com TL;DR + Resumo.

## Entrada

O usuário informa o livro e o capítulo: `/prepare <livro> <capítulo>`

Ex: `/prepare fundamentos-eng-software cap-5`

## Fluxo

**Primeiro, detecte o formato** em `raw/books/<livro>/sources/`:
- Se houver `.epub` → siga o **Fluxo EPUB** abaixo
- Se houver `.pdf` (e não houver `.epub`) → siga o **Fluxo PDF**

### Fluxo EPUB (pandoc)

1. **Localizar o EPUB** em `raw/books/<livro>/sources/livro.epub`
2. **Extrair o capítulo** com pandoc: `pandoc livro.epub -t markdown --wrap=none`
3. **Identificar o capítulo** pela marcação `**CHAPTER N**` e extrair até `**CHAPTER N+1**`
4. **Limpar artefatos** (marcadores HTML, linhas de página quebradas)
5. **Salvar source** em `raw/books/<livro>/sources/cap-NN.source.md`
6. **Ler o source** e preencher **TL;DR e Resumo** no template (em pt-BR)
7. **Criar o arquivo** em `raw/books/<livro>/<NN> - <título em pt-BR>.md`
8. **Dizer ao usuário**: "Pronto! Complete com seus insights e depois chame /ingest"

### Fluxo PDF (pdftotext)

1. **Localizar o PDF** em `raw/books/<livro>/sources/book.pdf` (ou qualquer `.pdf`)
2. **Extrair texto completo**: `pdftotext -layout book.pdf /tmp/book_full.txt`
3. **Encontrar os limites do capítulo**: `grep -n "CHAPTER [0-9]" /tmp/book_full.txt` — anote a linha de início do capítulo N e a linha de início do capítulo N+1
4. **Extrair o trecho**: `sed -n '<linha_inicio>,<linha_fim>p' /tmp/book_full.txt`
5. **Limpar artefatos de PDF** (ver referência: `references/pdf-cleanup.md`):
   - Remover form feeds (`\f`)
   - Reunir palavras hifenizadas na quebra de linha (`\w)‐\n\s*(\w` → `\1\2`)
   - Remover cabeçalhos/rodapés de página (`NNN | Chapter N: ...`)
   - Remover números de página isolados
   - Normalizar linhas em branco
6. **Salvar source** em `raw/books/<livro>/sources/cap-NN.source.md`
7. **Ler o source** e preencher **TL;DR e Resumo** no template (em pt-BR). O título do capítulo em português pode ser consultado no `_index.md` do livro.
8. **Criar o arquivo** em `raw/books/<livro>/<NN> - <título em pt-BR>.md` (seguir o template de capítulos anteriores como referência de estrutura)
9. **Dizer ao usuário**: "Pronto! Complete com seus insights e depois chame /ingest"

## Estratégias usadas

- `assistant/strategies/extract-source.md`

## Referências

- `references/pdf-cleanup.md` — receita de limpeza de artefatos de PDF (Python com regex)

## Convenções

- Idioma: `assistant/conventions/language.md`
- Títulos de arquivo sempre em português: `<NN> - <título-traduzido>.md` (ex: `5 - Identificando Caracteristicas Arquiteturais.md`)
- Template criado diretamente com TL;DR + Resumo preenchidos pela LLM

## Pitfalls

### EPUB
1. **Template de notas no final do source.** Alguns EPUBs da O'Reilly incluem um template de "Chapter Notes" como conteúdo do capítulo. Após extrair com pandoc, verifique o final do source e remova qualquer template de notas (começa com `# Cap null: null` ou similar) — isso é artefato do EPUB, não conteúdo real.
2. **Artefatos do pandoc.** O output do pandoc contém marcadores HTML (`[]{#index_split...}`) e classes CSS (`{.xflip}`). Limpe com `sed 's/\[\]{#[^}]*}//g; s/{\.\\w+}//g'` antes de salvar o source.
3. **Linhas de página quebradas.** O EPUB da O'Reilly intercala números de página como `**65**` no meio das frases. O pandoc não consegue removê-los. Considere limpar manualmente ou aceitar como ruído aceitável.

### PDF
4. **O pdftotext -layout é essencial.** Sem `-layout`, o texto perde a estrutura de parágrafos e os capítulos ficam ilegíveis.
5. **Cabeçalhos/rodapés de página.** O formato é tipicamente `NNN | Chapter N: Título`. Use regex para removê-los; a referência `pdf-cleanup.md` tem o padrão exato.
6. **Palavras hifenizadas na quebra de linha.** PDFs quebram palavras com `‐` (Unicode hyphen, U+2010) ou `-` (ASCII) no final da linha. O script de limpeza deve tratar ambos.
