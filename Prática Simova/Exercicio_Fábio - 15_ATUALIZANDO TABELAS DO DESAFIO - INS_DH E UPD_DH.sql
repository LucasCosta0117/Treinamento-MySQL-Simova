/*  Alterações conforme indicação colocada por Camila no Whatsapp */

USE exerciciofabio;

DESC funcionario;

-- Registra a última atualização feita em um funcionario
ALTER TABLE funcionario
CHANGE ins_dh upd_dh TIMESTAMP DEFAULT NOW();

-- Registra a inserção de um log após alterações em funcionario
ALTER TABLE log_funcionario
CHANGE upd_dh ins_dh TIMESTAMP;