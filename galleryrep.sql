-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: galleryrep
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `artdata`
--

DROP TABLE IF EXISTS `artdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artdata` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `picture` longblob,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artdata`
--

LOCK TABLES `artdata` WRITE;
/*!40000 ALTER TABLE `artdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `artdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artentity`
--

DROP TABLE IF EXISTS `artentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artentity` (
  `id` bigint(20) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `displayDate` varchar(255) DEFAULT NULL,
  `generalViewable` bit(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `privilegeViewable` bit(1) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uploadedDate` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `galleryPicture_id` bigint(20) DEFAULT NULL,
  `storagePicture_id` bigint(20) DEFAULT NULL,
  `thumbnailPicture_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsv0hs14l5dr9vk0vmqx3rhvly` (`galleryPicture_id`),
  KEY `FK5tb5bqqmikp21yj3noi9oopyo` (`storagePicture_id`),
  KEY `FK8p5qvnhr5t1s3cwmeatm3jrao` (`thumbnailPicture_id`),
  CONSTRAINT `FK5tb5bqqmikp21yj3noi9oopyo` FOREIGN KEY (`storagePicture_id`) REFERENCES `artdata` (`id`),
  CONSTRAINT `FK8p5qvnhr5t1s3cwmeatm3jrao` FOREIGN KEY (`thumbnailPicture_id`) REFERENCES `artdata` (`id`),
  CONSTRAINT `FKsv0hs14l5dr9vk0vmqx3rhvly` FOREIGN KEY (`galleryPicture_id`) REFERENCES `artdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artentity`
--

LOCK TABLES `artentity` WRITE;
/*!40000 ALTER TABLE `artentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `artentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artentity_comment`
--

DROP TABLE IF EXISTS `artentity_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artentity_comment` (
  `ArtEntity_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ArtEntity_id`,`comments_id`),
  UNIQUE KEY `UK_7pc5p3q5fwmftixu7a35id0k2` (`comments_id`),
  CONSTRAINT `FKi3x8jwsyl1s4nrx3c1wejcuh` FOREIGN KEY (`ArtEntity_id`) REFERENCES `artentity` (`id`),
  CONSTRAINT `FKjqoe992jh9sk00obswrxisoe6` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artentity_comment`
--

LOCK TABLES `artentity_comment` WRITE;
/*!40000 ALTER TABLE `artentity_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `artentity_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `categoryDescription` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_artentity`
--

DROP TABLE IF EXISTS `category_artentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_artentity` (
  `categories_id` bigint(20) NOT NULL,
  `artEntities_id` bigint(20) NOT NULL,
  PRIMARY KEY (`categories_id`,`artEntities_id`),
  KEY `FKqqumnqqf7tha059x9njhhgert` (`artEntities_id`),
  CONSTRAINT `FK1m8qj1q5n2v9x1ipgrs9bpryd` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKqqumnqqf7tha059x9njhhgert` FOREIGN KEY (`artEntities_id`) REFERENCES `artentity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_artentity`
--

LOCK TABLES `category_artentity` WRITE;
/*!40000 ALTER TABLE `category_artentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_artentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commentDate` date DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `commentedArt_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm8h3w41asm7de7p9c9w9nd7bd` (`commentedArt_id`),
  CONSTRAINT `FKm8h3w41asm7de7p9c9w9nd7bd` FOREIGN KEY (`commentedArt_id`) REFERENCES `artentity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibition` (
  `id` bigint(20) NOT NULL,
  `exhibitionName` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition`
--

LOCK TABLES `exhibition` WRITE;
/*!40000 ALTER TABLE `exhibition` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition_artentity`
--

DROP TABLE IF EXISTS `exhibition_artentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibition_artentity` (
  `Exhibition_id` bigint(20) NOT NULL,
  `exhibitionArtWork_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Exhibition_id`,`exhibitionArtWork_id`),
  KEY `FKfig3yk5ivd6ypc8ljo07fq87n` (`exhibitionArtWork_id`),
  CONSTRAINT `FK6fgvjppd1o98wqn5mg68s14iq` FOREIGN KEY (`Exhibition_id`) REFERENCES `exhibition` (`id`),
  CONSTRAINT `FKfig3yk5ivd6ypc8ljo07fq87n` FOREIGN KEY (`exhibitionArtWork_id`) REFERENCES `artentity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition_artentity`
--

LOCK TABLES `exhibition_artentity` WRITE;
/*!40000 ALTER TABLE `exhibition_artentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibition_artentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mailId` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleLevel` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolelevel`
--

DROP TABLE IF EXISTS `rolelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolelevel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roll` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolelevel`
--

LOCK TABLES `rolelevel` WRITE;
/*!40000 ALTER TABLE `rolelevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolelevel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-19 19:47:18
