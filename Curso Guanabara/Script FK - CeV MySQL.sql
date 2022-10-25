/*Prática de FOREIGN KEY - CURSO EM VÍDEO MYSQL*/
USE cadastro;
DESC gafanhotos;
DESC cursos;
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

/*----------------- AULA 15 -----------------*/
ALTER TABLE gafanhotos ADD COLUMN curso_pref int; /* Adicionando uma coluna para ser utilizada como FK*/

ALTER TABLE gafanhotos ADD FOREIGN KEY (curso_pref) /* Adicionando a propriedade FK na tabela gafanhotos, e, ligando à PK da tabela cursos*/
REFERENCES cursos (idcurso);

UPDATE gafanhotos SET curso_pref = '6' WHERE id = '1';

/*Atualização de exemplo na Tabela para conseguir avançar no tema*/
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '22' WHERE (`id` = '2');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '12' WHERE (`id` = '3');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '7' WHERE (`id` = '4');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '1' WHERE (`id` = '5');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '8' WHERE (`id` = '6');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '4' WHERE (`id` = '7');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '5' WHERE (`id` = '8');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '3' WHERE (`id` = '9');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '30' WHERE (`id` = '10');
UPDATE `cadastro`.`gafanhotos` SET `curso_pref` = '22' WHERE (`id` = '11');