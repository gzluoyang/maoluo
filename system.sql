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
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要认证',
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COMMENT='访问表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_access`
--

LOCK TABLES `sys_access` WRITE;
/*!40000 ALTER TABLE `sys_access` DISABLE KEYS */;
INSERT INTO `sys_access` VALUES (3,1,'新增应用','/admin/app/create',1,3,1,'',0,1562857252,0,1572251373),(4,1,'修改应用','/admin/app/update',1,4,1,'',0,1564045306,0,1572251373),(5,1,'删除应用','/admin/app/delete',1,5,1,'',0,1568112229,0,1572251373),(7,1,'设置角色','/admin/app/roles',1,6,1,'',0,1568112260,0,1572251373),(8,10,'用户登录','/admin/user/login',0,2,1,'',0,1572174114,0,1572199742),(9,10,'退出系统','/admin/user/logout',0,1,1,'',0,1572174178,0,1572199738),(10,10,'是否登录','/admin/home/isLogin',0,3,1,'',0,1572174219,0,1572237106),(14,12,'应用树','/admin/tree/app',1,7,1,'',0,1572236034,0,1572273750),(15,11,'菜单列表','/admin/home/menus',1,5,1,'',0,1572236130,0,1572273732),(16,11,'按钮列表','/admin/home/buttons',1,6,1,'',0,1572236389,0,1572273736),(17,12,'模块树','/admin/tree/module',1,8,1,'',0,1572236472,0,1572273752),(21,11,'应用列表','/admin/home/apps',1,4,1,'',0,1572236723,0,1572273730),(22,12,'分组树','/admin/tree/group',1,9,1,'',0,1572236936,0,1572273754),(23,12,'菜单树','/admin/tree/menu',1,10,1,'',0,1572237003,0,1572273755),(24,12,'角色树','/admin/tree/role',1,11,1,'',0,1572237086,0,1572273757),(25,12,'机构树','/admin/tree/org',1,12,1,'',0,1572237154,0,1572273758),(26,1,'查询应用','/admin/app/index',1,1,1,'',0,1572251146,0,1572251371),(27,1,'读取应用','/admin/app/read',1,2,1,'',0,1572251346,0,1572251373),(28,4,'新增菜单','/admin/menu/create',1,3,1,'',0,1572260994,0,1572261341),(29,4,'修改菜单','/admin/menu/update',1,4,1,'',0,1572261023,0,1572261345),(30,4,'删除菜单','/admin/menu/delete',1,5,1,'',0,1572261052,0,1572261346),(31,4,'查询菜单','/admin/menu/index',1,1,1,'',0,1572261073,0,1572261337),(32,4,'读取菜单','/admin/menu/read',1,2,1,'',0,1572261100,0,1572261338),(33,4,'设置角色','/admin/menu/roles',1,6,1,'',0,1572261364,0,1572261367),(34,3,'查询分组','/admin/group/index',1,1,1,'',0,1572261396,0,1572261541),(35,3,'读取分组','/admin/group/read',1,2,1,'',0,1572261414,0,1572261541),(36,3,'新增分组','/admin/group/create',1,3,1,'',0,1572261450,0,1572261541),(37,3,'修改分组','/admin/group/update',1,4,1,'',0,1572261500,0,1572261541),(38,3,'删除分组','/admin/group/delete',1,5,1,'',0,1572261516,0,1572261541),(39,2,'查询按钮','/admin/button/index',1,1,1,'',0,1572261580,0,1572261700),(40,2,'读取按钮','/admin/button/read',1,2,1,'',0,1572261605,0,1572261700),(41,2,'新增按钮','/admin/button/create',1,3,1,'',0,1572261633,0,1572261697),(42,2,'修改按钮','/admin/button/update',1,4,1,'',0,1572261649,0,1572261696),(43,2,'删除按钮','/admin/button/delete',1,5,1,'',0,1572261665,0,1572261694),(44,2,'设置角色','/admin/button/roles',1,6,1,'',0,1572261685,0,1572261690),(45,5,'查询模块','/admin/module/index',1,1,1,'',0,1572261744,0,1572261869),(46,5,'读取模块','/admin/module/read',1,2,1,'',0,1572261764,0,1572261869),(47,5,'新增模块','/admin/module/create',1,3,1,'',0,1572261785,0,1572261867),(48,5,'修改模块','/admin/module/update',1,4,1,'',0,1572261801,0,1572261866),(49,5,'删除模块','/admin/module/delete',1,5,1,'',0,1572261860,0,1572261864),(50,6,'查询访问','/admin/access/index',1,1,1,'',0,1572261891,0,1572262011),(51,6,'读取访问','/admin/access/read',1,2,1,'',0,1572261909,0,1572262011),(52,6,'新增访问','/admin/access/create',1,3,1,'',0,1572261928,0,1572262010),(53,6,'修改访问','/admin/access/update',1,4,1,'',0,1572261962,0,1572262007),(54,6,'删除访问','/admin/access/delete',1,5,1,'',0,1572261982,0,1572262006),(55,6,'设置角色','/admin/access/roles',1,6,1,'',0,1572261999,0,1572262002),(56,8,'查询机构','/admin/org/index',1,1,1,'',0,1572262046,0,1572262130),(57,8,'读取机构','/admin/org/read',1,2,1,'',0,1572262066,0,1572262130),(58,8,'新增机构','/admin/org/create',1,3,1,'',0,1572262083,0,1572262127),(59,8,'修改机构','/admin/org/update',1,4,1,'',0,1572262098,0,1572262126),(61,8,'删除机构','/admin/org/delete',1,5,1,'',0,1572262114,0,1572262125),(62,9,'查询用户','/admin/user/index',1,1,1,'',0,1572262234,0,1572262328),(64,9,'读取用户','/admin/user/read',1,2,1,'\n',0,1572262250,0,1572262328),(65,9,'新增用户','/admin/user/create',1,3,1,'',0,1572262271,0,1572262327),(66,9,'修改用户','/admin/user/update',1,4,1,'',0,1572262287,0,1572262326),(67,9,'删除用户','/admin/user/delete',1,5,1,'',0,1572262305,0,1572262325),(68,9,'设置角色','/admin/user/roles',1,6,1,'',0,1572262320,0,1572262323),(69,7,'查询角色','/admin/role/index',1,1,1,'',0,1572266717,0,1572266930),(70,7,'读取角色','/admin/role/read',1,2,1,'',0,1572266738,0,1572266935),(71,7,'新增角色','/admin/role/create',1,3,1,'',0,1572266770,0,1572266938),(72,7,'修改角色','/admin/role/update',1,4,1,'',0,1572266787,0,1572266938),(73,7,'删除角色','/admin/role/delete',1,5,1,'',0,1572266813,0,1572266933),(74,7,'设置用户','/admin/role/users',1,6,1,'',0,1572266971,0,1572266987),(75,7,'设置访问','/admin/role/accesses',1,7,1,'',0,1572267067,0,1572267070),(76,7,'设置菜单','/admin/role/menus',1,8,1,'',0,1572267171,0,1572267177),(77,7,'设置按钮','/admin/role/buttons',1,9,1,'',0,1572267210,0,1572267213);
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
INSERT INTO `sys_access_role` VALUES (21,1),(15,1),(16,1),(14,1),(17,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(3,1),(4,1),(5,1),(7,1),(34,1),(35,1),(36,1),(37,1),(38,1),(31,1),(32,1),(28,1),(29,1),(30,1),(33,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(56,1),(57,1),(58,1),(59,1),(61,1),(62,1),(64,1),(65,1),(66,1),(67,1),(68,1),(21,2),(15,2),(16,2),(21,3),(15,3),(16,3),(14,3),(17,3),(22,3),(23,3),(24,3),(25,3),(56,3),(57,3),(58,3),(59,3),(61,3),(62,3),(64,3),(65,3),(66,3),(67,3),(68,3);
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
  `home` varchar(32) NOT NULL COMMENT '主页',
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app`
--

LOCK TABLES `sys_app` WRITE;
/*!40000 ALTER TABLE `sys_app` DISABLE KEYS */;
INSERT INTO `sys_app` VALUES (40,'素质教育','','','x-fa fa-graduation-cap',2,1,'自营电商是由平台自己经营商品或服务的网上销售平台。',0,1558431657,0,1571946543),(41,'系统应用','dashboard','','x-fa fa-cogs',1,1,'管理平台的基础信息，如用户、权限、模块、菜单等',0,1558432428,0,1572255995),(45,'商户电商','','','x-fa fa-cubes',3,1,'商户电商是由商家自己管理、推广、销售的商品交易平台。',0,1558604961,0,1571581216);
/*!40000 ALTER TABLE `sys_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_role`
--

DROP TABLE IF EXISTS `sys_app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_role` (
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_role`
--

LOCK TABLES `sys_app_role` WRITE;
/*!40000 ALTER TABLE `sys_app_role` DISABLE KEYS */;
INSERT INTO `sys_app_role` VALUES (40,1),(40,2),(41,1);
/*!40000 ALTER TABLE `sys_app_role` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='工具栏按钮表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_button`
--

LOCK TABLES `sys_button` WRITE;
/*!40000 ALTER TABLE `sys_button` DISABLE KEYS */;
INSERT INTO `sys_button` VALUES (1,1,'apps_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1562824023,0,1570764645),(2,1,'apps_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1562833411,0,1570698594),(3,1,'apps_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1568112048,0,1570698670),(4,1,'apps_split1','分隔线1','','',4,1,'',0,1568112055,0,1571797774),(5,4,'menus_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570764746,0,1570764746),(6,4,'menus_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570765190,0,1570765190),(7,4,'menus_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570765374,0,1570765374),(8,4,'menus_split1','分隔线1','','',4,1,'',0,1570765617,0,1570766795),(9,4,'menus_role','角色','','fa fa-lg fa-user',5,1,'',0,1570765665,0,1570788222),(11,4,'menus_split2','分隔线2','','',6,1,'',0,1570766777,0,1570788247),(12,3,'groups_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570778226,0,1570778317),(13,3,'groups_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570778253,0,1570778317),(14,3,'groups_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570778275,0,1570778317),(15,3,'groups_split1','分割线1','','',4,1,'',0,1570778299,0,1570778312),(16,5,'buttons_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570778596,0,1570778718),(17,5,'buttons_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570778615,0,1570778718),(18,5,'buttons_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570778634,0,1570778718),(19,5,'buttons_split1','分隔符1','','',4,1,'',0,1570778654,0,1570778718),(20,5,'buttons_role','角色','','fa fa-lg fa-user',5,1,'',0,1570778681,0,1570790478),(21,5,'buttons_split2','分隔符2','','',6,1,'',0,1570778706,0,1570778718),(22,7,'modules_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570791449,0,1570791532),(23,7,'modules_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570791469,0,1570791532),(24,7,'modules_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570791486,0,1570791532),(25,7,'modules_split1','分隔符1','','',4,1,'',0,1570791508,0,1570791532),(26,8,'accesses_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570792312,0,1570792430),(27,8,'accesses_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570792330,0,1570792430),(28,8,'accesses_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570792353,0,1570792430),(29,8,'accesses_split1','分隔符1','','',4,1,'',0,1570792373,0,1570792430),(30,8,'accesses_role','角色','','fa fa-lg fa-user',5,1,'',0,1570792402,0,1570792430),(31,8,'accesses_split2','分隔符2','','',6,1,'',0,1570792425,0,1570792430),(32,9,'roles_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570802644,0,1570802712),(33,9,'roles_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570802663,0,1570802712),(34,9,'roles_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570802679,0,1570802712),(35,9,'roles_split1','分隔符1','','',4,1,'',0,1570802697,0,1570802712),(36,9,'roles_user','用户','','fa fa-lg fa-users',5,1,'',0,1570802785,0,1570803196),(37,9,'roles_access','访问','','fa fa-lg fa-cloud-upload',6,1,'',0,1570802880,0,1570802883),(38,9,'roles_menu','菜单','','fa fa-lg fa-list-ul',8,1,'',0,1570802926,0,1570802950),(39,9,'roles_split2','分隔符2','','',7,1,'',0,1570802947,0,1570802950),(40,9,'roles_button','按钮','','fa fa-lg fa-hand-pointer-o',9,1,'',0,1570803002,0,1570803010),(41,9,'roles_split3','分隔符3','','',10,1,'',0,1570803034,0,1570803038),(42,2,'orgs_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570803852,0,1570803930),(43,2,'orgs_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570803880,0,1570804000),(44,2,'orgs_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570803899,0,1570803930),(45,2,'orgs_split1','分隔符1','','',4,1,'',0,1570803922,0,1570803930),(46,6,'users_add','新增','','fa fa-lg fa-plus-circle',1,1,'',0,1570804846,0,1570804953),(47,6,'users_edit','修改','','fa fa-lg fa-edit',2,1,'',0,1570804874,0,1570804953),(48,6,'users_del','删除','','fa fa-lg fa-times-circle',3,1,'',0,1570804889,0,1570804953),(49,6,'users_split1','分隔符1','','',4,1,'',0,1570804909,0,1570804953),(50,6,'users_role','角色','','fa fa-lg fa-user',5,1,'',0,1570804944,0,1570804953),(51,6,'users_split2','分隔符2','','',6,1,'',0,1570804972,0,1570804976),(52,1,'apps_role','角色','','fa fa-lg fa-user',5,1,'',0,1571797758,0,1571797774),(53,1,'apps_split2','分隔线2','','',6,1,'',0,1571797802,0,1571797807);
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
INSERT INTO `sys_button_role` VALUES (1,1),(2,1),(3,1),(4,1),(12,1),(13,1),(14,1),(15,1),(5,1),(6,1),(7,1),(8,1),(9,1),(11,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(39,1),(38,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(53,1),(52,1);
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
INSERT INTO `sys_group` VALUES (1,41,'菜单按钮','','x-fa fa-indent',2,1,'',0,1558713613,0,1568111789),(4,41,'用户机构','','x-fa fa-user',4,1,'',0,1558714797,0,1568111782),(8,40,'学生管理','','x-fa fa-users',1,1,'',0,1561609678,0,1571751641),(9,41,'访问权限','','x-fa fa-users',3,1,'',0,1562339144,0,1568111789),(10,41,'系统设置','','x-fa fa-cogs',1,1,'',0,1567832308,0,1568111789);
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
INSERT INTO `sys_menu_role` VALUES (2,3),(3,1),(4,1),(5,1),(7,1),(8,1),(9,1),(2,1),(6,1),(1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='菜单分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (1,41,'应用管理',4,1,'',0,1562839778,0,1572273694),(2,41,'按钮管理',7,1,'',0,1568044418,0,1572273694),(3,41,'菜单分组',5,1,'',0,1568112139,0,1572273694),(4,41,'菜单管理',6,1,'',0,1568112153,0,1572273694),(5,41,'模块管理',8,1,'',0,1572090384,0,1572273694),(6,41,'访问管理',9,1,'',0,1572090394,0,1572273694),(7,41,'角色管理',10,1,'',0,1572090424,0,1572273694),(8,41,'机构管理',11,1,'',0,1572090439,0,1572273694),(9,41,'用户管理',12,1,'',0,1572090448,0,1572273694),(10,41,'公共操作',1,1,'',0,1572174065,0,1572174074),(11,41,'资源列表',2,1,'',0,1572273659,0,1572273769),(12,41,'树视图',3,1,'',0,1572273691,0,1572273719);
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
INSERT INTO `sys_user` VALUES (1,0,'admin','9f5e3bff49ccba012f689c5103b26024',1,1,0,0,0,0,0,0,1568113181,''),(6,0,'test','',0,4,0,0,0,0,0,0,1568113190,'');
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
INSERT INTO `sys_user_role` VALUES (1,1),(6,3);
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

-- Dump completed on 2019-10-29  1:05:15
