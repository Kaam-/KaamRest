-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kaam
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `pkComment` int NOT NULL AUTO_INCREMENT,
  `fkUser` int DEFAULT NULL,
  `fkParent` int DEFAULT NULL,
  `CommentText` varchar(255) DEFAULT NULL,
  `ParentType` char(32) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`pkComment`),
  KEY `fkUser` (`fkUser`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `pkEvent` int NOT NULL AUTO_INCREMENT,
  `fkComment` int DEFAULT NULL,
  `fkUser` int DEFAULT NULL,
  `fkPublisher` int DEFAULT NULL,
  `EventText` varchar(255) DEFAULT NULL,
  `PublisherType` char(32) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  PRIMARY KEY (`pkEvent`),
  KEY `fkComment` (`fkComment`),
  KEY `fkUser` (`fkUser`),
  CONSTRAINT `Event_ibfk_2` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`),
  CONSTRAINT `Event_ibfk_1` FOREIGN KEY (`fkComment`) REFERENCES `Comments` (`pkComment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Friends`
--

DROP TABLE IF EXISTS `Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Friends` (
  `pkFriends` int NOT NULL AUTO_INCREMENT,
  `fk_askingUser` int DEFAULT NULL,
  `fk_receivingUser` int DEFAULT NULL,
  `b_accepted` int DEFAULT NULL,
  PRIMARY KEY (`pkFriends`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GoalTags`
--

DROP TABLE IF EXISTS `GoalTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoalTags` (
  `fkTag` int DEFAULT NULL,
  `fkGoal` int DEFAULT NULL,
  `fkUser` int DEFAULT NULL,
  KEY `fkTag` (`fkTag`),
  KEY `fkGoal` (`fkGoal`),
  CONSTRAINT `GoalTags_ibfk_2` FOREIGN KEY (`fkGoal`) REFERENCES `Goals` (`pkGoal`),
  CONSTRAINT `GoalTags_ibfk_1` FOREIGN KEY (`fkTag`) REFERENCES `Tags` (`pkTag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Goals`
--

DROP TABLE IF EXISTS `Goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goals` (
  `pkGoal` int NOT NULL AUTO_INCREMENT,
  `fkUser` int DEFAULT NULL,
  `Name` varchar(225) NOT NULL DEFAULT 'NULL',
  `DateCreated` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `DateCompleted` datetime DEFAULT NULL,
  `GroupGoal` int DEFAULT NULL,
  `EventOrTime` int DEFAULT NULL,
  `NumOfSubTasks` int DEFAULT NULL,
  `CompletedTasks` int DEFAULT NULL,
  `IncompleteTasks` int DEFAULT NULL,
  `Stars` int DEFAULT NULL,
  `NumOfEvents` int DEFAULT NULL COMMENT 'Events upon this goal is anything from a comment to pooling ',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`pkGoal`),
  KEY `fkUser` (`fkUser`),
  CONSTRAINT `Goals_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `pkInventory` int NOT NULL AUTO_INCREMENT,
  `i_starCount` int DEFAULT NULL,
  `i_starsEarned` int DEFAULT NULL,
  `i_starsSpent` int DEFAULT NULL,
  PRIMARY KEY (`pkInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notes`
--

DROP TABLE IF EXISTS `Notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notes` (
  `pkNote` int NOT NULL AUTO_INCREMENT,
  `fkUser` int DEFAULT NULL,
  `fkTask` int DEFAULT NULL,
  `NoteText` varchar(255) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`pkNote`),
  KEY `fkUser` (`fkUser`),
  KEY `fkTask` (`fkTask`),
  CONSTRAINT `Notes_ibfk_2` FOREIGN KEY (`fkTask`) REFERENCES `Tasks` (`pkTask`),
  CONSTRAINT `Notes_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stickers`
--

DROP TABLE IF EXISTS `Stickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stickers` (
  `pkSticker` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `StickerUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkSticker`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StickersToUser`
--

DROP TABLE IF EXISTS `StickersToUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StickersToUser` (
  `fkSticker` int DEFAULT NULL,
  `fkGivingUser` int DEFAULT NULL,
  `fkReceivingUser` int DEFAULT NULL,
  `DateReceived` datetime DEFAULT NULL,
  KEY `fkSticker` (`fkSticker`),
  KEY `fkGivingUser` (`fkGivingUser`),
  KEY `fkReceivingUser` (`fkReceivingUser`),
  CONSTRAINT `StickersToUser_ibfk_3` FOREIGN KEY (`fkReceivingUser`) REFERENCES `Users` (`pkUser`),
  CONSTRAINT `StickersToUser_ibfk_1` FOREIGN KEY (`fkSticker`) REFERENCES `Stickers` (`pkSticker`),
  CONSTRAINT `StickersToUser_ibfk_2` FOREIGN KEY (`fkGivingUser`) REFERENCES `Users` (`pkUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `pkTag` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkTag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TaskTags`
--

DROP TABLE IF EXISTS `TaskTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskTags` (
  `fkTask` int DEFAULT NULL,
  `fkTag` int DEFAULT NULL,
  `fkUser` int DEFAULT NULL,
  KEY `fkTask` (`fkTask`),
  KEY `fkTag` (`fkTag`),
  CONSTRAINT `TaskTags_ibfk_2` FOREIGN KEY (`fkTag`) REFERENCES `Tags` (`pkTag`),
  CONSTRAINT `TaskTags_ibfk_1` FOREIGN KEY (`fkTask`) REFERENCES `Tasks` (`pkTask`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tasks` (
  `pkTask` int NOT NULL AUTO_INCREMENT,
  `fkUser` int DEFAULT NULL,
  `fkGoal` int DEFAULT NULL,
  `fkParentTask` int DEFAULT NULL,
  `recurringTask` int DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateCompleted` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`pkTask`),
  KEY `fkUser` (`fkUser`),
  KEY `fkGoal` (`fkGoal`),
  KEY `fkParentTask` (`fkParentTask`),
  CONSTRAINT `Tasks_ibfk_3` FOREIGN KEY (`fkParentTask`) REFERENCES `Tasks` (`pkTask`),
  CONSTRAINT `Tasks_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`),
  CONSTRAINT `Tasks_ibfk_2` FOREIGN KEY (`fkGoal`) REFERENCES `Goals` (`pkGoal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trophies`
--

DROP TABLE IF EXISTS `Trophies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trophies` (
  `pkTrophy` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `TrophyUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkTrophy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TrophyToGoal`
--

DROP TABLE IF EXISTS `TrophyToGoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrophyToGoal` (
  `fkTrophy` int DEFAULT NULL,
  `fkUser` int DEFAULT NULL,
  `fkGoal` int DEFAULT NULL,
  `DateEarned` datetime DEFAULT NULL,
  KEY `fkTrophy` (`fkTrophy`),
  KEY `fkUser` (`fkUser`),
  KEY `fkGoal` (`fkGoal`),
  CONSTRAINT `TrophyToGoal_ibfk_3` FOREIGN KEY (`fkGoal`) REFERENCES `Goals` (`pkGoal`),
  CONSTRAINT `TrophyToGoal_ibfk_1` FOREIGN KEY (`fkTrophy`) REFERENCES `Trophies` (`pkTrophy`),
  CONSTRAINT `TrophyToGoal_ibfk_2` FOREIGN KEY (`fkUser`) REFERENCES `Users` (`pkUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `pkUser` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL DEFAULT 'NULL',
  `LastName` varchar(255) DEFAULT NULL,
  `AvatarUrl` varchar(225) DEFAULT NULL,
  `Username` varchar(225) NOT NULL DEFAULT 'NULL',
  `Password` varchar(225) NOT NULL DEFAULT 'NULL',
  `Email` varchar(225) NOT NULL DEFAULT 'NULL',
  `fkInventory` int DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`pkUser`),
  KEY `fkInventory` (`fkInventory`),
  CONSTRAINT `Users_ibfk_2` FOREIGN KEY (`fkInventory`) REFERENCES `Inventory` (`pkInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-07 14:42:24
