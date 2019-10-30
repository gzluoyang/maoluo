-- MySQL dump 10.13  Distrib 5.6.42, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: education
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
-- Table structure for table `edu_course`
--

DROP TABLE IF EXISTS `edu_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `stutus` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_edu_course_name` (`name`) USING BTREE,
  UNIQUE KEY `uni_edu_course_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course`
--

LOCK TABLES `edu_course` WRITE;
/*!40000 ALTER TABLE `edu_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_category`
--

DROP TABLE IF EXISTS `edu_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_course_category_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_category`
--

LOCK TABLES `edu_course_category` WRITE;
/*!40000 ALTER TABLE `edu_course_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_examine`
--

DROP TABLE IF EXISTS `edu_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `intro` varchar(256) DEFAULT NULL COMMENT '简介',
  `total` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '总分',
  `scale` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '总分比例',
  `duration` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '时长',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `memo` varchar(256) NOT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_edu_examine_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_examine`
--

LOCK TABLES `edu_examine` WRITE;
/*!40000 ALTER TABLE `edu_examine` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_examine_log`
--

DROP TABLE IF EXISTS `edu_examine_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_examine_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `student_id` int(10) unsigned NOT NULL COMMENT '考生ID',
  `student_code` varchar(32) NOT NULL COMMENT '考生学号',
  `examine_id` int(10) unsigned NOT NULL COMMENT '考试定义ID',
  `examine_code` varchar(32) NOT NULL COMMENT '考试编码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `intro` varchar(256) DEFAULT NULL COMMENT '简介',
  `total` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '总分',
  `scale` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '总分比例',
  `duration` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '时长',
  `begin_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `finish_time` int(10) unsigned NOT NULL COMMENT '完成时间',
  `image` varchar(128) DEFAULT NULL COMMENT '作品照片',
  `video` varchar(128) DEFAULT NULL COMMENT '作品视频',
  `teacher_id` int(10) NOT NULL DEFAULT '0' COMMENT '打分老师ID',
  `score` tinyint(3) unsigned NOT NULL COMMENT '分数',
  `score_time` int(10) unsigned NOT NULL COMMENT '评分时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '评语',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_examine_log`
--

LOCK TABLES `edu_examine_log` WRITE;
/*!40000 ALTER TABLE `edu_examine_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_examine_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_examine_vote`
--

DROP TABLE IF EXISTS `edu_examine_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_examine_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `examine_id` int(10) unsigned NOT NULL COMMENT '考试ID',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `video` varchar(128) DEFAULT NULL COMMENT '视频',
  `score` tinyint(2) unsigned NOT NULL COMMENT '分数',
  `option_a` varchar(128) NOT NULL COMMENT '选项A',
  `option_b` varchar(128) NOT NULL COMMENT '选项B',
  `option_c` varchar(128) NOT NULL COMMENT '选项C',
  `option_d` varchar(128) NOT NULL COMMENT '选项D',
  `answer` char(1) NOT NULL COMMENT '答案',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考题定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_examine_vote`
--

LOCK TABLES `edu_examine_vote` WRITE;
/*!40000 ALTER TABLE `edu_examine_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_examine_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_examine_vote_log`
--

DROP TABLE IF EXISTS `edu_examine_vote_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_examine_vote_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `examine_log_id` int(10) unsigned NOT NULL COMMENT '考试记录ID',
  `examine_vote_id` int(10) unsigned NOT NULL COMMENT '考试答题ID',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `video` varchar(128) DEFAULT NULL COMMENT '视频',
  `score` tinyint(2) unsigned NOT NULL COMMENT '分数',
  `option_a` varchar(128) NOT NULL COMMENT '选项A',
  `option_b` varchar(128) NOT NULL COMMENT '选项B',
  `option_c` varchar(128) NOT NULL COMMENT '选项C',
  `option_d` varchar(128) NOT NULL COMMENT '选项D',
  `answer` char(1) NOT NULL COMMENT '答案',
  `reply` char(1) DEFAULT NULL COMMENT '答题结果',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '答题时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封卷时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考题记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_examine_vote_log`
--

LOCK TABLES `edu_examine_vote_log` WRITE;
/*!40000 ALTER TABLE `edu_examine_vote_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_examine_vote_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_student`
--

DROP TABLE IF EXISTS `edu_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(64) NOT NULL COMMENT '学号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `mobile` varchar(21) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_edu_student_code` (`code`),
  KEY `idx_edu_student_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_student`
--

LOCK TABLES `edu_student` WRITE;
/*!40000 ALTER TABLE `edu_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_student_picture`
--

DROP TABLE IF EXISTS `edu_student_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_student_picture` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `picture` text NOT NULL COMMENT '照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生照片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_student_picture`
--

LOCK TABLES `edu_student_picture` WRITE;
/*!40000 ALTER TABLE `edu_student_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_student_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_teacher`
--

DROP TABLE IF EXISTS `edu_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(32) NOT NULL COMMENT '工号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `mobile` varchar(24) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` int(10) unsigned NOT NULL COMMENT '创建者ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updater` int(10) unsigned NOT NULL COMMENT '最后修改人ID',
  `update_time` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='老师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_teacher`
--

LOCK TABLES `edu_teacher` WRITE;
/*!40000 ALTER TABLE `edu_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_teacher_picture`
--

DROP TABLE IF EXISTS `edu_teacher_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_teacher_picture` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `picture` text NOT NULL COMMENT '照片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='老师照片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_teacher_picture`
--

LOCK TABLES `edu_teacher_picture` WRITE;
/*!40000 ALTER TABLE `edu_teacher_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_teacher_picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-30 14:16:06
