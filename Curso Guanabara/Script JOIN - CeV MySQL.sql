/*Prática de JOIN - CURSO EM VÍDEO MYSQL*/
USE cadastro;
DESC gafanhotos;
DESC cursos;
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

/*----------------- AULA 15 -----------------*/
/*JOIN ON, conecta duas tabelas que possuem relação, exibindo apenas os dados que posuem ligação (INNER JOIN) */
SELECT gafanhotos.nome, gafanhotos.curso_pref, cursos.nome, cursos.ano /* Selecionando campos a serem exibidos*/
FROM gafanhotos JOIN cursos /* Tabelas que serão unificadas*/
ON cursos.idcurso = gafanhotos.curso_pref; /* Relação entre as tabelas, sempre com PK = FK */

/*INNER: apenas registros que possuem relação, ou seja, dados presentes em ambas as entidades*/
SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos INNER JOIN cursos /* Uso do INNER está implícito no JOIN ON, logo, temos o mesmo resultado acima*/
ON cursos.idcurso = gafanhotos.curso_pref
ORDER BY gafanhotos.nome; /*Lembrando que qualquer agregação ou filtro precisa referênciar a tabela do campo desejado*/

/*AS: Aplica "apelidos" as tabelas ou campos, diminuindo comandos ou melhorando a exposição dos resultados */
SELECT g.nome AS nome_gafanhoto, c.nome AS curso_preferido, c.ano /*Apelidando a exibição dos campos*/
FROM gafanhotos g JOIN cursos c /*Apelidando as tabelas e ocultando o comando AS*/
ON c.idcurso = g.curso_pref
ORDER BY g.nome;

/*OUTER JOIN - LEFT ou RIGHT: Retorna todos os dados da junção das tabelas, 
que POSUEEM ou NÃO uma relação definida. */

/*LEFT OUTER JOIN (ou apenas LEFT JOIN): Retorna todos os dados da entidade da ESQUERDA da junção. */
SELECT g.nome AS nome_gafanhoto, c.nome AS curso_preferido, c.ano
FROM gafanhotos AS g LEFT OUTER JOIN cursos AS c /*Retorna todos os alunos que possuem ou não cursos preferidos*/
ON c.idcurso = g.curso_pref;

/*RIGHT OUTER JOIN (ou apenas RIGHT JOIN): Retorna todos os dados da entidade da DIREITA da junção. */
SELECT g.nome AS nome_gafanhoto, c.nome AS curso_preferido, c.ano 
FROM gafanhotos AS g RIGHT JOIN cursos AS c /*Retorna todos os cursos que possuem ou não alunos que o preferem*/
ON c.idcurso = g.curso_pref;


/*------------------- OBS -------------------
PARA CONSULTAS SIMPLES, É POSSíVEL LIGAR ENTIDADES À PARTIR DE SUAS PK's SEM USO DE JOIN*/

SELECT count(*) FROM cursos c, gafanhotos g
WHERE c.idcurso = g.curso_pref;

SELECT count(*) FROM cursos c JOIN gafanhotos g
ON c.idcurso = g.curso_pref;

SELECT g.nome, c.nome FROM cursos c, gafanhotos g
WHERE c.idcurso = g.curso_pref
ORDER BY g.nome;

SELECT g.nome, c.nome 
FROM cursos c JOIN gafanhotos g
ON c.idcurso = g.curso_pref
ORDER BY g.nome;

