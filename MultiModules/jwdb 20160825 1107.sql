-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jwdb
--

CREATE DATABASE IF NOT EXISTS jwdb;
USE jwdb;

--
-- Definition of table `app_app`
--

DROP TABLE IF EXISTS `app_app`;
CREATE TABLE `app_app` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `license` text,
  `description` longtext,
  `meta` longtext,
  PRIMARY KEY (`appId`,`appVersion`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_app`
--

/*!40000 ALTER TABLE `app_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_app` ENABLE KEYS */;


--
-- Definition of table `app_datalist`
--

DROP TABLE IF EXISTS `app_datalist`;
CREATE TABLE `app_datalist` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK5E9247A6462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK5E9247A6462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_datalist`
--

/*!40000 ALTER TABLE `app_datalist` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_datalist` ENABLE KEYS */;


--
-- Definition of table `app_env_variable`
--

DROP TABLE IF EXISTS `app_env_variable`;
CREATE TABLE `app_env_variable` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` text,
  `remarks` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK740A62EC462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK740A62EC462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_env_variable`
--

/*!40000 ALTER TABLE `app_env_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_env_variable` ENABLE KEYS */;


--
-- Definition of table `app_fd`
--

DROP TABLE IF EXISTS `app_fd`;
CREATE TABLE `app_fd` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_fd`
--

/*!40000 ALTER TABLE `app_fd` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd` ENABLE KEYS */;


--
-- Definition of table `app_form`
--

DROP TABLE IF EXISTS `app_form`;
CREATE TABLE `app_form` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `formId` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `json` longtext,
  `description` longtext,
  PRIMARY KEY (`appId`,`appVersion`,`formId`),
  KEY `FK45957822462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK45957822462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_form`
--

/*!40000 ALTER TABLE `app_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_form` ENABLE KEYS */;


--
-- Definition of table `app_form_data_audit_trail`
--

DROP TABLE IF EXISTS `app_form_data_audit_trail`;
CREATE TABLE `app_form_data_audit_trail` (
  `id` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` longtext,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_form_data_audit_trail`
--

/*!40000 ALTER TABLE `app_form_data_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_form_data_audit_trail` ENABLE KEYS */;


--
-- Definition of table `app_message`
--

DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`appId`,`appVersion`,`ouid`),
  KEY `FKEE346FE9462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FKEE346FE9462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_message`
--

/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_message` ENABLE KEYS */;


--
-- Definition of table `app_package`
--

DROP TABLE IF EXISTS `app_package`;
CREATE TABLE `app_package` (
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`packageId`,`packageVersion`),
  KEY `FK852EA428462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK852EA428462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_package`
--

/*!40000 ALTER TABLE `app_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_package` ENABLE KEYS */;


--
-- Definition of table `app_package_activity_form`
--

DROP TABLE IF EXISTS `app_package_activity_form`;
CREATE TABLE `app_package_activity_form` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `formUrl` varchar(255) DEFAULT NULL,
  `formIFrameStyle` varchar(255) DEFAULT NULL,
  `autoContinue` bit(1) DEFAULT NULL,
  `disableSaveAsDraft` bit(1) DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKA8D741D5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKA8D741D5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_package_activity_form`
--

/*!40000 ALTER TABLE `app_package_activity_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_package_activity_form` ENABLE KEYS */;


--
-- Definition of table `app_package_activity_plugin`
--

DROP TABLE IF EXISTS `app_package_activity_plugin`;
CREATE TABLE `app_package_activity_plugin` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKADE8644C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKADE8644C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_package_activity_plugin`
--

/*!40000 ALTER TABLE `app_package_activity_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_package_activity_plugin` ENABLE KEYS */;


--
-- Definition of table `app_package_participant`
--

DROP TABLE IF EXISTS `app_package_participant`;
CREATE TABLE `app_package_participant` (
  `processDefId` varchar(255) NOT NULL,
  `participantId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` text,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`participantId`,`packageId`,`packageVersion`),
  KEY `FK6D7BF59C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FK6D7BF59C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_package_participant`
--

/*!40000 ALTER TABLE `app_package_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_package_participant` ENABLE KEYS */;


--
-- Definition of table `app_plugin_default`
--

DROP TABLE IF EXISTS `app_plugin_default`;
CREATE TABLE `app_plugin_default` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginDescription` text,
  `pluginProperties` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK7A835713462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK7A835713462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_plugin_default`
--

/*!40000 ALTER TABLE `app_plugin_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plugin_default` ENABLE KEYS */;


--
-- Definition of table `app_report_activity`
--

DROP TABLE IF EXISTS `app_report_activity`;
CREATE TABLE `app_report_activity` (
  `uuid` varchar(255) NOT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK5E33D79C918F93D` (`processUid`),
  CONSTRAINT `FK5E33D79C918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_activity`
--

/*!40000 ALTER TABLE `app_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity` ENABLE KEYS */;


--
-- Definition of table `app_report_activity_instance`
--

DROP TABLE IF EXISTS `app_report_activity_instance`;
CREATE TABLE `app_report_activity_instance` (
  `instanceId` varchar(255) NOT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `due` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromCreatedTime` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `activityUid` varchar(255) DEFAULT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK9C6ABDD8B06E2043` (`activityUid`),
  KEY `FK9C6ABDD8D4610A90` (`processInstanceId`),
  CONSTRAINT `FK9C6ABDD8B06E2043` FOREIGN KEY (`activityUid`) REFERENCES `app_report_activity` (`uuid`),
  CONSTRAINT `FK9C6ABDD8D4610A90` FOREIGN KEY (`processInstanceId`) REFERENCES `app_report_process_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_activity_instance`
--

/*!40000 ALTER TABLE `app_report_activity_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity_instance` ENABLE KEYS */;


--
-- Definition of table `app_report_app`
--

DROP TABLE IF EXISTS `app_report_app`;
CREATE TABLE `app_report_app` (
  `uuid` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `appName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_app`
--

/*!40000 ALTER TABLE `app_report_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_app` ENABLE KEYS */;


--
-- Definition of table `app_report_package`
--

DROP TABLE IF EXISTS `app_report_package`;
CREATE TABLE `app_report_package` (
  `uuid` varchar(255) NOT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  `packageVersion` varchar(255) DEFAULT NULL,
  `appUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKBD580A19E475ABC` (`appUid`),
  CONSTRAINT `FKBD580A19E475ABC` FOREIGN KEY (`appUid`) REFERENCES `app_report_app` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_package`
--

/*!40000 ALTER TABLE `app_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_package` ENABLE KEYS */;


--
-- Definition of table `app_report_process`
--

DROP TABLE IF EXISTS `app_report_process`;
CREATE TABLE `app_report_process` (
  `uuid` varchar(255) NOT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `packageUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKDAFFF442D40695DD` (`packageUid`),
  CONSTRAINT `FKDAFFF442D40695DD` FOREIGN KEY (`packageUid`) REFERENCES `app_report_package` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_process`
--

/*!40000 ALTER TABLE `app_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process` ENABLE KEYS */;


--
-- Definition of table `app_report_process_instance`
--

DROP TABLE IF EXISTS `app_report_process_instance`;
CREATE TABLE `app_report_process_instance` (
  `instanceId` varchar(255) NOT NULL,
  `requester` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK351D7BF2918F93D` (`processUid`),
  CONSTRAINT `FK351D7BF2918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_report_process_instance`
--

/*!40000 ALTER TABLE `app_report_process_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process_instance` ENABLE KEYS */;


--
-- Definition of table `app_userview`
--

DROP TABLE IF EXISTS `app_userview`;
CREATE TABLE `app_userview` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FKE411D54E462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FKE411D54E462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_userview`
--

/*!40000 ALTER TABLE `app_userview` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_userview` ENABLE KEYS */;


--
-- Definition of table `dir_department`
--

DROP TABLE IF EXISTS `dir_department`;
CREATE TABLE `dir_department` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  `hod` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEE8AA4418CEBAE1` (`organizationId`),
  KEY `FKEEE8AA44EF6BB2B7` (`parentId`),
  KEY `FKEEE8AA4480DB1449` (`hod`),
  CONSTRAINT `FKEEE8AA4418CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKEEE8AA4480DB1449` FOREIGN KEY (`hod`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FKEEE8AA44EF6BB2B7` FOREIGN KEY (`parentId`) REFERENCES `dir_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_department`
--

/*!40000 ALTER TABLE `dir_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_department` ENABLE KEYS */;


--
-- Definition of table `dir_employment`
--

DROP TABLE IF EXISTS `dir_employment`;
CREATE TABLE `dir_employment` (
  `id` varchar(255) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `gradeId` varchar(255) DEFAULT NULL,
  `departmentId` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `FKC6620ADE14CE02E9` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `FKC6620ADE18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKC6620ADE716AE35F` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `FKC6620ADECE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_employment`
--

/*!40000 ALTER TABLE `dir_employment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_employment` ENABLE KEYS */;


--
-- Definition of table `dir_employment_report_to`
--

DROP TABLE IF EXISTS `dir_employment_report_to`;
CREATE TABLE `dir_employment_report_to` (
  `employmentId` varchar(255) NOT NULL,
  `reportToId` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employmentId`,`reportToId`),
  KEY `FK53622945F4068416` (`reportToId`),
  KEY `FK536229452787E613` (`employmentId`),
  CONSTRAINT `FK536229452787E613` FOREIGN KEY (`employmentId`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FK53622945F4068416` FOREIGN KEY (`reportToId`) REFERENCES `dir_employment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_employment_report_to`
--

/*!40000 ALTER TABLE `dir_employment_report_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_employment_report_to` ENABLE KEYS */;


--
-- Definition of table `dir_grade`
--

DROP TABLE IF EXISTS `dir_grade`;
CREATE TABLE `dir_grade` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A49A518CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A49A518CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_grade`
--

/*!40000 ALTER TABLE `dir_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_grade` ENABLE KEYS */;


--
-- Definition of table `dir_group`
--

DROP TABLE IF EXISTS `dir_group`;
CREATE TABLE `dir_group` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A804D18CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A804D18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_group`
--

/*!40000 ALTER TABLE `dir_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_group` ENABLE KEYS */;


--
-- Definition of table `dir_organization`
--

DROP TABLE IF EXISTS `dir_organization`;
CREATE TABLE `dir_organization` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55A15FA5961BD498` (`parentId`),
  CONSTRAINT `FK55A15FA5961BD498` FOREIGN KEY (`parentId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_organization`
--

/*!40000 ALTER TABLE `dir_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_organization` ENABLE KEYS */;


--
-- Definition of table `dir_role`
--

DROP TABLE IF EXISTS `dir_role`;
CREATE TABLE `dir_role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_role`
--

/*!40000 ALTER TABLE `dir_role` DISABLE KEYS */;
INSERT INTO `dir_role` (`id`,`name`,`description`) VALUES 
 ('ROLE_ADMIN','Admin','Administrator'),
 ('ROLE_USER','User','Normal User');
/*!40000 ALTER TABLE `dir_role` ENABLE KEYS */;


--
-- Definition of table `dir_user`
--

DROP TABLE IF EXISTS `dir_user`;
CREATE TABLE `dir_user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_user`
--

/*!40000 ALTER TABLE `dir_user` DISABLE KEYS */;
INSERT INTO `dir_user` (`id`,`username`,`password`,`firstName`,`lastName`,`email`,`active`,`timeZone`,`locale`) VALUES 
 ('admin','admin','21232f297a57a5a743894a0e4a801fc3','Admin','Admin',NULL,1,'0',NULL);
/*!40000 ALTER TABLE `dir_user` ENABLE KEYS */;


--
-- Definition of table `dir_user_extra`
--

DROP TABLE IF EXISTS `dir_user_extra`;
CREATE TABLE `dir_user_extra` (
  `username` varchar(255) NOT NULL,
  `algorithm` varchar(255) DEFAULT NULL,
  `loginAttempt` int(11) DEFAULT NULL,
  `failedloginAttempt` int(11) DEFAULT NULL,
  `lastLogedInDate` datetime DEFAULT NULL,
  `lockOutDate` datetime DEFAULT NULL,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `requiredPasswordChange` bit(1) DEFAULT NULL,
  `noPasswordExpiration` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_user_extra`
--

/*!40000 ALTER TABLE `dir_user_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_extra` ENABLE KEYS */;


--
-- Definition of table `dir_user_group`
--

DROP TABLE IF EXISTS `dir_user_group`;
CREATE TABLE `dir_user_group` (
  `groupId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `FK2F0367FD159B6639` (`groupId`),
  KEY `FK2F0367FDCE539211` (`userId`),
  CONSTRAINT `FK2F0367FD159B6639` FOREIGN KEY (`groupId`) REFERENCES `dir_group` (`id`),
  CONSTRAINT `FK2F0367FDCE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_user_group`
--

/*!40000 ALTER TABLE `dir_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_group` ENABLE KEYS */;


--
-- Definition of table `dir_user_password_history`
--

DROP TABLE IF EXISTS `dir_user_password_history`;
CREATE TABLE `dir_user_password_history` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_user_password_history`
--

/*!40000 ALTER TABLE `dir_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_password_history` ENABLE KEYS */;


--
-- Definition of table `dir_user_role`
--

DROP TABLE IF EXISTS `dir_user_role`;
CREATE TABLE `dir_user_role` (
  `roleId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `FK5C5FE738C8FE3CA7` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `FK5C5FE738CE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dir_user_role`
--

/*!40000 ALTER TABLE `dir_user_role` DISABLE KEYS */;
INSERT INTO `dir_user_role` (`roleId`,`userId`) VALUES 
 ('ROLE_ADMIN','admin');
/*!40000 ALTER TABLE `dir_user_role` ENABLE KEYS */;


--
-- Definition of table `objectid`
--

DROP TABLE IF EXISTS `objectid`;
CREATE TABLE `objectid` (
  `nextoid` decimal(19,0) NOT NULL,
  PRIMARY KEY (`nextoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `objectid`
--

/*!40000 ALTER TABLE `objectid` DISABLE KEYS */;
INSERT INTO `objectid` (`nextoid`) VALUES 
 ('1000200');
/*!40000 ALTER TABLE `objectid` ENABLE KEYS */;


--
-- Definition of table `shkactivities`
--

DROP TABLE IF EXISTS `shkactivities`;
CREATE TABLE `shkactivities` (
  `Id` varchar(100) NOT NULL,
  `ActivitySetDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Process` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) DEFAULT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ProcessId` varchar(200) NOT NULL,
  `ResourceId` varchar(100) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `BlockActivityId` varchar(100) DEFAULT NULL,
  `Performer` varchar(100) DEFAULT NULL,
  `IsPerformerAsynchronous` smallint(6) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Activated` bigint(20) NOT NULL,
  `ActivatedTZO` bigint(20) NOT NULL,
  `Accepted` bigint(20) DEFAULT NULL,
  `AcceptedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivities` (`Id`),
  KEY `SHKActivities_TheResource` (`TheResource`),
  KEY `SHKActivities_State` (`State`),
  KEY `I2_SHKActivities` (`Process`,`ActivitySetDefinitionId`,`ActivityDefinitionId`),
  KEY `I3_SHKActivities` (`Process`,`State`),
  CONSTRAINT `SHKActivities_Process` FOREIGN KEY (`Process`) REFERENCES `shkprocesses` (`oid`),
  CONSTRAINT `SHKActivities_State` FOREIGN KEY (`State`) REFERENCES `shkactivitystates` (`oid`),
  CONSTRAINT `SHKActivities_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `shkresourcestable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivities`
--

/*!40000 ALTER TABLE `shkactivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkactivities` ENABLE KEYS */;


--
-- Definition of table `shkactivitydata`
--

DROP TABLE IF EXISTS `shkactivitydata`;
CREATE TABLE `shkactivitydata` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityData` (`CNT`),
  UNIQUE KEY `I2_SHKActivityData` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityData_Activity` FOREIGN KEY (`Activity`) REFERENCES `shkactivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivitydata`
--

/*!40000 ALTER TABLE `shkactivitydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkactivitydata` ENABLE KEYS */;


--
-- Definition of table `shkactivitydatablobs`
--

DROP TABLE IF EXISTS `shkactivitydatablobs`;
CREATE TABLE `shkactivitydatablobs` (
  `ActivityDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataBLOBs` (`ActivityDataWOB`,`OrdNo`),
  CONSTRAINT `SHKActivityDataBLOBs_ActivityDataWOB` FOREIGN KEY (`ActivityDataWOB`) REFERENCES `shkactivitydatawob` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivitydatablobs`
--

/*!40000 ALTER TABLE `shkactivitydatablobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkactivitydatablobs` ENABLE KEYS */;


--
-- Definition of table `shkactivitydatawob`
--

DROP TABLE IF EXISTS `shkactivitydatawob`;
CREATE TABLE `shkactivitydatawob` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKActivityDataWOB` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityDataWOB_Activity` FOREIGN KEY (`Activity`) REFERENCES `shkactivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivitydatawob`
--

/*!40000 ALTER TABLE `shkactivitydatawob` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkactivitydatawob` ENABLE KEYS */;


--
-- Definition of table `shkactivitystateeventaudits`
--

DROP TABLE IF EXISTS `shkactivitystateeventaudits`;
CREATE TABLE `shkactivitystateeventaudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivitystateeventaudits`
--

/*!40000 ALTER TABLE `shkactivitystateeventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkactivitystateeventaudits` ENABLE KEYS */;


--
-- Definition of table `shkactivitystates`
--

DROP TABLE IF EXISTS `shkactivitystates`;
CREATE TABLE `shkactivitystates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkactivitystates`
--

/*!40000 ALTER TABLE `shkactivitystates` DISABLE KEYS */;
INSERT INTO `shkactivitystates` (`KeyValue`,`Name`,`oid`,`version`) VALUES 
 ('open.running','open.running','1000001',0),
 ('open.not_running.not_started','open.not_running.not_started','1000003',0),
 ('open.not_running.suspended','open.not_running.suspended','1000005',0),
 ('closed.completed','closed.completed','1000007',0),
 ('closed.terminated','closed.terminated','1000009',0),
 ('closed.aborted','closed.aborted','1000011',0);
/*!40000 ALTER TABLE `shkactivitystates` ENABLE KEYS */;


--
-- Definition of table `shkandjointable`
--

DROP TABLE IF EXISTS `shkandjointable`;
CREATE TABLE `shkandjointable` (
  `Process` decimal(19,0) NOT NULL,
  `BlockActivity` decimal(19,0) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAndJoinTable` (`CNT`),
  KEY `SHKAndJoinTable_BlockActivity` (`BlockActivity`),
  KEY `I2_SHKAndJoinTable` (`Process`,`BlockActivity`,`ActivityDefinitionId`),
  KEY `I3_SHKAndJoinTable` (`Activity`),
  CONSTRAINT `SHKAndJoinTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `shkactivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_BlockActivity` FOREIGN KEY (`BlockActivity`) REFERENCES `shkactivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_Process` FOREIGN KEY (`Process`) REFERENCES `shkprocesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkandjointable`
--

/*!40000 ALTER TABLE `shkandjointable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkandjointable` ENABLE KEYS */;


--
-- Definition of table `shkassignmenteventaudits`
--

DROP TABLE IF EXISTS `shkassignmenteventaudits`;
CREATE TABLE `shkassignmenteventaudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldResourceUsername` varchar(100) DEFAULT NULL,
  `OldResourceName` varchar(100) DEFAULT NULL,
  `NewResourceUsername` varchar(100) NOT NULL,
  `NewResourceName` varchar(100) DEFAULT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentEventAudits` (`CNT`),
  KEY `SHKAssignmentEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKAssignmentEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `shkeventtypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkassignmenteventaudits`
--

/*!40000 ALTER TABLE `shkassignmenteventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkassignmenteventaudits` ENABLE KEYS */;


--
-- Definition of table `shkassignmentstable`
--

DROP TABLE IF EXISTS `shkassignmentstable`;
CREATE TABLE `shkassignmentstable` (
  `Activity` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityProcessId` varchar(100) NOT NULL,
  `ActivityProcessDefName` varchar(200) NOT NULL,
  `ResourceId` varchar(100) NOT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `IsValid` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentsTable` (`CNT`),
  UNIQUE KEY `I2_SHKAssignmentsTable` (`Activity`,`TheResource`),
  KEY `I3_SHKAssignmentsTable` (`TheResource`,`IsValid`),
  KEY `I4_SHKAssignmentsTable` (`ActivityId`),
  KEY `I5_SHKAssignmentsTable` (`ResourceId`),
  KEY `FK_rnb6mhntls567xpifcfvygkuu` (`ActivityProcessId`),
  CONSTRAINT `FK_183e6adufsi558hl5p4dqkqsx` FOREIGN KEY (`ActivityId`) REFERENCES `shkactivities` (`Id`),
  CONSTRAINT `FK_rnb6mhntls567xpifcfvygkuu` FOREIGN KEY (`ActivityProcessId`) REFERENCES `shkprocesses` (`Id`),
  CONSTRAINT `SHKAssignmentsTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `shkactivities` (`oid`),
  CONSTRAINT `SHKAssignmentsTable_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `shkresourcestable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkassignmentstable`
--

/*!40000 ALTER TABLE `shkassignmentstable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkassignmentstable` ENABLE KEYS */;


--
-- Definition of table `shkcounters`
--

DROP TABLE IF EXISTS `shkcounters`;
CREATE TABLE `shkcounters` (
  `name` varchar(100) NOT NULL,
  `the_number` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCounters` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkcounters`
--

/*!40000 ALTER TABLE `shkcounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkcounters` ENABLE KEYS */;


--
-- Definition of table `shkcreateprocesseventaudits`
--

DROP TABLE IF EXISTS `shkcreateprocesseventaudits`;
CREATE TABLE `shkcreateprocesseventaudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `PActivityId` varchar(100) DEFAULT NULL,
  `PProcessId` varchar(100) DEFAULT NULL,
  `PProcessName` varchar(254) DEFAULT NULL,
  `PProcessFactoryName` varchar(200) DEFAULT NULL,
  `PProcessFactoryVersion` varchar(20) DEFAULT NULL,
  `PActivityDefinitionId` varchar(90) DEFAULT NULL,
  `PActivityDefinitionName` varchar(90) DEFAULT NULL,
  `PProcessDefinitionId` varchar(90) DEFAULT NULL,
  `PProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PPackageId` varchar(90) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCreateProcessEventAudits` (`CNT`),
  KEY `SHKCreateProcessEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKCreateProcessEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `shkeventtypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkcreateprocesseventaudits`
--

/*!40000 ALTER TABLE `shkcreateprocesseventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkcreateprocesseventaudits` ENABLE KEYS */;


--
-- Definition of table `shkdataeventaudits`
--

DROP TABLE IF EXISTS `shkdataeventaudits`;
CREATE TABLE `shkdataeventaudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDataEventAudits` (`CNT`),
  KEY `SHKDataEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKDataEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `shkeventtypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkdataeventaudits`
--

/*!40000 ALTER TABLE `shkdataeventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkdataeventaudits` ENABLE KEYS */;


--
-- Definition of table `shkdeadlines`
--

DROP TABLE IF EXISTS `shkdeadlines`;
CREATE TABLE `shkdeadlines` (
  `Process` decimal(19,0) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `TimeLimit` bigint(20) NOT NULL,
  `TimeLimitTZO` bigint(20) NOT NULL,
  `ExceptionName` varchar(100) NOT NULL,
  `IsSynchronous` smallint(6) NOT NULL,
  `IsExecuted` smallint(6) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDeadlines` (`CNT`),
  KEY `I2_SHKDeadlines` (`Process`,`TimeLimit`),
  KEY `I3_SHKDeadlines` (`Activity`,`TimeLimit`),
  CONSTRAINT `SHKDeadlines_Activity` FOREIGN KEY (`Activity`) REFERENCES `shkactivities` (`oid`),
  CONSTRAINT `SHKDeadlines_Process` FOREIGN KEY (`Process`) REFERENCES `shkprocesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkdeadlines`
--

/*!40000 ALTER TABLE `shkdeadlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkdeadlines` ENABLE KEYS */;


--
-- Definition of table `shkeventtypes`
--

DROP TABLE IF EXISTS `shkeventtypes`;
CREATE TABLE `shkeventtypes` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKEventTypes` (`KeyValue`),
  UNIQUE KEY `I2_SHKEventTypes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkeventtypes`
--

/*!40000 ALTER TABLE `shkeventtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkeventtypes` ENABLE KEYS */;


--
-- Definition of table `shkgroupgrouptable`
--

DROP TABLE IF EXISTS `shkgroupgrouptable`;
CREATE TABLE `shkgroupgrouptable` (
  `sub_gid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupGroupTable` (`sub_gid`,`groupid`),
  KEY `I2_SHKGroupGroupTable` (`groupid`),
  CONSTRAINT `SHKGroupGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `shkgrouptable` (`oid`),
  CONSTRAINT `SHKGroupGroupTable_sub_gid` FOREIGN KEY (`sub_gid`) REFERENCES `shkgrouptable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkgroupgrouptable`
--

/*!40000 ALTER TABLE `shkgroupgrouptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkgroupgrouptable` ENABLE KEYS */;


--
-- Definition of table `shkgrouptable`
--

DROP TABLE IF EXISTS `shkgrouptable`;
CREATE TABLE `shkgrouptable` (
  `groupid` varchar(100) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupTable` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkgrouptable`
--

/*!40000 ALTER TABLE `shkgrouptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkgrouptable` ENABLE KEYS */;


--
-- Definition of table `shkgroupuser`
--

DROP TABLE IF EXISTS `shkgroupuser`;
CREATE TABLE `shkgroupuser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkgroupuser`
--

/*!40000 ALTER TABLE `shkgroupuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkgroupuser` ENABLE KEYS */;


--
-- Definition of table `shkgroupuserpacklevelpart`
--

DROP TABLE IF EXISTS `shkgroupuserpacklevelpart`;
CREATE TABLE `shkgroupuserpacklevelpart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `shkpacklevelparticipant` (`oid`),
  CONSTRAINT `SHKGroupUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shkgroupuser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkgroupuserpacklevelpart`
--

/*!40000 ALTER TABLE `shkgroupuserpacklevelpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkgroupuserpacklevelpart` ENABLE KEYS */;


--
-- Definition of table `shkgroupuserproclevelpart`
--

DROP TABLE IF EXISTS `shkgroupuserproclevelpart`;
CREATE TABLE `shkgroupuserproclevelpart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserProcLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserProcLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserProcLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `shkproclevelparticipant` (`oid`),
  CONSTRAINT `SHKGroupUserProcLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shkgroupuser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkgroupuserproclevelpart`
--

/*!40000 ALTER TABLE `shkgroupuserproclevelpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkgroupuserproclevelpart` ENABLE KEYS */;


--
-- Definition of table `shkneweventauditdata`
--

DROP TABLE IF EXISTS `shkneweventauditdata`;
CREATE TABLE `shkneweventauditdata` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `shkdataeventaudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkneweventauditdata`
--

/*!40000 ALTER TABLE `shkneweventauditdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkneweventauditdata` ENABLE KEYS */;


--
-- Definition of table `shkneweventauditdatablobs`
--

DROP TABLE IF EXISTS `shkneweventauditdatablobs`;
CREATE TABLE `shkneweventauditdatablobs` (
  `NewEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataBLOBs` (`NewEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataBLOBs_NewEventAuditDataWOB` FOREIGN KEY (`NewEventAuditDataWOB`) REFERENCES `shkneweventauditdatawob` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkneweventauditdatablobs`
--

/*!40000 ALTER TABLE `shkneweventauditdatablobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkneweventauditdatablobs` ENABLE KEYS */;


--
-- Definition of table `shkneweventauditdatawob`
--

DROP TABLE IF EXISTS `shkneweventauditdatawob`;
CREATE TABLE `shkneweventauditdatawob` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `shkdataeventaudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkneweventauditdatawob`
--

/*!40000 ALTER TABLE `shkneweventauditdatawob` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkneweventauditdatawob` ENABLE KEYS */;


--
-- Definition of table `shknextxpdlversions`
--

DROP TABLE IF EXISTS `shknextxpdlversions`;
CREATE TABLE `shknextxpdlversions` (
  `XPDLId` varchar(90) NOT NULL,
  `NextVersion` varchar(20) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNextXPDLVersions` (`XPDLId`,`NextVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shknextxpdlversions`
--

/*!40000 ALTER TABLE `shknextxpdlversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shknextxpdlversions` ENABLE KEYS */;


--
-- Definition of table `shknormaluser`
--

DROP TABLE IF EXISTS `shknormaluser`;
CREATE TABLE `shknormaluser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNormalUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shknormaluser`
--

/*!40000 ALTER TABLE `shknormaluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shknormaluser` ENABLE KEYS */;


--
-- Definition of table `shkoldeventauditdata`
--

DROP TABLE IF EXISTS `shkoldeventauditdata`;
CREATE TABLE `shkoldeventauditdata` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `shkdataeventaudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkoldeventauditdata`
--

/*!40000 ALTER TABLE `shkoldeventauditdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkoldeventauditdata` ENABLE KEYS */;


--
-- Definition of table `shkoldeventauditdatablobs`
--

DROP TABLE IF EXISTS `shkoldeventauditdatablobs`;
CREATE TABLE `shkoldeventauditdatablobs` (
  `OldEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataBLOBs` (`OldEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataBLOBs_OldEventAuditDataWOB` FOREIGN KEY (`OldEventAuditDataWOB`) REFERENCES `shkoldeventauditdatawob` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkoldeventauditdatablobs`
--

/*!40000 ALTER TABLE `shkoldeventauditdatablobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkoldeventauditdatablobs` ENABLE KEYS */;


--
-- Definition of table `shkoldeventauditdatawob`
--

DROP TABLE IF EXISTS `shkoldeventauditdatawob`;
CREATE TABLE `shkoldeventauditdatawob` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `shkdataeventaudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkoldeventauditdatawob`
--

/*!40000 ALTER TABLE `shkoldeventauditdatawob` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkoldeventauditdatawob` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelparticipant`
--

DROP TABLE IF EXISTS `shkpacklevelparticipant`;
CREATE TABLE `shkpacklevelparticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelParticipant` (`PARTICIPANT_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelParticipant_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelParticipant_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `shkxpdlparticipantpackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelparticipant`
--

/*!40000 ALTER TABLE `shkpacklevelparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelparticipant` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelxpdlapp`
--

DROP TABLE IF EXISTS `shkpacklevelxpdlapp`;
CREATE TABLE `shkpacklevelxpdlapp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLApp` (`APPLICATION_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelXPDLApp_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelXPDLApp_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `shkxpdlapplicationpackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelxpdlapp`
--

/*!40000 ALTER TABLE `shkpacklevelxpdlapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelxpdlapp` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelxpdlapptaappdetail`
--

DROP TABLE IF EXISTS `shkpacklevelxpdlapptaappdetail`;
CREATE TABLE `shkpacklevelxpdlapptaappdetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappdetail` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkpacklevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelxpdlapptaappdetail`
--

/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappdetail` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelxpdlapptaappdetusr`
--

DROP TABLE IF EXISTS `shkpacklevelxpdlapptaappdetusr`;
CREATE TABLE `shkpacklevelxpdlapptaappdetusr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappdetailuser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkpacklevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelxpdlapptaappdetusr`
--

/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappdetusr` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappdetusr` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelxpdlapptaappuser`
--

DROP TABLE IF EXISTS `shkpacklevelxpdlapptaappuser`;
CREATE TABLE `shkpacklevelxpdlapptaappuser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappuser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkpacklevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelxpdlapptaappuser`
--

/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelxpdlapptaappuser` ENABLE KEYS */;


--
-- Definition of table `shkpacklevelxpdlapptoolagntapp`
--

DROP TABLE IF EXISTS `shkpacklevelxpdlapptoolagntapp`;
CREATE TABLE `shkpacklevelxpdlapptoolagntapp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentapp` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkpacklevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkpacklevelxpdlapptoolagntapp`
--

/*!40000 ALTER TABLE `shkpacklevelxpdlapptoolagntapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkpacklevelxpdlapptoolagntapp` ENABLE KEYS */;


--
-- Definition of table `shkprocessdata`
--

DROP TABLE IF EXISTS `shkprocessdata`;
CREATE TABLE `shkprocessdata` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessData` (`CNT`),
  UNIQUE KEY `I2_SHKProcessData` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessData_Process` FOREIGN KEY (`Process`) REFERENCES `shkprocesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessdata`
--

/*!40000 ALTER TABLE `shkprocessdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessdata` ENABLE KEYS */;


--
-- Definition of table `shkprocessdatablobs`
--

DROP TABLE IF EXISTS `shkprocessdatablobs`;
CREATE TABLE `shkprocessdatablobs` (
  `ProcessDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataBLOBs` (`ProcessDataWOB`,`OrdNo`),
  CONSTRAINT `SHKProcessDataBLOBs_ProcessDataWOB` FOREIGN KEY (`ProcessDataWOB`) REFERENCES `shkprocessdatawob` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessdatablobs`
--

/*!40000 ALTER TABLE `shkprocessdatablobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessdatablobs` ENABLE KEYS */;


--
-- Definition of table `shkprocessdatawob`
--

DROP TABLE IF EXISTS `shkprocessdatawob`;
CREATE TABLE `shkprocessdatawob` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKProcessDataWOB` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessDataWOB_Process` FOREIGN KEY (`Process`) REFERENCES `shkprocesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessdatawob`
--

/*!40000 ALTER TABLE `shkprocessdatawob` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessdatawob` ENABLE KEYS */;


--
-- Definition of table `shkprocessdefinitions`
--

DROP TABLE IF EXISTS `shkprocessdefinitions`;
CREATE TABLE `shkprocessdefinitions` (
  `Name` varchar(200) NOT NULL,
  `PackageId` varchar(90) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionCreated` bigint(20) NOT NULL,
  `ProcessDefinitionVersion` varchar(20) NOT NULL,
  `State` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDefinitions` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessdefinitions`
--

/*!40000 ALTER TABLE `shkprocessdefinitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessdefinitions` ENABLE KEYS */;


--
-- Definition of table `shkprocesses`
--

DROP TABLE IF EXISTS `shkprocesses`;
CREATE TABLE `shkprocesses` (
  `SyncVersion` bigint(20) NOT NULL,
  `Id` varchar(100) NOT NULL,
  `ProcessDefinition` decimal(19,0) NOT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ActivityRequesterId` varchar(100) DEFAULT NULL,
  `ActivityRequesterProcessId` varchar(100) DEFAULT NULL,
  `ResourceRequesterId` varchar(100) NOT NULL,
  `ExternalRequesterClassName` varchar(254) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Created` bigint(20) NOT NULL,
  `CreatedTZO` bigint(20) NOT NULL,
  `Started` bigint(20) DEFAULT NULL,
  `StartedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcesses` (`Id`),
  KEY `I2_SHKProcesses` (`ProcessDefinition`),
  KEY `I3_SHKProcesses` (`State`),
  KEY `I4_SHKProcesses` (`ActivityRequesterId`),
  KEY `I5_SHKProcesses` (`ResourceRequesterId`),
  CONSTRAINT `SHKProcesses_ProcessDefinition` FOREIGN KEY (`ProcessDefinition`) REFERENCES `shkprocessdefinitions` (`oid`),
  CONSTRAINT `SHKProcesses_State` FOREIGN KEY (`State`) REFERENCES `shkprocessstates` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocesses`
--

/*!40000 ALTER TABLE `shkprocesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocesses` ENABLE KEYS */;


--
-- Definition of table `shkprocessrequesters`
--

DROP TABLE IF EXISTS `shkprocessrequesters`;
CREATE TABLE `shkprocessrequesters` (
  `Id` varchar(100) NOT NULL,
  `ActivityRequester` decimal(19,0) DEFAULT NULL,
  `ResourceRequester` decimal(19,0) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessRequesters` (`Id`),
  KEY `I2_SHKProcessRequesters` (`ActivityRequester`),
  KEY `I3_SHKProcessRequesters` (`ResourceRequester`),
  CONSTRAINT `SHKProcessRequesters_ActivityRequester` FOREIGN KEY (`ActivityRequester`) REFERENCES `shkactivities` (`oid`),
  CONSTRAINT `SHKProcessRequesters_ResourceRequester` FOREIGN KEY (`ResourceRequester`) REFERENCES `shkresourcestable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessrequesters`
--

/*!40000 ALTER TABLE `shkprocessrequesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessrequesters` ENABLE KEYS */;


--
-- Definition of table `shkprocessstateeventaudits`
--

DROP TABLE IF EXISTS `shkprocessstateeventaudits`;
CREATE TABLE `shkprocessstateeventaudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessstateeventaudits`
--

/*!40000 ALTER TABLE `shkprocessstateeventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkprocessstateeventaudits` ENABLE KEYS */;


--
-- Definition of table `shkprocessstates`
--

DROP TABLE IF EXISTS `shkprocessstates`;
CREATE TABLE `shkprocessstates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkprocessstates`
--

/*!40000 ALTER TABLE `shkprocessstates` DISABLE KEYS */;
INSERT INTO `shkprocessstates` (`KeyValue`,`Name`,`oid`,`version`) VALUES 
 ('open.running','open.running','1000000',0),
 ('open.not_running.not_started','open.not_running.not_started','1000002',0),
 ('open.not_running.suspended','open.not_running.suspended','1000004',0),
 ('closed.completed','closed.completed','1000006',0),
 ('closed.terminated','closed.terminated','1000008',0),
 ('closed.aborted','closed.aborted','1000010',0);
/*!40000 ALTER TABLE `shkprocessstates` ENABLE KEYS */;


--
-- Definition of table `shkproclevelparticipant`
--

DROP TABLE IF EXISTS `shkproclevelparticipant`;
CREATE TABLE `shkproclevelparticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelParticipant` (`PARTICIPANT_ID`,`PROCESSOID`),
  KEY `SHKProcLevelParticipant_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelParticipant_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `shkxpdlparticipantprocess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelparticipant`
--

/*!40000 ALTER TABLE `shkproclevelparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelparticipant` ENABLE KEYS */;


--
-- Definition of table `shkproclevelxpdlapp`
--

DROP TABLE IF EXISTS `shkproclevelxpdlapp`;
CREATE TABLE `shkproclevelxpdlapp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLApp` (`APPLICATION_ID`,`PROCESSOID`),
  KEY `SHKProcLevelXPDLApp_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelXPDLApp_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `shkxpdlapplicationprocess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelxpdlapp`
--

/*!40000 ALTER TABLE `shkproclevelxpdlapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelxpdlapp` ENABLE KEYS */;


--
-- Definition of table `shkproclevelxpdlapptaappdetail`
--

DROP TABLE IF EXISTS `shkproclevelxpdlapptaappdetail`;
CREATE TABLE `shkproclevelxpdlapptaappdetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappdetail` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkproclevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelxpdlapptaappdetail`
--

/*!40000 ALTER TABLE `shkproclevelxpdlapptaappdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelxpdlapptaappdetail` ENABLE KEYS */;


--
-- Definition of table `shkproclevelxpdlapptaappdetusr`
--

DROP TABLE IF EXISTS `shkproclevelxpdlapptaappdetusr`;
CREATE TABLE `shkproclevelxpdlapptaappdetusr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappdetailuser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkproclevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelxpdlapptaappdetusr`
--

/*!40000 ALTER TABLE `shkproclevelxpdlapptaappdetusr` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelxpdlapptaappdetusr` ENABLE KEYS */;


--
-- Definition of table `shkproclevelxpdlapptaappuser`
--

DROP TABLE IF EXISTS `shkproclevelxpdlapptaappuser`;
CREATE TABLE `shkproclevelxpdlapptaappuser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentappuser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkproclevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelxpdlapptaappuser`
--

/*!40000 ALTER TABLE `shkproclevelxpdlapptaappuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelxpdlapptaappuser` ENABLE KEYS */;


--
-- Definition of table `shkproclevelxpdlapptoolagntapp`
--

DROP TABLE IF EXISTS `shkproclevelxpdlapptoolagntapp`;
CREATE TABLE `shkproclevelxpdlapptoolagntapp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `shktoolagentapp` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `shkproclevelxpdlapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkproclevelxpdlapptoolagntapp`
--

/*!40000 ALTER TABLE `shkproclevelxpdlapptoolagntapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkproclevelxpdlapptoolagntapp` ENABLE KEYS */;


--
-- Definition of table `shkresourcestable`
--

DROP TABLE IF EXISTS `shkresourcestable`;
CREATE TABLE `shkresourcestable` (
  `Username` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKResourcesTable` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkresourcestable`
--

/*!40000 ALTER TABLE `shkresourcestable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkresourcestable` ENABLE KEYS */;


--
-- Definition of table `shkstateeventaudits`
--

DROP TABLE IF EXISTS `shkstateeventaudits`;
CREATE TABLE `shkstateeventaudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldProcessState` decimal(19,0) DEFAULT NULL,
  `NewProcessState` decimal(19,0) DEFAULT NULL,
  `OldActivityState` decimal(19,0) DEFAULT NULL,
  `NewActivityState` decimal(19,0) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKStateEventAudits` (`CNT`),
  KEY `SHKStateEventAudits_TheType` (`TheType`),
  KEY `SHKStateEventAudits_OldProcessState` (`OldProcessState`),
  KEY `SHKStateEventAudits_NewProcessState` (`NewProcessState`),
  KEY `SHKStateEventAudits_OldActivityState` (`OldActivityState`),
  KEY `SHKStateEventAudits_NewActivityState` (`NewActivityState`),
  CONSTRAINT `SHKStateEventAudits_NewActivityState` FOREIGN KEY (`NewActivityState`) REFERENCES `shkactivitystateeventaudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_NewProcessState` FOREIGN KEY (`NewProcessState`) REFERENCES `shkprocessstateeventaudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldActivityState` FOREIGN KEY (`OldActivityState`) REFERENCES `shkactivitystateeventaudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldProcessState` FOREIGN KEY (`OldProcessState`) REFERENCES `shkprocessstateeventaudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `shkeventtypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkstateeventaudits`
--

/*!40000 ALTER TABLE `shkstateeventaudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkstateeventaudits` ENABLE KEYS */;


--
-- Definition of table `shktoolagentapp`
--

DROP TABLE IF EXISTS `shktoolagentapp`;
CREATE TABLE `shktoolagentapp` (
  `TOOL_AGENT_NAME` varchar(250) NOT NULL,
  `APP_NAME` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentApp` (`TOOL_AGENT_NAME`,`APP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shktoolagentapp`
--

/*!40000 ALTER TABLE `shktoolagentapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shktoolagentapp` ENABLE KEYS */;


--
-- Definition of table `shktoolagentappdetail`
--

DROP TABLE IF EXISTS `shktoolagentappdetail`;
CREATE TABLE `shktoolagentappdetail` (
  `APP_MODE` decimal(10,0) NOT NULL,
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetail` (`APP_MODE`,`TOOLAGENT_APPOID`),
  KEY `SHKToolAgentAppDetail_TOOLAGENT_APPOID` (`TOOLAGENT_APPOID`),
  CONSTRAINT `SHKToolAgentAppDetail_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `shktoolagentapp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shktoolagentappdetail`
--

/*!40000 ALTER TABLE `shktoolagentappdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `shktoolagentappdetail` ENABLE KEYS */;


--
-- Definition of table `shktoolagentappdetailuser`
--

DROP TABLE IF EXISTS `shktoolagentappdetailuser`;
CREATE TABLE `shktoolagentappdetailuser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetailUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppDetailUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppDetailUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `shktoolagentappdetail` (`oid`),
  CONSTRAINT `SHKToolAgentAppDetailUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shktoolagentuser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shktoolagentappdetailuser`
--

/*!40000 ALTER TABLE `shktoolagentappdetailuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shktoolagentappdetailuser` ENABLE KEYS */;


--
-- Definition of table `shktoolagentappuser`
--

DROP TABLE IF EXISTS `shktoolagentappuser`;
CREATE TABLE `shktoolagentappuser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `shktoolagentapp` (`oid`),
  CONSTRAINT `SHKToolAgentAppUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shktoolagentuser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shktoolagentappuser`
--

/*!40000 ALTER TABLE `shktoolagentappuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shktoolagentappuser` ENABLE KEYS */;


--
-- Definition of table `shktoolagentuser`
--

DROP TABLE IF EXISTS `shktoolagentuser`;
CREATE TABLE `shktoolagentuser` (
  `USERNAME` varchar(100) NOT NULL,
  `PWD` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shktoolagentuser`
--

/*!40000 ALTER TABLE `shktoolagentuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shktoolagentuser` ENABLE KEYS */;


--
-- Definition of table `shkusergrouptable`
--

DROP TABLE IF EXISTS `shkusergrouptable`;
CREATE TABLE `shkusergrouptable` (
  `userid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserGroupTable` (`userid`,`groupid`),
  KEY `SHKUserGroupTable_groupid` (`groupid`),
  CONSTRAINT `SHKUserGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `shkgrouptable` (`oid`),
  CONSTRAINT `SHKUserGroupTable_userid` FOREIGN KEY (`userid`) REFERENCES `shkusertable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkusergrouptable`
--

/*!40000 ALTER TABLE `shkusergrouptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkusergrouptable` ENABLE KEYS */;


--
-- Definition of table `shkuserpacklevelpart`
--

DROP TABLE IF EXISTS `shkuserpacklevelpart`;
CREATE TABLE `shkuserpacklevelpart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `shkpacklevelparticipant` (`oid`),
  CONSTRAINT `SHKUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shknormaluser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkuserpacklevelpart`
--

/*!40000 ALTER TABLE `shkuserpacklevelpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkuserpacklevelpart` ENABLE KEYS */;


--
-- Definition of table `shkuserproclevelparticipant`
--

DROP TABLE IF EXISTS `shkuserproclevelparticipant`;
CREATE TABLE `shkuserproclevelparticipant` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserProcLevelParticipant` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserProcLevelParticipant_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserProcLevelParticipant_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `shkproclevelparticipant` (`oid`),
  CONSTRAINT `SHKUserProcLevelParticipant_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `shknormaluser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkuserproclevelparticipant`
--

/*!40000 ALTER TABLE `shkuserproclevelparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkuserproclevelparticipant` ENABLE KEYS */;


--
-- Definition of table `shkusertable`
--

DROP TABLE IF EXISTS `shkusertable`;
CREATE TABLE `shkusertable` (
  `userid` varchar(100) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserTable` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkusertable`
--

/*!40000 ALTER TABLE `shkusertable` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkusertable` ENABLE KEYS */;


--
-- Definition of table `shkxpdlapplicationpackage`
--

DROP TABLE IF EXISTS `shkxpdlapplicationpackage`;
CREATE TABLE `shkxpdlapplicationpackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlapplicationpackage`
--

/*!40000 ALTER TABLE `shkxpdlapplicationpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlapplicationpackage` ENABLE KEYS */;


--
-- Definition of table `shkxpdlapplicationprocess`
--

DROP TABLE IF EXISTS `shkxpdlapplicationprocess`;
CREATE TABLE `shkxpdlapplicationprocess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLApplicationProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLApplicationProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `shkxpdlapplicationpackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlapplicationprocess`
--

/*!40000 ALTER TABLE `shkxpdlapplicationprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlapplicationprocess` ENABLE KEYS */;


--
-- Definition of table `shkxpdldata`
--

DROP TABLE IF EXISTS `shkxpdldata`;
CREATE TABLE `shkxpdldata` (
  `XPDLContent` longblob,
  `XPDLClassContent` longblob,
  `XPDL` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLData` (`CNT`),
  UNIQUE KEY `I2_SHKXPDLData` (`XPDL`),
  CONSTRAINT `SHKXPDLData_XPDL` FOREIGN KEY (`XPDL`) REFERENCES `shkxpdls` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdldata`
--

/*!40000 ALTER TABLE `shkxpdldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdldata` ENABLE KEYS */;


--
-- Definition of table `shkxpdlhistory`
--

DROP TABLE IF EXISTS `shkxpdlhistory`;
CREATE TABLE `shkxpdlhistory` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `XPDLHistoryUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistory` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlhistory`
--

/*!40000 ALTER TABLE `shkxpdlhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlhistory` ENABLE KEYS */;


--
-- Definition of table `shkxpdlhistorydata`
--

DROP TABLE IF EXISTS `shkxpdlhistorydata`;
CREATE TABLE `shkxpdlhistorydata` (
  `XPDLContent` mediumblob NOT NULL,
  `XPDLClassContent` mediumblob NOT NULL,
  `XPDLHistory` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistoryData` (`CNT`),
  KEY `SHKXPDLHistoryData_XPDLHistory` (`XPDLHistory`),
  CONSTRAINT `SHKXPDLHistoryData_XPDLHistory` FOREIGN KEY (`XPDLHistory`) REFERENCES `shkxpdlhistory` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlhistorydata`
--

/*!40000 ALTER TABLE `shkxpdlhistorydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlhistorydata` ENABLE KEYS */;


--
-- Definition of table `shkxpdlparticipantpackage`
--

DROP TABLE IF EXISTS `shkxpdlparticipantpackage`;
CREATE TABLE `shkxpdlparticipantpackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlparticipantpackage`
--

/*!40000 ALTER TABLE `shkxpdlparticipantpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlparticipantpackage` ENABLE KEYS */;


--
-- Definition of table `shkxpdlparticipantprocess`
--

DROP TABLE IF EXISTS `shkxpdlparticipantprocess`;
CREATE TABLE `shkxpdlparticipantprocess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLParticipantProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLParticipantProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `shkxpdlparticipantpackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlparticipantprocess`
--

/*!40000 ALTER TABLE `shkxpdlparticipantprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlparticipantprocess` ENABLE KEYS */;


--
-- Definition of table `shkxpdlreferences`
--

DROP TABLE IF EXISTS `shkxpdlreferences`;
CREATE TABLE `shkxpdlreferences` (
  `ReferredXPDLId` varchar(90) NOT NULL,
  `ReferringXPDL` decimal(19,0) NOT NULL,
  `ReferredXPDLNumber` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLReferences` (`ReferredXPDLId`,`ReferringXPDL`),
  KEY `SHKXPDLReferences_ReferringXPDL` (`ReferringXPDL`),
  CONSTRAINT `SHKXPDLReferences_ReferringXPDL` FOREIGN KEY (`ReferringXPDL`) REFERENCES `shkxpdls` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdlreferences`
--

/*!40000 ALTER TABLE `shkxpdlreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdlreferences` ENABLE KEYS */;


--
-- Definition of table `shkxpdls`
--

DROP TABLE IF EXISTS `shkxpdls`;
CREATE TABLE `shkxpdls` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLS` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shkxpdls`
--

/*!40000 ALTER TABLE `shkxpdls` DISABLE KEYS */;
/*!40000 ALTER TABLE `shkxpdls` ENABLE KEYS */;


--
-- Definition of table `wf_audit_trail`
--

DROP TABLE IF EXISTS `wf_audit_trail`;
CREATE TABLE `wf_audit_trail` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `message` text,
  `timestamp` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_audit_trail`
--

/*!40000 ALTER TABLE `wf_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_audit_trail` ENABLE KEYS */;


--
-- Definition of table `wf_process_link`
--

DROP TABLE IF EXISTS `wf_process_link`;
CREATE TABLE `wf_process_link` (
  `processId` varchar(255) NOT NULL,
  `parentProcessId` varchar(255) DEFAULT NULL,
  `originProcessId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_link`
--

/*!40000 ALTER TABLE `wf_process_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_link` ENABLE KEYS */;


--
-- Definition of table `wf_report`
--

DROP TABLE IF EXISTS `wf_report`;
CREATE TABLE `wf_report` (
  `activityInstanceId` varchar(255) NOT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `dateLimit` bigint(20) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `timeConsumingFromDateCreated` bigint(20) DEFAULT NULL,
  `timeConsumingFromDateStarted` bigint(20) DEFAULT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityInstanceId`),
  KEY `FKB943CCA47A4E8F48` (`packageId`),
  KEY `FKB943CCA4A39D6461` (`processDefId`),
  KEY `FKB943CCA4CB863F` (`activityDefId`),
  CONSTRAINT `FKB943CCA47A4E8F48` FOREIGN KEY (`packageId`) REFERENCES `wf_report_package` (`packageId`),
  CONSTRAINT `FKB943CCA4A39D6461` FOREIGN KEY (`processDefId`) REFERENCES `wf_report_process` (`processDefId`),
  CONSTRAINT `FKB943CCA4CB863F` FOREIGN KEY (`activityDefId`) REFERENCES `wf_report_activity` (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_report`
--

/*!40000 ALTER TABLE `wf_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report` ENABLE KEYS */;


--
-- Definition of table `wf_report_activity`
--

DROP TABLE IF EXISTS `wf_report_activity`;
CREATE TABLE `wf_report_activity` (
  `activityDefId` varchar(255) NOT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_report_activity`
--

/*!40000 ALTER TABLE `wf_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_activity` ENABLE KEYS */;


--
-- Definition of table `wf_report_package`
--

DROP TABLE IF EXISTS `wf_report_package`;
CREATE TABLE `wf_report_package` (
  `packageId` varchar(255) NOT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_report_package`
--

/*!40000 ALTER TABLE `wf_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_package` ENABLE KEYS */;


--
-- Definition of table `wf_report_process`
--

DROP TABLE IF EXISTS `wf_report_process`;
CREATE TABLE `wf_report_process` (
  `processDefId` varchar(255) NOT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_report_process`
--

/*!40000 ALTER TABLE `wf_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_process` ENABLE KEYS */;


--
-- Definition of table `wf_resource_bundle_message`
--

DROP TABLE IF EXISTS `wf_resource_bundle_message`;
CREATE TABLE `wf_resource_bundle_message` (
  `id` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_resource_bundle_message`
--

/*!40000 ALTER TABLE `wf_resource_bundle_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_resource_bundle_message` ENABLE KEYS */;


--
-- Definition of table `wf_setup`
--

DROP TABLE IF EXISTS `wf_setup`;
CREATE TABLE `wf_setup` (
  `id` varchar(255) NOT NULL,
  `property` varchar(255) DEFAULT NULL,
  `value` text,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_setup`
--

/*!40000 ALTER TABLE `wf_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_setup` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
