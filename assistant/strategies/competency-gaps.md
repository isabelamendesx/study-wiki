# competency-gaps

## Objetivo
Identificar áreas de engenharia de software com pouca ou nenhuma cobertura na wiki, baseado no mapa de competências.

## Quando usar
- `/progress` — consulta de gaps
- `/lint` — como parte da verificação de saúde

## Entrada
- `wiki/summaries/acompanhamento-competencias.md`
- Lista de competências em `assistant/domain/competencies.md`

## Passos

1. **Ler o mapa de competências** atual.
2. **Para cada competência**, verificar:
   - Quantas páginas a cobrem
   - Qualidade da cobertura (nível `understanding` médio das páginas)
   - Se há fontes em `raw/` relacionadas mas não ingeridas
3. **Identificar gaps**:
   - Competências com zero páginas → **gap total**
   - Competências com 1-2 páginas → **cobertura baixa**
   - Competências com understanding médio = `low` → **profundidade baixa**
4. **Sugerir próximos temas** de estudo para preencher os gaps.
5. **Reportar** ao usuário com recomendações.

## Saída
- Lista de gaps por competência
- Sugestões de temas para estudo
- (Opcional) Fontes em `raw/` aguardando ingestão

## Estratégias relacionadas
- `/progress` — chamadora principal
- `/lint` — chamadora secundária
- `reading-progress` — geralmente executada junto
