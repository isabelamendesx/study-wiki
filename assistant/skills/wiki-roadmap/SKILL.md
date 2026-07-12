---
name: wiki-roadmap
description: Configura o roadmap de estudos da Study Wiki — perfil do usuário, áreas de foco e tópicos fundamentados em dados externos.
metadata:
  wiki_path: /Users/isabelam/life-wiki/study-wiki
---

# /roadmap — Plano de Estudos

Define ou revisa o roadmap de estudos.
O comando é conversacional: a LLM guia o usuário por etapas.

## Entrada

`/roadmap` — sem argumentos. Detecta se o roadmap já existe:
- **Primeira vez:** wizard completo (3 etapas)
- **Roadmap existe:** menu de manutenção incremental

---

## Wizard de Primeira Vez (3 Etapas)

### Etapa 1: Perfil e Fontes

Coletar o perfil completo do usuário. Perguntar de forma conversacional,
uma pergunta por vez, e confirmar ao final.

#### Bloco A: Quem é você

1. **Nome** — "Qual seu nome?"
2. **Cargo atual** — "Qual seu cargo atual?"
3. **Área** — "Em que área você trabalha? (ex: Backend, Frontend, DevOps, Dados...)"
4. **Objetivo em 6 meses** — "O que você quer alcançar nos próximos 6 meses em termos de estudos?"

#### Bloco B: O que você usa

5. **Hard Skills** — "Me conta o que você usa no dia a dia: linguagens, frameworks, infra, banco de dados, cloud, observabilidade..."
   - Extrair e categorizar automaticamente
   - Confirmar: "Entendi certo? Java + Go, Spring + Kafka, K8s + Docker..."

6. **Soft Skills** — "E sobre métodos e práticas?"
   - Métodos (Scrum, Kanban), Comunicação (code review, docs), Liderança (mentoria)

#### Bloco C: Referências externas (opcional)

Apresentar as 2 categorias juntas, permitindo pular qualquer uma:

7. **Documentos** — "Tem PDI da empresa, matriz de competências ou feedback de performance?"
8. **Roadmaps** — "Vou usar o roadmap.sh/<sua área> como base. Quer adicionar mais algum?"

#### Consolidação

9. **Resumir** tudo e perguntar: "Está tudo certo? Alguma coisa a ajustar?"

---

### Etapa 2: Curadoria de Prioridades

Esta etapa tem dois momentos: (a) confirmar as fontes de dados que
serão usadas no scoring, e (b) gerar o ranking.

#### 2a. Descobrir e confirmar roadmaps

**Passo 1: Buscar roadmaps disponíveis.** Use `browser_navigate` para abrir
`https://roadmap.sh` e identificar os roadmaps disponíveis. A página lista
todos. Extraia os slugs (ex: `backend`, `golang`, `software-architect`,
`ai-engineer`, `claude-code`, `technical-writer`, etc.).

**Passo 2: Filtrar por relevância.** Cruze os roadmaps disponíveis com
o perfil do usuário:

- **Match por stack:** se o usuário declarou Go, sugira `roadmap.sh/golang`.
  Se declarou Java, `roadmap.sh/java`. Kubernetes → `roadmap.sh/kubernetes`.
- **Match por objetivo/interesse:** se o objetivo menciona arquitetura,
  sugira `roadmap.sh/software-architect`. Se menciona IA, sugira
  `roadmap.sh/ai-engineer` e `roadmap.sh/claude-code`.
- **Sempre incluso:** `roadmap.sh/<área>` baseado na área declarada
  (ex: Backend → `roadmap.sh/backend`).

**Passo 3: Mapear para o Catálogo.** Para cada roadmap selecionado,
identifique quais áreas do Catálogo ele cobre lendo a descrição
na página do roadmap. Ex: `backend` cobre `architecture`, `infrastructure`,
`code-quality`, etc. `software-architect` cobre `architecture`.

**Passo 4: Apresentar e confirmar.** Mostre a lista sugerida com
justificativa, permitindo que o usuário ative/desative:

```
Roadmaps disponíveis e relevantes pro seu perfil:

  ☑ roadmap.sh/backend          (padrão — sua área)
  ☐ roadmap.sh/golang           (sua stack)
  ☐ roadmap.sh/kubernetes       (sua stack)
  ☐ roadmap.sh/software-architect (seu interesse em arquitetura)
  ☐ roadmap.sh/ai-engineer       (seu interesse em IA)
  ☐ roadmap.sh/claude-code       (seu interesse em IA)

Quer ativar algum? Máximo 3-4 roadmaps no total.
```

Se o usuário anexou PDI/matriz de competências na Etapa 1, incluí-los
como fonte adicional com peso equivalente.

#### 2b. Gerar ranking

Para cada área do Catálogo, calcular score usando APENAS as fontes
confirmadas em 2a:

```
SCORE =
  (gap no roadmap.sh padrão     × peso 3)
  (gap nos roadmaps adicionais   × peso 2)
  (gap em PDI/matriz corporativa × peso 3)
  (match com objetivo 6m         × peso 3)
  (já tem cobertura?             × penalidade -1 por tópico covered)
```

Apresentar APENAS as 5-6 áreas com maior score, com justificativa:

```
Com suas fontes (roadmap.sh/backend + golang):

 1. infrastructure — 22/30 🔴
    ✅ roadmap.sh/backend: 11 tópicos, 0 cobertos
    ✅ roadmap.sh/kubernetes: 7 tópicos, 0 cobertos

 2. technical-depth — 20/30 🔴
    ✅ roadmap.sh/golang: 6 tópicos, 0 cobertos
    ✅ objetivo: "aumentar profundidade técnica"

 3. ai-engineering — 18/30 🔴
    ✅ objetivo declarado: "IA aplicada"
    ✅ roadmap.sh/ai-engineer: 6 tópicos, 0 cobertos

 4. architecture — 14/30 🟡
    ✅ roadmap.sh/backend: 9 tópicos, 6 cobertos
    ⚠️ penalidade de cobertura: -6 pontos
```

O usuário **confirma, remove, ajusta ou adiciona** áreas.
Máximo recomendado: 3-4 áreas para 6 meses.

---

### Etapa 3: Mapeamento de Tópicos

Para cada área confirmada:

1. Extrair os tópicos do Catálogo de Áreas em `competencies.md`
2. Cruzar com a wiki: quais tópicos já têm páginas (`covered_by`)?
3. Ordenar por dependências: tópicos sem pré-requisitos primeiro,
   depois os que dependem de tópicos já cobertos
4. Marcar status: `covered` (já tem página) ou `pending`
5. Gerar as `focus_areas` no `competencies.md`

### Persistência

Gerar ou atualizar `assistant/domain/competencies.md` com:
- Perfil do usuário (YAML)
- Catálogo de Áreas (mantido, pode ser estendido pelo usuário)
- `focus_areas` com tópicos, status, `covered_by`
- Relações entre áreas (Mermaid, paleta Minimalista TCC)
- Histórico de checkpoints

### Pós-roadmap

1. Atualizar `index.md` se necessário
2. Registrar em `log.md`: `[YYYY-MM-DD] roadmap | Configuração do roadmap`
3. Sugerir: "Seu roadmap está pronto! Quer começar pelo primeiro tópico?"

---

## Manutenção Incremental

Quando `/roadmap` detecta que o roadmap já existe, oferece menu:

```
Seu roadmap já existe. O que quer fazer?

  A) Refazer tudo do zero
  B) Adicionar uma área nova
  C) Remover uma área
  D) Ajustar prioridades/ordem
  E) Adicionar/remover roadmaps
  F) Sair
```

### Opção B: Adicionar área

1. Perguntar slug da área. Se não existe no Catálogo, a LLM sugere
   tópicos baseados em roadmap.sh + similaridade com áreas existentes,
   e oferece adicionar a área ao Catálogo.
2. Buscar tópicos no Catálogo. Se não houver, sugerir e criar entrada.
3. Perguntar prioridade e posição: "Suas áreas: infrastructure 🔴,
   ai-engineering 🔴, technical-depth 🟡, architecture 🟢.
   Onde [nova área] entra?"
4. Adicionar às `focus_areas` com tópicos `pending`.

### Opção C: Remover área

1. Listar áreas ativas com páginas e status.
2. Ao remover: páginas mantêm slugs de competência no frontmatter.
   Só a área sai das `focus_areas`.
3. Recalcular ordem das restantes.

### Opção D: Ajustar prioridades

1. Mostrar ordem atual com prioridades (critical/medium/maintaining).
2. Usuário reordena ou muda prioridades.
3. Opcionalmente ajustar relações no Mermaid.

### Opção E: Roadmaps

Mostrar roadmaps atuais, usuário ativa/desativa:
```
☑ roadmap.sh/backend (padrão)

Roadmaps adicionais:
☐ roadmap.sh/golang
☐ roadmap.sh/kubernetes
```

### Edição manual (sempre disponível)

O usuário pode editar `competencies.md` diretamente.
A LLM **nunca sobrescreve sem confirmação** — se detectar que o
arquivo foi editado manualmente (`last_updated` mudou), pergunta antes.

---

## Estratégias usadas

- `assistant/strategies/map-competencies.md`
- `assistant/strategies/competency-gaps.md`
- `assistant/strategies/update-competency-map.md`
- `assistant/strategies/update-index.md`
- `assistant/strategies/update-log.md`

## Pitfalls

1. **Etapa 2: a LLM NÃO deve buscar roadmaps por conta própria.**
   O escopo do scoring é definido pelas fontes que o usuário confirmou
   em 2a. Se a LLM sair adicionando roadmap.sh/java, roadmap.sh/golang,
   roadmap.sh/kubernetes, roadmap.sh/ai-engineer etc. sem perguntar,
   o ranking fica inflado e confuso. Sempre passe por 2a antes de 2b.

2. **Roadmaps são descobertos dinamicamente.** A Etapa 2a usa `browser_navigate`
   em `https://roadmap.sh` para descobrir quais roadmaps existem — não use
   lista estática. Se um roadmap novo surgir, ele aparece automaticamente.

3. **O Catálogo de Áreas é canônico, não o ranking.** As 10 áreas em
   `competencies.md` são a lista completa. A Etapa 2 ranqueia essas áreas,
   não cria áreas novas a partir dos roadmaps.

4. **Scoring é por área do Catálogo, não por roadmap.**
   Ex: se `roadmap.sh/golang` cobre profiling e `roadmap.sh/backend`
   também menciona performance, ambos contribuem pro score de
   `technical-depth` — mas `technical-depth` é a área, não "golang".

## Design decisions

- **Arquivo único:** `competencies.md` concentra Catálogo (tópicos canônicos)
  + Áreas de Foco (instância do usuário). Arquivos separados (`rubrics.md`,
  `external-sources.md`) foram cortados por duplicação de estrutura.
- **Tendências eliminadas:** Blogs, arxiv, conferências e GitHub trending
  foram removidos do `/roadmap`. O foco é exclusivamente roadmap.sh.
- **Sem níveis subjetivos:** O modelo antigo usava ⭐ autoavaliativos.
  O novo usa tópicos objetivos (`covered`/`pending`) com `covered_by`
  preenchido automaticamente pelas skills.

## Domínio

- `assistant/domain/competencies.md` — roadmap + Catálogo de Áreas
- `assistant/domain/taxonomy.md` — taxonomia de tags (referência)

## Referências

- `references/design-decisions.md` — o que foi removido e por quê (leia antes de reintroduzir)
- `references/conventions.md` — nomenclatura (`wiki-`), terminologia e estrutura de arquivos
