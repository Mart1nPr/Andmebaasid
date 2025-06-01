-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jalgpall
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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id` int NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `stadium` varchar(45) DEFAULT NULL,
  `createat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Tallinn','FC Tallinn','A. Le Coq Arena','2025-02-05 13:58:20'),(2,'Riga','FC Riga','Daugava Stadium','2025-02-05 13:58:20');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` int NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `Country_id` int NOT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Couch_Country1_idx` (`Country_id`),
  CONSTRAINT `fk_Couch_Country1` FOREIGN KEY (`Country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (123,'Martin','Pruus',1,'2025-02-09 18:26:52');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_has_club`
--

DROP TABLE IF EXISTS `coach_has_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_has_club` (
  `Coach_id` int NOT NULL,
  `Club_id` int NOT NULL,
  PRIMARY KEY (`Coach_id`,`Club_id`),
  KEY `fk_Couch_has_Club_Club1_idx` (`Club_id`),
  KEY `fk_Couch_has_Club_Couch1_idx` (`Coach_id`),
  CONSTRAINT `fk_Couch_has_Club_Club1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Couch_has_Club_Couch1` FOREIGN KEY (`Coach_id`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_has_club`
--

LOCK TABLES `coach_has_club` WRITE;
/*!40000 ALTER TABLE `coach_has_club` DISABLE KEYS */;
INSERT INTO `coach_has_club` VALUES (123,1),(123,2);
/*!40000 ALTER TABLE `coach_has_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'EST','Eesti','2025-02-05 13:58:22'),(2,'LAT','Läti','2025-02-05 13:58:22');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation` (
  `id` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` VALUES (1,'4-4-2','2025-02-09 18:31:33'),(2,'4-3-3','2025-02-09 18:31:33');
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` int NOT NULL,
  `homeclub` varchar(45) DEFAULT NULL,
  `foreignclub` varchar(45) DEFAULT NULL,
  `homescore` int DEFAULT NULL,
  `foreignscore` int DEFAULT NULL,
  `homeformation` varchar(45) DEFAULT NULL,
  `foreignformation` varchar(45) DEFAULT NULL,
  `gametime` datetime DEFAULT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (123,'1','2',2,1,'1','2','2024-02-10 18:00:00','2025-02-09 18:29:46');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameplayer`
--

DROP TABLE IF EXISTS `gameplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameplayer` (
  `Game_id` int NOT NULL,
  `Player_id` int NOT NULL,
  KEY `fk_Gameplayer_Game1_idx` (`Game_id`),
  KEY `fk_Gameplayer_Player1_idx` (`Player_id`),
  CONSTRAINT `fk_Gameplayer_Game1` FOREIGN KEY (`Game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_Gameplayer_Player1` FOREIGN KEY (`Player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameplayer`
--

LOCK TABLES `gameplayer` WRITE;
/*!40000 ALTER TABLE `gameplayer` DISABLE KEYS */;
INSERT INTO `gameplayer` VALUES (123,1),(123,2),(123,3),(123,4),(123,5),(123,6);
/*!40000 ALTER TABLE `gameplayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `Country_id` int NOT NULL,
  `Club_id` int NOT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Player_Country_idx` (`Country_id`),
  KEY `fk_Player_Club1_idx` (`Club_id`),
  CONSTRAINT `fk_Player_Club1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Player_Country` FOREIGN KEY (`Country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Märt','Kask',50000,1,1,'2025-02-05 13:58:26'),(2,'Mihkel','Tamm',60000,2,1,'2025-02-05 13:58:26'),(3,'Laura','Pärn',55000,1,2,'2025-02-05 13:58:26'),(4,'Anna','Eensalu',70000,2,2,'2025-02-05 13:58:26'),(5,'Jüri','Saar',48000,1,1,'2025-02-05 13:58:26'),(6,'Kert','Jõgi',45000,2,1,'2025-02-05 13:58:26');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jalgpall'
--

--
-- Dumping routines for database 'jalgpall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-09 18:49:22
