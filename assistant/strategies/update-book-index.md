# update-book-index

## Objetivo
Atualizar o `_index.md` do livro com o progresso de leitura quando um capítulo é ingerido.

## Quando usar
- `/ingest` — após criar página(s) para um capítulo de livro

## Entrada
- Nome do livro (ex: `fundamentos-eng-software`)
- Número e título do capítulo
- Slug da página de conceito criada
- Data da ingestão

## Passos

1. **Localizar o `_index.md`** em `raw/books/<livro>/_index.md`.
2. **Marcar o capítulo como lido** — trocar `- [ ]` por `- [x]`.
3. **Adicionar data e wikilink** no formato:
   ```
   - [x] Cap N: Título — lido em YYYY-MM-DD, [[path/para/pagina|Nome de Exibição]]
   ```
4. **Usar wikilink relativo** a partir de `raw/books/<livro>/` (ex: `../../../wiki/concepts/slug|Título`).

## Saída
- `raw/books/<livro>/_index.md` atualizado

## Estratégias relacionadas
- `synthesize-page` — chamadora
- `update-index` — passo irmão (atualiza `index.md` da wiki)
- `update-log` — passo seguinte
