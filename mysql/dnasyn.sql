-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 172.27.0.2    Database: dnasyn
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dna_assembly`
--

DROP TABLE IF EXISTS `dna_assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_assembly` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `case_no` int DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_user` varchar(200) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_user` varchar(200) DEFAULT NULL,
  `para_oligomer_length` int DEFAULT NULL,
  `para_overlap_length` int DEFAULT NULL,
  `para_tm` float DEFAULT NULL,
  `avg_tm` float DEFAULT NULL,
  `min_tm` float DEFAULT NULL,
  `sd_tm` float DEFAULT NULL,
  `circle_linear` tinyint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `enable` tinyint DEFAULT NULL,
  `dna_sample_id` int NOT NULL,
  PRIMARY KEY (`id`,`dna_sample_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_dna_assembly_dna_sample1_idx` (`dna_sample_id`),
  CONSTRAINT `fk_dna_assembly_dna_sample1` FOREIGN KEY (`dna_sample_id`) REFERENCES `dna_sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_oligomer_vender`
--

DROP TABLE IF EXISTS `dna_oligomer_vender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_oligomer_vender` (
  `id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `contact_person_name` varchar(200) DEFAULT NULL,
  `contact_person_phone` varchar(200) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_oligomers`
--

DROP TABLE IF EXISTS `dna_oligomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_oligomers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sequences` varchar(500) DEFAULT NULL,
  `enable` tinyint DEFAULT NULL,
  `cluster_no` int DEFAULT NULL,
  `oligomer_no` int DEFAULT NULL,
  `overlap_len` int DEFAULT NULL,
  `overlap_tm` float DEFAULT NULL,
  `strand` varchar(1) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `error_code` varchar(100) DEFAULT NULL,
  `repeat_sequence` varchar(300) DEFAULT NULL,
  `start` int DEFAULT NULL,
  `end` int DEFAULT NULL,
  `dna_assembly_id` int NOT NULL,
  PRIMARY KEY (`id`,`dna_assembly_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_dna_oligomers_dna_assembly1_idx` (`dna_assembly_id`),
  CONSTRAINT `fk_dna_oligomers_dna_assembly1` FOREIGN KEY (`dna_assembly_id`) REFERENCES `dna_assembly` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4305 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_order`
--

DROP TABLE IF EXISTS `dna_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_order` (
  `id` int NOT NULL,
  `created_date` date DEFAULT NULL,
  `ordered_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `created_user` varchar(200) DEFAULT NULL,
  `order_number` varchar(200) DEFAULT NULL,
  `order_invoice_files` varchar(45) DEFAULT NULL,
  `dna_assembly_id` int NOT NULL,
  `dna_oligomer_vender_id` int NOT NULL,
  PRIMARY KEY (`id`,`dna_assembly_id`,`dna_oligomer_vender_id`),
  KEY `fk_dna_order_dna_assembly1_idx` (`dna_assembly_id`),
  KEY `fk_dna_order_dna_oligomer_vender1_idx` (`dna_oligomer_vender_id`),
  CONSTRAINT `fk_dna_order_dna_assembly1` FOREIGN KEY (`dna_assembly_id`) REFERENCES `dna_assembly` (`id`),
  CONSTRAINT `fk_dna_order_dna_oligomer_vender1` FOREIGN KEY (`dna_oligomer_vender_id`) REFERENCES `dna_oligomer_vender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_project`
--

DROP TABLE IF EXISTS `dna_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `created_user` varchar(200) DEFAULT NULL,
  `modified_user` varchar(200) DEFAULT NULL,
  `enable` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_sample`
--

DROP TABLE IF EXISTS `dna_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_sample` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sequence` text,
  `description` text,
  `created_user` varchar(200) DEFAULT NULL,
  `modified_user` varchar(200) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `enable` tinyint DEFAULT NULL,
  `dna_project_id` int NOT NULL,
  PRIMARY KEY (`id`,`dna_project_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_dna_sample_dna_project1_idx` (`dna_project_id`),
  CONSTRAINT `fk_dna_sample_dna_project1` FOREIGN KEY (`dna_project_id`) REFERENCES `dna_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-16  8:14:50
