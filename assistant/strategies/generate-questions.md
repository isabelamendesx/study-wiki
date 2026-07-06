# generate-questions

## Objetivo
Gerar perguntas de verificação a partir do conteúdo de uma página ou fonte, para autoavaliação do usuário.

## Quando usar
- `/assess` — passo 1

## Entrada
- Página(s) da wiki ou fonte em `raw/`
- Nível de profundidade desejado pelo usuário

## Passos

1. **Analisar o conteúdo** da página/fonte.
2. **Identificar conceitos-chave** que merecem verificação.
3. **Gerar perguntas em pt-BR** calibradas para:
   - O nível de profundidade que o usuário quer alcançar
   - Diferentes níveis cognitivos (definição, aplicação, análise, síntese)
4. **Variar o formato**:
   - Perguntas diretas ("O que é conascência?")
   - Cenários ("Dado X, qual abordagem você usaria e por quê?")
   - Comparações ("Qual a diferença entre Y e Z?")
   - Aplicação prática ("Como você aplicaria isso num microsserviço?")
5. **Apresentar ao usuário** para responder.

## Saída
- Lista de perguntas para o usuário responder

## Estratégias relacionadas
- `evaluate-answers` — passo seguinte
