/*Prática de JOIN com várias tabelas - CURSO EM VÍDEO MYSQL*/
USE cadastro;
DESC gafanhotos_assistem_cursos;
SELECT * FROM gafanhotos_assistem_cursos;

/*----------------- AULA 16 -----------------*/
/*Devido a combinação de cardinalidade muitos para muitos das entidades
'gafanhotos assistem cursos', uma 3ª tabela precisa ser criada. */
CREATE TABLE gafanhotos_assistem_cursos (
	id INT NOT NULL AUTO_INCREMENT,
	data DATE,
	idGafanhoto int,
	idCursos int,
	PRIMARY KEY (id),
	FOREIGN KEY (idGafanhoto) REFERENCES gafanhotos (id),
	FOREIGN KEY (idCursos) REFERENCES cursos (idcurso)
) DEFAULT CHARSET = utf8;

/*Povoando a tabela para visualizarmos e enterdermos a relação de muitos para muitos*/
INSERT INTO gafanhotos_assistem_cursos VALUES 
(default, '2014-03-01', '1', '2'),
(default, '2015-12-22', '3', '6'),
(default, '2014-01-01', '22', '12'),
(default, '2016-05-12', '1', '19');

/*Nesse resultado é possível identificar quais alunos estão assistindo algum curso*/
SELECT * FROM gafanhotos g 
JOIN gafanhotos_assistem_cursos a
ON g.id = a.idGafanhoto; 

/*Nesse resultado é possível identificar apenas o aluno e o id do curso que ele está assistindo*/
SELECT g.nome, a.idCursos FROM gafanhotos g 
JOIN gafanhotos_assistem_cursos a
ON g.id = a.idGafanhoto 
ORDER BY g.nome;

/*Aplicando mais um JOIN para linkar as informações dos GAFANHOTOS as informações dos CURSOS. 
Nesse caso, no resultado podemos mostrar o nome do gafanhoto e o nome do curso que ele está assistindo*/
SELECT g.nome, c.nome FROM gafanhotos g 
JOIN gafanhotos_assistem_cursos a
ON g.id = a.idGafanhoto
JOIN cursos c
ON c.idcurso = a.idCursos
ORDER BY g.nome;