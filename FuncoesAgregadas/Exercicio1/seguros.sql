CREATE DATABASE  IF NOT EXISTS `seguros` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seguros`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: seguros
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acidente`
--

DROP TABLE IF EXISTS `acidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acidente` (
  `numero_ocorrencia` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `local` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`numero_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acidente`
--

LOCK TABLES `acidente` WRITE;
/*!40000 ALTER TABLE `acidente` DISABLE KEYS */;
INSERT INTO `acidente` VALUES (149,'2004-11-22','Rua dos Macacos, 1410, Três Rios, RJ'),(321,'2009-09-09','Eng. Cabral Filho,83, Niterói, RJ'),(654,'2010-06-06','Av. Presidente Vargas, 34, São Paulo, SP'),(980,'2011-05-07','Rua 15 de Abril, 204, Sergipe, AL'),(987,'2011-02-26','Rua das Flores, 83, Novo Hamburgo, RS');
/*!40000 ALTER TABLE `acidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carro` (
  `modelo` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES ('Ford Ka',2005,'GWA1534'),('Fiat Uno',2001,'HBL1556'),('VW Gol',2010,'KWY3245'),('Honda Civic',2011,'PAQ5698');
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participou`
--

DROP TABLE IF EXISTS `participou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participou` (
  `id_motorista` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `numero_ocorrencia` int(11) NOT NULL,
  `valor_dano` double DEFAULT NULL,
  PRIMARY KEY (`id_motorista`,`placa`,`numero_ocorrencia`),
  KEY `fc_cstr_4` (`numero_ocorrencia`),
  KEY `fc_cstr_5` (`placa`),
  CONSTRAINT `fc_cstr_3` FOREIGN KEY (`id_motorista`) REFERENCES `pessoa` (`id_motorista`),
  CONSTRAINT `fc_cstr_4` FOREIGN KEY (`numero_ocorrencia`) REFERENCES `acidente` (`numero_ocorrencia`),
  CONSTRAINT `fc_cstr_5` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participou`
--

LOCK TABLES `participou` WRITE;
/*!40000 ALTER TABLE `participou` DISABLE KEYS */;
INSERT INTO `participou` VALUES (12345,'HBL1556',149,3000),(123456,'PAQ5698',987,549),(789012,'GWA1534',321,432),(789012,'GWA1534',980,690);
/*!40000 ALTER TABLE `participou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertence`
--

DROP TABLE IF EXISTS `pertence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertence` (
  `id_motorista` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  PRIMARY KEY (`id_motorista`,`placa`),
  KEY `fc_cstr_2` (`placa`),
  CONSTRAINT `fc_cstr_1` FOREIGN KEY (`id_motorista`) REFERENCES `pessoa` (`id_motorista`),
  CONSTRAINT `fc_cstr_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertence`
--

LOCK TABLES `pertence` WRITE;
/*!40000 ALTER TABLE `pertence` DISABLE KEYS */;
INSERT INTO `pertence` VALUES (789012,'GWA1534'),(12345,'HBL1556'),(456789,'KWY3245'),(123456,'PAQ5698');
/*!40000 ALTER TABLE `pertence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id_motorista` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_motorista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (12345,'Frederico Barbosa','Rua Tirandentes, 995, Campo Grande, MT'),(123456,'João Arthur','Rua da Laguna 32, Rio de Janeiro, RJ'),(456789,'Maria Aparecida','Rua A, 45, São Paulo, SP'),(789012,'Joaquim José','Rua Itamar Arantes, 498, Vitória, ES');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13 18:57:55
