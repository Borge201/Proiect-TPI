-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sali_sport
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `abonamente`
--

DROP TABLE IF EXISTS `abonamente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonamente` (
  `idAbonamente` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `expDate` date NOT NULL,
  `intrare` int DEFAULT NULL,
  `Antrenor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAbonamente`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`),
  UNIQUE KEY `idAbonamente_UNIQUE` (`idAbonamente`),
  CONSTRAINT `fk_Abonamente_1` FOREIGN KEY (`idClient`) REFERENCES `clienti` (`idClienti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonamente`
--

LOCK TABLES `abonamente` WRITE;
/*!40000 ALTER TABLE `abonamente` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonamente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `idClienti` int NOT NULL AUTO_INCREMENT,
  `emailClienti` varchar(45) NOT NULL,
  `passClienti` varchar(45) NOT NULL,
  `twoFact` varchar(45) DEFAULT NULL,
  `idPlanFit` int DEFAULT NULL,
  PRIMARY KEY (`idClienti`),
  UNIQUE KEY `idClienti_UNIQUE` (`idClienti`),
  UNIQUE KEY `emailClienti_UNIQUE` (`emailClienti`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'gigel@gmail.com','1234','-1',-1),(2,'andrei@yea','4321','-1',1);
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabnutritional`
--

DROP TABLE IF EXISTS `tabnutritional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabnutritional` (
  `idNutritie` int NOT NULL AUTO_INCREMENT,
  `numeAliment` varchar(45) DEFAULT NULL,
  `caloriiAliment` int DEFAULT NULL,
  `proteineAliment` float DEFAULT NULL,
  `carbAliment` float DEFAULT NULL,
  `grasimiAliment` float DEFAULT NULL,
  `cantZahar` float DEFAULT NULL,
  PRIMARY KEY (`idNutritie`),
  UNIQUE KEY `idNutritie_UNIQUE` (`idNutritie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabnutritional`
--

LOCK TABLES `tabnutritional` WRITE;
/*!40000 ALTER TABLE `tabnutritional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabnutritional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07  6:07:32
