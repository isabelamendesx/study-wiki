# Cap 7: Escopo das Características Arquiteturais

**Source:** [[sources/cap-07.source|Cap 7 — texto original (EN)]]

## TL;DR

Por uma década, fazia sentido dizer "este sistema é escalável". Era tudo monolito: um artefato, um banco, um deploy. Com microservices, isso quebrou — o serviço de login precisa de segurança máxima, o feed precisa de performance absurda, o relatório pode ser lento mas não pode perder dados. A solução é o **architecture quantum**: a menor unidade deployável com coesão funcional e acoplamento síncrono. Em vez de perguntar "meu sistema é escalável?", pergunte "quais pedaços do meu sistema precisam ser escaláveis, e em que nível?" — e a resposta são os quanta.

## Resumo

### Ato 1 — O axioma quebrado

O mundo do software passou ~10 anos assumindo que características arquiteturais (escalabilidade, segurança, elasticidade) se aplicavam ao **sistema inteiro**. Fazia sentido: 95% dos sistemas eram monolíticos. Um artefato, um banco, uma unidade de deploy.

Aí vieram os microservices. De repente você tem 20 serviços, cada um com demandas radicalmente diferentes:

```
Serviço de login   → segurança altíssima
Serviço de feed    → performance absurda, escalabilidade horizontal
Serviço de relatório → pode ser lento, mas zero perda de dados
```

Tratar todos como "o sistema é seguro" gera over-engineering onde não precisa e under-engineering onde é crítico. O axioma morreu, mas ninguém tinha um substituto.

### Ato 2 — O architecture quantum

Os autores tomaram emprestado o termo *quantum* da física (a menor unidade de uma entidade envolvida numa interação) e definiram:

> **Architecture quantum:** um artefato independentemente deployável, com alta coesão funcional e conascência síncrona.

Cada parte da definição resolve um problema específico:

**1. "Independentemente deployável"** — o quantum inclui TUDO que precisa pra funcionar sozinho. Se um serviço de Pedidos usa PostgreSQL + Redis, ambos fazem parte do quantum. Isso explica por que um monolito com banco único = **1 quantum só**.

**2. "Alta coesão funcional"** — o quantum faz uma coisa com propósito claro. Inspiração direta do **bounded context** do DDD (Eric Evans): cada domínio tem seu próprio modelo de entidade. O `Customer` do financeiro tem billing info; o `Customer` do suporte tem histórico de tickets. Reconciliam diferenças nos pontos de integração, não numa classe universal.

**3. "Conascência síncrona"** — o conceito mais sutil e poderoso. *Connascence* (Page-Jones, 1996): duas componentes são conascentes se mudar uma obriga a mudar a outra. Divide-se em:

| Tipo | O que é | Exemplo |
|---|---|---|
| **Estática** | Detectável por análise de código | Dois serviços compartilham a classe `Address` |
| **Dinâmica síncrona** | Caller espera resposta do callee | REST/gRPC entre serviços — acoplamento forte |
| **Dinâmica assíncrona** | Fire-and-forget via mensageria | Kafka/RabbitMQ — acoplamento fraco, serviços podem ter características diferentes |

A diferença é prática: se o Serviço A chama B via REST, e A escala 100x mais que B, timeouts explodem. Se a comunicação é via Kafka, a fila absorve a diferença de ritmo. **Menos conascência = mais flexibilidade.**

### Ato 3 — O kata Going, Going, Gone

O capítulo demonstra o conceito com um kata de leilão online. Requisitos:

- Centenas de participantes por leilão, milhares no total
- Transmissão de vídeo ao vivo + lances em tempo real
- Cartão de crédito com cobrança automática
- Empresa processada por fraude no passado

**Antes:** um arquiteto tradicional listaria "security, scalability, performance, availability" e aplicaria em tudo.

**Depois (com architecture quantum):** três unidades com características diferentes:

```
┌──────────────────────┐
│   BIDDER FEEDBACK    │  ← stream de vídeo + lances
│  Availability        │
│  Scalability         │
│  Performance         │
└──────────────────────┘
          │
          │ (assíncrono — fila de mensagens)
          ▼
┌──────────────────────┐
│     AUCTIONEER       │  ← o leiloeiro, ponto crítico
│  Availability        │
│  Reliability         │
│  Scalability         │
│  Elasticity          │
│  Performance         │
│  Security            │
└──────────────────────┘
          │
          │ (assíncrono — fila de mensagens)
          ▼
┌──────────────────────┐
│       BIDDER         │  ← participantes normais
│  Reliability         │
│  Availability        │
│  Scalability         │
│  Elasticity          │
└──────────────────────┘
```

Por que o Auctioneer tem 6 características e o Bidder só 4? Porque se o Auctioneer cai, **ninguém** dá lance — disponibilidade é existencial. Se um Bidder individual cai, os outros 499 continuam. E o Bidder Feedback não precisa de security — se perder um frame do vídeo, ninguém morre.

**Litmus test:** como decidir se algo é característica arquitetural ou só requisito de domínio? Pergunte: *"dá pra discutir isso em abstrato, sem conhecer o negócio?"* Elasticidade → sim, independe de ser banking ou streaming. "Índice de reputação" → não, precisa de um analista de negócio pra explicar. Se exige conhecimento de domínio, não é característica arquitetural.

## Insights

<!-- Seus insights pessoais sobre o capítulo -->

## A aprofundar

- Características do Domínio vs Características da arquitetura

## Citações marcantes

Veja um indicador útil que os arquitetos de teste usam para determinar as características do domínio versus da arquitetura: requer conhecimento do domínio para implementar ou é uma característica da arquitetura abstrata? No kata Going, Going, Gone, ao encontrar a frase "índice de reputação", um arquiteto buscaria um analista comercial ou outro especialista para explicar o que ele tinha em mente, ou seja, a frase "in-dice de reputação" não é uma definição padrão como as características da arquitetura mais comuns. Como um exemplo contrário, quando os arquitetos discutem sobre elasticidade, a capacidade de lidar com picos de usuários, eles podem conversar sobre a característica da arquitetura puramente no sentido abstrato, independentemente do tipo de aplicação considerada: banco, site de catálogos, streaming de vídeo etc. Os arquitetos devem determinar se um requisito ainda não foi incluído pelo domínio e requer uma estrutura em particular, o que aumenta a consideração para a característica da arquitetura.

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
- Se eu tenho um monolito modular com múltiplos bancos (um por módulo), quantos quanta isso representa? E se a comunicação entre módulos for síncrona vs assíncrona?
