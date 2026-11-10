/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-11.8.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mautic_db
-- ------------------------------------------------------
-- Server version	11.8.9-MariaDB-deb13

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
-- Table structure for table `asset_downloads`
--

DROP TABLE IF EXISTS `asset_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `email_id` int(10) unsigned DEFAULT NULL,
  `date_download` datetime NOT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext DEFAULT NULL,
  `tracking_id` varchar(191) NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `utm_campaign` varchar(191) DEFAULT NULL,
  `utm_content` varchar(191) DEFAULT NULL,
  `utm_medium` varchar(191) DEFAULT NULL,
  `utm_source` varchar(191) DEFAULT NULL,
  `utm_term` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A6494C8F5DA1941` (`asset_id`),
  KEY `IDX_A6494C8FA03F5E9F` (`ip_id`),
  KEY `IDX_A6494C8F55458D` (`lead_id`),
  KEY `IDX_A6494C8FA832C1C9` (`email_id`),
  KEY `download_tracking_search` (`tracking_id`),
  KEY `download_source_search` (`source`,`source_id`),
  KEY `asset_date_download` (`date_download`),
  CONSTRAINT `FK_A6494C8F55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A6494C8F5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6494C8FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A6494C8FA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_downloads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `asset_downloads` WRITE;
/*!40000 ALTER TABLE `asset_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_downloads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `asset_projects_xref`
--

DROP TABLE IF EXISTS `asset_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_projects_xref` (
  `asset_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`asset_id`,`project_id`),
  KEY `IDX_998AD577166D1F9C` (`project_id`),
  CONSTRAINT `FK_998AD577166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_998AD5775DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `asset_projects_xref` WRITE;
/*!40000 ALTER TABLE `asset_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `alias` varchar(191) DEFAULT NULL,
  `storage_location` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `remote_path` longtext DEFAULT NULL,
  `original_file_name` longtext DEFAULT NULL,
  `lang` varchar(191) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `download_count` int(11) NOT NULL,
  `unique_download_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `extension` varchar(191) DEFAULT NULL,
  `mime` varchar(191) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `disallow` tinyint(1) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_79D17D8E12469DE2` (`category_id`),
  KEY `asset_alias_search` (`alias`),
  CONSTRAINT `FK_79D17D8E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(191) NOT NULL,
  `bundle` varchar(50) NOT NULL,
  `object` varchar(50) NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `date_added` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_search` (`object`,`object_id`),
  KEY `timeline_search` (`bundle`,`object`,`action`,`object_id`),
  KEY `date_added_index` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES
(1,1,'Admin User','user','security',1,'login','a:1:{s:8:\"username\";s:5:\"admin\";}','2026-11-08 23:40:28','127.0.0.1'),
(2,1,'Admin User','user','security',1,'login','a:1:{s:8:\"username\";s:5:\"admin\";}','2026-11-08 23:40:38','127.0.0.1'),
(3,1,'Admin User','user','security',1,'login','a:1:{s:8:\"username\";s:5:\"admin\";}','2026-11-08 23:42:11','127.0.0.1');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `bundle_grapesjsbuilder`
--

DROP TABLE IF EXISTS `bundle_grapesjsbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_grapesjsbuilder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned DEFAULT NULL,
  `custom_mjml` longtext DEFAULT NULL,
  `draft_custom_mjml` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_56A1EB07A832C1C9` (`email_id`),
  CONSTRAINT `FK_56A1EB07A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_grapesjsbuilder`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `bundle_grapesjsbuilder` WRITE;
/*!40000 ALTER TABLE `bundle_grapesjsbuilder` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_grapesjsbuilder` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache_items`
--

DROP TABLE IF EXISTS `cache_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_items` (
  `item_id` varbinary(255) NOT NULL,
  `item_data` longblob NOT NULL,
  `item_lifetime` int(10) unsigned DEFAULT NULL,
  `item_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_items`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache_items` WRITE;
/*!40000 ALTER TABLE `cache_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_items` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_events`
--

DROP TABLE IF EXISTS `campaign_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `redirect_event_id` int(10) unsigned DEFAULT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_order` int(11) NOT NULL,
  `properties` longtext NOT NULL COMMENT '(DC2Type:array)',
  `deleted` datetime DEFAULT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `trigger_interval` int(11) DEFAULT NULL,
  `trigger_interval_unit` varchar(1) DEFAULT NULL,
  `trigger_hour` time DEFAULT NULL,
  `trigger_restricted_start_hour` time DEFAULT NULL,
  `trigger_restricted_stop_hour` time DEFAULT NULL,
  `trigger_restricted_dow` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `trigger_window` int(11) DEFAULT NULL,
  `trigger_mode` varchar(10) DEFAULT NULL,
  `decision_path` varchar(191) DEFAULT NULL,
  `temp_id` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `channel_id` varchar(64) DEFAULT NULL,
  `failed_count` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `date_added` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `date_linked` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8EC42EE735451138` (`redirect_event_id`),
  KEY `IDX_8EC42EE7F639F774` (`campaign_id`),
  KEY `IDX_8EC42EE7727ACA70` (`parent_id`),
  KEY `campaign_event_search` (`type`,`event_type`),
  KEY `campaign_event_type` (`event_type`),
  KEY `campaign_event_channel` (`channel`,`channel_id`),
  CONSTRAINT `FK_8EC42EE735451138` FOREIGN KEY (`redirect_event_id`) REFERENCES `campaign_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8EC42EE7727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `campaign_events` (`id`),
  CONSTRAINT `FK_8EC42EE7F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_events` WRITE;
/*!40000 ALTER TABLE `campaign_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_form_xref`
--

DROP TABLE IF EXISTS `campaign_form_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_form_xref` (
  `campaign_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`form_id`),
  KEY `IDX_3048A8B25FF69B7D` (`form_id`),
  CONSTRAINT `FK_3048A8B25FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3048A8B2F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_form_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_form_xref` WRITE;
/*!40000 ALTER TABLE `campaign_form_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_form_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_lead_event_failed_log`
--

DROP TABLE IF EXISTS `campaign_lead_event_failed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_lead_event_failed_log` (
  `log_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `reason` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `campaign_event_failed_date` (`date_added`),
  CONSTRAINT `FK_E50614D2EA675D86` FOREIGN KEY (`log_id`) REFERENCES `campaign_lead_event_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_lead_event_failed_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_lead_event_failed_log` WRITE;
/*!40000 ALTER TABLE `campaign_lead_event_failed_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_lead_event_failed_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_lead_event_log`
--

DROP TABLE IF EXISTS `campaign_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_lead_event_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `campaign_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  `date_triggered` datetime DEFAULT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `system_triggered` tinyint(1) NOT NULL,
  `metadata` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `channel` varchar(191) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `non_action_path_taken` tinyint(1) DEFAULT NULL,
  `date_queued` datetime DEFAULT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_rotation` (`event_id`,`lead_id`,`rotation`),
  KEY `IDX_B7420BA171F7E88B` (`event_id`),
  KEY `IDX_B7420BA155458D` (`lead_id`),
  KEY `IDX_B7420BA1F639F774` (`campaign_id`),
  KEY `IDX_B7420BA1A03F5E9F` (`ip_id`),
  KEY `campaign_event_upcoming_search` (`is_scheduled`,`lead_id`),
  KEY `campaign_event_schedule_counts` (`campaign_id`,`is_scheduled`,`trigger_date`),
  KEY `campaign_date_triggered` (`date_triggered`),
  KEY `campaign_leads` (`campaign_id`,`lead_id`,`rotation`),
  KEY `campaign_log_channel` (`channel`,`channel_id`,`lead_id`),
  KEY `campaign_actions` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `campaign_stats` (`campaign_id`,`date_triggered`,`event_id`,`non_action_path_taken`),
  KEY `campaign_trigger_date_order` (`trigger_date`),
  KEY `idx_scheduled_events` (`is_scheduled`,`event_id`,`trigger_date`),
  CONSTRAINT `FK_B7420BA155458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B7420BA171F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`),
  CONSTRAINT `FK_B7420BA1A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B7420BA1F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_lead_event_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_lead_event_log` WRITE;
/*!40000 ALTER TABLE `campaign_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_leadlist_xref`
--

DROP TABLE IF EXISTS `campaign_leadlist_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_leadlist_xref` (
  `campaign_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`leadlist_id`),
  KEY `IDX_6480052EB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_6480052EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6480052EF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_leadlist_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_leadlist_xref` WRITE;
/*!40000 ALTER TABLE `campaign_leadlist_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_leadlist_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_leads`
--

DROP TABLE IF EXISTS `campaign_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_leads` (
  `campaign_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  `date_last_exited` datetime DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`lead_id`),
  KEY `IDX_5995213D55458D` (`lead_id`),
  KEY `campaign_leads_date_added` (`date_added`),
  KEY `campaign_leads_date_exited` (`date_last_exited`),
  KEY `campaign_leads` (`campaign_id`,`manually_removed`,`lead_id`,`rotation`),
  CONSTRAINT `FK_5995213D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5995213DF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_leads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_leads` WRITE;
/*!40000 ALTER TABLE `campaign_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_leads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_projects_xref`
--

DROP TABLE IF EXISTS `campaign_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_projects_xref` (
  `campaign_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`project_id`),
  KEY `IDX_9BC3A16C166D1F9C` (`project_id`),
  CONSTRAINT `FK_9BC3A16C166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9BC3A16CF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_projects_xref` WRITE;
/*!40000 ALTER TABLE `campaign_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaign_summary`
--

DROP TABLE IF EXISTS `campaign_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned DEFAULT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `date_triggered` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `scheduled_count` int(11) NOT NULL,
  `triggered_count` int(11) NOT NULL,
  `non_action_path_taken_count` int(11) NOT NULL,
  `failed_count` int(11) NOT NULL,
  `log_counts_processed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_event_date_triggered` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `IDX_6692FA4FF639F774` (`campaign_id`),
  KEY `IDX_6692FA4F71F7E88B` (`event_id`),
  CONSTRAINT `FK_6692FA4F71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6692FA4FF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_summary`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaign_summary` WRITE;
/*!40000 ALTER TABLE `campaign_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_summary` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `republish_behavior` varchar(32) DEFAULT NULL,
  `canvas_settings` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `allow_restart` tinyint(1) NOT NULL,
  `deleted` datetime DEFAULT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_E373747012469DE2` (`category_id`),
  CONSTRAINT `FK_E373747012469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `alias` varchar(191) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `bundle` varchar(50) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `category_alias_search` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `channel_url_trackables`
--

DROP TABLE IF EXISTS `channel_url_trackables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_url_trackables` (
  `channel_id` int(11) NOT NULL,
  `redirect_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(191) NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`redirect_id`,`channel_id`),
  KEY `channel_url_trackable_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_2F81A41DB42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `page_redirects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_url_trackables`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `channel_url_trackables` WRITE;
/*!40000 ALTER TABLE `channel_url_trackables` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_url_trackables` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `social_cache` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `score` int(11) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `companyemail` varchar(191) DEFAULT NULL,
  `companyaddress1` varchar(191) DEFAULT NULL,
  `companyaddress2` varchar(191) DEFAULT NULL,
  `companyphone` varchar(191) DEFAULT NULL,
  `companycity` varchar(191) DEFAULT NULL,
  `companystate` varchar(191) DEFAULT NULL,
  `companyzipcode` varchar(191) DEFAULT NULL,
  `companycountry` varchar(191) DEFAULT NULL,
  `companyname` varchar(191) DEFAULT NULL,
  `companywebsite` varchar(191) DEFAULT NULL,
  `companyindustry` varchar(191) DEFAULT NULL,
  `companydescription` longtext DEFAULT NULL,
  `companynumber_of_employees` double DEFAULT NULL,
  `companyfax` varchar(191) DEFAULT NULL,
  `companyannual_revenue` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8244AA3A7E3C61F9` (`owner_id`),
  KEY `companynumber_of_employees_search` (`companynumber_of_employees`),
  KEY `companyfax_search` (`companyfax`),
  KEY `companyannual_revenue_search` (`companyannual_revenue`),
  KEY `company_filter` (`companyname`,`companyemail`),
  KEY `company_match` (`companyname`,`companycity`,`companycountry`,`companystate`),
  CONSTRAINT `FK_8244AA3A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `companies_leads`
--

DROP TABLE IF EXISTS `companies_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_leads` (
  `company_id` int(11) NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`lead_id`),
  KEY `IDX_F4190AB655458D` (`lead_id`),
  CONSTRAINT `FK_F4190AB655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F4190AB6979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_leads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `companies_leads` WRITE;
/*!40000 ALTER TABLE `companies_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies_leads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `company_projects_xref`
--

DROP TABLE IF EXISTS `company_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_projects_xref` (
  `company_id` int(11) NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`company_id`,`project_id`),
  KEY `IDX_26DD2E6B166D1F9C` (`project_id`),
  CONSTRAINT `FK_26DD2E6B166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_26DD2E6B979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `company_projects_xref` WRITE;
/*!40000 ALTER TABLE `company_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `contact_export_scheduler`
--

DROP TABLE IF EXISTS `contact_export_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_export_scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `scheduled_datetime` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_AC0A03CA76ED395` (`user_id`),
  CONSTRAINT `FK_AC0A03CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_export_scheduler`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `contact_export_scheduler` WRITE;
/*!40000 ALTER TABLE `contact_export_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_export_scheduler` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `contact_merge_records`
--

DROP TABLE IF EXISTS `contact_merge_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_merge_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `merged_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9B4F2BFE7A1254A` (`contact_id`),
  KEY `contact_merge_date_added` (`date_added`),
  KEY `contact_merge_ids` (`merged_id`),
  CONSTRAINT `FK_D9B4F2BFE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_merge_records`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `contact_merge_records` WRITE;
/*!40000 ALTER TABLE `contact_merge_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_merge_records` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `dynamic_content`
--

DROP TABLE IF EXISTS `dynamic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'html',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `utm_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`utm_tags`)),
  `lang` varchar(191) NOT NULL,
  `variant_settings` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `filters` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `is_campaign_based` tinyint(1) NOT NULL DEFAULT 1,
  `slot_name` varchar(191) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_20B9DEB212469DE2` (`category_id`),
  KEY `IDX_20B9DEB29091A2FB` (`translation_parent_id`),
  KEY `IDX_20B9DEB291861123` (`variant_parent_id`),
  KEY `is_campaign_based_index` (`is_campaign_based`),
  KEY `slot_name_index` (`slot_name`),
  CONSTRAINT `FK_20B9DEB212469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_20B9DEB29091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_20B9DEB291861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `dynamic_content` WRITE;
/*!40000 ALTER TABLE `dynamic_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `dynamic_content_lead_data`
--

DROP TABLE IF EXISTS `dynamic_content_lead_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_content_lead_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `dynamic_content_id` int(10) unsigned DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `slot` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_515B221B55458D` (`lead_id`),
  KEY `IDX_515B221BD9D0CD7` (`dynamic_content_id`),
  CONSTRAINT `FK_515B221B55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_515B221BD9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content_lead_data`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `dynamic_content_lead_data` WRITE;
/*!40000 ALTER TABLE `dynamic_content_lead_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content_lead_data` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `dynamic_content_projects_xref`
--

DROP TABLE IF EXISTS `dynamic_content_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_content_projects_xref` (
  `dynamic_content_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dynamic_content_id`,`project_id`),
  KEY `IDX_B9D1B7166D1F9C` (`project_id`),
  CONSTRAINT `FK_B9D1B7166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B9D1B7D9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `dynamic_content_projects_xref` WRITE;
/*!40000 ALTER TABLE `dynamic_content_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `dynamic_content_stats`
--

DROP TABLE IF EXISTS `dynamic_content_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_content_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dynamic_content_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `sent_count` int(11) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  `sent_details` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_E48FBF80D9D0CD7` (`dynamic_content_id`),
  KEY `IDX_E48FBF8055458D` (`lead_id`),
  KEY `stat_dynamic_content_search` (`dynamic_content_id`,`lead_id`),
  KEY `stat_dynamic_content_source_search` (`source`,`source_id`),
  KEY `stat_dynamic_content_date_sent` (`date_sent`),
  CONSTRAINT `FK_E48FBF8055458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E48FBF80D9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `dynamic_content` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `dynamic_content_stats` WRITE;
/*!40000 ALTER TABLE `dynamic_content_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_assets_xref`
--

DROP TABLE IF EXISTS `email_assets_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_assets_xref` (
  `email_id` int(10) unsigned NOT NULL,
  `asset_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`asset_id`),
  KEY `IDX_CA3157785DA1941` (`asset_id`),
  CONSTRAINT `FK_CA3157785DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA315778A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_assets_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_assets_xref` WRITE;
/*!40000 ALTER TABLE `email_assets_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_assets_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_copies`
--

DROP TABLE IF EXISTS `email_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_copies` (
  `id` varchar(32) NOT NULL,
  `date_created` datetime NOT NULL,
  `body` longtext DEFAULT NULL,
  `body_text` longtext DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_copies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_copies` WRITE;
/*!40000 ALTER TABLE `email_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_copies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_list_excluded`
--

DROP TABLE IF EXISTS `email_list_excluded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_list_excluded` (
  `email_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`leadlist_id`),
  KEY `IDX_3D3C217BB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_3D3C217BA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3D3C217BB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_list_excluded`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_list_excluded` WRITE;
/*!40000 ALTER TABLE `email_list_excluded` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_list_excluded` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_list_xref`
--

DROP TABLE IF EXISTS `email_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_list_xref` (
  `email_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`leadlist_id`),
  KEY `IDX_2E24F01CB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_2E24F01CA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2E24F01CB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_list_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_list_xref` WRITE;
/*!40000 ALTER TABLE `email_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_list_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_projects_xref`
--

DROP TABLE IF EXISTS `email_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_projects_xref` (
  `email_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`project_id`),
  KEY `IDX_A8C81FBE166D1F9C` (`project_id`),
  CONSTRAINT `FK_A8C81FBE166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A8C81FBEA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_projects_xref` WRITE;
/*!40000 ALTER TABLE `email_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_stat_replies`
--

DROP TABLE IF EXISTS `email_stat_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_stat_replies` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `stat_id` bigint(20) unsigned NOT NULL,
  `date_replied` datetime NOT NULL,
  `message_id` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_11E9F6E09502F0B` (`stat_id`),
  KEY `email_replies` (`stat_id`,`message_id`),
  KEY `date_email_replied` (`date_replied`),
  CONSTRAINT `FK_11E9F6E09502F0B` FOREIGN KEY (`stat_id`) REFERENCES `email_stats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stat_replies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_stat_replies` WRITE;
/*!40000 ALTER TABLE `email_stat_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stat_replies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_stats`
--

DROP TABLE IF EXISTS `email_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `copy_id` varchar(32) DEFAULT NULL,
  `email_address` varchar(191) NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_failed` tinyint(1) NOT NULL,
  `viewed_in_browser` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `open_count` int(11) DEFAULT NULL,
  `last_opened` datetime DEFAULT NULL,
  `open_details` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `generated_sent_date` date GENERATED ALWAYS AS (concat(year(`date_sent`),'-',lpad(month(`date_sent`),2,'0'),'-',lpad(dayofmonth(`date_sent`),2,'0'))) VIRTUAL COMMENT '(DC2Type:generated)',
  PRIMARY KEY (`id`),
  KEY `IDX_CA0A2625A832C1C9` (`email_id`),
  KEY `IDX_CA0A262555458D` (`lead_id`),
  KEY `IDX_CA0A26253DAE168B` (`list_id`),
  KEY `IDX_CA0A2625A03F5E9F` (`ip_id`),
  KEY `IDX_CA0A2625A8752772` (`copy_id`),
  KEY `stat_email_search` (`email_id`,`lead_id`),
  KEY `stat_email_search2` (`lead_id`,`email_id`),
  KEY `stat_email_failed_search` (`is_failed`),
  KEY `is_read_date_sent` (`is_read`,`date_sent`),
  KEY `stat_email_hash_search` (`tracking_hash`),
  KEY `stat_email_source_search` (`source`,`source_id`),
  KEY `email_date_sent` (`date_sent`),
  KEY `email_date_read_lead` (`date_read`,`lead_id`),
  KEY `stat_email_lead_id_date_sent` (`lead_id`,`date_sent`),
  KEY `stat_email_email_id_is_read` (`email_id`,`is_read`),
  KEY `generated_sent_date_email_id` (`generated_sent_date`,`email_id`),
  CONSTRAINT `FK_CA0A26253DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A262555458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A2625A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A2625A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A2625A8752772` FOREIGN KEY (`copy_id`) REFERENCES `email_copies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_stats` WRITE;
/*!40000 ALTER TABLE `email_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_stats_devices`
--

DROP TABLE IF EXISTS `email_stats_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_stats_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) unsigned DEFAULT NULL,
  `stat_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_opened` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7A8A1C6F94A4C7D4` (`device_id`),
  KEY `IDX_7A8A1C6F9502F0B` (`stat_id`),
  KEY `IDX_7A8A1C6FA03F5E9F` (`ip_id`),
  KEY `date_opened_search` (`date_opened`),
  CONSTRAINT `FK_7A8A1C6F94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `lead_devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7A8A1C6F9502F0B` FOREIGN KEY (`stat_id`) REFERENCES `email_stats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7A8A1C6FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stats_devices`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_stats_devices` WRITE;
/*!40000 ALTER TABLE `email_stats_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stats_devices` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `unsubscribeform_id` int(10) unsigned DEFAULT NULL,
  `preference_center_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  `preheader_text` varchar(191) DEFAULT NULL,
  `from_address` varchar(191) DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `reply_to_address` varchar(191) DEFAULT NULL,
  `bcc_address` varchar(191) DEFAULT NULL,
  `use_owner_as_mailer` tinyint(1) DEFAULT NULL,
  `send_to_dnc` tinyint(1) NOT NULL DEFAULT 0,
  `template` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `utm_tags` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `plain_text` longtext DEFAULT NULL,
  `custom_html` longtext DEFAULT NULL,
  `email_type` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `continue_sending` tinyint(1) NOT NULL DEFAULT 0,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `variant_sent_count` int(11) NOT NULL,
  `variant_read_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `lang` varchar(191) NOT NULL,
  `variant_settings` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `dynamic_content` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`headers`)),
  `public_preview` tinyint(1) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`settings`)),
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `IDX_4C81E85212469DE2` (`category_id`),
  KEY `IDX_4C81E8529091A2FB` (`translation_parent_id`),
  KEY `IDX_4C81E85291861123` (`variant_parent_id`),
  KEY `IDX_4C81E8522DC494F6` (`unsubscribeform_id`),
  KEY `IDX_4C81E852834F9C5B` (`preference_center_id`),
  CONSTRAINT `FK_4C81E85212469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E8522DC494F6` FOREIGN KEY (`unsubscribeform_id`) REFERENCES `forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E852834F9C5B` FOREIGN KEY (`preference_center_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E8529091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4C81E85291861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `emails_draft`
--

DROP TABLE IF EXISTS `emails_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned NOT NULL,
  `html` longtext DEFAULT NULL,
  `template` varchar(191) DEFAULT NULL,
  `public_preview` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B9C3FA10A832C1C9` (`email_id`),
  CONSTRAINT `FK_B9C3FA10A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_draft`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `emails_draft` WRITE;
/*!40000 ALTER TABLE `emails_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_draft` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `focus`
--

DROP TABLE IF EXISTS `focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `focus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `focus_type` varchar(191) NOT NULL,
  `style` varchar(191) NOT NULL,
  `website` varchar(191) DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `properties` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `utm_tags` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `form_id` int(11) DEFAULT NULL,
  `cache` longtext DEFAULT NULL,
  `html_mode` varchar(191) DEFAULT NULL,
  `editor` longtext DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_62C04AE912469DE2` (`category_id`),
  KEY `focus_type` (`focus_type`),
  KEY `focus_style` (`style`),
  KEY `focus_form` (`form_id`),
  KEY `focus_name` (`name`),
  CONSTRAINT `FK_62C04AE912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `focus` WRITE;
/*!40000 ALTER TABLE `focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `focus_projects_xref`
--

DROP TABLE IF EXISTS `focus_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `focus_projects_xref` (
  `focus_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`focus_id`,`project_id`),
  KEY `IDX_8B99D3D7166D1F9C` (`project_id`),
  CONSTRAINT `FK_8B99D3D7166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8B99D3D751804B42` FOREIGN KEY (`focus_id`) REFERENCES `focus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `focus_projects_xref` WRITE;
/*!40000 ALTER TABLE `focus_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `focus_stats`
--

DROP TABLE IF EXISTS `focus_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `focus_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `focus_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C36970DC51804B42` (`focus_id`),
  KEY `IDX_C36970DC55458D` (`lead_id`),
  KEY `focus_type` (`type`),
  KEY `focus_type_id` (`type`,`type_id`),
  KEY `focus_date_added` (`date_added`),
  CONSTRAINT `FK_C36970DC51804B42` FOREIGN KEY (`focus_id`) REFERENCES `focus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C36970DC55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `focus_stats` WRITE;
/*!40000 ALTER TABLE `focus_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `form_actions`
--

DROP TABLE IF EXISTS `form_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext NOT NULL COMMENT '(DC2Type:array)',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_342491D45FF69B7D` (`form_id`),
  KEY `form_action_type_search` (`type`),
  CONSTRAINT `FK_342491D45FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_actions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `form_actions` WRITE;
/*!40000 ALTER TABLE `form_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_actions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `label` longtext NOT NULL,
  `show_label` tinyint(1) DEFAULT NULL,
  `alias` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `custom_parameters` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `default_value` longtext DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `validation_message` longtext DEFAULT NULL,
  `help_message` longtext DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `properties` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`validation`)),
  `parent_id` varchar(191) DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`conditions`)),
  `label_attr` varchar(191) DEFAULT NULL,
  `input_attr` varchar(191) DEFAULT NULL,
  `container_attr` varchar(191) DEFAULT NULL,
  `lead_field` varchar(191) DEFAULT NULL,
  `save_result` tinyint(1) DEFAULT NULL,
  `is_auto_fill` tinyint(1) DEFAULT NULL,
  `is_read_only` tinyint(1) NOT NULL DEFAULT 0,
  `show_when_value_exists` tinyint(1) DEFAULT NULL,
  `show_after_x_submissions` int(11) DEFAULT NULL,
  `always_display` tinyint(1) DEFAULT NULL,
  `mapped_object` varchar(191) DEFAULT NULL,
  `mapped_field` varchar(191) DEFAULT NULL,
  `field_width` varchar(50) NOT NULL DEFAULT '100%',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_7C0B37265FF69B7D` (`form_id`),
  KEY `form_field_type_search` (`type`),
  CONSTRAINT `FK_7C0B37265FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_fields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `form_projects_xref`
--

DROP TABLE IF EXISTS `form_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_projects_xref` (
  `form_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`form_id`,`project_id`),
  KEY `IDX_F9294B29166D1F9C` (`project_id`),
  CONSTRAINT `FK_F9294B29166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F9294B295FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `form_projects_xref` WRITE;
/*!40000 ALTER TABLE `form_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  `referer` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C80AF9E65FF69B7D` (`form_id`),
  KEY `IDX_C80AF9E6A03F5E9F` (`ip_id`),
  KEY `IDX_C80AF9E655458D` (`lead_id`),
  KEY `IDX_C80AF9E6C4663E4` (`page_id`),
  KEY `form_submission_tracking_search` (`tracking_id`),
  KEY `form_date_submitted` (`date_submitted`),
  CONSTRAINT `FK_C80AF9E655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C80AF9E65FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C80AF9E6A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C80AF9E6C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `form_submissions` WRITE;
/*!40000 ALTER TABLE `form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `alias` varchar(191) NOT NULL,
  `lang` varchar(191) DEFAULT NULL,
  `form_attr` varchar(191) DEFAULT NULL,
  `cached_html` longtext DEFAULT NULL,
  `post_action` varchar(191) NOT NULL,
  `post_action_property` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `template` varchar(191) DEFAULT NULL,
  `in_kiosk_mode` tinyint(1) DEFAULT NULL,
  `render_style` tinyint(1) DEFAULT NULL,
  `submission_limit` int(11) DEFAULT NULL,
  `submission_limit_message` longtext DEFAULT NULL,
  `submission_count` int(11) NOT NULL,
  `form_type` varchar(191) DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `progressive_profiling_limit` int(11) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_FD3F1BF712469DE2` (`category_id`),
  CONSTRAINT `FK_FD3F1BF712469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `dir` varchar(191) NOT NULL,
  `file` varchar(191) NOT NULL,
  `original_file` varchar(191) DEFAULT NULL,
  `line_count` int(11) NOT NULL,
  `inserted_count` int(11) NOT NULL,
  `updated_count` int(11) NOT NULL,
  `ignored_count` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_ended` datetime DEFAULT NULL,
  `object` varchar(191) NOT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`properties`)),
  PRIMARY KEY (`id`),
  KEY `import_object` (`object`),
  KEY `import_status` (`status`),
  KEY `import_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `integration_entity`
--

DROP TABLE IF EXISTS `integration_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `integration` varchar(191) DEFAULT NULL,
  `integration_entity` varchar(191) DEFAULT NULL,
  `integration_entity_id` varchar(191) DEFAULT NULL,
  `internal_entity` varchar(191) DEFAULT NULL,
  `internal_entity_id` int(11) DEFAULT NULL,
  `last_sync_date` datetime DEFAULT NULL,
  `internal` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `integration_external_entity` (`integration`,`integration_entity`,`integration_entity_id`),
  KEY `integration_internal_entity` (`integration`,`internal_entity`,`internal_entity_id`),
  KEY `integration_entity_match` (`integration`,`internal_entity`,`integration_entity`),
  KEY `integration_last_sync_date` (`integration`,`last_sync_date`),
  KEY `internal_integration_entity` (`internal_entity_id`,`integration_entity_id`,`internal_entity`,`integration_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_entity`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `integration_entity` WRITE;
/*!40000 ALTER TABLE `integration_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration_entity` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ip_addresses`
--

DROP TABLE IF EXISTS `ip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `ip_details` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `ip_search` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_addresses`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ip_addresses` WRITE;
/*!40000 ALTER TABLE `ip_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_addresses` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_categories`
--

DROP TABLE IF EXISTS `lead_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12685DF412469DE2` (`category_id`),
  KEY `IDX_12685DF455458D` (`lead_id`),
  CONSTRAINT `FK_12685DF412469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_12685DF455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_categories` WRITE;
/*!40000 ALTER TABLE `lead_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_companies_change_log`
--

DROP TABLE IF EXISTS `lead_companies_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_companies_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `type` tinytext NOT NULL,
  `event_name` varchar(191) NOT NULL,
  `action_name` varchar(191) NOT NULL,
  `company_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A034C81B55458D` (`lead_id`),
  KEY `company_date_added` (`date_added`),
  CONSTRAINT `FK_A034C81B55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_companies_change_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_companies_change_log` WRITE;
/*!40000 ALTER TABLE `lead_companies_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_companies_change_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_devices`
--

DROP TABLE IF EXISTS `lead_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `client_info` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `device` varchar(191) DEFAULT NULL,
  `device_os_name` varchar(191) DEFAULT NULL,
  `device_os_shortname` varchar(191) DEFAULT NULL,
  `device_os_version` varchar(191) DEFAULT NULL,
  `device_os_platform` varchar(191) DEFAULT NULL,
  `device_brand` varchar(191) DEFAULT NULL,
  `device_model` varchar(191) DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_48C912F47D05ABBE` (`tracking_id`),
  KEY `IDX_48C912F455458D` (`lead_id`),
  KEY `date_added_search` (`date_added`),
  KEY `device_search` (`device`),
  KEY `device_os_name_search` (`device_os_name`),
  KEY `device_os_shortname_search` (`device_os_shortname`),
  KEY `device_os_version_search` (`device_os_version`),
  KEY `device_os_platform_search` (`device_os_platform`),
  KEY `device_brand_search` (`device_brand`),
  KEY `device_model_search` (`device_model`),
  CONSTRAINT `FK_48C912F455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_devices`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_devices` WRITE;
/*!40000 ALTER TABLE `lead_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_devices` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_donotcontact`
--

DROP TABLE IF EXISTS `lead_donotcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_donotcontact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `reason` smallint(6) NOT NULL,
  `channel` varchar(191) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_71DC0B1D55458D` (`lead_id`),
  KEY `leadid_reason_channel` (`lead_id`,`channel`,`reason`),
  KEY `dnc_reason_search` (`reason`),
  KEY `dnc_date_added` (`date_added`),
  CONSTRAINT `FK_71DC0B1D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_donotcontact`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_donotcontact` WRITE;
/*!40000 ALTER TABLE `lead_donotcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_donotcontact` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_event_log`
--

DROP TABLE IF EXISTS `lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_event_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(191) DEFAULT NULL,
  `bundle` varchar(191) DEFAULT NULL,
  `object` varchar(191) DEFAULT NULL,
  `action` varchar(191) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`properties`)),
  PRIMARY KEY (`id`),
  KEY `lead_id_index` (`lead_id`),
  KEY `lead_object_index` (`object`,`object_id`),
  KEY `lead_timeline_index` (`bundle`,`object`,`action`,`object_id`),
  KEY `IDX_SEARCH` (`bundle`,`object`,`action`,`object_id`,`date_added`),
  KEY `lead_timeline_action_index` (`action`),
  KEY `lead_date_added_index` (`date_added`),
  CONSTRAINT `FK_753AF2E55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_event_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_event_log` WRITE;
/*!40000 ALTER TABLE `lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_fields`
--

DROP TABLE IF EXISTS `lead_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `label` varchar(191) NOT NULL,
  `alias` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `field_group` varchar(191) DEFAULT NULL,
  `default_value` varchar(191) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_short_visible` tinyint(1) NOT NULL DEFAULT 0,
  `is_listable` tinyint(1) NOT NULL,
  `is_publicly_updatable` tinyint(1) NOT NULL,
  `is_unique_identifer` tinyint(1) DEFAULT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT 0,
  `char_length_limit` int(11) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `object` varchar(191) DEFAULT NULL,
  `properties` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `column_is_not_created` tinyint(1) NOT NULL DEFAULT 0,
  `column_is_not_removed` tinyint(1) NOT NULL DEFAULT 0,
  `original_is_published_value` tinyint(1) NOT NULL DEFAULT 0,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `idx_object_field_order_is_published` (`object`,`field_order`,`is_published`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_fields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_fields` WRITE;
/*!40000 ALTER TABLE `lead_fields` DISABLE KEYS */;
INSERT INTO `lead_fields` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Title','title','lookup','core',NULL,0,1,1,0,1,0,0,0,64,1,'lead','a:1:{s:4:\"list\";a:3:{i:0;s:2:\"Mr\";i:1;s:3:\"Mrs\";i:2;s:4:\"Miss\";}}',0,0,0,'a3f5bd25-6073-465a-a9f1-904918315810'),
(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'First Name','firstname','text','core',NULL,0,1,1,1,1,0,0,0,64,2,'lead','a:0:{}',0,0,0,'39fafa77-a57e-4012-b564-901efd83347f'),
(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Last Name','lastname','text','core',NULL,0,1,1,1,1,0,0,0,64,3,'lead','a:0:{}',0,0,0,'93306ee8-7335-4779-9a2e-c343eb847cf6'),
(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Primary company','company','text','core',NULL,0,1,1,0,1,0,0,0,64,4,'lead','a:0:{}',0,0,0,'d3271715-0c4d-4627-a517-d3a73b99681b'),
(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Position','position','text','core',NULL,0,1,1,0,1,0,0,0,64,5,'lead','a:0:{}',0,0,0,'90dec682-918e-4bd7-995b-932cf93cd44e'),
(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Email','email','email','core',NULL,0,1,1,1,1,0,1,1,64,6,'lead','a:0:{}',0,0,0,'24dc5802-d2b6-4417-a7e9-ef2472664394'),
(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mobile','mobile','tel','core',NULL,0,1,1,0,1,0,0,0,64,7,'lead','a:0:{}',0,0,0,'87c27cdd-4c89-4807-868e-9416e00d3865'),
(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','phone','tel','core',NULL,0,1,1,0,1,0,0,0,64,8,'lead','a:0:{}',0,0,0,'661ef8bc-fb95-44c6-b5a0-b9b059ee0a64'),
(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Points','points','number','core','0',0,1,1,0,1,0,0,0,64,9,'lead','a:0:{}',0,0,0,'5419d3bd-74c2-4ade-8fc8-3fe29f153f50'),
(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','fax','tel','core',NULL,0,0,1,0,1,0,0,0,64,10,'lead','a:0:{}',0,0,0,'2e320a1e-d89d-4291-92bf-cf3a074bb225'),
(11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 1','address1','text','core',NULL,0,1,1,0,1,0,0,0,64,11,'lead','a:0:{}',0,0,0,'cda07e83-6163-433e-8da0-64109161ff4f'),
(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 2','address2','text','core',NULL,0,1,1,0,1,0,0,0,64,12,'lead','a:0:{}',0,0,0,'45a6a353-67be-40e5-aa76-3d2413698bb0'),
(13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','city','text','core',NULL,0,1,1,0,1,0,0,0,64,13,'lead','a:0:{}',0,0,0,'74c01895-b717-4459-85cc-7ed41a9d827b'),
(14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','state','region','core',NULL,0,1,1,0,1,0,0,0,64,14,'lead','a:0:{}',0,0,0,'d11dbd95-3c3d-4f6a-9584-e76be7c3ddbd'),
(15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','zipcode','text','core',NULL,0,1,1,0,1,0,0,0,64,15,'lead','a:0:{}',0,0,0,'6c141dd5-9abf-42ab-86a0-f3acc97375a2'),
(16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','country','country','core',NULL,0,1,1,0,1,0,0,0,64,16,'lead','a:0:{}',0,0,0,'6358959b-7151-45c0-b788-66abe0593401'),
(17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Preferred Locale','preferred_locale','locale','core',NULL,0,1,1,0,1,0,0,0,64,17,'lead','a:0:{}',0,0,0,'fdb4456a-59b8-4112-8b4a-6667371eb288'),
(18,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Preferred Timezone','timezone','timezone','core',NULL,0,1,1,0,1,0,0,0,64,18,'lead','a:0:{}',0,0,0,'34f5079d-a3e4-428b-82dd-2cbe76460750'),
(19,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Date Last Active','last_active','datetime','core',NULL,0,1,1,0,1,0,0,0,64,19,'lead','a:0:{}',0,0,0,'59bec34a-91d4-4428-b77d-ddffa33b9b8c'),
(20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution Date','attribution_date','datetime','core',NULL,0,1,1,0,1,0,0,0,64,20,'lead','a:0:{}',0,0,0,'61b422b6-9d19-42a7-84e9-ba336d130c2b'),
(21,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution','attribution','number','core',NULL,0,1,1,0,1,0,0,0,64,21,'lead','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}',0,0,0,'65be259b-c535-47c9-a274-216f46dc801d'),
(22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','website','url','core',NULL,0,0,1,0,1,0,0,0,64,22,'lead','a:0:{}',0,0,0,'1cb4f6f4-ae46-435b-98c0-2d31989a618b'),
(23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Facebook','facebook','text','social',NULL,0,0,1,0,1,0,0,0,64,23,'lead','a:0:{}',0,0,0,'bb21f4c0-ec97-45f5-bef5-d99c23327850'),
(24,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Foursquare','foursquare','text','social',NULL,0,0,1,0,1,0,0,0,64,24,'lead','a:0:{}',0,0,0,'9a8c2c52-b628-4d0d-a695-ae8db6b1c1c7'),
(25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Instagram','instagram','text','social',NULL,0,0,1,0,1,0,0,0,64,25,'lead','a:0:{}',0,0,0,'aea69e94-9c95-42df-8664-a7b7e00d024b'),
(26,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mautic.lead.field.linkedin','linkedin','text','social',NULL,0,0,1,0,1,0,0,0,64,26,'lead','a:0:{}',0,0,0,'1db8ace4-79a6-40c2-bfce-2098bec343f3'),
(27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Skype','skype','text','social',NULL,0,0,1,0,1,0,0,0,64,27,'lead','a:0:{}',0,0,0,'f1c30263-cf9f-491f-8135-76935243044d'),
(28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Twitter','twitter','text','social',NULL,0,0,1,0,1,0,0,0,64,28,'lead','a:0:{}',0,0,0,'57ca7fc0-606e-4906-a327-62789a93e8a7'),
(29,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 1','companyaddress1','text','core',NULL,0,1,1,0,1,0,0,0,64,1,'company','a:0:{}',0,0,0,'25e6c35e-7434-4a66-896c-577ba1a6da1c'),
(30,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 2','companyaddress2','text','core',NULL,0,1,1,0,1,0,0,0,64,2,'company','a:0:{}',0,0,0,'bf891567-288f-4faf-a068-31eaa3a541cb'),
(31,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Email','companyemail','email','core',NULL,0,1,1,0,1,0,0,0,64,3,'company','a:0:{}',0,0,0,'7458a3c0-01ca-4f7d-9d66-78a130db7e3d'),
(32,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','companyphone','tel','core',NULL,0,1,1,0,1,0,0,0,64,4,'company','a:0:{}',0,0,0,'f7c69490-38dd-442a-accf-51f134e11a83'),
(33,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','companycity','text','core',NULL,0,1,1,0,1,0,0,0,64,5,'company','a:0:{}',0,0,0,'8ea2ef58-3370-44d3-9843-4d8e6e76d6f2'),
(34,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','companystate','region','core',NULL,0,1,1,0,1,0,0,0,64,6,'company','a:0:{}',0,0,0,'f88f6200-ffc9-438b-b0f0-3380649d1b93'),
(35,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','companyzipcode','text','core',NULL,0,1,1,0,1,0,0,0,64,7,'company','a:0:{}',0,0,0,'471feac3-7c36-4073-a417-5344e77bcac4'),
(36,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','companycountry','country','core',NULL,0,1,1,0,1,0,0,0,64,8,'company','a:0:{}',0,0,0,'41e653f0-f099-42db-a4d4-7bd37d3a55f6'),
(37,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Name','companyname','text','core',NULL,1,1,1,0,1,0,1,1,64,9,'company','a:0:{}',0,0,0,'5c9db73d-5e18-44c0-9807-0e0159af5389'),
(38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','companywebsite','url','core',NULL,0,1,1,0,1,0,0,0,64,10,'company','a:0:{}',0,0,0,'33c68549-0d06-452f-82e3-7d60707378b1'),
(39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Number of Employees','companynumber_of_employees','number','professional',NULL,0,0,1,0,1,0,0,0,64,11,'company','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:0;}',0,0,0,'42ee93b6-c2bf-40dc-8d3b-c65712b06c0d'),
(40,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','companyfax','tel','professional',NULL,0,0,1,0,1,0,0,0,64,12,'company','a:0:{}',0,0,0,'9eb764ac-ca9f-4448-8461-64d60c1994c8'),
(41,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual Revenue','companyannual_revenue','number','professional',NULL,0,0,1,0,1,0,0,0,64,13,'company','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}',0,0,0,'b4305677-a568-409b-8fc1-84462007ce6b'),
(42,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Industry','companyindustry','select','professional',NULL,0,1,1,0,1,0,0,0,64,14,'company','a:1:{s:4:\"list\";a:41:{i:0;a:2:{s:5:\"label\";s:19:\"Aerospace & Defense\";s:5:\"value\";s:19:\"Aerospace & Defense\";}i:1;a:2:{s:5:\"label\";s:11:\"Agriculture\";s:5:\"value\";s:11:\"Agriculture\";}i:2;a:2:{s:5:\"label\";s:7:\"Apparel\";s:5:\"value\";s:7:\"Apparel\";}i:3;a:2:{s:5:\"label\";s:21:\"Automotive & Assembly\";s:5:\"value\";s:21:\"Automotive & Assembly\";}i:4;a:2:{s:5:\"label\";s:7:\"Banking\";s:5:\"value\";s:7:\"Banking\";}i:5;a:2:{s:5:\"label\";s:13:\"Biotechnology\";s:5:\"value\";s:13:\"Biotechnology\";}i:6;a:2:{s:5:\"label\";s:9:\"Chemicals\";s:5:\"value\";s:9:\"Chemicals\";}i:7;a:2:{s:5:\"label\";s:14:\"Communications\";s:5:\"value\";s:14:\"Communications\";}i:8;a:2:{s:5:\"label\";s:12:\"Construction\";s:5:\"value\";s:12:\"Construction\";}i:9;a:2:{s:5:\"label\";s:23:\"Consumer Packaged Goods\";s:5:\"value\";s:23:\"Consumer Packaged Goods\";}i:10;a:2:{s:5:\"label\";s:9:\"Education\";s:5:\"value\";s:9:\"Education\";}i:11;a:2:{s:5:\"label\";s:11:\"Electronics\";s:5:\"value\";s:11:\"Electronics\";}i:12;a:2:{s:5:\"label\";s:6:\"Energy\";s:5:\"value\";s:6:\"Energy\";}i:13;a:2:{s:5:\"label\";s:11:\"Engineering\";s:5:\"value\";s:11:\"Engineering\";}i:14;a:2:{s:5:\"label\";s:13:\"Entertainment\";s:5:\"value\";s:13:\"Entertainment\";}i:15;a:2:{s:5:\"label\";s:13:\"Environmental\";s:5:\"value\";s:13:\"Environmental\";}i:16;a:2:{s:5:\"label\";s:7:\"Finance\";s:5:\"value\";s:7:\"Finance\";}i:17;a:2:{s:5:\"label\";s:15:\"Food & Beverage\";s:5:\"value\";s:15:\"Food & Beverage\";}i:18;a:2:{s:5:\"label\";s:10:\"Government\";s:5:\"value\";s:10:\"Government\";}i:19;a:2:{s:5:\"label\";s:10:\"Healthcare\";s:5:\"value\";s:10:\"Healthcare\";}i:20;a:2:{s:5:\"label\";s:11:\"Hospitality\";s:5:\"value\";s:11:\"Hospitality\";}i:21;a:2:{s:5:\"label\";s:9:\"Insurance\";s:5:\"value\";s:9:\"Insurance\";}i:22;a:2:{s:5:\"label\";s:9:\"Machinery\";s:5:\"value\";s:9:\"Machinery\";}i:23;a:2:{s:5:\"label\";s:13:\"Manufacturing\";s:5:\"value\";s:13:\"Manufacturing\";}i:24;a:2:{s:5:\"label\";s:5:\"Media\";s:5:\"value\";s:5:\"Media\";}i:25;a:2:{s:5:\"label\";s:15:\"Metals & Mining\";s:5:\"value\";s:15:\"Metals & Mining\";}i:26;a:2:{s:5:\"label\";s:14:\"Not for Profit\";s:5:\"value\";s:14:\"Not for Profit\";}i:27;a:2:{s:5:\"label\";s:9:\"Oil & Gas\";s:5:\"value\";s:9:\"Oil & Gas\";}i:28;a:2:{s:5:\"label\";s:17:\"Packaging & Paper\";s:5:\"value\";s:17:\"Packaging & Paper\";}i:29;a:2:{s:5:\"label\";s:36:\"Private Equity & Principal Investors\";s:5:\"value\";s:36:\"Private Equity & Principal Investors\";}i:30;a:2:{s:5:\"label\";s:10:\"Recreation\";s:5:\"value\";s:10:\"Recreation\";}i:31;a:2:{s:5:\"label\";s:11:\"Real Estate\";s:5:\"value\";s:11:\"Real Estate\";}i:32;a:2:{s:5:\"label\";s:6:\"Retail\";s:5:\"value\";s:6:\"Retail\";}i:33;a:2:{s:5:\"label\";s:14:\"Semiconductors\";s:5:\"value\";s:14:\"Semiconductors\";}i:34;a:2:{s:5:\"label\";s:8:\"Shipping\";s:5:\"value\";s:8:\"Shipping\";}i:35;a:2:{s:5:\"label\";s:13:\"Social Sector\";s:5:\"value\";s:13:\"Social Sector\";}i:36;a:2:{s:5:\"label\";s:10:\"Technology\";s:5:\"value\";s:10:\"Technology\";}i:37;a:2:{s:5:\"label\";s:18:\"Telecommunications\";s:5:\"value\";s:18:\"Telecommunications\";}i:38;a:2:{s:5:\"label\";s:14:\"Transportation\";s:5:\"value\";s:14:\"Transportation\";}i:39;a:2:{s:5:\"label\";s:9:\"Utilities\";s:5:\"value\";s:9:\"Utilities\";}i:40;a:2:{s:5:\"label\";s:5:\"Other\";s:5:\"value\";s:5:\"Other\";}}}',0,0,0,'ad1e2a90-f338-44e4-b463-9413a1bdfd8e'),
(43,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Description','companydescription','text','professional',NULL,0,1,1,0,1,0,0,0,64,15,'company','a:0:{}',0,0,0,'efc22a40-ab07-45ae-bee6-d40a9b9300e3');
/*!40000 ALTER TABLE `lead_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_frequencyrules`
--

DROP TABLE IF EXISTS `lead_frequencyrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_frequencyrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `frequency_number` smallint(6) DEFAULT NULL,
  `frequency_time` varchar(25) DEFAULT NULL,
  `channel` varchar(191) NOT NULL,
  `preferred_channel` tinyint(1) NOT NULL,
  `pause_from_date` datetime DEFAULT NULL,
  `pause_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA8A57F455458D` (`lead_id`),
  KEY `channel_frequency` (`channel`),
  KEY `idx_frequency_date_added` (`lead_id`,`date_added`),
  CONSTRAINT `FK_AA8A57F455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_frequencyrules`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_frequencyrules` WRITE;
/*!40000 ALTER TABLE `lead_frequencyrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_frequencyrules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_ips_xref`
--

DROP TABLE IF EXISTS `lead_ips_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_ips_xref` (
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`ip_id`),
  KEY `IDX_9EED7E66A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_9EED7E6655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9EED7E66A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_ips_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_ips_xref` WRITE;
/*!40000 ALTER TABLE `lead_ips_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_ips_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_list_projects_xref`
--

DROP TABLE IF EXISTS `lead_list_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_list_projects_xref` (
  `leadlist_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`leadlist_id`,`project_id`),
  KEY `IDX_4B06CBD0166D1F9C` (`project_id`),
  CONSTRAINT `FK_4B06CBD0166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4B06CBD0B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_list_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_list_projects_xref` WRITE;
/*!40000 ALTER TABLE `lead_list_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_list_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_lists`
--

DROP TABLE IF EXISTS `lead_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `alias` varchar(191) NOT NULL,
  `public_name` varchar(191) NOT NULL,
  `filters` longtext NOT NULL COMMENT '(DC2Type:array)',
  `is_global` tinyint(1) NOT NULL,
  `is_preference_center` tinyint(1) NOT NULL,
  `last_built_date` datetime DEFAULT NULL,
  `last_built_time` double DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_6EC1522A12469DE2` (`category_id`),
  KEY `lead_list_alias` (`alias`),
  KEY `segment_deleted` (`deleted`),
  CONSTRAINT `FK_6EC1522A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_lists`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_lists` WRITE;
/*!40000 ALTER TABLE `lead_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_lists` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_lists_leads`
--

DROP TABLE IF EXISTS `lead_lists_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_lists_leads` (
  `leadlist_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`leadlist_id`,`lead_id`),
  KEY `IDX_F5F47C7C55458D` (`lead_id`),
  KEY `manually_removed` (`manually_removed`),
  KEY `lead_id_lists_id_removed` (`lead_id`,`leadlist_id`,`manually_removed`),
  CONSTRAINT `FK_F5F47C7C55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F5F47C7CB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_lists_leads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_lists_leads` WRITE;
/*!40000 ALTER TABLE `lead_lists_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_lists_leads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_notes`
--

DROP TABLE IF EXISTS `lead_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `text` longtext NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67FC6B0355458D` (`lead_id`),
  CONSTRAINT `FK_67FC6B0355458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_notes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_notes` WRITE;
/*!40000 ALTER TABLE `lead_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_notes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_points_change_log`
--

DROP TABLE IF EXISTS `lead_points_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_points_change_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `type` tinytext NOT NULL,
  `event_name` varchar(191) NOT NULL,
  `action_name` varchar(191) NOT NULL,
  `delta` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_949C2CCC55458D` (`lead_id`),
  KEY `IDX_949C2CCCA03F5E9F` (`ip_id`),
  KEY `IDX_949C2CCCFE54D947` (`group_id`),
  KEY `point_date_added` (`date_added`),
  CONSTRAINT `FK_949C2CCC55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_949C2CCCA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_949C2CCCFE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_points_change_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_points_change_log` WRITE;
/*!40000 ALTER TABLE `lead_points_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_points_change_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_stages_change_log`
--

DROP TABLE IF EXISTS `lead_stages_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_stages_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `stage_id` int(10) unsigned DEFAULT NULL,
  `event_name` varchar(191) NOT NULL,
  `action_name` varchar(191) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_73B42EF355458D` (`lead_id`),
  KEY `IDX_73B42EF32298D193` (`stage_id`),
  KEY `lead_stages_change_log_date_added` (`date_added`),
  CONSTRAINT `FK_73B42EF32298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_73B42EF355458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_stages_change_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_stages_change_log` WRITE;
/*!40000 ALTER TABLE `lead_stages_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_stages_change_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_tags`
--

DROP TABLE IF EXISTS `lead_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `lead_tag_search` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_tags` WRITE;
/*!40000 ALTER TABLE `lead_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_tags_xref`
--

DROP TABLE IF EXISTS `lead_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_tags_xref` (
  `lead_id` bigint(20) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`tag_id`),
  KEY `IDX_F2E51EB6BAD26311` (`tag_id`),
  CONSTRAINT `FK_F2E51EB655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F2E51EB6BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `lead_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_tags_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_tags_xref` WRITE;
/*!40000 ALTER TABLE `lead_tags_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_tags_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lead_utmtags`
--

DROP TABLE IF EXISTS `lead_utmtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_utmtags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `query` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `referer` longtext DEFAULT NULL,
  `remote_host` varchar(191) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `utm_campaign` varchar(191) DEFAULT NULL,
  `utm_content` varchar(191) DEFAULT NULL,
  `utm_medium` varchar(191) DEFAULT NULL,
  `utm_source` varchar(191) DEFAULT NULL,
  `utm_term` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C51BCB8D55458D` (`lead_id`),
  KEY `utm_date_added` (`date_added`),
  CONSTRAINT `FK_C51BCB8D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_utmtags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lead_utmtags` WRITE;
/*!40000 ALTER TABLE `lead_utmtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_utmtags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `stage_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `points` int(11) NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `internal` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `social_cache` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `date_identified` datetime DEFAULT NULL,
  `preferred_profile_image` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `firstname` varchar(191) DEFAULT NULL,
  `lastname` varchar(191) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zipcode` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `generated_email_domain` varchar(255) GENERATED ALWAYS AS (substr(`email`,locate('@',`email`) + 1)) VIRTUAL COMMENT '(DC2Type:generated)',
  `fax` varchar(191) DEFAULT NULL,
  `preferred_locale` varchar(191) DEFAULT NULL,
  `attribution_date` datetime DEFAULT NULL,
  `attribution` double DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `foursquare` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_179045527E3C61F9` (`owner_id`),
  KEY `IDX_179045522298D193` (`stage_id`),
  KEY `lead_date_added` (`date_added`),
  KEY `lead_date_modified` (`date_modified`),
  KEY `date_identified` (`date_identified`),
  KEY `last_active` (`last_active`),
  KEY `generated_email_domain` (`generated_email_domain`),
  KEY `fax_search` (`fax`),
  KEY `preferred_locale_search` (`preferred_locale`),
  KEY `attribution_date_search` (`attribution_date`),
  KEY `attribution_search` (`attribution`),
  KEY `website_search` (`website`),
  KEY `facebook_search` (`facebook`),
  KEY `foursquare_search` (`foursquare`),
  KEY `instagram_search` (`instagram`),
  KEY `linkedin_search` (`linkedin`),
  KEY `skype_search` (`skype`),
  KEY `twitter_search` (`twitter`),
  KEY `contact_attribution` (`attribution`,`attribution_date`),
  KEY `date_added_country_index` (`date_added`,`country`),
  CONSTRAINT `FK_179045522298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_179045527E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `message_channels`
--

DROP TABLE IF EXISTS `message_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `channel` varchar(191) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`properties`)),
  `is_enabled` tinyint(1) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_index` (`message_id`,`channel`),
  KEY `IDX_FA3226A7537A1329` (`message_id`),
  KEY `channel_entity_index` (`channel`,`channel_id`),
  KEY `channel_enabled_index` (`channel`,`is_enabled`),
  CONSTRAINT `FK_FA3226A7537A1329` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_channels`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `message_channels` WRITE;
/*!40000 ALTER TABLE `message_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_channels` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `message_projects_xref`
--

DROP TABLE IF EXISTS `message_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_projects_xref` (
  `message_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`,`project_id`),
  KEY `IDX_13524A6E166D1F9C` (`project_id`),
  CONSTRAINT `FK_13524A6E166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_13524A6E537A1329` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `message_projects_xref` WRITE;
/*!40000 ALTER TABLE `message_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `message_queue`
--

DROP TABLE IF EXISTS `message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(191) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `max_attempts` smallint(6) NOT NULL,
  `attempts` smallint(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `status` varchar(191) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `options` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_805B808871F7E88B` (`event_id`),
  KEY `IDX_805B808855458D` (`lead_id`),
  KEY `message_status_search` (`status`),
  KEY `message_date_sent` (`date_sent`),
  KEY `message_scheduled_date` (`scheduled_date`),
  KEY `message_priority` (`priority`),
  KEY `message_success` (`success`),
  KEY `message_channel_search` (`channel`,`channel_id`),
  KEY `message_queue_date_published` (`date_published`),
  CONSTRAINT `FK_805B808855458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_805B808871F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_queue`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `message_queue` WRITE;
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_DB021E9612469DE2` (`category_id`),
  KEY `date_message_added` (`date_added`),
  CONSTRAINT `FK_DB021E9612469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
('Mautic\\Migrations\\Version020230615115326',NULL,NULL),
('Mautic\\Migrations\\Version20190326190241',NULL,NULL),
('Mautic\\Migrations\\Version20190410143658',NULL,NULL),
('Mautic\\Migrations\\Version20190524124819',NULL,NULL),
('Mautic\\Migrations\\Version20191106152509',NULL,NULL),
('Mautic\\Migrations\\Version20200415135706',NULL,NULL),
('Mautic\\Migrations\\Version20200513162918',NULL,NULL),
('Mautic\\Migrations\\Version20200917152259',NULL,NULL),
('Mautic\\Migrations\\Version20201007003589',NULL,NULL),
('Mautic\\Migrations\\Version20201019100000',NULL,NULL),
('Mautic\\Migrations\\Version20201026101117',NULL,NULL),
('Mautic\\Migrations\\Version20201029001005',NULL,NULL),
('Mautic\\Migrations\\Version20210112162046',NULL,NULL),
('Mautic\\Migrations\\Version20210115065034',NULL,NULL),
('Mautic\\Migrations\\Version20210211081531',NULL,NULL),
('Mautic\\Migrations\\Version20210217115150',NULL,NULL),
('Mautic\\Migrations\\Version20210330075323',NULL,NULL),
('Mautic\\Migrations\\Version20210420113309',NULL,NULL),
('Mautic\\Migrations\\Version20210818090322',NULL,NULL),
('Mautic\\Migrations\\Version20210819201726',NULL,NULL),
('Mautic\\Migrations\\Version20211020092759',NULL,NULL),
('Mautic\\Migrations\\Version20211020114811',NULL,NULL),
('Mautic\\Migrations\\Version20211020142629',NULL,NULL),
('Mautic\\Migrations\\Version20211026152443',NULL,NULL),
('Mautic\\Migrations\\Version20211026153057',NULL,NULL),
('Mautic\\Migrations\\Version20211110070503',NULL,NULL),
('Mautic\\Migrations\\Version20211209022550',NULL,NULL),
('Mautic\\Migrations\\Version20220104115633',NULL,NULL),
('Mautic\\Migrations\\Version20220120123310',NULL,NULL),
('Mautic\\Migrations\\Version20220208032455',NULL,NULL),
('Mautic\\Migrations\\Version20220216161028',NULL,NULL),
('Mautic\\Migrations\\Version20220223072252',NULL,NULL),
('Mautic\\Migrations\\Version20220429091934',NULL,NULL),
('Mautic\\Migrations\\Version20220722074516',NULL,NULL),
('Mautic\\Migrations\\Version20221010121758',NULL,NULL),
('Mautic\\Migrations\\Version20221014061125',NULL,NULL),
('Mautic\\Migrations\\Version20221014081742',NULL,NULL),
('Mautic\\Migrations\\Version20221128145933',NULL,NULL),
('Mautic\\Migrations\\Version20230131133732',NULL,NULL),
('Mautic\\Migrations\\Version20230301051300',NULL,NULL),
('Mautic\\Migrations\\Version20230307083702',NULL,NULL),
('Mautic\\Migrations\\Version20230311195347',NULL,NULL),
('Mautic\\Migrations\\Version20230313111424',NULL,NULL),
('Mautic\\Migrations\\Version20230321133733',NULL,NULL),
('Mautic\\Migrations\\Version20230424083829',NULL,NULL),
('Mautic\\Migrations\\Version20230506112314',NULL,NULL),
('Mautic\\Migrations\\Version20230506113422',NULL,NULL),
('Mautic\\Migrations\\Version20230506113627',NULL,NULL),
('Mautic\\Migrations\\Version20230506113731',NULL,NULL),
('Mautic\\Migrations\\Version20230506113812',NULL,NULL),
('Mautic\\Migrations\\Version20230519154448',NULL,NULL),
('Mautic\\Migrations\\Version20230525202700',NULL,NULL),
('Mautic\\Migrations\\Version20230606111852',NULL,NULL),
('Mautic\\Migrations\\Version20230615101328',NULL,NULL),
('Mautic\\Migrations\\Version20230621074925',NULL,NULL),
('Mautic\\Migrations\\Version20230627140512',NULL,NULL),
('Mautic\\Migrations\\Version20230927055621',NULL,NULL),
('Mautic\\Migrations\\Version20231110103625',NULL,NULL),
('Mautic\\Migrations\\Version20231205094436',NULL,NULL),
('Mautic\\Migrations\\Version20231206152313',NULL,NULL),
('Mautic\\Migrations\\Version20231207235400',NULL,NULL),
('Mautic\\Migrations\\Version20240226114528',NULL,NULL),
('Mautic\\Migrations\\Version20240228132306',NULL,NULL),
('Mautic\\Migrations\\Version20240229101323',NULL,NULL),
('Mautic\\Migrations\\Version20240320081612',NULL,NULL),
('Mautic\\Migrations\\Version20240416112112',NULL,NULL),
('Mautic\\Migrations\\Version20240607092418',NULL,NULL),
('Mautic\\Migrations\\Version20240611103824',NULL,NULL),
('Mautic\\Migrations\\Version20240704164714',NULL,NULL),
('Mautic\\Migrations\\Version20240708153845',NULL,NULL),
('Mautic\\Migrations\\Version20240725105507',NULL,NULL),
('Mautic\\Migrations\\Version20241004132307',NULL,NULL),
('Mautic\\Migrations\\Version20241212090146',NULL,NULL),
('Mautic\\Migrations\\Version20241227065658',NULL,NULL),
('Mautic\\Migrations\\Version20250127092202',NULL,NULL),
('Mautic\\Migrations\\Version20250127092203',NULL,NULL),
('Mautic\\Migrations\\Version20250207035735',NULL,NULL),
('Mautic\\Migrations\\Version20250402103942',NULL,NULL),
('Mautic\\Migrations\\Version20250409150440',NULL,NULL),
('Mautic\\Migrations\\Version20250409150450',NULL,NULL),
('Mautic\\Migrations\\Version20250415142826',NULL,NULL),
('Mautic\\Migrations\\Version20250424092044',NULL,NULL),
('Mautic\\Migrations\\Version20250425125026',NULL,NULL),
('Mautic\\Migrations\\Version20250425134835',NULL,NULL),
('Mautic\\Migrations\\Version20250428071743',NULL,NULL),
('Mautic\\Migrations\\Version20250429133744',NULL,NULL),
('Mautic\\Migrations\\Version20250430104345',NULL,NULL),
('Mautic\\Migrations\\Version20250430113559',NULL,NULL),
('Mautic\\Migrations\\Version20250430135003',NULL,NULL),
('Mautic\\Migrations\\Version20250502071717',NULL,NULL),
('Mautic\\Migrations\\Version20250512114846',NULL,NULL),
('Mautic\\Migrations\\Version20250618122722',NULL,NULL),
('Mautic\\Migrations\\Version20250618122908',NULL,NULL),
('Mautic\\Migrations\\Version20250618134002',NULL,NULL),
('Mautic\\Migrations\\Version20250618141525',NULL,NULL),
('Mautic\\Migrations\\Version20250722150225',NULL,NULL),
('Mautic\\Migrations\\Version20250804003400',NULL,NULL),
('Mautic\\Migrations\\Version20250805095503',NULL,NULL),
('Mautic\\Migrations\\Version20250806085552',NULL,NULL),
('Mautic\\Migrations\\Version20250828070131',NULL,NULL),
('Mautic\\Migrations\\Version20250904111834',NULL,NULL),
('Mautic\\Migrations\\Version20250909202247',NULL,NULL),
('Mautic\\Migrations\\Version20250923114835',NULL,NULL),
('Mautic\\Migrations\\Version20250923135527',NULL,NULL),
('Mautic\\Migrations\\Version20251204081531',NULL,NULL),
('Mautic\\Migrations\\Version20260107152512',NULL,NULL),
('Mautic\\Migrations\\Version20260107152513',NULL,NULL),
('Mautic\\Migrations\\Version20260116091207',NULL,NULL),
('Mautic\\Migrations\\Version20260501090000',NULL,NULL),
('Mautic\\Migrations\\Version20260521114026',NULL,NULL),
('Mautic\\Migrations\\Version20260604000000',NULL,NULL),
('Mautic\\Migrations\\Version20260616075543',NULL,NULL),
('Mautic\\Migrations\\Version20260616135523',NULL,NULL),
('Mautic\\Migrations\\Version20260629065551',NULL,NULL),
('Mautic\\Migrations\\Version20260709103000',NULL,NULL),
('Mautic\\Migrations\\Version20260726100000',NULL,NULL),
('Mautic\\Migrations\\Versionzz20230929183000',NULL,NULL);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `monitor_post_count`
--

DROP TABLE IF EXISTS `monitor_post_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_post_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned DEFAULT NULL,
  `post_date` date NOT NULL,
  `post_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3AC20CA4CE1C902` (`monitor_id`),
  CONSTRAINT `FK_E3AC20CA4CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `monitoring` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_post_count`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `monitor_post_count` WRITE;
/*!40000 ALTER TABLE `monitor_post_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_post_count` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `monitoring`
--

DROP TABLE IF EXISTS `monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoring` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `lists` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `network_type` varchar(191) DEFAULT NULL,
  `revision` int(11) NOT NULL,
  `stats` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `properties` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_BA4F975D12469DE2` (`category_id`),
  CONSTRAINT `FK_BA4F975D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `monitoring` WRITE;
/*!40000 ALTER TABLE `monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoring` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `monitoring_leads`
--

DROP TABLE IF EXISTS `monitoring_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoring_leads` (
  `monitor_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`monitor_id`,`lead_id`),
  KEY `IDX_45207A4A55458D` (`lead_id`),
  CONSTRAINT `FK_45207A4A4CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `monitoring` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_45207A4A55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_leads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `monitoring_leads` WRITE;
/*!40000 ALTER TABLE `monitoring_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoring_leads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `header` varchar(512) DEFAULT NULL,
  `message` longtext NOT NULL,
  `date_added` datetime NOT NULL,
  `icon_class` varchar(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `deduplicate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6000B0D3A76ED395` (`user_id`),
  KEY `notification_read_status` (`is_read`),
  KEY `notification_type` (`type`),
  KEY `notification_user_read_status` (`is_read`,`user_id`),
  KEY `deduplicate_date_added` (`deduplicate`,`date_added`),
  CONSTRAINT `FK_6000B0D3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth2_accesstokens`
--

DROP TABLE IF EXISTS `oauth2_accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_accesstokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3A18CA5A5F37A13B` (`token`),
  KEY `IDX_3A18CA5A19EB6921` (`client_id`),
  KEY `IDX_3A18CA5AA76ED395` (`user_id`),
  KEY `oauth2_access_token_search` (`token`),
  CONSTRAINT `FK_3A18CA5A19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3A18CA5AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_accesstokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth2_accesstokens` WRITE;
/*!40000 ALTER TABLE `oauth2_accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_accesstokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth2_authcodes`
--

DROP TABLE IF EXISTS `oauth2_authcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_authcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) DEFAULT NULL,
  `redirect_uri` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D2B4847B5F37A13B` (`token`),
  KEY `IDX_D2B4847B19EB6921` (`client_id`),
  KEY `IDX_D2B4847BA76ED395` (`user_id`),
  CONSTRAINT `FK_D2B4847B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D2B4847BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authcodes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth2_authcodes` WRITE;
/*!40000 ALTER TABLE `oauth2_authcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_authcodes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth2_clients`
--

DROP TABLE IF EXISTS `oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `random_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `redirect_uris` longtext NOT NULL COMMENT '(DC2Type:array)',
  `allowed_grant_types` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_F9D02AE6D60322AC` (`role_id`),
  KEY `client_id_search` (`random_id`),
  CONSTRAINT `FK_F9D02AE6D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_clients`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth2_refreshtokens`
--

DROP TABLE IF EXISTS `oauth2_refreshtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_refreshtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_328C5B1B5F37A13B` (`token`),
  KEY `IDX_328C5B1B19EB6921` (`client_id`),
  KEY `IDX_328C5B1BA76ED395` (`user_id`),
  KEY `oauth2_refresh_token_search` (`token`),
  CONSTRAINT `FK_328C5B1B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_328C5B1BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refreshtokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth2_refreshtokens` WRITE;
/*!40000 ALTER TABLE `oauth2_refreshtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_refreshtokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth2_user_client_xref`
--

DROP TABLE IF EXISTS `oauth2_user_client_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_user_client_xref` (
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`user_id`),
  KEY `IDX_1AE34413A76ED395` (`user_id`),
  CONSTRAINT `FK_1AE3441319EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1AE34413A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_user_client_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth2_user_client_xref` WRITE;
/*!40000 ALTER TABLE `oauth2_user_client_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_user_client_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `page_hits`
--

DROP TABLE IF EXISTS `page_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_hits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT NULL,
  `redirect_id` bigint(20) unsigned DEFAULT NULL,
  `email_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `device_id` bigint(20) unsigned DEFAULT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `region` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `isp` varchar(191) DEFAULT NULL,
  `organization` varchar(191) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `url_title` varchar(191) DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `remote_host` varchar(191) DEFAULT NULL,
  `page_language` varchar(191) DEFAULT NULL,
  `browser_languages` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `tracking_id` varchar(191) NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `query` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_9D4B70F1C4663E4` (`page_id`),
  KEY `IDX_9D4B70F1B42D874D` (`redirect_id`),
  KEY `IDX_9D4B70F1A832C1C9` (`email_id`),
  KEY `IDX_9D4B70F155458D` (`lead_id`),
  KEY `IDX_9D4B70F1A03F5E9F` (`ip_id`),
  KEY `IDX_9D4B70F194A4C7D4` (`device_id`),
  KEY `page_hit_tracking_search` (`tracking_id`),
  KEY `page_hit_code_search` (`code`),
  KEY `page_hit_source_search` (`source`,`source_id`),
  KEY `date_hit_left_index` (`date_hit`,`date_left`),
  KEY `page_hit_url` (`url`(128)),
  CONSTRAINT `FK_9D4B70F155458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F194A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `lead_devices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1B42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `page_redirects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_hits`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `page_hits` WRITE;
/*!40000 ALTER TABLE `page_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_hits` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `page_projects_xref`
--

DROP TABLE IF EXISTS `page_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_projects_xref` (
  `page_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_id`,`project_id`),
  KEY `IDX_CB257C2D166D1F9C` (`project_id`),
  CONSTRAINT `FK_CB257C2D166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CB257C2DC4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `page_projects_xref` WRITE;
/*!40000 ALTER TABLE `page_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `page_redirects`
--

DROP TABLE IF EXISTS `page_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_redirects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `redirect_id` varchar(25) NOT NULL,
  `url` longtext NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_redirects`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `page_redirects` WRITE;
/*!40000 ALTER TABLE `page_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_redirects` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `alias` varchar(191) NOT NULL,
  `template` varchar(191) DEFAULT NULL,
  `custom_html` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  `variant_hits` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `head_script` longtext DEFAULT NULL,
  `footer_script` longtext DEFAULT NULL,
  `redirect_type` varchar(100) DEFAULT NULL,
  `redirect_url` varchar(2048) DEFAULT NULL,
  `is_preference_center` tinyint(1) DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `public_preview` tinyint(1) DEFAULT NULL,
  `lang` varchar(191) NOT NULL,
  `variant_settings` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `IDX_2074E57512469DE2` (`category_id`),
  KEY `IDX_2074E5759091A2FB` (`translation_parent_id`),
  KEY `IDX_2074E57591861123` (`variant_parent_id`),
  KEY `page_alias_search` (`alias`),
  CONSTRAINT `FK_2074E57512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2074E5759091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2074E57591861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pages_draft`
--

DROP TABLE IF EXISTS `pages_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `html` longtext DEFAULT NULL,
  `template` varchar(191) DEFAULT NULL,
  `public_preview` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AB8FDFFEC4663E4` (`page_id`),
  CONSTRAINT `FK_AB8FDFFEC4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_draft`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pages_draft` WRITE;
/*!40000 ALTER TABLE `pages_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_draft` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `bundle` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `bitwise` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_perm` (`bundle`,`name`,`role_id`),
  KEY `IDX_2DEDCC6FD60322AC` (`role_id`),
  CONSTRAINT `FK_2DEDCC6FD60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `plugin_integration_settings`
--

DROP TABLE IF EXISTS `plugin_integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_integration_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `supported_features` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `api_keys` longtext NOT NULL COMMENT '(DC2Type:array)',
  `feature_settings` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_941A2CE0EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_941A2CE0EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_integration_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `plugin_integration_settings` WRITE;
/*!40000 ALTER TABLE `plugin_integration_settings` DISABLE KEYS */;
INSERT INTO `plugin_integration_settings` VALUES
(1,1,'GrapesJsBuilder',1,'a:0:{}','a:0:{}','a:0:{}'),
(2,NULL,'OneSignal',0,'a:4:{i:0;s:6:\"mobile\";i:1;s:20:\"landing_page_enabled\";i:2;s:28:\"welcome_notification_enabled\";i:3;s:21:\"tracking_page_enabled\";}','a:0:{}','a:0:{}'),
(3,NULL,'Twilio',0,'a:0:{}','a:0:{}','a:0:{}');
/*!40000 ALTER TABLE `plugin_integration_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_missing` tinyint(1) NOT NULL,
  `bundle` varchar(50) NOT NULL,
  `version` varchar(191) DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_bundle` (`bundle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'GrapesJS Builder','GrapesJS Builder with MJML support for Mautic',0,'GrapesJsBuilderBundle','1.0.0','Mautic Community');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_group_contact_score`
--

DROP TABLE IF EXISTS `point_group_contact_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_group_contact_score` (
  `contact_id` bigint(20) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`contact_id`,`group_id`),
  KEY `IDX_9D85A703FE54D947` (`group_id`),
  CONSTRAINT `FK_9D85A703E7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9D85A703FE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_group_contact_score`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_group_contact_score` WRITE;
/*!40000 ALTER TABLE `point_group_contact_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_group_contact_score` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_groups`
--

DROP TABLE IF EXISTS `point_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_groups` WRITE;
/*!40000 ALTER TABLE `point_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_insights`
--

DROP TABLE IF EXISTS `point_insights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_insights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `insight_type` varchar(191) NOT NULL,
  `insight_action` varchar(191) NOT NULL,
  `custom_field` varchar(191) DEFAULT NULL,
  `point_groups` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`point_groups`)),
  PRIMARY KEY (`id`),
  KEY `IDX_9894AA2612469DE2` (`category_id`),
  CONSTRAINT `FK_9894AA2612469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_insights`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_insights` WRITE;
/*!40000 ALTER TABLE `point_insights` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_insights` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_lead_action_log`
--

DROP TABLE IF EXISTS `point_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_lead_action_log` (
  `point_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`point_id`,`lead_id`),
  KEY `IDX_6DF94A5655458D` (`lead_id`),
  KEY `IDX_6DF94A56A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_6DF94A5655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6DF94A56A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_6DF94A56C028CEA2` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_lead_action_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_lead_action_log` WRITE;
/*!40000 ALTER TABLE `point_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_lead_event_log`
--

DROP TABLE IF EXISTS `point_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_lead_event_log` (
  `event_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`event_id`,`lead_id`),
  KEY `IDX_C2A3BDBA55458D` (`lead_id`),
  KEY `IDX_C2A3BDBAA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_C2A3BDBA55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C2A3BDBA71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `point_trigger_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C2A3BDBAA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_lead_event_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_lead_event_log` WRITE;
/*!40000 ALTER TABLE `point_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_projects_xref`
--

DROP TABLE IF EXISTS `point_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_projects_xref` (
  `point_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`point_id`,`project_id`),
  KEY `IDX_10D626AE166D1F9C` (`project_id`),
  CONSTRAINT `FK_10D626AE166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_10D626AEC028CEA2` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_projects_xref` WRITE;
/*!40000 ALTER TABLE `point_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_trigger_events`
--

DROP TABLE IF EXISTS `point_trigger_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_trigger_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trigger_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext NOT NULL COMMENT '(DC2Type:array)',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_D5669585FDDDCD6` (`trigger_id`),
  KEY `trigger_type_search` (`type`),
  CONSTRAINT `FK_D5669585FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `point_triggers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_trigger_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_trigger_events` WRITE;
/*!40000 ALTER TABLE `point_trigger_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_trigger_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_trigger_projects_xref`
--

DROP TABLE IF EXISTS `point_trigger_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_trigger_projects_xref` (
  `point_trigger_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`point_trigger_id`,`project_id`),
  KEY `IDX_B89C954166D1F9C` (`project_id`),
  CONSTRAINT `FK_B89C954166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B89C95483A8FF7C` FOREIGN KEY (`point_trigger_id`) REFERENCES `point_triggers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_trigger_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_trigger_projects_xref` WRITE;
/*!40000 ALTER TABLE `point_trigger_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_trigger_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `point_triggers`
--

DROP TABLE IF EXISTS `point_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_triggers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `points` int(11) NOT NULL,
  `color` varchar(7) NOT NULL,
  `trigger_existing_leads` tinyint(1) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_9CABD32F12469DE2` (`category_id`),
  KEY `IDX_9CABD32FFE54D947` (`group_id`),
  CONSTRAINT `FK_9CABD32F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9CABD32FFE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_triggers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `point_triggers` WRITE;
/*!40000 ALTER TABLE `point_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_triggers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `repeatable` tinyint(1) NOT NULL,
  `delta` int(11) NOT NULL,
  `properties` longtext NOT NULL COMMENT '(DC2Type:array)',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_27BA8E2912469DE2` (`category_id`),
  KEY `IDX_27BA8E29FE54D947` (`group_id`),
  KEY `point_type_search` (`type`),
  CONSTRAINT `FK_27BA8E2912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_27BA8E29FE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`properties`)),
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_project_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `push_ids`
--

DROP TABLE IF EXISTS `push_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `push_id` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F2393E855458D` (`lead_id`),
  CONSTRAINT `FK_4F2393E855458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_ids`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `push_ids` WRITE;
/*!40000 ALTER TABLE `push_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_ids` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `push_notification_list_xref`
--

DROP TABLE IF EXISTS `push_notification_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_list_xref` (
  `notification_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`notification_id`,`leadlist_id`),
  KEY `IDX_473919EFB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_473919EFB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_473919EFEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `push_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_list_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `push_notification_list_xref` WRITE;
/*!40000 ALTER TABLE `push_notification_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_list_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `push_notification_stats`
--

DROP TABLE IF EXISTS `push_notification_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `is_clicked` tinyint(1) NOT NULL,
  `date_clicked` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `click_count` int(11) DEFAULT NULL,
  `last_clicked` datetime DEFAULT NULL,
  `click_details` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_DE63695EEF1A9D84` (`notification_id`),
  KEY `IDX_DE63695E55458D` (`lead_id`),
  KEY `IDX_DE63695E3DAE168B` (`list_id`),
  KEY `IDX_DE63695EA03F5E9F` (`ip_id`),
  KEY `stat_notification_search` (`notification_id`,`lead_id`),
  KEY `stat_notification_clicked_search` (`is_clicked`),
  KEY `stat_notification_hash_search` (`tracking_hash`),
  KEY `stat_notification_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_DE63695E3DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DE63695E55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DE63695EA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DE63695EEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `push_notifications` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `push_notification_stats` WRITE;
/*!40000 ALTER TABLE `push_notification_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `heading` longtext NOT NULL,
  `message` longtext NOT NULL,
  `button` longtext DEFAULT NULL,
  `utm_tags` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `notification_type` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  `mobileSettings` longtext NOT NULL COMMENT '(DC2Type:array)',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `lang` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5B9B7E4F12469DE2` (`category_id`),
  KEY `IDX_5B9B7E4F9091A2FB` (`translation_parent_id`),
  CONSTRAINT `FK_5B9B7E4F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5B9B7E4F9091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `push_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `system` tinyint(1) NOT NULL,
  `source` varchar(191) NOT NULL,
  `columns` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `filters` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `table_order` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `graphs` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `group_by` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `aggregators` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`settings`)),
  `is_scheduled` tinyint(1) NOT NULL,
  `schedule_unit` varchar(191) DEFAULT NULL,
  `to_address` varchar(191) DEFAULT NULL,
  `schedule_day` varchar(191) DEFAULT NULL,
  `schedule_month_frequency` varchar(191) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visits published Pages',NULL,1,'page.hits','a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}','a:2:{i:0;a:3:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";}i:1;a:3:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}}','a:8:{i:0;s:35:\"mautic.page.graph.line.time.on.site\";i:1;s:27:\"mautic.page.graph.line.hits\";i:2;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:3;s:31:\"mautic.page.graph.pie.languages\";i:4;s:34:\"mautic.page.graph.pie.time.on.site\";i:5;s:27:\"mautic.page.table.referrers\";i:6;s:30:\"mautic.page.table.most.visited\";i:7;s:37:\"mautic.page.table.most.visited.unique\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL,'871865b6-ff5c-4115-9883-ee9ba2ac0457'),
(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Downloads of all Assets',NULL,1,'asset.downloads','a:7:{i:0;s:16:\"ad.date_download\";i:1;s:7:\"a.title\";i:2;s:12:\"i.ip_address\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:4:\"a.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"a.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:16:\"ad.date_download\";s:9:\"direction\";s:3:\"ASC\";}}','a:4:{i:0;s:33:\"mautic.asset.graph.line.downloads\";i:1;s:31:\"mautic.asset.graph.pie.statuses\";i:2;s:34:\"mautic.asset.table.most.downloaded\";i:3;s:32:\"mautic.asset.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL,'70ee4760-1875-4664-8d47-7bb8a7704f7d'),
(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Submissions of published Forms',NULL,1,'form.submissions','a:0:{}','a:1:{i:1;a:3:{s:6:\"column\";s:14:\"f.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:0:{}','a:3:{i:0;s:34:\"mautic.form.graph.line.submissions\";i:1;s:32:\"mautic.form.table.most.submitted\";i:2;s:31:\"mautic.form.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL,'ed12ea43-0dd0-4adb-a0dc-9a836586f6da'),
(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'All Emails',NULL,1,'email.stats','a:5:{i:0;s:12:\"es.date_sent\";i:1;s:12:\"es.date_read\";i:2;s:9:\"e.subject\";i:3;s:16:\"es.email_address\";i:4;s:4:\"e.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"e.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:12:\"es.date_sent\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.email.graph.line.stats\";i:1;s:42:\"mautic.email.graph.pie.ignored.read.failed\";i:2;s:35:\"mautic.email.table.most.emails.read\";i:3;s:35:\"mautic.email.table.most.emails.sent\";i:4;s:43:\"mautic.email.table.most.emails.read.percent\";i:5;s:37:\"mautic.email.table.most.emails.failed\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL,'a88f4383-aacb-423e-b70a-2a72e1905629'),
(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Leads and Points',NULL,1,'lead.pointlog','a:7:{i:0;s:13:\"lp.date_added\";i:1;s:7:\"lp.type\";i:2;s:13:\"lp.event_name\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:8:\"lp.delta\";}','a:0:{}','a:1:{i:0;a:2:{s:6:\"column\";s:13:\"lp.date_added\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.lead.graph.line.points\";i:1;s:29:\"mautic.lead.table.most.points\";i:2;s:29:\"mautic.lead.table.top.actions\";i:3;s:28:\"mautic.lead.table.top.cities\";i:4;s:31:\"mautic.lead.table.top.countries\";i:5;s:28:\"mautic.lead.table.top.events\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL,'03c58f78-052c-4e3d-8320-b60b76cc3bd6');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reports_schedulers`
--

DROP TABLE IF EXISTS `reports_schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_schedulers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `schedule_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C74CA6B84BD2A4C0` (`report_id`),
  CONSTRAINT `FK_C74CA6B84BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_schedulers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reports_schedulers` WRITE;
/*!40000 ALTER TABLE `reports_schedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_schedulers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `readable_permissions` longtext NOT NULL COMMENT '(DC2Type:array)',
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Administrator','Full system access',1,'N;','2b52fc1b-1ee1-4a0e-83e9-172a4142a81e');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `saml_id_entry`
--

DROP TABLE IF EXISTS `saml_id_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saml_id_entry` (
  `id` varchar(191) NOT NULL,
  `entity_id` varchar(191) NOT NULL,
  `expiryTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saml_id_entry`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `saml_id_entry` WRITE;
/*!40000 ALTER TABLE `saml_id_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `saml_id_entry` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sms_message_list_xref`
--

DROP TABLE IF EXISTS `sms_message_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_message_list_xref` (
  `sms_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sms_id`,`leadlist_id`),
  KEY `IDX_B032FC2EB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_B032FC2EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B032FC2EBD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `sms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_message_list_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sms_message_list_xref` WRITE;
/*!40000 ALTER TABLE `sms_message_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_message_list_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sms_message_stats`
--

DROP TABLE IF EXISTS `sms_message_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_message_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sms_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `tracking_hash` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`details`)),
  PRIMARY KEY (`id`),
  KEY `IDX_FE1BAE9BD5C7E60` (`sms_id`),
  KEY `IDX_FE1BAE955458D` (`lead_id`),
  KEY `IDX_FE1BAE93DAE168B` (`list_id`),
  KEY `IDX_FE1BAE9A03F5E9F` (`ip_id`),
  KEY `stat_sms_search` (`sms_id`,`lead_id`),
  KEY `stat_sms_hash_search` (`tracking_hash`),
  KEY `stat_sms_source_search` (`source`,`source_id`),
  KEY `stat_sms_failed_search` (`is_failed`),
  CONSTRAINT `FK_FE1BAE93DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE1BAE955458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE1BAE9A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE1BAE9BD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `sms_messages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_message_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sms_message_stats` WRITE;
/*!40000 ALTER TABLE `sms_message_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_message_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sms_messages`
--

DROP TABLE IF EXISTS `sms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `sms_type` longtext DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`media`)),
  `is_mms` tinyint(1) NOT NULL DEFAULT 0,
  `lang` varchar(191) NOT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_BDF43F9712469DE2` (`category_id`),
  KEY `IDX_BDF43F979091A2FB` (`translation_parent_id`),
  CONSTRAINT `FK_BDF43F9712469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_BDF43F979091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `sms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sms_messages` WRITE;
/*!40000 ALTER TABLE `sms_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sms_projects_xref`
--

DROP TABLE IF EXISTS `sms_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_projects_xref` (
  `sms_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sms_id`,`project_id`),
  KEY `IDX_FDFF2EBE166D1F9C` (`project_id`),
  CONSTRAINT `FK_FDFF2EBE166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FDFF2EBEBD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `sms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sms_projects_xref` WRITE;
/*!40000 ALTER TABLE `sms_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `stage_lead_action_log`
--

DROP TABLE IF EXISTS `stage_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_lead_action_log` (
  `stage_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`stage_id`,`lead_id`),
  KEY `IDX_A506AFBE55458D` (`lead_id`),
  KEY `IDX_A506AFBEA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_A506AFBE2298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A506AFBE55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A506AFBEA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_lead_action_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `stage_lead_action_log` WRITE;
/*!40000 ALTER TABLE `stage_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `stage_projects_xref`
--

DROP TABLE IF EXISTS `stage_projects_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_projects_xref` (
  `stage_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stage_id`,`project_id`),
  KEY `IDX_A6068A96166D1F9C` (`project_id`),
  CONSTRAINT `FK_A6068A96166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6068A962298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_projects_xref`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `stage_projects_xref` WRITE;
/*!40000 ALTER TABLE `stage_projects_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_projects_xref` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  KEY `IDX_2FA26A6412469DE2` (`category_id`),
  CONSTRAINT `FK_2FA26A6412469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_object_field_change_report`
--

DROP TABLE IF EXISTS `sync_object_field_change_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_object_field_change_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `integration` varchar(191) NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `object_type` varchar(191) NOT NULL,
  `modified_at` datetime NOT NULL,
  `column_name` varchar(191) NOT NULL,
  `column_type` varchar(191) NOT NULL,
  `column_value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_composite_key` (`object_type`,`object_id`,`column_name`),
  KEY `integration_object_composite_key` (`integration`,`object_type`,`object_id`,`column_name`),
  KEY `integration_object_type_modification_composite_key` (`integration`,`object_type`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_field_change_report`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_object_field_change_report` WRITE;
/*!40000 ALTER TABLE `sync_object_field_change_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_object_field_change_report` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_object_mapping`
--

DROP TABLE IF EXISTS `sync_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_object_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `integration` varchar(191) NOT NULL,
  `internal_object_name` varchar(191) NOT NULL,
  `internal_object_id` bigint(20) unsigned NOT NULL,
  `integration_object_name` varchar(191) NOT NULL,
  `integration_object_id` varchar(191) NOT NULL,
  `last_sync_date` datetime NOT NULL,
  `internal_storage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`internal_storage`)),
  `is_deleted` tinyint(1) NOT NULL,
  `integration_reference_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `internal_object_id_idx` (`internal_object_id`),
  KEY `integration_object` (`integration`,`integration_object_name`,`integration_object_id`,`integration_reference_id`),
  KEY `integration_reference` (`integration`,`integration_object_name`,`integration_reference_id`,`integration_object_id`),
  KEY `integration_integration_object_name_last_sync_date` (`integration`,`internal_object_name`,`last_sync_date`),
  KEY `integration_last_sync_date` (`integration`,`last_sync_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_mapping`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_object_mapping` WRITE;
/*!40000 ALTER TABLE `sync_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tweet_stats`
--

DROP TABLE IF EXISTS `tweet_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `twitter_tweet_id` varchar(191) DEFAULT NULL,
  `handle` varchar(191) NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `response_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`response_details`)),
  PRIMARY KEY (`id`),
  KEY `IDX_CB8CBAE51041E39B` (`tweet_id`),
  KEY `IDX_CB8CBAE555458D` (`lead_id`),
  KEY `stat_tweet_search` (`tweet_id`,`lead_id`),
  KEY `stat_tweet_search2` (`lead_id`,`tweet_id`),
  KEY `stat_tweet_failed_search` (`is_failed`),
  KEY `stat_tweet_source_search` (`source`,`source_id`),
  KEY `favorite_count_index` (`favorite_count`),
  KEY `retweet_count_index` (`retweet_count`),
  KEY `tweet_date_sent` (`date_sent`),
  KEY `twitter_tweet_id_index` (`twitter_tweet_id`),
  CONSTRAINT `FK_CB8CBAE51041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CB8CBAE555458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tweet_stats` WRITE;
/*!40000 ALTER TABLE `tweet_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweet_stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `asset_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `media_id` varchar(191) DEFAULT NULL,
  `media_path` varchar(191) DEFAULT NULL,
  `text` varchar(191) NOT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `lang` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA38402512469DE2` (`category_id`),
  KEY `IDX_AA384025C4663E4` (`page_id`),
  KEY `IDX_AA3840255DA1941` (`asset_id`),
  KEY `sent_count_index` (`sent_count`),
  KEY `favorite_count_index` (`favorite_count`),
  KEY `retweet_count_index` (`retweet_count`),
  CONSTRAINT `FK_AA38402512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA3840255DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA384025C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `email` varchar(191) NOT NULL,
  `token_selector` varchar(32) NOT NULL,
  `token_verifier_hash` varchar(255) NOT NULL,
  `expiration` datetime NOT NULL,
  `used` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_INVITES_TOKEN_SELECTOR` (`token_selector`),
  KEY `IDX_USER_INVITES_EMAIL` (`email`),
  KEY `IDX_USER_INVITES_EXPIRATION` (`expiration`),
  KEY `IDX_USER_INVITES_ROLE` (`role_id`),
  KEY `IDX_USER_INVITES_USED` (`used`),
  CONSTRAINT `FK_5B737466D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `authorizator` varchar(32) NOT NULL,
  `secret` varchar(120) NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `one_time_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CF080AB35CA2E8E5` (`secret`),
  KEY `IDX_CF080AB3A76ED395` (`user_id`),
  CONSTRAINT `FK_CF080AB3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(64) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `position` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `preferences` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `signature` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`),
  KEY `IDX_1483A5E9D60322AC` (`role_id`),
  CONSTRAINT `FK_1483A5E9D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','$2y$13$LuX0ri/ys6x6.jvaFLancum3tRfw9XlJZ/FtUbwhy14NoEU1LPiSm','Admin','User','admin@mauteam.org',NULL,'','','2026-11-08 23:42:11','2026-11-08 23:42:11','a:0:{}',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `video_hits`
--

DROP TABLE IF EXISTS `video_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `region` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `isp` varchar(191) DEFAULT NULL,
  `organization` varchar(191) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `remote_host` varchar(191) DEFAULT NULL,
  `guid` varchar(191) NOT NULL,
  `page_language` varchar(191) DEFAULT NULL,
  `browser_languages` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `channel` varchar(191) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `time_watched` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `query` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_1D1831F755458D` (`lead_id`),
  KEY `IDX_1D1831F7A03F5E9F` (`ip_id`),
  KEY `video_date_hit` (`date_hit`),
  KEY `video_channel_search` (`channel`,`channel_id`),
  KEY `video_guid_lead_search` (`guid`,`lead_id`),
  CONSTRAINT `FK_1D1831F755458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1D1831F7A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_hits`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `video_hits` WRITE;
/*!40000 ALTER TABLE `video_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_hits` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhook_events`
--

DROP TABLE IF EXISTS `webhook_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `event_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7AD44E375C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_7AD44E375C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhook_events` WRITE;
/*!40000 ALTER TABLE `webhook_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhook_logs`
--

DROP TABLE IF EXISTS `webhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `runtime` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_45A353475C9BA60B` (`webhook_id`),
  KEY `webhook_id_date_added` (`webhook_id`,`date_added`),
  CONSTRAINT `FK_45A353475C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhook_logs` WRITE;
/*!40000 ALTER TABLE `webhook_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhook_queue`
--

DROP TABLE IF EXISTS `webhook_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `payload_compressed` mediumblob DEFAULT NULL,
  `retries` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_F52D9A1A5C9BA60B` (`webhook_id`),
  KEY `IDX_F52D9A1A71F7E88B` (`event_id`),
  CONSTRAINT `FK_F52D9A1A5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F52D9A1A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `webhook_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_queue`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhook_queue` WRITE;
/*!40000 ALTER TABLE `webhook_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_queue` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `webhook_url` longtext NOT NULL,
  `secret` varchar(191) NOT NULL,
  `events_orderby_dir` varchar(191) DEFAULT NULL,
  `marked_unhealthy_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `unhealthy_since` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `last_notification_sent_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_998C4FDD12469DE2` (`category_id`),
  CONSTRAINT `FK_998C4FDD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `cache_timeout` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `params` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES
(1,1,'2026-11-08 23:40:28',1,'Admin User','2026-11-08 23:40:28',1,'Admin User',NULL,NULL,NULL,'Contacts Created','created.leads.in.time',100,330,NULL,0,'a:1:{s:5:\"lists\";s:21:\"identifiedVsAnonymous\";}'),
(2,1,'2026-11-08 23:40:28',1,'Admin User','2026-11-08 23:40:28',1,'Admin User',NULL,NULL,NULL,'Page Visits','page.hits.in.time',50,330,NULL,1,'a:1:{s:4:\"flag\";s:6:\"unique\";}'),
(3,1,'2026-11-08 23:40:28',1,'Admin User','2026-11-08 23:40:28',1,'Admin User',NULL,NULL,NULL,'Form Submissions','submissions.in.time',50,330,NULL,2,'a:0:{}'),
(4,1,'2026-11-08 23:40:28',1,'Admin User','2026-11-08 23:40:28',1,'Admin User',NULL,NULL,NULL,'Recent Activity','recent.activity',50,330,NULL,3,'a:0:{}'),
(5,1,'2026-11-08 23:40:28',1,'Admin User','2026-11-08 23:40:28',1,'Admin User',NULL,NULL,NULL,'Upcoming Emails','upcoming.emails',50,330,NULL,4,'a:0:{}');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'mautic_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-09  0:16:25
