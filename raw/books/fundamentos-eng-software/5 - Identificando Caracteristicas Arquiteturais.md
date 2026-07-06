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

- O capítulo 5 é complementar ao 4: o 4 define *o que são* características arquiteturais, o 5 ensina *como identificá-las*. Juntos formam o par "catálogo + método de descoberta".
- A parte mais difícil não é identificar — é **escolher e sacrificar**. A análise de trade-offs entre características é o ponto em que mais preciso evoluir.
- A metáfora do Vasa (navio que afundou por tentar ser tudo ao mesmo tempo) é o anti-padrão arquitetural mais memorável do livro até agora.
- "Conhecimento implícito de domínio" como fonte de características arquiteturais é um conceito que conecta diretamente com `domain-knowledge` e `product-acumen` — áreas que antes estavam sem cobertura na wiki.

## A aprofundar

- Análise de trade-offs arquiteturais — como decidir quais características sacrificar quando elas competem entre si
- Architecture Decision Records (ADRs) como ferramenta para documentar o "porquê" das escolhas de características
- Como diferentes domínios de negócio (finanças, e-commerce, saúde) priorizam características diferentes — padrões de indústria

## Citações marcantes

> "There are no wrong answers in architecture, only expensive ones." — Mark Richards

> "Arquitetura ou design? A arquitetura implica algum componente estrutural, já o design reside dentro da arquitetura"

>Por exemplo, suponha que um arquiteto planeje uma aplicação que  
lida com o registro de aulas para estudantes universitários. Para facilitar os cál-culos, pressuponha que a escola tenha mil alunos e dez horas de registro. O arquiteto deve planejar um sistema pressupondo uma escala consistente, fazendo a suposição implícita de que os estudantes se distribuirão igualmente ao longo do tempo durante o processo de registro? Ou com base no conhecimento dos hábitos e das inclinações desses estudantes o arquiteto deve planejar um sistema que possa lidar com todos os mil alunos tentando se registrar nos últimos dez minutos? Qualquer pessoa que entende o quanto os estudantes normalmente procrastinam sabe a resposta! Raramente esses detalhes aparecerão nos documentos dos requisitos, embora informem as decisões do design.

> Algo importante a notar é que agilidade não é igual a lançamento no mercado
Pelo contrário, é agilidade + testabilidade + implementabilidade. É una armadi lha na qual muitos arquitetos caem ao traduzirem as preocupações de dominio Focar apenas um dos ingredientes é como esquecer de colocar farinha na cass do bolo. Por exemplo, um stakeholder do domínio pode dizer algo assim: "De-vido a requisitos regulatórios, é imperativo concluir a precificação dos fundos no final do dia a tempo." Um arquiteto ineficiente pode focar apenas o desempenho porque isso parece ser o foco principal dessa preocupação do domínio.  
Contudo, esse arquiteto fracassará por muitos motivos. Primeiro, não importa a rapidez do sistema se ele não fica disponível quando necessário. Segundo, conforme o domínio cresce e mais fundos são criados, o sistema também consegue escalar para terminar o processamento no fim do dia a tempo. Terceiro, o sistema não deve apenas estar disponível, mas também ser confiável e não travar quando os preços dos fundos no final do dia são calculados. Quarto, o que acontece se a precificação dos fundos no final do dia estiver 85% concluída e o sistema parar? Ele deve ser capaz de se recuperar e reiniciar onde a precifica-ção parou. Por fim, o sistema pode ser rápido, mas os preços dos fundos estão sendo calculados corretamente? Em caso afirmativo, além do desempenho, o arquiteto também deve focar igualmente a disponibilidade, a escalabilidade, a confiabilidade, a recuperabilidade e a auditabilidade.
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
