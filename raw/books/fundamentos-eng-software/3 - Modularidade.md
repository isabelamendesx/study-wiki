# Cap 3: Modularidade

**Source:** [[sources/cap-03.source|Cap 3 — texto original (EN)]]

## Resumo (3-5 linhas)

Explicar o que é modularidade e diferentes maneiras de medi-la. Modularidade é um termo geral para identificar um conjunto de código relacionado: classes, funções ou qualquer outro agrupamento. Isso não implica separação física, apenas lógica.

Os arquitetos precisam de ferramentas para medir a modularidade, o capítulo trás várias delas:
###  Coesão
 Se refere até que ponto as partes de um módulo devem estar contidas no mesmo módulo, ou seja, é uma medida de relação das partes entre si. O ideal é que um módulo coeso seja aquele em que todas as partes devem ser empacotadas juntas, porque dividi-las em partes menores exigiria acoplar as partes via chamas entre os módulos para conseguir resultados úteis.
#### Coesão vs. Acoplamento: O Dilema dos Trade-offs

Apesar de haver sete variantes listadas na literatura, a **coesão** é uma métrica menos precisa do que o **acoplamento**. Em geral, o grau de coesão de determinado módulo é uma decisão particular do arquiteto.
##### Exemplo Prático de Design de Módulos

Considere a seguinte definição inicial de um módulo:

> [!abstract] Cenário 1: Módulo Único
> **Customer Maintenance**
> - `add customer`
> - `update customer`
> - `get customer`
> - `notify customer`
> - `get customer orders`
> - `cancel customer orders`

Caso as duas últimas entradas residissem nesse módulo ou se o desenvolvedor criasse dois módulos separados, a estrutura mudaria para:

> [!note] Cenário 2: Módulos Separados
> **Customer Maintenance**
> - `add customer`
> - `update customer`
> - `get customer`
> - `notify customer`
> 
> **Order Maintenance**
> - `get customer orders`
> - `cancel customer orders`

#### Qual seria a estrutura correta?

Como sempre na arquitetura de software: **Depende.** Para decidir entre o Cenário 1 e o Cenário 2, precisamos avaliar algumas questões fundamentais:

* **Escopo Reduzido:** Elas são as duas únicas operações para `Order Maintenance`? Em caso afirmativo, pode fazer sentido reduzir essas opções para dentro de `Customer Maintenance`.
* **Crescimento Futuro:** O `Customer Maintenance` deve aumentar muito mais, encorajando que os desenvolvedores procurem oportunidades para extrair o comportamento?
* **Dependência de Dados:** O `Order Maintenance` requer tanto conhecimento das informações de `Customer` que separar os dois módulos exigiria um alto grau de acoplamento para que fosse funcional? *(Isso tem relação direta com a famosa citação de Larry Constantine).*

> [!important] Pensamento Arquitetural
> Essas perguntas representam a **análise de trade-off** que está exatamente no centro do trabalho de um arquiteto de software.

### Acoplamento 
O acoplamento aferente mede o número de conexões de entrada para um artefato de código (componente, classe, função etc.). O acoplamento eferente mede as conexões de saída para outros artefatos de código. 
### Abstração, Instabilidade e Distância da Sequência Principal
Abstração é a proporção de artefatos abstratos (classes, interfaces etc.) para artefatos concretos (implementação).
A instabilidade é definida como a proporção do acoplamento eferente para a soma dos acoplamentos eferente e aferente, determina a volatilidade de uma base de código. Uma base que mostra altos graus de instabilidade se rompe com mais facilidade quando alterada por causa do alto acoplamento. Por exemplo, se uma classe chama muitas outras classes para delegar trabalho, a classe que chama mostra alta susceptibilidade de ruptura se um ou mais métodos chamados mudam.
Já a distância da sequência principal é derivada com base na instabilidade e na abstração, fazendo um gráfico de relação formando uma linha idealizada, onde a classe deve ficar o mais próximo possível da linha idealizada. Nesse gráfico existe a zona de inutilidade, onde o código é abstrato demais e fica difícil de utilizar, e a zona de sofrimento, o código com implementação demais e sem abstração suficiente se forma frágil e difícil de manter.

### Conascência
Dois componentes são conascentes se uma mudança em um requer que o outro seja modificado para manter a correção geral do sistema.

**1. Conascência Estática**
Se refere ao acoplamento ao nível do código fonte, possui os seguinte tipos: 
- Conascência de Nome: Múltiplos componentes devem concordar com o nome de uma entidade
- Conascência de Tipo: Múltiplos componentes devem concordar com o tipo de uma entidade
- Conascência de Significado: Múltiplos componentes devem concordar com o significado de certos valores
- Conascência de Posição: Múltiplos componentes devem concordar com a ordem dos valores
- Conascência de Algoritmo: Múltiplos componentes devem concordar com certo algoritmo

**2. Conascência Dinâmica**
Se refere ao acoplamento nas chamadas durante e execução, possui os seguintes tipos:
- Conascência de Execução: A ordem de execução dos múltiplos componentes é importante
- Conascência de Tempo: O tempo de execução dos múltiplos componentes é importante
- Conascência de Valores: Ocorre quando diversos valores de relacionam e devem mudar juntos
- Conascência de Identidade: Ocorre quando vários componentes devem referenciar a mesma entidade

**Propriedades da Conascência**
- Força: Definida pela facilidade com a qual um desenvolvedor consegue regatorar esse tipo de acoplamento
 ![[../../../config/attachments/conascencia-forca.png|315]]
- Localização: Mede a proximidade dos módulos entre si na base de código. O código proximal tem mais formas e formas mais altas de *conasc*ência do que um código separado. Por exemplo, se duas classes tiverem conascência de significado, isso será menos perigoso para a base se dois módulos tiverem a mesma forma de conascência. Os desenvolvedores devem considerar a força e a localização juntas. As formas mais fortes de *conasc*ência encontradas no mesmo módulo representam menos "code smell" do que a mesma *conasc*ência afastadas
- Grau: Se relaciona ao tamando do seu impacto. Tem impacto em muitas ou poucas classes?

 **As Três Diretrizes de Page-Jones**

Meilir Page-Jones apresenta três diretrizes práticas para usar a conascência para melhorar a modularidade dos sistemas:

1. **Minimizar a conascência em geral**, dividindo o sistema em elementos encapsulados.
2. **Minimizar qualquer conascência restante** que cruze os limites do encapsulamento.
3. **Maximizar a conascência dentro dos limites** do encapsulamento (onde o impacto de mudanças é controlado e seguro).

**Os Conselhos de Jim Weirich**

Jim Weirich, famoso inovador da arquitetura de software, popularizou novamente o conceito de conascência e sintetizou sua aplicação prática em dois excelentes conselhos:

> [!tip] Regra do Grau
> **Converta as formas fortes de conascência em formas mais fracas.**
> *Sempre que puder, reduza a severidade do acoplamento escolhendo tipos de conascência mais fáceis de evoluir (ex: mudar de conascência de algoritmo para conascência de nome).*

> [!tip] Regra da Localização
> **Conforme a distância entre os elementos de software aumenta, use formas mais fracas de conascência.**
> *A tolerância para conascências fortes diminui à medida que o código se afasta (ex: dentro da mesma classe vs. entre microsserviços diferentes). Se a conascência for forte, os elementos devem estar próximos.*
## Conceitos (explicados nas minhas palavras)

| Conceito     | O que é                                                                                                                                                              | Exemplo do livro | Exemplo prático                                               |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------- |
| Modularidade | Um termo geral para identificar um conjunto de código relacionado: classes, funções ou qualquer outro agrupamento. Isso não implica separação física, apenas lógica. | package em Java  | Microsserviços com módulos API e Worker com deploys separados |


## O que me pegou

- "Se um arquiteto planeja um sistema sem prestar atenção em como as peças se conectam, acaba criando um sistema com muitas dificuldades"


## Não entendi direito

- Acoplamento aferente e eferente
- Abstração, instabilidade e distância da sequência principal: Esses conceitos nao ficaram tao claros pra mim e nao entendi se existe uso diario pra eles ou é um conhecimento mais teórico
- Conascencia vs acoplamento algo que nao entendi muito bem, a conascencia me pareceu uma evolucao do acoplamento, nao entendi muito bem como unificar as métricas


## Conexões / Áreas de estudo
- [ ] product-acumen
- [ ] data-driven
- [ ] technical-communication
- [ ] problem-decomposition
- [ ] domain-knowledge
- [x] technical-breadth
- [ ] technical-depth
- [ ] persistence
- [x] code-quality
- [ ] efficiency
- [ ] operation
- [ ] security
- [ ] infrastructure
- [ ] performance
- [x] architecture
- [ ] ai-engineering

## Perguntas/Instruções para ingestão da LLM
- Pq modularidade é importante no final?
- Eu gostaria que vc me trouxesse exemplos de cada uma das formas de medir e explicasse elas de forma bem didatica
- Exemplos de cada tipo de conascencia
- Eu quero trazer bastante essa ideia de como medir o que é o ideal analisando trase-offs exemplos assim etc
- O que eu tenho que levar em conta desse módulo no meu dia a dia 