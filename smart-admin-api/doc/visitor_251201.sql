-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: visitor
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `e_community`
--

DROP TABLE IF EXISTS `e_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `e_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_community`
--

LOCK TABLES `e_community` WRITE;
/*!40000 ALTER TABLE `e_community` DISABLE KEYS */;
INSERT INTO `e_community` VALUES (1,'金樱社区','','2021-06-03 07:23:49','2021-07-05 06:42:04'),(2,'明星社区','','2021-06-03 07:30:03','2021-06-06 09:37:07'),(3,'联尚社区',NULL,'2021-06-06 09:37:14','2021-06-06 09:37:14'),(4,'环湖社区',NULL,'2021-06-06 09:37:22','2021-06-06 09:37:22');
/*!40000 ALTER TABLE `e_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_plot`
--

DROP TABLE IF EXISTS `e_plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `e_plot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL COMMENT '社区id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_plot`
--

LOCK TABLES `e_plot` WRITE;
/*!40000 ALTER TABLE `e_plot` DISABLE KEYS */;
INSERT INTO `e_plot` VALUES (1,1,'金悦府','','2021-06-03 07:47:56','2021-06-06 09:37:56'),(2,1,'菩提苑','','2021-06-03 08:59:56','2021-06-06 09:38:02'),(3,1,'福志友缘',NULL,'2021-06-06 09:38:09','2021-06-06 09:38:09'),(4,2,'联投龙湾1期',NULL,'2021-06-06 09:38:21','2021-06-06 09:38:21'),(5,2,'联投龙湾2期',NULL,'2021-06-06 09:38:30','2021-06-06 09:38:30'),(6,3,'联投龙湾3期',NULL,'2021-06-06 09:38:40','2021-06-06 09:38:40'),(7,4,'汤逊湖壹号',NULL,'2021-06-06 09:38:51','2021-06-06 09:38:51');
/*!40000 ALTER TABLE `e_plot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_student`
--

DROP TABLE IF EXISTS `e_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `e_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` int(11) NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '民族',
  `koseki` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '户籍所在地详细地址',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实际居住地详细地址（包含门栋号）',
  `plotId` int(11) NOT NULL COMMENT '小区',
  `relation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '与新生的关系',
  `household_head` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房产证户主姓名',
  `premises_permit_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房产证号',
  `kindergarten` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '幼儿园',
  `id_card` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `feature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '新生特点',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `name_father` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名 -----父亲',
  `work_unit_father` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作单位-----父亲',
  `work_address_father` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作单位详细地址-----父亲',
  `work_telephone_father` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位电话-----父亲',
  `home_phone_father` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话-----父亲',
  `phone_father` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机-----父亲',
  `name_mather` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名 -----母亲',
  `work_unit_mather` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作单位 -----母亲',
  `work_address_mather` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作单位详细地址 -----母亲',
  `work_telephone_mather` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位电话 -----母亲',
  `home_phone_mather` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话 -----母亲',
  `phone_mather` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机 -----母亲',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_student`
--

LOCK TABLES `e_student` WRITE;
/*!40000 ALTER TABLE `e_student` DISABLE KEYS */;
INSERT INTO `e_student` VALUES (1,'测试姓名',1,'2021-06-07','汉族','户籍所在行动','123213',4,'211','王五','','','121131232132132132','','','121','13','2','','','13454446443','','','','','','','2021-06-07 16:00:09','2021-06-07 16:00:09'),(2,'1',1,'2021-06-07','汉族','11','11',5,'11','11','','','121212121212121212','','','','','','','','11','','','','','','','2021-06-07 17:09:19','2021-06-07 17:09:19'),(3,'测试qqqqqq',1,'2021-06-07','11','11','11',4,'11','11','','','123123123123213213','','','','','','','','11','','','','','','','2021-06-07 17:10:30','2021-06-07 17:10:33'),(18,'11',1,'2021-01-18','啊1','11','11',4,'11','11','','','111111111111111111','','','','','1','','','111111111','','','','','','','2021-06-11 11:43:42','2021-06-17 10:52:41'),(19,'11',1,'1998-01-19','han','11','11',7,'11','11','','','342530199801193519','','','','','','','','1111','','','','','','','2021-06-17 10:15:13','2021-06-17 10:15:13');
/*!40000 ALTER TABLE `e_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('devClusteredScheduler','TRIGGER_23','DEFAULT','*/5 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('devClusteredScheduler','TASK_23','DEFAULT',NULL,'net.lab1024.smartadmin.module.support.quartz.service.QuartzTask','0','0','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PARAMSt\03x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('devClusteredScheduler','STATE_ACCESS'),('devClusteredScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('devClusteredScheduler','User-2025YFLRKM1764565676885',1764565683586,60000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('devClusteredScheduler','TRIGGER_23','DEFAULT','TASK_23','DEFAULT',NULL,1612863360000,1612863355000,5,'PAUSED','CRON',1612863352000,0,NULL,2,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门简称',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '部门的父级id//无需',
  `sort` int(11) DEFAULT NULL COMMENT '部门排序//无需',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门编号',
  `eng_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门英文名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (22,'长病假退养人员',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','20',NULL),(23,'经济教研室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','15',NULL),(24,'基础教研室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','14',NULL),(25,'工程教研室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','16',NULL),(26,'技训科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','13',NULL),(27,'培训科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','12',NULL),(28,'在职培训管理科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','11',NULL),(29,'综合管理科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','10',NULL),(30,'实训科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','09',NULL),(31,'信息科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','08',NULL),(32,'学生科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','07',NULL),(33,'教务科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','06',NULL),(34,'教育研究室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','05',NULL),(35,'办公室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','01',NULL),(36,'校长室',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','00',NULL),(37,'总务科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','04',NULL),(38,'财务科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','03',NULL),(39,'组织人事科',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','02',NULL),(40,'团委',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','17',NULL),(121,'工会',NULL,NULL,NULL,NULL,'2021-08-17 18:27:11','2021-08-17 18:27:11','19',NULL);
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_email`
--

DROP TABLE IF EXISTS `t_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `to_emails` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1已发送',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_email`
--

LOCK TABLES `t_email` WRITE;
/*!40000 ALTER TABLE `t_email` DISABLE KEYS */;
INSERT INTO `t_email` VALUES (20,'新增测试12345','新增测试@11.com',1,'<p>这是内容</p>','2019-08-30 15:35:12','2019-08-30 15:35:12'),(21,'b','asdf@33.com',1,'<p>c</p>','2019-09-06 14:25:33','2019-09-06 14:25:33'),(23,'string','string',0,'string','2019-09-06 06:55:01','2019-09-06 06:55:01'),(24,'string','string',0,'string','2019-09-06 06:55:01','2019-09-06 06:55:01'),(26,'string','string',0,'string','2019-09-06 07:01:32','2019-09-06 07:01:32'),(27,'string','string',0,'string','2019-09-06 07:01:32','2019-09-06 07:01:32'),(37,'ewqwe','适者生存@22.cc',1,'<p>qweqwe</p>','2019-11-09 10:00:46','2019-11-09 10:00:46'),(38,'ewqwe','适者生存@22.cc',1,'<p>qweqwe</p>','2019-11-09 10:00:49','2019-11-09 10:00:49'),(39,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:54','2019-11-09 10:04:54'),(40,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:57','2019-11-09 10:04:57'),(41,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:57','2019-11-09 10:04:57'),(42,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:58','2019-11-09 10:04:58'),(43,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:59','2019-11-09 10:04:59'),(44,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:04:59','2019-11-09 10:04:59'),(45,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:05:16','2019-11-09 10:05:16'),(46,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:06:29','2019-11-09 10:06:29'),(47,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:07:02','2019-11-09 10:07:02'),(48,'dsfds','dsfsd@qq.ccc',1,'<p>fsdfs</p>','2019-11-09 10:07:16','2019-11-09 10:07:16'),(49,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:08:13','2019-11-09 10:08:13'),(50,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:08:30','2019-11-09 10:08:30'),(51,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:08:50','2019-11-09 10:08:50'),(52,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:09:09','2019-11-09 10:09:09'),(53,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:09:31','2019-11-09 10:09:31'),(54,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:12:24','2019-11-09 10:12:24'),(55,'2342','11@ss.cc',1,'<p>234234</p>','2019-11-09 10:13:13','2019-11-09 10:13:13'),(56,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:20:42','2019-11-09 10:20:42'),(57,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:20:52','2019-11-09 10:20:52'),(58,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:21:16','2019-11-09 10:21:16'),(59,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:21:24','2019-11-09 10:21:24'),(60,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:21:30','2019-11-09 10:21:30'),(61,'asdasd','3423@aqq.cc',0,'<p>asdasd</p>','2019-11-09 10:21:53','2019-11-09 10:21:53'),(62,'a21312','23423@qq.cc',0,'<p>asdasdas</p>','2019-11-09 10:23:40','2019-11-09 10:23:40'),(63,'11','1234@qq.com',0,'<p>23</p>','2019-11-15 15:35:12','2019-11-15 15:35:12'),(64,'11','1234@qq.com',0,'<p>23</p>','2019-11-15 15:35:15','2019-11-15 15:35:15'),(65,'11','1234@qq.com',0,'<p>23</p>','2019-11-15 15:35:16','2019-11-15 15:35:16'),(66,'eeee','1234@qq.com',0,'<p>&nbsp; &nbsp; eee2233<br></p>','2019-11-15 17:00:00','2019-11-15 17:00:00'),(67,'eeee','1234@qq.com',0,'<p>&nbsp; &nbsp; eee2233<br></p>','2019-11-15 17:00:03','2019-11-15 17:00:03'),(68,'eeee','1234@qq.com',0,'<p>&nbsp; &nbsp; eee2233<br></p>','2019-11-15 17:00:04','2019-11-15 17:00:04'),(69,'22223','1017146812@qq.com',0,'<p>&nbsp; &nbsp; e34233<br></p>','2019-11-15 17:00:33','2019-11-15 17:00:33'),(70,'22223','1017146812@qq.com',0,'<p>&nbsp; &nbsp; e34233<br></p>','2019-11-15 17:00:34','2019-11-15 17:00:34'),(71,'22223','1017146812@qq.com',0,'<p>&nbsp; &nbsp; e34233<br></p>','2019-11-15 17:00:34','2019-11-15 17:00:34'),(72,'22223','12232',0,'<p>&nbsp; &nbsp; e34233<br></p>','2019-11-15 17:00:49','2019-11-15 17:00:49'),(73,'22223','12232@qq.com',0,'<p>&nbsp; &nbsp; e34233<br></p>','2019-11-15 17:00:56','2019-11-15 17:00:56'),(74,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 08:51:44','2019-11-16 08:51:44'),(75,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:05:10','2019-11-16 09:05:10'),(76,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:05:14','2019-11-16 09:05:14'),(77,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:06:34','2019-11-16 09:06:34'),(78,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:07:09','2019-11-16 09:07:09'),(79,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:07:30','2019-11-16 09:07:30'),(80,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:07:32','2019-11-16 09:07:32'),(81,'dsasdasd','asdas@qq.com',0,'<p>asdasd</p>','2019-11-16 09:08:29','2019-11-16 09:08:29'),(82,'sdfs','ss@ss.cc',0,'<p>dsdsf</p>','2019-11-16 09:08:46','2019-11-16 09:08:46'),(83,'asdasd','asd@qq.vv',0,'<p>asdas</p>','2019-11-16 09:09:18','2019-11-16 09:09:18'),(84,'asdasd','asd@qq.vv',0,'<p>asdas</p>','2019-11-16 09:09:42','2019-11-16 09:09:42'),(85,'asdasd','asd@qq.vv',0,'<p>asdas</p>','2019-11-16 09:09:46','2019-11-16 09:09:46'),(86,'dasdad','dasda@ss.cc',1,'<p>dasasdas</p>','2019-11-16 09:10:05','2019-11-16 09:10:05'),(87,'121','',0,'<p><span style=\"font-style: italic; text-decoration-line: underline;\">eqwewqeqw</span><span style=\"text-decoration-line: line-through;\"></span><br></p>','2021-02-09 14:46:28','2021-02-09 14:46:28'),(88,'123','13675584544@163.com',0,'<p>123</p>','2021-07-05 14:45:21','2021-07-05 14:45:21');
/*!40000 ALTER TABLE `t_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_employee`
--

DROP TABLE IF EXISTS `t_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `department_id` int(10) unsigned DEFAULT NULL COMMENT '部门id',
  `is_leave` int(11) NOT NULL DEFAULT '0' COMMENT '是否离职1是',
  `is_disabled` int(11) NOT NULL DEFAULT '0' COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_user` int(10) unsigned NOT NULL COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除0否 1是',
  `identity` int(11) DEFAULT NULL COMMENT '身份 1学生 2老师',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'openid',
  `sort` int(3) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1576 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_employee`
--

LOCK TABLES `t_employee` WRITE;
/*!40000 ALTER TABLE `t_employee` DISABLE KEYS */;
INSERT INTO `t_employee` VALUES (1,'admin','c655798e4648c540812a1b8f48759af7','admin','13812345678','13812345678','123456123456781234','1992-02-02',NULL,36,0,0,NULL,0,'2025-11-27 15:48:59','2018-05-11 09:38:54',0,2,'1',0);
/*!40000 ALTER TABLE `t_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file`
--

DROP TABLE IF EXISTS `t_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务id',
  `module_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务类型',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型，程序中枚举控制，文件类型：如身份证正面，三证合一等等',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件key，用于文件下载',
  `file_location_type` int(11) NOT NULL COMMENT '文件位置类型',
  `creater_user` int(11) NOT NULL COMMENT '创建人，即上传人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `module_id_module_type` (`module_id`,`module_type`) USING BTREE,
  KEY `module_type` (`module_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file`
--

LOCK TABLES `t_file` WRITE;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` VALUES (1,'1','1','阿里云1.jpg',NULL,NULL,'backUser/config/d1788b717be24f14ba526f25397b936f',2,1,NULL,'2019-07-05 10:38:15'),(2,'2','1','1.jpg',NULL,NULL,'backUser/config/8895ec770c4e4e558c6d9b54eb00dffc',2,1,'2019-07-18 09:20:59','2019-07-18 09:20:25'),(3,'3','1','随笔.txt',NULL,NULL,'backUser/config/f5cbc4c9a56f4fa7ad0ba58b0aa5d169',2,1,NULL,'2019-07-18 09:22:47'),(4,'3','1','1.jpg',NULL,NULL,'backUser/config/2019071809245603e0a4e449a4bf3aa28ee731c309040.jpg',1,1,NULL,'2019-07-18 09:24:51'),(6,'4','1','1.jpg',NULL,NULL,'backUser/config/ddcb8214ba274dec9bb2c33e0e246391',3,1,NULL,'2019-07-19 16:19:43'),(7,'5','1','sql.txt',NULL,NULL,'backUser/config/cfbdf9562c894405b5b6f64f71fa812a',3,1,NULL,'2019-07-19 17:41:55'),(9,'1','1','20190912023241a6132f5713b54e1fb490f4ea88115747.md',NULL,NULL,'backUser/config/20190912023241a6132f5713b54e1fb490f4ea88115747.md',1,1,'2019-09-12 15:25:35','2019-09-12 14:32:42'),(10,'1','1','201909120232499804998573f643ff8e58189d23485629.mjs',NULL,NULL,'backUser/config/201909120232499804998573f643ff8e58189d23485629.mjs',1,1,'2019-09-12 15:25:19','2019-09-12 14:32:50'),(11,'1','1','201909120326564cdc8df7b8cc49cfb273926877f047f5.json',NULL,NULL,'backUser/config/201909120326564cdc8df7b8cc49cfb273926877f047f5.json',1,1,NULL,'2019-09-12 15:26:56'),(12,'1','1','201909120343357104b7f1cc684f5797ada35c06aba770.json',NULL,NULL,'backUser/config/201909120343357104b7f1cc684f5797ada35c06aba770.json',1,1,NULL,'2019-09-12 15:43:36'),(13,'1','1','201909120343427e408141a0ea467ea2e012f7086a6265.json',NULL,NULL,'backUser/config/201909120343427e408141a0ea467ea2e012f7086a6265.json',1,1,NULL,'2019-09-12 15:43:42'),(14,'1','1','20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts',NULL,NULL,'backUser/config/20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts',1,1,NULL,'2019-09-12 15:45:43'),(15,'1','1','20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md',NULL,NULL,'backUser/config/20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md',1,1,NULL,'2019-09-12 15:45:51'),(16,'1','1','LICENCE',NULL,NULL,'backUser/config/cc02b99c0ec548f1a2231b70b7d569b8',2,1,NULL,'2019-09-12 15:47:22'),(17,'1','1','bignumber.min.js',NULL,NULL,'backUser/config/bda49e8ad6d242fe8735b2023dfbf125',2,1,NULL,'2019-09-12 15:47:29'),(18,'1','1','20190912034880a881fa8fbc841bfb7194ff312bd1058.json',NULL,NULL,'backUser/config/20190912034880a881fa8fbc841bfb7194ff312bd1058.json',1,1,NULL,'2019-09-12 15:48:08'),(19,'1','1','20190912034816ece14084acf345a79396a0f4347c4e44.md',NULL,NULL,'backUser/config/20190912034816ece14084acf345a79396a0f4347c4e44.md',1,1,NULL,'2019-09-12 15:48:16'),(20,'1','1','20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg',NULL,NULL,'backUser/config/20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg',1,1,NULL,'2019-10-24 17:44:13'),(21,'1','1','20191106042073f7ef01bde3046bd8e01928f397230bd.jpg',NULL,NULL,'backUser/config/20191106042073f7ef01bde3046bd8e01928f397230bd.jpg',1,1,NULL,'2019-11-06 02:20:13'),(22,'1','1','201911130802024b8a2ebf80543a98241bb464682650d.jpg',NULL,NULL,'backUser/config/201911130802024b8a2ebf80543a98241bb464682650d.jpg',1,1,NULL,'2019-11-13 06:02:01'),(23,'1','1','20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg',NULL,NULL,'backUser/config/20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg',1,1,NULL,'2019-11-13 06:02:14'),(24,'1','1','20191115043844e92b25e70fb140a1885614b978469ca9.jpg',NULL,NULL,'backUser/config/20191115043844e92b25e70fb140a1885614b978469ca9.jpg',1,38,NULL,'2019-11-15 02:38:45'),(25,'1','1','20191116060546d3a2c703cb5546b3851612907cc3786f.png',NULL,NULL,'backUser/config/20191116060546d3a2c703cb5546b3851612907cc3786f.png',1,1,NULL,'2019-11-16 10:05:47'),(26,'1','1','20210813033123e0f276b5d33f49f2825bdee6716ed999.jpg',NULL,NULL,'backUser/config/20210813033123e0f276b5d33f49f2825bdee6716ed999.jpg',1,822,NULL,'2021-08-13 15:31:24'),(27,'1','1','202108130331511bd4c8a371d84f669ded01f18efb7159.jpg',NULL,NULL,'backUser/config/202108130331511bd4c8a371d84f669ded01f18efb7159.jpg',1,822,NULL,'2021-08-13 15:31:51');
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_heart_beat_record`
--

DROP TABLE IF EXISTS `t_heart_beat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_heart_beat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `server_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务器ip',
  `process_no` int(11) DEFAULT NULL COMMENT '进程号',
  `process_start_time` datetime DEFAULT NULL COMMENT '进程开启时间',
  `heart_beat_time` datetime DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_heart_beat_record`
--

LOCK TABLES `t_heart_beat_record` WRITE;
/*!40000 ALTER TABLE `t_heart_beat_record` DISABLE KEYS */;
INSERT INTO `t_heart_beat_record` VALUES (1,'/home/server/smart-admin/dev','192.168.122.1;172.16.0.145',14843,'2019-11-16 03:11:50','2019-11-16 03:58:01'),(2,'F:\\codespace\\idea\\gangquan360\\foundation','172.16.1.188;192.168.56.1',227992,'2019-11-16 10:02:39','2019-11-16 10:06:50'),(3,'E:\\codespace\\zhuoda','192.168.8.188',17564,'2020-12-14 07:11:12','2020-12-14 07:13:34'),(4,'E:\\codespace\\zhuoda','192.168.8.188',15568,'2020-12-14 07:13:53','2020-12-14 07:15:00'),(5,'E:\\codespace\\zhuoda','192.168.8.188',16548,'2020-12-14 07:16:07','2020-12-14 07:17:14'),(6,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',23436,'2021-02-09 06:32:43','2021-02-09 06:33:50'),(7,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',23192,'2021-02-09 06:34:42','2021-02-09 08:10:51'),(8,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',4804,'2021-02-09 08:12:38','2021-02-09 08:49:18'),(9,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',8360,'2021-02-09 09:31:24','2021-02-09 09:32:34'),(10,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',908,'2021-02-09 09:33:53','2021-02-09 09:45:01'),(11,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.206.1',20784,'2021-02-10 01:08:05','2021-02-10 04:04:18'),(12,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.78;192.168.89.1;192.168.31.175;192.168.206.1',11216,'2021-02-18 01:11:42','2021-02-18 02:47:56'),(13,'D:\\WORKSPACE\\IdeaProjects\\privateJob\\PortMonitor\\smart-admin-service','169.254.224.13;192.168.43.189;169.254.125.103',2232,'2021-04-10 11:46:51','2021-04-10 12:08:13'),(14,'D:\\WORKSPACE\\IdeaProjects\\other\\smart-admin\\smart-admin-service','192.168.0.19;192.168.89.1;192.168.206.1',14928,'2021-06-01 09:10:48','2021-06-01 09:22:04'),(15,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',6680,'2021-06-03 02:33:25','2021-06-03 03:24:36'),(16,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',12452,'2021-06-03 03:28:51','2021-06-03 03:49:59'),(17,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',18508,'2021-06-03 03:55:09','2021-06-03 03:56:17'),(18,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',17588,'2021-06-03 03:58:29','2021-06-03 05:38:59'),(19,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',20452,'2021-06-03 05:43:31','2021-06-03 06:09:40'),(20,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',18128,'2021-06-03 06:12:52','2021-06-03 07:18:59'),(21,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',22032,'2021-06-03 07:23:03','2021-06-03 07:44:13'),(22,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',3880,'2021-06-03 07:45:25','2021-06-03 08:21:34'),(23,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',7436,'2021-06-03 08:25:33','2021-06-03 08:26:41'),(24,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',20312,'2021-06-03 08:27:57','2021-06-03 08:29:05'),(25,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',10484,'2021-06-03 08:32:26','2021-06-03 08:43:35'),(26,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',4876,'2021-06-03 08:47:59','2021-06-03 09:14:07'),(27,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',15320,'2021-06-03 09:15:22','2021-06-03 09:41:30'),(28,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',1428,'2021-06-03 09:46:31','2021-06-03 09:57:40'),(29,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',7920,'2021-06-04 01:38:05','2021-06-04 02:09:17'),(30,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',20140,'2021-06-04 02:11:59','2021-06-04 02:13:07'),(31,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',21072,'2021-06-04 02:17:02','2021-06-04 02:18:11'),(32,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',9248,'2021-06-04 02:23:29','2021-06-04 02:29:38'),(33,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',2024,'2021-06-04 02:35:07','2021-06-04 03:01:15'),(34,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',9580,'2021-06-04 08:31:29','2021-06-04 10:02:39'),(35,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',12016,'2021-06-06 06:21:54','2021-06-06 06:53:03'),(36,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',9768,'2021-06-06 06:55:04','2021-06-06 07:06:13'),(37,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',2464,'2021-06-06 07:11:14','2021-06-06 09:32:22'),(38,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',11936,'2021-06-06 09:34:53','2021-06-06 09:51:02'),(39,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',22148,'2021-06-06 09:56:38','2021-06-06 10:07:46'),(40,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',15108,'2021-06-06 10:28:28','2021-06-06 10:29:39'),(41,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',8368,'2021-06-06 10:30:01','2021-06-06 11:30:46'),(42,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',5484,'2021-06-06 12:04:23','2021-06-06 12:05:31'),(43,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',8996,'2021-06-06 12:08:34','2021-06-06 12:09:41'),(44,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',16620,'2021-06-06 12:10:20','2021-06-06 12:11:28'),(45,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',9036,'2021-06-06 12:15:28','2021-06-06 12:16:36'),(46,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',21704,'2021-06-06 12:16:40','2021-06-06 12:17:48'),(47,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',13384,'2021-06-06 12:19:07','2021-06-06 12:20:15'),(48,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',23548,'2021-06-06 12:21:24','2021-06-06 12:22:31'),(49,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',10840,'2021-06-06 12:23:27','2021-06-06 12:24:35'),(50,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',21576,'2021-06-06 12:25:18','2021-06-06 12:26:26'),(51,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',23300,'2021-06-06 12:27:08','2021-06-06 12:38:17'),(52,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',21272,'2021-06-06 12:41:35','2021-06-06 12:52:42'),(53,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',16212,'2021-06-06 12:53:03','2021-06-06 12:59:13'),(54,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',9384,'2021-06-06 13:00:39','2021-06-06 13:06:48'),(55,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',18996,'2021-06-06 13:55:00','2021-06-06 15:31:09'),(56,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',13936,'2021-06-06 15:31:55','2021-06-06 15:33:11'),(57,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.89.1;192.168.43.189;192.168.206.1',1828,'2021-06-06 16:38:25','2021-06-06 17:09:34'),(58,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',8660,'2021-06-07 03:15:15','2021-06-07 06:35:15'),(59,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',18576,'2021-06-07 06:40:10','2021-06-07 07:11:19'),(60,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',17636,'2021-06-07 07:12:23','2021-06-07 07:48:31'),(61,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',18588,'2021-06-07 07:53:15','2021-06-07 07:54:23'),(62,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',3616,'2021-06-07 07:55:13','2021-06-07 07:56:21'),(63,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',20220,'2021-06-07 07:58:09','2021-06-07 07:59:18'),(64,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',12136,'2021-06-07 08:04:47','2021-06-07 08:05:56'),(65,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',880,'2021-06-07 08:06:18','2021-06-07 08:22:27'),(66,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;192.168.89.1;192.168.206.1',19844,'2021-06-07 09:04:09','2021-06-07 09:20:18'),(67,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;169.254.224.13;169.254.125.103',2912,'2021-06-11 03:42:48','2021-06-11 03:44:01'),(68,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;169.254.224.13;169.254.125.103',20388,'2021-06-17 02:11:51','2021-06-17 02:20:03'),(69,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;169.254.224.13;169.254.125.103',10236,'2021-06-17 10:23:27','2021-06-17 10:44:36'),(70,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;169.254.224.13;169.254.125.103',23192,'2021-06-17 02:47:42','2021-06-17 02:48:51'),(71,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.0.19;169.254.224.13;169.254.125.103',12520,'2021-06-17 02:50:42','2021-06-17 02:56:51'),(72,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.51',5988,'2021-07-05 11:44:12','2021-07-05 11:45:20'),(73,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.51',4732,'2021-07-05 04:01:51','2021-07-05 04:08:00'),(74,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',33528,'2021-07-05 06:03:15','2021-07-05 06:04:24'),(75,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',9284,'2021-07-05 06:29:58','2021-07-05 06:41:08'),(76,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',27028,'2021-07-05 06:49:44','2021-07-05 06:55:53'),(77,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',30756,'2021-07-06 02:28:08','2021-07-06 02:34:16'),(78,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',34560,'2021-07-06 02:48:24','2021-07-06 04:09:32'),(79,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',5988,'2021-07-06 04:36:06','2021-07-06 04:37:14'),(80,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',18212,'2021-07-06 05:32:49','2021-07-06 07:13:57'),(81,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',21376,'2021-07-06 07:22:03','2021-07-06 07:28:11'),(82,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',20584,'2021-07-06 07:29:55','2021-07-06 07:36:04'),(83,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',13484,'2021-07-06 07:41:27','2021-07-06 08:02:35'),(84,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',35684,'2021-07-06 08:03:18','2021-07-06 08:04:26'),(85,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',32720,'2021-07-06 08:11:24','2021-07-06 08:22:34'),(86,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',9392,'2021-07-06 08:25:58','2021-07-06 08:37:06'),(87,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',24696,'2021-07-06 08:41:22','2021-07-06 08:42:30'),(88,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',32388,'2021-07-06 08:51:17','2021-07-06 09:07:24'),(89,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',19480,'2021-07-06 09:45:45','2021-07-06 09:56:53'),(90,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.1.5',23384,'2021-07-06 11:26:33','2021-07-06 11:27:42'),(91,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.1.5',35084,'2021-07-06 11:29:04','2021-07-06 11:30:12'),(92,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',20508,'2021-07-07 00:55:35','2021-07-07 00:56:44'),(93,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',36544,'2021-07-07 00:58:32','2021-07-07 01:14:40'),(94,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',34924,'2021-07-07 01:44:25','2021-07-07 02:05:34'),(95,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',11452,'2021-07-07 05:13:22','2021-07-07 05:34:30'),(96,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',31440,'2021-07-07 05:40:54','2021-07-07 06:02:02'),(97,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',24072,'2021-07-07 06:07:52','2021-07-07 06:19:01'),(98,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',35452,'2021-07-07 06:22:02','2021-07-07 06:23:11'),(99,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',32108,'2021-07-07 06:29:30','2021-07-07 06:35:38'),(100,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',23188,'2021-07-07 07:11:37','2021-07-07 07:32:47'),(101,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',36264,'2021-07-07 07:33:35','2021-07-07 07:34:44'),(102,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',32868,'2021-07-07 07:40:09','2021-07-07 07:46:17'),(103,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',37492,'2021-07-07 08:38:39','2021-07-07 09:49:49'),(104,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',31136,'2021-07-07 09:53:12','2021-07-07 11:19:21'),(105,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',27772,'2021-07-08 01:00:27','2021-07-08 01:46:37'),(106,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',37068,'2021-07-08 01:57:11','2021-07-08 03:23:19'),(107,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',17852,'2021-07-08 03:33:56','2021-07-08 04:20:06'),(108,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',33548,'2021-07-08 04:50:41','2021-07-08 06:21:52'),(109,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',22808,'2021-07-08 15:17:13','2021-07-08 15:33:22'),(110,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',36724,'2021-07-08 15:41:41','2021-07-08 15:42:51'),(111,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',37344,'2021-07-08 15:44:41','2021-07-08 15:50:51'),(112,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',34412,'2021-07-08 15:55:43','2021-07-08 16:16:52'),(113,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',23744,'2021-07-08 16:21:07','2021-07-08 16:22:15'),(114,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',5272,'2021-07-08 16:23:44','2021-07-08 16:24:52'),(115,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',19664,'2021-07-08 16:25:49','2021-07-08 16:51:57'),(116,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',8140,'2021-07-08 16:55:36','2021-07-08 17:01:46'),(117,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',25512,'2021-07-08 17:07:30','2021-07-08 17:08:39'),(118,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',27328,'2021-07-08 18:30:38','2021-07-08 18:41:47'),(119,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',1972,'2021-07-08 19:20:35','2021-07-08 19:46:44'),(120,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',9252,'2021-07-08 19:47:58','2021-07-08 19:59:06'),(121,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',17388,'2021-07-08 20:03:01','2021-07-08 20:29:10'),(122,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',33876,'2021-07-08 20:31:40','2021-07-08 20:37:49'),(123,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',36708,'2021-07-08 20:39:56','2021-07-09 13:49:50'),(124,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',38484,'2021-07-08 20:45:50','2021-07-08 20:46:59'),(125,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',30640,'2021-07-08 20:51:26','2021-07-08 21:07:35'),(126,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',27020,'2021-07-09 09:12:15','2021-07-09 11:48:25'),(127,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',35600,'2021-07-09 11:53:35','2021-07-09 11:59:44'),(128,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',28524,'2021-07-09 12:00:11','2021-07-09 12:36:20'),(129,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',11104,'2021-07-09 13:52:58','2021-07-09 14:19:10'),(130,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',13876,'2021-07-09 14:23:41','2021-07-09 14:24:52'),(131,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',12984,'2021-07-09 14:27:10','2021-07-09 14:43:19'),(132,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',22196,'2021-07-09 14:46:56','2021-07-09 14:58:06'),(133,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',24744,'2021-07-09 15:00:53','2021-07-09 15:02:03'),(134,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',29836,'2021-07-09 15:03:51','2021-07-09 15:04:59'),(135,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',31668,'2021-07-09 15:05:18','2021-07-09 15:06:27'),(136,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',27704,'2021-07-09 15:08:37','2021-07-09 15:54:46'),(137,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',37280,'2021-07-09 16:10:17','2021-07-09 17:41:27'),(138,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',18724,'2021-07-09 17:42:37','2021-07-09 17:43:47'),(139,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',38128,'2021-07-09 17:44:49','2021-07-09 17:45:58'),(140,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.1.5',2292,'2021-07-10 15:19:02','2021-07-10 15:20:11'),(141,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',7036,'2021-07-12 09:12:53','2021-07-12 09:34:03'),(142,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',16248,'2021-07-12 09:42:42','2021-07-12 09:43:51'),(143,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',5968,'2021-07-12 09:57:54','2021-07-12 11:34:03'),(144,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',2208,'2021-07-12 13:21:03','2021-07-12 15:42:12'),(145,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',8716,'2021-07-12 15:46:47','2021-07-12 16:07:56'),(146,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',8084,'2021-07-12 16:09:52','2021-07-12 16:31:01'),(147,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',12816,'2021-07-12 16:37:27','2021-07-12 16:38:36'),(148,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',8336,'2021-07-12 16:38:49','2021-07-12 16:39:58'),(149,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',4228,'2021-07-12 16:42:16','2021-07-12 16:43:24'),(150,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',15832,'2021-07-12 16:46:48','2021-07-12 18:17:57'),(151,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',3980,'2021-07-12 18:29:34','2021-07-12 18:35:42'),(152,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',656,'2021-07-12 18:36:21','2021-07-12 18:37:30'),(153,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',1928,'2021-07-12 19:51:30','2021-07-12 19:52:39'),(154,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',9696,'2021-07-12 19:56:07','2021-07-12 19:58:17'),(155,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',10648,'2021-07-12 20:00:25','2021-07-12 20:01:33'),(156,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',16916,'2021-07-12 20:04:40','2021-07-12 20:08:53'),(157,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',8132,'2021-07-12 20:08:56','2021-07-12 20:10:05'),(158,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',16036,'2021-07-12 20:15:03','2021-07-12 20:16:12'),(159,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',16188,'2021-07-12 20:18:47','2021-07-12 20:19:55'),(160,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',4080,'2021-07-12 20:24:02','2021-07-12 20:30:10'),(161,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',5984,'2021-07-12 20:37:54','2021-07-12 21:14:03'),(162,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',9788,'2021-07-13 08:57:41','2021-07-13 09:03:50'),(163,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',12084,'2021-07-13 09:04:14','2021-07-13 09:15:23'),(164,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',15112,'2021-07-13 09:43:43','2021-07-13 09:44:51'),(165,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',13188,'2021-07-13 09:46:10','2021-07-13 09:47:18'),(166,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',3696,'2021-07-13 09:52:41','2021-07-13 09:53:49'),(167,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',7480,'2021-07-13 10:00:02','2021-07-13 10:01:09'),(168,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',17072,'2021-07-13 10:01:15','2021-07-13 10:02:23'),(169,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',10408,'2021-07-13 10:03:38','2021-07-13 10:04:45'),(170,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',2540,'2021-07-13 10:06:45','2021-07-13 10:57:52'),(171,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.15',15588,'2021-07-13 11:04:53','2021-07-13 11:06:03'),(172,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8720,'2021-07-13 14:57:23','2021-07-13 15:38:33'),(173,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',17668,'2021-07-13 15:44:10','2021-07-14 11:22:34'),(174,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',15304,'2021-07-13 15:47:08','2021-07-13 15:48:16'),(175,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',1420,'2021-07-13 15:49:26','2021-07-13 15:50:34'),(176,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',6736,'2021-07-13 15:52:22','2021-07-20 14:21:04'),(177,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',17412,'2021-07-13 15:55:01','2021-07-13 15:56:10'),(178,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',6960,'2021-07-13 15:56:37','2021-07-13 15:57:45'),(179,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',16268,'2021-07-13 15:58:44','2021-07-13 15:59:52'),(180,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',14984,'2021-07-13 16:00:12','2021-07-13 16:01:20'),(181,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12240,'2021-07-13 16:29:23','2021-07-13 17:10:31'),(182,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',17216,'2021-07-14 09:09:56','2021-07-14 10:46:06'),(183,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',1676,'2021-07-14 10:51:13','2021-07-14 10:52:22'),(184,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12504,'2021-07-14 10:59:00','2021-07-14 11:00:09'),(185,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',15344,'2021-07-14 11:27:03','2021-07-14 11:28:11'),(186,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',16668,'2021-07-14 11:29:43','2021-07-14 11:50:52'),(187,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',2944,'2021-07-14 13:01:41','2021-07-14 13:22:49'),(188,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',17572,'2021-07-14 14:12:21','2021-07-14 17:13:30'),(189,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',15036,'2021-07-14 17:16:09','2021-07-14 17:27:18'),(190,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13956,'2021-07-14 17:29:22','2021-07-14 18:05:31'),(191,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',14968,'2021-07-14 18:11:52','2021-07-14 18:28:01'),(192,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11380,'2021-07-14 18:30:45','2021-07-14 18:36:54'),(193,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',17884,'2021-07-14 18:46:50','2021-07-14 18:52:58'),(194,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10568,'2021-07-15 09:24:56','2021-07-15 10:06:05'),(195,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3556,'2021-07-15 10:07:31','2021-07-15 10:13:40'),(196,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3224,'2021-07-15 10:25:35','2021-07-15 10:31:43'),(197,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',5848,'2021-07-15 10:36:04','2021-07-15 11:02:12'),(198,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',2736,'2021-07-15 11:07:39','2021-07-15 11:08:46'),(199,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4880,'2021-07-15 11:12:11','2021-07-15 11:28:18'),(200,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',6276,'2021-07-15 11:29:09','2021-07-15 11:35:16'),(201,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7824,'2021-07-15 12:15:51','2021-07-15 12:17:00'),(202,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10932,'2021-07-15 12:20:12','2021-07-15 12:21:21'),(203,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',9696,'2021-07-15 13:16:43','2021-07-15 13:27:52'),(204,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11072,'2021-07-15 13:31:57','2021-07-15 13:33:05'),(205,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',9888,'2021-07-15 13:45:08','2021-07-15 14:21:17'),(206,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',6084,'2021-07-15 14:24:20','2021-07-15 14:40:28'),(207,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10224,'2021-07-15 14:42:37','2021-07-15 16:33:45'),(208,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12468,'2021-07-15 16:40:52','2021-07-15 17:12:01'),(209,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12944,'2021-07-15 17:16:15','2021-07-15 17:17:23'),(210,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4864,'2021-07-15 17:25:31','2021-07-15 17:36:40'),(211,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3848,'2021-07-15 17:37:17','2021-07-15 17:38:25'),(212,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',9372,'2021-07-15 17:42:15','2021-07-15 17:43:23'),(213,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11060,'2021-07-16 09:09:45','2021-07-16 09:20:55'),(214,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3200,'2021-07-16 09:53:26','2021-07-16 11:34:35'),(215,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12004,'2021-07-16 11:36:43','2021-07-16 11:42:52'),(216,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',912,'2021-07-16 11:50:57','2021-07-16 11:57:05'),(217,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7996,'2021-07-16 12:07:30','2021-07-16 12:08:39'),(218,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11080,'2021-07-16 12:34:30','2021-07-16 12:35:39'),(219,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7452,'2021-07-16 12:50:27','2021-07-16 12:51:35'),(220,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8944,'2021-07-16 12:53:08','2021-07-16 13:44:16'),(221,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3236,'2021-07-16 16:36:51','2021-07-16 16:57:59'),(222,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8032,'2021-07-16 17:00:06','2021-07-16 17:16:15'),(223,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11128,'2021-07-16 17:22:06','2021-07-16 17:23:17'),(224,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11304,'2021-07-16 17:24:15','2021-07-16 17:45:23'),(225,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4256,'2021-07-19 09:25:02','2021-07-19 09:26:12'),(226,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',5324,'2021-07-19 09:27:19','2021-07-19 09:38:27'),(227,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',9720,'2021-07-19 10:06:02','2021-07-19 10:12:10'),(228,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12780,'2021-07-19 10:54:13','2021-07-19 12:00:21'),(229,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',9424,'2021-07-19 16:42:56','2021-07-19 16:49:04'),(230,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10964,'2021-07-20 09:51:53','2021-07-20 09:53:01'),(231,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3112,'2021-07-20 10:28:01','2021-07-20 10:49:09'),(232,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13408,'2021-07-20 11:06:56','2021-07-20 11:33:04'),(233,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',12748,'2021-07-20 13:40:06','2021-07-20 14:11:15'),(234,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',1016,'2021-07-20 14:25:13','2021-07-20 14:31:21'),(235,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8012,'2021-07-20 14:39:39','2021-07-20 15:00:47'),(236,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7068,'2021-07-20 15:14:51','2021-07-20 15:20:59'),(237,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13616,'2021-07-20 15:38:09','2021-07-20 16:04:17'),(238,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11672,'2021-07-20 16:08:53','2021-07-20 16:10:01'),(239,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13848,'2021-07-20 16:45:47','2021-07-20 16:56:55'),(240,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10888,'2021-07-20 17:14:25','2021-07-20 17:15:33'),(241,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13584,'2021-07-21 09:06:02','2021-07-21 10:12:11'),(242,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13752,'2021-07-21 10:18:01','2021-07-21 10:19:09'),(243,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3232,'2021-07-21 10:45:46','2021-07-21 11:01:53'),(244,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8152,'2021-07-21 11:05:23','2021-07-21 11:06:31'),(245,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',11348,'2021-07-21 13:22:29','2021-07-21 13:23:38'),(246,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',2304,'2021-07-21 13:27:03','2021-07-21 14:08:12'),(247,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13628,'2021-07-21 14:23:18','2021-07-21 14:24:26'),(248,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7912,'2021-07-21 14:27:23','2021-07-21 14:28:31'),(249,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10460,'2021-07-21 14:29:21','2021-07-21 14:30:29'),(250,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8536,'2021-07-21 14:33:42','2021-07-21 14:34:50'),(251,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',5668,'2021-07-21 14:36:24','2021-07-21 14:37:32'),(252,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',5156,'2021-07-21 14:41:11','2021-07-21 14:42:19'),(253,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10420,'2021-07-21 14:45:30','2021-07-21 14:56:38'),(254,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',14032,'2021-07-21 15:06:58','2021-07-21 15:18:06'),(255,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',3636,'2021-07-21 15:20:20','2021-07-21 16:06:29'),(256,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8088,'2021-07-21 16:09:15','2021-07-21 16:10:23'),(257,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',7844,'2021-07-21 16:10:37','2021-07-21 16:11:45'),(258,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4760,'2021-07-21 16:12:14','2021-07-21 16:18:22'),(259,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',8056,'2021-07-21 16:20:21','2021-07-21 16:21:30'),(260,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10228,'2021-07-21 16:23:22','2021-07-21 16:29:30'),(261,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',1568,'2021-07-21 16:47:35','2021-07-21 17:38:43'),(262,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',6208,'2021-07-22 09:10:00','2021-07-22 09:11:09'),(263,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',10660,'2021-07-22 09:24:06','2021-07-22 09:40:14'),(264,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',2268,'2021-07-22 10:12:18','2021-07-22 11:18:26'),(265,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',13388,'2021-07-22 11:47:43','2021-07-22 11:53:52'),(266,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4900,'2021-07-22 13:42:09','2021-07-22 13:43:18'),(267,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',5048,'2021-07-22 13:47:14','2021-07-22 15:43:23'),(268,'C:\\Users\\13675\\IdeaProjects\\xsrx\\xsrx-service','192.168.0.8',4204,'2021-07-22 16:15:39','2021-07-22 16:46:47'),(269,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',19420,'2021-07-23 14:45:58','2021-07-23 15:57:13'),(270,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',10580,'2021-07-27 08:14:33','2021-07-27 08:30:45'),(271,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',12840,'2021-07-27 08:34:10','2021-07-27 08:35:39'),(272,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',20768,'2021-07-27 08:37:09','2021-07-27 08:38:18'),(273,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',10204,'2021-07-27 08:38:31','2021-07-27 08:39:40'),(274,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',20604,'2021-07-27 08:42:39','2021-07-27 08:43:49'),(275,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',18664,'2021-07-27 08:46:29','2021-07-27 09:32:38'),(276,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',4120,'2021-07-27 09:35:02','2021-07-27 10:06:11'),(277,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',17504,'2021-07-27 10:08:17','2021-07-27 11:09:27'),(278,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',5256,'2021-07-27 11:10:49','2021-07-27 11:11:59'),(279,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',14476,'2021-07-27 11:13:54','2021-07-27 11:40:03'),(280,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',15208,'2021-07-27 11:40:56','2021-07-27 11:42:05'),(281,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',680,'2021-07-27 11:42:10','2021-07-27 11:48:19'),(282,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',1236,'2021-07-27 11:52:26','2021-07-27 11:53:34'),(283,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',18900,'2021-07-27 11:55:40','2021-07-27 11:56:49'),(284,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',18276,'2021-07-27 11:57:35','2021-07-27 11:58:44'),(285,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',11020,'2021-07-27 12:00:46','2021-07-27 13:46:53'),(286,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',16400,'2021-07-27 13:48:27','2021-07-27 14:34:44'),(287,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',3184,'2021-07-27 14:38:50','2021-07-27 14:40:37'),(288,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',5472,'2021-07-27 14:42:41','2021-07-27 15:53:50'),(289,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',17364,'2021-07-27 15:54:47','2021-07-27 16:05:56'),(290,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',11088,'2021-07-27 16:09:06','2021-07-27 16:15:16'),(291,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',13632,'2021-07-27 16:16:35','2021-07-27 16:17:44'),(292,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.19;192.168.89.1;192.168.206.1',11664,'2021-07-27 16:22:37','2021-07-27 16:23:46'),(293,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.12;192.168.89.1;192.168.31.175;192.168.206.1',3308,'2021-07-27 16:26:24','2021-07-27 16:27:50'),(294,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.12;192.168.89.1;192.168.206.1',17212,'2021-07-27 16:35:33','2021-07-27 16:36:55'),(295,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.12;192.168.89.1;192.168.206.1',2544,'2021-07-27 16:39:17','2021-07-27 17:00:35'),(296,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.12;192.168.89.1;192.168.206.1',5644,'2021-07-27 17:03:09','2021-07-27 17:04:28'),(297,'/home/app/api','172.18.1.120',17239,'2021-07-27 17:17:49','2021-07-27 17:29:02'),(298,'/home/app/api','172.18.1.120',17981,'2021-07-27 17:31:53','2021-08-03 10:38:27'),(299,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.33;192.168.31.175',10340,'2021-08-03 10:43:55','2021-08-03 11:35:05'),(300,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',8588,'2021-08-03 13:54:20','2021-08-03 16:45:29'),(301,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15788,'2021-08-03 16:46:47','2021-08-03 17:32:55'),(302,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',1648,'2021-08-04 16:03:22','2021-08-04 16:04:30'),(303,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',16560,'2021-08-04 16:05:44','2021-08-04 16:26:51'),(304,'/home/app/api','172.18.1.120',15028,'2021-08-04 16:47:01','2021-08-04 16:53:15'),(305,'/home/app/api','172.18.1.120',15925,'2021-08-04 17:05:00','2021-08-04 17:11:14'),(306,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9140,'2021-08-05 11:24:50','2021-08-05 11:25:59'),(307,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20464,'2021-08-11 16:20:49','2021-08-11 16:32:00'),(308,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',8816,'2021-08-12 09:11:22','2021-08-12 09:17:30'),(309,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14588,'2021-08-12 13:21:11','2021-08-12 15:44:16'),(310,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',21212,'2021-08-12 15:48:32','2021-08-12 15:49:41'),(311,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','',5944,'2021-08-12 16:19:03','2021-08-12 16:30:10'),(312,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15736,'2021-08-12 17:17:06','2021-08-12 17:48:14'),(313,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3248,'2021-08-13 09:03:37','2021-08-13 10:54:46'),(314,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14480,'2021-08-13 10:55:01','2021-08-13 10:56:08'),(315,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',10204,'2021-08-13 10:58:52','2021-08-13 15:01:56'),(316,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',6864,'2021-08-13 15:06:35','2021-08-13 15:07:43'),(317,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19316,'2021-08-13 15:09:38','2021-08-13 15:45:46'),(318,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19172,'2021-08-13 15:49:29','2021-08-13 15:50:37'),(319,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12200,'2021-08-13 15:52:31','2021-08-13 15:53:39'),(320,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',17640,'2021-08-13 15:54:36','2021-08-13 17:29:42'),(321,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',4224,'2021-08-16 09:30:16','2021-08-16 09:56:24'),(322,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14592,'2021-08-16 09:59:34','2021-08-16 10:00:41'),(323,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12832,'2021-08-16 10:01:49','2021-08-16 10:13:00'),(324,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9968,'2021-08-16 10:16:30','2021-08-16 10:17:38'),(325,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12984,'2021-08-16 10:19:13','2021-08-16 10:30:20'),(326,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',16208,'2021-08-16 10:32:14','2021-08-16 14:00:53'),(327,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12744,'2021-08-16 14:05:55','2021-08-16 14:07:03'),(328,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19960,'2021-08-16 14:09:22','2021-08-16 14:15:32'),(329,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20124,'2021-08-16 14:18:58','2021-08-16 14:35:06'),(330,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',11836,'2021-08-16 14:39:34','2021-08-16 16:25:42'),(331,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',1900,'2021-08-16 16:28:13','2021-08-16 16:29:21'),(332,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12948,'2021-08-16 16:31:39','2021-08-16 17:12:47'),(333,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',2248,'2021-08-16 17:18:00','2021-08-16 17:19:07'),(334,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15808,'2021-08-16 17:23:46','2021-08-16 17:34:53'),(335,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',712,'2021-08-16 17:38:17','2021-08-16 17:49:24'),(336,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',17996,'2021-08-16 17:50:02','2021-08-16 17:51:10'),(337,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',11848,'2021-08-17 09:16:33','2021-08-17 11:27:21'),(338,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3064,'2021-08-17 11:56:15','2021-08-17 13:16:34'),(339,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9120,'2021-08-17 13:17:01','2021-08-17 13:18:10'),(340,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15388,'2021-08-17 13:18:56','2021-08-17 13:20:04'),(341,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19720,'2021-08-17 13:22:24','2021-08-17 13:28:33'),(342,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',11752,'2021-08-17 13:28:44','2021-08-17 13:29:52'),(343,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9768,'2021-08-17 13:30:58','2021-08-17 13:32:07'),(344,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9760,'2021-08-17 13:37:00','2021-08-17 13:38:08'),(345,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20180,'2021-08-17 13:43:16','2021-08-17 13:44:25'),(346,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',10436,'2021-08-17 13:45:53','2021-08-17 13:47:23'),(347,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19536,'2021-08-17 13:51:25','2021-08-17 13:52:33'),(348,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',18120,'2021-08-17 13:53:46','2021-08-17 13:54:54'),(349,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',8188,'2021-08-17 13:55:41','2021-08-17 13:56:49'),(350,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14736,'2021-08-17 13:58:27','2021-08-17 13:59:35'),(351,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15324,'2021-08-17 14:01:29','2021-08-17 14:02:37'),(352,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',11180,'2021-08-17 14:02:43','2021-08-17 14:03:51'),(353,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',13408,'2021-08-17 14:08:14','2021-08-17 14:09:23'),(354,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19504,'2021-08-17 14:10:37','2021-08-17 14:51:46'),(355,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3332,'2021-08-17 14:52:38','2021-08-17 14:58:47'),(356,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',16592,'2021-08-17 15:01:14','2021-08-17 15:27:23'),(357,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9380,'2021-08-17 15:29:37','2021-08-17 16:50:46'),(358,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',4616,'2021-08-17 16:52:16','2021-08-17 17:08:26'),(359,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',11476,'2021-08-17 17:11:49','2021-08-17 17:12:57'),(360,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14244,'2021-08-17 17:14:20','2021-08-17 17:25:28'),(361,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',13484,'2021-08-17 17:30:59','2021-08-17 17:32:08'),(362,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19116,'2021-08-17 17:33:25','2021-08-17 17:49:34'),(363,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20476,'2021-08-17 17:52:33','2021-08-17 17:53:42'),(364,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',17148,'2021-08-17 17:55:17','2021-08-17 17:56:26'),(365,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',1092,'2021-08-17 17:58:40','2021-08-17 17:59:48'),(366,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',8360,'2021-08-17 18:00:51','2021-08-17 18:01:59'),(367,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20084,'2021-08-17 18:03:23','2021-08-17 18:04:31'),(368,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',20076,'2021-08-17 18:06:41','2021-08-17 18:07:49'),(369,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',12100,'2021-08-17 18:09:58','2021-08-17 18:11:06'),(370,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',4728,'2021-08-17 18:14:17','2021-08-17 18:15:38'),(371,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',2920,'2021-08-17 18:16:08','2021-08-17 18:27:17'),(372,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19896,'2021-08-18 10:01:08','2021-08-18 10:02:19'),(373,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',9056,'2021-08-18 10:55:26','2021-08-18 12:46:36'),(374,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',4116,'2021-08-18 13:17:37','2021-08-18 13:33:46'),(375,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14228,'2021-08-18 13:37:50','2021-08-18 13:38:59'),(376,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3896,'2021-08-18 13:43:08','2021-08-18 13:44:17'),(377,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',13096,'2021-08-18 13:55:43','2021-08-18 14:26:52'),(378,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;2.2.2.1',20468,'2021-08-18 14:28:11','2021-08-18 14:49:21'),(379,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',1808,'2021-08-24 09:33:13','2021-08-24 09:44:26'),(380,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',16012,'2021-08-26 10:28:47','2021-08-26 10:59:57'),(381,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',16500,'2021-08-26 11:02:49','2021-08-26 11:03:58'),(382,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',10196,'2021-08-31 10:22:40','2021-08-31 10:23:50'),(383,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',16664,'2021-08-31 10:28:49','2021-08-31 10:29:58'),(384,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',13060,'2021-08-31 10:34:13','2021-08-31 10:45:21'),(385,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',13124,'2021-08-31 10:47:23','2021-08-31 10:48:33'),(386,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',13496,'2021-08-31 11:49:47','2021-08-31 12:00:57'),(387,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',7584,'2021-08-31 13:58:26','2021-08-31 13:59:36'),(388,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3196,'2021-08-31 14:04:00','2021-08-31 14:05:09'),(389,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',16404,'2021-08-31 14:09:02','2021-08-31 14:10:12'),(390,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.1.101',11392,'2021-09-15 14:47:58','2021-09-15 14:54:07'),(391,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',8544,'2021-09-17 09:51:30','2021-09-17 10:17:42'),(392,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',5820,'2021-09-17 10:18:46','2021-09-17 10:19:55'),(393,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',16748,'2021-09-17 10:22:35','2021-09-17 10:23:44'),(394,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',19972,'2021-09-17 10:25:28','2021-09-17 10:31:40'),(395,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',4148,'2021-09-17 10:34:28','2021-09-17 10:35:38'),(396,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',11272,'2021-09-17 10:36:35','2021-09-17 10:47:44'),(397,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',19168,'2021-09-17 11:38:59','2021-09-17 11:40:09'),(398,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',6072,'2021-09-17 11:43:45','2021-09-17 11:44:54'),(399,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',20292,'2021-09-17 11:50:47','2021-09-17 11:51:57'),(400,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.104',16164,'2021-09-17 11:54:17','2021-09-17 12:05:26'),(401,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.102',11180,'2021-09-18 14:52:46','2021-09-18 14:54:15'),(402,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.102',6124,'2021-09-18 14:57:05','2021-09-18 14:58:15'),(403,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.102',2580,'2021-09-18 15:02:03','2021-09-18 15:03:15'),(404,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',14444,'2021-11-12 16:44:19','2021-11-12 16:50:29'),(405,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',15720,'2021-11-12 16:52:51','2021-11-12 17:39:02'),(406,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.101',19220,'2021-11-16 09:12:43','2021-11-16 13:42:38'),(407,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.101',7504,'2021-11-16 13:47:12','2021-11-16 17:43:23'),(408,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',4824,'2021-11-17 09:24:53','2021-11-17 09:56:04'),(409,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',18076,'2021-11-17 09:56:35','2021-11-17 09:57:44'),(410,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',16712,'2021-11-17 10:01:22','2021-11-17 10:22:31'),(411,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',6756,'2021-11-17 10:25:51','2021-11-17 11:12:01'),(412,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',7464,'2021-11-17 11:19:23','2021-11-17 13:25:43'),(413,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',5480,'2021-11-17 13:25:53','2021-11-17 13:32:02'),(414,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',16560,'2021-11-17 13:35:10','2021-11-17 13:38:38'),(415,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',7616,'2021-11-17 13:42:12','2021-11-17 13:43:21'),(416,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.1.103',20544,'2021-11-17 16:47:52','2021-11-17 17:54:01'),(417,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.1.103',15260,'2021-11-18 10:47:56','2021-11-18 10:49:07'),(418,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\xsrx\\xsrx-service','192.168.1.103',11864,'2021-11-18 10:51:39','2021-11-18 10:52:47'),(419,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',19304,'2021-11-19 10:59:08','2021-11-19 11:30:18'),(420,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.52',16008,'2021-11-19 14:41:01','2021-11-19 14:57:15'),(421,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.52',18828,'2021-11-19 14:58:26','2021-11-19 15:24:35'),(422,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.52',19532,'2021-11-19 15:29:10','2021-11-20 04:21:38'),(423,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',17736,'2021-11-20 15:55:05','2021-11-20 16:11:16'),(424,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',1224,'2021-11-20 16:13:54','2021-11-20 16:15:06'),(425,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',17464,'2021-11-20 16:17:19','2021-11-20 17:58:31'),(426,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',2320,'2021-11-21 13:16:56','2021-11-21 14:58:10'),(427,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',14832,'2021-11-21 15:02:58','2021-11-21 15:09:08'),(428,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',5484,'2021-11-21 15:11:01','2021-11-21 15:12:10'),(429,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',4768,'2021-11-21 15:15:40','2021-11-21 15:16:48'),(430,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',12492,'2021-11-21 15:18:54','2021-11-21 15:40:03'),(431,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',15976,'2021-11-21 15:40:43','2021-11-21 15:41:53'),(432,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',17864,'2021-11-21 15:42:17','2021-11-21 16:33:28'),(433,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',9380,'2021-11-21 17:02:01','2021-11-21 17:03:10'),(434,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',11612,'2021-11-21 17:03:37','2021-11-21 17:04:46'),(435,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',13672,'2021-11-21 17:06:04','2021-11-21 17:07:13'),(436,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',14556,'2021-11-21 17:07:38','2021-11-21 17:08:47'),(437,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',14668,'2021-11-21 17:10:41','2021-11-21 18:41:50'),(438,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',17180,'2021-11-21 18:45:55','2021-11-21 19:02:05'),(439,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',4736,'2021-11-21 19:02:43','2021-11-21 19:04:07'),(440,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',4564,'2021-11-21 19:06:15','2021-11-21 19:07:24'),(441,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',12404,'2021-11-21 19:11:56','2021-11-21 19:38:05'),(442,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',16240,'2021-11-21 19:39:50','2021-11-21 19:41:01'),(443,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.10.51',9848,'2021-11-21 20:39:45','2021-11-21 20:45:55'),(444,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',23432,'2022-03-04 14:29:33','2022-03-04 15:20:46'),(445,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.31.175',7220,'2022-03-04 15:29:27','2022-03-04 16:45:42'),(446,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3328,'2022-03-17 11:39:08','2022-03-17 12:15:28'),(447,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',24064,'2023-03-01 16:45:07','2023-03-01 17:36:28'),(448,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',19296,'2023-03-02 16:13:29','2023-03-02 16:14:40'),(449,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',23944,'2023-03-02 16:17:34','2023-03-02 16:33:44'),(450,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',17232,'2023-03-13 14:26:57','2023-03-13 14:28:10'),(451,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',25496,'2023-03-13 14:28:30','2023-03-13 14:59:44'),(452,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',2560,'2023-11-10 16:39:03','2023-11-10 17:05:27'),(453,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',3200,'2023-11-16 10:27:25','2023-11-16 10:53:47'),(454,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88;192.168.0.6',25368,'2024-10-28 10:44:20','2024-10-28 10:50:38'),(455,'D:\\WORKSPACE\\IdeaProjects\\yanzhi\\boot\\visitor\\visitor-service','192.168.0.88',22968,'2024-10-29 14:28:49','2024-10-29 18:15:13'),(456,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',20792,'2025-11-17 09:34:43','2025-11-17 10:55:58'),(457,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',28824,'2025-11-17 11:56:43','2025-11-17 15:33:00'),(458,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',13184,'2025-11-18 09:52:00','2025-11-18 17:38:19'),(459,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',12412,'2025-11-19 13:41:38','2025-11-19 14:23:10'),(460,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',14396,'2025-11-19 14:26:54','2025-11-20 13:58:18'),(461,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',9232,'2025-11-20 14:03:01','2025-11-20 14:29:16'),(462,'D:\\workspace\\tntlinking\\openedu-visitor\\visitor-service','192.168.0.6',11108,'2025-11-20 14:31:42','2025-11-20 23:02:58'),(463,'D:\\workspace\\tntlinking\\openedu-visitor','192.168.0.6',12580,'2025-11-25 12:45:33','2025-11-25 18:41:55'),(464,'D:\\workspace\\tntlinking\\openedu-visitor','192.168.0.6',9464,'2025-11-27 14:43:24','2025-11-27 15:59:42'),(465,'D:\\workspace\\tntlinking\\openedu-visitor','192.168.0.6',8956,'2025-11-27 16:04:12','2025-11-27 16:55:29');
/*!40000 ALTER TABLE `t_heart_beat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_id_generator`
--

DROP TABLE IF EXISTS `t_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_id_generator` (
  `id` int(11) DEFAULT NULL,
  `key_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '英文key',
  `rule_format` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则格式。no_cycle没有周期, year_cycle 年周期, month_cycle月周期, day_cycle 日周期',
  `rule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
  `init_number` int(11) NOT NULL DEFAULT '1' COMMENT '初始值',
  `last_number` int(11) DEFAULT NULL COMMENT '上次产生的id, 默认为空',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  UNIQUE KEY `key_name` (`key_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id生成器定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_id_generator`
--

LOCK TABLES `t_id_generator` WRITE;
/*!40000 ALTER TABLE `t_id_generator` DISABLE KEYS */;
INSERT INTO `t_id_generator` VALUES (2,'goods_num','[nnnnnnn]','NO_CYCLE',1,NULL,'商品编号','2019-04-09 09:48:04','2019-03-29 14:14:12'),(1,'order','[yyyy][mm][dd][nnnnn]','DAY_CYCLE',1,1,'订单编号','2019-03-30 11:25:42','2019-03-29 14:14:12');
/*!40000 ALTER TABLE `t_id_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_id_generator_record`
--

DROP TABLE IF EXISTS `t_id_generator_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_id_generator_record` (
  `generator_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `last_number` int(11) NOT NULL,
  PRIMARY KEY (`generator_id`,`year`,`month`,`day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id_generator记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_id_generator_record`
--

LOCK TABLES `t_id_generator_record` WRITE;
/*!40000 ALTER TABLE `t_id_generator_record` DISABLE KEYS */;
INSERT INTO `t_id_generator_record` VALUES (1,2019,3,30,1),(2,2019,3,30,1),(2,2019,4,3,2),(2,2019,4,8,2),(2,2019,4,9,1);
/*!40000 ALTER TABLE `t_id_generator_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice`
--

DROP TABLE IF EXISTS `t_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态：0未删除 0删除 ',
  `send_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1发送',
  `create_user` bigint(20) NOT NULL COMMENT '消息创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice`
--

LOCK TABLES `t_notice` WRITE;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice_receive_record`
--

DROP TABLE IF EXISTS `t_notice_receive_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_notice_receive_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_id` bigint(20) NOT NULL COMMENT '消息id',
  `employee_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice_receive_record`
--

LOCK TABLES `t_notice_receive_record` WRITE;
/*!40000 ALTER TABLE `t_notice_receive_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_notice_receive_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_operate_log`
--

DROP TABLE IF EXISTS `t_order_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_order_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '各种单据的id',
  `order_type` int(11) NOT NULL COMMENT '单据类型',
  `operate_type` int(11) NOT NULL COMMENT '操作类型',
  `operate_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型 对应的中文',
  `operate_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '操作备注',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `employee_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工名称',
  `ext_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '额外信息',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id_order_type` (`order_id`,`order_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='各种单据操作记录\r\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_operate_log`
--

LOCK TABLES `t_order_operate_log` WRITE;
/*!40000 ALTER TABLE `t_order_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_peony`
--

DROP TABLE IF EXISTS `t_peony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_peony` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `kind` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品种',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名字',
  `color` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '颜色',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片链接',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='牡丹花';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_peony`
--

LOCK TABLES `t_peony` WRITE;
/*!40000 ALTER TABLE `t_peony` DISABLE KEYS */;
INSERT INTO `t_peony` VALUES (5,'复色类','什样锦','红色','https://bkimg.cdn.bcebos.com/pic/3c6d55fbb2fb43160ee185da2aa4462308f7d390?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxNTA=,xp_5,yp_5','2020-04-06 22:02:32','2020-04-06 22:03:30'),(6,'绿色','绿香球','绿色','11','2020-04-06 22:14:35','2020-04-06 22:17:51'),(7,'墨紫色类','冠世墨玉','紫色','34534534534','2020-04-06 22:15:19','2020-04-06 22:18:21'),(8,'1','1','1','1','2021-07-21 17:30:28','2021-07-21 17:30:28');
/*!40000 ALTER TABLE `t_peony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_position`
--

DROP TABLE IF EXISTS `t_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '岗位描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_position`
--

LOCK TABLES `t_position` WRITE;
/*!40000 ALTER TABLE `t_position` DISABLE KEYS */;
INSERT INTO `t_position` VALUES (1,'java develop','java develop is good job','2019-07-03 15:18:45','2019-07-03 15:18:45'),(2,'android develop','android develop is good job','2019-07-04 16:11:11','2019-07-04 16:11:00'),(3,'测试岗位1','这是内容11','2019-09-02 16:39:33','2019-07-10 14:03:50'),(8,'测试岗位2','测试岗位2.。','2019-09-04 10:19:40','2019-09-04 10:19:32'),(9,'测试岗位3','测试岗位3','2019-09-05 14:39:43','2019-09-05 14:39:43'),(10,'测试岗位4','测试岗位4','2019-09-05 14:39:48','2019-09-05 14:39:48'),(11,'测试岗位5','测试岗位5','2019-09-05 14:39:53','2019-09-05 14:39:53'),(12,'测试岗位6','测试岗位6','2019-09-05 14:39:58','2019-09-05 14:39:58'),(13,'测试岗位7','测试岗位7','2019-09-05 14:40:03','2019-09-05 14:40:03'),(14,'测试岗位8','测试岗位8','2019-09-05 14:40:09','2019-09-05 14:40:09'),(15,'测试岗位9','测试岗位9','2019-09-05 14:40:19','2019-09-05 14:40:19'),(16,'aaa22222','ddddddddddd','2019-11-15 17:04:29','2019-11-06 15:58:37'),(17,'ddd','fsdef','2019-11-15 17:04:40','2019-11-15 17:04:40');
/*!40000 ALTER TABLE `t_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_position_relation`
--

DROP TABLE IF EXISTS `t_position_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_position_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL COMMENT '岗位ID',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工ID',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_id` (`position_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_position_relation`
--

LOCK TABLES `t_position_relation` WRITE;
/*!40000 ALTER TABLE `t_position_relation` DISABLE KEYS */;
INSERT INTO `t_position_relation` VALUES (14,1,28,'2019-07-10 16:40:14','2019-07-10 16:40:14'),(40,3,34,'2019-09-06 08:55:18','2019-09-06 08:55:18'),(41,2,34,'2019-09-06 08:55:18','2019-09-06 08:55:18'),(42,1,34,'2019-09-06 08:55:18','2019-09-06 08:55:18'),(44,3,37,'2019-11-08 09:32:39','2019-11-08 09:32:39'),(98,14,36,'2021-07-07 10:01:34','2021-07-07 10:01:34'),(124,16,39,'2021-07-12 15:47:40','2021-07-12 15:47:40'),(125,13,39,'2021-07-12 15:47:40','2021-07-12 15:47:40'),(126,14,39,'2021-07-12 15:47:40','2021-07-12 15:47:40'),(127,8,38,'2021-07-12 15:47:47','2021-07-12 15:47:47'),(130,3,32,'2021-07-12 15:48:04','2021-07-12 15:48:04'),(131,2,32,'2021-07-12 15:48:04','2021-07-12 15:48:04'),(132,1,30,'2021-07-12 15:48:11','2021-07-12 15:48:11'),(133,2,30,'2021-07-12 15:48:11','2021-07-12 15:48:11'),(134,3,30,'2021-07-12 15:48:11','2021-07-12 15:48:11'),(135,2,31,'2021-07-12 15:48:17','2021-07-12 15:48:17'),(136,3,31,'2021-07-12 15:48:17','2021-07-12 15:48:17'),(137,1,29,'2021-07-12 15:48:23','2021-07-12 15:48:23'),(138,3,29,'2021-07-12 15:48:23','2021-07-12 15:48:23'),(139,2,29,'2021-07-12 15:48:23','2021-07-12 15:48:23'),(140,17,26,'2021-07-12 15:48:28','2021-07-12 15:48:28'),(141,15,25,'2021-07-12 15:48:53','2021-07-12 15:48:53'),(142,15,23,'2021-07-12 15:49:00','2021-07-12 15:49:00'),(143,14,23,'2021-07-12 15:49:00','2021-07-12 15:49:00'),(144,13,23,'2021-07-12 15:49:00','2021-07-12 15:49:00'),(145,3,22,'2021-07-12 15:49:06','2021-07-12 15:49:06'),(146,2,22,'2021-07-12 15:49:06','2021-07-12 15:49:06'),(147,15,20,'2021-07-12 15:49:15','2021-07-12 15:49:15'),(148,15,18,'2021-07-12 15:49:24','2021-07-12 15:49:24'),(149,15,17,'2021-07-12 15:49:32','2021-07-12 15:49:32'),(150,14,16,'2021-07-12 15:49:40','2021-07-12 15:49:40'),(151,15,15,'2021-07-12 15:49:49','2021-07-12 15:49:49'),(152,14,15,'2021-07-12 15:49:49','2021-07-12 15:49:49'),(155,15,13,'2021-07-12 15:50:06','2021-07-12 15:50:06'),(156,14,13,'2021-07-12 15:50:06','2021-07-12 15:50:06'),(159,15,1,'2021-07-12 15:50:59','2021-07-12 15:50:59'),(160,14,1,'2021-07-12 15:50:59','2021-07-12 15:50:59'),(161,15,12,'2021-07-13 15:04:31','2021-07-13 15:04:31'),(162,15,14,'2021-07-13 15:08:05','2021-07-13 15:08:05'),(163,14,14,'2021-07-13 15:08:05','2021-07-13 15:08:05'),(164,15,11,'2021-07-13 15:09:19','2021-07-13 15:09:19'),(165,14,11,'2021-07-13 15:09:19','2021-07-13 15:09:19'),(166,17,35,'2021-07-21 10:09:04','2021-07-21 10:09:04');
/*!40000 ALTER TABLE `t_position_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_privilege`
--

DROP TABLE IF EXISTS `t_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能权限表主键id',
  `type` tinyint(4) NOT NULL COMMENT '1.菜单 2.功能点',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由name 英文关键字',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '路由path/type=3为API接口',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级key',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `parent_key` (`parent_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_privilege`
--

LOCK TABLES `t_privilege` WRITE;
/*!40000 ALTER TABLE `t_privilege` DISABLE KEYS */;
INSERT INTO `t_privilege` VALUES (127,1,'业务功能','Business','/business',0,NULL,'2025-11-27 16:08:18','2021-06-03 14:49:05'),(146,1,'系统设置','System','/system',5,NULL,'2025-11-27 16:08:18','2021-06-03 14:49:05'),(147,1,'人员管理','Employee','/employee',6,'System','2025-11-27 16:08:18','2021-06-03 14:49:05'),(148,1,'角色管理','RoleManage','/employee/role',8,'Employee','2025-11-27 16:08:18','2021-06-03 14:49:05'),(150,1,'用户管理','RoleEmployeeManage','/employee/role-employee-manage',7,'Employee','2025-11-27 16:08:18','2021-06-03 14:49:05'),(153,1,'用户日志','UserLog','/user-log',10,'System','2025-11-27 16:08:18','2021-06-03 14:49:05'),(154,1,'用户操作日志','UserOperateLog','/user-log/user-operate-log',11,'UserLog','2025-11-27 16:08:18','2021-06-03 14:49:05'),(155,1,'用户登录日志','UserLoginLog','/user-log/user-login-log',12,'UserLog','2025-11-27 16:08:18','2021-06-03 14:49:05'),(156,1,'系统设置','SystemSetting','/system-setting',13,'System','2025-11-27 16:08:18','2021-06-03 14:49:05'),(157,1,'系统参数','SystemConfig','/system-setting/system-config',14,'SystemSetting','2025-11-27 16:08:18','2021-06-03 14:49:05'),(158,1,'菜单设置','SystemPrivilege','/system-setting/system-privilege',15,'SystemSetting','2025-11-27 16:08:18','2021-06-03 14:49:05'),(188,1,'访校申请记录','VisitorsRecordList','/visitors-record/visitors-record-list',2,'Reviewer','2025-11-27 16:08:18','2021-07-07 15:23:33'),(189,2,'编辑','privilege-main-update','',1,'SystemPrivilege','2021-07-07 15:23:42','2021-07-07 15:23:42'),(190,2,'批量保存功能点','privilege-batch-save-points','',2,'SystemPrivilege','2021-07-07 15:23:42','2021-07-07 15:23:42'),(191,2,'查询','privilege-main-search','',3,'SystemPrivilege','2021-07-07 15:23:42','2021-07-07 15:23:42'),(198,2,'查询系统参数','system-params-search','',1,'SystemConfig','2021-07-07 15:24:06','2021-07-07 15:24:06'),(199,2,'添加系统参数','system-params-add','',2,'SystemConfig','2021-07-07 15:24:06','2021-07-07 15:24:06'),(200,2,'修改系统参数','system-config-update','',3,'SystemConfig','2021-07-07 15:24:06','2021-07-07 15:24:06'),(201,2,'搜索系统参数','system-config-search','',4,'SystemConfig','2021-07-07 15:24:06','2021-07-07 15:24:06'),(202,2,'查询','user-operate-log-search','',1,'UserOperateLog','2021-07-07 15:24:12','2021-07-07 15:24:12'),(203,2,'详情','user-operate-log-detail','',2,'UserOperateLog','2021-07-07 15:24:12','2021-07-07 15:24:12'),(204,2,'删除','user-operate-log-delete','',3,'UserOperateLog','2021-07-07 15:24:12','2021-07-07 15:24:12'),(205,2,'查询','user-login-log-search','',1,'UserLoginLog','2021-07-07 15:24:14','2021-07-07 15:24:14'),(206,2,'删除','user-login-log-delete','',2,'UserLoginLog','2021-07-07 15:24:14','2021-07-07 15:24:14'),(217,1,'部门管理','DepartmentList','/department/department-list',9,'Employee','2025-11-27 16:08:18','2021-07-08 19:24:59'),(218,2,'查询','department-list-query','',1,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(219,2,'新增','department-list-add','',2,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(220,2,'编辑','department-list-update','',4,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(221,2,'批量删除','department-list-batch-delete','',5,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(222,2,'批量导出','department-list-batch-export','',6,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(223,2,'导出全部','department-list-export-all','',7,'DepartmentList','2021-07-27 13:56:02','2021-07-08 19:25:00'),(224,2,'添加部门','add-department','',1,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(225,2,'编辑部门','update-department','',2,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(226,2,'删除部门','delete-department','',3,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(227,2,'查询','search-department','',4,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(228,2,'添加成员','add-employee','',5,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(229,2,'编辑成员','update-employee','',6,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(230,2,'禁用','disabled-employee','',7,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(231,2,'批量操作','disabled-employee-batch','',8,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(232,2,'员工角色编辑','update-employee-role','',9,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(233,2,'删除员工','delete-employee','',10,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(234,2,'重置密码','reset-employee-password','',11,'RoleEmployeeManage','2021-07-08 19:43:15','2021-07-08 19:43:15'),(243,1,'访校申请审核','AditManagementList','/auditManagement/auditManagement-list',3,'Reviewer','2025-11-27 16:08:18','2021-07-15 15:45:06'),(244,2,'查询','auditManagement-list-query','',1,'AditManagementList','2021-07-15 15:45:11','2021-07-15 15:45:11'),(245,2,'编辑','auditManagement-list-update','',2,'AditManagementList','2021-07-15 15:45:11','2021-07-15 15:45:11'),(266,2,'添加角色','add-role','',1,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(267,2,'删除角色','delete-role','',2,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(268,2,'编辑角色','update-role','',3,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(269,2,'修改角色权限','update-role-privilege','',4,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(270,2,'添加成员','add-employee-role','',5,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(271,2,'移除成员','delete-employee-role','',6,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(272,2,'批量移除','delete-employee-role-batch','',7,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(273,2,'查询成员','search-employee-list','',8,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(274,2,'查询数据范围','query-data-scope','',9,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(275,2,'更新数据范围','update-data-scope','',10,'RoleManage','2021-07-27 13:55:58','2021-07-27 13:55:58'),(276,2,'设置审核人','department-list-set','',3,'DepartmentList','2025-11-27 16:02:46','2021-07-27 13:56:02'),(299,2,'查询','visitors-record-list-query','',1,'VisitorsRecordList','2021-08-16 14:17:32','2021-08-16 13:57:45'),(300,1,'访客管理','Reviewer','/reviewer',1,'Business','2025-11-27 16:08:18','2021-08-16 14:08:50'),(315,2,'批量导出','visitor-list-batch-export','',2,'VisitorsRecordList','2021-08-16 14:17:32','2021-08-16 14:17:32'),(323,1,'访客统计','VisitorsCount','/visitors-count',4,'Business','2025-11-27 16:08:18','2021-11-21 17:19:05');
/*!40000 ALTER TABLE `t_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_quartz_task`
--

DROP TABLE IF EXISTS `t_quartz_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_quartz_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_bean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'spring bean名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `task_cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行cron表达式',
  `task_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务状态0:正常，1:暂停',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_quartz_task`
--

LOCK TABLES `t_quartz_task` WRITE;
/*!40000 ALTER TABLE `t_quartz_task` DISABLE KEYS */;
INSERT INTO `t_quartz_task` VALUES (9,'2312332','exampleTask','21314','*/5 * * * * ?',1,NULL,'2019-09-06 14:41:55','2019-04-19 15:24:26'),(13,'567','exampleTask','ads','*/5 * * * * ?',1,NULL,'2019-09-04 16:37:25','2019-04-23 15:32:17'),(21,'11','exampleTask','11','*/5 * * * * ?',1,NULL,'2019-09-04 16:37:30','2019-04-26 17:29:21'),(22,'33','exampleTask','333','*/5 * * * * ?',1,NULL,'2019-04-26 17:29:36','2019-04-26 17:29:36'),(23,'1','exampleTask','3','*/5 * * * * ?',1,NULL,'2019-09-05 17:21:12','2019-04-26 17:29:50');
/*!40000 ALTER TABLE `t_quartz_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_quartz_task_log`
--

DROP TABLE IF EXISTS `t_quartz_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_quartz_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `process_status` tinyint(4) NOT NULL COMMENT '任务处理状态0:成功，1:失败',
  `process_duration` bigint(20) NOT NULL DEFAULT '0' COMMENT '运行时长',
  `process_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '日志',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运行主机ip',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_quartz_task_log`
--

LOCK TABLES `t_quartz_task_log` WRITE;
/*!40000 ALTER TABLE `t_quartz_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_quartz_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reload_item`
--

DROP TABLE IF EXISTS `t_reload_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_reload_item` (
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项名称',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数 可选',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行标识',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reload_item`
--

LOCK TABLES `t_reload_item` WRITE;
/*!40000 ALTER TABLE `t_reload_item` DISABLE KEYS */;
INSERT INTO `t_reload_item` VALUES ('system_config','','xxxx','2021-02-09 09:36:23','2019-04-18 11:48:27');
/*!40000 ALTER TABLE `t_reload_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reload_result`
--

DROP TABLE IF EXISTS `t_reload_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_reload_result` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行标识',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` tinyint(3) unsigned NOT NULL COMMENT '是否成功 ',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reload_result`
--

LOCK TABLES `t_reload_result` WRITE;
/*!40000 ALTER TABLE `t_reload_result` DISABLE KEYS */;
INSERT INTO `t_reload_result` VALUES ('system_config','23','',1,NULL,'2019-09-07 17:26:04'),('system_config','23','',1,NULL,'2019-09-07 17:28:16'),('system_config','23','',1,NULL,'2019-09-07 17:35:39'),('system_config','23','',1,NULL,'2019-09-07 17:42:58'),('system_config','23','',1,NULL,'2019-09-09 08:30:13'),('system_config','23','',1,NULL,'2019-09-11 10:38:19'),('system_config','23','',1,NULL,'2019-09-11 10:42:46'),('system_config','23','',1,NULL,'2019-09-11 10:49:27'),('system_config','23','',1,NULL,'2019-09-11 11:09:10'),('system_config','23','',1,NULL,'2019-09-11 11:10:06'),('system_config','23','',1,NULL,'2019-09-11 11:18:17'),('system_config','23','',1,NULL,'2019-09-11 11:41:18'),('system_config','23','',1,NULL,'2019-09-11 11:45:41'),('system_config','23','',1,NULL,'2019-09-11 11:46:37'),('system_config','23','',1,NULL,'2019-09-11 11:50:35'),('system_config','23','',1,NULL,'2019-09-11 14:55:00'),('system_config','23','',1,NULL,'2019-09-11 15:26:19'),('system_config','23','',1,NULL,'2019-09-11 15:35:51'),('system_config','23','',1,NULL,'2019-09-11 15:36:19'),('system_config','23','',1,NULL,'2019-09-11 15:36:53'),('system_config','23','',1,NULL,'2019-09-11 15:37:58'),('system_config','23','',1,NULL,'2019-09-11 15:41:37'),('system_config','23','',1,NULL,'2019-09-16 10:12:29'),('system_config','23','',1,NULL,'2019-09-20 17:14:08'),('system_config','23','',1,NULL,'2019-09-20 17:18:24'),('system_config','23','',1,NULL,'2019-09-20 17:23:07'),('system_config','23','',1,NULL,'2019-09-20 17:24:17'),('system_config','23','',1,NULL,'2019-09-20 17:30:17'),('system_config','23','',1,NULL,'2019-09-20 17:31:40'),('system_config','23','',1,NULL,'2019-09-20 17:32:34'),('system_config','23','',1,NULL,'2019-09-20 17:52:31'),('system_config','23','',1,NULL,'2019-09-20 17:55:10'),('system_config','23','',1,NULL,'2019-09-20 17:55:47'),('system_config','23','',1,NULL,'2019-09-20 17:58:49'),('system_config','23','',1,NULL,'2019-09-21 10:53:47'),('system_config','23','',1,NULL,'2019-09-22 18:24:21'),('system_config','23','',1,NULL,'2019-09-24 09:04:42'),('system_config','23','',1,NULL,'2019-10-15 11:06:12'),('system_config','23','',1,NULL,'2019-10-15 11:22:10'),('system_config','23','',1,NULL,'2019-10-15 16:42:16'),('system_config','23','',1,NULL,'2019-10-19 15:18:54'),('system_config','23','',1,NULL,'2019-10-19 16:50:10'),('system_config','23','',1,NULL,'2019-10-21 15:52:25'),('system_config','23','',1,NULL,'2019-10-23 10:24:38'),('system_config','23','',1,NULL,'2019-10-23 10:28:45'),('system_config','23','',1,NULL,'2019-10-23 16:35:45'),('system_config','23','',1,NULL,'2019-10-23 16:38:48'),('system_config','23','',1,NULL,'2019-10-25 08:52:22'),('system_config','23','',1,NULL,'2019-10-28 16:04:30'),('system_config','23','',1,NULL,'2019-10-30 19:59:24'),('system_config','23','',1,NULL,'2019-10-31 14:29:26'),('system_config','23','',1,NULL,'2019-10-31 14:35:38'),('system_config','23','',1,NULL,'2019-10-31 15:58:39'),('system_config','23','',1,NULL,'2019-10-31 17:34:48'),('system_config','23','',1,NULL,'2019-11-01 11:23:26'),('system_config','23','',1,NULL,'2019-11-01 14:55:34'),('system_config','23','',1,NULL,'2019-11-02 08:49:44'),('system_config','23','',1,NULL,'2019-11-02 09:40:52'),('system_config','23','',1,NULL,'2019-11-02 09:42:48'),('system_config','23','',1,NULL,'2019-11-02 09:47:38'),('system_config','23','',1,NULL,'2019-11-02 09:50:57'),('system_config','23','',1,NULL,'2019-11-02 09:51:32'),('system_config','23','',1,NULL,'2019-11-02 09:51:48'),('system_config','23','',1,NULL,'2019-11-02 15:48:21'),('system_config','23','',1,NULL,'2019-11-02 20:48:44'),('system_config','23','',1,NULL,'2019-11-02 21:27:50'),('system_config','23','',1,NULL,'2019-11-03 22:10:32'),('system_config','23','',1,NULL,'2019-11-03 22:10:32'),('system_config','23','',1,NULL,'2019-11-04 09:10:24'),('system_config','23','4234234',1,NULL,'2019-11-05 10:24:51'),('system_config','23','4234234',1,NULL,'2019-11-06 11:22:42'),('system_config','23','4234234',1,NULL,'2019-11-06 11:25:54'),('system_config','23','4234234',1,NULL,'2019-11-06 11:27:04'),('system_config','23','4234234',1,NULL,'2019-11-06 11:28:00'),('system_config','23','4234234',1,NULL,'2019-11-06 11:34:06'),('system_config','23','4234234',1,NULL,'2019-11-06 11:34:43'),('system_config','23','4234234',1,NULL,'2019-11-06 11:53:11'),('system_config','23','4234234',1,NULL,'2019-11-06 11:56:05'),('system_config','23','4234234',1,NULL,'2019-11-06 13:52:39'),('system_config','23','4234234',1,NULL,'2019-11-06 15:29:29'),('system_config','23','4234234',1,NULL,'2019-11-06 16:05:36'),('system_config','23','4234234',1,NULL,'2019-11-06 16:06:13'),('system_config','23','4234234',1,NULL,'2019-11-06 16:13:22'),('system_config','23','4234234',1,NULL,'2019-11-06 16:19:38'),('system_config','23','4234234',1,NULL,'2019-11-06 16:21:37'),('system_config','23','4234234',1,NULL,'2019-11-06 16:22:23'),('system_config','23','4234234',1,NULL,'2019-11-08 08:50:08'),('system_config','23','4234234',1,NULL,'2019-11-08 13:37:34'),('system_config','23','4234234',1,NULL,'2019-11-09 08:35:08'),('system_config','23','4234234',1,NULL,'2019-11-09 08:54:38'),('system_config','23','4234234',1,NULL,'2019-11-09 09:00:32'),('system_config','23','4234234',1,NULL,'2019-11-09 09:01:24'),('system_config','23','4234234',1,NULL,'2019-11-09 09:24:16'),('system_config','23','4234234',1,NULL,'2019-11-09 09:26:46'),('system_config','23','4234234',1,NULL,'2019-11-09 09:43:13'),('system_config','23','4234234',1,NULL,'2019-11-09 09:44:48'),('system_config','23','4234234',1,NULL,'2019-11-09 10:28:30'),('system_config','23','4234234',1,NULL,'2019-11-09 11:24:19'),('system_config','23','4234234',1,NULL,'2019-11-11 09:40:42'),('system_config','23','4234234',1,NULL,'2019-11-13 17:25:42'),('system_config','23343','2423',1,NULL,'2019-11-13 20:29:19'),('system_config','23343','2423',1,NULL,'2019-11-13 20:29:23'),('system_config','23343','234',1,NULL,'2019-11-14 11:43:57'),('system_config','23343','234',1,NULL,'2019-11-14 11:50:18'),('system_config','23343','234',1,NULL,'2019-11-14 11:51:13'),('system_config','23343','234',1,NULL,'2019-11-14 11:52:03'),('system_config','23343','234',1,NULL,'2019-11-14 11:53:02'),('system_config','23343','234',1,NULL,'2019-11-14 13:49:11'),('system_config','23343','234',1,NULL,'2019-11-14 13:51:05'),('system_config','23343','234',1,NULL,'2019-11-14 13:53:53'),('system_config','23343','234',1,NULL,'2019-11-14 13:55:57'),('system_config','23343','234',1,NULL,'2019-11-14 16:15:44'),('system_config','23343','234',1,NULL,'2019-11-14 16:39:36'),('system_config','23343234234','234',1,NULL,'2019-11-14 16:41:05'),('system_config','23343234234','234',1,NULL,'2019-11-14 16:41:05'),('system_config','aaaa','234',1,NULL,'2019-11-14 16:41:20'),('system_config','aaaa','234',1,NULL,'2019-11-14 16:41:25'),('system_config','111','234',1,NULL,'2019-11-14 16:43:20'),('system_config','111','234',1,NULL,'2019-11-14 16:44:13'),('system_config','xxxx','234',1,NULL,'2019-11-14 16:46:26'),('system_config','xxxx','234',1,NULL,'2019-11-14 16:46:39'),('system_config','xxxx','234',1,NULL,'2019-11-14 16:48:47'),('system_config','xxxx','234',1,NULL,'2019-11-15 14:39:55'),('system_config','xxxx','234',1,NULL,'2019-11-16 08:47:43'),('system_config','xxxx','234',1,NULL,'2019-11-16 17:12:10'),('system_config','xxxx','234',1,NULL,'2019-11-16 18:02:57'),('system_config','xxxx','234',1,NULL,'2020-12-14 15:09:53'),('system_config','xxxx','234',1,NULL,'2020-12-14 15:13:33'),('system_config','xxxx','234',1,NULL,'2020-12-14 15:14:09'),('system_config','xxxx','234',1,NULL,'2020-12-14 15:16:23'),('system_config','xxxx','234',1,NULL,'2021-02-09 14:32:59'),('system_config','xxxx','234',1,NULL,'2021-02-09 14:34:58'),('system_config','xxxx','234',1,NULL,'2021-02-09 16:12:55'),('system_config','xxxx','234',1,NULL,'2021-02-09 17:31:42'),('system_config','xxxx','234',1,NULL,'2021-02-09 17:34:10'),('system_config','xxxx','',1,NULL,'2021-02-10 09:08:24'),('system_config','xxxx','',1,NULL,'2021-02-18 09:12:03'),('system_config','xxxx','',1,NULL,'2021-04-10 19:45:05'),('system_config','xxxx','',1,NULL,'2021-04-10 19:47:21'),('system_config','xxxx','',1,NULL,'2021-06-01 17:07:09'),('system_config','xxxx','',1,NULL,'2021-06-01 17:11:08'),('system_config','xxxx','',1,NULL,'2021-06-01 17:11:12'),('system_config','xxxx','',1,NULL,'2021-06-03 10:33:43'),('system_config','xxxx','',1,NULL,'2021-06-03 11:55:26'),('system_config','xxxx','',1,NULL,'2021-06-03 11:58:45'),('system_config','xxxx','',1,NULL,'2021-06-03 13:43:49'),('system_config','xxxx','',1,NULL,'2021-06-03 14:13:09'),('system_config','xxxx','',1,NULL,'2021-06-03 15:23:21'),('system_config','xxxx','',1,NULL,'2021-06-03 15:45:43'),('system_config','xxxx','',1,NULL,'2021-06-03 16:25:50'),('system_config','xxxx','',1,NULL,'2021-06-03 16:28:14'),('system_config','xxxx','',1,NULL,'2021-06-03 16:32:43'),('system_config','xxxx','',1,NULL,'2021-06-03 16:48:16'),('system_config','xxxx','',1,NULL,'2021-06-03 17:15:39'),('system_config','xxxx','',1,NULL,'2021-06-03 17:46:49'),('system_config','xxxx','',1,NULL,'2021-06-04 09:38:26'),('system_config','xxxx','',1,NULL,'2021-06-04 10:12:16'),('system_config','xxxx','',1,NULL,'2021-06-04 10:17:20'),('system_config','xxxx','',1,NULL,'2021-06-04 10:23:47'),('system_config','xxxx','',1,NULL,'2021-06-04 10:34:15'),('system_config','xxxx','',1,NULL,'2021-06-04 10:35:24'),('system_config','xxxx','',1,NULL,'2021-06-04 16:31:48'),('system_config','xxxx','',1,NULL,'2021-06-06 14:22:11'),('system_config','xxxx','',1,NULL,'2021-06-06 14:55:22'),('system_config','xxxx','',1,NULL,'2021-06-06 15:11:48'),('system_config','xxxx','',1,NULL,'2021-06-06 17:35:11'),('system_config','xxxx','',1,NULL,'2021-06-06 17:55:13'),('system_config','xxxx','',1,NULL,'2021-06-06 17:56:05'),('system_config','xxxx','',1,NULL,'2021-06-06 17:56:55'),('system_config','xxxx','',1,NULL,'2021-06-06 18:28:48'),('system_config','xxxx','',1,NULL,'2021-06-06 18:30:19'),('system_config','xxxx','',1,NULL,'2021-06-06 20:04:40'),('system_config','xxxx','',1,NULL,'2021-06-06 20:08:50'),('system_config','xxxx','',1,NULL,'2021-06-06 20:10:37'),('system_config','xxxx','',1,NULL,'2021-06-06 20:15:45'),('system_config','xxxx','',1,NULL,'2021-06-06 20:16:57'),('system_config','xxxx','',1,NULL,'2021-06-06 20:18:36'),('system_config','xxxx','',1,NULL,'2021-06-06 20:19:24'),('system_config','xxxx','',1,NULL,'2021-06-06 20:21:40'),('system_config','xxxx','',1,NULL,'2021-06-06 20:23:44'),('system_config','xxxx','',1,NULL,'2021-06-06 20:25:35'),('system_config','xxxx','',1,NULL,'2021-06-06 20:27:25'),('system_config','xxxx','',1,NULL,'2021-06-06 20:41:51'),('system_config','xxxx','',1,NULL,'2021-06-06 20:53:22'),('system_config','xxxx','',1,NULL,'2021-06-06 21:00:57'),('system_config','xxxx','',1,NULL,'2021-06-06 21:55:17'),('system_config','xxxx','',1,NULL,'2021-06-06 23:20:10'),('system_config','xxxx','',1,NULL,'2021-06-06 23:32:19'),('system_config','xxxx','',1,NULL,'2021-06-06 23:35:47'),('system_config','xxxx','',1,NULL,'2021-06-07 00:38:42'),('system_config','xxxx','',1,NULL,'2021-06-07 11:15:34'),('system_config','xxxx','',1,NULL,'2021-06-07 14:40:28'),('system_config','xxxx','',1,NULL,'2021-06-07 15:12:39'),('system_config','xxxx','',1,NULL,'2021-06-07 15:53:32'),('system_config','xxxx','',1,NULL,'2021-06-07 15:55:29'),('system_config','xxxx','',1,NULL,'2021-06-07 15:58:26'),('system_config','xxxx','',1,NULL,'2021-06-07 16:03:02'),('system_config','xxxx','',1,NULL,'2021-06-07 16:04:15'),('system_config','xxxx','',1,NULL,'2021-06-07 16:05:05'),('system_config','xxxx','',1,NULL,'2021-06-07 16:06:35'),('system_config','xxxx','',1,NULL,'2021-06-07 17:04:27'),('system_config','xxxx','',1,NULL,'2021-06-11 11:43:10'),('system_config','xxxx','',0,'No registered reload handler was found','2021-06-17 10:13:56'),('system_config','xxxx','',1,NULL,'2021-06-17 10:23:44'),('system_config','xxxx','',1,NULL,'2021-06-17 10:48:00'),('system_config','xxxx','',1,NULL,'2021-06-17 10:50:59'),('system_config','xxxx','',1,NULL,'2021-07-05 11:44:29'),('system_config','xxxx','',1,NULL,'2021-07-05 12:02:09'),('system_config','xxxx','',1,NULL,'2021-07-05 14:03:33'),('system_config','xxxx','',1,NULL,'2021-07-05 14:30:17'),('system_config','xxxx','',1,NULL,'2021-07-05 14:50:02'),('system_config','xxxx','',1,NULL,'2021-07-06 10:27:33'),('system_config','xxxx','',1,NULL,'2021-07-06 10:28:25'),('system_config','xxxx','',1,NULL,'2021-07-06 10:48:41'),('system_config','xxxx','',1,NULL,'2021-07-06 12:36:23'),('system_config','xxxx','',1,NULL,'2021-07-06 13:33:06'),('system_config','xxxx','',1,NULL,'2021-07-06 15:22:20'),('system_config','xxxx','',1,NULL,'2021-07-06 15:30:13'),('system_config','xxxx','',1,NULL,'2021-07-06 15:40:54'),('system_config','xxxx','',1,NULL,'2021-07-06 15:41:44'),('system_config','xxxx','',1,NULL,'2021-07-06 16:03:35'),('system_config','xxxx','',1,NULL,'2021-07-06 16:11:42'),('system_config','xxxx','',1,NULL,'2021-07-06 16:26:15'),('system_config','xxxx','',1,NULL,'2021-07-06 16:41:39'),('system_config','xxxx','',1,NULL,'2021-07-06 16:51:33'),('system_config','xxxx','',1,NULL,'2021-07-06 17:46:02'),('system_config','xxxx','',1,NULL,'2021-07-06 19:26:51'),('system_config','xxxx','',1,NULL,'2021-07-06 19:29:21'),('system_config','xxxx','',1,NULL,'2021-07-07 08:55:53'),('system_config','xxxx','',1,NULL,'2021-07-07 08:58:49'),('system_config','xxxx','',1,NULL,'2021-07-07 09:44:43'),('system_config','xxxx','',1,NULL,'2021-07-07 13:13:39'),('system_config','xxxx','',1,NULL,'2021-07-07 13:41:11'),('system_config','xxxx','',1,NULL,'2021-07-07 14:08:10'),('system_config','xxxx','',1,NULL,'2021-07-07 14:22:20'),('system_config','xxxx','',1,NULL,'2021-07-07 14:29:47'),('system_config','xxxx','',1,NULL,'2021-07-07 15:11:55'),('system_config','xxxx','',1,NULL,'2021-07-07 15:33:52'),('system_config','xxxx','',1,NULL,'2021-07-07 15:40:25'),('system_config','xxxx','',1,NULL,'2021-07-07 16:38:57'),('system_config','xxxx','',1,NULL,'2021-07-07 17:53:30'),('system_config','xxxx','',1,NULL,'2021-07-08 09:00:46'),('system_config','xxxx','',1,NULL,'2021-07-08 09:57:30'),('system_config','xxxx','',1,NULL,'2021-07-08 11:34:14'),('system_config','xxxx','',1,NULL,'2021-07-08 12:51:00'),('system_config','xxxx','',1,NULL,'2021-07-08 15:17:31'),('system_config','xxxx','',1,NULL,'2021-07-08 15:42:00'),('system_config','xxxx','',1,NULL,'2021-07-08 15:45:00'),('system_config','xxxx','',1,NULL,'2021-07-08 15:56:01'),('system_config','xxxx','',1,NULL,'2021-07-08 16:21:24'),('system_config','xxxx','',1,NULL,'2021-07-08 16:24:01'),('system_config','xxxx','',1,NULL,'2021-07-08 16:26:06'),('system_config','xxxx','',1,NULL,'2021-07-08 16:55:55'),('system_config','xxxx','',1,NULL,'2021-07-08 17:07:48'),('system_config','xxxx','',1,NULL,'2021-07-08 18:30:56'),('system_config','xxxx','',1,NULL,'2021-07-08 19:20:52'),('system_config','xxxx','',1,NULL,'2021-07-08 19:48:15'),('system_config','xxxx','',1,NULL,'2021-07-08 20:03:19'),('system_config','xxxx','',1,NULL,'2021-07-08 20:31:58'),('system_config','xxxx','',1,NULL,'2021-07-08 20:40:16'),('system_config','xxxx','',1,NULL,'2021-07-08 20:46:08'),('system_config','xxxx','',1,NULL,'2021-07-08 20:51:44'),('system_config','xxxx','',1,NULL,'2021-07-09 09:12:34'),('system_config','xxxx','',1,NULL,'2021-07-09 11:53:53'),('system_config','xxxx','',1,NULL,'2021-07-09 12:00:28'),('system_config','xxxx','',1,NULL,'2021-07-09 13:13:59'),('system_config','xxxx','',1,NULL,'2021-07-09 13:53:19'),('system_config','xxxx','',1,NULL,'2021-07-09 14:24:00'),('system_config','xxxx','',1,NULL,'2021-07-09 14:27:28'),('system_config','xxxx','',1,NULL,'2021-07-09 14:47:15'),('system_config','xxxx','',1,NULL,'2021-07-09 15:01:12'),('system_config','xxxx','',1,NULL,'2021-07-09 15:03:14'),('system_config','xxxx','',1,NULL,'2021-07-09 15:04:08'),('system_config','xxxx','',1,NULL,'2021-07-09 15:05:36'),('system_config','xxxx','',1,NULL,'2021-07-09 15:08:55'),('system_config','xxxx','',1,NULL,'2021-07-09 16:10:36'),('system_config','xxxx','',1,NULL,'2021-07-09 17:42:56'),('system_config','xxxx','',1,NULL,'2021-07-09 17:45:06'),('system_config','xxxx','',1,NULL,'2021-07-10 15:19:20'),('system_config','xxxx','',1,NULL,'2021-07-12 09:13:11'),('system_config','xxxx','',1,NULL,'2021-07-12 09:43:00'),('system_config','xxxx','',1,NULL,'2021-07-12 09:58:11'),('system_config','xxxx','',1,NULL,'2021-07-12 13:21:21'),('system_config','xxxx','',1,NULL,'2021-07-12 15:47:05'),('system_config','xxxx','',1,NULL,'2021-07-12 16:10:09'),('system_config','xxxx','',1,NULL,'2021-07-12 16:36:31'),('system_config','xxxx','',1,NULL,'2021-07-12 16:37:45'),('system_config','xxxx','',1,NULL,'2021-07-12 16:39:07'),('system_config','xxxx','',1,NULL,'2021-07-12 16:42:33'),('system_config','xxxx','',1,NULL,'2021-07-12 16:47:05'),('system_config','xxxx','',1,NULL,'2021-07-12 18:29:51'),('system_config','xxxx','',1,NULL,'2021-07-12 18:36:38'),('system_config','xxxx','',1,NULL,'2021-07-12 19:51:48'),('system_config','xxxx','',1,NULL,'2021-07-12 19:56:24'),('system_config','xxxx','',1,NULL,'2021-07-12 20:00:42'),('system_config','xxxx','',1,NULL,'2021-07-12 20:04:58'),('system_config','xxxx','',1,NULL,'2021-07-12 20:09:14'),('system_config','xxxx','',1,NULL,'2021-07-12 20:15:20'),('system_config','xxxx','',1,NULL,'2021-07-12 20:19:04'),('system_config','xxxx','',1,NULL,'2021-07-12 20:23:06'),('system_config','xxxx','',1,NULL,'2021-07-12 20:24:19'),('system_config','xxxx','',1,NULL,'2021-07-12 20:34:18'),('system_config','xxxx','',1,NULL,'2021-07-12 20:38:12'),('system_config','xxxx','',1,NULL,'2021-07-13 08:57:59'),('system_config','xxxx','',1,NULL,'2021-07-13 09:04:32'),('system_config','xxxx','',1,NULL,'2021-07-13 09:44:00'),('system_config','xxxx','',1,NULL,'2021-07-13 09:46:27'),('system_config','xxxx','',1,NULL,'2021-07-13 09:52:58'),('system_config','xxxx','',1,NULL,'2021-07-13 09:59:26'),('system_config','xxxx','',1,NULL,'2021-07-13 10:00:18'),('system_config','xxxx','',1,NULL,'2021-07-13 10:01:32'),('system_config','xxxx','',1,NULL,'2021-07-13 10:03:54'),('system_config','xxxx','',1,NULL,'2021-07-13 10:07:01'),('system_config','xxxx','',1,NULL,'2021-07-13 11:05:11'),('system_config','xxxx','',1,NULL,'2021-07-13 14:57:42'),('system_config','xxxx','',1,NULL,'2021-07-13 15:41:39'),('system_config','xxxx','',1,NULL,'2021-07-13 15:44:27'),('system_config','xxxx','',1,NULL,'2021-07-13 15:47:25'),('system_config','xxxx','',1,NULL,'2021-07-13 15:49:43'),('system_config','xxxx','',1,NULL,'2021-07-13 15:51:40'),('system_config','xxxx','',1,NULL,'2021-07-13 15:52:40'),('system_config','xxxx','',1,NULL,'2021-07-13 15:55:19'),('system_config','xxxx','',1,NULL,'2021-07-13 15:56:54'),('system_config','xxxx','',1,NULL,'2021-07-13 15:59:01'),('system_config','xxxx','',1,NULL,'2021-07-13 16:00:29'),('system_config','xxxx','',1,NULL,'2021-07-13 16:29:40'),('system_config','xxxx','',1,NULL,'2021-07-14 09:10:15'),('system_config','xxxx','',1,NULL,'2021-07-14 10:51:31'),('system_config','xxxx','',1,NULL,'2021-07-14 10:59:18'),('system_config','xxxx','',1,NULL,'2021-07-14 11:01:43'),('system_config','xxxx','',1,NULL,'2021-07-14 11:27:20'),('system_config','xxxx','',1,NULL,'2021-07-14 11:30:01'),('system_config','xxxx','',1,NULL,'2021-07-14 13:01:58'),('system_config','xxxx','',1,NULL,'2021-07-14 14:12:39'),('system_config','xxxx','',1,NULL,'2021-07-14 17:16:27'),('system_config','xxxx','',1,NULL,'2021-07-14 17:29:40'),('system_config','xxxx','',1,NULL,'2021-07-14 18:12:09'),('system_config','xxxx','',1,NULL,'2021-07-14 18:31:02'),('system_config','xxxx','',1,NULL,'2021-07-14 18:47:07'),('system_config','xxxx','',1,NULL,'2021-07-15 09:25:14'),('system_config','xxxx','',1,NULL,'2021-07-15 10:07:49'),('system_config','xxxx','',1,NULL,'2021-07-15 10:25:52'),('system_config','xxxx','',1,NULL,'2021-07-15 10:36:20'),('system_config','xxxx','',1,NULL,'2021-07-15 11:07:55'),('system_config','xxxx','',1,NULL,'2021-07-15 11:12:27'),('system_config','xxxx','',1,NULL,'2021-07-15 11:29:25'),('system_config','xxxx','',1,NULL,'2021-07-15 12:16:09'),('system_config','xxxx','',1,NULL,'2021-07-15 12:20:30'),('system_config','xxxx','',1,NULL,'2021-07-15 13:17:00'),('system_config','xxxx','',1,NULL,'2021-07-15 13:32:14'),('system_config','xxxx','',1,NULL,'2021-07-15 13:35:16'),('system_config','xxxx','',1,NULL,'2021-07-15 13:36:03'),('system_config','xxxx','',1,NULL,'2021-07-15 13:40:43'),('system_config','xxxx','',1,NULL,'2021-07-15 13:45:26'),('system_config','xxxx','',1,NULL,'2021-07-15 14:24:37'),('system_config','xxxx','',1,NULL,'2021-07-15 14:42:54'),('system_config','xxxx','',1,NULL,'2021-07-15 16:41:10'),('system_config','xxxx','',1,NULL,'2021-07-15 17:16:32'),('system_config','xxxx','',1,NULL,'2021-07-15 17:25:49'),('system_config','xxxx','',1,NULL,'2021-07-15 17:37:34'),('system_config','xxxx','',1,NULL,'2021-07-15 17:42:31'),('system_config','xxxx','',1,NULL,'2021-07-16 09:10:04'),('system_config','xxxx','',1,NULL,'2021-07-16 09:53:44'),('system_config','xxxx','',1,NULL,'2021-07-16 11:37:01'),('system_config','xxxx','',1,NULL,'2021-07-16 11:51:14'),('system_config','xxxx','',1,NULL,'2021-07-16 12:07:48'),('system_config','xxxx','',1,NULL,'2021-07-16 12:34:48'),('system_config','xxxx','',1,NULL,'2021-07-16 12:50:44'),('system_config','xxxx','',1,NULL,'2021-07-16 12:53:25'),('system_config','xxxx','',1,NULL,'2021-07-16 13:56:14'),('system_config','xxxx','',1,NULL,'2021-07-16 16:37:08'),('system_config','xxxx','',1,NULL,'2021-07-16 17:00:24'),('system_config','xxxx','',1,NULL,'2021-07-16 17:22:25'),('system_config','xxxx','',1,NULL,'2021-07-16 17:24:32'),('system_config','xxxx','',1,NULL,'2021-07-19 09:25:21'),('system_config','xxxx','',1,NULL,'2021-07-19 09:27:36'),('system_config','xxxx','',1,NULL,'2021-07-19 10:06:19'),('system_config','xxxx','',1,NULL,'2021-07-19 10:54:30'),('system_config','xxxx','',1,NULL,'2021-07-19 16:43:13'),('system_config','xxxx','',1,NULL,'2021-07-20 09:52:10'),('system_config','xxxx','',1,NULL,'2021-07-20 10:28:18'),('system_config','xxxx','',1,NULL,'2021-07-20 11:07:13'),('system_config','xxxx','',1,NULL,'2021-07-20 13:40:24'),('system_config','xxxx','',1,NULL,'2021-07-20 14:20:13'),('system_config','xxxx','',1,NULL,'2021-07-20 14:25:30'),('system_config','xxxx','',1,NULL,'2021-07-20 14:39:56'),('system_config','xxxx','',1,NULL,'2021-07-20 15:15:08'),('system_config','xxxx','',1,NULL,'2021-07-20 15:38:26'),('system_config','xxxx','',1,NULL,'2021-07-20 16:09:10'),('system_config','xxxx','',1,NULL,'2021-07-20 16:14:34'),('system_config','xxxx','',1,NULL,'2021-07-20 16:46:04'),('system_config','xxxx','',1,NULL,'2021-07-20 17:14:42'),('system_config','xxxx','',1,NULL,'2021-07-21 09:06:20'),('system_config','xxxx','',1,NULL,'2021-07-21 10:17:25'),('system_config','xxxx','',1,NULL,'2021-07-21 10:18:18'),('system_config','xxxx','',1,NULL,'2021-07-21 10:46:02'),('system_config','xxxx','',1,NULL,'2021-07-21 11:05:40'),('system_config','xxxx','',1,NULL,'2021-07-21 13:22:46'),('system_config','xxxx','',1,NULL,'2021-07-21 13:27:21'),('system_config','xxxx','',1,NULL,'2021-07-21 14:23:35'),('system_config','xxxx','',1,NULL,'2021-07-21 14:27:40'),('system_config','xxxx','',1,NULL,'2021-07-21 14:29:38'),('system_config','xxxx','',1,NULL,'2021-07-21 14:33:58'),('system_config','xxxx','',1,NULL,'2021-07-21 14:36:41'),('system_config','xxxx','',1,NULL,'2021-07-21 14:41:28'),('system_config','xxxx','',1,NULL,'2021-07-21 14:45:47'),('system_config','xxxx','',1,NULL,'2021-07-21 15:07:15'),('system_config','xxxx','',1,NULL,'2021-07-21 15:20:37'),('system_config','xxxx','',1,NULL,'2021-07-21 16:09:32'),('system_config','xxxx','',1,NULL,'2021-07-21 16:10:54'),('system_config','xxxx','',1,NULL,'2021-07-21 16:12:31'),('system_config','xxxx','',1,NULL,'2021-07-21 16:20:39'),('system_config','xxxx','',1,NULL,'2021-07-21 16:23:39'),('system_config','xxxx','',1,NULL,'2021-07-21 16:47:51'),('system_config','xxxx','',1,NULL,'2021-07-22 09:10:18'),('system_config','xxxx','',1,NULL,'2021-07-22 09:24:23'),('system_config','xxxx','',1,NULL,'2021-07-22 10:12:35'),('system_config','xxxx','',1,NULL,'2021-07-22 11:47:07'),('system_config','xxxx','',1,NULL,'2021-07-22 11:48:01'),('system_config','xxxx','',1,NULL,'2021-07-22 13:42:26'),('system_config','xxxx','',1,NULL,'2021-07-22 13:47:31'),('system_config','xxxx','',1,NULL,'2021-07-22 16:15:56'),('system_config','xxxx','',1,NULL,'2021-07-27 08:34:28'),('system_config','xxxx','',1,NULL,'2021-07-27 08:37:27'),('system_config','xxxx','',1,NULL,'2021-07-27 08:38:48'),('system_config','xxxx','',1,NULL,'2021-07-27 08:42:57'),('system_config','xxxx','',1,NULL,'2021-07-27 08:46:46'),('system_config','xxxx','',1,NULL,'2021-07-27 09:08:00'),('system_config','xxxx','',1,NULL,'2021-07-27 09:35:19'),('system_config','xxxx','',1,NULL,'2021-07-27 10:08:35'),('system_config','xxxx','',1,NULL,'2021-07-27 11:11:08'),('system_config','xxxx','',1,NULL,'2021-07-27 11:14:12'),('system_config','xxxx','',1,NULL,'2021-07-27 11:41:26'),('system_config','xxxx','',1,NULL,'2021-07-27 11:42:27'),('system_config','xxxx','',1,NULL,'2021-07-27 11:52:43'),('system_config','xxxx','',1,NULL,'2021-07-27 11:55:58'),('system_config','xxxx','',1,NULL,'2021-07-27 11:57:53'),('system_config','xxxx','',1,NULL,'2021-07-27 12:00:08'),('system_config','xxxx','',1,NULL,'2021-07-27 12:01:04'),('system_config','xxxx','',1,NULL,'2021-07-27 13:48:45'),('system_config','xxxx','',1,NULL,'2021-07-27 14:39:08'),('system_config','xxxx','',1,NULL,'2021-07-27 14:42:58'),('system_config','xxxx','',1,NULL,'2021-07-27 15:55:05'),('system_config','xxxx','',1,NULL,'2021-07-27 16:09:25'),('system_config','xxxx','',1,NULL,'2021-07-27 16:16:53'),('system_config','xxxx','',1,NULL,'2021-07-27 16:22:55'),('system_config','xxxx','',1,NULL,'2021-07-27 16:26:58'),('system_config','xxxx','',1,NULL,'2021-07-27 16:29:58'),('system_config','xxxx','',1,NULL,'2021-07-27 16:36:03'),('system_config','xxxx','',1,NULL,'2021-07-27 16:39:42'),('system_config','xxxx','',1,NULL,'2021-07-27 17:03:35'),('system_config','xxxx','',1,NULL,'2021-07-27 17:05:38'),('system_config','xxxx','',1,NULL,'2021-07-27 05:18:11'),('system_config','xxxx','',1,NULL,'2021-07-27 05:32:15'),('system_config','xxxx','',1,NULL,'2021-08-03 10:44:13'),('system_config','xxxx','',1,NULL,'2021-08-03 13:54:37'),('system_config','xxxx','',1,NULL,'2021-08-03 16:47:04'),('system_config','xxxx','',1,NULL,'2021-08-04 16:03:39'),('system_config','xxxx','',1,NULL,'2021-08-04 16:06:00'),('system_config','xxxx','',1,NULL,'2021-08-04 04:47:23'),('system_config','xxxx','',1,NULL,'2021-08-04 05:05:23'),('system_config','xxxx','',1,NULL,'2021-08-05 11:25:08'),('system_config','xxxx','',1,NULL,'2021-08-11 16:21:09'),('system_config','xxxx','',1,NULL,'2021-08-12 09:11:39'),('system_config','xxxx','',1,NULL,'2021-08-12 09:23:53'),('system_config','xxxx','',1,NULL,'2021-08-12 13:21:28'),('system_config','xxxx','',1,NULL,'2021-08-12 15:48:50'),('system_config','xxxx','',1,NULL,'2021-08-12 16:19:19'),('system_config','xxxx','',1,NULL,'2021-08-12 17:17:23'),('system_config','xxxx','',1,NULL,'2021-08-13 09:03:54'),('system_config','xxxx','',1,NULL,'2021-08-13 10:55:17'),('system_config','xxxx','',1,NULL,'2021-08-13 10:59:08'),('system_config','xxxx','',1,NULL,'2021-08-13 15:06:52'),('system_config','xxxx','',1,NULL,'2021-08-13 15:09:55'),('system_config','xxxx','',1,NULL,'2021-08-13 15:49:46'),('system_config','xxxx','',1,NULL,'2021-08-13 15:52:47'),('system_config','xxxx','',1,NULL,'2021-08-13 15:54:52'),('system_config','xxxx','',1,NULL,'2021-08-16 09:30:34'),('system_config','xxxx','',1,NULL,'2021-08-16 09:59:50'),('system_config','xxxx','',1,NULL,'2021-08-16 10:02:06'),('system_config','xxxx','',1,NULL,'2021-08-16 10:16:46'),('system_config','xxxx','',1,NULL,'2021-08-16 10:19:29'),('system_config','xxxx','',1,NULL,'2021-08-16 10:32:30'),('system_config','xxxx','',1,NULL,'2021-08-16 14:06:12'),('system_config','xxxx','',1,NULL,'2021-08-16 14:09:41'),('system_config','xxxx','',1,NULL,'2021-08-16 14:19:15'),('system_config','xxxx','',1,NULL,'2021-08-16 14:38:45'),('system_config','xxxx','',1,NULL,'2021-08-16 14:39:50'),('system_config','xxxx','',1,NULL,'2021-08-16 16:28:30'),('system_config','xxxx','',1,NULL,'2021-08-16 16:30:33'),('system_config','xxxx','',1,NULL,'2021-08-16 16:31:06'),('system_config','xxxx','',1,NULL,'2021-08-16 16:31:56'),('system_config','xxxx','',1,NULL,'2021-08-16 17:18:16'),('system_config','xxxx','',1,NULL,'2021-08-16 17:23:08'),('system_config','xxxx','',1,NULL,'2021-08-16 17:24:02'),('system_config','xxxx','',1,NULL,'2021-08-16 17:37:24'),('system_config','xxxx','',1,NULL,'2021-08-16 17:38:33'),('system_config','xxxx','',1,NULL,'2021-08-16 17:50:19'),('system_config','xxxx','',1,NULL,'2021-08-17 09:16:52'),('system_config','xxxx','',1,NULL,'2021-08-17 11:56:33'),('system_config','xxxx','',1,NULL,'2021-08-17 13:17:19'),('system_config','xxxx','',1,NULL,'2021-08-17 13:19:13'),('system_config','xxxx','',1,NULL,'2021-08-17 13:22:41'),('system_config','xxxx','',1,NULL,'2021-08-17 13:29:01'),('system_config','xxxx','',1,NULL,'2021-08-17 13:31:16'),('system_config','xxxx','',1,NULL,'2021-08-17 13:35:13'),('system_config','xxxx','',1,NULL,'2021-08-17 13:36:15'),('system_config','xxxx','',1,NULL,'2021-08-17 13:37:17'),('system_config','xxxx','',1,NULL,'2021-08-17 13:42:40'),('system_config','xxxx','',1,NULL,'2021-08-17 13:43:34'),('system_config','xxxx','',1,NULL,'2021-08-17 13:45:32'),('system_config','xxxx','',1,NULL,'2021-08-17 13:46:11'),('system_config','xxxx','',1,NULL,'2021-08-17 13:51:42'),('system_config','xxxx','',1,NULL,'2021-08-17 13:54:03'),('system_config','xxxx','',1,NULL,'2021-08-17 13:56:31'),('system_config','xxxx','',1,NULL,'2021-08-17 13:58:44'),('system_config','xxxx','',1,NULL,'2021-08-17 14:00:40'),('system_config','xxxx','',1,NULL,'2021-08-17 14:01:46'),('system_config','xxxx','',1,NULL,'2021-08-17 14:03:00'),('system_config','xxxx','',1,NULL,'2021-08-17 14:08:32'),('system_config','xxxx','',1,NULL,'2021-08-17 14:10:54'),('system_config','xxxx','',1,NULL,'2021-08-17 14:52:56'),('system_config','xxxx','',1,NULL,'2021-08-17 15:01:32'),('system_config','xxxx','',1,NULL,'2021-08-17 15:29:55'),('system_config','xxxx','',1,NULL,'2021-08-17 16:52:35'),('system_config','xxxx','',1,NULL,'2021-08-17 17:12:06'),('system_config','xxxx','',1,NULL,'2021-08-17 17:14:37'),('system_config','xxxx','',1,NULL,'2021-08-17 17:30:27'),('system_config','xxxx','',1,NULL,'2021-08-17 17:31:17'),('system_config','xxxx','',1,NULL,'2021-08-17 17:33:42'),('system_config','xxxx','',1,NULL,'2021-08-17 17:52:50'),('system_config','xxxx','',1,NULL,'2021-08-17 17:55:34'),('system_config','xxxx','',1,NULL,'2021-08-17 17:57:45'),('system_config','xxxx','',1,NULL,'2021-08-17 17:58:57'),('system_config','xxxx','',1,NULL,'2021-08-17 18:01:08'),('system_config','xxxx','',1,NULL,'2021-08-17 18:03:40'),('system_config','xxxx','',1,NULL,'2021-08-17 18:06:58'),('system_config','xxxx','',1,NULL,'2021-08-17 18:10:15'),('system_config','xxxx','',1,NULL,'2021-08-17 18:14:34'),('system_config','xxxx','',1,NULL,'2021-08-17 18:16:26'),('system_config','xxxx','',1,NULL,'2021-08-18 10:01:28'),('system_config','xxxx','',1,NULL,'2021-08-18 10:55:45'),('system_config','xxxx','',1,NULL,'2021-08-18 13:17:55'),('system_config','xxxx','',1,NULL,'2021-08-18 13:38:08'),('system_config','xxxx','',1,NULL,'2021-08-18 13:42:30'),('system_config','xxxx','',1,NULL,'2021-08-18 13:43:26'),('system_config','xxxx','',1,NULL,'2021-08-18 13:56:01'),('system_config','xxxx','',1,NULL,'2021-08-18 14:28:30'),('system_config','xxxx','',1,NULL,'2021-08-24 09:33:34'),('system_config','xxxx','',1,NULL,'2021-08-26 10:29:06'),('system_config','xxxx','',1,NULL,'2021-08-26 11:03:07'),('system_config','xxxx','',1,NULL,'2021-08-26 11:09:57'),('system_config','xxxx','',1,NULL,'2021-08-31 10:22:59'),('system_config','xxxx','',1,NULL,'2021-08-31 10:29:07'),('system_config','xxxx','',1,NULL,'2021-08-31 10:34:31'),('system_config','xxxx','',1,NULL,'2021-08-31 10:47:41'),('system_config','xxxx','',1,NULL,'2021-08-31 10:52:12'),('system_config','xxxx','',1,NULL,'2021-08-31 11:50:05'),('system_config','xxxx','',1,NULL,'2021-08-31 12:05:06'),('system_config','xxxx','',1,NULL,'2021-08-31 13:58:45'),('system_config','xxxx','',1,NULL,'2021-08-31 14:04:18'),('system_config','xxxx','',1,NULL,'2021-08-31 14:09:21'),('system_config','xxxx','',1,NULL,'2021-09-15 14:48:16'),('system_config','xxxx','',1,NULL,'2021-09-17 09:51:51'),('system_config','xxxx','',1,NULL,'2021-09-17 10:19:04'),('system_config','xxxx','',1,NULL,'2021-09-17 10:22:53'),('system_config','xxxx','',1,NULL,'2021-09-17 10:25:47'),('system_config','xxxx','',1,NULL,'2021-09-17 10:34:46'),('system_config','xxxx','',1,NULL,'2021-09-17 10:36:53'),('system_config','xxxx','',1,NULL,'2021-09-17 11:39:17'),('system_config','xxxx','',1,NULL,'2021-09-17 11:44:03'),('system_config','xxxx','',1,NULL,'2021-09-17 11:49:52'),('system_config','xxxx','',1,NULL,'2021-09-17 11:51:05'),('system_config','xxxx','',1,NULL,'2021-09-17 11:52:42'),('system_config','xxxx','',1,NULL,'2021-09-17 11:53:59'),('system_config','xxxx','',1,NULL,'2021-09-17 11:54:35'),('system_config','xxxx','',1,NULL,'2021-09-18 14:53:23'),('system_config','xxxx','',1,NULL,'2021-09-18 14:57:23'),('system_config','xxxx','',1,NULL,'2021-09-18 15:01:32'),('system_config','xxxx','',1,NULL,'2021-09-18 15:02:23'),('system_config','xxxx','',1,NULL,'2021-11-12 16:44:38'),('system_config','xxxx','',1,NULL,'2021-11-12 16:53:10'),('system_config','xxxx','',1,NULL,'2021-11-16 09:13:04'),('system_config','xxxx','',1,NULL,'2021-11-16 13:47:31'),('system_config','xxxx','',1,NULL,'2021-11-17 09:25:13'),('system_config','xxxx','',1,NULL,'2021-11-17 09:56:53'),('system_config','xxxx','',1,NULL,'2021-11-17 10:01:40'),('system_config','xxxx','',1,NULL,'2021-11-17 10:26:09'),('system_config','xxxx','',1,NULL,'2021-11-17 11:19:42'),('system_config','xxxx','',1,NULL,'2021-11-17 13:26:11'),('system_config','xxxx','',1,NULL,'2021-11-17 13:38:44'),('system_config','xxxx','',1,NULL,'2021-11-17 13:42:47'),('system_config','xxxx','',1,NULL,'2021-11-17 16:44:04'),('system_config','xxxx','',1,NULL,'2021-11-17 16:45:59'),('system_config','xxxx','',1,NULL,'2021-11-17 16:47:03'),('system_config','xxxx','',1,NULL,'2021-11-17 16:48:10'),('system_config','xxxx','',1,NULL,'2021-11-18 10:48:16'),('system_config','xxxx','',1,NULL,'2021-11-18 10:51:56'),('system_config','xxxx','',1,NULL,'2021-11-19 10:59:27'),('system_config','xxxx','',1,NULL,'2021-11-19 11:36:37'),('system_config','xxxx','',1,NULL,'2021-11-19 14:41:24'),('system_config','xxxx','',1,NULL,'2021-11-19 14:58:44'),('system_config','xxxx','',1,NULL,'2021-11-19 15:29:29'),('system_config','xxxx','',1,NULL,'2021-11-20 15:55:24'),('system_config','xxxx','',1,NULL,'2021-11-20 16:14:15'),('system_config','xxxx','',1,NULL,'2021-11-20 16:17:39'),('system_config','xxxx','',1,NULL,'2021-11-21 13:17:18'),('system_config','xxxx','',1,NULL,'2021-11-21 15:03:17'),('system_config','xxxx','',1,NULL,'2021-11-21 15:11:19'),('system_config','xxxx','',1,NULL,'2021-11-21 15:15:57'),('system_config','xxxx','',1,NULL,'2021-11-21 15:19:12'),('system_config','xxxx','',1,NULL,'2021-11-21 15:41:02'),('system_config','xxxx','',1,NULL,'2021-11-21 15:42:36'),('system_config','xxxx','',1,NULL,'2021-11-21 17:02:19'),('system_config','xxxx','',1,NULL,'2021-11-21 17:03:55'),('system_config','xxxx','',1,NULL,'2021-11-21 17:06:22'),('system_config','xxxx','',1,NULL,'2021-11-21 17:07:56'),('system_config','xxxx','',1,NULL,'2021-11-21 17:10:58'),('system_config','xxxx','',1,NULL,'2021-11-21 18:46:14'),('system_config','xxxx','',1,NULL,'2021-11-21 19:02:27'),('system_config','xxxx','',1,NULL,'2021-11-21 19:03:01'),('system_config','xxxx','',1,NULL,'2021-11-21 19:06:33'),('system_config','xxxx','',1,NULL,'2021-11-21 19:12:14'),('system_config','xxxx','',1,NULL,'2021-11-21 19:40:09'),('system_config','xxxx','',1,NULL,'2021-11-21 19:42:14'),('system_config','xxxx','',1,NULL,'2021-11-21 20:40:04'),('system_config','xxxx','',1,NULL,'2022-03-04 14:29:55'),('system_config','xxxx','',1,NULL,'2022-03-04 15:29:49'),('system_config','xxxx','',1,NULL,'2022-03-17 11:39:37'),('system_config','xxxx','',1,NULL,'2023-03-01 16:45:37'),('system_config','xxxx','',1,NULL,'2023-03-02 16:13:04'),('system_config','xxxx','',1,NULL,'2023-03-02 16:13:48'),('system_config','xxxx','',1,NULL,'2023-03-02 16:17:53'),('system_config','xxxx','',1,NULL,'2023-03-13 14:27:18'),('system_config','xxxx','',1,NULL,'2023-03-13 14:28:53'),('system_config','xxxx','',1,NULL,'2023-11-10 16:39:34'),('system_config','xxxx','',1,NULL,'2023-11-16 10:27:55'),('system_config','xxxx','',1,NULL,'2024-10-28 10:44:47'),('system_config','xxxx','',1,NULL,'2024-10-29 14:29:20'),('system_config','xxxx','',1,NULL,'2025-11-17 09:35:05'),('system_config','xxxx','',1,NULL,'2025-11-17 11:57:07'),('system_config','xxxx','',1,NULL,'2025-11-18 09:52:24'),('system_config','xxxx','',1,NULL,'2025-11-19 13:42:18'),('system_config','xxxx','',1,NULL,'2025-11-19 14:27:17'),('system_config','xxxx','',1,NULL,'2025-11-20 14:03:24'),('system_config','xxxx','',1,NULL,'2025-11-20 14:30:52'),('system_config','xxxx','',1,NULL,'2025-11-20 14:32:04'),('system_config','xxxx','',1,NULL,'2025-11-25 12:46:02'),('system_config','xxxx','',1,NULL,'2025-11-27 14:43:49'),('system_config','xxxx','',1,NULL,'2025-11-27 16:04:36');
/*!40000 ALTER TABLE `t_reload_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'系统管理员','','2021-07-27 10:11:23','2019-06-21 12:09:34'),(49,'教师','','2021-07-27 10:11:00','2021-07-27 10:11:00'),(50,'审核人','','2021-08-12 14:17:00','2021-08-12 14:17:00');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_data_scope`
--

DROP TABLE IF EXISTS `t_role_data_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_role_data_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_scope_type` int(11) NOT NULL COMMENT '数据范围id',
  `view_type` int(11) NOT NULL COMMENT '数据范围类型',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_data_scope`
--

LOCK TABLES `t_role_data_scope` WRITE;
/*!40000 ALTER TABLE `t_role_data_scope` DISABLE KEYS */;
INSERT INTO `t_role_data_scope` VALUES (5,0,2,9,'2019-04-29 15:01:04','2019-04-29 15:01:04'),(14,0,2,40,'2019-09-05 15:25:37','2019-09-05 15:25:37'),(16,0,3,34,'2019-11-06 16:08:02','2019-11-06 16:08:02'),(20,0,1,49,'2021-08-12 14:19:08','2021-08-12 14:19:08'),(21,0,3,1,'2021-08-12 14:19:14','2021-08-12 14:19:14');
/*!40000 ALTER TABLE `t_role_data_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_employee`
--

DROP TABLE IF EXISTS `t_role_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_role_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色员工功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_employee`
--

LOCK TABLES `t_role_employee` WRITE;
/*!40000 ALTER TABLE `t_role_employee` DISABLE KEYS */;
INSERT INTO `t_role_employee` VALUES (214,1,1,'2021-02-18 09:44:52','2021-02-18 09:44:52'),(658,49,278,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(659,49,279,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(660,49,280,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(661,49,281,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(662,49,283,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(663,49,284,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(664,49,285,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(665,49,286,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(666,49,287,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(667,49,288,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(668,49,290,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(670,49,266,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(671,49,267,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(672,49,268,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(673,49,269,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(674,49,270,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(675,49,271,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(676,49,277,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(677,49,297,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(678,49,306,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(679,49,307,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(680,49,383,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(682,49,533,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(683,49,535,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(684,49,646,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(685,49,720,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(686,49,760,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(687,49,763,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(688,49,780,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(691,49,259,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(692,49,260,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(693,49,261,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(694,49,262,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(695,49,263,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(696,49,264,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(697,49,294,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(698,49,298,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(699,49,300,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(700,49,303,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(701,49,304,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(702,49,305,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(703,49,314,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(704,49,315,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(705,49,387,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(706,49,410,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(707,49,474,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(708,49,482,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(709,49,483,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(710,49,484,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(711,49,485,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(712,49,486,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(713,49,487,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(714,49,488,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(715,49,489,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(716,49,490,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(717,49,491,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(718,49,492,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(719,49,494,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(720,49,495,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(721,49,501,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(722,49,522,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(723,49,523,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(724,49,524,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(725,49,525,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(726,49,526,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(727,49,527,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(728,49,542,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(729,49,564,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(730,49,602,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(731,49,603,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(732,49,604,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(733,49,605,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(734,49,641,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(735,49,642,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(736,49,648,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(737,49,657,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(738,49,660,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(739,49,661,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(740,49,663,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(741,49,664,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(742,49,666,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(743,49,667,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(744,49,687,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(745,49,689,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(746,49,690,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(747,49,704,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(748,49,705,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(749,49,706,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(750,49,708,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(751,49,709,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(752,49,717,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(753,49,719,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(754,49,737,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(755,49,738,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(756,49,739,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(757,49,740,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(758,49,741,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(759,49,742,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(760,49,748,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(761,49,778,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(762,49,797,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(763,49,235,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(765,49,273,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(766,49,274,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(767,49,275,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(768,49,276,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(769,49,291,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(770,49,292,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(771,49,293,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(772,49,295,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(773,49,308,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(774,49,309,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(775,49,310,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(776,49,378,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(777,49,380,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(778,49,384,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(779,49,468,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(780,49,472,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(781,49,521,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(782,49,536,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(783,49,539,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(784,49,601,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(785,49,650,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(786,49,652,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(787,49,653,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(788,49,665,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(789,49,682,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(790,49,688,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(791,49,758,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(792,49,759,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(793,49,249,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(794,49,250,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(795,49,251,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(796,49,252,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(797,49,253,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(798,49,254,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(799,49,255,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(800,49,256,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(802,49,369,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(803,49,371,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(804,49,467,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(805,49,1,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(807,49,244,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(808,49,245,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(809,49,246,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(810,49,247,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(811,49,248,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(812,49,364,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(813,49,367,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(814,49,368,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(815,49,702,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(816,49,703,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(817,49,761,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(818,49,236,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(819,49,238,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(820,49,239,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(821,49,240,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(822,49,241,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(823,49,242,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(824,49,243,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(826,49,360,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(827,49,361,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(828,49,362,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(829,49,363,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(830,49,370,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(831,49,376,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(832,49,442,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(833,49,658,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(834,49,659,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(835,49,699,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(836,49,700,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(837,49,707,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(838,49,226,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(839,49,227,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(840,49,228,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(841,49,229,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(842,49,230,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(843,49,231,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(844,49,232,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(845,49,233,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(846,49,234,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(847,49,282,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(848,49,289,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(849,49,336,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(850,49,337,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(851,49,338,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(852,49,339,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(853,49,353,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(854,49,354,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(855,49,355,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(856,49,356,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(857,49,357,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(858,49,358,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(859,49,359,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(860,49,385,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(862,49,436,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(863,49,437,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(864,49,438,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(865,49,439,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(866,49,440,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(867,49,441,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(868,49,443,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(869,49,621,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(870,49,756,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(871,49,296,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(872,49,299,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(873,49,334,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(875,49,381,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(876,49,413,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(877,49,429,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(878,49,430,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(879,49,431,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(880,49,432,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(881,49,433,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(882,49,434,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(883,49,530,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(884,49,563,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(885,49,645,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(886,49,662,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(887,49,680,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(888,49,681,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(889,49,683,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(890,49,698,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(891,49,757,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(892,49,762,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(893,49,311,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(894,49,329,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(895,49,330,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(896,49,331,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(897,49,332,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(899,49,386,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(900,49,420,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(901,49,421,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(902,49,422,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(903,49,424,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(904,49,425,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(905,49,426,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(906,49,427,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(907,49,428,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(908,49,461,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(909,49,462,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(910,49,463,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(911,49,464,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(912,49,465,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(913,49,466,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(914,49,718,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(916,49,777,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(917,49,779,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(918,49,818,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(919,49,301,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(920,49,312,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(921,49,333,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(922,49,340,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(923,49,341,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(924,49,342,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(925,49,343,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(926,49,344,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(927,49,351,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(928,49,352,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(929,49,415,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(930,49,416,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(931,49,418,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(932,49,481,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(933,49,493,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(934,49,537,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(936,49,562,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(937,49,647,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(938,49,654,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(939,49,655,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(940,49,697,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(941,49,819,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(942,49,326,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(943,49,382,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(944,49,408,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(945,49,411,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(947,49,414,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(948,49,529,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(949,49,651,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(950,49,701,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(951,49,820,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(953,49,409,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(954,49,668,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(955,49,346,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(956,49,396,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(957,49,398,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(959,49,423,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(960,49,528,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(961,49,531,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(962,49,644,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(963,49,656,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(964,49,750,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(965,49,313,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(966,49,316,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(967,49,345,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(969,49,389,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(970,49,390,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(971,49,391,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(972,49,392,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(973,49,393,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(974,49,394,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(975,49,419,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(976,49,532,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(977,49,323,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(978,49,324,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(980,49,375,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(982,49,404,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(983,49,405,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(984,49,406,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(985,49,407,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(986,49,538,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(987,49,581,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(988,49,643,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(989,49,649,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(990,49,677,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(991,49,678,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(992,49,679,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(993,49,817,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(994,49,821,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(995,49,320,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(996,49,321,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(997,49,322,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(998,49,347,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(999,49,348,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1000,49,349,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1001,49,350,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1002,49,373,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1003,49,374,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1005,49,402,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1006,49,403,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1007,49,561,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1008,49,319,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1010,49,379,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1011,49,397,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1012,49,399,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1013,49,400,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1014,49,534,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1015,49,743,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1016,49,302,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1020,49,317,'2021-08-12 14:32:46','2021-08-12 14:32:46'),(1022,49,377,'2021-08-12 14:34:15','2021-08-12 14:34:15'),(1023,50,377,'2021-08-12 14:34:15','2021-08-12 14:34:15'),(1024,49,749,'2021-08-12 14:34:27','2021-08-12 14:34:27'),(1025,50,749,'2021-08-12 14:34:27','2021-08-12 14:34:27'),(1026,49,417,'2021-08-12 14:34:50','2021-08-12 14:34:50'),(1027,50,417,'2021-08-12 14:34:50','2021-08-12 14:34:50'),(1028,49,684,'2021-08-12 14:34:54','2021-08-12 14:34:54'),(1029,50,684,'2021-08-12 14:34:54','2021-08-12 14:34:54'),(1030,49,685,'2021-08-12 14:34:56','2021-08-12 14:34:56'),(1031,50,685,'2021-08-12 14:34:56','2021-08-12 14:34:56'),(1032,49,686,'2021-08-12 14:34:58','2021-08-12 14:34:58'),(1033,50,686,'2021-08-12 14:34:58','2021-08-12 14:34:58'),(1034,49,318,'2021-08-12 14:35:10','2021-08-12 14:35:10'),(1035,50,318,'2021-08-12 14:35:10','2021-08-12 14:35:10'),(1036,49,237,'2021-08-12 14:35:19','2021-08-12 14:35:19'),(1037,50,237,'2021-08-12 14:35:19','2021-08-12 14:35:19'),(1038,49,395,'2021-08-12 14:35:30','2021-08-12 14:35:30'),(1039,50,395,'2021-08-12 14:35:30','2021-08-12 14:35:30'),(1040,49,372,'2021-08-12 14:35:42','2021-08-12 14:35:42'),(1041,50,372,'2021-08-12 14:35:42','2021-08-12 14:35:42'),(1042,49,473,'2021-08-12 14:35:54','2021-08-12 14:35:54'),(1043,50,473,'2021-08-12 14:35:54','2021-08-12 14:35:54'),(1044,49,541,'2021-08-12 14:36:09','2021-08-12 14:36:09'),(1045,50,541,'2021-08-12 14:36:09','2021-08-12 14:36:09'),(1046,49,335,'2021-08-12 14:36:22','2021-08-12 14:36:22'),(1047,50,335,'2021-08-12 14:36:22','2021-08-12 14:36:22'),(1048,49,365,'2021-08-12 14:36:31','2021-08-12 14:36:31'),(1049,50,365,'2021-08-12 14:36:31','2021-08-12 14:36:31'),(1050,49,327,'2021-08-12 14:36:42','2021-08-12 14:36:42'),(1051,50,327,'2021-08-12 14:36:42','2021-08-12 14:36:42'),(1052,49,412,'2021-08-12 14:36:53','2021-08-12 14:36:53'),(1053,50,412,'2021-08-12 14:36:53','2021-08-12 14:36:53'),(1054,49,257,'2021-08-12 14:37:10','2021-08-12 14:37:10'),(1055,50,257,'2021-08-12 14:37:10','2021-08-12 14:37:10'),(1056,49,258,'2021-08-12 14:37:21','2021-08-12 14:37:21'),(1057,50,258,'2021-08-12 14:37:21','2021-08-12 14:37:21'),(1058,49,325,'2021-08-12 14:37:33','2021-08-12 14:37:33'),(1059,50,325,'2021-08-12 14:37:33','2021-08-12 14:37:33'),(1060,49,272,'2021-08-12 14:37:43','2021-08-12 14:37:43'),(1061,50,272,'2021-08-12 14:37:43','2021-08-12 14:37:43'),(1062,49,388,'2021-08-12 14:38:01','2021-08-12 14:38:01'),(1063,50,388,'2021-08-12 14:38:01','2021-08-12 14:38:01'),(1064,49,265,'2021-08-12 14:38:08','2021-08-12 14:38:08'),(1065,50,265,'2021-08-12 14:38:08','2021-08-12 14:38:08'),(1066,49,435,'2021-08-12 14:38:18','2021-08-12 14:38:18'),(1067,50,435,'2021-08-12 14:38:18','2021-08-12 14:38:18'),(1068,49,401,'2021-08-12 14:38:31','2021-08-12 14:38:31'),(1069,50,401,'2021-08-12 14:38:31','2021-08-12 14:38:31'),(1070,50,366,'2021-08-12 14:38:45','2021-08-12 14:38:45'),(1071,49,328,'2021-08-12 14:39:09','2021-08-12 14:39:09'),(1072,50,328,'2021-08-12 14:39:09','2021-08-12 14:39:09'),(1073,1,822,'2021-08-12 14:43:19','2021-08-12 14:43:19');
/*!40000 ALTER TABLE `t_role_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_privilege`
--

DROP TABLE IF EXISTS `t_role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `privilege_key` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限key',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12860 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_privilege`
--

LOCK TABLES `t_role_privilege` WRITE;
/*!40000 ALTER TABLE `t_role_privilege` DISABLE KEYS */;
INSERT INTO `t_role_privilege` VALUES (12503,50,'AditManagementList','2021-08-12 14:17:19','2021-08-12 14:17:19'),(12504,50,'auditManagement-list-query','2021-08-12 14:17:19','2021-08-12 14:17:19'),(12505,50,'auditManagement-list-update','2021-08-12 14:17:19','2021-08-12 14:17:19'),(12507,50,'Business','2021-08-12 14:17:19','2021-08-12 14:17:19'),(12508,50,'VisitorsRecordList','2021-08-12 14:17:19','2021-08-12 14:17:19'),(12789,49,'VisitorsRecordList','2021-08-18 14:29:24','2021-08-18 14:29:24'),(12790,49,'visitors-record-list-query','2021-08-18 14:29:24','2021-08-18 14:29:24'),(12791,49,'visitor-list-batch-export','2021-08-18 14:29:24','2021-08-18 14:29:24'),(12792,49,'Reviewer','2021-08-18 14:29:24','2021-08-18 14:29:24'),(12793,49,'Business','2021-08-18 14:29:24','2021-08-18 14:29:24'),(12794,1,'Business','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12795,1,'System','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12796,1,'Employee','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12797,1,'RoleManage','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12798,1,'RoleEmployeeManage','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12799,1,'UserLog','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12800,1,'UserOperateLog','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12801,1,'UserLoginLog','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12802,1,'SystemSetting','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12803,1,'SystemConfig','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12804,1,'SystemPrivilege','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12805,1,'VisitorsRecordList','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12806,1,'privilege-main-update','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12807,1,'privilege-batch-save-points','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12808,1,'privilege-main-search','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12809,1,'system-params-search','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12810,1,'system-params-add','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12811,1,'system-config-update','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12812,1,'system-config-search','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12813,1,'user-operate-log-search','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12814,1,'user-operate-log-detail','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12815,1,'user-operate-log-delete','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12816,1,'user-login-log-search','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12817,1,'user-login-log-delete','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12818,1,'DepartmentList','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12819,1,'department-list-query','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12820,1,'department-list-add','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12821,1,'department-list-update','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12822,1,'department-list-batch-delete','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12823,1,'department-list-batch-export','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12824,1,'department-list-export-all','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12825,1,'add-department','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12826,1,'update-department','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12827,1,'delete-department','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12828,1,'search-department','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12829,1,'add-employee','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12830,1,'update-employee','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12831,1,'disabled-employee','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12832,1,'disabled-employee-batch','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12833,1,'update-employee-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12834,1,'delete-employee','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12835,1,'reset-employee-password','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12836,1,'AditManagementList','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12837,1,'auditManagement-list-query','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12838,1,'auditManagement-list-update','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12839,1,'add-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12840,1,'delete-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12841,1,'update-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12842,1,'update-role-privilege','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12843,1,'add-employee-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12844,1,'delete-employee-role','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12845,1,'delete-employee-role-batch','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12846,1,'search-employee-list','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12847,1,'query-data-scope','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12848,1,'update-data-scope','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12849,1,'department-list-set','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12850,1,'visitors-record-list-query','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12851,1,'Reviewer','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12852,1,'visitor-list-batch-export','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12854,1,'reviewer-list-query','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12855,1,'reviewer-list-add','2021-08-18 14:30:18','2021-08-18 14:30:18'),(12857,1,'reviewer-list-batch-delete','2021-08-18 14:30:18','2021-08-18 14:30:18');
/*!40000 ALTER TABLE `t_role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_config`
--

DROP TABLE IF EXISTS `t_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名字',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数key',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数类别',
  `is_using` int(11) NOT NULL COMMENT '是否使用0 否 1 是',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_config`
--

LOCK TABLES `t_system_config` WRITE;
/*!40000 ALTER TABLE `t_system_config` DISABLE KEYS */;
INSERT INTO `t_system_config` VALUES (1,'超级管理员','employee_superman','1,822','employee',1,'','2021-08-16 14:16:54','2018-08-18 16:28:03'),(13,'本地上传URL前缀','local_upload_url_prefix','http://172.16.0.145/smartAdmin/file/','upload',1,'','2019-09-04 16:23:49','2019-04-26 17:06:53'),(14,'阿里云上传配置','ali_oss','{\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"bucketName\":\"sit\",\"endpoint\":\"http://oss-cn-beijing.aliyuncs.com\"}','upload',1,'eefwfwfds','2019-11-16 18:04:30','2019-05-11 18:00:06'),(15,'邮件发配置','email_config','{\"password\":\"smartadmin\",\"smtpHost\":\"smtp.163.com\",\"username\":\"smartadmin1024@163.com\"}','email',1,NULL,'2019-09-04 16:42:17','2019-05-13 16:57:48'),(16,'七牛云上传配置','qi_niu_oss','{\"accessKeyId\":\"rX7HgY1ZLpUD25JrA-uwMM_jj-\",\"accessKeySecret\":\"\",\"bucketName\":\"sun-smart-admin\",\"endpoint\":\"http://puvpyay08.bkt.clouddn.com\"}','upload',1,NULL,'2019-11-16 18:04:42','2019-07-19 16:05:56'),(17,'test','ww_1','ewr','3',1,'testoo','2019-11-08 09:43:36','2019-11-08 09:27:19'),(18,'4234','42342','423423','23423',1,'','2021-08-16 14:01:51','2019-11-14 11:22:49'),(19,'test323@','test','123456','11_',1,'gggggg','2019-11-15 16:24:52','2019-11-15 16:24:52');
/*!40000 ALTER TABLE `t_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `department_id` int(10) unsigned NOT NULL COMMENT '部门id',
  `is_leave` int(11) NOT NULL DEFAULT '0' COMMENT '是否离职1是',
  `is_disabled` int(11) NOT NULL DEFAULT '0' COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_user` int(10) unsigned NOT NULL COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除0否 1是',
  `identity` int(11) NOT NULL COMMENT '身份 1学生 2老师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','c655798e4648c540812a1b8f48759af7','管理员','15515515515','13112312131','410306199202020020','1992-02-02',NULL,1,0,0,NULL,0,'2025-11-25 12:59:54','2018-05-11 09:38:54',0,0),(11,'role1','c655798e4648c540812a1b8f48759af7','角色测试1','','18123245230','','1970-01-01','',4,0,0,NULL,1,'2019-04-27 09:56:17','2019-04-25 12:30:22',0,0),(12,'role2','c655798e4648c540812a1b8f48759af7','角色测试2','','18121451241','',NULL,'',4,0,0,NULL,1,'2019-08-01 10:04:38','2019-04-25 12:31:11',0,0),(13,'lihaifan','c655798e4648c540812a1b8f48759af7','lihaifan','','18399485774','',NULL,'',1,0,0,NULL,1,'2019-04-27 09:56:17','2019-04-25 13:50:44',0,0),(14,'lipeng','c655798e4648c540812a1b8f48759af7','李鹏1','','13937988294','',NULL,'',2,0,0,NULL,1,'2019-04-27 09:56:17','2019-04-25 14:34:47',0,0),(15,'huangwenli','c655798e4648c540812a1b8f48759af7','黄文丽','','15515515515','',NULL,'',16,0,0,NULL,1,'2019-04-27 09:56:17','2019-04-26 10:05:05',0,0),(16,'huangwenli1','c655798e4648c540812a1b8f48759af7','黄文丽','','15515515515','',NULL,'',15,0,0,NULL,1,'2019-04-27 14:04:19','2019-04-26 10:25:04',0,0),(17,'zhangjiao','c655798e4648c540812a1b8f48759af7','张娇','阿娇','15670390391','410305199102020020','1991-02-02','86484@qq.com',19,0,0,NULL,1,'2019-08-05 16:33:57','2019-04-26 14:37:23',0,0),(18,'zhangjiao1','c655798e4648c540812a1b8f48759af7','张娇1','','15670390391','','2019-04-18','6666@qq.com',20,0,0,NULL,1,'2019-08-05 16:33:57','2019-04-26 14:45:55',0,0),(19,'zhenxiaocang','c655798e4648c540812a1b8f48759af7','珍小藏','','15670390391','',NULL,'',19,0,1,NULL,1,'2019-09-09 08:34:35','2019-04-26 14:46:57',0,0),(20,'matengfei','c655798e4648c540812a1b8f48759af7','马腾飞','','15670390393','',NULL,'',19,0,0,NULL,1,'2019-08-05 16:33:57','2019-04-26 14:47:24',0,0),(21,'ceshi123','c655798e4648c540812a1b8f48759af7','测试人员','','18829938477','',NULL,'',1,0,1,NULL,13,'2019-04-27 09:56:17','2019-04-27 09:38:07',1,0),(22,'zhangjingru','c655798e4648c540812a1b8f48759af7','张静如','','15600000000','',NULL,'',1,0,0,NULL,1,'2019-09-04 09:06:47','2019-04-28 14:05:03',0,0),(23,'sdfsdfdsfsdfdsfdsf','c655798e4648c540812a1b8f48759af7','werewr','','15698585858','',NULL,'',19,0,0,NULL,1,'2019-09-05 16:13:03','2019-04-28 16:26:27',0,0),(25,'shq2019','c655798e4648c540812a1b8f48759af7','shq','shq','18798801298','410281199309024040','1993-09-02','',17,0,0,NULL,1,'2019-08-05 16:33:57','2019-05-05 09:13:41',0,0),(26,'zhangjiao666','c655798e4648c540812a1b8f48759af7','tom我是五个字12','','15612345678','',NULL,'',18,0,0,NULL,1,'2019-08-05 16:33:57','2019-05-05 15:34:10',0,0),(28,'dfsfgds','c655798e4648c540812a1b8f48759af7','fds','','15854127845','',NULL,'',22,0,1,NULL,1,'2019-09-06 08:58:40','2019-05-06 10:36:57',0,0),(29,'abcabc','c655798e4648c540812a1b8f48759af7','abccba','aaabac','13311112222','',NULL,'',17,0,0,NULL,1,'2019-08-05 16:33:57','2019-07-10 17:00:58',0,0),(30,'gengweigang','c655798e4648c540812a1b8f48759af7','耿为刚','geng','15038588418','',NULL,'',17,0,0,NULL,1,'2019-08-08 14:35:51','2019-08-08 14:35:51',0,0),(31,'gengweigang1','c655798e4648c540812a1b8f48759af7','耿为刚1','这是别名','15038588418','410322193312123232','1933-12-12','32@qq.com',18,0,0,NULL,30,'2019-08-23 09:27:22','2019-08-23 09:25:50',0,0),(32,'ceshi123','c655798e4648c540812a1b8f48759af7','测试','测试','15670702651','',NULL,'',17,0,0,NULL,1,'2019-09-04 09:05:48','2019-09-03 11:48:04',0,0),(33,'ceshi321','c655798e4648c540812a1b8f48759af7','测试','测试','15670702651','',NULL,'',17,0,1,NULL,1,'2019-09-03 15:51:16','2019-09-03 11:49:17',0,0),(34,'ceshi123321','c655798e4648c540812a1b8f48759af7','123','','15600000000','',NULL,'',22,0,1,NULL,1,'2019-09-06 08:58:37','2019-09-04 09:13:54',0,0),(35,'guoqingfeng','c655798e4648c540812a1b8f48759af7','郭青枫','','15670702651','',NULL,'',18,0,0,NULL,1,'2019-09-04 15:09:00','2019-09-04 15:09:00',0,0),(36,'li327263458','c655798e4648c540812a1b8f48759af7','lipeng','','13937988294','',NULL,'',17,0,0,NULL,1,'2021-07-06 07:11:46','2019-09-09 17:01:39',0,0),(37,'test123','c655798e4648c540812a1b8f48759af7','test','','13211110201','',NULL,'',18,0,1,NULL,1,'2019-11-14 16:08:08','2019-11-08 09:32:39',0,0),(38,'tiantian','c655798e4648c540812a1b8f48759af7','天天管理员','','13574502368','',NULL,'',17,0,0,NULL,1,'2021-07-06 08:52:24','2019-11-08 11:09:46',0,1),(39,'wang13211111','c655798e4648c540812a1b8f48759af7','ceshi111','dddd','13244553212','',NULL,'',25,0,0,NULL,38,'2021-07-06 08:42:22','2019-11-15 17:03:04',0,2);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_login_log`
--

DROP TABLE IF EXISTS `t_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '员工id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `remote_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ip',
  `remote_port` int(11) DEFAULT NULL COMMENT '用户端口',
  `remote_browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览器',
  `remote_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作系统',
  `login_status` tinyint(4) NOT NULL COMMENT '登录状态 0 失败  1成功',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customer_id` (`user_id`) USING BTREE,
  KEY `auditor_id` (`remote_browser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_login_log`
--

LOCK TABLES `t_user_login_log` WRITE;
/*!40000 ALTER TABLE `t_user_login_log` DISABLE KEYS */;
INSERT INTO `t_user_login_log` VALUES (1,1,'admin','127.0.0.1',52131,'Chrome 11','Windows 10',1,'2025-11-27 15:55:11','2025-11-27 15:55:11');
/*!40000 ALTER TABLE `t_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_operate_log`
--

DROP TABLE IF EXISTS `t_user_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user_operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `result` tinyint(4) DEFAULT NULL COMMENT '请求结果 0失败 1成功',
  `fail_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_operate_log`
--

LOCK TABLES `t_user_operate_log` WRITE;
/*!40000 ALTER TABLE `t_user_operate_log` DISABLE KEYS */;
INSERT INTO `t_user_operate_log` VALUES (1,1,'admin','管理端-用户操作日志','分页查询','/visitor-api/userOperateLog/page/query','net.lab1024.smartadmin.module.business.log.useroperatelog.UserOperateLogController.queryByPage','UserOperateLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\",\"userName\":\"\"}]',1,NULL,'2025-11-27 15:50:29','2025-11-27 15:50:29'),(2,1,'admin','管理端-用户登录日志','分页查询用户登录日志','/visitor-api/userLoginLog/page/query','net.lab1024.smartadmin.module.business.log.userloginlog.UserLoginLogController.queryByPage','UserLoginLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\",\"userName\":\"\"}]',1,NULL,'2025-11-27 15:50:31','2025-11-27 15:50:31'),(3,1,'admin','管理端-用户登录日志','分页查询用户登录日志','/visitor-api/userLoginLog/page/query','net.lab1024.smartadmin.module.business.log.userloginlog.UserLoginLogController.queryByPage','UserLoginLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\",\"userName\":\"\"}]',1,NULL,'2025-11-27 15:50:41','2025-11-27 15:50:41'),(4,1,'admin','管理端-系统配置','分页查询所有系统配置','/visitor-api/systemConfig/getListPage','net.lab1024.smartadmin.module.system.systemconfig.SystemConfigController.getSystemConfigPage','SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]',1,NULL,'2025-11-27 15:50:46','2025-11-27 15:50:46'),(5,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 15:50:47','2025-11-27 15:50:47'),(6,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 15:50:47','2025-11-27 15:50:47'),(7,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 15:50:50','2025-11-27 15:50:50'),(8,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 15:51:11','2025-11-27 15:51:11'),(9,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 15:51:11','2025-11-27 15:51:11'),(10,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 15:51:11','2025-11-27 15:51:11'),(11,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 15:51:21','2025-11-27 15:51:21'),(12,1,'admin','通用-权限','批量保存功能点','/visitor-api/privilege/function/batchSave','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList','ValidateList[[{\"functionKey\":\"reviewer-list-query\",\"functionName\":\"查询\",\"menuKey\":\"ReviewerList\",\"sort\":1},{\"functionKey\":\"reviewer-list-add\",\"functionName\":\"新增\",\"menuKey\":\"ReviewerList\",\"sort\":2},{\"functionKey\":\"reviewer-list-batch-delete\",\"functionName\":\"批量删除\",\"menuKey\":\"ReviewerList\",\"sort\":3}]]',1,NULL,'2025-11-27 15:51:26','2025-11-27 15:51:26'),(13,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 15:51:26','2025-11-27 15:51:26'),(14,1,'admin','管理端-用户登录','退出登陆','/visitor-api/session/logOut','net.lab1024.smartadmin.module.system.login.LoginController.logOut','',1,NULL,'2025-11-27 15:52:02','2025-11-27 15:52:02'),(15,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 15:58:36','2025-11-27 15:58:36'),(16,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 15:58:36','2025-11-27 15:58:36'),(17,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 15:58:42','2025-11-27 15:58:42'),(18,1,'admin','管理端-系统配置','分页查询所有系统配置','/visitor-api/systemConfig/getListPage','net.lab1024.smartadmin.module.system.systemconfig.SystemConfigController.getSystemConfigPage','SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]',1,NULL,'2025-11-27 16:00:53','2025-11-27 16:00:53'),(19,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:00:57','2025-11-27 16:00:57'),(20,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:00:57','2025-11-27 16:00:57'),(21,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:02:27','2025-11-27 16:02:27'),(22,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:02:27','2025-11-27 16:02:27'),(23,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:02:27','2025-11-27 16:02:27'),(24,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:02:49','2025-11-27 16:02:49'),(25,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:02:49','2025-11-27 16:02:49'),(26,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:02:49','2025-11-27 16:02:49'),(27,1,'admin','通用-权限','菜单批量保存','/visitor-api/privilege/menu/batchSaveMenu','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.menuBatchSave','ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Reviewer\",\"menuName\":\"访客管理\",\"parentKey\":\"Business\",\"sort\":1,\"type\":1,\"url\":\"/reviewer\"},{\"menuKey\":\"ReviewerList\",\"menuName\":\"审核人管理\",\"parentKey\":\"Reviewer\",\"sort\":2,\"type\":1,\"url\":\"/reviewer/reviewer-list\"},{\"menuKey\":\"VisitorsRecordList\",\"menuName\":\"访校申请记录\",\"parentKey\":\"Reviewer\",\"sort\":3,\"type\":1,\"url\":\"/visitors-record/visitors-record-list\"},{\"menuKey\":\"AditManagementList\",\"menuName\":\"访校申请审核\",\"parentKey\":\"Reviewer\",\"sort\":4,\"type\":1,\"url\":\"/auditManagement/auditManagement-list\"},{\"menuKey\":\"VisitorsCount\",\"menuName\":\"访客统计\",\"parentKey\":\"Business\",\"sort\":5,\"type\":1,\"url\":\"/visitors-count\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":6,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":7,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"用户管理\",\"parentKey\":\"Employee\",\"sort\":8,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":9,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"DepartmentList\",\"menuName\":\"部门管理\",\"parentKey\":\"Employee\",\"sort\":10,\"type\":1,\"url\":\"/department/department-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":11,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":12,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":13,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":14,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":15,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":16,\"type\":1,\"url\":\"/system-setting/system-privilege\"}]]',1,NULL,'2025-11-27 16:03:08','2025-11-27 16:03:08'),(28,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:03:08','2025-11-27 16:03:08'),(29,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:03:12','2025-11-27 16:03:12'),(30,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:03:12','2025-11-27 16:03:12'),(31,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:03:12','2025-11-27 16:03:12'),(32,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 16:03:21','2025-11-27 16:03:21'),(33,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/VisitorsRecordList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"VisitorsRecordList\"]',1,NULL,'2025-11-27 16:03:22','2025-11-27 16:03:22'),(34,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/AditManagementList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"AditManagementList\"]',1,NULL,'2025-11-27 16:03:23','2025-11-27 16:03:23'),(35,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/VisitorsCount','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"VisitorsCount\"]',1,NULL,'2025-11-27 16:03:32','2025-11-27 16:03:32'),(36,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 16:03:33','2025-11-27 16:03:33'),(37,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:03:49','2025-11-27 16:03:49'),(38,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:03:49','2025-11-27 16:03:49'),(39,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:03:49','2025-11-27 16:03:49'),(40,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:04:43','2025-11-27 16:04:43'),(41,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:04:43','2025-11-27 16:04:43'),(42,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:04:43','2025-11-27 16:04:43'),(43,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 16:04:53','2025-11-27 16:04:53'),(44,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/VisitorsRecordList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"VisitorsRecordList\"]',1,NULL,'2025-11-27 16:04:55','2025-11-27 16:04:55'),(45,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 16:04:57','2025-11-27 16:04:57'),(46,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:05:41','2025-11-27 16:05:41'),(47,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:05:42','2025-11-27 16:05:42'),(48,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:05:42','2025-11-27 16:05:42'),(49,1,'admin','通用-权限','菜单批量保存','/visitor-api/privilege/menu/batchSaveMenu','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.menuBatchSave','ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Reviewer\",\"menuName\":\"访客管理\",\"parentKey\":\"Business\",\"sort\":1,\"type\":1,\"url\":\"/reviewer\"},{\"menuKey\":\"ReviewerList\",\"menuName\":\"审核人管理\",\"parentKey\":\"Reviewer\",\"sort\":2,\"type\":1,\"url\":\"/reviewer/reviewer-list\"},{\"menuKey\":\"VisitorsRecordList\",\"menuName\":\"访校申请记录\",\"parentKey\":\"Reviewer\",\"sort\":3,\"type\":1,\"url\":\"/visitors-record/visitors-record-list\"},{\"menuKey\":\"AditManagementList\",\"menuName\":\"访校申请审核\",\"parentKey\":\"Reviewer\",\"sort\":4,\"type\":1,\"url\":\"/auditManagement/auditManagement-list\"},{\"menuKey\":\"VisitorsCount\",\"menuName\":\"访客统计\",\"parentKey\":\"Business\",\"sort\":5,\"type\":1,\"url\":\"/visitors-count\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":6,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":7,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"用户管理\",\"parentKey\":\"Employee\",\"sort\":8,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":9,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"DepartmentList\",\"menuName\":\"部门管理\",\"parentKey\":\"Employee\",\"sort\":10,\"type\":1,\"url\":\"/department/department-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":11,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":12,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":13,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":14,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":15,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":16,\"type\":1,\"url\":\"/system-setting/system-privilege\"}]]',1,NULL,'2025-11-27 16:06:00','2025-11-27 16:06:00'),(50,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:06:00','2025-11-27 16:06:00'),(51,1,'admin','管理端-系统配置','分页查询所有系统配置','/visitor-api/systemConfig/getListPage','net.lab1024.smartadmin.module.system.systemconfig.SystemConfigController.getSystemConfigPage','SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]',1,NULL,'2025-11-27 16:06:06','2025-11-27 16:06:06'),(52,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:06:14','2025-11-27 16:06:14'),(53,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:06:14','2025-11-27 16:06:14'),(54,1,'admin','通用-权限','查询菜单功能点','/visitor-api/privilege/function/query/ReviewerList','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.functionQuery','String[\"ReviewerList\"]',1,NULL,'2025-11-27 16:06:37','2025-11-27 16:06:37'),(55,1,'admin','管理端-用户登录','获取session','/visitor-api/session/get','net.lab1024.smartadmin.module.system.login.LoginController.getSession','',1,NULL,'2025-11-27 16:08:08','2025-11-27 16:08:08'),(56,1,'admin','通用-权限','获取所有请求路径','/visitor-api/privilege/getAllUrl','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.getAllUrl','',1,NULL,'2025-11-27 16:08:08','2025-11-27 16:08:08'),(57,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:08:08','2025-11-27 16:08:08'),(58,1,'admin','通用-权限','菜单批量保存','/visitor-api/privilege/menu/batchSaveMenu','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.menuBatchSave','ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Reviewer\",\"menuName\":\"访客管理\",\"parentKey\":\"Business\",\"sort\":1,\"type\":1,\"url\":\"/reviewer\"},{\"menuKey\":\"VisitorsRecordList\",\"menuName\":\"访校申请记录\",\"parentKey\":\"Reviewer\",\"sort\":2,\"type\":1,\"url\":\"/visitors-record/visitors-record-list\"},{\"menuKey\":\"AditManagementList\",\"menuName\":\"访校申请审核\",\"parentKey\":\"Reviewer\",\"sort\":3,\"type\":1,\"url\":\"/auditManagement/auditManagement-list\"},{\"menuKey\":\"VisitorsCount\",\"menuName\":\"访客统计\",\"parentKey\":\"Business\",\"sort\":4,\"type\":1,\"url\":\"/visitors-count\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":5,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":6,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"用户管理\",\"parentKey\":\"Employee\",\"sort\":7,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":8,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"DepartmentList\",\"menuName\":\"部门管理\",\"parentKey\":\"Employee\",\"sort\":9,\"type\":1,\"url\":\"/department/department-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":10,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":11,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":12,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":13,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":14,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":15,\"type\":1,\"url\":\"/system-setting/system-privilege\"}]]',1,NULL,'2025-11-27 16:08:18','2025-11-27 16:08:18'),(59,1,'admin','通用-权限','查询所有菜单项','/visitor-api/privilege/menu/queryAll','net.lab1024.smartadmin.module.system.privilege.controller.PrivilegeController.queryAll','',1,NULL,'2025-11-27 16:08:18','2025-11-27 16:08:18');
/*!40000 ALTER TABLE `t_user_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vis_city`
--

DROP TABLE IF EXISTS `vis_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vis_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市自增id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城市名',
  `remark` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `province_id` int(11) NOT NULL COMMENT '省份id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vis_city`
--

LOCK TABLES `vis_city` WRITE;
/*!40000 ALTER TABLE `vis_city` DISABLE KEYS */;
INSERT INTO `vis_city` VALUES (2,'上海市','直辖市',3),(3,'北京市','直辖市',4),(4,'天津市','直辖市',7),(5,'重庆市','直辖市',9),(7,'合肥市','',11),(8,'芜湖市','',11),(9,'巢湖市','',11),(10,'阜阳市','',11),(11,'黄山市','',11);
/*!40000 ALTER TABLE `vis_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vis_department_reviewer`
--

DROP TABLE IF EXISTS `vis_department_reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vis_department_reviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `department_id` int(10) unsigned zerofill NOT NULL COMMENT '部门id',
  `employee_id` int(10) unsigned zerofill NOT NULL COMMENT '审核人id 关联用户表',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `foreignEmp` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='部门审核人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vis_department_reviewer`
--

LOCK TABLES `vis_department_reviewer` WRITE;
/*!40000 ALTER TABLE `vis_department_reviewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `vis_department_reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vis_province`
--

DROP TABLE IF EXISTS `vis_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vis_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '省份名称',
  `remark` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vis_province`
--

LOCK TABLES `vis_province` WRITE;
/*!40000 ALTER TABLE `vis_province` DISABLE KEYS */;
INSERT INTO `vis_province` VALUES (3,'上海','直辖市'),(4,'北京','直辖市'),(7,'天津','直辖市'),(10,'重庆','直辖市'),(11,'安徽省','');
/*!40000 ALTER TABLE `vis_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vis_visitors_record`
--

DROP TABLE IF EXISTS `vis_visitors_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vis_visitors_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `id_card` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `company_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司名称',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `area` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所在地区',
  `itinerary_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '行程码',
  `health_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '健康码',
  `special_case` int(11) NOT NULL COMMENT '情况说明\r\n1本人未离开上海/抵达上海14天以上\r\n2本人抵达上海不满14天\r\n',
  `is_fr` int(11) NOT NULL COMMENT '是否发热 1 是 0 否',
  `visitors_time` datetime NOT NULL COMMENT '来校时间',
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `employee_id` int(11) NOT NULL COMMENT '教师id关联用户表',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '说明信息',
  `shzt` int(11) NOT NULL COMMENT '0 待审核 1 已通过 -1未通过',
  `shyj` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审核意见',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `affirm_status` int(2) DEFAULT NULL COMMENT '确认状态 1 已确认',
  `temp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '温度',
  `qr_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '一人一码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='访客记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vis_visitors_record`
--

LOCK TABLES `vis_visitors_record` WRITE;
/*!40000 ALTER TABLE `vis_visitors_record` DISABLE KEYS */;
INSERT INTO `vis_visitors_record` VALUES (48,'张三','MTIzNDU2MTIzNDU2NzgxMjM0\r\n','1','MTM4MTIzNDU2Nzg=\r\n','北京市/北京市/东城区','','',1,0,'2025-11-27 15:22:00',36,1369,'2',1,'','ed6aede87e084eccbc8851562dda981e','2025-11-27 15:22:44','2025-11-27 15:22:44',NULL,NULL,'021b4d87c1ce4386b8109733241f1ced.png');
/*!40000 ALTER TABLE `vis_visitors_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 14:00:25
