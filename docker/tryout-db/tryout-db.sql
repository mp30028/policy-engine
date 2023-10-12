-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tryout-db
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
-- Table structure for table `t_attribute`
--

DROP TABLE IF EXISTS `t_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_attribute`
--

LOCK TABLES `t_attribute` WRITE;
/*!40000 ALTER TABLE `t_attribute` DISABLE KEYS */;
INSERT INTO `t_attribute` VALUES (1,'original-filename','Original filename of the uploaded file. If for some reason not available then will default to some fixed default value by the application'),(2,'origin','Some way to signal where the file being stored orginated from'),(3,'owner','Identity of the user or system that is granted ownership of the file'),(4,'file-type','The type of the file, i.e. the file extension');
/*!40000 ALTER TABLE `t_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_attribute_value`
--

DROP TABLE IF EXISTS `t_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_attribute_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stored_file_policy_id` int NOT NULL,
  `policy_attribute_id` int NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_policy_attribute__attribute_value_idx` (`policy_attribute_id`),
  KEY `fk_stored_file_policy__attribute_value_idx` (`stored_file_policy_id`),
  CONSTRAINT `fk_policy_attribute__attribute_value` FOREIGN KEY (`policy_attribute_id`) REFERENCES `t_policy_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stored_file_policy__attribute_value` FOREIGN KEY (`stored_file_policy_id`) REFERENCES `t_stored_file_policy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_attribute_value`
--

LOCK TABLES `t_attribute_value` WRITE;
/*!40000 ALTER TABLE `t_attribute_value` DISABLE KEYS */;
INSERT INTO `t_attribute_value` VALUES (1,1,1,'dummy-test-file.txt'),(2,1,2,'direct db input'),(3,1,3,'mp30028'),(4,1,4,'txt');
/*!40000 ALTER TABLE `t_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_policy`
--

DROP TABLE IF EXISTS `t_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `policy` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`policy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_policy`
--

LOCK TABLES `t_policy` WRITE;
/*!40000 ALTER TABLE `t_policy` DISABLE KEYS */;
INSERT INTO `t_policy` VALUES (1,'default','Policy that is applied to all files that do not have one explicitly assigned');
/*!40000 ALTER TABLE `t_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_policy_attribute`
--

DROP TABLE IF EXISTS `t_policy_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_policy_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `policy_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_policy__policy_attribute_idx` (`policy_id`),
  KEY `fk_attribute__policy_attribute_idx` (`attribute_id`),
  CONSTRAINT `fk_attribute__policy_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `t_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_policy__policy_attribute` FOREIGN KEY (`policy_id`) REFERENCES `t_policy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_policy_attribute`
--

LOCK TABLES `t_policy_attribute` WRITE;
/*!40000 ALTER TABLE `t_policy_attribute` DISABLE KEYS */;
INSERT INTO `t_policy_attribute` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
/*!40000 ALTER TABLE `t_policy_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_stored_file`
--

DROP TABLE IF EXISTS `t_stored_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_stored_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storage_id` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storage_id_UNIQUE` (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_stored_file`
--

LOCK TABLES `t_stored_file` WRITE;
/*!40000 ALTER TABLE `t_stored_file` DISABLE KEYS */;
INSERT INTO `t_stored_file` VALUES (1,'001','2023-10-10 10:22:33','mp30028',NULL,NULL),(2,'002','2023-10-10 12:09:13','mp30028',NULL,NULL);
/*!40000 ALTER TABLE `t_stored_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_stored_file_policy`
--

DROP TABLE IF EXISTS `t_stored_file_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_stored_file_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stored_file_id` int NOT NULL,
  `policy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stored_file__stored_file_policy_idx` (`stored_file_id`),
  KEY `fk_policy__stored_file_policy_idx` (`policy_id`),
  CONSTRAINT `fk_policy__stored_file_policy` FOREIGN KEY (`policy_id`) REFERENCES `t_policy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stored_file__stored_file_policy` FOREIGN KEY (`stored_file_id`) REFERENCES `t_stored_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_stored_file_policy`
--

LOCK TABLES `t_stored_file_policy` WRITE;
/*!40000 ALTER TABLE `t_stored_file_policy` DISABLE KEYS */;
INSERT INTO `t_stored_file_policy` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `t_stored_file_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_stored_file_policy_attributes_and_values`
--

DROP TABLE IF EXISTS `vw_stored_file_policy_attributes_and_values`;
/*!50001 DROP VIEW IF EXISTS `vw_stored_file_policy_attributes_and_values`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stored_file_policy_attributes_and_values` AS SELECT 
 1 AS `file_id`,
 1 AS `storage_id`,
 1 AS `policy_id`,
 1 AS `policy`,
 1 AS `attribute_id`,
 1 AS `attribute`,
 1 AS `stored_file_policy_id`,
 1 AS `policy_attribute_id`,
 1 AS `attribute_value_id`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'tryout-db'
--

--
-- Dumping routines for database 'tryout-db'
--

--
-- Final view structure for view `vw_stored_file_policy_attributes_and_values`
--

/*!50001 DROP VIEW IF EXISTS `vw_stored_file_policy_attributes_and_values`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stored_file_policy_attributes_and_values` AS select `sf`.`id` AS `file_id`,`sf`.`storage_id` AS `storage_id`,`p`.`id` AS `policy_id`,`p`.`policy` AS `policy`,`a`.`id` AS `attribute_id`,`a`.`attribute` AS `attribute`,`sfp`.`id` AS `stored_file_policy_id`,`pa`.`id` AS `policy_attribute_id`,`av`.`id` AS `attribute_value_id`,`av`.`value` AS `value` from (((((`t_stored_file` `sf` join `t_stored_file_policy` `sfp` on((`sf`.`id` = `sfp`.`stored_file_id`))) join `t_policy` `p` on((`p`.`id` = `sfp`.`policy_id`))) join `t_policy_attribute` `pa` on((`p`.`id` = `pa`.`policy_id`))) join `t_attribute` `a` on((`a`.`id` = `pa`.`attribute_id`))) left join `t_attribute_value` `av` on(((`pa`.`id` = `av`.`policy_attribute_id`) and (`sfp`.`id` = `av`.`stored_file_policy_id`)))) order by `sf`.`id`,`a`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 22:56:46
