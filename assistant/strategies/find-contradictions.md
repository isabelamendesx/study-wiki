# find-contradictions

## Objetivo
Procurar afirmações conflitantes entre diferentes páginas da wiki.

## Quando usar
- `/lint` — verificação de saúde completa

## Entrada
- Todas as páginas em `wiki/` e fontes em `raw/`

## Passos

1. **Identificar tópicos sobrepostos** entre páginas (por tags, competências, ou menção de conceitos similares).
2. **Comparar afirmações** sobre o mesmo conceito em páginas diferentes.
3. **Sinalizar contradições** — afirmações que se contradizem diretamente.
4. **Analisar contexto** — verificar se é uma contradição real ou apenas perspectivas diferentes que coexistem.
5. **Reportar** com citações das páginas conflitantes.
6. **Oferecer correção** — unificar, esclarecer o contexto, ou marcar como trade-off legítimo.

## Exemplos
- Página A diz "Kafka garante entrega pelo menos uma vez" e página B diz "Kafka garante exatamente uma vez" → contradição real
- Página A diz "monolitos são mais simples" e página B diz "monolitos escalam mal" → trade-off, não contradição

## Saída
- Lista de contradições encontradas
- Sugestão de correção para cada uma

## Estratégias relacionadas
- `/lint` — compõe o comando de lint completo
