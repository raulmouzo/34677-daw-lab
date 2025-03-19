/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: daw
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Sudaderas'),
(2,'Camisetas'),
(3,'Pantalones');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `unit_price` decimal(8,2) DEFAULT 0.00,
  PRIMARY KEY (`order_id`,`variant_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES
(1,'Pendiente'),
(2,'Enviado '),
(3,'Entregado'),
(4,'Cancelado');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` date DEFAULT curdate(),
  `total_amount` decimal(8,2) DEFAULT 0.00,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES
(1,1,'products_hoodie/product_1/image_0.webp'),
(2,1,'products_hoodie/product_1/image_1.webp'),
(3,1,'products_hoodie/product_1/image_2.webp'),
(4,2,'products_hoodie/product_2/image_0.webp'),
(5,2,'products_hoodie/product_2/image_1.webp'),
(6,2,'products_hoodie/product_2/image_2.webp'),
(7,3,'products_hoodie/product_3/image_0.webp'),
(8,3,'products_hoodie/product_3/image_1.webp'),
(9,3,'products_hoodie/product_3/image_2.webp'),
(10,4,'products_hoodie/product_4/image_0.webp'),
(11,4,'products_hoodie/product_4/image_1.webp'),
(12,4,'products_hoodie/product_4/image_2.webp'),
(13,5,'products_hoodie/product_5/image_0.webp'),
(14,5,'products_hoodie/product_5/image_1.webp'),
(15,5,'products_hoodie/product_5/image_2.webp'),
(37,6,'products_t-shirts/product_1/image_0.webp'),
(38,6,'products_t-shirts/product_1/image_1.webp'),
(39,6,'products_t-shirts/product_1/image_2.webp'),
(40,7,'products_t-shirts/product_2/image_0.webp'),
(41,7,'products_t-shirts/product_2/image_1.webp'),
(42,7,'products_t-shirts/product_2/image_2.webp'),
(43,8,'products_t-shirts/product_3/image_0.webp'),
(44,8,'products_t-shirts/product_3/image_1.webp'),
(45,8,'products_t-shirts/product_3/image_2.webp'),
(46,9,'products_t-shirts/product_4/image_0.webp'),
(47,9,'products_t-shirts/product_4/image_1.webp'),
(48,9,'products_t-shirts/product_4/image_2.webp'),
(49,10,'products_t-shirts/product_5/image_0.webp'),
(50,10,'products_t-shirts/product_5/image_1.webp'),
(51,10,'products_t-shirts/product_5/image_2.webp'),
(52,11,'products_pants/product_1/image_0.webp'),
(53,11,'products_pants/product_1/image_1.webp'),
(54,11,'products_pants/product_1/image_2.webp'),
(55,12,'products_pants/product_2/image_0.webp'),
(56,12,'products_pants/product_2/image_1.webp'),
(57,12,'products_pants/product_2/image_2.webp'),
(58,13,'products_pants/product_3/image_0.webp'),
(59,13,'products_pants/product_3/image_1.webp'),
(60,13,'products_pants/product_3/image_2.webp'),
(61,14,'products_pants/product_4/image_0.webp'),
(62,14,'products_pants/product_4/image_1.webp'),
(63,14,'products_pants/product_4/image_2.webp'),
(64,15,'products_pants/product_5/image_0.webp'),
(65,15,'products_pants/product_5/image_1.webp'),
(66,15,'products_pants/product_5/image_2.webp');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT 0.00,
  `brand` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'HOODIE - Sudadera',69.95,'Nike Sportswear',1),
(2,'WASHED ZIP-HOODIE UNISEX',44.99,'YOURTURN',1),
(3,'COLNE LOGO OVERSIZED HOODIE',59.95,'Pegador',1),
(4,'Upscale by Mister Tee',49.99,'THEORY OF ANOMALY FLUFFY',1),
(5,'COTE BOXY HOODIE ',79.95,'Pegador',1),
(6,'ATHLETICS GYM WITH PRINT',29.95,'Champion',2),
(7,'ROME TEE UNISEX',15.99,'YOURTURN',2),
(8,'SOLO TEE',59.95,'Nike Sportswear',2),
(9,'Camiseta estampada',49.99,'Pier One',2),
(10,'RAMEN TEE UNISEX',24.55,'ADIDAS ORIGINALS',2),
(11,'ADIBREAK UNISEX',74.95,'ADIDAS ORIGINALS',3),
(12,'Pantalones UNISEX',49.99,'YOURTURN',3),
(13,'PREY CASPER PANT UNISEX',119.95,'WASTED PARIS',3),
(14,'FOREST CAMO COLOSSUS UNISEX',97.99,'JADED LONDON',3),
(15,'Pantalones deportivos',48.95,'ADIDAS ORIGINALS',3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) DEFAULT '',
  `active` int(11) DEFAULT 1,
  `admin` int(11) DEFAULT 0,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL,
  `phone` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'mouzo','mouzo',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `size_label` varchar(10) NOT NULL,
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES
(1,1,'S',10),
(2,1,'M',0),
(3,1,'L',2),
(4,1,'XL',0),
(5,2,'S',3),
(6,2,'M',2),
(7,2,'L',3),
(8,2,'XL',1),
(9,3,'S',10),
(10,3,'M',5),
(11,3,'L',0),
(12,3,'XL',15),
(13,4,'S',5),
(14,4,'M',3),
(15,4,'L',2),
(16,4,'XL',15),
(18,5,'S',10),
(19,5,'M',0),
(20,5,'L',2),
(21,5,'XL',0),
(22,6,'S',12),
(23,6,'M',0),
(24,6,'L',2),
(25,6,'XL',0),
(26,7,'S',3),
(27,7,'M',5),
(28,7,'L',2),
(29,7,'XL',1),
(30,8,'S',2),
(31,8,'M',0),
(32,8,'L',3),
(33,8,'XL',0),
(34,9,'S',0),
(35,9,'M',0),
(36,9,'L',2),
(37,9,'XL',0),
(38,10,'S',2),
(39,10,'M',3),
(40,10,'L',2),
(41,10,'XL',10),
(42,11,'S',21),
(43,11,'M',3),
(44,11,'L',0),
(45,11,'XL',0),
(46,12,'S',12),
(47,12,'M',2),
(48,12,'L',2),
(49,12,'XL',10),
(50,13,'S',0),
(51,13,'M',0),
(52,13,'L',2),
(53,13,'XL',0),
(54,14,'S',10),
(55,14,'M',2),
(56,14,'L',0),
(57,14,'XL',10),
(58,15,'S',5),
(59,15,'M',5),
(60,15,'L',2),
(61,15,'XL',10);
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-19 13:48:21
