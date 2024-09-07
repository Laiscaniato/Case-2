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
  `contratado_em` data NOT NULL,
  `Cancelado_em` data
);

CREATE TABLE `dim_preço` (
  `id` serial PRIMARY KEY,
  `plano` varchar(255) NOT NULL,
  `valor` float NOT NULL
);

CREATE TABLE `dim_plano` (
  `id` serial PRIMARY KEY,
  `nome` possibilidades_plano(128)
);

ALTER TABLE `fato` ADD FOREIGN KEY (`Aluno_id`) REFERENCES `dim_aluno` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Contratação_id`) REFERENCES `dim_contratação` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Preço_id`) REFERENCES `dim_preço` (`id`);

ALTER TABLE `fato` ADD FOREIGN KEY (`Plano_id`) REFERENCES `dim_plano` (`id`);
