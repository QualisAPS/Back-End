-- -------------------------------------------------------------
-- TablePlus 5.9.0(538)
--
-- https://tableplus.com/
--
-- Database: qualis
-- Generation Time: 2024-04-15 21:30:31.3070
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
    "tipologia_2022" bpchar(1),
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
(1, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SAMAMBAIA', NULL, NULL, '10677', 'A', NULL, 0.024, 0.169, 0.281, 0.075, 0.225, 0.051, 3),
(2, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - CEILÂNDIA', NULL, NULL, '10987', 'A', NULL, 0.024, 0.224, 0.281, 0.07, 0.262, 0.062, 5),
(3, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - CEILÂNDIA', NULL, NULL, '11037', 'A', NULL, 0.024, 0.215, 0.281, 0.057, 0.225, 0.062, 6),
(4, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SAMAMBAIA', NULL, NULL, '7299877', 'A', NULL, 0.024, 0.196, 0.281, 0.077, 0.244, 0.047, 7),
(5, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - CEILÂNDIA', NULL, NULL, '11045', 'A', NULL, 0.024, 0.215, 0.281, 0.072, 0.244, 0.062, 6),
(6, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - RECANTO DAS EMAS', NULL, NULL, '7417632', 'B', NULL, 0.028, 0.196, 0.281, 0.059, 0.225, 0.035, 6),
(7, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - BRAZLÂNDIA', NULL, NULL, '11215', 'B', NULL, 0.016, 0.205, 0.281, 0.068, 0.187, 0.062, 5),
(8, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CANDANGOLÂNDIA', NULL, NULL, '11185', 'B', NULL, 0.016, 0.205, 0.281, 0.047, 0.225, 0.035, 5),
(9, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CRUZEIRO', NULL, NULL, '10731', 'B', NULL, 0.016, 0.224, 0.281, 0.05, 0.187, 0.062, 5),
(10, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - FERCAL', NULL, NULL, '2804360', 'B', NULL, 0.024, 0.114, 0.281, 0.062, 0.225, 0.035, 2),
(11, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - GAMA', NULL, NULL, '10820', 'B', NULL, 0.024, 0.196, 0.211, 0.069, 0.225, 0.047, 5),
(12, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ITAPOÃ', NULL, NULL, '6268269', 'B', NULL, 0.024, 0.224, 0.281, 0.057, 0.225, 0.047, 9),
(13, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - LAGO NORTE', NULL, NULL, '11177', 'B', NULL, 0.016, 0.205, 0.281, 0.068, 0.187, 0.035, 7),
(14, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - NÚCLEO BANDEIRANTE', NULL, NULL, '11126', 'B', NULL, 0.016, 0.215, 0.281, 0.054, 0.206, 0.062, 5),
(15, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RIACHO FUNDO I', NULL, NULL, '11169', 'B', NULL, 0.016, 0.205, 0.281, 0.047, 0.187, 0.047, 7),
(16, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - TAGUATINGA', NULL, NULL, '10901', 'B', NULL, 0.016, 0.205, 0.281, 0.055, 0.225, 0.035, 7),
(17, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - VARJÃO', NULL, NULL, '2617358', 'B', NULL, 0.016, 0.196, 0.211, 0.069, 0.187, 0.047, 3),
(18, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - VICENTE PIRES', NULL, NULL, '9056963', 'B', NULL, 0.016, 0.215, 0.281, 0.061, 0.187, 0.047, 8),
(19, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ASA NORTE', NULL, NULL, '10723', 'B', NULL, 0.016, 0.224, 0.281, 0.054, 0.225, 0.035, 6),
(20, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - BRAZLÂNDIA', NULL, NULL, '6662358', 'B', NULL, 0.02, 0.178, 0.281, 0.069, 0.187, 0.047, 4),
(21, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - CRUZEIRO', NULL, NULL, '10758', 'B', NULL, 0.016, 0.224, 0.281, 0.058, 0.187, 0.035, 5),
(22, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - GAMA', NULL, NULL, '10839', 'B', NULL, 0.016, 0.16, 0.281, 0.064, 0.187, 0.047, 5),
(23, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - GUARÁ', NULL, NULL, '11266', 'B', NULL, 0.016, 0.224, 0.281, 0.049, 0.15, 0.051, 7),
(24, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SANTA MARIA', NULL, NULL, '10669', 'B', NULL, 0.024, 0.196, 0.281, 0.047, 0.187, 0.062, 8),
(25, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - TAGUATINGA', NULL, NULL, '10928', 'B', NULL, 0.024, 0.215, 0.281, 0.056, 0.225, 0.035, 8),
(26, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - ASA NORTE', NULL, NULL, '11355', 'B', NULL, 0.024, 0.196, 0.281, 0.062, 0.225, 0.035, 5),
(27, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - GAMA', NULL, NULL, '10847', 'B', NULL, 0.024, 0.196, 0.281, 0.068, 0.15, 0.062, 6),
(28, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - GUARÁ', NULL, NULL, '11274', 'B', NULL, 0.024, 0.196, 0.281, 0.055, 0.187, 0.035, 7),
(29, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - RECANTO DAS EMAS', NULL, NULL, '7170939', 'B', NULL, 0.032, 0.187, 0.281, 0.07, 0.225, 0.051, 7),
(30, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SOBRADINHO', NULL, NULL, '11568', 'B', NULL, 0.024, 0.224, 0.281, 0.057, 0.225, 0.047, 6),
(31, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - TAGUATINGA', NULL, NULL, '10936', 'B', NULL, 0.016, 0.205, 0.281, 0.062, 0.225, 0.035, 7),
(32, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - GUARÁ', NULL, NULL, '11657', 'B', NULL, 0.024, 0.187, 0.211, 0.072, 0.244, 0.062, 2),
(33, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - GAMA', NULL, NULL, '10863', 'B', NULL, 0.016, 0.169, 0.281, 0.065, 0.187, 0.047, 5),
(34, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - PLANALTINA', NULL, NULL, '6216021', 'B', NULL, 0.028, 0.215, 0.281, 0.056, 0.225, 0.047, 8),
(35, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - TAGUATINGA', NULL, NULL, '10626', 'B', NULL, 0.016, 0.215, 0.281, 0.051, 0.244, 0.035, 7),
(36, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SOBRADINHO', NULL, NULL, '2804387', 'B', NULL, 0.024, 0.187, 0.175, 0.066, 0.225, 0.062, 1),
(37, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - SÃO SEBASTIÃO', NULL, NULL, '3742873', 'B', NULL, 0.024, 0.224, 0.211, 0.069, 0.15, 0.051, 2),
(38, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - SAMAMBAIA', NULL, NULL, '9480587', 'B', NULL, 0.02, 0.178, 0.281, 0.069, 0.225, 0.047, 6),
(39, 'UNIDADE BÁSICA DE SAÚDE Nº 17 - CEILÂNDIA', NULL, NULL, '9509356', 'B', NULL, 0.032, 0.187, 0.211, 0.07, 0.244, 0.062, 4),
(40, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ASA NORTE', NULL, NULL, '10707', 'B', NULL, 0.016, 0.196, 0.281, 0.064, 0.225, 0.047, 5),
(41, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ASA SUL', NULL, NULL, '11150', 'B', NULL, 0.018, 0.224, 0.281, 0.057, 0.187, 0.051, 7),
(42, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ESTRUTURAL', NULL, NULL, '2779374', 'B', NULL, 0.024, 0.196, 0.281, 0.042, 0.244, 0.062, 9),
(43, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RIACHO FUNDO II', NULL, NULL, '5038669', 'B', NULL, 0.024, 0.196, 0.281, 0.069, 0.15, 0.062, 6),
(44, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SOBRADINHO ', NULL, NULL, '11223', 'B', NULL, 0.016, 0.187, 0.281, 0.052, 0.244, 0.062, 7),
(45, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RECANTO DAS EMAS', NULL, NULL, '11134', 'B', NULL, 0.016, 0.196, 0.281, 0.066, 0.225, 0.035, 8),
(46, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SOBRADINHO II', NULL, NULL, '7368895', 'B', NULL, 0.016, 0.187, 0.281, 0.064, 0.225, 0.062, 7),
(47, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - PARANOÁ', NULL, NULL, '9572511', 'B', NULL, 0.024, 0.215, 0.281, 0.071, 0.15, 0.039, 6),
(48, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - PLANALTINA', NULL, NULL, '6216013', 'B', NULL, 0.024, 0.215, 0.281, 0.057, 0.187, 0.035, 10),
(49, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SAMAMBAIA', NULL, NULL, '10685', 'B', NULL, 0.016, 0.187, 0.281, 0.078, 0.187, 0.047, 6),
(50, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - PLANALTINA', NULL, NULL, '5050359', 'B', NULL, 0.012, 0.187, 0.211, 0.086, 0.225, 0.047, 3),
(51, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - PLANALTINA', NULL, NULL, '2672235', 'B', NULL, 0.024, 0.187, 0.175, 0.078, 0.225, 0.062, 1),
(52, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - CEILÂNDIA', NULL, NULL, '11061', 'B', NULL, 0.016, 0.178, 0.281, 0.071, 0.187, 0.062, 5),
(53, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - PLANALTINA', NULL, NULL, '11576', 'B', NULL, 0.008, 0.187, 0.211, 0.066, 0.244, 0.062, 1),
(54, 'UNIDADE BÁSICA DE SAÚDE Nº 16 - CEILÂNDIA', NULL, NULL, '9475931', 'B', NULL, 0.024, 0.205, 0.211, 0.075, 0.225, 0.047, 4),
(55, 'UNIDADE BÁSICA DE SAÚDE Nº 17 - PLANALTINA', NULL, NULL, '3144666', 'B', NULL, 0.024, 0.187, 0.211, 0.057, 0.187, 0.062, 1),
(56, 'UNIDADE BÁSICA DE SAÚDE Nº 20 - PLANALTINA', NULL, NULL, '9768637', 'B', NULL, 0.012, 0.178, 0.281, 0.073, 0.187, 0.062, 4),
(57, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SOBRADINHO II', NULL, NULL, '11258', 'B', NULL, 0.004, 0.187, 0.281, 0.062, 0.225, 0.062, 5),
(58, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - ITAPOÃ', NULL, NULL, '9572481', 'B', NULL, 0.016, 0.178, 0.211, 0.075, 0.225, 0.047, 4),
(59, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SAMAMBAIA', NULL, NULL, '6921736', 'B', NULL, 0.032, 0.205, 0.211, 0.072, 0.244, 0.047, 4),
(60, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SAMAMBAIA', NULL, NULL, '7114397', 'B', NULL, 0.02, 0.187, 0.211, 0.078, 0.169, 0.062, 4),
(61, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - ÁGUAS CLARAS', NULL, NULL, '7108923', 'B', NULL, 0.024, 0.224, 0.281, 0.058, 0.15, 0.047, 6),
(62, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SAMAMBAIA', NULL, NULL, '10774', 'B', NULL, 0.028, 0.196, 0.281, 0.054, 0.15, 0.047, 7),
(63, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - JARDINS MANGUEIRAL', NULL, NULL, '736260', 'B', NULL, 0.024, 0.215, 0.211, 0.066, 0.187, 0.062, 4),
(64, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SÃO SEBASTIÃO', NULL, NULL, '10790', 'C', NULL, 0.024, 0.205, 0.211, 0.056, 0.225, 0.047, 10),
(65, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - FERCAL', NULL, NULL, '11517', 'C', NULL, 0.032, 0.187, 0.175, 0.049, 0.225, 0.023, 1),
(66, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - FERCAL', NULL, NULL, '161616', 'C', NULL, 0.032, 0.205, 0.175, 0.063, 0.169, 0.047, 1),
(67, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SOBRADINHO', NULL, NULL, '6770657', 'C', NULL, 0.024, 0.151, 0.211, 0.065, 0.187, 0.047, 1),
(68, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - CEILÂNDIA', NULL, NULL, '11029', 'C', NULL, 0.024, 0.215, 0.281, 0.061, 0.112, 0.047, 6),
(69, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - GAMA', NULL, NULL, '10871', 'C', NULL, 0.016, 0.196, 0.281, 0.077, 0.15, 0.023, 6),
(70, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - TAGUATINGA', NULL, NULL, '2617269', 'C', NULL, 0.024, 0.196, 0.211, 0.057, 0.187, 0.047, 5),
(71, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - GAMA', NULL, NULL, '2779404', 'C', NULL, 0.032, 0.187, 0.211, 0.068, 0.169, 0.047, 1),
(72, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PARANOÁ', NULL, NULL, '10634', 'C', NULL, 0.024, 0.205, 0.211, 0.062, 0.187, 0.035, 10),
(73, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PARK WAY', NULL, NULL, '11681', 'C', NULL, 0.032, 0.187, 0.14, 0.07, 0.187, 0.062, 1),
(74, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SANTA MARIA', NULL, NULL, '10782', 'C', NULL, 0.024, 0.196, 0.281, 0.055, 0.187, 0.035, 11),
(75, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SOBRADINHO', NULL, NULL, '11231', 'C', NULL, 0.016, 0.187, 0.281, 0.051, 0.206, 0.039, 8),
(76, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - CEILÂNDIA', NULL, NULL, '10995', 'C', NULL, 0.016, 0.16, 0.211, 0.062, 0.187, 0.035, 5),
(77, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - GAMA', NULL, NULL, '10855', 'C', NULL, 0.02, 0.16, 0.211, 0.056, 0.225, 0.047, 5),
(78, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - ASA NORTE', NULL, NULL, '5117666', 'C', NULL, 0.008, 0.187, 0.14, 0.064, 0.244, 0.051, 1),
(79, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - CEILÂNDIA', NULL, NULL, '11010', 'C', NULL, 0.016, 0.205, 0.211, 0.056, 0.15, 0.047, 6),
(80, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SÃO SEBASTIÃO', NULL, NULL, '11363', 'C', NULL, 0.024, 0.187, 0.14, 0.07, 0.187, 0.047, 2),
(81, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - TAGUATINGA', NULL, NULL, '10952', 'C', NULL, 0.016, 0.205, 0.281, 0.052, 0.187, 0.047, 9),
(82, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - RECANTO DAS EMAS', NULL, NULL, '2779331', 'C', NULL, 0.024, 0.187, 0.14, 0.075, 0.169, 0.047, 1),
(83, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - TAGUATINGA', NULL, NULL, '10960', 'C', NULL, 0.016, 0.178, 0.281, 0.063, 0.15, 0.062, 7),
(84, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - BRAZLÂNDIA', NULL, NULL, '9571280', 'C', NULL, 0.024, 0.151, 0.211, 0.068, 0.187, 0.035, 1),
(85, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - CEILÂNDIA', NULL, NULL, '11207', 'C', NULL, 0.024, 0.205, 0.281, 0.056, 0.15, 0.035, 5),
(86, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - PLANALTINA', NULL, NULL, '2804174', 'C', NULL, 0.024, 0.187, 0.14, 0.069, 0.225, 0.051, 1),
(87, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - SÃO SEBASTIÃO', NULL, NULL, '7423489', 'C', NULL, 0.024, 0.114, 0.211, 0.066, 0.15, 0.062, 1),
(88, 'UNIDADE BÁSICA DE SAÚDE Nº 14 - PLANALTINA', NULL, NULL, '11584', 'C', NULL, 0.008, 0.114, 0.211, 0.063, 0.206, 0.051, 1),
(89, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - GUARÁ', NULL, NULL, '11118', 'C', NULL, 0.016, 0.196, 0.281, 0.057, 0.131, 0.047, 7),
(90, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ESTRUTURAL', NULL, NULL, '3513564', 'C', NULL, 0.016, 0.205, 0.14, 0.069, 0.15, 0.035, 3),
(91, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - PLANALTINA', NULL, NULL, '10650', 'C', NULL, 0.028, 0.187, 0.14, 0.07, 0.225, 0.047, 4),
(92, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - SÃO SEBASTIÃO', NULL, NULL, '3254887', 'C', NULL, 0.024, 0.114, 0.211, 0.056, 0.187, 0.062, 2),
(93, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SÃO SEBASTIÃO', NULL, NULL, '3212068', 'C', NULL, 0.024, 0.187, 0.211, 0.075, 0.131, 0.047, 2),
(94, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SANTA MARIA', NULL, NULL, '3144593', 'C', NULL, 0.024, 0.178, 0.14, 0.079, 0.15, 0.062, 2),
(95, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - SOBRADINHO II', NULL, NULL, '7686730', 'C', NULL, 0.024, 0.224, 0.105, 0.066, 0.225, 0.047, 2),
(96, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SANTA MARIA', NULL, NULL, '3144607', 'C', NULL, 0.016, 0.105, 0.211, 0.071, 0.225, 0.047, 2),
(97, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SANTA MARIA', NULL, NULL, '3144569', 'C', NULL, 0.008, 0.105, 0.211, 0.064, 0.225, 0.051, 3),
(98, 'UNIDADE BÁSICA DE SAÚDE Nº 15 - PLANALTINA', NULL, NULL, '2672227', 'C', NULL, 0.008, 0.114, 0.211, 0.072, 0.187, 0.062, 1),
(99, 'UNIDADE BÁSICA DE SAÚDE Nº 16 - PLANALTINA', NULL, NULL, '11592', 'C', NULL, 0.008, 0.114, 0.211, 0.064, 0.187, 0.035, 1),
(100, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - SAMAMBAIA', NULL, NULL, '10642', 'C', NULL, 0.012, 0.169, 0.281, 0.051, 0.187, 0.035, 9),
(101, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - RIACHO FUNDO II', NULL, NULL, '7526504', 'C', NULL, 0.024, 0.196, 0.105, 0.071, 0.225, 0.047, 4),
(102, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - RECANTO DAS EMAS', NULL, NULL, '2804247', 'C', NULL, 0.016, 0.178, 0.14, 0.069, 0.187, 0.051, 2),
(103, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - RECANTO DAS EMAS', NULL, NULL, '7059892', 'C', NULL, 0.016, 0.16, 0.211, 0.062, 0.187, 0.051, 5),
(104, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SANTA MARIA', NULL, NULL, '2673894', 'C', NULL, 0.024, 0.151, 0.211, 0.072, 0.15, 0.062, 1),
(105, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SOBRADINHO II', NULL, NULL, '6770681', 'D', NULL, 0.032, 0.187, 0.105, 0.063, 0.169, 0.047, 1),
(106, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SOBRADINHO', NULL, NULL, '7687079', 'D', NULL, 0.032, 0.187, 0.175, 0.055, 0.112, 0.047, 1),
(107, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - PARANOÁ', NULL, NULL, '11614', 'D', NULL, 0.024, 0.187, 0.035, 0.076, 0.187, 0.051, 1),
(108, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - PARANOÁ', NULL, NULL, '7075596', 'D', NULL, 0.032, 0.151, 0.07, 0.08, 0.187, 0.035, 1),
(109, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RIACHO FUNDO I', NULL, NULL, '3781437', 'D', NULL, 0.016, 0.187, 0.14, 0.056, 0.131, 0.062, 3),
(110, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - SANTA MARIA', NULL, NULL, '3144550', 'D', NULL, 0.024, 0.151, 0.105, 0.079, 0.187, 0.062, 1),
(111, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SOBRADINHO II', NULL, NULL, '6770665', 'D', NULL, 0.032, 0.187, 0.105, 0.052, 0.15, 0.047, 1),
(112, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - BRAZLÂNDIA', NULL, NULL, '11509', 'D', NULL, 0.032, 0.187, 0.105, 0.075, 0.131, 0.062, 1),
(113, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - CEILÂNDIA', NULL, NULL, '2617293', 'D', NULL, 0.016, 0.178, 0.175, 0.052, 0.15, 0.062, 6),
(114, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - PLANALTINA', NULL, NULL, '2804123', 'D', NULL, 0.008, 0.114, 0.175, 0.055, 0.169, 0.062, 1),
(115, 'UNIDADE BÁSICA DE SAÚDE Nº 19 - PLANALTINA', NULL, NULL, '9566988', 'D', NULL, 0.008, 0.114, 0.175, 0.068, 0.169, 0.039, 1),
(116, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - CEILÂNDIA', NULL, NULL, '7347715', 'D', NULL, 0.016, 0.187, 0.105, 0.054, 0.187, 0.062, 4),
(117, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - PLANALTINA', NULL, NULL, '5167817', 'D', NULL, 0.016, 0.187, 0.14, 0.07, 0.15, 0.047, 3),
(118, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ITAPOÃ', NULL, NULL, '3286959', 'D', NULL, 0.016, 0.178, 0.105, 0.075, 0.112, 0.047, 2),
(119, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - PLANALTINA', NULL, NULL, '11096', 'D', NULL, 0.008, 0.151, 0.175, 0.059, 0.131, 0.051, 1),
(120, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SÃO SEBASTIÃO', NULL, NULL, '3212017', 'D', NULL, 0.024, 0.114, 0.14, 0.056, 0.15, 0.047, 1),
(121, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SÃO SEBASTIÃO', NULL, NULL, '3781402', 'D', NULL, 0.024, 0.114, 0.07, 0.058, 0.187, 0.062, 1),
(122, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - PARANOÁ', NULL, NULL, '11630', 'D', NULL, 0.032, 0.141, 0.07, 0.075, 0.187, 0.023, 1),
(123, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - CEILÂNDIA', NULL, NULL, '11053', 'D', NULL, 0.012, 0.16, 0.211, 0.045, 0.15, 0.062, 6),
(124, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SÃO SEBASTIÃO', NULL, NULL, '3286932', 'D', NULL, 0.024, 0.114, 0.14, 0.059, 0.187, 0.051, 1),
(125, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - GAMA', NULL, NULL, '3144577', 'D', NULL, 0.024, 0.187, 0.105, 0.062, 0.075, 0.062, 2),
(126, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - SÃO SEBASTIÃO', NULL, NULL, '3212025', 'D', NULL, 0.024, 0.114, 0.211, 0.068, 0.131, 0.062, 1),
(127, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - PLANALTINA', NULL, NULL, '11622', 'D', NULL, 0.024, 0.187, 0.14, 0.065, 0.15, 0.035, 1),
(128, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - RIACHO FUNDO II', NULL, NULL, '3410196', 'D', NULL, 0.024, 0.105, 0.105, 0.05, 0.225, 0.047, 2),
(129, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - SÃO SEBASTIÃO', NULL, NULL, '3212033', 'D', NULL, 0.024, 0.114, 0.14, 0.05, 0.169, 0.035, 1),
(130, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - GUARÁ', NULL, NULL, '9263632', 'D', NULL, 0.024, 0.114, 0.14, 0.064, 0.225, 0.039, 1),
(131, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SAMAMBAIA', NULL, NULL, '7053754', 'D', NULL, 0.02, 0.187, 0.035, 0.084, 0.15, 0.062, 4),
(132, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SANTA MARIA', NULL, NULL, '7559194', 'D', NULL, 0.016, 0.105, 0.105, 0.052, 0.187, 0.062, 2),
(133, 'UNIDADE BÁSICA DE SAÚDE Nº 08 - SÃO SEBASTIÃO', NULL, NULL, '7975295', 'D', NULL, 0.004, 0.114, 0.211, 0.063, 0.187, 0.023, 1),
(134, 'UNIDADE BÁSICA DE SAÚDE Nº 15 - CEILÂNDIA', NULL, NULL, '7347723', 'D', NULL, 0.012, 0.178, 0.14, 0.063, 0.187, 0.047, 5),
(135, 'UNIDADE BÁSICA DE SAÚDE Nº 19 - SÃO SEBASTIÃO', NULL, NULL, '3254909', 'D', NULL, 0.024, 0.078, 0.211, 0.045, 0.187, 0.062, 1),
(136, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - SOBRADINHO II', NULL, NULL, '957755', 'D', NULL, 0.016, 0.187, 0.14, 0.07, 0.094, 0.047, 4),
(137, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - PARANOÁ', NULL, NULL, '2804107', 'E', NULL, 0.032, 0.132, 0.07, 0.077, 0.15, 0.035, 1),
(138, 'UNIDADE BÁSICA DE SAÚDE Nº 12 - GAMA', NULL, NULL, '3144615', 'E', NULL, 0.024, 0.178, 0.035, 0.063, 0.15, 0.051, 2),
(139, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - PARANOÁ', NULL, NULL, '3286975', 'E', NULL, 0.024, 0.205, 0.07, 0.066, 0.056, 0.047, 2),
(140, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - BRAZLÂNDIA', NULL, NULL, '3144658', 'E', '1', 0.024, 0.151, 0.105, 0.07, 0.056, 0.035, 1),
(141, 'UNIDADE BÁSICA DE SAÚDE Nº 03 - RIACHO FUNDO II', NULL, NULL, '2660199', 'E', NULL, 0.02, 0.096, 0, 0.062, 0.15, 0.047, 4),
(142, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - BRAZLÂNDIA', NULL, NULL, '3742865', 'E', NULL, 0.008, 0.119, 0.105, 0.047, 0.094, 0.035, 1),
(143, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - PARANOÁ', NULL, NULL, '11606', 'E', NULL, 0.024, 0.114, 0.14, 0.068, 0.075, 0.023, 1),
(144, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - RIACHO FUNDO II', NULL, NULL, '2673924', 'E', NULL, 0.032, 0.187, 0.07, 0.061, 0.094, 0.062, 1),
(145, 'UNIDADE BÁSICA DE SAÚDE Nº 05 - BRAZLÂNDIA', NULL, NULL, '3144631', 'E', NULL, 0.024, 0.16, 0.105, 0.047, 0.112, 0.035, 1),
(146, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - BRAZLÂNDIA', NULL, NULL, '11495', 'E', NULL, 0.004, 0.114, 0.105, 0.055, 0.094, 0.035, 1),
(147, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - SOBRADINHO II', NULL, NULL, '7041594', 'E', NULL, 0.024, 0.114, 0.105, 0.048, 0.075, 0.047, 1),
(148, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - PLANALTINA', NULL, NULL, '2360233', 'E', NULL, 0.024, 0.105, 0.105, 0.047, 0.112, 0.023, 3),
(149, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - BRAZLÂNDIA', NULL, NULL, '9548203', 'E', NULL, 0.024, 0.078, 0.105, 0.059, 0.112, 0.035, 1),
(150, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - CEILÂNDIA', NULL, NULL, '3144542', 'E', NULL, 0.024, 0.114, 0.07, 0.054, 0.187, 0.062, 2),
(151, 'UNIDADE BÁSICA DE SAÚDE Nº 14 - CEILÂNDIA', NULL, NULL, '3677044', 'E', NULL, 0.024, 0.187, 0.035, 0.076, 0.112, 0.062, 2),
(152, 'UNIDADE BÁSICA DE SAÚDE Nº 18 - PLANALTINA', NULL, NULL, '9566961', 'E', NULL, 0.008, 0.114, 0.07, 0.052, 0.094, 0.062, 1),
(153, 'UNIDADE BÁSICA DE SAÚDE Nº 01 - RECANTO DAS EMAS', NULL, NULL, '10804', 'E', NULL, 0.024, 0.16, 0, 0.072, 0.15, 0.047, 3),
(154, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - NÚCLEO BANDEIRANTE', NULL, NULL, '7236778', 'E', NULL, 0.024, 0.187, 0, 0.035, 0.112, 0.047, 2),
(155, 'UNIDADE BÁSICA DE SAÚDE Nº 04 - CEILÂNDIA', NULL, NULL, '11002', 'E', NULL, 0.016, 0.169, 0.035, 0.066, 0.112, 0.047, 2),
(156, 'UNIDADE BÁSICA DE SAÚDE Nº 06 - PLANALTINA', NULL, NULL, '5050340', 'E', NULL, 0.024, 0.114, 0, 0.045, 0.15, 0.035, 3),
(157, 'UNIDADE BÁSICA DE SAÚDE Nº 07 - GAMA', NULL, NULL, '10898', 'E', NULL, 0.024, 0.096, 0.07, 0.036, 0.169, 0.062, 3),
(158, 'UNIDADE BÁSICA DE SAÚDE Nº 09 - SAMAMBAIA', NULL, NULL, '3742857', 'E', NULL, 0.024, 0.114, 0, 0.059, 0.112, 0.062, 2),
(159, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - RECANTO DAS EMAS', NULL, NULL, '3144623', 'E', NULL, 0.016, 0.105, 0, 0.058, 0.112, 0.035, 2),
(160, 'UNIDADE BÁSICA DE SAÚDE Nº 10 - SAMAMBAIA', NULL, NULL, '3633845', 'E', NULL, 0.024, 0.114, 0, 0.061, 0.094, 0.047, 2),
(161, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - RECANTO DAS EMAS', NULL, NULL, '9543945', 'E', NULL, 0.004, 0.114, 0, 0.037, 0.037, 0.023, 2),
(162, 'UNIDADE BÁSICA DE SAÚDE Nº 18 - CEILÂNDIA', NULL, NULL, '9643338', 'E', NULL, 0.024, 0.114, 0, 0.047, 0.112, 0.062, 1),
(163, 'UNIDADE BÁSICA DE SAÚDE Nº 02 - ÁGUAS CLARAS', NULL, NULL, '3742822', 'E', NULL, 0.032, 0.187, 0, 0.066, 0.056, 0.062, 1),
(164, 'UNIDADE BÁSICA DE SAÚDE Nº 11 - SAMAMBAIA', NULL, NULL, '7771479', 'E', NULL, 0.032, 0.205, 0.07, 0.076, 0.075, 0.047, 4),
(165, 'UNIDADE BÁSICA DE SAÚDE Nº 13 - SAMAMBAIA', NULL, NULL, '9647597', 'E', NULL, 0.004, 0.105, 0, 0.04, 0.075, 0.023, 3);

INSERT INTO "public"."usuarios" ("id", "nome", "email", "matricula", "cpf", "password", "remember_me_token", "created_at", "updated_at") VALUES
(1, 'Usuário Teste 1', 'teste@teste.com', NULL, '00597099103', '$scrypt$n=16384,r=8,p=1$y+brEt7AC6y1EbChMPIRjQ$Y/KVkSbkluSULMpQh7a+Imh4oIRN6yPL1BWVdwjaQhVsv8P6bYLGzNdWPbH1QPrWdlwzwhEKahtF57gi+Kf/Aw', NULL, '2024-03-31 22:45:07.061+00', '2024-03-31 22:45:07.062+00'),
(5, 'Usuário Teste 2', 'teste1@teste.com', NULL, '00597099104', '$scrypt$n=16384,r=8,p=1$wBj8NenyKcVnVNRfsBXo9w$If8qnXeYvQ8s9d27iSsFI01G8stkKVJGl7DvxrNkcTAKdF5XOsTaTxlhkZY3PvhLKp9VQlhoimymCc5MLuy8+Q', NULL, '2024-03-31 23:09:46.388+00', '2024-03-31 23:09:46.388+00');

ALTER TABLE "public"."api_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "public"."usuarios"("id") ON DELETE CASCADE;
ALTER TABLE "public"."usuarios_roles" ADD FOREIGN KEY ("role") REFERENCES "public"."roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."usuarios_roles" ADD FOREIGN KEY ("usuario") REFERENCES "public"."usuarios"("id") ON DELETE CASCADE;
