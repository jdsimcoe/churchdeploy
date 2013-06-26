# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: eota
# Generation Time: 2013-05-04 22:57:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sym_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_authors`;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_area` varchar(255) DEFAULT NULL,
  `auth_token_active` enum('yes','no') NOT NULL DEFAULT 'no',
  `language` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`)
VALUES
	(1,'jdsimcoe','7b10dfd8ecfb74eafd8778364f883ce41cb756f5','Jonathan','Simcoe','jonathan@simko.io','2013-05-01 11:48:30','developer','yes','3','no',NULL);

/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_cache`;

CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;

INSERT INTO `sym_cache` (`id`, `hash`, `creation`, `expiry`, `data`)
VALUES
	(1,'bf6d7de004632fe746ab5eb02fecba7f',1367277429,NULL,'eJxVkEFOwzAQRa/ylbVJYYeqtFU3FNjCBabJtI4aeyLbaRquxoIjcQXGKSpiZc98+/2v//35VW0ursOZQ2zFr4qH8r4A+1qa1h9XxZAOd4/FZl0Fjr34yOsq8SWtt77BK8choibHIB1jTyfG4JMgWXYGkSZlGGy7Dr2MHNBGHNsz++sr/dd6WKa8yQSdmEKyJXaCiTMm8EECm1lOTLUFKc1T0rDRYE99aj/UZbbMAD1VVrQc5vsTZcoV8Lt6E/9vfpZuws5KTEu8Z48bT0PKPnI482ybshIxWkpRWCvDC6ymRy3OKZAbTDIsM9ugE6MyOYxtsnmviJEmA74VkM35L8cooWtKbB37slrMNVeLW+8/EraV7Q==');

/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_cachelite_references
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_cachelite_references`;

CREATE TABLE `sym_cachelite_references` (
  `page` varchar(255) NOT NULL DEFAULT '',
  `sections` varchar(255) DEFAULT NULL,
  `entries` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries`;

CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`)
VALUES
	(13661,2,2,'2012-06-23 09:43:05','2012-06-23 16:43:05'),
	(13,2,1,'2011-11-22 02:01:58','2011-11-22 10:01:58'),
	(107,9,2,'2011-12-03 21:50:04','2011-12-04 05:50:04'),
	(108,9,2,'2011-12-03 21:50:17','2011-12-04 05:50:17'),
	(109,9,2,'2011-12-03 21:50:32','2011-12-04 05:50:32'),
	(110,9,2,'2011-12-03 21:50:38','2011-12-04 05:50:38'),
	(111,9,2,'2011-12-03 21:50:49','2011-12-04 05:50:49'),
	(112,9,2,'2011-12-03 21:50:55','2011-12-04 05:50:55'),
	(113,9,2,'2011-12-07 15:27:52','2011-12-07 23:27:52'),
	(117,11,2,'2011-12-08 07:32:35','2011-12-08 15:32:35'),
	(118,11,2,'2011-12-08 08:39:01','2011-12-08 16:39:01'),
	(119,11,2,'2011-12-08 12:41:25','2011-12-08 20:41:25'),
	(12908,11,2,'2012-03-17 18:27:29','2012-03-18 01:27:29'),
	(12976,11,2,'2012-05-13 11:23:33','2012-05-13 18:23:33'),
	(12495,9,2,'2011-12-29 11:10:15','2011-12-29 19:10:15'),
	(12496,11,2,'2011-12-29 11:10:44','2011-12-29 19:10:44'),
	(12975,9,2,'2012-05-13 02:29:25','2012-05-13 09:29:25'),
	(12945,11,4,'2012-04-30 16:17:04','2012-04-30 23:17:04'),
	(12971,11,2,'2012-05-09 18:51:16','2012-05-10 01:51:16'),
	(13078,11,2,'2012-05-14 00:10:30','2012-05-14 07:10:30'),
	(13077,9,2,'2012-05-14 00:10:01','2012-05-14 07:10:01'),
	(13355,25,2,'2012-05-16 14:28:37','2012-05-16 21:28:37'),
	(13358,11,4,'2012-05-17 13:59:33','2012-05-17 20:59:33'),
	(13600,11,3,'2012-06-20 19:38:50','2012-06-21 02:38:50'),
	(13562,2,2,'2012-06-13 21:08:39','2012-06-14 04:08:39'),
	(13528,9,2,'2012-06-01 18:56:56','2012-06-02 01:56:56'),
	(13529,11,2,'2012-06-01 18:57:30','2012-06-02 01:57:30'),
	(13547,2,2,'2012-06-10 00:36:33','2012-06-10 07:36:33'),
	(13548,2,2,'2012-06-10 00:39:13','2012-06-10 07:39:13'),
	(13559,2,2,'2012-06-13 20:10:33','2012-06-14 03:10:33'),
	(13568,11,4,'2012-06-15 15:03:44','2012-06-15 22:03:44'),
	(13577,9,2,'2012-06-18 10:07:10','2012-06-18 17:07:10'),
	(13592,11,4,'2012-06-20 18:31:21','2012-06-21 01:31:21'),
	(13660,2,2,'2012-06-23 09:38:42','2012-06-23 16:38:42'),
	(13669,11,2,'2012-06-24 10:08:02','2012-06-24 17:08:02'),
	(13918,2,4,'2012-09-04 08:07:11','2012-09-04 15:07:11'),
	(13919,2,4,'2012-09-04 08:07:34','2012-09-04 15:07:34'),
	(13920,3,1,'2013-04-23 09:21:14','2013-04-23 16:21:14'),
	(13921,3,1,'2013-04-23 09:21:48','2013-04-23 16:21:48'),
	(13922,3,1,'2013-04-23 09:22:51','2013-04-23 16:22:51'),
	(13923,3,1,'2013-04-23 09:22:58','2013-04-23 16:22:58'),
	(13924,3,1,'2013-04-23 09:24:03','2013-04-23 16:24:03'),
	(13925,3,1,'2013-04-23 10:04:53','2013-04-23 17:04:53'),
	(13926,3,1,'2013-04-23 10:05:22','2013-04-23 17:05:22'),
	(13927,3,1,'2013-04-23 10:06:00','2013-04-23 17:06:00'),
	(13928,3,1,'2013-04-23 10:06:37','2013-04-23 17:06:37'),
	(13929,8,1,'2013-04-26 13:18:22','2013-04-26 20:18:22'),
	(13930,7,1,'2013-04-26 15:47:11','2013-04-26 22:47:11'),
	(13931,8,1,'2013-04-26 15:59:45','2013-04-26 22:59:45'),
	(13932,3,1,'2013-04-26 16:17:43','2013-04-26 23:17:43'),
	(13933,7,1,'2013-04-29 16:09:33','2013-04-29 23:09:33'),
	(13935,7,1,'2013-05-01 11:22:31','2013-05-01 18:22:31');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_100
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_100`;

CREATE TABLE `sym_entries_data_100` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_103
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_103`;

CREATE TABLE `sym_entries_data_103` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_108
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_108`;

CREATE TABLE `sym_entries_data_108` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_109
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_109`;

CREATE TABLE `sym_entries_data_109` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_11`;

CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_110
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_110`;

CREATE TABLE `sym_entries_data_110` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_111
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_111`;

CREATE TABLE `sym_entries_data_111` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_112
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_112`;

CREATE TABLE `sym_entries_data_112` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_115
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_115`;

CREATE TABLE `sym_entries_data_115` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_115` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_115` DISABLE KEYS */;

INSERT INTO `sym_entries_data_115` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,111,'verses','Verses','verses','Verses',1,'Verses'),
	(2,108,'text','Text','text','Text',1,'Text'),
	(4,110,'locations','Locations','locations','Locations',1,'Locations'),
	(5,107,'images','Images','images','Images',1,'Images'),
	(6,109,'events','Events','events','Events',1,'Events'),
	(7,113,'downloads','Downloads','downloads','Downloads',1,'Downloads'),
	(8,12495,'ustream','UStream','ustream','UStream',1,'UStream'),
	(9,12975,'spacer','Spacer','spacer','Spacer',1,'Spacer'),
	(10,13077,'teachings','Teachings','teachings','Teachings',1,'Teachings'),
	(12,112,'members-roles','Members/Roles','members-roles','Members/Roles',1,'Members/Roles'),
	(13,13528,'search','Search','search','Search',1,'Search'),
	(14,13577,'events-recurring','Events (recurring)','events-recurring','Events (recurring)',2,'Events (recurring)');

/*!40000 ALTER TABLE `sym_entries_data_115` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_117
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_117`;

CREATE TABLE `sym_entries_data_117` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_118
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_118`;

CREATE TABLE `sym_entries_data_118` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_12`;

CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_123
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_123`;

CREATE TABLE `sym_entries_data_123` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_124
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_124`;

CREATE TABLE `sym_entries_data_124` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_125
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_125`;

CREATE TABLE `sym_entries_data_125` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_127
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_127`;

CREATE TABLE `sym_entries_data_127` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_129
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_129`;

CREATE TABLE `sym_entries_data_129` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_131
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_131`;

CREATE TABLE `sym_entries_data_131` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_132
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_132`;

CREATE TABLE `sym_entries_data_132` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_133
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_133`;

CREATE TABLE `sym_entries_data_133` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_134
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_134`;

CREATE TABLE `sym_entries_data_134` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_135
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_135`;

CREATE TABLE `sym_entries_data_135` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_136
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_136`;

CREATE TABLE `sym_entries_data_136` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_137
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_137`;

CREATE TABLE `sym_entries_data_137` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_138
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_138`;

CREATE TABLE `sym_entries_data_138` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_139
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_139`;

CREATE TABLE `sym_entries_data_139` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_139` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_139` DISABLE KEYS */;

INSERT INTO `sym_entries_data_139` (`id`, `entry_id`, `relation_id`)
VALUES
	(3,13929,NULL),
	(8,13931,NULL);

/*!40000 ALTER TABLE `sym_entries_data_139` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_14`;

CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_14` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_14` DISABLE KEYS */;

INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(95,13661,'meta-keywords','meta-keywords'),
	(103,13,'meta-description','meta-description'),
	(102,13547,'default-email-address','default-email-address'),
	(92,13548,'default-phone-number','default-phone-number'),
	(89,13559,'sunrise-worship','sunrise-worship'),
	(101,13562,'footer','footer'),
	(98,13660,'meta-page-title','meta-page-title'),
	(133,13918,'tagline','tagline'),
	(67,13919,'podcast-audio','podcast-audio');

/*!40000 ALTER TABLE `sym_entries_data_14` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_140
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_140`;

CREATE TABLE `sym_entries_data_140` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_140` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_140` DISABLE KEYS */;

INSERT INTO `sym_entries_data_140` (`id`, `entry_id`, `relation_id`)
VALUES
	(1,13920,12945),
	(2,13921,12908),
	(3,13922,12945),
	(4,13923,12945),
	(5,13924,12945),
	(7,13925,12945),
	(15,13926,12945),
	(9,13927,12945),
	(16,13928,12945),
	(14,13932,118);

/*!40000 ALTER TABLE `sym_entries_data_140` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_141
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_141`;

CREATE TABLE `sym_entries_data_141` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_141` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_141` DISABLE KEYS */;

INSERT INTO `sym_entries_data_141` (`id`, `entry_id`, `relation_id`)
VALUES
	(1,13920,NULL),
	(2,13921,NULL),
	(3,13922,NULL),
	(4,13923,NULL),
	(5,13924,NULL),
	(7,13925,13920),
	(15,13926,13920),
	(9,13927,13920),
	(16,13928,13920),
	(14,13932,NULL);

/*!40000 ALTER TABLE `sym_entries_data_141` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_142
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_142`;

CREATE TABLE `sym_entries_data_142` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_143
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_143`;

CREATE TABLE `sym_entries_data_143` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_144
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_144`;

CREATE TABLE `sym_entries_data_144` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_145
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_145`;

CREATE TABLE `sym_entries_data_145` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_147
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_147`;

CREATE TABLE `sym_entries_data_147` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_148
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_148`;

CREATE TABLE `sym_entries_data_148` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_148` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_148` DISABLE KEYS */;

INSERT INTO `sym_entries_data_148` (`id`, `entry_id`, `relation_id`)
VALUES
	(15,13930,13926),
	(18,13933,13927),
	(28,13935,13924);

/*!40000 ALTER TABLE `sym_entries_data_148` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_149
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_149`;

CREATE TABLE `sym_entries_data_149` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_150
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_150`;

CREATE TABLE `sym_entries_data_150` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_150` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_150` DISABLE KEYS */;

INSERT INTO `sym_entries_data_150` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(96,13,NULL,'End of the Age Ministries exists to take the Gospel to the next generation. Learn more <a href=\"/\">about us</a>, get involved in our <a href=\"/\">events</a>, browser our <a href=\"/\">media</a>, or help <a href=\"/\">support our cause</a>.',NULL,'End of the Age Ministries exists to take the Gospel to the next generation. Learn more <a href=\"/\">about us</a>, get involved in our <a href=\"/\">events</a>, browser our <a href=\"/\">media</a>, or help <a href=\"/\">support our cause</a>.',31,'End of the Age Ministries exists to take the Gospel to the next generation. Learn more &lt;a href=&quot;/&quot;&gt;about us&lt;/a&gt;, get involved in our &lt;a href=&quot;/&quot;&gt;events&lt;/a&gt;, browser our &lt;a href=&quot;/&quot;&gt;media&lt;/a&gt;, or help &lt;a href=&quot;/&quot;&gt;support our cause&lt;/a&gt;.'),
	(85,13548,NULL,'(503) 123-1234',NULL,'(503) 123-1234',0,'(503) 123-1234'),
	(82,13559,NULL,'6:20 am',NULL,'6:20 am',1,'6:20 am'),
	(94,13562,NULL,'<div class=\"span2\">\r\n  <ul class=\"nav nav-list\">\r\n    <li class=\"nav-header first\"><a href=\"/13920/about/\">About</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13921/events/\">Events</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13922/media/\">Media</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13923/connect/\">Connect</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13924/donate/\">Donate</a></li><br />\r\n  </ul>\r\n</div>\r\n<div class=\"span3\">\r\n	<h4>Online Donation</h4>\r\n	<p>End of the Age is supported through the donation and generosity of those within the body of Christ.</p>\r\n	<p><a href=\"/13924/donate/\" class=\"give\">Donate →</a></p>\r\n</div>\r\n<div class=\"span3\">\r\n	<h4>End of the Age Ministries</h4>\r\n	<address>\r\n		<xsl:text>1234 SE 36th Ave.</xsl:text><br />\r\n		<xsl:text>Portland, Oregon 97201</xsl:text><br />\r\n		<abbr title=\"Phone\">P:</abbr><xsl:text> (555) 555-5555</xsl:text>\r\n	</address>\r\n	<h4>Contact</h4>\r\n	<p>\r\n		<a href=\"mailto:info@eota.com\">info@eota.com</a>\r\n	</p>\r\n</div>',NULL,'<div class=\"span2\">\r\n  <ul class=\"nav nav-list\">\r\n    <li class=\"nav-header first\"><a href=\"/13920/about/\">About</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13921/events/\">Events</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13922/media/\">Media</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13923/connect/\">Connect</a></li><br />\r\n    <li class=\"nav-header\"><a href=\"/13924/donate/\">Donate</a></li><br />\r\n  </ul>\r\n</div>\r\n<div class=\"span3\">\r\n	<h4>Online Donation</h4>\r\n	<p>End of the Age is supported through the donation and generosity of those within the body of Christ.</p>\r\n	<p><a href=\"/13924/donate/\" class=\"give\">Donate →</a></p>\r\n</div>\r\n<div class=\"span3\">\r\n	<h4>End of the Age Ministries</h4>\r\n	<address>\r\n		<xsl:text>1234 SE 36th Ave.</xsl:text><br />\r\n		<xsl:text>Portland, Oregon 97201</xsl:text><br />\r\n		<abbr title=\"Phone\">P:</abbr><xsl:text> (555) 555-5555</xsl:text>\r\n	</address>\r\n	<h4>Contact</h4>\r\n	<p>\r\n		<a href=\"mailto:info@eota.com\">info@eota.com</a>\r\n	</p>\r\n</div>',39,'&lt;div class=&quot;span2&quot;&gt;\r\n  &lt;ul class=&quot;nav nav-list&quot;&gt;\r\n    &lt;li class=&quot;nav-header first&quot;&gt;&lt;a href=&quot;/13920/about/&quot;&gt;About&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n    &lt;li class=&quot;nav-header&quot;&gt;&lt;a href=&quot;/13921/events/&quot;&gt;Events&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n    &lt;li class=&quot;nav-header&quot;&gt;&lt;a href=&quot;/13922/media/&quot;&gt;Media&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n    &lt;li class=&quot;nav-header&quot;&gt;&lt;a href=&quot;/13923/connect/&quot;&gt;Connect&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n    &lt;li class=&quot;nav-header&quot;&gt;&lt;a href=&quot;/13924/donate/&quot;&gt;Donate&lt;/a&gt;&lt;/li&gt;&lt;br /&gt;\r\n  &lt;/ul&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;span3&quot;&gt;\r\n	&lt;h4&gt;Online Donation&lt;/h4&gt;\r\n	&lt;p&gt;End of the Age is supported through the donation and generosity of those within the body of Christ.&lt;/p&gt;\r\n	&lt;p&gt;&lt;a href=&quot;/13924/donate/&quot; class=&quot;give&quot;&gt;Donate →&lt;/a&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;span3&quot;&gt;\r\n	&lt;h4&gt;End of the Age Ministries&lt;/h4&gt;\r\n	&lt;address&gt;\r\n		&lt;xsl:text&gt;1234 SE 36th Ave.&lt;/xsl:text&gt;&lt;br /&gt;\r\n		&lt;xsl:text&gt;Portland, Oregon 97201&lt;/xsl:text&gt;&lt;br /&gt;\r\n		&lt;abbr title=&quot;Phone&quot;&gt;P:&lt;/abbr&gt;&lt;xsl:text&gt; (555) 555-5555&lt;/xsl:text&gt;\r\n	&lt;/address&gt;\r\n	&lt;h4&gt;Contact&lt;/h4&gt;\r\n	&lt;p&gt;\r\n		&lt;a href=&quot;mailto:info@eota.com&quot;&gt;info@eota.com&lt;/a&gt;\r\n	&lt;/p&gt;\r\n&lt;/div&gt;'),
	(91,13660,NULL,'End of the Age Ministries',NULL,'End of the Age Ministries',5,'End of the Age Ministries'),
	(88,13661,NULL,'anchor, christian, fellowship, church, bible, portland, oregon, calvary chapel',NULL,'anchor, christian, fellowship, church, bible, portland, oregon, calvary chapel',9,'anchor, christian, fellowship, church, bible, portland, oregon, calvary chapel'),
	(126,13918,NULL,'<div class=\"welcome\">\r\n  <div class=\"container\">\r\n    <div class=\"row introduction\">\r\n      <div class=\"span12\">\r\n        <span class=\"intro big\">End of the Age Ministries exists to take the Gospel to the next generation. <a href=\"/\">Learn more about EOTA</a>, <a href=\"/\">get involved in events</a>, <a href=\"/\">browse our media</a>, or <a href=\"/\">support our cause</a>.</span>\r\n      </div>\r\n    </div>\r\n    <div class=\"row\">\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">About Jon Micah</a></h3>\r\n        <div class=\"center\">\r\n          <img data-responsimage=\"jonmicahbio_small-517af915d481c.jpg\" class=\"img-circle center\" width=\"200px\" height=\"200px\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n        </div>\r\n        <p>Jon Micah Sumrall is the lead singer of <a href=\"http://kutless.com/\">Kutless</a> and the visionary behind EOTA. He has a passion for sharing Christ with an upcoming generation.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">About EOTA</a></h3>\r\n        <div class=\"center\">\r\n          <span class=\"logo mask\">E</span>\r\n        </div>\r\n        <p>EOTA exists to fulfill the great commission by seeing disciples of Christ made through touring to plug a young generation in to local churches.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">Statement of Faith</a></h3>\r\n        <div class=\"center\">\r\n          <span class=\"icon mask\">b</span>\r\n        </div>\r\n        <p>What drives EOTA is a firm belief in the Scriptures and the Gospel of Jesus Christ which reveals the need of this world to be reconciled to King Jesus.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>',NULL,'<div class=\"welcome\">\r\n  <div class=\"container\">\r\n    <div class=\"row introduction\">\r\n      <div class=\"span12\">\r\n        <span class=\"intro big\">End of the Age Ministries exists to take the Gospel to the next generation. <a href=\"/\">Learn more about EOTA</a>, <a href=\"/\">get involved in events</a>, <a href=\"/\">browse our media</a>, or <a href=\"/\">support our cause</a>.</span>\r\n      </div>\r\n    </div>\r\n    <div class=\"row\">\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">About Jon Micah</a></h3>\r\n        <div class=\"center\">\r\n          <img data-responsimage=\"jonmicahbio_small-517af915d481c.jpg\" class=\"img-circle center\" width=\"200px\" height=\"200px\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n        </div>\r\n        <p>Jon Micah Sumrall is the lead singer of <a href=\"http://kutless.com/\">Kutless</a> and the visionary behind EOTA. He has a passion for sharing Christ with an upcoming generation.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">About EOTA</a></h3>\r\n        <div class=\"center\">\r\n          <span class=\"logo mask\">E</span>\r\n        </div>\r\n        <p>EOTA exists to fulfill the great commission by seeing disciples of Christ made through touring to plug a young generation in to local churches.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n      <div class=\"span4 info-box\">\r\n        <h3 class=\"center\"><a href=\"/\">Statement of Faith</a></h3>\r\n        <div class=\"center\">\r\n          <span class=\"icon mask\">b</span>\r\n        </div>\r\n        <p>What drives EOTA is a firm belief in the Scriptures and the Gospel of Jesus Christ which reveals the need of this world to be reconciled to King Jesus.</p>\r\n        <div class=\"center link-bar\">\r\n          <a href=\"/\" class=\"link link-small\">Read More</a>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>',123,'&lt;div class=&quot;welcome&quot;&gt;\r\n  &lt;div class=&quot;container&quot;&gt;\r\n    &lt;div class=&quot;row introduction&quot;&gt;\r\n      &lt;div class=&quot;span12&quot;&gt;\r\n        &lt;span class=&quot;intro big&quot;&gt;End of the Age Ministries exists to take the Gospel to the next generation. &lt;a href=&quot;/&quot;&gt;Learn more about EOTA&lt;/a&gt;, &lt;a href=&quot;/&quot;&gt;get involved in events&lt;/a&gt;, &lt;a href=&quot;/&quot;&gt;browse our media&lt;/a&gt;, or &lt;a href=&quot;/&quot;&gt;support our cause&lt;/a&gt;.&lt;/span&gt;\r\n      &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n      &lt;div class=&quot;span4 info-box&quot;&gt;\r\n        &lt;h3 class=&quot;center&quot;&gt;&lt;a href=&quot;/&quot;&gt;About Jon Micah&lt;/a&gt;&lt;/h3&gt;\r\n        &lt;div class=&quot;center&quot;&gt;\r\n          &lt;img data-responsimage=&quot;jonmicahbio_small-517af915d481c.jpg&quot; class=&quot;img-circle center&quot; width=&quot;200px&quot; height=&quot;200px&quot; data-responsimage-anchor=&quot;5&quot; src=&quot;/workspace/img/spacer.gif&quot; /&gt;\r\n        &lt;/div&gt;\r\n        &lt;p&gt;Jon Micah Sumrall is the lead singer of &lt;a href=&quot;http://kutless.com/&quot;&gt;Kutless&lt;/a&gt; and the visionary behind EOTA. He has a passion for sharing Christ with an upcoming generation.&lt;/p&gt;\r\n        &lt;div class=&quot;center link-bar&quot;&gt;\r\n          &lt;a href=&quot;/&quot; class=&quot;link link-small&quot;&gt;Read More&lt;/a&gt;\r\n        &lt;/div&gt;\r\n      &lt;/div&gt;\r\n      &lt;div class=&quot;span4 info-box&quot;&gt;\r\n        &lt;h3 class=&quot;center&quot;&gt;&lt;a href=&quot;/&quot;&gt;About EOTA&lt;/a&gt;&lt;/h3&gt;\r\n        &lt;div class=&quot;center&quot;&gt;\r\n          &lt;span class=&quot;logo mask&quot;&gt;E&lt;/span&gt;\r\n        &lt;/div&gt;\r\n        &lt;p&gt;EOTA exists to fulfill the great commission by seeing disciples of Christ made through touring to plug a young generation in to local churches.&lt;/p&gt;\r\n        &lt;div class=&quot;center link-bar&quot;&gt;\r\n          &lt;a href=&quot;/&quot; class=&quot;link link-small&quot;&gt;Read More&lt;/a&gt;\r\n        &lt;/div&gt;\r\n      &lt;/div&gt;\r\n      &lt;div class=&quot;span4 info-box&quot;&gt;\r\n        &lt;h3 class=&quot;center&quot;&gt;&lt;a href=&quot;/&quot;&gt;Statement of Faith&lt;/a&gt;&lt;/h3&gt;\r\n        &lt;div class=&quot;center&quot;&gt;\r\n          &lt;span class=&quot;icon mask&quot;&gt;b&lt;/span&gt;\r\n        &lt;/div&gt;\r\n        &lt;p&gt;What drives EOTA is a firm belief in the Scriptures and the Gospel of Jesus Christ which reveals the need of this world to be reconciled to King Jesus.&lt;/p&gt;\r\n        &lt;div class=&quot;center link-bar&quot;&gt;\r\n          &lt;a href=&quot;/&quot; class=&quot;link link-small&quot;&gt;Read More&lt;/a&gt;\r\n        &lt;/div&gt;\r\n      &lt;/div&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;'),
	(60,13919,NULL,'http://itunes.apple.com/us/podcast/athey-creek-audio-podcast/id544753805?mt=2',NULL,'http://itunes.apple.com/us/podcast/athey-creek-audio-podcast/id544753805?mt=2',2,'http://itunes.apple.com/us/podcast/athey-creek-audio-podcast/id544753805?mt=2'),
	(95,13547,NULL,'info@eota.com',NULL,'info@eota.com',1,'info@eota.com');

/*!40000 ALTER TABLE `sym_entries_data_150` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_151
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_151`;

CREATE TABLE `sym_entries_data_151` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_152
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_152`;

CREATE TABLE `sym_entries_data_152` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_154
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_154`;

CREATE TABLE `sym_entries_data_154` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_167
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_167`;

CREATE TABLE `sym_entries_data_167` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_167` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_167` DISABLE KEYS */;

INSERT INTO `sym_entries_data_167` (`id`, `entry_id`, `value`)
VALUES
	(1,13920,'no'),
	(2,13921,'no'),
	(3,13922,'no'),
	(4,13923,'no'),
	(5,13924,'no'),
	(7,13925,'no'),
	(15,13926,'no'),
	(9,13927,'no'),
	(16,13928,'no'),
	(14,13932,'yes');

/*!40000 ALTER TABLE `sym_entries_data_167` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_168
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_168`;

CREATE TABLE `sym_entries_data_168` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_168` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_168` DISABLE KEYS */;

INSERT INTO `sym_entries_data_168` (`id`, `entry_id`, `value`)
VALUES
	(1,13920,'no'),
	(2,13921,'no'),
	(3,13922,'no'),
	(4,13923,'no'),
	(5,13924,'no'),
	(7,13925,'no'),
	(15,13926,'no'),
	(9,13927,'no'),
	(16,13928,'no'),
	(14,13932,'yes');

/*!40000 ALTER TABLE `sym_entries_data_168` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_169
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_169`;

CREATE TABLE `sym_entries_data_169` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_170
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_170`;

CREATE TABLE `sym_entries_data_170` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_171
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_171`;

CREATE TABLE `sym_entries_data_171` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_172
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_172`;

CREATE TABLE `sym_entries_data_172` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_173
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_173`;

CREATE TABLE `sym_entries_data_173` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_174
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_174`;

CREATE TABLE `sym_entries_data_174` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_175
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_175`;

CREATE TABLE `sym_entries_data_175` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_176
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_176`;

CREATE TABLE `sym_entries_data_176` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_177
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_177`;

CREATE TABLE `sym_entries_data_177` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_179
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_179`;

CREATE TABLE `sym_entries_data_179` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_181
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_181`;

CREATE TABLE `sym_entries_data_181` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_182
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_182`;

CREATE TABLE `sym_entries_data_182` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_183
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_183`;

CREATE TABLE `sym_entries_data_183` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_184
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_184`;

CREATE TABLE `sym_entries_data_184` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_185
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_185`;

CREATE TABLE `sym_entries_data_185` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_186
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_186`;

CREATE TABLE `sym_entries_data_186` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_187
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_187`;

CREATE TABLE `sym_entries_data_187` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_188
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_188`;

CREATE TABLE `sym_entries_data_188` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_189
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_189`;

CREATE TABLE `sym_entries_data_189` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_19`;

CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` text,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_19` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_19` DISABLE KEYS */;

INSERT INTO `sym_entries_data_19` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,13920,'about','About','about','About','1','About'),
	(2,13921,'events','Events','events','Events','1','Events'),
	(3,13922,'media','Media','media','Media','1','Media'),
	(4,13923,'connect','Connect','connect','Connect','1','Connect'),
	(5,13924,'donate','Donate','donate','Donate','1','Donate'),
	(7,13925,'about-jon-micah','About Jon Micah','about-jon-micah','About Jon Micah','3','About Jon Micah'),
	(15,13926,'who-we-are','Who We Are','who-we-are','Who We Are','3','Who We Are'),
	(9,13927,'why-we-exist','Why We Exist','why-we-exist','Why We Exist','3','Why We Exist'),
	(16,13928,'what-we-believe','What We Believe','what-we-believe','What We Believe','3','What We Believe'),
	(14,13932,'home','Home','home','Home','1','Home');

/*!40000 ALTER TABLE `sym_entries_data_19` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_190
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_190`;

CREATE TABLE `sym_entries_data_190` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_191
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_191`;

CREATE TABLE `sym_entries_data_191` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_192
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_192`;

CREATE TABLE `sym_entries_data_192` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_194
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_194`;

CREATE TABLE `sym_entries_data_194` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_195
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_195`;

CREATE TABLE `sym_entries_data_195` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_196
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_196`;

CREATE TABLE `sym_entries_data_196` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_197
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_197`;

CREATE TABLE `sym_entries_data_197` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_198
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_198`;

CREATE TABLE `sym_entries_data_198` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_199
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_199`;

CREATE TABLE `sym_entries_data_199` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_199` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_199` DISABLE KEYS */;

INSERT INTO `sym_entries_data_199` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(204116,13355,'ustream-status','ustream-status');

/*!40000 ALTER TABLE `sym_entries_data_199` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_2`;

CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_200
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_200`;

CREATE TABLE `sym_entries_data_200` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_200` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_200` DISABLE KEYS */;

INSERT INTO `sym_entries_data_200` (`id`, `entry_id`, `value`, `value_formatted`)
VALUES
	(204121,13355,'offline',NULL);

/*!40000 ALTER TABLE `sym_entries_data_200` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_201
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_201`;

CREATE TABLE `sym_entries_data_201` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_201` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_201` DISABLE KEYS */;

INSERT INTO `sym_entries_data_201` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(15,13930,'about-eota','About EOTA'),
	(18,13933,'why-we-exist','Why We Exist'),
	(28,13935,'donate','Donate');

/*!40000 ALTER TABLE `sym_entries_data_201` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_202
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_202`;

CREATE TABLE `sym_entries_data_202` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_203
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_203`;

CREATE TABLE `sym_entries_data_203` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_204
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_204`;

CREATE TABLE `sym_entries_data_204` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_205
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_205`;

CREATE TABLE `sym_entries_data_205` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_206
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_206`;

CREATE TABLE `sym_entries_data_206` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_207
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_207`;

CREATE TABLE `sym_entries_data_207` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_207` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_207` DISABLE KEYS */;

INSERT INTO `sym_entries_data_207` (`id`, `entry_id`, `value`)
VALUES
	(3,13929,'no'),
	(8,13931,'no');

/*!40000 ALTER TABLE `sym_entries_data_207` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_208
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_208`;

CREATE TABLE `sym_entries_data_208` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_209
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_209`;

CREATE TABLE `sym_entries_data_209` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_209` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_209` DISABLE KEYS */;

INSERT INTO `sym_entries_data_209` (`id`, `entry_id`, `value`)
VALUES
	(15,13930,'no'),
	(18,13933,'no'),
	(28,13935,'no');

/*!40000 ALTER TABLE `sym_entries_data_209` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_21
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_21`;

CREATE TABLE `sym_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_21` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_21` DISABLE KEYS */;

INSERT INTO `sym_entries_data_21` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,13920,'about','About','about','About',1,'About'),
	(2,13921,'events','Events','events','Events',1,'Events'),
	(3,13922,'media','Media','media','Media',1,'Media'),
	(4,13923,'connect','Connect','connect','Connect',1,'Connect'),
	(5,13924,'donate','Donate','donate','Donate',1,'Donate'),
	(7,13925,'about-jon-micah','About Jon Micah','about-jon-micah','About Jon Micah',3,'About Jon Micah'),
	(15,13926,'who-we-are','Who We Are','who-we-are','Who We Are',3,'Who We Are'),
	(9,13927,'why-we-exist','Why We Exist','why-we-exist','Why We Exist',3,'Why We Exist'),
	(16,13928,'what-we-believe','What We Believe','what-we-believe','What We Believe',3,'What We Believe'),
	(14,13932,'home','home','home','home',1,'home');

/*!40000 ALTER TABLE `sym_entries_data_21` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_210
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_210`;

CREATE TABLE `sym_entries_data_210` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_211
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_211`;

CREATE TABLE `sym_entries_data_211` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_212
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_212`;

CREATE TABLE `sym_entries_data_212` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_213
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_213`;

CREATE TABLE `sym_entries_data_213` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_214
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_214`;

CREATE TABLE `sym_entries_data_214` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_215
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_215`;

CREATE TABLE `sym_entries_data_215` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_216
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_216`;

CREATE TABLE `sym_entries_data_216` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_217
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_217`;

CREATE TABLE `sym_entries_data_217` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_218
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_218`;

CREATE TABLE `sym_entries_data_218` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_219
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_219`;

CREATE TABLE `sym_entries_data_219` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_220
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_220`;

CREATE TABLE `sym_entries_data_220` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_221
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_221`;

CREATE TABLE `sym_entries_data_221` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_222
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_222`;

CREATE TABLE `sym_entries_data_222` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_222` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_222` DISABLE KEYS */;

INSERT INTO `sym_entries_data_222` (`id`, `entry_id`, `value`)
VALUES
	(2,12976,'no'),
	(3,12945,'no'),
	(4,118,'no'),
	(24,13669,'no'),
	(6,13529,'no'),
	(41,12908,'no'),
	(39,13568,'no'),
	(10,119,'no'),
	(23,13592,'no'),
	(36,13600,'no'),
	(29,117,'no');

/*!40000 ALTER TABLE `sym_entries_data_222` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_223
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_223`;

CREATE TABLE `sym_entries_data_223` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_223` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_223` DISABLE KEYS */;

INSERT INTO `sym_entries_data_223` (`id`, `entry_id`, `value`)
VALUES
	(1,112,'no'),
	(2,13528,'no'),
	(3,13577,'no');

/*!40000 ALTER TABLE `sym_entries_data_223` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_224
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_224`;

CREATE TABLE `sym_entries_data_224` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_224` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_224` DISABLE KEYS */;

INSERT INTO `sym_entries_data_224` (`id`, `entry_id`, `value`)
VALUES
	(91,13547,'no'),
	(81,13548,'no'),
	(78,13559,'no'),
	(90,13562,'no'),
	(92,13,'no'),
	(87,13660,'no'),
	(84,13661,'no'),
	(122,13918,'no'),
	(56,13919,'no');

/*!40000 ALTER TABLE `sym_entries_data_224` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_225
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_225`;

CREATE TABLE `sym_entries_data_225` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_225` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_225` DISABLE KEYS */;

INSERT INTO `sym_entries_data_225` (`id`, `entry_id`, `value`)
VALUES
	(8,13355,'no');

/*!40000 ALTER TABLE `sym_entries_data_225` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_226
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_226`;

CREATE TABLE `sym_entries_data_226` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_226` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_226` DISABLE KEYS */;

INSERT INTO `sym_entries_data_226` (`id`, `entry_id`, `value`)
VALUES
	(3,13929,'yes'),
	(8,13931,'yes');

/*!40000 ALTER TABLE `sym_entries_data_226` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_227
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_227`;

CREATE TABLE `sym_entries_data_227` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_229
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_229`;

CREATE TABLE `sym_entries_data_229` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_23`;

CREATE TABLE `sym_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_23` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_23` DISABLE KEYS */;

INSERT INTO `sym_entries_data_23` (`id`, `entry_id`, `value`)
VALUES
	(1,13920,1),
	(2,13921,6),
	(3,13922,7),
	(4,13923,8),
	(5,13924,9),
	(7,13925,2),
	(15,13926,3),
	(9,13927,4),
	(16,13928,5),
	(14,13932,10);

/*!40000 ALTER TABLE `sym_entries_data_23` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_230
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_230`;

CREATE TABLE `sym_entries_data_230` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_231
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_231`;

CREATE TABLE `sym_entries_data_231` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_232
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_232`;

CREATE TABLE `sym_entries_data_232` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_233
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_233`;

CREATE TABLE `sym_entries_data_233` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_234
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_234`;

CREATE TABLE `sym_entries_data_234` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_235
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_235`;

CREATE TABLE `sym_entries_data_235` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_236
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_236`;

CREATE TABLE `sym_entries_data_236` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_238
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_238`;

CREATE TABLE `sym_entries_data_238` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_24
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_24`;

CREATE TABLE `sym_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_240
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_240`;

CREATE TABLE `sym_entries_data_240` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_241
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_241`;

CREATE TABLE `sym_entries_data_241` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_242
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_242`;

CREATE TABLE `sym_entries_data_242` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_243
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_243`;

CREATE TABLE `sym_entries_data_243` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_244
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_244`;

CREATE TABLE `sym_entries_data_244` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_245
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_245`;

CREATE TABLE `sym_entries_data_245` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_246
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_246`;

CREATE TABLE `sym_entries_data_246` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_247
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_247`;

CREATE TABLE `sym_entries_data_247` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_249
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_249`;

CREATE TABLE `sym_entries_data_249` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_250
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_250`;

CREATE TABLE `sym_entries_data_250` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_251
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_251`;

CREATE TABLE `sym_entries_data_251` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_253
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_253`;

CREATE TABLE `sym_entries_data_253` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_254
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_254`;

CREATE TABLE `sym_entries_data_254` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_255
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_255`;

CREATE TABLE `sym_entries_data_255` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_256
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_256`;

CREATE TABLE `sym_entries_data_256` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_257
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_257`;

CREATE TABLE `sym_entries_data_257` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_258
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_258`;

CREATE TABLE `sym_entries_data_258` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_26
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_26`;

CREATE TABLE `sym_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_260
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_260`;

CREATE TABLE `sym_entries_data_260` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_261
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_261`;

CREATE TABLE `sym_entries_data_261` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_262
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_262`;

CREATE TABLE `sym_entries_data_262` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_263
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_263`;

CREATE TABLE `sym_entries_data_263` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_264
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_264`;

CREATE TABLE `sym_entries_data_264` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_27
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_27`;

CREATE TABLE `sym_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_28
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_28`;

CREATE TABLE `sym_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_29
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_29`;

CREATE TABLE `sym_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_30
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_30`;

CREATE TABLE `sym_entries_data_30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_31
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_31`;

CREATE TABLE `sym_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_32
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_32`;

CREATE TABLE `sym_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_33
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_33`;

CREATE TABLE `sym_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_34
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_34`;

CREATE TABLE `sym_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_35
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_35`;

CREATE TABLE `sym_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_4`;

CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_40
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_40`;

CREATE TABLE `sym_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_40` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_40` DISABLE KEYS */;

INSERT INTO `sym_entries_data_40` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(15,13930,NULL,'<img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n<div class=\"spacer\" style=\"height:400px;\"> </div>\r\n\r\n# WHAT IS EOTA?\r\n\r\n<div class=\"component component-verses\"><div class=\"entry clearfix even middle\"><div class=\"row\"><div class=\"span6 offset3\"><blockquote><span>“And Jesus came and spoke to them, saying, “All authority has been given to Me in heaven and on earth. Go therefore and make disciples of all the nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all things that I have commanded you; and lo, I am with you always, even to the end of the age.” Amen.”</span><cite>Matthew 28:18-20<a href=\"http://eota/symphony/publish/verses/edit/13934/\" target=\"_blank\" class=\"edit \"><span class=\"icon\">p</span></a></cite></blockquote></div></div></div></div>\r\n\r\n<span class=\"intro\">End of The Age ministries is an evangelical organization committed to sharing the Gospel of Jesus Christ in response to the “Great Commission” outlined in the Bible at the end of Matthew 28.</span>\r\n\r\n## Our Goal\r\n\r\nIt is our goal to evangelize to an increasingly non- Christian generation and to connect these new believers with Biblical teaching and local church organizations to help them grow in their newfound faith.\r\n\r\n## Our Experience\r\n\r\nWith over a decade of event planning and touring experience, the EOTA Ministries staff have the unique ability to reach the next generation with effectiveness and efficiency through our evangelistic touring format and our use of modern communication technology.\r\n\r\n## Our Team\r\n\r\nEOTA Ministries was incorporated by Jon Micah Sumrall in 2012, and is a non profit, 501c3 organization. Our current office is located in Portland, OR.\r\n\r\n',NULL,'<img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n<div class=\"spacer\" style=\"height:400px;\"> </div>\r\n\r\n# WHAT IS EOTA?\r\n\r\n<div class=\"component component-verses\"><div class=\"entry clearfix even middle\"><div class=\"row\"><div class=\"span6 offset3\"><blockquote><span>“And Jesus came and spoke to them, saying, “All authority has been given to Me in heaven and on earth. Go therefore and make disciples of all the nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all things that I have commanded you; and lo, I am with you always, even to the end of the age.” Amen.”</span><cite>Matthew 28:18-20<a href=\"http://eota/symphony/publish/verses/edit/13934/\" target=\"_blank\" class=\"edit \"><span class=\"icon\">p</span></a></cite></blockquote></div></div></div></div>\r\n\r\n<span class=\"intro\">End of The Age ministries is an evangelical organization committed to sharing the Gospel of Jesus Christ in response to the “Great Commission” outlined in the Bible at the end of Matthew 28.</span>\r\n\r\n## Our Goal\r\n\r\nIt is our goal to evangelize to an increasingly non- Christian generation and to connect these new believers with Biblical teaching and local church organizations to help them grow in their newfound faith.\r\n\r\n## Our Experience\r\n\r\nWith over a decade of event planning and touring experience, the EOTA Ministries staff have the unique ability to reach the next generation with effectiveness and efficiency through our evangelistic touring format and our use of modern communication technology.\r\n\r\n## Our Team\r\n\r\nEOTA Ministries was incorporated by Jon Micah Sumrall in 2012, and is a non profit, 501c3 organization. Our current office is located in Portland, OR.\r\n\r\n',210,'<p><img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" /></p>\n\n<div class=\"spacer\" style=\"height:400px;\"> </div>\n\n<h1>WHAT IS EOTA?</h1>\n\n<div class=\"component component-verses\"><div class=\"entry clearfix even middle\"><div class=\"row\"><div class=\"span6 offset3\"><blockquote><span>“And Jesus came and spoke to them, saying, “All authority has been given to Me in heaven and on earth. Go therefore and make disciples of all the nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all things that I have commanded you; and lo, I am with you always, even to the end of the age.” Amen.”</span><cite>Matthew 28:18-20<a href=\"http://eota/symphony/publish/verses/edit/13934/\" target=\"_blank\" class=\"edit \"><span class=\"icon\">p</span></a></cite></blockquote></div></div></div></div>\n\n<p><span class=\"intro\">End of The Age ministries is an evangelical organization committed to sharing the Gospel of Jesus Christ in response to the “Great Commission” outlined in the Bible at the end of Matthew 28.</span></p>\n\n<h2>Our Goal</h2>\n\n<p>It is our goal to evangelize to an increasingly non- Christian generation and to connect these new believers with Biblical teaching and local church organizations to help them grow in their newfound faith.</p>\n\n<h2>Our Experience</h2>\n\n<p>With over a decade of event planning and touring experience, the EOTA Ministries staff have the unique ability to reach the next generation with effectiveness and efficiency through our evangelistic touring format and our use of modern communication technology.</p>\n\n<h2>Our Team</h2>\n\n<p>EOTA Ministries was incorporated by Jon Micah Sumrall in 2012, and is a non profit, 501c3 organization. Our current office is located in Portland, OR.</p>\n'),
	(18,13933,NULL,'<img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n<div class=\"spacer\" style=\"height:400px;\"> </div>\r\n\r\n# Why Does EOTA Exist?\r\n\r\n<span class=\"intro\">It is imperative that we spread the gospel to this generation and find ways to help them create a firm biblical foundation.</span>\r\n\r\n## The Statistics\r\n\r\nStatistics are showing a clear decline of Evangelical Christianity in the United States while we are simultaneously seeing the secularization of the church:\r\n\r\n- 53% of U.S. leaders said the state of Evangelicalism is worse than it was five years ago, and 48 percent said they expect it to grow worse in the next five years.\r\n- “The un-churched population in the United States is so extensive that, were it a nation, it would be the fifth-largest on the planet... Researchers and analysts describe North America as the world’s third-largest mission field.” [CITATION NEEDED]\r\n- Only 33% of mainline churchgoers agree that there are absolute standards for what is right and wrong\r\n- Only 36% of Evangelical Church goers believe that their religion is the one, true faith leading to eternal life while 57% believed many religions can lead to everlasting life.\r\n- 65% of 18-30 year olds who have previously attended church regularly leave the church\r\n\r\n## The Need\r\n\r\nIt is apparent that the need for true evangelism along with Biblical values and worldview are increasingly needed in our country. We believe right NOW is a critical time. The consequences of not reaching the next generation with the absolute truth of the gospel will be dire.  Jesus said in John 14:6 “I am the way, the truth, and the life. No one comes to the father except through me.” This is the message that needs to be shared to heal this next generation and reverse the course of moral pragmatism that has become prevalent in our culture.\r\n\r\n## The Scope\r\n\r\nWe plan to organize outreach events initially across the United States and eventually, Lord willing, follow the calling of the “Great Commission” in Matthew 28 to share the Gospel with as many nations as possible around the globe. Our initial scope begins within the United States because we see not only a great need for evangelism and revival in this country, but also a great opportunity. The infrastructure necessary to host large scale events coupled with the modern technology and networking we enjoy in this country allow us to have the potential to reach an extremely large audience across a large geographic area.\r\n\r\nWe intend for these events to be held free of charge. A partnership with local churches in each city will be vital to effectively producing these events. We will rely upon them to help promote the event to their community, aid in raising funds to make the events possible, provide counselors at the event, and follow-up with new believers.\r\n\r\nThe founders of EOTA Ministries have over 10 years of professional touring experience with the band Kutless and have been a part of numerous large festivals, crusades, fairs, conferences, tours, and events. We believe this experience will enable us to produce successful, professional, and effective events that can have an impact on the lives of thousands.',NULL,'<img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" />\r\n<div class=\"spacer\" style=\"height:400px;\"> </div>\r\n\r\n# Why Does EOTA Exist?\r\n\r\n<span class=\"intro\">It is imperative that we spread the gospel to this generation and find ways to help them create a firm biblical foundation.</span>\r\n\r\n## The Statistics\r\n\r\nStatistics are showing a clear decline of Evangelical Christianity in the United States while we are simultaneously seeing the secularization of the church:\r\n\r\n- 53% of U.S. leaders said the state of Evangelicalism is worse than it was five years ago, and 48 percent said they expect it to grow worse in the next five years.\r\n- “The un-churched population in the United States is so extensive that, were it a nation, it would be the fifth-largest on the planet... Researchers and analysts describe North America as the world’s third-largest mission field.” [CITATION NEEDED]\r\n- Only 33% of mainline churchgoers agree that there are absolute standards for what is right and wrong\r\n- Only 36% of Evangelical Church goers believe that their religion is the one, true faith leading to eternal life while 57% believed many religions can lead to everlasting life.\r\n- 65% of 18-30 year olds who have previously attended church regularly leave the church\r\n\r\n## The Need\r\n\r\nIt is apparent that the need for true evangelism along with Biblical values and worldview are increasingly needed in our country. We believe right NOW is a critical time. The consequences of not reaching the next generation with the absolute truth of the gospel will be dire.  Jesus said in John 14:6 “I am the way, the truth, and the life. No one comes to the father except through me.” This is the message that needs to be shared to heal this next generation and reverse the course of moral pragmatism that has become prevalent in our culture.\r\n\r\n## The Scope\r\n\r\nWe plan to organize outreach events initially across the United States and eventually, Lord willing, follow the calling of the “Great Commission” in Matthew 28 to share the Gospel with as many nations as possible around the globe. Our initial scope begins within the United States because we see not only a great need for evangelism and revival in this country, but also a great opportunity. The infrastructure necessary to host large scale events coupled with the modern technology and networking we enjoy in this country allow us to have the potential to reach an extremely large audience across a large geographic area.\r\n\r\nWe intend for these events to be held free of charge. A partnership with local churches in each city will be vital to effectively producing these events. We will rely upon them to help promote the event to their community, aid in raising funds to make the events possible, provide counselors at the event, and follow-up with new believers.\r\n\r\nThe founders of EOTA Ministries have over 10 years of professional touring experience with the band Kutless and have been a part of numerous large festivals, crusades, fairs, conferences, tours, and events. We believe this experience will enable us to produce successful, professional, and effective events that can have an impact on the lives of thousands.',490,'<p><img data-responsimage=\"jonmicah_singing-517b06e16e8cf.jpg\" style=\"position:absolute;left:0;width:100%;height:400px;\" data-responsimage-anchor=\"5\" src=\"/workspace/img/spacer.gif\" /></p>\n\n<div class=\"spacer\" style=\"height:400px;\"> </div>\n\n<h1>Why Does EOTA Exist?</h1>\n\n<p><span class=\"intro\">It is imperative that we spread the gospel to this generation and find ways to help them create a firm biblical foundation.</span></p>\n\n<h2>The Statistics</h2>\n\n<p>Statistics are showing a clear decline of Evangelical Christianity in the United States while we are simultaneously seeing the secularization of the church:</p>\n\n<ul>\n<li>53% of U.S. leaders said the state of Evangelicalism is worse than it was five years ago, and 48 percent said they expect it to grow worse in the next five years.</li>\n<li>“The un-churched population in the United States is so extensive that, were it a nation, it would be the fifth-largest on the planet&#8230; Researchers and analysts describe North America as the world’s third-largest mission field.” [CITATION NEEDED]</li>\n<li>Only 33% of mainline churchgoers agree that there are absolute standards for what is right and wrong</li>\n<li>Only 36% of Evangelical Church goers believe that their religion is the one, true faith leading to eternal life while 57% believed many religions can lead to everlasting life.</li>\n<li>65% of 18-30 year olds who have previously attended church regularly leave the church</li>\n</ul>\n\n<h2>The Need</h2>\n\n<p>It is apparent that the need for true evangelism along with Biblical values and worldview are increasingly needed in our country. We believe right NOW is a critical time. The consequences of not reaching the next generation with the absolute truth of the gospel will be dire.  Jesus said in John 14:6 “I am the way, the truth, and the life. No one comes to the father except through me.” This is the message that needs to be shared to heal this next generation and reverse the course of moral pragmatism that has become prevalent in our culture.</p>\n\n<h2>The Scope</h2>\n\n<p>We plan to organize outreach events initially across the United States and eventually, Lord willing, follow the calling of the “Great Commission” in Matthew 28 to share the Gospel with as many nations as possible around the globe. Our initial scope begins within the United States because we see not only a great need for evangelism and revival in this country, but also a great opportunity. The infrastructure necessary to host large scale events coupled with the modern technology and networking we enjoy in this country allow us to have the potential to reach an extremely large audience across a large geographic area.</p>\n\n<p>We intend for these events to be held free of charge. A partnership with local churches in each city will be vital to effectively producing these events. We will rely upon them to help promote the event to their community, aid in raising funds to make the events possible, provide counselors at the event, and follow-up with new believers.</p>\n\n<p>The founders of EOTA Ministries have over 10 years of professional touring experience with the band Kutless and have been a part of numerous large festivals, crusades, fairs, conferences, tours, and events. We believe this experience will enable us to produce successful, professional, and effective events that can have an impact on the lives of thousands.</p>\n'),
	(28,13935,NULL,'# Help Support Our Cause\r\n\r\n<script src=\"https://checkout.stripe.com/v2/checkout.js\"></script>\r\n\r\n<a id=\"Button50\" class=\"link link-small\">Donate $50</a>',NULL,'# Help Support Our Cause\r\n\r\n<script src=\"https://checkout.stripe.com/v2/checkout.js\"></script>\r\n\r\n<a id=\"Button50\" class=\"link link-small\">Donate $50</a>',5,'<h1>Help Support Our Cause</h1>\n\n<script src=\"https://checkout.stripe.com/v2/checkout.js\"></script>\n\n<p><a id=\"Button50\" class=\"link link-small\">Donate $50</a></p>\n');

/*!40000 ALTER TABLE `sym_entries_data_40` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_43
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_43`;

CREATE TABLE `sym_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_43` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_43` DISABLE KEYS */;

INSERT INTO `sym_entries_data_43` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`)
VALUES
	(3,13929,'/uploads/images/leaderboards/jonmicahbio_small-517af915d481c.jpg',217857,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2013-04-26T15:00:53-07:00\";s:5:\"width\";i:434;s:6:\"height\";i:434;}'),
	(8,13931,'/uploads/images/leaderboards/jonmicah_singing-517b06e16e8cf.jpg',4092865,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2013-04-26T15:59:45-07:00\";s:5:\"width\";i:5184;s:6:\"height\";i:2912;}');

/*!40000 ALTER TABLE `sym_entries_data_43` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_45
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_45`;

CREATE TABLE `sym_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_45` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_45` DISABLE KEYS */;

INSERT INTO `sym_entries_data_45` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(3,13929,NULL,NULL),
	(8,13931,NULL,NULL);

/*!40000 ALTER TABLE `sym_entries_data_45` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_46
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_46`;

CREATE TABLE `sym_entries_data_46` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_46` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_46` DISABLE KEYS */;

INSERT INTO `sym_entries_data_46` (`id`, `entry_id`, `value`)
VALUES
	(3,13929,13929),
	(8,13931,13931);

/*!40000 ALTER TABLE `sym_entries_data_46` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_47
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_47`;

CREATE TABLE `sym_entries_data_47` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_47` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_47` DISABLE KEYS */;

INSERT INTO `sym_entries_data_47` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(5,13931,'400','400');

/*!40000 ALTER TABLE `sym_entries_data_47` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_5`;

CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_50
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_50`;

CREATE TABLE `sym_entries_data_50` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_52
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_52`;

CREATE TABLE `sym_entries_data_52` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_53
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_53`;

CREATE TABLE `sym_entries_data_53` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_54
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_54`;

CREATE TABLE `sym_entries_data_54` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_56
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_56`;

CREATE TABLE `sym_entries_data_56` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_57
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_57`;

CREATE TABLE `sym_entries_data_57` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_57` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_57` DISABLE KEYS */;

INSERT INTO `sym_entries_data_57` (`id`, `entry_id`, `value`)
VALUES
	(1,13920,'no'),
	(2,13921,'no'),
	(3,13922,'no'),
	(4,13923,'no'),
	(5,13924,'no'),
	(7,13925,'no'),
	(15,13926,'no'),
	(9,13927,'no'),
	(16,13928,'no'),
	(14,13932,'no');

/*!40000 ALTER TABLE `sym_entries_data_57` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_58
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_58`;

CREATE TABLE `sym_entries_data_58` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_59
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_59`;

CREATE TABLE `sym_entries_data_59` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_59` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_59` DISABLE KEYS */;

INSERT INTO `sym_entries_data_59` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(3,13929,NULL,'Jon Micah Bio',NULL,'Jon Micah Bio',3,'<p>Jon Micah Bio</p>\n'),
	(8,13931,NULL,'Jon Micah Singing',NULL,'Jon Micah Singing',3,'<p>Jon Micah Singing</p>\n');

/*!40000 ALTER TABLE `sym_entries_data_59` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_6`;

CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `recovery-code` varchar(40) DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `reset` enum('yes','no') DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_7`;

CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_71
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_71`;

CREATE TABLE `sym_entries_data_71` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_72
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_72`;

CREATE TABLE `sym_entries_data_72` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_73
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_73`;

CREATE TABLE `sym_entries_data_73` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_73` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_73` DISABLE KEYS */;

INSERT INTO `sym_entries_data_73` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(65,117,'ministry','Ministry','ministry','Ministry',1,'Ministry'),
	(40,118,'home','Home','home','Home',1,'Home'),
	(46,119,'default','Default','default','Default',1,'Default'),
	(14,12496,'live','Live','live','Live',1,'Live'),
	(77,12908,'events','Events','events','Events',1,'Events'),
	(39,12945,'full-width','Full Width','full-width','Full Width',2,'Full Width'),
	(26,12971,'staff','Staff','staff','Staff',1,'Staff'),
	(38,12976,'the-good-news','The Good News','the-good-news','The Good News',3,'The Good News'),
	(29,13078,'teachings','Teachings','teachings','Teachings',1,'Teachings'),
	(35,13358,'nav-page','Nav Page','nav-page','Nav Page',2,'Nav Page'),
	(60,13669,'text-only','Text only','text-only','Text only',2,'Text only'),
	(42,13529,'search','Search','search','Search',1,'Search'),
	(75,13568,'missions','Missions','missions','Missions',1,'Missions'),
	(59,13592,'meetings','Meetings','meetings','Meetings',1,'Meetings'),
	(72,13600,'home-group','Home Group','home-group','Home Group',2,'Home Group');

/*!40000 ALTER TABLE `sym_entries_data_73` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_74
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_74`;

CREATE TABLE `sym_entries_data_74` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_74` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_74` DISABLE KEYS */;

INSERT INTO `sym_entries_data_74` (`id`, `entry_id`, `relation_id`)
VALUES
	(122,117,111),
	(121,117,107),
	(69,118,111),
	(68,118,107),
	(82,119,111),
	(81,119,107),
	(24,12496,12495),
	(111,13592,111),
	(67,12945,108),
	(66,12945,111),
	(65,12945,107),
	(42,12971,12975),
	(41,12971,111),
	(43,12971,112),
	(63,12976,12975),
	(46,13078,13077),
	(112,13669,108),
	(57,13358,108),
	(56,13358,107),
	(62,12976,111),
	(64,12976,108),
	(70,118,108),
	(75,13529,13528),
	(138,13568,111),
	(137,13568,107),
	(110,13592,107),
	(132,13600,112),
	(131,13600,111),
	(130,13600,107),
	(142,12908,109);

/*!40000 ALTER TABLE `sym_entries_data_74` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_75
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_75`;

CREATE TABLE `sym_entries_data_75` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_75` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_75` DISABLE KEYS */;

INSERT INTO `sym_entries_data_75` (`id`, `entry_id`, `relation_id`)
VALUES
	(65,117,108),
	(37,118,NULL),
	(43,119,108),
	(77,12908,NULL),
	(36,12945,NULL),
	(23,12971,NULL),
	(35,12976,NULL),
	(26,13078,NULL),
	(32,13358,NULL),
	(39,13529,NULL),
	(75,13568,108),
	(59,13592,108),
	(60,13669,NULL),
	(72,13600,108);

/*!40000 ALTER TABLE `sym_entries_data_75` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_76
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_76`;

CREATE TABLE `sym_entries_data_76` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_76` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_76` DISABLE KEYS */;

INSERT INTO `sym_entries_data_76` (`id`, `entry_id`, `relation_id`)
VALUES
	(127,117,113),
	(126,117,109),
	(125,117,13577),
	(124,117,112),
	(73,118,109),
	(89,119,113),
	(88,119,112),
	(87,119,110),
	(86,119,109),
	(147,13568,109),
	(72,12945,NULL),
	(53,12971,NULL),
	(71,12976,NULL),
	(56,13078,NULL),
	(106,13592,110),
	(65,13358,NULL),
	(75,13529,NULL),
	(146,13568,112),
	(145,13568,110),
	(85,119,13577),
	(105,13592,13577),
	(140,13600,110),
	(107,13669,NULL),
	(149,12908,NULL);

/*!40000 ALTER TABLE `sym_entries_data_76` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_78
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_78`;

CREATE TABLE `sym_entries_data_78` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions`;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`)
VALUES
	(45,'xssfilter','enabled','1.1'),
	(43,'cachelite','disabled','1.1.3'),
	(5,'jit_image_manipulation','enabled','1.14'),
	(6,'maintenance_mode','enabled','1.5'),
	(7,'profiledevkit','enabled','1.0.4'),
	(8,'markdown','enabled','1.13'),
	(9,'members','enabled','1.1.1'),
	(10,'datetime','enabled','2.3.2'),
	(25,'language_redirect','enabled','1.0.3'),
	(12,'uniqueuploadfield','enabled','1.5'),
	(39,'globalresourceloader','enabled','1.0.5'),
	(14,'html5_doctype','enabled','1.2.5'),
	(15,'image_index_preview','enabled','1.2.1'),
	(24,'multilingual_field','enabled','1.4.1'),
	(18,'massuploadutility','enabled','0.9.8'),
	(19,'order_entries','enabled','1.9.8'),
	(42,'cacheabledatasource','disabled','1.0'),
	(21,'subsectionmanager','enabled','2.1.2'),
	(22,'tweak_ui','enabled','0.1.2'),
	(26,'health_check','enabled','1.4'),
	(27,'systemidfield','enabled','1.0.2'),
	(47,'duplicate_entry','enabled','1.2'),
	(30,'filterfield','enabled','1.1'),
	(31,'xmlimporter','enabled','1.1.0'),
	(32,'save_and_return','enabled','1.2'),
	(44,'configuration','enabled','1.3.5'),
	(34,'scaffolds','enabled','0.5'),
	(46,'debugdevkit','enabled','1.2.1'),
	(36,'search_index','enabled','0.9.1'),
	(48,'root_page_params','enabled','1.2'),
	(49,'export_ensemble','enabled','1.16');

/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_extensions_delegates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions_delegates`;

CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `delegate` varchar(100) NOT NULL,
  `callback` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`)
VALUES
	(335,18,'/publish/new/','EntryPostCreate','returnJSON'),
	(330,6,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),
	(329,6,'/blueprints/pages/','AppendPageContent','__appendType'),
	(328,6,'/backend/','AppendPageAlert','__appendAlert'),
	(327,6,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),
	(348,7,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(347,7,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(326,6,'/system/preferences/','Save','__SavePreferences'),
	(343,9,'/system/preferences/','Save','savePreferences'),
	(342,9,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(318,14,'/frontend/','FrontendOutputPostGenerate','parse_html'),
	(319,15,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(313,24,'/system/preferences/','Save','__SavePreferences'),
	(334,18,'/backend/','AdminPagePreGenerate','initaliseAdminPageHead'),
	(333,18,'/system/preferences/','CustomActions','savePreferences'),
	(332,18,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(341,9,'/backend/','AdminPagePreGenerate','appendAssets'),
	(340,9,'/frontend/','EventPostSaveFilter','processPostSaveFilter'),
	(346,19,'/backend/','InitaliseAdminPageHead','appendScriptToHead'),
	(368,21,'/frontend/','DataSourceEntriesBuilt','__prepareSubsection'),
	(367,21,'/blueprints/datasources/','DatasourcePreDelete','__clearSubsectionCache'),
	(304,22,'/backend/','InitaliseAdminPageHead','addScriptToHead'),
	(312,24,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(316,26,'/backend/','DashboardPanelOptions','dashboard_panel_options'),
	(339,9,'/frontend/','EventPreSaveFilter','checkEventPermissions'),
	(315,26,'/backend/','DashboardPanelRender','render_panel'),
	(338,9,'/frontend/','FrontendProcessEvents','appendLoginStatusToEventXML'),
	(314,26,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),
	(320,5,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(323,25,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(325,6,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(337,9,'/frontend/','FrontendParamsResolve','addMemberDetailsToPageParams'),
	(336,9,'/frontend/','FrontendPageResolved','checkFrontendPagePermissions'),
	(305,31,'/backend/','InitaliseAdminPageHead','initializeAdmin'),
	(317,26,'/backend/','DashboardPanelTypes','dashboard_panel_types'),
	(321,5,'/system/preferences/','Save','__SavePreferences'),
	(324,25,'/system/preferences/','Save','__SavePreferences'),
	(331,6,'/frontend/','FrontendParamsResolve','__addParam'),
	(344,9,'/blueprints/events/new/','AppendEventFilter','appendFilter'),
	(345,9,'/blueprints/events/edit/','AppendEventFilter','appendFilter'),
	(369,21,'/publish/','Delete','__deleteTabs'),
	(366,21,'/blueprints/datasources/','DatasourcePostEdit','__clearSubsectionCache'),
	(365,21,'/blueprints/datasources/','DatasourcePostCreate','__clearSubsectionCache'),
	(364,21,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(359,32,'/backend/','InitaliseAdminPageHead','appendJS'),
	(360,32,'/backend/','AppendElementBelowView','appendElement'),
	(361,32,'/publish/edit/','EntryPostEdit','entryPostEdit'),
	(362,32,'/publish/new/','EntryPostCreate','entryPostEdit'),
	(370,21,'/backend/','AppendPageAlert','__upgradeMediathek'),
	(371,34,'/backend/','InitaliseAdminPageHead','appendAssets'),
	(372,34,'/blueprints/sections/','AddSectionElements','addSectionElements'),
	(380,36,'/frontend/','EventPostSaveFilter','indexEntry'),
	(379,36,'/publish/','Delete','deleteEntryIndex'),
	(378,36,'/publish/edit/','EntryPostEdit','indexEntry'),
	(377,36,'/publish/new/','EntryPostCreate','indexEntry'),
	(381,36,'/backend/','DashboardPanelRender','renderPanel'),
	(382,36,'/backend/','DashboardPanelTypes','dashboardPanelTypes'),
	(389,39,'/system/preferences/','AddCustomPreferenceFieldsets','preferences'),
	(388,39,'/frontend/','FrontendPageResolved','manipulatePageData'),
	(433,45,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),
	(432,45,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(431,45,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(430,44,'/system/preferences/','Save','__SavePreferences'),
	(429,44,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(434,46,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(435,46,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(436,47,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),
	(437,48,'/frontend/','FrontendPrePageResolve','addPage'),
	(438,48,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),
	(439,48,'/system/preferences/','Save','save_settings'),
	(440,49,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences');

/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields`;

CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `element_name` varchar(50) NOT NULL,
  `type` varchar(32) NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`)
VALUES
	(12,'Birthday','birthday','datetime',1,'yes',6,'sidebar','yes'),
	(2,'First name','first-name','input',1,'yes',0,'main','yes'),
	(14,'Name','name','input',2,'no',0,'main','yes'),
	(4,'Last name','last-name','input',1,'yes',1,'main','yes'),
	(5,'Email','email','memberemail',1,'no',3,'sidebar','yes'),
	(6,'Password','password','memberpassword',1,'no',7,'sidebar','no'),
	(7,'Activation','activation','memberactivation',1,'no',8,'sidebar','yes'),
	(11,'Gender','gender','select',1,'yes',5,'sidebar','yes'),
	(183,'Title','title','input',22,'no',0,'main','yes'),
	(19,'Tag','tag','multilingual',3,'no',0,'main','yes'),
	(21,'Description','description','multilingual',3,'no',1,'main','no'),
	(57,'Hide','hide','checkbox',3,'no',8,'sidebar','no'),
	(23,'Order','order','order_entries',3,'no',5,'main','no'),
	(24,'Passage','passage','input',4,'yes',0,'main','yes'),
	(150,'Content','content','multilingual',2,'no',1,'main','yes'),
	(26,'Name - Casual','name-casual','multilingual',5,'no',1,'main','yes'),
	(27,'Name - Formal','name-formal','multilingual',5,'yes',0,'main','yes'),
	(28,'Description','description','multilingual',5,'no',2,'main','yes'),
	(29,'Address','address','input',5,'no',3,'sidebar','yes'),
	(30,'City','city','input',5,'no',4,'sidebar','yes'),
	(31,'State','state','input',5,'no',5,'sidebar','yes'),
	(32,'Zip','zip','input',5,'no',6,'sidebar','yes'),
	(33,'Name','name','multilingual',6,'yes',0,'main','yes'),
	(34,'Description','description','multilingual',6,'no',2,'main','yes'),
	(35,'Date','date','datetime',6,'no',1,'sidebar','yes'),
	(139,'Tags','tags','subsectionmanager',8,'no',5,'sidebar','yes'),
	(144,'Description','description','multilingual',19,'no',1,'main','yes'),
	(40,'Content','content','multilingual',7,'yes',1,'main','yes'),
	(149,'Tags','tags','subsectionmanager',4,'no',1,'main','yes'),
	(43,'Image','image','uniqueupload',8,'yes',1,'main','yes'),
	(140,'Layout','layout','subsectionmanager',3,'no',3,'sidebar','yes'),
	(45,'Position','position','select',8,'no',3,'sidebar','yes'),
	(46,'ID','id','systemid',8,'no',0,'main','yes'),
	(47,'Height','height','input',8,'no',4,'sidebar','yes'),
	(201,'Reference (internal)','reference-internal','input',7,'no',0,'main','yes'),
	(50,'Photo','photo','uniqueupload',1,'no',2,'sidebar','yes'),
	(54,'About','about','multilingual',1,'no',9,'main','yes'),
	(52,'Job title','job-title','multilingual',1,'no',4,'sidebar','yes'),
	(53,'Longitude','longitude','input',5,'no',8,'sidebar','yes'),
	(56,'Slug','slug','input',3,'no',2,'main','no'),
	(58,'Order','order','order_entries',1,'no',11,'main','no'),
	(59,'Caption','caption','multilingual',8,'no',2,'main','yes'),
	(76,'Column - Right','column-right','subsectionmanager',11,'no',3,'main','yes'),
	(75,'Column - Center','column-center','subsectionmanager',11,'no',2,'main','yes'),
	(73,'Name','name','multilingual',11,'no',0,'main','yes'),
	(74,'Column - Full width','column-full-width','subsectionmanager',11,'no',1,'main','yes'),
	(71,'Name','name','multilingual',10,'no',0,'main','yes'),
	(72,'File','file','uniqueupload',10,'no',1,'sidebar','yes'),
	(132,'Role','role','multilingual',17,'yes',0,'main','yes'),
	(142,'Tags','tags','subsectionmanager',5,'no',9,'sidebar','yes'),
	(124,'Tags','tags','subsectionmanager',13,'no',15,'sidebar','no'),
	(103,'Chapter','chapter','input',13,'no',5,'main','yes'),
	(108,'Title','title','multilingual',13,'no',0,'main','yes'),
	(100,'Filename','filename','input',13,'no',2,'main','yes'),
	(109,'Date','date','datetime',13,'no',9,'sidebar','yes'),
	(110,'Day','day','select',13,'no',14,'sidebar','no'),
	(111,'Book','book','select',13,'no',4,'main','yes'),
	(112,'Description','description','multilingual',13,'no',6,'main','no'),
	(115,'Label','label','multilingual',9,'no',0,'main','yes'),
	(117,'Latitude','latitude','input',5,'no',7,'sidebar','yes'),
	(118,'Filter','filter','filter',13,'no',18,'main','no'),
	(123,'Current ID','current-id','input',13,'no',3,'main','no'),
	(125,'Speaker','speaker','subsectionmanager',13,'no',7,'main','no'),
	(143,'Type','type','multilingual',19,'no',0,'main','yes'),
	(127,'Tag','tag','multilingual',15,'no',0,'main','yes'),
	(129,'Phone number','phone-number','input',1,'no',12,'main','yes'),
	(131,'Tags','tags','subsectionmanager',10,'no',3,'main','yes'),
	(133,'Description','description','multilingual',17,'no',2,'main','yes'),
	(134,'Role','role','subsectionmanager',18,'yes',1,'main','yes'),
	(135,'Member','member','subsectionmanager',18,'yes',0,'main','yes'),
	(136,'Locations','locations','subsectionmanager',6,'no',3,'sidebar','yes'),
	(137,'Tags','tags','subsectionmanager',6,'no',6,'sidebar','yes'),
	(138,'Member/Role','member-role','subsectionmanager',6,'no',4,'sidebar','yes'),
	(141,'Parent','parent','subsectionmanager',3,'no',4,'sidebar','yes'),
	(145,'Type','type','subsectionmanager',6,'no',7,'sidebar','yes'),
	(147,'Context','context','multilingual',17,'yes',1,'main','yes'),
	(148,'Tags','tags','subsectionmanager',7,'no',2,'sidebar','yes'),
	(151,'Tags','tags','subsectionmanager',1,'no',10,'main','yes'),
	(152,'Tags','tags','subsectionmanager',18,'no',2,'main','yes'),
	(154,'Childcare','childcare','checkbox',6,'no',8,'sidebar','yes'),
	(191,'Video','video','subsectionmanager',13,'no',11,'sidebar','yes'),
	(190,'ID','id','input',22,'no',7,'sidebar','yes'),
	(189,'Tags','tags','subsectionmanager',22,'no',6,'main','yes'),
	(188,'Thumbnail','thumbnail','input',22,'no',5,'main','yes'),
	(187,'Player','player','textarea',22,'no',4,'main','no'),
	(186,'URL','url','input',22,'no',3,'main','yes'),
	(185,'Date','date','datetime',22,'no',2,'sidebar','yes'),
	(184,'Description','description','textarea',22,'no',1,'main','no'),
	(167,'Hide from footer','hide-from-footer','checkbox',3,'no',7,'sidebar','yes'),
	(168,'Hide from header','hide-from-header','checkbox',3,'no',6,'sidebar','yes'),
	(169,'Filter','filter','filter',6,'no',9,'main','no'),
	(170,'Name','name','multilingual',21,'yes',0,'main','yes'),
	(171,'Frequency','frequency','multilingual',21,'yes',1,'main','yes'),
	(172,'Description','description','multilingual',21,'yes',2,'main','no'),
	(173,'Locations','locations','subsectionmanager',21,'no',3,'main','yes'),
	(174,'Downloads','downloads','subsectionmanager',21,'no',5,'main','no'),
	(175,'Images','images','subsectionmanager',21,'no',6,'main','no'),
	(176,'Text','text','subsectionmanager',21,'no',7,'main','no'),
	(177,'Verses','verses','subsectionmanager',21,'no',8,'main','no'),
	(245,'Filter','filter','filter',21,'no',14,'main','no'),
	(179,'Member/Role','member-role','subsectionmanager',21,'no',9,'main','no'),
	(214,'Hide','hide','checkbox',21,'no',12,'sidebar','no'),
	(181,'Childcare','childcare','checkbox',21,'no',10,'sidebar','no'),
	(182,'Type','type','subsectionmanager',21,'no',11,'main','no'),
	(192,'Featured','featured','checkbox',13,'no',16,'sidebar','yes'),
	(194,'Date','date','datetime',24,'no',0,'sidebar','yes'),
	(195,'ID','id','input',24,'no',1,'main','yes'),
	(196,'User','user','input',24,'no',2,'main','yes'),
	(197,'User formatted','user-formatted','input',24,'no',3,'main','yes'),
	(198,'Content','content','textarea',24,'no',4,'main','no'),
	(199,'Name','name','input',25,'no',0,'main','yes'),
	(200,'Content','content','textarea',25,'no',1,'main','no'),
	(202,'URL','url','input',26,'no',0,'main','yes'),
	(203,'Content','content','textarea',26,'no',1,'main','no'),
	(204,'Can be closed','can-be-closed','checkbox',26,'no',3,'sidebar','yes'),
	(205,'Tags','tags','subsectionmanager',26,'no',4,'main','yes'),
	(206,'Hide','hide','checkbox',10,'no',4,'sidebar','yes'),
	(207,'Hide','hide','checkbox',8,'no',6,'sidebar','yes'),
	(208,'Hide','hide','checkbox',5,'no',10,'sidebar','yes'),
	(209,'Hide','hide','checkbox',7,'no',3,'sidebar','yes'),
	(210,'Hide','hide','checkbox',24,'no',5,'sidebar','yes'),
	(211,'Hide','hide','checkbox',4,'no',2,'sidebar','yes'),
	(212,'Hide','hide','checkbox',22,'no',8,'sidebar','yes'),
	(213,'Hide','hide','checkbox',6,'no',10,'sidebar','yes'),
	(215,'Hide','hide','checkbox',19,'no',2,'sidebar','yes'),
	(216,'Hide','hide','checkbox',13,'no',17,'sidebar','yes'),
	(217,'Hide','hide','checkbox',15,'no',1,'sidebar','yes'),
	(218,'Hide','hide','checkbox',1,'no',14,'sidebar','yes'),
	(219,'Hide','hide','checkbox',18,'no',3,'sidebar','yes'),
	(220,'Hide','hide','checkbox',17,'no',3,'sidebar','yes'),
	(221,'Hide','hide','checkbox',26,'no',6,'sidebar','yes'),
	(222,'Hide','hide','checkbox',11,'no',4,'sidebar','yes'),
	(223,'Hide','hide','checkbox',9,'no',1,'sidebar','yes'),
	(224,'Hide','hide','checkbox',2,'no',2,'sidebar','yes'),
	(225,'Hide','hide','checkbox',25,'no',2,'sidebar','yes'),
	(226,'Filter','filter','filter',8,'no',7,'main','no'),
	(227,'Show everywhere','show-everywhere','checkbox',26,'no',5,'sidebar','yes'),
	(230,'Member/Role','member-role','subsectionmanager',13,'no',8,'main','no'),
	(229,'Poster','poster','uniqueupload',13,'no',10,'sidebar','yes'),
	(231,'Teachings','teachings','subsectionmanager',27,'no',2,'main','yes'),
	(232,'Filter','filter','filter',27,'no',5,'main','no'),
	(233,'Hide','hide','checkbox',27,'no',3,'sidebar','yes'),
	(234,'Poster','poster','uniqueupload',27,'no',1,'sidebar','yes'),
	(235,'Title','title','multilingual',27,'no',0,'main','yes'),
	(236,'Filter','filter','filter',15,'no',2,'main','no'),
	(238,'Slug','slug','input',13,'no',1,'main','yes'),
	(240,'Order','order','order_entries',27,'no',4,'main','no'),
	(241,'Anonymize','anonymize','checkbox',1,'no',13,'sidebar','yes'),
	(242,'Order','order','order_entries',18,'no',4,'main','no'),
	(243,'Tags','tags','subsectionmanager',21,'no',4,'sidebar','yes'),
	(244,'Order','order','order_entries',21,'no',13,'main','no'),
	(246,'Audio - Duration','audio-duration','input',13,'no',12,'sidebar','no'),
	(247,'Audio - Filesize','audio-filesize','input',13,'no',13,'sidebar','no'),
	(249,'Link','link','input',10,'no',2,'sidebar','yes'),
	(250,'Downloads','downloads','subsectionmanager',6,'no',5,'sidebar','yes'),
	(251,'Type','type','select',26,'yes',7,'sidebar','yes'),
	(253,'SEO','seo','multilingual',13,'no',19,'main','no'),
	(254,'Color','color','input',8,'no',8,'sidebar','yes'),
	(255,'Images','images','subsectionmanager',6,'no',11,'main','no'),
	(256,'Verses','verses','subsectionmanager',6,'no',12,'main','no'),
	(257,'Background','background','input',8,'no',9,'sidebar','yes'),
	(258,'Name','name','multilingual',28,'yes',0,'main','yes'),
	(263,'Expiration','expiration','datetime',26,'no',2,'sidebar','yes'),
	(260,'URL','url','input',28,'yes',1,'main','yes'),
	(261,'Image','image','subsectionmanager',28,'no',2,'main','no'),
	(262,'Hide','hide','checkbox',28,'no',3,'sidebar','yes'),
	(264,'Expiration','expiration','datetime',28,'no',4,'sidebar','yes');

/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_author`;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_checkbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_checkbox`;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;

INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`)
VALUES
	(218,57,'off',NULL),
	(194,233,'off',NULL),
	(268,154,'off',NULL),
	(265,192,'off',NULL),
	(217,167,'off',NULL),
	(216,168,'off',NULL),
	(255,214,'off',NULL),
	(254,181,'off',NULL),
	(275,204,'on',NULL),
	(249,206,'off',NULL),
	(271,207,'off',NULL),
	(81,208,'off',NULL),
	(86,209,'off',NULL),
	(87,210,'off',NULL),
	(88,211,'off',NULL),
	(89,212,'off',NULL),
	(269,213,'off',NULL),
	(95,215,'off',NULL),
	(266,216,'off',NULL),
	(145,217,'off',NULL),
	(224,218,'off',NULL),
	(228,219,'off',NULL),
	(101,220,'off',NULL),
	(277,221,'off',NULL),
	(104,222,'off',NULL),
	(188,223,'off',NULL),
	(199,224,'off',NULL),
	(107,225,'off',NULL),
	(276,227,'off',NULL),
	(223,241,'off',NULL),
	(278,262,'off',NULL);

/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_date`;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;

INSERT INTO `sym_fields_date` (`id`, `field_id`, `pre_populate`)
VALUES
	(2,96,'yes');

/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_datetime`;

CREATE TABLE `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_datetime` WRITE;
/*!40000 ALTER TABLE `sym_fields_datetime` DISABLE KEYS */;

INSERT INTO `sym_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `range`)
VALUES
	(177,12,0,0,0),
	(192,35,1,1,1),
	(191,109,1,1,1),
	(143,185,1,1,1),
	(142,194,1,1,1),
	(196,263,1,1,1),
	(197,264,1,1,1);

/*!40000 ALTER TABLE `sym_fields_datetime` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_filter`;

CREATE TABLE `sym_fields_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `filter_publish` text,
  `filter_publish_errors` enum('yes','no') NOT NULL DEFAULT 'no',
  `filter_datasource` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_filter` WRITE;
/*!40000 ALTER TABLE `sym_fields_filter` DISABLE KEYS */;

INSERT INTO `sym_fields_filter` (`id`, `field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`)
VALUES
	(117,118,NULL,'no','yes'),
	(119,169,NULL,'no','yes'),
	(121,226,NULL,'no','yes'),
	(97,232,NULL,'no','yes'),
	(76,236,NULL,'no','yes'),
	(113,245,NULL,'no','yes');

/*!40000 ALTER TABLE `sym_fields_filter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`)
VALUES
	(951,14,NULL),
	(954,2,NULL),
	(955,4,NULL),
	(829,24,NULL),
	(817,29,NULL),
	(818,30,NULL),
	(819,31,NULL),
	(820,32,NULL),
	(1033,47,'/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i'),
	(116,54,NULL),
	(953,56,NULL),
	(293,78,NULL),
	(1025,103,NULL),
	(1023,100,NULL),
	(1024,123,NULL),
	(821,117,'/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i'),
	(822,53,'/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i'),
	(956,129,NULL),
	(825,201,NULL),
	(843,199,NULL),
	(828,197,NULL),
	(827,196,NULL),
	(826,195,NULL),
	(833,190,NULL),
	(832,188,NULL),
	(830,183,NULL),
	(831,186,NULL),
	(1040,202,NULL),
	(1022,238,NULL),
	(1026,246,'/^(\\d+):(\\d+):(\\d+)$/i'),
	(1027,247,'/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i'),
	(1002,249,'/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/'),
	(1034,254,NULL),
	(1035,257,NULL),
	(1041,260,NULL);

/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberactivation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberactivation`;

CREATE TABLE `sym_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_memberactivation` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberactivation` DISABLE KEYS */;

INSERT INTO `sym_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`)
VALUES
	(46,7,'3 hours',1,'no');

/*!40000 ALTER TABLE `sym_fields_memberactivation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberemail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberemail`;

CREATE TABLE `sym_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_memberemail` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberemail` DISABLE KEYS */;

INSERT INTO `sym_fields_memberemail` (`id`, `field_id`)
VALUES
	(46,5);

/*!40000 ALTER TABLE `sym_fields_memberemail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberpassword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberpassword`;

CREATE TABLE `sym_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `code_expiry` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_memberpassword` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberpassword` DISABLE KEYS */;

INSERT INTO `sym_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`)
VALUES
	(46,6,8,'good','kv235l2KL@JV#Rkj3v253kv55662f3@$}{','24 hours');

/*!40000 ALTER TABLE `sym_fields_memberpassword` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberrole`;

CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_multilingual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_multilingual`;

CREATE TABLE `sym_fields_multilingual` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') DEFAULT 'medium',
  `formatter` varchar(255) DEFAULT NULL,
  `text_validator` varchar(255) DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `unique_handle` enum('yes','no') DEFAULT 'yes',
  `use_def_lang_vals` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_multilingual` WRITE;
/*!40000 ALTER TABLE `sym_fields_multilingual` DISABLE KEYS */;

INSERT INTO `sym_fields_multilingual` (`id`, `field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`)
VALUES
	(599,19,25,'single','none',NULL,0,'yes','yes'),
	(600,21,25,'single','none',NULL,0,'yes','yes'),
	(476,26,25,'single','none',NULL,0,'yes','yes'),
	(475,27,25,'single','none',NULL,0,'yes','yes'),
	(477,28,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(646,33,25,'single','none',NULL,0,'yes','yes'),
	(647,34,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(481,40,25,'large','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(607,54,25,'small','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(606,52,25,'single','none',NULL,0,'yes','yes'),
	(649,59,25,'small','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(497,73,25,'single','none',NULL,0,'yes','yes'),
	(628,71,25,'single','none',NULL,0,'yes','yes'),
	(643,112,50,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(642,108,25,'single','none',NULL,0,'yes','yes'),
	(574,115,25,'single','none',NULL,0,'yes','yes'),
	(487,143,25,'single','none',NULL,0,'yes','yes'),
	(534,127,25,'single','none',NULL,0,'yes','yes'),
	(494,132,25,'single','none',NULL,0,'yes','yes'),
	(496,133,25,'small','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(488,144,25,'small','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(495,147,25,'single','none',NULL,0,'yes','yes'),
	(582,150,25,'large','none',NULL,0,'yes','yes'),
	(633,170,25,'single','none',NULL,0,'yes','yes'),
	(634,171,25,'single','none',NULL,0,'yes','yes'),
	(635,172,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(580,235,25,'single','none',NULL,0,'yes','yes'),
	(644,253,25,'small','none',NULL,0,'yes','yes'),
	(654,258,25,'single','none',NULL,0,'yes','yes');

/*!40000 ALTER TABLE `sym_fields_multilingual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_order_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_order_entries`;

CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_order_entries` WRITE;
/*!40000 ALTER TABLE `sym_fields_order_entries` DISABLE KEYS */;

INSERT INTO `sym_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`)
VALUES
	(49,23,'yes','yes'),
	(51,58,'yes','yes'),
	(41,240,'yes','yes'),
	(55,242,'yes','no'),
	(56,244,'yes','yes');

/*!40000 ALTER TABLE `sym_fields_order_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_search_index`;

CREATE TABLE `sym_fields_search_index` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_select`;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;

INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`)
VALUES
	(262,11,'no','yes','no','Male, Female',NULL),
	(290,45,'no','yes','no','Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right',NULL),
	(287,110,'no','yes','no','Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday',NULL),
	(286,111,'no','yes','no','Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalms, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation',NULL),
	(291,251,'no','no','no','standard, warning, success, info',NULL);

/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage`;

CREATE TABLE `sym_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_stage` WRITE;
/*!40000 ALTER TABLE `sym_fields_stage` DISABLE KEYS */;

INSERT INTO `sym_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`)
VALUES
	(776,12,1,1,0,0,0,'datetime'),
	(879,35,1,1,1,0,0,'datetime'),
	(61,64,0,1,1,0,1,'subsectionmanager'),
	(62,65,0,1,1,0,1,'subsectionmanager'),
	(63,66,0,1,1,0,1,'subsectionmanager'),
	(536,74,0,1,1,0,1,'subsectionmanager'),
	(537,75,0,1,1,0,1,'subsectionmanager'),
	(538,76,0,1,1,0,1,'subsectionmanager'),
	(89,81,1,1,1,0,0,'datetime'),
	(90,95,1,1,1,0,0,'datetime'),
	(875,109,1,1,1,0,0,'datetime'),
	(877,124,1,1,0,0,1,'subsectionmanager'),
	(873,125,1,1,0,0,1,'subsectionmanager'),
	(147,127,1,1,1,0,1,'subsectionmanager'),
	(390,130,1,1,1,0,1,'subsectionmanager'),
	(834,131,1,1,0,0,1,'subsectionmanager'),
	(788,134,1,1,0,0,1,'subsectionmanager'),
	(787,135,1,1,0,0,1,'subsectionmanager'),
	(880,136,1,1,0,0,1,'subsectionmanager'),
	(883,137,1,1,0,0,1,'subsectionmanager'),
	(881,138,1,1,1,0,1,'subsectionmanager'),
	(888,139,1,1,0,0,1,'subsectionmanager'),
	(761,140,1,1,0,0,1,'subsectionmanager'),
	(762,141,1,1,1,0,1,'subsectionmanager'),
	(504,142,1,1,0,0,1,'subsectionmanager'),
	(884,145,1,1,0,0,1,'subsectionmanager'),
	(508,148,1,1,0,0,1,'subsectionmanager'),
	(510,149,1,1,0,0,1,'subsectionmanager'),
	(777,151,1,1,0,0,1,'subsectionmanager'),
	(789,152,1,1,0,0,1,'subsectionmanager'),
	(847,173,1,1,1,0,1,'subsectionmanager'),
	(849,174,1,1,1,0,1,'subsectionmanager'),
	(850,175,1,1,1,0,1,'subsectionmanager'),
	(851,176,1,1,1,0,1,'subsectionmanager'),
	(852,177,1,1,1,0,1,'subsectionmanager'),
	(743,178,1,1,1,0,1,'subsectionmanager'),
	(853,179,1,1,1,0,1,'subsectionmanager'),
	(854,182,1,1,1,0,1,'subsectionmanager'),
	(511,185,1,1,1,0,0,'datetime'),
	(512,189,1,1,1,0,1,'subsectionmanager'),
	(876,191,1,1,0,0,1,'subsectionmanager'),
	(509,194,1,1,1,0,0,'datetime'),
	(897,205,1,1,1,0,1,'subsectionmanager'),
	(874,230,1,1,1,0,1,'subsectionmanager'),
	(708,231,1,1,1,0,1,'subsectionmanager'),
	(848,243,1,1,0,0,1,'subsectionmanager'),
	(882,250,1,1,1,0,1,'subsectionmanager'),
	(867,252,1,1,0,0,1,'subsectionmanager'),
	(885,255,1,1,1,0,1,'subsectionmanager'),
	(886,256,1,1,1,0,1,'subsectionmanager'),
	(893,259,1,1,1,0,0,'datetime'),
	(898,261,1,1,1,0,1,'subsectionmanager'),
	(896,263,1,1,1,0,0,'datetime'),
	(899,264,1,1,1,0,0,'datetime');

/*!40000 ALTER TABLE `sym_fields_stage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage_sorting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage_sorting`;

CREATE TABLE `sym_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_stage_sorting` WRITE;
/*!40000 ALTER TABLE `sym_fields_stage_sorting` DISABLE KEYS */;

INSERT INTO `sym_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`)
VALUES
	(909,12597,142,'0',NULL),
	(453,103,141,'0',NULL),
	(452,103,140,'0',NULL),
	(384,26,140,'0',NULL),
	(378,12497,140,'0',NULL),
	(377,43,141,'0',NULL),
	(376,43,140,'0',NULL),
	(383,25,141,'0',NULL),
	(381,22,141,'0',NULL),
	(380,22,140,'0',NULL),
	(396,55,140,'0',NULL),
	(395,27,141,'0',NULL),
	(394,27,140,'0',NULL),
	(393,28,141,'0',NULL),
	(392,28,140,'0',NULL),
	(49,75,64,'0',NULL),
	(50,75,65,'0',NULL),
	(51,75,66,'0',NULL),
	(52,78,64,'0',NULL),
	(53,78,65,'0',NULL),
	(54,78,66,'0',NULL),
	(382,25,140,'0',NULL),
	(398,74,140,'0',NULL),
	(389,30,141,'0',NULL),
	(388,30,140,'0',NULL),
	(397,55,141,'0',NULL),
	(391,29,141,'0',NULL),
	(390,29,140,'0',NULL),
	(257,12567,131,'0',NULL),
	(256,12566,131,'0',NULL),
	(255,115,131,'0',NULL),
	(117,119,76,'109,113,110,112',NULL),
	(110,117,75,'0',NULL),
	(111,117,76,'109,110,112,113',NULL),
	(109,117,74,'107,111',NULL),
	(116,119,75,'0',NULL),
	(115,119,74,'0',NULL),
	(137,7880,124,'10609,10825,11874,11938,11962,12114,12440',NULL),
	(136,7880,125,'0',NULL),
	(560,7874,125,'0',NULL),
	(561,7874,124,'11533,12427,11098,11502,11599,12100,12101,12102,12172,12449',NULL),
	(562,7877,125,'0',NULL),
	(563,7877,124,'10439,11533,10673,10759,10882,11010,11015,11016,11694,11863,12140',NULL),
	(962,7864,124,'0',NULL),
	(961,7864,125,'0',NULL),
	(145,12496,76,'0',NULL),
	(144,12496,75,'0',NULL),
	(143,12496,74,'0',NULL),
	(285,7760,136,'0',NULL),
	(569,7879,124,'0',NULL),
	(568,7879,125,'0',NULL),
	(659,12629,137,'0',NULL),
	(690,12634,130,'0',NULL),
	(571,7873,124,'0',NULL),
	(570,7873,125,'0',NULL),
	(1061,7851,124,'0',NULL),
	(1060,7851,125,'0',NULL),
	(168,7744,125,'0',NULL),
	(169,7744,124,'0',NULL),
	(173,7747,124,'0',NULL),
	(172,7747,125,'0',NULL),
	(179,7779,124,'0',NULL),
	(178,7779,125,'0',NULL),
	(180,7709,125,'0',NULL),
	(181,7709,124,'0',NULL),
	(185,7746,124,'0',NULL),
	(184,7746,125,'0',NULL),
	(186,7764,125,'0',NULL),
	(187,7764,124,'0',NULL),
	(188,7772,125,'0',NULL),
	(189,7772,124,'0',NULL),
	(193,7729,124,'0',NULL),
	(192,7729,125,'0',NULL),
	(1059,7846,124,'0',NULL),
	(1058,7846,125,'0',NULL),
	(1057,7847,124,'0',NULL),
	(1056,7847,125,'0',NULL),
	(198,7610,125,'0',NULL),
	(199,7610,124,'0',NULL),
	(203,7524,124,'0',NULL),
	(202,7524,125,'0',NULL),
	(204,7464,125,'0',NULL),
	(205,7464,124,'0',NULL),
	(206,7311,125,'0',NULL),
	(207,7311,124,'0',NULL),
	(208,7706,125,'0',NULL),
	(209,7706,124,'10830,10596,10598,10660,10874,11710,11711',NULL),
	(210,7735,125,'0',NULL),
	(211,7735,124,'0',NULL),
	(212,7700,125,'0',NULL),
	(213,7700,124,'10482,10968,10949,10967,11546,11783,11784,11804,11806,11807,11823,11848,11876,12451,11850',NULL),
	(214,7727,125,'0',NULL),
	(215,7727,124,'0',NULL),
	(216,7743,125,'0',NULL),
	(217,7743,124,'0',NULL),
	(218,7742,125,'0',NULL),
	(219,7742,124,'0',NULL),
	(220,7770,125,'0',NULL),
	(221,7770,124,'0',NULL),
	(1063,7845,124,'0',NULL),
	(1062,7845,125,'0',NULL),
	(224,6965,125,'0',NULL),
	(225,6965,124,'0',NULL),
	(226,6967,125,'0',NULL),
	(227,6967,124,'0',NULL),
	(948,7678,124,'0',NULL),
	(947,7678,125,'0',NULL),
	(230,7070,125,'0',NULL),
	(231,7070,124,'0',NULL),
	(232,7238,125,'0',NULL),
	(233,7238,124,'0',NULL),
	(234,7077,125,'0',NULL),
	(235,7077,124,'0',NULL),
	(761,7713,124,'10438,11129,11130,11135',NULL),
	(760,7713,125,'0',NULL),
	(238,7491,125,'0',NULL),
	(239,7491,124,'11219',NULL),
	(240,7403,125,'0',NULL),
	(241,7403,124,'0',NULL),
	(242,7073,125,'0',NULL),
	(243,7073,124,'0',NULL),
	(244,7716,125,'0',NULL),
	(245,7716,124,'0',NULL),
	(936,7681,124,'0',NULL),
	(935,7681,125,'0',NULL),
	(248,7075,125,'0',NULL),
	(249,7075,124,'0',NULL),
	(250,7714,125,'0',NULL),
	(251,7714,124,'0',NULL),
	(252,7565,125,'0',NULL),
	(253,7565,124,'0',NULL),
	(254,12571,131,'0',NULL),
	(258,12568,131,'0',NULL),
	(259,12569,131,'0',NULL),
	(260,12570,131,'0',NULL),
	(261,48,136,'0',NULL),
	(262,48,137,'0',NULL),
	(263,48,138,'0',NULL),
	(264,48,130,'0',NULL),
	(658,12629,130,'0',NULL),
	(788,12610,137,'0',NULL),
	(787,12610,130,'0',NULL),
	(786,12610,138,'0',NULL),
	(785,12610,136,'0',NULL),
	(793,12611,137,'0',NULL),
	(792,12611,130,'0',NULL),
	(791,12611,138,'0',NULL),
	(790,12611,136,'0',NULL),
	(286,7760,137,'0',NULL),
	(287,7760,138,'0',NULL),
	(288,7760,130,'0',NULL),
	(293,12660,135,'0',NULL),
	(294,12660,134,'0',NULL),
	(295,12661,135,'0',NULL),
	(296,12661,134,'0',NULL),
	(655,12659,134,'0',NULL),
	(654,12659,135,'0',NULL),
	(488,12658,134,'0',NULL),
	(487,12658,135,'0',NULL),
	(657,12629,138,'12659,12658,12660,12661',NULL),
	(675,12630,145,'0',NULL),
	(674,12630,137,'0',NULL),
	(673,12630,130,'0',NULL),
	(672,12630,138,'0',NULL),
	(679,12632,137,'0',NULL),
	(678,12632,130,'0',NULL),
	(677,12632,138,'0',NULL),
	(676,12632,136,'0',NULL),
	(689,12634,138,'12714,12713',NULL),
	(688,12634,136,'0',NULL),
	(701,12636,137,'0',NULL),
	(700,12636,130,'0',NULL),
	(699,12636,138,'0',NULL),
	(698,12636,136,'0',NULL),
	(706,12637,137,'0',NULL),
	(705,12637,130,'0',NULL),
	(704,12637,138,'0',NULL),
	(703,12637,136,'0',NULL),
	(711,12638,137,'0',NULL),
	(710,12638,130,'0',NULL),
	(709,12638,138,'0',NULL),
	(708,12638,136,'0',NULL),
	(716,12639,137,'0',NULL),
	(715,12639,130,'0',NULL),
	(714,12639,138,'0',NULL),
	(713,12639,136,'0',NULL),
	(663,12622,130,'12498,12499,12500',NULL),
	(662,12622,138,'0',NULL),
	(661,12622,136,'0',NULL),
	(696,12635,137,'0',NULL),
	(695,12635,130,'0',NULL),
	(694,12635,138,'0',NULL),
	(693,12635,136,'0',NULL),
	(721,12640,137,'0',NULL),
	(720,12640,130,'0',NULL),
	(719,12640,138,'0',NULL),
	(718,12640,136,'0',NULL),
	(725,12641,130,'12530,12531,12532',NULL),
	(724,12641,138,'0',NULL),
	(723,12641,136,'0',NULL),
	(684,12633,137,'0',NULL),
	(683,12633,130,'0',NULL),
	(682,12633,138,'0',NULL),
	(681,12633,136,'0',NULL),
	(361,98,139,'0',NULL),
	(362,96,139,'0',NULL),
	(363,94,139,'0',NULL),
	(364,92,139,'0',NULL),
	(365,63,139,'0',NULL),
	(366,62,139,'0',NULL),
	(367,61,139,'0',NULL),
	(368,60,139,'0',NULL),
	(369,59,139,'0',NULL),
	(370,58,139,'0',NULL),
	(371,57,139,'0',NULL),
	(372,44,139,'0',NULL),
	(373,41,139,'0',NULL),
	(374,7761,140,'0',NULL),
	(375,7761,141,'0',NULL),
	(379,12497,141,'0',NULL),
	(385,26,141,'0',NULL),
	(386,31,140,'0',NULL),
	(387,31,141,'0',NULL),
	(399,74,141,'0',NULL),
	(604,12491,141,'0',NULL),
	(603,12491,140,'0',NULL),
	(606,12492,141,'0',NULL),
	(605,12492,140,'0',NULL),
	(602,12493,141,'0',NULL),
	(601,12493,140,'0',NULL),
	(608,12623,141,'0',NULL),
	(607,12623,140,'0',NULL),
	(610,12624,141,'0',NULL),
	(609,12624,140,'0',NULL),
	(612,12625,141,'0',NULL),
	(611,12625,140,'0',NULL),
	(614,12626,141,'0',NULL),
	(613,12626,140,'0',NULL),
	(616,12627,141,'0',NULL),
	(615,12627,140,'0',NULL),
	(618,12628,141,'0',NULL),
	(617,12628,140,'0',NULL),
	(423,80,141,'0',NULL),
	(422,80,140,'0',NULL),
	(424,81,140,'0',NULL),
	(425,81,141,'0',NULL),
	(426,82,140,'0',NULL),
	(427,82,141,'0',NULL),
	(428,83,140,'0',NULL),
	(429,83,141,'0',NULL),
	(430,84,140,'0',NULL),
	(431,84,141,'0',NULL),
	(432,85,140,'0',NULL),
	(433,85,141,'0',NULL),
	(434,86,140,'0',NULL),
	(435,86,141,'0',NULL),
	(436,87,140,'0',NULL),
	(437,87,141,'0',NULL),
	(438,18,140,'0',NULL),
	(439,18,141,'0',NULL),
	(440,88,140,'0',NULL),
	(441,88,141,'0',NULL),
	(442,99,140,'0',NULL),
	(443,99,141,'0',NULL),
	(444,104,140,'0',NULL),
	(445,104,141,'0',NULL),
	(446,100,140,'0',NULL),
	(447,100,141,'0',NULL),
	(448,101,140,'0',NULL),
	(449,101,141,'0',NULL),
	(450,102,140,'0',NULL),
	(451,102,141,'0',NULL),
	(899,12602,142,'0',NULL),
	(456,38,142,'0',NULL),
	(906,12607,142,'0',NULL),
	(895,12593,142,'0',NULL),
	(893,12591,142,'0',NULL),
	(894,12592,142,'0',NULL),
	(898,12596,142,'0',NULL),
	(900,12603,142,'0',NULL),
	(912,12605,142,'0',NULL),
	(907,12595,142,'0',NULL),
	(890,12590,142,'0',NULL),
	(917,7748,142,'0',NULL),
	(905,12608,142,'0',NULL),
	(902,12606,142,'0',NULL),
	(904,12609,142,'0',NULL),
	(889,12589,142,'0',NULL),
	(897,12594,142,'0',NULL),
	(896,12598,142,'0',NULL),
	(892,12604,142,'0',NULL),
	(916,33,142,'0',NULL),
	(656,12629,136,'0',NULL),
	(485,7872,125,'0',NULL),
	(486,7872,124,'11158,11583,12337,11016',NULL),
	(499,12665,124,'0',NULL),
	(498,12665,125,'0',NULL),
	(500,12631,148,'0',NULL),
	(501,12621,148,'0',NULL),
	(502,12490,148,'0',NULL),
	(504,12487,148,'0',NULL),
	(505,12485,148,'0',NULL),
	(506,12484,148,'0',NULL),
	(507,12482,148,'0',NULL),
	(508,12480,148,'0',NULL),
	(509,12478,148,'0',NULL),
	(510,12476,148,'0',NULL),
	(511,12475,148,'0',NULL),
	(512,7763,148,'0',NULL),
	(514,7762,148,'0',NULL),
	(515,116,148,'0',NULL),
	(516,97,148,'0',NULL),
	(517,95,148,'0',NULL),
	(518,93,148,'0',NULL),
	(519,91,148,'0',NULL),
	(520,90,148,'0',NULL),
	(521,89,148,'0',NULL),
	(525,12668,124,'0',NULL),
	(524,12668,125,'0',NULL),
	(526,73,148,'0',NULL),
	(528,72,148,'0',NULL),
	(529,71,148,'0',NULL),
	(530,56,148,'0',NULL),
	(531,54,148,'0',NULL),
	(532,53,148,'0',NULL),
	(533,52,148,'0',NULL),
	(534,51,148,'0',NULL),
	(535,50,148,'0',NULL),
	(536,49,148,'0',NULL),
	(537,47,148,'0',NULL),
	(538,69,149,'0',NULL),
	(539,12614,149,'0',NULL),
	(540,70,149,'0',NULL),
	(541,12619,149,'0',NULL),
	(542,68,149,'0',NULL),
	(543,12489,149,'0',NULL),
	(544,12620,149,'0',NULL),
	(545,12486,149,'0',NULL),
	(546,76,149,'0',NULL),
	(547,12488,149,'0',NULL),
	(548,42,149,'0',NULL),
	(549,12613,149,'0',NULL),
	(550,12481,149,'0',NULL),
	(551,46,149,'0',NULL),
	(552,12612,149,'0',NULL),
	(553,65,149,'0',NULL),
	(554,12616,149,'0',NULL),
	(555,12479,149,'0',NULL),
	(556,66,149,'0',NULL),
	(557,67,149,'0',NULL),
	(558,32,149,'0',NULL),
	(559,64,149,'0',NULL),
	(577,7871,124,'0',NULL),
	(576,7871,125,'0',NULL),
	(1043,7870,124,'0',NULL),
	(1042,7870,125,'0',NULL),
	(671,12630,136,'0',NULL),
	(585,7869,125,'0',NULL),
	(586,7869,124,'0',NULL),
	(590,7878,124,'0',NULL),
	(589,7878,125,'0',NULL),
	(594,7875,124,'0',NULL),
	(593,7875,125,'0',NULL),
	(595,7876,125,'0',NULL),
	(596,7876,124,'0',NULL),
	(628,12677,145,'0',NULL),
	(627,12677,137,'0',NULL),
	(626,12677,130,'0',NULL),
	(625,12677,138,'0',NULL),
	(624,12677,136,'0',NULL),
	(629,12678,136,'0',NULL),
	(630,12678,138,'0',NULL),
	(631,12678,130,'0',NULL),
	(632,12678,137,'0',NULL),
	(633,12678,145,'0',NULL),
	(634,12686,136,'0',NULL),
	(635,12686,138,'0',NULL),
	(636,12686,130,'0',NULL),
	(637,12686,137,'0',NULL),
	(638,12686,145,'0',NULL),
	(648,12687,145,'0',NULL),
	(647,12687,137,'0',NULL),
	(646,12687,130,'0',NULL),
	(645,12687,138,'0',NULL),
	(644,12687,136,'0',NULL),
	(649,12691,136,'0',NULL),
	(650,12691,138,'0',NULL),
	(651,12691,130,'0',NULL),
	(652,12691,137,'0',NULL),
	(653,12691,145,'0',NULL),
	(660,12629,145,'0',NULL),
	(664,12622,137,'0',NULL),
	(665,12622,145,'0',NULL),
	(680,12632,145,'0',NULL),
	(685,12633,145,'0',NULL),
	(686,12714,135,'0',NULL),
	(687,12714,134,'0',NULL),
	(691,12634,137,'0',NULL),
	(692,12634,145,'0',NULL),
	(697,12635,145,'0',NULL),
	(702,12636,145,'0',NULL),
	(707,12637,145,'0',NULL),
	(712,12638,145,'0',NULL),
	(717,12639,145,'0',NULL),
	(722,12640,145,'0',NULL),
	(726,12641,137,'0',NULL),
	(727,12641,145,'0',NULL),
	(731,6455,124,'0',NULL),
	(730,6455,125,'0',NULL),
	(824,7719,124,'0',NULL),
	(823,7719,125,'0',NULL),
	(738,7705,125,'0',NULL),
	(739,7705,124,'0',NULL),
	(740,7736,125,'0',NULL),
	(741,7736,124,'0',NULL),
	(742,7707,125,'0',NULL),
	(743,7707,124,'0',NULL),
	(744,7708,125,'0',NULL),
	(745,7708,124,'0',NULL),
	(746,7710,125,'0',NULL),
	(747,7710,124,'0',NULL),
	(751,7711,124,'0',NULL),
	(750,7711,125,'0',NULL),
	(752,12757,135,'0',NULL),
	(753,12757,134,'0',NULL),
	(754,12764,135,'0',NULL),
	(755,12764,134,'0',NULL),
	(756,7737,125,'0',NULL),
	(757,7737,124,'0',NULL),
	(758,7712,125,'0',NULL),
	(759,7712,124,'0',NULL),
	(762,7715,125,'0',NULL),
	(763,7715,124,'0',NULL),
	(914,12755,142,'0',NULL),
	(784,12779,145,'0',NULL),
	(783,12779,137,'0',NULL),
	(782,12779,130,'0',NULL),
	(781,12779,138,'0',NULL),
	(780,12779,136,'0',NULL),
	(770,12780,136,'0',NULL),
	(771,12780,138,'0',NULL),
	(772,12780,130,'0',NULL),
	(773,12780,137,'0',NULL),
	(774,12780,145,'0',NULL),
	(775,12777,136,'0',NULL),
	(776,12777,138,'0',NULL),
	(777,12777,130,'0',NULL),
	(778,12777,137,'0',NULL),
	(779,12777,145,'0',NULL),
	(789,12610,145,'0',NULL),
	(794,12611,145,'0',NULL),
	(798,12642,124,'0',NULL),
	(797,12642,125,'0',NULL),
	(804,7759,124,'0',NULL),
	(803,7759,125,'0',NULL),
	(805,7758,125,'0',NULL),
	(806,7758,124,'0',NULL),
	(812,7757,124,'0',NULL),
	(811,7757,125,'0',NULL),
	(809,12649,125,'0',NULL),
	(810,12649,124,'0',NULL),
	(813,7756,125,'0',NULL),
	(814,7756,124,'0',NULL),
	(815,12648,125,'0',NULL),
	(816,12648,124,'0',NULL),
	(820,7755,124,'0',NULL),
	(819,7755,125,'0',NULL),
	(825,7718,125,'0',NULL),
	(826,7718,124,'0',NULL),
	(827,7717,125,'0',NULL),
	(828,7717,124,'0',NULL),
	(834,7704,124,'0',NULL),
	(833,7704,125,'0',NULL),
	(831,12647,125,'0',NULL),
	(832,12647,124,'0',NULL),
	(835,7754,125,'0',NULL),
	(836,7754,124,'0',NULL),
	(837,7703,125,'0',NULL),
	(838,7703,124,'0',NULL),
	(839,12646,125,'0',NULL),
	(840,12646,124,'0',NULL),
	(841,7702,125,'0',NULL),
	(842,7702,124,'0',NULL),
	(843,7753,125,'0',NULL),
	(844,7753,124,'0',NULL),
	(845,7699,125,'0',NULL),
	(846,7699,124,'0',NULL),
	(852,12645,124,'0',NULL),
	(851,12645,125,'0',NULL),
	(849,7698,125,'0',NULL),
	(850,7698,124,'0',NULL),
	(856,7752,124,'0',NULL),
	(855,7752,125,'0',NULL),
	(857,7701,125,'0',NULL),
	(858,7701,124,'0',NULL),
	(859,7697,125,'0',NULL),
	(860,7697,124,'0',NULL),
	(861,12644,125,'0',NULL),
	(862,12644,124,'0',NULL),
	(863,7751,125,'0',NULL),
	(864,7751,124,'0',NULL),
	(870,7696,124,'0',NULL),
	(869,7696,125,'0',NULL),
	(867,12643,125,'0',NULL),
	(868,12643,124,'0',NULL),
	(871,7695,125,'0',NULL),
	(872,7695,124,'0',NULL),
	(873,7867,125,'0',NULL),
	(874,7867,124,'0',NULL),
	(875,7865,125,'0',NULL),
	(876,7865,124,'0',NULL),
	(877,7692,125,'0',NULL),
	(878,7692,124,'0',NULL),
	(879,7694,125,'0',NULL),
	(880,7694,124,'0',NULL),
	(881,7691,125,'0',NULL),
	(882,7691,124,'0',NULL),
	(887,7690,125,'0',NULL),
	(888,7690,124,'0',NULL),
	(910,12778,142,'0',NULL),
	(903,12767,142,'0',NULL),
	(913,12745,142,'0',NULL),
	(915,12762,142,'0',NULL),
	(918,7689,125,'0',NULL),
	(919,7689,124,'0',NULL),
	(920,105,151,'0',NULL),
	(921,7688,125,'0',NULL),
	(922,7688,124,'0',NULL),
	(923,7687,125,'0',NULL),
	(924,7687,124,'0',NULL),
	(925,7686,125,'0',NULL),
	(926,7686,124,'0',NULL),
	(927,7684,125,'0',NULL),
	(928,7684,124,'0',NULL),
	(929,7685,125,'0',NULL),
	(930,7685,124,'0',NULL),
	(931,7683,125,'0',NULL),
	(932,7683,124,'0',NULL),
	(933,7682,125,'0',NULL),
	(934,7682,124,'0',NULL),
	(937,7680,125,'0',NULL),
	(938,7680,124,'0',NULL),
	(939,7679,125,'0',NULL),
	(940,7679,124,'0',NULL),
	(941,7676,125,'0',NULL),
	(942,7676,124,'0',NULL),
	(943,7677,125,'0',NULL),
	(944,7677,124,'0',NULL),
	(945,7675,125,'0',NULL),
	(946,7675,124,'0',NULL),
	(949,7674,125,'0',NULL),
	(950,7674,124,'0',NULL),
	(951,7673,125,'0',NULL),
	(952,7673,124,'0',NULL),
	(953,7672,125,'0',NULL),
	(954,7672,124,'0',NULL),
	(955,7671,125,'0',NULL),
	(956,7671,124,'0',NULL),
	(957,7868,125,'0',NULL),
	(958,7868,124,'0',NULL),
	(959,7866,125,'0',NULL),
	(960,7866,124,'0',NULL),
	(963,7862,125,'0',NULL),
	(964,7862,124,'0',NULL),
	(965,7863,125,'0',NULL),
	(966,7863,124,'0',NULL),
	(967,7860,125,'0',NULL),
	(968,7860,124,'0',NULL),
	(969,7859,125,'0',NULL),
	(970,7859,124,'0',NULL),
	(971,7861,125,'0',NULL),
	(972,7861,124,'0',NULL),
	(973,7858,125,'0',NULL),
	(974,7858,124,'0',NULL),
	(975,7857,125,'0',NULL),
	(976,7857,124,'0',NULL),
	(1045,7856,124,'0',NULL),
	(1044,7856,125,'0',NULL),
	(1049,7854,124,'0',NULL),
	(1048,7854,125,'0',NULL),
	(1051,7853,124,'0',NULL),
	(1050,7853,125,'0',NULL),
	(1053,7852,124,'0',NULL),
	(1052,7852,125,'0',NULL),
	(1005,7850,124,'0',NULL),
	(1004,7850,125,'0',NULL),
	(1047,7855,124,'0',NULL),
	(1046,7855,125,'0',NULL),
	(998,7578,124,'0',NULL),
	(997,7578,125,'0',NULL),
	(999,12556,151,'0',NULL),
	(1055,7849,124,'0',NULL),
	(1054,7849,125,'0',NULL),
	(1011,7848,124,'0',NULL),
	(1010,7848,125,'0',NULL),
	(1027,7844,124,'0',NULL),
	(1026,7844,125,'0',NULL),
	(1014,7843,125,'0',NULL),
	(1015,7843,124,'0',NULL),
	(1016,7842,125,'0',NULL),
	(1017,7842,124,'0',NULL),
	(1018,7841,125,'0',NULL),
	(1019,7841,124,'0',NULL),
	(1035,7840,124,'0',NULL),
	(1034,7840,125,'0',NULL),
	(1028,7839,125,'0',NULL),
	(1029,7839,124,'0',NULL),
	(1030,6456,125,'0',NULL),
	(1031,6456,124,'0',NULL),
	(1032,7670,125,'0',NULL),
	(1033,7670,124,'0',NULL),
	(1036,7838,125,'0',NULL),
	(1037,7838,124,'0',NULL),
	(1038,7837,125,'0',NULL),
	(1039,7837,124,'0',NULL),
	(1040,7836,125,'0',NULL),
	(1041,7836,124,'0',NULL);

/*!40000 ALTER TABLE `sym_fields_stage_sorting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_subsectionmanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_subsectionmanager`;

CREATE TABLE `sym_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `droptext` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recursion_levels` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_subsectionmanager` WRITE;
/*!40000 ALTER TABLE `sym_fields_subsectionmanager` DISABLE KEYS */;

INSERT INTO `sym_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`, `lock`, `recursion_levels`)
VALUES
	(391,75,'9',NULL,'{$label}',NULL,'115:raw',1,1,1,0),
	(392,76,'9',NULL,'{$label}',NULL,'115:raw',1,1,1,0),
	(390,74,'9',NULL,'{$label}',NULL,'115:raw',1,1,1,0),
	(683,125,'1',NULL,'{$first-name} {$last-name}',NULL,'2,4',0,1,1,0),
	(611,134,'17',NULL,'{$role} ({$context})',NULL,NULL,0,1,1,0),
	(649,131,'3',NULL,'{$tag} ({$description})',NULL,'19:raw',1,1,1,0),
	(610,135,'1',NULL,'{$first-name} {$last-name}',NULL,NULL,0,1,0,0),
	(688,136,'5',NULL,'{$name-formal}',NULL,NULL,1,1,1,0),
	(696,139,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(586,140,'11',NULL,'{$name}',NULL,NULL,0,1,0,0),
	(587,141,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(692,145,'19',NULL,'{$type}',NULL,NULL,0,1,1,0),
	(367,148,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(368,149,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(363,142,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(686,124,'15',NULL,'{$tag} ({$description})',NULL,'127:raw',1,1,1,0),
	(691,137,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(600,151,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(612,152,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,0),
	(660,173,'5',NULL,'{$name-formal}',NULL,NULL,1,1,1,1),
	(662,174,'10',NULL,'{$name}<br /> <em>{$file}</em>',NULL,NULL,1,1,1,1),
	(663,175,'8',NULL,'{$id}<br /> <em>{$image}</em>',NULL,NULL,1,1,1,1),
	(664,176,'7',NULL,'{$content}',NULL,NULL,1,1,1,1),
	(665,177,'4',NULL,'{$passage}',NULL,NULL,1,1,1,1),
	(666,179,'18',NULL,'{$member} - {$role}',NULL,NULL,1,1,1,1),
	(667,182,'19',NULL,'{$type}',NULL,NULL,1,1,1,1),
	(685,191,'22',NULL,'{$title}',NULL,NULL,0,1,1,1),
	(689,138,'18',NULL,'{$member} - {$role}',NULL,NULL,1,1,1,0),
	(369,189,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,1),
	(701,205,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,1),
	(684,230,'18',NULL,'{$member} - {$role}',NULL,NULL,1,1,1,1),
	(534,231,'13',NULL,'({$filename}) {$title} - {$book} {$chapter} on {$day} by {$speaker}{$member-role}',NULL,NULL,1,1,1,1),
	(661,243,'3',NULL,'{$tag} ({$description})',NULL,NULL,1,1,1,1),
	(690,250,'10',NULL,'{$name}',NULL,NULL,1,1,0,1),
	(693,255,'8',NULL,'{$id}<br /> <em>{$image}</em>',NULL,NULL,1,1,1,1),
	(694,256,'4',NULL,'{$passage}',NULL,NULL,1,1,1,1),
	(702,261,'8',NULL,'{$id}<br /> <em>{$image}</em>',NULL,NULL,1,1,1,1);

/*!40000 ALTER TABLE `sym_fields_subsectionmanager` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_subsectiontabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_subsectiontabs`;

CREATE TABLE `sym_fields_subsectiontabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `static_tabs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_systemid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_systemid`;

CREATE TABLE `sym_fields_systemid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_taglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_taglist`;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_textarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_textarea`;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`)
VALUES
	(59,184,NULL,15),
	(60,187,NULL,15),
	(58,198,NULL,15),
	(62,200,NULL,15),
	(66,203,'markdown_extra_with_smartypants',15);

/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_uniqueupload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueupload`;

CREATE TABLE `sym_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_uniqueupload` WRITE;
/*!40000 ALTER TABLE `sym_fields_uniqueupload` DISABLE KEYS */;

INSERT INTO `sym_fields_uniqueupload` (`id`, `field_id`, `destination`, `validator`)
VALUES
	(124,43,'/workspace/uploads/images/leaderboards','/\\.(?:bmp|gif|jpe?g|png)$/i'),
	(105,50,'/workspace/uploads/images/leaderboards','/\\.(?:jpe?g)$/i'),
	(37,68,'/workspace/uploads/resources',NULL),
	(117,72,'/workspace/uploads/downloads',NULL),
	(121,229,'/workspace/uploads/images/leaderboards','/\\.(?:jpe?g)$/i'),
	(104,234,'/workspace/uploads/images/leaderboards','/\\.(?:jpe?g)$/i');

/*!40000 ALTER TABLE `sym_fields_uniqueupload` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_upload`;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_forgotpass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_forgotpass`;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) NOT NULL,
  `expiry` varchar(25) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles`;

CREATE TABLE `sym_members_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_roles` WRITE;
/*!40000 ALTER TABLE `sym_members_roles` DISABLE KEYS */;

INSERT INTO `sym_members_roles` (`id`, `name`, `handle`)
VALUES
	(1,'Public','public'),
	(2,'Member','member'),
	(3,'Not yet activated','not-yet-activated'),
	(4,'Staff','staff');

/*!40000 ALTER TABLE `sym_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_event_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_event_permissions`;

CREATE TABLE `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) NOT NULL,
  `action` varchar(60) NOT NULL,
  `level` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_roles_event_permissions` WRITE;
/*!40000 ALTER TABLE `sym_members_roles_event_permissions` DISABLE KEYS */;

INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`)
VALUES
	(1,4,'language_redirect','edit',0),
	(2,4,'members_create','edit',0);

/*!40000 ALTER TABLE `sym_members_roles_event_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_forbidden_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_forbidden_pages`;

CREATE TABLE `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages`;

CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `data_sources` text,
  `events` text,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`)
VALUES
	(1,NULL,'Home','home',NULL,'pt1/pt2/pt3/pt4/pt5/pt6/pt7/pt8/pt9/pt10','events_entry_by_id,events_recurring_entry_by_id,members_roles_entries_by_tag','images_create',4),
	(4,NULL,'Preview','preview',NULL,'pt1/pt2/pt3/pt4/pt5/pt6/pt7/pt8/pt9/pt10','events_entry_by_id_preview',NULL,7),
	(5,NULL,'Podcast','podcast',NULL,NULL,'itunes_podcast',NULL,8),
	(2,NULL,'JSON','json',NULL,'pt1/pt2/pt3/pt4/pt5/pt6/pt7/pt8/pt9/pt10','events_entry_by_id_api,events_recurring_entry_by_id_api,members_roles_entries_by_tag_api',NULL,5),
	(3,NULL,'XML','xml',NULL,'pt1/pt2/pt3/pt4/pt5/pt6/pt7/pt8/pt9/pt10','events_entry_by_id_api,events_recurring_entry_by_id_api,members_roles_entries_by_tag_api',NULL,6),
	(6,NULL,'maintenance','maintenance',NULL,NULL,NULL,NULL,9);

/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages_types`;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`)
VALUES
	(87,1,'index'),
	(86,5,'XML'),
	(88,6,'maintenance');

/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index`;

CREATE TABLE `sym_search_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_search_index` WRITE;
/*!40000 ALTER TABLE `sym_search_index` DISABLE KEYS */;

INSERT INTO `sym_search_index` (`id`, `entry_id`, `section_id`, `data`)
VALUES
	(1,13920,3,'About 1   About'),
	(2,13921,3,'Events 1   Events'),
	(3,13922,3,'Media 1   Media'),
	(4,13923,3,'Connect 1   Connect'),
	(5,13924,3,'Donate 1   Donate'),
	(7,13925,3,'About Jon Micah 2  About About No 1   No No   About Jon Micah'),
	(30,13926,3,'Who We Are 3  About About No 1   No No   Who We Are'),
	(9,13927,3,'Why We Exist 3  About About No 1   No No   Why We Exist'),
	(31,13928,3,'What We Believe 5  About About No 1   No No   What We Believe'),
	(23,13932,3,'home 10   Home'),
	(29,13930,7,'WHAT IS EOTA? \n\n“And Jesus came and spoke to them, saying, “All authority has been given to Me in heaven and on earth. Go therefore and make disciples of all the nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all things that I have commanded you; and lo, I am with you always, even to the end of the age.” Amen.” Matthew 28:18-20p        \n\nEnd of The Age ministries is an evangelical organization committed to sharing the Gospel of Jesus Christ in response to the “Great Commission” outlined in the Bible at the end of Matthew 28.  \n\nOur Goal \n\nIt is our goal to evangelize to an increasingly non- Christian generation and to connect these new believers with Biblical teaching and local church organizations to help them grow in their newfound faith. \n\nOur Experience \n\nWith over a decade of event planning and touring experience, the EOTA Ministries staff have the unique ability to reach the next generation with effectiveness and efficiency through our evangelistic touring format and our use of modern communication technology. \n\nOur Team \n\nEOTA Ministries was incorporated by Jon Micah Sumrall in 2012, and is a non profit, 501c3 organization. Our current office is located in Portland, OR.  About EOTA About EOTA No 3    Full Width Images  Verses  Text   No   About About No 1   No No   No No'),
	(34,13933,7,'Why Does EOTA Exist? \n\nIt is imperative that we spread the gospel to this generation and find ways to help them create a firm biblical foundation.  \n\nThe Statistics \n\nStatistics are showing a clear decline of Evangelical Christianity in the United States while we are simultaneously seeing the secularization of the church: \n\n\n53% of U.S. leaders said the state of Evangelicalism is worse than it was five years ago, and 48 percent said they expect it to grow worse in the next five years. \n“The un-churched population in the United States is so extensive that, were it a nation, it would be the fifth-largest on the planet… Researchers and analysts describe North America as the world’s third-largest mission field.” [CITATION NEEDED] \nOnly 33% of mainline churchgoers agree that there are absolute standards for what is right and wrong \nOnly 36% of Evangelical Church goers believe that their religion is the one, true faith leading to eternal life while 57% believed many religions can lead to everlasting life. \n65% of 18-30 year olds who have previously attended church regularly leave the church \n \n\nThe Need \n\nIt is apparent that the need for true evangelism along with Biblical values and worldview are increasingly needed in our country. We believe right NOW is a critical time. The consequences of not reaching the next generation with the absolute truth of the gospel will be dire.  Jesus said in John 14:6 “I am the way, the truth, and the life. No one comes to the father except through me.” This is the message that needs to be shared to heal this next generation and reverse the course of moral pragmatism that has become prevalent in our culture. \n\nThe Scope \n\nWe plan to organize outreach events initially across the United States and eventually, Lord willing, follow the calling of the “Great Commission” in Matthew 28 to share the Gospel with as many nations as possible around the globe. Our initial scope begins within the United States because we see not only a great need for evangelism and revival in this country, but also a great opportunity. The infrastructure necessary to host large scale events coupled with the modern technology and networking we enjoy in this country allow us to have the potential to reach an extremely large audience across a large geographic area. \n\nWe intend for these events to be held free of charge. A partnership with local churches in each city will be vital to effectively producing these events. We will rely upon them to help promote the event to their community, aid in raising funds to make the events possible, provide counselors at the event, and follow-up with new believers. \n\nThe founders of EOTA Ministries have over 10 years of professional touring experience with the band Kutless and have been a part of numerous large festivals, crusades, fairs, conferences, tours, and events. We believe this experience will enable us to produce successful, professional, and effective events that can have an impact on the lives of thousands.  Why We Exist Why We Exist No 4    Full Width Images  Verses  Text   No   About About No 1   No No   No No'),
	(44,13935,7,'Help Support Our Cause \n\n \n\nDonate $50   Donate Donate No 9    Full Width Images  Verses  Text   No    No No');

/*!40000 ALTER TABLE `sym_search_index` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_search_index_entry_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_entry_keywords`;

CREATE TABLE `sym_search_index_entry_keywords` (
  `entry_id` int(11) DEFAULT NULL,
  `keyword_id` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  KEY `entry_id` (`entry_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_search_index_entry_keywords` WRITE;
/*!40000 ALTER TABLE `sym_search_index_entry_keywords` DISABLE KEYS */;

INSERT INTO `sym_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`)
VALUES
	(13920,1,2),
	(13921,2,2),
	(13922,3,2),
	(13923,4,2),
	(13924,5,2),
	(13925,9,2),
	(13925,8,2),
	(13925,1,4),
	(13926,872,2),
	(13926,1,2),
	(13927,1,2),
	(13927,11,2),
	(13927,12,2),
	(13928,854,2),
	(13928,586,2),
	(13928,1,2),
	(13930,959,1),
	(13930,958,1),
	(13930,957,1),
	(13930,956,2),
	(13930,955,1),
	(13930,954,1),
	(13930,953,2),
	(13930,952,1),
	(13930,951,2),
	(13930,950,1),
	(13930,949,1),
	(13930,948,1),
	(13930,947,1),
	(13930,946,1),
	(13930,945,2),
	(13930,944,1),
	(13930,943,1),
	(13930,942,3),
	(13930,941,3),
	(13930,940,1),
	(13930,939,2),
	(13930,938,1),
	(13930,937,3),
	(13930,936,3),
	(13930,935,2),
	(13930,934,1),
	(13930,933,2),
	(13930,932,1),
	(13930,931,1),
	(13930,930,1),
	(13930,929,2),
	(13930,928,1),
	(13930,927,1),
	(13930,926,1),
	(13930,925,1),
	(13930,924,1),
	(13930,923,1),
	(13930,922,1),
	(13930,921,1),
	(13930,920,1),
	(13930,919,1),
	(13930,918,1),
	(13930,917,1),
	(13930,916,1),
	(13930,915,1),
	(13930,914,4),
	(13930,913,1),
	(13930,912,1),
	(13930,911,1),
	(13930,907,1),
	(13932,432,2),
	(13930,788,1),
	(13930,897,1),
	(13930,662,1),
	(13930,661,1),
	(13930,660,1),
	(13930,659,1),
	(13930,658,1),
	(13930,586,1),
	(13930,588,25),
	(13930,591,1),
	(13930,595,1),
	(13930,596,2),
	(13930,604,9),
	(13930,607,1),
	(13930,610,2),
	(13930,611,15),
	(13930,615,4),
	(13930,624,1),
	(13930,623,1),
	(13930,622,4),
	(13930,621,1),
	(13930,619,1),
	(13930,633,2),
	(13930,637,1),
	(13930,640,1),
	(13930,648,1),
	(13930,616,1),
	(13930,14,1),
	(13930,10,5),
	(13930,8,1),
	(13930,9,1),
	(13930,4,1),
	(13930,1,4),
	(13933,1499,1),
	(13933,1498,1),
	(13933,1497,1),
	(13933,1496,2),
	(13933,1495,1),
	(13933,1494,1),
	(13933,1493,1),
	(13933,1492,1),
	(13933,1491,1),
	(13933,1490,1),
	(13933,1489,1),
	(13933,1488,1),
	(13933,1487,1),
	(13933,1486,2),
	(13933,1485,1),
	(13933,1484,1),
	(13933,1483,2),
	(13933,1482,1),
	(13933,1481,1),
	(13933,1480,1),
	(13933,1479,1),
	(13933,1478,1),
	(13933,1477,1),
	(13933,1476,4),
	(13933,1475,1),
	(13933,1474,1),
	(13933,1473,1),
	(13933,1472,1),
	(13933,1471,1),
	(13933,1470,1),
	(13933,1469,1),
	(13933,1468,1),
	(13933,1467,4),
	(13933,1466,1),
	(13933,1465,1),
	(13933,1464,1),
	(13933,1463,1),
	(13933,1462,1),
	(13933,1461,1),
	(13933,1460,1),
	(13933,1459,1),
	(13933,1458,1),
	(13933,1457,1),
	(13933,1456,1),
	(13933,1455,1),
	(13933,1454,1),
	(13933,1453,1),
	(13933,1452,1),
	(13933,1451,1),
	(13933,1450,6),
	(13933,1449,1),
	(13933,1448,1),
	(13933,1447,1),
	(13933,1446,1),
	(13933,1445,1),
	(13933,1444,1),
	(13933,1443,1),
	(13933,1442,2),
	(13933,1441,1),
	(13933,1440,1),
	(13933,1439,1),
	(13933,1438,2),
	(13933,1437,1),
	(13933,1436,1),
	(13933,1435,2),
	(13933,1434,2),
	(13933,1433,1),
	(13933,1432,2),
	(13933,1431,1),
	(13933,1430,1),
	(13933,1429,1),
	(13933,1428,2),
	(13933,1427,1),
	(13933,1426,1),
	(13933,1425,1),
	(13933,1424,2),
	(13933,1423,2),
	(13933,1422,1),
	(13933,1421,1),
	(13933,1420,1),
	(13933,1419,1),
	(13933,1418,1),
	(13933,1417,1),
	(13933,1416,1),
	(13933,1415,1),
	(13933,1414,1),
	(13933,1413,1),
	(13933,1412,1),
	(13933,1411,1),
	(13933,1410,1),
	(13933,1409,2),
	(13933,1408,1),
	(13933,1407,1),
	(13933,1406,1),
	(13933,1405,5),
	(13933,1404,2),
	(13933,1403,1),
	(13933,1402,2),
	(13933,1401,1),
	(13933,1400,1),
	(13933,1399,1),
	(13933,1398,1),
	(13933,1397,3),
	(13933,1396,1),
	(13933,1395,1),
	(13933,1394,1),
	(13933,1393,2),
	(13933,1392,1),
	(13933,1391,6),
	(13933,1390,1),
	(13933,1389,1),
	(13933,1388,1),
	(13933,1387,1),
	(13933,1386,1),
	(13933,1385,4),
	(13933,1384,1),
	(13933,1383,1),
	(13933,1382,1),
	(13933,1381,3),
	(13933,1380,2),
	(13933,1379,1),
	(13933,1378,2),
	(13933,1377,1),
	(13933,1376,1),
	(13933,1375,3),
	(13933,1374,1),
	(13933,1373,1),
	(13933,1372,2),
	(13933,1371,2),
	(13933,1370,2),
	(13933,1369,2),
	(13933,1368,1),
	(13933,1367,1),
	(13933,1366,2),
	(13933,1365,4),
	(13933,1364,1),
	(13933,1363,2),
	(13933,1362,1),
	(13933,1361,1),
	(13933,1360,1),
	(13933,1359,1),
	(13933,1358,1),
	(13933,1357,3),
	(13933,1356,2),
	(13933,1355,1),
	(13933,1354,1),
	(13933,1353,2),
	(13933,1352,1),
	(13933,1351,2),
	(13933,1350,1),
	(13933,1349,1),
	(13933,1348,1),
	(13933,1347,1),
	(13930,960,1),
	(13930,961,2),
	(13930,962,1),
	(13930,963,1),
	(13930,964,1),
	(13930,965,1),
	(13930,966,2),
	(13930,967,1),
	(13930,968,1),
	(13930,969,1),
	(13930,970,1),
	(13930,971,1),
	(13930,972,1),
	(13930,973,1),
	(13930,974,1),
	(13930,975,1),
	(13930,976,1),
	(13930,977,1),
	(13930,978,1),
	(13930,979,1),
	(13930,980,1),
	(13930,981,1),
	(13930,982,1),
	(13930,983,1),
	(13930,984,1),
	(13930,985,1),
	(13930,986,1),
	(13930,987,1),
	(13930,988,1),
	(13926,797,2),
	(13933,1346,1),
	(13933,1345,1),
	(13933,1344,1),
	(13933,1343,1),
	(13933,1342,2),
	(13933,1341,1),
	(13933,1340,1),
	(13933,1339,1),
	(13933,1338,1),
	(13933,1337,1),
	(13933,1336,1),
	(13933,1335,1),
	(13933,1334,1),
	(13933,1333,3),
	(13933,1332,2),
	(13933,1331,1),
	(13933,1330,2),
	(13933,1329,1),
	(13933,1328,5),
	(13933,1327,3),
	(13933,1326,1),
	(13933,1325,1),
	(13933,1324,1),
	(13933,1323,1),
	(13933,1322,1),
	(13933,1321,1),
	(13933,1320,2),
	(13933,1319,4),
	(13933,1318,4),
	(13933,1317,1),
	(13933,1316,1),
	(13933,1315,1),
	(13933,1314,1),
	(13933,1313,2),
	(13933,1312,1),
	(13933,1311,1),
	(13933,1310,1),
	(13933,1309,1),
	(13933,1308,1),
	(13933,1307,6),
	(13933,1306,1),
	(13933,1305,1),
	(13933,1304,1),
	(13933,978,1),
	(13933,976,1),
	(13933,970,3),
	(13933,966,1),
	(13933,964,10),
	(13933,962,1),
	(13933,961,2),
	(13933,907,1),
	(13933,788,8),
	(13933,797,8),
	(13933,854,5),
	(13933,872,1),
	(13933,897,1),
	(13933,662,1),
	(13933,661,1),
	(13933,660,1),
	(13933,659,1),
	(13933,658,1),
	(13933,586,1),
	(13933,588,52),
	(13933,591,3),
	(13933,916,1),
	(13933,595,3),
	(13933,596,1),
	(13933,921,1),
	(13933,923,1),
	(13933,604,6),
	(13933,607,1),
	(13933,610,3),
	(13933,611,17),
	(13933,615,8),
	(13933,939,1),
	(13933,624,2),
	(13933,623,1),
	(13933,622,2),
	(13933,621,2),
	(13933,619,7),
	(13933,941,1),
	(13933,633,5),
	(13933,637,3),
	(13933,947,3),
	(13933,948,1),
	(13933,640,1),
	(13933,648,1),
	(13933,955,2),
	(13933,957,1),
	(13933,956,1),
	(13933,958,1),
	(13933,616,2),
	(13933,14,1),
	(13933,12,3),
	(13933,11,3),
	(13933,10,2),
	(13933,2,7),
	(13933,1,2),
	(13935,1524,1),
	(13935,1523,1),
	(13935,662,1),
	(13935,661,1),
	(13935,660,1),
	(13935,659,1),
	(13935,658,1),
	(13935,604,1),
	(13935,621,1),
	(13935,5,3);

/*!40000 ALTER TABLE `sym_search_index_entry_keywords` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_search_index_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_keywords`;

CREATE TABLE `sym_search_index_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_search_index_keywords` WRITE;
/*!40000 ALTER TABLE `sym_search_index_keywords` DISABLE KEYS */;

INSERT INTO `sym_search_index_keywords` (`id`, `keyword`)
VALUES
	(1,'about'),
	(2,'events'),
	(3,'media'),
	(4,'connect'),
	(5,'donate'),
	(9,'micah'),
	(8,'jon'),
	(10,'eota'),
	(11,'why'),
	(12,'exist'),
	(1382,'everlasting'),
	(14,'faith'),
	(616,'biblical'),
	(959,'organizations'),
	(958,'local'),
	(956,'new'),
	(957,'believers'),
	(955,'these'),
	(648,'was'),
	(954,'christian'),
	(953,'non'),
	(952,'evangelize'),
	(951,'goal'),
	(950,'bible'),
	(949,'outlined'),
	(640,'through'),
	(948,'commission'),
	(947,'great'),
	(946,'response'),
	(637,'next'),
	(945,'christ'),
	(944,'sharing'),
	(943,'committed'),
	(633,'have'),
	(942,'organization'),
	(941,'ministries'),
	(931,'things'),
	(932,'commanded'),
	(619,'church'),
	(933,'you'),
	(621,'help'),
	(622,'them'),
	(623,'grow'),
	(624,'their'),
	(934,'always'),
	(935,'even'),
	(936,'end'),
	(937,'age'),
	(938,'amen'),
	(939,'matthew'),
	(940,'28:18-20p'),
	(432,'home'),
	(615,'with'),
	(930,'observe'),
	(929,'teaching'),
	(928,'spirit'),
	(611,'and'),
	(610,'generation'),
	(927,'holy'),
	(926,'son'),
	(607,'increasingly'),
	(925,'name'),
	(924,'baptizing'),
	(604,'our'),
	(923,'nations'),
	(922,'disciples'),
	(921,'make'),
	(920,'therefore'),
	(919,'earth'),
	(918,'heaven'),
	(917,'given'),
	(596,'jesus'),
	(595,'gospel'),
	(916,'been'),
	(915,'authority'),
	(914,'all'),
	(591,'evangelical'),
	(911,'came'),
	(588,'the'),
	(912,'spoke'),
	(913,'saying'),
	(586,'what'),
	(960,'newfound'),
	(658,'full'),
	(659,'width'),
	(660,'images'),
	(661,'verses'),
	(662,'text'),
	(1384,'18-30'),
	(897,'father'),
	(1385,'year'),
	(1386,'olds'),
	(1387,'previously'),
	(1388,'attended'),
	(1389,'regularly'),
	(1390,'leave'),
	(1391,'need'),
	(1392,'apparent'),
	(1393,'evangelism'),
	(1394,'along'),
	(1395,'values'),
	(1396,'worldview'),
	(1480,'counselors'),
	(1479,'provide'),
	(1478,'funds'),
	(1477,'raising'),
	(1476,'aid'),
	(872,'who'),
	(1475,'community'),
	(1474,'promote'),
	(1473,'upon'),
	(1472,'rely'),
	(1471,'producing'),
	(1470,'effectively'),
	(1469,'vital'),
	(1468,'city'),
	(1467,'each'),
	(1466,'churches'),
	(1465,'partnership'),
	(1464,'charge'),
	(1463,'free'),
	(1462,'held'),
	(1461,'intend'),
	(1460,'area'),
	(854,'believe'),
	(1459,'geographic'),
	(1458,'audience'),
	(1457,'extremely'),
	(1456,'potential'),
	(1455,'allow'),
	(1454,'enjoy'),
	(1453,'networking'),
	(1452,'coupled'),
	(1451,'scale'),
	(1450,'large'),
	(1449,'host'),
	(1448,'necessary'),
	(1447,'infrastructure'),
	(1446,'opportunity'),
	(1445,'also'),
	(1444,'but'),
	(1443,'revival'),
	(1442,'see'),
	(1441,'because'),
	(1440,'within'),
	(1439,'begins'),
	(1438,'initial'),
	(1437,'globe'),
	(1436,'around'),
	(1435,'possible'),
	(1434,'share'),
	(1433,'calling'),
	(1432,'follow'),
	(1431,'willing'),
	(1430,'lord'),
	(1429,'eventually'),
	(1428,'across'),
	(1427,'initially'),
	(1426,'outreach'),
	(1425,'organize'),
	(1424,'plan'),
	(1423,'scope'),
	(1422,'culture'),
	(1421,'prevalent'),
	(1420,'become'),
	(1419,'pragmatism'),
	(1418,'moral'),
	(1417,'course'),
	(1416,'reverse'),
	(1414,'shared'),
	(1415,'heal'),
	(1413,'needs'),
	(1412,'message'),
	(1411,'except'),
	(1410,'comes'),
	(1409,'way'),
	(797,'are'),
	(1408,'14:6'),
	(1407,'john'),
	(1406,'dire'),
	(1405,'will'),
	(1404,'truth'),
	(1403,'reaching'),
	(1402,'not'),
	(788,'that'),
	(1397,'country'),
	(1398,'now'),
	(1399,'critical'),
	(1400,'time'),
	(1401,'consequences'),
	(907,'has'),
	(1383,'65%'),
	(961,'experience'),
	(962,'over'),
	(963,'decade'),
	(964,'event'),
	(965,'planning'),
	(966,'touring'),
	(967,'staff'),
	(968,'unique'),
	(969,'ability'),
	(970,'reach'),
	(971,'effectiveness'),
	(972,'efficiency'),
	(973,'evangelistic'),
	(974,'format'),
	(975,'use'),
	(976,'modern'),
	(977,'communication'),
	(978,'technology'),
	(979,'team'),
	(980,'incorporated'),
	(981,'sumrall'),
	(982,'2012'),
	(983,'profit'),
	(984,'501c3'),
	(985,'current'),
	(986,'office'),
	(987,'located'),
	(988,'portland'),
	(1381,'lead'),
	(1380,'can'),
	(1377,'believed'),
	(1378,'many'),
	(1379,'religions'),
	(1376,'57%'),
	(1375,'life'),
	(1374,'eternal'),
	(1373,'leading'),
	(1372,'true'),
	(1371,'one'),
	(1370,'religion'),
	(1369,'goers'),
	(1368,'36%'),
	(1367,'wrong'),
	(1366,'right'),
	(1365,'for'),
	(1364,'standards'),
	(1363,'absolute'),
	(1362,'there'),
	(1361,'agree'),
	(1360,'churchgoers'),
	(1359,'mainline'),
	(1358,'33%'),
	(1357,'only'),
	(1356,'needed'),
	(1355,'citation'),
	(1354,'field'),
	(1353,'mission'),
	(1352,'third-largest'),
	(1351,'world'),
	(1350,'america'),
	(1349,'north'),
	(1348,'describe'),
	(1347,'analysts'),
	(1346,'researchers'),
	(1345,'planet'),
	(1344,'fifth-largest'),
	(1343,'would'),
	(1342,'nation'),
	(1341,'were'),
	(1340,'extensive'),
	(1339,'population'),
	(1338,'un-churched'),
	(1337,'expect'),
	(1336,'they'),
	(1335,'percent'),
	(1334,'ago'),
	(1333,'years'),
	(1332,'five'),
	(1331,'than'),
	(1330,'worse'),
	(1329,'evangelicalism'),
	(1328,'state'),
	(1327,'said'),
	(1326,'leaders'),
	(1325,'u.s'),
	(1324,'53%'),
	(1323,'secularization'),
	(1322,'seeing'),
	(1321,'simultaneously'),
	(1320,'while'),
	(1319,'states'),
	(1318,'united'),
	(1317,'christianity'),
	(1316,'decline'),
	(1315,'clear'),
	(1314,'showing'),
	(1313,'statistics'),
	(1312,'foundation'),
	(1311,'firm'),
	(1310,'create'),
	(1309,'ways'),
	(1308,'find'),
	(1307,'this'),
	(1306,'spread'),
	(1305,'imperative'),
	(1304,'does'),
	(1481,'follow-up'),
	(1482,'founders'),
	(1483,'professional'),
	(1484,'band'),
	(1485,'kutless'),
	(1486,'part'),
	(1487,'numerous'),
	(1488,'festivals'),
	(1489,'crusades'),
	(1490,'fairs'),
	(1491,'conferences'),
	(1492,'tours'),
	(1493,'enable'),
	(1494,'produce'),
	(1495,'successful'),
	(1496,'effective'),
	(1497,'impact'),
	(1498,'lives'),
	(1499,'thousands'),
	(1524,'cause'),
	(1523,'support');

/*!40000 ALTER TABLE `sym_search_index_keywords` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_search_index_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_logs`;

CREATE TABLE `sym_search_index_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `keywords_manipulated` varchar(255) DEFAULT NULL,
  `sections` varchar(255) DEFAULT NULL,
  `page` int(11) NOT NULL,
  `results` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_search_index_logs` WRITE;
/*!40000 ALTER TABLE `sym_search_index_logs` DISABLE KEYS */;

INSERT INTO `sym_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`)
VALUES
	(1,'2012-06-02 00:18:19','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5623,'2012-06-08 22:13:14','ministry','ministry','text',1,12,'f689llb4l1mp2ctppv73dpd7n4'),
	(5624,'2012-06-08 22:24:37','Bible','bible','text',1,16,'f689llb4l1mp2ctppv73dpd7n4'),
	(3,'2012-06-02 00:19:07','sundeay','sundeay','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5622,'2012-06-08 21:47:10','ministry','ministry','tags',1,7,'f689llb4l1mp2ctppv73dpd7n4'),
	(5,'2012-06-02 00:19:20','sunday','sunday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,823,'jru7j11o1vlq0jt96bua5178u2'),
	(5620,'2012-06-08 21:41:43','love','love','events',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5621,'2012-06-08 21:47:03','love','love','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5619,'2012-06-08 21:41:37','love','love','teachings',1,35,'f689llb4l1mp2ctppv73dpd7n4'),
	(8,'2012-06-02 00:25:41','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5617,'2012-06-08 21:20:48','love','love','events',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5618,'2012-06-08 21:41:37','love','love','events',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5616,'2012-06-08 21:20:42','love','love','teachings',1,35,'f689llb4l1mp2ctppv73dpd7n4'),
	(5614,'2012-06-08 21:16:53','love','love','events',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5615,'2012-06-08 21:19:44','love','love','teachings',1,35,'f689llb4l1mp2ctppv73dpd7n4'),
	(12,'2012-06-02 00:26:47','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5613,'2012-06-08 21:16:46','love','love','downloads',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5612,'2012-06-08 20:46:20','love','love','teachings',1,35,'f689llb4l1mp2ctppv73dpd7n4'),
	(15,'2012-06-02 00:27:27','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5611,'2012-06-08 20:45:54','love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,52,'f689llb4l1mp2ctppv73dpd7n4'),
	(5610,'2012-06-08 15:57:03','love','love','teachings,teachings-tags,teachings-series',1,39,'f689llb4l1mp2ctppv73dpd7n4'),
	(5609,'2012-06-08 15:49:38','predestination','predestination','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(19,'2012-06-02 00:29:12','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(21,'2012-06-02 00:29:21','reveal','reveal','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(5608,'2012-06-08 15:25:50','predestination','predestination','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(23,'2012-06-02 00:29:39','new here','new here','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jru7j11o1vlq0jt96bua5178u2'),
	(5607,'2012-06-08 15:25:38','jesus','jesus','teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(25,'2012-06-02 00:30:03','new here','new here','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jru7j11o1vlq0jt96bua5178u2'),
	(5606,'2012-06-08 15:25:32','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,264,'jru7j11o1vlq0jt96bua5178u2'),
	(27,'2012-06-02 00:30:59','new here','new here','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jru7j11o1vlq0jt96bua5178u2'),
	(5605,'2012-06-08 15:24:01','predestination','predestination','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(29,'2012-06-02 00:31:17','micah','micah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(5604,'2012-06-08 15:20:57','predestination','predestination','teachings,teachings-tags,teachings-series',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(31,'2012-06-02 00:32:36','womans ministry','womans ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5603,'2012-06-08 15:02:01','Ministry','ministry','text',1,12,'f689llb4l1mp2ctppv73dpd7n4'),
	(33,'2012-06-02 00:32:43','womens ministry','womens ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5602,'2012-06-08 15:01:24','Ministry','ministry','teachings-tags',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(35,'2012-06-02 00:32:49','women','women','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'jru7j11o1vlq0jt96bua5178u2'),
	(5600,'2012-06-08 15:01:15','Ministry','ministry','events-recurring',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5601,'2012-06-08 15:01:20','Ministry','ministry','teachings-series',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5599,'2012-06-08 15:00:57','Ministry','ministry','text',1,12,'f689llb4l1mp2ctppv73dpd7n4'),
	(5597,'2012-06-08 15:00:43','Ministry','ministry','tags',1,7,'f689llb4l1mp2ctppv73dpd7n4'),
	(5598,'2012-06-08 15:00:50','Ministry','ministry','events',1,5,'f689llb4l1mp2ctppv73dpd7n4'),
	(5596,'2012-06-08 15:00:38','Jesus','jesus','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5594,'2012-06-08 14:59:24','Jesus','jesus','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5595,'2012-06-08 14:59:30','Jesus','jesus','text',1,15,'f689llb4l1mp2ctppv73dpd7n4'),
	(41,'2012-06-02 00:34:23','womens ministry','womens ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5593,'2012-06-08 14:59:20','Jesus','jesus','downloads',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5591,'2012-06-08 14:58:50','Jesus','jesus','events-recurring',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(5592,'2012-06-08 14:59:17','Jesus','jesus','downloads',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5590,'2012-06-08 14:58:42','Jesus','jesus','downloads',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(45,'2012-06-02 00:35:06','womens ministry','womens ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5588,'2012-06-08 14:55:51','Jesus','jesus','teachings-series',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5589,'2012-06-08 14:57:13','Jesus','jesus','teachings-tags',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5587,'2012-06-08 14:55:47','Jesus','jesus','teachings-tags',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5586,'2012-06-08 14:55:42','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,264,'f689llb4l1mp2ctppv73dpd7n4'),
	(49,'2012-06-02 00:35:36','women\'s ministry','women\'s ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5585,'2012-06-08 14:55:16','Jesus','jesus','text',1,15,'f689llb4l1mp2ctppv73dpd7n4'),
	(51,'2012-06-02 00:35:41','women','women','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'jru7j11o1vlq0jt96bua5178u2'),
	(5584,'2012-06-08 14:54:56','Jesus','jesus','teachings',1,243,'f689llb4l1mp2ctppv73dpd7n4'),
	(53,'2012-06-02 00:35:59','grow in the church','grow in the church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'jru7j11o1vlq0jt96bua5178u2'),
	(5583,'2012-06-08 14:54:47','Jesus','jesus','teachings-tags',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(55,'2012-06-02 00:36:10','\"grow in the church\"','\"grow in the church\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5582,'2012-06-08 14:54:40','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,264,'f689llb4l1mp2ctppv73dpd7n4'),
	(57,'2012-06-02 00:36:18','\"good news\"','\"good news\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(5581,'2012-06-08 14:54:30','Holy Spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'f689llb4l1mp2ctppv73dpd7n4'),
	(59,'2012-06-02 00:38:47','new here','new here','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jru7j11o1vlq0jt96bua5178u2'),
	(5580,'2012-06-08 14:54:24','Holy Spirit','holy spirit','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(61,'2012-06-02 00:39:27','\"good news\"','\"good news\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(5578,'2012-06-08 14:51:37','Jesus','jesus','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5579,'2012-06-08 14:54:14','Bible','bible','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(63,'2012-06-02 00:39:40','africa','africa','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5577,'2012-06-08 14:51:29','holy spirit','holy spirit','tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(65,'2012-06-02 00:39:48','india','india','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5576,'2012-06-08 14:51:24','holy spirit','holy spirit','teachings-tags',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(67,'2012-06-02 00:39:55','revlation','revlation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5575,'2012-06-08 14:51:04','holy spirit','holy spirit','teachings-tags',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(69,'2012-06-02 00:40:03','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,85,'jru7j11o1vlq0jt96bua5178u2'),
	(5574,'2012-06-08 14:50:54','holy spirit','holy spirit','teachings-tags',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(71,'2012-06-02 00:40:34','lion','lion','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'jru7j11o1vlq0jt96bua5178u2'),
	(5573,'2012-06-08 14:50:35','The Holy Spirit','the holy spirit','teachings-tags',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5572,'2012-06-08 14:49:34','The Holy Spirit','the holy spirit','teachings,teachings-tags,teachings-series',1,17,'f689llb4l1mp2ctppv73dpd7n4'),
	(5571,'2012-06-06 20:28:25','David','david','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'3isji0arc8cmatd39dbfag29q6'),
	(5570,'2012-06-06 20:28:20','homosexuality','homosexuality','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'3isji0arc8cmatd39dbfag29q6'),
	(77,'2012-06-02 00:55:12','egypt','egypt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5569,'2012-06-06 20:28:06','homosexuality','homosexuality','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'3isji0arc8cmatd39dbfag29q6'),
	(5568,'2012-06-06 20:27:49','homosexuality','homosexuality','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'3isji0arc8cmatd39dbfag29q6'),
	(5567,'2012-06-06 20:27:33','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'3isji0arc8cmatd39dbfag29q6'),
	(5566,'2012-06-06 20:27:11','wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'3isji0arc8cmatd39dbfag29q6'),
	(5565,'2012-06-06 15:20:04','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'69cdjicgnaie75pp6p2jdjnda0'),
	(5564,'2012-06-06 15:18:55','bryn','bryn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'69cdjicgnaie75pp6p2jdjnda0'),
	(5563,'2012-06-06 10:14:33','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,263,'cenrvsdnnqbnc2p81cm8id7r15'),
	(5562,'2012-06-06 10:14:14','Jesus','jesus','teachings,teachings-tags,teachings-series',1,246,'cenrvsdnnqbnc2p81cm8id7r15'),
	(5561,'2012-06-05 17:51:20','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'3isji0arc8cmatd39dbfag29q6'),
	(5560,'2012-06-05 17:51:14','wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'3isji0arc8cmatd39dbfag29q6'),
	(5559,'2012-06-05 17:51:03','brett','brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'3isji0arc8cmatd39dbfag29q6'),
	(5558,'2012-06-04 15:44:40','bible','bible','events',1,12,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5556,'2012-06-04 15:44:25','these','these','teachings',1,26,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5557,'2012-06-04 15:44:27','bible','bible','teachings',1,789,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5555,'2012-06-04 15:44:21','thes','thes','teachings',1,53,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5553,'2012-06-04 15:43:55','these','these','teachings',1,26,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5554,'2012-06-04 15:43:58','thes','thes','teachings',1,53,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5552,'2012-06-04 15:43:48','bible','bible','teachings',1,789,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5551,'2012-06-04 15:43:28','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'9gvq4rbsbvofo0ou8rh47gfge1'),
	(5550,'2012-06-04 11:24:54','bib','bib','text',1,16,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5549,'2012-06-04 11:24:34','bib','bib','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,831,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5548,'2012-06-04 11:24:30','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5547,'2012-06-04 11:23:39','fire','fire','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5546,'2012-06-04 11:23:28','fire cross','fire cross','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5545,'2012-06-04 11:23:12','job','job','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'mpvi6t83lv4e5qa1hi56j614t5'),
	(5544,'2012-06-04 11:20:17','Holy Spirit','holy spirit','teachings-tags',1,1,'2mg1qr1b52vrot9cakmtkk5072'),
	(5543,'2012-06-04 11:19:56','Holy Spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'2mg1qr1b52vrot9cakmtkk5072'),
	(5542,'2012-06-04 11:19:40','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,263,'2mg1qr1b52vrot9cakmtkk5072'),
	(5541,'2012-06-04 11:19:05','Brett Meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'2mg1qr1b52vrot9cakmtkk5072'),
	(5540,'2012-06-04 10:39:05','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5539,'2012-06-04 10:36:43','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5538,'2012-06-04 10:36:37','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5537,'2012-06-04 10:35:57','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5536,'2012-06-04 10:34:50','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5535,'2012-06-04 10:27:21','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5534,'2012-06-04 10:27:07','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5533,'2012-06-04 10:15:52','proxima','proxima','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5531,'2012-06-03 19:55:10','jesus','jesus','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(5532,'2012-06-03 21:39:59','Bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'p33m4lvpjj5rnoja85024q1a67'),
	(5530,'2012-06-03 19:55:03','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,263,'jru7j11o1vlq0jt96bua5178u2'),
	(5529,'2012-06-03 19:53:37','form','form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,27,'jru7j11o1vlq0jt96bua5178u2'),
	(5528,'2012-06-03 19:53:06','timothy','timothy','teachings,teachings-tags,teachings-series',1,27,'jru7j11o1vlq0jt96bua5178u2'),
	(5527,'2012-06-03 19:52:57','tim','tim','teachings,teachings-tags,teachings-series',1,126,'jru7j11o1vlq0jt96bua5178u2'),
	(5526,'2012-06-03 19:51:55','events','events','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,24,'jru7j11o1vlq0jt96bua5178u2'),
	(5525,'2012-06-03 19:51:12','ice','ice','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,48,'jru7j11o1vlq0jt96bua5178u2'),
	(5524,'2012-06-03 19:50:45','ice cream','ice cream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5523,'2012-06-03 18:17:15','boat','boat','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(134,'2012-06-02 10:55:23','egypt','egypt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5522,'2012-06-03 18:17:04','boating','boating','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(136,'2012-06-02 10:55:30','providence','providence','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5521,'2012-06-03 18:16:46','boats','boats','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(138,'2012-06-02 10:55:39','brett','brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(5520,'2012-06-03 16:59:43','demo','demo','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'jru7j11o1vlq0jt96bua5178u2'),
	(140,'2012-06-02 10:56:45','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,820,'jru7j11o1vlq0jt96bua5178u2'),
	(6559,'2012-07-11 11:09:52','Holy spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6558,'2012-07-11 11:09:12','Holy spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6557,'2012-07-11 10:48:57','weiss','weiss','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'oo10lm4so4ha98hc75lgh0dt46'),
	(6556,'2012-07-11 10:40:47','weiss','weiss','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'oo10lm4so4ha98hc75lgh0dt46'),
	(6555,'2012-07-11 10:40:45','weiss','weiss','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ohmf83l9emlnab649o4okciba2'),
	(6554,'2012-07-11 10:37:57','north plains','north plains','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'oo10lm4so4ha98hc75lgh0dt46'),
	(6553,'2012-07-11 10:37:56','north plains','north plains','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'ohmf83l9emlnab649o4okciba2'),
	(6552,'2012-07-11 10:27:17','youstream','youstream','teachings,teachings-tags,teachings-series',1,0,'uqrjfnmm9ftu2hehldhu2irfk0'),
	(6551,'2012-07-11 10:26:29','videos','videos','teachings,teachings-tags,teachings-series',1,0,'uqrjfnmm9ftu2hehldhu2irfk0'),
	(6550,'2012-07-11 10:22:36','coburn','coburn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ohmf83l9emlnab649o4okciba2'),
	(6549,'2012-07-11 09:39:15','exodus','exodus','teachings,teachings-tags,teachings-series',4,59,'sursr98mm1cjvh9mpsttogodl1'),
	(6548,'2012-07-11 09:39:00','exodus','exodus','teachings,teachings-tags,teachings-series',3,59,'sursr98mm1cjvh9mpsttogodl1'),
	(6547,'2012-07-11 09:38:45','exodus','exodus','teachings,teachings-tags,teachings-series',2,59,'sursr98mm1cjvh9mpsttogodl1'),
	(6546,'2012-07-11 09:38:33','exodus','exodus','teachings,teachings-tags,teachings-series',1,59,'sursr98mm1cjvh9mpsttogodl1'),
	(6545,'2012-07-11 09:06:57','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6544,'2012-07-11 09:06:49','zechariah','zechariah','teachings,teachings-tags,teachings-series',2,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6543,'2012-07-11 09:06:38','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6542,'2012-07-11 08:42:44','Hebrew 12','hebrew 12','teachings,teachings-tags,teachings-series',1,19,'a0l4gf9mbe8mb0bqr5ggcqsq97'),
	(6541,'2012-07-11 08:42:16','cloud of wittnesses','cloud of wittnesses','teachings,teachings-tags,teachings-series',1,0,'a0l4gf9mbe8mb0bqr5ggcqsq97'),
	(6540,'2012-07-11 08:41:54','C','c','teachings,teachings-tags,teachings-series',1,0,'a0l4gf9mbe8mb0bqr5ggcqsq97'),
	(6539,'2012-07-11 08:31:57','titus 2','titus 2','teachings,teachings-tags,teachings-series',1,6,'7h1up0efvn745eljegbaot7il3'),
	(6538,'2012-07-11 07:03:23','timon','timon','teachings,teachings-tags,teachings-series',1,2,'1aonqmuskdjuhpkna7ik0ng3p0'),
	(6537,'2012-07-11 07:02:56','what does','what does','teachings,teachings-tags,teachings-series',1,5,'1aonqmuskdjuhpkna7ik0ng3p0'),
	(6536,'2012-07-11 07:02:46','at does','at does','teachings,teachings-tags,teachings-series',1,13,'1aonqmuskdjuhpkna7ik0ng3p0'),
	(6535,'2012-07-11 07:02:36','what does godliness','what does godliness','teachings,teachings-tags,teachings-series',1,0,'1aonqmuskdjuhpkna7ik0ng3p0'),
	(6534,'2012-07-11 05:20:39','Titus','titus','teachings,teachings-tags,teachings-series',1,6,'omgogs5utnja1n26mdbf5urar4'),
	(6533,'2012-07-11 04:52:09','rapture','rapture','teachings,teachings-tags,teachings-series',1,10,'5n7378ucd2fn53pdekit9h6h93'),
	(6532,'2012-07-10 23:18:30','psalm 37','psalm 37','teachings,teachings-tags,teachings-series',5,97,'aioea7hls4cbjh47c5pvspqkt3'),
	(6531,'2012-07-10 23:18:15','psalm 37','psalm 37','teachings,teachings-tags,teachings-series',4,97,'aioea7hls4cbjh47c5pvspqkt3'),
	(6530,'2012-07-10 23:18:03','psalm 37','psalm 37','teachings,teachings-tags,teachings-series',3,97,'aioea7hls4cbjh47c5pvspqkt3'),
	(6529,'2012-07-10 23:17:47','psalm 37','psalm 37','teachings,teachings-tags,teachings-series',2,97,'aioea7hls4cbjh47c5pvspqkt3'),
	(6528,'2012-07-10 23:17:17','psalm 37','psalm 37','teachings,teachings-tags,teachings-series',1,97,'aioea7hls4cbjh47c5pvspqkt3'),
	(6527,'2012-07-10 22:52:15','Proverbs','proverbs','teachings,teachings-tags,teachings-series',5,43,'5umghnplho3lhbpafh2oncl545'),
	(6526,'2012-07-10 22:52:11','Proverbs','proverbs','teachings,teachings-tags,teachings-series',3,43,'5umghnplho3lhbpafh2oncl545'),
	(6525,'2012-07-10 22:52:01','Proverbs','proverbs','teachings,teachings-tags,teachings-series',2,43,'5umghnplho3lhbpafh2oncl545'),
	(6524,'2012-07-10 22:51:38','Proverbs','proverbs','teachings,teachings-tags,teachings-series',1,43,'5umghnplho3lhbpafh2oncl545'),
	(6523,'2012-07-10 22:51:02','Ten commandments','ten commandments','teachings,teachings-tags,teachings-series',1,10,'5umghnplho3lhbpafh2oncl545'),
	(6522,'2012-07-10 19:59:46','atthew 24','atthew 24','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6521,'2012-07-10 18:40:16','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,23,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6520,'2012-07-10 18:39:33','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6519,'2012-07-10 18:39:16','end times prophesy','end times prophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6518,'2012-07-10 18:39:10','end times prophesy','end times prophesy','teachings,teachings-tags,teachings-series',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6517,'2012-07-10 18:35:57','Mark 4:35-41','mark 4:35-41','teachings,teachings-tags,teachings-series',1,1,'jui49153cnkdojpc2l2q7cpla2'),
	(6516,'2012-07-10 18:02:04','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'5mdf18sd33os9i6r83ig2ejc74'),
	(6515,'2012-07-10 17:24:03','james','james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'pec78ar5djm0iks7sr6dcnvju5'),
	(6514,'2012-07-10 17:20:39','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,40,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6513,'2012-07-10 16:56:46','prophesy','prophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'307bllhacjotccgchtt444d3e6'),
	(6512,'2012-07-10 16:55:08','R-','r-','teachings-series',1,0,'307bllhacjotccgchtt444d3e6'),
	(6511,'2012-07-10 16:54:59','R-','r-','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'307bllhacjotccgchtt444d3e6'),
	(6510,'2012-07-10 16:53:48','Enoch','enoch','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'307bllhacjotccgchtt444d3e6'),
	(6509,'2012-07-10 16:53:40','Jared','jared','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'307bllhacjotccgchtt444d3e6'),
	(6508,'2012-07-10 16:53:30','Mahalalel','mahalalel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'307bllhacjotccgchtt444d3e6'),
	(6507,'2012-07-10 16:53:09','Kenan','kenan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'307bllhacjotccgchtt444d3e6'),
	(6506,'2012-07-10 16:52:56','enosh','enosh','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'307bllhacjotccgchtt444d3e6'),
	(6505,'2012-07-10 16:52:43','seth','seth','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'307bllhacjotccgchtt444d3e6'),
	(6504,'2012-07-10 16:50:40','adam','adam','teachings,teachings-tags,teachings-series',1,1,'307bllhacjotccgchtt444d3e6'),
	(6503,'2012-07-10 16:50:30','adam sons','adam sons','teachings,teachings-tags,teachings-series',1,0,'307bllhacjotccgchtt444d3e6'),
	(6502,'2012-07-10 15:21:19','simcoe','simcoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'g3cq7379ovpci6sdqul09rh6h4'),
	(6501,'2012-07-10 15:21:01','coburn','coburn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'g3cq7379ovpci6sdqul09rh6h4'),
	(6500,'2012-07-10 15:14:08','coburn','coburn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6499,'2012-07-10 14:31:17','through the bible study hebrews','through the bible study hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jf67uprqi1sics2ijuot0dhvv1'),
	(6498,'2012-07-10 14:30:53','through the bible study hebrews','through the bible study hebrews','teachings,teachings-tags,teachings-series',1,8,'jf67uprqi1sics2ijuot0dhvv1'),
	(6497,'2012-07-10 14:29:57','through the bible study','through the bible study','teachings,teachings-tags,teachings-series',1,746,'jf67uprqi1sics2ijuot0dhvv1'),
	(6496,'2012-07-10 14:28:46','hebrew','hebrew','teachings,teachings-tags,teachings-series',2,19,'jf67uprqi1sics2ijuot0dhvv1'),
	(6495,'2012-07-10 14:28:30','hebrew','hebrew','teachings,teachings-tags,teachings-series',1,19,'jf67uprqi1sics2ijuot0dhvv1'),
	(6494,'2012-07-10 13:36:30','Self-esteem','self-esteem','teachings,teachings-tags,teachings-series',1,1,'tf26an47gda259pdas0lpv2vr7'),
	(6493,'2012-07-10 13:36:07','Estem','estem','teachings,teachings-tags,teachings-series',1,0,'tf26an47gda259pdas0lpv2vr7'),
	(6492,'2012-07-10 13:29:56','business class','business class','teachings,teachings-tags,teachings-series',1,0,'4iovuhgjbprr7a83cr4hmnlep6'),
	(6491,'2012-07-10 12:59:13','2 Chronicles','2 chronicles','teachings,teachings-tags,teachings-series',1,42,'mluo4e4p1f1i9nu91kgfk8ovq2'),
	(6490,'2012-07-10 12:59:02','2','2','teachings,teachings-tags,teachings-series',1,0,'mluo4e4p1f1i9nu91kgfk8ovq2'),
	(6489,'2012-07-10 12:57:42','rick warren','rick warren','teachings-tags',1,1,'8n7mjrosvh5fdgn3i8ee61oma3'),
	(6488,'2012-07-10 12:57:39','1 Chronicles','1 chronicles','teachings,teachings-tags,teachings-series',1,42,'mluo4e4p1f1i9nu91kgfk8ovq2'),
	(6487,'2012-07-10 12:39:38','Romans','romans','teachings,teachings-tags,teachings-series',7,65,'4qr4fidr64ddfp743p08lkkkt4'),
	(6486,'2012-07-10 12:37:41','Romans 1','romans 1','teachings,teachings-tags,teachings-series',7,65,'4qr4fidr64ddfp743p08lkkkt4'),
	(6485,'2012-07-10 12:36:56','Romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'4qr4fidr64ddfp743p08lkkkt4'),
	(6484,'2012-07-10 12:36:42','Galatians','galatians','teachings,teachings-tags,teachings-series',1,19,'1k5jdemj2l7iajo3r6s26qonb0'),
	(6483,'2012-07-10 12:36:04','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'4qr4fidr64ddfp743p08lkkkt4'),
	(6482,'2012-07-10 12:13:17','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,36,'h70pdvfg1v787r0qgfu1muna67'),
	(6481,'2012-07-10 12:13:11','prophecy','prophecy','teachings,teachings-tags,teachings-series',4,36,'h70pdvfg1v787r0qgfu1muna67'),
	(6480,'2012-07-10 12:13:01','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,36,'h70pdvfg1v787r0qgfu1muna67'),
	(6479,'2012-07-10 11:20:34','old testament','old testament','teachings,teachings-tags,teachings-series',1,16,'449jk5oh62bdfhfvs6a349gf75'),
	(6478,'2012-07-10 10:53:19','Hello there. How are you','hello there. how are you','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'prl2aksljg4ih710limg2ck4c7'),
	(6477,'2012-07-10 09:53:15','Hottie Simcoe','hottie simcoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'chne63cgk8muo7eimadl1paj67'),
	(6476,'2012-07-10 08:09:16','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,36,'792h4dfiokfevh3rfd6q92mro1'),
	(6475,'2012-07-10 07:27:55','stheal','stheal','teachings,teachings-tags,teachings-series',1,0,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6474,'2012-07-10 07:27:36','stealing','stealing','teachings,teachings-tags,teachings-series',1,0,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6473,'2012-07-10 07:27:24','ing','ing','teachings,teachings-tags,teachings-series',1,636,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6472,'2012-07-10 07:27:13','steal','steal','teachings,teachings-tags,teachings-series',1,0,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6471,'2012-07-10 07:25:59','conscience','conscience','teachings,teachings-tags,teachings-series',1,3,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6470,'2012-07-10 07:25:35','courage','courage','teachings,teachings-tags,teachings-series',2,17,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6469,'2012-07-10 07:24:05','courage','courage','teachings,teachings-tags,teachings-series',1,17,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6468,'2012-07-10 07:23:47','power','power','teachings,teachings-tags,teachings-series',2,33,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6467,'2012-07-10 07:23:17','power','power','teachings,teachings-tags,teachings-series',1,33,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6466,'2012-07-10 07:17:47','Staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'uv2f8ald3arub4nupffmqubtf5'),
	(6465,'2012-07-10 06:12:23','Judges','judges','teachings,teachings-tags,teachings-series',1,18,'91d1v1lj26nuhqcksaqhsj4da2'),
	(6464,'2012-07-10 06:12:08','Judges','judges','teachings,teachings-tags,teachings-series',2,18,'91d1v1lj26nuhqcksaqhsj4da2'),
	(6463,'2012-07-10 06:11:40','Judges','judges','teachings,teachings-tags,teachings-series',1,18,'91d1v1lj26nuhqcksaqhsj4da2'),
	(6462,'2012-07-10 06:04:04','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6461,'2012-07-09 21:58:47','matthew','matthew','teachings,teachings-tags,teachings-series',4,82,'ou4e924tgeqslgif5nn14ab7p3'),
	(6460,'2012-07-09 21:57:53','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'ou4e924tgeqslgif5nn14ab7p3'),
	(6459,'2012-07-09 21:02:01','Paula Mansur','paula mansur','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'0im5l5a2o2dmn2o6lecbgsn2d0'),
	(6458,'2012-07-09 21:01:49','Paula Mansur','paula mansur','teachings,teachings-tags,teachings-series',1,0,'0im5l5a2o2dmn2o6lecbgsn2d0'),
	(6457,'2012-07-09 20:28:32','proverbs 20','proverbs 20','teachings,teachings-tags,teachings-series',2,43,'ao57egsb9627lbu771ti4qtfq6'),
	(6456,'2012-07-09 20:28:18','proverbs 20','proverbs 20','teachings,teachings-tags,teachings-series',1,43,'ao57egsb9627lbu771ti4qtfq6'),
	(6455,'2012-07-09 19:26:08','revelation','revelation','teachings-series',1,0,'jocu1qnaqi1id55cn2bavfcpv5'),
	(6454,'2012-07-09 19:25:58','revelation','revelation','downloads',1,0,'jocu1qnaqi1id55cn2bavfcpv5'),
	(6453,'2012-07-09 19:25:31','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'jocu1qnaqi1id55cn2bavfcpv5'),
	(6452,'2012-07-09 18:54:18','how to be saved','how to be saved','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'7aq9t717mef1andu3kbfdhq981'),
	(6451,'2012-07-09 18:53:39','how to be saved','how to be saved','teachings,teachings-tags,teachings-series',1,2,'7aq9t717mef1andu3kbfdhq981'),
	(6450,'2012-07-09 18:53:27','how to be saves','how to be saves','teachings,teachings-tags,teachings-series',1,1,'7aq9t717mef1andu3kbfdhq981'),
	(6449,'2012-07-09 18:53:00','scripture to share the gospel to be saved','scripture to share the gospel to be saved','teachings,teachings-tags,teachings-series',1,0,'7aq9t717mef1andu3kbfdhq981'),
	(6448,'2012-07-09 18:28:54','you tube','you tube','teachings',1,0,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6447,'2012-07-09 18:28:43','you tube','you tube','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6446,'2012-07-09 16:36:35','school supplies','school supplies','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7br549c0frvjvjv2o014f5h5r3'),
	(6445,'2012-07-09 16:26:43','calvin','calvin','teachings,teachings-tags,teachings-series',1,3,'q4fpodk7leqojsopcsmbraasd6'),
	(6444,'2012-07-09 15:07:28','Mormon','mormon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'1rrof7v5eeo98bsv4qvoi74c82'),
	(6443,'2012-07-09 14:10:15','will','will','teachings,teachings-tags,teachings-series',1,61,'g0dfudo90lhvs3g3isb6g326p2'),
	(6442,'2012-07-09 14:09:39','calling','calling','teachings,teachings-tags,teachings-series',1,4,'g0dfudo90lhvs3g3isb6g326p2'),
	(6441,'2012-07-09 12:35:37','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6440,'2012-07-09 12:32:09','zechariah','zechariah','teachings-series',1,0,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6439,'2012-07-09 12:31:53','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(276,'2012-06-02 12:52:40','bible','bible','tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6438,'2012-07-09 11:23:22','rapture','rapture','teachings,teachings-tags,teachings-series',1,10,'4bhg0vm62qqml66obgikfuqqj6'),
	(278,'2012-06-02 12:52:50','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6437,'2012-07-09 11:19:00','Matthew','matthew','teachings,teachings-tags,teachings-series',2,82,'uo6dkaaotq54ts1gcdv99qee23'),
	(6436,'2012-07-09 11:18:48','john 3','john 3','teachings,teachings-tags,teachings-series',1,95,'enats6hhv0sio9d9hslau9j9i3'),
	(6435,'2012-07-09 10:32:33','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',9,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6434,'2012-07-09 10:32:13','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',8,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(284,'2012-06-02 13:39:29','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(286,'2012-06-02 13:39:33','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6433,'2012-07-09 10:31:50','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',7,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(288,'2012-06-02 13:40:13','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6432,'2012-07-09 10:31:37','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(290,'2012-06-02 13:40:50','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(291,'2012-06-02 13:40:52','bible','bible','tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6431,'2012-07-09 10:31:20','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(294,'2012-06-02 13:41:04','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6430,'2012-07-09 10:26:51','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6429,'2012-07-09 10:26:29','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6428,'2012-07-09 10:25:48','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6426,'2012-07-09 10:25:01','1 corinthians 2','1 corinthians 2','downloads',1,0,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6427,'2012-07-09 10:25:13','1 corinthians 2','1 corinthians 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6425,'2012-07-09 10:24:43','1 corinthians 2','1 corinthians 2','teachings,teachings-tags,teachings-series',1,95,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6424,'2012-07-09 09:53:38','Matthew','matthew','teachings,teachings-tags,teachings-series',2,82,'rmdsgl0chtbknjpunc1j5abif5'),
	(6423,'2012-07-09 09:53:19','Matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'o3osl7q7nnnq24vjd8kf14rug1'),
	(304,'2012-06-02 13:47:00','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(306,'2012-06-02 13:47:11','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6422,'2012-07-09 09:52:31','Revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'5a65spjiekceeerp8fld27uek4'),
	(6421,'2012-07-09 08:34:51','Ephesians 1','ephesians 1','teachings,teachings-tags,teachings-series',2,36,'bi6hf4n4dcnru4sliaugjb7t26'),
	(309,'2012-06-02 13:48:20','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6420,'2012-07-09 08:34:38','Ephesians 1','ephesians 1','teachings,teachings-tags,teachings-series',1,36,'bi6hf4n4dcnru4sliaugjb7t26'),
	(6419,'2012-07-09 08:31:33','Ephesians','ephesians','teachings,teachings-tags,teachings-series',2,36,'npg9olapus47rfoknlndhllrb1'),
	(6418,'2012-07-09 08:30:19','Ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'npg9olapus47rfoknlndhllrb1'),
	(6417,'2012-07-09 08:29:42','podcasts','podcasts','teachings,teachings-tags,teachings-series',1,0,'5dirq8mjf36ppoab2kvco0guq0'),
	(6416,'2012-07-09 08:25:47','2 timothy','2 timothy','downloads',1,0,'bperotq12tfj3a7501s0ihlc43'),
	(6415,'2012-07-09 08:23:02','2 timothy','2 timothy','teachings,teachings-tags,teachings-series',1,36,'bperotq12tfj3a7501s0ihlc43'),
	(6414,'2012-07-09 07:31:53','Love','love','teachings,teachings-tags,teachings-series',1,40,'aush7qqebgu827pfjcu8jt9037'),
	(6413,'2012-07-09 06:21:59','r-024','r-024','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6412,'2012-07-09 06:21:51','r-023','r-023','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6411,'2012-07-09 06:21:20','r-022','r-022','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6410,'2012-07-09 06:21:08','r-021','r-021','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6409,'2012-07-09 06:20:22','r-020','r-020','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(324,'2012-06-02 13:50:43','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6408,'2012-07-09 06:19:34','r-019','r-019','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(326,'2012-06-02 13:51:44','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6407,'2012-07-09 06:19:13','r-017','r-017','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6406,'2012-07-09 06:18:59','r-018','r-018','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r9ev7gkh5v0ncbfsoqcgg41bo1'),
	(6405,'2012-07-08 23:11:01','descendant','descendant','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6404,'2012-07-08 23:08:29','adam','adam','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6403,'2012-07-08 23:08:11','adam children','adam children','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6402,'2012-07-08 23:07:36','means names','means names','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6401,'2012-07-08 23:06:41','meaning names','meaning names','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6400,'2012-07-08 23:06:13','meaning names','meaning names','teachings,teachings-tags,teachings-series',1,0,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6399,'2012-07-08 22:53:08','matthew','matthew','teachings,teachings-tags,teachings-series',4,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6398,'2012-07-08 22:52:56','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6397,'2012-07-08 22:05:58','siblings','siblings','teachings,teachings-tags,teachings-series',1,0,'eclq72ejq27q51m40015bskak3'),
	(6396,'2012-07-08 22:05:33','sisters','sisters','teachings,teachings-tags,teachings-series',1,1,'eclq72ejq27q51m40015bskak3'),
	(6395,'2012-07-08 22:05:20','how to treat sisters','how to treat sisters','teachings,teachings-tags,teachings-series',1,0,'eclq72ejq27q51m40015bskak3'),
	(6394,'2012-07-08 21:59:53','teaching today july 8,2012','teaching today july 8,2012','teachings,teachings-tags,teachings-series',1,0,'qoeu77aahusja9scahv61avuf3'),
	(6393,'2012-07-08 21:49:33','Corinthians','corinthians','teachings,teachings-tags,teachings-series',1,95,'je00t43cimodum0ru88dbfhr86'),
	(6392,'2012-07-08 21:35:54','philippians','philippians','teachings-series',1,1,'v6b7bupvmprnep58iivtdollj4'),
	(6391,'2012-07-08 21:33:03','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'v6b7bupvmprnep58iivtdollj4'),
	(6390,'2012-07-08 21:22:54','r-028','r-028','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6389,'2012-07-08 21:21:06','r-027','r-027','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6388,'2012-07-08 21:20:56','r-026','r-026','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6387,'2012-07-08 21:20:46','r-025','r-025','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6386,'2012-07-08 21:20:37','r-024','r-024','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6385,'2012-07-08 21:20:29','r-023','r-023','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6384,'2012-07-08 21:20:14','r-022','r-022','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6383,'2012-07-08 21:19:59','r-021','r-021','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6382,'2012-07-08 21:19:47','r-019','r-019','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6381,'2012-07-08 21:19:24','r-018','r-018','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6379,'2012-07-08 20:48:11','r-018','r-018','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6380,'2012-07-08 21:19:09','17','17','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6378,'2012-07-08 20:47:57','r-019','r-019','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6376,'2012-07-08 20:47:22','r-021','r-021','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6377,'2012-07-08 20:47:39','r-022','r-022','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6375,'2012-07-08 20:45:58','r-020','r-020','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6373,'2012-07-08 20:42:05','r-024','r-024','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6374,'2012-07-08 20:45:42','r-033','r-033','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6372,'2012-07-08 20:41:48','r-025','r-025','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6370,'2012-07-08 20:41:12','r-034','r-034','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6371,'2012-07-08 20:41:33','r-029','r-029','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6369,'2012-07-08 20:40:35','r-033','r-033','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6367,'2012-07-08 20:39:58','r-007','r-007','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6368,'2012-07-08 20:40:07','r-032','r-032','teachings',1,1,'1cqe78faav1g0fb8dtu276o2m3'),
	(6366,'2012-07-08 20:39:34','revelation','revelation','teachings',4,85,'1cqe78faav1g0fb8dtu276o2m3'),
	(6365,'2012-07-08 20:38:30','revelation','revelation','downloads',1,0,'1cqe78faav1g0fb8dtu276o2m3'),
	(6364,'2012-07-08 20:38:21','revelation','revelation','teachings',1,85,'1cqe78faav1g0fb8dtu276o2m3'),
	(6363,'2012-07-08 20:38:05','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'1cqe78faav1g0fb8dtu276o2m3'),
	(6362,'2012-07-08 20:37:42','revalation','revalation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1cqe78faav1g0fb8dtu276o2m3'),
	(6361,'2012-07-08 20:37:35','revalation','revalation','teachings,teachings-tags,teachings-series',1,0,'1cqe78faav1g0fb8dtu276o2m3'),
	(6360,'2012-07-08 19:29:51','Head covering','head covering','teachings,teachings-tags,teachings-series',1,1,'1o4vgridchekfefjjfs0qkqto1'),
	(6358,'2012-07-08 19:09:48','dating','dating','teachings-tags',1,1,'2t7ftajpglehenap58atiamn74'),
	(6359,'2012-07-08 19:23:34','Resurrection','resurrection','teachings,teachings-tags,teachings-series',1,15,'1o4vgridchekfefjjfs0qkqto1'),
	(6357,'2012-07-08 18:15:11','titus','titus','teachings,teachings-tags,teachings-series',1,6,'3at5kcju14vv3uom4g9bh0tev7'),
	(380,'2012-06-02 13:59:34','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6356,'2012-07-08 17:53:34','marriage','marriage','teachings,teachings-tags,teachings-series',1,10,'g96useiufp1qek6h32mvi63d52'),
	(6355,'2012-07-08 17:53:27','marriagemasturbation','marriagemasturbation','teachings,teachings-tags,teachings-series',1,0,'g96useiufp1qek6h32mvi63d52'),
	(6354,'2012-07-08 17:53:20','masturbation','masturbation','teachings,teachings-tags,teachings-series',1,0,'g96useiufp1qek6h32mvi63d52'),
	(6353,'2012-07-08 17:52:51','masterbation','masterbation','teachings,teachings-tags,teachings-series',1,0,'g96useiufp1qek6h32mvi63d52'),
	(6352,'2012-07-08 15:52:19','revelations','Revelation','teachings-tags',1,1,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6351,'2012-07-08 15:51:48','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6350,'2012-07-08 15:51:28','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6349,'2012-07-08 15:51:12','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6348,'2012-07-08 15:46:59','book of revelations','book of Revelation','downloads',1,0,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6347,'2012-07-08 15:46:37','book of revelations','book of Revelation','teachings-series',1,0,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6346,'2012-07-08 15:44:53','book of revelations','book of Revelation','teachings,teachings-tags,teachings-series',1,9,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6345,'2012-07-08 15:43:42','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'ef0k3qi61ad9lu9ptkr93sgho6'),
	(6344,'2012-07-08 15:25:11','hope','hope','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,21,'qaujf6cds18dglb8kjjuf753n4'),
	(6343,'2012-07-08 15:24:32','hope','hope','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'qaujf6cds18dglb8kjjuf753n4'),
	(6342,'2012-07-08 15:23:31','Hope','hope','teachings',1,12,'v3v5p9alkhcgqp412hg6romka4'),
	(6341,'2012-07-08 15:22:42','Hope','hope','teachings,teachings-tags,teachings-series',1,13,'ss2261m8otvk8o1qejjhil6ij6'),
	(6340,'2012-07-08 15:22:35','Hope','hope','teachings,teachings-tags,teachings-series',2,13,'ss2261m8otvk8o1qejjhil6ij6'),
	(6339,'2012-07-08 15:22:28','Hope','hope','teachings,teachings-tags,teachings-series',1,13,'ss2261m8otvk8o1qejjhil6ij6'),
	(6338,'2012-07-08 14:48:07','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6337,'2012-07-08 14:24:22','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'m3r7f3stdlpq89vvp4c3j0nj35'),
	(6335,'2012-07-08 14:23:54','hebrews','hebrews','downloads',1,0,'m3r7f3stdlpq89vvp4c3j0nj35'),
	(6336,'2012-07-08 14:24:02','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'m3r7f3stdlpq89vvp4c3j0nj35'),
	(6334,'2012-07-08 14:23:44','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'m3r7f3stdlpq89vvp4c3j0nj35'),
	(6333,'2012-07-08 14:23:20','Romans 1:1','romans 1:1','teachings,teachings-tags,teachings-series',1,7,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6332,'2012-07-08 14:23:06','Romans 1:','romans 1:','teachings,teachings-tags,teachings-series',7,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6331,'2012-07-08 14:23:00','Romans 1:','romans 1:','teachings,teachings-tags,teachings-series',2,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6330,'2012-07-08 14:22:52','Romans 1:','romans 1:','teachings,teachings-tags,teachings-series',1,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6329,'2012-07-08 14:20:36','Romans 2','romans 2','teachings,teachings-tags,teachings-series',5,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6328,'2012-07-08 14:20:23','Romans 2','romans 2','teachings,teachings-tags,teachings-series',6,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6327,'2012-07-08 14:20:05','Romans 2','romans 2','teachings,teachings-tags,teachings-series',7,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6326,'2012-07-08 14:19:58','Romans 2','romans 2','teachings,teachings-tags,teachings-series',1,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(6325,'2012-07-08 13:57:48','muslums','muslums','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6324,'2012-07-08 13:15:03','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'h3e0v268rs7l9con0ukjgqsqs7'),
	(6323,'2012-07-08 13:13:26','titus','titus','teachings,teachings-tags,teachings-series',1,6,'4dg3avnl8a1d7787gls5skgp87'),
	(6322,'2012-07-08 12:53:22','teachings on CD','teachings on cd','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'4j8ihd7c9tvl586lq3s104n0r3'),
	(6321,'2012-07-08 12:53:06','how do i order a CD of a teaching','how do i order a cd of a teaching','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4j8ihd7c9tvl586lq3s104n0r3'),
	(6320,'2012-07-08 12:50:18','order a CD','order a cd','teachings,teachings-tags,teachings-series',1,7,'4j8ihd7c9tvl586lq3s104n0r3'),
	(422,'2012-06-02 14:00:56','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6319,'2012-07-08 12:49:58','order','order','teachings,teachings-tags,teachings-series',1,7,'4j8ihd7c9tvl586lq3s104n0r3'),
	(6318,'2012-07-08 12:46:48','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6317,'2012-07-08 12:46:15','muslums','muslums','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6316,'2012-07-08 12:45:13','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6315,'2012-07-08 12:45:05','titus','titus','teachings,teachings-tags,teachings-series',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6314,'2012-07-08 12:22:26','Hope','hope','teachings',2,12,'v3v5p9alkhcgqp412hg6romka4'),
	(6313,'2012-07-08 12:22:01','Hope','hope','teachings',1,12,'v3v5p9alkhcgqp412hg6romka4'),
	(6312,'2012-07-08 12:18:06','Hope','hope','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'v3v5p9alkhcgqp412hg6romka4'),
	(6311,'2012-07-08 12:09:39','Sex','sex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'0rbshn6129a0hbvpqnrput51n1'),
	(6310,'2012-07-08 12:07:48','Sex','sex','teachings,teachings-tags,teachings-series',1,9,'0rbshn6129a0hbvpqnrput51n1'),
	(6309,'2012-07-08 12:07:06','Rape','rape','teachings,teachings-tags,teachings-series',1,0,'0rbshn6129a0hbvpqnrput51n1'),
	(6308,'2012-07-08 09:34:17','achar','achar','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'lpj3sc1nskf0l9o28ijdu8avm7'),
	(6307,'2012-07-08 08:39:29','titus','titus','teachings,teachings-tags,teachings-series',1,6,'g0dfudo90lhvs3g3isb6g326p2'),
	(6305,'2012-07-08 06:38:36','jesus','jesus','events-recurring',1,1,'o8brt0d0cf45l6hm7mcultokb3'),
	(6306,'2012-07-08 07:03:46','Revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'1rrof7v5eeo98bsv4qvoi74c82'),
	(6304,'2012-07-08 06:38:13','jesus','jesus','teachings,teachings-tags,teachings-series',1,245,'o8brt0d0cf45l6hm7mcultokb3'),
	(6303,'2012-07-08 00:41:12','Psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'4bc7vec3fctgimbru9nto6tdd5'),
	(6302,'2012-07-08 00:32:56','Faith','faith','teachings,teachings-tags,teachings-series',1,47,'fnltchilbc4dnee1mlm27apt34'),
	(6301,'2012-07-08 00:32:15','john 10','john 10','teachings,teachings-tags,teachings-series',1,95,'bnph7mt1uqa804dprlvds4f985'),
	(6300,'2012-07-07 23:10:06','mansur','mansur','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6299,'2012-07-07 21:58:23','matthew','matthew','teachings,teachings-tags,teachings-series',4,82,'ou4e924tgeqslgif5nn14ab7p3'),
	(6298,'2012-07-07 21:57:35','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'ou4e924tgeqslgif5nn14ab7p3'),
	(6297,'2012-07-07 21:25:44','S1-585','s1-585','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6296,'2012-07-07 21:14:37','songs','songs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'usej7v3ks3n5vohthgm5pdia47'),
	(6295,'2012-07-07 21:14:16','songs','songs','downloads',1,0,'usej7v3ks3n5vohthgm5pdia47'),
	(6294,'2012-07-07 20:39:09','june','june','teachings,teachings-tags,teachings-series',1,0,'4gjrjv3qdtid6srncppek7gv33'),
	(6293,'2012-07-07 19:45:06','staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'q5phoi37179nlae80ut1jfp5s6'),
	(6292,'2012-07-07 19:13:03','end times','end times','teachings,teachings-tags,teachings-series',1,20,'diefpogrd8uj81b5bdji929u20'),
	(6291,'2012-07-07 19:12:55','end itmes','end itmes','teachings,teachings-tags,teachings-series',1,0,'diefpogrd8uj81b5bdji929u20'),
	(6290,'2012-07-07 17:52:56','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6289,'2012-07-07 17:52:44','titus','titus','teachings,teachings-tags,teachings-series',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6288,'2012-07-07 16:55:55','S1-585','s1-585','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6287,'2012-07-07 13:40:52','children\'s ministry','children\'s ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'qk9qjouokcisb8337ru3ppogt5'),
	(6286,'2012-07-07 13:40:39','childrens ministry volunteers','childrens ministry volunteers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qk9qjouokcisb8337ru3ppogt5'),
	(461,'2012-06-02 14:01:53','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6285,'2012-07-07 13:40:13','Matthew holland','matthew holland','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qk9qjouokcisb8337ru3ppogt5'),
	(6284,'2012-07-07 13:39:58','Matt ho','matt ho','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'qk9qjouokcisb8337ru3ppogt5'),
	(6283,'2012-07-07 13:39:49','matt','matt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'qk9qjouokcisb8337ru3ppogt5'),
	(6282,'2012-07-07 13:35:40','2 Peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6281,'2012-07-07 13:35:30','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,15,'qk9qjouokcisb8337ru3ppogt5'),
	(6280,'2012-07-07 13:35:06','discipline','discipline','teachings,teachings-tags,teachings-series',1,3,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6279,'2012-07-07 13:34:59','seven steps','seven steps','teachings,teachings-tags,teachings-series',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6278,'2012-07-07 13:34:53','7 steps','7 steps','teachings,teachings-tags,teachings-series',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6277,'2012-07-07 13:00:23','M1-564','m1-564','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'v3v5p9alkhcgqp412hg6romka4'),
	(6276,'2012-07-07 11:58:39','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6275,'2012-07-07 11:31:24','m1-564','m1-564','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6274,'2012-07-07 11:26:14','m1-564','m1-564','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6273,'2012-07-07 11:22:55','S1-547','s1-547','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6272,'2012-07-07 11:22:10','s1-543','s1-543','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6271,'2012-07-07 09:32:26','1 Peter 4','1 peter 4','teachings,teachings-tags,teachings-series',2,31,'p1imrehbors4i8lecmacg8h400'),
	(6270,'2012-07-07 09:22:32','jews','jews','teachings,teachings-tags,teachings-series',1,18,'nglo83cn7lat0b35sq8298kce0'),
	(6268,'2012-07-07 08:52:37','1543','1543','downloads',1,0,'cmbhb58epguej9meef0pmlbfv5'),
	(6269,'2012-07-07 08:53:16','si543','si543','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cmbhb58epguej9meef0pmlbfv5'),
	(6267,'2012-07-07 08:52:05','1543','1543','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'cmbhb58epguej9meef0pmlbfv5'),
	(6266,'2012-07-07 08:51:29','i543','i543','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cmbhb58epguej9meef0pmlbfv5'),
	(6265,'2012-07-07 08:43:23','1 Peter 4','1 peter 4','teachings,teachings-tags,teachings-series',2,31,'p1imrehbors4i8lecmacg8h400'),
	(6264,'2012-07-07 08:42:49','1 Peter 4','1 peter 4','teachings,teachings-tags,teachings-series',1,31,'p1imrehbors4i8lecmacg8h400'),
	(6262,'2012-07-07 08:37:24','relationships','relationships','downloads',1,0,'bj2g46r5gt33thjr4c2tg9kma4'),
	(6263,'2012-07-07 08:37:31','relationships','relationships','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'bj2g46r5gt33thjr4c2tg9kma4'),
	(6261,'2012-07-07 08:37:18','relationships','relationships','teachings-series',1,0,'bj2g46r5gt33thjr4c2tg9kma4'),
	(6260,'2012-07-07 08:37:07','relationships','relationships','teachings,teachings-tags,teachings-series',1,1,'bj2g46r5gt33thjr4c2tg9kma4'),
	(6259,'2012-07-07 05:25:48','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'5mdf18sd33os9i6r83ig2ejc74'),
	(6258,'2012-07-07 01:25:48','Titus','titus','teachings,teachings-tags,teachings-series',1,6,'s15uc7nrddbs2obt7321upim14'),
	(6257,'2012-07-07 00:08:32','Jedediah','jedediah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(6256,'2012-07-06 23:08:25','2 timothy 3','2 timothy 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'4joqu1gg4vbrsopc5otqk0f295'),
	(6254,'2012-07-06 23:08:14','2 timothy 3','2 timothy 3','downloads',1,0,'4joqu1gg4vbrsopc5otqk0f295'),
	(6255,'2012-07-06 23:08:25','2 timothy 3','2 timothy 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'4joqu1gg4vbrsopc5otqk0f295'),
	(6253,'2012-07-06 23:07:49','2 timothy 3','2 timothy 3','teachings,teachings-tags,teachings-series',1,36,'4joqu1gg4vbrsopc5otqk0f295'),
	(6252,'2012-07-06 23:07:28','2 tim','2 tim','teachings,teachings-tags,teachings-series',1,135,'4joqu1gg4vbrsopc5otqk0f295'),
	(6251,'2012-07-06 21:50:36','matthew 21','matthew 21','teachings,teachings-tags,teachings-series',4,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6250,'2012-07-06 21:50:09','matthew 21','matthew 21','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6249,'2012-07-06 21:35:53','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,266,'at4h3arcfndnrn5r4slms0u0n3'),
	(6248,'2012-07-06 15:33:41','Romans 2010','romans 2010','teachings,teachings-tags,teachings-series',1,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6246,'2012-07-06 15:08:20','Romans 2011','romans 2011','teachings',1,20,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6247,'2012-07-06 15:16:00','Romans 2011','romans 2011','teachings',2,20,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6245,'2012-07-06 15:05:07','Romans 2010','romans 2010','teachings',2,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6244,'2012-07-06 15:04:39','Romans 2010','romans 2010','teachings',1,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(508,'2012-06-02 14:03:09','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6243,'2012-07-06 14:59:40','Romans 2010','romans 2010','teachings',2,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6241,'2012-07-06 14:55:13','Romans 3 2010','romans 3 2010','teachings',1,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6242,'2012-07-06 14:57:28','Romans 2010','romans 2010','teachings',1,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6240,'2012-07-06 14:43:13','revelation','revelation','teachings,teachings-tags,teachings-series',5,86,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(6239,'2012-07-06 14:42:56','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(6238,'2012-07-06 14:42:51','romans 1 2010','romans 1 2010','teachings,teachings-tags,teachings-series',1,18,'hui0vqdskf48uc187c2npbioe0'),
	(6236,'2012-07-06 14:42:30','Romans 1 2010','romans 1 2010','teachings',1,18,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6237,'2012-07-06 14:42:42','romans 1 2010','romans 1 2010','teachings,teachings-tags,teachings-series',2,18,'hui0vqdskf48uc187c2npbioe0'),
	(6235,'2012-07-06 14:41:53','romans 1 2010','romans 1 2010','teachings,teachings-tags,teachings-series',1,18,'hui0vqdskf48uc187c2npbioe0'),
	(6234,'2012-07-06 14:40:42','romans 1','romans 1','teachings,teachings-tags,teachings-series',3,65,'hui0vqdskf48uc187c2npbioe0'),
	(6233,'2012-07-06 14:40:33','romans 1','romans 1','teachings,teachings-tags,teachings-series',2,65,'hui0vqdskf48uc187c2npbioe0'),
	(6232,'2012-07-06 14:40:23','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'hui0vqdskf48uc187c2npbioe0'),
	(6231,'2012-07-06 14:39:56','Romans','romans','teachings',7,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6229,'2012-07-06 14:39:10','Romans','romans','teachings',1,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6230,'2012-07-06 14:39:22','Romans','romans','teachings',2,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6228,'2012-07-06 14:38:17','Romans 1','romans 1','teachings',7,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6227,'2012-07-06 14:37:44','Romans 1','romans 1','teachings',1,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6225,'2012-07-06 14:36:28','romans 1','romans 1','teachings',6,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6226,'2012-07-06 14:36:57','romans 1','romans 1','teachings',7,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6224,'2012-07-06 14:36:12','romans 1','romans 1','teachings',5,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6223,'2012-07-06 14:35:42','romans 1','romans 1','teachings',1,64,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6222,'2012-07-06 14:35:32','romans 1','romans 1','teachings-series',1,0,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6221,'2012-07-06 14:34:49','romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',7,67,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6220,'2012-07-06 14:34:17','romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,67,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6219,'2012-07-06 14:34:07','romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,67,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6218,'2012-07-06 14:33:54','romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,67,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6217,'2012-07-06 14:33:34','romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6216,'2012-07-06 14:33:20','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6215,'2012-07-06 14:05:28','Romans','romans','teachings,teachings-tags,teachings-series',7,65,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6214,'2012-07-06 14:05:10','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6213,'2012-07-06 14:04:41','service','service','teachings,teachings-tags,teachings-series',1,3,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(538,'2012-06-02 14:10:48','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6212,'2012-07-06 14:03:39','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6211,'2012-07-06 13:26:41','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6210,'2012-07-06 13:05:19','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'72rc4jtc5k1tiud5t18ba6f4u7'),
	(6209,'2012-07-06 11:50:09','Joy','joy','teachings,teachings-tags,teachings-series',1,9,'r02n693n76v3so6g5so9mhu972'),
	(543,'2012-06-02 14:10:58','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6208,'2012-07-06 11:42:46','june 3 2012','june 3 2012','teachings',1,0,'7h1up0efvn745eljegbaot7il3'),
	(6207,'2012-07-06 11:42:26','june 3 2012','june 3 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'7h1up0efvn745eljegbaot7il3'),
	(6206,'2012-07-06 11:42:00','june 3 2012','june 3 2012','teachings,teachings-tags,teachings-series',1,0,'7h1up0efvn745eljegbaot7il3'),
	(6205,'2012-07-06 10:26:23','romans 1','romans 1','teachings,teachings-tags,teachings-series',6,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6204,'2012-07-06 10:26:10','romans 1','romans 1','teachings,teachings-tags,teachings-series',7,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(549,'2012-06-02 14:11:37','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6203,'2012-07-06 10:26:01','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6202,'2012-07-06 10:25:30','romans','romans','downloads',1,0,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6201,'2012-07-06 10:25:00','romans','romans','teachings,teachings-tags,teachings-series',7,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(553,'2012-06-02 14:11:46','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6200,'2012-07-06 10:24:52','romans','romans','teachings,teachings-tags,teachings-series',2,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6199,'2012-07-06 10:24:41','romans','romans','teachings,teachings-tags,teachings-series',1,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6198,'2012-07-06 10:00:15','romans 1','romans 1','teachings,teachings-tags,teachings-series',6,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(557,'2012-06-02 14:11:55','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6197,'2012-07-06 10:00:02','romans 1','romans 1','teachings,teachings-tags,teachings-series',5,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6196,'2012-07-06 09:59:50','romans 1','romans 1','teachings,teachings-tags,teachings-series',2,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6195,'2012-07-06 09:59:35','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6194,'2012-07-06 09:57:25','romans','romans','teachings,teachings-tags,teachings-series',1,65,'34n8dkbvolgjqtmrb3f1sdb752'),
	(6193,'2012-07-06 08:55:50','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,266,'bb2t7ik2ghh03i2rtfk032h1s5'),
	(6192,'2012-07-06 07:56:35','Ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'mvg1i87sn4pss62n67u2h48lv1'),
	(6191,'2012-07-06 07:14:34','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,15,'3rtii7p4n21t62emn6bkc936k3'),
	(6190,'2012-07-06 06:14:18','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6189,'2012-07-06 06:00:10','faith','faith','teachings-tags',1,3,'4djmsgjtm8ukkci6pp0irmuqr3'),
	(6188,'2012-07-06 00:17:15','Abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'2qk1f72dnk7v08comq8bhs0836'),
	(6187,'2012-07-05 22:34:48','matthew 22','matthew 22','teachings,teachings-tags,teachings-series',4,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6186,'2012-07-05 22:34:38','matthew 22','matthew 22','teachings,teachings-tags,teachings-series',2,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6185,'2012-07-05 22:33:59','matthew 22','matthew 22','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6184,'2012-07-05 21:03:24','hamilton','hamilton','teachings,teachings-tags,teachings-series',1,12,'uloav73t6p2dnt7suoc01retr0'),
	(6183,'2012-07-05 21:02:55','lippincott','lippincott','teachings,teachings-tags,teachings-series',1,1,'uloav73t6p2dnt7suoc01retr0'),
	(6182,'2012-07-05 21:02:36','courson','courson','teachings,teachings-tags,teachings-series',1,1,'uloav73t6p2dnt7suoc01retr0'),
	(6181,'2012-07-05 21:02:14','Jesus','jesus','teachings,teachings-tags,teachings-series',1,245,'uloav73t6p2dnt7suoc01retr0'),
	(6180,'2012-07-05 19:59:30','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6179,'2012-07-05 18:50:30','matthew','matthew','teachings,teachings-tags,teachings-series',9,82,'7nqr2cm6p188l6kststuuhe646'),
	(6178,'2012-07-05 18:50:24','matthew','matthew','teachings,teachings-tags,teachings-series',3,82,'7nqr2cm6p188l6kststuuhe646'),
	(6177,'2012-07-05 18:50:14','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'7nqr2cm6p188l6kststuuhe646'),
	(6176,'2012-07-05 18:16:03','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6175,'2012-07-05 18:15:50','Psalm','psalm','teachings,teachings-tags,teachings-series',1,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6174,'2012-07-05 16:48:01','Forgiveness','forgiveness','teachings,teachings-tags,teachings-series',1,13,'aush7qqebgu827pfjcu8jt9037'),
	(6173,'2012-07-05 16:16:25','permission','permission','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6172,'2012-07-05 16:16:22','permission','permission','downloads',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6170,'2012-07-05 16:15:44','waiver','waiver','downloads',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6171,'2012-07-05 16:16:09','downloads','downloads','downloads',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6169,'2012-07-05 16:15:44','waiver','waiver','tags',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6168,'2012-07-05 16:15:30','waiver','waiver','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'nbb6m9qe2u6c5g347cjngcvo26'),
	(6167,'2012-07-05 15:37:11','romans','romans','teachings,teachings-tags,teachings-series',1,65,'veimqp64bfsl8sf330m82081m6'),
	(6166,'2012-07-05 15:36:56','romans chp 1','romans chp 1','teachings,teachings-tags,teachings-series',1,0,'veimqp64bfsl8sf330m82081m6'),
	(6165,'2012-07-05 15:22:37','hidden event','hidden event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6164,'2012-07-05 15:22:30','hidden event','hidden event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6163,'2012-07-05 15:21:11','hidden event','hidden event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6162,'2012-07-05 15:19:21','hidden event','hidden event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6161,'2012-07-05 15:16:39','Knight DAy','knight day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6160,'2012-07-05 15:14:47','knight','knight','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'g3cq7379ovpci6sdqul09rh6h4'),
	(6159,'2012-07-05 15:14:23','september','september','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'g3cq7379ovpci6sdqul09rh6h4'),
	(6158,'2012-07-05 15:14:06','jr. high','jr. high','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'g3cq7379ovpci6sdqul09rh6h4'),
	(6156,'2012-07-05 14:36:46','songs','songs','downloads',1,0,'vhbekbdf2ivh3ra1mgnnl1drc4'),
	(6157,'2012-07-05 15:13:31','Knight DAy','knight day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(6155,'2012-07-05 14:36:36','songs','songs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vhbekbdf2ivh3ra1mgnnl1drc4'),
	(6154,'2012-07-05 14:36:18','Songs','songs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vhbekbdf2ivh3ra1mgnnl1drc4'),
	(6153,'2012-07-05 13:37:53','Luke 6','luke 6','teachings,teachings-tags,teachings-series',5,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6152,'2012-07-05 13:36:58','Luke 6','luke 6','teachings,teachings-tags,teachings-series',4,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6151,'2012-07-05 13:36:33','Luke 6','luke 6','teachings,teachings-tags,teachings-series',3,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6150,'2012-07-05 13:35:32','Luke 6','luke 6','teachings,teachings-tags,teachings-series',2,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6149,'2012-07-05 13:35:02','Luke 6','luke 6','teachings,teachings-tags,teachings-series',1,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6148,'2012-07-05 13:34:43','Luke 6:27','luke 6:27','teachings,teachings-tags,teachings-series',1,0,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6147,'2012-07-05 13:34:05','Luke','luke','teachings,teachings-tags,teachings-series',1,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(6146,'2012-07-05 13:17:07','sin','sin','teachings-tags',1,18,'4djmsgjtm8ukkci6pp0irmuqr3'),
	(6144,'2012-07-05 13:16:25','secret sin','secret sin','teachings-tags',1,0,'4djmsgjtm8ukkci6pp0irmuqr3'),
	(6145,'2012-07-05 13:16:53','secret','secret','teachings-tags',1,0,'4djmsgjtm8ukkci6pp0irmuqr3'),
	(6143,'2012-07-05 12:41:52','james 5','james 5','teachings,teachings-tags,teachings-series',2,17,'cochknfnni7h61nghi93khd5b7'),
	(6142,'2012-07-05 12:41:44','james 5','james 5','teachings,teachings-tags,teachings-series',1,17,'cochknfnni7h61nghi93khd5b7'),
	(6141,'2012-07-05 12:41:17','james','james','teachings,teachings-tags,teachings-series',2,17,'cochknfnni7h61nghi93khd5b7'),
	(6140,'2012-07-05 12:40:52','james','james','teachings,teachings-tags,teachings-series',1,17,'cochknfnni7h61nghi93khd5b7'),
	(6139,'2012-07-05 11:23:54','james','james','teachings,teachings-tags,teachings-series',2,17,'muhm0gabhcmm62odt554lv6785'),
	(6138,'2012-07-05 11:23:25','james','james','teachings,teachings-tags,teachings-series',1,17,'muhm0gabhcmm62odt554lv6785'),
	(6137,'2012-07-05 10:27:33','sexual','sexual','teachings-tags',1,5,'4djmsgjtm8ukkci6pp0irmuqr3'),
	(6136,'2012-07-05 09:23:26','numbers','numbers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'vtd11jcilcfg666lsrfqtgeao4'),
	(6135,'2012-07-05 08:18:16','love','love','downloads',1,0,'l4cbiqtflbh4ap255ebk0sdpn4'),
	(6134,'2012-07-05 08:18:11','love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,61,'l4cbiqtflbh4ap255ebk0sdpn4'),
	(6133,'2012-07-05 06:10:23','Psalm','psalm','teachings,teachings-tags,teachings-series',1,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6132,'2012-07-04 22:31:19','matthew','matthew','teachings,teachings-tags,teachings-series',6,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6131,'2012-07-04 22:30:52','matthew','matthew','teachings,teachings-tags,teachings-series',4,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6130,'2012-07-04 22:30:28','matthew','matthew','teachings,teachings-tags,teachings-series',5,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6129,'2012-07-04 22:29:24','matthew 20','matthew 20','teachings,teachings-tags,teachings-series',6,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6128,'2012-07-04 22:28:31','matthew 20','matthew 20','teachings,teachings-tags,teachings-series',5,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6127,'2012-07-04 22:26:32','matthew 20','matthew 20','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6126,'2012-07-04 22:25:54','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6125,'2012-07-04 18:58:44','Divorce','divorce','teachings,teachings-tags,teachings-series',1,5,'590li3dml2mtkhst9c0mrbvos2'),
	(6124,'2012-07-04 14:44:47','esther','esther','teachings,teachings-tags,teachings-series',1,4,'pgodau2te8gh0kjv70sf09q1l2'),
	(6123,'2012-07-04 13:14:27','s1-280','s1-280','teachings,teachings-tags,teachings-series',1,1,'c61a7nkb4ogc45bsseflum1vc1'),
	(6122,'2012-07-04 13:11:52','m1-564','m1-564','teachings,teachings-tags,teachings-series',1,2,'c61a7nkb4ogc45bsseflum1vc1'),
	(6121,'2012-07-04 13:11:13','m1564','m1564','teachings,teachings-tags,teachings-series',1,0,'c61a7nkb4ogc45bsseflum1vc1'),
	(638,'2012-06-02 14:22:30','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6120,'2012-07-04 13:03:54','m1-564','m1-564','teachings,teachings-tags,teachings-series',1,2,'c61a7nkb4ogc45bsseflum1vc1'),
	(640,'2012-06-02 14:24:50','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(642,'2012-06-02 14:25:25','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6119,'2012-07-04 12:25:26','Jeff young','jeff young','teachings,teachings-tags,teachings-series',1,11,'590li3dml2mtkhst9c0mrbvos2'),
	(644,'2012-06-02 14:26:09','home','home','tags',1,11,'jru7j11o1vlq0jt96bua5178u2'),
	(6118,'2012-07-04 12:24:42','Calvinism','calvinism','teachings,teachings-tags,teachings-series',1,2,'590li3dml2mtkhst9c0mrbvos2'),
	(646,'2012-06-02 14:26:53','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6117,'2012-07-04 12:13:25','titus','titus','teachings,teachings-tags,teachings-series',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6116,'2012-07-04 11:29:56','jesus','jesus','teachings,teachings-tags,teachings-series',1,269,'3m2acduip1k58ptognn7bfcgi7'),
	(649,'2012-06-02 14:31:22','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6115,'2012-07-04 11:29:37','qq','qq','teachings,teachings-tags,teachings-series',1,0,'3m2acduip1k58ptognn7bfcgi7'),
	(651,'2012-06-02 14:31:58','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6114,'2012-07-04 10:24:51','exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,59,'sursr98mm1cjvh9mpsttogodl1'),
	(653,'2012-06-02 14:32:07','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6113,'2012-07-04 10:24:46','exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,59,'sursr98mm1cjvh9mpsttogodl1'),
	(655,'2012-06-02 14:32:51','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(657,'2012-06-02 14:33:08','homer/','homer/','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6112,'2012-07-04 10:24:36','exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,59,'sursr98mm1cjvh9mpsttogodl1'),
	(659,'2012-06-02 14:33:20','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6111,'2012-07-04 10:23:35','exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,59,'sursr98mm1cjvh9mpsttogodl1'),
	(661,'2012-06-02 14:33:22','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6110,'2012-07-04 10:23:21','exodus 15','exodus 15','teachings,teachings-tags,teachings-series',1,59,'sursr98mm1cjvh9mpsttogodl1'),
	(663,'2012-06-02 14:33:25','homemakers','homemakers','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6109,'2012-07-04 09:26:07','Jonah 1','jonah 1','teachings,teachings-tags,teachings-series',1,7,'5njva3cgms1balfm4lnfdrf326'),
	(665,'2012-06-02 14:33:32','homemakers','homemakers','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6108,'2012-07-04 09:25:41','Jonah','jonah','teachings,teachings-tags,teachings-series',1,7,'5njva3cgms1balfm4lnfdrf326'),
	(667,'2012-06-02 14:35:19','homemakers','homemakers','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6107,'2012-07-04 08:52:33','corinthians','corinthians','downloads',1,0,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(669,'2012-06-02 14:35:21','homemakers','homemakers','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6106,'2012-07-04 08:52:25','corinthians','corinthians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,98,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(671,'2012-06-02 14:35:25','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(6105,'2012-07-04 08:50:54','corinthians','corinthians','teachings,teachings-tags,teachings-series',1,95,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(673,'2012-06-02 14:35:32','homer','homer','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6104,'2012-07-04 08:36:38','john','john','teachings,teachings-tags,teachings-series',1,95,'o77i8ol2c8u6l9pl0tbjtahpr5'),
	(675,'2012-06-02 14:36:07','homer','homer','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6103,'2012-07-04 08:30:04','esther','esther','teachings,teachings-tags,teachings-series',1,4,'pgodau2te8gh0kjv70sf09q1l2'),
	(677,'2012-06-02 14:36:25','home','home','teachings',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(679,'2012-06-02 14:36:33','bren','bren','teachings',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6102,'2012-07-04 08:08:59','angels','angels','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jisr325v0qavg6vsfr2d3ha2l7'),
	(681,'2012-06-02 14:36:38','bren','bren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6101,'2012-07-04 08:08:42','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',9,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(683,'2012-06-02 14:36:43','bren','bren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(685,'2012-06-02 14:36:51','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6100,'2012-07-04 08:08:32','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',8,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(687,'2012-06-02 14:37:58','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6099,'2012-07-04 08:07:55','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',7,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6098,'2012-07-04 08:07:41','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6097,'2012-07-04 08:07:13','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6096,'2012-07-04 08:06:28','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(693,'2012-06-02 14:38:58','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(695,'2012-06-02 14:39:01','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6095,'2012-07-04 08:05:34','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6094,'2012-07-04 08:04:26','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(698,'2012-06-02 14:39:18','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6093,'2012-07-04 08:02:49','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6092,'2012-07-04 08:02:41','revelations','Revelation','teachings-series',1,0,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6091,'2012-07-04 08:02:27','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'jisr325v0qavg6vsfr2d3ha2l7'),
	(6090,'2012-07-04 06:53:07','Psalm','psalm','teachings,teachings-tags,teachings-series',1,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6089,'2012-07-04 06:52:47','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6088,'2012-07-04 06:51:35','Psalm','psalm','teachings,teachings-tags,teachings-series',1,97,'uk93n27f8afd1tfk5d7onk7797'),
	(705,'2012-06-02 14:52:23','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6087,'2012-07-04 06:51:23','Psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'uk93n27f8afd1tfk5d7onk7797'),
	(707,'2012-06-02 14:52:48','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6086,'2012-07-04 03:59:04','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,290,'q9rp4t5oq8254pu2b7e36n83l0'),
	(709,'2012-06-02 14:58:16','book','book','teachings',1,36,'jru7j11o1vlq0jt96bua5178u2'),
	(6085,'2012-07-04 02:44:45','Relativism','relativism','teachings,teachings-tags,teachings-series',1,7,'kv8f3o1q6ogvq22pcjf6qjpum0'),
	(711,'2012-06-02 15:00:02','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6084,'2012-07-03 23:01:57','new years','new years','teachings,teachings-tags,teachings-series',1,1,'o0jkunckfkmj81a1anlmc8s0c2'),
	(713,'2012-06-02 15:00:25','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(715,'2012-06-02 15:00:32','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6083,'2012-07-03 23:01:46','new years day','new years day','teachings,teachings-tags,teachings-series',1,1,'o0jkunckfkmj81a1anlmc8s0c2'),
	(717,'2012-06-02 15:01:48','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6082,'2012-07-03 23:01:32','christmas','christmas','teachings,teachings-tags,teachings-series',2,14,'o0jkunckfkmj81a1anlmc8s0c2'),
	(6081,'2012-07-03 22:59:57','christmas','christmas','teachings,teachings-tags,teachings-series',1,14,'o0jkunckfkmj81a1anlmc8s0c2'),
	(6080,'2012-07-03 22:59:47','December 25, 2011','december 25, 2011','teachings,teachings-tags,teachings-series',1,0,'o0jkunckfkmj81a1anlmc8s0c2'),
	(721,'2012-06-02 15:02:39','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6079,'2012-07-03 22:57:44','dec 25, 2011','dec 25, 2011','teachings,teachings-tags,teachings-series',1,0,'o0jkunckfkmj81a1anlmc8s0c2'),
	(6078,'2012-07-03 22:55:18','phillipians','phillipians','teachings,teachings-tags,teachings-series',1,0,'o0jkunckfkmj81a1anlmc8s0c2'),
	(6077,'2012-07-03 22:54:20','ephesians','ephesians','teachings,teachings-tags,teachings-series',2,36,'o0jkunckfkmj81a1anlmc8s0c2'),
	(6076,'2012-07-03 22:53:40','Teachings','teachings','teachings-series',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(726,'2012-06-02 15:29:51','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6075,'2012-07-03 22:50:59','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'o0jkunckfkmj81a1anlmc8s0c2'),
	(728,'2012-06-02 15:32:13','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6074,'2012-07-03 22:50:33','1st Corinthians 3','1st corinthians 3','teachings',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(730,'2012-06-02 15:32:30','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6073,'2012-07-03 22:50:09','1st Corinthians 3','1st corinthians 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(6072,'2012-07-03 22:49:39','1st Corinthians 3','1st corinthians 3','teachings,teachings-tags,teachings-series',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(6071,'2012-07-03 22:45:44','dec. 2012','dec. 2012','teachings,teachings-tags,teachings-series',1,0,'o0jkunckfkmj81a1anlmc8s0c2'),
	(735,'2012-06-02 15:53:01','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6070,'2012-07-03 22:18:57','matthew 19','matthew 19','teachings,teachings-tags,teachings-series',7,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(737,'2012-06-02 15:53:32','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6069,'2012-07-03 22:18:49','matthew 19','matthew 19','teachings,teachings-tags,teachings-series',5,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(739,'2012-06-02 15:54:20','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6068,'2012-07-03 22:18:13','matthew 19','matthew 19','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(741,'2012-06-02 15:54:40','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6067,'2012-07-03 22:18:02','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(743,'2012-06-02 15:55:13','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6066,'2012-07-03 22:09:02','timothy','timothy','teachings,teachings-tags,teachings-series',1,36,'83du6i6gqjoqtd89ro25ouf4b6'),
	(745,'2012-06-02 15:56:26','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6065,'2012-07-03 20:25:23','1 corinthians 1:1','1 corinthians 1:1','downloads',1,0,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(747,'2012-06-02 15:57:35','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6064,'2012-07-03 20:24:54','1 corinthians 1:1','1 corinthians 1:1','teachings-series',1,2,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(749,'2012-06-02 15:58:53','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6063,'2012-07-03 20:24:18','1 corinthians 1:1','1 corinthians 1:1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(751,'2012-06-02 15:59:04','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(753,'2012-06-02 16:01:00','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6062,'2012-07-03 20:23:05','1 corinthians 1','1 corinthians 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,98,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(755,'2012-06-02 16:01:34','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6061,'2012-07-03 20:22:02','1 corinthians 1','1 corinthians 1','teachings,teachings-tags,teachings-series',1,95,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(757,'2012-06-02 16:03:03','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(759,'2012-06-02 16:04:12','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6060,'2012-07-03 16:58:27','Seven Steps To Loving Discipline','seven steps to loving discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kub79jbm8jrfodrk3lrhcqhe12'),
	(761,'2012-06-02 16:04:38','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6059,'2012-07-03 16:57:57','7 Steps To Loving Discipline','7 steps to loving discipline','teachings,teachings-tags,teachings-series',1,0,'kub79jbm8jrfodrk3lrhcqhe12'),
	(763,'2012-06-02 16:05:17','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6058,'2012-07-03 16:57:42','7 Steps To Loving Disciplining','7 steps to loving disciplining','teachings,teachings-tags,teachings-series',1,0,'kub79jbm8jrfodrk3lrhcqhe12'),
	(766,'2012-06-02 16:05:36','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6057,'2012-07-03 16:57:01','Seven Steps To Loving Discipline','seven steps to loving discipline','teachings,teachings-tags,teachings-series',1,0,'kub79jbm8jrfodrk3lrhcqhe12'),
	(768,'2012-06-02 16:07:47','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6056,'2012-07-03 15:58:21','dating','dating','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'pgodau2te8gh0kjv70sf09q1l2'),
	(770,'2012-06-02 16:08:02','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6055,'2012-07-03 15:53:31','dating','dating','teachings,teachings-tags,teachings-series',1,3,'pgodau2te8gh0kjv70sf09q1l2'),
	(772,'2012-06-02 16:08:36','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6054,'2012-07-03 13:52:17','jon marson','jon marson','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'amvku2hnm47rjnbdudlgme47u1'),
	(774,'2012-06-02 16:09:28','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6053,'2012-07-03 12:50:21','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'ls5gpjlnl3pe0jvpqhd04q2rp5'),
	(6052,'2012-07-03 12:32:25','ryan','ryan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'g3cq7379ovpci6sdqul09rh6h4'),
	(778,'2012-06-02 16:09:59','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6051,'2012-07-03 12:27:48','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'ohmf83l9emlnab649o4okciba2'),
	(780,'2012-06-02 16:10:11','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6050,'2012-07-03 12:27:29','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'ohmf83l9emlnab649o4okciba2'),
	(782,'2012-06-02 16:17:41','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,156,'jru7j11o1vlq0jt96bua5178u2'),
	(784,'2012-06-02 16:17:51','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6049,'2012-07-03 11:11:25','2 Peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(786,'2012-06-02 16:19:09','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6048,'2012-07-03 11:11:19','2Peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(788,'2012-06-02 16:19:36','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6047,'2012-07-03 11:11:12','2nd Peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(791,'2012-06-02 16:19:50','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6046,'2012-07-03 11:11:00','2nd Peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(793,'2012-06-02 16:19:56','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6045,'2012-07-03 11:10:37','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(795,'2012-06-02 16:20:16','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6044,'2012-07-03 11:09:45','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(797,'2012-06-02 16:21:54','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6043,'2012-07-03 10:58:56','ruth','ruth','teachings',3,24,'6loi3lvuf6q8jv0eplucdkbur2'),
	(799,'2012-06-02 16:22:25','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6041,'2012-07-03 10:58:32','ruth','ruth','teachings',1,24,'6loi3lvuf6q8jv0eplucdkbur2'),
	(6042,'2012-07-03 10:58:47','ruth','ruth','teachings',2,24,'6loi3lvuf6q8jv0eplucdkbur2'),
	(801,'2012-06-02 16:22:29','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6040,'2012-07-03 10:58:11','ruth','ruth','teachings,teachings-tags,teachings-series',1,31,'6loi3lvuf6q8jv0eplucdkbur2'),
	(803,'2012-06-02 16:22:32','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(805,'2012-06-02 16:23:04','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6039,'2012-07-03 10:47:43','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(807,'2012-06-02 16:24:11','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6038,'2012-07-03 10:47:29','Hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(809,'2012-06-02 16:24:15','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6037,'2012-07-03 10:47:19','Hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(811,'2012-06-02 16:24:19','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6036,'2012-07-03 10:15:47','romans 1','romans 1','teachings,teachings-tags,teachings-series',7,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(813,'2012-06-02 16:25:30','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6035,'2012-07-03 10:15:40','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'f4ktcb5nfv0da8s3ocfkreond2'),
	(815,'2012-06-02 16:26:03','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(817,'2012-06-02 16:26:15','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6034,'2012-07-03 09:38:36','philippians','philippians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'061irvu8ihk8j07fajk8hjkqs2'),
	(819,'2012-06-02 16:26:19','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6033,'2012-07-03 09:24:07','sunday, july 1','sunday, july 1','teachings,teachings-tags,teachings-series',1,0,'o65ntqgdv8lvp8rq2kmncth3f4'),
	(821,'2012-06-02 16:26:21','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6032,'2012-07-03 09:21:23','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'7h1up0efvn745eljegbaot7il3'),
	(823,'2012-06-02 16:26:56','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(825,'2012-06-02 16:27:50','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6031,'2012-07-03 09:21:18','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'7h1up0efvn745eljegbaot7il3'),
	(827,'2012-06-02 16:27:58','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6030,'2012-07-03 09:20:28','Hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'7h1up0efvn745eljegbaot7il3'),
	(829,'2012-06-02 16:29:40','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6028,'2012-07-03 09:19:00','Hebrews','hebrews','teachings-series',1,0,'7h1up0efvn745eljegbaot7il3'),
	(6029,'2012-07-03 09:20:21','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'7h1up0efvn745eljegbaot7il3'),
	(831,'2012-06-02 16:30:32','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(833,'2012-06-02 16:31:46','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6026,'2012-07-03 09:17:42','hebrews 1','hebrews 1','teachings-series',1,0,'7h1up0efvn745eljegbaot7il3'),
	(6027,'2012-07-03 09:17:49','hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'7h1up0efvn745eljegbaot7il3'),
	(835,'2012-06-02 16:31:59','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6025,'2012-07-03 09:17:28','hebrews 1','hebrews 1','teachings,teachings-tags,teachings-series',1,18,'7h1up0efvn745eljegbaot7il3'),
	(6024,'2012-07-03 09:16:50','Hosea 1','hosea 1','teachings,teachings-tags,teachings-series',1,14,'7h1up0efvn745eljegbaot7il3'),
	(6023,'2012-07-03 09:16:38','Hosea','hosea','teachings,teachings-tags,teachings-series',1,14,'7h1up0efvn745eljegbaot7il3'),
	(839,'2012-06-02 16:33:54','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6022,'2012-07-03 08:44:51','philemon','philemon','teachings,teachings-tags,teachings-series',1,4,'83du6i6gqjoqtd89ro25ouf4b6'),
	(841,'2012-06-02 16:34:58','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6021,'2012-07-03 08:43:23','titus','titus','teachings,teachings-tags,teachings-series',1,4,'83du6i6gqjoqtd89ro25ouf4b6'),
	(843,'2012-06-02 16:37:02','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(845,'2012-06-02 16:38:41','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6020,'2012-07-03 08:11:50','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(847,'2012-06-02 16:39:37','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6019,'2012-07-03 08:11:43','secondpeter','2 Peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(849,'2012-06-02 16:40:28','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6018,'2012-07-03 08:11:37','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(851,'2012-06-02 16:41:38','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(853,'2012-06-02 16:41:51','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6017,'2012-07-03 08:11:35','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(855,'2012-06-02 16:42:04','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6016,'2012-07-03 08:11:27','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(857,'2012-06-02 16:42:32','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(6015,'2012-07-03 08:11:18','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(859,'2012-06-02 16:43:17','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,156,'jru7j11o1vlq0jt96bua5178u2'),
	(861,'2012-06-02 16:43:33','brethren','brethren','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6014,'2012-07-03 08:11:05','2 Peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(863,'2012-06-02 16:43:41','bright','bright','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6013,'2012-07-03 08:10:59','2 peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(865,'2012-06-02 16:45:15','bright','bright','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6012,'2012-07-03 08:10:38','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(867,'2012-06-02 16:46:29','bright','bright','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(869,'2012-06-02 16:47:36','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6011,'2012-07-03 08:10:35','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(871,'2012-06-02 16:47:46','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6010,'2012-07-03 08:10:33','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(873,'2012-06-02 16:50:22','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6009,'2012-07-03 08:10:07','2nd peter','2nd peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(875,'2012-06-02 16:50:58','march','march','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(877,'2012-06-02 16:51:03','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6008,'2012-07-03 08:09:15','wemons','Women’s ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(879,'2012-06-02 16:52:51','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6007,'2012-07-03 08:08:52','wemons','wemons','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(881,'2012-06-02 16:53:15','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6006,'2012-07-03 08:04:53','revelations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(883,'2012-06-02 16:53:24','march','march','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(885,'2012-06-02 16:53:31','mercy','mercy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'jru7j11o1vlq0jt96bua5178u2'),
	(6005,'2012-07-03 08:04:46','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(887,'2012-06-02 16:54:08','sad story','sad story','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6004,'2012-07-03 08:04:19','revelation','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(889,'2012-06-02 16:54:17','said','said','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(891,'2012-06-02 16:54:26','john','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,95,'jru7j11o1vlq0jt96bua5178u2'),
	(6003,'2012-07-03 08:04:16','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(893,'2012-06-02 16:54:33','jona','jona','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(6002,'2012-07-03 08:04:13','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(895,'2012-06-02 16:54:48','hotdogs','hotdogs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(6001,'2012-07-03 08:04:11','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(897,'2012-06-02 16:58:26','orca','orca','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(899,'2012-06-02 16:59:32','orcas','orcas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(6000,'2012-07-03 08:03:59','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(901,'2012-06-02 17:00:03','orcas','orcas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5999,'2012-07-03 08:03:31','Titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'7bm6rn2siuafopa2km4c4diri4'),
	(5998,'2012-07-03 08:03:21','\"Titus 1\"','\"titus 1\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5997,'2012-07-03 08:03:16','Titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'7bm6rn2siuafopa2km4c4diri4'),
	(5996,'2012-07-03 08:03:04','Titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'7bm6rn2siuafopa2km4c4diri4'),
	(5995,'2012-07-03 08:02:58','\"Titus 1\"','\"titus 1\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5994,'2012-07-03 08:02:51','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'7bm6rn2siuafopa2km4c4diri4'),
	(5993,'2012-07-03 08:01:52','Revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5992,'2012-07-03 08:01:21','Revelatio','revelatio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5991,'2012-07-03 08:01:15','revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5990,'2012-07-03 08:01:11','Revelatio','revelatio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5989,'2012-07-03 08:01:04','Revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(917,'2012-06-02 18:12:09','orcas','orcas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5988,'2012-07-03 08:01:00','Revelat','revelat','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5987,'2012-07-03 08:00:48','revelatio','revelatio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5986,'2012-07-03 08:00:44','revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5985,'2012-07-03 08:00:34','revelatio','revelatio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'7bm6rn2siuafopa2km4c4diri4'),
	(5984,'2012-07-03 07:59:53','revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5983,'2012-07-03 07:59:34','Revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5982,'2012-07-03 07:59:30','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7bm6rn2siuafopa2km4c4diri4'),
	(5981,'2012-07-03 07:59:14','Calvinism','calvinism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'7bm6rn2siuafopa2km4c4diri4'),
	(5980,'2012-07-03 07:57:14','\"2 peter\"','\"2 peter\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(931,'2012-06-02 18:46:07','orcas','orcas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5979,'2012-07-03 07:57:01','\"2 peter\"','\"2 peter\"','teachings,teachings-tags,teachings-series',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(5978,'2012-07-03 07:56:52','\"2 peter\"','\"2 peter\"','teachings,teachings-tags,teachings-series',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(5977,'2012-07-03 07:56:17','2 peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(5976,'2012-07-03 07:56:06','2 peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(5975,'2012-07-03 07:56:02','\"2 peter\"','\"2 peter\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(5974,'2012-07-03 07:55:59','2 peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(5973,'2012-07-03 07:55:52','\"2 peter\"','\"2 peter\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'7bm6rn2siuafopa2km4c4diri4'),
	(5972,'2012-07-03 07:55:18','2 peter','2 peter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,32,'7bm6rn2siuafopa2km4c4diri4'),
	(5971,'2012-07-03 07:53:49','titus','titus','teachings,teachings-tags,teachings-series',1,4,'besbvcoss8mkp63ecorvci39d7'),
	(5970,'2012-07-03 05:55:12','God','god','teachings,teachings-tags,teachings-series',1,200,'sh8h5vvp00pmn52vd52vo3n154'),
	(5969,'2012-07-03 05:39:18','peter','peter','teachings,teachings-tags,teachings-series',2,32,'iabhdtajvfpc2rl0ck2u5i6a36'),
	(5968,'2012-07-03 05:38:57','peter','peter','teachings,teachings-tags,teachings-series',1,32,'iabhdtajvfpc2rl0ck2u5i6a36'),
	(5967,'2012-07-03 05:38:32','Peter','peter','teachings,teachings-tags,teachings-series',1,32,'iabhdtajvfpc2rl0ck2u5i6a36'),
	(5966,'2012-07-03 05:37:53','2nd peter','2nd peter','teachings,teachings-tags,teachings-series',1,0,'iabhdtajvfpc2rl0ck2u5i6a36'),
	(5965,'2012-07-03 05:30:38','Calvinism','calvinism','teachings,teachings-tags,teachings-series',1,2,'ih7lijjgfo990fv1ki7bt422b3'),
	(5964,'2012-07-03 04:10:00','revelations','revelations','teachings-series',1,0,'agaelii3nlhq90bu86gt733cn6'),
	(5963,'2012-07-03 04:09:51','revelations','revelations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'agaelii3nlhq90bu86gt733cn6'),
	(5962,'2012-07-03 04:09:41','revelation','revelation study series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'agaelii3nlhq90bu86gt733cn6'),
	(5961,'2012-07-03 04:09:34','revelation','revelation study series','teachings,teachings-tags,teachings-series',1,0,'agaelii3nlhq90bu86gt733cn6'),
	(5960,'2012-07-03 03:42:45','church','church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,164,'nrq1ml4dmchtnlhl0gdq2475q6'),
	(5959,'2012-07-03 03:42:35','hi','hi','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'nrq1ml4dmchtnlhl0gdq2475q6'),
	(5958,'2012-07-03 01:11:52','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,95,'ms5n45dstle4stj4f269l0n345'),
	(5957,'2012-07-03 01:05:43','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,95,'ms5n45dstle4stj4f269l0n345'),
	(5956,'2012-07-03 01:04:57','corinthians','corinthians','teachings,teachings-tags,teachings-series',1,95,'ms5n45dstle4stj4f269l0n345'),
	(5955,'2012-07-03 01:03:33','provoke','provoke','teachings,teachings-tags,teachings-series',1,0,'ms5n45dstle4stj4f269l0n345'),
	(5954,'2012-07-03 00:26:05','timoth','timoth','teachings,teachings-tags,teachings-series',1,36,'83du6i6gqjoqtd89ro25ouf4b6'),
	(5953,'2012-07-02 23:30:16','marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5952,'2012-07-02 23:30:06','mariage','mariage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5951,'2012-07-02 23:29:48','mariage','mariage','downloads',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5950,'2012-07-02 23:29:42','marriage','marriage','downloads',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5949,'2012-07-02 23:29:14','download','download','downloads',1,1,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5948,'2012-07-02 23:29:03','download','download','teachings,teachings-tags,teachings-series',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5947,'2012-07-02 23:23:42','marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5946,'2012-07-02 23:23:35','marriage','marriage','downloads',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5945,'2012-07-02 23:23:10','marriage','marriage','teachings,teachings-tags,teachings-series',1,13,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(971,'2012-06-02 21:38:15','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(972,'2012-06-02 21:38:20','bret','bret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,156,'jru7j11o1vlq0jt96bua5178u2'),
	(5943,'2012-07-02 23:21:20','corinthicans','corinthicans','downloads',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5944,'2012-07-02 23:21:34','corinthians','corinthians','downloads',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(5942,'2012-07-02 23:21:03','corinthicans','corinthicans','teachings,teachings-tags,teachings-series',1,0,'ju7nl3jro2jpeq7kqm2tmn4p20'),
	(975,'2012-06-02 21:39:03','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5941,'2012-07-02 23:05:24','jeff young','jeff young','teachings,teachings-tags,teachings-series',1,11,'ii1qgc5vogh14opbijf0t2p1t1'),
	(978,'2012-06-02 21:54:14','releas','releas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5940,'2012-07-02 21:53:08','september 2004','september 2004','teachings,teachings-tags,teachings-series',1,0,'0mv2hvfnjt1rg0ufgb3kcrt3t0'),
	(5939,'2012-07-02 21:52:05','james','james','teachings,teachings-tags,teachings-series',2,17,'0mv2hvfnjt1rg0ufgb3kcrt3t0'),
	(981,'2012-06-02 21:54:57','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5938,'2012-07-02 21:51:42','james','james','teachings,teachings-tags,teachings-series',1,17,'0mv2hvfnjt1rg0ufgb3kcrt3t0'),
	(983,'2012-06-02 21:55:57','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5937,'2012-07-02 21:36:29','matthew','matthew','teachings,teachings-tags,teachings-series',5,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(985,'2012-06-02 21:56:54','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5936,'2012-07-02 21:35:43','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(987,'2012-06-02 21:58:26','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5935,'2012-07-02 21:14:33','podcast','podcast','teachings,teachings-tags,teachings-series',1,0,'pba0maidq7g1m10n72l56c9jf1'),
	(989,'2012-06-02 22:01:02','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5934,'2012-07-02 21:08:44','end','end','teachings,teachings-tags,teachings-series',1,83,'7apj17t6l5ajm6v9ialhskf9d0'),
	(991,'2012-06-02 22:02:30','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5933,'2012-07-02 20:44:59','psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'gi4msr2kdq16tc39q2etnrqvo5'),
	(993,'2012-06-02 22:03:04','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5932,'2012-07-02 20:41:05','videos','videos','teachings,teachings-tags,teachings-series',1,0,'uqrjfnmm9ftu2hehldhu2irfk0'),
	(995,'2012-06-02 22:13:51','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5931,'2012-07-02 20:33:30','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'s9t1gjqctbd2t2dbv4jo1s5hg3'),
	(5930,'2012-07-02 20:33:19','titus','titus','teachings-series',1,0,'s9t1gjqctbd2t2dbv4jo1s5hg3'),
	(5929,'2012-07-02 20:32:19','titus','titus','teachings,teachings-tags,teachings-series',1,4,'s9t1gjqctbd2t2dbv4jo1s5hg3'),
	(5928,'2012-07-02 20:28:38','Jesus','jesus','teachings,teachings-tags,teachings-series',1,267,'jfvitb3o4044dpmu4a7ervp6c6'),
	(5927,'2012-07-02 19:24:54','Jedediah','jedediah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5926,'2012-07-02 19:16:59','rev','rev','teachings-series',1,2,'73nb43p16e663h6qg96qn81vs6'),
	(5925,'2012-07-02 19:16:31','revelations','revelations','teachings-series',1,0,'73nb43p16e663h6qg96qn81vs6'),
	(5924,'2012-07-02 19:16:09','revelations','revelations','teachings,teachings-tags,teachings-series',1,0,'73nb43p16e663h6qg96qn81vs6'),
	(5923,'2012-07-02 18:40:14','titus','titus','teachings,teachings-tags,teachings-series',1,4,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5922,'2012-07-02 17:57:55','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,288,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5921,'2012-07-02 17:57:43','jesus','jesus','teachings,teachings-tags,teachings-series',1,267,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5920,'2012-07-02 17:55:28','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5919,'2012-07-02 17:55:22','titus','titus','teachings,teachings-tags,teachings-series',1,4,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5918,'2012-07-02 17:50:17','most recent sermons','most recent sermons','teachings,teachings-tags,teachings-series',1,0,'b3bruqjaeukukck223e7ck3id3'),
	(5917,'2012-07-02 17:41:45','titus','titus','teachings,teachings-tags,teachings-series',1,4,'b3bruqjaeukukck223e7ck3id3'),
	(1011,'2012-06-02 23:50:55','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(1013,'2012-06-02 23:51:53','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5916,'2012-07-02 17:38:46','end times','end times','teachings,teachings-tags,teachings-series',1,22,'hnqiafgkb9373u8hv33af3vs10'),
	(1015,'2012-06-02 23:53:03','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5915,'2012-07-02 16:44:17','Luke 1:26','luke 1:26','teachings,teachings-tags,teachings-series',1,1,'hdm5na3lfgs9uk7sft58v2lp14'),
	(5914,'2012-07-02 16:41:12','Luke 2','luke 2','teachings,teachings-tags,teachings-series',1,59,'hdm5na3lfgs9uk7sft58v2lp14'),
	(1018,'2012-06-03 00:01:02','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5912,'2012-07-02 16:03:20','moses','moses','teachings-tags',1,1,'7bm6rn2siuafopa2km4c4diri4'),
	(5913,'2012-07-02 16:07:54','hell','hell','teachings,teachings-tags,teachings-series',1,8,'kgec2i84lqnmqbijtakbb29jp7'),
	(1020,'2012-06-03 00:01:48','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(1022,'2012-06-03 00:02:23','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5911,'2012-07-02 16:03:04','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,288,'7bm6rn2siuafopa2km4c4diri4'),
	(1024,'2012-06-03 00:02:31','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5910,'2012-07-02 15:05:30','romans ch 1','romans ch 1','teachings,teachings-tags,teachings-series',1,65,'veimqp64bfsl8sf330m82081m6'),
	(1026,'2012-06-03 00:03:10','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(5909,'2012-07-02 15:04:56','romans 1','romans 1','teachings,teachings-tags,teachings-series',5,65,'veimqp64bfsl8sf330m82081m6'),
	(1028,'2012-06-03 00:04:17','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5908,'2012-07-02 15:04:41','romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'veimqp64bfsl8sf330m82081m6'),
	(1030,'2012-06-03 00:04:24','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5907,'2012-07-02 15:04:11','romans','romans','teachings,teachings-tags,teachings-series',5,65,'veimqp64bfsl8sf330m82081m6'),
	(1032,'2012-06-03 00:04:33','release','release','events-recurring',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5906,'2012-07-02 15:03:39','romans','romans','teachings,teachings-tags,teachings-series',1,65,'veimqp64bfsl8sf330m82081m6'),
	(1034,'2012-06-03 00:05:01','meeting','meeting','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5905,'2012-07-02 14:38:45','john 8','john 8','teachings,teachings-tags,teachings-series',1,95,'6r764nqmr5g2ip9g1gp4ccqap1'),
	(1036,'2012-06-03 00:05:29','meeting','meeting','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5904,'2012-07-02 14:18:51','saturday','saturday','teachings,teachings-tags,teachings-series',1,3,'c77oeh1tt3jjks30lkbmamqe10'),
	(1038,'2012-06-03 00:07:11','meeting','meeting','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5903,'2012-07-02 14:18:07','sabath','sabath','teachings,teachings-tags,teachings-series',1,0,'c77oeh1tt3jjks30lkbmamqe10'),
	(1040,'2012-06-03 00:08:08','meeting','meeting','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5902,'2012-07-02 13:43:08','Christmas','christmas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,16,'j4hr3q5b3qubqouigrku6igna0'),
	(1042,'2012-06-03 00:09:05','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(1044,'2012-06-03 00:10:40','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5901,'2012-07-02 13:41:20','art','art','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,173,'j4hr3q5b3qubqouigrku6igna0'),
	(1046,'2012-06-03 00:10:44','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5900,'2012-07-02 13:41:03','kirk','kirk','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'j4hr3q5b3qubqouigrku6igna0'),
	(1048,'2012-06-03 00:12:23','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5899,'2012-07-02 13:29:24','S1-583','s1-583','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'v3v5p9alkhcgqp412hg6romka4'),
	(1050,'2012-06-03 00:12:32','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(1052,'2012-06-03 00:13:29','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5898,'2012-07-02 13:29:20','s1-583','s1-583','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'v3v5p9alkhcgqp412hg6romka4'),
	(1054,'2012-06-03 00:14:03','meeting','meeting','tags',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5897,'2012-07-02 12:40:06','luke','luke','teachings,teachings-tags,teachings-series',1,59,'4nv74fu8uf2t289olip1orkko6'),
	(1056,'2012-06-03 00:14:27','meeting','meeting','teachings',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5896,'2012-07-02 12:39:31','luke 1:2','luke 1:2','teachings,teachings-tags,teachings-series',1,1,'4nv74fu8uf2t289olip1orkko6'),
	(1058,'2012-06-03 00:14:31','god','god','teachings',1,150,'jru7j11o1vlq0jt96bua5178u2'),
	(5895,'2012-07-02 12:37:52','luke 1','luke 1','teachings,teachings-tags,teachings-series',1,59,'4nv74fu8uf2t289olip1orkko6'),
	(1060,'2012-06-03 00:15:13','missions','missions','teachings',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5894,'2012-07-02 12:11:31','luke','luke','teachings,teachings-tags,teachings-series',1,59,'4nv74fu8uf2t289olip1orkko6'),
	(1062,'2012-06-03 00:15:23','mission','mission','teachings',1,7,'jru7j11o1vlq0jt96bua5178u2'),
	(5893,'2012-07-02 12:04:21','s1-583','s1-583','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'v3v5p9alkhcgqp412hg6romka4'),
	(1064,'2012-06-03 00:15:45','new here','new here','teachings',1,3,'jru7j11o1vlq0jt96bua5178u2'),
	(5892,'2012-07-02 12:03:53','S1-583','s1-583','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'v3v5p9alkhcgqp412hg6romka4'),
	(1066,'2012-06-03 00:16:08','new here','new here','teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(1068,'2012-06-03 00:16:19','bible','bible','teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5891,'2012-07-02 10:36:33','Jonathan Simcoe','jonathan simcoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(5890,'2012-07-02 10:36:12','Jeff Young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(1072,'2012-06-03 00:17:24','thess','thess','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5889,'2012-07-02 10:35:41','Brett Meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,24,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(5888,'2012-07-02 10:35:30','Jonathan Simcoe','jonathan simcoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'dmioc0is7h4v5fnb7b4e1opqb0'),
	(5887,'2012-07-02 08:46:36','sunday july 1','sunday july 1','teachings,teachings-tags,teachings-series',1,1,'3jp39il0v6dindh99uuamliko3'),
	(5886,'2012-07-02 07:15:28','revelation','revelation study series','teachings',1,0,'kgec2i84lqnmqbijtakbb29jp7'),
	(5885,'2012-07-02 07:14:58','revelation','revelation study series','teachings,teachings-tags,teachings-series',3,0,'kgec2i84lqnmqbijtakbb29jp7'),
	(5884,'2012-07-02 03:34:14','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'kgec2i84lqnmqbijtakbb29jp7'),
	(1079,'2012-06-03 00:18:44','thess','thess','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5883,'2012-07-02 03:33:53','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'kgec2i84lqnmqbijtakbb29jp7'),
	(5882,'2012-07-02 03:33:30','revelation','revelation','teachings-series',1,0,'kgec2i84lqnmqbijtakbb29jp7'),
	(5881,'2012-07-02 03:33:20','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'kgec2i84lqnmqbijtakbb29jp7'),
	(5880,'2012-07-02 03:32:21','revelation study series','revelation study series','teachings-series',1,0,'kgec2i84lqnmqbijtakbb29jp7'),
	(5879,'2012-07-02 03:29:26','revelation study series','revelation study series','teachings,teachings-tags,teachings-series',1,0,'kgec2i84lqnmqbijtakbb29jp7'),
	(5878,'2012-07-02 02:00:59','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'kgec2i84lqnmqbijtakbb29jp7'),
	(5877,'2012-07-02 00:38:46','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',8,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5876,'2012-07-02 00:38:29','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',7,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5875,'2012-07-02 00:38:12','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',6,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5874,'2012-07-02 00:37:41','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',5,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5873,'2012-07-02 00:37:23','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',4,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5872,'2012-07-02 00:36:56','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',3,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5871,'2012-07-02 00:36:23','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',2,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5870,'2012-07-02 00:35:28','Psalm 41','psalm 41','teachings,teachings-tags,teachings-series',1,97,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5869,'2012-07-01 23:47:44','Teachings','teachings','teachings-series',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(5868,'2012-07-01 23:45:05','Teachings','teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(5867,'2012-07-01 23:44:41','Sermons','sermons','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(5866,'2012-07-01 23:00:35','matthew','matthew','teachings,teachings-tags,teachings-series',6,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(5865,'2012-07-01 22:42:58','matthew','matthew','teachings,teachings-tags,teachings-series',6,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(5864,'2012-07-01 22:42:24','matthew','matthew','teachings,teachings-tags,teachings-series',5,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(5863,'2012-07-01 22:42:14','matthew','matthew','teachings,teachings-tags,teachings-series',3,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(5862,'2012-07-01 22:41:56','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(5861,'2012-07-01 21:24:49','timothy','timothy','teachings,teachings-tags,teachings-series',1,36,'83du6i6gqjoqtd89ro25ouf4b6'),
	(5860,'2012-07-01 21:04:44','Simcoe','simcoe','teachings,teachings-tags,teachings-series',1,3,'7oosufggd4ku44m9u3l0367ua5'),
	(5859,'2012-07-01 21:03:51','Jeff young','jeff young','teachings,teachings-tags,teachings-series',1,11,'7oosufggd4ku44m9u3l0367ua5'),
	(5858,'2012-07-01 21:00:26','Calvinism','calvinism','teachings,teachings-tags,teachings-series',1,2,'l1volo9kcm4fsd10niaev628t6'),
	(5856,'2012-07-01 19:57:32','titus','titus','events-recurring',1,0,'tqhd0t0vte2n7iikkirnudu6h3'),
	(5857,'2012-07-01 20:08:33','strength','strength','teachings,teachings-tags,teachings-series',1,7,'ktce3v8oap56bbgoa7c0m62v66'),
	(5855,'2012-07-01 19:57:00','titus','titus','teachings,teachings-tags,teachings-series',1,4,'tqhd0t0vte2n7iikkirnudu6h3'),
	(5854,'2012-07-01 19:56:44','july 1st','july 1st','teachings,teachings-tags,teachings-series',1,0,'tqhd0t0vte2n7iikkirnudu6h3'),
	(5853,'2012-07-01 19:56:31','july 1Search..','july 1search..','teachings,teachings-tags,teachings-series',1,0,'tqhd0t0vte2n7iikkirnudu6h3'),
	(5851,'2012-07-01 19:19:52','titus','titus','teachings-series',1,0,'e5hn72jvvefsb71oikh30hlih4'),
	(5852,'2012-07-01 19:20:01','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'e5hn72jvvefsb71oikh30hlih4'),
	(5850,'2012-07-01 19:18:41','titus','titus','teachings,teachings-tags,teachings-series',1,4,'e5hn72jvvefsb71oikh30hlih4'),
	(5849,'2012-07-01 19:08:34','tw','tw','teachings,teachings-tags,teachings-series',1,0,'s1hi8dfvscuvlsmaun65vng331'),
	(5848,'2012-07-01 19:08:26','tn','tn','teachings,teachings-tags,teachings-series',1,0,'s1hi8dfvscuvlsmaun65vng331'),
	(5847,'2012-07-01 18:59:18','july 1 2012 Search..','july 1 2012 search..','teachings,teachings-tags,teachings-series',1,0,'s9t1gjqctbd2t2dbv4jo1s5hg3'),
	(5846,'2012-07-01 18:58:53','june 30','june 30','teachings,teachings-tags,teachings-series',1,0,'2idmfkj0ih2hq8s1flpnqcsup2'),
	(5845,'2012-07-01 17:56:12','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(5844,'2012-07-01 17:56:01','revelation','revelation','downloads',1,0,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(5843,'2012-07-01 17:55:54','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(5842,'2012-07-01 17:13:20','the Lord\'s provision','the lord\'s provision','teachings,teachings-tags,teachings-series',1,0,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(5841,'2012-07-01 17:13:00','Jeff Young','jeff young','teachings,teachings-tags,teachings-series',1,11,'ii1qgc5vogh14opbijf0t2p1t1'),
	(5840,'2012-07-01 17:12:34','provision','provision','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(5839,'2012-07-01 17:12:18','provision','provision','teachings,teachings-tags,teachings-series',1,2,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(5838,'2012-07-01 17:12:03','God\'s provision','god\'s provision','teachings,teachings-tags,teachings-series',1,1,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(5837,'2012-07-01 17:05:14','wait','wait','teachings,teachings-tags,teachings-series',1,8,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(5836,'2012-07-01 16:53:38','bryn','bryn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'7bm6rn2siuafopa2km4c4diri4'),
	(5835,'2012-07-01 16:50:58','wednesday','wednesday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,799,'euqfqn8l1p6hbe64vd60vl04q4'),
	(5834,'2012-07-01 16:50:44','wednesday','wednesday','teachings,teachings-tags,teachings-series',1,788,'euqfqn8l1p6hbe64vd60vl04q4'),
	(5833,'2012-07-01 16:49:10','q777777777777777777777777777777777777777777777768\\','q777777777777777777777777777777777777777777777768\\','teachings,teachings-tags,teachings-series',1,0,'g6flu4blvb6c8f34olpgd5tk56'),
	(5832,'2012-07-01 15:51:04','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'hndo1pd9bpd7t0nvq4si9vbcr0'),
	(5831,'2012-07-01 15:37:00','family','family','teachings,teachings-tags,teachings-series',1,27,'ja6c3hsjqma4e8j6kt7u2kmj55'),
	(5830,'2012-07-01 15:01:21','titusSearch..','titussearch..','downloads',1,0,'gkhauauvrvv3smkiln4cl4vi96'),
	(5829,'2012-07-01 15:01:04','titusSearch..','titussearch..','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'gkhauauvrvv3smkiln4cl4vi96'),
	(5828,'2012-07-01 15:00:53','titusSearch..','titussearch..','teachings,teachings-tags,teachings-series',1,0,'gkhauauvrvv3smkiln4cl4vi96'),
	(5826,'2012-07-01 14:59:36','podcasts','podcasts','teachings',1,0,'htpgmtqkbhtco727hkbq1pfkq4'),
	(5827,'2012-07-01 14:59:44','podcasts','podcasts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'htpgmtqkbhtco727hkbq1pfkq4'),
	(5825,'2012-07-01 14:59:26','podcasts','podcasts','downloads',1,0,'htpgmtqkbhtco727hkbq1pfkq4'),
	(5824,'2012-07-01 14:59:19','podcasts','podcasts','teachings,teachings-tags,teachings-series',1,0,'htpgmtqkbhtco727hkbq1pfkq4'),
	(5823,'2012-07-01 14:40:44','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,288,'727pospdiu5ejhvla9g4nt37e6'),
	(5822,'2012-07-01 13:38:40','day by day','day by day','teachings,teachings-tags,teachings-series',1,1649,'9p2c4mvs1uadktrtnckep9r974'),
	(5821,'2012-07-01 13:34:39','Jeremiah','jeremiah','teachings,teachings-tags,teachings-series',1,44,'96locd0vmnim4dotmc19iasqr5'),
	(5820,'2012-07-01 13:31:11','titus','titus','teachings',1,4,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5819,'2012-07-01 13:30:38','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5818,'2012-07-01 13:30:19','book of titus chapter one','book of titus chapter one','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5817,'2012-07-01 13:30:11','sunday\'s july 1st serviceSearch..','sunday\'s july 1st servicesearch..','teachings,teachings-tags,teachings-series',1,0,'e56fjog56a13pge585t0hfq2h2'),
	(5816,'2012-07-01 13:30:09','book of titus chapter one','book of titus chapter one','teachings,teachings-tags,teachings-series',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5815,'2012-07-01 13:27:21','titus','titus','teachings,teachings-tags,teachings-series',1,4,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5813,'2012-07-01 12:58:34','Titus','titus','teachings-series',1,0,'7h4vjmds9ticq5hl28dnlieg16'),
	(5814,'2012-07-01 13:26:58','titusSearch..','titussearch..','teachings,teachings-tags,teachings-series',1,0,'ckejobeu5s5u28b1h9i34sa2q3'),
	(5811,'2012-07-01 12:57:54','Titus','titus','events-recurring',1,0,'7h4vjmds9ticq5hl28dnlieg16'),
	(5812,'2012-07-01 12:58:08','Titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'7h4vjmds9ticq5hl28dnlieg16'),
	(5810,'2012-07-01 12:57:33','Titus','titus','teachings,teachings-tags,teachings-series',1,4,'7h4vjmds9ticq5hl28dnlieg16'),
	(5809,'2012-07-01 12:57:18','Search..Titus','search..titus','teachings,teachings-tags,teachings-series',1,0,'7h4vjmds9ticq5hl28dnlieg16'),
	(5808,'2012-07-01 11:40:42','DAVID','david','teachings',1,17,'061irvu8ihk8j07fajk8hjkqs2'),
	(5807,'2012-07-01 11:40:24','DAVID','david','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,28,'061irvu8ihk8j07fajk8hjkqs2'),
	(5806,'2012-07-01 10:51:47','james','james','downloads',1,0,'qhiblvjimfo2q1fm5nk264u2s4'),
	(5805,'2012-07-01 10:51:37','james','james','teachings,teachings-tags,teachings-series',1,17,'qhiblvjimfo2q1fm5nk264u2s4'),
	(5804,'2012-07-01 09:48:24','ezekiel','ezekiel','teachings,teachings-tags,teachings-series',1,36,'v75l31ipp93umlc4oi9oqb6mj0'),
	(5803,'2012-07-01 09:35:39','Nate','nate','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'5njva3cgms1balfm4lnfdrf326'),
	(5802,'2012-07-01 09:31:55','catholic','catholic','teachings-tags',1,1,'7351no9k1sfjhg71odp93bmn43'),
	(5801,'2012-07-01 09:29:02','catholic(s)','catholic(s)','teachings-tags',1,1,'7351no9k1sfjhg71odp93bmn43'),
	(5799,'2012-07-01 08:53:58','june 24','june 24','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5800,'2012-07-01 09:28:56','catholics','catholics','teachings-tags',1,0,'7351no9k1sfjhg71odp93bmn43'),
	(5798,'2012-07-01 08:53:57','6-24','6-24','teachings',1,7,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5797,'2012-07-01 08:53:54','6-24-2012','6-24-2012','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5795,'2012-07-01 08:52:04','2012-6-12','2012-6-12','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5796,'2012-07-01 08:53:50','2012-6-12','2012-6-12','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5794,'2012-07-01 08:51:56','6-24-2012','6-24-2012','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5792,'2012-07-01 08:51:33','june 24','june 24','teachings',1,0,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5793,'2012-07-01 08:51:39','6-24','6-24','teachings',1,7,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5791,'2012-07-01 08:51:26','june 24','june 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5790,'2012-07-01 08:49:29','david','david','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,28,'1a8l374skbd36ucrcuuh4vl3m7'),
	(5789,'2012-07-01 08:35:51','Genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'c61a7nkb4ogc45bsseflum1vc1'),
	(5788,'2012-07-01 08:35:24','Search..','search..','teachings,teachings-tags,teachings-series',1,0,'c61a7nkb4ogc45bsseflum1vc1'),
	(5787,'2012-07-01 08:34:36','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,288,'c61a7nkb4ogc45bsseflum1vc1'),
	(5786,'2012-07-01 08:34:22','Jesus','jesus','teachings,teachings-tags,teachings-series',1,267,'c61a7nkb4ogc45bsseflum1vc1'),
	(5785,'2012-07-01 08:19:13','philippians','philippians','teachings-series',1,1,'v6b7bupvmprnep58iivtdollj4'),
	(5784,'2012-07-01 08:17:59','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'v6b7bupvmprnep58iivtdollj4'),
	(5783,'2012-07-01 08:17:46','phillippians','phillippians','teachings,teachings-tags,teachings-series',1,0,'v6b7bupvmprnep58iivtdollj4'),
	(5781,'2012-07-01 00:10:37','2012','2012','teachings',1,57,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5782,'2012-07-01 07:40:01','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'2lgfhht8dg1ev2pkrmm34o9u03'),
	(5780,'2012-07-01 00:07:54','Timothy','timothy','teachings',1,33,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5779,'2012-07-01 00:06:55','June 30','june 30','teachings',1,0,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5778,'2012-07-01 00:06:26','June 30','june 30','teachings,teachings-tags,teachings-series',1,0,'5h0v4un9nb0p23dl5nohl2p2e4'),
	(5777,'2012-06-30 23:33:18','titus','titus','teachings,teachings-tags,teachings-series',1,4,'83du6i6gqjoqtd89ro25ouf4b6'),
	(5776,'2012-06-30 23:21:23','Search..Romans','search..romans','teachings,teachings-tags,teachings-series',1,0,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(5774,'2012-06-30 22:00:29','revelation','revelation','teachings',1,85,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5775,'2012-06-30 22:00:52','revelation','revelation','teachings',2,85,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5773,'2012-06-30 22:00:13','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5771,'2012-06-30 21:59:33','revelation','revelation','teachings-series',1,0,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5772,'2012-06-30 21:59:48','revelation','revelation','downloads',1,0,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5770,'2012-06-30 21:58:53','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5768,'2012-06-30 21:51:26','revelation','revelation','downloads',1,0,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5769,'2012-06-30 21:58:31','revelation     rch..','revelation     rch..','teachings,teachings-tags,teachings-series',1,0,'qtv8r2qrsh0r20pnr7fbdghnq6'),
	(5767,'2012-06-30 21:50:57','revelation','revelation','teachings-series',1,0,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5766,'2012-06-30 21:49:39','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5765,'2012-06-30 21:49:27','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5764,'2012-06-30 21:49:15','e','e','teachings,teachings-tags,teachings-series',1,0,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5763,'2012-06-30 21:49:06','revalation','revalation','teachings,teachings-tags,teachings-series',1,0,'4bmknlr2cg0eoq3naqg507l2j3'),
	(5762,'2012-06-30 20:36:47','saturday june 30','saturday june 30','teachings,teachings-tags,teachings-series',1,0,'4aqbe2ekek2iivvq1ei2fnolg3'),
	(5761,'2012-06-30 20:25:46','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,19,'eqr48mphd6vp0itnqqq6v6h2a0'),
	(5760,'2012-06-30 20:15:44','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,19,'fj6k3pdga98v4sgkko33qeepb5'),
	(5759,'2012-06-30 19:46:38','john','john','teachings',1,92,'6ceqovpetd05ahq6kuv7tbq1h1'),
	(5758,'2012-06-30 19:46:32','john','john','teachings,teachings-tags,teachings-series',1,95,'6ceqovpetd05ahq6kuv7tbq1h1'),
	(5757,'2012-06-30 16:19:52','violence','violence','teachings,teachings-tags,teachings-series',1,1,'1sbloqvi6odefc8bge8hd8r6v2'),
	(5756,'2012-06-30 16:19:28','costco','costco','teachings,teachings-tags,teachings-series',1,0,'1sbloqvi6odefc8bge8hd8r6v2'),
	(5755,'2012-06-30 14:49:39','jesus','jesus','teachings,teachings-tags,teachings-series',1,262,'ac2o1s3bss0ejb6bvodbaggmc2'),
	(5754,'2012-06-30 12:48:05','rev 1','rev 1','teachings,teachings-tags,teachings-series',1,108,'sqk28v7c51mi4c4b6gg0q828e2'),
	(5753,'2012-06-29 16:14:47','creation','creation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'rqlo8qf5ih7m7htfn3l0s4es62'),
	(5752,'2012-06-29 16:14:32','creation','creation','teachings,teachings-tags,teachings-series',1,4,'rqlo8qf5ih7m7htfn3l0s4es62'),
	(5751,'2012-06-29 16:14:18','evolution','evolution','teachings,teachings-tags,teachings-series',1,3,'rqlo8qf5ih7m7htfn3l0s4es62'),
	(5750,'2012-06-29 16:13:58','heal','heal','teachings,teachings-tags,teachings-series',1,28,'rqlo8qf5ih7m7htfn3l0s4es62'),
	(5749,'2012-06-29 14:57:44','sdfsdfsd','sdfsdfsd','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'hch8r8sv5vr1u2p0p8lb0n2le1'),
	(5748,'2012-06-29 09:33:25','jesus','jesus','teachings,teachings-tags,teachings-series',1,258,'1110vkpp1428aqn6j1iecludu6'),
	(5747,'2012-06-29 08:14:20','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,16,'vgp68g4737tsf6f1u5imqrqml4'),
	(5746,'2012-06-27 21:38:28','bobby','bobby','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'03a116dd4p8tso1t23m5ta3lg7'),
	(5745,'2012-06-27 21:37:54','david frost','david frost','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'03a116dd4p8tso1t23m5ta3lg7'),
	(5743,'2012-06-26 22:06:17','salvation','salvation','downloads',1,0,'h568ggse52t89r8uqlin7eghf7'),
	(5744,'2012-06-27 18:50:04','morgan court','morgan court','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'03a116dd4p8tso1t23m5ta3lg7'),
	(5742,'2012-06-26 22:05:37','salvation','salvation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'h568ggse52t89r8uqlin7eghf7'),
	(5740,'2012-06-24 16:40:05','ministry','ministry','text',1,14,'h568ggse52t89r8uqlin7eghf7'),
	(5741,'2012-06-26 22:02:10','amos','amos','teachings,teachings-tags,teachings-series',1,9,'2o99433b1iu7u9v9talc1en9n0'),
	(5739,'2012-06-24 16:39:57','ministry','ministry','tags',1,8,'h568ggse52t89r8uqlin7eghf7'),
	(5738,'2012-06-24 16:39:40','ministry','ministry','teachings',1,16,'h568ggse52t89r8uqlin7eghf7'),
	(5736,'2012-06-24 16:38:26','ministry','ministry','events-recurring',1,3,'h568ggse52t89r8uqlin7eghf7'),
	(5737,'2012-06-24 16:39:34','ministry','ministry','teachings-series',1,0,'h568ggse52t89r8uqlin7eghf7'),
	(5735,'2012-06-24 16:37:15','ministry','ministry','tags',1,8,'h568ggse52t89r8uqlin7eghf7'),
	(5734,'2012-06-24 16:37:11','ministry','ministry','events',1,5,'h568ggse52t89r8uqlin7eghf7'),
	(5732,'2012-06-24 16:36:34','church','church','downloads',1,0,'h568ggse52t89r8uqlin7eghf7'),
	(5733,'2012-06-24 16:36:43','ministry','ministry','downloads',1,1,'h568ggse52t89r8uqlin7eghf7'),
	(5731,'2012-06-24 16:36:28','a','a','downloads',1,0,'h568ggse52t89r8uqlin7eghf7'),
	(5730,'2012-06-24 16:36:19','love','love','downloads',1,0,'h568ggse52t89r8uqlin7eghf7'),
	(5729,'2012-06-24 16:36:00','love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'h568ggse52t89r8uqlin7eghf7'),
	(5728,'2012-06-24 15:27:38','Love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'sb1t7c23ksbnshcons8l0t5sr2'),
	(5727,'2012-06-24 13:03:38','peace','peace','teachings,teachings-tags,teachings-series',1,8,'sb1t7c23ksbnshcons8l0t5sr2'),
	(5726,'2012-06-24 13:03:33','peace-maker','peace-maker','teachings,teachings-tags,teachings-series',1,1,'sb1t7c23ksbnshcons8l0t5sr2'),
	(5725,'2012-06-24 13:02:01','Peace','peace','teachings,teachings-tags,teachings-series',1,8,'sb1t7c23ksbnshcons8l0t5sr2'),
	(5724,'2012-06-24 13:01:45','Peace','peace','teachings,teachings-tags,teachings-series',1,8,'sb1t7c23ksbnshcons8l0t5sr2'),
	(5723,'2012-06-24 09:53:52','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5722,'2012-06-24 09:53:18','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5721,'2012-06-24 09:53:14','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5720,'2012-06-24 09:52:01','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5719,'2012-06-24 09:51:44','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5718,'2012-06-24 09:51:38','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5717,'2012-06-24 09:51:05','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5716,'2012-06-24 09:51:03','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5715,'2012-06-24 09:50:58','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5714,'2012-06-24 09:50:29','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5713,'2012-06-24 09:50:18','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5712,'2012-06-24 09:49:45','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,275,'vq9p00g210j7kao3s0kjg2lmj6'),
	(5711,'2012-06-24 08:02:50','staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,28,'n1t5cn9r8e5pm571vvbu80vie7'),
	(5710,'2012-06-23 19:36:59','amy','amy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5709,'2012-06-23 19:36:55','(503) 799-7780','(503) 799-7780','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5708,'2012-06-23 19:36:10','(503) 703-8204','(503) 703-8204','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5707,'2012-06-23 19:35:53','(503) 799-7780','(503) 799-7780','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5706,'2012-06-23 19:34:56','amy','amy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5705,'2012-06-23 15:24:47','Meador','meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'4a4ej944do25ckfeae8hgm1tl7'),
	(5704,'2012-06-22 23:43:10','13649','13649','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5703,'2012-06-22 23:43:09','13649','13649','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5702,'2012-06-22 23:38:40','thorpe','thorpe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5701,'2012-06-22 23:30:22','m0-130','m0-130','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7hotla09skcb3inlebsk220417'),
	(5700,'2012-06-22 23:30:10','m0130','m0130','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5699,'2012-06-22 23:29:40','m0-130','m0-130','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7hotla09skcb3inlebsk220417'),
	(5698,'2012-06-22 23:27:46','thorpe','thorpe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5697,'2012-06-22 23:27:42','thorpe','thorpe','text',1,0,'7hotla09skcb3inlebsk220417'),
	(5696,'2012-06-22 23:27:33','m0-130','m0-130','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5695,'2012-06-22 23:27:30','g-049','g-049','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5694,'2012-06-22 23:27:26','thorpe','thorpe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5693,'2012-06-22 23:27:23','daryn','daryn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5692,'2012-06-22 23:27:16','darryn','darryn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5691,'2012-06-22 23:26:27','g-049','g-049','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5690,'2012-06-22 10:55:41','jesus','jesus','teachings-tags',1,4,'kdd4ott13l4b8lu43mg5jm3q32'),
	(5689,'2012-06-22 10:55:34','joy','joy','teachings,teachings-tags,teachings-series',1,9,'t7r6balemai34vopf1f16ma5e0'),
	(5688,'2012-06-22 10:55:22','joy','joy','teachings,teachings-tags,teachings-series',1,9,'t7r6balemai34vopf1f16ma5e0'),
	(5687,'2012-06-22 10:53:39','joy','joy','teachings,teachings-tags,teachings-series',1,9,'t7r6balemai34vopf1f16ma5e0'),
	(5686,'2012-06-22 10:53:31','joy','joy','teachings,teachings-tags,teachings-series',1,9,'t7r6balemai34vopf1f16ma5e0'),
	(5685,'2012-06-21 11:20:52','defoe','defoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5684,'2012-06-21 11:20:42','jason','jason','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7hotla09skcb3inlebsk220417'),
	(5683,'2012-06-21 11:20:33','haines','haines','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7hotla09skcb3inlebsk220417'),
	(5682,'2012-06-20 18:14:23','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,273,'c573buj8s3c5sigsji76al73s6'),
	(5680,'2012-06-20 18:13:27','*','*','teachings-tags',1,0,'c573buj8s3c5sigsji76al73s6'),
	(5681,'2012-06-20 18:13:50','jesus','jesus','teachings-tags',1,4,'c573buj8s3c5sigsji76al73s6'),
	(5679,'2012-06-20 18:13:22','*','*','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'c573buj8s3c5sigsji76al73s6'),
	(5678,'2012-06-20 18:13:18','ksjdbf','ksjdbf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'c573buj8s3c5sigsji76al73s6'),
	(5677,'2012-06-19 21:20:21','Paul','paul','teachings,teachings-tags,teachings-series',1,144,'h568ggse52t89r8uqlin7eghf7'),
	(5676,'2012-06-18 18:19:30','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'q9m6eb8dle7tmo1apnojfaiob5'),
	(5675,'2012-06-17 21:41:18','love','love','events-recurring',1,1,'h568ggse52t89r8uqlin7eghf7'),
	(5674,'2012-06-17 21:40:48','love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,53,'h568ggse52t89r8uqlin7eghf7'),
	(5673,'2012-06-15 17:03:08','7:00','7:00','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'ie9shuvstkesbtev1sv1vb9fo2'),
	(5672,'2012-06-15 17:02:30','tim','tim','teachings,teachings-tags,teachings-series',1,128,'ie9shuvstkesbtev1sv1vb9fo2'),
	(5671,'2012-06-15 16:48:03','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5670,'2012-06-15 08:37:51','Meador','meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5669,'2012-06-14 16:43:02','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'mo71u6dto0ogpsgbrssc75msg6'),
	(5668,'2012-06-14 15:33:52','Meador','meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'m61r27kh504sd4atlvhu0f5og7'),
	(5667,'2012-06-14 15:33:10','Meador','meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'m61r27kh504sd4atlvhu0f5og7'),
	(5666,'2012-06-14 15:32:58','dance','dance','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'m61r27kh504sd4atlvhu0f5og7'),
	(5665,'2012-06-14 15:06:39','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m61r27kh504sd4atlvhu0f5og7'),
	(5664,'2012-06-14 15:06:19','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m61r27kh504sd4atlvhu0f5og7'),
	(5663,'2012-06-14 14:02:29','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m61r27kh504sd4atlvhu0f5og7'),
	(5662,'2012-06-14 13:22:06','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m61r27kh504sd4atlvhu0f5og7'),
	(5661,'2012-06-14 12:07:07','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,825,'26qs3j6kns6fmcklkmcvkf0ep1'),
	(5660,'2012-06-14 12:06:50','asd','asd','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'26qs3j6kns6fmcklkmcvkf0ep1'),
	(5659,'2012-06-14 10:44:53','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m61r27kh504sd4atlvhu0f5og7'),
	(5658,'2012-06-13 13:02:06','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5657,'2012-06-13 12:04:08','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,15,'3isji0arc8cmatd39dbfag29q6'),
	(5656,'2012-06-13 12:02:58','Jesus','jesus','teachings,teachings-tags,teachings-series',1,248,'u4duvk2j81ojic9ibt5b8frn35'),
	(5625,'2012-06-08 22:24:44','Bible','bible','events-recurring',1,3,'f689llb4l1mp2ctppv73dpd7n4'),
	(5626,'2012-06-08 22:32:19','Bible','bible','teachings-series',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5627,'2012-06-08 22:32:31','1 Timothy','1 timothy','teachings-series',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(5628,'2012-06-08 22:32:37','1 Timothy','1 timothy','teachings-series',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(5629,'2012-06-08 22:37:17','LOVE','love','teachings-series',1,0,'f689llb4l1mp2ctppv73dpd7n4'),
	(5630,'2012-06-08 22:37:24','LOVE','love','teachings-tags',1,4,'f689llb4l1mp2ctppv73dpd7n4'),
	(5631,'2012-06-08 22:52:41','salvation','salvation','teachings-tags',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(5632,'2012-06-08 22:52:45','salvation','salvation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,20,'f689llb4l1mp2ctppv73dpd7n4'),
	(5633,'2012-06-08 22:52:59','lige','lige','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'f689llb4l1mp2ctppv73dpd7n4'),
	(5634,'2012-06-08 23:00:25','church','church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,140,'f689llb4l1mp2ctppv73dpd7n4'),
	(5635,'2012-06-08 23:00:41','church','church','text',1,12,'f689llb4l1mp2ctppv73dpd7n4'),
	(5636,'2012-06-09 00:05:19','love','love','teachings,teachings-tags,teachings-series',1,39,'f689llb4l1mp2ctppv73dpd7n4'),
	(5637,'2012-06-09 00:05:37','Love','love','teachings,teachings-tags,teachings-series',1,39,'f689llb4l1mp2ctppv73dpd7n4'),
	(5638,'2012-06-09 00:14:51','Love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,52,'f689llb4l1mp2ctppv73dpd7n4'),
	(5639,'2012-06-12 08:19:24','fhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgf','fhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5640,'2012-06-12 08:19:38','fhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgf','fhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgfhgf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5641,'2012-06-12 09:20:47','Devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5642,'2012-06-12 09:21:15','depaoli','depaoli','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5643,'2012-06-12 09:21:37','Devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5644,'2012-06-12 11:25:26','devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5645,'2012-06-12 11:25:41','End times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5646,'2012-06-12 11:27:10','Jeff Young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5647,'2012-06-12 11:27:20','Jeff Young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,11,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5648,'2012-06-12 11:27:27','Jeff Young','jeff young','tags',1,0,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5649,'2012-06-12 11:27:37','Jeff Young','jeff young','tags',1,0,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5650,'2012-06-12 11:27:42','Jeff Young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5651,'2012-06-12 16:55:05','david','david','teachings,teachings-tags,teachings-series',1,20,'3isji0arc8cmatd39dbfag29q6'),
	(5652,'2012-06-12 16:58:31','david','david','teachings,teachings-tags,teachings-series',1,20,'3isji0arc8cmatd39dbfag29q6'),
	(5653,'2012-06-13 10:15:36','sdfdsfh','sdfdsfh','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5654,'2012-06-13 10:15:39','Devil','devil','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(5655,'2012-06-13 10:23:44','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'hfam1dh4f9i4pb0i7v58oc67n4'),
	(6865,'2012-07-16 09:43:55','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6864,'2012-07-16 09:40:24','Memory verses','memory verses','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7sh3osum1alltg4o95hhkm34t6'),
	(6863,'2012-07-16 08:41:19','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6862,'2012-07-16 07:32:34','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6861,'2012-07-16 07:32:26','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6860,'2012-07-16 07:29:56','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6859,'2012-07-16 06:18:18','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6858,'2012-07-16 05:40:53','1 JOHN','1 john','teachings-series',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6857,'2012-07-16 05:40:29','1 JOHN','1 john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,100,'cjm6r3843ojehm2ufht47mrgr7'),
	(6856,'2012-07-16 05:40:18','1 JOHN','1 john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'cjm6r3843ojehm2ufht47mrgr7'),
	(6855,'2012-07-16 05:40:06','1 JOHN1','1 john1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6854,'2012-07-16 05:39:58','1 JOHN:1','1 john:1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6853,'2012-07-16 05:39:49','1JOHN:1','1john:1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6852,'2012-07-16 05:39:40',':',':','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6851,'2012-07-16 05:39:31','1john1','1john1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6850,'2012-07-16 05:39:23','1john1','1john1','teachings,teachings-tags,teachings-series',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6849,'2012-07-16 05:39:17','1john','1john','teachings,teachings-tags,teachings-series',1,0,'cjm6r3843ojehm2ufht47mrgr7'),
	(6848,'2012-07-16 04:17:50','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(6847,'2012-07-16 00:00:58','John','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'80bists1g2vtqjd631rmbtqsd0'),
	(6846,'2012-07-15 23:42:59','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',2,18,'pkv3b4fl1rm06vm6jbgrnf1c56'),
	(6845,'2012-07-15 23:42:26','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'pkv3b4fl1rm06vm6jbgrnf1c56'),
	(6844,'2012-07-15 22:50:46','John','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'80bists1g2vtqjd631rmbtqsd0'),
	(6843,'2012-07-15 22:50:27','John','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,100,'80bists1g2vtqjd631rmbtqsd0'),
	(6842,'2012-07-15 22:49:04','John','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'80bists1g2vtqjd631rmbtqsd0'),
	(6841,'2012-07-15 22:30:04','july 8','july 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6840,'2012-07-15 22:29:44','july 8','july 8','teachings',1,1,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6839,'2012-07-15 22:29:24','july 8','july 8','teachings,teachings-tags,teachings-series',1,1,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6838,'2012-07-15 22:29:23','july 8','july 8','teachings,teachings-tags,teachings-series',1,1,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6837,'2012-07-15 22:29:00','sunday juiy 8','sunday juiy 8','teachings,teachings-tags,teachings-series',1,0,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6836,'2012-07-15 22:28:55','slide','slide','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'01ajketqf4tp8o2egeme05tbb5'),
	(6835,'2012-07-15 22:21:18','clothes','clothes','teachings,teachings-tags,teachings-series',1,2,'s5ei7qghv6b55epomrfd45aou6'),
	(6834,'2012-07-15 22:21:09','wear','wear','teachings,teachings-tags,teachings-series',1,5,'s5ei7qghv6b55epomrfd45aou6'),
	(6833,'2012-07-15 22:20:44','dressed','dressed','teachings,teachings-tags,teachings-series',1,2,'s5ei7qghv6b55epomrfd45aou6'),
	(6832,'2012-07-15 22:20:16','dress','dress','teachings,teachings-tags,teachings-series',1,6,'s5ei7qghv6b55epomrfd45aou6'),
	(6831,'2012-07-15 22:18:05','photos','photos','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'s5ei7qghv6b55epomrfd45aou6'),
	(6830,'2012-07-15 22:11:05','july 15 sunday message','july 15 sunday message','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6829,'2012-07-15 22:10:57','july 15 sunday message','july 15 sunday message','teachings,teachings-tags,teachings-series',1,0,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6828,'2012-07-15 22:10:13','july 15','july 15','teachings,teachings-tags,teachings-series',1,1,'aq9ksu388ofjhdqpi3q2chlko6'),
	(6827,'2012-07-15 21:28:30','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(6826,'2012-07-15 21:08:31','mark','mark','teachings-series',1,0,'vmq5acdo6g3glv9b4u3tjpjen3'),
	(6825,'2012-07-15 21:08:16','mark','mark','teachings,teachings-tags,teachings-series',1,43,'vmq5acdo6g3glv9b4u3tjpjen3'),
	(6824,'2012-07-15 20:24:15','Minist','minist','teachings,teachings-tags,teachings-series',1,24,'k8q16ag08uhrbr7uktaje3air7'),
	(6822,'2012-07-15 20:01:50','video','video','downloads',1,0,'oniv7ndop5ecj9agjj8imdk0u4'),
	(6823,'2012-07-15 20:02:12','video','video','teachings-series',1,0,'kbogi42rkor3n2le1cenlqoai1'),
	(6821,'2012-07-15 20:01:30','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'066r8qmubfs8pmq13db63mf4a6'),
	(6820,'2012-07-15 19:42:23','temptation','temptation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'n45f5r6n1lei889pouqheod5u2'),
	(6819,'2012-07-15 19:37:40','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'n45f5r6n1lei889pouqheod5u2'),
	(6818,'2012-07-15 18:51:51','obedience','obedience','teachings,teachings-tags,teachings-series',1,9,'88km80cfjdr3gji2hnvs1os623'),
	(6817,'2012-07-15 18:51:18','spirit','spirit','teachings,teachings-tags,teachings-series',2,48,'88km80cfjdr3gji2hnvs1os623'),
	(6816,'2012-07-15 18:44:07','spirit','spirit','teachings,teachings-tags,teachings-series',1,48,'88km80cfjdr3gji2hnvs1os623'),
	(6815,'2012-07-15 18:41:50','control','control','teachings,teachings-tags,teachings-series',1,6,'88km80cfjdr3gji2hnvs1os623'),
	(6814,'2012-07-15 17:37:21','mind','mind','teachings,teachings-tags,teachings-series',1,24,'88km80cfjdr3gji2hnvs1os623'),
	(6813,'2012-07-15 15:38:13','location wednesday bible study','location wednesday bible study','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'eccjhot820v3s8epab5cj9ps73'),
	(6812,'2012-07-15 15:20:19','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'k0sv8rmuot6mfbu1nsu5kpeb55'),
	(6811,'2012-07-15 15:19:53','7/15/2012','7/15/2012','teachings',1,0,'k0sv8rmuot6mfbu1nsu5kpeb55'),
	(6810,'2012-07-15 15:19:46','7/15/2012','7/15/2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k0sv8rmuot6mfbu1nsu5kpeb55'),
	(6809,'2012-07-15 15:19:38','7/15/2012','7/15/2012','teachings,teachings-tags,teachings-series',1,0,'k0sv8rmuot6mfbu1nsu5kpeb55'),
	(6808,'2012-07-15 15:17:58','faith','faith','teachings,teachings-tags,teachings-series',1,49,'88km80cfjdr3gji2hnvs1os623'),
	(6807,'2012-07-15 14:30:26','marriage','marriage','teachings,teachings-tags,teachings-series',1,10,'g96useiufp1qek6h32mvi63d52'),
	(6805,'2012-07-15 14:03:58','Mormon','mormon','teachings-tags',1,3,'uab7o37ftdp79j6m9peq8sje13'),
	(6806,'2012-07-15 14:09:10','marriage','marriage','teachings,teachings-tags,teachings-series',1,10,'g96useiufp1qek6h32mvi63d52'),
	(6804,'2012-07-15 13:44:43','Ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'fu3lhpign10rolsmbp0gk7vmq4'),
	(6803,'2012-07-15 13:30:29','moses','moses','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'treqrj9fd2clh3n0n7cpdh5157'),
	(6802,'2012-07-15 13:24:05','moses','moses','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'treqrj9fd2clh3n0n7cpdh5157'),
	(6801,'2012-07-15 13:23:30','moses','moses','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'treqrj9fd2clh3n0n7cpdh5157'),
	(6800,'2012-07-15 13:18:15','moses','moses','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'treqrj9fd2clh3n0n7cpdh5157'),
	(6799,'2012-07-15 13:05:33','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6798,'2012-07-15 13:05:26','titus','titus','teachings,teachings-tags,teachings-series',1,7,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6797,'2012-07-15 13:03:56','homosexuality','homosexuality','teachings,teachings-tags,teachings-series',1,1,'v2oqpmrl36qj2ejm8jmsb5fih6'),
	(6796,'2012-07-15 11:12:59','Radio','radio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'716isi4ssobks98j0suiugjqp4'),
	(6795,'2012-07-15 11:12:46','Radio','radio','teachings,teachings-tags,teachings-series',1,0,'716isi4ssobks98j0suiugjqp4'),
	(6794,'2012-07-15 10:36:29','Prayer','prayer','teachings,teachings-tags,teachings-series',1,26,'33qr5elmdi033d2tgdb91t3ms3'),
	(6793,'2012-07-15 09:58:22','plug in','plug in','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'o4ne63o0ff0okegtf1d363fhc0'),
	(6792,'2012-07-15 09:45:53','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,36,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6791,'2012-07-15 09:26:24','Revelation','revelation','teachings-tags',1,1,'dms9o0jprriukh75kro634q237'),
	(6789,'2012-07-15 09:26:07','Revelation','revelation','downloads',1,0,'dms9o0jprriukh75kro634q237'),
	(6790,'2012-07-15 09:26:12','Revelation','revelation','teachings-series',1,0,'dms9o0jprriukh75kro634q237'),
	(6788,'2012-07-15 09:25:57','Revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'dms9o0jprriukh75kro634q237'),
	(6787,'2012-07-15 09:22:25','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6786,'2012-07-15 09:21:48','titus','titus','teachings,teachings-tags,teachings-series',1,7,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6785,'2012-07-15 08:57:04','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,36,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6784,'2012-07-14 22:28:45','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,36,'5umghnplho3lhbpafh2oncl545'),
	(6783,'2012-07-14 22:11:47','07/14/12','07/14/12','teachings,teachings-tags,teachings-series',1,0,'1ccg2oi6m5cra5hgqhe9usfsi4'),
	(6782,'2012-07-14 22:11:09','saturday','saturday','teachings,teachings-tags,teachings-series',1,2,'1ccg2oi6m5cra5hgqhe9usfsi4'),
	(6781,'2012-07-14 20:27:11','prophecy update','prophecy update','teachings-tags',1,1,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6780,'2012-07-14 20:25:21','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6779,'2012-07-14 20:25:05','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',2,18,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6778,'2012-07-14 20:23:22','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6777,'2012-07-14 20:22:46','daniel','daniel','teachings,teachings-tags,teachings-series',3,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6776,'2012-07-14 20:21:15','daniel','daniel','teachings,teachings-tags,teachings-series',2,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6775,'2012-07-14 20:18:36','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6774,'2012-07-14 20:09:33','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6773,'2012-07-14 20:09:07','daniel','daniel','teachings,teachings-tags,teachings-series',2,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6772,'2012-07-14 20:08:15','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'2e2psr2fpdlsragpnthgc6c1b7'),
	(6771,'2012-07-14 17:47:21','Rapture','rapture','teachings,teachings-tags,teachings-series',1,10,'9p6roabgccb6c9pcmutvjplii1'),
	(6770,'2012-07-14 17:34:16','god','god','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,209,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6769,'2012-07-14 17:33:48','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6768,'2012-07-14 17:33:00','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6767,'2012-07-14 17:32:42','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6766,'2012-07-14 17:32:23','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6765,'2012-07-14 17:31:56','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6764,'2012-07-14 17:31:21','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6763,'2012-07-14 17:29:57','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6762,'2012-07-14 17:28:29','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6761,'2012-07-14 17:28:17','Jesu','jesu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,271,'a1l0m4f0vus3qp325kc6sjcas5'),
	(6760,'2012-07-14 17:20:42','Genesis 1','genesis 1','teachings',1,62,'uab7o37ftdp79j6m9peq8sje13'),
	(6759,'2012-07-14 17:20:15','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',1,62,'uab7o37ftdp79j6m9peq8sje13'),
	(6758,'2012-07-14 17:05:37','Marriage','marriage','teachings,teachings-tags,teachings-series',1,10,'uab7o37ftdp79j6m9peq8sje13'),
	(6757,'2012-07-14 17:04:32','Homosexual','homosexual','teachings-tags',1,1,'uab7o37ftdp79j6m9peq8sje13'),
	(6756,'2012-07-14 16:22:47','WOMENS BIBLE STUDY','womens bible study','teachings,teachings-tags,teachings-series',1,0,'8jtav1a3kgt6jbupehouef0qt0'),
	(6755,'2012-07-14 15:59:32','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6754,'2012-07-14 15:33:30','music','music','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'4j8ihd7c9tvl586lq3s104n0r3'),
	(6752,'2012-07-14 15:07:03','order cd','order cd','teachings-series',1,0,'0trs8vubjhefptgng6tu4jd235'),
	(6753,'2012-07-14 15:07:18','ephisians','ephisians','teachings,teachings-tags,teachings-series',1,0,'0trs8vubjhefptgng6tu4jd235'),
	(6751,'2012-07-14 15:06:45','order cd','order cd','teachings,teachings-tags,teachings-series',1,7,'0trs8vubjhefptgng6tu4jd235'),
	(6750,'2012-07-14 14:49:43','fear','fear','teachings,teachings-tags,teachings-series',1,10,'qu49m4vpbsu6kurf5n5h9apr92'),
	(6749,'2012-07-14 14:48:48','faith in god','faith in god','teachings,teachings-tags,teachings-series',1,12,'88km80cfjdr3gji2hnvs1os623'),
	(6747,'2012-07-14 14:00:04','Downloads','downloads','downloads',1,0,'uo97ddov3995mam8lqgqsnb4p7'),
	(6748,'2012-07-14 14:22:36','joel 2:25','joel 2:25','teachings,teachings-tags,teachings-series',1,1,'qs3g2sennvv749dhc8a5c5u2p4'),
	(6746,'2012-07-14 13:59:53','M1553','m1553','downloads',1,0,'uo97ddov3995mam8lqgqsnb4p7'),
	(6745,'2012-07-14 13:59:43','M1553','m1553','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'uo97ddov3995mam8lqgqsnb4p7'),
	(6744,'2012-07-14 13:59:30','M1553','m1553','teachings,teachings-tags,teachings-series',1,0,'uo97ddov3995mam8lqgqsnb4p7'),
	(6743,'2012-07-14 13:19:44','1kings 3','1kings 3','teachings-tags',1,0,'bla5dkblt5g2unjrhe697t5tn3'),
	(6742,'2012-07-14 13:19:25','1kings 3','1kings 3','teachings,teachings-tags,teachings-series',1,0,'bla5dkblt5g2unjrhe697t5tn3'),
	(6741,'2012-07-14 12:54:22','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6740,'2012-07-14 12:54:17','titus','titus','teachings,teachings-tags,teachings-series',1,6,'ckejobeu5s5u28b1h9i34sa2q3'),
	(6739,'2012-07-14 11:39:52','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6738,'2012-07-14 09:17:39','June 27 2012','june 27 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'nlkr27eulvove49gn1ih905tc6'),
	(6737,'2012-07-14 09:17:35','June 27 2012','june 27 2012','teachings,teachings-tags,teachings-series',1,0,'nlkr27eulvove49gn1ih905tc6'),
	(6736,'2012-07-14 08:36:58','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6735,'2012-07-14 08:36:46','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6734,'2012-07-14 06:41:57','joy','joy','teachings,teachings-tags,teachings-series',1,9,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6733,'2012-07-14 06:41:21','Sad','sad','teachings,teachings-tags,teachings-series',1,7,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6732,'2012-07-14 05:27:10','heart','heart','teachings,teachings-tags,teachings-series',2,25,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6731,'2012-07-14 05:26:42','heart','heart','teachings,teachings-tags,teachings-series',1,25,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6730,'2012-07-14 05:26:18','heardache','heardache','teachings',1,0,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6729,'2012-07-14 05:26:09','heardache','heardache','teachings,teachings-tags,teachings-series',1,0,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6728,'2012-07-14 05:26:00','broken heart','broken heart','teachings,teachings-tags,teachings-series',1,0,'9gp3muran4hl6eo9d3cr0vc7l7'),
	(6726,'2012-07-13 21:45:07','matthew','matthew','teachings-series',1,0,'iuuv0htibufmddhhgjqu33tpp1'),
	(6727,'2012-07-13 21:45:36','matthew','matthew','teachings-tags',1,1,'iuuv0htibufmddhhgjqu33tpp1'),
	(6725,'2012-07-13 21:44:35','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'iuuv0htibufmddhhgjqu33tpp1'),
	(6724,'2012-07-13 21:40:53','Friendship','friendship','teachings,teachings-tags,teachings-series',1,2,'96locd0vmnim4dotmc19iasqr5'),
	(6722,'2012-07-13 17:41:21','Marriage','marriage','teachings-tags',1,4,'sobiqr7v7kn471ptluqfmkggc3'),
	(6723,'2012-07-13 19:46:34','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'5lf6enscofdgi32l1o4tciq4t7'),
	(6721,'2012-07-13 17:13:37','deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',1,35,'m1kbn458l40rd010hbqanvf9i5'),
	(6720,'2012-07-13 16:20:08','matthew','matthew','teachings,teachings-tags,teachings-series',3,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6719,'2012-07-13 16:19:49','matthew','matthew','teachings,teachings-tags,teachings-series',2,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6718,'2012-07-13 16:19:26','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6717,'2012-07-13 16:04:26','godly fear','godly fear','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'hnigq7plbhq2a03e3va8rbjh10'),
	(6716,'2012-07-13 16:04:19','godly fear','godly fear','downloads',1,0,'hnigq7plbhq2a03e3va8rbjh10'),
	(6715,'2012-07-13 16:03:57','godly fear','godly fear','teachings,teachings-tags,teachings-series',1,1,'hnigq7plbhq2a03e3va8rbjh10'),
	(6714,'2012-07-13 15:58:50','morning star','morning star','teachings,teachings-tags,teachings-series',1,0,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6713,'2012-07-13 15:58:45','morningstar','morningstar','teachings,teachings-tags,teachings-series',1,0,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6712,'2012-07-13 15:51:21','wonders','wonders','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'s54blfkkb057brbn7l9a5m29f1'),
	(6711,'2012-07-13 15:51:15','wonders','wonders','teachings-tags',1,2,'s54blfkkb057brbn7l9a5m29f1'),
	(6710,'2012-07-13 15:50:26','spiritual gifts','spiritual gifts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'s54blfkkb057brbn7l9a5m29f1'),
	(6709,'2012-07-13 15:50:03','vanuatu','vanuatu','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'s54blfkkb057brbn7l9a5m29f1'),
	(6708,'2012-07-13 15:49:49','simcoe','simcoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'s54blfkkb057brbn7l9a5m29f1'),
	(6707,'2012-07-13 15:11:17','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6706,'2012-07-13 14:54:33','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,30,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6705,'2012-07-13 14:54:24','Daniele','daniele','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6704,'2012-07-13 14:52:35','Calvin','calvin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6703,'2012-07-13 13:31:45','Calvin','calvin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6702,'2012-07-13 13:31:36','Calvan','calvan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6701,'2012-07-13 13:31:30','Calvanism','calvanism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6700,'2012-07-13 13:31:16','Canvas ism','canvas ism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6699,'2012-07-13 13:26:16','Matt 5','matt 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',10,100,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6698,'2012-07-13 13:25:53','Matt 5','matt 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6697,'2012-07-13 13:25:41','Beattitudes','beattitudes','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6696,'2012-07-13 13:10:09','titus','titus','teachings,teachings-tags,teachings-series',1,6,'muhm0gabhcmm62odt554lv6785'),
	(6694,'2012-07-13 11:19:12','june 24','june 24','teachings',1,0,'e9b3mmavm6agfltioar8tccbc4'),
	(6695,'2012-07-13 12:21:55','promises','promises','teachings,teachings-tags,teachings-series',1,11,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6693,'2012-07-13 11:18:58','june 24','june 24','teachings,teachings-tags,teachings-series',1,0,'e9b3mmavm6agfltioar8tccbc4'),
	(6692,'2012-07-13 10:40:00','Mormon','mormon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6691,'2012-07-13 10:02:38','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6689,'2012-07-13 09:55:33','podcast','podcast','downloads',1,0,'fv3nd7um4l1o06702c721sihd6'),
	(6690,'2012-07-13 09:58:42','psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'s54blfkkb057brbn7l9a5m29f1'),
	(6687,'2012-07-13 09:48:39','podcast','podcast','downloads',1,0,'rr3qshf8c5vi48lnrjecdn7ai7'),
	(6688,'2012-07-13 09:55:33','podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'g161c068hnb9vg070ckepcbjf6'),
	(6686,'2012-07-13 09:48:24','podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'rr3qshf8c5vi48lnrjecdn7ai7'),
	(6684,'2012-07-13 09:40:39','July 2012','july 2012','teachings-tags',1,0,'vbaarrr3ut8rkrm8mbigrgd4o1'),
	(6685,'2012-07-13 09:40:55','July 2012','july 2012','teachings-series',1,0,'vbaarrr3ut8rkrm8mbigrgd4o1'),
	(6683,'2012-07-13 09:39:59','July 2012','july 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'vbaarrr3ut8rkrm8mbigrgd4o1'),
	(6682,'2012-07-13 09:39:44','July 2012','july 2012','teachings,teachings-tags,teachings-series',1,0,'vbaarrr3ut8rkrm8mbigrgd4o1'),
	(6681,'2012-07-13 09:38:12','hope','hope','teachings,teachings-tags,teachings-series',1,14,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6680,'2012-07-13 09:37:06','value','value','teachings,teachings-tags,teachings-series',1,0,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6679,'2012-07-13 09:32:27','matt hamilton','matt hamilton','teachings,teachings-tags,teachings-series',2,12,'4jrcs1cdon0skuf1c6dt7us454'),
	(6678,'2012-07-13 09:32:01','matt hamilton','matt hamilton','teachings,teachings-tags,teachings-series',1,12,'4jrcs1cdon0skuf1c6dt7us454'),
	(6677,'2012-07-13 09:27:20','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'4jrcs1cdon0skuf1c6dt7us454'),
	(6676,'2012-07-13 09:03:24','S1-545','s1-545','teachings,teachings-tags,teachings-series',1,1,'tfmecdl0ha913q80o04g9m0j50'),
	(6675,'2012-07-13 09:02:59','s1545','s1545','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'tfmecdl0ha913q80o04g9m0j50'),
	(6674,'2012-07-13 09:02:52','s1545','s1545','downloads',1,0,'tfmecdl0ha913q80o04g9m0j50'),
	(6673,'2012-07-13 09:02:24','s1545','s1545','teachings,teachings-tags,teachings-series',1,0,'tfmecdl0ha913q80o04g9m0j50'),
	(6672,'2012-07-13 08:58:26','zechariah','zechariah','teachings,teachings-tags,teachings-series',2,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6671,'2012-07-13 08:58:07','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6670,'2012-07-13 08:38:13','knowledge','knowledge','teachings,teachings-tags,teachings-series',1,9,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6669,'2012-07-13 08:18:09','tithing','tithing','teachings,teachings-tags,teachings-series',1,3,'2hhhcoo65s7qssh9df9m6fb2q5'),
	(6668,'2012-07-13 08:00:45','Mormon','mormon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6667,'2012-07-13 06:09:21','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6666,'2012-07-12 23:27:48','1 Corinthians 14','1 corinthians 14','teachings,teachings-tags,teachings-series',1,95,'jp7i53j27qpn0dfgq7kkomqsr2'),
	(6665,'2012-07-12 23:06:43','matthew 26','matthew 26','teachings,teachings-tags,teachings-series',2,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6664,'2012-07-12 23:06:04','matthew 26','matthew 26','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6663,'2012-07-12 23:05:48','matthew','matthew','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6662,'2012-07-12 23:05:36','mathew','mathew','teachings,teachings-tags,teachings-series',1,0,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6661,'2012-07-12 22:43:22','58 words','58 words','teachings,teachings-tags,teachings-series',1,12,'ci2amqojgoehral4q07md943p3'),
	(6660,'2012-07-12 22:02:39','Psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'i287htmhq4h0mk3fuj5bde7922'),
	(6659,'2012-07-12 21:15:41','numbers 16','numbers 16','teachings,teachings-tags,teachings-series',3,33,'8m05kjk81ui7t5mv1094bipn17'),
	(6658,'2012-07-12 21:15:28','numbers 16','numbers 16','teachings,teachings-tags,teachings-series',2,33,'8m05kjk81ui7t5mv1094bipn17'),
	(6657,'2012-07-12 21:15:06','numbers 16','numbers 16','teachings,teachings-tags,teachings-series',1,33,'8m05kjk81ui7t5mv1094bipn17'),
	(6656,'2012-07-12 21:13:41','numbers','numbers','teachings,teachings-tags,teachings-series',1,33,'8m05kjk81ui7t5mv1094bipn17'),
	(6655,'2012-07-12 20:13:10','nehemiah 3','nehemiah 3','teachings,teachings-tags,teachings-series',1,10,'g5tj61sum136o6f58mk9ibhhd3'),
	(6654,'2012-07-12 18:50:12','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6652,'2012-07-12 18:15:04','Lords Prayer','lords prayer','teachings-tags',1,0,'spodpvv82a9uitbnegrnpkmlk4'),
	(6653,'2012-07-12 18:15:16','Prayer','prayer','teachings-tags',1,2,'spodpvv82a9uitbnegrnpkmlk4'),
	(6651,'2012-07-12 17:58:35','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'8qkdd0lp7sgednka40cv2b6lu0'),
	(6650,'2012-07-12 17:58:09','daniel','daniel','teachings,teachings-tags,teachings-series',3,29,'8qkdd0lp7sgednka40cv2b6lu0'),
	(6649,'2012-07-12 17:57:53','daniel','daniel','teachings,teachings-tags,teachings-series',2,29,'8qkdd0lp7sgednka40cv2b6lu0'),
	(6648,'2012-07-12 17:57:26','daniel','daniel','teachings,teachings-tags,teachings-series',1,29,'8qkdd0lp7sgednka40cv2b6lu0'),
	(6647,'2012-07-12 17:57:00','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'5mdf18sd33os9i6r83ig2ejc74'),
	(6646,'2012-07-12 17:12:29','demo','demo','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'7bm6rn2siuafopa2km4c4diri4'),
	(6645,'2012-07-12 14:09:24','godly','godly','teachings,teachings-tags,teachings-series',1,9,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6644,'2012-07-12 14:09:13','living a godly life','living a godly life','teachings,teachings-tags,teachings-series',1,0,'ntgavbn8kabpu4k5gqhlg04rm2'),
	(6643,'2012-07-12 14:01:14','titus 2','titus 2','teachings,teachings-tags,teachings-series',1,6,'qi8ttevpeqnj38mi1qtekluhd5'),
	(6642,'2012-07-12 14:00:37','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'ju2qpl5kdoijejuo74iloahpt0'),
	(6641,'2012-07-12 14:00:13','leviticus','leviticus','teachings,teachings-tags,teachings-series',1,23,'ju2qpl5kdoijejuo74iloahpt0'),
	(6640,'2012-07-12 12:28:01','rev','rev','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,109,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6639,'2012-07-12 12:27:42','rev','rev','teachings-series',1,0,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6638,'2012-07-12 12:19:46','rev','rev','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,109,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6637,'2012-07-12 12:19:36','rev','rev','teachings-series',1,0,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6636,'2012-07-12 12:19:31','revelation','revelation','teachings-series',1,0,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6635,'2012-07-12 12:13:28','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'diioeb2t31nbkqvc3ee2ejmti1'),
	(6634,'2012-07-12 11:13:04','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6632,'2012-07-12 10:44:08','tad','tad','teachings-tags',1,1,'55vap06p30t0msdvbgrpac0db7'),
	(6633,'2012-07-12 11:12:34','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6631,'2012-07-12 10:41:10','tad','tad','teachings,teachings-tags,teachings-series',1,6,'55vap06p30t0msdvbgrpac0db7'),
	(6630,'2012-07-12 10:39:52','tad slaughter','tad slaughter','teachings,teachings-tags,teachings-series',1,5,'55vap06p30t0msdvbgrpac0db7'),
	(6629,'2012-07-12 09:53:39','zechariah','zechariah','teachings,teachings-tags,teachings-series',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6628,'2012-07-12 09:12:15','adultery','adultery','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6627,'2012-07-12 09:12:03','adultry','adultry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6626,'2012-07-12 09:11:38','lust','lust','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,16,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6625,'2012-07-12 08:18:14','rapture','rapture','teachings,teachings-tags,teachings-series',1,10,'k80aug0k20hoqba53i09nfhpp2'),
	(6624,'2012-07-12 07:51:07','philippians 3:13','philippians 3:13','teachings,teachings-tags,teachings-series',1,0,'vnj2cj2sbav6iui08morvc2nn1'),
	(6623,'2012-07-12 07:50:56','philippians 3;13','philippians 3;13','teachings,teachings-tags,teachings-series',1,0,'vnj2cj2sbav6iui08morvc2nn1'),
	(6622,'2012-07-12 07:29:28','marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6621,'2012-07-12 07:28:50','corthintains','corthintains','teachings-series',1,0,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6620,'2012-07-12 07:28:40','corthintains','corthintains','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6619,'2012-07-12 07:28:29','corthintains','corthintains','teachings,teachings-tags,teachings-series',1,0,'tltp4gsf9r5278j7lrnf5k0s90'),
	(6618,'2012-07-12 07:07:35','philippians 3','philippians 3','teachings,teachings-tags,teachings-series',1,21,'vnj2cj2sbav6iui08morvc2nn1'),
	(6617,'2012-07-12 06:51:29','Psalms','psalms','teachings-series',1,0,'d0uvpfgomh3ivhtv6h6jmqa9h0'),
	(6616,'2012-07-12 06:51:18','Psalms','psalms','teachings,teachings-tags,teachings-series',1,0,'d0uvpfgomh3ivhtv6h6jmqa9h0'),
	(6615,'2012-07-12 06:18:10','Psalm','psalm','teachings,teachings-tags,teachings-series',2,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6614,'2012-07-11 23:28:28','revelation 1','revelation 1','teachings,teachings-tags,teachings-series',1,86,'v76vo3sitmsnn2pa2kseo0obr4'),
	(6613,'2012-07-11 23:27:36','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'v76vo3sitmsnn2pa2kseo0obr4'),
	(6612,'2012-07-11 23:26:57','REVELATION','revelation','teachings,teachings-tags,teachings-series',1,86,'v76vo3sitmsnn2pa2kseo0obr4'),
	(6611,'2012-07-11 23:19:11','Proverbs','proverbs','teachings,teachings-tags,teachings-series',5,43,'5umghnplho3lhbpafh2oncl545'),
	(6610,'2012-07-11 23:19:01','Proverbs','proverbs','teachings,teachings-tags,teachings-series',4,43,'5umghnplho3lhbpafh2oncl545'),
	(6609,'2012-07-11 23:18:41','Proverbs','proverbs','teachings,teachings-tags,teachings-series',1,43,'5umghnplho3lhbpafh2oncl545'),
	(6608,'2012-07-11 22:00:20','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'mo8d1a3ahmqvp6gurhucm1f6h0'),
	(6607,'2012-07-11 21:58:07','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ss2261m8otvk8o1qejjhil6ij6'),
	(6606,'2012-07-11 21:57:56','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ss2261m8otvk8o1qejjhil6ij6'),
	(6605,'2012-07-11 21:54:04','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ss2261m8otvk8o1qejjhil6ij6'),
	(6604,'2012-07-11 21:53:33','s0-183','s0-183','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ss2261m8otvk8o1qejjhil6ij6'),
	(6603,'2012-07-11 21:51:41','titus 1','titus 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'mo8d1a3ahmqvp6gurhucm1f6h0'),
	(6602,'2012-07-11 21:46:38','1 timothy','1 timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'qaujf6cds18dglb8kjjuf753n4'),
	(6601,'2012-07-11 21:10:08','matthew 25','matthew 25','teachings,teachings-tags,teachings-series',1,82,'5lf8og4hqhoqhueq45ggca9rc1'),
	(6600,'2012-07-11 21:09:58','Proverbs','proverbs','teachings,teachings-tags,teachings-series',5,43,'5umghnplho3lhbpafh2oncl545'),
	(6599,'2012-07-11 20:21:18','1 thessalonians','1 thessalonians','teachings,teachings-tags,teachings-series',1,26,'gq04upmrm71eieukg3qqsnja47'),
	(6598,'2012-07-11 20:19:59','M1-600','m1-600','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'n0lnr40n04anva959su4qmm031'),
	(6597,'2012-07-11 20:19:42','M1-560','m1-560','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'n0lnr40n04anva959su4qmm031'),
	(6596,'2012-07-11 20:18:32','M1-599','m1-599','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'n0lnr40n04anva959su4qmm031'),
	(6595,'2012-07-11 20:18:09','M1-598','m1-598','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'n0lnr40n04anva959su4qmm031'),
	(6594,'2012-07-11 20:17:16','M1-597','m1-597','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'n0lnr40n04anva959su4qmm031'),
	(6593,'2012-07-11 20:14:47','End times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,23,'n0lnr40n04anva959su4qmm031'),
	(6590,'2012-07-11 20:12:09','March 18,2012','march 18,2012','teachings-series',1,0,'n0lnr40n04anva959su4qmm031'),
	(6591,'2012-07-11 20:12:23','End times','end times','teachings-series',1,0,'n0lnr40n04anva959su4qmm031'),
	(6592,'2012-07-11 20:12:31','End times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'n0lnr40n04anva959su4qmm031'),
	(6560,'2012-07-11 11:45:34','Holy spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6561,'2012-07-11 12:00:04','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,18,'ovt93tlcvkqhbtos1l8r2a1266'),
	(6562,'2012-07-11 13:06:24','john','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,100,'l6v0ao3i0jn59atoouagvfiv95'),
	(6563,'2012-07-11 13:38:56','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'pibs1l2k62hdcb9vf5ehh5vfc5'),
	(6564,'2012-07-11 14:52:33','1 corinthians 11','1 corinthians 11','teachings,teachings-tags,teachings-series',1,95,'erjiaedohrgvgpbuap5kr18803'),
	(6565,'2012-07-11 15:27:56','enter','enter','teachings,teachings-tags,teachings-series',1,1,'66sj2ha4aq4rgti1eq1sd64ga3'),
	(6566,'2012-07-11 15:28:24','enter','enter','teachings',1,1,'66sj2ha4aq4rgti1eq1sd64ga3'),
	(6567,'2012-07-11 15:32:36','1 corinthians 11','1 corinthians 11','teachings,teachings-tags,teachings-series',1,95,'erjiaedohrgvgpbuap5kr18803'),
	(6568,'2012-07-11 16:07:43','Fool','fool','teachings,teachings-tags,teachings-series',1,5,'5v2aoi6k87svu2kfq5qpcvofu3'),
	(6569,'2012-07-11 16:08:18','Fool','fool','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'5v2aoi6k87svu2kfq5qpcvofu3'),
	(6570,'2012-07-11 16:08:58','Proverbs 26:4,5','proverbs 26:4,5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5v2aoi6k87svu2kfq5qpcvofu3'),
	(6571,'2012-07-11 16:10:03','Answer a fool','answer a fool','teachings,teachings-tags,teachings-series',1,0,'5v2aoi6k87svu2kfq5qpcvofu3'),
	(6572,'2012-07-11 16:10:22','Answer','answer','teachings,teachings-tags,teachings-series',1,15,'5v2aoi6k87svu2kfq5qpcvofu3'),
	(6573,'2012-07-11 16:15:31','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6574,'2012-07-11 16:15:56','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6575,'2012-07-11 16:15:56','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6576,'2012-07-11 16:16:54','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6577,'2012-07-11 16:17:01','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,67,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6578,'2012-07-11 16:17:04','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,67,'e9gh7jlsj9fiovnlnn2pj2qqi7'),
	(6579,'2012-07-11 16:20:45','sermons in Romans','teachings in romans','teachings,teachings-tags,teachings-series',1,0,'gq04upmrm71eieukg3qqsnja47'),
	(6580,'2012-07-11 16:21:05','sermons in Romans','teachings in romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gq04upmrm71eieukg3qqsnja47'),
	(6581,'2012-07-11 16:40:19','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'s15uc7nrddbs2obt7321upim14'),
	(6582,'2012-07-11 17:04:04','s1542','s1542','teachings,teachings-tags,teachings-series',1,0,'04rmss4o0ml7v8gkpd6h0f1495'),
	(6583,'2012-07-11 17:05:07','forgiveness','forgiveness','teachings,teachings-tags,teachings-series',1,13,'04rmss4o0ml7v8gkpd6h0f1495'),
	(6584,'2012-07-11 17:05:34','s1-542','s1-542','teachings,teachings-tags,teachings-series',1,1,'04rmss4o0ml7v8gkpd6h0f1495'),
	(6585,'2012-07-11 17:22:15','Church tonight?','church tonight?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'j6v47drtl8m29nah77t12q5au3'),
	(6586,'2012-07-11 17:22:40','tonight','tonight','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,79,'pefalakmv68rkm9agcq7o2ot16'),
	(6587,'2012-07-11 17:32:37','john','john','teachings,teachings-tags,teachings-series',1,95,'dci97nf27sajmg60133v1nuaf3'),
	(6588,'2012-07-11 20:11:35','March 18,2012','march 18,2012','teachings,teachings-tags,teachings-series',1,0,'n0lnr40n04anva959su4qmm031'),
	(6589,'2012-07-11 20:11:48','March 18,2012','march 18,2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'n0lnr40n04anva959su4qmm031'),
	(4395,'2012-06-03 08:10:04','thess','thess','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(4431,'2012-06-03 08:21:50','thess','thess','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(4433,'2012-06-03 08:22:19','thess','thess','teachings-tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4437,'2012-06-03 08:22:30','marriage','marriage','teachings-tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4475,'2012-06-03 08:46:20','marriage','marriage','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4477,'2012-06-03 09:01:59','marriage','marriage','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4479,'2012-06-03 09:02:50','marriage','marriage','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4481,'2012-06-03 09:03:08','marriage','marriage','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4483,'2012-06-03 09:04:17','marriage','marriage','text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4485,'2012-06-03 09:05:36','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4487,'2012-06-03 09:09:40','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4499,'2012-06-03 09:19:22','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4501,'2012-06-03 09:20:16','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4503,'2012-06-03 09:21:42','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4505,'2012-06-03 09:24:10','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4512,'2012-06-03 09:26:17','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4514,'2012-06-03 09:26:51','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4516,'2012-06-03 09:32:50','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4518,'2012-06-03 09:41:51','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4520,'2012-06-03 09:42:42','bible','bible','text',2,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4522,'2012-06-03 09:44:08','bible','bible','text',2,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4524,'2012-06-03 09:44:18','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4526,'2012-06-03 09:44:27','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4532,'2012-06-03 09:47:57','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4536,'2012-06-03 09:48:10','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4538,'2012-06-03 09:48:39','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4540,'2012-06-03 09:49:35','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4541,'2012-06-03 09:49:36','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,822,'jru7j11o1vlq0jt96bua5178u2'),
	(4544,'2012-06-03 09:54:20','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4546,'2012-06-03 09:57:24','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4548,'2012-06-03 09:57:43','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4550,'2012-06-03 09:57:46','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4552,'2012-06-03 09:57:49','bible','bible','teachings',1,789,'jru7j11o1vlq0jt96bua5178u2'),
	(4554,'2012-06-03 09:57:53','bible','bible','teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4556,'2012-06-03 09:57:56','bible','bible','teachings',1,789,'jru7j11o1vlq0jt96bua5178u2'),
	(4558,'2012-06-03 09:58:46','bible','bible','teachings',1,789,'jru7j11o1vlq0jt96bua5178u2'),
	(4560,'2012-06-03 09:58:58','bible','bible','text',1,16,'jru7j11o1vlq0jt96bua5178u2'),
	(4562,'2012-06-03 09:59:01','bible','bible','teachings-tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(4564,'2012-06-03 09:59:10','bible','bible','teachings',1,789,'jru7j11o1vlq0jt96bua5178u2'),
	(4566,'2012-06-03 09:59:14','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4568,'2012-06-03 10:01:02','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4570,'2012-06-03 10:02:12','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4572,'2012-06-03 10:03:47','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4574,'2012-06-03 10:05:02','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4576,'2012-06-03 10:05:58','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4578,'2012-06-03 10:06:14','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4580,'2012-06-03 10:06:26','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4582,'2012-06-03 10:06:39','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4584,'2012-06-03 10:07:21','bible','bible','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4636,'2012-06-03 10:17:06','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4638,'2012-06-03 10:17:58','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4640,'2012-06-03 10:18:15','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4642,'2012-06-03 10:18:32','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4644,'2012-06-03 10:19:26','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4646,'2012-06-03 10:20:02','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4648,'2012-06-03 10:20:22','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4652,'2012-06-03 10:20:46','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4654,'2012-06-03 10:21:17','resurrection','resurrection','events',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4656,'2012-06-03 10:22:46','resurrection','resurrection','events',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4658,'2012-06-03 10:22:55','resurrection','resurrection','events',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4663,'2012-06-03 10:23:10','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4666,'2012-06-03 10:24:23','resurrection','resurrection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(4681,'2012-06-03 10:24:49','sunday','sunday','teachings,teachings-tags,teachings-series',1,803,'jru7j11o1vlq0jt96bua5178u2'),
	(4691,'2012-06-03 10:25:37','sunday','sunday','teachings,teachings-tags,teachings-series',1,803,'jru7j11o1vlq0jt96bua5178u2'),
	(4693,'2012-06-03 10:25:49','sunday','sunday','teachings,teachings-tags,teachings-series',1,803,'jru7j11o1vlq0jt96bua5178u2'),
	(4696,'2012-06-03 10:27:43','sunday','sunday','teachings,teachings-tags,teachings-series',1,803,'jru7j11o1vlq0jt96bua5178u2'),
	(4699,'2012-06-03 10:27:50','I’m new here','i’m new here','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(4704,'2012-06-03 10:28:18','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4709,'2012-06-03 10:29:25','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4711,'2012-06-03 10:29:34','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4717,'2012-06-03 10:30:19','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4721,'2012-06-03 10:30:42','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(4735,'2012-06-03 10:32:12','Paul','paul','teachings,teachings-tags,teachings-series',1,141,'jru7j11o1vlq0jt96bua5178u2'),
	(4739,'2012-06-03 10:32:28','Paul','paul','teachings,teachings-tags,teachings-series',1,141,'jru7j11o1vlq0jt96bua5178u2'),
	(4750,'2012-06-03 10:33:15','Paul','paul','downloads',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(4752,'2012-06-03 10:33:24','release form','release form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'jru7j11o1vlq0jt96bua5178u2'),
	(4773,'2012-06-03 10:34:44','release form','release form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'jru7j11o1vlq0jt96bua5178u2'),
	(4777,'2012-06-03 10:34:51','release form','release form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'jru7j11o1vlq0jt96bua5178u2'),
	(4809,'2012-06-03 10:41:02','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(4812,'2012-06-03 10:41:11','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jru7j11o1vlq0jt96bua5178u2'),
	(4814,'2012-06-03 10:41:15','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4818,'2012-06-03 10:41:21','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4821,'2012-06-03 10:42:14','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4824,'2012-06-03 10:42:30','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4828,'2012-06-03 10:42:40','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4831,'2012-06-03 10:43:05','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4834,'2012-06-03 10:43:10','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4837,'2012-06-03 10:43:11','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4839,'2012-06-03 10:43:26','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4846,'2012-06-03 10:43:36','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4848,'2012-06-03 10:44:04','buddhism','buddhism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(4850,'2012-06-03 10:44:23','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5013,'2012-06-03 11:05:11','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5018,'2012-06-03 11:05:15','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5021,'2012-06-03 11:05:36','release','release','downloads',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5039,'2012-06-03 11:06:28','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5058,'2012-06-03 11:07:32','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5078,'2012-06-03 11:08:52','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5082,'2012-06-03 11:08:58','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5084,'2012-06-03 11:09:00','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5086,'2012-06-03 11:09:13','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5088,'2012-06-03 11:09:24','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5096,'2012-06-03 11:09:40','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5113,'2012-06-03 11:18:00','test','test','teachings,teachings-tags,teachings-series',1,34,'jru7j11o1vlq0jt96bua5178u2'),
	(5115,'2012-06-03 11:18:11','test','test','events',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5117,'2012-06-03 11:18:22','highschool','highschool','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5119,'2012-06-03 11:20:59','highschool','highschool','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5121,'2012-06-03 11:21:13','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5123,'2012-06-03 11:21:19','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5125,'2012-06-03 11:21:40','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5127,'2012-06-03 11:21:52','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5129,'2012-06-03 11:22:11','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5131,'2012-06-03 11:22:19','release','release','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5133,'2012-06-03 11:22:22','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5137,'2012-06-03 11:22:33','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5141,'2012-06-03 11:22:38','release','release','events',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5143,'2012-06-03 11:23:00','christmas','christmas','events',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5145,'2012-06-03 11:23:03','christmas','christmas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(5149,'2012-06-03 11:23:12','christmas','christmas','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(5151,'2012-06-03 11:23:15','christmas','christmas','events',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5153,'2012-06-03 11:23:47','christmas','christmas','tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5155,'2012-06-03 11:24:13','christmas','christmas','tags',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5157,'2012-06-03 11:24:31','new','new','tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5161,'2012-06-03 11:24:37','new','new','tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5166,'2012-06-03 11:25:19','new','new','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,57,'jru7j11o1vlq0jt96bua5178u2'),
	(5168,'2012-06-03 11:25:37','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5170,'2012-06-03 11:26:07','new','new','tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5174,'2012-06-03 11:26:12','new','new','tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5176,'2012-06-03 11:26:16','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5180,'2012-06-03 11:26:22','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5182,'2012-06-03 11:28:02','board','board','text',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5186,'2012-06-03 11:28:16','board','board','text',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5188,'2012-06-03 11:28:22','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5190,'2012-06-03 11:29:04','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5192,'2012-06-03 11:29:07','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5194,'2012-06-03 11:29:17','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5202,'2012-06-03 11:32:12','new','new','text',1,9,'jru7j11o1vlq0jt96bua5178u2'),
	(5210,'2012-06-03 11:39:00','jesus','jesus','teachings,teachings-tags,teachings-series',1,246,'jru7j11o1vlq0jt96bua5178u2'),
	(5212,'2012-06-03 11:39:17','jesus','jesus','text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(5216,'2012-06-03 11:39:22','jesus','jesus','text',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(5218,'2012-06-03 11:39:26','jesus','jesus','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5222,'2012-06-03 11:39:34','jesus','jesus','events-recurring',1,1,'jru7j11o1vlq0jt96bua5178u2'),
	(5224,'2012-06-03 11:39:42','jesus','jesus','teachings',1,242,'jru7j11o1vlq0jt96bua5178u2'),
	(5228,'2012-06-03 11:40:03','jesus','jesus','teachings',1,242,'jru7j11o1vlq0jt96bua5178u2'),
	(5328,'2012-06-03 12:11:34','Jesus','jesus','teachings,teachings-tags,teachings-series',1,246,'jru7j11o1vlq0jt96bua5178u2'),
	(5330,'2012-06-03 12:11:40','Wilsonville','wilsonville','teachings,teachings-tags,teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5332,'2012-06-03 12:11:46','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(5334,'2012-06-03 12:11:56','Wilsonville','wilsonville','teachings',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5336,'2012-06-03 12:12:02','heaven','heaven','teachings',1,23,'jru7j11o1vlq0jt96bua5178u2'),
	(5338,'2012-06-03 12:13:47','heaven','heaven','teachings',1,23,'jru7j11o1vlq0jt96bua5178u2'),
	(5346,'2012-06-03 12:14:43','jesus','jesus','teachings',1,242,'jru7j11o1vlq0jt96bua5178u2'),
	(5348,'2012-06-03 12:14:47','jesus','jesus','teachings',1,242,'jru7j11o1vlq0jt96bua5178u2'),
	(5352,'2012-06-03 12:14:57','jesus','jesus','teachings',1,242,'jru7j11o1vlq0jt96bua5178u2'),
	(5354,'2012-06-03 12:15:16','jesus','jesus','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(5373,'2012-06-03 12:21:27','jesus','jesus','teachings-tags',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(5385,'2012-06-03 12:23:50','hell','hell','teachings,teachings-tags,teachings-series',1,6,'jru7j11o1vlq0jt96bua5178u2'),
	(5387,'2012-06-03 12:23:58','hell','hell','teachings-tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5391,'2012-06-03 12:24:12','hell','hell','teachings-tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5395,'2012-06-03 12:24:30','hell','hell','teachings-tags',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5397,'2012-06-03 12:24:36','hell','hell','teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5399,'2012-06-03 12:24:40','thes','thes','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5413,'2012-06-03 12:35:00','sdsd','sdsd','teachings,teachings-tags,teachings-series',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5415,'2012-06-03 12:35:05','sdsd','sdsd','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jru7j11o1vlq0jt96bua5178u2'),
	(5417,'2012-06-03 12:35:16','thes','thes','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,71,'jru7j11o1vlq0jt96bua5178u2'),
	(5419,'2012-06-03 12:35:26','thes','thes','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5429,'2012-06-03 12:38:11','thes','thes','teachings-series',1,2,'jru7j11o1vlq0jt96bua5178u2'),
	(5466,'2012-06-03 16:04:35','church','church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,136,'jru7j11o1vlq0jt96bua5178u2'),
	(5473,'2012-06-03 16:05:09','resurrection','resurrection','teachings,teachings-tags,teachings-series',1,15,'jru7j11o1vlq0jt96bua5178u2'),
	(5484,'2012-06-03 16:12:30','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'jru7j11o1vlq0jt96bua5178u2'),
	(5490,'2012-06-03 16:12:48','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'jru7j11o1vlq0jt96bua5178u2'),
	(5499,'2012-06-03 16:13:45','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jru7j11o1vlq0jt96bua5178u2'),
	(5519,'2012-06-03 16:32:22','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'jru7j11o1vlq0jt96bua5178u2'),
	(6866,'2012-07-16 16:52:12','tired','tired','teachings,teachings-tags,teachings-series',1,0,'aip3ghne6v19g58dacemia5fs3'),
	(6867,'2012-07-16 16:52:21','tired','tired','text',1,0,'aip3ghne6v19g58dacemia5fs3'),
	(6868,'2012-07-16 16:52:31','tried','tried','text',1,0,'aip3ghne6v19g58dacemia5fs3'),
	(6869,'2012-07-16 16:52:41','tried','tried','teachings-tags',1,0,'aip3ghne6v19g58dacemia5fs3'),
	(6870,'2012-07-16 16:52:48','tried','tried','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'aip3ghne6v19g58dacemia5fs3'),
	(6871,'2012-07-16 16:53:15','weak','weak','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'aip3ghne6v19g58dacemia5fs3'),
	(6872,'2012-07-16 17:31:55','arremessou study time','arremessou study time','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4srvglj6jvhb4khmda5m2ll793'),
	(6873,'2012-07-16 17:32:39','Wednesday study time','wednesday study time','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'4srvglj6jvhb4khmda5m2ll793'),
	(6874,'2012-07-16 17:53:14','family camp','family camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(6875,'2012-07-16 17:53:36','fanelli','fanelli','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(6876,'2012-07-16 17:54:00','tad slaughter','tad slaughter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(6877,'2012-07-16 17:55:54','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(6878,'2012-07-16 17:58:47','forgiven','forgiven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'n45f5r6n1lei889pouqheod5u2'),
	(6879,'2012-07-16 18:00:10','temptation','temptation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'n45f5r6n1lei889pouqheod5u2'),
	(6880,'2012-07-16 18:01:12','james','james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'n45f5r6n1lei889pouqheod5u2'),
	(6881,'2012-07-16 18:02:03','luke','luke','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,59,'n45f5r6n1lei889pouqheod5u2'),
	(6882,'2012-07-16 18:02:33','book of james','book of james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'n45f5r6n1lei889pouqheod5u2'),
	(6883,'2012-07-16 18:04:57','james','james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,22,'n45f5r6n1lei889pouqheod5u2'),
	(6884,'2012-07-16 18:07:35','relationship','relationship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'n45f5r6n1lei889pouqheod5u2'),
	(6885,'2012-07-16 18:48:39','Tad','tad','teachings,teachings-tags,teachings-series',1,6,'iq8qohn5em9m9jedtlbam2du96'),
	(6886,'2012-07-16 18:59:36','work','work','teachings,teachings-tags,teachings-series',1,31,'osihc80hjk6ct16ns4oua34012'),
	(6887,'2012-07-16 19:03:11','women, work','women, work','teachings,teachings-tags,teachings-series',1,0,'osihc80hjk6ct16ns4oua34012'),
	(6888,'2012-07-16 19:03:23','woman, work','woman, work','teachings,teachings-tags,teachings-series',1,0,'osihc80hjk6ct16ns4oua34012'),
	(6889,'2012-07-16 19:03:31','woman','woman','teachings,teachings-tags,teachings-series',1,9,'osihc80hjk6ct16ns4oua34012'),
	(6890,'2012-07-16 19:22:38','titus','titus','teachings,teachings-tags,teachings-series',1,7,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(6891,'2012-07-16 19:22:47','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(6892,'2012-07-16 19:57:52','Weary','weary','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'0gj8f9duph0sn6ue6knvanvma1'),
	(6893,'2012-07-16 20:25:45','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6894,'2012-07-16 20:39:35','genisis','genisis','teachings,teachings-tags,teachings-series',1,0,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6895,'2012-07-16 20:40:10','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6896,'2012-07-16 21:13:12','genesis','genesis','teachings,teachings-tags,teachings-series',7,62,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6897,'2012-07-16 21:14:00','genesis','genesis','teachings,teachings-tags,teachings-series',6,62,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6898,'2012-07-16 22:08:28','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'creeimhtb8sob84j31jo5ulo53'),
	(6899,'2012-07-16 22:08:51','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',2,18,'creeimhtb8sob84j31jo5ulo53'),
	(6900,'2012-07-16 22:09:19','prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'creeimhtb8sob84j31jo5ulo53'),
	(6901,'2012-07-16 22:09:50','prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'creeimhtb8sob84j31jo5ulo53'),
	(6902,'2012-07-16 22:11:15','titus 1:','titus 1:','teachings,teachings-tags,teachings-series',1,7,'nshu9o7de3dv8hebo227icebc2'),
	(6903,'2012-07-16 22:28:04','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(6904,'2012-07-16 23:31:17','grace','grace','teachings,teachings-tags,teachings-series',1,19,'bn3tf5au4eu84fi0l6jlvpj792'),
	(6905,'2012-07-16 23:41:39','Family Camp','family camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'v5bg0juu1gldphog0hoa0llof6'),
	(6906,'2012-07-17 00:06:14','hebrews 5','hebrews 5','teachings,teachings-tags,teachings-series',1,18,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6907,'2012-07-17 00:07:30','hebrews 5','hebrews 5','teachings,teachings-tags,teachings-series',2,18,'132h1pb4hanh9d7qmjvgt2avl6'),
	(6908,'2012-07-17 00:38:40','hebrew','hebrew','teachings,teachings-tags,teachings-series',1,19,'u71l5cosrjfjb2vpa62hhtfde2'),
	(6909,'2012-07-17 06:12:42','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'uk93n27f8afd1tfk5d7onk7797'),
	(6910,'2012-07-17 07:24:31','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'2vi4uhi8v9farq5kuv8a6iidk1'),
	(6911,'2012-07-17 08:59:50','2 samuel','2 samuel','teachings,teachings-tags,teachings-series',1,68,'94odup005mssgguflg1sav3cb3'),
	(6912,'2012-07-17 09:00:07','2 samuel 22','2 samuel 22','teachings,teachings-tags,teachings-series',1,68,'94odup005mssgguflg1sav3cb3'),
	(6913,'2012-07-17 09:08:32','Acts 1','acts 1','teachings,teachings-tags,teachings-series',1,89,'iia6vfna84trsq60pqdu1mi8u1'),
	(6914,'2012-07-17 09:09:06','Acts 1','acts 1','teachings,teachings-tags,teachings-series',9,89,'iia6vfna84trsq60pqdu1mi8u1'),
	(6915,'2012-07-17 09:20:23','1 corinthians 3','1 corinthians 3','teachings,teachings-tags,teachings-series',1,95,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6916,'2012-07-17 10:03:43','m1-543','m1-543','teachings,teachings-tags,teachings-series',1,1,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6917,'2012-07-17 10:04:50','m1-544','m1-544','teachings,teachings-tags,teachings-series',1,1,'ph8r5mgrl2h3o3sb5togfgtjo6'),
	(6918,'2012-07-17 11:20:47','mathew 5','mathew 5','teachings,teachings-tags,teachings-series',1,0,'m8muvonk3ll2kkn29spig9oup2'),
	(6919,'2012-07-17 11:21:34','mathew 5','mathew 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m8muvonk3ll2kkn29spig9oup2'),
	(6920,'2012-07-17 11:21:55','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6921,'2012-07-17 11:22:36','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6922,'2012-07-17 11:23:28','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6923,'2012-07-17 11:25:03','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6924,'2012-07-17 11:26:20','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6925,'2012-07-17 11:27:27','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',9,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6926,'2012-07-17 11:28:40','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',8,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6927,'2012-07-17 11:30:26','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',7,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6928,'2012-07-17 11:31:07','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,82,'m8muvonk3ll2kkn29spig9oup2'),
	(6929,'2012-07-17 11:42:50','mathew 5:23','mathew 5:23','teachings,teachings-tags,teachings-series',1,0,'m8muvonk3ll2kkn29spig9oup2'),
	(6930,'2012-07-17 11:42:50','mathew 5:23','mathew 5:23','teachings,teachings-tags,teachings-series',1,0,'m8muvonk3ll2kkn29spig9oup2'),
	(6931,'2012-07-17 11:43:09','mathew 5:23','mathew 5:23','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m8muvonk3ll2kkn29spig9oup2'),
	(6932,'2012-07-17 13:59:15','Weddings','weddings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qvqi0nmjq2j1u0u6ok5cia50k7'),
	(6933,'2012-07-17 13:59:24','marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'qvqi0nmjq2j1u0u6ok5cia50k7'),
	(6934,'2012-07-17 14:03:41','1 corinthians','1 corinthians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,98,'n45f5r6n1lei889pouqheod5u2'),
	(6935,'2012-07-17 14:05:43','1 corinthians','1 corinthians','teachings-series',1,2,'n45f5r6n1lei889pouqheod5u2'),
	(6936,'2012-07-17 14:10:20','speaking','speaking','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'n45f5r6n1lei889pouqheod5u2'),
	(6937,'2012-07-17 14:17:15','holy spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'n45f5r6n1lei889pouqheod5u2'),
	(6938,'2012-07-17 15:52:05','2corinthians','2corinthians','teachings,teachings-tags,teachings-series',1,0,'p4v03p2ibut42me3c1jpe3v332'),
	(6939,'2012-07-17 15:56:58','marriage','marriage','teachings,teachings-tags,teachings-series',1,10,'1dmc3qootne4rv48f95rbsk2g6'),
	(6940,'2012-07-17 16:03:52','en','en','teachings,teachings-tags,teachings-series',1,0,'1dmc3qootne4rv48f95rbsk2g6'),
	(6941,'2012-07-17 16:03:56','men','men','teachings,teachings-tags,teachings-series',1,171,'1dmc3qootne4rv48f95rbsk2g6'),
	(6942,'2012-07-17 16:04:55','men','men','teachings',1,115,'1dmc3qootne4rv48f95rbsk2g6'),
	(6943,'2012-07-17 16:05:15','mens breakfast','mens breakfast','teachings',1,0,'1dmc3qootne4rv48f95rbsk2g6'),
	(6944,'2012-07-17 16:05:29','mens breakfast','mens breakfast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1dmc3qootne4rv48f95rbsk2g6'),
	(6945,'2012-07-17 16:05:47','cherish','cherish','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1dmc3qootne4rv48f95rbsk2g6'),
	(6946,'2012-07-17 16:05:55','love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,52,'1dmc3qootne4rv48f95rbsk2g6'),
	(6947,'2012-07-17 16:43:56','matt hamilton','matt hamilton','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'8r94lgdvk6unmtud6dupn2nq70'),
	(6948,'2012-07-17 16:44:11','Tad is Holy','tad is holy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6949,'2012-07-17 16:44:18','Tad is Amazing','tad is amazing','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'8r94lgdvk6unmtud6dupn2nq70'),
	(6950,'2012-07-17 16:44:27','Tad Wears a Pointy Hat','tad wears a pointy hat','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6951,'2012-07-17 16:44:37','Does Tad ever wear pants?','does tad ever wear pants?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6952,'2012-07-17 16:46:35','Is Tad going to overthrow Brett?','is tad going to overthrow brett?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6953,'2012-07-17 16:46:59','When is Tad going to overthrow Brett?','when is tad going to overthrow brett?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6954,'2012-07-17 16:47:09','Is Tad the Antichrist?','is tad the antichrist?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(6955,'2012-07-17 17:49:01','Tad is awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dnnrgt760p1c8ugefej6kfdgh3'),
	(6956,'2012-07-17 17:51:43','Prophe y','prophe y','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6957,'2012-07-17 19:20:23','Youth group Thursday','youth group thursday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'1d1il0uo4am8mgjnfc8oaenbm1'),
	(6958,'2012-07-17 19:28:52','Thursday','thursday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'1d1il0uo4am8mgjnfc8oaenbm1'),
	(6959,'2012-07-17 19:32:39','thursday','thursday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'1d1il0uo4am8mgjnfc8oaenbm1'),
	(6960,'2012-07-17 20:07:05','hope','hope','teachings,teachings-tags,teachings-series',1,14,'sfnll963794ifl4kpb4vtsmhu4'),
	(6961,'2012-07-17 20:11:35','hope','hope','downloads',1,0,'sfnll963794ifl4kpb4vtsmhu4'),
	(6962,'2012-07-17 20:11:54','hope','hope','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'sfnll963794ifl4kpb4vtsmhu4'),
	(6963,'2012-07-17 20:14:04','Prophe y','prophe y','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,67,'ncn2rgun560rkadh9kh4qq2tm7'),
	(6964,'2012-07-17 20:50:07','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,36,'5umghnplho3lhbpafh2oncl545'),
	(6965,'2012-07-17 20:51:03','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,36,'5umghnplho3lhbpafh2oncl545'),
	(6966,'2012-07-17 21:08:29','Ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(6967,'2012-07-17 21:14:44','Jesus','jesus','teachings,teachings-tags,teachings-series',1,250,'pp8qqa06chj5cpqral00ec85p7'),
	(6968,'2012-07-17 21:16:33','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'pp8qqa06chj5cpqral00ec85p7'),
	(6969,'2012-07-17 21:16:40','philippians','philippians','downloads',1,0,'pp8qqa06chj5cpqral00ec85p7'),
	(6970,'2012-07-17 21:17:28','philippians','philippians','teachings,teachings-tags,teachings-series',2,21,'pp8qqa06chj5cpqral00ec85p7'),
	(6971,'2012-07-17 21:17:34','philippians','philippians','teachings,teachings-tags,teachings-series',3,21,'pp8qqa06chj5cpqral00ec85p7'),
	(6972,'2012-07-17 21:17:47','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'pp8qqa06chj5cpqral00ec85p7'),
	(6973,'2012-07-17 21:23:34','colossians','colossians','teachings,teachings-tags,teachings-series',1,18,'pp8qqa06chj5cpqral00ec85p7'),
	(6974,'2012-07-17 21:25:44','colossians','colossians','teachings,teachings-tags,teachings-series',2,18,'pp8qqa06chj5cpqral00ec85p7'),
	(6975,'2012-07-17 23:58:09','masterbation','masterbation','teachings,teachings-tags,teachings-series',1,0,'vgkl16mdtracch65uujm2ld8l2'),
	(6976,'2012-07-17 23:58:53','Through the bible','through the bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,781,'c1cb084b51f1ja62j925istpq2'),
	(6977,'2012-07-18 00:13:48','John','john','teachings,teachings-tags,teachings-series',1,96,'80bists1g2vtqjd631rmbtqsd0'),
	(6978,'2012-07-18 11:16:10','revelation 17:5','revelation 17:5','teachings,teachings-tags,teachings-series',1,0,'vkkvuppkk32su0s6n29kk6idj2'),
	(6979,'2012-07-18 11:16:19','revelation 17','revelation 17','teachings,teachings-tags,teachings-series',1,86,'vkkvuppkk32su0s6n29kk6idj2'),
	(6980,'2012-07-18 11:16:51','revelation 17','revelation 17','teachings,teachings-tags,teachings-series',2,86,'vkkvuppkk32su0s6n29kk6idj2'),
	(6981,'2012-07-18 11:22:30','revelation 17:5','revelation 17:5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'uvia51cp296id4hnse606lgk46'),
	(6982,'2012-07-18 11:22:48','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'uvia51cp296id4hnse606lgk46'),
	(6983,'2012-07-18 11:22:52','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'uvia51cp296id4hnse606lgk46'),
	(6984,'2012-07-18 11:25:37','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'uvia51cp296id4hnse606lgk46'),
	(6985,'2012-07-18 11:26:23','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'uvia51cp296id4hnse606lgk46'),
	(6986,'2012-07-18 11:27:06','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'uvia51cp296id4hnse606lgk46'),
	(6987,'2012-07-18 11:27:19','revelation','revelation','teachings,teachings-tags,teachings-series',4,86,'uvia51cp296id4hnse606lgk46'),
	(6988,'2012-07-18 12:06:12','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'phdjghlbgjolvu1gm1plba5mn2'),
	(6989,'2012-07-18 12:32:00','wednesday, July 18  teaching location','wednesday, july 18  teaching location','teachings,teachings-tags,teachings-series',1,0,'vocftj8ffva3mp9inuisruoej4'),
	(6990,'2012-07-18 12:47:25','teachings','teachings','teachings,teachings-tags,teachings-series',1,1,'vocftj8ffva3mp9inuisruoej4'),
	(6991,'2012-07-18 12:47:59','Wednesday','wednesday','teachings,teachings-tags,teachings-series',1,785,'vocftj8ffva3mp9inuisruoej4'),
	(6992,'2012-07-18 12:48:30','Wednesday','wednesday','events',1,8,'vocftj8ffva3mp9inuisruoej4'),
	(6993,'2012-07-18 12:48:37','Wednesday','wednesday','events-recurring',1,2,'vocftj8ffva3mp9inuisruoej4'),
	(6994,'2012-07-18 13:50:29','m1-556','m1-556','teachings,teachings-tags,teachings-series',1,1,'3nroijat1c1a76r06pebgsp835'),
	(6995,'2012-07-18 14:08:05','M1-566','m1-566','teachings,teachings-tags,teachings-series',1,1,'3nroijat1c1a76r06pebgsp835'),
	(6996,'2012-07-18 14:15:22','1 kings 20','1 kings 20','teachings,teachings-tags,teachings-series',1,51,'u50ql5mr56hdpa0fenqa5iu850'),
	(6997,'2012-07-18 14:15:54','1 kings 20','1 kings 20','teachings',1,51,'u50ql5mr56hdpa0fenqa5iu850'),
	(6998,'2012-07-18 14:21:16','1 Kings 20','1 kings 20','teachings,teachings-tags,teachings-series',1,51,'rscrd6jvd02t4c49lhtsa6i8v4'),
	(6999,'2012-07-18 14:21:34','1 Kings 20','1 kings 20','teachings,teachings-tags,teachings-series',2,51,'rscrd6jvd02t4c49lhtsa6i8v4'),
	(7000,'2012-07-18 14:37:41','Proverbs 12','proverbs 12','teachings,teachings-tags,teachings-series',1,43,'3s5au872rfvsi0opb43sk87gb3'),
	(7001,'2012-07-18 14:42:19','jon','jon','teachings,teachings-tags,teachings-series',1,12,'inr8bbfg2fo8qejp9kgkj577p0'),
	(7002,'2012-07-18 14:42:40','John','john','teachings,teachings-tags,teachings-series',1,96,'inr8bbfg2fo8qejp9kgkj577p0'),
	(7003,'2012-07-18 14:46:48','John','john','teachings,teachings-tags,teachings-series',2,96,'inr8bbfg2fo8qejp9kgkj577p0'),
	(7004,'2012-07-18 14:48:47','John','john','teachings,teachings-tags,teachings-series',3,96,'inr8bbfg2fo8qejp9kgkj577p0'),
	(7005,'2012-07-18 14:54:16','Valley','valley','teachings,teachings-tags,teachings-series',1,3,'u50ql5mr56hdpa0fenqa5iu850'),
	(7006,'2012-07-18 14:55:16','valleys','valleys','teachings,teachings-tags,teachings-series',1,0,'u50ql5mr56hdpa0fenqa5iu850'),
	(7007,'2012-07-18 14:55:28','mountain','mountain','teachings,teachings-tags,teachings-series',1,2,'u50ql5mr56hdpa0fenqa5iu850'),
	(7008,'2012-07-18 15:11:35','Hebrews 12.1','hebrews 12.1','teachings,teachings-tags,teachings-series',1,0,'8jjhncll4341kk7hotdnn6r4j2'),
	(7009,'2012-07-18 15:11:46','Hebrews 12','hebrews 12','teachings,teachings-tags,teachings-series',1,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7010,'2012-07-18 15:12:23','Hebrews 12','hebrews 12','teachings',1,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7011,'2012-07-18 15:12:41','Hebrews 12','hebrews 12','teachings',2,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7012,'2012-07-18 15:12:54','Hebrews','hebrews','teachings',1,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7013,'2012-07-18 15:13:17','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7014,'2012-07-18 15:13:59','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'8jjhncll4341kk7hotdnn6r4j2'),
	(7015,'2012-07-18 15:14:07','hebrews','hebrews','text',1,0,'8jjhncll4341kk7hotdnn6r4j2');

INSERT INTO `sym_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`)
VALUES
	(7016,'2012-07-18 15:26:37','Saturday, July 14th, 2012','saturday, july 14th, 2012','teachings,teachings-tags,teachings-series',1,0,'1d3upc58voqa29nlud79fps5f3'),
	(7017,'2012-07-18 15:49:41','Rahab','rahab','teachings,teachings-tags,teachings-series',1,1,'au5egus682atbjlkcouhu163m6'),
	(7018,'2012-07-18 17:22:20','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'cmcmhnb712lqbtkdua8uuuul37'),
	(7019,'2012-07-18 17:26:08','tad is awesome','tad is awesome','teachings,teachings-tags,teachings-series',1,0,'fbv8maeu0pk1d9fdqlnjd43gr4'),
	(7020,'2012-07-18 17:26:23','tad is awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'fbv8maeu0pk1d9fdqlnjd43gr4'),
	(7021,'2012-07-18 18:14:04','sanctification','sanctification','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8r94lgdvk6unmtud6dupn2nq70'),
	(7022,'2012-07-18 18:14:16','JEsus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,285,'8r94lgdvk6unmtud6dupn2nq70'),
	(7023,'2012-07-18 18:17:32','jesus','jesus','teachings,teachings-tags,teachings-series',1,263,'r02n693n76v3so6g5so9mhu972'),
	(7024,'2012-07-18 18:17:42','jesus','jesus','events-recurring',1,1,'r02n693n76v3so6g5so9mhu972'),
	(7025,'2012-07-18 18:18:05','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,285,'r02n693n76v3so6g5so9mhu972'),
	(7026,'2012-07-18 18:18:23','God','god','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,220,'r02n693n76v3so6g5so9mhu972'),
	(7027,'2012-07-18 18:41:44','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'rgfq0qror1gd9k26a7kof5e755'),
	(7028,'2012-07-18 19:16:03','http://accf.co/13780','http://accf.co/13780','teachings,teachings-tags,teachings-series',1,0,'jkh9cnpb7in8cfgc8577avuqe3'),
	(7029,'2012-07-18 19:16:16','http://accf.co/13780','http://accf.co/13780','teachings',1,0,'jkh9cnpb7in8cfgc8577avuqe3'),
	(7030,'2012-07-18 19:19:51','ustream','ustream','teachings',1,0,'404b9m412knmja7kbseng9j9t3'),
	(7031,'2012-07-18 20:00:07','Prophe y','prophe y','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,68,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7032,'2012-07-18 20:00:40','Prophe y','prophe y','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,68,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7033,'2012-07-18 20:00:55','Prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7034,'2012-07-18 20:01:27','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7035,'2012-07-18 20:01:33','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,37,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7036,'2012-07-18 20:06:42','july15,2012','july15,2012','teachings,teachings-tags,teachings-series',1,0,'gliodff8l4t91d0ac6tvj7mdl0'),
	(7037,'2012-07-18 20:07:10','july 15,2012','july 15,2012','teachings,teachings-tags,teachings-series',1,0,'gliodff8l4t91d0ac6tvj7mdl0'),
	(7038,'2012-07-18 20:07:27','july 15,2012','july 15,2012','teachings-tags',1,0,'gliodff8l4t91d0ac6tvj7mdl0'),
	(7039,'2012-07-18 20:53:11','genesis 32','genesis 32','teachings,teachings-tags,teachings-series',1,62,'5ivoq7th7o89mpo3fkkecvbgm6'),
	(7040,'2012-07-18 20:53:16','genesis 32','genesis 32','teachings,teachings-tags,teachings-series',1,62,'5ivoq7th7o89mpo3fkkecvbgm6'),
	(7041,'2012-07-18 20:53:40','genesis 32','genesis 32','teachings',1,62,'5ivoq7th7o89mpo3fkkecvbgm6'),
	(7042,'2012-07-18 20:53:48','genesis','genesis','teachings',1,62,'5ivoq7th7o89mpo3fkkecvbgm6'),
	(7043,'2012-07-18 20:54:03','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,63,'5ivoq7th7o89mpo3fkkecvbgm6'),
	(7044,'2012-07-18 20:55:35','bible','bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,842,'132vcv9o1bg6kfp4ste8pfr5n4'),
	(7045,'2012-07-18 20:58:39','ustream','ustream','teachings,teachings-tags,teachings-series',1,0,'e813crtk5vqgod7enngtvdstv1'),
	(7046,'2012-07-18 21:06:11','Matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,83,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7047,'2012-07-18 21:06:44','Matthew 10:','matthew 10:','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7048,'2012-07-18 21:06:56','Matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,83,'ncn2rgun560rkadh9kh4qq2tm7'),
	(7049,'2012-07-18 21:44:26','Tad','tad','teachings,teachings-tags,teachings-series',1,8,'ckhp137otcshnet3m7vg62fct2'),
	(7050,'2012-07-18 22:51:28','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'6aop86ts7clt4d8smc35h3hh27'),
	(7051,'2012-07-18 23:01:50','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(7052,'2012-07-18 23:14:17','Radio Teachings of Day by Day','radio teachings of day by day','teachings,teachings-tags,teachings-series',1,0,'8jtav1a3kgt6jbupehouef0qt0'),
	(7053,'2012-07-18 23:14:25','Radio Teachings of Day by Day','radio teachings of day by day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'8jtav1a3kgt6jbupehouef0qt0'),
	(7054,'2012-07-18 23:16:52','2 Corinthians 12:1-10','2 corinthians 12:1-10','teachings,teachings-tags,teachings-series',1,0,'8jtav1a3kgt6jbupehouef0qt0'),
	(7055,'2012-07-18 23:17:01','2 Corinthians 12:1-10','2 corinthians 12:1-10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'8jtav1a3kgt6jbupehouef0qt0'),
	(7056,'2012-07-18 23:17:47','2 Corinthians 12:1-10','2 corinthians 12:1-10','teachings-series',1,0,'8jtav1a3kgt6jbupehouef0qt0'),
	(7057,'2012-07-19 02:05:10','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,83,'qaujf6cds18dglb8kjjuf753n4'),
	(7058,'2012-07-19 02:05:15','tad','tad','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'qaujf6cds18dglb8kjjuf753n4'),
	(7059,'2012-07-19 07:21:29','James','james','teachings,teachings-tags,teachings-series',1,17,'mctra9cbvabo36ki7nqkk7amg7'),
	(7060,'2012-07-19 07:21:56','James','james','teachings,teachings-tags,teachings-series',2,17,'mctra9cbvabo36ki7nqkk7amg7'),
	(7061,'2012-07-19 08:51:51','addiction','addiction','teachings,teachings-tags,teachings-series',1,0,'9qhqe1k8us4uh0l7r7rhabrbd4'),
	(7062,'2012-07-19 08:52:06','husband','husband','teachings,teachings-tags,teachings-series',1,5,'9qhqe1k8us4uh0l7r7rhabrbd4'),
	(7063,'2012-07-19 09:06:31','july 14,2012','july 14,2012','teachings,teachings-tags,teachings-series',1,0,'khcd0bsccuf3426gb31lhlmtp6'),
	(7064,'2012-07-19 10:26:56','Tad Slaughter','tad slaughter','teachings,teachings-tags,teachings-series',1,7,'6p23vh1vnuctjbd1ruqhi4pfs7'),
	(7065,'2012-07-19 11:06:03','tad is awesome','tad is awesome','teachings',1,0,'fbv8maeu0pk1d9fdqlnjd43gr4'),
	(7066,'2012-07-19 11:06:18','tad','tad','teachings',1,6,'fbv8maeu0pk1d9fdqlnjd43gr4'),
	(7067,'2012-07-19 12:57:54','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,61,'5h7rdt4j04onjh1mhutakqgqc7'),
	(7068,'2012-07-19 15:48:30','guidance','guidance','teachings,teachings-tags,teachings-series',1,1,'osihc80hjk6ct16ns4oua34012'),
	(7069,'2012-07-19 15:48:30','guidance','guidance','teachings,teachings-tags,teachings-series',1,1,'osihc80hjk6ct16ns4oua34012'),
	(7070,'2012-07-19 15:49:39','employment','employment','teachings,teachings-tags,teachings-series',1,0,'osihc80hjk6ct16ns4oua34012'),
	(7071,'2012-07-19 15:50:05','direction','direction','teachings,teachings-tags,teachings-series',1,3,'osihc80hjk6ct16ns4oua34012'),
	(7072,'2012-07-19 20:55:23','1 thessalonians 3-4','1 thessalonians 3-4','teachings,teachings-tags,teachings-series',1,1,'ffmji99hj23ioj8r89ij17srk2'),
	(7073,'2012-07-19 22:09:44','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(7074,'2012-07-20 07:49:48','James','james','teachings,teachings-tags,teachings-series',2,17,'mctra9cbvabo36ki7nqkk7amg7'),
	(7075,'2012-07-20 07:50:05','Marriage','marriage','teachings,teachings-tags,teachings-series',1,11,'mctra9cbvabo36ki7nqkk7amg7'),
	(7076,'2012-07-20 07:50:56','marriage','marriage','teachings,teachings-tags,teachings-series',1,11,'mctra9cbvabo36ki7nqkk7amg7'),
	(7077,'2012-07-20 08:01:44','acts','acts','teachings,teachings-tags,teachings-series',1,89,'7c9n6tgmgncn4n1tlts28fetd3'),
	(7078,'2012-07-20 08:08:03','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'7c9n6tgmgncn4n1tlts28fetd3'),
	(7079,'2012-07-20 08:08:35','Romans 1','romans 1','teachings,teachings-tags,teachings-series',1,65,'7c9n6tgmgncn4n1tlts28fetd3'),
	(7080,'2012-07-20 08:08:45','Romans 1','romans 1','teachings,teachings-tags,teachings-series',3,65,'7c9n6tgmgncn4n1tlts28fetd3'),
	(7081,'2012-07-20 08:08:55','Romans 1','romans 1','teachings,teachings-tags,teachings-series',2,65,'7c9n6tgmgncn4n1tlts28fetd3'),
	(7082,'2012-07-20 08:26:21','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'jj1ksu5o4ennjmr2nsf7j1n5b1'),
	(7083,'2012-07-20 09:28:44','Matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,83,'5umghnplho3lhbpafh2oncl545'),
	(7084,'2012-07-20 09:36:27','relationships, struggle, forgiveness, understanding','relationships, struggle, forgiveness, understanding','teachings,teachings-tags,teachings-series',1,0,'sc4098rfii757kitqrq767q6s6'),
	(7085,'2012-07-20 09:36:46','relationships','relationships','teachings,teachings-tags,teachings-series',1,4,'sc4098rfii757kitqrq767q6s6'),
	(7086,'2012-07-20 10:07:40','direction','direction','downloads',1,0,'osihc80hjk6ct16ns4oua34012'),
	(7087,'2012-07-20 10:52:23','dating','dating','teachings,teachings-tags,teachings-series',1,2,'sc4098rfii757kitqrq767q6s6'),
	(7088,'2012-07-20 10:53:19','forgivness','forgivness','teachings,teachings-tags,teachings-series',1,0,'sc4098rfii757kitqrq767q6s6'),
	(7089,'2012-07-20 10:53:29','love','love','teachings,teachings-tags,teachings-series',1,46,'sc4098rfii757kitqrq767q6s6'),
	(7090,'2012-07-20 11:08:11','JUne 27','june 27','teachings,teachings-tags,teachings-series',1,0,'if8gjdidtagcl1gupgs6lnkpg1'),
	(7091,'2012-07-20 11:08:23','JUne 27','june 27','teachings',1,0,'if8gjdidtagcl1gupgs6lnkpg1'),
	(7092,'2012-07-20 11:08:36','JUne 27','june 27','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'if8gjdidtagcl1gupgs6lnkpg1'),
	(7093,'2012-07-20 12:47:47','saved','saved','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'t9uk5k92tl3lq9kl5qusoja487'),
	(7094,'2012-07-20 12:47:56','marriage','marriage','teachings-tags',1,4,'4c1r2p0k7m2jt1d4q804q1apo7'),
	(7095,'2012-07-20 12:50:18','voice','voice','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'t9uk5k92tl3lq9kl5qusoja487'),
	(7096,'2012-07-20 12:50:37','speaking','speaking','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'t9uk5k92tl3lq9kl5qusoja487'),
	(7097,'2012-07-20 12:51:13','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'t9uk5k92tl3lq9kl5qusoja487'),
	(7098,'2012-07-20 13:07:50','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,67,'t9uk5k92tl3lq9kl5qusoja487'),
	(7099,'2012-07-20 13:25:24','direction','direction','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'osihc80hjk6ct16ns4oua34012'),
	(7100,'2012-07-20 13:47:33','2 Timothy','2 timothy','teachings,teachings-tags,teachings-series',1,37,'fo9j3ic5kn8lmb4jqgclfjs4j7'),
	(7101,'2012-07-20 14:05:39','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,67,'t9uk5k92tl3lq9kl5qusoja487'),
	(7102,'2012-07-20 14:29:03','zechariah','zechariah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'phdjghlbgjolvu1gm1plba5mn2'),
	(7103,'2012-07-20 14:56:48','isaiah','isaiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,63,'phdjghlbgjolvu1gm1plba5mn2'),
	(7104,'2012-07-20 16:17:15','thorpe','thorpe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nsq9rl8gevju2a3defo2ns5jt3'),
	(7105,'2012-07-20 18:20:32','rapture','rapture','teachings,teachings-tags,teachings-series',1,12,'k80aug0k20hoqba53i09nfhpp2'),
	(7106,'2012-07-20 18:20:50','rapture','rapture','teachings,teachings-tags,teachings-series',2,12,'k80aug0k20hoqba53i09nfhpp2'),
	(7107,'2012-07-20 18:21:10','rapture','rapture','teachings,teachings-tags,teachings-series',1,12,'k80aug0k20hoqba53i09nfhpp2'),
	(7108,'2012-07-20 20:53:57','end times prophecy','end times prophecy','teachings,teachings-tags,teachings-series',1,7,'godargsbq2ri8u0ch8tecnag46'),
	(7109,'2012-07-20 23:27:06','nehemiah','nehemiah','teachings,teachings-tags,teachings-series',1,10,'5ncd71aiq1ld2ds4soridnfk96'),
	(7110,'2012-07-20 23:27:15','nehemiah','nehemiah','downloads',1,0,'5ncd71aiq1ld2ds4soridnfk96'),
	(7111,'2012-07-20 23:28:07','nehemiah','nehemiah','teachings',1,10,'5ncd71aiq1ld2ds4soridnfk96'),
	(7112,'2012-07-21 00:21:29','Jesus','jesus','teachings,teachings-tags,teachings-series',1,295,'mcu4k4300a234s663lf8qqlno6'),
	(7113,'2012-07-21 00:21:53','Jesus','jesus','teachings',1,290,'mcu4k4300a234s663lf8qqlno6'),
	(7114,'2012-07-21 00:22:26','Jesus','jesus','teachings-series',1,1,'mcu4k4300a234s663lf8qqlno6'),
	(7115,'2012-07-21 00:23:37','2 Timothy','2 timothy','teachings-series',1,2,'mcu4k4300a234s663lf8qqlno6'),
	(7116,'2012-07-21 12:19:56','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'nick2brmlsf41dvf1840mu39n7'),
	(7117,'2012-07-21 14:05:49','cd','cd','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'go9u4dmo3hmnhdd02i4japhbq0'),
	(7118,'2012-07-21 15:18:43','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'pir5mnc57g0k382dqk0le5lbe4'),
	(7119,'2012-07-21 15:20:18','revelation','revelation','teachings-series',1,0,'pir5mnc57g0k382dqk0le5lbe4'),
	(7120,'2012-07-21 15:20:31','revelation','revelation','downloads',1,0,'pir5mnc57g0k382dqk0le5lbe4'),
	(7121,'2012-07-21 15:20:41','revelation','revelation','teachings',1,85,'pir5mnc57g0k382dqk0le5lbe4'),
	(7122,'2012-07-21 15:20:49','revelation','revelation','teachings',2,85,'pir5mnc57g0k382dqk0le5lbe4'),
	(7123,'2012-07-21 15:21:01','revelation','revelation','teachings',3,85,'pir5mnc57g0k382dqk0le5lbe4'),
	(7124,'2012-07-21 15:21:14','revelation','revelation','teachings',9,85,'pir5mnc57g0k382dqk0le5lbe4'),
	(7125,'2012-07-21 15:36:49','mattew 6-24','mattew 6-24','teachings,teachings-tags,teachings-series',1,0,'2l4vfkuvd64nhqs51vgodnj5c4'),
	(7126,'2012-07-21 15:37:22','mattew','mattew','teachings,teachings-tags,teachings-series',1,0,'2l4vfkuvd64nhqs51vgodnj5c4'),
	(7127,'2012-07-21 15:37:34','mattew','mattew','teachings',1,0,'2l4vfkuvd64nhqs51vgodnj5c4'),
	(7128,'2012-07-21 15:48:52','Works','works','teachings,teachings-tags,teachings-series',1,4,'nick2brmlsf41dvf1840mu39n7'),
	(7129,'2012-07-21 15:49:59','Speech','speech','teachings,teachings-tags,teachings-series',1,3,'nick2brmlsf41dvf1840mu39n7'),
	(7130,'2012-07-21 15:50:50','Justification','justification','teachings,teachings-tags,teachings-series',1,4,'nick2brmlsf41dvf1840mu39n7'),
	(7131,'2012-07-21 15:51:24','Righteousness','righteousness','teachings,teachings-tags,teachings-series',1,10,'nick2brmlsf41dvf1840mu39n7'),
	(7132,'2012-07-21 15:54:47','Good Works','good works','teachings,teachings-tags,teachings-series',1,0,'nick2brmlsf41dvf1840mu39n7'),
	(7133,'2012-07-21 15:54:56','Matt. 5','matt. 5','teachings,teachings-tags,teachings-series',1,0,'nick2brmlsf41dvf1840mu39n7'),
	(7134,'2012-07-21 15:55:06','Matthew 5','matthew 5','teachings,teachings-tags,teachings-series',1,83,'nick2brmlsf41dvf1840mu39n7'),
	(7135,'2012-07-21 15:55:16','Matthew 5','matthew 5','teachings,teachings-tags,teachings-series',9,83,'nick2brmlsf41dvf1840mu39n7'),
	(7136,'2012-07-21 15:55:22','Matthew 5','matthew 5','teachings,teachings-tags,teachings-series',7,83,'nick2brmlsf41dvf1840mu39n7'),
	(7137,'2012-07-21 15:55:33','Matthew 5','matthew 5','teachings,teachings-tags,teachings-series',8,83,'nick2brmlsf41dvf1840mu39n7'),
	(7138,'2012-07-21 15:56:01','deeds','deeds','teachings,teachings-tags,teachings-series',1,2,'nick2brmlsf41dvf1840mu39n7'),
	(7139,'2012-07-21 17:28:25','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'o0iu7e7gj4qnaf47kjn3v41cc4'),
	(7140,'2012-07-21 17:29:03','ephesians','ephesians','teachings-series',1,1,'o0iu7e7gj4qnaf47kjn3v41cc4'),
	(7141,'2012-07-21 17:46:16','july 21 6 oclock','july 21 6 oclock','teachings,teachings-tags,teachings-series',1,0,'gliodff8l4t91d0ac6tvj7mdl0'),
	(7142,'2012-07-21 17:47:05','july 21, 2012 @   6 oclock','july 21, 2012 @   6 oclock','teachings,teachings-tags,teachings-series',1,0,'gliodff8l4t91d0ac6tvj7mdl0'),
	(7143,'2012-07-21 19:28:42','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,18,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(7144,'2012-07-21 19:28:48','prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(7145,'2012-07-21 19:39:21','Compromise','compromise','teachings,teachings-tags,teachings-series',1,5,'3mmcjbn0tq4bkr7rt9amc2v757'),
	(7146,'2012-07-21 19:48:30','worship','worship','teachings,teachings-tags,teachings-series',1,10,'134h0mbbqc2smas2re5lmh8v14'),
	(7147,'2012-07-21 19:49:20','music','music','teachings,teachings-tags,teachings-series',1,3,'134h0mbbqc2smas2re5lmh8v14'),
	(7148,'2012-07-21 21:42:21','Ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'734ejdjnivcl9f5hpo18e78ka3'),
	(7149,'2012-07-21 21:42:35','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'734ejdjnivcl9f5hpo18e78ka3'),
	(7150,'2012-07-21 21:51:33','12/4','12/4','teachings,teachings-tags,teachings-series',1,0,'vbu1uf2hds8qmcoq2taejt9jm5'),
	(7151,'2012-07-21 21:51:48','12/4','12/4','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vbu1uf2hds8qmcoq2taejt9jm5'),
	(7152,'2012-07-21 21:52:04','12/4','12/4','teachings',1,0,'vbu1uf2hds8qmcoq2taejt9jm5'),
	(7153,'2012-07-21 23:08:27','july 21,2012','july 21,2012','teachings,teachings-tags,teachings-series',1,0,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(7154,'2012-07-21 23:08:43','july 21,2012','july 21,2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'6s9k6ucu36d29lo8jg8h1q7pk1'),
	(7155,'2012-07-22 00:00:11','jESUS','jesus','teachings,teachings-tags,teachings-series',1,295,'p1sg3vum5achv21qfj8bh8e6a4'),
	(7156,'2012-07-22 00:23:42','leviticus','leviticus','teachings,teachings-tags,teachings-series',1,23,'c03rgom1vhanpjahj3p8b2s8l7'),
	(7157,'2012-07-22 00:24:02','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'c03rgom1vhanpjahj3p8b2s8l7'),
	(7158,'2012-07-22 10:26:32','Genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'oj7oggb3jj4paa5l5ld65djjv2'),
	(7159,'2012-07-22 10:27:53','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,63,'oj7oggb3jj4paa5l5ld65djjv2'),
	(7160,'2012-07-22 10:28:08','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,63,'oj7oggb3jj4paa5l5ld65djjv2'),
	(7161,'2012-07-22 14:29:32','titus','titus','teachings,teachings-tags,teachings-series',1,7,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(7162,'2012-07-22 14:29:39','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'c3mt5k2t2d8elvfcj32dp4t8s5'),
	(7163,'2012-07-22 16:44:39','law','law','teachings,teachings-tags,teachings-series',1,18,'7qr5bqb78rrm5je9g5h6q5j5o7'),
	(7164,'2012-07-22 16:44:49','law','law','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'7qr5bqb78rrm5je9g5h6q5j5o7'),
	(7165,'2012-07-22 16:45:52','law','law','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'7qr5bqb78rrm5je9g5h6q5j5o7'),
	(7166,'2012-07-22 16:46:04','law','law','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'7qr5bqb78rrm5je9g5h6q5j5o7'),
	(7167,'2012-07-22 16:46:17','July 22, 2012 sermon','july 22, 2012 sermon','teachings,teachings-tags,teachings-series',1,0,'s2o32avd2kd44n9hs43trs67r4'),
	(7168,'2012-07-22 17:16:18','corthians','corthians','teachings,teachings-tags,teachings-series',1,0,'3vt25fb4hf8q6ems6f9bmitcp1'),
	(7169,'2012-07-22 17:16:27','courting','courting','teachings,teachings-tags,teachings-series',1,1,'3vt25fb4hf8q6ems6f9bmitcp1'),
	(7170,'2012-07-22 17:41:41','Profecy','profecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5umghnplho3lhbpafh2oncl545'),
	(7171,'2012-07-22 17:42:03','Phrofecy','phrofecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5umghnplho3lhbpafh2oncl545'),
	(7172,'2012-07-22 17:42:06','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'5umghnplho3lhbpafh2oncl545'),
	(7173,'2012-07-22 19:48:38','July 22,2012  Sermon','july 22,2012  sermon','teachings,teachings-tags,teachings-series',1,0,'s2o32avd2kd44n9hs43trs67r4'),
	(7174,'2012-07-22 19:57:25','Prophecy 2011','prophecy 2011','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'36an9fri1vi8fohkmduoefnq96'),
	(7175,'2012-07-22 20:02:42','acts 1','acts 1','teachings,teachings-tags,teachings-series',1,89,'dj7m8cp12rmvbkkk0b35rrldv6'),
	(7176,'2012-07-22 20:03:28','acts 1','acts 1','teachings,teachings-tags,teachings-series',2,89,'dj7m8cp12rmvbkkk0b35rrldv6'),
	(7177,'2012-07-22 20:03:41','acts 1','acts 1','teachings,teachings-tags,teachings-series',3,89,'dj7m8cp12rmvbkkk0b35rrldv6'),
	(7178,'2012-07-22 20:03:56','acts 1','acts 1','teachings,teachings-tags,teachings-series',4,89,'dj7m8cp12rmvbkkk0b35rrldv6'),
	(7179,'2012-07-22 20:04:10','acts 1','acts 1','teachings,teachings-tags,teachings-series',5,89,'dj7m8cp12rmvbkkk0b35rrldv6'),
	(7180,'2012-07-22 22:04:55','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(7181,'2012-07-23 01:01:48','m1-566','m1-566','teachings,teachings-tags,teachings-series',1,1,'3nroijat1c1a76r06pebgsp835'),
	(7182,'2012-07-23 05:11:57','Peter','peter','teachings,teachings-tags,teachings-series',1,31,'bge1ak3nku44lsh2jhg6jdnka0'),
	(7183,'2012-07-23 05:12:25','Peter','peter','teachings',1,29,'bge1ak3nku44lsh2jhg6jdnka0'),
	(7184,'2012-07-23 05:12:43','Peter','peter','teachings',2,29,'bge1ak3nku44lsh2jhg6jdnka0'),
	(7185,'2012-07-23 05:13:14','Peter','peter','teachings',3,29,'bge1ak3nku44lsh2jhg6jdnka0'),
	(7186,'2012-07-23 06:21:17','july 4, 2012','july 4, 2012','teachings,teachings-tags,teachings-series',1,0,'u87p2ualnn7bvn0llc0241v824'),
	(7187,'2012-07-23 06:37:20','marriage','marriage','teachings,teachings-tags,teachings-series',1,11,'mctra9cbvabo36ki7nqkk7amg7'),
	(7188,'2012-07-23 09:00:58','sfdf','sfdf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'v0pn1cnb7f876j1qcpisdolh47'),
	(7189,'2012-07-23 09:15:07','Revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'re6sipk1l3a9h8g4tcsk883k07'),
	(7190,'2012-07-23 09:15:51','Revelation 8','revelation 8','teachings,teachings-tags,teachings-series',1,86,'re6sipk1l3a9h8g4tcsk883k07'),
	(7191,'2012-07-23 09:19:15','Revelation 8','revelation 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'re6sipk1l3a9h8g4tcsk883k07'),
	(7192,'2012-07-23 09:29:56','Hello','hello','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vrnknt1akffm1sk4ms4lmr8hh4'),
	(7193,'2012-07-23 09:30:09','Hello','hello','downloads',1,0,'vrnknt1akffm1sk4ms4lmr8hh4'),
	(7194,'2012-07-23 16:12:53','abe','abe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,16,'fg7las503o5fevqiggv0ggmnq3'),
	(7195,'2012-07-23 16:27:36','si 546','si 546','teachings,teachings-tags,teachings-series',1,4,'rf57oo3e74hu6kophrfmus5pm5'),
	(7196,'2012-07-23 16:27:46','si 546','si 546','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'rf57oo3e74hu6kophrfmus5pm5'),
	(7197,'2012-07-23 16:36:43','titus','titus','teachings,teachings-tags,teachings-series',1,7,'si4e57osuld4d11i8p61q9f9m4'),
	(7198,'2012-07-23 16:37:55','Luke 17','luke 17','teachings,teachings-tags,teachings-series',1,59,'eorbpcj02bm24u3g45qcsspdp5'),
	(7199,'2012-07-23 16:38:09','Luke 17','luke 17','teachings',1,58,'eorbpcj02bm24u3g45qcsspdp5'),
	(7200,'2012-07-23 16:38:18','Luke','luke','teachings',1,58,'eorbpcj02bm24u3g45qcsspdp5'),
	(7201,'2012-07-23 16:38:29','Luke','luke','teachings',2,58,'eorbpcj02bm24u3g45qcsspdp5'),
	(7202,'2012-07-23 16:38:47','Luke 17 through the bible','luke 17 through the bible','teachings',1,25,'eorbpcj02bm24u3g45qcsspdp5'),
	(7203,'2012-07-23 19:14:59','s1-585','s1-585','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'il1k3n66fl3v3clr6md7j2vli1'),
	(7204,'2012-07-23 19:32:50','Sunday July 22, 2012','sunday july 22, 2012','teachings,teachings-tags,teachings-series',1,0,'s2o32avd2kd44n9hs43trs67r4'),
	(7205,'2012-07-23 19:38:06','Sunday July 22, 2012','sunday july 22, 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'s2o32avd2kd44n9hs43trs67r4'),
	(7206,'2012-07-23 19:38:25','Sunday July 22, 2012','sunday july 22, 2012','teachings',1,0,'s2o32avd2kd44n9hs43trs67r4'),
	(7207,'2012-07-23 20:29:07','jesus','jesus','teachings,teachings-tags,teachings-series',1,295,'0j47qqvp26ulcut1fcdl5ru2u4'),
	(7208,'2012-07-24 06:59:05','Phillipians','phillipians','teachings,teachings-tags,teachings-series',1,0,'0dvhhh2g1hgckvc7rkbffngnm5'),
	(7209,'2012-07-24 07:00:24','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'0dvhhh2g1hgckvc7rkbffngnm5'),
	(7210,'2012-07-24 07:38:48','parenting','parenting','teachings,teachings-tags,teachings-series',1,3,'bor0u8p4rplq9n7mpqujo65gi2'),
	(7211,'2012-07-24 08:43:41','mark','mark','teachings,teachings-tags,teachings-series',1,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7212,'2012-07-24 09:03:17','s1-528','s1-528','teachings,teachings-tags,teachings-series',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7213,'2012-07-24 09:03:44','s1-529','s1-529','teachings,teachings-tags,teachings-series',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7214,'2012-07-24 09:04:38','s1-529','s1-529','teachings',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7215,'2012-07-24 09:31:11','m1545','m1545','teachings',1,0,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7216,'2012-07-24 09:31:35','m1-545','m1-545','teachings',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7217,'2012-07-24 10:16:59','Prophecy 2011','prophecy 2011','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'36an9fri1vi8fohkmduoefnq96'),
	(7218,'2012-07-24 10:37:32','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'5umghnplho3lhbpafh2oncl545'),
	(7219,'2012-07-24 10:37:37','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,38,'5umghnplho3lhbpafh2oncl545'),
	(7220,'2012-07-24 10:43:55','love and forgiveness','love and forgiveness','teachings,teachings-tags,teachings-series',1,1,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7221,'2012-07-24 10:58:39','christ\'s love and forgiveness','christ\'s love and forgiveness','teachings,teachings-tags,teachings-series',1,0,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7222,'2012-07-24 10:58:55','Christ\'s love and forgiveness','christ\'s love and forgiveness','teachings,teachings-tags,teachings-series',1,0,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7223,'2012-07-24 10:59:18','love','love','teachings,teachings-tags,teachings-series',1,46,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7224,'2012-07-24 10:59:37','christ\'s love','christ\'s love','teachings,teachings-tags,teachings-series',1,0,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7225,'2012-07-24 11:00:04','love','love','teachings,teachings-tags,teachings-series',2,46,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7226,'2012-07-24 11:00:27','love','love','teachings,teachings-tags,teachings-series',3,46,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7227,'2012-07-24 11:00:47','s1-530','s1-530','teachings',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7228,'2012-07-24 11:00:51','love','love','teachings,teachings-tags,teachings-series',4,46,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7229,'2012-07-24 11:03:50','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'nsq9rl8gevju2a3defo2ns5jt3'),
	(7230,'2012-07-24 11:03:55','sumrall','sumrall','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'nsq9rl8gevju2a3defo2ns5jt3'),
	(7231,'2012-07-24 11:04:04','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'g5b9on43osqh0ins9ec8kfsat5'),
	(7232,'2012-07-24 11:07:31','Josh Miller','josh miller','teachings,teachings-tags,teachings-series',1,0,'qvqi0nmjq2j1u0u6ok5cia50k7'),
	(7233,'2012-07-24 11:14:27','jesus','jesus','teachings,teachings-tags,teachings-series',2,296,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7234,'2012-07-24 11:15:23','jesus','jesus','teachings,teachings-tags,teachings-series',3,296,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7235,'2012-07-24 11:15:55','jesus','jesus','teachings,teachings-tags,teachings-series',4,296,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7236,'2012-07-24 11:16:31','jesus','jesus','teachings,teachings-tags,teachings-series',5,296,'3hs0pq2lgnl65t04hh3frs39c2'),
	(7237,'2012-07-24 11:45:09','rapture','rapture','teachings,teachings-tags,teachings-series',1,12,'if1cb2cjrr114qceqmdnf5fg30'),
	(7238,'2012-07-24 11:45:23','moses','moses','teachings,teachings-tags,teachings-series',1,7,'if1cb2cjrr114qceqmdnf5fg30'),
	(7239,'2012-07-24 11:45:55','mat rudisil','mat rudisil','teachings,teachings-tags,teachings-series',1,0,'if1cb2cjrr114qceqmdnf5fg30'),
	(7240,'2012-07-24 11:46:03','mat','mat','teachings,teachings-tags,teachings-series',1,125,'if1cb2cjrr114qceqmdnf5fg30'),
	(7241,'2012-07-24 11:46:14','mat r','mat r','teachings,teachings-tags,teachings-series',1,125,'if1cb2cjrr114qceqmdnf5fg30'),
	(7242,'2012-07-24 11:46:25','brett me','brett me','teachings,teachings-tags,teachings-series',1,185,'if1cb2cjrr114qceqmdnf5fg30'),
	(7243,'2012-07-24 12:12:13','Revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7244,'2012-07-24 12:12:25','Revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7245,'2012-07-24 12:12:33','Revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7246,'2012-07-24 12:13:22','last words from the cross','last words from the cross','teachings,teachings-tags,teachings-series',1,1,'91l3thjpdbgdl23ci6jgnfdud3'),
	(7247,'2012-07-24 12:13:48','Revelation 10','revelation 10','teachings,teachings-tags,teachings-series',1,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7248,'2012-07-24 12:13:58','Revelation 10','revelation 10','teachings,teachings-tags,teachings-series',2,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7249,'2012-07-24 12:14:06','Revelation 10','revelation 10','teachings,teachings-tags,teachings-series',3,86,'m8266oaq3feamapmpvd7sq9p34'),
	(7250,'2012-07-24 12:19:25','words from the cross','words from the cross','teachings,teachings-tags,teachings-series',1,1,'o4gkehupvljoqbnl93pnts1d62'),
	(7251,'2012-07-24 13:35:42','Shasta','shasta','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'6ckkp7tau9mgr3hbdrl5lmpni5'),
	(7252,'2012-07-24 13:53:31','HEAVEN','heaven','teachings,teachings-tags,teachings-series',1,25,'8c5k2pfjin533n19d4r56gkv10'),
	(7253,'2012-07-24 15:44:39','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'ioo5r3q0bg9t6c5rv1ooj969i0'),
	(7254,'2012-07-24 15:57:10','blaspheme','blaspheme','teachings,teachings-tags,teachings-series',1,0,'je4l35m6aknvc6er9s5mi49cg4'),
	(7255,'2012-07-24 16:33:33','genisis','genisis','teachings,teachings-tags,teachings-series',1,0,'1pl9tq2oaqfbp35r8b8h2su2t1'),
	(7256,'2012-07-24 16:33:43','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'1pl9tq2oaqfbp35r8b8h2su2t1'),
	(7257,'2012-07-24 16:33:56','genesis','genesis','teachings-series',1,0,'1pl9tq2oaqfbp35r8b8h2su2t1'),
	(7258,'2012-07-24 16:34:04','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,63,'1pl9tq2oaqfbp35r8b8h2su2t1'),
	(7259,'2012-07-24 16:42:41','Guest','guest','teachings-tags',1,0,'q0lddajtrr3ad5s1sfivbvnho6'),
	(7260,'2012-07-24 16:43:13','Seth','seth','teachings-tags',1,0,'q0lddajtrr3ad5s1sfivbvnho6'),
	(7261,'2012-07-24 17:09:28','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7262,'2012-07-24 17:10:31','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7263,'2012-07-24 17:10:52','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7264,'2012-07-24 17:11:22','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7265,'2012-07-24 17:18:39','revelation','revelation','downloads',1,0,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7266,'2012-07-24 17:47:21','John','john','teachings,teachings-tags,teachings-series',1,97,'inr8bbfg2fo8qejp9kgkj577p0'),
	(7267,'2012-07-24 18:33:36','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'vln3h2noaj5d7iaiaa58p2cuj5'),
	(7268,'2012-07-24 20:20:08','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7269,'2012-07-24 20:28:50','videos of messages','videos of messages','teachings,teachings-tags,teachings-series',1,0,'pchk9ivstpoavqejl5avoph4o4'),
	(7270,'2012-07-24 21:32:34','ezra','ezra','teachings,teachings-tags,teachings-series',1,10,'iuuv0htibufmddhhgjqu33tpp1'),
	(7271,'2012-07-24 21:51:06','daniel','daniel','teachings,teachings-tags,teachings-series',1,30,'97ahrql21opg6laagrpsmqdtn2'),
	(7272,'2012-07-25 06:59:30','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7273,'2012-07-25 08:44:31','mark','mark','teachings,teachings-tags,teachings-series',1,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7274,'2012-07-25 08:44:41','mark','mark','teachings,teachings-tags,teachings-series',2,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7275,'2012-07-25 08:44:47','mark','mark','teachings,teachings-tags,teachings-series',5,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7276,'2012-07-25 08:44:55','mark','mark','teachings,teachings-tags,teachings-series',1,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7277,'2012-07-25 08:45:46','mark','mark','teachings,teachings-tags,teachings-series',3,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7278,'2012-07-25 08:45:59','mark','mark','teachings,teachings-tags,teachings-series',4,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7279,'2012-07-25 09:30:36','s1-587','s1-587','teachings,teachings-tags,teachings-series',1,1,'m8muvonk3ll2kkn29spig9oup2'),
	(7280,'2012-07-25 10:06:09','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,20,'d75q7crk8h8gjecvkt6g12n0n6'),
	(7281,'2012-07-25 10:43:04','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,38,'8r3vlm751m0i9pbgehf5v304j5'),
	(7282,'2012-07-25 13:06:12','family camp','family camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'k7s1f192ffqsti355pmlv4m464'),
	(7283,'2012-07-25 13:07:02','san juan island','san juan island','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k7s1f192ffqsti355pmlv4m464'),
	(7284,'2012-07-25 13:07:10','san juan','san juan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k7s1f192ffqsti355pmlv4m464'),
	(7285,'2012-07-25 13:07:16','camping','camping','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'k7s1f192ffqsti355pmlv4m464'),
	(7286,'2012-07-25 13:07:26','camping','camping','events-recurring',1,0,'k7s1f192ffqsti355pmlv4m464'),
	(7287,'2012-07-25 13:07:31','camping','camping','events',1,1,'k7s1f192ffqsti355pmlv4m464'),
	(7288,'2012-07-25 13:46:42','Joshua','joshua','teachings,teachings-tags,teachings-series',1,25,'p4apvjs7pd4quhr702m7ebauu1'),
	(7289,'2012-07-25 13:47:06','Joshua','joshua','teachings,teachings-tags,teachings-series',2,25,'p4apvjs7pd4quhr702m7ebauu1'),
	(7290,'2012-07-25 13:47:16','Joshua','joshua','teachings,teachings-tags,teachings-series',1,25,'p4apvjs7pd4quhr702m7ebauu1'),
	(7291,'2012-07-25 13:47:30','Joshua','joshua','teachings,teachings-tags,teachings-series',3,25,'p4apvjs7pd4quhr702m7ebauu1'),
	(7292,'2012-07-25 18:03:06','wiffles and waffles','wiffles and waffles','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vb9r1ufd4mmsrqlmhln3jm4up4'),
	(7293,'2012-07-25 18:40:24','Property','property','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'9cgju59t7o4k7knesalth83m22'),
	(7294,'2012-07-25 19:49:16','titus','titus','teachings,teachings-tags,teachings-series',1,9,'si4e57osuld4d11i8p61q9f9m4'),
	(7295,'2012-07-25 20:27:52','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7296,'2012-07-25 20:29:50','revelation','revelation','teachings,teachings-tags,teachings-series',4,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7297,'2012-07-25 20:30:31','revelation','revelation','teachings,teachings-tags,teachings-series',5,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7298,'2012-07-25 20:30:57','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7299,'2012-07-25 22:23:03','romans 13','romans 13','teachings,teachings-tags,teachings-series',1,65,'iuuv0htibufmddhhgjqu33tpp1'),
	(7300,'2012-07-25 22:23:15','romans 13','romans 13','teachings,teachings-tags,teachings-series',4,65,'iuuv0htibufmddhhgjqu33tpp1'),
	(7301,'2012-07-25 22:23:29','romans 13','romans 13','teachings,teachings-tags,teachings-series',3,65,'iuuv0htibufmddhhgjqu33tpp1'),
	(7302,'2012-07-25 22:23:45','romans 13','romans 13','teachings,teachings-tags,teachings-series',2,65,'iuuv0htibufmddhhgjqu33tpp1'),
	(7303,'2012-07-26 00:57:30','jesus','jesus','teachings,teachings-tags,teachings-series',1,297,'oncn41clbumvevn8kk25g42p37'),
	(7304,'2012-07-26 00:57:57','jesus','jesus','downloads',1,0,'oncn41clbumvevn8kk25g42p37'),
	(7305,'2012-07-26 00:58:07','jesus','jesus','tags',1,0,'oncn41clbumvevn8kk25g42p37'),
	(7306,'2012-07-26 00:58:14','men','men','tags',1,3,'oncn41clbumvevn8kk25g42p37'),
	(7307,'2012-07-26 01:00:46','men','men','text',1,17,'oncn41clbumvevn8kk25g42p37'),
	(7308,'2012-07-26 01:01:10','men','men','events-recurring',1,2,'oncn41clbumvevn8kk25g42p37'),
	(7309,'2012-07-26 01:03:00','men','men','teachings',1,126,'oncn41clbumvevn8kk25g42p37'),
	(7310,'2012-07-26 01:03:04','men','men','teachings',1,126,'oncn41clbumvevn8kk25g42p37'),
	(7311,'2012-07-26 01:03:28','jesus','jesus','events-recurring',1,1,'oncn41clbumvevn8kk25g42p37'),
	(7312,'2012-07-26 04:10:57','si 546','si 546','teachings,teachings-tags,teachings-series',1,4,'tcne5u8unlf303v7bspb4iju02'),
	(7313,'2012-07-26 04:11:22','si 546','si 546','teachings',1,4,'tcne5u8unlf303v7bspb4iju02'),
	(7314,'2012-07-26 08:24:40','mark 1','mark 1','teachings,teachings-tags,teachings-series',1,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7315,'2012-07-26 08:24:58','mark 1','mark 1','teachings,teachings-tags,teachings-series',2,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7316,'2012-07-26 08:25:09','mark 1','mark 1','teachings,teachings-tags,teachings-series',3,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7317,'2012-07-26 08:25:21','mark 1','mark 1','teachings,teachings-tags,teachings-series',4,43,'66i7dsmavbv96qmqk6fmvngtj3'),
	(7318,'2012-07-26 08:59:03','wifflels and waffles','wifflels and waffles','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vb9r1ufd4mmsrqlmhln3jm4up4'),
	(7319,'2012-07-26 08:59:28','wifflels and waffles','wifflels and waffles','events',1,0,'vb9r1ufd4mmsrqlmhln3jm4up4'),
	(7320,'2012-07-26 08:59:44','wifflels and waffles','wifflels and waffles','events-recurring',1,0,'vb9r1ufd4mmsrqlmhln3jm4up4'),
	(7321,'2012-07-26 09:00:09','wifflils and waffles','wifflils and waffles','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vb9r1ufd4mmsrqlmhln3jm4up4'),
	(7322,'2012-07-26 09:05:54','baptism','baptism','teachings,teachings-tags,teachings-series',1,6,'5ebqctgn17psduo3tarolk2330'),
	(7323,'2012-07-26 09:27:01','Song of salamon','song of salamon','teachings,teachings-tags,teachings-series',1,0,'bht0rdivmk7hse647n5imbpsr1'),
	(7324,'2012-07-26 09:27:59','Song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'bht0rdivmk7hse647n5imbpsr1'),
	(7325,'2012-07-26 10:29:56','daniel','daniel','teachings,teachings-tags,teachings-series',1,30,'rebp07ln59gqmkk2jnp3qchm76'),
	(7326,'2012-07-26 11:14:58','leviticus','leviticus','teachings,teachings-tags,teachings-series',1,23,'ju2qpl5kdoijejuo74iloahpt0'),
	(7327,'2012-07-26 11:15:16','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'ju2qpl5kdoijejuo74iloahpt0'),
	(7328,'2012-07-26 13:10:17','sss','sss','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'6mhnk9tu7eqlmbjufjs4bmh8m2'),
	(7329,'2012-07-26 13:38:22','baptism','baptism','teachings,teachings-tags,teachings-series',1,6,'3uqagkeplld661286cioslot23'),
	(7330,'2012-07-26 14:35:50','calvnism','calvnism','teachings-tags',1,0,'5911f7suncagt1c6ramv73qt13'),
	(7331,'2012-07-26 14:35:57','calvinism','calvinism','teachings-tags',1,1,'5911f7suncagt1c6ramv73qt13'),
	(7332,'2012-07-26 14:44:09','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'v9jbqqh1ajocolknutrc38r5r3'),
	(7333,'2012-07-26 14:44:11','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'fog8nq00e72f3na5ra4dj7bsk5'),
	(7334,'2012-07-26 14:44:11','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'6v5b8jjtaf26qqi5v6hg9skpk7'),
	(7335,'2012-07-26 14:44:17','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'v9jbqqh1ajocolknutrc38r5r3'),
	(7336,'2012-07-26 14:44:19','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'jotsm1k9fdv8f2q18vj6hk8mt5'),
	(7337,'2012-07-26 14:44:19','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'u1npvrcqcj59bg4s7h0trq78g6'),
	(7338,'2012-07-26 14:44:25','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'v9jbqqh1ajocolknutrc38r5r3'),
	(7339,'2012-07-26 14:44:27','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'k69qrp53jg0j9a892sara4ppv7'),
	(7340,'2012-07-26 14:44:27','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'tu4f68g5k9823tb8vcpdb0kv03'),
	(7341,'2012-07-26 15:01:59','Prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'osotm77e5ippi9fmlq0v7r8f81'),
	(7342,'2012-07-26 15:03:29','prophesy','prophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'ua3h8ao7q9g0p95g0rtgd5e6n1'),
	(7343,'2012-07-26 15:04:22','Prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'qk5anpgfp2aklc2rn6un0orp11'),
	(7344,'2012-07-26 15:20:47','Prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'qpsth8s97k6p9eu3r5fbh9lgb7'),
	(7345,'2012-07-26 15:21:34','Prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'6c75qdpdq2u7c6ls2suve6sc23'),
	(7346,'2012-07-26 15:22:12','Prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'ls16k4lh7qftt05ke9bee37vr6'),
	(7347,'2012-07-26 15:27:32','Prophecy','prophecy','teachings-tags',1,2,'bgv00sm9qg7t32oplr15eqavr1'),
	(7348,'2012-07-26 15:30:35','M1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'rlodpbscrn8ig3s50kp7v144k1'),
	(7349,'2012-07-26 15:30:54','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'rlodpbscrn8ig3s50kp7v144k1'),
	(7350,'2012-07-26 15:31:18','m1-567','m1-567','teachings,teachings-tags,teachings-series',1,1,'rlodpbscrn8ig3s50kp7v144k1'),
	(7351,'2012-07-26 15:31:22','m1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'rlodpbscrn8ig3s50kp7v144k1'),
	(7352,'2012-07-26 15:33:06','m1-566','m1-566','teachings,teachings-tags,teachings-series',1,1,'rlodpbscrn8ig3s50kp7v144k1'),
	(7353,'2012-07-26 15:33:40','m1-566','m1-566','downloads',1,0,'rlodpbscrn8ig3s50kp7v144k1'),
	(7354,'2012-07-26 15:34:00','m1-569','m1-569','downloads',1,0,'rlodpbscrn8ig3s50kp7v144k1'),
	(7355,'2012-07-26 15:34:18','m1-567','m1-567','downloads',1,0,'rlodpbscrn8ig3s50kp7v144k1'),
	(7356,'2012-07-26 16:23:02','Tad','tad','teachings,teachings-tags,teachings-series',1,9,'r36mg6c1nepii2iq37b46gfos5'),
	(7357,'2012-07-26 16:23:45','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'v9jbqqh1ajocolknutrc38r5r3'),
	(7358,'2012-07-26 16:58:10','dougbt','dougbt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'n96vtnpdln7i0aqfb42eopipr2'),
	(7359,'2012-07-26 16:58:33','doubt','doubt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'n96vtnpdln7i0aqfb42eopipr2'),
	(7360,'2012-07-26 16:59:11','doubt','doubt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'n96vtnpdln7i0aqfb42eopipr2'),
	(7361,'2012-07-26 17:00:09','unbelief','unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'n96vtnpdln7i0aqfb42eopipr2'),
	(7362,'2012-07-26 17:01:55','unbelief','unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'n96vtnpdln7i0aqfb42eopipr2'),
	(7363,'2012-07-26 17:01:58','doubt','doubt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'n96vtnpdln7i0aqfb42eopipr2'),
	(7364,'2012-07-26 17:02:01','dougbt','dougbt','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'n96vtnpdln7i0aqfb42eopipr2'),
	(7365,'2012-07-26 17:21:55','Tad','tad','teachings,teachings-tags,teachings-series',1,9,'r36mg6c1nepii2iq37b46gfos5'),
	(7366,'2012-07-26 19:43:46','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,38,'8r3vlm751m0i9pbgehf5v304j5'),
	(7367,'2012-07-26 21:22:45','Passover','passover','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'8nghl733odgktvo8624h3245i1'),
	(7368,'2012-07-26 21:22:57','Communion','communion','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'8nghl733odgktvo8624h3245i1'),
	(7369,'2012-07-26 21:23:52','Communion','communion','teachings',1,3,'8nghl733odgktvo8624h3245i1'),
	(7370,'2012-07-26 23:08:59','Ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'n8gjfp0dus1lbina7ut2rg16g1'),
	(7371,'2012-07-26 23:10:56','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'n8gjfp0dus1lbina7ut2rg16g1'),
	(7372,'2012-07-26 23:11:09','ephesians','ephesians','teachings,teachings-tags,teachings-series',2,36,'n8gjfp0dus1lbina7ut2rg16g1'),
	(7373,'2012-07-26 23:11:28','ephesians','ephesians','teachings,teachings-tags,teachings-series',3,36,'n8gjfp0dus1lbina7ut2rg16g1'),
	(7374,'2012-07-26 23:14:10','motocross','motocross','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'vh3vnnk3gr9ksg4tpdu94esc44'),
	(7375,'2012-07-26 23:14:25','motocross','motocross','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'vh3vnnk3gr9ksg4tpdu94esc44'),
	(7376,'2012-07-26 23:23:27','Song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'bht0rdivmk7hse647n5imbpsr1'),
	(7377,'2012-07-26 23:55:45','High school','high school','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'24v97lsq031r0lbr62a8hgmb82'),
	(7378,'2012-07-27 00:05:33','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'arvpcfpiskkm33ubsma44ggis0'),
	(7379,'2012-07-27 10:27:28','Song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'bht0rdivmk7hse647n5imbpsr1'),
	(7380,'2012-07-27 11:36:20','Tad','tad','teachings,teachings-tags,teachings-series',1,9,'r36mg6c1nepii2iq37b46gfos5'),
	(7381,'2012-07-27 13:04:41','Tad','tad','teachings,teachings-tags,teachings-series',1,9,'r36mg6c1nepii2iq37b46gfos5'),
	(7382,'2012-07-27 13:23:37','tempted','tempted','teachings-tags',1,1,'t9uk5k92tl3lq9kl5qusoja487'),
	(7383,'2012-07-27 13:27:22','Retreat','retreat','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'cgs5aurqmfko66ihofnq2j10r7'),
	(7384,'2012-07-27 13:28:13','Pictures','pictures','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'cgs5aurqmfko66ihofnq2j10r7'),
	(7385,'2012-07-27 13:28:50','Family camp','family camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'cgs5aurqmfko66ihofnq2j10r7'),
	(7386,'2012-07-27 14:00:21','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'7evicb493847efq4lhd5p8q385'),
	(7387,'2012-07-27 15:02:56','john','john','teachings,teachings-tags,teachings-series',1,97,'8ka9scouqq2tc04icu2dllljo4'),
	(7388,'2012-07-27 15:03:45','john','john','teachings,teachings-tags,teachings-series',2,97,'8ka9scouqq2tc04icu2dllljo4'),
	(7389,'2012-07-27 15:04:02','john','john','teachings,teachings-tags,teachings-series',1,97,'8ka9scouqq2tc04icu2dllljo4'),
	(7390,'2012-07-27 16:18:52','podcasts on acts','podcasts on acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m3eb22ig58q49ekb9rosld45t3'),
	(7391,'2012-07-27 16:19:13','podcasts','podcasts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m3eb22ig58q49ekb9rosld45t3'),
	(7392,'2012-07-27 16:19:43','podcasts','podcasts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m3eb22ig58q49ekb9rosld45t3'),
	(7393,'2012-07-27 16:20:04','podcasts','podcasts','downloads',1,0,'m3eb22ig58q49ekb9rosld45t3'),
	(7394,'2012-07-27 16:20:37','podcasts','podcasts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m3eb22ig58q49ekb9rosld45t3'),
	(7395,'2012-07-27 16:20:40','podcasts on acts','podcasts on acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m3eb22ig58q49ekb9rosld45t3'),
	(7396,'2012-07-27 16:34:18','can you hear me now','can you hear me now','teachings,teachings-tags,teachings-series',1,1,'vlcv83lgki71271015erm6edi2'),
	(7397,'2012-07-27 18:53:19','Tad','tad','teachings,teachings-tags,teachings-series',1,9,'r36mg6c1nepii2iq37b46gfos5'),
	(7398,'2012-07-27 21:13:37','head covering','head covering','teachings,teachings-tags,teachings-series',1,1,'okohor1kssdc2dl3e0c7g2h374'),
	(7399,'2012-07-27 21:36:02','head coverings','head coverings','teachings,teachings-tags,teachings-series',1,0,'ncu26554chq1pf0nttvav6i8d1'),
	(7400,'2012-07-27 21:36:24','head covering','head covering','teachings,teachings-tags,teachings-series',1,1,'ncu26554chq1pf0nttvav6i8d1'),
	(7401,'2012-07-27 22:16:41','titus','titus','teachings,teachings-tags,teachings-series',1,10,'7bb4fun97917dh57nj8e4c8l35'),
	(7402,'2012-07-27 22:16:51','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'7bb4fun97917dh57nj8e4c8l35'),
	(7403,'2012-07-27 22:17:33','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,13,'7bb4fun97917dh57nj8e4c8l35'),
	(7404,'2012-07-27 22:18:17','titus','titus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'7bb4fun97917dh57nj8e4c8l35'),
	(7405,'2012-07-28 00:43:58','marriage','marriage','teachings,teachings-tags,teachings-series',1,11,'pk7l7u8lia84f06euvqg9but71'),
	(7406,'2012-07-28 07:37:53','luke 16','luke 16','teachings,teachings-tags,teachings-series',1,59,'a29ejp81l19nqa79i7speo9260'),
	(7407,'2012-07-28 07:38:10','luke 16','luke 16','teachings,teachings-tags,teachings-series',2,59,'a29ejp81l19nqa79i7speo9260'),
	(7408,'2012-07-28 07:38:29','luke 16','luke 16','teachings,teachings-tags,teachings-series',3,59,'a29ejp81l19nqa79i7speo9260'),
	(7409,'2012-07-28 07:58:36','philemon','philemon','teachings,teachings-tags,teachings-series',1,4,'911rjf43nsr33m7uovlo5nj8h1'),
	(7410,'2012-07-28 08:32:57','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'b54ubs6tqehkh49d1env487g62'),
	(7411,'2012-07-28 08:34:44','hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'b54ubs6tqehkh49d1env487g62'),
	(7412,'2012-07-28 08:41:12','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'b54ubs6tqehkh49d1env487g62'),
	(7413,'2012-07-28 08:42:07','hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'b54ubs6tqehkh49d1env487g62'),
	(7414,'2012-07-28 08:49:15','hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'b54ubs6tqehkh49d1env487g62'),
	(7415,'2012-07-28 08:52:56','hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'b54ubs6tqehkh49d1env487g62'),
	(7416,'2012-07-28 08:54:01','Romans','romans','teachings,teachings-tags,teachings-series',1,65,'b54ubs6tqehkh49d1env487g62'),
	(7417,'2012-07-28 15:47:10','Philemon','philemon','teachings,teachings-tags,teachings-series',1,4,'i6t26rm69gucrtk94caukb52o2'),
	(7418,'2012-07-28 16:09:49','temptation','temptation','teachings-tags',1,1,'t9uk5k92tl3lq9kl5qusoja487'),
	(7419,'2012-07-28 16:27:26','Philemon','philemon','teachings,teachings-tags,teachings-series',1,4,'i6t26rm69gucrtk94caukb52o2'),
	(7420,'2012-07-29 00:34:37','dating','dating','teachings,teachings-tags,teachings-series',1,2,'n4od0og8beugkm648ltb5e7te2'),
	(7421,'2012-07-29 00:36:01','april 2011','april 2011','teachings,teachings-tags,teachings-series',1,0,'n4od0og8beugkm648ltb5e7te2'),
	(7422,'2012-07-29 00:36:12','april 2011','april 2011','teachings',1,0,'n4od0og8beugkm648ltb5e7te2'),
	(7423,'2012-07-29 00:36:18','april 2011','april 2011','teachings',1,0,'n4od0og8beugkm648ltb5e7te2'),
	(7424,'2012-07-29 00:36:25','april 2011','april 2011','teachings-tags',1,0,'n4od0og8beugkm648ltb5e7te2'),
	(7425,'2012-07-29 00:36:38','april 2011','april 2011','teachings',1,0,'n4od0og8beugkm648ltb5e7te2'),
	(7426,'2012-07-29 02:29:08','mattew','mattew','teachings,teachings-tags,teachings-series',1,0,'sjjacnupdoljmgtnvi06oi0dg1'),
	(7427,'2012-07-29 05:03:27','Nehemiah','nehemiah','teachings,teachings-tags,teachings-series',1,10,'bb0tshrhoeo0dl4pmm08dfd9f5'),
	(7428,'2012-07-29 08:21:30','livestreaming of July 29 service','livestreaming of july 29 service','teachings,teachings-tags,teachings-series',1,0,'nu62dmhgqa9eutpn1e0ahiu084'),
	(7429,'2012-07-29 08:37:08','livestreaming of July 29 service','livestreaming of july 29 service','teachings,teachings-tags,teachings-series',1,0,'nu62dmhgqa9eutpn1e0ahiu084'),
	(7430,'2012-07-29 08:43:12','live stream','live stream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'a29ejp81l19nqa79i7speo9260'),
	(7431,'2012-07-29 10:16:18','ebrews 2','ebrews 2','teachings,teachings-tags,teachings-series',1,18,'r3b4nceo818u0fsj4nvp0p9pj7'),
	(7432,'2012-07-29 10:16:27','hebrews 2','hebrews 2','teachings,teachings-tags,teachings-series',1,18,'r3b4nceo818u0fsj4nvp0p9pj7'),
	(7433,'2012-07-29 10:17:18','hebrews 2','hebrews 2','teachings,teachings-tags,teachings-series',1,18,'r3b4nceo818u0fsj4nvp0p9pj7'),
	(7434,'2012-07-29 10:17:33','hebrews 2','hebrews 2','teachings',1,18,'r3b4nceo818u0fsj4nvp0p9pj7'),
	(7435,'2012-07-29 12:22:55','ezekiel','ezekiel','teachings,teachings-tags,teachings-series',1,36,'oneag478oqpligteg79ei9k172'),
	(7436,'2012-07-29 12:23:44','ezekiel','ezekiel','teachings,teachings-tags,teachings-series',1,36,'oneag478oqpligteg79ei9k172'),
	(7437,'2012-07-29 12:23:51','ezekiel 38','ezekiel 38','teachings,teachings-tags,teachings-series',1,36,'oneag478oqpligteg79ei9k172'),
	(7438,'2012-07-29 12:24:02','ezekiel 38','ezekiel 38','teachings,teachings-tags,teachings-series',2,36,'oneag478oqpligteg79ei9k172'),
	(7439,'2012-07-29 12:24:16','ezekiel 38','ezekiel 38','teachings,teachings-tags,teachings-series',3,36,'oneag478oqpligteg79ei9k172'),
	(7440,'2012-07-29 12:40:07','salvation','salvation','teachings,teachings-tags,teachings-series',1,26,'oneag478oqpligteg79ei9k172'),
	(7441,'2012-07-29 12:41:36','salvation','salvation','teachings,teachings-tags,teachings-series',2,26,'oneag478oqpligteg79ei9k172'),
	(7442,'2012-07-29 12:41:43','salvation','salvation','teachings,teachings-tags,teachings-series',3,26,'oneag478oqpligteg79ei9k172'),
	(7443,'2012-07-29 12:41:46','salvation','salvation','teachings,teachings-tags,teachings-series',2,26,'oneag478oqpligteg79ei9k172'),
	(7444,'2012-07-29 12:42:34','salvation','salvation','teachings,teachings-tags,teachings-series',3,26,'oneag478oqpligteg79ei9k172'),
	(7445,'2012-07-29 12:43:13','salvation','salvation','teachings,teachings-tags,teachings-series',1,26,'oneag478oqpligteg79ei9k172'),
	(7446,'2012-07-29 12:43:48','salvation','salvation','teachings,teachings-tags,teachings-series',2,26,'oneag478oqpligteg79ei9k172'),
	(7447,'2012-07-29 12:44:12','salvation','salvation','teachings,teachings-tags,teachings-series',1,26,'oneag478oqpligteg79ei9k172'),
	(7448,'2012-07-29 12:45:46','salvation','salvation','teachings,teachings-tags,teachings-series',1,26,'oneag478oqpligteg79ei9k172'),
	(7449,'2012-07-29 13:21:38','Song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'bht0rdivmk7hse647n5imbpsr1'),
	(7450,'2012-07-29 13:34:49','matt sievers','matt sievers','teachings,teachings-tags,teachings-series',1,0,'qjgmqghrvaoo0m4bp6q1uj9kk4'),
	(7451,'2012-07-29 13:35:04','matt seivers','matt seivers','teachings,teachings-tags,teachings-series',1,0,'qjgmqghrvaoo0m4bp6q1uj9kk4'),
	(7452,'2012-07-29 13:55:39','jesus','jesus','teachings,teachings-tags,teachings-series',1,298,'qf533p5fbsj60mk3ua4705mpq6'),
	(7453,'2012-07-29 13:56:02','jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,320,'qf533p5fbsj60mk3ua4705mpq6'),
	(7454,'2012-07-29 14:36:13','calvanist','calvanist','teachings,teachings-tags,teachings-series',1,0,'hk0uokc9vjmae1hgvu2n6oj5m4'),
	(7455,'2012-07-29 14:36:18','armenian','armenian','teachings,teachings-tags,teachings-series',1,0,'hk0uokc9vjmae1hgvu2n6oj5m4'),
	(7456,'2012-07-29 14:36:38','end of times','end of times','teachings,teachings-tags,teachings-series',1,24,'hk0uokc9vjmae1hgvu2n6oj5m4'),
	(7457,'2012-07-29 14:45:28','revalations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'0qttekicq19ko449h91ocbrv83'),
	(7458,'2012-07-29 14:45:36','revalation','revalation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0qttekicq19ko449h91ocbrv83'),
	(7459,'2012-07-29 14:45:40','revalations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'0qttekicq19ko449h91ocbrv83'),
	(7460,'2012-07-29 14:46:07','revalations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'0qttekicq19ko449h91ocbrv83'),
	(7461,'2012-07-29 15:10:47','titus','titus','teachings,teachings-tags,teachings-series',1,10,'pm2qhetg9k170j44ftlrpbjef1'),
	(7462,'2012-07-29 15:37:01','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'6aop86ts7clt4d8smc35h3hh27'),
	(7463,'2012-07-29 16:09:31','Prophecy 2011','prophecy 2011','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7464,'2012-07-29 17:00:31','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7465,'2012-07-29 17:01:04','revelation','revelation','teachings,teachings-tags,teachings-series',2,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7466,'2012-07-29 17:01:30','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7467,'2012-07-29 20:23:15','damascus','damascus','teachings,teachings-tags,teachings-series',1,4,'rusmhhm5llvrrb1tepnpj35uh5'),
	(7468,'2012-07-29 21:04:46','Camp Yamhill Release Form','camp yamhill release form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0qttekicq19ko449h91ocbrv83'),
	(7469,'2012-07-29 21:45:21','athey','athey','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,102,'76ide529ioqlmkon6lgboefgd0'),
	(7470,'2012-07-29 22:55:50','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'pl6mtb29qsfjka87ne65igoe71'),
	(7471,'2012-07-29 22:56:03','titus','titus','teachings,teachings-tags,teachings-series',1,10,'pl6mtb29qsfjka87ne65igoe71'),
	(7472,'2012-07-29 22:56:55','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'pl6mtb29qsfjka87ne65igoe71'),
	(7473,'2012-07-29 23:13:15','Song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'bht0rdivmk7hse647n5imbpsr1'),
	(7474,'2012-07-29 23:14:11','Isaiah','isaiah','teachings,teachings-tags,teachings-series',1,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7475,'2012-07-29 23:51:49','SISSON','sisson','teachings,teachings-tags,teachings-series',1,0,'f4jcprm514pbudbdm4cipi3gq2'),
	(7476,'2012-07-29 23:51:58','SCOLLAN-4/2-5/11','scollan-4/2-5/11','teachings,teachings-tags,teachings-series',1,0,'f4jcprm514pbudbdm4cipi3gq2'),
	(7477,'2012-07-29 23:52:07','SCOLLAN','scollan','teachings,teachings-tags,teachings-series',1,0,'f4jcprm514pbudbdm4cipi3gq2'),
	(7478,'2012-07-30 01:04:18','Acts 1','acts 1','teachings,teachings-tags,teachings-series',1,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7479,'2012-07-30 01:31:44','Acts 1:','acts 1:','teachings,teachings-tags,teachings-series',1,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7480,'2012-07-30 01:37:59','Acts 1: 1-3','acts 1: 1-3','teachings,teachings-tags,teachings-series',1,3,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7481,'2012-07-30 02:41:58','Acts 1:','acts 1:','teachings,teachings-tags,teachings-series',1,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7482,'2012-07-30 02:42:04','Acts 1:','acts 1:','teachings,teachings-tags,teachings-series',9,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7483,'2012-07-30 04:01:35','Acts 2\"','acts 2\"','teachings,teachings-tags,teachings-series',1,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7484,'2012-07-30 04:01:40','Acts 2\"','acts 2\"','teachings,teachings-tags,teachings-series',9,89,'3s4n1deqtpgq02u8omgisdf2v5'),
	(7485,'2012-07-30 05:54:25','revalations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'0qttekicq19ko449h91ocbrv83'),
	(7486,'2012-07-30 05:54:37','revalation 8','revalation 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0qttekicq19ko449h91ocbrv83'),
	(7487,'2012-07-30 05:54:44','revalations','Revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'0qttekicq19ko449h91ocbrv83'),
	(7488,'2012-07-30 05:55:03','revelation 8','revelation 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,86,'0qttekicq19ko449h91ocbrv83'),
	(7489,'2012-07-30 05:55:21','revelation 8','revelation 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,86,'0qttekicq19ko449h91ocbrv83'),
	(7490,'2012-07-30 05:56:01','r-017','r-017','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0qttekicq19ko449h91ocbrv83'),
	(7491,'2012-07-30 05:56:20','r-018','r-018','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0qttekicq19ko449h91ocbrv83'),
	(7492,'2012-07-30 05:56:34','r-020','r-020','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0qttekicq19ko449h91ocbrv83'),
	(7493,'2012-07-30 05:56:49','r-021','r-021','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0qttekicq19ko449h91ocbrv83'),
	(7494,'2012-07-30 06:35:26','Revelation Study','revelation study','teachings,teachings-tags,teachings-series',1,63,'o7bs4pnjm7kjn86vt86qmqa110'),
	(7495,'2012-07-30 06:36:16','Revelation Study','revelation study','teachings,teachings-tags,teachings-series',1,63,'o7bs4pnjm7kjn86vt86qmqa110'),
	(7496,'2012-07-30 06:37:00','Revelation Study','revelation study','teachings,teachings-tags,teachings-series',1,63,'o7bs4pnjm7kjn86vt86qmqa110'),
	(7497,'2012-07-30 06:37:15','Revelation Study','revelation study','teachings,teachings-tags,teachings-series',2,63,'o7bs4pnjm7kjn86vt86qmqa110'),
	(7498,'2012-07-30 06:37:33','Revelation Study','revelation study','teachings,teachings-tags,teachings-series',3,63,'o7bs4pnjm7kjn86vt86qmqa110'),
	(7499,'2012-07-30 08:27:26','TAD','tad','teachings,teachings-tags,teachings-series',1,9,'unil00g24p5pgdv6n4uthheu51'),
	(7500,'2012-07-30 08:57:51','Isaiah','isaiah','teachings,teachings-tags,teachings-series',1,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7501,'2012-07-30 08:58:09','Isaiah ch1','isaiah ch1','teachings,teachings-tags,teachings-series',1,0,'bht0rdivmk7hse647n5imbpsr1'),
	(7502,'2012-07-30 08:58:19','Isaiah','isaiah','teachings,teachings-tags,teachings-series',2,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7503,'2012-07-30 08:58:45','Isaiah','isaiah','teachings,teachings-tags,teachings-series',3,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7504,'2012-07-30 08:59:06','Isaiah','isaiah','teachings,teachings-tags,teachings-series',4,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7505,'2012-07-30 08:59:27','Isaiah','isaiah','teachings,teachings-tags,teachings-series',5,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7506,'2012-07-30 08:59:47','Isaiah','isaiah','teachings,teachings-tags,teachings-series',7,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7507,'2012-07-30 08:59:58','Isaiah','isaiah','teachings,teachings-tags,teachings-series',6,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7508,'2012-07-30 09:22:46','revelation','revelation','teachings,teachings-tags,teachings-series',3,86,'pr2c8u253b1ahsnmmqq272o2n3'),
	(7509,'2012-07-30 11:44:52','Chick-fil-a','chick-fil-a','teachings,teachings-tags,teachings-series',1,0,'khim65do8greoqde2b6duqle77'),
	(7510,'2012-07-30 11:45:26','Chick','chick','teachings,teachings-tags,teachings-series',1,1,'khim65do8greoqde2b6duqle77'),
	(7511,'2012-07-30 11:46:16','gay marriage','gay marriage','teachings,teachings-tags,teachings-series',1,1,'khim65do8greoqde2b6duqle77'),
	(7512,'2012-07-30 11:49:47','sundays','sundays','teachings,teachings-tags,teachings-series',1,0,'7egc03d1gp01ieogo7tg7nn055'),
	(7513,'2012-07-30 11:50:11','sundays','sundays','teachings',1,0,'7egc03d1gp01ieogo7tg7nn055'),
	(7514,'2012-07-30 11:50:26','sundays','sundays','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'7egc03d1gp01ieogo7tg7nn055'),
	(7515,'2012-07-30 11:58:52','grade school','grade school','teachings,teachings-tags,teachings-series',1,0,'o9srsbv19596uc0g034sd8fel6'),
	(7516,'2012-07-30 12:00:01','grade school','grade school','events-recurring',1,1,'o9srsbv19596uc0g034sd8fel6'),
	(7517,'2012-07-30 16:04:36','II Kings 6','ii kings 6','teachings,teachings-tags,teachings-series',1,51,'bh55fsbum15neei83ka87l5et2'),
	(7518,'2012-07-30 16:04:54','II Kings 6','ii kings 6','teachings',1,51,'bh55fsbum15neei83ka87l5et2'),
	(7519,'2012-07-30 16:05:04','II Kings 6','ii kings 6','teachings',3,51,'bh55fsbum15neei83ka87l5et2'),
	(7520,'2012-07-30 16:05:11','II Kings 6','ii kings 6','teachings',2,51,'bh55fsbum15neei83ka87l5et2'),
	(7521,'2012-07-30 16:05:21','II Kings 6','ii kings 6','teachings',3,51,'bh55fsbum15neei83ka87l5et2'),
	(7522,'2012-07-30 16:05:27','II Kings 6','ii kings 6','teachings',2,51,'bh55fsbum15neei83ka87l5et2'),
	(7523,'2012-07-30 18:35:21','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'6aop86ts7clt4d8smc35h3hh27'),
	(7524,'2012-07-30 19:06:06','II Kings 6','ii kings 6','teachings,teachings-tags,teachings-series',1,51,'bh55fsbum15neei83ka87l5et2'),
	(7525,'2012-07-30 19:06:17','II Kings 6','ii kings 6','teachings,teachings-tags,teachings-series',2,51,'bh55fsbum15neei83ka87l5et2'),
	(7526,'2012-07-30 19:06:37','II Kings 6','ii kings 6','teachings,teachings-tags,teachings-series',3,51,'bh55fsbum15neei83ka87l5et2'),
	(7527,'2012-07-30 19:06:44','II Kings 6','ii kings 6','teachings,teachings-tags,teachings-series',2,51,'bh55fsbum15neei83ka87l5et2'),
	(7528,'2012-07-30 20:41:21','brett','brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,190,'pl6mtb29qsfjka87ne65igoe71'),
	(7529,'2012-07-30 20:52:52','matthew','matthew','teachings,teachings-tags,teachings-series',1,83,'570hdmsodhnq7d76239rtc9q32'),
	(7530,'2012-07-30 20:53:13','matthew','matthew','teachings-series',1,0,'570hdmsodhnq7d76239rtc9q32'),
	(7531,'2012-07-30 20:53:18','matthew','matthew','teachings,teachings-tags,teachings-series',1,83,'570hdmsodhnq7d76239rtc9q32'),
	(7532,'2012-07-30 20:53:29','matthew','matthew','downloads',1,0,'570hdmsodhnq7d76239rtc9q32'),
	(7533,'2012-07-30 20:53:38','mark','mark','downloads',1,0,'570hdmsodhnq7d76239rtc9q32'),
	(7534,'2012-07-30 20:53:48','mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'570hdmsodhnq7d76239rtc9q32'),
	(7535,'2012-07-30 20:54:07','mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'570hdmsodhnq7d76239rtc9q32'),
	(7536,'2012-07-30 20:55:56','mark','mark','teachings-series',1,0,'570hdmsodhnq7d76239rtc9q32'),
	(7537,'2012-07-30 21:30:41','junior high camp','junior high camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ed60cq970n9ucca7lteqj85bv2'),
	(7538,'2012-07-30 22:09:46','deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',1,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7539,'2012-07-30 22:10:10','deuteronomy 17','deuteronomy 17','teachings,teachings-tags,teachings-series',1,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7540,'2012-07-30 22:11:20','deuteronomy 17','deuteronomy 17','teachings,teachings-tags,teachings-series',2,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7541,'2012-07-30 22:11:28','deuteronomy 17','deuteronomy 17','teachings,teachings-tags,teachings-series',3,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7542,'2012-07-30 22:11:56','deuteronomy 17','deuteronomy 17','teachings,teachings-tags,teachings-series',3,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7543,'2012-07-30 22:12:08','deuteronomy 17','deuteronomy 17','teachings,teachings-tags,teachings-series',4,35,'n1f6qrkgs8k8t77odfa891fci5'),
	(7544,'2012-07-31 01:22:39','maturity','maturity','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'pl6mtb29qsfjka87ne65igoe71'),
	(7545,'2012-07-31 01:23:14','animals','animals','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pl6mtb29qsfjka87ne65igoe71'),
	(7546,'2012-07-31 01:23:22','Babtism','babtism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pl6mtb29qsfjka87ne65igoe71'),
	(7547,'2012-07-31 01:23:27','p','p','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pl6mtb29qsfjka87ne65igoe71'),
	(7548,'2012-07-31 01:23:34','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'pl6mtb29qsfjka87ne65igoe71'),
	(7549,'2012-07-31 01:24:11','youth','youth','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'pl6mtb29qsfjka87ne65igoe71'),
	(7550,'2012-07-31 01:48:13','marriage','marriage','teachings,teachings-tags,teachings-series',1,11,'jab3r2em4qv90fie0mk444sos2'),
	(7551,'2012-07-31 05:22:24','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3978,'q7knbfg21vmv2l4l1rqopfba22'),
	(7552,'2012-07-31 05:59:03','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3978,'orfs4tdi2r0nrg40dq3djqslk4'),
	(7553,'2012-07-31 06:47:53','Timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'qr3pof16u67b04ai2djp40hlt1'),
	(7554,'2012-07-31 06:51:25','Isaiah','isaiah','teachings,teachings-tags,teachings-series',6,61,'bht0rdivmk7hse647n5imbpsr1'),
	(7555,'2012-07-31 08:03:05','m1-546','m1-546','teachings,teachings-tags,teachings-series',1,1,'a8e1p8j1am1rsuse4faq3jjfr0'),
	(7556,'2012-07-31 09:42:18','sex','sex','teachings,teachings-tags,teachings-series',1,15,'jq62igkapn6cd8ckdvabilej66'),
	(7557,'2012-07-31 11:05:06','Jeff','jeff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'f7dp68ioh6vd383kg1m8ju2396'),
	(7558,'2012-07-31 11:05:14','Jeff','jeff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,13,'f7dp68ioh6vd383kg1m8ju2396'),
	(7559,'2012-07-31 13:00:38','cline to the truth','cline to the truth','teachings,teachings-tags,teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7560,'2012-07-31 13:01:27','kling to the truth','kling to the truth','teachings,teachings-tags,teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7561,'2012-07-31 13:02:20','kling to the truth','kling to the truth','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7562,'2012-07-31 13:02:44','s1-1549','s1-1549','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7563,'2012-07-31 13:03:08','s1-159','s1-159','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7564,'2012-07-31 13:03:16','s1-151','s1-151','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7565,'2012-07-31 13:03:41','S1-1549','s1-1549','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7566,'2012-07-31 13:04:03','s-1549','s-1549','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7567,'2012-07-31 13:04:27','S1-1549','s1-1549','teachings-series',1,0,'9f59p7a1a954oclh5blh1ehdv2'),
	(7568,'2012-07-31 19:52:31','accfkids.blogspot.com','accfkids.blogspot.com','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i0asrpt66vopuj434e1a4ujp00'),
	(7569,'2012-07-31 20:42:56','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'atja0q26dp22tu95ht5qre5ti2'),
	(7570,'2012-07-31 22:27:11','s1-547','s1-547','teachings,teachings-tags,teachings-series',1,1,'pjcb3160f4382fa6v60ht0ra46'),
	(7571,'2012-07-31 22:30:37','July 31st 2012','july 31st 2012','teachings,teachings-tags,teachings-series',1,0,'pjcb3160f4382fa6v60ht0ra46'),
	(7572,'2012-07-31 22:30:50','July 31st 2012','july 31st 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pjcb3160f4382fa6v60ht0ra46'),
	(7573,'2012-07-31 22:31:20','jesus is God','jesus is god','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,82,'pjcb3160f4382fa6v60ht0ra46'),
	(7574,'2012-07-31 22:33:35','jesus is God','jesus is god','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,82,'pjcb3160f4382fa6v60ht0ra46'),
	(7575,'2012-07-31 23:21:47','luke 16','luke 16','teachings,teachings-tags,teachings-series',1,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7576,'2012-07-31 23:22:00','luke 16','luke 16','teachings,teachings-tags,teachings-series',2,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7577,'2012-07-31 23:22:22','luke 16','luke 16','teachings,teachings-tags,teachings-series',3,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7578,'2012-07-31 23:22:39','luke 16','luke 16','teachings,teachings-tags,teachings-series',2,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7579,'2012-07-31 23:23:21','luke 16','luke 16','teachings,teachings-tags,teachings-series',2,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7580,'2012-07-31 23:23:27','luke 16','luke 16','teachings,teachings-tags,teachings-series',2,59,'kt36q0ceea6tabltsbcg54g6u6'),
	(7581,'2012-08-01 02:21:21','contentment','contentment','teachings,teachings-tags,teachings-series',1,6,'bs5dsi54jvjbd17cj98uqneec1'),
	(7582,'2012-08-01 02:33:27','contentment','contentment','teachings,teachings-tags,teachings-series',1,6,'bs5dsi54jvjbd17cj98uqneec1'),
	(7583,'2012-08-01 02:34:30','depression','depression','teachings,teachings-tags,teachings-series',1,7,'bs5dsi54jvjbd17cj98uqneec1'),
	(7584,'2012-08-01 02:38:45','depression','depression','teachings,teachings-tags,teachings-series',1,7,'bs5dsi54jvjbd17cj98uqneec1'),
	(7585,'2012-08-01 02:52:14','contentment','contentment','teachings,teachings-tags,teachings-series',1,6,'bs5dsi54jvjbd17cj98uqneec1'),
	(7586,'2012-08-01 02:52:46','ecclesiastes 4','ecclesiastes 4','teachings,teachings-tags,teachings-series',1,9,'bs5dsi54jvjbd17cj98uqneec1'),
	(7587,'2012-08-01 03:15:05','contentment','contentment','teachings,teachings-tags,teachings-series',1,6,'bs5dsi54jvjbd17cj98uqneec1'),
	(7588,'2012-08-01 03:15:19','m1-584','m1-584','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7589,'2012-08-01 03:16:11','s1-068','s1-068','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7590,'2012-08-01 03:17:09','s1-327','s1-327','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7591,'2012-08-01 03:18:41','s1-520','s1-520','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7592,'2012-08-01 03:19:29','s1-520','s1-520','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7593,'2012-08-01 03:19:42','s1-581','s1-581','teachings,teachings-tags,teachings-series',1,1,'bs5dsi54jvjbd17cj98uqneec1'),
	(7594,'2012-08-01 03:45:33','dating','dating','teachings,teachings-tags,teachings-series',1,2,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7595,'2012-08-01 03:52:43','gods will','gods will','teachings,teachings-tags,teachings-series',1,1,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7596,'2012-08-01 03:53:07','gods will','gods will','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7597,'2012-08-01 03:53:53','gods will','gods will','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7598,'2012-08-01 03:54:07','hearing God','hearing god','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7599,'2012-08-01 03:54:31','hearing God','hearing god','teachings-tags',1,0,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7600,'2012-08-01 03:54:49','hearing God','hearing god','teachings-series',1,0,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7601,'2012-08-01 03:55:08','wisdom','wisdom','teachings,teachings-tags,teachings-series',1,10,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7602,'2012-08-01 03:55:55','wisdom','wisdom','teachings,teachings-tags,teachings-series',1,10,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7603,'2012-08-01 03:56:57','wisdom','wisdom','teachings,teachings-tags,teachings-series',1,10,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7604,'2012-08-01 03:57:11','direction','direction','teachings,teachings-tags,teachings-series',1,3,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7605,'2012-08-01 03:57:55','direction','direction','teachings,teachings-tags,teachings-series',1,3,'lrenpe4q56qdtfct4gr6k45cu5'),
	(7606,'2012-08-01 05:30:37','rapture','rapture','teachings,teachings-tags,teachings-series',1,14,'fta57juf0tf35kt7k7aar5ipf4'),
	(7607,'2012-08-01 05:30:45','rapture','rapture','teachings,teachings-tags,teachings-series',2,14,'fta57juf0tf35kt7k7aar5ipf4'),
	(7608,'2012-08-01 08:21:26','resurrection of the dead','resurrection of the dead','teachings-tags',1,0,'n7o2m9tkrci36senttr0gsfd10'),
	(7609,'2012-08-01 08:21:31','resurrection','resurrection','teachings-tags',1,2,'n7o2m9tkrci36senttr0gsfd10'),
	(7610,'2012-08-01 08:21:57','resurrection','resurrection','teachings-tags',1,2,'n7o2m9tkrci36senttr0gsfd10'),
	(7611,'2012-08-01 08:21:57','resurrection of the dead','resurrection of the dead','teachings-tags',1,0,'n7o2m9tkrci36senttr0gsfd10'),
	(7612,'2012-08-01 09:03:04','jan','jan','teachings,teachings-tags,teachings-series',1,8,'hh9mfped9bl64vi6t5vr0bfki1'),
	(7613,'2012-08-01 09:04:01','january','january','teachings,teachings-tags,teachings-series',1,1,'hh9mfped9bl64vi6t5vr0bfki1'),
	(7614,'2012-08-01 09:04:45','oct','oct','teachings,teachings-tags,teachings-series',1,12,'hh9mfped9bl64vi6t5vr0bfki1'),
	(7615,'2012-08-01 09:05:06','oct','oct','teachings,teachings-tags,teachings-series',2,12,'hh9mfped9bl64vi6t5vr0bfki1'),
	(7616,'2012-08-01 09:05:19','oct','oct','teachings,teachings-tags,teachings-series',1,12,'hh9mfped9bl64vi6t5vr0bfki1'),
	(7617,'2012-08-01 10:20:04','jesus','jesus','teachings,teachings-tags,teachings-series',1,300,'pv3ueqs3pf8ud4qjelf8j8gq24'),
	(7618,'2012-08-01 13:22:17','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,322,'f7dp68ioh6vd383kg1m8ju2396'),
	(7619,'2012-08-01 13:48:09','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'lhtfnogvvrcl9qpnduk9n2vi70'),
	(7620,'2012-08-01 13:49:55','CD','cd','teachings,teachings-tags,teachings-series',1,0,'lhtfnogvvrcl9qpnduk9n2vi70'),
	(7621,'2012-08-01 13:50:25','CD of service','cd of service','teachings,teachings-tags,teachings-series',1,6,'lhtfnogvvrcl9qpnduk9n2vi70'),
	(7622,'2012-08-01 14:05:34','jesus','jesus','teachings,teachings-tags,teachings-series',1,300,'rch9fg2t723mcvkmpfsvafhac0'),
	(7623,'2012-08-01 14:05:49','jesus','jesus','teachings,teachings-tags,teachings-series',2,300,'rch9fg2t723mcvkmpfsvafhac0'),
	(7624,'2012-08-01 15:22:37','s1-547','s1-547','teachings,teachings-tags,teachings-series',1,1,'gr6mo13vtnn46jgs9ibgap65n1'),
	(7625,'2012-08-01 16:31:57','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,322,'f7dp68ioh6vd383kg1m8ju2396'),
	(7626,'2012-08-01 16:33:00','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,322,'cnui84on3ohki9rrhnsa1j45n0'),
	(7627,'2012-08-01 16:40:29','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7628,'2012-08-01 16:40:57','Hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7629,'2012-08-01 16:41:34','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7630,'2012-08-01 17:09:24','Hebrews 1','hebrews 1','teachings,teachings-tags,teachings-series',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7631,'2012-08-01 17:09:35','Hebrews 1','hebrews 1','teachings,teachings-tags,teachings-series',2,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7632,'2012-08-01 17:10:00','Hebrews 1','hebrews 1','teachings-series',1,0,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7633,'2012-08-01 17:10:10','Hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7634,'2012-08-01 17:10:24','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7635,'2012-08-01 17:10:29','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7636,'2012-08-01 17:10:41','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7637,'2012-08-01 17:22:13','2009','2009','teachings,teachings-tags,teachings-series',1,104,'0cnjv67b96d2queja5oe3g3745'),
	(7638,'2012-08-01 17:22:46','2009','2009','teachings',1,104,'0cnjv67b96d2queja5oe3g3745'),
	(7639,'2012-08-01 17:23:29','2009','2009','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,104,'0cnjv67b96d2queja5oe3g3745'),
	(7640,'2012-08-01 17:23:49','Luke 20','luke 20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,59,'0cnjv67b96d2queja5oe3g3745'),
	(7641,'2012-08-01 17:29:43','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7642,'2012-08-01 17:30:11','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7643,'2012-08-01 17:30:31','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7644,'2012-08-01 17:30:53','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7645,'2012-08-01 17:53:31','john 3:12','john 3:12','teachings,teachings-tags,teachings-series',1,0,'d7p00fcinkmo7tsdkjrm23ff20'),
	(7646,'2012-08-01 18:37:58','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'3ocseknr3qqgvakf61i4099632'),
	(7647,'2012-08-01 18:41:32','John','john','teachings,teachings-tags,teachings-series',1,97,'3ocseknr3qqgvakf61i4099632'),
	(7648,'2012-08-01 18:42:31','John','john','teachings,teachings-tags,teachings-series',10,97,'3ocseknr3qqgvakf61i4099632'),
	(7649,'2012-08-01 18:43:03','John 199','john 199','teachings,teachings-tags,teachings-series',1,18,'3ocseknr3qqgvakf61i4099632'),
	(7650,'2012-08-01 18:43:35','John 1','john 1','teachings,teachings-tags,teachings-series',1,97,'3ocseknr3qqgvakf61i4099632'),
	(7651,'2012-08-01 18:44:12','John 1:1','john 1:1','teachings,teachings-tags,teachings-series',1,5,'3ocseknr3qqgvakf61i4099632'),
	(7652,'2012-08-01 18:45:14','Hebrews 1','hebrews 1','teachings,teachings-tags,teachings-series',1,18,'3ocseknr3qqgvakf61i4099632'),
	(7653,'2012-08-01 21:14:59','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'t90mv9k8gil74bmdtn7n8uue40'),
	(7654,'2012-08-01 22:03:30','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'44c3rh8ov7qt9r6qsjktu8ef84'),
	(7655,'2012-08-01 22:30:23','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'svf1lvl7s48498uuq3cnn9i2t4'),
	(7656,'2012-08-01 23:00:46','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'tkuicmaikuqhjjn21a8413t576'),
	(7657,'2012-08-01 23:01:10','hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'tkuicmaikuqhjjn21a8413t576'),
	(7658,'2012-08-01 23:01:17','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'tkuicmaikuqhjjn21a8413t576'),
	(7659,'2012-08-01 23:01:35','hebrews','hebrews','teachings',1,18,'tkuicmaikuqhjjn21a8413t576'),
	(7660,'2012-08-02 05:28:09','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'s8qb0hes7apnipjdtfimcq5kg4'),
	(7661,'2012-08-02 05:28:25','luke 15','luke 15','teachings,teachings-tags,teachings-series',2,59,'s8qb0hes7apnipjdtfimcq5kg4'),
	(7662,'2012-08-02 05:28:37','luke 15','luke 15','teachings,teachings-tags,teachings-series',3,59,'s8qb0hes7apnipjdtfimcq5kg4'),
	(7663,'2012-08-02 07:57:32','M1 565','m1 565','teachings,teachings-tags,teachings-series',1,5,'scleodgblh43uup7l3khv6crm3'),
	(7664,'2012-08-02 07:57:45','M1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'scleodgblh43uup7l3khv6crm3'),
	(7665,'2012-08-02 07:58:21','Galations 1','galations 1','teachings,teachings-tags,teachings-series',1,0,'scleodgblh43uup7l3khv6crm3'),
	(7666,'2012-08-02 07:58:29','Galations 1','galations 1','teachings',1,0,'scleodgblh43uup7l3khv6crm3'),
	(7667,'2012-08-02 07:58:34','Galations 1','galations 1','teachings,teachings-tags,teachings-series',1,0,'scleodgblh43uup7l3khv6crm3'),
	(7668,'2012-08-02 07:58:36','M1-565','m1-565','teachings,teachings-tags,teachings-series',1,1,'scleodgblh43uup7l3khv6crm3'),
	(7669,'2012-08-02 07:58:38','M1 565','m1 565','teachings,teachings-tags,teachings-series',1,5,'scleodgblh43uup7l3khv6crm3'),
	(7670,'2012-08-02 09:57:17','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7671,'2012-08-02 09:57:53','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7672,'2012-08-02 09:58:03','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7673,'2012-08-02 10:14:21','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7674,'2012-08-02 10:43:36','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7675,'2012-08-02 10:43:40','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7676,'2012-08-02 10:44:08','hebrews','hebrews','teachings',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7677,'2012-08-02 10:44:39','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7678,'2012-08-02 10:44:49','hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7679,'2012-08-02 10:44:54','hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7680,'2012-08-02 10:45:03','Hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7681,'2012-08-02 10:45:10','Hebrews 3','hebrews 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'4a4263u8qu5dh2ob1pqffosv25'),
	(7682,'2012-08-02 10:45:14','hebrews 3','hebrews 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'48kuqr6uvlpeuipnu17oanoph5'),
	(7683,'2012-08-02 10:45:31','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'48kuqr6uvlpeuipnu17oanoph5'),
	(7684,'2012-08-02 10:45:44','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'48kuqr6uvlpeuipnu17oanoph5'),
	(7685,'2012-08-02 13:11:34','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,20,'7u6ciaijr2u7eeqiidcle9vrn2'),
	(7686,'2012-08-02 14:32:00','philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'cb7td218h3anjvuta7kditl801'),
	(7687,'2012-08-02 14:36:23','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'mbpjsk6j11a72vg5cfpe6lusi6'),
	(7688,'2012-08-02 14:40:16','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'mbpjsk6j11a72vg5cfpe6lusi6'),
	(7689,'2012-08-02 15:27:02','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'7evicb493847efq4lhd5p8q385'),
	(7690,'2012-08-02 16:19:33','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'mbpjsk6j11a72vg5cfpe6lusi6'),
	(7691,'2012-08-02 17:15:14','faith','faith','teachings-tags',1,3,'defqp3si52ug0h0reg45vps134'),
	(7692,'2012-08-02 17:23:46','faith','faith','teachings-tags',1,3,'defqp3si52ug0h0reg45vps134'),
	(7693,'2012-08-02 18:52:04','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7694,'2012-08-02 21:06:48','dating','dating','teachings,teachings-tags,teachings-series',1,2,'n4od0og8beugkm648ltb5e7te2'),
	(7695,'2012-08-02 21:37:15','Trail fellowship','trail fellowship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qvhqb4tdad8gh6a1irc972jdl3'),
	(7696,'2012-08-02 22:02:18','relationships','relationships','teachings,teachings-tags,teachings-series',1,4,'n4od0og8beugkm648ltb5e7te2'),
	(7697,'2012-08-02 22:02:43','dating','dating','teachings,teachings-tags,teachings-series',1,2,'n4od0og8beugkm648ltb5e7te2'),
	(7698,'2012-08-02 22:03:07','dating','dating','teachings,teachings-tags,teachings-series',1,2,'n4od0og8beugkm648ltb5e7te2'),
	(7699,'2012-08-02 22:03:15','single moms','single moms','teachings,teachings-tags,teachings-series',1,1,'n4od0og8beugkm648ltb5e7te2'),
	(7700,'2012-08-02 22:03:30','single mothers','single mothers','teachings,teachings-tags,teachings-series',1,2,'n4od0og8beugkm648ltb5e7te2'),
	(7701,'2012-08-02 23:07:29','depression','depression','teachings,teachings-tags,teachings-series',1,7,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7702,'2012-08-02 23:08:12','depression','depression','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7703,'2012-08-02 23:08:20','depression','depression','teachings-series',1,1,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7704,'2012-08-02 23:08:25','depression','depression','tags',1,0,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7705,'2012-08-02 23:08:30','depression','depression','downloads',1,0,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7706,'2012-08-02 23:08:35','depression','depression','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'n405bj42jm64dpjhpdhq9ft4e5'),
	(7707,'2012-08-03 00:08:59','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'arvpcfpiskkm33ubsma44ggis0'),
	(7708,'2012-08-03 00:09:19','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,45,'arvpcfpiskkm33ubsma44ggis0'),
	(7709,'2012-08-03 00:09:29','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,45,'arvpcfpiskkm33ubsma44ggis0'),
	(7710,'2012-08-03 03:44:19','Revelation 1','revelation 1','teachings,teachings-tags,teachings-series',1,86,'u0hvsi4ldr6nt9udgtlv9jd4r3'),
	(7711,'2012-08-03 04:01:57','Prophecy update 2012','prophecy update 2012','teachings,teachings-tags,teachings-series',1,0,'5i577f9tt067bpul0npvhpfu23'),
	(7712,'2012-08-03 04:02:06','prophesy','prophesy','teachings,teachings-tags,teachings-series',1,4,'5i577f9tt067bpul0npvhpfu23'),
	(7713,'2012-08-03 04:02:40','Prophecy update 2012','prophecy update 2012','teachings,teachings-tags,teachings-series',1,0,'5i577f9tt067bpul0npvhpfu23'),
	(7714,'2012-08-03 04:13:30','rapture','rapture','teachings,teachings-tags,teachings-series',2,14,'fta57juf0tf35kt7k7aar5ipf4'),
	(7715,'2012-08-03 06:18:01','Timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'h6ltk0njeu0g0kv8r0gi0uiku2'),
	(7716,'2012-08-03 07:14:57','Timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'h6ltk0njeu0g0kv8r0gi0uiku2'),
	(7717,'2012-08-03 07:15:13','timothy1:12','timothy1:12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'h6ltk0njeu0g0kv8r0gi0uiku2'),
	(7718,'2012-08-03 08:20:15','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7719,'2012-08-03 08:20:29','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7720,'2012-08-03 08:20:42','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7721,'2012-08-03 08:21:02','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7722,'2012-08-03 09:10:23','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7723,'2012-08-03 09:10:43','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7724,'2012-08-03 09:55:33','job','job','teachings,teachings-tags,teachings-series',1,20,'3enpq6pd78mmj6a2dv14tt3dr5'),
	(7725,'2012-08-03 10:52:33','Songs of Solomon','songs of solomon','teachings,teachings-tags,teachings-series',1,0,'kje29rkdbvm0pqb7taf19anmq7'),
	(7726,'2012-08-03 10:53:02','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7727,'2012-08-03 11:19:53','kids camp 2012','kids camp 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'gdqnd0pn5p9u06pr2fgfsij8i5'),
	(7728,'2012-08-03 12:18:04','Micah','micah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'4a4263u8qu5dh2ob1pqffosv25'),
	(7729,'2012-08-03 12:18:15','Micah','micah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,12,'4a4263u8qu5dh2ob1pqffosv25'),
	(7730,'2012-08-03 12:18:25','Depaoli','depaoli','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'4a4263u8qu5dh2ob1pqffosv25'),
	(7731,'2012-08-03 12:37:06','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7732,'2012-08-03 14:42:40','2 john','2 john','teachings,teachings-tags,teachings-series',1,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7733,'2012-08-03 14:42:56','2 john','2 john','teachings,teachings-tags,teachings-series',2,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7734,'2012-08-03 14:43:07','2 john','2 john','teachings,teachings-tags,teachings-series',3,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7735,'2012-08-03 14:43:20','2 john','2 john','teachings,teachings-tags,teachings-series',4,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7736,'2012-08-03 14:43:33','2 john','2 john','teachings,teachings-tags,teachings-series',5,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7737,'2012-08-03 14:44:04','2 john','2 john','teachings,teachings-tags,teachings-series',6,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7738,'2012-08-03 14:44:14','2 john','2 john','teachings,teachings-tags,teachings-series',7,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7739,'2012-08-03 14:44:25','2 john','2 john','teachings,teachings-tags,teachings-series',8,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7740,'2012-08-03 14:44:43','2 john','2 john','teachings,teachings-tags,teachings-series',9,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7741,'2012-08-03 14:45:29','2 john','2 john','teachings,teachings-tags,teachings-series',10,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7742,'2012-08-03 14:45:40','2 john','2 john','teachings,teachings-tags,teachings-series',9,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7743,'2012-08-03 15:04:55','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7744,'2012-08-03 16:20:03','hidden event','hidden event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'4a4263u8qu5dh2ob1pqffosv25'),
	(7745,'2012-08-03 16:20:26','JEsus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,322,'4a4263u8qu5dh2ob1pqffosv25'),
	(7746,'2012-08-03 16:31:47','leviticus','leviticus','teachings,teachings-tags,teachings-series',3,23,'7evicb493847efq4lhd5p8q385'),
	(7747,'2012-08-03 16:32:02','exodus','exodus','teachings,teachings-tags,teachings-series',1,59,'7evicb493847efq4lhd5p8q385'),
	(7748,'2012-08-03 16:32:35','exodus','exodus','teachings,teachings-tags,teachings-series',2,59,'7evicb493847efq4lhd5p8q385'),
	(7749,'2012-08-03 16:32:48','exodus','exodus','teachings,teachings-tags,teachings-series',3,59,'7evicb493847efq4lhd5p8q385'),
	(7750,'2012-08-03 17:04:56','god','god','teachings,teachings-tags,teachings-series',1,228,'76ide529ioqlmkon6lgboefgd0'),
	(7751,'2012-08-03 18:46:29','Prophesy','prophesy','teachings,teachings-tags,teachings-series',1,4,'qeu529j91chtputm59s5bau1q4'),
	(7752,'2012-08-03 18:46:52','Prophesy','prophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'qeu529j91chtputm59s5bau1q4'),
	(7753,'2012-08-03 18:47:09','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'qeu529j91chtputm59s5bau1q4'),
	(7754,'2012-08-03 18:48:32','July 2012','july 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'qeu529j91chtputm59s5bau1q4'),
	(7755,'2012-08-03 18:49:34','July 2012','july 2012','teachings,teachings-tags,teachings-series',1,0,'qeu529j91chtputm59s5bau1q4'),
	(7756,'2012-08-03 18:49:54','July 2012','july 2012','teachings',1,0,'qeu529j91chtputm59s5bau1q4'),
	(7757,'2012-08-03 18:50:06','July 2012','july 2012','teachings-tags',1,0,'qeu529j91chtputm59s5bau1q4'),
	(7758,'2012-08-03 18:57:59','Luke 8','luke 8','teachings,teachings-tags,teachings-series',1,59,'okvstffvtkfriiull9tar0s376'),
	(7759,'2012-08-03 19:05:09','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7760,'2012-08-03 19:05:31','genesis','genesis','teachings,teachings-tags,teachings-series',2,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7761,'2012-08-03 19:05:40','genesis','genesis','teachings,teachings-tags,teachings-series',3,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7762,'2012-08-03 19:05:45','genesis','genesis','teachings,teachings-tags,teachings-series',4,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7763,'2012-08-03 19:05:50','genesis','genesis','teachings,teachings-tags,teachings-series',5,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7764,'2012-08-03 19:05:56','genesis','genesis','teachings,teachings-tags,teachings-series',6,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7765,'2012-08-03 19:21:27','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7766,'2012-08-03 19:21:43','genesis','genesis','teachings,teachings-tags,teachings-series',2,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7767,'2012-08-03 19:21:47','genesis','genesis','teachings,teachings-tags,teachings-series',3,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7768,'2012-08-03 19:21:50','genesis','genesis','teachings,teachings-tags,teachings-series',4,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7769,'2012-08-03 19:21:54','genesis','genesis','teachings,teachings-tags,teachings-series',5,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7770,'2012-08-03 19:21:58','genesis','genesis','teachings,teachings-tags,teachings-series',6,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7771,'2012-08-03 19:22:04','genesis','genesis','teachings,teachings-tags,teachings-series',7,62,'6lmmdkk2oi3vhtp3jbb4f3m5u1'),
	(7772,'2012-08-03 20:16:20','sabbath','sabbath','teachings,teachings-tags,teachings-series',1,4,'6ptpptqjteu60gfvbdd5go2op6'),
	(7773,'2012-08-03 21:08:00','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,61,'6ptpptqjteu60gfvbdd5go2op6'),
	(7774,'2012-08-03 21:08:18','isaiah','isaiah','teachings,teachings-tags,teachings-series',2,61,'6ptpptqjteu60gfvbdd5go2op6'),
	(7775,'2012-08-03 21:31:29','Sat','sat','teachings,teachings-tags,teachings-series',1,30,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7776,'2012-08-03 21:31:44','Sat','sat','events-recurring',1,1,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7777,'2012-08-03 21:32:08','saturday','saturday','events-recurring',1,1,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7778,'2012-08-03 21:32:32','saturday','saturday','events-recurring',1,1,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7779,'2012-08-03 21:32:43','saturday','saturday','teachings-series',1,0,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7780,'2012-08-03 21:32:54','saturday','saturday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7781,'2012-08-03 21:34:11','saturday','saturday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,12,'4qqvgs56ilofuoj9n7ma9q3k33'),
	(7782,'2012-08-03 22:27:50','Mi561','mi561','teachings,teachings-tags,teachings-series',1,0,'qvhqb4tdad8gh6a1irc972jdl3'),
	(7783,'2012-08-03 22:28:16','m1-561','m1-561','teachings,teachings-tags,teachings-series',1,1,'qvhqb4tdad8gh6a1irc972jdl3'),
	(7784,'2012-08-03 22:28:48','m1-564','m1-564','teachings,teachings-tags,teachings-series',1,1,'qvhqb4tdad8gh6a1irc972jdl3'),
	(7785,'2012-08-03 22:57:44','philemon','philemon','teachings,teachings-tags,teachings-series',1,6,'15mfj67mftdd0a6cu2kist0300'),
	(7786,'2012-08-04 03:59:17','Luke 8','luke 8','teachings,teachings-tags,teachings-series',1,59,'okvstffvtkfriiull9tar0s376'),
	(7787,'2012-08-04 08:59:18','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,18,'t90mv9k8gil74bmdtn7n8uue40'),
	(7788,'2012-08-04 09:00:11','Hebrews','hebrews','teachings,teachings-tags,teachings-series',2,18,'t90mv9k8gil74bmdtn7n8uue40'),
	(7789,'2012-08-04 09:00:25','Hebrews','hebrews','teachings-series',1,0,'t90mv9k8gil74bmdtn7n8uue40'),
	(7790,'2012-08-04 09:00:34','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'t90mv9k8gil74bmdtn7n8uue40'),
	(7791,'2012-08-04 09:00:52','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,18,'t90mv9k8gil74bmdtn7n8uue40'),
	(7792,'2012-08-04 09:19:28','2 john','2 john','teachings,teachings-tags,teachings-series',9,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7793,'2012-08-04 09:34:01','2 john','2 john','teachings,teachings-tags,teachings-series',9,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7794,'2012-08-04 09:55:09','2 john','2 john','teachings,teachings-tags,teachings-series',9,97,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7795,'2012-08-04 09:55:20','jude','jude','teachings,teachings-tags,teachings-series',1,2,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7796,'2012-08-04 11:08:59','jude','jude','teachings,teachings-tags,teachings-series',1,2,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7797,'2012-08-04 11:09:11','galatians 6','galatians 6','teachings,teachings-tags,teachings-series',1,19,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7798,'2012-08-04 12:46:21','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7799,'2012-08-04 13:59:37','carter','carter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4a4263u8qu5dh2ob1pqffosv25'),
	(7800,'2012-08-04 14:00:04','gabe','gabe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4a4263u8qu5dh2ob1pqffosv25'),
	(7801,'2012-08-04 14:00:07','haek','haek','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'4a4263u8qu5dh2ob1pqffosv25'),
	(7802,'2012-08-04 14:28:30','Luke','luke','teachings,teachings-tags,teachings-series',1,59,'ejsd2idtc56g942q1ubve6n2a1'),
	(7803,'2012-08-04 14:50:40','Vessel','vessel','teachings,teachings-tags,teachings-series',1,5,'i6t26rm69gucrtk94caukb52o2'),
	(7804,'2012-08-04 14:51:24','Vessel','vessel','teachings,teachings-tags,teachings-series',1,5,'i6t26rm69gucrtk94caukb52o2'),
	(7805,'2012-08-04 14:52:17','Vessel','vessel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'i6t26rm69gucrtk94caukb52o2'),
	(7806,'2012-08-04 14:52:18','Vessel','vessel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'i6t26rm69gucrtk94caukb52o2'),
	(7807,'2012-08-04 14:55:44','gratitude','gratitude','teachings,teachings-tags,teachings-series',1,0,'4ah5bg0j4ge71qhrbvaiguk135'),
	(7808,'2012-08-04 14:55:54','Vessel','vessel','teachings,teachings-tags,teachings-series',1,5,'i6t26rm69gucrtk94caukb52o2'),
	(7809,'2012-08-04 15:19:35','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7810,'2012-08-04 16:23:32','Jeremiah 2:13','jeremiah 2:13','teachings,teachings-tags,teachings-series',1,0,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7811,'2012-08-04 16:23:39','Jeremiah 2','jeremiah 2','teachings,teachings-tags,teachings-series',1,43,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7812,'2012-08-04 16:23:49','Jeremiah 2','jeremiah 2','teachings,teachings-tags,teachings-series',3,43,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7813,'2012-08-04 16:23:56','Jeremiah 2','jeremiah 2','teachings,teachings-tags,teachings-series',4,43,'lj0dhfv6ogdkm3le5vfaa4qal2'),
	(7814,'2012-08-04 19:13:18','job','job','teachings,teachings-tags,teachings-series',1,20,'6t13hedvt4bc244hrbnpb9qan0'),
	(7815,'2012-08-04 19:13:37','job','job','teachings',1,19,'6t13hedvt4bc244hrbnpb9qan0'),
	(7816,'2012-08-04 19:13:50','job','job','teachings',2,19,'6t13hedvt4bc244hrbnpb9qan0'),
	(7817,'2012-08-04 19:14:25','job','job','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'6t13hedvt4bc244hrbnpb9qan0'),
	(7818,'2012-08-04 19:14:34','job','job','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'6t13hedvt4bc244hrbnpb9qan0'),
	(7819,'2012-08-04 19:14:48','job','job','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,22,'6t13hedvt4bc244hrbnpb9qan0'),
	(7820,'2012-08-04 19:14:58','job','job','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,22,'6t13hedvt4bc244hrbnpb9qan0'),
	(7821,'2012-08-04 20:10:35','genesis 30','genesis 30','teachings,teachings-tags,teachings-series',1,62,'hmho5cj4aks8557mbs9p3rrqn6'),
	(7822,'2012-08-04 20:11:08','genesis 30','genesis 30','downloads',1,0,'hmho5cj4aks8557mbs9p3rrqn6'),
	(7823,'2012-08-04 20:30:09','1 Samuel','1 samuel','teachings,teachings-tags,teachings-series',1,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7824,'2012-08-04 20:31:03','1 Samuel 26','1 samuel 26','teachings,teachings-tags,teachings-series',1,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7825,'2012-08-04 20:31:20','1 Samuel 26','1 samuel 26','teachings,teachings-tags,teachings-series',2,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7826,'2012-08-04 20:31:46','1 Samuel 26','1 samuel 26','teachings',1,68,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7827,'2012-08-04 20:31:53','1 Samuel 26','1 samuel 26','teachings-series',1,0,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7828,'2012-08-04 20:32:07','samuel','samuel','teachings-series',1,0,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7829,'2012-08-04 20:40:22','samuel','samuel','teachings,teachings-tags,teachings-series',1,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7830,'2012-08-04 20:40:32','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7831,'2012-08-04 20:41:01','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7832,'2012-08-04 20:41:09','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7833,'2012-08-04 20:41:38','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7834,'2012-08-04 20:42:31','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,69,'ui3ctqeikgss0t6iogfa5scnp1'),
	(7835,'2012-08-04 21:55:09','isaiah','isaiah','teachings,teachings-tags,teachings-series',2,61,'6ptpptqjteu60gfvbdd5go2op6'),
	(7836,'2012-08-04 21:55:16','divorce','divorce','teachings,teachings-tags,teachings-series',1,4,'6ptpptqjteu60gfvbdd5go2op6'),
	(7837,'2012-08-05 01:31:53','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7838,'2012-08-05 01:31:53','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7839,'2012-08-05 01:31:54','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7840,'2012-08-05 01:31:54','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7841,'2012-08-05 01:31:54','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7842,'2012-08-05 01:31:55','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7843,'2012-08-05 01:32:11','luke 15','luke 15','teachings,teachings-tags,teachings-series',2,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7844,'2012-08-05 01:32:22','luke 15','luke 15','teachings,teachings-tags,teachings-series',3,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7845,'2012-08-05 01:32:48','luke 15','luke 15','teachings,teachings-tags,teachings-series',4,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7846,'2012-08-05 01:33:03','luke 15','luke 15','teachings,teachings-tags,teachings-series',5,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7847,'2012-08-05 01:33:31','luke 15','luke 15','teachings,teachings-tags,teachings-series',6,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7848,'2012-08-05 01:34:25','luke 15','luke 15','teachings,teachings-tags,teachings-series',6,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7849,'2012-08-05 01:34:56','luke 15','luke 15','teachings,teachings-tags,teachings-series',6,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7850,'2012-08-05 01:35:04','luke 15','luke 15','teachings,teachings-tags,teachings-series',2,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7851,'2012-08-05 01:35:18','luke 15','luke 15','teachings,teachings-tags,teachings-series',3,59,'sg6v7jg103kslun0lc1h8g95t2'),
	(7852,'2012-08-05 08:16:07','video','video','teachings,teachings-tags,teachings-series',1,0,'bnmlu2ml4v9dmhtdthuda0f8f5'),
	(7853,'2012-08-05 08:16:18','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bnmlu2ml4v9dmhtdthuda0f8f5'),
	(7854,'2012-08-05 08:16:41','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bnmlu2ml4v9dmhtdthuda0f8f5'),
	(7855,'2012-08-05 08:17:32','video','video','teachings,teachings-tags,teachings-series',1,0,'bnmlu2ml4v9dmhtdthuda0f8f5'),
	(7856,'2012-08-05 08:23:01','Jesus','jesus','teachings,teachings-tags,teachings-series',1,302,'jb8gnqt6c8itlm1k5dcff5hp20'),
	(7857,'2012-08-05 08:23:15','Jesus','jesus','teachings,teachings-tags,teachings-series',1,302,'jb8gnqt6c8itlm1k5dcff5hp20'),
	(7858,'2012-08-05 10:01:24','Tithing','tithing','teachings,teachings-tags,teachings-series',1,4,'na6ku0het7ibnlaeg13rencvk3'),
	(7859,'2012-08-05 10:13:42','Mark 5','mark 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7860,'2012-08-05 15:35:29','revelation','revelation','teachings,teachings-tags,teachings-series',1,86,'ahdlok4ltc8hj6n2kh76jtu4j0'),
	(7861,'2012-08-05 21:31:57','Luke 6','luke 6','teachings,teachings-tags,teachings-series',1,59,'65u7m689od6i13mtbhe5ep0io5'),
	(7862,'2012-08-05 21:32:10','Luke 6','luke 6','downloads',1,0,'65u7m689od6i13mtbhe5ep0io5'),
	(7863,'2012-08-05 21:36:43','joSIAH','josiah','teachings,teachings-tags,teachings-series',1,0,'65u7m689od6i13mtbhe5ep0io5'),
	(7864,'2012-08-05 21:36:49','Josiah','josiah','teachings,teachings-tags,teachings-series',1,0,'65u7m689od6i13mtbhe5ep0io5'),
	(7865,'2012-08-05 21:36:52','Josiah','josiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'65u7m689od6i13mtbhe5ep0io5'),
	(7866,'2012-08-05 21:39:45','2 kings','2 kings','teachings,teachings-tags,teachings-series',1,51,'65u7m689od6i13mtbhe5ep0io5'),
	(7867,'2012-08-05 21:49:21','2 kings','2 kings','teachings,teachings-tags,teachings-series',1,51,'65u7m689od6i13mtbhe5ep0io5'),
	(7868,'2012-08-05 22:56:42','ephesians 6','ephesians 6','teachings,teachings-tags,teachings-series',1,36,'isnm5aol5ututocutashl6hhl1'),
	(7869,'2012-08-05 22:57:07','ephesians 6','ephesians 6','teachings,teachings-tags,teachings-series',2,36,'isnm5aol5ututocutashl6hhl1'),
	(7870,'2012-08-05 22:57:29','ephesians 6','ephesians 6','teachings,teachings-tags,teachings-series',3,36,'isnm5aol5ututocutashl6hhl1'),
	(7871,'2012-08-05 22:57:45','ephesians 6','ephesians 6','teachings,teachings-tags,teachings-series',4,36,'isnm5aol5ututocutashl6hhl1'),
	(7872,'2012-08-06 00:47:03','Hebrews Sunday August 5','hebrews sunday august 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'prettuk3k1v35elm0sdqbdvg63'),
	(7873,'2012-08-06 08:14:46','Psalm','psalm','teachings,teachings-tags,teachings-series',3,97,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7874,'2012-08-06 08:15:26','Psalm','psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,97,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7875,'2012-08-06 08:16:01','Psalm','psalm','teachings,teachings-tags,teachings-series',4,97,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7876,'2012-08-06 09:10:55','mark','mark','teachings,teachings-tags,teachings-series',1,43,'i2999rernsbmu9c67k254o9ns4'),
	(7877,'2012-08-06 09:11:52','mark','mark','teachings,teachings-tags,teachings-series',2,43,'i2999rernsbmu9c67k254o9ns4'),
	(7878,'2012-08-06 09:12:00','mark 5','mark 5','teachings,teachings-tags,teachings-series',1,43,'i2999rernsbmu9c67k254o9ns4'),
	(7879,'2012-08-06 09:12:11','mark 5','mark 5','teachings,teachings-tags,teachings-series',2,43,'i2999rernsbmu9c67k254o9ns4'),
	(7880,'2012-08-06 09:12:20','mark 5','mark 5','teachings,teachings-tags,teachings-series',3,43,'i2999rernsbmu9c67k254o9ns4'),
	(7881,'2012-08-06 09:12:31','mark 5','mark 5','teachings,teachings-tags,teachings-series',4,43,'i2999rernsbmu9c67k254o9ns4'),
	(7882,'2012-08-06 12:22:32','Deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',1,35,'ebgl6cjdad84fpat8i25vof1p7'),
	(7883,'2012-08-06 12:22:50','deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',1,35,'ebgl6cjdad84fpat8i25vof1p7'),
	(7884,'2012-08-06 12:23:08','deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',2,35,'ebgl6cjdad84fpat8i25vof1p7'),
	(7885,'2012-08-06 12:23:20','deuteronomy','deuteronomy','teachings,teachings-tags,teachings-series',3,35,'ebgl6cjdad84fpat8i25vof1p7'),
	(7886,'2012-08-06 13:00:04','jr. high camp','jr. high camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ed60cq970n9ucca7lteqj85bv2'),
	(7887,'2012-08-06 13:00:13','camp','camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'ed60cq970n9ucca7lteqj85bv2'),
	(7888,'2012-08-06 13:19:11','Sex','sex','teachings,teachings-tags,teachings-series',1,15,'98qboj3vio46f2bs25l17p6um2'),
	(7889,'2012-08-06 14:08:37','podcasts','podcasts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'2np3g6gbnabel3ekfme7epjhh2'),
	(7890,'2012-08-06 14:09:18','n1-566','n1-566','teachings,teachings-tags,teachings-series',1,0,'jfo9ei57cv990c2lgina2s7ep5'),
	(7891,'2012-08-06 14:09:41','N1-566','n1-566','teachings,teachings-tags,teachings-series',1,0,'jfo9ei57cv990c2lgina2s7ep5'),
	(7892,'2012-08-06 17:07:13','SABATH','sabath','teachings,teachings-tags,teachings-series',1,0,'iu46v4m8b0qngpab19fqvdm0j1'),
	(7893,'2012-08-06 17:10:10','SABATH','sabath','teachings,teachings-tags,teachings-series',1,0,'iu46v4m8b0qngpab19fqvdm0j1'),
	(7894,'2012-08-06 17:10:26','sabbath','sabbath','teachings,teachings-tags,teachings-series',1,4,'iu46v4m8b0qngpab19fqvdm0j1'),
	(7895,'2012-08-06 19:10:53','Ezekiel 26','ezekiel 26','teachings,teachings-tags,teachings-series',1,36,'v5bev3ft5gjl6bvghninq93hi4'),
	(7896,'2012-08-06 19:11:07','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',1,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7897,'2012-08-06 19:11:20','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',2,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7898,'2012-08-06 19:11:30','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',3,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7899,'2012-08-06 19:11:43','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',7,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7900,'2012-08-06 19:11:52','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',6,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7901,'2012-08-06 19:11:59','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',7,62,'v5bev3ft5gjl6bvghninq93hi4'),
	(7902,'2012-08-06 19:15:10','Genesis1:1-23','genesis1:1-23','teachings,teachings-tags,teachings-series',1,0,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(7903,'2012-08-06 19:15:23','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',1,62,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(7904,'2012-08-06 19:15:34','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',7,62,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(7905,'2012-08-06 19:40:13','Genesis 1','genesis 1','teachings,teachings-tags,teachings-series',7,62,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(7906,'2012-08-06 22:14:33','Haggai','haggai','teachings,teachings-tags,teachings-series',1,3,'2p046av8knfjf899hijepaogu5'),
	(7907,'2012-08-06 22:32:58','June 6, 2012','june 6, 2012','teachings,teachings-tags,teachings-series',1,0,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7908,'2012-08-06 22:33:12','June 6, 2012','june 6, 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7909,'2012-08-06 22:33:25','June 6, 2012','june 6, 2012','downloads',1,0,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7910,'2012-08-06 22:33:31','June 6, 2012','june 6, 2012','downloads',1,0,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7911,'2012-08-06 22:33:36','June 6, 2012','june 6, 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7912,'2012-08-06 22:33:46','June 6, 2012','june 6, 2012','teachings',1,0,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7913,'2012-08-06 22:33:52','June 6, 2012','june 6, 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'qtfv83u07tm04gr0b8rnk8knd0'),
	(7914,'2012-08-06 23:20:34','matthew','matthew','teachings,teachings-tags,teachings-series',1,83,'699svtvaj160u2j3anqm4qehm1'),
	(7915,'2012-08-06 23:21:59','matthew','matthew','teachings',1,82,'699svtvaj160u2j3anqm4qehm1'),
	(7916,'2012-08-06 23:22:14','matthew','matthew','teachings-series',1,0,'699svtvaj160u2j3anqm4qehm1'),
	(7917,'2012-08-06 23:22:27','matthew','matthew','teachings-tags',1,1,'699svtvaj160u2j3anqm4qehm1'),
	(7918,'2012-08-07 08:33:55','Matt  10','matt  10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,101,'arvpcfpiskkm33ubsma44ggis0'),
	(7919,'2012-08-07 08:34:15','Mark 10','mark 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'arvpcfpiskkm33ubsma44ggis0'),
	(7920,'2012-08-07 10:11:47','apologetics','apologetics','teachings,teachings-tags,teachings-series',1,0,'q7r2vpk8e16deksps2n8o56pq5'),
	(7921,'2012-08-07 10:12:17','apologetic','apologetic','teachings,teachings-tags,teachings-series',1,0,'q7r2vpk8e16deksps2n8o56pq5'),
	(7922,'2012-08-07 10:53:07','ustream','ustream','teachings,teachings-tags,teachings-series',1,0,'4jjjrpvn3ti7uaiql29v3nv3q6'),
	(7923,'2012-08-07 11:27:09','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7924,'2012-08-07 11:27:36','Songs of Solomon','songs of solomon','teachings,teachings-tags,teachings-series',1,0,'kje29rkdbvm0pqb7taf19anmq7'),
	(7925,'2012-08-07 11:27:44','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7926,'2012-08-07 11:52:42','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7927,'2012-08-07 11:53:46','Songs of Solomon','songs of solomon','teachings,teachings-tags,teachings-series',1,0,'kje29rkdbvm0pqb7taf19anmq7'),
	(7928,'2012-08-07 11:54:40','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7929,'2012-08-07 11:58:06','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7930,'2012-08-07 12:17:32','Songs of Solomon','songs of solomon','teachings,teachings-tags,teachings-series',1,0,'kje29rkdbvm0pqb7taf19anmq7'),
	(7931,'2012-08-07 12:17:44','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7932,'2012-08-07 12:35:32','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'kje29rkdbvm0pqb7taf19anmq7'),
	(7933,'2012-08-07 13:51:16','parent','parent','teachings,teachings-tags,teachings-series',1,6,'u177v4qnlmjarj9e89vt9vars3'),
	(7934,'2012-08-07 13:51:36','parent','parent','teachings,teachings-tags,teachings-series',1,6,'u177v4qnlmjarj9e89vt9vars3'),
	(7935,'2012-08-07 13:51:42','discipline','discipline','teachings,teachings-tags,teachings-series',1,5,'u177v4qnlmjarj9e89vt9vars3'),
	(7936,'2012-08-07 15:38:04','proverbs','proverbs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'48kuqr6uvlpeuipnu17oanoph5'),
	(7937,'2012-08-07 15:39:27','proverbs 27','proverbs 27','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'48kuqr6uvlpeuipnu17oanoph5'),
	(7938,'2012-08-07 16:00:47','titus','titus','teachings,teachings-tags,teachings-series',1,10,'ef0ed52utsghh6s6atnupk4cb3'),
	(7939,'2012-08-07 16:03:55','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7940,'2012-08-07 16:04:16','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7941,'2012-08-07 16:04:34','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7942,'2012-08-07 16:04:52','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7943,'2012-08-07 16:05:09','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7944,'2012-08-07 16:05:20','Mark 11','mark 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7945,'2012-08-07 17:12:39','Psalm','psalm','teachings,teachings-tags,teachings-series',4,97,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7946,'2012-08-07 17:38:28','Exodus 15','exodus 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,59,'bnanmh4t1i8i35nmmqeqg56sk2'),
	(7947,'2012-08-07 18:01:38','Mark 10','mark 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'arvpcfpiskkm33ubsma44ggis0'),
	(7948,'2012-08-07 19:33:36','podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'76ide529ioqlmkon6lgboefgd0'),
	(7949,'2012-08-07 22:43:08','Women in the church','women in the church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'rbrt25tvi0654qum1d3o75h6o5'),
	(7950,'2012-08-08 05:30:13','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'vlo4csoh6qoiel2utlfj0faed5'),
	(7951,'2012-08-08 05:31:14','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'vlo4csoh6qoiel2utlfj0faed5'),
	(7952,'2012-08-08 05:31:31','ephesians','ephesians','downloads',1,0,'vlo4csoh6qoiel2utlfj0faed5'),
	(7953,'2012-08-08 05:31:55','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,36,'vlo4csoh6qoiel2utlfj0faed5'),
	(7954,'2012-08-08 07:02:56','Daniel','daniel','teachings,teachings-tags,teachings-series',1,30,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7955,'2012-08-08 07:03:43','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7956,'2012-08-08 07:04:42','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7957,'2012-08-08 07:41:49','Romans12','romans12','teachings,teachings-tags,teachings-series',1,0,'s4oinff24n7d020q8s6uga3aa4'),
	(7958,'2012-08-08 07:42:07','romans','romans','teachings,teachings-tags,teachings-series',1,65,'s4oinff24n7d020q8s6uga3aa4'),
	(7959,'2012-08-08 07:58:27','January 2012','january 2012','teachings,teachings-tags,teachings-series',1,1,'isnm5aol5ututocutashl6hhl1'),
	(7960,'2012-08-08 07:58:46','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7961,'2012-08-08 08:00:19','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7962,'2012-08-08 08:00:57','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7963,'2012-08-08 08:01:38','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7964,'2012-08-08 08:02:10','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7965,'2012-08-08 08:02:52','Philippians','philippians','teachings,teachings-tags,teachings-series',1,21,'isnm5aol5ututocutashl6hhl1'),
	(7966,'2012-08-08 08:03:11','Philippians','philippians','teachings,teachings-tags,teachings-series',2,21,'isnm5aol5ututocutashl6hhl1'),
	(7967,'2012-08-08 08:03:43','Philippians','philippians','teachings,teachings-tags,teachings-series',2,21,'isnm5aol5ututocutashl6hhl1'),
	(7968,'2012-08-08 08:04:23','Philippians','philippians','teachings,teachings-tags,teachings-series',2,21,'isnm5aol5ututocutashl6hhl1'),
	(7969,'2012-08-08 08:04:41','Philippians','philippians','teachings,teachings-tags,teachings-series',3,21,'isnm5aol5ututocutashl6hhl1'),
	(7970,'2012-08-08 08:08:34','Daniel','daniel','teachings,teachings-tags,teachings-series',1,30,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(7971,'2012-08-08 09:43:43','john','john','teachings,teachings-tags,teachings-series',1,97,'pnkbdum9q806kac5s946r1qi20'),
	(7972,'2012-08-08 09:44:09','john','john','teachings,teachings-tags,teachings-series',2,97,'pnkbdum9q806kac5s946r1qi20'),
	(7973,'2012-08-08 09:44:21','john','john','teachings,teachings-tags,teachings-series',3,97,'pnkbdum9q806kac5s946r1qi20'),
	(7974,'2012-08-08 09:44:30','john','john','teachings,teachings-tags,teachings-series',4,97,'pnkbdum9q806kac5s946r1qi20'),
	(7975,'2012-08-08 09:44:37','john','john','teachings,teachings-tags,teachings-series',5,97,'pnkbdum9q806kac5s946r1qi20'),
	(7976,'2012-08-08 09:44:45','john','john','teachings,teachings-tags,teachings-series',6,97,'pnkbdum9q806kac5s946r1qi20'),
	(7977,'2012-08-08 09:44:54','john','john','teachings,teachings-tags,teachings-series',7,97,'pnkbdum9q806kac5s946r1qi20'),
	(7978,'2012-08-08 09:45:15','john','john','teachings-series',1,0,'pnkbdum9q806kac5s946r1qi20'),
	(7979,'2012-08-08 10:26:31','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7980,'2012-08-08 10:37:17','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7981,'2012-08-08 13:15:23','song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(7982,'2012-08-08 13:49:21','song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'sbjg0jm6fdkdualidp4jnapmf3'),
	(7983,'2012-08-08 14:37:20','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(7984,'2012-08-08 14:58:44','song of solomon','song of solomon','teachings,teachings-tags,teachings-series',1,5,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(7985,'2012-08-08 15:20:11','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(7986,'2012-08-08 16:01:16','hebrews 1','hebrews 1','teachings,teachings-tags,teachings-series',1,21,'7qv4rb15nre86lb56hga6nbtc5'),
	(7987,'2012-08-08 16:05:54','exidus','exidus','teachings,teachings-tags,teachings-series',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(7988,'2012-08-08 16:12:43','Mark 14','mark 14','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7989,'2012-08-08 16:12:58','Mark 14','mark 14','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(7990,'2012-08-08 19:15:26','Ezekiel 26','ezekiel 26','teachings,teachings-tags,teachings-series',1,36,'v5bev3ft5gjl6bvghninq93hi4'),
	(7991,'2012-08-08 21:24:09','salvation','salvation','teachings,teachings-tags,teachings-series',1,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7992,'2012-08-08 21:25:21','salvation','salvation','teachings,teachings-tags,teachings-series',2,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7993,'2012-08-08 21:25:44','salvation','salvation','teachings,teachings-tags,teachings-series',3,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7994,'2012-08-08 21:26:18','salvation','salvation','teachings,teachings-tags,teachings-series',1,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7995,'2012-08-08 21:27:32','salvation','salvation','teachings,teachings-tags,teachings-series',1,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7996,'2012-08-08 21:40:12','salvation','salvation','teachings,teachings-tags,teachings-series',1,28,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7997,'2012-08-08 21:40:19','gospel','gospel','teachings,teachings-tags,teachings-series',1,21,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7998,'2012-08-08 21:40:31','what is the gospel','what is the gospel','teachings,teachings-tags,teachings-series',1,1,'i4ip1b9ud6p223u26rnpcsbp83'),
	(7999,'2012-08-08 21:41:20','what is the gospel','what is the gospel','teachings,teachings-tags,teachings-series',1,1,'i4ip1b9ud6p223u26rnpcsbp83'),
	(8000,'2012-08-08 21:41:31','the gospel','the gospel','teachings,teachings-tags,teachings-series',1,19,'i4ip1b9ud6p223u26rnpcsbp83'),
	(8001,'2012-08-08 21:42:12','gospel salvation','gospel salvation','teachings,teachings-tags,teachings-series',1,3,'i4ip1b9ud6p223u26rnpcsbp83'),
	(8002,'2012-08-09 00:48:43','Corinthians','corinthians','teachings,teachings-tags,teachings-series',1,95,'9povjrclqmtdte86c3a0i2kbt7'),
	(8003,'2012-08-09 08:02:00','m1-546','m1-546','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8004,'2012-08-09 08:03:24','m1-546','m1-546','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8005,'2012-08-09 08:04:20','m1-546','m1-546','downloads',1,0,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8006,'2012-08-09 08:04:39','m1-546','m1-546','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8007,'2012-08-09 08:36:03','m1-546','m1-546','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8008,'2012-08-09 08:36:28','s1-530','s1-530','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8009,'2012-08-09 08:36:47','s1-530','s1-530','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9kq8nvbcsbp79h9cn7q3mufd06'),
	(8010,'2012-08-09 09:02:46','blog','blog','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'cfdc9q01fuvvc032nurunav582'),
	(8011,'2012-08-09 09:02:53','blog','blog','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'cfdc9q01fuvvc032nurunav582'),
	(8012,'2012-08-09 09:05:55','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8013,'2012-08-09 11:39:53','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,20,'d1hmoq9sk5m8c3nm13trinuec3'),
	(8014,'2012-08-09 12:07:52','john 15','john 15','teachings,teachings-tags,teachings-series',1,97,'1ok4ca1l5vja5thn3mj4lc1hi2'),
	(8015,'2012-08-09 12:08:38','Mark 14','mark 14','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,45,'9i8fbqne8qd3enbd6fiqs27r53'),
	(8016,'2012-08-09 12:08:45','john 15','john 15','teachings,teachings-tags,teachings-series',2,97,'1ok4ca1l5vja5thn3mj4lc1hi2'),
	(8017,'2012-08-09 12:08:54','john 15','john 15','teachings,teachings-tags,teachings-series',3,97,'1ok4ca1l5vja5thn3mj4lc1hi2'),
	(8018,'2012-08-09 12:09:07','john 15','john 15','teachings,teachings-tags,teachings-series',4,97,'1ok4ca1l5vja5thn3mj4lc1hi2'),
	(8019,'2012-08-09 13:03:23','Esther','esther','teachings,teachings-tags,teachings-series',1,4,'evom7e0qp3ig47dh3ls68dol14'),
	(8020,'2012-08-09 13:12:35','Esther','esther','teachings,teachings-tags,teachings-series',1,4,'evom7e0qp3ig47dh3ls68dol14'),
	(8021,'2012-08-09 13:51:00','john 15','john 15','teachings,teachings-tags,teachings-series',4,97,'1ok4ca1l5vja5thn3mj4lc1hi2'),
	(8022,'2012-08-09 14:36:17','judges','judges','teachings,teachings-tags,teachings-series',1,18,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8023,'2012-08-09 15:01:09','judges','judges','teachings,teachings-tags,teachings-series',1,18,'m02vvvk672a2jsd9ioju8r7255'),
	(8024,'2012-08-09 15:32:56','Luke','luke','teachings,teachings-tags,teachings-series',1,59,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8025,'2012-08-09 15:33:27','Luke 1','luke 1','teachings,teachings-tags,teachings-series',1,59,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8026,'2012-08-09 15:34:18','Luke 1','luke 1','teachings,teachings-tags,teachings-series',2,59,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8027,'2012-08-09 15:34:40','Luke 1','luke 1','teachings',1,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8028,'2012-08-09 15:34:57','Luke 1','luke 1','teachings',2,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8029,'2012-08-09 15:35:11','Luke 1','luke 1','teachings',3,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8030,'2012-08-09 15:35:24','Luke 1','luke 1','teachings',4,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8031,'2012-08-09 15:35:34','Luke 1','luke 1','teachings',6,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8032,'2012-08-09 15:35:53','Luke 1','luke 1','teachings',5,58,'rnf1b05u6rbcrkv2i59csgvvc1'),
	(8033,'2012-08-09 15:38:40','Esther','esther','teachings,teachings-tags,teachings-series',1,4,'evom7e0qp3ig47dh3ls68dol14'),
	(8034,'2012-08-09 15:56:21','revelation 5','revelation 5','teachings,teachings-tags,teachings-series',1,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8035,'2012-08-09 16:19:17','judges','judges','teachings,teachings-tags,teachings-series',1,18,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8036,'2012-08-09 16:19:36','romans','romans','teachings,teachings-tags,teachings-series',1,65,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8037,'2012-08-09 16:20:02','romans','romans','teachings,teachings-tags,teachings-series',3,65,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8038,'2012-08-09 16:20:22','romans','romans','teachings,teachings-tags,teachings-series',7,65,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8039,'2012-08-09 16:20:33','romans','romans','teachings,teachings-tags,teachings-series',6,65,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8040,'2012-08-09 16:48:18','romans','romans','teachings,teachings-tags,teachings-series',6,65,'64g2qa6v2ukgd1puod54joo7t2'),
	(8041,'2012-08-09 17:09:21','genesis','genesis','teachings,teachings-tags,teachings-series',1,62,'qcn0d92jrgatmjog2t16g12cn5'),
	(8042,'2012-08-09 17:30:36','romans','romans','teachings,teachings-tags,teachings-series',1,65,'3rkve2t0nrt0f0oa4tnbprtp04'),
	(8043,'2012-08-09 17:30:38','romans','romans','teachings,teachings-tags,teachings-series',3,65,'f6opat77nhkdh2dnhojnckc4h0'),
	(8044,'2012-08-09 17:30:39','romans','romans','teachings,teachings-tags,teachings-series',7,65,'do18gmr1jt3lc09mdlb7kibt95'),
	(8045,'2012-08-09 18:08:55','Esther','esther','teachings,teachings-tags,teachings-series',1,4,'evom7e0qp3ig47dh3ls68dol14'),
	(8046,'2012-08-09 18:42:42','revelation 5','revelation 5','teachings,teachings-tags,teachings-series',1,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8047,'2012-08-09 18:43:00','revelation 5','revelation 5','teachings,teachings-tags,teachings-series',2,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8048,'2012-08-09 18:52:04','luke 15','luke 15','teachings,teachings-tags,teachings-series',1,59,'35nre2361bkuoosi3bhea9f9p2'),
	(8049,'2012-08-09 18:52:15','luke 15','luke 15','teachings,teachings-tags,teachings-series',2,59,'35nre2361bkuoosi3bhea9f9p2'),
	(8050,'2012-08-09 18:52:24','luke 15','luke 15','teachings,teachings-tags,teachings-series',3,59,'35nre2361bkuoosi3bhea9f9p2'),
	(8051,'2012-08-09 20:24:22','rosenthal','rosenthal','teachings,teachings-tags,teachings-series',1,0,'q588tmrpnl1ic9otgd5qtmo3o7'),
	(8052,'2012-08-09 20:25:30','rosenthal','rosenthal','teachings,teachings-tags,teachings-series',1,0,'q588tmrpnl1ic9otgd5qtmo3o7'),
	(8053,'2012-08-09 21:26:18','revelations','Revelation','teachings,teachings-tags,teachings-series',1,86,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8054,'2012-08-09 21:30:54','resentful','resentful','teachings,teachings-tags,teachings-series',1,0,'umjeq0ae1v36eulh50n498nvh3'),
	(8055,'2012-08-09 22:19:04','Hebrews 3','hebrews 3','teachings,teachings-tags,teachings-series',1,21,'vit3lk80frgau1sp2u82lk85c4'),
	(8056,'2012-08-09 22:20:06','Hebrews 3','hebrews 3','teachings',1,20,'vit3lk80frgau1sp2u82lk85c4'),
	(8057,'2012-08-09 22:20:07','Hebrews 3','hebrews 3','teachings',1,20,'vit3lk80frgau1sp2u82lk85c4'),
	(8058,'2012-08-09 22:22:17','Hebrews 3','hebrews 3','teachings-series',1,1,'vit3lk80frgau1sp2u82lk85c4'),
	(8059,'2012-08-09 22:22:53','Hebrews 3','hebrews 3','teachings-series',1,1,'vit3lk80frgau1sp2u82lk85c4'),
	(8060,'2012-08-09 22:24:50','Hebrews 3','hebrews 3','teachings-series',1,1,'vit3lk80frgau1sp2u82lk85c4'),
	(8061,'2012-08-09 22:24:55','Hebrews 3','hebrews 3','teachings',1,20,'vit3lk80frgau1sp2u82lk85c4'),
	(8062,'2012-08-09 22:24:58','Hebrews 3','hebrews 3','teachings,teachings-tags,teachings-series',1,21,'vit3lk80frgau1sp2u82lk85c4'),
	(8063,'2012-08-09 22:25:06','Hebrews 3','hebrews 3','teachings',1,20,'vit3lk80frgau1sp2u82lk85c4'),
	(8064,'2012-08-09 22:25:16','Hebrews 3','hebrews 3','teachings,teachings-tags,teachings-series',1,21,'vit3lk80frgau1sp2u82lk85c4'),
	(8065,'2012-08-09 23:41:40','ustrea','ustrea','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7qv4rb15nre86lb56hga6nbtc5'),
	(8066,'2012-08-09 23:41:53','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7qv4rb15nre86lb56hga6nbtc5'),
	(8067,'2012-08-09 23:42:23','ustream','ustream','teachings',1,0,'7qv4rb15nre86lb56hga6nbtc5'),
	(8068,'2012-08-09 23:42:38','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7qv4rb15nre86lb56hga6nbtc5'),
	(8069,'2012-08-09 23:42:42','ustrea','ustrea','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7qv4rb15nre86lb56hga6nbtc5'),
	(8070,'2012-08-09 23:44:57','Boys boot camp','boys boot camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kku560vht3fmolbt9iclkg0uq6'),
	(8071,'2012-08-10 09:10:04','Tyre','tyre','teachings,teachings-tags,teachings-series',1,4,'8ciq4mipfbkgnq0f2uu2km5l61'),
	(8072,'2012-08-10 09:17:02','mark','mark','teachings,teachings-tags,teachings-series',1,43,'ib9cisc15ltcm3fh66q2esbs86'),
	(8073,'2012-08-10 09:17:10','mark 5','mark 5','teachings,teachings-tags,teachings-series',1,43,'ib9cisc15ltcm3fh66q2esbs86'),
	(8074,'2012-08-10 09:17:21','mark 5','mark 5','teachings,teachings-tags,teachings-series',2,43,'ib9cisc15ltcm3fh66q2esbs86'),
	(8075,'2012-08-10 09:17:34','mark 5','mark 5','teachings,teachings-tags,teachings-series',3,43,'ib9cisc15ltcm3fh66q2esbs86'),
	(8076,'2012-08-10 11:35:23','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,31,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8077,'2012-08-10 11:36:18','Daniel','daniel','teachings-series',1,0,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8078,'2012-08-10 11:36:33','Daniel','daniel','teachings',1,28,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8079,'2012-08-10 11:36:56','Daniel','daniel','teachings',2,28,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8080,'2012-08-10 11:37:11','in 5 years from now','in 5 years from now','teachings,teachings-tags,teachings-series',1,0,'i4ip1b9ud6p223u26rnpcsbp83'),
	(8081,'2012-08-10 11:37:19','5 years','5 years','teachings,teachings-tags,teachings-series',1,10,'i4ip1b9ud6p223u26rnpcsbp83'),
	(8082,'2012-08-10 12:08:05','Esther','esther','teachings,teachings-tags,teachings-series',1,4,'evom7e0qp3ig47dh3ls68dol14'),
	(8083,'2012-08-10 12:08:13','permission and power','permission and power','teachings,teachings-tags,teachings-series',1,0,'evom7e0qp3ig47dh3ls68dol14'),
	(8084,'2012-08-10 12:08:22','permission power','permission power','teachings,teachings-tags,teachings-series',1,0,'evom7e0qp3ig47dh3ls68dol14'),
	(8085,'2012-08-10 12:08:33','closed door','closed door','teachings,teachings-tags,teachings-series',1,0,'evom7e0qp3ig47dh3ls68dol14'),
	(8086,'2012-08-10 12:24:24','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,36,'jvs05bi9in9dbjnpqop947s0u0'),
	(8087,'2012-08-10 12:29:08','forgiveness','forgiveness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'defqp3si52ug0h0reg45vps134'),
	(8088,'2012-08-10 12:30:35','worry','worry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'defqp3si52ug0h0reg45vps134'),
	(8089,'2012-08-10 12:56:44','1 corinthins','1 corinthins','teachings,teachings-tags,teachings-series',1,0,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8090,'2012-08-10 12:56:58','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8091,'2012-08-10 12:57:16','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',6,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8092,'2012-08-10 12:57:32','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8093,'2012-08-10 13:19:59','worry','worry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'defqp3si52ug0h0reg45vps134'),
	(8094,'2012-08-10 13:20:02','forgiveness','forgiveness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'defqp3si52ug0h0reg45vps134'),
	(8095,'2012-08-10 13:47:11','Matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8096,'2012-08-10 13:47:24','Hebrews 2','hebrews 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jvs05bi9in9dbjnpqop947s0u0'),
	(8097,'2012-08-10 13:48:47','Hebrews 2','hebrews 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jvs05bi9in9dbjnpqop947s0u0'),
	(8098,'2012-08-10 13:53:15','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'pm01vd382oundot6e99r61iog4'),
	(8099,'2012-08-10 13:55:12','1 corinthins','1 corinthins','teachings,teachings-tags,teachings-series',1,0,'62dks9ugqn19f6ajd5hl2s6497'),
	(8100,'2012-08-10 13:55:13','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'j251lkploprvbub21ndlolr5d0'),
	(8101,'2012-08-10 13:55:15','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',6,51,'h839rsuudboohs50fp4k49cnh0'),
	(8102,'2012-08-10 14:00:46','Matthew 11','matthew 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8103,'2012-08-10 14:01:12','Matthew 11','matthew 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8104,'2012-08-10 14:22:48','times','times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'1tbrdssgaev80mgdaepr7l5s90'),
	(8105,'2012-08-10 15:01:37','micah','micah','teachings,teachings-tags,teachings-series',1,1,'8so1eo1g2rgaq271huhe49ujs2'),
	(8106,'2012-08-10 15:01:48','micah','micah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'8so1eo1g2rgaq271huhe49ujs2'),
	(8107,'2012-08-10 16:02:39','Matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8108,'2012-08-10 16:03:49','Titus 3','titus 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jvs05bi9in9dbjnpqop947s0u0'),
	(8109,'2012-08-10 16:14:03','confess','confess','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'defqp3si52ug0h0reg45vps134'),
	(8110,'2012-08-10 16:17:19','Titus 3','titus 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'48kuqr6uvlpeuipnu17oanoph5'),
	(8111,'2012-08-10 16:18:19','confess','confess','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'defqp3si52ug0h0reg45vps134'),
	(8112,'2012-08-10 16:28:36','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8113,'2012-08-10 16:28:44','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8114,'2012-08-10 16:30:42','saved','saved','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'defqp3si52ug0h0reg45vps134'),
	(8115,'2012-08-10 23:41:26','deaf','deaf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9qk0d63n3hg1kd8vir3vg85jh1'),
	(8116,'2012-08-10 23:42:18','children','children','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,27,'9qk0d63n3hg1kd8vir3vg85jh1'),
	(8117,'2012-08-11 08:39:53','Daniel','daniel','teachings',2,2,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8118,'2012-08-11 08:40:26','Daniel','daniel','teachings-tags',1,2,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8119,'2012-08-11 08:40:27','Daniel','daniel','teachings',1,2,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8120,'2012-08-11 08:41:02','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8121,'2012-08-11 08:41:33','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8122,'2012-08-11 09:16:08','n-1566','n-1566','teachings,teachings-tags,teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8123,'2012-08-11 09:16:15','n1566','n1566','teachings,teachings-tags,teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8124,'2012-08-11 09:16:21','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8125,'2012-08-11 09:16:56','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8126,'2012-08-11 09:16:59','1536','1536','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8127,'2012-08-11 09:19:18','1536','1536','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8128,'2012-08-11 09:19:21','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8129,'2012-08-11 09:21:36','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8130,'2012-08-11 09:21:50','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8131,'2012-08-11 09:22:06','time between calling','time between calling','teachings,teachings-tags,teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8132,'2012-08-11 09:22:17','1536','1536','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8133,'2012-08-11 09:28:13','1536','1536','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8134,'2012-08-11 09:28:16','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8135,'2012-08-11 09:28:57','1566','1566','teachings,teachings-tags,teachings-series',1,1,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8136,'2012-08-11 09:29:04','n1-566','n1-566','teachings,teachings-tags,teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8137,'2012-08-11 09:29:14','n1566','n1566','teachings,teachings-tags,teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8138,'2012-08-11 09:29:28','n1566','n1566','teachings-series',1,0,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8139,'2012-08-11 09:30:00','566','566','teachings,teachings-tags,teachings-series',1,4,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8140,'2012-08-11 09:31:56','566','566','teachings,teachings-tags,teachings-series',1,4,'nivo6q964tjj59rtfuf0mvs3f4'),
	(8141,'2012-08-11 09:37:30','Colossians 1','colossians 1','teachings,teachings-tags,teachings-series',1,10,'ft89tg3q8sjjo00dvav20qo0g5'),
	(8142,'2012-08-11 09:38:24','Luke 2','luke 2','teachings,teachings-tags,teachings-series',1,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8143,'2012-08-11 09:39:47','Colossians 1','colossians 1','teachings,teachings-tags,teachings-series',1,10,'ft89tg3q8sjjo00dvav20qo0g5'),
	(8144,'2012-08-11 09:39:55','Colossians 1','colossians 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'ft89tg3q8sjjo00dvav20qo0g5'),
	(8145,'2012-08-11 10:10:26','Psalms','psalms','teachings,teachings-tags,teachings-series',1,1,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8146,'2012-08-11 10:10:51','Psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8147,'2012-08-11 11:12:34','Gods timing','gods timing','teachings,teachings-tags,teachings-series',1,0,'ss5u92u0l4psjf01smst6big70'),
	(8148,'2012-08-11 11:12:50','Gods timing','gods timing','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ss5u92u0l4psjf01smst6big70'),
	(8149,'2012-08-11 11:13:09','Gods timing','gods timing','teachings',1,0,'ss5u92u0l4psjf01smst6big70'),
	(8150,'2012-08-11 11:13:15','Gods timing','gods timing','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ss5u92u0l4psjf01smst6big70'),
	(8151,'2012-08-11 11:19:02','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8152,'2012-08-11 11:19:29','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8153,'2012-08-11 11:20:30','Psalm','psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8154,'2012-08-11 12:53:02','Psalm','psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8155,'2012-08-11 13:54:54','Heart','heart','teachings,teachings-tags,teachings-series',1,13,'hvo8fsoktsfq5hfk28ird6i546'),
	(8156,'2012-08-11 16:31:11','Heart','heart','teachings,teachings-tags,teachings-series',1,13,'ngqiknr86t6uq9eu9f3e2dvvi2'),
	(8157,'2012-08-11 16:31:22','Heart','heart','teachings,teachings-tags,teachings-series',2,13,'ngqiknr86t6uq9eu9f3e2dvvi2'),
	(8158,'2012-08-11 18:03:03','Psalm','psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8159,'2012-08-11 18:03:22','Daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8160,'2012-08-11 18:03:49','Marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8161,'2012-08-11 18:04:40','Sex','sex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8162,'2012-08-11 18:34:00','Jesus','jesus','teachings,teachings-tags,teachings-series',1,170,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8163,'2012-08-11 18:36:12','Jesus','jesus','teachings,teachings-tags,teachings-series',1,170,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8164,'2012-08-11 18:36:29','Jesus','jesus','teachings-series',1,3,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8165,'2012-08-11 18:36:35','Jesus','jesus','teachings,teachings-tags,teachings-series',1,170,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8166,'2012-08-11 18:36:42','Jesus','jesus','teachings-series',1,3,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8167,'2012-08-11 18:36:53','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,193,'jg55ebnk99jd3ufq96k5nbotk0'),
	(8168,'2012-08-11 22:38:55','Corintheans','corintheans','teachings,teachings-tags,teachings-series',1,0,'0rgov7fqi7a7h4dq649g212ke7'),
	(8169,'2012-08-11 22:40:26','1 Corinthians 13','1 corinthians 13','teachings,teachings-tags,teachings-series',1,51,'0rgov7fqi7a7h4dq649g212ke7'),
	(8170,'2012-08-11 22:41:00','1 Corinthians 13','1 corinthians 13','teachings,teachings-tags,teachings-series',2,51,'0rgov7fqi7a7h4dq649g212ke7'),
	(8171,'2012-08-11 22:41:17','1 Corinthians 13','1 corinthians 13','teachings,teachings-tags,teachings-series',3,51,'0rgov7fqi7a7h4dq649g212ke7'),
	(8172,'2012-08-12 00:27:46','Ezekiel 37','ezekiel 37','teachings,teachings-tags,teachings-series',1,3,'gvn2uf4uk5tvdc5809b32g3075'),
	(8173,'2012-08-12 01:22:40','Ezekiel 37','ezekiel 37','teachings,teachings-tags,teachings-series',1,3,'gvn2uf4uk5tvdc5809b32g3075'),
	(8174,'2012-08-12 01:22:52','Ezekiel 37','ezekiel 37','teachings',1,2,'gvn2uf4uk5tvdc5809b32g3075'),
	(8175,'2012-08-12 01:23:09','Ezekiel 1','ezekiel 1','teachings',1,2,'gvn2uf4uk5tvdc5809b32g3075'),
	(8176,'2012-08-12 07:28:47','Women in the church','women in the church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'rbrt25tvi0654qum1d3o75h6o5'),
	(8177,'2012-08-12 07:35:04','romans 16','romans 16','teachings,teachings-tags,teachings-series',1,39,'dcvtshhmn84v1btf18niqokdg3'),
	(8178,'2012-08-12 10:07:38','Babtism','babtism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'01pvo1vtr695huv9n1b9qtf712'),
	(8179,'2012-08-12 10:07:50','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'01pvo1vtr695huv9n1b9qtf712'),
	(8180,'2012-08-12 10:08:36','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'01pvo1vtr695huv9n1b9qtf712'),
	(8181,'2012-08-12 11:30:42','tad','tad','teachings,teachings-tags,teachings-series',1,5,'n41kqrgjf0b3b80mmqjedcagf6'),
	(8182,'2012-08-12 17:55:54','The reliability of Gods word','the reliability of gods word','teachings,teachings-tags,teachings-series',1,0,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8183,'2012-08-12 17:56:11','The reliability of Gods word','the reliability of gods word','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8184,'2012-08-12 17:56:18','The reliability of Gods word','the reliability of gods word','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8185,'2012-08-12 17:56:30','The reliability of Gods word','the reliability of gods word','teachings',1,0,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8186,'2012-08-12 17:57:16','The reliability of Gods word','the reliability of gods word','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8187,'2012-08-12 17:58:11','The reliability','the reliability','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'cd2l6ij04jsnbit9f5ptaj6n90'),
	(8188,'2012-08-12 20:37:12','Tad','tad','teachings,teachings-tags,teachings-series',1,5,'7i0q1rvq1c89lf46ejf1iuhe73'),
	(8189,'2012-08-12 20:38:49','July 15','july 15','teachings,teachings-tags,teachings-series',1,1,'7i0q1rvq1c89lf46ejf1iuhe73'),
	(8190,'2012-08-12 20:39:08','July 15','july 15','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'7i0q1rvq1c89lf46ejf1iuhe73'),
	(8191,'2012-08-12 21:15:02','creation','creation','teachings,teachings-tags,teachings-series',1,2,'iip0jt314qk23tdlurudsrop35'),
	(8192,'2012-08-12 21:18:02','creation','creation','teachings,teachings-tags,teachings-series',1,2,'v68um1j2pk4s324v6pfqi282s6'),
	(8193,'2012-08-13 00:14:38','O','o','teachings,teachings-tags,teachings-series',1,0,'nb29pvs2pio1aaoaol00epk4b0'),
	(8194,'2012-08-13 05:24:53','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'1en8be0shlpgfajecaqd1i2h72'),
	(8195,'2012-08-13 07:05:55','Judges','judges','teachings,teachings-tags,teachings-series',1,1,'dpoe1p0rb1df21j9tqcovuhhg2'),
	(8196,'2012-08-13 07:06:20','judges','judges','teachings,teachings-tags,teachings-series',1,1,'dpoe1p0rb1df21j9tqcovuhhg2'),
	(8197,'2012-08-13 07:06:29','judges','judges','teachings',1,1,'dpoe1p0rb1df21j9tqcovuhhg2'),
	(8198,'2012-08-13 10:09:27','revelation 14','revelation 14','teachings,teachings-tags,teachings-series',1,37,'afr6tbnq7tfkivq8bng8lnp560'),
	(8199,'2012-08-13 10:09:48','revelation 14','revelation 14','events',1,0,'afr6tbnq7tfkivq8bng8lnp560'),
	(8200,'2012-08-13 10:09:53','revelation 14','revelation 14','teachings,teachings-tags,teachings-series',1,37,'afr6tbnq7tfkivq8bng8lnp560'),
	(8201,'2012-08-13 10:10:04','revelation 14','revelation 14','downloads',1,0,'afr6tbnq7tfkivq8bng8lnp560'),
	(8202,'2012-08-13 10:10:26','revelation 14','revelation 14','teachings-tags',1,1,'afr6tbnq7tfkivq8bng8lnp560'),
	(8203,'2012-08-13 10:11:35','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'afr6tbnq7tfkivq8bng8lnp560'),
	(8204,'2012-08-13 12:01:50','Lukewarm','lukewarm','teachings,teachings-tags,teachings-series',1,0,'lo779e04oo42roje90dj3svi83'),
	(8205,'2012-08-13 12:54:13','seek','seek','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'defqp3si52ug0h0reg45vps134'),
	(8206,'2012-08-13 14:07:45','seek','seek','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'defqp3si52ug0h0reg45vps134'),
	(8207,'2012-08-13 14:28:04','Jesus','jesus','teachings,teachings-tags,teachings-series',1,170,'tjunfj21mlnd3q9on93ujn30v5'),
	(8208,'2012-08-13 14:28:14','Jonah','jonah','teachings,teachings-tags,teachings-series',1,1,'tjunfj21mlnd3q9on93ujn30v5'),
	(8209,'2012-08-13 14:44:25','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,11,'d1hmoq9sk5m8c3nm13trinuec3'),
	(8210,'2012-08-13 14:46:02','the holy spirit','the holy spirit','teachings,teachings-tags,teachings-series',1,10,'d1hmoq9sk5m8c3nm13trinuec3'),
	(8211,'2012-08-13 14:46:20','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,11,'d1hmoq9sk5m8c3nm13trinuec3'),
	(8212,'2012-08-13 14:46:24','holy spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'d1hmoq9sk5m8c3nm13trinuec3'),
	(8213,'2012-08-13 14:57:21','Mark 6','mark 6','teachings,teachings-tags,teachings-series',1,40,'nu1ns930kmc18lv9iuc2sdtmt1'),
	(8214,'2012-08-13 15:13:51','David\'s mighty men','david\'s mighty men','teachings,teachings-tags,teachings-series',1,1,'otu76hcb7m4agqdh2vmdlb31n4'),
	(8215,'2012-08-13 17:06:57','sunday 08 11','sunday 08 11','teachings,teachings-tags,teachings-series',1,219,'h63os2etl1p20nv2l2i8biu4j3'),
	(8216,'2012-08-13 19:02:47','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2807,'g3ffeh8dhk25f2trtgt1m3nh46'),
	(8217,'2012-08-13 19:34:20','salt','salt','teachings,teachings-tags,teachings-series',1,2,'4prdbepdiqs2evja65gvlbovh1'),
	(8218,'2012-08-13 19:37:14','salt','salt','teachings,teachings-tags,teachings-series',1,2,'4prdbepdiqs2evja65gvlbovh1'),
	(8219,'2012-08-13 19:37:36','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',1,33,'4prdbepdiqs2evja65gvlbovh1'),
	(8220,'2012-08-13 19:37:51','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',2,33,'4prdbepdiqs2evja65gvlbovh1'),
	(8221,'2012-08-13 19:38:04','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',3,33,'4prdbepdiqs2evja65gvlbovh1'),
	(8222,'2012-08-13 19:38:16','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',4,33,'4prdbepdiqs2evja65gvlbovh1'),
	(8223,'2012-08-13 19:38:26','matthew 5:13','matthew 5:13','teachings,teachings-tags,teachings-series',1,0,'4prdbepdiqs2evja65gvlbovh1'),
	(8224,'2012-08-13 19:38:38','method','method','teachings,teachings-tags,teachings-series',1,1,'4prdbepdiqs2evja65gvlbovh1'),
	(8225,'2012-08-13 19:38:48','salt of the earth','salt of the earth','teachings,teachings-tags,teachings-series',1,0,'4prdbepdiqs2evja65gvlbovh1'),
	(8226,'2012-08-13 19:38:51','salt','salt','teachings,teachings-tags,teachings-series',1,2,'4prdbepdiqs2evja65gvlbovh1'),
	(8227,'2012-08-13 19:46:02','Titus 3','titus 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'48kuqr6uvlpeuipnu17oanoph5'),
	(8228,'2012-08-13 22:57:10','Homosexuality','homosexuality','teachings,teachings-tags,teachings-series',1,2,'lo779e04oo42roje90dj3svi83'),
	(8229,'2012-08-13 23:25:53','Wednesday, August 8, 2010','wednesday, august 8, 2010','teachings,teachings-tags,teachings-series',1,0,'op4u5gs6uorcuf2lcp73p7vc44'),
	(8230,'2012-08-14 05:47:18','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'1en8be0shlpgfajecaqd1i2h72'),
	(8231,'2012-08-14 09:06:52','Hebrews 4','hebrews 4','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'jvs05bi9in9dbjnpqop947s0u0'),
	(8232,'2012-08-14 09:18:51','tithing','tithing','teachings,teachings-tags,teachings-series',1,1,'b8ps40u28ir9pcjprq6d2ce842'),
	(8233,'2012-08-14 09:28:42','perfection','perfection','teachings,teachings-tags,teachings-series',1,3,'um7ucrlqs3kkmpsb283r6vne56'),
	(8234,'2012-08-14 09:49:45','s1-530','s1-530','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8235,'2012-08-14 09:50:18','s1-531','s1-531','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8236,'2012-08-14 09:51:30','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8237,'2012-08-14 10:21:43','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8238,'2012-08-14 10:22:23','revelations','Revelation','downloads',1,0,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8239,'2012-08-14 10:22:39','revelations','Revelation','teachings-series',1,0,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8240,'2012-08-14 10:22:50','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8241,'2012-08-14 10:23:06','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8242,'2012-08-14 10:34:11','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8243,'2012-08-14 10:35:44','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8244,'2012-08-14 10:37:25','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8245,'2012-08-14 10:39:03','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8246,'2012-08-14 10:39:07','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8247,'2012-08-14 10:39:54','m1-548','m1-548','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8248,'2012-08-14 10:40:37','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8249,'2012-08-14 10:41:44','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8250,'2012-08-14 10:42:46','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8251,'2012-08-14 10:44:21','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8252,'2012-08-14 10:45:28','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8253,'2012-08-14 10:46:43','revelations','Revelation','teachings',1,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8254,'2012-08-14 10:46:58','revelations','Revelation','teachings',2,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8255,'2012-08-14 10:48:03','revelations','Revelation','teachings',2,36,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8256,'2012-08-14 11:28:05','Hebrews 2','hebrews 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jvs05bi9in9dbjnpqop947s0u0'),
	(8257,'2012-08-14 11:28:11','Matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8258,'2012-08-14 11:28:25','Matthew 3','matthew 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8259,'2012-08-14 11:29:19','Matthew 11:25','matthew 11:25','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jvs05bi9in9dbjnpqop947s0u0'),
	(8260,'2012-08-14 11:29:26','Matthew 11','matthew 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'jvs05bi9in9dbjnpqop947s0u0'),
	(8261,'2012-08-14 11:33:11','Matthew 11:25','matthew 11:25','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jvs05bi9in9dbjnpqop947s0u0'),
	(8262,'2012-08-14 12:29:07','jeremiah','jeremiah','teachings,teachings-tags,teachings-series',1,1,'hesgoulige0f2bt73an15qacg6'),
	(8263,'2012-08-14 13:17:24','Revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'ssu2ifj4u0u8oj39blic76k9b5'),
	(8264,'2012-08-14 13:21:08','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8265,'2012-08-14 13:21:21','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',6,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8266,'2012-08-14 13:22:25','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'dj5iuh8ido7bctcnbl6ef8egs5'),
	(8267,'2012-08-14 13:25:50','August 11','august 11','teachings,teachings-tags,teachings-series',1,0,'e5lb4kpo21gi5kvk9mn1nk6db6'),
	(8268,'2012-08-14 13:26:24','August 11','august 11','teachings-series',1,0,'e5lb4kpo21gi5kvk9mn1nk6db6'),
	(8269,'2012-08-14 13:26:56','August 11','august 11','teachings',1,0,'e5lb4kpo21gi5kvk9mn1nk6db6'),
	(8270,'2012-08-14 13:30:38','August 11','august 11','teachings',1,0,'e5lb4kpo21gi5kvk9mn1nk6db6'),
	(8271,'2012-08-14 14:23:54','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'opfpc5s2n6k8e82t0f91520jo3'),
	(8272,'2012-08-14 15:59:26','sex','sex','teachings,teachings-tags,teachings-series',1,8,'cootf76j4kil66imd1umng82f6'),
	(8273,'2012-08-14 16:00:31','sex','sex','teachings,teachings-tags,teachings-series',1,8,'cootf76j4kil66imd1umng82f6'),
	(8274,'2012-08-14 16:00:37','adultery','adultery','teachings,teachings-tags,teachings-series',1,1,'cootf76j4kil66imd1umng82f6'),
	(8275,'2012-08-14 16:10:08','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'jcr0sg3ucmmdn86g5b0k59mee6'),
	(8276,'2012-08-14 16:10:22','romans','romans','teachings,teachings-tags,teachings-series',1,39,'jcr0sg3ucmmdn86g5b0k59mee6'),
	(8277,'2012-08-14 16:24:56','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8278,'2012-08-14 16:25:06','ex','ex','teachings,teachings-tags,teachings-series',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8279,'2012-08-14 16:25:07','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8280,'2012-08-14 16:25:16','ex','ex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8281,'2012-08-14 16:25:26','ex','ex','teachings',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8282,'2012-08-14 16:25:32','ex','ex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8283,'2012-08-14 16:25:44','exedus','exedus','teachings,teachings-tags,teachings-series',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8284,'2012-08-14 16:26:18','exadus','exadus','teachings,teachings-tags,teachings-series',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8285,'2012-08-14 17:30:30','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'8q49sivv1cadfc4916etbtd517'),
	(8286,'2012-08-14 17:30:32','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'92v70aniq9jn3b0sjkn1hivjt5'),
	(8287,'2012-08-14 17:54:51','Psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8288,'2012-08-14 18:34:04','exadus','exadus','teachings,teachings-tags,teachings-series',1,0,'9abbhf9jb4pfhp6sb7aq1a7n26'),
	(8289,'2012-08-14 19:03:28','Luke 5','luke 5','teachings,teachings-tags,teachings-series',1,53,'dotgug5781917jq35278i8m6j4'),
	(8290,'2012-08-14 19:03:59','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8291,'2012-08-14 19:04:16','Luke 5','luke 5','teachings,teachings-tags,teachings-series',3,53,'dotgug5781917jq35278i8m6j4'),
	(8292,'2012-08-14 21:09:18','1st John','1st john','teachings,teachings-tags,teachings-series',1,0,'jpqlous6tjq638mlu8jdt63jf2'),
	(8293,'2012-08-14 21:54:53','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'s4auaa80a6iafvia0ntji8smc7'),
	(8294,'2012-08-14 22:03:33','anxiety','anxiety','teachings-tags',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8295,'2012-08-14 22:03:43','anxiety','anxiety','teachings',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8296,'2012-08-14 22:03:59','anxiety','anxiety','teachings-tags',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8297,'2012-08-14 22:04:10','worries','worries','teachings-tags',1,0,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8298,'2012-08-14 22:04:17','trials','trials','teachings-tags',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8299,'2012-08-14 22:04:42','trust','trust','teachings-tags',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8300,'2012-08-14 22:04:53','hope','hope','teachings-tags',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8301,'2012-08-14 22:05:02','hope','hope','teachings-series',1,1,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8302,'2012-08-14 22:08:17','worry','worry','teachings,teachings-tags,teachings-series',1,2,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8303,'2012-08-15 06:37:55','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'1en8be0shlpgfajecaqd1i2h72'),
	(8304,'2012-08-15 06:49:12','phil 4:8','phil 4:8','teachings,teachings-tags,teachings-series',1,0,'bkgb8acg7s1v7sapokvv8c7856'),
	(8305,'2012-08-15 06:49:39','philippians 4:8','philippians 4:8','teachings,teachings-tags,teachings-series',1,0,'bkgb8acg7s1v7sapokvv8c7856'),
	(8306,'2012-08-15 07:52:10','mark 6','mark 6','teachings,teachings-tags,teachings-series',1,40,'ib9cisc15ltcm3fh66q2esbs86'),
	(8307,'2012-08-15 08:12:36','mark 6','mark 6','teachings,teachings-tags,teachings-series',2,40,'ib9cisc15ltcm3fh66q2esbs86'),
	(8308,'2012-08-15 08:12:50','mark 6','mark 6','teachings,teachings-tags,teachings-series',3,40,'ib9cisc15ltcm3fh66q2esbs86'),
	(8309,'2012-08-15 08:13:04','mark 6','mark 6','teachings,teachings-tags,teachings-series',4,40,'ib9cisc15ltcm3fh66q2esbs86'),
	(8310,'2012-08-15 09:09:43','Jesus','jesus','teachings,teachings-tags,teachings-series',1,172,'oa5rrpg724lpon97mdhmjao5e0'),
	(8311,'2012-08-15 10:12:07','Luke 2','luke 2','teachings,teachings-tags,teachings-series',1,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8312,'2012-08-15 10:12:18','Luke 2','luke 2','teachings,teachings-tags,teachings-series',2,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8313,'2012-08-15 10:54:48','Luke 5','luke 5','teachings,teachings-tags,teachings-series',3,53,'dotgug5781917jq35278i8m6j4'),
	(8314,'2012-08-15 10:56:17','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8315,'2012-08-15 10:56:22','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8316,'2012-08-15 10:59:47','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8317,'2012-08-15 10:59:58','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'0u1eji6nf0tfrk2njkatjht4p0'),
	(8318,'2012-08-15 12:15:03','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',1,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8319,'2012-08-15 12:15:21','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8320,'2012-08-15 12:31:46','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'pp86190u6ct8ep967r3ukaffo6'),
	(8321,'2012-08-15 12:33:08','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'pp86190u6ct8ep967r3ukaffo6'),
	(8322,'2012-08-15 12:34:49','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'pp86190u6ct8ep967r3ukaffo6'),
	(8323,'2012-08-15 14:11:09','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8324,'2012-08-15 15:21:03','Joshua 7','joshua 7','teachings,teachings-tags,teachings-series',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8325,'2012-08-15 15:22:47','Joshua 7','joshua 7','teachings,teachings-tags,teachings-series',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8326,'2012-08-15 15:23:25','Joshua','joshua','teachings,teachings-tags,teachings-series',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8327,'2012-08-15 15:23:52','Joshua','joshua','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8328,'2012-08-15 15:24:33','joshua','joshua','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8329,'2012-08-15 15:25:18','joshua','joshua','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vsoreejp1i1epo54pi3bt9utt7'),
	(8330,'2012-08-15 15:28:27','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8331,'2012-08-15 15:28:34','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8332,'2012-08-15 15:29:38','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',3,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8333,'2012-08-15 15:30:01','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8334,'2012-08-15 16:06:42','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'hcd5i1qedf8kaugcrcog403ig7'),
	(8335,'2012-08-15 16:06:44','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',3,51,'32egmidp485j8f8nhj92fik2f5'),
	(8336,'2012-08-15 16:06:46','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'u123uednjblm1lml1bd1dd8tb6'),
	(8337,'2012-08-15 17:00:39','Sex','sex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8338,'2012-08-15 17:04:35','Sex','sex','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8339,'2012-08-15 17:05:23','Fornication','fornication','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8340,'2012-08-15 17:06:22','Songs of Solomon','songs of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8341,'2012-08-15 17:06:43','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8342,'2012-08-15 17:07:08','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8343,'2012-08-15 17:09:33','Song of Solomon','song of solomon','teachings',1,0,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8344,'2012-08-15 17:10:02','Solomon','solomon','teachings',1,1,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8345,'2012-08-15 17:17:57','Couples','couples','teachings-tags',1,0,'16i23j65qu80o5h762vq0v8do7'),
	(8346,'2012-08-15 17:18:10','Parents','parents','teachings-tags',1,2,'16i23j65qu80o5h762vq0v8do7'),
	(8347,'2012-08-15 17:18:47','Parenting','parenting','teachings-tags',1,1,'16i23j65qu80o5h762vq0v8do7'),
	(8348,'2012-08-15 20:27:58','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8349,'2012-08-15 20:53:25','rapture','rapture','teachings,teachings-tags,teachings-series',1,7,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8350,'2012-08-15 20:56:06','revelations bible study','Revelation bible study','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8351,'2012-08-15 20:56:40','revelations bible study','Revelation bible study','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8352,'2012-08-15 20:56:59','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8353,'2012-08-15 20:57:22','revelation','revelation','teachings',1,36,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8354,'2012-08-15 20:57:29','revelation','revelation','teachings-series',1,0,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8355,'2012-08-15 20:57:37','revelation','revelation','teachings',1,36,'b9edspfe6n5h6074ar6ng9g4m7'),
	(8356,'2012-08-15 21:07:52','genisis','genisis','teachings,teachings-tags,teachings-series',1,0,'dkchdpvnq0iitrcr145bip6mc7'),
	(8357,'2012-08-15 21:08:00','genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'dkchdpvnq0iitrcr145bip6mc7'),
	(8358,'2012-08-15 21:08:21','genesis','genesis','downloads',1,0,'dkchdpvnq0iitrcr145bip6mc7'),
	(8359,'2012-08-15 21:08:37','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'dkchdpvnq0iitrcr145bip6mc7'),
	(8360,'2012-08-15 21:08:58','genesis','genesis','teachings',1,4,'dkchdpvnq0iitrcr145bip6mc7'),
	(8361,'2012-08-15 21:21:19','things god cannot do','things god cannot do','teachings,teachings-tags,teachings-series',1,2,'khcs60tn8cracdn5teq7ea6i37'),
	(8362,'2012-08-15 22:02:03','tad','tad','teachings,teachings-tags,teachings-series',1,5,'db6l3u6dq08cm70qhkqo0ests2'),
	(8363,'2012-08-15 22:24:38','matt 25','matt 25','teachings,teachings-tags,teachings-series',1,37,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8364,'2012-08-15 22:25:08','lilly in field','lilly in field','teachings,teachings-tags,teachings-series',1,0,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8365,'2012-08-15 22:25:24','lilly','lilly','teachings,teachings-tags,teachings-series',1,0,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8366,'2012-08-15 22:25:42','hope','hope','teachings,teachings-tags,teachings-series',1,10,'3gg11nqnat7rfhd0hl93dcvf73'),
	(8367,'2012-08-16 00:04:57','acts 1','acts 1','teachings,teachings-tags,teachings-series',1,50,'dfgge0o8amhvsbr1ipqp2s8k65'),
	(8368,'2012-08-16 00:05:32','acts 1','acts 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'dfgge0o8amhvsbr1ipqp2s8k65'),
	(8369,'2012-08-16 06:12:17','fatherhood','fatherhood','teachings,teachings-tags,teachings-series',1,1,'b2ob60jpsm97ind2nqjps625l1'),
	(8370,'2012-08-16 06:13:06','dad','dad','teachings,teachings-tags,teachings-series',1,4,'b2ob60jpsm97ind2nqjps625l1'),
	(8371,'2012-08-16 09:03:14','revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'nf20jeqb0lc4ln0k0vc7942ac4'),
	(8372,'2012-08-16 09:19:00','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'uon7foh4hvke3h3iuljqpe8ag1'),
	(8373,'2012-08-16 10:40:50','g1-','g1-','teachings,teachings-tags,teachings-series',1,0,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8374,'2012-08-16 10:41:21','Tad Slaughter','tad slaughter','teachings,teachings-tags,teachings-series',1,4,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8375,'2012-08-16 10:41:55','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',1,28,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8376,'2012-08-16 10:51:03','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8377,'2012-08-16 13:20:21','1 corinthians 14','1 corinthians 14','teachings,teachings-tags,teachings-series',1,51,'hkfbd4j4use6krh99m9di469a4'),
	(8378,'2012-08-16 13:20:54','women in the church','women in the church','teachings,teachings-tags,teachings-series',1,9,'hkfbd4j4use6krh99m9di469a4'),
	(8379,'2012-08-16 13:50:32','luke','luke','teachings,teachings-tags,teachings-series',1,53,'deccqgucssvbtv0956e8j0inf5'),
	(8380,'2012-08-16 13:50:44','luke','luke','teachings',1,52,'deccqgucssvbtv0956e8j0inf5'),
	(8381,'2012-08-16 13:50:56','luke','luke','teachings',1,52,'deccqgucssvbtv0956e8j0inf5'),
	(8382,'2012-08-16 17:08:25','women in the church','women in the church','teachings,teachings-tags,teachings-series',1,9,'hkfbd4j4use6krh99m9di469a4'),
	(8383,'2012-08-16 17:24:20','women in the church','women in the church','teachings,teachings-tags,teachings-series',1,9,'hkfbd4j4use6krh99m9di469a4'),
	(8384,'2012-08-16 17:24:30','sex before marraige','sex before marraige','teachings,teachings-tags,teachings-series',1,0,'hkfbd4j4use6krh99m9di469a4'),
	(8385,'2012-08-16 17:24:42','sex before marriage','sex before marriage','teachings,teachings-tags,teachings-series',1,0,'hkfbd4j4use6krh99m9di469a4'),
	(8386,'2012-08-16 17:24:56','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'hkfbd4j4use6krh99m9di469a4'),
	(8387,'2012-08-16 17:25:18','1 corinthians 7','1 corinthians 7','teachings,teachings-tags,teachings-series',1,51,'hkfbd4j4use6krh99m9di469a4'),
	(8388,'2012-08-16 17:26:36','sexual immorality','sexual immorality','teachings,teachings-tags,teachings-series',1,1,'hkfbd4j4use6krh99m9di469a4'),
	(8389,'2012-08-16 17:27:51','1 corinthians 7','1 corinthians 7','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'hkfbd4j4use6krh99m9di469a4'),
	(8390,'2012-08-16 17:27:56','1 corinthians 7','1 corinthians 7','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'hkfbd4j4use6krh99m9di469a4'),
	(8391,'2012-08-16 17:28:03','1 corinthians 7','1 corinthians 7','teachings-series',1,2,'hkfbd4j4use6krh99m9di469a4'),
	(8392,'2012-08-16 18:06:07','Luke 1','luke 1','teachings',5,52,'a6k0q0ajpa7liuh6fpsp1r6jd5'),
	(8393,'2012-08-16 18:07:07','Luke 2','luke 2','teachings',1,52,'a6k0q0ajpa7liuh6fpsp1r6jd5'),
	(8394,'2012-08-16 19:08:36','Numbers','numbers','teachings,teachings-tags,teachings-series',1,2,'fmk7nqpua6jc72spl6ht5jd0a1'),
	(8395,'2012-08-16 19:08:55','Numbers','numbers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'fmk7nqpua6jc72spl6ht5jd0a1'),
	(8396,'2012-08-16 19:09:11','numbers','numbers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'fmk7nqpua6jc72spl6ht5jd0a1'),
	(8397,'2012-08-16 19:12:25','number','number','teachings,teachings-tags,teachings-series',1,2,'6f13rdpd33lmboeev2617edbc7'),
	(8398,'2012-08-16 19:12:40','number','number','teachings',1,2,'6f13rdpd33lmboeev2617edbc7'),
	(8399,'2012-08-16 20:35:29','1kings','1kings','teachings,teachings-tags,teachings-series',1,0,'18p49vlmqldesuqt4jlthlci66'),
	(8400,'2012-08-16 20:35:40','chronicles','chronicles','teachings,teachings-tags,teachings-series',1,1,'18p49vlmqldesuqt4jlthlci66'),
	(8401,'2012-08-16 20:35:50','chronicles','chronicles','downloads',1,0,'18p49vlmqldesuqt4jlthlci66'),
	(8402,'2012-08-16 20:35:58','chronicles','chronicles','teachings',1,1,'18p49vlmqldesuqt4jlthlci66'),
	(8403,'2012-08-16 20:36:08','brin','brin','teachings',1,5,'18p49vlmqldesuqt4jlthlci66'),
	(8404,'2012-08-16 20:42:17','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8405,'2012-08-16 20:42:40','Luke 5','luke 5','teachings,teachings-tags,teachings-series',1,53,'dotgug5781917jq35278i8m6j4'),
	(8406,'2012-08-16 21:29:47','things god cannot do','things god cannot do','teachings,teachings-tags,teachings-series',1,2,'khcs60tn8cracdn5teq7ea6i37'),
	(8407,'2012-08-17 07:05:53','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'1en8be0shlpgfajecaqd1i2h72'),
	(8408,'2012-08-17 10:03:56','david\'s mighty men','david\'s mighty men','teachings,teachings-tags,teachings-series',1,1,'kqic55fi4jgv5ocuv1p77p8747'),
	(8409,'2012-08-17 10:04:37','2 Samuel 23','2 samuel 23','teachings,teachings-tags,teachings-series',1,6,'kqic55fi4jgv5ocuv1p77p8747'),
	(8410,'2012-08-17 10:04:57','2 Samuel 23 mighty men','2 samuel 23 mighty men','teachings,teachings-tags,teachings-series',1,0,'kqic55fi4jgv5ocuv1p77p8747'),
	(8411,'2012-08-17 10:05:04','2 Samuel 23 mighty men','2 samuel 23 mighty men','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kqic55fi4jgv5ocuv1p77p8747'),
	(8412,'2012-08-17 10:05:15','valor','valor','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kqic55fi4jgv5ocuv1p77p8747'),
	(8413,'2012-08-17 10:05:23','mighty men','mighty men','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'kqic55fi4jgv5ocuv1p77p8747'),
	(8414,'2012-08-17 10:05:33','mighty men','mighty men','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'kqic55fi4jgv5ocuv1p77p8747'),
	(8415,'2012-08-17 12:17:21','burn cds','burn cds','teachings,teachings-tags,teachings-series',1,0,'e4850uf0v3uj8k1lsu0ptbjkt3'),
	(8416,'2012-08-17 12:26:13','Luke 5','luke 5','teachings,teachings-tags,teachings-series',1,53,'dotgug5781917jq35278i8m6j4'),
	(8417,'2012-08-17 12:26:41','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8418,'2012-08-17 13:03:04','1 peter','1 peter','teachings,teachings-tags,teachings-series',1,14,'pluqbmv82qfd1tonr0cmnlrl03'),
	(8419,'2012-08-17 13:57:17','Philippians','philippians','teachings,teachings-tags,teachings-series',1,11,'l6kjjv1jbckviap5pnue1j7af2'),
	(8420,'2012-08-17 16:25:46','2 KINGS 21','2 kings 21','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jvs05bi9in9dbjnpqop947s0u0'),
	(8421,'2012-08-17 17:16:00','love your wife','love your wife','teachings,teachings-tags,teachings-series',1,0,'f8bmic23m4tq5ei4dnhqnvgba2'),
	(8422,'2012-08-17 17:16:09','wife','wife','teachings,teachings-tags,teachings-series',1,14,'f8bmic23m4tq5ei4dnhqnvgba2'),
	(8423,'2012-08-17 17:50:11','s0-188','s0-188','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7mqubc68vu2ft40337f0n9hi21'),
	(8424,'2012-08-17 17:56:01','S0-188','s0-188','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'4nmpl8o2ede6hhusfpeckrnmi1'),
	(8425,'2012-08-17 18:13:01','Luke 5','luke 5','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8426,'2012-08-17 20:34:53','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'mu3e678m42mqhgcpr18dbo8861'),
	(8427,'2012-08-17 20:35:05','revelation 1','revelation 1','teachings,teachings-tags,teachings-series',1,37,'mu3e678m42mqhgcpr18dbo8861'),
	(8428,'2012-08-17 21:50:38','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',1,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8429,'2012-08-17 21:58:08','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',1,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8430,'2012-08-17 21:58:27','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',2,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8431,'2012-08-17 21:58:44','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',3,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8432,'2012-08-17 21:59:02','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',1,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8433,'2012-08-17 21:59:22','guest speaker','guest speaker','teachings,teachings-tags,teachings-series',1,28,'8s7au3bft7hvo5ep5fr5a53im0'),
	(8434,'2012-08-18 06:01:31','galatians','galatians','teachings,teachings-tags,teachings-series',1,11,'ampbiacfla0h774d970ntgoer2'),
	(8435,'2012-08-18 06:01:46','galatians','galatians','teachings,teachings-tags,teachings-series',2,11,'ampbiacfla0h774d970ntgoer2'),
	(8436,'2012-08-18 09:40:09','numbers','numbers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'fmk7nqpua6jc72spl6ht5jd0a1'),
	(8437,'2012-08-18 09:49:08','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2818,'lf9tei5gpdd49r56ba0fargua6'),
	(8438,'2012-08-18 10:12:07','psalm 83','psalm 83','teachings,teachings-tags,teachings-series',1,3,'u1slvsecr30u237ns75lfjp736'),
	(8439,'2012-08-18 10:12:31','psalms','psalms','teachings,teachings-tags,teachings-series',1,1,'u1slvsecr30u237ns75lfjp736'),
	(8440,'2012-08-18 10:12:38','psalm','psalm','teachings,teachings-tags,teachings-series',1,3,'u1slvsecr30u237ns75lfjp736'),
	(8441,'2012-08-18 10:12:42','psalm','psalm','teachings',1,2,'u1slvsecr30u237ns75lfjp736'),
	(8442,'2012-08-18 10:12:46','psalm','psalm','teachings-series',1,0,'u1slvsecr30u237ns75lfjp736'),
	(8443,'2012-08-18 10:12:53','psalms','psalms','teachings-series',1,0,'u1slvsecr30u237ns75lfjp736'),
	(8444,'2012-08-18 10:12:56','psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'u1slvsecr30u237ns75lfjp736'),
	(8445,'2012-08-18 10:13:06','psalms','psalms','teachings,teachings-tags,teachings-series',1,1,'u1slvsecr30u237ns75lfjp736'),
	(8446,'2012-08-18 10:13:19','ezekia','ezekia','teachings,teachings-tags,teachings-series',1,2,'u1slvsecr30u237ns75lfjp736'),
	(8447,'2012-08-18 10:13:27','ezekia','ezekia','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'u1slvsecr30u237ns75lfjp736'),
	(8448,'2012-08-18 10:13:33','psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'u1slvsecr30u237ns75lfjp736'),
	(8449,'2012-08-18 10:13:40','ezekial','ezekial','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'u1slvsecr30u237ns75lfjp736'),
	(8450,'2012-08-18 10:13:48','psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'u1slvsecr30u237ns75lfjp736'),
	(8451,'2012-08-18 11:58:13','Saturday August 19','saturday august 19','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nm0dr9i34du1bbabvv3nrekni5'),
	(8452,'2012-08-18 15:07:59','The Gospel','the gospel','teachings,teachings-tags,teachings-series',1,15,'hvo8fsoktsfq5hfk28ird6i546'),
	(8453,'2012-08-18 15:08:36','The Gospel','the gospel','teachings,teachings-tags,teachings-series',2,15,'hvo8fsoktsfq5hfk28ird6i546'),
	(8454,'2012-08-18 15:08:52','The Gospel','the gospel','teachings,teachings-tags,teachings-series',1,15,'hvo8fsoktsfq5hfk28ird6i546'),
	(8455,'2012-08-18 15:47:34','Relitivism','relitivism','teachings,teachings-tags,teachings-series',1,0,'hvo8fsoktsfq5hfk28ird6i546'),
	(8456,'2012-08-18 15:47:44','Relativism','relativism','teachings,teachings-tags,teachings-series',1,4,'hvo8fsoktsfq5hfk28ird6i546'),
	(8457,'2012-08-18 18:09:24','Solomon','solomon','teachings',1,1,'en3qq0hgnkq4m2ogebojjh6q74'),
	(8458,'2012-08-18 18:42:56','guest','guest','teachings-tags',1,0,'3vb1qvhd03unorhgimqhf51a81'),
	(8459,'2012-08-18 18:43:10','hans','hans','teachings,teachings-tags,teachings-series',1,3,'3vb1qvhd03unorhgimqhf51a81'),
	(8460,'2012-08-18 21:08:51','jeff young','jeff young','teachings,teachings-tags,teachings-series',1,3,'k3qjagu0omt7if9flm5hia41d7'),
	(8461,'2012-08-18 23:25:02','High Priest','high priest','teachings,teachings-tags,teachings-series',1,1,'hvo8fsoktsfq5hfk28ird6i546'),
	(8462,'2012-08-18 23:25:33','High Priest','high priest','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'hvo8fsoktsfq5hfk28ird6i546'),
	(8463,'2012-08-18 23:25:41','Wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hvo8fsoktsfq5hfk28ird6i546'),
	(8464,'2012-08-18 23:25:45','wilsonville','wilsonville','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'hvo8fsoktsfq5hfk28ird6i546'),
	(8465,'2012-08-18 23:26:06','Brett Meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'hvo8fsoktsfq5hfk28ird6i546'),
	(8466,'2012-08-18 23:26:08','Brett Meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'hvo8fsoktsfq5hfk28ird6i546'),
	(8467,'2012-08-18 23:26:19','Brett Meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,12,'hvo8fsoktsfq5hfk28ird6i546'),
	(8468,'2012-08-18 23:26:29','Brett Meador','brett meador','teachings-tags',1,0,'hvo8fsoktsfq5hfk28ird6i546'),
	(8469,'2012-08-18 23:26:37','Relativism','relativism','teachings-tags',1,2,'hvo8fsoktsfq5hfk28ird6i546'),
	(8470,'2012-08-18 23:26:44','Relativism','relativism','teachings-tags',1,2,'hvo8fsoktsfq5hfk28ird6i546'),
	(8471,'2012-08-18 23:27:54','Psalm 19','psalm 19','teachings,teachings-tags,teachings-series',1,3,'hvo8fsoktsfq5hfk28ird6i546'),
	(8472,'2012-08-18 23:28:03','Psalm 19','psalm 19','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'hvo8fsoktsfq5hfk28ird6i546'),
	(8473,'2012-08-19 01:20:24','Dale Ebel','dale ebel','teachings,teachings-tags,teachings-series',1,0,'havfllth348ai45q5iqeopud85'),
	(8474,'2012-08-19 04:07:52','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,7,'ggncpaq5t5cqagrncrb21ctnk1'),
	(8475,'2012-08-19 07:01:03','August 11','august 11','teachings',1,0,'e5lb4kpo21gi5kvk9mn1nk6db6'),
	(8476,'2012-08-19 09:24:22','Ecclesiastes','ecclesiastes','teachings,teachings-tags,teachings-series',1,0,'u5u1upv0rd0kc1veid2e3b9cg6'),
	(8477,'2012-08-19 09:24:44','Ecclesiastes','ecclesiastes','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'u5u1upv0rd0kc1veid2e3b9cg6'),
	(8478,'2012-08-19 09:25:01','Ecclesiastes','ecclesiastes','teachings-series',1,0,'u5u1upv0rd0kc1veid2e3b9cg6'),
	(8479,'2012-08-19 09:43:55','romams','romams','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8480,'2012-08-19 09:44:14','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'kt3a62mv9b73e3he9defetagt0'),
	(8481,'2012-08-19 09:44:14','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'kt3a62mv9b73e3he9defetagt0'),
	(8482,'2012-08-19 09:46:06','romans','romans','downloads',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8483,'2012-08-19 09:46:19','joshua','joshua','downloads',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8484,'2012-08-19 09:46:27','joshua','joshua','downloads',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8485,'2012-08-19 09:46:42','joshua','joshua','teachings',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8486,'2012-08-19 09:46:56','joshua','joshua','downloads',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8487,'2012-08-19 09:47:06','joshua','joshua','teachings-series',1,0,'kt3a62mv9b73e3he9defetagt0'),
	(8488,'2012-08-19 09:47:25','joshua','joshua','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'kt3a62mv9b73e3he9defetagt0'),
	(8489,'2012-08-19 09:53:21','kid\'s camp','kid\'s camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jcr0sg3ucmmdn86g5b0k59mee6'),
	(8490,'2012-08-19 10:02:55','Jesus','jesus','teachings,teachings-tags,teachings-series',1,174,'g1jqb7ha7dcda0qpkttu2s88o5'),
	(8491,'2012-08-19 10:03:45','Jesus','jesus','teachings,teachings-tags,teachings-series',18,174,'g1jqb7ha7dcda0qpkttu2s88o5'),
	(8492,'2012-08-19 10:03:58','Jesus','jesus','events-recurring',1,1,'g1jqb7ha7dcda0qpkttu2s88o5'),
	(8493,'2012-08-19 11:22:36','Radio','radio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'afn7kg9intb9lb8opdul7ok9h5'),
	(8494,'2012-08-19 11:23:50','Radio','radio','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jfv9l2peemubpl2ek62b5ek961'),
	(8495,'2012-08-19 11:49:16','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'4nmpl8o2ede6hhusfpeckrnmi1'),
	(8496,'2012-08-19 11:49:49','Hebrews','hebrews','teachings',1,6,'4nmpl8o2ede6hhusfpeckrnmi1'),
	(8497,'2012-08-19 12:50:50','new years','new years','teachings,teachings-tags,teachings-series',1,0,'0btc0knd2j2jjk99qfeqm1cnm0'),
	(8498,'2012-08-19 12:51:38','new years eve service','new years eve service','teachings,teachings-tags,teachings-series',1,0,'0btc0knd2j2jjk99qfeqm1cnm0'),
	(8499,'2012-08-19 12:51:49','new years eve service','new years eve service','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0btc0knd2j2jjk99qfeqm1cnm0'),
	(8500,'2012-08-19 12:52:09','new years eve service','new years eve service','teachings,teachings-tags,teachings-series',1,0,'0btc0knd2j2jjk99qfeqm1cnm0'),
	(8501,'2012-08-19 14:43:45','App','app','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,49,'d1710fsiclt0vsrb7ln6aige94'),
	(8502,'2012-08-19 20:28:08','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8503,'2012-08-19 20:28:31','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8504,'2012-08-19 20:29:27','m1-548','m1-548','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8505,'2012-08-19 20:29:55','m1-549','m1-549','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8506,'2012-08-19 20:56:36','lazyness','lazyness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m0d7i9v17t4r3mn68ovh1g3s27'),
	(8507,'2012-08-19 20:56:48','lacking','lacking','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m0d7i9v17t4r3mn68ovh1g3s27'),
	(8508,'2012-08-19 21:04:11','Ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'19c40m467uj4sku4lu5a2i3u51'),
	(8509,'2012-08-19 21:17:24','john','john','teachings,teachings-tags,teachings-series',1,68,'fjdanpeq7nbc1o6dscv743un37'),
	(8510,'2012-08-20 05:34:48','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'iscn28t25trj3kuatfn2m12fc5'),
	(8511,'2012-08-20 05:35:09','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'iscn28t25trj3kuatfn2m12fc5'),
	(8512,'2012-08-20 05:35:26','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'iscn28t25trj3kuatfn2m12fc5'),
	(8513,'2012-08-20 07:39:35','tithing','tithing','teachings,teachings-tags,teachings-series',1,1,'b8ps40u28ir9pcjprq6d2ce842'),
	(8514,'2012-08-20 07:44:36','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8515,'2012-08-20 07:45:05','s1-530','s1-530','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8516,'2012-08-20 07:45:39','s1-531','s1-531','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8517,'2012-08-20 09:50:37','husbands','husbands','teachings,teachings-tags,teachings-series',1,4,'3v1qomges6aubgchuh7cp0hms6'),
	(8518,'2012-08-20 09:50:59','husbands','husbands','teachings,teachings-tags,teachings-series',1,4,'3v1qomges6aubgchuh7cp0hms6'),
	(8519,'2012-08-20 11:29:44','revelation 4 through 20','revelation 4 through 20','teachings,teachings-tags,teachings-series',1,2,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8520,'2012-08-20 11:31:03','revelation 4 through 20','revelation 4 through 20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8521,'2012-08-20 11:31:03','revelation 4 through 20','revelation 4 through 20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8522,'2012-08-20 12:55:56','jr high','jr high','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,28,'hrgsedabrnersqjeaf6ucdije3'),
	(8523,'2012-08-20 13:46:18','Mark 13','mark 13','teachings,teachings-tags,teachings-series',1,41,'dotgug5781917jq35278i8m6j4'),
	(8524,'2012-08-20 13:46:33','Mark 13','mark 13','teachings,teachings-tags,teachings-series',2,41,'dotgug5781917jq35278i8m6j4'),
	(8525,'2012-08-20 13:46:51','Mark 13','mark 13','teachings,teachings-tags,teachings-series',3,41,'dotgug5781917jq35278i8m6j4'),
	(8526,'2012-08-20 13:47:22','Like 13','like 13','teachings,teachings-tags,teachings-series',1,10,'dotgug5781917jq35278i8m6j4'),
	(8527,'2012-08-20 13:48:07','Luke 13','luke 13','teachings,teachings-tags,teachings-series',1,53,'dotgug5781917jq35278i8m6j4'),
	(8528,'2012-08-20 14:20:43','daniel 5','daniel 5','teachings,teachings-tags,teachings-series',1,4,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8529,'2012-08-20 14:58:01','mephibosheth','mephibosheth','teachings,teachings-tags,teachings-series',1,1,'kqic55fi4jgv5ocuv1p77p8747'),
	(8530,'2012-08-20 14:58:15','mephibosheth','mephibosheth','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'kqic55fi4jgv5ocuv1p77p8747'),
	(8531,'2012-08-20 15:54:33','patience','patience','teachings,teachings-tags,teachings-series',1,3,'shkcr1jtt692ilujh45ti93sq3'),
	(8532,'2012-08-20 16:29:32','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'gkps4rt9e42rqr39lpgs9tec13'),
	(8533,'2012-08-20 16:50:01','revelation 9','revelation 9','teachings,teachings-tags,teachings-series',1,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8534,'2012-08-20 16:51:07','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',1,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8535,'2012-08-20 16:51:24','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8536,'2012-08-20 16:55:39','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8537,'2012-08-20 18:15:35','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'kiosu9ssl6d1hfqhtglassln85'),
	(8538,'2012-08-20 18:18:49','Christmas','christmas','teachings,teachings-tags,teachings-series',1,8,'668o330jav728j59c26hc1ec81'),
	(8539,'2012-08-20 19:51:39','sign language','sign language','teachings,teachings-tags,teachings-series',1,0,'kbclffb62nen2bhnpc15l1cgl1'),
	(8540,'2012-08-20 19:52:05','asl','asl','teachings,teachings-tags,teachings-series',1,0,'kbclffb62nen2bhnpc15l1cgl1'),
	(8541,'2012-08-20 20:33:25','lazy','lazy','teachings,teachings-tags,teachings-series',1,0,'m0d7i9v17t4r3mn68ovh1g3s27'),
	(8542,'2012-08-20 20:34:10','discipline','discipline','teachings,teachings-tags,teachings-series',1,3,'m0d7i9v17t4r3mn68ovh1g3s27'),
	(8543,'2012-08-20 21:41:22','Matthew 6','matthew 6','teachings,teachings-tags,teachings-series',1,33,'icn4kago99omq7ff0s7j06h6f4'),
	(8544,'2012-08-20 21:41:56','Matthew 6','matthew 6','downloads',1,0,'icn4kago99omq7ff0s7j06h6f4'),
	(8545,'2012-08-21 06:03:19','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'1en8be0shlpgfajecaqd1i2h72'),
	(8546,'2012-08-21 06:03:26','colossians','colossians','downloads',1,0,'1en8be0shlpgfajecaqd1i2h72'),
	(8547,'2012-08-21 06:03:38','colossians','colossians','teachings',1,9,'1en8be0shlpgfajecaqd1i2h72'),
	(8548,'2012-08-21 09:39:49','REVELATIONS','Revelation','teachings,teachings-tags,teachings-series',1,37,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8549,'2012-08-21 09:45:36','REVELATIONS','Revelation','teachings,teachings-tags,teachings-series',2,37,'bdsp5e01spqrpve3kk2scfj4h6'),
	(8550,'2012-08-21 10:12:00','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',1,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8551,'2012-08-21 10:12:13','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8552,'2012-08-21 10:12:42','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8553,'2012-08-21 10:14:23','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'opfpc5s2n6k8e82t0f91520jo3'),
	(8554,'2012-08-21 10:18:58','Daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'opfpc5s2n6k8e82t0f91520jo3'),
	(8555,'2012-08-21 10:27:04','revelation 18','revelation 18','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8556,'2012-08-21 10:27:20','2 king 8','2 king 8','teachings,teachings-tags,teachings-series',1,57,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8557,'2012-08-21 10:27:51','2 king 8','2 king 8','teachings,teachings-tags,teachings-series',2,57,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8558,'2012-08-21 11:54:54','2 king 8','2 king 8','teachings,teachings-tags,teachings-series',2,57,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8559,'2012-08-21 11:55:07','2 king 8','2 king 8','teachings,teachings-tags,teachings-series',3,57,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8560,'2012-08-21 12:22:22','confession','confession','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8561,'2012-08-21 12:35:04','confession','confession','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8562,'2012-08-21 12:49:15','saved','saved','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8563,'2012-08-21 12:50:40','james','james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8564,'2012-08-21 12:51:12','book of james','book of james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8565,'2012-08-21 13:03:17','believe','believe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,35,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8566,'2012-08-21 13:05:08','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8567,'2012-08-21 13:17:13','Luke 13','luke 13','teachings,teachings-tags,teachings-series',1,53,'dotgug5781917jq35278i8m6j4'),
	(8568,'2012-08-21 13:17:36','Luke 13','luke 13','teachings,teachings-tags,teachings-series',2,53,'dotgug5781917jq35278i8m6j4'),
	(8569,'2012-08-21 13:18:02','Luke 13','luke 13','teachings,teachings-tags,teachings-series',3,53,'dotgug5781917jq35278i8m6j4'),
	(8570,'2012-08-21 13:18:37','Luke 13','luke 13','teachings,teachings-tags,teachings-series',4,53,'dotgug5781917jq35278i8m6j4'),
	(8571,'2012-08-21 13:18:55','Luke 13','luke 13','teachings,teachings-tags,teachings-series',5,53,'dotgug5781917jq35278i8m6j4'),
	(8572,'2012-08-21 13:36:41','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8573,'2012-08-21 14:10:04','exodus','exodus','teachings,teachings-tags,teachings-series',1,3,'i883mjom3t3pniu2152uokrjd4'),
	(8574,'2012-08-21 14:10:18','exodus','exodus','downloads',1,0,'i883mjom3t3pniu2152uokrjd4'),
	(8575,'2012-08-21 14:10:23','exodus','exodus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'i883mjom3t3pniu2152uokrjd4'),
	(8576,'2012-08-21 14:26:13','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8577,'2012-08-21 14:26:33','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8578,'2012-08-21 14:26:53','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',3,51,'tgt8j3eteh99ugj4eurg6nv6p0'),
	(8579,'2012-08-21 14:35:22','luke','luke','teachings,teachings-tags,teachings-series',1,53,'grdcup3eevrioce5fl3n5dn2d2'),
	(8580,'2012-08-21 14:41:03','exidus','exidus','teachings,teachings-tags,teachings-series',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8581,'2012-08-21 14:41:10','exidus','exidus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8582,'2012-08-21 14:41:19','exadus','exadus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8583,'2012-08-21 14:41:25','exadus','exadus','downloads',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8584,'2012-08-21 14:41:37','numbers','numbers','downloads',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8585,'2012-08-21 14:41:58','ten commandments','ten commandments','teachings,teachings-tags,teachings-series',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8586,'2012-08-21 14:42:05','ten commandments','ten commandments','teachings',1,0,'grdcup3eevrioce5fl3n5dn2d2'),
	(8587,'2012-08-21 15:09:45','Ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'84pu8odunq791lfq1cgrk1feu5'),
	(8588,'2012-08-21 15:39:55','Luke 13','luke 13','teachings,teachings-tags,teachings-series',5,53,'dotgug5781917jq35278i8m6j4'),
	(8589,'2012-08-21 15:57:08','Motocros','motocros','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'afn5d8vah2c89i9utaep34g1g6'),
	(8590,'2012-08-21 16:02:06','grace works','grace works','teachings,teachings-tags,teachings-series',1,2,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8591,'2012-08-21 16:05:32','August 20, 2012','august 20, 2012','teachings,teachings-tags,teachings-series',1,0,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8592,'2012-08-21 16:05:49','August 20, 2012','august 20, 2012','teachings',1,0,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8593,'2012-08-21 16:06:04','August 20','august 20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8594,'2012-08-21 16:06:18','August 19','august 19','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8595,'2012-08-21 16:06:46','August 19','august 19','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8596,'2012-08-21 16:07:02','August 19','august 19','teachings-tags',1,0,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(8597,'2012-08-21 16:49:51','Dispair','dispair','teachings-tags',1,0,'i1no9r8j0t1ogi2aqdj6l8nva6'),
	(8598,'2012-08-21 16:50:03','Despair','despair','teachings-tags',1,0,'i1no9r8j0t1ogi2aqdj6l8nva6'),
	(8599,'2012-08-21 16:50:55','doubt','doubt','teachings-tags',1,1,'i1no9r8j0t1ogi2aqdj6l8nva6'),
	(8600,'2012-08-21 16:54:45','disbaleaf','disbaleaf','teachings-tags',1,0,'bpn8gpef65h3fiq95c88m3ivd6'),
	(8601,'2012-08-21 16:55:15','disbelief','disbelief','teachings-tags',1,1,'bpn8gpef65h3fiq95c88m3ivd6'),
	(8602,'2012-08-21 16:57:04','debate','debate','teachings-tags',1,1,'i1no9r8j0t1ogi2aqdj6l8nva6'),
	(8603,'2012-08-21 17:35:26','2 king 8','2 king 8','teachings,teachings-tags,teachings-series',3,58,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8604,'2012-08-21 17:35:45','revelation 13','revelation 13','teachings,teachings-tags,teachings-series',1,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8605,'2012-08-21 17:35:59','revelation 13','revelation 13','teachings,teachings-tags,teachings-series',2,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8606,'2012-08-21 17:36:12','revelation 13','revelation 13','teachings,teachings-tags,teachings-series',3,37,'kgrmqvvsupbmmvmcb65t0bqmf1'),
	(8607,'2012-08-21 17:57:06','tuesday night motocross','tuesday night motocross','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'makuavjrslf19l7tii3k0l2fm7'),
	(8608,'2012-08-21 19:18:34','Psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'sse486sta0rc8cf6kckf7ca9d0'),
	(8609,'2012-08-21 23:40:22','encouragement','encouragement','teachings,teachings-tags,teachings-series',1,8,'lokj4eolspe8u4ng1hec78vij0'),
	(8610,'2012-08-22 04:33:44','agape love','agape love','teachings,teachings-tags,teachings-series',1,1,'iahfkgpiipbsrn442avvhhcs90'),
	(8611,'2012-08-22 08:35:52','Joshua','joshua','teachings,teachings-tags,teachings-series',1,1,'jemfr1o7bn56dfjuaipdlit0l2'),
	(8612,'2012-08-22 08:36:01','Joshua','joshua','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jemfr1o7bn56dfjuaipdlit0l2'),
	(8613,'2012-08-22 09:24:27','podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'hk5tkpd6qlbgt29nm766ugue06'),
	(8614,'2012-08-22 11:54:19','forsake','forsake','teachings,teachings-tags,teachings-series',1,1,'shkcr1jtt692ilujh45ti93sq3'),
	(8615,'2012-08-22 11:54:27','never','never','teachings,teachings-tags,teachings-series',1,1,'shkcr1jtt692ilujh45ti93sq3'),
	(8616,'2012-08-22 11:54:42','encourage','encourage','teachings,teachings-tags,teachings-series',1,14,'shkcr1jtt692ilujh45ti93sq3'),
	(8617,'2012-08-22 12:28:33','enoch','enoch','teachings,teachings-tags,teachings-series',1,1,'63ngrkseaf66q44v3u4q8tc2h2'),
	(8618,'2012-08-22 14:47:52','1 peter','1 peter','teachings,teachings-tags,teachings-series',1,14,'pq1g8goqd968uk5op0hh7okc22'),
	(8619,'2012-08-22 14:48:11','1 peter','1 peter','teachings,teachings-tags,teachings-series',2,14,'pq1g8goqd968uk5op0hh7okc22'),
	(8620,'2012-08-22 15:20:17','Luke 13','luke 13','teachings,teachings-tags,teachings-series',5,53,'dotgug5781917jq35278i8m6j4'),
	(8621,'2012-08-22 16:04:52','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8622,'2012-08-22 16:04:53','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'eqpc8a3fgsf74htd50jd1ov556'),
	(8623,'2012-08-22 16:05:12','revelation','revelation','downloads',1,0,'761nnbumrpih3ajt13vck4aek4'),
	(8624,'2012-08-22 16:05:13','revelation','revelation','downloads',1,0,'tal3uanrookuji80v83h65lpk5'),
	(8625,'2012-08-22 16:05:37','revelation','revelation','teachings',1,36,'761nnbumrpih3ajt13vck4aek4'),
	(8626,'2012-08-22 16:05:38','revelation','revelation','teachings',1,36,'dmv5ogo9kpm6v0rh39g2d8fpd4'),
	(8627,'2012-08-22 16:11:09','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8628,'2012-08-22 16:11:10','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'ru5eov74bjvmbtkdpbnt9sbv02'),
	(8629,'2012-08-22 17:23:03','online giving','online giving','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gfl7pvmcfjg0358h5hhs5mhuu1'),
	(8630,'2012-08-22 20:12:01','Jesus','jesus','teachings,teachings-tags,teachings-series',1,175,'m9ai1pcko054hila75b008g3f4'),
	(8631,'2012-08-22 20:43:20','Ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'j7t5218gng5f76ngvqjf2odjv2'),
	(8632,'2012-08-22 20:52:06','Hats','hats','teachings,teachings-tags,teachings-series',1,0,'fohnutmb2ba9keimo4vv17oib7'),
	(8633,'2012-08-22 20:52:50','Wearing hats','wearing hats','teachings,teachings-tags,teachings-series',1,0,'fohnutmb2ba9keimo4vv17oib7'),
	(8634,'2012-08-22 22:29:01','Luke','luke','teachings,teachings-tags,teachings-series',1,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8635,'2012-08-22 22:29:33','Luke','luke','teachings,teachings-tags,teachings-series',2,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8636,'2012-08-22 22:29:43','Luke','luke','teachings,teachings-tags,teachings-series',3,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8637,'2012-08-22 22:29:51','Luke','luke','teachings,teachings-tags,teachings-series',4,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8638,'2012-08-22 22:30:00','Luke','luke','teachings,teachings-tags,teachings-series',5,53,'fohnutmb2ba9keimo4vv17oib7'),
	(8639,'2012-08-22 23:30:26','M1568','m1568','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0e2b1ik8th47g2l6u2eg3j0114'),
	(8640,'2012-08-22 23:30:51','M1568','m1568','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0e2b1ik8th47g2l6u2eg3j0114'),
	(8641,'2012-08-22 23:31:06','m1-568','m1-568','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0e2b1ik8th47g2l6u2eg3j0114'),
	(8642,'2012-08-23 02:12:25','gentiles and jews','gentiles and jews','teachings,teachings-tags,teachings-series',1,3,'vdtraakkj2pode6eir7epe0rt6'),
	(8643,'2012-08-23 02:12:47','difference between jews and gentiles','difference between jews and gentiles','teachings,teachings-tags,teachings-series',1,0,'vdtraakkj2pode6eir7epe0rt6'),
	(8644,'2012-08-23 02:13:09','jews versus gentiles','jews versus gentiles','teachings,teachings-tags,teachings-series',1,0,'vdtraakkj2pode6eir7epe0rt6'),
	(8645,'2012-08-23 02:13:21','gentiles versus jews','gentiles versus jews','teachings,teachings-tags,teachings-series',1,0,'vdtraakkj2pode6eir7epe0rt6'),
	(8646,'2012-08-23 04:25:02','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'kiosu9ssl6d1hfqhtglassln85'),
	(8647,'2012-08-23 04:25:14','marriages','marriages','teachings,teachings-tags,teachings-series',1,2,'kiosu9ssl6d1hfqhtglassln85'),
	(8648,'2012-08-23 08:28:19','Love and respect','love and respect','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'l2ds9abm097cckouk8ckphvof4'),
	(8649,'2012-08-23 09:17:49','Motocros','motocros','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'afn5d8vah2c89i9utaep34g1g6'),
	(8650,'2012-08-23 10:13:07','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8651,'2012-08-23 10:13:09','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'ohqcjtq8hdjv8podqbnkor3871'),
	(8652,'2012-08-23 10:13:45','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8653,'2012-08-23 10:13:47','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'cnnpb90498g6d9a6med2vqjj24'),
	(8654,'2012-08-23 10:14:11','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8655,'2012-08-23 10:14:12','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'feh7u2ro09l40b8vp369p3j915'),
	(8656,'2012-08-23 10:14:36','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8657,'2012-08-23 10:14:37','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'23ojf8dkoligrrlqllbn4he4t4'),
	(8658,'2012-08-23 10:15:08','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8659,'2012-08-23 10:15:09','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'nsq9olnld8h95bci5a5ddn5fr0'),
	(8660,'2012-08-23 10:15:25','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8661,'2012-08-23 10:15:26','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'1erhp1j86hq9u98bhqcjobdhq0'),
	(8662,'2012-08-23 10:15:55','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8663,'2012-08-23 10:16:10','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8664,'2012-08-23 10:16:12','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'m47r9ksrj7jk8sj2asrun1l1q0'),
	(8665,'2012-08-23 10:16:25','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8666,'2012-08-23 10:16:41','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8667,'2012-08-23 10:16:42','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'lggpbm4uom97vah7khgafjodj4'),
	(8668,'2012-08-23 10:16:45','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8669,'2012-08-23 10:16:47','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'9sp558ggbgh0c5f1tbt2rpp6g7'),
	(8670,'2012-08-23 10:17:02','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8671,'2012-08-23 10:17:03','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'o0p42d1a6lv030t3f75vle15c5'),
	(8672,'2012-08-23 10:17:17','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8673,'2012-08-23 10:17:18','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'fsg62e0heqhfdm6610g63fv9g3'),
	(8674,'2012-08-23 10:17:37','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8675,'2012-08-23 10:17:38','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'fnf62v2ksrett39tchi1vopqc3'),
	(8676,'2012-08-23 10:17:55','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8677,'2012-08-23 10:18:12','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8678,'2012-08-23 10:18:29','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8679,'2012-08-23 10:18:46','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8680,'2012-08-23 10:19:05','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8681,'2012-08-23 10:19:20','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8682,'2012-08-23 10:19:35','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(8683,'2012-08-23 10:19:40','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8684,'2012-08-23 10:19:41','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'24v3qo267gmam4qcmjsmikoh56'),
	(8685,'2012-08-23 10:19:55','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8686,'2012-08-23 10:19:56','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'d0bg50l1h6tj4jc4i3r9bdhv01'),
	(8687,'2012-08-23 10:20:09','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8688,'2012-08-23 10:20:23','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8689,'2012-08-23 10:20:37','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8690,'2012-08-23 10:20:55','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8691,'2012-08-23 10:20:57','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'7s0bapp1pja15da3q14si1i7j3'),
	(8692,'2012-08-23 10:21:02','m','m','teachings,teachings-tags,teachings-series',1,0,'i7ijd12v27fdhi1avj0ouemut6'),
	(8693,'2012-08-23 10:21:09','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8694,'2012-08-23 10:21:11','m','m','teachings',1,0,'i7ijd12v27fdhi1avj0ouemut6'),
	(8695,'2012-08-23 10:21:20','works','works','teachings',1,3,'i7ijd12v27fdhi1avj0ouemut6'),
	(8696,'2012-08-23 10:21:23','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8697,'2012-08-23 10:21:39','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8698,'2012-08-23 10:21:52','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8699,'2012-08-23 10:22:07','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'761nnbumrpih3ajt13vck4aek4'),
	(8700,'2012-08-23 10:22:11','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8701,'2012-08-23 10:22:12','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'ctu7bnrb27minoh1s4hsrpebf0'),
	(8702,'2012-08-23 10:22:23','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8703,'2012-08-23 10:22:24','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'jdu581f8apu370nmkcp3uhitn1'),
	(8704,'2012-08-23 10:22:35','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8705,'2012-08-23 10:22:48','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8706,'2012-08-23 10:23:01','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8707,'2012-08-23 10:23:12','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8708,'2012-08-23 10:23:39','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8709,'2012-08-23 10:23:40','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'sfo75ad4ki4n036c9lbeob9qf5'),
	(8710,'2012-08-23 10:24:07','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'761nnbumrpih3ajt13vck4aek4'),
	(8711,'2012-08-23 10:24:09','revelation','revelation','teachings,teachings-tags,teachings-series',4,37,'oupt5jkssfe4tb8arl8bo8i0p4'),
	(8712,'2012-08-23 11:12:26','matthew 1','matthew 1','teachings,teachings-tags,teachings-series',1,33,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8713,'2012-08-23 11:12:56','mp3','mp3','teachings,teachings-tags,teachings-series',1,0,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8714,'2012-08-23 11:13:45','mp3','mp3','downloads',1,0,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8715,'2012-08-23 11:13:54','matthew','matthew','downloads',1,0,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8716,'2012-08-23 11:14:07','matthew','matthew','teachings-series',1,0,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8717,'2012-08-23 11:14:17','matthew','matthew','teachings',1,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8718,'2012-08-23 11:14:30','matthew','matthew','teachings',2,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8719,'2012-08-23 11:14:41','matthew','matthew','teachings',3,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8720,'2012-08-23 11:15:11','matthew','matthew','teachings',4,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8721,'2012-08-23 11:15:58','matthew','matthew','teachings',3,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8722,'2012-08-23 11:16:19','matthew','matthew','teachings',4,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8723,'2012-08-23 11:16:22','matthew','matthew','teachings',3,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8724,'2012-08-23 11:16:25','matthew','matthew','teachings',4,32,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8725,'2012-08-23 11:42:52','submit','submit','teachings,teachings-tags,teachings-series',1,6,'27mhsmh6eklifhr453ucifltp4'),
	(8726,'2012-08-23 11:43:20','submission','submission','teachings,teachings-tags,teachings-series',1,4,'27mhsmh6eklifhr453ucifltp4'),
	(8727,'2012-08-23 12:40:20','dodson','dodson','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'mab5ov3havttiobfraelg1dsg6'),
	(8728,'2012-08-23 12:41:24','Dunnahoo','dunnahoo','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'mab5ov3havttiobfraelg1dsg6'),
	(8729,'2012-08-23 12:42:03','West Linn','west linn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'mab5ov3havttiobfraelg1dsg6'),
	(8730,'2012-08-23 13:06:03','Psalm 114','psalm 114','teachings,teachings-tags,teachings-series',1,0,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8731,'2012-08-23 13:06:16','Psalm 114','psalm 114','teachings',1,0,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8732,'2012-08-23 13:06:21','Psalm 114','psalm 114','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8733,'2012-08-23 13:25:18','hebrews 8','hebrews 8','teachings,teachings-tags,teachings-series',1,8,'49vjd634qhpm9b0sqcdo3f2as3'),
	(8734,'2012-08-23 14:07:30','Phone number','phone number','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'qp9sji6rcuc754bmprksui0i07'),
	(8735,'2012-08-23 15:48:35','acts','acts','teachings,teachings-tags,teachings-series',1,50,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8736,'2012-08-23 15:48:55','acts','acts','teachings,teachings-tags,teachings-series',5,50,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8737,'2012-08-23 16:47:54','m1-568','m1-568','teachings,teachings-tags,teachings-series',1,1,'qp0a9f3b7hj946bq1etpo7kou3'),
	(8738,'2012-08-23 17:14:28','matthew','matthew','teachings,teachings-tags,teachings-series',1,33,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8739,'2012-08-23 17:14:58','matthew','matthew','teachings,teachings-tags,teachings-series',2,33,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8740,'2012-08-23 17:15:22','matthew','matthew','teachings,teachings-tags,teachings-series',3,33,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8741,'2012-08-23 17:15:33','matthew','matthew','teachings,teachings-tags,teachings-series',4,33,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8742,'2012-08-23 17:16:06','through the bible','through the bible','teachings,teachings-tags,teachings-series',1,201,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8743,'2012-08-23 17:16:26','through the bible','through the bible','teachings,teachings-tags,teachings-series',21,201,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8744,'2012-08-23 17:16:35','through the bible','through the bible','teachings,teachings-tags,teachings-series',20,201,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8745,'2012-08-23 17:17:37','through the bible','through the bible','teachings,teachings-tags,teachings-series',20,201,'sdj7grh6351inpkc5d7mhkt3m3'),
	(8746,'2012-08-23 18:40:14','Elders','elders','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'nvcrgmjajcjsq934dblu5tbn42'),
	(8747,'2012-08-23 18:40:34','elders','elders','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'nvcrgmjajcjsq934dblu5tbn42'),
	(8748,'2012-08-23 21:47:15','Exodus','exodus','teachings,teachings-tags,teachings-series',1,3,'5bk6007tvh8m8gfi9fsgdg8sk1'),
	(8749,'2012-08-23 22:28:59','something','something','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'hrkd9if4quhhptn7hd2up1ugt5'),
	(8750,'2012-08-23 22:30:00','something','something','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'hrkd9if4quhhptn7hd2up1ugt5'),
	(8751,'2012-08-24 07:04:15','Revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'j59djuleda1ov78mhsbujljff1'),
	(8752,'2012-08-24 09:37:54','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(8753,'2012-08-24 09:37:56','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'05e5pkcl9revakovcfo1irjsj7'),
	(8754,'2012-08-24 09:38:05','revelation','revelation','teachings-series',1,0,'761nnbumrpih3ajt13vck4aek4'),
	(8755,'2012-08-24 09:38:06','revelation','revelation','teachings-series',1,0,'7r6gk76h7pfg8njmcoqqrk2347'),
	(8756,'2012-08-24 09:38:18','revelation','revelation','teachings',1,36,'761nnbumrpih3ajt13vck4aek4'),
	(8757,'2012-08-24 09:38:20','revelation','revelation','teachings',1,36,'gsjup25f28q354dr8c91id6no1'),
	(8758,'2012-08-24 09:38:57','revelation','revelation','teachings',2,36,'761nnbumrpih3ajt13vck4aek4'),
	(8759,'2012-08-24 09:39:00','revelation','revelation','teachings',2,36,'fr73bisgai486lagdmcmbg8qm2'),
	(8760,'2012-08-24 09:39:39','revelation','revelation','teachings',2,36,'761nnbumrpih3ajt13vck4aek4'),
	(8761,'2012-08-24 09:39:40','revelation','revelation','teachings',2,36,'bp2lqabhid7jfiq3vbbhvue283'),
	(8762,'2012-08-24 09:40:14','revelation','revelation','teachings',2,36,'761nnbumrpih3ajt13vck4aek4'),
	(8763,'2012-08-24 09:40:15','revelation','revelation','teachings',2,36,'jjj2l1bv05prkl5a56p2nrpoo0'),
	(8764,'2012-08-24 09:40:32','revelation','revelation','teachings',3,36,'761nnbumrpih3ajt13vck4aek4'),
	(8765,'2012-08-24 09:40:33','revelation','revelation','teachings',3,36,'6gjpogl71ivm1gn4d3ksevnpt3'),
	(8766,'2012-08-24 09:41:08','revelation','revelation','teachings',3,36,'761nnbumrpih3ajt13vck4aek4'),
	(8767,'2012-08-24 09:41:09','revelation','revelation','teachings',3,36,'bv976s8g61dbiffbi9nfam4f34'),
	(8768,'2012-08-24 09:41:12','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8769,'2012-08-24 09:41:14','revelation','revelation','teachings',4,36,'vgg91v8d8g3l7rleuogr5is141'),
	(8770,'2012-08-24 09:41:33','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8771,'2012-08-24 09:41:34','revelation','revelation','teachings',4,36,'v2ckrf45f6g6tb40apbbh21bk5'),
	(8772,'2012-08-24 09:41:54','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8773,'2012-08-24 09:41:55','revelation','revelation','teachings',4,36,'kfvnbtehmt8asm205im6if1ic7'),
	(8774,'2012-08-24 09:42:13','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8775,'2012-08-24 09:42:14','revelation','revelation','teachings',4,36,'khrhajb5vsvd4ujdd02t7lf2d4'),
	(8776,'2012-08-24 09:42:33','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8777,'2012-08-24 09:42:34','revelation','revelation','teachings',4,36,'vj25dt49vqlatprkl627f24v35'),
	(8778,'2012-08-24 09:42:50','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8779,'2012-08-24 09:43:19','revelation','revelation','teachings',4,36,'761nnbumrpih3ajt13vck4aek4'),
	(8780,'2012-08-24 09:44:04','r-034','r-034','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8781,'2012-08-24 09:44:05','r-034','r-034','teachings',1,1,'d0eflv24a2hr4tjputgtvgqrs0'),
	(8782,'2012-08-24 09:44:26','r-034','r-034','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8783,'2012-08-24 09:44:27','r-034','r-034','teachings',1,1,'mc38262bvrarfi89ebqr3nonf2'),
	(8784,'2012-08-24 09:44:37','r-029','r-029','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8785,'2012-08-24 09:44:38','r-029','r-029','teachings',1,1,'nkue71okig0b17u0h1a1rafr86'),
	(8786,'2012-08-24 09:44:55','r-029','r-029','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8787,'2012-08-24 09:44:56','r-029','r-029','teachings',1,1,'sh1f2dr76mhbstu4uvq2ddn551'),
	(8788,'2012-08-24 09:45:03','r-030','r-030','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8789,'2012-08-24 09:45:04','r-030','r-030','teachings',1,1,'6748uid0k29tac3cb40vg7oim7'),
	(8790,'2012-08-24 09:45:20','r-030','r-030','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8791,'2012-08-24 09:45:22','r-030','r-030','teachings',1,1,'rgc1n3fm8erhst664qmiitss00'),
	(8792,'2012-08-24 09:45:27','r-031','r-031','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8793,'2012-08-24 09:45:28','r-031','r-031','teachings',1,1,'vn8k9ujhv82o417t7bf3rapqk4'),
	(8794,'2012-08-24 09:45:43','r-031','r-031','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8795,'2012-08-24 09:45:44','r-031','r-031','teachings',1,1,'vrhrihk038v6fsrmg9o2omprp3'),
	(8796,'2012-08-24 09:46:02','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2827,'jc82sgo2j8t82oo5q4s9tg3ot5'),
	(8797,'2012-08-24 09:51:56','Luke 13','luke 13','teachings,teachings-tags,teachings-series',5,53,'dotgug5781917jq35278i8m6j4'),
	(8798,'2012-08-24 09:53:25','r-031','r-031','teachings',1,1,'761nnbumrpih3ajt13vck4aek4'),
	(8799,'2012-08-24 09:53:26','r-031','r-031','teachings',1,1,'0smkkf9ll1uuno95vhgu84v3n7'),
	(8800,'2012-08-24 09:53:33','r-031','r-031','downloads',1,0,'761nnbumrpih3ajt13vck4aek4'),
	(8801,'2012-08-24 09:53:34','r-031','r-031','downloads',1,0,'9e96t60lajgm6v8moa63hfouc7'),
	(8802,'2012-08-24 13:24:21','bryn','bryn','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'e3bm3r9k5p305g5rhhs6evps97'),
	(8803,'2012-08-24 13:26:44','moto','moto','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'e3bm3r9k5p305g5rhhs6evps97'),
	(8804,'2012-08-24 13:27:14','moto','moto','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'e3bm3r9k5p305g5rhhs6evps97'),
	(8805,'2012-08-24 13:27:29','moto','moto','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'e3bm3r9k5p305g5rhhs6evps97'),
	(8806,'2012-08-24 13:46:41','galatians 3','galatians 3','teachings,teachings-tags,teachings-series',1,11,'ampbiacfla0h774d970ntgoer2'),
	(8807,'2012-08-24 13:46:53','galatians 3','galatians 3','teachings,teachings-tags,teachings-series',2,11,'ampbiacfla0h774d970ntgoer2'),
	(8808,'2012-08-24 13:47:26','galatians 3','galatians 3','teachings,teachings-tags,teachings-series',2,11,'ampbiacfla0h774d970ntgoer2'),
	(8809,'2012-08-24 13:47:45','isaiah 5','isaiah 5','teachings,teachings-tags,teachings-series',1,5,'ampbiacfla0h774d970ntgoer2'),
	(8810,'2012-08-24 13:48:14','isaiah 6','isaiah 6','teachings,teachings-tags,teachings-series',1,5,'ampbiacfla0h774d970ntgoer2'),
	(8811,'2012-08-24 13:48:33','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'ampbiacfla0h774d970ntgoer2'),
	(8812,'2012-08-24 17:54:12','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'j7esk8l5sjmcl7u280cisf0827'),
	(8813,'2012-08-24 17:54:29','hebrews','hebrews','teachings',1,8,'j7esk8l5sjmcl7u280cisf0827'),
	(8814,'2012-08-24 17:55:12','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'j7esk8l5sjmcl7u280cisf0827'),
	(8815,'2012-08-24 17:55:23','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'j7esk8l5sjmcl7u280cisf0827'),
	(8816,'2012-08-24 17:55:31','hebrews','hebrews','events-recurring',1,1,'j7esk8l5sjmcl7u280cisf0827'),
	(8817,'2012-08-24 17:56:03','hebrews','hebrews','teachings',1,8,'j7esk8l5sjmcl7u280cisf0827'),
	(8818,'2012-08-24 17:56:10','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'j7esk8l5sjmcl7u280cisf0827'),
	(8819,'2012-08-24 21:43:56','Trail fellowship','trail fellowship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'j59djuleda1ov78mhsbujljff1'),
	(8820,'2012-08-24 22:24:35','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'emcnlh6dcrien8s9kor4bfurl4'),
	(8821,'2012-08-24 22:24:54','end times','end times','teachings,teachings-tags,teachings-series',1,16,'emcnlh6dcrien8s9kor4bfurl4'),
	(8822,'2012-08-24 23:00:51','pastor brett','pastor brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,91,'c0cmogs3v5ibsoaj719hcn3oh6'),
	(8823,'2012-08-24 23:03:55','pastor brett','pastor brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,91,'c0cmogs3v5ibsoaj719hcn3oh6'),
	(8824,'2012-08-24 23:04:22','pastor brett','pastor brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,91,'c0cmogs3v5ibsoaj719hcn3oh6'),
	(8825,'2012-08-24 23:13:23','Luke 13','luke 13','teachings,teachings-tags,teachings-series',5,53,'dotgug5781917jq35278i8m6j4'),
	(8826,'2012-08-25 01:53:08','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2827,'g3th9l6cqc0sflu4em4i79j530'),
	(8827,'2012-08-25 05:26:16','galatians','galatians','teachings,teachings-tags,teachings-series',1,11,'ampbiacfla0h774d970ntgoer2'),
	(8828,'2012-08-25 05:26:27','galatians','galatians','teachings,teachings-tags,teachings-series',2,11,'ampbiacfla0h774d970ntgoer2'),
	(8829,'2012-08-25 10:45:43','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'p2bdvirroirefmm9e4e8q66gn5'),
	(8830,'2012-08-25 11:29:52','Relativism','relativism','teachings-tags',1,2,'hvo8fsoktsfq5hfk28ird6i546'),
	(8831,'2012-08-25 11:30:07','Relativism','relativism','teachings-tags',1,2,'hvo8fsoktsfq5hfk28ird6i546'),
	(8832,'2012-08-25 13:15:34','Simple','simple','teachings-tags',1,1,'ngqiknr86t6uq9eu9f3e2dvvi2'),
	(8833,'2012-08-25 16:10:48','Word','word','teachings,teachings-tags,teachings-series',1,58,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8834,'2012-08-25 16:12:12','Bible','bible','teachings,teachings-tags,teachings-series',1,224,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8835,'2012-08-25 16:12:34','Bible study','bible study','teachings,teachings-tags,teachings-series',1,189,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8836,'2012-08-25 16:13:09','Read your bible','read your bible','teachings,teachings-tags,teachings-series',1,0,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8837,'2012-08-25 16:13:37','Being biblical','being biblical','teachings,teachings-tags,teachings-series',1,0,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8838,'2012-08-25 16:13:46','biblically','biblically','teachings,teachings-tags,teachings-series',1,0,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8839,'2012-08-25 16:14:03','Word','word','teachings,teachings-tags,teachings-series',1,58,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8840,'2012-08-25 16:53:22','Word','word','teachings,teachings-tags,teachings-series',1,58,'jmqvctsv14a9j7j47jfb0p7c75'),
	(8841,'2012-08-25 19:01:41','exodus','exodus','teachings,teachings-tags,teachings-series',1,3,'grdcup3eevrioce5fl3n5dn2d2'),
	(8842,'2012-08-25 21:48:17','things god cannot do','things god cannot do','teachings,teachings-tags,teachings-series',1,2,'khcs60tn8cracdn5teq7ea6i37'),
	(8843,'2012-08-25 22:06:37','Luke','luke','teachings,teachings-tags,teachings-series',5,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8844,'2012-08-25 22:06:54','Luke','luke','teachings,teachings-tags,teachings-series',4,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8845,'2012-08-25 22:07:04','Luke','luke','teachings,teachings-tags,teachings-series',3,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8846,'2012-08-25 22:07:13','Luke','luke','teachings,teachings-tags,teachings-series',2,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8847,'2012-08-25 22:07:21','Luke','luke','teachings,teachings-tags,teachings-series',1,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8848,'2012-08-26 00:31:35','Word','word','teachings,teachings-tags,teachings-series',1,58,'6pn1ck5i8ekm0p4nmgjdh91l53'),
	(8849,'2012-08-26 11:33:04','Acts 1-3','acts 1-3','teachings,teachings-tags,teachings-series',1,3,'dfgge0o8amhvsbr1ipqp2s8k65'),
	(8850,'2012-08-26 13:22:33','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,39,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8851,'2012-08-26 13:23:16','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,39,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8852,'2012-08-26 13:23:53','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,39,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8853,'2012-08-26 13:24:15','pray','pray','teachings',1,13,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8854,'2012-08-26 13:29:13','pray','pray','teachings',1,13,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8855,'2012-08-26 13:29:17','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,39,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8856,'2012-08-26 13:29:55','mathew','mathew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8857,'2012-08-26 13:30:26','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8858,'2012-08-26 13:30:40','matthew','matthew','teachings',1,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8859,'2012-08-26 13:31:02','matthew','matthew','teachings',2,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8860,'2012-08-26 13:31:21','matthew','matthew','teachings',3,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8861,'2012-08-26 13:31:36','matthew','matthew','teachings',4,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8862,'2012-08-26 13:31:52','matthew','matthew','teachings',3,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8863,'2012-08-26 13:31:56','matthew','matthew','teachings',2,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8864,'2012-08-26 13:31:59','matthew','matthew','teachings',1,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8865,'2012-08-26 13:32:35','matthew','matthew','teachings',2,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8866,'2012-08-26 13:32:45','matthew','matthew','teachings',1,32,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8867,'2012-08-26 13:32:47','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8868,'2012-08-26 13:33:17','matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8869,'2012-08-26 13:33:42','matthew 10','matthew 10','teachings-series',1,0,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8870,'2012-08-26 13:33:50','matthew 10','matthew 10','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8871,'2012-08-26 13:34:19','worry','worry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8872,'2012-08-26 13:34:31','worry','worry','teachings',1,1,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8873,'2012-08-26 13:35:54','worry','worry','teachings',1,1,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8874,'2012-08-26 13:35:57','worry','worry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8875,'2012-08-26 15:11:57','Worship','worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'qauv9jngjb7ad20juh06vkih27'),
	(8876,'2012-08-26 15:12:31','Worship','worship','downloads',1,0,'qauv9jngjb7ad20juh06vkih27'),
	(8877,'2012-08-26 15:12:44','Album','album','downloads',1,0,'qauv9jngjb7ad20juh06vkih27'),
	(8878,'2012-08-26 15:12:51','Album','album','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qauv9jngjb7ad20juh06vkih27'),
	(8879,'2012-08-26 15:30:41','leviticus','leviticus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pt2e1dcsr0ddi462k499pd9c65'),
	(8880,'2012-08-26 19:24:51','know','know','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,28,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8881,'2012-08-26 19:25:56','joel','joel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8882,'2012-08-26 20:46:02','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'ruvk8ue29a5uucm58uj0cgs4v2'),
	(8883,'2012-08-26 20:52:06','homosexuality','homosexuality','teachings-tags',1,1,'ruvk8ue29a5uucm58uj0cgs4v2'),
	(8884,'2012-08-26 20:52:49','prophecy update','prophecy update','teachings-tags',1,1,'ruvk8ue29a5uucm58uj0cgs4v2'),
	(8885,'2012-08-26 20:54:23','prophecy','prophecy','teachings-tags',1,2,'ruvk8ue29a5uucm58uj0cgs4v2'),
	(8886,'2012-08-26 22:17:30','Luke','luke','teachings,teachings-tags,teachings-series',1,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8887,'2012-08-26 22:17:46','Luke','luke','teachings,teachings-tags,teachings-series',4,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8888,'2012-08-26 22:17:55','Luke','luke','teachings,teachings-tags,teachings-series',5,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8889,'2012-08-27 10:59:38','revolations','revolations','teachings,teachings-tags,teachings-series',1,0,'ic1am5uhvuq86krc2rhilinoh4'),
	(8890,'2012-08-27 11:01:52','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'ic1am5uhvuq86krc2rhilinoh4'),
	(8891,'2012-08-27 11:04:16','Hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'ic1am5uhvuq86krc2rhilinoh4'),
	(8892,'2012-08-27 11:05:28','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'ic1am5uhvuq86krc2rhilinoh4'),
	(8893,'2012-08-27 11:05:43','revolations','revolations','teachings,teachings-tags,teachings-series',1,0,'ic1am5uhvuq86krc2rhilinoh4'),
	(8894,'2012-08-27 11:08:05','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'fu8qcg4eiktomc6o9la070ei06'),
	(8895,'2012-08-27 14:33:08','holyspirit','holyspirit','teachings,teachings-tags,teachings-series',1,0,'ob1rqtafvv2te9heem0p2emfe0'),
	(8896,'2012-08-27 14:57:36','s1591','s1591','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gib1f37sgdhvuv6vsvhilu6h3'),
	(8897,'2012-08-27 14:57:42','s1591','s1591','downloads',1,0,'7gib1f37sgdhvuv6vsvhilu6h3'),
	(8898,'2012-08-27 14:57:50','s1591','s1591','teachings',1,0,'7gib1f37sgdhvuv6vsvhilu6h3'),
	(8899,'2012-08-27 14:57:53','s1591','s1591','teachings-tags',1,0,'7gib1f37sgdhvuv6vsvhilu6h3'),
	(8900,'2012-08-27 14:58:00','s1591','s1591','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gib1f37sgdhvuv6vsvhilu6h3'),
	(8901,'2012-08-27 18:43:09','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8902,'2012-08-27 18:44:05','m1-548','m1-548','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8903,'2012-08-27 18:44:43','m1-550','m1-550','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8904,'2012-08-27 18:49:23','Keith Dobson','keith dobson','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vpubja8hkatk54to1cvtug5cd3'),
	(8905,'2012-08-27 18:51:34','deacons','deacons','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'vpubja8hkatk54to1cvtug5cd3'),
	(8906,'2012-08-27 20:55:09','deuteromony','deuteromony','teachings,teachings-tags,teachings-series',1,0,'rpmjonfg7l0p6eou4l8r016po7'),
	(8907,'2012-08-27 20:55:14','nomy','nomy','teachings,teachings-tags,teachings-series',1,3,'rpmjonfg7l0p6eou4l8r016po7'),
	(8908,'2012-08-27 21:09:06','psalms 83','psalms 83','teachings,teachings-tags,teachings-series',1,1,'76r3dh3tpohchvfkb1vteppld5'),
	(8909,'2012-08-27 21:09:47','psalms 83','psalms 83','teachings',1,1,'76r3dh3tpohchvfkb1vteppld5'),
	(8910,'2012-08-27 21:10:16','psalms','psalms','teachings',1,1,'76r3dh3tpohchvfkb1vteppld5'),
	(8911,'2012-08-27 21:10:28','psalms 83','psalms 83','teachings',1,1,'76r3dh3tpohchvfkb1vteppld5'),
	(8912,'2012-08-27 21:10:33','psalms 83','psalms 83','teachings,teachings-tags,teachings-series',1,1,'76r3dh3tpohchvfkb1vteppld5'),
	(8913,'2012-08-27 21:14:17','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'k3qjagu0omt7if9flm5hia41d7'),
	(8914,'2012-08-27 21:19:17','M1-238','m1-238','teachings,teachings-tags,teachings-series',1,0,'tlgcbahd2d6lojfnesrvpl34e0'),
	(8915,'2012-08-27 21:19:42','Psalms 83','psalms 83','teachings,teachings-tags,teachings-series',1,1,'tlgcbahd2d6lojfnesrvpl34e0'),
	(8916,'2012-08-27 21:20:02','Psalms 83','psalms 83','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'tlgcbahd2d6lojfnesrvpl34e0'),
	(8917,'2012-08-27 21:20:43','psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'tlgcbahd2d6lojfnesrvpl34e0'),
	(8918,'2012-08-28 06:40:13','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,9,'mc903q8l7g4imi4r3v0e5uim27'),
	(8919,'2012-08-28 06:40:47','Hebrews 5','hebrews 5','teachings,teachings-tags,teachings-series',1,9,'mc903q8l7g4imi4r3v0e5uim27'),
	(8920,'2012-08-28 07:43:25','m1-547','m1-547','teachings,teachings-tags,teachings-series',1,1,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8921,'2012-08-28 07:44:11','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',1,51,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8922,'2012-08-28 07:44:47','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',2,51,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8923,'2012-08-28 07:45:05','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',3,51,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8924,'2012-08-28 07:45:33','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',4,51,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8925,'2012-08-28 07:46:09','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',5,51,'e7clvh0d3gbbjhbcu301llmmp1'),
	(8926,'2012-08-28 08:03:11','the power of the holyspirit','the power of the holyspirit','teachings,teachings-tags,teachings-series',1,0,'ob1rqtafvv2te9heem0p2emfe0'),
	(8927,'2012-08-28 08:03:47','the power of the holyspirit','the power of the holyspirit','teachings-tags',1,0,'ob1rqtafvv2te9heem0p2emfe0'),
	(8928,'2012-08-28 08:04:20','holyspirit','holyspirit','teachings-tags',1,0,'ob1rqtafvv2te9heem0p2emfe0'),
	(8929,'2012-08-28 08:05:06','Holy spirit','holy spirit','teachings-tags',1,1,'ob1rqtafvv2te9heem0p2emfe0'),
	(8930,'2012-08-28 08:07:49','Holy spirit','holy spirit','teachings-series',1,1,'ob1rqtafvv2te9heem0p2emfe0'),
	(8931,'2012-08-28 09:17:47','Luke','luke','teachings,teachings-tags,teachings-series',5,53,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8932,'2012-08-28 09:17:56','John','john','teachings,teachings-tags,teachings-series',1,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8933,'2012-08-28 12:05:14','submit','submit','teachings,teachings-tags,teachings-series',1,6,'27mhsmh6eklifhr453ucifltp4'),
	(8934,'2012-08-28 12:11:04','mark','mark','teachings,teachings-tags,teachings-series',1,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8935,'2012-08-28 12:11:32','mark','mark','teachings,teachings-tags,teachings-series',2,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8936,'2012-08-28 12:11:51','mark','mark','teachings,teachings-tags,teachings-series',3,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8937,'2012-08-28 12:12:04','mark','mark','teachings,teachings-tags,teachings-series',4,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8938,'2012-08-28 12:12:17','mark','mark','teachings,teachings-tags,teachings-series',5,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8939,'2012-08-28 12:12:25','mark','mark','teachings,teachings-tags,teachings-series',4,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8940,'2012-08-28 12:12:25','mark','mark','teachings,teachings-tags,teachings-series',3,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8941,'2012-08-28 12:12:25','mark','mark','teachings,teachings-tags,teachings-series',2,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8942,'2012-08-28 12:12:30','mark','mark','teachings,teachings-tags,teachings-series',1,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8943,'2012-08-28 12:13:36','mark','mark','teachings,teachings-tags,teachings-series',1,41,'520vagsi86jqsanqt9d4j97mc6'),
	(8944,'2012-08-28 13:21:04','Roman Marrs','roman marrs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'mab5ov3havttiobfraelg1dsg6'),
	(8945,'2012-08-28 13:39:08','Joshua','joshua','teachings,teachings-tags,teachings-series',1,3,'jemfr1o7bn56dfjuaipdlit0l2'),
	(8946,'2012-08-28 15:02:04','separation','separation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8947,'2012-08-28 15:29:16','separation','separation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8948,'2012-08-28 18:53:48','lost','lost','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8949,'2012-08-28 18:54:16','lost','lost','downloads',1,0,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8950,'2012-08-28 18:54:21','lost','lost','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8951,'2012-08-28 19:12:15','lost','lost','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'1q6sj2b2qh2u6ctpvsmkh6fob6'),
	(8952,'2012-08-28 19:17:42','a prayer with a promise','a prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36');

INSERT INTO `sym_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`)
VALUES
	(8953,'2012-08-28 19:18:30','prayer with a promise','prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8954,'2012-08-28 19:18:38','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,40,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8955,'2012-08-28 19:19:00','pray','pray','downloads',1,0,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8956,'2012-08-28 19:19:10','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,40,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8957,'2012-08-28 19:20:08','prauer','prauer','teachings-tags',1,0,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8958,'2012-08-28 19:20:17','prayer','prayer','teachings-tags',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8959,'2012-08-28 19:23:15','prayer with a promise','prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8960,'2012-08-28 19:23:20','prayer with a promise','prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8961,'2012-08-28 19:23:36','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,201,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(8962,'2012-08-28 22:29:08','M1-569','m1-569','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0e2b1ik8th47g2l6u2eg3j0114'),
	(8963,'2012-08-28 22:30:53','m1-569','m1-569','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'0e2b1ik8th47g2l6u2eg3j0114'),
	(8964,'2012-08-29 07:17:34','John 1','john 1','teachings-tags',1,3,'p00jikp7669961m5bmacqlefl2'),
	(8965,'2012-08-29 09:29:29','Jesus','jesus','teachings,teachings-tags,teachings-series',1,177,'ksi47b2he4r5s44iuroeteuf96'),
	(8966,'2012-08-29 09:41:38','Jesus','jesus','teachings,teachings-tags,teachings-series',1,177,'ksi47b2he4r5s44iuroeteuf96'),
	(8967,'2012-08-29 09:42:17','jesus','jesus','teachings,teachings-tags,teachings-series',1,177,'ksi47b2he4r5s44iuroeteuf96'),
	(8968,'2012-08-29 09:42:38','Jesus','jesus','teachings,teachings-tags,teachings-series',1,177,'ksi47b2he4r5s44iuroeteuf96'),
	(8969,'2012-08-29 11:33:59','ezechiel','ezechiel','teachings,teachings-tags,teachings-series',1,0,'p6vjgf7mv4c593uj2c5p90hna2'),
	(8970,'2012-08-29 11:34:08','ezekiel','ezekiel','teachings,teachings-tags,teachings-series',1,3,'p6vjgf7mv4c593uj2c5p90hna2'),
	(8971,'2012-08-29 11:34:24','ezekiel','ezekiel','downloads',1,0,'p6vjgf7mv4c593uj2c5p90hna2'),
	(8972,'2012-08-29 16:08:57','rELATIVISM','relativism','teachings-tags',1,2,'jmqvctsv14a9j7j47jfb0p7c75'),
	(8973,'2012-08-29 16:09:12','rELATIVISM','relativism','teachings-tags',1,2,'jmqvctsv14a9j7j47jfb0p7c75'),
	(8974,'2012-08-29 18:23:32','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,10,'eb5dq5ope5ik6arddcvkk2sp46'),
	(8975,'2012-08-29 18:23:40','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'eb5dq5ope5ik6arddcvkk2sp46'),
	(8976,'2012-08-29 20:06:47','1 Corinth','1 corinth','teachings,teachings-tags,teachings-series',1,53,'9eck2vf4qlje7orjbjb2c3plb0'),
	(8977,'2012-08-29 20:07:30','1 Corinthian 12','1 corinthian 12','teachings,teachings-tags,teachings-series',1,52,'9eck2vf4qlje7orjbjb2c3plb0'),
	(8978,'2012-08-29 20:08:13','1 Corinthian 12','1 corinthian 12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'9eck2vf4qlje7orjbjb2c3plb0'),
	(8979,'2012-08-29 20:08:37','1 Corinthian 12','1 corinthian 12','teachings-series',1,2,'9eck2vf4qlje7orjbjb2c3plb0'),
	(8980,'2012-08-29 20:26:45','revalation 2','revalation 2','teachings,teachings-tags,teachings-series',1,0,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8981,'2012-08-29 20:26:55','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8982,'2012-08-29 20:27:15','revelation 2','revelation 2','teachings,teachings-tags,teachings-series',1,37,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8983,'2012-08-29 20:27:45','revelation 2','revelation 2','downloads',1,0,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8984,'2012-08-29 20:27:56','revelation 2','revelation 2','teachings-series',1,0,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8985,'2012-08-29 20:28:14','revelation','revelation','teachings-series',1,0,'3j2u01t6atpojbulc5ar2q0ub7'),
	(8986,'2012-08-30 05:01:39','hebrews 6','hebrews 6','teachings,teachings-tags,teachings-series',1,10,'mc903q8l7g4imi4r3v0e5uim27'),
	(8987,'2012-08-30 05:02:01','hebrews 6','hebrews 6','teachings',1,9,'mc903q8l7g4imi4r3v0e5uim27'),
	(8988,'2012-08-30 05:02:40','hebrews 6','hebrews 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'mc903q8l7g4imi4r3v0e5uim27'),
	(8989,'2012-08-30 05:03:05','hebrews 6','hebrews 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,12,'mc903q8l7g4imi4r3v0e5uim27'),
	(8990,'2012-08-30 06:31:33','ppppppp','ppppppp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ftr7hgt0t2m80ghhhpf470bjr2'),
	(8991,'2012-08-30 09:14:52','John','john','teachings,teachings-tags,teachings-series',1,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8992,'2012-08-30 09:15:06','John','john','teachings,teachings-tags,teachings-series',2,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8993,'2012-08-30 09:15:16','John','john','teachings,teachings-tags,teachings-series',3,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8994,'2012-08-30 09:15:25','John','john','teachings,teachings-tags,teachings-series',5,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8995,'2012-08-30 09:15:33','John','john','teachings,teachings-tags,teachings-series',7,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(8996,'2012-08-30 09:15:39','election','election','teachings,teachings-tags,teachings-series',1,0,'pvib8nh4836b37lalcqfi743l3'),
	(8997,'2012-08-30 09:15:56','elect','elect','teachings,teachings-tags,teachings-series',1,2,'pvib8nh4836b37lalcqfi743l3'),
	(8998,'2012-08-30 09:16:04','election','election','teachings,teachings-tags,teachings-series',1,0,'pvib8nh4836b37lalcqfi743l3'),
	(8999,'2012-08-30 09:19:10','calvinism','calvinism','teachings,teachings-tags,teachings-series',1,2,'pvib8nh4836b37lalcqfi743l3'),
	(9000,'2012-08-30 09:19:49','calvinism','calvinism','teachings,teachings-tags,teachings-series',1,2,'pvib8nh4836b37lalcqfi743l3'),
	(9001,'2012-08-30 12:31:05','separate','separate','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,29,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9002,'2012-08-30 13:05:11','acts','acts','teachings,teachings-tags,teachings-series',1,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9003,'2012-08-30 13:05:46','acts','acts','teachings',1,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9004,'2012-08-30 13:05:55','acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9005,'2012-08-30 13:06:05','acts','acts','downloads',1,0,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9006,'2012-08-30 13:06:09','acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9007,'2012-08-30 13:06:15','acts','acts','teachings',1,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9008,'2012-08-30 13:06:31','acts','acts','teachings',2,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9009,'2012-08-30 13:06:53','acts','acts','teachings',3,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9010,'2012-08-30 13:07:31','acts','acts','teachings',4,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9011,'2012-08-30 13:08:07','acts','acts','teachings',5,50,'qcc4n7dha9f88rk9p2j3mo91n0'),
	(9012,'2012-08-30 13:33:59','cold','cold','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9013,'2012-08-30 15:47:02','salvation','salvation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9014,'2012-08-30 15:48:19','sin','sin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,84,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9015,'2012-08-30 15:48:33','MARRIAGE','marriage','teachings-tags',1,4,'ad2ucndov4brao02c55m31qi90'),
	(9016,'2012-08-30 15:49:01','sin','sin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,84,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9017,'2012-08-30 17:11:22','idolatry','idolatry','teachings-tags',1,1,'llk1dcdfo83cqbv6g5ldqdq9c3'),
	(9018,'2012-08-30 17:25:41','John 5','john 5','teachings,teachings-tags,teachings-series',1,68,'ffe9409972ln34ob0vps6o5gp0'),
	(9019,'2012-08-30 18:34:00','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'gb2mblmlnaau8di6or9kgb22t4'),
	(9020,'2012-08-30 18:34:16','baptism','baptism','events',1,0,'gb2mblmlnaau8di6or9kgb22t4'),
	(9021,'2012-08-30 18:34:24','baptize','baptize','events',1,0,'gb2mblmlnaau8di6or9kgb22t4'),
	(9022,'2012-08-30 18:34:32','baptize','baptize','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'gb2mblmlnaau8di6or9kgb22t4'),
	(9023,'2012-08-30 18:34:44','baptize','baptize','events-recurring',1,0,'gb2mblmlnaau8di6or9kgb22t4'),
	(9024,'2012-08-30 18:40:27','John 5','john 5','teachings,teachings-tags,teachings-series',1,68,'ffe9409972ln34ob0vps6o5gp0'),
	(9025,'2012-08-30 19:12:16','Psalms','psalms','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'sse486sta0rc8cf6kckf7ca9d0'),
	(9026,'2012-08-30 20:23:41','dating','dating','teachings,teachings-tags,teachings-series',1,1,'k3qjagu0omt7if9flm5hia41d7'),
	(9027,'2012-08-30 20:28:03','back to school dance','back to school dance','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'l7a1ld13u7momoeo8tsqmorv10'),
	(9028,'2012-08-30 20:28:13','Dance','dance','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'l7a1ld13u7momoeo8tsqmorv10'),
	(9029,'2012-08-30 20:28:22','Dance','dance','events',1,1,'l7a1ld13u7momoeo8tsqmorv10'),
	(9030,'2012-08-30 21:19:21','dating','dating','teachings,teachings-tags,teachings-series',1,1,'k3qjagu0omt7if9flm5hia41d7'),
	(9031,'2012-08-30 21:19:40','dating','dating','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'k3qjagu0omt7if9flm5hia41d7'),
	(9032,'2012-08-30 21:20:14','courting','courting','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'k3qjagu0omt7if9flm5hia41d7'),
	(9033,'2012-08-30 22:52:15','John','john','teachings,teachings-tags,teachings-series',7,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9034,'2012-08-30 22:52:26','John','john','teachings,teachings-tags,teachings-series',3,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9035,'2012-08-30 22:52:35','John','john','teachings,teachings-tags,teachings-series',5,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9036,'2012-08-30 22:52:44','John','john','teachings,teachings-tags,teachings-series',6,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9037,'2012-08-30 22:52:56','John','john','teachings,teachings-tags,teachings-series',1,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9038,'2012-08-30 22:52:58','John','john','teachings,teachings-tags,teachings-series',7,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9039,'2012-08-30 22:53:09','John','john','teachings,teachings-tags,teachings-series',7,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9040,'2012-08-30 22:53:16','John','john','teachings,teachings-tags,teachings-series',6,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9041,'2012-08-30 22:53:27','John','john','teachings,teachings-tags,teachings-series',5,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9042,'2012-08-30 22:53:36','John','john','teachings,teachings-tags,teachings-series',4,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9043,'2012-08-30 22:53:45','John','john','teachings,teachings-tags,teachings-series',7,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9044,'2012-08-30 22:53:53','John','john','teachings,teachings-tags,teachings-series',6,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9045,'2012-08-31 00:50:57','prophest update','prophest update','teachings,teachings-tags,teachings-series',1,0,'2rsvusr1bj6l9812ibj7acb330'),
	(9046,'2012-08-31 00:52:01','prophesy update','prophesy update','teachings,teachings-tags,teachings-series',1,0,'2rsvusr1bj6l9812ibj7acb330'),
	(9047,'2012-08-31 00:52:08','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'2rsvusr1bj6l9812ibj7acb330'),
	(9048,'2012-08-31 00:53:22','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'2rsvusr1bj6l9812ibj7acb330'),
	(9049,'2012-08-31 00:53:45','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'2rsvusr1bj6l9812ibj7acb330'),
	(9050,'2012-08-31 00:53:46','prophesy update','prophesy update','teachings,teachings-tags,teachings-series',1,0,'2rsvusr1bj6l9812ibj7acb330'),
	(9051,'2012-08-31 00:53:50','prophest update','prophest update','teachings,teachings-tags,teachings-series',1,0,'2rsvusr1bj6l9812ibj7acb330'),
	(9052,'2012-08-31 06:20:00','Daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'craq3uhidk09dl12si23grk4s5'),
	(9053,'2012-08-31 06:52:59','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2834,'71bje6lnner4i3v3g1n6o7r1j0'),
	(9054,'2012-08-31 07:50:39','psalm','psalm','teachings,teachings-tags,teachings-series',1,3,'oqsri08h4oltb3ifjhnhgkn8i1'),
	(9055,'2012-08-31 08:34:05','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'tea9ad8qmqkqnvqohn56mmfag0'),
	(9056,'2012-08-31 08:51:12','sin','sin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,84,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9057,'2012-08-31 09:39:28','grief from unbelief','grief from unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9058,'2012-08-31 09:39:54','grief from unbelief','grief from unbelief','downloads',1,0,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9059,'2012-08-31 09:49:04','grief from unbelief','grief from unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9060,'2012-08-31 11:47:40','agape','agape','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9061,'2012-08-31 12:06:21','1 PEter','1 peter','teachings,teachings-tags,teachings-series',1,14,'qbme26cv4gepoeu6m3n2baj8o2'),
	(9062,'2012-08-31 12:28:36','Genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9063,'2012-08-31 12:29:05','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9064,'2012-08-31 12:29:13','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9065,'2012-08-31 12:29:42','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9066,'2012-08-31 12:31:08','genesis','genesis','teachings',1,4,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9067,'2012-08-31 12:31:23','abel','abel','teachings',1,0,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9068,'2012-08-31 12:31:31','abel','abel','teachings-series',1,0,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9069,'2012-08-31 12:31:41','Genesis','genesis','teachings-series',1,0,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9070,'2012-08-31 12:33:12','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9071,'2012-08-31 12:33:26','Genesis','genesis','tags',1,0,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9072,'2012-08-31 12:33:31','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9073,'2012-08-31 12:33:53','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jemfr1o7bn56dfjuaipdlit0l2'),
	(9074,'2012-08-31 12:42:27','grief from unbelief','grief from unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9075,'2012-08-31 12:46:12','agape','agape','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9076,'2012-08-31 13:14:58','agape','agape','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'m5c7j9aba5ojv3ltebdm7b1q36'),
	(9077,'2012-08-31 20:33:14','Ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'j7t5218gng5f76ngvqjf2odjv2'),
	(9078,'2012-08-31 20:33:19','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'j7t5218gng5f76ngvqjf2odjv2'),
	(9079,'2012-08-31 20:34:15','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'j7t5218gng5f76ngvqjf2odjv2'),
	(9080,'2012-08-31 20:34:17','Ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'j7t5218gng5f76ngvqjf2odjv2'),
	(9081,'2012-09-01 05:32:10','john','john','teachings,teachings-tags,teachings-series',1,68,'p00jikp7669961m5bmacqlefl2'),
	(9082,'2012-09-01 05:32:33','john','john','teachings,teachings-tags,teachings-series',2,68,'p00jikp7669961m5bmacqlefl2'),
	(9083,'2012-09-01 05:32:55','john','john','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,73,'p00jikp7669961m5bmacqlefl2'),
	(9084,'2012-09-01 06:49:00','Sevens of the geneology','sevens of the geneology','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'t6kkeoknkr9naoutp5vnm5dlj2'),
	(9085,'2012-09-01 06:49:19','Sevens','sevens','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'t6kkeoknkr9naoutp5vnm5dlj2'),
	(9086,'2012-09-01 06:50:16','Geneology','geneology','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'t6kkeoknkr9naoutp5vnm5dlj2'),
	(9087,'2012-09-01 06:50:23','genealogy','genealogy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'t6kkeoknkr9naoutp5vnm5dlj2'),
	(9088,'2012-09-01 10:03:32','John','john','teachings,teachings-tags,teachings-series',6,68,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9089,'2012-09-01 18:04:34','revelation 6','revelation 6','teachings,teachings-tags,teachings-series',1,37,'n4150eoqjlvo1hiqglccv8fcp3'),
	(9090,'2012-09-01 18:05:33','revelation 6','revelation 6','teachings,teachings-tags,teachings-series',2,37,'n4150eoqjlvo1hiqglccv8fcp3'),
	(9091,'2012-09-01 18:06:10','revelation 6','revelation 6','teachings,teachings-tags,teachings-series',3,37,'n4150eoqjlvo1hiqglccv8fcp3'),
	(9092,'2012-09-01 18:06:46','revelation 6','revelation 6','teachings,teachings-tags,teachings-series',4,37,'n4150eoqjlvo1hiqglccv8fcp3'),
	(9093,'2012-09-01 18:08:03','revelation 6','revelation 6','teachings,teachings-tags,teachings-series',4,37,'n4150eoqjlvo1hiqglccv8fcp3'),
	(9094,'2012-09-02 08:07:09','live video','live video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jnjql2va79qjpvh9bscg6jua15'),
	(9095,'2012-09-02 08:07:18','vimeo','vimeo','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'jnjql2va79qjpvh9bscg6jua15'),
	(9096,'2012-09-02 08:07:47','live vimeo','live vimeo','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jnjql2va79qjpvh9bscg6jua15'),
	(9097,'2012-09-02 08:08:00','live vimeo','live vimeo','teachings',1,1,'jnjql2va79qjpvh9bscg6jua15'),
	(9098,'2012-09-02 09:26:27','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9099,'2012-09-02 09:27:06','video','video','downloads',1,0,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9100,'2012-09-02 09:27:30','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9101,'2012-09-02 09:27:49','video','video','teachings-series',1,0,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9102,'2012-09-02 09:27:58','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9103,'2012-09-02 09:29:32','video teachings','video teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9104,'2012-09-02 09:29:58','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9105,'2012-09-02 09:30:05','video','video','teachings-series',1,0,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9106,'2012-09-02 09:30:09','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9107,'2012-09-02 09:30:11','video','video','downloads',1,0,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9108,'2012-09-02 09:30:15','video','video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bddjc5c8h1pgtfvoiphbm95e33'),
	(9109,'2012-09-02 15:29:48','september 2','september 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'d51c5862d9tkabvr9220h3o6l2'),
	(9110,'2012-09-02 15:46:41','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'adklt8218htlees5bhbp6t8of1'),
	(9111,'2012-09-02 15:52:55','ordering a cd','ordering a cd','teachings,teachings-tags,teachings-series',1,0,'adklt8218htlees5bhbp6t8of1'),
	(9112,'2012-09-02 15:53:09','cd','cd','teachings,teachings-tags,teachings-series',1,0,'adklt8218htlees5bhbp6t8of1'),
	(9113,'2012-09-02 15:53:28','cd','cd','teachings-series',1,0,'adklt8218htlees5bhbp6t8of1'),
	(9114,'2012-09-02 15:54:08','cd','cd','downloads',1,0,'adklt8218htlees5bhbp6t8of1'),
	(9115,'2012-09-02 16:02:14','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'adklt8218htlees5bhbp6t8of1'),
	(9116,'2012-09-02 16:35:03','tigard','tigard','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9117,'2012-09-02 16:35:09','tualatin\\','tualatin\\','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9118,'2012-09-02 16:35:15','tualatin\\','tualatin\\','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9119,'2012-09-02 16:35:16','tualatin\\','tualatin\\','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9120,'2012-09-02 16:35:16','tualatin\\','tualatin\\','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9121,'2012-09-02 16:35:16','tualatin\\','tualatin\\','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9122,'2012-09-02 16:35:21','tualatin','tualatin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'qrsrpmfi8uvmfg2jb21i9vh7u7'),
	(9123,'2012-09-02 17:43:37','discernment','discernment','teachings-tags',1,1,'1vkc3srn932fondiugg3du3gt5'),
	(9124,'2012-09-02 19:53:59','Discernment','discernment','teachings-tags',1,1,'ia2viks8s1p9n5gnlrvn001b45'),
	(9125,'2012-09-02 20:57:17','9/1','9/1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'r5veojccug6nogu83enkitced2'),
	(9126,'2012-09-02 20:57:58','9/1/12','9/1/12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'r5veojccug6nogu83enkitced2'),
	(9127,'2012-09-02 20:58:12','9/1/12','9/1/12','teachings',1,0,'r5veojccug6nogu83enkitced2'),
	(9128,'2012-09-02 20:58:20','9/1/12','9/1/12','teachings',1,0,'r5veojccug6nogu83enkitced2'),
	(9129,'2012-09-02 20:58:36','9/1/12','9/1/12','teachings-series',1,0,'r5veojccug6nogu83enkitced2'),
	(9130,'2012-09-02 20:58:48','9/1/12','9/1/12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'r5veojccug6nogu83enkitced2'),
	(9131,'2012-09-03 00:52:15','god\'s love','god\'s love','teachings,teachings-tags,teachings-series',1,2,'vdtraakkj2pode6eir7epe0rt6'),
	(9132,'2012-09-03 00:52:37','God\'s love','god\'s love','teachings,teachings-tags,teachings-series',1,2,'vdtraakkj2pode6eir7epe0rt6'),
	(9133,'2012-09-03 06:30:18','video teaching','video teaching','teachings,teachings-tags,teachings-series',1,0,'frors2i33ch5t5mignmrfc2a35'),
	(9134,'2012-09-03 06:30:34','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,10,'frors2i33ch5t5mignmrfc2a35'),
	(9135,'2012-09-03 06:31:31','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'frors2i33ch5t5mignmrfc2a35'),
	(9136,'2012-09-03 06:33:16','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'frors2i33ch5t5mignmrfc2a35'),
	(9137,'2012-09-03 06:33:24','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,10,'frors2i33ch5t5mignmrfc2a35'),
	(9138,'2012-09-03 06:33:28','video teaching','video teaching','teachings,teachings-tags,teachings-series',1,0,'frors2i33ch5t5mignmrfc2a35'),
	(9139,'2012-09-03 07:14:09','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,11,'lrmd9to1ala88eofkoqbpasik7'),
	(9140,'2012-09-03 07:17:21','end times','end times','teachings,teachings-tags,teachings-series',1,16,'lrmd9to1ala88eofkoqbpasik7'),
	(9141,'2012-09-03 07:17:35','end times','end times','teachings,teachings-tags,teachings-series',2,16,'lrmd9to1ala88eofkoqbpasik7'),
	(9142,'2012-09-03 07:18:20','tongues','tongues','teachings,teachings-tags,teachings-series',1,2,'lrmd9to1ala88eofkoqbpasik7'),
	(9143,'2012-09-03 07:46:47','titus','titus','teachings,teachings-tags,teachings-series',1,7,'frors2i33ch5t5mignmrfc2a35'),
	(9144,'2012-09-03 09:32:07','m 1568','m 1568','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(9145,'2012-09-03 09:33:00','m 1-568','m 1-568','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'dfb8nbb36lpohp2mijdnd6s7a5'),
	(9146,'2012-09-03 10:38:56','Proverbs','proverbs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9147,'2012-09-03 10:39:07','Proverb','proverb','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9148,'2012-09-03 10:39:52','Proverbs 2','proverbs 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gb8mlvifgin5s2pj6ho180h7v2'),
	(9149,'2012-09-03 13:22:41','Proverbs','proverbs','teachings,teachings-tags,teachings-series',1,1,'ffe9409972ln34ob0vps6o5gp0'),
	(9150,'2012-09-03 13:23:03','Proverbs 2','proverbs 2','teachings,teachings-tags,teachings-series',1,1,'ffe9409972ln34ob0vps6o5gp0'),
	(9151,'2012-09-03 13:25:34','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',1,25,'dld0gd5g7dc3tdmdd5r9ic8gs5'),
	(9152,'2012-09-03 13:28:51','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',2,25,'dld0gd5g7dc3tdmdd5r9ic8gs5'),
	(9153,'2012-09-03 13:29:48','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',3,25,'dld0gd5g7dc3tdmdd5r9ic8gs5'),
	(9154,'2012-09-03 17:08:54','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',1,25,'2d1oporlc3eqf0fvgad167rnh6'),
	(9155,'2012-09-03 17:20:29','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',2,25,'2d1oporlc3eqf0fvgad167rnh6'),
	(9156,'2012-09-03 17:20:30','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',2,25,'2d1oporlc3eqf0fvgad167rnh6'),
	(9157,'2012-09-03 17:20:50','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',3,25,'2d1oporlc3eqf0fvgad167rnh6'),
	(9158,'2012-09-03 17:20:59','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',1,25,'2d1oporlc3eqf0fvgad167rnh6'),
	(9159,'2012-09-03 17:54:51','andy','andy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'lhppg51scqja7g00smqpqvd202'),
	(9160,'2012-09-03 17:54:58','coleman','coleman','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lhppg51scqja7g00smqpqvd202'),
	(9161,'2012-09-03 18:39:36','galatians','galatians','teachings,teachings-tags,teachings-series',1,11,'bqalvnn49nncgakoe6cfvp9ku4'),
	(9162,'2012-09-03 18:39:51','galatians','galatians','teachings,teachings-tags,teachings-series',2,11,'bqalvnn49nncgakoe6cfvp9ku4'),
	(9163,'2012-09-03 20:15:26','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,40,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9164,'2012-09-03 20:16:13','pray','pray','teachings',1,13,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9165,'2012-09-03 20:33:15','prayer with a promise','prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9166,'2012-09-03 20:33:30','promises','promises','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9167,'2012-09-03 20:37:04','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,40,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9168,'2012-09-03 22:54:38','sermons','teachings','teachings,teachings-tags,teachings-series',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9169,'2012-09-03 22:54:53','sermons','teachings','downloads',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9170,'2012-09-03 22:55:10','sermons','teachings','teachings',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9171,'2012-09-03 22:56:02','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,10,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9172,'2012-09-03 23:04:42','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,10,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9173,'2012-09-03 23:04:54','sermons','teachings','teachings',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9174,'2012-09-03 23:04:54','sermons','teachings','downloads',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9175,'2012-09-03 23:04:55','sermons','teachings','teachings,teachings-tags,teachings-series',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9176,'2012-09-03 23:05:11','sermons','teachings','teachings-series',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9177,'2012-09-03 23:05:22','sermons','teachings','downloads',1,0,'bvjf1gdv0pk9r3rhr7qi2ff2k3'),
	(9178,'2012-09-04 06:05:57','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'9cfs0ekkak2ikg0crf0kj9q651'),
	(9179,'2012-09-04 08:52:16','jeremiah','jeremiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'oqsri08h4oltb3ifjhnhgkn8i1'),
	(9180,'2012-09-04 09:57:43','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'7ln0fqnsoj42ikr2rckpi3pbt0'),
	(9181,'2012-09-04 10:06:07','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'5k5i7hsvdsrpg2bo8tf21mj4t2'),
	(9182,'2012-09-04 13:18:23','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'761nnbumrpih3ajt13vck4aek4'),
	(9183,'2012-09-04 13:18:27','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'tleah9n1s4ckpo7bq4ctv8s295'),
	(9184,'2012-09-04 13:19:29','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'761nnbumrpih3ajt13vck4aek4'),
	(9185,'2012-09-04 13:19:30','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'srt799n0q69fmnat6o21sabnj7'),
	(9186,'2012-09-04 13:42:08','genesis 6:6','genesis 6:6','teachings,teachings-tags,teachings-series',1,0,'m5jmplmtkqts6uign731pgs9m7'),
	(9187,'2012-09-04 13:42:19','genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'m5jmplmtkqts6uign731pgs9m7'),
	(9188,'2012-09-04 13:42:42','genesis','genesis','teachings',1,4,'m5jmplmtkqts6uign731pgs9m7'),
	(9189,'2012-09-04 13:42:52','genesis','genesis','teachings-series',1,0,'m5jmplmtkqts6uign731pgs9m7'),
	(9190,'2012-09-04 13:43:03','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'m5jmplmtkqts6uign731pgs9m7'),
	(9191,'2012-09-04 14:25:51','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'lhppg51scqja7g00smqpqvd202'),
	(9192,'2012-09-04 14:26:00','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,13,'lhppg51scqja7g00smqpqvd202'),
	(9193,'2012-09-04 14:38:39','moto','moto','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'mlb35l40q6m8aakmbn4nq1l8q6'),
	(9194,'2012-09-04 14:38:48','moto','moto','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'mlb35l40q6m8aakmbn4nq1l8q6'),
	(9195,'2012-09-04 14:46:41','John 7','john 7','teachings,teachings-tags,teachings-series',1,68,'55f4dval5s5bqsdpi5i440ce16'),
	(9196,'2012-09-04 14:47:30','John 7','john 7','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,73,'55f4dval5s5bqsdpi5i440ce16'),
	(9197,'2012-09-04 15:10:57','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'0gtersvro0p9hk5n2279v6kqv3'),
	(9198,'2012-09-04 15:11:06','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'0gtersvro0p9hk5n2279v6kqv3'),
	(9199,'2012-09-04 15:40:29','Titus','titus','teachings,teachings-tags,teachings-series',1,7,'6p3806flhnefneoa807qu2ubh0'),
	(9200,'2012-09-04 19:23:16','genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'0i42va54bg27h2i1lflu4bcog7'),
	(9201,'2012-09-04 19:37:38','genesis','genesis','teachings-series',1,0,'0i42va54bg27h2i1lflu4bcog7'),
	(9202,'2012-09-04 20:30:43','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',2,51,'vdjtemrhk7efgta8gp5nc96m05'),
	(9203,'2012-09-04 20:31:39','s1-531','s1-531','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9204,'2012-09-04 20:32:25','s1-532','s1-532','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9205,'2012-09-04 20:32:46','s1-533','s1-533','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9206,'2012-09-04 20:57:21','Matthew 21','matthew 21','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'t6famasnmasfro5je5nittcpd0'),
	(9207,'2012-09-04 21:33:29','M1-547','m1-547','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9208,'2012-09-04 21:34:36','M1-551','m1-551','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9209,'2012-09-04 21:35:04','M1-552','m1-552','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9210,'2012-09-04 21:35:30','M1-551','m1-551','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9211,'2012-09-04 23:29:52','meals ministry','meals ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'a1b5sbvm5511h5gs3286tmdmn5'),
	(9212,'2012-09-05 07:37:17','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',2,51,'vdjtemrhk7efgta8gp5nc96m05'),
	(9213,'2012-09-05 07:37:49','m1-552','m1-552','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9214,'2012-09-05 07:39:50','m1-552','m1-552','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9215,'2012-09-05 07:40:15','s1-534','s1-534','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9216,'2012-09-05 09:29:41','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',5,51,'0gtersvro0p9hk5n2279v6kqv3'),
	(9217,'2012-09-05 09:29:56','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'0gtersvro0p9hk5n2279v6kqv3'),
	(9218,'2012-09-05 09:30:13','titus','titus','teachings,teachings-tags,teachings-series',1,7,'0gtersvro0p9hk5n2279v6kqv3'),
	(9219,'2012-09-05 09:37:21','titus','titus','teachings,teachings-tags,teachings-series',1,7,'hpvv6bn05lqagc9s63q7069gs1'),
	(9220,'2012-09-05 09:41:45','1 corinthians','1 corinthians','teachings,teachings-tags,teachings-series',4,51,'lnlfqn9bad69o5fplr8qbb0d50'),
	(9221,'2012-09-05 11:37:38','titus','titus','teachings,teachings-tags,teachings-series',1,7,'f954p0qhpho4t2fvnr5t4623b2'),
	(9222,'2012-09-05 12:03:35','titus','titus','teachings,teachings-tags,teachings-series',1,7,'f954p0qhpho4t2fvnr5t4623b2'),
	(9223,'2012-09-05 16:21:09','leviticus 23','leviticus 23','teachings,teachings-tags,teachings-series',1,0,'nn98cog8iiqiv3rflpdshen1j6'),
	(9224,'2012-09-05 16:21:17','leviticus 23','leviticus 23','teachings',1,0,'nn98cog8iiqiv3rflpdshen1j6'),
	(9225,'2012-09-05 17:14:02','still small voice','still small voice','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9226,'2012-09-05 17:14:15','vice','vice','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,22,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9227,'2012-09-05 22:27:26','M1-570','m1-570','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'6rdetshqdpa7965akj4tva7i13'),
	(9228,'2012-09-05 22:32:18','M1-570','m1-570','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'6rdetshqdpa7965akj4tva7i13'),
	(9229,'2012-09-05 22:33:12','M1-570','m1-570','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'6rdetshqdpa7965akj4tva7i13'),
	(9230,'2012-09-06 05:09:42','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'aah92hbcugq78sg7j4k2cv8130'),
	(9231,'2012-09-06 07:33:20','wednesday August 29, 2012','wednesday august 29, 2012','teachings,teachings-tags,teachings-series',1,0,'htj9ei8lrg3fou9up2nj3011c5'),
	(9232,'2012-09-06 07:33:47','August 29','august 29','teachings,teachings-tags,teachings-series',1,0,'htj9ei8lrg3fou9up2nj3011c5'),
	(9233,'2012-09-06 07:34:05','wednesday night','wednesday night','teachings,teachings-tags,teachings-series',1,61,'htj9ei8lrg3fou9up2nj3011c5'),
	(9234,'2012-09-06 09:47:56','n1-70','n1-70','teachings,teachings-tags,teachings-series',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9235,'2012-09-06 09:48:05','n1','n1','teachings,teachings-tags,teachings-series',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9236,'2012-09-06 09:48:09','n1','n1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9237,'2012-09-06 09:48:20','m1-70','m1-70','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9238,'2012-09-06 09:48:27','m1 70','m1 70','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9239,'2012-09-06 09:48:32','m1','m1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'vd4m4e5ehso74tos3mt5091hs5'),
	(9240,'2012-09-06 10:43:33','Wednesday sept 5th','wednesday sept 5th','teachings,teachings-tags,teachings-series',1,0,'so30a71ofmm8kfkna4qijlh5j1'),
	(9241,'2012-09-06 10:43:46','Hebrews 6','hebrews 6','teachings,teachings-tags,teachings-series',1,12,'so30a71ofmm8kfkna4qijlh5j1'),
	(9242,'2012-09-06 10:49:43','john 16','john 16','teachings,teachings-tags,teachings-series',1,68,'m5kr0h8nfq4e36k4t64arsltk4'),
	(9243,'2012-09-06 10:50:12','john 16','john 16','teachings,teachings-tags,teachings-series',2,68,'m5kr0h8nfq4e36k4t64arsltk4'),
	(9244,'2012-09-06 10:50:25','john 16','john 16','teachings,teachings-tags,teachings-series',3,68,'m5kr0h8nfq4e36k4t64arsltk4'),
	(9245,'2012-09-06 11:14:15','Jesus','jesus','teachings,teachings-tags,teachings-series',1,179,'ht3gf1ta43r8881tig4oslvj96'),
	(9246,'2012-09-06 11:14:36','wednesday','wednesday','teachings,teachings-tags,teachings-series',1,208,'ht3gf1ta43r8881tig4oslvj96'),
	(9247,'2012-09-06 11:14:45','wednesday','wednesday','downloads',1,0,'ht3gf1ta43r8881tig4oslvj96'),
	(9248,'2012-09-06 11:14:50','wednesday','wednesday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,224,'ht3gf1ta43r8881tig4oslvj96'),
	(9249,'2012-09-06 11:15:00','wednesday','wednesday','teachings',1,206,'ht3gf1ta43r8881tig4oslvj96'),
	(9250,'2012-09-06 11:15:14','wednesday','wednesday','teachings',1,206,'ht3gf1ta43r8881tig4oslvj96'),
	(9251,'2012-09-06 11:15:24','Jesus','jesus','teachings',1,172,'ht3gf1ta43r8881tig4oslvj96'),
	(9252,'2012-09-06 11:37:24','titus','titus','teachings,teachings-tags,teachings-series',1,7,'f954p0qhpho4t2fvnr5t4623b2'),
	(9253,'2012-09-06 13:29:30','posting','posting','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'61ffa1p8m3kcev2godlqcvuo36'),
	(9254,'2012-09-06 15:17:48','cleansed','cleansed','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9255,'2012-09-06 15:31:25','unforegiven','unforegiven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9256,'2012-09-06 15:31:54','unforegivness','unforegivness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9257,'2012-09-06 15:32:06','unforgiveness','unforgiveness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9258,'2012-09-06 15:47:48','unforgivness','unforgivness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9259,'2012-09-06 15:48:04','unforgiveness','unforgiveness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9260,'2012-09-06 15:57:58','unforgiveness','unforgiveness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9261,'2012-09-06 15:58:15','saved','saved','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9262,'2012-09-06 15:59:12','Job','job','teachings,teachings-tags,teachings-series',1,4,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9263,'2012-09-06 15:59:33','the book of job','the book of job','teachings,teachings-tags,teachings-series',1,0,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9264,'2012-09-06 15:59:41','job','job','teachings,teachings-tags,teachings-series',1,4,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9265,'2012-09-06 16:00:39','playin at prayin','playin at prayin','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9266,'2012-09-06 16:01:00','unforgivness','unforgivness','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9267,'2012-09-06 16:50:02','considering prayer','considering prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9268,'2012-09-06 16:51:43','word of faith','word of faith','teachings,teachings-tags,teachings-series',1,9,'isphqhfc21scmr5kq73rgo0te6'),
	(9269,'2012-09-06 16:52:45','word of faith','word of faith','teachings,teachings-tags,teachings-series',1,9,'isphqhfc21scmr5kq73rgo0te6'),
	(9270,'2012-09-06 16:52:58','false doctrines','false doctrines','teachings,teachings-tags,teachings-series',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9271,'2012-09-06 16:53:09','false teachers','false teachers','teachings,teachings-tags,teachings-series',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9272,'2012-09-06 16:53:14','false teachers','false teachers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9273,'2012-09-06 16:53:57','latter rain','latter rain','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9274,'2012-09-06 16:54:16','third revival','third revival','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9275,'2012-09-06 16:54:19','latter rain','latter rain','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9276,'2012-09-06 16:54:19','false teachers','false teachers','teachings,teachings-tags,teachings-series',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9277,'2012-09-06 16:54:26','revival','revival','teachings,teachings-tags,teachings-series',1,1,'isphqhfc21scmr5kq73rgo0te6'),
	(9278,'2012-09-06 16:55:17','revival','revival','teachings,teachings-tags,teachings-series',1,1,'isphqhfc21scmr5kq73rgo0te6'),
	(9279,'2012-09-06 16:55:23','healing','healing','teachings,teachings-tags,teachings-series',1,7,'isphqhfc21scmr5kq73rgo0te6'),
	(9280,'2012-09-06 20:35:45','r-21','r-21','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pfiokf5v1niup4s611c9fnnur1'),
	(9281,'2012-09-06 20:36:01','R-21','r-21','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pfiokf5v1niup4s611c9fnnur1'),
	(9282,'2012-09-06 20:36:07','R-021','r-021','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pfiokf5v1niup4s611c9fnnur1'),
	(9283,'2012-09-06 20:36:29','R-022','r-022','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pfiokf5v1niup4s611c9fnnur1'),
	(9284,'2012-09-06 20:52:24','R-023','r-023','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pfiokf5v1niup4s611c9fnnur1'),
	(9285,'2012-09-07 04:12:02','tongues','tongues','teachings,teachings-tags,teachings-series',1,2,'lrmd9to1ala88eofkoqbpasik7'),
	(9286,'2012-09-07 04:13:49','end times','end times','teachings,teachings-tags,teachings-series',2,16,'lrmd9to1ala88eofkoqbpasik7'),
	(9287,'2012-09-07 04:14:22','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'lrmd9to1ala88eofkoqbpasik7'),
	(9288,'2012-09-07 04:14:45','obama','obama','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'lrmd9to1ala88eofkoqbpasik7'),
	(9289,'2012-09-07 08:21:19','John 16','john 16','teachings,teachings-tags,teachings-series',1,68,'olhoketolvdp5auhearibvss80'),
	(9290,'2012-09-07 09:20:16','mormon','mormon','teachings,teachings-tags,teachings-series',1,6,'2dr4qfnsddm0vco62co33q3vb1'),
	(9291,'2012-09-07 09:25:29','mormon president','mormon president','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9292,'2012-09-07 09:25:40','mormon','mormon','teachings,teachings-tags,teachings-series',1,6,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9293,'2012-09-07 09:29:48','september 2011','september 2011','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9294,'2012-09-07 09:29:55','septmeber','septmeber','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9295,'2012-09-07 09:30:00','september','september','teachings,teachings-tags,teachings-series',1,1,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9296,'2012-09-07 09:37:17','mormon','mormon','teachings,teachings-tags,teachings-series',1,6,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9297,'2012-09-07 09:41:29','president','president','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9298,'2012-09-07 09:41:41','election','election','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9299,'2012-09-07 09:41:46','electing','electing','teachings,teachings-tags,teachings-series',1,0,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9300,'2012-09-07 10:17:07','mormon','mormon','teachings,teachings-tags,teachings-series',1,6,'5ecfgsig6j9aapjtp2k1l6tmn0'),
	(9301,'2012-09-07 10:29:51','S1551','s1551','teachings,teachings-tags,teachings-series',1,0,'2fe9ghjjkc5eb5ra5fm1oanhk1'),
	(9302,'2012-09-07 10:30:07','9062012','9062012','teachings,teachings-tags,teachings-series',1,0,'2fe9ghjjkc5eb5ra5fm1oanhk1'),
	(9303,'2012-09-07 10:30:15','S1552','s1552','teachings,teachings-tags,teachings-series',1,0,'2fe9ghjjkc5eb5ra5fm1oanhk1'),
	(9304,'2012-09-07 10:39:17','Danie','danie','teachings,teachings-tags,teachings-series',1,4,'a39lcl0pchtmemudkdsji9b673'),
	(9305,'2012-09-07 10:39:37','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'hscgimuli2q15ei5r26sk6fs44'),
	(9306,'2012-09-07 15:25:07','Colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9307,'2012-09-07 15:25:18','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9308,'2012-09-07 15:25:18','colossians','colossians','teachings,teachings-tags,teachings-series',1,10,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9309,'2012-09-07 15:25:25','colossians','colossians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9310,'2012-09-07 15:25:43','colossians','colossians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,11,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9311,'2012-09-07 15:25:54','colossians','colossians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'kbsabqn9fumlpq7bgksujvp8c4'),
	(9312,'2012-09-07 15:50:50','John 5','john 5','teachings,teachings-tags,teachings-series',1,68,'ffe9409972ln34ob0vps6o5gp0'),
	(9313,'2012-09-07 15:51:25','Women in the church','women in the church','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'ffe9409972ln34ob0vps6o5gp0'),
	(9314,'2012-09-07 17:12:27','daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'2pgce019s82gnrpqpkus0b4ir4'),
	(9315,'2012-09-07 23:12:29','Exodus 32','exodus 32','teachings,teachings-tags,teachings-series',1,3,'9jrqhsucb3cj11vfl0ocnsfsp1'),
	(9316,'2012-09-07 23:13:50','Exodus 32','exodus 32','teachings,teachings-tags,teachings-series',1,3,'9jrqhsucb3cj11vfl0ocnsfsp1'),
	(9317,'2012-09-08 07:25:55','tongues','tongues','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9318,'2012-09-08 09:33:15','teachers','teachers','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'61d5o8101ddehqcn3ra26gnlh7'),
	(9319,'2012-09-08 09:56:16','tongues','tongues','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9320,'2012-09-08 10:00:37','tongues','tongues','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9321,'2012-09-08 11:30:27','genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'1ufk3u5c42c4hq738gn2do8p12'),
	(9322,'2012-09-08 11:30:50','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'1ufk3u5c42c4hq738gn2do8p12'),
	(9323,'2012-09-08 11:30:59','genesis','genesis','teachings',1,4,'1ufk3u5c42c4hq738gn2do8p12'),
	(9324,'2012-09-08 11:31:06','genesis','genesis','teachings-series',1,0,'1ufk3u5c42c4hq738gn2do8p12'),
	(9325,'2012-09-08 11:31:19','genesis','genesis','teachings-series',1,0,'1ufk3u5c42c4hq738gn2do8p12'),
	(9326,'2012-09-08 11:31:32','genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'1ufk3u5c42c4hq738gn2do8p12'),
	(9327,'2012-09-08 12:15:19','river','river','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'ahcg6ls6d119pqsvljb5ubehh7'),
	(9328,'2012-09-08 13:33:44','relativism','relativism','teachings,teachings-tags,teachings-series',1,4,'1n9v2j1uk24i11ihnveunue6t4'),
	(9329,'2012-09-08 13:33:55','relativism','relativism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'1n9v2j1uk24i11ihnveunue6t4'),
	(9330,'2012-09-08 14:58:14','nehemiah 6','nehemiah 6','teachings,teachings-tags,teachings-series',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9331,'2012-09-08 14:58:46','nehemiah 6','nehemiah 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9332,'2012-09-08 14:59:02','nehemiah 6','nehemiah 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9333,'2012-09-08 14:59:36','Nehemiah','nehemiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9334,'2012-09-08 15:02:05','book of Nehemiah','book of nehemiah','teachings,teachings-tags,teachings-series',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9335,'2012-09-08 15:02:13','book of Nehemiah','book of nehemiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9336,'2012-09-08 15:02:15','book of Nehemiah','book of nehemiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1mqr3u4nrobb6t497fjibb9fm5'),
	(9337,'2012-09-08 16:58:30','Revelation study','revelation study','teachings-tags',1,0,'d0arjablvq8ci5uf6c7c62jls4'),
	(9338,'2012-09-08 17:23:48','september 5','september 5','teachings,teachings-tags,teachings-series',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9339,'2012-09-08 19:03:25','James','james','teachings,teachings-tags,teachings-series',1,5,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9340,'2012-09-08 19:03:46','James','james','downloads',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9341,'2012-09-08 19:03:55','James','james','teachings-series',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9342,'2012-09-08 19:04:01','James','james','teachings',1,5,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9343,'2012-09-08 19:04:23','James','james','downloads',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9344,'2012-09-08 19:04:37','James','james','downloads',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9345,'2012-09-08 19:05:28','James','james','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9346,'2012-09-08 19:05:55','Book','book','teachings,teachings-tags,teachings-series',1,44,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9347,'2012-09-08 19:06:16','book-by-book','book-by-book','teachings,teachings-tags,teachings-series',1,15,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9348,'2012-09-08 19:06:44','book of James','book of james','teachings,teachings-tags,teachings-series',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9349,'2012-09-08 19:06:53','book of James','book of james','teachings',1,0,'4av1kl9hnjaaldmn6ghnt6f777'),
	(9350,'2012-09-08 20:09:49','james','james','teachings-tags',1,0,'gi5bcj82tacupusoa1lj2vsdq1'),
	(9351,'2012-09-08 23:02:54','Give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,58,'4hh0n3r3f24fr7i5d1p3o5j660'),
	(9352,'2012-09-08 23:10:01','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'t29otb375of4mjo0in9h16r241'),
	(9353,'2012-09-08 23:10:23','daniel 5','daniel 5','teachings,teachings-tags,teachings-series',1,4,'t29otb375of4mjo0in9h16r241'),
	(9354,'2012-09-08 23:11:07','daniel 5','daniel 5','teachings,teachings-tags,teachings-series',1,4,'t29otb375of4mjo0in9h16r241'),
	(9355,'2012-09-08 23:11:19','daniel 5','daniel 5','teachings',1,2,'t29otb375of4mjo0in9h16r241'),
	(9356,'2012-09-08 23:54:23','Podcast','podcast','teachings,teachings-tags,teachings-series',1,0,'5mnar0bhis9ib73v240lk00021'),
	(9357,'2012-09-08 23:54:51','Podcasts','podcasts','teachings,teachings-tags,teachings-series',1,0,'5mnar0bhis9ib73v240lk00021'),
	(9358,'2012-09-09 14:56:51','divorce','divorce','teachings,teachings-tags,teachings-series',1,2,'j9i2g8nh9i3j6p5ba1ii4quli7'),
	(9359,'2012-09-09 18:40:23','Al Lippincott','al lippincott','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'03oemm2fqohr3vviie4qe4hsc0'),
	(9360,'2012-09-09 18:40:45','Al Lippincott','al lippincott','teachings',1,0,'03oemm2fqohr3vviie4qe4hsc0'),
	(9361,'2012-09-09 18:40:55','Al Lippincott','al lippincott','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'03oemm2fqohr3vviie4qe4hsc0'),
	(9362,'2012-09-09 18:41:11','Lippincott','lippincott','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'03oemm2fqohr3vviie4qe4hsc0'),
	(9363,'2012-09-09 18:41:17','Lippincott','lippincott','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'03oemm2fqohr3vviie4qe4hsc0'),
	(9364,'2012-09-09 19:28:54','The peace','the peace','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'03oemm2fqohr3vviie4qe4hsc0'),
	(9365,'2012-09-09 19:29:20','Peace','peace','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'03oemm2fqohr3vviie4qe4hsc0'),
	(9366,'2012-09-09 19:34:55','Peace','peace','teachings,teachings-tags,teachings-series',1,6,'cv34v82qk2shh8564k9spskq33'),
	(9367,'2012-09-09 20:53:37','walk','walk','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'41hg0rtj089fn214t06tes1l26'),
	(9368,'2012-09-09 20:57:10','walk','walk','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,15,'41hg0rtj089fn214t06tes1l26'),
	(9369,'2012-09-09 20:57:33','unbelief','unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'41hg0rtj089fn214t06tes1l26'),
	(9370,'2012-09-09 21:16:01','unbelief','unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'41hg0rtj089fn214t06tes1l26'),
	(9371,'2012-09-09 22:33:55','covering','covering','teachings-tags',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9372,'2012-09-10 00:09:46','sign language','sign language','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9qnb3enaprmerkeh6men3gi977'),
	(9373,'2012-09-10 00:10:03','hearing impaired','hearing impaired','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9qnb3enaprmerkeh6men3gi977'),
	(9374,'2012-09-10 00:10:10','deaf','deaf','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'9qnb3enaprmerkeh6men3gi977'),
	(9375,'2012-09-10 08:19:27','Negative Thoughts','negative thoughts','teachings,teachings-tags,teachings-series',1,0,'n2j716sl8q4snrv59pppsqn134'),
	(9376,'2012-09-10 08:19:38','Negative','negative','teachings,teachings-tags,teachings-series',1,1,'n2j716sl8q4snrv59pppsqn134'),
	(9377,'2012-09-10 12:08:32','Dating','dating','teachings,teachings-tags,teachings-series',1,1,'jfj955p8d3t61ut3diahn18t97'),
	(9378,'2012-09-10 13:21:19','guys and girls','guys and girls','teachings,teachings-tags,teachings-series',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9379,'2012-09-10 13:21:23','guys and girls','guys and girls','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9380,'2012-09-10 13:21:37','apologetics','apologetics','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9381,'2012-09-10 13:21:47','apolegtics','apolegtics','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9382,'2012-09-10 13:21:50','apologetics','apologetics','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9383,'2012-09-10 13:22:05','bringing others to chrit','bringing others to chrit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9384,'2012-09-10 13:22:11','bringing others to christ','bringing others to christ','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9385,'2012-09-10 13:22:22','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'jfj955p8d3t61ut3diahn18t97'),
	(9386,'2012-09-10 13:22:41','protection','protection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jfj955p8d3t61ut3diahn18t97'),
	(9387,'2012-09-10 13:27:07','protection','protection','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jfj955p8d3t61ut3diahn18t97'),
	(9388,'2012-09-10 13:27:09','bringing others to christ','bringing others to christ','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9389,'2012-09-10 13:27:10','bringing others to chrit','bringing others to chrit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9390,'2012-09-10 13:27:12','apologetics','apologetics','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9391,'2012-09-10 13:27:13','guys and girls','guys and girls','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9392,'2012-09-10 13:27:15','guys and girls','guys and girls','teachings,teachings-tags,teachings-series',1,0,'jfj955p8d3t61ut3diahn18t97'),
	(9393,'2012-09-10 14:53:44','The new covenant','the new covenant','teachings,teachings-tags,teachings-series',1,0,'2mjkq6ncmkl6l7d1ivpdqbpj23'),
	(9394,'2012-09-10 15:08:03','M1-496','m1-496','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9395,'2012-09-10 16:07:22','patience','patience','teachings,teachings-tags,teachings-series',1,3,'pl5dmt5liuq8h6g0il01lv70p7'),
	(9396,'2012-09-10 16:12:01','youth','youth','teachings,teachings-tags,teachings-series',1,4,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9397,'2012-09-10 17:21:58','Luke 2','luke 2','teachings',1,52,'l3mregtnncgsr9051gn0ptio55'),
	(9398,'2012-09-10 17:23:14','Luke 2','luke 2','teachings',2,52,'l3mregtnncgsr9051gn0ptio55'),
	(9399,'2012-09-10 17:23:39','Luke 2','luke 2','teachings',3,52,'l3mregtnncgsr9051gn0ptio55'),
	(9400,'2012-09-10 17:24:44','Luke 2','luke 2','teachings',4,52,'l3mregtnncgsr9051gn0ptio55'),
	(9401,'2012-09-10 17:26:24','Luke 2','luke 2','teachings',5,52,'l3mregtnncgsr9051gn0ptio55'),
	(9402,'2012-09-10 18:20:37','The heart: I can fix that...','the heart: i can fix that...','teachings,teachings-tags,teachings-series',1,0,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9403,'2012-09-10 18:20:55','The heart','the heart','teachings,teachings-tags,teachings-series',1,14,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9404,'2012-09-10 18:23:25','The heart','the heart','teachings,teachings-tags,teachings-series',1,14,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9405,'2012-09-10 18:32:57','lkfda\'j\'ljafl\'','lkfda\'j\'ljafl\'','teachings,teachings-tags,teachings-series',1,0,'bevck88od7nvf2ojv598h75254'),
	(9406,'2012-09-10 19:52:26','prophesy update','prophesy update','teachings-tags',1,0,'cq2ggn1vcqrhqq125nu54ufuq5'),
	(9407,'2012-09-10 21:07:01','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'4opemod5tp1i0kpi2jv1s5km24'),
	(9408,'2012-09-10 21:42:42','living in spirit','living in spirit','teachings,teachings-tags,teachings-series',1,0,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9409,'2012-09-10 21:42:56','spirit','spirit','teachings,teachings-tags,teachings-series',1,35,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9410,'2012-09-10 21:43:57','living in spirit','living in spirit','teachings,teachings-tags,teachings-series',1,0,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9411,'2012-09-10 21:44:07','spirit','spirit','teachings,teachings-tags,teachings-series',1,35,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9412,'2012-09-11 08:15:28','Jeremiah 31:31','jeremiah 31:31','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5lla8r56uekmq0sn49vok1jls4'),
	(9413,'2012-09-11 08:45:10','Girls','girls','teachings,teachings-tags,teachings-series',1,0,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9414,'2012-09-11 08:45:29','women of God','women of god','teachings,teachings-tags,teachings-series',1,2,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9415,'2012-09-11 08:47:29','patient','patient','teachings,teachings-tags,teachings-series',1,1,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9416,'2012-09-11 09:17:24','Hebrews 4','hebrews 4','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'7j6f2s8mda422qjgg9iq179u15'),
	(9417,'2012-09-11 09:17:49','\"Hebrews 4\"','\"hebrews 4\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'7j6f2s8mda422qjgg9iq179u15'),
	(9418,'2012-09-11 09:19:49','Matt hamilton','matt hamilton','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'20h21nsevqv40gp4fj9u7e77c7'),
	(9419,'2012-09-11 09:20:08','Matt hamilton','matt hamilton','teachings',1,0,'20h21nsevqv40gp4fj9u7e77c7'),
	(9420,'2012-09-11 09:20:19','Matt hamilton','matt hamilton','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'20h21nsevqv40gp4fj9u7e77c7'),
	(9421,'2012-09-11 09:20:46','Matt hamilton','matt hamilton','teachings',1,0,'20h21nsevqv40gp4fj9u7e77c7'),
	(9422,'2012-09-11 09:38:00','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'lf0pahjao4b0mje8apaudnp6m5'),
	(9423,'2012-09-11 09:38:13','daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'lf0pahjao4b0mje8apaudnp6m5'),
	(9424,'2012-09-11 09:38:29','daniel','daniel','teachings-series',1,0,'lf0pahjao4b0mje8apaudnp6m5'),
	(9425,'2012-09-11 09:38:37','daniel','daniel','teachings',1,2,'lf0pahjao4b0mje8apaudnp6m5'),
	(9426,'2012-09-11 09:38:49','daniel','daniel','downloads',1,0,'lf0pahjao4b0mje8apaudnp6m5'),
	(9427,'2012-09-11 09:38:55','daniel','daniel','downloads',1,0,'lf0pahjao4b0mje8apaudnp6m5'),
	(9428,'2012-09-11 09:39:04','daniel','daniel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'lf0pahjao4b0mje8apaudnp6m5'),
	(9429,'2012-09-11 10:06:34','Daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'4aq6r8pm8q6s8pvottbapceru2'),
	(9430,'2012-09-11 10:11:23','Dan the Man','dan the man','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'ba6st8pd3bt9j4ptuagi2u10r5'),
	(9431,'2012-09-11 10:12:23','Danil Introduction','danil introduction','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ba6st8pd3bt9j4ptuagi2u10r5'),
	(9432,'2012-09-11 10:13:43','Daniel Introduction','daniel introduction','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ba6st8pd3bt9j4ptuagi2u10r5'),
	(9433,'2012-09-11 10:14:07','Daniel Introduction','daniel introduction','teachings',1,0,'ba6st8pd3bt9j4ptuagi2u10r5'),
	(9434,'2012-09-11 10:14:31','Daniel Introduction','daniel introduction','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ba6st8pd3bt9j4ptuagi2u10r5'),
	(9435,'2012-09-11 10:14:46','Exodus 32','exodus 32','teachings,teachings-tags,teachings-series',1,3,'9jrqhsucb3cj11vfl0ocnsfsp1'),
	(9436,'2012-09-11 12:55:30','jeff young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'fl2li1q2eaa893ncd51kbrkaj4'),
	(9437,'2012-09-11 13:07:40','jeff young','jeff young','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'fl2li1q2eaa893ncd51kbrkaj4'),
	(9438,'2012-09-11 16:58:31','russia','russia','teachings,teachings-tags,teachings-series',1,1,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9439,'2012-09-11 17:15:53','podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9440,'2012-09-11 18:19:07','covering','covering','teachings-tags',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9441,'2012-09-11 19:39:40','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9442,'2012-09-11 19:47:45','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'4opemod5tp1i0kpi2jv1s5km24'),
	(9443,'2012-09-12 03:52:05','-1\'','-1\'','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2845,'7oanlfg5dqktro744sh18qf337'),
	(9444,'2012-09-12 06:33:20','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9445,'2012-09-12 07:19:36','genesis','genesis','teachings,teachings-tags,teachings-series',1,4,'rksqqa4e8c59o1tm1rj8ft9gj4'),
	(9446,'2012-09-12 08:20:27','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9447,'2012-09-12 08:22:29','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9448,'2012-09-12 08:22:52','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9449,'2012-09-12 08:23:08','Song of Solomon','song of solomon','teachings-series',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9450,'2012-09-12 08:23:47','Song of Solomon','song of solomon','teachings-tags',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9451,'2012-09-12 08:23:58','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9452,'2012-09-12 08:24:56','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9453,'2012-09-12 08:24:57','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9454,'2012-09-12 08:26:06','Song of Solomon','song of solomon','teachings,teachings-tags,teachings-series',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9455,'2012-09-12 08:26:22','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9456,'2012-09-12 08:27:03','Song of Solomon','song of solomon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9457,'2012-09-12 08:28:55','Solomon','solomon','teachings,teachings-tags,teachings-series',1,2,'ve4bk3sb3vlvisk4dv3h2kfrn5'),
	(9458,'2012-09-12 09:03:20','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'emkq56kffdstve62nfcf5hv5i7'),
	(9459,'2012-09-12 09:04:40','Genesis','genesis','downloads',1,0,'emkq56kffdstve62nfcf5hv5i7'),
	(9460,'2012-09-12 09:04:41','Genesis','genesis','downloads',1,0,'emkq56kffdstve62nfcf5hv5i7'),
	(9461,'2012-09-12 09:07:22','Genesis','genesis','teachings',1,4,'emkq56kffdstve62nfcf5hv5i7'),
	(9462,'2012-09-12 09:07:31','Genesis','genesis','teachings-series',1,0,'emkq56kffdstve62nfcf5hv5i7'),
	(9463,'2012-09-12 09:10:06','Genesis','genesis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'emkq56kffdstve62nfcf5hv5i7'),
	(9464,'2012-09-12 09:28:08','repentence','repentence','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9465,'2012-09-12 09:28:19','repentance','repentance','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9466,'2012-09-12 09:33:11','music','music','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'g4j0tr4v254rt5r3abt6ussht2'),
	(9467,'2012-09-12 09:34:09','music','music','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'g4j0tr4v254rt5r3abt6ussht2'),
	(9468,'2012-09-12 09:44:28','The new covenant','the new covenant','teachings,teachings-tags,teachings-series',1,0,'2mjkq6ncmkl6l7d1ivpdqbpj23'),
	(9469,'2012-09-12 09:55:52','end times','end times','teachings,teachings-tags,teachings-series',1,16,'12eepfbfmjb0i6e9g7kk28pue5'),
	(9470,'2012-09-12 09:57:28','1 thessalonians','1 thessalonians','teachings,teachings-tags,teachings-series',1,15,'12eepfbfmjb0i6e9g7kk28pue5'),
	(9471,'2012-09-12 10:14:15','1 thessalonians','1 thessalonians','teachings,teachings-tags,teachings-series',1,15,'12eepfbfmjb0i6e9g7kk28pue5'),
	(9472,'2012-09-12 11:10:02','prophesy update','prophesy update','teachings,teachings-tags,teachings-series',1,0,'28crlunsooo0nm6uf100tvlua7'),
	(9473,'2012-09-12 11:10:14','prophesy','prophesy','teachings,teachings-tags,teachings-series',1,0,'28crlunsooo0nm6uf100tvlua7'),
	(9474,'2012-09-12 11:10:19','prophesy update','prophesy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'28crlunsooo0nm6uf100tvlua7'),
	(9475,'2012-09-12 11:10:25','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'28crlunsooo0nm6uf100tvlua7'),
	(9476,'2012-09-12 11:15:00','M1-497','m1-497','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9477,'2012-09-12 11:29:00','prophesy','prophesy','teachings,teachings-tags,teachings-series',1,0,'28crlunsooo0nm6uf100tvlua7'),
	(9478,'2012-09-12 11:29:12','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'28crlunsooo0nm6uf100tvlua7'),
	(9479,'2012-09-12 11:32:26','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',2,51,'vdjtemrhk7efgta8gp5nc96m05'),
	(9480,'2012-09-12 11:33:06','m1-553','m1-553','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9481,'2012-09-12 11:36:16','m1-553','m1-553','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9482,'2012-09-12 11:36:45','s1-535','s1-535','teachings,teachings-tags,teachings-series',1,1,'vdjtemrhk7efgta8gp5nc96m05'),
	(9483,'2012-09-12 14:19:08','hope','hope','teachings,teachings-tags,teachings-series',1,13,'emgb18uglub6klcqndgrl41hb2'),
	(9484,'2012-09-12 14:19:20','heaven','heaven','teachings,teachings-tags,teachings-series',1,20,'bsti4dr1bb0fri9tadcngrp4i3'),
	(9485,'2012-09-12 14:19:51','hope','hope','teachings,teachings-tags,teachings-series',2,13,'emgb18uglub6klcqndgrl41hb2'),
	(9486,'2012-09-12 14:20:26','hope','hope','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'emgb18uglub6klcqndgrl41hb2'),
	(9487,'2012-09-12 15:11:19','M1-498','m1-498','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9488,'2012-09-12 16:55:02','lost','lost','teachings,teachings-tags,teachings-series',1,3,'cbfsuan7ppjl5sd9h31dq37uv6'),
	(9489,'2012-09-12 17:34:45','Justice','justice','teachings,teachings-tags,teachings-series',1,2,'qr29v3sbqd3v28siv5l6gi8as6'),
	(9490,'2012-09-12 19:35:14','live ustream','live ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'v4qeeq5uaipdb0d2l9okqp0s70'),
	(9491,'2012-09-12 19:35:30','live','live','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'v4qeeq5uaipdb0d2l9okqp0s70'),
	(9492,'2012-09-12 19:35:57','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'v4qeeq5uaipdb0d2l9okqp0s70'),
	(9493,'2012-09-12 19:41:02','live','live','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'pj6oqci8250hdv6287nom1qrd7'),
	(9494,'2012-09-12 19:41:41','live feed','live feed','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pj6oqci8250hdv6287nom1qrd7'),
	(9495,'2012-09-12 19:42:37','live broadcast','live broadcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pj6oqci8250hdv6287nom1qrd7'),
	(9496,'2012-09-12 19:42:52','live broadcast','live broadcast','teachings',1,0,'pj6oqci8250hdv6287nom1qrd7'),
	(9497,'2012-09-12 19:52:52','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,13,'rl50haqminfkauacnqn4i6lo43'),
	(9498,'2012-09-12 20:10:54','Daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'craq3uhidk09dl12si23grk4s5'),
	(9499,'2012-09-12 20:11:23','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'craq3uhidk09dl12si23grk4s5'),
	(9500,'2012-09-12 20:11:34','daniel 3','daniel 3','teachings,teachings-tags,teachings-series',1,4,'craq3uhidk09dl12si23grk4s5'),
	(9501,'2012-09-12 22:34:55','replacement','replacement','teachings,teachings-tags,teachings-series',1,2,'86spgl173j9eb5obo59lm1bmf3'),
	(9502,'2012-09-12 22:35:21','replacement','replacement','teachings,teachings-tags,teachings-series',1,2,'86spgl173j9eb5obo59lm1bmf3'),
	(9503,'2012-09-12 22:36:56','replacement','replacement','teachings,teachings-tags,teachings-series',1,2,'86spgl173j9eb5obo59lm1bmf3'),
	(9504,'2012-09-12 23:34:52','red heiffer','red heiffer','teachings,teachings-tags,teachings-series',1,0,'0jqiu1p5p5cadp7l6mcm7qua94'),
	(9505,'2012-09-12 23:35:09','red heifer','red heifer','teachings,teachings-tags,teachings-series',1,0,'0jqiu1p5p5cadp7l6mcm7qua94'),
	(9506,'2012-09-12 23:46:06','red heiffer','red heiffer','teachings,teachings-tags,teachings-series',1,0,'0jqiu1p5p5cadp7l6mcm7qua94'),
	(9507,'2012-09-13 07:11:35','covering','covering','teachings,teachings-tags,teachings-series',1,2,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9508,'2012-09-13 07:17:04','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9509,'2012-09-13 07:17:16','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9510,'2012-09-13 08:34:48','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hdjmb95sf5620h9n09iqrjkrn6'),
	(9511,'2012-09-13 08:45:28','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'eh0bk6d63322ktdp2ek4g5tg02'),
	(9512,'2012-09-13 09:32:37','covering','covering','teachings,teachings-tags,teachings-series',1,2,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9513,'2012-09-13 09:33:17','job','job','teachings,teachings-tags,teachings-series',1,4,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9514,'2012-09-13 09:33:20','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'lf0pahjao4b0mje8apaudnp6m5'),
	(9515,'2012-09-13 09:44:26','M1-499','m1-499','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9516,'2012-09-13 10:14:09','Daniel 1','daniel 1','teachings,teachings-tags,teachings-series',1,4,'4aq6r8pm8q6s8pvottbapceru2'),
	(9517,'2012-09-13 12:56:28','islam','islam','teachings,teachings-tags,teachings-series',1,2,'pmt8smpo89kdtrjrpu7ik71mb7'),
	(9518,'2012-09-13 13:17:51','love','love','teachings,teachings-tags,teachings-series',1,25,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9519,'2012-09-13 13:18:37','young','young','teachings,teachings-tags,teachings-series',1,11,'0dm1sui0v5h8t7kionb99s1bo3'),
	(9520,'2012-09-13 13:24:38','caleb','caleb','teachings,teachings-tags,teachings-series',1,0,'s6da1kvc97ti1esp108jmrmah0'),
	(9521,'2012-09-13 13:24:53','caleb','caleb','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'s6da1kvc97ti1esp108jmrmah0'),
	(9522,'2012-09-13 13:25:01','caleb','caleb','teachings',1,0,'s6da1kvc97ti1esp108jmrmah0'),
	(9523,'2012-09-13 15:58:41','I corinthians 11','i corinthians 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,54,'bevck88od7nvf2ojv598h75254'),
	(9524,'2012-09-13 19:51:41','Spanking','spanking','teachings,teachings-tags,teachings-series',1,1,'g0nulim45f71jnkh482vk1d7n3'),
	(9525,'2012-09-13 19:51:50','1 timothy','1 timothy','teachings,teachings-tags,teachings-series',1,25,'fseblvk5aub3i2j277pehg42c4'),
	(9526,'2012-09-13 21:05:43','russia','russia','teachings,teachings-tags,teachings-series',1,1,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9527,'2012-09-13 21:06:00','melchizedek','melchizedek','teachings,teachings-tags,teachings-series',1,4,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9528,'2012-09-13 21:07:51','endtimes','endtimes','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9529,'2012-09-13 21:08:02','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9530,'2012-09-13 21:09:53','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9531,'2012-09-13 21:10:17','end times','end times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9532,'2012-09-13 22:24:45','Dedication','dedication','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'kul57i2h6n50f8qgvhauaggta4'),
	(9533,'2012-09-13 22:25:13','dedication','dedication','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'kul57i2h6n50f8qgvhauaggta4'),
	(9534,'2012-09-13 23:00:13','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'eh0bk6d63322ktdp2ek4g5tg02'),
	(9535,'2012-09-13 23:00:21','1 samuel','1 samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'eh0bk6d63322ktdp2ek4g5tg02'),
	(9536,'2012-09-13 23:00:32','28','28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'eh0bk6d63322ktdp2ek4g5tg02'),
	(9537,'2012-09-13 23:00:42','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'eh0bk6d63322ktdp2ek4g5tg02'),
	(9538,'2012-09-13 23:04:38','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'728lhq981j8ocr5nmj1igo8j30'),
	(9539,'2012-09-13 23:05:02','revelation','revelation','teachings,teachings-tags,teachings-series',2,37,'728lhq981j8ocr5nmj1igo8j30'),
	(9540,'2012-09-13 23:05:17','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'728lhq981j8ocr5nmj1igo8j30'),
	(9541,'2012-09-14 10:10:31','lawful','lawful','teachings,teachings-tags,teachings-series',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9542,'2012-09-14 11:52:26','lawful','lawful','teachings,teachings-tags,teachings-series',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9543,'2012-09-14 11:52:33','lawful','lawful','teachings',1,1,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9544,'2012-09-14 11:52:51','1 corinthians','1 corinthians','teachings',1,49,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9545,'2012-09-14 11:53:49','1 corinthians','1 corinthians','teachings-tags',1,0,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9546,'2012-09-14 11:53:58','1 corinthians','1 corinthians','teachings-series',1,2,'5n9hja20g2ntra4hnrin2cvbb5'),
	(9547,'2012-09-14 12:16:53','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9548,'2012-09-14 14:55:22','ezekial 38','ezekial 38','teachings,teachings-tags,teachings-series',1,0,'7245h7p9pdc6sj897kpceoki01'),
	(9549,'2012-09-14 14:55:38','ezekial 38','ezekial 38','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7245h7p9pdc6sj897kpceoki01'),
	(9550,'2012-09-14 14:55:44','ezekiel','ezekiel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'7245h7p9pdc6sj897kpceoki01'),
	(9551,'2012-09-14 16:33:48','aaron','aaron','teachings,teachings-tags,teachings-series',1,1,'crhncl91iidv6u838tkprdjbf3'),
	(9552,'2012-09-14 16:39:22','matthew','matthew','teachings,teachings-tags,teachings-series',1,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9553,'2012-09-14 16:39:24','matthew','matthew','teachings,teachings-tags,teachings-series',1,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9554,'2012-09-14 16:39:25','matthew','matthew','teachings,teachings-tags,teachings-series',1,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9555,'2012-09-14 16:39:47','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',1,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9556,'2012-09-14 16:40:36','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',1,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9557,'2012-09-14 16:40:45','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',2,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9558,'2012-09-14 16:40:57','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',3,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9559,'2012-09-14 16:41:15','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',4,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9560,'2012-09-14 16:41:22','matthew 6','matthew 6','teachings,teachings-tags,teachings-series',4,33,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9561,'2012-09-14 16:41:32','matthew 6:1','matthew 6:1','teachings,teachings-tags,teachings-series',1,0,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9562,'2012-09-14 16:41:42','matthew 6:1','matthew 6:1','downloads',1,0,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9563,'2012-09-14 16:41:50','matthew','matthew','downloads',1,0,'cn8hk07uuv3b2bjf185s7rc5k5'),
	(9564,'2012-09-14 19:56:05','revelation 9, 14','revelation 9, 14','teachings,teachings-tags,teachings-series',1,37,'h1c7a9q2j3uh3rv47m8g6aish1'),
	(9565,'2012-09-14 19:56:23','revelation 9, 14','revelation 9, 14','teachings,teachings-tags,teachings-series',1,37,'h1c7a9q2j3uh3rv47m8g6aish1'),
	(9566,'2012-09-14 19:56:48','revelation 9, 14','revelation 9, 14','teachings,teachings-tags,teachings-series',2,37,'h1c7a9q2j3uh3rv47m8g6aish1'),
	(9567,'2012-09-14 19:56:54','revelation 9, 14','revelation 9, 14','teachings,teachings-tags,teachings-series',2,37,'h1c7a9q2j3uh3rv47m8g6aish1'),
	(9568,'2012-09-14 19:57:09','revelation 9, 14','revelation 9, 14','teachings,teachings-tags,teachings-series',3,37,'h1c7a9q2j3uh3rv47m8g6aish1'),
	(9569,'2012-09-14 20:39:00','joshua','joshua','teachings,teachings-tags,teachings-series',1,3,'pl5dmt5liuq8h6g0il01lv70p7'),
	(9570,'2012-09-15 11:02:18','John 11','john 11','teachings,teachings-tags,teachings-series',1,68,'ffhed7mfja39n1raqpordo5o61'),
	(9571,'2012-09-15 11:02:28','John 11','john 11','teachings,teachings-tags,teachings-series',3,68,'ffhed7mfja39n1raqpordo5o61'),
	(9572,'2012-09-15 11:02:37','John 11','john 11','teachings,teachings-tags,teachings-series',5,68,'ffhed7mfja39n1raqpordo5o61'),
	(9573,'2012-09-15 11:02:38','John 11','john 11','teachings,teachings-tags,teachings-series',5,68,'ffhed7mfja39n1raqpordo5o61'),
	(9574,'2012-09-15 11:59:20','baptism','baptism','teachings,teachings-tags,teachings-series',1,5,'h30aah8c4d955f81brh7c69g67'),
	(9575,'2012-09-15 11:59:43','baptism','baptism','teachings,teachings-tags,teachings-series',1,5,'h30aah8c4d955f81brh7c69g67'),
	(9576,'2012-09-15 12:04:36','baptism','baptism','teachings-tags',1,2,'h30aah8c4d955f81brh7c69g67'),
	(9577,'2012-09-15 12:34:07','John 20','john 20','teachings,teachings-tags,teachings-series',1,68,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9578,'2012-09-15 12:37:57','Prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9579,'2012-09-15 12:43:51','Prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9580,'2012-09-15 12:44:26','Prophecy','prophecy','teachings,teachings-tags,teachings-series',2,13,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9581,'2012-09-15 12:45:04','Prophecy','prophecy','downloads',1,0,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9582,'2012-09-15 16:17:14','Jeremiah 31','jeremiah 31','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cmat6rcki3tea3c0curvmbvii3'),
	(9583,'2012-09-15 16:17:27','Jeremiah 29','jeremiah 29','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cmat6rcki3tea3c0curvmbvii3'),
	(9584,'2012-09-15 16:17:48','Jeremiah 31','jeremiah 31','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cmat6rcki3tea3c0curvmbvii3'),
	(9585,'2012-09-15 16:18:02','Jeremiah 31:31','jeremiah 31:31','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'cmat6rcki3tea3c0curvmbvii3'),
	(9586,'2012-09-15 16:18:17','Jeremiah 31','jeremiah 31','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cmat6rcki3tea3c0curvmbvii3'),
	(9587,'2012-09-15 16:18:47','Jeremiah 18','jeremiah 18','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cmat6rcki3tea3c0curvmbvii3'),
	(9588,'2012-09-15 16:20:00','acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'cmat6rcki3tea3c0curvmbvii3'),
	(9589,'2012-09-15 16:22:13','creation','creation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'jb6gpdt1i7pcd8p5i95ihefe66'),
	(9590,'2012-09-15 16:22:50','acts','acts','teachings',1,50,'cmat6rcki3tea3c0curvmbvii3'),
	(9591,'2012-09-15 16:22:56','acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'cmat6rcki3tea3c0curvmbvii3'),
	(9592,'2012-09-15 16:25:15','acts','acts','teachings',1,50,'cmat6rcki3tea3c0curvmbvii3'),
	(9593,'2012-09-15 16:26:52','acts','acts','events-recurring',1,0,'cmat6rcki3tea3c0curvmbvii3'),
	(9594,'2012-09-15 16:26:57','acts','acts','tags',1,0,'cmat6rcki3tea3c0curvmbvii3'),
	(9595,'2012-09-15 16:27:19','acts','acts','teachings-tags',1,0,'cmat6rcki3tea3c0curvmbvii3'),
	(9596,'2012-09-15 16:27:24','acts','acts','teachings-series',1,0,'cmat6rcki3tea3c0curvmbvii3'),
	(9597,'2012-09-15 16:27:26','acts','acts','teachings',1,50,'cmat6rcki3tea3c0curvmbvii3'),
	(9598,'2012-09-15 20:39:08','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hdjmb95sf5620h9n09iqrjkrn6'),
	(9599,'2012-09-15 20:39:22','1 samuel','1 samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hdjmb95sf5620h9n09iqrjkrn6'),
	(9600,'2012-09-15 20:39:32','1 samuel 28','1 samuel 28','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hdjmb95sf5620h9n09iqrjkrn6'),
	(9601,'2012-09-16 08:47:48','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,58,'f97lkcevn5ba79ltb0m1qto3d5'),
	(9602,'2012-09-16 09:41:46','leviticus 6','leviticus 6','teachings,teachings-tags,teachings-series',1,0,'sb148u85793bqd4s16fua7u7d2'),
	(9603,'2012-09-16 09:42:27','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'sb148u85793bqd4s16fua7u7d2'),
	(9604,'2012-09-16 10:17:30','Prophesy','prophesy','teachings-tags',1,0,'cp2c59430ek5uj281f8861kmf2'),
	(9605,'2012-09-16 10:17:54','Prophesy update','prophesy update','teachings-tags',1,0,'cp2c59430ek5uj281f8861kmf2'),
	(9606,'2012-09-16 10:18:02','prophecy','prophecy','teachings-tags',1,2,'cp2c59430ek5uj281f8861kmf2'),
	(9607,'2012-09-16 10:54:50','September 16','september 16','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cv34v82qk2shh8564k9spskq33'),
	(9608,'2012-09-16 11:55:53','Ephesians 5:22','ephesians 5:22','teachings,teachings-tags,teachings-series',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9609,'2012-09-16 11:56:35','Ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'cove1hdcktnam59aqov6i196k5'),
	(9610,'2012-09-16 11:57:37','Ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'cove1hdcktnam59aqov6i196k5'),
	(9611,'2012-09-16 11:57:39','Ephesians 5:22','ephesians 5:22','teachings,teachings-tags,teachings-series',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9612,'2012-09-16 12:01:24','Submission','submission','teachings,teachings-tags,teachings-series',1,4,'cove1hdcktnam59aqov6i196k5'),
	(9613,'2012-09-16 12:01:50','Submission','submission','downloads',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9614,'2012-09-16 12:07:56','Submission of wives','submission of wives','downloads',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9615,'2012-09-16 12:08:05','Submission of wives','submission of wives','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'cove1hdcktnam59aqov6i196k5'),
	(9616,'2012-09-16 12:08:19','Submission of wives','submission of wives','downloads',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9617,'2012-09-16 12:08:29','Submission of wives','submission of wives','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'cove1hdcktnam59aqov6i196k5'),
	(9618,'2012-09-16 12:09:11','submission','submission','teachings,teachings-tags,teachings-series',1,4,'cove1hdcktnam59aqov6i196k5'),
	(9619,'2012-09-16 12:13:55','submission','submission','teachings,teachings-tags,teachings-series',1,4,'cove1hdcktnam59aqov6i196k5'),
	(9620,'2012-09-16 12:14:00','submission','submission','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cove1hdcktnam59aqov6i196k5'),
	(9621,'2012-09-16 12:14:12','submission','submission','downloads',1,0,'cove1hdcktnam59aqov6i196k5'),
	(9622,'2012-09-16 13:45:02','Hebrews 10','hebrews 10','teachings,teachings-tags,teachings-series',1,15,'t3sia5aeo8oq316mrvaau6tqf1'),
	(9623,'2012-09-16 14:02:34','The new covenant','the new covenant','teachings,teachings-tags,teachings-series',1,4,'2mjkq6ncmkl6l7d1ivpdqbpj23'),
	(9624,'2012-09-16 17:33:49','micah','micah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9625,'2012-09-16 17:34:10','mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9626,'2012-09-16 19:29:22','2 corinthians','2 corinthians','teachings,teachings-tags,teachings-series',1,51,'gd5ti36vd76guo3utae9me65e5'),
	(9627,'2012-09-16 19:30:23','2 corinthians','2 corinthians','teachings,teachings-tags,teachings-series',3,51,'gd5ti36vd76guo3utae9me65e5'),
	(9628,'2012-09-16 19:30:32','2 corinthians','2 corinthians','teachings,teachings-tags,teachings-series',2,51,'gd5ti36vd76guo3utae9me65e5'),
	(9629,'2012-09-16 22:05:58','m1-613','m1-613','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'6gsj2be6umveepnu89h0kdqr53'),
	(9630,'2012-09-16 22:38:00','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'b9tmqlg7v6urt3pi11vqun2d85'),
	(9631,'2012-09-16 23:27:23','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'728lhq981j8ocr5nmj1igo8j30'),
	(9632,'2012-09-17 04:44:39','M1-500','m1-500','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9633,'2012-09-17 06:07:58','heaven','heaven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9634,'2012-09-17 06:09:19','heaven','heaven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9635,'2012-09-17 06:10:06','heaven','heaven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9636,'2012-09-17 06:11:11','heaven','heaven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9637,'2012-09-17 06:11:28','heaven','heaven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9638,'2012-09-17 06:11:43','heaven','heaven','teachings,teachings-tags,teachings-series',1,22,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9639,'2012-09-17 08:14:28','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9640,'2012-09-17 09:32:05','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9641,'2012-09-17 09:32:05','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9642,'2012-09-17 09:32:06','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9643,'2012-09-17 09:32:06','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9644,'2012-09-17 09:32:06','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9645,'2012-09-17 09:32:07','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9646,'2012-09-17 09:32:07','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9647,'2012-09-17 09:32:07','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9648,'2012-09-17 09:32:08','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9649,'2012-09-17 09:32:08','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9650,'2012-09-17 09:32:08','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9651,'2012-09-17 09:32:08','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9652,'2012-09-17 09:32:08','give','give','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'agdmeo1vkgc0qhl46b1v0fad91'),
	(9653,'2012-09-17 09:52:52','Acts','acts','teachings,teachings-tags,teachings-series',1,50,'oumnn9j24jqjhbggor7buusnv5'),
	(9654,'2012-09-17 11:47:15','Luke 2','luke 2','teachings',5,52,'cn4ddv6j1c6a0irpigmbtiqb15'),
	(9655,'2012-09-17 12:12:58','Acts Introduction','acts introduction','teachings,teachings-tags,teachings-series',1,1,'psj9laj5le4t0cqpvqkomc7991'),
	(9656,'2012-09-17 12:15:32','Acts','acts','teachings,teachings-tags,teachings-series',1,50,'obddd4hht5l3t2voe2l0tfs9r0'),
	(9657,'2012-09-17 12:52:10','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',1,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9658,'2012-09-17 12:53:13','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',2,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9659,'2012-09-17 12:53:29','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',3,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9660,'2012-09-17 12:53:47','matthew','matthew','teachings,teachings-tags,teachings-series',1,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9661,'2012-09-17 12:53:56','matthew','matthew','teachings,teachings-tags,teachings-series',2,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9662,'2012-09-17 12:54:02','matthew','matthew','teachings,teachings-tags,teachings-series',4,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9663,'2012-09-17 12:54:21','matthew','matthew','teachings,teachings-tags,teachings-series',3,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9664,'2012-09-17 12:54:29','matthew','matthew','teachings,teachings-tags,teachings-series',2,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9665,'2012-09-17 12:54:40','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9666,'2012-09-17 12:55:09','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9667,'2012-09-17 12:55:18','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9668,'2012-09-17 12:55:29','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9669,'2012-09-17 12:55:41','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9670,'2012-09-17 12:55:54','matthew','matthew','teachings-series',1,0,'ur84a7e09jarilfjlje6kleoh6'),
	(9671,'2012-09-17 12:58:22','matthew through the bible studies','matthew through the bible studies','teachings,teachings-tags,teachings-series',1,0,'ur84a7e09jarilfjlje6kleoh6'),
	(9672,'2012-09-17 12:58:29','matthew through the bible studies','matthew through the bible studies','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ur84a7e09jarilfjlje6kleoh6'),
	(9673,'2012-09-17 12:58:34','matthew through the bible studies','matthew through the bible studies','downloads',1,0,'ur84a7e09jarilfjlje6kleoh6'),
	(9674,'2012-09-17 12:58:42','matthew','matthew','downloads',1,0,'ur84a7e09jarilfjlje6kleoh6'),
	(9675,'2012-09-17 12:58:48','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'ur84a7e09jarilfjlje6kleoh6'),
	(9676,'2012-09-17 13:19:00','Acts 1','acts 1','teachings,teachings-tags,teachings-series',1,50,'psj9laj5le4t0cqpvqkomc7991'),
	(9677,'2012-09-17 13:19:26','Acts 1','acts 1','teachings,teachings-tags,teachings-series',2,50,'psj9laj5le4t0cqpvqkomc7991'),
	(9678,'2012-09-17 13:19:56','Acts 1','acts 1','teachings,teachings-tags,teachings-series',3,50,'psj9laj5le4t0cqpvqkomc7991'),
	(9679,'2012-09-17 13:20:13','Acts 1','acts 1','teachings,teachings-tags,teachings-series',5,50,'psj9laj5le4t0cqpvqkomc7991'),
	(9680,'2012-09-17 14:13:10','Tad slaughter','tad slaughter','teachings,teachings-tags,teachings-series',1,4,'bf9hhe90tp09l9tdoie317n0a5'),
	(9681,'2012-09-17 14:25:23','matthews','matthews','teachings,teachings-tags,teachings-series',1,0,'armufern54aq9ibi1hiqbdegm1'),
	(9682,'2012-09-17 14:25:29','matthew 5','matthew 5','teachings,teachings-tags,teachings-series',1,33,'armufern54aq9ibi1hiqbdegm1'),
	(9683,'2012-09-17 14:41:30','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'b9tmqlg7v6urt3pi11vqun2d85'),
	(9684,'2012-09-17 17:13:36','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'b9tmqlg7v6urt3pi11vqun2d85'),
	(9685,'2012-09-17 18:00:05','September 16, 2012','september 16, 2012','teachings,teachings-tags,teachings-series',1,0,'sp10ciep3te1vdblftqtaecq92'),
	(9686,'2012-09-17 18:03:43','September 16, 2012','september 16, 2012','teachings,teachings-tags,teachings-series',1,0,'sp10ciep3te1vdblftqtaecq92'),
	(9687,'2012-09-17 18:15:49','Matthew 28','matthew 28','teachings,teachings-tags,teachings-series',1,33,'baf8kohq1as9h8reb0u1eockt6'),
	(9688,'2012-09-17 18:16:02','Matthew 28','matthew 28','teachings,teachings-tags,teachings-series',2,33,'baf8kohq1as9h8reb0u1eockt6'),
	(9689,'2012-09-17 18:33:07','joy','joy','teachings,teachings-tags,teachings-series',1,7,'prqhe7jjh2lcbgrnk5happim25'),
	(9690,'2012-09-17 18:35:30','joy','joy','teachings,teachings-tags,teachings-series',1,7,'prqhe7jjh2lcbgrnk5happim25'),
	(9691,'2012-09-17 18:35:46','joy','joy','teachings,teachings-tags,teachings-series',1,7,'prqhe7jjh2lcbgrnk5happim25'),
	(9692,'2012-09-17 18:35:55','peace','peace','teachings,teachings-tags,teachings-series',1,6,'prqhe7jjh2lcbgrnk5happim25'),
	(9693,'2012-09-17 18:36:21','peace','peace','teachings,teachings-tags,teachings-series',1,6,'prqhe7jjh2lcbgrnk5happim25'),
	(9694,'2012-09-17 18:36:30','trust','trust','teachings,teachings-tags,teachings-series',1,3,'prqhe7jjh2lcbgrnk5happim25'),
	(9695,'2012-09-17 19:17:35','exodus','exodus','teachings,teachings-tags,teachings-series',1,3,'dq5mh9lv13jpr81mhrmjfiehs3'),
	(9696,'2012-09-17 19:17:57','exodus','exodus','downloads',1,0,'dq5mh9lv13jpr81mhrmjfiehs3'),
	(9697,'2012-09-17 19:18:06','exodus','exodus','teachings',1,3,'dq5mh9lv13jpr81mhrmjfiehs3'),
	(9698,'2012-09-17 19:38:59','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'b9tmqlg7v6urt3pi11vqun2d85'),
	(9699,'2012-09-17 20:02:45','hebrews','hebrews','teachings,teachings-tags,teachings-series',1,15,'ncmdmtnm2814dscdq1a3kqg1c4'),
	(9700,'2012-09-17 20:03:25','hebrews','hebrews','teachings-series',1,1,'ncmdmtnm2814dscdq1a3kqg1c4'),
	(9701,'2012-09-17 20:51:39','jesus','jesus','teachings,teachings-tags,teachings-series',1,183,'d34kcnim7fl9mg5327rb5hha25'),
	(9702,'2012-09-17 20:51:54','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'d34kcnim7fl9mg5327rb5hha25'),
	(9703,'2012-09-17 20:54:13','wife','wife','teachings,teachings-tags,teachings-series',1,25,'d34kcnim7fl9mg5327rb5hha25'),
	(9704,'2012-09-17 20:56:02','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9705,'2012-09-17 21:12:46','mattew 24','mattew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'61d5o8101ddehqcn3ra26gnlh7'),
	(9706,'2012-09-17 21:12:57','mathew 2','mathew 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'61d5o8101ddehqcn3ra26gnlh7'),
	(9707,'2012-09-17 21:13:04','mathew 24','mathew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'61d5o8101ddehqcn3ra26gnlh7'),
	(9708,'2012-09-17 21:13:54','matthew 24','matthew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'61d5o8101ddehqcn3ra26gnlh7'),
	(9709,'2012-09-17 21:14:06','matthew 24','matthew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,33,'61d5o8101ddehqcn3ra26gnlh7'),
	(9710,'2012-09-17 21:14:15','matthew 24','matthew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,33,'61d5o8101ddehqcn3ra26gnlh7'),
	(9711,'2012-09-17 21:14:29','matthew 24','matthew 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,33,'61d5o8101ddehqcn3ra26gnlh7'),
	(9712,'2012-09-17 23:35:16','revelation','revelation','teachings,teachings-tags,teachings-series',3,37,'728lhq981j8ocr5nmj1igo8j30'),
	(9713,'2012-09-18 09:09:40','Women\'s ministry teachings','women\'s ministry teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r6u5amt8jln3fpjf0i7vboamu1'),
	(9714,'2012-09-18 10:08:11','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9715,'2012-09-18 10:26:52','weddings','weddings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ncmvp7lpmt19bj2nps8os232b0'),
	(9716,'2012-09-18 10:27:09','wedding','wedding','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'ncmvp7lpmt19bj2nps8os232b0'),
	(9717,'2012-09-18 10:27:26','wedding','wedding','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'ncmvp7lpmt19bj2nps8os232b0'),
	(9718,'2012-09-18 11:25:57','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9719,'2012-09-18 11:26:44','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9720,'2012-09-18 11:49:52','Luke 2','luke 2','teachings',5,52,'3ovu33q8a9k820p8ii1h7jout2'),
	(9721,'2012-09-18 11:52:17','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9722,'2012-09-18 11:53:12','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9723,'2012-09-18 11:53:37','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'lf3j0lkarahgqttdn9bdv53ik0'),
	(9724,'2012-09-18 11:58:28','M1-501','m1-501','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9725,'2012-09-18 12:04:02','M1-145','m1-145','teachings,teachings-tags,teachings-series',1,0,'dvf7c9jprdklhfl6v6k87kug12'),
	(9726,'2012-09-18 12:04:12','M1-145','m1-145','teachings-series',1,0,'dvf7c9jprdklhfl6v6k87kug12'),
	(9727,'2012-09-18 12:04:20','M1-145','m1-145','teachings',1,0,'dvf7c9jprdklhfl6v6k87kug12'),
	(9728,'2012-09-18 12:04:42','through the bible','through the bible','teachings',1,203,'dvf7c9jprdklhfl6v6k87kug12'),
	(9729,'2012-09-18 12:05:38','through the bible','through the bible','teachings',1,203,'dvf7c9jprdklhfl6v6k87kug12'),
	(9730,'2012-09-18 12:26:40','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9731,'2012-09-18 12:30:05','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9732,'2012-09-18 13:41:16','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'0eksmc77asv7m18vjuncuvdk64'),
	(9733,'2012-09-18 13:41:39','isaiah','isaiah','teachings',1,4,'0eksmc77asv7m18vjuncuvdk64'),
	(9734,'2012-09-18 13:41:54','isaiah','isaiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'0eksmc77asv7m18vjuncuvdk64'),
	(9735,'2012-09-18 14:03:21','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9736,'2012-09-18 14:04:01','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9737,'2012-09-18 14:07:37','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9738,'2012-09-18 14:08:06','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,33,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9739,'2012-09-18 14:13:12','pray','pray','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9740,'2012-09-18 14:14:38','unbelief','unbelief','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9741,'2012-09-18 14:15:07','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9742,'2012-09-18 14:15:24','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,33,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9743,'2012-09-18 14:16:00','prayer','prayer','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,33,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9744,'2012-09-18 14:16:21','praying','praying','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9745,'2012-09-18 14:26:07','prayer with a promise','prayer with a promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9746,'2012-09-18 14:26:42','promise','promise','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,17,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9747,'2012-09-18 14:33:40','first of all know','first of all know','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9748,'2012-09-18 14:34:00','know','know','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,31,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9749,'2012-09-18 14:36:27','know','know','teachings,teachings-tags,teachings-series',1,17,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9750,'2012-09-18 14:48:46','Jesus','jesus','teachings,teachings-tags,teachings-series',1,183,'gbjadtr5nns9tgfhqva264uhq4'),
	(9751,'2012-09-18 15:26:45','sabbath','sabbath','teachings,teachings-tags,teachings-series',1,4,'9aq9ca60qcrq6j3emdru9h13a7'),
	(9752,'2012-09-18 15:27:36','sabbath','sabbath','teachings,teachings-tags,teachings-series',1,4,'9aq9ca60qcrq6j3emdru9h13a7'),
	(9753,'2012-09-18 15:32:21','know','know','teachings,teachings-tags,teachings-series',1,17,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9754,'2012-09-18 15:32:48','know','know','teachings,teachings-tags,teachings-series',1,17,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(9755,'2012-09-18 15:38:13','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,17,'qlfi91upfs926tp9oljviaprf2'),
	(9756,'2012-09-18 15:38:25','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'qlfi91upfs926tp9oljviaprf2'),
	(9757,'2012-09-18 16:23:31','acts 17','acts 17','teachings,teachings-tags,teachings-series',1,50,'qmblbj08t1toe8cefa1ap2v141'),
	(9758,'2012-09-18 16:23:47','acts 17','acts 17','teachings,teachings-tags,teachings-series',2,50,'qmblbj08t1toe8cefa1ap2v141'),
	(9759,'2012-09-18 16:24:20','acts 17','acts 17','teachings,teachings-tags,teachings-series',2,50,'qmblbj08t1toe8cefa1ap2v141'),
	(9760,'2012-09-18 18:24:01','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'u2u18l7alkald1tr56i2fo0bk3'),
	(9761,'2012-09-18 18:24:30','speaking in tongues','speaking in tongues','teachings,teachings-tags,teachings-series',1,1,'b1iqemhr5prjsajnguqsfi8sq4'),
	(9762,'2012-09-18 18:25:44','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'u2u18l7alkald1tr56i2fo0bk3'),
	(9763,'2012-09-18 18:26:31','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'u2u18l7alkald1tr56i2fo0bk3'),
	(9764,'2012-09-18 18:27:01','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'u2u18l7alkald1tr56i2fo0bk3'),
	(9765,'2012-09-18 18:30:57','yoked','yoked','teachings,teachings-tags,teachings-series',1,2,'u2u18l7alkald1tr56i2fo0bk3'),
	(9766,'2012-09-18 21:15:46','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'3ia8uadr1rnv79gi3ullpe93q0'),
	(9767,'2012-09-18 22:23:53','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9768,'2012-09-19 06:39:07','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'k3itqcp4mdainjph8907fagl46'),
	(9769,'2012-09-19 07:51:20','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9770,'2012-09-19 08:28:24','September 16, 2012','september 16, 2012','teachings,teachings-tags,teachings-series',1,0,'15ag6r0pr1qocjhba43am2gc92'),
	(9771,'2012-09-19 08:36:44','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9772,'2012-09-19 08:58:11','s1-555','s1-555','teachings,teachings-tags,teachings-series',1,1,'h33ieg2fnhm6sbs76gu37fek50'),
	(9773,'2012-09-19 09:02:24','M1-502','m1-502','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9774,'2012-09-19 10:35:10','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9775,'2012-09-19 10:35:18','M1-503','m1-503','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'ssm4k80ud5l4ud58gqe7kqqqk7'),
	(9776,'2012-09-19 10:39:49','revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'jvqftlgtr62sr9j2liq4c9ine4'),
	(9777,'2012-09-19 11:49:30','Mark','mark','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'k3itqcp4mdainjph8907fagl46'),
	(9778,'2012-09-19 14:22:52','Hebrews 2012','hebrews 2012','teachings,teachings-tags,teachings-series',1,14,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9779,'2012-09-19 14:23:04','Hebrews 2012','hebrews 2012','teachings,teachings-tags,teachings-series',2,14,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9780,'2012-09-19 14:23:17','Hebrews 2012','hebrews 2012','teachings,teachings-tags,teachings-series',2,14,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9781,'2012-09-19 14:23:29','Hebrews 2012','hebrews 2012','teachings,teachings-tags,teachings-series',2,14,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9782,'2012-09-19 14:24:15','Hebrews 2012','hebrews 2012','teachings-series',1,1,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9783,'2012-09-19 14:24:29','Hebrews 2012','hebrews 2012','teachings',1,13,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9784,'2012-09-19 14:25:12','Hebrews 2012','hebrews 2012','downloads',1,0,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9785,'2012-09-19 14:25:22','Hebrews 2012','hebrews 2012','teachings-series',1,1,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9786,'2012-09-19 14:26:00','Hebrews 2012','hebrews 2012','downloads',1,0,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9787,'2012-09-19 14:26:03','Hebrews 2012','hebrews 2012','teachings',1,13,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9788,'2012-09-19 14:27:15','Hebrews 2012','hebrews 2012','teachings',2,13,'khdo8q5jm0nidc7hhfu2p4tma5'),
	(9789,'2012-09-19 14:56:59','Special needs','special needs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0vgeaqihol58vhu99usrns6pu7'),
	(9790,'2012-09-19 15:59:01','1 samuel','1 samuel','teachings,teachings-tags,teachings-series',1,6,'77a8gop4msb92abqhufdgkp1a2'),
	(9791,'2012-09-19 16:45:51','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9792,'2012-09-19 16:47:20','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9793,'2012-09-19 17:26:59','M1-504','m1-504','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9794,'2012-09-19 17:27:36','M1-504','m1-504','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9795,'2012-09-19 17:27:50','M1-504','m1-504','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9796,'2012-09-19 17:28:23','M1-504','m1-504','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9797,'2012-09-19 17:32:56','timothy','timothy','teachings,teachings-tags,teachings-series',1,25,'qnmjqvivv7f5rqj93r1chtv8j4'),
	(9798,'2012-09-19 17:33:37','timothy','timothy','teachings,teachings-tags,teachings-series',2,25,'qnmjqvivv7f5rqj93r1chtv8j4'),
	(9799,'2012-09-19 17:39:20','wensday night location','wensday night location','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k3a0posd99sakjil7dvvhs67r1'),
	(9800,'2012-09-19 17:51:58','live','live','teachings,teachings-tags,teachings-series',1,33,'pj6oqci8250hdv6287nom1qrd7'),
	(9801,'2012-09-19 19:11:09','1 Corinithans 13','1 corinithans 13','teachings,teachings-tags,teachings-series',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9802,'2012-09-19 19:11:25','Corinithians','corinithians','teachings,teachings-tags,teachings-series',1,0,'isphqhfc21scmr5kq73rgo0te6'),
	(9803,'2012-09-19 19:11:40','corinthians','corinthians','teachings,teachings-tags,teachings-series',1,51,'isphqhfc21scmr5kq73rgo0te6'),
	(9804,'2012-09-19 19:12:07','corinthians','corinthians','teachings,teachings-tags,teachings-series',2,51,'isphqhfc21scmr5kq73rgo0te6'),
	(9805,'2012-09-19 19:12:24','corinthians','corinthians','teachings,teachings-tags,teachings-series',3,51,'isphqhfc21scmr5kq73rgo0te6'),
	(9806,'2012-09-19 20:10:41','Perfect','perfect','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,16,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9807,'2012-09-19 20:11:13','Perfect','perfect','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,16,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9808,'2012-09-19 20:13:35','Sins','sins','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9809,'2012-09-19 20:14:24','Atonement','atonement','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9810,'2012-09-19 20:53:54','Brett','brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,135,'shmqk6vafnidfi35i54h21f3f2'),
	(9811,'2012-09-19 20:55:21','Ruth','ruth','teachings,teachings-tags,teachings-series',1,20,'m3kb3r4akpd5kvun6ii1c6ic94'),
	(9812,'2012-09-19 20:55:40','Ruth','ruth','teachings',1,15,'m3kb3r4akpd5kvun6ii1c6ic94'),
	(9813,'2012-09-19 20:56:04','Ruth','ruth','teachings',2,15,'m3kb3r4akpd5kvun6ii1c6ic94'),
	(9814,'2012-09-19 20:56:44','Brett','brett','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,135,'shmqk6vafnidfi35i54h21f3f2'),
	(9815,'2012-09-19 20:57:07','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'shmqk6vafnidfi35i54h21f3f2'),
	(9816,'2012-09-19 21:00:33','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'shmqk6vafnidfi35i54h21f3f2'),
	(9817,'2012-09-19 21:03:27','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'shmqk6vafnidfi35i54h21f3f2'),
	(9818,'2012-09-19 21:05:34','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'ra1qd40qm09ncfps719ketfel1'),
	(9819,'2012-09-19 21:08:01','ephesians','ephesians','teachings,teachings-tags,teachings-series',2,22,'ra1qd40qm09ncfps719ketfel1'),
	(9820,'2012-09-19 21:14:00','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'ra1qd40qm09ncfps719ketfel1'),
	(9821,'2012-09-19 21:19:20','Homon','homon','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'sp9g78rvuec582m17q0qu0u9f2'),
	(9822,'2012-09-19 21:20:35','Homosexuality','homosexuality','teachings,teachings-tags,teachings-series',1,2,'sp9g78rvuec582m17q0qu0u9f2'),
	(9823,'2012-09-19 21:20:44','homosexuality','homosexuality','teachings,teachings-tags,teachings-series',1,2,'sp9g78rvuec582m17q0qu0u9f2'),
	(9824,'2012-09-19 21:21:23','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9825,'2012-09-19 21:29:16','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,15,'itgeplf7ron1bgitqaml5l9o73'),
	(9826,'2012-09-19 21:38:26','Abraham','abraham','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'shmqk6vafnidfi35i54h21f3f2'),
	(9827,'2012-09-19 21:39:08','anchor','anchor','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'shmqk6vafnidfi35i54h21f3f2'),
	(9828,'2012-09-19 21:39:23','relativism','relativism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'shmqk6vafnidfi35i54h21f3f2'),
	(9829,'2012-09-19 21:42:09','baby','baby','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'shmqk6vafnidfi35i54h21f3f2'),
	(9830,'2012-09-19 22:02:52','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'haacc6kd2178ao4drv8elce9a6'),
	(9831,'2012-09-19 22:03:42','Tad is Awesome','tad is awesome','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'haacc6kd2178ao4drv8elce9a6'),
	(9832,'2012-09-19 22:14:04','Harvest party','harvest party','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'sudo0pid4g2e847s393itq4en5'),
	(9833,'2012-09-19 22:35:56','psalm 127','psalm 127','teachings,teachings-tags,teachings-series',1,0,'h4c33hq8s173ahuplujhek8pi0'),
	(9834,'2012-09-20 00:43:48','Revelation','revelation','teachings,teachings-tags,teachings-series',1,37,'15ag6r0pr1qocjhba43am2gc92'),
	(9835,'2012-09-20 01:22:22','kirk','kirk','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9836,'2012-09-20 01:25:37','kjh','kjh','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9837,'2012-09-20 01:26:06','kirk','kirk','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9838,'2012-09-20 01:26:23','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,210,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9839,'2012-09-20 01:26:50','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,210,'0s83m08e7t0l1oppe5ne8j8gv4'),
	(9840,'2012-09-20 04:45:20','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,17,'n16mdfm9gbnrusgisluu13orj5'),
	(9841,'2012-09-20 04:45:44','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,17,'n16mdfm9gbnrusgisluu13orj5'),
	(9842,'2012-09-20 05:52:03','rapture','rapture','teachings,teachings-tags,teachings-series',1,7,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9843,'2012-09-20 06:33:29','Hebrews','hebrews','teachings,teachings-tags,teachings-series',1,15,'lja723vigf0bl4i1npjgrtl2i4'),
	(9844,'2012-09-20 06:45:58','M1-505','m1-505','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9845,'2012-09-20 06:46:22','M1-505','m1-505','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9846,'2012-09-20 06:46:49','M1-505','m1-505','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9847,'2012-09-20 07:23:00','nehemiah','nehemiah','teachings,teachings-tags,teachings-series',1,0,'0j9tjumkkne5bsed5ajdjtorq2'),
	(9848,'2012-09-20 08:06:14','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,210,'shmqk6vafnidfi35i54h21f3f2'),
	(9849,'2012-09-20 08:07:13','Test search','test search','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'shmqk6vafnidfi35i54h21f3f2'),
	(9850,'2012-09-20 10:24:23','9-19-12 wednesday night service','9-19-12 wednesday night service','teachings,teachings-tags,teachings-series',1,0,'lm9if4iectr8koa3s3enrojod2'),
	(9851,'2012-09-20 10:24:37','9-19-12 wednesday night service','9-19-12 wednesday night service','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'lm9if4iectr8koa3s3enrojod2'),
	(9852,'2012-09-20 10:24:48','services','services','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'lm9if4iectr8koa3s3enrojod2'),
	(9853,'2012-09-20 10:25:08','services','services','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'lm9if4iectr8koa3s3enrojod2'),
	(9854,'2012-09-20 12:04:36','Matt Hamilton','matt hamilton','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4qd728jl2ibaiditklai62iom7'),
	(9855,'2012-09-20 12:05:03','Guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,29,'4qd728jl2ibaiditklai62iom7'),
	(9856,'2012-09-20 12:05:48','Guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,29,'4qd728jl2ibaiditklai62iom7'),
	(9857,'2012-09-20 12:06:15','Guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,29,'4qd728jl2ibaiditklai62iom7'),
	(9858,'2012-09-20 12:06:43','Guest speaker','guest speaker','teachings',1,29,'4qd728jl2ibaiditklai62iom7'),
	(9859,'2012-09-20 12:07:11','Guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,29,'4qd728jl2ibaiditklai62iom7'),
	(9860,'2012-09-20 12:18:51','Samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'k3itqcp4mdainjph8907fagl46'),
	(9861,'2012-09-20 12:19:13','samuel','samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'k3itqcp4mdainjph8907fagl46'),
	(9862,'2012-09-20 12:19:35','1 samuel','1 samuel','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'k3itqcp4mdainjph8907fagl46'),
	(9863,'2012-09-20 12:19:54','Isaiah','isaiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'k3itqcp4mdainjph8907fagl46'),
	(9864,'2012-09-20 12:20:46','Isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'k3itqcp4mdainjph8907fagl46'),
	(9865,'2012-09-20 12:20:57','Isaiah','isaiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'k3itqcp4mdainjph8907fagl46'),
	(9866,'2012-09-20 12:43:50','revelations','Revelation','teachings,teachings-tags,teachings-series',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(9867,'2012-09-20 13:39:13','M1-506','m1-506','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9868,'2012-09-20 14:46:23','M1-507','m1-507','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9869,'2012-09-20 15:57:43','ruth','ruth','teachings,teachings-tags,teachings-series',1,20,'7k1oa70gc7dqqk7dd1beqhesg7'),
	(9870,'2012-09-20 17:02:57','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'4r1nfsetl0tavrkjji3ge4p384'),
	(9871,'2012-09-20 17:03:07','ustream','ustream','teachings',1,0,'4r1nfsetl0tavrkjji3ge4p384'),
	(9872,'2012-09-20 17:03:19','video messages','video messages','teachings',1,0,'4r1nfsetl0tavrkjji3ge4p384'),
	(9873,'2012-09-20 21:44:36','John 13','john 13','teachings,teachings-tags,teachings-series',1,68,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9874,'2012-09-20 21:45:01','John 13','john 13','teachings,teachings-tags,teachings-series',4,68,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9875,'2012-09-20 21:45:28','John 13','john 13','teachings,teachings-tags,teachings-series',5,68,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(9876,'2012-09-21 06:47:20','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9877,'2012-09-21 06:47:38','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9878,'2012-09-21 06:47:51','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9879,'2012-09-21 07:18:23','God Can\'t Le','god can\'t le','teachings,teachings-tags,teachings-series',1,0,'9djc7us2a0vr5o6jl4s8nabms3'),
	(9880,'2012-09-21 07:18:36','God Can\'t Lie','god can\'t lie','teachings,teachings-tags,teachings-series',1,0,'9djc7us2a0vr5o6jl4s8nabms3'),
	(9881,'2012-09-21 07:19:23','God Can','god can','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'9djc7us2a0vr5o6jl4s8nabms3'),
	(9882,'2012-09-21 08:09:48','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9883,'2012-09-21 08:10:02','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9884,'2012-09-21 09:00:37','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'mrm4ukemi3np3h6jdi5srqb634'),
	(9885,'2012-09-21 09:15:52','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9886,'2012-09-21 09:34:19','M1-507','m1-507','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9887,'2012-09-21 09:34:53','M1-507','m1-507','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9888,'2012-09-21 09:43:56','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'mrm4ukemi3np3h6jdi5srqb634'),
	(9889,'2012-09-21 09:50:01','M1-508','m1-508','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9890,'2012-09-21 09:51:04','June 27th 2010','june 27th 2010','teachings,teachings-tags,teachings-series',1,0,'nodrbshu4n21r6s9cp24l9ef66'),
	(9891,'2012-09-21 09:51:33','M1-508','m1-508','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9892,'2012-09-21 09:51:53','Acts 9','acts 9','teachings,teachings-tags,teachings-series',1,50,'nodrbshu4n21r6s9cp24l9ef66'),
	(9893,'2012-09-21 09:52:14','Acts 9','acts 9','teachings,teachings-tags,teachings-series',4,50,'nodrbshu4n21r6s9cp24l9ef66'),
	(9894,'2012-09-21 09:53:13','2010-06-27','2010-06-27','teachings,teachings-tags,teachings-series',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9895,'2012-09-21 10:37:28','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'arr2h7r6cvlvdt7j3limpe99p4'),
	(9896,'2012-09-21 10:38:26','timothy','timothy','teachings',1,22,'arr2h7r6cvlvdt7j3limpe99p4'),
	(9897,'2012-09-21 10:38:36','timothy','timothy','teachings-series',1,2,'arr2h7r6cvlvdt7j3limpe99p4'),
	(9898,'2012-09-21 12:28:30','PhroPhesy','phrophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cp2c59430ek5uj281f8861kmf2'),
	(9899,'2012-09-21 12:35:21','Prophesy','prophesy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'cp2c59430ek5uj281f8861kmf2'),
	(9900,'2012-09-21 12:35:30','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'cp2c59430ek5uj281f8861kmf2'),
	(9901,'2012-09-21 13:20:33','isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'hinh5efhkkjdip835b04cmklo1'),
	(9902,'2012-09-21 13:22:56','through the bible','through the bible','teachings,teachings-tags,teachings-series',1,205,'hinh5efhkkjdip835b04cmklo1'),
	(9903,'2012-09-21 13:23:18','through the bible','through the bible','teachings,teachings-tags,teachings-series',2,205,'hinh5efhkkjdip835b04cmklo1'),
	(9904,'2012-09-21 13:23:18','timothy','timothy','teachings,teachings-tags,teachings-series',1,25,'ffbcmnvf8tsqs87fhonj6dpk77'),
	(9905,'2012-09-21 13:28:56','prophecy','prophecy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'cp2c59430ek5uj281f8861kmf2'),
	(9906,'2012-09-21 13:42:19','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'mrm4ukemi3np3h6jdi5srqb634'),
	(9907,'2012-09-21 14:18:48','Home group locations','home group locations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'6umli31g5c96l55610t5erckn7'),
	(9908,'2012-09-21 14:20:17','Home group locations','home group locations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,19,'6umli31g5c96l55610t5erckn7'),
	(9909,'2012-09-21 14:22:02','Home group locations','home group locations','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,19,'6umli31g5c96l55610t5erckn7'),
	(9910,'2012-09-21 15:22:47','high school','high school','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'n2i0va0mf8870rtmosk32jk3b2'),
	(9911,'2012-09-21 22:47:18','Prophecy Update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'dtiu6jj2u2950e7km1q08u2ts3'),
	(9912,'2012-09-22 08:38:01','rapture','rapture','teachings,teachings-tags,teachings-series',1,7,'0vcip6mpssbk0bd208sp6rvvu7'),
	(9913,'2012-09-22 10:57:47','John 3','john 3','teachings,teachings-tags,teachings-series',1,68,'ffhed7mfja39n1raqpordo5o61'),
	(9914,'2012-09-22 10:57:56','John 3','john 3','teachings,teachings-tags,teachings-series',2,68,'ffhed7mfja39n1raqpordo5o61'),
	(9915,'2012-09-22 10:58:07','John 3','john 3','teachings,teachings-tags,teachings-series',4,68,'ffhed7mfja39n1raqpordo5o61'),
	(9916,'2012-09-22 11:51:02','why is tad awesome?','why is tad awesome?','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'19al7iimfqhcpon96d6u7oqfh1'),
	(9917,'2012-09-22 11:51:16','tad slaughter','tad slaughter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'19al7iimfqhcpon96d6u7oqfh1'),
	(9918,'2012-09-22 12:36:41','Tad','tad','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'a95cvufkloa8kcco4f5mq2t341'),
	(9919,'2012-09-22 12:36:45','Tad','tad','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'a95cvufkloa8kcco4f5mq2t341'),
	(9920,'2012-09-22 13:03:31','Jonathan','jonathan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'a95cvufkloa8kcco4f5mq2t341'),
	(9921,'2012-09-22 13:03:36','Jonathan','jonathan','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'a95cvufkloa8kcco4f5mq2t341'),
	(9922,'2012-09-22 15:21:21','Acts Introduction','acts introduction','teachings,teachings-tags,teachings-series',1,1,'psj9laj5le4t0cqpvqkomc7991'),
	(9923,'2012-09-22 17:52:01','Childrens ministry','childrens ministry','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'c8hcmrur0v9ms7ap7tijfn8h05'),
	(9924,'2012-09-22 17:52:24','children\'s','children\'s','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c8hcmrur0v9ms7ap7tijfn8h05'),
	(9925,'2012-09-22 17:54:30','Acts 6','acts 6','teachings,teachings-tags,teachings-series',1,50,'1s6hp82pivfs1669jq8ksg7900'),
	(9926,'2012-09-22 17:54:37','Acts 6','acts 6','teachings,teachings-tags,teachings-series',3,50,'1s6hp82pivfs1669jq8ksg7900'),
	(9927,'2012-09-22 17:54:45','Acts 6','acts 6','teachings',1,50,'1s6hp82pivfs1669jq8ksg7900'),
	(9928,'2012-09-22 18:06:55','watch live','watch live','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'mbugjvh75k51kji2up90pleil6'),
	(9929,'2012-09-22 18:12:52','hebrews','hebrews','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'8lpdcl008g4pda6oa6hrer42p3'),
	(9930,'2012-09-22 18:44:38','2010 bible pro','2010 bible pro','teachings,teachings-tags,teachings-series',1,12,'krt0t2f7he9jctg2kb3qn3a854'),
	(9931,'2012-09-22 19:57:20','prophecy update 2010 part 2','prophecy update 2010 part 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'krt0t2f7he9jctg2kb3qn3a854'),
	(9932,'2012-09-22 21:27:56','Podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'2vlnp1thkmsdb8iigi1squ9710'),
	(9933,'2012-09-23 07:20:03','Hebrews 11','hebrews 11','teachings,teachings-tags,teachings-series',1,16,'q7cv6fjmtk2d9m6bashm0qd2g6'),
	(9934,'2012-09-23 08:34:53','Jr. High','jr. high','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'t93m1lah1r5eke1ggbfv27ltk0'),
	(9935,'2012-09-23 08:36:13','live','live','teachings,teachings-tags,teachings-series',1,33,'bl9a64ft2m4e509a6d0s89oud2'),
	(9936,'2012-09-23 08:36:43','live','live','teachings',1,26,'bl9a64ft2m4e509a6d0s89oud2'),
	(9937,'2012-09-23 10:04:41','teachings baptism','teachings baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'hmsdrcj6iaopeldtvavu29raq6'),
	(9938,'2012-09-23 10:04:51','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hmsdrcj6iaopeldtvavu29raq6'),
	(9939,'2012-09-23 10:05:28','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hmsdrcj6iaopeldtvavu29raq6'),
	(9940,'2012-09-23 10:05:44','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hmsdrcj6iaopeldtvavu29raq6'),
	(9941,'2012-09-23 10:16:13','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hmsdrcj6iaopeldtvavu29raq6'),
	(9942,'2012-09-23 10:16:29','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'hmsdrcj6iaopeldtvavu29raq6'),
	(9943,'2012-09-23 11:41:09','sunday night celebration','sunday night celebration','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'o9jslgv5fdu7dequg2rev5o3l5'),
	(9944,'2012-09-23 13:23:42','Vision','vision','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'1tgkkogjgm1338p6lj9u3vjna1'),
	(9945,'2012-09-23 13:23:52','Vision','vision','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'dtiu6jj2u2950e7km1q08u2ts3'),
	(9946,'2012-09-23 13:24:21','vision','vision','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'dtiu6jj2u2950e7km1q08u2ts3'),
	(9947,'2012-09-23 13:25:05','Vision','vision','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,18,'dtiu6jj2u2950e7km1q08u2ts3'),
	(9948,'2012-09-23 13:32:08','july 2011','july 2011','teachings,teachings-tags,teachings-series',1,0,'nu6mhprqisg91s7r6jmhcfl677'),
	(9949,'2012-09-23 13:32:14','2010','2010','teachings,teachings-tags,teachings-series',1,119,'nu6mhprqisg91s7r6jmhcfl677'),
	(9950,'2012-09-23 13:32:55','2010 guest speaker','2010 guest speaker','teachings,teachings-tags,teachings-series',1,6,'nu6mhprqisg91s7r6jmhcfl677'),
	(9951,'2012-09-23 13:33:23','2011 guest speaker','2011 guest speaker','teachings,teachings-tags,teachings-series',1,9,'nu6mhprqisg91s7r6jmhcfl677'),
	(9952,'2012-09-23 13:50:59','live','live','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'4r1nfsetl0tavrkjji3ge4p384'),
	(9953,'2012-09-23 15:27:44','meals','meals','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'mnhcs7od7275gckn4heufr2gu2'),
	(9954,'2012-09-23 16:06:13','radio teaching broadcast of ephesians','radio teaching broadcast of ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5ahbmb5r189oo26uee145rdk76'),
	(9955,'2012-09-23 16:06:19','teachings','teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'5ahbmb5r189oo26uee145rdk76'),
	(9956,'2012-09-23 16:07:01','teachings','teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'5ahbmb5r189oo26uee145rdk76'),
	(9957,'2012-09-23 16:07:04','radio teaching broadcast of ephesians','radio teaching broadcast of ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'5ahbmb5r189oo26uee145rdk76'),
	(9958,'2012-09-23 17:11:11','mp3 audio archive','mp3 audio archive','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'tituo273jra631n3t2jli1qnr4'),
	(9959,'2012-09-23 17:11:31','mp3 audio archive','mp3 audio archive','downloads',1,0,'tituo273jra631n3t2jli1qnr4'),
	(9960,'2012-09-23 17:56:37','hours','hours','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'3r2tu3nb88f7c15o688iomj5u0'),
	(9961,'2012-09-23 17:56:52','hours','hours','events-recurring',1,0,'3r2tu3nb88f7c15o688iomj5u0'),
	(9962,'2012-09-23 18:03:13','comunion','comunion','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'3r2tu3nb88f7c15o688iomj5u0'),
	(9963,'2012-09-23 18:03:20','communion','communion','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'3r2tu3nb88f7c15o688iomj5u0'),
	(9964,'2012-09-23 19:04:38','prophesy update2010','prophesy update2010','teachings,teachings-tags,teachings-series',1,0,'krt0t2f7he9jctg2kb3qn3a854'),
	(9965,'2012-09-23 19:05:32','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'krt0t2f7he9jctg2kb3qn3a854'),
	(9966,'2012-09-23 19:14:45','marriage','marriage','teachings,teachings-tags,teachings-series',1,9,'f7fu19cvr7v91c6tjb932mduu3'),
	(9967,'2012-09-23 19:26:37','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9968,'2012-09-23 19:27:08','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9969,'2012-09-23 19:27:39','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9970,'2012-09-23 19:27:55','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9971,'2012-09-23 19:28:21','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9972,'2012-09-23 19:28:39','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9973,'2012-09-23 19:28:54','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9974,'2012-09-23 19:29:00','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9975,'2012-09-23 19:29:26','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9976,'2012-09-23 19:29:40','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9977,'2012-09-23 19:30:06','acts 8','acts 8','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,55,'ki08pjdrmb18qmf5plv20pkmm3'),
	(9978,'2012-09-23 19:58:14','religion','religion','teachings,teachings-tags,teachings-series',1,6,'9aq9ca60qcrq6j3emdru9h13a7'),
	(9979,'2012-09-23 19:59:00','religion','religion','teachings,teachings-tags,teachings-series',1,6,'9aq9ca60qcrq6j3emdru9h13a7'),
	(9980,'2012-09-23 20:14:19','February 9, 2012 womens event','february 9, 2012 womens event','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gj1ilc9fnrocr8c5beih253a0'),
	(9981,'2012-09-23 20:14:33','2:12','2:12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'7gj1ilc9fnrocr8c5beih253a0'),
	(9982,'2012-09-23 20:14:58','2:12','2:12','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'7gj1ilc9fnrocr8c5beih253a0'),
	(9983,'2012-09-23 20:15:20','women\'s events','women\'s events','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'7gj1ilc9fnrocr8c5beih253a0'),
	(9984,'2012-09-23 20:16:08','women','women','downloads',1,1,'7gj1ilc9fnrocr8c5beih253a0'),
	(9985,'2012-09-23 20:16:27','women','women','downloads',1,1,'7gj1ilc9fnrocr8c5beih253a0'),
	(9986,'2012-09-23 20:16:46','women','women','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,34,'7gj1ilc9fnrocr8c5beih253a0'),
	(9987,'2012-09-23 20:17:44','women february 9','women february 9','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gj1ilc9fnrocr8c5beih253a0'),
	(9988,'2012-09-23 20:17:50','women','women','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,34,'7gj1ilc9fnrocr8c5beih253a0'),
	(9989,'2012-09-23 20:18:04','women','women','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,34,'7gj1ilc9fnrocr8c5beih253a0'),
	(9990,'2012-09-23 23:04:55','husband','husband','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'bfkc9hr5jmj8u0piup3dtp4o75'),
	(9991,'2012-09-23 23:05:28','husband','husband','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'bfkc9hr5jmj8u0piup3dtp4o75'),
	(9992,'2012-09-23 23:06:35','husband','husband','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'bfkc9hr5jmj8u0piup3dtp4o75'),
	(9993,'2012-09-23 23:07:14','Baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'bfkc9hr5jmj8u0piup3dtp4o75'),
	(9994,'2012-09-23 23:44:57','Ephesians 1:4,5','ephesians 1:4,5','teachings,teachings-tags,teachings-series',1,0,'mn36hbipqk212vir7kbg8vtaq3'),
	(9995,'2012-09-24 00:05:03','guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,29,'q4lkfvnca31qp1o2gisob47bc6'),
	(9996,'2012-09-24 00:05:29','guest speaker','guest speaker','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,29,'q4lkfvnca31qp1o2gisob47bc6'),
	(9997,'2012-09-24 04:31:17','M1-508','m1-508','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(9998,'2012-09-24 07:54:39','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(9999,'2012-09-24 07:54:51','ephesians','ephesians','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,25,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10000,'2012-09-24 09:11:25','S1-494','s1-494','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10001,'2012-09-24 09:28:21','forgiveness','forgiveness','teachings-tags',1,2,'ho0f8csrrse7kt1mrv38tfs4k0'),
	(10002,'2012-09-24 09:42:16','forgiveness','forgiveness','teachings-tags',1,2,'ho0f8csrrse7kt1mrv38tfs4k0'),
	(10003,'2012-09-24 10:00:24','forgiveness','forgiveness','teachings-tags',1,2,'ho0f8csrrse7kt1mrv38tfs4k0'),
	(10004,'2012-09-24 10:00:37','faithfulness','faithfulness','teachings-tags',1,2,'ho0f8csrrse7kt1mrv38tfs4k0'),
	(10005,'2012-09-24 10:12:05','M1-509','m1-509','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10006,'2012-09-24 13:13:37','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10007,'2012-09-24 13:15:18','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10008,'2012-09-24 13:15:26','prophecy update','prophecy update','teachings,teachings-tags,teachings-series',1,9,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10009,'2012-09-24 13:33:40','tonges','tonges','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10010,'2012-09-24 13:34:12','tunges','tunges','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10011,'2012-09-24 14:51:48','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'l6lt3aq43583e7g0vpuqjsti94'),
	(10012,'2012-09-24 14:52:52','romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'l6lt3aq43583e7g0vpuqjsti94'),
	(10013,'2012-09-24 14:53:05','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'l6lt3aq43583e7g0vpuqjsti94'),
	(10014,'2012-09-24 14:53:37','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,41,'l6lt3aq43583e7g0vpuqjsti94'),
	(10015,'2012-09-24 14:54:07','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,41,'l6lt3aq43583e7g0vpuqjsti94'),
	(10016,'2012-09-24 15:10:52','harvest festival','harvest festival','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'d2103ee6n5hpcf439ci8cgamn3'),
	(10017,'2012-09-24 15:32:56','Romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'qfhctu78qdd9krhmlifmt30m22'),
	(10018,'2012-09-24 15:33:34','Romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,41,'qfhctu78qdd9krhmlifmt30m22'),
	(10019,'2012-09-24 15:33:42','Romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,41,'qfhctu78qdd9krhmlifmt30m22'),
	(10020,'2012-09-24 15:34:01','Romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,41,'qfhctu78qdd9krhmlifmt30m22'),
	(10021,'2012-09-24 15:37:53','S1-495','s1-495','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10022,'2012-09-24 15:38:21','spirit','spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'df4d124h807smqj07b3tt2lth5'),
	(10023,'2012-09-24 15:39:10','spirit','spirit','teachings',1,25,'df4d124h807smqj07b3tt2lth5'),
	(10024,'2012-09-24 15:39:47','spirit','spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'df4d124h807smqj07b3tt2lth5'),
	(10025,'2012-09-24 15:45:09','tongues','tongues','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10026,'2012-09-24 18:42:46','prophecy updates 2010','prophecy updates 2010','teachings,teachings-tags,teachings-series',1,0,'krt0t2f7he9jctg2kb3qn3a854'),
	(10027,'2012-09-24 18:43:07','prophecy updates','prophecy updates','teachings,teachings-tags,teachings-series',1,0,'krt0t2f7he9jctg2kb3qn3a854'),
	(10028,'2012-09-24 18:43:37','prophecy updates 2011','prophecy updates 2011','teachings,teachings-tags,teachings-series',1,0,'krt0t2f7he9jctg2kb3qn3a854'),
	(10029,'2012-09-24 18:43:40','prophecy updates 2011','prophecy updates 2011','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'krt0t2f7he9jctg2kb3qn3a854'),
	(10030,'2012-09-24 18:43:52','prophecies','prophecies','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'krt0t2f7he9jctg2kb3qn3a854'),
	(10031,'2012-09-24 20:01:13','Sunrise worship','sunrise worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'kto870pvjnerslbfvnch75t2e6'),
	(10032,'2012-09-24 20:21:31','Staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'aijncg47m7ng61kt7k0tb3m814'),
	(10033,'2012-09-24 20:22:51','Leadership','leadership','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'aijncg47m7ng61kt7k0tb3m814'),
	(10034,'2012-09-25 06:18:04','M1-510','m1-510','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10035,'2012-09-25 06:18:36','M1-509','m1-509','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10036,'2012-09-25 06:19:01','S1-495','s1-495','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10037,'2012-09-25 06:23:05','M1-510','m1-510','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10038,'2012-09-25 12:42:13','mothers','mothers','teachings-tags',1,2,'5n5dt290mu09i18rnq95g5qrf2'),
	(10039,'2012-09-25 12:44:00','debbie meador','debbie meador','teachings-tags',1,0,'5n5dt290mu09i18rnq95g5qrf2'),
	(10040,'2012-09-25 12:44:09','debbie meador','debbie meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'5n5dt290mu09i18rnq95g5qrf2'),
	(10041,'2012-09-25 12:44:49','debbie meador','debbie meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'5n5dt290mu09i18rnq95g5qrf2'),
	(10042,'2012-09-25 12:45:53','parenting','parenting','teachings-tags',1,1,'5n5dt290mu09i18rnq95g5qrf2'),
	(10043,'2012-09-25 12:54:36','online teachings','online teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'1rpcms2esj3ao8l89ejmtlpac7'),
	(10044,'2012-09-25 12:54:53','teachings','teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'1rpcms2esj3ao8l89ejmtlpac7'),
	(10045,'2012-09-25 12:59:17','forgiveness','forgiveness','teachings-tags',1,2,'1rpcms2esj3ao8l89ejmtlpac7'),
	(10046,'2012-09-25 13:21:54','Romans 1','romans 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10047,'2012-09-25 13:22:14','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10048,'2012-09-25 13:32:27','Revelation 1:4-20','revelation 1:4-20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10049,'2012-09-25 13:33:01','Revelation Chapter 1','revelation chapter 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10050,'2012-09-25 13:49:33','during hard times','during hard times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10051,'2012-09-25 13:49:51','hard times','hard times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'998b4hf29enl1vq14sj8rhaff7'),
	(10052,'2012-09-25 13:57:27','batism','batism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'b1bh6rjv9440kpp8rhsdemc370'),
	(10053,'2012-09-25 13:57:33','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'b1bh6rjv9440kpp8rhsdemc370'),
	(10054,'2012-09-25 14:42:31','S1-496','s1-496','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10055,'2012-09-25 15:59:14','1824','1824','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'4rf1bsiaoss0ga0kdfn36cdjn0'),
	(10056,'2012-09-25 19:32:00','psalm','psalm','teachings,teachings-tags,teachings-series',1,3,'kr2gt78r5kol0r55r72n6tbld7'),
	(10057,'2012-09-25 19:32:31','psalm','psalm','teachings,teachings-tags,teachings-series',1,3,'kr2gt78r5kol0r55r72n6tbld7'),
	(10058,'2012-09-25 19:32:35','psalm','psalm','teachings',1,2,'kr2gt78r5kol0r55r72n6tbld7'),
	(10059,'2012-09-26 08:59:03','hosea','hosea','teachings,teachings-tags,teachings-series',1,1,'flu2081sq4hqhb07ejotgdqgc4'),
	(10060,'2012-09-26 09:34:58','mathew','mathew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'b36p20jsp6nc5as3on7g0lg3o1'),
	(10061,'2012-09-26 09:35:28','matthew','matthew','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,33,'b36p20jsp6nc5as3on7g0lg3o1'),
	(10062,'2012-09-26 10:07:12','Jesus','jesus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,214,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10063,'2012-09-26 10:21:07','revelation 1','revelation 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10064,'2012-09-26 10:21:50','revelation 1','revelation 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10065,'2012-09-26 10:22:13','revelation 1','revelation 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10066,'2012-09-26 10:22:31','revelation 1','revelation 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10067,'2012-09-26 10:22:58','revelation 1','revelation 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'u2l7tjif1ndivk2ddvqif4hh06'),
	(10068,'2012-09-26 11:56:54','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10069,'2012-09-26 11:56:58','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10070,'2012-09-26 11:57:28','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'c45mc42pclh8381ja33tr9a9o5'),
	(10071,'2012-09-26 11:59:12','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10072,'2012-09-26 11:59:21','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10073,'2012-09-26 12:00:44','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10074,'2012-09-26 12:00:56','faith','faith','downloads',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10075,'2012-09-26 12:01:01','faith','faith','teachings',1,33,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10076,'2012-09-26 12:01:37','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10077,'2012-09-26 12:02:43','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10078,'2012-09-26 12:02:52','fit','fit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,10,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10079,'2012-09-26 12:04:52','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10080,'2012-09-26 12:05:04','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10081,'2012-09-26 12:05:17','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10082,'2012-09-26 12:09:47','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10083,'2012-09-26 12:11:39','faith','faith','events',1,0,'c45mc42pclh8381ja33tr9a9o5'),
	(10084,'2012-09-26 12:11:57','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'c45mc42pclh8381ja33tr9a9o5'),
	(10085,'2012-09-26 12:13:58','faith','faith','text',1,7,'c45mc42pclh8381ja33tr9a9o5'),
	(10086,'2012-09-26 12:21:02','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10087,'2012-09-26 12:21:07','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10088,'2012-09-26 12:22:40','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10089,'2012-09-26 12:23:12','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10090,'2012-09-26 12:23:22','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10091,'2012-09-26 12:23:37','Test','test','events',1,2,'c45mc42pclh8381ja33tr9a9o5'),
	(10092,'2012-09-26 12:24:08','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10093,'2012-09-26 12:28:07','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10094,'2012-09-26 12:29:54','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10095,'2012-09-26 12:31:49','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10096,'2012-09-26 12:36:02','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10097,'2012-09-26 12:36:16','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10098,'2012-09-26 12:36:21','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10099,'2012-09-26 12:38:46','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10100,'2012-09-26 12:38:59','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10101,'2012-09-26 12:39:03','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10102,'2012-09-26 12:46:29','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10103,'2012-09-26 12:46:33','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10104,'2012-09-26 12:51:18','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10105,'2012-09-26 12:52:02','Knight Day','knight day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10106,'2012-09-26 12:52:02','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10107,'2012-09-26 12:52:06','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'c45mc42pclh8381ja33tr9a9o5'),
	(10108,'2012-09-26 12:56:36','Knight Day','knight day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10109,'2012-09-26 13:10:00','tad slaughter','tad slaughter','teachings,teachings-tags,teachings-series',1,4,'610tmkao79f85j2ia903l7b3s0'),
	(10110,'2012-09-26 13:16:35','Knight Day','knight day','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10111,'2012-09-26 13:16:43','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10112,'2012-09-26 13:17:22','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10113,'2012-09-26 13:18:25','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10114,'2012-09-26 13:20:46','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10115,'2012-09-26 13:22:13','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10116,'2012-09-26 13:22:45','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10117,'2012-09-26 13:25:02','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10118,'2012-09-26 13:25:06','Wings of Refuge','wings of refuge','events',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10119,'2012-09-26 13:25:10','Wings of Refuge','wings of refuge','teachings',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10120,'2012-09-26 13:25:38','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10121,'2012-09-26 13:25:41','Wings of Refuge','wings of refuge','teachings-series',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10122,'2012-09-26 13:25:44','Wings of Refuge','wings of refuge','text',1,2,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10123,'2012-09-26 13:25:46','Wings of Refuge','wings of refuge','events-recurring',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10124,'2012-09-26 13:25:49','Wings of Refuge','wings of refuge','teachings-tags',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10125,'2012-09-26 13:25:55','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10126,'2012-09-26 13:26:05','Wings of Refuge','wings of refuge','events-recurring',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10127,'2012-09-26 13:26:12','Wings of Refuge','wings of refuge','downloads',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10128,'2012-09-26 13:26:12','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10129,'2012-09-26 13:26:14','Wings of Refuge','wings of refuge','events',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10130,'2012-09-26 13:26:17','Wings of Refuge','wings of refuge','text',1,2,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10131,'2012-09-26 13:26:19','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10132,'2012-09-26 13:26:20','Wings of Refuge','wings of refuge','teachings',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10133,'2012-09-26 13:26:22','Wings of Refuge','wings of refuge','teachings-series',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10134,'2012-09-26 13:26:26','Wings of Refuge','wings of refuge','teachings-tags',1,0,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10135,'2012-09-26 13:26:33','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10136,'2012-09-26 13:27:21','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10137,'2012-09-26 13:27:46','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10138,'2012-09-26 13:28:23','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10139,'2012-09-26 13:29:24','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10140,'2012-09-26 13:30:51','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10141,'2012-09-26 13:33:39','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10142,'2012-09-26 13:34:26','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10143,'2012-09-26 13:35:08','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10144,'2012-09-26 13:35:40','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10145,'2012-09-26 13:35:53','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'c45mc42pclh8381ja33tr9a9o5'),
	(10146,'2012-09-26 13:36:35','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10147,'2012-09-26 13:36:55','Wings of Refuge','wings of refuge','downloads',1,1,'qevjkjhupj8m2b4m2tek3b4f70'),
	(10148,'2012-09-26 13:48:07','john defoe','john defoe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'3q1n259e4i4m978mn8cig20nk2'),
	(10149,'2012-09-26 14:01:27','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10150,'2012-09-26 14:02:08','Wings of Refuge','wings of refuge','events',1,1,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10151,'2012-09-26 14:02:20','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10152,'2012-09-26 14:02:36','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10153,'2012-09-26 14:04:00','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'vei4ac1eim9ifme1ta3ima7je2'),
	(10154,'2012-09-26 14:04:12','Wings of Refuge','wings of refuge','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'vei4ac1eim9ifme1ta3ima7je2'),
	(10155,'2012-09-26 14:04:42','Faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,46,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10156,'2012-09-26 14:04:49','Faith Examined','faith examined','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10157,'2012-09-26 14:19:03','ezekial','ezekial','teachings,teachings-tags,teachings-series',1,0,'b9rtfab3hjsaiemspoi9ijssg3'),
	(10158,'2012-09-26 14:19:11','ezekial','ezekial','downloads',1,0,'b9rtfab3hjsaiemspoi9ijssg3'),
	(10159,'2012-09-26 14:19:23','ezekial','ezekial','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'b9rtfab3hjsaiemspoi9ijssg3'),
	(10160,'2012-09-26 14:19:28','ezekial','ezekial','teachings',1,0,'b9rtfab3hjsaiemspoi9ijssg3'),
	(10161,'2012-09-26 14:19:56','ezekiel','ezekiel','teachings',1,2,'b9rtfab3hjsaiemspoi9ijssg3'),
	(10162,'2012-09-26 14:45:28','test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'h0oaifv1ns4m0ome9nqjq9iv07'),
	(10163,'2012-09-26 15:00:08','P','p','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'44tsdsftr4ea81fmdkprlfgon7'),
	(10164,'2012-09-26 15:01:34','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'v652ak198glt7d1hni2h9tuga7'),
	(10165,'2012-09-26 15:01:50','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'v652ak198glt7d1hni2h9tuga7'),
	(10166,'2012-09-26 15:06:31','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'v652ak198glt7d1hni2h9tuga7'),
	(10167,'2012-09-26 15:07:20','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,42,'v652ak198glt7d1hni2h9tuga7'),
	(10168,'2012-09-26 15:38:02','Tithe','tithe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'vei4ac1eim9ifme1ta3ima7je2'),
	(10169,'2012-09-26 15:39:10','Tithe','tithe','teachings-tags',1,1,'vei4ac1eim9ifme1ta3ima7je2'),
	(10170,'2012-09-26 15:39:23','Tithe','tithe','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'vei4ac1eim9ifme1ta3ima7je2'),
	(10171,'2012-09-26 16:16:30','Church BBQ','church bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'bdpq3vqtm54nenk93p9ar201v1'),
	(10172,'2012-09-26 16:28:25','main services','main services','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'s20h3j6su6kfb3nnmit3kd4vv3'),
	(10173,'2012-09-26 16:28:43','wednesday','wednesday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,228,'s20h3j6su6kfb3nnmit3kd4vv3'),
	(10174,'2012-09-26 16:49:13','Reletavism','reletavism','teachings,teachings-tags,teachings-series',1,0,'gmqfcrmrj0444vqijiqmjuaqi4'),
	(10175,'2012-09-26 16:49:40','Reletavism','reletavism','teachings,teachings-tags,teachings-series',1,0,'gmqfcrmrj0444vqijiqmjuaqi4'),
	(10176,'2012-09-26 16:49:53','Reletavism','reletavism','teachings,teachings-tags,teachings-series',1,0,'gmqfcrmrj0444vqijiqmjuaqi4'),
	(10177,'2012-09-26 16:50:01','Relatavism','relatavism','teachings,teachings-tags,teachings-series',1,0,'gmqfcrmrj0444vqijiqmjuaqi4'),
	(10178,'2012-09-26 16:50:05','Relatavism','relatavism','teachings,teachings-tags,teachings-series',1,0,'gmqfcrmrj0444vqijiqmjuaqi4'),
	(10179,'2012-09-26 18:03:09','divorce','divorce','teachings,teachings-tags,teachings-series',1,2,'e00goik6j3k6uvl1f5nhqlft77'),
	(10180,'2012-09-26 18:14:48','jobs','jobs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'gbd065aaoeanfbio3c8e72jor0'),
	(10181,'2012-09-26 18:15:08','employment','employment','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'gbd065aaoeanfbio3c8e72jor0'),
	(10182,'2012-09-26 19:19:27','college group','college group','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'laq71su0f027ugmjed7jlhekf7'),
	(10183,'2012-09-26 19:32:45','Brett meador','brett meador','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,24,'laq71su0f027ugmjed7jlhekf7'),
	(10184,'2012-09-26 20:47:39','live teaching','live teaching','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'bbv3pnb0kndmk6fvar9227orr6'),
	(10185,'2012-09-26 20:48:36','live teaching','live teaching','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'bbv3pnb0kndmk6fvar9227orr6'),
	(10186,'2012-09-26 20:48:47','ustream','ustream','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bbv3pnb0kndmk6fvar9227orr6'),
	(10187,'2012-09-26 21:13:36','ephesians','ephesians','teachings,teachings-tags,teachings-series',1,22,'che437ormklf0d2if18rjdb5v1'),
	(10188,'2012-09-26 22:33:59','Marriage','marriage','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,12,'bksva0vrg81po74kl39vditlf1'),
	(10189,'2012-09-26 22:34:11','Marriage','marriage','teachings',1,5,'bksva0vrg81po74kl39vditlf1'),
	(10190,'2012-09-26 22:38:19','Homosexuality','homosexuality','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'bksva0vrg81po74kl39vditlf1'),
	(10191,'2012-09-26 22:38:26','Homosexuality','homosexuality','teachings',1,0,'bksva0vrg81po74kl39vditlf1'),
	(10192,'2012-09-26 22:38:37','Homosexual','homosexual','teachings',1,0,'bksva0vrg81po74kl39vditlf1'),
	(10193,'2012-09-26 22:38:44','Homosexual','homosexual','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'bksva0vrg81po74kl39vditlf1'),
	(10194,'2012-09-27 05:43:03','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10195,'2012-09-27 05:43:24','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10196,'2012-09-27 05:43:36','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10197,'2012-09-27 05:44:07','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10198,'2012-09-27 05:45:19','Romans','romans','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',3,41,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10199,'2012-09-27 06:46:18','judges','judges','teachings,teachings-tags,teachings-series',1,1,'opqjofb31uj66up3mcod0ma6e1'),
	(10200,'2012-09-27 06:46:33','judges','judges','downloads',1,0,'opqjofb31uj66up3mcod0ma6e1'),
	(10201,'2012-09-27 06:51:54','Relativism','relativism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'bksva0vrg81po74kl39vditlf1'),
	(10202,'2012-09-27 06:52:03','Relativism','relativism','teachings',1,2,'bksva0vrg81po74kl39vditlf1'),
	(10203,'2012-09-27 06:54:56','husband','husband','teachings,teachings-tags,teachings-series',1,6,'opqjofb31uj66up3mcod0ma6e1'),
	(10204,'2012-09-27 07:23:01','BB','bb','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bdpq3vqtm54nenk93p9ar201v1'),
	(10205,'2012-09-27 07:23:05','BBQ','bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'bdpq3vqtm54nenk93p9ar201v1'),
	(10206,'2012-09-27 07:30:52','BBQ','bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'bdpq3vqtm54nenk93p9ar201v1'),
	(10207,'2012-09-27 07:31:30','Wild West','wild west','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bdpq3vqtm54nenk93p9ar201v1'),
	(10208,'2012-09-27 07:34:25','BBQ','bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'bdpq3vqtm54nenk93p9ar201v1'),
	(10209,'2012-09-27 08:14:28','Women\'s','women\'s','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'53o4fpmbqer7h1c0g509u5jic7'),
	(10210,'2012-09-27 09:18:33','Judy','judy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'nfvja6f0ofn57ehof24aehp446'),
	(10211,'2012-09-27 09:48:55','women of refuse','women of refuse','teachings,teachings-tags,teachings-series',1,0,'63alt0k48o90smf4hs0n524k26'),
	(10212,'2012-09-27 12:55:17','rapture','rapture','teachings-tags',1,1,'litbmiiig27f1bvd2198q6hhp3'),
	(10213,'2012-09-27 12:57:58','judy','judy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'3nje3ko0v6hm9668cvdm74d5u6'),
	(10214,'2012-09-27 13:25:24','theomatics','theomatics','teachings,teachings-tags,teachings-series',1,0,'euqp7g0uui2sbo5ep8r5993qk1'),
	(10215,'2012-09-27 13:25:32','mathematics','mathematics','teachings,teachings-tags,teachings-series',1,0,'euqp7g0uui2sbo5ep8r5993qk1'),
	(10216,'2012-09-27 13:25:40','geneology','geneology','teachings,teachings-tags,teachings-series',1,0,'euqp7g0uui2sbo5ep8r5993qk1'),
	(10217,'2012-09-27 13:27:23','matthew 1','matthew 1','teachings,teachings-tags,teachings-series',1,34,'euqp7g0uui2sbo5ep8r5993qk1'),
	(10218,'2012-09-27 13:31:31','Acts 6','acts 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(10219,'2012-09-27 13:31:52','Acts 6','acts 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',4,55,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(10220,'2012-09-27 13:32:06','Acts 6','acts 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,55,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(10221,'2012-09-27 13:36:53','salvation','salvation','teachings-tags',1,1,'6i9j587notc1gadi1arp69tur1'),
	(10222,'2012-09-27 13:42:50','6931591230_8f5175f382_z-50566c17aa3e4.jpeg','6931591230_8f5175f382_z-50566c17aa3e4.jpeg','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bdpq3vqtm54nenk93p9ar201v1'),
	(10223,'2012-09-27 13:45:42','Church BBQ','church bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'bdpq3vqtm54nenk93p9ar201v1'),
	(10224,'2012-09-27 14:04:29','loving discipline','loving discipline','teachings-tags',1,0,'rv1eak6p87v5hjpnh6kggbs992'),
	(10225,'2012-09-27 14:04:57','loving discipline','loving discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'rv1eak6p87v5hjpnh6kggbs992'),
	(10226,'2012-09-27 14:05:39','7 steps to loving discipline','7 steps to loving discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'rv1eak6p87v5hjpnh6kggbs992'),
	(10227,'2012-09-27 16:23:08','Jobs','jobs','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'9j8ln6lkijruitveisrtj3kh00'),
	(10228,'2012-09-27 16:23:39','Jobs','jobs','events',1,1,'9j8ln6lkijruitveisrtj3kh00'),
	(10229,'2012-09-27 16:39:55','Acts 6','acts 6','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',5,55,'hb5kcqf3e0mt8fcl5sq635sg66'),
	(10230,'2012-09-27 18:24:05','trust','trust','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10231,'2012-09-27 18:50:09','trust','trust','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10232,'2012-09-27 19:19:44','M1-511','m1-511','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10233,'2012-09-27 20:08:16','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'arr2h7r6cvlvdt7j3limpe99p4'),
	(10234,'2012-09-27 20:08:56','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'arr2h7r6cvlvdt7j3limpe99p4'),
	(10235,'2012-09-27 20:11:13','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,26,'arr2h7r6cvlvdt7j3limpe99p4'),
	(10236,'2012-09-27 21:45:59','High school','high school','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'5kl9mb73p6rdp01iepms787cb6'),
	(10237,'2012-09-27 21:47:52','High school','high school','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,14,'5kl9mb73p6rdp01iepms787cb6'),
	(10238,'2012-09-27 21:51:44','Judy','judy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'nfvja6f0ofn57ehof24aehp446'),
	(10239,'2012-09-27 22:34:27','m1573','m1573','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'o8mr47l7tlp8vdutrs9e63sgv5'),
	(10240,'2012-09-27 22:34:36','m1-573','m1-573','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'o8mr47l7tlp8vdutrs9e63sgv5'),
	(10241,'2012-09-27 23:00:53','m1573','m1573','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'o8mr47l7tlp8vdutrs9e63sgv5'),
	(10242,'2012-09-28 06:38:45','1824','1824','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'4rf1bsiaoss0ga0kdfn36cdjn0'),
	(10243,'2012-09-28 06:44:51','bbq','bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'bdpq3vqtm54nenk93p9ar201v1'),
	(10244,'2012-09-28 06:48:49','Faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,47,'bdpq3vqtm54nenk93p9ar201v1'),
	(10245,'2012-09-28 12:06:51','Isaiah 61','isaiah 61','teachings,teachings-tags,teachings-series',1,5,'be3umhqcn7pveb8252r7qqjub2'),
	(10246,'2012-09-28 12:07:13','psalm 119','psalm 119','teachings,teachings-tags,teachings-series',1,1,'be3umhqcn7pveb8252r7qqjub2'),
	(10247,'2012-09-28 12:07:22','psalm 119','psalm 119','teachings',1,1,'be3umhqcn7pveb8252r7qqjub2'),
	(10248,'2012-09-28 15:25:31','7 steps discipline','7 steps discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10249,'2012-09-28 15:25:37','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10250,'2012-09-28 15:25:42','abner','abner','teachings',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10251,'2012-09-28 15:25:52','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10252,'2012-09-28 15:25:56','sumrall','sumrall','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10253,'2012-09-28 15:26:13','discipline','discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10254,'2012-09-28 15:26:57','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bdpq3vqtm54nenk93p9ar201v1'),
	(10255,'2012-09-28 15:27:04','sumrall','sumrall','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bdpq3vqtm54nenk93p9ar201v1'),
	(10256,'2012-09-28 15:27:39','discipline','discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bdpq3vqtm54nenk93p9ar201v1'),
	(10257,'2012-09-28 15:33:24','bbq','bbq','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'bdpq3vqtm54nenk93p9ar201v1'),
	(10258,'2012-09-28 15:44:54','Test','test','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'bdpq3vqtm54nenk93p9ar201v1'),
	(10259,'2012-09-28 16:25:59','abner','abner','teachings,teachings-tags,teachings-series',1,1,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10260,'2012-09-28 16:28:29','abner','abner','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10261,'2012-09-28 16:28:36','discipline','discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'7gh6lfrg5pri995kmfhrjl44i1'),
	(10262,'2012-09-28 16:29:40','John Weiss','john weiss','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bdpq3vqtm54nenk93p9ar201v1'),
	(10263,'2012-09-28 16:50:20','Revolutions 20','revolutions 20','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'4uqscjer8v53uqq1i9hhr7s845'),
	(10264,'2012-09-28 16:50:28','Revolutions 20','revolutions 20','teachings',1,0,'4uqscjer8v53uqq1i9hhr7s845'),
	(10265,'2012-09-28 18:32:22','Discipline','discipline','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'4ono572uon6btvjaa9vo70jcg3'),
	(10266,'2012-09-29 04:45:08','luke 4','luke 4','teachings,teachings-tags,teachings-series',1,53,'kr2gt78r5kol0r55r72n6tbld7'),
	(10267,'2012-09-29 04:45:22','luke 4','luke 4','teachings,teachings-tags,teachings-series',2,53,'kr2gt78r5kol0r55r72n6tbld7'),
	(10268,'2012-09-29 04:45:32','luke 4','luke 4','teachings,teachings-tags,teachings-series',3,53,'kr2gt78r5kol0r55r72n6tbld7'),
	(10269,'2012-09-29 12:02:30','bryn','bryn','teachings,teachings-tags,teachings-series',1,4,'9l8rtrgvs7drv7s1cjo9uav9e2'),
	(10270,'2012-09-29 13:02:52','may','may','teachings,teachings-tags,teachings-series',1,8,'9aq9ca60qcrq6j3emdru9h13a7'),
	(10271,'2012-09-29 13:03:08','may','may','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'9aq9ca60qcrq6j3emdru9h13a7'),
	(10272,'2012-09-29 13:03:17','may','may','events-recurring',1,1,'9aq9ca60qcrq6j3emdru9h13a7'),
	(10273,'2012-09-29 13:03:30','may','may','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,21,'9aq9ca60qcrq6j3emdru9h13a7'),
	(10274,'2012-09-29 13:03:32','may','may','teachings,teachings-tags,teachings-series',1,8,'9aq9ca60qcrq6j3emdru9h13a7'),
	(10275,'2012-09-29 13:34:10','baptism','baptism','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'duh2e1ur3uplq5cch49ka8reb6'),
	(10276,'2012-09-29 16:41:16','end of times','end of times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,19,'k3i9is50g2h10dppnaquvf73n0'),
	(10277,'2012-09-29 16:42:01','end of times','end of times','downloads',1,0,'k3i9is50g2h10dppnaquvf73n0'),
	(10278,'2012-09-29 16:42:07','end of times','end of times','teachings',1,14,'k3i9is50g2h10dppnaquvf73n0'),
	(10279,'2012-09-29 16:43:59','campus','campus','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ogk3eakht016f2rcea3mujd2c6'),
	(10280,'2012-09-29 16:54:34','Matt Hunter','matt hunter','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'m2agu4jhjr4doenlfmip36sc11'),
	(10281,'2012-09-29 17:48:03','end of times','end of times','teachings',1,14,'k3i9is50g2h10dppnaquvf73n0'),
	(10282,'2012-09-29 17:48:31','rapture','rapture','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'k3i9is50g2h10dppnaquvf73n0'),
	(10283,'2012-09-29 17:49:51','through the bible series','through the bible series','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k3i9is50g2h10dppnaquvf73n0'),
	(10284,'2012-09-29 17:50:02','through the bibele','through the bibele','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'k3i9is50g2h10dppnaquvf73n0'),
	(10285,'2012-09-29 17:50:11','through the bible','through the bible','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,235,'k3i9is50g2h10dppnaquvf73n0'),
	(10286,'2012-09-29 17:50:35','through the bible','through the bible','teachings-series',1,2,'k3i9is50g2h10dppnaquvf73n0'),
	(10287,'2012-09-29 17:53:26','rapture','rapture','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,8,'k3i9is50g2h10dppnaquvf73n0'),
	(10288,'2012-09-29 20:28:13','Daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'b45csgip4tpqggnfrvehb2eeo0'),
	(10289,'2012-09-29 20:28:25','Daniel','daniel','teachings',1,2,'b45csgip4tpqggnfrvehb2eeo0'),
	(10290,'2012-09-29 20:28:37','daniel','daniel','teachings',1,2,'b45csgip4tpqggnfrvehb2eeo0'),
	(10291,'2012-09-29 20:28:58','daniel 5','daniel 5','teachings',1,2,'b45csgip4tpqggnfrvehb2eeo0'),
	(10292,'2012-09-29 20:29:11','daniel 5','daniel 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'b45csgip4tpqggnfrvehb2eeo0'),
	(10293,'2012-09-29 20:29:25','daniel 5','daniel 5','downloads',1,0,'b45csgip4tpqggnfrvehb2eeo0'),
	(10294,'2012-09-29 20:29:32','daniel 5','daniel 5','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,5,'b45csgip4tpqggnfrvehb2eeo0'),
	(10295,'2012-09-29 21:18:12','sept 26 2012','sept 26 2012','teachings,teachings-tags,teachings-series',1,0,'bdbhfl0otc2jrp5l866vkksql2'),
	(10296,'2012-09-29 21:18:22','sept 26 2012','sept 26 2012','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'bdbhfl0otc2jrp5l866vkksql2'),
	(10297,'2012-09-29 21:34:34','live video','live video','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'fgct712b2egra4k9nc1lcfcvu3'),
	(10298,'2012-09-29 23:05:36','Service times','service times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'hovai5o53ik8v1pmggfr80bdb7'),
	(10299,'2012-09-29 23:24:09','fasting','fasting','teachings,teachings-tags,teachings-series',1,1,'9l8rtrgvs7drv7s1cjo9uav9e2'),
	(10300,'2012-09-30 04:24:41','Faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,47,'16r3jpddjtqkbt6lhkl244m7b5'),
	(10301,'2012-09-30 04:31:13','tithing','tithing','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'16r3jpddjtqkbt6lhkl244m7b5'),
	(10302,'2012-09-30 07:55:05','u stream','u stream','teachings,teachings-tags,teachings-series',1,0,'l8n7m1vknb1nicj2rpfgdf8eb6'),
	(10303,'2012-09-30 07:56:18','live teachings','live teachings','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'l8n7m1vknb1nicj2rpfgdf8eb6'),
	(10304,'2012-09-30 08:14:34','childcare','childcare','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'2joi8csmmh0q0bf3ea775v4381'),
	(10305,'2012-09-30 09:55:31','staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'4nphud9q9oubk7q553da3ahj47'),
	(10306,'2012-09-30 09:58:52','staff','staff','events',1,19,'4nphud9q9oubk7q553da3ahj47'),
	(10307,'2012-09-30 10:00:23','staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'4nphud9q9oubk7q553da3ahj47'),
	(10308,'2012-09-30 10:04:14','staff','staff','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,60,'4nphud9q9oubk7q553da3ahj47'),
	(10309,'2012-09-30 10:05:04','Home group','home group','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,53,'1tgkkogjgm1338p6lj9u3vjna1'),
	(10310,'2012-09-30 10:05:20','MArson','marson','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'1tgkkogjgm1338p6lj9u3vjna1'),
	(10311,'2012-09-30 10:17:22','MArson','marson','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'1tgkkogjgm1338p6lj9u3vjna1'),
	(10312,'2012-09-30 10:17:27','Home group','home group','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,53,'1tgkkogjgm1338p6lj9u3vjna1'),
	(10313,'2012-09-30 10:17:56','kids camp','kids camp','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'1he7rc8sesr9qstoeed6kr8rg5'),
	(10314,'2012-09-30 11:16:53','geneology','geneology','teachings,teachings-tags,teachings-series',1,0,'7qki0po3qmvvvloh58vd2a1v20'),
	(10315,'2012-09-30 11:58:49','arc of covenant','arc of covenant','teachings,teachings-tags,teachings-series',1,0,'7qki0po3qmvvvloh58vd2a1v20'),
	(10316,'2012-09-30 11:58:55','arc of covenant','arc of covenant','teachings,teachings-tags,teachings-series',1,0,'7qki0po3qmvvvloh58vd2a1v20'),
	(10317,'2012-09-30 11:59:00','arc','arc','teachings,teachings-tags,teachings-series',1,7,'7qki0po3qmvvvloh58vd2a1v20'),
	(10318,'2012-09-30 12:00:09','Ark of the Covenant','ark of the covenant','teachings,teachings-tags,teachings-series',1,1,'7qki0po3qmvvvloh58vd2a1v20'),
	(10319,'2012-09-30 14:22:47','weathersby','weathersby','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kh1qmboa8blvvsd7llsoi4mn45'),
	(10320,'2012-09-30 16:06:15','Love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10321,'2012-09-30 16:08:08','celebration sunday','celebration sunday','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'r2e6v33b3iepol201ifqnvs454'),
	(10322,'2012-09-30 17:04:18','Love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,43,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10323,'2012-09-30 17:04:38','Love','love','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,43,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10324,'2012-09-30 17:05:02','Love','love','teachings',1,18,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10325,'2012-09-30 17:46:39','Love','love','teachings',1,18,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10326,'2012-09-30 17:46:46','Love','love','teachings',2,18,'5qf6vmiat7u8nl2cmi81abdjr6'),
	(10327,'2012-09-30 18:00:50','Abner','abner','teachings,teachings-tags,teachings-series',1,1,'rv1eak6p87v5hjpnh6kggbs992'),
	(10328,'2012-09-30 18:25:04','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10329,'2012-09-30 18:49:40','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10330,'2012-09-30 18:50:19','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10331,'2012-09-30 20:07:47','r 24','r 24','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bh9ma6vmasl35ho11783rdls76'),
	(10332,'2012-09-30 20:07:58','R-024','r-024','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10333,'2012-09-30 20:08:09','R-025','r-025','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10334,'2012-09-30 20:12:28','R-026','r-026','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10335,'2012-09-30 20:15:40','R-027','r-027','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10336,'2012-09-30 20:16:58','R-017','r-017','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10337,'2012-09-30 20:17:07','R-018','r-018','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10338,'2012-09-30 20:18:01','R-019','r-019','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bh9ma6vmasl35ho11783rdls76'),
	(10339,'2012-09-30 20:31:13','prophecy','prophecy','teachings,teachings-tags,teachings-series',1,13,'6vvo8rerl6i3ngi0jcok47nku2'),
	(10340,'2012-09-30 23:00:16','Revelation 2','revelation 2','teachings,teachings-tags,teachings-series',1,38,'8otn83suedc686um7s04bs1ib3'),
	(10341,'2012-09-30 23:00:58','Revelation 2','revelation 2','teachings,teachings-tags,teachings-series',2,38,'8otn83suedc686um7s04bs1ib3'),
	(10342,'2012-10-01 04:58:30','M1-512','m1-512','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10343,'2012-10-01 06:01:26','psalm 37','psalm 37','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bagvcvqbot3c7tfb48q8jepc01'),
	(10344,'2012-10-01 06:01:39','psalm 37','psalm 37','teachings-series',1,0,'bagvcvqbot3c7tfb48q8jepc01'),
	(10345,'2012-10-01 06:01:44','psalm 37','psalm 37','teachings',1,2,'bagvcvqbot3c7tfb48q8jepc01'),
	(10346,'2012-10-01 06:01:52','psalm 37','psalm 37','downloads',1,0,'bagvcvqbot3c7tfb48q8jepc01'),
	(10347,'2012-10-01 06:01:57','psalm 37','psalm 37','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'bagvcvqbot3c7tfb48q8jepc01'),
	(10348,'2012-10-01 06:02:32','psalms 37','psalms 37','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'bagvcvqbot3c7tfb48q8jepc01'),
	(10349,'2012-10-01 06:02:44','fret','fret','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'bagvcvqbot3c7tfb48q8jepc01'),
	(10350,'2012-10-01 09:24:01','acts','acts','teachings,teachings-tags,teachings-series',1,50,'ekm8063qlsjt90hem1ehmcur92'),
	(10351,'2012-10-01 09:24:20','acts','acts','teachings,teachings-tags,teachings-series',3,50,'ekm8063qlsjt90hem1ehmcur92'),
	(10352,'2012-10-01 09:24:31','acts','acts','teachings,teachings-tags,teachings-series',5,50,'ekm8063qlsjt90hem1ehmcur92'),
	(10353,'2012-10-01 09:38:13','acts1','acts1','teachings,teachings-tags,teachings-series',1,0,'psj9laj5le4t0cqpvqkomc7991'),
	(10354,'2012-10-01 09:38:24','Acts 1','acts 1','teachings,teachings-tags,teachings-series',1,50,'psj9laj5le4t0cqpvqkomc7991'),
	(10355,'2012-10-01 09:38:58','Acts 1','acts 1','teachings,teachings-tags,teachings-series',5,50,'psj9laj5le4t0cqpvqkomc7991'),
	(10356,'2012-10-01 09:53:34','junior high','junior high','teachings,teachings-tags,teachings-series',1,0,'cq94ok9irluhcq97aulpvmigl3'),
	(10357,'2012-10-01 11:11:48','pre trib','pre trib','teachings,teachings-tags,teachings-series',1,1,'998b4hf29enl1vq14sj8rhaff7'),
	(10358,'2012-10-01 11:15:11','pre trib','pre trib','teachings,teachings-tags,teachings-series',1,1,'998b4hf29enl1vq14sj8rhaff7'),
	(10359,'2012-10-01 12:21:49','isiah','isiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10360,'2012-10-01 13:29:28','love','love','teachings,teachings-tags,teachings-series',1,25,'qh6n5sdh6ol1lsif5446trsb85'),
	(10361,'2012-10-01 13:30:02','jeremiah','jeremiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10362,'2012-10-01 13:30:11','jeremiah','jeremiah','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10363,'2012-10-01 13:30:16','jeremiah','jeremiah','events-recurring',1,0,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10364,'2012-10-01 13:30:19','jeremiah','jeremiah','teachings-series',1,1,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10365,'2012-10-01 13:30:27','psalms','psalms','teachings-series',1,0,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10366,'2012-10-01 13:30:50','matthew','matthew','teachings-series',1,0,'6pn6mnt9c70rm2d4a5uo9k05s4'),
	(10367,'2012-10-01 13:40:22','acts 6','acts 6','teachings,teachings-tags,teachings-series',1,50,'vc5tq04a8nvjipp0ekccl9joc7'),
	(10368,'2012-10-01 13:40:35','acts 6','acts 6','teachings,teachings-tags,teachings-series',2,50,'vc5tq04a8nvjipp0ekccl9joc7'),
	(10369,'2012-10-01 13:40:44','acts 6','acts 6','teachings,teachings-tags,teachings-series',3,50,'vc5tq04a8nvjipp0ekccl9joc7'),
	(10370,'2012-10-01 13:40:53','acts 6','acts 6','teachings,teachings-tags,teachings-series',4,50,'vc5tq04a8nvjipp0ekccl9joc7'),
	(10371,'2012-10-01 14:11:12','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,47,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10372,'2012-10-01 14:12:56','faith','faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,47,'a5ulbv5e0iisdis1jcv5t11ki1'),
	(10373,'2012-10-01 15:17:48','Seven','seven','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'ulsohdmnug0ct7f9ce85s45ec6'),
	(10374,'2012-10-01 19:34:13','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10375,'2012-10-01 19:34:26','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10376,'2012-10-01 20:53:45','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10377,'2012-10-01 20:53:55','acts','acts','teachings,teachings-tags,teachings-series',2,50,'8lru299o9v25586ln6q0edl8s1'),
	(10378,'2012-10-01 20:54:02','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10379,'2012-10-01 21:11:53','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10380,'2012-10-01 21:12:01','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10381,'2012-10-01 21:49:55','morning','morning','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,58,'frnel9t0g9ebooavoejlcod0k7'),
	(10382,'2012-10-01 22:30:08','Sunrise worship','sunrise worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'ue678ofvt7pv3to04uqfh56qd2'),
	(10383,'2012-10-01 22:48:06','Podcast','podcast','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'qhllp58geaclhls05ph2h1qie1'),
	(10384,'2012-10-02 07:34:52','jason birdsley','jason birdsley','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'caln9vj01397b4j8c5ad3p3gb6'),
	(10385,'2012-10-02 08:36:20','M1-513','m1-513','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10386,'2012-10-02 09:33:22','matthew 9','matthew 9','teachings,teachings-tags,teachings-series',1,34,'664drq57pi52ttkk1l92dpfe16'),
	(10387,'2012-10-02 09:34:23','matthew 9','matthew 9','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,34,'664drq57pi52ttkk1l92dpfe16'),
	(10388,'2012-10-02 11:02:19','event form','event form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'426ckdtlmfm6gdbuflk03m33l3'),
	(10389,'2012-10-02 11:02:47','event form','event form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'426ckdtlmfm6gdbuflk03m33l3'),
	(10390,'2012-10-02 11:02:59','event form','event form','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'426ckdtlmfm6gdbuflk03m33l3'),
	(10391,'2012-10-02 12:16:33','rory antis','rory antis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'heagvt1ns69467lvqle5qi55q0'),
	(10392,'2012-10-02 13:12:07','Acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,55,'606ka17b0vegkd2glsj1lulnb4'),
	(10393,'2012-10-02 13:12:34','Acts','acts','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',6,55,'606ka17b0vegkd2glsj1lulnb4'),
	(10394,'2012-10-02 13:12:55','Acts','acts','teachings',1,50,'606ka17b0vegkd2glsj1lulnb4'),
	(10395,'2012-10-02 13:13:09','Acts','acts','teachings',4,50,'606ka17b0vegkd2glsj1lulnb4'),
	(10396,'2012-10-02 18:27:55','acts 3','acts 3','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10397,'2012-10-02 18:28:03','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10398,'2012-10-02 18:28:12','acts','acts','teachings,teachings-tags,teachings-series',2,50,'8lru299o9v25586ln6q0edl8s1'),
	(10399,'2012-10-02 18:28:24','acts','acts','teachings,teachings-tags,teachings-series',4,50,'8lru299o9v25586ln6q0edl8s1'),
	(10400,'2012-10-02 18:28:36','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10401,'2012-10-02 18:35:03','Colossians 3','colossians 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,11,'l6lt3aq43583e7g0vpuqjsti94'),
	(10402,'2012-10-02 19:17:22','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10403,'2012-10-02 19:41:15','acts','acts','teachings,teachings-tags,teachings-series',1,50,'8lru299o9v25586ln6q0edl8s1'),
	(10404,'2012-10-02 19:41:23','acts','acts','teachings,teachings-tags,teachings-series',5,50,'8lru299o9v25586ln6q0edl8s1'),
	(10405,'2012-10-02 21:12:23','Hebrews 1','hebrews 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'cq57lk8pj9er2ouqm8tpdbkpt6'),
	(10406,'2012-10-02 21:30:18','Holy Spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'dtiu6jj2u2950e7km1q08u2ts3'),
	(10407,'2012-10-02 21:31:21','G-058','g-058','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dtiu6jj2u2950e7km1q08u2ts3'),
	(10408,'2012-10-02 21:31:33','G-058a','g-058a','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'dtiu6jj2u2950e7km1q08u2ts3'),
	(10409,'2012-10-02 21:31:50','Holy Spirit','holy spirit','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'dtiu6jj2u2950e7km1q08u2ts3'),
	(10410,'2012-10-02 22:59:08','Revelations','Revelation','teachings,teachings-tags,teachings-series',1,38,'kl9g6pl7jbf4larp7ubrdr57f2'),
	(10411,'2012-10-02 23:22:10','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,11,'7k1oa70gc7dqqk7dd1beqhesg7'),
	(10412,'2012-10-02 23:22:19','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',2,11,'7k1oa70gc7dqqk7dd1beqhesg7'),
	(10413,'2012-10-02 23:22:32','holy spirit','holy spirit','teachings,teachings-tags,teachings-series',1,11,'7k1oa70gc7dqqk7dd1beqhesg7'),
	(10414,'2012-10-03 05:27:32','timithoy','timithoy','teachings,teachings-tags,teachings-series',1,0,'ffbcmnvf8tsqs87fhonj6dpk77'),
	(10415,'2012-10-03 05:27:39','timithoy','timithoy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ffbcmnvf8tsqs87fhonj6dpk77'),
	(10416,'2012-10-03 05:27:53','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'ffbcmnvf8tsqs87fhonj6dpk77'),
	(10417,'2012-10-03 06:30:07','Isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'998b4hf29enl1vq14sj8rhaff7'),
	(10418,'2012-10-03 06:30:59','Isaiah','isaiah','events-recurring',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10419,'2012-10-03 06:31:12','Isaiah','isaiah','teachings-series',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10420,'2012-10-03 06:31:18','Isaiah','isaiah','teachings-series',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10421,'2012-10-03 06:31:24','Isaiah','isaiah','teachings-series',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10422,'2012-10-03 06:31:26','Isaiah','isaiah','events-recurring',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10423,'2012-10-03 06:31:30','Isaiah','isaiah','teachings,teachings-tags,teachings-series',1,5,'998b4hf29enl1vq14sj8rhaff7'),
	(10424,'2012-10-03 06:34:03','Isaiah 1','isaiah 1','teachings,teachings-tags,teachings-series',1,5,'998b4hf29enl1vq14sj8rhaff7'),
	(10425,'2012-10-03 06:34:25','Isaiah 1','isaiah 1','teachings',1,4,'998b4hf29enl1vq14sj8rhaff7'),
	(10426,'2012-10-03 06:34:35','Isaiah 1','isaiah 1','events-recurring',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10427,'2012-10-03 06:34:51','Isaiah 1','isaiah 1','events-recurring',1,0,'998b4hf29enl1vq14sj8rhaff7'),
	(10428,'2012-10-03 06:34:56','Isaiah 1','isaiah 1','teachings',1,4,'998b4hf29enl1vq14sj8rhaff7'),
	(10429,'2012-10-03 06:35:08','Isaiah 1','isaiah 1','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'998b4hf29enl1vq14sj8rhaff7'),
	(10430,'2012-10-03 07:24:43','Hebrews 11','hebrews 11','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,23,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10431,'2012-10-03 08:12:28','prophecy update','prophecy update','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,9,'7rmno58761i7c5247m3g1jlna1'),
	(10432,'2012-10-03 08:47:03','revelation 2','revelation 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'hvn36oipid47jkplkn2f0h5dg2'),
	(10433,'2012-10-03 08:47:27','revelation 2','revelation 2','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,38,'hvn36oipid47jkplkn2f0h5dg2'),
	(10434,'2012-10-03 09:08:44','M1-514','m1-514','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'nodrbshu4n21r6s9cp24l9ef66'),
	(10435,'2012-10-03 10:20:49','1 corinthians 10','1 corinthians 10','teachings,teachings-tags,teachings-series',2,51,'91d01k9gbm349fe5keufm1p263'),
	(10436,'2012-10-03 10:21:58','m1555','m1555','teachings,teachings-tags,teachings-series',1,0,'91d01k9gbm349fe5keufm1p263'),
	(10437,'2012-10-03 10:22:21','m1-555','m1-555','teachings,teachings-tags,teachings-series',1,1,'91d01k9gbm349fe5keufm1p263'),
	(10438,'2012-10-03 10:22:53','m1-554','m1-554','teachings,teachings-tags,teachings-series',1,1,'91d01k9gbm349fe5keufm1p263'),
	(10439,'2012-10-03 10:24:56','m1-554','m1-554','teachings,teachings-tags,teachings-series',1,1,'91d01k9gbm349fe5keufm1p263'),
	(10440,'2012-10-03 10:25:24','s1-536','s1-536','teachings,teachings-tags,teachings-series',1,1,'91d01k9gbm349fe5keufm1p263'),
	(10441,'2012-10-03 13:24:40','Rev 2:9-11','rev 2:9-11','teachings,teachings-tags,teachings-series',1,0,'hvn36oipid47jkplkn2f0h5dg2'),
	(10442,'2012-10-03 13:25:15','Revelation 2:8-18','revelation 2:8-18','teachings,teachings-tags,teachings-series',1,0,'hvn36oipid47jkplkn2f0h5dg2'),
	(10443,'2012-10-03 13:25:37','Revelation chapter 2','revelation chapter 2','teachings,teachings-tags,teachings-series',1,14,'hvn36oipid47jkplkn2f0h5dg2'),
	(10444,'2012-10-03 13:26:20','Revelation chapter 2','revelation chapter 2','teachings,teachings-tags,teachings-series',2,14,'hvn36oipid47jkplkn2f0h5dg2'),
	(10445,'2012-10-03 18:30:55','genesis 3','genesis 3','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'v9aq081vesakiv6ruqpcevme57'),
	(10446,'2012-10-03 19:05:42','trust','trust','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cp12d93g3tp9skni7fpkpt1g07'),
	(10447,'2012-10-03 19:29:08','trust','trust','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'cp12d93g3tp9skni7fpkpt1g07'),
	(10448,'2012-10-03 21:17:51','worship','worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,37,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10449,'2012-10-03 21:20:30','worshipservice','worshipservice','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10450,'2012-10-03 21:21:16','service worship','service worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10451,'2012-10-03 21:24:12','recorded serviceworship','recorded serviceworship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10452,'2012-10-03 21:24:32','recorded serviceworship','recorded serviceworship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10453,'2012-10-03 21:24:42','recorded serviceworship','recorded serviceworship','downloads',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10454,'2012-10-03 21:25:08','recorded serviceworship','recorded serviceworship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10455,'2012-10-03 21:26:05','sundayserviceworship','sundayserviceworship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10456,'2012-10-04 06:21:40','Hall of faith','hall of faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10457,'2012-10-04 06:22:12','\"hall of faith\"','\"hall of faith\"','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10458,'2012-10-04 06:22:31','hall of faith','hall of faith','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,6,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10459,'2012-10-04 06:37:31','timithoy','timithoy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10460,'2012-10-04 06:37:38','timothy','timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10461,'2012-10-04 06:37:49','tomato','tomato','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10462,'2012-10-04 06:38:19','rory antis','rory antis','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10463,'2012-10-04 06:39:04','geneology','geneology','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10464,'2012-10-04 06:39:49','geneology','genealogy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10465,'2012-10-04 06:41:21','service worship','service worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10466,'2012-10-04 06:43:13','psalms','Psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10467,'2012-10-04 06:43:31','psalm','psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10468,'2012-10-04 06:43:54','psalms','Psalm','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,3,'pj3ie90ic4hbf31pt9llfsrag3'),
	(10469,'2012-10-04 07:53:02','knight  day pictures','knight  day pictures','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'238sh7fcd632i0fvmkigte01l7'),
	(10470,'2012-10-04 08:32:27','Revelation','revelation','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,38,'hvn36oipid47jkplkn2f0h5dg2'),
	(10471,'2012-10-04 08:53:17','matthew 24','matthew 24','teachings,teachings-tags,teachings-series',1,34,'9l8rtrgvs7drv7s1cjo9uav9e2'),
	(10472,'2012-10-04 09:41:14','Teachings on Luke 14','teachings on luke 14','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'ibd9lk0622opkk3rje9leb8ck4'),
	(10473,'2012-10-04 09:41:39','Luke 14','luke 14','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,53,'ibd9lk0622opkk3rje9leb8ck4'),
	(10474,'2012-10-04 11:42:07','Israel','israel','teachings,teachings-tags,teachings-series',1,16,'i378ka6jkfv328p3v5o4l1s774'),
	(10475,'2012-10-04 12:01:49','Acts','acts','teachings',4,50,'606ka17b0vegkd2glsj1lulnb4'),
	(10476,'2012-10-04 12:02:17','Acts','acts','teachings',4,50,'606ka17b0vegkd2glsj1lulnb4'),
	(10477,'2012-10-04 12:02:29','Acts','acts','teachings',3,50,'606ka17b0vegkd2glsj1lulnb4'),
	(10478,'2012-10-04 13:55:10','Tuesday morning worship','tuesday morning worship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'ue678ofvt7pv3to04uqfh56qd2'),
	(10479,'2012-10-04 14:38:57','daniel','daniel','teachings,teachings-tags,teachings-series',1,4,'gntgramt3jgpc70hm01av1e3b7'),
	(10480,'2012-10-04 15:27:52','Guitar lessons','guitar lessons','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kafmn4mj0f7gnv0rtc03l3t4h0'),
	(10481,'2012-10-04 15:28:36','Guitar','guitar','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'kafmn4mj0f7gnv0rtc03l3t4h0'),
	(10482,'2012-10-04 15:28:53','Office','office','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'kafmn4mj0f7gnv0rtc03l3t4h0'),
	(10483,'2012-10-04 15:29:19','office','office','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,13,'kafmn4mj0f7gnv0rtc03l3t4h0'),
	(10484,'2012-10-04 15:46:31','Service times','service times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'hovai5o53ik8v1pmggfr80bdb7'),
	(10485,'2012-10-04 19:17:25','nervous','nervous','teachings,teachings-tags,teachings-series',1,0,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10486,'2012-10-04 19:17:51','nervous','nervous','teachings-tags',1,0,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10487,'2012-10-04 19:20:18','peace','peace','teachings-tags',1,4,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10488,'2012-10-04 19:23:44','comfort','comfort','teachings-tags',1,2,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10489,'2012-10-04 19:25:20','comfort','comfort','teachings-tags',1,2,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10490,'2012-10-04 19:25:30','comfort','comfort','teachings-tags',1,2,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10491,'2012-10-04 19:25:37','comforted','comforted','teachings-tags',1,0,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10492,'2012-10-04 19:25:41','stres','stres','teachings-tags',1,1,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10493,'2012-10-04 19:25:45','stress','stress','teachings-tags',1,1,'t90k3pq4oa2d1hviplp7cnckd0'),
	(10494,'2012-10-04 19:43:12','1 timothy','1 timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,26,'c7jp9i752orvqaebp0k5n0upr6'),
	(10495,'2012-10-04 19:44:58','1 timothy','1 timothy','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',2,26,'c7jp9i752orvqaebp0k5n0upr6'),
	(10496,'2012-10-04 20:45:50','Parenting','parenting','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,2,'a3c3bi3mfh3g164e8rf29tbfu1'),
	(10497,'2012-10-04 20:58:14','livemusicworship','livemusicworship','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'i9ujkbmvrh5vvqt60tq37fbh51'),
	(10498,'2012-10-04 22:00:32','revelation','revelation','teachings,teachings-tags,teachings-series',1,38,'kfnb2mc6aemf3f26ok60dfa695'),
	(10499,'2012-10-04 22:00:37','rapture','rapture','teachings,teachings-tags,teachings-series',1,9,'kfnb2mc6aemf3f26ok60dfa695'),
	(10500,'2012-10-04 22:00:37','rapture','rapture','teachings,teachings-tags,teachings-series',1,9,'kfnb2mc6aemf3f26ok60dfa695'),
	(10501,'2012-10-04 22:02:06','10 reasons for the rapture','10 reasons for the rapture','teachings,teachings-tags,teachings-series',1,0,'kfnb2mc6aemf3f26ok60dfa695'),
	(10502,'2012-10-04 22:02:21','pre-trib rapture','pre-trib rapture','teachings,teachings-tags,teachings-series',1,0,'kfnb2mc6aemf3f26ok60dfa695'),
	(10503,'2012-10-04 22:02:35','Rapture','rapture','teachings,teachings-tags,teachings-series',1,9,'kfnb2mc6aemf3f26ok60dfa695'),
	(10504,'2012-10-04 23:42:31','Acts 14','acts 14','teachings,teachings-tags,teachings-series',1,50,'m76qantf50a9tkdngiumdlpkm5'),
	(10505,'2012-10-04 23:42:44','Acts 14','acts 14','teachings,teachings-tags,teachings-series',2,50,'m76qantf50a9tkdngiumdlpkm5'),
	(10506,'2012-10-04 23:42:56','Acts 14','acts 14','teachings,teachings-tags,teachings-series',5,50,'m76qantf50a9tkdngiumdlpkm5'),
	(10507,'2012-10-04 23:43:07','Acts 14','acts 14','teachings,teachings-tags,teachings-series',4,50,'m76qantf50a9tkdngiumdlpkm5'),
	(10508,'2012-10-04 23:43:17','Acts 14','acts 14','teachings,teachings-tags,teachings-series',3,50,'m76qantf50a9tkdngiumdlpkm5'),
	(10509,'2012-10-05 06:08:30','1824','1824','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'4rf1bsiaoss0ga0kdfn36cdjn0'),
	(10510,'2012-10-05 06:09:08','1824','1824','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,7,'4rf1bsiaoss0ga0kdfn36cdjn0'),
	(10511,'2012-10-05 07:19:44','Service times','service times','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,4,'hovai5o53ik8v1pmggfr80bdb7'),
	(10512,'2012-10-05 11:46:05','luke','luke','teachings,teachings-tags,teachings-series',1,53,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10513,'2012-10-05 11:46:55','luke','luke','teachings,teachings-tags,teachings-series',2,53,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10514,'2012-10-05 11:47:23','luke','luke','teachings,teachings-tags,teachings-series',3,53,'ah1uu5l6cja81hmcdfb9d6deo0'),
	(10515,'2012-10-05 11:49:33','Harvest Party','harvest party','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'btg1ql176t7c9th645n1kgonq6'),
	(10516,'2012-10-05 11:49:44','Harvest','harvest','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,1,'btg1ql176t7c9th645n1kgonq6'),
	(10517,'2012-10-05 11:49:53','Halloween','halloween','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'btg1ql176t7c9th645n1kgonq6'),
	(10518,'2012-10-05 11:50:32','Halloween','halloween','events',1,0,'btg1ql176t7c9th645n1kgonq6'),
	(10519,'2012-10-05 11:50:43','Harvest','harvest','events',1,0,'btg1ql176t7c9th645n1kgonq6'),
	(10520,'2012-10-05 11:51:08','Home','home','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,65,'3odpd49lueb2lmh306226co2j5'),
	(10521,'2013-04-26 16:21:28','hello','hello','downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',1,0,'135bdec65e248479a1b2e2d62252c746');

/*!40000 ALTER TABLE `sym_search_index_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections`;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') DEFAULT 'asc',
  `hidden` enum('yes','no') NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`)
VALUES
	(1,'Members','members',15,'4','asc','no','Members'),
	(2,'Misc','misc',21,'14','asc','no','Structure'),
	(3,'Tags','tags',4,'23','asc','no','Content'),
	(5,'Locations','locations',3,'27','asc','no','Content'),
	(4,'Verses','verses',7,'24','asc','no','Content'),
	(6,'Events','events',9,'35','desc','no','Events'),
	(7,'Text','text',5,'201','asc','no','Content'),
	(8,'Images','images',2,NULL,'asc','no','Content'),
	(9,'Sections','sections',20,'115','asc','no','Structure'),
	(10,'Downloads','downloads',1,NULL,'asc','no','Content'),
	(11,'Layouts','layouts',19,'78','desc','no','Structure'),
	(13,'Teachings','teachings',12,'109','desc','no','Teachings'),
	(19,'Events: Types','events-types',11,NULL,'asc','no','Events'),
	(15,'Teachings: Tags','teachings-tags',14,'127','asc','no','Teachings'),
	(17,'Members: Roles: Types','members-roles-types',17,'132','asc','no','Members'),
	(18,'Members: Roles','members-roles',16,'242','asc','no','Members'),
	(22,'Videos','videos',8,'183','asc','no','Content'),
	(21,'Events: Recurring','events-recurring',10,'244','asc','no','Events'),
	(24,'Twitter','twitter',6,NULL,'asc','no','Content'),
	(25,'Status','status',22,NULL,'asc','no','Structure'),
	(26,'Alerts','alerts',18,NULL,'asc','no','Operations'),
	(27,'Teachings: Series','teachings-series',13,'240','asc','no','Teachings'),
	(28,'Featured','featured',23,NULL,'asc','no','Content');

/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections_association`;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`)
VALUES
	(525,7,148,3,148,'yes'),
	(758,1,151,3,151,'yes'),
	(854,8,139,3,139,'yes'),
	(850,6,145,19,145,'yes'),
	(745,3,141,3,141,'yes'),
	(526,4,149,3,149,'yes'),
	(744,3,140,11,140,'yes'),
	(859,26,205,3,205,'yes'),
	(548,11,74,9,74,'yes'),
	(550,11,76,9,76,'yes'),
	(549,11,75,9,75,'yes'),
	(521,5,142,3,142,'yes'),
	(769,18,134,17,134,'yes'),
	(844,13,124,15,124,'yes'),
	(841,13,125,1,125,'yes'),
	(842,13,230,18,230,'yes'),
	(807,10,131,3,131,'yes'),
	(768,18,135,1,135,'yes'),
	(846,6,136,5,136,'yes'),
	(849,6,137,3,137,'yes'),
	(847,6,138,18,138,'yes'),
	(770,18,152,3,152,'yes'),
	(818,21,173,5,173,'yes'),
	(820,21,174,10,174,'yes'),
	(821,21,175,8,175,'yes'),
	(822,21,176,7,176,'yes'),
	(823,21,177,4,177,'yes'),
	(824,21,179,18,179,'yes'),
	(825,21,182,19,182,'yes'),
	(527,22,189,3,189,'yes'),
	(843,13,191,22,191,'yes'),
	(692,27,231,13,231,'yes'),
	(819,21,243,3,243,'yes'),
	(848,6,250,10,250,'yes'),
	(851,6,255,8,255,'yes'),
	(852,6,256,4,256,'yes'),
	(860,28,261,8,261,'yes');

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sessions`;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`)
VALUES
	('135bdec65e248479a1b2e2d62252c746',1367205539,'sym-|a:2:{s:8:\"username\";s:8:\"jdsimcoe\";s:4:\"pass\";s:40:\"7b10dfd8ecfb74eafd8778364f883ce41cb756f5\";}sym-members|a:0:{}'),
	('4614431d9a4e5f63c8b311e2fe94ffc0',1367434110,'sym-|a:2:{s:8:\"username\";s:8:\"jdsimcoe\";s:4:\"pass\";s:40:\"7b10dfd8ecfb74eafd8778364f883ce41cb756f5\";}sym-members|a:0:{}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
