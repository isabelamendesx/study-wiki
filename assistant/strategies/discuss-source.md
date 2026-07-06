# discuss-source

## Objetivo
Discutir os pontos principais de uma fonte com o usuário **antes de criar qualquer página**, garantindo alinhamento de entendimento e identificando gaps.

## Quando usar
- `/ingest` — passo inicial após ler a fonte

## Entrada
- Caminho para a fonte em `raw/`
- Conteúdo da fonte já lido pela LLM

## Passos

1. **Resumir com as próprias palavras** — não parafrasear a fonte. Mostrar o que entendeu.
2. **Destacar novidades** — o que é novo, surpreendente ou contradiz conhecimento anterior na wiki.
3. **Perguntar** — fazer perguntas para aprofundar, especialmente se notas estão curtas ou marcam "A aprofundar".
4. **Aguardar confirmação** — só avançar para `synthesize-page` quando o usuário confirmar que a discussão está satisfatória.

## Saída
- OK do usuário para prosseguir com a síntese
- Esclarecimentos que guiam a criação da página

## Estratégias relacionadas
- `synthesize-page` — passo seguinte
