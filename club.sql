-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: club_del_barril
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `telefonocliente` int(11) NOT NULL,
  `nombrecliente` varchar(30) DEFAULT NULL,
  `direccioncliente` varchar(30) DEFAULT NULL,
  `cedulacliente` int(11) DEFAULT NULL,
  `ciudad` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`telefonocliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (8163654,'Andres Mora','calle 50 No 12 - 44',98568322,'Caldas'),(8262367,'Carlos Amaya','calle 51 No 38 - 15',97855364,'Medellin'),(8360954,'Carolina Mejia','calle 17 No 18 - 52',98755634,'Cali'),(8470513,'Laura Castro','calle 12 No 24 - 44',53768322,'Cartagena'),(8472367,'Pedro Ramirez','calle 23 No 23 - 24',95886322,'Bogota'),(8473276,'Francisco Muriel','calle 10 No 21 - 24',89568322,'Cartagena'),(8660369,'Daniela Robles','calle 20 No 32 - 34',96858232,'Barranquilla'),(8660596,'Mario Arias','calle 4 No 38 - 15',97855364,'Santa Marta'),(8666345,'Marta Cortes','calle 11 No 8 - 15',95875364,'Santa Marta'),(8666723,'Fabian Castillo','calle 31 No 28 - 05',47855364,'Medellin');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleproducto`
--

DROP TABLE IF EXISTS `detalleproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleproducto` (
  `descripción` varchar(30) NOT NULL,
  `código` varchar(20) NOT NULL,
  `valorunitario` int(11) DEFAULT NULL,
  PRIMARY KEY (`descripción`),
  KEY `Fk_detalleproducto` (`código`),
  CONSTRAINT `Fk_detalleproducto` FOREIGN KEY (`código`) REFERENCES `productos` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleproducto`
--

LOCK TABLES `detalleproducto` WRITE;
/*!40000 ALTER TABLE `detalleproducto` DISABLE KEYS */;
INSERT INTO `detalleproducto` VALUES ('Aguardiente Antioqueño','4200',30000),('Cerveza Clásica','3500',2500),('Cerveza Lata','4101',2500),('Cerveza Light','3501',2000),('Gatorade','3905',3000),('Pasabocas','4100',3000),('Ron Medellín cinco años','4201',45000),('Vino Blanco Espumoso','3600',32000),('Vino Espumoso Rosado','3701',32000),('Whisky Sello Rojo','3800',70000);
/*!40000 ALTER TABLE `detalleproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `numeroorden` int(11) NOT NULL,
  `fechaorden` datetime DEFAULT NULL,
  `telefonocliente` int(11) NOT NULL,
  PRIMARY KEY (`numeroorden`),
  KEY `Fk_clientes` (`telefonocliente`),
  CONSTRAINT `Fk_clientes` FOREIGN KEY (`telefonocliente`) REFERENCES `clientes` (`telefonocliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1000001,'2009-10-27 00:00:00',8163654),(1000002,'2009-07-31 00:00:00',8262367),(1000003,'2010-11-15 00:00:00',8472367),(1000004,'2010-05-20 00:00:00',8360954),(1000005,'2010-10-23 00:00:00',8660369),(1000006,'2009-10-02 00:00:00',8666345),(1000007,'2009-01-27 00:00:00',8473276),(1000008,'2009-11-21 00:00:00',8666723),(1000009,'2010-08-23 00:00:00',8470513),(1000010,'2010-10-27 00:00:00',8660596);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `numeroorden` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `categoría` varchar(40) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Fk_productos` (`numeroorden`),
  CONSTRAINT `Fk_productos` FOREIGN KEY (`numeroorden`) REFERENCES `pedidos` (`numeroorden`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1000001,'3500','Cerveza Clásica',30),(1000002,'3501','Cerveza Light',20),(1000003,'3600','Vino Blanco',5),(1000004,'3701','Vino Rosado',4),(1000005,'3800','Whisky',15),(1000006,'3905','Gatorade',40),(1000007,'4100','Pasabocas',100),(1000008,'4101','Cerveza Lata',40),(1000009,'4200','Aguardiente',25),(1000010,'4201','Ron',60);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18 20:29:25
