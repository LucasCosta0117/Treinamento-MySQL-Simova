USE exerciciofabio;

/* DIFERENÇA ENTRE DISTINCTI E GROUP BY  */
SELECT DISTINCT COUNT(*), cargo_seq_db FROM funcionario; -- Retorna apenas o total de tuplas.
SELECT COUNT(*) `qtd cargos`, cargo_seq_db FROM funcionario -- Retorna a quantidade de tuplas por cargo (com base na FK).
GROUP BY cargo_seq_db;

SELECT AVG(cargo_seq_db) FROM funcionario;

SELECT * FROM funcionario HAVING cargo_seq_db < AVG(cargo_seq_db);

SELECT * FROM funcionario WHERE cargo_seq_db < ( SELECT AVG(cargo_seq_db) FROM funcionario );


SELECT * FROM funcionario WHERE EXISTS (select * FROM funcionario WHERE cargo_seq_db = 4)
AND cargo_seq_db != 4;

SELECT * FROM funcionario WHERE seq_db < ANY /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- O PRIMEIRO SELECT BUSCA 'SEQ_DB' MENOR QUE OS RESULTADOS DO SUBSELECT
SELECT * FROM funcionario WHERE seq_db IN /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- MESMO QUE '= ANY'
SELECT * FROM funcionario WHERE seq_db < SOME /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- MESMO QUE '< ANY'
SELECT * FROM funcionario WHERE seq_db < ALL /* 3 e 4 */ (SELECT seq_db FROM cargo WHERE seq_db > 2); -- IGNORA O RESULTATO '3', POIS PRECISA ATENDER A CONDIÇÕES PARA TODOS OS RESULTADOS

SELECT seq_db FROM cargo WHERE seq_db > 2; -- <=== ISSO É O PARÉNTESES DO PRIMEIRO 'ANY' ACIMA ^^^ = Resposta disso é '3' e '4';


SELECT * FROM funcionario WHERE (seq_db = 3 OR seq_db = 4);