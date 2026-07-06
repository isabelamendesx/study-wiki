# cite-sources

## Objetivo
Enriquecer respostas do `/ask` com citações diretas das fontes e links para as páginas relevantes da wiki.

## Quando usar
- `/ask` — passo 2, após `search-wiki`

## Entrada
- Pergunta do usuário
- Páginas relevantes encontradas em `search-wiki`
- Fontes originais em `raw/`

## Passos

1. **Para cada página relevante**, identificar qual(is) fonte(s) em `raw/` a sustentam.
2. **Extrair trechos** das fontes que respondem diretamente à pergunta.
3. **Montar resposta**:
   - Resumo da resposta em pt-BR
   - Citações das fontes (com caminho)
   - Links para as páginas da wiki (com pipe syntax)
4. **Indicar confiança**:
   - "A wiki cobre este tópico em profundidade" → resposta completa
   - "A wiki menciona este tópico mas precisa de mais fontes" → resposta parcial
   - "A wiki não tem conteúdo sobre isto" → sugerir fonte

## Saída
- Resposta completa com citações e links
- Indicação de nível de cobertura

## Estratégias relacionadas
- `search-wiki` — chamadora
