/*
Navicat MySQL Data Transfer

Source Server         : localConn
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : meds

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-07-21 16:17:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dic_collect_anatomy`
-- ----------------------------
DROP TABLE IF EXISTS `dic_collect_anatomy`;
CREATE TABLE `dic_collect_anatomy` (
  `COLLECT_NO` int(11) NOT NULL AUTO_INCREMENT,
  `COLLECT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLLECT_DESC` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`COLLECT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dic_collect_anatomy
-- ----------------------------
INSERT INTO `dic_collect_anatomy` VALUES ('1', '大脑', '大脑区域');
INSERT INTO `dic_collect_anatomy` VALUES ('2', '小脑', '小脑区域');
INSERT INTO `dic_collect_anatomy` VALUES ('3', '脑干', '脑干区域');
INSERT INTO `dic_collect_anatomy` VALUES ('4', '胃', '胃区域');
INSERT INTO `dic_collect_anatomy` VALUES ('5', '肝脏', '肝脏区域');
INSERT INTO `dic_collect_anatomy` VALUES ('6', '肺', '肺区域');

-- ----------------------------
-- Table structure for `dic_insp_method`
-- ----------------------------
DROP TABLE IF EXISTS `dic_insp_method`;
CREATE TABLE `dic_insp_method` (
  `DICINSP_METHOD_NO` int(11) NOT NULL AUTO_INCREMENT,
  `DICINSP_METHOD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DICINSP_METHOD_DESC` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DICINSP_METHOD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dic_insp_method
-- ----------------------------
INSERT INTO `dic_insp_method` VALUES ('1', '活检', '活检描述');
INSERT INTO `dic_insp_method` VALUES ('2', '快速冰冻', '快速冰冻描述');
INSERT INTO `dic_insp_method` VALUES ('3', '细胞学', '细胞学描述');
INSERT INTO `dic_insp_method` VALUES ('4', 'TCT', 'TCT描述');
INSERT INTO `dic_insp_method` VALUES ('5', '免疫组化', '免疫组化描述');
INSERT INTO `dic_insp_method` VALUES ('6', '肿瘤DNA倍体', '肿瘤DNA倍体描述');
INSERT INTO `dic_insp_method` VALUES ('7', 'FISH', 'FISH描述');
INSERT INTO `dic_insp_method` VALUES ('8', '基因检测', '基因检测描述');

-- ----------------------------
-- Table structure for `draw_photo_desc`
-- ----------------------------
DROP TABLE IF EXISTS `draw_photo_desc`;
CREATE TABLE `draw_photo_desc` (
  `PHOTO_DESC_NO` int(11) NOT NULL AUTO_INCREMENT,
  `DRAW_NO` int(11) DEFAULT NULL,
  `FILE_PATH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_DESC` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PHOTO_DESC_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of draw_photo_desc
-- ----------------------------
INSERT INTO `draw_photo_desc` VALUES ('1', '1', 'c:\\jingbin.jpg', null);
INSERT INTO `draw_photo_desc` VALUES ('2', '33', 'C:\\fakepath\\免疫荧光_肾癌.jpg', '肾癌');
INSERT INTO `draw_photo_desc` VALUES ('3', '34', 'C:\\fakepath\\免疫荧光_动脉.jpg', '动脉');
INSERT INTO `draw_photo_desc` VALUES ('4', '35', 'C:\\fakepath\\免疫荧光_肺癌.jpg', '肺癌');
INSERT INTO `draw_photo_desc` VALUES ('5', '36', 'C:\\fakepath\\免疫荧光_鳞状细胞癌.jpg', '2');

-- ----------------------------
-- Table structure for `eq_accept_sample`
-- ----------------------------
DROP TABLE IF EXISTS `eq_accept_sample`;
CREATE TABLE `eq_accept_sample` (
  `SAMPLE_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `SAMPLE_DESC` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SAMPLE_RESULT` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VISUAL_OBSERVATION` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEEL_RESULT` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRAW_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`SAMPLE_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_accept_sample
-- ----------------------------
INSERT INTO `eq_accept_sample` VALUES ('1', '1', '胃', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('2', '2', '大脑', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('3', '3', '', '', '', '', '', '1');
INSERT INTO `eq_accept_sample` VALUES ('4', '4', '', '', '', '', '', '1');
INSERT INTO `eq_accept_sample` VALUES ('5', '5', '', '', '', '', '', '1');
INSERT INTO `eq_accept_sample` VALUES ('6', '6', '', '', '', '', '', '1');
INSERT INTO `eq_accept_sample` VALUES ('7', '7', '', '', '', '', '', '1');
INSERT INTO `eq_accept_sample` VALUES ('8', '8', '大脑', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('9', '9', '大脑', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('10', '10', '小脑', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('11', '11', '小脑', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('12', '12', '脑干', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('13', '13', '肾', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('14', '14', '肾', '待处理', '常规', '肉眼观察结果', '常规保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('15', '15', '皮肤', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('16', '16', '皮肤', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('17', '17', '皮肤', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('18', '18', '胃', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('19', '19', '肺', '待处理', '常规', '肉眼观察结果', '永久保留', '1');
INSERT INTO `eq_accept_sample` VALUES ('20', '20', '肺', '待处理', '常规', '肉眼观察结果', '科研标本', '1');
INSERT INTO `eq_accept_sample` VALUES ('21', '21', '肺', '待处理', '常规', '肉眼观察结果', '科研标本', '1');
INSERT INTO `eq_accept_sample` VALUES ('22', '22', '肺', '待处理', '常规', '肉眼观察结果', '教学标本', '1');
INSERT INTO `eq_accept_sample` VALUES ('23', '22', '肺', '待处理', '常规', '肉眼观察结果', '教学标本', '0');
INSERT INTO `eq_accept_sample` VALUES ('24', '1', '胃', '待处理', '常规', '肉眼观察结果', '教学标本', '0');
INSERT INTO `eq_accept_sample` VALUES ('25', '1', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `eq_collect_anatomy`
-- ----------------------------
DROP TABLE IF EXISTS `eq_collect_anatomy`;
CREATE TABLE `eq_collect_anatomy` (
  `COLLECT_ANATOMY_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `COLLECT_NO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COLLECT_ANATOMY_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_collect_anatomy
-- ----------------------------
INSERT INTO `eq_collect_anatomy` VALUES ('1', '1', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('2', '2', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('3', '3', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('4', '4', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('5', '5', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('6', '6', '1');
INSERT INTO `eq_collect_anatomy` VALUES ('7', '7', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('8', '8', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('9', '9', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('10', '10', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('11', '11', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('12', '12', '2');
INSERT INTO `eq_collect_anatomy` VALUES ('13', '13', '3');
INSERT INTO `eq_collect_anatomy` VALUES ('14', '14', '3');
INSERT INTO `eq_collect_anatomy` VALUES ('15', '15', '3');
INSERT INTO `eq_collect_anatomy` VALUES ('16', '16', '3');
INSERT INTO `eq_collect_anatomy` VALUES ('17', '17', '3');
INSERT INTO `eq_collect_anatomy` VALUES ('18', '18', '4');
INSERT INTO `eq_collect_anatomy` VALUES ('19', '19', '4');
INSERT INTO `eq_collect_anatomy` VALUES ('20', '20', '5');
INSERT INTO `eq_collect_anatomy` VALUES ('21', '21', '6');
INSERT INTO `eq_collect_anatomy` VALUES ('22', '22', '6');
INSERT INTO `eq_collect_anatomy` VALUES ('23', '1', '3');

-- ----------------------------
-- Table structure for `eq_consultation`
-- ----------------------------
DROP TABLE IF EXISTS `eq_consultation`;
CREATE TABLE `eq_consultation` (
  `CONSULTATION_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `CONSULTATION_DATE` date DEFAULT NULL,
  `CONSULTATION_RESULT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONSULTATION_NOTE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CONSULTATION_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_consultation
-- ----------------------------
INSERT INTO `eq_consultation` VALUES ('1', '1', '2018-02-01', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('2', '2', '2018-02-02', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('3', '3', '2018-02-03', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('4', '4', '2018-02-04', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('5', '5', '2018-02-05', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('6', '6', '2018-02-06', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('7', '7', '2018-02-07', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('8', '8', '2018-02-08', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('9', '9', '2018-02-09', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('10', '10', '2018-02-10', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('11', '11', '2018-02-11', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('12', '12', '2018-02-12', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('13', '13', '2018-02-13', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('14', '14', '2018-02-14', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('15', '15', '2018-02-15', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('16', '16', '2018-02-16', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('17', '17', '2018-02-17', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('18', '18', '2018-02-18', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('19', '19', '2018-02-19', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('20', '20', '2018-02-20', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('21', '21', '2018-02-21', '会诊意见', '会诊备注');
INSERT INTO `eq_consultation` VALUES ('22', '22', '2018-02-22', '会诊意见', '会诊备注');

-- ----------------------------
-- Table structure for `eq_department`
-- ----------------------------
DROP TABLE IF EXISTS `eq_department`;
CREATE TABLE `eq_department` (
  `DEPT_NO` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPT_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPT_ALIAS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPT_GRADE` int(4) DEFAULT '1',
  PRIMARY KEY (`DEPT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_department
-- ----------------------------
INSERT INTO `eq_department` VALUES ('1', '01', '病理科', null, '1');
INSERT INTO `eq_department` VALUES ('2', '02', '消化内科', null, '1');
INSERT INTO `eq_department` VALUES ('3', '03', '呼吸内科', null, '1');
INSERT INTO `eq_department` VALUES ('4', '04', '肾内科', null, '1');

-- ----------------------------
-- Table structure for `eq_docs_draw`
-- ----------------------------
DROP TABLE IF EXISTS `eq_docs_draw`;
CREATE TABLE `eq_docs_draw` (
  `DOCS_DRAW_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DRAW_NO` int(5) DEFAULT NULL,
  `DOCS_FILENAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DOCS_DRAW_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eq_docs_draw
-- ----------------------------
INSERT INTO `eq_docs_draw` VALUES ('1', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('2', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('3', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('4', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('5', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('6', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('7', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('8', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('9', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('10', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('11', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('12', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('13', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('14', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('15', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('16', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('17', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('18', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('19', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('20', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('21', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('22', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('23', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('24', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('25', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('26', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('27', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('28', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('29', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('30', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('31', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('32', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('33', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('34', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('35', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('36', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('37', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('38', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('39', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('40', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('41', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('42', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('43', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_draw` VALUES ('44', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');

-- ----------------------------
-- Table structure for `eq_docs_pic`
-- ----------------------------
DROP TABLE IF EXISTS `eq_docs_pic`;
CREATE TABLE `eq_docs_pic` (
  `DOCS_PIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCS_REPORT_ID` int(5) DEFAULT NULL,
  `DOCS_FILENAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DOCS_PIC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eq_docs_pic
-- ----------------------------
INSERT INTO `eq_docs_pic` VALUES ('1', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('2', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('3', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('4', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('5', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('6', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('7', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('8', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('9', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('10', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('11', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('12', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('13', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('14', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('15', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('16', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('17', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('18', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('19', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('20', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('21', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('22', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('23', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('24', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('25', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('26', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('27', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('28', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('29', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('30', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('31', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('32', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('33', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('34', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('35', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('36', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('37', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('38', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('39', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('40', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('41', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('42', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('43', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_pic` VALUES ('44', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');

-- ----------------------------
-- Table structure for `eq_docs_product`
-- ----------------------------
DROP TABLE IF EXISTS `eq_docs_product`;
CREATE TABLE `eq_docs_product` (
  `DOCS_PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NO` int(5) DEFAULT NULL,
  `DOCS_FILENAME` varchar(100) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`DOCS_PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eq_docs_product
-- ----------------------------
INSERT INTO `eq_docs_product` VALUES ('1', '1', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('2', '2', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('3', '3', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('4', '4', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('5', '5', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('6', '6', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('7', '7', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('8', '8', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('9', '9', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('10', '10', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('11', '11', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('12', '12', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('13', '13', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('14', '14', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('15', '15', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('16', '16', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('17', '17', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('18', '18', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('19', '19', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('20', '20', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('21', '21', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('22', '22', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('23', '1', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('24', '2', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('25', '3', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('26', '4', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('27', '5', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('28', '6', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('29', '7', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('30', '8', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('31', '9', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('32', '10', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('33', '11', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('34', '12', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('35', '13', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('36', '14', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('37', '15', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('38', '16', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('39', '17', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('40', '18', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('41', '19', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('42', '20', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('43', '21', 'img/photos/t1.jpg', 'N');
INSERT INTO `eq_docs_product` VALUES ('44', '22', 'img/photos/t1.jpg', 'N');

-- ----------------------------
-- Table structure for `eq_docs_report`
-- ----------------------------
DROP TABLE IF EXISTS `eq_docs_report`;
CREATE TABLE `eq_docs_report` (
  `DOCS_REPORT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REVIEW_NO` int(5) DEFAULT NULL,
  `DOCS_FILENAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DOCS_REPORT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eq_docs_report
-- ----------------------------
INSERT INTO `eq_docs_report` VALUES ('1', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('2', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('3', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('4', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('5', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('6', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('7', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('8', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('9', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('10', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('11', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('12', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('13', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('14', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('15', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('16', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('17', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('18', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('19', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('20', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('21', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('22', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('23', '1', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('24', '2', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('25', '3', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('26', '4', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('27', '5', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('28', '6', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('29', '7', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('30', '8', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('31', '9', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('32', '10', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('33', '11', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('34', '12', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('35', '13', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('36', '14', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('37', '15', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('38', '16', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('39', '17', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('40', '18', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('41', '19', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('42', '20', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('43', '21', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');
INSERT INTO `eq_docs_report` VALUES ('44', '22', 'C:\\Users\\Administrator\\Desktop\\pathology\\pathology.sql');

-- ----------------------------
-- Table structure for `eq_doctor_advice`
-- ----------------------------
DROP TABLE IF EXISTS `eq_doctor_advice`;
CREATE TABLE `eq_doctor_advice` (
  `ADVICE_NO` int(11) NOT NULL AUTO_INCREMENT,
  `DIAGNOSIS_NO` int(11) DEFAULT NULL,
  `ADVICE_KIND` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_PROGRAM` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_CONTENT` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_NOTE` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ADVICE_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_doctor_advice
-- ----------------------------
INSERT INTO `eq_doctor_advice` VALUES ('1', '1', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('2', '2', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('3', '3', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('4', '4', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('5', '5', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('6', '6', '补充医嘱', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('7', '7', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('8', '8', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('9', '9', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('10', '10', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('11', '11', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('12', '12', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('13', '13', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('14', '14', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('15', '15', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('16', '16', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('17', '17', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('18', '18', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('19', '19', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('20', '20', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('21', '21', '', '', '', '');
INSERT INTO `eq_doctor_advice` VALUES ('22', '22', '', '', '', '');

-- ----------------------------
-- Table structure for `eq_insp_method`
-- ----------------------------
DROP TABLE IF EXISTS `eq_insp_method`;
CREATE TABLE `eq_insp_method` (
  `INSP_METHOD_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `DICINSP_METHOD_NO` int(11) DEFAULT NULL,
  PRIMARY KEY (`INSP_METHOD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_insp_method
-- ----------------------------
INSERT INTO `eq_insp_method` VALUES ('1', '1', '1');
INSERT INTO `eq_insp_method` VALUES ('2', '1', '2');
INSERT INTO `eq_insp_method` VALUES ('3', '2', '1');
INSERT INTO `eq_insp_method` VALUES ('4', '2', '2');
INSERT INTO `eq_insp_method` VALUES ('5', '2', '3');
INSERT INTO `eq_insp_method` VALUES ('6', '2', '4');
INSERT INTO `eq_insp_method` VALUES ('7', '3', '1');
INSERT INTO `eq_insp_method` VALUES ('8', '3', '2');
INSERT INTO `eq_insp_method` VALUES ('9', '3', '3');
INSERT INTO `eq_insp_method` VALUES ('10', '4', '1');
INSERT INTO `eq_insp_method` VALUES ('11', '4', '2');
INSERT INTO `eq_insp_method` VALUES ('12', '4', '3');
INSERT INTO `eq_insp_method` VALUES ('13', '1', '3');
INSERT INTO `eq_insp_method` VALUES ('14', '1', '4');
INSERT INTO `eq_insp_method` VALUES ('15', '2', '5');
INSERT INTO `eq_insp_method` VALUES ('16', '2', '5');
INSERT INTO `eq_insp_method` VALUES ('17', '5', '1');
INSERT INTO `eq_insp_method` VALUES ('18', '5', '2');
INSERT INTO `eq_insp_method` VALUES ('19', '6', '1');
INSERT INTO `eq_insp_method` VALUES ('20', '6', '2');
INSERT INTO `eq_insp_method` VALUES ('21', '7', '1');
INSERT INTO `eq_insp_method` VALUES ('22', '7', '2');
INSERT INTO `eq_insp_method` VALUES ('23', '8', '1');

-- ----------------------------
-- Table structure for `eq_pathology_accept`
-- ----------------------------
DROP TABLE IF EXISTS `eq_pathology_accept`;
CREATE TABLE `eq_pathology_accept` (
  `ACCEPT_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `ACCEPT_DESC` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCEPT_RESULT` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCEPT_DOCTOR_ID` int(7) DEFAULT NULL,
  `ACCEPT_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ACCEPT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_pathology_accept
-- ----------------------------
INSERT INTO `eq_pathology_accept` VALUES ('1', '1', '验收过程正常', '正常验收', '8', '2017-02-01');
INSERT INTO `eq_pathology_accept` VALUES ('2', '2', '验收过程正常', '正常验收', '8', '2017-02-02');
INSERT INTO `eq_pathology_accept` VALUES ('3', '3', '验收过程正常', '正常验收', '8', '2017-02-03');
INSERT INTO `eq_pathology_accept` VALUES ('4', '4', '验收过程正常', '正常验收', '8', '2017-02-04');
INSERT INTO `eq_pathology_accept` VALUES ('5', '5', '验收过程正常', '正常验收', '8', '2017-02-05');
INSERT INTO `eq_pathology_accept` VALUES ('6', '6', '验收过程正常', '正常验收', '8', '2017-02-06');
INSERT INTO `eq_pathology_accept` VALUES ('7', '7', '验收过程正常', '正常验收', '8', '2017-02-07');
INSERT INTO `eq_pathology_accept` VALUES ('8', '8', '验收过程正常', '正常验收', '8', '2017-02-08');
INSERT INTO `eq_pathology_accept` VALUES ('9', '9', '验收过程正常', '正常验收', '8', '2017-02-09');
INSERT INTO `eq_pathology_accept` VALUES ('10', '10', '验收过程正常', '正常验收', '8', '2017-02-10');
INSERT INTO `eq_pathology_accept` VALUES ('11', '11', '验收过程正常', '正常验收', '8', '2017-02-11');
INSERT INTO `eq_pathology_accept` VALUES ('12', '12', '验收过程正常', '正常验收', '8', '2017-02-12');
INSERT INTO `eq_pathology_accept` VALUES ('13', '13', '验收过程正常', '正常验收', '8', '2017-02-13');
INSERT INTO `eq_pathology_accept` VALUES ('14', '14', '验收过程正常', '正常验收', '8', '2017-02-14');
INSERT INTO `eq_pathology_accept` VALUES ('15', '15', '验收过程正常', '正常验收', '8', '2017-02-15');
INSERT INTO `eq_pathology_accept` VALUES ('16', '16', '验收过程正常', '正常验收', '8', '2017-02-16');
INSERT INTO `eq_pathology_accept` VALUES ('17', '17', '验收过程正常', '正常验收', '8', '2017-02-17');
INSERT INTO `eq_pathology_accept` VALUES ('18', '18', '验收过程正常', '正常验收', '8', '2017-02-18');
INSERT INTO `eq_pathology_accept` VALUES ('19', '19', '验收过程正常', '正常验收', '8', '2017-02-19');
INSERT INTO `eq_pathology_accept` VALUES ('20', '20', '验收过程正常', '正常验收', '8', '2017-02-20');
INSERT INTO `eq_pathology_accept` VALUES ('21', '21', '验收过程正常', '正常验收', '8', '2017-02-21');
INSERT INTO `eq_pathology_accept` VALUES ('22', '22', '验收过程正常', '正常验收', '8', '2017-02-22');

-- ----------------------------
-- Table structure for `eq_pathology_diagnosis`
-- ----------------------------
DROP TABLE IF EXISTS `eq_pathology_diagnosis`;
CREATE TABLE `eq_pathology_diagnosis` (
  `DIAGNOSIS_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SAMPLE_NO` int(11) DEFAULT NULL,
  `DIAGNOSIS_MICROSCOPE` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIAGNOSIS_SPECIAL` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIAGNOSIS_PATHOLOGY` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIAGNOSIS_NOTE` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT_DATE` date DEFAULT NULL,
  `REPORT_DOCTOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DIAGNOSIS_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_pathology_diagnosis
-- ----------------------------
INSERT INTO `eq_pathology_diagnosis` VALUES ('1', '1', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-01', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('2', '2', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-02', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('3', '3', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-03', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('4', '4', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-04', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('5', '5', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-05', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('6', '6', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-06', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('7', '7', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-07', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('8', '8', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-08', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('9', '9', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-09', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('10', '10', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-10', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('11', '11', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-11', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('12', '12', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-12', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('13', '13', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-13', '1');
INSERT INTO `eq_pathology_diagnosis` VALUES ('14', '14', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-14', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('15', '15', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-15', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('16', '16', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-16', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('17', '17', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-17', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('18', '18', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-18', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('19', '19', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-19', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('20', '20', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-20', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('21', '21', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-21', '2');
INSERT INTO `eq_pathology_diagnosis` VALUES ('22', '22', '镜下所见描述', '特殊检查描述', '病理诊断描述', '备注信息', '2017-02-22', '2');

-- ----------------------------
-- Table structure for `eq_pathology_draw`
-- ----------------------------
DROP TABLE IF EXISTS `eq_pathology_draw`;
CREATE TABLE `eq_pathology_draw` (
  `DRAW_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SAMPLE_NO` int(11) DEFAULT NULL,
  `DRAW_DESC` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRAW_POSITION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRAW_DOCTOR_ID` int(11) DEFAULT NULL,
  `DRAW_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRAW_DATE` date DEFAULT NULL,
  `PRODUCT_NUM` int(11) DEFAULT NULL,
  `DRAW_NOTE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DRAW_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_pathology_draw
-- ----------------------------
INSERT INTO `eq_pathology_draw` VALUES ('1', '1', '取材过程正常', '胃肠取材位置一', '1', '固定', '2017-02-01', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('2', '2', '取材过程正常', '胃肠取材位置一', '1', '脱水', '2017-02-02', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('3', '3', '取材过程正常', '胃肠取材位置一', '1', '透明', '2017-02-03', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('4', '4', '取材过程正常', '胃肠取材位置一', '1', '浸蜡', '2017-02-04', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('5', '5', '取材过程正常', '胃肠取材位置一', '1', '包埋', '2017-02-05', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('6', '6', '取材过程正常', '胃肠取材位置一', '1', '固定', '2017-02-06', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('7', '7', '取材过程正常', '胃肠取材位置一', '1', '脱水', '2017-02-07', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('8', '8', '取材过程正常', '胃肠取材位置一', '1', '透明', '2017-02-08', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('9', '9', '取材过程正常', '胃肠取材位置一', '1', '浸蜡', '2017-02-09', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('10', '10', '取材过程正常', '胃肠取材位置一', '1', '包埋', '2017-02-10', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('11', '11', '取材过程正常', '胃肠取材位置一', '1', '固定', '2017-02-11', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('12', '12', '取材过程正常', '胃肠取材位置一', '1', '脱水', '2017-02-12', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('13', '13', '取材过程正常', '胃肠取材位置一', '1', '透明', '2017-02-13', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('14', '14', '取材过程正常', '胃肠取材位置一', '1', '浸蜡', '2017-02-14', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('15', '15', '取材过程正常', '胃肠取材位置一', '2', '包埋', '2017-02-15', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('16', '16', '取材过程正常', '胃肠取材位置一', '2', '固定', '2017-02-16', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('17', '17', '取材过程正常', '胃肠取材位置一', '2', '脱水', '2017-02-17', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('18', '18', '取材过程正常', '胃肠取材位置一', '2', '透明', '2017-02-18', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('19', '19', '取材过程正常', '胃肠取材位置一', '2', '浸蜡', '2017-02-19', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('20', '20', '取材过程正常', '胃肠取材位置一', '2', '包埋', '2017-02-20', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('21', '21', '取材过程正常', '胃肠取材位置一', '2', '固定', '2017-02-21', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('22', '22', '取材过程正常', '胃肠取材位置一', '2', '固定', '2017-02-22', '1', null);
INSERT INTO `eq_pathology_draw` VALUES ('23', '4', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('24', '7', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('25', '6', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('26', '25', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('27', '5', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('28', '5', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('29', '4', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('30', '6', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('31', '5', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('32', '25', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('33', '4', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('34', '25', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('35', '25', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('36', '25', null, null, null, null, null, null, null);
INSERT INTO `eq_pathology_draw` VALUES ('37', '25', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `eq_pathology_review`
-- ----------------------------
DROP TABLE IF EXISTS `eq_pathology_review`;
CREATE TABLE `eq_pathology_review` (
  `REVIEW_NO` int(11) NOT NULL AUTO_INCREMENT,
  `APPLI_NO` int(11) DEFAULT NULL,
  `REVIEW_RESULT` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIAGNOSIS_INITIAL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REVIEW_STATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REVIEW_NOTE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REVIEW_DOCTOR_ID` int(11) DEFAULT NULL,
  `REVIEW_DATE` date DEFAULT NULL,
  `DIAGNOSIS_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONSULTATION_IF` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_DATE` date DEFAULT NULL,
  PRIMARY KEY (`REVIEW_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_pathology_review
-- ----------------------------
INSERT INTO `eq_pathology_review` VALUES ('1', '1', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-01', '待处理', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('2', '2', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-02', '已保存', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('3', '3', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-03', '待审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('4', '4', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-04', '已审核', '是', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('5', '5', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-05', '医嘱执行', '是', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('6', '6', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-06', '待处理', '是', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('7', '7', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-07', '已保存', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('8', '8', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-08', '待审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('9', '9', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-09', '已审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('10', '10', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-10', '医嘱执行', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('11', '11', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-11', '待处理', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('12', '12', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-12', '已保存', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('13', '13', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-13', '待审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('14', '14', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '1', '2017-02-14', '已审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('15', '15', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '2', '2017-02-15', '医嘱执行', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('16', '16', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '2', '2017-02-16', '待处理', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('17', '17', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '2', '2017-02-17', '已保存', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('18', '18', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '2', '2017-02-18', '待审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('19', '19', '复片结果正常', '初诊意见描述', '未打印', '复片备注', '2', '2017-02-19', '已审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('20', '20', '复片结果正常', '初诊意见描述', '开始', '复片备注', '2', '2017-02-20', '医嘱执行', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('21', '21', '复片结果正常', '初诊意见描述', '开始', '复片备注', '2', '2017-02-21', '已审核', '否', '2017-02-01');
INSERT INTO `eq_pathology_review` VALUES ('22', '22', '复片结果正常', '初诊意见描述', '开始', '复片备注', '2', '2017-02-22', '医嘱执行', '否', '2017-02-01');

-- ----------------------------
-- Table structure for `eq_patient_appli`
-- ----------------------------
DROP TABLE IF EXISTS `eq_patient_appli`;
CREATE TABLE `eq_patient_appli` (
  `APPLI_NO` int(7) NOT NULL AUTO_INCREMENT,
  `PATIENT_NO` int(7) DEFAULT NULL,
  `INSP_UNIT_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSP_DATE` date DEFAULT NULL,
  `INSP_DEPART_ID` int(7) DEFAULT NULL,
  `INSP_DOCT_ID` int(7) DEFAULT NULL,
  `PATIENT_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHARGE_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHARGE_NUM` decimal(10,2) DEFAULT NULL,
  `SPECIMENT_KIND` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_DIAG_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIAGNOSIS_RECORD` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLI_DATE` date DEFAULT NULL,
  `APPLI_SYMPTOM` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLI_SIGNS` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OTHER_DIAGNOSIS` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATHOLOGY_EXAM_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANCER_FOUND_DATE` date DEFAULT NULL,
  `CANCER_FOUND_PLACE` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANCER_FOUND_SIZE` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRANSFER_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRANSFER_PLACE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHEMOTHERAPY_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANCER_NOW_DATE` date DEFAULT NULL,
  `CANCER_NOW_SIZE` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MENSTRUAL_CYCLE` int(7) DEFAULT NULL,
  `MENSTRUAL_DURATION` int(7) DEFAULT NULL,
  `LAST_MENSTRUAL_DATE` date DEFAULT NULL,
  `CYCLE_TREATMENT_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CYCLE_TREATMENT_TIME` int(7) DEFAULT NULL,
  `CYCLE_TREATMENT_DOSE` int(7) DEFAULT NULL,
  `BIRTH_NUM` int(4) DEFAULT NULL,
  `PRODUCT_NUM` int(4) DEFAULT NULL,
  `CONTRACEPTION_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTRACEPTION_METHOD` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IODINE_TREATMENT_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `THIOURACIL_TREATMENT_IF` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SURGERY_SEEN` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAB_RESULT` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL_REQUIRE` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLI_DOCTOR_ID` int(11) DEFAULT NULL,
  `OTHER_LOOKUP` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_STATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SAMPLE_NUM` int(11) DEFAULT NULL,
  `ACCEPT_DOCTOR_ID` int(11) DEFAULT NULL,
  `ACCEPT_DATE` date DEFAULT NULL,
  `ACCEPT_RESULT` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSP_METHOD_LIST` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCTS_NUM` int(11) DEFAULT NULL,
  `DRAW_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`APPLI_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_patient_appli
-- ----------------------------
INSERT INTO `eq_patient_appli` VALUES ('1', '1', '123医院', '2017-02-01', '1', '1', '住院', '医保', '200.00', '小标本', '本院常规病理', '临床诊断', '2017-02-01', '症状', '体征', '其他诊断', '是', '2016-10-01', '胃', '直径10mm', '是', '腋下淋巴结', '有', '2017-02-01', '直径11mm', '25', '3', '2017-01-01', '是', '12', '12', '2', '2', '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '3', '1', null, '未提交', '活检,快速冰冻,细胞学,TCT,免疫组化,肿瘤DNA倍体,FISH,基因检测', '5', '3');
INSERT INTO `eq_patient_appli` VALUES ('2', '2', '123医院', '2017-02-02', '1', '1', '住院', '医保', '200.00', '小标本', '本院常规病理', '临床诊断', '2017-02-02', '症状', '体征', '其他诊断', '否', '2016-10-02', '肺', '直径11mm', '否', '腋下淋巴结', '无', '2017-02-02', '直径12mm', '21', '2', '2017-01-02', '否', '15', '21', '1', '1', '是', '节育环', '是', '否', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '1', '2018-05-21', '未提交', '活检,快速冰冻,细胞学', '6', '2');
INSERT INTO `eq_patient_appli` VALUES ('3', '3', '123医院', '2017-02-03', '1', '1', '住院', '医保', '200.00', '小标本', '本院常规病理', '临床诊断', '2017-02-03', '症状', '体征', '其他诊断', '是', '2016-10-03', '胃', '直径12mm', '是', '腋下淋巴结', '有', '2017-02-03', '直径13mm', '17', '3', '2017-01-03', '是', '16', '22', '2', '1', '是', '节育环', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '1', '2018-05-21', '已打印', '活检,快速冰冻,细胞学', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('4', '4', '123医院', '2017-02-04', '1', '1', '住院', '医保', '200.00', '小标本', '病理会诊', '临床诊断', '2017-02-04', '症状', '体征', '其他诊断', '否', '2016-10-04', '肺', '直径13mm', '否', '腋下淋巴结', '无', '2017-02-04', '直径14mm', '43', '4', '2017-01-04', '否', '18', '18', '1', '1', '是', '服用药物', '是', '否', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '1', '2018-05-21', '已签收', '细胞学,TCT,免疫组化', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('5', '5', '123医院', '2017-02-05', '1', '1', '住院', '医保', '200.00', '大标本', '病理会诊', '临床诊断', '2017-02-05', '症状', '体征', '其他诊断', '是', '2016-10-05', '胃', '直径14mm', '是', '腋下淋巴结', '有', '2017-02-05', '直径15mm', '29', '5', '2017-01-05', '是', '20', '19', '2', '2', '是', '服用药物', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '已签收', '免疫组化,肿瘤DNA倍体', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('6', '6', '123医院', '2017-02-06', '1', '1', '住院', '医保', '200.00', '大标本', '病理会诊', '临床诊断', '2017-02-06', '症状', '体征', '其他诊断', '否', '2016-10-06', '肺', '直径15mm', '否', '腋下淋巴结', '无', '2017-02-06', '直径16mm', '35', '3', '2017-01-06', '否', '22', '23', '1', '1', '是', '节育环', '是', '否', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '2', '2018-05-21', '已签收', 'FISH,基因检测', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('7', '7', '123医院', '2017-02-07', '1', '1', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-07', '症状', '体征', '其他诊断', '是', '2016-10-07', '胃', '直径16mm', '是', '腋下淋巴结', '有', '2017-02-07', '直径17mm', '27', '4', '2017-01-07', '是', '15', '21', '2', '1', '是', '节育环', '否', '是', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '2', '2018-05-21', '未提交', 'FISH,基因检测', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('8', '8', '123医院', '2017-02-08', '1', '1', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-08', '症状', '体征', '其他诊断', '否', '2016-10-08', '肺', '直径17mm', '否', '腋下淋巴结', '无', '2017-02-08', '直径18mm', null, null, null, '否', '17', '22', null, null, '否', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '2', '2018-05-21', '未提交', 'FISH,基因检测', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('9', '9', '123医院', '2017-02-09', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-09', '症状', '体征', '其他诊断', '是', '2016-10-09', '胃', '直径18mm', '是', '腋下淋巴结', '有', '2017-02-09', '直径19mm', null, null, null, '是', '23', '26', null, null, '否', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '1', '2018-05-21', '未提交', '活检,快速冰冻', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('10', '10', '123医院', '2017-02-10', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-10', '症状', '体征', '其他诊断', '否', '2016-10-10', '肺', '直径19mm', '否', '腋下淋巴结', '无', '2017-02-10', '直径20mm', null, null, null, '否', '19', '25', null, null, '否', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '2', '2018-05-21', '已签收', '活检,快速冰冻', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('11', '11', '123医院', '2017-02-11', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-11', '症状', '体征', '其他诊断', '是', '2016-10-11', '胃', '直径20mm', '是', '腋下淋巴结', '有', '2017-02-11', '直径21mm', null, null, null, '是', '31', '18', null, null, '否', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '无', '1', null, '新医嘱', '1', '1', '2018-05-21', '已签收', '快速冰冻', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('12', '12', '123医院', '2017-02-12', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-12', '症状', '体征', '其他诊断', '否', '2016-10-12', '肺', '直径21mm', '否', '腋下淋巴结', '无', '2017-02-12', '直径22mm', null, null, null, '否', '23', '23', null, null, '否', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '已签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('13', '13', '123医院', '2017-02-13', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-13', '症状', '体征', '其他诊断', '是', '2016-10-13', '胃', '直径22mm', '是', '腋下淋巴结', '有', '2017-02-13', '直径23mm', null, null, null, '是', '18', '18', null, null, '否', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '已签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('14', '14', '123医院', '2017-02-14', '1', '2', '住院', '医保', '200.00', '大标本', '本院常规病理', '临床诊断', '2017-02-14', '症状', '体征', '其他诊断', '否', '2016-10-14', '肺', '直径23mm', '否', '腋下淋巴结', '无', '2017-02-14', '直径24mm', null, null, null, '否', '22', '21', null, null, '否', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '等待签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('15', '15', '123医院', '2017-02-15', '1', '2', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-15', '症状', '体征', '其他诊断', '是', '2016-10-15', '胃', '直径24mm', '是', '腋下淋巴结', '有', '2017-02-15', '直径25mm', null, null, null, '是', '16', '23', null, null, '否', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '等待签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('16', '16', '100医院', '2017-02-16', '1', '2', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-16', '症状', '体征', '其他诊断', '否', '2016-10-16', '肺', '直径25mm', '否', '腋下淋巴结', '无', '2017-02-16', '直径26mm', null, null, null, '否', '25', '20', null, null, '否', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '等待签收', '免疫组化,肿瘤DNA倍体,FISH', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('17', '17', '100医院', '2017-02-17', '2', '2', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-17', '症状', '体征', '其他诊断', '是', '2016-10-17', '胃', '直径26mm', '是', '腋下淋巴结', '有', '2017-02-17', '直径27mm', null, null, null, '是', '27', '19', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '1', null, '新医嘱', '1', '2', '2018-05-21', '等待签收', '免疫组化,肿瘤DNA倍体,FISH', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('18', '18', '100医院', '2017-02-18', '2', '3', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-18', '症状', '体征', '其他诊断', '否', '2016-10-18', '肺', '直径27mm', '否', '腋下淋巴结', '无', '2017-02-18', '直径28mm', null, null, null, '否', '21', '18', null, null, '是', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '1', '2', '2018-05-21', '已签收', '肿瘤DNA倍体', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('19', '19', '100医院', '2017-02-19', '2', '3', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-19', '症状', '体征', '其他诊断', '是', '2016-10-19', '胃', '直径28mm', '是', '腋下淋巴结', '有', '2017-02-19', '直径29mm', null, null, null, '是', '23', '22', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '1', '1', '2018-05-21', '已打印', '肿瘤DNA倍体', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('20', '20', '100医院', '2017-02-20', '2', '3', '门诊', '自费', '300.00', '小样本', '本院常规病理', '临床诊断', '2017-02-20', '症状', '体征', '其他诊断', '否', '2016-10-20', '肺', '直径29mm', '否', '腋下淋巴结', '无', '2017-02-20', '直径30mm', null, null, null, '否', '29', '23', null, null, '是', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '1', '1', '2018-05-21', '已打印', '肿瘤DNA倍体', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('21', '21', '100医院', '2017-02-21', '2', '3', '门诊', '自费', '300.00', '小样本', '快速冰冻', '临床诊断', '2017-02-21', '症状', '体征', '其他诊断', '是', '2016-10-21', '胃', '直径30mm', '是', '腋下淋巴结', '有', '2017-02-21', '直径31mm', null, null, null, '是', '30', '26', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '1', '1', '2018-05-21', '已签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('22', '22', '100医院', '2017-02-22', '2', '3', '门诊', '自费', '300.00', '小样本', '快速冰冻', '临床诊断', '2017-02-22', '症状', '体征', '其他诊断', '否', '2016-10-22', '肺', '直径31mm', '否', '腋下淋巴结', '无', '2017-02-22', '直径32mm', null, null, null, '否', '31', '21', null, null, '是', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '2', '1', '2018-05-21', '已签收', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('23', '23', '100医院', '2017-02-23', '2', '3', '门诊', '自费', '300.00', '大样本', '本院常规病理', '临床诊断', '2017-02-23', '症状', '体征', '其他诊断', '是', '2016-10-23', '胃', '直径32mm', '是', '腋下淋巴结', '有', '2017-02-23', '直径33mm', null, null, null, '是', '32', '19', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '0', '1', '2018-05-21', '已打印', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('24', '24', '100医院', '2017-02-24', '2', '3', '门诊', '自费', '300.00', '大样本', '本院常规病理', '临床诊断', '2017-02-24', '症状', '体征', '其他诊断', '否', '2016-10-24', '肺', '直径33mm', '否', '腋下淋巴结', '无', '2017-02-24', '直径34mm', null, null, null, '否', '18', '28', null, null, '是', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '0', '1', '2018-05-21', '已打印', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('25', '25', '100医院', '2017-02-25', '2', '3', '门诊', '自费', '300.00', '大样本', '本院常规病理', '临床诊断', '2017-02-25', '症状', '体征', '其他诊断', '是', '2016-10-25', '胃', '直径34mm', '是', '腋下淋巴结', '有', '2017-02-25', '直径35mm', null, null, null, '是', '23', '14', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '0', '1', '2018-05-21', '未提交', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('26', '26', '100医院', '2017-02-26', '2', '3', '门诊', '自费', '300.00', '大样本', '本院常规病理', '临床诊断', '2017-02-26', '症状', '体征', '其他诊断', '否', '2016-10-26', '肺', '直径35mm', '否', '腋下淋巴结', '无', '2017-02-26', '直径36mm', null, null, null, '否', '28', '23', null, null, '是', '避孕套', '是', '否', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '0', '1', '2018-05-21', '未提交', '活检', '1', '2');
INSERT INTO `eq_patient_appli` VALUES ('27', '27', '100医院', '2017-02-27', '2', '3', '门诊', '自费', '300.00', '大样本', '本院常规病理', '临床诊断', '2017-02-27', '症状', '体征', '其他诊断', '是', '2016-10-27', '胃', '直径36mm', '是', '腋下淋巴结', '有', '2017-02-27', '直径37mm', null, null, null, '是', '25', '22', null, null, '是', '避孕套', '否', '是', '手术所见描述', '实验室检验结果', '有', '2', null, '新医嘱', '0', '1', '2018-05-21', '未提交', '活检', '1', '2');

-- ----------------------------
-- Table structure for `eq_patient_info`
-- ----------------------------
DROP TABLE IF EXISTS `eq_patient_info`;
CREATE TABLE `eq_patient_info` (
  `PATIENT_NO` int(7) NOT NULL AUTO_INCREMENT,
  `TREAT_NO` int(7) DEFAULT NULL,
  `PATIENT_NAME` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_GENDER` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_AGE` int(10) DEFAULT NULL,
  `PATIENT_MARRIAGE` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_ETHNIC` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_CAREER` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_IDENTI_NUMBER` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATIENT_SOURCE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTPATIENT_ID` int(10) DEFAULT NULL,
  `HOSPITALIZETION_ID` int(10) DEFAULT NULL,
  `DEPARTMENT_ID` int(10) DEFAULT NULL,
  `PATIENT_WARD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BED_ID` int(10) DEFAULT NULL,
  `CONTACT_INFOADDR_PROVINCE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_INFOADDR_CITY` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_INFOADDR_DISTINCT` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_INFO_ADDR` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_INFO_TEL` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_INFO_EMAIL` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADVICE_DICTOR` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INFOR_CLINICAL` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PATIENT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_patient_info
-- ----------------------------
INSERT INTO `eq_patient_info` VALUES ('1', '1', '患者001', '男', '18', '未婚', '汉族', '工程师', '142327891234562341', '门诊', '1', '1', '1', '1', '1', '湖北', '武汉市', '江岸区', '实现村25号楼16房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('2', '2', '患者002', '女', '24', '已婚', '维吾尔族', '工程师', '142327891234562342', '门诊', '2', '2', '1', '1', '2', '湖北', '武汉市', '江岸区', '实现村25号楼17房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('3', '3', '患者003', '男', '30', '已婚', '回族', '工程师', '142327891234562343', '门诊', '3', '3', '1', '1', '3', '湖北', '武汉市', '江岸区', '实现村25号楼18房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('4', '4', '患者004', '女', '36', '已婚', '白族', '工程师', '142327891234562344', '门诊', '4', '4', '1', '1', '4', '湖北', '武汉市', '江岸区', '实现村25号楼19房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('5', '5', '患者005', '男', '42', '已婚', '汉族', '医生', '142327891234562345', '门诊', '5', '5', '1', '1', '5', '湖北', '武汉市', '江岸区', '实现村25号楼20房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('6', '6', '患者006', '女', '48', '已婚', '汉族', '医生', '142327891234562346', '门诊', '6', '6', '1', '1', '6', '湖北', '武汉市', '江岸区', '实现村25号楼21房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('7', '7', '患者007', '男', '18', '未婚', '汉族', '医生', '142327891234562347', '门诊', '7', '7', '1', '1', '7', '湖北', '武汉市', '江岸区', '实现村25号楼22房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('8', '8', '患者008', '女', '24', '已婚', '汉族', '医生', '142327891234562348', '门诊', '8', '8', '1', '1', '8', '湖北', '武汉市', '江岸区', '实现村25号楼23房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('9', '9', '患者009', '男', '30', '已婚', '汉族', '医生', '142327891234562349', '门诊', '9', '9', '1', '1', '9', '湖北', '武汉市', '江汉区', '实现村25号楼24房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('10', '10', '患者010', '女', '36', '已婚', '汉族', '医生', '142327891234562350', '门诊', '10', '10', '1', '1', '10', '湖北', '武汉市', '江汉区', '实现村25号楼25房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('11', '11', '患者011', '男', '42', '已婚', '汉族', '公务员', '142327891234562351', '门诊', '11', '11', '1', '1', '11', '湖北', '武汉市', '江汉区', '实现村25号楼26房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('12', '12', '患者012', '女', '48', '已婚', '汉族', '公务员', '142327891234562352', '门诊', '12', '12', '1', '1', '12', '湖北', '武汉市', '江汉区', '实现村25号楼27房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('13', '13', '患者013', '男', '18', '未婚', '汉族', '公务员', '142327891234562353', '门诊', '13', '13', '1', '1', '13', '湖北', '武汉市', '江汉区', '实现村25号楼28房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('14', '14', '患者014', '女', '24', '已婚', '汉族', '公务员', '142327891234562354', '门诊', '14', '14', '1', '1', '14', '湖北', '武汉市', '江汉区', '实现村25号楼29房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('15', '15', '患者015', '男', '30', '已婚', '汉族', '公务员', '142327891234562355', '门诊', '15', '15', '1', '1', '15', '湖北', '武汉市', '江汉区', '实现村25号楼30房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('16', '16', '患者016', '女', '36', '已婚', '汉族', '公务员', '142327891234562356', '住院', '16', '16', '1', '1', '16', '湖北', '武汉市', '江汉区', '实现村25号楼31房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('17', '17', '患者017', '男', '42', '已婚', '汉族', '自由职业者', '142327891234562357', '住院', '17', '17', '1', '1', '17', '湖北', '武汉市', '汉阳区', '实现村25号楼32房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('18', '18', '患者018', '女', '48', '已婚', '汉族', '自由职业者', '142327891234562358', '住院', '18', '18', '2', '1', '18', '湖北', '武汉市', '汉阳区', '实现村25号楼33房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('19', '19', '患者019', '男', '18', '未婚', '汉族', '自由职业者', '142327891234562359', '住院', '19', '19', '2', '2', '19', '湖北', '武汉市', '汉阳区', '实现村25号楼34房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('20', '20', '患者020', '女', '24', '已婚', '汉族', '自由职业者', '142327891234562360', '住院', '20', '20', '2', '2', '20', '湖北', '武汉市', '汉阳区', '实现村25号楼35房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('21', '21', '患者021', '男', '30', '已婚', '汉族', '自由职业者', '142327891234562361', '住院', '21', '21', '2', '2', '21', '湖北', '武汉市', '汉阳区', '实现村25号楼36房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('22', '22', '患者022', '女', '36', '已婚', '汉族', '自由职业者', '142327891234562362', '住院', '22', '22', '2', '2', '22', '湖北', '武汉市', '武昌区', '实现村25号楼37房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('23', '23', '患者023', '男', '42', '已婚', '汉族', '自由职业者', '142327891234562363', '外院会诊', '23', '23', '2', '2', '23', '湖北', '武汉市', '武昌区', '实现村25号楼38房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('24', '24', '患者024', '女', '24', '已婚', '汉族', '自由职业者', '142327891234562364', '外院会诊', '24', '24', '2', '2', '24', '湖北', '武汉市', '武昌区', '实现村25号楼39房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('25', '25', '患者025', '男', '30', '已婚', '回族', '自由职业者', '142327891234562365', '外院会诊', '25', '25', '2', '2', '25', '湖北', '武汉市', '武昌区', '实现村25号楼40房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('26', '26', '患者026', '女', '36', '已婚', '回族', '自由职业者', '142327891234562366', '外院会诊', '26', '26', '2', '2', '26', '湖北', '武汉市', '武昌区', '实现村25号楼41房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');
INSERT INTO `eq_patient_info` VALUES ('27', '27', '患者027', '男', '42', '已婚', '回族', '自由职业者', '142327891234562367', '外院会诊', '27', '27', '2', '2', '27', '湖北', '武汉市', '武昌区', '实现村25号楼42房间', '15901411769', 'jingbin007@163.com', '医嘱说明', '病史说明');

-- ----------------------------
-- Table structure for `eq_product`
-- ----------------------------
DROP TABLE IF EXISTS `eq_product`;
CREATE TABLE `eq_product` (
  `PRODUCT_NO` int(11) NOT NULL AUTO_INCREMENT,
  `DRAW_NO` int(11) DEFAULT NULL,
  `PRODUCT_DESC` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_DOCTOR_ID` int(11) DEFAULT NULL,
  `RESULT_KIND` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_DATE` date DEFAULT NULL,
  `PRODUCT_NOTE` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_FILE` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `THUMBNAIL_FILE` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCAN_DOCTOR_ID` int(11) DEFAULT NULL,
  `SCAN_DATE` date DEFAULT NULL,
  `PRODUCT_REQUIRE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_POSITION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_QUALITY` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNLAW_REASON` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRODUCT_ADVICE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_product
-- ----------------------------
INSERT INTO `eq_product` VALUES ('1', '1', '正常', '待处理', '1', 'HE染色', '2017-02-01', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '1', '2017-02-01', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('2', '2', '正常', '已完成', '2', 'HE染色', '2017-02-02', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '1', '2017-02-02', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('3', '3', '正常', '未扫描', '1', 'HE染色', '2017-02-03', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '1', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('4', '4', '正常', '已完成', '2', 'HE染色', '2017-02-04', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '1', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('5', '5', '正常', '未扫描', '1', 'HE染色', '2017-02-05', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '1', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('6', '6', '正常', '未扫描', '2', 'HE染色', '2017-02-06', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('7', '7', '正常', '未扫描', '1', 'HE染色', '2017-02-07', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('8', '8', '正常', '未扫描', '2', 'HE染色', '2017-02-08', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('9', '9', '正常', '待处理', '1', 'HE染色', '2017-02-09', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('10', '10', '正常', '待处理', '1', 'HE染色', '2017-02-10', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('11', '11', '正常', '待处理', '1', 'HE染色', '2017-02-11', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('12', '12', '正常', '待处理', '1', 'HE染色', '2017-02-12', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '2', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('13', '13', '正常', '待处理', '1', 'HE染色', '2017-02-13', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('14', '14', '正常', '待处理', '1', 'HE染色', '2017-02-14', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('15', '15', '正常', '待处理', '1', 'HE染色', '2017-02-15', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('16', '16', '正常', '待处理', '1', 'HE染色', '2017-02-16', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('17', '17', '正常', '待处理', '1', 'HE染色', '2017-02-17', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('18', '18', '正常', '待处理', '1', 'HE染色', '2017-02-18', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('19', '19', '正常', '待处理', '1', 'HE染色', '2017-02-19', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '3', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('20', '20', '正常', '待处理', '1', 'HE染色', '2017-02-20', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '4', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('21', '21', '正常', '待处理', '1', 'HE染色', '2017-02-21', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '4', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('22', '22', '正常', '待处理', '1', 'HE染色', '2017-02-22', '制片备注', 'c:/a.jpg', 'c:/a.jpg', '4', '2017-02-20', null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('23', '4', '', null, null, 'HE染色', null, 'temp1234', '', '', null, null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('24', '4', '', null, null, 'HE染色', null, 'temp2003', '', '', null, null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('25', '4', '', null, null, 'HE染色', null, 'temp1000', '', '', null, null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('787', '4', '', null, null, 'HE染色', null, 'rtrrtrt', '', '', null, null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('788', '4', '', null, null, 'HE染色', null, 'uiiuiuiui', '', '', null, null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('789', '4', '待处理', null, '9', 'HE染色', '2018-07-12', 'qwews', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('790', '4', '待处理', null, '9', 'HE染色', '2018-07-12', 'sdere', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('791', '4', '待处理', null, '9', 'HE染色', '2018-07-12', 'dfdcvc', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('792', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CK7', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('793', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CgA', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('794', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD68', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('795', '4', '待处理', null, '9', '免疫组化', '2018-07-12', '34βE12', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('796', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD31', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('797', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD34', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('798', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '巴氏染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('799', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '铜染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('800', '4', '待处理', null, '9', '特殊染色', '2018-07-12', 'PAS染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('801', '4', '待处理', null, '9', '特殊染色', '2018-07-12', 'Masson三色染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('802', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '粘液卡红染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('803', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '巴氏染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('804', '4', '待处理', null, '9', '特殊染色', '2018-07-12', 'PASD染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('805', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '铁染色', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('806', '4', '待处理', null, '9', '特殊染色', '2018-07-12', '刚果红', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('807', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'Calponin', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('808', '4', '待处理', null, '9', '免疫组化', '2018-07-12', '34βE12', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('809', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD68', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('810', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'AFP', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('811', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'ALK(1A4) ', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('812', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'AR', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('813', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'bcl-2', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('814', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'Calponin', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('815', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD34', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('816', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD138', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('817', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CK5/6', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('818', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CEA', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('819', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD99', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('820', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'PAS', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('821', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD7', '', '', '9', null, null, null, null, null, null);
INSERT INTO `eq_product` VALUES ('822', '4', '待处理', null, '9', '免疫组化', '2018-07-12', 'CD79a', '', '', '9', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `eq_review_detail`
-- ----------------------------
DROP TABLE IF EXISTS `eq_review_detail`;
CREATE TABLE `eq_review_detail` (
  `REVIEW_DETAIL_NO` int(11) NOT NULL AUTO_INCREMENT,
  `CONSULTATION_NO` int(11) DEFAULT NULL,
  `REVIEW_DOCTOR_ID` int(11) DEFAULT NULL,
  `REVIEW_DETAIL_DATE` date DEFAULT NULL,
  `REVIEW_DETAIL_RESULT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REVIEW_DETAIL_NOTE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_review_detail
-- ----------------------------
INSERT INTO `eq_review_detail` VALUES ('1', '1', '2', '2017-02-01', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('2', '2', '2', '2017-02-02', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('3', '3', '2', '2017-02-03', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('4', '4', '2', '2017-02-04', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('5', '5', '2', '2017-02-05', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('6', '6', '2', '2017-02-06', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('7', '7', '2', '2017-02-07', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('8', '8', '2', '2017-02-08', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('9', '9', '2', '2017-02-09', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('10', '10', '2', '2017-02-10', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('11', '11', '2', '2017-02-11', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('12', '12', '2', '2017-02-12', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('13', '13', '2', '2017-02-13', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('14', '14', '1', '2017-02-14', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('15', '15', '1', '2017-02-15', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('16', '16', '1', '2017-02-16', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('17', '17', '1', '2017-02-17', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('18', '18', '1', '2017-02-18', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('19', '19', '1', '2017-02-19', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('20', '20', '1', '2017-02-20', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('21', '21', '1', '2017-02-21', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('22', '22', '1', '2017-02-22', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('23', '1', '1', '2017-02-01', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('24', '2', '1', '2017-02-02', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('25', '3', '1', '2017-02-03', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('26', '4', '1', '2017-02-04', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('27', '5', '1', '2017-02-05', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('28', '6', '1', '2017-02-06', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('29', '7', '1', '2017-02-07', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('30', '8', '1', '2017-02-08', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('31', '9', '1', '2017-02-09', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('32', '10', '1', '2017-02-10', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('33', '11', '1', '2017-02-11', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('34', '12', '1', '2017-02-12', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('35', '13', '2', '2017-02-13', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('36', '14', '2', '2017-02-14', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('37', '15', '2', '2017-02-15', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('38', '16', '2', '2017-02-16', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('39', '17', '2', '2017-02-17', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('40', '18', '2', '2017-02-18', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('41', '19', '2', '2017-02-19', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('42', '20', '2', '2017-02-20', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('43', '21', '2', '2017-02-21', '复片细节结果', '复片细节备注');
INSERT INTO `eq_review_detail` VALUES ('44', '22', '2', '2017-02-22', '复片细节结果', '复片细节备注');

-- ----------------------------
-- Table structure for `eq_staff`
-- ----------------------------
DROP TABLE IF EXISTS `eq_staff`;
CREATE TABLE `eq_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_loginname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_age` int(11) DEFAULT '10',
  `staff_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_department_id` int(11) DEFAULT NULL,
  `staff_grade` int(5) DEFAULT '1',
  `staff_state` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of eq_staff
-- ----------------------------
INSERT INTO `eq_staff` VALUES ('1', '100001', 'qwerty123', '李医生', '男', '32', '15901413669', 'jingbin001@163.com', '1', '1', null);
INSERT INTO `eq_staff` VALUES ('2', '100002', 'qwerty124', '张医生', '男', '32', '15901413668', 'jingbin002@164.com', '3', '1', null);
INSERT INTO `eq_staff` VALUES ('3', '100003', 'qwerty125', '胡医生', '男', '32', '15901413667', 'jingbin001@164.com', '4', '1', null);
INSERT INTO `eq_staff` VALUES ('4', '100004', 'qwerty123', '天医生', '男', '32', '15901413669', 'jingbin001@163.com', '1', '1', null);
INSERT INTO `eq_staff` VALUES ('5', '100005', 'qwerty124', '丁医生', '男', '32', '15901413668', 'jingbin002@164.com', '3', '1', null);
INSERT INTO `eq_staff` VALUES ('6', '100006', 'qwerty125', '赵医生', '男', '32', '15901413667', 'jingbin001@164.com', '4', '1', null);
INSERT INTO `eq_staff` VALUES ('7', '100007', 'qwerty123', '范医生', '男', '30', '', '', '2', '3', null);
INSERT INTO `eq_staff` VALUES ('8', '100008', 'qwerty123', '樊医生', '男', '30', '', '', '2', '3', null);
INSERT INTO `eq_staff` VALUES ('9', '100009', 'qwerty123', '临时用户', '男', '32', '15901413669', 'jingbin001@163.com', '1', '1', null);

-- ----------------------------
-- Table structure for `report_photo`
-- ----------------------------
DROP TABLE IF EXISTS `report_photo`;
CREATE TABLE `report_photo` (
  `REPORT_PHOTO_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SAMPLE_NO` int(11) DEFAULT NULL,
  `FILE_PATH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_DESC` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REPORT_PHOTO_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_photo
-- ----------------------------
INSERT INTO `report_photo` VALUES ('1', '1', 'c:\\jingbin.jpg', null);
INSERT INTO `report_photo` VALUES ('2', '2', 'c:\\jingbin.jpg', null);
INSERT INTO `report_photo` VALUES ('3', '5', '免疫荧光_动脉.jpg', '免疫荧光动脉图像');
INSERT INTO `report_photo` VALUES ('4', '5', 'C:\\fakepath\\免疫荧光_动脉.jpg', '免疫荧光神经胶质细胞');
INSERT INTO `report_photo` VALUES ('5', '5', '免疫荧光002.jpg', '免疫荧光图像');
INSERT INTO `report_photo` VALUES ('6', '5', 'C:\\fakepath\\免疫荧光002.jpg', '免疫荧光肾癌图像');
INSERT INTO `report_photo` VALUES ('7', '6', '免疫荧光_肺癌.jpg', '免疫荧光肺癌图像');
INSERT INTO `report_photo` VALUES ('8', '6', 'C:\\fakepath\\免疫荧光_肺癌.jpg', '免疫荧光平滑肌图像');

-- ----------------------------
-- Table structure for `sample_photo_desc`
-- ----------------------------
DROP TABLE IF EXISTS `sample_photo_desc`;
CREATE TABLE `sample_photo_desc` (
  `PHOTO_DESC_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SAMPLE_NO` int(11) DEFAULT NULL,
  `FILE_PATH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_DESC` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PHOTO_DESC_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sample_photo_desc
-- ----------------------------
INSERT INTO `sample_photo_desc` VALUES ('1', '1', 'c:\\jingbin.jpg', '');
INSERT INTO `sample_photo_desc` VALUES ('2', '2', 'c:\\jingbin.jpg', null);
INSERT INTO `sample_photo_desc` VALUES ('3', '5', '免疫组化.jpg', '免疫组化图像');
INSERT INTO `sample_photo_desc` VALUES ('4', '5', 'C:\\fakepath\\免疫组化.jpg', '免疫组化图像');
