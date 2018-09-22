-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cgsp
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `eq_department`
--

DROP TABLE IF EXISTS `eq_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_cate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_department`
--

LOCK TABLES `eq_department` WRITE;
/*!40000 ALTER TABLE `eq_department` DISABLE KEYS */;
INSERT INTO `eq_department` VALUES (10,'院首长','院办'),(12,'院办公室','院办'),(13,'科研计划处','机关'),(14,'质量成果处','机关'),(15,'生物安全处','机关'),(16,'条件建设处','机关'),(17,'政治工作处','机关'),(18,'纪检监察处','机关'),(19,'安全管理处','机关'),(20,'供应保障处','机关'),(21,'卫生勤务与血液研究所','各所'),(22,'辐射医学研究所','各所'),(23,'军事认知与脑科学研究所','各所'),(24,'环境医学与作业医学研究所','各所'),(25,'微生物与流行病研究所','各所'),(26,'毒物药物研究所','各所'),(27,'生命组学研究所','各所'),(28,'生物工程研究所','各所'),(29,'军事兽医研究所','各所'),(30,'实验动物中心','各所'),(31,'科研保障中心','各所'),(32,'生物医学分析中心','各所'),(33,'原综合药材仓库','各所'),(34,'原军械仓库','各所'),(35,'服务保障中心','各所'),(36,'勤务保障队','各所');
/*!40000 ALTER TABLE `eq_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eq_staff`
--

DROP TABLE IF EXISTS `eq_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_loginname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_department` int(11) DEFAULT NULL,
  `staff_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_zhiwu` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_zhicheng` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_jishudengji` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_junxian` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_jsjjunxian` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_zhiwudengji` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_wenzhiji` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_state` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_jgzid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_grade` int(5) DEFAULT '1',
  `staff_birthplace` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_birthyday` date DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_staff`
--

LOCK TABLES `eq_staff` WRITE;
/*!40000 ALTER TABLE `eq_staff` DISABLE KEYS */;
INSERT INTO `eq_staff` VALUES (1,'admin','admin123',NULL,'审核人员','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','1','562090707@qq.com','7777777',1,'北京','2018-09-03'),(2,'yjgcmyb','yjgcmyb123',NULL,'院办参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090708@qq.com','7777778',1,'北京','2018-09-04'),(3,'yjgcmjg','yjgcmjg123',NULL,'机关参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090709@qq.com','7777779',1,'北京','2018-09-05'),(4,'wsqwxy','wsqwxy123',NULL,'一所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090710@qq.com','7777780',1,'北京','2018-09-06'),(5,'fsyx','fsyx123',NULL,'二所所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090711@qq.com','7777781',1,'北京','2018-09-07'),(6,'jsrznkx','jsrznkx123',NULL,'三所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090712@qq.com','7777782',1,'北京','2018-09-08'),(7,'hjzyyx','hjzyyx123',NULL,'四所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090713@qq.com','7777783',1,'北京','2018-09-09'),(8,'wswlxb','wswlxb123',NULL,'五所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090714@qq.com','7777784',1,'北京','2018-09-10'),(9,'dwywyjs','dwywyjs123',NULL,'六所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090715@qq.com','7777785',1,'北京','2018-09-11'),(10,'smzxyjs','smzxyjs123',NULL,'七所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090716@qq.com','7777786',1,'北京','2018-09-12'),(11,'swgcyjs','swgcyjs123',NULL,'八所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090717@qq.com','7777787',1,'北京','2018-09-13'),(12,'jssyyjs','jssyyjs123',NULL,'九所参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090718@qq.com','7777788',1,'北京','2018-09-14'),(13,'sydwzx','sydwzx123',NULL,'实验动物中心参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090719@qq.com','7777789',1,'北京','2018-09-15'),(14,'kybzzx','kybzzx123',NULL,'科研保障中心参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090720@qq.com','7777790',1,'北京','2018-09-16'),(15,'swyxfxzx','swyxfxzx123',NULL,'生物医学分析中心参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090721@qq.com','7777791',1,'北京','2018-09-17'),(16,'zhycck','zhycck123',NULL,'原综合药材仓库参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090722@qq.com','7777792',1,'北京','2018-09-18'),(17,'jxck','jxck123',NULL,'原军械仓库参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090723@qq.com','7777793',1,'北京','2018-09-19'),(18,'fwbzzx','fwbzzx123',NULL,'服务保障中心参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090724@qq.com','7777794',1,'北京','2018-09-20'),(19,'qwbzd','qwbzd123',NULL,'勤务保障队参谋','男',NULL,'助理研究员','技术12级',NULL,NULL,NULL,'文职4级','15871859099','2','562090725@qq.com','7777795',1,'北京','2018-09-21');
/*!40000 ALTER TABLE `eq_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eq_staff_extend`
--

DROP TABLE IF EXISTS `eq_staff_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eq_staff_extend` (
  `extend_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `extend_nation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_educationle` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_zzmianmao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_bysj` date DEFAULT NULL,
  `extend_byyx` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_wgysp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_ywhuzhao` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_huzhaohao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_huzhaoyouxiaoqi` date DEFAULT NULL,
  `extend_gzjlsj001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlsj002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlsj003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlsj004` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlsj005` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlcsgzjzw001` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlcsgzjzw002` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlcsgzjzw003` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlcsgzjzw004` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_gzjlcsgzjzw005` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqksj001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqksj002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkdwsf001` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkdwsf002` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkxm001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkxm002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkxm003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgx001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgx002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgx003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgzjzw001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgzjzw002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgzjzw003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgwf001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgwf002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_jtqkgwf003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`extend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eq_staff_extend`
--

LOCK TABLES `eq_staff_extend` WRITE;
/*!40000 ALTER TABLE `eq_staff_extend` DISABLE KEYS */;
INSERT INTO `eq_staff_extend` VALUES (1,1,'维吾尔族','研究生','党员','2018-09-10','第四军医大学','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `eq_staff_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newstime` date DEFAULT NULL,
  `newcontent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-13  7:59:28
