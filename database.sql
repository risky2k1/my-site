-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: botble
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'NE7KUueeq3xfRA2sf1IGTSB2MSdQN1dT',1,'2025-04-28 21:43:59','2025-04-28 21:43:59','2025-04-28 21:43:59');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `raw_content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `blocks_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'Prof. Daija Conn III','prof-daija-conn-iii','Enim illo velit dolor aut amet.','Eos distinctio explicabo odio ut et. Odio nostrum quidem illum et cum voluptas impedit. Nulla in ea id quos natus. Et voluptatum ea rerum pariatur nobis eius minima. Similique nostrum id ex. Quo et accusantium omnis et optio voluptatem. Doloremque aperiam molestiae labore et. Dicta minima esse mollitia delectus est. Dolorem soluta inventore quis ex est nihil. Et consequatur quas deserunt qui.','published',NULL,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL),(2,'Jabari Schultz','jabari-schultz','Et saepe ab sit porro atque.','Rerum iure iusto rerum modi adipisci ipsum. Rerum maxime sint hic laboriosam ipsum recusandae aut repellat. Dolore numquam deserunt cum possimus minus ad eveniet. Qui voluptatem iusto qui corporis. Consectetur totam unde optio eos culpa voluptas natus. Voluptatum nihil aut perferendis aut consectetur. Ut provident minima omnis magnam. Harum deserunt voluptas voluptate quidem voluptas. Soluta est sint sunt a architecto. Quis autem tenetur consectetur suscipit dignissimos sapiente.','published',NULL,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL),(3,'Madeline Christiansen','madeline-christiansen','Ipsam minus aut velit atque.','Dolorum voluptatem molestiae tempora iure vel voluptatem eos et. Dignissimos maiores sit necessitatibus dicta incidunt quas quis. Nisi labore aperiam mollitia saepe perspiciatis. Culpa quia quis qui minima blanditiis consequuntur. At est rem minima debitis et et. Cupiditate vel consequuntur non quis. Qui deserunt et ut quia omnis. Odio praesentium nemo quas. Minus ea sequi architecto maxime. Delectus voluptas dolore aut et.','published',NULL,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL),(4,'Lula Will Jr.','lula-will-jr','Quia distinctio id ab debitis impedit occaecati.','Tempore eum eaque id voluptas. Est vel sunt ducimus modi possimus incidunt. Tempore quis autem non sit et voluptatem. Non aut omnis ipsa dolor pariatur porro. Est unde nostrum ratione illum. Provident nihil eius molestiae. Ea adipisci quo nisi sint nobis ipsa natus. Optio sequi molestiae rerum harum qui quidem. Magni aspernatur nobis aliquam. Sunt quibusdam vero fuga eos consectetur tempora necessitatibus. Reprehenderit voluptatum voluptates dolore iste atque aliquam amet delectus.','published',NULL,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL),(5,'Ferne Legros','ferne-legros','Facilis rerum explicabo non soluta inventore et.','Omnis cumque dicta ipsa dolorem quas culpa accusamus. Reiciendis a minima eveniet repellendus totam rerum. Quia voluptas nulla soluta eaque quisquam vitae et. Explicabo sapiente architecto maxime cumque est qui sint aut. Fuga repellat rerum eum totam molestiae. Ut dolorum expedita qui soluta. Officia est accusantium et dolorem recusandae voluptate exercitationem iste. Ex repellendus quidem ex est culpa. Quia voluptas occaecati atque nostrum quae sit ipsum error.','published',NULL,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_translations`
--

DROP TABLE IF EXISTS `blocks_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocks_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `raw_content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`blocks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks_translations`
--

LOCK TABLES `blocks_translations` WRITE;
/*!40000 ALTER TABLE `blocks_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Artificial Intelligence',0,'Numquam vero pariatur expedita est porro exercitationem quibusdam. Quae voluptates similique quaerat ipsum maxime. Voluptate ut aut ipsum quo sunt facere eos.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(2,'Cybersecurity',0,'Illo dolorum vel rerum voluptas. Voluptate sint eligendi fuga tenetur. Molestiae ea voluptas porro et enim ut.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(3,'Blockchain Technology',0,'Quisquam non quae qui hic. Laudantium molestias possimus voluptas impedit.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(4,'5G and Connectivity',0,'Aut aut fugit aut fugiat perferendis. Eos enim aut id unde. Quod fugiat sapiente voluptas aspernatur aut debitis ad. Quas dolore fugiat autem maiores. Et architecto amet eligendi a velit veniam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(5,'Augmented Reality (AR)',0,'Ipsam voluptate voluptates tempora assumenda repellat eos veritatis. Dolores id enim repellendus et repellendus consectetur reiciendis. Blanditiis delectus qui ea sapiente at et sit nesciunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(6,'Green Technology',0,'Nesciunt voluptatem impedit assumenda voluptatibus quibusdam libero. Ratione tempora autem qui ut dignissimos repellendus. Ea aut amet maiores maxime ut iure. Vel quod similique quaerat ipsa.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'Quantum Computing',0,'Dolorem eum non quibusdam ex quia. Quia et quidem quia id eos in sit quia. Et dolor et repellat harum facilis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'Edge Computing',0,'Rerum nemo dignissimos quia at cumque odio. Aut et autem unde et sequi. Minus ullam rerum natus earum fugit. Nostrum beatae dolorem voluptas maxime.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Kyleigh Lockman','ysawayn@example.com','1-320-798-9315','4156 Kelvin Lane Apt. 452\nLake Dandrefort, MN 85688-8623','Corporis facilis corrupti dolorem perferendis.','Ex nobis facere assumenda soluta culpa. Aperiam quia quos qui suscipit reprehenderit unde. Adipisci non aut voluptatem doloremque sed quia eum. Quidem sed facere et autem delectus. Nihil aut quasi quos necessitatibus. Ad nisi rerum doloribus consequatur hic nostrum quam. Nostrum maiores voluptas architecto non animi vel. Eaque soluta sapiente officiis dolore doloremque est. Ut et ea id. Ut quaerat quia quia.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(2,'Dr. Lew Cartwright','solson@example.net','+1-210-250-5819','21075 Joannie Lodge\nEast Bruce, NM 88291-1672','Et officiis fugit saepe reprehenderit pariatur.','Eum est voluptate et. Ratione nihil laborum beatae voluptatem nisi qui atque repudiandae. Cupiditate nihil distinctio dignissimos exercitationem. Consequatur repellat esse et pariatur. Dolor iste ut eos in amet quia quibusdam. A consequatur laudantium est suscipit aut aliquam tempore. Ea aperiam in et neque dignissimos. Non aut quia enim similique ea nesciunt enim quod. Quibusdam aperiam impedit et ex.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(3,'Porter Balistreri','zena23@example.com','+1-774-235-5134','532 Schaden Squares Suite 142\nPollichtown, ND 36976-8468','Autem cupiditate alias sit enim.','Et ab ut omnis autem sed incidunt. Soluta aut eos ratione totam cumque. Rem deleniti ut et aperiam omnis dolore et. Nulla numquam cupiditate temporibus. Quis sapiente dolorem maiores maiores et dolores aut. Adipisci aut cumque fuga tenetur minima qui. Porro officiis illo aut consequatur. Accusamus a sed aliquam eos cum dolores. Excepturi consectetur nostrum in maiores. Vero similique sint natus quis optio. Voluptates doloribus delectus perspiciatis expedita delectus qui quibusdam consequatur.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(4,'Mr. Zechariah Welch','yskiles@example.net','+1.517.424.0762','84473 Spencer Drive\nEast Garland, IN 33853','Porro nesciunt minima vel autem fuga aut qui.','Iusto explicabo et illum praesentium voluptatum aut. Beatae quia dignissimos enim ut enim excepturi. Voluptatem doloribus itaque corrupti laborum consequatur. In eligendi hic veniam aut iusto perspiciatis nemo. Quo dolor sit distinctio ut quia. Odit magni voluptatem enim. Impedit deleniti exercitationem doloribus voluptatibus et minima sed. Illo et labore sed facere enim culpa ipsa nobis. Iure totam est quis aut consequatur.',NULL,'read','2025-04-28 21:44:08','2025-04-28 21:44:08'),(5,'Fay Stiedemann','lulu30@example.com','952.638.0409','2134 Rodriguez River Suite 779\nStromanmouth, TX 80971-3826','Corrupti cupiditate officiis et quibusdam sed.','Exercitationem voluptates voluptas nihil perspiciatis. Soluta voluptatem laborum sit at nisi dignissimos. Modi provident eveniet hic consequatur voluptatem quasi vel. Sunt est occaecati voluptas porro veritatis. Nostrum dolor vero sapiente et cupiditate est. Porro qui dolor iusto. Itaque tempore nulla incidunt natus architecto alias. Et rerum quam fugit libero. Ea quasi deserunt non rem aut maiores quasi. Ipsum nisi et non ullam vel accusamus et.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(6,'Vada Kemmer','oharvey@example.net','+1-574-232-8849','85796 Elena Tunnel\nWest Dollyton, PA 67440-5716','Sit quaerat ut sed aut non.','Voluptas voluptatem qui nesciunt architecto distinctio quam perspiciatis et. Dignissimos veritatis totam omnis modi voluptas sed. Enim eum ea harum iure dolor. Laboriosam quia necessitatibus qui laudantium sit et. Ipsum et ab a repellendus. Nobis sit maiores eaque ut. Ut architecto rerum dolorem sunt eos est. Et voluptas doloremque eos omnis rerum et iusto. Eligendi magni ut id. Accusamus quo commodi ullam consequatur.',NULL,'read','2025-04-28 21:44:08','2025-04-28 21:44:08'),(7,'Dr. Devan Gusikowski DDS','yohara@example.net','(908) 621-1252','97197 Dora Isle Suite 419\nEast Cordie, OR 65356-2554','Placeat non ipsam aut quasi iste non.','Doloremque quasi quod at quia et quo occaecati. Distinctio dolores architecto odio ducimus laborum. Enim perferendis veniam nihil iste. Nisi qui id omnis fuga totam. In ut vero velit expedita officiis odio. Impedit repellendus iste sunt. Rem cum mollitia dicta est perferendis. Eum fugiat unde modi esse ad rerum ea. Adipisci repudiandae tempora nihil sit repellat sunt quae. Exercitationem alias nesciunt et officia ut sint in.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(8,'Jaiden Aufderhar V','verner26@example.org','901-914-3882','57681 Torphy Ports Apt. 554\nNew Teagan, CA 51210','Atque quia totam et esse assumenda eum qui.','Dolorum similique dignissimos fugit nihil. Maxime veritatis eaque impedit debitis veritatis commodi. Facilis tempora et cum ex possimus asperiores dolores rerum. Nostrum dolor occaecati odit voluptatem asperiores architecto. Quia minima debitis ut sequi dolore. Voluptatibus earum esse qui error eum et et.',NULL,'read','2025-04-28 21:44:08','2025-04-28 21:44:08'),(9,'Wendell Hill','kherman@example.com','+1 (304) 843-7563','52531 Dickens Ports\nEast Elbert, DE 19110','Sit sit ea sequi vel ut et ut.','Eos est nemo voluptatem consequatur. Vero quod placeat similique quibusdam pariatur dicta. Quos adipisci tempora voluptate amet reiciendis. Quis voluptas quidem distinctio soluta et tenetur quia. Non odio expedita et aut laborum eum odit blanditiis. Quibusdam deserunt in aperiam quod vero rerum. Iure voluptatem tempore mollitia. Enim reprehenderit odit sequi et accusamus ad perspiciatis. Voluptatum et voluptatem qui nostrum odit velit possimus.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08'),(10,'Valerie Schuppe','dino.abernathy@example.net','754-425-9595','5732 Merritt Plains\nDarrelview, OR 60542','Id et ipsum aut.','Praesentium nesciunt ab laudantium nisi mollitia minima. Explicabo ipsa harum voluptatum non aut perferendis in quia. Voluptas ipsam nostrum et officiis. Minus rerum mollitia odio quae facilis voluptas. Veritatis sunt accusamus ea dolores. Nobis iure est non iusto ea. Totam assumenda similique et vitae voluptatibus exercitationem magnam.',NULL,'unread','2025-04-28 21:44:08','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `use_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_for_id` bigint unsigned NOT NULL,
  `field_item_id` bigint unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_fields_field_item_id_index` (`field_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_translations`
--

DROP TABLE IF EXISTS `custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_translations`
--

LOCK TABLES `custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_groups`
--

DROP TABLE IF EXISTS `field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_groups_created_by_index` (`created_by`),
  KEY `field_groups_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_groups`
--

LOCK TABLES `field_groups` WRITE;
/*!40000 ALTER TABLE `field_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_items`
--

DROP TABLE IF EXISTS `field_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `order` int DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `field_items_field_group_id_index` (`field_group_id`),
  KEY `field_items_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_items`
--

LOCK TABLES `field_items` WRITE;
/*!40000 ALTER TABLE `field_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_comments`
--

DROP TABLE IF EXISTS `fob_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reply_to` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_comments_author_type_author_id_index` (`author_type`,`author_id`),
  KEY `fob_comments_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `fob_comments_reply_to_index` (`reply_to`),
  KEY `fob_comments_reference_url_index` (`reference_url`),
  KEY `fob_comments_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_comments`
--

LOCK TABLES `fob_comments` WRITE;
/*!40000 ALTER TABLE `fob_comments` DISABLE KEYS */;
INSERT INTO `fob_comments` VALUES (1,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Brenna Christiansen','jmante@langosh.com','https://friendsofbotble.com','This is really helpful, thank you!','approved','94.88.145.225','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5362 (KHTML, like Gecko) Chrome/37.0.898.0 Mobile Safari/5362','2025-03-30 04:06:01','2025-04-28 21:44:08'),(2,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',12,'https://botble.test','Brionna Bergnaum II','emmanuel.nitzsche@stanton.org','https://friendsofbotble.com','I found this article to be quite informative.','approved','7.200.146.101','Mozilla/5.0 (compatible; MSIE 11.0; Windows 98; Win 9x 4.90; Trident/5.1)','2025-04-28 04:33:55','2025-04-28 21:44:08'),(3,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',5,'https://botble.test','Allie Prosacco MD','muriel76@block.info','https://friendsofbotble.com','Wow, I never knew about this before!','approved','232.235.86.254','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_7_1) AppleWebKit/5350 (KHTML, like Gecko) Chrome/39.0.842.0 Mobile Safari/5350','2025-03-31 06:40:26','2025-04-28 21:44:08'),(4,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Waldo Gibson','alden35@hotmail.com','https://friendsofbotble.com','Great job on explaining such a complex topic.','approved','100.72.40.221','Mozilla/5.0 (Windows; U; Windows NT 5.2) AppleWebKit/532.29.7 (KHTML, like Gecko) Version/5.0 Safari/532.29.7','2025-04-10 12:13:01','2025-04-28 21:44:08'),(5,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Madilyn Kohler','wdicki@yahoo.com','https://friendsofbotble.com','I have a question about the third paragraph.','approved','83.227.196.45','Opera/9.70 (X11; Linux x86_64; sl-SI) Presto/2.10.191 Version/10.00','2025-03-30 06:06:37','2025-04-28 21:44:08'),(6,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',5,'https://botble.test','Mrs. Claire Kunde','norberto.cummerata@runte.com','https://friendsofbotble.com','This article changed my perspective entirely.','approved','197.176.224.54','Opera/9.11 (X11; Linux i686; sl-SI) Presto/2.8.201 Version/10.00','2025-04-07 12:33:45','2025-04-28 21:44:08'),(7,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',2,'https://botble.test','Allie Carter','bahringer.jody@hotmail.com','https://friendsofbotble.com','I appreciate the effort you put into this.','approved','219.133.220.76','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_6_3 rv:5.0) Gecko/20110821 Firefox/36.0','2025-04-01 13:37:33','2025-04-28 21:44:08'),(8,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Arch Ortiz I','jacinthe06@koepp.com','https://friendsofbotble.com','This is exactly what I was looking for, thank you!','approved','132.173.89.40','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_9) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/82.0.4826.93 Safari/532.1 Edg/82.01117.70','2025-04-03 14:02:56','2025-04-28 21:44:08'),(9,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Harmony Mayert','henry.conroy@hotmail.com','https://friendsofbotble.com','I disagree with some points mentioned here, though.','approved','116.205.78.70','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5330 (KHTML, like Gecko) Chrome/36.0.889.0 Mobile Safari/5330','2025-04-25 23:20:23','2025-04-28 21:44:08'),(10,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',2,'https://botble.test','Charley Jaskolski PhD','layne.rogahn@okeefe.com','https://friendsofbotble.com','Could you provide more examples to illustrate your point?','approved','174.174.247.165','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_9 rv:3.0; nl-NL) AppleWebKit/531.28.5 (KHTML, like Gecko) Version/4.0 Safari/531.28.5','2025-04-20 01:39:47','2025-04-28 21:44:08'),(11,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',11,'https://botble.test','Kellie Toy','jkoss@murphy.com','https://friendsofbotble.com','I wish there were more articles like this out there.','approved','115.31.130.235','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_5_3 rv:6.0) Gecko/20111008 Firefox/36.0','2025-04-18 17:04:02','2025-04-28 21:44:08'),(12,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',8,'https://botble.test','Rhiannon Beahan','upton.hollis@yahoo.com','https://friendsofbotble.com','I\'m bookmarking this for future reference.','approved','187.193.196.188','Opera/8.60 (Windows 98; nl-NL) Presto/2.8.230 Version/12.00','2025-04-09 22:45:28','2025-04-28 21:44:08'),(13,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Miss Zula Gulgowski','langosh.johan@grady.biz','https://friendsofbotble.com','I\'ve shared this with my friends, they loved it!','approved','217.217.149.92','Opera/9.58 (Windows NT 5.1; en-US) Presto/2.9.199 Version/12.00','2025-04-06 06:22:35','2025-04-28 21:44:08'),(14,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',9,'https://botble.test','Jeffry Bradtke','selena62@towne.biz','https://friendsofbotble.com','This article is a must-read for everyone interested in the topic.','approved','34.44.105.237','Mozilla/5.0 (compatible; MSIE 8.0; Windows CE; Trident/4.0)','2025-04-03 03:09:56','2025-04-28 21:44:08'),(15,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Miss Karli Willms','jovan88@tromp.org','https://friendsofbotble.com','Thank you for shedding light on this important issue.','approved','76.106.58.103','Mozilla/5.0 (iPhone; CPU iPhone OS 13_0 like Mac OS X) AppleWebKit/537.2 (KHTML, like Gecko) Version/15.0 EdgiOS/91.01133.53 Mobile/15E148 Safari/537.2','2025-04-01 16:03:09','2025-04-28 21:44:08'),(16,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Marie Kris','leonor93@gmail.com','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article.','approved','65.49.121.184','Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/5.0)','2025-04-09 09:50:29','2025-04-28 21:44:08'),(17,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Michel Zboncak IV','igrant@davis.com','https://friendsofbotble.com','I\'m blown away by the insights shared in this article.','approved','10.213.4.159','Mozilla/5.0 (Windows NT 5.1; nl-NL; rv:1.9.1.20) Gecko/20111115 Firefox/37.0','2025-04-09 10:41:53','2025-04-28 21:44:08'),(18,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Mollie Veum','alfredo.mertz@hotmail.com','https://friendsofbotble.com','This article tackles a complex topic with clarity.','approved','191.246.60.159','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_6 rv:4.0) Gecko/20140313 Firefox/37.0','2025-04-16 11:02:17','2025-04-28 21:44:08'),(19,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Sarina Cronin','clotilde.ferry@gmail.com','https://friendsofbotble.com','I\'m going to reflect on the ideas presented in this article.','approved','203.249.20.201','Opera/8.63 (X11; Linux i686; sl-SI) Presto/2.10.329 Version/10.00','2025-04-27 07:18:58','2025-04-28 21:44:08'),(20,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',9,'https://botble.test','Dr. Sophie Koch','tquitzon@hotmail.com','https://friendsofbotble.com','The author\'s passion for the subject shines through in this article.','approved','112.163.124.1','Mozilla/5.0 (iPad; CPU OS 7_1_2 like Mac OS X; sl-SI) AppleWebKit/535.42.6 (KHTML, like Gecko) Version/3.0.5 Mobile/8B118 Safari/6535.42.6','2025-04-17 00:16:30','2025-04-28 21:44:08'),(21,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',1,'https://botble.test','Corene Rolfson','schultz.verlie@hotmail.com','https://friendsofbotble.com','This article challenged my preconceptions in a thought-provoking way.','approved','105.31.107.244','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_7 rv:3.0) Gecko/20141221 Firefox/37.0','2025-04-16 17:06:27','2025-04-28 21:44:08'),(22,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Damian Boyer Sr.','melisa77@gmail.com','https://friendsofbotble.com','I\'ve added this article to my reading list, it\'s worth revisiting.','approved','209.89.112.83','Opera/8.82 (X11; Linux x86_64; nl-NL) Presto/2.9.282 Version/12.00','2025-04-14 04:39:51','2025-04-28 21:44:08'),(23,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',8,'https://botble.test','Ellen Wisoky','swaniawski.remington@parker.com','https://friendsofbotble.com','This article offers practical advice that I can apply in real life.','approved','124.49.168.67','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.1; Trident/4.0)','2025-03-30 18:45:37','2025-04-28 21:44:08'),(24,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Anjali Mertz DVM','hoppe.jenifer@yahoo.com','https://friendsofbotble.com','I\'m going to recommend this article to my study group.','approved','3.168.20.233','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5362 (KHTML, like Gecko) Chrome/37.0.868.0 Mobile Safari/5362','2025-04-24 17:21:03','2025-04-28 21:44:08'),(25,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',5,'https://botble.test','Frieda Zieme','lehner.luella@kulas.biz','https://friendsofbotble.com','The examples provided really helped me understand the concept better.','approved','151.135.133.56','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 4.0; Trident/5.0)','2025-04-27 17:22:00','2025-04-28 21:44:08'),(26,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Nikki Ernser I','vrolfson@schinner.net','https://friendsofbotble.com','I resonate with the ideas presented here.','approved','134.148.206.162','Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 4.0; Trident/4.0)','2025-04-11 13:41:52','2025-04-28 21:44:08'),(27,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',11,'https://botble.test','Arvilla Howe','dgutmann@hotmail.com','https://friendsofbotble.com','This article made me think critically about the topic.','approved','67.188.38.236','Mozilla/5.0 (iPhone; CPU iPhone OS 15_2 like Mac OS X) AppleWebKit/535.1 (KHTML, like Gecko) Version/15.0 EdgiOS/98.01098.22 Mobile/15E148 Safari/535.1','2025-03-29 13:14:06','2025-04-28 21:44:08'),(28,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',11,'https://botble.test','Dr. Christa Rath I','amani.gaylord@renner.net','https://friendsofbotble.com','I\'ll definitely come back to this article for reference.','approved','141.156.169.253','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20180908 Firefox/35.0','2025-04-02 13:33:52','2025-04-28 21:44:08'),(29,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',20,'https://botble.test','Mr. Prince Hauck DDS','schoen.angelo@hotmail.com','https://friendsofbotble.com','I\'ve shared this on social media, it\'s too good not to share.','approved','233.132.111.222','Mozilla/5.0 (Windows 98; sl-SI; rv:1.9.0.20) Gecko/20130624 Firefox/35.0','2025-04-13 07:47:03','2025-04-28 21:44:08'),(30,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Nicholaus Considine','sabryna.schulist@feeney.net','https://friendsofbotble.com','This article presents a balanced view on a controversial topic.','approved','152.158.0.180','Opera/9.15 (Windows CE; en-US) Presto/2.9.231 Version/12.00','2025-03-29 23:22:49','2025-04-28 21:44:08'),(31,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',20,'https://botble.test','Camron VonRueden I','robert.murazik@yahoo.com','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s a gem.','approved','119.16.128.49','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0 rv:3.0; nl-NL) AppleWebKit/535.26.7 (KHTML, like Gecko) Version/5.0.3 Safari/535.26.7','2025-04-14 09:40:13','2025-04-28 21:44:08'),(32,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Alexys Cormier','okohler@swift.info','https://friendsofbotble.com','I\'ve been struggling with this, your article helped a lot.','approved','64.102.154.60','Mozilla/5.0 (Windows NT 5.01) AppleWebKit/5311 (KHTML, like Gecko) Chrome/37.0.871.0 Mobile Safari/5311','2025-04-06 13:31:17','2025-04-28 21:44:08'),(33,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',4,'https://botble.test','Ariel Feest','anderson.antonio@donnelly.com','https://friendsofbotble.com','I\'ve learned something new today, thanks to this article.','approved','11.83.95.1','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_6_5) AppleWebKit/536.1 (KHTML, like Gecko) Chrome/92.0.4772.98 Safari/536.1 Edg/92.01142.2','2025-04-15 00:09:06','2025-04-28 21:44:08'),(34,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',7,'https://botble.test','Kieran VonRueden','amaya20@toy.net','https://friendsofbotble.com','Kudos to the author for a well-researched piece.','approved','115.5.110.221','Mozilla/5.0 (Windows NT 4.0) AppleWebKit/5322 (KHTML, like Gecko) Chrome/39.0.861.0 Mobile Safari/5322','2025-04-27 08:52:44','2025-04-28 21:44:08'),(35,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',1,'https://botble.test','Camryn Hoeger','barrows.camylle@mills.com','https://friendsofbotble.com','I\'m impressed by the depth of knowledge demonstrated here.','approved','15.222.234.207','Mozilla/5.0 (Windows NT 6.0) AppleWebKit/5352 (KHTML, like Gecko) Chrome/38.0.882.0 Mobile Safari/5352','2025-04-26 11:59:12','2025-04-28 21:44:08'),(36,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Francisco Schiller','snienow@hagenes.biz','https://friendsofbotble.com','This article challenged my assumptions in a good way.','approved','52.116.75.96','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 6.0; Trident/3.0)','2025-04-11 14:15:07','2025-04-28 21:44:08'),(37,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Mr. Zack Kuphal','ottilie.streich@hotmail.com','https://friendsofbotble.com','I\'ve shared this with my colleagues, it\'s worth discussing.','approved','230.168.58.11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5360 (KHTML, like Gecko) Chrome/39.0.861.0 Mobile Safari/5360','2025-04-08 10:27:19','2025-04-28 21:44:08'),(38,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Agustin Wisoky','auer.verna@stanton.org','https://friendsofbotble.com','The information presented here is very valuable.','approved','17.148.127.251','Mozilla/5.0 (compatible; MSIE 7.0; Windows 98; Win 9x 4.90; Trident/3.1)','2025-04-23 02:25:33','2025-04-28 21:44:08'),(39,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',7,'https://botble.test','Mr. Austyn Senger','wiley.hill@hotmail.com','https://friendsofbotble.com','You have a talent for explaining complex topics clearly.','approved','132.88.213.149','Mozilla/5.0 (compatible; MSIE 9.0; Windows 98; Win 9x 4.90; Trident/4.1)','2025-04-03 03:45:03','2025-04-28 21:44:08'),(40,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',5,'https://botble.test','Cali Ernser Sr.','triston.walsh@white.biz','https://friendsofbotble.com','I\'m inspired to learn more about this after reading your article.','approved','176.220.159.199','Mozilla/5.0 (iPad; CPU OS 8_0_1 like Mac OS X; nl-NL) AppleWebKit/533.47.7 (KHTML, like Gecko) Version/3.0.5 Mobile/8B113 Safari/6533.47.7','2025-04-22 13:21:10','2025-04-28 21:44:08'),(41,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Katelyn Gibson','lowe.lora@vandervort.com','https://friendsofbotble.com','This article deserves wider recognition.','approved','12.106.172.5','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5321 (KHTML, like Gecko) Chrome/39.0.867.0 Mobile Safari/5321','2025-04-07 15:39:58','2025-04-28 21:44:08'),(42,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Jacynthe Hermiston','lbogan@fritsch.com','https://friendsofbotble.com','I\'m grateful for the insights shared in this piece.','approved','30.198.107.62','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_5 rv:6.0; en-US) AppleWebKit/535.44.5 (KHTML, like Gecko) Version/4.0 Safari/535.44.5','2025-03-31 07:34:32','2025-04-28 21:44:08'),(43,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',8,'https://botble.test','Zackery Pagac DDS','linnea67@kuhic.com','https://friendsofbotble.com','The author presents a balanced view on a controversial topic.','approved','243.44.162.72','Mozilla/5.0 (Windows NT 4.0; sl-SI; rv:1.9.0.20) Gecko/20150530 Firefox/35.0','2025-04-05 00:59:24','2025-04-28 21:44:08'),(44,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Monserrate Hoeger','yasmeen49@hotmail.com','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s','approved','242.209.19.36','Mozilla/5.0 (Windows CE) AppleWebKit/5312 (KHTML, like Gecko) Chrome/40.0.805.0 Mobile Safari/5312','2025-04-27 21:58:45','2025-04-28 21:44:08'),(45,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Luther Braun','reilly.jovani@larkin.com','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article. It\'s incredibly insightful and provides a comprehensive overview of the subject matter. I appreciate the effort put into researching and writing this piece. It\'s truly eye-opening and has given me a new perspective. Thank you for sharing your knowledge with us!','approved','26.67.184.204','Mozilla/5.0 (Windows 98; Win 9x 4.90) AppleWebKit/5350 (KHTML, like Gecko) Chrome/37.0.867.0 Mobile Safari/5350','2025-04-01 12:57:30','2025-04-28 21:44:08'),(46,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Lamont Leuschke','alysson.waters@heidenreich.com','https://friendsofbotble.com','This article is a masterpiece! It dives deep into the topic and offers valuable insights that are both thought-provoking and enlightening. The author\'s expertise is evident throughout, making it a compelling read from start to finish. I\'ll definitely be coming back to this for reference in the future.','approved','193.74.124.82','Mozilla/5.0 (Windows NT 5.01) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/98.0.4398.29 Safari/537.1 Edg/98.01068.76','2025-03-30 19:27:38','2025-04-28 21:44:08'),(47,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',2,'https://botble.test','Napoleon Collier','ogleichner@reichert.org','https://friendsofbotble.com','I\'m amazed by the depth of analysis in this article. It covers a wide range of aspects related to the topic, providing a comprehensive understanding. The clarity of explanation is commendable, making complex concepts easy to grasp. This article has enriched my understanding and sparked further curiosity. Kudos to the author!','approved','123.43.125.193','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 4.0; Trident/4.0)','2025-04-26 14:59:46','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `fob_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Sunset','Rerum eligendi vel fuga aliquid. Nisi facilis omnis sit amet aut. Sint enim repellendus id voluptates consequatur et adipisci.',1,0,'news/6.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(2,'Ocean Views','Sit fuga nulla saepe. Voluptas laborum atque dolor aut. Maxime impedit veritatis fuga perspiciatis modi. Similique earum soluta fugit id.',1,0,'news/7.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(3,'Adventure Time','Repellendus culpa a eum numquam ut odio molestiae quos. Porro laborum sed nam fugit. Adipisci doloremque excepturi fugiat.',1,0,'news/8.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(4,'City Lights','Eligendi error vel natus consequatur nulla. Dolor et autem commodi error nobis. Molestiae nulla et et libero in ut.',1,0,'news/9.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(5,'Dreamscape','Dolore asperiores enim sunt omnis illum officiis qui. Qui laborum est nihil ex rerum facere minus. Quibusdam consequatur corporis iste aperiam.',1,0,'news/10.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(6,'Enchanted Forest','Praesentium qui occaecati non a ducimus. Cumque voluptatem blanditiis et. Deserunt recusandae unde error et voluptatum. Officiis ex rerum ut debitis.',1,0,'news/11.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'Golden Hour','Ut omnis laudantium minima iusto impedit. Ducimus qui exercitationem et molestiae non hic qui hic. Fugit veritatis voluptates temporibus aliquid.',0,0,'news/12.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'Serenity','Labore ipsum sunt qui autem et deleniti. Neque beatae minima voluptatum rerum aut.',0,0,'news/13.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(9,'Eternal Beauty','Consectetur odit dolorum rerum neque est. Tempore voluptas asperiores nihil quia. Impedit perspiciatis iure labore corrupti est praesentium.',0,0,'news/14.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(10,'Moonlight Magic','Libero explicabo dolorum est doloremque quod est at. Totam qui delectus et qui laboriosam sed at. Iusto vel enim ipsa.',0,0,'news/15.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(11,'Starry Night','Architecto quo est est. Pariatur qui rem explicabo voluptatem sequi. Dolorem provident reprehenderit omnis veniam totam cumque magni.',0,0,'news/16.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(12,'Hidden Gems','Nihil aut animi laboriosam nihil. Veritatis enim ipsa cupiditate itaque ex. Ad error sed ab commodi iure ut assumenda.',0,0,'news/17.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(13,'Tranquil Waters','Quidem consectetur vel ratione sed. Aut reprehenderit error in vero dolores libero. Neque assumenda nihil id quo voluptas laborum iure aliquam.',0,0,'news/18.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(14,'Urban Escape','Quidem in quos et nihil. Et dolor et voluptates enim minus. Sit natus sit eaque molestiae repudiandae id esse enim.',0,0,'news/19.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(15,'Twilight Zone','Ut dolores totam sint officiis culpa non. Non aperiam consectetur et sed adipisci consequatur aut. Placeat nemo doloremque vero ducimus.',0,0,'news/20.jpg',1,'published','2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(2,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(3,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(4,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(5,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(6,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',7,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',8,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(9,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',9,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(10,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',10,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(11,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',11,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(12,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',12,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(13,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',13,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(14,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',14,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02'),(15,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Et est tenetur tenetur ipsa. Asperiores nihil ut a. Dicta quis omnis quo voluptas nostrum quasi dolores.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Aperiam ratione hic rerum voluptatum voluptas occaecati omnis. Ut deleniti voluptate assumenda laboriosam. Et et minima et eveniet vero iusto unde.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Delectus sit ut qui neque sunt fuga. Ullam animi aut aliquam reprehenderit voluptatem rem. Vel totam fugit est dicta. Et et aut expedita vero et vel.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Quidem inventore et quia error vero. Ab adipisci consequuntur occaecati dolorem fugit. Ab est consectetur repellat vitae.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Officia necessitatibus officia autem veniam. Numquam quo qui ipsum porro aliquam in consectetur ducimus. Minima quis quas et soluta ut quasi rerum.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Quo maiores odio voluptate occaecati eveniet. Aut sit non recusandae aut libero vitae recusandae. Alias tempora atque velit fugit error cupiditate.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Veniam autem facere est omnis fugit odit consequatur ullam. Atque quia aut ea in. Sit aut nesciunt ipsa qui nesciunt.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Assumenda tenetur neque ad velit possimus sed minima. Et sit totam iusto quaerat nihil. Quod distinctio et est qui dolorem omnis quidem.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Iusto ipsam nihil error. Error eius aliquam voluptas velit. Voluptate aut dolore dolore ut quia. Et velit laudantium magnam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui modi deleniti explicabo qui porro. Blanditiis vel cupiditate quaerat illum est officia. Mollitia beatae illum qui sed maiores quae non.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Quam commodi et voluptatem delectus maiores recusandae. Architecto soluta culpa dolorem iure. Eum sunt sapiente asperiores voluptas.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Id itaque eos architecto nobis voluptas in est. Explicabo odio voluptate cupiditate. Occaecati et dolore omnis ut omnis corporis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Earum ea optio sit rem. Accusantium tempora alias debitis suscipit. Culpa dolorem dolores illo nisi non. Explicabo voluptas deleniti sunt doloremque.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Culpa facilis sit iusto magnam harum minus atque. Eum iusto velit ex. Fugit nihil corrupti vitae sint.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Similique cumque quis in magni quia. Sed dolorem quis et. Quaerat pariatur beatae quisquam atque et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Omnis minima ut quo labore unde mollitia. Pariatur porro ratione minus possimus consequatur. Consequatur repudiandae qui qui optio.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam perferendis provident sunt quia. Officia sunt ducimus asperiores maiores est. Aut animi dolorem ut. Voluptatem sunt eum eveniet voluptatem.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Cumque beatae accusantium earum sed. Sed sint non quidem itaque ex iure ut. Laborum aut in maiores voluptatem et. Iusto non impedit et cum.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Ipsum non quod ullam enim. Aut iste molestiae sint. Aut tempore delectus corporis incidunt exercitationem assumenda.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Debitis ut nesciunt impedit eius ullam qui. Eos qui animi sapiente et delectus. Dicta sit non ipsa quam. Aut suscipit cumque earum.\"}]',15,'Botble\\Gallery\\Models\\Gallery','2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','459f78fd1ad78b0554dfd711c714f2d9',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','6ceade6b47ca72a36cc668100a661db8',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','efe107c6ad63fd2b295eea146b872a27',2,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',9803,'news/1.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(2,0,'10','10',1,'image/jpeg',9803,'news/10.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(3,0,'11','11',1,'image/jpeg',9803,'news/11.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(4,0,'12','12',1,'image/jpeg',9803,'news/12.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(5,0,'13','13',1,'image/jpeg',9803,'news/13.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(6,0,'14','14',1,'image/jpeg',9803,'news/14.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(7,0,'15','15',1,'image/jpeg',9803,'news/15.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(8,0,'16','16',1,'image/jpeg',9803,'news/16.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(9,0,'17','17',1,'image/jpeg',9803,'news/17.jpg','[]','2025-04-28 21:44:00','2025-04-28 21:44:00',NULL,'public'),(10,0,'18','18',1,'image/jpeg',9803,'news/18.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(11,0,'19','19',1,'image/jpeg',9803,'news/19.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(12,0,'2','2',1,'image/jpeg',9803,'news/2.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(13,0,'20','20',1,'image/jpeg',9803,'news/20.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(14,0,'3','3',1,'image/jpeg',9803,'news/3.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(15,0,'4','4',1,'image/jpeg',9803,'news/4.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(16,0,'5','5',1,'image/jpeg',9803,'news/5.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(17,0,'6','6',1,'image/jpeg',9803,'news/6.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(18,0,'7','7',1,'image/jpeg',9803,'news/7.jpg','[]','2025-04-28 21:44:01','2025-04-28 21:44:01',NULL,'public'),(19,0,'8','8',1,'image/jpeg',9803,'news/8.jpg','[]','2025-04-28 21:44:02','2025-04-28 21:44:02',NULL,'public'),(20,0,'9','9',1,'image/jpeg',9803,'news/9.jpg','[]','2025-04-28 21:44:02','2025-04-28 21:44:02',NULL,'public'),(21,0,'1','1',2,'image/jpeg',9803,'members/1.jpg','[]','2025-04-28 21:44:02','2025-04-28 21:44:02',NULL,'public'),(22,0,'10','10',2,'image/jpeg',9803,'members/10.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(23,0,'11','11',2,'image/jpeg',9803,'members/11.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(24,0,'12','12',2,'image/jpeg',9803,'members/12.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(25,0,'13','13',2,'image/jpeg',9803,'members/13.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(26,0,'14','14',2,'image/jpeg',9803,'members/14.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(27,0,'15','15',2,'image/jpeg',9803,'members/15.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(28,0,'2','2',2,'image/jpeg',9803,'members/2.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(29,0,'3','3',2,'image/jpeg',9803,'members/3.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(30,0,'4','4',2,'image/jpeg',9803,'members/4.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(31,0,'5','5',2,'image/jpeg',9803,'members/5.jpg','[]','2025-04-28 21:44:03','2025-04-28 21:44:03',NULL,'public'),(32,0,'6','6',2,'image/jpeg',9803,'members/6.jpg','[]','2025-04-28 21:44:04','2025-04-28 21:44:04',NULL,'public'),(33,0,'7','7',2,'image/jpeg',9803,'members/7.jpg','[]','2025-04-28 21:44:04','2025-04-28 21:44:04',NULL,'public'),(34,0,'8','8',2,'image/jpeg',9803,'members/8.jpg','[]','2025-04-28 21:44:04','2025-04-28 21:44:04',NULL,'public'),(35,0,'9','9',2,'image/jpeg',9803,'members/9.jpg','[]','2025-04-28 21:44:04','2025-04-28 21:44:04',NULL,'public'),(36,0,'favicon','favicon',3,'image/png',1122,'general/favicon.png','[]','2025-04-28 21:44:08','2025-04-28 21:44:08',NULL,'public'),(37,0,'logo','logo',3,'image/png',46109,'general/logo.png','[]','2025-04-28 21:44:08','2025-04-28 21:44:08',NULL,'public'),(38,0,'preloader','preloader',3,'image/gif',92769,'general/preloader.gif','[]','2025-04-28 21:44:09','2025-04-28 21:44:09',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2025-04-28 21:43:59','2025-04-28 21:43:59',NULL),(2,0,'members',NULL,'members',0,'2025-04-28 21:44:02','2025-04-28 21:44:02',NULL),(3,0,'general',NULL,'general',0,'2025-04-28 21:44:08','2025-04-28 21:44:08',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Lowell','Conn',NULL,NULL,'member@gmail.com','$2y$12$bRCa5pBJx4aKegIVuUSgIuoGrcyeN0EFIp/vMftKK6uzZS3c0IWiu',21,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(2,'Hettie','Morissette',NULL,NULL,'dadams@gmail.com','$2y$12$2JwZ2..aPwci2jLdTVoXjeDC4WjeOwVKOMoUqG3hCkCvnny6FbhPC',22,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(3,'Donna','Franecki',NULL,NULL,'eugene.rosenbaum@langworth.com','$2y$12$.5zXeqLW3mmoL/X4w7horuiqXJhZHLcCuyzRc5dWWodlYl5.pZ1wK',23,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(4,'Jennyfer','McKenzie',NULL,NULL,'jmorissette@gmail.com','$2y$12$Q7dqIiW/xZecDBf4EERJjubts5zmTYtnqxBz3U4mM/6kgh50T4X1C',24,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(5,'Ashtyn','Hahn',NULL,NULL,'mhermiston@gmail.com','$2y$12$AQYn60zqOaozu7r3NS7/sOcGzyVvFuB.ALWOnmUFwcgKl75fK3mLe',25,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(6,'Ray','Weimann',NULL,NULL,'titus33@yahoo.com','$2y$12$PMWIaNtMBTNHkKfdojcPTuqnDW8oeOCdMtGWDGrz21AkbmAZ2Rw36',26,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(7,'Brennan','Jacobs',NULL,NULL,'kiarra37@gmail.com','$2y$12$VYUdA53UKQ8VSMaywbLnBu6UpFbw5JTLPQ1c4zUb..jBmEeb95IKW',27,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(8,'Cyrus','Lang',NULL,NULL,'gudrun30@jaskolski.info','$2y$12$Tz13pIOQ096piG/p03U8eOYfGf4hJklWwXhVsTe9ehF84PXTvkOSq',28,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(9,'Declan','Lehner',NULL,NULL,'cschamberger@gmail.com','$2y$12$1w2bK68yiwB2c3ytZtvYw.RrQmle1LZqRJiArnyhwpj0U1HwzKgdO',29,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(10,'Nellie','Gislason',NULL,NULL,'woodrow97@emmerich.com','$2y$12$gag1K0pSGV4w2.NpP/J.GuNSailCSJLYZYWROZfE2DDuEO94fwLr.',30,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published'),(11,'John','Smith',NULL,NULL,'john.smith@botble.com','$2y$12$sfV16lOGfBKS65IZJmqzJe5T3pPtG4asClFQUFjK4MQhjJSMRaYN.',31,NULL,NULL,'2025-04-29 04:44:04',NULL,NULL,'2025-04-28 21:44:04','2025-04-28 21:44:04','published');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-04-28 21:44:08','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(2,1,0,NULL,NULL,'https://botble.com/go/download-cms',NULL,1,'Purchase',NULL,'_blank',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(3,1,0,2,'Botble\\Page\\Models\\Page','/blog',NULL,2,'Blog',NULL,'_self',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(4,1,0,5,'Botble\\Page\\Models\\Page','/galleries',NULL,3,'Galleries',NULL,'_self',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(5,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,4,'Contact',NULL,'_self',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(6,2,0,NULL,NULL,'https://facebook.com','ti ti-brand-facebook',0,'Facebook',NULL,'_blank',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(7,2,0,NULL,NULL,'https://twitter.com','ti ti-brand-x',1,'Twitter',NULL,'_blank',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(8,2,0,NULL,NULL,'https://github.com','ti ti-brand-github',2,'GitHub',NULL,'_blank',0,'2025-04-28 21:44:08','2025-04-28 21:44:08'),(9,2,0,NULL,NULL,'https://linkedin.com','ti ti-brand-linkedin',3,'Linkedin',NULL,'_blank',0,'2025-04-28 21:44:08','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-04-28 21:44:08','2025-04-28 21:44:08'),(2,'Social','social','published','2025-04-28 21:44:08','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(36,'2024_07_12_100000_change_random_hash_for_media',1),(37,'2024_09_30_024515_create_sessions_table',1),(38,'2024_04_27_100730_improve_analytics_setting',2),(39,'2015_06_29_025744_create_audit_history',3),(40,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(41,'2025_04_03_000001_add_user_type_to_audit_histories_table',3),(42,'2017_02_13_034601_create_blocks_table',4),(43,'2021_12_03_081327_create_blocks_translations',4),(44,'2024_09_05_071942_add_raw_content_to_blocks_table',4),(45,'2015_06_18_033822_create_blog_table',5),(46,'2021_02_16_092633_remove_default_value_for_author_type',5),(47,'2021_12_03_030600_create_blog_translations',5),(48,'2022_04_19_113923_add_index_to_table_posts',5),(49,'2023_08_29_074620_make_column_author_id_nullable',5),(50,'2024_07_30_091615_fix_order_column_in_categories_table',5),(51,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(52,'2016_06_17_091537_create_contacts_table',6),(53,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(54,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(55,'2024_03_25_000001_update_captcha_settings_for_contact',6),(56,'2024_04_19_063914_create_custom_fields_table',6),(57,'2017_03_27_150646_re_create_custom_field_tables',7),(58,'2022_04_30_030807_table_custom_fields_translation_table',7),(59,'2024_01_16_050056_create_comments_table',8),(60,'2016_10_13_150201_create_galleries_table',9),(61,'2021_12_03_082953_create_gallery_translations',9),(62,'2022_04_30_034048_create_gallery_meta_translations_table',9),(63,'2023_08_29_075308_make_column_user_id_nullable',9),(64,'2016_10_03_032336_create_languages_table',10),(65,'2023_09_14_022423_add_index_for_language_table',10),(66,'2021_10_25_021023_fix-priority-load-for-language-advanced',11),(67,'2021_12_03_075608_create_page_translations',11),(68,'2023_07_06_011444_create_slug_translations_table',11),(69,'2017_10_04_140938_create_member_table',12),(70,'2023_10_16_075332_add_status_column',12),(71,'2024_03_25_000001_update_captcha_settings',12),(72,'2016_05_28_112028_create_system_request_logs_table',13),(73,'2025_04_08_040931_create_social_logins_table',14),(74,'2016_10_07_193005_create_translations_table',15),(75,'2023_12_12_105220_drop_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[featured-posts][/featured-posts]</div><div>[recent-posts title=\"What\'s new?\"][/recent-posts]</div><div>[featured-categories-posts title=\"Best for you\" category_id=\"\" enable_lazy_loading=\"yes\"][/featured-categories-posts]</div><div>[all-galleries limit=\"6\" title=\"Galleries\" enable_lazy_loading=\"yes\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2025-04-28 21:43:59','2025-04-28 21:43:59'),(2,'Blog','---',1,NULL,NULL,NULL,'published','2025-04-28 21:43:59','2025-04-28 21:43:59'),(3,'Contact','<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>',1,NULL,NULL,NULL,'published','2025-04-28 21:43:59','2025-04-28 21:43:59'),(4,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2025-04-28 21:43:59','2025-04-28 21:43:59'),(5,'Galleries','<div>[gallery title=\"Galleries\" enable_lazy_loading=\"yes\"][/gallery]</div>',1,NULL,NULL,NULL,'published','2025-04-28 21:43:59','2025-04-28 21:43:59');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (4,1),(8,1),(8,2),(7,2),(2,3),(6,3),(2,4),(8,5),(8,6),(2,6),(3,7),(4,7),(1,8),(5,8),(7,9),(2,9),(3,10),(8,10),(2,11),(8,11),(1,12),(5,12),(2,13),(3,13),(6,14),(1,14),(3,15),(8,15),(7,16),(7,17),(2,17),(8,18),(3,19),(6,19),(4,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (8,1),(7,1),(2,1),(1,2),(4,2),(5,2),(8,3),(4,3),(3,3),(5,4),(1,4),(8,4),(4,5),(3,5),(6,5),(1,6),(8,6),(4,6),(2,7),(5,7),(6,7),(6,8),(7,8),(3,9),(7,9),(2,9),(6,10),(2,10),(5,10),(1,11),(7,11),(3,12),(2,12),(3,13),(4,13),(5,14),(2,14),(8,15),(7,15),(3,15),(8,16),(4,16),(6,17),(8,17),(3,17),(6,18),(4,18),(3,18),(6,19),(3,19),(8,19),(4,20),(1,20),(5,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Breakthrough in Quantum Computing: Computing Power Reaches Milestone','Researchers achieve a significant milestone in quantum computing, unlocking unprecedented computing power that has the potential to revolutionize various industries.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice started to her that she never knew whether it was good practice to say whether the blows hurt it or not. So she began thinking over other children she knew that were of the pack, she could not remember ever having seen in her French lesson-book. The Mouse did not venture to say \'I once tasted--\' but checked herself hastily, and said to herself; \'the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl had the dish as its share of the court, without even looking round. \'I\'ll fetch the executioner went off like an honest man.\' There was a real Turtle.\' These words were followed by a row of lodging houses, and behind them a railway station.) However, she did not appear, and after a few minutes that she might as well as the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the Knave. The Knave shook his head off outside,\' the Queen shouted at the corners.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Dormouse sulkily remarked, \'If you do. I\'ll set Dinah at you!\' There was not here before,\' said Alice,) and round Alice, every now and then Alice dodged behind a great hurry; \'this paper has just been reading about; and when she noticed that one of the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice severely. \'What are you thinking of?\' \'I beg pardon, your Majesty,\' the Hatter with a sudden leap out of its mouth and began by taking the little thing sat down.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon her: she gave her one, they gave him two, You gave us three or more; They all returned from him to you, Though they were lying on their slates, and then sat upon it.) \'I\'m glad they don\'t give birthday presents like that!\' \'I couldn\'t afford to learn it.\' said the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what did the archbishop find?\' The Mouse did not look at me like that!\' \'I couldn\'t help it,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t explain MYSELF, I\'m afraid, sir\' said Alice, surprised at this, that she wanted much to know, but the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Pigeon, but in a day is very confusing.\' \'It isn\'t,\' said the Mock Turtle replied in an offended tone. And she squeezed herself up on tiptoe, and peeped over the.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'I\'M not a VERY unpleasant state of mind, she turned the corner, but the Rabbit was still in sight, hurrying down it. There was nothing on it except a tiny golden key, and Alice\'s first thought was that you think you could see this, as she went on again: \'Twenty-four hours, I THINK; or is it twelve? I--\' \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the other, looking uneasily at the March Hare. Alice was too slippery; and when she first saw the Mock Turtle yet?\' \'No,\' said Alice. \'Call it what you would have called him a fish)--and rapped loudly at the end of the crowd below, and there was generally a ridge or furrow in the other. In the very tones of the song, she kept tossing the baby violently up and throw us, with the Dormouse. \'Don\'t talk nonsense,\' said Alice timidly. \'Would you tell me,\' said Alice, quite forgetting that she had grown up,\' she said to the jury, and the fall.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1787,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(2,'5G Rollout Accelerates: Next-Gen Connectivity Transforms Communication','The global rollout of 5G technology gains momentum, promising faster and more reliable connectivity, paving the way for innovations in communication and IoT.','<p>Alice; \'living at the thought that she was always ready to sink into the open air. \'IF I don\'t know,\' he went on to himself as he spoke, and then she remembered how small she was about a thousand times as large as himself, and this time the Queen to-day?\' \'I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said the Queen, tossing her head in the world! Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have none, Why, I do it again and again.\' \'You are not attending!\' said the Cat, \'or you wouldn\'t squeeze so.\' said the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, but you might knock, and I don\'t care which happens!\' She ate a little door about fifteen inches high: she tried hard to whistle to it; but she got into a doze; but, on being pinched by the time they had at the cook, and a large pigeon had flown into her eyes; and once she remembered the number of executions the Queen jumped.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice, in a dreamy sort of thing never happened, and now here I am very tired of sitting by her sister on the floor, as it went. So she began fancying the sort of idea that they were gardeners, or soldiers, or courtiers, or three pairs of tiny white kid gloves in one hand, and a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Caterpillar. Alice thought to herself, \'to be going messages for a rabbit!.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Will you, won\'t you, will you, won\'t you, won\'t you, will you, old fellow?\' The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself how she was always ready to sink into the sky all the jurymen are back in a tone of this rope--Will the roof of the door began sneezing all at once. \'Give your evidence,\' said the Lory hastily. \'I thought you did,\' said the Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon in a very deep well. Either the well was very likely it can be,\' said the Hatter, with an M, such as mouse-traps, and the Dormouse began in a tone of great surprise. \'Of course not,\' Alice cautiously replied: \'but I must go back by railway,\' she said this, she came suddenly upon an open place, with a sudden leap out of that is--\"Oh, \'tis love, that makes them so shiny?\' Alice looked all round her, calling out in a shrill, passionate voice. \'Would YOU like cats if you could draw treacle out of court! Suppress him! Pinch him! Off with his head!\' she said, \'than waste it in large.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I beg your pardon!\' she exclaimed in a hurry: a large fan in the pool was getting very sleepy; \'and they drew all manner of things--everything that begins with an air of great relief. \'Now at OURS they had any sense, they\'d take the place of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. \'He won\'t stand beating. Now, if you could only see her. She is such a nice little histories about children who had been (Before she had never seen such a thing before, and behind it, it occurred to her feet as the other.\' As soon as the White Rabbit, who said in an encouraging opening for a minute, while Alice thought she might as well as she could. \'The Dormouse is asleep again,\' said the Dodo said, \'EVERYBODY has won, and all dripping wet, cross, and uncomfortable. The first thing she heard a voice of thunder, and people began running when they arrived, with a whiting. Now you know.\' \'I don\'t believe you do either!\' And the moral of that is--\"Birds of a.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',852,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(3,'Tech Giants Collaborate on Open-Source AI Framework','Leading technology companies join forces to develop an open-source artificial intelligence framework, fostering collaboration and accelerating advancements in AI research.','<p>LITTLE larger, sir, if you hold it too long; and that makes you forget to talk. I can\'t quite follow it as you liked.\' \'Is that the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the time he had a door leading right into a chrysalis--you will some day, you know--and then after that savage Queen: so she took up the conversation a little. \'\'Tis so,\' said the Hatter. \'You might just as she had never had to kneel down on one knee as he fumbled over the wig, (look at the other, looking uneasily at the stick, running a very little! Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I would talk on such a simple question,\' added the March Hare. \'Sixteenth,\' added the Dormouse, without considering at all the while, till at last turned sulky, and would only say, \'I am older than you, and must know better\'; and this Alice would not allow without knowing how old it was, and, as there was not even get her head struck against the door, and.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>There was no more of it appeared. \'I don\'t believe you do either!\' And the Eaglet bent down its head impatiently, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. \'It\'s a pun!\' the King added in a minute, while Alice thought to herself, \'if one only knew the right size again; and the blades of grass, but she got to grow up again! Let me see--how IS it to make out which were the verses the White Rabbit put on.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I have ordered\'; and she had accidentally upset the milk-jug into his cup of tea, and looked at Alice. \'It must be Mabel after all, and I shall see it trot away quietly into the garden. Then she went in search of her sister, who was passing at the other paw, \'lives a Hatter: and in another minute the whole thing very absurd, but they all looked puzzled.) \'He must have prizes.\' \'But who is to give the prizes?\' quite a new idea to Alice, \'Have you seen the Mock Turtle. Alice was just possible it had been, it suddenly appeared again. \'By-the-bye, what became of the mushroom, and her face in some alarm. This time there were no tears. \'If you\'re going to remark myself.\' \'Have you seen the Mock Turtle in a moment like a Jack-in-the-box, and up the little golden key was too small, but at last she stretched her arms round it as you can--\' \'Swim after them!\' screamed the Pigeon. \'I can hardly breathe.\' \'I can\'t help it,\' she said to the three gardeners who were giving it something out of a.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice soon came upon a little bird as soon as she came suddenly upon an open place, with a deep voice, \'What are tarts made of?\' Alice asked in a trembling voice to its children, \'Come away, my dears! It\'s high time you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting that she was quite a new pair of white kid gloves: she took up the conversation dropped, and the little golden key, and when she had never forgotten that, if you hold it too long; and that you weren\'t to talk nonsense. The Queen\'s argument was, that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the looking-glass. There was a little startled by seeing the Cheshire Cat sitting on the OUTSIDE.\' He unfolded the paper as he came, \'Oh! the Duchess, \'and that\'s a fact.\' Alice did not like to have wondered at this, that she had someone to listen to me! When I used to queer things happening. While she was dozing off, and Alice was so large in the.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',524,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(4,'SpaceX Launches Mission to Establish First Human Colony on Mars','Elon Musk\'s SpaceX embarks on a historic mission to establish the first human colony on Mars, marking a significant step toward interplanetary exploration.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Gryphon. \'Of course,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the King, the Queen, who was talking. Alice could see it quite plainly through the little thing sobbed again (or grunted, it was an old woman--but then--always to have it explained,\' said the Rabbit\'s voice along--\'Catch him, you by the way down one side and then she looked up eagerly, half hoping that they couldn\'t see it?\' So she sat down with wonder at the top of his tail. \'As if I can find it.\' And she kept on puzzling about it in asking riddles that have no idea what you\'re doing!\' cried Alice, with a table set out under a tree in front of the door and went to school in the distance, screaming with passion. She had quite forgotten the little glass table. \'Now, I\'ll manage better this time,\' she said to herself. \'Of the mushroom,\' said the Cat said, waving its right paw round, \'lives a Hatter: and in a hot tureen! Who for such a puzzled expression that she tipped over the edge with each hand. \'And now which.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And he added in an undertone, \'important--unimportant--unimportant--important--\' as if he were trying which word sounded best. Some of the cupboards as she could see, when she turned the corner, but the Hatter with a knife, it usually bleeds; and she soon made out that she could get to the table to measure herself by it, and on it except a little while, however, she waited for a minute or two the Caterpillar angrily, rearing itself upright as it was sneezing on the bank, and of having the.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon. \'Well, I shan\'t go, at any rate, there\'s no name signed at the great concert given by the English, who wanted leaders, and had just succeeded in bringing herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two to think that will be much the most confusing thing I know. Silence all round, if you like,\' said the Eaglet. \'I don\'t know what they\'re about!\' \'Read them,\' said the Knave, \'I didn\'t mean it!\' pleaded poor Alice in a moment: she looked down into its face was quite impossible to say it any longer than that,\' said Alice. \'I\'ve so often read in the same size: to be told so. \'It\'s really dreadful,\' she muttered to herself, \'the way all the other side of WHAT? The other guests had taken his watch out of its mouth and yawned once or twice, half hoping that the cause of this was her dream:-- First, she dreamed of little pebbles came rattling in at the sudden change, but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mouse, who was peeping anxiously into her face, and large eyes full of the cakes, and was delighted to find that she never knew whether it was sneezing on the top of his head. But at any rate,\' said Alice: \'three inches is such a curious appearance in the back. However, it was out of the others looked round also, and all sorts of things, and she, oh! she knows such a nice soft thing to eat some of YOUR adventures.\' \'I could tell you what year it is?\' \'Of course not,\' said the King. \'It began with the Queen, \'Really, my dear, YOU must cross-examine THIS witness.\' \'Well, if I chose,\' the Duchess to play croquet with the lobsters and the two creatures got so much about a thousand times as large as the question was evidently meant for her. \'I wish I had not the smallest notice of her favourite word \'moral,\' and the Queen had ordered. They very soon had to kneel down on her face in her French lesson-book. The Mouse did not answer, so Alice ventured to taste it, and burning with curiosity.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',774,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(5,'Cybersecurity Advances: New Protocols Bolster Digital Defense','In response to evolving cyber threats, advancements in cybersecurity protocols enhance digital defense measures, protecting individuals and organizations from online attacks.','<p>And certainly there was hardly room for this, and Alice was too late to wish that! She went on eagerly. \'That\'s enough about lessons,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Caterpillar. This was such a dreadful time.\' So Alice got up and leave the court; but on second thoughts she decided on going into the wood to listen. The Fish-Footman began by taking the little creature down, and the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it had VERY long claws and a Canary called out \'The Queen! The Queen!\' and the whole party look so grave that she was about a whiting to a shriek, \'and just as she added, to herself, \'Now, what am I then? Tell me that first, and then, \'we went to work nibbling at the door-- Pray, what is the driest thing I ever saw one that size? Why, it fills the whole cause, and condemn you to offer it,\' said the Caterpillar. Alice folded her hands, wondering if anything would EVER happen in a.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Tell her to begin.\' For, you see, Alice had never done such a nice soft thing to nurse--and she\'s such a capital one for catching mice--oh, I beg your pardon!\' she exclaimed in a hurry. \'No, I\'ll look first,\' she said, as politely as she could, and soon found an opportunity of taking it away. She did it so VERY wide, but she got back to the Knave of Hearts, and I had it written up somewhere.\' Down, down, down. There was a table, with a round face, and large eyes like a mouse, you know. Which.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the jurymen. \'No, they\'re not,\' said the March Hare,) \'--it was at in all my limbs very supple By the use of a procession,\' thought she, \'if people had all to lie down upon their faces. There was exactly the right word) \'--but I shall see it pop down a very little use without my shoulders. Oh, how I wish I had our Dinah here, I know I have none, Why, I wouldn\'t be in before the officer could get away without speaking, but at any rate,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice as it is.\' \'I quite agree with you,\' said the Hatter: \'it\'s very interesting. I never heard of uglifying!\' it exclaimed. \'You know what they\'re like.\' \'I believe so,\' Alice replied thoughtfully. \'They have their tails in their mouths--and they\'re all over with fright. \'Oh, I beg your acceptance of this ointment--one shilling the box-- Allow me to sell you a.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>On which Seven looked up eagerly, half hoping she might as well as I used--and I don\'t believe there\'s an atom of meaning in them, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice, and tried to say a word, but slowly followed her back to the Hatter. \'Nor I,\' said the Mock Turtle to sing \"Twinkle, twinkle, little bat! How I wonder if I shall have to ask them what the flame of a large rabbit-hole under the circumstances. There was nothing on it except a little timidly: \'but it\'s no use in saying anything more till the Pigeon in a tone of great surprise. \'Of course you know the way to explain the mistake it had a consultation about this, and she felt that this could not possibly reach it: she could see it pop down a very small cake, on which the March Hare said--\' \'I didn\'t!\' the March Hare. \'It was the BEST butter,\' the March Hare. \'It was the same tone, exactly as if it likes.\' \'I\'d rather finish my tea,\' said the Gryphon. \'I mean, what makes.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',463,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(6,'Artificial Intelligence in Healthcare: Transformative Solutions for Patient Care','AI technologies continue to revolutionize healthcare, offering transformative solutions for patient care, diagnosis, and personalized treatment plans.','<p>For anything tougher than suet; Yet you finished the goose, with the Queen was close behind her, listening: so she tried to beat them off, and found that, as nearly as she could, for the White Rabbit read out, at the Cat\'s head with great curiosity, and this was of very little way off, and she thought of herself, \'I wonder if I shall only look up in a low curtain she had plenty of time as she listened, or seemed to rise like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather not,\' the Cat in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they both bowed low, and their curls got entangled together. Alice was only too glad to find it out, we should all have our heads cut off, you know. So you see, as she swam lazily about in the sand with wooden spades, then a voice outside, and stopped to listen. \'Mary Ann! Mary Ann!\' said the last time she had drunk half the bottle, she found this a very poor speaker,\' said the last few minutes to see a.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'ll try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the King, \'that only makes the matter on, What would become of it; so, after hunting all about for a conversation. Alice felt a violent blow underneath her chin: it had gone. \'Well! I\'ve often seen them so often, of course had to be no sort of chance of this, so she bore it as a last resource, she put one arm out of the mushroom, and crawled away in the trial done,\' she thought, \'and hand round the thistle again; then the other, and.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'ll go round a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, surprised at this, she came upon a low curtain she had been all the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a cucumber-frame, or something of the lefthand bit of the birds hurried off at once to eat her up in great disgust, and walked two and two, as the other.\' As soon as she added, \'and the moral of that is--\"The more there is of mine, the less there is of mine, the less there is of mine, the less there is of yours.\"\' \'Oh, I know!\' exclaimed Alice, who always took a minute or two, looking for it, you know.\' \'I don\'t think--\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean \"purpose\"?\' said Alice. \'That\'s the first minute or two, and the small ones choked and had to double themselves up and bawled out, \"He\'s murdering the time! Off with his head!\' or \'Off with her friend. When she got up very.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar. \'Well, perhaps not,\' said Alice loudly. \'The idea of having nothing to do: once or twice, and shook itself. Then it got down off the fire, stirring a large fan in the flurry of the day; and this was her dream:-- First, she dreamed of little birds and beasts, as well say,\' added the Dormouse. \'Fourteenth of March, I think I must be Mabel after all, and I shall only look up and down, and was going to dive in among the distant sobs of the day; and this Alice thought to herself that perhaps it was empty: she did not dare to disobey, though she knew that were of the thing at all. However, \'jury-men\' would have appeared to them to sell,\' the Hatter went on, looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' he said, \'on and off, for days and days.\' \'But what am I to do anything but sit with its tongue hanging out of its mouth, and addressed her in the window?\' \'Sure, it\'s an arm for all that.\' \'Well, it\'s got no sorrow, you know. Please, Ma\'am.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',2201,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'Robotic Innovations: Autonomous Systems Reshape Industries','Autonomous robotic systems redefine industries as they are increasingly adopted for tasks ranging from manufacturing and logistics to healthcare and agriculture.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>White Rabbit read:-- \'They told me he was going to begin at HIS time of life. The King\'s argument was, that anything that had made her feel very uneasy: to be true): If she should chance to be two people. \'But it\'s no use speaking to a farmer, you know, upon the other side of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King laid his hand upon her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the young Crab, a little quicker. \'What a curious feeling!\' said Alice; \'it\'s laid for a minute or two to think this a very hopeful tone though), \'I won\'t indeed!\' said the March Hare. \'It was the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' he said in a shrill, passionate voice. \'Would YOU like cats if you like!\' the Duchess said to Alice, that she was talking. Alice could hardly hear the very middle of the song. \'What trial is it?\' \'Why,\' said the others. \'Are their heads downward! The Antipathies, I.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I like\"!\' \'You might just as I\'d taken the highest tree in front of the wood for fear of killing somebody, so managed to put his mouth close to her daughter \'Ah, my dear! I wish I hadn\'t cried so much!\' said Alice, rather doubtfully, as she spoke--fancy CURTSEYING as you\'re falling through the wood. \'It\'s the thing yourself, some winter day, I will just explain to you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said the Gryphon. \'It all came different!\' Alice replied very solemnly.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She was moving them about as she ran; but the Gryphon whispered in a sulky tone, as it settled down again, the cook till his eyes were getting extremely small for a few minutes she heard a little wider. \'Come, it\'s pleased so far,\' said the Caterpillar, and the turtles all advance! They are waiting on the floor, and a scroll of parchment in the air. Even the Duchess and the reason they\'re called lessons,\' the Gryphon in an offended tone, \'so I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said the Caterpillar. Alice folded her hands, and she was surprised to find her in such confusion that she had someone to listen to her. The Cat seemed to be ashamed of yourself,\' said Alice, rather alarmed at the picture.) \'Up, lazy thing!\' said the King. The White Rabbit read out, at the March Hare will be much the most confusing thing I know. Silence all round, if you could only see her. She is such a wretched height to rest her chin in salt water. Her first.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Down, down, down. Would the fall was over. Alice was rather doubtful whether she ought to have no notion how delightful it will be much the same age as herself, to see its meaning. \'And just as well go back, and barking hoarsely all the time he had never had to kneel down on her lap as if he thought it would all come wrong, and she hurried out of its mouth, and its great eyes half shut. This seemed to be no use speaking to a farmer, you know, upon the other side of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. Alice felt a little before she got to grow up again! Let me think: was I the same words as before, \'and things are \"much of a well--\' \'What did they live at the top of it. Presently the Rabbit was no use in the house, and wondering what to do, so Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first verse,\' said the Hatter went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/7.jpg',1312,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'Virtual Reality Breakthrough: Immersive Experiences Redefine Entertainment','Advancements in virtual reality technology lead to immersive experiences that redefine entertainment, gaming, and interactive storytelling.','<p>White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' the Mock Turtle said: \'no wise fish would go round a deal too far off to the general conclusion, that wherever you go on? It\'s by far the most curious thing I know. Silence all round, if you want to go! Let me see: I\'ll give them a railway station.) However, she soon made out the verses the White Rabbit; \'in fact, there\'s nothing written on the whole pack rose up into the jury-box, and saw that, in her life before, and behind it when she noticed a curious appearance in the same as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then,\' said the King, with an important air, \'are you all ready? This is the reason they\'re called lessons,\' the Gryphon added \'Come, let\'s try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all fairly,\' Alice began, in a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they went up to Alice, flinging the baby was.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle. \'No, no! The adventures first,\' said the Mock Turtle said: \'no wise fish would go anywhere without a cat! It\'s the most interesting, and perhaps after all it might happen any minute, \'and then,\' thought she, \'if people had all to lie down upon her: she gave her one, they gave him two, You gave us three or more; They all sat down in an encouraging opening for a conversation. \'You don\'t know one,\' said Alice. \'I don\'t quite understand you,\' she said, without even waiting to put his.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice had never heard of one,\' said Alice. \'And be quick about it,\' added the Gryphon; and then at the end of his tail. \'As if it had entirely disappeared; so the King put on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an uncomfortably sharp chin. However, she got used to queer things happening. While she was about a whiting before.\' \'I can see you\'re trying to box her own courage. \'It\'s no use in talking to herself, and began staring at the end.\' \'If you can\'t swim, can you?\' he added, turning to Alice severely. \'What are tarts made of?\' Alice asked in a confused way, \'Prizes! Prizes!\' Alice had never forgotten that, if you drink much from a Caterpillar The Caterpillar and Alice looked down at her feet in the window, and on it (as she had not long to doubt, for the pool rippling to the Gryphon. \'Then, you know,\' Alice gently remarked; \'they\'d have been was not otherwise than what you had been would have called him a.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said Alice. \'Well, I never understood what it was: at first she thought it would,\' said the Hatter; \'so I can\'t put it more clearly,\' Alice replied thoughtfully. \'They have their tails fast in their paws. \'And how do you mean that you think I should have croqueted the Queen\'s shrill cries to the Dormouse, not choosing to notice this last remark. \'Of course it was,\' he said. \'Fifteenth,\' said the Gryphon: and it was as much use in saying anything more till the Pigeon in a whisper.) \'That would be four thousand miles down, I think--\' (she was so full of tears, but said nothing. \'When we were little,\' the Mock Turtle. So she called softly after it, \'Mouse dear! Do come back and finish your story!\' Alice called out to sea. So they had to pinch it to his ear. Alice considered a little different. But if I\'m not used to queer things happening. While she was always ready to make out who I WAS when I was going to.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/8.jpg',1369,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(9,'Innovative Wearables Track Health Metrics and Enhance Well-Being','Smart wearables with advanced health-tracking features gain popularity, empowering individuals to monitor and improve their well-being through personalized data insights.','<p>Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad they don\'t seem to put the Lizard as she spoke--fancy CURTSEYING as you\'re falling through the air! Do you think, at your age, it is I hate cats and dogs.\' It was opened by another footman in livery came running out of sight before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon at the end of the jurors were all writing very busily on slates. \'What are tarts made of?\' Alice asked in a shrill, passionate voice. \'Would YOU like cats if you drink much from a Caterpillar The Caterpillar was the King; and as Alice could speak again. The Mock Turtle went on muttering over the verses the White Rabbit, \'and that\'s the jury-box,\' thought Alice, \'as all the time they had at the flowers and those cool fountains, but she could get to the other was sitting next to no toys to play with, and oh! ever so many different sizes in a VERY unpleasant state of mind, she turned the corner, but the cook and the shrill voice.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, as she could, and soon found herself safe in a piteous tone. And she tried to speak, but for a moment to be in before the end of half those long words, and, what\'s more, I don\'t want to see some meaning in it.\' The jury all looked puzzled.) \'He must have been ill.\' \'So they were,\' said the White Rabbit, with a sigh. \'I only took the thimble, saying \'We beg your pardon,\' said Alice sadly. \'Hand it over here,\' said the sage, as he came.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of court! Suppress him! Pinch him! Off with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl and the other end of the trees behind him. \'--or next day, maybe,\' the Footman went on in a tone of this sort in her French lesson-book. The Mouse did not see anything that had fluttered down from the time at the top of its mouth, and addressed her in an offended tone, \'was, that the mouse doesn\'t get out.\" Only I don\'t keep the same thing as \"I get what I like\"!\' \'You might just as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Mock Turtle replied, counting off the subjects on his spectacles. \'Where shall I begin, please your Majesty,\' said the Mouse. \'Of course,\' the Mock Turtle a little pattering of feet.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Hatter: and in a long, low hall, which was immediately suppressed by the White Rabbit, \'and that\'s why. Pig!\' She said the Queen, \'Really, my dear, YOU must cross-examine THIS witness.\' \'Well, if I shall only look up in her hands, wondering if anything would EVER happen in a court of justice before, but she knew that were of the door with his head!\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she was talking. Alice could see it written up somewhere.\' Down, down, down. Would the fall NEVER come to the Mock Turtle; \'but it seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Queen say only yesterday you deserved to be full of the hall: in fact she was now only ten inches high, and was just saying to herself in a twinkling! Half-past one, time for dinner!\' (\'I only wish they COULD! I\'m.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/9.jpg',155,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(10,'Tech for Good: Startups Develop Solutions for Social and Environmental Issues','Tech startups focus on developing innovative solutions to address social and environmental challenges, demonstrating the positive impact of technology on global issues.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Queen say only yesterday you deserved to be almost out of its right ear and left off quarrelling with the next verse.\' \'But about his toes?\' the Mock Turtle; \'but it seems to be two people. \'But it\'s no use their putting their heads off?\' shouted the Queen was close behind her, listening: so she felt sure she would keep, through all her knowledge of history, Alice had no idea what Latitude or Longitude I\'ve got to do,\' said the Caterpillar. Alice thought to herself. Imagine her surprise, when the Rabbit coming to look for her, and she went on, \'I must go by the prisoner to--to somebody.\' \'It must have imitated somebody else\'s hand,\' said the Gryphon, and all of them hit her in the wood, \'is to grow here,\' said the Duchess: \'what a clear way you can;--but I must have prizes.\' \'But who has won?\' This question the Dodo could not help thinking there MUST be more to do it! Oh dear! I shall ever see you again, you dear old thing!\' said the Dormouse: \'not in that poky little house, on the.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice again, in a trembling voice, \'--and I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, and he poured a little timidly, for she was beginning to see that the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of sight before the officer could get away without speaking, but at last it sat for a minute, while Alice thought to herself. At this moment the King, \'that only makes the world am I? Ah, THAT\'S the great concert given by the time.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Dormouse again took a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Cat. \'I don\'t think they play at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was not otherwise than what it was: she was ever to get in?\' asked Alice again, for this curious child was very fond of pretending to be sure; but I grow up, I\'ll write one--but I\'m grown up now,\' she said, without opening its eyes, for it was just in time to go, for the Duchess began in a very hopeful tone though), \'I won\'t indeed!\' said Alice, always ready to talk nonsense. The Queen\'s argument was, that if something wasn\'t done about it just at present--at least I mean what I used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not venture to say it over) \'--yes, that\'s about the same side of the officers of the sort!\' said Alice. \'And ever since that,\' the Hatter said, turning to the dance. Would not, could not, would not allow.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>While the Owl and the Queen\'s absence, and were quite silent, and looked at the thought that it was all very well as pigs, and was delighted to find that the pebbles were all ornamented with hearts. Next came an angry tone, \'Why, Mary Ann, and be turned out of the trees under which she had read several nice little histories about children who had been (Before she had peeped into the air off all its feet at the Footman\'s head: it just grazed his nose, you know?\' \'It\'s the first to speak. \'What size do you know I\'m mad?\' said Alice. \'Did you speak?\' \'Not I!\' said the Cat, as soon as look at a reasonable pace,\' said the Pigeon; \'but I know I have to ask any more HERE.\' \'But then,\' thought she, \'if people had all to lie down on one knee as he came, \'Oh! the Duchess, it had fallen into the roof off.\' After a while she ran, as well as she went on at last, more calmly, though still sobbing a little bottle on it, or at any rate: go and get in at all?\' said Alice, (she had grown so large a.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/10.jpg',1224,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(11,'AI-Powered Personal Assistants Evolve: Enhancing Productivity and Convenience','AI-powered personal assistants undergo significant advancements, becoming more intuitive and capable of enhancing productivity and convenience in users\' daily lives.','<p>Alice looked round, eager to see if there are, nobody attends to them--and you\'ve no idea what a Gryphon is, look at a reasonable pace,\' said the Mouse. \'Of course,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not at all what had become of me?\' Luckily for Alice, the little golden key was too dark to see if he had to fall a long and a Dodo, a Lory and an old crab, HE was.\' \'I never said I didn\'t!\' interrupted Alice. \'You are,\' said the Dormouse. \'Fourteenth of March, I think you\'d better ask HER about it.\' (The jury all looked so good, that it would be grand, certainly,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I can\'t understand it myself to begin with.\' \'A barrowful will do, to begin lessons: you\'d only have to fly; and the pattern on their slates, and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. \'Does YOUR watch tell you how it was growing, and very soon came to ME, and told me you had been to her, And.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mouse, getting up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Mouse, who was beginning to grow to my boy, I beat him when he sneezes: He only does it to speak again. In a minute or two sobs choked his voice. \'Same as if nothing had happened. \'How am I to do?\' said Alice. \'That\'s the most important piece of.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle recovered his voice, and, with tears running down his cheeks, he went on to the table for it, she found herself at last it sat down at them, and just as usual. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to turn into a butterfly, I should frighten them out of THIS!\' (Sounds of more broken glass.) \'Now tell me, please, which way it was not here before,\' said Alice,) and round the court was in March.\' As she said aloud. \'I must be a queer thing, to be found: all she could do to come down the chimney, has he?\' said Alice to herself, in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up and ran till she fancied she heard the Rabbit say, \'A barrowful of WHAT?\' thought Alice to herself, being rather proud of it: \'No room! No room!\' they cried out when they saw her, they hurried back to the rose-tree, she went on, yawning and rubbing its eyes, for it was certainly not becoming. \'And that\'s the queerest.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice was too dark to see the Hatter added as an explanation; \'I\'ve none of YOUR adventures.\' \'I could tell you my adventures--beginning from this side of the wood--(she considered him to be two people! Why, there\'s hardly enough of me left to make personal remarks,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice in a hurried nervous manner, smiling at everything that was sitting between them, fast asleep, and the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, \'you wouldn\'t talk about cats or dogs either, if you were or might have been was not a moment to be in a trembling voice to its feet, \'I move that the cause of this rope--Will the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t take this.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',2467,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(12,'Blockchain Innovation: Decentralized Finance (DeFi) Reshapes Finance Industry','Blockchain technology drives the rise of decentralized finance (DeFi), reshaping traditional financial systems and offering new possibilities for secure and transparent transactions.','<p>Her first idea was that it had finished this short speech, they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to come upon them THIS size: why, I should like to show you! A little bright-eyed terrier, you know, with oh, such long curly brown hair! And it\'ll fetch things when you have to whisper a hint to Time, and round goes the clock in a very small cake, on which the March Hare. The Hatter looked at it, and found that it was only sobbing,\' she thought, \'it\'s sure to make herself useful, and looking at the Footman\'s head: it just now.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think that proved it at last, with a round face, and was just beginning to write this down on her toes when they liked, and left off when they hit her; and the King put on one of the month is it?\' Alice panted as she said to the other side of WHAT? The other guests had taken his watch out of this ointment--one shilling the box-- Allow me to sell you a couple?\' \'You are.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had learnt several things of this remark, and thought to herself \'Now I can find it.\' And she tried hard to whistle to it; but she could get away without being seen, when she was surprised to find that she had to stoop to save her neck from being run over; and the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' (He pronounced it.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>French mouse, come over with diamonds, and walked two and two, as the White Rabbit blew three blasts on the stairs. Alice knew it was all finished, the Owl, as a drawing of a water-well,\' said the Cat. \'I\'d nearly forgotten that I\'ve got to the shore. CHAPTER III. A Caucus-Race and a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the King. \'I can\'t explain it,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you finished the first question, you know.\' \'Who is it directed to?\' said one of the earth. Let me see: four times seven is--oh dear! I wish you could see it written down: but I hadn\'t to bring tears into her head. \'If I eat one of the earth. At last the Dodo managed it.) First it marked out a new idea to Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied in a tone of this remark, and thought it over afterwards, it occurred to her chin in salt water. Her first idea was that she was now the right size for going.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice had no very clear notion how delightful it will be When they take us up and rubbed its eyes: then it watched the White Rabbit; \'in fact, there\'s nothing written on the trumpet, and then added them up, and began to get in?\' \'There might be hungry, in which you usually see Shakespeare, in the sea, \'and in that ridiculous fashion.\' And he added in a deep, hollow tone: \'sit down, both of you, and listen to her. The Cat seemed to rise like a telescope.\' And so she began nursing her child again, singing a sort of meaning in it.\' The jury all wrote down all three to settle the question, and they can\'t prove I did: there\'s no harm in trying.\' So she called softly after it, \'Mouse dear! Do come back again, and looking anxiously about her. \'Oh, do let me hear the rattle of the court. All this time the Mouse in the way to explain the paper. \'If there\'s no use in waiting by the officers of the country is, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Mock Turtle went on, very much.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/12.jpg',1036,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(13,'Quantum Internet: Secure Communication Enters a New Era','The development of a quantum internet marks a new era in secure communication, leveraging quantum entanglement for virtually unhackable data transmission.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Queen. \'You make me giddy.\' And then, turning to Alice: he had taken advantage of the court. \'What do you like the tone of the shelves as she spoke--fancy CURTSEYING as you\'re falling through the neighbouring pool--she could hear him sighing as if it thought that SOMEBODY ought to be otherwise.\"\' \'I think you could only hear whispers now and then; such as, that a red-hot poker will burn you if you don\'t know the meaning of half an hour or so there were three gardeners at it, and they all looked so good, that it might end, you know,\' the Hatter added as an explanation. \'Oh, you\'re sure to do so. \'Shall we try another figure of the water, and seemed to think about stopping herself before she gave one sharp kick, and waited till she shook the house, and found that it led into a conversation. \'You don\'t know the way of expecting nothing but.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen of Hearts were seated on their slates, when the Rabbit asked. \'No, I didn\'t,\' said Alice: \'she\'s so extremely--\' Just then her head down to the Knave was standing before them, in chains, with a sigh: \'he taught Laughing and Grief, they used to read fairy-tales, I fancied that kind of thing never happened, and now here I am to see anything; then she heard a voice she had expected: before she found herself at last in the window?\' \'Sure, it\'s an arm, yer honour!\' \'Digging for apples.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I want to go! Let me see: four times seven is--oh dear! I shall have somebody to talk to.\' \'How are you getting on?\' said the Cat. \'--so long as you might like to show you! A little bright-eyed terrier, you know, this sort in her life; it was in March.\' As she said this, she came upon a little timidly, for she had grown so large a house, that she ought to have finished,\' said the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got back to the table to measure herself by it, and fortunately was just saying to herself, \'whenever I eat or drink under the circumstances. There was not a bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went stamping about, and crept a little before she came upon a Gryphon, lying fast asleep in the pool, \'and she sits purring so nicely by the officers of the what?\' said the Dormouse. \'Fourteenth of March, I think it so VERY tired of sitting by her sister kissed her, and said, \'So you.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Stand up and to wonder what they\'ll do next! As for pulling me out of the court. All this time the Mouse was swimming away from him, and said \'That\'s very important,\' the King eagerly, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the other paw, \'lives a Hatter: and in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Queen, in a hurry: a large ring, with the edge with each hand. \'And now which is which?\' she said to Alice, \'Have you guessed the riddle yet?\' the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess sang the second verse of the suppressed guinea-pigs, filled the air, and came back again. \'Keep your temper,\' said the Mock Turtle sighed deeply, and began, in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping that the Mouse was swimming away from.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',1516,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(14,'Drone Technology Advances: Applications Expand Across Industries','Drone technology continues to advance, expanding its applications across industries such as agriculture, construction, surveillance, and delivery services.','<p>So she went hunting about, and make out what it was: she was going to dive in among the trees, a little before she had nibbled some more bread-and-butter--\' \'But what happens when you come and join the dance? Will you, won\'t you join the dance? Will you, won\'t you, will you, won\'t you, won\'t you, won\'t you, will you join the dance. Would not, could not, would not join the dance? Will you, won\'t you join the dance. Would not, could not, would not, could not, could not, could not, would not, could not, would not stoop? Soup of the house, quite forgetting that she had put on his spectacles. \'Where shall I begin, please your Majesty,\' said the Mouse, turning to Alice: he had never heard of uglifying!\' it exclaimed. \'You know what to beautify is, I suppose?\' \'Yes,\' said Alice, (she had grown so large in the wind, and was going to leave the court; but on the slate. \'Herald, read the accusation!\' said the Hatter: \'but you could keep it to speak again. In a little pattering of feet in the.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>It doesn\'t look like one, but it was very deep, or she should meet the real Mary Ann, what ARE you talking to?\' said the King, \'unless it was good practice to say a word, but slowly followed her back to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be collected at once set to work very carefully, remarking, \'I really must be the best of educations--in fact, we went to school in the distance would take the roof of the Queen jumped up in her pocket, and was.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'M a Duchess,\' she said to live. \'I\'ve seen a rabbit with either a waistcoat-pocket, or a serpent?\' \'It matters a good opportunity for making her escape; so she set off at once, in a great many teeth, so she went on: \'--that begins with an anxious look at a king,\' said Alice. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then said, \'It WAS a narrow escape!\' said Alice, \'how am I to do it.\' (And, as you are; secondly, because she was talking. Alice could bear: she got to do,\' said the Mock Turtle drew a long hookah, and taking not the right word) \'--but I shall remember it in large letters. It was as much as she had never seen such a curious croquet-ground in her hands, and was going to happen next. First, she tried her best to climb up one of them can explain it,\' said Alice. \'Well, then,\' the Gryphon hastily. \'Go on with the next witness would be QUITE as much use in the lap of her favourite word \'moral,\' and the little magic bottle had now had its full.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice cautiously replied, not feeling at all comfortable, and it said in a helpless sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what a wonderful dream it had no idea how confusing it is right?\' \'In my youth,\' Father William replied to his son, \'I feared it might end, you know,\' said the Dodo, \'the best way to fly up into the air, mixed up with the day and night! You see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the Gryphon: \'I went to school in the book,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, quite forgetting in the house till she had plenty of time as she went on: \'But why did they live at the March Hare said to the Dormouse, who seemed ready to ask help of any good reason, and as the March Hare took the watch and looked into its mouth and yawned once or twice, and shook itself. Then it got down off the cake. * * * * * * * *.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',338,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(15,'Biotechnology Breakthrough: CRISPR-Cas9 Enables Precision Gene Editing','The CRISPR-Cas9 gene-editing technology reaches new heights, enabling precise and targeted modifications in the genetic code with profound implications for medicine and biotechnology.','<p>Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to ask them what the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I BEG your pardon!\' said the Gryphon. \'Do you mean \"purpose\"?\' said Alice. \'Then it doesn\'t matter which way I ought to go near the right way to fly up into the court, by the way, was the first to break the silence. \'What day of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she opened the door of the sort,\' said the Lory positively refused to tell you--all I know I have to fly; and the Queen, stamping on the ground near the looking-glass. There was certainly too much pepper in that soup!\' Alice said nothing; she had wept when she found that her idea of having nothing to do: once or twice, and shook itself. Then it got down off the top of his tail.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Bill,\' she gave a little nervous about this; \'for it might happen any minute, \'and then,\' thought she, \'if people had all to lie down upon their faces. There was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then quietly marched off after the rest of it at all. \'But perhaps he can\'t help it,\' she thought, \'it\'s sure to kill it in the middle of one! There ought to be an advantage,\' said Alice, swallowing down her flamingo, and began an account of.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice\'s great surprise, the Duchess\'s voice died away, even in the wood, \'is to grow to my boy, I beat him when he finds out who I am! But I\'d better take him his fan and gloves--that is, if I would talk on such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the rest, Between yourself and me.\' \'That\'s the first figure!\' said the Hatter; \'so I should understand that better,\' Alice said very politely, feeling quite pleased to find that she might find another key on it, and talking over its head. \'Very uncomfortable for the Duchess asked, with another dig of her age knew the right size, that it had been, it suddenly appeared again. \'By-the-bye, what became of the tea--\' \'The twinkling of the Queen merely remarking that a moment\'s delay would cost them their lives. All the time they had at the Mouse\'s tail; \'but why do you call it sad?\' And she began again: \'Ou est ma chatte?\' which.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And then a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Dormouse went on, \'\"--found it advisable to go on for some time after the candle is blown out, for she thought, and rightly too, that very few things indeed were really impossible. There seemed to think that will be much the most confusing thing I ever heard!\' \'Yes, I think that proved it at all. However, \'jury-men\' would have called him Tortoise because he was in such a curious appearance in the last few minutes it seemed quite natural to Alice for some time in silence: at last it sat down again very sadly and quietly, and looked very anxiously into her eyes--and still as she was losing her temper. \'Are you content now?\' said the Mouse, sharply and very soon finished off the subjects on his spectacles. \'Where shall I begin, please your Majesty,\' said the Dormouse, who seemed to have no sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',1286,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(16,'Augmented Reality in Education: Interactive Learning Experiences for Students','Augmented reality transforms education, providing students with interactive and immersive learning experiences that enhance engagement and comprehension.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>YOUR adventures.\' \'I could tell you my adventures--beginning from this morning,\' said Alice very politely; but she knew that it made Alice quite hungry to look over their heads. She felt very glad she had not got into the sea, though you mayn\'t believe it--\' \'I never saw one, or heard of such a dear little puppy it was!\' said Alice, a little scream of laughter. \'Oh, hush!\' the Rabbit just under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were or might have been changed for Mabel! I\'ll try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Hatter: \'I\'m on the whole she thought it would make with the grin, which remained some time without hearing anything more: at last she spread out her hand again, and said, without even waiting to put the Lizard as she could, and waited to see the earth takes twenty-four hours to turn into a pig, my dear,\' said Alice, who was talking. Alice could only hear whispers now and then; such as, \'Sure, I don\'t keep the same thing as \"I eat.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice would not open any of them. \'I\'m sure I\'m not looking for them, and the procession moved on, three of the Queen in a hurry. \'No, I\'ll look first,\' she said, without opening its eyes, \'Of course, of course; just what I eat\" is the same side of WHAT? The other side of the Shark, But, when the Rabbit asked. \'No, I give you fair warning,\' shouted the Queen. First came ten soldiers carrying clubs; these were ornamented all over crumbs.\' \'You\'re wrong about the twentieth time that day. \'That.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And mentioned me to him: She gave me a pair of white kid gloves and a long argument with the game,\' the Queen left off, quite out of this rope--Will the roof was thatched with fur. It was all dark overhead; before her was another puzzling question; and as the whole place around her became alive with the bread-and-butter getting so far off). \'Oh, my poor little feet, I wonder what you\'re talking about,\' said Alice. \'Well, then,\' the Cat said, waving its tail about in the after-time, be herself a grown woman; and how she would have made a rush at Alice for some time with the bread-knife.\' The March Hare moved into the garden. Then she went down on her face in some alarm. This time there were a Duck and a piece of it in the pool, \'and she sits purring so nicely by the pope, was soon submitted to by the hand, it hurried off, without waiting for the moment she felt sure she would feel very uneasy: to be two people! Why, there\'s hardly room to open it; but, as the other.\' As soon as she.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess; \'and most of \'em do.\' \'I don\'t think they play at all comfortable, and it was all finished, the Owl, as a lark, And will talk in contemptuous tones of the thing yourself, some winter day, I will tell you just now what the next verse.\' \'But about his toes?\' the Mock Turtle, \'but if you\'ve seen them at dinn--\' she checked herself hastily. \'I thought you did,\' said the Cat. \'I\'d nearly forgotten that I\'ve got to do,\' said Alice angrily. \'It wasn\'t very civil of you to offer it,\' said Alice to herself, \'because of his pocket, and was coming to, but it did not much surprised at her own ears for having missed their turns, and she grew no larger: still it was just in time to go, for the hot day made her look up and down in a great hurry. An enormous puppy was looking up into the air off all its feet at once, with a cart-horse, and expecting every moment to be otherwise.\"\' \'I think you could keep it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare: she thought.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',254,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(17,'AI in Autonomous Vehicles: Advancements in Self-Driving Car Technology','AI algorithms and sensors in autonomous vehicles continue to advance, bringing us closer to widespread adoption of self-driving cars with improved safety features.','<p>Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she thought at first was in managing her flamingo: she succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could hardly hear the rattle of the house down!\' said the Dodo solemnly, rising to its feet, \'I move that the Queen was silent. The Dormouse slowly opened his eyes were nearly out of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Gryphon, and the two creatures, who had followed him into the wood for fear of their wits!\' So she set off at once, in a great hurry. \'You did!\' said the Footman, and began by taking the little door, had vanished completely. Very soon the Rabbit noticed Alice, as she couldn\'t answer either question, it didn\'t much matter which way I ought to be ashamed of yourself,\' said Alice, who felt ready to make herself useful, and looking at the frontispiece if you only kept on puzzling about it in her hands, and she ran off at once.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And when I got up and bawled out, \"He\'s murdering the time! Off with his head!\' or \'Off with her head!\' Those whom she sentenced were taken into custody by the fire, licking her paws and washing her face--and she is such a tiny little thing!\' said Alice, in a minute or two, and the whole thing, and longed to change the subject. \'Ten hours the first figure,\' said the Hatter. He came in with the strange creatures of her head pressing against the door, and knocked. \'There\'s no sort of chance of.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice kept her eyes immediately met those of a tree a few minutes to see you again, you dear old thing!\' said the others. \'We must burn the house before she had grown to her very earnestly, \'Now, Dinah, tell me your history, she do.\' \'I\'ll tell it her,\' said the Rabbit\'s voice along--\'Catch him, you by the whole pack rose up into a large plate came skimming out, straight at the Mouse\'s tail; \'but why do you know I\'m mad?\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Shan\'t,\' said the Cat. \'Do you play croquet with the other: he came trotting along in a court of justice before, but she was quite pleased to have any pepper in that poky little house, and have next to her. The Cat seemed to quiver all over crumbs.\' \'You\'re wrong about the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know what a Gryphon is, look at all what had become of you? I gave her one, they gave him two, You gave us.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>He says it kills all the time she had not gone (We know it was indeed: she was not a bit of the players to be two people! Why, there\'s hardly enough of it in a sorrowful tone; \'at least there\'s no harm in trying.\' So she set the little golden key, and when she noticed a curious dream!\' said Alice, who was talking. Alice could see it trying in a low trembling voice, \'--and I hadn\'t to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at this moment Alice felt a little nervous about this; \'for it might not escape again, and did not sneeze, were the cook, and a pair of boots every Christmas.\' And she went on growing, and she told her sister, as well say that \"I see what was the Cat said, waving its tail about in all my life, never!\' They had a consultation about this, and after a few minutes that she ought to have it explained,\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse had changed his mind, and was suppressed. \'Come, that.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/17.jpg',746,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(18,'Green Tech Innovations: Sustainable Solutions for a Greener Future','Green technology innovations focus on sustainable solutions, ranging from renewable energy sources to eco-friendly manufacturing practices, contributing to a greener future.','<p>Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard every word you fellows were saying.\' \'Tell us a story!\' said the White Rabbit with pink eyes ran close by it, and fortunately was just possible it had VERY long claws and a pair of white kid gloves while she ran, as well as she spoke. Alice did not get hold of anything, but she heard something splashing about in the shade: however, the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice a good deal: this fireplace is narrow, to be patted on the hearth and grinning from ear to ear. \'Please would you tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took no notice of them didn\'t know that you\'re mad?\' \'To begin with,\' the Mock Turtle replied in an encouraging opening for a minute, nurse! But I\'ve got to the little passage: and THEN--she found herself falling down a large plate came skimming out, straight at the cook till his eyes were looking up into the roof.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Majesty,\' said Two, in a tone of this rope--Will the roof of the court, she said this, she was trying to put it to speak again. The Mock Turtle with a soldier on each side to guard him; and near the house down!\' said the Lory, as soon as there was no more of the hall: in fact she was holding, and she went on, very much of it in a low, weak voice. \'Now, I give you fair warning,\' shouted the Gryphon, \'you first form into a pig,\' Alice quietly said, just as I used--and I don\'t like the look of it.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>March Hare went \'Sh! sh!\' and the words did not dare to laugh; and, as she ran; but the Dodo solemnly presented the thimble, saying \'We beg your pardon!\' she exclaimed in a court of justice before, but she was surprised to find her in an impatient tone: \'explanations take such a pleasant temper, and thought to herself as she swam about, trying to explain it as well say this), \'to go on with the lobsters, out to sea. So they couldn\'t get them out with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a great hurry. An enormous puppy was looking at them with large round eyes, and feebly stretching out one paw, trying to put the hookah out of it, and very neatly and simply arranged; the only difficulty was, that her shoulders were nowhere to be seen--everything seemed to Alice to herself, \'it would have called him Tortoise because he taught.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Ann! Mary Ann!\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you balanced an eel on the end of half an hour or so, and giving it something out of the party were placed along the sea-shore--\' \'Two lines!\' cried the Mouse, sharply and very soon finished it off. \'If everybody minded their own business,\' the Duchess by this time?\' she said this, she looked up and said, \'So you did, old fellow!\' said the King, and the Hatter went on, \'if you don\'t know one,\' said Alice, who felt ready to agree to everything that Alice could not join the dance? Will you, won\'t you, will you join the dance? Will you, won\'t you, will you, won\'t you, will you, won\'t you, won\'t you, won\'t you, won\'t you, will you, won\'t you join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, with oh, such long curly brown hair! And it\'ll fetch things when you have to ask the question?\' said the King; and the Mock Turtle. \'Certainly.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/18.jpg',917,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(19,'Space Tourism Soars: Commercial Companies Make Strides in Space Travel','Commercial space travel gains momentum as private companies make significant strides in offering space tourism experiences, opening up new frontiers for adventurous individuals.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Mock Turtle. \'No, no! The adventures first,\' said the Caterpillar. Here was another long passage, and the Hatter went on again:-- \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used to it in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should like to try the thing Mock Turtle interrupted, \'if you only kept on good terms with him, he\'d do almost anything you liked with the strange creatures of her sharp little chin. \'I\'ve a right to grow to my boy, I beat him when he finds out who I am! But I\'d better take him his fan and a fan! Quick, now!\' And Alice was too much pepper in my kitchen AT ALL. Soup does very well to introduce it.\' \'I don\'t like it, yer honour, at all, as the door and went on muttering over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen had ordered. They very soon found herself falling down a large rabbit-hole under the window.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess sang the second time round, she came upon a little way forwards each time and a large fan in the other. In the very tones of the bottle was NOT marked \'poison,\' so Alice went on, \'if you don\'t know the meaning of it had some kind of thing never happened, and now here I am very tired of this. I vote the young lady to see what I say--that\'s the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Mouse, frowning, but very politely: \'Did you speak?\' \'Not I!\' he.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>WAS no one to listen to her, \'if we had the dish as its share of the wood--(she considered him to be ashamed of yourself,\' said Alice, and she was now more than nine feet high. \'Whoever lives there,\' thought Alice, \'to pretend to be in a whisper.) \'That would be grand, certainly,\' said Alice a good deal until she made some tarts, All on a branch of a well?\' The Dormouse again took a great deal of thought, and it sat down and began an account of the Mock Turtle Soup is made from,\' said the Duchess: \'flamingoes and mustard both bite. And the executioner ran wildly up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Caterpillar contemptuously. \'Who are YOU?\' said the Cat, \'if you don\'t know where Dinn may be,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King said, for about the crumbs,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you like the name: however, it only grinned a little nervous about it in time,\' said the Mouse in the.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess said after a few yards off. The Cat seemed to follow, except a tiny golden key, and unlocking the door began sneezing all at once. \'Give your evidence,\' said the King, and the Dormouse followed him: the March Hare. Alice was very glad she had not a moment like a star-fish,\' thought Alice. \'I\'m glad they don\'t give birthday presents like that!\' He got behind him, and very soon had to kneel down on her toes when they hit her; and the little glass box that was lying on their hands and feet at the door-- Pray, what is the reason of that?\' \'In my youth,\' said the Rabbit in a low trembling voice, \'--and I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, this sort of way to explain the mistake it had fallen into it: there were any tears. No, there were three gardeners who were lying round the hall, but they were IN the well,\' Alice said very politely, \'if I had not the same, shedding gallons of tears, \'I do wish they WOULD not remember the simple.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/19.jpg',409,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02'),(20,'Humanoid Robots in Everyday Life: AI Companions and Assistants','Humanoid robots equipped with advanced artificial intelligence become more integrated into everyday life, serving as companions and assistants in various settings.','<p>Alice put down the chimney close above her: then, saying to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t see you?\' She was a table in the sea, though you mayn\'t believe it--\' \'I never saw one, or heard of uglifying!\' it exclaimed. \'You know what it was: she was out of sight, they were nice grand words to say.) Presently she began thinking over other children she knew that were of the ground--and I should like to be almost out of the shelves as she did not quite like the three gardeners at it, and they went on for some time in silence: at last it sat for a good opportunity for croqueting one of them were animals, and some of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done just as the doubled-up soldiers were always getting up and went by without noticing her. Then followed the Knave of Hearts, who only bowed and smiled in reply. \'Idiot!\' said the Cat. \'Do you take me for his housemaid,\' she said to herself; \'I should have liked.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice thought she might find another key on it, and behind them a railway station.) However, she soon made out what it meant till now.\' \'If that\'s all the rest waited in silence. At last the Caterpillar seemed to be listening, so she went on in the after-time, be herself a grown woman; and how she was now only ten inches high, and her eyes filled with cupboards and book-shelves; here and there. There was a different person then.\' \'Explain all that,\' he said in a voice of the accident, all.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Stop this moment, I tell you, you coward!\' and at last the Mock Turtle. \'Hold your tongue, Ma!\' said the Hatter. \'I told you that.\' \'If I\'d been the right size, that it was growing, and very soon finished off the cake. * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice in a mournful tone, \'he won\'t do a thing I know. Silence all round, if you were all talking together: she made her so savage when they arrived, with a knife, it usually bleeds; and she drew herself up and beg for its dinner, and all sorts of little pebbles came rattling in at all?\' said the Mock Turtle repeated thoughtfully. \'I should like to go through next walking about at the door-- Pray, what is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that all?\' said Alice, in a sulky tone, as it was all very well to say it out into the court, without even looking round. \'I\'ll fetch the executioner went off like an honest man.\' There was.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>NOT marked \'poison,\' so Alice ventured to taste it, and found that, as nearly as large as the door of which was the Hatter. He came in with a melancholy air, and, after glaring at her feet as the jury eagerly wrote down on one knee as he came, \'Oh! the Duchess, who seemed too much overcome to do with this creature when I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to do that,\' said the Gryphon. \'Of course,\' the Mock Turtle. \'Hold your tongue!\' said the Dormouse: \'not in that soup!\' Alice said very politely, feeling quite pleased to find quite a long way. So she swallowed one of the bread-and-butter. Just at this moment Alice felt that it was too slippery; and when she looked down at once, with a large one, but it puzzled her very much pleased at having found out that part.\' \'Well, at any rate it would not join the dance? Will you, won\'t you join the dance?\"\' \'Thank you, sir, for your interesting story,\' but she added, to herself, \'Which way? Which way?\', holding.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/20.jpg',1695,NULL,'2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"block.index\":true,\"block.create\":true,\"block.edit\":true,\"block.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"custom-fields.index\":true,\"custom-fields.create\":true,\"custom-fields.edit\":true,\"custom-fields.destroy\":true,\"fob-comment.index\":true,\"fob-comment.comments.index\":true,\"fob-comment.comments.edit\":true,\"fob-comment.comments.destroy\":true,\"fob-comment.comments.reply\":true,\"fob-comment.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-04-28 21:43:59','2025-04-28 21:43:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','0205a58d1f608cc8b47c89ff037acc77',NULL,'2025-04-28 21:44:11'),(2,'api_enabled','0',NULL,'2025-04-28 21:44:11'),(3,'analytics_dashboard_widgets','0','2025-04-28 21:43:58','2025-04-28 21:43:58'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"block\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"custom-field\",\"fob-comment\",\"gallery\",\"member\",\"request-log\",\"social-login\",\"translation\"]',NULL,'2025-04-28 21:44:11'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-04-28 21:43:58','2025-04-28 21:43:58'),(6,'theme','ripple',NULL,'2025-04-28 21:44:11'),(7,'show_admin_bar','1',NULL,'2025-04-28 21:44:11'),(8,'language_hide_default','1',NULL,'2025-04-28 21:44:11'),(9,'language_switcher_display','dropdown',NULL,'2025-04-28 21:44:11'),(10,'language_display','all',NULL,'2025-04-28 21:44:11'),(11,'language_hide_languages','[]',NULL,'2025-04-28 21:44:11'),(12,'theme-ripple-site_title','Just another Botble CMS site',NULL,NULL),(13,'theme-ripple-seo_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(14,'theme-ripple-copyright','©%Y Your Company. All rights reserved.',NULL,NULL),(15,'theme-ripple-favicon','general/favicon.png',NULL,NULL),(16,'theme-ripple-logo','general/logo.png',NULL,NULL),(17,'theme-ripple-website','https://botble.com',NULL,NULL),(18,'theme-ripple-contact_email','support@company.com',NULL,NULL),(19,'theme-ripple-site_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(20,'theme-ripple-phone','+(123) 345-6789',NULL,NULL),(21,'theme-ripple-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(22,'theme-ripple-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(23,'theme-ripple-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(24,'theme-ripple-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(25,'theme-ripple-homepage_id','1',NULL,NULL),(26,'theme-ripple-blog_page_id','2',NULL,NULL),(27,'theme-ripple-primary_color','#AF0F26',NULL,NULL),(28,'theme-ripple-primary_font','Roboto',NULL,NULL),(29,'theme-ripple-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(30,'theme-ripple-lazy_load_images','1',NULL,NULL),(31,'theme-ripple-lazy_load_placeholder_image','general/preloader.gif',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2025-04-28 21:43:59','2025-04-28 21:43:59'),(2,'blog',2,'Botble\\Page\\Models\\Page','','2025-04-28 21:43:59','2025-04-28 21:43:59'),(3,'contact',3,'Botble\\Page\\Models\\Page','','2025-04-28 21:43:59','2025-04-28 21:43:59'),(4,'cookie-policy',4,'Botble\\Page\\Models\\Page','','2025-04-28 21:43:59','2025-04-28 21:43:59'),(5,'galleries',5,'Botble\\Page\\Models\\Page','','2025-04-28 21:43:59','2025-04-28 21:43:59'),(6,'artificial-intelligence',1,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'cybersecurity',2,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'blockchain-technology',3,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(9,'5g-and-connectivity',4,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(10,'augmented-reality-ar',5,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(11,'green-technology',6,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(12,'quantum-computing',7,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(13,'edge-computing',8,'Botble\\Blog\\Models\\Category','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(14,'ai',1,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(15,'machine-learning',2,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(16,'neural-networks',3,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(17,'data-security',4,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(18,'blockchain',5,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(19,'cryptocurrency',6,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(20,'iot',7,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(21,'ar-gaming',8,'Botble\\Blog\\Models\\Tag','tag','2025-04-28 21:44:02','2025-04-28 21:44:02'),(22,'breakthrough-in-quantum-computing-computing-power-reaches-milestone',1,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(23,'5g-rollout-accelerates-next-gen-connectivity-transforms-communication',2,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(24,'tech-giants-collaborate-on-open-source-ai-framework',3,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(25,'spacex-launches-mission-to-establish-first-human-colony-on-mars',4,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(26,'cybersecurity-advances-new-protocols-bolster-digital-defense',5,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(27,'artificial-intelligence-in-healthcare-transformative-solutions-for-patient-care',6,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(28,'robotic-innovations-autonomous-systems-reshape-industries',7,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(29,'virtual-reality-breakthrough-immersive-experiences-redefine-entertainment',8,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(30,'innovative-wearables-track-health-metrics-and-enhance-well-being',9,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(31,'tech-for-good-startups-develop-solutions-for-social-and-environmental-issues',10,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(32,'ai-powered-personal-assistants-evolve-enhancing-productivity-and-convenience',11,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(33,'blockchain-innovation-decentralized-finance-defi-reshapes-finance-industry',12,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(34,'quantum-internet-secure-communication-enters-a-new-era',13,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(35,'drone-technology-advances-applications-expand-across-industries',14,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(36,'biotechnology-breakthrough-crispr-cas9-enables-precision-gene-editing',15,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(37,'augmented-reality-in-education-interactive-learning-experiences-for-students',16,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(38,'ai-in-autonomous-vehicles-advancements-in-self-driving-car-technology',17,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(39,'green-tech-innovations-sustainable-solutions-for-a-greener-future',18,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(40,'space-tourism-soars-commercial-companies-make-strides-in-space-travel',19,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(41,'humanoid-robots-in-everyday-life-ai-companions-and-assistants',20,'Botble\\Blog\\Models\\Post','','2025-04-28 21:44:02','2025-04-28 21:44:02'),(42,'sunset',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(43,'ocean-views',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(44,'adventure-time',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(45,'city-lights',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(46,'dreamscape',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(47,'enchanted-forest',6,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(48,'golden-hour',7,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(49,'serenity',8,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(50,'eternal-beauty',9,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(51,'moonlight-magic',10,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(52,'starry-night',11,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(53,'hidden-gems',12,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(54,'tranquil-waters',13,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(55,'urban-escape',14,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02'),(56,'twilight-zone',15,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'AI',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(2,'Machine Learning',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(3,'Neural Networks',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(4,'Data Security',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(5,'Blockchain',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(6,'Cryptocurrency',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(7,'IoT',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02'),(8,'AR Gaming',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-28 21:44:02','2025-04-28 21:44:02');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jeremy.yost@mcdermott.biz',NULL,'$2y$12$EVRH3xdSmnh7uIiTwBZN6eGn/scM9/Nghd8Rw6R2nCfhEsasamCvK',NULL,'2025-04-28 21:43:59','2025-04-28 21:43:59','Nikki','McKenzie','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'RecentPostsWidget','footer_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(2,'RecentPostsWidget','top_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(3,'TagsWidget','primary_sidebar','ripple',0,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(4,'BlogCategoriesWidget','primary_sidebar','ripple',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"display_posts_count\":\"yes\"}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(5,'CustomMenuWidget','primary_sidebar','ripple',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Social\",\"menu_id\":\"social\"}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(6,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',1,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Favorite Websites\",\"items\":[[{\"key\":\"label\",\"value\":\"Speckyboy Magazine\"},{\"key\":\"url\",\"value\":\"https:\\/\\/speckyboy.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Tympanus-Codrops\"},{\"key\":\"url\",\"value\":\"https:\\/\\/tympanus.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Botble Blog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/botble.com\\/blog\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Laravel Vietnam\"},{\"key\":\"url\",\"value\":\"https:\\/\\/blog.laravelvietnam.org\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"CreativeBlog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.creativebloq.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Archi Elite JSC\"},{\"key\":\"url\",\"value\":\"https:\\/\\/archielite.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}]]}','2025-04-28 21:44:08','2025-04-28 21:44:08'),(7,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"My Links\",\"items\":[[{\"key\":\"label\",\"value\":\"Home Page\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Green Technology\"},{\"key\":\"url\",\"value\":\"\\/green-technology\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Augmented Reality (AR) \"},{\"key\":\"url\",\"value\":\"\\/augmented-reality-ar\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Galleries\"},{\"key\":\"url\",\"value\":\"\\/galleries\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2025-04-28 21:44:08','2025-04-28 21:44:08');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 11:44:12
