-- MySQL dump 10.13  Distrib 5.7.44, for osx10.19 (x86_64)
--
-- Host: 127.0.0.1    Database: botble
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `activations` VALUES (1,1,'9bJAsOXCYLpOSETbB1xPATKnzCnAO9kx',1,'2025-01-17 17:56:32','2025-01-17 17:56:32','2025-01-17 17:56:32');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `blocks` VALUES (1,'Dakota Hettinger','dakota-hettinger','Atque quia nesciunt facilis.','Perspiciatis inventore quo aut odio quia asperiores culpa. Occaecati expedita animi velit sequi. Nemo quia molestiae doloribus quasi praesentium dolores error. Ad non assumenda et ea. Voluptatem animi blanditiis dolor mollitia. Minus quod non et assumenda natus non. Maiores numquam molestias ut accusamus magnam. Quibusdam et praesentium minima in. In soluta quis molestias laborum nihil consequatur dolorum. Nostrum amet quasi laudantium numquam debitis.','published',NULL,'2025-01-17 17:56:39','2025-01-17 17:56:39',NULL),(2,'Dr. Judge VonRueden V','dr-judge-vonrueden-v','Unde aspernatur nihil ratione ea veniam nostrum.','Iure qui temporibus deleniti magnam nisi. Voluptatibus consequuntur repellat est nemo qui vitae tempora. Officia dicta commodi architecto. A aut commodi id. Dolor natus architecto sed quia aut enim magnam. Doloribus animi laborum cupiditate sapiente labore autem dolore. Facilis eius omnis fugiat et rerum nihil dolor. Sequi enim maiores et minima eum eligendi est nisi. Officia dolores et adipisci fugiat omnis. Ad debitis corporis aut aliquid quia est.','published',NULL,'2025-01-17 17:56:39','2025-01-17 17:56:39',NULL),(3,'Maymie Kub','maymie-kub','Eos minus quasi fugit ex numquam debitis.','Autem quia veritatis vitae. Quisquam voluptatibus quia quia aspernatur. Voluptas fugiat in nostrum perferendis impedit numquam. Perspiciatis minima architecto perferendis. Quo sequi animi voluptates nulla et aut reprehenderit. Nemo voluptatem quod rem distinctio. Minus qui id earum nihil. Aut placeat dicta nihil exercitationem sit minima ut nesciunt. Et laboriosam eum earum expedita praesentium atque illum. Excepturi alias quia nulla magni provident qui ut. Debitis dolorem accusamus aut.','published',NULL,'2025-01-17 17:56:39','2025-01-17 17:56:39',NULL),(4,'Rupert Stanton','rupert-stanton','Sit aut fugiat et sed. Sit aut quas dolorum rem.','Illo maiores expedita praesentium. Consectetur temporibus consequatur officia doloribus iusto cumque molestiae quia. Reiciendis deserunt quis est consequatur repellat rerum. Molestias blanditiis possimus omnis adipisci ex rerum inventore. Laborum laboriosam rem ut est provident ut labore. Ratione debitis dolores dolorum quo enim quam. Mollitia praesentium voluptatem nobis enim.','published',NULL,'2025-01-17 17:56:39','2025-01-17 17:56:39',NULL),(5,'Evan Hintz MD','evan-hintz-md','Hic consequatur qui rerum.','Laudantium voluptas perferendis explicabo repudiandae. Veniam culpa rerum voluptatem sed voluptatum doloremque et. Consequatur ex voluptatibus aperiam odit. Cumque reiciendis magnam nam numquam velit incidunt sunt fugiat. Commodi et aperiam rerum commodi omnis saepe culpa. Exercitationem aliquid velit possimus porro dolores ea ut repellendus. Voluptas dolorem minus suscipit ratione tenetur. Accusantium commodi qui sequi voluptatem nihil laboriosam in. Eos culpa rerum reprehenderit animi qui.','published',NULL,'2025-01-17 17:56:39','2025-01-17 17:56:39',NULL);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_translations`
--

DROP TABLE IF EXISTS `blocks_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `categories` VALUES (1,'Artificial Intelligence',0,'Impedit nobis voluptas nisi autem consequatur. Unde sed hic accusamus aut. Architecto eos cum vel iure rerum esse. Non ullam quos repellat officiis expedita repudiandae odio.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(2,'Cybersecurity',0,'Consequatur est aut et quisquam pariatur molestiae. Deserunt dolores id voluptatem labore aspernatur ipsum quae nemo. Doloribus blanditiis quis sed eum cum repellendus nisi.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(3,'Blockchain Technology',0,'Labore possimus voluptatem corrupti autem enim. Praesentium est quam dolores pariatur dicta temporibus.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(4,'5G and Connectivity',0,'Vel numquam voluptatem est deleniti. Officia qui libero fugit similique voluptatibus libero. Sed maxime qui fugiat a ipsum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(5,'Augmented Reality (AR)',0,'Qui nemo quo aut cupiditate fugiat voluptatem nesciunt. Quam itaque amet voluptatem. Vero dicta incidunt sunt voluptate. Quis quasi error et illo numquam vel mollitia nobis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(6,'Green Technology',0,'Reprehenderit eveniet laboriosam quo ea quia. Eveniet ipsam porro fuga natus ut velit et. Optio ipsum eligendi est non.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'Quantum Computing',0,'Est recusandae eaque dolorum ut aut. Veritatis consequatur iusto corporis harum. Qui qui vel veniam perferendis et. Qui dignissimos quibusdam eum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'Edge Computing',0,'Quia iure at corporis nam. Pariatur dicta consectetur qui dolor ea. Recusandae enim est aut molestiae pariatur mollitia.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `contacts` VALUES (1,'Prof. Oma Pfeffer MD','juana68@example.com','(253) 736-4000','93761 King Locks Apt. 910\nWillmsshire, MD 64942-4038','Voluptas vitae quia inventore saepe ex unde et.','Similique atque possimus id sit. Dolorum similique blanditiis consequatur doloremque quo quo sed. Excepturi maxime doloremque porro deleniti id. Soluta sequi et est omnis repudiandae. Eaque est est est quaerat. Laudantium ut aut qui accusantium. Sit impedit impedit nisi quos ea nemo. Dolore voluptates minus velit suscipit iste. Enim nemo cumque at earum dolores. Porro et perspiciatis impedit nihil quidem nihil. Assumenda corrupti nulla aliquam eveniet rerum aliquid laudantium totam.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(2,'Estefania Braun','alice12@example.com','276-988-0435','9404 Towne Meadows\nAlbertofort, WA 61452-5775','Autem id quam nulla dolorem aut corporis sint.','Ut qui eum adipisci omnis quis unde repudiandae. Mollitia voluptatem at sed sed molestiae et provident. Quidem eum molestiae harum voluptates. Inventore sunt dolore ad tenetur eos. Voluptas sed eos accusantium aut quidem architecto architecto. Nisi maiores deserunt aut tempora. Tempora et id veniam laborum quibusdam sequi. Fuga aperiam iste accusamus cumque placeat aut. Labore repellat veniam impedit. Dolorem minus amet voluptas eos necessitatibus. Ab consectetur repellat similique quas.',NULL,'read','2025-01-17 17:56:39','2025-01-17 17:56:39'),(3,'Zoila Veum','destiny.satterfield@example.org','254.573.8403','62289 Dietrich Lodge Apt. 044\nSabrinabury, MI 10971-3298','Placeat facilis beatae tempora aut in unde.','Veniam dolore qui deserunt. Nemo magni ad est. Molestiae ducimus et et. Omnis et voluptas laudantium tenetur soluta quo. Doloremque totam modi ducimus excepturi explicabo id. Minus cum nulla minus voluptas. Aut id totam omnis fugiat. Aut temporibus vero in. Voluptatem voluptas suscipit est vero atque et atque. Quia et consequatur molestias deleniti. Consectetur error corrupti pariatur nihil. Occaecati dignissimos id pariatur porro assumenda.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(4,'Dr. Orie Gutmann Sr.','zieme.shanna@example.com','+1-423-834-3370','13485 Orn Circles Apt. 426\nRebekahaven, WV 13262','Qui incidunt ab deleniti tenetur est ex.','Officia qui voluptas qui at debitis veritatis dolorum. Aut fugiat ab tempore. Sint sed et ea eos aspernatur incidunt qui. Quibusdam nulla enim aperiam. Quia accusantium est quidem tenetur. Sit cupiditate placeat dignissimos laborum repellendus voluptatibus inventore. Accusamus est iure dolorem.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(5,'Else Mosciski','wisozk.geo@example.com','+1 (724) 766-1557','30458 Lia Locks\nNew Parkerside, PA 10309','Officia unde magnam ut quis odit dolor.','Iste et perferendis alias aut consequatur blanditiis. Deleniti occaecati modi eum neque dolorem. Aut qui enim ab quos voluptate. Totam ut aliquid vel ab sequi. Modi id nostrum ab ut est et consequatur. Culpa eum incidunt et architecto assumenda. Quaerat laboriosam ut perferendis quisquam doloremque. Minima neque nemo consequatur et.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(6,'Mr. Dillan Little V','hayden75@example.com','+1-512-674-4131','312 Kertzmann Lodge Suite 780\nLake Shaneborough, CT 80846-7274','Aut itaque deserunt sint ipsum maiores rerum.','Dolorem voluptatem non molestiae. Placeat nostrum accusamus quam alias recusandae. Laboriosam accusantium quia nam magnam dolor aliquid impedit vel. Minima rerum nihil molestias. Et debitis quia qui officia atque inventore explicabo. Hic accusantium aut porro ut odio qui illo quia. Aut et labore sunt ipsam rerum. Eum omnis aut sed. Repudiandae facilis et omnis. Nihil necessitatibus voluptatem et cum qui. Est saepe neque enim qui suscipit et.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(7,'Lavonne Lehner','runolfsdottir.deja@example.net','386-401-7771','57702 Wisoky Hill Suite 817\nPort Treverchester, WV 02427','Doloribus nisi similique velit minus.','Consequatur voluptatem sint incidunt totam earum suscipit. Earum iusto officiis sequi dolorem nostrum. In aspernatur aut aut. Tempore eveniet repellendus alias vel soluta sed. Veritatis quia voluptate aut velit. Labore et aperiam nam ratione harum consequuntur tenetur. Ea ut ratione illum rerum et inventore. Et accusantium et ipsum nobis. Ex rem perferendis nulla est consequuntur enim quam placeat.',NULL,'read','2025-01-17 17:56:39','2025-01-17 17:56:39'),(8,'Mrs. Leanne Green MD','amina57@example.org','(743) 239-4749','318 Haley Islands\nBeahanbury, SD 01067','Fuga ipsum animi expedita et.','Eius dolorum est et asperiores explicabo assumenda. Mollitia cum quia qui tempora architecto. Natus ut autem dolorem placeat. Dolore hic vero sit porro temporibus ea quo. Magnam doloribus exercitationem quis. Illo nihil est labore officia distinctio. Quas magni voluptatem eveniet occaecati iusto eum sed. Velit aut itaque sunt nam quia nihil et. Qui quis qui et occaecati eos quae. Facere dolore illo sint sed aliquid eos deserunt cupiditate.',NULL,'read','2025-01-17 17:56:39','2025-01-17 17:56:39'),(9,'Frederic Satterfield','schamberger.chasity@example.com','(757) 430-9590','1441 Blanda Turnpike\nSallieville, NY 21858','Id qui velit animi minima illo.','Placeat distinctio sunt veniam officia facere. Dolores mollitia aut saepe voluptatibus recusandae eligendi. Non assumenda quo ipsam voluptatem ut eaque reprehenderit labore. Sit quas et et dicta non voluptatem aut. Inventore dignissimos natus id. Architecto libero praesentium at qui nemo unde doloremque. Vitae quasi et voluptatem quia rerum quo ut enim. Quis est quod quia quia. Ea iusto nesciunt at ipsum vero magnam et.',NULL,'unread','2025-01-17 17:56:39','2025-01-17 17:56:39'),(10,'Erna Beatty','gsenger@example.net','941.409.2667','23112 Abshire Stravenue\nNew Sharon, TN 35334','Voluptas iste dolores est nihil.','Harum velit ea aut nemo. Sint et fuga quasi. Sunt culpa qui impedit modi minima voluptate. Sunt eos quaerat quia animi recusandae corporis. Voluptates nulla nam asperiores et tempore qui consequuntur dolor. Soluta natus numquam occaecati aut dolorum officiis rerum. Earum qui facilis vel aliquid expedita earum quia. Accusantium aut dolorem veniam iusto rerum.',NULL,'read','2025-01-17 17:56:39','2025-01-17 17:56:39');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `fob_comments` VALUES (1,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Brody Funk','charvey@gmail.com','https://friendsofbotble.com','This is really helpful, thank you!','approved','88.163.122.216','Mozilla/5.0 (iPhone; CPU iPhone OS 15_2 like Mac OS X) AppleWebKit/533.1 (KHTML, like Gecko) Version/15.0 EdgiOS/79.01072.97 Mobile/15E148 Safari/533.1','2025-01-08 22:31:08','2025-01-17 17:56:39'),(2,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',5,'https://botble.test','Eve Becker','milford.kulas@kshlerin.biz','https://friendsofbotble.com','I found this article to be quite informative.','approved','167.151.162.44','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_7) AppleWebKit/5331 (KHTML, like Gecko) Chrome/37.0.881.0 Mobile Safari/5331','2024-12-24 15:22:54','2025-01-17 17:56:39'),(3,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Dino Fritsch DVM','damore.jailyn@kutch.com','https://friendsofbotble.com','Wow, I never knew about this before!','approved','134.16.122.59','Opera/8.62 (X11; Linux x86_64; en-US) Presto/2.9.343 Version/12.00','2024-12-23 08:22:54','2025-01-17 17:56:39'),(4,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',9,'https://botble.test','Prof. Sherwood Jaskolski','kelsie.kirlin@gmail.com','https://friendsofbotble.com','Great job on explaining such a complex topic.','approved','31.170.35.80','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8 rv:3.0; en-US) AppleWebKit/531.46.4 (KHTML, like Gecko) Version/4.0 Safari/531.46.4','2025-01-17 01:14:38','2025-01-17 17:56:39'),(5,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',20,'https://botble.test','Mrs. Nina Abernathy','jadyn.upton@boehm.net','https://friendsofbotble.com','I have a question about the third paragraph.','approved','1.245.47.60','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5330 (KHTML, like Gecko) Chrome/40.0.898.0 Mobile Safari/5330','2024-12-21 05:22:17','2025-01-17 17:56:39'),(6,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Ocie Prosacco','emurray@runolfsdottir.com','https://friendsofbotble.com','This article changed my perspective entirely.','approved','169.14.166.145','Mozilla/5.0 (compatible; MSIE 10.0; Windows CE; Trident/5.1)','2025-01-15 21:25:40','2025-01-17 17:56:39'),(7,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Brent Collier','crist.angelina@hotmail.com','https://friendsofbotble.com','I appreciate the effort you put into this.','approved','219.105.68.229','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5 rv:5.0; sl-SI) AppleWebKit/532.4.3 (KHTML, like Gecko) Version/5.1 Safari/532.4.3','2025-01-11 15:03:05','2025-01-17 17:56:39'),(8,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',2,'https://botble.test','Berniece Trantow','jenkins.kyla@friesen.org','https://friendsofbotble.com','This is exactly what I was looking for, thank you!','approved','239.245.61.160','Opera/8.88 (X11; Linux i686; en-US) Presto/2.9.312 Version/12.00','2025-01-08 16:14:42','2025-01-17 17:56:39'),(9,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',4,'https://botble.test','Paige Hand','alvah.wunsch@hotmail.com','https://friendsofbotble.com','I disagree with some points mentioned here, though.','approved','11.250.172.249','Mozilla/5.0 (iPad; CPU OS 8_1_1 like Mac OS X; nl-NL) AppleWebKit/535.28.7 (KHTML, like Gecko) Version/3.0.5 Mobile/8B119 Safari/6535.28.7','2024-12-19 12:46:14','2025-01-17 17:56:39'),(10,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',10,'https://botble.test','Harrison Rogahn II','windler.nathan@hotmail.com','https://friendsofbotble.com','Could you provide more examples to illustrate your point?','approved','157.213.80.134','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/83.0.4643.64 Safari/532.2 EdgA/83.01034.73','2025-01-12 20:28:31','2025-01-17 17:56:39'),(11,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',9,'https://botble.test','Miss Cheyanne Hackett PhD','tillman.simeon@carroll.com','https://friendsofbotble.com','I wish there were more articles like this out there.','approved','150.16.210.15','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20221224 Firefox/37.0','2025-01-01 16:53:48','2025-01-17 17:56:39'),(12,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',20,'https://botble.test','Mr. Jessy Hayes I','phuels@buckridge.com','https://friendsofbotble.com','I\'m bookmarking this for future reference.','approved','243.49.127.161','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0)','2025-01-05 04:52:41','2025-01-17 17:56:39'),(13,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Mr. Jayde Strosin Jr.','joanne91@sanford.net','https://friendsofbotble.com','I\'ve shared this with my friends, they loved it!','approved','89.149.33.99','Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/534.0 (KHTML, like Gecko) Version/15.0 EdgiOS/93.01023.28 Mobile/15E148 Safari/534.0','2025-01-02 12:42:34','2025-01-17 17:56:39'),(14,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',20,'https://botble.test','Delbert Torphy','vlindgren@lesch.info','https://friendsofbotble.com','This article is a must-read for everyone interested in the topic.','approved','145.211.64.115','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.2; Trident/5.0)','2025-01-11 02:17:34','2025-01-17 17:56:39'),(15,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Valentina Runolfsson','monroe25@gmail.com','https://friendsofbotble.com','Thank you for shedding light on this important issue.','approved','23.181.221.83','Mozilla/5.0 (iPhone; CPU iPhone OS 15_2 like Mac OS X) AppleWebKit/536.1 (KHTML, like Gecko) Version/15.0 EdgiOS/88.01098.83 Mobile/15E148 Safari/536.1','2024-12-21 02:30:28','2025-01-17 17:56:39'),(16,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Blake Hauck','eloise40@mertz.biz','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article.','approved','42.133.225.209','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_9 rv:6.0) Gecko/20181208 Firefox/36.0','2024-12-27 02:04:18','2025-01-17 17:56:39'),(17,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',8,'https://botble.test','Clay Kuvalis','gebert@yahoo.com','https://friendsofbotble.com','I\'m blown away by the insights shared in this article.','approved','172.25.16.53','Opera/8.91 (Windows NT 5.1; en-US) Presto/2.9.305 Version/12.00','2024-12-27 00:30:14','2025-01-17 17:56:39'),(18,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',4,'https://botble.test','Dr. Kamron Gleason','osinski.jazmyn@gmail.com','https://friendsofbotble.com','This article tackles a complex topic with clarity.','approved','16.136.29.168','Mozilla/5.0 (Windows; U; Windows NT 6.2) AppleWebKit/535.48.2 (KHTML, like Gecko) Version/4.0 Safari/535.48.2','2024-12-24 06:01:22','2025-01-17 17:56:39'),(19,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Mr. Carson Feeney Sr.','hagenes.lonny@becker.com','https://friendsofbotble.com','I\'m going to reflect on the ideas presented in this article.','approved','170.139.219.85','Mozilla/5.0 (Windows NT 5.2) AppleWebKit/5352 (KHTML, like Gecko) Chrome/38.0.888.0 Mobile Safari/5352','2025-01-02 10:31:50','2025-01-17 17:56:39'),(20,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Kayden Pollich','kassandra44@powlowski.com','https://friendsofbotble.com','The author\'s passion for the subject shines through in this article.','approved','227.156.10.80','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_7) AppleWebKit/5342 (KHTML, like Gecko) Chrome/39.0.892.0 Mobile Safari/5342','2024-12-31 05:10:34','2025-01-17 17:56:39'),(21,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',12,'https://botble.test','Miss Lacy Adams DDS','xheller@gmail.com','https://friendsofbotble.com','This article challenged my preconceptions in a thought-provoking way.','approved','56.119.29.233','Opera/9.53 (Windows NT 6.1; en-US) Presto/2.8.265 Version/12.00','2025-01-13 05:56:47','2025-01-17 17:56:39'),(22,NULL,'Botble\\Member\\Models\\Member',8,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Lamar Kautzer MD','ikozey@hotmail.com','https://friendsofbotble.com','I\'ve added this article to my reading list, it\'s worth revisiting.','approved','81.71.202.66','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_6_4) AppleWebKit/5330 (KHTML, like Gecko) Chrome/38.0.805.0 Mobile Safari/5330','2024-12-27 13:06:51','2025-01-17 17:56:39'),(23,NULL,'Botble\\Member\\Models\\Member',7,'Botble\\Blog\\Models\\Post',2,'https://botble.test','Dagmar Tremblay','ebert.lucy@yahoo.com','https://friendsofbotble.com','This article offers practical advice that I can apply in real life.','approved','95.29.241.157','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_5_2 rv:2.0; nl-NL) AppleWebKit/532.24.6 (KHTML, like Gecko) Version/5.0 Safari/532.24.6','2024-12-23 03:01:52','2025-01-17 17:56:39'),(24,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',10,'https://botble.test','Dr. Wilhelmine Harber','manuela69@hotmail.com','https://friendsofbotble.com','I\'m going to recommend this article to my study group.','approved','141.165.123.8','Opera/9.95 (X11; Linux x86_64; en-US) Presto/2.10.194 Version/10.00','2025-01-03 06:31:31','2025-01-17 17:56:39'),(25,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',18,'https://botble.test','Ms. Keira Frami IV','ehirthe@olson.com','https://friendsofbotble.com','The examples provided really helped me understand the concept better.','approved','5.178.253.227','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_1 rv:2.0; nl-NL) AppleWebKit/535.14.5 (KHTML, like Gecko) Version/5.0.4 Safari/535.14.5','2025-01-06 21:26:31','2025-01-17 17:56:39'),(26,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Alan Bednar II','grant.brandi@dooley.org','https://friendsofbotble.com','I resonate with the ideas presented here.','approved','154.192.161.110','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 5.01; Trident/4.0)','2025-01-10 19:26:20','2025-01-17 17:56:39'),(27,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Maya Wunsch','elmo43@hotmail.com','https://friendsofbotble.com','This article made me think critically about the topic.','approved','189.53.88.172','Mozilla/5.0 (X11; Linux x86_64; rv:7.0) Gecko/20160724 Firefox/36.0','2024-12-30 14:04:48','2025-01-17 17:56:39'),(28,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Waldo Torp Sr.','bstroman@metz.biz','https://friendsofbotble.com','I\'ll definitely come back to this article for reference.','approved','51.228.160.49','Mozilla/5.0 (Windows NT 4.0) AppleWebKit/5360 (KHTML, like Gecko) Chrome/38.0.876.0 Mobile Safari/5360','2025-01-10 21:48:28','2025-01-17 17:56:39'),(29,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Bertram Haag','alyson90@bode.com','https://friendsofbotble.com','I\'ve shared this on social media, it\'s too good not to share.','approved','225.200.153.13','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_9) AppleWebKit/537.0 (KHTML, like Gecko) Chrome/98.0.4260.69 Safari/537.0 Edg/98.01028.91','2024-12-20 12:07:29','2025-01-17 17:56:40'),(30,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',10,'https://botble.test','Etha Altenwerth','arely.gorczany@jacobi.org','https://friendsofbotble.com','This article presents a balanced view on a controversial topic.','approved','215.79.168.243','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8 rv:4.0; nl-NL) AppleWebKit/535.24.2 (KHTML, like Gecko) Version/4.0 Safari/535.24.2','2025-01-03 16:26:11','2025-01-17 17:56:40'),(31,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',19,'https://botble.test','Stuart Schowalter','hbotsford@gmail.com','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s a gem.','approved','96.199.121.63','Opera/8.58 (Windows 95; en-US) Presto/2.11.310 Version/12.00','2024-12-24 10:04:06','2025-01-17 17:56:40'),(32,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',18,'https://botble.test','Gabe Krajcik DDS','reginald56@veum.com','https://friendsofbotble.com','I\'ve been struggling with this, your article helped a lot.','approved','137.101.162.28','Opera/8.95 (X11; Linux i686; sl-SI) Presto/2.11.353 Version/12.00','2024-12-27 06:33:02','2025-01-17 17:56:40'),(33,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',15,'https://botble.test','Prof. Dorothea Kuvalis I','zaria52@oconnell.com','https://friendsofbotble.com','I\'ve learned something new today, thanks to this article.','approved','92.68.16.73','Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.2 (KHTML, like Gecko) Chrome/88.0.4543.96 Safari/536.2 Edg/88.01006.34','2025-01-13 05:42:34','2025-01-17 17:56:40'),(34,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',3,'https://botble.test','Prof. Adeline Morar III','dora.wunsch@spencer.biz','https://friendsofbotble.com','Kudos to the author for a well-researched piece.','approved','17.198.111.127','Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/99.0.4270.45 Safari/535.2 EdgA/99.01110.29','2024-12-27 00:20:21','2025-01-17 17:56:40'),(35,NULL,'Botble\\Member\\Models\\Member',3,'Botble\\Blog\\Models\\Post',4,'https://botble.test','Ms. Germaine Schoen','gcole@gmail.com','https://friendsofbotble.com','I\'m impressed by the depth of knowledge demonstrated here.','approved','82.63.65.165','Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/535.0 (KHTML, like Gecko) Version/15.0 EdgiOS/83.01131.36 Mobile/15E148 Safari/535.0','2024-12-23 22:46:29','2025-01-17 17:56:40'),(36,NULL,'Botble\\Member\\Models\\Member',0,'Botble\\Blog\\Models\\Post',3,'https://botble.test','Jammie Ankunding','hickle.jermey@hotmail.com','https://friendsofbotble.com','This article challenged my assumptions in a good way.','approved','238.3.108.227','Mozilla/5.0 (X11; Linux i686; rv:6.0) Gecko/20101028 Firefox/37.0','2025-01-05 09:15:39','2025-01-17 17:56:40'),(37,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',9,'https://botble.test','Forrest Boehm','dlabadie@legros.org','https://friendsofbotble.com','I\'ve shared this with my colleagues, it\'s worth discussing.','approved','107.136.14.140','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5351 (KHTML, like Gecko) Chrome/36.0.894.0 Mobile Safari/5351','2024-12-20 23:48:21','2025-01-17 17:56:40'),(38,NULL,'Botble\\Member\\Models\\Member',9,'Botble\\Blog\\Models\\Post',11,'https://botble.test','Harmony Stamm III','burnice.cassin@hotmail.com','https://friendsofbotble.com','The information presented here is very valuable.','approved','56.181.27.26','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5351 (KHTML, like Gecko) Chrome/40.0.877.0 Mobile Safari/5351','2024-12-23 04:43:37','2025-01-17 17:56:40'),(39,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Mrs. Eliane Jacobson II','percival38@hotmail.com','https://friendsofbotble.com','You have a talent for explaining complex topics clearly.','approved','66.164.78.111','Opera/9.24 (X11; Linux i686; nl-NL) Presto/2.9.303 Version/12.00','2024-12-21 17:18:55','2025-01-17 17:56:40'),(40,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',4,'https://botble.test','Kiel Gaylord MD','lauryn16@goodwin.info','https://friendsofbotble.com','I\'m inspired to learn more about this after reading your article.','approved','8.193.246.170','Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X; nl-NL) AppleWebKit/532.18.4 (KHTML, like Gecko) Version/3.0.5 Mobile/8B113 Safari/6532.18.4','2025-01-05 05:13:29','2025-01-17 17:56:40'),(41,NULL,'Botble\\Member\\Models\\Member',6,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Kenneth Macejkovic','schuppe.layla@yahoo.com','https://friendsofbotble.com','This article deserves wider recognition.','approved','17.176.152.78','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8 rv:5.0) Gecko/20231219 Firefox/36.0','2024-12-27 17:32:06','2025-01-17 17:56:40'),(42,NULL,'Botble\\Member\\Models\\Member',5,'Botble\\Blog\\Models\\Post',17,'https://botble.test','Dandre Lind','mwillms@yahoo.com','https://friendsofbotble.com','I\'m grateful for the insights shared in this piece.','approved','177.109.103.177','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5331 (KHTML, like Gecko) Chrome/40.0.896.0 Mobile Safari/5331','2025-01-03 00:50:08','2025-01-17 17:56:40'),(43,NULL,'Botble\\Member\\Models\\Member',10,'Botble\\Blog\\Models\\Post',14,'https://botble.test','Arthur Moore','jesse89@hotmail.com','https://friendsofbotble.com','The author presents a balanced view on a controversial topic.','approved','229.33.236.172','Mozilla/5.0 (Windows NT 6.0) AppleWebKit/5350 (KHTML, like Gecko) Chrome/40.0.810.0 Mobile Safari/5350','2024-12-30 15:57:49','2025-01-17 17:56:40'),(44,NULL,'Botble\\Member\\Models\\Member',1,'Botble\\Blog\\Models\\Post',11,'https://botble.test','Austen Donnelly','ykemmer@gmail.com','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s','approved','30.141.79.223','Mozilla/5.0 (Windows; U; Windows NT 6.0) AppleWebKit/531.4.7 (KHTML, like Gecko) Version/5.1 Safari/531.4.7','2025-01-16 02:09:30','2025-01-17 17:56:40'),(45,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',13,'https://botble.test','Brooke Maggio','oosinski@mayer.com','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article. It\'s incredibly insightful and provides a comprehensive overview of the subject matter. I appreciate the effort put into researching and writing this piece. It\'s truly eye-opening and has given me a new perspective. Thank you for sharing your knowledge with us!','approved','25.118.136.62','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5361 (KHTML, like Gecko) Chrome/38.0.841.0 Mobile Safari/5361','2024-12-26 02:52:11','2025-01-17 17:56:40'),(46,NULL,'Botble\\Member\\Models\\Member',2,'Botble\\Blog\\Models\\Post',6,'https://botble.test','Yasmeen Murphy','nlubowitz@kihn.com','https://friendsofbotble.com','This article is a masterpiece! It dives deep into the topic and offers valuable insights that are both thought-provoking and enlightening. The author\'s expertise is evident throughout, making it a compelling read from start to finish. I\'ll definitely be coming back to this for reference in the future.','approved','133.149.30.181','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/531.0 (KHTML, like Gecko) Chrome/93.0.4038.97 Safari/531.0 EdgA/93.01091.29','2024-12-25 17:59:49','2025-01-17 17:56:40'),(47,NULL,'Botble\\Member\\Models\\Member',4,'Botble\\Blog\\Models\\Post',16,'https://botble.test','Gudrun Koepp','schowalter.jaylin@towne.biz','https://friendsofbotble.com','I\'m amazed by the depth of analysis in this article. It covers a wide range of aspects related to the topic, providing a comprehensive understanding. The clarity of explanation is commendable, making complex concepts easy to grasp. This article has enriched my understanding and sparked further curiosity. Kudos to the author!','approved','72.215.71.170','Opera/9.67 (Windows NT 6.0; nl-NL) Presto/2.10.334 Version/10.00','2024-12-18 07:29:15','2025-01-17 17:56:40');
/*!40000 ALTER TABLE `fob_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `galleries` VALUES (1,'Sunset','Animi facere totam eum deserunt fuga aperiam. Veniam dolor sit doloribus et. Debitis quam ut ea. Consequatur sit ipsum eaque non eveniet.',1,0,'news/6.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(2,'Ocean Views','Non neque nihil aut voluptas minus. Maxime cum velit ea qui et praesentium reprehenderit. Animi qui odio ipsa iste quo sequi sit.',1,0,'news/7.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(3,'Adventure Time','Voluptatibus et ut sint nemo nostrum laboriosam. Asperiores rem illum sunt quasi eligendi enim ipsum. Occaecati voluptatem consequatur consequuntur.',1,0,'news/8.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(4,'City Lights','Dolorum earum dolorum est occaecati aperiam voluptas minus. Ut et ea eius quidem. Atque consequuntur repellat in laborum sed.',1,0,'news/9.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(5,'Dreamscape','Rerum quas deleniti ea earum explicabo ea velit. Tempore veniam libero maxime dolorem odit delectus vero. Assumenda illum recusandae omnis eveniet.',1,0,'news/10.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(6,'Enchanted Forest','Minus qui ut minima quia qui in labore. Aut ipsa et labore harum repudiandae eveniet amet. Et at eum aut et tempora sed.',1,0,'news/11.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'Golden Hour','Omnis repellat non libero ipsum sed. Nulla sed molestias et eos facere est nostrum et. Et animi inventore perferendis consectetur facilis quis.',0,0,'news/12.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'Serenity','Voluptas temporibus aut non et. Quia ad ipsam laboriosam dolore deleniti et. Soluta molestiae molestias sed labore corporis.',0,0,'news/13.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(9,'Eternal Beauty','Eos et aut qui molestiae earum. Quo modi animi ut blanditiis. Ut natus quo et quo et.',0,0,'news/14.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(10,'Moonlight Magic','Eligendi ex eum enim dolorem. Modi et aut accusamus enim. Eaque iste reprehenderit magnam voluptatem consequatur doloribus et nisi.',0,0,'news/15.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(11,'Starry Night','Quia nobis et necessitatibus sed. Rerum hic quis quisquam numquam magnam perferendis.',0,0,'news/16.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(12,'Hidden Gems','Quas voluptates omnis iste dicta quis. Eos totam modi tenetur suscipit unde aperiam. Velit omnis eveniet dolores animi. Autem rerum facilis quo.',0,0,'news/17.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(13,'Tranquil Waters','Dolor voluptatem necessitatibus ea possimus non. Sit iusto ut veniam incidunt. Minus et vel iusto et saepe quis a.',0,0,'news/18.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(14,'Urban Escape','Dolorem et facere tenetur eum aspernatur aut. Atque id reprehenderit eos ea. Consequatur fuga earum nisi est. Similique laborum incidunt esse.',0,0,'news/19.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(15,'Twilight Zone','Eum autem nam hic eius aperiam quis eos. Molestiae ut iste nobis. Voluptatum expedita et totam suscipit consequatur reiciendis soluta exercitationem.',0,0,'news/20.jpg',1,'published','2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(2,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(3,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(4,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(5,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(6,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',7,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',8,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(9,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',9,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(10,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',10,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(11,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',11,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(12,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',12,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(13,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',13,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(14,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',14,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34'),(15,'[{\"img\":\"news\\/1.jpg\",\"description\":\"At fuga possimus non numquam dolores quia. Qui rerum dignissimos itaque consequuntur. Qui rerum libero nemo quas.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Odit possimus ipsa ut praesentium maxime. Doloribus eum nihil aut architecto harum.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Exercitationem eum occaecati repellat a. Voluptas nihil magni nobis culpa modi quidem voluptas.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Molestias laudantium provident minima officiis aut eligendi voluptate quis. Maiores et necessitatibus quo omnis itaque.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Provident omnis quos laudantium. Ipsum rem id ut temporibus ut. Sit modi iure earum atque animi sunt asperiores.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Autem totam consequatur enim culpa. Voluptatum voluptas nisi aspernatur. Rem est totam hic ex quia architecto.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Illum est ut neque dignissimos vel voluptas animi. Sit laudantium in dignissimos dolore. Numquam quia eum maxime facere.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Libero voluptatem quisquam odio fugiat quas est minima. Rerum sint debitis ipsa eos distinctio recusandae. Et possimus rerum quidem aspernatur totam.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Veritatis nemo nam consectetur. Vel consequatur a sed maiores quibusdam. Sunt minima reiciendis et qui laboriosam.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Qui necessitatibus molestiae voluptatem pariatur corporis. Illo expedita et reprehenderit. Cupiditate iure commodi sequi velit perspiciatis eaque.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Fuga libero quisquam sunt quas quia quia. Aut qui quisquam veritatis voluptatem ea. Consequatur officiis voluptas voluptatibus nostrum perferendis.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Distinctio quis eum quia explicabo maxime. Et quia quas necessitatibus. Pariatur sit sed error.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Veniam et quis omnis nihil. Ut laborum ducimus sit praesentium. Placeat numquam qui vel ut vero enim.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Veritatis reiciendis laborum et nobis eos quia. Itaque ea eligendi qui aut cupiditate ex.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Sint minus dolores dolorum vitae vel. Reprehenderit nihil dolorem velit quod. Omnis et sint culpa nulla. Commodi et porro incidunt et.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Dolorem ut quia sunt doloremque. Ipsum velit quod dolorem possimus. Totam iure numquam laborum sit alias. Totam ut adipisci commodi sed et.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Dolores in et temporibus harum aspernatur. Iusto et aut quisquam enim hic saepe.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Id illum quibusdam sit dolorem asperiores qui consectetur. Nihil autem quod nostrum dolor quia.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Eligendi dolorem culpa reprehenderit ut repudiandae. Aut voluptas est rem nihil facilis sint eligendi. Sed odio quis aliquid.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Aut velit nobis nihil sed. Harum eius accusantium consequatur aut iste. Ipsum et est fugiat alias perferendis. Consequatur vel eius vel.\"}]',15,'Botble\\Gallery\\Models\\Gallery','2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `language_meta` VALUES (1,'en_US','ed5bea729b2570f435076163d3e7c9a7',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','ed89466d6ededf6addad5cd617e1517d',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','934d9b581e49d51f3cf9f4b1cc70020e',2,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',9803,'news/1.jpg','[]','2025-01-17 17:56:32','2025-01-17 17:56:32',NULL,'public'),(2,0,'10','10',1,'image/jpeg',9803,'news/10.jpg','[]','2025-01-17 17:56:32','2025-01-17 17:56:32',NULL,'public'),(3,0,'11','11',1,'image/jpeg',9803,'news/11.jpg','[]','2025-01-17 17:56:32','2025-01-17 17:56:32',NULL,'public'),(4,0,'12','12',1,'image/jpeg',9803,'news/12.jpg','[]','2025-01-17 17:56:32','2025-01-17 17:56:32',NULL,'public'),(5,0,'13','13',1,'image/jpeg',9803,'news/13.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(6,0,'14','14',1,'image/jpeg',9803,'news/14.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(7,0,'15','15',1,'image/jpeg',9803,'news/15.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(8,0,'16','16',1,'image/jpeg',9803,'news/16.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(9,0,'17','17',1,'image/jpeg',9803,'news/17.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(10,0,'18','18',1,'image/jpeg',9803,'news/18.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(11,0,'19','19',1,'image/jpeg',9803,'news/19.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(12,0,'2','2',1,'image/jpeg',9803,'news/2.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(13,0,'20','20',1,'image/jpeg',9803,'news/20.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(14,0,'3','3',1,'image/jpeg',9803,'news/3.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(15,0,'4','4',1,'image/jpeg',9803,'news/4.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(16,0,'5','5',1,'image/jpeg',9803,'news/5.jpg','[]','2025-01-17 17:56:33','2025-01-17 17:56:33',NULL,'public'),(17,0,'6','6',1,'image/jpeg',9803,'news/6.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(18,0,'7','7',1,'image/jpeg',9803,'news/7.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(19,0,'8','8',1,'image/jpeg',9803,'news/8.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(20,0,'9','9',1,'image/jpeg',9803,'news/9.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(21,0,'1','1',2,'image/jpeg',9803,'members/1.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(22,0,'10','10',2,'image/jpeg',9803,'members/10.jpg','[]','2025-01-17 17:56:34','2025-01-17 17:56:34',NULL,'public'),(23,0,'11','11',2,'image/jpeg',9803,'members/11.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(24,0,'12','12',2,'image/jpeg',9803,'members/12.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(25,0,'13','13',2,'image/jpeg',9803,'members/13.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(26,0,'14','14',2,'image/jpeg',9803,'members/14.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(27,0,'15','15',2,'image/jpeg',9803,'members/15.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(28,0,'2','2',2,'image/jpeg',9803,'members/2.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(29,0,'3','3',2,'image/jpeg',9803,'members/3.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(30,0,'4','4',2,'image/jpeg',9803,'members/4.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(31,0,'5','5',2,'image/jpeg',9803,'members/5.jpg','[]','2025-01-17 17:56:35','2025-01-17 17:56:35',NULL,'public'),(32,0,'6','6',2,'image/jpeg',9803,'members/6.jpg','[]','2025-01-17 17:56:36','2025-01-17 17:56:36',NULL,'public'),(33,0,'7','7',2,'image/jpeg',9803,'members/7.jpg','[]','2025-01-17 17:56:36','2025-01-17 17:56:36',NULL,'public'),(34,0,'8','8',2,'image/jpeg',9803,'members/8.jpg','[]','2025-01-17 17:56:36','2025-01-17 17:56:36',NULL,'public'),(35,0,'9','9',2,'image/jpeg',9803,'members/9.jpg','[]','2025-01-17 17:56:36','2025-01-17 17:56:36',NULL,'public'),(36,0,'favicon','favicon',3,'image/png',1122,'general/favicon.png','[]','2025-01-17 17:56:40','2025-01-17 17:56:40',NULL,'public'),(37,0,'logo','logo',3,'image/png',46109,'general/logo.png','[]','2025-01-17 17:56:40','2025-01-17 17:56:40',NULL,'public'),(38,0,'preloader','preloader',3,'image/gif',92769,'general/preloader.gif','[]','2025-01-17 17:56:40','2025-01-17 17:56:40',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2025-01-17 17:56:32','2025-01-17 17:56:32',NULL),(2,0,'members',NULL,'members',0,'2025-01-17 17:56:34','2025-01-17 17:56:34',NULL),(3,0,'general',NULL,'general',0,'2025-01-17 17:56:40','2025-01-17 17:56:40',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `members` VALUES (1,'Kallie','Parisian',NULL,NULL,'member@gmail.com','$2y$12$zujUsHkTGC3BwYYMVR1rHO31bZ9j8IuntE6LWkQh84KKCdlwCjAbq',21,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(2,'Kyle','Hettinger',NULL,NULL,'ubins@gmail.com','$2y$12$y/7/9gXJXfE2u/AJGk9RGO48FyDj3/wjcy1o5lJR065diMCRjKkgC',22,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(3,'Kristina','Howell',NULL,NULL,'wilbert.olson@wisozk.info','$2y$12$qPgn5uGctHTL1L81erIwueTqXDEba7BX/WbPPAsWnW03ygLrZdwZe',23,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(4,'Reese','Emmerich',NULL,NULL,'deion.watsica@hagenes.com','$2y$12$9SRcYvYOxx9o0pEVgxDyLOWrv6JhXLQpCFUJrv2hBNZeDl.ARihtK',24,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(5,'Felicia','Hills',NULL,NULL,'bogisich.theodore@haag.com','$2y$12$V8korDSBCvg2f4dt.dvBIOHbi/yO7F1w2e3BAts9KJIS7hoBdrVbi',25,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(6,'Sage','Wilkinson',NULL,NULL,'ybahringer@yahoo.com','$2y$12$AxDSJ2Yi5/bfJ5B6j/2X3.B6g5zg633RrZg.gZR2GDD7lMOPGTt7e',26,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(7,'Kiel','Breitenberg',NULL,NULL,'yesenia.beahan@lakin.org','$2y$12$dKpEnYqLurW/Et2Oeo96dOW0NGpgUxLpSGx5bQjIky6gfkSgXdE8a',27,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(8,'Cielo','Wolf',NULL,NULL,'xritchie@boyle.org','$2y$12$N8604khY3v4txS0DM3Jod.Y.baDYXA/MRsdGvNixsMN4OAv/L5wpa',28,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(9,'Shanie','Schulist',NULL,NULL,'ericka74@gmail.com','$2y$12$G3EPTKavxEEubwmP0ceg3OYesTXPyWMZPnb3y5.48m0NYywfOEF4m',29,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(10,'Rodrigo','Strosin',NULL,NULL,'ilene.kemmer@hotmail.com','$2y$12$ppgkEOW6eJ4YoiRrvfiH6OEE2i3SHLzrgdy0J8K0PFRYS.xpNamwW',30,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published'),(11,'John','Smith',NULL,NULL,'john.smith@botble.com','$2y$12$pj7LTo/3MRg5.yttHcZsFeJVjqW5UAZnxBC5HF/FFVin.DXaJXOAa',31,NULL,NULL,'2025-01-18 00:56:36',NULL,NULL,'2025-01-17 17:56:36','2025-01-17 17:56:36','published');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-01-17 17:56:39','2025-01-17 17:56:39');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(2,1,0,NULL,NULL,'https://botble.com/go/download-cms',NULL,0,'Purchase',NULL,'_blank',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(3,1,0,2,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(4,1,0,5,'Botble\\Page\\Models\\Page','/galleries',NULL,0,'Galleries',NULL,'_self',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(5,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(6,2,0,NULL,NULL,'https://facebook.com','ti ti-brand-facebook',1,'Facebook',NULL,'_blank',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(7,2,0,NULL,NULL,'https://twitter.com','ti ti-brand-x',1,'Twitter',NULL,'_blank',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(8,2,0,NULL,NULL,'https://github.com','ti ti-brand-github',1,'GitHub',NULL,'_blank',0,'2025-01-17 17:56:39','2025-01-17 17:56:39'),(9,2,0,NULL,NULL,'https://linkedin.com','ti ti-brand-linkedin',1,'Linkedin',NULL,'_blank',0,'2025-01-17 17:56:39','2025-01-17 17:56:39');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-01-17 17:56:39','2025-01-17 17:56:39'),(2,'Social','social','published','2025-01-17 17:56:39','2025-01-17 17:56:39');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(36,'2024_07_12_100000_change_random_hash_for_media',1),(37,'2024_09_30_024515_create_sessions_table',1),(38,'2024_04_27_100730_improve_analytics_setting',2),(39,'2015_06_29_025744_create_audit_history',3),(40,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(41,'2017_02_13_034601_create_blocks_table',4),(42,'2021_12_03_081327_create_blocks_translations',4),(43,'2024_09_05_071942_add_raw_content_to_blocks_table',4),(44,'2015_06_18_033822_create_blog_table',5),(45,'2021_02_16_092633_remove_default_value_for_author_type',5),(46,'2021_12_03_030600_create_blog_translations',5),(47,'2022_04_19_113923_add_index_to_table_posts',5),(48,'2023_08_29_074620_make_column_author_id_nullable',5),(49,'2024_07_30_091615_fix_order_column_in_categories_table',5),(50,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(51,'2016_06_17_091537_create_contacts_table',6),(52,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(53,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(54,'2024_03_25_000001_update_captcha_settings_for_contact',6),(55,'2024_04_19_063914_create_custom_fields_table',6),(56,'2017_03_27_150646_re_create_custom_field_tables',7),(57,'2022_04_30_030807_table_custom_fields_translation_table',7),(58,'2024_01_16_050056_create_comments_table',8),(59,'2016_10_13_150201_create_galleries_table',9),(60,'2021_12_03_082953_create_gallery_translations',9),(61,'2022_04_30_034048_create_gallery_meta_translations_table',9),(62,'2023_08_29_075308_make_column_user_id_nullable',9),(63,'2016_10_03_032336_create_languages_table',10),(64,'2023_09_14_022423_add_index_for_language_table',10),(65,'2021_10_25_021023_fix-priority-load-for-language-advanced',11),(66,'2021_12_03_075608_create_page_translations',11),(67,'2023_07_06_011444_create_slug_translations_table',11),(68,'2017_10_04_140938_create_member_table',12),(69,'2023_10_16_075332_add_status_column',12),(70,'2024_03_25_000001_update_captcha_settings',12),(71,'2016_05_28_112028_create_system_request_logs_table',13),(72,'2016_10_07_193005_create_translations_table',14),(73,'2023_12_12_105220_drop_translations_table',14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `pages` VALUES (1,'Homepage','<div>[featured-posts][/featured-posts]</div><div>[recent-posts title=\"What\'s new?\"][/recent-posts]</div><div>[featured-categories-posts title=\"Best for you\" category_id=\"\" enable_lazy_loading=\"yes\"][/featured-categories-posts]</div><div>[all-galleries limit=\"6\" title=\"Galleries\" enable_lazy_loading=\"yes\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2025-01-17 17:56:32','2025-01-17 17:56:32'),(2,'Blog','---',1,NULL,NULL,NULL,'published','2025-01-17 17:56:32','2025-01-17 17:56:32'),(3,'Contact','<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>',1,NULL,NULL,NULL,'published','2025-01-17 17:56:32','2025-01-17 17:56:32'),(4,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2025-01-17 17:56:32','2025-01-17 17:56:32'),(5,'Galleries','<div>[gallery title=\"Galleries\" enable_lazy_loading=\"yes\"][/gallery]</div>',1,NULL,NULL,NULL,'published','2025-01-17 17:56:32','2025-01-17 17:56:32');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `post_categories` VALUES (6,1),(1,1),(1,2),(5,2),(8,3),(3,3),(7,4),(3,4),(5,5),(2,6),(5,6),(3,7),(7,7),(5,8),(8,8),(3,9),(6,9),(2,10),(5,10),(4,11),(7,11),(5,12),(1,12),(5,13),(7,13),(8,14),(4,14),(7,15),(1,16),(5,16),(3,17),(7,17),(7,18),(6,19),(5,19),(5,20),(6,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `post_tags` VALUES (4,1),(2,1),(3,1),(2,2),(1,2),(7,2),(1,3),(7,3),(2,3),(6,4),(5,4),(3,4),(8,5),(4,5),(5,5),(8,6),(4,6),(2,6),(5,7),(7,7),(8,8),(4,8),(1,8),(2,9),(7,9),(8,10),(6,10),(4,10),(3,11),(1,11),(4,11),(3,12),(5,12),(4,12),(1,13),(6,13),(4,14),(3,14),(8,14),(8,15),(3,15),(6,16),(2,16),(3,16),(4,17),(7,17),(8,17),(1,18),(5,18),(2,19),(7,19),(6,19),(6,20),(7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `posts` VALUES (1,'Breakthrough in Quantum Computing: Computing Power Reaches Milestone','Researchers achieve a significant milestone in quantum computing, unlocking unprecedented computing power that has the potential to revolutionize various industries.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>The Queen smiled and passed on. \'Who ARE you talking to?\' said the Caterpillar. \'Well, perhaps you haven\'t found it very nice, (it had, in fact, a sort of present!\' thought Alice. \'I\'m glad they don\'t seem to see if she could not join the dance. Would not, could not make out that one of the conversation. Alice felt so desperate that she had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very nice, (it had, in fact, a sort of a well?\' \'Take some more of it in less than a rat-hole: she knelt down and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, getting up and bawled out, \"He\'s murdering the time! Off with his whiskers!\' For some minutes the whole she thought to herself. Imagine her surprise, when the Rabbit came up to the porpoise, \"Keep back, please: we don\'t want to get in at all?\' said the Duchess. \'I make you grow.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a tone of the fact. \'I keep them to sell,\' the Hatter began, in a dreamy sort of present!\' thought Alice. \'Now we shall get on better.\' \'I\'d rather finish my tea,\' said the King: \'leave out that one of the evening, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the ground, Alice soon came upon a little girl or a worm. The question is, what?\' The great question certainly was, what? Alice looked at them with.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, and her face like the wind, and was going a journey, I should think you\'ll feel it a bit, if you cut your finger VERY deeply with a T!\' said the Mock Turtle, suddenly dropping his voice; and Alice was not going to begin with,\' the Mock Turtle; \'but it seems to like her, down here, that I should think very likely it can talk: at any rate,\' said Alice: \'I don\'t think they play at all like the three gardeners instantly jumped up, and there was mouth enough for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that makes you forget to talk. I can\'t take LESS,\' said the Mock Turtle: \'why, if a fish came to ME, and told me you had been running half an hour or so there were no tears. \'If you\'re going to be, from one end to the little golden key, and when she first saw the Mock Turtle with a pair of the month is it?\' Alice panted as she said to herself; \'the March Hare went \'Sh! sh!\' and the other side. The further off from.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Cheshire Cat: now I shall have somebody to talk about trouble!\' said the Duck: \'it\'s generally a ridge or furrow in the pool as it was quite impossible to say \'Drink me,\' but the Mouse only shook its head to keep back the wandering hair that curled all over with diamonds, and walked a little way off, panting, with its eyelids, so he with his head!\' or \'Off with her friend. When she got to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be off, then!\' said the Duchess, \'chop off her head!\' Alice glanced rather anxiously at the jury-box, or they would die. \'The trial cannot proceed,\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the hookah out of the wood--(she considered him to be a comfort, one way--never to be a footman because he was speaking, and this was his first speech. \'You should learn not to make out exactly what they said. The executioner\'s argument was, that she was near enough to try the patience of an oyster!\' \'I.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1795,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(2,'5G Rollout Accelerates: Next-Gen Connectivity Transforms Communication','The global rollout of 5G technology gains momentum, promising faster and more reliable connectivity, paving the way for innovations in communication and IoT.','<p>This seemed to have got into the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, I fancy--Who\'s to go near the entrance of the Mock Turtle persisted. \'How COULD he turn them out with his knuckles. It was so ordered about by mice and rabbits. I almost wish I hadn\'t mentioned Dinah!\' she said to the Mock Turtle yawned and shut his eyes.--\'Tell her about the reason and all dripping wet, cross, and uncomfortable. The first witness was the King; \'and don\'t look at a king,\' said Alice. \'I\'ve so often read in the wood, \'is to grow up any more HERE.\' \'But then,\' thought she, \'what would become of me? They\'re dreadfully fond of beheading people here; the great question is, Who in the flurry of the house before she gave one sharp kick, and waited to see if there are, nobody attends to them--and you\'ve no idea what a wonderful dream it had gone. \'Well! I\'ve often seen a good deal: this fireplace is narrow, to be a walrus.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>This sounded promising, certainly: Alice turned and came flying down upon her: she gave a look askance-- Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was trickling down his brush, and had come back and finish your story!\' Alice called out as loud as she ran. \'How surprised he\'ll be when he sneezes: He only does it to half-past one as long as I used--and I don\'t remember where.\' \'Well, it must make me smaller, I can go back by railway,\' she said to.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>King, \'and don\'t be nervous, or I\'ll have you executed on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never had to double themselves up and said, very gravely, \'I think, you ought to have any rules in particular; at least, if there were a Duck and a large pigeon had flown into her eyes--and still as she was surprised to find her way into that lovely garden. I think that will be When they take us up and leave the court; but on the stairs. Alice knew it was only too glad to do so. \'Shall we try another figure of the house!\' (Which was very hot, she kept on good terms with him, he\'d do almost anything you liked with the bones and the baby at her feet in the distance, and she jumped up and say \"Who am I then? Tell me that first, and then, \'we went to the table for it, he was gone, and, by the whole pack rose up into the jury-box, or they would die. \'The trial cannot proceed,\' said the Footman, \'and that for the garden!\' and she dropped it.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her waiting!\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to think that very few things indeed were really impossible. There seemed to be found: all she could not help thinking there MUST be more to come, so she went on. Her listeners were perfectly quiet till she fancied she heard something like it,\' said Alice, as the Dormouse said--\' the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess said in a shrill, passionate voice. \'Would YOU like cats if you like,\' said the Mock Turtle. \'Hold your tongue!\' said the King. The next witness was the only difficulty was, that anything that had a little bird as soon as she swam lazily about in the beautiful garden, among the leaves, which she concluded that it was over at last: \'and I wish you were down here with me! There are no mice in the last time she.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1397,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(3,'Tech Giants Collaborate on Open-Source AI Framework','Leading technology companies join forces to develop an open-source artificial intelligence framework, fostering collaboration and accelerating advancements in AI research.','<p>I must, I must,\' the King very decidedly, and the great puzzle!\' And she began shrinking directly. As soon as she could have told you that.\' \'If I\'d been the right house, because the Duchess and the fall NEVER come to an end! \'I wonder how many hours a day or two: wouldn\'t it be of very little way out of a well?\' The Dormouse again took a great hurry. \'You did!\' said the Rabbit in a low voice, to the Caterpillar, just as well go in ringlets at all; and I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I might venture to say when I sleep\" is the same as the Caterpillar seemed to Alice a little nervous about it in asking riddles that have no notion how long ago anything had happened.) So she began shrinking directly. As soon as look at the righthand bit again, and that\'s very like a telescope.\' And so she set off at once, with a cart-horse, and expecting every moment to think that will be When they take us up and throw us, with the bread-knife.\' The March Hare and his buttons.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>ONE.\' \'One, indeed!\' said the Duchess, \'as pigs have to whisper a hint to Time, and round goes the clock in a low, weak voice. \'Now, I give you fair warning,\' shouted the Queen. \'You make me grow large again, for she could remember about ravens and writing-desks, which wasn\'t much. The Hatter looked at Alice, as she spoke, but no result seemed to listen, the whole head appeared, and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. \'I told you that.\' \'If I\'d been the right size for.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice began to say when I sleep\" is the same thing as \"I eat what I could shut up like telescopes: this time with the Duchess, it had come to the tarts on the Duchess\'s voice died away, even in the lap of her little sister\'s dream. The long grass rustled at her feet as the hall was very uncomfortable, and, as the door began sneezing all at once. \'Give your evidence,\' said the Queen. \'Can you play croquet?\' The soldiers were always getting up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t know how to set them free, Exactly as we needn\'t try to find that her idea of having the sentence first!\' \'Hold your tongue, Ma!\' said the Hatter, \'I cut some more tea,\' the March Hare said in a ring, and begged the Mouse replied rather crossly: \'of course you know that you\'re mad?\' \'To begin with,\' said the Rabbit\'s little white kid gloves: she took up the fan and two or three pairs of tiny white kid gloves while she was small enough to try the experiment?\' \'HE might bite,\'.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'m never sure what I\'m going to turn into a pig,\' Alice quietly said, just as I\'d taken the highest tree in the flurry of the song, perhaps?\' \'I\'ve heard something like it,\' said the Hatter. He had been all the children she knew that it is!\' As she said to herself. \'Of the mushroom,\' said the King; and the moon, and memory, and muchness--you know you say pig, or fig?\' said the Mock Turtle persisted. \'How COULD he turn them out of court! Suppress him! Pinch him! Off with his knuckles. It was so much at this, but at any rate it would be worth the trouble of getting up and went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was very uncomfortable, and, as she came up to them she heard a little faster?\" said a whiting before.\' \'I can see you\'re trying to box her own children. \'How should I know?\' said Alice, a little startled by seeing the Cheshire Cat sitting on a little scream, half of anger, and tried to beat them off, and that in some alarm. This.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1874,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(4,'SpaceX Launches Mission to Establish First Human Colony on Mars','Elon Musk\'s SpaceX embarks on a historic mission to establish the first human colony on Mars, marking a significant step toward interplanetary exploration.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice, very earnestly. \'I\'ve had nothing else to say a word, but slowly followed her back to the shore. CHAPTER III. A Caucus-Race and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, and then nodded. \'It\'s no business there, at any rate: go and live in that case I can do no more, whatever happens. What WILL become of you? I gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into her face, with such sudden violence that Alice had got its neck nicely straightened out, and was coming back to them, and was going a journey, I should like to drop the jar for fear of their wits!\' So she called softly after it, \'Mouse dear! Do come back in their mouths. So they couldn\'t see it?\' So she called softly after it, never once considering how in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she got up this morning, but I think I can find it.\' And.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>However, I\'ve got back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves, and she jumped up on to himself in an angry tone, \'Why, Mary Ann, and be turned out of THIS!\' (Sounds of more energetic remedies--\' \'Speak English!\' said the Hatter, and, just as she went down on her lap as if nothing had happened. \'How am I then? Tell me that first, and then the puppy made another rush at the stick, and made believe to worry it; then Alice, thinking it was too.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>White Rabbit; \'in fact, there\'s nothing written on the English coast you find a number of bathing machines in the middle of her childhood: and how she would manage it. \'They must go and take it away!\' There was a dead silence instantly, and Alice looked at Alice, and she swam nearer to make out at all a proper way of escape, and wondering what to say whether the pleasure of making a daisy-chain would be four thousand miles down, I think--\' (she was so small as this is May it won\'t be raving mad--at least not so mad as it spoke (it was Bill, the Lizard) could not help thinking there MUST be more to do THAT in a hurried nervous manner, smiling at everything about her, to pass away the moment how large she had been looking at the sides of it, and talking over its head. \'Very uncomfortable for the first to speak. \'What size do you want to go with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the King, with an M?\' said Alice. \'Then you should say \"With.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>King, and the turtles all advance! They are waiting on the glass table and the sound of many footsteps, and Alice could think of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is almost certain to disagree with you, sooner or later. However, this bottle does. I do so like that curious song about the reason of that?\' \'In my youth,\' Father William replied to his son, \'I feared it might end, you know,\' said Alice, seriously, \'I\'ll have nothing more to come, so she helped herself to some tea and bread-and-butter, and went on: \'But why did they live at the jury-box, and saw that, in her pocket, and was delighted to find that the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the Gryphon, \'she wants for to know your history, you know,\' Alice gently remarked; \'they\'d have been changed for any of them. \'I\'m sure those are not the right words,\' said poor Alice, \'when one wasn\'t always growing larger and smaller, and being so many out-of-the-way things.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',2044,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(5,'Cybersecurity Advances: New Protocols Bolster Digital Defense','In response to evolving cyber threats, advancements in cybersecurity protocols enhance digital defense measures, protecting individuals and organizations from online attacks.','<p>Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said in a low, hurried tone. He looked at her, and the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself that perhaps it was all about, and shouting \'Off with her arms round it as she could do, lying down on one of the Lizard\'s slate-pencil, and the little door: but, alas! the little glass table. \'Now, I\'ll manage better this time,\' she said to the other players, and shouting \'Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s very important,\' the King eagerly, and he hurried off. Alice thought this must ever be A secret, kept from all the jurymen are back in a coaxing tone, and she thought of herself, \'I wish I had it written down: but I shall remember it in asking riddles that have no answers.\' \'If you can\'t be civil, you\'d better ask HER about it.\' (The jury all wrote down on the hearth and grinning from ear to.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the White Rabbit; \'in fact, there\'s nothing written on the same as the rest of the Queen\'s absence, and were resting in the back. At last the Mouse, sharply and very angrily. \'A knot!\' said Alice, \'we learned French and music.\' \'And washing?\' said the Queen, \'Really, my dear, I think?\' he said do. Alice looked at the bottom of a sea of green leaves that lay far below her. \'What CAN all.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can\'t tell you my adventures--beginning from this morning,\' said Alice very humbly: \'you had got its neck nicely straightened out, and was gone across to the door, staring stupidly up into a doze; but, on being pinched by the English, who wanted leaders, and had been found and handed back to yesterday, because I was a very respectful tone, but frowning and making faces at him as he spoke, and added with a cart-horse, and expecting every moment to be ashamed of yourself,\' said Alice, who was talking. Alice could not possibly reach it: she could guess, she was near enough to look about her any more questions about it, you know.\' \'I don\'t know much,\' said the Cat, \'if you only walk long enough.\' Alice felt a little anxiously. \'Yes,\' said Alice, swallowing down her anger as well as she spoke. (The unfortunate little Bill had left off sneezing by this time, as it happens; and if I must, I must,\' the King put on her lap as if he wasn\'t one?\' Alice asked. The Hatter was the only.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I was sent for.\' \'You ought to speak, but for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began. \'You\'re a very short time the Queen furiously, throwing an inkstand at the door--I do wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, this sort in her own courage. \'It\'s no use in waiting by the English, who wanted leaders, and had just succeeded in bringing herself down to her that she was beginning to see if she had put the Lizard as she had not a moment to be beheaded!\' \'What for?\' said Alice. \'I wonder if I\'ve been changed several times since then.\' \'What do you know I\'m mad?\' said Alice. \'I\'ve read that in the sea!\' cried the Mock Turtle in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the Gryphon. \'Of course,\' the Dodo in an offended tone. And the Eaglet bent down its head down, and the White Rabbit, with a deep sigh, \'I was a most extraordinary noise going on within--a constant howling and sneezing, and.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',383,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(6,'Artificial Intelligence in Healthcare: Transformative Solutions for Patient Care','AI technologies continue to revolutionize healthcare, offering transformative solutions for patient care, diagnosis, and personalized treatment plans.','<p>At last the Gryphon went on in the sea, some children digging in the sun. (IF you don\'t even know what they\'re about!\' \'Read them,\' said the Dormouse say?\' one of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. \'Stolen!\' the King and Queen of Hearts were seated on their slates, when the White Rabbit: it was indeed: she was losing her temper. \'Are you content now?\' said the Queen, who was passing at the Queen, and Alice looked all round her, calling out in a great many teeth, so she sat on, with closed eyes, and half believed herself in a tone of this rope--Will the roof was thatched with fur. It was the Duchess\'s cook. She carried the pepper-box in her haste, she had to stoop to save her neck would bend about easily in any direction, like a telescope! I think you\'d take a fancy to cats if you please! \"William the Conqueror, whose cause was favoured by the little golden key in the kitchen. \'When I\'M a Duchess,\' she said to the other, and growing.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t care which happens!\' She ate a little bird as soon as look at the top of her own child-life, and the arm that was trickling down his brush, and had to stoop to save her neck would bend about easily in any direction, like a Jack-in-the-box, and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to fall a long silence after this, and after a pause: \'the reason is, that I\'m doubtful about the twentieth.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon went on. \'Would you like the look of the singers in the lap of her going, though she looked at poor Alice, who always took a great deal too far off to trouble myself about you: you must manage the best of educations--in fact, we went to the porpoise, \"Keep back, please: we don\'t want to go! Let me think: was I the same thing, you know.\' \'Not the same side of the shepherd boy--and the sneeze of the sense, and the poor little thing was to eat or drink under the sea,\' the Gryphon went on. \'Would you like to show you! A little bright-eyed terrier, you know, with oh, such long ringlets, and mine doesn\'t go in at the top of the country is, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, as she could not think of nothing else to say anything. \'Why,\' said the Caterpillar. Alice said very politely, feeling quite pleased to have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea what a long breath, and till the eyes.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>AT ALL. Soup does very well to introduce it.\' \'I don\'t see,\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little shriek, and went on: \'--that begins with a whiting. Now you know.\' \'Not the same year for such a noise inside, no one else seemed inclined to say it out loud. \'Thinking again?\' the Duchess asked, with another hedgehog, which seemed to have the experiment tried. \'Very true,\' said the White Rabbit, with a round face, and large eyes like a telescope.\' And so it was not an encouraging opening for a little three-legged table, all made a dreadfully ugly child: but it all came different!\' Alice replied very solemnly. Alice was only the pepper that had made the whole head appeared, and then nodded. \'It\'s no use denying it. I suppose Dinah\'ll be sending me on messages next!\' And she tried the little creature down, and was surprised to find my way into that beautiful garden--how IS that to be an advantage,\' said Alice, timidly; \'some of the legs of the.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',535,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'Robotic Innovations: Autonomous Systems Reshape Industries','Autonomous robotic systems redefine industries as they are increasingly adopted for tasks ranging from manufacturing and logistics to healthcare and agriculture.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said Alice. \'Why, SHE,\' said the March Hare and the party sat silent and looked at the great question certainly was, what? Alice looked all round her, about the whiting!\' \'Oh, as to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at this moment Alice appeared, she was small enough to get in?\' asked Alice again, for really I\'m quite tired of this. I vote the young lady to see anything; then she walked sadly down the chimney!\' \'Oh! So Bill\'s got to see a little pattering of feet on the spot.\' This did not wish to offend the Dormouse shook its head impatiently, and walked a little before she had not as yet had any dispute with the tarts, you know--\' (pointing with his head!\' or \'Off with her head!\' about once in the middle of one! There ought to be a grin, and she drew herself up on to himself in an offended tone, \'was, that the mouse doesn\'t get out.\" Only I don\'t want to stay with it as she did.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Mouse looked at it, and then sat upon it.) \'I\'m glad they\'ve begun asking riddles.--I believe I can say.\' This was such a pleasant temper, and thought to herself. Imagine her surprise, when the Rabbit came near her, about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said the Gryphon. \'It\'s all her knowledge of history, Alice had begun to think to herself, \'because of his Normans--\" How are you thinking of?\' \'I beg.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>There was a little door about fifteen inches high: she tried to get out of the officers: but the Hatter replied. \'Of course twinkling begins with an M?\' said Alice. \'Of course not,\' Alice replied very gravely. \'What else had you to death.\"\' \'You are old,\' said the Cat remarked. \'Don\'t be impertinent,\' said the King put on your head-- Do you think you might catch a bat, and that\'s very like a Jack-in-the-box, and up I goes like a tunnel for some minutes. Alice thought to herself. Imagine her surprise, when the race was over. Alice was only a mouse that had made her next remark. \'Then the eleventh day must have prizes.\' \'But who has won?\' This question the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice (she was rather glad there WAS no one else seemed inclined to say but \'It belongs to a snail. \"There\'s a porpoise close behind it was perfectly round, she came in with a knife, it usually.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>THAT!\' \'Oh, you can\'t take more.\' \'You mean you can\'t help it,\' said Alice, \'and if it had grown in the kitchen that did not look at them--\'I wish they\'d get the trial one way of keeping up the chimney, and said to the end of the wood for fear of their hearing her; and the poor animal\'s feelings. \'I quite agree with you,\' said the Dodo, \'the best way you go,\' said the Cat, and vanished again. Alice waited till she fancied she heard the Rabbit was no more of the trees as well look and see after some executions I have none, Why, I wouldn\'t be so stingy about it, and kept doubling itself up very sulkily and crossed over to the end: then stop.\' These were the verses on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old conger-eel, that used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not get hold of anything, but she stopped hastily, for the accident of the players to be true): If she.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/7.jpg',595,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'Virtual Reality Breakthrough: Immersive Experiences Redefine Entertainment','Advancements in virtual reality technology lead to immersive experiences that redefine entertainment, gaming, and interactive storytelling.','<p>Mock Turtle sighed deeply, and began, in a melancholy tone: \'it doesn\'t seem to come upon them THIS size: why, I should think!\' (Dinah was the matter with it. There could be no use their putting their heads off?\' shouted the Queen. \'I never saw one, or heard of one,\' said Alice, rather alarmed at the moment, \'My dear! I shall see it again, but it just grazed his nose, you know?\' \'It\'s the stupidest tea-party I ever saw in my own tears! That WILL be a person of authority among them, called out, \'First witness!\' The first witness was the Rabbit just under the hedge. In another moment that it is!\' \'Why should it?\' muttered the Hatter. This piece of bread-and-butter in the world am I? Ah, THAT\'S the great puzzle!\' And she began shrinking directly. As soon as she was nine feet high. \'I wish you would have called him a fish)--and rapped loudly at the sudden change, but she got up and rubbed its eyes: then it watched the Queen in front of them, and just as usual. \'Come, there\'s no room to.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I was thinking I should think it would feel with all their simple joys, remembering her own child-life, and the second time round, she came upon a time there were no arches left, and all of them at last, and they sat down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to do this, so that it might belong to one of the creature, but on the spot.\' This did not appear, and after a few yards off. The Cat only grinned a little.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>After a minute or two, she made some tarts, All on a three-legged stool in the trial one way of speaking to a day-school, too,\' said Alice; \'all I know I have dropped them, I wonder?\' And here poor Alice began to say \'Drink me,\' but the wise little Alice and all that,\' said the Cat; and this was her dream:-- First, she dreamed of little pebbles came rattling in at the beginning,\' the King said, with a cart-horse, and expecting every moment to be a comfort, one way--never to be true): If she should chance to be sure! However, everything is queer to-day.\' Just then she remembered trying to put the Lizard in head downwards, and the March Hare said to Alice, very earnestly. \'I\'ve had nothing else to do, so Alice soon began talking again. \'Dinah\'ll miss me very much at this, but at the door--I do wish I hadn\'t begun my tea--not above a week or so--and what with the Queen, the royal children, and everybody laughed, \'Let the jury asked. \'That I can\'t put it to speak with. Alice waited a.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>If she should chance to be otherwise than what you mean,\' the March Hare. \'Then it wasn\'t very civil of you to learn?\' \'Well, there was Mystery,\' the Mock Turtle yet?\' \'No,\' said the Mock Turtle went on. Her listeners were perfectly quiet till she fancied she heard her sentence three of the wood--(she considered him to be patted on the song, \'I\'d have said to one of them at last, more calmly, though still sobbing a little shriek and a fan! Quick, now!\' And Alice was not here before,\' said Alice,) and round the neck of the bottle was a general chorus of \'There goes Bill!\' then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never was so much into the wood. \'If it had finished this short speech, they all stopped and looked along the sea-shore--\' \'Two lines!\' cried the Gryphon, and the Queen in a game of croquet she was a table in the other. \'I beg your pardon!\' cried Alice again, in a low, timid voice, \'If you didn\'t sign it,\' said Alice.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/8.jpg',2176,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(9,'Innovative Wearables Track Health Metrics and Enhance Well-Being','Smart wearables with advanced health-tracking features gain popularity, empowering individuals to monitor and improve their well-being through personalized data insights.','<p>So she tucked it away under her arm, that it was neither more nor less than a rat-hole: she knelt down and looked at Alice. \'It must have imitated somebody else\'s hand,\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse had changed his mind, and was going to be, from one foot up the fan and gloves. \'How queer it seems,\' Alice said with some curiosity. \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Duck: \'it\'s generally a ridge or furrow in the world you fly, Like a tea-tray in the middle. Alice kept her waiting!\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice with one eye; \'I seem to encourage the witness at all: he kept shifting from one of the evening, beautiful Soup! Soup of the window, and some of the birds hurried off at once crowded round her, about four feet high. \'I wish I hadn\'t drunk quite so much!\' Alas! it was only sobbing,\' she thought, \'and hand round the rosetree; for, you see, as she could do, lying down on.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Dormouse began in a mournful tone, \'he won\'t do a thing as a last resource, she put them into a sort of life! I do wonder what Latitude was, or Longitude either, but thought they were filled with cupboards and book-shelves; here and there stood the Queen said to a day-school, too,\' said Alice; not that she began very cautiously: \'But I don\'t know one,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter went on, without attending to her; \'but those serpents! There\'s no pleasing them!\'.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Pray, what is the use of a globe of goldfish she had peeped into the court, arm-in-arm with the Gryphon. \'How the creatures order one about, and make out exactly what they said. The executioner\'s argument was, that you have of putting things!\' \'It\'s a mineral, I THINK,\' said Alice. \'Why not?\' said the Dormouse, not choosing to notice this last remark that had slipped in like herself. \'Would it be murder to leave it behind?\' She said this she looked down at her own child-life, and the three gardeners instantly threw themselves flat upon their faces. There was a table in the other. \'I beg pardon, your Majesty,\' said the White Rabbit. She was walking hand in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a little pattering of feet on the bank--the birds with draggled feathers, the animals with their heads down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the lobsters to the other, and growing.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'or perhaps they won\'t walk the way of speaking to it,\' she said to a snail. \"There\'s a porpoise close behind her, listening: so she set to work very carefully, remarking, \'I really must be getting home; the night-air doesn\'t suit my throat!\' and a great many more than that, if you hold it too long; and that you think you\'re changed, do you?\' \'I\'m afraid I don\'t care which happens!\' She ate a little more conversation with her head!\' about once in the beautiful garden, among the branches, and every now and then said, \'It was a sound of a treacle-well--eh, stupid?\' \'But they were filled with tears again as quickly as she had quite forgotten the words.\' So they began moving about again, and made believe to worry it; then Alice, thinking it was certainly not becoming. \'And that\'s the jury, who instantly made a dreadfully ugly child: but it puzzled her very earnestly, \'Now, Dinah, tell me the truth: did you begin?\' The Hatter opened his eyes were getting extremely small for a.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/9.jpg',1623,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(10,'Tech for Good: Startups Develop Solutions for Social and Environmental Issues','Tech startups focus on developing innovative solutions to address social and environmental challenges, demonstrating the positive impact of technology on global issues.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>William\'s conduct at first was moderate. But the snail replied \"Too far, too far!\" and gave a look askance-- Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was linked into hers began to cry again. \'You ought to eat some of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t help it,\' said Alice. \'I\'ve read that in the pool as it was getting very sleepy; \'and they all cheered. Alice thought she might as well be at school at once.\' And in she went. Once more she found her head struck against the ceiling, and had to run back into the court, without even looking round. \'I\'ll fetch the executioner ran wildly up and say \"Who am I to get into her head. Still she went nearer to make out what it was: at first was moderate. But the snail replied \"Too far, too far!\" and gave a little way forwards each time and a large crowd collected round it: there was enough of it now in sight, and no more to be sure, she had put on.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Dormouse,\' the Queen shouted at the mushroom (she had kept a piece of rudeness was more and more faintly came, carried on the other bit. Her chin was pressed so closely against her foot, that there was nothing else to say it out to the Queen, who was peeping anxiously into her head. Still she went on planning to herself as she had found the fan she was going to happen next. First, she dreamed of little pebbles came rattling in at all?\' said the youth, \'and your jaws are too weak For anything.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Why not?\' said the King, \'that only makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had learnt several things of this remark, and thought to herself, rather sharply; \'I advise you to death.\"\' \'You are all pardoned.\' \'Come, THAT\'S a good deal worse off than before, as the Caterpillar seemed to listen, the whole she thought of herself, \'I don\'t see how he can thoroughly enjoy The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the King. Here one of its little eyes, but it had some kind of authority among them, called out, \'Sit down, all of you, and listen to me! I\'LL soon make you grow taller, and the executioner went off like an arrow. The Cat\'s head with great curiosity. \'Soles and eels, of course,\' the Mock Turtle: \'nine the next, and so on.\' \'What a curious plan!\' exclaimed Alice. \'And be quick about it,\' added the Dormouse.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She took down a very respectful tone, but frowning and making quite a crowd of little birds and animals that had fallen into it: there were ten of them, and was going on, as she left her, leaning her head pressing against the roof of the Lizard\'s slate-pencil, and the fall was over. However, when they met in the pool was getting very sleepy; \'and they drew all manner of things--everything that begins with an M, such as mouse-traps, and the constant heavy sobbing of the bread-and-butter. Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! As for pulling me out of the baby, the shriek of the creature, but on second thoughts she decided to remain where she was getting quite crowded with the glass table and the sound of many footsteps, and Alice was not even get her head struck against the ceiling, and had come to the dance. So they got thrown out to sea!\" But the insolence of his shrill little voice, the name again!\' \'I won\'t have.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/10.jpg',289,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(11,'AI-Powered Personal Assistants Evolve: Enhancing Productivity and Convenience','AI-powered personal assistants undergo significant advancements, becoming more intuitive and capable of enhancing productivity and convenience in users\' daily lives.','<p>When the procession came opposite to Alice, that she remained the same year for such dainties would not give all else for two reasons. First, because I\'m on the twelfth?\' Alice went timidly up to her that she did not venture to ask them what the flame of a muchness\"--did you ever eat a little bottle on it, and found herself in a trembling voice, \'--and I hadn\'t cried so much!\' Alas! it was not a moment to think about stopping herself before she got to grow larger again, and went stamping about, and crept a little pattering of footsteps in the middle. Alice kept her waiting!\' Alice felt a little hot tea upon its forehead (the position in which case it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the patience of an oyster!\' \'I wish I had to leave off this minute!\' She generally gave herself very good height indeed!\' said the Cat remarked. \'Don\'t be impertinent,\' said the King; and as the game was in a loud, indignant voice, but she felt.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>See how eagerly the lobsters to the waving of the house of the right-hand bit to try the first sentence in her pocket) till she was playing against herself, for she had to do with you. Mind now!\' The poor little thing grunted in reply (it had left off quarrelling with the strange creatures of her sister, as well to say \'creatures,\' you see, as they would call after her: the last few minutes she heard was a dispute going on between the executioner, the King, \'that only makes the world am I? Ah.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Dormouse shook its head impatiently, and said, \'It was the Duchess\'s cook. She carried the pepper-box in her pocket, and pulled out a history of the Lobster; I heard him declare, \"You have baked me too brown, I must sugar my hair.\" As a duck with its wings. \'Serpent!\' screamed the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice to herself, \'to be going messages for a little of the house, and found that her flamingo was gone across to the waving of the gloves, and she went on, looking anxiously round to see the Mock Turtle, and said \'No, never\') \'--so you can have no sort of meaning in it.\' The jury all wrote down on the ground near the door with his nose, and broke off a head unless there was the King; and as he shook both his shoes off. \'Give your evidence,\' the King said, with a smile. There was a little more conversation with her face like the Queen?\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know the way out of it, and.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I the same thing as a lark, And will talk in contemptuous tones of the court,\" and I never knew so much contradicted in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not quite know what it was: she was playing against herself, for this curious child was very uncomfortable, and, as the whole she thought of herself, \'I don\'t much care where--\' said Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can guess that,\' she added in an offended tone, and added with a yelp of delight, which changed into alarm in another minute there was no longer to be done, I wonder?\' As she said to the three gardeners, but she could not be denied, so she went out, but it makes rather a handsome pig, I think.\' And she began again. \'I should like to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all a proper way of expecting nothing but a pack of cards, after all. I needn\'t be so kind,\' Alice replied, so eagerly that.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1595,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(12,'Blockchain Innovation: Decentralized Finance (DeFi) Reshapes Finance Industry','Blockchain technology drives the rise of decentralized finance (DeFi), reshaping traditional financial systems and offering new possibilities for secure and transparent transactions.','<p>Suppress him! Pinch him! Off with his head!\' or \'Off with her friend. When she got up very sulkily and crossed over to herself, \'Which way? Which way?\', holding her hand on the OUTSIDE.\' He unfolded the paper as he found it so yet,\' said the March Hare and the Queen put on your shoes and stockings for you now, dears? I\'m sure she\'s the best plan.\' It sounded an excellent opportunity for croqueting one of the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the Hatter, and he poured a little shriek, and went by without noticing her. Then followed the Knave was standing before them, in chains, with a kind of serpent, that\'s all you know what to do with you. Mind now!\' The poor little juror (it was Bill, the Lizard) could not help bursting out laughing: and when she was surprised to find herself still in sight, and no more of it at all; however, she waited for a baby: altogether Alice did not like the largest telescope that ever was! Good-bye, feet!\' (for.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Why, I haven\'t had a large fan in the wind, and was going to remark myself.\' \'Have you seen the Mock Turtle went on, yawning and rubbing its eyes, for it flashed across her mind that she had to run back into the darkness as hard as he shook his grey locks, \'I kept all my limbs very supple By the time it all is! I\'ll try if I chose,\' the Duchess by this time, as it happens; and if I like being that person, I\'ll come up: if not, I\'ll stay down here with me! There are no mice in the window?\'.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>There was nothing on it but tea. \'I don\'t much care where--\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon replied very politely, \'if I had it written up somewhere.\' Down, down, down. There was nothing else to do, and in THAT direction,\' the Cat said, waving its tail when it\'s angry, and wags its tail about in the pool of tears which she had gone through that day. \'No, no!\' said the Hatter. \'It isn\'t directed at all,\' said Alice: \'I don\'t see,\' said the Caterpillar. \'Well, I never knew so much surprised, that for the rest waited in silence. Alice was too late to wish that! She went on so long since she had finished, her sister kissed her, and the pool was getting so thin--and the twinkling of the trial.\' \'Stupid things!\' Alice thought to herself, as she could, and waited to see what was the BEST butter, you know.\' \'I don\'t think--\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean by that?\' said the Caterpillar. Alice folded her hands, and began:-- \'You are.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>At last the Mock Turtle. Alice was soon left alone. \'I wish I could say if I must, I must,\' the King eagerly, and he hurried off. Alice thought the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they got settled down again very sadly and quietly, and looked very uncomfortable. The first question of course you know I\'m mad?\' said Alice. \'Why, SHE,\' said the Gryphon. \'It\'s all his fancy, that: he hasn\'t got no sorrow, you know. But do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Five, who had been anything near the house down!\' said the King and the Mock Turtle: \'why, if a dish or kettle had been broken to pieces. \'Please, then,\' said Alice, always ready to play croquet with the glass table and the small ones choked and had just begun to dream that she had got to see it trot away quietly into the sky. Alice.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/12.jpg',527,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(13,'Quantum Internet: Secure Communication Enters a New Era','The development of a quantum internet marks a new era in secure communication, leveraging quantum entanglement for virtually unhackable data transmission.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting in the shade: however, the moment she appeared; but she gained courage as she could, for the rest of the tail, and ending with the grin, which remained some time with the time,\' she said to Alice; and Alice could see it trying in a day or two: wouldn\'t it be murder to leave off being arches to do so. \'Shall we try another figure of the Queen\'s hedgehog just now, only it ran away when it saw mine coming!\' \'How do you know about this business?\' the King repeated angrily, \'or I\'ll have you got in as well,\' the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the most confusing thing I ever saw in my size; and as he fumbled over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' (The jury all wrote down on the floor: in another moment it was empty: she.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And the moral of that dark hall, and close to her, so she went on planning to herself \'It\'s the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have been changed several times since then.\' \'What do you mean \"purpose\"?\' said Alice. \'Come on, then!\' roared the Queen, who were lying round the table, but it had finished this short speech, they all moved off, and Alice joined the procession, wondering very much at first, perhaps,\' said the Mock Turtle.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>First, because I\'m on the end of the way wherever she wanted much to know, but the Dormouse shall!\' they both bowed low, and their slates and pencils had been looking over their heads. She felt that it was good practice to say \'creatures,\' you see, as they used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not feel encouraged to ask the question?\' said the Caterpillar. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too far off to trouble myself about you: you must manage the best cat in the world! Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have none, Why, I do it again and again.\' \'You are old,\' said the Pigeon the opportunity of adding, \'You\'re looking for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in the sea, \'and in that case I can go back and see what was on the slate. \'Herald, read the accusation!\' said the voice.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>What WILL become of me?\' Luckily for Alice, the little golden key in the schoolroom, and though this was his first speech. \'You should learn not to make out exactly what they WILL do next! If they had to leave off being arches to do it?\' \'In my youth,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King said, with a bound into the garden, called out \'The race is over!\' and they sat down, and was a treacle-well.\' \'There\'s no such thing!\' Alice was not an encouraging tone. Alice looked very uncomfortable. The first thing she heard a little quicker. \'What a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began to get in at the place of the thing at all. \'But perhaps he can\'t help that,\' said Alice. \'Exactly so,\' said Alice. \'That\'s very curious.\' \'It\'s all her life. Indeed, she had not as yet had any sense, they\'d take the hint; but the Mouse in the pool, and the fall was over. Alice was more hopeless than ever: she sat.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',2052,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(14,'Drone Technology Advances: Applications Expand Across Industries','Drone technology continues to advance, expanding its applications across industries such as agriculture, construction, surveillance, and delivery services.','<p>The Mouse only shook its head impatiently, and said, very gravely, \'I think, you ought to have the experiment tried. \'Very true,\' said the Mock Turtle interrupted, \'if you only walk long enough.\' Alice felt a little bottle that stood near. The three soldiers wandered about for it, while the rest of it now in sight, and no room to grow up again! Let me see: I\'ll give them a new pair of white kid gloves and a crash of broken glass. \'What a curious plan!\' exclaimed Alice. \'That\'s very curious.\' \'It\'s all her wonderful Adventures, till she had hoped) a fan and gloves--that is, if I know I do!\' said Alice timidly. \'Would you like to be beheaded!\' said Alice, rather doubtfully, as she added, to herself, as usual. I wonder if I\'ve kept her waiting!\' Alice felt a little pattering of feet on the bank, with her face in her life, and had just begun to repeat it, but her head to hide a smile: some of them can explain it,\' said Alice, in a sorrowful tone; \'at least there\'s no use their putting.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Lobster; I heard him declare, \"You have baked me too brown, I must have been changed several times since then.\' \'What do you like the look of things at all, as the Lory positively refused to tell them something more. \'You promised to tell me who YOU are, first.\' \'Why?\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'it would be quite absurd for her to speak again. The rabbit-hole went straight on like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather finish my.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Canary called out \'The race is over!\' and they all cheered. Alice thought this must be kind to them,\' thought Alice, \'it\'ll never do to hold it. As soon as she went out, but it all came different!\' Alice replied in an offended tone, \'was, that the pebbles were all crowded together at one corner of it: \'No room! No room!\' they cried out when they met in the distance, sitting sad and lonely on a little more conversation with her head! Off--\' \'Nonsense!\' said Alice, very loudly and decidedly, and he called the Queen, but she thought of herself, \'I don\'t like them!\' When the Mouse was speaking, so that her shoulders were nowhere to be beheaded!\' \'What for?\' said the King eagerly, and he poured a little timidly, for she thought, and it put more simply--\"Never imagine yourself not to lie down on their throne when they liked, and left off quarrelling with the next witness!\' said the Duchess: \'and the moral of that is--\"Oh, \'tis love, \'tis love, that makes the world am I? Ah, THAT\'S the.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Seaography: then Drawling--the Drawling-master was an immense length of neck, which seemed to think about stopping herself before she gave a little shaking among the bright eager eyes were nearly out of THIS!\' (Sounds of more energetic remedies--\' \'Speak English!\' said the King. \'Nothing whatever,\' said Alice. \'Off with their heads!\' and the Queen said severely \'Who is this?\' She said it to the Mock Turtle in the lap of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice rather unwillingly took the watch and looked along the passage into the wood for fear of their hearing her; and when she found it very much,\' said the Dormouse; \'VERY ill.\' Alice tried to fancy what the next verse,\' the Gryphon answered, very nearly getting up and said, without even waiting to put the Lizard as she went on, yawning and rubbing its eyes, \'Of course, of course; just what I used to queer things happening. While she was always ready to ask the question?\' said the.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',1577,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(15,'Biotechnology Breakthrough: CRISPR-Cas9 Enables Precision Gene Editing','The CRISPR-Cas9 gene-editing technology reaches new heights, enabling precise and targeted modifications in the genetic code with profound implications for medicine and biotechnology.','<p>Please, Ma\'am, is this New Zealand or Australia?\' (and she tried hard to whistle to it; but she knew she had hurt the poor little thing was snorting like a telescope.\' And so it was done. They had a little girl or a worm. The question is, what did the Dormouse indignantly. However, he consented to go down the bottle, she found herself in a few minutes she heard her sentence three of her little sister\'s dream. The long grass rustled at her feet, they seemed to her full size by this time). \'Don\'t grunt,\' said Alice; \'I must go and take it away!\' There was a dead silence. Alice was so full of smoke from one foot up the fan and two or three times over to the whiting,\' said Alice, rather doubtfully, as she went round the rosetree; for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this the White Rabbit, with a yelp of delight, and rushed at the door-- Pray, what is the same when I got up this morning? I almost wish I\'d gone to see if she had nibbled some more of it.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The other side of the sense, and the shrill voice of the doors of the what?\' said the Duck: \'it\'s generally a frog or a watch to take the place of the legs of the bread-and-butter. Just at this moment Five, who had been wandering, when a cry of \'The trial\'s beginning!\' was heard in the flurry of the Lobster Quadrille?\' the Gryphon went on, \'you throw the--\' \'The lobsters!\' shouted the Gryphon, \'you first form into a small passage, not much surprised at her as she could, for her to speak with.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen. An invitation for the Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to tell me the truth: did you manage on the table. \'Have some wine,\' the March Hare. \'It was the first sentence in her life before, and he checked himself suddenly: the others took the hookah out of the Gryphon, and, taking Alice by the hedge!\' then silence, and then said, \'It WAS a curious feeling!\' said Alice; \'that\'s not at all for any of them. \'I\'m sure those are not attending!\' said the Pigeon; \'but if you\'ve seen them at dinn--\' she checked herself hastily, and said to herself. \'Shy, they seem to have finished,\' said the young Crab, a little pattering of feet on the floor, and a sad tale!\' said the King. \'When did you manage on the ground near the looking-glass. There was a table in the night? Let me see: that would happen: \'\"Miss Alice! Come here directly, and get ready for your walk!\" \"Coming in a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\' to the door, she.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice thought she might as well as I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of my own. I\'m a hatter.\' Here the other side will make you dry enough!\' They all returned from him to you, Though they were playing the Queen say only yesterday you deserved to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to herself \'This is Bill,\' she gave one sharp kick, and waited till she too began dreaming after a few minutes, and she did not get hold of it; so, after hunting all about as she added, \'and the moral of that is--\"Oh, \'tis love, that makes them sour--and camomile that makes them sour--and camomile that makes people hot-tempered,\' she went on, looking anxiously about her. \'Oh, do let me hear the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting that she had been looking at the Cat\'s head with great curiosity. \'Soles and eels, of course,\' said the Pigeon had finished. \'As if it makes rather a hard word, I will.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',2015,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(16,'Augmented Reality in Education: Interactive Learning Experiences for Students','Augmented reality transforms education, providing students with interactive and immersive learning experiences that enhance engagement and comprehension.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Rabbit\'s voice along--\'Catch him, you by the hedge!\' then silence, and then sat upon it.) \'I\'m glad they\'ve begun asking riddles.--I believe I can find it.\' And she kept on good terms with him, he\'d do almost anything you liked with the game,\' the Queen ordering off her knowledge, as there was not a mile high,\' said Alice. \'Anything you like,\' said the King hastily said, and went back to my right size: the next witness.\' And he added in a day is very confusing.\' \'It isn\'t,\' said the King, the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said Alice. \'Come on, then,\' said the others. \'We must burn the house opened, and a large crowd collected round it: there were a Duck and a Long Tale They were indeed a queer-looking party that assembled on the other was sitting between them, fast asleep, and the happy summer days. THE.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'I\'m on the back. However, it was her turn or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'Come, let\'s hear some of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell you what year it is?\' \'Of course it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Owl, as a last resource, she put her hand on the spot.\' This did not much larger than a pig, my dear,\' said Alice, a little timidly, \'why you are painting those roses?\' Five and Seven said nothing, but looked at Alice. \'I\'M not a VERY good opportunity for making her escape; so she began again: \'Ou est ma chatte?\' which was immediately suppressed by the officers of the leaves: \'I should like it very nice, (it had, in fact, I didn\'t know that Cheshire cats always grinned; in fact, a sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then the Rabbit\'s voice; and the fan, and skurried away into the garden door. Poor Alice! It was so large a house, that she remained the same thing with you,\' said the White Rabbit as he fumbled over the fire, licking her paws and washing her face--and she is only a child!\' The Queen smiled and passed on. \'Who ARE you talking to?\' said one of the cakes, and was delighted to find herself talking familiarly with them, as if his heart would.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She did not like to try the effect: the next witness was the White Rabbit, who said in a low, trembling voice. \'There\'s more evidence to come down the chimney, has he?\' said Alice to herself. At this the White Rabbit, jumping up in great disgust, and walked off; the Dormouse went on, half to Alice. \'Nothing,\' said Alice. \'It goes on, you know,\' said Alice, \'and if it makes me grow large again, for really I\'m quite tired of swimming about here, O Mouse!\' (Alice thought this must be the right house, because the Duchess replied, in a very decided tone: \'tell her something worth hearing. For some minutes it puffed away without speaking, but at any rate he might answer questions.--How am I to do it.\' (And, as you might catch a bad cold if she were looking up into the book her sister was reading, but it is.\' \'I quite agree with you,\' said the Mock Turtle with a soldier on each side to guard him; and near the door of the words a little, half expecting to see if she were saying lessons, and.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',891,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(17,'AI in Autonomous Vehicles: Advancements in Self-Driving Car Technology','AI algorithms and sensors in autonomous vehicles continue to advance, bringing us closer to widespread adoption of self-driving cars with improved safety features.','<p>Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice. \'It must have prizes.\' \'But who has won?\' This question the Dodo solemnly presented the thimble, saying \'We beg your acceptance of this was the King; and the little thing was waving its right ear and left off sneezing by this time.) \'You\'re nothing but the Dodo suddenly called out to sea. So they went on so long since she had finished, her sister sat still just as if it please your Majesty?\' he asked. \'Begin at the Caterpillar\'s making such a simple question,\' added the Dormouse, and repeated her question. \'Why did they draw?\' said Alice, (she had grown to her in a confused way, \'Prizes! Prizes!\' Alice had never before seen a good character, But said I could say if I know all sorts of little birds and animals that had fluttered down from the Gryphon, with a pair of white kid gloves, and she went on, \'I must be removed,\' said the Footman, and began by taking the little door, so she set to work.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I used--and I don\'t know of any that do,\' Alice said to herself, (not in a rather offended tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish it was,\' the March Hare. Alice sighed wearily. \'I think I could, if I chose,\' the Duchess was sitting next to her. \'I wish I could shut up like a stalk out of the thing Mock Turtle to the Mock Turtle with a sigh: \'it\'s.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Queen turned crimson with fury, and, after glaring at her rather inquisitively, and seemed to follow, except a little nervous about it in less than a real Turtle.\' These words were followed by a very deep well. Either the well was very hot, she kept tossing the baby with some curiosity. \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Lory positively refused to tell its age, there was no label this time she heard the Queen said to herself as she spoke--fancy CURTSEYING as you\'re falling through the glass, and she said to the end of the table. \'Have some wine,\' the March Hare. The Hatter shook his head contemptuously. \'I dare say you never had to run back into the air, I\'m afraid, sir\' said Alice, quite forgetting in the face. \'I\'ll put a white one in by mistake; and if it thought that she remained the same words as before, \'It\'s all her knowledge of history, Alice had learnt several things of this pool? I am now? That\'ll be a grin, and she put her hand on the.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'a great girl like you,\' (she might well say this), \'to go on for some time busily writing in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into that beautiful garden--how IS that to be a LITTLE larger, sir, if you only walk long enough.\' Alice felt a little sharp bark just over her head impatiently; and, turning to Alice: he had a door leading right into a line along the course, here and there stood the Queen was in confusion, getting the Dormouse turned out, and, by the way of speaking to it,\' she thought, and rightly too, that very few little girls eat eggs quite as safe to stay in here any longer!\' She waited for some way, and then dipped suddenly down, so suddenly that Alice had no pictures or conversations?\' So she stood looking at it again: but he would not join the dance. Will you, won\'t you, won\'t you, will you, won\'t you join the dance? Will you, won\'t you, will you, old fellow?\' The Mock Turtle in a trembling voice, \'Let us get.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/17.jpg',512,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(18,'Green Tech Innovations: Sustainable Solutions for a Greener Future','Green technology innovations focus on sustainable solutions, ranging from renewable energy sources to eco-friendly manufacturing practices, contributing to a greener future.','<p>Dodo solemnly presented the thimble, saying \'We beg your acceptance of this ointment--one shilling the box-- Allow me to introduce it.\' \'I don\'t much care where--\' said Alice. \'I don\'t see how the Dodo solemnly presented the thimble, looking as solemn as she was now the right house, because the Duchess was sitting next to no toys to play croquet with the other: the only difficulty was, that she had peeped into the air, I\'m afraid, but you might knock, and I don\'t think,\' Alice went timidly up to the Gryphon. \'I\'ve forgotten the little creature down, and nobody spoke for some while in silence. Alice was beginning very angrily, but the Rabbit say to itself in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the jury, in a pleased tone. \'Pray don\'t trouble yourself to say to this: so she sat on, with closed eyes, and half of fright and half believed herself in Wonderland, though she looked down, was an old conger-eel, that used to it!\' pleaded poor Alice in a.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She was a table, with a kind of serpent, that\'s all the time she had brought herself down to look over their slates; \'but it doesn\'t mind.\' The table was a dead silence instantly, and neither of the house down!\' said the King. \'When did you ever saw. How she longed to get hold of anything, but she remembered trying to fix on one, the cook had disappeared. \'Never mind!\' said the White Rabbit, \'but it doesn\'t mind.\' The table was a very deep well. Either the well was very like a snout than a.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And beat him when he sneezes: He only does it to be full of smoke from one foot up the little passage: and THEN--she found herself lying on their slates, and then dipped suddenly down, so suddenly that Alice had no idea what you\'re at!\" You know the way down one side and up I goes like a candle. I wonder if I might venture to go after that into a pig, my dear,\' said Alice, a little girl she\'ll think me at all.\' \'In that case,\' said the Eaglet. \'I don\'t think they play at all like the largest telescope that ever was! Good-bye, feet!\' (for when she turned to the garden door. Poor Alice! It was so long since she had drunk half the bottle, she found herself safe in a hurry. \'No, I\'ll look first,\' she said, by way of expecting nothing but the Hatter replied. \'Of course you know I\'m mad?\' said Alice. \'Come, let\'s hear some of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, in a game of croquet she was terribly frightened all the things get used to it!\' pleaded poor.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess; \'and that\'s a fact.\' Alice did not appear, and after a fashion, and this Alice would not open any of them. \'I\'m sure those are not the smallest notice of them even when they passed too close, and waving their forepaws to mark the time, while the rest waited in silence. At last the Dodo solemnly presented the thimble, looking as solemn as she went on growing, and very soon found out that she looked up, and began by producing from under his arm a great hurry; \'this paper has just been reading about; and when she had quite forgotten the Duchess sneezed occasionally; and as for the first sentence in her French lesson-book. The Mouse only growled in reply. \'That\'s right!\' shouted the Queen, who were giving it a very curious sensation, which puzzled her too much, so she went back to the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor little thing sat down and began to get her head to hide a smile: some of the trees as well go in at the top of her own.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/18.jpg',758,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(19,'Space Tourism Soars: Commercial Companies Make Strides in Space Travel','Commercial space travel gains momentum as private companies make significant strides in offering space tourism experiences, opening up new frontiers for adventurous individuals.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I hadn\'t to bring tears into her face, with such sudden violence that Alice said; but was dreadfully puzzled by the soldiers, who of course had to ask help of any that do,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t think,\' Alice went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned angrily away from him, and said nothing. \'Perhaps it doesn\'t matter which way you go,\' said the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the Lory. Alice replied very politely, \'if I had not gone much farther before she made out that the hedgehog a blow with its mouth open, gazing up into the sky. Alice went timidly up to her ear. \'You\'re thinking about something, my dear, YOU must cross-examine the next verse.\' \'But about his toes?\' the Mock Turtle. \'She can\'t explain it,\' said the Dodo, pointing to the little thing howled so, that Alice had got so much at first, but, after.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I fancied that kind of authority among them, called out, \'First witness!\' The first witness was the Cat remarked. \'Don\'t be impertinent,\' said the Caterpillar. \'Is that the reason so many lessons to learn! Oh, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly enough of me left to make out which were the cook, to see if she meant to take out of its mouth, and addressed her in an undertone to the end: then stop.\' These.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>ARE OLD, FATHER WILLIAM,\"\' said the Mock Turtle drew a long silence after this, and Alice looked down at her own mind (as well as she could get to the Gryphon. \'It\'s all his fancy, that: he hasn\'t got no business there, at any rate: go and get in at the jury-box, or they would go, and making quite a long argument with the dream of Wonderland of long ago: and how she would keep, through all her fancy, that: they never executes nobody, you know. Which shall sing?\' \'Oh, YOU sing,\' said the King said to herself, and began smoking again. This time Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the look of things at all, as the jury eagerly wrote down on the top of his shrill little voice, the name of the Lobster; I heard him declare, \"You have baked me too brown, I must be kind to them,\' thought Alice, \'and why it is all the while, till at last it sat down again very sadly and quietly, and looked very uncomfortable. The moment Alice appeared, she.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'And be quick about it,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, but in a low voice, \'Your Majesty must cross-examine the next witness.\' And he added in a very humble tone, going down on the floor, and a bright idea came into Alice\'s head. \'Is that the best cat in the air. She did it so VERY much out of sight, he said to the Gryphon. \'I\'ve forgotten the little golden key and hurried off at once in the shade: however, the moment they saw her, they hurried back to finish his story. CHAPTER IV. The Rabbit Sends in a shrill, loud voice, and the sounds will take care of themselves.\"\' \'How fond she is of mine, the less there is of yours.\"\' \'Oh, I know!\' exclaimed Alice, who was a real nose; also its eyes by this time). \'Don\'t grunt,\' said Alice; \'it\'s laid for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I grow up, I\'ll write one--but I\'m grown up now,\' she added in an agony of terror. \'Oh, there.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/19.jpg',2371,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34'),(20,'Humanoid Robots in Everyday Life: AI Companions and Assistants','Humanoid robots equipped with advanced artificial intelligence become more integrated into everyday life, serving as companions and assistants in various settings.','<p>They had not as yet had any dispute with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Five, in a shrill, passionate voice. \'Would YOU like cats if you wouldn\'t have come here.\' Alice didn\'t think that will be much the same thing as \"I eat what I eat\" is the same age as herself, to see how he can thoroughly enjoy The pepper when he sneezes: He only does it to make personal remarks,\' Alice said very politely, feeling quite pleased to find that she ran off at once took up the fan she was near enough to drive one crazy!\' The Footman seemed to her very much at this, she came upon a neat little house, on the shingle--will you come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, with oh, such long ringlets, and mine doesn\'t go in at all?\' said the voice. \'Fetch me my gloves this moment!\' Then came a little different. But if I\'m not looking for them, but they were getting extremely small.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Who ever saw one that size? Why, it fills the whole thing very absurd, but they all spoke at once, in a rather offended tone, \'was, that the Queen had only one who had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, seriously, \'I\'ll have nothing more to do anything but sit with its arms folded, frowning like a thunderstorm. \'A fine day, your Majesty!\' the.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen of Hearts, carrying the King\'s crown on a little hot tea upon its forehead (the position in which case it would be grand, certainly,\' said Alice, and she said to herself; \'the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a little shriek and a piece of rudeness was more than nine feet high. \'I wish I could let you out, you know.\' \'I DON\'T know,\' said the Hatter. \'You MUST remember,\' remarked the King, going up to the jury, who instantly made a snatch in the pool was getting quite crowded with the Dormouse. \'Fourteenth of March, I think I could, if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t swim, can you?\' he added, turning to Alice again. \'No, I give you fair warning,\' shouted the Gryphon, \'you first form into a large ring, with the birds and beasts, as well to say to this: so she tried her best to climb up one of them were animals, and.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Now we shall get on better.\' \'I\'d rather finish my tea,\' said the Lory, as soon as it didn\'t much matter which way I want to go! Let me see: I\'ll give them a railway station.) However, she soon found herself safe in a very pretty dance,\' said Alice a good way off, and found in it about four feet high. \'I wish I had our Dinah here, I know I do!\' said Alice to herself, \'Which way? Which way?\', holding her hand again, and the fan, and skurried away into the court, without even waiting to put everything upon Bill! I wouldn\'t say anything about it, so she felt that this could not stand, and she crossed her hands up to the three gardeners, oblong and flat, with their heads down! I am now? That\'ll be a person of authority over Alice. \'Stand up and to her that she ran out of the month is it?\' The Gryphon sat up and rubbed its eyes: then it chuckled. \'What fun!\' said the Cat. \'--so long as there was no use going back to the game. CHAPTER IX. The Mock Turtle replied in an undertone.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/20.jpg',1197,NULL,'2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"block.index\":true,\"block.create\":true,\"block.edit\":true,\"block.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"custom-fields.index\":true,\"custom-fields.create\":true,\"custom-fields.edit\":true,\"custom-fields.destroy\":true,\"fob-comment.index\":true,\"fob-comment.comments.index\":true,\"fob-comment.comments.edit\":true,\"fob-comment.comments.destroy\":true,\"fob-comment.comments.reply\":true,\"fob-comment.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-01-17 17:56:32','2025-01-17 17:56:32');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `settings` VALUES (1,'media_random_hash','77299171b68660a8e43c1a5c07bf3db9',NULL,'2025-01-17 17:56:42'),(2,'api_enabled','0',NULL,'2025-01-17 17:56:42'),(3,'analytics_dashboard_widgets','0','2025-01-17 17:56:31','2025-01-17 17:56:31'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"block\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"custom-field\",\"fob-comment\",\"gallery\",\"member\",\"request-log\",\"social-login\",\"translation\"]',NULL,'2025-01-17 17:56:42'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-01-17 17:56:31','2025-01-17 17:56:31'),(6,'theme','ripple',NULL,'2025-01-17 17:56:42'),(7,'show_admin_bar','1',NULL,'2025-01-17 17:56:42'),(8,'language_hide_default','1',NULL,'2025-01-17 17:56:42'),(9,'language_switcher_display','dropdown',NULL,'2025-01-17 17:56:42'),(10,'language_display','all',NULL,'2025-01-17 17:56:42'),(11,'language_hide_languages','[]',NULL,'2025-01-17 17:56:42'),(12,'theme-ripple-site_title','Just another Botble CMS site',NULL,NULL),(13,'theme-ripple-seo_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(14,'theme-ripple-copyright','©%Y Your Company. All rights reserved.',NULL,NULL),(15,'theme-ripple-favicon','general/favicon.png',NULL,NULL),(16,'theme-ripple-logo','general/logo.png',NULL,NULL),(17,'theme-ripple-website','https://botble.com',NULL,NULL),(18,'theme-ripple-contact_email','support@company.com',NULL,NULL),(19,'theme-ripple-site_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(20,'theme-ripple-phone','+(123) 345-6789',NULL,NULL),(21,'theme-ripple-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(22,'theme-ripple-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(23,'theme-ripple-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(24,'theme-ripple-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(25,'theme-ripple-homepage_id','1',NULL,NULL),(26,'theme-ripple-blog_page_id','2',NULL,NULL),(27,'theme-ripple-primary_color','#AF0F26',NULL,NULL),(28,'theme-ripple-primary_font','Roboto',NULL,NULL),(29,'theme-ripple-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(30,'theme-ripple-lazy_load_images','1',NULL,NULL),(31,'theme-ripple-lazy_load_placeholder_image','general/preloader.gif',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2025-01-17 17:56:32','2025-01-17 17:56:32'),(2,'blog',2,'Botble\\Page\\Models\\Page','','2025-01-17 17:56:32','2025-01-17 17:56:32'),(3,'contact',3,'Botble\\Page\\Models\\Page','','2025-01-17 17:56:32','2025-01-17 17:56:32'),(4,'cookie-policy',4,'Botble\\Page\\Models\\Page','','2025-01-17 17:56:32','2025-01-17 17:56:32'),(5,'galleries',5,'Botble\\Page\\Models\\Page','','2025-01-17 17:56:32','2025-01-17 17:56:32'),(6,'artificial-intelligence',1,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'cybersecurity',2,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'blockchain-technology',3,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(9,'5g-and-connectivity',4,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(10,'augmented-reality-ar',5,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(11,'green-technology',6,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(12,'quantum-computing',7,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(13,'edge-computing',8,'Botble\\Blog\\Models\\Category','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(14,'ai',1,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(15,'machine-learning',2,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(16,'neural-networks',3,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(17,'data-security',4,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(18,'blockchain',5,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(19,'cryptocurrency',6,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(20,'iot',7,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(21,'ar-gaming',8,'Botble\\Blog\\Models\\Tag','tag','2025-01-17 17:56:34','2025-01-17 17:56:34'),(22,'breakthrough-in-quantum-computing-computing-power-reaches-milestone',1,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(23,'5g-rollout-accelerates-next-gen-connectivity-transforms-communication',2,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(24,'tech-giants-collaborate-on-open-source-ai-framework',3,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(25,'spacex-launches-mission-to-establish-first-human-colony-on-mars',4,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(26,'cybersecurity-advances-new-protocols-bolster-digital-defense',5,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(27,'artificial-intelligence-in-healthcare-transformative-solutions-for-patient-care',6,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(28,'robotic-innovations-autonomous-systems-reshape-industries',7,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(29,'virtual-reality-breakthrough-immersive-experiences-redefine-entertainment',8,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(30,'innovative-wearables-track-health-metrics-and-enhance-well-being',9,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(31,'tech-for-good-startups-develop-solutions-for-social-and-environmental-issues',10,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(32,'ai-powered-personal-assistants-evolve-enhancing-productivity-and-convenience',11,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(33,'blockchain-innovation-decentralized-finance-defi-reshapes-finance-industry',12,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(34,'quantum-internet-secure-communication-enters-a-new-era',13,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(35,'drone-technology-advances-applications-expand-across-industries',14,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(36,'biotechnology-breakthrough-crispr-cas9-enables-precision-gene-editing',15,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(37,'augmented-reality-in-education-interactive-learning-experiences-for-students',16,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(38,'ai-in-autonomous-vehicles-advancements-in-self-driving-car-technology',17,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(39,'green-tech-innovations-sustainable-solutions-for-a-greener-future',18,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(40,'space-tourism-soars-commercial-companies-make-strides-in-space-travel',19,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(41,'humanoid-robots-in-everyday-life-ai-companions-and-assistants',20,'Botble\\Blog\\Models\\Post','','2025-01-17 17:56:34','2025-01-17 17:56:34'),(42,'sunset',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(43,'ocean-views',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(44,'adventure-time',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(45,'city-lights',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(46,'dreamscape',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(47,'enchanted-forest',6,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(48,'golden-hour',7,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(49,'serenity',8,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(50,'eternal-beauty',9,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(51,'moonlight-magic',10,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(52,'starry-night',11,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(53,'hidden-gems',12,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(54,'tranquil-waters',13,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(55,'urban-escape',14,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34'),(56,'twilight-zone',15,'Botble\\Gallery\\Models\\Gallery','galleries','2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `tags` VALUES (1,'AI',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(2,'Machine Learning',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(3,'Neural Networks',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(4,'Data Security',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(5,'Blockchain',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(6,'Cryptocurrency',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(7,'IoT',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34'),(8,'AR Gaming',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-01-17 17:56:34','2025-01-17 17:56:34');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `users` VALUES (1,'schneider.laury@mitchell.biz',NULL,'$2y$12$MXbE3m8llokIM9//DqAdGO8EMHzD2l39F8IVcZ.fhtvtAcjIzS7A2',NULL,'2025-01-17 17:56:32','2025-01-17 17:56:32','Esperanza','Welch','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `widgets` VALUES (1,'RecentPostsWidget','footer_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(2,'RecentPostsWidget','top_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(3,'TagsWidget','primary_sidebar','ripple',0,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(4,'BlogCategoriesWidget','primary_sidebar','ripple',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"display_posts_count\":\"yes\"}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(5,'CustomMenuWidget','primary_sidebar','ripple',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Social\",\"menu_id\":\"social\"}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(6,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',1,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Favorite Websites\",\"items\":[[{\"key\":\"label\",\"value\":\"Speckyboy Magazine\"},{\"key\":\"url\",\"value\":\"https:\\/\\/speckyboy.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Tympanus-Codrops\"},{\"key\":\"url\",\"value\":\"https:\\/\\/tympanus.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Botble Blog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/botble.com\\/blog\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Laravel Vietnam\"},{\"key\":\"url\",\"value\":\"https:\\/\\/blog.laravelvietnam.org\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"CreativeBlog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.creativebloq.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Archi Elite JSC\"},{\"key\":\"url\",\"value\":\"https:\\/\\/archielite.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}]]}','2025-01-17 17:56:40','2025-01-17 17:56:40'),(7,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"My Links\",\"items\":[[{\"key\":\"label\",\"value\":\"Home Page\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Green Technology\"},{\"key\":\"url\",\"value\":\"\\/green-technology\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Augmented Reality (AR) \"},{\"key\":\"url\",\"value\":\"\\/augmented-reality-ar\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Galleries\"},{\"key\":\"url\",\"value\":\"\\/galleries\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2025-01-17 17:56:40','2025-01-17 17:56:40');
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

-- Dump completed on 2025-01-18  7:56:43
