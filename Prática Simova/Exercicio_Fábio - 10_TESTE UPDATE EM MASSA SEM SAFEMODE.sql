/* TESTE 01 - NUMÉRICO, APLICAÇÃO MANUAL - FUNCIONOU! */
SELECT MAX(seq_db)  FROM funcionario; -- Buscando o seq_db Máximo, apenas como consulta.
UPDATE funcionario f
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW()) 
WHERE seq_db <= 10000; -- 10000 é o meu seq_db máximo

/* TESTE 02 - SUBSELECT - NÃO FUNCIONOU, SAFE MODE SOLICITADO */
UPDATE funcionario f
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW()) 
WHERE seq_db <= (SELECT MAX(seq_db)  FROM funcionario);

/* TESTE 03 - VAR TEMPORÁRIA - FUNCIONOU!*/
SELECT MAX(seq_db) INTO @Max_Seq_db FROM funcionario;
UPDATE funcionario f
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW()) 
WHERE seq_db <= @Max_Seq_db;

SELECT * FROM funcionario;