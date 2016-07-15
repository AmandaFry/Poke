-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pokeexam2
-- ------------------------------------------------------
-- Server version	5.5.41-log

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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `being_poked` int(11) NOT NULL,
  `poking` int(11) DEFAULT NULL,
  `number_of_poke` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pokes_Users_idx` (`being_poked`),
  CONSTRAINT `fk_Pokes_Users` FOREIGN KEY (`being_poked`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (1,1,4,7,'2016-07-12 15:19:40','2016-07-12 16:45:28'),(6,2,4,1,'2016-07-12 16:20:39','2016-07-12 16:20:39'),(7,1,3,10,'2016-07-12 16:38:15','2016-07-12 16:46:52'),(8,3,1,8,'2016-07-12 17:07:59','2016-07-13 11:00:04'),(9,1,2,3,'2016-07-12 17:08:36','2016-07-12 17:08:41'),(10,2,1,4,'2016-07-12 21:26:19','2016-07-13 11:01:51'),(11,4,1,2,'2016-07-13 10:38:47','2016-07-13 10:38:47'),(12,2,5,2,'2016-07-13 11:08:30','2016-07-13 11:08:32'),(13,3,5,1,'2016-07-13 11:08:35','2016-07-13 11:08:35'),(14,5,1,2,'2016-07-13 11:22:21','2016-07-13 11:22:22'),(15,6,1,1,'2016-07-13 11:22:23','2016-07-13 11:22:23'),(16,1,6,2,'2016-07-13 11:22:43','2016-07-13 11:22:44');
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `alias` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amanda','Fry','smarty pants','afry@test.com','$2b$12$PZGF43yRwwb1kyYAX2nhg.rX5CaN8j2tf1pjhuQGqXCuJknSuz//2','2016-07-12','2016-07-12 15:16:49','2016-07-12 15:16:49'),(2,'Brianna','Fry','tater tot','bfry@test.com','$2b$12$842yoBYpb0mG4TwZkL0AZub3Tu5JyFf9lXbMOqvmub4pXZwIkJ8Oi','2012-02-16','2016-07-12 15:18:00','2016-07-12 15:18:00'),(3,'Bagheera','Fry','pumpkin','dogfry@test.com','$2b$12$GlwqUQruPaE0A.l702bHAO41FOOIo1fDTQbhxLfsmKcHoGHe17sS.','1985-11-20','2016-07-12 15:18:42','2016-07-12 15:18:42'),(4,'Tim','Fry','tickle monster','tfry@test.com','$2b$12$QMHJupINdcVlZf9D8enHFeqKHB2xWeVTylDwwCSPf/xjfVzRIndKm','1980-06-06','2016-07-12 15:19:27','2016-07-12 15:19:27'),(5,'asdf','asdf','asdf','asdf@gmail.com','$2b$12$Zthhc6wnBLqAjnbO8p5mmeB2tgSpFpz0liqsGzLyL0Sbl.wamazge','2011-12-30','2016-07-13 11:08:15','2016-07-13 11:08:15'),(6,'zxcv','zxcv','zxcv','zxcv@gmail.com','$2b$12$hFbMd0I2kuhl73YdF1qnx..Mj3XfuYZ/TiUvl26H5jHpdQ7TKAhtG','2015-12-29','2016-07-13 11:09:15','2016-07-13 11:09:15');
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

-- Dump completed on 2016-07-15 11:12:07
