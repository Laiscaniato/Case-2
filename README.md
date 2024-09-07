

Link para acessar o trabalho na integra no Github
https://github.com/Laiscaniato/Case-2


# MBA Engenharia de dados
## Trabalho de modelagem de dados


| Nome dos integrantes do grupo |
|-------------------------------|
| Gabriela Gadelha Araújo       |
| Lais Helena Caniato           |


### Case 
* Pense em uma empresa, desenhe as tabelas Relacionais e Multidimensionais
* Pense no nome do Domínio de informação e da Sigla
* Pense no modelo de negócio e crie os campos com nomes lógicos e físicos
* Crie o Glossário de Dados
* Desenhe as tabelas físicas e lógicas Relacionais com as (Chave PK e campos)
* Crie as tabelas Fato e Dimensão
* Crie o Script SQL para criar a tabela FATO (Extract / Data Collection)

**Nome da Empresa:** TechNova

**Nome do Domínio de Informação:** Análise e Gerenciamento de Dados

**Sigla:** AGD

## Campos com nome lógico e físico 

### ALUNOS
  
| Nome Lógico       | Nome Físico       | 
|-------------------|-------------------|
| Identificador     | `id`              | 
| Nome              | `nome`            |  
| Sobrenome         | `sobrenome`       | 
| Data de Nascimento| `data_nascimento` | 
| Sexo              | `sexo`            | 


### Contratação 

| Nome Lógico       | Nome Físico       | 
|-------------------|-------------------|
| Identificador     | `id`              | 
| Aluno ID          | `aluno_id`        | 
| Preço             | `preco`           | 
| Status            | `status`          |
| Contratado Em     | `contratado_em`   | 
| Cancelado Em      | `cancelado_em`    | 

### Preço
| Nome Lógico       | Nome Físico       | 
|-------------------|-------------------|
| Identificador     | `id`              | 
| Plano             | `plano`           | 
| Valor             | `valor`           | 


### Plano
| Nome Lógico       | Nome Físico       | 
|-------------------|-------------------|
| Identificador     | `id`              | 
| Nome              | `nome`            | 


## Glossário de Dados


| Nome Lógico       | Nome Físico       | Tipo de Dado    | Descrição                                      |
|-------------------|-------------------|-----------------|------------------------------------------------|
| Identificador     | `id`              | `INT`           | Identificador único do aluno. Chave primária   |
| Nome              | `nome`            | `VARCHAR(100)`  | Primeiro nome do aluno                         |
| Sobrenome         | `sobrenome`       | `VARCHAR(100)`  | Sobrenome do aluno                             |
| Data de Nascimento| `data_nascimento` | `DATE`          | Data de nascimento do aluno                    |
| Sexo              | `sexo`            | `CHAR(1)`       | Sexo do alu 'M' (masculino) ou 'F' (feminino)  |
| Preço             | `preco`           | `INTEGER`       | Valor da contratação do plano                  |
| Status            | `status`          | `VARCHAR(50)`   | Status atual da contratação do plano           |
| Contratado Em     | `contratado_em`   | `DATE`          | Data em que a contratação foi realizada        |
| Cancelado Em      | `cancelado_em`    | `DATE`          | Data em que a contratação foi cancelada        |
| Valor             | `valor`           | `FLOAT`         | Valor monetário do plano ou serviço |
| Identificador     | `id`              | `INT`           | Identificador único do plano. Chave primária. |


### Detalhes dos Tipos de Dados

- **`INT`**: Tipo de dado numérico inteiro.
- **`VARCHAR(n)`**: Tipo de dado de texto variável, onde `n` define o comprimento máximo da string. 
- **`DATE`**: Tipo de dado para armazenar datas no formato YYYY-MM-DD.
- **`CHAR(1)`**: Tipo de dado de texto com comprimento fixo, onde `1` define quantos caracteres.
- **`FLOAT`**: Tipo de dado numérico que pode armazenar números com casas decimais.


## Tabelas físicas e lógicas Relacionais
![Logo do GitHub](https://github.com/Laiscaniato/Case-2/blob/main/Relacional.png)
## Tabelas Fato e Dimensão

![Logo do GitHub](https://github.com/Laiscaniato/Case-2/blob/main/Dimensional.png)

## Código SQL da tabela Fato

```sql
CREATE TABLE `fato` (
  `Aluno_id` serial,
  `Contratação_id` serial,
  `Preço_id` serial,
  `Plano_id` serial
);

CREATE TABLE `dim_aluno` (
  `id` serial PRIMARY KEY,
  `nome` varchar(256) NOT NULL,
  `sobrenome` varchar(256) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` char NOT NULL
);

CREATE TABLE `dim_contratação` (
  `id` serial PRIMARY KEY,
  `aluno_id` integer NOT NULL,
  `preço` integer NOT NULL,
  `status` ENUM ('ativo', 'pausado', 'cancelado') NOT NULL,
  `contratado_em` date NOT NULL,
  `Cancelado_em` date
);

CREATE TABLE `dim_preço` (
  `id` serial PRIMARY KEY,
  `plano` varchar(255) NOT NULL,
  `valor` float NOT NULL
);

CREATE TABLE `dim_plano` (
  `id` serial PRIMARY KEY,
  `nome` varchar(128) NOT NULL
);

ALTER TABLE `fato` ADD FOREIGN KEY (`Aluno_id`) REFERENCES `dim_aluno` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Contratação_id`) REFERENCES `dim_contratação` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Preço_id`) REFERENCES `dim_preço` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Plano_id`) REFERENCES `dim_plano` (`id`);
