/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50717
Source Host           : 120.77.151.83:3306
Source Database       : geek_cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-03 00:34:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_attr_group`;
CREATE TABLE `sys_attr_group` (
  `attr_group_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '属性组Id',
  `group_name` varchar(128) DEFAULT NULL COMMENT '属性名称',
  `group_code` varchar(128) DEFAULT NULL COMMENT '附件名称',
  `group_desc` varchar(256) DEFAULT NULL COMMENT '业务类主键',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`attr_group_id`),
  KEY `inx_attr_group_code` (`group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='属性组表';

-- ----------------------------
-- Records of sys_attr_group
-- ----------------------------
INSERT INTO `sys_attr_group` VALUES ('1', '配件仓库', 'part.stock.storagelist', '配件仓库', null, null, null, null, '0');
INSERT INTO `sys_attr_group` VALUES ('2', '配送方式', 'sender.typelist', '配送方式', null, null, null, null, '0');

-- ----------------------------
-- Table structure for sys_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_attr_value`;
CREATE TABLE `sys_attr_value` (
  `attr_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attr_group_id` int(50) DEFAULT NULL COMMENT '属性组Id',
  `attr_code` varchar(128) DEFAULT NULL COMMENT '属性名称',
  `attr_value` varchar(256) DEFAULT NULL COMMENT '属性值',
  `attr_order` int(11) DEFAULT NULL COMMENT '属性顺序',
  `attr_desc` varchar(256) DEFAULT NULL COMMENT '属性描述',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`attr_id`),
  KEY `idx_attr_group_id` (`attr_group_id`),
  KEY `idx_attr_code` (`attr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Records of sys_attr_value
-- ----------------------------
INSERT INTO `sys_attr_value` VALUES ('1', '1', 'sys_code', '北京通州仓库', '1', '北京通州仓库', null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('2', '1', 'sys_code', '北京顺义库', '2', '北京顺义库', null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('3', '2', 'sss', '自提', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('4', '2', null, '快递', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('5', '2', null, '配送', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('6', '1', 'sys.attr', '大兴库房', '2', '北京市海淀区', '1', '2017-08-13 20:35:08', '1', '2017-08-13 20:38:34', '0');
INSERT INTO `sys_attr_value` VALUES ('7', '1', 'AA', '海淀仓库', '3', 'xxxxx', '1', '2017-09-24 12:19:05', '1', '2017-09-24 12:19:05', '0');

-- ----------------------------
-- Table structure for sys_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_rule`;
CREATE TABLE `sys_data_rule` (
  `data_rule_id` int(96) NOT NULL AUTO_INCREMENT COMMENT '数据权限规则ID',
  `rule_name` varchar(96) DEFAULT NULL COMMENT '数据权限规则名称',
  `rule_column` varchar(300) DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(300) DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) DEFAULT NULL COMMENT '规则值',
  `function_Id` varchar(96) DEFAULT NULL COMMENT '菜单ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`data_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限规则表';

-- ----------------------------
-- Records of sys_data_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门主键',
  `depart_name` varchar(100) NOT NULL COMMENT '部门名称',
  `parent_depart_id` varchar(32) DEFAULT NULL COMMENT '父部门ID',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `depart_level` int(11) DEFAULT NULL COMMENT '部门级别',
  `depart_order` int(5) DEFAULT '0' COMMENT '排序',
  `description` longtext COMMENT '描述',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) NOT NULL COMMENT '传真',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('1', '管理员', '-1', null, null, '0', null, null, '1', '1', '2017-05-30 09:48:19', null, null, '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `file_dir` varchar(256) DEFAULT NULL COMMENT '存储目录',
  `file_alias` varchar(128) DEFAULT NULL COMMENT '文件别名',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小,byte',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `app_id` int(11) DEFAULT NULL COMMENT '应用Id',
  `app_type` varchar(32) DEFAULT NULL COMMENT '应用类型 contract-合同文件',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(11) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='文件存储表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', 'customertmp.xls', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'customertmp.xls20170713225115', '23552', '.xls', null, null, '2017-07-13 22:51:15', '1', null, '2017-07-13 22:51:15', '0');
INSERT INTO `sys_file` VALUES ('2', 'customertmp.xlsx', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'customertmp.xlsx20170713225211', '9009', '.xlsx', null, null, '2017-07-13 22:52:28', '1', null, '2017-07-13 22:52:28', '0');
INSERT INTO `sys_file` VALUES ('3', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713225717', '22258', '.js', null, null, '2017-07-13 22:57:19', '1', null, '2017-07-13 22:57:19', '0');
INSERT INTO `sys_file` VALUES ('4', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713225749', '22258', '.js', null, null, '2017-07-13 22:57:48', '1', null, '2017-07-13 22:57:48', '0');
INSERT INTO `sys_file` VALUES ('5', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713230124', '22258', '.js', null, null, '2017-07-13 23:01:23', '1', null, '2017-07-13 23:01:23', '0');
INSERT INTO `sys_file` VALUES ('6', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230305', '18805', '.txt', null, null, '2017-07-13 23:03:04', '1', null, '2017-07-13 23:03:04', '0');
INSERT INTO `sys_file` VALUES ('7', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230356', '18805', '.txt', null, null, '2017-07-13 23:03:55', '1', null, '2017-07-13 23:03:55', '0');
INSERT INTO `sys_file` VALUES ('8', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230506', '18805', '.txt', null, null, '2017-07-13 23:05:05', '1', null, '2017-07-13 23:05:05', '0');
INSERT INTO `sys_file` VALUES ('9', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230516', '18805', '.txt', null, null, '2017-07-13 23:05:15', '1', null, '2017-07-13 23:05:15', '0');
INSERT INTO `sys_file` VALUES ('10', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230552', '18805', '.txt', null, null, '2017-07-13 23:05:51', '1', null, '2017-07-13 23:05:51', '0');
INSERT INTO `sys_file` VALUES ('11', '1.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '1.txt20170713230623', '171', '.txt', null, null, '2017-07-13 23:06:22', '1', null, '2017-07-13 23:06:22', '0');
INSERT INTO `sys_file` VALUES ('12', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713230714', '22258', '.js', null, null, '2017-07-13 23:07:14', '1', null, '2017-07-13 23:07:14', '0');
INSERT INTO `sys_file` VALUES ('13', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713230937', '18805', '.txt', null, null, '2017-07-13 23:09:36', '1', null, '2017-07-13 23:09:36', '0');
INSERT INTO `sys_file` VALUES ('14', 'customertmp.xlsx', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'customertmp.xlsx20170713230941', '9009', '.xlsx', null, null, '2017-07-13 23:09:40', '1', null, '2017-07-13 23:09:40', '0');
INSERT INTO `sys_file` VALUES ('15', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713231013', '18805', '.txt', null, null, '2017-07-13 23:10:12', '1', null, '2017-07-13 23:10:12', '0');
INSERT INTO `sys_file` VALUES ('16', '2017051517_jdw_addchildren.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '2017051517_jdw_addchildren.txt20170713231015', '2877', '.txt', null, null, '2017-07-13 23:10:14', '1', null, '2017-07-13 23:10:14', '0');
INSERT INTO `sys_file` VALUES ('17', 'customertmp.xlsx', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'customertmp.xlsx20170713231022', '9009', '.xlsx', null, null, '2017-07-13 23:10:21', '1', null, '2017-07-13 23:10:21', '0');
INSERT INTO `sys_file` VALUES ('18', 'default.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'default.txt20170713231024', '21700', '.txt', null, null, '2017-07-13 23:10:23', '1', null, '2017-07-13 23:10:23', '0');
INSERT INTO `sys_file` VALUES ('19', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713231340', '22258', '.js', null, null, '2017-07-13 23:13:40', '1', null, '2017-07-13 23:13:40', '0');
INSERT INTO `sys_file` VALUES ('20', 'customertmp.xls', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'customertmp.xls20170713231347', '23552', '.xls', null, null, '2017-07-13 23:13:46', '1', null, '2017-07-13 23:13:46', '0');
INSERT INTO `sys_file` VALUES ('21', 'es.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'es.txt20170713231349', '2612', '.txt', null, null, '2017-07-13 23:13:48', '1', null, '2017-07-13 23:13:48', '0');
INSERT INTO `sys_file` VALUES ('22', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713231454', '18805', '.txt', null, null, '2017-07-13 23:14:53', '1', null, '2017-07-13 23:14:53', '0');
INSERT INTO `sys_file` VALUES ('23', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713232344', '22258', '.js', null, null, '2017-07-13 23:23:43', '1', null, '2017-07-13 23:23:43', '0');
INSERT INTO `sys_file` VALUES ('24', 'cap.common.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.common.js20170713232347', '61114', '.js', null, null, '2017-07-13 23:23:46', '1', null, '2017-07-13 23:23:46', '0');
INSERT INTO `sys_file` VALUES ('25', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713232434', '22258', '.js', null, null, '2017-07-13 23:24:34', '1', null, '2017-07-13 23:24:34', '0');
INSERT INTO `sys_file` VALUES ('26', '2017051517_jdw_addchildren.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '2017051517_jdw_addchildren.txt20170713232524', '2877', '.txt', null, null, '2017-07-13 23:25:23', '1', null, '2017-07-13 23:25:23', '0');
INSERT INTO `sys_file` VALUES ('27', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713232641', '22258', '.js', null, null, '2017-07-13 23:26:41', '1', null, '2017-07-13 23:26:41', '0');
INSERT INTO `sys_file` VALUES ('28', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713232857', '18805', '.txt', null, null, '2017-07-13 23:28:56', '1', null, '2017-07-13 23:28:56', '0');
INSERT INTO `sys_file` VALUES ('29', 'cap.apply.js', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'cap.apply.js20170713232946', '22258', '.js', null, null, '2017-07-13 23:29:46', '1', null, '2017-07-13 23:29:46', '0');
INSERT INTO `sys_file` VALUES ('30', '20170515_druid_children.txt', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', '20170515_druid_children.txt20170713233025', '18805', '.txt', null, null, '2017-07-13 23:30:24', '1', null, '2017-07-13 23:30:24', '0');
INSERT INTO `sys_file` VALUES ('31', 'auto_test.sql', 'D:\\workspace\\my-wp\\fusheng\\xjkp\\xjkp\\fusheng\\code\\geek-cms\\target\\geek-cms\\\\upload\\null\\', 'auto_test.sql20170713233312', '8027', '.sql', null, null, '2017-07-13 23:33:11', '1', null, '2017-07-13 23:33:11', '0');
INSERT INTO `sys_file` VALUES ('32', 'auto_test.sql', 'upload\\app\\', 'auto_test.sql20170713234030', '8027', '.sql', null, 'app', '2017-07-13 23:40:29', '1', null, '2017-07-13 23:40:29', '0');
INSERT INTO `sys_file` VALUES ('33', 'cap.apply.js', 'upload\\app\\', 'cap.apply.js20170713234115', '22258', '.js', null, 'app', '2017-07-13 23:41:14', '1', null, '2017-07-13 23:41:14', '0');
INSERT INTO `sys_file` VALUES ('34', 'cap.apply.js', 'upload\\app\\', 'cap.apply.js20170713234457', '22258', '.js', null, 'app', '2017-07-13 23:44:56', '1', null, '2017-07-13 23:44:56', '0');
INSERT INTO `sys_file` VALUES ('35', 'cap.apply.js', 'upload\\app\\', 'cap.apply.js20170713234740', '22258', '.js', null, 'app', '2017-07-13 23:47:39', '1', null, '2017-07-13 23:47:39', '0');
INSERT INTO `sys_file` VALUES ('36', 'customertmp.xls', 'upload\\app\\', 'customertmp.xls20170713234825', '23552', '.xls', null, 'app', '2017-07-13 23:48:25', '1', null, '2017-07-13 23:48:25', '0');
INSERT INTO `sys_file` VALUES ('37', '20170515_druid_children.txt', 'upload\\app\\', '20170515_druid_children.txt20170713234906', '18805', '.txt', null, 'app', '2017-07-13 23:49:05', '1', null, '2017-07-13 23:49:05', '0');
INSERT INTO `sys_file` VALUES ('38', 'cap.apply.js', 'upload\\app\\', 'cap.apply.js20170713234951', '22258', '.js', null, 'app', '2017-07-13 23:49:51', '1', null, '2017-07-13 23:49:51', '0');
INSERT INTO `sys_file` VALUES ('39', 'customertmp.xls', 'upload\\app\\', 'customertmp.xls20170713235046', '23552', '.xls', null, 'app', '2017-07-13 23:50:45', '1', null, '2017-07-13 23:50:45', '0');
INSERT INTO `sys_file` VALUES ('40', 'eclipse.exe', 'upload\\app\\', 'eclipse.exe20170713235048', '312320', '.exe', null, 'app', '2017-07-13 23:50:50', '1', null, '2017-07-13 23:50:50', '0');
INSERT INTO `sys_file` VALUES ('41', 'apache-storm-0.9.1-incubating.zip', 'upload\\app\\', 'apache-storm-0.9.1-incubating.zip20170713235058', '15544397', '.zip', null, 'app', '2017-07-13 23:53:17', '1', null, '2017-07-13 23:53:17', '0');
INSERT INTO `sys_file` VALUES ('42', 'readme.txt', 'upload\\app\\', 'readme.txt20170713235515', '361', '.txt', null, 'app', '2017-07-13 23:55:14', '1', null, '2017-07-13 23:55:14', '0');
INSERT INTO `sys_file` VALUES ('43', 'readme.txt', 'upload\\app\\', 'readme.txt20170713235628', '361', '.txt', null, 'app', '2017-07-13 23:56:27', '1', null, '2017-07-13 23:56:27', '0');
INSERT INTO `sys_file` VALUES ('44', 'license.txt', 'upload\\app\\', 'license.txt20170713235747', '37854', '.txt', null, 'app', '2017-07-13 23:57:46', '1', null, '2017-07-13 23:57:46', '0');
INSERT INTO `sys_file` VALUES ('45', 'license.txt', 'upload\\app\\', 'license.txt20170713235819', '37854', '.txt', null, 'app', '2017-07-13 23:58:18', '1', null, '2017-07-13 23:58:18', '0');
INSERT INTO `sys_file` VALUES ('46', 'dubbo-admin.rar', 'upload\\app\\', 'dubbo-admin.rar20170713235458', '26489721', '.rar', null, 'app', '2017-07-13 23:58:33', '1', null, '2017-07-13 23:58:33', '0');
INSERT INTO `sys_file` VALUES ('47', 'readme.txt', 'upload\\app\\', 'readme.txt20170714000212', '361', '.txt', null, 'app', '2017-07-14 00:02:11', '1', null, '2017-07-14 00:02:11', '0');
INSERT INTO `sys_file` VALUES ('48', 'readme.txt', 'upload\\app\\', 'readme.txt20170714000351', '361', '.txt', null, 'app', '2017-07-14 00:03:50', '1', null, '2017-07-14 00:03:50', '0');
INSERT INTO `sys_file` VALUES ('49', 'license.txt', 'upload\\app\\', 'license.txt20170714000416', '37854', '.txt', null, 'app', '2017-07-14 00:04:15', '1', null, '2017-07-14 00:04:15', '0');
INSERT INTO `sys_file` VALUES ('50', 'Readme-说明.html', 'upload\\app\\', 'Readme-说明.html20170714000423', '777', '.html', null, 'app', '2017-07-14 00:04:22', '1', null, '2017-07-14 00:04:22', '0');
INSERT INTO `sys_file` VALUES ('51', 'readme.txt', 'upload\\app\\', 'readme.txt20170714000433', '361', '.txt', null, 'app', '2017-07-14 00:04:33', '1', null, '2017-07-14 00:04:33', '0');
INSERT INTO `sys_file` VALUES ('52', 'settings.xml', 'upload\\app\\', 'settings.xml20170714000502', '3247', '.xml', null, 'app', '2017-07-14 00:05:01', '1', null, '2017-07-14 00:05:01', '0');
INSERT INTO `sys_file` VALUES ('53', 'settings.xml', 'upload\\app\\', 'settings.xml20170714000635', '3247', null, null, 'app', '2017-07-14 00:06:34', '1', null, '2017-07-14 00:06:34', '0');
INSERT INTO `sys_file` VALUES ('54', 'settings.xml', 'upload\\app\\', 'settings.xml20170714000700', '3247', null, null, 'app', '2017-07-14 00:06:59', '1', null, '2017-07-14 00:06:59', '0');
INSERT INTO `sys_file` VALUES ('55', 'DSC_0134.JPG', 'upload\\app\\', 'DSC_0134.JPG20170714000639', '10435811', null, null, 'app', '2017-07-14 00:07:58', '1', null, '2017-07-14 00:07:58', '0');
INSERT INTO `sys_file` VALUES ('56', 'settings.xml', 'upload\\app\\', 'settings.xml20170714000936', '3247', null, null, 'app', '2017-07-14 00:09:35', '1', null, '2017-07-14 00:09:35', '0');
INSERT INTO `sys_file` VALUES ('57', 'webuploader.custom.js', 'upload\\app\\', 'webuploader.custom.js20170714001046', '230033', null, null, 'app', '2017-07-14 00:10:46', '1', null, '2017-07-14 00:10:46', '0');
INSERT INTO `sys_file` VALUES ('58', 'webuploader.nolog.min.js', 'upload\\app\\', 'webuploader.nolog.min.js20170714002508', '70753', null, '39', 'device', '2017-07-14 00:25:07', '1', '1', '2017-07-14 00:26:17', '0');
INSERT INTO `sys_file` VALUES ('59', 'webuploader.html5only.js', 'upload\\app\\', 'webuploader.html5only.js20170714002510', '204543', null, '39', 'device', '2017-07-14 00:25:11', '1', '1', '2017-07-14 00:26:17', '0');
INSERT INTO `sys_file` VALUES ('60', 'webuploader.withoutimage.min.js', 'upload\\app\\', 'webuploader.withoutimage.min.js20170714002515', '43258', null, '39', 'device', '2017-07-14 00:25:14', '1', '1', '2017-07-14 00:26:17', '0');
INSERT INTO `sys_file` VALUES ('69', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170715211421', '9009', '.xlsx', '35', 'contract', '2017-07-15 21:14:21', '1', '1', '2017-07-15 21:14:23', '0');
INSERT INTO `sys_file` VALUES ('70', 'customertmp(2).xlsx', 'upload\\app\\', 'customertmp(2).xlsx20170715211513', '9493', '.xlsx', null, 'app', '2017-07-15 21:15:14', '1', null, '2017-07-15 21:15:14', '0');
INSERT INTO `sys_file` VALUES ('71', 'devicetmp(1).xlsx', 'upload\\app\\', 'devicetmp(1).xlsx20170715211726', '9024', '.xlsx', null, 'app', '2017-07-15 21:17:26', '1', null, '2017-07-15 21:17:26', '0');
INSERT INTO `sys_file` VALUES ('72', 'devicetmp(2).xlsx', 'upload\\app\\', 'devicetmp(2).xlsx20170715211840', '9024', '.xlsx', null, 'app', '2017-07-15 21:18:40', '1', null, '2017-07-15 21:18:40', '0');
INSERT INTO `sys_file` VALUES ('73', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170715212256', '9009', '.xlsx', '38', 'contract', '2017-07-15 21:22:56', '1', null, '2017-07-15 21:22:56', '0');
INSERT INTO `sys_file` VALUES ('74', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170715212711', '9009', '.xlsx', '39', 'contract', '2017-07-15 21:27:12', '1', '1', '2017-07-15 21:27:32', '0');
INSERT INTO `sys_file` VALUES ('75', '8.jpg', 'upload\\app\\', '8.jpg20170715213702', '20677', '.jpg', '41', 'device', '2017-07-15 21:37:02', '1', '1', '2017-07-16 18:59:37', '1');
INSERT INTO `sys_file` VALUES ('76', '313.jpg', 'upload\\app\\', '313.jpg20170715213704', '9290', '.jpg', '41', 'device', '2017-07-15 21:37:04', '1', '1', '2017-07-16 18:59:38', '1');
INSERT INTO `sys_file` VALUES ('77', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170715213707', '9009', '.xlsx', '41', 'device', '2017-07-15 21:37:07', '1', '1', '2017-07-16 18:59:38', '1');
INSERT INTO `sys_file` VALUES ('78', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170715213837', '9009', '.xlsx', '40', 'contract', '2017-07-15 21:38:37', '1', '1', '2017-07-15 21:38:59', '0');
INSERT INTO `sys_file` VALUES ('79', 'customertmp(2).xlsx', 'upload\\app\\', 'customertmp(2).xlsx20170715213839', '9493', '.xlsx', '40', 'contract', '2017-07-15 21:38:39', '1', '1', '2017-07-15 21:38:59', '0');
INSERT INTO `sys_file` VALUES ('80', 'customertmp.xlsx', 'upload\\app\\', 'customertmp.xlsx20170715213842', '9063', '.xlsx', '40', 'contract', '2017-07-15 21:38:42', '1', '1', '2017-07-15 21:38:59', '0');
INSERT INTO `sys_file` VALUES ('81', 'devicetmp(1).xlsx', 'upload\\app\\', 'devicetmp(1).xlsx20170715213845', '9024', '.xlsx', '40', 'contract', '2017-07-15 21:38:45', '1', '1', '2017-07-15 21:38:59', '0');
INSERT INTO `sys_file` VALUES ('96', '8.jpg', 'upload\\app\\', '8.jpg20170715232447', '20677', '.jpg', '21', 'part', '2017-07-15 23:24:47', '1', '1', '2017-07-15 23:25:11', '0');
INSERT INTO `sys_file` VALUES ('97', '313.jpg', 'upload\\app\\', '313.jpg20170715232448', '9290', '.jpg', '21', 'part', '2017-07-15 23:24:49', '1', '1', '2017-07-15 23:25:11', '0');
INSERT INTO `sys_file` VALUES ('98', '8.jpg', 'upload\\app\\', '8.jpg20170715232746', '20677', '.jpg', null, 'app', '2017-07-15 23:27:46', '1', null, '2017-07-15 23:27:46', '0');
INSERT INTO `sys_file` VALUES ('99', '313.jpg', 'upload\\app\\', '313.jpg20170715232747', '9290', '.jpg', null, 'app', '2017-07-15 23:27:48', '1', null, '2017-07-15 23:27:48', '0');
INSERT INTO `sys_file` VALUES ('100', '8.jpg', 'upload\\app\\', '8.jpg20170716000647', '20677', '.jpg', '22', 'part', '2017-07-16 00:06:47', '1', '1', '2017-07-20 23:06:44', '0');
INSERT INTO `sys_file` VALUES ('101', '313.jpg', 'upload\\app\\', '313.jpg20170716000649', '9290', '.jpg', '22', 'part', '2017-07-16 00:06:49', '1', '1', '2017-07-20 23:06:44', '0');
INSERT INTO `sys_file` VALUES ('102', 'customertmp.xlsx', 'upload\\app\\', 'customertmp.xlsx20170716001130', '9063', '.xlsx', null, 'app', '2017-07-16 00:11:30', '1', null, '2017-07-16 00:11:30', '0');
INSERT INTO `sys_file` VALUES ('103', 'webuploader.withoutimage.js', 'upload\\app\\', 'webuploader.withoutimage.js20170716162347', '167232', null, '41', 'contract', '2017-07-16 16:23:51', '1', '1', '2017-07-16 16:24:00', '0');
INSERT INTO `sys_file` VALUES ('104', 'webuploader.nolog.js', 'upload\\app\\', 'webuploader.nolog.js20170716162350', '277644', null, '41', 'contract', '2017-07-16 16:23:55', '1', '1', '2017-07-16 16:24:00', '0');
INSERT INTO `sys_file` VALUES ('105', 'DSC_0023.JPG', 'upload\\app\\', 'DSC_0023.JPG20170716172222', '10692004', null, '41', 'device', '2017-07-16 17:23:45', '1', '1', '2017-07-16 19:01:33', '0');
INSERT INTO `sys_file` VALUES ('106', 'DSC_0035.JPG', 'upload\\app\\', 'DSC_0035.JPG20170716173125', '10796249', null, '41', 'device', '2017-07-16 17:33:03', '1', '1', '2017-07-16 19:01:33', '0');
INSERT INTO `sys_file` VALUES ('110', '富盛问题.xlsx', 'upload\\app\\', '富盛问题.xlsx20170716194832', '188482', '.xlsx', '42', 'contract', '2017-07-16 19:48:33', '1', '1', '2017-07-16 19:48:40', '0');
INSERT INTO `sys_file` VALUES ('111', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716210303', '11830719', null, null, 'app', '2017-07-16 21:04:55', '1', null, '2017-07-16 21:04:55', '0');
INSERT INTO `sys_file` VALUES ('112', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716211055', '11830719', null, null, 'app', '2017-07-16 21:12:43', '1', null, '2017-07-16 21:12:43', '0');
INSERT INTO `sys_file` VALUES ('113', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716211502', '11830719', null, null, 'app', '2017-07-16 21:18:00', '1', null, '2017-07-16 21:18:00', '0');
INSERT INTO `sys_file` VALUES ('114', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716211618', '11830719', null, null, 'app', '2017-07-16 21:19:40', '1', null, '2017-07-16 21:19:40', '0');
INSERT INTO `sys_file` VALUES ('115', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716211739', '11830719', null, null, 'app', '2017-07-16 21:20:59', '1', null, '2017-07-16 21:20:59', '0');
INSERT INTO `sys_file` VALUES ('116', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716211910', '11830719', null, null, 'app', '2017-07-16 21:22:10', '1', null, '2017-07-16 21:22:10', '0');
INSERT INTO `sys_file` VALUES ('117', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716212021', '11830719', null, null, 'app', '2017-07-16 21:23:00', '1', null, '2017-07-16 21:23:00', '0');
INSERT INTO `sys_file` VALUES ('118', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170716212112', '11830719', null, null, 'app', '2017-07-16 21:23:22', '1', null, '2017-07-16 21:23:22', '0');
INSERT INTO `sys_file` VALUES ('119', '8.jpg', 'upload/app/', '8.jpg20170717084711', '20677', null, '23', 'part', '2017-07-17 08:47:11', '1', '1', '2017-07-17 08:47:13', '0');
INSERT INTO `sys_file` VALUES ('120', 'customertmp.xlsx', 'upload/app/', 'customertmp.xlsx20170717085132', '9063', null, '43', 'contract', '2017-07-17 08:51:32', '1', '1', '2017-07-17 08:51:34', '0');
INSERT INTO `sys_file` VALUES ('121', '8.jpg', 'upload/app/', '8.jpg20170717085656', '20677', null, '42', 'device', '2017-07-17 08:56:56', '1', '1', '2017-07-17 09:00:49', '1');
INSERT INTO `sys_file` VALUES ('122', 'CCM1_联动.png', 'upload\\app\\', 'CCM1_联动.png20170717160117', '3475', null, '24', 'part', '2017-07-17 16:01:20', '1', '1', '2017-07-17 18:04:20', '0');
INSERT INTO `sys_file` VALUES ('123', 'CCM1_联动填充.png', 'upload\\app\\', 'CCM1_联动填充.png20170717160130', '3822', null, '24', 'part', '2017-07-17 16:01:32', '1', '1', '2017-07-17 18:04:20', '0');
INSERT INTO `sys_file` VALUES ('124', '3.jpg', 'upload\\app\\', '3.jpg20170717160145', '204861', null, '24', 'part', '2017-07-17 16:01:48', '1', '1', '2017-07-17 18:04:20', '0');
INSERT INTO `sys_file` VALUES ('125', '3.jpg', 'upload\\app\\', '3.jpg20170717173709', '204861', null, '44', 'contract', '2017-07-17 17:37:12', '1', '1', '2017-07-17 17:37:34', '0');
INSERT INTO `sys_file` VALUES ('126', '05.png', 'upload\\app\\', '05.png20170717173713', '1077', null, '44', 'contract', '2017-07-17 17:37:16', '1', '1', '2017-07-17 17:37:34', '0');
INSERT INTO `sys_file` VALUES ('127', '上传流数据处理.txt', 'upload\\app\\', '上传流数据处理.txt20170717175533', '6990', null, '45', 'contract', '2017-07-17 17:55:36', '1', '1', '2017-07-20 23:26:09', '0');
INSERT INTO `sys_file` VALUES ('128', '接收手机端文件.txt', 'upload\\app\\', '接收手机端文件.txt20170717175540', '3903', null, '45', 'contract', '2017-07-17 17:55:43', '1', '1', '2017-07-20 23:26:09', '0');
INSERT INTO `sys_file` VALUES ('129', '上传流数据处理.txt', 'upload\\app\\', '上传流数据处理.txt20170717175748', '6990', null, null, 'app', '2017-07-17 17:57:51', '1', null, '2017-07-17 17:57:51', '0');
INSERT INTO `sys_file` VALUES ('130', '网络连接详细信息.png', 'upload\\app\\', '网络连接详细信息.png20170717180400', '29990', null, '24', 'part', '2017-07-17 18:04:03', '1', '1', '2017-07-17 18:04:20', '0');
INSERT INTO `sys_file` VALUES ('131', 'baby1.png', 'upload\\app\\', 'baby1.png20170717181748', '15137', null, '12', 'part', '2017-07-17 18:17:51', '1', '1', '2017-07-17 18:17:53', '0');
INSERT INTO `sys_file` VALUES ('132', 'DSC_0206.JPG', 'upload\\app\\', 'DSC_0206.JPG20170717221900', '12659383', null, null, 'app', '2017-07-17 22:20:53', '1', null, '2017-07-17 22:20:53', '0');
INSERT INTO `sys_file` VALUES ('133', 'DSC_0197.JPG', 'upload\\app\\', 'DSC_0197.JPG20170717222737', '11830719', null, '43', 'device', '2017-07-17 22:29:16', '1', '1', '2017-07-17 22:32:43', '0');
INSERT INTO `sys_file` VALUES ('134', 'DSC_0206.JPG', 'upload\\app\\', 'DSC_0206.JPG20170717223022', '12659383', null, '43', 'device', '2017-07-17 22:32:12', '1', '1', '2017-07-17 22:32:43', '0');
INSERT INTO `sys_file` VALUES ('135', 'DSC_0165.JPG', 'upload\\app\\', 'DSC_0165.JPG20170717223420', '13993085', null, null, 'app', '2017-07-17 22:36:12', '1', null, '2017-07-17 22:36:12', '0');
INSERT INTO `sys_file` VALUES ('136', 'customertmp - 副本.xlsx', 'upload\\app\\', 'customertmp - 副本.xlsx20170720232622', '9063', '.xlsx', '46', 'contract', '2017-07-20 23:26:22', '1', '1', '2017-07-20 23:27:13', '1');
INSERT INTO `sys_file` VALUES ('137', 'customertmp(1).xlsx', 'upload\\app\\', 'customertmp(1).xlsx20170720232705', '9009', '.xlsx', '46', 'contract', '2017-07-20 23:27:06', '1', '1', '2017-07-20 23:27:13', '0');
INSERT INTO `sys_file` VALUES ('138', 'customertmp.xls', 'upload\\app\\', 'customertmp.xls20170802001411', '23552', null, '47', 'device', '2017-08-02 00:14:11', '1', '1', '2017-08-02 00:15:00', '0');
INSERT INTO `sys_file` VALUES ('139', 'DSC_1996.JPG', 'upload\\app\\', 'DSC_1996.JPG20170802001426', '10307721', null, null, 'app', '2017-08-02 00:15:52', '1', null, '2017-08-02 00:15:52', '0');
INSERT INTO `sys_file` VALUES ('140', 'DSC_1996.JPG', 'upload\\app\\', 'DSC_1996.JPG20170802001839', '10307721', null, '47', 'contract', '2017-08-02 00:20:09', '1', '1', '2017-08-02 00:21:44', '0');
INSERT INTO `sys_file` VALUES ('141', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload\\app\\', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170804070924', '18544', null, null, 'app', '2017-08-04 07:09:28', '1', null, '2017-08-04 07:09:28', '0');
INSERT INTO `sys_file` VALUES ('142', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload\\app\\', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170804071003', '18544', null, null, 'app', '2017-08-04 07:10:08', '1', null, '2017-08-04 07:10:08', '0');
INSERT INTO `sys_file` VALUES ('143', '1.txt', 'upload\\app\\', '1.txt20170813141236', '171', null, '49', 'device', '2017-08-13 14:12:36', '1', '1', '2017-08-13 14:13:04', '0');
INSERT INTO `sys_file` VALUES ('144', 'CFO集市迁移.zip', 'upload\\app\\', 'CFO集市迁移.zip20170813141152', '4457218', null, null, 'app', '2017-08-13 14:12:37', '1', null, '2017-08-13 14:12:37', '0');
INSERT INTO `sys_file` VALUES ('145', 'b_def_action.sql', 'upload\\app\\', 'b_def_action.sql20170813141241', '18449', null, '49', 'device', '2017-08-13 14:12:41', '1', '1', '2017-08-13 14:13:04', '0');
INSERT INTO `sys_file` VALUES ('146', '1.txt', 'upload\\app\\', '1.txt20170813142347', '171', null, '50', 'device', '2017-08-13 14:23:46', '1', '1', '2017-08-13 14:32:45', '1');
INSERT INTO `sys_file` VALUES ('147', '20170515_druid_children.txt', 'upload\\app\\', '20170515_druid_children.txt20170813142352', '18805', null, '50', 'device', '2017-08-13 14:23:52', '1', '1', '2017-08-13 14:32:46', '0');
INSERT INTO `sys_file` VALUES ('148', '1.txt', 'upload\\app\\', '1.txt20170813143820', '171', null, '25', 'part', '2017-08-13 14:38:19', '1', '1', '2017-08-13 14:38:39', '1');
INSERT INTO `sys_file` VALUES ('149', '1.txt', 'upload\\app\\', '1.txt20170813143835', '171', null, '25', 'part', '2017-08-13 14:38:35', '1', '1', '2017-08-13 14:38:39', '0');
INSERT INTO `sys_file` VALUES ('150', 'auto_test.sql', 'upload\\app\\', 'auto_test.sql20170813143838', '8027', null, '25', 'part', '2017-08-13 14:38:38', '1', '1', '2017-08-13 14:38:39', '0');
INSERT INTO `sys_file` VALUES ('151', 'CCM1_联动.png', 'upload\\app\\', 'CCM1_联动.png20170815092927', '3475', null, '2', 'maintenance', '2017-08-15 09:29:29', '1', '1', '2017-08-15 09:53:36', '1');
INSERT INTO `sys_file` VALUES ('152', 'CCM1_联动填充.png', 'upload\\app\\', 'CCM1_联动填充.png20170815092933', '3822', null, '2', 'maintenance', '2017-08-15 09:29:35', '1', '1', '2017-08-15 09:53:36', '1');
INSERT INTO `sys_file` VALUES ('153', 'CCM1_联动.png', 'upload\\app\\', 'CCM1_联动.png20170815093251', '3475', null, '3', 'maintenance', '2017-08-15 09:32:53', '1', '1', '2017-08-15 09:33:04', '0');
INSERT INTO `sys_file` VALUES ('154', 'CCM1_联动填充.png', 'upload\\app\\', 'CCM1_联动填充.png20170815093255', '3822', null, '3', 'maintenance', '2017-08-15 09:32:57', '1', '1', '2017-08-15 09:33:04', '0');
INSERT INTO `sys_file` VALUES ('155', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114233', '78847', null, null, 'app', '2017-08-20 11:42:33', '1', null, '2017-08-20 11:42:33', '0');
INSERT INTO `sys_file` VALUES ('156', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114233', '78847', null, null, 'app', '2017-08-20 11:42:33', '1', null, '2017-08-20 11:42:33', '0');
INSERT INTO `sys_file` VALUES ('157', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820114330', '96363', null, null, 'app', '2017-08-20 11:43:30', '1', null, '2017-08-20 11:43:30', '0');
INSERT INTO `sys_file` VALUES ('158', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820114330', '96363', null, null, 'app', '2017-08-20 11:43:30', '1', null, '2017-08-20 11:43:30', '0');
INSERT INTO `sys_file` VALUES ('159', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114356', '78847', null, null, 'app', '2017-08-20 11:43:57', '1', null, '2017-08-20 11:43:57', '0');
INSERT INTO `sys_file` VALUES ('160', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114356', '78847', null, null, 'app', '2017-08-20 11:43:57', '1', null, '2017-08-20 11:43:57', '0');
INSERT INTO `sys_file` VALUES ('161', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114432', '78847', null, null, 'app', '2017-08-20 11:44:32', '1', null, '2017-08-20 11:44:32', '0');
INSERT INTO `sys_file` VALUES ('162', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114432', '78847', null, null, 'app', '2017-08-20 11:44:32', '1', null, '2017-08-20 11:44:32', '0');
INSERT INTO `sys_file` VALUES ('163', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114514', '78847', null, null, 'app', '2017-08-20 11:45:14', '1', null, '2017-08-20 11:45:14', '0');
INSERT INTO `sys_file` VALUES ('164', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114515', '78847', null, null, 'app', '2017-08-20 11:45:15', '1', null, '2017-08-20 11:45:15', '0');
INSERT INTO `sys_file` VALUES ('165', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820114633', '96363', null, null, 'app', '2017-08-20 11:46:34', '1', null, '2017-08-20 11:46:34', '0');
INSERT INTO `sys_file` VALUES ('166', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820114633', '96363', null, null, 'app', '2017-08-20 11:46:34', '1', null, '2017-08-20 11:46:34', '0');
INSERT INTO `sys_file` VALUES ('167', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114644', '78847', null, null, 'app', '2017-08-20 11:46:44', '1', null, '2017-08-20 11:46:44', '0');
INSERT INTO `sys_file` VALUES ('168', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114644', '78847', null, null, 'app', '2017-08-20 11:46:45', '1', null, '2017-08-20 11:46:45', '0');
INSERT INTO `sys_file` VALUES ('169', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114839', '78847', null, null, 'app', '2017-08-20 11:48:39', '1', null, '2017-08-20 11:48:39', '0');
INSERT INTO `sys_file` VALUES ('170', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820114912', '78847', null, null, 'app', '2017-08-20 11:49:12', '1', null, '2017-08-20 11:49:12', '0');
INSERT INTO `sys_file` VALUES ('171', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820114915', '96363', null, null, 'app', '2017-08-20 11:49:16', '1', null, '2017-08-20 11:49:16', '0');
INSERT INTO `sys_file` VALUES ('172', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820115821', '78847', null, null, 'app', '2017-08-20 11:58:21', '1', null, '2017-08-20 11:58:21', '0');
INSERT INTO `sys_file` VALUES ('173', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820115825', '96363', null, null, 'app', '2017-08-20 11:58:25', '1', null, '2017-08-20 11:58:25', '0');
INSERT INTO `sys_file` VALUES ('174', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820122045', '78847', null, null, 'app', '2017-08-20 12:20:46', '1', null, '2017-08-20 12:20:46', '0');
INSERT INTO `sys_file` VALUES ('175', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820122049', '96363', null, null, 'app', '2017-08-20 12:20:49', '1', null, '2017-08-20 12:20:49', '0');
INSERT INTO `sys_file` VALUES ('176', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820131305', '78847', null, '4', 'debug', '2017-08-20 13:13:06', '1', '1', '2017-08-20 13:15:48', '0');
INSERT INTO `sys_file` VALUES ('177', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820131310', '96363', null, '4', 'debug', '2017-08-20 13:13:10', '1', '1', '2017-08-20 13:15:48', '0');
INSERT INTO `sys_file` VALUES ('178', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820144027', '78847', null, null, 'app', '2017-08-20 14:40:28', '1', null, '2017-08-20 14:40:28', '0');
INSERT INTO `sys_file` VALUES ('179', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820144032', '96363', null, null, 'app', '2017-08-20 14:40:33', '1', null, '2017-08-20 14:40:33', '0');
INSERT INTO `sys_file` VALUES ('180', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820144209', '78847', null, '5', 'maintenance', '2017-08-20 14:42:09', '1', '1', '2017-08-20 20:23:39', '1');
INSERT INTO `sys_file` VALUES ('181', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170820144213', '96363', null, '5', 'maintenance', '2017-08-20 14:42:13', '1', '1', '2017-08-20 20:23:39', '1');
INSERT INTO `sys_file` VALUES ('182', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820144312', '78847', null, '7', 'maintenance', '2017-08-20 14:43:12', '1', '1', '2017-08-20 14:48:44', '1');
INSERT INTO `sys_file` VALUES ('183', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820144931', '78847', null, '8', 'maintenance', '2017-08-20 14:49:31', '1', '1', '2017-08-20 15:04:58', '0');
INSERT INTO `sys_file` VALUES ('184', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820150900', '78847', null, '9', 'maintenance', '2017-08-20 15:09:00', '1', '1', '2017-08-20 15:09:02', '0');
INSERT INTO `sys_file` VALUES ('185', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170820201144', '78847', null, '10', 'maintenance', '2017-08-20 20:11:47', '1', '1', '2017-08-20 20:11:48', '0');
INSERT INTO `sys_file` VALUES ('186', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170822062838', '78847', null, '11', 'maintenance', '2017-08-22 06:28:38', '1', '1', '2017-08-22 06:28:40', '0');
INSERT INTO `sys_file` VALUES ('187', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170822063016', '78847', null, '51', 'device', '2017-08-22 06:30:16', '1', '1', '2017-08-22 06:30:20', '0');
INSERT INTO `sys_file` VALUES ('188', 'client.png', 'upload\\app\\', 'client.png20170924203510', '4584', null, '53', 'device', '2017-09-24 20:35:08', '1', '1', '2017-09-24 20:35:09', '0');

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `function_iframe` smallint(6) DEFAULT NULL COMMENT '菜单地址打开方式',
  `function_level` smallint(6) DEFAULT NULL COMMENT '菜单等级',
  `function_name` varchar(50) NOT NULL COMMENT '菜单名字',
  `function_order` varchar(255) DEFAULT NULL COMMENT '排序',
  `function_menu_name` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `function_url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `function_height` int(11) DEFAULT NULL COMMENT '页面高度',
  `parent_function_id` int(32) DEFAULT NULL COMMENT '父菜单ID',
  `icon_id` varchar(32) DEFAULT NULL COMMENT '图标ID',
  `functiontype` smallint(6) DEFAULT NULL COMMENT '菜单类型 1-菜单类型 2-非菜单类型 3-iframe 4-弹层 5-开放菜单',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='菜单定义表';

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES ('1', null, '0', '系统管理', '6', 'sys_manager', '#', null, '-1', '1', '0', '1', '2017-05-30 09:47:33', '1', '2017-05-30 09:47:29', '0');
INSERT INTO `sys_function` VALUES ('2', null, '0', '客户管理', '1', 'customer_manager', '#', null, '-1', '2', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('3', null, '0', '合同管理', '5', 'contrat_manager', '#', null, '-1', '3', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('4', null, '0', '运营服务', '4', 'maintenance_service', '#', null, '-1', '4', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('5', null, '0', '设备管理', '2', 'device_manager', '#', null, '-1', '1', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('6', null, '0', '出入库管理', '3', 'repertory_manager', '#', null, '-1', '2', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('7', null, '1', '用户管理', '1', 'user_manager', '/user/index.html', null, '1', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('8', null, '1', '角色管理', '2', 'role_manager', '/role/index.html', null, '1', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('9', null, '1', '合同管理', '1', 'contrat_manager', '/contract/index.html', null, '3', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('10', null, '1', '客户管理', '1', 'customer_manager', '/customer/index.html', null, '2', '1', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('11', null, '1', '设备管理', '1', 'device_manager', '/device/index.html', null, '5', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('13', null, '1', '配件管理', '2', 'part_manager', '/part/index.html', null, '5', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('14', null, '1', '客户详情', '1', 'customer_manager', '/customer/info.html', null, '2', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('15', null, '1', '设备详情', '1', 'device_manager', '/device/info.html', null, '5', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('16', null, '0', '首页', '0', 'home_page', '/index.html', null, '-1', '6', '0', '1', null, '1', null, '0');
INSERT INTO `sys_function` VALUES ('17', null, '1', '入库管理', '1', 'repertory_in', '/repertory/in/index.html', null, '6', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('18', null, '1', '合同详情', '2', 'contrat_manager', '/contract/info.html', null, '3', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('20', null, '1', '出库管理', '2', 'out_repertory_manager', '/repertory/out/index.html', null, '6', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('21', null, '1', '配件详情', '3', 'part_manager', '/part/info.html', null, '5', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('22', null, '1', '库存管理', '4', 'repertory_manager', '/repertory/index.html', null, '6', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('23', null, '1', '新增出库', '1', 'out_repertory_manager', '/repertory/out/add.html', null, '6', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('24', null, '1', '维保服务', '1', 'maintenance_service', '/server/maintenance/index.html', null, '4', '4', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('25', null, '1', '入库详情', '4', 'repertory_in', '/repertory/in/info.html', null, '6', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('26', null, '1', '出库详情', '1', 'out_repertory_manager', '/repertory/out/info.html', null, '6', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('27', null, '1', '库存详情', '10', 'repertory_manager', '/repertory/info.html', null, '6', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('28', null, '1', '字典管理', '7', 'attr_manager', '/attr/index.html', null, '1', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('29', null, '1', '巡检服务', '2', 'polling_service', '/serve/polling/index.html', null, '4', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('30', null, '1', '调试服务', '3', 'debug_service', '/serve/debugeq/index.html', null, '4', '6', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('31', null, '1', '新增调试单', '10', 'debug_service', '/serve/debugeq/add.html', null, '4', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('32', null, '1', '新增巡检单', '12', 'polling_service', '/serve/polling/add.html', null, '4', '6', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('33', null, '1', '新增维保服务单', '11', 'maintenance_service', '/server/maintenance/add.html', null, '4', '6', '1', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `sys_icon`;
CREATE TABLE `sys_icon` (
  `icon_id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extend` varchar(255) DEFAULT NULL COMMENT '图片后缀',
  `iconclas` varchar(200) DEFAULT NULL COMMENT '类型',
  `content` blob COMMENT '图片流内容',
  `name` varchar(100) NOT NULL COMMENT '名字',
  `path` longtext COMMENT '路径',
  `type` smallint(6) DEFAULT NULL COMMENT '类型 1系统图标/2菜单图标/3桌面图标',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='图标定义表';

-- ----------------------------
-- Records of sys_icon
-- ----------------------------
INSERT INTO `sys_icon` VALUES ('1', null, 'menu-icon fa fa-calendar', null, '日历', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('2', null, 'menu-icon fa fa-picture-o', null, '图片', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('3', null, 'menu-icon fa fa-list-alt', null, '列表', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('4', null, 'menu-icon fa fa-pencil-square-o', null, '表单', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('5', null, 'menu-icon fa fa-desktop', null, '桌面', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('6', null, 'ace-icon fa fa-home home-icon', null, '首页', null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `permission_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '权限Id',
  `role_id` int(32) DEFAULT NULL COMMENT '角色ID',
  `user_id` int(32) DEFAULT NULL COMMENT '用户ID',
  `resource_id` int(11) DEFAULT NULL COMMENT '资源Id',
  `resource_type` int(11) DEFAULT NULL COMMENT '资源类型',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '2', '1', null, null, '1', '2017-07-16 11:15:45', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('2', '2', '1', null, null, '1', '2017-07-16 11:15:55', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', '1', null, null, '1', '2017-07-16 11:15:55', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('4', '2', '1', null, null, '1', '2017-07-16 11:21:35', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('5', '2', '1', null, null, '1', '2017-07-16 11:22:32', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('6', '2', '1', null, null, '1', '2017-07-16 11:24:37', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('7', '1', '1', null, null, '1', '2017-07-16 11:24:37', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', '1', null, null, '1', '2017-07-16 11:25:17', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', '5', null, null, '1', '2017-07-16 11:25:24', '1', '2017-07-16 11:54:45', '1');
INSERT INTO `sys_permission` VALUES ('10', '2', '5', null, null, '1', '2017-07-16 11:25:30', '1', '2017-07-16 11:54:45', '1');
INSERT INTO `sys_permission` VALUES ('11', '1', '5', null, null, '1', '2017-07-16 11:25:30', '1', '2017-07-16 11:54:45', '1');
INSERT INTO `sys_permission` VALUES ('12', '1', '5', null, null, '1', '2017-07-16 11:54:45', '1', '2017-07-16 11:54:45', '0');
INSERT INTO `sys_permission` VALUES ('13', '2', '1', null, null, '1', '2017-07-18 23:26:42', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('14', '2', '1', null, null, '1', '2017-07-18 23:27:15', '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_permission` VALUES ('15', '2', '7', null, null, '1', '2017-07-18 23:27:27', '1', '2017-07-18 23:27:31', '1');
INSERT INTO `sys_permission` VALUES ('16', '2', '7', null, null, '1', '2017-07-18 23:27:31', '1', '2017-07-18 23:27:31', '0');
INSERT INTO `sys_permission` VALUES ('17', '2', '1', null, null, '1', '2017-07-18 23:27:39', '1', '2017-07-18 23:27:39', '0');

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '区域Id',
  `region_name` varchar(50) NOT NULL COMMENT '城市名',
  `parent_region_id` int(10) NOT NULL COMMENT '父区域Id',
  `region_post_code` varchar(255) DEFAULT NULL COMMENT '区域邮编',
  `region_code` varchar(100) NOT NULL COMMENT '英文名',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_region
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_code` varchar(128) DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名字',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'use_code', '测试人员', '1', '2017-07-15 16:50:30', '1', '2017-07-16 11:54:23', '0');
INSERT INTO `sys_role` VALUES ('2', 'sys_admin', '超级管理员', null, null, '1', '2017-07-18 23:28:04', '0');
INSERT INTO `sys_role` VALUES ('3', 'llll', '品', '1', '2017-07-17 09:04:50', '1', '2017-07-17 09:04:50', '0');

-- ----------------------------
-- Table structure for sys_role_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_depart`;
CREATE TABLE `sys_role_depart` (
  `role_dept_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '角色与部门关系表',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`role_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门角色表';

-- ----------------------------
-- Records of sys_role_depart
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `role_func_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `operation` varchar(2000) DEFAULT NULL COMMENT '页面控件权限编码',
  `function_id` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  `role_id` int(32) DEFAULT NULL COMMENT '角色ID',
  `data_rule` varchar(1000) DEFAULT NULL COMMENT '数据权限规则ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`role_func_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('1', null, '16', '2', null, '1', '2017-07-16 10:22:18', '1', '2017-07-16 10:30:22', '1');
INSERT INTO `sys_role_function` VALUES ('2', null, '2', '2', null, '1', '2017-07-16 10:22:22', '1', '2017-07-16 10:30:22', '1');
INSERT INTO `sys_role_function` VALUES ('3', null, '14', '2', null, '1', '2017-07-16 10:22:24', '1', '2017-07-16 10:30:22', '1');
INSERT INTO `sys_role_function` VALUES ('4', null, '16', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('5', null, '2', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('6', null, '10', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('7', null, '14', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('8', null, '5', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('9', null, '11', '2', null, '1', '2017-07-16 10:30:22', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('10', null, '15', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('11', null, '13', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('12', null, '6', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('13', null, '4', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('14', null, '3', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('15', null, '9', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('16', null, '1', '2', null, '1', '2017-07-16 10:30:23', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('17', null, '7', '2', null, '1', '2017-07-16 10:30:24', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('18', null, '8', '2', null, '1', '2017-07-16 10:30:24', '1', '2017-07-16 14:01:52', '1');
INSERT INTO `sys_role_function` VALUES ('19', null, '2', '1', null, '1', '2017-07-16 12:03:42', '1', '2017-07-16 12:04:38', '1');
INSERT INTO `sys_role_function` VALUES ('20', null, '14', '1', null, '1', '2017-07-16 12:03:42', '1', '2017-07-16 12:04:38', '1');
INSERT INTO `sys_role_function` VALUES ('21', null, '10', '1', null, '1', '2017-07-16 12:03:43', '1', '2017-07-16 12:04:38', '1');
INSERT INTO `sys_role_function` VALUES ('22', null, '16', '1', null, '1', '2017-07-16 12:04:38', '1', '2017-07-16 12:06:31', '1');
INSERT INTO `sys_role_function` VALUES ('23', null, '2', '1', null, '1', '2017-07-16 12:04:38', '1', '2017-07-16 12:06:31', '1');
INSERT INTO `sys_role_function` VALUES ('24', null, '10', '1', null, '1', '2017-07-16 12:04:39', '1', '2017-07-16 12:06:31', '1');
INSERT INTO `sys_role_function` VALUES ('25', null, '14', '1', null, '1', '2017-07-16 12:04:39', '1', '2017-07-16 12:06:31', '1');
INSERT INTO `sys_role_function` VALUES ('26', null, '2', '1', null, '1', '2017-07-16 12:06:31', '1', '2017-07-16 12:06:31', '0');
INSERT INTO `sys_role_function` VALUES ('27', null, '14', '1', null, '1', '2017-07-16 12:06:31', '1', '2017-07-16 12:06:31', '0');
INSERT INTO `sys_role_function` VALUES ('28', null, '10', '1', null, '1', '2017-07-16 12:06:31', '1', '2017-07-16 12:06:31', '0');
INSERT INTO `sys_role_function` VALUES ('29', null, '16', '2', null, '1', '2017-07-16 14:01:52', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('30', null, '2', '2', null, '1', '2017-07-16 14:01:52', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('31', null, '14', '2', null, '1', '2017-07-16 14:01:52', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('32', null, '10', '2', null, '1', '2017-07-16 14:01:52', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('33', null, '5', '2', null, '1', '2017-07-16 14:01:52', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('34', null, '11', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('35', null, '15', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('36', null, '13', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('37', null, '6', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('38', null, '17', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('39', null, '4', '2', null, '1', '2017-07-16 14:01:53', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('40', null, '3', '2', null, '1', '2017-07-16 14:01:54', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('41', null, '9', '2', null, '1', '2017-07-16 14:01:54', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('42', null, '1', '2', null, '1', '2017-07-16 14:01:54', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('43', null, '7', '2', null, '1', '2017-07-16 14:01:54', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('44', null, '8', '2', null, '1', '2017-07-16 14:01:54', '1', '2017-07-16 16:22:08', '1');
INSERT INTO `sys_role_function` VALUES ('45', null, '16', '2', null, '1', '2017-07-16 16:22:08', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('46', null, '2', '2', null, '1', '2017-07-16 16:22:08', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('47', null, '14', '2', null, '1', '2017-07-16 16:22:08', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('48', null, '10', '2', null, '1', '2017-07-16 16:22:08', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('49', null, '5', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('50', null, '15', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('51', null, '11', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('52', null, '13', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('53', null, '6', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('54', null, '17', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('55', null, '4', '2', null, '1', '2017-07-16 16:22:09', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('56', null, '3', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('57', null, '9', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('58', null, '18', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('59', null, '1', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('60', null, '7', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('61', null, '8', '2', null, '1', '2017-07-16 16:22:10', '1', '2017-07-16 17:54:07', '1');
INSERT INTO `sys_role_function` VALUES ('62', null, '16', '2', null, '1', '2017-07-16 17:54:07', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('63', null, '2', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('64', null, '10', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('65', null, '14', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('66', null, '5', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('67', null, '15', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('68', null, '11', '2', null, '1', '2017-07-16 17:54:08', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('69', null, '13', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('70', null, '6', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('71', null, '17', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('72', null, '20', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('73', null, '4', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('74', null, '3', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('75', null, '9', '2', null, '1', '2017-07-16 17:54:09', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('76', null, '18', '2', null, '1', '2017-07-16 17:54:10', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('77', null, '1', '2', null, '1', '2017-07-16 17:54:10', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('78', null, '7', '2', null, '1', '2017-07-16 17:54:10', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('79', null, '8', '2', null, '1', '2017-07-16 17:54:10', '1', '2017-07-17 22:24:15', '1');
INSERT INTO `sys_role_function` VALUES ('80', null, '16', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('81', null, '2', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('82', null, '14', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('83', null, '10', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('84', null, '5', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('85', null, '15', '2', null, '1', '2017-07-17 22:24:15', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('86', null, '11', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('87', null, '13', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('88', null, '6', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('89', null, '17', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('90', null, '20', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('91', null, '4', '2', null, '1', '2017-07-17 22:24:16', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('92', null, '3', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('93', null, '9', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('94', null, '18', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('95', null, '1', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('96', null, '7', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('97', null, '8', '2', null, '1', '2017-07-17 22:24:17', '1', '2017-07-17 22:27:07', '1');
INSERT INTO `sys_role_function` VALUES ('98', null, '16', '2', null, '1', '2017-07-17 22:27:07', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('99', null, '2', '2', null, '1', '2017-07-17 22:27:07', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('100', null, '10', '2', null, '1', '2017-07-17 22:27:07', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('101', null, '14', '2', null, '1', '2017-07-17 22:27:07', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('102', null, '5', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('103', null, '15', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('104', null, '11', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('105', null, '13', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('106', null, '21', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('107', null, '6', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('108', null, '17', '2', null, '1', '2017-07-17 22:27:08', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('109', null, '20', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('110', null, '4', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('111', null, '3', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('112', null, '9', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('113', null, '18', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('114', null, '1', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('115', null, '7', '2', null, '1', '2017-07-17 22:27:09', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('116', null, '8', '2', null, '1', '2017-07-17 22:27:10', '1', '2017-07-30 12:10:11', '1');
INSERT INTO `sys_role_function` VALUES ('117', null, '16', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('118', null, '2', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('119', null, '10', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('120', null, '14', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('121', null, '5', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('122', null, '11', '2', null, '1', '2017-07-30 12:10:11', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('123', null, '15', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('124', null, '13', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('125', null, '21', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('126', null, '6', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('127', null, '17', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('128', null, '20', '2', null, '1', '2017-07-30 12:10:12', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('129', null, '22', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('130', null, '4', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('131', null, '3', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('132', null, '9', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('133', null, '18', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('134', null, '1', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('135', null, '7', '2', null, '1', '2017-07-30 12:10:13', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('136', null, '8', '2', null, '1', '2017-07-30 12:10:14', '1', '2017-08-03 07:43:08', '1');
INSERT INTO `sys_role_function` VALUES ('137', null, '16', '2', null, '1', '2017-08-03 07:43:08', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('138', null, '2', '2', null, '1', '2017-08-03 07:43:08', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('139', null, '14', '2', null, '1', '2017-08-03 07:43:08', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('140', null, '10', '2', null, '1', '2017-08-03 07:43:08', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('141', null, '5', '2', null, '1', '2017-08-03 07:43:09', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('142', null, '15', '2', null, '1', '2017-08-03 07:43:09', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('143', null, '11', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('144', null, '13', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('145', null, '21', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('146', null, '6', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('147', null, '17', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('148', null, '23', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('149', null, '22', '2', null, '1', '2017-08-03 07:43:10', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('150', null, '4', '2', null, '1', '2017-08-03 07:43:11', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('151', null, '3', '2', null, '1', '2017-08-03 07:43:11', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('152', null, '9', '2', null, '1', '2017-08-03 07:43:11', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('153', null, '18', '2', null, '1', '2017-08-03 07:43:11', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('154', null, '1', '2', null, '1', '2017-08-03 07:43:11', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('155', null, '7', '2', null, '1', '2017-08-03 07:43:12', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('156', null, '8', '2', null, '1', '2017-08-03 07:43:12', '1', '2017-08-03 22:10:05', '1');
INSERT INTO `sys_role_function` VALUES ('157', null, '16', '2', null, '1', '2017-08-03 22:10:05', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('158', null, '2', '2', null, '1', '2017-08-03 22:10:06', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('159', null, '10', '2', null, '1', '2017-08-03 22:10:06', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('160', null, '14', '2', null, '1', '2017-08-03 22:10:06', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('161', null, '5', '2', null, '1', '2017-08-03 22:10:06', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('162', null, '15', '2', null, '1', '2017-08-03 22:10:06', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('163', null, '11', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('164', null, '13', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('165', null, '21', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('166', null, '6', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('167', null, '17', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('168', null, '23', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('169', null, '20', '2', null, '1', '2017-08-03 22:10:07', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('170', null, '22', '2', null, '1', '2017-08-03 22:10:08', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('171', null, '4', '2', null, '1', '2017-08-03 22:10:08', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('172', null, '3', '2', null, '1', '2017-08-03 22:10:08', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('173', null, '9', '2', null, '1', '2017-08-03 22:10:08', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('174', null, '18', '2', null, '1', '2017-08-03 22:10:08', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('175', null, '1', '2', null, '1', '2017-08-03 22:10:09', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('176', null, '7', '2', null, '1', '2017-08-03 22:10:09', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('177', null, '8', '2', null, '1', '2017-08-03 22:10:09', '1', '2017-08-04 11:06:03', '1');
INSERT INTO `sys_role_function` VALUES ('179', null, '16', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('180', null, '2', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('181', null, '14', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('182', null, '10', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('183', null, '5', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('184', null, '11', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('185', null, '15', '2', null, '1', '2017-08-04 11:06:04', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('186', null, '13', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('187', null, '21', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('188', null, '6', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('189', null, '17', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('190', null, '23', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('191', null, '20', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('192', null, '22', '2', null, '1', '2017-08-04 11:06:05', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('193', null, '4', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('194', null, '24', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('195', null, '3', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('196', null, '9', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('197', null, '18', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('198', null, '1', '2', null, '1', '2017-08-04 11:06:06', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('199', null, '7', '2', null, '1', '2017-08-04 11:06:07', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('200', null, '8', '2', null, '1', '2017-08-04 11:06:07', '1', '2017-08-13 14:45:24', '1');
INSERT INTO `sys_role_function` VALUES ('201', null, '16', '2', null, '1', '2017-08-13 14:45:25', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('202', null, '2', '2', null, '1', '2017-08-13 14:45:25', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('203', null, '10', '2', null, '1', '2017-08-13 14:45:25', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('204', null, '14', '2', null, '1', '2017-08-13 14:45:25', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('205', null, '5', '2', null, '1', '2017-08-13 14:45:26', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('206', null, '15', '2', null, '1', '2017-08-13 14:45:26', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('207', null, '11', '2', null, '1', '2017-08-13 14:45:26', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('208', null, '13', '2', null, '1', '2017-08-13 14:45:27', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('209', null, '21', '2', null, '1', '2017-08-13 14:45:27', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('210', null, '6', '2', null, '1', '2017-08-13 14:45:27', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('211', null, '26', '2', null, '1', '2017-08-13 14:45:28', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('212', null, '17', '2', null, '1', '2017-08-13 14:45:28', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('213', null, '23', '2', null, '1', '2017-08-13 14:45:28', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('214', null, '20', '2', null, '1', '2017-08-13 14:45:29', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('215', null, '22', '2', null, '1', '2017-08-13 14:45:29', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('216', null, '4', '2', null, '1', '2017-08-13 14:45:29', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('217', null, '24', '2', null, '1', '2017-08-13 14:45:30', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('218', null, '3', '2', null, '1', '2017-08-13 14:45:30', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('219', null, '9', '2', null, '1', '2017-08-13 14:45:30', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('220', null, '18', '2', null, '1', '2017-08-13 14:45:31', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('221', null, '25', '2', null, '1', '2017-08-13 14:45:31', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('222', null, '1', '2', null, '1', '2017-08-13 14:45:31', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('223', null, '7', '2', null, '1', '2017-08-13 14:45:32', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('224', null, '8', '2', null, '1', '2017-08-13 14:45:32', '1', '2017-08-13 14:48:00', '1');
INSERT INTO `sys_role_function` VALUES ('225', null, '16', '2', null, '1', '2017-08-13 14:48:00', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('226', null, '2', '2', null, '1', '2017-08-13 14:48:01', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('227', null, '10', '2', null, '1', '2017-08-13 14:48:01', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('228', null, '14', '2', null, '1', '2017-08-13 14:48:01', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('229', null, '5', '2', null, '1', '2017-08-13 14:48:02', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('230', null, '11', '2', null, '1', '2017-08-13 14:48:02', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('231', null, '15', '2', null, '1', '2017-08-13 14:48:02', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('232', null, '13', '2', null, '1', '2017-08-13 14:48:03', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('233', null, '21', '2', null, '1', '2017-08-13 14:48:03', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('234', null, '6', '2', null, '1', '2017-08-13 14:48:03', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('235', null, '17', '2', null, '1', '2017-08-13 14:48:04', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('236', null, '26', '2', null, '1', '2017-08-13 14:48:04', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('237', null, '23', '2', null, '1', '2017-08-13 14:48:04', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('238', null, '27', '2', null, '1', '2017-08-13 14:48:05', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('239', null, '20', '2', null, '1', '2017-08-13 14:48:05', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('240', null, '22', '2', null, '1', '2017-08-13 14:48:05', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('241', null, '25', '2', null, '1', '2017-08-13 14:48:06', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('242', null, '4', '2', null, '1', '2017-08-13 14:48:06', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('243', null, '24', '2', null, '1', '2017-08-13 14:48:06', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('244', null, '3', '2', null, '1', '2017-08-13 14:48:06', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('245', null, '9', '2', null, '1', '2017-08-13 14:48:07', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('246', null, '18', '2', null, '1', '2017-08-13 14:48:07', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('247', null, '1', '2', null, '1', '2017-08-13 14:48:07', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('248', null, '7', '2', null, '1', '2017-08-13 14:48:08', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('249', null, '8', '2', null, '1', '2017-08-13 14:48:08', '1', '2017-08-13 20:27:40', '1');
INSERT INTO `sys_role_function` VALUES ('250', null, '16', '2', null, '1', '2017-08-13 20:27:40', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('251', null, '2', '2', null, '1', '2017-08-13 20:27:41', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('252', null, '10', '2', null, '1', '2017-08-13 20:27:41', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('253', null, '14', '2', null, '1', '2017-08-13 20:27:41', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('254', null, '5', '2', null, '1', '2017-08-13 20:27:42', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('255', null, '11', '2', null, '1', '2017-08-13 20:27:42', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('256', null, '15', '2', null, '1', '2017-08-13 20:27:43', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('257', null, '13', '2', null, '1', '2017-08-13 20:27:43', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('258', null, '21', '2', null, '1', '2017-08-13 20:27:44', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('259', null, '6', '2', null, '1', '2017-08-13 20:27:44', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('260', null, '26', '2', null, '1', '2017-08-13 20:27:45', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('261', null, '17', '2', null, '1', '2017-08-13 20:27:45', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('262', null, '23', '2', null, '1', '2017-08-13 20:27:46', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('263', null, '27', '2', null, '1', '2017-08-13 20:27:46', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('264', null, '20', '2', null, '1', '2017-08-13 20:27:47', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('265', null, '22', '2', null, '1', '2017-08-13 20:27:47', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('266', null, '25', '2', null, '1', '2017-08-13 20:27:48', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('267', null, '4', '2', null, '1', '2017-08-13 20:27:48', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('268', null, '24', '2', null, '1', '2017-08-13 20:27:49', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('269', null, '3', '2', null, '1', '2017-08-13 20:27:49', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('270', null, '9', '2', null, '1', '2017-08-13 20:27:50', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('271', null, '18', '2', null, '1', '2017-08-13 20:27:50', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('272', null, '1', '2', null, '1', '2017-08-13 20:27:50', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('273', null, '7', '2', null, '1', '2017-08-13 20:27:51', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('274', null, '8', '2', null, '1', '2017-08-13 20:27:51', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('275', null, '28', '2', null, '1', '2017-08-13 20:27:52', '1', '2017-08-13 20:28:10', '1');
INSERT INTO `sys_role_function` VALUES ('276', null, '16', '2', null, '1', '2017-08-13 20:28:10', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('277', null, '2', '2', null, '1', '2017-08-13 20:28:10', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('278', null, '14', '2', null, '1', '2017-08-13 20:28:11', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('279', null, '10', '2', null, '1', '2017-08-13 20:28:11', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('280', null, '5', '2', null, '1', '2017-08-13 20:28:12', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('281', null, '15', '2', null, '1', '2017-08-13 20:28:12', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('282', null, '11', '2', null, '1', '2017-08-13 20:28:13', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('283', null, '13', '2', null, '1', '2017-08-13 20:28:13', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('284', null, '21', '2', null, '1', '2017-08-13 20:28:13', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('285', null, '6', '2', null, '1', '2017-08-13 20:28:14', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('286', null, '26', '2', null, '1', '2017-08-13 20:28:14', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('287', null, '23', '2', null, '1', '2017-08-13 20:28:15', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('288', null, '17', '2', null, '1', '2017-08-13 20:28:15', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('289', null, '27', '2', null, '1', '2017-08-13 20:28:16', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('290', null, '20', '2', null, '1', '2017-08-13 20:28:16', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('291', null, '25', '2', null, '1', '2017-08-13 20:28:17', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('292', null, '22', '2', null, '1', '2017-08-13 20:28:17', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('293', null, '4', '2', null, '1', '2017-08-13 20:28:17', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('294', null, '24', '2', null, '1', '2017-08-13 20:28:18', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('295', null, '3', '2', null, '1', '2017-08-13 20:28:18', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('296', null, '9', '2', null, '1', '2017-08-13 20:28:19', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('297', null, '18', '2', null, '1', '2017-08-13 20:28:19', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('298', null, '1', '2', null, '1', '2017-08-13 20:28:20', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('299', null, '7', '2', null, '1', '2017-08-13 20:28:20', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('300', null, '8', '2', null, '1', '2017-08-13 20:28:20', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('301', null, '28', '2', null, '1', '2017-08-13 20:28:21', '1', '2017-08-13 23:12:21', '1');
INSERT INTO `sys_role_function` VALUES ('302', null, '16', '2', null, '1', '2017-08-13 23:12:21', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('303', null, '2', '2', null, '1', '2017-08-13 23:12:21', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('304', null, '14', '2', null, '1', '2017-08-13 23:12:21', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('305', null, '10', '2', null, '1', '2017-08-13 23:12:21', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('306', null, '5', '2', null, '1', '2017-08-13 23:12:21', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('307', null, '11', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('308', null, '15', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('309', null, '13', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('310', null, '21', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('311', null, '6', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('312', null, '26', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('313', null, '17', '2', null, '1', '2017-08-13 23:12:22', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('314', null, '23', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('315', null, '27', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('316', null, '20', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('317', null, '25', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('318', null, '22', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('319', null, '4', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('320', null, '24', '2', null, '1', '2017-08-13 23:12:23', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('321', null, '29', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('322', null, '30', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('323', null, '3', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('324', null, '9', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('325', null, '18', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('326', null, '1', '2', null, '1', '2017-08-13 23:12:24', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('327', null, '7', '2', null, '1', '2017-08-13 23:12:25', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('328', null, '8', '2', null, '1', '2017-08-13 23:12:25', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('329', null, '28', '2', null, '1', '2017-08-13 23:12:25', '1', '2017-08-20 11:39:49', '1');
INSERT INTO `sys_role_function` VALUES ('330', null, '16', '2', null, '1', '2017-08-20 11:39:49', '1', '2017-08-20 11:39:49', '0');
INSERT INTO `sys_role_function` VALUES ('331', null, '2', '2', null, '1', '2017-08-20 11:39:49', '1', '2017-08-20 11:39:49', '0');
INSERT INTO `sys_role_function` VALUES ('332', null, '10', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('333', null, '14', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('334', null, '5', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('335', null, '15', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('336', null, '11', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('337', null, '13', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('338', null, '21', '2', null, '1', '2017-08-20 11:39:50', '1', '2017-08-20 11:39:50', '0');
INSERT INTO `sys_role_function` VALUES ('339', null, '6', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('340', null, '26', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('341', null, '23', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('342', null, '17', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('343', null, '27', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('344', null, '20', '2', null, '1', '2017-08-20 11:39:51', '1', '2017-08-20 11:39:51', '0');
INSERT INTO `sys_role_function` VALUES ('345', null, '22', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('346', null, '25', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('347', null, '4', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('348', null, '24', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('349', null, '31', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('350', null, '33', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('351', null, '32', '2', null, '1', '2017-08-20 11:39:52', '1', '2017-08-20 11:39:52', '0');
INSERT INTO `sys_role_function` VALUES ('352', null, '29', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('353', null, '30', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('354', null, '3', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('355', null, '9', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('356', null, '18', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('357', null, '1', '2', null, '1', '2017-08-20 11:39:53', '1', '2017-08-20 11:39:53', '0');
INSERT INTO `sys_role_function` VALUES ('358', null, '7', '2', null, '1', '2017-08-20 11:39:54', '1', '2017-08-20 11:39:54', '0');
INSERT INTO `sys_role_function` VALUES ('359', null, '8', '2', null, '1', '2017-08-20 11:39:54', '1', '2017-08-20 11:39:54', '0');
INSERT INTO `sys_role_function` VALUES ('360', null, '28', '2', null, '1', '2017-08-20 11:39:54', '1', '2017-08-20 11:39:54', '0');

-- ----------------------------
-- Table structure for sys_timetask
-- ----------------------------
DROP TABLE IF EXISTS `sys_timetask`;
CREATE TABLE `sys_timetask` (
  `task_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '任务Id',
  `cron_expression` varchar(100) NOT NULL COMMENT 'cron表达式',
  `is_effect` varchar(1) NOT NULL COMMENT '是否生效 0/未生效,1/生效',
  `is_start` varchar(1) NOT NULL COMMENT '是否运行0停止,1运行',
  `task_describe` varchar(50) NOT NULL COMMENT '任务描述',
  `task_code` varchar(100) NOT NULL COMMENT '任务ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

-- ----------------------------
-- Records of sys_timetask
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(128) NOT NULL COMMENT '用户账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(50) NOT NULL COMMENT '真实名字',
  `signature` blob COMMENT '签名',
  `status` smallint(6) NOT NULL COMMENT '有效状态 1-待审核 2-审核通过 3-审核未通过',
  `user_key` varchar(200) DEFAULT NULL COMMENT '用户KEY',
  `telephone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `office_phone` varchar(32) DEFAULT NULL COMMENT '办公电话',
  `email` varchar(128) DEFAULT NULL COMMENT '常用邮箱',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'c44b01947c9e6e3f', 'admin', null, '1', 'c44b01947c9e6e3f', 'test23', 'test1', 'tttt', '1', '2017-05-30 09:49:14', '1', '2017-07-18 23:27:39', '0');
INSERT INTO `sys_user` VALUES ('2', 'root', 'admin_123', '马泽国', null, '1', '402881e75d44144e015d44144e250000', '', '', '', '1', '2017-07-15 10:29:23', '1', '2017-07-15 11:26:35', '1');
INSERT INTO `sys_user` VALUES ('3', 'zhangsan', 'admin_123', 'zhangsan', null, '1', '402881e75d442f83015d442f83a60000', 'asdasd', '1212123', '1asdasdasd', '1', '2017-07-15 10:59:06', '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user` VALUES ('4', 'lisi', 'ed92a1998ca27c3f', '李四', null, '1', '402881e75d4445f4015d4445f4640000', '12asdasd', 'dsadasd12', 'assssss', '1', '2017-07-15 11:23:37', '1', '2017-07-15 11:40:08', '1');
INSERT INTO `sys_user` VALUES ('5', 'mazeguo', '01ea1eca410ae15b', 'mazeguo', null, '1', '402881e75d444924015d4449242e0000', '189103212121ffff', '189103212121111fff', '189103212121@jd.comfff', '1', '2017-07-15 11:27:06', '1', '2017-07-17 09:06:38', '0');
INSERT INTO `sys_user` VALUES ('6', 'lisi', 'd4753d2caed3ee0d', 'lisi', null, '1', '402881e75d44557c015d44557cac0000', '123123', '1231231231231', '32222222', '1', '2017-07-15 11:40:35', '1', '2017-07-17 09:06:35', '1');
INSERT INTO `sys_user` VALUES ('7', 'test', '38ccd485060382e4', '测试人员', null, '1', '402881e65d564f7b015d564f7bef0000', '', '', '', '1', '2017-07-18 23:27:14', '1', '2017-07-18 23:27:31', '0');

-- ----------------------------
-- Table structure for sys_user_data_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_data_right`;
CREATE TABLE `sys_user_data_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户数据权限Id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `data_type` int(11) NOT NULL DEFAULT '3' COMMENT '权限类型 1-全部数据权限 2-部分用户数据权限 3-仅能看自己的数据',
  `data_user_ids` varchar(256) DEFAULT NULL COMMENT '有权限查看的用户Id',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`),
  KEY `idx_data_right_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of sys_user_data_right
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart` (
  `user_dept_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户与部门关系id',
  `user_id` int(32) DEFAULT NULL COMMENT '用户id',
  `dept_id` int(32) DEFAULT NULL COMMENT '部门id',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`user_dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户与部门关系表';

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('1', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('2', '2', '1', '1', null, '1', '2017-07-15 11:26:35', '1');
INSERT INTO `sys_user_depart` VALUES ('3', '2', '1', '1', null, '1', '2017-07-15 11:26:35', '1');
INSERT INTO `sys_user_depart` VALUES ('4', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('5', '3', null, '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('6', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('7', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('8', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('9', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('10', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('11', '3', '1', '1', null, '1', '2017-07-15 11:26:14', '1');
INSERT INTO `sys_user_depart` VALUES ('12', '4', '1', '1', null, '1', '2017-07-15 11:40:08', '1');
INSERT INTO `sys_user_depart` VALUES ('13', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('14', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('15', '6', '1', '1', null, '1', '2017-07-17 09:06:35', '1');
INSERT INTO `sys_user_depart` VALUES ('16', '6', '1', '1', null, '1', '2017-07-17 09:06:35', '1');
INSERT INTO `sys_user_depart` VALUES ('17', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('18', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('19', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('20', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('21', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('22', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('23', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('24', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('25', '5', '1', '1', null, '1', '2017-07-16 11:54:44', '1');
INSERT INTO `sys_user_depart` VALUES ('26', '5', '1', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('27', '1', '1', '1', null, '1', '2017-07-18 23:27:39', '1');
INSERT INTO `sys_user_depart` VALUES ('28', '7', '1', '1', null, '1', '2017-07-18 23:27:31', '1');
INSERT INTO `sys_user_depart` VALUES ('29', '7', '1', '1', null, '1', '2017-07-18 23:27:31', '1');
INSERT INTO `sys_user_depart` VALUES ('30', '7', '1', '1', null, '1', '2017-07-18 23:27:31', '1');
INSERT INTO `sys_user_depart` VALUES ('31', '7', '1', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('32', '1', '1', '1', null, '1', null, '0');

-- ----------------------------
-- Table structure for tb_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `a_code` varchar(500) DEFAULT NULL COMMENT '甲方合同编码',
  `b_code` varchar(500) DEFAULT NULL COMMENT '乙方合同编号',
  `type` int(11) DEFAULT NULL COMMENT '合同类型（1-采购合同，2-销售合同）',
  `c_id` int(11) DEFAULT NULL COMMENT '客户名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `is_cash_back` int(1) DEFAULT NULL COMMENT '是否汇款\r\n1：是\r\n2：否',
  `cash_back_price` double DEFAULT NULL COMMENT '回款金额',
  `cash_back_date` date DEFAULT NULL COMMENT '回款时间',
  `is_send_goods` int(1) DEFAULT NULL COMMENT '是否发货\r\n1：已发货\r\n2：未发货',
  `send_goods_date` date DEFAULT NULL COMMENT '发货时间',
  `is_open_invoice` int(1) DEFAULT NULL COMMENT '是否开发票\r\n1：已开\r\n2：未开',
  `open_invoice_date` date DEFAULT NULL COMMENT '开票时间',
  `note` varchar(500) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL COMMENT '创建人(当前登录用户ID)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人（当前登录用户ID）',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Records of tb_contract
-- ----------------------------
INSERT INTO `tb_contract` VALUES ('21', 'a1', 'b1', '0', '2', '111', '0', null, null, '0', null, null, null, null, null, null, null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('22', 'a2', 'b2', '1', '3', '111', '1', '5555555', '2017-07-03', '1', '2017-07-02', '1', '2017-07-02', null, null, null, '1', '2017-07-13 10:34:25', '0', null);
INSERT INTO `tb_contract` VALUES ('23', 'a3', 'b3', '0', '6', '111', '1', '2322323', '2017-07-03', '1', '2017-07-01', '0', null, null, null, null, '1', '2017-07-12 23:37:28', '0', null);
INSERT INTO `tb_contract` VALUES ('24', 'a4', 'b4', '0', '20', '1111', '1', null, null, '1', null, '1', null, null, null, null, '1', '2017-06-29 16:26:26', '0', null);
INSERT INTO `tb_contract` VALUES ('25', 'a14', 'b4', '0', '20', '1111', '1', null, null, '1', null, '1', null, null, null, '2017-06-28 18:50:02', '1', '2017-06-29 18:24:57', '1', null);
INSERT INTO `tb_contract` VALUES ('26', 'a5', 'b5', '0', '29', '5555555555', '1', null, null, '1', null, '1', null, null, '1', '2017-06-28 23:49:20', '1', '2017-06-29 18:00:40', '1', null);
INSERT INTO `tb_contract` VALUES ('27', 'a6', 'b6', '1', '23', '55555', '1', null, null, '1', null, '1', null, null, '1', '2017-06-29 11:41:10', '1', '2017-06-29 17:08:29', '1', null);
INSERT INTO `tb_contract` VALUES ('28', 'a55', 'b55', '1', '23', '3333333333333', '1', null, null, '1', null, '1', null, null, '1', '2017-06-29 18:25:23', '1', '2017-07-11 19:35:40', '1', null);
INSERT INTO `tb_contract` VALUES ('29', 'a7', 'b7', '0', '29', '5.555555555555555e16', '1', '333333333333', '2017-07-10', '1', '2017-07-01', '1', '2017-07-02', null, '1', '2017-06-30 14:15:22', '1', '2017-07-12 23:37:03', '1', null);
INSERT INTO `tb_contract` VALUES ('30', 'a8', 'b8', '0', '37', '3233432432', '0', null, null, '0', null, '0', null, null, '1', '2017-07-12 23:25:46', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('31', 'a9', 'b9', '0', '37', '22222222222', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 14:41:47', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('32', 'a10', 'b10', '1', '31', '55555555555', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 18:16:35', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('33', 'a11', 'b11', '0', '24', '233242424', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:00:09', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('34', 'a12', 'b12', '0', '24', '333333', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:03:18', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('35', 'a13', 'b13', '0', '24', '444444444444', '0', '0', null, '0', null, '0', null, null, '1', '2017-07-15 21:13:46', '1', '2017-07-15 21:14:23', '0', '69');
INSERT INTO `tb_contract` VALUES ('36', 'a14', 'b14', '0', '37', '6666666666666', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:15:15', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('37', 'a15', 'b15', '0', '31', '77777777777', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:17:41', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('38', 'a16', 'b16', '0', '31', '7777777777', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:18:50', null, null, '0', '73');
INSERT INTO `tb_contract` VALUES ('39', 'a17', 'b17', '0', '37', '4444444444', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:27:13', null, null, '0', '74');
INSERT INTO `tb_contract` VALUES ('40', 'a18', 'b18', '0', '37', '33333', '0', null, null, '0', null, '0', null, null, '1', '2017-07-15 21:38:46', null, null, '0', '78,79,80,81');
INSERT INTO `tb_contract` VALUES ('41', 'saasda', 'asdasdasdasdasd', '0', '31', '12312312', '1', '123', '2017-07-12', '1', '2017-07-13', '1', '2017-07-13', null, '1', '2017-07-16 16:24:00', '1', '2017-07-16 16:25:06', '1', '103,104');
INSERT INTO `tb_contract` VALUES ('42', 'a19', 'b19', '0', '34', '333333333', '0', null, null, '0', null, '0', null, null, '1', '2017-07-16 19:48:35', null, null, '0', '110');
INSERT INTO `tb_contract` VALUES ('43', 'eee', 'ccc', '0', '37', '1111', '0', null, null, '0', null, '0', null, null, '1', '2017-07-17 08:51:34', null, null, '0', '120');
INSERT INTO `tb_contract` VALUES ('44', 'a11', 'bqq', '0', '23', '33333333333333', '0', null, null, '0', null, '0', null, null, '1', '2017-07-17 17:37:33', null, null, '0', '125,126');
INSERT INTO `tb_contract` VALUES ('45', 'a13', 'b13', '0', '37', '666666', '0', '0', null, '0', null, '0', null, '', '1', '2017-07-17 17:55:47', '1', '2017-07-20 23:26:09', '0', '127,128');
INSERT INTO `tb_contract` VALUES ('46', 'a20', 'b20', '0', '49', '222222222222222', '0', '0', null, '0', null, '0', null, '备注新建，rewreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '1', '2017-07-20 23:03:14', '1', '2017-07-20 23:27:13', '0', '137');
INSERT INTO `tb_contract` VALUES ('47', 'sdfsdfs', 'sssssssdf', '0', '46', '12312', '0', null, null, '0', null, '0', null, '12312312', '1', '2017-08-02 00:21:44', null, null, '0', '140');
INSERT INTO `tb_contract` VALUES ('48', 'asdasd', 'asdasdasdasd', '0', '47', '1212', '0', null, null, '0', null, '0', null, 'asdasd', '1', '2017-08-22 07:22:36', null, null, '0', null);

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `c_code` varchar(500) DEFAULT NULL COMMENT '客户编码',
  `c_name` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
  `pay_acct` varchar(100) DEFAULT NULL COMMENT '付款账号',
  `service_engineer` varchar(100) DEFAULT NULL COMMENT '服务工程师',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(1000) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `tax_num` varchar(200) DEFAULT NULL COMMENT '税号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', null, 'admin', 'admin', null, '1', 'xxxxx', null, null, null, null, '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0', null);
INSERT INTO `tb_customer` VALUES ('2', null, 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', null, '2017-06-20 23:00:59', null, '2017-06-20 23:00:59', '0', null);
INSERT INTO `tb_customer` VALUES ('3', null, 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', 'asasdasd', null, '2017-06-20 23:01:25', null, '2017-06-20 23:01:25', '0', null);
INSERT INTO `tb_customer` VALUES ('4', null, 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', null, '2017-06-20 23:09:14', null, '2017-06-20 23:09:14', '0', null);
INSERT INTO `tb_customer` VALUES ('5', null, 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', null, '2017-06-20 23:09:15', null, '2017-06-20 23:09:15', '0', null);
INSERT INTO `tb_customer` VALUES ('6', null, 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', 'sdfsss', null, '2017-06-20 23:09:16', '1', '2017-06-26 23:58:05', '1', null);
INSERT INTO `tb_customer` VALUES ('7', null, 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', null, '2017-06-20 23:12:10', '1', '2017-06-26 23:58:00', '1', null);
INSERT INTO `tb_customer` VALUES ('8', null, 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', 'sdfdsss', null, '2017-06-20 23:12:50', null, '2017-06-20 23:12:50', '0', null);
INSERT INTO `tb_customer` VALUES ('9', null, 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', 'dsfsdfs', null, '2017-06-20 23:13:39', '1', '2017-06-26 23:57:57', '1', null);
INSERT INTO `tb_customer` VALUES ('10', null, 'sdfsdfsd', 'sdfsdfsd', 'sdfsdfsd', '1', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdfsd', null, '2017-06-20 23:14:56', '1', '2017-06-26 23:57:35', '0', null);
INSERT INTO `tb_customer` VALUES ('11', null, 'sdfs', 'sdfs', 'sdfsdf', '1', 'sdf', 'asfsdfsdf', 'dfsdf', 'sdf', 'sdf', null, '2017-06-20 23:19:05', '1', '2017-06-26 23:57:28', '0', null);
INSERT INTO `tb_customer` VALUES ('12', null, 'test', 'test', 'test', '1', 'test', 'test', 'test', 'test', 'test', null, '2017-06-20 23:23:15', '1', '2017-06-26 23:57:23', '0', null);
INSERT INTO `tb_customer` VALUES ('13', null, 'aasfdssss', 'afda', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'asf', 'sdfsdf', 'sdfsdf', 'sdfsdf', null, '2017-06-20 23:23:54', '1', '2017-06-25 22:14:24', '1', null);
INSERT INTO `tb_customer` VALUES ('14', null, 'sdfsfsdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdfsdf', 'sdfsdf', 'sdf', 'sdfs', null, '2017-06-20 23:25:39', '1', '2017-06-25 21:51:00', '1', null);
INSERT INTO `tb_customer` VALUES ('15', null, 'sdfddfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', null, '2017-06-20 23:27:48', '1', '2017-06-25 21:50:41', '1', null);
INSERT INTO `tb_customer` VALUES ('16', 'FSKH1498400043718', 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', 'sdfsdf', 'sdfsdfs', 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', '2017-06-25 22:14:05', '1', '2017-06-26 23:57:17', '0', null);
INSERT INTO `tb_customer` VALUES ('17', 'FSKH1498400057263', 'asdasd', 'asd', 'asd', '1', 'asdasd', 'asd', 'asda', 'asd', 'asd', '1', '2017-06-25 22:14:19', '1', '2017-06-26 23:53:59', '0', null);
INSERT INTO `tb_customer` VALUES ('18', 'FSKH1498492319605', 'dfsd', 'sdf', 'sdf', '1', 'sdfsdf', 'sdfsdf', 'sdf', 'sdf', 'sdf', '1', '2017-06-26 23:52:01', '1', '2017-06-26 23:52:24', '0', null);
INSERT INTO `tb_customer` VALUES ('19', 'FSKH1498492668726', 'dsfsdf', 'sdfsdf', 'sdfsdf', '1', 'sdfsdf', 'sdfsdfs', 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', '2017-06-26 23:57:50', '1', '2017-06-26 23:57:50', '0', null);
INSERT INTO `tb_customer` VALUES ('20', 'FSKH1498493665078', '北京xxxx公司', '北京市海淀区', '张三', '1', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-06-27 00:14:27', '1', '2017-06-27 00:23:38', '0', null);
INSERT INTO `tb_customer` VALUES ('21', 'FSKH1498493753321', '北京xxxx公司', '北京市海淀区', '张三', '1', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-06-27 00:15:55', '1', '2017-06-27 00:23:33', '0', null);
INSERT INTO `tb_customer` VALUES ('22', 'FSKH1498494170184', 'testA', 'testA2', 'testA4', '1', 'testA7', 'testA1', 'testA3', 'testA5', 'testA6', '1', '2017-06-27 00:22:52', '1', '2017-06-27 00:22:52', '0', null);
INSERT INTO `tb_customer` VALUES ('23', 'FSKH1498494191424', 'testB', 'testB2', 'testB4', '1', 'testB8', 'testB1', 'testB3', 'testB5', 'testB7', '1', '2017-06-27 00:23:13', '1', '2017-06-27 00:23:25', '0', null);
INSERT INTO `tb_customer` VALUES ('24', 'FSKH1498494452291', 'dfssss', '', '', '1', '', '', '', '', '', '1', '2017-06-27 00:27:34', '1', '2017-06-27 00:27:34', '0', null);
INSERT INTO `tb_customer` VALUES ('25', 'FSKH1498494502559', 'sdfsdf', '', '', '1', '', '', '', '', '', '1', '2017-06-27 00:28:24', '1', '2017-06-28 08:35:54', '1', null);
INSERT INTO `tb_customer` VALUES ('26', 'FSKH1498494669081', 'ASDASD', 'ASDASD', 'asdASD', '1', '', 'ASD', 'ASDASD', 'asAASDASD', '', '1', '2017-06-27 00:31:11', '1', '2017-06-27 14:46:18', '1', null);
INSERT INTO `tb_customer` VALUES ('27', 'FSKH1498610103331', '中央电视大学', '张女士', '222222', '1', 'ui@163.com', '河北省石家庄市桥西区', '1111111', '33333333', '00000', '1', '2017-06-28 08:35:03', '1', '2017-06-28 08:35:25', '1', null);
INSERT INTO `tb_customer` VALUES ('28', 'FSKH1498610232620', '北京xxxx公司', '北京市海淀区', '张三', '1', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-06-28 08:37:12', '1', '2017-07-08 13:44:44', '1', null);
INSERT INTO `tb_customer` VALUES ('29', 'FSKH1498610232679', '北京xxxx公司', '北京市海淀区', '张三', '1', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-06-28 08:37:12', '1', '2017-07-08 13:44:40', '1', null);
INSERT INTO `tb_customer` VALUES ('30', 'FSKH1498611701291', 'mhkkk', '1122', '111111', '1', '', 'ddd', '1111', '1111', '', '1', '2017-06-28 09:01:41', '1', '2017-06-28 23:35:07', '1', null);
INSERT INTO `tb_customer` VALUES ('31', 'FSKH1498619669888', '快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快快', '一二三四五六七八九十', '一二三四五六七八九十', '1', '一二三四五六七八九十', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', '一二三四五六七八九十', '一二三四五六七八九十', '一二三四五坎坎坷坷六七八九十', '1', '2017-06-28 11:14:29', '1', '2017-06-28 23:17:31', '0', null);
INSERT INTO `tb_customer` VALUES ('32', 'FSKH1498664094956', '北京xxxx公司1', 'asdasd', 'asdas', '1', '', 'asasd', 'asdasd', 'asdasd', 'asdasd', '1', '2017-06-28 23:34:54', '1', '2017-07-08 21:17:30', '1', null);
INSERT INTO `tb_customer` VALUES ('33', 'FSKH1498782836545', 'kkkl', 'mm', 'kkkk', '1', '', 'kkkkkk', 'kkk', '988998', '', '1', '2017-06-30 08:33:56', '1', '2017-06-30 08:34:33', '1', null);
INSERT INTO `tb_customer` VALUES ('34', 'FSKH1499491411542', 'sdfsdfs', 'asdasd', 'asdasd', '1', 'asdasd', 'sdfsdf', 'asda', 'asdasd', 'asdasd', '1', '2017-07-08 13:23:32', '1', '2017-07-17 09:01:04', '1', null);
INSERT INTO `tb_customer` VALUES ('35', 'FSKH1499491435780', '北京xxxx公司', '北京市海淀区', '张三', '1', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-08 13:23:56', '1', '2017-07-08 21:17:24', '1', null);
INSERT INTO `tb_customer` VALUES ('36', 'FSKH1499492633370', '北京火锅店1', '张三2', '121213123123123123123123123111', '1', '12312312312312', '北京市朝阳区北辰西路北辰世纪中心A座', '1891011000003', '123123123123123123123123222', '12312312323', '1', '2017-07-08 13:43:54', '1', '2017-07-08 21:17:19', '1', null);
INSERT INTO `tb_customer` VALUES ('37', 'FSKH1499524455414', '北京xxxx公司12', '北京市海淀区', '张三', '1', '2312312312312', '1.010101E7', '李四', '1212', '121312', '1', '2017-07-08 22:34:15', '1', '2017-07-08 22:34:39', '0', null);
INSERT INTO `tb_customer` VALUES ('38', 'FSKH1499702255774', 'asdasdasd', 'asdasd', 'asdasd', '1', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '1', '2017-07-10 23:57:33', '1', '2017-07-10 23:57:33', '0', null);
INSERT INTO `tb_customer` VALUES ('39', 'FSKH1500390085651', '潞安新疆煤化工（集团）有限公司供应处', '杨春蓉', null, '管理员', null, '新疆哈密市三道岭', '1.8690221812E10', null, null, '1', '2017-07-18 23:01:24', '1', '2017-07-18 23:01:24', '0', null);
INSERT INTO `tb_customer` VALUES ('40', 'FSKH1500390085902', '中石油管道联合有限公司西部分公司甘肃输油气分公司', '马玉新', null, '管理员', null, '甘肃省兰州市城关区张掖路1号保利大厦', '1.55696219E10', null, null, '1', '2017-07-18 23:01:24', '1', '2017-07-18 23:01:24', '0', null);
INSERT INTO `tb_customer` VALUES ('41', 'FSKH1500390086162', '河北华澳矿业开发有限公司', '赵淑敏', null, '管理员', null, '河北省张家口市明德南路25号5层', '0313381807', null, null, '1', '2017-07-18 23:01:25', '1', '2017-07-18 23:01:25', '0', null);
INSERT INTO `tb_customer` VALUES ('42', 'FSKH1500390086409', '潞安新疆煤化工（集团）砂墩子矿', '张四星', null, '管理员', null, '新疆哈密市三道岭', '1.356519966E10', null, null, '1', '2017-07-18 23:01:25', '1', '2017-07-18 23:01:25', '0', null);
INSERT INTO `tb_customer` VALUES ('43', 'FSKH1500390086649', '北京京港地铁有限公司', '李荣智', null, '管理员', null, '北京市朝阳区', '8.8646951E7', null, null, '1', '2017-07-18 23:01:25', '1', '2017-07-18 23:01:25', '0', null);
INSERT INTO `tb_customer` VALUES ('44', 'FSKH1500390180665', '诺博橡胶制品有限公司', '王建达', null, '管理员', null, '河北省保定市徐水县大王店产业园区', null, null, null, '1', '2017-07-18 23:02:59', '1', '2017-07-18 23:02:59', '0', null);
INSERT INTO `tb_customer` VALUES ('45', 'FSKH1500390184472', '长城汽车股份有限公司天津哈弗分公司', '龙晓晨', null, '管理员', null, '天津市开发区西区南大街105号', '1.8722618499E10', null, null, '1', '2017-07-18 23:03:03', '1', '2017-07-18 23:03:03', '0', null);
INSERT INTO `tb_customer` VALUES ('46', 'FSKH1500390184724', '中煤北京煤矿机械厂', '杨立湘', null, '管理员', null, '北京市房山区云岗', '1.362129371E10', null, null, '1', '2017-07-18 23:03:03', '1', '2017-07-18 23:03:03', '0', null);
INSERT INTO `tb_customer` VALUES ('47', 'FSKH1500390184987', '中石油管道联合有限公司西部分公司', '陈曦', null, '管理员', null, '乌鲁木齐市天津北路西五巷99号中国石油乌鲁木齐大厦22层', '09917561556', null, null, '1', '2017-07-18 23:03:03', '1', '2017-07-18 23:03:03', '0', null);
INSERT INTO `tb_customer` VALUES ('48', 'FSKH1500390325713', '山西潞安环能开发股份有限公司', null, null, '管理员', null, '山西省长治市城北东街65号', null, null, null, '1', '2017-07-18 23:05:24', '1', '2017-07-18 23:05:24', '0', null);
INSERT INTO `tb_customer` VALUES ('49', 'FSKH1500390325982', '中石油京唐液化天然气有限公司', null, null, '管理员', null, '河北省唐山市曹妃甸京唐港', null, null, null, '1', '2017-07-18 23:05:24', '1', '2017-08-02 00:13:28', '1', null);
INSERT INTO `tb_customer` VALUES ('50', 'FSKH1501603956926', 'test_123a', '12312a', '123123d', '7', '123123sd', 'test_123test_123test_123s', '123123g', '123123e', '123123f', '1', '2017-08-02 00:12:36', '1', '2017-08-02 00:13:16', '0', null);
INSERT INTO `tb_customer` VALUES ('51', 'FSKH1503356296157', ' ', null, null, '1', null, null, null, null, null, '1', '2017-08-22 06:58:15', '1', '2017-09-24 13:26:42', '1', null);
INSERT INTO `tb_customer` VALUES ('52', 'FSKH1503356296212', ' ', null, null, '1', null, null, null, null, null, '1', '2017-08-22 06:58:15', '1', '2017-09-24 13:26:38', '1', null);
INSERT INTO `tb_customer` VALUES ('53', 'FSKH1503356636877', 'xxx', '12345.0', null, '1', '3.0', 'xxx', '1234456.0', null, '1.0', '1', '2017-08-22 07:03:56', '1', '2017-08-22 07:03:56', '0', null);
INSERT INTO `tb_customer` VALUES ('54', 'FSKH1506233312911', '22222222222222', '', '', '7', '', '', '', '', '', '1', '2017-09-24 14:08:30', '1', '2017-09-24 20:34:27', '1', null);
INSERT INTO `tb_customer` VALUES ('55', 'FSKH1506256143941', 'A公司', '张三', '30101010', '1', '10101001', '通州区', '189100100001', '20101010', '010-101001', '1', '2017-09-24 20:29:01', '1', '2017-09-24 20:29:01', '0', null);
INSERT INTO `tb_customer` VALUES ('56', 'FSKH1506256144524', 'B公司', '张三', '30101010', '1', '10101001', '海淀区', '189100100001', '20101010', '010-101001', '1', '2017-09-24 20:29:01', '1', '2017-09-24 20:29:01', '0', null);
INSERT INTO `tb_customer` VALUES ('57', 'FSKH1506256144790', 'C公司', null, null, '1', null, '朝阳区', null, null, null, '1', '2017-09-24 20:29:01', '1', '2017-09-24 20:29:01', '0', null);

-- ----------------------------
-- Table structure for tb_equipment
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipment`;
CREATE TABLE `tb_equipment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `e_code` varchar(500) DEFAULT NULL COMMENT '设备编码',
  `e_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `e_model` varchar(100) DEFAULT NULL COMMENT '设备型号',
  `motor_brand` varchar(100) DEFAULT NULL COMMENT '电机厂牌',
  `make_num` varchar(100) DEFAULT NULL COMMENT '制造号码',
  `make_date` varchar(100) DEFAULT NULL COMMENT '制造日期',
  `elec_pan_model` varchar(100) DEFAULT NULL COMMENT '电控盘型号',
  `motor_make_date` date DEFAULT NULL COMMENT '电机制造日期',
  `machinery_number` varchar(128) DEFAULT NULL COMMENT '电机出厂编号',
  `motor_model` varchar(128) DEFAULT NULL COMMENT '电机型号',
  `debug_date` date DEFAULT NULL COMMENT '调试日期',
  `regular_check` int(1) DEFAULT NULL COMMENT '0-不定期检测 1-定期检测',
  `check_months` int(5) DEFAULT NULL COMMENT '间隔月数',
  `host_num` varchar(100) DEFAULT NULL COMMENT '现主机号码',
  `old_host_num` varchar(100) DEFAULT NULL COMMENT '原主机号码',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='设备表';

-- ----------------------------
-- Records of tb_equipment
-- ----------------------------
INSERT INTO `tb_equipment` VALUES ('1', 'BH1498577386925', null, '24', '秦天柱1', '赛博坦1', '01', null, '011', '2017-06-09', null, null, null, null, null, '1881', null, '1', '                	                	                	                	        战斗机       1 	\n                \n                \n                \n                \n                ', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('2', 'BH1498663807019', null, '30', '111', '2222', '11111111', null, '11111111', '2017-05-03', null, null, '2017-05-30', '0', '3', '333', '333', '1', '                	                	                	1234\n                \n                \n                ', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('3', 'BH1498663979513', null, '29', '3333', '333', '2222222', null, '22222', '2017-05-29', null, null, '2017-05-29', '1', null, '44444', '4444444444', '1', '                	2322\n                ', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('4', 'BH1498664462573', null, '31', '2222', '2222', '222', null, '222', '2017-05-29', null, null, '2017-05-30', null, null, '222', '222', '1', '                	\n                ', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('5', 'BH1498665147569', null, '31', '4', '44', '44', null, '444', '2017-05-29', null, null, '2017-05-30', '1', '2', '444', '444', '1', '                	\n                123', null, '1', null, '0', null);
INSERT INTO `tb_equipment` VALUES ('6', null, null, null, 'xxx', 'xxx', '1234.0', null, '123.0', '2017-01-01', null, null, null, '1', '3', '12345.0', '1234456.0', '1', '记录点什么', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('7', null, null, '24', 'xxx', 'xxx', '1234.0', null, '123.0', '2017-01-01', null, null, null, '1', '3', '12345.0', '1234456.0', '1', '记录点什么', null, '1', null, '1', null);
INSERT INTO `tb_equipment` VALUES ('8', 'BH1498749511868', null, '28', 'xxx', 'xxx', '1234.0', null, '123.0', '2017-01-01', null, null, null, '1', '3', '12345.0', '1234456.0', '1', '记录点什么', null, '1', null, '0', null);
INSERT INTO `tb_equipment` VALUES ('9', 'BH1499504322704', null, null, 'sdfsdf', 'sdfsdf', 'sdfsdf', null, 'sdfsdf', '2017-07-20', null, null, null, '1', '1', 'sdfsdf', 'sdfsdf', '1', 'sdfsdf', null, '1', null, '0', null);
INSERT INTO `tb_equipment` VALUES ('10', 'BH1499504447559', null, null, 'test', 'test', 'tttt', null, 'test', '2017-07-20', null, null, null, '1', '1', 'test', 'test', '1', 'testsdfsdf', null, '1', null, '0', null);
INSERT INTO `tb_equipment` VALUES ('11', 'FSEQ1499508779505', null, '36', 'testA设备A', '点击厂牌', '制造编号B', null, '点击控盘型号', '2017-07-18', null, null, null, '1', '2', '主机号码4', '主机号码4', '1', '    测试备注    ', '2017-07-08 18:13:01', '1', '2017-07-08 18:13:01', '0', null);
INSERT INTO `tb_equipment` VALUES ('12', 'FSEQ1499510034851', null, '36', '设备1', '佳能1', 'XY2019-10-12', null, '光电1', '2017-01-01', null, null, null, '1', '2', 'XY20170201', 'XY20170801', '1', '测试1', '2017-07-08 18:33:55', '1', '2017-07-08 18:33:55', '0', null);
INSERT INTO `tb_equipment` VALUES ('13', 'FSEQ1499510035001', null, '36', '设备2', '佳能2', 'XY2019-10-13', null, '光电2', '2017-01-02', null, null, null, '1', '3', 'XY20170202', 'XY20170802', '1', '测试2', '2017-07-08 18:33:55', '1', '2017-07-08 18:33:55', '0', null);
INSERT INTO `tb_equipment` VALUES ('14', 'FSEQ1499510035148', null, '36', '设备3', '佳能3', 'XY2019-10-14', null, '光电3', '2017-01-03', null, null, null, '1', '1', 'XY20170203', 'XY20170203', '1', ' 测试3 ', '2017-07-08 18:33:55', '1', '2017-07-08 18:33:55', '0', null);
INSERT INTO `tb_equipment` VALUES ('15', 'FSEQ1499510035296', null, '36', '设备4', '佳能4', 'XY2019-10-15', null, '光电4', '2017-01-04', null, null, null, '1', '2', 'XY20170204', 'XY20170804', '1', '测试4', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('16', 'FSEQ1499510035446', null, '36', '设备5', '佳能5', 'XY2019-10-16', null, '光电5', '2017-01-05', null, null, null, '0', '3', 'XY20170205', 'XY20170805', '1', '测试5', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('17', 'FSEQ1499510035600', null, '36', '设备6', '佳能6', 'XY2019-10-17', null, '光电6', '2017-01-06', null, null, null, '1', '1', 'XY20170206', 'XY20170806', '1', '测试6', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('18', 'FSEQ1499510035758', null, '36', '设备7', '佳能7', 'XY2019-10-18', null, '光电7', '2017-01-07', null, null, null, '0', '2', 'XY20170207', 'XY20170207', '1', ' 测试7 ', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('19', 'FSEQ1499510035909', null, '36', '设备8', '佳能8', 'XY2019-10-19', null, '光电8', '2017-01-08', null, null, null, '1', '3', 'XY20170208', 'XY20170808', '1', '测试8', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('20', 'FSEQ1499510036062', null, '36', '设备9', '佳能9', 'XY2019-10-20', null, '光电9', '2017-01-09', null, null, null, '0', '1', 'XY20170209', 'XY20170209', '1', ' 测试9 ', '2017-07-08 18:33:56', '1', '2017-07-08 18:33:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('21', 'FSEQ1499510241206', null, '32', '设备1', '佳能1', 'XY2019-10-12', null, '光电1', '2017-01-01', null, null, null, '1', '2', 'XY20170201', 'XY20170801', '1', '测试1', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('22', 'FSEQ1499510241362', null, '32', '设备2', '佳能2', 'XY2019-10-13', null, '光电2', '2017-01-02', null, null, null, '1', '3', 'XY20170202', 'XY20170802', '1', '测试2', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('23', 'FSEQ1499510241516', null, '32', '设备3', '佳能3', 'XY2019-10-14', null, '光电3', '2017-01-03', null, null, null, '1', '1', 'XY20170203', 'XY20170803', '1', '测试3', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('24', 'FSEQ1499510241673', null, '32', '设备4', '佳能4', 'XY2019-10-15', null, '光电4', '2017-01-04', null, null, null, '1', '2', 'XY20170204', 'XY20170804', '1', '测试4', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '1', null);
INSERT INTO `tb_equipment` VALUES ('25', 'FSEQ1499510241822', null, '32', '设备5', '佳能5', 'XY2019-10-16', null, '光电5', '2017-01-05', null, null, null, '0', '3', 'XY20170205', 'XY20170805', '1', '测试5', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('26', 'FSEQ1499510241974', null, '32', '设备6', '佳能6', 'XY2019-10-17', null, '光电6', '2017-01-06', null, null, null, '1', '1', 'XY20170206', 'XY20170806', '1', '测试6', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('27', 'FSEQ1499510242124', null, '32', '设备7', '佳能7', 'XY2019-10-18', null, '光电7', '2017-01-07', null, null, null, '0', '2', 'XY20170207', 'XY20170807', '1', '测试7', '2017-07-08 18:37:22', '1', '2017-07-08 18:37:22', '0', null);
INSERT INTO `tb_equipment` VALUES ('28', 'FSEQ1499510242275', null, '32', '设备8', '佳能8', 'XY2019-10-19', null, '光电8', '2017-01-08', null, null, null, '1', '3', 'XY20170208', 'XY20170208', '1', ' 测试8 ', '2017-07-08 18:37:23', '1', '2017-07-08 18:37:23', '0', null);
INSERT INTO `tb_equipment` VALUES ('29', 'FSEQ1499510242426', null, '32', '设备9', '佳能9', 'XY2019-10-20', null, '光电9', '2017-01-09', null, null, null, '0', '1', 'XY20170209', 'XY20170209', '1', '  测试9  ', '2017-07-08 18:37:23', '1', '2017-07-08 18:37:23', '0', null);
INSERT INTO `tb_equipment` VALUES ('30', 'FSEQ1499524493136', null, '37', '设备1', '佳能1', 'XY2019-10-12', null, '光电1', '2017-01-01', null, null, null, '1', '2', 'XY20170201', 'XY20170801', '1', '测试1', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('31', 'FSEQ1499524493211', null, '37', '设备2', '佳能2', 'XY2019-10-13', null, '光电2', '2017-01-02', null, null, null, '1', '3', 'XY20170202', 'XY20170802', '1', '测试2', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('32', 'FSEQ1499524493222', null, '37', '设备3', '佳能3', 'XY2019-10-14', null, '光电3', '2017-01-03', null, null, null, '1', '1', 'XY20170203', 'XY20170803', '1', '测试3', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('33', 'FSEQ1499524493233', null, '37', '设备4', '佳能4', 'XY2019-10-15', null, '光电4', '2017-01-04', null, null, null, '1', '2', 'XY20170204', 'XY20170804', '1', '测试4', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('34', 'FSEQ1499524493243', null, '37', '设备5', '佳能5', 'XY2019-10-16', null, '光电5', '2017-01-05', null, null, null, '0', '3', 'XY20170205', 'XY20170805', '1', '测试5', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('35', 'FSEQ1499524493252', null, '37', '设备6', '佳能6', 'XY2019-10-17', null, '光电6', '2017-01-06', null, null, null, '1', '1', 'XY20170206', 'XY20170806', '1', '测试6', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('36', 'FSEQ1499524493262', null, '37', '设备7', '佳能7', 'XY2019-10-18', null, '光电7', '2017-01-07', null, null, null, '0', '2', 'XY20170207', 'XY20170807', '1', '测试7', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('37', 'FSEQ1499524493272', null, '37', '设备8', '佳能8', 'XY2019-10-19', null, '光电8', '2017-01-08', null, null, null, '1', '3', 'XY20170208', 'XY20170808', '1', '测试8', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '0', null);
INSERT INTO `tb_equipment` VALUES ('38', 'FSEQ1499524493306', null, '37', '设备9', '佳能9', 'XY2019-10-20', null, '光电9', '2017-01-09', null, null, null, '0', '1', 'XY20170209', 'XY20170809', '1', '测试9', '2017-07-08 22:34:53', '1', '2017-07-08 22:34:53', '1', null);
INSERT INTO `tb_equipment` VALUES ('39', 'FSEQ1499963163260', null, '37', 'asdasd', 'asda', 'asdasd', null, 'dasd', '2017-07-28', null, null, null, '0', null, 'asdasd', 'asdasd', '1', 'asdasdasd', '2017-07-14 00:26:07', '1', '2017-07-14 00:26:07', '0', null);
INSERT INTO `tb_equipment` VALUES ('40', 'FSEQ1500125002209', null, '37', 'test1', 'test1', 'test1', null, 'test1', '2017-07-02', null, null, null, '0', null, 'test1', 'test1', '1', '', '2017-07-15 21:23:22', '1', '2017-07-15 21:23:22', '1', null);
INSERT INTO `tb_equipment` VALUES ('41', 'FSEQ1500125833931', null, '24', 'test2', 'test2', 'test2', null, 'test2', '2017-07-04', null, null, null, '1', '1', 'test2', 'test2', '1', 'asdasd      ', '2017-07-15 21:37:13', '1', '2017-07-15 21:37:13', '0', null);
INSERT INTO `tb_equipment` VALUES ('42', 'FSEQ1500253213428', null, '38', 'fdsafdsaf', '111', '44', null, '111', '2017-07-11', null, null, null, '1', '1', '111', '111', '1', '  ', '2017-07-17 09:00:13', '1', '2017-07-17 09:00:13', '1', null);
INSERT INTO `tb_equipment` VALUES ('43', 'FSEQ1500301345738', null, '38', 'dsfdsd', '12312', '12132', null, '123123123', '2017-07-17', null, null, null, '0', null, '12312', '12312', '1', '  ', '2017-07-17 22:22:29', '1', '2017-07-17 22:22:29', '0', null);
INSERT INTO `tb_equipment` VALUES ('44', 'FSEQ1500302803140', null, '37', 'sdasd', null, '12', null, null, null, null, null, null, null, null, null, '123', '1', '121', '2017-07-17 22:46:58', '1', '2017-07-17 22:46:58', '0', null);
INSERT INTO `tb_equipment` VALUES ('45', 'FSEQ1500559717216', null, '48', 'tes', 'sdfsdf', 'test', '2017-07-11', 'sdfsdf', '2017-07-20', null, null, null, '1', '2', 'sdfsdf', 'sdfsf', '1', 'sdfsdf', '2017-07-20 22:08:36', '1', '2017-07-20 22:08:36', '0', null);
INSERT INTO `tb_equipment` VALUES ('46', 'FSEQ1500561076065', null, '47', 'asda', null, '12', null, null, null, null, null, null, null, null, null, '1223', '1', '123', '2017-07-20 22:31:15', '1', '2017-07-20 22:31:15', '0', null);
INSERT INTO `tb_equipment` VALUES ('47', 'FSEQ1501604100909', null, '48', 'fsdfs', 'sdfffff', 'dfsss', '2017-08-30', 'dfdfsdf', '2017-08-29', null, null, null, '1', '1', 'ddddddf', 'ssss', '1', 'sdffffffffdsdfsfsffs', '2017-08-02 00:15:00', '1', '2017-08-02 00:15:00', '0', null);
INSERT INTO `tb_equipment` VALUES ('48', 'FSEQ1502593283729', null, '46', '挨罚时', '阿斯达岁的', '12', '2017-07-30', '阿萨德阿达', '2017-08-29', null, null, null, '1', '2', '阿斯达岁的', '阿斯达岁的', '1', '', '2017-08-13 11:01:23', '1', '2017-08-13 11:01:23', '0', null);
INSERT INTO `tb_equipment` VALUES ('49', 'FSEQ1502604783950', null, '48', 'asdasd', 'asda', 'asdasd', '2017-08-09', 'asdasd', '2017-09-06', null, null, null, '1', '1', 'asdasd', 'asdasd', '1', 'asdasd', '2017-08-13 14:13:03', '1', '2017-08-13 14:13:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('50', 'FSEQ1502605452358', null, '50', 'sfsf', 'sdfsdf', 'sdfsdf', '2017-09-06', 'sdfdf', '2017-08-23', null, null, null, '0', null, 'sdfsdf', 'sdfsdf', '1', ' sdfsdf ', '2017-08-13 14:24:12', '1', '2017-08-13 14:32:46', '0', null);
INSERT INTO `tb_equipment` VALUES ('51', 'FSEQ1503354620581', null, '50', '今天周几', 'CCC', 'ASASD', '2017-08-30', 'DDDD', '2017-08-22', null, null, null, '0', null, 'BBBB', 'AAAA', '1', '按时打算大所多', '2017-08-22 06:30:19', '1', '2017-08-22 06:30:19', '0', null);
INSERT INTO `tb_equipment` VALUES ('52', 'FSEQ1503356686431', null, '48', '压缩机一号', '北京xxxx', 'XFS0001', '2017-08-23', '123', '2017-10-10', null, null, null, '0', '3', '123dfdfd45', '121213', '1', ' 测试信息 ', '2017-08-22 07:04:45', '1', '2017-08-22 07:08:33', '0', null);
INSERT INTO `tb_equipment` VALUES ('53', 'FSEQ1506256497434', null, '55', '压缩机一号', '北京xxxx', 'XFS0002', '', '123', '2017-10-10', null, null, null, '0', '3', '123dfdfd456', '121213', '1', ' 测试信息 ', '2017-09-24 20:34:54', '1', '2017-09-24 20:35:09', '0', null);

-- ----------------------------
-- Table structure for tb_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_part`;
CREATE TABLE `tb_part` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配件ID',
  `p_code` varchar(500) DEFAULT NULL COMMENT '配件编码',
  `p_name` varchar(128) NOT NULL COMMENT '配件名称',
  `p_price` double DEFAULT NULL COMMENT '配件价格',
  `p_pic` varchar(500) DEFAULT NULL COMMENT '配件照片',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `stock_num` double DEFAULT NULL COMMENT '库存数',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='配件表';

-- ----------------------------
-- Records of tb_part
-- ----------------------------
INSERT INTO `tb_part` VALUES ('1', 'aaaa', 'admin', '0', '', 'fasewrewfdsafdsafdsf', '0', '1', '2017-05-30 09:49:14', '1', '2017-07-09 12:35:00', '1', null);
INSERT INTO `tb_part` VALUES ('2', 'aaaa2', '新增配件1', '1111.11', '', 'vvcxvcxv', '0', '1', '2017-07-07 23:47:49', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('3', 'aaaa1', '新增配件2', '12222.9999', '', 'afdsfdsafiwfwfdsfds', '0', '1', '2017-07-07 23:52:10', '1', '2017-07-08 23:03:07', '0', null);
INSERT INTO `tb_part` VALUES ('4', 'aaaaa3', '新增配件3', '11111111.88888', '', '新增备注3', '0', '1', '2017-07-09 12:36:12', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('5', 'aaaaa4', '新增配件4', '111111.99999', '', '', '0', '1', '2017-07-09 12:37:07', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('6', 'aaaaa5', '新增配件5', '111111.99999', '', 'dddddd', '0', '1', '2017-07-09 12:38:30', '1', '2017-07-13 21:23:14', '1', null);
INSERT INTO `tb_part` VALUES ('7', 'aaaaa6', '新增配件6', '111111.99999', '', 'ddddddd', '0', '1', '2017-07-09 12:39:08', '1', '2017-07-09 12:43:03', '1', null);
INSERT INTO `tb_part` VALUES ('8', 'a5', '新增配件5', '3333333333', '', '', '0', '1', '2017-07-13 21:28:44', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('9', 'a6', '新增配件6', '55555555555555', '', '', '0', '1', '2017-07-13 21:29:04', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('10', 'a7', '新增配件7', '44444444444', '', '', '0', '1', '2017-07-13 21:35:06', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('11', 'a8', '新增配件8', '666666', '', '', '0', '1', '2017-07-13 21:40:08', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('12', 'a9', '新增配件9', '4444444', '131', '', '0', '1', '2017-07-13 21:50:25', '1', '2017-07-17 18:17:53', '0', null);
INSERT INTO `tb_part` VALUES ('13', 'a9', '新增配件9', '44444444444', '', '', '0', '1', '2017-07-13 21:50:29', '1', '2017-07-13 21:51:52', '1', null);
INSERT INTO `tb_part` VALUES ('14', 'a10', '新增配件10', '44444444444', '', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '0', '1', '2017-07-13 21:52:24', '1', '2017-07-13 22:25:42', '0', null);
INSERT INTO `tb_part` VALUES ('15', 'a11', '新增配件11', '3333333333333', '', 'dsafdsafdsafdsfds', '0', '1', '2017-07-13 21:54:37', '1', '2017-07-13 22:25:28', '0', null);
INSERT INTO `tb_part` VALUES ('21', 'a12', '新增配件12', '333333333', '96,97', '', '0', '1', '2017-07-15 23:25:01', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('22', 'a13', '新增配件113', '33333', '100,101', '', '321', '1', '2017-07-16 00:06:50', '1', '2017-07-20 23:06:44', '0', null);
INSERT INTO `tb_part` VALUES ('23', '11111', 'maytest', '1', '119', '', '0', '1', '2017-07-17 08:47:13', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('24', 'p1', '新增配件p1', '444444', '122,123,124,130', '备注一，备注1，备注，备注，备注，备注，备注，备注，备注，备注一，备注1，备注，备注，备注，备注，备注，备注，备注，备注一，备注1，备注，备注，备注，备注，备注，备注，备注，备注一，备注1，备注，备注，备注，备注，备注，备注，备注', '0', '1', '2017-07-17 16:02:00', '1', '2017-07-17 18:04:20', '0', null);
INSERT INTO `tb_part` VALUES ('25', 'sdfsdf', 'sdfsdf', '123123', '149,150', '123123', '0', '1', '2017-08-13 14:38:25', '1', '2017-08-13 14:38:40', '0', null);

-- ----------------------------
-- Table structure for tb_part_repertory
-- ----------------------------
DROP TABLE IF EXISTS `tb_part_repertory`;
CREATE TABLE `tb_part_repertory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `code` varchar(32) DEFAULT NULL COMMENT '库存编码',
  `p_id` int(11) NOT NULL COMMENT '配件ID',
  `storage_id` varchar(11) DEFAULT NULL COMMENT '仓库ID',
  `stock_num` int(11) DEFAULT NULL COMMENT '库存数',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='配件库存表';

-- ----------------------------
-- Records of tb_part_repertory
-- ----------------------------
INSERT INTO `tb_part_repertory` VALUES ('1', 'sdsfdfs', '2', '1', '0', '1', null, '1', '2017-08-13 19:14:14', '0');
INSERT INTO `tb_part_repertory` VALUES ('44', null, '22', '1', '0', '1', '2017-07-30 17:03:42', '1', '2017-07-30 17:38:53', '0');
INSERT INTO `tb_part_repertory` VALUES ('45', null, '23', '1', '66', '1', '2017-07-30 17:09:18', '1', '2017-08-13 19:24:53', '0');
INSERT INTO `tb_part_repertory` VALUES ('46', null, '21', '2', '0', '1', '2017-07-30 17:10:32', '1', '2017-07-30 17:43:15', '0');
INSERT INTO `tb_part_repertory` VALUES ('47', 'FSPR1501406449626', '12', '2', '0', '1', '2017-07-30 17:20:53', '1', '2017-07-30 17:36:38', '0');
INSERT INTO `tb_part_repertory` VALUES ('48', 'FSPR1501406732285', '21', '1', '0', '1', '2017-07-30 17:26:01', '1', '2017-08-13 19:14:14', '0');
INSERT INTO `tb_part_repertory` VALUES ('49', 'FSPR1501408642829', '14', '2', '8', '1', '2017-07-30 17:57:26', '1', '2017-08-13 19:21:45', '0');
INSERT INTO `tb_part_repertory` VALUES ('50', 'FSPR1501604876531', '22', '2', '12324', '1', '2017-08-02 00:27:56', '1', '2017-08-13 14:55:02', '0');
INSERT INTO `tb_part_repertory` VALUES ('51', 'FSPR1503357597076', '15', '1', '3232', '1', '2017-08-22 07:19:56', '1', '2017-08-22 07:19:56', '0');
INSERT INTO `tb_part_repertory` VALUES ('52', 'FSPR1503357667866', '24', '1', '1212', '1', '2017-08-22 07:21:07', '1', '2017-08-22 07:21:07', '0');

-- ----------------------------
-- Table structure for tb_part_repertory_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_part_repertory_record`;
CREATE TABLE `tb_part_repertory_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `code` varchar(32) DEFAULT NULL COMMENT '库存编码',
  `storage_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `record_date` varchar(32) DEFAULT NULL COMMENT '操作时间,入库为入库时间 出库 为出库时间',
  `repertory_type` tinyint(2) DEFAULT NULL COMMENT '出入库方式 1-入库 2-出库',
  `note` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 1-正常 2-撤回',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='出入库记录表';

-- ----------------------------
-- Records of tb_part_repertory_record
-- ----------------------------
INSERT INTO `tb_part_repertory_record` VALUES ('44', null, '2', null, '1', '123123', '1', '1', '2017-07-30 16:58:20', '1', '2017-07-30 16:58:20', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('45', null, '2', null, '1', '123123', '1', '1', '2017-07-30 16:59:48', '1', '2017-07-30 16:59:48', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('46', null, '1', null, '1', '12312', '1', '1', '2017-07-30 17:01:52', '1', '2017-07-30 17:01:52', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('47', null, '1', null, '1', '123123', '1', '1', '2017-07-30 17:03:40', '1', '2017-07-30 17:03:40', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('48', null, '1', null, '1', '123123', '1', '1', '2017-07-30 17:06:13', '1', '2017-07-30 17:06:13', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('49', null, '2', null, '1', '123123', '2', '1', '2017-07-30 17:10:25', '1', '2017-07-30 17:43:15', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('50', 'FSRR1501406197440', '1', null, '1', '123123', '2', '1', '2017-07-30 17:16:41', '1', '2017-07-30 17:38:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('51', 'FSRR1501406447044', '2', null, '1', '123123', '1', '1', '2017-07-30 17:20:50', '1', '2017-07-30 17:36:38', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('52', 'FSRR1501406700797', '1', null, '1', '12312', '1', '1', '2017-07-30 17:25:04', '1', '2017-07-30 17:25:04', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('53', 'FSRR1501408629832', '1', null, '1', '12312', '1', '1', '2017-07-30 17:57:13', '1', '2017-07-30 17:57:13', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('54', 'FSRR1501408642453', '2', null, '1', '12312', '1', '1', '2017-07-30 17:57:26', '1', '2017-07-30 17:57:26', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('55', 'FSRR1501604876171', '2', null, '1', '321', '1', '1', '2017-08-02 00:27:55', '1', '2017-08-02 00:27:55', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('56', 'FSRR1501614386478', '1', null, '1', '', '1', '1', '2017-08-02 03:06:26', '1', '2017-08-02 03:06:26', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('57', 'FSRR1501614899115', '1', null, '1', '', '1', '1', '2017-08-02 03:14:58', '1', '2017-08-02 03:14:58', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('58', 'FSRR1501614899965', '1', null, '1', '', '1', '1', '2017-08-02 03:14:59', '1', '2017-08-02 03:14:59', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('59', 'FSRR1501615044939', '1', null, '1', '', '1', '1', '2017-08-02 03:17:24', '1', '2017-08-02 03:17:24', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('60', 'FSRR1501615045689', '1', null, '1', '', '1', '1', '2017-08-02 03:17:25', '1', '2017-08-02 03:17:25', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('61', 'FSRR1501615064991', '1', null, '1', '', '1', '1', '2017-08-02 03:17:44', '1', '2017-08-02 03:17:44', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('62', 'FSRR1501615073488', '1', null, '1', '', '1', '1', '2017-08-02 03:17:53', '1', '2017-08-02 03:17:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('63', 'FSRR1501615073691', '1', null, '1', '', '1', '1', '2017-08-02 03:17:53', '1', '2017-08-02 03:17:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('64', 'FSRR1501615073876', '1', null, '1', '', '1', '1', '2017-08-02 03:17:53', '1', '2017-08-02 03:17:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('65', 'FSRR1501615074070', '1', null, '1', '', '1', '1', '2017-08-02 03:17:53', '1', '2017-08-02 03:17:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('66', 'FSRR1501615074259', '1', null, '1', '', '1', '1', '2017-08-02 03:17:54', '1', '2017-08-02 03:17:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('67', 'FSRR1501615074448', '1', null, '1', '', '1', '1', '2017-08-02 03:17:54', '1', '2017-08-02 03:17:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('68', 'FSRR1501615074633', '1', null, '1', '', '1', '1', '2017-08-02 03:17:54', '1', '2017-08-02 03:17:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('69', 'FSRR1501615074823', '1', null, '1', '', '1', '1', '2017-08-02 03:17:54', '1', '2017-08-02 03:17:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('70', 'FSRR1501615075045', '1', null, '1', '', '1', '1', '2017-08-02 03:17:54', '1', '2017-08-02 03:17:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('71', 'FSRR1501615075703', '1', null, '1', '', '1', '1', '2017-08-02 03:17:55', '1', '2017-08-02 03:17:55', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('72', 'FSRR1501615075932', '1', null, '1', '', '1', '1', '2017-08-02 03:17:55', '1', '2017-08-02 03:17:55', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('73', 'FSRR1501615313929', '2', null, '1', '', '1', '1', '2017-08-02 03:21:53', '1', '2017-08-02 03:21:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('74', 'FSRR1501615314630', '2', null, '1', '', '1', '1', '2017-08-02 03:21:54', '1', '2017-08-02 03:21:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('75', 'FSRR1501615314831', '2', null, '1', '', '1', '1', '2017-08-02 03:21:54', '1', '2017-08-02 03:21:54', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('76', 'FSRR1501615322162', '2', null, '1', '', '1', '1', '2017-08-02 03:22:01', '1', '2017-08-02 03:22:01', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('77', 'FSRR1501615322339', '2', null, '1', '', '1', '1', '2017-08-02 03:22:02', '1', '2017-08-02 03:22:02', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('78', 'FSRR1501615322524', '2', null, '1', '', '1', '1', '2017-08-02 03:22:02', '1', '2017-08-02 03:22:02', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('79', 'FSRR1501615459837', '2', null, '1', '', '1', '1', '2017-08-02 03:24:19', '1', '2017-08-02 03:24:19', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('80', 'FSRR1501615528092', '1', null, '1', '', '1', '1', '2017-08-02 03:25:27', '1', '2017-08-02 03:25:27', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('81', 'FSRR1501615529576', '1', null, '1', '', '1', '1', '2017-08-02 03:25:29', '1', '2017-08-02 03:25:29', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('82', 'FSRR1501615530417', '1', null, '1', '', '1', '1', '2017-08-02 03:25:30', '1', '2017-08-02 03:25:30', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('83', 'FSRR1501615531181', '1', null, '1', '', '1', '1', '2017-08-02 03:25:30', '1', '2017-08-02 03:25:30', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('84', 'FSRR1501615531425', '1', null, '1', '', '1', '1', '2017-08-02 03:25:31', '1', '2017-08-02 03:25:31', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('85', 'FSRR1501615531591', '1', null, '1', '', '1', '1', '2017-08-02 03:25:31', '1', '2017-08-02 03:25:31', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('86', 'FSRR1501615531787', '1', null, '1', '', '1', '1', '2017-08-02 03:25:31', '1', '2017-08-02 03:25:31', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('87', 'FSRR1501615531978', '1', null, '1', '', '1', '1', '2017-08-02 03:25:31', '1', '2017-08-02 03:25:31', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('88', 'FSRR1501615532172', '1', null, '1', '', '1', '1', '2017-08-02 03:25:31', '1', '2017-08-02 03:25:31', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('89', 'FSRR1501615532342', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('90', 'FSRR1501615532521', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('91', 'FSRR1501615532685', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('92', 'FSRR1501615532980', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('93', 'FSRR1501615533055', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('94', 'FSRR1501615533236', '1', null, '1', '', '1', '1', '2017-08-02 03:25:32', '1', '2017-08-02 03:25:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('95', 'FSRR1501615533412', '1', null, '1', '', '1', '1', '2017-08-02 03:25:33', '1', '2017-08-02 03:25:33', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('96', 'FSRR1501615533546', '1', null, '1', '', '1', '1', '2017-08-02 03:25:33', '1', '2017-08-02 03:25:33', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('97', 'FSRR1501615533750', '1', null, '1', '', '1', '1', '2017-08-02 03:25:33', '1', '2017-08-02 03:25:33', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('98', 'FSRR1501615533933', '1', null, '1', '', '2', '1', '2017-08-02 03:25:33', '1', '2017-08-22 07:18:09', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('99', 'FSRR1501615534097', '1', null, '1', '', '2', '1', '2017-08-02 03:25:33', '1', '2017-08-22 07:17:58', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('100', 'FSRR1501615576514', '1', null, '1', 'ststete', '2', '1', '2017-08-02 03:26:16', '1', '2017-08-22 07:17:52', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('101', 'FSRR1501630513595', '2', null, '1', '132', '2', '1', '2017-08-02 07:35:13', '1', '2017-08-13 14:52:36', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('102', 'FSRR1501769613105', '1', null, '2', 'test', '1', '1', '2017-08-03 22:13:32', '1', '2017-08-03 22:13:32', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('103', 'FSRR1501769676834', '1', null, '2', 'test', '1', '1', '2017-08-03 22:14:36', '1', '2017-08-03 22:14:36', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('104', 'FSRR1501770395358', '1', null, '2', '阿斯达岁的', '1', '1', '2017-08-03 22:26:34', '1', '2017-08-03 22:26:34', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('105', 'FSRR1501770646446', '1', null, '2', '阿斯达岁的', '1', '1', '2017-08-03 22:30:45', '1', '2017-08-03 22:30:45', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('106', 'FSRR1501770754175', '1', null, '2', '阿斯达岁的', '1', '1', '2017-08-03 22:32:35', '1', '2017-08-03 22:32:35', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('107', 'FSRR1501770872776', '1', null, '2', '阿斯达岁的', '1', '1', '2017-08-03 22:34:34', '1', '2017-08-03 22:34:34', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('108', 'FSRR1501771205971', '1', null, '2', '阿斯达岁的', '1', '1', '2017-08-03 22:40:05', '1', '2017-08-03 22:40:05', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('109', 'FSRR1501771379625', '1', null, '2', 'sdfsdf', '1', '1', '2017-08-03 22:42:59', '1', '2017-08-03 22:42:59', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('110', 'FSRR1502023133239', '2', null, '2', 'asdasd', '1', '1', '2017-08-06 20:38:51', '1', '2017-08-06 20:38:51', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('111', 'FSRR1502593342481', '1', null, '2', 'as大大 ', '1', '1', '2017-08-13 11:02:22', '1', '2017-08-13 11:02:22', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('112', 'FSRR1502607034383', '1', null, '2', 'asda', '1', '1', '2017-08-13 14:50:35', '1', '2017-08-13 14:50:35', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('113', 'FSRR1502607301848', '2', null, '1', '123123123', '1', '1', '2017-08-13 14:55:01', '1', '2017-08-13 14:55:01', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('114', 'FSRR1502618222275', '1', null, '2', 'asd', '1', '1', '2017-08-13 17:57:01', '1', '2017-08-13 17:57:01', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('115', 'FSRR1502622263681', '1', null, '2', '是的发送到', '1', '1', '2017-08-13 19:04:23', '1', '2017-08-13 19:04:23', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('116', 'FSRR1502622496800', '1', null, '2', 'sfdsdf', '1', '1', '2017-08-13 19:08:16', '1', '2017-08-13 19:08:16', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('117', 'FSRR1502622853196', '1', null, '2', '12', '1', '1', '2017-08-13 19:14:12', '1', '2017-08-13 19:14:12', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('118', 'FSRR1502622989271', '1', null, '2', '1212', '2', '1', '2017-08-13 19:16:28', '1', '2017-08-13 19:19:41', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('119', 'FSRR1502623253551', '2', null, '2', '', '2', '1', '2017-08-13 19:20:53', '1', '2017-08-22 07:21:50', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('120', 'FSRR1502623487836', '1', null, '2', 'sdf', '1', '1', '2017-08-13 19:24:47', '1', '2017-08-13 19:24:47', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('121', 'FSRR1503357596705', '1', null, '1', 'asdasd', '1', '1', '2017-08-22 07:19:56', '1', '2017-08-22 07:19:56', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('122', 'FSRR1503357667074', '1', null, '1', '1212', '1', '1', '2017-08-22 07:21:06', '1', '2017-08-22 07:21:06', '0');

-- ----------------------------
-- Table structure for tb_part_repertory_record_bill
-- ----------------------------
DROP TABLE IF EXISTS `tb_part_repertory_record_bill`;
CREATE TABLE `tb_part_repertory_record_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库配件单ID',
  `code` varchar(32) DEFAULT NULL COMMENT '出入库明细编码',
  `repertory_record_id` int(11) DEFAULT NULL COMMENT '出入库单ID',
  `p_id` int(11) DEFAULT NULL COMMENT '配件ID',
  `p_code` varchar(500) DEFAULT NULL COMMENT '配件编号',
  `p_name` varchar(128) NOT NULL COMMENT '配件名称',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供货商',
  `price` double DEFAULT NULL COMMENT '配件价格',
  `num` double DEFAULT NULL COMMENT '出入库数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `tax_amt` double DEFAULT NULL COMMENT '含税金额:价格的17%自动计算',
  `total_amt` double DEFAULT NULL COMMENT '总价',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='出入库明细表';

-- ----------------------------
-- Records of tb_part_repertory_record_bill
-- ----------------------------
INSERT INTO `tb_part_repertory_record_bill` VALUES ('1', null, '1', '12', 'Xsdfsdfsdf', '空气压缩机', '京东', '10', '100', '1', '0.5', '500', '测试一下', '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('2', null, '44', '22', 'a13', '新增配件113', null, '12', '132', null, null, '100', '123123', '1', '2017-07-30 16:58:20', '1', '2017-07-30 16:58:20', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('3', null, '45', '22', 'a13', '新增配件113', null, '12', '132', null, null, '200', '123123', '1', '2017-07-30 17:00:10', '1', '2017-07-30 17:00:10', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('4', null, '46', '23', '11111', 'maytest', null, '12', '32', null, null, '12', '12312', '1', '2017-07-30 17:01:56', '1', '2017-07-30 17:01:56', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('5', null, '47', '22', 'a13', '新增配件113', null, '123', '213', null, null, '31', '123123', '1', '2017-07-30 17:03:42', '1', '2017-07-30 17:03:42', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('6', null, '48', '23', '11111', 'maytest', null, '1231', '123', null, null, '2', '123123', '1', '2017-07-30 17:09:18', '1', '2017-07-30 17:09:18', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('7', null, '49', '21', 'a12', '新增配件12', null, '123', '312', null, null, '2', '123123', '1', '2017-07-30 17:10:30', '1', '2017-07-30 17:10:30', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('8', null, '50', '22', 'a13', '新增配件113', null, '12312', '123', null, null, '3', '123123', '1', '2017-07-30 17:16:44', '1', '2017-07-30 17:16:44', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('9', null, '51', '12', 'a9', '新增配件9', null, '123', '22', null, null, '2', '123123', '1', '2017-07-30 17:20:53', '1', '2017-07-30 17:20:53', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('10', null, '52', '21', 'a12', '新增配件12', null, '123', '12', null, null, '3', '12312', '1', '2017-07-30 17:25:04', '1', '2017-07-30 17:25:04', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('11', null, '53', '21', 'a12', '新增配件12', null, '12', '32', null, null, '4', '12312', '1', '2017-07-30 17:57:13', '1', '2017-07-30 17:57:13', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('12', null, '54', '14', 'a10', '新增配件10', null, '21', '32', null, null, '5', '12312', '1', '2017-07-30 17:57:26', '1', '2017-07-30 17:57:26', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('13', null, '55', '22', 'a13', '新增配件113', null, '12312', '12', null, null, '6', '321', '1', '2017-08-02 00:27:56', '1', '2017-08-02 00:27:56', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('14', null, '106', '22', 'a13', '新增配件113', null, '33333', '2', '', null, '7', null, '1', '2017-08-03 22:32:53', '1', '2017-08-03 22:32:53', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('15', null, '107', '22', 'a13', '新增配件113', null, '33333', '3', '', null, '1', null, '1', '2017-08-03 22:34:40', '1', '2017-08-03 22:34:40', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('16', null, '108', '22', 'a13', '新增配件113', null, '33333', '2', '', null, '2', null, '1', '2017-08-03 22:40:05', '1', '2017-08-03 22:40:05', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('17', null, '109', '2', 'aaaa2', '新增配件1', null, '1111.11', '1', '', null, '3', null, '1', '2017-08-03 22:42:59', '1', '2017-08-03 22:42:59', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('18', null, '109', '22', 'a13', '新增配件113', null, '33333', '2', '', null, '4', null, '1', '2017-08-03 22:42:59', '1', '2017-08-03 22:42:59', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('19', null, '110', '14', 'a10', '新增配件10', null, '44444444444', '12', '2', '12', '12', null, '1', '2017-08-06 20:38:51', '1', '2017-08-06 20:38:51', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('20', null, '111', '23', '11111', 'maytest', null, '1', '12', '32', '123', '123', null, '1', '2017-08-13 11:02:23', '1', '2017-08-13 11:02:23', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('21', null, '112', '2', 'aaaa2', '新增配件1', null, '1111.11', '5', '21', '21', '12', null, '1', '2017-08-13 14:50:39', '1', '2017-08-13 14:50:39', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('22', null, '113', '22', 'a13', '新增配件113', null, '123', '12312', null, null, null, '123123123', '1', '2017-08-13 14:55:02', '1', '2017-08-13 14:55:02', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('23', null, '113', '21', 'a12', '新增配件12', null, '333333333', '21', '21', '21', '6999999993', null, '1', '2017-08-13 17:57:02', '1', '2017-08-13 17:57:02', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('24', null, '114', '23', '11111', 'maytest', null, '112', '12', '12', '23', '1344', null, '1', '2017-08-13 19:04:24', '1', '2017-08-13 19:04:24', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('25', null, '114', '2', 'aaaa2', '新增配件1', null, '1212', '4', '3', '23', '4848', null, '1', '2017-08-13 19:04:24', '1', '2017-08-13 19:04:24', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('26', null, '115', '21', 'a12', '新增配件12', null, '333333333', '1', '2', '21', '333333333', null, '1', '2017-08-13 19:08:17', '1', '2017-08-13 19:08:17', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('27', null, '116', '21', 'a12', '新增配件12', null, '333333333', '10', '21', '21', '3333333330', null, '1', '2017-08-13 19:14:13', '1', '2017-08-13 19:14:13', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('28', null, '116', '2', 'aaaa2', '新增配件1', null, '1111.11', '1', '21', '21', '1111.11', null, '1', '2017-08-13 19:14:14', '1', '2017-08-13 19:14:14', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('29', null, '117', '23', '11111', 'maytest', null, '112', '12', '21', '12', '1344', null, '1', '2017-08-13 19:17:26', '1', '2017-08-13 19:17:26', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('30', null, '118', '14', 'a10', '新增配件10', null, '44444444444', '12', '21', '21', '533333333328', null, '1', '2017-08-13 19:21:43', '1', '2017-08-13 19:21:43', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('31', null, '120', '23', '11111', 'maytest', null, '112', '21', '12', '12', '2352', null, '1', '2017-08-13 19:24:53', '1', '2017-08-13 19:24:53', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('32', null, '121', '15', 'a11', '新增配件11', null, '12', '3232', null, null, null, 'asdasd', '1', '2017-08-22 07:19:56', '1', '2017-08-22 07:19:56', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('33', null, '122', '24', 'p1', '新增配件p1', null, '12', '1212', null, null, null, '1212', '1', '2017-08-22 07:21:06', '1', '2017-08-22 07:21:06', '0');

-- ----------------------------
-- Table structure for tb_part_repertory_record_out
-- ----------------------------
DROP TABLE IF EXISTS `tb_part_repertory_record_out`;
CREATE TABLE `tb_part_repertory_record_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `repertory_record_id` int(11) NOT NULL COMMENT '出入库管理id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contract_id` tinyint(2) DEFAULT NULL COMMENT '合同id',
  `send_type` int(2) DEFAULT NULL COMMENT '配送方式 1-自提 2-快递 3-单独配送',
  `linkman` varchar(128) DEFAULT NULL COMMENT '联系人',
  `tel_sign` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(64) DEFAULT NULL COMMENT '传真',
  `verifier` varchar(64) DEFAULT NULL COMMENT '出库审核人',
  `postcode` varchar(16) DEFAULT NULL COMMENT '邮编',
  `receiver_address` varchar(512) DEFAULT NULL COMMENT '收货地址',
  `sender` varchar(128) DEFAULT NULL COMMENT '发货人',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='出入库记录表-出库扩展表';

-- ----------------------------
-- Records of tb_part_repertory_record_out
-- ----------------------------
INSERT INTO `tb_part_repertory_record_out` VALUES ('102', '102', '46', '46', '3', '杨立湘', '1.362129371E10', null, null, 'tes他', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('103', '103', '46', '46', '3', '杨立湘', '1.362129371E10', null, null, 'tes他', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('104', '104', '46', '46', '3', '杨立湘', '1.362129371E10', '按时打算多', null, 'Asdasd12', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('105', '105', '46', '46', '3', '杨立湘', '1.362129371E10', '按时打算多', null, 'Asdasd12', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('106', '106', '46', '46', '3', '杨立湘', '1.362129371E10', '按时打算多', null, 'Asdasd12', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('107', '107', '46', '46', '3', '杨立湘', '1.362129371E10', '按时打算多', null, 'Asdasd12', '北京市房山区云岗', null, '1', null, '1', null, null);
INSERT INTO `tb_part_repertory_record_out` VALUES ('108', '108', '46', '46', '3', '杨立湘', '1.362129371E10', 'asaaaaaaaaaaaaa', null, 'Asdasd', '北京市房山区云岗', null, '1', '2017-08-03 22:40:05', '1', '2017-08-03 22:40:05', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('109', '109', '46', '46', '3', '杨立湘', '1.362129371E10', 'sdfsdfsdf', null, 'sdsdf', '北京市房山区云岗', 'sdsdf', '1', '2017-08-03 22:42:59', '1', '2017-08-03 22:42:59', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('110', '110', '46', '46', '4', '杨立湘', '1.362129371E10', 'asdasd', null, 'sdasd', '北京市房山区云岗', 'asda', '1', '2017-08-06 20:38:51', '1', '2017-08-06 20:38:51', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('111', '111', '46', '46', '3', '杨立湘', '1.362129371E10', 'as大大 ', null, 'as大大 ', '北京市房山区云岗', 'as大大 ', '1', '2017-08-13 11:02:22', '1', '2017-08-13 11:02:22', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('112', '112', '46', '47', '4', '杨立湘', '1.362129371E10', 'sdasd', null, 'asdasd', '北京市房山区云岗', 'asd', '1', '2017-08-13 14:50:36', '1', '2017-08-13 14:50:36', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('113', '114', '46', '47', '3', '杨立湘', '1.362129371E10', 'asdasd', null, 'asd', '北京市房山区云岗', 'asdasd', '1', '2017-08-13 17:57:02', '1', '2017-08-13 17:57:02', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('114', '115', '46', '47', '3', '杨立湘', '1.362129371E10', '按时打算', null, '胜多负少', '北京市房山区云岗', '是的发送到', '1', '2017-08-13 19:04:23', '1', '2017-08-13 19:04:23', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('115', '116', '46', '47', '3', '杨立湘', '1.362129371E10', 'ds', null, 'sdf', '北京市房山区云岗', 'sd', '1', '2017-08-13 19:08:16', '1', '2017-08-13 19:08:16', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('116', '117', '46', '47', '4', '杨立湘', '1.362129371E10', '12', null, '21', '北京市房山区云岗', '12', '1', '2017-08-13 19:14:13', '1', '2017-08-13 19:14:13', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('117', '118', '46', '47', '3', '杨立湘', '1.362129371E10', '121', null, '12312', '北京市房山区云岗', '12', '1', '2017-08-13 19:16:29', '1', '2017-08-13 19:16:29', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('118', '119', '46', '47', '4', '杨立湘', '1.362129371E10', 'asdasdasd', null, 'asd', '北京市房山区云岗', 'asd', '1', '2017-08-13 19:20:53', '1', '2017-08-13 19:20:53', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('119', '120', '46', '47', '4', '杨立湘', '1.362129371E10', 'sdfsdf', null, 'sdf', '北京市房山区云岗', 'sdf', '1', '2017-08-13 19:24:47', '1', '2017-08-13 19:24:47', '0');

-- ----------------------------
-- Table structure for tb_serve_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb_serve_debug`;
CREATE TABLE `tb_serve_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(64) DEFAULT NULL COMMENT '调试单编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户Id',
  `eq_id` int(11) DEFAULT NULL COMMENT '设备Id',
  `service_engineer` varchar(256) DEFAULT NULL COMMENT '服务工程师',
  `debug_date` varchar(32) DEFAULT NULL COMMENT '调试日期',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='调试服务单表';

-- ----------------------------
-- Records of tb_serve_debug
-- ----------------------------
INSERT INTO `tb_serve_debug` VALUES ('2', 'DEBUG1503201585432', '47', '46', '5', '2017-08-21', '1', '2017-08-20 11:59:45', '1', '2017-08-20 11:59:45', '0', null);
INSERT INTO `tb_serve_debug` VALUES ('3', 'DEBUG1503202855807', '48', '49', '7', '2017-08-31', '1', '2017-08-20 12:20:55', '1', '2017-08-20 20:07:58', '0', null);
INSERT INTO `tb_serve_debug` VALUES ('4', 'DEBUG1503206039045', '47', '46', '7', '2017-08-31', '1', '2017-08-20 13:14:00', '1', '2017-08-20 13:15:48', '0', null);
INSERT INTO `tb_serve_debug` VALUES ('5', 'DEBUG1503232425862', '50', '50', '7', '2017-08-16', '1', '2017-08-20 20:33:53', '1', '2017-08-20 20:34:58', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('6', 'DEBUG1503232431371', '50', '50', '7', '2017-08-16', '1', '2017-08-20 20:33:53', '1', '2017-08-20 20:34:32', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('7', 'DEBUG1503232598069', '50', '50', '7', '2017-08-23', '1', '2017-08-20 20:36:40', '1', '2017-08-20 20:36:40', '0', null);

-- ----------------------------
-- Table structure for tb_serve_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `tb_serve_maintenance`;
CREATE TABLE `tb_serve_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单据ID',
  `m_code` varchar(500) NOT NULL COMMENT '单据编号',
  `c_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `e_id` int(11) DEFAULT NULL COMMENT '设备ID',
  `repair_content` varchar(500) DEFAULT NULL COMMENT '报修内容',
  `service_engineer` varchar(256) DEFAULT NULL COMMENT '服务工程师',
  `service_date` date DEFAULT NULL COMMENT '服务日期',
  `gear_speed` double DEFAULT NULL COMMENT '齿轮速比',
  `work_times` double DEFAULT NULL COMMENT '运转时数',
  `exhaust_pressure` double DEFAULT NULL COMMENT '排气压力(MPa)',
  `exhaust_temperature` double DEFAULT NULL COMMENT '排气温度(°C)',
  `env_temperature` double DEFAULT NULL COMMENT '环境温度(°C)',
  `oil_pressure` double DEFAULT NULL COMMENT '油压(MPa)',
  `running_voltage` double DEFAULT NULL COMMENT '运转电压(V)',
  `running_elec` double DEFAULT NULL COMMENT '运转电流(A)',
  `fault_reason` varchar(500) DEFAULT NULL COMMENT '故障原因',
  `service_content` varchar(500) DEFAULT NULL COMMENT '服务内容',
  `service_other_content` varchar(256) DEFAULT NULL COMMENT '其他服务内容',
  `engineer_suggest` varchar(500) DEFAULT NULL COMMENT '服务工程师建议',
  `service_fees` double DEFAULT NULL COMMENT '服务费用',
  `c_view` varchar(500) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '单据创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '单据修改人',
  `modified` datetime DEFAULT NULL COMMENT '单据修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '是否删除，0-未删除，1-已删除',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_serve_maintenance
-- ----------------------------
INSERT INTO `tb_serve_maintenance` VALUES ('1', 'mmm1', '46', '48', 'fdsfdsf', '5', '2017-08-01', '0', '0', '0', null, '0', '0', '0', '0', '正在查找中...', '', null, '', '100015', null, '', '1', '2017-08-14 11:06:53', '1', '2017-08-20 13:19:47', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('2', 'mm2', '48', '50', 'safdsfdsfd', '1', '2017-08-02', '0', '0', '0', null, '0', '0', '0', '0', '正在排查中...', '', null, '', '100015', null, '', '1', '2017-08-15 09:30:02', '2', '2017-08-15 09:53:36', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('3', 'mm3', '46', '47', 'ttttttttttttt', '1', '2017-08-03', null, null, '0', '0', null, null, null, null, '', '', null, '', null, null, '', '1', '2017-08-15 09:33:00', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('4', 'mm4', '45', '46', 'afdsafdsfd', '5', '2017-08-05', null, null, '0', '0', null, null, null, null, '', '', null, '', null, null, '', '1', '2017-08-15 18:48:17', '4', '2017-08-20 14:21:37', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('5', '', '47', '46', 'asasd', '5', '2017-08-20', '12', '123', '0', '0', '123', '123', '123', '123', '123', '123', null, '', '123', null, '123', '1', '2017-08-20 14:42:15', '1', '2017-08-20 20:23:39', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('6', '', '48', '49', 'asdasd', '5', '2017-08-20', '123', '321', '0', '0', '12', '123', '123', '123', '123', '123', null, '', '123', null, '123', '1', '2017-08-20 14:43:13', '1', '2017-08-20 14:48:47', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('7', '', '48', '49', 'asdasd', '5', '2017-08-20', '123.01', '321.02', '0', '5', '0', '123.06', '123.04', '123.07', '1238', 'asdasd1119', null, '', '123.023', null, '123saa87', '1', '2017-08-20 14:43:55', '1', '2017-08-20 14:48:44', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('8', '', '47', '46', 'sfsdfsdfsf1', '7', '2017-08-20', '2', '6', '3', '7', '9', '5', '4', '8', '10', 'asda', null, 'asdasd', '14', '', '13', '1', '2017-08-20 14:49:32', '1', '2017-08-20 15:04:58', '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('9', 'MAINT1503212942447', '47', '46', 'asasdadasd', '5', '2017-09-01', '12', '12', '32', '33', '41', '32', '12', '3', '2323', '12', null, '123123', '1312', '', '123123', '1', '2017-08-20 15:09:02', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('10', 'MAINT1503231106420', '50', '50', 'asasd', '7', '2017-08-23', '32', '12', '12', '12', '123', '123', '12312', '123.0712', '123', '213', null, '123', '112', '', '123', '1', '2017-08-20 20:11:48', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('11', 'MAINT1503354520754', '50', '50', 'sdsdfsdfsfAA阿斯达岁的', '7', '2017-08-22', '12', '1233', '123', '123', '3121', '123', '123', '123', '1212', '213', null, '123', '123123', null, '123123', '1', '2017-08-22 06:28:40', null, null, '0', null);

-- ----------------------------
-- Table structure for tb_serve_polling
-- ----------------------------
DROP TABLE IF EXISTS `tb_serve_polling`;
CREATE TABLE `tb_serve_polling` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库配件单ID',
  `code` varchar(32) DEFAULT NULL COMMENT '维保记录编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '出库单ID',
  `eq_id` int(11) DEFAULT NULL COMMENT '设备ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `envTemperature` varchar(16) DEFAULT NULL COMMENT '环境温度',
  `exhaustTemperature` varchar(16) DEFAULT NULL COMMENT '排气温度',
  `MPa` varchar(16) DEFAULT NULL COMMENT '冷却水压',
  `hoursToStream` varchar(16) DEFAULT NULL COMMENT '运转时数',
  `operatingPressure` varchar(16) DEFAULT NULL COMMENT '运转气压',
  `operatingOilPressure` varchar(16) DEFAULT NULL COMMENT '运转油压',
  `RSPressure` varchar(16) DEFAULT NULL COMMENT 'RS',
  `RTPressure` varchar(16) DEFAULT NULL COMMENT 'RT',
  `STPressure` varchar(16) DEFAULT NULL COMMENT 'ST',
  `RElectric` varchar(16) DEFAULT NULL COMMENT 'R线',
  `SElectric` varchar(16) DEFAULT NULL COMMENT 'S线',
  `TElectric` varchar(16) DEFAULT NULL COMMENT 'T线',
  `isFastening` int(11) DEFAULT NULL COMMENT '电控盘及电视机大线螺丝是否紧固',
  `isTerminalNormal` int(11) DEFAULT NULL COMMENT '接触器接线柱颜色、动作是否正常',
  `isOilBarrelsNormal` int(11) DEFAULT NULL COMMENT '油气桶在停一段时间后是否经常放水',
  `isFactory` int(11) DEFAULT NULL COMMENT '配件来源是否正厂',
  `isThermalNormal` int(11) DEFAULT NULL COMMENT '热控阀动作是否正常',
  `isTemperatureNormal` int(11) DEFAULT NULL COMMENT '冷却水温是否正常',
  `isMotorNormal` int(11) DEFAULT NULL COMMENT '电机、主机是否正常',
  `isRadiatorNormal` int(11) DEFAULT NULL COMMENT '散热器是否定期修理',
  `isPipelinesNormal` int(11) DEFAULT NULL COMMENT '各管路是否漏油现象',
  `isMaintenanceNormal` int(11) DEFAULT NULL COMMENT '压力维持阀是否开启正常',
  `isOilColorNormal` int(11) DEFAULT NULL COMMENT '油品颜色是否正常',
  `isTightnessNormal` int(11) DEFAULT NULL COMMENT '皮带松紧度是否正常',
  `isThreeFilterNormal` int(11) DEFAULT NULL COMMENT '三滤压差开关是否正常',
  `isPulleyNormal` int(11) DEFAULT NULL COMMENT '电机皮带轮是否与主机',
  `isCabinetNormal` int(11) DEFAULT NULL COMMENT '机柜各过滤网是否定期清理',
  `isPipeFilterNormal` int(11) DEFAULT NULL COMMENT '管路过滤器是否正常排水',
  `isDoorsNormal` int(11) DEFAULT NULL COMMENT '机器各门是否关闭运行',
  `isAutomaticNormal` int(11) DEFAULT NULL COMMENT '自动排污阀是否经常排污',
  `isUseEnvNormal` int(11) DEFAULT NULL COMMENT '使用环境是否良好',
  `isVolumeNormal` int(11) DEFAULT NULL COMMENT '容调点是否合适',
  `isMRegularlyNormal` int(11) DEFAULT NULL COMMENT '机器是否定期保养',
  `isMotorRegularlyNormal` int(11) DEFAULT NULL COMMENT '电机是否定期检查、保养、加油',
  `engineerSuggest` varchar(512) DEFAULT NULL COMMENT '服务人员建议',
  `feedback` varchar(512) DEFAULT NULL COMMENT '客户意见',
  `service_engineer` varchar(256) DEFAULT NULL COMMENT '服务工程师',
  `attitude` int(11) DEFAULT NULL COMMENT '满意度',
  `serviceDate` varchar(16) DEFAULT NULL COMMENT '服务日期',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='出库配件单表';

-- ----------------------------
-- Records of tb_serve_polling
-- ----------------------------
INSERT INTO `tb_serve_polling` VALUES ('2', 'POLLING1503223330565', '47', '46', '1', '2017-08-20 18:02:10', '1', '2017-08-20 18:08:30', '0', '122', '323', '1233', '1232', '1234', '1231', '123', '132', '123', '322', '122', '132', '0', '0', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', 'mainContenter13', 'mainContenter24', '5', '1', '2017-08-29', null);
INSERT INTO `tb_serve_polling` VALUES ('3', 'POLLING1503231734732', '50', '50', '1', '2017-08-20 20:22:17', '1', '2017-08-20 20:23:54', '0', '12', '312', '12333', '12312', '123', '123', '12', '12', '12', '2', '12', '321', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '12', '7', '1', '2017-08-22', null);
INSERT INTO `tb_serve_polling` VALUES ('4', 'POLLING1503355149512', '47', '46', '1', '2017-08-22 06:39:08', '1', '2017-08-22 06:48:30', '0', '1212333', '12333', '12333', '2133', '1233', '1233', '1233', '1233', '1233', '1233', '1233', '2133', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1222222222222222222222222233', '122222222222222222222233', '7', '1', '2017-08-30', null);

-- ----------------------------
-- Table structure for z_tb_into_stock_bill
-- ----------------------------
DROP TABLE IF EXISTS `z_tb_into_stock_bill`;
CREATE TABLE `z_tb_into_stock_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入库单ID',
  `code` varchar(500) DEFAULT NULL COMMENT '入库单编码',
  `stock_id` int(11) DEFAULT NULL COMMENT '库存ID',
  `p_id` int(11) DEFAULT NULL COMMENT '配件ID',
  `p_code` varchar(500) DEFAULT NULL COMMENT '配件编号',
  `p_name` varchar(128) NOT NULL COMMENT '配件名称',
  `price` double DEFAULT NULL COMMENT '配件价格',
  `num` double DEFAULT NULL COMMENT '入库数',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `status` int(2) DEFAULT NULL COMMENT '入库状态，1-正常 2-撤回',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='入库单表';

-- ----------------------------
-- Records of z_tb_into_stock_bill
-- ----------------------------
INSERT INTO `z_tb_into_stock_bill` VALUES ('1', null, null, null, null, 'admin', null, null, null, null, null, '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0');
INSERT INTO `z_tb_into_stock_bill` VALUES ('2', null, null, '22', 'a13', '新增配件113', '12.1', '12', null, null, '123123', null, null, null, null, null);
INSERT INTO `z_tb_into_stock_bill` VALUES ('3', null, null, '22', 'a13', '新增配件113', '123123', '13', null, null, '213', null, null, null, null, null);
INSERT INTO `z_tb_into_stock_bill` VALUES ('4', 'FSRQ1500773247114', null, '23', '11111', 'maytest', '10', '100', null, '2', '11', null, '2017-07-23 09:27:26', '1', '2017-07-23 10:15:46', '0');
INSERT INTO `z_tb_into_stock_bill` VALUES ('5', 'FSRQ1500773446428', null, '22', 'a13', '新增配件113', '123', '321', null, '1', '12312', '1', '2017-07-23 09:30:44', '1', '2017-07-23 09:30:44', '0');

-- ----------------------------
-- Table structure for z_tb_maintain_bill
-- ----------------------------
DROP TABLE IF EXISTS `z_tb_maintain_bill`;
CREATE TABLE `z_tb_maintain_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库配件单ID',
  `osb_id` int(11) DEFAULT NULL COMMENT '出库单ID',
  `p_id` int(11) DEFAULT NULL COMMENT '配件ID',
  `p_code` varchar(500) DEFAULT NULL COMMENT '配件编号',
  `p_name` varchar(128) NOT NULL COMMENT '配件名称',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供货商',
  `price` double DEFAULT NULL COMMENT '配件价格',
  `num` double DEFAULT NULL COMMENT '入库数',
  `unit` enum('') DEFAULT NULL COMMENT '单位',
  `tax_amt` double DEFAULT NULL COMMENT '含税金额:价格的17%自动计算',
  `total_amt` double DEFAULT NULL COMMENT '总价',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='出库配件单表';

-- ----------------------------
-- Records of z_tb_maintain_bill
-- ----------------------------
INSERT INTO `z_tb_maintain_bill` VALUES ('1', null, null, null, 'admin', null, null, null, null, null, null, null, '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0');

-- ----------------------------
-- Table structure for z_tb_out_stock_bill
-- ----------------------------
DROP TABLE IF EXISTS `z_tb_out_stock_bill`;
CREATE TABLE `z_tb_out_stock_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库单ID',
  `code` varchar(32) DEFAULT NULL COMMENT '出库编码',
  `c_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `c_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `c_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `co_id` int(11) DEFAULT NULL COMMENT '合同ID',
  `co_code` varchar(100) DEFAULT NULL COMMENT '合同编号',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='出库单表';

-- ----------------------------
-- Records of z_tb_out_stock_bill
-- ----------------------------
INSERT INTO `z_tb_out_stock_bill` VALUES ('1', null, '37', null, null, '21', null, '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0');
