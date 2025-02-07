-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ta23a
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) DEFAULT NULL,
  `sünniaeg` date DEFAULT NULL,
  `välimus` varchar(45) DEFAULT NULL,
  `Tall_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Hobune_Tall_idx` (`Tall_id`),
  CONSTRAINT `fk_Hobune_Tall` FOREIGN KEY (`Tall_id`) REFERENCES `tall` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune`
--

LOCK TABLES `hobune` WRITE;
/*!40000 ALTER TABLE `hobune` DISABLE KEYS */;
/*!40000 ALTER TABLE `hobune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobune_has_omanik`
--

DROP TABLE IF EXISTS `hobune_has_omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobune_has_omanik` (
  `Hobune_id` int unsigned NOT NULL,
  `Omanik_id` int unsigned NOT NULL,
  PRIMARY KEY (`Hobune_id`,`Omanik_id`),
  KEY `fk_Hobune_has_Omanik_Omanik1_idx` (`Omanik_id`),
  KEY `fk_Hobune_has_Omanik_Hobune1_idx` (`Hobune_id`),
  CONSTRAINT `fk_Hobune_has_Omanik_Hobune1` FOREIGN KEY (`Hobune_id`) REFERENCES `hobune` (`id`),
  CONSTRAINT `fk_Hobune_has_Omanik_Omanik1` FOREIGN KEY (`Omanik_id`) REFERENCES `omanik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune_has_omanik`
--

LOCK TABLES `hobune_has_omanik` WRITE;
/*!40000 ALTER TABLE `hobune_has_omanik` DISABLE KEYS */;
/*!40000 ALTER TABLE `hobune_has_omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omanik`
--

DROP TABLE IF EXISTS `omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omanik` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `eesnimi` varchar(45) DEFAULT NULL,
  `perekonnanimi` varchar(45) DEFAULT NULL,
  `aadress` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `aeg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omanik`
--

LOCK TABLES `omanik` WRITE;
/*!40000 ALTER TABLE `omanik` DISABLE KEYS */;
INSERT INTO `omanik` VALUES (123,'Martin','Pruus','Kolde-pst','555111222','2025-01-29 11:44:23');
/*!40000 ALTER TABLE `omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tall`
--

DROP TABLE IF EXISTS `tall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tall` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) DEFAULT NULL,
  `asukoht` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tall`
--

LOCK TABLES `tall` WRITE;
/*!40000 ALTER TABLE `tall` DISABLE KEYS */;
/*!40000 ALTER TABLE `tall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treener`
--

DROP TABLE IF EXISTS `treener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treener` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) DEFAULT NULL,
  `erialad` varchar(45) DEFAULT NULL,
  `kogemus` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `Treeningprogramm_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Treener_Treeningprogramm1_idx` (`Treeningprogramm_id`),
  CONSTRAINT `fk_Treener_Treeningprogramm1` FOREIGN KEY (`Treeningprogramm_id`) REFERENCES `treeningprogramm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treener`
--

LOCK TABLES `treener` WRITE;
/*!40000 ALTER TABLE `treener` DISABLE KEYS */;
/*!40000 ALTER TABLE `treener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treening`
--

DROP TABLE IF EXISTS `treening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treening` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kuupäev` datetime DEFAULT NULL,
  `treeningut_üüp` varchar(45) DEFAULT NULL,
  `kestus` varchar(45) DEFAULT NULL,
  `eesmärk` varchar(45) DEFAULT NULL,
  `Hobune_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Treening_Hobune1_idx` (`Hobune_id`),
  CONSTRAINT `fk_Treening_Hobune1` FOREIGN KEY (`Hobune_id`) REFERENCES `hobune` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treening`
--

LOCK TABLES `treening` WRITE;
/*!40000 ALTER TABLE `treening` DISABLE KEYS */;
/*!40000 ALTER TABLE `treening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeningprogramm`
--

DROP TABLE IF EXISTS `treeningprogramm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeningprogramm` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) DEFAULT NULL,
  `kirjeldus` varchar(45) DEFAULT NULL,
  `kestus` datetime DEFAULT NULL,
  `treeningu arv nädalas` varchar(45) DEFAULT NULL,
  `Treening_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Treeningprogramm_Treening1_idx` (`Treening_id`),
  CONSTRAINT `fk_Treeningprogramm_Treening1` FOREIGN KEY (`Treening_id`) REFERENCES `treening` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeningprogramm`
--

LOCK TABLES `treeningprogramm` WRITE;
/*!40000 ALTER TABLE `treeningprogramm` DISABLE KEYS */;
/*!40000 ALTER TABLE `treeningprogramm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varustus`
--

DROP TABLE IF EXISTS `varustus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varustus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `varustus_tüüp` varchar(45) DEFAULT NULL,
  `hind` varchar(45) DEFAULT NULL,
  `aeg` datetime DEFAULT NULL,
  `Varustuscol` varchar(45) DEFAULT NULL,
  `Hobune_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Varustus_Hobune1_idx` (`Hobune_id`),
  CONSTRAINT `fk_Varustus_Hobune1` FOREIGN KEY (`Hobune_id`) REFERENCES `hobune` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varustus`
--

LOCK TABLES `varustus` WRITE;
/*!40000 ALTER TABLE `varustus` DISABLE KEYS */;
/*!40000 ALTER TABLE `varustus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ta23a'
--

--
-- Dumping routines for database 'ta23a'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-29 13:46:52
