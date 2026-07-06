# search-wiki

## Objetivo
Buscar na wiki por termos, conceitos ou perguntas, retornando as páginas mais relevantes.

## Quando usar
- `/ask` — passo 1

## Entrada
- Pergunta ou termo de busca do usuário
- Conteúdo de todas as páginas em `wiki/`

## Passos

1. **Interpretar a pergunta** — extrair termos-chave e intenção.
2. **Buscar nas páginas** por:
   - Título (match exato e parcial)
   - Conteúdo (termos e conceitos relacionados)
   - Tags e competências
   - Aliases do frontmatter
3. **Ordenar por relevância**:
   - Match no título > match em tags/competências > match no corpo
4. **Retornar** as páginas mais relevantes com trechos contextuais.

## Saída
- Lista de páginas relevantes com trechos

## Estratégias relacionadas
- `cite-sources` — passo seguinte para enriquecer a resposta
