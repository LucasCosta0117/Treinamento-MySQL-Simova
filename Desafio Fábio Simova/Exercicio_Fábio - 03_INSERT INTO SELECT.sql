CREATE DATABASE justfortest;
USE justfortest;

CREATE TABLE is1 (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    name1 VARCHAR(20),
    iscompleted BOOLEAN,
    
    PRIMARY KEY (seq_db)
) ENGINE innodb charset utf8;

CREATE TABLE is2 (
	seq_db BIGINT UNSIGNED,
    name2 VARCHAR(20),
    description TEXT
    
) ENGINE innodb charset utf8;

CREATE TABLE is3 (
	seq_db BIGINT UNSIGNED,
    name3 VARCHAR(20),
    iscompleted BOOLEAN,
    description TEXT,
    data_nasc DATE,
    
    PRIMARY KEY (seq_db)
) ENGINE innodb charset utf8;

DESC is1;
DESC is2;
DESC is3;
DESC is4;

INSERT INTO is1 (name1, iscompleted) VALUES
('Lucas', 0),
('João', 1),
('Maria', 1);

SELECT * FROM is1;
SELECT * FROM is2;
SELECT * FROM is3;
SELECT * FROM is4;

INSERT INTO is2 (seq_db, name2, description) -- VALUES (column_name);
SELECT seq_db, name1, iscompleted FROM is1;

INSERT INTO is1 (name1, iscompleted)
SELECT name2, description FROM is2;

INSERT INTO is3 
SELECT * FROM is1;

INSERT INTO is3 (seq_db, name3, iscompleted)
SELECT * FROM is1;

CREATE TABLE is4 AS SELECT * FROM is1;
