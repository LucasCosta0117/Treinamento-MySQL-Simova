/* CRIANDO O BANCO DE DADOS E AS TABELAS CONFORME MODELO DISPONIBILIZADO */

-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS desafiodiogo;

-- Garantindo uso do banco para criação das tabelas
USE desafiodiogo;

-- Criando as tabelas conforme esquema disponibilizado
CREATE TABLE IF NOT EXISTS fabricante (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS modelo (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS grupo_atividade (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS funcao (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    flag_supervisor BOOLEAN,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS equipamento (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    fabricante_seq_db BIGINT UNSIGNED,
    modelo_seq_db BIGINT UNSIGNED,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS atividade (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(255),
    flag_produtiva BOOLEAN,
    grupo_atividade_seq_db BIGINT UNSIGNED,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS funcionario (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(50),
    funcao_seq_db BIGINT UNSIGNED,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;

CREATE TABLE IF NOT EXISTS apontamento (
	seq_db BIGINT UNSIGNED AUTO_INCREMENT,
    data_apt DATE,
    equipamento_seq_db BIGINT UNSIGNED,
    atividade_seq_db BIGINT UNSIGNED,
    grupo_atividade_seq_db BIGINT UNSIGNED,
    funcionario_seq_db BIGINT UNSIGNED,
    supervisor_seq_db BIGINT UNSIGNED,
    
    PRIMARY KEY (seq_db)
) ENGINE InnoDB CHARSET utf8;