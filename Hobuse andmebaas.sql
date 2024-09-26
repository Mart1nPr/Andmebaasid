-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: hobused
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `hobune`
--

DROP TABLE IF EXISTS `hobune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobune` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Birthdate` date NOT NULL,
  `OwnerID` bigint unsigned NOT NULL,
  `TallID` bigint unsigned NOT NULL,
  `VarustusID` bigint unsigned NOT NULL,
  `TervislikSeisundiID` bigint unsigned NOT NULL,
  `TreeningID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hobune_varustusid_foreign` (`VarustusID`),
  KEY `hobune_ownerid_foreign` (`OwnerID`),
  KEY `hobune_tervislikseisundiid_foreign` (`TervislikSeisundiID`),
  KEY `hobune_treeningid_foreign` (`TreeningID`),
  KEY `hobune_tallid_foreign` (`TallID`),
  CONSTRAINT `hobune_ownerid_foreign` FOREIGN KEY (`OwnerID`) REFERENCES `omanik` (`id`),
  CONSTRAINT `hobune_tallid_foreign` FOREIGN KEY (`TallID`) REFERENCES `tall` (`id`),
  CONSTRAINT `hobune_tervislikseisundiid_foreign` FOREIGN KEY (`TervislikSeisundiID`) REFERENCES `tervislik seisund` (`id`),
  CONSTRAINT `hobune_treeningid_foreign` FOREIGN KEY (`TreeningID`) REFERENCES `treeninggraafik` (`id`),
  CONSTRAINT `hobune_varustusid_foreign` FOREIGN KEY (`VarustusID`) REFERENCES `varustus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune`
--

LOCK TABLES `hobune` WRITE;
/*!40000 ALTER TABLE `hobune` DISABLE KEYS */;
/*!40000 ALTER TABLE `hobune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omanik`
--

DROP TABLE IF EXISTS `omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omanik` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omanik`
--

LOCK TABLES `omanik` WRITE;
/*!40000 ALTER TABLE `omanik` DISABLE KEYS */;
/*!40000 ALTER TABLE `omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tall`
--

DROP TABLE IF EXISTS `tall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tall` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Talliboksi number` varchar(255) NOT NULL,
  `TöötajadID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tall_töötajadid_foreign` (`TöötajadID`),
  CONSTRAINT `tall_töötajadid_foreign` FOREIGN KEY (`TöötajadID`) REFERENCES `töötajad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tall`
--

LOCK TABLES `tall` WRITE;
/*!40000 ALTER TABLE `tall` DISABLE KEYS */;
/*!40000 ALTER TABLE `tall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tervislik seisund`
--

DROP TABLE IF EXISTS `tervislik seisund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tervislik seisund` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Arsti ajalugu` date NOT NULL,
  `Vaktsineerimised` date NOT NULL,
  `Ravikuurid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tervislik seisund`
--

LOCK TABLES `tervislik seisund` WRITE;
/*!40000 ALTER TABLE `tervislik seisund` DISABLE KEYS */;
/*!40000 ALTER TABLE `tervislik seisund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeninggraafik`
--

DROP TABLE IF EXISTS `treeninggraafik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeninggraafik` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Päev` bigint NOT NULL,
  `Kava` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeninggraafik`
--

LOCK TABLES `treeninggraafik` WRITE;
/*!40000 ALTER TABLE `treeninggraafik` DISABLE KEYS */;
/*!40000 ALTER TABLE `treeninggraafik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `töötajad`
--

DROP TABLE IF EXISTS `töötajad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `töötajad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(255) NOT NULL,
  `Telefoni number` varchar(255) NOT NULL,
  `Ajakava` date NOT NULL,
  `Palk` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `töötajad`
--

LOCK TABLES `töötajad` WRITE;
/*!40000 ALTER TABLE `töötajad` DISABLE KEYS */;
/*!40000 ALTER TABLE `töötajad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varustus`
--

DROP TABLE IF EXISTS `varustus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varustus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Hobuse varustus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varustus`
--

LOCK TABLES `varustus` WRITE;
/*!40000 ALTER TABLE `varustus` DISABLE KEYS */;
/*!40000 ALTER TABLE `varustus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26  9:40:41
