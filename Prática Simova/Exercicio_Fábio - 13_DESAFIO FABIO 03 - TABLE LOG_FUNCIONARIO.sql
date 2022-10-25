USE exerciciofabio;

/*DESAFIO DE LOG TABLE */

-- Obtendo parâmetros antigos para compatibilizar as tabelas
DESC funcionario;

-- Criando a nova tabela para LOG's
CREATE TABLE log_funcionario (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
	funcionario_seq_db BIGINT UNSIGNED,
    cod_funcionario_old BIGINT UNSIGNED,
    nome_old VARCHAR(40),
    data_nasc_old DATE,
    cargo_seq_db_old BIGINT UNSIGNED,
    ins_dh DATETIME,
    status_alt ENUM('UPD', 'DEL'),
    
	PRIMARY KEY (seq_db)
) ENGINE InnoDB, CHARSET utf8;

DESC log_funcionario;
SELECT * FROM log_funcionario;

-- Criando as triggers em funcionario para popular log_funcionario

-- Trigger para registro de UPDATES no log_funcionario
DELIMITER $
CREATE TRIGGER bu_funcionario_log_funcionario
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
	INSERT INTO log_funcionario (funcionario_seq_db, cod_funcionario_old, nome_old, data_nasc_old, cargo_seq_db_old, ins_dh,status_alt)
    VALUES (old.seq_db, old.cod_funcionario, old.nome, old.data_nasc, old.cargo_seq_db, NOW(), 'UPD');
END;
$

-- Trigger para registro de DELETES no log_funcionario
DELIMITER $
CREATE TRIGGER bd_funcionario_log_funcionario
BEFORE DELETE ON funcionario
FOR EACH ROW
BEGIN
    INSERT INTO log_funcionario (funcionario_seq_db, cod_funcionario_old, nome_old, data_nasc_old, cargo_seq_db_old, ins_dh,status_alt)
    VALUES (old.seq_db, old.cod_funcionario, old.nome, old.data_nasc, old.cargo_seq_db, NOW(), 'DEL');
END;
$

-- Trigger para atualizar os UPDATES em funcionario
DELIMITER $
CREATE TRIGGER bu_funcionario_updates
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
    SET NEW.upd_dh = NOW();
END;
$

SHOW TRIGGERS;

/* ANOTAÇÃO:
In an INSERT trigger, only NEW.col_name can be used; there is no old row.
In a DELETE trigger, only OLD.col_name can be used; there is no new row.
In an UPDATE trigger, you can use OLD.col_name to refer to the columns of a row before it is updated 
and NEW.col_name to refer to the columns of the row after it is updated.
*/