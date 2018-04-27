/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : slplat

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2018-04-27 20:43:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrative_post`
-- ----------------------------
DROP TABLE IF EXISTS `administrative_post`;
CREATE TABLE `administrative_post` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `administrative_post_index` (`id_`),
  KEY `administrative_post_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='行政职务';

-- ----------------------------
-- Records of administrative_post
-- ----------------------------
INSERT INTO `administrative_post` VALUES ('1', '行政职务', null, '1', '2018-04-27 18:25:01', '1', '2018-04-27 18:25:01', '1', null, '1');

-- ----------------------------
-- Table structure for `answer_for_completion`
-- ----------------------------
DROP TABLE IF EXISTS `answer_for_completion`;
CREATE TABLE `answer_for_completion` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `completion_id` bigint(20) DEFAULT NULL COMMENT '填空题编号',
  `answer_` varchar(254) DEFAULT NULL COMMENT '答案',
  `synonyms` varchar(500) DEFAULT NULL COMMENT '同义词(答案的同义词组)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `answer_for_completion_index` (`id_`),
  KEY `answer_for_completion_completion_index` (`completion_id`),
  CONSTRAINT `fk_answer_for_completion_completion_reference` FOREIGN KEY (`completion_id`) REFERENCES `completion` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='填空题答案';

-- ----------------------------
-- Records of answer_for_completion
-- ----------------------------

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `type_id` bigint(20) NOT NULL COMMENT '类型',
  `path_` varchar(1000) NOT NULL COMMENT '路径',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `attachment_index` (`id_`),
  KEY `attachment_name_index` (`name_`),
  KEY `fk_attachment_createByuser_reference` (`create_by`),
  KEY `fk_attachment_type_reference` (`type_id`),
  KEY `fk_attachment_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_attachment_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`),
  CONSTRAINT `fk_attachment_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attachment_type_reference` FOREIGN KEY (`type_id`) REFERENCES `attachment_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件文档';

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `attachment_type`
-- ----------------------------
DROP TABLE IF EXISTS `attachment_type`;
CREATE TABLE `attachment_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `attachment_type_index` (`id_`),
  KEY `attachment_type_name_index` (`name_`),
  KEY `fk_attachment_type_createByuser_reference` (`create_by`),
  KEY `fk_attachment_type_UpdateByuser_reference` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='附件类型';

-- ----------------------------
-- Records of attachment_type
-- ----------------------------
INSERT INTO `attachment_type` VALUES ('1', '阿德', '', null, '2018-04-27 19:43:07', '1', '2018-04-27 20:35:09', '1', '', '1');
INSERT INTO `attachment_type` VALUES ('5', '23', null, '1', '2018-04-27 20:34:43', '1', '2018-04-27 20:34:43', '1', null, '1');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `prent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属上级',
  `type_` bigint(20) NOT NULL DEFAULT '1' COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(254) DEFAULT NULL COMMENT '权限值',
  `uri_` varchar(1000) NOT NULL COMMENT '路径',
  `icon_` varchar(254) DEFAULT NULL COMMENT '图标',
  `status_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(true:正常, false:禁止)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `authority_index` (`id_`),
  KEY `authority_name_index` (`name_`),
  KEY `authority_parent_id_index` (`prent_id`),
  KEY `authority_type_index` (`type_`),
  KEY `fk_authority_createByuser_reference` (`create_by`),
  KEY `fk_authority_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_authority_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_authority_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of authority
-- ----------------------------

-- ----------------------------
-- Table structure for `batch`
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `batch_index` (`id_`),
  KEY `batch_name_index` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批次';

-- ----------------------------
-- Records of batch
-- ----------------------------

-- ----------------------------
-- Table structure for `book_resource`
-- ----------------------------
DROP TABLE IF EXISTS `book_resource`;
CREATE TABLE `book_resource` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `specialty_id` bigint(20) DEFAULT NULL COMMENT '专业编号',
  `type_` varchar(254) DEFAULT NULL COMMENT '图书形式：电子图书、纸质图书',
  `number_` bigint(20) DEFAULT NULL COMMENT '图书数量',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '出版社',
  `publish_time` date DEFAULT NULL COMMENT '出版时间',
  `ISBN_` varchar(254) DEFAULT NULL COMMENT 'ISBN',
  `introdution_` varchar(5000) DEFAULT NULL COMMENT '简介',
  `authors_` varchar(254) DEFAULT NULL COMMENT '编者',
  `href_` varchar(254) DEFAULT NULL COMMENT '电子书超链接',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `fk_book_resource_createByuser_reference` (`create_by`),
  KEY `fk_book_resource_publisher_reference` (`publisher_id`),
  KEY `fk_book_resource_specialty_reference` (`specialty_id`),
  KEY `fk_book_resource_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_book_resource_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_resource_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_resource_publisher_reference` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id_`),
  CONSTRAINT `fk_book_resource_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书资料';

-- ----------------------------
-- Records of book_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `cee_annual_score`
-- ----------------------------
DROP TABLE IF EXISTS `cee_annual_score`;
CREATE TABLE `cee_annual_score` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `year_` bigint(20) NOT NULL COMMENT '年份',
  `province_id` bigint(20) NOT NULL COMMENT '省份编号',
  `category_id` bigint(20) NOT NULL COMMENT '考生类别编号',
  `batch_id` bigint(20) NOT NULL COMMENT '批次编号',
  `min_score_line` float NOT NULL COMMENT '最低分数线',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `cee_annual_score_index` (`id_`),
  KEY `cee_annual_score_year_index` (`year_`),
  KEY `cee_annual_score_province_index` (`province_id`),
  KEY `cee_annual_score_category_index` (`category_id`),
  KEY `cee_annual_score_batch_index` (`batch_id`),
  CONSTRAINT `fk_cEEAnnual_score_batch_reference` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cEEAnnual_score_examinee_category_reference` FOREIGN KEY (`category_id`) REFERENCES `examinee_category` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cEEAnnual_score_province_reference` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历年分数线';

-- ----------------------------
-- Records of cee_annual_score
-- ----------------------------

-- ----------------------------
-- Table structure for `certificate`
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称全拼',
  `certificate_no` varchar(254) DEFAULT NULL COMMENT '证书编号',
  `owner_id` bigint(20) DEFAULT NULL COMMENT '拥有者编号',
  `level_` varchar(254) DEFAULT NULL COMMENT '级别：初级、中级、高级',
  `type_` varchar(254) DEFAULT NULL COMMENT '类型：企业认证、国家认证',
  `time_` datetime DEFAULT NULL COMMENT '获得时间：保存年份、月份',
  `student_id` varchar(254) DEFAULT NULL COMMENT '学生编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `fk_certificate_owner_reference` (`owner_id`),
  CONSTRAINT `fk_certificate_owner_reference` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相关行业证书';

-- ----------------------------
-- Records of certificate
-- ----------------------------

-- ----------------------------
-- Table structure for `chapter_and_sections`
-- ----------------------------
DROP TABLE IF EXISTS `chapter_and_sections`;
CREATE TABLE `chapter_and_sections` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `course_id` bigint(20) NOT NULL COMMENT '课程编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `overview_` varchar(10000) DEFAULT NULL COMMENT '概述',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '所属父章节编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `chapter_and_sections_index` (`id_`),
  KEY `chapter_and_sections_course_index` (`course_id`),
  KEY `chapter_and_sections_name_index` (`name_`),
  KEY `chapter_and_sections_parent_index` (`parent_id`),
  CONSTRAINT `fk_chapter_and_sections_course_reference` FOREIGN KEY (`course_id`) REFERENCES `course` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='章节';

-- ----------------------------
-- Records of chapter_and_sections
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `province_id` bigint(20) NOT NULL COMMENT '省份编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `city_index` (`id_`),
  KEY `city_name_index` (`name_`),
  KEY `city_province_index` (`province_id`),
  CONSTRAINT `fk_city_province_reference` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='市';

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '贵阳市', null, '1', '1', '2018-04-24 18:12:51', '1', '2018-04-24 18:13:32', '1', null, '1');
INSERT INTO `city` VALUES ('2', '昆明市', null, '2', '1', '2018-04-24 21:54:21', '1', '2018-04-24 21:54:21', '2', null, '1');
INSERT INTO `city` VALUES ('3', '毕节市', null, '1', '1', '2018-04-24 21:56:32', '1', '2018-04-24 21:56:32', '3', null, '1');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `specialty_id` bigint(20) NOT NULL COMMENT '专业编号',
  `adviser_id` bigint(20) DEFAULT NULL COMMENT '班主任编号',
  `monitor_id` bigint(20) DEFAULT NULL COMMENT '班长编号',
  `secretary_id` bigint(20) DEFAULT NULL COMMENT '学习委员编号',
  `entrance_date` datetime DEFAULT NULL COMMENT '入学日期',
  `students_number` bigint(20) DEFAULT NULL COMMENT '学生人数',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `class_index` (`id_`),
  KEY `class_name_index` (`name_`),
  KEY `class_adviser_index` (`adviser_id`),
  KEY `class_specialty_index` (`specialty_id`),
  KEY `fk_monitorstudent_class_reference` (`monitor_id`),
  KEY `fk_secretarystudent_class_reference` (`secretary_id`),
  CONSTRAINT `fk_class_teacher_reference` FOREIGN KEY (`adviser_id`) REFERENCES `teacher` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_monitorstudent_class_reference` FOREIGN KEY (`monitor_id`) REFERENCES `student` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_secretarystudent_class_reference` FOREIGN KEY (`secretary_id`) REFERENCES `student` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_specialty_class_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='班级';

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '4班', null, '1', null, null, null, null, null, '1', '2018-04-20 23:47:03', '1', '2018-04-20 23:47:07', '1', null, '1');
INSERT INTO `class` VALUES ('2', '1班', null, '2', null, null, null, null, null, '1', '2018-04-21 00:42:13', '1', '2018-04-21 00:42:13', '2', null, '1');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `school_id` bigint(20) NOT NULL COMMENT '学校编号',
  `college_profile` varchar(10000) DEFAULT NULL COMMENT '学院概况',
  `college_code` varchar(254) DEFAULT NULL COMMENT '学院代码',
  `students_number` bigint(20) DEFAULT NULL COMMENT '在校生人数',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `college_index` (`id_`),
  KEY `college_name_index` (`name_`),
  KEY `college_code_index` (`college_code`),
  KEY `college_school_index` (`school_id`),
  CONSTRAINT `fk_school_college_reference` FOREIGN KEY (`school_id`) REFERENCES `school` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='学院';

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '数据科学与信息工程学院', null, '1', null, null, null, '1', '2018-04-20 23:46:01', '1', '2018-04-20 23:46:03', '1', null, '1');
INSERT INTO `college` VALUES ('2', '计算机专业', '', '2', '', '', null, '1', '2018-04-21 00:41:10', '1', '2018-04-21 00:42:45', '2', '', '1');
INSERT INTO `college` VALUES ('3', '法学院', null, '1', null, null, null, '1', '2018-04-21 00:43:02', '1', '2018-04-21 00:43:02', '3', null, '1');
INSERT INTO `college` VALUES ('4', '外语学院', null, '3', null, null, null, '1', '2018-04-21 00:43:31', '1', '2018-04-21 00:43:31', '3', null, '1');

-- ----------------------------
-- Table structure for `completion`
-- ----------------------------
DROP TABLE IF EXISTS `completion`;
CREATE TABLE `completion` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(1000) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(1000) DEFAULT NULL COMMENT '名称的全拼',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `completion_index` (`id_`),
  KEY `completion_difficult_degree_index` (`difficult_degree`),
  KEY `completion_is_required_index` (`is_required`),
  KEY `completion_section_index` (`section_id`),
  CONSTRAINT `fk_completion_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='填空题';

-- ----------------------------
-- Records of completion
-- ----------------------------

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `year_` bigint(20) NOT NULL COMMENT '年份',
  `index_` varchar(254) DEFAULT NULL COMMENT '指标：定性指标、定量指标',
  `specialty_id` bigint(20) NOT NULL COMMENT '专业编号',
  `professor_id` bigint(20) NOT NULL COMMENT '专家编号',
  `estimate_` varchar(5000) NOT NULL COMMENT '评价',
  `score_` bigint(20) DEFAULT NULL COMMENT '分值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `content_index` (`id_`),
  KEY `content_year_index` (`year_`),
  KEY `content_specialty_index` (`specialty_id`),
  KEY `content_professor_index` (`professor_id`),
  KEY `fk_content_createByuser_reference` (`create_by`),
  KEY `fk_content_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_content_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_content_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_content_professor_reference` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价内容';

-- ----------------------------
-- Records of content
-- ----------------------------

-- ----------------------------
-- Table structure for `content_detailed_grading_item`
-- ----------------------------
DROP TABLE IF EXISTS `content_detailed_grading_item`;
CREATE TABLE `content_detailed_grading_item` (
  `id_` bigint(20) NOT NULL COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `content_id` bigint(20) NOT NULL COMMENT '评价内容编号',
  `detailed_grading_item_id` bigint(20) NOT NULL COMMENT '评分细则编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `content_detailed_grading_item_contentID_index` (`content_id`),
  KEY `content_detailed_grading_item_detailed_grading_item_id_index` (`detailed_grading_item_id`),
  KEY `fk_content_detailed_grading_item_createByuser_reference` (`create_by`),
  KEY `fk_content_detailed_grading_item_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_content_detailed_grading_item_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_content_detailed_grading_item_content_reference` FOREIGN KEY (`content_id`) REFERENCES `content` (`id_`),
  CONSTRAINT `fk_content_detailed_grading_item_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_content_detailed_grading_item_detailed_grading_item_reference` FOREIGN KEY (`detailed_grading_item_id`) REFERENCES `detailed_grading_item` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价内容与评分规则关联';

-- ----------------------------
-- Records of content_detailed_grading_item
-- ----------------------------

-- ----------------------------
-- Table structure for `copyright`
-- ----------------------------
DROP TABLE IF EXISTS `copyright`;
CREATE TABLE `copyright` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `certificate_id` varchar(254) DEFAULT NULL COMMENT '证书号',
  `completion_date` datetime DEFAULT NULL COMMENT '开发完成日期',
  `release_date` datetime DEFAULT NULL COMMENT '首次发表日期',
  `acquisition_mode` datetime DEFAULT NULL COMMENT '权利取得方式',
  `interest_field` varchar(1000) DEFAULT NULL COMMENT '权利范围',
  `register_no` varchar(254) DEFAULT NULL COMMENT '登记号',
  `licence_date` datetime DEFAULT NULL COMMENT '发证日期',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `copyright_index` (`id_`),
  KEY `copyright_name_index` (`name_`),
  KEY `fk_copyright_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_copyright_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='著作权';

-- ----------------------------
-- Records of copyright
-- ----------------------------

-- ----------------------------
-- Table structure for `copyright_owner`
-- ----------------------------
DROP TABLE IF EXISTS `copyright_owner`;
CREATE TABLE `copyright_owner` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `copyright_no` bigint(20) NOT NULL COMMENT '著作权编号',
  `owner_id` bigint(20) NOT NULL COMMENT '拥有者编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `copyright_owner_copyright_index` (`copyright_no`),
  KEY `copyright_owner_owner_index` (`owner_id`),
  CONSTRAINT `fk_copyright_owner_copyright_reference` FOREIGN KEY (`copyright_no`) REFERENCES `copyright` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_copyright_owner_owner_reference` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='著作权与拥有者（著作权人）关联';

-- ----------------------------
-- Records of copyright_owner
-- ----------------------------

-- ----------------------------
-- Table structure for `county`
-- ----------------------------
DROP TABLE IF EXISTS `county`;
CREATE TABLE `county` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `city_id` bigint(20) NOT NULL COMMENT '市编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `county_index` (`id_`),
  KEY `county_name_index` (`name_`),
  KEY `county_city_index` (`city_id`),
  CONSTRAINT `fk_city_county_reference` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='区县';

-- ----------------------------
-- Records of county
-- ----------------------------
INSERT INTO `county` VALUES ('1', '花溪区', null, '1', '1', '2018-04-24 18:13:34', '1', '2018-04-24 18:13:47', '1', null, '1');
INSERT INTO `county` VALUES ('2', '啊啊啊', null, '2', '1', '2018-04-24 21:54:41', '1', '2018-04-24 21:54:41', '3', null, '1');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `specialty_id` bigint(20) NOT NULL COMMENT '专业编号',
  `code_` varchar(254) NOT NULL COMMENT '课程代码',
  `credit_` bigint(20) NOT NULL COMMENT '学分',
  `class_hours` bigint(20) NOT NULL COMMENT '学时',
  `start_time` datetime DEFAULT NULL COMMENT '开课时间',
  `theory_hours` bigint(20) NOT NULL COMMENT '理论课时',
  `practical_hours` bigint(20) NOT NULL COMMENT '实践课时',
  `type_id` bigint(20) DEFAULT NULL COMMENT '课程类型编号',
  `course_property` varchar(254) DEFAULT NULL COMMENT '课程性质',
  `is_boutique_course` tinyint(4) DEFAULT '0' COMMENT '是否精品课程(true:是, false:否)',
  `introduction_` varchar(10000) DEFAULT NULL COMMENT '课程简介',
  `target_` varchar(10000) DEFAULT NULL COMMENT '课程目标',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `course_index` (`id_`),
  KEY `course_name_index` (`name_`),
  KEY `course_specialty_index` (`specialty_id`),
  KEY `course_code_index` (`code_`),
  KEY `course_type_index` (`type_id`),
  KEY `course_is_boutique_course_index` (`is_boutique_course`),
  CONSTRAINT `fk_course_course_type_reference` FOREIGN KEY (`type_id`) REFERENCES `course_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_course_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `course_material`
-- ----------------------------
DROP TABLE IF EXISTS `course_material`;
CREATE TABLE `course_material` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '出版社编号',
  `editor_` varchar(254) DEFAULT NULL COMMENT '编者',
  `ISBN_` varchar(254) DEFAULT NULL COMMENT 'ISBN',
  `price_` decimal(8,0) DEFAULT NULL COMMENT '定价',
  `feature_` varchar(10000) DEFAULT NULL COMMENT '教材特色',
  `publish_date` datetime DEFAULT NULL COMMENT '出版日期',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `course_material_index` (`id_`),
  KEY `course_material_name_index` (`name_`),
  KEY `course_material_editor_index` (`editor_`),
  KEY `course_material_iSBN_index` (`ISBN_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程教材';

-- ----------------------------
-- Records of course_material
-- ----------------------------

-- ----------------------------
-- Table structure for `course_teaching`
-- ----------------------------
DROP TABLE IF EXISTS `course_teaching`;
CREATE TABLE `course_teaching` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程编号',
  `tutor_id` bigint(20) DEFAULT NULL COMMENT '授课老师编号',
  `counselor_id` bigint(20) DEFAULT NULL COMMENT '辅导老师编号',
  `lecturer_id` bigint(20) DEFAULT NULL COMMENT '授课班级编号',
  `semester_id` bigint(20) DEFAULT NULL COMMENT '开课学期编号',
  `course_material_id` bigint(20) DEFAULT NULL COMMENT '所用教材编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `course_teaching_index` (`id_`),
  KEY `course_teaching_name_index` (`name_`),
  KEY `course_teaching_course_index` (`course_id`),
  KEY `course_teaching_tutor_index` (`tutor_id`),
  KEY `course_teaching_counselor_index` (`counselor_id`),
  KEY `course_teaching_lecturer_index` (`lecturer_id`),
  KEY `course_teaching_semester_index` (`semester_id`),
  KEY `fk_course_teaching_course_material_reference` (`course_material_id`),
  CONSTRAINT `fk_course_teaching_class_reference` FOREIGN KEY (`lecturer_id`) REFERENCES `class` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teaching_counselor_reference` FOREIGN KEY (`counselor_id`) REFERENCES `teacher` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teaching_course_material_reference` FOREIGN KEY (`course_material_id`) REFERENCES `course_material` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teaching_course_reference` FOREIGN KEY (`course_id`) REFERENCES `course` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teaching_semester_reference` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teaching_tutor_reference` FOREIGN KEY (`tutor_id`) REFERENCES `teacher` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程讲授';

-- ----------------------------
-- Records of course_teaching
-- ----------------------------

-- ----------------------------
-- Table structure for `course_type`
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `course_type_index` (`id_`),
  KEY `course_type_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程类型';

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES ('1', '课程类型', null, '1', '2018-04-27 18:26:22', '1', '2018-04-27 18:26:22', '1', null, '1');

-- ----------------------------
-- Table structure for `detailed_grading_item`
-- ----------------------------
DROP TABLE IF EXISTS `detailed_grading_item`;
CREATE TABLE `detailed_grading_item` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(5000) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(5000) DEFAULT NULL COMMENT '名称的全拼',
  `description_` varchar(10000) DEFAULT NULL COMMENT '规则说明',
  `third_rule_id` bigint(20) NOT NULL COMMENT '三级目录编号',
  `year_` bigint(20) NOT NULL COMMENT '年份',
  `specialty_id` bigint(20) NOT NULL COMMENT '专业编号',
  `data_source` varchar(500) DEFAULT NULL COMMENT '数据来源',
  `computing_method` varchar(500) DEFAULT NULL COMMENT '计算方法',
  `score_` bigint(20) DEFAULT NULL COMMENT '所占分值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `detailed_grading_item_index` (`id_`),
  KEY `fk_detailed_grading_item_createByuser_reference` (`create_by`),
  KEY `fk_detailed_grading_item_third_rule_categories_reference` (`third_rule_id`),
  KEY `fk_detailed_grading_item_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_detailed_grading_item_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detailed_grading_item_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detailed_grading_item_third_rule_categories_reference` FOREIGN KEY (`third_rule_id`) REFERENCES `third_rule_categories` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分细则';

-- ----------------------------
-- Records of detailed_grading_item
-- ----------------------------

-- ----------------------------
-- Table structure for `education_program`
-- ----------------------------
DROP TABLE IF EXISTS `education_program`;
CREATE TABLE `education_program` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `year_` bigint(20) DEFAULT NULL COMMENT '年份',
  `specialty_id` bigint(20) NOT NULL COMMENT '专业编号',
  `theoretical_teaching_credit` bigint(20) DEFAULT NULL COMMENT '理论教学学分',
  `practice_teaching_credit` bigint(20) DEFAULT NULL COMMENT '实践教学学分',
  `brief_introduction` varchar(10000) DEFAULT NULL COMMENT '简介',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `education_program_index` (`id_`),
  KEY `education_program_name_index` (`name_`),
  KEY `education_program_year_index` (`year_`),
  KEY `education_program_specialty_index` (`specialty_id`),
  KEY `fk_education_program_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_education_program_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_education_program_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培养方案';

-- ----------------------------
-- Records of education_program
-- ----------------------------

-- ----------------------------
-- Table structure for `employment_situation`
-- ----------------------------
DROP TABLE IF EXISTS `employment_situation`;
CREATE TABLE `employment_situation` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `student_id` bigint(20) NOT NULL COMMENT '学生编号',
  `time_` datetime DEFAULT NULL COMMENT '时间',
  `company_` varchar(254) DEFAULT NULL COMMENT '企业',
  `orientation_` varchar(254) DEFAULT NULL COMMENT '方向',
  `status_` tinyint(4) DEFAULT '1' COMMENT 'true：签约，false：毁约',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `employment_situation_index` (`id_`),
  KEY `employment_situation_student_index` (`student_id`),
  CONSTRAINT `fk_employment_situation_student_reference` FOREIGN KEY (`student_id`) REFERENCES `student` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='就业情况';

-- ----------------------------
-- Records of employment_situation
-- ----------------------------

-- ----------------------------
-- Table structure for `equipment`
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `number_` bigint(20) DEFAULT NULL COMMENT '台数',
  `specialty_id` bigint(20) DEFAULT NULL COMMENT '专业编号',
  `price_` bigint(20) DEFAULT NULL COMMENT '单价',
  `is_nearly_add` tinyint(4) DEFAULT '0' COMMENT '是否近四年新增(true:是, false:否)',
  `use_rate` float DEFAULT NULL COMMENT '本专业使用比例',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `fk_equipment_createByuser_reference` (`create_by`),
  KEY `fk_equipment_specialty_reference` (`specialty_id`),
  KEY `fk_equipment_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_equipment_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备';

-- ----------------------------
-- Records of equipment
-- ----------------------------

-- ----------------------------
-- Table structure for `examinee_category`
-- ----------------------------
DROP TABLE IF EXISTS `examinee_category`;
CREATE TABLE `examinee_category` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `examinee_category_index` (`id_`),
  KEY `examinee_category_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='考生类别';

-- ----------------------------
-- Records of examinee_category
-- ----------------------------
INSERT INTO `examinee_category` VALUES ('1', '考生类别', null, '1', '2018-04-27 18:22:26', '1', '2018-04-27 18:22:26', '1', null, '1');

-- ----------------------------
-- Table structure for `gender`
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `gender_index` (`id_`),
  KEY `gender_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='性别';

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', '男', '', '1', '2018-04-27 18:24:14', '1', '2018-04-27 18:44:07', '2', '', '1');

-- ----------------------------
-- Table structure for `high_school_category`
-- ----------------------------
DROP TABLE IF EXISTS `high_school_category`;
CREATE TABLE `high_school_category` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `high_school_category_index` (`id_`),
  KEY `high_school_category_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='高中类别';

-- ----------------------------
-- Records of high_school_category
-- ----------------------------
INSERT INTO `high_school_category` VALUES ('1', '高中类别', null, '1', '2018-04-27 18:25:12', '1', '2018-04-27 18:25:12', '1', null, '1');

-- ----------------------------
-- Table structure for `judgment`
-- ----------------------------
DROP TABLE IF EXISTS `judgment`;
CREATE TABLE `judgment` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `answer_` tinyint(4) DEFAULT NULL COMMENT '参考答案',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `judgment_index` (`id_`),
  KEY `judgment_difficult_degree_index` (`difficult_degree`),
  KEY `judgment_is_required_index` (`is_required`),
  KEY `judgment_section_index` (`section_id`),
  CONSTRAINT `fk_judgment_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='判断题';

-- ----------------------------
-- Records of judgment
-- ----------------------------

-- ----------------------------
-- Table structure for `knowledge_point`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_point`;
CREATE TABLE `knowledge_point` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `overview_` varchar(10000) DEFAULT NULL COMMENT '知识概述',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '知识难度',
  `parent_knowledge_point_id` bigint(20) DEFAULT NULL COMMENT '所属父知识点编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `knowledge_point_index` (`id_`),
  KEY `knowledge_point_name_index` (`name_`),
  KEY `knowledge_point_difficult_degree_index` (`difficult_degree`),
  KEY `knowledge_point_parent_index` (`parent_knowledge_point_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Records of knowledge_point
-- ----------------------------

-- ----------------------------
-- Table structure for `multi_select`
-- ----------------------------
DROP TABLE IF EXISTS `multi_select`;
CREATE TABLE `multi_select` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `multi_select_index` (`id_`),
  KEY `multi_select_difficult_degree_index` (`difficult_degree`),
  KEY `multi_select_is_required_index` (`is_required`),
  KEY `multi_select_section_index` (`section_id`),
  CONSTRAINT `fk_multi_select_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多项选择题';

-- ----------------------------
-- Records of multi_select
-- ----------------------------

-- ----------------------------
-- Table structure for `nation`
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `nation_index` (`id_`),
  KEY `nation_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='民族';

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES ('1', '侗族', '', '1', '2018-04-27 18:24:25', '1', '2018-04-27 18:44:18', '2', '', '1');

-- ----------------------------
-- Table structure for `owner`
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `flag_` bigint(20) NOT NULL DEFAULT '0' COMMENT '值为0代表学生，1代表教师，2代表学院，3代表学校',
  `student_id` bigint(20) NOT NULL COMMENT '学生',
  `teacher_id` bigint(20) NOT NULL COMMENT '教师',
  `college_id` bigint(20) DEFAULT NULL COMMENT '学院编号',
  `school_id` bigint(20) DEFAULT NULL COMMENT '学校编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `owner_index` (`id_`),
  KEY `owner_student_id_index` (`student_id`),
  KEY `owner_teacher_index` (`teacher_id`),
  KEY `owner_college_index` (`college_id`),
  KEY `owner_school_index` (`school_id`),
  CONSTRAINT `fk_owner_college_reference` FOREIGN KEY (`college_id`) REFERENCES `college` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_owner_school_reference` FOREIGN KEY (`school_id`) REFERENCES `school` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_owner_student_reference` FOREIGN KEY (`student_id`) REFERENCES `student` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_owner_teacher_reference` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拥有者';

-- ----------------------------
-- Records of owner
-- ----------------------------

-- ----------------------------
-- Table structure for `patent`
-- ----------------------------
DROP TABLE IF EXISTS `patent`;
CREATE TABLE `patent` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `patent_type_id` bigint(20) DEFAULT NULL COMMENT '类型编号',
  `patent_no` varchar(254) DEFAULT NULL COMMENT '专利号',
  `patent_date` datetime DEFAULT NULL COMMENT '专利申请日',
  `auth_date` datetime DEFAULT NULL COMMENT '授权公告日',
  `patent_deadline` datetime DEFAULT NULL COMMENT '截止日期',
  `domain_` varchar(254) DEFAULT NULL COMMENT '所属技术领域',
  `content_` varchar(5000) DEFAULT NULL COMMENT '专利简介',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `patent_index` (`id_`),
  KEY `patent_name_index` (`name_`),
  KEY `patent_type_index` (`patent_type_id`),
  KEY `fk_patent_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_patent_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patent_patent_type_reference` FOREIGN KEY (`patent_type_id`) REFERENCES `patent_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利';

-- ----------------------------
-- Records of patent
-- ----------------------------

-- ----------------------------
-- Table structure for `patent_inventor_owner`
-- ----------------------------
DROP TABLE IF EXISTS `patent_inventor_owner`;
CREATE TABLE `patent_inventor_owner` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `patent_no` bigint(20) NOT NULL COMMENT '专利编号',
  `owner_id` bigint(20) NOT NULL COMMENT '拥有者编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `patent_inventor_owner_index` (`id_`),
  KEY `fk_patent_inventor_owner_owner_reference` (`owner_id`),
  KEY `fk_patent_inventor_owner_patent_reference` (`patent_no`),
  CONSTRAINT `fk_patent_inventor_owner_owner_reference` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patent_inventor_owner_patent_reference` FOREIGN KEY (`patent_no`) REFERENCES `patent` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利发明人（设计人）与拥有者关联';

-- ----------------------------
-- Records of patent_inventor_owner
-- ----------------------------

-- ----------------------------
-- Table structure for `patent_type`
-- ----------------------------
DROP TABLE IF EXISTS `patent_type`;
CREATE TABLE `patent_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `patent_type_index` (`id_`),
  KEY `patent_type_name_index` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利类型';

-- ----------------------------
-- Records of patent_type
-- ----------------------------

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `is_teacher` tinyint(4) NOT NULL DEFAULT '0' COMMENT '值为false代表学生，true代表教师',
  `student_id` bigint(20) NOT NULL COMMENT '学生',
  `teacher_id` bigint(20) NOT NULL COMMENT '教师',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `person_index` (`id_`),
  KEY `person_student_id_index` (`student_id`),
  KEY `person_teacher_id_index` (`teacher_id`),
  CONSTRAINT `fk_person_student_reference` FOREIGN KEY (`student_id`) REFERENCES `student` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_person_teacher_reference` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员';

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for `political_status`
-- ----------------------------
DROP TABLE IF EXISTS `political_status`;
CREATE TABLE `political_status` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `political_status_index` (`id_`),
  KEY `political_status_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='政治面貌';

-- ----------------------------
-- Records of political_status
-- ----------------------------
INSERT INTO `political_status` VALUES ('1', '共青团员', null, '1', '2018-04-27 18:24:39', '1', '2018-04-27 18:24:39', '1', null, '1');

-- ----------------------------
-- Table structure for `postgraduate_situation`
-- ----------------------------
DROP TABLE IF EXISTS `postgraduate_situation`;
CREATE TABLE `postgraduate_situation` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `student_id` bigint(20) NOT NULL COMMENT '学生编号',
  `time_` datetime DEFAULT NULL COMMENT '时间',
  `school_` varchar(254) DEFAULT NULL COMMENT '学校',
  `specialty_` varchar(254) DEFAULT NULL COMMENT '专业',
  `is_adjust` tinyint(4) DEFAULT '1' COMMENT 'true：第一志愿，false：调剂',
  `status_` tinyint(4) DEFAULT '1' COMMENT 'true：录取，false：未录取',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `postgraduate_situation_index` (`id_`),
  KEY `postgraduate_situation_student_index` (`student_id`),
  CONSTRAINT `fk_postgraduate_situation_student_reference` FOREIGN KEY (`student_id`) REFERENCES `student` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考研情况';

-- ----------------------------
-- Records of postgraduate_situation
-- ----------------------------

-- ----------------------------
-- Table structure for `practice_basement`
-- ----------------------------
DROP TABLE IF EXISTS `practice_basement`;
CREATE TABLE `practice_basement` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `enterprise_` varchar(254) DEFAULT NULL COMMENT '依托企业',
  `number_` bigint(20) DEFAULT NULL COMMENT '实习学生数量',
  `specialty_id` bigint(20) DEFAULT NULL COMMENT '专业编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `fk_practice_basement_createByuser_reference` (`create_by`),
  KEY `fk_practice_basement_specialty_reference` (`specialty_id`),
  KEY `fk_practice_basement_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_practice_basement_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_basement_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_basement_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校外实习基地';

-- ----------------------------
-- Records of practice_basement
-- ----------------------------

-- ----------------------------
-- Table structure for `professional_title`
-- ----------------------------
DROP TABLE IF EXISTS `professional_title`;
CREATE TABLE `professional_title` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `professional_title_index` (`id_`),
  KEY `professional_title_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='职称';

-- ----------------------------
-- Records of professional_title
-- ----------------------------
INSERT INTO `professional_title` VALUES ('1', '职称', null, '1', '2018-04-27 18:24:50', '1', '2018-04-27 18:24:50', '1', null, '1');

-- ----------------------------
-- Table structure for `professor`
-- ----------------------------
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `gender_id` bigint(20) NOT NULL COMMENT '性别编号',
  `phone_` varchar(254) DEFAULT NULL COMMENT '联系电话',
  `email_` varchar(254) DEFAULT NULL COMMENT '电子邮件',
  `address_` varchar(1000) DEFAULT NULL COMMENT '家庭住址',
  `employer_Unit` varchar(254) DEFAULT NULL COMMENT '任职单位',
  `unit_address` varchar(1000) DEFAULT NULL COMMENT '单位地址',
  `unit_phone` varchar(254) DEFAULT NULL COMMENT '单位电话',
  `major_field` varchar(254) DEFAULT NULL COMMENT '专业方向',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `professor_index` (`id_`),
  KEY `professor_name_index` (`name_`),
  KEY `fk_professor_createByuser_reference` (`create_by`),
  KEY `fk_professor_gender_reference` (`gender_id`),
  KEY `fk_professor_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_professor_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_professor_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_professor_gender_reference` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专家';

-- ----------------------------
-- Records of professor
-- ----------------------------

-- ----------------------------
-- Table structure for `program`
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `answer_` text COMMENT '参考答案',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `program_index` (`id_`),
  KEY `program_difficult_degree_index` (`difficult_degree`),
  KEY `program_is_required_index` (`is_required`),
  KEY `program_section_index` (`section_id`),
  CONSTRAINT `fk_program_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编程题';

-- ----------------------------
-- Records of program
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型编号',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '负责人',
  `field_` varchar(254) DEFAULT NULL COMMENT '涉及领域',
  `approve_time` datetime DEFAULT NULL COMMENT '批准时间：年',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间：年',
  `finish_time` datetime DEFAULT NULL COMMENT '结束时间：年',
  `duration_` datetime DEFAULT NULL COMMENT '持续时间：年',
  `funds_` float DEFAULT NULL COMMENT '经费（万）',
  `status_` tinyint(4) DEFAULT NULL COMMENT '是否结项',
  `source_` varchar(254) DEFAULT NULL COMMENT '来源',
  `leader_department` varchar(254) DEFAULT NULL COMMENT '所属单位',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `project_index` (`id_`),
  KEY `project_name_index` (`name_`),
  KEY `project_type_index` (`type_id`),
  KEY `project_leader_index` (`leader_id`),
  KEY `fk_project_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_peoject_owner_reference` FOREIGN KEY (`leader_id`) REFERENCES `owner` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_peoject_peojectType_reference` FOREIGN KEY (`type_id`) REFERENCES `project_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目';

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `project_owner`
-- ----------------------------
DROP TABLE IF EXISTS `project_owner`;
CREATE TABLE `project_owner` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `peoject_id` bigint(20) NOT NULL COMMENT '项目编号',
  `owner_id` bigint(20) NOT NULL COMMENT '拥有者编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `project_owner_peoject_index` (`peoject_id`),
  KEY `project_owner_owner_index` (`owner_id`),
  CONSTRAINT `fk_peoject_owner_owner_reference` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_peoject_owner_peoject_reference` FOREIGN KEY (`peoject_id`) REFERENCES `project` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目与拥有者（主要参与者）关联';

-- ----------------------------
-- Records of project_owner
-- ----------------------------

-- ----------------------------
-- Table structure for `project_type`
-- ----------------------------
DROP TABLE IF EXISTS `project_type`;
CREATE TABLE `project_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `level_` varchar(254) NOT NULL COMMENT '级别：国家级、省级、校级',
  `type_` varchar(254) DEFAULT NULL COMMENT '类别：',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `project_type_index` (`id_`),
  KEY `project_type_name_index` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目类型：科研课题：国家级（科技部课题、国家自然基金课题、国家社科基金课题等）';

-- ----------------------------
-- Records of project_type
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `province_index` (`id_`),
  KEY `province_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='省份';

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '贵州省', null, '1', '2018-04-24 18:12:05', '1', '2018-04-24 18:12:08', '1', null, '1');
INSERT INTO `province` VALUES ('2', '云南省', null, '1', '2018-04-24 21:54:01', '1', '2018-04-24 21:54:01', '2', null, '1');

-- ----------------------------
-- Table structure for `publisher`
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `publisher_index` (`id_`),
  KEY `publisher_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='出版社';

-- ----------------------------
-- Records of publisher
-- ----------------------------
INSERT INTO `publisher` VALUES ('1', '出版社', null, '1', '2018-04-27 18:25:23', '1', '2018-04-27 18:25:23', '1', null, '1');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('iBase4J-Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('iBase4J-Scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('iBase4J-Scheduler', 'LAPTOP-TBN3EJDU1524824372096', '1524833016038', '20000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `question_knowledge_point`
-- ----------------------------
DROP TABLE IF EXISTS `question_knowledge_point`;
CREATE TABLE `question_knowledge_point` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `question_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '0：单项选择题，1：多项选择题，2：填空题，3：填空题，4：简答题，5：编程题',
  `question_id` bigint(20) NOT NULL COMMENT '题目编号',
  `knowledge_point_id` bigint(20) NOT NULL COMMENT '知识点编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `question_knowledge_point_index` (`id_`),
  KEY `question_knowledge_point_question_type_index` (`question_type`),
  KEY `question_knowledge_point_question_id_index` (`question_id`),
  KEY `question_knowledge_point_knowledge_point_index` (`knowledge_point_id`),
  CONSTRAINT `fk_question_and_knowledge_point_reference` FOREIGN KEY (`knowledge_point_id`) REFERENCES `knowledge_point` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题目与知识点关联';

-- ----------------------------
-- Records of question_knowledge_point
-- ----------------------------

-- ----------------------------
-- Table structure for `reward`
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `certificate_no` varchar(254) DEFAULT NULL COMMENT '证书编号',
  `award_date` datetime DEFAULT NULL COMMENT '获奖日期',
  `award_class` varchar(254) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL COMMENT '类别编号',
  `complete_department` varchar(254) DEFAULT NULL,
  `departments_` varchar(254) DEFAULT NULL COMMENT '颁奖部门',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `reward_index` (`id_`),
  KEY `reward_name_index` (`name_`),
  KEY `reward_type_index` (`type_id`),
  KEY `fk_reward_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_reward_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reward_reward_type_reference` FOREIGN KEY (`type_id`) REFERENCES `reward_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖励';

-- ----------------------------
-- Records of reward
-- ----------------------------

-- ----------------------------
-- Table structure for `reward_owner`
-- ----------------------------
DROP TABLE IF EXISTS `reward_owner`;
CREATE TABLE `reward_owner` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `reward_id` bigint(20) NOT NULL COMMENT '奖励编号',
  `owner_id` bigint(20) NOT NULL COMMENT '拥有者编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `reward_owner_reward_index` (`reward_id`),
  KEY `reward_owner_owner_index` (`owner_id`),
  CONSTRAINT `fk_reward_owner_owner_reference` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reward_owner_reward_reference` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖励与拥有者（获奖人）关联';

-- ----------------------------
-- Records of reward_owner
-- ----------------------------

-- ----------------------------
-- Table structure for `reward_type`
-- ----------------------------
DROP TABLE IF EXISTS `reward_type`;
CREATE TABLE `reward_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `reward_type_index` (`id_`),
  KEY `reward_type_name_index` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖励类别：国家自然科学奖、技术发明奖、科技进步奖、教育部高校科研成果奖（科学技术、人文社科）；省政府科技进步奖、技术发明';

-- ----------------------------
-- Records of reward_type
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `description_` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `role_index` (`id_`),
  KEY `role_name_index` (`name_`),
  KEY `fk_role_createByuser_reference` (`create_by`),
  KEY `fk_role_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_role_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `authority_id` bigint(20) NOT NULL COMMENT '权限编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `roleauthority_role_index` (`role_id`),
  KEY `roleauthority_authority_index` (`authority_id`),
  KEY `fk_role_authority_createByuser_reference` (`create_by`),
  KEY `fk_role_authority_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_role_authority_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_authority_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_roleauthority_authority_reference` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_roleauthority_role_reference` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联';

-- ----------------------------
-- Records of role_authority
-- ----------------------------

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `school_profiles` varchar(10000) DEFAULT NULL COMMENT '学校概况',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `school_index` (`id_`),
  KEY `school_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='学校';

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '贵州民族大学', null, null, '1', '2018-04-20 23:45:15', '1', '2018-04-20 23:45:18', '1', '', '1');
INSERT INTO `school` VALUES ('2', '贵州大学', null, null, '1', '2018-04-21 00:40:54', '1', '2018-04-21 00:40:54', '2', null, '1');
INSERT INTO `school` VALUES ('3', '贵州师范大学', null, null, '1', '2018-04-21 00:43:16', '1', '2018-04-21 00:43:16', '3', null, '1');

-- ----------------------------
-- Table structure for `second_rule_categories`
-- ----------------------------
DROP TABLE IF EXISTS `second_rule_categories`;
CREATE TABLE `second_rule_categories` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(5000) NOT NULL COMMENT '名称',
  `spell_` varchar(5000) DEFAULT NULL COMMENT '名称的全拼',
  `top_rule_id` bigint(20) NOT NULL COMMENT '一级目录编号',
  `total_score` bigint(20) DEFAULT NULL COMMENT '所占分值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `second_rule_categories_index` (`id_`),
  KEY `second_rule_categories_toprule_index` (`top_rule_id`),
  KEY `fk_second_rule_categories_createByuser_reference` (`create_by`),
  KEY `fk_second_rule_categories_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_second_rule_categories_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_second_rule_categories_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_secondrule_toprule_reference` FOREIGN KEY (`top_rule_id`) REFERENCES `top_rule_categories` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分二级目录';

-- ----------------------------
-- Records of second_rule_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `select_options`
-- ----------------------------
DROP TABLE IF EXISTS `select_options`;
CREATE TABLE `select_options` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `question_type` tinyint(4) DEFAULT '1' COMMENT '题目类型(true:单选, false:多选)',
  `question_id` bigint(20) DEFAULT NULL COMMENT '题目编号',
  `is_answer` tinyint(4) DEFAULT '0' COMMENT '是否为答案(true:是, false:否)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `selectoptions_index` (`id_`),
  KEY `selectoptions_question_type_index` (`question_type`),
  KEY `selectoptions_question_id_index` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选择题选项';

-- ----------------------------
-- Records of select_options
-- ----------------------------

-- ----------------------------
-- Table structure for `semester`
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `start_date` datetime NOT NULL COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `total_Weeks` bigint(20) DEFAULT NULL COMMENT '总周数',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `semester_index` (`id_`),
  KEY `semester_name_index` (`name_`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='学期';

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES ('1', '213', '', '2018-09-08 00:00:00', '2018-09-08 00:00:00', null, '1', '2018-04-27 19:21:38', '1', '2018-04-27 19:22:19', '3', '', '1');
INSERT INTO `semester` VALUES ('2', '123', null, '1970-01-01 08:00:02', '1970-01-01 08:00:00', null, '1', '2018-04-27 19:22:46', '1', '2018-04-27 19:22:46', '4', null, '1');
INSERT INTO `semester` VALUES ('3', '32', null, '2087-03-08 00:00:00', '2087-03-08 00:00:00', null, '1', '2018-04-27 19:23:20', '1', '2018-04-27 19:23:20', '3', null, '1');
INSERT INTO `semester` VALUES ('4', '2', null, '1970-01-01 16:09:34', '1970-01-01 16:55:33', null, '1', '2018-04-27 19:24:10', '1', '2018-04-27 19:24:10', '3', null, '1');

-- ----------------------------
-- Table structure for `short_answer_question`
-- ----------------------------
DROP TABLE IF EXISTS `short_answer_question`;
CREATE TABLE `short_answer_question` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `answer_` varchar(10000) DEFAULT NULL COMMENT '参考答案',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `short_answer_question_index` (`id_`),
  KEY `short_answer_question_difficult_degree_index` (`difficult_degree`),
  KEY `short_answer_question_is_required_index` (`is_required`),
  KEY `short_answer_question_section_index` (`section_id`),
  CONSTRAINT `fk_short_answer_question_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简答题';

-- ----------------------------
-- Records of short_answer_question
-- ----------------------------

-- ----------------------------
-- Table structure for `single_select`
-- ----------------------------
DROP TABLE IF EXISTS `single_select`;
CREATE TABLE `single_select` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(2000) NOT NULL COMMENT '名称',
  `spell_` varchar(2000) DEFAULT NULL COMMENT '名称的全拼',
  `difficult_degree` bigint(20) DEFAULT NULL COMMENT '难度系数',
  `is_required` tinyint(4) DEFAULT '0' COMMENT '是否必选(true:是, false:否)',
  `section_id` bigint(20) DEFAULT NULL COMMENT '所属章节',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `single_select_index` (`id_`),
  KEY `single_select_difficult_degree_index` (`difficult_degree`),
  KEY `single_select_is_required_index` (`is_required`),
  KEY `single_select_section_index` (`section_id`),
  CONSTRAINT `fk_single_select_chapter_and_sections_reference` FOREIGN KEY (`section_id`) REFERENCES `chapter_and_sections` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单项选择题';

-- ----------------------------
-- Records of single_select
-- ----------------------------

-- ----------------------------
-- Table structure for `specialty`
-- ----------------------------
DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `major_code` varchar(254) DEFAULT NULL,
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `college_id` bigint(20) NOT NULL COMMENT '学院编号',
  `school_year` bigint(20) DEFAULT NULL COMMENT '学制',
  `category_` varchar(254) DEFAULT NULL COMMENT '类别',
  `major_leader_id` bigint(20) DEFAULT NULL COMMENT '主要负责人编号',
  `introduction_` varchar(10000) DEFAULT NULL COMMENT '简介',
  `students_number` bigint(20) DEFAULT NULL COMMENT '在校生人数',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `specialty_index` (`id_`),
  KEY `specialty_name_index` (`name_`),
  KEY `specialty_college_index` (`college_id`),
  KEY `fk_specialtyteacher_reference` (`major_leader_id`),
  CONSTRAINT `fk_college_specialty_reference` FOREIGN KEY (`college_id`) REFERENCES `college` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_specialtyteacher_reference` FOREIGN KEY (`major_leader_id`) REFERENCES `teacher` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专业';

-- ----------------------------
-- Records of specialty
-- ----------------------------
INSERT INTO `specialty` VALUES ('1', null, '软件工程', null, '1', null, null, null, '', null, '1', '2018-04-20 23:46:39', '1', '2018-04-20 23:46:43', '1', null, '1');
INSERT INTO `specialty` VALUES ('2', null, '计算机科学系', null, '2', null, null, null, null, null, '1', '2018-04-21 00:41:59', '1', '2018-04-21 00:41:59', '2', null, '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `no_` varchar(254) DEFAULT NULL COMMENT '学号',
  `birthdady_` date DEFAULT NULL COMMENT '出生日期',
  `gender_id` bigint(20) DEFAULT NULL COMMENT '性别编号',
  `nation_id` bigint(20) DEFAULT NULL COMMENT '民族编号',
  `political_status_id` bigint(20) DEFAULT NULL COMMENT '政治面貌编号',
  `college_id` bigint(20) DEFAULT NULL COMMENT '学院编号',
  `specialty_id` bigint(20) DEFAULT NULL COMMENT '专业编号',
  `class_own_id` bigint(20) DEFAULT NULL COMMENT '班级编号',
  `entrance_date` date DEFAULT NULL COMMENT '入学日期',
  `age_` int(11) DEFAULT NULL COMMENT '年龄',
  `idcard_no` varchar(254) DEFAULT NULL COMMENT '身份证号',
  `phone_` varchar(254) DEFAULT NULL COMMENT '电话',
  `email_` varchar(254) DEFAULT NULL COMMENT '电子邮箱',
  `college_enexam_scores` float DEFAULT NULL COMMENT '高考分数',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省编号',
  `city_id` bigint(20) DEFAULT NULL COMMENT '市编号',
  `county_id` bigint(20) DEFAULT NULL COMMENT '县/区编号',
  `town_id` bigint(20) DEFAULT NULL COMMENT '镇编号',
  `address_` varchar(254) DEFAULT NULL COMMENT '家庭住址',
  `high_school` varchar(254) DEFAULT NULL COMMENT '就读高中',
  `high_school_category_id` bigint(20) DEFAULT NULL COMMENT '高中类别编号',
  `postgraduate_info_id` bigint(20) DEFAULT NULL COMMENT '考研信息编号',
  `head_img_id` bigint(20) DEFAULT NULL COMMENT '头像',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `student_index` (`id_`),
  KEY `student_name_index` (`name_`),
  KEY `student_no_index` (`no_`),
  KEY `student_college_index` (`college_id`),
  KEY `student_specialty_index` (`specialty_id`),
  KEY `student_class_index` (`class_own_id`),
  KEY `fk_student_attachment_reference` (`head_img_id`),
  KEY `fk_student_city_reference` (`city_id`),
  KEY `fk_student_county_reference` (`county_id`),
  KEY `fk_student_gender_reference` (`gender_id`),
  KEY `fk_student_nation_reference` (`nation_id`),
  KEY `fk_student_political_status_reference` (`political_status_id`),
  KEY `fk_student_province_reference` (`province_id`),
  KEY `fk_student_town_reference` (`town_id`),
  CONSTRAINT `fk_student_attachment_reference` FOREIGN KEY (`head_img_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_city_reference` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_class_reference` FOREIGN KEY (`class_own_id`) REFERENCES `class` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_college_reference` FOREIGN KEY (`college_id`) REFERENCES `college` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_county_reference` FOREIGN KEY (`county_id`) REFERENCES `county` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_gender_reference` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_high_school_category_reference` FOREIGN KEY (`id_`) REFERENCES `high_school_category` (`id_`),
  CONSTRAINT `fk_student_nation_reference` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_political_status_reference` FOREIGN KEY (`political_status_id`) REFERENCES `political_status` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_province_reference` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_specialty_reference` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_town_reference` FOREIGN KEY (`town_id`) REFERENCES `town` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门编号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=825363166504628225 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', 'sysPlat', null, '1', '0', '0', '1', 'qw', '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dept` VALUES ('2', '市场部', null, '1', '1', '1', '1', 't', '1', '0', '2016-06-28 18:04:06', '0', '2016-06-28 18:04:06');
INSERT INTO `sys_dept` VALUES ('825363166504628224', '技术部', null, '1', '1', null, '2', '', null, '1', '2017-01-28 23:21:28', '1', '2017-05-29 08:15:29');

-- ----------------------------
-- Table structure for `sys_dic`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `type_` varchar(254) NOT NULL,
  `code_` varchar(254) DEFAULT NULL,
  `code_text` varchar(254) DEFAULT NULL,
  `parent_type` varchar(254) DEFAULT NULL,
  `parent_code` varchar(254) DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `type_Code` (`type_`,`code_`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('1', null, null, 'SEX', '0', '未知', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:13');
INSERT INTO `sys_dic` VALUES ('2', null, null, 'SEX', '1', '男', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:12');
INSERT INTO `sys_dic` VALUES ('3', null, null, 'SEX', '2', '女', null, null, '0', '3', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('4', null, null, 'LOCKED', '0', '激活', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('5', null, null, 'LOCKED', '1', '锁定', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:10');
INSERT INTO `sys_dic` VALUES ('6', null, null, 'ROLETYPE', '1', '业务角色', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('7', null, null, 'ROLETYPE', '2', '管理角色', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('8', null, null, 'ROLETYPE', '3', '系统内置角色', null, null, '0', '3', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:08');
INSERT INTO `sys_dic` VALUES ('9', null, null, 'LEAF', '0', '树枝节点', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('10', null, null, 'LEAF', '1', '叶子节点', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('11', null, null, 'EDITABLE', '0', '只读', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('12', null, null, 'EDITABLE', '1', '可编辑', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('13', null, null, 'is_Enable', '0', '禁用', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:05');
INSERT INTO `sys_dic` VALUES ('14', null, null, 'is_Enable', '1', '启用', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:04');
INSERT INTO `sys_dic` VALUES ('15', null, null, 'AUTHORIZELEVEL', '1', '访问权限', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('16', null, null, 'AUTHORIZELEVEL', '2', '管理权限', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:02');
INSERT INTO `sys_dic` VALUES ('17', null, null, 'MENUTYPE', '1', '系统菜单', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('18', null, null, 'MENUTYPE', '2', '业务菜单', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('19', null, null, 'USERTYPE', '1', '经办员', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:50');
INSERT INTO `sys_dic` VALUES ('20', null, null, 'USERTYPE', '2', '管理员', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:48');
INSERT INTO `sys_dic` VALUES ('21', null, null, 'USERTYPE', '3', '系统内置用户', null, null, '0', '3', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('22', null, null, 'EXPAND', '0', '收缩', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('23', null, null, 'EXPAND', '1', '展开', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:46');
INSERT INTO `sys_dic` VALUES ('24', null, null, 'CRUD', 'add', '新增', null, null, '0', '1', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:56');
INSERT INTO `sys_dic` VALUES ('25', null, null, 'CRUD', 'read', '查询', null, null, '0', '2', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:58');
INSERT INTO `sys_dic` VALUES ('26', null, null, 'CRUD', 'update', '修改', null, null, '0', '3', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('27', null, null, 'CRUD', 'delete', '删除', null, null, '0', '4', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('28', null, null, 'CRUD', 'open', '打开', null, null, '0', '5', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:00');
INSERT INTO `sys_dic` VALUES ('29', null, null, 'CRUD', 'close', '关闭', null, null, '0', '6', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('30', null, null, 'CRUD', 'run', '执行', null, null, '0', '7', null, '1', '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');

-- ----------------------------
-- Table structure for `sys_email`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `sender_` varchar(32) NOT NULL COMMENT '使用发送',
  `email_Title` varchar(256) NOT NULL COMMENT '发送标题',
  `email_Content` text NOT NULL COMMENT '发送内容',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邮件表';

-- ----------------------------
-- Records of sys_email
-- ----------------------------
INSERT INTO `sys_email` VALUES ('1', 'test', null, 't', 'a', '并蒂芙蓉', '1', null, '1', '1', '2017-02-02 16:37:54', '1', '2017-02-02 16:37:54');

-- ----------------------------
-- Table structure for `sys_email_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_config`;
CREATE TABLE `sys_email_config` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `smtp_host` varchar(32) NOT NULL COMMENT 'SMTP服务器',
  `smtp_port` varchar(8) NOT NULL COMMENT 'SMTP服务器端口',
  `send_method` varchar(16) NOT NULL COMMENT '发送方式',
  `sender_name` varchar(64) NOT NULL COMMENT '名称',
  `sender_account` varchar(32) NOT NULL COMMENT '发邮件邮箱账号',
  `sender_password` varchar(32) NOT NULL COMMENT '发邮件邮箱密码',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=828157583909109761 DEFAULT CHARSET=utf8 COMMENT='邮件配置表';

-- ----------------------------
-- Records of sys_email_config
-- ----------------------------
INSERT INTO `sys_email_config` VALUES ('828157583909109760', null, null, 'smtp.163.com', '101', '0', 'sysPlat', 'sysPlat@163.com', 'BK5sgjz5JOOsFuD4w0mbe7==', '1', null, '1', '1', '2017-02-05 16:25:29', '1', '2017-02-05 16:37:50');

-- ----------------------------
-- Table structure for `sys_email_template`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_template`;
CREATE TABLE `sys_email_template` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `email_account` varchar(32) DEFAULT NULL COMMENT '发送邮件帐号',
  `title_` varchar(512) DEFAULT NULL COMMENT '标题模版',
  `template_` text COMMENT '内容模板',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模版表';

-- ----------------------------
-- Records of sys_email_template
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_event`
-- ----------------------------
DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE `sys_event` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `title_` varchar(254) DEFAULT NULL,
  `request_uri` varchar(254) DEFAULT NULL,
  `parameters_` varchar(500) DEFAULT NULL,
  `method_` varchar(20) DEFAULT NULL,
  `client_host` varchar(254) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `status_` int(3) DEFAULT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_event
-- ----------------------------
INSERT INTO `sys_event` VALUES ('1', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-21 00:27:26', '1', '2018-04-21 00:27:26');
INSERT INTO `sys_event` VALUES ('2', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-21 00:30:24', '1', '2018-04-21 00:30:24');
INSERT INTO `sys_event` VALUES ('3', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-21 00:35:15', '1', '2018-04-21 00:35:15');
INSERT INTO `sys_event` VALUES ('4', null, null, '修改学校', '/school', '\"{\\\"name\\\":\\\"贵州大学\\\",\\\"sortNo\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:40:54', '1', '2018-04-21 00:40:54');
INSERT INTO `sys_event` VALUES ('5', null, null, '修改学院', '/college', '\"{\\\"name\\\":\\\"计算机专业\\\",\\\"sortNo\\\":\\\"3\\\",\\\"schoolId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:41:10', '1', '2018-04-21 00:41:10');
INSERT INTO `sys_event` VALUES ('6', null, null, '修改专业', '/specialty', '\"{\\\"name\\\":\\\"计算机科学系\\\",\\\"sortNo\\\":\\\"2\\\",\\\"schoolId\\\":\\\"2\\\",\\\"collegeId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:41:59', '1', '2018-04-21 00:41:59');
INSERT INTO `sys_event` VALUES ('7', null, null, '修改班级', '/class', '\"{\\\"name\\\":\\\"1班\\\",\\\"sortNo\\\":\\\"2\\\",\\\"collegeId\\\":\\\"2\\\",\\\"specialtyId\\\":\\\"2\\\",\\\"schoolId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:42:13', '1', '2018-04-21 00:42:13');
INSERT INTO `sys_event` VALUES ('8', null, null, '修改学院', '/college', '\"{\\\"name\\\":\\\"法学院\\\",\\\"sortNo\\\":\\\"3\\\",\\\"schoolId\\\":\\\"1\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:43:02', '1', '2018-04-21 00:43:02');
INSERT INTO `sys_event` VALUES ('9', null, null, '修改学校', '/school', '\"{\\\"name\\\":\\\"贵州师范大学\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:43:16', '1', '2018-04-21 00:43:16');
INSERT INTO `sys_event` VALUES ('10', null, null, '修改学院', '/college', '\"{\\\"name\\\":\\\"外语学院\\\",\\\"sortNo\\\":\\\"3\\\",\\\"schoolId\\\":\\\"3\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-21 00:43:31', '1', '2018-04-21 00:43:31');
INSERT INTO `sys_event` VALUES ('11', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 18:17:44', '1', '2018-04-24 18:17:44');
INSERT INTO `sys_event` VALUES ('12', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:41:51', '1', '2018-04-24 21:41:51');
INSERT INTO `sys_event` VALUES ('13', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:47:53', '1', '2018-04-24 21:47:53');
INSERT INTO `sys_event` VALUES ('14', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:48:42', '1', '2018-04-24 21:48:42');
INSERT INTO `sys_event` VALUES ('15', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:48:42', '1', '2018-04-24 21:48:42');
INSERT INTO `sys_event` VALUES ('16', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:50:58', '1', '2018-04-24 21:50:58');
INSERT INTO `sys_event` VALUES ('17', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:53:29', '1', '2018-04-24 21:53:29');
INSERT INTO `sys_event` VALUES ('18', null, null, '修改省份', '/province', '\"{\\\"name\\\":\\\"云南省\\\",\\\"sortNo\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:54:01', '1', '2018-04-24 21:54:01');
INSERT INTO `sys_event` VALUES ('19', null, null, '修改市', '/city', '\"{\\\"name\\\":\\\"昆明市\\\",\\\"sortNo\\\":\\\"2\\\",\\\"provinceId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:54:21', '1', '2018-04-24 21:54:21');
INSERT INTO `sys_event` VALUES ('20', null, null, '修改区县', '/county', '\"{\\\"name\\\":\\\"啊啊啊\\\",\\\"sortNo\\\":\\\"3\\\",\\\"provinceId\\\":\\\"2\\\",\\\"cityId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:54:41', '1', '2018-04-24 21:54:41');
INSERT INTO `sys_event` VALUES ('21', null, null, '修改镇', '/town', '\"{\\\"name\\\":\\\"123\\\",\\\"sortNo\\\":\\\"2\\\",\\\"provinceId\\\":\\\"2\\\",\\\"cityId\\\":\\\"2\\\",\\\"countyId\\\":\\\"2\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:54:58', '1', '2018-04-24 21:54:58');
INSERT INTO `sys_event` VALUES ('22', null, null, '修改市', '/city', '\"{\\\"name\\\":\\\"毕节市\\\",\\\"sortNo\\\":\\\"3\\\",\\\"provinceId\\\":\\\"1\\\"}\"', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '', '1', '1', '2018-04-24 21:56:32', '1', '2018-04-24 21:56:32');
INSERT INTO `sys_event` VALUES ('23', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; Trident/7.0; rv:11.0) like Gecko', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-24 21:59:16', '1', '2018-04-24 21:59:16');
INSERT INTO `sys_event` VALUES ('24', null, null, '用户登录', '/login', '{}', 'POST', '192.168.40.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5183.400 QQBrowser/10.0.1059.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-25 08:27:21', '1', '2018-04-25 08:27:21');
INSERT INTO `sys_event` VALUES ('25', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 18:20:46', '1', '2018-04-27 18:20:46');
INSERT INTO `sys_event` VALUES ('26', null, null, '修改考生类别', '/examineeCategory', '\"{\\\"name\\\":\\\"考生类别\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:22:27', '1', '2018-04-27 18:22:27');
INSERT INTO `sys_event` VALUES ('27', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"学期\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:23:26', '1', '2018-04-27 18:23:26');
INSERT INTO `sys_event` VALUES ('28', null, null, '修改性别', '/gender', '\"{\\\"name\\\":\\\"男\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:24:14', '1', '2018-04-27 18:24:14');
INSERT INTO `sys_event` VALUES ('29', null, null, '修改民族', '/nation', '\"{\\\"name\\\":\\\"侗族\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:24:25', '1', '2018-04-27 18:24:25');
INSERT INTO `sys_event` VALUES ('30', null, null, '修改政治面貌', '/politicalStatus', '\"{\\\"name\\\":\\\"共青团员\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:24:39', '1', '2018-04-27 18:24:39');
INSERT INTO `sys_event` VALUES ('31', null, null, '修改职称', '/professionalTitle', '\"{\\\"name\\\":\\\"职称\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:24:50', '1', '2018-04-27 18:24:50');
INSERT INTO `sys_event` VALUES ('32', null, null, '修改行政职务', '/administrativePost', '\"{\\\"name\\\":\\\"行政职务\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:25:01', '1', '2018-04-27 18:25:01');
INSERT INTO `sys_event` VALUES ('33', null, null, '修改高中类别', '/highSchoolCategory', '\"{\\\"name\\\":\\\"高中类别\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:25:12', '1', '2018-04-27 18:25:12');
INSERT INTO `sys_event` VALUES ('34', null, null, '修改出版社', '/publisher', '\"{\\\"name\\\":\\\"出版社\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:25:23', '1', '2018-04-27 18:25:23');
INSERT INTO `sys_event` VALUES ('35', null, null, '修改附件类型', '/attachmentType', '\"{\\\"name\\\":\\\"附件类型\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:25:33', '1', '2018-04-27 18:25:33');
INSERT INTO `sys_event` VALUES ('36', null, null, '修改课程类型', '/courseType', '\"{\\\"name\\\":\\\"课程类型\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '', '1', '1', '2018-04-27 18:26:22', '1', '2018-04-27 18:26:22');
INSERT INTO `sys_event` VALUES ('37', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 18:29:46', '1', '2018-04-27 18:29:46');
INSERT INTO `sys_event` VALUES ('38', null, null, '修改附件类型', '/attachmentType', '\"{\\\"name\\\":\\\"adwd\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:30:01', '1', '2018-04-27 18:30:01');
INSERT INTO `sys_event` VALUES ('39', null, null, '修改性别', '/gender', '\"{\\\"createBy\\\":\\\"1\\\",\\\"createTime\\\":\\\"2018-04-27 18:24:14\\\",\\\"enable\\\":\\\"1\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"男\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"2\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -882076611, id=1, name=男, spell=null, remark=null, Enable=1, createBy=1, createTime=Fri Apr 27 18:24:14 CST 2018, updateBy=1, updateTime=Fri Apr 27 18:24:14 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 18:24:14\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:44:07', '1', '2018-04-27 18:44:07');
INSERT INTO `sys_event` VALUES ('40', null, null, '修改民族', '/nation', '\"{\\\"createBy\\\":\\\"1\\\",\\\"createTime\\\":\\\"2018-04-27 18:24:25\\\",\\\"enable\\\":\\\"1\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"侗族\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"2\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = 1324526350, id=1, name=侗族, spell=null, remark=null, Enable=1, createBy=1, createTime=Fri Apr 27 18:24:25 CST 2018, updateBy=1, updateTime=Fri Apr 27 18:24:25 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 18:24:25\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:44:13', '1', '2018-04-27 18:44:13');
INSERT INTO `sys_event` VALUES ('41', null, null, '修改民族', '/nation', '\"{\\\"createBy\\\":\\\"1\\\",\\\"createTime\\\":\\\"2018-04-27 18:24:25\\\",\\\"enable\\\":0,\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"侗族\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"2\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -2081748817, id=1, name=侗族, spell=, remark=, Enable=1, createBy=1, createTime=Fri Apr 27 18:24:25 CST 2018, updateBy=1, updateTime=Fri Apr 27 18:44:13 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 18:44:13\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:44:17', '1', '2018-04-27 18:44:17');
INSERT INTO `sys_event` VALUES ('42', null, null, '修改民族', '/nation', '\"{\\\"createBy\\\":\\\"1\\\",\\\"createTime\\\":\\\"2018-04-27 18:24:25\\\",\\\"enable\\\":1,\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"侗族\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"2\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -2082668914, id=1, name=侗族, spell=, remark=, Enable=0, createBy=1, createTime=Fri Apr 27 18:24:25 CST 2018, updateBy=1, updateTime=Fri Apr 27 18:44:17 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 18:44:17\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:44:18', '1', '2018-04-27 18:44:18');
INSERT INTO `sys_event` VALUES ('43', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"321\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:44:38', '1', '2018-04-27 18:44:38');
INSERT INTO `sys_event` VALUES ('44', null, null, '修改附件类型', '/attachmentType', '\"{\\\"name\\\":\\\"123\\\",\\\"sortNo\\\":\\\"4\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:45:33', '1', '2018-04-27 18:45:33');
INSERT INTO `sys_event` VALUES ('45', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"123\\\",\\\"sortNo\\\":\\\"2\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 18:52:35', '1', '2018-04-27 18:52:35');
INSERT INTO `sys_event` VALUES ('46', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 19:20:59', '1', '2018-04-27 19:20:59');
INSERT INTO `sys_event` VALUES ('47', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"213\\\",\\\"startDate\\\":\\\"2018-09-08\\\",\\\"endDate\\\":\\\"2018-09-08\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:21:38', '1', '2018-04-27 19:21:38');
INSERT INTO `sys_event` VALUES ('48', null, null, '修改学期', '/semester', '\"{\\\"createBy\\\":\\\"1\\\",\\\"createTime\\\":\\\"2018-04-27 19:21:38\\\",\\\"enable\\\":\\\"1\\\",\\\"endDate\\\":\\\"\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"213\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"3\\\",\\\"spell\\\":\\\"\\\",\\\"startDate\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = 1598511556, id=1, name=213, spell=null, remark=null, Enable=1, createBy=1, createTime=Fri Apr 27 19:21:38 CST 2018, updateBy=1, updateTime=Fri Apr 27 19:21:38 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 19:21:38\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:22:19', '1', '2018-04-27 19:22:19');
INSERT INTO `sys_event` VALUES ('49', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"23\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:22:30', '1', '2018-04-27 19:22:30');
INSERT INTO `sys_event` VALUES ('50', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"123\\\",\\\"startDate\\\":\\\"2341\\\",\\\"endDate\\\":\\\"312\\\",\\\"sortNo\\\":\\\"4\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:22:46', '1', '2018-04-27 19:22:46');
INSERT INTO `sys_event` VALUES ('51', null, null, '修改学期', '/semester', '\"{\\\"name\\\":\\\"32\\\",\\\"startDate\\\":\\\"20870308\\\",\\\"endDate\\\":\\\"20870308\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:23:20', '1', '2018-04-27 19:23:20');
INSERT INTO `sys_event` VALUES ('52', null, null, '修改学期', '/semester', '\"{\\\"startDate\\\":\\\"29373721\\\",\\\"endDate\\\":\\\"32133213\\\",\\\"name\\\":\\\"2\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:24:10', '1', '2018-04-27 19:24:10');
INSERT INTO `sys_event` VALUES ('53', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 19:35:37', '1', '2018-04-27 19:35:37');
INSERT INTO `sys_event` VALUES ('54', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 19:36:44', '1', '2018-04-27 19:36:44');
INSERT INTO `sys_event` VALUES ('55', null, null, '修改附件类型', '/attachmentType', '\"{\\\"createTime\\\":\\\"2018-04-27 19:43:07\\\",\\\"enable\\\":\\\"1\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"阿德\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"1\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -1894702284, id=1, name=阿德韦迪, spell=null, remark=null, Enable=1, createBy=null, createTime=Fri Apr 27 19:43:07 CST 2018, updateBy=null, updateTime=Fri Apr 27 19:43:07 CST 2018\\\",\\\"updateTime\\\":\\\"2018-04-27 19:43:07\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:44:15', '1', '2018-04-27 19:44:15');
INSERT INTO `sys_event` VALUES ('56', null, null, '修改附件类型', '/attachmentType', '\"{\\\"createTime\\\":\\\"2018-04-27 19:43:07\\\",\\\"enable\\\":0,\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"阿德韦迪\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"1\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -1894702284, id=1, name=阿德韦迪, spell=null, remark=null, Enable=1, createBy=null, createTime=Fri Apr 27 19:43:07 CST 2018, updateBy=null, updateTime=Fri Apr 27 19:43:07 CST 2018\\\",\\\"updateTime\\\":\\\"2018-04-27 19:43:07\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:59:50', '1', '2018-04-27 19:59:50');
INSERT INTO `sys_event` VALUES ('57', null, null, '修改附件类型', '/attachmentType', '\"{\\\"createTime\\\":\\\"2018-04-27 19:43:07\\\",\\\"enable\\\":1,\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"阿德韦迪\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"1\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -1894702284, id=1, name=阿德韦迪, spell=null, remark=null, Enable=1, createBy=null, createTime=Fri Apr 27 19:43:07 CST 2018, updateBy=null, updateTime=Fri Apr 27 19:43:07 CST 2018\\\",\\\"updateTime\\\":\\\"2018-04-27 19:43:07\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 19:59:51', '1', '2018-04-27 19:59:51');
INSERT INTO `sys_event` VALUES ('58', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 20:04:59', '1', '2018-04-27 20:04:59');
INSERT INTO `sys_event` VALUES ('59', null, null, '修改附件类型', '/attachmentType', '\"{\\\"name\\\":\\\"123\\\",\\\"sortNo\\\":\\\"3\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 20:05:11', '1', '2018-04-27 20:05:11');
INSERT INTO `sys_event` VALUES ('60', null, null, '修改附件类型', '/attachmentType', '\"{\\\"name\\\":\\\"23\\\",\\\"sortNo\\\":\\\"1\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 20:34:43', '1', '2018-04-27 20:34:43');
INSERT INTO `sys_event` VALUES ('61', null, null, '修改附件类型', '/attachmentType', '\"{\\\"createTime\\\":\\\"2018-04-27 19:43:07\\\",\\\"enable\\\":\\\"1\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"阿德\\\\\\\\\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"1\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -1894702284, id=1, name=阿德韦迪, spell=null, remark=null, Enable=1, createBy=null, createTime=Fri Apr 27 19:43:07 CST 2018, updateBy=null, updateTime=Fri Apr 27 19:43:07 CST 2018\\\",\\\"updateTime\\\":\\\"2018-04-27 19:43:07\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 20:34:55', '1', '2018-04-27 20:34:55');
INSERT INTO `sys_event` VALUES ('62', null, null, '修改附件类型', '/attachmentType', '\"{\\\"createTime\\\":\\\"2018-04-27 19:43:07\\\",\\\"enable\\\":\\\"1\\\",\\\"id\\\":\\\"1\\\",\\\"keyword\\\":\\\"\\\",\\\"name\\\":\\\"阿德\\\",\\\"orderBy\\\":\\\"\\\",\\\"remark\\\":\\\"\\\",\\\"sortNo\\\":\\\"1\\\",\\\"spell\\\":\\\"\\\",\\\"subToString\\\":\\\" [Hash = -2002440037, id=1, name=阿德\\\\\\\\, spell=, remark=, Enable=1, createBy=null, createTime=Fri Apr 27 19:43:07 CST 2018, updateBy=1, updateTime=Fri Apr 27 20:34:55 CST 2018\\\",\\\"updateBy\\\":\\\"1\\\",\\\"updateTime\\\":\\\"2018-04-27 20:34:55\\\"}\"', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '', '1', '1', '2018-04-27 20:35:09', '1', '2018-04-27 20:35:09');
INSERT INTO `sys_event` VALUES ('63', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.5221.400 QQBrowser/10.0.1125.400', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 20:40:22', '1', '2018-04-27 20:40:22');
INSERT INTO `sys_event` VALUES ('64', null, null, '用户登录', '/login', '{}', 'POST', '192.168.1.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '200', '1', '[admin]登录成功.', '1', '1', '2018-04-27 20:42:39', '1', '2018-04-27 20:42:39');

-- ----------------------------
-- Table structure for `sys_lock`
-- ----------------------------
DROP TABLE IF EXISTS `sys_lock`;
CREATE TABLE `sys_lock` (
  `key_` varchar(128) NOT NULL,
  `name_` varchar(64) NOT NULL,
  `expire_` datetime NOT NULL,
  PRIMARY KEY (`key_`),
  KEY `expire_` (`expire_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lock
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `menu_type` smallint(2) DEFAULT '2' COMMENT '菜单类型(0:CURD;1:系统菜单;2:业务菜单;)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(254) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(254) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(254) DEFAULT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '1', '0', 'glyphicon glyphicon-cog', '#', '0', '1', 'sys', '1', '系统菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 08:19:19');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', null, '2', '1', 'glyphicon glyphicon-user', 'main.sys.user.list', '0', '1', 'sys.base.user', '1', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 08:38:35');
INSERT INTO `sys_menu` VALUES ('3', '部门管理', null, '2', '1', 'glyphicon glyphicon-flag', 'main.sys.dept.list', '0', '1', 'sys.base.dept', '2', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:43');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', null, '2', '1', 'glyphicon glyphicon-list', 'main.sys.menu.list', '0', '1', 'sys.base.menu', '3', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:45');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', null, '2', '1', 'glyphicon glyphicon-tags', 'main.sys.role.list', '0', '1', 'sys.base.role', '4', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:47');
INSERT INTO `sys_menu` VALUES ('6', '会话管理', null, '2', '1', 'glyphicon glyphicon-earphone', 'main.sys.session.list', '0', '1', 'sys.base.session', '6', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:49');
INSERT INTO `sys_menu` VALUES ('7', '字典管理', null, '2', '1', 'glyphicon glyphicon-book', 'main.sys.dic.list', '0', '1', 'sys.base.dic', '7', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:50');
INSERT INTO `sys_menu` VALUES ('8', '参数管理', null, '2', '1', 'glyphicon glyphicon-wrench', 'main.sys.param.list', '0', '1', 'sys.base.param', '8', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:52');
INSERT INTO `sys_menu` VALUES ('9', '调度中心', null, '1', '0', 'glyphicon glyphicon-fire', '#', '0', '1', 'sys.task', '2', '系统菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-30 14:23:57');
INSERT INTO `sys_menu` VALUES ('10', '调度管理', null, '2', '9', 'glyphicon glyphicon-random', 'main.task.scheduled.list', '0', '1', 'sys.task.scheduled', '3', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-30 14:24:02');
INSERT INTO `sys_menu` VALUES ('11', '调度日志', null, '2', '9', 'glyphicon glyphicon-file', 'main.task.log.list', '0', '1', 'sys.task.log', '4', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:08:48');
INSERT INTO `sys_menu` VALUES ('14', '清除缓存', null, '2', '1', null, null, '0', '0', 'sys.sys.cache', '9', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:25');
INSERT INTO `sys_menu` VALUES ('15', '用户权限', null, '2', '1', null, null, '0', '0', 'sys.permisson.roleMenu', '10', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:27');
INSERT INTO `sys_menu` VALUES ('16', '用户角色', null, '2', '1', null, null, '0', '0', 'sys.permisson.useRole', '11', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:29');
INSERT INTO `sys_menu` VALUES ('17', '角色权限', null, '2', '1', null, null, '0', '0', 'sys.permisson.userMenu', '12', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:33');
INSERT INTO `sys_menu` VALUES ('18', '单位管理', null, '2', '1', 'glyphicon glyphicon-flag', 'main.sys.unit.list', '0', '1', 'sys.base.unit', '2', '业务菜单', '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:43');
INSERT INTO `sys_menu` VALUES ('19', '组织管理', null, '1', '0', 'glyphicon glyphicon-cog', '#', '0', '1', 'sys.student', '3', '系统菜单', '1', '1', '2018-04-20 13:21:11', '1', '2018-04-20 13:21:11');
INSERT INTO `sys_menu` VALUES ('20', '学校管理', null, '2', '19', 'glyphicon glyphicon-list', 'main.student.school.list', '0', '1', 'sys.student.school', '1', '业务菜单', '1', '1', '2018-04-20 13:19:51', '1', '2018-04-20 13:19:51');
INSERT INTO `sys_menu` VALUES ('21', '学院管理', null, '2', '19', 'glyphicon glyphicon-list', 'main.student.college.list', '0', '1', 'sys.student.college', '2', '业务菜单', '1', '1', '2018-04-20 13:22:05', '1', '2018-04-20 13:22:05');
INSERT INTO `sys_menu` VALUES ('22', '专业管理', null, '2', '19', 'glyphicon glyphicon-list', 'main.student.specialty.list', '0', '1', 'sys.student.specialty', '3', '业务菜单', '1', '1', '2018-04-20 13:23:14', '1', '2018-04-20 13:23:14');
INSERT INTO `sys_menu` VALUES ('23', '班级管理', null, '2', '19', 'glyphicon glyphicon-list', 'main.student.class.list', '0', '1', 'sys.student.class', '4', '业务菜单', '1', '1', '2018-04-20 23:42:01', '1', '2018-04-20 23:42:03');
INSERT INTO `sys_menu` VALUES ('24', '地区中心', null, '1', '0', 'glyphicon glyphicon-fire', '#', '0', '1', 'sys.site', '4', '系统菜单', '1', '1', '2018-04-12 19:17:07', '1', '2018-04-12 19:17:07');
INSERT INTO `sys_menu` VALUES ('25', '省份管理', null, '2', '24', 'glyphicon glyphicon-list', 'main.site.province.list', '0', '1', 'sys.site.province', '1', '业务菜单', '1', '1', '2018-04-12 19:22:50', '1', '2018-04-12 19:22:50');
INSERT INTO `sys_menu` VALUES ('26', '市区管理', null, '2', '24', 'glyphicon glyphicon-list', 'main.site.city.list', '0', '1', 'sys.site.city', '2', '业务菜单', '1', '1', '2018-04-12 19:24:57', '1', '2018-04-12 19:24:57');
INSERT INTO `sys_menu` VALUES ('27', '区县管理', null, '2', '24', 'glyphicon glyphicon-list', 'main.site.county.list', '0', '1', 'sys.site.county', '3', '业务菜单', '1', '1', '2018-04-12 19:26:49', '1', '2018-04-12 19:26:49');
INSERT INTO `sys_menu` VALUES ('28', '乡镇管理', null, '2', '24', 'glyphicon glyphicon-list', 'main.site.town.list', '0', '1', 'sys.site.town', '4', '业务菜单', '1', '1', '2018-04-12 19:40:22', '1', '2018-04-12 19:40:22');
INSERT INTO `sys_menu` VALUES ('29', '信息管理', null, '1', '0', 'glyphicon glyphicon-cog', '#', '0', '1', 'sys.message', '1', '系统菜单', '1', '1', '2018-04-14 18:10:01', '1', '2018-04-14 18:10:07');
INSERT INTO `sys_menu` VALUES ('30', '性别管理', null, '2', '29', 'glyphicon glyphicon-user', 'main.message.gender.list', '0', '1', 'sys.message.gender', '1', '业务菜单', '1', '1', '2018-04-14 18:10:01', '1', '2018-04-14 18:10:07');
INSERT INTO `sys_menu` VALUES ('31', '民族管理', null, '2', '29', 'glyphicon glyphicon-user', 'main.message.nation.list', '0', '1', 'sys.message.nation', '2', '业务菜单', '1', '1', '2018-04-12 19:48:55', '1', '2018-04-12 19:49:07');
INSERT INTO `sys_menu` VALUES ('32', '政治面貌', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.politicalStatus.list', '0', '1', 'sys.message.politicalStatus', '3', '业务菜单', '1', '1', '2018-04-14 21:05:07', '1', '2018-04-14 21:05:14');
INSERT INTO `sys_menu` VALUES ('33', '职称管理', null, '2', '29', 'glyphicon glyphicon-user', 'main.message.professionalTitle.list', '0', '1', 'sys.message.professionalTitle', '4', '业务菜单', '1', '1', '2018-04-16 19:52:45', '1', '2018-04-16 19:52:51');
INSERT INTO `sys_menu` VALUES ('34', '行政职务', null, '2', '29', 'glyphicon glyphicon-user', 'main.message.administrativePost.list', '0', '1', 'sys.message.administrativePost', '5', '业务菜单', '1', '1', '2018-04-17 20:21:59', '1', '2018-04-17 18:18:26');
INSERT INTO `sys_menu` VALUES ('35', '高中类别', null, '2', '29', 'glyphicon glyphicon-wrench', 'main.message.highSchoolCategory.list', '0', '1', 'sys.message.highSchoolCategory', '6', '业务菜单', '1', '1', '2018-04-17 18:22:05', '1', '2018-04-17 18:22:10');
INSERT INTO `sys_menu` VALUES ('36', '考生类别', null, '2', '29', 'glyphicon glyphicon-earphone', 'main.message.examineeCategory.list', '0', '1', 'sys.message.examineeCategory', '7', '业务菜单', '1', '1', '2018-04-17 18:29:38', '1', '2018-04-17 18:29:46');
INSERT INTO `sys_menu` VALUES ('37', '历年分数线', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.ceeAnnualScore.list', '0', '1', 'sys.message.ceeAnnualScore', '14', '业务菜单', '1', '1', '2018-04-22 10:43:42', '1', '2018-04-22 10:43:47');
INSERT INTO `sys_menu` VALUES ('38', '批次', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.batch.list', '0', '1', 'sys.message.batch', '9', '业务菜单', '1', '1', '2018-04-22 10:45:22', '1', '2018-04-22 10:45:26');
INSERT INTO `sys_menu` VALUES ('39', '附件类型', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.attachmentType.list', '0', '1', 'sys.message.attachmentType', '10', '业务菜单', '1', '1', '2018-04-22 10:50:15', '1', '2018-04-22 10:50:24');
INSERT INTO `sys_menu` VALUES ('40', '课程类型', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.courseType.list', '0', '1', 'sys.message.courseType', '11', '业务菜单', '1', '1', '2018-04-22 14:46:09', '1', '2018-04-22 14:46:13');
INSERT INTO `sys_menu` VALUES ('41', '学期', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.semester.list', '0', '1', 'sys.message.semester', '12', '业务菜单', '1', '1', '2018-04-22 13:54:36', '1', '2018-04-22 13:54:41');
INSERT INTO `sys_menu` VALUES ('42', '出版社', null, '2', '29', 'glyphicon glyphicon-flag', 'main.message.publisher.list', '0', '1', 'sys.message.publisher', '8', '业务菜单', '1', '1', '2018-04-22 14:44:15', '1', '2018-04-22 14:44:21');

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `param_key` varchar(254) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(254) DEFAULT NULL COMMENT '参数键值',
  `catalog_id` bigint(20) DEFAULT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', null, '1', '1', '1', null, '1', '1', '2016-06-20 09:16:56', '1', '2017-01-29 10:11:20');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(254) NOT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', null, null, '1', '1', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:04');
INSERT INTO `sys_role_menu` VALUES ('2', null, null, '1', '2', 'add', '1', null, '1', '1', '2016-06-29 09:10:10', '1', '2016-06-29 09:10:10');
INSERT INTO `sys_role_menu` VALUES ('3', null, null, '1', '2', 'delete', '1', null, '1', '1', '2016-06-29 09:10:29', '1', '2016-06-29 09:10:29');
INSERT INTO `sys_role_menu` VALUES ('4', null, null, '1', '2', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:07');
INSERT INTO `sys_role_menu` VALUES ('5', null, null, '1', '2', 'update', '1', null, '1', '1', '2016-06-29 09:10:20', '1', '2016-06-29 09:10:20');
INSERT INTO `sys_role_menu` VALUES ('6', null, null, '1', '3', 'add', '1', null, '1', '1', '2016-06-29 09:10:50', '1', '2016-06-29 09:10:50');
INSERT INTO `sys_role_menu` VALUES ('7', null, null, '1', '3', 'delete', '1', null, '1', '1', '2016-06-29 09:11:18', '1', '2016-06-29 09:11:18');
INSERT INTO `sys_role_menu` VALUES ('8', null, null, '1', '3', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:08');
INSERT INTO `sys_role_menu` VALUES ('9', null, null, '1', '3', 'update', '1', null, '1', '1', '2016-06-29 09:11:01', '1', '2016-06-29 09:11:01');
INSERT INTO `sys_role_menu` VALUES ('10', null, null, '1', '4', 'add', '1', null, '1', '1', '2016-06-29 09:12:14', '1', '2016-06-29 09:12:14');
INSERT INTO `sys_role_menu` VALUES ('11', null, null, '1', '4', 'delete', '1', null, '1', '1', '2016-06-29 09:18:43', '1', '2016-06-29 09:18:43');
INSERT INTO `sys_role_menu` VALUES ('12', null, null, '1', '4', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:08');
INSERT INTO `sys_role_menu` VALUES ('13', null, null, '1', '4', 'update', '1', null, '1', '1', '2016-06-29 09:18:33', '1', '2016-06-29 09:18:33');
INSERT INTO `sys_role_menu` VALUES ('14', null, null, '1', '5', 'add', '1', null, '1', '1', '2016-06-29 09:19:00', '1', '2016-06-29 09:19:00');
INSERT INTO `sys_role_menu` VALUES ('15', null, null, '1', '5', 'delete', '1', null, '1', '1', '2016-06-29 09:19:24', '1', '2016-06-29 09:19:24');
INSERT INTO `sys_role_menu` VALUES ('16', null, null, '1', '5', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:09');
INSERT INTO `sys_role_menu` VALUES ('17', null, null, '1', '5', 'update', '1', null, '1', '1', '2016-06-29 09:19:10', '1', '2016-06-29 09:19:10');
INSERT INTO `sys_role_menu` VALUES ('18', null, null, '1', '6', 'delete', '1', null, '1', '1', '2016-06-29 09:19:35', '1', '2016-06-29 09:19:35');
INSERT INTO `sys_role_menu` VALUES ('19', null, null, '1', '6', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:09');
INSERT INTO `sys_role_menu` VALUES ('20', null, null, '1', '7', 'add', '1', null, '1', '1', '2016-06-29 09:19:58', '1', '2016-06-29 09:19:58');
INSERT INTO `sys_role_menu` VALUES ('21', null, null, '1', '7', 'delete', '1', null, '1', '1', '2016-06-29 09:20:18', '1', '2016-06-29 09:20:18');
INSERT INTO `sys_role_menu` VALUES ('22', null, null, '1', '7', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:10');
INSERT INTO `sys_role_menu` VALUES ('23', null, null, '1', '7', 'update', '1', null, '1', '1', '2016-06-29 09:20:08', '1', '2016-06-29 09:20:08');
INSERT INTO `sys_role_menu` VALUES ('24', null, null, '1', '8', 'add', '1', null, '1', '1', '2016-06-29 09:20:34', '1', '2016-06-29 09:20:34');
INSERT INTO `sys_role_menu` VALUES ('25', null, null, '1', '8', 'delete', '1', null, '1', '1', '2016-06-29 09:20:53', '1', '2016-06-29 09:20:53');
INSERT INTO `sys_role_menu` VALUES ('26', null, null, '1', '8', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:11');
INSERT INTO `sys_role_menu` VALUES ('27', null, null, '1', '8', 'update', '1', null, '1', '1', '2016-06-29 09:20:44', '1', '2016-06-29 09:20:44');
INSERT INTO `sys_role_menu` VALUES ('28', null, null, '1', '9', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:11');
INSERT INTO `sys_role_menu` VALUES ('29', null, null, '1', '10', 'add', '1', null, '1', '1', '2016-06-29 09:21:55', '1', '2016-06-29 09:21:55');
INSERT INTO `sys_role_menu` VALUES ('30', null, null, '1', '10', 'delete', '1', null, '1', '1', '2016-06-29 09:22:07', '1', '2016-06-29 09:22:32');
INSERT INTO `sys_role_menu` VALUES ('31', null, null, '1', '10', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('32', null, null, '1', '10', 'update', '1', null, '1', '1', '2016-06-29 09:22:49', '1', '2016-06-29 09:22:49');
INSERT INTO `sys_role_menu` VALUES ('33', null, null, '1', '10', 'close', '1', null, '1', '1', '2016-06-29 08:45:21', '1', '2016-06-29 08:45:21');
INSERT INTO `sys_role_menu` VALUES ('34', null, null, '1', '10', 'open', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('35', null, null, '1', '10', 'run', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('36', null, null, '1', '11', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('37', null, null, '1', '14', 'update', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:18');
INSERT INTO `sys_role_menu` VALUES ('38', null, null, '1', '15', 'update', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:33');
INSERT INTO `sys_role_menu` VALUES ('39', null, null, '1', '16', 'update', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:34');
INSERT INTO `sys_role_menu` VALUES ('40', null, null, '1', '17', 'update', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:35');
INSERT INTO `sys_role_menu` VALUES ('41', null, null, '1', '18', 'read', '1', null, '1', '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('42', null, null, '1', '19', 'read', '1', null, '1', '1', '2018-04-20 13:28:36', '1', '2018-04-20 13:28:36');
INSERT INTO `sys_role_menu` VALUES ('43', null, null, '1', '20', 'add', '1', null, '1', '1', '2018-04-20 13:28:52', '1', '2018-04-20 13:28:52');
INSERT INTO `sys_role_menu` VALUES ('44', null, null, '1', '20', 'delete', '1', null, '1', '1', '2018-04-20 13:29:08', '1', '2018-04-20 13:29:08');
INSERT INTO `sys_role_menu` VALUES ('45', null, null, '1', '20', 'read', '1', null, '1', '1', '2018-04-20 13:29:22', '1', '2018-04-20 13:29:22');
INSERT INTO `sys_role_menu` VALUES ('46', null, null, '1', '20', 'update', '1', null, '1', '1', '2018-04-20 13:29:42', '1', '2018-04-20 13:29:42');
INSERT INTO `sys_role_menu` VALUES ('47', null, null, '1', '21', 'add', '1', null, '1', '1', '2018-04-20 13:29:54', '1', '2018-04-20 13:29:54');
INSERT INTO `sys_role_menu` VALUES ('48', null, null, '1', '21', 'delete', '1', null, '1', '1', '2018-04-20 13:30:08', '1', '2018-04-20 13:30:08');
INSERT INTO `sys_role_menu` VALUES ('49', null, null, '1', '21', 'read', '1', null, '1', '1', '2018-04-20 13:30:22', '1', '2018-04-20 13:30:22');
INSERT INTO `sys_role_menu` VALUES ('50', null, null, '1', '21', 'update', '1', null, '1', '1', '2018-04-20 13:30:33', '1', '2018-04-20 13:30:33');
INSERT INTO `sys_role_menu` VALUES ('51', null, null, '1', '22', 'add', '1', null, '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('52', null, null, '1', '22', 'delete', '1', null, '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('53', null, null, '1', '22', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('54', null, null, '1', '22', 'update', '1', null, '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('55', '', '', '1', '23', 'add', '1', '', '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('56', '', '', '1', '23', 'delete', '1', '', '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('57', '', '', '1', '23', 'read', '1', '', '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('58', '', '', '1', '23', 'update', '1', '', '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('59', null, null, '1', '24', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('60', null, null, '1', '25', 'add', '1', null, '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('61', null, null, '1', '25', 'delete', '1', null, '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('62', null, null, '1', '25', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('63', null, null, '1', '25', 'update', '1', null, '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('64', null, null, '1', '26', 'add', '1', null, '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('65', null, null, '1', '26', 'delete', '1', null, '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('66', null, null, '1', '26', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('67', null, null, '1', '26', 'update', '1', null, '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('68', null, null, '1', '27', 'add', '1', null, '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('69', null, null, '1', '27', 'delete', '1', null, '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('70', null, null, '1', '27', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('71', null, null, '1', '27', 'update', '1', null, '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('72', null, null, '1', '28', 'add', '1', null, '1', '1', '2018-04-20 13:30:44', '1', '2018-04-20 13:30:44');
INSERT INTO `sys_role_menu` VALUES ('73', null, null, '1', '28', 'delete', '1', null, '1', '1', '2018-04-20 13:30:56', '1', '2018-04-20 13:30:56');
INSERT INTO `sys_role_menu` VALUES ('74', null, null, '1', '28', 'read', '1', null, '1', '1', '2018-04-20 13:31:07', '1', '2018-04-20 13:31:07');
INSERT INTO `sys_role_menu` VALUES ('75', null, null, '1', '28', 'update', '1', null, '1', '1', '2018-04-20 13:31:23', '1', '2018-04-20 13:31:23');
INSERT INTO `sys_role_menu` VALUES ('76', null, null, '1', '29', 'read', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('77', null, null, '1', '30', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('78', null, null, '1', '30', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('79', null, null, '1', '30', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('80', null, null, '1', '31', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('81', null, null, '1', '31', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('82', null, null, '1', '31', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('83', null, null, '1', '32', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('84', null, null, '1', '32', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('85', null, null, '1', '32', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('86', null, null, '1', '33', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('87', null, null, '1', '33', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('88', null, null, '1', '33', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('89', null, null, '1', '34', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('90', null, null, '1', '34', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('91', null, null, '1', '34', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('92', null, null, '1', '35', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('93', null, null, '1', '35', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('94', null, null, '1', '35', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('95', null, null, '1', '36', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('96', null, null, '1', '36', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('97', null, null, '1', '36', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('98', null, null, '1', '37', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('99', null, null, '1', '37', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('100', null, null, '1', '37', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('101', null, null, '1', '38', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('102', null, null, '1', '38', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('103', null, null, '1', '38', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('104', null, null, '1', '39', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('105', null, null, '1', '39', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('106', null, null, '1', '39', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('107', null, null, '1', '40', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('108', null, null, '1', '40', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('109', null, null, '1', '40', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('110', null, null, '1', '41', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('111', null, null, '1', '41', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('112', null, null, '1', '41', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');
INSERT INTO `sys_role_menu` VALUES ('113', null, null, '1', '42', 'read', '1', null, '1', '1', '2018-04-22 11:04:33', '1', '2018-04-22 11:04:37');
INSERT INTO `sys_role_menu` VALUES ('114', null, null, '1', '42', 'add', '1', null, '1', '1', '2018-04-22 11:04:50', '1', '2018-04-22 11:04:55');
INSERT INTO `sys_role_menu` VALUES ('115', null, null, '1', '42', 'update', '1', null, '1', '1', '2018-04-22 11:05:08', '1', '2018-04-22 11:05:13');

-- ----------------------------
-- Table structure for `sys_session`
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `session_id` varchar(254) DEFAULT NULL,
  `account_` varchar(254) DEFAULT NULL,
  `ip_` varchar(254) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='会话管理';

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES ('19', null, null, '6f5c5187-f354-4e14-9db0-2a6e73edb125', 'admin', '127.0.0.1', '2018-04-27 20:42:38', '1', null, '1', null, '2018-04-27 20:42:38', null, '2018-04-27 20:42:38');

-- ----------------------------
-- Table structure for `sys_unit`
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `principal_` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone_` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address_` varchar(256) DEFAULT NULL COMMENT '地址',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单位表';

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES ('1', 'sysPlat', null, '经理', '13945678911', '中国', '1', '', null, '1', '2017-01-12 00:00:00', '1', '2017-09-19 11:30:17');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `account_` varchar(20) DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(254) DEFAULT NULL COMMENT '密码',
  `user_type` varchar(2) DEFAULT '1' COMMENT '用户类型(1普通用户2管理员3系统用户)',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `sex_` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) DEFAULT NULL COMMENT '头像',
  `phone_` varchar(254) DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `wei_xin` varchar(32) DEFAULT NULL COMMENT '微信',
  `wei_bo` varchar(32) DEFAULT NULL COMMENT '微博',
  `qq_` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `birth_day` date DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `account` (`account_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'i/sV2VpTPy7Y+ppesmkCmM==', '3', '管理员', 'GUANLIYUAN', '0', 'http://118.190.43.148/group1/M00/00/00/dr4rlFjNBguAfJl7AAcOE67NTFk744.png', '15333821711', '12@12', null, null, null, null, '2017-01-27', '2', '213', null, null, '1', '1', '1', '1', '2016-05-06 10:06:52', '1', '2017-03-18 18:03:55');
INSERT INTO `sys_user` VALUES ('2', 'test', 'i/sV2VpTPy7Y+ppesmkCmM==', '1', 'admin', 'CESHIRENYUAN', '1', 'http://118.190.43.148/group1/M00/00/00/dr4rlFj3H0iATcqFAAv7S9z_iMg689.png', '12345678901', '123@163.com', null, null, null, null, '2017-02-01', '825363166504628224', '测试', '', null, '1', '1', '1', '1', '2016-05-13 16:58:17', '1', '2017-05-29 08:31:38');

-- ----------------------------
-- Table structure for `sys_user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(254) NOT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES ('1', null, null, '1', '1', 'read', '1', null, '1', '0', '2017-08-28 16:24:01', '0', '2017-08-28 16:24:01');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_IDrole_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', null, null, '1', '1', '1', null, '1', '1', '2016-06-16 15:59:56', '1', '2016-06-16 15:59:56');

-- ----------------------------
-- Table structure for `sys_user_thirdparty`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_thirdparty`;
CREATE TABLE `sys_user_thirdparty` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint(20) NOT NULL,
  `provider_` varchar(254) NOT NULL COMMENT '第三方类型',
  `open_id` varchar(254) NOT NULL COMMENT '第三方id',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_IDprovider_open_id` (`user_id`,`provider_`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户';

-- ----------------------------
-- Records of sys_user_thirdparty
-- ----------------------------

-- ----------------------------
-- Table structure for `task_fire_log`
-- ----------------------------
DROP TABLE IF EXISTS `task_fire_log`;
CREATE TABLE `task_fire_log` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `group_name` varchar(254) NOT NULL,
  `task_name` varchar(254) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_Time` datetime DEFAULT NULL,
  `status_` varchar(1) NOT NULL DEFAULT 'I',
  `server_host` varchar(254) DEFAULT NULL COMMENT '服务器名',
  `server_duid` varchar(254) DEFAULT NULL COMMENT '服务器网卡序列号',
  `fire_info` text,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `group_name_Task_name_start_time` (`group_name`,`task_name`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_fire_log
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id_` bigint(20) NOT NULL COMMENT '编号',
  `job_no` varchar(254) DEFAULT NULL COMMENT '工号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `type_` varchar(254) DEFAULT NULL COMMENT '教师类别（幼儿园教师、小学教师、初级中学教师、高级中学教师、中等职业学校教师、中等职业学校实习指导教师、高等学校教师）',
  `college_id` bigint(20) DEFAULT NULL COMMENT '学院编号',
  `entry_data` date DEFAULT NULL COMMENT '入职时间',
  `research_area` varchar(254) DEFAULT NULL COMMENT '研究方向',
  `gender_id` bigint(20) DEFAULT NULL COMMENT '性别编号',
  `nation_id` bigint(20) DEFAULT NULL COMMENT '民族编号',
  `political_status_id` bigint(20) DEFAULT NULL COMMENT '政治面貌编号',
  `certificate_type` varchar(254) DEFAULT NULL COMMENT '证件类型',
  `certificate_no` varchar(254) DEFAULT NULL COMMENT '证件号码',
  `birthday_` date DEFAULT NULL COMMENT '出生年月',
  `administrative_post_id` bigint(20) DEFAULT NULL COMMENT '行政职务编号',
  `professional_title_id` bigint(20) DEFAULT NULL COMMENT '专业职称编号',
  `is_external` tinyint(4) DEFAULT NULL COMMENT '是否外聘',
  `terminal_degree` varchar(254) DEFAULT NULL COMMENT '最终学位',
  `undergraduate_major` varchar(254) DEFAULT NULL COMMENT '本科专业',
  `gain_time_of_terminal_degree` date DEFAULT NULL COMMENT '最终学位获取时间',
  `gain_time_of_Undergraduate` date DEFAULT NULL COMMENT '本科专业学位获取时间',
  `bachelor_degree` varchar(254) DEFAULT NULL COMMENT '本科学位：哲学、经济学、法学、教育学、文学、历史学、理学、工学、农学、医学、管理学、艺术学、军事学',
  `is_master_tutor` tinyint(4) DEFAULT '0' COMMENT '是否硕士导师(true:是, false:否)',
  `is_study_abroad` tinyint(4) DEFAULT '0' COMMENT '是否海外留学(true:是, false:否)',
  `is_academician` tinyint(4) DEFAULT '0' COMMENT '是否院士(true:是, false:否)',
  `is_changjiang_scholar` tinyint(4) DEFAULT '0' COMMENT '是否长江学者(true:是, false:否)',
  `is_tOYP` tinyint(4) DEFAULT '0' COMMENT '是否杰青(true:是, false:否)',
  `is_province_tube_expert` tinyint(4) DEFAULT '0' COMMENT '是否省管专家(true:是, false:否)',
  `is_industry_experience` tinyint(4) DEFAULT '0' COMMENT '是否有行业经历(true:是, false:否)',
  `is_practice_train` tinyint(4) DEFAULT '0' COMMENT '是否有实践教学能力培训(true:是, false:否)',
  `other_honorary_title` varchar(254) DEFAULT NULL COMMENT '其他荣誉称号',
  `phone_` varchar(254) DEFAULT NULL COMMENT '电话',
  `email_` varchar(254) DEFAULT NULL COMMENT '电子邮箱',
  `individual_resume` varchar(10000) DEFAULT NULL COMMENT '个人简介',
  `head_img_id` bigint(20) DEFAULT NULL COMMENT '头像',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `teacher_index` (`id_`),
  KEY `teacher_jobnumber_index` (`job_no`),
  KEY `teacher_name_index` (`name_`),
  KEY `teacher_college_index` (`college_id`),
  KEY `fk_teacher_administrative_post_reference` (`administrative_post_id`),
  KEY `fk_teacher_attachment_reference` (`head_img_id`),
  KEY `fk_teacher_gender_reference` (`gender_id`),
  KEY `fk_teacher_nation_reference` (`nation_id`),
  KEY `fk_teacher_political_status_reference` (`political_status_id`),
  KEY `fk_teacher_professional_title_reference` (`professional_title_id`),
  CONSTRAINT `fk_teacher_administrative_post_reference` FOREIGN KEY (`administrative_post_id`) REFERENCES `administrative_post` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_attachment_reference` FOREIGN KEY (`head_img_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_college_reference` FOREIGN KEY (`college_id`) REFERENCES `college` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_gender_reference` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_nation_reference` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_political_status_reference` FOREIGN KEY (`political_status_id`) REFERENCES `political_status` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_professional_title_reference` FOREIGN KEY (`professional_title_id`) REFERENCES `professional_title` (`id_`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师';

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `text_book`
-- ----------------------------
DROP TABLE IF EXISTS `text_book`;
CREATE TABLE `text_book` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `chief_editor_id` bigint(20) DEFAULT NULL COMMENT '主编编号',
  `domain_` varchar(254) DEFAULT NULL COMMENT '领域',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '出版社编号',
  `introduction_` varchar(5000) DEFAULT NULL COMMENT '简介',
  `ISBN_` varchar(254) DEFAULT NULL COMMENT 'ISBN',
  `is_national_plan` tinyint(4) DEFAULT '0' COMMENT '默认：false否，true是',
  `award_situation` varchar(254) DEFAULT NULL COMMENT '获奖情况',
  `publish_date` datetime DEFAULT NULL COMMENT '出版日期',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `text_book_index` (`id_`),
  KEY `text_book_name_index` (`name_`),
  KEY `text_book_chiefEditor_index` (`chief_editor_id`),
  KEY `fk_text_book_attachment_reference` (`attachment_id`),
  KEY `fk_text_book_publisher_reference` (`publisher_id`),
  CONSTRAINT `fk_text_book_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_text_book_person_reference` FOREIGN KEY (`chief_editor_id`) REFERENCES `person` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_text_book_publisher_reference` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材';

-- ----------------------------
-- Records of text_book
-- ----------------------------

-- ----------------------------
-- Table structure for `text_book_person`
-- ----------------------------
DROP TABLE IF EXISTS `text_book_person`;
CREATE TABLE `text_book_person` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `text_book_id` bigint(20) NOT NULL COMMENT '教材编号',
  `person_id` bigint(20) NOT NULL COMMENT '人员编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `text_book_person_text_book_index` (`text_book_id`),
  KEY `text_book_person_person_index` (`person_id`),
  CONSTRAINT `fk_text_book_person_person_reference` FOREIGN KEY (`person_id`) REFERENCES `person` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_text_book_person_text_book_reference` FOREIGN KEY (`text_book_id`) REFERENCES `text_book` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材与人员（副主编）关联';

-- ----------------------------
-- Records of text_book_person
-- ----------------------------

-- ----------------------------
-- Table structure for `thesis`
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `journal_title` varchar(254) DEFAULT NULL COMMENT '期刊名称与会议名称二选一',
  `conference_name` varchar(254) DEFAULT NULL COMMENT '会议名称',
  `publication_year` datetime NOT NULL COMMENT '年份',
  `volume_` bigint(20) DEFAULT NULL COMMENT '卷',
  `no_` bigint(20) DEFAULT NULL COMMENT '期',
  `pages_` varchar(254) DEFAULT NULL COMMENT '起止页码',
  `type_id` bigint(20) NOT NULL COMMENT '类型编号',
  `accession_number` varchar(254) DEFAULT NULL COMMENT '索引号',
  `is_research_paper` tinyint(4) DEFAULT '0' COMMENT '(true:是, false:否)',
  `impact_Factor` float DEFAULT NULL COMMENT '影响因子（可选信息）',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  `recommend_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `thesis_index` (`id_`),
  KEY `thesis_name_index` (`name_`),
  KEY `thesis_type_index` (`type_id`),
  KEY `fk_thesis_attachment_reference` (`attachment_id`),
  CONSTRAINT `fk_thesis_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_thesis_thesis_type_reference` FOREIGN KEY (`type_id`) REFERENCES `thesis_type` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论文';

-- ----------------------------
-- Records of thesis
-- ----------------------------

-- ----------------------------
-- Table structure for `thesis_person`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_person`;
CREATE TABLE `thesis_person` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `thesis_id` bigint(20) NOT NULL COMMENT '论文编号',
  `person_id` bigint(20) NOT NULL COMMENT '人员编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `thesis_person_thesis_index` (`thesis_id`),
  KEY `thesis_person_person_index` (`person_id`),
  CONSTRAINT `fk_thesis_person_person_reference` FOREIGN KEY (`person_id`) REFERENCES `person` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_thesis_person_thesis_reference` FOREIGN KEY (`thesis_id`) REFERENCES `thesis` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论文与人员（作者）关联';

-- ----------------------------
-- Records of thesis_person
-- ----------------------------

-- ----------------------------
-- Table structure for `thesis_type`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_type`;
CREATE TABLE `thesis_type` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `thesis_type_index` (`id_`),
  KEY `thesis_type_name_index` (`name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用以表明论文的类型，比如：普通论文、科技核心、中文核心、ISTP、EI、SCI等';

-- ----------------------------
-- Records of thesis_type
-- ----------------------------

-- ----------------------------
-- Table structure for `third_rule_categories`
-- ----------------------------
DROP TABLE IF EXISTS `third_rule_categories`;
CREATE TABLE `third_rule_categories` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(5000) NOT NULL COMMENT '名称',
  `spell_` varchar(5000) DEFAULT NULL COMMENT '名称的全拼',
  `second_rule_id` bigint(20) NOT NULL COMMENT '二级目录编号',
  `total_score` int(11) DEFAULT NULL COMMENT '所占分值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `second_rule_categories_index` (`id_`),
  KEY `fk_thirdrule_secondrule_reference` (`second_rule_id`),
  KEY `fk_third_rule_categories_createByuser_reference` (`create_by`),
  KEY `fk_third_rule_categories_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_third_rule_categories_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_third_rule_categories_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_thirdrule_secondrule_reference` FOREIGN KEY (`second_rule_id`) REFERENCES `second_rule_categories` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分三级目录';

-- ----------------------------
-- Records of third_rule_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `top_rule_categories`
-- ----------------------------
DROP TABLE IF EXISTS `top_rule_categories`;
CREATE TABLE `top_rule_categories` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(5000) NOT NULL COMMENT '名称',
  `spell_` varchar(5000) DEFAULT NULL COMMENT '名称的全拼',
  `year_` int(11) NOT NULL COMMENT '年份',
  `total_score` int(11) DEFAULT NULL COMMENT '所占分值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `top_rule_categories_index` (`id_`),
  KEY `top_rule_categories_year_index` (`year_`),
  KEY `fk_top_rule_categories_createByuser_reference` (`create_by`),
  KEY `fk_top_rule_categories_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_top_rule_categories_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_top_rule_categories_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分一级目录';

-- ----------------------------
-- Records of top_rule_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `town`
-- ----------------------------
DROP TABLE IF EXISTS `town`;
CREATE TABLE `town` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `county_id` bigint(20) NOT NULL COMMENT '区县编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT NULL COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `town_index` (`id_`),
  KEY `town_name_index` (`name_`),
  KEY `town_county_index` (`county_id`),
  CONSTRAINT `fk_town_county_reference` FOREIGN KEY (`county_id`) REFERENCES `county` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='镇';

-- ----------------------------
-- Records of town
-- ----------------------------
INSERT INTO `town` VALUES ('1', '党武镇', '', '1', '1', '2018-04-24 18:14:33', '1', '2018-04-24 21:54:48', '1', '', '1');
INSERT INTO `town` VALUES ('2', '123', '', '2', '1', '2018-04-24 21:54:58', '1', '2018-04-24 21:55:02', '2', '', '1');

-- ----------------------------
-- Table structure for `treatises`
-- ----------------------------
DROP TABLE IF EXISTS `treatises`;
CREATE TABLE `treatises` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) NOT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者编号',
  `domain_` varchar(254) DEFAULT NULL COMMENT '领域',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '出版社编号',
  `introduction_` varchar(254) DEFAULT NULL COMMENT '简介',
  `ISBN_` varchar(254) DEFAULT NULL COMMENT 'ISBN',
  `publish_date` date DEFAULT NULL COMMENT '出版日期',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件文档',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `treatises_index` (`id_`),
  KEY `treatises_name_index` (`name_`),
  KEY `treatises_author_index` (`author_id`),
  KEY `fk_treatises_attachment_reference` (`attachment_id`),
  KEY `fk_treatises_publisher_reference` (`publisher_id`),
  CONSTRAINT `fk_treatises_attachment_reference` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_treatises_publisher_reference` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_treatises_teacher_reference` FOREIGN KEY (`author_id`) REFERENCES `teacher` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专著';

-- ----------------------------
-- Records of treatises
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `source_of_user` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户来源（0：学生、1：教师、2：专家）',
  `user_entity_id` bigint(20) NOT NULL COMMENT '用户实体编号',
  `login_name` varchar(254) DEFAULT NULL COMMENT '帐号',
  `password_` varchar(254) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt_` varchar(254) NOT NULL COMMENT '盐',
  `head_img_id` bigint(20) DEFAULT '0' COMMENT '头像',
  `phone_` varchar(254) DEFAULT NULL COMMENT '电话',
  `email_` varchar(254) DEFAULT NULL COMMENT '邮箱',
  `gender_id` bigint(20) DEFAULT NULL COMMENT '性别',
  `is_locked` tinyint(4) NOT NULL COMMENT '状态(true:正常, false:禁止)',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_index` (`id_`),
  KEY `user_name_index` (`name_`),
  KEY `user_userName_index` (`login_name`),
  KEY `user_entity_index` (`user_entity_id`),
  KEY `fk_userHeadImg_attachment_reference` (`head_img_id`),
  KEY `fk_user_teacher_reference` (`source_of_user`),
  CONSTRAINT `fk_userHeadImg_attachment_reference` FOREIGN KEY (`head_img_id`) REFERENCES `attachment` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_professor_reference` FOREIGN KEY (`source_of_user`) REFERENCES `professor` (`id_`),
  CONSTRAINT `fk_user_student_reference` FOREIGN KEY (`source_of_user`) REFERENCES `student` (`id_`),
  CONSTRAINT `fk_user_teacher_reference` FOREIGN KEY (`source_of_user`) REFERENCES `teacher` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort_no` int(11) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(254) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(4) DEFAULT '1' COMMENT '是否可用(true:是, false:否)',
  PRIMARY KEY (`id_`),
  KEY `user_role_user_index` (`user_id`),
  KEY `user_role_role_index` (`role_id`),
  KEY `fk_user_role_createByuser_reference` (`create_by`),
  KEY `fk_user_role_UpdateByuser_reference` (`update_by`),
  CONSTRAINT `fk_user_role_UpdateByuser_reference` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_createByuser_reference` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_role_reference` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_user_reference` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联';

-- ----------------------------
-- Records of user_role
-- ----------------------------
