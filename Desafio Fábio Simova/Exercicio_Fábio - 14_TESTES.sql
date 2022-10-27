/* TESTES */

SELECT * FROM funcionario;
SELECT * FROM log_funcionario;

DROP TRIGGER bu_funcionario_log_funcionario;

SELECT MAX(seq_db) FROM funcionario;
SELECT * FROM funcionario WHERE seq_db = 65454; -- atualizando pelo gride

SELECT * FROM funcionario WHERE seq_db = 55555;  -- atualizando pelo gride;

-- -------------------------------------------------------------------------------

DROP TRIGGER bd_funcionario_log_funcionario;

DELETE FROM funcionario WHERE seq_db = '65456';
DELETE FROM funcionario WHERE seq_db = '55556';

INSERT INTO funcionario (seq_db, cod_funcionario, nome, data_nasc, cargo_desc) VALUES (55556, 102, 'funcionario102', '1975-01-02', 'Analista');