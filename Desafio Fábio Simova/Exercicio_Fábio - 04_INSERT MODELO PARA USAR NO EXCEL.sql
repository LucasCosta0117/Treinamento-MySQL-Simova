USE exerciciofabio;

DESC funcionario;
DESC cargo;

SELECT * FROM funcionario;
SELECT * FROM cargo;

INSERT INTO funcionario (seq_db, nome, data_nasc, cargo_seq_db) VALUES (0, '', '', 0);