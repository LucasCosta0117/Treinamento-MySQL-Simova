USE exerciciofabio;

SELECT seq_db FROM cargo WHERE nome = 'Programador'; -- Testando a busca do SEQ_DB pela STRING;

SELECT seq_db INTO @temp FROM cargo WHERE nome = 'Programador'; -- Salvador o seq_db tipo bigint em uma variável;
 
SELECT @temp;  -- Testanto se a variável funciona para utiliza-la no UPDATE;