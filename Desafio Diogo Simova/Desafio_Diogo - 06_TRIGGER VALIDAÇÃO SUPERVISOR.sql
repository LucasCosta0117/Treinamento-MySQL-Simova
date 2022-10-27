/* TRIGGER VERIFICA SE O SEQ_DB DO FUNCIONARIO QUE ESTÁ SENDO INSERIDO NO APONTAMENTO
POSSUI DE FATO UM CARGO QUE TEM O STATUS DE SUPERVISOR  */

DELIMITER $
CREATE TRIGGER bi_apontamento_supervisor
BEFORE INSERT ON apontamento
FOR EACH ROW
BEGIN
	IF (
		SELECT fc.flag_supervisor FROM funcionario f 
        INNER JOIN funcao fc 
        ON f.funcao_seq_db = fc.seq_db 
        WHERE f.seq_db = new.supervisor_seq_db
	) = 1 -- Testando se a função do funcionario escolhido no INSERT possue TRUE na flag_supervisor
	THEN
		SET NEW.supervisor_seq_db = NEW.supervisor_seq_db; -- Sendo TRUE, permite então a inserção do funcionario no apontamento
	ELSE 
		SET NEW.supervisor_seq_db = 0; -- Sendo FALSE, seta no apontamento um supervisor_seq_db que não existe, não efetuando o INSERT
	END IF;
END;
$

/* REPETINDO A TRIGGER PARA PROTEGER CONTRA UPDATE's DE FUNCIONÁRIOS NÃO SUPERVISORES */
DELIMITER $
CREATE TRIGGER bu_apontamento_supervisor
BEFORE UPDATE ON apontamento
FOR EACH ROW
BEGIN
	IF (
		SELECT fc.flag_supervisor FROM funcionario f 
        INNER JOIN funcao fc 
        ON f.funcao_seq_db = fc.seq_db 
        WHERE f.seq_db = new.supervisor_seq_db
	) = 1
	THEN
		SET NEW.supervisor_seq_db = NEW.supervisor_seq_db;
	ELSE 
		SET NEW.supervisor_seq_db = 0;
	END IF;
END;
$

DROP TRIGGER bi_apontamento_supervisor; $
DROP TRIGGER bu_apontamento_supervisor; $