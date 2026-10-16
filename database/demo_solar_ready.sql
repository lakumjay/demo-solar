-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: snweba2e_jay_solar
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `action` varchar(80) NOT NULL,
  `subject_type` varchar(80) NOT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`changes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `platform` varchar(60) DEFAULT NULL,
  `browser` varchar(60) DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  KEY `activity_logs_company_id_created_at_index` (`company_id`,`created_at`),
  CONSTRAINT `activity_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_help_tickets`
--

DROP TABLE IF EXISTS `ai_help_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_help_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `source` varchar(40) NOT NULL DEFAULT 'super_admin',
  `mode` varchar(40) NOT NULL DEFAULT 'diagnose',
  `prompt` text DEFAULT NULL,
  `screenshots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`screenshots`)),
  `ai_reply` longtext DEFAULT NULL,
  `modified_files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`modified_files`)),
  `commit_hash` varchar(64) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_help_tickets`
--

LOCK TABLES `ai_help_tickets` WRITE;
/*!40000 ALTER TABLE `ai_help_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_help_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_adjustments`
--

DROP TABLE IF EXISTS `attendance_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_record_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`new_values`)),
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `attendance_adjustments_attendance_record_id_foreign` (`attendance_record_id`),
  KEY `attendance_adjustments_user_id_foreign` (`user_id`),
  CONSTRAINT `attendance_adjustments_attendance_record_id_foreign` FOREIGN KEY (`attendance_record_id`) REFERENCES `attendance_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_adjustments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_adjustments`
--

LOCK TABLES `attendance_adjustments` WRITE;
/*!40000 ALTER TABLE `attendance_adjustments` DISABLE KEYS */;
INSERT INTO `attendance_adjustments` VALUES (1,30,4,'{\"status\": \"half_day\", \"learned\": \"Na\", \"work_done\": \"Panel washing\", \"clock_out_at\": \"2026-10-05T12:30:00.000000Z\", \"work_minutes\": 460, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Panel washing\", \"clock_out_at\": \"2026-10-05T13:00:00.000000Z\", \"work_minutes\": 490, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Na','2026-10-05 18:33:15'),(2,33,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"short_day\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-08T07:30:00.000000Z\", \"work_minutes\": 180, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Na','2026-10-11 04:48:45'),(3,14,4,'{\"status\": \"present\", \"learned\": \"How to clean the Panel\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-01T12:30:00.000000Z\", \"work_minutes\": 510, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"How to clean the Panel\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-01T13:00:00.000000Z\", \"work_minutes\": 540, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:55:49'),(4,15,4,'{\"status\": \"half_day\", \"learned\": \"How to clean the Panel\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-01T12:30:00.000000Z\", \"work_minutes\": 450, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"How to clean the Panel\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-01T13:00:00.000000Z\", \"work_minutes\": 480, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:56:15'),(5,18,4,'{\"status\": \"half_day\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T12:30:00.000000Z\", \"work_minutes\": 450, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T13:00:00.000000Z\", \"work_minutes\": 480, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:56:37'),(6,17,4,'{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T12:30:00.000000Z\", \"work_minutes\": 510, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T13:00:00.000000Z\", \"work_minutes\": 540, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:56:58'),(7,19,4,'{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T13:30:00.000000Z\", \"work_minutes\": 568, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T13:00:00.000000Z\", \"work_minutes\": 538, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:57:16'),(8,16,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-02T13:00:00.000000Z\", \"work_minutes\": 465, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 10:57:57'),(9,12,4,'{\"status\": \"half_day\", \"learned\": \"નવીન મા કાય નહીં\", \"work_done\": \"સફાઈ કામ\", \"clock_out_at\": \"2026-10-01T10:22:04.000000Z\", \"work_minutes\": 284, \"clock_out_accuracy\": \"98.40\", \"clock_out_latitude\": \"22.2008583\", \"clock_out_longitude\": \"71.4952204\"}','{\"status\": \"present\", \"learned\": \"નવીન મા કાય નહીં\", \"work_done\": \"સફાઈ કામ\", \"clock_out_at\": \"2026-10-01T13:00:00.000000Z\", \"work_minutes\": 442, \"clock_out_accuracy\": \"98.40\", \"clock_out_latitude\": \"22.2008583\", \"clock_out_longitude\": \"71.4952204\"}','Time correct','2026-10-12 10:58:37'),(10,20,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-03T12:30:00.000000Z\", \"work_minutes\": 516, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Na','2026-10-12 10:59:18'),(11,23,4,'{\"status\": \"half_day\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-03T12:30:00.000000Z\", \"work_minutes\": 450, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-03T13:00:00.000000Z\", \"work_minutes\": 480, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 11:00:49'),(12,27,4,'{\"status\": \"half_day\", \"learned\": \"Na\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-04T12:30:00.000000Z\", \"work_minutes\": 460, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Plate Washing\", \"clock_out_at\": \"2026-10-04T13:00:00.000000Z\", \"work_minutes\": 490, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time correct','2026-10-12 11:01:17'),(13,24,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Na\", \"work_done\": \"Na\", \"clock_out_at\": \"2026-10-05T12:30:00.000000Z\", \"work_minutes\": 454, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time out notu kariyu','2026-10-12 11:02:16'),(14,31,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Ky ny\", \"work_done\": \"Ky ny\", \"clock_out_at\": \"2026-10-06T12:30:00.000000Z\", \"work_minutes\": 487, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time out notu kariyu','2026-10-12 11:04:19'),(15,32,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"present\", \"learned\": \"Ky ny\", \"work_done\": \"Ky ny\", \"clock_out_at\": \"2026-10-07T12:30:00.000000Z\", \"work_minutes\": 456, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time out notu kariyu','2026-10-12 11:04:49'),(16,34,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"short_day\", \"learned\": \"Ky ny\", \"work_done\": \"Ky ny\", \"clock_out_at\": \"2026-10-09T13:00:00.000000Z\", \"work_minutes\": 110, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time out notu kariyu','2026-10-12 11:08:53'),(17,35,4,'{\"status\": \"open\", \"learned\": null, \"work_done\": null, \"clock_out_at\": null, \"work_minutes\": 0, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','{\"status\": \"half_day\", \"learned\": \"Ky ny\", \"work_done\": \"Ky ny\", \"clock_out_at\": \"2026-10-10T12:30:00.000000Z\", \"work_minutes\": 216, \"clock_out_accuracy\": null, \"clock_out_latitude\": null, \"clock_out_longitude\": null}','Time out baki 6e','2026-10-12 11:12:05');
/*!40000 ALTER TABLE `attendance_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_breaks`
--

DROP TABLE IF EXISTS `attendance_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_breaks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_record_id` bigint(20) unsigned NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `return_selfie_path` varchar(255) DEFAULT NULL,
  `duration_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `break_type` varchar(255) NOT NULL DEFAULT 'regular',
  `out_reason` varchar(255) DEFAULT NULL,
  `out_selfie_path` varchar(255) DEFAULT NULL,
  `deduction_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_deducted` tinyint(1) NOT NULL DEFAULT 0,
  `admin_waived` tinyint(1) NOT NULL DEFAULT 0,
  `waive_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_breaks_attendance_record_id_ended_at_index` (`attendance_record_id`,`ended_at`),
  CONSTRAINT `attendance_breaks_attendance_record_id_foreign` FOREIGN KEY (`attendance_record_id`) REFERENCES `attendance_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_breaks`
--

LOCK TABLES `attendance_breaks` WRITE;
/*!40000 ALTER TABLE `attendance_breaks` DISABLE KEYS */;
INSERT INTO `attendance_breaks` VALUES (1,5,'2026-09-21 15:02:31','2026-09-21 15:03:14','attendance-break-selfies/2026/09/qTyieRnjSPnX9LwAzauiJqhNcWzO08qNc5xg5yFi.jpg',0,'2026-09-21 09:32:31','2026-09-21 09:33:14','regular',NULL,NULL,0.00,0,0,NULL),(2,9,'2026-09-26 15:34:07','2026-09-26 15:34:34','attendance-break-selfies/2026/09/7K2MmgEgP2zN4pAUsK7rPOi4afZltOMn6jnx6eVp.jpg',0,'2026-09-26 10:04:07','2026-09-26 10:04:34','regular',NULL,NULL,0.00,0,0,NULL),(3,10,'2026-09-27 12:51:29','2026-09-27 17:56:07','attendance-break-selfies/2026/09/IdPlKOKyiPxB2IAT0yXcj7EpOrBb4eI5XA7dVyFE.jpg',304,'2026-09-27 07:21:29','2026-09-27 12:26:07','regular',NULL,NULL,0.00,0,0,NULL),(4,11,'2026-09-28 13:15:19','2026-09-28 14:31:20','attendance-break-selfies/2026/09/uvgDKqukkhrrvcJktlsER2Chn8PGStkH6AwJw8Vj.jpg',76,'2026-09-28 07:45:19','2026-09-28 09:01:20','regular',NULL,NULL,0.00,0,0,NULL),(5,12,'2026-10-01 13:06:44','2026-10-01 15:51:31','attendance-break-selfies/2026/10/5UezvcEKCdYLIM6njhKfWgoe7xhy6E6wyf53WmV4.jpg',164,'2026-10-01 07:36:44','2026-10-01 10:21:31','regular',NULL,NULL,0.00,0,0,NULL),(6,16,'2026-10-02 13:14:33','2026-10-02 14:49:20','attendance-break-selfies/2026/10/5PodJonvbrwRaFw84SkiEi8ghXzmrAvQAAb9HAQQ.jpg',94,'2026-10-02 07:44:33','2026-10-02 09:19:20','regular',NULL,NULL,0.00,0,0,NULL),(7,16,'2026-10-02 15:46:21','2026-10-02 15:47:00','attendance-break-selfies/2026/10/4myeQ8iW7FL1qu7WKdhX2bzlR6NP6BEAlIaV7YS6.jpg',0,'2026-10-02 10:16:21','2026-10-02 10:17:00','regular',NULL,NULL,0.00,0,0,NULL),(8,16,'2026-10-02 16:08:34',NULL,NULL,0,'2026-10-02 10:38:34','2026-10-02 10:38:34','regular',NULL,NULL,0.00,0,0,NULL),(9,20,'2026-10-03 13:09:55','2026-10-03 14:12:26','attendance-break-selfies/2026/10/zovHITOaS1M73FQqexRl9Rxp5lyfvaiotMkWTaaj.jpg',62,'2026-10-03 07:39:55','2026-10-03 08:42:26','regular',NULL,NULL,0.00,0,0,NULL),(10,20,'2026-10-03 14:13:13','2026-10-03 14:13:24','attendance-break-selfies/2026/10/uou18rBEXCmcNoYu5KLq3SSrCuqru14g0l1W5C85.jpg',0,'2026-10-03 08:43:13','2026-10-03 08:43:24','regular',NULL,NULL,0.00,0,0,NULL),(11,24,'2026-10-05 13:01:39','2026-10-05 14:54:32','attendance-break-selfies/2026/10/nFT4QRDBddsE9OcXubgsFQE4YSNn84xzoMYo4Hxg.jpg',112,'2026-10-05 07:31:39','2026-10-05 09:24:32','regular',NULL,NULL,0.00,0,0,NULL),(12,31,'2026-10-06 13:01:26','2026-10-06 14:45:17','attendance-break-selfies/2026/10/YYrnr7jJlUB2WdBPQqUm1HfaiHk3R0KaIZRbtbMx.jpg',103,'2026-10-06 07:31:26','2026-10-06 09:15:17','regular',NULL,NULL,0.00,0,0,NULL),(13,32,'2026-10-07 13:02:52','2026-10-07 14:43:41','attendance-break-selfies/2026/10/5qRrDxFJ9sbTpk2qdbCNWmxNMzNofKwa2FkjV60r.jpg',100,'2026-10-07 07:32:52','2026-10-07 09:13:41','regular',NULL,NULL,0.00,0,0,NULL),(14,33,'2026-10-08 13:09:47','2026-10-08 14:34:00','attendance-break-selfies/2026/10/Py7FcJyCA3Od8B7Xy0MTVjAXaOC7DYKKEc96kqB1.jpg',84,'2026-10-08 07:39:47','2026-10-08 09:04:00','regular',NULL,NULL,0.00,0,0,NULL),(15,34,'2026-10-09 16:39:18','2026-10-09 16:39:30','attendance-break-selfies/2026/10/SGMEjGi4Xhq40K7M5mStQiFjNODZ5Usp8L8anzhq.jpg',0,'2026-10-09 11:09:18','2026-10-09 11:09:30','regular',NULL,NULL,0.00,0,0,NULL),(16,35,'2026-10-10 13:21:01','2026-10-10 14:24:55','attendance-break-selfies/2026/10/UPeWX3rrVrAHPZNxVmtTRLJq1sdvc35CbZsxndu9.jpg',63,'2026-10-10 07:51:01','2026-10-10 08:54:55','regular',NULL,NULL,0.00,0,0,NULL),(17,58,'2026-10-13 11:45:01','2026-10-13 11:45:13','attendance-break-selfies/2026/10/VPK9m8HjmJDtKoMc85dzSp4qOYkNoad3xruKnG8G.jpg',0,'2026-10-13 06:15:01','2026-10-13 06:15:13','regular',NULL,NULL,0.00,0,0,NULL),(18,58,'2026-10-13 11:45:25','2026-10-13 11:45:32','attendance-break-selfies/2026/10/ciZ8FrGjZhGlKCHuctGgvv4xSJHJKnjg8q3o77kX.jpg',0,'2026-10-13 06:15:25','2026-10-13 06:15:32','urgent_out','uegrh','attendance-break-selfies/2026/10/xNcg3StpLeVSATHqNNYUQGLwXRzbOZTFZ5fqfJVs.jpg',0.00,0,0,NULL),(19,58,'2026-10-13 14:38:25','2026-10-13 14:38:32','attendance-break-selfies/2026/10/gzBBrZVjcoYkZgMATC8pohrm9zsURYhuCnMDRaRf.jpg',0,'2026-10-13 09:08:25','2026-10-13 09:08:32','regular',NULL,NULL,0.00,0,0,NULL),(20,59,'2026-10-14 14:27:22','2026-10-14 14:27:39','attendance-break-selfies/2026/10/l461xzAADLQBjiYk6yT4lUjNmlHozxoS65GGy9cu.jpg',0,'2026-10-14 08:57:22','2026-10-14 08:57:39','regular',NULL,NULL,0.00,0,0,NULL),(21,66,'2026-10-15 13:38:57','2026-10-15 13:39:04','attendance-break-selfies/2026/10/6VcVPhNltPgH575FoEdv6L10Lfkge2Iq7G9NsuFP.jpg',0,'2026-10-15 08:08:57','2026-10-15 08:09:04','regular',NULL,NULL,0.00,0,0,NULL),(22,67,'2026-10-16 12:58:18','2026-10-16 14:46:58','attendance-break-selfies/2026/10/I0mEWZ7FoXRjzvN9VH2IXe5ekGb5hm0aqgrTIEEY.jpg',108,'2026-10-16 07:28:18','2026-10-16 09:16:58','regular',NULL,NULL,0.00,0,0,NULL);
/*!40000 ALTER TABLE `attendance_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_records`
--

DROP TABLE IF EXISTS `attendance_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in_at` datetime NOT NULL,
  `clock_in_latitude` decimal(10,7) DEFAULT NULL,
  `clock_in_longitude` decimal(10,7) DEFAULT NULL,
  `clock_in_accuracy` decimal(10,2) DEFAULT NULL,
  `selfie_path` varchar(255) DEFAULT NULL,
  `entry_source` varchar(30) NOT NULL DEFAULT 'employee',
  `recorded_by` bigint(20) unsigned DEFAULT NULL,
  `entry_reason` text DEFAULT NULL,
  `clock_out_at` datetime DEFAULT NULL,
  `clock_out_latitude` decimal(10,7) DEFAULT NULL,
  `clock_out_longitude` decimal(10,7) DEFAULT NULL,
  `clock_out_accuracy` decimal(10,2) DEFAULT NULL,
  `work_done` text DEFAULT NULL,
  `learned` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'open',
  `work_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `break_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `is_late` tinyint(1) NOT NULL DEFAULT 0,
  `is_early_out` tinyint(1) NOT NULL DEFAULT 0,
  `overtime_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `manual_correction` tinyint(1) NOT NULL DEFAULT 0,
  `correction_reason` text DEFAULT NULL,
  `corrected_by` bigint(20) unsigned DEFAULT NULL,
  `corrected_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attendance_records_employee_id_attendance_date_unique` (`employee_id`,`attendance_date`),
  KEY `attendance_records_corrected_by_foreign` (`corrected_by`),
  KEY `attendance_records_attendance_date_status_index` (`attendance_date`,`status`),
  KEY `attendance_records_recorded_by_foreign` (`recorded_by`),
  KEY `attendance_source_date_idx` (`entry_source`,`attendance_date`),
  CONSTRAINT `attendance_records_corrected_by_foreign` FOREIGN KEY (`corrected_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attendance_records_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_records_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_records`
--

LOCK TABLES `attendance_records` WRITE;
/*!40000 ALTER TABLE `attendance_records` DISABLE KEYS */;
INSERT INTO `attendance_records` VALUES (5,3,'2026-09-21','2026-09-21 14:59:23',22.2007529,71.4952526,20.00,'attendance-selfies/2026/09/HP48HfNoMb6fgJRe0RrhzgwLWkxsbsxmoXdQsxfZ.jpg','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'open',0,0,1,0,0,0,NULL,NULL,NULL,'2026-09-21 09:29:23','2026-09-21 09:29:23'),(6,3,'2026-09-22','2026-09-22 08:04:12',22.2008818,71.4952425,98.40,'attendance-selfies/2026/09/i39vAj5BMSAacExnmJNj6RJDcZtzsxyFWutsDwjU.jpg','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'open',0,0,0,0,0,0,NULL,NULL,NULL,'2026-09-22 02:34:12','2026-09-22 02:34:12'),(7,4,'2026-09-21','2026-09-21 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'testing','2026-09-21 19:00:00',NULL,NULL,NULL,'testing','testing','present',660,0,0,0,180,0,NULL,NULL,NULL,'2026-09-22 08:59:22','2026-09-22 08:59:22'),(8,4,'2026-09-01','2026-09-01 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'NA','2026-09-01 19:00:00',NULL,NULL,NULL,'NA','NA','present',600,60,0,0,120,0,NULL,NULL,NULL,'2026-09-23 08:28:46','2026-09-23 08:28:46'),(9,3,'2026-09-26','2026-09-26 09:35:59',22.2007653,71.4952093,23.60,'attendance-selfies/2026/09/OAKKU69tawTfX011xKWw8jtP9qnOAdM0cYvwHRjr.jpg','employee',NULL,NULL,'2026-09-26 15:36:03',22.2007450,71.4941621,9.30,'કેબલ ટાઇ કટીંગ','કેવી રીતના કેબલ થાય કાપી','half_day',360,0,1,1,0,0,NULL,NULL,NULL,'2026-09-26 04:05:59','2026-09-26 10:06:03'),(10,3,'2026-09-27','2026-09-27 08:50:22',22.2007723,71.4952455,45.60,'attendance-selfies/2026/09/2prGX9arYYmT5QyrWMheZ2C3l54uYNSm6AHgVoGn.jpg','employee',NULL,NULL,'2026-09-27 17:56:28',22.2006033,71.4947416,6.50,'વાઇપર','નવીન માં કાય નય','half_day',242,304,0,1,0,0,NULL,NULL,NULL,'2026-09-27 03:20:22','2026-09-27 12:26:28'),(11,3,'2026-09-28','2026-09-28 08:37:51',22.2003017,71.4940317,12.40,'attendance-selfies/2026/09/VNsTQBDOOL05G7EMy5c0YqLxP0Sroc0N7VYrrzgh.jpg','employee',NULL,NULL,'2026-09-28 14:32:30',22.2007328,71.4952156,48.90,'કેબલ ટાઇ કટીંગ કરી રહ્યા છે','નવીન મા  કાય નહીં','half_day',278,76,0,1,0,0,NULL,NULL,NULL,'2026-09-28 03:07:51','2026-09-28 09:02:30'),(12,3,'2026-10-01','2026-10-01 08:23:41',22.2013600,71.4949600,6.80,'attendance-selfies/2026/10/kyrJ4RSwJXrAJ1waHZfOffPDJBQBIXoeCT1F5msO.jpg','employee',NULL,NULL,'2026-10-01 18:30:00',22.2008583,71.4952204,98.40,'સફાઈ કામ','નવીન મા કાય નહીં','present',442,164,0,0,0,1,'Time correct',4,'2026-10-12 16:28:37','2026-10-01 02:53:41','2026-10-12 10:58:37'),(13,4,'2026-10-01','2026-10-01 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Employee not knowledge to how to write','2026-10-01 19:00:00',NULL,NULL,NULL,'Plate Washing','How to clean solar panel','present',570,90,0,0,90,0,NULL,NULL,NULL,'2026-10-01 15:10:52','2026-10-01 15:10:52'),(14,5,'2026-10-01','2026-10-01 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Employee not knowledge to how to write','2026-10-01 18:30:00',NULL,NULL,NULL,'Plate Washing','How to clean the Panel','present',540,90,0,0,60,1,'Time correct',4,'2026-10-12 16:25:49','2026-10-01 15:12:13','2026-10-12 10:55:49'),(15,6,'2026-10-01','2026-10-01 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Employee not knowledge to how to write','2026-10-01 18:30:00',NULL,NULL,NULL,'Plate Washing','How to clean the Panel','present',480,90,0,0,0,1,'Time correct',4,'2026-10-12 16:26:15','2026-10-01 15:15:17','2026-10-12 10:56:15'),(16,3,'2026-10-02','2026-10-02 09:10:57',22.2012585,71.4951566,7.70,'attendance-selfies/2026/10/wMNppYehVT8IWMTp7L9XZiIN1itSh2ZVDFAChuiM.jpg','employee',NULL,NULL,'2026-10-02 18:30:00',NULL,NULL,NULL,'Na','Na','present',465,94,0,0,0,1,'Time correct',4,'2026-10-12 16:27:57','2026-10-02 03:40:57','2026-10-12 10:57:57'),(17,5,'2026-10-02','2026-10-02 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-02 18:30:00',NULL,NULL,NULL,'Na','Na','present',540,90,0,0,60,1,'Time correct',4,'2026-10-12 16:26:58','2026-10-02 13:28:33','2026-10-12 10:56:58'),(18,6,'2026-10-02','2026-10-02 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-02 18:30:00',NULL,NULL,NULL,'Na','Na','present',480,90,0,0,0,1,'Time correct',4,'2026-10-12 16:26:37','2026-10-02 13:29:27','2026-10-12 10:56:37'),(19,4,'2026-10-02','2026-10-02 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-02 18:30:00',NULL,NULL,NULL,'Na','Na','present',538,92,0,0,58,1,'Time correct',4,'2026-10-12 16:27:16','2026-10-02 13:30:05','2026-10-12 10:57:16'),(20,3,'2026-10-03','2026-10-03 08:21:23',22.2008429,71.4952657,42.53,'attendance-selfies/2026/10/mCW0OnBGF9ZW4c4WVEdFt6guIv40SjZ8auxAzynB.jpg','employee',NULL,NULL,'2026-10-03 18:00:00',NULL,NULL,NULL,'Na','Na','present',516,62,0,0,36,1,'Na',4,'2026-10-12 16:29:18','2026-10-03 02:51:23','2026-10-12 10:59:18'),(21,4,'2026-10-03','2026-10-03 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-03 21:30:00',NULL,NULL,NULL,'NA','Na','present',720,90,0,0,240,0,NULL,NULL,NULL,'2026-10-03 19:05:55','2026-10-03 19:05:55'),(22,5,'2026-10-03','2026-10-03 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-03 18:00:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-03 19:06:18','2026-10-03 19:06:18'),(23,6,'2026-10-03','2026-10-03 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-03 18:30:00',NULL,NULL,NULL,'Na','Na','present',480,90,0,0,0,1,'Time correct',4,'2026-10-12 16:30:49','2026-10-03 19:06:42','2026-10-12 11:00:49'),(24,3,'2026-10-05','2026-10-05 08:33:25',22.2003317,71.4938117,12.80,'attendance-selfies/2026/10/ZFLRt1IQJ3if8McLKHXxpmEKVbHqQoydfWQCZajR.jpg','employee',NULL,NULL,'2026-10-05 18:00:00',NULL,NULL,NULL,'Na','Na','present',454,112,0,0,0,1,'Time out notu kariyu',4,'2026-10-12 16:32:16','2026-10-05 03:03:25','2026-10-12 11:02:16'),(25,4,'2026-10-04','2026-10-04 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-04 19:00:00',NULL,NULL,NULL,'Plate Washing','Na','present',580,80,0,0,100,0,NULL,NULL,NULL,'2026-10-05 18:28:08','2026-10-05 18:28:08'),(26,5,'2026-10-04','2026-10-04 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-04 18:00:00',NULL,NULL,NULL,'Panel washing','Na','present',520,80,0,0,40,0,NULL,NULL,NULL,'2026-10-05 18:28:40','2026-10-05 18:28:40'),(27,6,'2026-10-04','2026-10-04 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-04 18:30:00',NULL,NULL,NULL,'Plate Washing','Na','present',490,80,0,0,10,1,'Time correct',4,'2026-10-12 16:31:17','2026-10-05 18:29:40','2026-10-12 11:01:17'),(28,4,'2026-10-05','2026-10-05 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-05 19:00:00',NULL,NULL,NULL,'Plate Washing and water pipe coupin','Na','present',580,80,0,0,100,0,NULL,NULL,NULL,'2026-10-05 18:30:47','2026-10-05 18:30:47'),(29,5,'2026-10-05','2026-10-05 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-05 18:00:00',NULL,NULL,NULL,'Panel washing','Na','present',520,80,0,0,40,0,NULL,NULL,NULL,'2026-10-05 18:31:46','2026-10-05 18:31:46'),(30,6,'2026-10-05','2026-10-05 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Not knowledge','2026-10-05 18:30:00',NULL,NULL,NULL,'Panel washing','Na','present',490,80,0,0,10,1,'Na',4,'2026-10-06 00:03:15','2026-10-05 18:32:27','2026-10-05 18:33:15'),(31,3,'2026-10-06','2026-10-06 08:09:59',22.2012077,71.4952772,3.54,'attendance-selfies/2026/10/mmetQW7SzTC6dgPpvM9A0yJ5h5hqizWAmkYqxSKk.jpg','employee',NULL,NULL,'2026-10-06 18:00:00',NULL,NULL,NULL,'Ky ny','Ky ny','present',487,103,0,0,7,1,'Time out notu kariyu',4,'2026-10-12 16:34:19','2026-10-06 02:39:59','2026-10-12 11:04:19'),(32,3,'2026-10-07','2026-10-07 08:43:52',22.2007481,71.4952096,135.60,'attendance-selfies/2026/10/n1Hrb3xGvXXwh7hyoF36JvuHZjyJSeJOtAA22YCD.jpg','employee',NULL,NULL,'2026-10-07 18:00:00',NULL,NULL,NULL,'Ky ny','Ky ny','present',456,100,0,0,0,1,'Time out notu kariyu',4,'2026-10-12 16:34:49','2026-10-07 03:13:52','2026-10-12 11:04:49'),(33,3,'2026-10-08','2026-10-08 08:35:32',22.2007737,71.4951805,20.00,'attendance-selfies/2026/10/c2BX8uYNjru4FerHbHOfCPDdGrPN84avANZE8qSC.jpg','employee',NULL,NULL,'2026-10-08 13:00:00',NULL,NULL,NULL,'Na','Na','short_day',180,84,0,1,0,1,'Na',4,'2026-10-11 10:18:45','2026-10-08 03:05:32','2026-10-11 04:48:45'),(34,3,'2026-10-09','2026-10-09 16:39:16',22.2010800,71.4950133,95.80,'attendance-selfies/2026/10/SM3KMoEiilhIRE6nN5HbZQyNEA8vYzab7V9d2uxg.jpg','employee',NULL,NULL,'2026-10-09 18:30:00',NULL,NULL,NULL,'Ky ny','Ky ny','short_day',110,0,1,0,0,1,'Time out notu kariyu',4,'2026-10-12 16:38:53','2026-10-09 11:09:16','2026-10-12 11:08:53'),(35,3,'2026-10-10','2026-10-10 13:20:59',22.1938304,71.5011760,3.00,'attendance-selfies/2026/10/uiv2Mf7XjBp5yyP1gXniL3KDMXj5KLiJFUETkNqU.jpg','employee',NULL,NULL,'2026-10-10 18:00:00',NULL,NULL,NULL,'Ky ny','Ky ny','half_day',216,63,1,0,0,1,'Time out baki 6e',4,'2026-10-12 16:42:05','2026-10-10 07:50:59','2026-10-12 11:12:05'),(36,3,'2026-10-12','2026-10-12 07:31:19',22.2012485,71.4946304,3.00,'attendance-selfies/2026/10/0A7yNE8bzjYsCvnnp6pSmU4CeU53YobOVgGFC63W.jpg','employee',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-12 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-12 20:28:52','2026-10-12 02:01:19','2026-10-12 14:58:52'),(37,6,'2026-10-06','2026-10-06 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-06 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:03:12','2026-10-12 11:03:12'),(38,5,'2026-10-06','2026-10-06 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-06 18:00:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:03:29','2026-10-12 11:03:29'),(39,4,'2026-10-06','2026-10-06 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-06 19:00:00',NULL,NULL,NULL,'Na','Na','present',570,90,0,0,90,0,NULL,NULL,NULL,'2026-10-12 11:03:44','2026-10-12 11:03:44'),(40,4,'2026-10-07','2026-10-07 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-07 19:00:00',NULL,NULL,NULL,'Na','Na','present',570,90,0,0,90,0,NULL,NULL,NULL,'2026-10-12 11:05:03','2026-10-12 11:05:03'),(41,5,'2026-10-07','2026-10-07 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-07 18:00:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:05:20','2026-10-12 11:05:20'),(42,6,'2026-10-07','2026-10-07 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-07 18:00:00',NULL,NULL,NULL,'Na','Na','present',480,90,0,0,0,0,NULL,NULL,NULL,'2026-10-12 11:05:44','2026-10-12 11:05:44'),(43,6,'2026-10-08','2026-10-08 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-08 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:06:25','2026-10-12 11:06:25'),(44,5,'2026-10-08','2026-10-08 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-08 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:06:52','2026-10-12 11:06:52'),(45,4,'2026-10-08','2026-10-08 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-08 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:07:31','2026-10-12 11:07:31'),(46,4,'2026-10-09','2026-10-09 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-09 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:09:51','2026-10-12 11:09:51'),(47,5,'2026-10-09','2026-10-09 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'NA','2026-10-09 18:30:00',NULL,NULL,NULL,'NA','NA','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:10:58','2026-10-12 11:10:58'),(48,6,'2026-10-09','2026-10-09 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-09 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:11:27','2026-10-12 11:11:27'),(49,4,'2026-10-10','2026-10-10 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-10 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:12:39','2026-10-12 11:12:39'),(50,5,'2026-10-10','2026-10-10 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-10 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:13:01','2026-10-12 11:13:01'),(51,6,'2026-10-10','2026-10-10 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-10 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:13:30','2026-10-12 11:13:30'),(52,4,'2026-10-11','2026-10-11 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-11 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:14:35','2026-10-12 11:14:35'),(53,5,'2026-10-11','2026-10-11 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-11 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,1,0,30,0,NULL,NULL,NULL,'2026-10-12 11:15:02','2026-10-12 11:15:02'),(54,6,'2026-10-11','2026-10-11 08:30:00',NULL,NULL,NULL,NULL,'manager',4,'Na','2026-10-11 18:30:00',NULL,NULL,NULL,'Na','Na','present',510,90,0,0,30,0,NULL,NULL,NULL,'2026-10-12 11:15:29','2026-10-12 11:15:29'),(55,4,'2026-10-12','2026-10-12 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-12 19:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-12 20:29:01','2026-10-12 11:39:25','2026-10-12 14:59:01'),(56,6,'2026-10-12','2026-10-12 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-12 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-12 20:28:59','2026-10-12 11:39:29','2026-10-12 14:58:59'),(57,5,'2026-10-12','2026-10-12 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-12 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-12 20:28:56','2026-10-12 11:39:32','2026-10-12 14:58:56'),(58,3,'2026-10-13','2026-10-13 08:06:43',22.2013680,71.4949991,3.00,'attendance-selfies/2026/10/bpFWaxZQQZOHM86Oi1VXPiVRlvoLy8DkmJ6xTWmg.jpg','employee',NULL,NULL,'2026-10-13 18:00:00',22.2014396,71.4950473,3.00,'સફાઈ કામ શરૂ છે','નવીનમાં અત્યારે કાંઈ નથી','present',593,0,0,0,113,0,NULL,NULL,NULL,'2026-10-13 02:36:43','2026-10-16 09:19:10'),(59,3,'2026-10-14','2026-10-14 09:11:55',22.2014717,71.4951583,7.80,'attendance-selfies/2026/10/2Tc0R8ZMRg3vIgJl0R6ineNgj5VRux4kQKQ48HdH.jpg','employee',NULL,NULL,'2026-10-14 19:52:07',22.1936267,71.5012261,8.00,'લાદી કામ કર્યું','કાય નહીં','present',640,0,0,0,160,0,'⚠️ Geofence: Punched 18.2 km away from plant (Apex Solar Power)',NULL,NULL,'2026-10-14 03:41:55','2026-10-14 14:22:07'),(60,4,'2026-10-14','2026-10-14 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-14 19:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:04','2026-10-14 11:03:04'),(61,5,'2026-10-14','2026-10-14 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-14 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:09','2026-10-14 11:03:09'),(62,6,'2026-10-14','2026-10-14 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-14 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:12','2026-10-14 11:03:12'),(63,5,'2026-10-13','2026-10-13 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-13 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:23','2026-10-14 11:03:23'),(64,6,'2026-10-13','2026-10-13 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-13 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:25','2026-10-14 11:03:25'),(65,4,'2026-10-13','2026-10-13 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-13 19:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,0,NULL,NULL,NULL,'2026-10-14 11:03:27','2026-10-14 11:03:27'),(66,3,'2026-10-15','2026-10-15 13:38:54',22.1937500,71.5012400,5.00,'attendance-selfies/2026/10/EPPEILficJph6xUi4unYc2y5WsC2gUp6zytL960Y.jpg','employee',NULL,NULL,'2026-10-15 18:00:00',22.2014895,71.4950876,3.00,'સફાઈ કામ','નવું કામ કાય નયી','half_day',261,0,1,0,0,0,'⚠️ Geofence: Punched 17.4 km away from plant (Apex Solar Power)',NULL,NULL,'2026-10-15 08:08:55','2026-10-16 09:16:24'),(67,3,'2026-10-16','2026-10-16 07:39:10',22.2010102,71.4948220,4.22,'attendance-selfies/2026/10/bctlC4oyv3nZQDpy4AUGnfFGOJz1uaF6ev3RQlPD.jpg','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'open',0,108,0,0,0,0,'⚠️ Geofence: Punched 18.2 km away from plant (Apex Solar Power)',NULL,NULL,'2026-10-16 02:09:10','2026-10-16 09:16:58'),(68,4,'2026-10-16','2026-10-16 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-16 19:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-16 16:13:15','2026-10-16 10:43:15','2026-10-16 10:43:15'),(69,5,'2026-10-16','2026-10-16 08:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-16 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-16 16:13:18','2026-10-16 10:43:18','2026-10-16 10:43:18'),(70,6,'2026-10-16','2026-10-16 09:00:00',NULL,NULL,NULL,NULL,'manager',4,'Full Day confirmed via Quick Attendance Checklist','2026-10-16 18:00:00',NULL,NULL,NULL,'Full Day Solar Plant Duty','Completed plant inspection and operations','present',480,60,0,0,0,1,'Full Day confirmed via Quick Attendance Checklist',4,'2026-10-16 16:13:21','2026-10-16 10:43:21','2026-10-16 10:43:21');
/*!40000 ALTER TABLE `attendance_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('solarflow-cache-solar_schema_healed_v2','b:1;',1792258311);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_name` varchar(120) DEFAULT NULL,
  `owner_designation` varchar(150) DEFAULT NULL,
  `owner_photo_path` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_ss_reference` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` decimal(10,7) DEFAULT 22.3039000,
  `longitude` decimal(10,7) DEFAULT 70.8022000,
  `plant_location` varchar(150) DEFAULT 'Rajkot, Gujarat',
  `plant_import_multiplier` double NOT NULL DEFAULT 600,
  `plant_export_multiplier` double NOT NULL DEFAULT 600,
  `sub_import_multiplier` double NOT NULL DEFAULT 5000,
  `sub_export_multiplier` double NOT NULL DEFAULT 5000,
  `expense_percentage` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Apex Solar Power','Sanjay Patel','Proprietor',NULL,'company-logos/TS8jTqK68S1u195pG3ZPnd10KjcwtVWalFtC03hZ.jpg',1,1,22.1704000,71.6684000,'Solar Park, Sector 4',600,600,5000,5000,22.16,'2026-09-18 06:17:15','2026-10-16 17:29:02'),(2,'Vibrant Green Energy','Ramesh Shah','Partner',NULL,'company-logos/6ojW8VBwX5iVewLyaBo0HiLKy2nUunRFdvGPI5xv.png',1,0,22.1704000,71.6684000,'Solar Park, Sector 4',1000,1000,5000,5000,39.69,'2026-09-18 06:17:15','2026-10-16 17:29:02'),(3,'Zenith Suntech Systems','Kishore Mehta','Director',NULL,NULL,1,0,22.1704000,71.6684000,'Solar Park, Sector 4',1000,1000,5000,5000,38.15,'2026-09-18 06:17:16','2026-10-16 17:29:02');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_inverter_outputs`
--

DROP TABLE IF EXISTS `daily_inverter_outputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_inverter_outputs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `daily_reading_id` bigint(20) unsigned NOT NULL,
  `inverter_id` bigint(20) unsigned NOT NULL,
  `generation` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_inverter_outputs_daily_reading_id_inverter_id_unique` (`daily_reading_id`,`inverter_id`),
  KEY `daily_inverter_outputs_inverter_id_foreign` (`inverter_id`),
  CONSTRAINT `daily_inverter_outputs_daily_reading_id_foreign` FOREIGN KEY (`daily_reading_id`) REFERENCES `daily_readings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_inverter_outputs_inverter_id_foreign` FOREIGN KEY (`inverter_id`) REFERENCES `inverters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_inverter_outputs`
--

LOCK TABLES `daily_inverter_outputs` WRITE;
/*!40000 ALTER TABLE `daily_inverter_outputs` DISABLE KEYS */;
INSERT INTO `daily_inverter_outputs` VALUES (1799,523,7,280.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1800,523,8,297.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1801,523,9,296.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1802,524,7,548.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1803,524,8,580.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1804,524,9,579.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1805,525,7,1055.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1806,525,8,1100.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1807,525,9,1150,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1808,526,7,1172.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1809,526,8,1241.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1810,526,9,1238.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1811,527,7,172.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1812,527,8,182.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1813,527,9,182,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1814,528,7,1283.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1815,528,8,1357.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1816,528,9,1350.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1817,529,7,738.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1818,529,8,706.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1819,529,9,1072.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1820,529,10,1020.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1821,530,7,959.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1822,530,8,970.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1823,530,9,884.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1824,530,10,940.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1825,531,7,1104.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1826,531,8,936.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1827,531,9,1158,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1828,531,10,1101.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1829,532,7,564.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1830,532,8,594.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1831,532,9,595,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1832,532,10,564.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1833,533,7,604,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1834,533,8,637,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1835,533,9,636,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1836,533,10,602.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1837,534,7,662.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1838,534,8,701.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1839,534,9,699.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1840,534,10,664.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1841,535,7,633.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1842,535,8,669.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1843,535,9,668.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1844,535,10,633.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1845,536,7,757.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1846,536,8,800.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1847,536,9,800.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1848,536,10,760.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1849,537,7,844.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1850,537,8,930.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1851,537,9,1026.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1852,537,10,974.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1853,538,7,630.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1854,538,8,666.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1855,538,9,665,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1856,538,10,630.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1857,539,7,852.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1858,539,8,908.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1859,539,9,906,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1860,539,10,858.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1861,540,7,1100.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1862,540,8,1174.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1863,540,9,1024.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1864,540,10,1165.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1865,541,7,876.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1866,541,8,924.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1867,541,9,660.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1868,541,10,868.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1869,542,7,979.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1870,542,8,1034.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1871,542,9,1029.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1872,542,10,977.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1873,543,7,846.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1874,543,8,896.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1875,543,9,895.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1876,543,10,851.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1877,544,7,1154.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1878,544,8,1220.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1879,544,9,1210.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1880,544,10,1149.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1881,545,7,961.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1882,545,8,1015.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1883,545,9,1014,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1884,545,10,961.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1885,546,7,647.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1886,546,8,684.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1887,546,9,684,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1888,546,10,648.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1889,547,7,1208.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1890,547,8,1277.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1891,547,9,1272,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1892,547,10,1209.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1893,548,7,1004.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1894,548,8,1061.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1895,548,9,1055,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1896,548,10,1000.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1897,549,7,1123.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1898,549,8,1188,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1899,549,9,1182.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1900,549,10,1123.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1901,550,7,1209.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1902,550,8,1277.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1903,550,9,1268,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1904,550,10,1204.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1905,551,7,977.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1906,551,8,1032.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1907,551,9,1029.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1908,551,10,978.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1909,552,7,1151.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1910,552,8,1217.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1911,552,9,1214.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1912,552,10,1153.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1913,553,7,1249,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1914,553,8,1320.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1915,553,9,1312.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1916,553,10,1245.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1917,554,7,1435.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1918,554,8,1518.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1919,554,9,1501.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1920,554,10,1425,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1921,555,7,1341.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1922,555,8,1416.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1923,555,9,1403.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1924,555,10,1331.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1925,556,7,1239.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1926,556,8,1309.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1927,556,9,1298.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1928,556,10,1232.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1929,557,7,1328.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1930,557,8,1403.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1931,557,9,1391.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1932,557,10,1321.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1933,558,7,1197.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1934,558,8,1266.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1935,558,9,1259,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1936,558,10,1193.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1937,559,7,1165.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1938,559,8,1232.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1939,559,9,1230.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1940,559,10,1166.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1941,560,7,1012.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1942,560,8,1068.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1943,560,9,1067.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1944,560,10,1011.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1945,561,7,1490.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1946,561,8,1568.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1947,561,9,1560.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1948,561,10,1481.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1949,562,7,1442.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1950,562,8,1524.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1951,562,9,1505.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1952,562,10,1425.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1953,563,7,1534.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1954,563,8,1624.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1955,563,9,1604.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1956,563,10,1521.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1957,564,7,1632.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1958,564,8,1726.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1959,564,9,1702.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1960,564,10,1610.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1961,565,7,491.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1962,565,8,518.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1963,565,9,518,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1964,565,10,489.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1965,566,7,593.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1966,566,8,627.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1967,566,9,625.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1968,566,10,592,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1969,567,7,343.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1970,567,8,363.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1971,567,9,362.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1972,567,10,343,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1973,568,7,1032.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1974,568,8,192.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1975,568,9,1083.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1976,568,10,1028,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1977,569,7,1114.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1978,569,8,190.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1979,569,9,1308.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1980,569,10,1240.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1981,570,1,325.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1982,570,2,339.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1983,571,1,637.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1984,571,2,664.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1985,572,1,1329.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1986,572,2,1387.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1987,573,1,1363.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1988,573,2,1418.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1989,574,1,700.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1990,574,2,728.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1991,575,1,1497.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1992,575,2,1554.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1993,576,1,1113.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1994,576,2,1234.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1995,577,1,1312.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1996,577,2,1362.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1997,578,1,1206.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1998,578,2,1334.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(1999,579,1,651.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2000,579,2,679.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2001,580,1,705.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2002,580,2,732.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2003,581,1,769.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2004,581,2,799.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2005,582,1,733.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2006,582,2,762.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2007,583,1,864.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2008,583,2,900.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2009,584,1,1112.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2010,584,2,1122.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2011,585,1,722.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2012,585,2,751.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2013,586,1,978.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2014,586,2,1021.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2015,587,1,1357.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2016,587,2,1407.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2017,588,1,1020.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2018,588,2,1058,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2019,589,1,1128.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2020,589,2,1172.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2021,590,1,967.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2022,590,2,1005.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2023,591,1,1334.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2024,591,2,1385.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2025,592,1,1104.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2026,592,2,1148.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2027,593,1,687.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2028,593,2,715.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2029,594,1,1405,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2030,594,2,1463.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2031,595,1,1166.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2032,595,2,1214.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2033,596,1,1361.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2034,596,2,1417.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2035,597,1,1407.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2036,597,2,1464.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2037,598,1,1083.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2038,598,2,1126,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2039,599,1,1341,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2040,599,2,1394.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2041,600,1,1440.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2042,600,2,1499.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2043,601,1,1677.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2044,601,2,1743.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2045,602,1,1568.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2046,602,2,1630.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2047,603,1,1443.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2048,603,2,1501.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2049,604,1,1548.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2050,604,2,1610,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2051,605,1,1400.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2052,605,2,1456,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2053,606,1,1349.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2054,606,2,1405.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2055,607,1,1184.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2056,607,2,1229.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2057,608,1,1729.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2058,608,2,1801.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2059,609,1,1696.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2060,609,2,1761.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2061,610,1,1792.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2062,610,2,1863.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2063,611,1,1900.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2064,611,2,1978.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2065,612,1,573,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2066,612,2,596.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2067,613,1,698.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2068,613,2,726.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2069,614,1,400.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2070,614,2,416.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2071,615,1,1199.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2072,615,2,1250.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2073,616,1,1311.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2074,616,2,1369.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2075,617,3,293.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2076,617,4,291.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2077,617,5,292.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2078,617,6,295.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2079,618,3,574.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2080,618,4,571.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2081,618,5,572.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2082,618,6,578.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2083,619,3,1198.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2084,619,4,1193.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2085,619,5,1194.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2086,619,6,1207,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2087,620,3,1224.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2088,620,4,1221.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2089,620,5,1219.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2090,620,6,1231.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2091,621,3,627.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2092,621,4,625,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2093,621,5,625.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2094,621,6,632.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2095,622,3,1340.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2096,622,4,1335.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2097,622,5,1334.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2098,622,6,1348.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2099,623,3,435.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2100,623,4,1007.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2101,623,5,1005.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2102,623,6,1017.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2103,624,3,828.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2104,624,4,954.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2105,624,5,1170.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2106,624,6,1181.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2107,625,3,776.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2108,625,4,1068.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2109,625,5,1061.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2110,625,6,1158.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2111,626,3,588.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2112,626,4,586.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2113,626,5,585.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2114,626,6,594.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2115,627,3,632.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2116,627,4,629.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2117,627,5,629.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2118,627,6,636.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2119,628,3,691.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2120,628,4,687.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2121,628,5,688.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2122,628,6,697.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2123,629,3,663.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2124,629,4,658.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2125,629,5,660.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2126,629,6,667,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2127,630,3,876.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2128,630,4,872.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2129,630,5,872.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2130,630,6,881.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2131,631,3,946.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2132,631,4,1016,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2133,631,5,1015,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2134,631,6,925.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2135,632,3,659.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2136,632,4,656.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2137,632,5,656.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2138,632,6,664,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2139,633,3,894.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2140,633,4,895.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2141,633,5,894.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2142,633,6,904.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2143,634,3,1092.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2144,634,4,1221.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2145,634,5,1187.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2146,634,6,1212.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2147,635,3,917.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2148,635,4,913.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2149,635,5,911.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2150,635,6,921.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2151,636,3,1024.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2152,636,4,1020.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2153,636,5,1019,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2154,636,6,1029.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2155,637,3,881.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2156,637,4,877.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2157,637,5,879.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2158,637,6,889.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2159,638,3,1204.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2160,638,4,1200.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2161,638,5,1198.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2162,638,6,1211.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2163,639,3,1002.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2164,639,4,999.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2165,639,5,997.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2166,639,6,1008.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2167,640,3,676,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2168,640,4,673.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2169,640,5,674,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2170,640,6,681.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2171,641,3,1262.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2172,641,4,1259.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2173,641,5,1255.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2174,641,6,1270.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2175,642,3,1048.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2176,642,4,1045.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2177,642,5,1043.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2178,642,6,1056.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2179,643,3,1222.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2180,643,4,1219.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2181,643,5,1217.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2182,643,6,1231.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2183,644,3,1262.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2184,644,4,1259.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2185,644,5,1257.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2186,644,6,1269.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2187,645,3,1019.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2188,645,4,1017.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2189,645,5,1015.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2190,645,6,1027,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2191,646,3,1202.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2192,646,4,1198.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2193,646,5,1196.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2194,646,6,1208.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2195,647,3,1306,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2196,647,4,1301.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2197,647,5,1297.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2198,647,6,1311.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2199,648,3,1499.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2200,648,4,1495.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2201,648,5,1490.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2202,648,6,1505.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2203,649,3,1404.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2204,649,4,1400.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2205,649,5,1396,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2206,649,6,1408.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2207,650,3,1293.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2208,650,4,1290.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2209,650,5,1287.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2210,650,6,1300,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2211,651,3,1387.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2212,651,4,1383.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2213,651,5,1380.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2214,651,6,1394,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2215,652,3,1243.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2216,652,4,1249.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2217,652,5,1246.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2218,652,6,1259,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2219,653,3,1212.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2220,653,4,1209.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2221,653,5,1208.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2222,653,6,1222.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2223,654,3,1041.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2224,654,4,1036.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2225,654,5,1034.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2226,654,6,1045.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2227,655,3,1552.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2228,655,4,1549.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2229,655,5,1544.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2230,655,6,1562.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2231,656,3,1515.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2232,656,4,1506.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2233,656,5,1502.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2234,656,6,1515.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2235,657,3,1604.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2236,657,4,1598.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2237,657,5,1592.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2238,657,6,1609.7,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2239,658,3,1704.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2240,658,4,1700.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2241,658,5,1690.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2242,658,6,1710.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2243,659,3,514.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2244,659,4,511.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2245,659,5,512.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2246,659,6,517.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2247,660,3,627.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2248,660,4,624.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2249,660,5,624.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2250,660,6,631.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2251,661,3,360.1,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2252,661,4,358.4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2253,661,5,358.2,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2254,661,6,362.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2255,662,3,1080.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2256,662,4,1074.6,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2257,662,5,1076.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2258,662,6,186.9,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2259,663,3,1297,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2260,663,4,1301.8,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2261,663,5,1231.5,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2262,663,6,1122.3,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(2263,664,7,1034.4,'2026-09-22 09:13:43','2026-09-22 09:13:43'),(2264,664,8,1106.1,'2026-09-22 09:13:43','2026-09-22 09:13:43'),(2265,664,9,1121,'2026-09-22 09:13:43','2026-09-22 09:13:43'),(2266,664,10,1062.3,'2026-09-22 09:13:43','2026-09-22 09:13:43'),(2267,665,7,976.6,'2026-09-22 09:20:24','2026-09-22 09:20:24'),(2268,665,8,1032.1,'2026-09-22 09:20:24','2026-09-22 09:20:24'),(2269,665,9,1016.2,'2026-09-22 09:20:24','2026-09-22 09:20:24'),(2270,665,10,959.2,'2026-09-22 09:20:24','2026-09-22 09:20:24'),(2271,666,7,1130.4,'2026-09-22 09:21:58','2026-09-22 09:21:58'),(2272,666,8,1266.7,'2026-09-22 09:21:58','2026-09-22 09:21:58'),(2273,666,9,1256.2,'2026-09-22 09:21:58','2026-09-22 09:21:58'),(2274,666,10,1187.2,'2026-09-22 09:21:58','2026-09-22 09:21:58'),(2275,667,7,814.7,'2026-09-22 09:23:18','2026-09-22 09:23:18'),(2276,667,8,862,'2026-09-22 09:23:18','2026-09-22 09:23:18'),(2277,667,9,860.1,'2026-09-22 09:23:18','2026-09-22 09:23:18'),(2278,667,10,817.6,'2026-09-22 09:23:18','2026-09-22 09:23:18'),(2279,668,1,1260.2,'2026-09-22 09:26:28','2026-09-22 09:26:28'),(2280,668,2,1304.6,'2026-09-22 09:26:28','2026-09-22 09:26:28'),(2281,669,1,1135.7,'2026-09-22 09:27:18','2026-09-22 09:27:18'),(2282,669,2,1181.7,'2026-09-22 09:27:18','2026-09-22 09:27:18'),(2283,670,1,1388.9,'2026-09-22 09:28:26','2026-09-22 09:28:26'),(2284,670,2,1401.1,'2026-09-22 09:28:26','2026-09-22 09:28:26'),(2285,671,1,943.2,'2026-09-22 09:29:15','2026-09-22 09:29:15'),(2286,671,2,982.3,'2026-09-22 09:29:15','2026-09-22 09:29:15'),(2287,672,3,991.8,'2026-09-22 09:31:37','2026-09-22 09:31:37'),(2288,672,4,1093.1,'2026-09-22 09:31:37','2026-09-22 09:31:37'),(2289,672,5,1107.7,'2026-09-22 09:31:37','2026-09-22 09:31:37'),(2290,672,6,1104.6,'2026-09-22 09:31:37','2026-09-22 09:31:37'),(2291,673,3,1019.7,'2026-09-22 09:32:50','2026-09-22 09:32:50'),(2292,673,4,1016.2,'2026-09-22 09:32:50','2026-09-22 09:32:50'),(2293,673,5,1012.4,'2026-09-22 09:32:50','2026-09-22 09:32:50'),(2294,673,6,1026.2,'2026-09-22 09:32:50','2026-09-22 09:32:50'),(2295,674,3,1247.1,'2026-09-22 09:34:08','2026-09-22 09:34:08'),(2296,674,4,1243.5,'2026-09-22 09:34:08','2026-09-22 09:34:08'),(2297,674,5,1241,'2026-09-22 09:34:08','2026-09-22 09:34:08'),(2298,674,6,1189.6,'2026-09-22 09:34:08','2026-09-22 09:34:08'),(2299,675,3,850,'2026-09-22 09:35:10','2026-09-22 09:35:10'),(2300,675,4,845.9,'2026-09-22 09:35:10','2026-09-22 09:35:10'),(2301,675,5,846.6,'2026-09-22 09:35:10','2026-09-22 09:35:10'),(2302,675,6,857.9,'2026-09-22 09:35:10','2026-09-22 09:35:10'),(2303,676,1,1780,'2026-09-22 09:38:31','2026-09-22 09:38:31'),(2304,676,2,1710,'2026-09-22 09:38:31','2026-09-22 09:38:31'),(2315,680,7,1460,'2026-09-22 09:55:52','2026-09-22 09:55:52'),(2316,680,8,1540,'2026-09-22 09:55:52','2026-09-22 09:55:52'),(2317,680,9,1540,'2026-09-22 09:55:52','2026-09-22 09:55:52'),(2318,680,10,1450,'2026-09-22 09:55:52','2026-09-22 09:55:52'),(2319,681,7,1200,'2026-09-23 03:05:16','2026-09-23 03:05:16'),(2320,681,8,1310,'2026-09-23 03:05:16','2026-09-23 03:05:16'),(2321,681,9,1310,'2026-09-23 03:05:16','2026-09-23 03:05:16'),(2322,681,10,1240,'2026-09-23 03:05:16','2026-09-23 03:05:16'),(2323,682,1,1500,'2026-09-23 03:07:33','2026-09-23 03:07:33'),(2324,682,2,1410,'2026-09-23 03:07:33','2026-09-23 03:07:33'),(2325,683,3,1290,'2026-09-23 03:12:31','2026-09-23 03:12:31'),(2326,683,4,1290,'2026-09-23 03:12:31','2026-09-23 03:12:31'),(2327,683,5,1290,'2026-09-23 03:12:31','2026-09-23 03:12:31'),(2328,683,6,1260,'2026-09-23 03:12:31','2026-09-23 03:12:31'),(2329,684,7,1610,'2026-09-24 03:52:05','2026-09-24 03:52:05'),(2330,684,8,1700,'2026-09-24 03:52:05','2026-09-24 03:52:05'),(2331,684,9,1680,'2026-09-24 03:52:05','2026-09-24 03:52:05'),(2332,684,10,1590,'2026-09-24 03:52:05','2026-09-24 03:52:05'),(2333,685,3,1670,'2026-09-24 03:59:13','2026-09-24 03:59:13'),(2334,685,4,1670,'2026-09-24 03:59:13','2026-09-24 03:59:13'),(2335,685,5,1660,'2026-09-24 03:59:13','2026-09-24 03:59:13'),(2336,685,6,1680,'2026-09-24 03:59:13','2026-09-24 03:59:13'),(2337,686,1,1950,'2026-09-25 03:39:58','2026-09-25 03:39:58'),(2338,686,2,1870,'2026-09-25 03:39:58','2026-09-25 03:39:58'),(2339,687,7,1510,'2026-09-25 03:43:20','2026-09-25 03:43:20'),(2340,687,8,1600,'2026-09-25 03:43:20','2026-09-25 03:43:20'),(2341,687,9,1630,'2026-09-25 03:43:20','2026-09-25 03:43:20'),(2342,687,10,1560,'2026-09-25 03:43:20','2026-09-25 03:43:20'),(2343,688,3,1530,'2026-09-25 03:48:39','2026-09-25 03:48:39'),(2344,688,4,1670,'2026-09-25 03:48:39','2026-09-25 03:48:39'),(2345,688,5,1560,'2026-09-25 03:48:39','2026-09-25 03:48:39'),(2346,688,6,1600,'2026-09-25 03:48:39','2026-09-25 03:48:39'),(2347,689,1,1950,'2026-09-25 03:51:37','2026-09-25 03:51:37'),(2348,689,2,1760,'2026-09-25 03:51:37','2026-09-25 03:51:37'),(2349,690,7,1640,'2026-09-26 04:09:12','2026-09-26 04:09:12'),(2350,690,8,1730,'2026-09-26 04:09:12','2026-09-26 04:09:12'),(2351,690,9,1710,'2026-09-26 04:09:12','2026-09-26 04:09:12'),(2352,690,10,1610,'2026-09-26 04:09:12','2026-09-26 04:09:12'),(2353,691,1,1990,'2026-09-26 04:10:53','2026-09-26 04:10:53'),(2354,691,2,1910,'2026-09-26 04:10:53','2026-09-26 04:10:53'),(2355,692,3,1720,'2026-09-26 04:14:55','2026-09-26 04:14:55'),(2356,692,4,1710,'2026-09-26 04:14:55','2026-09-26 04:14:55'),(2357,692,5,1700,'2026-09-26 04:14:55','2026-09-26 04:14:55'),(2358,692,6,1720,'2026-09-26 04:14:55','2026-09-26 04:14:55'),(2359,693,7,1640,'2026-09-27 03:25:00','2026-09-27 03:25:00'),(2360,693,8,1730,'2026-09-27 03:25:00','2026-09-27 03:25:00'),(2361,693,9,1700,'2026-09-27 03:25:00','2026-09-27 03:25:00'),(2362,693,10,1610,'2026-09-27 03:25:00','2026-09-27 03:25:00'),(2363,694,1,2010,'2026-09-27 03:27:01','2026-09-27 03:27:01'),(2364,694,2,1940,'2026-09-27 03:27:01','2026-09-27 03:27:01'),(2365,695,3,1720,'2026-09-27 03:30:15','2026-09-27 03:30:15'),(2366,695,4,1710,'2026-09-27 03:30:15','2026-09-27 03:30:15'),(2367,695,5,1700,'2026-09-27 03:30:15','2026-09-27 03:30:15'),(2368,695,6,1720,'2026-09-27 03:30:15','2026-09-27 03:30:15'),(2369,696,7,1540,'2026-09-28 03:32:03','2026-09-28 03:32:03'),(2370,696,8,1630,'2026-09-28 03:32:03','2026-09-28 03:32:03'),(2371,696,9,1600,'2026-09-28 03:32:03','2026-09-28 03:32:03'),(2372,696,10,1510,'2026-09-28 03:32:03','2026-09-28 03:32:03'),(2373,697,1,1870,'2026-09-28 03:34:56','2026-09-28 03:34:56'),(2374,697,2,1800,'2026-09-28 03:34:56','2026-09-28 03:34:56'),(2379,699,7,1530,'2026-09-29 03:42:21','2026-09-29 03:42:21'),(2380,699,8,1620,'2026-09-29 03:42:21','2026-09-29 03:42:21'),(2381,699,9,1680,'2026-09-29 03:42:21','2026-09-29 03:42:21'),(2382,699,10,1580,'2026-09-29 03:42:21','2026-09-29 03:42:21'),(2383,700,1,1960,'2026-09-29 03:43:54','2026-09-29 03:43:54'),(2384,700,2,1780,'2026-09-29 03:43:54','2026-09-29 03:43:54'),(2385,701,3,1680,'2026-09-29 03:47:30','2026-09-29 03:47:30'),(2386,701,4,1680,'2026-09-29 03:47:30','2026-09-29 03:47:30'),(2387,701,5,1590,'2026-09-29 03:47:30','2026-09-29 03:47:30'),(2388,701,6,1610,'2026-09-29 03:47:30','2026-09-29 03:47:30'),(2389,702,7,1380,'2026-09-30 03:56:40','2026-09-30 03:56:40'),(2390,702,8,1460,'2026-09-30 03:56:40','2026-09-30 03:56:40'),(2391,702,9,1450,'2026-09-30 03:56:40','2026-09-30 03:56:40'),(2392,702,10,1370,'2026-09-30 03:56:40','2026-09-30 03:56:40'),(2393,703,1,1660,'2026-09-30 03:59:56','2026-09-30 03:59:56'),(2394,703,2,1580,'2026-09-30 03:59:56','2026-09-30 03:59:56'),(2395,704,3,1300,'2026-09-30 04:04:23','2026-09-30 04:04:23'),(2396,704,4,1420,'2026-09-30 04:04:23','2026-09-30 04:04:23'),(2397,704,5,1430,'2026-09-30 04:04:23','2026-09-30 04:04:23'),(2398,704,6,1450,'2026-09-30 04:04:23','2026-09-30 04:04:23'),(2399,705,3,1690,'2026-10-01 03:48:09','2026-10-01 03:48:09'),(2400,705,4,1680,'2026-10-01 03:48:09','2026-10-01 03:48:09'),(2401,705,5,1690,'2026-10-01 03:48:09','2026-10-01 03:48:09'),(2402,705,6,1710,'2026-10-01 03:48:09','2026-10-01 03:48:09'),(2403,706,7,1620,'2026-10-01 03:50:31','2026-10-01 03:50:31'),(2404,706,8,1720,'2026-10-01 03:50:31','2026-10-01 03:50:31'),(2405,706,9,1710,'2026-10-01 03:50:31','2026-10-01 03:50:31'),(2406,706,10,1620,'2026-10-01 03:50:31','2026-10-01 03:50:31'),(2407,707,1,1960,'2026-10-01 03:52:31','2026-10-01 03:52:31'),(2408,707,2,1880,'2026-10-01 03:52:31','2026-10-01 03:52:31'),(2409,698,3,1610,'2026-10-01 04:36:59','2026-10-01 04:36:59'),(2410,698,4,1600,'2026-10-01 04:36:59','2026-10-01 04:36:59'),(2411,698,5,1600,'2026-10-01 04:36:59','2026-10-01 04:36:59'),(2412,698,6,1620,'2026-10-01 04:36:59','2026-10-01 04:36:59'),(2413,708,3,1530,'2026-10-01 04:42:47','2026-10-01 04:42:47'),(2414,708,4,1530,'2026-10-01 04:42:47','2026-10-01 04:42:47'),(2415,708,5,1510,'2026-10-01 04:42:47','2026-10-01 04:42:47'),(2416,708,6,1530,'2026-10-01 04:42:47','2026-10-01 04:42:47'),(2430,711,7,1636,'2026-10-02 09:54:07','2026-10-02 09:54:07'),(2431,711,8,1734.5,'2026-10-02 09:54:07','2026-10-02 09:54:07'),(2432,711,9,1711.3,'2026-10-02 09:54:07','2026-10-02 09:54:07'),(2433,711,10,1611.5,'2026-10-02 09:54:07','2026-10-02 09:54:07'),(2434,709,1,1990,'2026-10-02 10:24:02','2026-10-05 06:45:13'),(2435,709,2,1910,'2026-10-02 10:24:02','2026-10-05 06:45:13'),(2436,710,3,1703.2,'2026-10-02 10:28:57','2026-10-02 10:28:57'),(2437,710,4,1700,'2026-10-02 10:28:57','2026-10-05 06:43:30'),(2438,710,5,1700,'2026-10-02 10:28:57','2026-10-05 06:43:30'),(2439,710,6,1720,'2026-10-02 10:28:57','2026-10-05 06:43:30'),(2440,712,7,1680,'2026-10-03 03:13:39','2026-10-03 03:13:39'),(2441,712,8,1780,'2026-10-03 03:13:39','2026-10-03 03:13:39'),(2442,712,9,1750,'2026-10-03 03:13:39','2026-10-03 03:13:39'),(2443,712,10,1650,'2026-10-03 03:13:39','2026-10-03 03:13:39'),(2444,713,1,2040,'2026-10-03 03:17:48','2026-10-03 03:17:48'),(2445,713,2,1960,'2026-10-03 03:17:48','2026-10-03 03:17:48'),(2446,714,3,1760,'2026-10-03 03:21:48','2026-10-03 03:21:48'),(2447,714,4,1750,'2026-10-03 03:21:48','2026-10-03 03:21:48'),(2448,714,5,1740,'2026-10-03 03:21:48','2026-10-03 03:21:48'),(2449,714,6,1760,'2026-10-03 03:21:48','2026-10-03 03:21:48'),(2450,715,7,1580,'2026-10-04 07:53:10','2026-10-05 06:50:04'),(2451,715,8,1660,'2026-10-04 07:53:10','2026-10-05 06:50:04'),(2452,715,9,1640,'2026-10-04 07:53:10','2026-10-05 06:50:04'),(2453,715,10,1550,'2026-10-04 07:53:10','2026-10-05 06:50:04'),(2454,716,3,1650,'2026-10-04 07:53:21','2026-10-05 06:52:59'),(2455,716,4,1640,'2026-10-04 07:53:21','2026-10-05 06:52:59'),(2456,716,5,1640,'2026-10-04 07:53:21','2026-10-05 06:52:59'),(2457,716,6,1660,'2026-10-04 07:53:21','2026-10-05 06:52:59'),(2458,717,3,1714,'2026-10-04 07:53:33','2026-10-05 03:56:30'),(2459,717,4,1710,'2026-10-04 07:53:33','2026-10-05 06:51:37'),(2460,717,5,1710,'2026-10-04 07:53:33','2026-10-05 06:51:37'),(2461,717,6,1720,'2026-10-04 07:53:33','2026-10-05 06:51:37'),(2462,718,7,1630,'2026-10-04 07:53:41','2026-10-05 06:48:40'),(2463,718,8,1730,'2026-10-04 07:53:41','2026-10-05 06:48:40'),(2464,718,9,1700,'2026-10-04 07:53:41','2026-10-05 06:48:40'),(2465,718,10,1600,'2026-10-04 07:53:41','2026-10-05 06:48:40'),(2466,719,1,1990,'2026-10-04 07:53:50','2026-10-05 06:54:23'),(2467,719,2,1910,'2026-10-04 07:53:50','2026-10-05 06:54:23'),(2468,720,1,1920,'2026-10-05 03:13:27','2026-10-05 06:08:52'),(2469,720,2,1840,'2026-10-05 03:13:27','2026-10-05 06:08:52'),(2470,721,1,2000,'2026-10-06 03:39:33','2026-10-06 03:44:20'),(2471,721,2,1920,'2026-10-06 03:39:33','2026-10-06 03:44:20'),(2472,722,3,1720,'2026-10-06 03:49:43','2026-10-06 03:49:43'),(2473,722,4,1720,'2026-10-06 03:49:43','2026-10-06 03:49:43'),(2474,722,5,1720,'2026-10-06 03:49:43','2026-10-06 03:49:43'),(2475,722,6,1740,'2026-10-06 03:49:43','2026-10-06 03:49:43'),(2476,723,7,1650,'2026-10-06 03:52:09','2026-10-06 03:52:09'),(2477,723,8,1750,'2026-10-06 03:52:09','2026-10-06 03:52:09'),(2478,723,9,1720,'2026-10-06 03:52:09','2026-10-06 03:52:09'),(2479,723,10,1610,'2026-10-06 03:52:09','2026-10-06 03:52:09'),(2480,724,7,1595.2,'2026-10-06 15:25:32','2026-10-06 15:25:32'),(2481,724,8,1689,'2026-10-06 15:25:32','2026-10-06 15:25:32'),(2482,724,9,1670.3,'2026-10-06 15:25:32','2026-10-06 15:25:32'),(2483,724,10,1571.7,'2026-10-06 15:25:32','2026-10-06 15:25:32'),(2484,725,3,1661.9,'2026-10-06 15:26:20','2026-10-07 03:43:08'),(2485,725,4,1653.3,'2026-10-06 15:26:20','2026-10-06 15:26:20'),(2486,725,5,1653,'2026-10-06 15:26:20','2026-10-06 15:26:20'),(2487,725,6,1672.9,'2026-10-06 15:26:20','2026-10-06 15:26:20'),(2488,726,1,1927.1,'2026-10-06 15:26:54','2026-10-06 15:26:54'),(2489,726,2,1853.7,'2026-10-06 15:26:54','2026-10-06 15:26:54'),(2490,727,7,1520,'2026-10-08 03:06:16','2026-10-08 03:10:06'),(2491,727,8,1610,'2026-10-08 03:06:16','2026-10-08 03:10:06'),(2492,727,9,1590,'2026-10-08 03:06:17','2026-10-08 03:10:06'),(2493,727,10,1500,'2026-10-08 03:06:17','2026-10-08 03:10:06'),(2494,728,3,1570,'2026-10-08 03:12:36','2026-10-08 03:12:53'),(2495,728,4,1570,'2026-10-08 03:12:36','2026-10-08 03:12:36'),(2496,728,5,1570,'2026-10-08 03:12:36','2026-10-08 03:12:36'),(2497,728,6,1590,'2026-10-08 03:12:36','2026-10-08 03:12:36'),(2498,729,1,1840,'2026-10-08 03:14:54','2026-10-08 03:14:54'),(2499,729,2,1770,'2026-10-08 03:14:54','2026-10-08 03:14:54'),(2500,730,7,1509.1,'2026-10-08 14:54:27','2026-10-08 14:54:27'),(2501,730,8,1599.7,'2026-10-08 14:54:27','2026-10-08 14:54:27'),(2502,730,9,1585,'2026-10-08 14:54:27','2026-10-08 14:54:27'),(2503,730,10,1493.7,'2026-10-08 14:54:27','2026-10-08 14:54:27'),(2504,731,3,1570,'2026-10-08 14:54:59','2026-10-09 09:49:00'),(2505,731,4,1570.3,'2026-10-08 14:54:59','2026-10-08 14:54:59'),(2506,731,5,1565.3,'2026-10-08 14:54:59','2026-10-08 14:54:59'),(2507,731,6,1583.1,'2026-10-08 14:54:59','2026-10-08 14:54:59'),(2508,732,1,1836.4,'2026-10-08 14:55:30','2026-10-08 14:55:30'),(2509,732,2,1760.8,'2026-10-08 14:55:30','2026-10-08 14:55:30'),(2510,733,7,706.9,'2026-10-10 03:02:52','2026-10-10 07:42:13'),(2511,733,8,744.9,'2026-10-10 03:02:52','2026-10-10 07:42:13'),(2512,733,9,725,'2026-10-10 03:02:52','2026-10-10 07:42:13'),(2513,733,10,676.6,'2026-10-10 03:02:52','2026-10-10 07:42:13'),(2514,734,3,292,'2026-10-10 07:45:37','2026-10-10 07:47:35'),(2515,734,4,745,'2026-10-10 07:45:37','2026-10-10 07:47:35'),(2516,734,5,736.2,'2026-10-10 07:45:37','2026-10-10 07:47:35'),(2517,734,6,747.5,'2026-10-10 07:45:37','2026-10-10 07:47:35'),(2518,735,1,865.1,'2026-10-10 07:50:02','2026-10-10 07:50:02'),(2519,735,2,832.1,'2026-10-10 07:50:02','2026-10-10 07:50:02'),(2572,749,7,1640,'2026-10-11 07:40:43','2026-10-11 11:07:43'),(2573,749,8,1740,'2026-10-11 07:40:43','2026-10-11 11:07:43'),(2574,749,9,1710,'2026-10-11 07:40:43','2026-10-11 11:07:43'),(2575,749,10,1610,'2026-10-11 07:40:43','2026-10-11 11:07:43'),(2576,750,3,1700,'2026-10-11 11:10:28','2026-10-11 11:10:28'),(2577,750,4,1710,'2026-10-11 11:10:28','2026-10-11 11:10:28'),(2578,750,5,1710,'2026-10-11 11:10:28','2026-10-11 11:10:28'),(2579,750,6,1730,'2026-10-11 11:10:28','2026-10-11 11:10:28'),(2580,751,1,1990,'2026-10-11 11:12:06','2026-10-11 11:12:06'),(2581,751,2,1910,'2026-10-11 11:12:06','2026-10-11 11:12:06'),(2582,752,7,1597.6,'2026-10-11 13:28:59','2026-10-11 13:28:59'),(2583,752,8,1691.6,'2026-10-11 13:28:59','2026-10-11 13:28:59'),(2584,752,9,1668.9,'2026-10-11 13:28:59','2026-10-11 13:28:59'),(2585,752,10,1565.9,'2026-10-11 13:28:59','2026-10-11 13:28:59'),(2586,753,3,1666,'2026-10-11 13:29:57','2026-10-11 13:29:57'),(2587,753,4,1658.2,'2026-10-11 13:29:57','2026-10-11 13:29:57'),(2588,753,5,1654.3,'2026-10-11 13:29:57','2026-10-11 13:29:57'),(2589,753,6,1678.1,'2026-10-11 13:29:57','2026-10-11 13:29:57'),(2590,754,1,1922.5,'2026-10-11 13:30:55','2026-10-11 13:30:55'),(2591,754,2,1845,'2026-10-11 13:30:55','2026-10-11 13:30:55'),(2592,755,7,1610,'2026-10-13 03:04:45','2026-10-13 03:04:45'),(2593,755,8,1690,'2026-10-13 03:04:45','2026-10-13 03:04:45'),(2594,755,9,1680,'2026-10-13 03:04:45','2026-10-13 03:04:45'),(2595,755,10,1590,'2026-10-13 03:04:45','2026-10-13 03:04:45'),(2596,756,3,1680,'2026-10-13 03:06:33','2026-10-13 03:06:33'),(2597,756,4,1670,'2026-10-13 03:06:33','2026-10-13 03:06:33'),(2598,756,5,1670,'2026-10-13 03:06:33','2026-10-13 03:06:33'),(2599,756,6,1690,'2026-10-13 03:06:33','2026-10-13 03:06:33'),(2600,757,1,1950,'2026-10-13 03:08:45','2026-10-13 03:08:45'),(2601,757,2,1870,'2026-10-13 03:08:45','2026-10-13 03:08:45'),(2602,758,1,1970.1,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2603,758,2,1887.1,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2604,759,3,1705.7,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2605,759,4,1696.5,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2606,759,5,1681.5,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2607,759,6,1699.1,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2608,760,7,1616.3,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2609,760,8,1712.2,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2610,760,9,1691.9,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2611,760,10,1592.7,'2026-10-13 14:35:04','2026-10-13 14:35:04'),(2612,761,1,1791.8,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2613,761,2,1714.5,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2614,762,3,1554.7,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2615,762,4,1543.4,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2616,762,5,1542.6,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2617,762,6,1561.6,'2026-10-14 14:35:03','2026-10-14 14:35:03'),(2618,763,7,1482.1,'2026-10-14 14:35:04','2026-10-14 14:35:04'),(2619,763,8,1562.3,'2026-10-14 14:35:04','2026-10-14 14:35:04'),(2620,763,9,1545.5,'2026-10-14 14:35:04','2026-10-14 14:35:04'),(2621,763,10,1455.1,'2026-10-14 14:35:04','2026-10-14 14:35:04'),(2622,764,1,1769.7,'2026-10-15 13:10:09','2026-10-15 13:10:09'),(2623,764,2,1705.8,'2026-10-15 13:10:09','2026-10-15 13:10:09'),(2624,765,3,1532.7,'2026-10-15 13:10:53','2026-10-15 13:10:53'),(2625,765,4,1522.7,'2026-10-15 13:10:53','2026-10-15 13:10:53'),(2626,765,5,1521.6,'2026-10-15 13:10:53','2026-10-15 13:10:53'),(2627,765,6,1540.7,'2026-10-15 13:10:53','2026-10-15 13:10:53'),(2628,766,7,1463,'2026-10-15 13:11:28','2026-10-15 13:11:28'),(2629,766,8,1547.1,'2026-10-15 13:11:28','2026-10-15 13:11:28'),(2630,766,9,1538.2,'2026-10-15 13:11:28','2026-10-15 13:11:28'),(2631,766,10,1451.6,'2026-10-15 13:11:28','2026-10-15 13:11:28'),(2632,767,1,1845.5,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2633,767,2,1767.1,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2634,768,3,1584.1,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2635,768,4,1573.1,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2636,768,5,1571,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2637,768,6,1591.2,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(2638,769,7,1510.7,'2026-10-16 14:35:03','2026-10-16 14:35:03'),(2639,769,8,1596.4,'2026-10-16 14:35:03','2026-10-16 14:35:03'),(2640,769,9,1584.6,'2026-10-16 14:35:03','2026-10-16 14:35:03'),(2641,769,10,1492.3,'2026-10-16 14:35:03','2026-10-16 14:35:03');
/*!40000 ALTER TABLE `daily_inverter_outputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_readings`
--

DROP TABLE IF EXISTS `daily_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_readings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `reading_date` date NOT NULL,
  `plant_import_reading` double DEFAULT NULL,
  `plant_import_unit` double DEFAULT NULL,
  `plant_export_reading` double DEFAULT NULL,
  `plant_export_unit` double DEFAULT NULL,
  `sub_import_reading` double DEFAULT NULL,
  `sub_import_unit` double DEFAULT NULL,
  `sub_export_reading` double DEFAULT NULL,
  `sub_export_unit` double DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_readings_company_id_reading_date_unique` (`company_id`,`reading_date`),
  KEY `daily_readings_created_by_foreign` (`created_by`),
  KEY `daily_readings_updated_by_foreign` (`updated_by`),
  CONSTRAINT `daily_readings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_readings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `daily_readings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_readings`
--

LOCK TABLES `daily_readings` WRITE;
/*!40000 ALTER TABLE `daily_readings` DISABLE KEYS */;
INSERT INTO `daily_readings` VALUES (523,3,'2026-08-01',3.26,NULL,134.08,NULL,135.94,NULL,1.32,NULL,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(524,3,'2026-08-02',3.28,20,135.75,1670,137.79,9250,1.34,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(525,3,'2026-08-03',3.3,20,139.03,3280,141.58,18950,1.36,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(526,3,'2026-08-04',3.31,10,142.64,3610,145.46,19400,1.37,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(527,3,'2026-08-05',3.33,20,143.17,530,147.19,8650,1.39,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(528,3,'2026-08-06',3.35,20,148.14,4970,151.92,23650,1.4,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(529,3,'2026-08-07',3.36,10,151.6,3460,155.17,16250,1.42,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(530,3,'2026-08-08',3.38,20,155.36,3760,158.74,17850,1.44,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(531,3,'2026-08-09',3.39,10,159.61,4250,162.6,19300,1.46,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(532,3,'2026-08-10',3.41,20,161.9,2290,164.64,10200,1.47,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(533,3,'2026-08-11',3.42,10,164.37,2470,166.71,10350,1.48,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(534,3,'2026-08-12',3.44,20,167.07,2700,169.02,11550,1.5,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(535,3,'2026-08-13',3.45,10,169.6,2530,171.12,10500,1.51,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(536,3,'2026-08-14',3.48,30,172.71,3110,174.04,14600,1.53,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(537,3,'2026-08-15',3.49,10,176.47,3760,177.43,16950,1.55,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(538,3,'2026-08-16',3.51,20,179.03,2560,179.49,10300,1.56,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(539,3,'2026-08-17',3.53,20,182.52,3490,182.37,14400,1.58,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(540,3,'2026-08-18',3.55,20,186.94,4420,186.35,19900,1.59,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(541,3,'2026-08-19',3.57,20,190.23,3290,189.42,15350,1.61,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(542,3,'2026-08-20',3.59,20,194.19,3960,192.81,16950,1.62,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(543,3,'2026-08-21',3.61,20,197.66,3470,195.88,15350,1.64,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(544,3,'2026-08-22',3.63,20,202.35,4690,200.06,20900,1.64,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(545,3,'2026-08-23',3.64,10,206.25,3900,203.5,17200,1.66,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(546,3,'2026-08-24',3.66,20,208.89,2640,205.69,10950,1.68,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(547,3,'2026-08-25',3.68,20,213.9,5010,210.02,21650,1.7,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(548,3,'2026-08-26',3.7,20,217.89,3990,213.7,18400,1.71,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(549,3,'2026-08-27',3.72,20,222.45,4560,217.95,21250,1.73,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(550,3,'2026-08-28',3.74,20,227.35,4900,222.33,21900,1.75,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(551,3,'2026-08-29',3.76,20,231.33,3980,225.72,16950,1.77,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(552,3,'2026-08-30',3.78,20,236,4670,229.7,19900,1.77,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(553,3,'2026-08-31',3.8,20,241.08,5080,234.01,21550,1.79,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(554,3,'2026-09-01',3.82,20,246.9,5820,239.29,26400,1.81,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(555,3,'2026-09-02',3.84,20,252.33,5430,243.95,23300,1.83,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(556,3,'2026-09-03',3.86,20,257.36,5030,246.27,11600,1.85,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(557,3,'2026-09-04',3.89,30,262.74,5380,252.89,33100,1.87,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(558,3,'2026-09-05',3.91,20,267.61,4870,257.11,21100,1.89,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(559,3,'2026-09-06',3.93,20,272.35,4740,261.12,20050,1.9,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(560,3,'2026-09-07',3.95,20,276.47,4120,264.56,17200,1.91,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(561,3,'2026-09-08',3.97,20,282.5,6030,269.84,26400,1.93,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(562,3,'2026-09-09',3.99,20,288.33,5830,274.75,24550,1.95,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(563,3,'2026-09-10',4.02,30,294.54,6210,280.16,27050,1.97,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(564,3,'2026-09-11',4.03,10,301.14,6600,286,29200,1.98,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(565,3,'2026-09-12',4.06,30,303.13,1990,287.64,8200,2,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(566,3,'2026-09-13',4.08,20,305.53,2400,289.63,9950,2.02,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(567,3,'2026-09-14',4.1,20,306.92,1390,290.8,5850,2.04,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(568,3,'2026-09-15',4.13,30,311.11,4190,294.38,17900,2.06,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(569,3,'2026-09-16',4.14,10,315.91,4800,299.04,23300,2.08,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(570,1,'2026-08-01',3,NULL,167.19,NULL,135.94,NULL,1.32,NULL,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(571,1,'2026-08-02',3.02,12,169.31,1272,137.79,9250,1.34,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(572,1,'2026-08-03',3.04,12,173.82,2706,141.58,18950,1.36,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(573,1,'2026-08-04',3.06,12,178.41,2754,145.46,19400,1.37,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(574,1,'2026-08-05',3.08,12,180.76,1410,147.19,8650,1.39,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(575,1,'2026-08-06',3.09,6,185.8,3024,151.92,23650,1.4,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(576,1,'2026-08-07',3.11,12,189.65,2310,155.17,16250,1.42,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(577,1,'2026-08-08',3.13,12,194.1,2670,158.74,17850,1.44,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(578,1,'2026-08-09',3.15,12,198.28,2508,162.6,19300,1.46,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(579,1,'2026-08-10',3.17,12,200.47,1314,164.64,10200,1.47,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(580,1,'2026-08-11',3.19,12,202.86,1434,166.71,10350,1.48,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(581,1,'2026-08-12',3.21,12,205.45,1554,169.02,11550,1.5,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(582,1,'2026-08-13',3.23,12,207.87,1452,171.12,10500,1.51,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(583,1,'2026-08-14',3.25,12,210.83,1776,174.04,14600,1.53,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(584,1,'2026-08-15',3.25,0,214.53,2220,177.43,16950,1.55,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(585,1,'2026-08-16',3.25,0,216.96,1458,179.49,10300,1.56,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(586,1,'2026-08-17',3.26,6,220.27,1986,182.37,14400,1.58,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(587,1,'2026-08-18',3.26,0,224.84,2742,186.35,19900,1.59,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(588,1,'2026-08-19',3.26,0,228.27,2058,189.42,15350,1.61,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(589,1,'2026-08-20',3.27,6,232.07,2280,192.81,16950,1.62,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(590,1,'2026-08-21',3.27,0,235.34,1962,195.88,15350,1.64,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(591,1,'2026-08-22',3.27,0,239.83,2694,200.06,20900,1.64,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(592,1,'2026-08-23',3.27,0,243.55,2232,203.5,17200,1.66,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(593,1,'2026-08-24',3.29,12,245.87,1392,205.69,10950,1.68,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(594,1,'2026-08-25',3.31,12,250.6,2838,210.02,21650,1.7,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(595,1,'2026-08-26',3.33,12,254.54,2364,213.7,18400,1.71,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(596,1,'2026-08-27',3.35,12,259.13,2754,217.95,21250,1.73,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(597,1,'2026-08-28',3.37,12,263.87,2844,222.33,21900,1.75,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(598,1,'2026-08-29',3.37,0,267.52,2190,225.72,16950,1.77,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(599,1,'2026-08-30',3.39,12,272.03,2706,229.7,19900,1.77,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(600,1,'2026-08-31',3.42,18,276.89,2916,234.01,21550,1.79,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(601,1,'2026-09-01',3.44,12,282.53,3384,239.29,26400,1.81,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(602,1,'2026-09-02',3.46,12,287.81,3168,243.95,23300,1.83,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(603,1,'2026-09-03',3.49,18,292.68,2922,246.27,11600,1.85,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(604,1,'2026-09-04',3.51,12,297.88,3120,252.89,33100,1.87,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(605,1,'2026-09-05',3.53,12,302.6,2832,257.11,21100,1.89,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(606,1,'2026-09-06',3.56,18,307.15,2730,261.12,20050,1.9,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(607,1,'2026-09-07',3.58,12,311.13,2388,264.56,17200,1.91,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(608,1,'2026-09-08',3.6,12,316.96,3498,269.84,26400,1.93,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(609,1,'2026-09-09',3.63,18,322.66,3420,274.75,24550,1.95,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(610,1,'2026-09-10',3.65,12,328.69,3618,280.16,27050,1.97,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(611,1,'2026-09-11',3.68,18,335.1,3846,286,29200,1.98,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(612,1,'2026-09-12',3.7,12,337.03,1158,287.64,8200,2,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(613,1,'2026-09-13',3.73,18,339.37,1404,289.63,9950,2.02,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(614,1,'2026-09-14',3.75,12,340.71,804,290.8,5850,2.04,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(615,1,'2026-09-15',3.77,12,344.74,2418,294.38,17900,2.06,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(616,1,'2026-09-16',3.8,18,349.17,2658,299.04,23300,2.08,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(617,2,'2026-08-01',3.38,NULL,181.25,NULL,135.94,NULL,1.32,NULL,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(618,2,'2026-08-02',3.4,20,183.5,2250,137.79,9250,1.34,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(619,2,'2026-08-03',3.42,20,188.27,4770,141.58,18950,1.36,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(620,2,'2026-08-04',3.45,30,193.12,4850,145.46,19400,1.37,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(621,2,'2026-08-05',3.47,20,195.6,2480,147.19,8650,1.39,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(622,2,'2026-08-06',3.49,20,200.92,5320,151.92,23650,1.4,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(623,2,'2026-08-07',3.51,20,204.31,3390,155.17,16250,1.42,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(624,2,'2026-08-08',3.53,20,208.45,4140,158.74,17850,1.44,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(625,2,'2026-08-09',3.56,30,212.48,4030,162.6,19300,1.46,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(626,2,'2026-08-10',3.58,20,214.79,2310,164.64,10200,1.47,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(627,2,'2026-08-11',3.6,20,217.32,2530,166.71,10350,1.48,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(628,2,'2026-08-12',3.63,30,220.05,2730,169.02,11550,1.5,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(629,2,'2026-08-13',3.65,20,222.63,2580,171.12,10500,1.51,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(630,2,'2026-08-14',3.67,20,226.12,3490,174.04,14600,1.53,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(631,2,'2026-08-15',3.7,30,230.01,3890,177.43,16950,1.55,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(632,2,'2026-08-16',3.72,20,232.62,2610,179.49,10300,1.56,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(633,2,'2026-08-17',3.74,20,236.18,3560,182.37,14400,1.58,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(634,2,'2026-08-18',3.77,30,240.86,4680,186.35,19900,1.59,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(635,2,'2026-08-19',3.79,20,244.49,3630,189.42,15350,1.61,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(636,2,'2026-08-20',3.81,20,248.53,4040,192.81,16950,1.62,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(637,2,'2026-08-21',3.83,20,252.04,3510,195.88,15350,1.64,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(638,2,'2026-08-22',3.86,30,256.82,4780,200.06,20900,1.64,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(639,2,'2026-08-23',3.88,20,260.78,3960,203.5,17200,1.66,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(640,2,'2026-08-24',3.9,20,263.46,2680,205.69,10950,1.68,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(641,2,'2026-08-25',3.93,30,264.47,1010,210.02,21650,1.7,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(642,2,'2026-08-26',3.95,20,272.63,8160,213.7,18400,1.71,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(643,2,'2026-08-27',3.98,30,277.48,4850,217.95,21250,1.73,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(644,2,'2026-08-28',4,20,282.49,5010,222.33,21900,1.75,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(645,2,'2026-08-29',4.02,20,286.54,4050,225.72,16950,1.77,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(646,2,'2026-08-30',4.05,30,291.29,4750,229.7,19900,1.77,0,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(647,2,'2026-08-31',4.07,20,296.48,5190,234.01,21550,1.79,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(648,2,'2026-09-01',4.09,20,302.43,5950,239.29,26400,1.81,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(649,2,'2026-09-02',4.12,30,307.99,5560,243.95,23300,1.83,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(650,2,'2026-09-03',4.14,20,313.13,5140,246.27,11600,1.85,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(651,2,'2026-09-04',4.16,20,318.63,5500,252.89,33100,1.87,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(652,2,'2026-09-05',4.19,30,323.59,4960,257.11,21100,1.89,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(653,2,'2026-09-06',4.21,20,328.41,4820,261.12,20050,1.9,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(654,2,'2026-09-07',4.23,20,332.54,4130,264.56,17200,1.91,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(655,2,'2026-09-08',4.25,20,338.7,6160,269.84,26400,1.93,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(656,2,'2026-09-09',4.28,30,344.69,5990,274.75,24550,1.95,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(657,2,'2026-09-10',4.3,20,351.05,6360,280.16,27050,1.97,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(658,2,'2026-09-11',4.32,20,357.81,6760,286,29200,1.98,50,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(659,2,'2026-09-12',4.35,30,359.84,2030,287.64,8200,2,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(660,2,'2026-09-13',4.37,20,362.32,2480,289.63,9950,2.02,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(661,2,'2026-09-14',4.4,30,363.73,1410,290.8,5850,2.04,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(662,2,'2026-09-15',4.42,20,368.02,4290,294.38,17900,2.06,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(663,2,'2026-09-16',4.44,20,372.93,4910,299.04,23300,2.08,100,4,4,'2026-09-22 02:50:26','2026-09-22 02:50:26'),(664,3,'2026-09-17',4.17,30,320.18,4270,302.92,19400,2.09,50,4,4,'2026-09-22 09:13:43','2026-09-22 09:13:43'),(665,3,'2026-09-18',4.19,20,324.11,3930,306.43,17550,2.11,100,7,7,'2026-09-22 09:20:24','2026-09-22 09:20:24'),(666,3,'2026-09-19',4.21,20,328.9,4790,310.76,21650,2.13,100,7,7,'2026-09-22 09:21:58','2026-09-22 09:21:58'),(667,3,'2026-09-20',4.23,20,332.22,3320,313.63,14350,2.15,100,7,7,'2026-09-22 09:23:18','2026-09-22 09:23:18'),(668,1,'2026-09-17',3.82,12,353.99,2892,302.92,19400,2.09,50,7,7,'2026-09-22 09:26:28','2026-09-22 09:26:28'),(669,1,'2026-09-18',3.85,18,357.21,1932,306.43,17550,2.11,100,7,7,'2026-09-22 09:27:18','2026-09-22 09:27:18'),(670,1,'2026-09-19',3.87,12,361.81,2760,310.76,21650,2.13,100,7,7,'2026-09-22 09:28:26','2026-09-22 09:28:26'),(671,1,'2026-09-20',3.9,18,364.99,1908,313.63,14350,2.15,100,7,7,'2026-09-22 09:29:15','2026-09-22 09:29:15'),(672,2,'2026-09-17',4.47,30,377.18,4250,302.92,19400,2.09,50,7,7,'2026-09-22 09:31:37','2026-09-22 09:31:38'),(673,2,'2026-09-18',4.49,20,381.22,4040,306.43,17550,2.11,100,7,7,'2026-09-22 09:32:50','2026-09-22 09:32:50'),(674,2,'2026-09-19',4.51,20,386.1,4880,310.76,21650,2.13,100,7,7,'2026-09-22 09:34:08','2026-09-22 09:34:08'),(675,2,'2026-09-20',4.54,30,389.48,3380,313.63,14350,2.15,100,7,7,'2026-09-22 09:35:10','2026-09-22 09:35:10'),(676,1,'2026-09-21',3.92,12,370.75,3456,318.94,26550,2.17,100,7,7,'2026-09-22 09:38:31','2026-09-22 09:38:31'),(680,3,'2026-09-21',4.25,20,338.15,5930,318.94,26550,2.17,100,4,4,'2026-09-22 09:55:52','2026-09-22 09:55:52'),(681,3,'2026-09-22',4.27,20,343.15,5000,323.31,21850,2.18,50,7,7,'2026-09-23 03:05:16','2026-09-23 03:05:16'),(682,1,'2026-09-22',3.94,12,375.55,2880,323.31,21850,2.18,50,7,7,'2026-09-23 03:07:33','2026-09-23 03:07:33'),(683,2,'2026-09-22',4.59,30,400.63,5100,323.31,21850,2.18,50,7,7,'2026-09-23 03:12:31','2026-10-01 04:42:47'),(684,3,'2026-09-23',4.3,30,349.66,6510,329.1,28950,2.2,100,7,7,'2026-09-24 03:52:05','2026-09-24 03:52:05'),(685,2,'2026-09-23',4.61,20,407.26,6630,329.1,28950,2.2,100,7,7,'2026-09-24 03:59:13','2026-09-24 03:59:13'),(686,1,'2026-09-23',3.97,18,381.85,3780,329.1,28950,2.2,100,7,7,'2026-09-25 03:39:58','2026-09-25 03:39:58'),(687,3,'2026-09-24',4.31,10,355.89,6230,334.86,28800,2.22,100,7,7,'2026-09-25 03:43:20','2026-09-25 03:43:20'),(688,2,'2026-09-24',4.63,20,413.58,6320,334.86,28800,2.22,100,7,7,'2026-09-25 03:48:39','2026-09-25 03:48:39'),(689,1,'2026-09-24',3.99,12,387.97,3672,334.86,28800,2.22,100,7,7,'2026-09-25 03:51:37','2026-09-25 03:51:37'),(690,3,'2026-09-25',4.34,30,362.52,6630,340.87,30050,2.24,100,7,7,'2026-09-26 04:09:12','2026-09-26 04:09:12'),(691,1,'2026-09-25',4.01,12,394.41,3864,340.87,30050,2.24,100,7,7,'2026-09-26 04:10:53','2026-09-26 04:10:53'),(692,2,'2026-09-25',4.65,20,420.38,6800,340.87,30050,2.24,100,7,7,'2026-09-26 04:14:55','2026-09-26 04:14:55'),(693,3,'2026-09-26',4.36,20,369.12,6600,346.75,29400,2.26,100,7,7,'2026-09-27 03:25:00','2026-09-27 03:25:00'),(694,1,'2026-09-26',4.04,18,400.91,3900,346.75,29400,2.26,100,7,7,'2026-09-27 03:27:01','2026-09-27 03:27:01'),(695,2,'2026-09-26',4.68,30,427.19,6810,346.75,29400,2.26,100,7,7,'2026-09-27 03:30:15','2026-09-27 03:30:15'),(696,3,'2026-09-27',4.38,20,375.34,6220,352.49,28700,2.28,100,7,7,'2026-09-28 03:32:03','2026-09-28 03:32:03'),(697,1,'2026-09-27',4.06,12,406.98,3642,352.49,28700,2.28,100,7,7,'2026-09-28 03:34:56','2026-09-28 03:34:56'),(698,2,'2026-09-27',4.7,20,433.58,6390,352.49,28700,2.28,100,7,4,'2026-09-28 03:38:49','2026-10-01 04:36:59'),(699,3,'2026-09-28',4.4,20,381.69,6350,358.3,29050,2.3,100,7,7,'2026-09-29 03:42:21','2026-09-29 03:42:21'),(700,1,'2026-09-28',4.09,18,413.16,3708,358.3,29050,2.3,100,7,7,'2026-09-29 03:43:54','2026-09-29 03:43:54'),(701,2,'2026-09-28',4.73,30,440.08,6500,358.3,29050,2.3,100,7,7,'2026-09-29 03:47:30','2026-10-01 04:36:59'),(702,3,'2026-09-29',4.42,20,387.28,5590,363.4,25500,2.31,50,7,7,'2026-09-30 03:56:40','2026-09-30 03:56:40'),(703,1,'2026-09-29',4.11,12,418.51,3210,363.4,25500,2.31,50,7,7,'2026-09-30 03:59:56','2026-09-30 03:59:56'),(704,2,'2026-09-29',4.75,20,445.66,5580,363.4,25500,2.31,50,7,7,'2026-09-30 04:04:23','2026-09-30 04:04:23'),(705,2,'2026-09-30',4.78,30,452.37,6710,369.19,28950,2.33,100,7,7,'2026-10-01 03:48:09','2026-10-01 03:48:09'),(706,3,'2026-09-30',4.44,20,393.86,6580,369.19,28950,2.33,100,7,7,'2026-10-01 03:50:31','2026-10-01 03:50:31'),(707,1,'2026-09-30',4.13,12,424.85,3804,369.19,28950,2.33,100,7,7,'2026-10-01 03:52:31','2026-10-01 03:52:31'),(708,2,'2026-09-21',4.56,20,395.53,6050,318.94,26550,2.17,100,4,4,'2026-10-01 04:42:47','2026-10-01 04:42:47'),(709,1,'2026-10-01',4.15,12,431.27,3852,375.05,29300,2.35,100,4,7,'2026-10-01 15:40:13','2026-10-02 10:24:02'),(710,2,'2026-10-01',4.8,20,459.13,6760,375.05,29300,2.35,100,4,7,'2026-10-01 15:40:14','2026-10-02 10:28:58'),(711,3,'2026-10-01',4.46,20,400.48,6620,375.05,29300,2.35,100,4,7,'2026-10-01 15:40:14','2026-10-02 09:53:17'),(712,3,'2026-10-02',4.49,30,407.26,6780,381.07,30100,2.37,100,7,7,'2026-10-03 03:13:39','2026-10-03 03:13:39'),(713,1,'2026-10-02',4.18,18,437.88,3966,381.07,30100,2.37,100,7,7,'2026-10-03 03:17:48','2026-10-03 03:17:48'),(714,2,'2026-10-02',4.83,30,466.08,6950,381.07,30100,2.37,100,7,7,'2026-10-03 03:21:48','2026-10-03 03:21:48'),(715,3,'2026-10-04',4.53,20,420.18,6350,392.49,27750,2.41,100,4,7,'2026-10-04 07:53:10','2026-10-05 06:07:14'),(716,2,'2026-10-04',4.87,20,479.42,6550,392.49,27750,2.41,100,4,7,'2026-10-04 07:53:21','2026-10-05 06:07:08'),(717,2,'2026-10-03',4.85,20,472.87,6790,386.94,29350,2.39,100,4,7,'2026-10-04 07:53:33','2026-10-05 03:09:52'),(718,3,'2026-10-03',4.51,20,413.83,6570,386.94,29350,2.39,100,4,7,'2026-10-04 07:53:41','2026-10-05 03:08:43'),(719,1,'2026-10-03',4.21,18,444.31,3858,386.94,29350,2.39,100,4,7,'2026-10-04 07:53:50','2026-10-05 03:11:10'),(720,1,'2026-10-04',4.23,12,450.51,3720,392.49,27750,2.41,100,7,7,'2026-10-05 03:13:27','2026-10-05 06:07:20'),(721,1,'2026-10-05',4.26,18,456.98,3882,398.5,30050,2.42,50,7,7,'2026-10-06 03:39:33','2026-10-06 03:44:20'),(722,2,'2026-10-05',4.9,30,486.27,6850,398.5,30050,2.42,50,7,7,'2026-10-06 03:49:43','2026-10-06 03:49:43'),(723,3,'2026-10-05',4.56,30,426.84,6660,398.5,30050,2.42,50,7,7,'2026-10-06 03:52:09','2026-10-06 03:52:09'),(724,3,'2026-10-06',4.58,20,433.29,6450,404.18,28400,2.45,150,4,7,'2026-10-06 15:25:32','2026-10-07 03:41:50'),(725,2,'2026-10-06',4.93,30,492.35,6080,404.18,28400,2.45,150,4,7,'2026-10-06 15:26:20','2026-10-07 03:43:08'),(726,1,'2026-10-06',4.28,12,463.23,3750,404.18,28400,2.45,150,4,7,'2026-10-06 15:26:54','2026-10-07 03:43:38'),(727,3,'2026-10-07',4.61,30,439.43,6140,409.59,27050,2.47,100,7,7,'2026-10-08 03:06:16','2026-10-08 03:10:06'),(728,2,'2026-10-07',4.95,20,499.12,6770,409.59,27050,2.47,100,7,7,'2026-10-08 03:12:36','2026-10-08 03:12:36'),(729,1,'2026-10-07',4.31,18,469.19,3576,409.59,27050,2.47,100,7,7,'2026-10-08 03:14:54','2026-10-08 03:14:54'),(730,3,'2026-10-08',4.63,20,445.53,6100,414.9,26550,2.49,100,4,7,'2026-10-08 14:54:27','2026-10-09 03:26:32'),(731,2,'2026-10-08',4.98,30,505.36,6240,414.9,26550,2.49,100,4,4,'2026-10-08 14:54:59','2026-10-09 09:49:00'),(732,1,'2026-10-08',4.33,12,475.13,3564,414.9,26550,2.49,100,4,7,'2026-10-08 14:55:30','2026-10-09 03:27:23'),(733,3,'2026-10-09',4.65,20,448.36,2830,417.43,12650,2.5,50,7,7,'2026-10-10 03:02:52','2026-10-10 07:44:18'),(734,2,'2026-10-09',5.01,30,507.88,2520,417.43,12650,2.5,50,7,7,'2026-10-10 07:45:37','2026-10-10 07:45:37'),(735,1,'2026-10-09',4.36,18,477.93,1680,417.43,12650,2.5,50,7,7,'2026-10-10 07:50:02','2026-10-10 07:50:02'),(749,3,'2026-10-10',4.68,30,454.98,6620,423.38,29750,2.52,100,4,7,'2026-10-11 07:40:43','2026-10-11 11:07:43'),(750,2,'2026-10-10',5.03,20,514.67,6790,423.38,29750,2.52,100,7,7,'2026-10-11 11:10:28','2026-10-11 11:10:28'),(751,1,'2026-10-10',4.38,12,484.36,3858,423.38,29750,2.52,100,7,7,'2026-10-11 11:12:06','2026-10-11 11:12:06'),(752,3,'2026-10-11',4.7,20,461.43,6450,429.09,28550,2.54,100,7,7,'2026-10-11 13:28:59','2026-10-11 13:28:59'),(753,2,'2026-10-11',5.06,30,521.28,6610,429.09,28550,2.54,100,7,7,'2026-10-11 13:29:57','2026-10-11 13:29:57'),(754,1,'2026-10-11',4.41,18,490.58,3732,429.09,28550,2.54,100,7,7,'2026-10-11 13:30:55','2026-10-11 13:30:55'),(755,3,'2026-10-12',4.72,20,467.92,6490,434.87,28900,2.57,150,7,7,'2026-10-13 03:04:45','2026-10-13 03:18:33'),(756,2,'2026-10-12',5.08,20,527.92,6640,434.87,28900,2.57,150,7,7,'2026-10-13 03:06:33','2026-10-13 03:18:55'),(757,1,'2026-10-12',4.44,18,496.88,3780,434.87,28900,2.57,150,7,7,'2026-10-13 03:08:45','2026-10-13 03:19:10'),(758,1,'2026-10-13',4.46,12,503.26,3828,440.69,29100,2.59,100,4,7,'2026-10-13 14:35:04','2026-10-14 03:45:07'),(759,2,'2026-10-13',5.11,30,534.65,6730,440.69,29100,2.59,100,4,7,'2026-10-13 14:35:04','2026-10-14 03:44:15'),(760,3,'2026-10-13',4.75,30,474.46,6540,440.69,29100,2.59,100,4,7,'2026-10-13 14:35:04','2026-10-14 03:43:27'),(761,1,'2026-10-14',4.48,12,509.04,3468,445.95,26300,2.6,50,4,7,'2026-10-14 14:35:03','2026-10-15 04:23:52'),(762,2,'2026-10-14',5.14,30,540.79,6140,445.95,26300,2.6,50,4,7,'2026-10-14 14:35:03','2026-10-15 04:23:01'),(763,3,'2026-10-14',4.78,30,480.44,5980,445.95,26300,2.6,50,4,7,'2026-10-14 14:35:04','2026-10-15 04:22:04'),(764,1,'2026-10-15',4.51,18,514.78,3444,451.13,25900,2.62,100,4,7,'2026-10-15 13:10:09','2026-10-16 02:11:03'),(765,2,'2026-10-15',5.17,30,546.85,6060,451.13,25900,2.62,100,4,7,'2026-10-15 13:10:53','2026-10-16 02:10:50'),(766,3,'2026-10-15',4.8,20,486.35,5910,451.13,25900,2.62,100,4,7,'2026-10-15 13:11:28','2026-10-16 02:10:30'),(767,1,'2026-10-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(768,2,'2026-10-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,'2026-10-16 14:35:02','2026-10-16 14:35:02'),(769,3,'2026-10-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,'2026-10-16 14:35:03','2026-10-16 14:35:03');
/*!40000 ALTER TABLE `daily_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_locations`
--

DROP TABLE IF EXISTS `employee_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `accuracy` decimal(8,2) DEFAULT NULL,
  `speed` decimal(6,2) DEFAULT NULL,
  `heading` decimal(6,2) DEFAULT NULL,
  `status_label` varchar(255) NOT NULL DEFAULT 'Active',
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_locations_employee_id_recorded_at_index` (`employee_id`,`recorded_at`),
  CONSTRAINT `employee_locations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=946 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_locations`
--

LOCK TABLES `employee_locations` WRITE;
/*!40000 ALTER TABLE `employee_locations` DISABLE KEYS */;
INSERT INTO `employee_locations` VALUES (489,3,22.2007270,71.4952268,21.70,NULL,NULL,'App Active','2026-10-09 07:57:15','2026-10-09 07:57:15','2026-10-09 07:57:15'),(490,3,22.2007487,71.4952041,21.60,0.00,NULL,'App Active','2026-10-09 07:57:35','2026-10-09 07:57:35','2026-10-09 07:57:35'),(491,3,22.2007487,71.4952041,21.60,0.00,NULL,'App Active','2026-10-09 07:57:40','2026-10-09 07:57:40','2026-10-09 07:57:40'),(492,3,22.2007487,71.4952041,21.60,0.00,NULL,'App Active','2026-10-09 07:57:40','2026-10-09 07:57:40','2026-10-09 07:57:40'),(493,3,22.2007441,71.4952004,36.46,NULL,NULL,'App Active','2026-10-09 07:58:23','2026-10-09 07:58:23','2026-10-09 07:58:23'),(494,3,22.2010800,71.4950133,95.80,0.00,NULL,'App Active','2026-10-09 11:09:14','2026-10-09 11:09:14','2026-10-09 11:09:14'),(495,3,22.2010750,71.4951250,8.20,29.00,64.00,'App Active','2026-10-09 11:09:32','2026-10-09 11:09:32','2026-10-09 11:09:32'),(496,3,22.2007412,71.4952123,45.60,NULL,NULL,'App Active','2026-10-09 11:10:02','2026-10-09 11:10:02','2026-10-09 11:10:02'),(497,3,22.2007412,71.4952123,45.60,NULL,NULL,'App Active','2026-10-09 11:10:31','2026-10-09 11:10:31','2026-10-09 11:10:31'),(498,3,22.2007412,71.4952123,45.60,NULL,NULL,'App Active','2026-10-09 11:11:13','2026-10-09 11:11:13','2026-10-09 11:11:13'),(499,3,22.2007599,71.4951945,20.00,NULL,NULL,'App Active','2026-10-09 11:30:09','2026-10-09 11:30:09','2026-10-09 11:30:09'),(500,3,22.2010896,71.4952695,3.00,0.00,NULL,'App Active','2026-10-09 11:30:24','2026-10-09 11:30:24','2026-10-09 11:30:24'),(501,3,22.2014483,71.4949433,10.20,1.00,214.00,'App Active','2026-10-10 03:00:51','2026-10-10 03:00:51','2026-10-10 03:00:51'),(502,3,22.2008366,71.4949521,7.30,5.00,260.58,'App Active','2026-10-10 03:02:31','2026-10-10 03:02:31','2026-10-10 03:02:31'),(503,3,22.2013918,71.4950866,3.00,1.00,279.00,'App Active','2026-10-10 03:02:43','2026-10-10 03:02:43','2026-10-10 03:02:43'),(504,3,22.2013790,71.4950388,3.00,0.00,NULL,'App Active','2026-10-10 03:02:54','2026-10-10 03:02:54','2026-10-10 03:02:54'),(505,3,22.1937817,71.5011267,7.70,1.00,0.00,'App Active','2026-10-10 07:36:03','2026-10-10 07:36:03','2026-10-10 07:36:03'),(506,3,22.1937839,71.5012134,3.00,0.00,56.77,'App Active','2026-10-10 07:36:19','2026-10-10 07:36:19','2026-10-10 07:36:19'),(507,3,22.1938212,71.5012125,3.00,0.00,NULL,'App Active','2026-10-10 07:36:35','2026-10-10 07:36:35','2026-10-10 07:36:35'),(508,3,22.1938268,71.5011994,3.00,0.00,NULL,'App Active','2026-10-10 07:36:50','2026-10-10 07:36:50','2026-10-10 07:36:50'),(509,3,22.1938517,71.5011817,4.40,0.00,NULL,'App Active','2026-10-10 07:38:18','2026-10-10 07:38:18','2026-10-10 07:38:18'),(510,3,22.1938517,71.5011817,4.40,0.00,NULL,'App Active','2026-10-10 07:38:18','2026-10-10 07:38:18','2026-10-10 07:38:18'),(511,3,22.1938517,71.5011817,4.40,0.00,NULL,'App Active','2026-10-10 07:38:18','2026-10-10 07:38:18','2026-10-10 07:38:18'),(512,3,22.1938354,71.5011869,3.01,1.00,239.79,'App Active','2026-10-10 07:38:34','2026-10-10 07:38:34','2026-10-10 07:38:34'),(513,3,22.1938117,71.5011950,4.00,1.00,181.00,'App Active','2026-10-10 07:39:12','2026-10-10 07:39:12','2026-10-10 07:39:12'),(514,3,22.1938117,71.5011950,4.00,1.00,181.00,'App Active','2026-10-10 07:39:12','2026-10-10 07:39:12','2026-10-10 07:39:12'),(515,3,22.1937582,71.5012032,4.10,0.00,NULL,'App Active','2026-10-10 07:39:32','2026-10-10 07:39:32','2026-10-10 07:39:32'),(516,3,22.1937582,71.5012032,4.10,0.00,NULL,'App Active','2026-10-10 07:39:32','2026-10-10 07:39:32','2026-10-10 07:39:32'),(517,3,22.1938141,71.5012040,3.65,2.00,230.98,'App Active','2026-10-10 07:39:47','2026-10-10 07:39:47','2026-10-10 07:39:47'),(518,3,22.1938141,71.5012040,3.65,2.00,230.98,'App Active','2026-10-10 07:39:47','2026-10-10 07:39:47','2026-10-10 07:39:47'),(519,3,22.1938065,71.5012002,3.70,0.00,NULL,'App Active','2026-10-10 07:40:12','2026-10-10 07:40:12','2026-10-10 07:40:12'),(520,3,22.1938065,71.5012002,3.70,0.00,NULL,'App Active','2026-10-10 07:40:12','2026-10-10 07:40:12','2026-10-10 07:40:12'),(521,3,22.1937790,71.5012026,3.47,1.00,179.99,'App Active','2026-10-10 07:40:17','2026-10-10 07:40:17','2026-10-10 07:40:17'),(522,3,22.1937790,71.5012026,3.47,1.00,179.99,'App Active','2026-10-10 07:40:18','2026-10-10 07:40:18','2026-10-10 07:40:18'),(523,3,22.1937794,71.5012188,3.16,1.00,95.77,'App Active','2026-10-10 07:40:25','2026-10-10 07:40:25','2026-10-10 07:40:25'),(524,3,22.1937794,71.5012188,3.16,1.00,95.77,'App Active','2026-10-10 07:40:25','2026-10-10 07:40:25','2026-10-10 07:40:25'),(525,3,22.1938147,71.5012112,3.00,0.00,NULL,'App Active','2026-10-10 07:40:41','2026-10-10 07:40:41','2026-10-10 07:40:41'),(526,3,22.1938280,71.5011700,3.00,0.00,NULL,'App Active','2026-10-10 07:40:54','2026-10-10 07:40:54','2026-10-10 07:40:54'),(527,3,22.1938295,71.5011718,3.00,0.00,NULL,'App Active','2026-10-10 07:41:08','2026-10-10 07:41:08','2026-10-10 07:41:08'),(528,3,22.1938298,71.5011704,3.00,0.00,NULL,'App Active','2026-10-10 07:41:22','2026-10-10 07:41:22','2026-10-10 07:41:22'),(529,3,22.1938297,71.5011697,3.00,0.00,NULL,'App Active','2026-10-10 07:41:38','2026-10-10 07:41:38','2026-10-10 07:41:38'),(530,3,22.1938298,71.5011694,3.00,0.00,NULL,'App Active','2026-10-10 07:41:46','2026-10-10 07:41:46','2026-10-10 07:41:46'),(531,3,22.1938293,71.5011699,3.00,0.00,NULL,'App Active','2026-10-10 07:41:52','2026-10-10 07:41:52','2026-10-10 07:41:52'),(532,3,22.1938329,71.5011802,3.02,0.00,63.00,'App Active','2026-10-10 07:42:04','2026-10-10 07:42:04','2026-10-10 07:42:04'),(533,3,22.1938452,71.5011689,3.00,0.00,NULL,'App Active','2026-10-10 07:42:13','2026-10-10 07:42:13','2026-10-10 07:42:13'),(534,3,22.1938512,71.5011768,3.00,0.00,NULL,'App Active','2026-10-10 07:42:28','2026-10-10 07:42:28','2026-10-10 07:42:28'),(535,3,22.1938505,71.5011779,3.00,0.00,NULL,'App Active','2026-10-10 07:42:32','2026-10-10 07:42:32','2026-10-10 07:42:32'),(536,3,22.1938492,71.5011794,3.00,0.00,NULL,'App Active','2026-10-10 07:42:40','2026-10-10 07:42:40','2026-10-10 07:42:40'),(537,3,22.1938472,71.5011808,3.00,0.00,NULL,'App Active','2026-10-10 07:42:52','2026-10-10 07:42:52','2026-10-10 07:42:52'),(538,3,22.1938442,71.5011802,3.00,0.00,NULL,'App Active','2026-10-10 07:43:07','2026-10-10 07:43:07','2026-10-10 07:43:07'),(539,3,22.1938431,71.5011794,3.00,0.00,NULL,'App Active','2026-10-10 07:43:21','2026-10-10 07:43:21','2026-10-10 07:43:21'),(540,3,22.1938429,71.5011785,3.00,0.00,NULL,'App Active','2026-10-10 07:43:33','2026-10-10 07:43:33','2026-10-10 07:43:33'),(541,3,22.1938434,71.5011781,3.00,0.00,NULL,'App Active','2026-10-10 07:43:40','2026-10-10 07:43:40','2026-10-10 07:43:40'),(542,3,22.1938383,71.5011795,3.00,1.00,185.81,'App Active','2026-10-10 07:43:47','2026-10-10 07:43:47','2026-10-10 07:43:47'),(543,3,22.1938352,71.5011840,3.00,0.00,66.60,'App Active','2026-10-10 07:44:03','2026-10-10 07:44:03','2026-10-10 07:44:03'),(544,3,22.1938389,71.5011846,3.00,0.00,30.96,'App Active','2026-10-10 07:44:05','2026-10-10 07:44:05','2026-10-10 07:44:05'),(545,3,22.1938473,71.5011850,3.00,0.00,NULL,'App Active','2026-10-10 07:44:17','2026-10-10 07:44:17','2026-10-10 07:44:17'),(546,3,22.1938462,71.5011749,3.00,0.00,NULL,'App Active','2026-10-10 07:44:26','2026-10-10 07:44:26','2026-10-10 07:44:26'),(547,3,22.1938429,71.5011701,3.00,0.00,NULL,'App Active','2026-10-10 07:44:41','2026-10-10 07:44:41','2026-10-10 07:44:41'),(548,3,22.1938417,71.5011695,3.00,0.00,NULL,'App Active','2026-10-10 07:44:53','2026-10-10 07:44:53','2026-10-10 07:44:53'),(549,3,22.1938412,71.5011697,3.00,0.00,NULL,'App Active','2026-10-10 07:45:02','2026-10-10 07:45:02','2026-10-10 07:45:02'),(550,3,22.1938423,71.5011696,3.00,0.00,NULL,'App Active','2026-10-10 07:45:11','2026-10-10 07:45:11','2026-10-10 07:45:11'),(551,3,22.1938434,71.5011709,3.00,0.00,NULL,'App Active','2026-10-10 07:45:26','2026-10-10 07:45:26','2026-10-10 07:45:26'),(552,3,22.1938433,71.5011716,3.00,0.00,NULL,'App Active','2026-10-10 07:45:32','2026-10-10 07:45:32','2026-10-10 07:45:32'),(553,3,22.1938233,71.5011717,2.90,0.00,NULL,'App Active','2026-10-10 07:45:56','2026-10-10 07:45:56','2026-10-10 07:45:56'),(554,3,22.1938233,71.5011717,2.90,0.00,NULL,'App Active','2026-10-10 07:45:56','2026-10-10 07:45:56','2026-10-10 07:45:56'),(555,3,22.1937499,71.5012122,3.20,NULL,NULL,'App Active','2026-10-10 07:46:26','2026-10-10 07:46:26','2026-10-10 07:46:26'),(556,3,22.1937499,71.5012122,3.20,3.00,142.23,'App Active','2026-10-10 07:46:26','2026-10-10 07:46:26','2026-10-10 07:46:26'),(557,3,22.1937500,71.5012183,4.40,0.00,NULL,'App Active','2026-10-10 07:46:28','2026-10-10 07:46:28','2026-10-10 07:46:28'),(558,3,22.1937849,71.5011609,4.00,0.00,NULL,'App Active','2026-10-10 07:46:46','2026-10-10 07:46:46','2026-10-10 07:46:46'),(559,3,22.1937849,71.5011609,4.00,0.00,NULL,'App Active','2026-10-10 07:46:46','2026-10-10 07:46:46','2026-10-10 07:46:46'),(560,3,22.1938081,71.5011649,3.00,0.00,325.05,'App Active','2026-10-10 07:47:01','2026-10-10 07:47:01','2026-10-10 07:47:01'),(561,3,22.1938097,71.5011662,3.00,0.00,329.94,'App Active','2026-10-10 07:47:20','2026-10-10 07:47:20','2026-10-10 07:47:20'),(562,3,22.1938097,71.5011662,3.00,0.00,329.94,'App Active','2026-10-10 07:47:20','2026-10-10 07:47:20','2026-10-10 07:47:20'),(563,3,22.1938183,71.5011783,4.30,0.00,33.00,'App Active','2026-10-10 07:47:21','2026-10-10 07:47:21','2026-10-10 07:47:21'),(564,3,22.1938032,71.5011819,3.28,0.00,89.97,'App Active','2026-10-10 07:47:32','2026-10-10 07:47:32','2026-10-10 07:47:32'),(565,3,22.1938032,71.5011819,3.28,0.00,89.97,'App Active','2026-10-10 07:47:33','2026-10-10 07:47:33','2026-10-10 07:47:33'),(566,3,22.1937991,71.5011847,3.07,0.00,NULL,'App Active','2026-10-10 07:47:47','2026-10-10 07:47:47','2026-10-10 07:47:47'),(567,3,22.1938155,71.5011820,3.00,0.00,NULL,'App Active','2026-10-10 07:47:58','2026-10-10 07:47:58','2026-10-10 07:47:58'),(568,3,22.1938182,71.5011802,3.00,0.00,NULL,'App Active','2026-10-10 07:48:04','2026-10-10 07:48:04','2026-10-10 07:48:04'),(569,3,22.1938162,71.5011683,3.00,0.00,NULL,'App Active','2026-10-10 07:48:20','2026-10-10 07:48:20','2026-10-10 07:48:20'),(570,3,22.1938155,71.5011671,3.00,0.00,NULL,'App Active','2026-10-10 07:48:28','2026-10-10 07:48:28','2026-10-10 07:48:28'),(571,3,22.1938155,71.5011656,3.00,0.00,NULL,'App Active','2026-10-10 07:48:43','2026-10-10 07:48:43','2026-10-10 07:48:43'),(572,3,22.1938145,71.5011654,3.00,0.00,NULL,'App Active','2026-10-10 07:48:53','2026-10-10 07:48:53','2026-10-10 07:48:53'),(573,3,22.1938188,71.5011619,3.00,0.00,NULL,'App Active','2026-10-10 07:49:08','2026-10-10 07:49:08','2026-10-10 07:49:08'),(574,3,22.1938205,71.5011609,3.00,0.00,NULL,'App Active','2026-10-10 07:49:10','2026-10-10 07:49:10','2026-10-10 07:49:10'),(575,3,22.1938250,71.5011667,4.30,0.00,NULL,'App Active','2026-10-10 07:49:32','2026-10-10 07:49:32','2026-10-10 07:49:32'),(576,3,22.1938250,71.5011667,4.30,0.00,NULL,'App Active','2026-10-10 07:49:32','2026-10-10 07:49:32','2026-10-10 07:49:32'),(577,3,22.1938225,71.5011857,4.30,0.00,NULL,'App Active','2026-10-10 07:49:53','2026-10-10 07:49:53','2026-10-10 07:49:53'),(578,3,22.1938133,71.5012050,4.70,0.00,NULL,'App Active','2026-10-10 07:49:56','2026-10-10 07:49:56','2026-10-10 07:49:56'),(579,3,22.1938182,71.5011816,4.14,0.00,NULL,'App Active','2026-10-10 07:50:05','2026-10-10 07:50:05','2026-10-10 07:50:05'),(580,3,22.1938535,71.5011779,3.01,3.00,6.22,'App Active','2026-10-10 07:50:15','2026-10-10 07:50:15','2026-10-10 07:50:15'),(581,3,22.1938525,71.5011703,3.00,0.00,NULL,'App Active','2026-10-10 07:50:31','2026-10-10 07:50:31','2026-10-10 07:50:31'),(582,3,22.1938326,71.5011741,3.00,0.00,NULL,'App Active','2026-10-10 07:50:47','2026-10-10 07:50:47','2026-10-10 07:50:47'),(583,3,22.1938277,71.5011775,3.00,0.00,NULL,'App Active','2026-10-10 07:51:02','2026-10-10 07:51:02','2026-10-10 07:51:02'),(584,3,22.1938225,71.5011812,3.00,NULL,NULL,'App Active','2026-10-10 07:51:58','2026-10-10 07:51:58','2026-10-10 07:51:58'),(585,3,22.2016167,71.4944550,7.80,2.00,99.00,'App Active','2026-10-10 08:54:52','2026-10-10 08:54:52','2026-10-10 08:54:52'),(586,3,22.2016167,71.4944550,7.80,2.00,99.00,'App Active','2026-10-10 08:54:52','2026-10-10 08:54:52','2026-10-10 08:54:52'),(587,3,22.2015143,71.4947337,6.26,NULL,NULL,'App Active','2026-10-10 08:55:44','2026-10-10 08:55:44','2026-10-10 08:55:44'),(588,3,22.2017779,71.4945026,13.70,0.00,NULL,'App Active','2026-10-10 10:30:49','2026-10-10 10:30:49','2026-10-10 10:30:49'),(589,3,22.2015628,71.4948895,3.70,0.00,3.34,'App Active','2026-10-10 10:31:05','2026-10-10 10:31:05','2026-10-10 10:31:05'),(590,3,22.2017507,71.4946541,9.30,0.00,NULL,'App Active','2026-10-10 10:50:44','2026-10-10 10:50:44','2026-10-10 10:50:44'),(591,3,22.2014748,71.4948767,3.37,0.00,109.45,'App Active','2026-10-10 10:51:02','2026-10-10 10:51:02','2026-10-10 10:51:02'),(592,3,22.2015079,71.4948558,3.00,0.00,322.09,'App Active','2026-10-10 10:51:15','2026-10-10 10:51:15','2026-10-10 10:51:15'),(593,3,22.2015055,71.4948395,3.00,0.00,NULL,'App Active','2026-10-10 10:51:30','2026-10-10 10:51:30','2026-10-10 10:51:30'),(594,3,22.2015025,71.4948192,3.00,0.00,NULL,'App Active','2026-10-10 10:51:47','2026-10-10 10:51:47','2026-10-10 10:51:47'),(595,3,22.2015023,71.4948213,3.00,0.00,70.03,'App Active','2026-10-10 10:52:01','2026-10-10 10:52:01','2026-10-10 10:52:01'),(596,3,22.2015204,71.4948754,3.00,0.00,NULL,'App Active','2026-10-10 10:52:16','2026-10-10 10:52:16','2026-10-10 10:52:16'),(597,3,22.2015219,71.4948751,3.00,0.00,NULL,'App Active','2026-10-10 10:52:31','2026-10-10 10:52:31','2026-10-10 10:52:31'),(598,3,22.2015116,71.4948718,3.00,0.00,NULL,'App Active','2026-10-10 10:52:47','2026-10-10 10:52:47','2026-10-10 10:52:47'),(599,3,22.2015059,71.4948731,3.00,1.00,171.07,'App Active','2026-10-10 10:53:02','2026-10-10 10:53:02','2026-10-10 10:53:02'),(600,3,22.2007560,71.4951986,20.00,NULL,NULL,'App Active','2026-10-10 12:37:55','2026-10-10 12:37:55','2026-10-10 12:37:55'),(601,3,22.2010094,71.4953308,19.08,0.00,NULL,'App Active','2026-10-10 12:38:00','2026-10-10 12:38:00','2026-10-10 12:38:00'),(602,3,22.2011385,71.4954261,3.00,NULL,NULL,'App Active','2026-10-10 12:38:42','2026-10-10 12:38:42','2026-10-10 12:38:42'),(603,3,22.2009129,71.4951354,83.70,0.00,0.00,'App Active','2026-10-11 06:18:19','2026-10-11 06:18:19','2026-10-11 06:18:19'),(604,3,22.2009900,71.4950717,11.40,3.00,87.00,'App Active','2026-10-11 06:18:54','2026-10-11 06:18:54','2026-10-11 06:18:54'),(605,3,22.2009900,71.4950717,11.40,3.00,87.00,'App Active','2026-10-11 06:18:54','2026-10-11 06:18:54','2026-10-11 06:18:54'),(606,3,22.2014451,71.4950309,3.00,1.00,54.44,'App Active','2026-10-11 06:19:10','2026-10-11 06:19:10','2026-10-11 06:19:10'),(607,3,22.2014501,71.4950707,3.00,1.00,88.65,'App Active','2026-10-11 06:19:25','2026-10-11 06:19:25','2026-10-11 06:19:25'),(608,3,22.2014516,71.4950744,3.00,0.00,NULL,'App Active','2026-10-11 06:19:41','2026-10-11 06:19:41','2026-10-11 06:19:41'),(609,3,22.2014533,71.4950743,3.00,0.00,NULL,'App Active','2026-10-11 06:19:57','2026-10-11 06:19:57','2026-10-11 06:19:57'),(610,3,22.1943517,71.4981667,9.10,1.00,0.00,'App Active','2026-10-11 11:04:28','2026-10-11 11:04:28','2026-10-11 11:04:28'),(611,3,22.1941653,71.4981290,3.00,1.00,294.37,'App Active','2026-10-11 11:04:44','2026-10-11 11:04:44','2026-10-11 11:04:44'),(612,3,22.1941677,71.4981234,3.00,NULL,NULL,'App Active','2026-10-11 11:05:07','2026-10-11 11:05:07','2026-10-11 11:05:07'),(613,3,22.1941900,71.4980817,3.80,0.00,NULL,'App Active','2026-10-11 11:05:14','2026-10-11 11:05:14','2026-10-11 11:05:14'),(614,3,22.1941900,71.4980817,3.80,0.00,NULL,'App Active','2026-10-11 11:05:14','2026-10-11 11:05:14','2026-10-11 11:05:14'),(615,3,22.1942133,71.4980950,4.70,0.00,NULL,'App Active','2026-10-11 11:05:37','2026-10-11 11:05:37','2026-10-11 11:05:37'),(616,3,22.1942133,71.4980950,4.70,0.00,NULL,'App Active','2026-10-11 11:05:37','2026-10-11 11:05:37','2026-10-11 11:05:37'),(617,3,22.1941995,71.4981002,3.53,0.00,NULL,'App Active','2026-10-11 11:05:55','2026-10-11 11:05:55','2026-10-11 11:05:55'),(618,3,22.1941995,71.4981002,3.53,0.00,NULL,'App Active','2026-10-11 11:05:57','2026-10-11 11:05:57','2026-10-11 11:05:57'),(619,3,22.1941995,71.4981002,3.53,0.00,NULL,'App Active','2026-10-11 11:05:57','2026-10-11 11:05:57','2026-10-11 11:05:57'),(620,3,22.1941950,71.4980950,4.20,0.00,NULL,'App Active','2026-10-11 11:06:18','2026-10-11 11:06:18','2026-10-11 11:06:18'),(621,3,22.1941950,71.4980950,4.20,0.00,NULL,'App Active','2026-10-11 11:06:18','2026-10-11 11:06:18','2026-10-11 11:06:18'),(622,3,22.1941983,71.4980699,3.00,0.00,NULL,'App Active','2026-10-11 11:06:34','2026-10-11 11:06:34','2026-10-11 11:06:34'),(623,3,22.1942097,71.4980692,3.00,0.00,NULL,'App Active','2026-10-11 11:06:47','2026-10-11 11:06:47','2026-10-11 11:06:47'),(624,3,22.1942108,71.4980702,3.00,0.00,NULL,'App Active','2026-10-11 11:06:59','2026-10-11 11:06:59','2026-10-11 11:06:59'),(625,3,22.1942114,71.4980701,3.00,0.00,NULL,'App Active','2026-10-11 11:07:10','2026-10-11 11:07:10','2026-10-11 11:07:10'),(626,3,22.1942110,71.4980702,3.00,0.00,NULL,'App Active','2026-10-11 11:07:19','2026-10-11 11:07:19','2026-10-11 11:07:19'),(627,3,22.1942109,71.4980701,3.00,0.00,NULL,'App Active','2026-10-11 11:07:28','2026-10-11 11:07:28','2026-10-11 11:07:28'),(628,3,22.1942111,71.4980702,3.00,0.00,NULL,'App Active','2026-10-11 11:07:32','2026-10-11 11:07:32','2026-10-11 11:07:32'),(629,3,22.1942113,71.4980700,3.00,0.00,NULL,'App Active','2026-10-11 11:07:40','2026-10-11 11:07:40','2026-10-11 11:07:40'),(630,3,22.1942114,71.4980700,3.00,0.00,NULL,'App Active','2026-10-11 11:07:42','2026-10-11 11:07:42','2026-10-11 11:07:42'),(631,3,22.1942115,71.4980699,3.00,0.00,NULL,'App Active','2026-10-11 11:07:49','2026-10-11 11:07:49','2026-10-11 11:07:49'),(632,3,22.1942114,71.4980700,3.00,0.00,NULL,'App Active','2026-10-11 11:07:53','2026-10-11 11:07:53','2026-10-11 11:07:53'),(633,3,22.1942105,71.4980701,3.00,0.00,NULL,'App Active','2026-10-11 11:08:05','2026-10-11 11:08:05','2026-10-11 11:08:05'),(634,3,22.1942102,71.4980703,3.00,0.00,NULL,'App Active','2026-10-11 11:08:12','2026-10-11 11:08:12','2026-10-11 11:08:12'),(635,3,22.1942102,71.4980704,3.00,0.00,NULL,'App Active','2026-10-11 11:08:14','2026-10-11 11:08:14','2026-10-11 11:08:14'),(636,3,22.1942098,71.4980705,3.00,0.00,NULL,'App Active','2026-10-11 11:08:24','2026-10-11 11:08:24','2026-10-11 11:08:24'),(637,3,22.1942089,71.4980696,3.00,0.00,NULL,'App Active','2026-10-11 11:08:34','2026-10-11 11:08:34','2026-10-11 11:08:34'),(638,3,22.1942094,71.4980687,3.00,0.00,NULL,'App Active','2026-10-11 11:08:47','2026-10-11 11:08:47','2026-10-11 11:08:47'),(639,3,22.1942092,71.4980670,3.00,0.00,NULL,'App Active','2026-10-11 11:08:50','2026-10-11 11:08:50','2026-10-11 11:08:50'),(640,3,22.1942017,71.4980617,2.60,0.00,NULL,'App Active','2026-10-11 11:09:07','2026-10-11 11:09:07','2026-10-11 11:09:07'),(641,3,22.1942017,71.4980617,2.60,0.00,NULL,'App Active','2026-10-11 11:09:07','2026-10-11 11:09:07','2026-10-11 11:09:07'),(642,3,22.1941683,71.4980450,2.20,0.00,NULL,'App Active','2026-10-11 11:09:28','2026-10-11 11:09:28','2026-10-11 11:09:28'),(643,3,22.1941683,71.4980450,2.20,0.00,NULL,'App Active','2026-10-11 11:09:28','2026-10-11 11:09:28','2026-10-11 11:09:28'),(644,3,22.1941530,71.4980466,3.97,NULL,90.00,'App Active','2026-10-11 11:09:44','2026-10-11 11:09:44','2026-10-11 11:09:44'),(645,3,22.1941530,71.4980466,3.97,NULL,90.00,'App Active','2026-10-11 11:09:44','2026-10-11 11:09:44','2026-10-11 11:09:44'),(646,3,22.1941532,71.4980446,3.37,0.00,286.16,'App Active','2026-10-11 11:09:57','2026-10-11 11:09:57','2026-10-11 11:09:57'),(647,3,22.1941532,71.4980446,3.37,0.00,286.16,'App Active','2026-10-11 11:09:57','2026-10-11 11:09:57','2026-10-11 11:09:57'),(648,3,22.1942171,71.4980562,3.00,1.00,321.10,'App Active','2026-10-11 11:10:12','2026-10-11 11:10:12','2026-10-11 11:10:12'),(649,3,22.1942165,71.4980545,3.00,1.00,314.87,'App Active','2026-10-11 11:10:22','2026-10-11 11:10:22','2026-10-11 11:10:22'),(650,3,22.1942165,71.4980545,3.00,1.00,314.87,'App Active','2026-10-11 11:10:22','2026-10-11 11:10:22','2026-10-11 11:10:22'),(651,3,22.1941827,71.4980538,3.00,0.00,NULL,'App Active','2026-10-11 11:10:38','2026-10-11 11:10:38','2026-10-11 11:10:38'),(652,3,22.1942000,71.4980517,3.20,0.00,NULL,'App Active','2026-10-11 11:10:54','2026-10-11 11:10:54','2026-10-11 11:10:54'),(653,3,22.1942000,71.4980517,3.20,0.00,NULL,'App Active','2026-10-11 11:10:54','2026-10-11 11:10:54','2026-10-11 11:10:54'),(654,3,22.1941865,71.4980448,2.55,NULL,90.00,'App Active','2026-10-11 11:11:09','2026-10-11 11:11:09','2026-10-11 11:11:09'),(655,3,22.1941865,71.4980448,2.55,NULL,90.00,'App Active','2026-10-11 11:11:09','2026-10-11 11:11:09','2026-10-11 11:11:09'),(656,3,22.1942226,71.4980683,3.00,0.00,NULL,'App Active','2026-10-11 11:11:25','2026-10-11 11:11:25','2026-10-11 11:11:25'),(657,3,22.1942220,71.4980678,3.00,1.00,24.51,'App Active','2026-10-11 11:11:27','2026-10-11 11:11:27','2026-10-11 11:11:27'),(658,3,22.1942101,71.4980661,3.00,0.00,NULL,'App Active','2026-10-11 11:11:41','2026-10-11 11:11:41','2026-10-11 11:11:41'),(659,3,22.1942097,71.4980586,3.00,0.00,NULL,'App Active','2026-10-11 11:11:53','2026-10-11 11:11:53','2026-10-11 11:11:53'),(660,3,22.1942095,71.4980574,3.00,0.00,NULL,'App Active','2026-10-11 11:12:00','2026-10-11 11:12:00','2026-10-11 11:12:00'),(661,3,22.2013367,71.4945983,7.10,2.00,231.00,'App Active','2026-10-12 02:00:39','2026-10-12 02:00:39','2026-10-12 02:00:39'),(662,3,22.2012668,71.4946214,3.65,2.00,167.83,'App Active','2026-10-12 02:00:55','2026-10-12 02:00:55','2026-10-12 02:00:55'),(663,3,22.2012420,71.4946347,3.00,0.00,178.52,'App Active','2026-10-12 02:01:10','2026-10-12 02:01:10','2026-10-12 02:01:10'),(664,3,22.2012579,71.4946234,3.01,0.00,295.24,'App Active','2026-10-12 02:01:25','2026-10-12 02:01:25','2026-10-12 02:01:25'),(665,3,22.2012827,71.4945809,3.00,0.00,NULL,'App Active','2026-10-12 02:01:41','2026-10-12 02:01:41','2026-10-12 02:01:41'),(666,3,22.2012839,71.4945829,3.00,0.00,NULL,'App Active','2026-10-12 02:01:57','2026-10-12 02:01:57','2026-10-12 02:01:57'),(667,3,22.2012827,71.4945863,3.00,0.00,NULL,'App Active','2026-10-12 02:02:13','2026-10-12 02:02:13','2026-10-12 02:02:13'),(668,3,22.2012830,71.4945868,3.00,NULL,NULL,'App Active','2026-10-12 02:02:48','2026-10-12 02:02:48','2026-10-12 02:02:48'),(669,3,22.2012831,71.4945864,3.00,0.00,NULL,'App Active','2026-10-12 02:02:51','2026-10-12 02:02:51','2026-10-12 02:02:51'),(670,3,22.2012700,71.4945750,2.30,0.00,NULL,'App Active','2026-10-12 02:02:53','2026-10-12 02:02:53','2026-10-12 02:02:53'),(671,3,22.2012792,71.4945685,2.58,NULL,NULL,'App Active','2026-10-12 02:03:18','2026-10-12 02:03:18','2026-10-12 02:03:18'),(672,3,22.2012792,71.4945685,2.58,NULL,NULL,'App Active','2026-10-12 02:03:52','2026-10-12 02:03:52','2026-10-12 02:03:52'),(673,3,22.2011098,71.4948951,12.10,1.00,26.72,'App Active','2026-10-12 03:35:11','2026-10-12 03:35:11','2026-10-12 03:35:11'),(674,3,22.2013465,71.4947706,4.73,8.00,179.14,'App Active','2026-10-12 03:35:26','2026-10-12 03:35:26','2026-10-12 03:35:26'),(675,3,22.2014412,71.4947866,3.00,0.00,NULL,'App Active','2026-10-12 03:35:41','2026-10-12 03:35:41','2026-10-12 03:35:41'),(676,3,22.2014490,71.4948579,3.00,0.00,NULL,'App Active','2026-10-12 03:35:57','2026-10-12 03:35:57','2026-10-12 03:35:57'),(677,3,22.2013950,71.4948766,3.00,2.00,172.38,'App Active','2026-10-12 03:36:13','2026-10-12 03:36:13','2026-10-12 03:36:13'),(678,3,22.2014131,71.4948308,3.00,NULL,NULL,'App Active','2026-10-12 03:36:57','2026-10-12 03:36:57','2026-10-12 03:36:57'),(679,3,22.2014131,71.4948308,3.00,NULL,NULL,'App Active','2026-10-12 03:37:22','2026-10-12 03:37:22','2026-10-12 03:37:22'),(680,3,22.1937150,71.5013033,7.40,3.00,110.00,'App Active','2026-10-12 07:31:56','2026-10-12 07:31:56','2026-10-12 07:31:56'),(681,3,22.1937587,71.5011938,3.00,0.00,313.26,'App Active','2026-10-12 07:32:12','2026-10-12 07:32:12','2026-10-12 07:32:12'),(682,3,22.1937739,71.5012171,3.17,1.00,68.54,'App Active','2026-10-12 07:32:28','2026-10-12 07:32:28','2026-10-12 07:32:28'),(683,3,22.1937836,71.5012204,3.00,1.00,89.95,'App Active','2026-10-12 07:32:34','2026-10-12 07:32:34','2026-10-12 07:32:34'),(684,3,22.1936464,71.5009081,8.00,1.00,309.42,'App Active','2026-10-12 08:07:33','2026-10-12 08:07:33','2026-10-12 08:07:33'),(685,3,22.1936464,71.5009081,8.00,1.00,309.42,'App Active','2026-10-12 08:07:33','2026-10-12 08:07:33','2026-10-12 08:07:33'),(686,3,22.1936981,71.5011265,6.34,1.00,325.42,'App Active','2026-10-12 08:07:38','2026-10-12 08:07:38','2026-10-12 08:07:38'),(687,3,22.1937037,71.5011332,6.74,1.00,328.75,'App Active','2026-10-12 08:07:41','2026-10-12 08:07:41','2026-10-12 08:07:41'),(688,3,22.1937342,71.5011685,3.00,0.00,NULL,'App Active','2026-10-12 08:07:55','2026-10-12 08:07:55','2026-10-12 08:07:55'),(689,3,22.1937608,71.5011606,3.00,0.00,NULL,'App Active','2026-10-12 08:08:10','2026-10-12 08:08:10','2026-10-12 08:08:10'),(690,3,22.1937681,71.5011612,3.00,0.00,NULL,'App Active','2026-10-12 08:08:26','2026-10-12 08:08:26','2026-10-12 08:08:26'),(691,3,22.1937696,71.5011619,3.00,0.00,NULL,'App Active','2026-10-12 08:08:35','2026-10-12 08:08:35','2026-10-12 08:08:35'),(692,3,22.1937889,71.5011469,3.00,0.00,339.78,'App Active','2026-10-12 08:08:51','2026-10-12 08:08:51','2026-10-12 08:08:51'),(693,3,22.2007688,71.4951883,20.00,NULL,NULL,'App Active','2026-10-12 09:09:46','2026-10-12 09:09:46','2026-10-12 09:09:46'),(694,3,22.2009233,71.4954017,1.88,0.00,NULL,'App Active','2026-10-12 09:10:02','2026-10-12 09:10:02','2026-10-12 09:10:02'),(695,3,22.2008467,71.4952900,4.20,0.00,201.00,'App Active','2026-10-12 09:10:21','2026-10-12 09:10:21','2026-10-12 09:10:21'),(696,3,22.2008467,71.4952900,4.20,0.00,201.00,'App Active','2026-10-12 09:10:21','2026-10-12 09:10:21','2026-10-12 09:10:21'),(697,3,22.2009383,71.4953583,1.82,0.00,77.00,'App Active','2026-10-12 09:10:36','2026-10-12 09:10:36','2026-10-12 09:10:36'),(698,3,22.2009383,71.4953733,1.70,0.00,NULL,'App Active','2026-10-12 09:10:53','2026-10-12 09:10:53','2026-10-12 09:10:53'),(699,3,22.2009333,71.4953750,1.80,0.00,NULL,'App Active','2026-10-12 09:11:07','2026-10-12 09:11:07','2026-10-12 09:11:07'),(700,3,22.2009333,71.4953750,1.85,0.00,NULL,'App Active','2026-10-12 09:11:22','2026-10-12 09:11:22','2026-10-12 09:11:22'),(701,3,22.2009333,71.4953750,1.85,0.00,NULL,'App Active','2026-10-12 09:11:27','2026-10-12 09:11:27','2026-10-12 09:11:27'),(702,3,22.2009283,71.4953850,1.92,0.00,NULL,'App Active','2026-10-12 09:11:31','2026-10-12 09:11:31','2026-10-12 09:11:31'),(703,3,22.2009267,71.4953750,2.02,0.00,NULL,'App Active','2026-10-12 09:11:34','2026-10-12 09:11:34','2026-10-12 09:11:34'),(704,3,22.2009267,71.4953750,2.10,NULL,NULL,'App Active','2026-10-12 09:11:57','2026-10-12 09:11:57','2026-10-12 09:11:57'),(705,3,22.2009267,71.4953750,2.10,NULL,NULL,'App Active','2026-10-12 09:12:35','2026-10-12 09:12:35','2026-10-12 09:12:35'),(706,3,22.2007450,71.4954883,9.20,2.00,248.00,'App Active','2026-10-12 09:29:18','2026-10-12 09:29:18','2026-10-12 09:29:18'),(707,3,22.2008214,71.4956455,3.00,0.00,NULL,'App Active','2026-10-12 09:29:34','2026-10-12 09:29:34','2026-10-12 09:29:34'),(708,3,22.2007284,71.4952204,52.40,NULL,NULL,'App Active','2026-10-12 11:24:14','2026-10-12 11:24:14','2026-10-12 11:24:14'),(709,3,22.2013920,71.4950965,3.00,1.00,16.57,'App Active','2026-10-12 11:24:29','2026-10-12 11:24:29','2026-10-12 11:24:29'),(710,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-13 02:36:19','2026-10-13 02:36:19','2026-10-13 02:36:19'),(711,3,22.2013692,71.4949917,3.11,0.00,NULL,'App Active','2026-10-13 02:36:35','2026-10-13 02:36:35','2026-10-13 02:36:35'),(712,3,22.2013710,71.4950072,3.00,1.00,70.34,'App Active','2026-10-13 02:36:50','2026-10-13 02:36:50','2026-10-13 02:36:50'),(713,3,22.2013727,71.4950097,3.00,0.00,NULL,'App Active','2026-10-13 02:37:07','2026-10-13 02:37:07','2026-10-13 02:37:07'),(714,3,22.2006945,71.4952380,82.50,NULL,NULL,'App Active','2026-10-13 03:01:07','2026-10-13 03:01:07','2026-10-13 03:01:07'),(715,3,22.2013234,71.4950465,4.23,1.00,25.69,'App Active','2026-10-13 03:01:24','2026-10-13 03:01:24','2026-10-13 03:01:24'),(716,3,22.2013416,71.4950556,3.00,NULL,NULL,'App Active','2026-10-13 03:02:17','2026-10-13 03:02:17','2026-10-13 03:02:17'),(717,3,22.2013416,71.4950556,3.00,0.00,NULL,'App Active','2026-10-13 03:02:45','2026-10-13 03:02:45','2026-10-13 03:02:45'),(718,3,22.2014718,71.4950818,4.57,16.00,10.59,'App Active','2026-10-13 03:03:14','2026-10-13 03:03:14','2026-10-13 03:03:14'),(719,3,22.2007372,71.4952082,98.40,NULL,NULL,'App Active','2026-10-13 03:03:15','2026-10-13 03:03:15','2026-10-13 03:03:15'),(720,3,22.2014165,71.4950873,7.50,3.00,10.84,'App Active','2026-10-13 03:03:29','2026-10-13 03:03:29','2026-10-13 03:03:29'),(721,3,22.2014165,71.4950873,7.50,3.00,10.84,'App Active','2026-10-13 03:03:29','2026-10-13 03:03:29','2026-10-13 03:03:29'),(722,3,22.2013917,71.4950867,5.40,0.00,NULL,'App Active','2026-10-13 03:03:52','2026-10-13 03:03:52','2026-10-13 03:03:52'),(723,3,22.2013917,71.4950867,5.40,0.00,NULL,'App Active','2026-10-13 03:03:52','2026-10-13 03:03:52','2026-10-13 03:03:52'),(724,3,22.2012841,71.4950481,4.21,2.00,91.02,'App Active','2026-10-13 03:04:00','2026-10-13 03:04:00','2026-10-13 03:04:00'),(725,3,22.2012841,71.4950481,4.21,2.00,91.02,'App Active','2026-10-13 03:04:00','2026-10-13 03:04:00','2026-10-13 03:04:00'),(726,3,22.2012650,71.4950500,6.20,2.00,209.00,'App Active','2026-10-13 03:04:22','2026-10-13 03:04:22','2026-10-13 03:04:22'),(727,3,22.2012650,71.4950500,6.20,2.00,209.00,'App Active','2026-10-13 03:04:22','2026-10-13 03:04:22','2026-10-13 03:04:22'),(728,3,22.2012070,71.4950364,5.36,8.00,198.82,'App Active','2026-10-13 03:04:37','2026-10-13 03:04:37','2026-10-13 03:04:37'),(729,3,22.2012070,71.4950364,5.36,8.00,198.82,'App Active','2026-10-13 03:04:37','2026-10-13 03:04:37','2026-10-13 03:04:37'),(730,3,22.2013363,71.4950417,3.00,0.00,NULL,'App Active','2026-10-13 03:04:52','2026-10-13 03:04:52','2026-10-13 03:04:52'),(731,3,22.2013617,71.4950550,3.70,0.00,NULL,'App Active','2026-10-13 03:05:12','2026-10-13 03:05:12','2026-10-13 03:05:12'),(732,3,22.2013617,71.4950550,3.70,0.00,NULL,'App Active','2026-10-13 03:05:12','2026-10-13 03:05:12','2026-10-13 03:05:12'),(733,3,22.2014001,71.4950990,3.60,0.00,241.29,'App Active','2026-10-13 03:05:29','2026-10-13 03:05:29','2026-10-13 03:05:29'),(734,3,22.2014001,71.4950990,3.60,0.00,241.29,'App Active','2026-10-13 03:05:29','2026-10-13 03:05:29','2026-10-13 03:05:29'),(735,3,22.2011636,71.4950741,5.60,0.00,180.00,'App Active','2026-10-13 03:05:44','2026-10-13 03:05:44','2026-10-13 03:05:44'),(736,3,22.2011636,71.4950741,5.60,0.00,180.00,'App Active','2026-10-13 03:05:44','2026-10-13 03:05:44','2026-10-13 03:05:44'),(737,3,22.2012583,71.4950333,5.20,0.00,NULL,'App Active','2026-10-13 03:06:03','2026-10-13 03:06:03','2026-10-13 03:06:03'),(738,3,22.2012583,71.4950333,5.20,0.00,NULL,'App Active','2026-10-13 03:06:03','2026-10-13 03:06:03','2026-10-13 03:06:03'),(739,3,22.2014498,71.4950857,5.10,14.00,12.89,'App Active','2026-10-13 03:06:15','2026-10-13 03:06:15','2026-10-13 03:06:15'),(740,3,22.2014498,71.4950857,5.10,14.00,12.89,'App Active','2026-10-13 03:06:15','2026-10-13 03:06:15','2026-10-13 03:06:15'),(741,3,22.2014385,71.4950823,6.69,1.00,136.80,'App Active','2026-10-13 03:06:27','2026-10-13 03:06:27','2026-10-13 03:06:27'),(742,3,22.2014385,71.4950823,6.69,1.00,136.80,'App Active','2026-10-13 03:06:27','2026-10-13 03:06:27','2026-10-13 03:06:27'),(743,3,22.2014254,71.4951031,5.40,0.00,NULL,'App Active','2026-10-13 03:06:51','2026-10-13 03:06:51','2026-10-13 03:06:51'),(744,3,22.2014254,71.4951031,5.40,0.00,NULL,'App Active','2026-10-13 03:06:51','2026-10-13 03:06:51','2026-10-13 03:06:51'),(745,3,22.2014000,71.4950827,6.73,NULL,NULL,'App Active','2026-10-13 03:07:34','2026-10-13 03:07:34','2026-10-13 03:07:34'),(746,3,22.2014000,71.4950827,6.73,0.00,186.02,'App Active','2026-10-13 03:07:46','2026-10-13 03:07:46','2026-10-13 03:07:46'),(747,3,22.2014000,71.4950827,6.73,0.00,186.02,'App Active','2026-10-13 03:07:46','2026-10-13 03:07:46','2026-10-13 03:07:46'),(748,3,22.2013133,71.4950370,3.00,1.00,90.00,'App Active','2026-10-13 03:08:44','2026-10-13 03:08:44','2026-10-13 03:08:44'),(749,3,22.2013149,71.4950386,4.09,1.00,90.00,'App Active','2026-10-13 03:08:44','2026-10-13 03:08:44','2026-10-13 03:08:44'),(750,3,22.2013242,71.4950457,8.72,0.00,37.17,'App Active','2026-10-13 03:08:45','2026-10-13 03:08:45','2026-10-13 03:08:45'),(751,3,22.2013133,71.4950370,3.00,1.00,90.00,'App Active','2026-10-13 03:08:45','2026-10-13 03:08:45','2026-10-13 03:08:45'),(752,3,22.2013149,71.4950386,4.09,1.00,90.00,'App Active','2026-10-13 03:08:45','2026-10-13 03:08:45','2026-10-13 03:08:45'),(753,3,22.2013361,71.4950876,3.00,0.00,NULL,'App Active','2026-10-13 03:08:47','2026-10-13 03:08:47','2026-10-13 03:08:47'),(754,3,22.2013242,71.4950457,8.72,0.00,37.17,'App Active','2026-10-13 03:08:47','2026-10-13 03:08:47','2026-10-13 03:08:47'),(755,3,22.2013660,71.4950789,3.00,0.00,353.40,'App Active','2026-10-13 03:08:55','2026-10-13 03:08:55','2026-10-13 03:08:55'),(756,3,22.2013592,71.4950750,3.20,2.00,89.72,'App Active','2026-10-13 03:09:02','2026-10-13 03:09:02','2026-10-13 03:09:02'),(757,3,22.2013301,71.4951025,3.01,1.00,44.46,'App Active','2026-10-13 03:09:18','2026-10-13 03:09:18','2026-10-13 03:09:18'),(758,3,22.2014020,71.4950971,3.00,1.00,357.98,'App Active','2026-10-13 03:09:33','2026-10-13 03:09:33','2026-10-13 03:09:33'),(759,3,22.2013818,71.4950805,3.00,2.00,216.18,'App Active','2026-10-13 03:09:49','2026-10-13 03:09:49','2026-10-13 03:09:49'),(760,3,22.2013600,71.4950670,3.00,0.00,NULL,'App Active','2026-10-13 03:10:04','2026-10-13 03:10:04','2026-10-13 03:10:04'),(761,3,22.2013613,71.4950554,3.00,0.00,NULL,'App Active','2026-10-13 03:10:19','2026-10-13 03:10:19','2026-10-13 03:10:19'),(762,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-13 03:17:50','2026-10-13 03:17:50','2026-10-13 03:17:50'),(763,3,22.2014178,71.4950742,3.66,0.00,213.01,'App Active','2026-10-13 03:18:06','2026-10-13 03:18:06','2026-10-13 03:18:06'),(764,3,22.2014058,71.4950647,3.00,0.00,218.24,'App Active','2026-10-13 03:18:19','2026-10-13 03:18:19','2026-10-13 03:18:19'),(765,3,22.2014058,71.4950647,3.00,0.00,218.24,'App Active','2026-10-13 03:18:19','2026-10-13 03:18:19','2026-10-13 03:18:19'),(766,3,22.2014057,71.4950750,3.00,0.00,NULL,'App Active','2026-10-13 03:18:29','2026-10-13 03:18:29','2026-10-13 03:18:29'),(767,3,22.2014057,71.4950750,3.00,0.00,NULL,'App Active','2026-10-13 03:18:29','2026-10-13 03:18:29','2026-10-13 03:18:29'),(768,3,22.2013930,71.4950529,3.00,1.00,259.18,'App Active','2026-10-13 03:18:45','2026-10-13 03:18:45','2026-10-13 03:18:45'),(769,3,22.2014063,71.4950563,3.00,1.00,334.37,'App Active','2026-10-13 03:19:00','2026-10-13 03:19:00','2026-10-13 03:19:00'),(770,3,22.2014073,71.4950611,3.00,0.00,NULL,'App Active','2026-10-13 03:19:16','2026-10-13 03:19:16','2026-10-13 03:19:16'),(771,3,22.2015061,71.4947879,7.86,0.00,NULL,'App Active','2026-10-13 05:51:57','2026-10-13 05:51:57','2026-10-13 05:51:57'),(772,3,22.2015863,71.4947195,3.00,1.00,105.44,'App Active','2026-10-13 05:52:13','2026-10-13 05:52:13','2026-10-13 05:52:13'),(773,3,22.2015567,71.4947702,3.00,0.00,NULL,'App Active','2026-10-13 05:52:29','2026-10-13 05:52:29','2026-10-13 05:52:29'),(774,3,22.2015467,71.4947817,3.90,0.00,NULL,'App Active','2026-10-13 05:53:44','2026-10-13 05:53:44','2026-10-13 05:53:44'),(775,3,22.2015482,71.4947875,3.41,2.00,347.90,'App Active','2026-10-13 05:54:06','2026-10-13 05:54:06','2026-10-13 05:54:06'),(776,3,22.2015946,71.4947952,3.00,1.00,16.16,'App Active','2026-10-13 05:54:14','2026-10-13 05:54:14','2026-10-13 05:54:14'),(777,3,22.2015882,71.4948047,3.00,NULL,NULL,'App Active','2026-10-13 05:54:54','2026-10-13 05:54:54','2026-10-13 05:54:54'),(778,3,22.2015882,71.4948047,3.00,0.00,NULL,'App Active','2026-10-13 05:55:22','2026-10-13 05:55:22','2026-10-13 05:55:22'),(779,3,22.2015882,71.4948047,3.00,0.00,NULL,'App Active','2026-10-13 05:55:22','2026-10-13 05:55:22','2026-10-13 05:55:22'),(780,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 05:56:30','2026-10-13 05:56:30','2026-10-13 05:56:30'),(781,3,22.1796437,71.6583024,35.00,NULL,NULL,'App Active','2026-10-13 05:57:09','2026-10-13 05:57:09','2026-10-13 05:57:09'),(782,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:57:27','2026-10-13 05:57:27','2026-10-13 05:57:27'),(783,3,22.1796437,71.6583024,35.00,NULL,NULL,'App Active','2026-10-13 05:57:27','2026-10-13 05:57:27','2026-10-13 05:57:27'),(784,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:08','2026-10-13 05:58:08','2026-10-13 05:58:08'),(785,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:08','2026-10-13 05:58:08','2026-10-13 05:58:08'),(786,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:08','2026-10-13 05:58:08','2026-10-13 05:58:08'),(787,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:21','2026-10-13 05:58:21','2026-10-13 05:58:21'),(788,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:22','2026-10-13 05:58:22','2026-10-13 05:58:22'),(789,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:53','2026-10-13 05:58:53','2026-10-13 05:58:53'),(790,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:58:53','2026-10-13 05:58:53','2026-10-13 05:58:53'),(791,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 05:59:19','2026-10-13 05:59:19','2026-10-13 05:59:19'),(792,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 05:59:20','2026-10-13 05:59:20','2026-10-13 05:59:20'),(793,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 05:59:59','2026-10-13 05:59:59','2026-10-13 05:59:59'),(794,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 05:59:59','2026-10-13 05:59:59','2026-10-13 05:59:59'),(795,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 05:59:59','2026-10-13 05:59:59','2026-10-13 05:59:59'),(796,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:00:58','2026-10-13 06:00:58','2026-10-13 06:00:58'),(797,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:00:58','2026-10-13 06:00:58','2026-10-13 06:00:58'),(798,3,22.1796427,71.6582987,35.00,NULL,NULL,'App Active','2026-10-13 06:01:23','2026-10-13 06:01:23','2026-10-13 06:01:23'),(799,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:01:23','2026-10-13 06:01:23','2026-10-13 06:01:23'),(800,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:02:12','2026-10-13 06:02:12','2026-10-13 06:02:12'),(801,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:02:27','2026-10-13 06:02:27','2026-10-13 06:02:27'),(802,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:02:27','2026-10-13 06:02:27','2026-10-13 06:02:27'),(803,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:03:06','2026-10-13 06:03:06','2026-10-13 06:03:06'),(804,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:04:10','2026-10-13 06:04:10','2026-10-13 06:04:10'),(805,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:12','2026-10-13 06:05:12','2026-10-13 06:05:12'),(806,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:12','2026-10-13 06:05:12','2026-10-13 06:05:12'),(807,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:13','2026-10-13 06:05:13','2026-10-13 06:05:13'),(808,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:42','2026-10-13 06:05:42','2026-10-13 06:05:42'),(809,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:51','2026-10-13 06:05:51','2026-10-13 06:05:51'),(810,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:05:51','2026-10-13 06:05:51','2026-10-13 06:05:51'),(811,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:37','2026-10-13 06:14:37','2026-10-13 06:14:37'),(812,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:37','2026-10-13 06:14:37','2026-10-13 06:14:37'),(813,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:49','2026-10-13 06:14:49','2026-10-13 06:14:49'),(814,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:49','2026-10-13 06:14:49','2026-10-13 06:14:49'),(815,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:51','2026-10-13 06:14:51','2026-10-13 06:14:51'),(816,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:14:55','2026-10-13 06:14:55','2026-10-13 06:14:55'),(817,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:15:36','2026-10-13 06:15:36','2026-10-13 06:15:36'),(818,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:16:23','2026-10-13 06:16:23','2026-10-13 06:16:23'),(819,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:16:23','2026-10-13 06:16:23','2026-10-13 06:16:23'),(820,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:16:23','2026-10-13 06:16:23','2026-10-13 06:16:23'),(821,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:16:47','2026-10-13 06:16:47','2026-10-13 06:16:47'),(822,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:16:47','2026-10-13 06:16:47','2026-10-13 06:16:47'),(823,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:08','2026-10-13 06:17:08','2026-10-13 06:17:08'),(824,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:08','2026-10-13 06:17:08','2026-10-13 06:17:08'),(825,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:38','2026-10-13 06:17:38','2026-10-13 06:17:38'),(826,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:38','2026-10-13 06:17:38','2026-10-13 06:17:38'),(827,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:38','2026-10-13 06:17:38','2026-10-13 06:17:38'),(828,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:52','2026-10-13 06:17:52','2026-10-13 06:17:52'),(829,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:17:53','2026-10-13 06:17:53','2026-10-13 06:17:53'),(830,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:18:36','2026-10-13 06:18:36','2026-10-13 06:18:36'),(831,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:19:03','2026-10-13 06:19:03','2026-10-13 06:19:03'),(832,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:19:46','2026-10-13 06:19:46','2026-10-13 06:19:46'),(833,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:19:47','2026-10-13 06:19:47','2026-10-13 06:19:47'),(834,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:21:02','2026-10-13 06:21:02','2026-10-13 06:21:02'),(835,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:21:02','2026-10-13 06:21:02','2026-10-13 06:21:02'),(836,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:21:03','2026-10-13 06:21:03','2026-10-13 06:21:03'),(837,3,22.1796427,71.6582986,35.00,NULL,NULL,'App Active','2026-10-13 06:21:40','2026-10-13 06:21:40','2026-10-13 06:21:40'),(838,3,22.1796427,71.6582986,35.00,NULL,NULL,'App Active','2026-10-13 06:21:40','2026-10-13 06:21:40','2026-10-13 06:21:40'),(839,3,22.1796427,71.6582986,35.00,NULL,NULL,'App Active','2026-10-13 06:21:40','2026-10-13 06:21:40','2026-10-13 06:21:40'),(840,3,22.1796437,71.6583025,35.00,NULL,NULL,'App Active','2026-10-13 06:21:42','2026-10-13 06:21:42','2026-10-13 06:21:42'),(841,3,22.1796437,71.6583025,35.00,NULL,NULL,'App Active','2026-10-13 06:21:45','2026-10-13 06:21:45','2026-10-13 06:21:45'),(842,3,22.1796437,71.6583025,35.00,NULL,NULL,'App Active','2026-10-13 06:21:52','2026-10-13 06:21:52','2026-10-13 06:21:52'),(843,3,22.1796437,71.6583025,35.00,NULL,NULL,'App Active','2026-10-13 06:21:52','2026-10-13 06:21:52','2026-10-13 06:21:52'),(844,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:22:59','2026-10-13 06:22:59','2026-10-13 06:22:59'),(845,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:22:59','2026-10-13 06:22:59','2026-10-13 06:22:59'),(846,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:22:59','2026-10-13 06:22:59','2026-10-13 06:22:59'),(847,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:23:01','2026-10-13 06:23:01','2026-10-13 06:23:01'),(848,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:23:04','2026-10-13 06:23:04','2026-10-13 06:23:04'),(849,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:23:07','2026-10-13 06:23:07','2026-10-13 06:23:07'),(850,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:23:08','2026-10-13 06:23:08','2026-10-13 06:23:08'),(851,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:03','2026-10-13 06:24:03','2026-10-13 06:24:03'),(852,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:03','2026-10-13 06:24:03','2026-10-13 06:24:03'),(853,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:04','2026-10-13 06:24:04','2026-10-13 06:24:04'),(854,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:05','2026-10-13 06:24:05','2026-10-13 06:24:05'),(855,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:54','2026-10-13 06:24:54','2026-10-13 06:24:54'),(856,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:24:54','2026-10-13 06:24:54','2026-10-13 06:24:54'),(857,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:25:34','2026-10-13 06:25:34','2026-10-13 06:25:34'),(858,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:25:35','2026-10-13 06:25:35','2026-10-13 06:25:35'),(859,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:30:05','2026-10-13 06:30:05','2026-10-13 06:30:05'),(860,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:30:05','2026-10-13 06:30:05','2026-10-13 06:30:05'),(861,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:30:05','2026-10-13 06:30:05','2026-10-13 06:30:05'),(862,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:30:09','2026-10-13 06:30:09','2026-10-13 06:30:09'),(863,3,22.1796051,71.6581341,35.00,NULL,NULL,'App Active','2026-10-13 06:30:51','2026-10-13 06:30:51','2026-10-13 06:30:51'),(864,3,22.1796051,71.6581341,35.00,NULL,NULL,'App Active','2026-10-13 06:31:20','2026-10-13 06:31:20','2026-10-13 06:31:20'),(865,3,22.1796051,71.6581341,35.00,NULL,NULL,'App Active','2026-10-13 06:31:20','2026-10-13 06:31:20','2026-10-13 06:31:20'),(866,3,22.1796051,71.6581341,35.00,NULL,NULL,'App Active','2026-10-13 06:31:20','2026-10-13 06:31:20','2026-10-13 06:31:20'),(867,3,22.1796108,71.6581585,35.00,NULL,NULL,'App Active','2026-10-13 06:31:51','2026-10-13 06:31:51','2026-10-13 06:31:51'),(868,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:36:15','2026-10-13 06:36:15','2026-10-13 06:36:15'),(869,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:41:46','2026-10-13 06:41:46','2026-10-13 06:41:46'),(870,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:41:46','2026-10-13 06:41:46','2026-10-13 06:41:46'),(871,3,22.1796436,71.6583023,35.00,NULL,NULL,'App Active','2026-10-13 06:41:46','2026-10-13 06:41:46','2026-10-13 06:41:46'),(872,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:43:21','2026-10-13 06:43:21','2026-10-13 06:43:21'),(873,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:43:21','2026-10-13 06:43:21','2026-10-13 06:43:21'),(874,3,22.1796398,71.6582870,35.00,NULL,NULL,'App Active','2026-10-13 06:43:21','2026-10-13 06:43:21','2026-10-13 06:43:21'),(875,3,22.2014717,71.4951583,7.80,1.00,325.60,'App Active','2026-10-14 03:41:54','2026-10-14 03:41:54','2026-10-14 03:41:54'),(876,3,22.2014717,71.4951583,8.66,NULL,NULL,'App Active','2026-10-14 03:42:20','2026-10-14 03:42:20','2026-10-14 03:42:20'),(877,3,22.2015317,71.4951583,8.20,10.00,331.00,'App Active','2026-10-14 03:42:33','2026-10-14 03:42:33','2026-10-14 03:42:33'),(878,3,22.2015317,71.4951583,8.20,10.00,331.00,'App Active','2026-10-14 03:42:33','2026-10-14 03:42:33','2026-10-14 03:42:33'),(879,3,22.2015317,71.4951583,8.20,10.00,331.00,'App Active','2026-10-14 03:42:42','2026-10-14 03:42:42','2026-10-14 03:42:42'),(880,3,22.2017226,71.4952510,11.92,7.00,350.16,'App Active','2026-10-14 03:42:45','2026-10-14 03:42:45','2026-10-14 03:42:45'),(881,3,22.2017767,71.4953467,6.90,23.00,339.00,'App Active','2026-10-14 03:43:09','2026-10-14 03:43:09','2026-10-14 03:43:09'),(882,3,22.2017767,71.4953467,6.90,23.00,339.00,'App Active','2026-10-14 03:43:09','2026-10-14 03:43:09','2026-10-14 03:43:09'),(883,3,22.2016859,71.4950811,7.70,29.00,154.50,'App Active','2026-10-14 03:43:26','2026-10-14 03:43:26','2026-10-14 03:43:26'),(884,3,22.2016859,71.4950811,7.70,29.00,154.50,'App Active','2026-10-14 03:43:26','2026-10-14 03:43:26','2026-10-14 03:43:26'),(885,3,22.2016859,71.4950811,7.70,29.00,154.50,'App Active','2026-10-14 03:43:50','2026-10-14 03:43:50','2026-10-14 03:43:50'),(886,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-14 03:44:01','2026-10-14 03:44:01','2026-10-14 03:44:01'),(887,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-14 03:44:01','2026-10-14 03:44:01','2026-10-14 03:44:01'),(888,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-14 03:44:10','2026-10-14 03:44:10','2026-10-14 03:44:10'),(889,3,22.2007789,71.4951716,92.90,NULL,NULL,'App Active','2026-10-14 03:44:10','2026-10-14 03:44:10','2026-10-14 03:44:10'),(890,3,22.2007327,71.4952097,87.60,NULL,NULL,'App Active','2026-10-14 03:44:39','2026-10-14 03:44:39','2026-10-14 03:44:39'),(891,3,22.2007327,71.4952097,87.60,NULL,NULL,'App Active','2026-10-14 03:44:39','2026-10-14 03:44:39','2026-10-14 03:44:39'),(892,3,22.2007327,71.4952097,87.60,NULL,NULL,'App Active','2026-10-14 03:44:46','2026-10-14 03:44:46','2026-10-14 03:44:46'),(893,3,22.2007327,71.4952097,87.60,NULL,NULL,'App Active','2026-10-14 03:44:46','2026-10-14 03:44:46','2026-10-14 03:44:46'),(894,3,22.2014196,71.4951606,6.90,6.00,337.88,'App Active','2026-10-14 03:45:05','2026-10-14 03:45:05','2026-10-14 03:45:05'),(895,3,22.2014196,71.4951606,6.90,6.00,337.88,'App Active','2026-10-14 03:45:05','2026-10-14 03:45:05','2026-10-14 03:45:05'),(896,3,22.2014200,71.4951617,36.08,NULL,NULL,'App Active','2026-10-14 03:45:21','2026-10-14 03:45:21','2026-10-14 03:45:21'),(897,3,22.2014407,71.4950990,3.02,0.00,NULL,'App Active','2026-10-14 03:45:37','2026-10-14 03:45:37','2026-10-14 03:45:37'),(898,3,22.2009950,71.4950883,16.00,0.00,NULL,'App Active','2026-10-14 05:38:57','2026-10-14 05:38:57','2026-10-14 05:38:57'),(899,3,22.2013951,71.4950683,3.00,0.00,NULL,'App Active','2026-10-14 05:39:12','2026-10-14 05:39:12','2026-10-14 05:39:12'),(900,3,22.2007519,71.4952099,45.57,0.00,NULL,'App Active','2026-10-14 06:57:18','2026-10-14 06:57:18','2026-10-14 06:57:18'),(901,3,22.2007790,71.4955046,5.89,1.00,37.19,'App Active','2026-10-14 06:57:33','2026-10-14 06:57:33','2026-10-14 06:57:33'),(902,3,22.2008076,71.4955674,3.00,0.00,NULL,'App Active','2026-10-14 06:57:49','2026-10-14 06:57:49','2026-10-14 06:57:49'),(903,3,22.2009182,71.4955564,7.30,3.00,144.87,'App Active','2026-10-14 08:57:37','2026-10-14 08:57:37','2026-10-14 08:57:37'),(904,3,22.2009183,71.4955567,55.24,NULL,NULL,'App Active','2026-10-14 08:58:12','2026-10-14 08:58:12','2026-10-14 08:58:12'),(905,3,22.1937500,71.5009050,8.20,4.00,4.00,'App Active','2026-10-14 14:22:02','2026-10-14 14:22:02','2026-10-14 14:22:02'),(906,3,22.1936200,71.5011750,8.00,0.00,NULL,'App Active','2026-10-14 14:22:31','2026-10-14 14:22:31','2026-10-14 14:22:31'),(907,3,22.1938833,71.5014483,9.00,0.00,NULL,'App Active','2026-10-14 14:23:01','2026-10-14 14:23:01','2026-10-14 14:23:01'),(908,3,22.1938949,71.5013790,7.70,0.00,NULL,'App Active','2026-10-14 14:23:15','2026-10-14 14:23:15','2026-10-14 14:23:15'),(909,3,22.1937640,71.5011289,3.00,0.00,351.31,'App Active','2026-10-14 14:23:31','2026-10-14 14:23:31','2026-10-14 14:23:31'),(910,3,22.1937500,71.5012400,5.00,2.00,99.00,'App Active','2026-10-15 08:08:54','2026-10-15 08:08:54','2026-10-15 08:08:54'),(911,3,22.1937250,71.5010300,6.90,1.00,197.00,'App Active','2026-10-15 08:09:19','2026-10-15 08:09:19','2026-10-15 08:09:19'),(912,3,22.2009296,71.4948641,9.40,2.00,179.18,'App Active','2026-10-16 02:08:57','2026-10-16 02:08:57','2026-10-16 02:08:57'),(913,3,22.2009296,71.4948641,9.40,2.00,179.18,'App Active','2026-10-16 02:08:57','2026-10-16 02:08:57','2026-10-16 02:08:57'),(914,3,22.2010498,71.4948002,3.00,0.00,349.55,'App Active','2026-10-16 02:09:12','2026-10-16 02:09:12','2026-10-16 02:09:12'),(915,3,22.2010959,71.4948163,3.00,1.00,334.20,'App Active','2026-10-16 02:09:31','2026-10-16 02:09:31','2026-10-16 02:09:31'),(916,3,22.2011051,71.4948250,3.00,0.00,NULL,'App Active','2026-10-16 02:09:44','2026-10-16 02:09:44','2026-10-16 02:09:44'),(917,3,22.2010883,71.4948333,3.70,22.00,178.00,'App Active','2026-10-16 02:10:07','2026-10-16 02:10:07','2026-10-16 02:10:07'),(918,3,22.2010883,71.4948333,3.70,22.00,178.00,'App Active','2026-10-16 02:10:07','2026-10-16 02:10:07','2026-10-16 02:10:07'),(919,3,22.2009870,71.4948263,3.57,10.00,179.67,'App Active','2026-10-16 02:10:18','2026-10-16 02:10:18','2026-10-16 02:10:18'),(920,3,22.2009870,71.4948263,3.57,10.00,179.67,'App Active','2026-10-16 02:10:18','2026-10-16 02:10:18','2026-10-16 02:10:18'),(921,3,22.2010800,71.4947992,3.00,0.00,NULL,'App Active','2026-10-16 02:10:33','2026-10-16 02:10:33','2026-10-16 02:10:33'),(922,3,22.2011409,71.4948002,3.00,2.00,357.62,'App Active','2026-10-16 02:10:48','2026-10-16 02:10:48','2026-10-16 02:10:48'),(923,3,22.2011256,71.4948094,3.00,0.00,NULL,'App Active','2026-10-16 02:11:03','2026-10-16 02:11:03','2026-10-16 02:11:03'),(924,3,22.2007799,71.4951711,87.60,NULL,NULL,'App Active','2026-10-16 09:15:29','2026-10-16 09:15:29','2026-10-16 09:15:29'),(925,3,22.2014153,71.4950577,3.00,0.00,NULL,'App Active','2026-10-16 09:15:47','2026-10-16 09:15:47','2026-10-16 09:15:47'),(926,3,22.2014876,71.4950806,3.00,1.00,41.85,'App Active','2026-10-16 09:15:59','2026-10-16 09:15:59','2026-10-16 09:15:59'),(927,3,22.2014895,71.4950867,3.00,0.00,NULL,'App Active','2026-10-16 09:16:14','2026-10-16 09:16:14','2026-10-16 09:16:14'),(928,3,22.2014893,71.4950877,3.00,0.00,NULL,'App Active','2026-10-16 09:16:30','2026-10-16 09:16:30','2026-10-16 09:16:30'),(929,3,22.2014886,71.4950874,3.00,0.00,NULL,'App Active','2026-10-16 09:16:45','2026-10-16 09:16:45','2026-10-16 09:16:45'),(930,3,22.2014817,71.4950572,3.00,0.00,NULL,'App Active','2026-10-16 09:17:01','2026-10-16 09:17:01','2026-10-16 09:17:01'),(931,3,22.2014646,71.4950472,3.00,0.00,NULL,'App Active','2026-10-16 09:17:17','2026-10-16 09:17:17','2026-10-16 09:17:17'),(932,3,22.2014585,71.4950459,3.00,0.00,NULL,'App Active','2026-10-16 09:17:32','2026-10-16 09:17:32','2026-10-16 09:17:32'),(933,3,22.2014564,71.4950461,3.00,0.00,NULL,'App Active','2026-10-16 09:17:47','2026-10-16 09:17:47','2026-10-16 09:17:47'),(934,3,22.2014551,71.4950462,3.00,0.00,NULL,'App Active','2026-10-16 09:18:03','2026-10-16 09:18:03','2026-10-16 09:18:03'),(935,3,22.2014555,71.4950476,3.00,0.00,NULL,'App Active','2026-10-16 09:18:18','2026-10-16 09:18:18','2026-10-16 09:18:18'),(936,3,22.2014574,71.4950475,3.00,0.00,NULL,'App Active','2026-10-16 09:18:34','2026-10-16 09:18:34','2026-10-16 09:18:34'),(937,3,22.2014588,71.4950462,3.00,0.00,NULL,'App Active','2026-10-16 09:18:49','2026-10-16 09:18:49','2026-10-16 09:18:49'),(938,3,22.2014422,71.4950474,3.00,0.00,NULL,'App Active','2026-10-16 09:19:05','2026-10-16 09:19:05','2026-10-16 09:19:05'),(939,3,22.2014376,71.4950488,3.00,0.00,NULL,'App Active','2026-10-16 09:19:20','2026-10-16 09:19:20','2026-10-16 09:19:20'),(940,3,22.2014366,71.4950499,3.00,0.00,NULL,'App Active','2026-10-16 09:19:35','2026-10-16 09:19:35','2026-10-16 09:19:35'),(941,3,22.2014364,71.4950499,3.00,0.00,NULL,'App Active','2026-10-16 09:19:51','2026-10-16 09:19:51','2026-10-16 09:19:51'),(942,3,22.2035683,71.4934317,8.80,27.00,311.00,'App Active','2026-10-16 11:06:37','2026-10-16 11:06:37','2026-10-16 11:06:37'),(943,3,22.2042185,71.4922254,1.73,36.00,305.11,'App Active','2026-10-16 11:06:53','2026-10-16 11:06:53','2026-10-16 11:06:53'),(944,3,22.2042185,71.4922254,1.73,NULL,NULL,'App Active','2026-10-16 11:07:18','2026-10-16 11:07:18','2026-10-16 11:07:18'),(945,3,22.2042185,71.4922254,1.73,NULL,NULL,'App Active','2026-10-16 11:07:49','2026-10-16 11:07:49','2026-10-16 11:07:49');
/*!40000 ALTER TABLE `employee_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_salary_rates`
--

DROP TABLE IF EXISTS `employee_salary_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_salary_rates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `effective_month` date NOT NULL,
  `monthly_salary` decimal(12,2) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salary_rate_employee_month_unique` (`employee_id`,`effective_month`),
  KEY `employee_salary_rates_created_by_foreign` (`created_by`),
  KEY `salary_rate_month_employee_index` (`effective_month`,`employee_id`),
  CONSTRAINT `employee_salary_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_salary_rates_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_rates`
--

LOCK TABLES `employee_salary_rates` WRITE;
/*!40000 ALTER TABLE `employee_salary_rates` DISABLE KEYS */;
INSERT INTO `employee_salary_rates` VALUES (1,3,'2026-09-01',15000.00,4,'2026-09-22 08:57:18','2026-09-22 08:57:18'),(2,4,'2026-09-01',15000.00,4,'2026-09-22 08:58:15','2026-09-22 08:58:15'),(3,5,'2026-09-01',9000.00,4,'2026-09-22 10:18:29','2026-09-22 10:18:29'),(4,6,'2026-09-01',9000.00,4,'2026-09-22 10:21:18','2026-09-22 10:21:18');
/*!40000 ALTER TABLE `employee_salary_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `employee_code` varchar(50) NOT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `manager_attendance_only` tinyint(1) NOT NULL DEFAULT 0,
  `shift_start` time NOT NULL DEFAULT '09:00:00',
  `shift_end` time NOT NULL DEFAULT '18:00:00',
  `working_minutes` int(10) unsigned NOT NULL DEFAULT 480,
  `half_day_minutes` int(10) unsigned NOT NULL DEFAULT 240,
  `grace_minutes` int(10) unsigned NOT NULL DEFAULT 15,
  `weekly_offs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`weekly_offs`)),
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_user_id_unique` (`user_id`),
  UNIQUE KEY `employees_employee_code_unique` (`employee_code`),
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (3,7,'001','8200046176','election engineer','SNR','2026-07-01',1,0,'09:00:00','18:00:00',480,240,15,'[]','employee-profiles/QdZTUytcfWmjjqjfrlw8gNyYhvj5lA68PcamDkes.jpg','2026-09-20 12:05:38','2026-10-16 17:29:24'),(4,8,'002','8780634583','lebar','SNR','2026-07-11',1,1,'08:00:00','19:00:00',480,240,15,'[]',NULL,'2026-09-21 09:19:45','2026-09-21 15:58:56'),(5,9,'003','0000000000','lebar','SNR','2026-07-11',1,1,'08:00:00','18:00:00',480,240,15,'[]',NULL,'2026-09-21 09:21:25','2026-09-22 10:18:35'),(6,10,'004','00','Labour','Labour','2026-07-22',1,1,'09:00:00','18:00:00',480,240,15,'[]',NULL,'2026-09-22 10:21:04','2026-10-08 05:51:41');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_settlements`
--

DROP TABLE IF EXISTS `expense_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_settlements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `settled_on` date NOT NULL,
  `settled_at` timestamp NULL DEFAULT NULL,
  `from_company_id` bigint(20) unsigned NOT NULL,
  `to_company_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `settlement_type` varchar(30) NOT NULL DEFAULT 'full',
  `remaining_balance` decimal(15,2) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT 'bank_transfer',
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_settlements_from_company_id_foreign` (`from_company_id`),
  KEY `expense_settlements_to_company_id_foreign` (`to_company_id`),
  KEY `expense_settlements_created_by_foreign` (`created_by`),
  KEY `expense_settlements_pair_date_idx` (`settled_on`,`from_company_id`,`to_company_id`),
  CONSTRAINT `expense_settlements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expense_settlements_from_company_id_foreign` FOREIGN KEY (`from_company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `expense_settlements_to_company_id_foreign` FOREIGN KEY (`to_company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_settlements`
--

LOCK TABLES `expense_settlements` WRITE;
/*!40000 ALTER TABLE `expense_settlements` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_settlements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `holiday_date` date NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'full_day',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `holidays_holiday_date_unique` (`holiday_date`),
  KEY `holidays_created_by_foreign` (`created_by`),
  CONSTRAINT `holidays_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inverter_maintenance_logs`
--

DROP TABLE IF EXISTS `inverter_maintenance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inverter_maintenance_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `inverter_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `maintenance_type` varchar(255) NOT NULL DEFAULT 'fan_dust_cleaning',
  `cleaned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `next_due_date` date DEFAULT NULL,
  `performed_by_name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inverter_maintenance_logs_company_id_foreign` (`company_id`),
  KEY `inverter_maintenance_logs_inverter_id_foreign` (`inverter_id`),
  KEY `inverter_maintenance_logs_user_id_foreign` (`user_id`),
  KEY `inverter_maintenance_logs_maintenance_type_cleaned_at_index` (`maintenance_type`,`cleaned_at`),
  CONSTRAINT `inverter_maintenance_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `inverter_maintenance_logs_inverter_id_foreign` FOREIGN KEY (`inverter_id`) REFERENCES `inverters` (`id`) ON DELETE SET NULL,
  CONSTRAINT `inverter_maintenance_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inverter_maintenance_logs`
--

LOCK TABLES `inverter_maintenance_logs` WRITE;
/*!40000 ALTER TABLE `inverter_maintenance_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `inverter_maintenance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inverters`
--

DROP TABLE IF EXISTS `inverters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inverters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `device_type` varchar(20) NOT NULL DEFAULT '1',
  `point_id` varchar(50) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inverters_company_id_foreign` (`company_id`),
  CONSTRAINT `inverters_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inverters`
--

LOCK TABLES `inverters` WRITE;
/*!40000 ALTER TABLE `inverters` DISABLE KEYS */;
INSERT INTO `inverters` VALUES (1,1,'Inverter 1','INV-SG250-A101','1',NULL,1,'2026-09-18 06:17:15','2026-10-01 14:45:33'),(2,1,'Inverter 2','INV-SG250-A102','1',NULL,1,'2026-09-18 06:17:15','2026-10-01 14:45:33'),(3,2,'Inverter 1','INV-SG250-B201','1',NULL,1,'2026-09-18 06:17:15','2026-10-08 05:53:55'),(4,2,'Inverter 2','INV-SG250-B202','1',NULL,1,'2026-09-18 06:17:15','2026-10-01 14:45:33'),(5,2,'Inverter 3','INV-SG250-B203','1',NULL,1,'2026-09-18 06:17:15','2026-10-01 14:45:33'),(6,2,'Inverter 4','INV-SG250-B204','1',NULL,1,'2026-09-18 06:17:15','2026-10-01 14:45:33'),(7,3,'Inverter 1','INV-SG250-G301','1',NULL,1,'2026-09-18 06:17:16','2026-10-01 14:45:33'),(8,3,'Inverter 2','INV-SG250-G302','1',NULL,1,'2026-09-18 06:17:16','2026-10-01 14:45:33'),(9,3,'Inverter 3','INV-SG250-G303','1',NULL,1,'2026-09-18 06:17:16','2026-10-01 14:45:33'),(10,3,'Inverter 4','INV-SG250-G304','1',NULL,1,'2026-09-18 06:17:16','2026-10-01 14:45:33');
/*!40000 ALTER TABLE `inverters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isolarcloud_tokens`
--

DROP TABLE IF EXISTS `isolarcloud_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isolarcloud_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `access_token` text NOT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_type` varchar(255) NOT NULL DEFAULT 'bearer',
  `expires_in` int(10) unsigned DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `auth_user` varchar(255) DEFAULT NULL,
  `auth_ps_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_ps_list`)),
  `raw_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isolarcloud_tokens`
--

LOCK TABLES `isolarcloud_tokens` WRITE;
/*!40000 ALTER TABLE `isolarcloud_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `isolarcloud_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `leave_type_id` bigint(20) unsigned NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `day_part` varchar(20) NOT NULL DEFAULT 'full_day',
  `reason` text NOT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `reviewed_by` bigint(20) unsigned DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_requests_employee_id_foreign` (`employee_id`),
  KEY `leave_requests_leave_type_id_foreign` (`leave_type_id`),
  KEY `leave_requests_reviewed_by_foreign` (`reviewed_by`),
  KEY `leave_requests_status_date_from_date_to_index` (`status`,`date_from`,`date_to`),
  CONSTRAINT `leave_requests_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  CONSTRAINT `leave_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,3,4,'2026-09-26','2026-09-26','second_half','છોકરી જોવા માટે ગયો હતો',NULL,'approved',4,'2026-09-26 15:41:00','ok','2026-09-26 10:08:49','2026-09-26 10:11:00'),(2,3,4,'2026-10-04','2026-10-04','full_day','બહાર જવાનું છે',NULL,'approved',4,'2026-10-03 15:07:41','full day leave approve','2026-10-03 08:42:57','2026-10-03 09:37:41'),(3,3,4,'2026-10-15','2026-10-15','first_half','બહાર જવાનું છે',NULL,'rejected',4,'2026-10-16 18:22:50','not half day but full day leave','2026-10-14 14:20:11','2026-10-16 12:52:50'),(4,3,4,'2026-10-16','2026-10-16','second_half','બહાર જવાનું છે',NULL,'rejected',4,'2026-10-16 18:22:23','ok','2026-10-16 07:28:35','2026-10-16 12:52:23');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` VALUES (4,'General Leave',1,1,'2026-09-20 09:59:59','2026-09-20 09:59:59');
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_18_000003_create_solar_tables',1),(5,'2026_09_18_000004_add_permissions_and_audit_logs',1),(6,'2026_09_18_000005_add_logo_path_to_companies_table',1),(7,'2026_09_20_000006_create_employee_attendance_tables',2),(8,'2026_09_20_000007_add_attendance_breaks_and_employee_entry',3),(9,'2026_09_20_000008_add_return_selfie_to_attendance_breaks',4),(10,'2026_09_20_000009_create_stock_management_tables',4),(11,'2026_09_20_000010_create_shared_expense_tables',5),(12,'2026_09_21_000011_add_stock_permissions_to_employees',6),(13,'2026_09_21_000012_add_ss_reference_to_companies',6),(14,'2026_09_21_000013_add_manager_attendance_entry',6),(15,'2026_09_21_000014_create_employee_salary_tables',7),(16,'2026_10_01_000001_enhance_shared_expenses_and_settlements',8),(17,'2026_10_01_000002_enhance_salary_adjustments_table',8),(18,'2026_10_01_095709_create_isolarcloud_tables',8),(19,'2026_10_01_104604_add_plant_location_to_companies_table',8),(20,'2026_10_01_000020_create_push_subscriptions_table',9),(21,'2026_10_01_200000_seed_default_inverter_serials',10),(22,'2026_10_01_225443_create_plant_photo_tasks_and_photos_tables',11),(23,'2026_10_02_090528_add_owner_fields_to_companies_table',11),(24,'2026_10_02_170000_create_push_subscriptions_table',11),(25,'2026_10_02_170001_create_employee_locations_table',11),(26,'2026_10_03_144500_create_plant_reels_table',11),(27,'2026_10_03_172500_create_solar_curtailments_table',11),(28,'2026_10_04_153000_create_inverter_maintenance_logs_table',12),(29,'2026_10_10_164241_add_break_type_to_attendance_breaks_table',12),(30,'2026_10_10_203000_add_device_and_ip_to_activity_logs_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_photo_tasks`
--

DROP TABLE IF EXISTS `plant_photo_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_photo_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `required_photos` smallint(5) unsigned NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plant_photo_tasks_company_id_foreign` (`company_id`),
  CONSTRAINT `plant_photo_tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_photo_tasks`
--

LOCK TABLES `plant_photo_tasks` WRITE;
/*!40000 ALTER TABLE `plant_photo_tasks` DISABLE KEYS */;
INSERT INTO `plant_photo_tasks` VALUES (1,'Morning Inverter & Combiner Box Check','11:00:00','12:00:00',2,'Morning inspection of plant inverters, ACDB/DCDB boxes, and generation flow.',NULL,1,1,'2026-10-02 02:43:50','2026-10-02 02:43:50'),(2,'Noon Solar Tables & Panel Soiling Inspection','13:00:00','14:00:00',3,'Peak sunshine check on solar tables, dust/soiling condition, and physical array integrity.',NULL,1,2,'2026-10-02 02:43:50','2026-10-02 02:43:50'),(5,'Task','11:00:00','12:00:00',2,NULL,NULL,1,0,'2026-10-02 02:44:50','2026-10-02 02:44:50');
/*!40000 ALTER TABLE `plant_photo_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_photos`
--

DROP TABLE IF EXISTS `plant_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plant_photos_task_id_foreign` (`task_id`),
  KEY `plant_photos_employee_id_foreign` (`employee_id`),
  KEY `plant_photos_company_id_foreign` (`company_id`),
  KEY `plant_photos_captured_at_company_id_index` (`captured_at`,`company_id`),
  CONSTRAINT `plant_photos_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plant_photos_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plant_photos_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `plant_photo_tasks` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_photos`
--

LOCK TABLES `plant_photos` WRITE;
/*!40000 ALTER TABLE `plant_photos` DISABLE KEYS */;
INSERT INTO `plant_photos` VALUES (1,1,3,1,'plant_photos/2026/10/solar_sunset_1.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Inspection of Solar Array & Sunset Horizon Alignment','2026-10-16 17:27:19','2026-10-16 17:27:19'),(2,2,3,1,'plant_photos/2026/10/solar_sunset_2.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Ground-mounted Photovoltaic Tracking Inspection','2026-10-16 17:27:19','2026-10-16 17:27:19'),(3,1,4,2,'plant_photos/2026/10/solar_sunset_3.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Golden Hour Solar Panel Cleanliness & Azimuth Check','2026-10-16 17:27:19','2026-10-16 17:27:19'),(4,2,4,2,'plant_photos/2026/10/solar_sunset_4.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Inverter Combiner DC Array Reflection Verification','2026-10-16 17:27:19','2026-10-16 17:27:19'),(5,1,5,3,'plant_photos/2026/10/solar_sunset_5.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Evening Sunset Solar Panel Surface Quality Check','2026-10-16 17:27:19','2026-10-16 17:27:19'),(6,2,6,3,'plant_photos/2026/10/solar_sunset_6.jpg','2026-10-16 17:31:35',22.1704000,71.6684000,'Solar Park, Sector 4, Gujarat, India','Substation Feeder Solar Structure Overview','2026-10-16 17:27:19','2026-10-16 17:27:19');
/*!40000 ALTER TABLE `plant_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_reels`
--

DROP TABLE IF EXISTS `plant_reels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_reels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Plant Reel',
  `caption` text DEFAULT NULL,
  `video_path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) NOT NULL DEFAULT 'solar_hero',
  `music_title` varchar(255) NOT NULL DEFAULT 'Trending Beats',
  `duration_seconds` smallint(5) unsigned NOT NULL DEFAULT 15,
  `likes_count` int(10) unsigned NOT NULL DEFAULT 0,
  `views_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plant_reels_user_id_foreign` (`user_id`),
  KEY `plant_reels_employee_id_foreign` (`employee_id`),
  KEY `plant_reels_company_id_created_at_index` (`company_id`,`created_at`),
  CONSTRAINT `plant_reels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `plant_reels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `plant_reels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_reels`
--

LOCK TABLES `plant_reels` WRITE;
/*!40000 ALTER TABLE `plant_reels` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_reels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_subscriptions`
--

DROP TABLE IF EXISTS `push_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `endpoint` text NOT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `content_encoding` varchar(255) NOT NULL DEFAULT 'aesgcm',
  `notify_readings` tinyint(1) NOT NULL DEFAULT 1,
  `notify_attendance` tinyint(1) NOT NULL DEFAULT 1,
  `notify_expenses` tinyint(1) NOT NULL DEFAULT 1,
  `notify_salaries` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_subscriptions_user_id_foreign` (`user_id`),
  CONSTRAINT `push_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_subscriptions`
--

LOCK TABLES `push_subscriptions` WRITE;
/*!40000 ALTER TABLE `push_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_adjustments`
--

DROP TABLE IF EXISTS `salary_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `salary_month` date NOT NULL,
  `work_date` date DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reason` text NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `add_to_shared_expenses` tinyint(1) NOT NULL DEFAULT 0,
  `shared_expense_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `replaces_adjustment_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_adjustments_created_by_foreign` (`created_by`),
  KEY `salary_adjustments_cancelled_by_foreign` (`cancelled_by`),
  KEY `salary_adjustments_replaces_adjustment_id_foreign` (`replaces_adjustment_id`),
  KEY `salary_adjustment_employee_month_index` (`employee_id`,`salary_month`),
  KEY `salary_adjustment_month_status_index` (`salary_month`,`cancelled_at`),
  KEY `salary_adjustments_company_id_foreign` (`company_id`),
  KEY `salary_adjustments_shared_expense_id_foreign` (`shared_expense_id`),
  CONSTRAINT `salary_adjustments_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_adjustments_replaces_adjustment_id_foreign` FOREIGN KEY (`replaces_adjustment_id`) REFERENCES `salary_adjustments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_shared_expense_id_foreign` FOREIGN KEY (`shared_expense_id`) REFERENCES `shared_expenses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_adjustments`
--

LOCK TABLES `salary_adjustments` WRITE;
/*!40000 ALTER TABLE `salary_adjustments` DISABLE KEYS */;
INSERT INTO `salary_adjustments` VALUES (1,3,'2026-10-01','2026-10-08','deduction',250.00,'Half day (bapor pa6i raja per hato tena dada ne tya badad pa6o thayo hato tya gayo hato)',NULL,0,NULL,4,NULL,NULL,NULL,NULL,'2026-10-11 04:50:27','2026-10-11 04:50:27'),(2,3,'2026-10-01','2026-10-08','deduction',250.00,'Half day ( bapor pa6i raja per hato tena dada ne tya badad pa6o thayo hato tya gayo hato)',NULL,0,NULL,4,NULL,NULL,NULL,NULL,'2026-10-12 06:17:46','2026-10-12 06:17:46');
/*!40000 ALTER TABLE `salary_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('78IrYNeMsJUB1kL0Ncq35L3a5E48zV4sHVHDA6JO',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmR3RkRNaElyekRZODNLTWtTUm8wRHlYaFhHNGcyZTdMZGRCUUZUMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdm9pY2UtYWdlbnQvZW1lcmdlbmN5LXN0YXR1cyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792171911);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_expense_allocations`
--

DROP TABLE IF EXISTS `shared_expense_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_expense_allocations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shared_expense_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `share_amount` decimal(15,2) NOT NULL,
  `amount_paid` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shared_expense_allocations_shared_expense_id_company_id_unique` (`shared_expense_id`,`company_id`),
  KEY `shared_expense_allocations_company_id_shared_expense_id_index` (`company_id`,`shared_expense_id`),
  CONSTRAINT `shared_expense_allocations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `shared_expense_allocations_shared_expense_id_foreign` FOREIGN KEY (`shared_expense_id`) REFERENCES `shared_expenses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_expense_allocations`
--

LOCK TABLES `shared_expense_allocations` WRITE;
/*!40000 ALTER TABLE `shared_expense_allocations` DISABLE KEYS */;
INSERT INTO `shared_expense_allocations` VALUES (1,1,1,22.16,4099.60,4099.60,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(2,1,2,39.69,7342.65,7342.65,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(3,1,3,38.15,7057.75,7057.75,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(4,2,1,22.16,5362.72,5362.72,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(5,2,2,39.69,9604.98,9604.98,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(6,2,3,38.15,9232.30,9232.30,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(7,3,1,22.16,3722.88,3722.88,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(8,3,2,39.69,6667.92,6667.92,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(9,3,3,38.15,6409.20,6409.20,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(10,4,1,22.16,2094.12,2094.12,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(11,4,2,39.69,3750.71,3750.71,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(12,4,3,38.15,3605.18,3605.18,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(13,5,1,22.16,2725.68,2725.68,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(14,5,2,39.69,4881.87,4881.87,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(15,5,3,38.15,4692.45,4692.45,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(16,6,1,22.16,6980.40,6980.40,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(17,6,2,39.69,12502.35,12502.35,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(18,6,3,38.15,12017.25,12017.25,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(19,7,1,22.16,1728.48,1728.48,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(20,7,2,39.69,3095.82,3095.82,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(21,7,3,38.15,2975.70,2975.70,'2026-10-16 17:27:19','2026-10-16 17:27:19');
/*!40000 ALTER TABLE `shared_expense_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_expenses`
--

DROP TABLE IF EXISTS `shared_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `payer_company_id` bigint(20) unsigned NOT NULL,
  `purchaser_name` varchar(150) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `receipt_path` varchar(255) DEFAULT NULL,
  `entry_type` varchar(30) NOT NULL DEFAULT 'expense',
  `allocation_scope` varchar(50) NOT NULL DEFAULT 'all',
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `reverses_expense_id` bigint(20) unsigned DEFAULT NULL,
  `locked_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_expenses_reverses_expense_id_foreign` (`reverses_expense_id`),
  KEY `shared_expenses_cancelled_by_foreign` (`cancelled_by`),
  KEY `shared_expenses_created_by_foreign` (`created_by`),
  KEY `shared_expenses_updated_by_foreign` (`updated_by`),
  KEY `shared_expenses_expense_date_status_index` (`expense_date`,`status`),
  KEY `shared_expenses_payer_company_id_expense_date_index` (`payer_company_id`,`expense_date`),
  CONSTRAINT `shared_expenses_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shared_expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shared_expenses_payer_company_id_foreign` FOREIGN KEY (`payer_company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `shared_expenses_reverses_expense_id_foreign` FOREIGN KEY (`reverses_expense_id`) REFERENCES `shared_expenses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shared_expenses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_expenses`
--

LOCK TABLES `shared_expenses` WRITE;
/*!40000 ALTER TABLE `shared_expenses` DISABLE KEYS */;
INSERT INTO `shared_expenses` VALUES (1,'2026-10-01',1,'Site Procurement Manager','Solar Panel Cleaning Equipment & High-Pressure Wipers',18500.00,'Routine Monthly Maintenance',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(2,'2026-10-03',2,'Site Operations Head','Inverter Cooling Fan Replacement & Filter Cartridges',24200.00,'Preventive Maintenance',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(3,'2026-10-05',3,'Electrical Supervisor','HT Panel Earthing Cable & Copper Busbar Kit',16800.00,'Substation Safety Compliance',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(4,'2026-10-08',1,'Site Procurement Manager','Plant Security Lighting & Automated Solar Sensor Floods',9450.00,'Perimeter Security Upgrade',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(5,'2026-10-10',2,'Site Operations Head','Digital Clamp Meter & Insulation Resistance Tester',12300.00,'Telemetry Tools',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(6,'2026-10-12',3,'Electrical Supervisor','Transformer Oil Dehydration & Testing Kit',31500.00,'Quarterly Substation Servicing',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19'),(7,'2026-10-15',1,'Site Procurement Manager','Grass Cutting & Vegetation Management Machine Service',7800.00,'Ground Maintenance',NULL,'expense','all','active',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-16 17:27:19','2026-10-16 17:27:19');
/*!40000 ALTER TABLE `shared_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solar_curtailments`
--

DROP TABLE IF EXISTS `solar_curtailments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solar_curtailments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `percentage` int(11) NOT NULL DEFAULT 20,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `inverter_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`inverter_ids`)),
  `pv_strings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pv_strings`)),
  `step_history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`step_history`)),
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ended_at` timestamp NULL DEFAULT NULL,
  `duration_minutes` int(11) NOT NULL DEFAULT 0,
  `total_lost_kwh` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_lost_revenue_rs` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `solar_curtailments_user_id_foreign` (`user_id`),
  KEY `solar_curtailments_company_id_status_index` (`company_id`,`status`),
  KEY `solar_curtailments_started_at_index` (`started_at`),
  CONSTRAINT `solar_curtailments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solar_curtailments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solar_curtailments`
--

LOCK TABLES `solar_curtailments` WRITE;
/*!40000 ALTER TABLE `solar_curtailments` DISABLE KEYS */;
INSERT INTO `solar_curtailments` VALUES (1,1,4,30,'completed','[1, 2]','[\"PV1\", \"PV2\", \"PV3\", \"PV4\", \"PV5\", \"PV6\", \"PV7\", \"PV8\", \"PV9\", \"PV10\", \"PV11\", \"PV12\", \"PV13\", \"PV14\", \"PV15\", \"PV16\"]','[{\"changed_at\": \"2026-10-08T10:50:32+05:30\", \"changed_by\": \"Super Admin\", \"to_percentage\": 30, \"from_percentage\": 0, \"changed_at_human\": \"10:50 AM\"}, {\"action\": \"100% Full Power Restored\", \"changed_at\": \"2026-10-08T10:51:04+05:30\", \"changed_by\": \"Super Admin\", \"to_percentage\": 0, \"from_percentage\": 30, \"changed_at_human\": \"10:51 AM\"}]','2026-10-08 05:20:32','2026-10-08 05:21:04',1,1.90,7.22,'PGVCL Curtailment Order','2026-10-08 05:20:32','2026-10-08 05:21:04');
/*!40000 ALTER TABLE `solar_curtailments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_borrowings`
--

DROP TABLE IF EXISTS `stock_borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_borrowings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_item_id` bigint(20) unsigned NOT NULL,
  `borrower_name` varchar(150) NOT NULL,
  `borrower_mobile` varchar(30) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `returned_quantity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `borrowed_on` date NOT NULL,
  `expected_return_date` date DEFAULT NULL,
  `given_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_borrowings_given_by_user_id_foreign` (`given_by_user_id`),
  KEY `stock_borrowings_created_by_foreign` (`created_by`),
  KEY `stock_borrowings_status_borrowed_on_index` (`status`,`borrowed_on`),
  KEY `stock_borrowings_stock_item_id_status_index` (`stock_item_id`,`status`),
  CONSTRAINT `stock_borrowings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_borrowings_given_by_user_id_foreign` FOREIGN KEY (`given_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_borrowings_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_borrowings`
--

LOCK TABLES `stock_borrowings` WRITE;
/*!40000 ALTER TABLE `stock_borrowings` DISABLE KEYS */;
INSERT INTO `stock_borrowings` VALUES (1,1,'lalo','78878786',1.00,1.00,'2026-09-20','2026-09-20',7,4,'returned','4 divsh','2026-09-20 12:34:31','2026-09-20 12:34:45'),(2,3,'Hariom','9824256982',45.00,45.00,'2026-09-21','2026-09-23',7,4,'returned','Returns 4 day','2026-09-21 07:07:24','2026-09-21 07:08:04');
/*!40000 ALTER TABLE `stock_borrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_items`
--

DROP TABLE IF EXISTS `stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_quantity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `low_stock_threshold` decimal(15,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_items_name_unique` (`name`),
  KEY `stock_items_created_by_foreign` (`created_by`),
  KEY `stock_items_updated_by_foreign` (`updated_by`),
  KEY `stock_items_active_name_index` (`active`,`name`),
  CONSTRAINT `stock_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_items`
--

LOCK TABLES `stock_items` WRITE;
/*!40000 ALTER TABLE `stock_items` DISABLE KEYS */;
INSERT INTO `stock_items` VALUES (1,'પકડ','stock-items/MZQy2st6Cc05RB26oP2FspgEWqajUhM5qHarYD0p.jpg',150.00,1.00,0.00,NULL,1,7,7,'2026-09-22 11:19:48','2026-09-22 11:19:48'),(2,'હથોડી','stock-items/ov9gyWNyLQKHeS2zEOZaUHfgT7q1TLzbI7X4lEoD.jpg',200.00,1.00,0.00,'હથોડી 🔨',1,7,7,'2026-09-23 08:26:09','2026-09-23 08:26:09'),(3,'ટેસ્ટ','stock-items/Z4CA79QwKH93VouzzwknY5MeMA2RUbT0uYHrhDWD.jpg',50.00,1.00,0.00,NULL,1,7,7,'2026-09-25 08:52:54','2026-09-25 08:52:54'),(4,'ડીસમિસ નાનુ મોટુ બને','stock-items/5HTni8s4I8ThV60rzpFhpnZLr96k87knKvUyRn7x.jpg',100.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:25:18','2026-09-26 04:25:18'),(5,'નાનુ કટર','stock-items/ptFXTJFBkWL7saeiSl2hO3orFSEr0odygXSteVP7.jpg',60.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:26:00','2026-09-26 04:26:00'),(6,'ચકરડી પાનુ','stock-items/oF7KRsti6vz7da7NDEHvFdlfWsF6MQ3QDriPBI3u.jpg',200.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:26:36','2026-09-26 04:26:36'),(7,'સાકુ','stock-items/R6QxASiGOUDNAWnEGFwTq0ePkeauVfspbF4Y95vK.jpg',30.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:27:03','2026-09-26 04:27:03'),(8,'પંચીગતુલ નાનું','stock-items/mFQHUFeNHUXR8T7nqH6d82cWzOdLmaQUCz9LdzF7.jpg',500.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:27:50','2026-09-26 04:27:50'),(9,'લઈને હોલ પાડવા માટેનું પાનું','stock-items/7KqnEu4SgbqG1cB9illTYSiLAm0qIjwCJ12RSTY5.jpg',50.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:28:28','2026-09-26 04:28:28'),(10,'માછલી પાનું','stock-items/btnhujXbP0fcfVWyfFVTmqyXKG0J2vLBaT1lbzqz.jpg',200.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:28:56','2026-09-26 04:28:56'),(11,'ડ્રીલ પાના','stock-items/FqsG5f67BlAnUHsQ8NplroJLcisfljdML9xKviyB.jpg',200.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:29:34','2026-09-26 04:29:34'),(12,'એલંગી પાના ચાટ','stock-items/Vzc9x2Kd4Q0juYcS5fiEPIvJb1xVVULkaunRH1JK.jpg',500.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:30:02','2026-09-26 04:30:02'),(13,'માપ પટ્ટી પાંચ મીટર','stock-items/fzIiIHzSG7mgXGmjARbjyY9EdVr6tZgLB9gIWEi9.jpg',100.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:30:37','2026-09-26 04:30:37'),(14,'ચકડી 8 નંગ 1=40','stock-items/5IKQaW8R53vlQTKlWUcfpbay5bZaO1mzvJQNHTen.jpg',320.00,8.00,0.00,NULL,1,7,7,'2026-09-26 04:33:00','2026-09-26 04:33:00'),(15,'ચોથ પ્લાયર','stock-items/leKqBjyeIE2aJdUrCOGP3LVqXSBH89vns9jWvl3Q.jpg',50.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:33:39','2026-09-26 04:33:39'),(16,'ચાકુની બ્લેડ','stock-items/6EjsOxh807rH2TIYSiYlAWDnAE6vaQozWHEi0bQ3.jpg',40.00,2.00,0.00,NULL,1,7,7,'2026-09-26 04:34:34','2026-09-26 04:34:34'),(17,'આરી પાનું','stock-items/hand_tool.jpg',100.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:35:19','2026-09-26 04:35:19'),(18,'કાળા વાયર નું બંડલ અંદાજિત 500 મીટર','stock-items/oi60Ynnieq4WrXfDloJ2Yo8JHpYTJAANY3eRRwQk.jpg',5000.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:35:57','2026-09-26 04:35:57'),(19,'લાલ વાયર નું બંડલ અંદાજિત 450 મીટર','stock-items/AygGTTj5dnMsyMHoAnhCe3niTidOi6Um4ZHBrMap.jpg',4500.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:36:46','2026-09-26 04:36:46'),(20,'ગન','stock-items/jR5MWIyiJfdQQZuVSUK5NlcYIDtZk0lCwRQ3ndmY.jpg',3000.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:37:24','2026-09-26 04:37:24'),(21,'ફુકણીયુ','stock-items/dfyBbFoLUgVsrcMNNMlw8hkNPpxM5lwFkT81Dk12.jpg',1500.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:38:10','2026-09-26 04:38:10'),(22,'કટર મશીન','stock-items/5EIbEFwYtFOqPJXVkkQuE7CenBsFjMdqE4mLMrEF.jpg',2000.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:38:48','2026-09-26 04:38:48'),(23,'ડ્રિલ મશીન','stock-items/cHR77SdttdgKHsoa0u02Snb2XmIjynkWqwnBZecx.jpg',3000.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:39:22','2026-09-26 04:39:22'),(24,'પંચીગતુલ મોટુ','stock-items/70eikpeZgPuV1TnFBkj0RQXmOJNuoid8F6ywpufp.jpg',3000.00,1.00,0.00,NULL,1,7,7,'2026-09-26 04:40:43','2026-09-26 04:40:43');
/*!40000 ALTER TABLE `stock_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movements`
--

DROP TABLE IF EXISTS `stock_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_item_id` bigint(20) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_movements_created_by_foreign` (`created_by`),
  KEY `stock_movements_stock_item_id_created_at_index` (`stock_item_id`,`created_at`),
  CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_movements_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movements`
--

LOCK TABLES `stock_movements` WRITE;
/*!40000 ALTER TABLE `stock_movements` DISABLE KEYS */;
INSERT INTO `stock_movements` VALUES (1,1,'opening',1.00,150.00,'Opening stock',7,'2026-09-22 11:19:48','2026-09-22 11:19:48'),(2,2,'opening',1.00,200.00,'Opening stock',7,'2026-09-23 08:26:09','2026-09-23 08:26:09'),(3,3,'opening',1.00,50.00,'Opening stock',7,'2026-09-25 08:52:54','2026-09-25 08:52:54'),(4,4,'opening',1.00,100.00,'Opening stock',7,'2026-09-26 04:25:18','2026-09-26 04:25:18'),(5,5,'opening',1.00,60.00,'Opening stock',7,'2026-09-26 04:26:00','2026-09-26 04:26:00'),(6,6,'opening',1.00,200.00,'Opening stock',7,'2026-09-26 04:26:36','2026-09-26 04:26:36'),(7,7,'opening',1.00,30.00,'Opening stock',7,'2026-09-26 04:27:03','2026-09-26 04:27:03'),(8,8,'opening',1.00,500.00,'Opening stock',7,'2026-09-26 04:27:50','2026-09-26 04:27:50'),(9,9,'opening',1.00,50.00,'Opening stock',7,'2026-09-26 04:28:28','2026-09-26 04:28:28'),(10,10,'opening',1.00,200.00,'Opening stock',7,'2026-09-26 04:28:56','2026-09-26 04:28:56'),(11,11,'opening',1.00,200.00,'Opening stock',7,'2026-09-26 04:29:34','2026-09-26 04:29:34'),(12,12,'opening',1.00,500.00,'Opening stock',7,'2026-09-26 04:30:02','2026-09-26 04:30:02'),(13,13,'opening',1.00,100.00,'Opening stock',7,'2026-09-26 04:30:37','2026-09-26 04:30:37'),(14,14,'opening',8.00,320.00,'Opening stock',7,'2026-09-26 04:33:00','2026-09-26 04:33:00'),(15,15,'opening',1.00,50.00,'Opening stock',7,'2026-09-26 04:33:39','2026-09-26 04:33:39'),(16,16,'opening',2.00,40.00,'Opening stock',7,'2026-09-26 04:34:34','2026-09-26 04:34:34'),(17,17,'opening',1.00,100.00,'Opening stock',7,'2026-09-26 04:35:19','2026-09-26 04:35:19'),(18,18,'opening',1.00,5000.00,'Opening stock',7,'2026-09-26 04:35:57','2026-09-26 04:35:57'),(19,19,'opening',1.00,4500.00,'Opening stock',7,'2026-09-26 04:36:46','2026-09-26 04:36:46'),(20,20,'opening',1.00,3000.00,'Opening stock',7,'2026-09-26 04:37:24','2026-09-26 04:37:24'),(21,21,'opening',1.00,1500.00,'Opening stock',7,'2026-09-26 04:38:10','2026-09-26 04:38:10'),(22,22,'opening',1.00,2000.00,'Opening stock',7,'2026-09-26 04:38:48','2026-09-26 04:38:48'),(23,23,'opening',1.00,3000.00,'Opening stock',7,'2026-09-26 04:39:22','2026-09-26 04:39:22'),(24,24,'opening',1.00,3000.00,'Opening stock',7,'2026-09-26 04:40:43','2026-09-26 04:40:43');
/*!40000 ALTER TABLE `stock_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_returns`
--

DROP TABLE IF EXISTS `stock_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_borrowing_id` bigint(20) unsigned NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `returned_on` date NOT NULL,
  `received_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_returns_received_by_user_id_foreign` (`received_by_user_id`),
  KEY `stock_returns_created_by_foreign` (`created_by`),
  KEY `stock_returns_stock_borrowing_id_returned_on_index` (`stock_borrowing_id`,`returned_on`),
  CONSTRAINT `stock_returns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_returns_received_by_user_id_foreign` FOREIGN KEY (`received_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_returns_stock_borrowing_id_foreign` FOREIGN KEY (`stock_borrowing_id`) REFERENCES `stock_borrowings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_returns`
--

LOCK TABLES `stock_returns` WRITE;
/*!40000 ALTER TABLE `stock_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'data_entry',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Apex Solar Admin','admin.apex@solartech.in',NULL,'$2y$12$rkdgZ638TwaQonCiSgiRy.sxb5Tu0VFn5bOXOL7CCKTpFynuluu2y','company_admin','[\"view_dashboard\", \"enter_readings\", \"view_reports\", \"view_employees\", \"manage_employees\", \"view_attendance\", \"approve_leaves\", \"manage_attendance_settings\", \"view_attendance_reports\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\", \"view_expenses\", \"edit_readings\", \"record_employee_attendance\"]',1,NULL,'2026-09-18 06:17:15','2026-10-16 17:11:34'),(2,2,'Vibrant Solar Admin','admin.vibrant@solartech.in',NULL,'$2y$12$dGlEIRp9FPl66VDlsiALa.oW/XKTLwI0Ya/WtO5Zy6L48a8jKO58y','company_admin','[\"view_dashboard\", \"enter_readings\", \"edit_readings\", \"view_reports\", \"manage_company_users\", \"view_employees\", \"manage_employees\", \"view_attendance\", \"approve_leaves\", \"manage_attendance_settings\", \"view_attendance_reports\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\", \"view_expenses\", \"record_employee_attendance\"]',1,NULL,'2026-09-18 06:17:16','2026-10-16 17:11:35'),(3,3,'Zenith Solar Admin','admin.zenith@solartech.in',NULL,'$2y$12$m0ev/TDf0g4K4ekdf0v7YeYGitoQDe6oOTsVNTO0EfpSnjoefMrlO','company_admin','[\"view_dashboard\", \"view_reports\", \"view_employees\", \"view_attendance\", \"approve_leaves\", \"view_attendance_reports\", \"record_employee_attendance\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\", \"view_expenses\"]',1,NULL,'2026-09-18 06:17:16','2026-10-16 17:11:35'),(4,NULL,'Super Admin','dmeosolar@gmail.com',NULL,'$2y$12$.Tzrx8g6.t5bdaup0F2/cuMy3k0KMYDQMGdJAzJE0etXYyXqx78ky','super_admin',NULL,1,NULL,'2026-09-18 06:17:16','2026-10-16 17:11:36'),(5,NULL,'Chief Solar Engineer','engineer@solartech.in',NULL,'$2y$12$fYHFeJ7OrX7WMeTSc7FWO.o3x344CQlKrfRYDbzf2MtBObTiucSFG','employee','[\"clock_attendance\", \"enter_readings\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\"]',1,NULL,'2026-09-20 09:09:00','2026-10-16 17:11:36'),(6,NULL,'Rohan Varma','rohan@solartech.in',NULL,'$2y$12$hQewPzDX7kXiY3q.1VblRefyr8XuKzIJUCAwgSl0AzBdM9El1tqVK','employee','[\"clock_attendance\", \"enter_readings\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\"]',1,NULL,'2026-09-20 09:09:39','2026-10-16 17:11:37'),(7,NULL,'Amit Sharma','amit@solartech.in',NULL,'$2y$12$sztPIBndVaJUf1q2HL85euPGXTfmryWjiY388kEwoXN9nkE.hUaoy','employee','[\"clock_attendance\",\"enter_readings\",\"view_stock\",\"manage_stock\",\"issue_stock\",\"return_stock\"]',1,NULL,'2026-09-20 12:05:38','2026-10-16 17:29:24'),(8,NULL,'Rajesh Kumar','rajesh@solartech.in',NULL,'$2y$12$ZwdwMbWlzAO2zuu3yxT81usoHBqhr2bgea73q320vrpmSzuAOGmxS','employee','[\"clock_attendance\", \"enter_readings\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\"]',1,NULL,'2026-09-21 09:19:45','2026-10-16 17:11:38'),(9,NULL,'Rita Patel','rita@solartech.in',NULL,'$2y$12$3/ic2UurGZ12Tj2xrImCV.v0TApM83QfILIeKGKV3tTSv/yTF/4d.','employee','[\"clock_attendance\", \"enter_readings\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\"]',1,NULL,'2026-09-21 09:21:25','2026-10-16 17:11:38'),(10,NULL,'Pooja Joshi','pooja@solartech.in',NULL,'$2y$12$Zo/sVmRZU0MAuQ2xQ9sGle4I9r9/84fQ5KQm6VsVSoAzxKYCc5Oa6','employee','[\"clock_attendance\", \"enter_readings\", \"view_stock\", \"manage_stock\", \"issue_stock\", \"return_stock\"]',1,NULL,'2026-09-22 10:21:04','2026-10-16 17:11:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-16 23:02:40
