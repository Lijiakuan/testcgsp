/*
Navicat MySQL Data Transfer

Source Server         : Conn
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : meds

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-09-16 12:38:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chuxing
-- ----------------------------
DROP TABLE IF EXISTS `chuxing`;
CREATE TABLE `chuxing` (
  `chuxing_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`chuxing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chuxing
-- ----------------------------

-- ----------------------------
-- Table structure for chuxingdetail
-- ----------------------------
DROP TABLE IF EXISTS `chuxingdetail`;
CREATE TABLE `chuxingdetail` (
  `chuxingdetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `chuxing_id` int(11) DEFAULT NULL,
  `chuxing_shijian` date DEFAULT NULL,
  `chuxing_content` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`chuxingdetail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chuxingdetail
-- ----------------------------

-- ----------------------------
-- Table structure for eq_department
-- ----------------------------
DROP TABLE IF EXISTS `eq_department`;
CREATE TABLE `eq_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_cate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_department
-- ----------------------------
INSERT INTO `eq_department` VALUES ('10', '院首长', '八处一办');
INSERT INTO `eq_department` VALUES ('12', '院办公室', '八处一办');
INSERT INTO `eq_department` VALUES ('13', '科研计划处', '八处一办');
INSERT INTO `eq_department` VALUES ('14', '质量成果处', '八处一办');
INSERT INTO `eq_department` VALUES ('15', '生物安全处', '八处一办');
INSERT INTO `eq_department` VALUES ('16', '条件建设处', '八处一办');
INSERT INTO `eq_department` VALUES ('17', '政治工作处', '八处一办');
INSERT INTO `eq_department` VALUES ('18', '纪检监察处', '八处一办');
INSERT INTO `eq_department` VALUES ('19', '安全管理处', '八处一办');
INSERT INTO `eq_department` VALUES ('20', '供应保障处', '八处一办');
INSERT INTO `eq_department` VALUES ('21', '卫生勤务与血液研究所', '各所');
INSERT INTO `eq_department` VALUES ('22', '辐射医学研究所', '各所');
INSERT INTO `eq_department` VALUES ('23', '军事认知与脑科学研究所', '各所');
INSERT INTO `eq_department` VALUES ('24', '环境医学与作业医学研究所', '各所');
INSERT INTO `eq_department` VALUES ('25', '微生物与流行病研究所', '各所');
INSERT INTO `eq_department` VALUES ('26', '毒物药物研究所', '各所');
INSERT INTO `eq_department` VALUES ('27', '生命组学研究所', '各所');
INSERT INTO `eq_department` VALUES ('28', '生物工程研究所', '各所');
INSERT INTO `eq_department` VALUES ('29', '军事兽医研究所', '各所');
INSERT INTO `eq_department` VALUES ('30', '实验动物中心', '各所');
INSERT INTO `eq_department` VALUES ('31', '科研保障中心', '各所');
INSERT INTO `eq_department` VALUES ('32', '生物医学分析中心', '各所');
INSERT INTO `eq_department` VALUES ('33', '原综合药材仓库', '各所');
INSERT INTO `eq_department` VALUES ('34', '原军械仓库', '各所');
INSERT INTO `eq_department` VALUES ('35', '服务保障中心', '各所');
INSERT INTO `eq_department` VALUES ('36', '勤务保障队', '各所');

-- ----------------------------
-- Table structure for eq_staff
-- ----------------------------
DROP TABLE IF EXISTS `eq_staff`;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_staff
-- ----------------------------
INSERT INTO `eq_staff` VALUES ('1', 'admin', 'admin123', null, '审核人员', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '1', '562090707@qq.com', '7777777', '1', '北京', '2018-09-03');
INSERT INTO `eq_staff` VALUES ('2', 'yjgcmyb', 'yjgcmyb123', null, '院办参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090708@qq.com', '7777778', '2', '北京', '2018-09-04');
INSERT INTO `eq_staff` VALUES ('3', 'yjgcmjg', 'yjgcmjg123', null, '机关参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090709@qq.com', '7777779', '2', '北京', '2018-09-05');
INSERT INTO `eq_staff` VALUES ('4', 'wsqwxy', 'wsqwxy123', null, '一所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090710@qq.com', '7777780', '2', '北京', '2018-09-06');
INSERT INTO `eq_staff` VALUES ('5', 'fsyx', 'fsyx123', null, '二所所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090711@qq.com', '7777781', '2', '北京', '2018-09-07');
INSERT INTO `eq_staff` VALUES ('6', 'jsrznkx', 'jsrznkx123', null, '三所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090712@qq.com', '7777782', '2', '北京', '2018-09-08');
INSERT INTO `eq_staff` VALUES ('7', 'hjzyyx', 'hjzyyx123', null, '四所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090713@qq.com', '7777783', '2', '北京', '2018-09-09');
INSERT INTO `eq_staff` VALUES ('8', 'wswlxb', 'wswlxb123', null, '五所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090714@qq.com', '7777784', '2', '北京', '2018-09-10');
INSERT INTO `eq_staff` VALUES ('9', 'dwywyjs', 'dwywyjs123', null, '六所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090715@qq.com', '7777785', '2', '北京', '2018-09-11');
INSERT INTO `eq_staff` VALUES ('10', 'smzxyjs', 'smzxyjs123', null, '七所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090716@qq.com', '7777786', '2', '北京', '2018-09-12');
INSERT INTO `eq_staff` VALUES ('11', 'swgcyjs', 'swgcyjs123', null, '八所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090717@qq.com', '7777787', '2', '北京', '2018-09-13');
INSERT INTO `eq_staff` VALUES ('12', 'jssyyjs', 'jssyyjs123', null, '九所参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090718@qq.com', '7777788', '2', '北京', '2018-09-14');
INSERT INTO `eq_staff` VALUES ('13', 'sydwzx', 'sydwzx123', null, '实验动物中心参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090719@qq.com', '7777789', '2', '北京', '2018-09-15');
INSERT INTO `eq_staff` VALUES ('14', 'kybzzx', 'kybzzx123', null, '科研保障中心参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090720@qq.com', '7777790', '2', '北京', '2018-09-16');
INSERT INTO `eq_staff` VALUES ('15', 'swyxfxzx', 'swyxfxzx123', null, '生物医学分析中心参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090721@qq.com', '7777791', '2', '北京', '2018-09-17');
INSERT INTO `eq_staff` VALUES ('16', 'zhycck', 'zhycck123', null, '原综合药材仓库参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090722@qq.com', '7777792', '2', '北京', '2018-09-18');
INSERT INTO `eq_staff` VALUES ('17', 'jxck', 'jxck123', null, '原军械仓库参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090723@qq.com', '7777793', '2', '北京', '2018-09-19');
INSERT INTO `eq_staff` VALUES ('18', 'fwbzzx', 'fwbzzx123', null, '服务保障中心参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090724@qq.com', '7777794', '2', '北京', '2018-09-20');
INSERT INTO `eq_staff` VALUES ('19', 'qwbzd', 'qwbzd123', null, '勤务保障队参谋', '男', null, '助理研究员', '技术12级', null, null, null, '文职4级', '15871859099', '2', '562090725@qq.com', '7777795', '2', '北京', '2018-09-21');
INSERT INTO `eq_staff` VALUES ('20', 'jingbin', 'qweasdzxc', null, '荆斌', '男', '所长', '研究实习员', '技术9级', '上尉', '技术10级', '副营', '文职4级', '15901413769', null, 'jingbin007007@163.com', '2583216', '3', '太原', '2018-09-03');
INSERT INTO `eq_staff` VALUES ('21', 'jingbin001', 'qwe123', null, '荆斌', '男', '副所长', '研究实习员', '技术4级', '上尉', '技术10级', '副连', '文职4级', '15901413769', null, 'jingbin007007@163.com', '2583216', '3', '太原', '2018-09-04');
INSERT INTO `eq_staff` VALUES ('22', 'jingbin006', 'rt34tr', '12', '荆斌', '男', '院长', '研究实习员', '技术2级', '中尉', '技术9级', '排', '文职1级', '15901413769', null, 'jingbin007007@163.com', '2583216', '3', '太原', '2018-09-04');

-- ----------------------------
-- Table structure for eq_staff_baomi
-- ----------------------------
DROP TABLE IF EXISTS `eq_staff_baomi`;
CREATE TABLE `eq_staff_baomi` (
  `baomi_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `baomi_buzhibie` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_zhiji` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_jwtlbeg` date DEFAULT NULL,
  `baomi_jwtlend` date DEFAULT NULL,
  `baomi_xddzsblx1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsblx2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsbxh1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsbxh2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsbsmdj1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsbsmdj2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xddzsbyf` int(11) DEFAULT NULL,
  `baomi_duihao1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xdsmzlmc1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xdsmzlmc2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xdsmzlfs1` int(11) DEFAULT NULL,
  `baomi_xdsmzlfs2` int(11) DEFAULT NULL,
  `baomi_xdsmzlsmdj1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xdsmzlsmdj2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baomi_xdsmzlyf` int(11) DEFAULT NULL, 
  `baomi_duihao2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`baomi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_staff_baomi
-- ----------------------------

-- ----------------------------
-- Table structure for eq_staff_extend
-- ----------------------------
DROP TABLE IF EXISTS `eq_staff_extend`;
CREATE TABLE `eq_staff_extend` (
  `extend_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `extend_nation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_educationle` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_qkbzwhzc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_qkbjxhjb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_zzmianmao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_bysjbyyx` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_wgysp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_ywhuzhao` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `extend_cgqksj003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkgjjrw001` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkgjjrw002` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkgjjrw003` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkdwsf001` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkdwsf002` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extend_cgqkdwsf003` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `staffdetail_yjfxcjgx` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffdetail_grjjgdzd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_swscmxm` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_swscmdh` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_huzhaozhonglei` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_huzhaohao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_fazhaoriqi` date DEFAULT NULL,
  `passport_huzhaoyouxiaoqi` date DEFAULT NULL,
  `passport_yanqi` date DEFAULT NULL,
  `passport_beizhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`extend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_staff_extend
-- ----------------------------
INSERT INTO `eq_staff_extend` VALUES ('1', '1', null, '维吾尔族', '研究生', null, null, '党员', '2018-09-10', '第四军医大学', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for eq_task
-- ----------------------------
DROP TABLE IF EXISTS `eq_task`;
CREATE TABLE `eq_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `taskhb_id1` int(11) DEFAULT NULL,
  `task_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_tarcountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_tarcity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_purposemap` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_cjcfbeg` date DEFAULT NULL,
  `task_cjggend` date DEFAULT NULL,
  `task_lijingshijian` date DEFAULT NULL,
  `task_rujingshijian` date DEFAULT NULL,
  `task_jiaoliutimu` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_significance` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_cgryqkbaddr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_bmzrsaddr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_yqhaddrzw` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_yqhaddryw` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_xcapzw` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_xcapyw` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_zhuangtai` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_beizhu` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_cjsj` date DEFAULT NULL,
  `task_xgsj` date DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_task
-- ----------------------------

-- ----------------------------
-- Table structure for hb_task1
-- ----------------------------
DROP TABLE IF EXISTS `hb_task1`;
CREATE TABLE `hb_task1` (
  `taskhb_id1` int(11) NOT NULL AUTO_INCREMENT,
  `taskhb_id2` int(11) DEFAULT NULL,
  `taskhb_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_tarcountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_tarcity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_cjcfbeg` date DEFAULT NULL,
  `taskhb_cjggend` date DEFAULT NULL,
  `taskhb_lijingbeg` date DEFAULT NULL,
  `taskhb_rujingend` date DEFAULT NULL,
  `taskhb_qsjdz` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_significance` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_zhuangtai` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_beizhu` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_cjsj` date DEFAULT NULL,
  `taskhb_xgsj` date DEFAULT NULL,
  PRIMARY KEY (`taskhb_id1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hb_task1
-- ----------------------------

-- ----------------------------
-- Table structure for hb_task2
-- ----------------------------
DROP TABLE IF EXISTS `hb_task2`;
CREATE TABLE `hb_task2` (
  `taskhb_id2` int(11) NOT NULL AUTO_INCREMENT,
  `taskhb_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_tarcountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_tarcity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_cjcfbeg` date DEFAULT NULL,
  `taskhb_cjggend` date DEFAULT NULL,
  `taskhb_significance` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_zhuangtai` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_beizhu` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_cjsj` date DEFAULT NULL,
  `taskhb_xgsj` date DEFAULT NULL,
  `taskhb_lijingbeg` date DEFAULT NULL,
  `taskhb_rujingend` date DEFAULT NULL,
  `taskhb_chengpijian001` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_chengpijian002` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taskhb_chengpijian003` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`taskhb_id2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hb_task2
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newstime` date DEFAULT NULL,
  `newcontent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
