# enrich-visuals

## Objetivo
Adicionar elementos visuais a uma página da wiki: diagramas Mermaid, tabelas, callouts, imagens — seguindo a paleta e regras de `assistant/conventions/visual-enrichment.md`.

## Quando usar
- `/ingest` — como parte da síntese (passo 3)
- Sempre que uma página nova for criada ou uma existente for revisada

## Entrada
- Conteúdo da página (esboço ou final)
- Tipo de informação a comunicar visualmente

## Passos

1. **Identificar o que comunicar visualmente:**
   - Fluxos → Mermaid flowchart
   - Hierarquias → Mermaid graph
   - Sequências → Mermaid sequenceDiagram
   - Comparações → Tabela
   - Dados estruturados → Tabela
   - Alertas/dicas → Callout apropriado
2. **Criar diagramas Mermaid:**
   - Usar `flowchart` em vez de `graph` (mais moderno)
   - Seguir a paleta de cores (ver `assistant/conventions/visual-enrichment.md`)
   - Não aninhar comentários HTML dentro do bloco mermaid
3. **Usar callouts adequados:**
   - `[!tip]` para dicas práticas
   - `[!note]` para complementos
   - `[!warning]` para armadilhas
   - `[!example]` para exemplos
   - `[!info]` para curiosidades
   - `[!quote]` para citações
4. **Embedar imagens** com `![[nome-do-arquivo.png]]` (armazenadas em `config/attachments/`).
5. **Não encher de enfeite** — cada elemento visual deve comunicar algo que texto puro comunicaria pior.

## Saída
- Página enriquecida com diagramas, tabelas e callouts

## Estratégias relacionadas
- `synthesize-page` — chamadora principal
