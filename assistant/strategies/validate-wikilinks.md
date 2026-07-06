# validate-wikilinks

## Objetivo
Verificar se todos os wikilinks nas páginas da wiki seguem as regras e apontam para páginas que existem.

## Quando usar
- `/lint` — verificação de saúde completa

## Entrada
- Todas as páginas em `wiki/`
- Regras em `assistant/conventions/wikilinks.md`

## Passos

1. **Extrair todos os wikilinks** de todas as páginas (regex: `\[\[([^\]|]+)(?:\|[^\]]+)?\]\]`).
2. **Para cada wikilink**, verificar:
   - O arquivo destino existe em `wiki/` ou `raw/`
   - Se não existe → reportar como **link quebrado**
   - A pipe syntax está presente quando o texto de exibição difere do nome do arquivo
3. **Verificar mínimo de 2 wikilinks** por página (meta flexível — reportar mas não bloquear).
4. **Verificar callouts de páginas futuras** — se um conceito sem página própria tem wikilink em vez de `[!note] Páginas futuras`, reportar.

## Saída
- Lista de links quebrados
- Lista de páginas com menos de 2 wikilinks
- Lista de páginas futuras com wikilink prematuro

## Estratégias relacionadas
- `/lint` — compõe o comando de lint completo
