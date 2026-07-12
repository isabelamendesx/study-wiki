# find-orphans

## Objetivo
Encontrar páginas que não recebem wikilinks de entrada de nenhuma outra página (páginas órfãs).

## Quando usar
- `/lint` — verificação de saúde completa

## Entrada
- Todas as páginas em `wiki/`

## Passos

1. **Extrair todos os wikilinks de saída** de cada página.
2. **Construir grafo reverso** — para cada página, quem a referencia.
3. **Identificar páginas** com zero referências de entrada.
4. **Reportar** a lista de órfãs.
5. **Sugerir conexões** — quais páginas existentes poderiam linkar para a órfã.

## Critérios
- Páginas com zero wikilinks de entrada são órfãs
- Exceto páginas em `wiki/queries/` que naturalmente têm menos links de entrada

## Saída
- Lista de páginas órfãs
- Sugestões de conexões para cada uma

## Estratégias relacionadas
- `/lint` — compõe o comando de lint completo
