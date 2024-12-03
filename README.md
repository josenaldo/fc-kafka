# Kafka

Esse repositório contém um exemplo de como usar o Kafka com Docker. Ele foi criado durante o curso 'Apache Kafka', no 'Curso FullCycle 3.0', da [Full Cycle](https://curso.fullcycle.com.br/curso-fullcycle-3-0/).

O Kafka é um sistema de mensageria distribuído que permite a troca de mensagens entre aplicações. Ele é muito utilizado para a criação de sistemas de eventos, como o Event Sourcing.

- [Kafka](#kafka)
  - [Comandos](#comandos)
    - [Iniciar o Kafka](#iniciar-o-kafka)
    - [Parar o Kafka](#parar-o-kafka)
    - [Conectar ao Kafka](#conectar-ao-kafka)
    - [Comandos do Kafka](#comandos-do-kafka)
      - [Tópicos](#tópicos)
        - [Criar um tópico](#criar-um-tópico)
        - [Listar tópicos](#listar-tópicos)
        - [Descrever um tópico](#descrever-um-tópico)
        - [Deletar um tópico](#deletar-um-tópico)
      - [Consumir mensagens](#consumir-mensagens)
        - [Consumir mensagens de um tópico](#consumir-mensagens-de-um-tópico)
        - [Consumir mensagens a partir do início](#consumir-mensagens-a-partir-do-início)
        - [Consumir mensagens de um grupo de consumidores](#consumir-mensagens-de-um-grupo-de-consumidores)
      - [Produzir mensagens](#produzir-mensagens)
      - [Analisando os grupos de consumidores](#analisando-os-grupos-de-consumidores)

## Comandos

Para inciar, parar e se conectar ao conteiner do Kafka, você pode usar os comandos abaixo. Uma outra opção é usar o arquivo `Makefile` para executar esses comandos.

### Iniciar o Kafka

Inicia o Kafka e o Zookeeper em containers separados.

```bash
docker compose -f docker-compose-zookeeper.yaml up -d --build
```

Se quiser usar o arquivo `Makefile`, execute o comando abaixo.

```bash
make up-kafka
```

### Parar o Kafka

Para o Kafka e o Zookeeper.

```bash
docker compose -f docker-compose-zookeeper.yaml down
```

Se quiser usar o arquivo `Makefile`, execute o comando abaixo.

```bash
make down-kafka
```

### Conectar ao Kafka

Conecta ao container do Kafka para executar comandos.

```bash
docker exec -it kafka bash
```

Se quiser usar o arquivo `Makefile`, execute o comando abaixo.

```bash
make exec-kafka
```

### Comandos do Kafka

Após estar conectado ao container do Kafka, é possível executar comandos do Kafka. Abaixo estão alguns exemplos.

Observe que todos os comandos contém a flag `--bootstrap-server localhost:9092`, que indica o endereço do servidor Kafka. Essa flag éobrigatória para todos os comandos.

#### Tópicos

##### Criar um tópico

```bash
kafka-topics --bootstrap-server localhost:9092 --create --topic teste --partitions 3 --replication-factor 1
```

##### Listar tópicos

```bash
kafka-topics --bootstrap-server localhost:9092 --list
```

##### Descrever um tópico

```bash
kafka-topics --bootstrap-server localhost:9092 --describe --topic teste
```

##### Deletar um tópico

```bash
kafka-topics --bootstrap-server localhost:9092 --delete --topic teste
```

#### Consumir mensagens

##### Consumir mensagens de um tópico

Para consumir mensagens de um tópico, execute o comando ´kafka-console-consumer´.

```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic teste
```

##### Consumir mensagens a partir do início

Para consumir mensagens a partir do início, use a flag `--from-beginning`.

```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --from-beginning
```

##### Consumir mensagens de um grupo de consumidores

Para consumir mensagens de um grupo de consumidores, use a flag `--group`.

Se dois consumidores estiverem em grupos diferentes, cada um receberá todas as mensagens.

Se mais de um consumidor estiver no mesmo grupo, as mensagens serão distribuídas entre eles.

```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic teste --group x
```

#### Produzir mensagens

Para produzir mensagens em um tópico, execute o comando ´kafka-console-producer´.

```bash
kafka-console-producer --bootstrap-server localhost:9092 --topic teste
```

#### Analisando os grupos de consumidores

Para ver os grupos de consumidores, execute o comando abaixo.

```bash
kafka-consumer-groups --bootstrap-server localhost:9092 --list
```

Para ver os detalhes de um grupo de consumidores, execute o comando abaixo.

```bash
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group x
```
