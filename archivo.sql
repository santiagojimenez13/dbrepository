-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bdrh
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `departamento_id` int NOT NULL AUTO_INCREMENT,
  `departamento_nombre` varchar(30) DEFAULT NULL,
  `ubicacion_id` int DEFAULT NULL,
  PRIMARY KEY (`departamento_id`),
  KEY `ubicacion_id` (`ubicacion_id`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`ubicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (111,'Cundinamarca',100),(112,'Comunidad de Madrid',200),(113,'departamento de kolda',300),(114,'ventas',400);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependientes`
--

DROP TABLE IF EXISTS `dependientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependientes` (
  `dependiente_id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `vinculo` varchar(25) DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  PRIMARY KEY (`dependiente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `dependientes_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependientes`
--

LOCK TABLES `dependientes` WRITE;
/*!40000 ALTER TABLE `dependientes` DISABLE KEYS */;
INSERT INTO `dependientes` VALUES (555,'Santiago','Jimenez Diaz','Familiar',12345),(556,'Stefany','Vargas Lopez','Familiar',12346),(557,'Brian','Guzman Rios','Familiar',12347);
/*!40000 ALTER TABLE `dependientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(20) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numero_telefono` varchar(20) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `trabajo_id` int DEFAULT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `gerencia_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `trabajo_id` (`trabajo_id`),
  KEY `gerencia_id` (`gerencia_id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajos` (`trabajo_id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`gerencia_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (12345,'Juan','Guzman Garces','juan.gar12@gmail.com','3125555444','2023-01-16',1000,1.00,12345,111),(12346,'Luis','torres torres','luis.t2@gmail.com','3125555666','2021-01-14',2000,2.00,12345,112),(12347,'Angel','perez perez','angel.p1@gmail.com','3125555777','2022-04-12',3000,3.00,12345,113);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` char(2) NOT NULL,
  `region_id` int DEFAULT NULL,
  `pais_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pais_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `paises_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('1',10,'Colombia'),('2',20,'España'),('3',30,'Senegal'),('4',40,'Senegal');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones` (
  `region_id` int NOT NULL,
  `region_nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (10,'America'),(20,'Europa'),(30,'Africa'),(40,'Africa');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajos`
--

DROP TABLE IF EXISTS `trabajos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajos` (
  `trabajo_id` int NOT NULL AUTO_INCREMENT,
  `trabajo_nombre` varchar(35) DEFAULT NULL,
  `salario_min` decimal(8,2) DEFAULT NULL,
  `salario_max` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`trabajo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajos`
--

LOCK TABLES `trabajos` WRITE;
/*!40000 ALTER TABLE `trabajos` DISABLE KEYS */;
INSERT INTO `trabajos` VALUES (1000,'ingenieria',2.00,10.00),(2000,'administracion',1.00,10.00),(3000,'arquitectura',3.00,10.00);
/*!40000 ALTER TABLE `trabajos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `ubicacion_id` int NOT NULL AUTO_INCREMENT,
  `direcion` varchar(40) DEFAULT NULL,
  `codigo_postal` varchar(12) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `estado_provincia` varchar(25) DEFAULT NULL,
  `pais_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`ubicacion_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (100,'Calle 42 # 15-34 bogota','1111xx','bogota','sabana occidente','1'),(200,'Calle 32 # 15-34 Madrid','28001','Madrid','Pontevedra ','2'),(300,'Calle 22 # 15-34 kolda','+221','Kolda','africa occidental','3'),(400,'Calle 25 # 15-34 kolda','+221','Kolda','africa occidental','4');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-12  7:25:07
