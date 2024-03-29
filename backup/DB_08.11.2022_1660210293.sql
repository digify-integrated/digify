-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: disdb
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `approval_approver`
--

DROP TABLE IF EXISTS `approval_approver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_approver` (
  `APPROVAL_TYPE_ID` varchar(100) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_approver`
--

LOCK TABLES `approval_approver` WRITE;
/*!40000 ALTER TABLE `approval_approver` DISABLE KEYS */;
INSERT INTO `approval_approver` VALUES ('2','3','DEPT-3','INS->LDAGULTO->2022-07-23 02:34:08'),('4','3','DEPT-3','INS->LDAGULTO->2022-07-23 02:39:54'),('3','3','DEPT-3','INS->LDAGULTO->2022-07-23 02:40:04'),('1','3','DEPT-3','INS->LDAGULTO->2022-07-24 06:44:58');
/*!40000 ALTER TABLE `approval_approver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_exception`
--

DROP TABLE IF EXISTS `approval_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_exception` (
  `APPROVAL_TYPE_ID` varchar(100) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_exception`
--

LOCK TABLES `approval_exception` WRITE;
/*!40000 ALTER TABLE `approval_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_type`
--

DROP TABLE IF EXISTS `approval_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_type` (
  `APPROVAL_TYPE_ID` varchar(100) NOT NULL,
  `APPROVAL_TYPE` varchar(100) NOT NULL,
  `APPROVAL_TYPE_DESCRIPTION` varchar(100) DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(500) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`APPROVAL_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_type`
--

LOCK TABLES `approval_type` WRITE;
/*!40000 ALTER TABLE `approval_type` DISABLE KEYS */;
INSERT INTO `approval_type` VALUES ('1','Attendance Adjustment Recommendation','To recommend attendance adjustment.','ACTIVE','TL-384','ACT->LDAGULTO->2022-07-23 04:41:23'),('2','Attendance Adjustment Approval','To approve attendance adjustment.','ACTIVE','TL-387','ACT->LDAGULTO->2022-07-25 05:12:08'),('3','Attendance Creation Recommendation','To recommend attendance creation.','ACTIVE','TL-388','ACT->LDAGULTO->2022-07-23 04:43:59'),('4','Attendance Creation Approval','To approve attendance creation.','ACTIVE','TL-389','ACT->LDAGULTO->2022-07-25 05:21:36');
/*!40000 ALTER TABLE `approval_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_adjustment`
--

DROP TABLE IF EXISTS `attendance_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_adjustment` (
  `ADJUSTMENT_ID` varchar(100) NOT NULL,
  `ATTENDANCE_ID` varchar(100) NOT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `TIME_IN` datetime DEFAULT NULL,
  `TIME_OUT` datetime DEFAULT NULL,
  `REASON` varchar(500) NOT NULL,
  `ATTACHMENT` varchar(500) DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL,
  `SANCTION` int(1) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `FOR_RECOMMENDATION_DATE` datetime DEFAULT NULL,
  `RECOMMENDATION_DATE` datetime DEFAULT NULL,
  `RECOMMENDATION_BY` varchar(100) DEFAULT NULL,
  `RECOMMENDATION_REMARKS` varchar(500) DEFAULT NULL,
  `DECISION_DATE` datetime DEFAULT NULL,
  `DECISION_BY` varchar(100) DEFAULT NULL,
  `DECISION_REMARKS` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(500) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ADJUSTMENT_ID`),
  KEY `attendance_adjustment_index` (`ADJUSTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_adjustment`
--

LOCK TABLES `attendance_adjustment` WRITE;
/*!40000 ALTER TABLE `attendance_adjustment` DISABLE KEYS */;
INSERT INTO `attendance_adjustment` VALUES ('10','10','3','2022-07-08 08:00:00','2022-07-08 17:31:00','Test','./company/employee/attendance_adjustment/vp10qn3byl.png','REJ',0,'2022-07-23 14:22:38',NULL,NULL,NULL,NULL,'2022-07-24 14:52:20','LDAGULTO','tEST','TL-385','REJ->LDAGULTO->2022-07-24 02:52:20'),('11','9','3','2022-07-12 08:00:00',NULL,'Test','./company/employee/attendance_adjustment/zo9gz9rb9r.jpg','REJ',0,'2022-07-23 14:23:54',NULL,NULL,NULL,NULL,'2022-07-24 14:52:26','LDAGULTO','tEST','TL-386','REJ->LDAGULTO->2022-07-24 02:52:26'),('12','9','3','2022-07-12 09:00:00',NULL,'Test','./company/employee/attendance_adjustment/vl8bnxsakp.png','CAN',0,'2022-07-24 14:57:54','2022-07-24 14:58:02','2022-07-24 14:58:29','LDAGULTO',NULL,'2022-07-24 15:08:58','LDAGULTO','weq','TL-403','CAN->LDAGULTO->2022-07-24 03:08:58'),('13','9','3','2022-07-12 08:00:00',NULL,'Test','./company/employee/attendance_adjustment/xli33tr0nc.png','CAN',0,'2022-07-24 15:06:32','2022-07-24 15:06:38','2022-07-24 15:08:18','LDAGULTO','Test','2022-07-24 15:08:58','LDAGULTO','weq','TL-404','CAN->LDAGULTO->2022-07-24 03:08:58'),('14','9','3','2022-07-12 08:00:00',NULL,'Test','./company/employee/attendance_adjustment/c4dwdxmnl9.png','APV',1,'2022-07-24 15:09:27','2022-07-24 15:09:33','2022-07-24 15:09:38','LDAGULTO','tet','2022-07-26 20:48:44','LDAGULTO','Test','TL-405','APV->LDAGULTO->2022-07-26 08:48:44'),('15','9','3','2022-07-12 08:00:00',NULL,'Test','./company/employee/attendance_adjustment/wbz2d0orzs.jpg','APV',0,'2022-07-24 18:44:21','2022-07-24 18:44:23','2022-07-26 21:38:43','LDAGULTO','','2022-07-27 23:31:27','LDAGULTO','asd','TL-412','APV->LDAGULTO->2022-07-27 11:31:27'),('16','9','3','2022-07-12 08:00:00',NULL,'test','./company/employee/attendance_adjustment/excvap065x.png','CAN',0,'2022-07-25 17:09:16',NULL,NULL,NULL,NULL,'2022-07-27 22:11:48','LDAGULTO','ads','TL-424','CAN->LDAGULTO->2022-07-27 10:11:48'),('17','9','3','2022-07-12 08:30:00',NULL,'Test','./company/employee/attendance_adjustment/7dwgcfuh35.png','APV',1,'2022-07-26 20:53:31','2022-07-26 20:53:37','2022-07-26 20:54:21','LDAGULTO','','2022-07-26 20:54:28','LDAGULTO','Test','TL-426','APV->LDAGULTO->2022-07-26 08:54:28'),('18','14','3','2022-07-27 22:16:00','2022-07-27 22:16:00','Test','./company/employee/attendance_adjustment/vm8d7mifze.pdf','REJ',0,'2022-07-27 23:30:37','2022-07-27 23:30:52','2022-07-27 23:31:13','LDAGULTO','','2022-07-27 23:31:41','LDAGULTO','asdasd','TL-441','REJ->LDAGULTO->2022-07-27 11:31:41'),('19','15','3','2022-08-02 08:30:00',NULL,'Test','./company/employee/attendance_adjustment/z681bd2nm2.png','APV',1,'2022-07-31 11:19:19','2022-07-31 11:19:22','2022-07-31 11:19:31','LDAGULTO','','2022-07-31 11:19:47','LDAGULTO','res','TL-447','APV->LDAGULTO->2022-07-31 11:19:47');
/*!40000 ALTER TABLE `attendance_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_creation`
--

DROP TABLE IF EXISTS `attendance_creation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_creation` (
  `CREATION_ID` varchar(100) NOT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `TIME_IN` datetime DEFAULT NULL,
  `TIME_OUT` datetime DEFAULT NULL,
  `REASON` varchar(500) NOT NULL,
  `ATTACHMENT` varchar(500) DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL,
  `SANCTION` int(1) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `FOR_RECOMMENDATION_DATE` datetime DEFAULT NULL,
  `RECOMMENDATION_DATE` datetime DEFAULT NULL,
  `RECOMMENDATION_BY` varchar(100) DEFAULT NULL,
  `RECOMMENDATION_REMARKS` varchar(500) DEFAULT NULL,
  `DECISION_DATE` datetime DEFAULT NULL,
  `DECISION_BY` varchar(100) DEFAULT NULL,
  `DECISION_REMARKS` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(500) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CREATION_ID`),
  KEY `attendance_creation_index` (`CREATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_creation`
--

LOCK TABLES `attendance_creation` WRITE;
/*!40000 ALTER TABLE `attendance_creation` DISABLE KEYS */;
INSERT INTO `attendance_creation` VALUES ('10','3','2022-07-14 08:00:00',NULL,'Cancell multiple\r\n','./company/employee/attendance_creation/n13xsknwvq.png','REJ',0,'2022-07-24 15:53:19','2022-07-24 15:53:41',NULL,NULL,NULL,'2022-07-24 15:53:49','LDAGULTO','test','TL-409','REJ->LDAGULTO->2022-07-24 03:53:49'),('11','3','2022-07-14 08:00:00',NULL,'Recommend multiple','./company/employee/attendance_creation/8vz3iipoot.png','REJ',0,'2022-07-24 15:53:35','2022-07-24 15:53:41',NULL,NULL,NULL,'2022-07-24 15:54:15','LDAGULTO','asd','TL-410','REJ->LDAGULTO->2022-07-24 03:54:15'),('12','3','2022-07-11 08:00:00','2022-07-11 16:30:00','Test','./company/employee/attendance_creation/wqzyc1ro5u.jpg','APV',1,'2022-07-25 17:12:38','2022-07-26 20:59:04','2022-07-26 20:59:10','LDAGULTO','','2022-07-26 21:02:13','LDAGULTO','Test','TL-425','APV->LDAGULTO->2022-07-26 09:02:13'),('13','3','2022-07-28 08:00:00',NULL,'Test','./company/employee/attendance_creation/vdyuwofjsi.pdf','REJ',0,'2022-07-27 23:32:11','2022-07-27 23:32:14','2022-07-27 23:33:06','LDAGULTO','ad','2022-07-27 23:33:52','LDAGULTO','ad','TL-442','REJ->LDAGULTO->2022-07-27 11:33:52'),('14','3','2022-07-29 08:00:00',NULL,'Test','./company/employee/attendance_creation/v21t56ekpl.pdf','REJ',0,'2022-07-27 23:32:25','2022-07-27 23:32:48',NULL,NULL,NULL,'2022-07-27 23:33:14','LDAGULTO','asd','TL-443','REJ->LDAGULTO->2022-07-27 11:33:14'),('15','3','2022-08-01 08:00:00',NULL,'Test','./company/employee/attendance_creation/drkx181egf.pdf','CAN',0,'2022-07-27 23:32:39',NULL,NULL,NULL,NULL,'2022-07-27 23:32:41','LDAGULTO','asd','TL-444','CAN->LDAGULTO->2022-07-27 11:32:41'),('16','3','2022-08-02 08:00:00',NULL,'Test','./company/employee/attendance_creation/n2sjk3r7rx.pdf','APV',0,'2022-07-27 23:34:27','2022-07-27 23:34:30','2022-07-27 23:34:42','LDAGULTO','','2022-07-27 23:36:07','LDAGULTO','asd','TL-445','APV->LDAGULTO->2022-07-27 11:36:07'),('6','3','2022-07-04 08:30:00','2022-07-04 17:30:00','Test','./company/employee/attendance_creation/nsibuhwou5.png','APV',0,'2022-07-23 16:43:47','2022-07-24 15:50:31','2022-07-24 15:51:17','LDAGULTO','Test','2022-07-26 21:06:13','LDAGULTO','Test','TL-390','APV->LDAGULTO->2022-07-26 09:06:13'),('7','3','2022-07-07 08:00:00',NULL,'Reject','./company/employee/attendance_creation/m8moi0t7b9.png','CAN',0,'2022-07-24 15:52:45','2022-07-24 15:53:41',NULL,NULL,NULL,'2022-07-24 15:54:19','LDAGULTO','asdasd','TL-406','CAN->LDAGULTO->2022-07-24 03:54:19'),('8','3','2022-07-08 08:00:00',NULL,'Reject multiple\r\n','./company/employee/attendance_creation/w3gx0zmme5.png','CAN',0,'2022-07-24 15:52:57','2022-07-24 15:53:41',NULL,NULL,NULL,'2022-07-24 15:54:23','LDAGULTO','asdasd','TL-407','CAN->LDAGULTO->2022-07-24 03:54:23'),('9','3','2022-07-15 08:00:00',NULL,'cancel','./company/employee/attendance_creation/dddoup9z9m.png','CAN',0,'2022-07-24 15:53:07','2022-07-24 15:53:41','2022-07-24 15:54:26','LDAGULTO','asdasd','2022-07-27 23:34:09','LDAGULTO','asd','TL-408','CAN->LDAGULTO->2022-07-27 11:34:09');
/*!40000 ALTER TABLE `attendance_creation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_record`
--

DROP TABLE IF EXISTS `attendance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_record` (
  `ATTENDANCE_ID` varchar(100) NOT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `TIME_IN` datetime DEFAULT NULL,
  `TIME_IN_LOCATION` varchar(100) DEFAULT NULL,
  `TIME_IN_IP_ADDRESS` varchar(20) DEFAULT NULL,
  `TIME_IN_BY` varchar(100) DEFAULT NULL,
  `TIME_IN_BEHAVIOR` varchar(20) DEFAULT NULL,
  `TIME_IN_NOTE` varchar(200) DEFAULT NULL,
  `TIME_OUT` datetime DEFAULT NULL,
  `TIME_OUT_LOCATION` varchar(100) DEFAULT NULL,
  `TIME_OUT_IP_ADDRESS` varchar(20) DEFAULT NULL,
  `TIME_OUT_BY` varchar(100) DEFAULT NULL,
  `TIME_OUT_BEHAVIOR` varchar(100) DEFAULT NULL,
  `TIME_OUT_NOTE` varchar(200) DEFAULT NULL,
  `LATE` double DEFAULT NULL,
  `EARLY_LEAVING` double DEFAULT NULL,
  `OVERTIME` double DEFAULT NULL,
  `TOTAL_WORKING_HOURS` double DEFAULT NULL,
  `REMARKS` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(500) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTENDANCE_ID`),
  KEY `attendance_record_index` (`ATTENDANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_record`
--

LOCK TABLES `attendance_record` WRITE;
/*!40000 ALTER TABLE `attendance_record` DISABLE KEYS */;
INSERT INTO `attendance_record` VALUES ('10','3','2022-07-08 08:00:00','15.4735062, 120.9761487','::1','LDAGULTO','REG','','2022-07-08 17:31:00','15.4735062, 120.9761487','::1','LDAGULTO','REG','',0,0,0,8,'','TL-331','UPD->LDAGULTO->2022-07-26 09:05:15'),('11','3','2022-07-08 08:00:00',NULL,'::1','LDAGULTO','REG',NULL,'2022-07-08 16:30:00',NULL,'::1','LDAGULTO','EL',NULL,0,30,0,0,'','TL-427','UPD->LDAGULTO->2022-07-26 09:05:24'),('12','3','2022-07-11 08:00:00',NULL,'::1','LDAGULTO','REG',NULL,'2022-07-11 17:00:00',NULL,'::1','LDAGULTO','OT',NULL,0,0,4,4,'System Generated: Created using attendance creation.','TL-428','UPD->LDAGULTO->2022-07-26 09:04:58'),('13','3','2022-07-04 08:30:00',NULL,'::1','LDAGULTO','LATE',NULL,'2022-07-04 17:30:00',NULL,'::1','LDAGULTO','OT',NULL,30,0,4,0,'System Generated: Created using attendance creation.','TL-429','INS->LDAGULTO->2022-07-26 09:06:13'),('14','3','2022-07-27 22:16:00','','::1','LDAGULTO','LATE','','2022-07-27 22:16:00','','::1','LDAGULTO','OT','',796,0,4,0,NULL,'TL-440','UPD->LDAGULTO->2022-07-27 10:16:10'),('15','3','2022-08-02 08:30:00',NULL,'::1','LDAGULTO','LATE',NULL,NULL,NULL,'','','',NULL,30,0,0,0,'System Generated: Attendance adjusted using attendance adjustment.','TL-446','UPD->LDAGULTO->2022-07-31 11:19:47'),('17','3','2022-08-03 16:43:00','15.4763264, 120.9532416','::1','LDAGULTO','LATE',NULL,'2022-08-03 16:47:00','15.4763264, 120.9532416','::1','LDAGULTO','EL','Scanned',463,13,0,0,NULL,'TL-452','UPD->LDAGULTO->2022-08-03 04:47:38'),('18','3','2022-08-04 15:50:00','15.4943473, 120.9761487','::1','LDAGULTO','LATE','Recorded using badge scanning.','2022-08-04 15:52:00','15.4943473, 120.9761487','::1','LDAGULTO','EL','Recorded using badge scanning.',410,68,0,0,NULL,'TL-453','UPD->LDAGULTO->2022-08-04 03:52:09'),('8','3','2022-07-07 08:00:00','120.9761487,15.4735062','::1','LDAGULTO','REG','','2022-07-07 17:00:00',NULL,'::1','LDAGULTO','REG',NULL,0,0,0,8,NULL,'TL-323','UPD->LDAGULTO->2022-07-07 03:31:14'),('9','3','2022-07-12 08:00:00',NULL,'::1','LDAGULTO','REG',NULL,NULL,NULL,'','','',NULL,0,0,0,0,'System Generated: Attendance adjusted using attendance adjustment.','TL-330','UPD->LDAGULTO->2022-07-27 11:31:27');
/*!40000 ALTER TABLE `attendance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_setting`
--

DROP TABLE IF EXISTS `attendance_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_setting` (
  `ATTENDANCE_SETTING_ID` int(11) NOT NULL,
  `MAX_ATTENDANCE` int(11) NOT NULL,
  `LATE_GRACE_PERIOD` int(11) NOT NULL,
  `TIME_OUT_INTERVAL` int(11) NOT NULL,
  `LATE_POLICY` int(11) NOT NULL,
  `EARLY_LEAVING_POLICY` int(11) NOT NULL,
  `OVERTIME_POLICY` int(11) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(500) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTENDANCE_SETTING_ID`),
  KEY `attendance_setting_index` (`ATTENDANCE_SETTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_setting`
--

LOCK TABLES `attendance_setting` WRITE;
/*!40000 ALTER TABLE `attendance_setting` DISABLE KEYS */;
INSERT INTO `attendance_setting` VALUES (1,1,0,1,0,0,60,'TL-299','UPD->LDAGULTO->2022-08-04 03:51:32');
/*!40000 ALTER TABLE `attendance_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_department`
--

DROP TABLE IF EXISTS `employee_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_department` (
  `DEPARTMENT_ID` varchar(50) NOT NULL,
  `DEPARTMENT` varchar(100) NOT NULL,
  `PARENT_DEPARTMENT` varchar(50) DEFAULT NULL,
  `MANAGER` varchar(100) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `employee_department_index` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_department`
--

LOCK TABLES `employee_department` WRITE;
/*!40000 ALTER TABLE `employee_department` DISABLE KEYS */;
INSERT INTO `employee_department` VALUES ('DEPT-3','Data Center','','','TL-187','UPD->ADMIN->2022-06-24 01:42:50');
/*!40000 ALTER TABLE `employee_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_departure_reason`
--

DROP TABLE IF EXISTS `employee_departure_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_departure_reason` (
  `DEPARTURE_REASON_ID` varchar(50) NOT NULL,
  `DEPARTURE_REASON` varchar(100) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPARTURE_REASON_ID`),
  KEY `employee_departure_reason_index` (`DEPARTURE_REASON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_departure_reason`
--

LOCK TABLES `employee_departure_reason` WRITE;
/*!40000 ALTER TABLE `employee_departure_reason` DISABLE KEYS */;
INSERT INTO `employee_departure_reason` VALUES ('3','Resigned','TL-244','INS->ADMIN->2022-06-24 01:46:33'),('4','Terminated','TL-245','INS->ADMIN->2022-06-24 01:46:37');
/*!40000 ALTER TABLE `employee_departure_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_details` (
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `BADGE_ID` varchar(100) DEFAULT NULL,
  `EMPLOYEE_IMAGE` varchar(500) DEFAULT NULL,
  `FILE_AS` varchar(350) NOT NULL,
  `FIRST_NAME` varchar(100) NOT NULL,
  `MIDDLE_NAME` varchar(100) NOT NULL,
  `LAST_NAME` varchar(100) NOT NULL,
  `SUFFIX` varchar(5) DEFAULT NULL,
  `COMPANY` varchar(50) DEFAULT NULL,
  `JOB_POSITION` varchar(50) DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  `WORK_LOCATION` varchar(50) DEFAULT NULL,
  `WORKING_HOURS` varchar(50) DEFAULT NULL,
  `MANAGER` varchar(100) DEFAULT NULL,
  `COACH` varchar(100) DEFAULT NULL,
  `EMPLOYEE_TYPE` varchar(100) DEFAULT NULL,
  `EMPLOYEE_STATUS` varchar(100) DEFAULT NULL,
  `PERMANENCY_DATE` date DEFAULT NULL,
  `ONBOARD_DATE` date DEFAULT NULL,
  `OFFBOARD_DATE` date DEFAULT NULL,
  `DEPARTURE_REASON` varchar(50) DEFAULT NULL,
  `DETAILED_REASON` varchar(500) DEFAULT NULL,
  `WORK_EMAIL` varchar(50) DEFAULT NULL,
  `WORK_TELEPHONE` varchar(20) DEFAULT NULL,
  `WORK_MOBILE` varchar(20) DEFAULT NULL,
  `SSS` varchar(20) DEFAULT NULL,
  `TIN` varchar(20) DEFAULT NULL,
  `PAGIBIG` varchar(20) DEFAULT NULL,
  `PHILHEALTH` varchar(20) DEFAULT NULL,
  `BANK_ACCOUNT_NUMBER` varchar(100) DEFAULT NULL,
  `HOME_WORK_DISTANCE` double DEFAULT NULL,
  `PERSONAL_EMAIL` varchar(50) DEFAULT NULL,
  `PERSONAL_TELEPHONE` varchar(20) DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(20) DEFAULT NULL,
  `STREET_1` varchar(200) DEFAULT NULL,
  `STREET_2` varchar(200) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `ZIP_CODE` varchar(10) DEFAULT NULL,
  `MARITAL_STATUS` varchar(20) DEFAULT NULL,
  `SPOUSE_NAME` varchar(500) DEFAULT NULL,
  `SPOUSE_BIRTHDAY` date DEFAULT NULL,
  `EMERGENCY_CONTACT` varchar(500) DEFAULT NULL,
  `EMERGENCY_PHONE` varchar(20) DEFAULT NULL,
  `NATIONALITY` int(11) DEFAULT NULL,
  `IDENTIFICATION_NUMBER` varchar(100) DEFAULT NULL,
  `PASSPORT_NUMBER` varchar(100) DEFAULT NULL,
  `GENDER` varchar(20) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `CERTIFICATE_LEVEL` varchar(20) DEFAULT NULL,
  `FIELD_OF_STUDY` varchar(200) DEFAULT NULL,
  `SCHOOL` varchar(200) DEFAULT NULL,
  `PLACE_OF_BIRTH` varchar(500) DEFAULT NULL,
  `NUMBER_OF_CHILDREN` int(11) DEFAULT NULL,
  `VISA_NUMBER` varchar(100) DEFAULT NULL,
  `WORK_PERMIT_NUMBER` varchar(100) DEFAULT NULL,
  `VISA_EXPIRY_DATE` date DEFAULT NULL,
  `WORK_PERMIT_EXPIRY_DATE` date DEFAULT NULL,
  `WORK_PERMIT` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `employee_details_index` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details`
--

LOCK TABLES `employee_details` WRITE;
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
INSERT INTO `employee_details` VALUES ('3','LDAGULTO','','./company/employee/image/g7veqijcjq.png','Agulto, Lawrence De Vera','Lawrence','De Vera','Agulto','','','7','DEPT-3','','3','','','','ACTIVE',NULL,NULL,NULL,NULL,NULL,'','','','','','','','',0,'','','','','',NULL,0,'','','','',NULL,'','',0,'','','',NULL,'','','','',0,'','',NULL,NULL,NULL,'TL-275','UPD->LDAGULTO->2022-07-24 02:14:22');
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_job_position`
--

DROP TABLE IF EXISTS `employee_job_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_job_position` (
  `JOB_POSITION_ID` varchar(50) NOT NULL,
  `JOB_POSITION` varchar(100) NOT NULL,
  `JOB_DESCRIPTION` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JOB_POSITION_ID`),
  KEY `employee_job_position_index` (`JOB_POSITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_job_position`
--

LOCK TABLES `employee_job_position` WRITE;
/*!40000 ALTER TABLE `employee_job_position` DISABLE KEYS */;
INSERT INTO `employee_job_position` VALUES ('7','Data Center Staff','./company/job_description/kqnkbkekrp.pdf','TL-209','UPD->ADMIN->2022-06-28 09:00:46');
/*!40000 ALTER TABLE `employee_job_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_type` (
  `EMPLOYEE_TYPE_ID` varchar(50) NOT NULL,
  `EMPLOYEE_TYPE` varchar(100) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_TYPE_ID`),
  KEY `employee_type_index` (`EMPLOYEE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES ('3','Regular Employee','TL-242','INS->ADMIN->2022-06-24 01:43:01'),('4','Probationary Employee','TL-243','INS->ADMIN->2022-06-24 01:43:08');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_work_location`
--

DROP TABLE IF EXISTS `employee_work_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_work_location` (
  `WORK_LOCATION_ID` varchar(50) NOT NULL,
  `WORK_LOCATION` varchar(100) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `STREET_1` varchar(200) DEFAULT NULL,
  `STREET_2` varchar(200) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `ZIP_CODE` varchar(10) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WORK_LOCATION_ID`),
  KEY `employee_work_location_index` (`WORK_LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_work_location`
--

LOCK TABLES `employee_work_location` WRITE;
/*!40000 ALTER TABLE `employee_work_location` DISABLE KEYS */;
INSERT INTO `employee_work_location` VALUES ('6','Head Office','','','','','',NULL,0,'','','TL-222','UPD->ADMIN->2022-06-24 01:46:20');
/*!40000 ALTER TABLE `employee_work_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_working_hours`
--

DROP TABLE IF EXISTS `employee_working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_working_hours` (
  `WORKING_HOURS_ID` varchar(50) NOT NULL,
  `WORKING_HOURS` varchar(100) NOT NULL,
  `SCHEDULE_TYPE` varchar(20) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WORKING_HOURS_ID`),
  KEY `employee_working_hours_index` (`WORKING_HOURS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_working_hours`
--

LOCK TABLES `employee_working_hours` WRITE;
/*!40000 ALTER TABLE `employee_working_hours` DISABLE KEYS */;
INSERT INTO `employee_working_hours` VALUES ('3','Regular Working Hours','REGULAR','TL-286','UPD->ADMIN->2022-06-29 10:08:35'),('4','Scheduled','SCHEDULED','TL-293','INS->ADMIN->2022-06-29 10:04:58');
/*!40000 ALTER TABLE `employee_working_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_working_hours_schedule`
--

DROP TABLE IF EXISTS `employee_working_hours_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_working_hours_schedule` (
  `WORKING_HOURS_ID` varchar(50) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `MONDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `MONDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `MONDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `MONDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `TUESDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `TUESDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `TUESDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `TUESDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `WEDNESDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `WEDNESDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `WEDNESDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `WEDNESDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `THURSDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `THURSDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `THURSDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `THURSDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `FRIDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `FRIDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `FRIDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `FRIDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `SATURDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `SATURDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `SATURDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `SATURDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `SUNDAY_MORNING_WORK_FROM` time DEFAULT NULL,
  `SUNDAY_MORNING_WORK_TO` time DEFAULT NULL,
  `SUNDAY_AFTERNOON_WORK_FROM` time DEFAULT NULL,
  `SUNDAY_AFTERNOON_WORK_TO` time DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WORKING_HOURS_ID`),
  KEY `employee_working_hours_schedule_index` (`WORKING_HOURS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_working_hours_schedule`
--

LOCK TABLES `employee_working_hours_schedule` WRITE;
/*!40000 ALTER TABLE `employee_working_hours_schedule` DISABLE KEYS */;
INSERT INTO `employee_working_hours_schedule` VALUES ('3',NULL,NULL,'08:00:00','12:00:00',NULL,NULL,'08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UPD->LDAGULTO->2022-07-02 07:30:00'),('4','2022-06-01','2022-06-30','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00','08:00:00','12:00:00','13:00:00','17:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UPD->ADMIN->2022-06-29 10:08:16');
/*!40000 ALTER TABLE `employee_working_hours_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_company`
--

DROP TABLE IF EXISTS `global_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_company` (
  `COMPANY_ID` varchar(50) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL,
  `COMPANY_LOGO` varchar(500) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `WEBSITE` varchar(100) DEFAULT NULL,
  `TAX_ID` varchar(100) DEFAULT NULL,
  `STREET_1` varchar(200) DEFAULT NULL,
  `STREET_2` varchar(200) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `ZIP_CODE` varchar(10) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`),
  KEY `global_company_index` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_company`
--

LOCK TABLES `global_company` WRITE;
/*!40000 ALTER TABLE `global_company` DISABLE KEYS */;
INSERT INTO `global_company` VALUES ('6','Encore Leasing and Finance Corp.','./company/logo/hmip56cz4c.png','email@gmail.com','telephone','mobile','https://test.php','tax','street1','street2',174,1360,'city','zip','TL-132','UPD->ADMIN->2022-06-28 09:04:04');
/*!40000 ALTER TABLE `global_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_country`
--

DROP TABLE IF EXISTS `global_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_country` (
  `COUNTRY_ID` int(11) NOT NULL,
  `COUNTRY_NAME` varchar(200) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `global_country_index` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_country`
--

LOCK TABLES `global_country` WRITE;
/*!40000 ALTER TABLE `global_country` DISABLE KEYS */;
INSERT INTO `global_country` VALUES (1,'Afghanistan',NULL,NULL),(2,'Aland Islands',NULL,NULL),(3,'Albania',NULL,NULL),(4,'Algeria',NULL,NULL),(5,'American Samoa',NULL,NULL),(6,'Andorra',NULL,NULL),(7,'Angola',NULL,NULL),(8,'Anguilla',NULL,NULL),(9,'Antarctica',NULL,NULL),(10,'Antigua And Barbuda',NULL,NULL),(11,'Argentina',NULL,NULL),(12,'Armenia',NULL,NULL),(13,'Aruba',NULL,NULL),(14,'Australia',NULL,NULL),(15,'Austria',NULL,NULL),(16,'Azerbaijan',NULL,NULL),(17,'The Bahamas',NULL,NULL),(18,'Bahrain',NULL,NULL),(19,'Bangladesh',NULL,NULL),(20,'Barbados',NULL,NULL),(21,'Belarus',NULL,NULL),(22,'Belgium',NULL,NULL),(23,'Belize',NULL,NULL),(24,'Benin',NULL,NULL),(25,'Bermuda',NULL,NULL),(26,'Bhutan',NULL,NULL),(27,'Bolivia',NULL,NULL),(28,'Bosnia and Herzegovina',NULL,NULL),(29,'Botswana',NULL,NULL),(30,'Bouvet Island',NULL,NULL),(31,'Brazil',NULL,NULL),(32,'British Indian Ocean Territory',NULL,NULL),(33,'Brunei',NULL,NULL),(34,'Bulgaria',NULL,NULL),(35,'Burkina Faso',NULL,NULL),(36,'Burundi',NULL,NULL),(37,'Cambodia',NULL,NULL),(38,'Cameroon',NULL,NULL),(39,'Canada',NULL,NULL),(40,'Cape Verde',NULL,NULL),(41,'Cayman Islands',NULL,NULL),(42,'Central African Republic',NULL,NULL),(43,'Chad',NULL,NULL),(44,'Chile',NULL,NULL),(45,'China',NULL,NULL),(46,'Christmas Island',NULL,NULL),(47,'Cocos (Keeling) Islands',NULL,NULL),(48,'Colombia',NULL,NULL),(49,'Comoros',NULL,NULL),(50,'Congo',NULL,NULL),(51,'Democratic Republic of the Congo',NULL,NULL),(52,'Cook Islands',NULL,NULL),(53,'Costa Rica',NULL,NULL),(54,'Cote D\'Ivoire (Ivory Coast)',NULL,NULL),(55,'Croatia',NULL,NULL),(56,'Cuba',NULL,NULL),(57,'Cyprus',NULL,NULL),(58,'Czech Republic',NULL,NULL),(59,'Denmark',NULL,NULL),(60,'Djibouti',NULL,NULL),(61,'Dominica',NULL,NULL),(62,'Dominican Republic',NULL,NULL),(63,'East Timor',NULL,NULL),(64,'Ecuador',NULL,NULL),(65,'Egypt',NULL,NULL),(66,'El Salvador',NULL,NULL),(67,'Equatorial Guinea',NULL,NULL),(68,'Eritrea',NULL,NULL),(69,'Estonia',NULL,NULL),(70,'Ethiopia',NULL,NULL),(71,'Falkland Islands',NULL,NULL),(72,'Faroe Islands',NULL,NULL),(73,'Fiji Islands',NULL,NULL),(74,'Finland',NULL,NULL),(75,'France',NULL,NULL),(76,'French Guiana',NULL,NULL),(77,'French Polynesia',NULL,NULL),(78,'French Southern Territories',NULL,NULL),(79,'Gabon',NULL,NULL),(80,'Gambia The',NULL,NULL),(81,'Georgia',NULL,NULL),(82,'Germany',NULL,NULL),(83,'Ghana',NULL,NULL),(84,'Gibraltar',NULL,NULL),(85,'Greece',NULL,NULL),(86,'Greenland',NULL,NULL),(87,'Grenada',NULL,NULL),(88,'Guadeloupe',NULL,NULL),(89,'Guam',NULL,NULL),(90,'Guatemala',NULL,NULL),(91,'Guernsey and Alderney',NULL,NULL),(92,'Guinea',NULL,NULL),(93,'Guinea-Bissau',NULL,NULL),(94,'Guyana',NULL,NULL),(95,'Haiti',NULL,NULL),(96,'Heard Island and McDonald Islands',NULL,NULL),(97,'Honduras',NULL,NULL),(98,'Hong Kong S.A.R.',NULL,NULL),(99,'Hungary',NULL,NULL),(100,'Iceland',NULL,NULL),(101,'India',NULL,NULL),(102,'Indonesia',NULL,NULL),(103,'Iran',NULL,NULL),(104,'Iraq',NULL,NULL),(105,'Ireland',NULL,NULL),(106,'Israel',NULL,NULL),(107,'Italy',NULL,NULL),(108,'Jamaica',NULL,NULL),(109,'Japan',NULL,NULL),(110,'Jersey',NULL,NULL),(111,'Jordan',NULL,NULL),(112,'Kazakhstan',NULL,NULL),(113,'Kenya',NULL,NULL),(114,'Kiribati',NULL,NULL),(115,'North Korea',NULL,NULL),(116,'South Korea',NULL,NULL),(117,'Kuwait',NULL,NULL),(118,'Kyrgyzstan',NULL,NULL),(119,'Laos',NULL,NULL),(120,'Latvia',NULL,NULL),(121,'Lebanon',NULL,NULL),(122,'Lesotho',NULL,NULL),(123,'Liberia',NULL,NULL),(124,'Libya',NULL,NULL),(125,'Liechtenstein',NULL,NULL),(126,'Lithuania',NULL,NULL),(127,'Luxembourg',NULL,NULL),(128,'Macau S.A.R.',NULL,NULL),(129,'Macedonia',NULL,NULL),(130,'Madagascar',NULL,NULL),(131,'Malawi',NULL,NULL),(132,'Malaysia',NULL,NULL),(133,'Maldives',NULL,NULL),(134,'Mali',NULL,NULL),(135,'Malta',NULL,NULL),(136,'Man (Isle of)',NULL,NULL),(137,'Marshall Islands',NULL,NULL),(138,'Martinique',NULL,NULL),(139,'Mauritania',NULL,NULL),(140,'Mauritius',NULL,NULL),(141,'Mayotte',NULL,NULL),(142,'Mexico',NULL,NULL),(143,'Micronesia',NULL,NULL),(144,'Moldova',NULL,NULL),(145,'Monaco',NULL,NULL),(146,'Mongolia',NULL,NULL),(147,'Montenegro',NULL,NULL),(148,'Montserrat',NULL,NULL),(149,'Morocco',NULL,NULL),(150,'Mozambique',NULL,NULL),(151,'Myanmar',NULL,NULL),(152,'Namibia',NULL,NULL),(153,'Nauru',NULL,NULL),(154,'Nepal',NULL,NULL),(155,'Bonaire, Sint Eustatius and Saba',NULL,NULL),(156,'Netherlands',NULL,NULL),(157,'New Caledonia',NULL,NULL),(158,'New Zealand',NULL,NULL),(159,'Nicaragua',NULL,NULL),(160,'Niger',NULL,NULL),(161,'Nigeria',NULL,NULL),(162,'Niue',NULL,NULL),(163,'Norfolk Island',NULL,NULL),(164,'Northern Mariana Islands',NULL,NULL),(165,'Norway',NULL,NULL),(166,'Oman',NULL,NULL),(167,'Pakistan',NULL,NULL),(168,'Palau',NULL,NULL),(169,'Palestinian Territory Occupied',NULL,NULL),(170,'Panama',NULL,NULL),(171,'Papua new Guinea',NULL,NULL),(172,'Paraguay',NULL,NULL),(173,'Peru',NULL,NULL),(174,'Philippines',NULL,NULL),(175,'Pitcairn Island',NULL,NULL),(176,'Poland',NULL,NULL),(177,'Portugal',NULL,NULL),(178,'Puerto Rico',NULL,NULL),(179,'Qatar',NULL,NULL),(180,'Reunion',NULL,NULL),(181,'Romania',NULL,NULL),(182,'Russia',NULL,NULL),(183,'Rwanda',NULL,NULL),(184,'Saint Helena',NULL,NULL),(185,'Saint Kitts And Nevis',NULL,NULL),(186,'Saint Lucia',NULL,NULL),(187,'Saint Pierre and Miquelon',NULL,NULL),(188,'Saint Vincent And The Grenadines',NULL,NULL),(189,'Saint-Barthelemy',NULL,NULL),(190,'Saint-Martin (French part)',NULL,NULL),(191,'Samoa',NULL,NULL),(192,'San Marino',NULL,NULL),(193,'Sao Tome and Principe',NULL,NULL),(194,'Saudi Arabia',NULL,NULL),(195,'Senegal',NULL,NULL),(196,'Serbia',NULL,NULL),(197,'Seychelles',NULL,NULL),(198,'Sierra Leone',NULL,NULL),(199,'Singapore',NULL,NULL),(200,'Slovakia',NULL,NULL),(201,'Slovenia',NULL,NULL),(202,'Solomon Islands',NULL,NULL),(203,'Somalia',NULL,NULL),(204,'South Africa',NULL,NULL),(205,'South Georgia',NULL,NULL),(206,'South Sudan',NULL,NULL),(207,'Spain',NULL,NULL),(208,'Sri Lanka',NULL,NULL),(209,'Sudan',NULL,NULL),(210,'Suriname',NULL,NULL),(211,'Svalbard And Jan Mayen Islands',NULL,NULL),(212,'Swaziland',NULL,NULL),(213,'Sweden',NULL,NULL),(214,'Switzerland',NULL,NULL),(215,'Syria',NULL,NULL),(216,'Taiwan',NULL,NULL),(217,'Tajikistan',NULL,NULL),(218,'Tanzania',NULL,NULL),(219,'Thailand',NULL,NULL),(220,'Togo',NULL,NULL),(221,'Tokelau',NULL,NULL),(222,'Tonga',NULL,NULL),(223,'Trinidad And Tobago',NULL,NULL),(224,'Tunisia',NULL,NULL),(225,'Turkey',NULL,NULL),(226,'Turkmenistan',NULL,NULL),(227,'Turks And Caicos Islands',NULL,NULL),(228,'Tuvalu',NULL,NULL),(229,'Uganda',NULL,NULL),(230,'Ukraine',NULL,NULL),(231,'United Arab Emirates',NULL,NULL),(232,'United Kingdom',NULL,NULL),(233,'United States',NULL,NULL),(234,'United States Minor Outlying Islands',NULL,NULL),(235,'Uruguay',NULL,NULL),(236,'Uzbekistan',NULL,NULL),(237,'Vanuatu',NULL,NULL),(238,'Vatican City State (Holy See)',NULL,NULL),(239,'Venezuela',NULL,NULL),(240,'Vietnam',NULL,NULL),(241,'Virgin Islands (British)',NULL,NULL),(242,'Virgin Islands (US)',NULL,NULL),(243,'Wallis And Futuna Islands',NULL,NULL),(244,'Western Sahara',NULL,NULL),(245,'Yemen',NULL,NULL),(246,'Zambia',NULL,NULL),(247,'Zimbabwe',NULL,NULL),(248,'Kosovo',NULL,NULL),(249,'Curaçao',NULL,NULL),(250,'Sint Maarten (Dutch part)',NULL,NULL);
/*!40000 ALTER TABLE `global_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_interface_setting`
--

DROP TABLE IF EXISTS `global_interface_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_interface_setting` (
  `INTERFACE_SETTING_ID` int(50) NOT NULL,
  `LOGIN_BACKGROUND` varchar(500) DEFAULT NULL,
  `LOGIN_LOGO` varchar(500) DEFAULT NULL,
  `MENU_LOGO` varchar(500) DEFAULT NULL,
  `MENU_ICON` varchar(500) DEFAULT NULL,
  `FAVICON` varchar(500) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`INTERFACE_SETTING_ID`),
  KEY `global_interface_setting_index` (`INTERFACE_SETTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_interface_setting`
--

LOCK TABLES `global_interface_setting` WRITE;
/*!40000 ALTER TABLE `global_interface_setting` DISABLE KEYS */;
INSERT INTO `global_interface_setting` VALUES (1,'./assets/images/application_settings/login-bg.jpg','./assets/images/application_settings/login-logo.png','./assets/images/application_settings/menu-logo.png','./assets/images/application_settings/logo-icon-light.png','./assets/images/application_settings/favicon.png','TL-166','UPD->ADMIN->2022-06-19 10:14:08');
/*!40000 ALTER TABLE `global_interface_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_mail_configuration`
--

DROP TABLE IF EXISTS `global_mail_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_mail_configuration` (
  `MAIL_CONFIGURATION_ID` int(11) NOT NULL,
  `MAIL_HOST` varchar(100) NOT NULL,
  `PORT` int(11) NOT NULL,
  `SMTP_AUTH` int(1) NOT NULL,
  `SMTP_AUTO_TLS` int(1) NOT NULL,
  `USERNAME` varchar(200) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `MAIL_ENCRYPTION` varchar(20) DEFAULT NULL,
  `MAIL_FROM_NAME` varchar(200) DEFAULT NULL,
  `MAIL_FROM_EMAIL` varchar(200) DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MAIL_CONFIGURATION_ID`),
  KEY `global_mail_configuration_index` (`MAIL_CONFIGURATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_mail_configuration`
--

LOCK TABLES `global_mail_configuration` WRITE;
/*!40000 ALTER TABLE `global_mail_configuration` DISABLE KEYS */;
INSERT INTO `global_mail_configuration` VALUES (1,'mail.encorefinancials.com',26,1,0,'encore-noreply@encorefinancials.com','4ca1b6476f61f35256b17005','None','Encore Notification','encore-noreply@encorefinancials.com','TL-172','UPD->ADMIN->2022-06-20 02:42:12');
/*!40000 ALTER TABLE `global_mail_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification`
--

DROP TABLE IF EXISTS `global_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification` (
  `NOTIFICATION_ID` int(11) NOT NULL,
  `NOTIFICATION_FROM` varchar(100) DEFAULT NULL,
  `NOTIFICATION_TO` varchar(100) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `NOTIFICATION_TITLE` varchar(200) DEFAULT NULL,
  `NOTIFICATION` varchar(1000) DEFAULT NULL,
  `LINK` varchar(500) DEFAULT NULL,
  `NOTIFICATION_DATE` datetime DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NOTIFICATION_ID`),
  KEY `global_notification_index` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification`
--

LOCK TABLES `global_notification` WRITE;
/*!40000 ALTER TABLE `global_notification` DISABLE KEYS */;
INSERT INTO `global_notification` VALUES (1,NULL,'3',2,'Attendance Check In','You check in on July 04, 2022 at 03:58 pm.','attendance-record.php','2022-07-04 15:58:25','INS->LDAGULTO->2022-07-04 03:58:25'),(2,NULL,'3',2,'Attendance Check Out','You time out on July 04, 2022 at 03:58 pm.','attendance-record.php','2022-07-04 17:04:39','INS->LDAGULTO->2022-07-04 05:04:39'),(3,NULL,'3',2,'Attendance Check In','You check in on July 04, 2022 at 05:07 pm.','attendance-record.php','2022-07-04 17:07:07','INS->LDAGULTO->2022-07-04 05:07:07'),(4,NULL,'3',2,'Attendance Check Out','You time out on July 04, 2022 at 05:07 pm.','attendance-record.php','2022-07-04 17:07:10','INS->LDAGULTO->2022-07-04 05:07:10'),(5,NULL,'3',2,'Attendance Check In','You check in on July 04, 2022 at 05:09 pm.','attendance-record.php','2022-07-04 17:09:31','INS->LDAGULTO->2022-07-04 05:09:31'),(6,NULL,'3',2,'Attendance Check Out','You time out on July 04, 2022 at 05:09 pm.','attendance-record.php','2022-07-04 17:11:40','INS->LDAGULTO->2022-07-04 05:11:40'),(7,NULL,'3',2,'Attendance Check In','You check in on July 05, 2022 at 10:45 am.','attendance-record.php','2022-07-05 10:45:34','INS->LDAGULTO->2022-07-05 10:45:34'),(8,NULL,'3',2,'Attendance Check Out','You time out on July 05, 2022 at 10:45 am.','attendance-record.php','2022-07-05 10:45:47','INS->LDAGULTO->2022-07-05 10:45:47'),(9,NULL,'3',2,'Attendance Check In','You check in on July 05, 2022 at 02:35 pm.','attendance-record.php','2022-07-05 14:35:54','INS->LDAGULTO->2022-07-05 02:35:54'),(10,NULL,'3',2,'Attendance Check Out','You time out on July 05, 2022 at 02:35 pm.','attendance-record.php','2022-07-05 14:36:37','INS->LDAGULTO->2022-07-05 02:36:37'),(11,NULL,'3',2,'Attendance Check In','You check in on July 07, 2022 at 03:29 pm.','attendance-record.php','2022-07-07 15:29:34','INS->LDAGULTO->2022-07-07 03:29:34'),(12,NULL,'3',2,'Attendance Check In','You check in on July 08, 2022 at 05:31 pm.','attendance-record.php','2022-07-08 17:31:47','INS->LDAGULTO->2022-07-08 05:31:47'),(13,NULL,'3',2,'Attendance Check Out','You time out on July 08, 2022 at 05:31 pm.','attendance-record.php','2022-07-08 17:31:53','INS->LDAGULTO->2022-07-08 05:31:53'),(14,NULL,'3',2,'Attendance Adjustment Cancellation','Your attendance adjustment has been cancelled by Agulto, Lawrence De Vera.','my-attendance-adjustment.php','2022-07-27 22:11:48','INS->LDAGULTO->2022-07-27 10:11:48'),(15,NULL,'3',2,'Attendance Check In','You check in on July 27, 2022 at 10:16 pm.','my-attendance.php','2022-07-27 22:16:02','INS->LDAGULTO->2022-07-27 10:16:02'),(16,NULL,'3',1,'Attendance Check Out','You time out on July 27, 2022 at 10:16 pm.','my-attendance.php','2022-07-27 22:16:10','INS->LDAGULTO->2022-07-27 10:16:10'),(17,'3','3',2,'Attendance Adjustment For Recommendation','You have a new attendance adjustment for recommendation from Agulto, Lawrence De Vera.','attendance-adjustment-recommendation.php','2022-07-27 23:30:52','INS->LDAGULTO->2022-07-27 11:30:52'),(18,'3','3',2,'Attendance Adjustment Recommendation','You have a new attendance adjustment for approval from Agulto, Lawrence De Vera.','attendance-adjustment-approval.php','2022-07-27 23:31:13','INS->LDAGULTO->2022-07-27 11:31:13'),(19,'3','3',2,'Attendance Adjustment Approval','Your attendance adjustment has been approved by Agulto, Lawrence De Vera.','my-attendance-adjustment.php','2022-07-27 23:31:27','INS->LDAGULTO->2022-07-27 11:31:27'),(20,'3','3',2,'Attendance Adjustment Rejection','Your attendance adjustment has been rejected by Agulto, Lawrence De Vera.','my-attendance-adjustment.php','2022-07-27 23:31:41','INS->LDAGULTO->2022-07-27 11:31:41'),(21,'3','3',2,'Attendance Creation For Recommendation','You have a new attendance creation for recommendation from Agulto, Lawrence De Vera.','attendance-creation-recommendation.php','2022-07-27 23:32:14','INS->LDAGULTO->2022-07-27 11:32:14'),(22,NULL,'3',2,'Attendance Creation Cancellation','Your attendance adjustment has been cancelled by Agulto, Lawrence De Vera.','my-attendance-creation.php','2022-07-27 23:32:41','INS->LDAGULTO->2022-07-27 11:32:41'),(23,'3','3',2,'Attendance Creation For Recommendation','You have a new attendance creation for recommendation from Agulto, Lawrence De Vera.','attendance-creation-recommendation.php','2022-07-27 23:32:48','INS->LDAGULTO->2022-07-27 11:32:48'),(24,'3','3',2,'Attendance Creation Recommendation','You have a new attendance creation for approval from Agulto, Lawrence De Vera.','attendance-creation-approval.php','2022-07-27 23:33:06','INS->LDAGULTO->2022-07-27 11:33:06'),(25,'3','3',2,'Attendance Creation Rejection','Your attendance creation has been rejected by Agulto, Lawrence De Vera.','my-attendance-creation.php','2022-07-27 23:33:14','INS->LDAGULTO->2022-07-27 11:33:14'),(26,'3','3',2,'Attendance Creation Rejection','Your attendance creation has been rejected by Agulto, Lawrence De Vera.','my-attendance-creation.php','2022-07-27 23:33:52','INS->LDAGULTO->2022-07-27 11:33:52'),(27,NULL,'3',2,'Attendance Creation Cancellation','Your attendance adjustment has been cancelled by Agulto, Lawrence De Vera.','my-attendance-creation.php','2022-07-27 23:34:09','INS->LDAGULTO->2022-07-27 11:34:09'),(28,'3','3',2,'Attendance Creation For Recommendation','You have a new attendance creation for recommendation from Agulto, Lawrence De Vera.','attendance-creation-recommendation.php','2022-07-27 23:34:30','INS->LDAGULTO->2022-07-27 11:34:30'),(29,'3','3',2,'Attendance Creation Recommendation','You have a new attendance creation for approval from Agulto, Lawrence De Vera.','attendance-creation-approval.php','2022-07-27 23:34:42','INS->LDAGULTO->2022-07-27 11:34:42'),(30,'3','3',2,'Attendance Creation Approval','Your attendance creation has been approved by Agulto, Lawrence De Vera.','my-attendance-creation.php','2022-07-27 23:36:07','INS->LDAGULTO->2022-07-27 11:36:07'),(31,'3','3',1,'Attendance Adjustment For Recommendation','You have a new attendance adjustment for recommendation from Agulto, Lawrence De Vera.','attendance-adjustment-recommendation.php','2022-07-31 11:19:22','INS->LDAGULTO->2022-07-31 11:19:22'),(32,'3','3',1,'Attendance Adjustment Recommendation','You have a new attendance adjustment for approval from Agulto, Lawrence De Vera.','attendance-adjustment-approval.php','2022-07-31 11:19:31','INS->LDAGULTO->2022-07-31 11:19:31'),(33,'3','3',1,'Attendance Adjustment Approval','Your attendance adjustment has been approved by Agulto, Lawrence De Vera.','my-attendance-adjustment.php','2022-07-31 11:19:47','INS->LDAGULTO->2022-07-31 11:19:47'),(34,NULL,']',0,'Attendance Check In','You check in on August 03, 2022 at 04:41 pm.','my-attendance.php','2022-08-03 16:41:10','INS->LDAGULTO->2022-08-03 04:41:10'),(35,NULL,']',0,'Attendance Check Out','You time out on August 03, 2022 at 04:42 pm.','my-attendance.php','2022-08-03 16:42:39','INS->LDAGULTO->2022-08-03 04:42:39'),(36,NULL,'3',2,'Attendance Check In','You check in on August 03, 2022 at 04:43 pm.','my-attendance.php','2022-08-03 16:43:54','INS->LDAGULTO->2022-08-03 04:43:54'),(37,NULL,'3',2,'Attendance Check Out','You time out on August 03, 2022 at 04:45 pm.','my-attendance.php','2022-08-03 16:45:50','INS->LDAGULTO->2022-08-03 04:45:50'),(38,NULL,'3',2,'Attendance Check Out','You time out on August 03, 2022 at 04:46 pm.','my-attendance.php','2022-08-03 16:46:13','INS->LDAGULTO->2022-08-03 04:46:13'),(39,NULL,'3',2,'Attendance Check Out','You time out on August 03, 2022 at 04:47 pm.','my-attendance.php','2022-08-03 16:47:19','INS->LDAGULTO->2022-08-03 04:47:19'),(40,NULL,'3',2,'Attendance Check Out','You time out on August 03, 2022 at 04:47 pm.','my-attendance.php','2022-08-03 16:47:30','INS->LDAGULTO->2022-08-03 04:47:30'),(41,NULL,'3',2,'Attendance Check Out','You time out on August 03, 2022 at 04:47 pm.','my-attendance.php','2022-08-03 16:47:38','INS->LDAGULTO->2022-08-03 04:47:38'),(42,NULL,'3',2,'Attendance Time In','You time in on August 04, 2022 at 03:50 pm.','my-attendance.php','2022-08-04 15:50:59','INS->LDAGULTO->2022-08-04 03:50:59'),(43,NULL,'3',2,'Attendance Time Out','You time out on August 04, 2022 at 03:52 pm.','my-attendance.php','2022-08-04 15:52:09','INS->LDAGULTO->2022-08-04 03:52:09');
/*!40000 ALTER TABLE `global_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification_channel`
--

DROP TABLE IF EXISTS `global_notification_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification_channel` (
  `NOTIFICATION_SETTING_ID` int(50) DEFAULT NULL,
  `CHANNEL` varchar(20) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification_channel`
--

LOCK TABLES `global_notification_channel` WRITE;
/*!40000 ALTER TABLE `global_notification_channel` DISABLE KEYS */;
INSERT INTO `global_notification_channel` VALUES (1,'EMAIL','INS->LDAGULTO->2022-07-01 02:56:32'),(1,'SYSTEM','INS->LDAGULTO->2022-07-01 02:56:32'),(2,'EMAIL','INS->LDAGULTO->2022-07-01 02:57:04'),(2,'SYSTEM','INS->LDAGULTO->2022-07-01 02:57:04'),(3,'EMAIL','INS->LDAGULTO->2022-07-27 07:54:47'),(3,'SYSTEM','INS->LDAGULTO->2022-07-27 07:54:47'),(4,'EMAIL','INS->LDAGULTO->2022-07-27 08:04:04'),(4,'SYSTEM','INS->LDAGULTO->2022-07-27 08:04:04'),(6,'EMAIL','INS->LDAGULTO->2022-07-27 08:09:45'),(6,'SYSTEM','INS->LDAGULTO->2022-07-27 08:09:45'),(5,'EMAIL','INS->LDAGULTO->2022-07-27 08:09:49'),(5,'SYSTEM','INS->LDAGULTO->2022-07-27 08:09:49'),(7,'EMAIL','INS->LDAGULTO->2022-07-27 08:10:56'),(7,'SYSTEM','INS->LDAGULTO->2022-07-27 08:10:56'),(8,'EMAIL','INS->LDAGULTO->2022-07-27 08:11:47'),(8,'SYSTEM','INS->LDAGULTO->2022-07-27 08:11:47'),(9,'EMAIL','INS->LDAGULTO->2022-07-27 08:12:49'),(9,'SYSTEM','INS->LDAGULTO->2022-07-27 08:12:49'),(10,'EMAIL','INS->LDAGULTO->2022-07-27 08:13:51'),(10,'SYSTEM','INS->LDAGULTO->2022-07-27 08:13:51'),(11,'EMAIL','INS->LDAGULTO->2022-07-27 08:14:36'),(11,'SYSTEM','INS->LDAGULTO->2022-07-27 08:14:36'),(12,'EMAIL','INS->LDAGULTO->2022-07-27 08:15:36'),(12,'SYSTEM','INS->LDAGULTO->2022-07-27 08:15:36');
/*!40000 ALTER TABLE `global_notification_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification_role_recipient`
--

DROP TABLE IF EXISTS `global_notification_role_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification_role_recipient` (
  `NOTIFICATION_SETTING_ID` int(50) DEFAULT NULL,
  `ROLE_ID` varchar(50) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification_role_recipient`
--

LOCK TABLES `global_notification_role_recipient` WRITE;
/*!40000 ALTER TABLE `global_notification_role_recipient` DISABLE KEYS */;
INSERT INTO `global_notification_role_recipient` VALUES (3,'','INS->LDAGULTO->2022-07-27 08:03:32'),(4,'','INS->LDAGULTO->2022-07-27 08:08:05'),(8,'','INS->LDAGULTO->2022-07-27 08:12:24'),(9,'','INS->LDAGULTO->2022-07-27 08:13:12'),(12,'','INS->LDAGULTO->2022-07-27 08:16:16'),(11,'','INS->LDAGULTO->2022-07-27 08:16:26'),(10,'','INS->LDAGULTO->2022-07-27 08:16:36'),(7,'','INS->LDAGULTO->2022-07-27 08:16:45'),(6,'','INS->LDAGULTO->2022-07-27 08:16:49'),(5,'','INS->LDAGULTO->2022-07-27 08:16:53'),(1,'','INS->LDAGULTO->2022-08-04 02:47:57'),(2,'','INS->LDAGULTO->2022-08-04 02:48:06');
/*!40000 ALTER TABLE `global_notification_role_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification_setting`
--

DROP TABLE IF EXISTS `global_notification_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification_setting` (
  `NOTIFICATION_SETTING_ID` int(50) NOT NULL,
  `NOTIFICATION_SETTING` varchar(100) NOT NULL,
  `NOTIFICATION_SETTING_DESCRIPTION` varchar(200) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NOTIFICATION_SETTING_ID`),
  KEY `global_notification_setting_index` (`NOTIFICATION_SETTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification_setting`
--

LOCK TABLES `global_notification_setting` WRITE;
/*!40000 ALTER TABLE `global_notification_setting` DISABLE KEYS */;
INSERT INTO `global_notification_setting` VALUES (1,'Attendance Check In Notification','Notification for attendance check in.','TL-304','INS->LDAGULTO->2022-07-01 02:56:31'),(2,'Attendance Check Out Notification','Notification for attendance check out.','TL-305','INS->LDAGULTO->2022-07-01 02:57:04'),(3,'Attendance Adjustment For Recommendation','Notification for attendance adjustment for recommendation.','TL-430','INS->LDAGULTO->2022-07-27 07:54:47'),(4,'Attendance Adjustment Recommendation','Notification for attendance adjustment recommendation.','TL-431','INS->LDAGULTO->2022-07-27 08:04:04'),(5,'Attendance Adjustment Approval','Notification for attendance adjustment approval.','TL-432','UPD->LDAGULTO->2022-07-27 08:09:49'),(6,'Attendance Adjustment Rejection','Notification for attendance adjustment rejection.','TL-433','INS->LDAGULTO->2022-07-27 08:09:45'),(7,'Attendance Adjustment Cancellation','Notification for attendance adjustment cancellation.','TL-434','INS->LDAGULTO->2022-07-27 08:10:56'),(8,'Attendance Creation For Recommendation','Notification for attendance creation for recommendation','TL-435','INS->LDAGULTO->2022-07-27 08:11:47'),(9,'Attendance Creation Recommendation','Notification for attendance creation recommendation.','TL-436','INS->LDAGULTO->2022-07-27 08:12:49'),(10,'Attendance Creation Approval','Notification for attendance creation approval.','TL-437','INS->LDAGULTO->2022-07-27 08:13:51'),(11,'Attendance Creation Rejection','Notification for attendance creation rejection.','TL-438','INS->LDAGULTO->2022-07-27 08:14:36'),(12,'Attendance Creation Cancellation','Notification for attendance creation cancellation.','TL-439','INS->LDAGULTO->2022-07-27 08:15:36');
/*!40000 ALTER TABLE `global_notification_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification_template`
--

DROP TABLE IF EXISTS `global_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification_template` (
  `NOTIFICATION_SETTING_ID` int(50) NOT NULL,
  `NOTIFICATION_TITLE` varchar(500) DEFAULT NULL,
  `NOTIFICATION_MESSAGE` varchar(500) DEFAULT NULL,
  `SYSTEM_LINK` varchar(200) DEFAULT NULL,
  `EMAIL_LINK` varchar(200) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NOTIFICATION_SETTING_ID`),
  KEY `global_notification_template_index` (`NOTIFICATION_SETTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification_template`
--

LOCK TABLES `global_notification_template` WRITE;
/*!40000 ALTER TABLE `global_notification_template` DISABLE KEYS */;
INSERT INTO `global_notification_template` VALUES (1,'Attendance Time In','You time in on {date} at {time}.','my-attendance.php','my-attendance.php','UPD->LDAGULTO->2022-08-04 02:47:57'),(2,'Attendance Time Out','You time out on {date} at {time}.','my-attendance.php','my-attendance.php','UPD->LDAGULTO->2022-08-04 02:48:06'),(3,'Attendance Adjustment For Recommendation','You have a new attendance adjustment for recommendation from {employee}.','attendance-adjustment-recommendation.php','attendance-adjustment-recommendation.php','INS->LDAGULTO->2022-07-27 08:03:32'),(4,'Attendance Adjustment Recommendation','You have a new attendance adjustment for approval from {employee}.','attendance-adjustment-approval.php','attendance-adjustment-approval.php','INS->LDAGULTO->2022-07-27 08:08:05'),(5,'Attendance Adjustment Approval','Your attendance adjustment has been approved by {employee}.','my-attendance-adjustment.php','my-attendance-adjustment.php','UPD->LDAGULTO->2022-07-27 08:16:53'),(6,'Attendance Adjustment Rejection','Your attendance adjustment has been rejected by {employee}.','my-attendance-adjustment.php','my-attendance-adjustment.php','UPD->LDAGULTO->2022-07-27 08:16:49'),(7,'Attendance Adjustment Cancellation','Your attendance adjustment has been cancelled by {employee}.','my-attendance-adjustment.php','my-attendance-adjustment.php','UPD->LDAGULTO->2022-07-27 08:16:45'),(8,'Attendance Creation For Recommendation','You have a new attendance creation for recommendation from {employee}.','attendance-creation-recommendation.php','attendance-creation-recommendation.php','INS->LDAGULTO->2022-07-27 08:12:24'),(9,'Attendance Creation Recommendation','You have a new attendance creation for approval from {employee}.','attendance-creation-approval.php','attendance-creation-approval.php','INS->LDAGULTO->2022-07-27 08:13:12'),(10,'Attendance Creation Approval','Your attendance creation has been approved by {employee}.','my-attendance-creation.php','my-attendance-creation.php','UPD->LDAGULTO->2022-07-27 08:16:36'),(11,'Attendance Creation Rejection','Your attendance creation has been rejected by {employee}.','my-attendance-creation.php','my-attendance-creation.php','UPD->LDAGULTO->2022-07-27 08:16:26'),(12,'Attendance Creation Cancellation','Your attendance adjustment has been cancelled by {employee}.','my-attendance-creation.php','my-attendance-creation.php','INS->LDAGULTO->2022-07-27 08:16:16');
/*!40000 ALTER TABLE `global_notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_notification_user_account_recipient`
--

DROP TABLE IF EXISTS `global_notification_user_account_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_notification_user_account_recipient` (
  `NOTIFICATION_SETTING_ID` int(50) DEFAULT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_notification_user_account_recipient`
--

LOCK TABLES `global_notification_user_account_recipient` WRITE;
/*!40000 ALTER TABLE `global_notification_user_account_recipient` DISABLE KEYS */;
INSERT INTO `global_notification_user_account_recipient` VALUES (3,'','INS->LDAGULTO->2022-07-27 08:03:32'),(4,'','INS->LDAGULTO->2022-07-27 08:08:05'),(8,'','INS->LDAGULTO->2022-07-27 08:12:24'),(9,'','INS->LDAGULTO->2022-07-27 08:13:12'),(12,'','INS->LDAGULTO->2022-07-27 08:16:16'),(11,'','INS->LDAGULTO->2022-07-27 08:16:26'),(10,'','INS->LDAGULTO->2022-07-27 08:16:36'),(7,'','INS->LDAGULTO->2022-07-27 08:16:45'),(6,'','INS->LDAGULTO->2022-07-27 08:16:49'),(5,'','INS->LDAGULTO->2022-07-27 08:16:53'),(1,'','INS->LDAGULTO->2022-08-04 02:47:57'),(2,'','INS->LDAGULTO->2022-08-04 02:48:06');
/*!40000 ALTER TABLE `global_notification_user_account_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_permission`
--

DROP TABLE IF EXISTS `global_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_permission` (
  `PERMISSION_ID` int(50) NOT NULL,
  `POLICY_ID` int(50) NOT NULL,
  `PERMISSION` varchar(100) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_permission`
--

LOCK TABLES `global_permission` WRITE;
/*!40000 ALTER TABLE `global_permission` DISABLE KEYS */;
INSERT INTO `global_permission` VALUES (1,1,'View Policy Page','TL-9','UPD->ADMIN->2022-06-12 01:05:21'),(2,1,'Add Policy','TL-10','UPD->ADMIN->2022-06-12 01:05:25'),(3,1,'Update Policy','TL-11','UPD->ADMIN->2022-06-12 01:05:30'),(4,1,'Delete Policy','TL-12','UPD->ADMIN->2022-06-12 01:05:34'),(5,1,'View Transaction Log','TL-13','INS->ADMIN->2022-06-12 01:05:06'),(6,2,'View Permission Page','TL-15','INS->ADMIN->2022-06-12 01:07:02'),(7,2,'Add Permission','TL-16','INS->ADMIN->2022-06-12 01:07:07'),(8,2,'Update Permission','TL-17','INS->ADMIN->2022-06-12 01:07:13'),(9,2,'Delete Permission','TL-18','INS->ADMIN->2022-06-12 01:07:18'),(10,2,'View Transaction Log','TL-19','INS->ADMIN->2022-06-12 01:07:26'),(11,3,'View Role Page','TL-21','INS->ADMIN->2022-06-12 01:08:14'),(12,3,'Add Role','TL-22','INS->ADMIN->2022-06-12 01:08:19'),(13,3,'Update Role','TL-23','INS->ADMIN->2022-06-12 01:08:23'),(14,3,'Update Role Permission','TL-24','UPD->ADMIN->2022-06-14 10:34:44'),(15,3,'Delete Role','TL-25','UPD->ADMIN->2022-06-14 10:34:53'),(16,3,'View Transaction Log','TL-27','UPD->ADMIN->2022-06-14 10:35:20'),(17,4,'View User Account Page','TL-28','UPD->ADMIN->2022-06-14 10:35:27'),(18,4,'Add User Account','TL-34','UPD->ADMIN->2022-06-14 10:35:31'),(19,4,'Update User Account','TL-35','UPD->ADMIN->2022-06-14 10:35:37'),(20,4,'Lock User Account','TL-36','UPD->ADMIN->2022-06-14 10:35:41'),(21,4,'Unlock User Account','TL-37','UPD->ADMIN->2022-06-14 10:35:46'),(22,4,'Activate User Account','TL-38','UPD->ADMIN->2022-06-14 10:35:51'),(23,4,'Deactivate User Account','TL-39','UPD->ADMIN->2022-06-14 10:36:02'),(24,4,'View Transaction Log','TL-41','INS->ADMIN->2022-06-14 10:36:07'),(25,5,'View System Parameter Page','TL-43','INS->ADMIN->2022-06-14 10:44:23'),(26,5,'Add System Parameter','TL-44','INS->ADMIN->2022-06-14 10:44:28'),(27,5,'Update System Parameter','TL-45','INS->ADMIN->2022-06-14 10:44:34'),(28,5,'Delete System Parameter','TL-46','INS->ADMIN->2022-06-14 10:44:39'),(29,5,'View Transaction Log','TL-47','INS->ADMIN->2022-06-14 10:44:45'),(30,6,'View System Code Page','TL-50','INS->ADMIN->2022-06-14 11:24:57'),(31,6,'Add System Code','TL-51','INS->ADMIN->2022-06-14 11:25:01'),(32,6,'Update System Code','TL-52','INS->ADMIN->2022-06-14 11:25:07'),(33,6,'Delete System Code','TL-53','INS->ADMIN->2022-06-14 11:25:11'),(34,6,'View Transaction Log','TL-54','INS->ADMIN->2022-06-14 11:25:17'),(35,7,'View Upload Setting Page','TL-94','UPD->ADMIN->2022-06-14 02:53:45'),(36,7,'Add Upload Setting','TL-95','UPD->ADMIN->2022-06-14 02:53:49'),(37,7,'Upload Upload Setting','TL-96','UPD->ADMIN->2022-06-14 02:53:53'),(38,7,'Delete Upload Setting','TL-97','UPD->ADMIN->2022-06-14 02:53:58'),(39,7,'View Transaction Log','TL-98','UPD->ADMIN->2022-06-14 02:54:04'),(40,8,'View Company Page','TL-104','INS->ADMIN->2022-06-14 04:23:42'),(41,8,'Add Company','TL-105','INS->ADMIN->2022-06-14 04:23:47'),(42,8,'Update Company','TL-106','INS->ADMIN->2022-06-14 04:23:53'),(43,8,'Delete Company','TL-107','INS->ADMIN->2022-06-14 04:23:58'),(44,8,'View Transaction Log','TL-108','INS->ADMIN->2022-06-14 04:24:04'),(45,9,'View Country Page','TL-113','INS->ADMIN->2022-06-15 11:37:52'),(46,9,'Add Country','TL-114','INS->ADMIN->2022-06-15 11:37:57'),(47,9,'Update Country','TL-115','INS->ADMIN->2022-06-15 11:38:06'),(48,9,'Delete Country','TL-116','INS->ADMIN->2022-06-15 11:38:12'),(49,9,'View Transaction Log','TL-117','INS->ADMIN->2022-06-15 11:38:31'),(50,10,'View State Page','TL-119','INS->ADMIN->2022-06-15 01:20:01'),(51,10,'Add State','TL-120','INS->ADMIN->2022-06-15 01:20:05'),(52,10,'Update State','TL-121','INS->ADMIN->2022-06-15 01:20:15'),(53,10,'Delete State','TL-122','INS->ADMIN->2022-06-15 01:20:20'),(54,10,'View Transaction Log','TL-123','INS->ADMIN->2022-06-15 01:20:28'),(55,11,'View Notification Setting Page','TL-134','INS->ADMIN->2022-06-17 04:49:41'),(56,11,'Add Notification Setting','TL-135','INS->ADMIN->2022-06-17 04:49:50'),(57,11,'Update Notification Setting','TL-136','INS->ADMIN->2022-06-17 04:49:58'),(58,11,'Update Notification Template','TL-137','UPD->ADMIN->2022-06-18 01:58:19'),(59,11,'Delete Notification Setting','TL-138','UPD->ADMIN->2022-06-18 01:58:27'),(60,11,'View Transaction Log','TL-139','INS->ADMIN->2022-06-18 01:58:36'),(61,12,'View User Interface Setting','TL-146','INS->ADMIN->2022-06-18 10:39:32'),(62,12,'Update User Interface Setting','TL-147','INS->ADMIN->2022-06-18 10:39:43'),(63,12,'View Transaction Log','TL-148','INS->ADMIN->2022-06-18 10:39:49'),(64,13,'View Email Setup','TL-150','INS->ADMIN->2022-06-19 12:27:49'),(65,13,'Update Email Setup','TL-151','INS->ADMIN->2022-06-19 12:27:58'),(66,13,'View Transaction Log','TL-152','INS->ADMIN->2022-06-19 12:28:04'),(67,14,'View Zoom Integration','TL-154','UPD->ADMIN->2022-06-20 02:56:16'),(68,14,'Update Zoom Integration','TL-155','UPD->ADMIN->2022-06-20 02:56:48'),(69,14,'View Transaction Log','TL-156','INS->ADMIN->2022-06-19 12:31:44'),(70,15,'View Department Page','TL-179','INS->ADMIN->2022-06-20 04:50:45'),(71,15,'Add Department','TL-180','INS->ADMIN->2022-06-20 04:50:49'),(72,15,'Update Department','TL-181','INS->ADMIN->2022-06-20 04:50:54'),(73,15,'Delete Department','TL-182','INS->ADMIN->2022-06-20 04:50:58'),(74,15,'View Transaction Log','TL-183','INS->ADMIN->2022-06-20 04:51:07'),(75,16,'View Job Position Page','TL-190','INS->ADMIN->2022-06-21 01:21:11'),(76,16,'Add Job Position','TL-191','INS->ADMIN->2022-06-21 01:21:17'),(77,16,'Update Job Position','TL-192','UPD->ADMIN->2022-06-21 01:21:29'),(78,16,'Delete Job Position','TL-193','INS->ADMIN->2022-06-21 01:21:34'),(79,16,'View Transaction Log','TL-194','INS->ADMIN->2022-06-21 01:21:41'),(80,17,'View Work Location Page','TL-204','INS->LDAGULTO->2022-06-23 08:40:18'),(81,17,'Add Work Location','TL-205','INS->LDAGULTO->2022-06-23 08:40:31'),(82,17,'Update Work Location','TL-206','INS->LDAGULTO->2022-06-23 08:40:36'),(83,17,'Delete Work Location','TL-207','INS->LDAGULTO->2022-06-23 08:40:40'),(84,17,'View Transaction Log','TL-208','INS->LDAGULTO->2022-06-23 08:40:47'),(85,18,'View Departure Reason Page','TL-217','INS->LDAGULTO->2022-06-23 01:46:06'),(86,18,'Add Departure Reason','TL-218','INS->LDAGULTO->2022-06-23 01:46:13'),(87,18,'Update Departure Reason','TL-219','INS->LDAGULTO->2022-06-23 01:46:20'),(88,18,'Delete Departure Reason','TL-220','INS->LDAGULTO->2022-06-23 01:46:29'),(89,18,'View Transaction Log','TL-221','INS->LDAGULTO->2022-06-23 01:46:35'),(90,19,'View Employee Page','TL-226','UPD->ADMIN->2022-06-24 08:22:54'),(91,19,'Add Employee','TL-227','UPD->ADMIN->2022-06-24 08:22:58'),(92,19,'Update Employee','TL-228','UPD->ADMIN->2022-06-24 08:23:03'),(93,19,'Delete Employee','TL-229','UPD->ADMIN->2022-06-24 08:23:07'),(94,19,'Archive Employee','TL-230','UPD->ADMIN->2022-06-24 08:51:52'),(95,19,'Unarchive Employee','TL-232','INS->ADMIN->2022-06-24 08:52:01'),(96,19,'View Transaction Log','TL-233','INS->ADMIN->2022-06-24 08:52:07'),(97,20,'View Employee Type Page','TL-235','INS->ADMIN->2022-06-24 09:43:11'),(98,20,'Add Employee Type','TL-236','INS->ADMIN->2022-06-24 09:43:17'),(99,20,'Update Employee Type','TL-237','INS->ADMIN->2022-06-24 09:43:24'),(100,20,'Delete Employee Type','TL-238','INS->ADMIN->2022-06-24 09:43:30'),(101,20,'View Transaction Log','TL-239','INS->ADMIN->2022-06-24 09:43:35'),(102,21,'View Working Hours Page','TL-277','INS->ADMIN->2022-06-27 04:36:42'),(103,21,'Add Working Hours','TL-278','INS->ADMIN->2022-06-27 04:36:49'),(104,21,'Update Working Hours','TL-279','INS->ADMIN->2022-06-27 04:36:54'),(105,21,'Update Working Hours Schedule','TL-280','UPD->ADMIN->2022-06-27 05:16:42'),(106,21,'Delete Working Hours','TL-281','UPD->ADMIN->2022-06-27 05:16:51'),(107,21,'View Transaction Log','TL-285','INS->ADMIN->2022-06-27 05:16:57'),(108,22,'View Attendance Setting Page','TL-295','INS->ADMIN->2022-06-29 10:13:20'),(109,22,'Update Attendance Setting','TL-296','INS->ADMIN->2022-06-29 10:13:29'),(110,22,'View Transaction Log','TL-297','INS->ADMIN->2022-06-29 10:13:37'),(111,23,'View Check In / Check Out Page','TL-301','INS->ADMIN->2022-06-30 11:51:49'),(112,23,'Check In / Check Out','TL-302','INS->ADMIN->2022-06-30 11:52:01'),(113,24,'View Attendances Page','TL-313','INS->ADMIN->2022-07-05 11:02:01'),(114,24,'Add Attendance','TL-314','INS->ADMIN->2022-07-05 11:02:05'),(115,24,'Update Attendance','TL-315','INS->ADMIN->2022-07-05 11:02:11'),(116,24,'Delete Attendance','TL-316','INS->ADMIN->2022-07-05 11:02:15'),(117,24,'View Transaction Log','TL-317','INS->ADMIN->2022-07-05 11:02:24'),(118,25,'View My Attendance Page','TL-321','UPD->LDAGULTO->2022-07-09 07:27:19'),(119,25,'Request Attendance Adjustment','TL-322','UPD->LDAGULTO->2022-07-08 11:44:08'),(120,25,'Request Attendance Creation','TL-324','INS->LDAGULTO->2022-07-08 11:44:15'),(121,25,'View Transaction Log','TL-325','INS->LDAGULTO->2022-07-08 11:44:24'),(122,26,'View My Attendance Adjustment Page','TL-335','INS->LDAGULTO->2022-07-10 10:13:51'),(123,26,'Add Attendance Adjustment','TL-336','INS->LDAGULTO->2022-07-10 10:14:03'),(124,26,'Update Attendance Adjustment','TL-337','INS->LDAGULTO->2022-07-10 10:14:10'),(125,26,'Cancel Attendance Adjustment','TL-338','INS->LDAGULTO->2022-07-10 10:14:19'),(126,26,'Tag Attendance Adjustment For Recommendation','TL-339','UPD->LDAGULTO->2022-07-10 10:21:14'),(127,26,'Delete Attendance Adjustment','TL-340','UPD->LDAGULTO->2022-07-10 10:21:23'),(128,26,'View Transaction Log','TL-341','INS->LDAGULTO->2022-07-10 10:21:28'),(129,27,'View My Attendance Creation Page','TL-353','INS->LDAGULTO->2022-07-16 07:16:39'),(130,27,'Add Attendance Creation','TL-354','INS->LDAGULTO->2022-07-16 07:16:53'),(131,27,'Update Attendance Creation','TL-355','INS->LDAGULTO->2022-07-16 07:17:00'),(132,27,'Cancel Attendance Creation','TL-356','INS->LDAGULTO->2022-07-16 07:17:07'),(133,27,'Tag Attendance Creation For Recommendation','TL-357','INS->LDAGULTO->2022-07-16 07:17:15'),(134,27,'Delete Attendance Creation','TL-358','INS->LDAGULTO->2022-07-16 07:17:21'),(135,27,'View Transaction Log','TL-359','INS->LDAGULTO->2022-07-16 07:17:27'),(136,28,'View Approval Type Page','TL-367','INS->LDAGULTO->2022-07-18 01:09:43'),(137,28,'Add Approval Type','TL-368','INS->LDAGULTO->2022-07-18 01:09:49'),(138,28,'Update Approval Type','TL-369','INS->LDAGULTO->2022-07-18 01:09:55'),(139,28,'Activate Approval Type','TL-370','INS->LDAGULTO->2022-07-18 01:10:03'),(140,28,'Deactivate Approval Type','TL-371','UPD->LDAGULTO->2022-07-18 01:10:19'),(141,28,'Delete Approval Type','TL-372','INS->LDAGULTO->2022-07-18 01:25:42'),(142,28,'View Transaction Log','TL-373','INS->LDAGULTO->2022-07-18 01:25:48'),(143,29,'View Approver Page','TL-377','INS->LDAGULTO->2022-07-22 03:14:20'),(144,29,'Add Approver','TL-378','INS->LDAGULTO->2022-07-22 03:14:24'),(145,29,'Delete Approver','TL-379','INS->LDAGULTO->2022-07-22 03:14:28'),(146,30,'View Approval Exception Page','TL-381','INS->LDAGULTO->2022-07-22 03:25:36'),(147,30,'Add Approval Exception','TL-382','INS->LDAGULTO->2022-07-22 03:25:41'),(148,30,'Delete Approval Exception','TL-383','INS->LDAGULTO->2022-07-22 03:25:49'),(149,31,'View Attendance Adjustment Recommendation Page','TL-392','INS->LDAGULTO->2022-07-24 11:36:43'),(150,31,'Recommend Attendance Adjustment','TL-393','INS->LDAGULTO->2022-07-24 11:36:56'),(151,31,'Reject Attendance Adjustment','TL-394','INS->LDAGULTO->2022-07-24 11:37:03'),(152,31,'Cancel Attendance Adjustment','TL-395','INS->LDAGULTO->2022-07-24 11:37:09'),(153,31,'View Transaction Log','TL-396','INS->LDAGULTO->2022-07-24 11:38:45'),(154,32,'View Attendance Creation Recommendation Page','TL-398','INS->LDAGULTO->2022-07-24 11:40:42'),(155,32,'Recommend Attendance Creation','TL-399','UPD->LDAGULTO->2022-07-24 11:41:00'),(156,32,'Reject Attendance Creation','TL-400','INS->LDAGULTO->2022-07-24 11:41:07'),(157,32,'Cancel Attendance Creation','TL-401','INS->LDAGULTO->2022-07-24 11:41:15'),(158,32,'View Transaction Log','TL-402','INS->LDAGULTO->2022-07-24 11:41:19'),(159,33,'View Attendance Adjustment Approval Page','TL-413','INS->LDAGULTO->2022-07-25 09:06:41'),(160,33,'Approve Attendance Adjustment','TL-414','INS->LDAGULTO->2022-07-25 09:06:49'),(161,33,'Reject Attendance Adjustment','TL-415','INS->LDAGULTO->2022-07-25 09:06:56'),(162,33,'Cancel Attendance Adjustment','TL-416','INS->LDAGULTO->2022-07-25 09:07:03'),(163,33,'View Transaction Log','TL-417','INS->LDAGULTO->2022-07-25 09:07:08'),(164,34,'View Attendance Creation Approval Page','TL-419','INS->LDAGULTO->2022-07-25 09:08:57'),(165,34,'Approve Attendance Creation','TL-420','INS->LDAGULTO->2022-07-25 09:09:04'),(166,34,'Reject Attendance Creation','TL-421','INS->LDAGULTO->2022-07-25 09:09:10'),(167,34,'Cancel Attendance Creation','TL-422','INS->LDAGULTO->2022-07-25 09:09:18'),(168,34,'View Transaction Log','TL-423','INS->LDAGULTO->2022-07-25 09:09:31'),(169,35,'View Kiosk Mode Page','TL-449','INS->LDAGULTO->2022-07-31 12:48:16'),(170,35,'Scan Attendance','TL-450','INS->LDAGULTO->2022-07-31 12:48:28'),(171,36,'View Public Holiday Page','TL-455','INS->LDAGULTO->2022-08-04 05:03:33'),(172,36,'Add Public Holiday','TL-456','INS->LDAGULTO->2022-08-04 05:03:40'),(173,36,'Update Public Holiday','TL-457','UPD->LDAGULTO->2022-08-04 05:03:51'),(174,36,'Delete Public Holiday','TL-458','INS->LDAGULTO->2022-08-04 05:03:57'),(175,36,'View Transaction Log','TL-459','INS->LDAGULTO->2022-08-04 05:04:04'),(176,37,'View Leave Type Page','TL-471','INS->LDAGULTO->2022-08-06 10:32:00'),(177,37,'Add Leave Type','TL-472','INS->LDAGULTO->2022-08-06 10:32:07'),(178,37,'Update Leave Type','TL-473','INS->LDAGULTO->2022-08-06 10:32:12'),(179,37,'Delete Leave Type','TL-474','INS->LDAGULTO->2022-08-06 10:32:17'),(180,37,'View Transaction Log','TL-475','INS->LDAGULTO->2022-08-06 10:32:24'),(181,38,'View Leave Allocation Page','TL-482','INS->LDAGULTO->2022-08-06 08:54:54'),(182,38,'Add Leave Allocation','TL-483','INS->LDAGULTO->2022-08-06 08:55:02'),(183,38,'Update Leave Allocation','TL-484','INS->LDAGULTO->2022-08-06 08:55:09'),(184,38,'Delete Leave Allocation','TL-485','INS->LDAGULTO->2022-08-06 08:55:13'),(185,38,'View Transaction Log','TL-486','INS->LDAGULTO->2022-08-06 08:55:19');
/*!40000 ALTER TABLE `global_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_policy`
--

DROP TABLE IF EXISTS `global_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_policy` (
  `POLICY_ID` int(50) NOT NULL,
  `POLICY` varchar(100) NOT NULL,
  `POLICY_DESCRIPTION` varchar(200) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  KEY `global_policy_index` (`POLICY_ID`),
  KEY `global_permission_index` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_policy`
--

LOCK TABLES `global_policy` WRITE;
/*!40000 ALTER TABLE `global_policy` DISABLE KEYS */;
INSERT INTO `global_policy` VALUES (1,'Policy','Policies on policy page.','TL-7','INS->ADMIN->2022-06-12 12:12:51'),(2,'Permission','Policies on permission page.','TL-14','INS->ADMIN->2022-06-12 01:06:55'),(3,'Role','Policies on role page.','TL-20','INS->ADMIN->2022-06-12 01:07:43'),(4,'User Accounts','Policies on user accounts page.','TL-26','UPD->ADMIN->2022-06-13 07:26:21'),(5,'System Parameter','Policies on system parameter page.','TL-42','INS->ADMIN->2022-06-14 10:43:44'),(6,'System Code','Policies on system code page.','TL-49','INS->ADMIN->2022-06-14 11:24:47'),(7,'Upload Setting','Policies on upload setting page.','TL-93','UPD->ADMIN->2022-06-14 02:54:51'),(8,'Company','Policies on company page.','TL-103','INS->ADMIN->2022-06-14 04:23:35'),(9,'Country','Policies on country page.','TL-112','INS->ADMIN->2022-06-15 11:37:40'),(10,'State','Policies on state page.','TL-118','INS->ADMIN->2022-06-15 01:19:52'),(11,'Notification Setting','Policies on notification setting page.','TL-133','INS->ADMIN->2022-06-17 04:49:10'),(12,'User Interface Setting','Policies on user interface setting on general setting page.','TL-145','INS->ADMIN->2022-06-18 10:39:22'),(13,'Email Setup','Policies on email setup on general setting page.','TL-149','INS->ADMIN->2022-06-19 12:27:40'),(14,'Zoom Integration','Policies on zoom integration on general setting page.','TL-153','UPD->ADMIN->2022-06-20 02:57:16'),(15,'Department','Policies on department page.','TL-178','INS->ADMIN->2022-06-20 04:50:14'),(16,'Job Position','Policies on job position page.','TL-189','INS->ADMIN->2022-06-21 01:21:02'),(17,'Work Location','Policies on work location page.','TL-203','INS->LDAGULTO->2022-06-23 08:40:07'),(18,'Departure Reason','Policies on departure reason page.','TL-216','INS->LDAGULTO->2022-06-23 01:45:54'),(19,'Employee','Policies on plan employee page.','TL-225','UPD->ADMIN->2022-06-24 09:43:03'),(20,'Employee Type','Policies on employee type page.','TL-234','INS->ADMIN->2022-06-24 09:42:56'),(21,'Working Hours','Policies on working hours page.','TL-276','INS->ADMIN->2022-06-27 04:32:38'),(22,'Attendance Setting','Policies on attendance setting page.','TL-294','INS->ADMIN->2022-06-29 10:12:33'),(23,'Check In / Check Out','Policies on check in / check out page.','TL-300','INS->ADMIN->2022-06-30 11:51:41'),(24,'Attendances','Policies on attendances page.','TL-312','INS->LDAGULTO->2022-07-05 11:01:34'),(25,'My Attendance','Policies on my attendance page.','TL-320','UPD->LDAGULTO->2022-07-09 07:27:12'),(26,'My Attendance Adjustment','Policies on my attendance adjustment page.','TL-334','INS->LDAGULTO->2022-07-10 10:13:31'),(27,'My Attendance Creation','Policies on my attendance creation page.','TL-352','INS->LDAGULTO->2022-07-16 07:16:28'),(28,'Approval Type','Policies on approval type page.','TL-366','INS->LDAGULTO->2022-07-18 01:09:22'),(29,'Approver','Policies on approver page.','TL-376','INS->LDAGULTO->2022-07-22 03:14:08'),(30,'Approval Exception','Policies on approval exception page.','TL-380','INS->LDAGULTO->2022-07-22 03:25:17'),(31,'Attendance Adjustment Recommendation','Policies on attendance adjustment recommendation page.','TL-391','INS->LDAGULTO->2022-07-24 11:36:26'),(32,'Attendance Creation Recommendation','Policies on attendance creation recommendation page.','TL-397','INS->LDAGULTO->2022-07-24 11:40:31'),(33,'Attendance Adjustment Approval','Policies on attendance adjustment approval page.','TL-411','INS->LDAGULTO->2022-07-24 06:35:56'),(34,'Attendance Creation Approval','Policies on attendance creation approval page.','TL-418','INS->LDAGULTO->2022-07-25 09:08:45'),(35,'Kiosk Mode','Policies on kiosk mode page.','TL-448','INS->LDAGULTO->2022-07-31 12:48:07'),(36,'Public Holiday','Policies on public holiday page.','TL-454','INS->LDAGULTO->2022-08-04 05:03:21'),(37,'Leave Type','Policies on leave type page.','TL-470','INS->LDAGULTO->2022-08-06 10:31:50'),(38,'Leave Allocation','Policies on leave allocation page.','TL-481','INS->LDAGULTO->2022-08-06 08:54:41');
/*!40000 ALTER TABLE `global_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_role`
--

DROP TABLE IF EXISTS `global_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_role` (
  `ROLE_ID` varchar(50) NOT NULL,
  `ROLE` varchar(100) NOT NULL,
  `ROLE_DESCRIPTION` varchar(200) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `global_role_index` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_role`
--

LOCK TABLES `global_role` WRITE;
/*!40000 ALTER TABLE `global_role` DISABLE KEYS */;
INSERT INTO `global_role` VALUES ('RL-1',' Super Admin','Super Administrator','TL-32','UPD->ADMIN->2022-06-12 02:11:08');
/*!40000 ALTER TABLE `global_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_role_permission`
--

DROP TABLE IF EXISTS `global_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_role_permission` (
  `ROLE_ID` varchar(50) NOT NULL,
  `PERMISSION_ID` int(20) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_role_permission`
--

LOCK TABLES `global_role_permission` WRITE;
/*!40000 ALTER TABLE `global_role_permission` DISABLE KEYS */;
INSERT INTO `global_role_permission` VALUES ('RL-1',146,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',147,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',148,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',136,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',137,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',138,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',139,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',140,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',141,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',142,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',143,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',144,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',145,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',159,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',160,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',161,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',162,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',163,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',149,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',150,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',151,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',152,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',153,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',164,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',165,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',166,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',167,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',168,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',154,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',155,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',156,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',157,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',158,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',108,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',109,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',110,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',113,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',114,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',115,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',116,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',117,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',111,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',112,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',40,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',41,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',42,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',43,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',44,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',45,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',46,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',47,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',48,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',49,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',70,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',71,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',72,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',73,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',74,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',85,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',86,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',87,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',88,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',89,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',64,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',65,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',66,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',90,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',91,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',92,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',93,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',94,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',95,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',96,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',97,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',98,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',99,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',100,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',101,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',75,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',76,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',77,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',78,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',79,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',169,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',170,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',181,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',182,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',183,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',184,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',185,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',176,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',177,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',178,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',179,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',180,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',118,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',119,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',120,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',121,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',122,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',123,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',124,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',125,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',126,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',127,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',128,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',129,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',130,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',131,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',132,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',133,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',134,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',135,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',55,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',56,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',57,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',58,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',59,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',60,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',6,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',7,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',8,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',9,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',10,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',1,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',2,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',3,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',4,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',5,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',171,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',172,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',173,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',174,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',175,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',11,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',12,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',13,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',14,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',15,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',16,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',50,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',51,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',52,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',53,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',54,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',30,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',31,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',32,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',33,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',34,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',25,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',26,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',27,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',28,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',29,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',35,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',36,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',37,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',38,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',39,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',17,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',18,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',19,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',20,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',21,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',22,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',23,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',24,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',61,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',62,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',63,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',80,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',81,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',82,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',83,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',84,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',102,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',103,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',104,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',105,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',106,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',107,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',67,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',68,'INS->LDAGULTO->2022-08-06 08:56:08'),('RL-1',69,'INS->LDAGULTO->2022-08-06 08:56:08');
/*!40000 ALTER TABLE `global_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_role_user_account`
--

DROP TABLE IF EXISTS `global_role_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_role_user_account` (
  `ROLE_ID` varchar(50) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_role_user_account`
--

LOCK TABLES `global_role_user_account` WRITE;
/*!40000 ALTER TABLE `global_role_user_account` DISABLE KEYS */;
INSERT INTO `global_role_user_account` VALUES ('RL-1','ADMIN','INS->LDAGULTO->2022-07-17 02:23:12'),('RL-1','LDAGULTO','INS->LDAGULTO->2022-07-17 02:23:26');
/*!40000 ALTER TABLE `global_role_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_state`
--

DROP TABLE IF EXISTS `global_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE_NAME` varchar(200) NOT NULL,
  `COUNTRY_ID` int(11) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`STATE_ID`),
  KEY `global_state_index` (`STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_state`
--

LOCK TABLES `global_state` WRITE;
/*!40000 ALTER TABLE `global_state` DISABLE KEYS */;
INSERT INTO `global_state` VALUES (1,'Southern Nations, Nationalities, and Peoples\' Region',70,'TL-125','UPD->ADMIN->2022-06-15 02:51:18'),(2,'Somali Region',70,NULL,NULL),(3,'Amhara Region',70,NULL,NULL),(4,'Tigray Region',70,NULL,NULL),(5,'Oromia Region',70,NULL,NULL),(6,'Afar Region',70,NULL,NULL),(7,'Harari Region',70,NULL,NULL),(8,'Dire Dawa',70,NULL,NULL),(9,'Benishangul-Gumuz Region',70,NULL,NULL),(10,'Gambela Region',70,NULL,NULL),(11,'Addis Ababa',70,NULL,NULL),(12,'Petnjica Municipality',147,NULL,NULL),(13,'Bar Municipality',147,NULL,NULL),(14,'Danilovgrad Municipality',147,NULL,NULL),(15,'Rožaje Municipality',147,NULL,NULL),(16,'Plužine Municipality',147,NULL,NULL),(17,'Nikšić Municipality',147,NULL,NULL),(18,'Šavnik Municipality',147,NULL,NULL),(19,'Plav Municipality',147,NULL,NULL),(20,'Pljevlja Municipality',147,NULL,NULL),(21,'Berane Municipality',147,NULL,NULL),(22,'Mojkovac Municipality',147,NULL,NULL),(23,'Andrijevica Municipality',147,NULL,NULL),(24,'Gusinje Municipality',147,NULL,NULL),(25,'Bijelo Polje Municipality',147,NULL,NULL),(26,'Kotor Municipality',147,NULL,NULL),(27,'Podgorica Municipality',147,NULL,NULL),(28,'Old Royal Capital Cetinje',147,NULL,NULL),(29,'Tivat Municipality',147,NULL,NULL),(30,'Budva Municipality',147,NULL,NULL),(31,'Kolašin Municipality',147,NULL,NULL),(32,'Žabljak Municipality',147,NULL,NULL),(33,'Ulcinj Municipality',147,NULL,NULL),(34,'Kunene Region',152,NULL,NULL),(35,'Kavango West Region',152,NULL,NULL),(36,'Kavango East Region',152,NULL,NULL),(37,'Oshana Region',152,NULL,NULL),(38,'Hardap Region',152,NULL,NULL),(39,'Omusati Region',152,NULL,NULL),(40,'Ohangwena Region',152,NULL,NULL),(41,'Omaheke Region',152,NULL,NULL),(42,'Oshikoto Region',152,NULL,NULL),(43,'Erongo Region',152,NULL,NULL),(44,'Khomas Region',152,NULL,NULL),(45,'Karas Region',152,NULL,NULL),(46,'Otjozondjupa Region',152,NULL,NULL),(47,'Zambezi Region',152,NULL,NULL),(48,'Ashanti',83,NULL,NULL),(49,'Western',83,NULL,NULL),(50,'Eastern',83,NULL,NULL),(51,'Northern',83,NULL,NULL),(52,'Central',83,NULL,NULL),(53,'Ahafo',83,NULL,NULL),(54,'Greater Accra',83,NULL,NULL),(55,'Upper East',83,NULL,NULL),(56,'Volta',83,NULL,NULL),(57,'Upper West',83,NULL,NULL),(58,'San Marino',192,NULL,NULL),(59,'Acquaviva',192,NULL,NULL),(60,'Chiesanuova',192,NULL,NULL),(61,'Borgo Maggiore',192,NULL,NULL),(62,'Faetano',192,NULL,NULL),(63,'Montegiardino',192,NULL,NULL),(64,'Domagnano',192,NULL,NULL),(65,'Serravalle',192,NULL,NULL),(66,'Fiorentino',192,NULL,NULL),(67,'Tillabéri Region',160,NULL,NULL),(68,'Dosso Region',160,NULL,NULL),(69,'Zinder Region',160,NULL,NULL),(70,'Maradi Region',160,NULL,NULL),(71,'Agadez Region',160,NULL,NULL),(72,'Diffa Region',160,NULL,NULL),(73,'Tahoua Region',160,NULL,NULL),(74,'Mqabba',135,NULL,NULL),(75,'San Ġwann',135,NULL,NULL),(76,'Żurrieq',135,NULL,NULL),(77,'Luqa',135,NULL,NULL),(78,'Marsaxlokk',135,NULL,NULL),(79,'Qala',135,NULL,NULL),(80,'Żebbuġ Malta',135,NULL,NULL),(81,'Xgħajra',135,NULL,NULL),(82,'Kirkop',135,NULL,NULL),(83,'Rabat',135,NULL,NULL),(84,'Floriana',135,NULL,NULL),(85,'Żebbuġ Gozo',135,NULL,NULL),(86,'Swieqi',135,NULL,NULL),(87,'Saint Lawrence',135,NULL,NULL),(88,'Birżebbuġa',135,NULL,NULL),(89,'Mdina',135,NULL,NULL),(90,'Santa Venera',135,NULL,NULL),(91,'Kerċem',135,NULL,NULL),(92,'Għarb',135,NULL,NULL),(93,'Iklin',135,NULL,NULL),(94,'Santa Luċija',135,NULL,NULL),(95,'Valletta',135,NULL,NULL),(96,'Msida',135,NULL,NULL),(97,'Birkirkara',135,NULL,NULL),(98,'Siġġiewi',135,NULL,NULL),(99,'Kalkara',135,NULL,NULL),(100,'St. Julian\'s',135,NULL,NULL),(101,'Victoria',135,NULL,NULL),(102,'Mellieħa',135,NULL,NULL),(103,'Tarxien',135,NULL,NULL),(104,'Sliema',135,NULL,NULL),(105,'Ħamrun',135,NULL,NULL),(106,'Għasri',135,NULL,NULL),(107,'Birgu',135,NULL,NULL),(108,'Balzan',135,NULL,NULL),(109,'Mġarr',135,NULL,NULL),(110,'Attard',135,NULL,NULL),(111,'Qrendi',135,NULL,NULL),(112,'Naxxar',135,NULL,NULL),(113,'Gżira',135,NULL,NULL),(114,'Xagħra',135,NULL,NULL),(115,'Paola',135,NULL,NULL),(116,'Sannat',135,NULL,NULL),(117,'Dingli',135,NULL,NULL),(118,'Gudja',135,NULL,NULL),(119,'Qormi',135,NULL,NULL),(120,'Għargħur',135,NULL,NULL),(121,'Xewkija',135,NULL,NULL),(122,'Ta\' Xbiex',135,NULL,NULL),(123,'Żabbar',135,NULL,NULL),(124,'Għaxaq',135,NULL,NULL),(125,'Pembroke',135,NULL,NULL),(126,'Lija',135,NULL,NULL),(127,'Pietà',135,NULL,NULL),(128,'Marsa',135,NULL,NULL),(129,'Fgura',135,NULL,NULL),(130,'Għajnsielem',135,NULL,NULL),(131,'Mtarfa',135,NULL,NULL),(132,'Munxar',135,NULL,NULL),(133,'Nadur',135,NULL,NULL),(134,'Fontana',135,NULL,NULL),(135,'Żejtun',135,NULL,NULL),(136,'Senglea',135,NULL,NULL),(137,'Marsaskala',135,NULL,NULL),(138,'Cospicua',135,NULL,NULL),(139,'St. Paul\'s Bay',135,NULL,NULL),(140,'Mosta',135,NULL,NULL),(141,'Mangystau Region',112,NULL,NULL),(142,'Kyzylorda Region',112,NULL,NULL),(143,'Almaty Region',112,NULL,NULL),(144,'North Kazakhstan Region',112,NULL,NULL),(145,'Akmola Region',112,NULL,NULL),(146,'Pavlodar Region',112,NULL,NULL),(147,'Jambyl Region',112,NULL,NULL),(148,'West Kazakhstan Province',112,NULL,NULL),(149,'Turkestan Region',112,NULL,NULL),(150,'Karaganda Region',112,NULL,NULL),(151,'Aktobe Region',112,NULL,NULL),(152,'Almaty',112,NULL,NULL),(153,'Atyrau Region',112,NULL,NULL),(154,'East Kazakhstan Region',112,NULL,NULL),(155,'Baikonur',112,NULL,NULL),(156,'Nur-Sultan',112,NULL,NULL),(157,'Kostanay Region',112,NULL,NULL),(158,'Kakamega',113,NULL,NULL),(159,'Kisii',113,NULL,NULL),(161,'Busia',113,NULL,NULL),(163,'Embu',113,NULL,NULL),(164,'Laikipia',113,NULL,NULL),(165,'Nandi',113,NULL,NULL),(166,'Lamu',113,NULL,NULL),(167,'Kirinyaga',113,NULL,NULL),(168,'Bungoma',113,NULL,NULL),(169,'Uasin Gishu',113,NULL,NULL),(170,'Isiolo',113,NULL,NULL),(171,'Kisumu',113,NULL,NULL),(173,'Kwale',113,NULL,NULL),(174,'Kilifi',113,NULL,NULL),(175,'Narok',113,NULL,NULL),(176,'Taita–Taveta',113,NULL,NULL),(178,'Murang\'a',113,NULL,NULL),(180,'Nyeri',113,NULL,NULL),(181,'Baringo',113,NULL,NULL),(182,'Wajir',113,NULL,NULL),(183,'Trans Nzoia',113,NULL,NULL),(184,'Machakos',113,NULL,NULL),(185,'Tharaka-Nithi',113,NULL,NULL),(186,'Siaya',113,NULL,NULL),(187,'Mandera',113,NULL,NULL),(188,'Makueni',113,NULL,NULL),(190,'Migori',113,NULL,NULL),(191,'Nairobi City',113,NULL,NULL),(192,'Nyandarua',113,NULL,NULL),(193,'Kericho',113,NULL,NULL),(194,'Marsabit',113,NULL,NULL),(195,'Homa Bay',113,NULL,NULL),(196,'Garissa',113,NULL,NULL),(197,'Kajiado',113,NULL,NULL),(198,'Meru',113,NULL,NULL),(199,'Kiambu',113,NULL,NULL),(200,'Mombasa',113,NULL,NULL),(201,'Elgeyo-Marakwet',113,NULL,NULL),(202,'Vihiga',113,NULL,NULL),(203,'Nakuru',113,NULL,NULL),(205,'Tana River',113,NULL,NULL),(206,'Turkana',113,NULL,NULL),(207,'Samburu',113,NULL,NULL),(208,'West Pokot',113,NULL,NULL),(209,'Nyamira',113,NULL,NULL),(210,'Bomet',113,NULL,NULL),(211,'Kitui',113,NULL,NULL),(212,'Bié Province',7,NULL,NULL),(213,'Huambo Province',7,NULL,NULL),(214,'Zaire Province',7,NULL,NULL),(215,'Cunene Province',7,NULL,NULL),(216,'Cuanza Sul',7,NULL,NULL),(217,'Cuanza Norte Province',7,NULL,NULL),(218,'Benguela Province',7,NULL,NULL),(219,'Moxico Province',7,NULL,NULL),(220,'Lunda Sul Province',7,NULL,NULL),(221,'Bengo Province',7,NULL,NULL),(222,'Luanda Province',7,NULL,NULL),(223,'Lunda Norte Province',7,NULL,NULL),(224,'Uíge Province',7,NULL,NULL),(225,'Huíla Province',7,NULL,NULL),(226,'Cuando Cubango Province',7,NULL,NULL),(227,'Malanje Province',7,NULL,NULL),(228,'Cabinda Province',7,NULL,NULL),(229,'Gasa District',26,NULL,NULL),(230,'Tsirang District',26,NULL,NULL),(231,'Wangdue Phodrang District',26,NULL,NULL),(232,'Haa District',26,NULL,NULL),(233,'Zhemgang District',26,NULL,NULL),(234,'Lhuntse District',26,NULL,NULL),(235,'Punakha District',26,NULL,NULL),(236,'Trashigang District',26,NULL,NULL),(237,'Paro District',26,NULL,NULL),(238,'Dagana District',26,NULL,NULL),(239,'Chukha District',26,NULL,NULL),(240,'Bumthang District',26,NULL,NULL),(241,'Thimphu District',26,NULL,NULL),(242,'Mongar District',26,NULL,NULL),(243,'Samdrup Jongkhar District',26,NULL,NULL),(244,'Pemagatshel District',26,NULL,NULL),(245,'Trongsa District',26,NULL,NULL),(246,'Samtse District',26,NULL,NULL),(247,'Sarpang District',26,NULL,NULL),(248,'Tombouctou Region',134,NULL,NULL),(249,'Ségou Region',134,NULL,NULL),(250,'Koulikoro Region',134,NULL,NULL),(251,'Ménaka Region',134,NULL,NULL),(252,'Kayes Region',134,NULL,NULL),(253,'Bamako',134,NULL,NULL),(254,'Sikasso Region',134,NULL,NULL),(255,'Mopti Region',134,NULL,NULL),(256,'Taoudénit Region',134,NULL,NULL),(257,'Kidal Region',134,NULL,NULL),(258,'Gao Region',134,NULL,NULL),(259,'Southern Province',183,NULL,NULL),(260,'Western Province',183,NULL,NULL),(261,'Eastern Province',183,NULL,NULL),(262,'Kigali district',183,NULL,NULL),(263,'Northern Province',183,NULL,NULL),(264,'Belize District',23,NULL,NULL),(265,'Stann Creek District',23,NULL,NULL),(266,'Corozal District',23,NULL,NULL),(267,'Toledo District',23,NULL,NULL),(268,'Orange Walk District',23,NULL,NULL),(269,'Cayo District',23,NULL,NULL),(270,'Príncipe Province',193,NULL,NULL),(271,'São Tomé Province',193,NULL,NULL),(272,'Havana Province',56,NULL,NULL),(273,'Santiago de Cuba Province',56,NULL,NULL),(274,'Sancti Spíritus Province',56,NULL,NULL),(275,'Granma Province',56,NULL,NULL),(276,'Mayabeque Province',56,NULL,NULL),(277,'Pinar del Río Province',56,NULL,NULL),(278,'Isla de la Juventud',56,NULL,NULL),(279,'Holguín Province',56,NULL,NULL),(280,'Villa Clara Province',56,NULL,NULL),(281,'Las Tunas Province',56,NULL,NULL),(282,'Ciego de Ávila Province',56,NULL,NULL),(283,'Artemisa Province',56,NULL,NULL),(284,'Matanzas Province',56,NULL,NULL),(285,'Guantánamo Province',56,NULL,NULL),(286,'Camagüey Province',56,NULL,NULL),(287,'Cienfuegos Province',56,NULL,NULL),(288,'Jigawa',161,NULL,NULL),(289,'Enugu',161,NULL,NULL),(290,'Kebbi',161,NULL,NULL),(291,'Benue',161,NULL,NULL),(292,'Sokoto',161,NULL,NULL),(293,'Abuja Federal Capital Territory',161,NULL,NULL),(294,'Kaduna',161,NULL,NULL),(295,'Kwara',161,NULL,NULL),(296,'Oyo',161,NULL,NULL),(297,'Yobe',161,NULL,NULL),(298,'Kogi',161,NULL,NULL),(299,'Zamfara',161,NULL,NULL),(300,'Kano',161,NULL,NULL),(301,'Nasarawa',161,NULL,NULL),(302,'Plateau',161,NULL,NULL),(303,'Abia',161,NULL,NULL),(304,'Akwa Ibom',161,NULL,NULL),(305,'Bayelsa',161,NULL,NULL),(306,'Lagos',161,NULL,NULL),(307,'Borno',161,NULL,NULL),(308,'Imo',161,NULL,NULL),(309,'Ekiti',161,NULL,NULL),(310,'Gombe',161,NULL,NULL),(311,'Ebonyi',161,NULL,NULL),(312,'Bauchi',161,NULL,NULL),(313,'Katsina',161,NULL,NULL),(314,'Cross River',161,NULL,NULL),(315,'Anambra',161,NULL,NULL),(316,'Delta',161,NULL,NULL),(317,'Niger',161,NULL,NULL),(318,'Edo',161,NULL,NULL),(319,'Taraba',161,NULL,NULL),(320,'Adamawa',161,NULL,NULL),(321,'Ondo',161,NULL,NULL),(322,'Osun',161,NULL,NULL),(323,'Ogun',161,NULL,NULL),(324,'Rukungiri District',229,NULL,NULL),(325,'Kyankwanzi District',229,NULL,NULL),(326,'Kabarole District',229,NULL,NULL),(327,'Mpigi District',229,NULL,NULL),(328,'Apac District',229,NULL,NULL),(329,'Abim District',229,NULL,NULL),(330,'Yumbe District',229,NULL,NULL),(331,'Rukiga District',229,NULL,NULL),(332,'Northern Region',229,NULL,NULL),(333,'Serere District',229,NULL,NULL),(334,'Kamuli District',229,NULL,NULL),(335,'Amuru District',229,NULL,NULL),(336,'Kaberamaido District',229,NULL,NULL),(337,'Namutumba District',229,NULL,NULL),(338,'Kibuku District',229,NULL,NULL),(339,'Ibanda District',229,NULL,NULL),(340,'Iganga District',229,NULL,NULL),(341,'Dokolo District',229,NULL,NULL),(342,'Lira District',229,NULL,NULL),(343,'Bukedea District',229,NULL,NULL),(344,'Alebtong District',229,NULL,NULL),(345,'Koboko District',229,NULL,NULL),(346,'Kiryandongo District',229,NULL,NULL),(347,'Kiboga District',229,NULL,NULL),(348,'Kitgum District',229,NULL,NULL),(349,'Bududa District',229,NULL,NULL),(350,'Mbale District',229,NULL,NULL),(351,'Namayingo District',229,NULL,NULL),(352,'Amuria District',229,NULL,NULL),(353,'Amudat District',229,NULL,NULL),(354,'Masindi District',229,NULL,NULL),(355,'Kiruhura District',229,NULL,NULL),(356,'Masaka District',229,NULL,NULL),(357,'Pakwach District',229,NULL,NULL),(358,'Rubanda District',229,NULL,NULL),(359,'Tororo District',229,NULL,NULL),(360,'Kamwenge District',229,NULL,NULL),(361,'Adjumani District',229,NULL,NULL),(362,'Wakiso District',229,NULL,NULL),(363,'Moyo District',229,NULL,NULL),(364,'Mityana District',229,NULL,NULL),(365,'Butaleja District',229,NULL,NULL),(366,'Gomba District',229,NULL,NULL),(367,'Jinja District',229,NULL,NULL),(368,'Kayunga District',229,NULL,NULL),(369,'Kween District',229,NULL,NULL),(370,'Western Region',229,NULL,NULL),(371,'Mubende District',229,NULL,NULL),(372,'Eastern Region',229,NULL,NULL),(373,'Kanungu District',229,NULL,NULL),(374,'Omoro District',229,NULL,NULL),(375,'Bukomansimbi District',229,NULL,NULL),(376,'Lyantonde District',229,NULL,NULL),(377,'Buikwe District',229,NULL,NULL),(378,'Nwoya District',229,NULL,NULL),(379,'Zombo District',229,NULL,NULL),(380,'Buyende District',229,NULL,NULL),(381,'Bunyangabu District',229,NULL,NULL),(382,'Kampala District',229,NULL,NULL),(383,'Isingiro District',229,NULL,NULL),(384,'Butambala District',229,NULL,NULL),(385,'Bukwo District',229,NULL,NULL),(386,'Bushenyi District',229,NULL,NULL),(387,'Bugiri District',229,NULL,NULL),(388,'Butebo District',229,NULL,NULL),(389,'Buliisa District',229,NULL,NULL),(390,'Otuke District',229,NULL,NULL),(391,'Buhweju District',229,NULL,NULL),(392,'Agago District',229,NULL,NULL),(393,'Nakapiripirit District',229,NULL,NULL),(394,'Kalungu District',229,NULL,NULL),(395,'Moroto District',229,NULL,NULL),(396,'Central Region',229,NULL,NULL),(397,'Oyam District',229,NULL,NULL),(398,'Kaliro District',229,NULL,NULL),(399,'Kakumiro District',229,NULL,NULL),(400,'Namisindwa District',229,NULL,NULL),(401,'Kole District',229,NULL,NULL),(402,'Kyenjojo District',229,NULL,NULL),(403,'Kagadi District',229,NULL,NULL),(404,'Ntungamo District',229,NULL,NULL),(405,'Kalangala District',229,NULL,NULL),(406,'Nakasongola District',229,NULL,NULL),(407,'Sheema District',229,NULL,NULL),(408,'Pader District',229,NULL,NULL),(409,'Kisoro District',229,NULL,NULL),(410,'Mukono District',229,NULL,NULL),(411,'Lamwo District',229,NULL,NULL),(412,'Pallisa District',229,NULL,NULL),(413,'Gulu District',229,NULL,NULL),(414,'Buvuma District',229,NULL,NULL),(415,'Mbarara District',229,NULL,NULL),(416,'Amolatar District',229,NULL,NULL),(417,'Lwengo District',229,NULL,NULL),(418,'Mayuge District',229,NULL,NULL),(419,'Bundibugyo District',229,NULL,NULL),(420,'Katakwi District',229,NULL,NULL),(421,'Maracha District',229,NULL,NULL),(422,'Ntoroko District',229,NULL,NULL),(423,'Nakaseke District',229,NULL,NULL),(424,'Ngora District',229,NULL,NULL),(425,'Kumi District',229,NULL,NULL),(426,'Kabale District',229,NULL,NULL),(427,'Sembabule District',229,NULL,NULL),(428,'Bulambuli District',229,NULL,NULL),(429,'Sironko District',229,NULL,NULL),(430,'Napak District',229,NULL,NULL),(431,'Busia District',229,NULL,NULL),(432,'Kapchorwa District',229,NULL,NULL),(433,'Luwero District',229,NULL,NULL),(434,'Kaabong District',229,NULL,NULL),(435,'Mitooma District',229,NULL,NULL),(436,'Kibaale District',229,NULL,NULL),(437,'Kyegegwa District',229,NULL,NULL),(438,'Manafwa District',229,NULL,NULL),(439,'Rakai District',229,NULL,NULL),(440,'Kasese District',229,NULL,NULL),(441,'Budaka District',229,NULL,NULL),(442,'Rubirizi District',229,NULL,NULL),(443,'Kotido District',229,NULL,NULL),(444,'Soroti District',229,NULL,NULL),(445,'Luuka District',229,NULL,NULL),(446,'Nebbi District',229,NULL,NULL),(447,'Arua District',229,NULL,NULL),(448,'Kyotera District',229,NULL,NULL),(449,'Schellenberg',125,NULL,NULL),(450,'Schaan',125,NULL,NULL),(451,'Eschen',125,NULL,NULL),(452,'Vaduz',125,NULL,NULL),(453,'Ruggell',125,NULL,NULL),(454,'Planken',125,NULL,NULL),(455,'Mauren',125,NULL,NULL),(456,'Triesenberg',125,NULL,NULL),(457,'Gamprin',125,NULL,NULL),(458,'Balzers',125,NULL,NULL),(459,'Triesen',125,NULL,NULL),(460,'Brčko District',28,NULL,NULL),(461,'Tuzla Canton',28,NULL,NULL),(462,'Central Bosnia Canton',28,NULL,NULL),(463,'Herzegovina-Neretva Canton',28,NULL,NULL),(464,'Posavina Canton',28,NULL,NULL),(465,'Una-Sana Canton',28,NULL,NULL),(466,'Sarajevo Canton',28,NULL,NULL),(467,'Federation of Bosnia and Herzegovina',28,NULL,NULL),(468,'Zenica-Doboj Canton',28,NULL,NULL),(469,'West Herzegovina Canton',28,NULL,NULL),(470,'Republika Srpska',28,NULL,NULL),(471,'Canton 10',28,NULL,NULL),(472,'Bosnian Podrinje Canton',28,NULL,NULL),(473,'Dakar',195,NULL,NULL),(474,'Kolda',195,NULL,NULL),(475,'Kaffrine',195,NULL,NULL),(476,'Matam',195,NULL,NULL),(477,'Saint-Louis',195,NULL,NULL),(478,'Ziguinchor',195,NULL,NULL),(479,'Fatick',195,NULL,NULL),(480,'Diourbel Region',195,NULL,NULL),(481,'Kédougou',195,NULL,NULL),(482,'Sédhiou',195,NULL,NULL),(483,'Kaolack',195,NULL,NULL),(484,'Thiès Region',195,NULL,NULL),(485,'Louga',195,NULL,NULL),(486,'Tambacounda Region',195,NULL,NULL),(487,'Encamp',6,NULL,NULL),(488,'Andorra la Vella',6,NULL,NULL),(489,'Canillo',6,NULL,NULL),(490,'Sant Julià de Lòria',6,NULL,NULL),(491,'Ordino',6,NULL,NULL),(492,'Escaldes-Engordany',6,NULL,NULL),(493,'La Massana',6,NULL,NULL),(494,'Mont Buxton',197,NULL,NULL),(495,'La Digue',197,NULL,NULL),(496,'Saint Louis',197,NULL,NULL),(497,'Baie Lazare',197,NULL,NULL),(498,'Mont Fleuri',197,NULL,NULL),(499,'Les Mamelles',197,NULL,NULL),(500,'Grand\'Anse Mahé',197,NULL,NULL),(501,'Roche Caiman',197,NULL,NULL),(502,'Anse Royale',197,NULL,NULL),(503,'Glacis',197,NULL,NULL),(504,'Grand\'Anse Praslin',197,NULL,NULL),(505,'Bel Ombre',197,NULL,NULL),(506,'Anse-aux-Pins',197,NULL,NULL),(507,'Port Glaud',197,NULL,NULL),(508,'Au Cap',197,NULL,NULL),(509,'Takamaka',197,NULL,NULL),(510,'Pointe La Rue',197,NULL,NULL),(511,'Plaisance',197,NULL,NULL),(512,'Beau Vallon',197,NULL,NULL),(513,'Anse Boileau',197,NULL,NULL),(514,'Baie Sainte Anne',197,NULL,NULL),(515,'Bel Air',197,NULL,NULL),(516,'La Rivière Anglaise',197,NULL,NULL),(517,'Cascade',197,NULL,NULL),(518,'Shaki',16,NULL,NULL),(519,'Tartar District',16,NULL,NULL),(520,'Shirvan',16,NULL,NULL),(521,'Qazakh District',16,NULL,NULL),(522,'Sadarak District',16,NULL,NULL),(523,'Yevlakh District',16,NULL,NULL),(524,'Khojali District',16,NULL,NULL),(525,'Kalbajar District',16,NULL,NULL),(526,'Qakh District',16,NULL,NULL),(527,'Fizuli District',16,NULL,NULL),(528,'Astara District',16,NULL,NULL),(529,'Shamakhi District',16,NULL,NULL),(530,'Neftchala District',16,NULL,NULL),(531,'Goychay',16,NULL,NULL),(532,'Bilasuvar District',16,NULL,NULL),(533,'Tovuz District',16,NULL,NULL),(534,'Ordubad District',16,NULL,NULL),(535,'Sharur District',16,NULL,NULL),(536,'Samukh District',16,NULL,NULL),(537,'Khizi District',16,NULL,NULL),(538,'Yevlakh',16,NULL,NULL),(539,'Ujar District',16,NULL,NULL),(540,'Absheron District',16,NULL,NULL),(541,'Lachin District',16,NULL,NULL),(542,'Qabala District',16,NULL,NULL),(543,'Agstafa District',16,NULL,NULL),(544,'Imishli District',16,NULL,NULL),(545,'Salyan District',16,NULL,NULL),(546,'Lerik District',16,NULL,NULL),(547,'Agsu District',16,NULL,NULL),(548,'Qubadli District',16,NULL,NULL),(549,'Kurdamir District',16,NULL,NULL),(550,'Yardymli District',16,NULL,NULL),(551,'Goranboy District',16,NULL,NULL),(552,'Baku',16,NULL,NULL),(553,'Agdash District',16,NULL,NULL),(554,'Beylagan District',16,NULL,NULL),(555,'Masally District',16,NULL,NULL),(556,'Oghuz District',16,NULL,NULL),(557,'Saatly District',16,NULL,NULL),(558,'Lankaran District',16,NULL,NULL),(559,'Agdam District',16,NULL,NULL),(560,'Balakan District',16,NULL,NULL),(561,'Dashkasan District',16,NULL,NULL),(562,'Nakhchivan Autonomous Republic',16,NULL,NULL),(563,'Quba District',16,NULL,NULL),(564,'Ismailli District',16,NULL,NULL),(565,'Sabirabad District',16,NULL,NULL),(566,'Zaqatala District',16,NULL,NULL),(567,'Kangarli District',16,NULL,NULL),(568,'Martuni',16,NULL,NULL),(569,'Barda District',16,NULL,NULL),(570,'Jabrayil District',16,NULL,NULL),(571,'Hajigabul District',16,NULL,NULL),(572,'Julfa District',16,NULL,NULL),(573,'Gobustan District',16,NULL,NULL),(574,'Goygol District',16,NULL,NULL),(575,'Babek District',16,NULL,NULL),(576,'Zardab District',16,NULL,NULL),(577,'Aghjabadi District',16,NULL,NULL),(578,'Jalilabad District',16,NULL,NULL),(579,'Shahbuz District',16,NULL,NULL),(580,'Mingachevir',16,NULL,NULL),(581,'Zangilan District',16,NULL,NULL),(582,'Sumqayit',16,NULL,NULL),(583,'Shamkir District',16,NULL,NULL),(584,'Siazan District',16,NULL,NULL),(585,'Ganja',16,NULL,NULL),(586,'Shaki District',16,NULL,NULL),(587,'Lankaran',16,NULL,NULL),(588,'Qusar District',16,NULL,NULL),(589,'Gədəbəy',16,NULL,NULL),(590,'Khachmaz District',16,NULL,NULL),(591,'Shabran District',16,NULL,NULL),(592,'Shusha District',16,NULL,NULL),(593,'Skrapar District',3,NULL,NULL),(594,'Kavajë District',3,NULL,NULL),(595,'Lezhë District',3,NULL,NULL),(596,'Librazhd District',3,NULL,NULL),(597,'Korçë District',3,NULL,NULL),(598,'Elbasan County',3,NULL,NULL),(599,'Lushnjë District',3,NULL,NULL),(600,'Has District',3,NULL,NULL),(601,'Kukës County',3,NULL,NULL),(602,'Malësi e Madhe District',3,NULL,NULL),(603,'Berat County',3,NULL,NULL),(604,'Gjirokastër County',3,NULL,NULL),(605,'Dibër District',3,NULL,NULL),(606,'Pogradec District',3,NULL,NULL),(607,'Bulqizë District',3,NULL,NULL),(608,'Devoll District',3,NULL,NULL),(609,'Lezhë County',3,NULL,NULL),(610,'Dibër County',3,NULL,NULL),(611,'Shkodër County',3,NULL,NULL),(612,'Kuçovë District',3,NULL,NULL),(613,'Vlorë District',3,NULL,NULL),(614,'Krujë District',3,NULL,NULL),(615,'Tirana County',3,NULL,NULL),(616,'Tepelenë District',3,NULL,NULL),(617,'Gramsh District',3,NULL,NULL),(618,'Delvinë District',3,NULL,NULL),(619,'Peqin District',3,NULL,NULL),(620,'Pukë District',3,NULL,NULL),(621,'Gjirokastër District',3,NULL,NULL),(622,'Kurbin District',3,NULL,NULL),(623,'Kukës District',3,NULL,NULL),(624,'Sarandë District',3,NULL,NULL),(625,'Përmet District',3,NULL,NULL),(626,'Shkodër District',3,NULL,NULL),(627,'Fier District',3,NULL,NULL),(628,'Kolonjë District',3,NULL,NULL),(629,'Berat District',3,NULL,NULL),(630,'Korçë County',3,NULL,NULL),(631,'Fier County',3,NULL,NULL),(632,'Durrës County',3,NULL,NULL),(633,'Tirana District',3,NULL,NULL),(634,'Vlorë County',3,NULL,NULL),(635,'Mat District',3,NULL,NULL),(636,'Tropojë District',3,NULL,NULL),(637,'Mallakastër District',3,NULL,NULL),(638,'Mirditë District',3,NULL,NULL),(639,'Durrës District',3,NULL,NULL),(640,'Sveti Nikole Municipality',129,NULL,NULL),(641,'Kratovo Municipality',129,NULL,NULL),(642,'Zajas Municipality',129,NULL,NULL),(643,'Staro Nagoričane Municipality',129,NULL,NULL),(644,'Češinovo-Obleševo Municipality',129,NULL,NULL),(645,'Debarca Municipality',129,NULL,NULL),(646,'Probištip Municipality',129,NULL,NULL),(647,'Krivogaštani Municipality',129,NULL,NULL),(648,'Gevgelija Municipality',129,NULL,NULL),(649,'Bogdanci Municipality',129,NULL,NULL),(650,'Vraneštica Municipality',129,NULL,NULL),(651,'Veles Municipality',129,NULL,NULL),(652,'Bosilovo Municipality',129,NULL,NULL),(653,'Mogila Municipality',129,NULL,NULL),(654,'Tearce Municipality',129,NULL,NULL),(655,'Demir Kapija Municipality',129,NULL,NULL),(656,'Aračinovo Municipality',129,NULL,NULL),(657,'Drugovo Municipality',129,NULL,NULL),(658,'Vasilevo Municipality',129,NULL,NULL),(659,'Lipkovo Municipality',129,NULL,NULL),(660,'Brvenica Municipality',129,NULL,NULL),(661,'Štip Municipality',129,NULL,NULL),(662,'Vevčani Municipality',129,NULL,NULL),(663,'Tetovo Municipality',129,NULL,NULL),(664,'Negotino Municipality',129,NULL,NULL),(665,'Konče Municipality',129,NULL,NULL),(666,'Prilep Municipality',129,NULL,NULL),(667,'Saraj Municipality',129,NULL,NULL),(668,'Želino Municipality',129,NULL,NULL),(669,'Mavrovo and Rostuša Municipality',129,NULL,NULL),(670,'Plasnica Municipality',129,NULL,NULL),(671,'Valandovo Municipality',129,NULL,NULL),(672,'Vinica Municipality',129,NULL,NULL),(673,'Zrnovci Municipality',129,NULL,NULL),(674,'Karbinci',129,NULL,NULL),(675,'Dolneni Municipality',129,NULL,NULL),(676,'Čaška Municipality',129,NULL,NULL),(677,'Kriva Palanka Municipality',129,NULL,NULL),(678,'Jegunovce Municipality',129,NULL,NULL),(679,'Bitola Municipality',129,NULL,NULL),(680,'Šuto Orizari Municipality',129,NULL,NULL),(681,'Karpoš Municipality',129,NULL,NULL),(682,'Oslomej Municipality',129,NULL,NULL),(683,'Kumanovo Municipality',129,NULL,NULL),(684,'Greater Skopje',129,NULL,NULL),(685,'Pehčevo Municipality',129,NULL,NULL),(686,'Kisela Voda Municipality',129,NULL,NULL),(687,'Demir Hisar Municipality',129,NULL,NULL),(688,'Kičevo Municipality',129,NULL,NULL),(689,'Vrapčište Municipality',129,NULL,NULL),(690,'Ilinden Municipality',129,NULL,NULL),(691,'Rosoman Municipality',129,NULL,NULL),(692,'Makedonski Brod Municipality',129,NULL,NULL),(693,'Gostivar Municipality',129,NULL,NULL),(694,'Butel Municipality',129,NULL,NULL),(695,'Delčevo Municipality',129,NULL,NULL),(696,'Novaci Municipality',129,NULL,NULL),(697,'Dojran Municipality',129,NULL,NULL),(698,'Petrovec Municipality',129,NULL,NULL),(699,'Ohrid Municipality',129,NULL,NULL),(700,'Struga Municipality',129,NULL,NULL),(701,'Makedonska Kamenica Municipality',129,NULL,NULL),(702,'Centar Municipality',129,NULL,NULL),(703,'Aerodrom Municipality',129,NULL,NULL),(704,'Čair Municipality',129,NULL,NULL),(705,'Lozovo Municipality',129,NULL,NULL),(706,'Zelenikovo Municipality',129,NULL,NULL),(707,'Gazi Baba Municipality',129,NULL,NULL),(708,'Gradsko Municipality',129,NULL,NULL),(709,'Radoviš Municipality',129,NULL,NULL),(710,'Strumica Municipality',129,NULL,NULL),(711,'Studeničani Municipality',129,NULL,NULL),(712,'Resen Municipality',129,NULL,NULL),(713,'Kavadarci Municipality',129,NULL,NULL),(714,'Kruševo Municipality',129,NULL,NULL),(715,'Čučer-Sandevo Municipality',129,NULL,NULL),(716,'Berovo Municipality',129,NULL,NULL),(717,'Rankovce Municipality',129,NULL,NULL),(718,'Novo Selo Municipality',129,NULL,NULL),(719,'Sopište Municipality',129,NULL,NULL),(720,'Centar Župa Municipality',129,NULL,NULL),(721,'Bogovinje Municipality',129,NULL,NULL),(722,'Gjorče Petrov Municipality',129,NULL,NULL),(723,'Kočani Municipality',129,NULL,NULL),(724,'Požega-Slavonia',55,NULL,NULL),(725,'Split-Dalmatia',55,NULL,NULL),(726,'Međimurje',55,NULL,NULL),(727,'Zadar',55,NULL,NULL),(728,'Dubrovnik-Neretva',55,NULL,NULL),(729,'Krapina-Zagorje',55,NULL,NULL),(730,'Šibenik-Knin',55,NULL,NULL),(731,'Lika-Senj',55,NULL,NULL),(732,'Virovitica-Podravina',55,NULL,NULL),(733,'Sisak-Moslavina',55,NULL,NULL),(734,'Bjelovar-Bilogora',55,NULL,NULL),(735,'Primorje-Gorski Kotar',55,NULL,NULL),(736,'Zagreb',55,NULL,NULL),(737,'Brod-Posavina',55,NULL,NULL),(738,'Zagreb',55,NULL,NULL),(739,'Varaždin',55,NULL,NULL),(740,'Osijek-Baranja',55,NULL,NULL),(741,'Vukovar-Syrmia',55,NULL,NULL),(742,'Koprivnica-Križevci',55,NULL,NULL),(743,'Istria',55,NULL,NULL),(744,'Kyrenia District (Keryneia)',57,NULL,NULL),(745,'Nicosia District (Lefkoşa)',57,NULL,NULL),(746,'Paphos District (Pafos)',57,NULL,NULL),(747,'Larnaca District (Larnaka)',57,NULL,NULL),(748,'Limassol District (Leymasun)',57,NULL,NULL),(749,'Famagusta District (Mağusa)',57,NULL,NULL),(750,'Rangpur Division',19,NULL,NULL),(751,'Cox\'s Bazar District',19,NULL,NULL),(752,'Bandarban District',19,NULL,NULL),(753,'Rajshahi Division',19,NULL,NULL),(754,'Pabna District',19,NULL,NULL),(755,'Sherpur District',19,NULL,NULL),(756,'Bhola District',19,NULL,NULL),(757,'Jessore District',19,NULL,NULL),(758,'Mymensingh Division',19,NULL,NULL),(759,'Rangpur District',19,NULL,NULL),(760,'Dhaka Division',19,NULL,NULL),(761,'Chapai Nawabganj District',19,NULL,NULL),(762,'Faridpur District',19,NULL,NULL),(763,'Comilla District',19,NULL,NULL),(764,'Netrokona District',19,NULL,NULL),(765,'Sylhet Division',19,NULL,NULL),(766,'Mymensingh District',19,NULL,NULL),(767,'Sylhet District',19,NULL,NULL),(768,'Chandpur District',19,NULL,NULL),(769,'Narail District',19,NULL,NULL),(770,'Narayanganj District',19,NULL,NULL),(771,'Dhaka District',19,NULL,NULL),(772,'Nilphamari District',19,NULL,NULL),(773,'Rajbari District',19,NULL,NULL),(774,'Kushtia District',19,NULL,NULL),(775,'Khulna Division',19,NULL,NULL),(776,'Meherpur District',19,NULL,NULL),(777,'Patuakhali District',19,NULL,NULL),(778,'Jhalokati District',19,NULL,NULL),(779,'Kishoreganj District',19,NULL,NULL),(780,'Lalmonirhat District',19,NULL,NULL),(781,'Sirajganj District',19,NULL,NULL),(782,'Tangail District',19,NULL,NULL),(783,'Dinajpur District',19,NULL,NULL),(784,'Barguna District',19,NULL,NULL),(785,'Chittagong District',19,NULL,NULL),(786,'Khagrachari District',19,NULL,NULL),(787,'Natore District',19,NULL,NULL),(788,'Chuadanga District',19,NULL,NULL),(789,'Jhenaidah District',19,NULL,NULL),(790,'Munshiganj District',19,NULL,NULL),(791,'Pirojpur District',19,NULL,NULL),(792,'Gopalganj District',19,NULL,NULL),(793,'Kurigram District',19,NULL,NULL),(794,'Moulvibazar District',19,NULL,NULL),(795,'Gaibandha District',19,NULL,NULL),(796,'Bagerhat District',19,NULL,NULL),(797,'Bogra District',19,NULL,NULL),(798,'Gazipur District',19,NULL,NULL),(799,'Satkhira District',19,NULL,NULL),(800,'Panchagarh District',19,NULL,NULL),(801,'Shariatpur District',19,NULL,NULL),(802,'Bahadia',19,NULL,NULL),(803,'Chittagong Division',19,NULL,NULL),(804,'Thakurgaon District',19,NULL,NULL),(805,'Habiganj District',19,NULL,NULL),(806,'Joypurhat District',19,NULL,NULL),(807,'Barisal Division',19,NULL,NULL),(808,'Jamalpur District',19,NULL,NULL),(809,'Rangamati Hill District',19,NULL,NULL),(810,'Brahmanbaria District',19,NULL,NULL),(811,'Khulna District',19,NULL,NULL),(812,'Sunamganj District',19,NULL,NULL),(813,'Rajshahi District',19,NULL,NULL),(814,'Naogaon District',19,NULL,NULL),(815,'Noakhali District',19,NULL,NULL),(816,'Feni District',19,NULL,NULL),(817,'Madaripur District',19,NULL,NULL),(818,'Barisal District',19,NULL,NULL),(819,'Lakshmipur District',19,NULL,NULL),(820,'Okayama Prefecture',109,NULL,NULL),(821,'Chiba Prefecture',109,NULL,NULL),(822,'Ōita Prefecture',109,NULL,NULL),(823,'Tokyo',109,NULL,NULL),(824,'Nara Prefecture',109,NULL,NULL),(825,'Shizuoka Prefecture',109,NULL,NULL),(826,'Shimane Prefecture',109,NULL,NULL),(827,'Aichi Prefecture',109,NULL,NULL),(828,'Hiroshima Prefecture',109,NULL,NULL),(829,'Akita Prefecture',109,NULL,NULL),(830,'Ishikawa Prefecture',109,NULL,NULL),(831,'Hyōgo Prefecture',109,NULL,NULL),(832,'Hokkaidō Prefecture',109,NULL,NULL),(833,'Mie Prefecture',109,NULL,NULL),(834,'Kyōto Prefecture',109,NULL,NULL),(835,'Yamaguchi Prefecture',109,NULL,NULL),(836,'Tokushima Prefecture',109,NULL,NULL),(837,'Yamagata Prefecture',109,NULL,NULL),(838,'Toyama Prefecture',109,NULL,NULL),(839,'Aomori Prefecture',109,NULL,NULL),(840,'Kagoshima Prefecture',109,NULL,NULL),(841,'Niigata Prefecture',109,NULL,NULL),(842,'Kanagawa Prefecture',109,NULL,NULL),(843,'Nagano Prefecture',109,NULL,NULL),(844,'Wakayama Prefecture',109,NULL,NULL),(845,'Shiga Prefecture',109,NULL,NULL),(846,'Kumamoto Prefecture',109,NULL,NULL),(847,'Fukushima Prefecture',109,NULL,NULL),(848,'Fukui Prefecture',109,NULL,NULL),(849,'Nagasaki Prefecture',109,NULL,NULL),(850,'Tottori Prefecture',109,NULL,NULL),(851,'Ibaraki Prefecture',109,NULL,NULL),(852,'Yamanashi Prefecture',109,NULL,NULL),(853,'Okinawa Prefecture',109,NULL,NULL),(854,'Tochigi Prefecture',109,NULL,NULL),(855,'Miyazaki Prefecture',109,NULL,NULL),(856,'Iwate Prefecture',109,NULL,NULL),(857,'Miyagi Prefecture',109,NULL,NULL),(858,'Gifu Prefecture',109,NULL,NULL),(859,'Ōsaka Prefecture',109,NULL,NULL),(860,'Saitama Prefecture',109,NULL,NULL),(861,'Fukuoka Prefecture',109,NULL,NULL),(862,'Gunma Prefecture',109,NULL,NULL),(863,'Saga Prefecture',109,NULL,NULL),(864,'Kagawa Prefecture',109,NULL,NULL),(865,'Ehime Prefecture',109,NULL,NULL),(866,'Ontario',39,NULL,NULL),(867,'Manitoba',39,NULL,NULL),(868,'New Brunswick',39,NULL,NULL),(869,'Yukon',39,NULL,NULL),(870,'Saskatchewan',39,NULL,NULL),(871,'Prince Edward Island',39,NULL,NULL),(872,'Alberta',39,NULL,NULL),(873,'Quebec',39,NULL,NULL),(874,'Nova Scotia',39,NULL,NULL),(875,'British Columbia',39,NULL,NULL),(876,'Nunavut',39,NULL,NULL),(877,'Newfoundland and Labrador',39,NULL,NULL),(878,'Northwest Territories',39,NULL,NULL),(879,'White Nile',209,NULL,NULL),(880,'Red Sea',209,NULL,NULL),(881,'Khartoum',209,NULL,NULL),(882,'Sennar',209,NULL,NULL),(883,'South Kordofan',209,NULL,NULL),(884,'Kassala',209,NULL,NULL),(885,'Al Jazirah',209,NULL,NULL),(886,'Al Qadarif',209,NULL,NULL),(887,'Blue Nile',209,NULL,NULL),(888,'West Darfur',209,NULL,NULL),(889,'West Kordofan',209,NULL,NULL),(890,'North Darfur',209,NULL,NULL),(891,'River Nile',209,NULL,NULL),(892,'East Darfur',209,NULL,NULL),(893,'North Kordofan',209,NULL,NULL),(894,'South Darfur',209,NULL,NULL),(895,'Northern',209,NULL,NULL),(896,'Central Darfur',209,NULL,NULL),(897,'Khelvachauri Municipality',81,NULL,NULL),(898,'Senaki Municipality',81,NULL,NULL),(899,'Tbilisi',81,NULL,NULL),(900,'Adjara',81,NULL,NULL),(901,'Autonomous Republic of Abkhazia',81,NULL,NULL),(902,'Mtskheta-Mtianeti',81,NULL,NULL),(903,'Shida Kartli',81,NULL,NULL),(904,'Kvemo Kartli',81,NULL,NULL),(905,'Imereti',81,NULL,NULL),(906,'Samtskhe-Javakheti',81,NULL,NULL),(907,'Guria',81,NULL,NULL),(908,'Samegrelo-Zemo Svaneti',81,NULL,NULL),(909,'Racha-Lechkhumi and Kvemo Svaneti',81,NULL,NULL),(910,'Kakheti',81,NULL,NULL),(911,'Northern Province',198,NULL,NULL),(912,'Southern Province',198,NULL,NULL),(913,'Western Area',198,NULL,NULL),(914,'Eastern Province',198,NULL,NULL),(915,'Hiran',203,NULL,NULL),(916,'Mudug',203,NULL,NULL),(917,'Bakool',203,NULL,NULL),(918,'Galguduud',203,NULL,NULL),(919,'Sanaag Region',203,NULL,NULL),(920,'Nugal',203,NULL,NULL),(921,'Lower Shebelle',203,NULL,NULL),(922,'Middle Juba',203,NULL,NULL),(923,'Middle Shebelle',203,NULL,NULL),(924,'Lower Juba',203,NULL,NULL),(925,'Awdal Region',203,NULL,NULL),(926,'Bay',203,NULL,NULL),(927,'Banaadir',203,NULL,NULL),(928,'Gedo',203,NULL,NULL),(929,'Togdheer Region',203,NULL,NULL),(930,'Bari',203,NULL,NULL),(931,'Northern Cape',204,NULL,NULL),(932,'Free State',204,NULL,NULL),(933,'Limpopo',204,NULL,NULL),(934,'North West',204,NULL,NULL),(935,'KwaZulu-Natal',204,NULL,NULL),(936,'Gauteng',204,NULL,NULL),(937,'Mpumalanga',204,NULL,NULL),(938,'Eastern Cape',204,NULL,NULL),(939,'Western Cape',204,NULL,NULL),(940,'Chontales',159,NULL,NULL),(941,'Managua',159,NULL,NULL),(942,'Rivas',159,NULL,NULL),(943,'Granada',159,NULL,NULL),(944,'León',159,NULL,NULL),(945,'Estelí',159,NULL,NULL),(946,'Boaco',159,NULL,NULL),(947,'Matagalpa',159,NULL,NULL),(948,'Madriz',159,NULL,NULL),(949,'Río San Juan',159,NULL,NULL),(950,'Carazo',159,NULL,NULL),(951,'North Caribbean Coast',159,NULL,NULL),(952,'South Caribbean Coast',159,NULL,NULL),(953,'Masaya',159,NULL,NULL),(954,'Chinandega',159,NULL,NULL),(955,'Jinotega',159,NULL,NULL),(956,'Karak Governorate',111,NULL,NULL),(957,'Tafilah Governorate',111,NULL,NULL),(958,'Madaba Governorate',111,NULL,NULL),(959,'Aqaba Governorate',111,NULL,NULL),(960,'Irbid Governorate',111,NULL,NULL),(961,'Balqa Governorate',111,NULL,NULL),(962,'Mafraq Governorate',111,NULL,NULL),(963,'Ajloun Governorate',111,NULL,NULL),(964,'Ma\'an Governorate',111,NULL,NULL),(965,'Amman Governorate',111,NULL,NULL),(966,'Jerash Governorate',111,NULL,NULL),(967,'Zarqa Governorate',111,NULL,NULL),(968,'Manzini District',212,NULL,NULL),(969,'Hhohho District',212,NULL,NULL),(970,'Lubombo District',212,NULL,NULL),(971,'Shiselweni District',212,NULL,NULL),(972,'Al Jahra Governorate',117,NULL,NULL),(973,'Hawalli Governorate',117,NULL,NULL),(974,'Mubarak Al-Kabeer Governorate',117,NULL,NULL),(975,'Al Farwaniyah Governorate',117,NULL,NULL),(976,'Capital Governorate',117,NULL,NULL),(977,'Al Ahmadi Governorate',117,NULL,NULL),(978,'Luang Prabang Province',119,NULL,NULL),(979,'Vientiane Prefecture',119,NULL,NULL),(980,'Vientiane Province',119,NULL,NULL),(981,'Salavan Province',119,NULL,NULL),(982,'Attapeu Province',119,NULL,NULL),(983,'Xaisomboun Province',119,NULL,NULL),(984,'Sekong Province',119,NULL,NULL),(985,'Bolikhamsai Province',119,NULL,NULL),(986,'Khammouane Province',119,NULL,NULL),(987,'Phongsaly Province',119,NULL,NULL),(988,'Oudomxay Province',119,NULL,NULL),(989,'Houaphanh Province',119,NULL,NULL),(990,'Savannakhet Province',119,NULL,NULL),(991,'Bokeo Province',119,NULL,NULL),(992,'Luang Namtha Province',119,NULL,NULL),(993,'Sainyabuli Province',119,NULL,NULL),(994,'Xaisomboun',119,NULL,NULL),(995,'Xiangkhouang Province',119,NULL,NULL),(996,'Champasak Province',119,NULL,NULL),(997,'Talas Region',118,NULL,NULL),(998,'Batken Region',118,NULL,NULL),(999,'Naryn Region',118,NULL,NULL),(1000,'Jalal-Abad Region',118,NULL,NULL),(1001,'Bishkek',118,NULL,NULL),(1002,'Issyk-Kul Region',118,NULL,NULL),(1003,'Osh',118,NULL,NULL),(1004,'Chuy Region',118,NULL,NULL),(1005,'Osh Region',118,NULL,NULL),(1006,'Trøndelag',165,NULL,NULL),(1007,'Oslo',165,NULL,NULL),(1008,'Vestfold',165,NULL,NULL),(1009,'Oppland',165,NULL,NULL),(1010,'Sør-Trøndelag',165,NULL,NULL),(1011,'Buskerud',165,NULL,NULL),(1012,'Nord-Trøndelag',165,NULL,NULL),(1013,'Svalbard',165,NULL,NULL),(1014,'Vest-Agder',165,NULL,NULL),(1015,'Troms',165,NULL,NULL),(1016,'Finnmark',165,NULL,NULL),(1017,'Akershus',165,NULL,NULL),(1018,'Sogn og Fjordane',165,NULL,NULL),(1019,'Hedmark',165,NULL,NULL),(1020,'Møre og Romsdal',165,NULL,NULL),(1021,'Rogaland',165,NULL,NULL),(1022,'Østfold',165,NULL,NULL),(1023,'Hordaland',165,NULL,NULL),(1024,'Telemark',165,NULL,NULL),(1025,'Nordland',165,NULL,NULL),(1026,'Jan Mayen',165,NULL,NULL),(1027,'Hódmezővásárhely',99,NULL,NULL),(1028,'Érd',99,NULL,NULL),(1029,'Szeged',99,NULL,NULL),(1030,'Nagykanizsa',99,NULL,NULL),(1031,'Csongrád County',99,NULL,NULL),(1032,'Debrecen',99,NULL,NULL),(1033,'Székesfehérvár',99,NULL,NULL),(1034,'Nyíregyháza',99,NULL,NULL),(1035,'Somogy County',99,NULL,NULL),(1036,'Békéscsaba',99,NULL,NULL),(1037,'Eger',99,NULL,NULL),(1038,'Tolna County',99,NULL,NULL),(1039,'Vas County',99,NULL,NULL),(1040,'Heves County',99,NULL,NULL),(1041,'Győr',99,NULL,NULL),(1042,'Győr-Moson-Sopron County',99,NULL,NULL),(1043,'Jász-Nagykun-Szolnok County',99,NULL,NULL),(1044,'Fejér County',99,NULL,NULL),(1045,'Szabolcs-Szatmár-Bereg County',99,NULL,NULL),(1046,'Zala County',99,NULL,NULL),(1047,'Szolnok',99,NULL,NULL),(1048,'Bács-Kiskun',99,NULL,NULL),(1049,'Dunaújváros',99,NULL,NULL),(1050,'Zalaegerszeg',99,NULL,NULL),(1051,'Nógrád County',99,NULL,NULL),(1052,'Szombathely',99,NULL,NULL),(1053,'Pécs',99,NULL,NULL),(1054,'Veszprém County',99,NULL,NULL),(1055,'Baranya',99,NULL,NULL),(1056,'Kecskemét',99,NULL,NULL),(1057,'Sopron',99,NULL,NULL),(1058,'Borsod-Abaúj-Zemplén',99,NULL,NULL),(1059,'Pest County',99,NULL,NULL),(1060,'Békés',99,NULL,NULL),(1061,'Szekszárd',99,NULL,NULL),(1062,'Veszprém',99,NULL,NULL),(1063,'Hajdú-Bihar County',99,NULL,NULL),(1064,'Budapest',99,NULL,NULL),(1065,'Miskolc',99,NULL,NULL),(1066,'Tatabánya',99,NULL,NULL),(1067,'Kaposvár',99,NULL,NULL),(1068,'Salgótarján',99,NULL,NULL),(1069,'Tipperary',105,NULL,NULL),(1070,'Sligo',105,NULL,NULL),(1071,'Donegal',105,NULL,NULL),(1072,'Dublin',105,NULL,NULL),(1073,'Leinster',105,NULL,NULL),(1074,'Cork',105,NULL,NULL),(1075,'Monaghan',105,NULL,NULL),(1076,'Longford',105,NULL,NULL),(1077,'Kerry',105,NULL,NULL),(1078,'Offaly',105,NULL,NULL),(1079,'Galway',105,NULL,NULL),(1080,'Munster',105,NULL,NULL),(1081,'Roscommon',105,NULL,NULL),(1082,'Kildare',105,NULL,NULL),(1083,'Louth',105,NULL,NULL),(1084,'Mayo',105,NULL,NULL),(1085,'Wicklow',105,NULL,NULL),(1086,'Ulster',105,NULL,NULL),(1087,'Connacht',105,NULL,NULL),(1088,'Cavan',105,NULL,NULL),(1089,'Waterford',105,NULL,NULL),(1090,'Kilkenny',105,NULL,NULL),(1091,'Clare',105,NULL,NULL),(1092,'Meath',105,NULL,NULL),(1093,'Wexford',105,NULL,NULL),(1094,'Limerick',105,NULL,NULL),(1095,'Carlow',105,NULL,NULL),(1096,'Laois',105,NULL,NULL),(1097,'Westmeath',105,NULL,NULL),(1098,'Djelfa',4,NULL,NULL),(1099,'El Oued',4,NULL,NULL),(1100,'El Tarf',4,NULL,NULL),(1101,'Oran',4,NULL,NULL),(1102,'Naama',4,NULL,NULL),(1103,'Annaba',4,NULL,NULL),(1104,'Bouïra',4,NULL,NULL),(1105,'Chlef',4,NULL,NULL),(1106,'Tiaret',4,NULL,NULL),(1107,'Tlemcen',4,NULL,NULL),(1108,'Béchar',4,NULL,NULL),(1109,'Médéa',4,NULL,NULL),(1110,'Skikda',4,NULL,NULL),(1111,'Blida',4,NULL,NULL),(1112,'Illizi',4,NULL,NULL),(1113,'Jijel',4,NULL,NULL),(1114,'Biskra',4,NULL,NULL),(1115,'Tipasa',4,NULL,NULL),(1116,'Bordj Bou Arréridj',4,NULL,NULL),(1117,'Tébessa',4,NULL,NULL),(1118,'Adrar',4,NULL,NULL),(1119,'Aïn Defla',4,NULL,NULL),(1120,'Tindouf',4,NULL,NULL),(1121,'Constantine',4,NULL,NULL),(1122,'Aïn Témouchent',4,NULL,NULL),(1123,'Saïda',4,NULL,NULL),(1124,'Mascara',4,NULL,NULL),(1125,'Boumerdès',4,NULL,NULL),(1126,'Khenchela',4,NULL,NULL),(1127,'Ghardaïa',4,NULL,NULL),(1128,'Béjaïa',4,NULL,NULL),(1129,'El Bayadh',4,NULL,NULL),(1130,'Relizane',4,NULL,NULL),(1131,'Tizi Ouzou',4,NULL,NULL),(1132,'Mila',4,NULL,NULL),(1133,'Tissemsilt',4,NULL,NULL),(1134,'M\'Sila',4,NULL,NULL),(1135,'Tamanghasset',4,NULL,NULL),(1136,'Oum El Bouaghi',4,NULL,NULL),(1137,'Guelma',4,NULL,NULL),(1138,'Laghouat',4,NULL,NULL),(1139,'Ouargla',4,NULL,NULL),(1140,'Mostaganem',4,NULL,NULL),(1141,'Sétif',4,NULL,NULL),(1142,'Batna',4,NULL,NULL),(1143,'Souk Ahras',4,NULL,NULL),(1144,'Algiers',4,NULL,NULL),(1146,'Burgos Province',207,NULL,NULL),(1147,'Salamanca Province',207,NULL,NULL),(1157,'Palencia Province',207,NULL,NULL),(1158,'Madrid',207,NULL,NULL),(1159,'Melilla',207,NULL,NULL),(1160,'Asturias',207,NULL,NULL),(1161,'Zamora Province',207,NULL,NULL),(1167,'Galicia',207,NULL,NULL),(1170,'Cantabria',207,NULL,NULL),(1171,'La Rioja',207,NULL,NULL),(1174,'Balearic Islands',207,NULL,NULL),(1175,'Valencia',207,NULL,NULL),(1176,'Murcia',207,NULL,NULL),(1177,'Aragon',207,NULL,NULL),(1183,'Valladolid Province',207,NULL,NULL),(1184,'Castile and León',207,NULL,NULL),(1185,'Canary Islands',207,NULL,NULL),(1189,'Ávila',207,NULL,NULL),(1190,'Extremadura',207,NULL,NULL),(1191,'Basque Country',207,NULL,NULL),(1192,'Segovia Province',207,NULL,NULL),(1193,'Andalusia',207,NULL,NULL),(1200,'Léon',207,NULL,NULL),(1203,'Catalonia',207,NULL,NULL),(1204,'Navarra',207,NULL,NULL),(1205,'Castilla La Mancha',207,NULL,NULL),(1206,'Ceuta',207,NULL,NULL),(1208,'Soria Province',207,NULL,NULL),(1209,'Guanacaste Province',53,NULL,NULL),(1210,'Puntarenas Province',53,NULL,NULL),(1211,'Provincia de Cartago',53,NULL,NULL),(1212,'Heredia Province',53,NULL,NULL),(1213,'Limón Province',53,NULL,NULL),(1214,'San José Province',53,NULL,NULL),(1215,'Alajuela Province',53,NULL,NULL),(1216,'Brunei-Muara District',33,NULL,NULL),(1217,'Belait District',33,NULL,NULL),(1218,'Temburong District',33,NULL,NULL),(1219,'Tutong District',33,NULL,NULL),(1220,'Saint Philip',20,NULL,NULL),(1221,'Saint Lucy',20,NULL,NULL),(1222,'Saint Peter',20,NULL,NULL),(1223,'Saint Joseph',20,NULL,NULL),(1224,'Saint James',20,NULL,NULL),(1225,'Saint Thomas',20,NULL,NULL),(1226,'Saint George',20,NULL,NULL),(1227,'Saint John',20,NULL,NULL),(1228,'Christ Church',20,NULL,NULL),(1229,'Saint Andrew',20,NULL,NULL),(1230,'Saint Michael',20,NULL,NULL),(1231,'Ta\'izz Governorate',245,NULL,NULL),(1232,'Sana\'a',245,NULL,NULL),(1233,'Ibb Governorate',245,NULL,NULL),(1234,'Ma\'rib Governorate',245,NULL,NULL),(1235,'Al Mahwit Governorate',245,NULL,NULL),(1236,'Sana\'a Governorate',245,NULL,NULL),(1237,'Abyan Governorate',245,NULL,NULL),(1238,'Hadhramaut Governorate',245,NULL,NULL),(1239,'Socotra Governorate',245,NULL,NULL),(1240,'Al Bayda\' Governorate',245,NULL,NULL),(1241,'Al Hudaydah Governorate',245,NULL,NULL),(1242,'\'Adan Governorate',245,NULL,NULL),(1243,'Al Jawf Governorate',245,NULL,NULL),(1244,'Hajjah Governorate',245,NULL,NULL),(1245,'Lahij Governorate',245,NULL,NULL),(1246,'Dhamar Governorate',245,NULL,NULL),(1247,'Shabwah Governorate',245,NULL,NULL),(1248,'Raymah Governorate',245,NULL,NULL),(1249,'Saada Governorate',245,NULL,NULL),(1250,'\'Amran Governorate',245,NULL,NULL),(1251,'Al Mahrah Governorate',245,NULL,NULL),(1252,'Sangha-Mbaéré',42,NULL,NULL),(1253,'Nana-Grébizi Economic Prefecture',42,NULL,NULL),(1254,'Ouham Prefecture',42,NULL,NULL),(1255,'Ombella-M\'Poko Prefecture',42,NULL,NULL),(1256,'Lobaye Prefecture',42,NULL,NULL),(1257,'Mambéré-Kadéï',42,NULL,NULL),(1258,'Haut-Mbomou Prefecture',42,NULL,NULL),(1259,'Bamingui-Bangoran Prefecture',42,NULL,NULL),(1260,'Nana-Mambéré Prefecture',42,NULL,NULL),(1261,'Vakaga Prefecture',42,NULL,NULL),(1262,'Bangui',42,NULL,NULL),(1263,'Kémo Prefecture',42,NULL,NULL),(1264,'Basse-Kotto Prefecture',42,NULL,NULL),(1265,'Ouaka Prefecture',42,NULL,NULL),(1266,'Mbomou Prefecture',42,NULL,NULL),(1267,'Ouham-Pendé Prefecture',42,NULL,NULL),(1268,'Haute-Kotto Prefecture',42,NULL,NULL),(1269,'Romblon',174,NULL,NULL),(1270,'Bukidnon',174,NULL,NULL),(1271,'Rizal',174,NULL,NULL),(1272,'Bohol',174,NULL,NULL),(1273,'Quirino',174,NULL,NULL),(1274,'Biliran',174,NULL,NULL),(1275,'Quezon',174,NULL,NULL),(1276,'Siquijor',174,NULL,NULL),(1277,'Sarangani',174,NULL,NULL),(1278,'Bulacan',174,NULL,NULL),(1279,'Cagayan',174,NULL,NULL),(1280,'South Cotabato',174,NULL,NULL),(1281,'Sorsogon',174,NULL,NULL),(1282,'Sultan Kudarat',174,NULL,NULL),(1283,'Camarines Norte',174,NULL,NULL),(1284,'Southern Leyte',174,NULL,NULL),(1285,'Camiguin',174,NULL,NULL),(1286,'Surigao del Norte',174,NULL,NULL),(1287,'Camarines Sur',174,NULL,NULL),(1288,'Sulu',174,NULL,NULL),(1289,'Davao Oriental',174,NULL,NULL),(1290,'Eastern Samar',174,NULL,NULL),(1291,'Dinagat Islands',174,NULL,NULL),(1292,'Capiz',174,NULL,NULL),(1293,'Tawi-Tawi',174,NULL,NULL),(1294,'Calabarzon',174,NULL,NULL),(1295,'Tarlac',174,NULL,NULL),(1296,'Surigao del Sur',174,NULL,NULL),(1297,'Zambales',174,NULL,NULL),(1298,'Ilocos Norte',174,NULL,NULL),(1299,'Mimaropa',174,NULL,NULL),(1300,'Ifugao',174,NULL,NULL),(1301,'Catanduanes',174,NULL,NULL),(1302,'Zamboanga del Norte',174,NULL,NULL),(1303,'Guimaras',174,NULL,NULL),(1304,'Bicol Region',174,NULL,NULL),(1305,'Western Visayas',174,NULL,NULL),(1306,'Cebu',174,NULL,NULL),(1307,'Cavite',174,NULL,NULL),(1308,'Central Visayas',174,NULL,NULL),(1309,'Davao Occidental',174,NULL,NULL),(1310,'Soccsksargen',174,NULL,NULL),(1311,'Compostela Valley',174,NULL,NULL),(1312,'Kalinga',174,NULL,NULL),(1313,'Isabela',174,NULL,NULL),(1314,'Caraga',174,NULL,NULL),(1315,'Iloilo',174,NULL,NULL),(1316,'Autonomous Region in Muslim Mindanao',174,NULL,NULL),(1317,'La Union',174,NULL,NULL),(1318,'Davao del Sur',174,NULL,NULL),(1319,'Davao del Norte',174,NULL,NULL),(1320,'Cotabato',174,NULL,NULL),(1321,'Ilocos Sur',174,NULL,NULL),(1322,'Eastern Visayas',174,NULL,NULL),(1323,'Agusan del Norte',174,NULL,NULL),(1324,'Abra',174,NULL,NULL),(1325,'Zamboanga Peninsula',174,NULL,NULL),(1326,'Agusan del Sur',174,NULL,NULL),(1327,'Lanao del Norte',174,NULL,NULL),(1328,'Laguna',174,NULL,NULL),(1329,'Marinduque',174,NULL,NULL),(1330,'Maguindanao',174,NULL,NULL),(1331,'Aklan',174,NULL,NULL),(1332,'Leyte',174,NULL,NULL),(1333,'Lanao del Sur',174,NULL,NULL),(1334,'Apayao',174,NULL,NULL),(1335,'Cordillera Administrative Region',174,NULL,NULL),(1336,'Antique',174,NULL,NULL),(1337,'Albay',174,NULL,NULL),(1338,'Masbate',174,NULL,NULL),(1339,'Northern Mindanao',174,NULL,NULL),(1340,'Davao Region',174,NULL,NULL),(1341,'Aurora',174,NULL,NULL),(1342,'Cagayan Valley',174,NULL,NULL),(1343,'Misamis Occidental',174,NULL,NULL),(1344,'Bataan',174,NULL,NULL),(1345,'Central Luzon',174,NULL,NULL),(1346,'Basilan',174,NULL,NULL),(1347,'Metro Manila',174,NULL,NULL),(1348,'Misamis Oriental',174,NULL,NULL),(1349,'Northern Samar',174,NULL,NULL),(1350,'Negros Oriental',174,NULL,NULL),(1351,'Negros Occidental',174,NULL,NULL),(1352,'Batanes',174,NULL,NULL),(1353,'Mountain Province',174,NULL,NULL),(1354,'Oriental Mindoro',174,NULL,NULL),(1355,'Ilocos Region',174,NULL,NULL),(1356,'Occidental Mindoro',174,NULL,NULL),(1357,'Zamboanga del Sur',174,NULL,NULL),(1358,'Nueva Vizcaya',174,NULL,NULL),(1359,'Batangas',174,NULL,NULL),(1360,'Nueva Ecija',174,NULL,NULL),(1361,'Palawan',174,NULL,NULL),(1362,'Zamboanga Sibugay',174,NULL,NULL),(1363,'Benguet',174,NULL,NULL),(1364,'Pangasinan',174,NULL,NULL),(1365,'Pampanga',174,NULL,NULL),(1366,'Northern District',106,NULL,NULL),(1367,'Central District',106,NULL,NULL),(1368,'Southern District',106,NULL,NULL),(1369,'Haifa District',106,NULL,NULL),(1370,'Jerusalem District',106,NULL,NULL),(1371,'Tel Aviv District',106,NULL,NULL),(1372,'Limburg',22,NULL,NULL),(1373,'Flanders',22,NULL,NULL),(1374,'Flemish Brabant',22,NULL,NULL),(1375,'Hainaut',22,NULL,NULL),(1376,'Brussels-Capital Region',22,NULL,NULL),(1377,'East Flanders',22,NULL,NULL),(1378,'Namur',22,NULL,NULL),(1379,'Luxembourg',22,NULL,NULL),(1380,'Wallonia',22,NULL,NULL),(1381,'Antwerp',22,NULL,NULL),(1382,'Walloon Brabant',22,NULL,NULL),(1383,'West Flanders',22,NULL,NULL),(1384,'Liège',22,NULL,NULL),(1385,'Darién Province',170,NULL,NULL),(1386,'Colón Province',170,NULL,NULL),(1387,'Coclé Province',170,NULL,NULL),(1388,'Guna Yala',170,NULL,NULL),(1389,'Herrera Province',170,NULL,NULL),(1390,'Los Santos Province',170,NULL,NULL),(1391,'Ngöbe-Buglé Comarca',170,NULL,NULL),(1392,'Veraguas Province',170,NULL,NULL),(1393,'Bocas del Toro Province',170,NULL,NULL),(1394,'Panamá Oeste Province',170,NULL,NULL),(1395,'Panamá Province',170,NULL,NULL),(1396,'Emberá-Wounaan Comarca',170,NULL,NULL),(1397,'Chiriquí Province',170,NULL,NULL),(1398,'Howland Island',233,NULL,NULL),(1399,'Delaware',233,NULL,NULL),(1400,'Alaska',233,NULL,NULL),(1401,'Maryland',233,NULL,NULL),(1402,'Baker Island',233,NULL,NULL),(1403,'Kingman Reef',233,NULL,NULL),(1404,'New Hampshire',233,NULL,NULL),(1405,'Wake Island',233,NULL,NULL),(1406,'Kansas',233,NULL,NULL),(1407,'Texas',233,NULL,NULL),(1408,'Nebraska',233,NULL,NULL),(1409,'Vermont',233,NULL,NULL),(1410,'Jarvis Island',233,NULL,NULL),(1411,'Hawaii',233,NULL,NULL),(1412,'Guam',233,NULL,NULL),(1413,'United States Virgin Islands',233,NULL,NULL),(1414,'Utah',233,NULL,NULL),(1415,'Oregon',233,NULL,NULL),(1416,'California',233,NULL,NULL),(1417,'New Jersey',233,NULL,NULL),(1418,'North Dakota',233,NULL,NULL),(1419,'Kentucky',233,NULL,NULL),(1420,'Minnesota',233,NULL,NULL),(1421,'Oklahoma',233,NULL,NULL),(1422,'Pennsylvania',233,NULL,NULL),(1423,'New Mexico',233,NULL,NULL),(1424,'American Samoa',233,NULL,NULL),(1425,'Illinois',233,NULL,NULL),(1426,'Michigan',233,NULL,NULL),(1427,'Virginia',233,NULL,NULL),(1428,'Johnston Atoll',233,NULL,NULL),(1429,'West Virginia',233,NULL,NULL),(1430,'Mississippi',233,NULL,NULL),(1431,'Northern Mariana Islands',233,NULL,NULL),(1432,'United States Minor Outlying Islands',233,NULL,NULL),(1433,'Massachusetts',233,NULL,NULL),(1434,'Arizona',233,NULL,NULL),(1435,'Connecticut',233,NULL,NULL),(1436,'Florida',233,NULL,NULL),(1437,'District of Columbia',233,NULL,NULL),(1438,'Midway Atoll',233,NULL,NULL),(1439,'Navassa Island',233,NULL,NULL),(1440,'Indiana',233,NULL,NULL),(1441,'Wisconsin',233,NULL,NULL),(1442,'Wyoming',233,NULL,NULL),(1443,'South Carolina',233,NULL,NULL),(1444,'Arkansas',233,NULL,NULL),(1445,'South Dakota',233,NULL,NULL),(1446,'Montana',233,NULL,NULL),(1447,'North Carolina',233,NULL,NULL),(1448,'Palmyra Atoll',233,NULL,NULL),(1449,'Puerto Rico',233,NULL,NULL),(1450,'Colorado',233,NULL,NULL),(1451,'Missouri',233,NULL,NULL),(1452,'New York',233,NULL,NULL),(1453,'Maine',233,NULL,NULL),(1454,'Tennessee',233,NULL,NULL),(1455,'Georgia',233,NULL,NULL),(1456,'Alabama',233,NULL,NULL),(1457,'Louisiana',233,NULL,NULL),(1458,'Nevada',233,NULL,NULL),(1459,'Iowa',233,NULL,NULL),(1460,'Idaho',233,NULL,NULL),(1461,'Rhode Island',233,NULL,NULL),(1462,'Washington',233,NULL,NULL),(1463,'Shinyanga',218,NULL,NULL),(1464,'Simiyu',218,NULL,NULL),(1465,'Kagera',218,NULL,NULL),(1466,'Dodoma',218,NULL,NULL),(1467,'Kilimanjaro',218,NULL,NULL),(1468,'Mara',218,NULL,NULL),(1469,'Tabora',218,NULL,NULL),(1470,'Morogoro',218,NULL,NULL),(1471,'Zanzibar South',218,NULL,NULL),(1472,'Pemba South',218,NULL,NULL),(1473,'Zanzibar North',218,NULL,NULL),(1474,'Singida',218,NULL,NULL),(1475,'Zanzibar West',218,NULL,NULL),(1476,'Mtwara',218,NULL,NULL),(1477,'Rukwa',218,NULL,NULL),(1478,'Kigoma',218,NULL,NULL),(1479,'Mwanza',218,NULL,NULL),(1480,'Njombe',218,NULL,NULL),(1481,'Geita',218,NULL,NULL),(1482,'Katavi',218,NULL,NULL),(1483,'Lindi',218,NULL,NULL),(1484,'Manyara',218,NULL,NULL),(1485,'Pwani',218,NULL,NULL),(1486,'Ruvuma',218,NULL,NULL),(1487,'Tanga',218,NULL,NULL),(1488,'Pemba North',218,NULL,NULL),(1489,'Iringa',218,NULL,NULL),(1490,'Dar es Salaam',218,NULL,NULL),(1491,'Arusha',218,NULL,NULL),(1492,'Eastern Finland Province',74,NULL,NULL),(1493,'Tavastia Proper',74,NULL,NULL),(1494,'Central Ostrobothnia',74,NULL,NULL),(1495,'Southern Savonia',74,NULL,NULL),(1496,'Kainuu',74,NULL,NULL),(1497,'South Karelia',74,NULL,NULL),(1498,'Southern Ostrobothnia',74,NULL,NULL),(1499,'Oulu Province',74,NULL,NULL),(1500,'Lapland',74,NULL,NULL),(1501,'Satakunta',74,NULL,NULL),(1502,'Päijänne Tavastia',74,NULL,NULL),(1503,'Northern Savonia',74,NULL,NULL),(1504,'North Karelia',74,NULL,NULL),(1505,'Northern Ostrobothnia',74,NULL,NULL),(1506,'Pirkanmaa',74,NULL,NULL),(1507,'Finland Proper',74,NULL,NULL),(1508,'Ostrobothnia',74,NULL,NULL),(1509,'Åland Islands',74,NULL,NULL),(1510,'Uusimaa',74,NULL,NULL),(1511,'Central Finland',74,NULL,NULL),(1512,'Kymenlaakso',74,NULL,NULL),(1513,'Canton of Diekirch',127,NULL,NULL),(1514,'Luxembourg District',127,NULL,NULL),(1515,'Canton of Echternach',127,NULL,NULL),(1516,'Canton of Redange',127,NULL,NULL),(1517,'Canton of Esch-sur-Alzette',127,NULL,NULL),(1518,'Canton of Capellen',127,NULL,NULL),(1519,'Canton of Remich',127,NULL,NULL),(1520,'Grevenmacher District',127,NULL,NULL),(1521,'Canton of Clervaux',127,NULL,NULL),(1522,'Canton of Mersch',127,NULL,NULL),(1523,'Canton of Vianden',127,NULL,NULL),(1524,'Diekirch District',127,NULL,NULL),(1525,'Canton of Grevenmacher',127,NULL,NULL),(1526,'Canton of Wiltz',127,NULL,NULL),(1527,'Canton of Luxembourg',127,NULL,NULL),(1528,'Region Zealand',59,NULL,NULL),(1529,'Region of Southern Denmark',59,NULL,NULL),(1530,'Capital Region of Denmark',59,NULL,NULL),(1531,'Central Denmark Region',59,NULL,NULL),(1532,'North Denmark Region',59,NULL,NULL),(1533,'Gävleborg County',213,NULL,NULL),(1534,'Dalarna County',213,NULL,NULL),(1535,'Värmland County',213,NULL,NULL),(1536,'Östergötland County',213,NULL,NULL),(1537,'Blekinge',213,NULL,NULL),(1538,'Norrbotten County',213,NULL,NULL),(1539,'Örebro County',213,NULL,NULL),(1540,'Södermanland County',213,NULL,NULL),(1541,'Skåne County',213,NULL,NULL),(1542,'Kronoberg County',213,NULL,NULL),(1543,'Västerbotten County',213,NULL,NULL),(1544,'Kalmar County',213,NULL,NULL),(1545,'Uppsala County',213,NULL,NULL),(1546,'Gotland County',213,NULL,NULL),(1547,'Västra Götaland County',213,NULL,NULL),(1548,'Halland County',213,NULL,NULL),(1549,'Västmanland County',213,NULL,NULL),(1550,'Jönköping County',213,NULL,NULL),(1551,'Stockholm County',213,NULL,NULL),(1552,'Västernorrland County',213,NULL,NULL),(1553,'Plungė District Municipality',126,NULL,NULL),(1554,'Šiauliai District Municipality',126,NULL,NULL),(1555,'Jurbarkas District Municipality',126,NULL,NULL),(1556,'Kaunas County',126,NULL,NULL),(1557,'Mažeikiai District Municipality',126,NULL,NULL),(1558,'Panevėžys County',126,NULL,NULL),(1559,'Elektrėnai municipality',126,NULL,NULL),(1560,'Švenčionys District Municipality',126,NULL,NULL),(1561,'Akmenė District Municipality',126,NULL,NULL),(1562,'Ignalina District Municipality',126,NULL,NULL),(1563,'Neringa Municipality',126,NULL,NULL),(1564,'Visaginas Municipality',126,NULL,NULL),(1565,'Kaunas District Municipality',126,NULL,NULL),(1566,'Biržai District Municipality',126,NULL,NULL),(1567,'Jonava District Municipality',126,NULL,NULL),(1568,'Radviliškis District Municipality',126,NULL,NULL),(1569,'Telšiai County',126,NULL,NULL),(1570,'Marijampolė County',126,NULL,NULL),(1571,'Kretinga District Municipality',126,NULL,NULL),(1572,'Tauragė District Municipality',126,NULL,NULL),(1573,'Tauragė County',126,NULL,NULL),(1574,'Alytus County',126,NULL,NULL),(1575,'Kazlų Rūda municipality',126,NULL,NULL),(1576,'Šakiai District Municipality',126,NULL,NULL),(1577,'Šalčininkai District Municipality',126,NULL,NULL),(1578,'Prienai District Municipality',126,NULL,NULL),(1579,'Druskininkai municipality',126,NULL,NULL),(1580,'Kaunas City Municipality',126,NULL,NULL),(1581,'Joniškis District Municipality',126,NULL,NULL),(1582,'Molėtai District Municipality',126,NULL,NULL),(1583,'Kaišiadorys District Municipality',126,NULL,NULL),(1584,'Kėdainiai District Municipality',126,NULL,NULL),(1585,'Kupiškis District Municipality',126,NULL,NULL),(1586,'Šiauliai County',126,NULL,NULL),(1587,'Raseiniai District Municipality',126,NULL,NULL),(1588,'Palanga City Municipality',126,NULL,NULL),(1589,'Panevėžys City Municipality',126,NULL,NULL),(1590,'Rietavas municipality',126,NULL,NULL),(1591,'Kalvarija municipality',126,NULL,NULL),(1592,'Vilnius District Municipality',126,NULL,NULL),(1593,'Trakai District Municipality',126,NULL,NULL),(1594,'Širvintos District Municipality',126,NULL,NULL),(1595,'Pakruojis District Municipality',126,NULL,NULL),(1596,'Ukmergė District Municipality',126,NULL,NULL),(1597,'Klaipeda City Municipality',126,NULL,NULL),(1598,'Utena District Municipality',126,NULL,NULL),(1599,'Alytus District Municipality',126,NULL,NULL),(1600,'Klaipėda County',126,NULL,NULL),(1601,'Vilnius County',126,NULL,NULL),(1602,'Varėna District Municipality',126,NULL,NULL),(1603,'Birštonas Municipality',126,NULL,NULL),(1604,'Klaipėda District Municipality',126,NULL,NULL),(1605,'Alytus City Municipality',126,NULL,NULL),(1606,'Vilnius City Municipality',126,NULL,NULL),(1607,'Šilutė District Municipality',126,NULL,NULL),(1608,'Telšiai District Municipality',126,NULL,NULL),(1609,'Šiauliai City Municipality',126,NULL,NULL),(1610,'Marijampolė Municipality',126,NULL,NULL),(1611,'Lazdijai District Municipality',126,NULL,NULL),(1612,'Pagėgiai municipality',126,NULL,NULL),(1613,'Šilalė District Municipality',126,NULL,NULL),(1614,'Panevėžys District Municipality',126,NULL,NULL),(1615,'Rokiškis District Municipality',126,NULL,NULL),(1616,'Pasvalys District Municipality',126,NULL,NULL),(1617,'Skuodas District Municipality',126,NULL,NULL),(1618,'Kelmė District Municipality',126,NULL,NULL),(1619,'Zarasai District Municipality',126,NULL,NULL),(1620,'Vilkaviškis District Municipality',126,NULL,NULL),(1621,'Utena County',126,NULL,NULL),(1622,'Opole Voivodeship',176,NULL,NULL),(1623,'Silesian Voivodeship',176,NULL,NULL),(1624,'Pomeranian Voivodeship',176,NULL,NULL),(1625,'Kuyavian-Pomeranian Voivodeship',176,NULL,NULL),(1626,'Podkarpackie Voivodeship',176,NULL,NULL),(1628,'Warmian-Masurian Voivodeship',176,NULL,NULL),(1629,'Lower Silesian Voivodeship',176,NULL,NULL),(1630,'Świętokrzyskie Voivodeship',176,NULL,NULL),(1631,'Lubusz Voivodeship',176,NULL,NULL),(1632,'Podlaskie Voivodeship',176,NULL,NULL),(1633,'West Pomeranian Voivodeship',176,NULL,NULL),(1634,'Greater Poland Voivodeship',176,NULL,NULL),(1635,'Lesser Poland Voivodeship',176,NULL,NULL),(1636,'Łódź Voivodeship',176,NULL,NULL),(1637,'Masovian Voivodeship',176,NULL,NULL),(1638,'Lublin Voivodeship',176,NULL,NULL),(1639,'Aargau',214,NULL,NULL),(1640,'Fribourg',214,NULL,NULL),(1641,'Basel-Land',214,NULL,NULL),(1642,'Uri',214,NULL,NULL),(1643,'Ticino',214,NULL,NULL),(1644,'St. Gallen',214,NULL,NULL),(1645,'Bern',214,NULL,NULL),(1646,'Zug',214,NULL,NULL),(1647,'Geneva',214,NULL,NULL),(1648,'Valais',214,NULL,NULL),(1649,'Appenzell Innerrhoden',214,NULL,NULL),(1650,'Obwalden',214,NULL,NULL),(1651,'Vaud',214,NULL,NULL),(1652,'Nidwalden',214,NULL,NULL),(1653,'Schwyz',214,NULL,NULL),(1654,'Schaffhausen',214,NULL,NULL),(1655,'Appenzell Ausserrhoden',214,NULL,NULL),(1656,'Zürich',214,NULL,NULL),(1657,'Thurgau',214,NULL,NULL),(1658,'Jura',214,NULL,NULL),(1659,'Neuchâtel',214,NULL,NULL),(1660,'Graubünden',214,NULL,NULL),(1661,'Glarus',214,NULL,NULL),(1662,'Solothurn',214,NULL,NULL),(1663,'Lucerne',214,NULL,NULL),(1664,'Tuscany',107,NULL,NULL),(1665,'Padua',107,NULL,NULL),(1666,'Parma',107,NULL,NULL),(1667,'Siracusa',107,NULL,NULL),(1668,'Palermo',107,NULL,NULL),(1669,'Campania',107,NULL,NULL),(1670,'Marche',107,NULL,NULL),(1671,'Reggio Calabria',107,NULL,NULL),(1672,'Ancona',107,NULL,NULL),(1673,'Venice',107,NULL,NULL),(1674,'Latina',107,NULL,NULL),(1675,'Lecce',107,NULL,NULL),(1676,'Pavia',107,NULL,NULL),(1677,'Lecco',107,NULL,NULL),(1678,'Lazio',107,NULL,NULL),(1679,'Abruzzo',107,NULL,NULL),(1680,'Florence',107,NULL,NULL),(1681,'Ascoli Piceno',107,NULL,NULL),(1682,'Cagliari',107,NULL,NULL),(1683,'Umbria',107,NULL,NULL),(1684,'Bologna',107,NULL,NULL),(1685,'Pisa',107,NULL,NULL),(1686,'Barletta-Andria-Trani',107,NULL,NULL),(1687,'Pistoia',107,NULL,NULL),(1688,'Apulia',107,NULL,NULL),(1689,'Belluno',107,NULL,NULL),(1690,'Pordenone',107,NULL,NULL),(1691,'Perugia',107,NULL,NULL),(1692,'Avellino',107,NULL,NULL),(1693,'Pesaro and Urbino',107,NULL,NULL),(1694,'Pescara',107,NULL,NULL),(1695,'Molise',107,NULL,NULL),(1696,'Piacenza',107,NULL,NULL),(1697,'Potenza',107,NULL,NULL),(1698,'Milan',107,NULL,NULL),(1699,'Genoa',107,NULL,NULL),(1700,'Prato',107,NULL,NULL),(1701,'Benevento',107,NULL,NULL),(1702,'Piedmont',107,NULL,NULL),(1703,'Calabria',107,NULL,NULL),(1704,'Bergamo',107,NULL,NULL),(1705,'Lombardy',107,NULL,NULL),(1706,'Basilicata',107,NULL,NULL),(1707,'Ravenna',107,NULL,NULL),(1708,'Reggio Emilia',107,NULL,NULL),(1709,'Sicily',107,NULL,NULL),(1710,'Turin',107,NULL,NULL),(1711,'Rome',107,NULL,NULL),(1712,'Rieti',107,NULL,NULL),(1713,'Rimini',107,NULL,NULL),(1714,'Brindisi',107,NULL,NULL),(1715,'Sardinia',107,NULL,NULL),(1716,'Aosta Valley',107,NULL,NULL),(1717,'Brescia',107,NULL,NULL),(1718,'Caltanissetta',107,NULL,NULL),(1719,'Rovigo',107,NULL,NULL),(1720,'Salerno',107,NULL,NULL),(1721,'Campobasso',107,NULL,NULL),(1722,'Sassari',107,NULL,NULL),(1723,'Enna',107,NULL,NULL),(1724,'Naples',107,NULL,NULL),(1725,'Trentino-South Tyrol',107,NULL,NULL),(1726,'Verbano-Cusio-Ossola',107,NULL,NULL),(1727,'Agrigento',107,NULL,NULL),(1728,'Catanzaro',107,NULL,NULL),(1729,'Ragusa',107,NULL,NULL),(1730,'South Sardinia',107,NULL,NULL),(1731,'Caserta',107,NULL,NULL),(1732,'Savona',107,NULL,NULL),(1733,'Trapani',107,NULL,NULL),(1734,'Siena',107,NULL,NULL),(1735,'Viterbo',107,NULL,NULL),(1736,'Verona',107,NULL,NULL),(1737,'Vibo Valentia',107,NULL,NULL),(1738,'Vicenza',107,NULL,NULL),(1739,'Chieti',107,NULL,NULL),(1740,'Como',107,NULL,NULL),(1741,'Sondrio',107,NULL,NULL),(1742,'Cosenza',107,NULL,NULL),(1743,'Taranto',107,NULL,NULL),(1744,'Fermo',107,NULL,NULL),(1745,'Livorno',107,NULL,NULL),(1746,'Ferrara',107,NULL,NULL),(1747,'Lodi',107,NULL,NULL),(1748,'Trentino',107,NULL,NULL),(1749,'Lucca',107,NULL,NULL),(1750,'Macerata',107,NULL,NULL),(1751,'Cremona',107,NULL,NULL),(1752,'Teramo',107,NULL,NULL),(1753,'Veneto',107,NULL,NULL),(1754,'Crotone',107,NULL,NULL),(1755,'Terni',107,NULL,NULL),(1756,'Friuli–Venezia Giulia',107,NULL,NULL),(1757,'Modena',107,NULL,NULL),(1758,'Mantua',107,NULL,NULL),(1759,'Massa and Carrara',107,NULL,NULL),(1760,'Matera',107,NULL,NULL),(1761,'Medio Campidano',107,NULL,NULL),(1762,'Treviso',107,NULL,NULL),(1763,'Trieste',107,NULL,NULL),(1764,'Udine',107,NULL,NULL),(1765,'Varese',107,NULL,NULL),(1766,'Catania',107,NULL,NULL),(1767,'South Tyrol',107,NULL,NULL),(1768,'Liguria',107,NULL,NULL),(1769,'Monza and Brianza',107,NULL,NULL),(1770,'Messina',107,NULL,NULL),(1771,'Foggia',107,NULL,NULL),(1772,'Bari',107,NULL,NULL),(1773,'Emilia-Romagna',107,NULL,NULL),(1774,'Novara',107,NULL,NULL),(1775,'Cuneo',107,NULL,NULL),(1776,'Frosinone',107,NULL,NULL),(1777,'Gorizia',107,NULL,NULL),(1778,'Biella',107,NULL,NULL),(1779,'Forlì-Cesena',107,NULL,NULL),(1780,'Asti',107,NULL,NULL),(1781,'L\'Aquila',107,NULL,NULL),(1783,'Alessandria',107,NULL,NULL),(1785,'Vercelli',107,NULL,NULL),(1786,'Oristano',107,NULL,NULL),(1787,'Grosseto',107,NULL,NULL),(1788,'Imperia',107,NULL,NULL),(1789,'Isernia',107,NULL,NULL),(1790,'Nuoro',107,NULL,NULL),(1791,'La Spezia',107,NULL,NULL),(1792,'Sumatera Utara',102,NULL,NULL),(1793,'Bengkulu',102,NULL,NULL),(1794,'Kalimantan Tengah',102,NULL,NULL),(1795,'Sulawesi Selatan',102,NULL,NULL),(1796,'Sulawesi Tenggara',102,NULL,NULL),(1798,'Papua',102,NULL,NULL),(1799,'Papua Barat',102,NULL,NULL),(1800,'Maluku',102,NULL,NULL),(1801,'Maluku Utara',102,NULL,NULL),(1802,'Jawa Tengah',102,NULL,NULL),(1804,'Kalimantan Timur',102,NULL,NULL),(1805,'DKI Jakarta',102,NULL,NULL),(1806,'Kalimantan Barat',102,NULL,NULL),(1807,'Kepulauan Riau',102,NULL,NULL),(1808,'Sulawesi Utara',102,NULL,NULL),(1809,'Riau',102,NULL,NULL),(1810,'Banten',102,NULL,NULL),(1811,'Lampung',102,NULL,NULL),(1812,'Gorontalo',102,NULL,NULL),(1813,'Sulawesi Tengah',102,NULL,NULL),(1814,'Nusa Tenggara Barat',102,NULL,NULL),(1815,'Jambi',102,NULL,NULL),(1816,'Sumatera Selatan',102,NULL,NULL),(1817,'Sulawesi Barat',102,NULL,NULL),(1818,'Nusa Tenggara Timur',102,NULL,NULL),(1819,'Kalimantan Selatan',102,NULL,NULL),(1820,'Kepulauan Bangka Belitung',102,NULL,NULL),(1822,'Aceh',102,NULL,NULL),(1824,'Kalimantan Utara',102,NULL,NULL),(1825,'Jawa Barat',102,NULL,NULL),(1826,'Bali',102,NULL,NULL),(1827,'Jawa Timur',102,NULL,NULL),(1828,'Sumatera Barat',102,NULL,NULL),(1829,'DI Yogyakarta',102,NULL,NULL),(1830,'Phoenix Islands',114,NULL,NULL),(1831,'Gilbert Islands',114,NULL,NULL),(1832,'Line Islands',114,NULL,NULL),(1833,'Primorsky Krai',182,NULL,NULL),(1834,'Novgorod Oblast',182,NULL,NULL),(1835,'Jewish Autonomous Oblast',182,NULL,NULL),(1836,'Nenets Autonomous Okrug',182,NULL,NULL),(1837,'Rostov Oblast',182,NULL,NULL),(1838,'Khanty-Mansi Autonomous Okrug',182,NULL,NULL),(1839,'Magadan Oblast',182,NULL,NULL),(1840,'Krasnoyarsk Krai',182,NULL,NULL),(1841,'Republic of Karelia',182,NULL,NULL),(1842,'Republic of Buryatia',182,NULL,NULL),(1843,'Murmansk Oblast',182,NULL,NULL),(1844,'Kaluga Oblast',182,NULL,NULL),(1845,'Chelyabinsk Oblast',182,NULL,NULL),(1846,'Omsk Oblast',182,NULL,NULL),(1847,'Yamalo-Nenets Autonomous Okrug',182,NULL,NULL),(1848,'Sakha Republic',182,NULL,NULL),(1849,'Arkhangelsk',182,NULL,NULL),(1850,'Republic of Dagestan',182,NULL,NULL),(1851,'Yaroslavl Oblast',182,NULL,NULL),(1852,'Republic of Adygea',182,NULL,NULL),(1853,'Republic of North Ossetia-Alania',182,NULL,NULL),(1854,'Republic of Bashkortostan',182,NULL,NULL),(1855,'Kursk Oblast',182,NULL,NULL),(1856,'Ulyanovsk Oblast',182,NULL,NULL),(1857,'Nizhny Novgorod Oblast',182,NULL,NULL),(1858,'Amur Oblast',182,NULL,NULL),(1859,'Chukotka Autonomous Okrug',182,NULL,NULL),(1860,'Tver Oblast',182,NULL,NULL),(1861,'Republic of Tatarstan',182,NULL,NULL),(1862,'Samara Oblast',182,NULL,NULL),(1863,'Pskov Oblast',182,NULL,NULL),(1864,'Ivanovo Oblast',182,NULL,NULL),(1865,'Kamchatka Krai',182,NULL,NULL),(1866,'Astrakhan Oblast',182,NULL,NULL),(1867,'Bryansk Oblast',182,NULL,NULL),(1868,'Stavropol Krai',182,NULL,NULL),(1869,'Karachay-Cherkess Republic',182,NULL,NULL),(1870,'Mari El Republic',182,NULL,NULL),(1871,'Perm Krai',182,NULL,NULL),(1872,'Tomsk Oblast',182,NULL,NULL),(1873,'Khabarovsk Krai',182,NULL,NULL),(1874,'Vologda Oblast',182,NULL,NULL),(1875,'Sakhalin',182,NULL,NULL),(1876,'Altai Republic',182,NULL,NULL),(1877,'Republic of Khakassia',182,NULL,NULL),(1878,'Tambov Oblast',182,NULL,NULL),(1879,'Saint Petersburg',182,NULL,NULL),(1880,'Irkutsk',182,NULL,NULL),(1881,'Vladimir Oblast',182,NULL,NULL),(1882,'Moscow Oblast',182,NULL,NULL),(1883,'Republic of Kalmykia',182,NULL,NULL),(1884,'Republic of Ingushetia',182,NULL,NULL),(1885,'Smolensk Oblast',182,NULL,NULL),(1886,'Orenburg Oblast',182,NULL,NULL),(1887,'Saratov Oblast',182,NULL,NULL),(1888,'Novosibirsk',182,NULL,NULL),(1889,'Lipetsk Oblast',182,NULL,NULL),(1890,'Kirov Oblast',182,NULL,NULL),(1891,'Krasnodar Krai',182,NULL,NULL),(1892,'Kabardino-Balkar Republic',182,NULL,NULL),(1893,'Chechen Republic',182,NULL,NULL),(1894,'Sverdlovsk',182,NULL,NULL),(1895,'Tula Oblast',182,NULL,NULL),(1896,'Leningrad Oblast',182,NULL,NULL),(1897,'Kemerovo Oblast',182,NULL,NULL),(1898,'Republic of Mordovia',182,NULL,NULL),(1899,'Komi Republic',182,NULL,NULL),(1900,'Tuva Republic',182,NULL,NULL),(1901,'Moscow',182,NULL,NULL),(1902,'Kaliningrad',182,NULL,NULL),(1903,'Belgorod Oblast',182,NULL,NULL),(1904,'Zabaykalsky Krai',182,NULL,NULL),(1905,'Ryazan Oblast',182,NULL,NULL),(1906,'Voronezh Oblast',182,NULL,NULL),(1907,'Tyumen Oblast',182,NULL,NULL),(1908,'Oryol Oblast',182,NULL,NULL),(1909,'Penza Oblast',182,NULL,NULL),(1910,'Kostroma Oblast',182,NULL,NULL),(1911,'Altai Krai',182,NULL,NULL),(1912,'Sevastopol',182,NULL,NULL),(1913,'Udmurt Republic',182,NULL,NULL),(1914,'Chuvash Republic',182,NULL,NULL),(1915,'Kurgan Oblast',182,NULL,NULL),(1916,'Lomaiviti',73,NULL,NULL),(1917,'Ba',73,NULL,NULL),(1918,'Tailevu',73,NULL,NULL),(1919,'Nadroga-Navosa',73,NULL,NULL),(1920,'Rewa',73,NULL,NULL),(1921,'Northern Division',73,NULL,NULL),(1922,'Macuata',73,NULL,NULL),(1923,'Western Division',73,NULL,NULL),(1924,'Cakaudrove',73,NULL,NULL),(1925,'Serua',73,NULL,NULL),(1926,'Ra',73,NULL,NULL),(1927,'Naitasiri',73,NULL,NULL),(1928,'Namosi',73,NULL,NULL),(1929,'Central Division',73,NULL,NULL),(1930,'Bua',73,NULL,NULL),(1931,'Rotuma',73,NULL,NULL),(1932,'Eastern Division',73,NULL,NULL),(1933,'Lau',73,NULL,NULL),(1934,'Kadavu',73,NULL,NULL),(1935,'Labuan',132,NULL,NULL),(1936,'Sabah',132,NULL,NULL),(1937,'Sarawak',132,NULL,NULL),(1938,'Perlis',132,NULL,NULL),(1939,'Penang',132,NULL,NULL),(1940,'Pahang',132,NULL,NULL),(1941,'Malacca',132,NULL,NULL),(1942,'Terengganu',132,NULL,NULL),(1943,'Perak',132,NULL,NULL),(1944,'Selangor',132,NULL,NULL),(1945,'Putrajaya',132,NULL,NULL),(1946,'Kelantan',132,NULL,NULL),(1947,'Kedah',132,NULL,NULL),(1948,'Negeri Sembilan',132,NULL,NULL),(1949,'Kuala Lumpur',132,NULL,NULL),(1950,'Johor',132,NULL,NULL),(1951,'Mashonaland East Province',247,NULL,NULL),(1952,'Matabeleland South Province',247,NULL,NULL),(1953,'Mashonaland West Province',247,NULL,NULL),(1954,'Matabeleland North Province',247,NULL,NULL),(1955,'Mashonaland Central Province',247,NULL,NULL),(1956,'Bulawayo Province',247,NULL,NULL),(1957,'Midlands Province',247,NULL,NULL),(1958,'Harare Province',247,NULL,NULL),(1959,'Manicaland',247,NULL,NULL),(1960,'Masvingo Province',247,NULL,NULL),(1961,'Bulgan Province',146,NULL,NULL),(1962,'Darkhan-Uul Province',146,NULL,NULL),(1963,'Dornod Province',146,NULL,NULL),(1964,'Khovd Province',146,NULL,NULL),(1965,'Övörkhangai Province',146,NULL,NULL),(1966,'Orkhon Province',146,NULL,NULL),(1967,'Ömnögovi Province',146,NULL,NULL),(1968,'Töv Province',146,NULL,NULL),(1969,'Bayan-Ölgii Province',146,NULL,NULL),(1970,'Dundgovi Province',146,NULL,NULL),(1971,'Uvs Province',146,NULL,NULL),(1972,'Govi-Altai Province',146,NULL,NULL),(1973,'Arkhangai Province',146,NULL,NULL),(1974,'Khentii Province',146,NULL,NULL),(1975,'Khövsgöl Province',146,NULL,NULL),(1976,'Bayankhongor Province',146,NULL,NULL),(1977,'Sükhbaatar Province',146,NULL,NULL),(1978,'Govisümber Province',146,NULL,NULL),(1979,'Zavkhan Province',146,NULL,NULL),(1980,'Selenge Province',146,NULL,NULL),(1981,'Dornogovi Province',146,NULL,NULL),(1982,'Northern Province',246,NULL,NULL),(1983,'Western Province',246,NULL,NULL),(1984,'Copperbelt Province',246,NULL,NULL),(1985,'Northwestern Province',246,NULL,NULL),(1986,'Central Province',246,NULL,NULL),(1987,'Luapula Province',246,NULL,NULL),(1988,'Lusaka Province',246,NULL,NULL),(1989,'Muchinga Province',246,NULL,NULL),(1990,'Southern Province',246,NULL,NULL),(1991,'Eastern Province',246,NULL,NULL),(1992,'Capital Governorate',18,NULL,NULL),(1993,'Southern Governorate',18,NULL,NULL),(1994,'Northern Governorate',18,NULL,NULL),(1995,'Muharraq Governorate',18,NULL,NULL),(1996,'Central Governorate',18,NULL,NULL),(1997,'Rio de Janeiro',31,NULL,NULL),(1998,'Minas Gerais',31,NULL,NULL),(1999,'Amapá',31,NULL,NULL),(2000,'Goiás',31,NULL,NULL),(2001,'Rio Grande do Sul',31,NULL,NULL),(2002,'Bahia',31,NULL,NULL),(2003,'Sergipe',31,NULL,NULL),(2004,'Amazonas',31,NULL,NULL),(2005,'Paraíba',31,NULL,NULL),(2006,'Pernambuco',31,NULL,NULL),(2007,'Alagoas',31,NULL,NULL),(2008,'Piauí',31,NULL,NULL),(2009,'Pará',31,NULL,NULL),(2010,'Mato Grosso do Sul',31,NULL,NULL),(2011,'Mato Grosso',31,NULL,NULL),(2012,'Acre',31,NULL,NULL),(2013,'Rondônia',31,NULL,NULL),(2014,'Santa Catarina',31,NULL,NULL),(2015,'Maranhão',31,NULL,NULL),(2016,'Ceará',31,NULL,NULL),(2017,'Distrito Federal',31,NULL,NULL),(2018,'Espírito Santo',31,NULL,NULL),(2019,'Rio Grande do Norte',31,NULL,NULL),(2020,'Tocantins',31,NULL,NULL),(2021,'São Paulo',31,NULL,NULL),(2022,'Paraná',31,NULL,NULL),(2023,'Aragatsotn Region',12,NULL,NULL),(2024,'Ararat Province',12,NULL,NULL),(2025,'Vayots Dzor Region',12,NULL,NULL),(2026,'Armavir Region',12,NULL,NULL),(2027,'Syunik Province',12,NULL,NULL),(2028,'Gegharkunik Province',12,NULL,NULL),(2029,'Lori Region',12,NULL,NULL),(2030,'Yerevan',12,NULL,NULL),(2031,'Shirak Region',12,NULL,NULL),(2032,'Tavush Region',12,NULL,NULL),(2033,'Kotayk Region',12,NULL,NULL),(2034,'Cojedes',239,NULL,NULL),(2035,'Falcón',239,NULL,NULL),(2036,'Portuguesa',239,NULL,NULL),(2037,'Miranda',239,NULL,NULL),(2038,'Lara',239,NULL,NULL),(2039,'Bolívar',239,NULL,NULL),(2040,'Carabobo',239,NULL,NULL),(2041,'Yaracuy',239,NULL,NULL),(2042,'Zulia',239,NULL,NULL),(2043,'Trujillo',239,NULL,NULL),(2044,'Amazonas',239,NULL,NULL),(2045,'Guárico',239,NULL,NULL),(2046,'Federal Dependencies of Venezuela',239,NULL,NULL),(2047,'Aragua',239,NULL,NULL),(2048,'Táchira',239,NULL,NULL),(2049,'Barinas',239,NULL,NULL),(2050,'Anzoátegui',239,NULL,NULL),(2051,'Delta Amacuro',239,NULL,NULL),(2052,'Nueva Esparta',239,NULL,NULL),(2053,'Mérida',239,NULL,NULL),(2054,'Monagas',239,NULL,NULL),(2055,'La Guaira',239,NULL,NULL),(2056,'Sucre',239,NULL,NULL),(2057,'Carinthia',15,NULL,NULL),(2058,'Upper Austria',15,NULL,NULL),(2059,'Styria',15,NULL,NULL),(2060,'Vienna',15,NULL,NULL),(2061,'Salzburg',15,NULL,NULL),(2062,'Burgenland',15,NULL,NULL),(2063,'Vorarlberg',15,NULL,NULL),(2064,'Tyrol',15,NULL,NULL),(2065,'Lower Austria',15,NULL,NULL),(2066,'Mid-Western Region',154,NULL,NULL),(2067,'Western Region',154,NULL,NULL),(2068,'Far-Western Development Region',154,NULL,NULL),(2069,'Eastern Development Region',154,NULL,NULL),(2070,'Mechi Zone',154,NULL,NULL),(2071,'Bheri Zone',154,NULL,NULL),(2072,'Kosi Zone',154,NULL,NULL),(2073,'Central Region',154,NULL,NULL),(2074,'Lumbini Zone',154,NULL,NULL),(2075,'Narayani Zone',154,NULL,NULL),(2076,'Janakpur Zone',154,NULL,NULL),(2077,'Rapti Zone',154,NULL,NULL),(2078,'Seti Zone',154,NULL,NULL),(2079,'Karnali Zone',154,NULL,NULL),(2080,'Dhaulagiri Zone',154,NULL,NULL),(2081,'Gandaki Zone',154,NULL,NULL),(2082,'Bagmati Zone',154,NULL,NULL),(2083,'Mahakali Zone',154,NULL,NULL),(2084,'Sagarmatha Zone',154,NULL,NULL),(2085,'Unity',206,NULL,NULL),(2086,'Upper Nile',206,NULL,NULL),(2087,'Warrap',206,NULL,NULL),(2088,'Northern Bahr el Ghazal',206,NULL,NULL),(2089,'Western Equatoria',206,NULL,NULL),(2090,'Lakes',206,NULL,NULL),(2091,'Western Bahr el Ghazal',206,NULL,NULL),(2092,'Central Equatoria',206,NULL,NULL),(2093,'Eastern Equatoria',206,NULL,NULL),(2094,'Jonglei State',206,NULL,NULL),(2095,'Karditsa Regional Unit',85,NULL,NULL),(2096,'West Greece Region',85,NULL,NULL),(2097,'Thessaloniki Regional Unit',85,NULL,NULL),(2098,'Arcadia Prefecture',85,NULL,NULL),(2099,'Imathia Regional Unit',85,NULL,NULL),(2100,'Kastoria Regional Unit',85,NULL,NULL),(2101,'Euboea',85,NULL,NULL),(2102,'Grevena Prefecture',85,NULL,NULL),(2103,'Preveza Prefecture',85,NULL,NULL),(2104,'Lefkada Regional Unit',85,NULL,NULL),(2105,'Argolis Regional Unit',85,NULL,NULL),(2106,'Laconia',85,NULL,NULL),(2107,'Pella Regional Unit',85,NULL,NULL),(2108,'West Macedonia Region',85,NULL,NULL),(2109,'Crete Region',85,NULL,NULL),(2110,'Epirus Region',85,NULL,NULL),(2111,'Kilkis Regional Unit',85,NULL,NULL),(2112,'Kozani Prefecture',85,NULL,NULL),(2113,'Ioannina Regional Unit',85,NULL,NULL),(2114,'Phthiotis Prefecture',85,NULL,NULL),(2115,'Chania Regional Unit',85,NULL,NULL),(2116,'Achaea Regional Unit',85,NULL,NULL),(2117,'East Macedonia and Thrace',85,NULL,NULL),(2118,'South Aegean',85,NULL,NULL),(2119,'Peloponnese Region',85,NULL,NULL),(2120,'East Attica Regional Unit',85,NULL,NULL),(2121,'Serres Prefecture',85,NULL,NULL),(2122,'Attica Region',85,NULL,NULL),(2123,'Aetolia-Acarnania Regional Unit',85,NULL,NULL),(2124,'Corfu Prefecture',85,NULL,NULL),(2125,'Central Macedonia',85,NULL,NULL),(2126,'Boeotia Regional Unit',85,NULL,NULL),(2127,'Kefalonia Prefecture',85,NULL,NULL),(2128,'Central Greece Region',85,NULL,NULL),(2129,'Corinthia Regional Unit',85,NULL,NULL),(2130,'Drama Regional Unit',85,NULL,NULL),(2131,'Ionian Islands Region',85,NULL,NULL),(2132,'Larissa Prefecture',85,NULL,NULL),(2133,'Kayin State',151,NULL,NULL),(2134,'Mandalay Region',151,NULL,NULL),(2135,'Yangon Region',151,NULL,NULL),(2136,'Magway Region',151,NULL,NULL),(2137,'Chin State',151,NULL,NULL),(2138,'Rakhine State',151,NULL,NULL),(2139,'Shan State',151,NULL,NULL),(2140,'Tanintharyi Region',151,NULL,NULL),(2141,'Bago',151,NULL,NULL),(2142,'Ayeyarwady Region',151,NULL,NULL),(2143,'Kachin State',151,NULL,NULL),(2144,'Kayah State',151,NULL,NULL),(2145,'Sagaing Region',151,NULL,NULL),(2146,'Naypyidaw Union Territory',151,NULL,NULL),(2147,'Mon State',151,NULL,NULL),(2148,'Bartın',225,NULL,NULL),(2149,'Kütahya',225,NULL,NULL),(2150,'Sakarya',225,NULL,NULL),(2151,'Edirne',225,NULL,NULL),(2152,'Van',225,NULL,NULL),(2153,'Bingöl',225,NULL,NULL),(2154,'Kilis',225,NULL,NULL),(2155,'Adıyaman',225,NULL,NULL),(2156,'Mersin',225,NULL,NULL),(2157,'Denizli',225,NULL,NULL),(2158,'Malatya',225,NULL,NULL),(2159,'Elazığ',225,NULL,NULL),(2160,'Erzincan',225,NULL,NULL),(2161,'Amasya',225,NULL,NULL),(2162,'Muş',225,NULL,NULL),(2163,'Bursa',225,NULL,NULL),(2164,'Eskişehir',225,NULL,NULL),(2165,'Erzurum',225,NULL,NULL),(2166,'Iğdır',225,NULL,NULL),(2167,'Tekirdağ',225,NULL,NULL),(2168,'Çankırı',225,NULL,NULL),(2169,'Antalya',225,NULL,NULL),(2170,'Istanbul',225,NULL,NULL),(2171,'Konya',225,NULL,NULL),(2172,'Bolu',225,NULL,NULL),(2173,'Çorum',225,NULL,NULL),(2174,'Ordu',225,NULL,NULL),(2175,'Balıkesir',225,NULL,NULL),(2176,'Kırklareli',225,NULL,NULL),(2177,'Bayburt',225,NULL,NULL),(2178,'Kırıkkale',225,NULL,NULL),(2179,'Afyonkarahisar',225,NULL,NULL),(2180,'Kırşehir',225,NULL,NULL),(2181,'Sivas',225,NULL,NULL),(2182,'Muğla',225,NULL,NULL),(2183,'Şanlıurfa',225,NULL,NULL),(2184,'Karaman',225,NULL,NULL),(2185,'Ardahan',225,NULL,NULL),(2186,'Giresun',225,NULL,NULL),(2187,'Aydın',225,NULL,NULL),(2188,'Yozgat',225,NULL,NULL),(2189,'Niğde',225,NULL,NULL),(2190,'Hakkâri',225,NULL,NULL),(2191,'Artvin',225,NULL,NULL),(2192,'Tunceli',225,NULL,NULL),(2193,'Ağrı',225,NULL,NULL),(2194,'Batman',225,NULL,NULL),(2195,'Kocaeli',225,NULL,NULL),(2196,'Nevşehir',225,NULL,NULL),(2197,'Kastamonu',225,NULL,NULL),(2198,'Manisa',225,NULL,NULL),(2199,'Tokat',225,NULL,NULL),(2200,'Kayseri',225,NULL,NULL),(2201,'Uşak',225,NULL,NULL),(2202,'Düzce',225,NULL,NULL),(2203,'Gaziantep',225,NULL,NULL),(2204,'Gümüşhane',225,NULL,NULL),(2205,'İzmir',225,NULL,NULL),(2206,'Trabzon',225,NULL,NULL),(2207,'Siirt',225,NULL,NULL),(2208,'Kars',225,NULL,NULL),(2209,'Burdur',225,NULL,NULL),(2210,'Aksaray',225,NULL,NULL),(2211,'Hatay',225,NULL,NULL),(2212,'Adana',225,NULL,NULL),(2213,'Zonguldak',225,NULL,NULL),(2214,'Osmaniye',225,NULL,NULL),(2215,'Bitlis',225,NULL,NULL),(2216,'Çanakkale',225,NULL,NULL),(2217,'Ankara',225,NULL,NULL),(2218,'Yalova',225,NULL,NULL),(2219,'Rize',225,NULL,NULL),(2220,'Samsun',225,NULL,NULL),(2221,'Bilecik',225,NULL,NULL),(2222,'Isparta',225,NULL,NULL),(2223,'Karabük',225,NULL,NULL),(2224,'Mardin',225,NULL,NULL),(2225,'Şırnak',225,NULL,NULL),(2226,'Diyarbakır',225,NULL,NULL),(2227,'Kahramanmaraş',225,NULL,NULL),(2228,'Lisbon',177,NULL,NULL),(2229,'Bragança',177,NULL,NULL),(2230,'Beja',177,NULL,NULL),(2231,'Madeira',177,NULL,NULL),(2232,'Portalegre',177,NULL,NULL),(2233,'Açores',177,NULL,NULL),(2234,'Vila Real',177,NULL,NULL),(2235,'Aveiro',177,NULL,NULL),(2236,'Évora',177,NULL,NULL),(2237,'Viseu',177,NULL,NULL),(2238,'Santarém',177,NULL,NULL),(2239,'Faro',177,NULL,NULL),(2240,'Leiria',177,NULL,NULL),(2241,'Castelo Branco',177,NULL,NULL),(2242,'Setúbal',177,NULL,NULL),(2243,'Porto',177,NULL,NULL),(2244,'Braga',177,NULL,NULL),(2245,'Viana do Castelo',177,NULL,NULL),(2246,'Coimbra',177,NULL,NULL),(2247,'Zhejiang',45,NULL,NULL),(2248,'Fujian',45,NULL,NULL),(2249,'Shanghai',45,NULL,NULL),(2250,'Jiangsu',45,NULL,NULL),(2251,'Anhui',45,NULL,NULL),(2252,'Shandong',45,NULL,NULL),(2253,'Jilin',45,NULL,NULL),(2254,'Shanxi',45,NULL,NULL),(2255,'Taiwan',45,NULL,NULL),(2256,'Jiangxi',45,NULL,NULL),(2257,'Beijing',45,NULL,NULL),(2258,'Hunan',45,NULL,NULL),(2259,'Henan',45,NULL,NULL),(2260,'Yunnan',45,NULL,NULL),(2261,'Guizhou',45,NULL,NULL),(2262,'Ningxia Huizu',45,NULL,NULL),(2263,'Xinjiang',45,NULL,NULL),(2264,'Xizang',45,NULL,NULL),(2265,'Heilongjiang',45,NULL,NULL),(2266,'Macau SAR',45,NULL,NULL),(2267,'Hong Kong SAR',45,NULL,NULL),(2268,'Liaoning',45,NULL,NULL),(2269,'Inner Mongolia',45,NULL,NULL),(2270,'Qinghai',45,NULL,NULL),(2271,'Chongqing',45,NULL,NULL),(2272,'Shaanxi',45,NULL,NULL),(2273,'Hainan',45,NULL,NULL),(2274,'Hubei',45,NULL,NULL),(2275,'Gansu',45,NULL,NULL),(2276,'Tianjin',45,NULL,NULL),(2277,'Sichuan',45,NULL,NULL),(2278,'Guangxi Zhuang',45,NULL,NULL),(2279,'Guangdong',45,NULL,NULL),(2280,'Hebei',45,NULL,NULL),(2281,'South Governorate',121,NULL,NULL),(2282,'Mount Lebanon Governorate',121,NULL,NULL),(2283,'Baalbek-Hermel Governorate',121,NULL,NULL),(2284,'North Governorate',121,NULL,NULL),(2285,'Akkar Governorate',121,NULL,NULL),(2286,'Beirut Governorate',121,NULL,NULL),(2287,'Beqaa Governorate',121,NULL,NULL),(2288,'Nabatieh Governorate',121,NULL,NULL),(2289,'Isle of Wight',232,NULL,NULL),(2290,'St Helens',232,NULL,NULL),(2291,'London Borough of Brent',232,NULL,NULL),(2292,'Walsall',232,NULL,NULL),(2293,'Trafford',232,NULL,NULL),(2294,'City of Southampton',232,NULL,NULL),(2295,'Sheffield',232,NULL,NULL),(2296,'West Sussex',232,NULL,NULL),(2297,'City of Peterborough',232,NULL,NULL),(2298,'Caerphilly County Borough',232,NULL,NULL),(2299,'Vale of Glamorgan',232,NULL,NULL),(2300,'Shetland Islands',232,NULL,NULL),(2301,'Rhondda Cynon Taf',232,NULL,NULL),(2302,'Poole',232,NULL,NULL),(2303,'Central Bedfordshire',232,NULL,NULL),(2304,'Down District Council',232,NULL,NULL),(2305,'City of Portsmouth',232,NULL,NULL),(2306,'London Borough of Haringey',232,NULL,NULL),(2307,'London Borough of Bexley',232,NULL,NULL),(2308,'Rotherham',232,NULL,NULL),(2309,'Hartlepool',232,NULL,NULL),(2310,'Telford and Wrekin',232,NULL,NULL),(2311,'Belfast district',232,NULL,NULL),(2312,'Cornwall',232,NULL,NULL),(2313,'London Borough of Sutton',232,NULL,NULL),(2314,'Omagh District Council',232,NULL,NULL),(2315,'Banbridge',232,NULL,NULL),(2316,'Causeway Coast and Glens',232,NULL,NULL),(2317,'Newtownabbey Borough Council',232,NULL,NULL),(2318,'City of Leicester',232,NULL,NULL),(2319,'London Borough of Islington',232,NULL,NULL),(2320,'Metropolitan Borough of Wigan',232,NULL,NULL),(2321,'Oxfordshire',232,NULL,NULL),(2322,'Magherafelt District Council',232,NULL,NULL),(2323,'Southend-on-Sea',232,NULL,NULL),(2324,'Armagh, Banbridge and Craigavon',232,NULL,NULL),(2325,'Perth and Kinross',232,NULL,NULL),(2326,'London Borough of Waltham Forest',232,NULL,NULL),(2327,'Rochdale',232,NULL,NULL),(2328,'Merthyr Tydfil County Borough',232,NULL,NULL),(2329,'Blackburn with Darwen',232,NULL,NULL),(2330,'Knowsley',232,NULL,NULL),(2331,'Armagh City and District Council',232,NULL,NULL),(2332,'Middlesbrough',232,NULL,NULL),(2333,'East Renfrewshire',232,NULL,NULL),(2334,'Cumbria',232,NULL,NULL),(2335,'Scotland',232,NULL,NULL),(2336,'England',232,NULL,NULL),(2337,'Northern Ireland',232,NULL,NULL),(2338,'Wales',232,NULL,NULL),(2339,'Bath and North East Somerset',232,NULL,NULL),(2340,'Liverpool',232,NULL,NULL),(2341,'Sandwell',232,NULL,NULL),(2342,'Bournemouth',232,NULL,NULL),(2343,'Isles of Scilly',232,NULL,NULL),(2344,'Falkirk',232,NULL,NULL),(2345,'Dorset',232,NULL,NULL),(2346,'Scottish Borders',232,NULL,NULL),(2347,'London Borough of Havering',232,NULL,NULL),(2348,'Moyle District Council',232,NULL,NULL),(2349,'London Borough of Camden',232,NULL,NULL),(2350,'Newry and Mourne District Council',232,NULL,NULL),(2351,'Neath Port Talbot County Borough',232,NULL,NULL),(2352,'Conwy County Borough',232,NULL,NULL),(2353,'Outer Hebrides',232,NULL,NULL),(2354,'West Lothian',232,NULL,NULL),(2355,'Lincolnshire',232,NULL,NULL),(2356,'London Borough of Barking and Dagenham',232,NULL,NULL),(2357,'City of Westminster',232,NULL,NULL),(2358,'London Borough of Lewisham',232,NULL,NULL),(2359,'City of Nottingham',232,NULL,NULL),(2360,'Moray',232,NULL,NULL),(2361,'Ballymoney',232,NULL,NULL),(2362,'South Lanarkshire',232,NULL,NULL),(2363,'Ballymena Borough',232,NULL,NULL),(2364,'Doncaster',232,NULL,NULL),(2365,'Northumberland',232,NULL,NULL),(2366,'Fermanagh and Omagh',232,NULL,NULL),(2367,'Tameside',232,NULL,NULL),(2368,'Royal Borough of Kensington and Chelsea',232,NULL,NULL),(2369,'Hertfordshire',232,NULL,NULL),(2370,'East Riding of Yorkshire',232,NULL,NULL),(2371,'Kirklees',232,NULL,NULL),(2372,'City of Sunderland',232,NULL,NULL),(2373,'Gloucestershire',232,NULL,NULL),(2374,'East Ayrshire',232,NULL,NULL),(2375,'United Kingdom',232,NULL,NULL),(2376,'London Borough of Hillingdon',232,NULL,NULL),(2377,'South Ayrshire',232,NULL,NULL),(2378,'Ascension Island',232,NULL,NULL),(2379,'Gwynedd',232,NULL,NULL),(2380,'London Borough of Hounslow',232,NULL,NULL),(2381,'Medway',232,NULL,NULL),(2382,'Limavady Borough Council',232,NULL,NULL),(2383,'Highland',232,NULL,NULL),(2384,'North East Lincolnshire',232,NULL,NULL),(2385,'London Borough of Harrow',232,NULL,NULL),(2386,'Somerset',232,NULL,NULL),(2387,'Angus',232,NULL,NULL),(2388,'Inverclyde',232,NULL,NULL),(2389,'Darlington',232,NULL,NULL),(2390,'London Borough of Tower Hamlets',232,NULL,NULL),(2391,'Wiltshire',232,NULL,NULL),(2392,'Argyll and Bute',232,NULL,NULL),(2393,'Strabane District Council',232,NULL,NULL),(2394,'Stockport',232,NULL,NULL),(2395,'Brighton and Hove',232,NULL,NULL),(2396,'London Borough of Lambeth',232,NULL,NULL),(2397,'London Borough of Redbridge',232,NULL,NULL),(2398,'Manchester',232,NULL,NULL),(2399,'Mid Ulster',232,NULL,NULL),(2400,'South Gloucestershire',232,NULL,NULL),(2401,'Aberdeenshire',232,NULL,NULL),(2402,'Monmouthshire',232,NULL,NULL),(2403,'Derbyshire',232,NULL,NULL),(2404,'Glasgow',232,NULL,NULL),(2405,'Buckinghamshire',232,NULL,NULL),(2406,'County Durham',232,NULL,NULL),(2407,'Shropshire',232,NULL,NULL),(2408,'Wirral',232,NULL,NULL),(2409,'South Tyneside',232,NULL,NULL),(2410,'Essex',232,NULL,NULL),(2411,'London Borough of Hackney',232,NULL,NULL),(2412,'Antrim and Newtownabbey',232,NULL,NULL),(2413,'City of Bristol',232,NULL,NULL),(2414,'East Sussex',232,NULL,NULL),(2415,'Dumfries and Galloway',232,NULL,NULL),(2416,'Milton Keynes',232,NULL,NULL),(2417,'Derry City Council',232,NULL,NULL),(2418,'London Borough of Newham',232,NULL,NULL),(2419,'Wokingham',232,NULL,NULL),(2420,'Warrington',232,NULL,NULL),(2421,'Stockton-on-Tees',232,NULL,NULL),(2422,'Swindon',232,NULL,NULL),(2423,'Cambridgeshire',232,NULL,NULL),(2424,'City of London',232,NULL,NULL),(2425,'Birmingham',232,NULL,NULL),(2426,'City of York',232,NULL,NULL),(2427,'Slough',232,NULL,NULL),(2428,'Edinburgh',232,NULL,NULL),(2429,'Mid and East Antrim',232,NULL,NULL),(2430,'North Somerset',232,NULL,NULL),(2431,'Gateshead',232,NULL,NULL),(2432,'London Borough of Southwark',232,NULL,NULL),(2433,'City and County of Swansea',232,NULL,NULL),(2434,'London Borough of Wandsworth',232,NULL,NULL),(2435,'Hampshire',232,NULL,NULL),(2436,'Wrexham County Borough',232,NULL,NULL),(2437,'Flintshire',232,NULL,NULL),(2438,'Coventry',232,NULL,NULL),(2439,'Carrickfergus Borough Council',232,NULL,NULL),(2440,'West Dunbartonshire',232,NULL,NULL),(2441,'Powys',232,NULL,NULL),(2442,'Cheshire West and Chester',232,NULL,NULL),(2443,'Renfrewshire',232,NULL,NULL),(2444,'Cheshire East',232,NULL,NULL),(2445,'Cookstown District Council',232,NULL,NULL),(2446,'Derry City and Strabane',232,NULL,NULL),(2447,'Staffordshire',232,NULL,NULL),(2448,'London Borough of Hammersmith and Fulham',232,NULL,NULL),(2449,'Craigavon Borough Council',232,NULL,NULL),(2450,'Clackmannanshire',232,NULL,NULL),(2451,'Blackpool',232,NULL,NULL),(2452,'Bridgend County Borough',232,NULL,NULL),(2453,'North Lincolnshire',232,NULL,NULL),(2454,'East Dunbartonshire',232,NULL,NULL),(2455,'Reading',232,NULL,NULL),(2456,'Nottinghamshire',232,NULL,NULL),(2457,'Dudley',232,NULL,NULL),(2458,'Newcastle upon Tyne',232,NULL,NULL),(2459,'Bury',232,NULL,NULL),(2460,'Lisburn and Castlereagh',232,NULL,NULL),(2461,'Coleraine Borough Council',232,NULL,NULL),(2462,'East Lothian',232,NULL,NULL),(2463,'Aberdeen',232,NULL,NULL),(2464,'Kent',232,NULL,NULL),(2465,'Wakefield',232,NULL,NULL),(2466,'Halton',232,NULL,NULL),(2467,'Suffolk',232,NULL,NULL),(2468,'Thurrock',232,NULL,NULL),(2469,'Solihull',232,NULL,NULL),(2470,'Bracknell Forest',232,NULL,NULL),(2471,'West Berkshire',232,NULL,NULL),(2472,'Rutland',232,NULL,NULL),(2473,'Norfolk',232,NULL,NULL),(2474,'Orkney Islands',232,NULL,NULL),(2475,'City of Kingston upon Hull',232,NULL,NULL),(2476,'London Borough of Enfield',232,NULL,NULL),(2477,'Oldham',232,NULL,NULL),(2478,'Torbay',232,NULL,NULL),(2479,'Fife',232,NULL,NULL),(2480,'Northamptonshire',232,NULL,NULL),(2481,'Royal Borough of Kingston upon Thames',232,NULL,NULL),(2482,'Windsor and Maidenhead',232,NULL,NULL),(2483,'London Borough of Merton',232,NULL,NULL),(2484,'Carmarthenshire',232,NULL,NULL),(2485,'City of Derby',232,NULL,NULL),(2486,'Pembrokeshire',232,NULL,NULL),(2487,'North Lanarkshire',232,NULL,NULL),(2488,'Stirling',232,NULL,NULL),(2489,'City of Wolverhampton',232,NULL,NULL),(2490,'London Borough of Bromley',232,NULL,NULL),(2491,'Devon',232,NULL,NULL),(2492,'Royal Borough of Greenwich',232,NULL,NULL),(2493,'Salford',232,NULL,NULL),(2494,'Lisburn City Council',232,NULL,NULL),(2495,'Lancashire',232,NULL,NULL),(2496,'Torfaen',232,NULL,NULL),(2497,'Denbighshire',232,NULL,NULL),(2498,'Ards',232,NULL,NULL),(2499,'Barnsley',232,NULL,NULL),(2500,'Herefordshire',232,NULL,NULL),(2501,'London Borough of Richmond upon Thames',232,NULL,NULL),(2502,'Saint Helena',232,NULL,NULL),(2503,'Leeds',232,NULL,NULL),(2504,'Bolton',232,NULL,NULL),(2505,'Warwickshire',232,NULL,NULL),(2506,'City of Stoke-on-Trent',232,NULL,NULL),(2507,'Bedford',232,NULL,NULL),(2508,'Dungannon and South Tyrone Borough Council',232,NULL,NULL),(2509,'Ceredigion',232,NULL,NULL),(2510,'Worcestershire',232,NULL,NULL),(2511,'Dundee',232,NULL,NULL),(2512,'London Borough of Croydon',232,NULL,NULL),(2513,'North Down Borough Council',232,NULL,NULL),(2514,'City of Plymouth',232,NULL,NULL),(2515,'Larne Borough Council',232,NULL,NULL),(2516,'Leicestershire',232,NULL,NULL),(2517,'Calderdale',232,NULL,NULL),(2518,'Sefton',232,NULL,NULL),(2519,'Midlothian',232,NULL,NULL),(2520,'London Borough of Barnet',232,NULL,NULL),(2521,'North Tyneside',232,NULL,NULL),(2522,'North Yorkshire',232,NULL,NULL),(2523,'Ards and North Down',232,NULL,NULL),(2524,'Newport',232,NULL,NULL),(2525,'Castlereagh',232,NULL,NULL),(2526,'Surrey',232,NULL,NULL),(2527,'Redcar and Cleveland',232,NULL,NULL),(2528,'City and County of Cardiff',232,NULL,NULL),(2529,'Bradford',232,NULL,NULL),(2530,'Blaenau Gwent County Borough',232,NULL,NULL),(2531,'Fermanagh District Council',232,NULL,NULL),(2532,'London Borough of Ealing',232,NULL,NULL),(2533,'Antrim',232,NULL,NULL),(2534,'Newry, Mourne and Down',232,NULL,NULL),(2535,'North Ayrshire',232,NULL,NULL),(2536,'Tashkent',236,NULL,NULL),(2537,'Namangan Region',236,NULL,NULL),(2538,'Fergana Region',236,NULL,NULL),(2539,'Xorazm Region',236,NULL,NULL),(2540,'Andijan Region',236,NULL,NULL),(2541,'Bukhara Region',236,NULL,NULL),(2542,'Navoiy Region',236,NULL,NULL),(2543,'Qashqadaryo Region',236,NULL,NULL),(2544,'Samarqand Region',236,NULL,NULL),(2545,'Jizzakh Region',236,NULL,NULL),(2546,'Surxondaryo Region',236,NULL,NULL),(2547,'Sirdaryo Region',236,NULL,NULL),(2548,'Karakalpakstan',236,NULL,NULL),(2549,'Tashkent Region',236,NULL,NULL),(2550,'Ariana Governorate',224,NULL,NULL),(2551,'Bizerte Governorate',224,NULL,NULL),(2552,'Jendouba Governorate',224,NULL,NULL),(2553,'Monastir Governorate',224,NULL,NULL),(2554,'Tunis Governorate',224,NULL,NULL),(2555,'Manouba Governorate',224,NULL,NULL),(2556,'Gafsa Governorate',224,NULL,NULL),(2557,'Sfax Governorate',224,NULL,NULL),(2558,'Gabès Governorate',224,NULL,NULL),(2559,'Tataouine Governorate',224,NULL,NULL),(2560,'Medenine Governorate',224,NULL,NULL),(2561,'Kef Governorate',224,NULL,NULL),(2562,'Kebili Governorate',224,NULL,NULL),(2563,'Siliana Governorate',224,NULL,NULL),(2564,'Kairouan Governorate',224,NULL,NULL),(2565,'Zaghouan Governorate',224,NULL,NULL),(2566,'Ben Arous Governorate',224,NULL,NULL),(2567,'Sidi Bouzid Governorate',224,NULL,NULL),(2568,'Mahdia Governorate',224,NULL,NULL),(2569,'Tozeur Governorate',224,NULL,NULL),(2570,'Kasserine Governorate',224,NULL,NULL),(2571,'Sousse Governorate',224,NULL,NULL),(2572,'Kassrine',224,NULL,NULL),(2573,'Ratak Chain',137,NULL,NULL),(2574,'Ralik Chain',137,NULL,NULL),(2575,'Centrale Region',220,NULL,NULL),(2576,'Maritime',220,NULL,NULL),(2577,'Plateaux Region',220,NULL,NULL),(2578,'Savanes Region',220,NULL,NULL),(2579,'Kara Region',220,NULL,NULL),(2580,'Chuuk State',143,NULL,NULL),(2581,'Pohnpei State',143,NULL,NULL),(2582,'Yap State',143,NULL,NULL),(2583,'Kosrae State',143,NULL,NULL),(2584,'Vaavu Atoll',133,NULL,NULL),(2585,'Shaviyani Atoll',133,NULL,NULL),(2586,'Haa Alif Atoll',133,NULL,NULL),(2587,'Alif Alif Atoll',133,NULL,NULL),(2588,'North Province',133,NULL,NULL),(2589,'North Central Province',133,NULL,NULL),(2590,'Dhaalu Atoll',133,NULL,NULL),(2591,'Thaa Atoll',133,NULL,NULL),(2592,'Noonu Atoll',133,NULL,NULL),(2593,'Upper South Province',133,NULL,NULL),(2594,'Addu Atoll',133,NULL,NULL),(2595,'Gnaviyani Atoll',133,NULL,NULL),(2596,'Kaafu Atoll',133,NULL,NULL),(2597,'Haa Dhaalu Atoll',133,NULL,NULL),(2598,'Gaafu Alif Atoll',133,NULL,NULL),(2599,'Faafu Atoll',133,NULL,NULL),(2600,'Alif Dhaal Atoll',133,NULL,NULL),(2601,'Laamu Atoll',133,NULL,NULL),(2602,'Raa Atoll',133,NULL,NULL),(2603,'Gaafu Dhaalu Atoll',133,NULL,NULL),(2604,'Central Province',133,NULL,NULL),(2605,'South Province',133,NULL,NULL),(2606,'South Central Province',133,NULL,NULL),(2607,'Lhaviyani Atoll',133,NULL,NULL),(2608,'Meemu Atoll',133,NULL,NULL),(2609,'Malé',133,NULL,NULL),(2610,'Utrecht',156,NULL,NULL),(2611,'Gelderland',156,NULL,NULL),(2612,'North Holland',156,NULL,NULL),(2613,'Drenthe',156,NULL,NULL),(2614,'South Holland',156,NULL,NULL),(2615,'Limburg',156,NULL,NULL),(2616,'Sint Eustatius',156,NULL,NULL),(2617,'Groningen',156,NULL,NULL),(2618,'Overijssel',156,NULL,NULL),(2619,'Flevoland',156,NULL,NULL),(2620,'Zeeland',156,NULL,NULL),(2621,'Saba',156,NULL,NULL),(2622,'Friesland',156,NULL,NULL),(2623,'North Brabant',156,NULL,NULL),(2624,'Bonaire',156,NULL,NULL),(2625,'Savanes Region',54,NULL,NULL),(2626,'Agnéby',54,NULL,NULL),(2627,'Lagunes District',54,NULL,NULL),(2628,'Sud-Bandama',54,NULL,NULL),(2629,'Montagnes District',54,NULL,NULL),(2630,'Moyen-Comoé',54,NULL,NULL),(2631,'Marahoué Region',54,NULL,NULL),(2632,'Lacs District',54,NULL,NULL),(2633,'Fromager',54,NULL,NULL),(2634,'Abidjan',54,NULL,NULL),(2635,'Bas-Sassandra Region',54,NULL,NULL),(2636,'Bafing Region',54,NULL,NULL),(2637,'Vallée du Bandama District',54,NULL,NULL),(2638,'Haut-Sassandra',54,NULL,NULL),(2639,'Lagunes region',54,NULL,NULL),(2640,'Lacs Region',54,NULL,NULL),(2641,'Zanzan Region',54,NULL,NULL),(2642,'Denguélé Region',54,NULL,NULL),(2643,'Bas-Sassandra District',54,NULL,NULL),(2644,'Denguélé District',54,NULL,NULL),(2645,'Dix-Huit Montagnes',54,NULL,NULL),(2646,'Moyen-Cavally',54,NULL,NULL),(2647,'Vallée du Bandama Region',54,NULL,NULL),(2648,'Sassandra-Marahoué District',54,NULL,NULL),(2649,'Worodougou',54,NULL,NULL),(2650,'Woroba District',54,NULL,NULL),(2651,'Gôh-Djiboua District',54,NULL,NULL),(2652,'Sud-Comoé',54,NULL,NULL),(2653,'Yamoussoukro',54,NULL,NULL),(2654,'Comoé District',54,NULL,NULL),(2655,'N\'zi-Comoé',54,NULL,NULL),(2656,'Far North',38,NULL,NULL),(2657,'Northwest',38,NULL,NULL),(2658,'Southwest',38,NULL,NULL),(2659,'South',38,NULL,NULL),(2660,'Centre',38,NULL,NULL),(2661,'East',38,NULL,NULL),(2662,'Littoral',38,NULL,NULL),(2663,'Adamawa',38,NULL,NULL),(2664,'West',38,NULL,NULL),(2665,'North',38,NULL,NULL),(2666,'Banjul',80,NULL,NULL),(2667,'West Coast Division',80,NULL,NULL),(2668,'Upper River Division',80,NULL,NULL),(2669,'Central River Division',80,NULL,NULL),(2670,'Lower River Division',80,NULL,NULL),(2671,'North Bank Division',80,NULL,NULL),(2672,'Beyla Prefecture',92,NULL,NULL),(2673,'Mandiana Prefecture',92,NULL,NULL),(2674,'Yomou Prefecture',92,NULL,NULL),(2675,'Fria Prefecture',92,NULL,NULL),(2676,'Boké Region',92,NULL,NULL),(2677,'Labé Region',92,NULL,NULL),(2678,'Nzérékoré Prefecture',92,NULL,NULL),(2679,'Dabola Prefecture',92,NULL,NULL),(2680,'Labé Prefecture',92,NULL,NULL),(2681,'Dubréka Prefecture',92,NULL,NULL),(2682,'Faranah Prefecture',92,NULL,NULL),(2683,'Forécariah Prefecture',92,NULL,NULL),(2684,'Nzérékoré Region',92,NULL,NULL),(2685,'Gaoual Prefecture',92,NULL,NULL),(2686,'Conakry',92,NULL,NULL),(2687,'Télimélé Prefecture',92,NULL,NULL),(2688,'Dinguiraye Prefecture',92,NULL,NULL),(2689,'Mamou Prefecture',92,NULL,NULL),(2690,'Lélouma Prefecture',92,NULL,NULL),(2691,'Kissidougou Prefecture',92,NULL,NULL),(2692,'Koubia Prefecture',92,NULL,NULL),(2693,'Kindia Prefecture',92,NULL,NULL),(2694,'Pita Prefecture',92,NULL,NULL),(2695,'Kouroussa Prefecture',92,NULL,NULL),(2696,'Tougué Prefecture',92,NULL,NULL),(2697,'Kankan Region',92,NULL,NULL),(2698,'Mamou Region',92,NULL,NULL),(2699,'Boffa Prefecture',92,NULL,NULL),(2700,'Mali Prefecture',92,NULL,NULL),(2701,'Kindia Region',92,NULL,NULL),(2702,'Macenta Prefecture',92,NULL,NULL),(2703,'Koundara Prefecture',92,NULL,NULL),(2704,'Kankan Prefecture',92,NULL,NULL),(2705,'Coyah Prefecture',92,NULL,NULL),(2706,'Dalaba Prefecture',92,NULL,NULL),(2707,'Siguiri Prefecture',92,NULL,NULL),(2708,'Lola Prefecture',92,NULL,NULL),(2709,'Boké Prefecture',92,NULL,NULL),(2710,'Kérouané Prefecture',92,NULL,NULL),(2711,'Guéckédou Prefecture',92,NULL,NULL),(2712,'Tombali Region',93,NULL,NULL),(2713,'Cacheu Region',93,NULL,NULL),(2714,'Biombo Region',93,NULL,NULL),(2715,'Quinara Region',93,NULL,NULL),(2716,'Sul Province',93,NULL,NULL),(2717,'Norte Province',93,NULL,NULL),(2718,'Oio Region',93,NULL,NULL),(2719,'Gabú Region',93,NULL,NULL),(2720,'Bafatá',93,NULL,NULL),(2721,'Leste Province',93,NULL,NULL),(2722,'Bolama Region',93,NULL,NULL),(2723,'Woleu-Ntem Province',79,NULL,NULL),(2724,'Ogooué-Ivindo Province',79,NULL,NULL),(2725,'Nyanga Province',79,NULL,NULL),(2726,'Haut-Ogooué Province',79,NULL,NULL),(2727,'Estuaire Province',79,NULL,NULL),(2728,'Ogooué-Maritime Province',79,NULL,NULL),(2729,'Ogooué-Lolo Province',79,NULL,NULL),(2730,'Moyen-Ogooué Province',79,NULL,NULL),(2731,'Ngounié Province',79,NULL,NULL),(2732,'Tshuapa',51,NULL,NULL),(2733,'Tanganyika',51,NULL,NULL),(2734,'Haut-Uélé',51,NULL,NULL),(2735,'Kasaï Oriental',51,NULL,NULL),(2738,'Sud-Kivu',51,NULL,NULL),(2739,'Nord-Ubangi',51,NULL,NULL),(2740,'Kwango',51,NULL,NULL),(2741,'Kinshasa',51,NULL,NULL),(2742,'Kasaï Central',51,NULL,NULL),(2743,'Sankuru',51,NULL,NULL),(2744,'Équateur',51,NULL,NULL),(2745,'Maniema',51,NULL,NULL),(2746,'Kongo Central',51,NULL,NULL),(2747,'Lomami',51,NULL,NULL),(2748,'Sud-Ubangi',51,NULL,NULL),(2749,'Nord-Kivu',51,NULL,NULL),(2750,'Haut-Katanga',51,NULL,NULL),(2751,'Ituri',51,NULL,NULL),(2752,'Mongala',51,NULL,NULL),(2753,'Bas-Uélé',51,NULL,NULL),(2755,'Mai-Ndombe',51,NULL,NULL),(2756,'Tshopo',51,NULL,NULL),(2757,'Kasaï',51,NULL,NULL),(2758,'Haut-Lomami',51,NULL,NULL),(2759,'Kwilu',51,NULL,NULL),(2760,'Cuyuni-Mazaruni',94,NULL,NULL),(2761,'Potaro-Siparuni',94,NULL,NULL),(2762,'Mahaica-Berbice',94,NULL,NULL),(2763,'Upper Demerara-Berbice',94,NULL,NULL),(2764,'Barima-Waini',94,NULL,NULL),(2765,'Pomeroon-Supenaam',94,NULL,NULL),(2766,'East Berbice-Corentyne',94,NULL,NULL),(2767,'Demerara-Mahaica',94,NULL,NULL),(2768,'Essequibo Islands-West Demerara',94,NULL,NULL),(2769,'Upper Takutu-Upper Essequibo',94,NULL,NULL),(2770,'Presidente Hayes Department',172,NULL,NULL),(2771,'Canindeyú',172,NULL,NULL),(2772,'Guairá Department',172,NULL,NULL),(2773,'Caaguazú',172,NULL,NULL),(2774,'Paraguarí Department',172,NULL,NULL),(2775,'Caazapá',172,NULL,NULL),(2776,'San Pedro Department',172,NULL,NULL),(2777,'Central Department',172,NULL,NULL),(2778,'Itapúa',172,NULL,NULL),(2779,'Concepción Department',172,NULL,NULL),(2780,'Boquerón Department',172,NULL,NULL),(2781,'Ñeembucú Department',172,NULL,NULL),(2782,'Amambay Department',172,NULL,NULL),(2783,'Cordillera Department',172,NULL,NULL),(2784,'Alto Paraná Department',172,NULL,NULL),(2785,'Alto Paraguay Department',172,NULL,NULL),(2786,'Misiones Department',172,NULL,NULL),(2787,'Jaffna District',208,NULL,NULL),(2788,'Kandy District',208,NULL,NULL),(2789,'Kalutara District',208,NULL,NULL),(2790,'Badulla District',208,NULL,NULL),(2791,'Hambantota District',208,NULL,NULL),(2792,'Galle District',208,NULL,NULL),(2793,'Kilinochchi District',208,NULL,NULL),(2794,'Nuwara Eliya District',208,NULL,NULL),(2795,'Trincomalee District',208,NULL,NULL),(2796,'Puttalam District',208,NULL,NULL),(2797,'Kegalle District',208,NULL,NULL),(2798,'Central Province',208,NULL,NULL),(2799,'Ampara District',208,NULL,NULL),(2800,'North Central Province',208,NULL,NULL),(2801,'Southern Province',208,NULL,NULL),(2802,'Western Province',208,NULL,NULL),(2803,'Sabaragamuwa Province',208,NULL,NULL),(2804,'Gampaha District',208,NULL,NULL),(2805,'Mannar District',208,NULL,NULL),(2806,'Matara District',208,NULL,NULL),(2807,'Ratnapura district',208,NULL,NULL),(2808,'Eastern Province',208,NULL,NULL),(2809,'Vavuniya District',208,NULL,NULL),(2810,'Matale District',208,NULL,NULL),(2811,'Uva Province',208,NULL,NULL),(2812,'Polonnaruwa District',208,NULL,NULL),(2813,'Northern Province',208,NULL,NULL),(2814,'Mullaitivu District',208,NULL,NULL),(2815,'Colombo District',208,NULL,NULL),(2816,'Anuradhapura District',208,NULL,NULL),(2817,'North Western Province',208,NULL,NULL),(2818,'Batticaloa District',208,NULL,NULL),(2819,'Monaragala District',208,NULL,NULL),(2820,'Mohéli',49,NULL,NULL),(2821,'Anjouan',49,NULL,NULL),(2822,'Grande Comore',49,NULL,NULL),(2823,'Atacama',44,NULL,NULL),(2824,'Región Metropolitana de Santiago',44,NULL,NULL),(2825,'Coquimbo',44,NULL,NULL),(2826,'La Araucanía',44,NULL,NULL),(2827,'Biobío',44,NULL,NULL),(2828,'Aisén del General Carlos Ibañez del Campo',44,NULL,NULL),(2829,'Arica y Parinacota',44,NULL,NULL),(2830,'Valparaíso',44,NULL,NULL),(2831,'Ñuble',44,NULL,NULL),(2832,'Antofagasta',44,NULL,NULL),(2833,'Maule',44,NULL,NULL),(2834,'Los Ríos',44,NULL,NULL),(2835,'Los Lagos',44,NULL,NULL),(2836,'Magallanes y de la Antártica Chilena',44,NULL,NULL),(2837,'Tarapacá',44,NULL,NULL),(2838,'Libertador General Bernardo O\'Higgins',44,NULL,NULL),(2839,'Commewijne District',210,NULL,NULL),(2840,'Nickerie District',210,NULL,NULL),(2841,'Para District',210,NULL,NULL),(2842,'Coronie District',210,NULL,NULL),(2843,'Paramaribo District',210,NULL,NULL),(2844,'Wanica District',210,NULL,NULL),(2845,'Marowijne District',210,NULL,NULL),(2846,'Brokopondo District',210,NULL,NULL),(2847,'Sipaliwini District',210,NULL,NULL),(2848,'Saramacca District',210,NULL,NULL),(2849,'Riyadh',194,NULL,NULL),(2850,'Makkah',194,NULL,NULL),(2851,'Al Madinah',194,NULL,NULL),(2852,'Tabuk',194,NULL,NULL),(2853,'\'Asir',194,NULL,NULL),(2854,'Northern Borders',194,NULL,NULL),(2855,'Ha\'il',194,NULL,NULL),(2856,'Eastern Province',194,NULL,NULL),(2857,'Al Jawf',194,NULL,NULL),(2858,'Jizan',194,NULL,NULL),(2859,'Al Bahah',194,NULL,NULL),(2860,'Najran',194,NULL,NULL),(2861,'Al-Qassim',194,NULL,NULL),(2862,'Plateaux Department',50,NULL,NULL),(2863,'Pointe-Noire',50,NULL,NULL),(2864,'Cuvette Department',50,NULL,NULL),(2865,'Likouala Department',50,NULL,NULL),(2866,'Bouenza Department',50,NULL,NULL),(2867,'Kouilou Department',50,NULL,NULL),(2868,'Lékoumou Department',50,NULL,NULL),(2869,'Cuvette-Ouest Department',50,NULL,NULL),(2870,'Brazzaville',50,NULL,NULL),(2871,'Sangha Department',50,NULL,NULL),(2872,'Niari Department',50,NULL,NULL),(2873,'Pool Department',50,NULL,NULL),(2874,'Quindío',48,NULL,NULL),(2875,'Cundinamarca',48,NULL,NULL),(2876,'Chocó',48,NULL,NULL),(2877,'Norte de Santander',48,NULL,NULL),(2878,'Meta',48,NULL,NULL),(2879,'Risaralda',48,NULL,NULL),(2880,'Atlántico',48,NULL,NULL),(2881,'Arauca',48,NULL,NULL),(2882,'Guainía',48,NULL,NULL),(2883,'Tolima',48,NULL,NULL),(2884,'Cauca',48,NULL,NULL),(2885,'Vaupés',48,NULL,NULL),(2886,'Magdalena',48,NULL,NULL),(2887,'Caldas',48,NULL,NULL),(2888,'Guaviare',48,NULL,NULL),(2889,'La Guajira',48,NULL,NULL),(2890,'Antioquia',48,NULL,NULL),(2891,'Caquetá',48,NULL,NULL),(2892,'Casanare',48,NULL,NULL),(2893,'Bolívar',48,NULL,NULL),(2894,'Vichada',48,NULL,NULL),(2895,'Amazonas',48,NULL,NULL),(2896,'Putumayo',48,NULL,NULL),(2897,'Nariño',48,NULL,NULL),(2898,'Córdoba',48,NULL,NULL),(2899,'Cesar',48,NULL,NULL),(2900,'Archipiélago de San Andrés, Providencia y Santa Catalina',48,NULL,NULL),(2901,'Santander',48,NULL,NULL),(2902,'Sucre',48,NULL,NULL),(2903,'Boyacá',48,NULL,NULL),(2904,'Valle del Cauca',48,NULL,NULL),(2905,'Galápagos',64,NULL,NULL),(2906,'Sucumbíos',64,NULL,NULL),(2907,'Pastaza',64,NULL,NULL),(2908,'Tungurahua',64,NULL,NULL),(2909,'Zamora Chinchipe',64,NULL,NULL),(2910,'Los Ríos',64,NULL,NULL),(2911,'Imbabura',64,NULL,NULL),(2912,'Santa Elena',64,NULL,NULL),(2913,'Manabí',64,NULL,NULL),(2914,'Guayas',64,NULL,NULL),(2915,'Carchi',64,NULL,NULL),(2916,'Napo',64,NULL,NULL),(2917,'Cañar',64,NULL,NULL),(2918,'Morona-Santiago',64,NULL,NULL),(2919,'Santo Domingo de los Tsáchilas',64,NULL,NULL),(2920,'Bolívar',64,NULL,NULL),(2921,'Cotopaxi',64,NULL,NULL),(2922,'Esmeraldas',64,NULL,NULL),(2923,'Azuay',64,NULL,NULL),(2924,'El Oro',64,NULL,NULL),(2925,'Chimborazo',64,NULL,NULL),(2926,'Orellana',64,NULL,NULL),(2927,'Pichincha',64,NULL,NULL),(2928,'Obock Region',60,NULL,NULL),(2929,'Djibouti',60,NULL,NULL),(2930,'Dikhil Region',60,NULL,NULL),(2931,'Tadjourah Region',60,NULL,NULL),(2932,'Arta Region',60,NULL,NULL),(2933,'Ali Sabieh Region',60,NULL,NULL),(2934,'Hama Governorate',215,NULL,NULL),(2935,'Rif Dimashq Governorate',215,NULL,NULL),(2936,'As-Suwayda Governorate',215,NULL,NULL),(2937,'Deir ez-Zor Governorate',215,NULL,NULL),(2938,'Latakia Governorate',215,NULL,NULL),(2939,'Damascus Governorate',215,NULL,NULL),(2940,'Idlib Governorate',215,NULL,NULL),(2941,'Al-Hasakah Governorate',215,NULL,NULL),(2942,'Homs Governorate',215,NULL,NULL),(2943,'Quneitra Governorate',215,NULL,NULL),(2944,'Al-Raqqah Governorate',215,NULL,NULL),(2945,'Daraa Governorate',215,NULL,NULL),(2946,'Aleppo Governorate',215,NULL,NULL),(2947,'Tartus Governorate',215,NULL,NULL),(2948,'Fianarantsoa Province',130,NULL,NULL),(2949,'Toliara Province',130,NULL,NULL),(2950,'Antsiranana Province',130,NULL,NULL),(2951,'Antananarivo Province',130,NULL,NULL),(2952,'Toamasina Province',130,NULL,NULL),(2953,'Mahajanga Province',130,NULL,NULL),(2954,'Mogilev Region',21,NULL,NULL),(2955,'Gomel Region',21,NULL,NULL),(2956,'Grodno Region',21,NULL,NULL),(2957,'Minsk Region',21,NULL,NULL),(2958,'Minsk',21,NULL,NULL),(2959,'Brest Region',21,NULL,NULL),(2960,'Vitebsk Region',21,NULL,NULL),(2961,'Murqub',124,NULL,NULL),(2962,'Nuqat al Khams',124,NULL,NULL),(2963,'Zawiya District',124,NULL,NULL),(2964,'Al Wahat District',124,NULL,NULL),(2965,'Sabha District',124,NULL,NULL),(2966,'Derna District',124,NULL,NULL),(2967,'Murzuq District',124,NULL,NULL),(2968,'Marj District',124,NULL,NULL),(2969,'Ghat District',124,NULL,NULL),(2970,'Jufra',124,NULL,NULL),(2971,'Tripoli District',124,NULL,NULL),(2972,'Kufra District',124,NULL,NULL),(2973,'Wadi al Hayaa District',124,NULL,NULL),(2974,'Jabal al Gharbi District',124,NULL,NULL),(2975,'Wadi al Shatii District',124,NULL,NULL),(2976,'Nalut District',124,NULL,NULL),(2977,'Sirte District',124,NULL,NULL),(2978,'Misrata District',124,NULL,NULL),(2979,'Jafara',124,NULL,NULL),(2980,'Jabal al Akhdar',124,NULL,NULL),(2981,'Benghazi',124,NULL,NULL),(2982,'Ribeira Brava Municipality',40,NULL,NULL),(2983,'Tarrafal',40,NULL,NULL),(2984,'Ribeira Grande de Santiago',40,NULL,NULL),(2985,'Santa Catarina',40,NULL,NULL),(2986,'São Domingos',40,NULL,NULL),(2987,'Mosteiros',40,NULL,NULL),(2988,'Praia',40,NULL,NULL),(2989,'Porto Novo',40,NULL,NULL),(2990,'São Miguel',40,NULL,NULL),(2991,'Maio Municipality',40,NULL,NULL),(2992,'Sotavento Islands',40,NULL,NULL),(2993,'São Lourenço dos Órgãos',40,NULL,NULL),(2994,'Barlavento Islands',40,NULL,NULL),(2995,'Santa Catarina do Fogo',40,NULL,NULL),(2996,'Brava',40,NULL,NULL),(2997,'Paul',40,NULL,NULL),(2998,'Sal',40,NULL,NULL),(2999,'Boa Vista',40,NULL,NULL),(3000,'São Filipe',40,NULL,NULL),(3001,'São Vicente',40,NULL,NULL),(3002,'Ribeira Grande',40,NULL,NULL),(3003,'Tarrafal de São Nicolau',40,NULL,NULL),(3004,'Santa Cruz',40,NULL,NULL),(3005,'Schleswig-Holstein',82,NULL,NULL),(3006,'Baden-Württemberg',82,NULL,NULL),(3007,'Mecklenburg-Vorpommern',82,NULL,NULL),(3008,'Lower Saxony',82,NULL,NULL),(3009,'Bavaria',82,NULL,NULL),(3010,'Berlin',82,NULL,NULL),(3011,'Saxony-Anhalt',82,NULL,NULL),(3013,'Brandenburg',82,NULL,NULL),(3014,'Bremen',82,NULL,NULL),(3015,'Thuringia',82,NULL,NULL),(3016,'Hamburg',82,NULL,NULL),(3017,'North Rhine-Westphalia',82,NULL,NULL),(3018,'Hesse',82,NULL,NULL),(3019,'Rhineland-Palatinate',82,NULL,NULL),(3020,'Saarland',82,NULL,NULL),(3021,'Saxony',82,NULL,NULL),(3022,'Mafeteng District',122,NULL,NULL),(3023,'Mohale\'s Hoek District',122,NULL,NULL),(3024,'Mokhotlong District',122,NULL,NULL),(3025,'Qacha\'s Nek District',122,NULL,NULL),(3026,'Leribe District',122,NULL,NULL),(3027,'Quthing District',122,NULL,NULL),(3028,'Maseru District',122,NULL,NULL),(3029,'Butha-Buthe District',122,NULL,NULL),(3030,'Berea District',122,NULL,NULL),(3031,'Thaba-Tseka District',122,NULL,NULL),(3032,'Montserrado County',123,NULL,NULL),(3033,'River Cess County',123,NULL,NULL),(3034,'Bong County',123,NULL,NULL),(3035,'Sinoe County',123,NULL,NULL),(3036,'Grand Cape Mount County',123,NULL,NULL),(3037,'Lofa County',123,NULL,NULL),(3038,'River Gee County',123,NULL,NULL),(3039,'Grand Gedeh County',123,NULL,NULL),(3040,'Grand Bassa County',123,NULL,NULL),(3041,'Bomi County',123,NULL,NULL),(3042,'Maryland County',123,NULL,NULL),(3043,'Margibi County',123,NULL,NULL),(3044,'Gbarpolu County',123,NULL,NULL),(3045,'Grand Kru County',123,NULL,NULL),(3046,'Nimba',123,NULL,NULL),(3047,'Ad Dhahirah Governorate',166,NULL,NULL),(3048,'Al Batinah North Governorate',166,NULL,NULL),(3049,'Al Batinah South Governorate',166,NULL,NULL),(3050,'Al Batinah Region',166,NULL,NULL),(3051,'Ash Sharqiyah Region',166,NULL,NULL),(3052,'Musandam Governorate',166,NULL,NULL),(3053,'Ash Sharqiyah North Governorate',166,NULL,NULL),(3054,'Ash Sharqiyah South Governorate',166,NULL,NULL),(3055,'Muscat Governorate',166,NULL,NULL),(3056,'Al Wusta Governorate',166,NULL,NULL),(3057,'Dhofar Governorate',166,NULL,NULL),(3058,'Ad Dakhiliyah Governorate',166,NULL,NULL),(3059,'Al Buraimi Governorate',166,NULL,NULL),(3060,'Ngamiland',29,NULL,NULL),(3061,'Ghanzi District',29,NULL,NULL),(3062,'Kgatleng District',29,NULL,NULL),(3063,'Southern District',29,NULL,NULL),(3064,'South-East District',29,NULL,NULL),(3065,'North-West District',29,NULL,NULL),(3066,'Kgalagadi District',29,NULL,NULL),(3067,'Central District',29,NULL,NULL),(3068,'North-East District',29,NULL,NULL),(3069,'Kweneng District',29,NULL,NULL),(3070,'Collines Department',24,NULL,NULL),(3071,'Kouffo Department',24,NULL,NULL),(3072,'Donga Department',24,NULL,NULL),(3073,'Zou Department',24,NULL,NULL),(3074,'Plateau Department',24,NULL,NULL),(3075,'Mono Department',24,NULL,NULL),(3076,'Atakora Department',24,NULL,NULL),(3077,'Alibori Department',24,NULL,NULL),(3078,'Borgou Department',24,NULL,NULL),(3079,'Atlantique Department',24,NULL,NULL),(3080,'Ouémé Department',24,NULL,NULL),(3081,'Littoral Department',24,NULL,NULL),(3082,'Machinga District',131,NULL,NULL),(3083,'Zomba District',131,NULL,NULL),(3084,'Mwanza District',131,NULL,NULL),(3085,'Nsanje District',131,NULL,NULL),(3086,'Salima District',131,NULL,NULL),(3087,'Chitipa district',131,NULL,NULL),(3088,'Ntcheu District',131,NULL,NULL),(3089,'Rumphi District',131,NULL,NULL),(3090,'Dowa District',131,NULL,NULL),(3091,'Karonga District',131,NULL,NULL),(3092,'Central Region',131,NULL,NULL),(3093,'Likoma District',131,NULL,NULL),(3094,'Kasungu District',131,NULL,NULL),(3095,'Nkhata Bay District',131,NULL,NULL),(3096,'Balaka District',131,NULL,NULL),(3097,'Dedza District',131,NULL,NULL),(3098,'Thyolo District',131,NULL,NULL),(3099,'Mchinji District',131,NULL,NULL),(3100,'Nkhotakota District',131,NULL,NULL),(3101,'Lilongwe District',131,NULL,NULL),(3102,'Blantyre District',131,NULL,NULL),(3103,'Mulanje District',131,NULL,NULL),(3104,'Mzimba District',131,NULL,NULL),(3105,'Northern Region',131,NULL,NULL),(3106,'Southern Region',131,NULL,NULL),(3107,'Chikwawa District',131,NULL,NULL),(3108,'Phalombe District',131,NULL,NULL),(3109,'Chiradzulu District',131,NULL,NULL),(3110,'Mangochi District',131,NULL,NULL),(3111,'Ntchisi District',131,NULL,NULL),(3112,'Kénédougou Province',35,NULL,NULL),(3113,'Namentenga Province',35,NULL,NULL),(3114,'Sahel Region',35,NULL,NULL),(3115,'Centre-Ouest Region',35,NULL,NULL),(3116,'Nahouri Province',35,NULL,NULL),(3117,'Passoré Province',35,NULL,NULL),(3118,'Zoundwéogo Province',35,NULL,NULL),(3119,'Sissili Province',35,NULL,NULL),(3120,'Banwa Province',35,NULL,NULL),(3121,'Bougouriba Province',35,NULL,NULL),(3122,'Gnagna Province',35,NULL,NULL),(3123,'Mouhoun',35,NULL,NULL),(3124,'Yagha Province',35,NULL,NULL),(3125,'Plateau-Central Region',35,NULL,NULL),(3126,'Sanmatenga Province',35,NULL,NULL),(3127,'Centre-Nord Region',35,NULL,NULL),(3128,'Tapoa Province',35,NULL,NULL),(3129,'Houet Province',35,NULL,NULL),(3130,'Zondoma Province',35,NULL,NULL),(3131,'Boulgou',35,NULL,NULL),(3132,'Komondjari Province',35,NULL,NULL),(3133,'Koulpélogo Province',35,NULL,NULL),(3134,'Tuy Province',35,NULL,NULL),(3135,'Ioba Province',35,NULL,NULL),(3136,'Centre',35,NULL,NULL),(3137,'Sourou Province',35,NULL,NULL),(3138,'Boucle du Mouhoun Region',35,NULL,NULL),(3139,'Séno Province',35,NULL,NULL),(3140,'Sud-Ouest Region',35,NULL,NULL),(3141,'Oubritenga Province',35,NULL,NULL),(3142,'Nayala Province',35,NULL,NULL),(3143,'Gourma Province',35,NULL,NULL),(3144,'Oudalan Province',35,NULL,NULL),(3145,'Ziro Province',35,NULL,NULL),(3146,'Kossi Province',35,NULL,NULL),(3147,'Kourwéogo Province',35,NULL,NULL),(3148,'Ganzourgou Province',35,NULL,NULL),(3149,'Centre-Sud Region',35,NULL,NULL),(3150,'Yatenga Province',35,NULL,NULL),(3151,'Loroum Province',35,NULL,NULL),(3152,'Bazèga Province',35,NULL,NULL),(3153,'Cascades Region',35,NULL,NULL),(3154,'Sanguié Province',35,NULL,NULL),(3155,'Bam Province',35,NULL,NULL),(3156,'Noumbiel Province',35,NULL,NULL),(3157,'Kompienga Province',35,NULL,NULL),(3158,'Est Region',35,NULL,NULL),(3159,'Léraba Province',35,NULL,NULL),(3160,'Balé Province',35,NULL,NULL),(3161,'Kouritenga Province',35,NULL,NULL),(3162,'Centre-Est Region',35,NULL,NULL),(3163,'Poni Province',35,NULL,NULL),(3164,'Nord Region, Burkina Faso',35,NULL,NULL),(3165,'Hauts-Bassins Region',35,NULL,NULL),(3166,'Soum Province',35,NULL,NULL),(3167,'Comoé Province',35,NULL,NULL),(3168,'Kadiogo Province',35,NULL,NULL),(3169,'Islamabad Capital Territory',167,NULL,NULL),(3170,'Gilgit-Baltistan',167,NULL,NULL),(3171,'Khyber Pakhtunkhwa',167,NULL,NULL),(3172,'Azad Kashmir',167,NULL,NULL),(3173,'Federally Administered Tribal Areas',167,NULL,NULL),(3174,'Balochistan',167,NULL,NULL),(3175,'Sindh',167,NULL,NULL),(3176,'Punjab',167,NULL,NULL),(3177,'Al Rayyan Municipality',179,NULL,NULL),(3178,'Al-Shahaniya',179,NULL,NULL),(3179,'Al Wakrah',179,NULL,NULL),(3180,'Madinat ash Shamal',179,NULL,NULL),(3181,'Doha',179,NULL,NULL),(3182,'Al Daayen',179,NULL,NULL),(3183,'Al Khor',179,NULL,NULL),(3184,'Umm Salal Municipality',179,NULL,NULL),(3185,'Rumonge Province',36,NULL,NULL),(3186,'Muyinga Province',36,NULL,NULL),(3187,'Mwaro Province',36,NULL,NULL),(3188,'Makamba Province',36,NULL,NULL),(3189,'Rutana Province',36,NULL,NULL),(3190,'Cibitoke Province',36,NULL,NULL),(3191,'Ruyigi Province',36,NULL,NULL),(3192,'Kayanza Province',36,NULL,NULL),(3193,'Muramvya Province',36,NULL,NULL),(3194,'Karuzi Province',36,NULL,NULL),(3195,'Kirundo Province',36,NULL,NULL),(3196,'Bubanza Province',36,NULL,NULL),(3197,'Gitega Province',36,NULL,NULL),(3198,'Bujumbura Mairie Province',36,NULL,NULL),(3199,'Ngozi Province',36,NULL,NULL),(3200,'Bujumbura Rural Province',36,NULL,NULL),(3201,'Cankuzo Province',36,NULL,NULL),(3202,'Bururi Province',36,NULL,NULL),(3203,'Flores Department',235,NULL,NULL),(3204,'San José Department',235,NULL,NULL),(3205,'Artigas Department',235,NULL,NULL),(3206,'Maldonado Department',235,NULL,NULL),(3207,'Rivera Department',235,NULL,NULL),(3208,'Colonia Department',235,NULL,NULL),(3209,'Durazno Department',235,NULL,NULL),(3210,'Río Negro Department',235,NULL,NULL),(3211,'Cerro Largo Department',235,NULL,NULL),(3212,'Paysandú Department',235,NULL,NULL),(3213,'Canelones Department',235,NULL,NULL),(3214,'Treinta y Tres Department',235,NULL,NULL),(3215,'Lavalleja Department',235,NULL,NULL),(3216,'Rocha Department',235,NULL,NULL),(3217,'Florida Department',235,NULL,NULL),(3218,'Montevideo Department',235,NULL,NULL),(3219,'Soriano Department',235,NULL,NULL),(3220,'Salto Department',235,NULL,NULL),(3221,'Tacuarembó Department',235,NULL,NULL),(3222,'Kafr el-Sheikh',65,NULL,NULL),(3223,'Cairo',65,NULL,NULL),(3224,'Damietta',65,NULL,NULL),(3225,'Aswan',65,NULL,NULL),(3226,'Sohag',65,NULL,NULL),(3227,'North Sinai',65,NULL,NULL),(3228,'Monufia',65,NULL,NULL),(3229,'Port Said',65,NULL,NULL),(3230,'Beni Suef',65,NULL,NULL),(3231,'Matrouh',65,NULL,NULL),(3232,'Qalyubia',65,NULL,NULL),(3233,'Suez',65,NULL,NULL),(3234,'Gharbia',65,NULL,NULL),(3235,'Alexandria',65,NULL,NULL),(3236,'Asyut',65,NULL,NULL),(3237,'South Sinai',65,NULL,NULL),(3238,'Faiyum',65,NULL,NULL),(3239,'Giza',65,NULL,NULL),(3240,'Red Sea',65,NULL,NULL),(3241,'Beheira',65,NULL,NULL),(3242,'Luxor',65,NULL,NULL),(3243,'Minya',65,NULL,NULL),(3244,'Ismailia',65,NULL,NULL),(3245,'Dakahlia',65,NULL,NULL),(3246,'New Valley',65,NULL,NULL),(3247,'Qena',65,NULL,NULL),(3248,'Agaléga',140,NULL,NULL),(3249,'Rodrigues',140,NULL,NULL),(3250,'Pamplemousses District',140,NULL,NULL),(3251,'Cargados Carajos',140,NULL,NULL),(3252,'Vacoas-Phoenix',140,NULL,NULL),(3253,'Moka District',140,NULL,NULL),(3254,'Flacq District',140,NULL,NULL),(3255,'Curepipe',140,NULL,NULL),(3256,'Port Louis',140,NULL,NULL),(3257,'Savanne District',140,NULL,NULL),(3258,'Quatre Bornes',140,NULL,NULL),(3259,'Rivière Noire District',140,NULL,NULL),(3260,'Port Louis District',140,NULL,NULL),(3261,'Rivière du Rempart District',140,NULL,NULL),(3262,'Beau Bassin-Rose Hill',140,NULL,NULL),(3263,'Plaines Wilhems District',140,NULL,NULL),(3264,'Grand Port District',140,NULL,NULL),(3265,'Guelmim',149,NULL,NULL),(3266,'Aousserd (EH)',149,NULL,NULL),(3267,'Al Hoceïma',149,NULL,NULL),(3268,'Larache',149,NULL,NULL),(3269,'Ouarzazate',149,NULL,NULL),(3270,'Boulemane',149,NULL,NULL),(3271,'L\'Oriental',149,NULL,NULL),(3272,'Béni Mellal',149,NULL,NULL),(3274,'Chichaoua',149,NULL,NULL),(3275,'Boujdour (EH)',149,NULL,NULL),(3276,'Khémisset',149,NULL,NULL),(3277,'Tiznit',149,NULL,NULL),(3278,'Béni Mellal-Khénifra',149,NULL,NULL),(3279,'Sidi Kacem',149,NULL,NULL),(3280,'El Jadida',149,NULL,NULL),(3281,'Nador',149,NULL,NULL),(3282,'Settat',149,NULL,NULL),(3283,'Zagora',149,NULL,NULL),(3284,'Médiouna',149,NULL,NULL),(3285,'Berkane',149,NULL,NULL),(3286,'Tan-Tan (EH-partial)',149,NULL,NULL),(3287,'Nouaceur',149,NULL,NULL),(3288,'Marrakesh-Safi',149,NULL,NULL),(3289,'Sefrou',149,NULL,NULL),(3290,'Drâa-Tafilalet',149,NULL,NULL),(3291,'El Hajeb',149,NULL,NULL),(3292,'Es-Semara (EH-partial)',149,NULL,NULL),(3293,'Laâyoune (EH)',149,NULL,NULL),(3294,'Inezgane-Ait Melloul',149,NULL,NULL),(3295,'Souss-Massa',149,NULL,NULL),(3296,'Taza',149,NULL,NULL),(3297,'Assa-Zag (EH-partial)',149,NULL,NULL),(3298,'Laâyoune-Sakia El Hamra (EH-partial)',149,NULL,NULL),(3299,'Errachidia',149,NULL,NULL),(3300,'Fahs-Anjra',149,NULL,NULL),(3301,'Figuig',149,NULL,NULL),(3302,'Chtouka-Ait Baha',149,NULL,NULL),(3303,'Casablanca-Settat',149,NULL,NULL),(3304,'Benslimane',149,NULL,NULL),(3305,'Guelmim-Oued Noun (EH-partial)',149,NULL,NULL),(3306,'Dakhla-Oued Ed-Dahab (EH)',149,NULL,NULL),(3307,'Jerada',149,NULL,NULL),(3308,'Kénitra',149,NULL,NULL),(3309,'El Kelâa des Sraghna',149,NULL,NULL),(3310,'Chefchaouen',149,NULL,NULL),(3311,'Safi',149,NULL,NULL),(3312,'Tata',149,NULL,NULL),(3313,'Fès-Meknès',149,NULL,NULL),(3314,'Taroudannt',149,NULL,NULL),(3315,'Moulay Yacoub',149,NULL,NULL),(3316,'Essaouira',149,NULL,NULL),(3317,'Khénifra',149,NULL,NULL),(3318,'Tétouan',149,NULL,NULL),(3319,'Oued Ed-Dahab (EH)',149,NULL,NULL),(3320,'Al Haouz',149,NULL,NULL),(3321,'Azilal',149,NULL,NULL),(3322,'Taourirt',149,NULL,NULL),(3323,'Taounate',149,NULL,NULL),(3324,'Tanger-Tétouan-Al Hoceïma',149,NULL,NULL),(3325,'Ifrane',149,NULL,NULL),(3326,'Khouribga',149,NULL,NULL),(3327,'Cabo Delgado Province',150,NULL,NULL),(3328,'Zambezia Province',150,NULL,NULL),(3329,'Gaza Province',150,NULL,NULL),(3330,'Inhambane Province',150,NULL,NULL),(3331,'Sofala Province',150,NULL,NULL),(3332,'Maputo Province',150,NULL,NULL),(3333,'Niassa Province',150,NULL,NULL),(3334,'Tete Province',150,NULL,NULL),(3335,'Maputo',150,NULL,NULL),(3336,'Nampula Province',150,NULL,NULL),(3337,'Manica Province',150,NULL,NULL),(3338,'Hodh Ech Chargui',139,NULL,NULL),(3339,'Brakna',139,NULL,NULL),(3340,'Tiris Zemmour',139,NULL,NULL),(3341,'Gorgol',139,NULL,NULL),(3342,'Inchiri',139,NULL,NULL),(3343,'Nouakchott-Nord',139,NULL,NULL),(3344,'Adrar',139,NULL,NULL),(3345,'Tagant',139,NULL,NULL),(3346,'Dakhlet Nouadhibou',139,NULL,NULL),(3347,'Nouakchott-Sud',139,NULL,NULL),(3348,'Trarza',139,NULL,NULL),(3349,'Assaba',139,NULL,NULL),(3350,'Guidimaka',139,NULL,NULL),(3351,'Hodh El Gharbi',139,NULL,NULL),(3352,'Nouakchott-Ouest',139,NULL,NULL),(3353,'Western Tobago',223,NULL,NULL),(3354,'Couva-Tabaquite-Talparo Regional Corporation',223,NULL,NULL),(3355,'Eastern Tobago',223,NULL,NULL),(3356,'Rio Claro-Mayaro Regional Corporation',223,NULL,NULL),(3357,'San Juan-Laventille Regional Corporation',223,NULL,NULL),(3358,'Tunapuna-Piarco Regional Corporation',223,NULL,NULL),(3359,'San Fernando',223,NULL,NULL),(3360,'Point Fortin',223,NULL,NULL),(3361,'Sangre Grande Regional Corporation',223,NULL,NULL),(3362,'Arima',223,NULL,NULL),(3363,'Port of Spain',223,NULL,NULL),(3364,'Siparia Regional Corporation',223,NULL,NULL),(3365,'Penal-Debe Regional Corporation',223,NULL,NULL),(3366,'Chaguanas',223,NULL,NULL),(3367,'Diego Martin Regional Corporation',223,NULL,NULL),(3368,'Princes Town Regional Corporation',223,NULL,NULL),(3369,'Mary Region',226,NULL,NULL),(3370,'Lebap Region',226,NULL,NULL),(3371,'Ashgabat',226,NULL,NULL),(3372,'Balkan Region',226,NULL,NULL),(3373,'Daşoguz Region',226,NULL,NULL),(3374,'Ahal Region',226,NULL,NULL),(3375,'Beni Department',27,NULL,NULL),(3376,'Oruro Department',27,NULL,NULL),(3377,'Santa Cruz Department',27,NULL,NULL),(3378,'Tarija Department',27,NULL,NULL),(3379,'Pando Department',27,NULL,NULL),(3380,'La Paz Department',27,NULL,NULL),(3381,'Cochabamba Department',27,NULL,NULL),(3382,'Chuquisaca Department',27,NULL,NULL),(3383,'Potosí Department',27,NULL,NULL),(3384,'Saint George Parish',188,NULL,NULL),(3385,'Saint Patrick Parish',188,NULL,NULL),(3386,'Saint Andrew Parish',188,NULL,NULL),(3387,'Saint David Parish',188,NULL,NULL),(3388,'Grenadines Parish',188,NULL,NULL),(3389,'Charlotte Parish',188,NULL,NULL),(3390,'Sharjah Emirate',231,NULL,NULL),(3391,'Dubai',231,NULL,NULL),(3392,'Umm al-Quwain',231,NULL,NULL),(3393,'Fujairah',231,NULL,NULL),(3394,'Ras al-Khaimah',231,NULL,NULL),(3395,'Ajman Emirate',231,NULL,NULL),(3396,'Abu Dhabi Emirate',231,NULL,NULL),(3397,'districts of Republican Subordination',217,NULL,NULL),(3398,'Khatlon Province',217,NULL,NULL),(3399,'Gorno-Badakhshan Autonomous Province',217,NULL,NULL),(3400,'Sughd Province',217,NULL,NULL),(3402,'Yilan',216,NULL,NULL),(3403,'Penghu',216,NULL,NULL),(3404,'Changhua',216,NULL,NULL),(3405,'Pingtung',216,NULL,NULL),(3406,'Taichung',216,NULL,NULL),(3407,'Nantou',216,NULL,NULL),(3408,'Chiayi',216,NULL,NULL),(3410,'Taitung',216,NULL,NULL),(3411,'Hualien',216,NULL,NULL),(3412,'Kaohsiung',216,NULL,NULL),(3413,'Miaoli',216,NULL,NULL),(3415,'Kinmen',216,NULL,NULL),(3416,'Yunlin',216,NULL,NULL),(3417,'Hsinchu',216,NULL,NULL),(3418,'Chiayi',216,NULL,NULL),(3419,'Taoyuan',216,NULL,NULL),(3420,'Lienchiang',216,NULL,NULL),(3421,'Tainan',216,NULL,NULL),(3422,'Taipei',216,NULL,NULL),(3423,'Hsinchu',216,NULL,NULL),(3424,'Northern Red Sea Region',68,NULL,NULL),(3425,'Anseba Region',68,NULL,NULL),(3426,'Maekel Region',68,NULL,NULL),(3427,'Debub Region',68,NULL,NULL),(3428,'Gash-Barka Region',68,NULL,NULL),(3429,'Southern Red Sea Region',68,NULL,NULL),(3430,'Southern Peninsula Region',100,NULL,NULL),(3431,'Capital Region',100,NULL,NULL),(3432,'Westfjords',100,NULL,NULL),(3433,'Eastern Region',100,NULL,NULL),(3434,'Southern Region',100,NULL,NULL),(3435,'Northwestern Region',100,NULL,NULL),(3436,'Western Region',100,NULL,NULL),(3437,'Northeastern Region',100,NULL,NULL),(3438,'Río Muni',67,NULL,NULL),(3439,'Kié-Ntem Province',67,NULL,NULL),(3440,'Wele-Nzas Province',67,NULL,NULL),(3441,'Litoral Province',67,NULL,NULL),(3442,'Insular Region',67,NULL,NULL),(3443,'Bioko Sur Province',67,NULL,NULL),(3444,'Annobón Province',67,NULL,NULL),(3445,'Centro Sur Province',67,NULL,NULL),(3446,'Bioko Norte Province',67,NULL,NULL),(3447,'Chihuahua',142,NULL,NULL),(3448,'Oaxaca',142,NULL,NULL),(3449,'Sinaloa',142,NULL,NULL),(3450,'Estado de México',142,NULL,NULL),(3451,'Chiapas',142,NULL,NULL),(3452,'Nuevo León',142,NULL,NULL),(3453,'Durango',142,NULL,NULL),(3454,'Tabasco',142,NULL,NULL),(3455,'Querétaro',142,NULL,NULL),(3456,'Aguascalientes',142,NULL,NULL),(3457,'Baja California',142,NULL,NULL),(3458,'Tlaxcala',142,NULL,NULL),(3459,'Guerrero',142,NULL,NULL),(3460,'Baja California Sur',142,NULL,NULL),(3461,'San Luis Potosí',142,NULL,NULL),(3462,'Zacatecas',142,NULL,NULL),(3463,'Tamaulipas',142,NULL,NULL),(3464,'Veracruz de Ignacio de la Llave',142,NULL,NULL),(3465,'Morelos',142,NULL,NULL),(3466,'Yucatán',142,NULL,NULL),(3467,'Quintana Roo',142,NULL,NULL),(3468,'Sonora',142,NULL,NULL),(3469,'Guanajuato',142,NULL,NULL),(3470,'Hidalgo',142,NULL,NULL),(3471,'Coahuila de Zaragoza',142,NULL,NULL),(3472,'Colima',142,NULL,NULL),(3473,'Ciudad de México',142,NULL,NULL),(3474,'Michoacán de Ocampo',142,NULL,NULL),(3475,'Campeche',142,NULL,NULL),(3476,'Puebla',142,NULL,NULL),(3477,'Nayarit',142,NULL,NULL),(3478,'Krabi',219,NULL,NULL),(3479,'Ranong',219,NULL,NULL),(3480,'Nong Bua Lam Phu',219,NULL,NULL),(3481,'Samut Prakan',219,NULL,NULL),(3482,'Surat Thani',219,NULL,NULL),(3483,'Lamphun',219,NULL,NULL),(3484,'Nong Khai',219,NULL,NULL),(3485,'Khon Kaen',219,NULL,NULL),(3486,'Chanthaburi',219,NULL,NULL),(3487,'Saraburi',219,NULL,NULL),(3488,'Phatthalung',219,NULL,NULL),(3489,'Uttaradit',219,NULL,NULL),(3490,'Sing Buri',219,NULL,NULL),(3491,'Chiang Mai',219,NULL,NULL),(3492,'Nakhon Sawan',219,NULL,NULL),(3493,'Yala',219,NULL,NULL),(3494,'Phra Nakhon Si Ayutthaya',219,NULL,NULL),(3495,'Nonthaburi',219,NULL,NULL),(3496,'Trat',219,NULL,NULL),(3497,'Nakhon Ratchasima',219,NULL,NULL),(3498,'Chiang Rai',219,NULL,NULL),(3499,'Ratchaburi',219,NULL,NULL),(3500,'Pathum Thani',219,NULL,NULL),(3501,'Sakon Nakhon',219,NULL,NULL),(3502,'Samut Songkhram',219,NULL,NULL),(3503,'Nakhon Pathom',219,NULL,NULL),(3504,'Samut Sakhon',219,NULL,NULL),(3505,'Mae Hong Son',219,NULL,NULL),(3506,'Phitsanulok',219,NULL,NULL),(3507,'Pattaya',219,NULL,NULL),(3508,'Prachuap Khiri Khan',219,NULL,NULL),(3509,'Loei',219,NULL,NULL),(3510,'Roi Et',219,NULL,NULL),(3511,'Kanchanaburi',219,NULL,NULL),(3512,'Ubon Ratchathani',219,NULL,NULL),(3513,'Chon Buri',219,NULL,NULL),(3514,'Phichit',219,NULL,NULL),(3515,'Phetchabun',219,NULL,NULL),(3516,'Kamphaeng Phet',219,NULL,NULL),(3517,'Maha Sarakham',219,NULL,NULL),(3518,'Rayong',219,NULL,NULL),(3519,'Ang Thong',219,NULL,NULL),(3520,'Nakhon Si Thammarat',219,NULL,NULL),(3521,'Yasothon',219,NULL,NULL),(3522,'Chai Nat',219,NULL,NULL),(3523,'Amnat Charoen',219,NULL,NULL),(3524,'Suphan Buri',219,NULL,NULL),(3525,'Tak',219,NULL,NULL),(3526,'Chumphon',219,NULL,NULL),(3527,'Udon Thani',219,NULL,NULL),(3528,'Phrae',219,NULL,NULL),(3529,'Sa Kaeo',219,NULL,NULL),(3530,'Nan',219,NULL,NULL),(3531,'Surin',219,NULL,NULL),(3532,'Phetchaburi',219,NULL,NULL),(3533,'Bueng Kan',219,NULL,NULL),(3534,'Buri Ram',219,NULL,NULL),(3535,'Nakhon Nayok',219,NULL,NULL),(3536,'Phuket',219,NULL,NULL),(3537,'Satun',219,NULL,NULL),(3538,'Phayao',219,NULL,NULL),(3539,'Songkhla',219,NULL,NULL),(3540,'Pattani',219,NULL,NULL),(3541,'Trang',219,NULL,NULL),(3542,'Prachin Buri',219,NULL,NULL),(3543,'Lop Buri',219,NULL,NULL),(3544,'Lampang',219,NULL,NULL),(3545,'Sukhothai',219,NULL,NULL),(3546,'Mukdahan',219,NULL,NULL),(3547,'Si Sa Ket',219,NULL,NULL),(3548,'Nakhon Phanom',219,NULL,NULL),(3549,'Phangnga',219,NULL,NULL),(3550,'Kalasin',219,NULL,NULL),(3551,'Uthai Thani',219,NULL,NULL),(3552,'Chachoengsao',219,NULL,NULL),(3553,'Narathiwat',219,NULL,NULL),(3554,'Bangkok',219,NULL,NULL),(3555,'Hiiu County',69,NULL,NULL),(3556,'Viljandi County',69,NULL,NULL),(3557,'Tartu County',69,NULL,NULL),(3558,'Valga County',69,NULL,NULL),(3559,'Rapla County',69,NULL,NULL),(3560,'Võru County',69,NULL,NULL),(3561,'Saare County',69,NULL,NULL),(3562,'Pärnu County',69,NULL,NULL),(3563,'Põlva County',69,NULL,NULL),(3564,'Lääne-Viru County',69,NULL,NULL),(3565,'Jõgeva County',69,NULL,NULL),(3566,'Järva County',69,NULL,NULL),(3567,'Harju County',69,NULL,NULL),(3568,'Lääne County',69,NULL,NULL),(3569,'Ida-Viru County',69,NULL,NULL),(3570,'Moyen-Chari Region',43,NULL,NULL),(3571,'Mayo-Kebbi Ouest Region',43,NULL,NULL),(3572,'Sila Region',43,NULL,NULL),(3573,'Hadjer-Lamis',43,NULL,NULL),(3574,'Borkou',43,NULL,NULL),(3575,'Ennedi-Est',43,NULL,NULL),(3576,'Guéra Region',43,NULL,NULL),(3577,'Lac Region',43,NULL,NULL),(3578,'Ennedi Region',43,NULL,NULL),(3579,'Tandjilé Region',43,NULL,NULL),(3580,'Mayo-Kebbi Est Region',43,NULL,NULL),(3581,'Wadi Fira Region',43,NULL,NULL),(3582,'Ouaddaï Region',43,NULL,NULL),(3583,'Bahr el Gazel',43,NULL,NULL),(3584,'Ennedi-Ouest',43,NULL,NULL),(3585,'Logone Occidental Region',43,NULL,NULL),(3586,'N\'Djamena',43,NULL,NULL),(3587,'Tibesti Region',43,NULL,NULL),(3588,'Kanem Region',43,NULL,NULL),(3589,'Mandoul Region',43,NULL,NULL),(3590,'Batha Region',43,NULL,NULL),(3591,'Logone Oriental Region',43,NULL,NULL),(3592,'Salamat Region',43,NULL,NULL),(3593,'Berry Islands',17,NULL,NULL),(3594,'Nichollstown and Berry Islands',17,NULL,NULL),(3595,'Green Turtle Cay',17,NULL,NULL),(3596,'Central Eleuthera',17,NULL,NULL),(3597,'Governor\'s Harbour',17,NULL,NULL),(3598,'High Rock',17,NULL,NULL),(3599,'West Grand Bahama',17,NULL,NULL),(3600,'Rum Cay District',17,NULL,NULL),(3601,'Acklins',17,NULL,NULL),(3602,'North Eleuthera',17,NULL,NULL),(3603,'Central Abaco',17,NULL,NULL),(3604,'Marsh Harbour',17,NULL,NULL),(3605,'Black Point',17,NULL,NULL),(3606,'Sandy Point',17,NULL,NULL),(3607,'South Eleuthera',17,NULL,NULL),(3608,'South Abaco',17,NULL,NULL),(3609,'Inagua',17,NULL,NULL),(3610,'Long Island',17,NULL,NULL),(3611,'Cat Island',17,NULL,NULL),(3612,'Exuma',17,NULL,NULL),(3613,'Harbour Island',17,NULL,NULL),(3614,'East Grand Bahama',17,NULL,NULL),(3615,'Ragged Island',17,NULL,NULL),(3616,'North Abaco',17,NULL,NULL),(3617,'North Andros',17,NULL,NULL),(3618,'Kemps Bay',17,NULL,NULL),(3619,'Fresh Creek',17,NULL,NULL),(3620,'San Salvador and Rum Cay',17,NULL,NULL),(3621,'Crooked Island',17,NULL,NULL),(3622,'South Andros',17,NULL,NULL),(3623,'Rock Sound',17,NULL,NULL),(3624,'Hope Town',17,NULL,NULL),(3625,'Mangrove Cay',17,NULL,NULL),(3626,'Freeport',17,NULL,NULL),(3627,'San Salvador Island',17,NULL,NULL),(3628,'Acklins and Crooked Islands',17,NULL,NULL),(3629,'Bimini',17,NULL,NULL),(3630,'Spanish Wells',17,NULL,NULL),(3631,'Central Andros',17,NULL,NULL),(3632,'Grand Cay',17,NULL,NULL),(3633,'Mayaguana District',17,NULL,NULL),(3634,'San Juan',11,NULL,NULL),(3635,'Santiago del Estero',11,NULL,NULL),(3636,'San Luis',11,NULL,NULL),(3637,'Tucumán',11,NULL,NULL),(3638,'Corrientes',11,NULL,NULL),(3639,'Río Negro',11,NULL,NULL),(3640,'Chaco',11,NULL,NULL),(3641,'Santa Fe',11,NULL,NULL),(3642,'Córdoba',11,NULL,NULL),(3643,'Salta',11,NULL,NULL),(3644,'Misiones',11,NULL,NULL),(3645,'Jujuy',11,NULL,NULL),(3646,'Mendoza',11,NULL,NULL),(3647,'Catamarca',11,NULL,NULL),(3648,'Neuquén',11,NULL,NULL),(3649,'Santa Cruz',11,NULL,NULL),(3650,'Tierra del Fuego',11,NULL,NULL),(3651,'Chubut',11,NULL,NULL),(3652,'Formosa',11,NULL,NULL),(3653,'La Rioja',11,NULL,NULL),(3654,'Entre Ríos',11,NULL,NULL),(3655,'La Pampa',11,NULL,NULL),(3656,'Buenos Aires',11,NULL,NULL),(3657,'Quiché Department',90,NULL,NULL),(3658,'Jalapa Department',90,NULL,NULL),(3659,'Izabal Department',90,NULL,NULL),(3660,'Suchitepéquez Department',90,NULL,NULL),(3661,'Sololá Department',90,NULL,NULL),(3662,'El Progreso Department',90,NULL,NULL),(3663,'Totonicapán Department',90,NULL,NULL),(3664,'Retalhuleu Department',90,NULL,NULL),(3665,'Santa Rosa Department',90,NULL,NULL),(3666,'Chiquimula Department',90,NULL,NULL),(3667,'San Marcos Department',90,NULL,NULL),(3668,'Quetzaltenango Department',90,NULL,NULL),(3669,'Petén Department',90,NULL,NULL),(3670,'Huehuetenango Department',90,NULL,NULL),(3671,'Alta Verapaz Department',90,NULL,NULL),(3672,'Guatemala Department',90,NULL,NULL),(3673,'Jutiapa Department',90,NULL,NULL),(3674,'Baja Verapaz Department',90,NULL,NULL),(3675,'Chimaltenango Department',90,NULL,NULL),(3676,'Sacatepéquez Department',90,NULL,NULL),(3677,'Escuintla Department',90,NULL,NULL),(3678,'Madre de Dios',173,NULL,NULL),(3679,'Huancavelica',173,NULL,NULL),(3680,'Áncash',173,NULL,NULL),(3681,'Arequipa',173,NULL,NULL),(3682,'Puno',173,NULL,NULL),(3683,'La Libertad',173,NULL,NULL),(3684,'Ucayali',173,NULL,NULL),(3685,'Amazonas',173,NULL,NULL),(3686,'Pasco',173,NULL,NULL),(3687,'Huanuco',173,NULL,NULL),(3688,'Cajamarca',173,NULL,NULL),(3689,'Tumbes',173,NULL,NULL),(3691,'Cusco',173,NULL,NULL),(3692,'Ayacucho',173,NULL,NULL),(3693,'Junín',173,NULL,NULL),(3694,'San Martín',173,NULL,NULL),(3695,'Lima',173,NULL,NULL),(3696,'Tacna',173,NULL,NULL),(3697,'Piura',173,NULL,NULL),(3698,'Moquegua',173,NULL,NULL),(3699,'Apurímac',173,NULL,NULL),(3700,'Ica',173,NULL,NULL),(3701,'Callao',173,NULL,NULL),(3702,'Lambayeque',173,NULL,NULL),(3703,'Redonda',10,NULL,NULL),(3704,'Saint Peter Parish',10,NULL,NULL),(3705,'Saint Paul Parish',10,NULL,NULL),(3706,'Saint John Parish',10,NULL,NULL),(3707,'Saint Mary Parish',10,NULL,NULL),(3708,'Barbuda',10,NULL,NULL),(3709,'Saint George Parish',10,NULL,NULL),(3710,'Saint Philip Parish',10,NULL,NULL),(3711,'South Bačka District',196,NULL,NULL),(3712,'Pirot District',196,NULL,NULL),(3713,'South Banat District',196,NULL,NULL),(3714,'North Bačka District',196,NULL,NULL),(3715,'Jablanica District',196,NULL,NULL),(3716,'Central Banat District',196,NULL,NULL),(3717,'Bor District',196,NULL,NULL),(3718,'Toplica District',196,NULL,NULL),(3719,'Mačva District',196,NULL,NULL),(3720,'Rasina District',196,NULL,NULL),(3721,'Pčinja District',196,NULL,NULL),(3722,'Nišava District',196,NULL,NULL),(3723,'Prizren District',248,NULL,NULL),(3724,'Kolubara District',196,NULL,NULL),(3725,'Raška District',196,NULL,NULL),(3726,'West Bačka District',196,NULL,NULL),(3727,'Moravica District',196,NULL,NULL),(3728,'Belgrade',196,NULL,NULL),(3729,'Zlatibor District',196,NULL,NULL),(3731,'Zaječar District',196,NULL,NULL),(3732,'Braničevo District',196,NULL,NULL),(3733,'Vojvodina',196,NULL,NULL),(3734,'Šumadija District',196,NULL,NULL),(3736,'North Banat District',196,NULL,NULL),(3737,'Pomoravlje District',196,NULL,NULL),(3738,'Peć District',248,NULL,NULL),(3740,'Srem District',196,NULL,NULL),(3741,'Podunavlje District',196,NULL,NULL),(3742,'Westmoreland Parish',108,NULL,NULL),(3743,'Saint Elizabeth Parish',108,NULL,NULL),(3744,'Saint Ann Parish',108,NULL,NULL),(3745,'Saint James Parish',108,NULL,NULL),(3746,'Saint Catherine Parish',108,NULL,NULL),(3747,'Saint Mary Parish',108,NULL,NULL),(3748,'Kingston Parish',108,NULL,NULL),(3749,'Hanover Parish',108,NULL,NULL),(3750,'Saint Thomas Parish',108,NULL,NULL),(3751,'Saint Andrew',108,NULL,NULL),(3752,'Portland Parish',108,NULL,NULL),(3753,'Clarendon Parish',108,NULL,NULL),(3754,'Manchester Parish',108,NULL,NULL),(3755,'Trelawny Parish',108,NULL,NULL),(3756,'Dennery Quarter',186,NULL,NULL),(3757,'Anse la Raye Quarter',186,NULL,NULL),(3758,'Castries Quarter',186,NULL,NULL),(3759,'Laborie Quarter',186,NULL,NULL),(3760,'Choiseul Quarter',186,NULL,NULL),(3761,'Canaries',186,NULL,NULL),(3762,'Micoud Quarter',186,NULL,NULL),(3763,'Vieux Fort Quarter',186,NULL,NULL),(3764,'Soufrière Quarter',186,NULL,NULL),(3765,'Praslin Quarter',186,NULL,NULL),(3766,'Gros Islet Quarter',186,NULL,NULL),(3767,'Dauphin Quarter',186,NULL,NULL),(3768,'Hưng Yên',240,NULL,NULL),(3769,'Đồng Tháp',240,NULL,NULL),(3770,'Bà Rịa-Vũng Tàu',240,NULL,NULL),(3771,'Thanh Hóa',240,NULL,NULL),(3772,'Kon Tum',240,NULL,NULL),(3773,'Điện Biên',240,NULL,NULL),(3774,'Vĩnh Phúc',240,NULL,NULL),(3775,'Thái Bình',240,NULL,NULL),(3776,'Quảng Nam',240,NULL,NULL),(3777,'Hậu Giang',240,NULL,NULL),(3778,'Cà Mau',240,NULL,NULL),(3779,'Hà Giang',240,NULL,NULL),(3780,'Nghệ An',240,NULL,NULL),(3781,'Tiền Giang',240,NULL,NULL),(3782,'Cao Bằng',240,NULL,NULL),(3783,'Hải Phòng',240,NULL,NULL),(3784,'Yên Bái',240,NULL,NULL),(3785,'Bình Dương',240,NULL,NULL),(3786,'Ninh Bình',240,NULL,NULL),(3787,'Bình Thuận',240,NULL,NULL),(3788,'Ninh Thuận',240,NULL,NULL),(3789,'Nam Định',240,NULL,NULL),(3790,'Vĩnh Long',240,NULL,NULL),(3791,'Bắc Ninh',240,NULL,NULL),(3792,'Lạng Sơn',240,NULL,NULL),(3793,'Khánh Hòa',240,NULL,NULL),(3794,'An Giang',240,NULL,NULL),(3795,'Tuyên Quang',240,NULL,NULL),(3796,'Bến Tre',240,NULL,NULL),(3797,'Bình Phước',240,NULL,NULL),(3798,'Thừa Thiên-Huế',240,NULL,NULL),(3799,'Hòa Bình',240,NULL,NULL),(3800,'Kiên Giang',240,NULL,NULL),(3801,'Phú Thọ',240,NULL,NULL),(3802,'Hà Nam',240,NULL,NULL),(3803,'Quảng Trị',240,NULL,NULL),(3804,'Bạc Liêu',240,NULL,NULL),(3805,'Trà Vinh',240,NULL,NULL),(3806,'Đà Nẵng',240,NULL,NULL),(3807,'Thái Nguyên',240,NULL,NULL),(3808,'Long An',240,NULL,NULL),(3809,'Quảng Bình',240,NULL,NULL),(3810,'Hà Nội',240,NULL,NULL),(3811,'Hồ Chí Minh',240,NULL,NULL),(3812,'Sơn La',240,NULL,NULL),(3813,'Gia Lai',240,NULL,NULL),(3814,'Quảng Ninh',240,NULL,NULL),(3815,'Bắc Giang',240,NULL,NULL),(3816,'Hà Tĩnh',240,NULL,NULL),(3817,'Lào Cai',240,NULL,NULL),(3818,'Lâm Đồng',240,NULL,NULL),(3819,'Sóc Trăng',240,NULL,NULL),(3821,'Đồng Nai',240,NULL,NULL),(3822,'Bắc Kạn',240,NULL,NULL),(3823,'Đắk Nông',240,NULL,NULL),(3824,'Phú Yên',240,NULL,NULL),(3825,'Lai Châu',240,NULL,NULL),(3826,'Tây Ninh',240,NULL,NULL),(3827,'Hải Dương',240,NULL,NULL),(3828,'Quảng Ngãi',240,NULL,NULL),(3829,'Đắk Lắk',240,NULL,NULL),(3830,'Bình Định',240,NULL,NULL),(3831,'Saint Peter Basseterre Parish',185,NULL,NULL),(3832,'Nevis',185,NULL,NULL),(3833,'Christ Church Nichola Town Parish',185,NULL,NULL),(3834,'Saint Paul Capisterre Parish',185,NULL,NULL),(3835,'Saint James Windward Parish',185,NULL,NULL),(3836,'Saint Anne Sandy Point Parish',185,NULL,NULL),(3837,'Saint George Gingerland Parish',185,NULL,NULL),(3838,'Saint Paul Charlestown Parish',185,NULL,NULL),(3839,'Saint Thomas Lowland Parish',185,NULL,NULL),(3840,'Saint John Figtree Parish',185,NULL,NULL),(3841,'Saint Kitts',185,NULL,NULL),(3842,'Saint Thomas Middle Island Parish',185,NULL,NULL),(3843,'Trinity Palmetto Point Parish',185,NULL,NULL),(3844,'Saint Mary Cayon Parish',185,NULL,NULL),(3845,'Saint John Capisterre Parish',185,NULL,NULL),(3846,'Daegu',116,NULL,NULL),(3847,'Gyeonggi Province',116,NULL,NULL),(3848,'Incheon',116,NULL,NULL),(3849,'Seoul',116,NULL,NULL),(3850,'Daejeon',116,NULL,NULL),(3851,'North Jeolla Province',116,NULL,NULL),(3852,'Ulsan',116,NULL,NULL),(3853,'Jeju',116,NULL,NULL),(3854,'North Chungcheong Province',116,NULL,NULL),(3855,'North Gyeongsang Province',116,NULL,NULL),(3856,'South Jeolla Province',116,NULL,NULL),(3857,'South Gyeongsang Province',116,NULL,NULL),(3858,'Gwangju',116,NULL,NULL),(3859,'South Chungcheong Province',116,NULL,NULL),(3860,'Busan',116,NULL,NULL),(3861,'Sejong City',116,NULL,NULL),(3862,'Gangwon Province',116,NULL,NULL),(3863,'Saint Patrick Parish',87,NULL,NULL),(3864,'Saint George Parish',87,NULL,NULL),(3865,'Saint Andrew Parish',87,NULL,NULL),(3866,'Saint Mark Parish',87,NULL,NULL),(3867,'Carriacou and Petite Martinique',87,NULL,NULL),(3868,'Saint John Parish',87,NULL,NULL),(3869,'Saint David Parish',87,NULL,NULL),(3870,'Ghazni',1,NULL,NULL),(3871,'Badghis',1,NULL,NULL),(3872,'Bamyan',1,NULL,NULL),(3873,'Helmand',1,NULL,NULL),(3874,'Zabul',1,NULL,NULL),(3875,'Baghlan',1,NULL,NULL),(3876,'Kunar',1,NULL,NULL),(3877,'Paktika',1,NULL,NULL),(3878,'Khost',1,NULL,NULL),(3879,'Kapisa',1,NULL,NULL),(3880,'Nuristan',1,NULL,NULL),(3881,'Panjshir',1,NULL,NULL),(3882,'Nangarhar',1,NULL,NULL),(3883,'Samangan',1,NULL,NULL),(3884,'Balkh',1,NULL,NULL),(3885,'Sar-e Pol',1,NULL,NULL),(3886,'Jowzjan',1,NULL,NULL),(3887,'Herat',1,NULL,NULL),(3888,'Ghōr',1,NULL,NULL),(3889,'Faryab',1,NULL,NULL),(3890,'Kandahar',1,NULL,NULL),(3891,'Laghman',1,NULL,NULL),(3892,'Daykundi',1,NULL,NULL),(3893,'Takhar',1,NULL,NULL),(3894,'Paktia',1,NULL,NULL),(3895,'Parwan',1,NULL,NULL),(3896,'Nimruz',1,NULL,NULL),(3897,'Logar',1,NULL,NULL),(3898,'Urozgan',1,NULL,NULL),(3899,'Farah',1,NULL,NULL),(3900,'Kunduz Province',1,NULL,NULL),(3901,'Badakhshan',1,NULL,NULL),(3902,'Kabul',1,NULL,NULL),(3903,'Victoria',14,NULL,NULL),(3904,'South Australia',14,NULL,NULL),(3905,'Queensland',14,NULL,NULL),(3906,'Western Australia',14,NULL,NULL),(3907,'Australian Capital Territory',14,NULL,NULL),(3908,'Tasmania',14,NULL,NULL),(3909,'New South Wales',14,NULL,NULL),(3910,'Northern Territory',14,NULL,NULL),(3911,'Vavaʻu',222,NULL,NULL),(3912,'Tongatapu',222,NULL,NULL),(3913,'Haʻapai',222,NULL,NULL),(3914,'Niuas',222,NULL,NULL),(3915,'ʻEua',222,NULL,NULL),(3916,'Markazi',103,NULL,NULL),(3917,'Khuzestan',103,NULL,NULL),(3918,'Ilam',103,NULL,NULL),(3919,'Kermanshah',103,NULL,NULL),(3920,'Gilan',103,NULL,NULL),(3921,'Chaharmahal and Bakhtiari',103,NULL,NULL),(3922,'Qom',103,NULL,NULL),(3923,'Isfahan',103,NULL,NULL),(3924,'West Azarbaijan',103,NULL,NULL),(3925,'Zanjan',103,NULL,NULL),(3926,'Kohgiluyeh and Boyer-Ahmad',103,NULL,NULL),(3927,'Razavi Khorasan',103,NULL,NULL),(3928,'Lorestan',103,NULL,NULL),(3929,'Alborz',103,NULL,NULL),(3930,'South Khorasan',103,NULL,NULL),(3931,'Sistan and Baluchestan',103,NULL,NULL),(3932,'Bushehr',103,NULL,NULL),(3933,'Golestan',103,NULL,NULL),(3934,'Ardabil',103,NULL,NULL),(3935,'Kurdistan',103,NULL,NULL),(3936,'Yazd',103,NULL,NULL),(3937,'Hormozgan',103,NULL,NULL),(3938,'Mazandaran',103,NULL,NULL),(3939,'Fars',103,NULL,NULL),(3940,'Semnan',103,NULL,NULL),(3941,'Qazvin',103,NULL,NULL),(3942,'North Khorasan',103,NULL,NULL),(3943,'Kerman',103,NULL,NULL),(3944,'East Azerbaijan',103,NULL,NULL),(3945,'Tehran',103,NULL,NULL),(3946,'Niutao Island Council',228,NULL,NULL),(3947,'Nanumanga',228,NULL,NULL),(3948,'Nui',228,NULL,NULL),(3949,'Nanumea',228,NULL,NULL),(3950,'Vaitupu',228,NULL,NULL),(3951,'Funafuti',228,NULL,NULL),(3952,'Nukufetau',228,NULL,NULL),(3953,'Nukulaelae',228,NULL,NULL),(3954,'Dhi Qar Governorate',104,NULL,NULL),(3955,'Babylon Governorate',104,NULL,NULL),(3956,'Al-Qādisiyyah Governorate',104,NULL,NULL),(3957,'Karbala Governorate',104,NULL,NULL),(3958,'Al Muthanna Governorate',104,NULL,NULL),(3959,'Baghdad Governorate',104,NULL,NULL),(3960,'Basra Governorate',104,NULL,NULL),(3961,'Saladin Governorate',104,NULL,NULL),(3962,'Najaf Governorate',104,NULL,NULL),(3963,'Nineveh Governorate',104,NULL,NULL),(3964,'Al Anbar Governorate',104,NULL,NULL),(3965,'Diyala Governorate',104,NULL,NULL),(3966,'Maysan Governorate',104,NULL,NULL),(3967,'Dohuk Governorate',104,NULL,NULL),(3968,'Erbil Governorate',104,NULL,NULL),(3969,'Sulaymaniyah Governorate',104,NULL,NULL),(3970,'Wasit Governorate',104,NULL,NULL),(3971,'Kirkuk Governorate',104,NULL,NULL),(3972,'Svay Rieng',37,NULL,NULL),(3973,'Preah Vihear',37,NULL,NULL),(3974,'Prey Veng',37,NULL,NULL),(3975,'Takeo',37,NULL,NULL),(3976,'Battambang',37,NULL,NULL),(3977,'Pursat',37,NULL,NULL),(3978,'Kep',37,NULL,NULL),(3979,'Kampong Chhnang',37,NULL,NULL),(3980,'Pailin',37,NULL,NULL),(3981,'Kampot',37,NULL,NULL),(3982,'Koh Kong',37,NULL,NULL),(3983,'Kandal',37,NULL,NULL),(3984,'Banteay Meanchey',37,NULL,NULL),(3985,'Mondulkiri',37,NULL,NULL),(3986,'Kratie',37,NULL,NULL),(3987,'Oddar Meanchey',37,NULL,NULL),(3988,'Kampong Speu',37,NULL,NULL),(3989,'Sihanoukville',37,NULL,NULL),(3990,'Ratanakiri',37,NULL,NULL),(3991,'Kampong Cham',37,NULL,NULL),(3992,'Siem Reap',37,NULL,NULL),(3993,'Stung Treng',37,NULL,NULL),(3994,'Phnom Penh',37,NULL,NULL),(3995,'North Hamgyong Province',115,NULL,NULL),(3996,'Ryanggang Province',115,NULL,NULL),(3997,'South Pyongan Province',115,NULL,NULL),(3998,'Chagang Province',115,NULL,NULL),(3999,'Kangwon Province',115,NULL,NULL),(4000,'South Hamgyong Province',115,NULL,NULL),(4001,'Rason',115,NULL,NULL),(4002,'North Pyongan Province',115,NULL,NULL),(4003,'South Hwanghae Province',115,NULL,NULL),(4004,'North Hwanghae Province',115,NULL,NULL),(4005,'Pyongyang',115,NULL,NULL),(4006,'Meghalaya',101,NULL,NULL),(4007,'Haryana',101,NULL,NULL),(4008,'Maharashtra',101,NULL,NULL),(4009,'Goa',101,NULL,NULL),(4010,'Manipur',101,NULL,NULL),(4011,'Puducherry',101,NULL,NULL),(4012,'Telangana',101,NULL,NULL),(4013,'Odisha',101,NULL,NULL),(4014,'Rajasthan',101,NULL,NULL),(4015,'Punjab',101,NULL,NULL),(4016,'Uttarakhand',101,NULL,NULL),(4017,'Andhra Pradesh',101,NULL,NULL),(4018,'Nagaland',101,NULL,NULL),(4019,'Lakshadweep',101,NULL,NULL),(4020,'Himachal Pradesh',101,NULL,NULL),(4021,'Delhi',101,NULL,NULL),(4022,'Uttar Pradesh',101,NULL,NULL),(4023,'Andaman and Nicobar Islands',101,NULL,NULL),(4024,'Arunachal Pradesh',101,NULL,NULL),(4025,'Jharkhand',101,NULL,NULL),(4026,'Karnataka',101,NULL,NULL),(4027,'Assam',101,NULL,NULL),(4028,'Kerala',101,NULL,NULL),(4029,'Jammu and Kashmir',101,NULL,NULL),(4030,'Gujarat',101,NULL,NULL),(4031,'Chandigarh',101,NULL,NULL),(4033,'Dadra and Nagar Haveli and Daman and Diu',101,NULL,NULL),(4034,'Sikkim',101,NULL,NULL),(4035,'Tamil Nadu',101,NULL,NULL),(4036,'Mizoram',101,NULL,NULL),(4037,'Bihar',101,NULL,NULL),(4038,'Tripura',101,NULL,NULL),(4039,'Madhya Pradesh',101,NULL,NULL),(4040,'Chhattisgarh',101,NULL,NULL),(4041,'Choluteca Department',97,NULL,NULL),(4042,'Comayagua Department',97,NULL,NULL),(4043,'El Paraíso Department',97,NULL,NULL),(4044,'Intibucá Department',97,NULL,NULL),(4045,'Bay Islands Department',97,NULL,NULL),(4046,'Cortés Department',97,NULL,NULL),(4047,'Atlántida Department',97,NULL,NULL),(4048,'Gracias a Dios Department',97,NULL,NULL),(4049,'Copán Department',97,NULL,NULL),(4050,'Olancho Department',97,NULL,NULL),(4051,'Colón Department',97,NULL,NULL),(4052,'Francisco Morazán Department',97,NULL,NULL),(4053,'Santa Bárbara Department',97,NULL,NULL),(4054,'Lempira Department',97,NULL,NULL),(4055,'Valle Department',97,NULL,NULL),(4056,'Ocotepeque Department',97,NULL,NULL),(4057,'Yoro Department',97,NULL,NULL),(4058,'La Paz Department',97,NULL,NULL),(4059,'Northland Region',158,NULL,NULL),(4060,'Manawatu-Wanganui Region',158,NULL,NULL),(4061,'Waikato Region',158,NULL,NULL),(4062,'Otago Region',158,NULL,NULL),(4063,'Marlborough Region',158,NULL,NULL),(4064,'West Coast Region',158,NULL,NULL),(4065,'Wellington Region',158,NULL,NULL),(4066,'Canterbury Region',158,NULL,NULL),(4067,'Chatham Islands',158,NULL,NULL),(4068,'Gisborne District',158,NULL,NULL),(4069,'Taranaki Region',158,NULL,NULL),(4070,'Nelson Region',158,NULL,NULL),(4071,'Southland Region',158,NULL,NULL),(4072,'Auckland Region',158,NULL,NULL),(4073,'Tasman District',158,NULL,NULL),(4074,'Bay of Plenty Region',158,NULL,NULL),(4075,'Hawke\'s Bay Region',158,NULL,NULL),(4076,'Saint John Parish',61,NULL,NULL),(4077,'Saint Mark Parish',61,NULL,NULL),(4078,'Saint David Parish',61,NULL,NULL),(4079,'Saint George Parish',61,NULL,NULL),(4080,'Saint Patrick Parish',61,NULL,NULL),(4081,'Saint Peter Parish',61,NULL,NULL),(4082,'Saint Andrew Parish',61,NULL,NULL),(4083,'Saint Luke Parish',61,NULL,NULL),(4084,'Saint Paul Parish',61,NULL,NULL),(4085,'Saint Joseph Parish',61,NULL,NULL),(4086,'El Seibo Province',62,NULL,NULL),(4087,'La Romana Province',62,NULL,NULL),(4088,'Sánchez Ramírez Province',62,NULL,NULL),(4089,'Hermanas Mirabal Province',62,NULL,NULL),(4090,'Barahona Province',62,NULL,NULL),(4091,'San Cristóbal Province',62,NULL,NULL),(4092,'Puerto Plata Province',62,NULL,NULL),(4093,'Santo Domingo Province',62,NULL,NULL),(4094,'María Trinidad Sánchez Province',62,NULL,NULL),(4095,'Distrito Nacional',62,NULL,NULL),(4096,'Peravia Province',62,NULL,NULL),(4097,'Independencia',62,NULL,NULL),(4098,'San Juan Province',62,NULL,NULL),(4099,'Monseñor Nouel Province',62,NULL,NULL),(4100,'Santiago Rodríguez Province',62,NULL,NULL),(4101,'Pedernales Province',62,NULL,NULL),(4102,'Espaillat Province',62,NULL,NULL),(4103,'Samaná Province',62,NULL,NULL),(4104,'Valverde Province',62,NULL,NULL),(4105,'Baoruco Province',62,NULL,NULL),(4106,'Hato Mayor Province',62,NULL,NULL),(4107,'Dajabón Province',62,NULL,NULL),(4108,'Santiago Province',62,NULL,NULL),(4109,'La Altagracia Province',62,NULL,NULL),(4110,'San Pedro de Macorís',62,NULL,NULL),(4111,'Monte Plata Province',62,NULL,NULL),(4112,'San José de Ocoa Province',62,NULL,NULL),(4113,'Duarte Province',62,NULL,NULL),(4114,'Azua Province',62,NULL,NULL),(4115,'Monte Cristi Province',62,NULL,NULL),(4116,'La Vega Province',62,NULL,NULL),(4117,'Nord',95,NULL,NULL),(4118,'Nippes',95,NULL,NULL),(4119,'Grand\'Anse',95,NULL,NULL),(4120,'Ouest',95,NULL,NULL),(4121,'Nord-Est',95,NULL,NULL),(4122,'Sud',95,NULL,NULL),(4123,'Artibonite',95,NULL,NULL),(4124,'Sud-Est',95,NULL,NULL),(4125,'Centre',95,NULL,NULL),(4126,'Nord-Ouest',95,NULL,NULL),(4127,'San Vicente Department',66,NULL,NULL),(4128,'Santa Ana Department',66,NULL,NULL),(4129,'Usulután Department',66,NULL,NULL),(4130,'Morazán Department',66,NULL,NULL),(4131,'Chalatenango Department',66,NULL,NULL),(4132,'Cabañas Department',66,NULL,NULL),(4133,'San Salvador Department',66,NULL,NULL),(4134,'La Libertad Department',66,NULL,NULL),(4135,'San Miguel Department',66,NULL,NULL),(4136,'La Paz Department',66,NULL,NULL),(4137,'Cuscatlán Department',66,NULL,NULL),(4138,'La Unión Department',66,NULL,NULL),(4139,'Ahuachapán Department',66,NULL,NULL),(4140,'Sonsonate Department',66,NULL,NULL),(4141,'Braslovče Municipality',201,NULL,NULL),(4142,'Lenart Municipality',201,NULL,NULL),(4143,'Oplotnica',201,NULL,NULL),(4144,'Velike Lašče Municipality',201,NULL,NULL),(4145,'Hajdina Municipality',201,NULL,NULL),(4146,'Podčetrtek Municipality',201,NULL,NULL),(4147,'Cankova Municipality',201,NULL,NULL),(4148,'Vitanje Municipality',201,NULL,NULL),(4149,'Sežana Municipality',201,NULL,NULL),(4150,'Kidričevo Municipality',201,NULL,NULL),(4151,'Črenšovci Municipality',201,NULL,NULL),(4152,'Idrija Municipality',201,NULL,NULL),(4153,'Trnovska Vas Municipality',201,NULL,NULL),(4154,'Vodice Municipality',201,NULL,NULL),(4155,'Ravne na Koroškem Municipality',201,NULL,NULL),(4156,'Lovrenc na Pohorju Municipality',201,NULL,NULL),(4157,'Majšperk Municipality',201,NULL,NULL),(4158,'Loški Potok Municipality',201,NULL,NULL),(4159,'Domžale Municipality',201,NULL,NULL),(4160,'Rečica ob Savinji Municipality',201,NULL,NULL),(4161,'Podlehnik Municipality',201,NULL,NULL),(4162,'Cerknica Municipality',201,NULL,NULL),(4163,'Vransko Municipality',201,NULL,NULL),(4164,'Sveta Ana Municipality',201,NULL,NULL),(4165,'Brezovica Municipality',201,NULL,NULL),(4166,'Benedikt Municipality',201,NULL,NULL),(4167,'Divača Municipality',201,NULL,NULL),(4168,'Moravče Municipality',201,NULL,NULL),(4169,'Slovenj Gradec City Municipality',201,NULL,NULL),(4170,'Škocjan Municipality',201,NULL,NULL),(4171,'Šentjur Municipality',201,NULL,NULL),(4172,'Pesnica Municipality',201,NULL,NULL),(4173,'Dol pri Ljubljani Municipality',201,NULL,NULL),(4174,'Loška Dolina Municipality',201,NULL,NULL),(4175,'Hoče–Slivnica Municipality',201,NULL,NULL),(4176,'Cerkvenjak Municipality',201,NULL,NULL),(4177,'Naklo Municipality',201,NULL,NULL),(4178,'Cerkno Municipality',201,NULL,NULL),(4179,'Bistrica ob Sotli Municipality',201,NULL,NULL),(4180,'Kamnik Municipality',201,NULL,NULL),(4181,'Bovec Municipality',201,NULL,NULL),(4182,'Zavrč Municipality',201,NULL,NULL),(4183,'Ajdovščina Municipality',201,NULL,NULL),(4184,'Pivka Municipality',201,NULL,NULL),(4185,'Štore Municipality',201,NULL,NULL),(4186,'Kozje Municipality',201,NULL,NULL),(4187,'Municipality of Škofljica',201,NULL,NULL),(4188,'Prebold Municipality',201,NULL,NULL),(4189,'Dobrovnik Municipality',201,NULL,NULL),(4190,'Mozirje Municipality',201,NULL,NULL),(4191,'City Municipality of Celje',201,NULL,NULL),(4192,'Žiri Municipality',201,NULL,NULL),(4193,'Horjul Municipality',201,NULL,NULL),(4194,'Tabor Municipality',201,NULL,NULL),(4195,'Radeče Municipality',201,NULL,NULL),(4196,'Vipava Municipality',201,NULL,NULL),(4197,'Kungota',201,NULL,NULL),(4198,'Slovenske Konjice Municipality',201,NULL,NULL),(4199,'Osilnica Municipality',201,NULL,NULL),(4200,'Borovnica Municipality',201,NULL,NULL),(4201,'Piran Municipality',201,NULL,NULL),(4202,'Bled Municipality',201,NULL,NULL),(4203,'Jezersko Municipality',201,NULL,NULL),(4204,'Rače–Fram Municipality',201,NULL,NULL),(4205,'Nova Gorica City Municipality',201,NULL,NULL),(4206,'Razkrižje Municipality',201,NULL,NULL),(4207,'Ribnica na Pohorju Municipality',201,NULL,NULL),(4208,'Muta Municipality',201,NULL,NULL),(4209,'Rogatec Municipality',201,NULL,NULL),(4210,'Gorišnica Municipality',201,NULL,NULL),(4211,'Kuzma Municipality',201,NULL,NULL),(4212,'Mislinja Municipality',201,NULL,NULL),(4213,'Duplek Municipality',201,NULL,NULL),(4214,'Trebnje Municipality',201,NULL,NULL),(4215,'Brežice Municipality',201,NULL,NULL),(4216,'Dobrepolje Municipality',201,NULL,NULL),(4217,'Grad Municipality',201,NULL,NULL),(4218,'Moravske Toplice Municipality',201,NULL,NULL),(4219,'Luče Municipality',201,NULL,NULL),(4220,'Miren–Kostanjevica Municipality',201,NULL,NULL),(4221,'Ormož Municipality',201,NULL,NULL),(4222,'Šalovci Municipality',201,NULL,NULL),(4223,'Miklavž na Dravskem Polju Municipality',201,NULL,NULL),(4224,'Makole Municipality',201,NULL,NULL),(4225,'Lendava Municipality',201,NULL,NULL),(4226,'Vuzenica Municipality',201,NULL,NULL),(4227,'Kanal ob Soči Municipality',201,NULL,NULL),(4228,'Ptuj City Municipality',201,NULL,NULL),(4229,'Sveti Andraž v Slovenskih Goricah Municipality',201,NULL,NULL),(4230,'Selnica ob Dravi Municipality',201,NULL,NULL),(4231,'Radovljica Municipality',201,NULL,NULL),(4232,'Črna na Koroškem Municipality',201,NULL,NULL),(4233,'Rogaška Slatina Municipality',201,NULL,NULL),(4234,'Podvelka Municipality',201,NULL,NULL),(4235,'Ribnica Municipality',201,NULL,NULL),(4236,'City Municipality of Novo Mesto',201,NULL,NULL),(4237,'Mirna Peč Municipality',201,NULL,NULL),(4238,'Križevci Municipality',201,NULL,NULL),(4239,'Poljčane Municipality',201,NULL,NULL),(4240,'Brda Municipality',201,NULL,NULL),(4241,'Šentjernej Municipality',201,NULL,NULL),(4242,'Maribor City Municipality',201,NULL,NULL),(4243,'Kobarid Municipality',201,NULL,NULL),(4244,'Markovci Municipality',201,NULL,NULL),(4245,'Vojnik Municipality',201,NULL,NULL),(4246,'Trbovlje Municipality',201,NULL,NULL),(4247,'Tolmin Municipality',201,NULL,NULL),(4248,'Šoštanj Municipality',201,NULL,NULL),(4249,'Žetale Municipality',201,NULL,NULL),(4250,'Tržič Municipality',201,NULL,NULL),(4251,'Turnišče Municipality',201,NULL,NULL),(4252,'Dobrna Municipality',201,NULL,NULL),(4253,'Renče–Vogrsko Municipality',201,NULL,NULL),(4254,'Kostanjevica na Krki Municipality',201,NULL,NULL),(4255,'Sveti Jurij ob Ščavnici Municipality',201,NULL,NULL),(4256,'Železniki Municipality',201,NULL,NULL),(4257,'Veržej Municipality',201,NULL,NULL),(4258,'Žalec Municipality',201,NULL,NULL),(4259,'Starše Municipality',201,NULL,NULL),(4260,'Sveta Trojica v Slovenskih Goricah Municipality',201,NULL,NULL),(4261,'Solčava Municipality',201,NULL,NULL),(4262,'Vrhnika Municipality',201,NULL,NULL),(4263,'Središče ob Dravi',201,NULL,NULL),(4264,'Rogašovci Municipality',201,NULL,NULL),(4265,'Mežica Municipality',201,NULL,NULL),(4266,'Juršinci Municipality',201,NULL,NULL),(4267,'Velika Polana Municipality',201,NULL,NULL),(4268,'Sevnica Municipality',201,NULL,NULL),(4269,'Zagorje ob Savi Municipality',201,NULL,NULL),(4270,'Ljubljana City Municipality',201,NULL,NULL),(4271,'Gornji Petrovci Municipality',201,NULL,NULL),(4272,'Polzela Municipality',201,NULL,NULL),(4273,'Sveti Tomaž Municipality',201,NULL,NULL),(4274,'Prevalje Municipality',201,NULL,NULL),(4275,'Radlje ob Dravi Municipality',201,NULL,NULL),(4276,'Žirovnica Municipality',201,NULL,NULL),(4277,'Sodražica Municipality',201,NULL,NULL),(4278,'Bloke Municipality',201,NULL,NULL),(4279,'Šmartno pri Litiji Municipality',201,NULL,NULL),(4280,'Ruše Municipality',201,NULL,NULL),(4281,'Dolenjske Toplice Municipality',201,NULL,NULL),(4282,'Bohinj Municipality',201,NULL,NULL),(4283,'Komenda Municipality',201,NULL,NULL),(4284,'Gorje Municipality',201,NULL,NULL),(4285,'Šmarje pri Jelšah Municipality',201,NULL,NULL),(4286,'Ig Municipality',201,NULL,NULL),(4287,'Kranj City Municipality',201,NULL,NULL),(4288,'Puconci Municipality',201,NULL,NULL),(4289,'Šmarješke Toplice Municipality',201,NULL,NULL),(4290,'Dornava Municipality',201,NULL,NULL),(4291,'Črnomelj Municipality',201,NULL,NULL),(4292,'Radenci Municipality',201,NULL,NULL),(4293,'Gorenja Vas–Poljane Municipality',201,NULL,NULL),(4294,'Ljubno Municipality',201,NULL,NULL),(4295,'Dobje Municipality',201,NULL,NULL),(4296,'Šmartno ob Paki Municipality',201,NULL,NULL),(4297,'Mokronog–Trebelno Municipality',201,NULL,NULL),(4298,'Mirna Municipality',201,NULL,NULL),(4299,'Šenčur Municipality',201,NULL,NULL),(4300,'Videm Municipality',201,NULL,NULL),(4301,'Beltinci Municipality',201,NULL,NULL),(4302,'Lukovica Municipality',201,NULL,NULL),(4303,'Preddvor Municipality',201,NULL,NULL),(4304,'Destrnik Municipality',201,NULL,NULL),(4305,'Ivančna Gorica Municipality',201,NULL,NULL),(4306,'Log–Dragomer Municipality',201,NULL,NULL),(4307,'Žužemberk Municipality',201,NULL,NULL),(4308,'Dobrova–Polhov Gradec Municipality',201,NULL,NULL),(4309,'Municipality of Cirkulane',201,NULL,NULL),(4310,'Cerklje na Gorenjskem Municipality',201,NULL,NULL),(4311,'Šentrupert Municipality',201,NULL,NULL),(4312,'Tišina Municipality',201,NULL,NULL),(4313,'Murska Sobota City Municipality',201,NULL,NULL),(4314,'Municipality of Krško',201,NULL,NULL),(4315,'Komen Municipality',201,NULL,NULL),(4316,'Škofja Loka Municipality',201,NULL,NULL),(4317,'Šempeter–Vrtojba Municipality',201,NULL,NULL),(4318,'Municipality of Apače',201,NULL,NULL),(4319,'Koper City Municipality',201,NULL,NULL),(4320,'Odranci Municipality',201,NULL,NULL),(4321,'Hrpelje–Kozina Municipality',201,NULL,NULL),(4322,'Izola Municipality',201,NULL,NULL),(4323,'Metlika Municipality',201,NULL,NULL),(4324,'Šentilj Municipality',201,NULL,NULL),(4325,'Kobilje Municipality',201,NULL,NULL),(4326,'Ankaran Municipality',201,NULL,NULL),(4327,'Hodoš Municipality',201,NULL,NULL),(4328,'Sveti Jurij v Slovenskih Goricah Municipality',201,NULL,NULL),(4329,'Nazarje Municipality',201,NULL,NULL),(4330,'Postojna Municipality',201,NULL,NULL),(4331,'Kostel Municipality',201,NULL,NULL),(4332,'Slovenska Bistrica Municipality',201,NULL,NULL),(4333,'Straža Municipality',201,NULL,NULL),(4334,'Trzin Municipality',201,NULL,NULL),(4335,'Kočevje Municipality',201,NULL,NULL),(4336,'Grosuplje Municipality',201,NULL,NULL),(4337,'Jesenice Municipality',201,NULL,NULL),(4338,'Laško Municipality',201,NULL,NULL),(4339,'Gornji Grad Municipality',201,NULL,NULL),(4340,'Kranjska Gora Municipality',201,NULL,NULL),(4341,'Hrastnik Municipality',201,NULL,NULL),(4342,'Zreče Municipality',201,NULL,NULL),(4343,'Gornja Radgona Municipality',201,NULL,NULL),(4344,'Municipality of Ilirska Bistrica',201,NULL,NULL),(4345,'Dravograd Municipality',201,NULL,NULL),(4346,'Semič Municipality',201,NULL,NULL),(4347,'Litija Municipality',201,NULL,NULL),(4348,'Mengeš Municipality',201,NULL,NULL),(4349,'Medvode Municipality',201,NULL,NULL),(4350,'Logatec Municipality',201,NULL,NULL),(4351,'Ljutomer Municipality',201,NULL,NULL),(4352,'Banská Bystrica Region',200,NULL,NULL),(4353,'Košice Region',200,NULL,NULL),(4354,'Prešov Region',200,NULL,NULL),(4355,'Trnava Region',200,NULL,NULL),(4356,'Bratislava Region',200,NULL,NULL),(4357,'Nitra Region',200,NULL,NULL),(4358,'Trenčín Region',200,NULL,NULL),(4359,'Žilina Region',200,NULL,NULL),(4360,'Cimișlia District',144,NULL,NULL),(4361,'Orhei District',144,NULL,NULL),(4362,'Bender Municipality',144,NULL,NULL),(4363,'Nisporeni District',144,NULL,NULL),(4364,'Sîngerei District',144,NULL,NULL),(4365,'Căușeni District',144,NULL,NULL),(4366,'Călărași District',144,NULL,NULL),(4367,'Glodeni District',144,NULL,NULL),(4368,'Anenii Noi District',144,NULL,NULL),(4369,'Ialoveni District',144,NULL,NULL),(4370,'Florești District',144,NULL,NULL),(4371,'Telenești District',144,NULL,NULL),(4372,'Taraclia District',144,NULL,NULL),(4373,'Chișinău Municipality',144,NULL,NULL),(4374,'Soroca District',144,NULL,NULL),(4375,'Briceni District',144,NULL,NULL),(4376,'Rîșcani District',144,NULL,NULL),(4377,'Strășeni District',144,NULL,NULL),(4378,'Ștefan Vodă District',144,NULL,NULL),(4379,'Basarabeasca District',144,NULL,NULL),(4380,'Cantemir District',144,NULL,NULL),(4381,'Fălești District',144,NULL,NULL),(4382,'Hîncești District',144,NULL,NULL),(4383,'Dubăsari District',144,NULL,NULL),(4384,'Dondușeni District',144,NULL,NULL),(4385,'Gagauzia',144,NULL,NULL),(4386,'Ungheni District',144,NULL,NULL),(4387,'Edineț District',144,NULL,NULL),(4388,'Șoldănești District',144,NULL,NULL),(4389,'Ocnița District',144,NULL,NULL),(4390,'Criuleni District',144,NULL,NULL),(4391,'Cahul District',144,NULL,NULL),(4392,'Drochia District',144,NULL,NULL),(4393,'Bălți Municipality',144,NULL,NULL),(4394,'Rezina District',144,NULL,NULL),(4395,'Transnistria autonomous territorial unit',144,NULL,NULL),(4396,'Salacgrīva Municipality',120,NULL,NULL),(4397,'Vecumnieki Municipality',120,NULL,NULL),(4398,'Naukšēni Municipality',120,NULL,NULL),(4399,'Ilūkste Municipality',120,NULL,NULL),(4400,'Gulbene Municipality',120,NULL,NULL),(4401,'Līvāni Municipality',120,NULL,NULL),(4402,'Salaspils Municipality',120,NULL,NULL),(4403,'Ventspils Municipality',120,NULL,NULL),(4404,'Rundāle Municipality',120,NULL,NULL),(4405,'Pļaviņas Municipality',120,NULL,NULL),(4406,'Vārkava Municipality',120,NULL,NULL),(4407,'Jaunpiebalga Municipality',120,NULL,NULL),(4408,'Sēja Municipality',120,NULL,NULL),(4409,'Tukums Municipality',120,NULL,NULL),(4410,'Cibla Municipality',120,NULL,NULL),(4411,'Burtnieki Municipality',120,NULL,NULL),(4412,'Ķegums Municipality',120,NULL,NULL),(4413,'Krustpils Municipality',120,NULL,NULL),(4414,'Cesvaine Municipality',120,NULL,NULL),(4415,'Skrīveri Municipality',120,NULL,NULL),(4416,'Ogre Municipality',120,NULL,NULL),(4417,'Olaine Municipality',120,NULL,NULL),(4418,'Limbaži Municipality',120,NULL,NULL),(4419,'Lubāna Municipality',120,NULL,NULL),(4420,'Kandava Municipality',120,NULL,NULL),(4421,'Ventspils',120,NULL,NULL),(4422,'Krimulda Municipality',120,NULL,NULL),(4423,'Rugāji Municipality',120,NULL,NULL),(4424,'Jelgava Municipality',120,NULL,NULL),(4425,'Valka Municipality',120,NULL,NULL),(4426,'Rūjiena Municipality',120,NULL,NULL),(4427,'Babīte Municipality',120,NULL,NULL),(4428,'Dundaga Municipality',120,NULL,NULL),(4429,'Priekule Municipality',120,NULL,NULL),(4430,'Zilupe Municipality',120,NULL,NULL),(4431,'Varakļāni Municipality',120,NULL,NULL),(4432,'Nereta Municipality',120,NULL,NULL),(4433,'Madona Municipality',120,NULL,NULL),(4434,'Sala Municipality',120,NULL,NULL),(4435,'Ķekava Municipality',120,NULL,NULL),(4436,'Nīca Municipality',120,NULL,NULL),(4437,'Dobele Municipality',120,NULL,NULL),(4438,'Jēkabpils Municipality',120,NULL,NULL),(4439,'Saldus Municipality',120,NULL,NULL),(4440,'Roja Municipality',120,NULL,NULL),(4441,'Iecava Municipality',120,NULL,NULL),(4442,'Ozolnieki Municipality',120,NULL,NULL),(4443,'Saulkrasti Municipality',120,NULL,NULL),(4444,'Ērgļi Municipality',120,NULL,NULL),(4445,'Aglona Municipality',120,NULL,NULL),(4446,'Jūrmala',120,NULL,NULL),(4447,'Skrunda Municipality',120,NULL,NULL),(4448,'Engure Municipality',120,NULL,NULL),(4449,'Inčukalns Municipality',120,NULL,NULL),(4450,'Mārupe Municipality',120,NULL,NULL),(4451,'Mērsrags Municipality',120,NULL,NULL),(4452,'Koknese Municipality',120,NULL,NULL),(4453,'Kārsava Municipality',120,NULL,NULL),(4454,'Carnikava Municipality',120,NULL,NULL),(4455,'Rēzekne Municipality',120,NULL,NULL),(4456,'Viesīte Municipality',120,NULL,NULL),(4457,'Ape Municipality',120,NULL,NULL),(4458,'Durbe Municipality',120,NULL,NULL),(4459,'Talsi Municipality',120,NULL,NULL),(4460,'Liepāja',120,NULL,NULL),(4461,'Mālpils Municipality',120,NULL,NULL),(4462,'Smiltene Municipality',120,NULL,NULL),(4463,'Daugavpils',120,NULL,NULL),(4464,'Jēkabpils',120,NULL,NULL),(4465,'Bauska Municipality',120,NULL,NULL),(4466,'Vecpiebalga Municipality',120,NULL,NULL),(4467,'Pāvilosta Municipality',120,NULL,NULL),(4468,'Brocēni Municipality',120,NULL,NULL),(4469,'Cēsis Municipality',120,NULL,NULL),(4470,'Grobiņa Municipality',120,NULL,NULL),(4471,'Beverīna Municipality',120,NULL,NULL),(4472,'Aizkraukle Municipality',120,NULL,NULL),(4473,'Valmiera',120,NULL,NULL),(4474,'Krāslava Municipality',120,NULL,NULL),(4475,'Jaunjelgava Municipality',120,NULL,NULL),(4476,'Sigulda Municipality',120,NULL,NULL),(4477,'Viļaka Municipality',120,NULL,NULL),(4478,'Stopiņi Municipality',120,NULL,NULL),(4479,'Rauna Municipality',120,NULL,NULL),(4480,'Tērvete Municipality',120,NULL,NULL),(4481,'Auce Municipality',120,NULL,NULL),(4482,'Baldone Municipality',120,NULL,NULL),(4483,'Preiļi Municipality',120,NULL,NULL),(4484,'Aloja Municipality',120,NULL,NULL),(4485,'Alsunga Municipality',120,NULL,NULL),(4486,'Viļāni Municipality',120,NULL,NULL),(4487,'Alūksne Municipality',120,NULL,NULL),(4488,'Līgatne Municipality',120,NULL,NULL),(4489,'Jaunpils Municipality',120,NULL,NULL),(4490,'Kuldīga Municipality',120,NULL,NULL),(4491,'Riga',120,NULL,NULL),(4492,'Daugavpils Municipality',120,NULL,NULL),(4493,'Ropaži Municipality',120,NULL,NULL),(4494,'Strenči Municipality',120,NULL,NULL),(4495,'Kocēni Municipality',120,NULL,NULL),(4496,'Aizpute Municipality',120,NULL,NULL),(4497,'Amata Municipality',120,NULL,NULL),(4498,'Baltinava Municipality',120,NULL,NULL),(4499,'Aknīste Municipality',120,NULL,NULL),(4500,'Jelgava',120,NULL,NULL),(4501,'Ludza Municipality',120,NULL,NULL),(4502,'Riebiņi Municipality',120,NULL,NULL),(4503,'Rucava Municipality',120,NULL,NULL),(4504,'Dagda Municipality',120,NULL,NULL),(4505,'Balvi Municipality',120,NULL,NULL),(4506,'Priekuļi Municipality',120,NULL,NULL),(4507,'Pārgauja Municipality',120,NULL,NULL),(4508,'Vaiņode Municipality',120,NULL,NULL),(4509,'Rēzekne',120,NULL,NULL),(4510,'Garkalne Municipality',120,NULL,NULL),(4511,'Ikšķile Municipality',120,NULL,NULL),(4512,'Lielvārde Municipality',120,NULL,NULL),(4513,'Mazsalaca Municipality',120,NULL,NULL),(4514,'Viqueque Municipality',63,NULL,NULL),(4515,'Liquiçá Municipality',63,NULL,NULL),(4516,'Ermera District',63,NULL,NULL),(4517,'Manatuto District',63,NULL,NULL),(4518,'Ainaro Municipality',63,NULL,NULL),(4519,'Manufahi Municipality',63,NULL,NULL),(4520,'Aileu municipality',63,NULL,NULL),(4521,'Baucau Municipality',63,NULL,NULL),(4522,'Cova Lima Municipality',63,NULL,NULL),(4523,'Lautém Municipality',63,NULL,NULL),(4524,'Dili municipality',63,NULL,NULL),(4525,'Bobonaro Municipality',63,NULL,NULL),(4526,'Peleliu',168,NULL,NULL),(4527,'Ngardmau',168,NULL,NULL),(4528,'Airai',168,NULL,NULL),(4529,'Hatohobei',168,NULL,NULL),(4530,'Melekeok',168,NULL,NULL),(4531,'Ngatpang',168,NULL,NULL),(4532,'Koror',168,NULL,NULL),(4533,'Ngarchelong',168,NULL,NULL),(4534,'Ngiwal',168,NULL,NULL),(4535,'Sonsorol',168,NULL,NULL),(4536,'Ngchesar',168,NULL,NULL),(4537,'Ngaraard',168,NULL,NULL),(4538,'Angaur',168,NULL,NULL),(4539,'Kayangel',168,NULL,NULL),(4540,'Aimeliik',168,NULL,NULL),(4541,'Ngeremlengui',168,NULL,NULL),(4542,'Břeclav',58,NULL,NULL),(4543,'Český Krumlov',58,NULL,NULL),(4544,'Plzeň-město',58,NULL,NULL),(4545,'Brno-venkov',58,NULL,NULL),(4546,'Příbram',58,NULL,NULL),(4547,'Pardubice',58,NULL,NULL),(4548,'Nový Jičín',58,NULL,NULL),(4550,'Náchod',58,NULL,NULL),(4551,'Prostějov',58,NULL,NULL),(4552,'Zlínský kraj',58,NULL,NULL),(4553,'Chomutov',58,NULL,NULL),(4554,'Středočeský kraj',58,NULL,NULL),(4556,'České Budějovice',58,NULL,NULL),(4558,'Rakovník',58,NULL,NULL),(4559,'Frýdek-Místek',58,NULL,NULL),(4560,'Písek',58,NULL,NULL),(4561,'Hodonín',58,NULL,NULL),(4563,'Zlín',58,NULL,NULL),(4564,'Plzeň-sever',58,NULL,NULL),(4565,'Tábor',58,NULL,NULL),(4568,'Brno-město',58,NULL,NULL),(4571,'Svitavy',58,NULL,NULL),(4572,'Vsetín',58,NULL,NULL),(4573,'Cheb',58,NULL,NULL),(4574,'Olomouc',58,NULL,NULL),(4575,'Kraj Vysočina',58,NULL,NULL),(4576,'Ústecký kraj',58,NULL,NULL),(4578,'Prachatice',58,NULL,NULL),(4579,'Trutnov',58,NULL,NULL),(4580,'Hradec Králové',58,NULL,NULL),(4581,'Karlovarský kraj',58,NULL,NULL),(4582,'Nymburk',58,NULL,NULL),(4583,'Rokycany',58,NULL,NULL),(4584,'Ostrava-město',58,NULL,NULL),(4586,'Karviná',58,NULL,NULL),(4588,'Pardubický kraj',58,NULL,NULL),(4589,'Olomoucký kraj',58,NULL,NULL),(4590,'Liberec',58,NULL,NULL),(4591,'Klatovy',58,NULL,NULL),(4592,'Uherské Hradiště',58,NULL,NULL),(4593,'Kroměříž',58,NULL,NULL),(4595,'Sokolov',58,NULL,NULL),(4596,'Semily',58,NULL,NULL),(4597,'Třebíč',58,NULL,NULL),(4598,'Praha, Hlavní město',58,NULL,NULL),(4599,'Ústí nad Labem',58,NULL,NULL),(4600,'Moravskoslezský kraj',58,NULL,NULL),(4601,'Liberecký kraj',58,NULL,NULL),(4602,'Jihomoravský kraj',58,NULL,NULL),(4604,'Karlovy Vary',58,NULL,NULL),(4605,'Litoměřice',58,NULL,NULL),(4606,'Praha-východ',58,NULL,NULL),(4607,'Plzeňský kraj',58,NULL,NULL),(4608,'Plzeň-jih',58,NULL,NULL),(4609,'Děčín',58,NULL,NULL),(4611,'Havlíčkův Brod',58,NULL,NULL),(4612,'Jablonec nad Nisou',58,NULL,NULL),(4613,'Jihlava',58,NULL,NULL),(4614,'Královéhradecký kraj',58,NULL,NULL),(4615,'Blansko',58,NULL,NULL),(4617,'Louny',58,NULL,NULL),(4618,'Kolín',58,NULL,NULL),(4619,'Praha-západ',58,NULL,NULL),(4620,'Beroun',58,NULL,NULL),(4621,'Teplice',58,NULL,NULL),(4622,'Vyškov',58,NULL,NULL),(4623,'Opava',58,NULL,NULL),(4624,'Jindřichův Hradec',58,NULL,NULL),(4625,'Jeseník',58,NULL,NULL),(4626,'Přerov',58,NULL,NULL),(4627,'Benešov',58,NULL,NULL),(4628,'Strakonice',58,NULL,NULL),(4629,'Most',58,NULL,NULL),(4630,'Znojmo',58,NULL,NULL),(4631,'Kladno',58,NULL,NULL),(4633,'Česká Lípa',58,NULL,NULL),(4634,'Chrudim',58,NULL,NULL),(4636,'Rychnov nad Kněžnou',58,NULL,NULL),(4638,'Mělník',58,NULL,NULL),(4639,'Jihočeský kraj',58,NULL,NULL),(4640,'Jičín',58,NULL,NULL),(4641,'Domažlice',58,NULL,NULL),(4642,'Šumperk',58,NULL,NULL),(4643,'Mladá Boleslav',58,NULL,NULL),(4644,'Bruntál',58,NULL,NULL),(4645,'Pelhřimov',58,NULL,NULL),(4646,'Tachov',58,NULL,NULL),(4647,'Ústí nad Orlicí',58,NULL,NULL),(4648,'Žďár nad Sázavou',58,NULL,NULL),(4649,'North East Community Development Council',199,NULL,NULL),(4650,'South East Community Development Council',199,NULL,NULL),(4651,'Central Singapore Community Development Council',199,NULL,NULL),(4652,'South West Community Development Council',199,NULL,NULL),(4653,'North West Community Development Council',199,NULL,NULL),(4654,'Ewa District',153,NULL,NULL),(4655,'Uaboe District',153,NULL,NULL),(4656,'Aiwo District',153,NULL,NULL),(4657,'Meneng District',153,NULL,NULL),(4658,'Anabar District',153,NULL,NULL),(4659,'Nibok District',153,NULL,NULL),(4660,'Baiti District',153,NULL,NULL),(4661,'Ijuw District',153,NULL,NULL),(4662,'Buada District',153,NULL,NULL),(4663,'Anibare District',153,NULL,NULL),(4664,'Yaren District',153,NULL,NULL),(4665,'Boe District',153,NULL,NULL),(4666,'Denigomodu District',153,NULL,NULL),(4667,'Anetan District',153,NULL,NULL),(4668,'Zhytomyrska oblast',230,NULL,NULL),(4669,'Vinnytska oblast',230,NULL,NULL),(4670,'Zakarpatska Oblast',230,NULL,NULL),(4671,'Kyivska oblast',230,NULL,NULL),(4672,'Lvivska oblast',230,NULL,NULL),(4673,'Luhanska oblast',230,NULL,NULL),(4674,'Ternopilska oblast',230,NULL,NULL),(4675,'Dnipropetrovska oblast',230,NULL,NULL),(4676,'Kyiv',230,NULL,NULL),(4677,'Kirovohradska oblast',230,NULL,NULL),(4678,'Chernivetska oblast',230,NULL,NULL),(4679,'Mykolaivska oblast',230,NULL,NULL),(4680,'Cherkaska oblast',230,NULL,NULL),(4681,'Khmelnytska oblast',230,NULL,NULL),(4682,'Ivano-Frankivska oblast',230,NULL,NULL),(4683,'Rivnenska oblast',230,NULL,NULL),(4684,'Khersonska oblast',230,NULL,NULL),(4685,'Sumska oblast',230,NULL,NULL),(4686,'Kharkivska oblast',230,NULL,NULL),(4687,'Zaporizka oblast',230,NULL,NULL),(4688,'Odeska oblast',230,NULL,NULL),(4689,'Autonomous Republic of Crimea',230,NULL,NULL),(4690,'Volynska oblast',230,NULL,NULL),(4691,'Donetska oblast',230,NULL,NULL),(4692,'Chernihivska oblast',230,NULL,NULL),(4693,'Gabrovo Province',34,NULL,NULL),(4694,'Smolyan Province',34,NULL,NULL),(4695,'Pernik Province',34,NULL,NULL),(4696,'Montana Province',34,NULL,NULL),(4697,'Vidin Province',34,NULL,NULL),(4698,'Razgrad Province',34,NULL,NULL),(4699,'Blagoevgrad Province',34,NULL,NULL),(4700,'Sliven Province',34,NULL,NULL),(4701,'Plovdiv Province',34,NULL,NULL),(4702,'Kardzhali Province',34,NULL,NULL),(4703,'Kyustendil Province',34,NULL,NULL),(4704,'Haskovo Province',34,NULL,NULL),(4705,'Sofia City Province',34,NULL,NULL),(4706,'Pleven Province',34,NULL,NULL),(4707,'Stara Zagora Province',34,NULL,NULL),(4708,'Silistra Province',34,NULL,NULL),(4709,'Veliko Tarnovo Province',34,NULL,NULL),(4710,'Lovech Province',34,NULL,NULL),(4711,'Vratsa Province',34,NULL,NULL),(4712,'Pazardzhik Province',34,NULL,NULL),(4713,'Ruse Province',34,NULL,NULL),(4714,'Targovishte Province',34,NULL,NULL),(4715,'Burgas Province',34,NULL,NULL),(4716,'Yambol Province',34,NULL,NULL),(4717,'Varna Province',34,NULL,NULL),(4718,'Dobrich Province',34,NULL,NULL),(4719,'Sofia Province',34,NULL,NULL),(4720,'Suceava County',181,NULL,NULL),(4721,'Hunedoara County',181,NULL,NULL),(4722,'Arges',181,NULL,NULL),(4723,'Bihor County',181,NULL,NULL),(4724,'Alba',181,NULL,NULL),(4725,'Ilfov County',181,NULL,NULL),(4726,'Giurgiu County',181,NULL,NULL),(4727,'Tulcea County',181,NULL,NULL),(4728,'Teleorman County',181,NULL,NULL),(4729,'Prahova County',181,NULL,NULL),(4730,'Bucharest',181,NULL,NULL),(4731,'Neamț County',181,NULL,NULL),(4732,'Călărași County',181,NULL,NULL),(4733,'Bistrița-Năsăud County',181,NULL,NULL),(4734,'Cluj County',181,NULL,NULL),(4735,'Iași County',181,NULL,NULL),(4736,'Braila',181,NULL,NULL),(4737,'Constanța County',181,NULL,NULL),(4738,'Olt County',181,NULL,NULL),(4739,'Arad County',181,NULL,NULL),(4740,'Botoșani County',181,NULL,NULL),(4741,'Sălaj County',181,NULL,NULL),(4742,'Dolj County',181,NULL,NULL),(4743,'Ialomița County',181,NULL,NULL),(4744,'Bacău County',181,NULL,NULL),(4745,'Dâmbovița County',181,NULL,NULL),(4746,'Satu Mare County',181,NULL,NULL),(4747,'Galați County',181,NULL,NULL),(4748,'Timiș County',181,NULL,NULL),(4749,'Harghita County',181,NULL,NULL),(4750,'Gorj County',181,NULL,NULL),(4751,'Mehedinți County',181,NULL,NULL),(4752,'Vaslui County',181,NULL,NULL),(4753,'Caraș-Severin County',181,NULL,NULL),(4754,'Covasna County',181,NULL,NULL),(4755,'Sibiu County',181,NULL,NULL),(4756,'Buzău County',181,NULL,NULL),(4757,'Vâlcea County',181,NULL,NULL),(4758,'Vrancea County',181,NULL,NULL),(4759,'Brașov County',181,NULL,NULL),(4760,'Maramureș County',181,NULL,NULL),(4761,'Aiga-i-le-Tai',191,NULL,NULL),(4762,'Satupa\'itea',191,NULL,NULL),(4763,'A\'ana',191,NULL,NULL),(4764,'Fa\'asaleleaga',191,NULL,NULL),(4765,'Atua',191,NULL,NULL),(4766,'Vaisigano',191,NULL,NULL),(4767,'Palauli',191,NULL,NULL),(4768,'Va\'a-o-Fonoti',191,NULL,NULL),(4769,'Gaga\'emauga',191,NULL,NULL),(4770,'Tuamasaga',191,NULL,NULL),(4771,'Gaga\'ifomauga',191,NULL,NULL),(4772,'Torba',237,NULL,NULL),(4773,'Penama',237,NULL,NULL),(4774,'Shefa',237,NULL,NULL),(4775,'Malampa',237,NULL,NULL),(4776,'Sanma',237,NULL,NULL),(4777,'Tafea',237,NULL,NULL),(4778,'Honiara',202,NULL,NULL),(4779,'Temotu Province',202,NULL,NULL),(4780,'Isabel Province',202,NULL,NULL),(4781,'Choiseul Province',202,NULL,NULL),(4782,'Makira-Ulawa Province',202,NULL,NULL),(4783,'Malaita Province',202,NULL,NULL),(4784,'Central Province',202,NULL,NULL),(4785,'Guadalcanal Province',202,NULL,NULL),(4786,'Western Province',202,NULL,NULL),(4787,'Rennell and Bellona Province',202,NULL,NULL),(4794,'Saint-Barthélemy',75,NULL,NULL),(4795,'Nouvelle-Aquitaine',75,NULL,NULL),(4796,'Île-de-France',75,NULL,NULL),(4797,'Mayotte',75,NULL,NULL),(4798,'Auvergne-Rhône-Alpes',75,NULL,NULL),(4799,'Occitanie',75,NULL,NULL),(4802,'Pays-de-la-Loire',75,NULL,NULL),(4804,'Normandie',75,NULL,NULL),(4806,'Corse',75,NULL,NULL),(4807,'Bretagne',75,NULL,NULL),(4809,'Saint-Martin',75,NULL,NULL),(4810,'Wallis and Futuna',75,NULL,NULL),(4811,'Alsace',75,NULL,NULL),(4812,'Provence-Alpes-Côte-d’Azur',75,NULL,NULL),(4816,'Paris',75,NULL,NULL),(4818,'Centre-Val de Loire',75,NULL,NULL),(4820,'Grand-Est',75,NULL,NULL),(4821,'Saint Pierre and Miquelon',75,NULL,NULL),(4822,'French Guiana',75,NULL,NULL),(4823,'La Réunion',75,NULL,NULL),(4824,'French Polynesia',75,NULL,NULL),(4825,'Bourgogne-Franche-Comté',75,NULL,NULL),(4827,'Martinique',75,NULL,NULL),(4828,'Hauts-de-France',75,NULL,NULL),(4829,'Guadeloupe',75,NULL,NULL),(4830,'West New Britain Province',171,NULL,NULL),(4831,'Bougainville',171,NULL,NULL),(4832,'Jiwaka Province',171,NULL,NULL),(4833,'Hela',171,NULL,NULL),(4834,'East New Britain',171,NULL,NULL),(4835,'Morobe Province',171,NULL,NULL),(4836,'Sandaun Province',171,NULL,NULL),(4837,'Port Moresby',171,NULL,NULL),(4838,'Oro Province',171,NULL,NULL),(4839,'Gulf',171,NULL,NULL),(4840,'Western Highlands Province',171,NULL,NULL),(4841,'New Ireland Province',171,NULL,NULL),(4842,'Manus Province',171,NULL,NULL),(4843,'Madang Province',171,NULL,NULL),(4844,'Southern Highlands Province',171,NULL,NULL),(4845,'Eastern Highlands Province',171,NULL,NULL),(4846,'Chimbu Province',171,NULL,NULL),(4847,'Central Province',171,NULL,NULL),(4848,'Enga Province',171,NULL,NULL),(4849,'Milne Bay Province',171,NULL,NULL),(4850,'Western Province',171,NULL,NULL),(4851,'Ohio',233,NULL,NULL),(4852,'Ladakh',101,NULL,NULL),(4853,'West Bengal',101,NULL,NULL),(4854,'Sinop',225,NULL,NULL),(4855,'Distrito Capital',239,NULL,NULL),(4856,'Apure',239,NULL,NULL),(4857,'Jalisco',142,NULL,NULL),(4858,'Roraima',31,NULL,NULL),(4859,'Guarda',177,NULL,NULL),(4860,'Devonshire Parish',25,NULL,NULL),(4861,'Hamilton Parish',25,NULL,NULL),(4863,'Paget Parish',25,NULL,NULL),(4864,'Pembroke Parish',25,NULL,NULL),(4866,'Saint George\'s Parish',25,NULL,NULL),(4867,'Sandys Parish',25,NULL,NULL),(4868,'Smith\'s Parish,',25,NULL,NULL),(4869,'Southampton Parish',25,NULL,NULL),(4870,'Warwick Parish',25,NULL,NULL),(4871,'Huila',48,NULL,NULL),(4874,'Uroševac District (Ferizaj)',248,NULL,NULL),(4876,'Đakovica District (Gjakove)',248,NULL,NULL),(4877,'Gjilan District',248,NULL,NULL),(4878,'Kosovska Mitrovica District',248,NULL,NULL),(4879,'Pristina (Priştine)',248,NULL,NULL),(4880,'Ciudad Autónoma de Buenos Aires',11,NULL,NULL),(4881,'New Providence',17,NULL,NULL),(4882,'Shumen',34,NULL,NULL),(4883,'Yuen Long District',98,NULL,NULL),(4884,'Tsuen Wan District',98,NULL,NULL),(4885,'Tai Po District',98,NULL,NULL),(4887,'Sai Kung District',98,NULL,NULL),(4888,'Islands District',98,NULL,NULL),(4889,'Central and Western District',98,NULL,NULL),(4890,'Wan Chai',98,NULL,NULL),(4891,'Eastern',98,NULL,NULL),(4892,'Southern',98,NULL,NULL),(4893,'Yau Tsim Mong',98,NULL,NULL),(4894,'Sham Shui Po',98,NULL,NULL),(4895,'Kowloon City',98,NULL,NULL),(4896,'Wong Tai Sin',98,NULL,NULL),(4897,'Kwun Tong',98,NULL,NULL),(4898,'Kwai Tsing',98,NULL,NULL),(4899,'Tuen Mun',98,NULL,NULL),(4900,'North',98,NULL,NULL),(4901,'Sha Tin',98,NULL,NULL),(4902,'Sidi Bel Abbès',4,NULL,NULL),(4905,'El M\'ghair',4,NULL,NULL),(4906,'El Menia',4,NULL,NULL),(4907,'Ouled Djellal',4,NULL,NULL),(4908,'Bordj Baji Mokhtar',4,NULL,NULL),(4909,'Béni Abbès',4,NULL,NULL),(4910,'Timimoun',4,NULL,NULL),(4911,'Touggourt',4,NULL,NULL),(4912,'Djanet',4,NULL,NULL),(4913,'In Salah',4,NULL,NULL),(4914,'In Guezzam',4,NULL,NULL),(4915,'Mureș County',181,NULL,NULL),(4916,'Volgograd Oblast',182,NULL,NULL),(4917,'La Colle',145,NULL,NULL),(4918,'La Condamine',145,NULL,NULL),(4919,'Moneghetti',145,NULL,NULL),(4920,'Hamadan',103,NULL,NULL),(4921,'Bogotá D.C.',48,NULL,NULL),(4922,'Loreto',173,NULL,NULL),(4923,'Kutná Hora',58,NULL,NULL),(4924,'Kōchi Prefecture',109,NULL,NULL),(4925,'Cần Thơ',240,NULL,NULL),(4926,'Rivers',161,NULL,NULL),(4927,'Rabat-Salé-Kénitra',149,NULL,NULL),(4928,'Agadir-Ida-Ou-Tanane',149,NULL,NULL),(4929,'Berrechid',149,NULL,NULL),(4930,'Casablanca',149,NULL,NULL),(4931,'Driouch',149,NULL,NULL),(4932,'Fès',149,NULL,NULL),(4933,'Fquih Ben Salah',149,NULL,NULL),(4934,'Guercif',149,NULL,NULL),(4935,'Marrakech',149,NULL,NULL),(4936,'M’diq-Fnideq',149,NULL,NULL),(4937,'Meknès',149,NULL,NULL),(4938,'Midelt',149,NULL,NULL),(4939,'Mohammadia',149,NULL,NULL),(4940,'Oujda-Angad',149,NULL,NULL),(4941,'Ouezzane',149,NULL,NULL),(4942,'Rabat',149,NULL,NULL),(4943,'Rehamna',149,NULL,NULL),(4944,'Salé',149,NULL,NULL),(4945,'Sidi Bennour',149,NULL,NULL),(4946,'Sidi Ifni',149,NULL,NULL),(4947,'Skhirate-Témara',149,NULL,NULL),(4948,'Tarfaya (EH-partial)',149,NULL,NULL),(4949,'Tinghir',149,NULL,NULL),(4950,'Tanger-Assilah',149,NULL,NULL),(4951,'Youssoufia',149,NULL,NULL),(4952,'Sidi Slimane',149,NULL,NULL),(4953,'Lualaba',51,NULL,NULL),(4954,'Chaiyaphum',219,NULL,NULL),(4955,'Mbeya',218,NULL,NULL),(4956,'Songwe',218,NULL,NULL),(4957,'Basel-Stadt',214,NULL,NULL),(4958,'Bono East',83,NULL,NULL),(4959,'Bono',83,NULL,NULL),(4960,'North East',83,NULL,NULL),(4961,'Oti',83,NULL,NULL),(4962,'Savannah',83,NULL,NULL),(4963,'Western North',83,NULL,NULL),(4964,'Nueva Segovia',159,NULL,NULL),(4965,'Keelung',216,NULL,NULL),(4966,'New Taipei',216,NULL,NULL),(4967,'Ain',75,NULL,NULL),(4968,'Aisne',75,NULL,NULL),(4969,'Allier',75,NULL,NULL),(4970,'Alpes-de-Haute-Provence',75,NULL,NULL),(4971,'Hautes-Alpes',75,NULL,NULL),(4972,'Alpes-Maritimes',75,NULL,NULL),(4973,'Ardèche',75,NULL,NULL),(4974,'Ardennes',75,NULL,NULL),(4975,'Ariège',75,NULL,NULL),(4976,'Aube',75,NULL,NULL),(4977,'Aude',75,NULL,NULL),(4978,'Aveyron',75,NULL,NULL),(4979,'Bouches-du-Rhône',75,NULL,NULL),(4981,'Calvados',75,NULL,NULL),(4982,'Cantal',75,NULL,NULL),(4983,'Charente',75,NULL,NULL),(4984,'Charente-Maritime',75,NULL,NULL),(4985,'Cher',75,NULL,NULL),(4986,'Corrèze',75,NULL,NULL),(4987,'Côte-d\'Or',75,NULL,NULL),(4988,'Côtes-d\'Armor',75,NULL,NULL),(4989,'Creuse',75,NULL,NULL),(4990,'Dordogne',75,NULL,NULL),(4991,'Doubs',75,NULL,NULL),(4992,'Drôme',75,NULL,NULL),(4993,'Eure',75,NULL,NULL),(4994,'Eure-et-Loir',75,NULL,NULL),(4995,'Finistère',75,NULL,NULL),(4996,'Corse-du-Sud',75,NULL,NULL),(4997,'Haute-Corse',75,NULL,NULL),(4998,'Gard',75,NULL,NULL),(4999,'Haute-Garonne',75,NULL,NULL),(5000,'Gers',75,NULL,NULL),(5001,'Gironde',75,NULL,NULL),(5002,'Hérault',75,NULL,NULL),(5003,'Ille-et-Vilaine',75,NULL,NULL),(5004,'Indre',75,NULL,NULL),(5005,'Indre-et-Loire',75,NULL,NULL),(5006,'Isère',75,NULL,NULL),(5007,'Jura',75,NULL,NULL),(5008,'Landes',75,NULL,NULL),(5009,'Loir-et-Cher',75,NULL,NULL),(5010,'Loire',75,NULL,NULL),(5011,'Haute-Loire',75,NULL,NULL),(5012,'Loire-Atlantique',75,NULL,NULL),(5013,'Loiret',75,NULL,NULL),(5014,'Lot',75,NULL,NULL),(5015,'Lot-et-Garonne',75,NULL,NULL),(5016,'Lozère',75,NULL,NULL),(5017,'Maine-et-Loire',75,NULL,NULL),(5018,'Manche',75,NULL,NULL),(5019,'Marne',75,NULL,NULL),(5020,'Haute-Marne',75,NULL,NULL),(5021,'Mayenne',75,NULL,NULL),(5022,'Meurthe-et-Moselle',75,NULL,NULL),(5023,'Meuse',75,NULL,NULL),(5024,'Morbihan',75,NULL,NULL),(5025,'Moselle',75,NULL,NULL),(5026,'Nièvre',75,NULL,NULL),(5027,'Nord',75,NULL,NULL),(5028,'Oise',75,NULL,NULL),(5029,'Orne',75,NULL,NULL),(5030,'Pas-de-Calais',75,NULL,NULL),(5031,'Puy-de-Dôme',75,NULL,NULL),(5032,'Pyrénées-Atlantiques',75,NULL,NULL),(5033,'Hautes-Pyrénées',75,NULL,NULL),(5034,'Pyrénées-Orientales',75,NULL,NULL),(5035,'Bas-Rhin',75,NULL,NULL),(5036,'Haut-Rhin',75,NULL,NULL),(5037,'Rhône',75,NULL,NULL),(5038,'Métropole de Lyon',75,NULL,NULL),(5039,'Haute-Saône',75,NULL,NULL),(5040,'Saône-et-Loire',75,NULL,NULL),(5041,'Sarthe',75,NULL,NULL),(5042,'Savoie',75,NULL,NULL),(5043,'Haute-Savoie',75,NULL,NULL),(5044,'Seine-Maritime',75,NULL,NULL),(5045,'Seine-et-Marne',75,NULL,NULL),(5046,'Yvelines',75,NULL,NULL),(5047,'Deux-Sèvres',75,NULL,NULL),(5048,'Somme',75,NULL,NULL),(5049,'Tarn',75,NULL,NULL),(5050,'Tarn-et-Garonne',75,NULL,NULL),(5051,'Var',75,NULL,NULL),(5052,'Vaucluse',75,NULL,NULL),(5053,'Vendée',75,NULL,NULL),(5054,'Vienne',75,NULL,NULL),(5055,'Haute-Vienne',75,NULL,NULL),(5056,'Vosges',75,NULL,NULL),(5057,'Yonne',75,NULL,NULL),(5058,'Territoire de Belfort',75,NULL,NULL),(5059,'Essonne',75,NULL,NULL),(5060,'Hauts-de-Seine',75,NULL,NULL),(5061,'Seine-Saint-Denis',75,NULL,NULL),(5062,'Val-de-Marne',75,NULL,NULL),(5063,'Val-d\'Oise',75,NULL,NULL),(5064,'Clipperton',75,NULL,NULL),(5065,'French Southern and Antarctic Lands',75,NULL,NULL),(5067,'Sharqia',65,NULL,NULL),(5068,'Loja',64,NULL,NULL),(5069,'Karlovac',55,NULL,NULL),(5070,'Kampong Thom',37,NULL,NULL),(5071,'Poltavska oblast',230,NULL,NULL),(5072,'Saint Thomas',242,NULL,NULL),(5073,'Saint John',242,NULL,NULL),(5074,'Saint Croix',242,NULL,NULL),(5075,'San Juan',178,NULL,NULL),(5076,'Bayamon',178,NULL,NULL),(5077,'Carolina',178,NULL,NULL),(5078,'Ponce',178,NULL,NULL),(5079,'Caguas',178,NULL,NULL),(5080,'Guaynabo',178,NULL,NULL),(5081,'Arecibo',178,NULL,NULL),(5082,'Toa Baja',178,NULL,NULL),(5083,'Mayagüez',178,NULL,NULL),(5084,'Trujillo Alto',178,NULL,NULL),(5085,'Komárom-Esztergom',99,NULL,NULL),(5086,'Bonaire',155,NULL,NULL),(5087,'Saba',155,NULL,NULL),(5088,'Sint Eustatius',155,NULL,NULL);
/*!40000 ALTER TABLE `global_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_system_code`
--

DROP TABLE IF EXISTS `global_system_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_system_code` (
  `SYSTEM_TYPE` varchar(20) NOT NULL,
  `SYSTEM_CODE` varchar(20) NOT NULL,
  `SYSTEM_DESCRIPTION` varchar(100) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  KEY `global_system_code_index` (`SYSTEM_TYPE`,`SYSTEM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_system_code`
--

LOCK TABLES `global_system_code` WRITE;
/*!40000 ALTER TABLE `global_system_code` DISABLE KEYS */;
INSERT INTO `global_system_code` VALUES ('SYSTYPE','SYSTYPE','System Code','TL-57','UPD->ADMIN->2022-06-14 01:22:21'),('SYSTYPE','FILETYPE','File Type','TL-58','INS->ADMIN->2022-06-14 01:30:38'),('FILETYPE','doc','Word (.doc)','TL-59','INS->ADMIN->2022-06-14 01:32:23'),('FILETYPE','docx','Word (.docx)','TL-60','INS->ADMIN->2022-06-14 01:32:36'),('FILETYPE','xls','Excel (.xls)','TL-61','INS->ADMIN->2022-06-14 01:32:45'),('FILETYPE','xlsx','Excel (.xlsx)','TL-62','INS->ADMIN->2022-06-14 01:32:56'),('FILETYPE','ppt','Powerpoint (.ppt)','TL-63','INS->ADMIN->2022-06-14 01:33:06'),('FILETYPE','pptx','Powerpoint (.pptx)','TL-64','INS->ADMIN->2022-06-14 01:33:17'),('FILETYPE','zip','Compressed (.zip)','TL-65','INS->ADMIN->2022-06-14 01:33:31'),('FILETYPE','7z','Compressed (.7z)','TL-66','INS->ADMIN->2022-06-14 01:33:41'),('FILETYPE','rar','Compressed (.rar)','TL-67','INS->ADMIN->2022-06-14 01:33:50'),('FILETYPE','pdf','Document (.pdf)','TL-68','INS->ADMIN->2022-06-14 01:34:02'),('FILETYPE','txt','Document (.txt)','TL-69','INS->ADMIN->2022-06-14 01:34:14'),('FILETYPE','csv','Data (.csv)','TL-70','INS->ADMIN->2022-06-14 01:34:27'),('FILETYPE','mp3','Audio (.mp3)','TL-71','INS->ADMIN->2022-06-14 01:35:48'),('FILETYPE','sql','Data (.sql)','TL-73','INS->ADMIN->2022-06-14 01:36:06'),('FILETYPE','wav','Audio (.wav)','TL-74','INS->ADMIN->2022-06-14 01:36:27'),('FILETYPE','db','Data (.db)','TL-75','INS->ADMIN->2022-06-14 01:36:42'),('FILETYPE','dbf','Data (.dbf)','TL-76','INS->ADMIN->2022-06-14 01:36:52'),('FILETYPE','gif','Image (.gif)','TL-77','INS->ADMIN->2022-06-14 01:37:02'),('FILETYPE','jpeg','Image (.jpeg)','TL-79','INS->ADMIN->2022-06-14 01:37:28'),('FILETYPE','ico','Image (.ico)','TL-80','INS->ADMIN->2022-06-14 01:37:45'),('FILETYPE','jpg','Image (.jpg)','TL-81','INS->ADMIN->2022-06-14 01:38:01'),('FILETYPE','png','Image (.png)','TL-82','INS->ADMIN->2022-06-14 01:38:09'),('FILETYPE','svg','Image (.svg)','TL-83','INS->ADMIN->2022-06-14 01:38:19'),('FILETYPE','mp4','Video (.mp4)','TL-84','INS->ADMIN->2022-06-14 01:38:26'),('FILETYPE','mkv','Video (.mkv)','TL-85','INS->ADMIN->2022-06-14 01:38:34'),('FILETYPE','mov','Video (.mov)','TL-86','INS->ADMIN->2022-06-14 01:38:43'),('FILETYPE','mpg','Video (.mpg)','TL-87','INS->ADMIN->2022-06-14 01:38:52'),('FILETYPE','mpeg','Video (.mpeg)','TL-88','INS->ADMIN->2022-06-14 01:39:00'),('FILETYPE','wmv','Video (.wmv)','TL-89','INS->ADMIN->2022-06-14 01:39:09'),('FILETYPE','avi','Video (.avi)','TL-90','INS->ADMIN->2022-06-14 01:39:17'),('FILETYPE','flv','Video (.flv)','TL-91','INS->ADMIN->2022-06-14 01:39:27'),('SYSTYPE','MAILENCRYPTION','Mail Encryption','TL-167','INS->ADMIN->2022-06-20 02:29:54'),('MAILENCRYPTION','None','None','TL-168','INS->ADMIN->2022-06-20 02:30:11'),('MAILENCRYPTION','TLS','TLS','TL-169','INS->ADMIN->2022-06-20 02:30:17'),('MAILENCRYPTION','SSL','SSL','TL-170','INS->ADMIN->2022-06-20 02:30:22'),('MAILENCRYPTION','STARTTLS','STARTTLS','TL-171','INS->ADMIN->2022-06-20 02:30:28'),('SYSTYPE','NOTIFICATIONCHANNEL','Notification Channel','TL-174','INS->ADMIN->2022-06-20 02:55:18'),('NOTIFICATIONCHANNEL','EMAIL','Email','TL-175','INS->ADMIN->2022-06-20 02:55:32'),('NOTIFICATIONCHANNEL','SYSTEM','System','TL-176','INS->ADMIN->2022-06-20 02:55:52'),('SYSTYPE','MARITALSTATUS','Marital Status','TL-246','INS->ADMIN->2022-06-24 03:01:20'),('MARITALSTATUS','SINGLE','Single','TL-247','INS->ADMIN->2022-06-24 03:01:30'),('MARITALSTATUS','MARRIED','Married','TL-248','INS->ADMIN->2022-06-24 03:01:41'),('MARITALSTATUS','WIDOWER','Widower','TL-249','INS->ADMIN->2022-06-24 03:02:08'),('MARITALSTATUS','DIVORCED','Divorced','TL-250','INS->ADMIN->2022-06-24 03:02:23'),('MAILENCRYPTION','WIDOWED','Widowed','TL-252','INS->ADMIN->2022-06-24 03:03:56'),('MARITALSTATUS','SEPARATED','Separated','TL-253','INS->ADMIN->2022-06-24 03:04:11'),('SYSTYPE','GENDER','Gender','TL-254','INS->ADMIN->2022-06-24 03:08:09'),('GENDER','MALE','Male','TL-255','INS->ADMIN->2022-06-24 03:08:34'),('GENDER','FEMALE','Female','TL-256','INS->ADMIN->2022-06-24 03:08:41'),('GENDER','OTHER','Other','TL-257','INS->ADMIN->2022-06-24 03:08:48'),('SYSTYPE','SUFFIX','Suffix','TL-258','INS->ADMIN->2022-06-24 04:19:58'),('SUFFIX','JR','Jr.','TL-259','INS->ADMIN->2022-06-24 04:21:12'),('SUFFIX','SR','Sr.','TL-260','INS->ADMIN->2022-06-24 04:21:22'),('SUFFIX','I','I','TL-261','INS->ADMIN->2022-06-24 04:21:29'),('SUFFIX','II','II','TL-262','INS->ADMIN->2022-06-24 04:21:43'),('SUFFIX','III','III','TL-263','INS->ADMIN->2022-06-24 04:21:50'),('SYSTYPE','CERTIFICATELEVEL','Certificate Level','TL-264','INS->ADMIN->2022-06-24 11:17:17'),('CERTIFICATELEVEL','GRADUATE','Graduate','TL-265','INS->ADMIN->2022-06-24 11:17:35'),('CERTIFICATELEVEL','BATCHELOR','Batchelor','TL-266','INS->ADMIN->2022-06-24 11:17:47'),('CERTIFICATELEVEL','MASTER','Master','TL-267','INS->ADMIN->2022-06-24 11:17:54'),('CERTIFICATELEVEL','DOCTOR','Doctor','TL-268','INS->ADMIN->2022-06-24 11:18:05'),('CERTIFICATELEVEL','OTHER','Other','TL-269','INS->ADMIN->2022-06-24 11:18:12'),('SYSTYPE','SCHEDULETYPE','Schedule Type','TL-290','INS->ADMIN->2022-06-28 02:46:20'),('SCHEDULETYPE','REGULAR','Regular','TL-291','INS->ADMIN->2022-06-28 02:46:33'),('SCHEDULETYPE','SCHEDULED','Scheduled','TL-292','INS->ADMIN->2022-06-28 02:46:43'),('SYSTYPE','HOLIDAYTYPE','Holiday Type','TL-460','INS->LDAGULTO->2022-08-04 05:16:16'),('HOLIDAYTYPE','REGULAR','Regular','TL-461','INS->LDAGULTO->2022-08-04 05:16:43'),('HOLIDAYTYPE','SPECIALNONWORKING','Special Non-Working','TL-462','INS->LDAGULTO->2022-08-04 05:17:10'),('HOLIDAYTYPE','LOCAL','Local','TL-463','INS->LDAGULTO->2022-08-04 05:17:19');
/*!40000 ALTER TABLE `global_system_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_system_parameters`
--

DROP TABLE IF EXISTS `global_system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_system_parameters` (
  `PARAMETER_ID` int(11) NOT NULL,
  `PARAMETER` varchar(100) NOT NULL,
  `PARAMETER_DESCRIPTION` varchar(100) NOT NULL,
  `PARAMETER_EXTENSION` varchar(10) DEFAULT NULL,
  `PARAMETER_NUMBER` int(11) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PARAMETER_ID`),
  KEY `global_system_parameter_index` (`PARAMETER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_system_parameters`
--

LOCK TABLES `global_system_parameters` WRITE;
/*!40000 ALTER TABLE `global_system_parameters` DISABLE KEYS */;
INSERT INTO `global_system_parameters` VALUES (1,'System Parameter','Parameter for system parameters.','',25,'TL-2','UPD->LDAGULTO->2022-08-11 02:18:19'),(2,'Transaction Log','Parameter for transaction logs.','TL-',4,'TL-3','UPD->LDAGULTO->2022-08-11 05:04:04'),(3,'Policy','Parameter for policies.','',38,'TL-4','UPD->LDAGULTO->2022-08-06 08:54:41'),(4,'Permissions','Parameter for permissions.','',185,'TL-5','UPD->LDAGULTO->2022-08-06 08:55:19'),(5,'Role','Parameter for role.','RL-',2,'TL-5','UPD->ADMIN->2022-06-12 02:11:29'),(6,'Upload Setting','Parameter for system parameter.','',11,'TL-92','UPD->LDAGULTO->2022-07-08 04:02:04'),(7,'Company','Parameter for company.','',6,'TL-109','UPD->ADMIN->2022-06-16 08:52:06'),(8,'Country','Parameter for country.','',251,'TL-110','UPD->ADMIN->2022-06-15 02:49:27'),(9,'State','Parameter for state.','',5089,'TL-111','UPD->ADMIN->2022-06-15 02:51:26'),(10,'Notification Setting','Parameter for notification setting.','',12,'TL-140','UPD->LDAGULTO->2022-07-27 08:15:36'),(11,'Department','Parameter for department.','DEPT-',3,'TL-184','UPD->ADMIN->2022-06-21 01:14:17'),(12,'Job Position','Parameter for job position.','',7,'TL-195','UPD->LDAGULTO->2022-06-23 08:49:26'),(13,'Work Location','Parameter for work location.','',6,'TL-202','UPD->LDAGULTO->2022-06-23 02:31:24'),(14,'Departure Reason','Parameter for departure reason.','',4,'TL-215','UPD->ADMIN->2022-06-24 01:46:37'),(15,'Employee Type','Parameter for employee type.','',4,'TL-231','UPD->ADMIN->2022-06-24 01:43:08'),(16,'Employee ID','Parameter for employee id.','',3,'TL-272','UPD->ADMIN->2022-06-27 03:54:34'),(17,'Working Hours','Parameter for working hours.','',4,'TL-282','UPD->ADMIN->2022-06-29 10:04:58'),(18,'Attendance Record','Parameter for attendance record.','',18,'TL-303','UPD->LDAGULTO->2022-08-04 03:50:59'),(19,'Notification','Parameter for notifications.','',43,'TL-306','UPD->LDAGULTO->2022-08-04 03:52:09'),(20,'Attendance Adjustment','Parameter for attendance adjustment.','',19,'TL-326','UPD->LDAGULTO->2022-07-31 11:19:19'),(21,'Attendance Creation','Parameter for attendance creation.','',16,'TL-327','UPD->LDAGULTO->2022-07-27 11:34:27'),(22,'Approval Type','Parameter for approval type.','',4,'TL-365','UPD->LDAGULTO->2022-07-23 02:39:44'),(23,'Public Holiday','Parameter for public holidays.','',5,'TL-464','UPD->LDAGULTO->2022-08-06 10:10:32'),(24,'Leave Type','Parameter for leave types.','',3,'TL-476','UPD->LDAGULTO->2022-08-06 08:51:19'),(25,'Leave Allocation','Parameter for leave allocation type.','',5,'TL-487','UPD->LDAGULTO->2022-08-11 05:04:04');
/*!40000 ALTER TABLE `global_system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_transaction_log`
--

DROP TABLE IF EXISTS `global_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_transaction_log` (
  `TRANSACTION_LOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `LOG_TYPE` varchar(100) NOT NULL,
  `LOG_DATE` datetime NOT NULL,
  `LOG` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_transaction_log`
--

LOCK TABLES `global_transaction_log` WRITE;
/*!40000 ALTER TABLE `global_transaction_log` DISABLE KEYS */;
INSERT INTO `global_transaction_log` VALUES ('TL-1','ADMIN','Insert','2021-08-01 12:00:00','User ADMIN inserted user account.'),('TL-2','ADMIN','Insert','2021-08-01 12:00:00','User ADMIN inserted system parameter.'),('TL-3','ADMIN','Insert','2021-08-01 12:00:00','User ADMIN inserted system parameter.'),('TL-4','ADMIN','Insert','2021-08-01 12:00:00','User ADMIN inserted system parameter.'),('TL-5','ADMIN','Insert','2021-08-01 12:00:00','User ADMIN inserted system parameter.'),('TL-1','ADMIN','Update','2022-06-11 18:51:46','User ADMIN updated user account password.'),('TL-1','ADMIN','Log In','2022-06-11 18:51:50','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-06-11 19:44:50','User ADMIN logged out.'),('TL-1','ADMIN','Log In','2022-06-11 19:44:57','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-06-11 19:45:18','User ADMIN logged out.'),('TL-1','ADMIN','Log In','2022-06-11 19:46:35','User ADMIN logged in.'),('TL-5','ADMIN','Insert','2022-06-11 20:36:33','User ADMIN inserted policy.'),('TL-5','ADMIN','Update','2022-06-11 20:37:43','User ADMIN updated policy.'),('TL-6','ADMIN','Insert','2022-06-11 20:39:01','User ADMIN inserted policy.'),('TL-1','ADMIN','Log In','2022-06-12 12:07:07','User ADMIN logged in.'),('TL-7','ADMIN','Insert','2022-06-12 12:12:51','User ADMIN inserted policy.'),('TL-8','ADMIN','Insert','2022-06-12 13:01:31','User ADMIN inserted permission.'),('TL-8','ADMIN','Update','2022-06-12 13:01:34','User ADMIN updated permission.'),('TL-9','ADMIN','Insert','2022-06-12 13:04:42','User ADMIN inserted permission.'),('TL-10','ADMIN','Insert','2022-06-12 13:04:47','User ADMIN inserted permission.'),('TL-11','ADMIN','Insert','2022-06-12 13:04:55','User ADMIN inserted permission.'),('TL-12','ADMIN','Insert','2022-06-12 13:04:59','User ADMIN inserted permission.'),('TL-13','ADMIN','Insert','2022-06-12 13:05:06','User ADMIN inserted permission.'),('TL-9','ADMIN','Update','2022-06-12 13:05:21','User ADMIN updated permission.'),('TL-10','ADMIN','Update','2022-06-12 13:05:25','User ADMIN updated permission.'),('TL-11','ADMIN','Update','2022-06-12 13:05:30','User ADMIN updated permission.'),('TL-12','ADMIN','Update','2022-06-12 13:05:34','User ADMIN updated permission.'),('TL-14','ADMIN','Insert','2022-06-12 13:06:55','User ADMIN inserted policy.'),('TL-15','ADMIN','Insert','2022-06-12 13:07:02','User ADMIN inserted permission.'),('TL-16','ADMIN','Insert','2022-06-12 13:07:07','User ADMIN inserted permission.'),('TL-17','ADMIN','Insert','2022-06-12 13:07:13','User ADMIN inserted permission.'),('TL-18','ADMIN','Insert','2022-06-12 13:07:18','User ADMIN inserted permission.'),('TL-19','ADMIN','Insert','2022-06-12 13:07:26','User ADMIN inserted permission.'),('TL-20','ADMIN','Insert','2022-06-12 13:07:43','User ADMIN inserted policy.'),('TL-21','ADMIN','Insert','2022-06-12 13:08:14','User ADMIN inserted permission.'),('TL-22','ADMIN','Insert','2022-06-12 13:08:19','User ADMIN inserted permission.'),('TL-23','ADMIN','Insert','2022-06-12 13:08:23','User ADMIN inserted permission.'),('TL-24','ADMIN','Insert','2022-06-12 13:08:28','User ADMIN inserted permission.'),('TL-25','ADMIN','Insert','2022-06-12 13:08:33','User ADMIN inserted permission.'),('TL-26','ADMIN','Insert','2022-06-12 13:08:55','User ADMIN inserted policy.'),('TL-27','ADMIN','Insert','2022-06-12 13:09:11','User ADMIN inserted permission.'),('TL-28','ADMIN','Insert','2022-06-12 13:09:15','User ADMIN inserted permission.'),('TL-29','ADMIN','Insert','2022-06-12 13:09:21','User ADMIN inserted permission.'),('TL-30','ADMIN','Insert','2022-06-12 13:09:34','User ADMIN inserted permission.'),('TL-31','ADMIN','Insert','2022-06-12 13:10:00','User ADMIN inserted permission.'),('TL-26','ADMIN','Update','2022-06-12 13:15:47','User ADMIN updated policy.'),('TL-27','ADMIN','Update','2022-06-12 13:16:30','User ADMIN updated permission.'),('TL-28','ADMIN','Update','2022-06-12 13:16:36','User ADMIN updated permission.'),('TL-32','ADMIN','Insert','2022-06-12 14:09:14','User ADMIN inserted role.'),('TL-32','ADMIN','Update','2022-06-12 14:11:04','User ADMIN updated role.'),('TL-32','ADMIN','Update','2022-06-12 14:11:08','User ADMIN updated role.'),('TL-33','ADMIN','Insert','2022-06-12 14:11:29','User ADMIN inserted role.'),('TL-1','ADMIN','Log In','2022-06-13 19:05:34','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-06-13 19:07:22','User ADMIN logged out.'),('TL-1','ADMIN','Log In','2022-06-13 19:08:30','User ADMIN logged in.'),('TL-32','ADMIN','Update','2022-06-13 19:08:58','User ADMIN updated role permission.'),('TL-26','ADMIN','Update','2022-06-13 19:26:21','User ADMIN updated policy.'),('TL-27','ADMIN','Update','2022-06-13 19:26:32','User ADMIN updated permission.'),('TL-28','ADMIN','Update','2022-06-13 19:26:39','User ADMIN updated permission.'),('TL-28','ADMIN','Update','2022-06-13 19:26:43','User ADMIN updated permission.'),('TL-34','ADMIN','Insert','2022-06-13 19:26:49','User ADMIN inserted permission.'),('TL-35','ADMIN','Insert','2022-06-13 19:26:58','User ADMIN inserted permission.'),('TL-36','ADMIN','Insert','2022-06-13 19:27:04','User ADMIN inserted permission.'),('TL-35','ADMIN','Update','2022-06-13 19:32:54','User ADMIN updated permission.'),('TL-36','ADMIN','Update','2022-06-13 19:33:06','User ADMIN updated permission.'),('TL-37','ADMIN','Insert','2022-06-13 19:33:17','User ADMIN inserted permission.'),('TL-38','ADMIN','Insert','2022-06-13 19:33:25','User ADMIN inserted permission.'),('TL-39','ADMIN','Insert','2022-06-13 19:33:33','User ADMIN inserted permission.'),('TL-1','ADMIN','Log In','2022-06-14 09:02:19','User ADMIN logged in.'),('TL-40','ADMIN','Insert','2022-06-14 09:45:11','User ADMIN inserted user account.'),('TL-1','ADMIN','Update','2022-06-14 09:49:05','User ADMIN updated user account (ADMIN).'),('TL-1','ADMIN','Update','2022-06-14 09:50:46','User ADMIN updated user account (ADMIN).'),('TL-1','ADMIN','Update','2022-06-14 09:51:53','User ADMIN updated user account (ADMIN).'),('TL-40','ADMIN','Deactivated','2022-06-14 09:52:37','User ADMIN deactivated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:52:39','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:52:42','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:52:45','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Lock','2022-06-14 09:52:46','User ADMIN locked user account (LDAGULTO).'),('TL-40','ADMIN','Unlock','2022-06-14 09:52:49','User ADMIN unlocked user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:52:51','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:54:19','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:54:25','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:54:53','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:56:31','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Deactivated','2022-06-14 09:56:34','User ADMIN deactivated user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 09:56:37','User ADMIN activated user account (LDAGULTO).'),('TL-40','ADMIN','Lock','2022-06-14 10:00:01','User ADMIN locked user account (LDAGULTO).'),('TL-40','ADMIN','Deactivated','2022-06-14 10:00:05','User ADMIN deactivated user account (LDAGULTO).'),('TL-40','ADMIN','Unlock','2022-06-14 10:00:11','User ADMIN unlocked user account (LDAGULTO).'),('TL-40','ADMIN','Activate','2022-06-14 10:00:13','User ADMIN activated user account (LDAGULTO).'),('TL-32','ADMIN','Update','2022-06-14 10:02:25','User ADMIN updated role permission.'),('TL-24','ADMIN','Update','2022-06-14 10:34:44','User ADMIN updated permission.'),('TL-25','ADMIN','Update','2022-06-14 10:34:53','User ADMIN updated permission.'),('TL-27','ADMIN','Update','2022-06-14 10:35:20','User ADMIN updated permission.'),('TL-28','ADMIN','Update','2022-06-14 10:35:27','User ADMIN updated permission.'),('TL-34','ADMIN','Update','2022-06-14 10:35:31','User ADMIN updated permission.'),('TL-35','ADMIN','Update','2022-06-14 10:35:37','User ADMIN updated permission.'),('TL-36','ADMIN','Update','2022-06-14 10:35:41','User ADMIN updated permission.'),('TL-37','ADMIN','Update','2022-06-14 10:35:46','User ADMIN updated permission.'),('TL-38','ADMIN','Update','2022-06-14 10:35:51','User ADMIN updated permission.'),('TL-39','ADMIN','Update','2022-06-14 10:36:02','User ADMIN updated permission.'),('TL-41','ADMIN','Insert','2022-06-14 10:36:07','User ADMIN inserted permission.'),('TL-42','ADMIN','Insert','2022-06-14 10:43:44','User ADMIN inserted policy.'),('TL-43','ADMIN','Insert','2022-06-14 10:44:23','User ADMIN inserted permission.'),('TL-44','ADMIN','Insert','2022-06-14 10:44:29','User ADMIN inserted permission.'),('TL-45','ADMIN','Insert','2022-06-14 10:44:34','User ADMIN inserted permission.'),('TL-46','ADMIN','Insert','2022-06-14 10:44:39','User ADMIN inserted permission.'),('TL-47','ADMIN','Insert','2022-06-14 10:44:45','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-14 10:45:58','User ADMIN updated role permission.'),('TL-2','ADMIN','Update','2022-06-14 11:21:29','User ADMIN updated system parameter.'),('TL-48','ADMIN','Insert','2022-06-14 11:21:38','User ADMIN inserted system parameter.'),('TL-2','ADMIN','Update','2022-06-14 11:21:45','User ADMIN updated system parameter.'),('TL-49','ADMIN','Insert','2022-06-14 11:24:47','User ADMIN inserted policy.'),('TL-50','ADMIN','Insert','2022-06-14 11:24:57','User ADMIN inserted permission.'),('TL-51','ADMIN','Insert','2022-06-14 11:25:01','User ADMIN inserted permission.'),('TL-52','ADMIN','Insert','2022-06-14 11:25:07','User ADMIN inserted permission.'),('TL-53','ADMIN','Insert','2022-06-14 11:25:11','User ADMIN inserted permission.'),('TL-54','ADMIN','Insert','2022-06-14 11:25:17','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-14 11:30:40','User ADMIN updated role permission.'),('TL-55','ADMIN','Update','2022-06-14 12:01:41','User ADMIN updated system code.'),('TL-56','ADMIN','Update','2022-06-14 13:20:57','User ADMIN updated system code.'),('TL-57','ADMIN','Update','2022-06-14 13:22:22','User ADMIN updated system code.'),('TL-58','ADMIN','Insert','2022-06-14 13:30:38','User ADMIN inserted system code.'),('TL-59','ADMIN','Insert','2022-06-14 13:32:23','User ADMIN inserted system code.'),('TL-60','ADMIN','Insert','2022-06-14 13:32:36','User ADMIN inserted system code.'),('TL-61','ADMIN','Insert','2022-06-14 13:32:45','User ADMIN inserted system code.'),('TL-62','ADMIN','Insert','2022-06-14 13:32:56','User ADMIN inserted system code.'),('TL-63','ADMIN','Insert','2022-06-14 13:33:06','User ADMIN inserted system code.'),('TL-64','ADMIN','Insert','2022-06-14 13:33:18','User ADMIN inserted system code.'),('TL-65','ADMIN','Insert','2022-06-14 13:33:31','User ADMIN inserted system code.'),('TL-66','ADMIN','Insert','2022-06-14 13:33:41','User ADMIN inserted system code.'),('TL-67','ADMIN','Insert','2022-06-14 13:33:50','User ADMIN inserted system code.'),('TL-68','ADMIN','Insert','2022-06-14 13:34:02','User ADMIN inserted system code.'),('TL-69','ADMIN','Insert','2022-06-14 13:34:14','User ADMIN inserted system code.'),('TL-70','ADMIN','Insert','2022-06-14 13:34:27','User ADMIN inserted system code.'),('TL-71','ADMIN','Insert','2022-06-14 13:35:48','User ADMIN inserted system code.'),('TL-72','ADMIN','Insert','2022-06-14 13:35:56','User ADMIN inserted system code.'),('TL-73','ADMIN','Insert','2022-06-14 13:36:06','User ADMIN inserted system code.'),('TL-74','ADMIN','Insert','2022-06-14 13:36:28','User ADMIN inserted system code.'),('TL-75','ADMIN','Insert','2022-06-14 13:36:42','User ADMIN inserted system code.'),('TL-76','ADMIN','Insert','2022-06-14 13:36:52','User ADMIN inserted system code.'),('TL-77','ADMIN','Insert','2022-06-14 13:37:02','User ADMIN inserted system code.'),('TL-78','ADMIN','Insert','2022-06-14 13:37:16','User ADMIN inserted system code.'),('TL-79','ADMIN','Insert','2022-06-14 13:37:28','User ADMIN inserted system code.'),('TL-80','ADMIN','Insert','2022-06-14 13:37:46','User ADMIN inserted system code.'),('TL-81','ADMIN','Insert','2022-06-14 13:38:01','User ADMIN inserted system code.'),('TL-82','ADMIN','Insert','2022-06-14 13:38:10','User ADMIN inserted system code.'),('TL-83','ADMIN','Insert','2022-06-14 13:38:19','User ADMIN inserted system code.'),('TL-84','ADMIN','Insert','2022-06-14 13:38:26','User ADMIN inserted system code.'),('TL-85','ADMIN','Insert','2022-06-14 13:38:34','User ADMIN inserted system code.'),('TL-86','ADMIN','Insert','2022-06-14 13:38:43','User ADMIN inserted system code.'),('TL-87','ADMIN','Insert','2022-06-14 13:38:52','User ADMIN inserted system code.'),('TL-88','ADMIN','Insert','2022-06-14 13:39:00','User ADMIN inserted system code.'),('TL-89','ADMIN','Insert','2022-06-14 13:39:10','User ADMIN inserted system code.'),('TL-90','ADMIN','Insert','2022-06-14 13:39:17','User ADMIN inserted system code.'),('TL-91','ADMIN','Insert','2022-06-14 13:39:27','User ADMIN inserted system code.'),('TL-92','ADMIN','Insert','2022-06-14 14:27:45','User ADMIN inserted system parameter.'),('TL-93','ADMIN','Insert','2022-06-14 14:33:19','User ADMIN inserted policy.'),('TL-94','ADMIN','Insert','2022-06-14 14:33:29','User ADMIN inserted permission.'),('TL-95','ADMIN','Insert','2022-06-14 14:33:34','User ADMIN inserted permission.'),('TL-96','ADMIN','Insert','2022-06-14 14:33:42','User ADMIN inserted permission.'),('TL-97','ADMIN','Insert','2022-06-14 14:33:48','User ADMIN inserted permission.'),('TL-98','ADMIN','Insert','2022-06-14 14:33:54','User ADMIN inserted permission.'),('TL-93','ADMIN','Update','2022-06-14 14:37:55','User ADMIN updated policy.'),('TL-94','ADMIN','Update','2022-06-14 14:38:06','User ADMIN updated permission.'),('TL-95','ADMIN','Update','2022-06-14 14:38:30','User ADMIN updated permission.'),('TL-96','ADMIN','Update','2022-06-14 14:38:36','User ADMIN updated permission.'),('TL-97','ADMIN','Update','2022-06-14 14:38:56','User ADMIN updated permission.'),('TL-98','ADMIN','Update','2022-06-14 14:39:03','User ADMIN updated permission.'),('TL-99','ADMIN','Insert','2022-06-14 14:39:09','User ADMIN inserted permission.'),('TL-100','ADMIN','Insert','2022-06-14 14:40:59','User ADMIN inserted policy.'),('TL-32','ADMIN','Update','2022-06-14 14:47:21','User ADMIN updated role permission.'),('TL-5','ADMIN','Update','2022-06-14 14:53:28','User ADMIN updated system parameter.'),('TL-94','ADMIN','Update','2022-06-14 14:53:45','User ADMIN updated permission.'),('TL-95','ADMIN','Update','2022-06-14 14:53:49','User ADMIN updated permission.'),('TL-96','ADMIN','Update','2022-06-14 14:53:53','User ADMIN updated permission.'),('TL-97','ADMIN','Update','2022-06-14 14:53:58','User ADMIN updated permission.'),('TL-98','ADMIN','Update','2022-06-14 14:54:04','User ADMIN updated permission.'),('TL-93','ADMIN','Update','2022-06-14 14:54:13','User ADMIN updated policy.'),('TL-4','ADMIN','Update','2022-06-14 14:54:35','User ADMIN updated system parameter.'),('TL-93','ADMIN','Update','2022-06-14 14:54:51','User ADMIN updated policy.'),('TL-101','ADMIN','Insert','2022-06-14 15:55:53','User ADMIN inserted upload setting.'),('TL-101','ADMIN','Update','2022-06-14 15:57:20','User ADMIN updated upload setting.'),('TL-92','ADMIN','Update','2022-06-14 16:20:06','User ADMIN updated system parameter.'),('TL-102','ADMIN','Insert','2022-06-14 16:20:39','User ADMIN inserted upload setting.'),('TL-103','ADMIN','Insert','2022-06-14 16:23:35','User ADMIN inserted policy.'),('TL-104','ADMIN','Insert','2022-06-14 16:23:42','User ADMIN inserted permission.'),('TL-105','ADMIN','Insert','2022-06-14 16:23:47','User ADMIN inserted permission.'),('TL-106','ADMIN','Insert','2022-06-14 16:23:53','User ADMIN inserted permission.'),('TL-107','ADMIN','Insert','2022-06-14 16:23:58','User ADMIN inserted permission.'),('TL-108','ADMIN','Insert','2022-06-14 16:24:04','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-14 16:25:33','User ADMIN updated role permission.'),('TL-1','ADMIN','Log In','2022-06-15 08:16:00','User ADMIN logged in.'),('TL-32','ADMIN','Update','2022-06-15 08:42:03','User ADMIN updated role permission.'),('TL-109','ADMIN','Insert','2022-06-15 10:45:02','User ADMIN inserted system parameter.'),('TL-110','ADMIN','Insert','2022-06-15 10:45:22','User ADMIN inserted system parameter.'),('TL-111','ADMIN','Insert','2022-06-15 10:45:39','User ADMIN inserted system parameter.'),('TL-110','ADMIN','Update','2022-06-15 10:49:06','User ADMIN updated system parameter.'),('TL-111','ADMIN','Update','2022-06-15 11:05:30','User ADMIN updated system parameter.'),('TL-112','ADMIN','Insert','2022-06-15 11:37:40','User ADMIN inserted policy.'),('TL-113','ADMIN','Insert','2022-06-15 11:37:52','User ADMIN inserted permission.'),('TL-114','ADMIN','Insert','2022-06-15 11:37:57','User ADMIN inserted permission.'),('TL-115','ADMIN','Insert','2022-06-15 11:38:06','User ADMIN inserted permission.'),('TL-116','ADMIN','Insert','2022-06-15 11:38:12','User ADMIN inserted permission.'),('TL-117','ADMIN','Insert','2022-06-15 11:38:31','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-15 11:45:35','User ADMIN updated role permission.'),('TL-118','ADMIN','Insert','2022-06-15 13:19:53','User ADMIN inserted policy.'),('TL-119','ADMIN','Insert','2022-06-15 13:20:01','User ADMIN inserted permission.'),('TL-120','ADMIN','Insert','2022-06-15 13:20:05','User ADMIN inserted permission.'),('TL-121','ADMIN','Insert','2022-06-15 13:20:16','User ADMIN inserted permission.'),('TL-122','ADMIN','Insert','2022-06-15 13:20:20','User ADMIN inserted permission.'),('TL-123','ADMIN','Insert','2022-06-15 13:20:28','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-15 13:21:46','User ADMIN updated role permission.'),('TL-124','ADMIN','Insert','2022-06-15 14:49:27','User ADMIN inserted country.'),('TL-124','ADMIN','Update','2022-06-15 14:49:31','User ADMIN updated country.'),('TL-125','ADMIN','Update','2022-06-15 14:51:07','User ADMIN updated state.'),('TL-125','ADMIN','Update','2022-06-15 14:51:18','User ADMIN updated state.'),('TL-126','ADMIN','Insert','2022-06-15 14:51:26','User ADMIN inserted state.'),('TL-40','LDAGULTO','Log In','2022-06-16 08:56:19','User LDAGULTO logged in.'),('TL-1','ADMIN','Log In','2022-06-16 20:18:13','User ADMIN logged in.'),('TL-127','ADMIN','Insert','2022-06-16 20:40:28','User ADMIN inserted company.'),('TL-128','ADMIN','Insert','2022-06-16 20:40:43','User ADMIN inserted company.'),('TL-129','ADMIN','Insert','2022-06-16 20:40:56','User ADMIN inserted company.'),('TL-130','ADMIN','Insert','2022-06-16 20:41:22','User ADMIN inserted company.'),('TL-131','ADMIN','Insert','2022-06-16 20:41:54','User ADMIN inserted company.'),('TL-131','ADMIN','Update','2022-06-16 20:41:54','User ADMIN updated company logo.'),('TL-132','ADMIN','Insert','2022-06-16 20:52:06','User ADMIN inserted company.'),('TL-132','ADMIN','Update','2022-06-16 20:53:06','User ADMIN updated company.'),('TL-132','ADMIN','Update','2022-06-16 20:53:12','User ADMIN updated company logo.'),('TL-132','ADMIN','Update','2022-06-16 20:53:12','User ADMIN updated company.'),('TL-132','ADMIN','Update','2022-06-16 21:51:06','User ADMIN updated company logo.'),('TL-132','ADMIN','Update','2022-06-16 21:51:06','User ADMIN updated company.'),('TL-133','ADMIN','Insert','2022-06-17 16:49:11','User ADMIN inserted policy.'),('TL-134','ADMIN','Insert','2022-06-17 16:49:41','User ADMIN inserted permission.'),('TL-135','ADMIN','Insert','2022-06-17 16:49:50','User ADMIN inserted permission.'),('TL-136','ADMIN','Insert','2022-06-17 16:49:59','User ADMIN inserted permission.'),('TL-137','ADMIN','Insert','2022-06-17 16:51:08','User ADMIN inserted permission.'),('TL-138','ADMIN','Insert','2022-06-17 17:07:13','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-17 17:10:53','User ADMIN updated role permission.'),('TL-137','ADMIN','Update','2022-06-18 13:58:19','User ADMIN updated permission.'),('TL-138','ADMIN','Update','2022-06-18 13:58:27','User ADMIN updated permission.'),('TL-139','ADMIN','Insert','2022-06-18 13:58:36','User ADMIN inserted permission.'),('TL-1','ADMIN','Log In','2022-06-18 19:50:34','User ADMIN logged in.'),('TL-140','ADMIN','Insert','2022-06-18 19:59:21','User ADMIN inserted system parameter.'),('TL-32','ADMIN','Update','2022-06-18 20:06:24','User ADMIN updated role permission.'),('TL-141','ADMIN','Insert','2022-06-18 20:26:30','User ADMIN inserted notification setting.'),('TL-141','ADMIN','Update','2022-06-18 20:26:34','User ADMIN updated notification setting.'),('TL-142','ADMIN','Insert','2022-06-18 20:28:32','User ADMIN inserted notification setting.'),('TL-143','ADMIN','Insert','2022-06-18 20:29:02','User ADMIN inserted notification setting.'),('TL-143','ADMIN','Insert','2022-06-18 22:33:29','User ADMIN inserted notification template.'),('TL-143','ADMIN','Update','2022-06-18 22:33:35','User ADMIN updated notification template.'),('TL-143','ADMIN','Update','2022-06-18 22:33:39','User ADMIN updated notification template.'),('TL-144','ADMIN','Insert','2022-06-18 22:34:56','User ADMIN inserted notification setting.'),('TL-144','ADMIN','Insert','2022-06-18 22:35:04','User ADMIN inserted notification template.'),('TL-145','ADMIN','Insert','2022-06-18 22:39:22','User ADMIN inserted policy.'),('TL-146','ADMIN','Insert','2022-06-18 22:39:32','User ADMIN inserted permission.'),('TL-147','ADMIN','Insert','2022-06-18 22:39:43','User ADMIN inserted permission.'),('TL-148','ADMIN','Insert','2022-06-18 22:39:49','User ADMIN inserted permission.'),('TL-1','ADMIN','Log In','2022-06-19 12:01:31','User ADMIN logged in.'),('TL-32','ADMIN','Update','2022-06-19 12:24:25','User ADMIN updated role permission.'),('TL-149','ADMIN','Insert','2022-06-19 12:27:40','User ADMIN inserted policy.'),('TL-150','ADMIN','Insert','2022-06-19 12:27:49','User ADMIN inserted permission.'),('TL-151','ADMIN','Insert','2022-06-19 12:27:58','User ADMIN inserted permission.'),('TL-152','ADMIN','Insert','2022-06-19 12:28:04','User ADMIN inserted permission.'),('TL-153','ADMIN','Insert','2022-06-19 12:31:01','User ADMIN inserted policy.'),('TL-154','ADMIN','Insert','2022-06-19 12:31:30','User ADMIN inserted permission.'),('TL-155','ADMIN','Insert','2022-06-19 12:31:38','User ADMIN inserted permission.'),('TL-156','ADMIN','Insert','2022-06-19 12:31:44','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-19 12:33:19','User ADMIN updated role permission.'),('TL-157','ADMIN','Insert','2022-06-19 12:40:28','User ADMIN inserted policy.'),('TL-158','ADMIN','Insert','2022-06-19 12:40:36','User ADMIN inserted permission.'),('TL-159','ADMIN','Insert','2022-06-19 12:40:43','User ADMIN inserted permission.'),('TL-160','ADMIN','Insert','2022-06-19 12:40:48','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-19 12:42:23','User ADMIN updated role permission.'),('TL-161','ADMIN','Insert','2022-06-19 13:11:33','User ADMIN inserted upload setting.'),('TL-1','ADMIN','Log In','2022-06-19 13:18:35','User ADMIN logged in.'),('TL-162','ADMIN','Insert','2022-06-19 13:19:59','User ADMIN inserted upload setting.'),('TL-161','ADMIN','Update','2022-06-19 13:20:02','User ADMIN updated upload setting.'),('TL-163','ADMIN','Insert','2022-06-19 13:20:30','User ADMIN inserted upload setting.'),('TL-164','ADMIN','Insert','2022-06-19 13:21:16','User ADMIN inserted upload setting.'),('TL-165','ADMIN','Insert','2022-06-19 13:21:43','User ADMIN inserted upload setting.'),('TL-1','ADMIN','Log In','2022-06-19 20:16:40','User ADMIN logged in.'),('TL-166','ADMIN','Update','2022-06-19 22:02:02','User ADMIN updated login logo.'),('TL-166','ADMIN','Update','2022-06-19 22:02:42','User ADMIN updated login logo.'),('TL-166','ADMIN','Update','2022-06-19 22:02:48','User ADMIN updated login logo.'),('TL-166','ADMIN','Update','2022-06-19 22:03:52','User ADMIN updated login background.'),('TL-166','ADMIN','Update','2022-06-19 22:06:01','User ADMIN updated login background.'),('TL-166','ADMIN','Update','2022-06-19 22:06:21','User ADMIN updated menu logo.'),('TL-166','ADMIN','Update','2022-06-19 22:06:21','User ADMIN updated menu icon.'),('TL-166','ADMIN','Update','2022-06-19 22:06:21','User ADMIN updated favicon.'),('TL-1','ADMIN','Log In','2022-06-19 22:12:33','User ADMIN logged out.'),('TL-1','ADMIN','Log In','2022-06-19 22:13:47','User ADMIN logged in.'),('TL-166','ADMIN','Update','2022-06-19 22:14:08','User ADMIN updated login background.'),('TL-1','ADMIN','Log In','2022-06-19 22:14:10','User ADMIN logged out.'),('TL-167','ADMIN','Insert','2022-06-20 14:29:55','User ADMIN inserted system code.'),('TL-168','ADMIN','Insert','2022-06-20 14:30:11','User ADMIN inserted system code.'),('TL-169','ADMIN','Insert','2022-06-20 14:30:17','User ADMIN inserted system code.'),('TL-170','ADMIN','Insert','2022-06-20 14:30:23','User ADMIN inserted system code.'),('TL-171','ADMIN','Insert','2022-06-20 14:30:28','User ADMIN inserted system code.'),('TL-172','ADMIN','Insert','2022-06-20 14:42:03','User ADMIN inserted mail configuration.'),('TL-172','ADMIN','Update','2022-06-20 14:42:12','User ADMIN updated mail configuration.'),('TL-173','ADMIN','Insert','2022-06-20 14:46:43','User ADMIN inserted notification setting.'),('TL-174','ADMIN','Insert','2022-06-20 14:55:18','User ADMIN inserted system code.'),('TL-175','ADMIN','Insert','2022-06-20 14:55:32','User ADMIN inserted system code.'),('TL-176','ADMIN','Insert','2022-06-20 14:55:52','User ADMIN inserted system code.'),('TL-154','ADMIN','Update','2022-06-20 14:56:16','User ADMIN updated permission.'),('TL-155','ADMIN','Update','2022-06-20 14:56:48','User ADMIN updated permission.'),('TL-153','ADMIN','Update','2022-06-20 14:57:16','User ADMIN updated policy.'),('TL-4','ADMIN','Update','2022-06-20 14:57:37','User ADMIN updated system parameter.'),('TL-5','ADMIN','Update','2022-06-20 14:57:41','User ADMIN updated system parameter.'),('TL-177','ADMIN','Insert','2022-06-20 15:41:15','User ADMIN inserted zoom integration.'),('TL-173','ADMIN','Update','2022-06-20 16:07:06','User ADMIN updated notification setting.'),('TL-173','ADMIN','Update','2022-06-20 16:07:49','User ADMIN updated notification setting.'),('TL-173','ADMIN','Update','2022-06-20 16:07:54','User ADMIN updated notification setting.'),('TL-173','ADMIN','Update','2022-06-20 16:07:57','User ADMIN updated notification setting.'),('TL-173','ADMIN','Update','2022-06-20 16:08:05','User ADMIN updated notification setting.'),('TL-178','ADMIN','Insert','2022-06-20 16:50:14','User ADMIN inserted policy.'),('TL-179','ADMIN','Insert','2022-06-20 16:50:45','User ADMIN inserted permission.'),('TL-180','ADMIN','Insert','2022-06-20 16:50:49','User ADMIN inserted permission.'),('TL-181','ADMIN','Insert','2022-06-20 16:50:54','User ADMIN inserted permission.'),('TL-182','ADMIN','Insert','2022-06-20 16:50:59','User ADMIN inserted permission.'),('TL-183','ADMIN','Insert','2022-06-20 16:51:07','User ADMIN inserted permission.'),('TL-184','ADMIN','Insert','2022-06-20 16:59:38','User ADMIN inserted system parameter.'),('TL-185','ADMIN','Insert','2022-06-21 13:13:09','User ADMIN inserted department.'),('TL-32','ADMIN','Update','2022-06-21 13:13:51','User ADMIN updated role permission.'),('TL-186','ADMIN','Insert','2022-06-21 13:14:12','User ADMIN inserted department.'),('TL-187','ADMIN','Insert','2022-06-21 13:14:17','User ADMIN inserted department.'),('TL-188','ADMIN','Insert','2022-06-21 13:20:24','User ADMIN inserted upload setting.'),('TL-161','ADMIN','Update','2022-06-21 13:20:28','User ADMIN updated upload setting.'),('TL-189','ADMIN','Insert','2022-06-21 13:21:02','User ADMIN inserted policy.'),('TL-190','ADMIN','Insert','2022-06-21 13:21:11','User ADMIN inserted permission.'),('TL-191','ADMIN','Insert','2022-06-21 13:21:17','User ADMIN inserted permission.'),('TL-192','ADMIN','Insert','2022-06-21 13:21:22','User ADMIN inserted permission.'),('TL-192','ADMIN','Update','2022-06-21 13:21:29','User ADMIN updated permission.'),('TL-193','ADMIN','Insert','2022-06-21 13:21:34','User ADMIN inserted permission.'),('TL-194','ADMIN','Insert','2022-06-21 13:21:41','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-21 13:22:48','User ADMIN updated role permission.'),('TL-195','ADMIN','Insert','2022-06-21 13:41:23','User ADMIN inserted system parameter.'),('TL-196','ADMIN','Insert','2022-06-21 14:30:40','User ADMIN inserted job position.'),('TL-197','ADMIN','Insert','2022-06-21 14:31:27','User ADMIN inserted job position.'),('TL-198','ADMIN','Insert','2022-06-21 14:32:27','User ADMIN inserted job position.'),('TL-198','ADMIN','Update','2022-06-21 14:32:27','User ADMIN updated job description.'),('TL-199','ADMIN','Insert','2022-06-21 15:59:56','User ADMIN inserted job position.'),('TL-199','ADMIN','Update','2022-06-21 15:59:56','User ADMIN updated job description.'),('TL-200','ADMIN','Insert','2022-06-21 16:04:28','User ADMIN inserted job position.'),('TL-200','ADMIN','Update','2022-06-21 16:04:28','User ADMIN updated job description.'),('TL-201','ADMIN','Insert','2022-06-21 16:08:27','User ADMIN inserted job position.'),('TL-201','ADMIN','Update','2022-06-21 16:08:28','User ADMIN updated job description.'),('TL-201','ADMIN','Update','2022-06-21 16:08:57','User ADMIN updated job description.'),('TL-201','ADMIN','Update','2022-06-21 16:08:57','User ADMIN updated job position.'),('TL-201','ADMIN','Update','2022-06-21 16:09:15','User ADMIN updated job position.'),('TL-40','LDAGULTO','Log In','2022-06-23 08:31:27','User LDAGULTO logged in.'),('TL-202','LDAGULTO','Insert','2022-06-23 08:39:54','User LDAGULTO inserted system parameter.'),('TL-203','LDAGULTO','Insert','2022-06-23 08:40:07','User LDAGULTO inserted policy.'),('TL-204','LDAGULTO','Insert','2022-06-23 08:40:19','User LDAGULTO inserted permission.'),('TL-205','LDAGULTO','Insert','2022-06-23 08:40:31','User LDAGULTO inserted permission.'),('TL-206','LDAGULTO','Insert','2022-06-23 08:40:36','User LDAGULTO inserted permission.'),('TL-207','LDAGULTO','Insert','2022-06-23 08:40:40','User LDAGULTO inserted permission.'),('TL-208','LDAGULTO','Insert','2022-06-23 08:40:47','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-06-23 08:41:52','User LDAGULTO updated role permission.'),('TL-32','LDAGULTO','Update','2022-06-23 08:42:50','User LDAGULTO updated role permission.'),('TL-209','LDAGULTO','Insert','2022-06-23 08:49:26','User LDAGULTO inserted job position.'),('TL-209','LDAGULTO','Update','2022-06-23 08:49:26','User LDAGULTO updated job description.'),('TL-210','LDAGULTO','Insert','2022-06-23 13:11:36','User LDAGULTO inserted work location.'),('TL-211','LDAGULTO','Insert','2022-06-23 13:13:20','User LDAGULTO inserted work location.'),('TL-212','LDAGULTO','Insert','2022-06-23 13:14:47','User LDAGULTO inserted work location.'),('TL-213','LDAGULTO','Insert','2022-06-23 13:16:04','User LDAGULTO inserted work location.'),('TL-214','LDAGULTO','Insert','2022-06-23 13:17:12','User LDAGULTO inserted work location.'),('TL-213','LDAGULTO','Update','2022-06-23 13:18:04','User LDAGULTO updated work location.'),('TL-214','LDAGULTO','Update','2022-06-23 13:18:08','User LDAGULTO updated work location.'),('TL-215','LDAGULTO','Insert','2022-06-23 13:25:33','User LDAGULTO inserted system parameter.'),('TL-216','LDAGULTO','Insert','2022-06-23 13:45:54','User LDAGULTO inserted policy.'),('TL-217','LDAGULTO','Insert','2022-06-23 13:46:06','User LDAGULTO inserted permission.'),('TL-218','LDAGULTO','Insert','2022-06-23 13:46:13','User LDAGULTO inserted permission.'),('TL-219','LDAGULTO','Insert','2022-06-23 13:46:20','User LDAGULTO inserted permission.'),('TL-220','LDAGULTO','Insert','2022-06-23 13:46:29','User LDAGULTO inserted permission.'),('TL-221','LDAGULTO','Insert','2022-06-23 13:46:35','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-06-23 13:50:02','User LDAGULTO updated role permission.'),('TL-222','LDAGULTO','Insert','2022-06-23 14:31:24','User LDAGULTO inserted work location.'),('TL-223','LDAGULTO','Insert','2022-06-23 14:40:49','User LDAGULTO inserted departure reason.'),('TL-223','LDAGULTO','Update','2022-06-23 14:42:14','User LDAGULTO updated departure reason.'),('TL-224','LDAGULTO','Insert','2022-06-23 14:42:19','User LDAGULTO inserted departure reason.'),('TL-225','LDAGULTO','Insert','2022-06-23 17:18:57','User LDAGULTO inserted policy.'),('TL-226','LDAGULTO','Insert','2022-06-23 17:19:05','User LDAGULTO inserted permission.'),('TL-227','LDAGULTO','Insert','2022-06-23 17:19:09','User LDAGULTO inserted permission.'),('TL-228','LDAGULTO','Insert','2022-06-23 17:19:14','User LDAGULTO inserted permission.'),('TL-229','LDAGULTO','Insert','2022-06-23 17:19:18','User LDAGULTO inserted permission.'),('TL-230','LDAGULTO','Insert','2022-06-23 17:19:23','User LDAGULTO inserted permission.'),('TL-231','LDAGULTO','Insert','2022-06-23 17:20:13','User LDAGULTO inserted system parameter.'),('TL-32','LDAGULTO','Update','2022-06-23 17:25:19','User LDAGULTO updated role permission.'),('TL-1','ADMIN','Log In','2022-06-24 08:15:30','User ADMIN logged in.'),('TL-225','ADMIN','Update','2022-06-24 08:22:46','User ADMIN updated policy.'),('TL-226','ADMIN','Update','2022-06-24 08:22:54','User ADMIN updated permission.'),('TL-227','ADMIN','Update','2022-06-24 08:22:58','User ADMIN updated permission.'),('TL-228','ADMIN','Update','2022-06-24 08:23:03','User ADMIN updated permission.'),('TL-229','ADMIN','Update','2022-06-24 08:23:07','User ADMIN updated permission.'),('TL-230','ADMIN','Update','2022-06-24 08:51:52','User ADMIN updated permission.'),('TL-232','ADMIN','Insert','2022-06-24 08:52:01','User ADMIN inserted permission.'),('TL-233','ADMIN','Insert','2022-06-24 08:52:07','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-24 08:53:16','User ADMIN updated role permission.'),('TL-231','ADMIN','Update','2022-06-24 08:53:33','User ADMIN updated system parameter.'),('TL-234','ADMIN','Insert','2022-06-24 09:42:56','User ADMIN inserted policy.'),('TL-225','ADMIN','Update','2022-06-24 09:43:03','User ADMIN updated policy.'),('TL-235','ADMIN','Insert','2022-06-24 09:43:11','User ADMIN inserted permission.'),('TL-236','ADMIN','Insert','2022-06-24 09:43:17','User ADMIN inserted permission.'),('TL-237','ADMIN','Insert','2022-06-24 09:43:24','User ADMIN inserted permission.'),('TL-238','ADMIN','Insert','2022-06-24 09:43:30','User ADMIN inserted permission.'),('TL-239','ADMIN','Insert','2022-06-24 09:43:35','User ADMIN inserted permission.'),('TL-231','ADMIN','Update','2022-06-24 09:54:08','User ADMIN updated system parameter.'),('TL-32','ADMIN','Update','2022-06-24 10:04:14','User ADMIN updated role permission.'),('TL-240','ADMIN','Insert','2022-06-24 13:08:37','User ADMIN inserted employee type.'),('TL-240','ADMIN','Update','2022-06-24 13:08:41','User ADMIN updated employee type.'),('TL-241','ADMIN','Insert','2022-06-24 13:08:47','User ADMIN inserted employee type.'),('TL-187','ADMIN','Update','2022-06-24 13:42:50','User ADMIN updated department.'),('TL-242','ADMIN','Insert','2022-06-24 13:43:02','User ADMIN inserted employee type.'),('TL-243','ADMIN','Insert','2022-06-24 13:43:08','User ADMIN inserted employee type.'),('TL-222','ADMIN','Update','2022-06-24 13:46:13','User ADMIN updated work location.'),('TL-222','ADMIN','Update','2022-06-24 13:46:20','User ADMIN updated work location.'),('TL-244','ADMIN','Insert','2022-06-24 13:46:33','User ADMIN inserted departure reason.'),('TL-245','ADMIN','Insert','2022-06-24 13:46:37','User ADMIN inserted departure reason.'),('TL-246','ADMIN','Insert','2022-06-24 15:01:20','User ADMIN inserted system code.'),('TL-247','ADMIN','Insert','2022-06-24 15:01:30','User ADMIN inserted system code.'),('TL-248','ADMIN','Insert','2022-06-24 15:01:41','User ADMIN inserted system code.'),('TL-249','ADMIN','Insert','2022-06-24 15:02:08','User ADMIN inserted system code.'),('TL-250','ADMIN','Insert','2022-06-24 15:02:23','User ADMIN inserted system code.'),('TL-251','ADMIN','Insert','2022-06-24 15:02:47','User ADMIN inserted system code.'),('TL-252','ADMIN','Insert','2022-06-24 15:03:56','User ADMIN inserted system code.'),('TL-253','ADMIN','Insert','2022-06-24 15:04:11','User ADMIN inserted system code.'),('TL-254','ADMIN','Insert','2022-06-24 15:08:09','User ADMIN inserted system code.'),('TL-255','ADMIN','Insert','2022-06-24 15:08:34','User ADMIN inserted system code.'),('TL-256','ADMIN','Insert','2022-06-24 15:08:41','User ADMIN inserted system code.'),('TL-257','ADMIN','Insert','2022-06-24 15:08:48','User ADMIN inserted system code.'),('TL-258','ADMIN','Insert','2022-06-24 16:19:58','User ADMIN inserted system code.'),('TL-259','ADMIN','Insert','2022-06-24 16:21:13','User ADMIN inserted system code.'),('TL-260','ADMIN','Insert','2022-06-24 16:21:22','User ADMIN inserted system code.'),('TL-261','ADMIN','Insert','2022-06-24 16:21:30','User ADMIN inserted system code.'),('TL-262','ADMIN','Insert','2022-06-24 16:21:43','User ADMIN inserted system code.'),('TL-263','ADMIN','Insert','2022-06-24 16:21:50','User ADMIN inserted system code.'),('TL-1','ADMIN','Log In','2022-06-24 22:57:58','User ADMIN logged in.'),('TL-264','ADMIN','Insert','2022-06-24 23:17:17','User ADMIN inserted system code.'),('TL-265','ADMIN','Insert','2022-06-24 23:17:35','User ADMIN inserted system code.'),('TL-266','ADMIN','Insert','2022-06-24 23:17:47','User ADMIN inserted system code.'),('TL-267','ADMIN','Insert','2022-06-24 23:17:54','User ADMIN inserted system code.'),('TL-268','ADMIN','Insert','2022-06-24 23:18:05','User ADMIN inserted system code.'),('TL-269','ADMIN','Insert','2022-06-24 23:18:12','User ADMIN inserted system code.'),('TL-1','ADMIN','Log In','2022-06-25 20:08:30','User ADMIN logged in.'),('TL-270','ADMIN','Insert','2022-06-25 21:35:09','User ADMIN inserted upload setting.'),('TL-271','ADMIN','Insert','2022-06-25 21:35:38','User ADMIN inserted upload setting.'),('TL-1','ADMIN','Log In','2022-06-27 10:56:16','User ADMIN logged in.'),('TL-272','ADMIN','Insert','2022-06-27 13:41:25','User ADMIN inserted system parameter.'),('TL-273','ADMIN','Insert','2022-06-27 15:10:42','User ADMIN inserted employee.'),('TL-273','ADMIN','Update','2022-06-27 15:28:23','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:29:10','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:30:11','User ADMIN updated work permit.'),('TL-273','ADMIN','Update','2022-06-27 15:30:12','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:31:23','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:32:23','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:33:28','User ADMIN updated employee.'),('TL-273','ADMIN','Update','2022-06-27 15:35:20','User ADMIN updated employee image.'),('TL-273','ADMIN','Update','2022-06-27 15:35:20','User ADMIN updated employee.'),('TL-274','ADMIN','Insert','2022-06-27 15:39:03','User ADMIN inserted employee.'),('TL-274','ADMIN','Update','2022-06-27 15:39:03','User ADMIN updated employee image.'),('TL-274','ADMIN','Update','2022-06-27 15:39:03','User ADMIN updated work permit.'),('TL-275','ADMIN','Insert','2022-06-27 15:54:35','User ADMIN inserted employee.'),('TL-275','ADMIN','Update','2022-06-27 15:54:35','User ADMIN updated employee image.'),('TL-276','ADMIN','Insert','2022-06-27 16:32:38','User ADMIN inserted policy.'),('TL-277','ADMIN','Insert','2022-06-27 16:36:43','User ADMIN inserted permission.'),('TL-278','ADMIN','Insert','2022-06-27 16:36:49','User ADMIN inserted permission.'),('TL-279','ADMIN','Insert','2022-06-27 16:36:54','User ADMIN inserted permission.'),('TL-280','ADMIN','Insert','2022-06-27 16:37:00','User ADMIN inserted permission.'),('TL-281','ADMIN','Insert','2022-06-27 16:37:05','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-27 16:40:43','User ADMIN updated role permission.'),('TL-282','ADMIN','Insert','2022-06-27 16:43:04','User ADMIN inserted system parameter.'),('TL-283','ADMIN','Insert','2022-06-27 17:15:46','User ADMIN inserted working hours.'),('TL-283','ADMIN','Update','2022-06-27 17:15:49','User ADMIN updated working hours.'),('TL-284','ADMIN','Insert','2022-06-27 17:15:55','User ADMIN inserted working hours.'),('TL-280','ADMIN','Update','2022-06-27 17:16:42','User ADMIN updated permission.'),('TL-281','ADMIN','Update','2022-06-27 17:16:52','User ADMIN updated permission.'),('TL-285','ADMIN','Insert','2022-06-27 17:16:58','User ADMIN inserted permission.'),('TL-286','ADMIN','Insert','2022-06-27 17:17:49','User ADMIN inserted working hours.'),('TL-32','ADMIN','Update','2022-06-27 17:20:42','User ADMIN updated role permission.'),('TL-1','ADMIN','Log In','2022-06-28 08:21:09','User ADMIN logged in.'),('TL-275','ADMIN','Update','2022-06-28 09:00:33','User ADMIN updated employee.'),('TL-209','ADMIN','Update','2022-06-28 09:00:46','User ADMIN updated job position.'),('TL-132','ADMIN','Update','2022-06-28 09:04:04','User ADMIN updated company.'),('TL-286','ADMIN','Update','2022-06-28 09:49:06','User ADMIN updated working hours.'),('TL-287','ADMIN','Insert','2022-06-28 14:43:00','User ADMIN inserted system code.'),('TL-288','ADMIN','Insert','2022-06-28 14:43:24','User ADMIN inserted system code.'),('TL-289','ADMIN','Insert','2022-06-28 14:43:55','User ADMIN inserted system code.'),('TL-290','ADMIN','Insert','2022-06-28 14:46:20','User ADMIN inserted system code.'),('TL-291','ADMIN','Insert','2022-06-28 14:46:33','User ADMIN inserted system code.'),('TL-292','ADMIN','Insert','2022-06-28 14:46:43','User ADMIN inserted system code.'),('TL-286','ADMIN','Update','2022-06-28 14:52:28','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-28 14:52:38','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-28 15:14:03','User ADMIN updated working hours.'),('TL-286','ADMIN','Insert','2022-06-28 16:27:00','User ADMIN inserted working hours schedule.'),('TL-286','ADMIN','Update','2022-06-28 16:27:56','User ADMIN updated working hours schedule.'),('TL-286','ADMIN','Update','2022-06-28 16:30:33','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-28 16:30:39','User ADMIN updated working hours schedule.'),('TL-286','ADMIN','Update','2022-06-28 16:30:45','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-28 16:30:52','User ADMIN updated working hours.'),('TL-1','ADMIN','Log In','2022-06-29 08:33:03','User ADMIN logged in.'),('TL-286','ADMIN','Update','2022-06-29 09:02:55','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-29 09:42:46','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-29 09:42:52','User ADMIN updated working hours schedule.'),('TL-275','ADMIN','Update','2022-06-29 09:42:52','User ADMIN updated employee working hours.'),('TL-286','ADMIN','Update','2022-06-29 09:59:25','User ADMIN updated working hours schedule.'),('TL-286','ADMIN','Update','2022-06-29 10:00:39','User ADMIN updated working hours schedule.'),('TL-286','ADMIN','Update','2022-06-29 10:01:41','User ADMIN updated working hours schedule.'),('TL-286','ADMIN','Update','2022-06-29 10:01:58','User ADMIN updated working hours schedule.'),('TL-275','ADMIN','Update','2022-06-29 10:01:58','User ADMIN updated employee working hours.'),('TL-293','ADMIN','Insert','2022-06-29 10:04:58','User ADMIN inserted working hours.'),('TL-293','ADMIN','Insert','2022-06-29 10:06:50','User ADMIN inserted working hours schedule.'),('TL-293','ADMIN','Update','2022-06-29 10:06:57','User ADMIN updated working hours schedule.'),('TL-293','ADMIN','Update','2022-06-29 10:07:20','User ADMIN updated working hours schedule.'),('TL-293','ADMIN','Update','2022-06-29 10:08:16','User ADMIN updated working hours schedule.'),('TL-275','ADMIN','Update','2022-06-29 10:08:16','User ADMIN updated employee working hours.'),('TL-286','ADMIN','Update','2022-06-29 10:08:31','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-29 10:08:35','User ADMIN updated working hours.'),('TL-286','ADMIN','Update','2022-06-29 10:08:49','User ADMIN updated working hours schedule.'),('TL-275','ADMIN','Update','2022-06-29 10:08:49','User ADMIN updated employee working hours.'),('TL-294','ADMIN','Insert','2022-06-29 10:12:33','User ADMIN inserted policy.'),('TL-295','ADMIN','Insert','2022-06-29 10:13:20','User ADMIN inserted permission.'),('TL-296','ADMIN','Insert','2022-06-29 10:13:29','User ADMIN inserted permission.'),('TL-297','ADMIN','Insert','2022-06-29 10:13:37','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-29 10:18:47','User ADMIN updated role permission.'),('TL-298','ADMIN','Insert','2022-06-29 16:14:08','User ADMIN inserted attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:16:04','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:16:17','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:16:27','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:43:45','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:51:00','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:54:26','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:54:37','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 16:54:57','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:03:55','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:06:16','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:08:11','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:10:15','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:15:45','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:15:50','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:15:56','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:16:14','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:16:18','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:17:16','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:19:07','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:19:38','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:19:54','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:20:45','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:20:54','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:20:58','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:21:08','User ADMIN updated attendance setting.'),('TL-299','ADMIN','Update','2022-06-29 17:22:26','User ADMIN updated attendance setting.'),('TL-40','LDAGULTO','Log In','2022-06-30 09:13:46','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-06-30 09:13:56','User LDAGULTO logged out.'),('TL-40','LDAGULTO','Log In','2022-06-30 09:14:01','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-06-30 09:14:05','User LDAGULTO logged out.'),('TL-1','ADMIN','Log In','2022-06-30 09:14:08','User ADMIN logged in.'),('TL-275','ADMIN','Archive','2022-06-30 11:39:43','User ADMIN archive employee.'),('TL-275','ADMIN','Unarchive','2022-06-30 11:41:47','User ADMIN unarchived employee.'),('TL-275','ADMIN','Unarchive','2022-06-30 11:41:59','User ADMIN unarchived employee.'),('TL-275','ADMIN','Archive','2022-06-30 11:42:38','User ADMIN archive employee.'),('TL-275','ADMIN','Unarchive','2022-06-30 11:42:44','User ADMIN unarchived employee.'),('TL-275','ADMIN','Archive','2022-06-30 11:46:17','User ADMIN archive employee.'),('TL-275','ADMIN','Unarchive','2022-06-30 11:46:21','User ADMIN unarchived employee.'),('TL-275','ADMIN','Archive','2022-06-30 11:47:10','User ADMIN archive employee.'),('TL-275','ADMIN','Unarchive','2022-06-30 11:47:17','User ADMIN unarchived employee.'),('TL-300','ADMIN','Insert','2022-06-30 11:51:41','User ADMIN inserted policy.'),('TL-301','ADMIN','Insert','2022-06-30 11:51:50','User ADMIN inserted permission.'),('TL-302','ADMIN','Insert','2022-06-30 11:52:02','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-06-30 11:53:26','User ADMIN updated role permission.'),('TL-299','ADMIN','Update','2022-06-30 11:55:03','User ADMIN updated attendance setting.'),('TL-1','ADMIN','Log In','2022-06-30 13:40:13','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-06-30 13:40:21','User LDAGULTO logged in.'),('TL-1','LDAGULTO','Update','2022-06-30 14:00:04','User LDAGULTO updated user account.'),('TL-40','LDAGULTO','Update','2022-06-30 14:00:10','User LDAGULTO updated user account.'),('TL-1','LDAGULTO','Update','2022-06-30 14:56:54','User LDAGULTO updated user account.'),('TL-1','LDAGULTO','Update','2022-06-30 14:58:06','User LDAGULTO updated user account.'),('TL-1','LDAGULTO','Update','2022-06-30 14:58:43','User LDAGULTO updated user account.'),('TL-275','LDAGULTO','Link','2022-06-30 14:58:43','User LDAGULTO linked user account to employee.'),('TL-40','LDAGULTO','Update','2022-06-30 14:58:54','User LDAGULTO updated user account.'),('TL-275','LDAGULTO','Link','2022-06-30 14:58:54','User LDAGULTO linked user account to employee.'),('TL-40','LDAGULTO','Update','2022-06-30 14:59:24','User LDAGULTO updated user account.'),('TL-40','LDAGULTO','Update','2022-06-30 15:00:43','User LDAGULTO updated user account.'),('TL-275','LDAGULTO','Link','2022-06-30 15:00:43','User LDAGULTO linked user account to employee.'),('TL-275','LDAGULTO','Update','2022-06-30 15:08:00','User LDAGULTO updated employee image.'),('TL-275','LDAGULTO','Update','2022-06-30 15:08:00','User LDAGULTO updated employee.'),('TL-1','ADMIN','Log In','2022-07-01 08:19:36','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-01 08:19:43','User LDAGULTO logged in.'),('TL-303','LDAGULTO','Insert','2022-07-01 08:40:00','User LDAGULTO inserted system parameter.'),('TL-275','LDAGULTO','Update','2022-07-01 09:10:31','User LDAGULTO updated employee.'),('TL-140','LDAGULTO','Update','2022-07-01 14:54:25','User LDAGULTO updated system parameter.'),('TL-304','LDAGULTO','Insert','2022-07-01 14:56:32','User LDAGULTO inserted notification setting.'),('TL-305','LDAGULTO','Insert','2022-07-01 14:57:04','User LDAGULTO inserted notification setting.'),('TL-304','LDAGULTO','Insert','2022-07-01 14:59:39','User LDAGULTO inserted notification template.'),('TL-304','LDAGULTO','Update','2022-07-01 14:59:58','User LDAGULTO updated notification template.'),('TL-305','LDAGULTO','Insert','2022-07-01 15:00:19','User LDAGULTO inserted notification template.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-01 21:08:02','User LDAGULTO attempted to log in.'),('TL-40','LDAGULTO','Log In','2022-07-01 21:08:06','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-02 07:51:04','User LDAGULTO attempted to log in.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-02 07:51:11','User LDAGULTO attempted to log in.'),('TL-40','LDAGULTO','Log In','2022-07-02 07:51:14','User LDAGULTO logged in.'),('TL-1','ADMIN','Log In','2022-07-02 12:16:21','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-07-02 12:16:41','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-02 12:16:48','User LDAGULTO logged in.'),('TL-299','LDAGULTO','Update','2022-07-02 12:34:47','User LDAGULTO updated attendance setting.'),('TL-299','LDAGULTO','Update','2022-07-02 12:35:16','User LDAGULTO updated attendance setting.'),('TL-286','LDAGULTO','Update','2022-07-02 12:39:40','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 12:39:40','User LDAGULTO updated employee working hours.'),('TL-286','LDAGULTO','Update','2022-07-02 12:40:13','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 12:40:13','User LDAGULTO updated employee working hours.'),('TL-286','LDAGULTO','Update','2022-07-02 12:41:34','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 12:41:34','User LDAGULTO updated employee working hours.'),('TL-40','LDAGULTO','Log In','2022-07-02 13:09:00','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-07-02 19:02:44','User LDAGULTO logged in.'),('TL-286','LDAGULTO','Update','2022-07-02 19:03:06','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 19:03:06','User LDAGULTO updated employee working hours.'),('TL-286','LDAGULTO','Update','2022-07-02 19:07:39','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 19:07:39','User LDAGULTO updated employee working hours.'),('TL-299','LDAGULTO','Update','2022-07-02 19:23:45','User LDAGULTO updated attendance setting.'),('TL-286','LDAGULTO','Update','2022-07-02 19:30:00','User LDAGULTO updated working hours schedule.'),('TL-275','LDAGULTO','Update','2022-07-02 19:30:00','User LDAGULTO updated employee working hours.'),('TL-299','LDAGULTO','Update','2022-07-02 19:44:13','User LDAGULTO updated attendance setting.'),('TL-1','ADMIN','Log In','2022-07-04 11:06:06','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-07-04 11:06:52','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-04 11:07:13','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-07-04 11:09:05','User LDAGULTO logged out.'),('TL-1','ADMIN','Log In','2022-07-04 11:09:10','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-07-04 11:19:04','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-04 11:19:09','User LDAGULTO logged in.'),('TL-306','LDAGULTO','Insert','2022-07-04 15:09:25','User LDAGULTO inserted system parameter.'),('TL-307','LDAGULTO','Time In','2022-07-04 15:35:19','User LDAGULTO time in.'),('TL-308','LDAGULTO','Time In','2022-07-04 15:58:25','User LDAGULTO time in.'),('TL-308','LDAGULTO','Time Out','2022-07-04 17:04:39','User LDAGULTO time out.'),('TL-309','LDAGULTO','Time In','2022-07-04 17:07:07','User LDAGULTO time in.'),('TL-309','LDAGULTO','Time Out','2022-07-04 17:07:10','User LDAGULTO time out.'),('TL-310','LDAGULTO','Time In','2022-07-04 17:09:31','User LDAGULTO time in.'),('TL-310','LDAGULTO','Time Out','2022-07-04 17:11:40','User LDAGULTO time out.'),('TL-40','LDAGULTO','Log In','2022-07-05 08:34:40','User LDAGULTO logged in.'),('TL-311','LDAGULTO','Time In','2022-07-05 10:45:34','User LDAGULTO time in.'),('TL-311','LDAGULTO','Time Out','2022-07-05 10:45:47','User LDAGULTO time out.'),('TL-312','LDAGULTO','Insert','2022-07-05 11:01:35','User LDAGULTO inserted policy.'),('TL-313','ADMIN','Insert','2022-07-05 11:02:01','User ADMIN inserted permission.'),('TL-314','ADMIN','Insert','2022-07-05 11:02:05','User ADMIN inserted permission.'),('TL-315','ADMIN','Insert','2022-07-05 11:02:11','User ADMIN inserted permission.'),('TL-316','ADMIN','Insert','2022-07-05 11:02:15','User ADMIN inserted permission.'),('TL-317','ADMIN','Insert','2022-07-05 11:02:24','User ADMIN inserted permission.'),('TL-32','ADMIN','Update','2022-07-05 11:03:28','User ADMIN updated role permission.'),('TL-1','ADMIN','Log In','2022-07-05 14:35:16','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-05 14:35:24','User LDAGULTO logged in.'),('TL-318','LDAGULTO','Time In','2022-07-05 14:35:54','User LDAGULTO time in.'),('TL-318','LDAGULTO','Time Out','2022-07-05 14:36:37','User LDAGULTO time out.'),('TL-40','LDAGULTO','Log In','2022-07-06 08:32:47','User LDAGULTO logged in.'),('TL-319','LDAGULTO','Insert','2022-07-06 13:26:14','User LDAGULTO inserted the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 13:31:43','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:32:04','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:32:22','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:32:26','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:32:33','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:32:57','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 13:33:31','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:02:04','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:03:07','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:05:58','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:07:20','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:07:24','User LDAGULTO updated the attendance.'),('TL-299','LDAGULTO','Update','2022-07-06 16:12:47','User LDAGULTO updated attendance setting.'),('TL-318','LDAGULTO','Update','2022-07-06 16:12:58','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:15:29','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:15:36','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:16:55','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:17:21','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:19:30','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:19:41','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:19:52','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:20:33','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:21:47','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:21:49','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:23:28','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:23:45','User LDAGULTO updated the attendance.'),('TL-319','LDAGULTO','Update','2022-07-06 16:23:49','User LDAGULTO updated the attendance.'),('TL-299','LDAGULTO','Update','2022-07-06 16:27:50','User LDAGULTO updated attendance setting.'),('TL-319','LDAGULTO','Update','2022-07-06 16:27:56','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:32:29','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:32:33','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:32:41','User LDAGULTO updated the attendance.'),('TL-318','LDAGULTO','Update','2022-07-06 16:32:50','User LDAGULTO updated the attendance.'),('TL-40','LDAGULTO','Log In','2022-07-07 10:06:43','User LDAGULTO logged in.'),('TL-320','LDAGULTO','Insert','2022-07-07 15:27:54','User LDAGULTO inserted policy.'),('TL-321','LDAGULTO','Insert','2022-07-07 15:28:50','User LDAGULTO inserted permission.'),('TL-322','LDAGULTO','Insert','2022-07-07 15:29:11','User LDAGULTO inserted permission.'),('TL-323','LDAGULTO','Time In','2022-07-07 15:29:33','User LDAGULTO time in.'),('TL-323','LDAGULTO','Update','2022-07-07 15:31:14','User LDAGULTO updated the attendance.'),('TL-40','LDAGULTO','Log In','2022-07-08 09:41:45','User LDAGULTO logged in.'),('TL-322','LDAGULTO','Update','2022-07-08 11:44:08','User LDAGULTO updated permission.'),('TL-324','LDAGULTO','Insert','2022-07-08 11:44:15','User LDAGULTO inserted permission.'),('TL-325','LDAGULTO','Insert','2022-07-08 11:44:24','User LDAGULTO inserted permission.'),('TL-321','LDAGULTO','Update','2022-07-08 11:54:42','User LDAGULTO updated permission.'),('TL-320','LDAGULTO','Update','2022-07-08 11:55:10','User LDAGULTO updated policy.'),('TL-32','LDAGULTO','Update','2022-07-08 13:17:01','User LDAGULTO updated role permission.'),('TL-326','LDAGULTO','Insert','2022-07-08 16:00:12','User LDAGULTO inserted system parameter.'),('TL-327','LDAGULTO','Insert','2022-07-08 16:00:33','User LDAGULTO inserted system parameter.'),('TL-328','LDAGULTO','Insert','2022-07-08 16:01:35','User LDAGULTO inserted upload setting.'),('TL-329','LDAGULTO','Insert','2022-07-08 16:02:04','User LDAGULTO inserted upload setting.'),('TL-329','LDAGULTO','Update','2022-07-08 16:02:14','User LDAGULTO updated upload setting.'),('TL-330','LDAGULTO','Insert','2022-07-08 16:52:08','User LDAGULTO inserted the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:52:21','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:57:17','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:57:23','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:57:28','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:58:05','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:58:18','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:58:35','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:58:52','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 16:58:57','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 17:11:01','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 17:11:14','User LDAGULTO updated the attendance.'),('TL-330','LDAGULTO','Update','2022-07-08 17:11:22','User LDAGULTO updated the attendance.'),('TL-331','LDAGULTO','Time In','2022-07-08 17:31:47','User LDAGULTO time in.'),('TL-331','LDAGULTO','Time Out','2022-07-08 17:31:53','User LDAGULTO time out.'),('TL-40','LDAGULTO','Log In','2022-07-08 17:34:33','User LDAGULTO logged out.'),('TL-40','LDAGULTO','Log In','2022-07-08 17:34:39','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-07-09 19:25:01','User LDAGULTO logged in.'),('TL-320','LDAGULTO','Update','2022-07-09 19:27:12','User LDAGULTO updated policy.'),('TL-321','LDAGULTO','Update','2022-07-09 19:27:19','User LDAGULTO updated permission.'),('TL-331','LDAGULTO','Update','2022-07-09 20:18:27','User LDAGULTO updated the attendance.'),('TL-332','LDAGULTO','Request','2022-07-09 20:32:06','User LDAGULTO requested an attendance adjustment.'),('TL-332','LDAGULTO','Update','2022-07-09 20:32:06','User LDAGULTO updated attendance adjustment attachment.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-10 09:11:01','User LDAGULTO attempted to log in.'),('TL-40','LDAGULTO','Log In','2022-07-10 09:11:05','User LDAGULTO logged in.'),('TL-333','LDAGULTO','Request','2022-07-10 10:09:27','User LDAGULTO requested an attendance creation.'),('TL-333','LDAGULTO','Update','2022-07-10 10:09:27','User LDAGULTO updated attendance creation attachment.'),('TL-334','LDAGULTO','Insert','2022-07-10 10:13:31','User LDAGULTO inserted policy.'),('TL-335','LDAGULTO','Insert','2022-07-10 10:13:51','User LDAGULTO inserted permission.'),('TL-336','LDAGULTO','Insert','2022-07-10 10:14:03','User LDAGULTO inserted permission.'),('TL-337','LDAGULTO','Insert','2022-07-10 10:14:10','User LDAGULTO inserted permission.'),('TL-338','LDAGULTO','Insert','2022-07-10 10:14:19','User LDAGULTO inserted permission.'),('TL-339','LDAGULTO','Insert','2022-07-10 10:14:27','User LDAGULTO inserted permission.'),('TL-340','LDAGULTO','Insert','2022-07-10 10:14:33','User LDAGULTO inserted permission.'),('TL-339','LDAGULTO','Update','2022-07-10 10:21:14','User LDAGULTO updated permission.'),('TL-340','LDAGULTO','Update','2022-07-10 10:21:23','User LDAGULTO updated permission.'),('TL-341','LDAGULTO','Insert','2022-07-10 10:21:28','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-10 10:22:37','User LDAGULTO updated role permission.'),('TL-40','LDAGULTO','Log In','2022-07-11 11:40:25','User LDAGULTO logged in.'),('TL-342','LDAGULTO','Request','2022-07-11 13:37:33','User LDAGULTO requested an attendance adjustment.'),('TL-342','LDAGULTO','Update','2022-07-11 13:37:33','User LDAGULTO updated attendance adjustment attachment.'),('TL-343','LDAGULTO','Request','2022-07-11 13:38:11','User LDAGULTO requested an attendance adjustment.'),('TL-343','LDAGULTO','Update','2022-07-11 13:38:12','User LDAGULTO updated attendance adjustment attachment.'),('TL-40','LDAGULTO','Log In','2022-07-12 13:50:14','User LDAGULTO logged in.'),('TL-1','ADMIN','Log In','2022-07-13 11:12:38','User ADMIN logged in.'),('TL-1','ADMIN','Log In','2022-07-13 11:29:31','User ADMIN logged out.'),('TL-40','LDAGULTO','Log In','2022-07-13 11:29:35','User LDAGULTO logged in.'),('TL-344','LDAGULTO','Request','2022-07-13 16:55:04','User LDAGULTO requested an attendance adjustment.'),('TL-344','LDAGULTO','Update','2022-07-13 16:55:04','User LDAGULTO updated attendance adjustment attachment.'),('TL-40','LDAGULTO','Log In','2022-07-14 10:12:33','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-07-15 13:04:37','User LDAGULTO logged in.'),('TL-345','LDAGULTO','Update','2022-07-15 13:33:11','User LDAGULTO updated job position.'),('TL-346','LDAGULTO','Update','2022-07-15 13:33:33','User LDAGULTO updated attendance adjustment.'),('TL-346','LDAGULTO','Update','2022-07-15 13:33:51','User LDAGULTO updated attendance adjustment.'),('TL-346','LDAGULTO','Update','2022-07-15 13:34:06','User LDAGULTO updated attendance adjustment.'),('TL-346','LDAGULTO','Update','2022-07-15 13:34:11','User LDAGULTO updated attendance adjustment.'),('TL-40','LDAGULTO','Log In','2022-07-16 09:15:32','User LDAGULTO logged in.'),('TL-343','LDAGULTO','Update','2022-07-16 09:52:25','User LDAGULTO updated attendance adjustment.'),('TL-343','LDAGULTO','Update','2022-07-16 09:52:55','User LDAGULTO updated attendance adjustment.'),('TL-344','LDAGULTO','Update','2022-07-16 09:53:16','User LDAGULTO updated attendance adjustment.'),('TL-343','LDAGULTO','Update','2022-07-16 09:56:00','User LDAGULTO updated attendance adjustment.'),('TL-343','LDAGULTO','Update','2022-07-16 09:56:00','User LDAGULTO updated attendance adjustment attachment.'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:29:13','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:29:51','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:29:56','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:30:08','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:30:47','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:30:51','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:31:55','User LDAGULTO cancelled attendance adjustment (3).'),('TL-343','LDAGULTO','Cancel','2022-07-16 10:33:12','User LDAGULTO cancelled attendance adjustment (3).'),('TL-346','LDAGULTO','Cancel','2022-07-16 10:33:20','User LDAGULTO cancelled attendance adjustment (2).'),('TL-344','LDAGULTO','Cancel','2022-07-16 10:33:47','User LDAGULTO cancelled attendance adjustment (4).'),('TL-347','LDAGULTO','Request','2022-07-16 11:49:07','User LDAGULTO requested an attendance adjustment.'),('TL-347','LDAGULTO','Update','2022-07-16 11:49:07','User LDAGULTO updated attendance adjustment attachment.'),('TL-347','LDAGULTO','Cancel','2022-07-16 13:08:56','User LDAGULTO cancelled attendance adjustment (5).'),('TL-348','LDAGULTO','Request','2022-07-16 13:27:07','User LDAGULTO requested an attendance adjustment.'),('TL-348','LDAGULTO','Update','2022-07-16 13:27:07','User LDAGULTO updated attendance adjustment attachment.'),('TL-349','LDAGULTO','Request','2022-07-16 18:23:44','User LDAGULTO requested an attendance adjustment.'),('TL-349','LDAGULTO','Update','2022-07-16 18:23:44','User LDAGULTO updated attendance adjustment attachment.'),('TL-350','LDAGULTO','Request','2022-07-16 18:24:04','User LDAGULTO requested an attendance adjustment.'),('TL-350','LDAGULTO','Update','2022-07-16 18:24:04','User LDAGULTO updated attendance adjustment attachment.'),('TL-351','LDAGULTO','Request','2022-07-16 19:09:57','User LDAGULTO requested an attendance adjustment.'),('TL-351','LDAGULTO','Update','2022-07-16 19:09:57','User LDAGULTO updated attendance adjustment attachment.'),('TL-350','LDAGULTO','For Recommendation','2022-07-16 19:10:00','User LDAGULTO tagged the attendance adjustment for recommendation (8).'),('TL-351','LDAGULTO','For Recommendation','2022-07-16 19:10:28','User LDAGULTO tagged the attendance adjustment for recommendation (9).'),('TL-352','LDAGULTO','Insert','2022-07-16 19:16:28','User LDAGULTO inserted policy.'),('TL-353','LDAGULTO','Insert','2022-07-16 19:16:39','User LDAGULTO inserted permission.'),('TL-354','LDAGULTO','Insert','2022-07-16 19:16:53','User LDAGULTO inserted permission.'),('TL-355','LDAGULTO','Insert','2022-07-16 19:17:00','User LDAGULTO inserted permission.'),('TL-356','LDAGULTO','Insert','2022-07-16 19:17:07','User LDAGULTO inserted permission.'),('TL-357','LDAGULTO','Insert','2022-07-16 19:17:15','User LDAGULTO inserted permission.'),('TL-358','LDAGULTO','Insert','2022-07-16 19:17:21','User LDAGULTO inserted permission.'),('TL-359','LDAGULTO','Insert','2022-07-16 19:17:27','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-16 19:18:25','User LDAGULTO updated role permission.'),('TL-360','LDAGULTO','Request','2022-07-16 19:26:58','User LDAGULTO requested an attendance creation.'),('TL-360','LDAGULTO','Update','2022-07-16 19:26:59','User LDAGULTO updated attendance creation attachment.'),('TL-40','LDAGULTO','Log In','2022-07-17 11:52:54','User LDAGULTO logged in.'),('TL-361','LDAGULTO','Update','2022-07-17 12:11:51','User LDAGULTO updated attendance creation.'),('TL-361','LDAGULTO','Update','2022-07-17 12:11:51','User LDAGULTO updated attendance creation attachment.'),('TL-361','LDAGULTO','Update','2022-07-17 12:12:09','User LDAGULTO updated attendance creation.'),('TL-361','LDAGULTO','Update','2022-07-17 12:12:09','User LDAGULTO updated attendance creation attachment.'),('TL-361','LDAGULTO','Update','2022-07-17 12:12:19','User LDAGULTO updated attendance creation.'),('TL-361','LDAGULTO','Update','2022-07-17 12:12:19','User LDAGULTO updated attendance creation attachment.'),('TL-361','LDAGULTO','Update','2022-07-17 12:14:12','User LDAGULTO updated attendance creation.'),('TL-361','LDAGULTO','Update','2022-07-17 12:14:44','User LDAGULTO updated attendance creation.'),('TL-361','LDAGULTO','Update','2022-07-17 12:14:44','User LDAGULTO updated attendance creation attachment.'),('TL-361','LDAGULTO','Update','2022-07-17 12:34:45','User LDAGULTO updated attendance creation.'),('TL-362','LDAGULTO','Request','2022-07-17 12:37:49','User LDAGULTO requested an attendance creation.'),('TL-362','LDAGULTO','Update','2022-07-17 12:37:49','User LDAGULTO updated attendance creation attachment.'),('TL-362','LDAGULTO','Cancel','2022-07-17 12:40:52','User LDAGULTO cancelled attendance creation (3).'),('TL-361','LDAGULTO','Cancel','2022-07-17 12:43:52','User LDAGULTO cancelled attendance creation (2).'),('TL-363','LDAGULTO','Request','2022-07-17 12:45:31','User LDAGULTO requested an attendance creation.'),('TL-363','LDAGULTO','Update','2022-07-17 12:45:31','User LDAGULTO updated attendance creation attachment.'),('TL-363','LDAGULTO','For Recommendation','2022-07-17 12:45:33','User LDAGULTO tagged the attendance creation for recommendation (4).'),('TL-364','LDAGULTO','Request','2022-07-17 12:49:43','User LDAGULTO requested an attendance creation.'),('TL-364','LDAGULTO','Update','2022-07-17 12:49:43','User LDAGULTO updated attendance creation attachment.'),('TL-364','LDAGULTO','For Recommendation','2022-07-17 12:49:52','User LDAGULTO tagged the attendance creation for recommendation (5).'),('TL-299','LDAGULTO','Update','2022-07-17 13:37:39','User LDAGULTO updated attendance setting.'),('TL-299','LDAGULTO','Update','2022-07-17 13:37:43','User LDAGULTO updated attendance setting.'),('TL-299','LDAGULTO','Update','2022-07-17 13:37:47','User LDAGULTO updated attendance setting.'),('TL-40','LDAGULTO','Log In','2022-07-17 14:09:19','User LDAGULTO logged in.'),('TL-365','LDAGULTO','Insert','2022-07-17 14:21:13','User LDAGULTO inserted system parameter.'),('TL-1','LDAGULTO','Update','2022-07-17 14:21:29','User LDAGULTO updated user account.'),('TL-1','LDAGULTO','Update','2022-07-17 14:21:43','User LDAGULTO updated user account.'),('TL-1','LDAGULTO','Update','2022-07-17 14:23:12','User LDAGULTO updated user account.'),('TL-40','LDAGULTO','Update','2022-07-17 14:23:26','User LDAGULTO updated user account.'),('TL-275','LDAGULTO','Link','2022-07-17 14:23:26','User LDAGULTO linked user account to employee.'),('TL-40','LDAGULTO','Log In','2022-07-18 13:03:12','User LDAGULTO logged in.'),('TL-366','LDAGULTO','Insert','2022-07-18 13:09:22','User LDAGULTO inserted policy.'),('TL-367','LDAGULTO','Insert','2022-07-18 13:09:43','User LDAGULTO inserted permission.'),('TL-368','LDAGULTO','Insert','2022-07-18 13:09:49','User LDAGULTO inserted permission.'),('TL-369','LDAGULTO','Insert','2022-07-18 13:09:55','User LDAGULTO inserted permission.'),('TL-370','LDAGULTO','Insert','2022-07-18 13:10:03','User LDAGULTO inserted permission.'),('TL-371','LDAGULTO','Insert','2022-07-18 13:10:09','User LDAGULTO inserted permission.'),('TL-371','LDAGULTO','Update','2022-07-18 13:10:12','User LDAGULTO updated permission.'),('TL-371','LDAGULTO','Update','2022-07-18 13:10:19','User LDAGULTO updated permission.'),('TL-372','LDAGULTO','Insert','2022-07-18 13:25:42','User LDAGULTO inserted permission.'),('TL-373','LDAGULTO','Insert','2022-07-18 13:25:48','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-18 13:40:52','User LDAGULTO updated role permission.'),('TL-40','LDAGULTO','Log In','2022-07-20 10:19:48','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-07-21 09:58:00','User LDAGULTO logged in.'),('TL-374','LDAGULTO','Insert','2022-07-21 11:59:40','User LDAGULTO inserted approval type.'),('TL-374','LDAGULTO','Update','2022-07-21 13:08:36','User LDAGULTO updated approval type.'),('TL-375','LDAGULTO','Insert','2022-07-21 13:24:59','User LDAGULTO inserted approval type.'),('TL-375','LDAGULTO','Activate','2022-07-21 14:09:45','User LDAGULTO activated approval type.'),('TL-375','LDAGULTO','Deactivated','2022-07-21 14:09:48','User LDAGULTO deactivated approval type.'),('TL-375','LDAGULTO','Deactivated','2022-07-21 14:09:51','User LDAGULTO deactivated approval type.'),('TL-375','LDAGULTO','Deactivated','2022-07-21 14:10:08','User LDAGULTO deactivated approval type.'),('TL-375','LDAGULTO','Activate','2022-07-21 14:10:10','User LDAGULTO activated approval type.'),('TL-40','LDAGULTO','Log In','2022-07-22 13:01:36','User LDAGULTO logged in.'),('TL-375','LDAGULTO','Update','2022-07-22 13:50:45','User LDAGULTO updated approval type.'),('TL-376','LDAGULTO','Insert','2022-07-22 15:14:08','User LDAGULTO inserted policy.'),('TL-377','LDAGULTO','Insert','2022-07-22 15:14:20','User LDAGULTO inserted permission.'),('TL-378','LDAGULTO','Insert','2022-07-22 15:14:24','User LDAGULTO inserted permission.'),('TL-379','LDAGULTO','Insert','2022-07-22 15:14:28','User LDAGULTO inserted permission.'),('TL-380','LDAGULTO','Insert','2022-07-22 15:25:17','User LDAGULTO inserted policy.'),('TL-381','LDAGULTO','Insert','2022-07-22 15:25:36','User LDAGULTO inserted permission.'),('TL-382','LDAGULTO','Insert','2022-07-22 15:25:42','User LDAGULTO inserted permission.'),('TL-383','LDAGULTO','Insert','2022-07-22 15:25:49','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-22 15:26:17','User LDAGULTO updated role permission.'),('TL-40','LDAGULTO','Log In','2022-07-22 22:19:19','User LDAGULTO logged in.'),('TL-375','LDAGULTO','Insert','2022-07-22 23:12:43','User LDAGULTO inserted approval exception.'),('TL-375','LDAGULTO','Insert','2022-07-22 23:14:01','User LDAGULTO inserted approver.'),('TL-375','LDAGULTO','Insert','2022-07-22 23:19:10','User LDAGULTO inserted approver.'),('TL-375','LDAGULTO','Insert','2022-07-22 23:19:51','User LDAGULTO inserted approval exception.'),('TL-40','LDAGULTO','Log In','2022-07-23 08:17:50','User LDAGULTO logged in.'),('TL-375','LDAGULTO','Insert','2022-07-23 08:27:28','User LDAGULTO inserted approver.'),('TL-375','LDAGULTO','Insert','2022-07-23 08:27:35','User LDAGULTO inserted approval exception.'),('TL-40','LDAGULTO','Log In','2022-07-23 14:12:24','User LDAGULTO logged in.'),('TL-365','LDAGULTO','Update','2022-07-23 14:18:55','User LDAGULTO updated system parameter.'),('TL-384','LDAGULTO','Insert','2022-07-23 14:21:15','User LDAGULTO inserted approval type.'),('TL-384','LDAGULTO','Insert','2022-07-23 14:21:38','User LDAGULTO inserted approver.'),('TL-385','LDAGULTO','Request','2022-07-23 14:22:38','User LDAGULTO requested an attendance adjustment.'),('TL-385','LDAGULTO','Update','2022-07-23 14:22:38','User LDAGULTO updated attendance adjustment attachment.'),('TL-386','LDAGULTO','Request','2022-07-23 14:23:54','User LDAGULTO requested an attendance adjustment.'),('TL-386','LDAGULTO','Update','2022-07-23 14:23:54','User LDAGULTO updated attendance adjustment attachment.'),('TL-384','LDAGULTO','Activate','2022-07-23 14:31:26','User LDAGULTO activated approval type.'),('TL-387','LDAGULTO','Insert','2022-07-23 14:33:56','User LDAGULTO inserted approval type.'),('TL-387','LDAGULTO','Insert','2022-07-23 14:34:08','User LDAGULTO inserted approver.'),('TL-387','LDAGULTO','Activate','2022-07-23 14:34:14','User LDAGULTO activated approval type.'),('TL-388','LDAGULTO','Insert','2022-07-23 14:39:07','User LDAGULTO inserted approval type.'),('TL-389','LDAGULTO','Insert','2022-07-23 14:39:44','User LDAGULTO inserted approval type.'),('TL-389','LDAGULTO','Insert','2022-07-23 14:39:54','User LDAGULTO inserted approver.'),('TL-388','LDAGULTO','Insert','2022-07-23 14:40:04','User LDAGULTO inserted approver.'),('TL-389','LDAGULTO','Activate','2022-07-23 14:41:25','User LDAGULTO activated approval type.'),('TL-388','LDAGULTO','Activate','2022-07-23 14:41:25','User LDAGULTO activated approval type.'),('TL-387','LDAGULTO','Deactivated','2022-07-23 16:41:11','User LDAGULTO deactivated approval type.'),('TL-387','LDAGULTO','Activate','2022-07-23 16:41:14','User LDAGULTO activated approval type.'),('TL-384','LDAGULTO','Deactivated','2022-07-23 16:41:17','User LDAGULTO deactivated approval type.'),('TL-384','LDAGULTO','Activate','2022-07-23 16:41:23','User LDAGULTO activated approval type.'),('TL-384','LDAGULTO','Insert','2022-07-23 16:41:28','User LDAGULTO inserted approval exception.'),('TL-390','LDAGULTO','Request','2022-07-23 16:43:47','User LDAGULTO requested an attendance creation.'),('TL-390','LDAGULTO','Update','2022-07-23 16:43:47','User LDAGULTO updated attendance creation attachment.'),('TL-388','LDAGULTO','Deactivated','2022-07-23 16:43:54','User LDAGULTO deactivated approval type.'),('TL-388','LDAGULTO','Activate','2022-07-23 16:43:59','User LDAGULTO activated approval type.'),('TL-388','LDAGULTO','Insert','2022-07-23 16:44:06','User LDAGULTO inserted approval exception.'),('TL-390','LDAGULTO','Update','2022-07-23 16:57:27','User LDAGULTO updated attendance creation.'),('TL-40','LDAGULTO','Log In','2022-07-24 11:20:17','User LDAGULTO logged in.'),('TL-391','LDAGULTO','Insert','2022-07-24 11:36:26','User LDAGULTO inserted policy.'),('TL-392','LDAGULTO','Insert','2022-07-24 11:36:43','User LDAGULTO inserted permission.'),('TL-393','LDAGULTO','Insert','2022-07-24 11:36:56','User LDAGULTO inserted permission.'),('TL-394','LDAGULTO','Insert','2022-07-24 11:37:03','User LDAGULTO inserted permission.'),('TL-395','LDAGULTO','Insert','2022-07-24 11:37:09','User LDAGULTO inserted permission.'),('TL-396','LDAGULTO','Insert','2022-07-24 11:38:45','User LDAGULTO inserted permission.'),('TL-397','LDAGULTO','Insert','2022-07-24 11:40:31','User LDAGULTO inserted policy.'),('TL-398','LDAGULTO','Insert','2022-07-24 11:40:42','User LDAGULTO inserted permission.'),('TL-399','LDAGULTO','Insert','2022-07-24 11:40:50','User LDAGULTO inserted permission.'),('TL-399','LDAGULTO','Update','2022-07-24 11:41:00','User LDAGULTO updated permission.'),('TL-400','LDAGULTO','Insert','2022-07-24 11:41:07','User LDAGULTO inserted permission.'),('TL-401','LDAGULTO','Insert','2022-07-24 11:41:15','User LDAGULTO inserted permission.'),('TL-402','LDAGULTO','Insert','2022-07-24 11:41:19','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-24 11:45:30','User LDAGULTO updated role permission.'),('TL-386','LDAGULTO','For Recommendation','2022-07-24 14:12:01','User LDAGULTO tagged the attendance adjustment for recommendation (11).'),('TL-385','LDAGULTO','For Recommendation','2022-07-24 14:12:03','User LDAGULTO tagged the attendance adjustment for recommendation (10).'),('TL-275','LDAGULTO','Update','2022-07-24 14:14:22','User LDAGULTO updated employee.'),('TL-385','LDAGULTO','Reject','2022-07-24 14:52:20','User LDAGULTO rejected attendance adjustment (10).'),('TL-386','LDAGULTO','Reject','2022-07-24 14:52:26','User LDAGULTO rejected attendance adjustment (11).'),('TL-403','LDAGULTO','Request','2022-07-24 14:57:54','User LDAGULTO requested an attendance adjustment.'),('TL-403','LDAGULTO','Update','2022-07-24 14:57:54','User LDAGULTO updated attendance adjustment attachment.'),('TL-403','LDAGULTO','For Recommendation','2022-07-24 14:58:02','User LDAGULTO tagged the attendance adjustment for recommendation (12).'),('TL-403','LDAGULTO','Recommend','2022-07-24 14:58:29','User LDAGULTO recommended attendance adjustment (12).'),('TL-404','LDAGULTO','Request','2022-07-24 15:06:32','User LDAGULTO requested an attendance adjustment.'),('TL-404','LDAGULTO','Update','2022-07-24 15:06:32','User LDAGULTO updated attendance adjustment attachment.'),('TL-404','LDAGULTO','For Recommendation','2022-07-24 15:06:38','User LDAGULTO tagged the attendance adjustment for recommendation (13).'),('TL-404','LDAGULTO','Recommend','2022-07-24 15:08:18','User LDAGULTO recommended attendance adjustment (13).'),('TL-403','LDAGULTO','Cancel','2022-07-24 15:08:58','User LDAGULTO cancelled attendance adjustment (12).'),('TL-404','LDAGULTO','Cancel','2022-07-24 15:08:58','User LDAGULTO cancelled attendance adjustment (13).'),('TL-405','LDAGULTO','Request','2022-07-24 15:09:27','User LDAGULTO requested an attendance adjustment.'),('TL-405','LDAGULTO','Update','2022-07-24 15:09:27','User LDAGULTO updated attendance adjustment attachment.'),('TL-405','LDAGULTO','For Recommendation','2022-07-24 15:09:33','User LDAGULTO tagged the attendance adjustment for recommendation (14).'),('TL-405','LDAGULTO','Recommend','2022-07-24 15:09:38','User LDAGULTO recommended attendance adjustment (14).'),('TL-390','LDAGULTO','For Recommendation','2022-07-24 15:50:31','User LDAGULTO tagged the attendance creation for recommendation (6).'),('TL-390','LDAGULTO','Recommend','2022-07-24 15:51:17','User LDAGULTO recommended attendance creation (6).'),('TL-406','LDAGULTO','Request','2022-07-24 15:52:45','User LDAGULTO requested an attendance creation.'),('TL-406','LDAGULTO','Update','2022-07-24 15:52:45','User LDAGULTO updated attendance creation attachment.'),('TL-407','LDAGULTO','Request','2022-07-24 15:52:57','User LDAGULTO requested an attendance creation.'),('TL-407','LDAGULTO','Update','2022-07-24 15:52:57','User LDAGULTO updated attendance creation attachment.'),('TL-408','LDAGULTO','Request','2022-07-24 15:53:07','User LDAGULTO requested an attendance creation.'),('TL-408','LDAGULTO','Update','2022-07-24 15:53:07','User LDAGULTO updated attendance creation attachment.'),('TL-409','LDAGULTO','Request','2022-07-24 15:53:19','User LDAGULTO requested an attendance creation.'),('TL-409','LDAGULTO','Update','2022-07-24 15:53:19','User LDAGULTO updated attendance creation attachment.'),('TL-410','LDAGULTO','Request','2022-07-24 15:53:35','User LDAGULTO requested an attendance creation.'),('TL-410','LDAGULTO','Update','2022-07-24 15:53:35','User LDAGULTO updated attendance creation attachment.'),('TL-408','LDAGULTO','For Recommendation','2022-07-24 15:53:41','User LDAGULTO tagged the attendance creation for recommendation (9).'),('TL-409','LDAGULTO','For Recommendation','2022-07-24 15:53:41','User LDAGULTO tagged the attendance creation for recommendation (10).'),('TL-410','LDAGULTO','For Recommendation','2022-07-24 15:53:41','User LDAGULTO tagged the attendance creation for recommendation (11).'),('TL-407','LDAGULTO','For Recommendation','2022-07-24 15:53:41','User LDAGULTO tagged the attendance creation for recommendation (8).'),('TL-406','LDAGULTO','For Recommendation','2022-07-24 15:53:41','User LDAGULTO tagged the attendance creation for recommendation (7).'),('TL-409','LDAGULTO','Reject','2022-07-24 15:53:49','User LDAGULTO rejected attendance creation (10).'),('TL-410','LDAGULTO','Reject','2022-07-24 15:54:15','User LDAGULTO rejected attendance creation (11).'),('TL-406','LDAGULTO','Cancel','2022-07-24 15:54:19','User LDAGULTO cancelled attendance creation (7).'),('TL-407','LDAGULTO','Cancel','2022-07-24 15:54:23','User LDAGULTO cancelled attendance creation (8).'),('TL-408','LDAGULTO','Recommend','2022-07-24 15:54:26','User LDAGULTO recommended attendance creation (9).'),('TL-411','LDAGULTO','Insert','2022-07-24 18:35:56','User LDAGULTO inserted policy.'),('TL-412','LDAGULTO','Request','2022-07-24 18:44:21','User LDAGULTO requested an attendance adjustment.'),('TL-412','LDAGULTO','Update','2022-07-24 18:44:21','User LDAGULTO updated attendance adjustment attachment.'),('TL-412','LDAGULTO','For Recommendation','2022-07-24 18:44:23','User LDAGULTO tagged the attendance adjustment for recommendation (15).'),('TL-384','LDAGULTO','Insert','2022-07-24 18:44:58','User LDAGULTO inserted approver.'),('TL-40','LDAGULTO','Log In','2022-07-25 09:02:33','User LDAGULTO logged in.'),('TL-413','LDAGULTO','Insert','2022-07-25 09:06:42','User LDAGULTO inserted permission.'),('TL-414','LDAGULTO','Insert','2022-07-25 09:06:49','User LDAGULTO inserted permission.'),('TL-415','LDAGULTO','Insert','2022-07-25 09:06:56','User LDAGULTO inserted permission.'),('TL-416','LDAGULTO','Insert','2022-07-25 09:07:03','User LDAGULTO inserted permission.'),('TL-417','LDAGULTO','Insert','2022-07-25 09:07:08','User LDAGULTO inserted permission.'),('TL-418','LDAGULTO','Insert','2022-07-25 09:08:45','User LDAGULTO inserted policy.'),('TL-419','LDAGULTO','Insert','2022-07-25 09:08:58','User LDAGULTO inserted permission.'),('TL-420','LDAGULTO','Insert','2022-07-25 09:09:04','User LDAGULTO inserted permission.'),('TL-421','LDAGULTO','Insert','2022-07-25 09:09:10','User LDAGULTO inserted permission.'),('TL-422','LDAGULTO','Insert','2022-07-25 09:09:18','User LDAGULTO inserted permission.'),('TL-423','LDAGULTO','Insert','2022-07-25 09:09:31','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-25 09:10:38','User LDAGULTO updated role permission.'),('TL-424','LDAGULTO','Request','2022-07-25 17:09:17','User LDAGULTO requested an attendance adjustment.'),('TL-424','LDAGULTO','Update','2022-07-25 17:09:17','User LDAGULTO updated attendance adjustment attachment.'),('TL-387','LDAGULTO','Deactivated','2022-07-25 17:09:30','User LDAGULTO deactivated approval type.'),('TL-387','LDAGULTO','Activate','2022-07-25 17:12:09','User LDAGULTO activated approval type.'),('TL-425','LDAGULTO','Request','2022-07-25 17:12:38','User LDAGULTO requested an attendance creation.'),('TL-425','LDAGULTO','Update','2022-07-25 17:12:38','User LDAGULTO updated attendance creation attachment.'),('TL-389','LDAGULTO','Deactivated','2022-07-25 17:12:50','User LDAGULTO deactivated approval type.'),('TL-389','LDAGULTO','Activate','2022-07-25 17:21:36','User LDAGULTO activated approval type.'),('TL-40','LDAGULTO','Log In','2022-07-26 19:25:47','User LDAGULTO logged in.'),('TL-330','LDAGULTO','Update','2022-07-26 20:48:44','User LDAGULTO updated the attendance.'),('TL-405','LDAGULTO','Approve','2022-07-26 20:48:44','User LDAGULTO approved attendance adjustment (14).'),('TL-426','LDAGULTO','Request','2022-07-26 20:53:31','User LDAGULTO requested an attendance adjustment.'),('TL-426','LDAGULTO','Update','2022-07-26 20:53:31','User LDAGULTO updated attendance adjustment attachment.'),('TL-426','LDAGULTO','For Recommendation','2022-07-26 20:53:37','User LDAGULTO tagged the attendance adjustment for recommendation (17).'),('TL-426','LDAGULTO','Recommend','2022-07-26 20:54:21','User LDAGULTO recommended attendance adjustment (17).'),('TL-330','LDAGULTO','Update','2022-07-26 20:54:28','User LDAGULTO updated the attendance.'),('TL-426','LDAGULTO','Approve','2022-07-26 20:54:28','User LDAGULTO approved attendance adjustment (17).'),('TL-425','LDAGULTO','Update','2022-07-26 20:58:47','User LDAGULTO updated attendance creation.'),('TL-425','LDAGULTO','Update','2022-07-26 20:59:00','User LDAGULTO updated attendance creation.'),('TL-425','LDAGULTO','For Recommendation','2022-07-26 20:59:04','User LDAGULTO tagged the attendance creation for recommendation (12).'),('TL-425','LDAGULTO','Recommend','2022-07-26 20:59:10','User LDAGULTO recommended attendance creation (12).'),('TL-427','LDAGULTO','Insert','2022-07-26 21:01:25','User LDAGULTO inserted the attendance.'),('TL-425','LDAGULTO','Approve','2022-07-26 21:01:25','User LDAGULTO approved attendance creation (12).'),('TL-428','LDAGULTO','Insert','2022-07-26 21:02:13','User LDAGULTO inserted the attendance.'),('TL-425','LDAGULTO','Approve','2022-07-26 21:02:13','User LDAGULTO approved attendance creation (12).'),('TL-427','LDAGULTO','Update','2022-07-26 21:04:07','User LDAGULTO updated the attendance.'),('TL-427','LDAGULTO','Update','2022-07-26 21:04:10','User LDAGULTO updated the attendance.'),('TL-428','LDAGULTO','Update','2022-07-26 21:04:13','User LDAGULTO updated the attendance.'),('TL-428','LDAGULTO','Update','2022-07-26 21:04:21','User LDAGULTO updated the attendance.'),('TL-428','LDAGULTO','Update','2022-07-26 21:04:30','User LDAGULTO updated the attendance.'),('TL-428','LDAGULTO','Update','2022-07-26 21:04:58','User LDAGULTO updated the attendance.'),('TL-331','LDAGULTO','Update','2022-07-26 21:05:15','User LDAGULTO updated the attendance.'),('TL-427','LDAGULTO','Update','2022-07-26 21:05:24','User LDAGULTO updated the attendance.'),('TL-429','LDAGULTO','Insert','2022-07-26 21:06:13','User LDAGULTO inserted the attendance.'),('TL-390','LDAGULTO','Approve','2022-07-26 21:06:13','User LDAGULTO approved attendance creation (6).'),('TL-412','LDAGULTO','Recommend','2022-07-26 21:38:43','User LDAGULTO recommended attendance adjustment (15).'),('TL-40','LDAGULTO','Log In','2022-07-27 19:52:53','User LDAGULTO logged in.'),('TL-430','LDAGULTO','Insert','2022-07-27 19:54:47','User LDAGULTO inserted notification setting.'),('TL-430','LDAGULTO','Insert','2022-07-27 20:03:32','User LDAGULTO inserted notification template.'),('TL-431','LDAGULTO','Insert','2022-07-27 20:04:04','User LDAGULTO inserted notification setting.'),('TL-431','LDAGULTO','Insert','2022-07-27 20:08:05','User LDAGULTO inserted notification template.'),('TL-432','LDAGULTO','Insert','2022-07-27 20:08:30','User LDAGULTO inserted notification setting.'),('TL-432','LDAGULTO','Insert','2022-07-27 20:09:12','User LDAGULTO inserted notification template.'),('TL-433','LDAGULTO','Insert','2022-07-27 20:09:45','User LDAGULTO inserted notification setting.'),('TL-432','LDAGULTO','Update','2022-07-27 20:09:49','User LDAGULTO updated notification setting.'),('TL-433','LDAGULTO','Insert','2022-07-27 20:10:33','User LDAGULTO inserted notification template.'),('TL-434','LDAGULTO','Insert','2022-07-27 20:10:56','User LDAGULTO inserted notification setting.'),('TL-434','LDAGULTO','Insert','2022-07-27 20:11:13','User LDAGULTO inserted notification template.'),('TL-435','LDAGULTO','Insert','2022-07-27 20:11:47','User LDAGULTO inserted notification setting.'),('TL-435','LDAGULTO','Insert','2022-07-27 20:12:24','User LDAGULTO inserted notification template.'),('TL-436','LDAGULTO','Insert','2022-07-27 20:12:49','User LDAGULTO inserted notification setting.'),('TL-436','LDAGULTO','Insert','2022-07-27 20:13:12','User LDAGULTO inserted notification template.'),('TL-437','LDAGULTO','Insert','2022-07-27 20:13:51','User LDAGULTO inserted notification setting.'),('TL-437','LDAGULTO','Insert','2022-07-27 20:14:15','User LDAGULTO inserted notification template.'),('TL-438','LDAGULTO','Insert','2022-07-27 20:14:36','User LDAGULTO inserted notification setting.'),('TL-438','LDAGULTO','Insert','2022-07-27 20:15:03','User LDAGULTO inserted notification template.'),('TL-437','LDAGULTO','Update','2022-07-27 20:15:10','User LDAGULTO updated notification template.'),('TL-439','LDAGULTO','Insert','2022-07-27 20:15:36','User LDAGULTO inserted notification setting.'),('TL-439','LDAGULTO','Insert','2022-07-27 20:16:16','User LDAGULTO inserted notification template.'),('TL-438','LDAGULTO','Update','2022-07-27 20:16:26','User LDAGULTO updated notification template.'),('TL-437','LDAGULTO','Update','2022-07-27 20:16:36','User LDAGULTO updated notification template.'),('TL-434','LDAGULTO','Update','2022-07-27 20:16:45','User LDAGULTO updated notification template.'),('TL-433','LDAGULTO','Update','2022-07-27 20:16:49','User LDAGULTO updated notification template.'),('TL-432','LDAGULTO','Update','2022-07-27 20:16:53','User LDAGULTO updated notification template.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-27 21:56:35','User LDAGULTO attempted to log in.'),('TL-424','LDAGULTO','Cancel','2022-07-27 22:11:48','User LDAGULTO cancelled attendance adjustment (16).'),('TL-304','LDAGULTO','Update','2022-07-27 22:15:42','User LDAGULTO updated notification template.'),('TL-305','LDAGULTO','Update','2022-07-27 22:15:46','User LDAGULTO updated notification template.'),('TL-440','LDAGULTO','Time In','2022-07-27 22:16:02','User LDAGULTO time in.'),('TL-440','LDAGULTO','Time Out','2022-07-27 22:16:10','User LDAGULTO time out.'),('TL-40','LDAGULTO','Attempt Log In','2022-07-27 23:00:42','User LDAGULTO attempted to log in.'),('TL-441','LDAGULTO','Request','2022-07-27 23:30:37','User LDAGULTO requested an attendance adjustment.'),('TL-441','LDAGULTO','Update','2022-07-27 23:30:37','User LDAGULTO updated attendance adjustment attachment.'),('TL-441','LDAGULTO','For Recommendation','2022-07-27 23:30:52','User LDAGULTO tagged the attendance adjustment for recommendation (18).'),('TL-441','LDAGULTO','Recommend','2022-07-27 23:31:13','User LDAGULTO recommended attendance adjustment (18).'),('TL-330','LDAGULTO','Update','2022-07-27 23:31:27','User LDAGULTO updated the attendance.'),('TL-412','LDAGULTO','Approve','2022-07-27 23:31:27','User LDAGULTO approved attendance adjustment (15).'),('TL-441','LDAGULTO','Reject','2022-07-27 23:31:41','User LDAGULTO rejected attendance adjustment (18).'),('TL-442','LDAGULTO','Request','2022-07-27 23:32:11','User LDAGULTO requested an attendance creation.'),('TL-442','LDAGULTO','Update','2022-07-27 23:32:11','User LDAGULTO updated attendance creation attachment.'),('TL-442','LDAGULTO','For Recommendation','2022-07-27 23:32:14','User LDAGULTO tagged the attendance creation for recommendation (13).'),('TL-443','LDAGULTO','Request','2022-07-27 23:32:25','User LDAGULTO requested an attendance creation.'),('TL-443','LDAGULTO','Update','2022-07-27 23:32:25','User LDAGULTO updated attendance creation attachment.'),('TL-444','LDAGULTO','Request','2022-07-27 23:32:39','User LDAGULTO requested an attendance creation.'),('TL-444','LDAGULTO','Update','2022-07-27 23:32:39','User LDAGULTO updated attendance creation attachment.'),('TL-444','LDAGULTO','Cancel','2022-07-27 23:32:41','User LDAGULTO cancelled attendance creation (15).'),('TL-443','LDAGULTO','For Recommendation','2022-07-27 23:32:48','User LDAGULTO tagged the attendance creation for recommendation (14).'),('TL-442','LDAGULTO','Recommend','2022-07-27 23:33:06','User LDAGULTO recommended attendance creation (13).'),('TL-443','LDAGULTO','Reject','2022-07-27 23:33:14','User LDAGULTO rejected attendance creation (14).'),('TL-442','LDAGULTO','Reject','2022-07-27 23:33:52','User LDAGULTO rejected attendance creation (13).'),('TL-408','LDAGULTO','Cancel','2022-07-27 23:34:09','User LDAGULTO cancelled attendance creation (9).'),('TL-445','LDAGULTO','Request','2022-07-27 23:34:27','User LDAGULTO requested an attendance creation.'),('TL-445','LDAGULTO','Update','2022-07-27 23:34:27','User LDAGULTO updated attendance creation attachment.'),('TL-445','LDAGULTO','For Recommendation','2022-07-27 23:34:30','User LDAGULTO tagged the attendance creation for recommendation (16).'),('TL-445','LDAGULTO','Recommend','2022-07-27 23:34:42','User LDAGULTO recommended attendance creation (16).'),('TL-446','LDAGULTO','Insert','2022-07-27 23:36:07','User LDAGULTO inserted the attendance.'),('TL-445','LDAGULTO','Approve','2022-07-27 23:36:07','User LDAGULTO approved attendance creation (16).'),('TL-40','LDAGULTO','Log In','2022-07-31 11:17:24','User LDAGULTO logged in.'),('TL-447','LDAGULTO','Request','2022-07-31 11:19:19','User LDAGULTO requested an attendance adjustment.'),('TL-447','LDAGULTO','Update','2022-07-31 11:19:19','User LDAGULTO updated attendance adjustment attachment.'),('TL-447','LDAGULTO','For Recommendation','2022-07-31 11:19:22','User LDAGULTO tagged the attendance adjustment for recommendation (19).'),('TL-447','LDAGULTO','Recommend','2022-07-31 11:19:31','User LDAGULTO recommended attendance adjustment (19).'),('TL-446','LDAGULTO','Update','2022-07-31 11:19:47','User LDAGULTO updated the attendance.'),('TL-447','LDAGULTO','Approve','2022-07-31 11:19:47','User LDAGULTO approved attendance adjustment (19).'),('TL-448','LDAGULTO','Insert','2022-07-31 12:48:07','User LDAGULTO inserted policy.'),('TL-449','LDAGULTO','Insert','2022-07-31 12:48:16','User LDAGULTO inserted permission.'),('TL-450','LDAGULTO','Insert','2022-07-31 12:48:28','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-07-31 12:59:06','User LDAGULTO updated role permission.'),('TL-40','LDAGULTO','Log In','2022-08-03 15:34:53','User LDAGULTO logged in.'),('TL-451','LDAGULTO','Time In','2022-08-03 16:41:10','User LDAGULTO time in.'),('TL-451','LDAGULTO','Time Out','2022-08-03 16:42:39','User LDAGULTO time out.'),('TL-452','LDAGULTO','Time In','2022-08-03 16:43:54','User LDAGULTO time in.'),('TL-452','LDAGULTO','Time Out','2022-08-03 16:45:50','User LDAGULTO time out.'),('TL-452','LDAGULTO','Time Out','2022-08-03 16:46:13','User LDAGULTO time out.'),('TL-452','LDAGULTO','Time Out','2022-08-03 16:47:19','User LDAGULTO time out.'),('TL-452','LDAGULTO','Time Out','2022-08-03 16:47:30','User LDAGULTO time out.'),('TL-452','LDAGULTO','Time Out','2022-08-03 16:47:38','User LDAGULTO time out.'),('TL-305','LDAGULTO','Update','2022-08-03 17:11:32','User LDAGULTO updated notification template.'),('TL-40','LDAGULTO','Log In','2022-08-04 13:17:50','User LDAGULTO logged in.'),('TL-304','LDAGULTO','Update','2022-08-04 14:47:57','User LDAGULTO updated notification template.'),('TL-305','LDAGULTO','Update','2022-08-04 14:48:06','User LDAGULTO updated notification template.'),('TL-453','LDAGULTO','Time In','2022-08-04 15:50:59','User LDAGULTO time in.'),('TL-299','LDAGULTO','Update','2022-08-04 15:51:32','User LDAGULTO updated attendance setting.'),('TL-453','LDAGULTO','Time Out','2022-08-04 15:52:09','User LDAGULTO time out.'),('TL-454','LDAGULTO','Insert','2022-08-04 17:03:21','User LDAGULTO inserted policy.'),('TL-455','LDAGULTO','Insert','2022-08-04 17:03:33','User LDAGULTO inserted permission.'),('TL-456','LDAGULTO','Insert','2022-08-04 17:03:40','User LDAGULTO inserted permission.'),('TL-457','LDAGULTO','Insert','2022-08-04 17:03:48','User LDAGULTO inserted permission.'),('TL-457','LDAGULTO','Update','2022-08-04 17:03:51','User LDAGULTO updated permission.'),('TL-458','LDAGULTO','Insert','2022-08-04 17:03:57','User LDAGULTO inserted permission.'),('TL-459','LDAGULTO','Insert','2022-08-04 17:04:04','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-08-04 17:07:51','User LDAGULTO updated role permission.'),('TL-460','LDAGULTO','Insert','2022-08-04 17:16:16','User LDAGULTO inserted system code.'),('TL-461','LDAGULTO','Insert','2022-08-04 17:16:43','User LDAGULTO inserted system code.'),('TL-462','LDAGULTO','Insert','2022-08-04 17:17:10','User LDAGULTO inserted system code.'),('TL-463','LDAGULTO','Insert','2022-08-04 17:17:19','User LDAGULTO inserted system code.'),('TL-464','LDAGULTO','Insert','2022-08-04 17:17:43','User LDAGULTO inserted system parameter.'),('TL-40','LDAGULTO','Attempt Log In','2022-08-05 14:50:20','User LDAGULTO attempted to log in.'),('TL-465','LDAGULTO','Insert','2022-08-05 16:32:49','User LDAGULTO inserted public holiday.'),('TL-466','LDAGULTO','Insert','2022-08-05 16:34:32','User LDAGULTO inserted public holiday.'),('TL-467','LDAGULTO','Insert','2022-08-05 16:34:44','User LDAGULTO inserted public holiday.'),('TL-468','LDAGULTO','Insert','2022-08-05 16:34:52','User LDAGULTO inserted public holiday.'),('TL-468','LDAGULTO','Insert','2022-08-05 16:34:52','User LDAGULTO inserted public holiday work location.'),('TL-468','LDAGULTO','Update','2022-08-05 16:36:31','User LDAGULTO updated public holiday.'),('TL-468','LDAGULTO','Insert','2022-08-05 16:36:31','User LDAGULTO inserted public holiday work location.'),('TL-468','LDAGULTO','Update','2022-08-05 16:36:36','User LDAGULTO updated public holiday.'),('TL-468','LDAGULTO','Insert','2022-08-05 16:36:36','User LDAGULTO inserted public holiday work location.'),('TL-465','LDAGULTO','Update','2022-08-06 09:55:47','User LDAGULTO updated public holiday.'),('TL-465','LDAGULTO','Insert','2022-08-06 09:55:47','User LDAGULTO inserted public holiday work location.'),('TL-465','LDAGULTO','Update','2022-08-06 09:55:51','User LDAGULTO updated public holiday.'),('TL-465','LDAGULTO','Insert','2022-08-06 09:55:51','User LDAGULTO inserted public holiday work location.'),('TL-469','LDAGULTO','Insert','2022-08-06 10:10:32','User LDAGULTO inserted public holiday.'),('TL-470','LDAGULTO','Insert','2022-08-06 10:31:50','User LDAGULTO inserted policy.'),('TL-471','LDAGULTO','Insert','2022-08-06 10:32:00','User LDAGULTO inserted permission.'),('TL-472','LDAGULTO','Insert','2022-08-06 10:32:07','User LDAGULTO inserted permission.'),('TL-473','LDAGULTO','Insert','2022-08-06 10:32:12','User LDAGULTO inserted permission.'),('TL-474','LDAGULTO','Insert','2022-08-06 10:32:17','User LDAGULTO inserted permission.'),('TL-475','LDAGULTO','Insert','2022-08-06 10:32:24','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-08-06 10:38:36','User LDAGULTO updated role permission.'),('TL-476','LDAGULTO','Insert','2022-08-06 20:28:54','User LDAGULTO inserted system parameter.'),('TL-476','LDAGULTO','Update','2022-08-06 20:28:59','User LDAGULTO updated system parameter.'),('TL-477','LDAGULTO','Insert','2022-08-06 20:39:58','User LDAGULTO inserted leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:41:41','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:41:59','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:42:03','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:43:53','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:45:35','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:48:02','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:48:48','User LDAGULTO updated leave type.'),('TL-478','LDAGULTO','Update','2022-08-06 20:48:57','User LDAGULTO updated leave type.'),('TL-479','LDAGULTO','Insert','2022-08-06 20:50:54','User LDAGULTO inserted leave type.'),('TL-480','LDAGULTO','Insert','2022-08-06 20:51:19','User LDAGULTO inserted leave type.'),('TL-480','LDAGULTO','Update','2022-08-06 20:52:37','User LDAGULTO updated leave type.'),('TL-480','LDAGULTO','Update','2022-08-06 20:52:40','User LDAGULTO updated leave type.'),('TL-481','LDAGULTO','Insert','2022-08-06 20:54:41','User LDAGULTO inserted policy.'),('TL-482','LDAGULTO','Insert','2022-08-06 20:54:54','User LDAGULTO inserted permission.'),('TL-483','LDAGULTO','Insert','2022-08-06 20:55:02','User LDAGULTO inserted permission.'),('TL-484','LDAGULTO','Insert','2022-08-06 20:55:09','User LDAGULTO inserted permission.'),('TL-485','LDAGULTO','Insert','2022-08-06 20:55:13','User LDAGULTO inserted permission.'),('TL-486','LDAGULTO','Insert','2022-08-06 20:55:19','User LDAGULTO inserted permission.'),('TL-32','LDAGULTO','Update','2022-08-06 20:56:08','User LDAGULTO updated role permission.'),('TL-40','LDAGULTO','Log In','2022-08-08 19:57:54','User LDAGULTO logged in.'),('TL-40','LDAGULTO','Log In','2022-08-10 13:29:54','User LDAGULTO logged in.'),('TL-480','LDAGULTO','Update','2022-08-10 14:07:16','User LDAGULTO updated leave type.'),('TL-40','LDAGULTO','Log In','2022-08-11 11:13:42','User LDAGULTO logged in.'),('TL-487','LDAGULTO','Insert','2022-08-11 14:18:19','User LDAGULTO inserted system parameter.'),('TL-488','LDAGULTO','Insert','2022-08-11 15:10:58','User LDAGULTO inserted leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:15:52','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:16:09','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:16:22','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:16:53','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:19:56','User LDAGULTO updated leave allocation.'),('TL-1','LDAGULTO','Insert','2022-08-11 15:20:18','User LDAGULTO inserted leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:30:16','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:40:30','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 15:52:08','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 16:15:35','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 16:20:13','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 16:24:35','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 16:27:51','User LDAGULTO updated leave allocation.'),('TL-488','LDAGULTO','Update','2022-08-11 16:27:56','User LDAGULTO updated leave allocation.'),('TL-2','LDAGULTO','Insert','2022-08-11 16:28:07','User LDAGULTO inserted leave allocation.'),('TL-3','LDAGULTO','Insert','2022-08-11 16:36:46','User LDAGULTO inserted leave allocation.'),('TL-4','LDAGULTO','Insert','2022-08-11 17:04:04','User LDAGULTO inserted leave allocation.'),('TL-4','LDAGULTO','Update','2022-08-11 17:19:08','User LDAGULTO updated leave allocation.'),('TL-4','LDAGULTO','Update','2022-08-11 17:19:16','User LDAGULTO updated leave allocation.'),('TL-4','LDAGULTO','Update','2022-08-11 17:28:17','User LDAGULTO updated leave allocation.');
/*!40000 ALTER TABLE `global_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_upload_file_type`
--

DROP TABLE IF EXISTS `global_upload_file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_upload_file_type` (
  `UPLOAD_SETTING_ID` int(50) DEFAULT NULL,
  `FILE_TYPE` varchar(50) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_upload_file_type`
--

LOCK TABLES `global_upload_file_type` WRITE;
/*!40000 ALTER TABLE `global_upload_file_type` DISABLE KEYS */;
INSERT INTO `global_upload_file_type` VALUES (1,'jpeg','INS->ADMIN->2022-06-14 04:20:38'),(1,'jpg','INS->ADMIN->2022-06-14 04:20:38'),(1,'png','INS->ADMIN->2022-06-14 04:20:38'),(3,'jpeg','INS->ADMIN->2022-06-19 01:19:59'),(3,'jpg','INS->ADMIN->2022-06-19 01:19:59'),(3,'png','INS->ADMIN->2022-06-19 01:19:59'),(3,'svg','INS->ADMIN->2022-06-19 01:19:59'),(4,'jpeg','INS->ADMIN->2022-06-19 01:20:30'),(4,'jpg','INS->ADMIN->2022-06-19 01:20:30'),(4,'png','INS->ADMIN->2022-06-19 01:20:30'),(4,'svg','INS->ADMIN->2022-06-19 01:20:30'),(5,'jpeg','INS->ADMIN->2022-06-19 01:21:16'),(5,'jpg','INS->ADMIN->2022-06-19 01:21:16'),(5,'png','INS->ADMIN->2022-06-19 01:21:16'),(5,'svg','INS->ADMIN->2022-06-19 01:21:16'),(6,'ico','INS->ADMIN->2022-06-19 01:21:43'),(6,'jpeg','INS->ADMIN->2022-06-19 01:21:43'),(6,'jpg','INS->ADMIN->2022-06-19 01:21:43'),(6,'png','INS->ADMIN->2022-06-19 01:21:43'),(6,'svg','INS->ADMIN->2022-06-19 01:21:43'),(7,'pdf','INS->ADMIN->2022-06-21 01:20:24'),(7,'doc','INS->ADMIN->2022-06-21 01:20:24'),(7,'docx','INS->ADMIN->2022-06-21 01:20:24'),(2,'jpeg','INS->ADMIN->2022-06-21 01:20:28'),(2,'jpg','INS->ADMIN->2022-06-21 01:20:28'),(2,'png','INS->ADMIN->2022-06-21 01:20:28'),(2,'svg','INS->ADMIN->2022-06-21 01:20:28'),(8,'jpeg','INS->ADMIN->2022-06-25 09:35:09'),(8,'jpg','INS->ADMIN->2022-06-25 09:35:09'),(8,'png','INS->ADMIN->2022-06-25 09:35:09'),(8,'svg','INS->ADMIN->2022-06-25 09:35:09'),(9,'pdf','INS->ADMIN->2022-06-25 09:35:38'),(9,'doc','INS->ADMIN->2022-06-25 09:35:38'),(9,'docx','INS->ADMIN->2022-06-25 09:35:38'),(10,'pdf','INS->LDAGULTO->2022-07-08 04:01:35'),(10,'jpeg','INS->LDAGULTO->2022-07-08 04:01:35'),(10,'jpg','INS->LDAGULTO->2022-07-08 04:01:35'),(10,'png','INS->LDAGULTO->2022-07-08 04:01:35'),(10,'svg','INS->LDAGULTO->2022-07-08 04:01:35'),(11,'pdf','INS->LDAGULTO->2022-07-08 04:02:14'),(11,'jpeg','INS->LDAGULTO->2022-07-08 04:02:14'),(11,'jpg','INS->LDAGULTO->2022-07-08 04:02:14'),(11,'png','INS->LDAGULTO->2022-07-08 04:02:14'),(11,'svg','INS->LDAGULTO->2022-07-08 04:02:14');
/*!40000 ALTER TABLE `global_upload_file_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_upload_setting`
--

DROP TABLE IF EXISTS `global_upload_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_upload_setting` (
  `UPLOAD_SETTING_ID` int(50) NOT NULL,
  `UPLOAD_SETTING` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `MAX_FILE_SIZE` double DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UPLOAD_SETTING_ID`),
  KEY `global_upload_setting_index` (`UPLOAD_SETTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_upload_setting`
--

LOCK TABLES `global_upload_setting` WRITE;
/*!40000 ALTER TABLE `global_upload_setting` DISABLE KEYS */;
INSERT INTO `global_upload_setting` VALUES (1,'Company Logo','Upload setting for company logo.',5,'TL-102','INS->ADMIN->2022-06-14 04:20:38'),(2,'Login Background','Upload setting for login background.',2,'TL-161','UPD->ADMIN->2022-06-21 01:20:28'),(3,'Login Logo','Upload setting for login logo.',2,'TL-162','INS->ADMIN->2022-06-19 01:19:59'),(4,'Menu Logo','Upload setting for menu logo.',2,'TL-163','INS->ADMIN->2022-06-19 01:20:30'),(5,'Menu Icon','Upload setting for menu icon.',2,'TL-164','INS->ADMIN->2022-06-19 01:21:16'),(6,'Favicon Image','Upload setting for favicon image.',2,'TL-165','INS->ADMIN->2022-06-19 01:21:43'),(7,'Job Description','Upload setting from job description.',2,'TL-188','INS->ADMIN->2022-06-21 01:20:24'),(8,'Employee Image','Upload setting for employee image.',2,'TL-270','INS->ADMIN->2022-06-25 09:35:09'),(9,'Work Permit','Upload setting for work permit.',2,'TL-271','INS->ADMIN->2022-06-25 09:35:38'),(10,'Attendance Adjustment','Upload setting for attendance adjustment.',2,'TL-328','INS->LDAGULTO->2022-07-08 04:01:35'),(11,'Attendance Creation','Upload setting for attendance creation.',2,'TL-329','UPD->LDAGULTO->2022-07-08 04:02:14');
/*!40000 ALTER TABLE `global_upload_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_user_account`
--

DROP TABLE IF EXISTS `global_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_user_account` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `FILE_AS` varchar(300) NOT NULL,
  `USER_STATUS` varchar(10) NOT NULL,
  `PASSWORD_EXPIRY_DATE` date NOT NULL,
  `FAILED_LOGIN` int(1) NOT NULL,
  `LAST_FAILED_LOGIN` datetime DEFAULT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`),
  KEY `global_user_account_index` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_user_account`
--

LOCK TABLES `global_user_account` WRITE;
/*!40000 ALTER TABLE `global_user_account` DISABLE KEYS */;
INSERT INTO `global_user_account` VALUES ('ADMIN','68aff5412f35ed76','Administrator','ACTIVE','2023-01-17',0,NULL,'TL-1','UPD->LDAGULTO->2022-07-17 02:23:12'),('LDAGULTO','68aff5412f35ed76','Lawrence Agulto','ACTIVE','2023-01-17',0,'2022-08-05 14:50:20','TL-40','UPD->LDAGULTO->2022-07-17 02:23:26');
/*!40000 ALTER TABLE `global_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_zoom_integration`
--

DROP TABLE IF EXISTS `global_zoom_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_zoom_integration` (
  `ZOOM_INTEGRATION_ID` int(11) NOT NULL,
  `API_KEY` varchar(1000) NOT NULL,
  `API_SECRET` varchar(1000) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ZOOM_INTEGRATION_ID`),
  KEY `global_zoom_integration_index` (`ZOOM_INTEGRATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_zoom_integration`
--

LOCK TABLES `global_zoom_integration` WRITE;
/*!40000 ALTER TABLE `global_zoom_integration` DISABLE KEYS */;
INSERT INTO `global_zoom_integration` VALUES (1,'test','test','TL-177','INS->ADMIN->2022-06-20 03:41:15');
/*!40000 ALTER TABLE `global_zoom_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_allocation`
--

DROP TABLE IF EXISTS `leave_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_allocation` (
  `LEAVE_ALLOCATION_ID` varchar(100) NOT NULL,
  `LEAVE_TYPE_ID` varchar(100) NOT NULL,
  `EMPLOYEE_ID` varchar(100) NOT NULL,
  `VALIDITY_START_DATE` date NOT NULL,
  `VALIDITY_END_DATE` date DEFAULT NULL,
  `DURATION` double NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LEAVE_ALLOCATION_ID`),
  KEY `leave_allocation_index` (`LEAVE_ALLOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_allocation`
--

LOCK TABLES `leave_allocation` WRITE;
/*!40000 ALTER TABLE `leave_allocation` DISABLE KEYS */;
INSERT INTO `leave_allocation` VALUES ('5','3','3','2022-04-04','2023-01-20',8,'TL-4','UPD->LDAGULTO->2022-08-11 05:28:17');
/*!40000 ALTER TABLE `leave_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_type` (
  `LEAVE_TYPE_ID` varchar(100) NOT NULL,
  `LEAVE_TYPE` varchar(100) NOT NULL,
  `PAID_TYPE` varchar(10) NOT NULL,
  `ALLOCATION_TYPE` varchar(50) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LEAVE_TYPE_ID`),
  KEY `leave_type_index` (`LEAVE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES ('3','Vacation Leave','PAID','LIMITED','TL-480','UPD->LDAGULTO->2022-08-10 02:07:16');
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_holiday`
--

DROP TABLE IF EXISTS `public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_holiday` (
  `PUBLIC_HOLIDAY_ID` varchar(100) NOT NULL,
  `PUBLIC_HOLIDAY` varchar(100) NOT NULL,
  `HOLIDAY_DATE` date NOT NULL,
  `HOLIDAY_TYPE` varchar(50) NOT NULL,
  `TRANSACTION_LOG_ID` varchar(100) DEFAULT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PUBLIC_HOLIDAY_ID`),
  KEY `public_holiday_index` (`PUBLIC_HOLIDAY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_holiday`
--

LOCK TABLES `public_holiday` WRITE;
/*!40000 ALTER TABLE `public_holiday` DISABLE KEYS */;
INSERT INTO `public_holiday` VALUES ('5','Christmas ','2022-12-25','REGULAR','TL-469','INS->LDAGULTO->2022-08-06 10:10:32');
/*!40000 ALTER TABLE `public_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_holiday_work_location`
--

DROP TABLE IF EXISTS `public_holiday_work_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_holiday_work_location` (
  `PUBLIC_HOLIDAY_ID` varchar(100) NOT NULL,
  `WORK_LOCATION_ID` varchar(50) NOT NULL,
  `RECORD_LOG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_holiday_work_location`
--

LOCK TABLES `public_holiday_work_location` WRITE;
/*!40000 ALTER TABLE `public_holiday_work_location` DISABLE KEYS */;
INSERT INTO `public_holiday_work_location` VALUES ('','6','INS->LDAGULTO->2022-08-05 04:32:49'),('5','6','INS->LDAGULTO->2022-08-06 10:10:32');
/*!40000 ALTER TABLE `public_holiday_work_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'disdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_approval_exception_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_approval_exception_exist`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM approval_exception WHERE APPROVAL_TYPE_ID = @approval_type_id AND EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_approval_type_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_approval_type_exist`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM approval_type WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_approver_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_approver_exist`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN department VARCHAR(50))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;
	SET @department = department;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM approval_approver WHERE APPROVAL_TYPE_ID = @approval_type_id AND EMPLOYEE_ID = @employee_id AND DEPARTMENT = @department';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendance_adjustment_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendance_adjustment_exist`(IN adjustment_id VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM attendance_adjustment WHERE ADJUSTMENT_ID = @adjustment_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendance_creation_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendance_creation_exist`(IN creation_id VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM attendance_creation WHERE CREATION_ID = @creation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendance_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendance_exist`(IN attendance_id VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM attendance_record WHERE ATTENDANCE_ID = @attendance_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendance_setting_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendance_setting_exist`(IN attendance_setting_id VARCHAR(50))
BEGIN
	SET @attendance_setting_id = attendance_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM attendance_setting WHERE ATTENDANCE_SETTING_ID = @attendance_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_company_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_company_exist`(IN company_id INT)
BEGIN
	SET @company_id = company_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_country_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_country_exist`(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_department_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_department_exist`(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_departure_reason_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_departure_reason_exist`(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_employee_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_employee_exist`(IN employee_id INT)
BEGIN
	SET @employee_id = employee_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_details WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_employee_type_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_employee_type_exist`(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_interface_settings_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_interface_settings_exist`(IN interface_setting_id INT)
BEGIN
	SET @interface_setting_id = interface_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_interface_setting WHERE INTERFACE_SETTING_ID = @interface_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_job_position_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_job_position_exist`(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_leave_allocation_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_leave_allocation_exist`(IN leave_allocation_id VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM leave_allocation WHERE LEAVE_ALLOCATION_ID = @leave_allocation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_leave_allocation_overlap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_leave_allocation_overlap`(IN leave_allocation_id VARCHAR(100), IN employee_id VARCHAR(100), IN leave_type VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;
	SET @employee_id = employee_id;
	SET @leave_type = leave_type;

	IF @leave_allocation_id IS NULL OR @leave_allocation_id = '' THEN
		SET @query = 'SELECT VALIDITY_START_DATE, VALIDITY_END_DATE FROM leave_allocation WHERE EMPLOYEE_ID = @employee_id AND LEAVE_TYPE_ID = @leave_type';
	ELSE
		SET @query = 'SELECT VALIDITY_START_DATE, VALIDITY_END_DATE FROM leave_allocation WHERE LEAVE_ALLOCATION_ID != @leave_allocation_id AND EMPLOYEE_ID = @employee_id AND LEAVE_TYPE_ID = @leave_type';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_leave_type_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_leave_type_exist`(IN leave_type_id VARCHAR(100))
BEGIN
	SET @leave_type_id = leave_type_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM leave_type WHERE LEAVE_TYPE_ID = @leave_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_mail_configuration_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_mail_configuration_exist`(IN mail_configuration_id INT)
BEGIN
	SET @mail_configuration_id = mail_configuration_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_mail_configuration WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_notification_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_notification_channel`(IN notification_setting_id INT, IN channel VARCHAR(20))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @channel = channel;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_notification_channel WHERE NOTIFICATION_SETTING_ID = @notification_setting_id AND CHANNEL = @channel';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_notification_setting_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_notification_setting_exist`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_notification_template_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_notification_template_exist`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_permission_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_permission_exist`(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_policy_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_policy_exist`(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_public_holiday_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_public_holiday_exist`(IN public_holiday_id VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM public_holiday WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_role_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_role_exist`(IN role_id VARCHAR(50))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_state_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_state_exist`(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_system_code_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_system_code_exist`(IN system_type VARCHAR(20), IN system_code VARCHAR(20))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_system_parameter_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_system_parameter_exist`(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_upload_setting_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_upload_setting_exist`(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user_account_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user_account_exist`(IN username VARCHAR(50))
BEGIN
	SET @username = username;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_user_account WHERE BINARY USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_working_hours_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_working_hours_exist`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_working_hours WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_working_hours_schedule_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_working_hours_schedule_exist`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_working_hours_schedule WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_work_location_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_work_location_exist`(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_zoom_integration_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_zoom_integration_exist`(IN zoom_integration_id INT)
BEGIN
	SET @zoom_integration_id = zoom_integration_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_zoom_integration WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_approval_approver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_approval_approver`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'DELETE FROM approval_approver WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_approval_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_approval_exception`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'DELETE FROM approval_exception WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_attendance_adjustment_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_attendance_adjustment_exception`()
BEGIN
	SET @query = 'DELETE FROM attendance_adjustment_exception';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_attendance_creation_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_attendance_creation_exception`()
BEGIN
	SET @query = 'DELETE FROM attendance_creation_exception';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_employee_related_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_employee_related_user`(IN user_code VARCHAR(50))
BEGIN
	SET @user_code = user_code;

	SET @query = 'UPDATE employee_details SET USERNAME = null WHERE USERNAME = @user_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_employee_working_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_employee_working_hours`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'UPDATE employee_details SET WORKING_HOURS = null WHERE WORKING_HOURS = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_notification_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_notification_channel`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_channel WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_notification_role_recipient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_notification_role_recipient`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_role_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_notification_template` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_notification_template`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_notification_user_account_recipient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_notification_user_account_recipient`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_user_account_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_permission`(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'DELETE FROM global_permission WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_public_holiday_work_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_public_holiday_work_location`(IN public_holiday_id VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;

	SET @query = 'DELETE FROM public_holiday_work_location WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_state`(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'DELETE FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_upload_file_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_upload_file_type`(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'DELETE FROM global_upload_file_type WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_user_account_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_user_account_role`(IN user_code VARCHAR(50))
BEGIN
	SET @user_code = user_code;

	SET @query = 'DELETE FROM global_role_user_account WHERE USERNAME = @user_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_approval_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_approval_exception`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;

	SET @query = 'DELETE FROM approval_exception WHERE APPROVAL_TYPE_ID = @approval_type_id AND EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_approval_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_approval_type`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'DELETE FROM approval_type WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_approver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_approver`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN department VARCHAR(50))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;
	SET @department = department;

	SET @query = 'DELETE FROM approval_approver WHERE APPROVAL_TYPE_ID = @approval_type_id AND EMPLOYEE_ID = @employee_id AND DEPARTMENT = @department';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_attendance`(IN attendance_id VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;

	SET @query = 'DELETE FROM attendance_record WHERE ATTENDANCE_ID = @attendance_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_attendance_adjustment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_attendance_adjustment`(IN adjustment_id VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;

	SET @query = 'DELETE FROM attendance_adjustment WHERE ADJUSTMENT_ID = @adjustment_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_attendance_creation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_attendance_creation`(IN creation_id VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;

	SET @query = 'DELETE FROM attendance_creation WHERE CREATION_ID = @creation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_company`(IN company_id VARCHAR(50))
BEGIN
	SET @company_id = company_id;

	SET @query = 'DELETE FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_country`(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'DELETE FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_department`(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'DELETE FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_departure_reason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_departure_reason`(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'DELETE FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(IN employee_id VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;

	SET @query = 'DELETE FROM employee_details WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee_type`(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'DELETE FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_job_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_job_position`(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'DELETE FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_leave_allocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_leave_allocation`(IN leave_allocation_id VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;

	SET @query = 'DELETE FROM leave_allocation WHERE LEAVE_ALLOCATION_ID = @leave_allocation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_leave_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_leave_type`(IN leave_type_id VARCHAR(100))
BEGIN
	SET @leave_type_id = leave_type_id;

	SET @query = 'DELETE FROM leave_type WHERE LEAVE_TYPE_ID = @leave_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_notification_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_notification_setting`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_permission`(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'DELETE FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_permission_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_permission_role`(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'DELETE FROM global_role_permission WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_policy`(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'DELETE FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_public_holiday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_public_holiday`(IN public_holiday_id VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;

	SET @query = 'DELETE FROM public_holiday WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_role`(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'DELETE FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_state`(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'DELETE FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_system_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_system_code`(IN system_type VARCHAR(100), IN system_code VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'DELETE FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_system_parameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_system_parameter`(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'DELETE FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_upload_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_upload_setting`(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'DELETE FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_working_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_working_hours`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'DELETE FROM employee_working_hours WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_working_hours_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_working_hours_schedule`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'DELETE FROM employee_working_hours_schedule WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_work_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_work_location`(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'DELETE FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_company_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_company_options`()
BEGIN
	SET @query = 'SELECT COMPANY_ID, COMPANY_NAME FROM global_company ORDER BY COMPANY_NAME';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_country_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_country_options`()
BEGIN
	SET @query = 'SELECT COUNTRY_ID, COUNTRY_NAME FROM global_country ORDER BY COUNTRY_NAME';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_department_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_department_options`()
BEGIN
	SET @query = 'SELECT DEPARTMENT_ID, DEPARTMENT FROM employee_department ORDER BY DEPARTMENT';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_departure_reason_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_departure_reason_options`()
BEGIN
	SET @query = 'SELECT DEPARTURE_REASON_ID, DEPARTURE_REASON FROM employee_departure_reason ORDER BY DEPARTURE_REASON';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_employee_attendance_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_employee_attendance_options`(IN employee_id VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;

	SET @query = 'SELECT ATTENDANCE_ID, TIME_IN, TIME_OUT FROM attendance_record WHERE EMPLOYEE_ID = @employee_id ORDER BY TIME_IN DESC';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_employee_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_employee_options`()
BEGIN
	SET @query = 'SELECT EMPLOYEE_ID, FILE_AS FROM employee_details ORDER BY FILE_AS';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_employee_type_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_employee_type_options`()
BEGIN
	SET @query = 'SELECT EMPLOYEE_TYPE_ID, EMPLOYEE_TYPE FROM employee_type ORDER BY EMPLOYEE_TYPE';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_job_position_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_job_position_options`()
BEGIN
	SET @query = 'SELECT JOB_POSITION_ID, JOB_POSITION FROM employee_job_position ORDER BY JOB_POSITION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_leave_type_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_leave_type_options`()
BEGIN
	SET @query = 'SELECT LEAVE_TYPE_ID, LEAVE_TYPE FROM leave_type ORDER BY LEAVE_TYPE';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_role_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_role_options`()
BEGIN
	SET @query = 'SELECT ROLE_ID, ROLE FROM global_role ORDER BY ROLE';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_system_code_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_system_code_options`(IN system_type VARCHAR(100))
BEGIN
	SET @system_type = system_type;

	SET @query = 'SELECT SYSTEM_CODE, SYSTEM_DESCRIPTION FROM global_system_code WHERE SYSTEM_TYPE = @system_type ORDER BY SYSTEM_DESCRIPTION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_user_account_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_user_account_options`()
BEGIN
	SET @query = 'SELECT USERNAME FROM global_user_account ORDER BY USERNAME';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_working_hours_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_working_hours_options`()
BEGIN
	SET @query = 'SELECT WORKING_HOURS_ID, WORKING_HOURS FROM employee_working_hours ORDER BY WORKING_HOURS';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_work_location_options` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_work_location_options`()
BEGIN
	SET @query = 'SELECT WORK_LOCATION_ID, WORK_LOCATION FROM employee_work_location ORDER BY WORK_LOCATION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_approval_exception_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_approval_exception_details`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'SELECT EMPLOYEE_ID, RECORD_LOG FROM approval_exception WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_approval_type_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_approval_type_details`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'SELECT APPROVAL_TYPE, APPROVAL_TYPE_DESCRIPTION, STATUS, TRANSACTION_LOG_ID, RECORD_LOG FROM approval_type WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_approver_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_approver_details`(IN approval_type_id VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;

	SET @query = 'SELECT EMPLOYEE_ID, DEPARTMENT, RECORD_LOG FROM approval_approver WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_adjustment_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_adjustment_details`(IN adjustment_id VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;

	SET @query = 'SELECT ATTENDANCE_ID, EMPLOYEE_ID, TIME_IN, TIME_OUT, REASON, ATTACHMENT, STATUS, SANCTION, CREATED_DATE, FOR_RECOMMENDATION_DATE, RECOMMENDATION_DATE, RECOMMENDATION_BY, RECOMMENDATION_REMARKS, DECISION_DATE, DECISION_BY, DECISION_REMARKS, TRANSACTION_LOG_ID, RECORD_LOG FROM attendance_adjustment WHERE ADJUSTMENT_ID = @adjustment_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_adjustment_exception_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_adjustment_exception_details`(IN exception_type VARCHAR(5))
BEGIN
	SET @exception_type = exception_type;

	SET @query = 'SELECT EMPLOYEE_ID, RECORD_LOG FROM attendance_adjustment_exception WHERE EXCEPTION_TYPE = @exception_type';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_creation_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_creation_details`(IN creation_id VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;

	SET @query = 'SELECT EMPLOYEE_ID, TIME_IN, TIME_OUT, REASON, ATTACHMENT, STATUS, SANCTION, CREATED_DATE, FOR_RECOMMENDATION_DATE, RECOMMENDATION_DATE, RECOMMENDATION_BY, RECOMMENDATION_REMARKS, DECISION_DATE, DECISION_BY, DECISION_REMARKS, TRANSACTION_LOG_ID, RECORD_LOG FROM attendance_creation WHERE CREATION_ID = @creation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_creation_exception_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_creation_exception_details`(IN exception_type VARCHAR(5))
BEGIN
	SET @exception_type = exception_type;

	SET @query = 'SELECT EMPLOYEE_ID, RECORD_LOG FROM attendance_creation_exception WHERE EXCEPTION_TYPE = @exception_type';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_details`(IN attendance_id VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;

	SET @query = 'SELECT EMPLOYEE_ID, TIME_IN, TIME_IN_LOCATION, TIME_IN_IP_ADDRESS, TIME_IN_BY, TIME_IN_BEHAVIOR, TIME_IN_NOTE, TIME_OUT, TIME_OUT_LOCATION, TIME_OUT_IP_ADDRESS, TIME_OUT_BY, TIME_OUT_BEHAVIOR, TIME_OUT_NOTE, LATE, EARLY_LEAVING, OVERTIME, TOTAL_WORKING_HOURS, REMARKS, TRANSACTION_LOG_ID, RECORD_LOG FROM attendance_record WHERE ATTENDANCE_ID = @attendance_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_setting_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_setting_details`(IN attendance_setting_id VARCHAR(50))
BEGIN
	SET @attendance_setting_id = attendance_setting_id;

	SET @query = 'SELECT MAX_ATTENDANCE, LATE_GRACE_PERIOD, TIME_OUT_INTERVAL, LATE_POLICY, EARLY_LEAVING_POLICY, OVERTIME_POLICY, TRANSACTION_LOG_ID, RECORD_LOG FROM attendance_setting WHERE ATTENDANCE_SETTING_ID = @attendance_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_total_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_total_by_date`(IN employee_id VARCHAR(100), IN TIME_IN DATE)
BEGIN
	SET @employee_id = employee_id;
	SET @TIME_IN = TIME_IN;

	SET @query = 'SELECT COUNT(ATTENDANCE_ID) AS TOTAL FROM attendance_record WHERE EMPLOYEE_ID = @employee_id AND DATE(TIME_IN) = @TIME_IN AND TIME_OUT IS NOT NULL';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_company_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_company_details`(IN company_id VARCHAR(50))
BEGIN
	SET @company_id = company_id;

	SET @query = 'SELECT COMPANY_NAME, COMPANY_LOGO, EMAIL, TELEPHONE, MOBILE, WEBSITE, TAX_ID, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_country_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_country_details`(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'SELECT COUNTRY_NAME, TRANSACTION_LOG_ID, RECORD_LOG FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_department_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_department_details`(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'SELECT DEPARTMENT, PARENT_DEPARTMENT, MANAGER, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_departure_reason_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_departure_reason_details`(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'SELECT DEPARTURE_REASON, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_details`(IN id VARCHAR(100))
BEGIN
	SET @id = id;

	SET @query = 'SELECT EMPLOYEE_ID, USERNAME, BADGE_ID, EMPLOYEE_IMAGE, FILE_AS, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, COMPANY, JOB_POSITION, DEPARTMENT, WORK_LOCATION, WORKING_HOURS, MANAGER, COACH, EMPLOYEE_TYPE, EMPLOYEE_STATUS, PERMANENCY_DATE, ONBOARD_DATE, OFFBOARD_DATE, DEPARTURE_REASON, DETAILED_REASON, WORK_EMAIL, WORK_TELEPHONE, WORK_MOBILE, SSS, TIN, PAGIBIG, PHILHEALTH, BANK_ACCOUNT_NUMBER, HOME_WORK_DISTANCE, PERSONAL_EMAIL, PERSONAL_TELEPHONE, PERSONAL_MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, MARITAL_STATUS, SPOUSE_NAME, SPOUSE_BIRTHDAY, EMERGENCY_CONTACT, EMERGENCY_PHONE, NATIONALITY, IDENTIFICATION_NUMBER, PASSPORT_NUMBER, GENDER, BIRTHDAY, CERTIFICATE_LEVEL, FIELD_OF_STUDY, SCHOOL, PLACE_OF_BIRTH, NUMBER_OF_CHILDREN, VISA_NUMBER, WORK_PERMIT_NUMBER, VISA_EXPIRY_DATE, WORK_PERMIT_EXPIRY_DATE, WORK_PERMIT, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_details WHERE EMPLOYEE_ID = @id OR USERNAME = @id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_type_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_type_details`(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'SELECT EMPLOYEE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_working_hours_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_working_hours_details`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'SELECT EMPLOYEE_IMAGE, EMPLOYEE_ID, FILE_AS, JOB_POSITION FROM employee_details WHERE WORKING_HOURS = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_interface_settings_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_interface_settings_details`(IN interface_setting_id INT)
BEGIN
	SET @interface_setting_id = interface_setting_id;

	SET @query = 'SELECT LOGIN_BACKGROUND, LOGIN_LOGO, MENU_LOGO, MENU_ICON, FAVICON, TRANSACTION_LOG_ID, RECORD_LOG FROM global_interface_setting WHERE INTERFACE_SETTING_ID = @interface_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_position_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_job_position_details`(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'SELECT JOB_POSITION, JOB_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leave_allocation_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_leave_allocation_details`(IN leave_allocation_id VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;

	SET @query = 'SELECT LEAVE_TYPE_ID, EMPLOYEE_ID, VALIDITY_START_DATE, VALIDITY_END_DATE, DURATION, TRANSACTION_LOG_ID, RECORD_LOG FROM leave_allocation WHERE LEAVE_ALLOCATION_ID = @leave_allocation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leave_type_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_leave_type_details`(IN leave_type_id VARCHAR(100))
BEGIN
	SET @leave_type_id = leave_type_id;

	SET @query = 'SELECT LEAVE_TYPE, PAID_TYPE, ALLOCATION_TYPE, TRANSACTION_LOG_ID, RECORD_LOG FROM leave_type WHERE LEAVE_TYPE_ID = @leave_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_mail_configuration_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_mail_configuration_details`(IN mail_configuration_id INT)
BEGIN
	SET @mail_configuration_id = mail_configuration_id;

	SET @query = 'SELECT MAIL_HOST, PORT, SMTP_AUTH, SMTP_AUTO_TLS, USERNAME, PASSWORD, MAIL_ENCRYPTION, MAIL_FROM_NAME, MAIL_FROM_EMAIL, TRANSACTION_LOG_ID, RECORD_LOG FROM global_mail_configuration WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_channel_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_channel_details`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT CHANNEL, RECORD_LOG FROM global_notification_channel WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_count`(IN notification_to VARCHAR(100), IN status INT)
BEGIN
	SET @notification_to = notification_to;
	SET @status = status;

	SET @query = 'SELECT COUNT(NOTIFICATION_ID) AS TOTAL FROM global_notification WHERE NOTIFICATION_TO = @notification_to AND STATUS = @status';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_role_recipient_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_role_recipient_details`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT ROLE_ID, RECORD_LOG FROM global_notification_role_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_setting_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_setting_details`(IN `notification_setting_id` INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT NOTIFICATION_SETTING, NOTIFICATION_SETTING_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_template_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_template_details`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT NOTIFICATION_TITLE, NOTIFICATION_MESSAGE, SYSTEM_LINK, EMAIL_LINK, RECORD_LOG FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_user_account_recipient_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_notification_user_account_recipient_details`(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT USERNAME, RECORD_LOG FROM global_notification_user_account_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_permission_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_permission_count`(IN role_id VARCHAR(50), IN permission_id INT)
BEGIN
	SET @role_id = role_id;
	SET @permission_id = permission_id;

	SET @query = 'SELECT COUNT(PERMISSION_ID) AS TOTAL FROM global_role_permission WHERE ROLE_ID = @role_id AND PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_permission_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_permission_details`(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'SELECT POLICY_ID, PERMISSION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_policy_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_policy_details`(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'SELECT POLICY, POLICY_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_public_holiday_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_public_holiday_details`(IN public_holiday_id VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;

	SET @query = 'SELECT PUBLIC_HOLIDAY, HOLIDAY_DATE, HOLIDAY_TYPE, TRANSACTION_LOG_ID, RECORD_LOG FROM public_holiday WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_public_holiday_work_location_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_public_holiday_work_location_details`(IN public_holiday_id VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;


	SET @query = 'SELECT WORK_LOCATION_ID, RECORD_LOG FROM public_holiday_work_location WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_recent_employee_attendance_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_recent_employee_attendance_details`(IN employee_id VARCHAR(100), IN TIME_IN DATE)
BEGIN
	SET @employee_id = employee_id;
	SET @TIME_IN = TIME_IN;

	SET @query = 'SELECT ATTENDANCE_ID, TIME_IN, TIME_IN_LOCATION, TIME_IN_IP_ADDRESS, TIME_IN_BY, TIME_IN_BEHAVIOR, TIME_IN_NOTE, TIME_OUT, TIME_OUT_LOCATION, TIME_OUT_IP_ADDRESS, TIME_OUT_BY, TIME_OUT_BEHAVIOR, TIME_OUT_NOTE, LATE, EARLY_LEAVING, OVERTIME, TOTAL_WORKING_HOURS, REMARKS, TRANSACTION_LOG_ID, RECORD_LOG FROM attendance_record WHERE EMPLOYEE_ID = @employee_id AND DATE(TIME_IN) = @TIME_IN ORDER BY TIME_IN DESC LIMIT 1';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_role_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_role_details`(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT ROLE, ROLE_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_role_permission_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_role_permission_details`(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT PERMISSION_ID, RECORD_LOG FROM global_role_permission WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_state_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_state_details`(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'SELECT STATE_NAME, COUNTRY_ID, TRANSACTION_LOG_ID, RECORD_LOG FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_system_code_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_system_code_details`(IN system_type VARCHAR(100), IN system_code VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'SELECT SYSTEM_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_system_parameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_system_parameter`(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT PARAMETER_EXTENSION, PARAMETER_NUMBER FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_system_parameter_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_system_parameter_details`(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID, RECORD_LOG FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_upload_file_type_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_upload_file_type_details`(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT FILE_TYPE, RECORD_LOG FROM global_upload_file_type WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_upload_setting_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_upload_setting_details`(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT UPLOAD_SETTING, DESCRIPTION, MAX_FILE_SIZE, TRANSACTION_LOG_ID, RECORD_LOG FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_account_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_account_details`(IN username VARCHAR(50))
BEGIN
	SET @username = username;

	SET @query = 'SELECT PASSWORD, FILE_AS, USER_STATUS, PASSWORD_EXPIRY_DATE, FAILED_LOGIN, LAST_FAILED_LOGIN, TRANSACTION_LOG_ID, RECORD_LOG FROM global_user_account WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_account_role_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_account_role_details`(IN role_id VARCHAR(50), IN username VARCHAR(50))
BEGIN
	SET @role_id = role_id;
	SET @username = username;

	SET @query = 'SELECT ROLE_ID, USERNAME, RECORD_LOG FROM global_role_user_account WHERE ROLE_ID = @role_id OR USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_working_hours_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_working_hours_details`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'SELECT WORKING_HOURS, SCHEDULE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_working_hours WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_working_hours_schedule_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_working_hours_schedule_details`(IN working_hours_id VARCHAR(50))
BEGIN
	SET @working_hours_id = working_hours_id;

	SET @query = 'SELECT START_DATE, END_DATE, MONDAY_MORNING_WORK_FROM, MONDAY_MORNING_WORK_TO, MONDAY_AFTERNOON_WORK_FROM, MONDAY_AFTERNOON_WORK_TO, TUESDAY_MORNING_WORK_FROM, TUESDAY_MORNING_WORK_TO, TUESDAY_AFTERNOON_WORK_FROM, TUESDAY_AFTERNOON_WORK_TO, WEDNESDAY_MORNING_WORK_FROM, WEDNESDAY_MORNING_WORK_TO, WEDNESDAY_AFTERNOON_WORK_FROM, WEDNESDAY_AFTERNOON_WORK_TO, THURSDAY_MORNING_WORK_FROM, THURSDAY_MORNING_WORK_TO, THURSDAY_AFTERNOON_WORK_FROM, THURSDAY_AFTERNOON_WORK_TO, FRIDAY_MORNING_WORK_FROM, FRIDAY_MORNING_WORK_TO, FRIDAY_AFTERNOON_WORK_FROM, FRIDAY_AFTERNOON_WORK_TO, SATURDAY_MORNING_WORK_FROM, SATURDAY_MORNING_WORK_TO, SATURDAY_AFTERNOON_WORK_FROM, SATURDAY_AFTERNOON_WORK_TO, SUNDAY_MORNING_WORK_FROM, SUNDAY_MORNING_WORK_TO, SUNDAY_AFTERNOON_WORK_FROM, SUNDAY_AFTERNOON_WORK_TO, RECORD_LOG FROM employee_working_hours_schedule WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_work_location_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_work_location_details`(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'SELECT WORK_LOCATION, EMAIL, TELEPHONE, MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_zoom_integration_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_zoom_integration_details`(IN zoom_integration_id INT)
BEGIN
	SET @zoom_integration_id = zoom_integration_id;

	SET @query = 'SELECT API_KEY, API_SECRET, TRANSACTION_LOG_ID, RECORD_LOG FROM global_zoom_integration WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_approval_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_approval_exception`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO approval_exception (APPROVAL_TYPE_ID, EMPLOYEE_ID, RECORD_LOG) VALUES(@approval_type_id, @employee_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_approval_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_approval_type`(IN approval_type_id VARCHAR(100), IN approval_type VARCHAR(100), IN approval_type_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @approval_type = approval_type;
	SET @approval_type_description = approval_type_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO approval_type (APPROVAL_TYPE_ID, APPROVAL_TYPE, APPROVAL_TYPE_DESCRIPTION, STATUS, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@approval_type_id, @approval_type, @approval_type_description, "INACTIVE", @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_approver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_approver`(IN approval_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN department VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @employee_id = employee_id;
	SET @department = department;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO approval_approver (APPROVAL_TYPE_ID, EMPLOYEE_ID, DEPARTMENT, RECORD_LOG) VALUES(@approval_type_id, @employee_id, @department, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance`(IN attendance_id VARCHAR(100), IN employee_id VARCHAR(100), IN time_in DATETIME, IN time_in_ip_address VARCHAR(20), IN time_in_by VARCHAR(100), IN time_in_behavior VARCHAR(20), IN time_out DATETIME, IN time_out_ip_address VARCHAR(20), IN time_out_by VARCHAR(100), IN time_out_behavior VARCHAR(20), IN late DOUBLE, IN early_leaving DOUBLE, IN overtime DOUBLE, IN total_hours DOUBLE, IN remarks VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;
	SET @employee_id = employee_id;
	SET @time_in = time_in;
	SET @time_in_ip_address = time_in_ip_address;
	SET @time_in_by = time_in_by;
	SET @time_in_behavior = time_in_behavior;
	SET @time_out = time_out;
	SET @time_out_ip_address = time_out_ip_address;
	SET @time_out_by = time_out_by;
	SET @time_out_behavior = time_out_behavior;
	SET @late = late;
	SET @early_leaving = early_leaving;
	SET @overtime = overtime;
	SET @total_hours = total_hours;
	SET @remarks = remarks;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_record (ATTENDANCE_ID, EMPLOYEE_ID, TIME_IN, TIME_IN_IP_ADDRESS, TIME_IN_BY, TIME_IN_BEHAVIOR, TIME_OUT, TIME_OUT_IP_ADDRESS, TIME_OUT_BY, TIME_OUT_BEHAVIOR, LATE, EARLY_LEAVING, OVERTIME, TOTAL_WORKING_HOURS, REMARKS, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@attendance_id, @employee_id, @time_in, @time_in_ip_address, @time_in_by, @time_in_behavior, @time_out, @time_out_ip_address, @time_out_by, @time_out_behavior, @late, @early_leaving, @overtime, @total_hours, @remarks, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_adjustment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_adjustment`(IN adjustment_id VARCHAR(100), IN attendance_id VARCHAR(100), IN employee_id VARCHAR(100), IN time_in DATETIME, IN time_out DATETIME, IN reason VARCHAR(500), IN created_date DATETIME, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;
	SET @attendance_id = attendance_id;
	SET @employee_id = employee_id;
	SET @time_in = time_in;
	SET @time_out = time_out;
	SET @reason = reason;
	SET @created_date = created_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_adjustment (ADJUSTMENT_ID, ATTENDANCE_ID, EMPLOYEE_ID, TIME_IN, TIME_OUT, REASON, CREATED_DATE, STATUS, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@adjustment_id, @attendance_id, @employee_id, @time_in, @time_out, @reason, @created_date, "PEN", @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_adjustment_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_adjustment_exception`(IN employee_id VARCHAR(100), IN exception_type VARCHAR(5), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @exception_type = exception_type;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_adjustment_exception (EMPLOYEE_ID, EXCEPTION_TYPE, RECORD_LOG) VALUES(@employee_id, @exception_type, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_creation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_creation`(IN creation_id VARCHAR(100), IN employee_id VARCHAR(100), IN time_in DATETIME, IN time_out DATETIME, IN reason VARCHAR(500), IN created_date DATETIME, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;
	SET @employee_id = employee_id;
	SET @time_in = time_in;
	SET @time_out = time_out;
	SET @reason = reason;
	SET @created_date = created_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_creation (CREATION_ID, EMPLOYEE_ID, TIME_IN, TIME_OUT, REASON, CREATED_DATE, STATUS, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@creation_id, @employee_id, @time_in, @time_out, @reason, @created_date, "PEN", @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_creation_exception` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_creation_exception`(IN employee_id VARCHAR(100), IN exception_type VARCHAR(5), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @exception_type = exception_type;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_creation_exception (EMPLOYEE_ID, EXCEPTION_TYPE, RECORD_LOG) VALUES(@employee_id, @exception_type, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_setting`(IN attendance_setting_id VARCHAR(50), IN maximum_attendance INT, IN late_grace_period INT, IN time_out_interval INT, IN late_policy INT, IN early_leaving_policy INT, IN overtime_policy INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_setting_id = attendance_setting_id;
	SET @maximum_attendance = maximum_attendance;
	SET @late_grace_period = late_grace_period;
	SET @time_out_interval = time_out_interval;
	SET @late_policy = late_policy;
	SET @early_leaving_policy = early_leaving_policy;
	SET @overtime_policy = overtime_policy;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_setting (ATTENDANCE_SETTING_ID, MAX_ATTENDANCE, LATE_GRACE_PERIOD, TIME_OUT_INTERVAL, LATE_POLICY, EARLY_LEAVING_POLICY, OVERTIME_POLICY, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@attendance_setting_id, @maximum_attendance, @late_grace_period, @time_out_interval, @late_policy, @early_leaving_policy, @overtime_policy, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_company`(IN company_id VARCHAR(50), IN company_name VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN website VARCHAR(100), IN tax_id VARCHAR(100), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_name = company_name;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @website = website;
	SET @tax_id = tax_id;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_company (COMPANY_ID, COMPANY_NAME, EMAIL, TELEPHONE, MOBILE, WEBSITE, TAX_ID, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@company_id, @company_name, @email, @telephone, @mobile, @website, @tax_id, @street_1, @street_2, @country_id, @state_id, @city, @zip_code, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_country`(IN country_id INT, IN country_name VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @country_id = country_id;
	SET @country_name = country_name;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_country (COUNTRY_ID, COUNTRY_NAME, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@country_id, @country_name, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_department`(IN department_id VARCHAR(50), IN department VARCHAR(100), IN parent_department VARCHAR(50), IN manager VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @department_id = department_id;
	SET @department = department;
	SET @parent_department = parent_department;
	SET @manager = manager;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_department (DEPARTMENT_ID, DEPARTMENT, PARENT_DEPARTMENT, MANAGER, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@department_id, @department, @parent_department, @manager, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_departure_reason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_departure_reason`(IN departure_reason_id VARCHAR(50), IN departure_reason VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @departure_reason_id = departure_reason_id;
	SET @departure_reason = departure_reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_departure_reason (DEPARTURE_REASON_ID, DEPARTURE_REASON, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@departure_reason_id, @departure_reason, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employee`(IN employee_id VARCHAR(100), IN badge_id VARCHAR(100), IN file_as VARCHAR(350), IN first_name VARCHAR(100), IN middle_name VARCHAR(100), IN last_name VARCHAR(100), IN suffix VARCHAR(5), IN company VARCHAR(50), IN job_position VARCHAR(50), IN department VARCHAR(50), IN work_location VARCHAR(50), IN working_hours VARCHAR(50), IN manager VARCHAR(100), IN coach VARCHAR(100), IN employee_type VARCHAR(100), IN permanency_date DATE, IN onboard_date DATE, IN work_email VARCHAR(50), IN work_telephone VARCHAR(50), IN work_mobile VARCHAR(50), IN sss VARCHAR(20), IN tin VARCHAR(20), IN pagibig VARCHAR(20), IN philhealth VARCHAR(20), IN bank_account_number VARCHAR(100), IN home_work_distance DOUBLE, IN personal_email VARCHAR(50), IN personal_telephone VARCHAR(20), IN personal_mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN marital_status VARCHAR(20), IN spouse_name VARCHAR(500), IN spouse_birthday DATE, IN emergency_contact VARCHAR(500), IN emergency_phone VARCHAR(20), IN nationality INT, IN identification_number VARCHAR(100), IN passport_number VARCHAR(100), IN gender VARCHAR(20), IN birthday DATE, IN certificate_level VARCHAR(20), IN field_of_study VARCHAR(200), IN school VARCHAR(200), IN place_of_birth VARCHAR(500), IN number_of_children INT, IN visa_number VARCHAR(100), IN work_permit_number VARCHAR(100), IN visa_expiry_date DATE, IN work_permit_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @badge_id = badge_id;
	SET @file_as = file_as;
	SET @first_name = first_name;
	SET @middle_name = middle_name;
	SET @last_name = last_name;
	SET @suffix = suffix;
	SET @company = company;
	SET @job_position = job_position;
	SET @department = department;
	SET @work_location = work_location;
	SET @working_hours = working_hours;
	SET @manager = manager;
	SET @coach = coach;
	SET @employee_type = employee_type;
	SET @permanency_date = permanency_date;
	SET @onboard_date = onboard_date;
	SET @work_email = work_email;
	SET @work_telephone = work_telephone;
	SET @work_mobile = work_mobile;
	SET @sss = sss;
	SET @tin = tin;
	SET @pagibig = pagibig;
	SET @philhealth = philhealth;
	SET @bank_account_number = bank_account_number;
	SET @home_work_distance = home_work_distance;
	SET @personal_email = personal_email;
	SET @personal_telephone = personal_telephone;
	SET @personal_mobile = personal_mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state = state;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @marital_status = marital_status;
	SET @spouse_name = spouse_name;
	SET @spouse_birthday = spouse_birthday;
	SET @emergency_contact = emergency_contact;
	SET @emergency_phone = emergency_phone;
	SET @nationality = nationality;
	SET @identification_number = identification_number;
	SET @passport_number = passport_number;
	SET @gender = gender;
	SET @birthday = birthday;
	SET @certificate_level = certificate_level;
	SET @field_of_study = field_of_study;
	SET @school = school;
	SET @place_of_birth = place_of_birth;
	SET @number_of_children = number_of_children;
	SET @visa_number = visa_number;
	SET @work_permit_number = work_permit_number;
	SET @visa_expiry_date = visa_expiry_date;
	SET @work_permit_expiry_date = work_permit_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_details (EMPLOYEE_ID, BADGE_ID, FILE_AS, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, COMPANY, JOB_POSITION, DEPARTMENT, WORK_LOCATION, WORKING_HOURS, MANAGER, COACH, EMPLOYEE_TYPE, EMPLOYEE_STATUS, PERMANENCY_DATE, ONBOARD_DATE, WORK_EMAIL, WORK_TELEPHONE, WORK_MOBILE, SSS, TIN, PAGIBIG, PHILHEALTH, BANK_ACCOUNT_NUMBER, HOME_WORK_DISTANCE, PERSONAL_EMAIL, PERSONAL_TELEPHONE, PERSONAL_MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, MARITAL_STATUS, SPOUSE_NAME, SPOUSE_BIRTHDAY, EMERGENCY_CONTACT, EMERGENCY_PHONE, NATIONALITY, IDENTIFICATION_NUMBER, PASSPORT_NUMBER, GENDER, BIRTHDAY, CERTIFICATE_LEVEL, FIELD_OF_STUDY, SCHOOL, PLACE_OF_BIRTH, NUMBER_OF_CHILDREN, VISA_NUMBER, WORK_PERMIT_NUMBER, VISA_EXPIRY_DATE, WORK_PERMIT_EXPIRY_DATE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@employee_id, @badge_id, @file_as, @first_name, @middle_name, @last_name, @suffix, @company, @job_position, @department, @work_location, @working_hours, @manager, @coach, @employee_type, "ACTIVE", @permanency_date, @onboard_date, @work_email, @work_telephone, @work_mobile, @sss, @tin, @pagibig, @philhealth, @bank_account_number, @home_work_distance, @personal_email, @personal_telephone, @personal_mobile, @street_1, @street_2, @country_id, @state, @city, @zip_code, @marital_status, @spouse_name, @spouse_birthday, @emergency_contact, @emergency_phone, @nationality, @identification_number, @passport_number, @gender, @birthday, @certificate_level, @field_of_study, @school, @place_of_birth, @number_of_children, @visa_number, @work_permit_number, @visa_expiry_date, @work_permit_expiry_date, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_employee_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employee_type`(IN employee_type_id VARCHAR(50), IN employee_type VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_type_id = employee_type_id;
	SET @employee_type = employee_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_type (EMPLOYEE_TYPE_ID, EMPLOYEE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@employee_type_id, @employee_type, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_interface_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_interface_settings`(IN `interface_setting_id` INT, IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @interface_setting_id = interface_setting_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_interface_setting (INTERFACE_SETTING_ID, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@interface_setting_id, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_job_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_job_position`(IN job_position_id VARCHAR(50), IN job_position VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_position = job_position;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_job_position (JOB_POSITION_ID, JOB_POSITION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@job_position_id, @job_position, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_leave_allocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_leave_allocation`(IN leave_allocation_id VARCHAR(100), IN leave_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN validity_start_date DATE, IN validity_end_date DATE, IN duration DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;
	SET @leave_type_id = leave_type_id;
	SET @employee_id = employee_id;
	SET @validity_start_date = validity_start_date;
	SET @validity_end_date = validity_end_date;
	SET @duration = duration;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO leave_allocation (LEAVE_ALLOCATION_ID, LEAVE_TYPE_ID, EMPLOYEE_ID, VALIDITY_START_DATE, VALIDITY_END_DATE, DURATION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@leave_allocation_id, @leave_type_id, @employee_id, @validity_start_date, @validity_end_date, @duration, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_leave_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_leave_type`(IN leave_type_id VARCHAR(100), IN leave_type VARCHAR(100), IN paid_type VARCHAR(10), IN allocation_type VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @leave_type_id = leave_type_id;
	SET @leave_type = leave_type;
	SET @paid_type = paid_type;
	SET @allocation_type = allocation_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO leave_type (LEAVE_TYPE_ID, LEAVE_TYPE, PAID_TYPE, ALLOCATION_TYPE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@leave_type_id, @leave_type, @paid_type, @allocation_type, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_mail_configuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_mail_configuration`(IN `mail_configuration_id` INT, IN `mail_host` VARCHAR(100), IN `port` INT, IN `smtp_auth` INT(1), IN `smtp_auto_tls` INT(1), IN `username` VARCHAR(200), IN `password` VARCHAR(200), IN `mail_encryption` VARCHAR(20), IN `mail_from_name` VARCHAR(200), IN `mail_from_email` VARCHAR(200), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @mail_configuration_id = mail_configuration_id;
	SET @mail_host = mail_host;
	SET @port = port;
	SET @smtp_auth = smtp_auth;
	SET @smtp_auto_tls = smtp_auto_tls;
	SET @username = username;
	SET @password = password;
	SET @mail_encryption = mail_encryption;
	SET @mail_from_name = mail_from_name;
	SET @mail_from_email = mail_from_email;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;


	SET @query = 'INSERT INTO global_mail_configuration (MAIL_CONFIGURATION_ID, MAIL_HOST, PORT, SMTP_AUTH, SMTP_AUTO_TLS, USERNAME, PASSWORD, MAIL_ENCRYPTION, MAIL_FROM_NAME, MAIL_FROM_EMAIL, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@mail_configuration_id, @mail_host, @port, @smtp_auth, @smtp_auto_tls, @username, @password, @mail_encryption, @mail_from_name, @mail_from_email, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_notification_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notification_channel`(IN notification_setting_id INT, IN channel VARCHAR(20), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @channel = channel;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_channel (NOTIFICATION_SETTING_ID, CHANNEL, RECORD_LOG) VALUES(@notification_setting_id, @channel, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_notification_role_recipient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notification_role_recipient`(IN notification_setting_id INT, IN role_id VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @role_id = role_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_role_recipient (NOTIFICATION_SETTING_ID, ROLE_ID, RECORD_LOG) VALUES(@notification_setting_id, @role_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_notification_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notification_setting`(IN `notification_setting_id` INT, IN `notification_setting` VARCHAR(100), IN `notification_setting_description` VARCHAR(200), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_setting = notification_setting;
	SET @notification_setting_description = notification_setting_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_setting (NOTIFICATION_SETTING_ID, NOTIFICATION_SETTING, NOTIFICATION_SETTING_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@notification_setting_id, @notification_setting, @notification_setting_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_notification_template` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notification_template`(IN notification_setting_id INT, IN notification_title VARCHAR(500), IN notificate_message VARCHAR(500), IN system_link VARCHAR(200), IN email_link VARCHAR(200), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_title = notification_title;
	SET @notificate_message = notificate_message;
	SET @system_link = system_link;
	SET @email_link = email_link;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_template (NOTIFICATION_SETTING_ID, NOTIFICATION_TITLE, NOTIFICATION_MESSAGE, SYSTEM_LINK, EMAIL_LINK, RECORD_LOG) VALUES(@notification_setting_id, @notification_title, @notificate_message, @system_link, @email_link, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_notification_user_account_recipient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notification_user_account_recipient`(IN notification_setting_id INT, IN username VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @username = username;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_user_account_recipient (NOTIFICATION_SETTING_ID, USERNAME, RECORD_LOG) VALUES(@notification_setting_id, @username, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_permission`(IN permission_id INT, IN policy_id INT, IN permission VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @permission_id = permission_id;
	SET @policy_id = policy_id;
	SET @permission = permission;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_permission (PERMISSION_ID, POLICY_ID, PERMISSION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@permission_id, @policy_id, @permission, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_permission_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_permission_role`(IN role_id VARCHAR(100), IN permission_id INT, IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @permission_id = permission_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role_permission (ROLE_ID, PERMISSION_ID, RECORD_LOG) VALUES (@role_id, @permission_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_policy`(IN policy_id INT, IN policy VARCHAR(100), IN policy_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @policy_id = policy_id;
	SET @policy = policy;
	SET @policy_description = policy_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_policy (POLICY_ID, POLICY, POLICY_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@policy_id, @policy, @policy_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_public_holiday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_public_holiday`(IN public_holiday_id VARCHAR(100), IN public_holiday VARCHAR(100), IN holiday_date DATE, IN holiday_type VARCHAR(50), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;
	SET @public_holiday = public_holiday;
	SET @holiday_date = holiday_date;
	SET @holiday_type = holiday_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO public_holiday (PUBLIC_HOLIDAY_ID, PUBLIC_HOLIDAY, HOLIDAY_DATE, HOLIDAY_TYPE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@public_holiday_id, @public_holiday, @holiday_date, @holiday_type, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_public_holiday_work_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_public_holiday_work_location`(IN public_holiday_id VARCHAR(100), IN work_location_id VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;
	SET @work_location_id = work_location_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO public_holiday_work_location (PUBLIC_HOLIDAY_ID, WORK_LOCATION_ID, RECORD_LOG) VALUES(@public_holiday_id, @work_location_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_role`(IN role_id VARCHAR(100), IN role VARCHAR(100), IN role_description VARCHAR(100), IN transaction_log_id VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @role = role;
	SET @role_description = role_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role (ROLE_ID, ROLE, ROLE_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@role_id, @role, @role_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_state`(IN state_id INT, IN state_name VARCHAR(100), IN country_id INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @state_id = state_id;
	SET @state_name = state_name;
	SET @country_id = country_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_state (STATE_ID, STATE_NAME, COUNTRY_ID, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@state_id, @state_name, @country_id, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_system_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_system_code`(IN system_type VARCHAR(100), IN system_code VARCHAR(100), IN system_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;
	SET @system_description = system_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_system_code (SYSTEM_TYPE, SYSTEM_CODE, SYSTEM_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@system_type, @system_code, @system_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_system_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_system_notification`(IN notification_id INT, IN notification_from VARCHAR(100), IN notification_to VARCHAR(100), IN notification_title VARCHAR(200), IN notification VARCHAR(1000), IN link VARCHAR(500), IN notification_date DATETIME, IN record_log VARCHAR(100))
BEGIN
	SET @notification_id = notification_id;
	SET @notification_from = notification_from;
	SET @notification_to = notification_to;
	SET @notification_title = notification_title;
	SET @notification = notification;
	SET @link = link;
	SET @notification_date = notification_date;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification (NOTIFICATION_ID, NOTIFICATION_FROM, NOTIFICATION_TO, STATUS, NOTIFICATION_TITLE, NOTIFICATION, LINK, NOTIFICATION_DATE, RECORD_LOG) VALUES(@notification_id, @notification_from, @notification_to, "0", @notification_title, @notification, @link, @notification_date, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_system_parameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_system_parameter`(IN `parameter_id` INT, IN `parameter` VARCHAR(100), IN `parameter_description` VARCHAR(100), IN `extension` VARCHAR(10), IN `parameter_number` INT, IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter = parameter;
	SET @parameter_description = parameter_description;
	SET @extension = extension;
	SET @parameter_number = parameter_number;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@parameter_id, @parameter, @parameter_description, @extension, @parameter_number, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_time_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_time_in`(IN attendance_id VARCHAR(100), IN employee_id VARCHAR(100), IN time_in DATETIME, IN time_in_location VARCHAR(100), IN time_in_ip_address VARCHAR(20), IN time_in_by VARCHAR(100), IN time_in_behavior VARCHAR(20), IN time_in_note VARCHAR(200), IN late DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;
	SET @employee_id = employee_id;
	SET @time_in = time_in;
	SET @time_in_location = time_in_location;
	SET @time_in_ip_address = time_in_ip_address;
	SET @time_in_by = time_in_by;
	SET @time_in_behavior = time_in_behavior;
	SET @time_in_note = time_in_note;
	SET @late = late;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO attendance_record (ATTENDANCE_ID, EMPLOYEE_ID, TIME_IN, TIME_IN_LOCATION, TIME_IN_IP_ADDRESS, TIME_IN_BY, TIME_IN_BEHAVIOR, TIME_IN_NOTE, LATE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@attendance_id, @employee_id, @time_in, @time_in_location, @time_in_ip_address, @time_in_by, @time_in_behavior, @time_in_note, @late, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_transaction_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_transaction_log`(IN transaction_log_id VARCHAR(100), IN username VARCHAR(50), log_type VARCHAR(100), log_date DATETIME, log VARCHAR(4000))
BEGIN
	SET @transaction_log_id = transaction_log_id;
	SET @username = username;
	SET @log_type = log_type;
	SET @log_date = log_date;
	SET @log = log;

	SET @query = 'INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES(@transaction_log_id, @username, @log_type, @log_date, @log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_upload_file_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_upload_file_type`(IN upload_setting_id INT(50), IN file_type VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @file_type = file_type;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_upload_file_type (UPLOAD_SETTING_ID, FILE_TYPE, RECORD_LOG) VALUES(@upload_setting_id, @file_type, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_upload_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_upload_setting`(IN upload_setting_id INT(50), IN upload_setting VARCHAR(200), IN description VARCHAR(200), IN max_file_size DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @upload_setting = upload_setting;
	SET @description = description;
	SET @max_file_size = max_file_size;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_upload_setting (UPLOAD_SETTING_ID, UPLOAD_SETTING, DESCRIPTION, MAX_FILE_SIZE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@upload_setting_id, @upload_setting, @description, @max_file_size, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_account`(IN username VARCHAR(50), IN password VARCHAR(200), IN file_as VARCHAR (300), IN password_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @password = password;
	SET @file_as = file_as;
	SET @password_expiry_date = password_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_user_account (USERNAME, PASSWORD, FILE_AS, USER_STATUS, PASSWORD_EXPIRY_DATE, FAILED_LOGIN, LAST_FAILED_LOGIN, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@username, @password, @file_as, "ACTIVE", @password_expiry_date, 0, null, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user_account_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_account_role`(IN username VARCHAR(50), IN role_id VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @role_id = role_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role_user_account (ROLE_ID, USERNAME, RECORD_LOG) VALUES(@role_id, @username, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_working_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_working_hours`(IN working_hours_id VARCHAR(50), IN working_hours VARCHAR(100), IN schedule_type VARCHAR(20), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @working_hours_id = working_hours_id;
	SET @working_hours = working_hours;
	SET @schedule_type = schedule_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_working_hours (WORKING_HOURS_ID, WORKING_HOURS, SCHEDULE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@working_hours_id, @working_hours, @schedule_type, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_working_hours_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_working_hours_schedule`(IN working_hours_id VARCHAR(50), IN start_date DATE, IN end_date DATE, IN monday_morning_work_from TIME, IN monday_morning_work_to TIME, IN monday_afternoon_work_from TIME, IN monday_afternoon_work_to TIME, IN tuesday_morning_work_from TIME, IN tuesday_morning_work_to TIME, IN tuesday_afternoon_work_from TIME, IN tuesday_afternoon_work_to TIME, IN wednesday_morning_work_from TIME, IN wednesday_morning_work_to TIME, IN wednesday_afternoon_work_from TIME, IN wednesday_afternoon_work_to TIME, IN thursday_morning_work_from TIME, IN thursday_morning_work_to TIME, IN thursday_afternoon_work_from TIME, IN thursday_afternoon_work_to TIME, IN friday_morning_work_from TIME, IN friday_morning_work_to TIME, IN friday_afternoon_work_from TIME, IN friday_afternoon_work_to TIME, IN saturday_morning_work_from TIME, IN saturday_morning_work_to TIME, IN saturday_afternoon_work_from TIME, IN saturday_afternoon_work_to TIME, IN sunday_morning_work_from TIME, IN sunday_morning_work_to TIME, IN sunday_afternoon_work_from TIME, IN sunday_afternoon_work_to TIME, IN record_log VARCHAR(100))
BEGIN
	SET @working_hours_id = working_hours_id;
	SET @start_date = start_date;
	SET @end_date = end_date;
	SET @monday_morning_work_from = monday_morning_work_from;
	SET @monday_morning_work_to = monday_morning_work_to;
	SET @monday_afternoon_work_from = monday_afternoon_work_from;
	SET @monday_afternoon_work_to = monday_afternoon_work_to;
	SET @tuesday_morning_work_from = tuesday_morning_work_from;
	SET @tuesday_morning_work_to = tuesday_morning_work_to;
	SET @tuesday_afternoon_work_from = tuesday_afternoon_work_from;
	SET @tuesday_afternoon_work_to = tuesday_afternoon_work_to;
	SET @wednesday_morning_work_from = wednesday_morning_work_from;
	SET @wednesday_morning_work_to = wednesday_morning_work_to;
	SET @wednesday_afternoon_work_from = wednesday_afternoon_work_from;
	SET @wednesday_afternoon_work_to = wednesday_afternoon_work_to;
	SET @thursday_morning_work_from = thursday_morning_work_from;
	SET @thursday_morning_work_to = thursday_morning_work_to;
	SET @thursday_afternoon_work_from = thursday_afternoon_work_from;
	SET @thursday_afternoon_work_to = thursday_afternoon_work_to;
	SET @friday_morning_work_from = friday_morning_work_from;
	SET @friday_morning_work_to = friday_morning_work_to;
	SET @friday_afternoon_work_from = friday_afternoon_work_from;
	SET @friday_afternoon_work_to = friday_afternoon_work_to;
	SET @saturday_morning_work_from = saturday_morning_work_from;
	SET @saturday_morning_work_to = saturday_morning_work_to;
	SET @saturday_afternoon_work_from = saturday_afternoon_work_from;
	SET @saturday_afternoon_work_to = saturday_afternoon_work_to;
	SET @sunday_morning_work_from = sunday_morning_work_from;
	SET @sunday_morning_work_to = sunday_morning_work_to;
	SET @sunday_afternoon_work_from = sunday_afternoon_work_from;
	SET @sunday_afternoon_work_to = sunday_afternoon_work_to;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_working_hours_schedule (WORKING_HOURS_ID, START_DATE, END_DATE, MONDAY_MORNING_WORK_FROM, MONDAY_MORNING_WORK_TO, MONDAY_AFTERNOON_WORK_FROM, MONDAY_AFTERNOON_WORK_TO, TUESDAY_MORNING_WORK_FROM, TUESDAY_MORNING_WORK_TO, TUESDAY_AFTERNOON_WORK_FROM, TUESDAY_AFTERNOON_WORK_TO, WEDNESDAY_MORNING_WORK_FROM, WEDNESDAY_MORNING_WORK_TO, WEDNESDAY_AFTERNOON_WORK_FROM, WEDNESDAY_AFTERNOON_WORK_TO, THURSDAY_MORNING_WORK_FROM, THURSDAY_MORNING_WORK_TO, THURSDAY_AFTERNOON_WORK_FROM, THURSDAY_AFTERNOON_WORK_TO, FRIDAY_MORNING_WORK_FROM, FRIDAY_MORNING_WORK_TO, FRIDAY_AFTERNOON_WORK_FROM, FRIDAY_AFTERNOON_WORK_TO, SATURDAY_MORNING_WORK_FROM, SATURDAY_MORNING_WORK_TO, SATURDAY_AFTERNOON_WORK_FROM, SATURDAY_AFTERNOON_WORK_TO, SUNDAY_MORNING_WORK_FROM, SUNDAY_MORNING_WORK_TO, SUNDAY_AFTERNOON_WORK_FROM, SUNDAY_AFTERNOON_WORK_TO, RECORD_LOG) VALUES(@working_hours_id, @start_date, @end_date, @monday_morning_work_from, @monday_morning_work_to, @monday_afternoon_work_from, @monday_afternoon_work_to, @tuesday_morning_work_from, @tuesday_morning_work_to, @tuesday_afternoon_work_from, @tuesday_afternoon_work_to, @wednesday_morning_work_from, @wednesday_morning_work_to, @wednesday_afternoon_work_from, @wednesday_afternoon_work_to, @thursday_morning_work_from, @thursday_morning_work_to, @thursday_afternoon_work_from, @thursday_afternoon_work_to,  @friday_morning_work_from, @friday_morning_work_to, @friday_afternoon_work_from, @friday_afternoon_work_to, @saturday_morning_work_from, @saturday_morning_work_to, @saturday_afternoon_work_from, @saturday_afternoon_work_to, @sunday_morning_work_from, @sunday_morning_work_to, @sunday_afternoon_work_from, @sunday_afternoon_work_to, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_work_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_work_location`(IN work_location_id VARCHAR(50), IN work_location VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @work_location_id = work_location_id;
	SET @work_location = work_location;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_work_location (WORK_LOCATION_ID, WORK_LOCATION, EMAIL, TELEPHONE, MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@work_location_id, @work_location, @email, @telephone, @mobile, @street_1, @street_2, @country_id, @state_id, @city, @zip_code, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_zoom_integration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_zoom_integration`(IN zoom_integration_id INT, IN api_key VARCHAR(1000), IN api_secret VARCHAR(1000), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @zoom_integration_id = zoom_integration_id;
	SET @api_key = api_key;
	SET @api_secret = api_secret;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_zoom_integration (ZOOM_INTEGRATION_ID, API_KEY, API_SECRET, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@zoom_integration_id, @api_key, @api_secret, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_approval_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_approval_type`(IN approval_type_id VARCHAR(100), IN approval_type VARCHAR(100), IN approval_type_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @approval_type = approval_type;
	SET @approval_type_description = approval_type_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE approval_type SET APPROVAL_TYPE = @approval_type, APPROVAL_TYPE_DESCRIPTION = @approval_type_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_approval_type_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_approval_type_status`(IN approval_type_id VARCHAR(100), IN status VARCHAR(10), IN record_log VARCHAR(100))
BEGIN
	SET @approval_type_id = approval_type_id;
	SET @status = status;
	SET @record_log = record_log;

	SET @query = 'UPDATE approval_type SET STATUS = @status, RECORD_LOG = @record_log WHERE APPROVAL_TYPE_ID = @approval_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance`(IN attendance_id VARCHAR(100), IN time_in DATETIME, IN time_in_ip_address VARCHAR(20), IN time_in_by VARCHAR(100), IN time_in_behavior VARCHAR(20), IN time_out DATETIME, IN time_out_ip_address VARCHAR(20), IN time_out_by VARCHAR(100), IN time_out_behavior VARCHAR(20), IN late DOUBLE, IN early_leaving DOUBLE, IN overtime DOUBLE, IN total_hours DOUBLE, IN remarks VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;
	SET @time_in = time_in;
	SET @time_in_ip_address = time_in_ip_address;
	SET @time_in_by = time_in_by;
	SET @time_in_behavior = time_in_behavior;
	SET @time_out = time_out;
	SET @time_out_ip_address = time_out_ip_address;
	SET @time_out_by = time_out_by;
	SET @time_out_behavior = time_out_behavior;
	SET @late = late;
	SET @early_leaving = early_leaving;
	SET @overtime = overtime;
	SET @total_hours = total_hours;
	SET @remarks = remarks;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_record SET TIME_IN = @time_in, TIME_IN_IP_ADDRESS = @time_in_ip_address, TIME_IN_BY = @time_in_by, TIME_IN_BEHAVIOR = @time_in_behavior, TIME_OUT = @time_out, TIME_OUT_IP_ADDRESS = @time_out_ip_address, TIME_OUT_BY = @time_out_by, TIME_OUT_BEHAVIOR = @time_out_behavior, LATE = @late, EARLY_LEAVING = @early_leaving, OVERTIME = @overtime, TOTAL_WORKING_HOURS = @total_hours, REMARKS = @remarks, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ATTENDANCE_ID = @attendance_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_adjustment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_adjustment`(IN adjustment_id VARCHAR(100), IN time_in DATETIME, IN time_out DATETIME, IN reason VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;
	SET @time_in = time_in;
	SET @time_out = time_out;
	SET @reason = reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_adjustment SET TIME_IN = @time_in, TIME_OUT = @time_out, REASON = @reason, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ADJUSTMENT_ID = @adjustment_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_adjustment_attachment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_adjustment_attachment`(IN adjustment_id VARCHAR(100), IN attachment VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;
	SET @attachment = attachment;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_adjustment SET ATTACHMENT = @attachment, RECORD_LOG = @record_log WHERE ADJUSTMENT_ID = @adjustment_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_adjustment_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_adjustment_status`(IN adjustment_id VARCHAR(100), IN status VARCHAR(10), IN sanction INT(1), IN decision_remarks VARCHAR(500), IN decision_date DATETIME, IN decision_by VARCHAR(50), IN transaction_log_id VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @adjustment_id = adjustment_id;
	SET @status = status;
	SET @sanction = sanction;
	SET @decision_remarks = decision_remarks;
	SET @decision_date = decision_date;
	SET @decision_by = decision_by;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @status = 'APV' OR @status = 'REJ' OR @status = 'CAN' THEN
		SET @query = 'UPDATE attendance_adjustment SET STATUS = @status, SANCTION = @sanction, DECISION_REMARKS = @decision_remarks, DECISION_DATE = @decision_date, DECISION_BY = @decision_by, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ADJUSTMENT_ID = @adjustment_id';
	ELSEIF @status = 'REC' THEN
		SET @query = 'UPDATE attendance_adjustment SET STATUS = @status, RECOMMENDATION_DATE = @decision_date, RECOMMENDATION_BY = @decision_by, RECOMMENDATION_REMARKS = @decision_remarks, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ADJUSTMENT_ID = @adjustment_id';
	ELSE
		SET @query = 'UPDATE attendance_adjustment SET STATUS = @status, FOR_RECOMMENDATION_DATE = @decision_date, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ADJUSTMENT_ID = @adjustment_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_creation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_creation`(IN creation_id VARCHAR(100), IN time_in DATETIME, IN time_out DATETIME, IN reason VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;
	SET @time_in = time_in;
	SET @time_out = time_out;
	SET @reason = reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_creation SET TIME_IN = @time_in, TIME_OUT = @time_out, REASON = @reason, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE CREATION_ID = @creation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_creation_attachment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_creation_attachment`(IN creation_id VARCHAR(100), IN attachment VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;
	SET @attachment = attachment;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_creation SET ATTACHMENT = @attachment, RECORD_LOG = @record_log WHERE CREATION_ID = @creation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_creation_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_creation_status`(IN creation_id VARCHAR(100), IN status VARCHAR(10), IN sanction INT(1), IN decision_remarks VARCHAR(500), IN decision_date DATETIME, IN decision_by VARCHAR(50), IN transaction_log_id VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @creation_id = creation_id;
	SET @status = status;
	SET @sanction = sanction;
	SET @decision_remarks = decision_remarks;
	SET @decision_date = decision_date;
	SET @decision_by = decision_by;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @status = 'APV' OR @status = 'REJ' OR @status = 'CAN' THEN
		SET @query = 'UPDATE attendance_creation SET STATUS = @status, SANCTION = @sanction, DECISION_REMARKS = @decision_remarks, DECISION_DATE = @decision_date, DECISION_BY = @decision_by, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE CREATION_ID = @creation_id';
	ELSEIF @status = 'REC' THEN
		SET @query = 'UPDATE attendance_creation SET STATUS = @status, RECOMMENDATION_DATE = @decision_date, RECOMMENDATION_BY = @decision_by, RECOMMENDATION_REMARKS = @decision_remarks, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE CREATION_ID = @creation_id';
	ELSE
		SET @query = 'UPDATE attendance_creation SET STATUS = @status, FOR_RECOMMENDATION_DATE = @decision_date, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE CREATION_ID = @creation_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_attendance_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_attendance_setting`(IN attendance_setting_id VARCHAR(50), IN maximum_attendance INT, IN late_grace_period INT, IN time_out_interval INT, IN late_policy INT, IN early_leaving_policy INT, IN overtime_policy INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_setting_id = attendance_setting_id;
	SET @maximum_attendance = maximum_attendance;
	SET @late_grace_period = late_grace_period;
	SET @time_out_interval = time_out_interval;
	SET @late_policy = late_policy;
	SET @early_leaving_policy = early_leaving_policy;
	SET @overtime_policy = overtime_policy;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_setting SET MAX_ATTENDANCE = @maximum_attendance, LATE_GRACE_PERIOD = @late_grace_period, TIME_OUT_INTERVAL = @time_out_interval, LATE_POLICY = @late_policy, EARLY_LEAVING_POLICY = @early_leaving_policy, OVERTIME_POLICY = @overtime_policy, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ATTENDANCE_SETTING_ID = @attendance_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_company`(IN company_id VARCHAR(50), IN company_name VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN website VARCHAR(100), IN tax_id VARCHAR(100), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_name = company_name;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @website = website;
	SET @tax_id = tax_id;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_company SET COMPANY_NAME = @company_name, EMAIL = @email, TELEPHONE = @telephone, MOBILE = @mobile, WEBSITE = @website, TAX_ID = @tax_id, STREET_1 = @street_1, STREET_2 = @street_2, COUNTRY_ID = @country_id, STATE_ID = @state_id, CITY = @city, ZIP_CODE = @zip_code, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_company_logo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_company_logo`(IN `company_id` VARCHAR(50), IN `company_logo` VARCHAR(500), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_logo = company_logo;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_company SET COMPANY_LOGO = @company_logo, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_country`(IN country_id INT, IN country_name VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @country_id = country_id;
	SET @country_name = country_name;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_country SET COUNTRY_NAME = @country_name, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_department`(IN department_id VARCHAR(50), IN department VARCHAR(100), IN parent_department VARCHAR(50), IN manager VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @department_id = department_id;
	SET @department = department;
	SET @parent_department = parent_department;
	SET @manager = manager;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_department SET DEPARTMENT = @department, PARENT_DEPARTMENT = @parent_department, MANAGER = @manager, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_departure_reason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_departure_reason`(IN departure_reason_id VARCHAR(50), IN departure_reason VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @departure_reason_id = departure_reason_id;
	SET @departure_reason = departure_reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_departure_reason SET DEPARTURE_REASON = @departure_reason, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee`(IN employee_id VARCHAR(100), IN badge_id VARCHAR(100), IN file_as VARCHAR(350), IN first_name VARCHAR(100), IN middle_name VARCHAR(100), IN last_name VARCHAR(100), IN suffix VARCHAR(5), IN company VARCHAR(50), IN job_position VARCHAR(50), IN department VARCHAR(50), IN work_location VARCHAR(50), IN working_hours VARCHAR(50), IN manager VARCHAR(100), IN coach VARCHAR(100), IN employee_type VARCHAR(100), IN permanency_date DATE, IN onboard_date DATE, IN work_email VARCHAR(50), IN work_telephone VARCHAR(50), IN work_mobile VARCHAR(50), IN sss VARCHAR(20), IN tin VARCHAR(20), IN pagibig VARCHAR(20), IN philhealth VARCHAR(20), IN bank_account_number VARCHAR(100), IN home_work_distance DOUBLE, IN personal_email VARCHAR(50), IN personal_telephone VARCHAR(20), IN personal_mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN marital_status VARCHAR(20), IN spouse_name VARCHAR(500), IN spouse_birthday DATE, IN emergency_contact VARCHAR(500), IN emergency_phone VARCHAR(20), IN nationality INT, IN identification_number VARCHAR(100), IN passport_number VARCHAR(100), IN gender VARCHAR(20), IN birthday DATE, IN certificate_level VARCHAR(20), IN field_of_study VARCHAR(200), IN school VARCHAR(200), IN place_of_birth VARCHAR(500), IN number_of_children INT, IN visa_number VARCHAR(100), IN work_permit_number VARCHAR(100), IN visa_expiry_date DATE, IN work_permit_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @badge_id = badge_id;
	SET @file_as = file_as;
	SET @first_name = first_name;
	SET @middle_name = middle_name;
	SET @last_name = last_name;
	SET @suffix = suffix;
	SET @company = company;
	SET @job_position = job_position;
	SET @department = department;
	SET @work_location = work_location;
	SET @working_hours = working_hours;
	SET @manager = manager;
	SET @coach = coach;
	SET @employee_type = employee_type;
	SET @permanency_date = permanency_date;
	SET @onboard_date = onboard_date;
	SET @work_email = work_email;
	SET @work_telephone = work_telephone;
	SET @work_mobile = work_mobile;
	SET @sss = sss;
	SET @tin = tin;
	SET @pagibig = pagibig;
	SET @philhealth = philhealth;
	SET @bank_account_number = bank_account_number;
	SET @home_work_distance = home_work_distance;
	SET @personal_email = personal_email;
	SET @personal_telephone = personal_telephone;
	SET @personal_mobile = personal_mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state = state;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @marital_status = marital_status;
	SET @spouse_name = spouse_name;
	SET @spouse_birthday = spouse_birthday;
	SET @emergency_contact = emergency_contact;
	SET @emergency_phone = emergency_phone;
	SET @nationality = nationality;
	SET @identification_number = identification_number;
	SET @passport_number = passport_number;
	SET @gender = gender;
	SET @birthday = birthday;
	SET @certificate_level = certificate_level;
	SET @field_of_study = field_of_study;
	SET @school = school;
	SET @place_of_birth = place_of_birth;
	SET @number_of_children = number_of_children;
	SET @visa_number = visa_number;
	SET @work_permit_number = work_permit_number;
	SET @visa_expiry_date = visa_expiry_date;
	SET @work_permit_expiry_date = work_permit_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_details SET BADGE_ID = @badge_id, FILE_AS = @file_as, FIRST_NAME = @first_name, MIDDLE_NAME = @middle_name, LAST_NAME = @last_name, SUFFIX = @suffix, COMPANY = @company, JOB_POSITION = @job_position, DEPARTMENT = @department, WORK_LOCATION = @work_location, WORKING_HOURS = @working_hours, MANAGER = @manager, COACH = @coach, EMPLOYEE_TYPE = @employee_type, PERMANENCY_DATE = @permanency_date, ONBOARD_DATE = @onboard_date, WORK_EMAIL = @work_email, WORK_TELEPHONE = @work_telephone, WORK_MOBILE = @work_mobile, SSS = @sss, TIN = @tin, PAGIBIG = @pagibig, PHILHEALTH = @philhealth, BANK_ACCOUNT_NUMBER = @bank_account_number, HOME_WORK_DISTANCE = @home_work_distance, PERSONAL_EMAIL = @personal_email, PERSONAL_TELEPHONE = @personal_telephone, PERSONAL_MOBILE = @personal_mobile, STREET_1 = @street_1, STREET_2 = @street_2, COUNTRY_ID = @country_id, STATE_ID = @state, CITY = @city, ZIP_CODE = @zip_code, MARITAL_STATUS = @marital_status, SPOUSE_NAME = @spouse_name, SPOUSE_BIRTHDAY = @spouse_birthday, EMERGENCY_CONTACT = @emergency_contact, EMERGENCY_PHONE = @emergency_phone, NATIONALITY = @nationality, IDENTIFICATION_NUMBER = @identification_number, PASSPORT_NUMBER = @passport_number, GENDER = @gender, BIRTHDAY = @birthday, CERTIFICATE_LEVEL = @certificate_level, FIELD_OF_STUDY = @field_of_study, SCHOOL = @school, PLACE_OF_BIRTH = @place_of_birth, NUMBER_OF_CHILDREN = @number_of_children, VISA_NUMBER = @visa_number, WORK_PERMIT_NUMBER = @work_permit_number, VISA_EXPIRY_DATE = @visa_expiry_date, WORK_PERMIT_EXPIRY_DATE = @work_permit_expiry_date, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee_image`(IN employee_id VARCHAR(100), IN employee_image VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @employee_image = employee_image;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_details SET EMPLOYEE_IMAGE = @employee_image, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee_related_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee_related_user`(IN employee_id VARCHAR(100), IN user_code VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @user_code = user_code;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_details SET USERNAME = @user_code, RECORD_LOG = @record_log WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee_status`(IN employee_id VARCHAR(100), IN employee_status VARCHAR(100), IN offboard_date DATE, IN departure_reason VARCHAR(50), IN details_reason VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @employee_status = employee_status;
	SET @offboard_date = offboard_date;
	SET @departure_reason = departure_reason;
	SET @details_reason = details_reason;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_details SET EMPLOYEE_STATUS = @employee_status, OFFBOARD_DATE = @offboard_date, DEPARTURE_REASON = @departure_reason, DETAILED_REASON = @details_reason, RECORD_LOG = @record_log WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee_type`(IN employee_type_id VARCHAR(50), IN employee_type VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_type_id = employee_type_id;
	SET @employee_type = employee_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_type SET EMPLOYEE_TYPE = @employee_type, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee_working_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee_working_hours`(IN employee_id VARCHAR(100), IN working_hours_id VARCHAR(50))
BEGIN
	SET @employee_id = employee_id;
	SET @working_hours_id = working_hours_id;

	SET @query = 'UPDATE employee_details SET WORKING_HOURS = @working_hours_id WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_interface_settings_images` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_interface_settings_images`(IN `interface_setting_id` INT, IN `file_path` VARCHAR(500), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100), IN `request_type` VARCHAR(20))
BEGIN
	SET @interface_setting_id = interface_setting_id;
	SET @file_path = file_path;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;
	SET @request_type = request_type;

	IF @request_type = 'login background' THEN
		SET @query = 'UPDATE global_interface_setting SET LOGIN_BACKGROUND = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'login logo' THEN
		SET @query = 'UPDATE global_interface_setting SET LOGIN_LOGO = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'menu logo' THEN
		SET @query = 'UPDATE global_interface_setting SET MENU_LOGO = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'menu icon' THEN
		SET @query = 'UPDATE global_interface_setting SET MENU_ICON = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSE
		SET @query = 'UPDATE global_interface_setting SET FAVICON = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_job_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_job_description`(IN job_position_id VARCHAR(50), IN job_description VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_description = job_description;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_job_position SET JOB_DESCRIPTION = @job_description, RECORD_LOG = @record_log WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_job_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_job_position`(IN job_position_id VARCHAR(50), IN job_position VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_position = job_position;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_job_position SET JOB_POSITION = @job_position, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_leave_allocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_leave_allocation`(IN leave_allocation_id VARCHAR(100), IN leave_type_id VARCHAR(100), IN employee_id VARCHAR(100), IN validity_start_date DATE, IN validity_end_date DATE, IN duration DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @leave_allocation_id = leave_allocation_id;
	SET @leave_type_id = leave_type_id;
	SET @employee_id = employee_id;
	SET @validity_start_date = validity_start_date;
	SET @validity_end_date = validity_end_date;
	SET @duration = duration;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE leave_allocation SET LEAVE_TYPE_ID = @leave_type_id, EMPLOYEE_ID = @employee_id, VALIDITY_START_DATE = @validity_start_date, VALIDITY_END_DATE = @validity_end_date, DURATION = @duration, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE LEAVE_ALLOCATION_ID = @leave_allocation_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_leave_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_leave_type`(IN leave_type_id VARCHAR(100), IN leave_type VARCHAR(100), IN paid_type VARCHAR(10), IN allocation_type VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @leave_type_id = leave_type_id;
	SET @leave_type = leave_type;
	SET @paid_type = paid_type;
	SET @allocation_type = allocation_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE leave_type SET LEAVE_TYPE = @leave_type, PAID_TYPE = @paid_type, ALLOCATION_TYPE = @allocation_type, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE LEAVE_TYPE_ID = @leave_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_login_attempt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_login_attempt`(IN username VARCHAR(50), login_attemp INT(1), last_failed_attempt_date DATETIME)
BEGIN
	SET @username = username;
	SET @login_attemp = login_attemp;
	SET @last_failed_attempt_date = last_failed_attempt_date;

    IF @login_attemp > 0 THEN
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = @login_attemp, LAST_FAILED_LOGIN = @last_failed_attempt_date WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = @login_attemp WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_mail_configuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mail_configuration`(IN `mail_configuration_id` INT, IN `mail_host` VARCHAR(100), IN `port` INT, IN `smtp_auth` INT(1), IN `smtp_auto_tls` INT(1), IN `username` VARCHAR(200), IN `password` VARCHAR(200), IN `mail_encryption` VARCHAR(20), IN `mail_from_name` VARCHAR(200), IN `mail_from_email` VARCHAR(200), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @mail_configuration_id = mail_configuration_id;
	SET @mail_host = mail_host;
	SET @port = port;
	SET @smtp_auth = smtp_auth;
	SET @smtp_auto_tls = smtp_auto_tls;
	SET @username = username;
	SET @password = password;
	SET @mail_encryption = mail_encryption;
	SET @mail_from_name = mail_from_name;
	SET @mail_from_email = mail_from_email;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @password IS NULL OR @password = '' THEN
		SET @query = 'UPDATE global_mail_configuration SET MAIL_HOST = @mail_host, PORT = @port, SMTP_AUTH = @smtp_auth, SMTP_AUTO_TLS = @smtp_auto_tls, USERNAME = @username, MAIL_ENCRYPTION = @mail_encryption, MAIL_FROM_NAME = @mail_from_name, MAIL_FROM_EMAIL = @mail_from_email, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';
	ELSE
		SET @query = 'UPDATE global_mail_configuration SET MAIL_HOST = @mail_host, PORT = @port, SMTP_AUTH = @smtp_auth, SMTP_AUTO_TLS = @smtp_auto_tls, USERNAME = @username, PASSWORD = @password, MAIL_ENCRYPTION = @mail_encryption, MAIL_FROM_NAME = @mail_from_name, MAIL_FROM_EMAIL = @mail_from_email, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_notification_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notification_setting`(IN `notification_setting_id` INT, IN `notification_setting` VARCHAR(100), IN `notification_setting_description` VARCHAR(200), IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_setting = notification_setting;
	SET @notification_setting_description = notification_setting_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_notification_setting SET NOTIFICATION_SETTING = @notification_setting, NOTIFICATION_SETTING_DESCRIPTION = @notification_setting_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_notification_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notification_status`(IN employee_id VARCHAR(100), IN notification_id INT, IN status INT)
BEGIN
	SET @employee_id = employee_id;
	SET @status = status;
	SET @notification_id = notification_id;

	IF @status = 2 THEN
		SET @query = 'UPDATE global_notification SET STATUS = @status WHERE NOTIFICATION_TO = @employee_id AND STATUS = 0';
	ELSE
		SET @query = 'UPDATE global_notification SET STATUS = @status WHERE NOTIFICATION_TO = @employee_id AND NOTIFICATION_ID = @notification_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_notification_template` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notification_template`(IN notification_setting_id INT, IN notification_title VARCHAR(500), IN notificate_message VARCHAR(500), IN system_link VARCHAR(200), IN email_link VARCHAR(200), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_title = notification_title;
	SET @notificate_message = notificate_message;
	SET @system_link = system_link;
	SET @email_link = email_link;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_notification_template SET NOTIFICATION_TITLE = @notification_title, NOTIFICATION_MESSAGE = @notificate_message, SYSTEM_LINK = @system_link, EMAIL_LINK = @email_link, RECORD_LOG = @record_log WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_permission`(IN permission_id INT, IN policy_id INT, IN permission VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @permission_id = permission_id;
	SET @permission = permission;
	SET @policy_id = policy_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_permission SET POLICY_ID = @policy_id, PERMISSION = @permission, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_policy`(IN policy_id INT, IN policy VARCHAR(100), IN policy_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @policy_id = policy_id;
	SET @policy = policy;
	SET @policy_description = policy_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_policy SET POLICY = @policy, POLICY_DESCRIPTION = @policy_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_public_holiday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_public_holiday`(IN public_holiday_id VARCHAR(100), IN public_holiday VARCHAR(100), IN holiday_date DATE, IN holiday_type VARCHAR(50), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @public_holiday_id = public_holiday_id;
	SET @public_holiday = public_holiday;
	SET @holiday_date = holiday_date;
	SET @holiday_type = holiday_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE public_holiday SET PUBLIC_HOLIDAY = @public_holiday, HOLIDAY_DATE = @holiday_date, HOLIDAY_TYPE = @holiday_type, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE PUBLIC_HOLIDAY_ID = @public_holiday_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_role`(IN role_id VARCHAR(100), IN role VARCHAR(100), IN role_description VARCHAR(100), IN transaction_log_id VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @role = role;
	SET @role_description = role_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_role SET ROLE = @role, ROLE_DESCRIPTION = @role_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_state`(IN state_id INT, IN state_name VARCHAR(200), IN country_id INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @state_id = state_id;
	SET @state_name = state_name;
	SET @country_id = country_id;
	SET @transaction_log_id = transaction_log_id;

	SET @record_log = record_log;

	SET @query = 'UPDATE global_state SET STATE_NAME = @state_name, COUNTRY_ID = @country_id, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_system_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_system_code`(IN system_type VARCHAR(100), IN system_code VARCHAR(100), IN system_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;
	SET @system_description = system_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_code SET SYSTEM_DESCRIPTION = @system_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_system_parameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_system_parameter`(IN `parameter_id` INT, IN `parameter` VARCHAR(100), IN `parameter_description` VARCHAR(100), IN `extension` VARCHAR(10), IN `parameter_number` INT, IN `transaction_log_id` VARCHAR(100), IN `record_log` VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter = parameter;
	SET @parameter_description = parameter_description;
	SET @extension = extension;
	SET @parameter_number = parameter_number;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_parameters SET PARAMETER = @parameter, PARAMETER_DESCRIPTION = @parameter_description, PARAMETER_EXTENSION = @extension, PARAMETER_NUMBER = @parameter_number, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_system_parameter_value` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_system_parameter_value`(IN parameter_id INT, IN parameter_number INT, IN record_log VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter_number = parameter_number;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_parameters SET PARAMETER_NUMBER = @parameter_number, RECORD_LOG = @record_log WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_time_out` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_time_out`(IN attendance_id VARCHAR(100), IN time_out DATETIME, IN time_out_location VARCHAR(100), IN time_out_ip_address VARCHAR(20), IN time_out_by VARCHAR(100), IN time_out_behavior VARCHAR(20), IN time_out_note VARCHAR(200), IN early_leaving DOUBLE, IN overtime DOUBLE, IN total_hours DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @attendance_id = attendance_id;
	SET @time_out = time_out;
	SET @time_out_location = time_out_location;
	SET @time_out_ip_address = time_out_ip_address;
	SET @time_out_by = time_out_by;
	SET @time_out_behavior = time_out_behavior;
	SET @time_out_note = time_out_note;
	SET @early_leaving = early_leaving;
	SET @overtime = overtime;
	SET @total_hours = total_hours;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE attendance_record SET TIME_OUT = @time_out, TIME_OUT_LOCATION = @time_out_location, TIME_OUT_IP_ADDRESS = @time_out_ip_address, TIME_OUT_BY = @time_out_by, TIME_OUT_BEHAVIOR = @time_out_behavior, TIME_OUT_NOTE = @time_out_note, EARLY_LEAVING = @early_leaving, OVERTIME = @overtime, TOTAL_WORKING_HOURS = @total_hours, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ATTENDANCE_ID = @attendance_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_upload_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_upload_setting`(IN upload_setting_id INT(50), IN upload_setting VARCHAR(200), IN description VARCHAR(200), IN max_file_size DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @upload_setting = upload_setting;
	SET @description = description;
	SET @max_file_size = max_file_size;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_upload_setting SET UPLOAD_SETTING = @upload_setting, DESCRIPTION = @description, MAX_FILE_SIZE = @max_file_size, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_account`(IN username VARCHAR(50), IN password VARCHAR(200), IN file_as VARCHAR (300), IN password_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @password = password;
	SET @file_as = file_as;
	SET @password_expiry_date = password_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @password IS NULL OR @password = '' THEN
		SET @query = 'UPDATE global_user_account SET FILE_AS = @file_as, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET FILE_AS = @file_as, PASSWORD = @password, PASSWORD_EXPIRY_DATE = @password_expiry_date, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_account_lock_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_account_lock_status`(IN username VARCHAR(50), IN transaction_type VARCHAR(10), IN last_failed_login DATE, IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @transaction_type = transaction_type;
	SET @last_failed_login = last_failed_login;
	SET @record_log = record_log;

	IF @transaction_type = 'unlock' THEN
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = 0, LAST_FAILED_LOGIN = null, RECORD_LOG = @record_log WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = 5, LAST_FAILED_LOGIN = @last_failed_login, RECORD_LOG = @record_log WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_account_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_account_password`(IN username VARCHAR(50), password VARCHAR(200), password_expiry_date DATE)
BEGIN
	SET @username = username;
	SET @password = password;
	SET @password_expiry_date = password_expiry_date;

	SET @query = 'UPDATE global_user_account SET PASSWORD = @password, PASSWORD_EXPIRY_DATE = @password_expiry_date WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_account_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_account_status`(IN username VARCHAR(50), IN user_status VARCHAR(10), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @user_status = user_status;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_user_account SET USER_STATUS = @user_status, RECORD_LOG = @record_log WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_working_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_working_hours`(IN working_hours_id VARCHAR(50), IN working_hours VARCHAR(100), IN schedule_type VARCHAR(20), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @working_hours_id = working_hours_id;
	SET @working_hours = working_hours;
	SET @schedule_type = schedule_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_working_hours SET WORKING_HOURS = @working_hours, SCHEDULE_TYPE = @schedule_type, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_working_hours_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_working_hours_schedule`(IN working_hours_id VARCHAR(50), IN start_date DATE, IN end_date DATE, IN monday_morning_work_from TIME, IN monday_morning_work_to TIME, IN monday_afternoon_work_from TIME, IN monday_afternoon_work_to TIME, IN tuesday_morning_work_from TIME, IN tuesday_morning_work_to TIME, IN tuesday_afternoon_work_from TIME, IN tuesday_afternoon_work_to TIME, IN wednesday_morning_work_from TIME, IN wednesday_morning_work_to TIME, IN wednesday_afternoon_work_from TIME, IN wednesday_afternoon_work_to TIME, IN thursday_morning_work_from TIME, IN thursday_morning_work_to TIME, IN thursday_afternoon_work_from TIME, IN thursday_afternoon_work_to TIME, IN friday_morning_work_from TIME, IN friday_morning_work_to TIME, IN friday_afternoon_work_from TIME, IN friday_afternoon_work_to TIME, IN saturday_morning_work_from TIME, IN saturday_morning_work_to TIME, IN saturday_afternoon_work_from TIME, IN saturday_afternoon_work_to TIME, IN sunday_morning_work_from TIME, IN sunday_morning_work_to TIME, IN sunday_afternoon_work_from TIME, IN sunday_afternoon_work_to TIME, IN record_log VARCHAR(100))
BEGIN
	SET @working_hours_id = working_hours_id;
	SET @start_date = start_date;
	SET @end_date = end_date;
	SET @monday_morning_work_from = monday_morning_work_from;
	SET @monday_morning_work_to = monday_morning_work_to;
	SET @monday_afternoon_work_from = monday_afternoon_work_from;
	SET @monday_afternoon_work_to = monday_afternoon_work_to;
	SET @tuesday_morning_work_from = tuesday_morning_work_from;
	SET @tuesday_morning_work_to = tuesday_morning_work_to;
	SET @tuesday_afternoon_work_from = tuesday_afternoon_work_from;
	SET @tuesday_afternoon_work_to = tuesday_afternoon_work_to;
	SET @wednesday_morning_work_from = wednesday_morning_work_from;
	SET @wednesday_morning_work_to = wednesday_morning_work_to;
	SET @wednesday_afternoon_work_from = wednesday_afternoon_work_from;
	SET @wednesday_afternoon_work_to = wednesday_afternoon_work_to;
	SET @thursday_morning_work_from = thursday_morning_work_from;
	SET @thursday_morning_work_to = thursday_morning_work_to;
	SET @thursday_afternoon_work_from = thursday_afternoon_work_from;
	SET @thursday_afternoon_work_to = thursday_afternoon_work_to;
	SET @friday_morning_work_from = friday_morning_work_from;
	SET @friday_morning_work_to = friday_morning_work_to;
	SET @friday_afternoon_work_from = friday_afternoon_work_from;
	SET @friday_afternoon_work_to = friday_afternoon_work_to;
	SET @saturday_morning_work_from = saturday_morning_work_from;
	SET @saturday_morning_work_to = saturday_morning_work_to;
	SET @saturday_afternoon_work_from = saturday_afternoon_work_from;
	SET @saturday_afternoon_work_to = saturday_afternoon_work_to;
	SET @sunday_morning_work_from = sunday_morning_work_from;
	SET @sunday_morning_work_to = sunday_morning_work_to;
	SET @sunday_afternoon_work_from = sunday_afternoon_work_from;
	SET @sunday_afternoon_work_to = sunday_afternoon_work_to;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_working_hours_schedule SET START_DATE = @start_date, END_DATE = @end_date, MONDAY_MORNING_WORK_FROM = @monday_morning_work_from, MONDAY_MORNING_WORK_TO = @monday_morning_work_to, MONDAY_AFTERNOON_WORK_FROM = @monday_afternoon_work_from, MONDAY_AFTERNOON_WORK_TO = @monday_afternoon_work_to, TUESDAY_MORNING_WORK_FROM = @tuesday_morning_work_from, TUESDAY_MORNING_WORK_TO = @tuesday_morning_work_to, TUESDAY_AFTERNOON_WORK_FROM = @tuesday_afternoon_work_from, TUESDAY_AFTERNOON_WORK_TO = @tuesday_afternoon_work_to, WEDNESDAY_MORNING_WORK_FROM = @wednesday_morning_work_from, WEDNESDAY_MORNING_WORK_TO = @wednesday_morning_work_to, WEDNESDAY_AFTERNOON_WORK_FROM = @wednesday_afternoon_work_from, WEDNESDAY_AFTERNOON_WORK_TO = @wednesday_afternoon_work_to, THURSDAY_MORNING_WORK_FROM = @thursday_morning_work_from, THURSDAY_MORNING_WORK_TO = @thursday_morning_work_to, THURSDAY_AFTERNOON_WORK_FROM = @thursday_afternoon_work_from, THURSDAY_AFTERNOON_WORK_TO = @thursday_afternoon_work_to, FRIDAY_MORNING_WORK_FROM = @friday_morning_work_from, FRIDAY_MORNING_WORK_TO = @friday_morning_work_to, FRIDAY_AFTERNOON_WORK_FROM = @friday_afternoon_work_from, FRIDAY_AFTERNOON_WORK_TO = @friday_afternoon_work_to, SATURDAY_MORNING_WORK_FROM = @saturday_morning_work_from, SATURDAY_MORNING_WORK_TO = @saturday_morning_work_to, SATURDAY_AFTERNOON_WORK_FROM = @saturday_afternoon_work_from, SATURDAY_AFTERNOON_WORK_TO = @saturday_afternoon_work_to, SUNDAY_MORNING_WORK_FROM = @sunday_morning_work_from, SUNDAY_MORNING_WORK_TO = @sunday_morning_work_to, SUNDAY_AFTERNOON_WORK_FROM = @sunday_afternoon_work_from, SUNDAY_AFTERNOON_WORK_TO = @sunday_afternoon_work_to, RECORD_LOG = @record_log WHERE WORKING_HOURS_ID = @working_hours_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_work_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_work_location`(IN work_location_id VARCHAR(50), IN work_location VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @work_location_id = work_location_id;
	SET @work_location = work_location;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_work_location SET WORK_LOCATION = @work_location, EMAIL = @email, TELEPHONE = @telephone, MOBILE = @mobile, STREET_1 = @street_1, STREET_2 = @street_2, COUNTRY_ID = @country_id, STATE_ID = @state_id, CITY = @city, ZIP_CODE = @zip_code, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_work_permit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_work_permit`(IN employee_id VARCHAR(100), IN work_permit VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_id = employee_id;
	SET @work_permit = work_permit;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_details SET WORK_PERMIT = @work_permit, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE EMPLOYEE_ID = @employee_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_zoom_integration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_zoom_integration`(IN zoom_integration_id INT, IN api_key VARCHAR(1000), IN api_secret VARCHAR(1000), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @zoom_integration_id = zoom_integration_id;
	SET @api_key = api_key;
	SET @api_secret = api_secret;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @api_secret IS NULL OR @api_secret = '' THEN
		SET @query = 'UPDATE global_zoom_integration SET API_KEY = @api_key, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';
	ELSE
		SET @query = 'UPDATE global_zoom_integration SET API_KEY = @api_key, API_SECRET = @api_secret, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';
    END IF;	

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-11 17:31:33
