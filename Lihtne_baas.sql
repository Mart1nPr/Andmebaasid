-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lihtne_baas
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
-- Table structure for table `meeskonnad`
--

DROP TABLE IF EXISTS `meeskonnad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeskonnad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) NOT NULL,
  `coach_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeskonnad_coach_id_index` (`coach_id`),
  CONSTRAINT `meeskonnad_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `treenerid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeskonnad`
--

LOCK TABLES `meeskonnad` WRITE;
/*!40000 ALTER TABLE `meeskonnad` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeskonnad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mängijad`
--

DROP TABLE IF EXISTS `mängijad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mängijad` (
  `player_id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `team_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `mängijad_team_id_index` (`team_id`),
  KEY `mängijad_role_id_index` (`role_id`),
  CONSTRAINT `mängijad_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `mängijate rollid` (`id`),
  CONSTRAINT `mängijad_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `meeskonnad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mängijad`
--

LOCK TABLES `mängijad` WRITE;
/*!40000 ALTER TABLE `mängijad` DISABLE KEYS */;
/*!40000 ALTER TABLE `mängijad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mängijate rollid`
--

DROP TABLE IF EXISTS `mängijate rollid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mängijate rollid` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Attack` varchar(255) NOT NULL,
  `Half-defense` varchar(255) NOT NULL,
  `Defense` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mängijate rollid`
--

LOCK TABLES `mängijate rollid` WRITE;
/*!40000 ALTER TABLE `mängijate rollid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mängijate rollid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treenerid`
--

DROP TABLE IF EXISTS `treenerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treenerid` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treenerid`
--

LOCK TABLES `treenerid` WRITE;
/*!40000 ALTER TABLE `treenerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `treenerid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 10:11:03
