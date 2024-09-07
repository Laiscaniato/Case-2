CREATE TYPE "possibilidades_status" AS ENUM (
  'ativo',
  'pausado',
  'cancelado'
);

CREATE TYPE "possibilidades_plano" AS ENUM (
  'mensal',
  'trimestral',
  'semestral',
  'anual'
);

CREATE TABLE "Aluno" (
  "id" serial PRIMARY KEY,
  "nome" varchar(256) NOT NULL,
  "sobrenome" varchar(256) NOT NULL,
  "data_nascimento" date NOT NULL,
  "sexo" char NOT NULL
);

CREATE TABLE "Contratação" (
  "id" serial PRIMARY KEY,
  "aluno_id" integer NOT NULL,
  "preço" integer NOT NULL,
  "status" possibilidades_status NOT NULL,
  "contratado_em" data NOT NULL,
  "Cancelado_em" data
);

CREATE TABLE "Preço" (
  "id" serial PRIMARY KEY,
  "plano" varchar NOT NULL,
  "valor" float NOT NULL
);

CREATE TABLE "plano" (
  "id" serial PRIMARY KEY,
  "nome" possibilidades_plano(128)
);

ALTER TABLE "Contratação" ADD FOREIGN KEY ("aluno_id") REFERENCES "Aluno" ("id");

ALTER TABLE "Contratação" ADD FOREIGN KEY ("preço") REFERENCES "Preço" ("id");

ALTER TABLE "Preço" ADD FOREIGN KEY ("plano") REFERENCES "plano" ("id");
