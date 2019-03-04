-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: online_shop
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postanski_broj` int(11) DEFAULT NULL,
  `ulica` varchar(90) DEFAULT NULL,
  `broj` varchar(20) DEFAULT NULL,
  `grad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresa_grad1_idx` (`grad_id`),
  CONSTRAINT `fk_adresa_grad1` FOREIGN KEY (`grad_id`) REFERENCES `grad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,400107,'Jevrejska','10A',3),(2,101801,'Poenkareova','5B',22),(3,400107,'Jevrejska','42',2);
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drzava`
--

DROP TABLE IF EXISTS `drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drzava` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `skracenica` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` VALUES (1,'New York','NY'),(2,'California','CA'),(3,'Colorado','CO'),(4,'Florida','FL'),(5,'Texas','TX'),(6,'New Jersy','NJ'),(7,'Illinois','IL'),(8,'Virginia','VA');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grad`
--

DROP TABLE IF EXISTS `grad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grad_drzava1_idx` (`drzava_id`),
  CONSTRAINT `fk_grad_drzava1` FOREIGN KEY (`drzava_id`) REFERENCES `drzava` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grad`
--

LOCK TABLES `grad` WRITE;
/*!40000 ALTER TABLE `grad` DISABLE KEYS */;
INSERT INTO `grad` VALUES (1,'New York',1),(2,'Buffalo',1),(3,'Rochester',1),(4,'Los Angeles',2),(5,'San Francisco',2),(6,'Sacramento',2),(7,'Denver',3),(8,'Aspen',3),(9,'Colorado Springs',3),(10,'Miami',4),(11,'Jecskonwill',4),(12,'Orlando',4),(13,'Houston',5),(14,'San Antonio',5),(15,'Dallas',5),(16,'Jersey City',6),(17,'Paterson',6),(18,'Newark',6),(19,'Chicago',7),(20,'Woking',7),(21,'Orland Park',7),(22,'Lensdown',8),(23,'Leesburg',8),(24,'Washington DC',8);
/*!40000 ALTER TABLE `grad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupa`
--

DROP TABLE IF EXISTS `grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skracenica` varchar(1) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `privilijegije_UNIQUE` (`skracenica`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
INSERT INTO `grupa` VALUES (1,'A','administrator'),(2,'K','korisnik');
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
INSERT INTO `kategorija` VALUES (1,'Phones'),(2,'PC\'s'),(3,'Laptops'),(4,'Keybords'),(5,'Headphones'),(6,'Mouse');
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` varchar(30) NOT NULL,
  `email` varchar(90) NOT NULL,
  `lozinka` varchar(32) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adresa_id` int(11) DEFAULT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `prezime` varchar(45) DEFAULT NULL,
  `grupa_id` int(11) NOT NULL DEFAULT '2',
  `korpa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `korisicniko_ime_UNIQUE` (`korisnicko_ime`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `telefon_UNIQUE` (`telefon`),
  KEY `fk_korisinik_adresa1_idx` (`adresa_id`),
  KEY `fk_korisinik_grupa1_idx` (`grupa_id`),
  KEY `fk_korisnik_korpa1_idx` (`korpa_id`),
  CONSTRAINT `fk_korisinik_adresa1` FOREIGN KEY (`adresa_id`) REFERENCES `adresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisinik_grupa1` FOREIGN KEY (`grupa_id`) REFERENCES `grupa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnik_korpa1` FOREIGN KEY (`korpa_id`) REFERENCES `korpa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'admin','admin@admin','21232f297a57a5a743894a0e4a801fc3','555-333',1,'Admin','Admin',1,1),(2,'korisnik','korisnik@gmail.com','716b64c0f6bad9ac405aab3f00958dd1','111-111',2,'Korisnik','Korisnik',2,2),(3,'nemanja','nemanjamudrinski@singimail.rs','4d67f865a4e6c0da688d544e5513e730','222-222',3,'Pera','Peric',2,3);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik_racun`
--

DROP TABLE IF EXISTS `korisnik_racun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnik_racun` (
  `korisnik_id` int(11) NOT NULL,
  `racun_id` int(11) NOT NULL,
  PRIMARY KEY (`korisnik_id`,`racun_id`),
  KEY `fk_korisnik_has_racun_racun1_idx` (`racun_id`),
  KEY `fk_korisnik_has_racun_korisnik1_idx` (`korisnik_id`),
  CONSTRAINT `fk_korisnik_has_racun_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnik_has_racun_racun1` FOREIGN KEY (`racun_id`) REFERENCES `racun` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik_racun`
--

LOCK TABLES `korisnik_racun` WRITE;
/*!40000 ALTER TABLE `korisnik_racun` DISABLE KEYS */;
INSERT INTO `korisnik_racun` VALUES (2,1);
/*!40000 ALTER TABLE `korisnik_racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korpa`
--

DROP TABLE IF EXISTS `korpa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korpa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korpa`
--

LOCK TABLES `korpa` WRITE;
/*!40000 ALTER TABLE `korpa` DISABLE KEYS */;
INSERT INTO `korpa` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `korpa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korpa_proizvod`
--

DROP TABLE IF EXISTS `korpa_proizvod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korpa_proizvod` (
  `korpa_id` int(11) NOT NULL,
  `proizvod_id` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`korpa_id`,`proizvod_id`),
  KEY `fk_korpa_has_proizvod_proizvod1_idx` (`proizvod_id`),
  KEY `fk_korpa_has_proizvod_korpa1_idx` (`korpa_id`),
  CONSTRAINT `fk_korpa_has_proizvod_korpa1` FOREIGN KEY (`korpa_id`) REFERENCES `korpa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_korpa_has_proizvod_proizvod1` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvod` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korpa_proizvod`
--

LOCK TABLES `korpa_proizvod` WRITE;
/*!40000 ALTER TABLE `korpa_proizvod` DISABLE KEYS */;
INSERT INTO `korpa_proizvod` VALUES (1,1,5),(1,2,5),(3,3,1);
/*!40000 ALTER TABLE `korpa_proizvod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merna_jedinica`
--

DROP TABLE IF EXISTS `merna_jedinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merna_jedinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_jedinice` varchar(45) NOT NULL,
  `skracenica` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merna_jedinica`
--

LOCK TABLES `merna_jedinica` WRITE;
/*!40000 ALTER TABLE `merna_jedinica` DISABLE KEYS */;
INSERT INTO `merna_jedinica` VALUES (1,'Piece','peice'),(2,'Gram','gm'),(3,'Kilogram','kg');
/*!40000 ALTER TABLE `merna_jedinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvod`
--

DROP TABLE IF EXISTS `proizvod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proizvod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(90) NOT NULL,
  `cena` float NOT NULL,
  `kolicina` int(11) NOT NULL,
  `opis` longtext,
  `merna_jedinica_id` int(11) NOT NULL,
  `postoji` int(11) NOT NULL DEFAULT '1',
  `kategorija_id` int(11) NOT NULL,
  `proizvodjac_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proizvod_merna_jedinica1_idx` (`merna_jedinica_id`),
  KEY `fk_proizvod_kategorija1_idx` (`kategorija_id`),
  KEY `fk_proizvod_proizvodjac1_idx` (`proizvodjac_id`),
  CONSTRAINT `fk_proizvod_kategorija1` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorija` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_merna_jedinica1` FOREIGN KEY (`merna_jedinica_id`) REFERENCES `merna_jedinica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_proizvodjac1` FOREIGN KEY (`proizvodjac_id`) REFERENCES `proizvodjac` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvod`
--

LOCK TABLES `proizvod` WRITE;
/*!40000 ALTER TABLE `proizvod` DISABLE KEYS */;
INSERT INTO `proizvod` VALUES (1,'Nothosaur M606',14,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,3,2),(2,'BlackWidow X Chroma',200,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,2,1),(3,'G402 Hyperion',90,15,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,3,4),(4,'Kraken Neon',70,20,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,1,1),(5,'Cloud ',95,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,1,3),(6,'G613',170,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.',1,0,2,4),(7,'Iphone X',1200,12,'New',1,0,1,1),(8,'iPhone 8',820,22,'fdsd',1,0,1,1),(9,'iPhone 6 128GB',900,22,'ddaada',1,0,1,1),(10,'fsfesfsd',4654,46,'efsfefs',1,0,1,1),(11,'iPhone X JetBlack 512GB',1250,19,'Custom-built OLED. The OLED panels in iPhone XS allow for an HDR display with the industry’s best color accuracy, true blacks, and remarkable brightness and contrast. They’re the sharpest displays, with the highest pixel density, on any Apple device.\n\nHDR10 and wider stereo sound. With support for Dolby Vision and HDR10 titles from iTunes, Netflix, and Amazon Prime Video, movie night comes to iPhone.2 Wider stereo playback makes it all sound great. And your HDR photos — even those you captured before — will have a 60 percent greater dynamic range.',1,1,1,1),(12,'iPhone 8 Rose 128GB',800,15,'The iPhone 8 models do not feature the newer edge-to-edge design introduced in the iPhone X, XS, XS Max, and XR, instead offering a Touch ID Home button and thick top and bottom bezels in a 4.7 or 5.5-inch body. There is no TrueDepth camera system for Face ID, but wireless charging is supported.\n\nApple\'s iPhone 8 uses an LCD display instead of OLED and the camera is less advanced, but it still takes fantastic photos along with 4K video, and the A11 Bionic processor is fast enough that it will hold up well for years to come.\n\nIt is IP67 water resistant and features LTE Advanced speeds of up to 450Gb/s, but it does not have dual-SIM functionality.\n\nIf you don\'t mind missing out on Face ID features like Portrait Mode and Animoji, and don\'t mind the extra bezel size, the iPhone 8 is an excellent device that will save you quite a bit of money.\n\nIf you\'re torn between the iPhone 8 and a newer iPhone',1,1,1,1),(13,'Dell Inspiron 15',750,11,'The Inspiron 15 3000\'s design has an interesting texture but a boring color scheme. Dell constructed the back lid, keyboard deck and base using a textured black plastic, which feels smooth to the touch but is very flexible. The edges of both the lid and the base have a glossy black casing, which breaks up the design but creates some rough edges where the two materials meet. The Inspiron 15 3000 measures 14.96 x 10.25 x 0.99 inches and weighs a reasonable 4.88 pounds. It\'s both lighter and thinner than other 15-inch laptops, including the HP Notebook 15 (15.1 x 10 x 1 inches, 6 pounds) and the Acer Aspire E 15 (10.2 x 1.5 x 1.2 inches, 5.06 pounds).',1,1,3,4),(14,'Dell XPS',1200,5,'The XPS Tower and Tower Special Edition desktops are built to grow with you featuring big power, advanced graphics and tool-less chassis for easy expandability. The XPS Tower Special Edition is Ready for VR and now fully configurable.',1,1,2,4),(15,'Redragon Mouse',15,45,'CALM CURVES AND PRETTY LIGHTS\nErgonomic and backlit to frag all night long\nSomewhere out there, a pro gamer is retiring at 24, wrists and fingers destroyed by arthritis and carpal tunnel from long hours of training and competing. Sure, he’ll pick up a cushy job live streaming events for a few years, but he’ll never open a jar of pickles again. The world of computer input device ergonomics has made incredible strides in the last few years, and we’ve rolled them all into the Centrophorus, from fingertip grips to a form factor that’s more natural to use.\n\nA VISION OF SIMPLICITY\nMisclick no more with an ergonomic layout\nYou’ve only got five fingers, so we decided to give you six buttons (your thumb gets two). That’s why the Centrophorus earned buttons with a slightly larger surface area than competitors’ mice. Centrally located and impossible to miss, the DPI switcher can instantly toggle your resolution up or down, taking you from fast twitch to pinpoint accuracy at the moment that your game needs it.',1,1,6,8),(16,'Beats headphones',120,48,'“I LIKE TO SURROUND MYSELF WITH POSITIVITY. IT MAKES ME FEEL THE WAY GOOD MUSIC MAKES ME FEEL” - POST MALONE\nWith up to 40 hours of battery life, Beats Solo3 Wireless is your perfect everyday headphone. Get the most out of your music with an award-winning, emotionally charged Beats listening experience.',1,1,5,9),(17,'Razer Keybord',55,33,'NEXT-LEVEL GAMING PERFORMANCE\nWhen we created the Razer Huntsman line, we didn’t just set out to produce another line of superior gaming keyboards. We had a vision of revolutionizing a whole new frontier of gaming performance. And with the Razer Huntsman, you’re about to experience exactly what we wanted to deliver—a keyboard that instantly elevates the way you play.\n\nTHE NEW RAZER OPTO-MECHANICAL SWITCH\nRazer Opto-Mechanical™ Switches have an optical light sensor inside the switch. Upon pressing a key, you allow a receiver to be activated by this light signal, instantly actuating the switch command. You’ve never experienced speed like this before.',1,1,4,7);
/*!40000 ALTER TABLE `proizvod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvodjac`
--

DROP TABLE IF EXISTS `proizvodjac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proizvodjac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvodjac`
--

LOCK TABLES `proizvodjac` WRITE;
/*!40000 ALTER TABLE `proizvodjac` DISABLE KEYS */;
INSERT INTO `proizvodjac` VALUES (1,'Apple'),(2,'Samsung'),(3,'Huawei'),(4,'Dell'),(5,'HP'),(6,'Lenovo'),(7,'Razer'),(8,'Redragon'),(9,'Beats');
/*!40000 ALTER TABLE `proizvodjac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racun`
--

DROP TABLE IF EXISTS `racun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racun`
--

LOCK TABLES `racun` WRITE;
/*!40000 ALTER TABLE `racun` DISABLE KEYS */;
INSERT INTO `racun` VALUES (1,'2018-12-17 09:02:12');
/*!40000 ALTER TABLE `racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racun_proizvod`
--

DROP TABLE IF EXISTS `racun_proizvod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racun_proizvod` (
  `racun_id` int(11) NOT NULL,
  `proizvod_id` int(11) NOT NULL,
  `cena` float NOT NULL,
  `kolicina` int(11) NOT NULL,
  PRIMARY KEY (`racun_id`,`proizvod_id`),
  KEY `fk_racun_has_proizvod_proizvod1_idx` (`proizvod_id`),
  KEY `fk_racun_has_proizvod_racun1_idx` (`racun_id`),
  CONSTRAINT `fk_racun_has_proizvod_proizvod1` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvod` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_racun_has_proizvod_racun1` FOREIGN KEY (`racun_id`) REFERENCES `racun` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racun_proizvod`
--

LOCK TABLES `racun_proizvod` WRITE;
/*!40000 ALTER TABLE `racun_proizvod` DISABLE KEYS */;
INSERT INTO `racun_proizvod` VALUES (1,11,1250,1),(1,16,120,2);
/*!40000 ALTER TABLE `racun_proizvod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'online_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-17  9:15:32
