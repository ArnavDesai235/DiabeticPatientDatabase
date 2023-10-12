-- MariaDB dump 10.19-11.3.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: minip
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

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
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `Did` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  `Hid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Did`),
  KEY `Hid` (`Hid`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`Hid`) REFERENCES `hospital` (`Hid`),
  CONSTRAINT `c3` CHECK (`Gender` in ('M','F'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES
(1,'Dr. Rajesh Sharma','1980-05-15','M',1234567890,1),
(2,'Dr. Priya Patel','1985-10-20','F',9876543210,2),
(3,'Dr. Suresh Kumar','1976-03-08','M',8765432109,1),
(4,'Dr. Naina Gupta','1990-08-02','F',7654321098,3),
(5,'Dr. Aarav Verma','1988-12-12','M',6543210987,2),
(6,'Dr. Meera Singh','1982-04-30','F',5432109876,3);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hid` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Hid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES
(1,'Indian Medical Center','Pune'),
(2,'Mumbai General Hospital','Mumbai'),
(3,'Delhi Health Clinic','Delhi');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathology_cur`
--

DROP TABLE IF EXISTS `pathology_cur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathology_cur` (
  `Pid` int(11) NOT NULL,
  `Tid` int(11) NOT NULL,
  `TestDate` date DEFAULT NULL,
  `FastingLevel` int(11) DEFAULT NULL,
  `PPLevel` int(11) DEFAULT NULL,
  `Centre` varchar(50) DEFAULT NULL,
  `FLStatus` varchar(10) DEFAULT NULL,
  `PPLStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Pid`,`Tid`),
  UNIQUE KEY `con1` (`Pid`),
  CONSTRAINT `pathology_cur_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `patients` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathology_cur`
--

LOCK TABLES `pathology_cur` WRITE;
/*!40000 ALTER TABLE `pathology_cur` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathology_cur` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger backup
after update on pathology_cur
for each row
begin
insert into pathology_history values(OLD.Pid, OLD.Tid,OLD.TestDate,OLD.FastingLevel, OLD.PPLevel,OLD.Centre,OLD.FLStatus,OLD.PPLStatus);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pathology_history`
--

DROP TABLE IF EXISTS `pathology_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathology_history` (
  `Pid` int(11) DEFAULT NULL,
  `Tid` int(11) NOT NULL,
  `TestDate` date DEFAULT NULL,
  `FastingLevel` int(11) DEFAULT NULL,
  `PPLevel` int(11) DEFAULT NULL,
  `Centre` varchar(50) DEFAULT NULL,
  `FLStatus` varchar(10) DEFAULT NULL,
  `PPLStatus` varchar(10) DEFAULT NULL,
  KEY `Pid` (`Pid`),
  CONSTRAINT `pathology_history_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `patients` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathology_history`
--

LOCK TABLES `pathology_history` WRITE;
/*!40000 ALTER TABLE `pathology_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathology_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `Pid` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Hid` int(11) DEFAULT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Pid`),
  KEY `Hid` (`Hid`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Hid`) REFERENCES `hospital` (`Hid`),
  CONSTRAINT `c1` CHECK (`Gender` in ('M','F')),
  CONSTRAINT `c2` CHECK (`Type` in (1,2))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES
(1,'Rajesh Kumar','1990-06-15','M',1,70,1,1234567890),
(2,'Priya Sharma','1985-12-20','F',2,60,2,9876543210),
(3,'Suresh Singh','1976-07-08','M',1,80,1,8765432109),
(4,'Neha Patel','1995-03-10','F',2,55,3,7654321098),
(5,'Amit Verma','1988-11-15','M',1,68,2,6543210987),
(6,'Meera Gupta','1982-09-30','F',2,75,3,5432109876),
(7,'Samantha Kapoor','1992-04-25','F',1,62,1,9876543211),
(8,'Amit Patel','1987-08-05','M',2,75,2,8765432101),
(9,'Rahul Sharma','1998-02-17','M',1,68,1,7654321090),
(10,'Priya Singh','1984-10-12','F',2,64,2,6543210989),
(11,'Vikram Verma','1979-03-22','M',1,82,3,5432109878),
(12,'Neha Gupta','1990-07-07','F',2,70,1,4321098765);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 17:32:43
