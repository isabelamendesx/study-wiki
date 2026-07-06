# Tipos de Página

Cada página em `wiki/` tem um tipo definido no campo `type` do frontmatter YAML.

## Definições

| Tipo | Uso | Descrição |
|---|---|---|
| `concept` | `wiki/concepts/` | Técnica, teoria, princípio, método ou ideia abstrata. Foco no "saber sobre". |
| `comparison` | `wiki/comparisons/` | Análise lado a lado de dois ou mais concepts / tecnologias / abordagens. |
| `query` | `wiki/queries/` | Pergunta e resposta significativa o suficiente para ser arquivada permanentemente. |
| `recipe` | `wiki/recipes/` | How-to passo a passo: solução prática, configuração ou snippet reutilizável. Foco no "saber fazer". |
| `summary` | `wiki/summaries/` | Síntese que integra múltiplas fontes (ex: resumo de livro, visão geral de tópico). |

## Limiar de Criação de Página

Um tópico merece sua própria página quando:

1. **É central para uma fonte** — é o assunto principal de pelo menos uma fonte ingerida.
2. **Aparece em 2+ fontes** — é discutido de forma substantiva (não apenas mencionado) em duas ou mais fontes distintas.
3. **Solicitado pelo usuário** — o usuário pede explicitamente uma página.

**Não crie** página para cada menção passageira. Um nome citado de passagem não atinge o limiar.
