# evaluate-answers

## Objetivo
Avaliar as respostas do usuário às perguntas de verificação e atualizar o campo `understanding` na(s) página(s) correspondente(s).

## Quando usar
- `/assess` — passo 2, após o usuário responder as perguntas

## Entrada
- Respostas do usuário
- Perguntas originais
- Páginas da wiki relacionadas

## Passos

1. **Comparar respostas** com o conteúdo da wiki/fonte.
2. **Avaliar cada resposta**:
   - Correção factual
   - Profundidade de entendimento
   - Capacidade de aplicar em contexto diferente
3. **Atualizar `understanding`** na página:
   - `high` — respondeu corretamente, explicou com exemplos, conectou com outros conceitos
   - `medium` — respondeu corretamente mas sem profundidade
   - `low` — respostas incorretas ou incompletas
4. **Explicar o erro** para respostas incorretas ou incompletas.
5. **Oferecer revisão** — sugerir releitura de seções específicas se `understanding` for `low`.

## Saída
- Avaliação de cada resposta
- Campo `understanding` atualizado nas páginas
- Sugestões de revisão se necessário

## Estratégias relacionadas
- `generate-questions` — chamadora
- `synthesize-page` — se a avaliação gerar conteúdo que merece página própria
