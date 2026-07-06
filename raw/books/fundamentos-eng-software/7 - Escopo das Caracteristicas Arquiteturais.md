# Cap 7: Escopo das Características Arquiteturais

**Source:** [[sources/cap-07.source|Cap 7 — texto original (EN)]]

## TL;DR

O axioma tradicional de que características arquiteturais se aplicam ao sistema inteiro está ultrapassado. Com microservices e arquiteturas modernas, o escopo se estreitou para o nível do *architecture quantum*: um artefato independentemente deployável com alta coesão funcional e conascência síncrona. Isso significa que diferentes partes de um sistema podem (e devem) ter diferentes características arquiteturais — o que leva naturalmente a arquiteturas híbridas. O capítulo introduz o conceito de conascência (estática e dinâmica) como métrica de acoplamento no nível arquitetural e usa o kata Going, Going, Gone para demonstrar como identificar diferentes quanta e suas respectivas características.

## Resumo

O capítulo 7 quebra o pressuposto de que características arquiteturais valem para o sistema inteiro, introduzindo o conceito de **architecture quantum** como a unidade de escopo.

**Por que o axioma antigo caiu?** Por uma década, sistemas eram monolíticos — fazia sentido falar em "escalabilidade do sistema". Com microservices, diferentes partes têm demandas radicalmente diferentes de escalabilidade, elasticidade, performance e disponibilidade. Tratar todas como iguais leva a over-engineering ou under-engineering.

**Architecture Quantum — a definição em 3 partes:**

1. **Independently deployable** — inclui todos os componentes necessários para funcionar independentemente (ex: se usa um banco de dados, ele faz parte do quantum). Sistemas legados com banco único são um quantum só; microservices com banco por serviço formam múltiplos quanta.

2. **High functional cohesion** — o quantum faz algo com propósito claro. Em microservices, isso se alinha com o bounded context do DDD: cada serviço representa um domínio bem definido.

3. **Synchronous connascence** — chamadas síncronas entre serviços criam acoplamento dinâmico: se um serviço chama outro sincronamente, ambos precisam ter características operacionais compatíveis durante a chamada. Se o caller é mais escalável que o callee, timeouts e falhas de confiabilidade aparecem.

**Conascência (Connascence):** Duas componentes são conascentes se uma mudança em uma obriga a mudança na outra para manter a corretude do sistema. Divide-se em:
- **Estática** — detectável por análise de código (ex: dois serviços compartilham a definição da classe `Address`)
- **Dinâmica síncrona** — caller espera resposta do callee (acoplamento forte)
- **Dinâmica assíncrona** — fire-and-forget via mensageria (mais flexível, permite que serviços tenham características operacionais diferentes)

**DDD e Bounded Context:** O conceito de bounded context do Domain-Driven Design (Eric Evans) inspirou o architecture quantum. Antes do DDD, buscava-se reuso holístico de entidades (uma classe `Customer` unificada). O bounded context reconhece que cada domínio funciona melhor com seu próprio modelo, reconciliando diferenças nos pontos de integração.

**Case Study: Going, Going, Gone (kata de leilão online):**

O kata descreve uma empresa de leilões que quer escalar para o país inteiro, com centenas/milhares de participantes por leilão, transmissão de vídeo ao vivo e lances em tempo real.

Ao aplicar architecture quantum, identificam-se **três quanta distintos** com características diferentes:

| Quantum | Características |
|---|---|
| **Bidder feedback** (stream de lances + vídeo) | Availability, Scalability, Performance |
| **Auctioneer** (leiloeiro ao vivo) | Availability, Reliability, Scalability, Elasticity, Performance, Security |
| **Bidder** (participantes online) | Reliability, Availability, Scalability, Elasticity |

**Insight central:** Nem toda característica arquitetural se aplica uniformemente. O leiloeiro precisa de mais características que os bidders. A disponibilidade do leiloeiro é crítica (sem ele, ninguém dá lance); a de um bidder individual é menos crítica. Isso leva naturalmente a arquiteturas híbridas.

**Litmus test para distinguir domínio de característica arquitetural:** A característica exige conhecimento de domínio para ser implementada ou é abstrata? "Índice de reputação" exige um analista de negócio para explicar — é domínio. "Elasticidade" pode ser discutida em abstrato, independentemente de ser banking, catálogo ou streaming — é característica arquitetural.

## Insights

<!-- Seus insights pessoais sobre o capítulo -->

## A aprofundar

<!-- Temas que merecem estudo mais profundo -->

## Citações marcantes

<!-- Citações do capítulo que valem a pena destacar -->

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

- Como o conceito de architecture quantum se relaciona com service mesh e sidecars no Kubernetes — um sidecar faz parte do mesmo quantum?
- Se eu tenho um monolito modular com múltiplos bancos (um por módulo), quantos quanta isso representa?
