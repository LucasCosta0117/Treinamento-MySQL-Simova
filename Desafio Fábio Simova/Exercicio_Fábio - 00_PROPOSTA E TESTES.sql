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

SELECT DISTINCT COUNT(*), cargo_seq_db FROM funcionario;

SELECT COUNT(*) `qtd cargos`, cargo_seq_db FROM funcionario
GROUP BY cargo_seq_db;

SELECT * FROM funcionario HAVING cargo_seq_db < AVG(cargo_seq_db);

SELECT AVG(cargo_seq_db) FROM funcionario;

SELECT * FROM funcionario WHERE EXISTS (select * FROM funcionario WHERE cargo_seq_db = 4)
AND cargo_seq_db != 4;

SELECT * FROM funcionario WHERE seq_db < ANY /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- O PRIMEIRO SELECT BUSCA 'SEQ_DB' MENOR QUE OS RESULTADOS DO SUBSELECT
SELECT * FROM funcionario WHERE seq_db IN /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- MESMO QUE '= ANY'
SELECT * FROM funcionario WHERE seq_db < SOME /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- MESMO QUE '< ANY'
SELECT * FROM funcionario WHERE seq_db < ALL /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- IGNORA O RESULTATO '3', POIS PRECISA ATENDER A CONDIÇÕES PARA TODOS OS RESULTADOS

SELECT seq_db FROM cargo WHERE seq_db > 2; -- <=== ISSO É O PARÉNTESES DO PRIMEIRO 'ANY' ACIMA ^^^ = Resposta disso é '3' e '4';


SELECT * FROM funcionario WHERE (seq_db = 3 OR seq_db = 4);


