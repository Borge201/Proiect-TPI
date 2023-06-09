-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: Sali_Sport
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `Abonamente`
--

DROP TABLE IF EXISTS `Abonamente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Abonamente` (
  `idAbonamente` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `expDate` date NOT NULL,
  `intrare` int DEFAULT NULL,
  `Antrenor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAbonamente`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`),
  UNIQUE KEY `idAbonamente_UNIQUE` (`idAbonamente`),
  CONSTRAINT `fk_Abonamente_1` FOREIGN KEY (`idClient`) REFERENCES `Clienti` (`idClienti`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abonamente`
--

LOCK TABLES `Abonamente` WRITE;
/*!40000 ALTER TABLE `Abonamente` DISABLE KEYS */;
INSERT INTO `Abonamente` VALUES (1,1,'2023-06-20',30,'Fara Antrenor'),(4,2,'2023-06-20',30,'Fara Antrenor'),(6,7,'2024-06-08',365,'Antrenor 2');
/*!40000 ALTER TABLE `Abonamente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clienti`
--

DROP TABLE IF EXISTS `Clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clienti` (
  `idClienti` int NOT NULL AUTO_INCREMENT,
  `emailClienti` varchar(45) NOT NULL,
  `passClienti` varchar(45) NOT NULL,
  `twoFact` int DEFAULT '-1',
  `idPlanFit` int DEFAULT '-1',
  `isAdmin` int DEFAULT '-1',
  PRIMARY KEY (`idClienti`),
  UNIQUE KEY `idClienti_UNIQUE` (`idClienti`),
  UNIQUE KEY `emailClienti_UNIQUE` (`emailClienti`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clienti`
--

LOCK TABLES `Clienti` WRITE;
/*!40000 ALTER TABLE `Clienti` DISABLE KEYS */;
INSERT INTO `Clienti` VALUES (1,'gigel@gmail.com','1234',-1,-1,-1),(2,'Horia@hh.mail','1234',-1,-1,-1),(3,'jijiji','1234',-1,-1,-1),(5,'exemplu@mail.com','12345',-1,-1,-1),(7,'ex','ex',-1,-1,-1),(8,'abcd','abcd',-1,-1,-1),(10,'ab','ab',-1,-1,1);
/*!40000 ALTER TABLE `Clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabNutritional`
--

DROP TABLE IF EXISTS `tabNutritional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabNutritional` (
  `idNutritional` int NOT NULL AUTO_INCREMENT,
  `numeAliment` varchar(45) DEFAULT NULL,
  `caloriiAliment` float DEFAULT NULL,
  `proteineAliment` float DEFAULT NULL,
  `grasimiAliment` float DEFAULT NULL,
  `carbAliment` float DEFAULT NULL,
  `zaharAliment` float DEFAULT NULL,
  PRIMARY KEY (`idNutritional`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabNutritional`
--

LOCK TABLES `tabNutritional` WRITE;
/*!40000 ALTER TABLE `tabNutritional` DISABLE KEYS */;
INSERT INTO `tabNutritional` VALUES (1,'gggg',NULL,NULL,NULL,NULL,NULL),(3,'gggggggg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tabNutritional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 13:46:44
