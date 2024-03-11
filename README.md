# Projeto QualiSAPS - Backend

## Sobre

O Projeto QualiSAPS é desenvolvido para a Secretaria de Saúde do Distrito Federal, com o objetivo de otimizar e melhorar a qualidade dos serviços de saúde oferecidos à população. Este backend é construído usando NestJS, TypeORM e PostgreSQL, combinando eficiência, escalabilidade e modernas práticas de desenvolvimento.

## Arquitetura do Projeto

Este projeto segue a arquitetura padrão recomendada pelo NestJS, que enfatiza a modularidade e a reusabilidade através do uso de módulos, serviços (providers) e controllers. A estrutura do projeto é organizada da seguinte forma:

  * Modules: Blocos de construção fundamentais que encapsulam um domínio específico da aplicação, promovendo a separação de responsabilidades.
  * Controllers: Responsáveis por manipular as solicitações e respostas HTTP, delegando tarefas mais complexas para os serviços.
  * Services (Providers): Contêm a lógica de negócios da aplicação, realizando operações como interações com o banco de dados através do TypeORM.
  * Entities: Representam as tabelas do banco de dados e são usadas pelo TypeORM para mapeamento objeto-relacional.

A estrutura modular do NestJS facilita a organização do código, tornando o desenvolvimento e a manutenção da aplicação mais intuitivos e eficientes.

## Instalação

```bash
$ npm install
```

## Rodando a aplicacao

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```
