CREATE DATABASE  IF NOT EXISTS `reserva` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `reserva`;
-- MySQL dump 10.13  Distrib 5.6.28, for Win64 (x86_64)
--
-- Host: localhost    Database: reserva
-- ------------------------------------------------------
-- Server version	5.6.28-log

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
-- Table structure for table `aeronave`
--

DROP TABLE IF EXISTS `aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeronave` (
  `codigoaeronave` decimal(4,0) NOT NULL,
  `prefixo` varchar(10) DEFAULT NULL,
  `fabricante` varchar(20) DEFAULT NULL,
  `anofabricacao` year(4) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigoaeronave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronave`
--

LOCK TABLES `aeronave` WRITE;
/*!40000 ALTER TABLE `aeronave` DISABLE KEYS */;
INSERT INTO `aeronave` VALUES (1111,'PT-MXC','FABE',2014,150),(2222,'PR-AZS','AIRBUS',2012,215),(3333,'PT-MZV','BOING',2013,525),(4444,'PT-SEA','AIRBUS',2014,215),(5555,'PR-AZL','BOING',2011,525),(6666,'PR-AZB','AIRBUS',2010,215),(7777,'PT-ONB','EMBRAER',2011,200);
/*!40000 ALTER TABLE `aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assento`
--

DROP TABLE IF EXISTS `assento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assento` (
  `numeroassento` varchar(4) NOT NULL,
  `classe` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`numeroassento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assento`
--

LOCK TABLES `assento` WRITE;
/*!40000 ALTER TABLE `assento` DISABLE KEYS */;
INSERT INTO `assento` VALUES ('A01','Primeira Classe','Disponível'),('A02','Primeira Classe','Indisponível'),('A03','Primeira Classe','Disponível'),('A04','Primeira Classe','Disponível'),('A05','Primeira Classe','Disponível'),('A06','Primeira Classe','Disponível'),('A16','Econômica','Indisponível'),('A17','Econômica','Disponível'),('A18','Econômica','Disponível'),('A19','Econômica','Disponível'),('A20','Econômica','Indisponível'),('A21','Econômica','Disponível'),('A22','Econômica','Disponível'),('A23','Econômica','Disponível'),('A24','Econômica','Indisponível'),('A25','Econômica','Indisponível'),('A26','Econômica','Indisponível'),('A27','Econômica','Disponível'),('A28','Econômica','Disponível'),('A29','Econômica','Indisponível'),('B01','Primeira Classe','Indisponível'),('B02','Primeira Classe','Disponível'),('B03','Primeira Classe','Disponível'),('B04','Primeira Classe','Indisponível'),('B05','Primeira Classe','Disponível'),('B06','Primeira Classe','Indisponível'),('B16','Econômica','Disponível'),('B17','Econômica','Disponível'),('B18','Econômica','Indisponível'),('B19','Econômica','Disponível'),('B20','Econômica','Disponível'),('B21','Econômica','Indisponível'),('B22','Econômica','Disponível'),('D01','Primeira Classe','Disponível'),('D02','Primeira Classe','Disponível'),('D03','Primeira Classe','Disponível'),('D04','Primeira Classe','Disponível'),('D05','Primeira Classe','Disponível'),('D06','Primeira Classe','Disponível'),('D16','Econômica','Disponível'),('D17','Econômica','Disponível'),('D18','Econômica','Disponível'),('D19','Econômica','Disponível'),('D20','Econômica','Disponível'),('D21','Econômica','Disponível'),('D22','Econômica','Disponível'),('E16','Econômica','Disponível'),('E17','Econômica','Disponível'),('E18','Econômica','Disponível'),('E19','Econômica','Disponível'),('E20','Econômica','Disponível'),('E21','Econômica','Disponível'),('E22','Econômica','Disponível'),('F16','Econômica','Disponível'),('F17','Econômica','Disponível'),('F18','Econômica','Disponível'),('F19','Econômica','Disponível'),('F20','Econômica','Disponível'),('F21','Econômica','Disponível'),('F22','Econômica','Disponível'),('K01','Primeira Classe','Disponível'),('K02','Primeira Classe','Disponível'),('K03','Primeira Classe','Disponível'),('K04','Primeira Classe','Disponível'),('K05','Primeira Classe','Disponível'),('K06','Primeira Classe','Disponível'),('K16','Econômica','Disponível'),('K17','Econômica','Disponível'),('K18','Econômica','Disponível'),('K19','Econômica','Disponível'),('K20','Econômica','Disponível'),('K21','Econômica','Disponível'),('K22','Econômica','Disponível'),('L01','Primeira Classe','Disponível'),('L02','Primeira Classe','Disponível'),('L03','Primeira Classe','Disponível'),('L04','Primeira Classe','Disponível'),('L05','Primeira Classe','Disponível'),('L06','Primeira Classe','Disponível'),('L16','Econômica','Disponível'),('L17','Econômica','Disponível'),('L18','Econômica','Disponível'),('L19','Econômica','Disponível'),('L20','Econômica','Disponível'),('L21','Econômica','Disponível'),('L22','Econômica','Disponível');
/*!40000 ALTER TABLE `assento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `codigocidade` decimal(4,0) NOT NULL,
  `nomecidade` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigocidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1234,'Rio de Janeiro'),(2345,'São Paulo'),(3456,'Belo Horizonte'),(4567,'Brasília'),(5678,'Juiz de Fora');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codigocliente` decimal(5,0) NOT NULL,
  `nomecliente` varchar(50) DEFAULT NULL,
  `cpf` varchar(13) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigocliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (11111,'Carla Soares','12345678901','Moraes Sarmento, Juiz de Fora- MG','(32)3234-3434'),(11112,'Angela Silveira','23456789012','Av. Sete de Setembro, São Paulo - SP','(11)3333-4455'),(11122,'Marcelo Souza','34567890123','Padre Frederico, Rio de Janeiro - RJ','(21)4032-3232'),(11223,'Raimundo Oliveira','45678901234','Av. Itamar Franco, Juiz de Fora - MG','(32)3211-1111'),(22222,'Alicia Rosa','56789012345','Moraes e Castro, Juiz de Fora - MG','(32)3231-3131'),(22223,'Sandra Alvarenga','67890123456','Rei Alberto, São Paulo - SP','(11)3456-5656'),(22233,'José Castilho','78901234567','Oscar Freire, Juiz de Fora - MG','(32)3215-5554'),(33333,'Alice Ferreira','89012345678','Ibitiguaia, Juiz de Fora - MG','(32)3232-8887'),(33334,'Maria Tereza','90123456789','Av. Santa Luzia, Juiz de Fora - MG','(32)3025-2020'),(33344,'Silvio Albuquerque','11122233344','Oscar Vidal, Rio de Janeiro - RJ','(21)4009-1415'),(33445,'Margarida de Jesus','22233344455','Pasteur, Juiz de Fora - MG','(32)3222-2525'),(44445,'Iara Cristina','33344455566','Porto das Flores, São Paulo - SP','(11)3003-3030'),(44455,'Alex Alves','44455566677','Manoel Honório, Juiz de Fora - MG','(32)3235-5252'),(55556,'Adriane Santana','55566677788','Av. Deusdedith Salgado, Rio de Janeiro - RJ','(21)2454-5457'),(55566,'Matheus Reis','66677788899','Padre Café,Juiz de Fora - MG','(32)3226-4578'),(55667,'Argemiro Braga','77788899900','Oswaldo Aranha, São Paulo - SP','(11)5254-6532'),(66666,'Tamara Jesus','88899900011','Mariano Procópio, Juiz de Fora - MG','(32)3223-5050'),(66667,'Laura Leme','99900011122','Av. Itamar Franco, Rio de Janeiro - RJ','(21)5005-1040'),(66677,'Gisele Almeida','10110110111','Av. Costa e Silva, São Paulo - SP','(11)4001-5040'),(66778,'Joice Leite','10210210202','Gil Horta, Juiz de Fora - MG','(32)3216-3598'),(77777,'Adriana Alves','20120120122','Olípio Costa, Rio de Janeiro - RJ','(21)2233-1236'),(77778,'Luisa Antunes','30130130113','Braz Bernardino, Juiz de Fora - MG','(32)3218-4352'),(77889,'Luiz de Paula','31231231212','Av. Barão do Rio Branco, Juiz de Fora - MG','(32)3231-8989'),(88889,'Romero Santos','43243243214','Av. Juscelino Kubitschek, Rio de Janeiro - RJ','(21)3356-7878'),(88899,'Mirna Campos','23223223211','Av. dos Andradas, Juiz de Fora - MG','(32)3033-1111');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `codigoreserva` decimal(5,0) NOT NULL,
  `codigocliente` decimal(5,0) DEFAULT NULL,
  `numeroassento` varchar(4) DEFAULT NULL,
  `codigovoo` decimal(4,0) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `datareserva` date DEFAULT NULL,
  PRIMARY KEY (`codigoreserva`),
  KEY `fk_codcliente` (`codigocliente`),
  KEY `fk_numeroassento` (`numeroassento`),
  KEY `fk_codigovoo` (`codigovoo`),
  CONSTRAINT `fk_codcliente` FOREIGN KEY (`codigocliente`) REFERENCES `cliente` (`codigocliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_codigovoo` FOREIGN KEY (`codigovoo`) REFERENCES `voo` (`codigovoo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_numeroassento` FOREIGN KEY (`numeroassento`) REFERENCES `assento` (`numeroassento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (10101,33445,'L16',1100,1423,'2014-12-01'),(10102,66778,'A04',3000,1040,'2014-01-05'),(10103,77777,'B02',4000,1100,'2014-02-11'),(10104,77778,'A27',5000,832,'2014-08-03'),(10105,77889,'D18',6000,312,'2014-05-22'),(10106,88889,'A25',7000,200,'2014-06-30'),(10107,88889,'A23',1000,208,'2014-07-18'),(10202,44445,'B19',1200,1492,'2014-10-13'),(10303,44455,'B04',1300,2568,'2014-12-05'),(10404,55556,'B05',1400,3600,'2014-12-05'),(10505,55566,'D22',1500,434,'2014-11-10'),(10606,55667,'L22',1600,504,'2014-03-23'),(10707,66666,'A29',1700,534,'2014-02-28'),(10808,66667,'E22',1000,221,'2014-02-14'),(10909,66677,'E17',2000,154,'2014-01-01'),(11223,11112,'A16',2000,133,'2014-12-07'),(22334,11122,'B21',1000,208,'2014-10-15'),(33445,11111,'K17',3000,173,'2014-11-23'),(44556,11223,'D01',4000,589,'2014-09-15'),(55667,22222,'A01',5000,745,'2014-12-09'),(66778,22223,'K19',6000,238,'2014-05-22'),(77889,22233,'K21',7000,258,'2014-04-22'),(88990,33333,'F18',8000,210,'2014-04-10'),(99001,33334,'F21',9000,1283,'2014-11-24');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voo` (
  `codigovoo` decimal(4,0) NOT NULL,
  `numerovoo` varchar(6) DEFAULT NULL,
  `codigoaeronave` decimal(4,0) NOT NULL,
  `cidadeorigem` decimal(4,0) DEFAULT NULL,
  `cidadedestino` decimal(4,0) DEFAULT NULL,
  `horariosaida` time DEFAULT NULL,
  `horariochegada` time DEFAULT NULL,
  `assentosLivres` int(2) DEFAULT NULL,
  PRIMARY KEY (`codigovoo`),
  KEY `fk_cidadeorigem` (`cidadeorigem`),
  KEY `fk_cidadedestino` (`cidadedestino`),
  KEY `fk_aeronave_voo` (`codigoaeronave`),
  CONSTRAINT `fk_aeronave_voo` FOREIGN KEY (`codigoaeronave`) REFERENCES `aeronave` (`codigoaeronave`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cidadedestino` FOREIGN KEY (`cidadedestino`) REFERENCES `cidade` (`codigocidade`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cidadeorigem` FOREIGN KEY (`cidadeorigem`) REFERENCES `cidade` (`codigocidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (1000,'GIG-32',1111,2345,1234,'22:50:00','23:55:00',150),(1100,'CON-11',2222,2345,5678,'08:50:00','10:20:00',215),(1200,'JDF-12',3333,5678,2345,'09:10:00','10:40:00',525),(1300,'JDF-12',4444,5678,2345,'11:20:00','12:50:00',215),(1400,'VCP-75',5555,3456,4567,'18:51:00','20:36:00',525),(1500,'VCP-75',6666,3456,4567,'14:18:00','15:58:00',215),(1600,'BSB-76',7777,4567,3456,'17:47:00','19:31:00',200),(1700,'BSB-76',1111,4567,3456,'10:52:00','12:33:00',150),(2000,'GIG-32',2222,2345,1234,'09:20:00','10:25:00',215),(3000,'CON-26',3333,1234,2345,'11:39:00','12:44:00',525),(4000,'CON-26',4444,1234,2345,'14:33:00','15:37:00',215),(5000,'CNF-16',5555,3456,1234,'17:10:00','18:20:00',525),(6000,'CNF-16',6666,3456,1234,'19:45:00','20:55:00',215),(7000,'GIG-17',7777,1234,3456,'21:30:00','22:40:00',200),(8000,'GIG-17',1111,1234,3456,'00:15:00','01:25:00',150),(9000,'CON-11',2222,2345,5678,'04:26:00','05:56:00',215);
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-03 15:52:02
