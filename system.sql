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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_button`
--

DROP TABLE IF EXISTS `sys_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_button` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='工具栏按钮表';
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-10 22:01:53
