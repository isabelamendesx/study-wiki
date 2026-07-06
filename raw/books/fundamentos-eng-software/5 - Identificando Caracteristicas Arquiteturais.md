# Cap 5: Identificando Caracteristicas Arquiteturais

**Source:** [[sources/cap-05.source|Cap 5 — texto original (EN)]]

## TL;DR

Arquitetos identificam características arquiteturais (os "-ilities") de três formas: extraindo de preocupações de domínio (traduzindo linguagem de negócio para requisitos técnicos), de requisitos explícitos (documentados), e de conhecimento implícito de domínio. O anti-padrão mais comum é tentar suportar *todas* as características — cada uma adiciona complexidade ao design. A abordagem recomendada é manter a lista o mais curta possível e pedir que os stakeholders escolham as 3 mais importantes.

## Resumo

O capítulo 5 ensina **como** identificar as características arquiteturais certas para um sistema, e não apenas o que elas são.

**Três fontes de identificação:**

1. **Preocupações de domínio** — o arquiteto precisa traduzir a linguagem do stakeholder de negócio para "-ilities". Ex: "time to market" → agilidade + testabilidade + deployability; "fusões e aquisições" → interoperability, escalabilidade, adaptabilidade. A Tabela 5-1 mapeia preocupações de domínio comuns para características arquiteturais.

2. **Requisitos explícitos** — números de usuários, metas de escala, restrições documentadas. Ex: "milhares de usuários, talvez milhões" → escalabilidade e elasticidade.

3. **Conhecimento implícito de domínio** — o que não está escrito mas todo profissional de domínio sabe. Ex: universitários se inscrevem em massa nos últimos 10 minutos; horário de almoço gera pico em delivery.

**Case studies do capítulo:**

- **O Vasa** — navio sueco que afundou por tentar ser tudo ao mesmo tempo (transporte + guerra, dois conveses, canhões gigantes). Metáfora direta: tentar suportar todas as características arquiteturais afunda o projeto.

- **Silicon Sandwiches (kata)** — uma rede de sanduíches quer delivery online. O capítulo percorre cada requisito e mostra como derivar características: escalabilidade, elasticidade, customizability, performance, disponibilidade, confiabilidade, segurança.

**Ponto central:** não existe "melhor design" em arquitetura — apenas a "menos pior coleção de trade-offs". O arquiteto deve colaborar com o time de implementação, evitar o anti-pattern de "arquiteto torre de marfim", e sempre tentar eliminar a característica *menos importante* da lista.

## Insights

<!-- LLM: preencher após discussão com o usuário -->

## A aprofundar

<!-- LLM: preencher após discussão com o usuário -->

## Citações marcantes

> "There are no wrong answers in architecture, only expensive ones." — Mark Richards

> "There is no best design in architecture, only a least worst collection of trade-offs."

>

## Figuras e diagramas

<!-- LLM: diagramas/figuras do capítulo a serem adicionados -->

## Conexões / Áreas de estudo

- [ ] product-acumen
- [ ] data-driven
- [ ] technical-communication
- [ ] problem-decomposition
- [ ] domain-knowledge
- [ ] technical-breadth
- [ ] technical-depth
- [ ] persistence
- [ ] code-quality
- [ ] efficiency
- [ ] operation
- [ ] security
- [ ] infrastructure
- [ ] performance
- [x] architecture
- [ ] ai-engineering

## Perguntas/Instruções para ingestão da LLM

-
