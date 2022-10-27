USE exerciciofabio;

/*DESAFIO GROUP BY E COUNT */

-- Salvando dados da tabela original
CREATE TABLE funcionario_origin AS SELECT * FROM funcionario;

-- Limpando dados da tabela funcionario
TRUNCATE funcionario;
SELECT * FROM funcionario;

-- Alterando estrutura da tabela para se adaptar ao desafio
ALTER TABLE funcionario
DROP FOREIGN KEY fk_funcionario_cargo_tipo;

ALTER TABLE funcionario
DROP COLUMN cargo_tipo_seq_db;

ALTER TABLE funcionario
ADD COLUMN cod_funcionario BIGINT UNSIGNED AFTER seq_db;

-- Resetando o seq_db e adicionando condição de incremento para iniciar em 55555;
DESC funcionario;

ALTER TABLE funcionario
AUTO_INCREMENT = 55555;

-- Tester rápido
INSERT INTO funcionario (cod_funcionario, nome, data_nasc, cargo_desc) VALUES (10000, 'funcionario10000', '2002-02-07', 'Programador');
INSERT INTO funcionario (cod_funcionario, nome, data_nasc, cargo_desc) VALUES (10001, 'funcionario10000', '2002-02-07', 'Programador');
INSERT INTO funcionario (cod_funcionario, nome, data_nasc, cargo_desc) VALUES (20000, 'funcionario10000', '2002-02-07', NULL);

SELECT * FROM funcionario; -- Okay, deu certo

TRUNCATE funcionario; -- Apagando os registros de teste

-- OBS: PERCEBI QUE APÓS O TRUNCATE O AUTO_INCREMENTE VOLTA PARA O PADRÃO 1
ALTER TABLE funcionario
AUTO_INCREMENT = 55555;

-- Inserindo todos os 9900 registros, usei outro script feito pelo EXCEL

-- Teste 01: Agrupando os registros de funcionarios que possuem cargo
SELECT c.nome 'Nome do Cargo', COUNT(f.seq_db) 'Qtd de Funcionários' FROM funcionario f
INNER JOIN cargo c 
ON f.cargo_seq_db = c.seq_db
GROUP BY c.nome
ORDER BY COUNT(*) DESC;

-- Teste 02: Agrupando os registros de funcionarios que não possuem cargo
SELECT c.nome 'Nome do Cargo', COUNT(*) 'Qtd de Funcionários' FROM funcionario f
LEFT JOIN cargo c 
ON f.cargo_seq_db = c.seq_db
GROUP BY c.nome
ORDER BY COUNT(*) DESC;

-- Teste 03: Agrupando os registros de funcionarios que possuem ou não cargo
SELECT c.nome 'Nome do Cargo', COUNT(f.seq_db) 'Qtd de Funcionários' FROM funcionario f
RIGHT JOIN cargo c 
ON f.cargo_seq_db = c.seq_db
GROUP BY c.nome
ORDER BY COUNT(*) DESC;

-- Teste 04: ??
SELECT c.nome 'Nome do Cargo', COUNT(f.seq_db) 'Qtd de Funcionários' FROM funcionario f
CROSS JOIN cargo c 
ON f.cargo_seq_db = c.seq_db
GROUP BY c.nome
ORDER BY COUNT(*) DESC;