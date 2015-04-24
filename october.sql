-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: october
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'201.141.14.38','2015-04-23 19:19:17','2015-04-23 19:19:17'),(2,1,'189.209.76.103','2015-04-23 20:14:45','2015-04-23 20:14:45');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Admins',NULL,'2015-04-23 19:13:30','2015-04-23 19:13:30','admins','Default group for administrators',1);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` VALUES (1,1,'backend','reportwidgets','dashboard','{\"report_container_dashboard_1\":{\"class\":\"RainLab\\\\GoogleAnalytics\\\\ReportWidgets\\\\TrafficOverview\",\"configuration\":{\"title\":\"Traffic overview\",\"days\":\"7\",\"ocWidgetWidth\":\"10\",\"ocWidgetNewRow\":0},\"sortOrder\":1},\"report_container_dashboard_2\":{\"class\":\"Indikator\\\\Backend\\\\ReportWidgets\\\\Status\",\"configuration\":{\"title\":\"indikator.backend::lang.widgets.system.label\",\"webpage\":true,\"updates\":true,\"plugins\":true,\"themes\":true,\"ocWidgetWidth\":\"10\"},\"sortOrder\":2},\"report_container_dashboard_3\":{\"class\":\"Indikator\\\\Backend\\\\ReportWidgets\\\\Server\",\"configuration\":{\"title\":\"indikator.backend::lang.widgets.server.label\",\"host\":true,\"ip\":true,\"os\":true,\"ocWidgetWidth\":\"5\"},\"sortOrder\":3},\"report_container_dashboard_4\":{\"class\":\"Indikator\\\\Backend\\\\ReportWidgets\\\\Php\",\"configuration\":{\"title\":\"indikator.backend::lang.widgets.php.label\",\"upload_limit\":true,\"memory_limit\":true,\"timezone\":true,\"ocWidgetWidth\":\"5\"},\"sortOrder\":4}}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'201.141.14.38',0,NULL,0,NULL,0,NULL),(2,1,'189.209.76.103',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Person','admin','admin@domain.tld','$2y$10$000UOcSSI6ERdcLbG2pZCeWSsnWPrwVwpmzjLLeZSt0/19tI1vy7e',NULL,'$2y$10$iFWJ7MS27it4RqunKTW2D.o2krfvMG6pbwbe9VhvuJJ6YWEHp9s5q',NULL,'{\"superuser\":1}',1,NULL,'2015-04-23 20:14:45','2015-04-23 19:13:30','2015-04-23 20:14:45');
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Deferred_Bindings',1),('2013_10_01_000002_Db_System_Files',1),('2013_10_01_000003_Db_System_Plugin_Versions',1),('2013_10_01_000004_Db_System_Plugin_History',1),('2013_10_01_000005_Db_System_Settings',1),('2013_10_01_000006_Db_System_Parameters',1),('2013_10_01_000007_Db_System_Add_Disabled_Flag',1),('2013_10_01_000008_Db_System_Mail_Templates',1),('2013_10_01_000009_Db_System_Mail_Layouts',1),('2014_10_01_000010_Db_Jobs',1),('2014_10_01_000011_Db_System_Event_Logs',1),('2014_10_01_000012_Db_System_Request_Logs',1),('2014_10_01_000013_Db_System_Sessions',1),('2013_10_01_000001_Db_Backend_Users',2),('2013_10_01_000002_Db_Backend_User_Groups',2),('2013_10_01_000003_Db_Backend_Users_Groups',2),('2013_10_01_000004_Db_Backend_User_Throttle',2),('2014_01_04_000005_Db_Backend_User_Preferences',2),('2014_10_01_000006_Db_Backend_Access_Log',2),('2014_10_01_000007_Db_Backend_Add_Description_Field',2),('2014_10_01_000001_Db_Cms_Theme_Data',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_user_countries`
--

DROP TABLE IF EXISTS `rainlab_user_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_user_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_countries_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_user_countries`
--

LOCK TABLES `rainlab_user_countries` WRITE;
/*!40000 ALTER TABLE `rainlab_user_countries` DISABLE KEYS */;
INSERT INTO `rainlab_user_countries` VALUES (1,1,'United States','US'),(2,1,'Canada','CA'),(3,1,'Australia','AU'),(4,0,'France','FR'),(5,0,'Germany','DE'),(6,0,'Iceland','IS'),(7,0,'Ireland','IE'),(8,0,'Italy','IT'),(9,0,'Spain','ES'),(10,0,'Sweden','SE'),(11,0,'Austria','AT'),(12,0,'Belgium','BE'),(13,0,'Finland','FI'),(14,0,'Czech Republic','CZ'),(15,0,'Denmark','DK'),(16,0,'Norway','NO'),(17,0,'United Kingdom','GB'),(18,0,'Switzerland','CH'),(19,0,'New Zealand','NZ'),(20,0,'Russian Federation','RU'),(21,0,'Portugal','PT'),(22,0,'Netherlands','NL'),(23,0,'Isle of Man','IM'),(24,0,'Afghanistan','AF'),(25,0,'Aland Islands ','AX'),(26,0,'Albania','AL'),(27,0,'Algeria','DZ'),(28,0,'American Samoa','AS'),(29,0,'Andorra','AD'),(30,0,'Angola','AO'),(31,0,'Anguilla','AI'),(32,0,'Antarctica','AQ'),(33,0,'Antigua and Barbuda','AG'),(34,0,'Argentina','AR'),(35,0,'Armenia','AM'),(36,0,'Aruba','AW'),(37,0,'Azerbaijan','AZ'),(38,0,'Bahamas','BS'),(39,0,'Bahrain','BH'),(40,0,'Bangladesh','BD'),(41,0,'Barbados','BB'),(42,0,'Belarus','BY'),(43,0,'Belize','BZ'),(44,0,'Benin','BJ'),(45,0,'Bermuda','BM'),(46,0,'Bhutan','BT'),(47,0,'Bolivia, Plurinational State of','BO'),(48,0,'Bonaire, Sint Eustatius and Saba','BQ'),(49,0,'Bosnia and Herzegovina','BA'),(50,0,'Botswana','BW'),(51,0,'Bouvet Island','BV'),(52,0,'Brazil','BR'),(53,0,'British Indian Ocean Territory','IO'),(54,0,'Brunei Darussalam','BN'),(55,0,'Bulgaria','BG'),(56,0,'Burkina Faso','BF'),(57,0,'Burundi','BI'),(58,0,'Cambodia','KH'),(59,0,'Cameroon','CM'),(60,0,'Cape Verde','CV'),(61,0,'Cayman Islands','KY'),(62,0,'Central African Republic','CF'),(63,0,'Chad','TD'),(64,0,'Chile','CL'),(65,0,'China','CN'),(66,0,'Christmas Island','CX'),(67,0,'Cocos (Keeling) Islands','CC'),(68,0,'Colombia','CO'),(69,0,'Comoros','KM'),(70,0,'Congo','CG'),(71,0,'Congo, the Democratic Republic of the','CD'),(72,0,'Cook Islands','CK'),(73,0,'Costa Rica','CR'),(74,0,'Cote d\'Ivoire','CI'),(75,0,'Croatia','HR'),(76,0,'Cuba','CU'),(77,0,'Curaçao','CW'),(78,0,'Cyprus','CY'),(79,0,'Djibouti','DJ'),(80,0,'Dominica','DM'),(81,0,'Dominican Republic','DO'),(82,0,'Ecuador','EC'),(83,0,'Egypt','EG'),(84,0,'El Salvador','SV'),(85,0,'Equatorial Guinea','GQ'),(86,0,'Eritrea','ER'),(87,0,'Estonia','EE'),(88,0,'Ethiopia','ET'),(89,0,'Falkland Islands (Malvinas)','FK'),(90,0,'Faroe Islands','FO'),(91,0,'Fiji','FJ'),(92,0,'French Guiana','GF'),(93,0,'French Polynesia','PF'),(94,0,'French Southern Territories','TF'),(95,0,'Gabon','GA'),(96,0,'Gambia','GM'),(97,0,'Georgia','GE'),(98,0,'Ghana','GH'),(99,0,'Gibraltar','GI'),(100,0,'Greece','GR'),(101,0,'Greenland','GL'),(102,0,'Grenada','GD'),(103,0,'Guadeloupe','GP'),(104,0,'Guam','GU'),(105,0,'Guatemala','GT'),(106,0,'Guernsey','GG'),(107,0,'Guinea','GN'),(108,0,'Guinea-Bissau','GW'),(109,0,'Guyana','GY'),(110,0,'Haiti','HT'),(111,0,'Heard Island and McDonald Islands','HM'),(112,0,'Holy See (Vatican City State)','VA'),(113,0,'Honduras','HN'),(114,0,'Hong Kong','HK'),(115,0,'Hungary','HU'),(116,0,'India','IN'),(117,0,'Indonesia','ID'),(118,0,'Iran, Islamic Republic of','IR'),(119,0,'Iraq','IQ'),(120,0,'Israel','IL'),(121,0,'Jamaica','JM'),(122,0,'Japan','JP'),(123,0,'Jersey','JE'),(124,0,'Jordan','JO'),(125,0,'Kazakhstan','KZ'),(126,0,'Kenya','KE'),(127,0,'Kiribati','KI'),(128,0,'Korea, Democratic People\'s Republic of','KP'),(129,0,'Korea, Republic of','KR'),(130,0,'Kuwait','KW'),(131,0,'Kyrgyzstan','KG'),(132,0,'Lao People\'s Democratic Republic','LA'),(133,0,'Latvia','LV'),(134,0,'Lebanon','LB'),(135,0,'Lesotho','LS'),(136,0,'Liberia','LR'),(137,0,'Libyan Arab Jamahiriya','LY'),(138,0,'Liechtenstein','LI'),(139,0,'Lithuania','LT'),(140,0,'Luxembourg','LU'),(141,0,'Macao','MO'),(142,0,'Macedonia','MK'),(143,0,'Madagascar','MG'),(144,0,'Malawi','MW'),(145,0,'Malaysia','MY'),(146,0,'Maldives','MV'),(147,0,'Mali','ML'),(148,0,'Malta','MT'),(149,0,'Marshall Islands','MH'),(150,0,'Martinique','MQ'),(151,0,'Mauritania','MR'),(152,0,'Mauritius','MU'),(153,0,'Mayotte','YT'),(154,0,'Mexico','MX'),(155,0,'Micronesia, Federated States of','FM'),(156,0,'Moldova, Republic of','MD'),(157,0,'Monaco','MC'),(158,0,'Mongolia','MN'),(159,0,'Montenegro','ME'),(160,0,'Montserrat','MS'),(161,0,'Morocco','MA'),(162,0,'Mozambique','MZ'),(163,0,'Myanmar','MM'),(164,0,'Namibia','NA'),(165,0,'Nauru','NR'),(166,0,'Nepal','NP'),(167,0,'New Caledonia','NC'),(168,0,'Nicaragua','NI'),(169,0,'Niger','NE'),(170,0,'Nigeria','NG'),(171,0,'Niue','NU'),(172,0,'Norfolk Island','NF'),(173,0,'Northern Mariana Islands','MP'),(174,0,'Oman','OM'),(175,0,'Pakistan','PK'),(176,0,'Palau','PW'),(177,0,'Palestinian Territory, Occupied','PS'),(178,0,'Panama','PA'),(179,0,'Papua New Guinea','PG'),(180,0,'Paraguay','PY'),(181,0,'Peru','PE'),(182,0,'Philippines','PH'),(183,0,'Pitcairn','PN'),(184,0,'Poland','PL'),(185,0,'Puerto Rico','PR'),(186,0,'Qatar','QA'),(187,0,'Reunion','RE'),(188,0,'Romania','RO'),(189,0,'Rwanda','RW'),(190,0,'Saint Barthélemy','BL'),(191,0,'Saint Helena','SH'),(192,0,'Saint Kitts and Nevis','KN'),(193,0,'Saint Lucia','LC'),(194,0,'Saint Martin (French part)','MF'),(195,0,'Saint Pierre and Miquelon','PM'),(196,0,'Saint Vincent and the Grenadines','VC'),(197,0,'Samoa','WS'),(198,0,'San Marino','SM'),(199,0,'Sao Tome and Principe','ST'),(200,0,'Saudi Arabia','SA'),(201,0,'Senegal','SN'),(202,0,'Serbia','RS'),(203,0,'Seychelles','SC'),(204,0,'Sierra Leone','SL'),(205,0,'Singapore','SG'),(206,0,'Sint Maarten (Dutch part)','SX'),(207,0,'Slovakia','SK'),(208,0,'Slovenia','SI'),(209,0,'Solomon Islands','SB'),(210,0,'Somalia','SO'),(211,0,'South Africa','ZA'),(212,0,'South Georgia and the South Sandwich Islands','GS'),(213,0,'Sri Lanka','LK'),(214,0,'Sudan','SD'),(215,0,'Suriname','SR'),(216,0,'Svalbard and Jan Mayen','SJ'),(217,0,'Swaziland','SZ'),(218,0,'Syrian Arab Republic','SY'),(219,0,'Taiwan, Province of China','TW'),(220,0,'Tajikistan','TJ'),(221,0,'Tanzania, United Republic of','TZ'),(222,0,'Thailand','TH'),(223,0,'Timor-Leste','TL'),(224,0,'Togo','TG'),(225,0,'Tokelau','TK'),(226,0,'Tonga','TO'),(227,0,'Trinidad and Tobago','TT'),(228,0,'Tunisia','TN'),(229,0,'Turkey','TR'),(230,0,'Turkmenistan','TM'),(231,0,'Turks and Caicos Islands','TC'),(232,0,'Tuvalu','TV'),(233,0,'Uganda','UG'),(234,0,'Ukraine','UA'),(235,0,'United Arab Emirates','AE'),(236,0,'United States Minor Outlying Islands','UM'),(237,0,'Uruguay','UY'),(238,0,'Uzbekistan','UZ'),(239,0,'Vanuatu','VU'),(240,0,'Venezuela, Bolivarian Republic of','VE'),(241,0,'Viet Nam','VN'),(242,0,'Virgin Islands, British','VG'),(243,0,'Virgin Islands, U.S.','VI'),(244,0,'Wallis and Futuna','WF'),(245,0,'Western Sahara','EH'),(246,0,'Yemen','YE'),(247,0,'Zambia','ZM'),(248,0,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `rainlab_user_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_user_mail_blockers`
--

DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_user_mail_blockers`
--

LOCK TABLES `rainlab_user_mail_blockers` WRITE;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_user_states`
--

DROP TABLE IF EXISTS `rainlab_user_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_user_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_states_country_id_index` (`country_id`),
  KEY `rainlab_user_states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_user_states`
--

LOCK TABLES `rainlab_user_states` WRITE;
/*!40000 ALTER TABLE `rainlab_user_states` DISABLE KEYS */;
INSERT INTO `rainlab_user_states` VALUES (1,1,'Alabama','AL'),(2,1,'Alaska','AK'),(3,1,'American Samoa','AS'),(4,1,'Arizona','AZ'),(5,1,'Arkansas','AR'),(6,1,'California','CA'),(7,1,'Colorado','CO'),(8,1,'Connecticut','CT'),(9,1,'Delaware','DE'),(10,1,'Dist. of Columbia','DC'),(11,1,'Florida','FL'),(12,1,'Georgia','GA'),(13,1,'Guam','GU'),(14,1,'Hawaii','HI'),(15,1,'Idaho','ID'),(16,1,'Illinois','IL'),(17,1,'Indiana','IN'),(18,1,'Iowa','IA'),(19,1,'Kansas','KS'),(20,1,'Kentucky','KY'),(21,1,'Louisiana','LA'),(22,1,'Maine','ME'),(23,1,'Maryland','MD'),(24,1,'Marshall Islands','MH'),(25,1,'Massachusetts','MA'),(26,1,'Michigan','MI'),(27,1,'Micronesia','FM'),(28,1,'Minnesota','MN'),(29,1,'Mississippi','MS'),(30,1,'Missouri','MO'),(31,1,'Montana','MT'),(32,1,'Nebraska','NE'),(33,1,'Nevada','NV'),(34,1,'New Hampshire','NH'),(35,1,'New Jersey','NJ'),(36,1,'New Mexico','NM'),(37,1,'New York','NY'),(38,1,'North Carolina','NC'),(39,1,'North Dakota','ND'),(40,1,'Northern Marianas','MP'),(41,1,'Ohio','OH'),(42,1,'Oklahoma','OK'),(43,1,'Oregon','OR'),(44,1,'Palau','PW'),(45,1,'Pennsylvania','PA'),(46,1,'Puerto Rico','PR'),(47,1,'Rhode Island','RI'),(48,1,'South Carolina','SC'),(49,1,'South Dakota','SD'),(50,1,'Tennessee','TN'),(51,1,'Texas','TX'),(52,1,'Utah','UT'),(53,1,'Vermont','VT'),(54,1,'Virginia','VA'),(55,1,'Virgin Islands','VI'),(56,1,'Washington','WA'),(57,1,'West Virginia','WV'),(58,1,'Wisconsin','WI'),(59,1,'Wyoming','WY'),(60,2,'Alberta','AB'),(61,2,'British Columbia','BC'),(62,2,'Manitoba','MB'),(63,2,'New Brunswick','NB'),(64,2,'Newfoundland and Labrador','NL'),(65,2,'Northwest Territories','NT'),(66,2,'Nova Scotia','NS'),(67,2,'Nunavut','NU'),(68,2,'Ontario','ON'),(69,2,'Prince Edward Island','PE'),(70,2,'Quebec','QC'),(71,2,'Saskatchewan','SK'),(72,2,'Yukon','YT'),(73,3,'New South Wales','NSW'),(74,3,'Queensland','QLD'),(75,3,'South Australia','SA'),(76,3,'Tasmania','TAS'),(77,3,'Victoria','VIC'),(78,3,'Western Australia','WA'),(79,3,'Northern Territory','NT'),(80,3,'Australian Capital Territory','ACT'),(81,5,'Baden-Württemberg','BW'),(82,5,'Bavaria','BY'),(83,5,'Berlin','BE'),(84,5,'Brandenburg','BB'),(85,5,'Bremen','HB'),(86,5,'Hamburg','HH'),(87,5,'Hesse','HE'),(88,5,'Mecklenburg-Vorpommern','MV'),(89,5,'Lower Saxony','NI'),(90,5,'North Rhine-Westphalia','NW'),(91,5,'Rhineland-Palatinate','RP'),(92,5,'Saarland','SL'),(93,5,'Saxony','SN'),(94,5,'Saxony-Anhalt','ST'),(95,5,'Schleswig-Holstein','SH'),(96,5,'Thuringia','TH'),(97,7,'Dublin','D'),(98,7,'Wicklow','WW'),(99,7,'Wexford','WX'),(100,7,'Carlow','CW'),(101,7,'Kildare','KE'),(102,7,'Meath','MH'),(103,7,'Louth','LH'),(104,7,'Monaghan','MN'),(105,7,'Cavan','CN'),(106,7,'Longford','LD'),(107,7,'Westmeath','WH'),(108,7,'Offaly','OY'),(109,7,'Laois','LS'),(110,7,'Kilkenny','KK'),(111,7,'Waterford','WD'),(112,7,'Cork','C'),(113,7,'Kerry','KY'),(114,7,'Limerick','LK'),(115,7,'North Tipperary','TN'),(116,7,'South Tipperary','TS'),(117,7,'Clare','CE'),(118,7,'Galway','G'),(119,7,'Mayo','MO'),(120,7,'Roscommon','RN'),(121,7,'Sligo','SO'),(122,7,'Leitrim','LM'),(123,7,'Donegal','DL'),(124,22,'Drenthe','DR'),(125,22,'Flevoland','FL'),(126,22,'Friesland','FR'),(127,22,'Gelderland','GE'),(128,22,'Groningen','GR'),(129,22,'Limburg','LI'),(130,22,'Noord-Brabant','NB'),(131,22,'Noord-Holland','NH'),(132,22,'Overijssel','OV'),(133,22,'Utrecht','UT'),(134,22,'Zeeland','ZE'),(135,22,'Zuid-Holland','ZH'),(136,17,'Aberdeenshire','ABE'),(137,17,'Anglesey','ALY'),(138,17,'Angus','ANG'),(139,17,'Argyll','ARG'),(140,17,'Ayrshire','AYR'),(141,17,'Banffshire','BAN'),(142,17,'Bedfordshire','BED'),(143,17,'Berkshire','BER'),(144,17,'Berwickshire','BWS'),(145,17,'Brecknockshire','BRE'),(146,17,'Buckinghamshire','BUC'),(147,17,'Bute','BUT'),(148,17,'Caernarfonshire','CAE'),(149,17,'Caithness','CAI'),(150,17,'Cambridgeshire','CAM'),(151,17,'Cardiganshire','CAR'),(152,17,'Carmarthenshire','CMS'),(153,17,'Cheshire','CHE'),(154,17,'Clackmannanshire','CLA'),(155,17,'Cleveland','CLE'),(156,17,'Cornwall','COR'),(157,17,'Cromartyshire','CRO'),(158,17,'Cumberland','CBR'),(159,17,'Cumbria','CUM'),(160,17,'Denbighshire','DEN'),(161,17,'Derbyshire','DER'),(162,17,'Devon','DEV'),(163,17,'Dorset','DOR'),(164,17,'Dumbartonshire','DBS'),(165,17,'Dumfriesshire','DUM'),(166,17,'Durham','DUR'),(167,17,'East Lothian','ELO'),(168,17,'Essex','ESS'),(169,17,'Flintshire','FLI'),(170,17,'Fife','FIF'),(171,17,'Glamorgan','GLA'),(172,17,'Gloucestershire','GLO'),(173,17,'Hampshire','HAM'),(174,17,'Herefordshire','HER'),(175,17,'Hertfordshire','HTF'),(176,17,'Huntingdonshire','HUN'),(177,17,'Inverness','INV'),(178,17,'Kent','KEN'),(179,17,'Kincardineshire','KCD'),(180,17,'Kinross-shire','KIN'),(181,17,'Kirkcudbrightshire','KIR'),(182,17,'Lanarkshire','LKS'),(183,17,'Lancashire','LAN'),(184,17,'Leicestershire','LEI'),(185,17,'Lincolnshire','LIN'),(186,17,'London','LON'),(187,17,'Manchester','MAN'),(188,17,'Merionethshire','MER'),(189,17,'Merseyside','MER'),(190,17,'Middlesex','MDX'),(191,17,'Midlands','MID'),(192,17,'Midlothian','MLT'),(193,17,'Monmouthshire','MON'),(194,17,'Montgomeryshire','MGY'),(195,17,'Moray','MOR'),(196,17,'Nairnshire','NAI'),(197,17,'Norfolk','NOR'),(198,17,'Northamptonshire','NMP'),(199,17,'Northumberland','NUM'),(200,17,'Nottinghamshire','NOT'),(201,17,'Orkney','ORK'),(202,17,'Oxfordshire','OXF'),(203,17,'Peebleshire','PEE'),(204,17,'Pembrokeshire','PEM'),(205,17,'Perthshire','PER'),(206,17,'Radnorshire','RAD'),(207,17,'Renfrewshire','REN'),(208,17,'Ross & Cromarty','ROS'),(209,17,'Roxburghshire','ROX'),(210,17,'Rutland','RUT'),(211,17,'Selkirkshire','SEL'),(212,17,'Shetland','SHE'),(213,17,'Shropshire','SHR'),(214,17,'Somerset','SOM'),(215,17,'Staffordshire','STA'),(216,17,'Stirlingshire','STI'),(217,17,'Suffolk','SUF'),(218,17,'Surrey','SUR'),(219,17,'Sussex','SUS'),(220,17,'Sutherland','SUT'),(221,17,'Tyne & Wear','TYN'),(222,17,'Warwickshire','WAR'),(223,17,'West Lothian','WLO'),(224,17,'Westmorland','WES'),(225,17,'Wigtownshire','WIG'),(226,17,'Wiltshire','WIL'),(227,17,'Worcestershire','WOR'),(228,17,'Yorkshire','YOR'),(229,115,'Budapest','BUD'),(230,115,'Baranya','BAR'),(231,115,'Bács-Kiskun','BKM'),(232,115,'Békés','BEK'),(233,115,'Borsod-Abaúj-Zemplén','BAZ'),(234,115,'Csongrád','CSO'),(235,115,'Fejér','FEJ'),(236,115,'Győr-Moson-Sopron','GMS'),(237,115,'Hajdú-Bihar','HBM'),(238,115,'Heves','HEV'),(239,115,'Jász-Nagykun-Szolnok','JNS'),(240,115,'Komárom-Esztergom','KEM'),(241,115,'Nógrád','NOG'),(242,115,'Pest','PES'),(243,115,'Somogy','SOM'),(244,115,'Szabolcs-Szatmár-Bereg','SSB'),(245,115,'Tolna','TOL'),(246,115,'Vas','VAS'),(247,115,'Veszprém','VES'),(248,115,'Zala','ZAL'),(249,116,'Andhra Pradesh','AP'),(250,116,'Arunachal Pradesh','AR'),(251,116,'Assam','AS'),(252,116,'Bihar','BR'),(253,116,'Chhattisgarh','CT'),(254,116,'Goa','GA'),(255,116,'Gujarat','GJ'),(256,116,'Haryana','HR'),(257,116,'Himachal Pradesh','HP'),(258,116,'Jammu and Kashmir','JK'),(259,116,'Jharkhand','JH'),(260,116,'Karnataka','KA'),(261,116,'Kerala','KL'),(262,116,'Madhya Pradesh','MP'),(263,116,'Maharashtra','MH'),(264,116,'Manipur','MN'),(265,116,'Meghalaya','ML'),(266,116,'Mizoram','MZ'),(267,116,'Nagaland','NL'),(268,116,'Odisha','OR'),(269,116,'Punjab','PB'),(270,116,'Rajasthan','RJ'),(271,116,'Sikkim','SK'),(272,116,'Tamil Nadu','TN'),(273,116,'Telangana','TG'),(274,116,'Tripura','TR'),(275,116,'Uttarakhand','UT'),(276,116,'Uttar Pradesh','UP'),(277,116,'West Bengal','WB'),(278,116,'Andaman and Nicobar Islands','AN'),(279,116,'Chandigarh','CH'),(280,116,'Dadra and Nagar Haveli','DN'),(281,116,'Daman and Diu','DD'),(282,116,'Delhi','DL'),(283,116,'Lakshadweep','LD'),(284,116,'Puducherry','PY');
/*!40000 ALTER TABLE `rainlab_user_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','exception \'ErrorException\' with message \'ZipArchive::extractTo(/var/www/html/modules/backend/ServiceProvider.php): failed to open stream: Permission denied\' in /var/www/html/vendor/october/rain/src/Filesystem/Zip.php:77\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'ZipArchive::ext...\', \'/var/www/html/v...\', 77, Array)\n#1 /var/www/html/vendor/october/rain/src/Filesystem/Zip.php(77): ZipArchive->extractTo(\'/var/www/html\')\n#2 /var/www/html/modules/system/classes/UpdateManager.php(399): October\\Rain\\Filesystem\\Zip::extract(\'/var/www/html/s...\', \'/var/www/html\')\n#3 /var/www/html/modules/system/controllers/Updates.php(140): System\\Classes\\UpdateManager->extractCore(\'560cffc1aac59ae...\', \'244\')\n#4 [internal function]: System\\Controllers\\Updates->onExecuteStep()\n#5 /var/www/html/modules/backend/classes/Controller.php(490): call_user_func_array(Array, Array)\n#6 /var/www/html/modules/backend/classes/Controller.php(378): Backend\\Classes\\Controller->runAjaxHandler(\'onExecuteStep\')\n#7 /var/www/html/modules/backend/classes/Controller.php(217): Backend\\Classes\\Controller->execAjaxHandlers()\n#8 /var/www/html/modules/backend/classes/BackendController.php(78): Backend\\Classes\\Controller->run(\'index\', Array)\n#9 [internal function]: Backend\\Classes\\BackendController->run(\'system/updates\')\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(246): call_user_func_array(Array, Array)\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(162): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(107): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#13 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(108): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Route.php(204): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\Classes...\', \'run\')\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Router.php(701): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Router.php(670): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Routing/Router.php(628): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(214): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 /var/www/html/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(55): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(125): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(61): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(125): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(125): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(40): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(125): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(42): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(125): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(115): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(84): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 /var/www/html/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 {main}',NULL,'2015-04-23 19:19:41','2015-04-23 19:19:41');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
INSERT INTO `system_files` VALUES (2,'55395a072f88e688401637.p12','October-1cc4344d49f0.p12',1732,'application/octet-stream',NULL,NULL,'gapi_key','1','RainLab\\GoogleAnalytics\\Models\\Settings',1,2,'2015-04-23 19:45:59','2015-04-23 19:46:05'),(3,'553980a37624a714671860.png','mndz_logo_blk.png',10081,'image/png',NULL,NULL,'logo','2','Backend\\Models\\BrandSettings',1,3,'2015-04-23 22:30:43','2015-04-23 22:30:51');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default','default','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n    </body>\n</html>','{{ message|raw }}','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2015-04-23 19:13:30','2015-04-23 19:13:30'),(2,'System','system','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>','{{ message|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2015-04-23 19:13:30','2015-04-23 19:13:30');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','core','hash','\"560cffc1aac59ae8f53ea257742922f6\"'),(3,'system','core','build','\"244\"'),(4,'system','theme','history','{\"Responsiv.Flat\":\"responsiv-flat\",\"jacoweb.agency\":\"jacoweb-agency\"}'),(5,'cms','theme','active','\"jacoweb-agency\"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'RainLab.User','script','1.0.1','create_users_table.php','2015-04-23 19:22:08'),(2,'RainLab.User','script','1.0.1','create_throttle_table.php','2015-04-23 19:22:08'),(3,'RainLab.User','script','1.0.1','create_states_table.php','2015-04-23 19:22:09'),(4,'RainLab.User','script','1.0.1','create_countries_table.php','2015-04-23 19:22:09'),(5,'RainLab.User','comment','1.0.1','Initialize plugin.','2015-04-23 19:22:09'),(6,'RainLab.User','script','1.0.2','seed_all_tables.php','2015-04-23 19:22:09'),(7,'RainLab.User','comment','1.0.2','Add seed data for countries and states.','2015-04-23 19:22:09'),(8,'RainLab.User','comment','1.0.3','Translated hard-coded text to language strings.','2015-04-23 19:22:09'),(9,'RainLab.User','comment','1.0.4','Improvements to user-interface for Location manager.','2015-04-23 19:22:09'),(10,'RainLab.User','script','1.0.5','users_add_contact_details.php','2015-04-23 19:22:09'),(11,'RainLab.User','comment','1.0.5','Added contact details for users.','2015-04-23 19:22:09'),(12,'RainLab.User','script','1.0.6','create_mail_blockers_table.php','2015-04-23 19:22:09'),(13,'RainLab.User','comment','1.0.6','Added Mail Blocker utility so users can block specific mail templates.','2015-04-23 19:22:09'),(14,'RainLab.User','comment','1.0.7','Adds default country and state fields to Settings page.','2015-04-23 19:22:09'),(15,'RainLab.User','comment','1.0.8','Updated the Settings page.','2015-04-23 19:22:09'),(16,'RainLab.User','comment','1.0.9','Adds new welcome mail message for users and administrators.','2015-04-23 19:22:09'),(17,'RainLab.User','comment','1.0.10','Adds administrator-only activation mode.','2015-04-23 19:22:09'),(18,'RainLab.User','script','1.0.11','users_add_login_column.php','2015-04-23 19:22:09'),(19,'RainLab.User','comment','1.0.11','Users now have an optional login field that defaults to the email field.','2015-04-23 19:22:09'),(20,'RainLab.User','script','1.0.12','users_rename_login_to_username.php','2015-04-23 19:22:09'),(21,'RainLab.User','comment','1.0.12','Create a dedicated setting for choosing the login mode.','2015-04-23 19:22:09'),(22,'RainLab.User','comment','1.0.13','Minor fix to the Account sign in logic.','2015-04-23 19:22:09'),(23,'RainLab.User','comment','1.0.14','Minor improvements to the code.','2015-04-23 19:22:09'),(24,'RainLab.User','script','1.0.15','users_add_surname.php','2015-04-23 19:22:09'),(25,'RainLab.User','comment','1.0.15','Adds last name column to users table (surname).','2015-04-23 19:22:09'),(29,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2015-04-23 19:22:27'),(30,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2015-04-23 19:22:27'),(31,'RainLab.Pages','comment','1.0.3','Implemented menus.','2015-04-23 19:22:27'),(32,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2015-04-23 19:22:27'),(33,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2015-04-23 19:22:27'),(34,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2015-04-23 19:22:27'),(35,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2015-04-23 19:22:27'),(36,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2015-04-23 19:22:27'),(37,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2015-04-23 19:22:27'),(38,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2015-04-23 19:22:27'),(39,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2015-04-23 19:22:27'),(57,'RainLab.GoogleAnalytics','comment','1.0.1','Initialize plugin','2015-04-23 19:31:27'),(58,'RainLab.GoogleAnalytics','comment','1.0.2','Fixed a minor bug in the Top Pages widget','2015-04-23 19:31:27'),(59,'RainLab.GoogleAnalytics','comment','1.0.3','Minor improvements to the code','2015-04-23 19:31:27'),(63,'Indikator.Backend','comment','1.0.0','First version of Backend Plus.','2015-04-23 21:38:41'),(64,'Indikator.Backend','comment','1.0.1','Fixed the update count issue.','2015-04-23 21:38:41'),(65,'Indikator.Backend','comment','1.0.2','Added Last logins widget.','2015-04-23 21:38:41'),(66,'Indikator.Backend','comment','1.0.3','Added RSS viewer widget.','2015-04-23 21:38:41'),(67,'Indikator.Backend','comment','1.0.4','Minor improvements and bugfix.','2015-04-23 21:38:41'),(68,'Indikator.Backend','comment','1.0.5','Added Random images widget.','2015-04-23 21:38:41'),(69,'Indikator.Backend','comment','1.0.6','Added virtual keyboard option.','2015-04-23 21:38:41'),(70,'Indikator.Backend','script','1.1.0','Improving the Random images widget with slideshow.','2015-04-23 21:38:41'),(71,'Indikator.Backend','script','1.1.0','Added Turkish translation (thanks to mahony0).','2015-04-23 21:38:41'),(72,'Indikator.Backend','script','1.1.0','Fixed the URL path issue by virtual keyboard.','2015-04-23 21:38:41'),(73,'Indikator.Backend','comment','1.1.0','Added Lorem ipsum components (image and text).','2015-04-23 21:38:41'),(74,'Indikator.Backend','comment','1.1.1','Hide the \"Find more themes...\" link.','2015-04-23 21:38:41'),(75,'Indikator.Backend','comment','1.1.2','Added German language.','2015-04-23 21:38:41'),(76,'Indikator.Backend','comment','1.1.3','The widgets work on localhost too.','2015-04-23 21:38:41'),(77,'Indikator.Backend','comment','1.1.4','Added Spanish language.','2015-04-23 21:38:41');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'RainLab.User','1.0.15','2015-04-23 19:22:09',0),(3,'RainLab.Pages','1.0.11','2015-04-23 19:22:27',0),(5,'RainLab.GoogleAnalytics','1.0.3','2015-04-23 19:31:27',0),(7,'Indikator.Backend','1.1.4','2015-04-23 21:38:41',0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
INSERT INTO `system_request_logs` VALUES (1,404,'http://104.236.162.86/favicon.ico',NULL,2,'2015-04-23 20:14:40','2015-04-23 23:13:18'),(2,404,'http://104.236.162.86/signin','[\"http:\\/\\/104.236.162.86\\/register\"]',1,'2015-04-23 23:13:14','2015-04-23 23:13:14'),(3,404,'http://104.236.162.86',NULL,2,'2015-04-23 23:13:19','2015-04-23 23:13:59');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'rainlab_googleanalytics_settings','{\"project_name\":\"October\",\"client_id\":\"352579412911-hdkm0erjaeo6ng6gj303pj83rh93f4kb.apps.googleusercontent.com\",\"app_email\":\"352579412911-hdkm0erjaeo6ng6gj303pj83rh93f4kb@developer.gserviceaccount.com\",\"profile_id\":\"101363208\",\"tracking_id\":\"UA-62245006-1\",\"domain_name\":\"http:\\/\\/barflyyy.com\"}'),(2,'backend_brand_settings','{\"app_name\":\"October CMS\",\"app_tagline\":\"Getting back to basics\",\"primary_color_light\":\"#e74c3c\",\"primary_color_dark\":\"#c0392b\",\"secondary_color_light\":\"#34495e\",\"secondary_color_dark\":\"#2b3e50\",\"custom_css\":\"\"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_throttle`
--

DROP TABLE IF EXISTS `user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_throttle`
--

LOCK TABLES `user_throttle` WRITE;
/*!40000 ALTER TABLE `user_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_country_id_index` (`country_id`),
  KEY `users_state_id_index` (`state_id`),
  KEY `users_login_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2015-04-23 23:51:00
