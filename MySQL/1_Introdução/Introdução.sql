-- CRIA UM BANCO DE DADOS
-- CREATE DATABASE teste;

-- REMOVER UM BANCO DE DADOS
-- DROP DATABASE teste;

 -- CREATE DATABASE meuBanco;
 
 -- USE meuBanco;
 
 -- CRIAR = CREATE
 -- DELETAR = DROP
 
 -- CRIAR
 
--  CREATE TABLE minhaTabela (
-- 	nome VARCHAR(100)
--  );
 
 -- REMOVER
 
 -- DROP TABLE minhaTabela
 
 
 -- TIPOS DE DADOS
 --  text = TEXT, VARCHAR(X) MAIS UTILIZADO
 -- numero = INT(X, BIGINT< SMALLINT
 -- datas = DATE(DIA/MES/ANO)
 
 
--  CREATE TABLE pessoas(
--  nome VARCHAR(100),
--  salario INT,
--  data_nascimento DATE
--  );
 
 -- ALTERAR UMA TABELA
 -- ALTER
 
 -- ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(255);
 
 -- CRUD
 
--  C = Create = INSERT
--  R = Read = SELECT (WHERE)
--  U = Update = UPTADE -- sempre utilize where
--  D = Delete = DELETE -- sempre utilize where

-- INSERT INTO pessoas (nome, salario, data_nascimento, profissao)
-- VALUES('João', 3000, '2002-04-12', 'Programador');

-- INSERT INTO pessoas (nome, salario, data_nascimento, profissao)
-- VALUES('Maria', 4500, '1970-02-10', 'Contadora');

-- INSERT INTO pessoas (nome, salario, data_nascimento, profissao)
-- VALUES('Manuel', 1500, '2000-04-15', 'Estagiario');

-- SELECT * FROM pessoas
-- WHERE salario > 4000;

-- SELECT * FROM pessoas
-- WHERE nome = 'João';

-- INSERT INTO pessoas (nome, salario, data_nascimento, profissao)
-- VALUES("Maria", 2500, "1996-05-11", "Secretária");

 -- SET SQL_SAFE_UPDATES = 0;

-- UPDATE pessoas SET salario = 3000 WHERE nome = "Maria";

-- SELECT * FROM  pessoas;

-- DELETE FROM pessoas WHERE nome = 'Manuel';
-- DELETE FROM pessoas;

-- DROP TABLE pessoas;

-- CREATE TABLE pessoas (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
--      nome VARCHAR(100),
--      salario INT,
--      data_nascimento DATE
-- )

-- ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(100);

-- INSERT INTO pessoas (nome, salario, data_nascimento, profissao)
-- VALUES('Roberta', 6500, "1985-11-12", "Professora");

--

