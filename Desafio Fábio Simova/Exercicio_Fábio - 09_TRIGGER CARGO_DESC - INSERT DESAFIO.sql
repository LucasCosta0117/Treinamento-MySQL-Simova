USE exerciciofabio;

SHOW TRIGGERS;

DROP TRIGGER bi_funcionario_desafio;

DESC funcionario;
DESC cargo;
SELECT * FROM cargo;
SELECT * FROM funcionario;
SELECT * FROM funcionario WHERE seq_db > 10000;

-- ALTERAÇÃO NA TABELA PARA EXECUTAR O DESAFIO
ALTER TABLE funcionario 
ADD COLUMN cargo_desc VARCHAR(20) AFTER cargo_seq_db;

-- RESETANDO OS DADOS DE TESTE
DELETE FROM funcionario WHERE seq_db > 10000;

-- TESTANDO A INSERÇÃO DE DADOS
INSERT INTO funcionario (seq_db, nome, data_nasc, cargo_desc) VALUES (10001, 'funcionario10001', '2002-02-07', 'tecnico');
INSERT INTO funcionario (seq_db, nome, data_nasc, cargo_desc) VALUES (10002, 'funcionario10001', '2002-02-07', 'técnico');

-- CRIANDO AS TRIGGERS
-- TIPO 01 = FUNCIONA 
DELIMITER $
CREATE TRIGGER bi_funcionario_desafio2
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
	SET NEW.cargo_seq_db = (SELECT seq_db FROM cargo WHERE nome = NEW.cargo_desc);
END $

-- TIPO 02 = FUNCIONA 
DELIMITER $
CREATE TRIGGER bi_funcionario_desafio
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
	SELECT seq_db INTO @seq_db_bigint FROM cargo WHERE nome = NEW.cargo_desc;
    	SET NEW.cargo_seq_db = @seq_db_bigint;
END $