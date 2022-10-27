/* CRIANDO O RELACIONAMENTO ENTRE AS TABELAS */
USE desafiodiogo;

-- Alterando tabelas para criação das FOREIGN KEYs
ALTER TABLE equipamento
ADD CONSTRAINT `fk_fabricante_equipamento` FOREIGN KEY (fabricante_seq_db) REFERENCES fabricante(seq_db);

ALTER TABLE equipamento
ADD CONSTRAINT `fk_modelo_equipamento` FOREIGN KEY (modelo_seq_db) REFERENCES modelo(seq_db);

ALTER TABLE atividade
ADD CONSTRAINT `fk_grupo_atividade_atividade` FOREIGN KEY (grupo_atividade_seq_db) REFERENCES grupo_atividade(seq_db);

ALTER TABLE funcionario
ADD CONSTRAINT `fk_funcao_funcionario` FOREIGN KEY (funcao_seq_db) REFERENCES funcao(seq_db);

ALTER TABLE apontamento
ADD CONSTRAINT `fk_equipamento_apontamento` FOREIGN KEY (equipamento_seq_db) REFERENCES equipamento(seq_db);

ALTER TABLE apontamento
ADD CONSTRAINT `fk_atividade_apontamento` FOREIGN KEY (atividade_seq_db) REFERENCES atividade(seq_db);

ALTER TABLE apontamento
ADD CONSTRAINT `fk_grupo_atividade_apontamento` FOREIGN KEY (grupo_atividade_seq_db) REFERENCES grupo_atividade(seq_db);

ALTER TABLE apontamento
ADD CONSTRAINT `fk_funcionario_apontamento` FOREIGN KEY (funcionario_seq_db) REFERENCES funcionario(seq_db);

ALTER TABLE apontamento
ADD CONSTRAINT `fk_supervisor_apontamento` FOREIGN KEY (supervisor_seq_db) REFERENCES funcionario(seq_db);

-- Em caso de necessidade de refazer alguma FOREIGN KEY
ALTER TABLE atividade
DROP FOREIGN KEY `fk_grupo_atividade_equipamento`;


