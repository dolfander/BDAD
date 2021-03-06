--
-- File generated with SQLiteStudio v3.1.1 on qua mar 29 16:34:32 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ARMAS
CREATE TABLE ARMAS (IDARMA INTEGER PRIMARY KEY, CLASSE STRING, PESO DOUBLE, NOME STRING, CALIBRE DOUBLE);

-- Table: BASE
CREATE TABLE BASE ("NOME " VARCHAR, AREA INTEGER, CAPACIDADEMAX INTEGER, VERTENTE VARCHAR REFERENCES RAMOFORCASARMADAS (VERTENTE), LOCAL VARCHAR, PRIMARY KEY ("NOME ", LOCAL));

-- Table: FORNECEDOR
CREATE TABLE FORNECEDOR (NOMEMPRESA STRING PRIMARY KEY, CONTACTO INTEGER, LOCALIZACAOSEDE STRING);

-- Table: FUNCAO
CREATE TABLE FUNCAO (FUNCAO VARCHAR PRIMARY KEY, HORASTRABALHO INTEGER);

-- Table: INSCRITOSEMMISSAO
CREATE TABLE INSCRITOSEMMISSAO (IDMISSAO REFERENCES MISSOES (IDMISSAO), NIDENTIFICACAOCIVIL INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL));

-- Table: MILITAR
CREATE TABLE MILITAR (NIDENTIFICACAOCIVIL INTEGER PRIMARY KEY REFERENCES PESSOA (NIDENTIFICACAOCIVIL), HIERARQUIA VARCHAR, FUNCAO VARCHAR, SALARIO DOUBLE);

-- Table: MILITARALOCADO
CREATE TABLE MILITARALOCADO (IDMISSAO INTEGER REFERENCES MISSOES (IDMISSAO), NIDENTIFICACAOCIVIL INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL), IDENTIFICADORPESSOAL INTEGER, PRIMARY KEY (IDMISSAO, NIDENTIFICACAOCIVIL));

-- Table: MISSOES
CREATE TABLE MISSOES (IDMISSAO INTEGER PRIMARY KEY, LOCAL VARCHAR, DATAINICIAL DATE, DATAFINAL VARCHAR, TIPO);

-- Table: PESSOA
CREATE TABLE PESSOA (NIDENTIFICACAOCIVIL INTEGER PRIMARY KEY, NOME VARCHAR, DATANASCIMENTO DATE, GENERO CHAR, ALTURA DOUBLE);

-- Table: QUANTIDADADEARMA
CREATE TABLE QUANTIDADADEARMA (IDARMA INTEGER REFERENCES ARMAS (IDARMA), IDMISSAO INTEGER REFERENCES ARMAS (IDARMA), NUMERO INTEGER, PRIMARY KEY (IDARMA, IDMISSAO));

-- Table: QUANTIDADEVEICULO
CREATE TABLE QUANTIDADEVEICULO (IDVEICULO INTEGER, IDMISSAO INTEGER, NUMERO, PRIMARY KEY (IDVEICULO, IDMISSAO));

-- Table: RAMOFORCASARMADAS
CREATE TABLE RAMOFORCASARMADAS (VERTENTE STRING PRIMARY KEY, LEMA STRING, MARCHA STRING, PATRONO STRING, GENERAL STRING);

-- Table: RELACAOMILITAR
CREATE TABLE RELACAOMILITAR (SOLDADO INTEGER PRIMARY KEY REFERENCES MILITAR (NIDENTIFICACAOCIVIL), SUPERIOR INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL));

-- Table: STOCKARMAS
CREATE TABLE STOCKARMAS (NUMERO INTEGER, IDARMA INTEGER REFERENCES ARMAS (IDARMA), NOMEBASE STRING REFERENCES BASE ("NOME "), LOCALBASE VARCHAR REFERENCES BASE (LOCAL), PRIMARY KEY (IDARMA, NOMEBASE, LOCALBASE));

-- Table: STOCKVEICULOS
CREATE TABLE STOCKVEICULOS (IDVEICULO INTEGER REFERENCES VEICULO (IDVEICULO), LOCAL VARCHAR REFERENCES BASE ("NOME "));

-- Table: TIPOVEICULO
CREATE TABLE TIPOVEICULO (TIPO VARCHAR PRIMARY KEY);

-- Table: VEICULO
CREATE TABLE VEICULO (IDVEICULO VARCHAR PRIMARY KEY, COMPRIMENTO DOUBLE, LARGURA DOUBLE, ALTURA DOUBLE, MOTOR VARCHAR, VELOCIDADEMAX DOUBLE, TIPO STRING REFERENCES TIPOVEICULO (TIPO), FORNECEDOR VARCHAR REFERENCES FORNECEDOR (NOMEMPRESA));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
