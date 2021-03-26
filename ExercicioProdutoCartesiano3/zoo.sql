CREATE DATABASE  IF NOT EXISTS `zoo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zoo`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: zoo
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `alimentacao`
--

DROP TABLE IF EXISTS `alimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimentacao` (
  `idAlimentacao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idAlimentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentacao`
--

LOCK TABLES `alimentacao` WRITE;
/*!40000 ALTER TABLE `alimentacao` DISABLE KEYS */;
INSERT INTO `alimentacao` VALUES (1,'Herbívoros','Alimentam-se exclusivamente de plantas'),(2,'Carnívoros','Alimentam-se de outros animais'),(3,'Omnívoros','Alimentam-se de animais e vegetais'),(4,'Insectívoro','São carnívoros, mas preferem os insetos'),(5,'Granívoros','Herbívoros que se alimentam de sementes e grãos'),(6,'Frugíveros','Herbívoros que se alimentam de frutos');
/*!40000 ALTER TABLE `alimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `idAnimal` int NOT NULL AUTO_INCREMENT,
  `idEspecie` int DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `dataEntrada` date DEFAULT NULL,
  `dataSaida` date DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `idCuidador` int DEFAULT NULL,
  `idMedicacao` int DEFAULT NULL,
  `idLocalizacao` int DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idAnimal`),
  KEY `idCuidador` (`idCuidador`),
  KEY `idEspecie` (`idEspecie`),
  KEY `idMedicacao` (`idMedicacao`),
  KEY `idLocalizacao` (`idLocalizacao`),
  CONSTRAINT `fk_ani_emp` FOREIGN KEY (`idCuidador`) REFERENCES `empregados` (`idEmpregado`),
  CONSTRAINT `fk_ani_esp` FOREIGN KEY (`idEspecie`) REFERENCES `especies` (`idEspecie`),
  CONSTRAINT `fk_ani_loc` FOREIGN KEY (`idLocalizacao`) REFERENCES `localizacao` (`idLocalizacao`),
  CONSTRAINT `fk_ani_medi` FOREIGN KEY (`idMedicacao`) REFERENCES `medicacao` (`idMedicacao`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (1,1,'Gorila Ocidental ','2012-02-27',NULL,'2010-01-21',6,5,3,'M'),(2,1,'Gorila da Planície ','2014-07-18','2018-03-04','2010-01-25',7,3,3,'F'),(3,1,'Gorila do Rio Cross','2016-09-23',NULL,'2010-03-13',20,4,3,'F'),(4,1,'Gorila Oriental ','2014-07-01',NULL,'2010-03-28',21,6,3,'M'),(5,1,'Gorila da Montanha ','2015-07-20',NULL,'2010-05-07',22,5,3,'M'),(6,1,'Gorila da Planície e de Grauer','2014-12-09',NULL,'2010-06-04',23,5,3,'M'),(7,1,'Chipamzé','2016-11-07',NULL,'2010-06-21',24,6,3,'M'),(8,1,'Macaco prego','2013-11-12',NULL,'2010-07-08',25,3,3,'M'),(9,1,'Macaco aranha','2011-06-12',NULL,'2010-08-07',6,1,3,'M'),(10,1,'Mico','2017-06-13',NULL,'2010-08-26',7,1,3,'M'),(11,1,'Macaco esquilo','2015-07-24','2014-06-24','2010-10-17',20,5,3,'M'),(12,1,'Orangotango','2011-05-20','2016-06-13','2010-12-05',21,4,3,'M'),(13,1,'Gibão','2011-08-12',NULL,'2010-12-18',22,6,3,'M'),(14,2,'Zebra das montanhas','2012-03-03',NULL,'2011-01-05',23,5,3,'M'),(15,2,'Zebras das planícies','2015-11-05',NULL,'2011-02-12',24,6,3,'M'),(16,2,'Zebras de Grevy','2015-07-28',NULL,'2011-02-28',25,6,3,'M'),(17,3,'Urso Pardo','2015-01-13',NULL,'2011-04-05',6,3,3,'M'),(18,3,'Urso Polar','2013-08-27',NULL,'2011-05-20',7,3,3,'M'),(19,3,'Urso Panda','2014-02-12',NULL,'2011-06-20',20,6,3,'F'),(20,4,'Ornitorrinco','2015-11-03',NULL,'2011-06-22',21,3,3,'F'),(21,5,'Leão Marinho','2012-12-17','2017-03-30','2011-07-09',22,2,3,'F'),(22,5,'Leão Asiático','2017-12-28',NULL,'2011-07-14',23,3,3,'M'),(23,5,'Leão Africano','2015-02-08',NULL,'2011-10-23',24,1,3,'M'),(24,6,'Elefante Asiático','2012-02-21',NULL,'2011-12-09',25,6,3,'M'),(25,6,'Elefante Africano','2016-04-10',NULL,'2012-02-09',6,1,3,'F'),(26,7,'Girafa-reticulada ','2018-03-06',NULL,'2012-04-06',7,5,3,'M'),(27,7,'Girafa-do-kilimanjaro','2017-10-08',NULL,'2012-04-19',20,5,3,'M'),(28,7,'Girafa-núbia ','2018-04-07',NULL,'2012-06-09',21,1,3,'F'),(29,7,'Girafa-sul-africana','2013-01-16','2017-02-28','2012-06-11',22,4,3,'F'),(30,8,'Hipopótamo do Nilo','2015-03-25',NULL,'2012-06-20',23,2,3,'F'),(31,9,'Tigre Siberiano','2018-04-05',NULL,'2012-08-09',24,4,3,'F'),(32,9,'Tigre do sul da China','2017-10-22',NULL,'2012-08-10',25,2,3,'F'),(33,9,'Tigre Indochinês','2016-09-18',NULL,'2012-08-20',6,3,3,'M'),(34,9,'Tigre de Bengala','2015-10-16',NULL,'2012-08-25',7,3,3,'M'),(35,9,'Tigre de Sumatra','2013-08-15',NULL,'2012-08-28',20,1,3,'F'),(36,10,'Arara-Azul','2013-10-08',NULL,'2012-09-26',21,4,3,'F'),(37,10,'Arara-Vermelha','2018-01-01',NULL,'2012-10-04',22,2,3,'F'),(38,11,'Crocodilo-americano','2015-03-11',NULL,'2013-01-17',23,1,3,'F'),(39,11,'crocodilo-anão','2018-03-23',NULL,'2013-04-08',24,4,3,'M'),(40,12,'Sapo Cururu','2014-11-02','2016-03-03','2013-05-16',25,5,3,'M'),(41,13,'Rinoceronte-de-java','2015-04-20',NULL,'2013-06-22',6,3,3,'M'),(42,13,'Rinoceronte-negro','2015-01-28',NULL,'2013-08-05',7,4,3,'F'),(43,13,'Rinocerante-branco','2014-09-03',NULL,'2013-09-02',20,4,3,'M'),(44,14,'Pala-Pala','2018-04-01',NULL,'2013-10-03',21,4,3,'F'),(45,14,'Piva','2014-08-15',NULL,'2013-10-18',22,2,3,'M'),(46,14,'Cudo','2016-02-14',NULL,'2013-12-20',23,1,3,'M'),(47,15,'Lobo Cinzento','2015-07-08',NULL,'2014-01-25',24,4,3,'F'),(48,15,'Lobo Ibérico','2016-06-01',NULL,'2014-02-18',25,4,3,'F'),(49,16,'Foca-Comum','2015-05-22',NULL,'2014-03-10',6,6,3,'M'),(50,16,'Nerpa','2018-02-20',NULL,'2014-03-17',7,2,3,'F'),(51,16,'Foca-Barbuda','2015-05-18',NULL,'2014-03-18',20,6,3,'M'),(52,17,'Raposa do Ártico','2015-11-25',NULL,'2014-04-22',21,3,3,'F'),(53,17,'Raposa das Malvinas','2018-02-14',NULL,'2014-05-02',22,2,3,'F'),(54,18,'avestruz-masai','2017-09-08','2018-01-25','2014-05-06',23,3,3,'F'),(55,18,'avestruz-do-pescoço-vermelho','2018-03-27',NULL,'2014-07-02',24,6,3,'M'),(56,19,'Jabuti-piranga','2018-08-20',NULL,'2014-07-16',25,6,3,'M'),(57,20,'Javali-Europeu','2016-03-16',NULL,'2014-08-06',6,6,3,'F'),(58,21,'Tatu-Galinha','2016-08-11',NULL,'2014-08-25',7,5,3,'M'),(59,22,'Camaleão-Pantera','2017-01-19','2018-02-19','2014-09-27',20,3,3,'M'),(60,28,'Tucanuçu ','2017-01-15',NULL,'2014-11-22',21,4,3,'F');
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `tipoSociedade` int DEFAULT NULL,
  `dataEntrada` date DEFAULT NULL,
  `dataSaida` date DEFAULT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_cli_soci` (`tipoSociedade`),
  CONSTRAINT `fk_cli_soci` FOREIGN KEY (`tipoSociedade`) REFERENCES `sociedades` (`idTipoSociedade`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Paz Verde',5,'2010-01-21','2011-07-14','Ong Ecologista'),(2,'SOS animais',2,'2013-02-11',NULL,'Ajuda espécies em extinção'),(3,'Maria Fernanda de Oliveira',3,'2012-06-11','2013-07-17','colaborador'),(4,'Otávia Neto Braga',3,'2012-06-20','2018-05-09','colaborador'),(5,'Pedro Henrique Miranda',3,'2013-04-08','2018-03-26','colaborador'),(6,'Geralda Paiva Britto',3,'2013-05-16',NULL,'colaborador'),(7,'Natália Almeida Pascoalino',3,'2014-03-17',NULL,'colaborador'),(8,'Antônio dos Santos Martins',3,'2014-03-18',NULL,'colaborador'),(9,'Freddy Alexandre Silva',3,'2014-04-22','2018-04-03','colaborador'),(10,'Maria Perpétua Natalina',3,'2014-05-02','2016-04-14','colaborador'),(11,'Feliciana Margarida de Jesus',3,'2014-05-06','2016-07-02','colaborador'),(12,'Gláucia Almeida Pascoalino',3,'2012-08-25','2014-04-28','voluntário'),(13,'Carla Soares',3,'2012-08-28','2013-05-16','voluntário'),(14,'Angela Silveira',3,'2012-09-26','2013-05-03','voluntário'),(15,'Marcelo Souza',3,'2012-10-04','2015-06-08','voluntário'),(16,'Raimundo Oliveira',3,'2010-01-21','2012-12-23','voluntário'),(17,'Alicia Rosa',3,'2010-01-25','2016-12-16','voluntário'),(18,'Sandra Alvarenga',3,'2010-03-13','2017-05-12','voluntário'),(19,'José Castilho',3,'2011-07-09',NULL,'voluntário');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregados`
--

DROP TABLE IF EXISTS `empregados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregados` (
  `idEmpregado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `localizacao` int DEFAULT NULL,
  PRIMARY KEY (`idEmpregado`),
  KEY `fk_emp_loc` (`localizacao`),
  CONSTRAINT `fk_emp_loc` FOREIGN KEY (`localizacao`) REFERENCES `localizacao` (`idLocalizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregados`
--

LOCK TABLES `empregados` WRITE;
/*!40000 ALTER TABLE `empregados` DISABLE KEYS */;
INSERT INTO `empregados` VALUES (1,'Antônio Santos',1),(2,'Daniel Dias',2),(3,'Carlos Coelho ',3),(4,'Joaquim Fernandes',4),(5,'Estevão Garcia',5),(6,'Francisco Correia',6),(7,'Geraldo Silveira',6),(8,'Gabriel Neto',1),(9,'Júlia Coutinho',1),(10,'Jéssica Siqueira',1),(11,'Eduardo Neves',2),(12,'Caroline Gouvêa',2),(13,'Lucas Dornelas',2),(14,'Isadora Soares',3),(15,'Tiago Gomes',3),(16,'Maria Lima',4),(17,'Tatiana Cruz',4),(18,'Olivia Rosa',5),(19,'Arthur Leme',5),(20,'Paulo Silva',6),(21,'Estevão Duarte',6),(22,'Ester Abraão',6),(23,'Larissa Bretas',6),(24,'Lara Magalhaes',6),(25,'Mauro Pires',6);
/*!40000 ALTER TABLE `empregados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `idEspecie` int NOT NULL AUTO_INCREMENT,
  `nomeComum` varchar(50) DEFAULT NULL,
  `ordem` varchar(50) DEFAULT NULL,
  `idAlimentacao` int DEFAULT NULL,
  PRIMARY KEY (`idEspecie`),
  KEY `idAlimentacao` (`idAlimentacao`),
  CONSTRAINT `fk_esp_ali` FOREIGN KEY (`idAlimentacao`) REFERENCES `alimentacao` (`idAlimentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,'Macaco','	Primates',1),(2,'Zebra','Perissodactyla',1),(3,'Urso','Carnivora',3),(4,'Ornitorrinco','Monotremata',2),(5,'Leão','Carnivora',2),(6,'Elefante','Proboscidea',1),(7,'Girafa','Artiodactyla',1),(8,'Hipopótamo','Artiodactyla',1),(9,'Tigre','Carnivora',2),(10,'Arara','Psitaciformes',6),(11,'Crocodilo','Crocodylia',2),(12,'Sapo','Anura',4),(13,'Rinoceronte','Perissodactyla',1),(14,'Antílopes','Artiodactyla',1),(15,'Lobo','Carnivora',2),(16,'Foca','Carnivora',2),(17,'Raposa','Carnivora',2),(18,'Avestruz','Struthioniformes',3),(19,'Jabuti','Testudinata',3),(20,'Javali','Artiodactyla',3),(21,'Tatu','Cingulata',4),(22,'Camaleão','Squamata',4),(23,'Aranha','Araneae',4),(24,'Canário','Passeriformes',5),(25,'Papagaio,','Psittaciformes',5),(26,'Ésquilo','Rodentia',6),(27,'Turaco','Cuculiformes',6),(28,'Tucano','Piciformes',6);
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventoanimais`
--

DROP TABLE IF EXISTS `eventoanimais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventoanimais` (
  `idEventoAnimal` int NOT NULL AUTO_INCREMENT,
  `idAnimal` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipoEvento` int DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEventoAnimal`),
  KEY `idAnimal` (`idAnimal`),
  KEY `fk_mani_teve` (`tipoEvento`),
  CONSTRAINT `fk_mani_ani` FOREIGN KEY (`idAnimal`) REFERENCES `animais` (`idAnimal`) ON DELETE CASCADE,
  CONSTRAINT `fk_mani_teve` FOREIGN KEY (`tipoEvento`) REFERENCES `tipoeventos` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventoanimais`
--

LOCK TABLES `eventoanimais` WRITE;
/*!40000 ALTER TABLE `eventoanimais` DISABLE KEYS */;
INSERT INTO `eventoanimais` VALUES (1,1,'2018-01-16',2,'Precisará ir para uma clínica veterinária.'),(2,42,'2017-12-09',2,'Precisará realizar um procedimento cirúrgico.'),(3,59,'2018-01-06',2,'Necessitará de internação.'),(4,29,'2017-02-28',3,'Trasnferência para outro zoológico'),(5,21,'2017-03-30',3,'Trasnferência para outro zoológico'),(6,49,'2016-08-18',1,'Parto cirúrgico'),(7,11,'2014-06-24',4,'Falecimento'),(8,40,'2016-03-03',4,'Falecimento');
/*!40000 ALTER TABLE `eventoanimais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao` (
  `idLocalizacao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLocalizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
INSERT INTO `localizacao` VALUES (1,'estoque'),(2,'administração'),(3,'animais'),(4,'empregados'),(5,'veterinario'),(6,'cuidador');
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicacao`
--

DROP TABLE IF EXISTS `medicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicacao` (
  `idMedicacao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idMedicacao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicacao`
--

LOCK TABLES `medicacao` WRITE;
/*!40000 ALTER TABLE `medicacao` DISABLE KEYS */;
INSERT INTO `medicacao` VALUES (1,'vacinas'),(2,'analgesicos'),(3,'antitérmicos'),(4,'antiinflamatorios'),(5,'antibioticos'),(6,'sem_medicacao'),(7,'antialérgicos');
/*!40000 ALTER TABLE `medicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `idProvedor` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idProvedor` (`idProvedor`),
  CONSTRAINT `fk_produ_prov` FOREIGN KEY (`idProvedor`) REFERENCES `provedores` (`idProvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,' alimentacao',100),(2,2,' carne',300),(3,3,'Grãos e Sementes',500),(4,4,'Frutas',50);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedores`
--

DROP TABLE IF EXISTS `provedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedores` (
  `idProvedor` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT '0',
  `nome` varchar(50) DEFAULT NULL,
  `tipoSociedade` int DEFAULT NULL,
  `dataEntrada` date DEFAULT NULL,
  `dataSaida` date DEFAULT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idProvedor`),
  KEY `idCliente` (`idCliente`),
  KEY `fk_pro_soci` (`tipoSociedade`),
  CONSTRAINT `fk_pro_soci` FOREIGN KEY (`tipoSociedade`) REFERENCES `sociedades` (`idTipoSociedade`),
  CONSTRAINT `provedores_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedores`
--

LOCK TABLES `provedores` WRITE;
/*!40000 ALTER TABLE `provedores` DISABLE KEYS */;
INSERT INTO `provedores` VALUES (1,1,'Paz Verde',5,'2009-05-01',NULL,'comida para hebivoros'),(2,2,'SOS Animais',5,'2009-05-01',NULL,'comida para carnivoros'),(3,16,'Campanha Solidária',2,'2009-05-01',NULL,'comida para granívoros'),(4,7,'Ceasa',7,'2014-05-01',NULL,'comida para frugíveros');
/*!40000 ALTER TABLE `provedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociedades`
--

DROP TABLE IF EXISTS `sociedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sociedades` (
  `idTipoSociedade` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoSociedade`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociedades`
--

LOCK TABLES `sociedades` WRITE;
/*!40000 ALTER TABLE `sociedades` DISABLE KEYS */;
INSERT INTO `sociedades` VALUES (1,'fundacion'),(2,'SA'),(3,'Pessoa fisica'),(4,'organismo oficial'),(5,'ong'),(6,'SL'),(7,'outros');
/*!40000 ALTER TABLE `sociedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoeventos`
--

DROP TABLE IF EXISTS `tipoeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoeventos` (
  `idTipo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoeventos`
--

LOCK TABLES `tipoeventos` WRITE;
/*!40000 ALTER TABLE `tipoeventos` DISABLE KEYS */;
INSERT INTO `tipoeventos` VALUES (1,'parto'),(2,'enfermidade'),(3,'translado'),(4,'outros');
/*!40000 ALTER TABLE `tipoeventos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 20:26:23
