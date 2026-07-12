1|# competency-gaps
2|
3|## Objetivo
4|Identificar áreas de engenharia de software com pouca ou nenhuma cobertura na wiki, baseado no mapa de competências.
5|
6|## Quando usar
7|- `/progress` — consulta de gaps
8|- `/lint` — como parte da verificação de saúde
9|
10|## Entrada
12|- Lista de competências em `assistant/domain/competencies.md`
13|
14|## Passos
15|
16|1. **Ler o mapa de competências** atual.
17|2. **Para cada competência**, verificar:
18|   - Quantas páginas a cobrem
19|   - Qualidade da cobertura (nível `understanding` médio das páginas)
20|   - Se há fontes em `raw/` relacionadas mas não ingeridas
21|3. **Identificar gaps**:
22|   - Competências com zero páginas → **gap total**
23|   - Competências com 1-2 páginas → **cobertura baixa**
24|   - Competências com understanding médio = `low` → **profundidade baixa**
25|4. **Sugerir próximos temas** de estudo para preencher os gaps.
26|5. **Reportar** ao usuário com recomendações.
27|
28|## Saída
29|- Lista de gaps por competência
30|- Sugestões de temas para estudo
31|- (Opcional) Fontes em `raw/` aguardando ingestão
32|
33|## Estratégias relacionadas
34|- `/progress` — chamadora principal
35|- `/lint` — chamadora secundária
36|- `reading-progress` — geralmente executada junto
37|