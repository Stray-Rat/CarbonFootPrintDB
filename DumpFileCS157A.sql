-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproject
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `argohoodknowledge`
--

DROP TABLE IF EXISTS `argohoodknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `argohoodknowledge` (
  `RespondentID` int NOT NULL,
  `HasArgoHoodKnowledge` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RespondentID`),
  CONSTRAINT `argohoodknowledge_ibfk_1` FOREIGN KEY (`RespondentID`) REFERENCES `surveyresponse` (`RespondentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `argohoodknowledge`
--

LOCK TABLES `argohoodknowledge` WRITE;
/*!40000 ALTER TABLE `argohoodknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `argohoodknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `californianativegarden`
--

DROP TABLE IF EXISTS `californianativegarden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `californianativegarden` (
  `RespondentID` int NOT NULL,
  `HasCaliforniaNativeGarden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RespondentID`),
  CONSTRAINT `californianativegarden_ibfk_1` FOREIGN KEY (`RespondentID`) REFERENCES `surveyresponse` (`RespondentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `californianativegarden`
--

LOCK TABLES `californianativegarden` WRITE;
/*!40000 ALTER TABLE `californianativegarden` DISABLE KEYS */;
/*!40000 ALTER TABLE `californianativegarden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseID` int NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Chemistry 101'),(101,'Chemistry 101'),(102,'Biology 102'),(103,'Environmental Studies 103'),(104,'Climate Studies 104'),(105,'ENVS Research and Writing 105'),(106,'Statistics 106');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographics`
--

DROP TABLE IF EXISTS `demographics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demographics` (
  `StudentID` int NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Ethnicity` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `demographics_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics`
--

LOCK TABLES `demographics` WRITE;
/*!40000 ALTER TABLE `demographics` DISABLE KEYS */;
INSERT INTO `demographics` VALUES (1,25,'Female','Asian','456 Elm St, San Jose, CA'),(5,20,'Female','Asian','456 Elm St, San Jose, CA'),(7,27,'Female','Asian','456 Elm St, San Jose, CA'),(8,18,'Female','Asian','456 Elm St, San Jose, CA'),(9,22,'Female','Asian','456 Elm St, San Jose, CA'),(61,22,'Female','Asian','456 Elm St, San Jose, CA'),(62,23,'Female','Asian','456 Elm St, San Jose, CA'),(63,24,'Female','Asian','456 Elm St, San Jose, CA'),(64,24,'Female','Asian','456 Elm St, San Jose, CA'),(65,18,'Male','Asian','456 Elm St, San Jose, CA'),(66,24,'Female','Asian','456 Elm St, San Jose, CA');
/*!40000 ALTER TABLE `demographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `EnrollmentID` int NOT NULL,
  `StudentID` int NOT NULL,
  `CourseID` int NOT NULL,
  `InstructorID` int NOT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `StudentID` (`StudentID`),
  KEY `CourseID` (`CourseID`),
  KEY `InstructorID` (`InstructorID`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`studentID`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`courseID`),
  CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`InstructorID`) REFERENCES `instructors` (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (10,1,101,2,'2023-05-01'),(12,5,104,4,'2023-05-01'),(13,7,106,6,'2023-05-01'),(14,8,106,6,'2023-05-01'),(15,9,106,6,'2023-05-01'),(16,61,106,6,'2023-05-01'),(17,62,106,6,'2023-05-01'),(18,63,106,6,'2023-05-01'),(19,64,106,6,'2023-05-01'),(21,65,106,6,'2023-05-01'),(22,66,106,6,'2023-05-01');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instructorcourses`
--

DROP TABLE IF EXISTS `instructorcourses`;
/*!50001 DROP VIEW IF EXISTS `instructorcourses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `instructorcourses` AS SELECT 
 1 AS `InstructorID`,
 1 AS `InstructorName`,
 1 AS `CourseID`,
 1 AS `CourseName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `InstructorID` int NOT NULL,
  `InstructorName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Professor Smith'),(2,'Professor Smith'),(4,'Professor Nguyen'),(6,'Jahan Ghofraniha’');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nonstudentsurveycount`
--

DROP TABLE IF EXISTS `nonstudentsurveycount`;
/*!50001 DROP VIEW IF EXISTS `nonstudentsurveycount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nonstudentsurveycount` AS SELECT 
 1 AS `SurveyCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `professorenrollmentcount`
--

DROP TABLE IF EXISTS `professorenrollmentcount`;
/*!50001 DROP VIEW IF EXISTS `professorenrollmentcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `professorenrollmentcount` AS SELECT 
 1 AS `InstructorName`,
 1 AS `CourseName`,
 1 AS `EnrollmentCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reducingfootprintscale`
--

DROP TABLE IF EXISTS `reducingfootprintscale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reducingfootprintscale` (
  `RespondentID` int NOT NULL,
  `FootprintScale` int DEFAULT NULL,
  PRIMARY KEY (`RespondentID`),
  CONSTRAINT `reducingfootprintscale_ibfk_1` FOREIGN KEY (`RespondentID`) REFERENCES `surveyresponse` (`RespondentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reducingfootprintscale`
--

LOCK TABLES `reducingfootprintscale` WRITE;
/*!40000 ALTER TABLE `reducingfootprintscale` DISABLE KEYS */;
/*!40000 ALTER TABLE `reducingfootprintscale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Student'),(30,'Student');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentdemographics`
--

DROP TABLE IF EXISTS `studentdemographics`;
/*!50001 DROP VIEW IF EXISTS `studentdemographics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentdemographics` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `Ethnicity`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentenrollment`
--

DROP TABLE IF EXISTS `studentenrollment`;
/*!50001 DROP VIEW IF EXISTS `studentenrollment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentenrollment` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `StudentMajor`,
 1 AS `CourseID`,
 1 AS `CourseName`,
 1 AS `EnrollmentDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentinfoview`
--

DROP TABLE IF EXISTS `studentinfoview`;
/*!50001 DROP VIEW IF EXISTS `studentinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentinfoview` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `StudentMajor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentID` int NOT NULL,
  `StudentName` varchar(255) DEFAULT NULL,
  `StudentMajor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alice Johnson','Biology'),(5,'Tejasree Goli','Computer Science'),(7,'Leha Ngo','Business'),(8,'Zaina Usmani','Business'),(9,'Umama Muntaha Kamal Oishi','Environmental Studies'),(61,'Nuha Rashad','Electrical Engineering'),(62,'Jannah Khan','English'),(63,'Harshita','Environmental Studies'),(64,'Zahra Shaikh','Chemistry'),(65,'Harkunwar','Computer Science'),(66,'Jalen Jackson','Environmental Studies');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponse`
--

DROP TABLE IF EXISTS `surveyresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyresponse` (
  `RespondentID` int NOT NULL,
  `RoleID` int NOT NULL,
  `StudentID` int NOT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `IsStudent` tinyint(1) DEFAULT NULL,
  `IsVolunteer` tinyint(1) DEFAULT NULL,
  `IsProfessor` tinyint(1) DEFAULT NULL,
  `SustainableGardening` tinyint(1) DEFAULT NULL,
  `CaliforniaNativeGarden` tinyint(1) DEFAULT NULL,
  `ArgoHoodKnowledge` tinyint(1) DEFAULT NULL,
  `ReducingFootprintScale` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RespondentID`),
  KEY `RoleID` (`RoleID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `surveyresponse_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`),
  CONSTRAINT `surveyresponse_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponse`
--

LOCK TABLES `surveyresponse` WRITE;
/*!40000 ALTER TABLE `surveyresponse` DISABLE KEYS */;
INSERT INTO `surveyresponse` VALUES (40,30,1,'2023-05-02 22:23:45',1,0,0,1,0,1,4),(41,30,5,'2023-05-02 22:23:45',1,0,0,1,1,0,4),(42,30,7,'2023-05-02 22:23:45',1,0,0,0,0,0,3),(43,30,8,'2023-05-02 22:23:45',1,0,0,1,0,0,5),(44,30,9,'2023-05-02 22:23:45',1,0,0,0,1,0,5),(45,30,61,'2023-05-02 22:23:45',1,0,0,0,1,0,4),(46,30,62,'2023-05-02 22:23:45',1,0,0,0,0,0,3),(47,30,63,'2023-05-02 22:23:45',1,0,0,0,1,0,4),(48,30,64,'2023-05-02 22:23:45',1,0,0,0,1,0,3),(49,30,65,'2023-05-02 22:23:45',1,1,0,0,0,0,1),(50,30,66,'2023-05-02 22:23:45',1,1,0,1,1,1,5);
/*!40000 ALTER TABLE `surveyresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `surveyresults`
--

DROP TABLE IF EXISTS `surveyresults`;
/*!50001 DROP VIEW IF EXISTS `surveyresults`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `surveyresults` AS SELECT 
 1 AS `RespondentID`,
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `RoleName`,
 1 AS `IsStudent`,
 1 AS `IsVolunteer`,
 1 AS `IsProfessor`,
 1 AS `SustainableGardening`,
 1 AS `CaliforniaNativeGarden`,
 1 AS `ArgoHoodKnowledge`,
 1 AS `ReducingFootprintScale`,
 1 AS `Timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sustainablegardening`
--

DROP TABLE IF EXISTS `sustainablegardening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainablegardening` (
  `RespondentID` int NOT NULL,
  `HasSustainableGardening` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RespondentID`),
  CONSTRAINT `sustainablegardening_ibfk_1` FOREIGN KEY (`RespondentID`) REFERENCES `surveyresponse` (`RespondentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainablegardening`
--

LOCK TABLES `sustainablegardening` WRITE;
/*!40000 ALTER TABLE `sustainablegardening` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainablegardening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `instructorcourses`
--

/*!50001 DROP VIEW IF EXISTS `instructorcourses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructorcourses` AS select distinct `i`.`InstructorID` AS `InstructorID`,`i`.`InstructorName` AS `InstructorName`,`c`.`courseID` AS `CourseID`,`c`.`CourseName` AS `CourseName` from ((`instructors` `i` join `enrollments` `e` on((`i`.`InstructorID` = `e`.`InstructorID`))) join `courses` `c` on((`e`.`CourseID` = `c`.`courseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nonstudentsurveycount`
--

/*!50001 DROP VIEW IF EXISTS `nonstudentsurveycount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nonstudentsurveycount` AS select count(0) AS `SurveyCount` from `surveyresponse` where (`surveyresponse`.`IsStudent` = false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `professorenrollmentcount`
--

/*!50001 DROP VIEW IF EXISTS `professorenrollmentcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `professorenrollmentcount` AS select `i`.`InstructorName` AS `InstructorName`,`c`.`CourseName` AS `CourseName`,count(`e`.`StudentID`) AS `EnrollmentCount` from ((`instructors` `i` join `enrollments` `e` on((`i`.`InstructorID` = `e`.`InstructorID`))) join `courses` `c` on((`e`.`CourseID` = `c`.`courseID`))) where (`c`.`CourseName` = 'Statistics 106') group by `i`.`InstructorName`,`c`.`CourseName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentdemographics`
--

/*!50001 DROP VIEW IF EXISTS `studentdemographics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentdemographics` AS select `s`.`studentID` AS `StudentID`,`s`.`StudentName` AS `StudentName`,`d`.`Age` AS `Age`,`d`.`Gender` AS `Gender`,`d`.`Ethnicity` AS `Ethnicity`,`d`.`Address` AS `Address` from (`students` `s` join `demographics` `d` on((`s`.`studentID` = `d`.`StudentID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentenrollment`
--

/*!50001 DROP VIEW IF EXISTS `studentenrollment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentenrollment` AS select `s`.`studentID` AS `StudentID`,`s`.`StudentName` AS `StudentName`,`s`.`StudentMajor` AS `StudentMajor`,`c`.`courseID` AS `CourseID`,`c`.`CourseName` AS `CourseName`,`e`.`EnrollmentDate` AS `EnrollmentDate` from ((`students` `s` join `enrollments` `e` on((`s`.`studentID` = `e`.`StudentID`))) join `courses` `c` on((`e`.`CourseID` = `c`.`courseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentinfoview`
--

/*!50001 DROP VIEW IF EXISTS `studentinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentinfoview` AS select `students`.`studentID` AS `StudentID`,`students`.`StudentName` AS `StudentName`,`students`.`StudentMajor` AS `StudentMajor` from `students` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `surveyresults`
--

/*!50001 DROP VIEW IF EXISTS `surveyresults`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `surveyresults` AS select `sr`.`RespondentID` AS `RespondentID`,`s`.`studentID` AS `StudentID`,`s`.`StudentName` AS `StudentName`,`r`.`RoleName` AS `RoleName`,`sr`.`IsStudent` AS `IsStudent`,`sr`.`IsVolunteer` AS `IsVolunteer`,`sr`.`IsProfessor` AS `IsProfessor`,`sr`.`SustainableGardening` AS `SustainableGardening`,`sr`.`CaliforniaNativeGarden` AS `CaliforniaNativeGarden`,`sr`.`ArgoHoodKnowledge` AS `ArgoHoodKnowledge`,`sr`.`ReducingFootprintScale` AS `ReducingFootprintScale`,`sr`.`Timestamp` AS `Timestamp` from ((`surveyresponse` `sr` join `students` `s` on((`sr`.`StudentID` = `s`.`studentID`))) join `roles` `r` on((`sr`.`RoleID` = `r`.`RoleID`))) */;
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

-- Dump completed on 2023-05-07 17:00:52
