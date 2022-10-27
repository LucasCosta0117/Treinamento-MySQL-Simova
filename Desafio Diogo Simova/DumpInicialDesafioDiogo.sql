CREATE DATABASE  IF NOT EXISTS `desafiodiogo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `desafiodiogo`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: desafiodiogo
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apontamento`
--

DROP TABLE IF EXISTS `apontamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apontamento` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_apt` date DEFAULT NULL,
  `equipamento_seq_db` bigint(20) unsigned DEFAULT NULL,
  `atividade_seq_db` bigint(20) unsigned DEFAULT NULL,
  `grupo_atividade_seq_db` bigint(20) unsigned DEFAULT NULL,
  `funcionario_seq_db` bigint(20) unsigned DEFAULT NULL,
  `supervisor_seq_db` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`seq_db`),
  KEY `fk_equipamento_apontamento` (`equipamento_seq_db`),
  KEY `fk_atividade_apontamento` (`atividade_seq_db`),
  KEY `fk_grupo_atividade_apontamento` (`grupo_atividade_seq_db`),
  KEY `fk_funcionario_apontamento` (`funcionario_seq_db`),
  KEY `fk_supervisor_apontamento` (`supervisor_seq_db`),
  CONSTRAINT `fk_atividade_apontamento` FOREIGN KEY (`atividade_seq_db`) REFERENCES `atividade` (`seq_db`),
  CONSTRAINT `fk_equipamento_apontamento` FOREIGN KEY (`equipamento_seq_db`) REFERENCES `equipamento` (`seq_db`),
  CONSTRAINT `fk_funcionario_apontamento` FOREIGN KEY (`funcionario_seq_db`) REFERENCES `funcionario` (`seq_db`),
  CONSTRAINT `fk_grupo_atividade_apontamento` FOREIGN KEY (`grupo_atividade_seq_db`) REFERENCES `grupo_atividade` (`seq_db`),
  CONSTRAINT `fk_supervisor_apontamento` FOREIGN KEY (`supervisor_seq_db`) REFERENCES `funcionario` (`seq_db`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apontamento`
--

LOCK TABLES `apontamento` WRITE;
/*!40000 ALTER TABLE `apontamento` DISABLE KEYS */;
INSERT INTO `apontamento` VALUES (1,NULL,NULL,NULL,NULL,1,2);
/*!40000 ALTER TABLE `apontamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atividade` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `flag_produtiva` tinyint(1) DEFAULT NULL,
  `grupo_atividade_seq_db` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`seq_db`),
  KEY `fk_grupo_atividade_atividade` (`grupo_atividade_seq_db`),
  CONSTRAINT `fk_grupo_atividade_atividade` FOREIGN KEY (`grupo_atividade_seq_db`) REFERENCES `grupo_atividade` (`seq_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fabricante_seq_db` bigint(20) unsigned DEFAULT NULL,
  `modelo_seq_db` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`seq_db`),
  KEY `fk_fabricante_equipamento` (`fabricante_seq_db`),
  KEY `fk_modelo_equipamento` (`modelo_seq_db`),
  CONSTRAINT `fk_fabricante_equipamento` FOREIGN KEY (`fabricante_seq_db`) REFERENCES `fabricante` (`seq_db`),
  CONSTRAINT `fk_modelo_equipamento` FOREIGN KEY (`modelo_seq_db`) REFERENCES `modelo` (`seq_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `flag_supervisor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`seq_db`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES (1,'Técnico de Campo',0),(2,'Analista de Sistema',1);
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `funcao_seq_db` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`seq_db`),
  KEY `fk_funcao_funcionario` (`funcao_seq_db`),
  CONSTRAINT `fk_funcao_funcionario` FOREIGN KEY (`funcao_seq_db`) REFERENCES `funcao` (`seq_db`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Lucas',1),(2,'Diogo',2),(3,'Fabio',2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_atividade`
--

DROP TABLE IF EXISTS `grupo_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_atividade` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_atividade`
--

LOCK TABLES `grupo_atividade` WRITE;
/*!40000 ALTER TABLE `grupo_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `seq_db` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 13:40:07
