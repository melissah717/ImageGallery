-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dessertdb
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `fk_authorid` int NOT NULL,
  `fk_postid` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comments to posts_idx` (`fk_authorid`),
  KEY `comments to posts` (`fk_postid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (54,'I LOVE NUTELLA!',10,12,'2021-05-11 00:04:47'),(55,'Wait, that\'s not an egg tart',10,17,'2021-05-11 00:06:32'),(56,'So yummy',10,11,'2021-05-11 00:07:50'),(57,'I had this in Thailand',10,11,'2021-05-11 00:10:00'),(58,'Colorful',10,14,'2021-05-11 00:25:38'),(59,'How do they even make that?',10,13,'2021-05-11 00:27:05'),(60,'Yum\n',10,13,'2021-05-11 00:31:43'),(61,'Yumm',9,15,'2021-05-11 09:44:11'),(62,'hello',10,17,'2021-05-12 23:19:01'),(63,'I\'m so happy',10,17,'2021-05-12 23:19:22'),(64,'Testing testing',10,17,'2021-05-12 23:20:55'),(65,'Looks good',17,27,'2021-05-13 11:15:07'),(66,'BERRIES~!',8,32,'2021-05-14 00:03:12');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users_idx` (`fk_userid`),
  CONSTRAINT `posts to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (6,'dfasd','yum!','public\\images\\uploads\\11338fc530c5be4eb89e802e3830db677fbd50e825f3.png','public/images/uploads/thumbnail-11338fc530c5be4eb89e802e3830db677fbd50e825f3.png',0,'2021-05-07 16:01:41',10),(7,'cake','yum!','public\\images\\uploads\\bf6de423aaac0d75cce249dfd2d1c3234795b603a8a4.png','public/images/uploads/thumbnail-bf6de423aaac0d75cce249dfd2d1c3234795b603a8a4.png',0,'2021-05-07 16:01:54',10),(8,'cake','yum!','public\\images\\uploads\\33355e9e34bad4d71d72fe126dedd2d1d59af34d3c9a.png','public/images/uploads/thumbnail-33355e9e34bad4d71d72fe126dedd2d1d59af34d3c9a.png',0,'2021-05-07 16:03:16',10),(9,'cake','shortcake','public\\images\\uploads\\c32eec80f518b3fba000e38ee4cce3e191d2ee3f17c6.png','public/images/uploads/thumbnail-c32eec80f518b3fba000e38ee4cce3e191d2ee3f17c6.png',0,'2021-05-07 16:03:37',10),(10,'Shaved Ice','Great on a hot summer day','public\\images\\uploads\\4be80518c5282371bb3bd11ee12e69f6070a0c8626b7.png','public/images/uploads/thumbnail-4be80518c5282371bb3bd11ee12e69f6070a0c8626b7.png',0,'2021-05-07 16:05:00',10),(11,'Mango Rice','A sweet snack','public\\images\\uploads\\468bf0dbae2cd3dab825253f64b75224623e07cd26f2.png','public/images/uploads/thumbnail-468bf0dbae2cd3dab825253f64b75224623e07cd26f2.png',0,'2021-05-07 16:05:24',10),(12,'Crepes','Great with nutella','public\\images\\uploads\\04322ae3b95d2d832549c905813fceee9139a1f5c089.png','public/images/uploads/thumbnail-04322ae3b95d2d832549c905813fceee9139a1f5c089.png',0,'2021-05-07 16:05:50',10),(13,'Fried Ice Cream','Best of both worlds','public\\images\\uploads\\244219888acebb0f5d614eed7945da4cb5090525621f.png','public/images/uploads/thumbnail-244219888acebb0f5d614eed7945da4cb5090525621f.png',0,'2021-05-07 16:10:08',10),(14,'Frozen Yogurt','Express yourself','public\\images\\uploads\\3780cb1a9ff05639f340f9db62b65323f3e32bd088c2.png','public/images/uploads/thumbnail-3780cb1a9ff05639f340f9db62b65323f3e32bd088c2.png',0,'2021-05-07 16:10:17',10),(15,'Egg Tarts','If you know you know','public\\images\\uploads\\6dc7340063befea117cfe1bd49e7a812240f29b37158.png','public/images/uploads/thumbnail-6dc7340063befea117cfe1bd49e7a812240f29b37158.png',0,'2021-05-07 16:10:28',10),(16,'Egg Tarts','If you know you know','public\\images\\uploads\\1bb3c62a10726da749d520.png','public/images/uploads/thumbnail-1bb3c62a10726da749d520.png',0,'2021-05-10 17:29:29',9),(17,'Egg Tarts','yum!','public\\images\\uploads\\5d3443272a703e97c06575.png','public/images/uploads/thumbnail-5d3443272a703e97c06575.png',0,'2021-05-10 17:35:19',9),(18,'Fried Ice Cream','Best of both worlds','public\\images\\uploads\\634c058daa337f6aef56e1.png','public/images/uploads/thumbnail-634c058daa337f6aef56e1.png',0,'2021-05-12 23:05:12',10),(19,'Egg Tarts','Best part of a dim sum meal. ','public\\images\\uploads\\379d72a8612fbf8fe772ab.png','public/images/uploads/thumbnail-379d72a8612fbf8fe772ab.png',0,'2021-05-12 23:38:45',12),(20,'Fried Ice Cream','How do they even make this?','public\\images\\uploads\\c7f12e1ce8efee58d8157f.png','public/images/uploads/thumbnail-c7f12e1ce8efee58d8157f.png',0,'2021-05-12 23:39:09',12),(21,'Frozen Yogurt','FroYo ','public\\images\\uploads\\97de4726caa4c5228232be.png','public/images/uploads/thumbnail-97de4726caa4c5228232be.png',0,'2021-05-12 23:39:35',12),(22,'Crepes',' + nutella please!','public\\images\\uploads\\9cbe2953e3c9fecf57f27e.png','public/images/uploads/thumbnail-9cbe2953e3c9fecf57f27e.png',0,'2021-05-12 23:39:54',12),(23,'Shaved Ice','add condensed milk','public\\images\\uploads\\f8cafd38bb31e6210b2501.png','public/images/uploads/thumbnail-f8cafd38bb31e6210b2501.png',0,'2021-05-12 23:40:24',12),(24,'Tiramisu','Delicious cake','public\\images\\uploads\\61e748259ab949dbfaa383.png','public/images/uploads/thumbnail-61e748259ab949dbfaa383.png',0,'2021-05-12 23:40:47',12),(25,'Beignets','Still can\'t pronounce it','public\\images\\uploads\\bc9c9fbf47760f066173bc.png','public/images/uploads/thumbnail-bc9c9fbf47760f066173bc.png',0,'2021-05-12 23:41:28',12),(26,'Mango Rice','sooooo good','public\\images\\uploads\\bef3f365598be262e64cf3.png','public/images/uploads/thumbnail-bef3f365598be262e64cf3.png',0,'2021-05-12 23:41:52',12),(27,'Creme Brulee','c r e a m y ','public\\images\\uploads\\4749e49da4ae6cabe9c001.png','public/images/uploads/thumbnail-4749e49da4ae6cabe9c001.png',0,'2021-05-12 23:42:27',12),(28,'Egg Tarts','If you know you know','public\\images\\uploads\\0d6f418886e3fba9d21249.png','public/images/uploads/thumbnail-0d6f418886e3fba9d21249.png',0,'2021-05-13 23:35:17',19),(29,'Fried Ice Cream','asdaf','public\\images\\uploads\\a4862b0918d208a509480a.png','public/images/uploads/thumbnail-a4862b0918d208a509480a.png',0,'2021-05-13 23:41:29',9),(30,'cake','yum!','public\\images\\uploads\\4084a02fbbf3651898b55a.png','public/images/uploads/thumbnail-4084a02fbbf3651898b55a.png',0,'2021-05-13 23:43:23',9),(31,'Egg Tarts','add condensed milk','public\\images\\uploads\\d65bd06c96680ee1bd658c.png','public/images/uploads/thumbnail-d65bd06c96680ee1bd658c.png',0,'2021-05-13 23:46:56',9),(32,'Crepes','If you know you know','public\\images\\uploads\\d0534594050a55058886c0.png','public/images/uploads/thumbnail-d0534594050a55058886c0.png',0,'2021-05-13 23:52:12',9);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('J0LcFAOoSK2OBF6ayvVBnnT_mTnXTX8v',1621061729,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('M1k-WUyigXjkWRleoRRHhE8Hi2JKkfeH',1621062192,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"username\":\"meow1\",\"userId\":8}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'asdfasdf','asdfasda@yahoo.com','6l3TT#rs!',0,0,'2021-05-04 15:37:44'),(7,'atamekitty','mho10@mail.sfsu.edu','6l3TT3rs!',0,0,'2021-05-04 22:42:47'),(8,'meow1','asdfasdf@yahoo.com','$2b$15$s62aNPMUUSlmTNqc471pwOpy7.BhjXnFX6g6QBVEiK2KF8A69DEpm',0,0,'2021-05-04 23:40:11'),(9,'meow2','meow2@gmail.com','$2b$15$e.sGtLn4xobQKYIEH5nT7u9djOw/qG3LSghfDYctDMgPUgrllXZVq',0,0,'2021-05-05 00:18:37'),(10,'meowlissa','meowlissa@gmail.com','$2b$15$19RTvVlAKqOSYE3xYFY1Yep1pwn4HST3S8W1TfRCjk06qCbEO9gwi',0,0,'2021-05-06 12:43:52'),(11,'test11','test11@gmail.com','$2b$15$jSnnLek4odT4ksztqUg04uaZxK/HtA8lOuCmeo13mCE9tGsEXRmty',0,0,'2021-05-12 21:31:43'),(12,'test123','test123@gmail.com','$2b$15$dj7XBLg3mOX7W.Xk3MRydOTMFD9dOlTZLz49PaHtt/EHwRr3ztwzi',0,0,'2021-05-12 23:37:22'),(13,'test321','test321@gmail.com','$2b$15$cIIKXyEvYfXEzuOhijieuOehXVkd7uKzTgtaPiPlskvFA.T0JfRpq',0,0,'2021-05-12 23:48:48'),(15,'me0wlissa','meowlissa123@gmail.com','$2b$15$efX8H15r/864JUi3so1WpOmwTfNV40d8xCKWTnVmNp4Qw6e3cpA8e',0,0,'2021-05-12 23:52:32'),(16,'meow3','meow3@gmail.com','$2b$15$s1o9e.RXwa/edjC8hHaryusl.cJ2kpoeSoxcOy3duYmHk0oxTgz5O',0,0,'2021-05-13 11:11:48'),(17,'meow4','meow4@gmail.com','$2b$15$G3Nm5TNrvCaEfvg6m0hD/.PwbyJteX9RxJYnsGxEy8Gld3hO59Yb6',0,0,'2021-05-13 11:13:08'),(18,'meow5','meow5@gmail.com','$2b$15$stLGSynxRl5pUUgsGQalGem6WbWf.FEKSnL6ho73H8tigbW7rHarW',0,0,'2021-05-13 11:14:24'),(19,'meow10','meow10@gmail.com','$2b$15$3Q9YH4lMAOgypicBgNaL4.5zHKrI5HodwZ4Yvg5WxHXU91LBKi4Pa',0,0,'2021-05-13 22:28:47');
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

-- Dump completed on 2021-05-14  0:19:46
