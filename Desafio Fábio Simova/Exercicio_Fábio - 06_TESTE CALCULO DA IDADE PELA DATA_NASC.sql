SELECT * FROM funcionario WHERE seq_db <= 10;

SELECT nome, DATE_FORMAT( NOW() - data_nasc, "%y" ) as idade FROM funcionario WHERE seq_db <= 10; -- NÃO DÁ ERRO, MAS NÃO RETORNA CORRETO

SELECT nome, TIMESTAMPDIFF(YEAR, data_nasc, NOW()) as idade FROM funcionario WHERE seq_db <= 10; -- Funcionando com NOW()

SELECT nome, TIMESTAMPDIFF(YEAR, data_nasc, CURDATE()) as idade FROM funcionario WHERE seq_db <= 10; -- Funcionando com CURDATE()

SELECT nome, DATE_FORMAT(DATEDIFF(data_nasc, CURDATE()), "%Y") as idade FROM funcionario WHERE seq_db <= 10; -- NÃO DÁ ERRO, MAS RETORNA 'NULL'