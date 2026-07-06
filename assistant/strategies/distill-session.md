# distill-session

## Objetivo
Destilar uma sessão de estudo (conversa, leitura, discussão) em aprendizado consolidado, extraindo insights, decisões e conexões que merecem ser preservados.

## Quando usar
- `/crystallize` — passo único

## Entrada
- Histórico da sessão de estudo
- Páginas da wiki existentes (para contexto e conexões)

## Passos

1. **Revisar a sessão** — identificar:
   - Insights novos que não estão em nenhuma página
   - Decisões de estudo importantes (ex: "vou focar em X antes de Y")
   - Conexões entre conceitos que emergiram durante a discussão
   - Perguntas não respondidas que merecem busca futura
2. **Sintetizar** em formato conciso:
   - **O que aprendi** — 3-5 bullets do que ficou de mais importante
   - **Decisões** — escolhas de direção de estudo
   - **Conexões** — ligações entre conceitos que não estavam explícitas antes
   - **Próximos passos** — o que explorar em seguida
3. **Oferecer criar página(s)** na wiki se algum insight justificar (usando `synthesize-page`).
4. **Atualizar log.md** com registro da sessão.

## Saída
- Síntese da sessão para o usuário
- (Opcional) Nova(s) página(s) na wiki
- Entrada em `log.md`

## Estratégias relacionadas
- `synthesize-page` — se a destilação gerar conteúdo que merece página própria
- `update-log` — registrar a sessão
