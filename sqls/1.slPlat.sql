-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.10 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5143
-- --------------------------------------------------------
-- 导出 sysPlat 的数据库结构
DROP DATABASE IF EXISTS `slPlat`;
CREATE DATABASE IF NOT EXISTS `slPlat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `slPlat`;

-- 导出  表 sysPlat.sys_dept 结构
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `unit_id` bigint NOT NULL COMMENT '隶属单位',
  `parent_id` bigint DEFAULT NULL COMMENT '上级部门编号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门';

INSERT INTO `sys_dept` (`id_`, `unit_id`, `name_`, `parent_id`, `sort_no`, `leaf_`, `enable_`, `remark_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 1, 'sysPlat', 0, 1, 0, 1, 'qw', 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:06'),
	(2, 1, '市场部', 1, 1, 1, 1, 't', 0, '2016-06-28 18:04:06', 0, '2016-06-28 18:04:06'),
	(825363166504628224, 1, '技术部', 1, 2, NULL, NULL, '', 1, '2017-01-28 23:21:28', 1, '2017-05-29 08:15:29');


-- 导出  表 sysPlat.sys_dic 结构
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE IF NOT EXISTS `sys_dic` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `type_Code` (`type_`,`code_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

INSERT INTO `sys_dic` (`id_`, `type_`, `code_`, `code_text`, `parent_type`, `parent_code`, `sort_no`, `editable_`, `enable_`, `remark_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 'SEX', '0', '未知', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:13'),
	(2, 'SEX', '1', '男', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:12'),
	(3, 'SEX', '2', '女', NULL, NULL, 3, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:11'),
	(4, 'LOCKED', '0', '激活', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:11'),
	(5, 'LOCKED', '1', '锁定', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:10'),
	(6, 'ROLETYPE', '1', '业务角色', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:09'),
	(7, 'ROLETYPE', '2', '管理角色', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:09'),
	(8, 'ROLETYPE', '3', '系统内置角色', NULL, NULL, 3, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:08'),
	(9, 'LEAF', '0', '树枝节点', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:07'),
	(10, 'LEAF', '1', '叶子节点', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:07'),
	(11, 'EDITABLE', '0', '只读', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:06'),
	(12, 'EDITABLE', '1', '可编辑', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:06'),
	(13, 'is_Enable', '0', '禁用', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:05'),
	(14, 'is_Enable', '1', '启用', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:04'),
	(15, 'AUTHORIZELEVEL', '1', '访问权限', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:03'),
	(16, 'AUTHORIZELEVEL', '2', '管理权限', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:02'),
	(17, 'MENUTYPE', '1', '系统菜单', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:03'),
	(18, 'MENUTYPE', '2', '业务菜单', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01'),
	(19, 'USERTYPE', '1', '经办员', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:50'),
	(20, 'USERTYPE', '2', '管理员', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:48'),
	(21, 'USERTYPE', '3', '系统内置用户', NULL, NULL, 3, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:47'),
	(22, 'EXPAND', '0', '收缩', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:47'),
	(23, 'EXPAND', '1', '展开', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:46'),
	(24, 'CRUD', 'add', '新增', NULL, NULL, 1, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:56'),
	(25, 'CRUD', 'read', '查询', NULL, NULL, 2, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:58'),
	(26, 'CRUD', 'update', '修改', NULL, NULL, 3, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:59'),
	(27, 'CRUD', 'delete', '删除', NULL, NULL, 4, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:59'),
	(28, 'CRUD', 'open', '打开', NULL, NULL, 5, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:00'),
	(29, 'CRUD', 'close', '关闭', NULL, NULL, 6, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01'),
	(30, 'CRUD', 'run', '执行', NULL, NULL, 7, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01');


-- 导出  表 sysPlat.sys_email 结构
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE IF NOT EXISTS `sys_email` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `sender_` varchar(32) NOT NULL COMMENT '使用发送',
  `email_Title` varchar(256) NOT NULL COMMENT '发送标题',
  `email_Content` text NOT NULL COMMENT '发送内容',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件表';


INSERT INTO `sys_email` (`id_`, `name_`, `sender_`, `email_Title`, `email_Content`, `remark_`, `enable_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 'test', 't', 'a', '并蒂芙蓉', NULL, 1, 1, '2017-02-02 16:37:54', 1, '2017-02-02 16:37:54');


-- 导出  表 sysPlat.sys_email_config 结构
DROP TABLE IF EXISTS `sys_email_config`;
CREATE TABLE IF NOT EXISTS `sys_email_config` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件配置表';


INSERT INTO `sys_email_Config` (`id_`, `smtp_host`, `smtp_port`, `send_method`, `sender_name`, `sender_account`, `sender_password`, `remark_`, `enable_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(828157583909109760, 'smtp.163.com', '101', '0', 'sysPlat', 'sysPlat@163.com', 'BK5sgjz5JOOsFuD4w0mbe7==', NULL, 1, 1, '2017-02-05 16:25:29', 1, '2017-02-05 16:37:50');


-- 导出  表 sysPlat.sys_email_template 结构
DROP TABLE IF EXISTS `sys_email_template`;
CREATE TABLE IF NOT EXISTS `sys_email_template` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `email_account` varchar(32) DEFAULT NULL COMMENT '发送邮件帐号',
  `title_` varchar(512) DEFAULT NULL COMMENT '标题模版',
  `template_` text COMMENT '内容模板',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模版表';


-- 导出  表 sysPlat.sys_event 结构
DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE IF NOT EXISTS `sys_event` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 导出  表 sysPlat.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `menu_type` smallint(2) DEFAULT '2' COMMENT '菜单类型(0:CURD;1:系统菜单;2:业务菜单;)',
  `parent_id` bigint DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(254) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(254) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(254) DEFAULT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';


-- 导出  表 sysPlat.sys_param 结构
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE IF NOT EXISTS `sys_param` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `param_key` varchar(254) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(254) DEFAULT NULL COMMENT '参数键值',
  `catalog_id` bigint DEFAULT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局参数表';


-- 导出  表 sysPlat.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `dept_id` bigint DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';


INSERT INTO `sys_role` (`id_`, `name_`, `dept_id`, `role_type`, `enable_`, `remark_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, '管理员', 1, 1, 1, NULL, 1, '2016-06-20 09:16:56', 1, '2017-01-29 10:11:20');


-- 导出  表 sysPlat.sys_role_menu 结构
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `permission_` varchar(254) NOT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- 导出  表 sysPlat.sys_session 结构
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE IF NOT EXISTS `sys_session` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `session_id` varchar(254) DEFAULT NULL,
  `account_` varchar(254) DEFAULT NULL,
  `ip_` varchar(254) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话管理';


-- 导出  表 sysPlat.sys_unit 结构
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE IF NOT EXISTS `sys_unit` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `principal_` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone_` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address_` varchar(256) DEFAULT NULL COMMENT '地址',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位表';

INSERT INTO `sys_unit` (`id_`, `name_`, `principal_`, `phone_`, `address_`, `sort_no`, `enable_`, `remark_`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
	(1, 'sysPlat', '经理', '13945678911', '中国', 1, NULL, '', '2017-01-12 00:00:00', 1, '2017-09-19 11:30:17', 1);


-- 导出  表 sysPlat.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `dept_id` bigint DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `account` (`account_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';


INSERT INTO `sys_user` (`id_`, `account_`, `password_`, `user_type`, `name_`, `spell_`, `sex_`, `avatar_`, `phone_`, `email_`, `id_card`, `wei_xin`, `wei_bo`, `qq_`, `birth_day`, `dept_id`, `position_`, `address_`, `staff_no`, `enable_`, `remark_`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
	(1, 'admin', 'i/sV2VpTPy7Y+ppesmkCmM==', '3', '管理员', 'GUANLIYUAN', 0, 'http://118.190.43.148/group1/M00/00/00/dr4rlFjNBguAfJl7AAcOE67NTFk744.png', '15333821711', '12@12', NULL, NULL, NULL, NULL, '2017-01-27', 2, '213', NULL, NULL, 1, '1', '2016-05-06 10:06:52', 1, '2017-03-18 18:03:55', 1),
	(2, 'test', 'i/sV2VpTPy7Y+ppesmkCmM==', '1', 'admin', 'CESHIRENYUAN', 1, 'http://118.190.43.148/group1/M00/00/00/dr4rlFj3H0iATcqFAAv7S9z_iMg689.png', '12345678901', '123@163.com', NULL, NULL, NULL, NULL, '2017-02-01', 825363166504628224, '测试', '', NULL, 1, '1', '2016-05-13 16:58:17', 1, '2017-05-29 08:31:38', 1);

-- 导出  表 sysPlat.sys_user_menu 结构
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE IF NOT EXISTS `sys_user_menu` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `permission_` varchar(254) NOT NULL COMMENT '权限标识',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';


INSERT INTO `sys_user_menu` (`id_`, `user_id`, `menu_id`, `permission_`, `enable_`, `remark_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 1, 1, 'read', 1, NULL, 0, '2017-08-28 16:24:01', 0, '2017-08-28 16:24:01');


-- 导出  表 sysPlat.sys_user_role 结构
DROP TABLE IF EXISTS `sys_user_role`; 
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_IDrole_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';


INSERT INTO `sys_user_role` (`id_`, `user_id`, `role_id`, `enable_`, `remark_`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 1, 1, 1, NULL, 1, '2016-06-16 15:59:56', 1, '2016-06-16 15:59:56');


-- 导出  表 sysPlat.sys_user_Thirdparty 结构
DROP TABLE IF EXISTS `sys_user_Thirdparty`;
CREATE TABLE IF NOT EXISTS `sys_user_Thirdparty` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name_` varchar(254) DEFAULT NULL COMMENT '名称',
  `spell_` varchar(254) DEFAULT NULL COMMENT '名称的全拼',
  `user_id` bigint NOT NULL,
  `provider_` varchar(254) NOT NULL COMMENT '第三方类型',
  `open_id` varchar(254) NOT NULL COMMENT '第三方id',
  `sort_no` int(3) DEFAULT '1' COMMENT '排序',
  `remark_` varchar(5000) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1' COMMENT '是否可用(1:是, 0:否)',
  `create_by` bigint NOT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_IDprovider_open_id` (`user_id`,`provider_`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户';


-- 导出  表 sysPlat.task_fire_log 结构
DROP TABLE IF EXISTS `task_fire_log`;
CREATE TABLE IF NOT EXISTS `task_fire_log` (
  `id_` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_by` bigint DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `group_name_Task_name_start_time` (`group_name`,`task_name`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 系统资源锁定表
DROP TABLE IF EXISTS `sys_lock`;
CREATE TABLE `sys_lock` (
  `key_` varchar(128) NOT NULL,
  `name_` varchar(64) NOT NULL,
  `expire_` datetime NOT NULL,
  PRIMARY KEY (`key_`),
  KEY `expire_` (`expire_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
