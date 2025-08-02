CREATE DATABASE  IF NOT EXISTS `gestion_academica_universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_academica_universidad`;
-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_academica_universidad
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

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
-- Table structure for table `academic_depts`
--

DROP TABLE IF EXISTS `academic_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_depts` (
  `id_academic_dept` int NOT NULL AUTO_INCREMENT,
  `academic_dept` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_academic_dept`),
  UNIQUE KEY `academic_dept` (`academic_dept`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_depts`
--

LOCK TABLES `academic_depts` WRITE;
/*!40000 ALTER TABLE `academic_depts` DISABLE KEYS */;
INSERT INTO `academic_depts` VALUES (1,'Engineering',1,'2025-07-31 02:07:47','2025-07-31 02:07:47'),(2,'Math',1,'2025-07-31 02:07:47','2025-07-31 02:07:47'),(3,'Arts',1,'2025-07-31 02:07:47','2025-07-31 02:07:47'),(4,'Social Sciences',1,'2025-07-31 02:07:47','2025-07-31 02:07:47');
/*!40000 ALTER TABLE `academic_depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `academic_record`
--

DROP TABLE IF EXISTS `academic_record`;
/*!50001 DROP VIEW IF EXISTS `academic_record`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `academic_record` AS SELECT 
 1 AS `students name`,
 1 AS `Insctiption date`,
 1 AS `Final grade`,
 1 AS `Courses names`,
 1 AS `teachers name`,
 1 AS `course_code`,
 1 AS `number_credits`,
 1 AS `semester`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id_career` int NOT NULL AUTO_INCREMENT,
  `career` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_career`),
  UNIQUE KEY `career` (`career`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Software Engineering',1,'2025-07-31 01:14:53','2025-07-31 01:14:53'),(2,'Civil Engineering',1,'2025-07-31 01:14:53','2025-07-31 01:14:53'),(3,'Mathematical Engineering',1,'2025-07-31 01:14:53','2025-07-31 01:14:53'),(4,'Bachelor in Music',1,'2025-07-31 01:14:53','2025-07-31 01:14:53'),(5,'Sociology',1,'2025-07-31 01:14:53','2025-07-31 01:14:53');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id_course` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) NOT NULL,
  `course_code` int NOT NULL,
  `number_credits` int NOT NULL,
  `semester` int NOT NULL,
  `id_teacher` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_course`),
  UNIQUE KEY `course_name` (`course_name`),
  KEY `fk_courses_teachers` (`id_teacher`),
  CONSTRAINT `fk_courses_teachers` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`),
  CONSTRAINT `courses_chk_1` CHECK ((`number_credits` >= 1)),
  CONSTRAINT `courses_chk_2` CHECK ((`semester` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Software 1',3031,4,1,1,1,'2025-07-31 02:12:24','2025-07-31 02:12:24'),(2,'Software 2',4011,5,2,3,1,'2025-07-31 02:12:24','2025-07-31 02:12:24'),(3,'Math',5221,4,1,4,1,'2025-07-31 02:12:24','2025-07-31 02:12:24'),(4,'Critical Thinking',1000,3,1,1,1,'2025-07-31 02:12:24','2025-07-31 02:12:24'),(5,'Design',4343,2,2,2,1,'2025-07-31 02:12:24','2025-07-31 02:12:24');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_types` (
  `id_document_type` int NOT NULL AUTO_INCREMENT,
  `document_type` varchar(20) NOT NULL,
  `acronym_doc_type` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_document_type`),
  UNIQUE KEY `document_type` (`document_type`),
  UNIQUE KEY `acronym_doc_type` (`acronym_doc_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_types`
--

LOCK TABLES `document_types` WRITE;
/*!40000 ALTER TABLE `document_types` DISABLE KEYS */;
INSERT INTO `document_types` VALUES (1,'Cédula de ciudadanía','CC',1,'2025-07-31 01:15:02','2025-07-31 01:15:02'),(2,'Tarjeta de Identidad','TI',1,'2025-07-31 01:15:02','2025-07-31 01:15:02'),(3,'Pasaporte','PP',1,'2025-07-31 01:15:02','2025-07-31 01:15:02');
/*!40000 ALTER TABLE `document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id_gender` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'Masculino','2025-07-31 01:15:09','2025-07-31 01:15:09'),(2,'Femenino','2025-07-31 01:15:09','2025-07-31 01:15:09');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscriptions` (
  `id_inscription` int NOT NULL AUTO_INCREMENT,
  `id_student` int NOT NULL,
  `id_course` int NOT NULL,
  `iscription_date` date NOT NULL,
  `final_grade` decimal(3,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inscription`),
  KEY `fk_inscriptions_students` (`id_student`),
  KEY `fk_inscriptions_courses` (`id_course`),
  CONSTRAINT `fk_inscriptions_courses` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`),
  CONSTRAINT `fk_inscriptions_students` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`),
  CONSTRAINT `inscriptions_chk_1` CHECK (((`final_grade` >= 0.00) and (`final_grade` <= 5.00)))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptions`
--

LOCK TABLES `inscriptions` WRITE;
/*!40000 ALTER TABLE `inscriptions` DISABLE KEYS */;
INSERT INTO `inscriptions` VALUES (1,1,1,'2025-06-11',4.45,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(2,2,1,'2025-07-01',3.92,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(3,3,2,'2025-02-27',4.01,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(4,4,2,'2025-01-31',2.99,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(5,4,3,'2025-06-28',4.88,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(6,5,4,'2025-06-01',4.11,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(7,1,4,'2025-04-27',3.99,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(8,6,2,'2025-06-04',4.15,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(9,4,1,'2025-07-01',3.45,'2025-07-31 02:23:37','2025-07-31 02:23:37'),(11,9,1,'2025-08-10',0.00,'2025-08-02 03:20:46','2025-08-02 03:20:46');
/*!40000 ALTER TABLE `inscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastname_1` varchar(20) NOT NULL,
  `lastname_2` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `id_gender` int NOT NULL,
  `id_document_type` int NOT NULL,
  `number_doc_type` int NOT NULL,
  `id_career` int NOT NULL,
  `birth_date` date NOT NULL,
  `start_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `academic_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `number_doc_type` (`number_doc_type`),
  KEY `fk_students_genders` (`id_gender`),
  KEY `fk_students_document_types` (`id_document_type`),
  KEY `fk_students_careers` (`id_career`),
  CONSTRAINT `fk_students_careers` FOREIGN KEY (`id_career`) REFERENCES `careers` (`id_career`),
  CONSTRAINT `fk_students_document_types` FOREIGN KEY (`id_document_type`) REFERENCES `document_types` (`id_document_type`),
  CONSTRAINT `fk_students_genders` FOREIGN KEY (`id_gender`) REFERENCES `genders` (`id_gender`),
  CONSTRAINT `students_chk_1` CHECK ((`number_doc_type` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Diego','Vallejo','Zapata','diego@gmail.com',1,1,1085310999,1,'1994-03-04','2025-03-26',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(2,'Sara','Gonzales','Escobar','sara@gmail.com',2,1,108232219,2,'1999-05-11','2025-04-12',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(3,'Valentina','Zamora','Vasquez','valen@gmail.com',2,2,232310999,4,'2008-07-31','2025-05-22',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(4,'Carlos','Garcia','Torres','esteban@gmail.com',1,1,1023231212,1,'1999-12-04','2025-01-28',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(5,'Julian','Jimenez','Chica','j.jimenez@gmail.com',1,1,1000310399,3,'2000-11-14','2023-05-29',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(6,'Maria','Stauffemberg','Lopez','maria.s@gmail.com',2,3,18383999,3,'1990-06-04','2022-03-01',1,'2025-07-31 02:06:16','2025-07-31 02:06:16',NULL),(7,'Frederich','Mckenzie',NULL,'f.mczie@england.uk',1,3,80174,1,'2000-05-15','2018-09-18',0,'2025-08-02 01:14:36','2025-08-02 01:14:36',NULL),(8,'Anne','Wenzel',NULL,'anne.wenzel@deuschland.de',2,3,201480,1,'1999-03-25','2016-11-08',0,'2025-08-02 01:14:36','2025-08-02 01:14:36',NULL),(9,'Laura','Montoya',NULL,'laura@email.io',2,1,123456789,1,'2002-10-12','2025-08-01',1,'2025-08-02 02:53:07','2025-08-02 02:53:07',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id_teacher` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `lastname_1` varchar(25) NOT NULL,
  `lastname_2` varchar(25) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `id_academic_dept` int NOT NULL,
  `experience_years` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_teacher`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_teachers_academic_depts` (`id_academic_dept`),
  CONSTRAINT `fk_teachers_academic_depts` FOREIGN KEY (`id_academic_dept`) REFERENCES `academic_depts` (`id_academic_dept`),
  CONSTRAINT `teachers_chk_1` CHECK ((`experience_years` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Ramiro','Varona','Balvuena','ramiro@email.io',1,15,1,'2025-07-31 02:11:27','2025-07-31 02:11:27'),(2,'Andrea','Dominguez','Klauss','andre@email.io',2,3,1,'2025-07-31 02:11:27','2025-07-31 02:11:27'),(3,'Sebastian','Agudelo','Gutierrez','sebas@email.io',1,18,1,'2025-07-31 02:11:27','2025-07-31 02:11:27'),(4,'David','Henao','Henao','d.henao@email.io',2,12,1,'2025-07-31 02:11:27','2025-07-31 02:11:27'),(5,'Andres','David','Gamboa','gamboa@email.io',3,9,1,'2025-07-31 02:11:27','2025-07-31 02:11:27');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gestion_academica_universidad'
--

--
-- Dumping routines for database 'gestion_academica_universidad'
--

--
-- Final view structure for view `academic_record`
--

/*!50001 DROP VIEW IF EXISTS `academic_record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `academic_record` AS select concat(`s`.`name`,' ',`s`.`lastname_1`,' ',`s`.`lastname_2`) AS `students name`,`i`.`iscription_date` AS `Insctiption date`,`i`.`final_grade` AS `Final grade`,`c`.`course_name` AS `Courses names`,concat(`t`.`name`,' ',`t`.`lastname_1`) AS `teachers name`,`c`.`course_code` AS `course_code`,`c`.`number_credits` AS `number_credits`,`c`.`semester` AS `semester` from (((`inscriptions` `i` join `students` `s` on((`i`.`id_student` = `s`.`id_student`))) join `courses` `c` on((`c`.`id_course` = `i`.`id_course`))) join `teachers` `t` on((`c`.`id_teacher` = `t`.`id_teacher`))) order by `s`.`name`,`s`.`lastname_1`,`s`.`lastname_2` */;
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

-- Dump completed on 2025-08-01 22:39:44
