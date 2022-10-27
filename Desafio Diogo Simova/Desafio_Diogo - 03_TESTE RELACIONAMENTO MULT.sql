/* TESTE DE POVOAMENTO DA TABELA */

-- Testar o relacionamento funcao > funcionario > apontamento
SELECT * FROM funcao;
SELECT * FROM funcionario;
SELECT * FROM apontamento;

INSERT INTO funcao (descricao, flag_supervisor) 
VALUES 	('Analista de Sistema', false); -- Função comum

INSERT INTO funcao (descricao, flag_supervisor) 
VALUES 	('Técnico de Campo', false), -- Função comum
		('Analista de Sistema', true), -- Função comum
		('Diretor', true); -- Função Supervisor
        
INSERT INTO funcionario (nome, funcao_seq_db) 
VALUES 	('Lucas', 1), -- Função comum
		('Diogo', 2), -- Função Supervisor    
		('Fabio', 2), -- Função Supervisor    
        ('Carlos', 3); -- Função comum
        
INSERT INTO apontamento (funcionario_seq_db, supervisor_seq_db) 
VALUES 	(1, 2); -- 1 Funcionário (Lucas) e 1 Supervisor (Diogo)

INSERT INTO apontamento (funcionario_seq_db, supervisor_seq_db) 
VALUES 	(2, 1); -- 1 Funcionário (Diogo) e 1 Funcionário (Lucas)

-- Testando o SELECT com JOIN para verificar os relacionamentos
-- 01. Quem é o supervisor do apontamento 1?
SELECT func.nome FROM apontamento ap
INNER JOIN funcionario func
ON ap.supervisor_seq_db = func.seq_db
INNER JOIN funcao fc
ON func.funcao_seq_db = fc.seq_db
WHERE ap.seq_db = 1
AND fc.flag_supervisor = 1;

-- 02. Quem é o funcionario do apontamento 1?
SELECT func.nome FROM apontamento ap
INNER JOIN funcionario func
ON ap.funcionario_seq_db = func.seq_db
INNER JOIN funcao fc
ON func.funcao_seq_db = fc.seq_db
WHERE ap.seq_db = 1
AND fc.flag_supervisor = 0;

/* RESET DOS DADOS */
TRUNCATE funcao;
ALTER TABLE funcao AUTO_INCREMENT = 0;

TRUNCATE funcionario;
ALTER TABLE funcionario AUTO_INCREMENT = 0;

TRUNCATE apontamento;
ALTER TABLE apontamento AUTO_INCREMENT = 0;