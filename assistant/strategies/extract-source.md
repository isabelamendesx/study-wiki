# extract-source

## Objetivo
Extrair um capítulo específico de um livro em EPUB e criar o `.source.md` correspondente em `raw/books/<livro>/sources/`, usando `pandoc`.

## Quando usar
- `/prepare` — antes de `/ingest`, para preparar a fonte

## Entrada
- Caminho para o livro em `raw/books/<nome-do-livro>/sources/livro.epub`
- Número ou título do capítulo

## Dependências
- `pandoc` instalado no sistema

## Passos

1. **Localizar o EPUB** em `raw/books/<nome-do-livro>/sources/livro.epub`.
2. **Extrair o livro completo para markdown** com `pandoc`:
   ```bash
   pandoc livro.epub -t markdown --wrap=none 2>/dev/null
   ```
3. **Identificar o capítulo** pela marcação `**CHAPTER N**`:
   - Encontrar a linha de início (`**CHAPTER N**`)
   - Encontrar a linha de início do próximo capítulo (`**CHAPTER N+1**`) ou fim do arquivo
4. **Extrair o trecho** entre os dois marcadores (capítulo N e capítulo N+1).
5. **Limpar artefatos** do pandoc: remover `[]{#...}`, `{.\w+}`, e verificar se não há conteúdo extra (ex: template de notas embutido no EPUB) após o final do capítulo.
6. **Salvar em** `raw/books/<nome-do-livro>/sources/cap-NN.source.md`.
6. **Criar o template** `raw/books/<nome-do-livro>/<NN> - <título-em-português>.md` com:
   - Nome do arquivo seguindo a convenção existente: `<NN> - <título traduzido>.md` (ex: `5 - Identificando Características Arquiteturais.md`)
   - TL;DR e Resumo pré-preenchidos pela LLM (em português, com base no source extraído)
   - Estrutura vazia para o usuário completar (insights, citações, etc.)

## Saída
- `sources/cap-NN.source.md` — texto extraído do capítulo
- `cap-NN.md` — template com TL;DR e Resumo preenchidos

## Estratégias relacionadas
- `discuss-source` — passo seguinte no fluxo de `/ingest`
- `synthesize-page` — passo de criação da página na wiki
