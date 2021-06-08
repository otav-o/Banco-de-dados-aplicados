CREATE DATABASE  IF NOT EXISTS `sistema_bancario` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sistema_bancario`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_bancario
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `numero_cliente` char(5) NOT NULL,
  `nome_cliente` varchar(20) DEFAULT NULL,
  `rua_cliente` varchar(30) DEFAULT NULL,
  `cidade_cliente` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`numero_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('11111','Carla Soares','Moraes Sarmento','Juiz de Fora','F'),('11112','Angela Silveira','Av. Sete de Setembro','Juiz de Fora','F'),('11122','Marcelo Souza','Padre Frederico','Juiz de Fora','M'),('11223','Raimundo Oliveira','Av. Itamar Franco','Juiz de Fora','M'),('22222','Alicia Rosa','Moraes e Castro','Juiz de Fora','F'),('22223','Sandra Alvarenga','Rei Alberto','Juiz de Fora','F'),('22233','José Castilho','Oscar Freire','Juiz de Fora','M'),('22334','Charles Otávio','São Mateus','Juiz de Fora','M'),('33333','Alice Ferreira','Ibitiguaia','Juiz de Fora','F'),('33334','Maria Tereza','Av. Santa Luzia','Juiz de Fora','F'),('33344','Silvio Albuquerque','Oscar Vidal','Juiz de Fora','M'),('33445','Margarida de Jesus','Pasteur','Juiz de Fora','F'),('44444','César Oswaldo','Haroldo Furtado Vidal','Juiz de Fora','M'),('44445','Iara Cristina','Porto das Flores','Juiz de Fora','F'),('44455','Alex Alves','Manoel Honório','Juiz de Fora','M'),('55555','Lúcia Mendes','João Saldanha','Juiz de Fora','F'),('55556','Adriane Santana','Av. Deusdedith Salgado','Juiz de Fora','F'),('55566','Matheus Reis','Padre Café','Juiz de Fora','M'),('55667','Argemiro Braga','Oswaldo Aranha','Juiz de Fora','M'),('66666','Tamara Jesus','Mariano Procópio','Juiz de Fora','F'),('66667','Laura Leme','Av. Itamar Franco','Juiz de Fora','F'),('66677','Gisele Almeida','Av. Costa e Silva','Juiz de Fora','F'),('66778','Joice Leite','Gil Horta','Juiz de Fora','M'),('77777','Adriana Alves','Olímpio Costa','Juiz de Fora','F'),('77778','Luisa Antunes','Braz Bernardino','Juiz de Fora','F'),('77788','Igor Magalhães','Prof. Cunha Figueiredo','Juiz de Fora','M'),('77889','Luiz de Paula','Av. Barão do Rio Branco','Juiz de Fora','M'),('88888','Mônica Nascimento','Vitorino Braga','Juiz de Fora','F'),('88889','Romero Santos','Av. Juscelino Kubitschek','Juiz de Fora','M'),('88899','Amélia Joaquina','Floriano Peixoto','Juiz de Fora','F'),('88990','Silvana Almeida','Santo Antônio','Juiz de Fora','F'),('99001','Rosa Miranda','Olegário Maciel','Juiz de Fora','F'),('99988','Aparecida Silva','Olavo Bilac','Juiz de Fora','F'),('99990','Ronaldo Leme','Av. Américo Lobo','Juiz de Fora','M'),('99999','Paulo Prudente','Paula Lima','Juiz de Fora','M');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `numero_conta` char(6) NOT NULL,
  `numero_agencia` char(5) DEFAULT NULL,
  `numero_cliente` char(5) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`numero_conta`),
  KEY `fc_cstr_2` (`numero_agencia`),
  KEY `fc_cstr_3` (`numero_cliente`),
  CONSTRAINT `fc_cstr_2` FOREIGN KEY (`numero_agencia`) REFERENCES `agencia` (`numero_agencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fc_cstr_3` FOREIGN KEY (`numero_cliente`) REFERENCES `cliente` (`numero_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES ('313131','12345','11111',2000.00),('323232','12345','11112',500.00),('333333','12345','11122',6000.00),('343434','12345','11223',10000.00),('353535','12345','22222',1500.00),('363636','12345','22223',600.00),('373737','12345','22334',1000.00),('383838','12345','22233',1200.00),('414141','23456','33333',-1500.00),('424242','23456','33334',200.00),('434343','23456','33344',8000.00),('444444','23456','33445',50000.00),('515151','34567','44444',150.00),('525252','34567','44445',-250.00),('535353','34567','44455',1030.24),('545454','34567','55555',226.82),('616161','45678','55556',329.45),('626262','45678','55566',32829.45),('636363','45678','55667',5821.00),('646464','45678','66666',78.53),('656565','45678','66667',6487.32),('717171','56789','66677',112.22),('727272','56789','66778',782.00),('737373','56789','77777',654.00),('747474','56789','77778',321.21),('757575','56789','77788',3200.00),('818181','67890','77889',6555.00),('828282','67890','88888',648.00),('838383','67890','88889',15000.00),('848484','67890','88899',12000.00),('858585','67890','88990',22000.00),('919191','78901','99001',47200.00),('929292','78901','99988',32000.00),('939393','78901','99990',3345.00),('949494','78901','99999',55000.00);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `numero_emprestimo` char(5) NOT NULL,
  `numero_agencia` char(5) DEFAULT NULL,
  `quantia` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`numero_emprestimo`),
  KEY `fc_cstr_1` (`numero_agencia`),
  CONSTRAINT `fc_cstr_1` FOREIGN KEY (`numero_agencia`) REFERENCES `agencia` (`numero_agencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES ('10000','12345',250.00),('10001','12345',500.00),('10002','23456',1000.00),('10003','34567',850.00),('10004','45678',600.00),('10005','45678',1200.00),('10006','56789',500.00),('10007','56789',2000.00),('10008','67890',650.00),('10009','67890',889.32),('10010','78901',550.00),('10011','78901',5000.00),('10012','12345',200.00),('10013','12345',550.00),('10014','45678',5500.00),('10015','67890',2000.00),('10016','78901',1550.00),('10017','34567',880.00),('10018','45678',900.00),('10019','78901',2600.00),('10020','78901',1000.00);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomador`
--

DROP TABLE IF EXISTS `tomador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomador` (
  `numero_cliente` char(5) NOT NULL,
  `numero_emprestimo` char(5) NOT NULL,
  PRIMARY KEY (`numero_cliente`,`numero_emprestimo`),
  KEY `fc_cstr_4` (`numero_emprestimo`),
  CONSTRAINT `fc_cstr_4` FOREIGN KEY (`numero_emprestimo`) REFERENCES `emprestimo` (`numero_emprestimo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fc_cstr_5` FOREIGN KEY (`numero_cliente`) REFERENCES `cliente` (`numero_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomador`
--

LOCK TABLES `tomador` WRITE;
/*!40000 ALTER TABLE `tomador` DISABLE KEYS */;
INSERT INTO `tomador` VALUES ('11111','10000'),('11112','10001'),('33344','10002'),('44455','10003'),('55667','10004'),('66667','10005'),('77777','10006'),('77788','10007'),('88888','10008'),('88899','10009'),('99990','10010'),('99999','10011'),('22223','10012'),('11223','10013'),('55566','10014'),('88899','10015'),('99001','10016'),('44445','10017'),('55667','10018'),('99990','10019'),('99988','10020');
/*!40000 ALTER TABLE `tomador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-07 17:02:51

create table agencia(
numero_agencia varchar(5) primary key,
nome_agencia varchar(15),
cidade_agencia varchar(30) 
);

alter table agencia change column nome_agencia nome varchar(15);
alter table agencia
modify column cidade_agencia varchar(25);

alter table cliente
add column uf char(2),
add column cpf decimal(11);
alter table cliente
add constraint cp unique(cpf),
modify sexo char(1) not null,
change column rua_cliente endereco varchar(30);  

alter table conta add column data_abertura date;
alter table conta add constraint numage foreign key(agencia) references agencia(numero_agencia)on delete cascade on update cascade;

alter table emprestimo
add column ano_emprestimo year(4) default 2017;

alter table emprestimo add constraint num_a foreign key(agencia) references agencia(numero_agencia)on delete cascade on update cascade;

alter table tomador add constraint num_e foreign key(emprestimo) references emprestimo(numero_emprestimo)on delete cascade on update cascade,
add constraint num_cl foreign key(cliente) references cliente(numero_cliente)on delete cascade on update cascade;








