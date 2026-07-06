# reading-progress

## Objetivo
Atualizar o progresso de leitura nos arquivos `_index.md` de cada livro em `raw/books/`.

## Quando usar
- `/progress` — consulta e atualização de progresso

## Entrada
- Caminho do livro em `raw/books/<nome-do-livro>/`
- Conteúdo atual de `_index.md`
- Capítulo(s) lido(s)

## Passos

1. **Ler `_index.md`** do livro.
2. **Identificar o capítulo** lido na checklist.
3. **Marcar como concluído** (`[x]`) com data no formato:
   ```markdown
   - [x] Cap N: Título — lido em YYYY-MM-DD
   ```
4. **Reportar progresso geral**:
   - "X de Y capítulos lidos (Z%)"
   - Links para as páginas da wiki criadas a partir do livro

## Saída
- `_index.md` atualizado
- Resumo do progresso para o usuário

## Estratégias relacionadas
- `competency-gaps` — geralmente executada junto no comando `/progress`
- `update-log` — registrar a atualização
