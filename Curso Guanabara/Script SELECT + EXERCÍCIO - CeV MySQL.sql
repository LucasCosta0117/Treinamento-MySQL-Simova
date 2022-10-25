/*Prática de SELECT - CURSO EM VÍDEO MYSQL*/
USE cadastro;

/*----------------- AULA 01 (AULA 11 - SELECT PARTE 03) -----------------*/

/* " * " Seleciona todas as colunas de uma tabela*/
SELECT * FROM cursos; 

/*ORDER BY, Ordena atráves de um tipo de dado escolhido*/
SELECT * FROM cursos
ORDER BY nome;

/*DESC, registros ordenados em forma DECRESCENTE*/
SELECT * FROM cursos
ORDER BY nome DESC;

/*Filtrar pelas colunas desejadas, ordenando-as*/
SELECT nome, carga, ano FROM cursos
ORDER BY nome;

/*Filtrar colunas desejadas, ordenando o resultado por multiplos filtros*/
SELECT ano, nome, carga FROM cursos
ORDER BY ano, nome;

/*Filtrar apenas LINHAS desejadas, ordenando o resultado*/
SELECT * FROM cursos
WHERE ano = '2016'
ORDER by nome;

/*Filtrar COLUNAS e LINHAS desejadas, ordenando o resultado*/
SELECT nome, carga FROM cursos
WHERE ano = '2016'
ORDER by nome;

/*Filtrar COLUNAS e LINHAS, ordenando o resultado, aplicando OPERADORES no WHERE*/
SELECT nome, descricao, ano FROM cursos
WHERE ano <= '2015'
ORDER by ano, nome;

/*BETWEEN: OPERADOR no WHERE para faixa de valores*/
SELECT ano, nome FROM cursos
WHERE ano BETWEEN '2014' AND '2016'
ORDER by ano DESC, nome ASC;

/*IN(): OPERADOR no WHERE para valores específicos*/
SELECT ano, nome, descricao FROM cursos
WHERE ano IN('2014', '2016')
ORDER by ano, nome;

/*AND e OR: Combinações lógicas */
SELECT nome, carga, totaulas FROM cursos
WHERE carga > 35 AND totaulas < 20 /*Ambas condições precisam ser verdade*/
ORDER BY nome;

SELECT nome, carga, totaulas FROM cursos
WHERE carga >= 50 OR totaulas < 10 /*Apenas uma condição precisa ser verdade*/
ORDER BY nome;

/*----------------- AULA 02 (AULA 12 - SELECT PARTE 03) -----------------*/

/*LIKE: Seleciona registros que contenham o parâmetro especificado,
É CASE SENSITIVE e substitui o "=" na sintaxe do WHERE*/
SELECT * FROM cursos
WHERE nome LIKE 'p%';

/*WILDCARDS, uso do "%" como caracter curinga*/
SELECT * FROM cursos
WHERE nome LIKE 'A%'; /*Iniciam com A e seguem qualquer caracter ou vazios*/

SELECT * FROM cursos
WHERE nome LIKE '%a'; /*Terminam com A e iniciam com qualquer caracter ou vazios*/

SELECT * FROM cursos
WHERE nome LIKE '%a%'; /*Letra A em qualquer posição, qualquer caracter ou vazios independete da posição*/

SELECT * FROM cursos
WHERE nome NOT LIKE '%a%'; /*Devolve palavras que não possuem A em nenhuma posição*/

/*WILDCARDS, uso do " _ " como caracter obrigatório*/
SELECT * FROM cursos
WHERE nome LIKE 'ph%p_'; /*Iniciam com PH, possuam um P no final e seja seguido OBRIGATORIAMENTE de UM caracter*/

/*DISTINCT: Evita a aparencia de resultados repetidos*/
SELECT nacionalidade FROM gafanhotos; /*Sem DISTINCT é uma seleção normal de todos os registros de Nacionalidade da tabela*/
SELECT DISTINCT nacionalidade FROM gafanhotos; /*Com DISTINCT é uma seleção sem duplicatadas de registros*/

/*COUNT: Fução de agregação, retorna um valor total da ocorrência desejada*/
SELECT COUNT(*) FROM cursos; /*Retorna total de registros (tuplas) da tabela cursos*/

SELECT COUNT(*) FROM cursos
WHERE carga > '40'; /*Retorna total de registros que possuem carga maior que 40hr*/

/*MAX / MIN / SUM / AVG: Fução de agregação, retorna o valor máximo/mínimo/soma/média do registro selecionado*/
SELECT MAX(carga) FROM cursos; /*Retorna o valor máximo do registro dentro do campo carga*/

SELECT nome, MIN(totaulas) FROM cursos
WHERE ano = '2016'; /*Retorna o nome e primeiro registro com menos valor (caso haja dois num. min iguais)*/

SELECT SUM(totaulas) FROM cursos
WHERE ano = '2016'; /*Soma total de aulas em um determinado ano*/

SELECT AVG(totaulas) FROM cursos
WHERE ano = '2016'; /*Média das horas total de aulas em um determinado ano*/

SELECT SUM(totaulas) FROM cursos
WHERE nome LIKE '%PHP%'; /*Total de aulas de cursos PHP*/

/*----------------- EXERCÍCIOS (AULA 12 - PARTE 02) -----------------*/
DESC gafanhotos;
SELECT * FROM gafanhotos;

/* 01. Uma lista com nome de todas as gafanhoras (mulheres)*/
SELECT nome, nascimento FROM gafanhotos
WHERE sexo = 'f';

/* 02. Uma lista com os dados de todas aqueles que 
nasceram entre 1/jan/2000 e 31/dez/2015*/
SELECT * FROM gafanhotos
WHERE nascimento BETWEEN '2000-01-01' AND '2015-12-31';

/* 03. Uma lista com o nome todos os homens que são programadores*/
SELECT nome FROM gafanhotos
WHERE sexo = 'M' AND  profissao = 'Programador';

/* 04. Uma lista com os dados de todas as mulheres que nasceram no Brasil
e que tem seu nome iniciando com a Letra J*/
SELECT * FROM gafanhotos
WHERE sexo = 'F' 
AND  nacionalidade = 'Brasil'
AND nome LIKE 'J%';

/* 05. Uma lista com o nome e nacionalidade de todos os homens têm Silva no nome,
não nasceram no Brasil e pesam menos de 100Kg*/
SELECT nome, nacionalidade FROM gafanhotos
WHERE sexo = 'm'
AND nome LIKE '%Silva%'
AND nacionalidade != 'Brasil'
AND peso < '100';

/* 06. Qual é a maior altura entre gafanhotos homens que moram no Brasil?*/
SELECT MAX(altura) FROM gafanhotos
WHERE sexo = 'm'
AND nacionalidade = 'Brasil';

/* 07. Qual a média de peso de todos os gafanhotos cadastrados*/
SELECT AVG(peso) FROM gafanhotos;

/* 08. Qual menor peso entra as gafanhoto mulheres que nasceram
fora do Brasil e entre 01/jan/1990 e 31/dez/2000?*/
SELECT MIN(peso) FROM gafanhotos
WHERE sexo = 'f'
AND nacionalidade != 'Brasil'
AND nascimento BETWEEN '1990-01-01' AND '2000-12-31';

/* 09. Quantas gafanhotos mulheres tem mais de 1.90m de altura?*/
SELECT COUNT(*) FROM gafanhotos
WHERE sexo = 'f'
AND altura > '1.90';

/*----------------- AULA 03 (AULA 13 - SELECT PARTE 03) -----------------*/

/*GROUP BY: Função de Agrupamento*/
SELECT * FROM cursos
GROUP BY carga; /*Visualmente igual ao DISTINCT, porém permite usar Funções de Agregação*/

/*GROUP BY and COUNT: Função de Agrupamento com Agregação*/
SELECT totaulas, COUNT(*) FROM cursos
GROUP BY totaulas; /*Agrupa os cursos pelo seu número de aulas e conta o tatal de ocorrências em cada grupo*/

SELECT carga, COUNT(carga) FROM cursos
WHERE totaulas = '30'
GROUP BY carga; /*Retorna oos grupos de cursos, com base na carga horária, que possuem 30 aulas */

/*HAVING: Adiciona uma condição ao GROUP, criando "Subgrupos" */
SELECT COUNT(*), ano FROM cursos /*Sem HAVING*/
GROUP BY ano
ORDER BY COUNT(*) DESC;

SELECT COUNT(*), ano FROM cursos /*Com HAVING*/
GROUP BY ano
HAVING COUNT(*) >= 5 /*Lembrando que o HAVING só trabalha com o campo utilizado pelo GROUP BY*/
ORDER BY COUNT(*) DESC;

/*HAVING e WHERE, para aplicar um filtro antes de agrupar*/
SELECT COUNT(*), ano FROM cursos /*Com HAVING*/
WHERE totaulas > '30' /*Deve-se utilizar o WHERE antes de agrupar*/
GROUP BY ano
HAVING ano > 2013
ORDER BY COUNT(*) DESC;

/*Agrupando mais de um comando SELECT*/
/* 1º realizando a query separada */
SELECT AVG(carga) FROM cursos;
SELECT carga, COUNT(*) FROM cursos
WHERE ano > 2015
GROUP BY carga
HAVING carga > 36.333; /*Onde 36.333 é a média encontrada pelo AVG() no primeiro SELECT*/

/* 2º realizando a query agrupada */
SELECT carga, COUNT(*) FROM cursos
WHERE ano > 2015
GROUP BY carga
HAVING carga > (
	SELECT AVG(carga) FROM cursos
); /*A média é encontrada diretamente pelo AVG() via SELECT*/

/*----------------- EXERCÍCIOS (AULA 13 - PARTE 03) -----------------*/

/* 01. Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos. */
SELECT profissao, COUNT(*) FROM gafanhotos
GROUP BY profissao
ORDER BY COUNT(*) DESC;

/* 02. Quantos gafanhotos homens e quantas mulheres nasceram após 01/jan/2005. */
SELECT sexo, COUNT(*) FROM gafanhotos
WHERE nascimento >= '2005-01-01'
GROUP BY sexo;

/* 03. Uma lista com os gafanhotos que nasceram fora do Brasil, 
mostrando o país de origem e o total de pessoas nascidas lá.
Só nos interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade. */
SELECT nacionalidade, COUNT(*) FROM gafanhotos
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING count(*) >= 3
ORDER BY COUNT(*);

/* 04. Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100kg e
que estão acima da média de altura de todos os cadastrados*/
SELECT altura, COUNT(*) FROM gafanhotos
WHERE peso > '100' /* AND altura > ( SELECT AVG(altura) FROM gafanhotos ) <-- OPÇÃO VIÁVEL */
GROUP BY altura
HAVING altura > (
	SELECT AVG(altura) FROM gafanhotos
)
ORDER BY altura;