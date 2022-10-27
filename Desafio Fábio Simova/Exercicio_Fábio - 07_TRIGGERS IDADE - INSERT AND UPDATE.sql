-- Calcular e preencher a idade após inserir um novo funcionario
DELIMITER $
CREATE TRIGGER bi_new_funcionario
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
	SET NEW.idade =  TIMESTAMPDIFF(YEAR, NEW.data_nasc,NOW());
END $

-- Atualizar a idade após atualizar a data_nasc do funcioanrio
DELIMITER $
CREATE TRIGGER bu_funcionario
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
	SET NEW.idade =  TIMESTAMPDIFF(YEAR, NEW.data_nasc,NOW());
END $

SHOW TRIGGERS;