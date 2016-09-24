-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: isutar
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

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
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (1,'技術職員','testuser3','2016-09-24 16:26:25'),(2,'技術職員','testuser3','2016-09-24 16:26:26'),(3,'技術職員','testuser3','2016-09-24 16:26:26'),(4,'技術職員','testuser3','2016-09-24 16:26:27'),(5,'技術職員','testuser3','2016-09-24 16:26:27'),(6,'技術職員','testuser3','2016-09-24 16:26:28'),(7,'技術職員','testuser3','2016-09-24 16:26:28'),(8,'技術職員','testuser3','2016-09-24 16:26:28'),(9,'技術職員','testuser3','2016-09-24 16:26:28'),(10,'技術職員','testuser3','2016-09-24 16:26:28'),(11,'技術職員','testuser3','2016-09-24 16:26:29'),(12,'技術職員','testuser3','2016-09-24 16:26:29'),(13,'技術職員','testuser3','2016-09-24 16:26:29'),(14,'トマト','testuser1','2016-09-24 17:40:08'),(15,'トマト','testuser1','2016-09-24 17:40:09'),(16,'トマト','testuser1','2016-09-24 17:40:10'),(17,'トマト','testuser1','2016-09-24 17:40:11');
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-24 18:46:46
