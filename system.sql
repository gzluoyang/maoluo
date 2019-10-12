-- MySQL dump 10.13  Distrib 5.6.42, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: system
-- ------------------------------------------------------
-- Server version	5.6.42-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_access`
--

DROP TABLE IF EXISTS `sys_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module_id` int(10) unsigned NOT NULL COMMENT '应用ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `url` varchar(128) NOT NULL COMMENT 'URL',
  `tab_index` tinyint(4) unsigned NOT NULL COMMENT 'TAB排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_ACCESS_URL` (`url`) USING BTREE,
  KEY `IDX_SYS_ACCESS_APP_ID_TAB_INDEX_STATUS` (`module_id`,`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='访问表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_access`
--

LOCK TABLES `sys_access` WRITE;
/*!40000 ALTER TABLE `sys_access` DISABLE KEYS */;
INSERT INTO `sys_access` VALUES (3,2,'access1','test',1,1,'',0,1562857252,0,1568112299),(4,2,'access2','access2',2,1,'',0,1564045306,0,1568112299),(5,2,'access3','3',3,0,'',0,1568112229,0,1568112298),(7,2,'access4','4',4,0,'',0,1568112260,0,1568112295);
/*!40000 ALTER TABLE `sys_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_access_role`
--

DROP TABLE IF EXISTS `sys_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_access_role` (
  `access_id` int(10) NOT NULL DEFAULT '0',
  `role_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_access_role`
--

LOCK TABLES `sys_access_role` WRITE;
/*!40000 ALTER TABLE `sys_access_role` DISABLE KEYS */;
INSERT INTO `sys_access_role` VALUES (3,3),(3,5),(4,1),(4,2);
/*!40000 ALTER TABLE `sys_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app`
--

DROP TABLE IF EXISTS `sys_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `icon_cls` varchar(64) DEFAULT NULL COMMENT '图标样式',
  `tab_index` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_APP_TITLE` (`title`) USING BTREE,
  KEY `IDX_SYS_APP_TAB_INDEX_STATUS` (`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app`
--

LOCK TABLES `sys_app` WRITE;
/*!40000 ALTER TABLE `sys_app` DISABLE KEYS */;
INSERT INTO `sys_app` VALUES (40,'自营电商','','x-fa fa-cube',2,1,'自营电商是由平台自己经营商品或服务的网上销售平台。',0,1558431657,0,1568128309),(41,'系统应用','','x-fa fa-cogs',1,1,'管理平台的基础信息，如用户、权限、模块、菜单等',0,1558432428,0,1568123721),(45,'商户电商','','x-fa fa-cubes',3,1,'商户电商是由商家自己管理、推广、销售的商品交易平台。',0,1558604961,0,1568128309);
/*!40000 ALTER TABLE `sys_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_button`
--

DROP TABLE IF EXISTS `sys_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_button` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `keyword` varchar(32) NOT NULL COMMENT '关键字',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `icon_cls` varchar(64) DEFAULT NULL COMMENT '图标样式',
  `tab_index` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_BUTTON_MENU_ID_TITLE` (`menu_id`,`title`) USING BTREE,
  KEY `IDX_SYS_BUTTON_MENU_ID_TAB_INDEX_STATUS` (`menu_id`,`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='工具栏按钮表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_button`
--

LOCK TABLES `sys_button` WRITE;
/*!40000 ALTER TABLE `sys_button` DISABLE KEYS */;
INSERT INTO `sys_button` VALUES (1,1,'apps_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1562824023,0,1570764645),(2,1,'apps_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1562833411,0,1570698594),(3,1,'apps_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1568112048,0,1570698670),(4,1,'apps_split1','-','','',4,1,'',0,1568112055,0,1570700133),(5,4,'menus_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570764746,0,1570764746),(6,4,'menus_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570765190,0,1570765190),(7,4,'menus_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570765374,0,1570765374),(8,4,'menus_split1','分隔线1','','',4,1,'',0,1570765617,0,1570766795),(9,4,'menus_role','角色','','fa fa-lg fa-user',5,1,'',0,1570765665,0,1570788222),(11,4,'menus_split2','分隔线2','','',6,1,'',0,1570766777,0,1570788247),(12,3,'groups_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570778226,0,1570778317),(13,3,'groups_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570778253,0,1570778317),(14,3,'groups_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570778275,0,1570778317),(15,3,'groups_split1','分割线1','','',4,1,'',0,1570778299,0,1570778312),(16,5,'buttons_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570778596,0,1570778718),(17,5,'buttons_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570778615,0,1570778718),(18,5,'buttons_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570778634,0,1570778718),(19,5,'buttons_split1','分隔符1','','',4,1,'',0,1570778654,0,1570778718),(20,5,'buttons_role','角色','','fa fa-lg fa-user',5,1,'',0,1570778681,0,1570790478),(21,5,'buttons_split2','分隔符2','','',6,1,'',0,1570778706,0,1570778718),(22,7,'modules_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570791449,0,1570791532),(23,7,'modules_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570791469,0,1570791532),(24,7,'modules_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570791486,0,1570791532),(25,7,'modules_split1','分隔符1','','',4,1,'',0,1570791508,0,1570791532),(26,8,'accesses_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570792312,0,1570792430),(27,8,'accesses_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570792330,0,1570792430),(28,8,'accesses_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570792353,0,1570792430),(29,8,'accesses_split1','分隔符1','','',4,1,'',0,1570792373,0,1570792430),(30,8,'accesses_role','角色','','fa fa-lg fa-user',5,1,'',0,1570792402,0,1570792430),(31,8,'accesses_split2','分隔符2','','',6,1,'',0,1570792425,0,1570792430),(32,9,'roles_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570802644,0,1570802712),(33,9,'roles_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570802663,0,1570802712),(34,9,'roles_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570802679,0,1570802712),(35,9,'roles_split1','分隔符1','','',4,1,'',0,1570802697,0,1570802712),(36,9,'roles_user','用户','','fa fa-lg fa-users',5,1,'',0,1570802785,0,1570803196),(37,9,'roles_access','访问','','fa fa-lg fa-cloud-upload',6,1,'',0,1570802880,0,1570802883),(38,9,'roles_menu','菜单','','fa fa-lg fa-list-ul',8,1,'',0,1570802926,0,1570802950),(39,9,'roles_split2','分隔符2','','',7,1,'',0,1570802947,0,1570802950),(40,9,'roles_button','按钮','','fa fa-lg fa-hand-pointer-o',9,1,'',0,1570803002,0,1570803010),(41,9,'roles_split3','分隔符3','','',10,1,'',0,1570803034,0,1570803038),(42,2,'orgs_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570803852,0,1570803930),(43,2,'orgs_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570803880,0,1570804000),(44,2,'orgs_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570803899,0,1570803930),(45,2,'orgs_split1','分隔符1','','',4,1,'',0,1570803922,0,1570803930),(46,6,'users_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570804846,0,1570804953),(47,6,'users_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570804874,0,1570804953),(48,6,'users_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570804889,0,1570804953),(49,6,'users_split1','分隔符1','','',4,1,'',0,1570804909,0,1570804953),(50,6,'users_role','角色','','fa fa-lg fa-user',5,1,'',0,1570804944,0,1570804953),(51,6,'users_split2','分隔符2','','',6,1,'',0,1570804972,0,1570804976);
/*!40000 ALTER TABLE `sys_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_button_role`
--

DROP TABLE IF EXISTS `sys_button_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_button_role` (
  `button_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_button_role`
--

LOCK TABLES `sys_button_role` WRITE;
/*!40000 ALTER TABLE `sys_button_role` DISABLE KEYS */;
INSERT INTO `sys_button_role` VALUES (1,3),(2,3),(1,1),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `sys_button_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` int(10) unsigned NOT NULL COMMENT 'APP_ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `icon_cls` varchar(64) DEFAULT NULL COMMENT '图标样式',
  `tab_index` tinyint(4) unsigned NOT NULL COMMENT 'TAB排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_GROUP_TAB_INDEX_TITLE` (`app_id`,`title`) USING BTREE,
  KEY `IDX_SYS_GROUP_APP_ID_TAB_INDEX_STATUS` (`app_id`,`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group`
--

LOCK TABLES `sys_group` WRITE;
/*!40000 ALTER TABLE `sys_group` DISABLE KEYS */;
INSERT INTO `sys_group` VALUES (1,41,'菜单按钮','','x-fa fa-indent',2,1,'',0,1558713613,0,1568111789),(4,41,'用户机构','','x-fa fa-user',4,1,'',0,1558714797,0,1568111782),(8,40,'2','','',0,1,'',0,1561609678,0,1568017427),(9,41,'访问权限','','x-fa fa-users',3,1,'',0,1562339144,0,1568111789),(10,41,'系统设置','','x-fa fa-cogs',1,1,'',0,1567832308,0,1568111789);
/*!40000 ALTER TABLE `sys_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '分组ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `url` varchar(128) NOT NULL COMMENT 'URL',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `icon_cls` varchar(64) DEFAULT NULL COMMENT '图标样式',
  `tab_index` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_MENU_GROUP_ID_TITLE` (`group_id`,`title`) USING BTREE,
  KEY `IDX_SYS_MENU_GROUP_ID_TAB_INDEX_STATUS` (`group_id`,`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,10,'应用管理','apps','','x-fa fa-th-large',1,1,'test',0,1562556926,0,1568111842),(2,4,'机构管理','orgs','','x-fa fa-home',1,1,'',0,1562556942,0,1568091606),(3,1,'菜单分组','groups','','x-fa fa-indent',1,1,'',0,1567828944,0,1568111847),(4,1,'菜单管理','menus','','x-fa fa-list-ul',2,1,'',0,1567829257,0,1568111850),(5,1,'按钮管理','buttons','','x-fa fa-hand-pointer-o',3,1,'',0,1567829831,0,1568111850),(6,4,'用户管理','users','','x-fa fa-user',2,1,'',0,1567830854,0,1568091606),(7,9,'模块管理','modules','','x-fa fa-cube',1,1,'',0,1567831714,0,1567832014),(8,9,'访问管理','accesses','','x-fa fa-cloud-upload',2,1,'',0,1567831806,0,1567831825),(9,9,'角色管理','roles','','x-fa fa-users',3,1,'',0,1567831890,0,1567831890);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_role`
--

DROP TABLE IF EXISTS `sys_menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_role` (
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单角色中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_role`
--

LOCK TABLES `sys_menu_role` WRITE;
/*!40000 ALTER TABLE `sys_menu_role` DISABLE KEYS */;
INSERT INTO `sys_menu_role` VALUES (1,1),(1,2),(1,3),(2,3);
/*!40000 ALTER TABLE `sys_menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `tab_index` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_SYS_MODULE_GROUP_APP_ID_TAB_INDEX_STATUS` (`app_id`,`tab_index`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='菜单分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (1,41,'module1',1,1,'',0,1562839778,0,1568112203),(2,41,'角色权限',4,1,'',0,1568044418,0,1568112203),(3,41,'module2',2,1,'',0,1568112139,0,1568112203),(4,41,'module3',3,1,'',0,1568112153,0,1568112203);
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_org` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `tab_index` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_ORG_NAME_STATUS` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
INSERT INTO `sys_org` VALUES (1,0,'开发部',1,1,'',0,1563605146,0,1568112420),(2,0,'市场部',2,1,'',0,1563605183,0,1568112425),(3,0,'总务部',3,1,'',0,1563605206,0,1568112425),(4,1,'平台组',4,1,'',0,1563605247,0,1568112434);
/*!40000 ALTER TABLE `sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile`
--

DROP TABLE IF EXISTS `sys_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `true_name` varchar(64) NOT NULL COMMENT '真实名称',
  `mobile` varchar(24) NOT NULL COMMENT '联系手机',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_PROFILE_USER_ID` (`user_id`) USING BTREE,
  KEY `IDX_SYS_PROFILE_TRUE_NAME_MOBILE_USER_ID` (`true_name`,`mobile`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile`
--

LOCK TABLES `sys_profile` WRITE;
/*!40000 ALTER TABLE `sys_profile` DISABLE KEYS */;
INSERT INTO `sys_profile` VALUES (1,1,'luoyang','13900000000',NULL);
/*!40000 ALTER TABLE `sys_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `tab_index` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_ROLE_NAME_STATUS` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,0,'admin',1,1,'',0,0,0,1568112333),(2,0,'user',2,1,'',0,0,0,1568112364),(3,0,'管理员',3,1,'',0,0,0,1568112364),(5,2,'test',3,1,'',0,1562917331,0,1568112350);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `org_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '机构ID',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `tab_index` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAB排序',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `reg_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `memo` varchar(256) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SYS_USER_USERNAME` (`username`) USING BTREE,
  KEY `IDX_SYS_USER_TAB_INDEX` (`tab_index`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,0,'admin','e10adc3949ba59abbe56e057f20f883e',1,1,0,0,0,0,0,0,1568113181,''),(3,0,'admin111','e10adc3949ba59abbe56e057f20f883e',1,2,0,0,0,0,0,0,1568113190,''),(6,0,'test','',0,4,0,0,0,0,0,0,1568113190,''),(7,0,'superman','',0,3,0,0,0,0,0,0,1568113190,'');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (3,1),(3,5),(1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12 11:10:06
