CREATE DATABASE exerciciofabio;

USE exerciciofabio;

CREATE TABLE IF NOT EXISTS funcionario (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(40),
    data_nasc DATE,
    idade INT (3),
    cargo_seq_db BIGINT UNSIGNED,
    cargo_tipo_seq_db BIGINT UNSIGNED,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB, CHARSET utf8;

CREATE TABLE IF NOT EXISTS cargo (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(40),

    PRIMARY KEY (seq_db)
) ENGINE InnoDB, CHARSET utf8;

CREATE TABLE IF NOT EXISTS cargo_tipo (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(40),

    PRIMARY KEY (seq_db)
) ENGINE InnoDB, CHARSET utf8;

ALTER TABLE funcionario 
ADD CONSTRAINT `fk_funcionario_cargo` FOREIGN KEY (cargo_seq_db) REFERENCES cargo (seq_db);

ALTER TABLE funcionario 
ADD CONSTRAINT `fk_funcionario_cargo_tipo` FOREIGN KEY (cargo_tipo_seq_db) REFERENCES cargo_tipo (seq_db);

INSERT INTO cargo (nome) VALUES 
('Programador'),
('Administrador'),
('Assistente'),
('Diretor');

INSERT INTO cargo_tipo (nome) VALUES 
('CLT'),
('Estágio'),
('PJ');


INSERT INTO funcionario (nome, data_nasc, cargo_seq_db, cargo_tipo_seq_db) VALUES
('Lucas Costa', '1995-01-17', 1, 2);

DESC cargo;
DESC cargo_tipo;
DESC funcionario;

SELECT * FROM cargo;
SELECT * FROM cargo_tipo;
SELECT * FROM funcionario;

SELECT COUNT(*) FROM funcionario;

SELECT * FROM funcionario;

UPDATE funcionario
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW())
WHERE idade IS null;

