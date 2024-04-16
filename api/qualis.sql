-- -------------------------------------------------------------
-- TablePlus 5.9.0(538)
--
-- https://tableplus.com/
--
-- Database: qualis
-- Generation Time: 2024-04-15 23:36:07.4690
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."adonis_schema";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS adonis_schema_id_seq;

-- Table Definition
CREATE TABLE "public"."adonis_schema" (
    "id" int4 NOT NULL DEFAULT nextval('adonis_schema_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "batch" int4 NOT NULL,
    "migration_time" timestamptz DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."adonis_schema_versions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."adonis_schema_versions" (
    "version" int4 NOT NULL
);

DROP TABLE IF EXISTS "public"."api_tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS api_tokens_id_seq;

-- Table Definition
CREATE TABLE "public"."api_tokens" (
    "id" int4 NOT NULL DEFAULT nextval('api_tokens_id_seq'::regclass),
    "user_id" int4,
    "name" varchar(255) NOT NULL,
    "type" varchar(255) NOT NULL,
    "token" varchar(64) NOT NULL,
    "expires_at" timestamptz,
    "created_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."gsap";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS gsap_id_seq1;

-- Table Definition
CREATE TABLE "public"."gsap" (
    "id" int4 NOT NULL DEFAULT nextval('gsap_id_seq1'::regclass),
    "nome" varchar(250) NOT NULL,
    "regiao_admin" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."regiao_admin";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS regiao_admin_id_seq1;

-- Table Definition
CREATE TABLE "public"."regiao_admin" (
    "id" int4 NOT NULL DEFAULT nextval('regiao_admin_id_seq1'::regclass),
    "nome" varchar(45) NOT NULL,
    "regiao_saude" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."regiao_saude";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS regiao_saude_id_seq;

-- Table Definition
CREATE TABLE "public"."regiao_saude" (
    "id" int4 NOT NULL DEFAULT nextval('regiao_saude_id_seq'::regclass),
    "nome" varchar NOT NULL,
    "sigla" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS roles_id_seq;

-- Table Definition
CREATE TABLE "public"."roles" (
    "id" int4 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
    "nome" varchar(255) NOT NULL,
    "descricao" varchar(255),
    "created_at" timestamptz,
    "updated_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."ubs";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS ubs_id_seq1;

-- Table Definition
CREATE TABLE "public"."ubs" (
    "id" int4 NOT NULL DEFAULT nextval('ubs_id_seq1'::regclass),
    "nome" varchar(255),
    "gsap_id" int4,
    "sigla" varchar(20),
    "cnes" varchar(30),
    "tipologia_2022" varchar(30),
    "tipologia_2020" bpchar(1),
    "nota_equipe_ponderada" float8,
    "nota_profissional_ponderada" float8,
    "nota_servicos_ponderada" float8,
    "nota_estrutura_ponderada" float8,
    "nota_insumos_ponderada" float8,
    "nota_tic_ponderada" float8,
    "total_esf" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."usuario";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS usuario_id_seq1;

-- Table Definition
CREATE TABLE "public"."usuario" (
    "id" int4 NOT NULL DEFAULT nextval('usuario_id_seq1'::regclass),
    "cpf" varchar(11) NOT NULL,
    "nome" varchar(45) NOT NULL,
    "email" varchar(30) NOT NULL,
    "nivel" varchar(45) NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."usuarios";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS usuarios_id_seq;

-- Table Definition
CREATE TABLE "public"."usuarios" (
    "id" int4 NOT NULL DEFAULT nextval('usuarios_id_seq'::regclass),
    "nome" varchar(255) NOT NULL,
    "email" varchar(255),
    "matricula" varchar(50),
    "cpf" varchar(20),
    "password" varchar(255) NOT NULL,
    "remember_me_token" varchar(255),
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."usuarios_roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS usuarios_roles_id_seq;

-- Table Definition
CREATE TABLE "public"."usuarios_roles" (
    "id" int4 NOT NULL DEFAULT nextval('usuarios_roles_id_seq'::regclass),
    "usuario" int4 NOT NULL,
    "role" int4 NOT NULL,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."adonis_schema" ("id", "name", "batch", "migration_time") VALUES
(1, 'database/migrations/1711910765928_usuarios', 1, '2024-03-31 22:13:06.712826+00'),
(2, 'database/migrations/1711910765954_api_tokens', 1, '2024-03-31 22:13:06.738743+00'),
(3, 'database/migrations/1711922398990_roles', 1, '2024-03-31 22:13:06.76091+00'),
(4, 'database/migrations/1711922459149_roles_usuarios', 1, '2024-03-31 22:13:06.780374+00'),
(5, 'database/migrations/1711933145551_ubs', 2, '2024-04-01 01:07:08.187906+00');

INSERT INTO "public"."adonis_schema_versions" ("version") VALUES
(2);

INSERT INTO "public"."api_tokens" ("id", "user_id", "name", "type", "token", "expires_at", "created_at") VALUES
(3, 1, 'Opaque Access Token', 'api', '66d4d7963cf6835cee93fa76cf405981ba58d1eec2c06b49be22e9504284b63d', NULL, '2024-03-31 23:29:50.825+00'),
(4, 1, 'Opaque Access Token', 'api', '19aa302388d9c50bc6ed0d916d2c653b86a0c1c9e8589ae5542ca5a241762a4a', NULL, '2024-03-31 23:30:44.015+00'),
(5, 1, 'Opaque Access Token', 'api', '98ccb4b276b6f9c3e03f89dae6dd6a9618a488253815a3658ef24ea3e641d8b6', NULL, '2024-03-31 23:32:40.989+00');

INSERT INTO "public"."gsap" ("id", "nome", "regiao_admin") VALUES
(1, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - SAMAMBAIA', 2),
(2, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - CEILÂNDIA', 3),
(3, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - CEILÂNDIA', 3),
(4, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - SAMAMBAIA', 2),
(5, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 08 - CEILÂNDIA', 3),
(6, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - RECANTO DAS EMAS', 4),
(7, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - BRAZLÂNDIA', 5),
(8, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - CANDANGOLÂNDIA', 6),
(9, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - CRUZEIRO', 7),
(10, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - SOBRADINHO', 8),
(11, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - GAMA', 9),
(12, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - ITAPOÃ', 10),
(13, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - LAGO NORTE', 11),
(14, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - NÚCLEO BANDEIRANTE', 12),
(15, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - RIACHO FUNDO I', 13),
(16, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - TAGUATINGA', 14),
(17, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA - VARJÃO', 15),
(18, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - VICENTE PIRES', 16),
(19, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - ASA NORTE', 17),
(20, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - BRAZLÂNDIA', 5),
(21, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - CRUZEIRO', 7),
(22, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - GAMA', 9),
(23, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - GUARÁ', 18),
(24, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - SANTA MARIA', 19),
(25, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - TAGUATINGA', 14),
(26, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - ASA NORTE', 17),
(27, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - GAMA', 9),
(28, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - GUARÁ', 18),
(29, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - RECANTO DAS EMAS', 4),
(30, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - SOBRADINHO', 20),
(31, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - TAGUATINGA', 14),
(32, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - GUARÁ', 18),
(33, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - GAMA', 9),
(34, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 09 - PLANALTINA', 21),
(35, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - TAGUATINGA', 14),
(36, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - SOBRADINHO', 20),
(37, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - SÃO SEBASTIÃO', 22),
(38, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - SAMAMBAIA', 2),
(39, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 17 - CEILÂNDIA', 3),
(40, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - ASA NORTE', 17),
(41, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - ASA SUL', 17),
(42, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - ESTRUTURAL', 23),
(43, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - RIACHO FUNDO II', 24),
(44, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - RECANTO DAS EMAS', 4),
(45, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - SOBRADINHO', 25),
(46, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - PARANOÁ', 26),
(47, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 08 - PLANALTINA', 21),
(48, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - SAMAMBAIA', 2),
(49, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - PLANALTINA', 21),
(50, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 11 - CEILÂNDIA', 3),
(51, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - PLANALTINA', 21),
(52, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 16 - CEILÂNDIA', 27),
(53, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - PLANALTINA', 21),
(54, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - PLANALTINA', 21),
(55, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - SOBRADINHO', 25),
(56, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - ITAPOÃ', 10),
(57, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - SAMAMBAIA', 2),
(58, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 08 - SAMAMBAIA', 2),
(59, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - ÁGUAS CLARAS', 28),
(60, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - SAMAMBAIA', 2),
(61, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - SÃO SEBASTIÃO', 29),
(62, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - SÃO SEBASTIÃO', 22),
(63, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - CEILÂNDIA', 3),
(64, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - GAMA', 9),
(65, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 08 - TAGUATINGA', 14),
(66, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - PARANOÁ', 26),
(67, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - RIACHO FUNDO I', 30),
(68, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - SANTA MARIA', 19),
(69, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - SOBRADINHO', 20),
(70, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - CEILÂNDIA', 3),
(71, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - GAMA', 9),
(72, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - LAGO NORTE', 17),
(73, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - CEILÂNDIA', 3),
(74, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - SÃO SEBASTIÃO', 22),
(75, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - TAGUATINGA', 14),
(76, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - RECANTO DAS EMAS', 4),
(77, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - TAGUATINGA', 14),
(78, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 03 - BRAZLÂNDIA', 5),
(79, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 10 - CEILÂNDIA', 3),
(80, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - PLANALTINA', 21),
(81, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - GUARÁ', 18),
(82, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - PLANALTINA', 21),
(83, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - SÃO SEBASTIÃO', 22),
(84, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 05 - SANTA MARIA', 19),
(85, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - SOBRADINHO', 25),
(86, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - SANTA MARIA', 19),
(87, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - SANTA MARIA', 19),
(88, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 09 - SAMAMBAIA', 2),
(89, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - RIACHO FUNDO II', 24),
(90, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - PARANOÁ', 26),
(91, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 02 - RIACHO FUNDO I', 13),
(92, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 12 - CEILÂNDIA', 3),
(93, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - CEILÂNDIA', 3),
(94, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - PLANALTINA', 21),
(95, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 09 - CEILÂNDIA', 3),
(96, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 06 - SAMAMBAIA', 2),
(97, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 15 - CEILÂNDIA', 3),
(98, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 13 - CEILÂNDIA', 3),
(99, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 14 - CEILÂNDIA', 3),
(100, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 01 - RECANTO DAS EMAS', 4),
(101, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 04 - CEILÂNDIA', 3),
(102, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 07 - GAMA', 9),
(103, 'GERÊNCIA DE SERVIÇOS DE ATENÇÃO PRIMÁRIA 18 - CEILÂNDIA', 3);

INSERT INTO "public"."regiao_admin" ("id", "nome", "regiao_saude") VALUES
(2, 'SAMAMBAIA', 1),
(3, 'CEILÂNDIA', 2),
(4, 'RECANTO DAS EMAS', 1),
(5, 'BRAZLÂNDIA', 2),
(6, 'CANDANGOLÂNDIA', 3),
(7, 'CRUZEIRO', 4),
(8, 'FERCAL', 5),
(9, 'GAMA', 6),
(10, 'ITAPOÃ', 7),
(11, 'LAGO NORTE', 4),
(12, 'NÚCLEO BANDEIRANTE', 3),
(13, 'RIACHO FUNDO I', 3),
(14, 'TAGUATINGA', 1),
(15, 'VARJÃO', 4),
(16, 'VICENTE PIRES', 1),
(17, 'PLANO PILOTO', 4),
(18, 'GUARÁ', 3),
(19, 'SANTA MARIA', 6),
(20, 'SOBRADINHO', 5),
(21, 'PLANALTINA', 5),
(22, 'SÃO SEBASTIÃO', 7),
(23, 'SCIA/ESTRUTURAL', 3),
(24, 'RIACHO FUNDO II', 3),
(25, 'SOBRADINHO II', 5),
(26, 'PARANOÁ', 7),
(27, 'SOL NASCENTE E PÔR DO SOL', 2),
(28, 'ÁGUAS CLARAS', 1),
(29, 'JARDIM BOTÂNICO', 7),
(30, 'PARK WAY', 3);

INSERT INTO "public"."regiao_saude" ("id", "nome", "sigla") VALUES
(1, 'SUDOESTE', NULL),
(2, 'OESTE', NULL),
(3, 'CENTRO-SUL', NULL),
(4, 'CENTRAL', NULL),
(5, 'NORTE', NULL),
(6, 'SUL', NULL),
(7, 'LESTE', NULL);

INSERT INTO "public"."ubs" ("id", "nome", "gsap_id", "sigla", "cnes", "tipologia_2022", "tipologia_2020", "nota_equipe_ponderada", "nota_profissional_ponderada", "nota_servicos_ponderada", "nota_estrutura_ponderada", "nota_insumos_ponderada", "nota_tic_ponderada", "total_esf") VALUES
(1, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SAMAMBAIA', 1, NULL, '10677', 'A', 'A', 0.024, 0.169, 0.281, 0.075, 0.225, 0.051, 3),
(2, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - CEILÂNDIA', 2, NULL, '10987', 'A', 'B', 0.024, 0.224, 0.281, 0.07, 0.262, 0.062, 5),
(3, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - CEILÂNDIA', 3, NULL, '11037', 'A', 'B', 0.024, 0.215, 0.281, 0.057, 0.225, 0.062, 6),
(4, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SAMAMBAIA', 4, NULL, '7299877', 'A', 'C', 0.024, 0.196, 0.281, 0.077, 0.244, 0.047, 7),
(5, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - CEILÂNDIA', 5, NULL, '11045', 'A', 'C', 0.024, 0.215, 0.281, 0.072, 0.244, 0.062, 6),
(6, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - RECANTO DAS EMAS', 6, NULL, '7417632', 'B', 'A', 0.028, 0.196, 0.281, 0.059, 0.225, 0.035, 6),
(7, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - BRAZLÂNDIA', 7, NULL, '11215', 'B', 'B', 0.016, 0.205, 0.281, 0.068, 0.187, 0.062, 5),
(8, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CANDANGOLÂNDIA', 8, NULL, '11185', 'B', 'B', 0.016, 0.205, 0.281, 0.047, 0.225, 0.035, 5),
(9, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CRUZEIRO', 9, NULL, '10731', 'B', 'B', 0.016, 0.224, 0.281, 0.05, 0.187, 0.062, 5),
(10, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - FERCAL', 10, NULL, '2804360', 'B', 'B', 0.024, 0.114, 0.281, 0.062, 0.225, 0.035, 2),
(11, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - GAMA', 11, NULL, '10820', 'B', 'B', 0.024, 0.196, 0.211, 0.069, 0.225, 0.047, 5),
(12, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ITAPOÃ', 12, NULL, '6268269', 'B', 'B', 0.024, 0.224, 0.281, 0.057, 0.225, 0.047, 9),
(13, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - LAGO NORTE', NULL, NULL, '11177', 'B', 'B', 0.016, 0.205, 0.281, 0.068, 0.187, 0.035, 7),
(14, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - NÚCLEO BANDEIRANTE', 14, NULL, '11126', 'B', 'B', 0.016, 0.215, 0.281, 0.054, 0.206, 0.062, 5),
(15, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RIACHO FUNDO I', 15, NULL, '11169', 'B', 'B', 0.016, 0.205, 0.281, 0.047, 0.187, 0.047, 7),
(16, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - TAGUATINGA', 16, NULL, '10901', 'B', 'B', 0.016, 0.205, 0.281, 0.055, 0.225, 0.035, 7),
(17, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - VARJÃO', 17, NULL, '2617358', 'B', 'B', 0.016, 0.196, 0.211, 0.069, 0.187, 0.047, 3),
(18, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - VICENTE PIRES', 18, NULL, '9056963', 'B', 'B', 0.016, 0.215, 0.281, 0.061, 0.187, 0.047, 8),
(19, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ASA NORTE', 19, NULL, '10723', 'B', 'A', 0.016, 0.224, 0.281, 0.054, 0.225, 0.035, 6),
(20, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - BRAZLÂNDIA', 20, NULL, '6662358', 'B', 'B', 0.02, 0.178, 0.281, 0.069, 0.187, 0.047, 4),
(21, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - CRUZEIRO', 21, NULL, '10758', 'B', 'B', 0.016, 0.224, 0.281, 0.058, 0.187, 0.035, 5),
(22, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - GAMA', 22, NULL, '10839', 'B', 'B', 0.016, 0.16, 0.281, 0.064, 0.187, 0.047, 5),
(23, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - GUARÁ', 23, NULL, '11266', 'B', 'B', 0.016, 0.224, 0.281, 0.049, 0.15, 0.051, 7),
(24, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SANTA MARIA', 24, NULL, '10669', 'B', 'B', 0.024, 0.196, 0.281, 0.047, 0.187, 0.062, 8),
(25, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - TAGUATINGA', 25, NULL, '10928', 'B', 'B', 0.024, 0.215, 0.281, 0.056, 0.225, 0.035, 8),
(26, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - ASA NORTE', 26, NULL, '11355', 'B', 'B', 0.024, 0.196, 0.281, 0.062, 0.225, 0.035, 5),
(27, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - GAMA', 27, NULL, '10847', 'B', 'B', 0.024, 0.196, 0.281, 0.068, 0.15, 0.062, 6),
(28, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - GUARÁ', 28, NULL, '11274', 'B', 'B', 0.024, 0.196, 0.281, 0.055, 0.187, 0.035, 7),
(29, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - RECANTO DAS EMAS', 29, NULL, '7170939', 'B', 'B', 0.032, 0.187, 0.281, 0.07, 0.225, 0.051, 7),
(30, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SOBRADINHO', 30, NULL, '11568', 'B', 'B', 0.024, 0.224, 0.281, 0.057, 0.225, 0.047, 6),
(31, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - TAGUATINGA', 31, NULL, '10936', 'B', 'B', 0.016, 0.205, 0.281, 0.062, 0.225, 0.035, 7),
(32, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - GUARÁ', 32, NULL, '11657', 'B', 'B', 0.024, 0.187, 0.211, 0.072, 0.244, 0.062, 2),
(33, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - GAMA', 33, NULL, '10863', 'B', 'B', 0.016, 0.169, 0.281, 0.065, 0.187, 0.047, 5),
(34, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - PLANALTINA', 34, NULL, '6216021', 'B', 'B', 0.028, 0.215, 0.281, 0.056, 0.225, 0.047, 8),
(35, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - TAGUATINGA', 35, NULL, '10626', 'B', 'B', 0.016, 0.215, 0.281, 0.051, 0.244, 0.035, 7),
(36, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SOBRADINHO', 36, NULL, '2804387', 'B', 'B', 0.024, 0.187, 0.175, 0.066, 0.225, 0.062, 1),
(37, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - SÃO SEBASTIÃO', 37, NULL, '3742873', 'B', 'B', 0.024, 0.224, 0.211, 0.069, 0.15, 0.051, 2),
(38, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - SAMAMBAIA', 38, NULL, '9480587', 'B', 'B', 0.02, 0.178, 0.281, 0.069, 0.225, 0.047, 6),
(39, 'UNIDADE BÁSICA DE SAÚDE Nº 17 - CEILÂNDIA', 39, NULL, '9509356', 'B', 'B', 0.032, 0.187, 0.211, 0.07, 0.244, 0.062, 4),
(40, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ASA NORTE', 40, NULL, '10707', 'B', 'C', 0.016, 0.196, 0.281, 0.064, 0.225, 0.047, 5),
(41, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ASA SUL', 41, NULL, '11150', 'B', 'C', 0.018, 0.224, 0.281, 0.057, 0.187, 0.051, 7),
(42, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ESTRUTURAL', 42, NULL, '2779374', 'B', 'B', 0.024, 0.196, 0.281, 0.042, 0.244, 0.062, 9),
(43, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RIACHO FUNDO II', 43, NULL, '5038669', 'B', 'C', 0.024, 0.196, 0.281, 0.069, 0.15, 0.062, 6),
(44, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SOBRADINHO ', 36, NULL, '11223', 'B', NULL, 0.016, 0.187, 0.281, 0.052, 0.244, 0.062, 7),
(45, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RECANTO DAS EMAS', 44, NULL, '11134', 'B', 'B', 0.016, 0.196, 0.281, 0.066, 0.225, 0.035, 8),
(46, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SOBRADINHO II', 45, NULL, '7368895', 'B', 'C', 0.016, 0.187, 0.281, 0.064, 0.225, 0.062, 7),
(47, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - PARANOÁ', 46, NULL, '9572511', 'B', 'C', 0.024, 0.215, 0.281, 0.071, 0.15, 0.039, 6),
(48, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - PLANALTINA', 47, NULL, '6216013', 'B', 'B', 0.024, 0.215, 0.281, 0.057, 0.187, 0.035, 10),
(49, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SAMAMBAIA', 48, NULL, '10685', 'B', 'C', 0.016, 0.187, 0.281, 0.078, 0.187, 0.047, 6),
(50, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - PLANALTINA', 49, NULL, '5050359', 'B', 'C', 0.012, 0.187, 0.211, 0.086, 0.225, 0.047, 3),
(51, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - PLANALTINA', 49, NULL, '2672235', 'B', 'B', 0.024, 0.187, 0.175, 0.078, 0.225, 0.062, 1),
(52, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - CEILÂNDIA', 50, NULL, '11061', 'B', 'C', 0.016, 0.178, 0.281, 0.071, 0.187, 0.062, 5),
(53, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - PLANALTINA', 51, NULL, '11576', 'B', 'C', 0.008, 0.187, 0.211, 0.066, 0.244, 0.062, 1),
(54, 'UNIDADE BÁSICA DE SAÚDE Nº 16 - CEILÂNDIA', 52, NULL, '9475931', 'B', 'B', 0.024, 0.205, 0.211, 0.075, 0.225, 0.047, 4),
(55, 'UNIDADE BÁSICA DE SAÚDE Nº 17 - PLANALTINA', 53, NULL, '3144666', 'B', 'B', 0.024, 0.187, 0.211, 0.057, 0.187, 0.062, 1),
(56, 'UNIDADE BÁSICA DE SAÚDE Nº 20 - PLANALTINA', 54, NULL, '9768637', 'B', 'B', 0.012, 0.178, 0.281, 0.073, 0.187, 0.062, 4),
(57, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SOBRADINHO II', 55, NULL, '11258', 'B', 'D', 0.004, 0.187, 0.281, 0.062, 0.225, 0.062, 5),
(58, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - ITAPOÃ', 56, NULL, '9572481', 'B', 'C', 0.016, 0.178, 0.211, 0.075, 0.225, 0.047, 4),
(59, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SAMAMBAIA', 57, NULL, '6921736', 'B', 'C', 0.032, 0.205, 0.211, 0.072, 0.244, 0.047, 4),
(60, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SAMAMBAIA', 58, NULL, '7114397', 'B', 'E', 0.02, 0.187, 0.211, 0.078, 0.169, 0.062, 4),
(61, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ÁGUAS CLARAS', 59, NULL, '7108923', 'B', NULL, 0.024, 0.224, 0.281, 0.058, 0.15, 0.047, 6),
(62, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SAMAMBAIA', 60, NULL, '10774', 'B', NULL, 0.028, 0.196, 0.281, 0.054, 0.15, 0.047, 7),
(63, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - JARDINS MANGUEIRAL', NULL, NULL, '736260', 'B', NULL, 0.024, 0.215, 0.211, 0.066, 0.187, 0.062, 4),
(64, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SÃO SEBASTIÃO', 62, NULL, '10790', 'C', 'B', 0.024, 0.205, 0.211, 0.056, 0.225, 0.047, 10),
(65, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - FERCAL', 10, NULL, '11517', 'C', 'B', 0.032, 0.187, 0.175, 0.049, 0.225, 0.023, 1),
(66, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - FERCAL', 10, NULL, '161616', 'C', 'B', 0.032, 0.205, 0.175, 0.063, 0.169, 0.047, 1),
(67, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SOBRADINHO', 36, NULL, '6770657', 'C', 'B', 0.024, 0.151, 0.211, 0.065, 0.187, 0.047, 1),
(68, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - CEILÂNDIA', 63, NULL, '11029', 'C', 'B', 0.024, 0.215, 0.281, 0.061, 0.112, 0.047, 6),
(69, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - GAMA', 64, NULL, '10871', 'C', 'B', 0.016, 0.196, 0.281, 0.077, 0.15, 0.023, 6),
(70, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - TAGUATINGA', 65, NULL, '2617269', 'C', 'B', 0.024, 0.196, 0.211, 0.057, 0.187, 0.047, 5),
(71, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - GAMA', 11, NULL, '2779404', 'C', 'B', 0.032, 0.187, 0.211, 0.068, 0.169, 0.047, 1),
(72, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PARANOÁ', 66, NULL, '10634', 'C', 'C', 0.024, 0.205, 0.211, 0.062, 0.187, 0.035, 10),
(73, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PARK WAY', NULL, NULL, '11681', 'C', 'C', 0.032, 0.187, 0.14, 0.07, 0.187, 0.062, 1),
(74, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SANTA MARIA', 68, NULL, '10782', 'C', 'C', 0.024, 0.196, 0.281, 0.055, 0.187, 0.035, 11),
(75, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SOBRADINHO', 69, NULL, '11231', 'C', 'C', 0.016, 0.187, 0.281, 0.051, 0.206, 0.039, 8),
(76, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - CEILÂNDIA', 70, NULL, '10995', 'C', 'C', 0.016, 0.16, 0.211, 0.062, 0.187, 0.035, 5),
(77, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - GAMA', 71, NULL, '10855', 'C', 'C', 0.02, 0.16, 0.211, 0.056, 0.225, 0.047, 5),
(78, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - ASA NORTE', NULL, NULL, '5117666', 'C', 'C', 0.008, 0.187, 0.14, 0.064, 0.244, 0.051, 1),
(79, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - CEILÂNDIA', 73, NULL, '11010', 'C', 'C', 0.016, 0.205, 0.211, 0.056, 0.15, 0.047, 6),
(80, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SÃO SEBASTIÃO', NULL, NULL, '11363', 'C', 'C', 0.024, 0.187, 0.14, 0.07, 0.187, 0.047, 2),
(81, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - TAGUATINGA', 75, NULL, '10952', 'C', 'C', 0.016, 0.205, 0.281, 0.052, 0.187, 0.047, 9),
(82, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - RECANTO DAS EMAS', 76, NULL, '2779331', 'C', 'C', 0.024, 0.187, 0.14, 0.075, 0.169, 0.047, 1),
(83, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - TAGUATINGA', 77, NULL, '10960', 'C', 'C', 0.016, 0.178, 0.281, 0.063, 0.15, 0.062, 7),
(84, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - BRAZLÂNDIA', 78, NULL, '9571280', 'C', 'C', 0.024, 0.151, 0.211, 0.068, 0.187, 0.035, 1),
(85, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - CEILÂNDIA', 79, NULL, '11207', 'C', 'C', 0.024, 0.205, 0.281, 0.056, 0.15, 0.035, 5),
(86, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - PLANALTINA', 53, NULL, '2804174', 'C', 'C', 0.024, 0.187, 0.14, 0.069, 0.225, 0.051, 1),
(87, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - SÃO SEBASTIÃO', 37, NULL, '7423489', 'C', 'C', 0.024, 0.114, 0.211, 0.066, 0.15, 0.062, 1),
(88, 'UNIDADE BÁSICA DE SAÚDE Nº 14 - PLANALTINA', 80, NULL, '11584', 'C', 'C', 0.008, 0.114, 0.211, 0.063, 0.206, 0.051, 1),
(89, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - GUARÁ', 81, NULL, '11118', 'C', 'D', 0.016, 0.196, 0.281, 0.057, 0.131, 0.047, 7),
(90, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ESTRUTURAL', 42, NULL, '3513564', 'C', 'D', 0.016, 0.205, 0.14, 0.069, 0.15, 0.035, 3),
(91, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - PLANALTINA', 82, NULL, '10650', 'C', 'D', 0.028, 0.187, 0.14, 0.07, 0.225, 0.047, 4),
(92, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SÃO SEBASTIÃO', 83, NULL, '3254887', 'C', 'D', 0.024, 0.114, 0.211, 0.056, 0.187, 0.062, 2),
(93, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SÃO SEBASTIÃO', 83, NULL, '3212068', 'C', 'D', 0.024, 0.187, 0.211, 0.075, 0.131, 0.047, 2),
(94, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SANTA MARIA', 84, NULL, '3144593', 'C', 'D', 0.024, 0.178, 0.14, 0.079, 0.15, 0.062, 2),
(95, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SOBRADINHO II', 85, NULL, '7686730', 'C', 'D', 0.024, 0.224, 0.105, 0.066, 0.225, 0.047, 2),
(96, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SANTA MARIA', 86, NULL, '3144607', 'C', 'C', 0.016, 0.105, 0.211, 0.071, 0.225, 0.047, 2),
(97, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SANTA MARIA', 87, NULL, '3144569', 'C', 'C', 0.008, 0.105, 0.211, 0.064, 0.225, 0.051, 3),
(98, 'UNIDADE BÁSICA DE SAÚDE Nº 15 - PLANALTINA', 80, NULL, '2672227', 'C', 'D', 0.008, 0.114, 0.211, 0.072, 0.187, 0.062, 1),
(99, 'UNIDADE BÁSICA DE SAÚDE Nº 16 - PLANALTINA', 53, NULL, '11592', 'C', 'D', 0.008, 0.114, 0.211, 0.064, 0.187, 0.035, 1),
(100, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SAMAMBAIA', 88, NULL, '10642', 'C', 'E', 0.012, 0.169, 0.281, 0.051, 0.187, 0.035, 9),
(101, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - RIACHO FUNDO II', 89, NULL, '7526504', 'C', 'E', 0.024, 0.196, 0.105, 0.071, 0.225, 0.047, 4),
(102, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - RECANTO DAS EMAS', 76, NULL, '2804247', 'C', 'E', 0.016, 0.178, 0.14, 0.069, 0.187, 0.051, 2),
(103, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - RECANTO DAS EMAS', 76, NULL, '7059892', 'C', NULL, 0.016, 0.16, 0.211, 0.062, 0.187, 0.051, 5),
(104, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SANTA MARIA', 86, NULL, '2673894', 'C', NULL, 0.024, 0.151, 0.211, 0.072, 0.15, 0.062, 1),
(105, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SOBRADINHO II', 85, NULL, '6770681', 'D', 'B', 0.032, 0.187, 0.105, 0.063, 0.169, 0.047, 1),
(106, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SOBRADINHO', 30, NULL, '7687079', 'D', 'B', 0.032, 0.187, 0.175, 0.055, 0.112, 0.047, 1),
(107, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - PARANOÁ', 90, NULL, '11614', 'D', 'B', 0.024, 0.187, 0.035, 0.076, 0.187, 0.051, 1),
(108, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - PARANOÁ', 90, NULL, '7075596', 'D', 'B', 0.032, 0.151, 0.07, 0.08, 0.187, 0.035, 1),
(109, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RIACHO FUNDO I', NULL, NULL, '3781437', 'D', 'C', 0.016, 0.187, 0.14, 0.056, 0.131, 0.062, 3),
(110, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SANTA MARIA', 86, NULL, '3144550', 'D', 'C', 0.024, 0.151, 0.105, 0.079, 0.187, 0.062, 1),
(111, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SOBRADINHO II', 85, NULL, '6770665', 'D', 'C', 0.032, 0.187, 0.105, 0.052, 0.15, 0.047, 1),
(112, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - BRAZLÂNDIA', 78, NULL, '11509', 'D', 'C', 0.032, 0.187, 0.105, 0.075, 0.131, 0.062, 1),
(113, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - CEILÂNDIA', 92, NULL, '2617293', 'D', 'C', 0.016, 0.178, 0.175, 0.052, 0.15, 0.062, 6),
(114, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - PLANALTINA', 51, NULL, '2804123', 'D', 'C', 0.008, 0.114, 0.175, 0.055, 0.169, 0.062, 1),
(115, 'UNIDADE BÁSICA DE SAÚDE Nº 19 - PLANALTINA', 51, NULL, '9566988', 'D', 'C', 0.008, 0.114, 0.175, 0.068, 0.169, 0.039, 1),
(116, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CEILÂNDIA', 93, NULL, '7347715', 'D', 'D', 0.016, 0.187, 0.105, 0.054, 0.187, 0.062, 4),
(117, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PLANALTINA', 94, NULL, '5167817', 'D', 'D', 0.016, 0.187, 0.14, 0.07, 0.15, 0.047, 3),
(118, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ITAPOÃ', 56, NULL, '3286959', 'D', 'C', 0.016, 0.178, 0.105, 0.075, 0.112, 0.047, 2),
(119, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - PLANALTINA', 94, NULL, '11096', 'D', 'C', 0.008, 0.151, 0.175, 0.059, 0.131, 0.051, 1),
(120, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SÃO SEBASTIÃO', NULL, NULL, '3212017', 'D', 'D', 0.024, 0.114, 0.14, 0.056, 0.15, 0.047, 1),
(121, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SÃO SEBASTIÃO', NULL, NULL, '3781402', 'D', 'D', 0.024, 0.114, 0.07, 0.058, 0.187, 0.062, 1),
(122, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - PARANOÁ', 90, NULL, '11630', 'D', NULL, 0.032, 0.141, 0.07, 0.075, 0.187, 0.023, 1),
(123, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - CEILÂNDIA', 95, NULL, '11053', 'D', 'C', 0.012, 0.16, 0.211, 0.045, 0.15, 0.062, 6),
(124, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SÃO SEBASTIÃO', 37, NULL, '3286932', 'D', 'C', 0.024, 0.114, 0.14, 0.059, 0.187, 0.051, 1),
(125, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - GAMA', 64, NULL, '3144577', 'D', 'C', 0.024, 0.187, 0.105, 0.062, 0.075, 0.062, 2),
(126, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - SÃO SEBASTIÃO', 37, NULL, '3212025', 'D', 'D', 0.024, 0.114, 0.211, 0.068, 0.131, 0.062, 1),
(127, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - PLANALTINA', 80, NULL, '11622', 'D', 'D', 0.024, 0.187, 0.14, 0.065, 0.15, 0.035, 1),
(128, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RIACHO FUNDO II', 89, NULL, '3410196', 'D', 'E', 0.024, 0.105, 0.105, 0.05, 0.225, 0.047, 2),
(129, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SÃO SEBASTIÃO', NULL, NULL, '3212033', 'D', 'E', 0.024, 0.114, 0.14, 0.05, 0.169, 0.035, 1),
(130, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - GUARÁ', 28, NULL, '9263632', 'D', 'E', 0.024, 0.114, 0.14, 0.064, 0.225, 0.039, 1),
(131, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SAMAMBAIA', 96, NULL, '7053754', 'D', 'D', 0.02, 0.187, 0.035, 0.084, 0.15, 0.062, 4),
(132, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SANTA MARIA', 84, NULL, '7559194', 'D', 'E', 0.016, 0.105, 0.105, 0.052, 0.187, 0.062, 2),
(133, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SÃO SEBASTIÃO', NULL, NULL, '7975295', 'D', 'E', 0.004, 0.114, 0.211, 0.063, 0.187, 0.023, 1),
(134, 'UNIDADE BÁSICA DE SAÚDE Nº 15 - CEILÂNDIA', 97, NULL, '7347723', 'D', 'E', 0.012, 0.178, 0.14, 0.063, 0.187, 0.047, 5),
(135, 'UNIDADE BÁSICA DE SAÚDE Nº 19 - SÃO SEBASTIÃO', 83, NULL, '3254909', 'D', 'E', 0.024, 0.078, 0.211, 0.045, 0.187, 0.062, 1),
(136, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SOBRADINHO II', 55, NULL, '957755', 'D', NULL, 0.016, 0.187, 0.14, 0.07, 0.094, 0.047, 4),
(137, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - PARANOÁ', 90, NULL, '2804107', 'E', 'B', 0.032, 0.132, 0.07, 0.077, 0.15, 0.035, 1),
(138, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - GAMA', 11, NULL, '3144615', 'E', 'C', 0.024, 0.178, 0.035, 0.063, 0.15, 0.051, 2),
(139, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - PARANOÁ', 90, NULL, '3286975', 'E', 'D', 0.024, 0.205, 0.07, 0.066, 0.056, 0.047, 2),
(140, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - BRAZLÂNDIA', 78, NULL, '3144658', 'E', 'D', 0.024, 0.151, 0.105, 0.07, 0.056, 0.035, 1),
(141, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - RIACHO FUNDO II', 89, NULL, '2660199', 'E', 'D', 0.02, 0.096, 0, 0.062, 0.15, 0.047, 4),
(142, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - BRAZLÂNDIA', 78, NULL, '3742865', 'E', 'D', 0.008, 0.119, 0.105, 0.047, 0.094, 0.035, 1),
(143, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - PARANOÁ', 90, NULL, '11606', 'E', 'D', 0.024, 0.114, 0.14, 0.068, 0.075, 0.023, 1),
(144, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - RIACHO FUNDO II', 43, NULL, '2673924', 'E', 'C', 0.032, 0.187, 0.07, 0.061, 0.094, 0.062, 1),
(145, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - BRAZLÂNDIA', 78, NULL, '3144631', 'E', 'D', 0.024, 0.16, 0.105, 0.047, 0.112, 0.035, 1),
(146, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - BRAZLÂNDIA', 78, NULL, '11495', 'E', 'D', 0.004, 0.114, 0.105, 0.055, 0.094, 0.035, 1),
(147, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SOBRADINHO II', 85, NULL, '7041594', 'E', 'D', 0.024, 0.114, 0.105, 0.048, 0.075, 0.047, 1),
(148, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - PLANALTINA', 82, NULL, '2360233', 'E', 'D', 0.024, 0.105, 0.105, 0.047, 0.112, 0.023, 3),
(149, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - BRAZLÂNDIA', 78, NULL, '9548203', 'E', 'D', 0.024, 0.078, 0.105, 0.059, 0.112, 0.035, 1),
(150, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - CEILÂNDIA', 98, NULL, '3144542', 'E', 'D', 0.024, 0.114, 0.07, 0.054, 0.187, 0.062, 2),
(151, 'UNIDADE BÁSICA DE SAÚDE Nº 14 - CEILÂNDIA', 99, NULL, '3677044', 'E', 'C', 0.024, 0.187, 0.035, 0.076, 0.112, 0.062, 2),
(152, 'UNIDADE BÁSICA DE SAÚDE Nº 18 - PLANALTINA', 54, NULL, '9566961', 'E', 'D', 0.008, 0.114, 0.07, 0.052, 0.094, 0.062, 1),
(153, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RECANTO DAS EMAS', 100, NULL, '10804', 'E', 'E', 0.024, 0.16, 0, 0.072, 0.15, 0.047, 3),
(154, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - NÚCLEO BANDEIRANTE', 14, NULL, '7236778', 'E', 'E', 0.024, 0.187, 0, 0.035, 0.112, 0.047, 2),
(155, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - CEILÂNDIA', 101, NULL, '11002', 'E', 'E', 0.016, 0.169, 0.035, 0.066, 0.112, 0.047, 2),
(156, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - PLANALTINA', 34, NULL, '5050340', 'E', 'E', 0.024, 0.114, 0, 0.045, 0.15, 0.035, 3),
(157, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - GAMA', 102, NULL, '10898', 'E', 'E', 0.024, 0.096, 0.07, 0.036, 0.169, 0.062, 3),
(158, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - SAMAMBAIA', 57, NULL, '3742857', 'E', 'E', 0.024, 0.114, 0, 0.059, 0.112, 0.062, 2),
(159, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - RECANTO DAS EMAS', 100, NULL, '3144623', 'E', 'E', 0.016, 0.105, 0, 0.058, 0.112, 0.035, 2),
(160, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SAMAMBAIA', 4, NULL, '3633845', 'E', 'E', 0.024, 0.114, 0, 0.061, 0.094, 0.047, 2),
(161, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - RECANTO DAS EMAS', 76, NULL, '9543945', 'E', 'E', 0.004, 0.114, 0, 0.037, 0.037, 0.023, 2),
(162, 'UNIDADE BÁSICA DE SAÚDE Nº 18 - CEILÂNDIA', 103, NULL, '9643338', 'E', 'E', 0.024, 0.114, 0, 0.047, 0.112, 0.062, 1),
(163, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ÁGUAS CLARAS', 59, NULL, '3742822', 'E', NULL, 0.032, 0.187, 0, 0.066, 0.056, 0.062, 1),
(164, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - SAMAMBAIA', 1, NULL, '7771479', 'E', NULL, 0.032, 0.205, 0.07, 0.076, 0.075, 0.047, 4),
(165, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - SAMAMBAIA', 60, NULL, '9647597', 'E', NULL, 0.004, 0.105, 0, 0.04, 0.075, 0.023, 3);

INSERT INTO "public"."usuarios" ("id", "nome", "email", "matricula", "cpf", "password", "remember_me_token", "created_at", "updated_at") VALUES
(1, 'Usuário Teste 1', 'teste@teste.com', NULL, '00597099103', '$scrypt$n=16384,r=8,p=1$y+brEt7AC6y1EbChMPIRjQ$Y/KVkSbkluSULMpQh7a+Imh4oIRN6yPL1BWVdwjaQhVsv8P6bYLGzNdWPbH1QPrWdlwzwhEKahtF57gi+Kf/Aw', NULL, '2024-03-31 22:45:07.061+00', '2024-03-31 22:45:07.062+00'),
(5, 'Usuário Teste 2', 'teste1@teste.com', NULL, '00597099104', '$scrypt$n=16384,r=8,p=1$wBj8NenyKcVnVNRfsBXo9w$If8qnXeYvQ8s9d27iSsFI01G8stkKVJGl7DvxrNkcTAKdF5XOsTaTxlhkZY3PvhLKp9VQlhoimymCc5MLuy8+Q', NULL, '2024-03-31 23:09:46.388+00', '2024-03-31 23:09:46.388+00');

ALTER TABLE "public"."api_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "public"."usuarios"("id") ON DELETE CASCADE;
ALTER TABLE "public"."usuarios_roles" ADD FOREIGN KEY ("usuario") REFERENCES "public"."usuarios"("id") ON DELETE CASCADE;
ALTER TABLE "public"."usuarios_roles" ADD FOREIGN KEY ("role") REFERENCES "public"."roles"("id") ON DELETE CASCADE;
