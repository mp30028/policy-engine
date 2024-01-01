-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: kc_db
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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00d06d43-5861-46fc-a7ad-c5d8538a4d9e',NULL,'reset-password','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e18a8060-934b-410a-a647-77d5e0d88d6d',0,30,_binary '\0',NULL,NULL),('022c39f7-f162-496c-99cd-a9321cf74b3e',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1444e1cc-b8c5-4ee2-872a-15f275fdddf9',1,40,_binary '','ead5a1ef-27d7-48be-8402-cb3e21719d21',NULL),('05d835a5-228b-40d0-b82d-d2e215b0eeab',NULL,'idp-email-verification','0a15b7e6-e191-4f97-811c-f3c7ec24f613','172ceb09-1843-4a19-b809-c4acb63aa8de',2,10,_binary '\0',NULL,NULL),('07d6d956-a117-46a6-a861-aa84111e2898',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','1ce19de8-5549-420f-80df-42209769fb1c',2,20,_binary '','60263851-ca2d-491f-aa55-31b95a79667a',NULL),('0a7cab05-02f3-46d3-aea8-ca8f15c65b64',NULL,'direct-grant-validate-otp','0a15b7e6-e191-4f97-811c-f3c7ec24f613','d6f56bbb-2d04-4b1f-a3af-ef860a76dc4f',0,20,_binary '\0',NULL,NULL),('0cef2bc4-d98d-4a85-9ee2-f74bed994a61',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','e18a8060-934b-410a-a647-77d5e0d88d6d',3,40,_binary '','a80a470a-794a-4b44-8838-56914edd5463',NULL),('0fde3237-ec93-47cd-8a51-5ba75a41ef8c',NULL,'reset-password','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1444e1cc-b8c5-4ee2-872a-15f275fdddf9',0,30,_binary '\0',NULL,NULL),('1013673c-4947-4619-a5e9-9a8320e808b9',NULL,'direct-grant-validate-password','0a15b7e6-e191-4f97-811c-f3c7ec24f613','ee95f90c-492e-48ef-a7ca-866bf4a98ce6',0,20,_binary '\0',NULL,NULL),('1732772e-95df-4cdd-961c-e0060194b4c0',NULL,'basic-auth-otp','0a15b7e6-e191-4f97-811c-f3c7ec24f613','978704e4-fab9-4783-b559-59ff2d8941ce',3,20,_binary '\0',NULL,NULL),('19fb1f5c-fc95-4c66-97a5-f51716f32bda',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','172ceb09-1843-4a19-b809-c4acb63aa8de',2,20,_binary '','aca02984-e4e7-4966-b0a1-39f0663337d1',NULL),('1a90868c-41d8-462b-887d-2460508bd7bf',NULL,'http-basic-authenticator','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','dd6a5d43-48f3-4b22-ba4d-74dec866da78',0,10,_binary '\0',NULL,NULL),('1b1ea5c2-1a12-4a85-9441-a68602e4a770',NULL,'idp-review-profile','0a15b7e6-e191-4f97-811c-f3c7ec24f613','ccc7c728-37b1-4bb3-909f-9b724c02aee8',0,10,_binary '\0',NULL,'50b8bef2-08f2-4b9a-a063-1ec1943f50f4'),('1cc8c7bb-fd37-4dcf-b083-8e8b7884ee51',NULL,'auth-spnego','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','e186ee64-f387-4b20-8683-6ff30797624c',3,30,_binary '\0',NULL,NULL),('23cd5a05-5bf4-4745-9802-9b882fb37b75',NULL,'direct-grant-validate-otp','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','bb281d4c-85f4-4fcf-9001-8e39bc12ccce',0,20,_binary '\0',NULL,NULL),('268180a3-6fe1-4e59-b397-978ac7ae5b5c',NULL,'identity-provider-redirector','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d03c08cd-9e8b-443f-80b5-e8dfee21396a',2,25,_binary '\0',NULL,NULL),('2ab49a6f-5bfb-4cb0-b7e3-42f90b52c215',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','376650c0-3aff-4b21-aa8e-35471ff88a3e',1,30,_binary '','bb281d4c-85f4-4fcf-9001-8e39bc12ccce',NULL),('3451b0c4-9d26-4099-ae15-92a28b887fab',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','72831ef3-d713-44b6-b026-afb688c96405',0,20,_binary '','e186ee64-f387-4b20-8683-6ff30797624c',NULL),('3681f4c1-70bb-436e-98d6-5940f389db2a',NULL,'direct-grant-validate-username','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','376650c0-3aff-4b21-aa8e-35471ff88a3e',0,10,_binary '\0',NULL,NULL),('39c2f228-3040-48d2-b5e8-b7f21daa6588',NULL,'auth-otp-form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3ca1a5f4-8184-4f6e-93f6-ac79fd73df11',0,20,_binary '\0',NULL,NULL),('3ad4928f-564f-4105-b8a2-8cada10babde',NULL,'idp-confirm-link','0a15b7e6-e191-4f97-811c-f3c7ec24f613','60263851-ca2d-491f-aa55-31b95a79667a',0,10,_binary '\0',NULL,NULL),('3c8e12f0-815d-4380-b00f-408e3aa169af',NULL,'auth-otp-form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','97df85de-6b32-4788-b3c9-0d094b697804',0,20,_binary '\0',NULL,NULL),('3f1defa3-6e12-4ec8-a77b-9a311ef98bdf',NULL,'auth-spnego','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d03c08cd-9e8b-443f-80b5-e8dfee21396a',3,20,_binary '\0',NULL,NULL),('47d0c8a1-e25e-4dca-936f-d7111a5d69c2',NULL,'conditional-user-configured','0a15b7e6-e191-4f97-811c-f3c7ec24f613','a80a470a-794a-4b44-8838-56914edd5463',0,10,_binary '\0',NULL,NULL),('47fe0b34-4c47-464f-987d-6679a2f931cb',NULL,'basic-auth','0a15b7e6-e191-4f97-811c-f3c7ec24f613','978704e4-fab9-4783-b559-59ff2d8941ce',0,10,_binary '\0',NULL,NULL),('4a851030-ab2f-4dbd-8a28-0fc8237288b2',NULL,'idp-create-user-if-unique','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','739262c6-1093-4ec7-bc1c-0f7a64241d4b',2,10,_binary '\0',NULL,'cf322b21-870f-419b-a9c2-22766ecb5748'),('4c6ac5e5-fa11-40a3-9315-83f23f1e4766',NULL,'reset-otp','0a15b7e6-e191-4f97-811c-f3c7ec24f613','a80a470a-794a-4b44-8838-56914edd5463',0,20,_binary '\0',NULL,NULL),('4dc6da6f-19b8-420c-9e3b-d30c625576b2',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','60263851-ca2d-491f-aa55-31b95a79667a',0,20,_binary '','172ceb09-1843-4a19-b809-c4acb63aa8de',NULL),('51074717-4ac4-407e-89c7-da3488108c80',NULL,'client-secret','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7ce9a69c-0787-4618-995b-55327b205fea',2,10,_binary '\0',NULL,NULL),('51547d02-0c35-4112-98da-3aa40bc59196',NULL,'reset-credential-email','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1444e1cc-b8c5-4ee2-872a-15f275fdddf9',0,20,_binary '\0',NULL,NULL),('539174fe-0e5f-4232-b22a-908ffecd3e04',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','839b6827-5782-4769-9d7e-019b041185b1',0,20,_binary '','739262c6-1093-4ec7-bc1c-0f7a64241d4b',NULL),('592fe43a-0d65-4807-a4b3-f3aaf812b278',NULL,'conditional-user-configured','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','7ac8002f-0175-4779-8c1b-e7df8465c673',0,10,_binary '\0',NULL,NULL),('593412b0-46f4-4df5-b02d-382345dbcef9',NULL,'auth-username-password-form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','f43b1ade-39a6-4b95-a8aa-46e94fd0da16',0,10,_binary '\0',NULL,NULL),('62d85e43-9182-49d4-82b2-2ba2a15a41cf',NULL,'registration-user-creation','0a15b7e6-e191-4f97-811c-f3c7ec24f613','f2a265a8-50b8-407a-b174-555f84037fc0',0,20,_binary '\0',NULL,NULL),('62e43904-8128-41e5-8285-a5043cecbf43',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','ee95f90c-492e-48ef-a7ca-866bf4a98ce6',1,30,_binary '','d6f56bbb-2d04-4b1f-a3af-ef860a76dc4f',NULL),('6451cb83-5410-45e3-84f1-e7c11f8691e0',NULL,'auth-cookie','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7fcb5d74-4cab-4c1f-9b2c-496bc91b487e',2,10,_binary '\0',NULL,NULL),('661d948c-60c9-4e68-b508-52048ffdc277',NULL,'client-x509','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7ce9a69c-0787-4618-995b-55327b205fea',2,40,_binary '\0',NULL,NULL),('6a3cf4ed-da12-4d10-b3b0-7348c5d050dc',NULL,'idp-review-profile','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','839b6827-5782-4769-9d7e-019b041185b1',0,10,_binary '\0',NULL,'77d46642-62e5-4418-9965-a62bed4c6f81'),('6aec163c-4fa6-4a6a-a80f-ef9f40d45e5a',NULL,'conditional-user-configured','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','ead5a1ef-27d7-48be-8402-cb3e21719d21',0,10,_binary '\0',NULL,NULL),('6b281539-776b-4765-9992-6ec0f2681f58',NULL,'idp-email-verification','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d98f6f12-d5e8-4da2-a865-8e4bd50a76af',2,10,_binary '\0',NULL,NULL),('7001c97e-510f-40b3-b7f3-1e5bc002273a',NULL,'idp-username-password-form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','aca02984-e4e7-4966-b0a1-39f0663337d1',0,10,_binary '\0',NULL,NULL),('72170f85-3800-4a00-8eb1-9a49b2a38e69',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','7fcb5d74-4cab-4c1f-9b2c-496bc91b487e',2,30,_binary '','c99b92ea-d058-4b8c-b402-800f271b5919',NULL),('7562fec1-bcb9-4c3e-9b48-091e545688be',NULL,'no-cookie-redirect','0a15b7e6-e191-4f97-811c-f3c7ec24f613','4346d1f1-3a23-473e-929c-e7d865342b76',0,10,_binary '\0',NULL,NULL),('81808de7-e1a9-48ba-b846-25b0e4f4ab6b',NULL,'no-cookie-redirect','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','72831ef3-d713-44b6-b026-afb688c96405',0,10,_binary '\0',NULL,NULL),('8293f62d-7581-4701-af68-99e69ac7ecbc',NULL,'client-secret-jwt','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','cc137a87-e60b-4fdf-bea6-9f955659995c',2,30,_binary '\0',NULL,NULL),('83ae0ca3-84bb-46cf-b515-043d6da19dae',NULL,'reset-otp','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','ead5a1ef-27d7-48be-8402-cb3e21719d21',0,20,_binary '\0',NULL,NULL),('89316c9f-972b-48b4-9f7f-e6ddcf728e9e',NULL,'client-jwt','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7ce9a69c-0787-4618-995b-55327b205fea',2,20,_binary '\0',NULL,NULL),('89543b94-ec66-4cc7-a697-4cba3ad142b1',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d70ec6a1-8f26-4819-9bad-b349c64e1317',1,20,_binary '','3ca1a5f4-8184-4f6e-93f6-ac79fd73df11',NULL),('8b67e108-cda0-4806-be9a-8ff77ec2c32a',NULL,'http-basic-authenticator','0a15b7e6-e191-4f97-811c-f3c7ec24f613','92676d46-3ce6-423d-85e2-7eeed314c10f',0,10,_binary '\0',NULL,NULL),('8e0346c9-fef2-48e7-8603-c6e1b961c483',NULL,'registration-profile-action','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','c11c0342-c325-443f-b892-c2d6abe2d45f',0,40,_binary '\0',NULL,NULL),('92d431f5-f604-4d40-8886-d841a39c75f1',NULL,'reset-credentials-choose-user','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1444e1cc-b8c5-4ee2-872a-15f275fdddf9',0,10,_binary '\0',NULL,NULL),('9480d664-0fc1-4f40-a6b1-6def766cf8fd',NULL,'reset-credential-email','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e18a8060-934b-410a-a647-77d5e0d88d6d',0,20,_binary '\0',NULL,NULL),('97b5c3bd-bf21-41dc-9da9-b6b7d8d7c142',NULL,'auth-cookie','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d03c08cd-9e8b-443f-80b5-e8dfee21396a',2,10,_binary '\0',NULL,NULL),('9fe3a450-e31f-452e-9323-ba2b08ff00ef',NULL,'client-secret','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','cc137a87-e60b-4fdf-bea6-9f955659995c',2,10,_binary '\0',NULL,NULL),('a1fed176-d0a7-4a9d-b35a-f4f1e7afa6f0',NULL,'registration-user-creation','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','c11c0342-c325-443f-b892-c2d6abe2d45f',0,20,_binary '\0',NULL,NULL),('a3816c2b-3d56-4fc6-9d75-b96978bda0a7',NULL,'registration-recaptcha-action','0a15b7e6-e191-4f97-811c-f3c7ec24f613','f2a265a8-50b8-407a-b174-555f84037fc0',3,60,_binary '\0',NULL,NULL),('a4cec365-268c-489a-b951-f2b590ceb678',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','ccc7c728-37b1-4bb3-909f-9b724c02aee8',0,20,_binary '','1ce19de8-5549-420f-80df-42209769fb1c',NULL),('a4eaa794-11ec-4090-baf4-5d86c20ab07d',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d98f6f12-d5e8-4da2-a865-8e4bd50a76af',2,20,_binary '','d70ec6a1-8f26-4819-9bad-b349c64e1317',NULL),('a5043801-1b0d-4d15-9e76-6e78020e69b2',NULL,'idp-username-password-form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d70ec6a1-8f26-4819-9bad-b349c64e1317',0,10,_binary '\0',NULL,NULL),('a65e69b8-7d19-4690-a779-bcd5a9461a55',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','4346d1f1-3a23-473e-929c-e7d865342b76',0,20,_binary '','978704e4-fab9-4783-b559-59ff2d8941ce',NULL),('ab4e6ad5-251e-416c-978b-2bf9631f3dfd',NULL,'registration-page-form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','252c16d8-4cce-4862-a711-9a742920ab67',0,10,_binary '','c11c0342-c325-443f-b892-c2d6abe2d45f',NULL),('ac62f33c-e9d3-4ce2-815a-15d187d2599f',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','739262c6-1093-4ec7-bc1c-0f7a64241d4b',2,20,_binary '','bf7a66ea-dc2d-4026-8436-87b6fa1c9b1a',NULL),('ad7eb10e-61e7-4ab9-a88c-79a707675c4c',NULL,'registration-page-form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','835e75a5-370e-49a4-a273-d88279c99259',0,10,_binary '','f2a265a8-50b8-407a-b174-555f84037fc0',NULL),('ade2c898-f4cc-4ff2-8def-4917de6656d7',NULL,'basic-auth','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','e186ee64-f387-4b20-8683-6ff30797624c',0,10,_binary '\0',NULL,NULL),('b4f46f7c-505a-43aa-bc95-c839c9449d55',NULL,'docker-http-basic-authenticator','0a15b7e6-e191-4f97-811c-f3c7ec24f613','296e0c96-1493-4d77-b4d4-3ab20fda8ea3',0,10,_binary '\0',NULL,NULL),('b56630fa-239b-437b-83e9-c6b00c7d26e8',NULL,'docker-http-basic-authenticator','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','b69a3271-5cd8-4cad-ac15-1579cffa392c',0,10,_binary '\0',NULL,NULL),('b9f1de2a-66d8-4c2c-a870-514a9ad54304',NULL,'idp-create-user-if-unique','0a15b7e6-e191-4f97-811c-f3c7ec24f613','1ce19de8-5549-420f-80df-42209769fb1c',2,10,_binary '\0',NULL,'c7e21e3b-507c-4136-ad8f-fe609d21d993'),('baef9e4e-1557-4e62-a0d1-dc67526aa2e3',NULL,'registration-recaptcha-action','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','c11c0342-c325-443f-b892-c2d6abe2d45f',3,60,_binary '\0',NULL,NULL),('be273295-e231-496c-ba5c-d712b7afd50b',NULL,'client-x509','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','cc137a87-e60b-4fdf-bea6-9f955659995c',2,40,_binary '\0',NULL,NULL),('bfcce19b-7a99-460d-937e-9e6d0f448384',NULL,'basic-auth-otp','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','e186ee64-f387-4b20-8683-6ff30797624c',3,20,_binary '\0',NULL,NULL),('c2e9d054-c835-4517-b91b-b8e894727c15',NULL,'conditional-user-configured','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e7d2bb02-96e3-424c-8bb5-f6926d3cd22d',0,10,_binary '\0',NULL,NULL),('c2fdf138-fe84-4cd5-a0d6-48067a2f0594',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','d03c08cd-9e8b-443f-80b5-e8dfee21396a',2,30,_binary '','f43b1ade-39a6-4b95-a8aa-46e94fd0da16',NULL),('c4c65239-cd23-4abc-b319-849f0091e848',NULL,'conditional-user-configured','0a15b7e6-e191-4f97-811c-f3c7ec24f613','d6f56bbb-2d04-4b1f-a3af-ef860a76dc4f',0,10,_binary '\0',NULL,NULL),('c505be17-7fda-4107-b509-bbb75891381e',NULL,'registration-password-action','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','c11c0342-c325-443f-b892-c2d6abe2d45f',0,50,_binary '\0',NULL,NULL),('c6c0f4e5-23de-403e-b1c6-b4bb553e1e28',NULL,'client-jwt','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','cc137a87-e60b-4fdf-bea6-9f955659995c',2,20,_binary '\0',NULL,NULL),('c97f6805-a75c-4dfc-b7d8-5edc2c011ea4',NULL,'idp-confirm-link','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','bf7a66ea-dc2d-4026-8436-87b6fa1c9b1a',0,10,_binary '\0',NULL,NULL),('d0356b94-1964-4a45-971c-c89314e5f8c3',NULL,'reset-credentials-choose-user','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e18a8060-934b-410a-a647-77d5e0d88d6d',0,10,_binary '\0',NULL,NULL),('d0e88ee7-2d4f-479e-b536-eb81fe81db57',NULL,'auth-otp-form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e7d2bb02-96e3-424c-8bb5-f6926d3cd22d',0,20,_binary '\0',NULL,NULL),('d413a500-b432-4383-8008-ec890535dcb4',NULL,'conditional-user-configured','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3ca1a5f4-8184-4f6e-93f6-ac79fd73df11',0,10,_binary '\0',NULL,NULL),('d4de9ea8-2e0a-4f95-ac5f-d71411c8ff40',NULL,'registration-profile-action','0a15b7e6-e191-4f97-811c-f3c7ec24f613','f2a265a8-50b8-407a-b174-555f84037fc0',0,40,_binary '\0',NULL,NULL),('dc7c7e75-37e0-4864-b060-fcb80fae766f',NULL,'direct-grant-validate-username','0a15b7e6-e191-4f97-811c-f3c7ec24f613','ee95f90c-492e-48ef-a7ca-866bf4a98ce6',0,10,_binary '\0',NULL,NULL),('df58e919-afec-418d-a7a5-c312fe9adccb',NULL,'conditional-user-configured','0a15b7e6-e191-4f97-811c-f3c7ec24f613','97df85de-6b32-4788-b3c9-0d094b697804',0,10,_binary '\0',NULL,NULL),('e7157b3c-273e-43bc-a7bb-8cb1e5efed46',NULL,'auth-spnego','0a15b7e6-e191-4f97-811c-f3c7ec24f613','978704e4-fab9-4783-b559-59ff2d8941ce',3,30,_binary '\0',NULL,NULL),('eaedff8f-25b6-4e56-9d8e-9561b98ae87f',NULL,'direct-grant-validate-password','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','376650c0-3aff-4b21-aa8e-35471ff88a3e',0,20,_binary '\0',NULL,NULL),('ec2ff6de-0d79-4411-ace9-37825737e61c',NULL,'auth-spnego','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7fcb5d74-4cab-4c1f-9b2c-496bc91b487e',3,20,_binary '\0',NULL,NULL),('ed088062-a3c1-4f9d-a1a3-49d2f65263bf',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','bf7a66ea-dc2d-4026-8436-87b6fa1c9b1a',0,20,_binary '','d98f6f12-d5e8-4da2-a865-8e4bd50a76af',NULL),('ee4e0b80-345b-433d-964a-73168cc5a5ad',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','c99b92ea-d058-4b8c-b402-800f271b5919',1,20,_binary '','97df85de-6b32-4788-b3c9-0d094b697804',NULL),('eeb9c93f-9d85-44a9-82c6-a5cc0c69f7a2',NULL,'client-secret-jwt','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7ce9a69c-0787-4618-995b-55327b205fea',2,30,_binary '\0',NULL,NULL),('f471a863-de5e-48e5-8561-43655514c7b6',NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','f43b1ade-39a6-4b95-a8aa-46e94fd0da16',1,20,_binary '','7ac8002f-0175-4779-8c1b-e7df8465c673',NULL),('f629409c-a719-49f8-b0da-b1b9eca660c2',NULL,'conditional-user-configured','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','bb281d4c-85f4-4fcf-9001-8e39bc12ccce',0,10,_binary '\0',NULL,NULL),('f659e2d8-e79c-4620-995a-e460bb94c4b7',NULL,'auth-username-password-form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','c99b92ea-d058-4b8c-b402-800f271b5919',0,10,_binary '\0',NULL,NULL),('f8337242-ad9c-4238-873f-f7b5732352cd',NULL,'identity-provider-redirector','0a15b7e6-e191-4f97-811c-f3c7ec24f613','7fcb5d74-4cab-4c1f-9b2c-496bc91b487e',2,25,_binary '\0',NULL,NULL),('fa8f237b-bfec-43d7-8aec-a36a7a67243c',NULL,'auth-otp-form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','7ac8002f-0175-4779-8c1b-e7df8465c673',0,20,_binary '\0',NULL,NULL),('fdcbc5d5-cd64-435a-9d38-16b1905b0900',NULL,'registration-password-action','0a15b7e6-e191-4f97-811c-f3c7ec24f613','f2a265a8-50b8-407a-b174-555f84037fc0',0,50,_binary '\0',NULL,NULL),('fe3d5423-c0a8-4c06-8baa-689666feb430',NULL,NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','aca02984-e4e7-4966-b0a1-39f0663337d1',1,20,_binary '','e7d2bb02-96e3-424c-8bb5-f6926d3cd22d',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('1444e1cc-b8c5-4ee2-872a-15f275fdddf9','reset credentials','Reset credentials for a user if they forgot their password or something','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('172ceb09-1843-4a19-b809-c4acb63aa8de','Account verification options','Method with which to verity the existing account','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('1ce19de8-5549-420f-80df-42209769fb1c','User creation or linking','Flow for the existing/non-existing user alternatives','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('252c16d8-4cce-4862-a711-9a742920ab67','registration','registration flow','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('296e0c96-1493-4d77-b4d4-3ab20fda8ea3','docker auth','Used by Docker clients to authenticate against the IDP','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('376650c0-3aff-4b21-aa8e-35471ff88a3e','direct grant','OpenID Connect Resource Owner Grant','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('3ca1a5f4-8184-4f6e-93f6-ac79fd73df11','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('4346d1f1-3a23-473e-929c-e7d865342b76','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('60263851-ca2d-491f-aa55-31b95a79667a','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('72831ef3-d713-44b6-b026-afb688c96405','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('739262c6-1093-4ec7-bc1c-0f7a64241d4b','User creation or linking','Flow for the existing/non-existing user alternatives','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('7ac8002f-0175-4779-8c1b-e7df8465c673','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('7ce9a69c-0787-4618-995b-55327b205fea','clients','Base authentication for clients','0a15b7e6-e191-4f97-811c-f3c7ec24f613','client-flow',_binary '',_binary ''),('7fcb5d74-4cab-4c1f-9b2c-496bc91b487e','browser','browser based authentication','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('835e75a5-370e-49a4-a273-d88279c99259','registration','registration flow','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('839b6827-5782-4769-9d7e-019b041185b1','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('92676d46-3ce6-423d-85e2-7eeed314c10f','saml ecp','SAML ECP Profile Authentication Flow','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('978704e4-fab9-4783-b559-59ff2d8941ce','Authentication Options','Authentication options.','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('97df85de-6b32-4788-b3c9-0d094b697804','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('a80a470a-794a-4b44-8838-56914edd5463','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('aca02984-e4e7-4966-b0a1-39f0663337d1','Verify Existing Account by Re-authentication','Reauthentication of existing account','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('b69a3271-5cd8-4cad-ac15-1579cffa392c','docker auth','Used by Docker clients to authenticate against the IDP','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('bb281d4c-85f4-4fcf-9001-8e39bc12ccce','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('bf7a66ea-dc2d-4026-8436-87b6fa1c9b1a','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('c11c0342-c325-443f-b892-c2d6abe2d45f','registration form','registration form','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','form-flow',_binary '\0',_binary ''),('c99b92ea-d058-4b8c-b402-800f271b5919','forms','Username, password, otp and other auth forms.','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('cc137a87-e60b-4fdf-bea6-9f955659995c','clients','Base authentication for clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','client-flow',_binary '',_binary ''),('ccc7c728-37b1-4bb3-909f-9b724c02aee8','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('d03c08cd-9e8b-443f-80b5-e8dfee21396a','browser','browser based authentication','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('d6f56bbb-2d04-4b1f-a3af-ef860a76dc4f','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('d70ec6a1-8f26-4819-9bad-b349c64e1317','Verify Existing Account by Re-authentication','Reauthentication of existing account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('d98f6f12-d5e8-4da2-a865-8e4bd50a76af','Account verification options','Method with which to verity the existing account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('dd6a5d43-48f3-4b22-ba4d-74dec866da78','saml ecp','SAML ECP Profile Authentication Flow','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '',_binary ''),('e186ee64-f387-4b20-8683-6ff30797624c','Authentication Options','Authentication options.','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('e18a8060-934b-410a-a647-77d5e0d88d6d','reset credentials','Reset credentials for a user if they forgot their password or something','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('e7d2bb02-96e3-424c-8bb5-f6926d3cd22d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '\0',_binary ''),('ead5a1ef-27d7-48be-8402-cb3e21719d21','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary ''),('ee95f90c-492e-48ef-a7ca-866bf4a98ce6','direct grant','OpenID Connect Resource Owner Grant','0a15b7e6-e191-4f97-811c-f3c7ec24f613','basic-flow',_binary '',_binary ''),('f2a265a8-50b8-407a-b174-555f84037fc0','registration form','registration form','0a15b7e6-e191-4f97-811c-f3c7ec24f613','form-flow',_binary '\0',_binary ''),('f43b1ade-39a6-4b95-a8aa-46e94fd0da16','forms','Username, password, otp and other auth forms.','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('50b8bef2-08f2-4b9a-a063-1ec1943f50f4','review profile config','0a15b7e6-e191-4f97-811c-f3c7ec24f613'),('77d46642-62e5-4418-9965-a62bed4c6f81','review profile config','ab8c345f-97ee-41a0-ac84-a87342aa3ee3'),('c7e21e3b-507c-4136-ad8f-fe609d21d993','create unique user config','0a15b7e6-e191-4f97-811c-f3c7ec24f613'),('cf322b21-870f-419b-a9c2-22766ecb5748','create unique user config','ab8c345f-97ee-41a0-ac84-a87342aa3ee3');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('50b8bef2-08f2-4b9a-a063-1ec1943f50f4','missing','update.profile.on.first.login'),('77d46642-62e5-4418-9965-a62bed4c6f81','missing','update.profile.on.first.login'),('c7e21e3b-507c-4136-ad8f-fe609d21d993','false','require.password.update.after.registration'),('cf322b21-870f-419b-a9c2-22766ecb5748','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('14aca870-4fb0-4885-b6ee-17dcd35999e1',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3148d26c-6499-4f31-ba86-0b31e1f850ac',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '',_binary '\0','policy-engine-realm-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,0,_binary '\0',_binary '\0','policy-engine-realm Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/policy-engine-realm/account/',_binary '\0',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6f82a2bf-2315-4524-86f7-573de5bf8c40',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/policy-engine-realm/console/',_binary '\0',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8162a34d-4786-49b3-bafc-d009851ca912',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e064d5c6-58ba-4933-90b4-e8396859d6b8',_binary '',_binary '','policy-engine-ui',0,_binary '',NULL,'',_binary '\0','',_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',-1,_binary '',_binary '\0','policy-engine-ui',_binary '\0','client-secret','','React Web Application running inside a spring-boot container ',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/policy-engine-realm/account/',_binary '\0',NULL,_binary '\0','0a15b7e6-e191-4f97-811c-f3c7ec24f613','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','pkce.code.challenge.method','S256'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','post.logout.redirect.uris','+'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','pkce.code.challenge.method','S256'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','post.logout.redirect.uris','+'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','pkce.code.challenge.method','S256'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','post.logout.redirect.uris','+'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','post.logout.redirect.uris','+'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','pkce.code.challenge.method','S256'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','post.logout.redirect.uris','+'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','backchannel.logout.revoke.offline.tokens','false'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','backchannel.logout.session.required','true'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','oauth2.device.authorization.grant.enabled','false'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','oidc.ciba.grant.enabled','false'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('29cded68-a1ba-46e1-a3ad-f88bec1754b0','acr','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('2f5ccb61-36b7-4257-9de8-38555f977c7e','profile','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect built-in scope: profile','openid-connect'),('3d56148d-6e98-467e-8f72-e3f3dc501d12','address','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect built-in scope: address','openid-connect'),('43d6099d-de9f-4cfe-9b90-3f8a9d24893b','phone','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect built-in scope: phone','openid-connect'),('458edf76-2983-4298-87b1-337b2c5f991c','microprofile-jwt','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','Microprofile - JWT built-in scope','openid-connect'),('668f6da7-6e0b-401d-9f7f-4c386e6bf67e','offline_access','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect built-in scope: offline_access','openid-connect'),('75bf0cc6-ba85-4cf9-b61d-cb804ed1305a','roles','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect scope for add user roles to the access token','openid-connect'),('81e06f3e-b4c4-4589-aa17-8b11fba38ae6','acr','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('82ffd85e-1cae-4a7c-a283-4af577cc63c6','email','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect built-in scope: email','openid-connect'),('9d002300-881d-4bc2-841c-8d82edf99f53','email','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect built-in scope: email','openid-connect'),('ad9a560b-f02f-4ae5-b941-8820aa80bd3a','roles','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect scope for add user roles to the access token','openid-connect'),('b23566d3-e16c-4fc2-9b52-a3af2e721a6b','offline_access','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect built-in scope: offline_access','openid-connect'),('b81a6310-2f42-407b-8779-855877f7c21d','web-origins','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('c2a27d7b-5c0c-426c-a7b8-4f215722d31a','address','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect built-in scope: address','openid-connect'),('c4fd8ef1-d418-4eab-b6af-dcf8a6211477','web-origins','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('c82a800b-91a1-46c7-82fa-c2bbc4d79d04','phone','0a15b7e6-e191-4f97-811c-f3c7ec24f613','OpenID Connect built-in scope: phone','openid-connect'),('ce299185-74d3-48a8-924d-addea0bd77ba','profile','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','OpenID Connect built-in scope: profile','openid-connect'),('d0d58b5e-2d6a-44f5-9b5a-a05b854ad962','microprofile-jwt','0a15b7e6-e191-4f97-811c-f3c7ec24f613','Microprofile - JWT built-in scope','openid-connect'),('daeaa797-c79a-4687-a40d-e2f68441e895','role_list','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','SAML role list','saml'),('fbc93cb0-d6b3-44d5-8561-133316817b7b','role_list','0a15b7e6-e191-4f97-811c-f3c7ec24f613','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('29cded68-a1ba-46e1-a3ad-f88bec1754b0','false','display.on.consent.screen'),('29cded68-a1ba-46e1-a3ad-f88bec1754b0','false','include.in.token.scope'),('2f5ccb61-36b7-4257-9de8-38555f977c7e','${profileScopeConsentText}','consent.screen.text'),('2f5ccb61-36b7-4257-9de8-38555f977c7e','true','display.on.consent.screen'),('2f5ccb61-36b7-4257-9de8-38555f977c7e','true','include.in.token.scope'),('3d56148d-6e98-467e-8f72-e3f3dc501d12','${addressScopeConsentText}','consent.screen.text'),('3d56148d-6e98-467e-8f72-e3f3dc501d12','true','display.on.consent.screen'),('3d56148d-6e98-467e-8f72-e3f3dc501d12','true','include.in.token.scope'),('43d6099d-de9f-4cfe-9b90-3f8a9d24893b','${phoneScopeConsentText}','consent.screen.text'),('43d6099d-de9f-4cfe-9b90-3f8a9d24893b','true','display.on.consent.screen'),('43d6099d-de9f-4cfe-9b90-3f8a9d24893b','true','include.in.token.scope'),('458edf76-2983-4298-87b1-337b2c5f991c','false','display.on.consent.screen'),('458edf76-2983-4298-87b1-337b2c5f991c','true','include.in.token.scope'),('668f6da7-6e0b-401d-9f7f-4c386e6bf67e','${offlineAccessScopeConsentText}','consent.screen.text'),('668f6da7-6e0b-401d-9f7f-4c386e6bf67e','true','display.on.consent.screen'),('75bf0cc6-ba85-4cf9-b61d-cb804ed1305a','${rolesScopeConsentText}','consent.screen.text'),('75bf0cc6-ba85-4cf9-b61d-cb804ed1305a','true','display.on.consent.screen'),('75bf0cc6-ba85-4cf9-b61d-cb804ed1305a','false','include.in.token.scope'),('81e06f3e-b4c4-4589-aa17-8b11fba38ae6','false','display.on.consent.screen'),('81e06f3e-b4c4-4589-aa17-8b11fba38ae6','false','include.in.token.scope'),('82ffd85e-1cae-4a7c-a283-4af577cc63c6','${emailScopeConsentText}','consent.screen.text'),('82ffd85e-1cae-4a7c-a283-4af577cc63c6','true','display.on.consent.screen'),('82ffd85e-1cae-4a7c-a283-4af577cc63c6','true','include.in.token.scope'),('9d002300-881d-4bc2-841c-8d82edf99f53','${emailScopeConsentText}','consent.screen.text'),('9d002300-881d-4bc2-841c-8d82edf99f53','true','display.on.consent.screen'),('9d002300-881d-4bc2-841c-8d82edf99f53','true','include.in.token.scope'),('ad9a560b-f02f-4ae5-b941-8820aa80bd3a','${rolesScopeConsentText}','consent.screen.text'),('ad9a560b-f02f-4ae5-b941-8820aa80bd3a','true','display.on.consent.screen'),('ad9a560b-f02f-4ae5-b941-8820aa80bd3a','false','include.in.token.scope'),('b23566d3-e16c-4fc2-9b52-a3af2e721a6b','${offlineAccessScopeConsentText}','consent.screen.text'),('b23566d3-e16c-4fc2-9b52-a3af2e721a6b','true','display.on.consent.screen'),('b81a6310-2f42-407b-8779-855877f7c21d','','consent.screen.text'),('b81a6310-2f42-407b-8779-855877f7c21d','false','display.on.consent.screen'),('b81a6310-2f42-407b-8779-855877f7c21d','false','include.in.token.scope'),('c2a27d7b-5c0c-426c-a7b8-4f215722d31a','${addressScopeConsentText}','consent.screen.text'),('c2a27d7b-5c0c-426c-a7b8-4f215722d31a','true','display.on.consent.screen'),('c2a27d7b-5c0c-426c-a7b8-4f215722d31a','true','include.in.token.scope'),('c4fd8ef1-d418-4eab-b6af-dcf8a6211477','','consent.screen.text'),('c4fd8ef1-d418-4eab-b6af-dcf8a6211477','false','display.on.consent.screen'),('c4fd8ef1-d418-4eab-b6af-dcf8a6211477','false','include.in.token.scope'),('c82a800b-91a1-46c7-82fa-c2bbc4d79d04','${phoneScopeConsentText}','consent.screen.text'),('c82a800b-91a1-46c7-82fa-c2bbc4d79d04','true','display.on.consent.screen'),('c82a800b-91a1-46c7-82fa-c2bbc4d79d04','true','include.in.token.scope'),('ce299185-74d3-48a8-924d-addea0bd77ba','${profileScopeConsentText}','consent.screen.text'),('ce299185-74d3-48a8-924d-addea0bd77ba','true','display.on.consent.screen'),('ce299185-74d3-48a8-924d-addea0bd77ba','true','include.in.token.scope'),('d0d58b5e-2d6a-44f5-9b5a-a05b854ad962','false','display.on.consent.screen'),('d0d58b5e-2d6a-44f5-9b5a-a05b854ad962','true','include.in.token.scope'),('daeaa797-c79a-4687-a40d-e2f68441e895','${samlRoleListScopeConsentText}','consent.screen.text'),('daeaa797-c79a-4687-a40d-e2f68441e895','true','display.on.consent.screen'),('fbc93cb0-d6b3-44d5-8561-133316817b7b','${samlRoleListScopeConsentText}','consent.screen.text'),('fbc93cb0-d6b3-44d5-8561-133316817b7b','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('14aca870-4fb0-4885-b6ee-17dcd35999e1','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('14aca870-4fb0-4885-b6ee-17dcd35999e1','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('14aca870-4fb0-4885-b6ee-17dcd35999e1','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('14aca870-4fb0-4885-b6ee-17dcd35999e1','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('14aca870-4fb0-4885-b6ee-17dcd35999e1','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('14aca870-4fb0-4885-b6ee-17dcd35999e1','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('14aca870-4fb0-4885-b6ee-17dcd35999e1','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('14aca870-4fb0-4885-b6ee-17dcd35999e1','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('14aca870-4fb0-4885-b6ee-17dcd35999e1','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('3148d26c-6499-4f31-ba86-0b31e1f850ac','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('3148d26c-6499-4f31-ba86-0b31e1f850ac','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('3148d26c-6499-4f31-ba86-0b31e1f850ac','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('3148d26c-6499-4f31-ba86-0b31e1f850ac','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('3148d26c-6499-4f31-ba86-0b31e1f850ac','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('3148d26c-6499-4f31-ba86-0b31e1f850ac','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('3148d26c-6499-4f31-ba86-0b31e1f850ac','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('3148d26c-6499-4f31-ba86-0b31e1f850ac','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('3148d26c-6499-4f31-ba86-0b31e1f850ac','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('3a23f4ef-168f-4131-b54e-56714e552113','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('3a23f4ef-168f-4131-b54e-56714e552113','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('3a23f4ef-168f-4131-b54e-56714e552113','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('3a23f4ef-168f-4131-b54e-56714e552113','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('3a23f4ef-168f-4131-b54e-56714e552113','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('6f82a2bf-2315-4524-86f7-573de5bf8c40','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('71ebe05b-f046-4083-aec8-4e4a0e08938f','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('71ebe05b-f046-4083-aec8-4e4a0e08938f','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('71ebe05b-f046-4083-aec8-4e4a0e08938f','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('71ebe05b-f046-4083-aec8-4e4a0e08938f','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('71ebe05b-f046-4083-aec8-4e4a0e08938f','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('8162a34d-4786-49b3-bafc-d009851ca912','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('8162a34d-4786-49b3-bafc-d009851ca912','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('8162a34d-4786-49b3-bafc-d009851ca912','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('8162a34d-4786-49b3-bafc-d009851ca912','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('8162a34d-4786-49b3-bafc-d009851ca912','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('8162a34d-4786-49b3-bafc-d009851ca912','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('8162a34d-4786-49b3-bafc-d009851ca912','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('8162a34d-4786-49b3-bafc-d009851ca912','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('8162a34d-4786-49b3-bafc-d009851ca912','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('b6aa4ee4-0c96-4a32-8438-7d904ee7999a','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('e064d5c6-58ba-4933-90b4-e8396859d6b8','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('e064d5c6-58ba-4933-90b4-e8396859d6b8','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('e064d5c6-58ba-4933-90b4-e8396859d6b8','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('e064d5c6-58ba-4933-90b4-e8396859d6b8','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('e064d5c6-58ba-4933-90b4-e8396859d6b8','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('668f6da7-6e0b-401d-9f7f-4c386e6bf67e','93fd8802-38ef-4401-9d65-24d8783d01f9'),('b23566d3-e16c-4fc2-9b52-a3af2e721a6b','98a9d23f-4f53-4bbc-a17d-f6c09ea908ca');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('01540fef-f33a-4d3b-97df-eb461bbec0d2','Consent Required','0a15b7e6-e191-4f97-811c-f3c7ec24f613','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('07528e62-45c2-4361-ab93-00b32bea1610','rsa-enc-generated','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','rsa-enc-generated','org.keycloak.keys.KeyProvider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL),('0bcb20c5-b404-4bbe-90f4-187fe9ba64fb','Full Scope Disabled','0a15b7e6-e191-4f97-811c-f3c7ec24f613','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('15a4484b-a9fe-41df-bdf5-b87e25b710e5','Allowed Protocol Mapper Types','0a15b7e6-e191-4f97-811c-f3c7ec24f613','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','authenticated'),('186c232e-3c90-43a0-bd47-a050b122321b','Consent Required','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('2e22e4d6-1b87-4bcd-8694-c95b87483fe5','hmac-generated','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','hmac-generated','org.keycloak.keys.KeyProvider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL),('49323418-059f-4695-a215-447ee052e819',NULL,'0a15b7e6-e191-4f97-811c-f3c7ec24f613','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL),('52b2d455-836d-4711-a49a-8e3e4e4ef248','Allowed Client Scopes','0a15b7e6-e191-4f97-811c-f3c7ec24f613','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('5d02cbd9-144b-4821-a747-124c09d47a97',NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL),('5dae8a4d-65b5-46a3-97b1-d07026840c37','Trusted Hosts','0a15b7e6-e191-4f97-811c-f3c7ec24f613','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('7d26f98d-1f35-4e73-98d4-2b71656ec015','Max Clients Limit','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('91a6abea-45c0-48e6-96a2-12839c4e71bb','rsa-generated','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','rsa-generated','org.keycloak.keys.KeyProvider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL),('95224bad-af45-4b35-a82a-55594eebb4a2','Full Scope Disabled','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('a2658e66-49d6-4223-ae78-e74afad09453','Trusted Hosts','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('b0143a70-86a0-4e26-bf66-ac8f398ae2c8','Allowed Client Scopes','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','authenticated'),('b2343488-8bc2-43b2-a61b-56cb176b3bbe','hmac-generated','0a15b7e6-e191-4f97-811c-f3c7ec24f613','hmac-generated','org.keycloak.keys.KeyProvider','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL),('bd025505-33d5-4634-89d0-3bf05bdb74e3','aes-generated','0a15b7e6-e191-4f97-811c-f3c7ec24f613','aes-generated','org.keycloak.keys.KeyProvider','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL),('bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','Allowed Protocol Mapper Types','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('c99608fa-2fcc-48b6-85dd-36e654c3bb0d','aes-generated','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','aes-generated','org.keycloak.keys.KeyProvider','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL),('c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','rsa-enc-generated','0a15b7e6-e191-4f97-811c-f3c7ec24f613','rsa-enc-generated','org.keycloak.keys.KeyProvider','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL),('cab82ae4-ddee-4861-9eae-25d00e5612a3','Allowed Protocol Mapper Types','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','authenticated'),('da0bed96-bfc3-4744-8fd7-bb71f2bad7f4','rsa-generated','0a15b7e6-e191-4f97-811c-f3c7ec24f613','rsa-generated','org.keycloak.keys.KeyProvider','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL),('da677052-c447-42df-8ebb-479b7ec8bdf2','Max Clients Limit','0a15b7e6-e191-4f97-811c-f3c7ec24f613','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('e19b5bf0-81b3-44a5-a644-009555dec34e','Allowed Client Scopes','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','anonymous'),('e4feb59e-7149-449e-9adc-df2d234274af','Allowed Protocol Mapper Types','0a15b7e6-e191-4f97-811c-f3c7ec24f613','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','anonymous'),('fe0e52d8-7895-4f44-8ec7-c1015dc4795d','Allowed Client Scopes','0a15b7e6-e191-4f97-811c-f3c7ec24f613','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00a36182-6748-439b-8008-11c7684ca81b','c99608fa-2fcc-48b6-85dd-36e654c3bb0d','priority','100'),('039cb6b2-d9e3-4cbf-84e2-076d6c6e19c4','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','saml-user-property-mapper'),('051f24d7-d1a4-46a7-808c-88c2e8279aac','da0bed96-bfc3-4744-8fd7-bb71f2bad7f4','certificate','MIICtTCCAZ0CBgGMtGR6hDANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNwb2xpY3ktZW5naW5lLXJlYWxtMB4XDTIzMTIyOTA3MDM1M1oXDTMzMTIyOTA3MDUzM1owHjEcMBoGA1UEAwwTcG9saWN5LWVuZ2luZS1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKp8/5ZTJpt6kjv+TvQTtVZT56CJGKsi1txuIdbJfotdgJmi/OQdwVVG6GqqaDCwjIXWmxcWWJttBg71WlVxwWnCFu4812LGhe6E4VzfP5jz+GNB99RSG3VJOI1MgPTGS1LZIRiuo1KziA+0/oxt7SKYemgR0cXTJAZdpJW0ZFHkcjIScIghXOh4cd1hmco9NpLnTvrGV6IxJG92FlNG+4aoE8cEiUSCz8TeTDxH4BsKsHUIiYZjVAW10GrhXLGhnZVEw9tyxJfaJzmhCOKz3lf2HCHBixn5AYWhpIKcNEZDNkqFkCy0LQGCB8w3FqEh6AxvobRw4gX6MnoW0NkktiUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEARi2pmxJLWhiPPaEQRJ9vSPkxHUUPHbS0PvOgmK5GHeX+I5AGhtWcgboZURKXz/OTiwA7YdmAZJOstwIEWTqC6/Y7KpfGwppekQauVvEnZt6K2u6Pm1cCzFjwLxU1GcCf3XXoG/TnSjmG3ntvtLak2uTwCbCo9o81hDN/jnQRKE+dDAxOjYwT52xk0vHRGQKflJdVQZfeRbxtfPgYcjDEjTaZi/TK/qOM54D+NwvTwi1n6PeDBgJ1A5dQ1gyend+Va0VTQwU011U9RIzjw7t7WWOsRcjIX91jo234+J63ZNdbgbXg/UpAx1wKNBLvqrXMaMws7e0fSHJTGMWL+CKXHQ=='),('074b02a0-65a9-4667-846a-2fb8fc7036ae','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('10cb802e-8b9d-45f9-904a-6d64c159bfbe','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','oidc-address-mapper'),('121c3eff-b994-40dc-81a1-c07be88526b4','07528e62-45c2-4361-ab93-00b32bea1610','privateKey','MIIEogIBAAKCAQEA3k8f2Cx7B6cQ2Uyzey/PBTCLuMSriJi97tLYXJwnVt6DOIPi4fbV5xJjT9WHIB9YlLrz9PuWbU6yUz8cPiatiTZFGdxwbTUJm7Q0buvAQzNELGZbyOVdy6dGO821YTLTFsSGtsKPuxMDTjE7GR38J00lTGKPCBx374opvSntwjNw5FknlEKNIn3A59rkDuAMU+GTcTuVnJH4aAAkTrHzPBPY9dqvwR7AV9lW3ymTJV7x3aZG9DFCn/KFzPMDJyviWtPAbRGT9b63XWLbwiscxYvYLTws9BAlkh0NdjgHZGcw6Q3E5zw3eTeryrSVIXoKbRFSZ0Kt7qLrFBLdPjbbOwIDAQABAoIBAA/qAyITARWpqIOdwYVyhTPeZ0opTgw/vuz/S/zJMum9kRA1JMM/S824W8KlywAKLmmrPnaNohWeGhbqgCeU1jxp1aWFyciPkOoECvLbzo4g9+LjyvNFNCM1jMoQLklQfZr2I5ymrepa8JQi4xOnuVrI44Al2A5hF1bfAaDohPwvV1ayyIQdqgxMxFxBRwQqqu3IppI1mOGp3gDfia98wKYld+7zsX3XEA/zRcJ3VWJwk3z8rvAmLDEABGWrz6z66ubF6Iq1vbFJ2UDtXUgYe49B3TFaoANy1wQQiZD8N0c3DW5h9Jw6LBOaincjsReDDW56G7vQDZbbdu1tg/icKcECgYEA+fceicPnNZ8pvLfofBlPLXaaWjRzeFpeYVXI3Z9bvdyUNlBy5+RZ0fORUNHCnclNKxLclj0ln6ttKCIeGPOZGVgsxtYwxo9tlBQPRQPnAKDMBW2fmYddwUi2p6vNksCuI8FGWTWGwD1MI52LvJ72P2ddj5jyTiO3KdW5dtKmtXsCgYEA460UPou6sDaXEfbV01mFrd213ZmlKMkFvrNnZprnphYSlEylR9HTXpSN/ntZYSQx+ZAlgMKNkZfv4sXNuGuwsborsQJU+vYZH2ym7Z2e5ou/jZm5ldlK72HzvuWhFwG5LgkQZ3SNJtCbq3Go2MWD0svi8yEMf5wnfWxFMEh4JUECgYAPgxFnFTws7LKnXnZT9TIfrSOJA4ZC6sC+o5cygags0Rp1gGqRD2+vgsD61fmQ1yQtzx7XR/YkwXulqPBbNgrDMuCcekBOoin3rYMBEmvscw4WLCZiXa8oxn1nTFcWi1SDLYRTFupE1cj60NUSIH9BkgWRWrl2teqw8u1ufUYRLwKBgG2/VZ3crw4YEnRXXrU1Vwn7cJo0YPerBvjo8/Pywa0+wI/57kYTb+cMhvHftbLsxqY9BMbvgVxoN/tBTCwUxSS20C7QJ/SdQnjyX/j0XM9XF+wC6QHBr6x6tAsWF7PGYeQ9/ElSVmQadJ+M904ez6+CFpEKIkM1G5gK48Mle7zBAoGAEQepL2QLWbwaUAY/lTPvvKm0ZDpGnSInuj8ZcbwudVkf+NO2BxDv/bNQuypxY4SIz3JOMAwXjnwPVIIZlOQ4tzXDNSk7q2amLtUTvdMEK38/KIW37jLsHEVtNI/qhHADCsHFmR1+i/7XWDU5ECoFtOMn/ahT8hvOWFq7F9AtM2M='),('1535406c-d7dc-40ff-97c1-2e87a6f62a87','91a6abea-45c0-48e6-96a2-12839c4e71bb','priority','100'),('1583033c-e9b2-4d9e-8974-b0addbe48d4c','91a6abea-45c0-48e6-96a2-12839c4e71bb','keyUse','SIG'),('1c845a7a-c27d-458a-a6b8-ddc3fdbb76ec','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','oidc-address-mapper'),('2392ebb9-1c48-422c-a9b9-abb44979b5c9','5dae8a4d-65b5-46a3-97b1-d07026840c37','client-uris-must-match','true'),('2849f54c-ca67-4ef1-a893-9bfa0f31d265','c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','priority','100'),('2d030914-cd9e-4798-9f4b-2d8746475260','2e22e4d6-1b87-4bcd-8694-c95b87483fe5','secret','h3Imfzz_zYvJyHjEJaiob6FKXCO0PX0vmX-GNWAYujgKGEYouFAT6GFAqwVVrVNopnUUeFlERckgDGoUg3iJ1g'),('30b85f43-346c-4754-9ff9-036b482e2775','91a6abea-45c0-48e6-96a2-12839c4e71bb','certificate','MIICmzCCAYMCBgGMr++vzDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjI4MTAxNzUwWhcNMzMxMjI4MTAxOTMwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqUqks0kt8sAq9Am/zD1wiCtUhfdtKrqi3hPO9h2JBfxJIJBvtJh0gIQpnNI2aqIH/zNktE7/bh099TnqZbx4o+jczk3p3Pwb8kQirKXEDxOI8NjJ4HQIK2Hv5xqs1BPkjC1jw+POmdq3BpgEPRCJFunTJ/jgBwTYVIb1f9vnYz1ZF9BUblUtwJDib8JNwswcFKITEaP1FMqBYQlI5MldN4T6doghYrPki2fbmOGhdWra5ScqvBSnlyc0+O+/UAVc1l9pMqIVkGZouilZs7KI4Zr8bBJXWMA1KUPpanJnFFE1Dpa/K6sk8numdmurynw0h8D1ydFvSklFntC8AaSc/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBABHLHF4hzXVmBHhLbZOC6XYreHyMP27D3YXuAPehz/8ZwzemxP/muTuwaV83GHMjk4Z6Ei0fB4zGU+23+b7sO7NZVNuW7iDhPXIGwbJWWEQLz6fj+nbev+JhAjx8UjFFPA2gN7pYv8lCLc5eWVkKs3pwkbSu3/YMMvUyDjArRbiUwR9nQ5TLeqXaigLykrBPR1qWT0H75yGZ2/VtjsiGkNg0g8SEg6oxbmhgQyAMARIyPshX7H/Q2+3VYu4VBBNd24+Elg7UNunOCicvu/84zUIJFOaMRR3NQraAfUq4Nh4zaL0PlHV3Tc8BHBxckDzt2A4GxVyPZuvcrQTxG20GjQQ='),('344546e6-25d8-448b-9324-fa8843d922c6','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3478cf17-263d-4e58-8edb-3dc3ee3a5a4a','7d26f98d-1f35-4e73-98d4-2b71656ec015','max-clients','200'),('34c53f47-1037-42c0-bc0a-59eea6b538de','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('35e4c735-8d31-428c-9f15-c954fc621038','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','saml-role-list-mapper'),('3650f552-7fac-42dc-b39f-a3df709c9648','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','saml-role-list-mapper'),('38514ba3-598c-4073-bb30-10e71550bf33','bd025505-33d5-4634-89d0-3bf05bdb74e3','kid','328aed63-08a1-453d-96c9-de277d7050c1'),('394a9748-22e2-4d73-918b-832eed4956bf','a2658e66-49d6-4223-ae78-e74afad09453','host-sending-registration-request-must-match','true'),('3aee386f-6e33-4267-a8d5-4a502a356026','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4057156b-7beb-48a4-bafc-85a2304e6fc7','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','oidc-full-name-mapper'),('40862ac0-8186-4474-9450-c335ed21946b','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('42e0b5ae-fc24-4f84-aeb4-1434bdefc69f','07528e62-45c2-4361-ab93-00b32bea1610','priority','100'),('443351f0-851a-4fd7-a804-0a9c05bbcbd4','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','oidc-full-name-mapper'),('469763bf-9f71-4694-8e95-61722bd4365c','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('46e5f35f-d556-47e8-acbe-feebb14b4f22','e19b5bf0-81b3-44a5-a644-009555dec34e','allow-default-scopes','true'),('4a8c1a54-f394-43ee-9936-f0592f6e53bf','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('4e3a2eb5-0ceb-4b08-a36d-1eb1374cdab4','c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','algorithm','RSA-OAEP'),('4fdf1ac3-854c-428b-b776-f78e6349691c','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('50b9df96-a94f-4ff5-b867-445c1c3d8ebb','b2343488-8bc2-43b2-a61b-56cb176b3bbe','priority','100'),('54aae2cb-065d-4e94-8d61-ad583e360546','c99608fa-2fcc-48b6-85dd-36e654c3bb0d','secret','9pFoSSPagtWul4KKN1osmg'),('56492f58-4dc6-4127-8c92-10e8c416186d','52b2d455-836d-4711-a49a-8e3e4e4ef248','allow-default-scopes','true'),('594e78ae-2f8b-4e2f-81f8-ba2575ae0abd','07528e62-45c2-4361-ab93-00b32bea1610','algorithm','RSA-OAEP'),('607aea2b-af17-4386-b0bc-de45f0df9f88','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','saml-user-property-mapper'),('69d50520-139c-4f6c-88ff-d03dfff27c09','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','saml-user-property-mapper'),('6b63a467-297c-4e5b-9bd3-4f703c0473c5','b0143a70-86a0-4e26-bf66-ac8f398ae2c8','allow-default-scopes','true'),('71b3ec98-7e47-499b-9321-6999cd3be743','bd025505-33d5-4634-89d0-3bf05bdb74e3','secret','5RX3cDnq61dnahLf-bgD-w'),('781a1abf-fd30-481d-abc0-f50507f8367a','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('7b199d35-e4dc-4f8e-824c-47791fdb50a7','da0bed96-bfc3-4744-8fd7-bb71f2bad7f4','keyUse','SIG'),('8621b7cb-18bf-4539-9a1a-545b90c98217','15a4484b-a9fe-41df-bdf5-b87e25b710e5','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('86f3f182-feaa-4d8f-8388-abeea82761e4','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('86fbb923-b6e0-4dd2-b36d-e666d0db6531','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('914a1458-5212-4b6a-aadc-1fa803c3845e','b2343488-8bc2-43b2-a61b-56cb176b3bbe','kid','364f7d0e-93fb-4b6b-a44d-03000462c5f9'),('9b759e58-f360-4fba-959e-527628cff378','a2658e66-49d6-4223-ae78-e74afad09453','client-uris-must-match','true'),('9d0ce498-68b5-4aaa-bdd9-6d6a8e4b0fb6','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','oidc-address-mapper'),('9e3bdfca-3620-4840-8b37-1b577f056390','07528e62-45c2-4361-ab93-00b32bea1610','keyUse','ENC'),('9f3d34a8-dba0-4130-8d7a-2aef76b9f7d6','2e22e4d6-1b87-4bcd-8694-c95b87483fe5','priority','100'),('a8a05a0d-2899-4988-9d3b-95759932202d','bd025505-33d5-4634-89d0-3bf05bdb74e3','priority','100'),('a8f7e5c4-6556-4387-8687-304e5ced4089','c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','privateKey','MIIEowIBAAKCAQEAuWHmYZwWwjBgiXPYG5gN0HJPCNABV7W8jW/YgmHT9TwD8ul7EMUwPPmhD8y6J5RP7hnDkSM9PTtHki2Rd+bGh0v7oGCM0PztLfMDVmY7oTh3PMpPY2ewfKXbsuiA85Sch/p+15dP5Br4T7daCNt2WqyWFwKLLeQBmn2Gts+cBhg65IwdEAZdEzFEH9m3cejwiHXs3PGuGaBCDecWl1Ej5329b7LQ2UU9rmlRMzN/RSrE5KqPgASjLzDQ5jkM0NiCuw90tsjEV0X8FrBPfVcKOZ9z5JS4vbQdMornX1h1zQDvKS7cQhAzAGsQrpa1UUDhFLOTERGOx4lzUC1u+SJ5cQIDAQABAoIBAADgB8/CZj+arZv8gGLJ9he7sGiS3czBkn8q7d9YsaDU3JJpHH/85FBHX+WkkmTlL/boZ3pQC6YWOW1k2mzR2bJSDyEnz4ZdiUuYG/YMk7+8NeDjNhp6pvRBrq6ypwgvVYlVSwO+xr1ljLJIo+vKiG2fZrJ7XDeWXdUSPmBuzLZhJRcc5uwyVrSVn6zb9a5PZQ4NOO90P+91E2x6KMIITW0R7BGR4QQiDj+ZlCKpwUPS8t2ht0/XOWud8/9qfTU6ju/X/ir2HpbfsUuGZibnUbBWE6emF6BnkSBL84IBsIHRCukiOfhzvUwVUWy/CwFN/MM86OvYLCWgOs+pWW67yIECgYEA6i2h/YcfArcdL+Xa/rJK4n871Lao/+Y1dOUuMlNd9yfSeBRuJlZ/9YDPeTIfgS56WPhwaaKVS+OUZAb2NSQj5CcuUgF6NHRvg67LkwXJi2vATcAA2qcOdukiZ8XJTJAO1x+kiTjNhKdxm8fSrOzZ17d5OZzHQzgEiLDo425H5TECgYEAyqg7tBaZccynJ5U3RF5TlyGC7EAyOSYQmgTDCmCnmUDhdZBFHLFBtUar9Pj/XX5By/JdkbM0KtiyXKNHtG4dQumUyp66MfknN19a0LJTzlHxxkeKbxskOk+M3LnFWW73fcYxzUBSF+TTYtnCeuqqoICQK/CKbns+ohnpV3JDyEECgYA+B/hw/+nm/jptBaYM8Y2Ekc93eSsrHf/rBwpFqm+pmJLX3BGRdjhO/9/1aqGNxpICH00nrjl98LrOBEoTqY8YUIikkF+epXkkmJi0SUQp+lDmR4XyZW4fcYH7mxjHfyFvOqKK9tD54qDlcvkLdXH/AkrKSA1AcQZCbxpBpGTHAQKBgQCPsnaTHas0HA8ybAXCPrg645I3/tUd3LXM4C+EPkDY1D6J5AB9ddrHtRLdI2m/W3VALdzXISCOeRUPxt9jOukYtxPAEIiqQqbiBoUYkjoGg+hR1gx899vaVOnm4PrkjWCEGHLbvQ34z1JsN0hFa/wMztxrq6Yc7Nreik0Aqo8RgQKBgEDFbBjDEYzpg4v+DA4pgko9+HYbur5w4mzQYj1YoL0n0UKwSpCxLavMkoxwlcEMQCst39byeXE1i/FOqmFGocUpzjjJsyyW0+EdNLkaeLVbFS3RQUEcLUhxo8V4on0G7GY9lj7L/AH4sPrDakZMPAnrQC2+G9cLs9tjNF77xz0E'),('ab040702-35df-44df-a414-53d38e792d0f','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','oidc-address-mapper'),('af21b9e9-726d-4d5c-a262-6362171ec4cb','c99608fa-2fcc-48b6-85dd-36e654c3bb0d','kid','c83c5352-6e3e-49f5-b337-d8a4737e89e0'),('b1fa30b0-4aa7-47d9-8cc1-86e890da39e4','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b3f2a0f3-866b-4e81-b495-5cf1388b81ab','fe0e52d8-7895-4f44-8ec7-c1015dc4795d','allow-default-scopes','true'),('b41287da-b84c-4aea-8d84-552f532a5e81','da0bed96-bfc3-4744-8fd7-bb71f2bad7f4','privateKey','MIIEpAIBAAKCAQEAqnz/llMmm3qSO/5O9BO1VlPnoIkYqyLW3G4h1sl+i12AmaL85B3BVUboaqpoMLCMhdabFxZYm20GDvVaVXHBacIW7jzXYsaF7oThXN8/mPP4Y0H31FIbdUk4jUyA9MZLUtkhGK6jUrOID7T+jG3tIph6aBHRxdMkBl2klbRkUeRyMhJwiCFc6Hhx3WGZyj02kudO+sZXojEkb3YWU0b7hqgTxwSJRILPxN5MPEfgGwqwdQiJhmNUBbXQauFcsaGdlUTD23LEl9onOaEI4rPeV/YcIcGLGfkBhaGkgpw0RkM2SoWQLLQtAYIHzDcWoSHoDG+htHDiBfoyehbQ2SS2JQIDAQABAoIBACTw9c6kUMrCudn/BiuT86hzgM6DtlEquOTFhlaMjXt0NK/VpbdmDSTFuwmVyAK41pIPiMZtZKC09GmcV0kJX4/jauWPUFpKSu3+Y/ikNRsWzhzvx9v9OI7m4TaYu56OMvcOLkIzYRdD6HkCzl8uWII1CNzw84PKdtVcSBPaJRyrKTknVGWkQYxVI5idO/0pzNcGYy7/YdgLUqGodek7eVqWhFzhb3vO25VN+cgad4cCGV/OkWz6YvOf33g1kSYhRWbanBla2pRsCJKA5EZb+0V8yJpREZtTpOaC9KmhomNypYaUSmwmapgJiDzZLMc1cKOL3y4uMhtJ7JRJNT8RAmcCgYEA3Lbt3YO37fKnioZXz9QXK3hIbniqBNYW3iPvn+JZmbRMnQYBl98l79qjeI8yA+NriPnzR3OXCdjE1LHiikSWZgLPnvvBPttUu5jqfYwrDiCU4D7P+Fh27I7fXnEOV47ov/edCDRf2PoOzZHTVo+FIt7Lg4AdkRC52NT3cqZwGwsCgYEAxb572DwGJwK/Vk3NW9eYgldcPASg+Q66ubnFXlW3fwsQshD+iaSiHtGxeTi2ksYHJe6fXzIyQ4Xv+yc9++dcsSN2PE0cx0VCCujOSmFa94tAfoqfqFPlbXMB2oqxnpLmq/zdwCm1sMgXDoXBXW7o8sUpjb+y1HgaijB6rUVZsY8CgYEAmV2XTXwwe2xIlQ4iyGwkqXUMR48a/P9Sposr/9pFznMlZVr+EmzhrJgtTSGbbG5Dk8uzC2w7gIEazHzK4K8mHr5HTL69GhNH/o8UKacTZ96l9GhRFM1L3bataa9/esH34ySI/mF+VIP1c0yoIJbbuU489iQ450tLCGt7gjQ6498CgYEAmSVBPOKf0S6riOeQmASNNMT7xe+/y6PAsX5SgRDZoCats3q951P9yuiUDlIB9AIyHwqDm3KAwxLEHTrzIli4zOet9l2yYBIfZ9uNiMWFchoCxP4PUIpJMU7UrLClhy42QBUCmIS1FkigsrqcWwQ+nWZdHE7O7QZnZ4bMO81t/bkCgYAmPwQ+aP249UA4/rSbGw71Iw6UvoS55rDDB7p8eceKvU7XVmsgiPrKwpfhdMG0NfOLS592hqCCRa/06vN/O64KAs/xW1qII6oRYgQX0jeY/X51rGMTkjcoK0HtYGe+i625sSFK+vgNhJo2EwfwVqQxOd+MhEcilUMiWk0Hq/YnGg=='),('b4132acc-ccb3-4ba9-9fb1-4281f6e0e5b8','b2343488-8bc2-43b2-a61b-56cb176b3bbe','secret','BvXsDk6_sxs_MdQjdt4_lWJOLaOU3Ii6wS9HrLdBrmnCuTvW3vua8Od74Azkmcv8KEZrqp5J5zO-Uh_xjTqQGQ'),('b7fd4186-19e7-4ae7-bdd2-703eb45bb3a3','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','oidc-full-name-mapper'),('bac64839-d5b3-4185-b3a9-868cdc96c043','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('cb1f61fb-5cc0-48a7-9b85-8d63ff1316bd','5dae8a4d-65b5-46a3-97b1-d07026840c37','host-sending-registration-request-must-match','true'),('d0813b74-8a49-4e17-b9a2-54a07abd7ca0','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','saml-role-list-mapper'),('d1c6bc0d-b87d-4ab8-9f4e-4c5cc65a2206','da0bed96-bfc3-4744-8fd7-bb71f2bad7f4','priority','100'),('d68129bc-d0e3-4f1d-999f-201c46a288bc','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e0868573-5c1a-462a-9237-0e22f387dd9f','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','saml-role-list-mapper'),('e0f04027-e90e-4137-8f14-703667e6ed4a','b2343488-8bc2-43b2-a61b-56cb176b3bbe','algorithm','HS256'),('e222863f-352a-4d8b-8e97-467e87375fd8','c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','certificate','MIICtTCCAZ0CBgGMtGR8hTANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNwb2xpY3ktZW5naW5lLXJlYWxtMB4XDTIzMTIyOTA3MDM1M1oXDTMzMTIyOTA3MDUzM1owHjEcMBoGA1UEAwwTcG9saWN5LWVuZ2luZS1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALlh5mGcFsIwYIlz2BuYDdByTwjQAVe1vI1v2IJh0/U8A/LpexDFMDz5oQ/MuieUT+4Zw5EjPT07R5ItkXfmxodL+6BgjND87S3zA1ZmO6E4dzzKT2NnsHyl27LogPOUnIf6fteXT+Qa+E+3WgjbdlqslhcCiy3kAZp9hrbPnAYYOuSMHRAGXRMxRB/Zt3Ho8Ih17NzxrhmgQg3nFpdRI+d9vW+y0NlFPa5pUTMzf0UqxOSqj4AEoy8w0OY5DNDYgrsPdLbIxFdF/BawT31XCjmfc+SUuL20HTKK519Ydc0A7yku3EIQMwBrEK6WtVFA4RSzkxERjseJc1AtbvkieXECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAO5nBr0QzKp0S/7G8pYMBGm/Kt7+QEEQCy5q5SX9cfFD7+1ns+fWA8JwAyD/cR667aLJHhR9Ia8oZHJglEmOEqLYPPUu96N5N0le45jGjRzSfwfye2ggSxRE0OKk8wFNr+fTEmHlTjkLyMllK7PweOeldVeZlwllks9d7kUgkWoF5BScNdQAEymgR7VmGLdlrkjToeU7FLpjIitXBUIHFO/xl3fEOEg6ldTCJPV+a9H6Ds1cvWJrh/WJs33Okgs0RbAu0dHkkxUFNrkyDOIhkMbr5CjDK97kCSEaKJhKss9K0NeiUlPWgC4YWNR7pzcEyam1k8OBqF5+BUKD1bBXRyw=='),('e321e3c8-c3e4-4afa-a4db-1c60ba2b797b','2e22e4d6-1b87-4bcd-8694-c95b87483fe5','kid','ad539489-13e7-49c2-8478-21220b7df400'),('e457404f-6451-45dd-9240-a95d684c6e19','2e22e4d6-1b87-4bcd-8694-c95b87483fe5','algorithm','HS256'),('e708383f-4016-45d3-bf31-b3397b487345','e4feb59e-7149-449e-9adc-df2d234274af','allowed-protocol-mapper-types','saml-user-property-mapper'),('f11c9cf5-7a00-48a9-8034-ecfa3f4ae5bf','bdda8ae7-418c-4ab6-964b-a2e9d7ae976d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f198bb16-619e-46d9-aeae-5e033085ae76','da677052-c447-42df-8ebb-479b7ec8bdf2','max-clients','200'),('f6a8302a-8e7a-41cd-a0c4-8fcf5a8707f5','cab82ae4-ddee-4861-9eae-25d00e5612a3','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f9b5ff31-6906-4346-876f-d5a8a3cb9ce3','c9a2f41c-78c1-489a-9aa7-ff8a6393b51a','keyUse','ENC'),('fe64f8ee-6314-48be-96ec-bbbfae3ea297','91a6abea-45c0-48e6-96a2-12839c4e71bb','privateKey','MIIEogIBAAKCAQEAqlKpLNJLfLAKvQJv8w9cIgrVIX3bSq6ot4TzvYdiQX8SSCQb7SYdICEKZzSNmqiB/8zZLRO/24dPfU56mW8eKPo3M5N6dz8G/JEIqylxA8TiPDYyeB0CCth7+carNQT5IwtY8PjzpnatwaYBD0QiRbp0yf44AcE2FSG9X/b52M9WRfQVG5VLcCQ4m/CTcLMHBSiExGj9RTKgWEJSOTJXTeE+naIIWKz5Itn25jhoXVq2uUnKrwUp5cnNPjvv1AFXNZfaTKiFZBmaLopWbOyiOGa/GwSV1jANSlD6WpyZxRRNQ6WvyurJPJ7pnZrq8p8NIfA9cnRb0pJRZ7QvAGknPwIDAQABAoIBAAuq7PbqkwxAHQQ0qgmbCEM2vcH1FrQngdxMicv2fcch1tVFT/pvbXhZexZ11at+FqW42TnKzA5UVyAs454mLAk/ls98L1wC384me1MKXDkXYC4iwlNTHWQzz05dizXvGMgLS3T6gOpq391Pq2vpzXU8YCrENP79xuAstwXfa98rvDqGQYUzSuhLknwmwDxXzXpjXMZc+X085HzO1dKbqPT73VeZmouj3qtw9XG30OTqHFItT4NQVzfe/EWYLXlnnmz9a3TUcByWxSGqc9BVBY2cJ0iyGoGV95SSeXlZVL6sUQ+KM8bkzgyjRZqKTxUk24GClb2cVy+wm71CJryenB0CgYEA4VogaLdnnXgEZjV3N36mykA0+68qeFw/sVuVBXx04aR3pwGXm4NPifSHCzWqu/sl74rxwPd8lmV6fZ+8guMR34fBWaJVQXaM+uJN1UMH4cCRYlXqBt3A/Nf2EClBj3LQfqcRk+TV9ytW8SxVNWwqKG/i24D2RJ+7yfu44vU7IqMCgYEAwXyii+QswtWR9r0w5AXjpeDfZb66SzEPWJvV1bxXh3kRau9TCMZJmfyX7HpW1yMN2N60i5PKAcxO9fKUWUOODiAPyMFePtKrkpXnZoSnQpz4sYqppL31mRj4WYnHfZ6V0d68zfkJVXpTY71uGiSjjqguq0p4fEv3xt3GcB+ETrUCgYAMILSTziMGZ3odIg17cBZ71f7D+MZZWeWXnu0jMXJ83kQOOdi15tg1/XHzGX1JxpdhD+I411jeIzH3ZsxXYu8IT58JOuJJtp6ZteooawYWkS2B1EvW+MI1GU5FymKb3Lr5xfX9NpiJR8zTB+bCDEMsj/DujT8zrEEH+sMVe8sl7wKBgFiCx2jvLHrEcE1LJr5o40bSo99LbLVQ8BA82Yk462GRxKICcR2md6z1nBoVrPwlkQQQfM8NAG/qIoToP2zGNonHqPDRZGegv9QCtyRysoEKhcnSAODX9S3f+lwbZyLUFP04w24F6nsrxlHuKhvTfu6XiSHao1tY9TQH5+sKv9+xAoGAXiXk06KdQAuryfXc1qPY3Kd4ft20aV1BWSYWDx0QWNQo/833b3QzXFRydJHxGRZkV0Vr6AMGdZxlHVJmcF65hsJ/+sphEhl0wRqayd7cptVPMtv9kdX1Yu+xtljD09R7Lk1KQq4aeIJbLIaLVkfwY5pAMM6MB5G0qpQBGhmudsU='),('fe9079f4-4fed-413b-9815-bb3564772a35','07528e62-45c2-4361-ab93-00b32bea1610','certificate','MIICmzCCAYMCBgGMr++wiTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjI4MTAxNzUwWhcNMzMxMjI4MTAxOTMwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDeTx/YLHsHpxDZTLN7L88FMIu4xKuImL3u0thcnCdW3oM4g+Lh9tXnEmNP1YcgH1iUuvP0+5ZtTrJTPxw+Jq2JNkUZ3HBtNQmbtDRu68BDM0QsZlvI5V3Lp0Y7zbVhMtMWxIa2wo+7EwNOMTsZHfwnTSVMYo8IHHfviim9Ke3CM3DkWSeUQo0ifcDn2uQO4AxT4ZNxO5WckfhoACROsfM8E9j12q/BHsBX2VbfKZMlXvHdpkb0MUKf8oXM8wMnK+Ja08BtEZP1vrddYtvCKxzFi9gtPCz0ECWSHQ12OAdkZzDpDcTnPDd5N6vKtJUhegptEVJnQq3uousUEt0+Nts7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBALV79RVionxWy4olxk8GEN4EKXwII1QxafGa2h1dOE9QAcCBsBd/6tOsp+wdHP2IhrKWdXY9CkLev3aDI1wFtlqqXLWzIWo54SD35egNWAffClPap6g/eyq79kYIQ+7h+vMmBwLwckimIhWB8wsimiULTMIvI7qDNiNyOGmzV3YGAj8EpnwB3+nEjQ3mEIkb+8hgcVSwPsXZL/OxSLuzx/dPoPtUU9x5Kil5M/o7sOlK0PJDM+NgBkvTIwjyz5warTpdY5FNsTMgFW8CF82CHjFgrrLtPC5MIP19dZNC8i8AdZtHGsvCm9ouQ0EA79Q8i2wBz9iOKdgKKbL0vIErq78=');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0b5c336e-8ea0-44d0-9bdb-edf223854a4d','c4d30269-bba5-4091-a33a-4c81558cb445'),('324747af-3cdb-4ee9-8023-f1e8d5020fdf','035c6128-34be-4a20-ab10-396b5f88078d'),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','3d930541-7173-45e2-adf7-c179fcd62254'),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','73fb2ddf-ef5c-4214-b7f2-c4f205e6b0fe'),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','93fd8802-38ef-4401-9d65-24d8783d01f9'),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','de2c882d-1bc3-4728-a549-197651e9dd8a'),('58eb8370-d775-4600-b126-9f857a718c20','ca04272d-1191-4cbc-adbc-40302441bf72'),('58eb8370-d775-4600-b126-9f857a718c20','eb3f7815-6db9-4df3-a22a-85d552ce175b'),('5cbff14e-00e2-4384-9e0d-2470c86cd496','2014fd79-bbce-43fe-93c7-7681d12da529'),('649d30e2-37ff-49b6-a1df-f47415271b89','67138010-a5dc-4e71-905b-e50688e35b32'),('649d30e2-37ff-49b6-a1df-f47415271b89','c480c77b-ff3d-4bb5-ba5c-024fc58fd603'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','066d7936-55c8-4db4-86ca-ddbf1e89f7cb'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','15f1460f-c26d-4c10-9af1-cb1d79d6bb3c'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','1d83bec1-7e2b-43ab-b48e-a42fd262cc1a'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','22d6ecac-9ca2-40ab-88f2-dd6e5f742965'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','553e994b-c0d3-4c99-8173-728d94fcf8cf'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','5ef83926-3db3-4dfd-8d8e-71ed1bba8c97'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','63ae9863-9ab9-46d9-b284-0574b66bbf28'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','649d30e2-37ff-49b6-a1df-f47415271b89'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','67138010-a5dc-4e71-905b-e50688e35b32'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','6836a05f-064f-4879-9d79-fbc9f4d12493'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','6ed1c028-01ed-439c-9a0b-d802cde599e3'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','7596eca9-c498-4bf3-b4ed-14d40c267383'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','76aab7da-4705-4fd5-aed4-f8cd5ca9684b'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','7b3b2649-f7a3-4182-bc41-cc997c4e27e8'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','8891b646-da4e-47a9-b227-4ac5f1d26cd0'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','895bd6e8-3d95-4ffd-bbad-6f97757078a3'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','8cc72261-3f3a-436a-9d36-58c4e297567f'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','9342a4dc-2483-4984-9b25-f19a4daa5920'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','95fa62b4-a211-4b4b-bb3c-2e48015fb64f'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','a45dfca8-1228-4434-81c7-9a504f5001ad'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','ad7927ab-b2a3-4f0c-86f4-fe1c43348ad4'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','be3a5256-8822-4931-8080-f4982bec9a4f'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','c22fa70b-f40c-443b-b686-1b9ae30fa615'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','c480c77b-ff3d-4bb5-ba5c-024fc58fd603'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','c5315a0b-5def-4225-8288-5dbe02d20f54'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','c6056b8f-4d29-47c2-81e8-0403c174d299'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','cc686ba4-1194-4bd6-a070-f4ecbf3e3c1a'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','d0d46497-8b40-4c3b-ae3e-c941f4be1e75'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','da0bfbc3-ad70-4220-bcb4-055542a51ef8'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','dd420021-eb46-4340-a8cb-36e6827ce9dc'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','ebad8c68-00bd-4e95-9d64-5b159ee056cb'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','f1b59a48-0f7a-44a3-9dfc-593a6901bd75'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','f6fe06d4-90e7-4360-8201-9893c40b9a4b'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','f733cc4f-c06a-4005-9a5d-f20f72ab9ae2'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','f7b25d6e-788c-4ab1-bde9-1b5be322cab9'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','f949b15d-80d9-4a56-800d-42930a253b38'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','fb5521e5-b90f-4ce1-8eab-1a482020191d'),('6836a05f-064f-4879-9d79-fbc9f4d12493','a45dfca8-1228-4434-81c7-9a504f5001ad'),('6836a05f-064f-4879-9d79-fbc9f4d12493','c5315a0b-5def-4225-8288-5dbe02d20f54'),('73fb2ddf-ef5c-4214-b7f2-c4f205e6b0fe','afceb892-f385-4b74-8762-4d835ce6b571'),('74d870ce-c327-4e6f-854d-dbf65888360b','00c1cb4f-b5d6-41fc-9ef6-ce9780930bc7'),('74d870ce-c327-4e6f-854d-dbf65888360b','1340f699-47c6-4316-8289-12cf177f1f54'),('74d870ce-c327-4e6f-854d-dbf65888360b','1381c908-7083-49de-a694-582cd735b9a8'),('74d870ce-c327-4e6f-854d-dbf65888360b','21ef40aa-e601-4d5d-a708-6b451f8e7c0e'),('74d870ce-c327-4e6f-854d-dbf65888360b','3cccc57b-1544-4065-8280-86a35df0bd52'),('74d870ce-c327-4e6f-854d-dbf65888360b','4b19865f-9a47-4183-8e4e-e0cebed2b4eb'),('74d870ce-c327-4e6f-854d-dbf65888360b','4b61859c-256c-45d6-9400-09b04765304f'),('74d870ce-c327-4e6f-854d-dbf65888360b','4bb6051b-e686-4fa2-a93e-6fd1afb98443'),('74d870ce-c327-4e6f-854d-dbf65888360b','58eb8370-d775-4600-b126-9f857a718c20'),('74d870ce-c327-4e6f-854d-dbf65888360b','6a94a3e3-831b-44fb-a41c-21a1752409e3'),('74d870ce-c327-4e6f-854d-dbf65888360b','756540fb-4622-42a8-9307-6aa2b74c048a'),('74d870ce-c327-4e6f-854d-dbf65888360b','7d6a3807-8307-4752-adaa-ba549fe81dc2'),('74d870ce-c327-4e6f-854d-dbf65888360b','8a1aed4a-5eee-4d1d-9a5d-5a64b90d5dd7'),('74d870ce-c327-4e6f-854d-dbf65888360b','b3c1527d-6058-49d9-beac-9b9b5bf89271'),('74d870ce-c327-4e6f-854d-dbf65888360b','ca04272d-1191-4cbc-adbc-40302441bf72'),('74d870ce-c327-4e6f-854d-dbf65888360b','cabf5b22-b691-4561-9a23-18a7a772f4d0'),('74d870ce-c327-4e6f-854d-dbf65888360b','eb3f7815-6db9-4df3-a22a-85d552ce175b'),('74d870ce-c327-4e6f-854d-dbf65888360b','ee79b74b-5332-474a-aec5-b607c9aa96c4'),('76aab7da-4705-4fd5-aed4-f8cd5ca9684b','7b3b2649-f7a3-4182-bc41-cc997c4e27e8'),('8a1aed4a-5eee-4d1d-9a5d-5a64b90d5dd7','ee79b74b-5332-474a-aec5-b607c9aa96c4'),('b248be28-9f9a-476a-b0cd-5fa15587ca36','324747af-3cdb-4ee9-8023-f1e8d5020fdf'),('b248be28-9f9a-476a-b0cd-5fa15587ca36','5a3dda9d-3308-42c5-b5b1-a8fbbf0a0592'),('b248be28-9f9a-476a-b0cd-5fa15587ca36','60c1a48d-dd8f-4052-9413-5d454f850aba'),('b248be28-9f9a-476a-b0cd-5fa15587ca36','98a9d23f-4f53-4bbc-a17d-f6c09ea908ca'),('f949b15d-80d9-4a56-800d-42930a253b38','1d83bec1-7e2b-43ab-b48e-a42fd262cc1a');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('4a441755-62ca-48b8-9917-ffe2b12dbb56',NULL,'password','32fbd287-cf73-498e-81bc-0dd8af129a49',1703758771221,NULL,'{\"value\":\"2RFU7JiDqRh2DQzsNlPnPAXcIHAy+KVgIATtcYHBKcE=\",\"salt\":\"ZPvcqmxp8H0LApqLOiclMQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('ab28c378-cedc-4946-a8a2-dc90baf00b55',NULL,'password','6b579789-a9e8-4c1c-acd6-e952b7f938f4',1704037736686,'My password','{\"value\":\"DQaQCZrWCGJrtE9UuHGqETNdFvHLQ2LF/EnKvDk6guo=\",\"salt\":\"b5xfBoztxWupyjGyS7yQug==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-28 10:18:51',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-28 10:18:51',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-28 10:18:51',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-28 10:18:51',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-28 10:18:54',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-28 10:18:54',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-28 10:18:57',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-28 10:18:57',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-28 10:18:57',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-28 10:18:59',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-28 10:19:00',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-28 10:19:00',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-28 10:19:00',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-28 10:19:01',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-28 10:19:01',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-28 10:19:01',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-28 10:19:01',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-28 10:19:02',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-28 10:19:04',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-28 10:19:04',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-28 10:19:04',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-28 10:19:04',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-28 10:19:04',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-28 10:19:04',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-28 10:19:04',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-28 10:19:05',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-28 10:19:07',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-28 10:19:07',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-28 10:19:08',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-28 10:19:08',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-28 10:19:09',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-28 10:19:09',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-28 10:19:09',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-28 10:19:09',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-28 10:19:11',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-28 10:19:11',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-28 10:19:11',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'3758724930'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-28 10:19:11',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-28 10:19:12',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-28 10:19:12',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-28 10:19:12',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-28 10:19:12',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-28 10:19:14',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-28 10:19:14',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-28 10:19:14',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-28 10:19:14',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-28 10:19:14',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-28 10:19:15',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-28 10:19:16',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-28 10:19:17',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-28 10:19:18',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-28 10:19:18',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-28 10:19:18',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-28 10:19:18',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-28 10:19:18',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-28 10:19:18',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-28 10:19:18',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-28 10:19:21',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-28 10:19:22',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-28 10:19:22',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-28 10:19:22',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-28 10:19:22',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-28 10:19:22',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-28 10:19:22',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-28 10:19:22',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-28 10:19:23',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-28 10:19:23',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-28 10:19:23',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-28 10:19:23',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-28 10:19:23',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'3758724930'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-28 10:19:23',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'3758724930'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-28 10:19:23',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-28 10:19:23',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-28 10:19:23',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-28 10:19:24',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-28 10:19:24',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-28 10:19:24',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-28 10:19:24',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-28 10:19:25',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-28 10:19:25',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-28 10:19:25',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-28 10:19:25',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-28 10:19:25',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-28 10:19:25',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'3758724930'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-28 10:19:25',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-28 10:19:26',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.16.1',NULL,NULL,'3758724930'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-28 10:19:26',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-28 10:19:26',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.16.1',NULL,NULL,'3758724930'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'3758724930'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'3758724930'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-28 10:19:26',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:26',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'3758724930'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:26',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:26',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:27',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:27',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:27',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-28 10:19:27',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-28 10:19:27',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.16.1',NULL,NULL,'3758724930'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-12-28 10:19:27',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-12-28 10:19:27',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'3758724930'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-12-28 10:19:27',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-12-28 10:19:27',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-12-28 10:19:27',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'3758724930'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-12-28 10:19:27',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'3758724930'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2023-12-28 10:19:27',111,'EXECUTED','8:8806cb33d2a546ce770384bf98cf6eac','customChange','',NULL,'4.16.1',NULL,NULL,'3758724930'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2023-12-28 10:19:27',112,'EXECUTED','8:fdb2924649d30555ab3a1744faba4928','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'3758724930');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('0a15b7e6-e191-4f97-811c-f3c7ec24f613','2f5ccb61-36b7-4257-9de8-38555f977c7e',_binary ''),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','668f6da7-6e0b-401d-9f7f-4c386e6bf67e',_binary '\0'),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','81e06f3e-b4c4-4589-aa17-8b11fba38ae6',_binary ''),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','9d002300-881d-4bc2-841c-8d82edf99f53',_binary ''),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','ad9a560b-f02f-4ae5-b941-8820aa80bd3a',_binary ''),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','c2a27d7b-5c0c-426c-a7b8-4f215722d31a',_binary '\0'),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','c4fd8ef1-d418-4eab-b6af-dcf8a6211477',_binary ''),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','c82a800b-91a1-46c7-82fa-c2bbc4d79d04',_binary '\0'),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','d0d58b5e-2d6a-44f5-9b5a-a05b854ad962',_binary '\0'),('0a15b7e6-e191-4f97-811c-f3c7ec24f613','fbc93cb0-d6b3-44d5-8561-133316817b7b',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','29cded68-a1ba-46e1-a3ad-f88bec1754b0',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d56148d-6e98-467e-8f72-e3f3dc501d12',_binary '\0'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','43d6099d-de9f-4cfe-9b90-3f8a9d24893b',_binary '\0'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','458edf76-2983-4298-87b1-337b2c5f991c',_binary '\0'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','75bf0cc6-ba85-4cf9-b61d-cb804ed1305a',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','82ffd85e-1cae-4a7c-a283-4af577cc63c6',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','b23566d3-e16c-4fc2-9b52-a3af2e721a6b',_binary '\0'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','b81a6310-2f42-407b-8779-855877f7c21d',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','ce299185-74d3-48a8-924d-addea0bd77ba',_binary ''),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','daeaa797-c79a-4687-a40d-e2f68441e895',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
INSERT INTO `EVENT_ENTITY` VALUES ('1eaaede1-c910-48ca-b2fc-5bb02d1d76c8','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"31b246f8-34c7-48a4-b94d-9f15065b5f1c\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1703943400539,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('39132700-de2c-41ed-8a23-f0cb2ad13ead','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"fdc006ad-8f76-4a68-8252-3205ce6a41c9\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1704037634572,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('5f5d1648-8279-4b4e-8b01-237396197e1b',NULL,'null','session_expired','172.27.0.1','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,1704035505175,'LOGOUT_ERROR',NULL),('6846c15a-17b9-495d-ac49-9ee99471cb07','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"f9880f12-fa79-484a-a7f4-0dfcff3f059e\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1703935008289,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('a07a4bf2-60de-4f0a-8a6a-114e2e534335','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"729a613a-6dfe-41c4-b0c9-12c366609973\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1703931661417,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('a8354299-9653-4acd-be86-63ae6e59a081','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost:4499/admin/master/console/#/policy-engine-realm/users\",\"code_id\":\"86e4e770-ada3-40aa-8e53-aed2101e6faf\",\"username\":\"admin\"}','invalid_user_credentials','172.27.0.1','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,1703935050372,'LOGIN_ERROR','32fbd287-cf73-498e-81bc-0dd8af129a49'),('aaec66cd-ea45-49f1-b630-42b884c06db0','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"fdc006ad-8f76-4a68-8252-3205ce6a41c9\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1704037599472,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('b5d1f2f0-39c3-42ff-8722-62f1e5ab5594','policy-engine-ui','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"http://localhost:1111/login/oauth2/code/policy-engine-ui\",\"code_id\":\"fdc006ad-8f76-4a68-8252-3205ce6a41c9\",\"username\":\"jhopkins\"}','invalid_user_credentials','172.27.0.1','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,1704037606284,'LOGIN_ERROR','6b579789-a9e8-4c1c-acd6-e952b7f938f4');
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00c1cb4f-b5d6-41fc-9ef6-ce9780930bc7','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-realm}','view-realm','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('035c6128-34be-4a20-ab10-396b5f88078d','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_manage-account-links}','manage-account-links','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('066d7936-55c8-4db4-86ca-ddbf1e89f7cb','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-identity-providers}','manage-identity-providers','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('08c9b07f-ea04-4a20-8b85-223a2b08a086','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_view-groups}','view-groups','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('0b5c336e-8ea0-44d0-9bdb-edf223854a4d','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_manage-consent}','manage-consent','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('1340f699-47c6-4316-8289-12cf177f1f54','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-authorization}','view-authorization','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('1381c908-7083-49de-a694-582cd735b9a8','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-identity-providers}','manage-identity-providers','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('15f1460f-c26d-4c10-9af1-cb1d79d6bb3c','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-events}','manage-events','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('1739ee93-802b-4b95-8c19-c4cca1dbfacf','71ebe05b-f046-4083-aec8-4e4a0e08938f',_binary '','${role_read-token}','read-token','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','71ebe05b-f046-4083-aec8-4e4a0e08938f',NULL),('1d83bec1-7e2b-43ab-b48e-a42fd262cc1a','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_query-clients}','query-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('2014fd79-bbce-43fe-93c7-7681d12da529','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_view-consent}','view-consent','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('21ef40aa-e601-4d5d-a708-6b451f8e7c0e','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_create-client}','create-client','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('22d6ecac-9ca2-40ab-88f2-dd6e5f742965','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_create-client}','create-client','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('324747af-3cdb-4ee9-8023-f1e8d5020fdf','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_manage-account}','manage-account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('3a5cfcf0-f6f2-412a-94df-ebdfacfd8a09','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_view-applications}','view-applications','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0','${role_default-roles}','default-roles-policy-engine-realm','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,NULL),('3cccc57b-1544-4065-8280-86a35df0bd52','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-authorization}','manage-authorization','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('3d930541-7173-45e2-adf7-c179fcd62254','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_view-profile}','view-profile','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('4b19865f-9a47-4183-8e4e-e0cebed2b4eb','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_query-realms}','query-realms','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('4b61859c-256c-45d6-9400-09b04765304f','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-clients}','manage-clients','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('4bb6051b-e686-4fa2-a93e-6fd1afb98443','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-events}','manage-events','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('553e994b-c0d3-4c99-8173-728d94fcf8cf','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-events}','view-events','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('58eb8370-d775-4600-b126-9f857a718c20','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-users}','view-users','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('5a3dda9d-3308-42c5-b5b1-a8fbbf0a0592','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_view-profile}','view-profile','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('5cbff14e-00e2-4384-9e0d-2470c86cd496','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_manage-consent}','manage-consent','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('5ef83926-3db3-4dfd-8d8e-71ed1bba8c97','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-identity-providers}','manage-identity-providers','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('60c1a48d-dd8f-4052-9413-5d454f850aba','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0','${role_uma_authorization}','uma_authorization','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,NULL),('628bff48-825c-4301-95a9-f086bfd050d3','e064d5c6-58ba-4933-90b4-e8396859d6b8',_binary '','This is a test client role','POLICY-ENGINE-DUMMY-CLIENT-ROLE','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e064d5c6-58ba-4933-90b4-e8396859d6b8',NULL),('63ae9863-9ab9-46d9-b284-0574b66bbf28','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-clients}','manage-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('649d30e2-37ff-49b6-a1df-f47415271b89','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-users}','view-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('65830c7c-a341-4aee-9a36-9bb04525fb1b','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0','${role_admin}','admin','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,NULL),('67138010-a5dc-4e71-905b-e50688e35b32','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_query-groups}','query-groups','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('677e800c-646c-4d99-9d50-430453724e35','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0','Can create, read, update and delete asset types and policies','POLICY-ENGINE-ADMIN','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,NULL),('6836a05f-064f-4879-9d79-fbc9f4d12493','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-users}','view-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('6a94a3e3-831b-44fb-a41c-21a1752409e3','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-users}','manage-users','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('6ed1c028-01ed-439c-9a0b-d802cde599e3','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-authorization}','manage-authorization','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('73fb2ddf-ef5c-4214-b7f2-c4f205e6b0fe','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_manage-account}','manage-account','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('74d870ce-c327-4e6f-854d-dbf65888360b','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_realm-admin}','realm-admin','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('756540fb-4622-42a8-9307-6aa2b74c048a','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-identity-providers}','view-identity-providers','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('7596eca9-c498-4bf3-b4ed-14d40c267383','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-realm}','manage-realm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('76aab7da-4705-4fd5-aed4-f8cd5ca9684b','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-clients}','view-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('7b3b2649-f7a3-4182-bc41-cc997c4e27e8','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_query-clients}','query-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('7d6a3807-8307-4752-adaa-ba549fe81dc2','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_impersonation}','impersonation','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('8891b646-da4e-47a9-b227-4ac5f1d26cd0','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-realm}','manage-realm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('895bd6e8-3d95-4ffd-bbad-6f97757078a3','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_query-realms}','query-realms','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('8a1aed4a-5eee-4d1d-9a5d-5a64b90d5dd7','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-clients}','view-clients','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('8cc72261-3f3a-436a-9d36-58c4e297567f','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-realm}','view-realm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('90baadad-3089-49c6-85a2-21d6feb99420','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0','Can only read asset-types and policies. Can not make any changes','POLICY-ENGINE-READER','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,NULL),('9342a4dc-2483-4984-9b25-f19a4daa5920','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-identity-providers}','view-identity-providers','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('93fd8802-38ef-4401-9d65-24d8783d01f9','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0','${role_offline-access}','offline_access','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,NULL),('95fa62b4-a211-4b4b-bb3c-2e48015fb64f','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_impersonation}','impersonation','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('98a9d23f-4f53-4bbc-a17d-f6c09ea908ca','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0','${role_offline-access}','offline_access','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,NULL),('9fb8a00c-fd37-457a-b877-2a4cd88e3a32','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_delete-account}','delete-account','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('a45dfca8-1228-4434-81c7-9a504f5001ad','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_query-groups}','query-groups','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('ad7927ab-b2a3-4f0c-86f4-fe1c43348ad4','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-clients}','manage-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('afceb892-f385-4b74-8762-4d835ce6b571','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_manage-account-links}','manage-account-links','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('b248be28-9f9a-476a-b0cd-5fa15587ca36','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0','${role_default-roles}','default-roles-master','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,NULL),('b3c1527d-6058-49d9-beac-9b9b5bf89271','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_manage-realm}','manage-realm','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('be1fabc9-4eb8-4ba2-b068-9ec3e6d9c082','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_view-applications}','view-applications','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('be3a5256-8822-4931-8080-f4982bec9a4f','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-users}','manage-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('c22fa70b-f40c-443b-b686-1b9ae30fa615','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0','${role_create-realm}','create-realm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',NULL,NULL),('c366e219-53ab-423a-b18c-26f942dc6b56','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_view-groups}','view-groups','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('c480c77b-ff3d-4bb5-ba5c-024fc58fd603','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_query-users}','query-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('c4d30269-bba5-4091-a33a-4c81558cb445','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',_binary '','${role_view-consent}','view-consent','0a15b7e6-e191-4f97-811c-f3c7ec24f613','e6370ce0-cddf-46f2-b79a-7088fa5ec66f',NULL),('c5315a0b-5def-4225-8288-5dbe02d20f54','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_query-users}','query-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('c6056b8f-4d29-47c2-81e8-0403c174d299','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-events}','view-events','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('ca04272d-1191-4cbc-adbc-40302441bf72','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_query-groups}','query-groups','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('cabf5b22-b691-4561-9a23-18a7a772f4d0','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_view-events}','view-events','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('cc686ba4-1194-4bd6-a070-f4ecbf3e3c1a','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_manage-authorization}','manage-authorization','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('d05be79e-eb89-44e8-8a5f-57edf6bd1f2a','a593b2be-7e11-48fd-8254-07dd5bb94cf4',_binary '','${role_delete-account}','delete-account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','a593b2be-7e11-48fd-8254-07dd5bb94cf4',NULL),('d0d46497-8b40-4c3b-ae3e-c941f4be1e75','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-identity-providers}','view-identity-providers','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('da0bfbc3-ad70-4220-bcb4-055542a51ef8','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-users}','manage-users','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('dd420021-eb46-4340-a8cb-36e6827ce9dc','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-realm}','view-realm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('de2c882d-1bc3-4728-a549-197651e9dd8a','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0','${role_uma_authorization}','uma_authorization','0a15b7e6-e191-4f97-811c-f3c7ec24f613',NULL,NULL),('e68d828b-d408-4248-af29-cb88e1732772','14aca870-4fb0-4885-b6ee-17dcd35999e1',_binary '','${role_read-token}','read-token','0a15b7e6-e191-4f97-811c-f3c7ec24f613','14aca870-4fb0-4885-b6ee-17dcd35999e1',NULL),('eb3f7815-6db9-4df3-a22a-85d552ce175b','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_query-users}','query-users','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('ebad8c68-00bd-4e95-9d64-5b159ee056cb','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_create-client}','create-client','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('ee79b74b-5332-474a-aec5-b607c9aa96c4','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',_binary '','${role_query-clients}','query-clients','0a15b7e6-e191-4f97-811c-f3c7ec24f613','b6aa4ee4-0c96-4a32-8438-7d904ee7999a',NULL),('f1b59a48-0f7a-44a3-9dfc-593a6901bd75','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_impersonation}','impersonation','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('f6fe06d4-90e7-4360-8201-9893c40b9a4b','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_view-authorization}','view-authorization','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('f733cc4f-c06a-4005-9a5d-f20f72ab9ae2','3a23f4ef-168f-4131-b54e-56714e552113',_binary '','${role_query-realms}','query-realms','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3a23f4ef-168f-4131-b54e-56714e552113',NULL),('f7b25d6e-788c-4ab1-bde9-1b5be322cab9','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_manage-events}','manage-events','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('f949b15d-80d9-4a56-800d-42930a253b38','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-clients}','view-clients','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL),('fb5521e5-b90f-4ce1-8eab-1a482020191d','3d640d92-6c82-47f4-90d2-81f2158d916f',_binary '','${role_view-authorization}','view-authorization','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','3d640d92-6c82-47f4-90d2-81f2158d916f',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('dupy4','21.1.0',1703758768);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('009a1aa8-9229-41d9-91e7-91bc898800bd','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('17dffc0a-ef87-4453-bf88-8c6b95e908ea','full name','openid-connect','oidc-full-name-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','address','openid-connect','oidc-address-mapper',NULL,'c2a27d7b-5c0c-426c-a7b8-4f215722d31a'),('1f6a773a-3f71-4186-bad5-52ed9d085896','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'458edf76-2983-4298-87b1-337b2c5f991c'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('23384d56-d0f3-44af-9607-e838e5a3f48f','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('276f2f62-dad0-4f02-96f2-1cfa71884399','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('2f530345-7c86-49f1-849e-2da68844806f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('37b87b68-535f-476a-b355-732228c14e7f','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('38da3a99-fdd6-4390-a2ff-8887094934af','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'75bf0cc6-ba85-4cf9-b61d-cb804ed1305a'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'43d6099d-de9f-4cfe-9b90-3f8a9d24893b'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ad9a560b-f02f-4ae5-b941-8820aa80bd3a'),('416f3574-7a92-408e-81d9-9630b631e4c8','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'9d002300-881d-4bc2-841c-8d82edf99f53'),('42273cc4-009c-4364-9c31-1ec5b57855a8','acr loa level','openid-connect','oidc-acr-mapper',NULL,'81e06f3e-b4c4-4589-aa17-8b11fba38ae6'),('485f9e24-1ca6-4185-ad8a-66417afd3e5d','acr loa level','openid-connect','oidc-acr-mapper',NULL,'29cded68-a1ba-46e1-a3ad-f88bec1754b0'),('4860b811-5b89-4a71-a74a-90353ad31dae','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c82a800b-91a1-46c7-82fa-c2bbc4d79d04'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'d0d58b5e-2d6a-44f5-9b5a-a05b854ad962'),('59425bd3-b86b-43ca-be58-c80d92cfb415','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d0d58b5e-2d6a-44f5-9b5a-a05b854ad962'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'43d6099d-de9f-4cfe-9b90-3f8a9d24893b'),('5b1fcf26-00d5-4612-a823-13fb203637c7','role list','saml','saml-role-list-mapper',NULL,'fbc93cb0-d6b3-44d5-8561-133316817b7b'),('5e61ef00-e573-48a1-b696-ed850616c7d8','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'82ffd85e-1cae-4a7c-a283-4af577cc63c6'),('6320dc06-3b94-4fc6-91e9-78a695704f68','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'82ffd85e-1cae-4a7c-a283-4af577cc63c6'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','username','openid-connect','oidc-usermodel-property-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('7f807345-6e55-4470-bee6-490ec7730d37','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','address','openid-connect','oidc-address-mapper',NULL,'3d56148d-6e98-467e-8f72-e3f3dc501d12'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('88817934-fc35-4806-b380-c71fafa2ac5d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b81a6310-2f42-407b-8779-855877f7c21d'),('88908652-faeb-4057-bfe7-121af76fd923','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'458edf76-2983-4298-87b1-337b2c5f991c'),('8923252a-3dff-4093-8d9d-f45373d3f986','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c82a800b-91a1-46c7-82fa-c2bbc4d79d04'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','locale','openid-connect','oidc-usermodel-attribute-mapper','b68a995a-5a5d-4ecb-869b-1a5daf4f972f',NULL),('8ef8fa8e-af01-4767-883b-32a13a5ca951','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'75bf0cc6-ba85-4cf9-b61d-cb804ed1305a'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','email','openid-connect','oidc-usermodel-property-mapper',NULL,'9d002300-881d-4bc2-841c-8d82edf99f53'),('963fd826-af82-4846-a827-2a165514c4da','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('a1218b75-7470-442c-8807-9d24b8b53bec','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('a21c540d-1988-451d-af0d-809cbd56eebc','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ad9a560b-f02f-4ae5-b941-8820aa80bd3a'),('b46772d8-bcf3-4177-a0b5-28fbbadf7f13','full name','openid-connect','oidc-full-name-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('bb29ce80-b37a-4b75-877a-6da20de748ab','locale','openid-connect','oidc-usermodel-attribute-mapper','6f82a2bf-2315-4524-86f7-573de5bf8c40',NULL),('c2cf468d-64e6-477e-8dba-1d2b1168ea31','audience resolve','openid-connect','oidc-audience-resolve-mapper','4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2',NULL),('c5cc8e0f-fa31-4257-bc57-75f4720b7533','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'c4fd8ef1-d418-4eab-b6af-dcf8a6211477'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f5ccb61-36b7-4257-9de8-38555f977c7e'),('d00192a0-f0aa-4620-9fec-feb53a8a46af','audience resolve','openid-connect','oidc-audience-resolve-mapper','5b7dd6e2-d463-44de-a419-6cf0b48026e1',NULL),('d006f750-95ba-4caa-9961-99edb85243e8','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ad9a560b-f02f-4ae5-b941-8820aa80bd3a'),('d19497c8-82e8-4866-b750-a4a94d67066b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('f1042f47-c6f7-424b-9f69-39e060039f13','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('f455d0be-146f-4945-a981-6f99c7564b86','role list','saml','saml-role-list-mapper',NULL,'daeaa797-c79a-4687-a40d-e2f68441e895'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','username','openid-connect','oidc-usermodel-property-mapper',NULL,'ce299185-74d3-48a8-924d-addea0bd77ba'),('ff4c68bf-fc5b-49f3-98a5-69aaa2ed1973','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'75bf0cc6-ba85-4cf9-b61d-cb804ed1305a');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('009a1aa8-9229-41d9-91e7-91bc898800bd','true','access.token.claim'),('009a1aa8-9229-41d9-91e7-91bc898800bd','profile','claim.name'),('009a1aa8-9229-41d9-91e7-91bc898800bd','true','id.token.claim'),('009a1aa8-9229-41d9-91e7-91bc898800bd','String','jsonType.label'),('009a1aa8-9229-41d9-91e7-91bc898800bd','profile','user.attribute'),('009a1aa8-9229-41d9-91e7-91bc898800bd','true','userinfo.token.claim'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','true','access.token.claim'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','given_name','claim.name'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','true','id.token.claim'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','String','jsonType.label'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','firstName','user.attribute'),('060dcb9f-4358-4840-9ee2-f66b9f3f96cb','true','userinfo.token.claim'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','true','access.token.claim'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','nickname','claim.name'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','true','id.token.claim'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','String','jsonType.label'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','nickname','user.attribute'),('160c825a-c0c0-4928-9bb3-3d57edbf789a','true','userinfo.token.claim'),('17dffc0a-ef87-4453-bf88-8c6b95e908ea','true','access.token.claim'),('17dffc0a-ef87-4453-bf88-8c6b95e908ea','true','id.token.claim'),('17dffc0a-ef87-4453-bf88-8c6b95e908ea','true','userinfo.token.claim'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','true','access.token.claim'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','true','id.token.claim'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','country','user.attribute.country'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','formatted','user.attribute.formatted'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','locality','user.attribute.locality'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','postal_code','user.attribute.postal_code'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','region','user.attribute.region'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','street','user.attribute.street'),('1c9d3c4c-5ee4-4bad-b903-2febef41ec86','true','userinfo.token.claim'),('1f6a773a-3f71-4186-bad5-52ed9d085896','true','access.token.claim'),('1f6a773a-3f71-4186-bad5-52ed9d085896','groups','claim.name'),('1f6a773a-3f71-4186-bad5-52ed9d085896','true','id.token.claim'),('1f6a773a-3f71-4186-bad5-52ed9d085896','String','jsonType.label'),('1f6a773a-3f71-4186-bad5-52ed9d085896','true','multivalued'),('1f6a773a-3f71-4186-bad5-52ed9d085896','foo','user.attribute'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','true','access.token.claim'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','updated_at','claim.name'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','true','id.token.claim'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','long','jsonType.label'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','updatedAt','user.attribute'),('2096c04e-6a63-4738-aef5-b11fb030cfd9','true','userinfo.token.claim'),('23384d56-d0f3-44af-9607-e838e5a3f48f','true','access.token.claim'),('23384d56-d0f3-44af-9607-e838e5a3f48f','gender','claim.name'),('23384d56-d0f3-44af-9607-e838e5a3f48f','true','id.token.claim'),('23384d56-d0f3-44af-9607-e838e5a3f48f','String','jsonType.label'),('23384d56-d0f3-44af-9607-e838e5a3f48f','gender','user.attribute'),('23384d56-d0f3-44af-9607-e838e5a3f48f','true','userinfo.token.claim'),('276f2f62-dad0-4f02-96f2-1cfa71884399','true','access.token.claim'),('276f2f62-dad0-4f02-96f2-1cfa71884399','locale','claim.name'),('276f2f62-dad0-4f02-96f2-1cfa71884399','true','id.token.claim'),('276f2f62-dad0-4f02-96f2-1cfa71884399','String','jsonType.label'),('276f2f62-dad0-4f02-96f2-1cfa71884399','locale','user.attribute'),('276f2f62-dad0-4f02-96f2-1cfa71884399','true','userinfo.token.claim'),('2f530345-7c86-49f1-849e-2da68844806f','true','access.token.claim'),('2f530345-7c86-49f1-849e-2da68844806f','birthdate','claim.name'),('2f530345-7c86-49f1-849e-2da68844806f','true','id.token.claim'),('2f530345-7c86-49f1-849e-2da68844806f','String','jsonType.label'),('2f530345-7c86-49f1-849e-2da68844806f','birthdate','user.attribute'),('2f530345-7c86-49f1-849e-2da68844806f','true','userinfo.token.claim'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','true','access.token.claim'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','website','claim.name'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','true','id.token.claim'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','String','jsonType.label'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','website','user.attribute'),('37a97bf8-ad98-4a0a-8d3d-f13c3b028cb5','true','userinfo.token.claim'),('37b87b68-535f-476a-b355-732228c14e7f','true','access.token.claim'),('37b87b68-535f-476a-b355-732228c14e7f','middle_name','claim.name'),('37b87b68-535f-476a-b355-732228c14e7f','true','id.token.claim'),('37b87b68-535f-476a-b355-732228c14e7f','String','jsonType.label'),('37b87b68-535f-476a-b355-732228c14e7f','middleName','user.attribute'),('37b87b68-535f-476a-b355-732228c14e7f','true','userinfo.token.claim'),('38da3a99-fdd6-4390-a2ff-8887094934af','true','access.token.claim'),('38da3a99-fdd6-4390-a2ff-8887094934af','resource_access.${client_id}.roles','claim.name'),('38da3a99-fdd6-4390-a2ff-8887094934af','true','id.token.claim'),('38da3a99-fdd6-4390-a2ff-8887094934af','String','jsonType.label'),('38da3a99-fdd6-4390-a2ff-8887094934af','true','multivalued'),('38da3a99-fdd6-4390-a2ff-8887094934af','foo','user.attribute'),('38da3a99-fdd6-4390-a2ff-8887094934af','true','userinfo.token.claim'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','true','access.token.claim'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','profile','claim.name'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','true','id.token.claim'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','String','jsonType.label'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','profile','user.attribute'),('39b7547c-b9c4-4665-8bd5-1b5af52ac287','true','userinfo.token.claim'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','true','access.token.claim'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','phone_number_verified','claim.name'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','true','id.token.claim'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','boolean','jsonType.label'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','phoneNumberVerified','user.attribute'),('3aaa23a9-2167-47ba-a2f7-8119a650e1e6','true','userinfo.token.claim'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','true','access.token.claim'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','picture','claim.name'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','true','id.token.claim'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','String','jsonType.label'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','picture','user.attribute'),('3d976bad-72bc-4039-b0e9-a3837b7e7ff3','true','userinfo.token.claim'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','true','access.token.claim'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','resource_access.${client_id}.roles','claim.name'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','true','id.token.claim'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','String','jsonType.label'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','true','multivalued'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','foo','user.attribute'),('3e7545d7-0b8a-4c94-a039-ae258fd0d4e9','true','userinfo.token.claim'),('416f3574-7a92-408e-81d9-9630b631e4c8','true','access.token.claim'),('416f3574-7a92-408e-81d9-9630b631e4c8','email_verified','claim.name'),('416f3574-7a92-408e-81d9-9630b631e4c8','true','id.token.claim'),('416f3574-7a92-408e-81d9-9630b631e4c8','boolean','jsonType.label'),('416f3574-7a92-408e-81d9-9630b631e4c8','emailVerified','user.attribute'),('416f3574-7a92-408e-81d9-9630b631e4c8','true','userinfo.token.claim'),('42273cc4-009c-4364-9c31-1ec5b57855a8','true','access.token.claim'),('42273cc4-009c-4364-9c31-1ec5b57855a8','true','id.token.claim'),('485f9e24-1ca6-4185-ad8a-66417afd3e5d','true','access.token.claim'),('485f9e24-1ca6-4185-ad8a-66417afd3e5d','true','id.token.claim'),('4860b811-5b89-4a71-a74a-90353ad31dae','true','access.token.claim'),('4860b811-5b89-4a71-a74a-90353ad31dae','family_name','claim.name'),('4860b811-5b89-4a71-a74a-90353ad31dae','true','id.token.claim'),('4860b811-5b89-4a71-a74a-90353ad31dae','String','jsonType.label'),('4860b811-5b89-4a71-a74a-90353ad31dae','lastName','user.attribute'),('4860b811-5b89-4a71-a74a-90353ad31dae','true','userinfo.token.claim'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','true','access.token.claim'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','phone_number_verified','claim.name'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','true','id.token.claim'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','boolean','jsonType.label'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','phoneNumberVerified','user.attribute'),('551dc807-5bdf-4958-8bbc-0fbded43d42e','true','userinfo.token.claim'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','true','access.token.claim'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','upn','claim.name'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','true','id.token.claim'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','String','jsonType.label'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','username','user.attribute'),('576b3f0d-68b3-4e08-9d2c-77fc71f136f8','true','userinfo.token.claim'),('59425bd3-b86b-43ca-be58-c80d92cfb415','true','access.token.claim'),('59425bd3-b86b-43ca-be58-c80d92cfb415','groups','claim.name'),('59425bd3-b86b-43ca-be58-c80d92cfb415','true','id.token.claim'),('59425bd3-b86b-43ca-be58-c80d92cfb415','String','jsonType.label'),('59425bd3-b86b-43ca-be58-c80d92cfb415','true','multivalued'),('59425bd3-b86b-43ca-be58-c80d92cfb415','foo','user.attribute'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','true','access.token.claim'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','phone_number','claim.name'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','true','id.token.claim'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','String','jsonType.label'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','phoneNumber','user.attribute'),('5962b17d-1798-4c4d-bd57-97ba306e8db0','true','userinfo.token.claim'),('5b1fcf26-00d5-4612-a823-13fb203637c7','Role','attribute.name'),('5b1fcf26-00d5-4612-a823-13fb203637c7','Basic','attribute.nameformat'),('5b1fcf26-00d5-4612-a823-13fb203637c7','false','single'),('5e61ef00-e573-48a1-b696-ed850616c7d8','true','access.token.claim'),('5e61ef00-e573-48a1-b696-ed850616c7d8','email_verified','claim.name'),('5e61ef00-e573-48a1-b696-ed850616c7d8','true','id.token.claim'),('5e61ef00-e573-48a1-b696-ed850616c7d8','boolean','jsonType.label'),('5e61ef00-e573-48a1-b696-ed850616c7d8','emailVerified','user.attribute'),('5e61ef00-e573-48a1-b696-ed850616c7d8','true','userinfo.token.claim'),('6320dc06-3b94-4fc6-91e9-78a695704f68','true','access.token.claim'),('6320dc06-3b94-4fc6-91e9-78a695704f68','locale','claim.name'),('6320dc06-3b94-4fc6-91e9-78a695704f68','true','id.token.claim'),('6320dc06-3b94-4fc6-91e9-78a695704f68','String','jsonType.label'),('6320dc06-3b94-4fc6-91e9-78a695704f68','locale','user.attribute'),('6320dc06-3b94-4fc6-91e9-78a695704f68','true','userinfo.token.claim'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','true','access.token.claim'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','website','claim.name'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','true','id.token.claim'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','String','jsonType.label'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','website','user.attribute'),('73f1747f-063c-4009-bc0a-ba93a4ca74af','true','userinfo.token.claim'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','true','access.token.claim'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','email','claim.name'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','true','id.token.claim'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','String','jsonType.label'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','email','user.attribute'),('74c549fb-24c9-4afe-91f5-ab36b1377d0b','true','userinfo.token.claim'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','true','access.token.claim'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','preferred_username','claim.name'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','true','id.token.claim'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','String','jsonType.label'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','username','user.attribute'),('7f4dbfa4-019e-4b23-832b-c3d8baaca8bc','true','userinfo.token.claim'),('7f807345-6e55-4470-bee6-490ec7730d37','true','access.token.claim'),('7f807345-6e55-4470-bee6-490ec7730d37','middle_name','claim.name'),('7f807345-6e55-4470-bee6-490ec7730d37','true','id.token.claim'),('7f807345-6e55-4470-bee6-490ec7730d37','String','jsonType.label'),('7f807345-6e55-4470-bee6-490ec7730d37','middleName','user.attribute'),('7f807345-6e55-4470-bee6-490ec7730d37','true','userinfo.token.claim'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','true','access.token.claim'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','true','id.token.claim'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','country','user.attribute.country'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','formatted','user.attribute.formatted'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','locality','user.attribute.locality'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','postal_code','user.attribute.postal_code'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','region','user.attribute.region'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','street','user.attribute.street'),('80fe5b21-8b8c-485f-9348-02d9770cfa7e','true','userinfo.token.claim'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','true','access.token.claim'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','family_name','claim.name'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','true','id.token.claim'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','String','jsonType.label'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','lastName','user.attribute'),('83e6a9cc-3f23-4e5e-9562-f97c9b98b0c1','true','userinfo.token.claim'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','true','access.token.claim'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','updated_at','claim.name'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','true','id.token.claim'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','long','jsonType.label'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','updatedAt','user.attribute'),('887e2ab9-927c-4a06-9d7d-4bd5cc2224e1','true','userinfo.token.claim'),('88908652-faeb-4057-bfe7-121af76fd923','true','access.token.claim'),('88908652-faeb-4057-bfe7-121af76fd923','upn','claim.name'),('88908652-faeb-4057-bfe7-121af76fd923','true','id.token.claim'),('88908652-faeb-4057-bfe7-121af76fd923','String','jsonType.label'),('88908652-faeb-4057-bfe7-121af76fd923','username','user.attribute'),('88908652-faeb-4057-bfe7-121af76fd923','true','userinfo.token.claim'),('8923252a-3dff-4093-8d9d-f45373d3f986','true','access.token.claim'),('8923252a-3dff-4093-8d9d-f45373d3f986','phone_number','claim.name'),('8923252a-3dff-4093-8d9d-f45373d3f986','true','id.token.claim'),('8923252a-3dff-4093-8d9d-f45373d3f986','String','jsonType.label'),('8923252a-3dff-4093-8d9d-f45373d3f986','phoneNumber','user.attribute'),('8923252a-3dff-4093-8d9d-f45373d3f986','true','userinfo.token.claim'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','true','access.token.claim'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','locale','claim.name'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','true','id.token.claim'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','String','jsonType.label'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','locale','user.attribute'),('8a096423-0d71-4350-b33a-5ae8ba9ee06e','true','userinfo.token.claim'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','true','access.token.claim'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','realm_access.roles','claim.name'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','false','id.token.claim'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','String','jsonType.label'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','true','multivalued'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','foo','user.attribute'),('8ef8fa8e-af01-4767-883b-32a13a5ca951','true','userinfo.token.claim'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','true','access.token.claim'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','given_name','claim.name'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','true','id.token.claim'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','String','jsonType.label'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','firstName','user.attribute'),('9394921b-2320-47d7-a877-9fb74a2cd2b4','true','userinfo.token.claim'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','true','access.token.claim'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','email','claim.name'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','true','id.token.claim'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','String','jsonType.label'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','email','user.attribute'),('9605675c-c668-4ffb-968f-95f42c6e4cb7','true','userinfo.token.claim'),('963fd826-af82-4846-a827-2a165514c4da','true','access.token.claim'),('963fd826-af82-4846-a827-2a165514c4da','picture','claim.name'),('963fd826-af82-4846-a827-2a165514c4da','true','id.token.claim'),('963fd826-af82-4846-a827-2a165514c4da','String','jsonType.label'),('963fd826-af82-4846-a827-2a165514c4da','picture','user.attribute'),('963fd826-af82-4846-a827-2a165514c4da','true','userinfo.token.claim'),('a1218b75-7470-442c-8807-9d24b8b53bec','true','access.token.claim'),('a1218b75-7470-442c-8807-9d24b8b53bec','nickname','claim.name'),('a1218b75-7470-442c-8807-9d24b8b53bec','true','id.token.claim'),('a1218b75-7470-442c-8807-9d24b8b53bec','String','jsonType.label'),('a1218b75-7470-442c-8807-9d24b8b53bec','nickname','user.attribute'),('a1218b75-7470-442c-8807-9d24b8b53bec','true','userinfo.token.claim'),('a21c540d-1988-451d-af0d-809cbd56eebc','true','access.token.claim'),('a21c540d-1988-451d-af0d-809cbd56eebc','zoneinfo','claim.name'),('a21c540d-1988-451d-af0d-809cbd56eebc','true','id.token.claim'),('a21c540d-1988-451d-af0d-809cbd56eebc','String','jsonType.label'),('a21c540d-1988-451d-af0d-809cbd56eebc','zoneinfo','user.attribute'),('a21c540d-1988-451d-af0d-809cbd56eebc','true','userinfo.token.claim'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','true','access.token.claim'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','realm_access.roles','claim.name'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','true','id.token.claim'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','String','jsonType.label'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','true','multivalued'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','foo','user.attribute'),('a85a4b17-b1fc-40d2-9257-444fb838cfa2','true','userinfo.token.claim'),('b46772d8-bcf3-4177-a0b5-28fbbadf7f13','true','access.token.claim'),('b46772d8-bcf3-4177-a0b5-28fbbadf7f13','true','id.token.claim'),('b46772d8-bcf3-4177-a0b5-28fbbadf7f13','true','userinfo.token.claim'),('bb29ce80-b37a-4b75-877a-6da20de748ab','true','access.token.claim'),('bb29ce80-b37a-4b75-877a-6da20de748ab','locale','claim.name'),('bb29ce80-b37a-4b75-877a-6da20de748ab','true','id.token.claim'),('bb29ce80-b37a-4b75-877a-6da20de748ab','String','jsonType.label'),('bb29ce80-b37a-4b75-877a-6da20de748ab','locale','user.attribute'),('bb29ce80-b37a-4b75-877a-6da20de748ab','true','userinfo.token.claim'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','true','access.token.claim'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','zoneinfo','claim.name'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','true','id.token.claim'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','String','jsonType.label'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','zoneinfo','user.attribute'),('cbaa0cfb-0caa-4017-80d0-861e9c38664b','true','userinfo.token.claim'),('d19497c8-82e8-4866-b750-a4a94d67066b','true','access.token.claim'),('d19497c8-82e8-4866-b750-a4a94d67066b','birthdate','claim.name'),('d19497c8-82e8-4866-b750-a4a94d67066b','true','id.token.claim'),('d19497c8-82e8-4866-b750-a4a94d67066b','String','jsonType.label'),('d19497c8-82e8-4866-b750-a4a94d67066b','birthdate','user.attribute'),('d19497c8-82e8-4866-b750-a4a94d67066b','true','userinfo.token.claim'),('f1042f47-c6f7-424b-9f69-39e060039f13','true','access.token.claim'),('f1042f47-c6f7-424b-9f69-39e060039f13','gender','claim.name'),('f1042f47-c6f7-424b-9f69-39e060039f13','true','id.token.claim'),('f1042f47-c6f7-424b-9f69-39e060039f13','String','jsonType.label'),('f1042f47-c6f7-424b-9f69-39e060039f13','gender','user.attribute'),('f1042f47-c6f7-424b-9f69-39e060039f13','true','userinfo.token.claim'),('f455d0be-146f-4945-a981-6f99c7564b86','Role','attribute.name'),('f455d0be-146f-4945-a981-6f99c7564b86','Basic','attribute.nameformat'),('f455d0be-146f-4945-a981-6f99c7564b86','false','single'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','true','access.token.claim'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','preferred_username','claim.name'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','true','id.token.claim'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','String','jsonType.label'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','username','user.attribute'),('f6488cd0-fa60-469a-8a5a-4a5f67031bb2','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('0a15b7e6-e191-4f97-811c-f3c7ec24f613',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'policy-engine-realm',0,NULL,_binary '',_binary '\0',_binary '',_binary '\0','NONE',60,36000,_binary '\0',_binary '\0','3d640d92-6c82-47f4-90d2-81f2158d916f',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','7fcb5d74-4cab-4c1f-9b2c-496bc91b487e','835e75a5-370e-49a4-a273-d88279c99259','ee95f90c-492e-48ef-a7ca-866bf4a98ce6','e18a8060-934b-410a-a647-77d5e0d88d6d','7ce9a69c-0787-4618-995b-55327b205fea',2592000,_binary '\0',900,_binary '\0',_binary '\0','296e0c96-1493-4d77-b4d4-3ab20fda8ea3',0,_binary '\0',0,0,'3b937971-90dd-46e0-a747-2f0c6ac8e2f5'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',300,36000,_binary '\0',_binary '\0','3a23f4ef-168f-4131-b54e-56714e552113',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','d03c08cd-9e8b-443f-80b5-e8dfee21396a','252c16d8-4cce-4862-a711-9a742920ab67','376650c0-3aff-4b21-aa8e-35471ff88a3e','1444e1cc-b8c5-4ee2-872a-15f275fdddf9','cc137a87-e60b-4fdf-bea6-9f955659995c',2592000,_binary '\0',900,_binary '',_binary '\0','b69a3271-5cd8-4cad-ac15-1579cffa392c',0,_binary '\0',0,0,'b248be28-9f9a-476a-b0cd-5fa15587ca36');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','0a15b7e6-e191-4f97-811c-f3c7ec24f613','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('_browser_header.contentSecurityPolicyReportOnly','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',''),('_browser_header.strictTransportSecurity','0a15b7e6-e191-4f97-811c-f3c7ec24f613','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','0a15b7e6-e191-4f97-811c-f3c7ec24f613','nosniff'),('_browser_header.xContentTypeOptions','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','nosniff'),('_browser_header.xFrameOptions','0a15b7e6-e191-4f97-811c-f3c7ec24f613','SAMEORIGIN'),('_browser_header.xFrameOptions','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','SAMEORIGIN'),('_browser_header.xRobotsTag','0a15b7e6-e191-4f97-811c-f3c7ec24f613','none'),('_browser_header.xRobotsTag','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','none'),('_browser_header.xXSSProtection','0a15b7e6-e191-4f97-811c-f3c7ec24f613','1; mode=block'),('_browser_header.xXSSProtection','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1; mode=block'),('acr.loa.map','0a15b7e6-e191-4f97-811c-f3c7ec24f613','{}'),('actionTokenGeneratedByAdminLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','43200'),('actionTokenGeneratedByAdminLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','43200'),('actionTokenGeneratedByUserLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','300'),('actionTokenGeneratedByUserLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','300'),('bruteForceProtected','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('bruteForceProtected','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('cibaAuthRequestedUserHint','0a15b7e6-e191-4f97-811c-f3c7ec24f613','login_hint'),('cibaAuthRequestedUserHint','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','login_hint'),('cibaBackchannelTokenDeliveryMode','0a15b7e6-e191-4f97-811c-f3c7ec24f613','poll'),('cibaBackchannelTokenDeliveryMode','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','poll'),('cibaExpiresIn','0a15b7e6-e191-4f97-811c-f3c7ec24f613','120'),('cibaExpiresIn','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','120'),('cibaInterval','0a15b7e6-e191-4f97-811c-f3c7ec24f613','5'),('cibaInterval','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','5'),('client-policies.policies','0a15b7e6-e191-4f97-811c-f3c7ec24f613','{\"policies\":[]}'),('client-policies.policies','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','{\"policies\":[]}'),('client-policies.profiles','0a15b7e6-e191-4f97-811c-f3c7ec24f613','{\"profiles\":[]}'),('client-policies.profiles','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('clientOfflineSessionIdleTimeout','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('clientOfflineSessionMaxLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('clientOfflineSessionMaxLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('clientSessionIdleTimeout','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('clientSessionIdleTimeout','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('clientSessionMaxLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('clientSessionMaxLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('defaultSignatureAlgorithm','0a15b7e6-e191-4f97-811c-f3c7ec24f613','RS256'),('defaultSignatureAlgorithm','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','RS256'),('displayName','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('displayName','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','Keycloak'),('displayNameHtml','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('displayNameHtml','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','0a15b7e6-e191-4f97-811c-f3c7ec24f613','30'),('failureFactor','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','30'),('frontendUrl','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('maxDeltaTimeSeconds','0a15b7e6-e191-4f97-811c-f3c7ec24f613','43200'),('maxDeltaTimeSeconds','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','43200'),('maxFailureWaitSeconds','0a15b7e6-e191-4f97-811c-f3c7ec24f613','900'),('maxFailureWaitSeconds','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','900'),('minimumQuickLoginWaitSeconds','0a15b7e6-e191-4f97-811c-f3c7ec24f613','60'),('minimumQuickLoginWaitSeconds','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','60'),('oauth2DeviceCodeLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','600'),('oauth2DeviceCodeLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','600'),('oauth2DevicePollingInterval','0a15b7e6-e191-4f97-811c-f3c7ec24f613','5'),('oauth2DevicePollingInterval','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','5'),('offlineSessionMaxLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','5184000'),('offlineSessionMaxLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','5184000'),('offlineSessionMaxLifespanEnabled','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('offlineSessionMaxLifespanEnabled','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('parRequestUriLifespan','0a15b7e6-e191-4f97-811c-f3c7ec24f613','60'),('parRequestUriLifespan','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','60'),('permanentLockout','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('permanentLockout','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('quickLoginCheckMilliSeconds','0a15b7e6-e191-4f97-811c-f3c7ec24f613','1000'),('quickLoginCheckMilliSeconds','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','1000'),('realmReusableOtpCode','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('realmReusableOtpCode','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('waitIncrementSeconds','0a15b7e6-e191-4f97-811c-f3c7ec24f613','60'),('waitIncrementSeconds','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','60'),('webAuthnPolicyAttestationConveyancePreference','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyAttestationConveyancePreference','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyAuthenticatorAttachment','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyAuthenticatorAttachment','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','false'),('webAuthnPolicyCreateTimeout','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('webAuthnPolicyCreateTimeout','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('webAuthnPolicyCreateTimeoutPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','0'),('webAuthnPolicyCreateTimeoutPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','0'),('webAuthnPolicyRequireResidentKey','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyRequireResidentKey','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyRpEntityName','0a15b7e6-e191-4f97-811c-f3c7ec24f613','keycloak'),('webAuthnPolicyRpEntityName','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','keycloak'),('webAuthnPolicyRpId','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('webAuthnPolicyRpId','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',''),('webAuthnPolicyRpIdPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613',''),('webAuthnPolicyRpIdPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',''),('webAuthnPolicySignatureAlgorithms','0a15b7e6-e191-4f97-811c-f3c7ec24f613','ES256'),('webAuthnPolicySignatureAlgorithms','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','ES256'),('webAuthnPolicyUserVerificationRequirement','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyUserVerificationRequirement','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('0a15b7e6-e191-4f97-811c-f3c7ec24f613','jboss-logging'),('ab8c345f-97ee-41a0-ac84-a87342aa3ee3','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','0a15b7e6-e191-4f97-811c-f3c7ec24f613'),('password','password',_binary '',_binary '','ab8c345f-97ee-41a0-ac84-a87342aa3ee3');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','/realms/policy-engine-realm/account/*'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','/realms/master/account/*'),('6f82a2bf-2315-4524-86f7-573de5bf8c40','/admin/policy-engine-realm/console/*'),('a593b2be-7e11-48fd-8254-07dd5bb94cf4','/realms/master/account/*'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','/admin/master/console/*'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','http://localhost:1111/*'),('e6370ce0-cddf-46f2-b79a-7088fa5ec66f','/realms/policy-engine-realm/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('096a1383-b7d8-4c61-85b1-dda13770235e','VERIFY_EMAIL','Verify Email','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','VERIFY_EMAIL',50),('12175fc6-caaa-4f5e-bc36-5d01c8ab5b0b','webauthn-register-passwordless','Webauthn Register Passwordless','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','webauthn-register-passwordless',80),('28a76c1a-5a45-439d-aed3-cd9eed9f194f','update_user_locale','Update User Locale','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','update_user_locale',1000),('43b8c814-d457-4ff4-8dc1-67ef5400b2d8','TERMS_AND_CONDITIONS','Terms and Conditions','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('4b6e0878-6fa5-4496-923f-6a0f3b3fe0be','update_user_locale','Update User Locale','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','update_user_locale',1000),('524cd4b7-3204-4ed9-82e9-184e1c377d20','CONFIGURE_TOTP','Configure OTP','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','CONFIGURE_TOTP',10),('5e66ffae-4036-4dd2-84ef-2d79dad9b50c','UPDATE_PASSWORD','Update Password','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','UPDATE_PASSWORD',30),('636de98d-b0bc-49bb-adbd-346682fa66a7','UPDATE_PROFILE','Update Profile','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','UPDATE_PROFILE',40),('662727ef-fa81-44ca-a617-aee76dcd38e9','TERMS_AND_CONDITIONS','Terms and Conditions','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('701b36bb-81b3-4c39-80c6-c664f28a0776','delete_account','Delete Account','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '\0',_binary '\0','delete_account',60),('70ab235d-55f1-46e7-aff2-e519ab258709','VERIFY_EMAIL','Verify Email','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','VERIFY_EMAIL',50),('748a1117-34f9-4d98-94ef-3e15fda78d54','webauthn-register-passwordless','Webauthn Register Passwordless','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','webauthn-register-passwordless',80),('8fdea804-26cb-427e-8942-404bb3febe3c','webauthn-register','Webauthn Register','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','webauthn-register',70),('948ddfb3-ec39-4fb3-ac8e-c81d52dcbd50','webauthn-register','Webauthn Register','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','webauthn-register',70),('9f1b5055-d467-44a7-b7b8-8c84bccafc3b','UPDATE_PASSWORD','Update Password','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','UPDATE_PASSWORD',30),('acfd1849-f0e4-40cd-b2aa-c6a75fe75b4c','UPDATE_PROFILE','Update Profile','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '',_binary '\0','UPDATE_PROFILE',40),('c8bc0c66-cca8-4ad4-99bb-da7719084ae1','CONFIGURE_TOTP','Configure OTP','ab8c345f-97ee-41a0-ac84-a87342aa3ee3',_binary '',_binary '\0','CONFIGURE_TOTP',10),('fb363af0-8f49-4e90-b0b3-58732f9edf52','delete_account','Delete Account','0a15b7e6-e191-4f97-811c-f3c7ec24f613',_binary '\0',_binary '\0','delete_account',60);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('5b7dd6e2-d463-44de-a419-6cf0b48026e1','08c9b07f-ea04-4a20-8b85-223a2b08a086'),('5b7dd6e2-d463-44de-a419-6cf0b48026e1','324747af-3cdb-4ee9-8023-f1e8d5020fdf'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','73fb2ddf-ef5c-4214-b7f2-c4f205e6b0fe'),('4f01ce3c-4bcb-4c8b-8537-4fe07b9acbd2','c366e219-53ab-423a-b18c-26f942dc6b56');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('32fbd287-cf73-498e-81bc-0dd8af129a49',NULL,'7a237fe7-d470-4e24-9bbd-c571657040e9',_binary '\0',_binary '',NULL,NULL,NULL,'ab8c345f-97ee-41a0-ac84-a87342aa3ee3','admin',1703758771056,NULL,0),('6b579789-a9e8-4c1c-acd6-e952b7f938f4',NULL,'385fb004-8ad6-463c-938e-77415e186cf5',_binary '\0',_binary '',NULL,'John','Hopkins','0a15b7e6-e191-4f97-811c-f3c7ec24f613','jhopkins',1703878202716,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1d83bec1-7e2b-43ab-b48e-a42fd262cc1a','32fbd287-cf73-498e-81bc-0dd8af129a49'),('5ef83926-3db3-4dfd-8d8e-71ed1bba8c97','32fbd287-cf73-498e-81bc-0dd8af129a49'),('63ae9863-9ab9-46d9-b284-0574b66bbf28','32fbd287-cf73-498e-81bc-0dd8af129a49'),('649d30e2-37ff-49b6-a1df-f47415271b89','32fbd287-cf73-498e-81bc-0dd8af129a49'),('65830c7c-a341-4aee-9a36-9bb04525fb1b','32fbd287-cf73-498e-81bc-0dd8af129a49'),('67138010-a5dc-4e71-905b-e50688e35b32','32fbd287-cf73-498e-81bc-0dd8af129a49'),('6ed1c028-01ed-439c-9a0b-d802cde599e3','32fbd287-cf73-498e-81bc-0dd8af129a49'),('7596eca9-c498-4bf3-b4ed-14d40c267383','32fbd287-cf73-498e-81bc-0dd8af129a49'),('895bd6e8-3d95-4ffd-bbad-6f97757078a3','32fbd287-cf73-498e-81bc-0dd8af129a49'),('8cc72261-3f3a-436a-9d36-58c4e297567f','32fbd287-cf73-498e-81bc-0dd8af129a49'),('b248be28-9f9a-476a-b0cd-5fa15587ca36','32fbd287-cf73-498e-81bc-0dd8af129a49'),('c480c77b-ff3d-4bb5-ba5c-024fc58fd603','32fbd287-cf73-498e-81bc-0dd8af129a49'),('c6056b8f-4d29-47c2-81e8-0403c174d299','32fbd287-cf73-498e-81bc-0dd8af129a49'),('d0d46497-8b40-4c3b-ae3e-c941f4be1e75','32fbd287-cf73-498e-81bc-0dd8af129a49'),('da0bfbc3-ad70-4220-bcb4-055542a51ef8','32fbd287-cf73-498e-81bc-0dd8af129a49'),('ebad8c68-00bd-4e95-9d64-5b159ee056cb','32fbd287-cf73-498e-81bc-0dd8af129a49'),('f7b25d6e-788c-4ab1-bde9-1b5be322cab9','32fbd287-cf73-498e-81bc-0dd8af129a49'),('f949b15d-80d9-4a56-800d-42930a253b38','32fbd287-cf73-498e-81bc-0dd8af129a49'),('fb5521e5-b90f-4ce1-8eab-1a482020191d','32fbd287-cf73-498e-81bc-0dd8af129a49'),('3b937971-90dd-46e0-a747-2f0c6ac8e2f5','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('628bff48-825c-4301-95a9-f086bfd050d3','6b579789-a9e8-4c1c-acd6-e952b7f938f4'),('677e800c-646c-4d99-9d50-430453724e35','6b579789-a9e8-4c1c-acd6-e952b7f938f4');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('6f82a2bf-2315-4524-86f7-573de5bf8c40','+'),('b68a995a-5a5d-4ecb-869b-1a5daf4f972f','+'),('e064d5c6-58ba-4933-90b4-e8396859d6b8','http://localhost:1111');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-01  7:00:00
