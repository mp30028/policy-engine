SET FOREIGN_KEY_CHECKS=0;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: policy-engine-db
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
-- Table structure for table `_CHANGES`
--

DROP TABLE IF EXISTS `_CHANGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CHANGES` (
  `id` int NOT NULL,
  `script_type` varchar(45) NOT NULL COMMENT 'Should  only contain "INFO" or "CHANGE"',
  `description` varchar(1000) NOT NULL,
  `sql_script` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CHANGES`
--

LOCK TABLES `_CHANGES` WRITE;
/*!40000 ALTER TABLE `_CHANGES` DISABLE KEYS */;
INSERT INTO `_CHANGES` VALUES (100,'INFO','Before Delete: Script to get record counts. Useful for understanding the impact of changes','set @asset_count = (select concat(\'asset_count=\', count(*))  from t_asset);\nset @asset_type_count = (select concat(\' asset_type_count=\', count(*)) from t_asset_type);\nset @policy_count = (select concat(\' policy_count=\', count(*)) from t_policy);\nset @attribute_count = (select concat(\' attribute_count=\', count(*)) from t_attribute);\nset @asset_type_policy_count = (select concat(\' asset_type_policy_count=\', count(*)) from t_asset_type_policy);\nset @policy_attribute_count = (select concat(\' policy_attribute_count=\', count(*)) from t_policy_attribute);\nset @attribute_value_count = (select concat(\' attribute_value_count=\', count(*)) from t_attribute_value);\n\n\nselect  concat(\'-- Before Delete: \', @asset_count, @asset_type_count, @policy_count, @attribute_count, @asset_type_policy_count, @policy_attribute_count, @attribute_value_count) as \'LOG\'\n\n'),(110,'INFO','After Delete: Script to get record counts. Useful for understanding the impact of changes','set @asset_count = (select concat(\'asset_count=\', count(*))  from t_asset);\n set @asset_type_count = (select concat(\' asset_type_count=\', count(*)) from t_asset_type);\n set @policy_count = (select concat(\' policy_count=\', count(*)) from t_policy);\n set @attribute_count = (select concat(\' attribute_count=\', count(*)) from t_attribute);\n set @asset_type_policy_count = (select concat(\' asset_type_policy_count=\', count(*)) from t_asset_type_policy);\n set @policy_attribute_count = (select concat(\' policy_attribute_count=\', count(*)) from t_policy_attribute);\n set @attribute_value_count = (select concat(\' attribute_value_count=\', count(*)) from t_attribute_value);\n \n \n select  concat(\'-- After Delete: \', @asset_count, @asset_type_count, @policy_count, @attribute_count, @asset_type_policy_count, @policy_attribute_count, @attribute_value_count) as \'LOG\'\n \n '),(200,'CHANGE','change foreign key constraint on t_asset from ON DELETE CASCADE to ON DELETE SET NULL','ALTER TABLE `t_asset` \nDROP FOREIGN KEY `fk_asset__asset-type-id`;\nALTER TABLE `t_asset` \nADD CONSTRAINT `fk_asset__asset-type-id`\n  FOREIGN KEY (`asset_type_id`)\n  REFERENCES `t_asset_type` (`id`)\n  ON DELETE SET NULL\n  ON UPDATE CASCADE;');
/*!40000 ALTER TABLE `_CHANGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_documentation`
--

DROP TABLE IF EXISTS `_documentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_documentation` (
  `id` int NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `documentation` longtext,
  `attachment` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_documentation`
--

LOCK TABLES `_documentation` WRITE;
/*!40000 ALTER TABLE `_documentation` DISABLE KEYS */;
INSERT INTO `_documentation` VALUES (10,'local dump location','G:\\tmp\\policy-engine\\db-dumps',NULL),(15,'dump naming convention to use','yyyy-mm-dd-hhmmss.sql',NULL),(100,'original view: stored file policy attribute','select \n	sf.id as file_id,\n    sf.storage_id,\n    p.id as policy_id,\n    p.policy as policy,\n    a.id as attribute_id,\n    a.attribute,    \n    sfp.id as stored_file_policy_id,\n    pa.id as policy_attribute_id,\n    av.id as attribute_value_id,\n    av.`value`\nfrom\n	(\n		t_stored_file sf inner join\n			t_stored_file_policy sfp\n		on sf.id = sfp.stored_file_id inner join\n			t_policy p\n		on p.id = sfp.policy_id inner join\n			t_policy_attribute pa\n		on p.id = pa.policy_id inner join\n			t_attribute a\n		on a.id = pa.attribute_id\n	) left outer join\n		t_attribute_value av\n	on 	pa.id = av.policy_attribute_id and\n		sfp.id = av.stored_file_policy_id\norder by\n	sf.id,\n    a.id;',NULL),(500,'create the tables','\nUSE `tryout-db`;\n\nDROP TABLE IF EXISTS `t_asset`;\nCREATE TABLE `t_asset` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `asset` varchar(45) NOT NULL,\n  `asset_type_id` int DEFAULT NULL,\n  PRIMARY KEY (`id`),\n  UNIQUE KEY `storage_id_UNIQUE` (`asset`)\n);\n\nDROP TABLE IF EXISTS `t_asset_policy`;\nCREATE TABLE `t_asset_policy` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `asset_type_id` int NOT NULL,\n  `policy_id` int NOT NULL,\n  PRIMARY KEY (`id`)\n);\n\nDROP TABLE IF EXISTS `t_asset_type`;\nCREATE TABLE `t_asset_type` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `asset_type` varchar(45) NOT NULL,\n  `description` varchar(500) DEFAULT NULL,\n  PRIMARY KEY (`id`),\n  UNIQUE KEY `asset_type_UNIQUE` (`asset_type`)\n);\n\nDROP TABLE IF EXISTS `t_attribute`;\nCREATE TABLE `t_attribute` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `attribute` varchar(45) NOT NULL,\n  `description` varchar(500) DEFAULT NULL,\n  PRIMARY KEY (`id`),\n  UNIQUE KEY `title_UNIQUE` (`attribute`)\n);\n\nDROP TABLE IF EXISTS `t_attribute_value`;\nCREATE TABLE `t_attribute_value` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `asset_id` int NOT NULL,\n  `policy_attribute_id` int NOT NULL,\n  `value` varchar(45) DEFAULT NULL,\n  PRIMARY KEY (`id`)\n);\n\nDROP TABLE IF EXISTS `t_policy`;\nCREATE TABLE `t_policy` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `policy` varchar(45) NOT NULL,\n  `description` varchar(500) DEFAULT NULL,\n  PRIMARY KEY (`id`),\n  UNIQUE KEY `title_UNIQUE` (`policy`)\n);\n\nDROP TABLE IF EXISTS `t_policy_attribute`;\nCREATE TABLE `t_policy_attribute` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `policy_id` int NOT NULL,\n  `attribute_id` int NOT NULL,\n  PRIMARY KEY (`id`)\n);\n',NULL),(505,'dropping and adding foreign keys and indexes','USE `tryout-db`;\n\nalter table `t_asset` drop foreign key `fk_asset__asset-type-id`;\nalter table `t_asset` drop index      `idx_asset__asset-type-id`;\nalter table `t_asset` add index       `idx_asset__asset-type-id` (`asset_type_id`);\nalter table `t_asset` add constraint   `fk_asset__asset-type-id` \n		foreign key (`asset_type_id`) references `t_asset_type` (`id`)\n        on delete cascade\n        on update cascade;\n\n\nalter table `t_asset_policy` drop foreign key `fk_asset-policy__asset-type-id`;\nalter table `t_asset_policy` drop index      `idx_asset-policy__asset-type-id`;\nalter table `t_asset_policy` add index       `idx_asset-policy__asset-type-id` (`asset_type_id`);\nalter table `t_asset_policy` add constraint   `fk_asset-policy__asset-type-id` \n		foreign key (`asset_type_id`) references `t_asset_type` (`id`)\n        on delete cascade\n        on update cascade;\n\n\nalter table `t_policy_attribute` drop foreign key `fk_policy-attribute__policy-id`;\nalter table `t_policy_attribute` drop index      `idx_policy-attribute__policy-id`;\nalter table `t_policy_attribute` add index       `idx_policy-attribute__policy-id` (`policy_id`);\nalter table `t_policy_attribute` add constraint   `fk_policy-attribute__policy-id` \n		foreign key (`policy_id`) references `t_policy` (`id`)\n        on delete cascade\n        on update cascade;\n\nalter table `t_policy_attribute` drop foreign key `fk_policy-attribute__attribute-id`;\nalter table `t_policy_attribute` drop index      `idx_policy-attribute__attribute-id`;\nalter table `t_policy_attribute` add index       `idx_policy-attribute__attribute-id` (`attribute_id`);\nalter table `t_policy_attribute` add constraint   `fk_policy-attribute__attribute-id` \n		foreign key (`attribute_id`) references `t_attribute` (`id`)\n        on delete cascade\n        on update cascade;\n\n        \nalter table `t_attribute_value` drop foreign key `fk_attribute-value__asset-id`;\nalter table `t_attribute_value` drop index      `idx_attribute-value__asset-id`;\nalter table `t_attribute_value` add index       `idx_attribute-value__asset-id` (`asset_id`);\nalter table `t_attribute_value` add constraint   `fk_attribute-value__asset-id` \n		foreign key (`asset_id`) references `t_asset` (`id`)\n        on delete cascade\n        on update cascade;\n\nalter table `t_attribute_value` drop foreign key `fk_attribute-value__policy-attribute-id`;\nalter table `t_attribute_value` drop index      `idx_attribute-value__policy-attribute-id`;\nalter table `t_attribute_value` add index       `idx_attribute-value__policy-attribute-id` (`policy_attribute_id`);\nalter table `t_attribute_value` add constraint   `fk_attribute-value__policy-attribute-id` \n		foreign key (`policy_attribute_id`) references `t_policy_attribute` (`id`)\n        on delete cascade\n        on update cascade;\n',NULL),(900,'location of the original drawio file','G:\\docs\\policy-engine\\policy-engine.drawio',NULL),(910,'drawio file with entity relationship diagram','see the attachment',_binary '<mxfile host=\"Electron\" modified=\"2023-10-15T08:06:54.782Z\" agent=\"5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/20.8.16 Chrome/106.0.5249.199 Electron/21.4.0 Safari/537.36\" etag=\"oe9KCmHfXl2TPfGAf1nt\" version=\"20.8.16\" type=\"device\"><diagram name=\"Page-1\" id=\"M4nqkhHAKsWwKmPAWgk_\">7Vtbe9o4EP01PNLPtoyBR5Km7XbbJi27vTwqWBjtGsuVRYH++kq2hC8SmDaASILzEGsk2/I5M6OZseiA6/nqNYXp7D0JUdzxnHDVAS87Hj/8Pv8nJOtCMuw5hSCiOCxEbikY459ICtWwBQ5RVhvICIkZTuvCCUkSNGE1GaSULOvDpiSWT5X3T2GEaiOEYDyBsS79gkM2K6QDr1/K3yAczdST3WBY9MyhGiyflM1gSJYVEbjpgGtKCCvO5qtrFAvwcG2Gr7b0biZGUcL2ueDt+Db+d3H7gby9S8eDT/7nv51pV97lB4wX8oVHWYaYnDFbKxgoWSQhEndyOuBqOcMMjVM4Eb1LTjyXzdg85i2Xn+ozU49BlKFVRSRn+hqROWJ0zYfI3r4ETWqNC2R7WXLgKmBnFfwDKYOS9mhz5xIZfiLB+Q2gPDNQ/6xTdEdiPFmfG2SbtjXI3EDDBIXcuGSTUDYjEUlgfFNKr+qolWPeEZJKrP5DjK2lp4ALRupIcgDp+qu4/kVPNb9V+16u5M2L1nrTCkfCX/Dmzac5TNaF7BUWL52P2MpRRhZ0gnYh0ZOeC9IIsXYtEzDtpJyiGDL8o+6jDk/gQFN6O4yeATNu/7yo6WnUnKcb8j3bbgj0bCjtlCRMdrqObF+TmNB8BuAq/+PyjGseU+qdkAQpWUW92w0ArTD7qsyFn38r/R9vlR5PNJTDe4DR7GkzwD8rm/EdG4pQXY+C2oL0wgn81kWJt+4QxRwBRKWwRbWc/DiYaj1ATfqPU0/UvDXfOmKM4vsFQ+fmZHvKx9kLj52nHyoMH2moMNSoOZAiC33FPFUexThKuIwJlo6g3kGwZwzh+kfTbz3/07CLOHjp/m+/qVnAe3UHZycqrtOrwzIMNFgGJlSco2V4utXfUhxhbrLc5FAC57s0zG3XMEgn0taBCGagVLQYTVm+mFHyPzJFVduirebSqbO1m/12DVbZt66xJmq8ozGjF3YKZp4bH9YIADoBy4THcM8Mf5UGupbtwdfoEB5KlO+eKSOBZUaAqwFvsTpYpl7mRGzfdL4SgMqMqx5+1nKyEMM5ScJGWrYzRWiNUj2wZ5SqKupnEqV6ur/seEEsjOien0TipANGGSMUCUCR6uVPKwc8KJwtjFV95fFM5hvkx2GC3GDYKNhbL5SZKHgklbPtptRmkX9uasqC2k3NOytTA6ZcXTe1VNaTn5iZuda/iyl1aME/RNmE4pQ7vOzJkeANrZOgB4SVqohkgyqwP+ejHoT4AVAEQQNF+6qsl0oLt9HllzXh4m/JTFqodE665yn3zQ1RI6pu1p3mOAzztcdEQZ2kfWvnB2Brs2dBsgUMbAUGssDRyNI/517I2kKWP7BNll61hco/XfjS+Apcy3z5esENig1CF6480GtEYIbNXEMDV0crPfh6ACYd4cXEStq8RrTR809H21/Zx3F2++W7f5W68F335wo6SG2OslUwqpWLyurRH28nM+/Z8A6wacOI3r6bNuS40+eqxlmD58B53zbn1uoTu2Zt2mqracOpU7DuZmP6pmp3wq0XRrj0RLYIPBjH67KMed1BI/o4YRpm5EvfuXnhq8qX30ibDQZ2IL54s/z5Rd5X+RELuPkF</diagram></mxfile>'),(1000,'view all policies','use `tryout-db`;\n\nselect \n	ast.id as asset_type_id, \n    p.id as policy_id,\n    a.id as attribute_id,    \n	ast.asset_type,\n    p.policy,\n    a.attribute,\n    a.description\nfrom\n	t_asset_type ast right outer join(\n		t_asset_type_policy astp right outer join(\n			t_policy p left outer join(\n				t_policy_attribute pa inner join				\n					t_attribute a\n				on a.id = pa.attribute_id \n			)on p.id = pa.policy_id \n		)on p.id = astp.policy_id \n    )on ast.id = astp.asset_type_id\norder by\n	ast.id,\n    p.id,\n    a.id;',NULL),(1010,'view all policies and attributes for a given asset','use `tryout-db`;\n\nset @asset_type = \'public-document\';\nset @asset = \'FILE-005.public\';\nset @insertIfMissing = true;\n\n-- Get the asset-type-id\nset @asset_type_id = (\n	select \n		ast.id\n	from \n		t_asset_type ast\n	where\n		ast.asset_type = @asset_type\n);\n\n-- Get the asset-id\nset @asset_id = (\n	select \n		ass.id\n	from \n		t_asset ass\n	where\n		ass.asset = @asset and\n		ass.asset_type_id = @asset_type_id\n);\n\n\nset @insertAssetSql = \'insert into t_asset(asset, asset_type_id) values(@asset, @asset_type_id)\';\nset @doNothing = \'do sleep (0)\';\nset @isAssetPresent = not isnull(@asset_id);\nset @sqlToExecute = if(@isAssetPresent, @doNothing, if(@insertIfMissing, @insertAssetSql, @doNothing));\nprepare sqlToExecute from @sqlToExecute;\n\nexecute sqlToExecute;\n-- Get the asset-id\n\n\nset @asset_id = (\n	select \n		ass.id\n	from \n		t_asset ass\n	where\n		ass.asset = @asset and\n		ass.asset_type_id = @asset_type_id\n);\n\n\n\n-- Get the policies and attributes assigned to the asset_type\nselect \n	pa.id as policy_attribute_id\nfrom\n	t_asset_type ast inner join\n		t_asset_type_policy astp inner join\n			t_policy p inner join\n				t_policy_attribute pa inner join\n					t_attribute a\n				on a.id = pa.attribute_id\n			on p.id = pa.policy_id\n		on p.id = astp.policy_id\n	on ast.id = astp.asset_type_id\nwhere\n	ast.id = @asset_type_id; \n\n-- show everything for the asset\nselect \n	ast.asset_type,\n	ass.asset,\n    p.policy,\n    a.attribute,\n    av.`value`,\n    a.`description`,\n    ass.id as asset_id,\n	ast.id as asset_type_id, \n    p.id as policy_id,\n    a.id as attribute_id, \n    pa.id as policy_attribute_id\n    \nfrom\n	t_asset ass inner join\n		(\n			t_asset_type ast right outer join\n				t_asset_type_policy astp right outer join\n						t_policy p right outer join\n							(\n								t_policy_attribute pa inner join				\n									t_attribute a\n								on a.id = pa.attribute_id\n							) left outer join\n								t_attribute_value av\n							on pa.id = av.policy_attribute_id\n						on p.id = pa.policy_id\n				on p.id = astp.policy_id\n			on ast.id = astp.asset_type_id\n		)	\n	on ast.id = ass.asset_type_id\nwhere\n	ast.id = @asset_type_id and\n    ass.id = @asset_id     \norder by\n	ast.id,\n	ass.id,	\n    p.id,\n    a.id;',NULL),(1020,'view all assets and their attributes','select \n	ast.asset_type,\n	ass.asset,\n    p.policy,\n    a.attribute,\n    av.`value`,\n    a.`description`,\n    ass.id as asset_id,\n	ast.id as asset_type_id, \n    p.id as policy_id,\n    a.id as attribute_id, \n    pa.id as policy_attribute_id\n    \nfrom\n	t_asset ass inner join\n		(\n			t_asset_type ast right outer join\n				t_asset_type_policy astp right outer join\n						t_policy p right outer join\n							(\n								t_policy_attribute pa inner join				\n									t_attribute a\n								on a.id = pa.attribute_id\n							) left outer join\n								t_attribute_value av\n							on pa.id = av.policy_attribute_id\n						on p.id = pa.policy_id\n				on p.id = astp.policy_id\n			on ast.id = astp.asset_type_id\n		)	\n	on ast.id = ass.asset_type_id   \norder by\n	ast.id,\n	ass.id,	\n    p.id,\n    a.id;',NULL);
/*!40000 ALTER TABLE `_documentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_asset`
--

DROP TABLE IF EXISTS `t_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset` varchar(45) NOT NULL,
  `asset_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_asset__asset-type-id` (`asset`,`asset_type_id`),
  KEY `idx_asset__asset-type-id` (`asset_type_id`),
  CONSTRAINT `fk_asset__asset-type-id` FOREIGN KEY (`asset_type_id`) REFERENCES `t_asset_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_asset`
--

LOCK TABLES `t_asset` WRITE;
/*!40000 ALTER TABLE `t_asset` DISABLE KEYS */;
INSERT INTO `t_asset` VALUES (3,'FILE-001.user-file',1),(10,'FILE-001.user-file',3),(11,'FILE-002.public',3),(5,'FILE-002.user-file',1),(9,'FILE-003.public',3),(8,'FILE-003.user-file',1),(12,'FILE-004.public',3),(13,'FILE-005.public',3),(14,'FILE-006.public',3);
/*!40000 ALTER TABLE `t_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_asset_type`
--

DROP TABLE IF EXISTS `t_asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_asset_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_type_UNIQUE` (`asset_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_asset_type`
--

LOCK TABLES `t_asset_type` WRITE;
/*!40000 ALTER TABLE `t_asset_type` DISABLE KEYS */;
INSERT INTO `t_asset_type` VALUES (1,'user-file','files uploaded by users'),(2,'worksheet-attachment','a resource attached and displayed on a worksheet'),(3,'public-document','a shared document available for all'),(4,'classroom-resource','a resource used and shared within a classroom'),(5,'mentor-resource','a private resource owned and used by a mentor');
/*!40000 ALTER TABLE `t_asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_asset_type_policy`
--

DROP TABLE IF EXISTS `t_asset_type_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_asset_type_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_type_id` int NOT NULL,
  `policy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset-policy__asset-type-id` (`asset_type_id`),
  CONSTRAINT `fk_asset-type-policy__asset-type-id` FOREIGN KEY (`asset_type_id`) REFERENCES `t_asset_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_asset_type_policy`
--

LOCK TABLES `t_asset_type_policy` WRITE;
/*!40000 ALTER TABLE `t_asset_type_policy` DISABLE KEYS */;
INSERT INTO `t_asset_type_policy` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `t_asset_type_policy` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `t_attribute` VALUES (1,'created-by','asset created by'),(2,'created-on','date and time an asset was first created'),(3,'updated-by','asset last updated by'),(4,'updated-on','date and time asset was last updated on');
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
  `asset_id` int NOT NULL,
  `policy_attribute_id` int NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute-value__asset-id` (`asset_id`),
  KEY `idx_attribute-value__policy-attribute-id` (`policy_attribute_id`),
  CONSTRAINT `fk_attribute-value__asset-id` FOREIGN KEY (`asset_id`) REFERENCES `t_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute-value__policy-attribute-id` FOREIGN KEY (`policy_attribute_id`) REFERENCES `t_policy_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_attribute_value`
--

LOCK TABLES `t_attribute_value` WRITE;
/*!40000 ALTER TABLE `t_attribute_value` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_policy`
--

LOCK TABLES `t_policy` WRITE;
/*!40000 ALTER TABLE `t_policy` DISABLE KEYS */;
INSERT INTO `t_policy` VALUES (1,'default','default policy that applies to all asset types'),(2,'subscription','subscription policy to be applied to resources'),(3,'ownership','ownership of resources');
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
  KEY `idx_policy-attribute__policy-id` (`policy_id`),
  KEY `idx_policy-attribute__attribute-id` (`attribute_id`),
  CONSTRAINT `fk_policy-attribute__attribute-id` FOREIGN KEY (`attribute_id`) REFERENCES `t_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_policy-attribute__policy-id` FOREIGN KEY (`policy_id`) REFERENCES `t_policy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_policy_attribute`
--

LOCK TABLES `t_policy_attribute` WRITE;
/*!40000 ALTER TABLE `t_policy_attribute` DISABLE KEYS */;
INSERT INTO `t_policy_attribute` VALUES (5,1,1),(6,1,2),(7,1,3),(8,1,4);
/*!40000 ALTER TABLE `t_policy_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-21 17:48:49
SET FOREIGN_KEY_CHECKS=1;