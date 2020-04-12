CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add question',7,'add_question'),(26,'Can change question',7,'change_question'),(27,'Can delete question',7,'delete_question'),(28,'Can view question',7,'view_question'),(29,'Can add choice',8,'add_choice'),(30,'Can change choice',8,'change_choice'),(31,'Can delete choice',8,'delete_choice'),(32,'Can view choice',8,'view_choice'),(33,'Can add choice',9,'add_choice'),(34,'Can change choice',9,'change_choice'),(35,'Can delete choice',9,'delete_choice'),(36,'Can view choice',9,'view_choice'),(37,'Can add question',10,'add_question'),(38,'Can change question',10,'change_question'),(39,'Can delete question',10,'delete_question'),(40,'Can view question',10,'view_question'),(41,'Can add breed',11,'add_breed'),(42,'Can change breed',11,'change_breed'),(43,'Can delete breed',11,'delete_breed'),(44,'Can view breed',11,'view_breed'),(45,'Can add city',12,'add_city'),(46,'Can change city',12,'change_city'),(47,'Can delete city',12,'delete_city'),(48,'Can view city',12,'view_city'),(49,'Can add pet info',13,'add_petinfo'),(50,'Can change pet info',13,'change_petinfo'),(51,'Can delete pet info',13,'delete_petinfo'),(52,'Can view pet info',13,'view_petinfo'),(53,'Can add adopted pet',14,'add_adoptedpet'),(54,'Can change adopted pet',14,'change_adoptedpet'),(55,'Can delete adopted pet',14,'delete_adoptedpet'),(56,'Can view adopted pet',14,'view_adoptedpet'),(57,'Can add species',15,'add_species'),(58,'Can change species',15,'change_species'),(59,'Can delete species',15,'delete_species'),(60,'Can view species',15,'view_species'),(61,'Can add shelter',16,'add_shelter'),(62,'Can change shelter',16,'change_shelter'),(63,'Can delete shelter',16,'delete_shelter'),(64,'Can view shelter',16,'view_shelter');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$egcq8DmIDYfY$DILwRzWq8WJH9iFA0wdgYGEoVcPrfbgc1q7y3bhw8X0=','2020-04-11 21:29:42.969605',1,'admin','','','admin@example.com',1,1,'2020-04-11 21:28:50.957488');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-11 21:34:37.699097','1','What\'s up?',2,'[]',7,1),(2,'2020-04-12 04:05:19.912972','1','What\'s up?',1,'[{\"added\": {}}]',10,1),(3,'2020-04-12 04:05:41.651180','2','True or false?',1,'[{\"added\": {}}]',10,1),(4,'2020-04-12 04:10:02.902860','1','Not much',1,'[{\"added\": {}}]',9,1),(5,'2020-04-12 04:10:10.020219','2','The sky',1,'[{\"added\": {}}]',9,1),(6,'2020-04-12 04:10:37.441981','3','true',1,'[{\"added\": {}}]',9,1),(7,'2020-04-12 04:10:41.670814','4','false',1,'[{\"added\": {}}]',9,1),(8,'2020-04-12 19:23:12.510012','1','Boston',1,'[{\"added\": {}}]',12,1),(9,'2020-04-12 19:23:16.958734','2','Quincy',1,'[{\"added\": {}}]',12,1),(10,'2020-04-12 19:23:21.215418','3','Braintree',1,'[{\"added\": {}}]',12,1),(11,'2020-04-12 19:25:04.561626','1','Red Pokeball',1,'[{\"added\": {}}]',16,1),(12,'2020-04-12 19:25:14.175229','2','Blue Pokeball',1,'[{\"added\": {}}]',16,1),(13,'2020-04-12 19:25:26.569607','3','Green Pokeball',1,'[{\"added\": {}}]',16,1),(14,'2020-04-12 19:26:19.828977','1','Species object (1)',1,'[{\"added\": {}}]',15,1),(15,'2020-04-12 19:26:22.293147','2','Species object (2)',1,'[{\"added\": {}}]',15,1),(16,'2020-04-12 19:26:24.958979','3','Species object (3)',1,'[{\"added\": {}}]',15,1),(17,'2020-04-12 19:28:22.673049','1','Corgi',1,'[{\"added\": {}}]',11,1),(18,'2020-04-12 19:28:27.797122','2','Husky',1,'[{\"added\": {}}]',11,1),(19,'2020-04-12 19:28:47.738524','3','Siamese',1,'[{\"added\": {}}]',11,1),(20,'2020-04-12 19:29:05.300307','4','Sphynx',1,'[{\"added\": {}}]',11,1),(21,'2020-04-12 19:29:09.679413','5','Parrot',1,'[{\"added\": {}}]',11,1),(22,'2020-04-12 19:29:33.346737','6','Canary',1,'[{\"added\": {}}]',11,1),(23,'2020-04-12 19:29:44.553224','4','Rat',1,'[{\"added\": {}}]',15,1),(24,'2020-04-12 19:29:59.724856','4','Rat',3,'',15,1),(25,'2020-04-12 19:30:08.209251','5','Rabbit',1,'[{\"added\": {}}]',15,1),(26,'2020-04-12 19:30:50.290201','1','Mudkip',1,'[{\"added\": {}}]',13,1),(27,'2020-04-12 19:31:49.124503','2','Turtwig',1,'[{\"added\": {}}]',13,1),(28,'2020-04-12 19:32:04.204053','3','Torchic',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'msa','adoptedpet'),(11,'msa','breed'),(9,'msa','choice'),(12,'msa','city'),(13,'msa','petinfo'),(10,'msa','question'),(16,'msa','shelter'),(15,'msa','species'),(8,'polls','choice'),(7,'polls','question'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-11 20:26:42.204781'),(2,'auth','0001_initial','2020-04-11 20:26:42.441128'),(3,'admin','0001_initial','2020-04-11 20:26:43.197133'),(4,'admin','0002_logentry_remove_auto_add','2020-04-11 20:26:43.348085'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-11 20:26:43.360056'),(6,'contenttypes','0002_remove_content_type_name','2020-04-11 20:26:43.554849'),(7,'auth','0002_alter_permission_name_max_length','2020-04-11 20:26:43.654700'),(8,'auth','0003_alter_user_email_max_length','2020-04-11 20:26:43.679658'),(9,'auth','0004_alter_user_username_opts','2020-04-11 20:26:43.687632'),(10,'auth','0005_alter_user_last_login_null','2020-04-11 20:26:43.761569'),(11,'auth','0006_require_contenttypes_0002','2020-04-11 20:26:43.765731'),(12,'auth','0007_alter_validators_add_error_messages','2020-04-11 20:26:43.773879'),(13,'auth','0008_alter_user_username_max_length','2020-04-11 20:26:43.849255'),(14,'auth','0009_alter_user_last_name_max_length','2020-04-11 20:26:43.974554'),(15,'auth','0010_alter_group_name_max_length','2020-04-11 20:26:43.994500'),(16,'auth','0011_update_proxy_permissions','2020-04-11 20:26:44.003477'),(17,'sessions','0001_initial','2020-04-11 20:26:44.036428'),(18,'polls','0001_initial','2020-04-11 20:52:37.249733'),(19,'msa','0001_initial','2020-04-12 04:03:51.453187'),(20,'msa','0002_auto_20200412_0114','2020-04-12 05:14:55.815366'),(21,'msa','0003_auto_20200412_1459','2020-04-12 19:00:14.628097');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c82sekadoqgusosqh66dvyfx40pwkqvw','Mzc1NTRhNWMxZTA3NWIwNmFlODQ2ZDU5MjE5MDg4ZmI5NTI4YzY2MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMDczNzJlM2NhMmU2ODU0M2Y4NjcyN2VjZmI0N2Q1ZmZjZmMwMDg5In0=','2020-04-25 21:29:42.973564');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_adoptedpet`
--

DROP TABLE IF EXISTS `msa_adoptedpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_adoptedpet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_adopted` date NOT NULL,
  `pet_info_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msa_adoptedpet_pet_info_id_8e674764_fk_msa_petinfo_id` (`pet_info_id`),
  KEY `msa_adoptedpet_user_id_f42408fa_fk_auth_user_id` (`user_id`),
  CONSTRAINT `msa_adoptedpet_pet_info_id_8e674764_fk_msa_petinfo_id` FOREIGN KEY (`pet_info_id`) REFERENCES `msa_petinfo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `msa_adoptedpet_user_id_f42408fa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_adoptedpet`
--

LOCK TABLES `msa_adoptedpet` WRITE;
/*!40000 ALTER TABLE `msa_adoptedpet` DISABLE KEYS */;
/*!40000 ALTER TABLE `msa_adoptedpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_breed`
--

DROP TABLE IF EXISTS `msa_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_breed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `breed_name` varchar(200) NOT NULL,
  `species_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msa_breed_species_id_588a7234_fk_msa_species_id` (`species_id`),
  CONSTRAINT `msa_breed_species_id_588a7234_fk_msa_species_id` FOREIGN KEY (`species_id`) REFERENCES `msa_species` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_breed`
--

LOCK TABLES `msa_breed` WRITE;
/*!40000 ALTER TABLE `msa_breed` DISABLE KEYS */;
INSERT INTO `msa_breed` VALUES (1,'Corgi',1),(2,'Husky',1),(3,'Siamese',2),(4,'Sphynx',2),(5,'Parrot',3),(6,'Canary',3);
/*!40000 ALTER TABLE `msa_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_choice`
--

DROP TABLE IF EXISTS `msa_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_choice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msa_choice_question_id_fb129440_fk_msa_question_id` (`question_id`),
  CONSTRAINT `msa_choice_question_id_fb129440_fk_msa_question_id` FOREIGN KEY (`question_id`) REFERENCES `msa_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_choice`
--

LOCK TABLES `msa_choice` WRITE;
/*!40000 ALTER TABLE `msa_choice` DISABLE KEYS */;
INSERT INTO `msa_choice` VALUES (1,'Not much',0,1),(2,'The sky',2,1),(3,'true',2,2),(4,'false',1,2);
/*!40000 ALTER TABLE `msa_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_city`
--

DROP TABLE IF EXISTS `msa_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_city`
--

LOCK TABLES `msa_city` WRITE;
/*!40000 ALTER TABLE `msa_city` DISABLE KEYS */;
INSERT INTO `msa_city` VALUES (1,'Boston'),(2,'Quincy'),(3,'Braintree');
/*!40000 ALTER TABLE `msa_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_petinfo`
--

DROP TABLE IF EXISTS `msa_petinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_petinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `age` int NOT NULL,
  `adoption_status` tinyint(1) NOT NULL,
  `breed_id` int DEFAULT NULL,
  `shelter_id` int NOT NULL,
  `species_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msa_petinfo_shelter_id_ca61af4d_fk_msa_shelter_id` (`shelter_id`),
  KEY `msa_petinfo_species_id_3620aece_fk_msa_species_id` (`species_id`),
  KEY `msa_petinfo_breed_id_7f30dcd8_fk_msa_breed_id` (`breed_id`),
  CONSTRAINT `msa_petinfo_breed_id_7f30dcd8_fk_msa_breed_id` FOREIGN KEY (`breed_id`) REFERENCES `msa_breed` (`id`) ON DELETE SET NULL,
  CONSTRAINT `msa_petinfo_shelter_id_ca61af4d_fk_msa_shelter_id` FOREIGN KEY (`shelter_id`) REFERENCES `msa_shelter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `msa_petinfo_species_id_3620aece_fk_msa_species_id` FOREIGN KEY (`species_id`) REFERENCES `msa_species` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_petinfo`
--

LOCK TABLES `msa_petinfo` WRITE;
/*!40000 ALTER TABLE `msa_petinfo` DISABLE KEYS */;
INSERT INTO `msa_petinfo` VALUES (1,'Mudkip',2,0,1,1,1),(2,'Turtwig',1,0,4,2,2),(3,'Torchic',1,0,6,3,3),(4,'Bulbasaur',2,0,NULL,1,5);
/*!40000 ALTER TABLE `msa_petinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_question`
--

DROP TABLE IF EXISTS `msa_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_question`
--

LOCK TABLES `msa_question` WRITE;
/*!40000 ALTER TABLE `msa_question` DISABLE KEYS */;
INSERT INTO `msa_question` VALUES (1,'What\'s up?','2020-04-12 04:05:16.000000'),(2,'True or false?','2020-04-12 04:05:39.000000'),(3,'Pokemon','2020-04-12 15:09:03.000000');
/*!40000 ALTER TABLE `msa_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_shelter`
--

DROP TABLE IF EXISTS `msa_shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_shelter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msa_shelter_city_id_d52a2825_fk_msa_city_id` (`city_id`),
  CONSTRAINT `msa_shelter_city_id_d52a2825_fk_msa_city_id` FOREIGN KEY (`city_id`) REFERENCES `msa_city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_shelter`
--

LOCK TABLES `msa_shelter` WRITE;
/*!40000 ALTER TABLE `msa_shelter` DISABLE KEYS */;
INSERT INTO `msa_shelter` VALUES (1,'Red Pokeball','123567',2),(2,'Blue Pokeball','2987344',3),(3,'Green Pokeball','23423523',1);
/*!40000 ALTER TABLE `msa_shelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msa_species`
--

DROP TABLE IF EXISTS `msa_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msa_species` (
  `id` int NOT NULL AUTO_INCREMENT,
  `species_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msa_species`
--

LOCK TABLES `msa_species` WRITE;
/*!40000 ALTER TABLE `msa_species` DISABLE KEYS */;
INSERT INTO `msa_species` VALUES (1,'Dog'),(2,'Cat'),(3,'Bird'),(5,'Rabbit');
/*!40000 ALTER TABLE `msa_species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPetInfos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPetInfos`()
BEGIN
	SELECT * FROM msa_petinfo WHERE adoption_status = 0;
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

-- Dump completed on 2020-04-12 16:54:55
