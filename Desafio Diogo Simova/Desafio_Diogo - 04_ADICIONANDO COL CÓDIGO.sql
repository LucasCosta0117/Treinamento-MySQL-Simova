USE desafiodiogo;

ALTER TABLE fabricante
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE modelo
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE grupo_atividade
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE funcao
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE equipamento
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE atividade
ADD COLUMN codigo VARCHAR(20) AFTER seq_db;

ALTER TABLE funcionario
ADD COLUMN cracha VARCHAR(20) AFTER seq_db;