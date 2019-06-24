/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50717
Source Host           : 120.77.151.83:3306
Source Database       : fusheng_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-03 00:34:25
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='属性组表';

-- ----------------------------
-- Records of sys_attr_group
-- ----------------------------
INSERT INTO `sys_attr_group` VALUES ('1', '配件仓库', 'part.stock.storagelist', '配件仓库', null, null, null, null, '0');
INSERT INTO `sys_attr_group` VALUES ('2', '配送方式', 'sender.typelist', '配送方式', null, null, null, null, '0');
INSERT INTO `sys_attr_group` VALUES ('3', '维保服务单-服务内容', 'server.maintenance.serverContents', '维保服务单-服务内容', null, null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Records of sys_attr_value
-- ----------------------------
INSERT INTO `sys_attr_value` VALUES ('1', '1', 'sys_code', '北京通州仓库', '1', '北京通州仓库', null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('2', '1', 'sys_code', '北京顺义库', '2', '北京顺义库', null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('3', '2', 'sss', '自提', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('4', '2', null, '快递', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('5', '2', null, '配送', null, null, null, null, null, null, '0');
INSERT INTO `sys_attr_value` VALUES ('6', '3', '1', '更换空气滤清器', '1', '2', '1', '2017-10-08 19:03:02', '1', '2017-10-08 19:03:02', '0');
INSERT INTO `sys_attr_value` VALUES ('7', '3', '2', '更换螺杆冷却液', '2', '2', '1', '2017-10-08 19:03:18', '1', '2017-10-08 19:03:18', '0');
INSERT INTO `sys_attr_value` VALUES ('8', '3', '12', '更换油气分离器', '3', '更换油气分离器', '1', '2017-10-08 19:03:37', '1', '2017-10-08 19:03:37', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('1', '管理员', '-1', null, null, '0', null, null, '1', '1', '2017-05-30 09:48:19', null, null, '1');
INSERT INTO `sys_depart` VALUES ('2', '财务部', '-1', null, null, '0', null, null, '1', '1', '2017-08-04 07:03:07', null, null, '0');
INSERT INTO `sys_depart` VALUES ('3', '行政部', '-1', null, null, '0', null, null, '1', '1', '2017-08-04 07:05:01', null, null, '0');
INSERT INTO `sys_depart` VALUES ('4', '服务部', '-1', null, null, '0', null, null, '1', '1', '2017-08-04 07:05:29', null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='文件存储表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', '潞新2017.7.18.png', 'upload/app/', '潞新2017.7.18.png20170718165232', '30714', null, null, 'app', '2017-07-18 16:52:32', '1', null, '2017-07-18 16:52:32', '0');
INSERT INTO `sys_file` VALUES ('2', '8.jpg', 'upload/app/', '8.jpg20170718212051', '20677', null, '86', 'device', '2017-07-18 21:20:51', '1', '1', '2017-07-20 16:14:32', '1');
INSERT INTO `sys_file` VALUES ('3', 'DSC_0182.JPG', 'upload/app/', 'DSC_0182.JPG20170718215927', '11919266', null, null, 'app', '2017-07-18 21:59:45', '1', null, '2017-07-18 21:59:45', '0');
INSERT INTO `sys_file` VALUES ('4', 'BJJT2017070019.jpg', 'upload/app/', 'BJJT2017070019.jpg20170720154213', '209895', null, '51', 'contract', '2017-07-20 15:42:14', '1', '1', '2017-07-20 15:42:19', '0');
INSERT INTO `sys_file` VALUES ('5', 'BJJT2017070018.png', 'upload/app/', 'BJJT2017070018.png20170720155751', '787826', null, '52', 'contract', '2017-07-20 15:57:52', '1', '1', '2017-07-20 15:57:54', '0');
INSERT INTO `sys_file` VALUES ('6', 'BJJT2017070017.png', 'upload/app/', 'BJJT2017070017.png20170720160204', '752955', null, '53', 'contract', '2017-07-20 16:02:05', '1', '1', '2017-07-20 16:02:07', '0');
INSERT INTO `sys_file` VALUES ('7', 'BJJT2017070016.png', 'upload/app/', 'BJJT2017070016.png20170720195411', '788273', null, '54', 'contract', '2017-07-20 19:54:12', '1', '1', '2017-07-20 19:54:14', '0');
INSERT INTO `sys_file` VALUES ('8', 'BJJT2017070015.jpg', 'upload/app/', 'BJJT2017070015.jpg20170720203224', '224277', null, '55', 'contract', '2017-07-20 20:32:24', '1', '1', '2017-07-20 20:32:26', '0');
INSERT INTO `sys_file` VALUES ('9', 'BJJT2017070014.png', 'upload/app/', 'BJJT2017070014.png20170720204310', '887035', null, '56', 'contract', '2017-07-20 20:43:11', '1', '1', '2017-07-20 20:43:13', '0');
INSERT INTO `sys_file` VALUES ('10', 'BJJT2017070020.png', 'upload/app/', 'BJJT2017070020.png20170721135252', '19154', null, '57', 'contract', '2017-07-21 13:52:52', '1', '1', '2017-07-21 13:52:54', '0');
INSERT INTO `sys_file` VALUES ('11', 'BJJT2017070021.png', 'upload/app/', 'BJJT2017070021.png20170721135727', '20942', null, '58', 'contract', '2017-07-21 13:57:27', '1', '1', '2017-07-21 13:57:28', '0');
INSERT INTO `sys_file` VALUES ('12', 'BJJT2017070013.jpg', 'upload/app/', 'BJJT2017070013.jpg20170721144434', '2096129', null, null, 'app', '2017-07-21 14:44:37', '1', null, '2017-07-21 14:44:37', '0');
INSERT INTO `sys_file` VALUES ('13', 'BJJT2017070013.jpg', 'upload/app/', 'BJJT2017070013.jpg20170721144450', '2096129', null, '59', 'contract', '2017-07-21 14:44:53', '1', '1', '2017-07-21 14:44:55', '0');
INSERT INTO `sys_file` VALUES ('14', 'BJJT2017070018.jpg', 'upload/app/', 'BJJT2017070018.jpg20170721144508', '1355206', null, null, 'app', '2017-07-21 14:45:10', '1', null, '2017-07-21 14:45:10', '0');
INSERT INTO `sys_file` VALUES ('15', 'BJJT2017070018-1.jpg', 'upload/app/', 'BJJT2017070018-1.jpg20170721144704', '1355206', null, null, 'app', '2017-07-21 14:47:06', '1', null, '2017-07-21 14:47:06', '0');
INSERT INTO `sys_file` VALUES ('16', 'BJJT2017070018-1.jpg', 'upload/app/', 'BJJT2017070018-1.jpg20170721144908', '1355206', null, null, 'app', '2017-07-21 14:49:10', '1', null, '2017-07-21 14:49:10', '0');
INSERT INTO `sys_file` VALUES ('17', 'BJJT2017070018-1.jpg', 'upload/app/', 'BJJT2017070018-1.jpg20170721145017', '1355206', null, '60', 'contract', '2017-07-21 14:50:19', '1', '1', '2017-07-21 14:50:21', '0');
INSERT INTO `sys_file` VALUES ('18', 'BJJT2017070012.jpg', 'upload/app/', 'BJJT2017070012.jpg20170721145612', '1285143', null, '61', 'contract', '2017-07-21 14:56:14', '1', '1', '2017-07-21 14:56:16', '0');
INSERT INTO `sys_file` VALUES ('19', 'BJJT2017070011.jpg', 'upload/app/', 'BJJT2017070011.jpg20170721152238', '1617009', null, '62', 'contract', '2017-07-21 15:22:40', '1', '1', '2017-07-21 15:22:42', '0');
INSERT INTO `sys_file` VALUES ('20', 'BJJT20170010.png', 'upload/app/', 'BJJT20170010.png20170721152648', '697591', null, '63', 'contract', '2017-07-21 15:26:49', '1', '1', '2017-07-21 15:26:51', '0');
INSERT INTO `sys_file` VALUES ('21', 'BJJT2017070009.png', 'upload/app/', 'BJJT2017070009.png20170721153115', '467407', null, '64', 'contract', '2017-07-21 15:31:16', '1', '1', '2017-07-21 15:31:17', '0');
INSERT INTO `sys_file` VALUES ('22', 'BJJT201707070022.png', 'upload/app/', 'BJJT201707070022.png20170721170630', '48984', null, '65', 'contract', '2017-07-21 17:06:30', '1', '1', '2017-07-21 17:06:31', '0');
INSERT INTO `sys_file` VALUES ('23', '徐水长城汽车保定曼德合同.pdf', 'upload/app/', '徐水长城汽车保定曼德合同.pdf20170721192943', '8061646', null, '66', 'contract', '2017-07-21 19:29:55', '1', '1', '2017-07-21 19:29:58', '0');
INSERT INTO `sys_file` VALUES ('24', 'BJJT2017070024.png', 'upload/app/', 'BJJT2017070024.png20170724075328', '323660', null, '67', 'contract', '2017-07-24 07:53:28', '1', '1', '2017-07-24 07:53:30', '0');
INSERT INTO `sys_file` VALUES ('25', 'BJJT20170070008.png', 'upload/app/', 'BJJT20170070008.png20170724081623', '764700', null, '68', 'contract', '2017-07-24 08:16:24', '1', '1', '2017-07-24 08:16:26', '0');
INSERT INTO `sys_file` VALUES ('26', 'BJJT2017070007.png', 'upload/app/', 'BJJT2017070007.png20170724082303', '917607', null, '69', 'contract', '2017-07-24 08:23:05', '1', '1', '2017-07-24 08:23:09', '0');
INSERT INTO `sys_file` VALUES ('27', 'BJJT2017070006.png', 'upload/app/', 'BJJT2017070006.png20170724082654', '861633', null, '70', 'contract', '2017-07-24 08:26:56', '1', '1', '2017-07-24 08:26:57', '0');
INSERT INTO `sys_file` VALUES ('28', 'BJJT2017070005.png', 'upload/app/', 'BJJT2017070005.png20170724083003', '1204540', null, '71', 'contract', '2017-07-24 08:30:04', '1', '1', '2017-08-21 08:40:30', '0');
INSERT INTO `sys_file` VALUES ('29', '查看相间.jpg', 'upload/app/', '查看相间.jpg20170731210009', '97953', null, null, 'app', '2017-07-31 21:00:09', '1', null, '2017-07-31 21:00:09', '0');
INSERT INTO `sys_file` VALUES ('30', 'Capture001.png', 'upload/app/', 'Capture001.png20170801071304', '357679', null, '87', 'device', '2017-08-01 07:13:04', '1', '1', '2017-08-01 07:18:41', '1');
INSERT INTO `sys_file` VALUES ('31', '1465575923433_33812.jpg', 'upload/app/', '1465575923433_33812.jpg20170802003157', '3284', null, '72', 'contract', '2017-08-02 00:31:57', '1', '1', '2017-08-02 00:33:01', '0');
INSERT INTO `sys_file` VALUES ('32', '8.jpg', 'upload/app/', '8.jpg20170802081208', '20677', null, '92', 'device', '2017-08-02 08:12:08', '1', '1', '2017-08-02 08:12:43', '1');
INSERT INTO `sys_file` VALUES ('33', '设备信息中非必填的去掉红色标记.jpg', 'upload/app/', '设备信息中非必填的去掉红色标记.jpg20170803055353', '35676', null, '106', 'device', '2017-08-03 05:53:53', '1', '1', '2017-08-03 05:58:45', '0');
INSERT INTO `sys_file` VALUES ('34', '客户管理批量导入空行.jpg', 'upload/app/', '客户管理批量导入空行.jpg20170803055654', '50864', null, '106', 'device', '2017-08-03 05:56:54', '1', '1', '2017-08-03 05:57:46', '1');
INSERT INTO `sys_file` VALUES ('35', 'devicetmp.xlsx', 'upload/app/', 'devicetmp.xlsx20170803061304', '9367', null, '73', 'contract', '2017-08-03 06:13:04', '1', '1', '2017-08-21 08:40:26', '0');
INSERT INTO `sys_file` VALUES ('36', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload/app/', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170803061334', '18544', null, '108', 'device', '2017-08-03 06:13:35', '1', '1', '2017-08-03 06:14:15', '1');
INSERT INTO `sys_file` VALUES ('37', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload/app/', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170803061412', '18544', null, '108', 'device', '2017-08-03 06:14:13', '1', '1', '2017-09-19 20:47:16', '1');
INSERT INTO `sys_file` VALUES ('38', 'customertmp.xls', 'upload/app/', 'customertmp.xls20170803061729', '23552', null, '74', 'contract', '2017-08-03 06:17:29', '1', '1', '2017-08-21 08:40:23', '0');
INSERT INTO `sys_file` VALUES ('39', '客户管理批量导入空行.jpg', 'upload/app/', '客户管理批量导入空行.jpg20170804062736', '50864', null, '8', 'part', '2017-08-04 06:27:36', '1', '1', '2017-08-04 06:27:38', '0');
INSERT INTO `sys_file` VALUES ('40', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload/app/', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170804074616', '18544', null, null, 'app', '2017-08-04 07:46:16', '1', null, '2017-08-04 07:46:16', '0');
INSERT INTO `sys_file` VALUES ('41', '客户管理批量导入空行.jpg', 'upload/app/', '客户管理批量导入空行.jpg20170804085834', '50864', null, '109', 'device', '2017-08-04 08:58:34', '1', '1', '2017-09-19 20:47:13', '1');
INSERT INTO `sys_file` VALUES ('42', '设备详情显示图片位置.jpg', 'upload/app/', '设备详情显示图片位置.jpg20170804085938', '32959', null, '10', 'part', '2017-08-04 08:59:38', '1', '1', '2017-08-04 08:59:40', '0');
INSERT INTO `sys_file` VALUES ('43', '2.jpg', 'upload/app/', '2.jpg20170808082519', '47768', null, '110', 'device', '2017-08-08 08:25:19', '1', '1', '2017-08-25 08:19:40', '1');
INSERT INTO `sys_file` VALUES ('44', '2.jpg', 'upload/app/', '2.jpg20170821073459', '47768', null, null, 'app', '2017-08-21 07:34:59', '1', null, '2017-08-21 07:34:59', '0');
INSERT INTO `sys_file` VALUES ('45', '2.jpg', 'upload/app/', '2.jpg20170821074104', '47768', null, '111', 'device', '2017-08-21 07:41:04', '1', '1', '2017-09-19 20:47:09', '1');
INSERT INTO `sys_file` VALUES ('46', '2.jpg', 'upload/app/', '2.jpg20170821074218', '47768', null, '11', 'maintenance', '2017-08-21 07:42:18', '1', '1', '2017-08-21 08:38:12', '1');
INSERT INTO `sys_file` VALUES ('47', 'devicetmp.xlsx', 'upload/app/', 'devicetmp.xlsx20170821075031', '9367', null, '11', 'debug', '2017-08-21 07:50:31', '1', '1', '2017-08-21 07:50:57', '0');
INSERT INTO `sys_file` VALUES ('48', '2.jpg', 'upload/app/', '2.jpg20170821075056', '47768', null, '11', 'debug', '2017-08-21 07:50:56', '1', '1', '2017-08-21 07:50:57', '0');
INSERT INTO `sys_file` VALUES ('49', '2.jpg', 'upload/app/', '2.jpg20170821075713', '47768', null, null, 'app', '2017-08-21 07:57:13', '1', null, '2017-08-21 07:57:13', '0');
INSERT INTO `sys_file` VALUES ('50', '2.jpg', 'upload/app/', '2.jpg20170821075851', '47768', null, '13', 'debug', '2017-08-21 07:58:51', '1', '1', '2017-08-21 07:58:56', '0');
INSERT INTO `sys_file` VALUES ('51', 'devicetmp.xlsx', 'upload/app/', 'devicetmp.xlsx20170821080046', '9367', null, '76', 'contract', '2017-08-21 08:00:46', '1', '1', '2017-08-21 08:40:19', '0');
INSERT INTO `sys_file` VALUES ('52', '2.jpg', 'upload/app/', '2.jpg20170821080945', '47768', null, '11', 'part', '2017-08-21 08:09:45', '1', '1', '2017-08-21 08:10:08', '0');
INSERT INTO `sys_file` VALUES ('53', '313.jpg', 'upload\\app\\', '313.jpg20170821214644', '9290', '.jpg', null, 'app', '2017-08-21 21:46:45', '1', null, '2017-08-21 21:46:45', '0');
INSERT INTO `sys_file` VALUES ('54', '8.jpg', 'upload/app/', '8.jpg20170821220327', '20677', null, '13', 'maintenance', '2017-08-21 22:03:27', '1', '1', '2017-08-21 22:03:28', '0');
INSERT INTO `sys_file` VALUES ('55', '8.jpg', 'upload/app/', '8.jpg20170821220425', '20677', null, '14', 'maintenance', '2017-08-21 22:04:25', '1', '1', '2017-08-21 22:04:51', '0');
INSERT INTO `sys_file` VALUES ('56', '313.jpg', 'upload/app/', '313.jpg20170821221203', '9290', null, '15', 'maintenance', '2017-08-21 22:12:04', '1', '1', '2017-08-21 22:19:39', '1');
INSERT INTO `sys_file` VALUES ('57', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG', 'upload\\app\\', 'u=2406005677,1593948214&fm=173&s=7DB48F54D537FBDE0E5E54CE0300B0B8&w=218&h=146&img.JPEG20170822062410', '18544', null, null, 'app', '2017-08-22 06:24:09', '1', null, '2017-08-22 06:24:09', '0');
INSERT INTO `sys_file` VALUES ('58', '微信图片_20170813231417.jpg', 'upload/app/', '微信图片_20170813231417.jpg20170822073501', '78847', null, '16', 'maintenance', '2017-08-22 07:35:01', '1', '1', '2017-08-26 21:54:21', '0');
INSERT INTO `sys_file` VALUES ('59', '2.jpg', 'upload/app/', '2.jpg20170826215219', '47768', null, '17', 'maintenance', '2017-08-26 21:52:19', '1', '1', '2017-08-26 21:52:35', '0');
INSERT INTO `sys_file` VALUES ('60', '2.jpg', 'upload/app/', '2.jpg20170826215507', '47768', null, '120', 'device', '2017-08-26 21:55:07', '1', '1', '2017-09-19 20:47:03', '1');
INSERT INTO `sys_file` VALUES ('61', '2.jpg', 'upload/app/', '2.jpg20170826215538', '47768', null, null, 'app', '2017-08-26 21:55:39', '1', null, '2017-08-26 21:55:39', '0');
INSERT INTO `sys_file` VALUES ('62', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827220837', '78847', null, '121', 'device', '2017-08-27 22:08:39', '1', '1', '2017-08-27 22:09:55', '1');
INSERT INTO `sys_file` VALUES ('63', '微信图片_20170813231424.jpg', 'upload/app/', '微信图片_20170813231424.jpg20170827220924', '96363', null, '122', 'device', '2017-08-27 22:09:27', '1', '1', '2017-08-27 22:09:46', '0');
INSERT INTO `sys_file` VALUES ('64', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827222426', '78847', null, '18', 'maintenance', '2017-08-27 22:24:28', '1', '1', '2017-08-27 22:27:03', '0');
INSERT INTO `sys_file` VALUES ('65', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827225211', '78847', null, null, 'app', '2017-08-27 22:52:13', '1', null, '2017-08-27 22:52:13', '0');
INSERT INTO `sys_file` VALUES ('66', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827225320', '78847', null, '16', 'debug', '2017-08-27 22:53:22', '1', '1', '2017-08-27 22:54:41', '0');
INSERT INTO `sys_file` VALUES ('67', '微信图片_20170813231424.jpg', 'upload\\app\\', '微信图片_20170813231424.jpg20170827225323', '96363', null, '16', 'debug', '2017-08-27 22:53:26', '1', '1', '2017-08-27 22:54:41', '0');
INSERT INTO `sys_file` VALUES ('68', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827225457', '78847', null, '17', 'debug', '2017-08-27 22:54:59', '1', '1', '2017-10-08 18:26:04', '0');
INSERT INTO `sys_file` VALUES ('69', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827225529', '78847', null, '12', 'part', '2017-08-27 22:55:31', '1', '1', '2017-08-27 22:55:34', '0');
INSERT INTO `sys_file` VALUES ('70', '微信图片_20170813231417.jpg', 'upload\\app\\', '微信图片_20170813231417.jpg20170827225721', '78847', null, '13', 'part', '2017-08-27 22:57:23', '1', '1', '2017-10-09 07:23:48', '1');
INSERT INTO `sys_file` VALUES ('71', 'jdq资源组.jpg', 'upload/app/', 'jdq资源组.jpg20170829195415', '41310', null, null, 'app', '2017-08-29 19:54:15', '1', null, '2017-08-29 19:54:15', '0');
INSERT INTO `sys_file` VALUES ('72', '2.jpg', 'upload/app/', '2.jpg20170910221435', '47768', null, '18', 'debug', '2017-09-10 22:14:35', '1', '1', '2017-09-10 22:14:41', '0');
INSERT INTO `sys_file` VALUES ('73', '设备详情显示图片位置.jpg', 'upload/app/', '设备详情显示图片位置.jpg20170910221959', '32959', null, '125', 'device', '2017-09-10 22:19:59', '1', '1', '2017-09-10 22:20:01', '0');
INSERT INTO `sys_file` VALUES ('74', 'cha.png', 'upload\\app\\', 'cha.png20170924111418', '13854', null, '22', 'maintenance', '2017-09-24 11:14:15', '1', '1', '2017-09-24 11:14:21', '0');
INSERT INTO `sys_file` VALUES ('75', 'cha.png', 'upload\\app\\', 'cha.png20170924112358', '13854', null, '19', 'debug', '2017-09-24 11:23:55', '1', '1', '2017-09-24 11:24:54', '0');
INSERT INTO `sys_file` VALUES ('76', 'bg-img.jpg', 'upload\\app\\', 'bg-img.jpg20171009063649', '3006', null, '128', 'device', '2017-10-09 06:37:50', '1', '1', '2017-10-09 07:19:56', '0');
INSERT INTO `sys_file` VALUES ('77', 'icon5.png', 'upload\\app\\', 'icon5.png20171009071850', '2056', null, '128', 'device', '2017-10-09 07:19:52', '1', '1', '2017-10-09 07:19:56', '0');
INSERT INTO `sys_file` VALUES ('78', 'icon6.png', 'upload\\app\\', 'icon6.png20171009071854', '4223', null, '128', 'device', '2017-10-09 07:19:55', '1', '1', '2017-10-09 07:19:56', '0');
INSERT INTO `sys_file` VALUES ('79', 'img1.png', 'upload\\app\\', 'img1.png20171009072239', '129342', null, '13', 'part', '2017-10-09 07:23:41', '1', '1', '2017-10-09 07:23:48', '0');
INSERT INTO `sys_file` VALUES ('80', 'icon6.png', 'upload\\app\\', 'icon6.png20171009072242', '4223', null, '13', 'part', '2017-10-09 07:23:43', '1', '1', '2017-10-09 07:23:48', '0');
INSERT INTO `sys_file` VALUES ('81', 'slide1.png', 'upload\\app\\', 'slide1.png20171009072245', '88283', null, '13', 'part', '2017-10-09 07:23:47', '1', '1', '2017-10-09 07:23:48', '0');
INSERT INTO `sys_file` VALUES ('82', 'icon6.png', 'upload\\app\\', 'icon6.png20171009142118', '4223', null, '14', 'part', '2017-10-09 22:21:18', '1', '1', '2017-10-09 22:21:27', '0');
INSERT INTO `sys_file` VALUES ('83', 'icon7.png', 'upload\\app\\', 'icon7.png20171009142121', '2541', null, '14', 'part', '2017-10-09 22:21:21', '1', '1', '2017-10-09 22:21:27', '0');
INSERT INTO `sys_file` VALUES ('84', 'timg (1).jpg', 'upload\\app\\', 'timg (1).jpg20171015223811', '117361', null, '29', 'maintenance', '2017-10-15 22:38:09', '1', '1', '2017-10-15 22:38:48', '0');
INSERT INTO `sys_file` VALUES ('85', 'timg.jpg', 'upload\\app\\', 'timg.jpg20171015223818', '79904', null, '29', 'maintenance', '2017-10-15 22:38:16', '1', '1', '2017-10-15 22:38:48', '0');
INSERT INTO `sys_file` VALUES ('86', '62.jpg', 'upload\\app\\', '62.jpg20171015225420', '148931', null, '20', 'debug', '2017-10-15 22:54:18', '1', '1', '2017-10-15 22:54:35', '0');
INSERT INTO `sys_file` VALUES ('87', 'timg (1).jpg', 'upload\\app\\', 'timg (1).jpg20171015225427', '117361', null, '20', 'debug', '2017-10-15 22:54:25', '1', '1', '2017-10-15 22:54:35', '0');
INSERT INTO `sys_file` VALUES ('88', 'timg.jpg', 'upload\\app\\', 'timg.jpg20171015225436', '79904', null, '20', 'debug', '2017-10-15 22:54:34', '1', '1', '2017-10-15 22:54:35', '0');
INSERT INTO `sys_file` VALUES ('89', '1508256079065.jpg', 'upload/app/', '1508256079065.jpg20171018000123', '6581432', null, null, 'app', '2017-10-18 00:01:35', '1', null, '2017-10-18 00:01:35', '0');
INSERT INTO `sys_file` VALUES ('90', '1508256100557.jpg', 'upload/app/', '1508256100557.jpg20171018000146', '3253337', null, null, 'app', '2017-10-18 00:01:52', '1', null, '2017-10-18 00:01:52', '0');
INSERT INTO `sys_file` VALUES ('91', '1508256159130.jpg', 'upload/app/', '1508256159130.jpg20171018000253', '6581432', null, null, 'app', '2017-10-18 00:03:04', '1', null, '2017-10-18 00:03:04', '0');
INSERT INTO `sys_file` VALUES ('92', '1508256244842.jpg', 'upload/app/', '1508256244842.jpg20171018000413', '6581432', null, null, 'app', '2017-10-18 00:04:24', '1', null, '2017-10-18 00:04:24', '0');
INSERT INTO `sys_file` VALUES ('93', '1508338882798.jpg', 'upload/app/', '1508338882798.jpg20171018230128', '8112955', null, null, 'app', '2017-10-18 23:01:42', '1', null, '2017-10-18 23:01:42', '0');
INSERT INTO `sys_file` VALUES ('94', '1508339093577.jpg', 'upload/app/', '1508339093577.jpg20171018230457', '6581432', null, null, 'app', '2017-10-18 23:05:09', '1', null, '2017-10-18 23:05:09', '0');
INSERT INTO `sys_file` VALUES ('95', '1508422775286.jpg', 'upload/app/', '1508422775286.jpg20171019221943', '8112955', null, null, 'app', '2017-10-19 22:19:57', '1', null, '2017-10-19 22:19:57', '0');
INSERT INTO `sys_file` VALUES ('96', 'Chrysanthemum.jpg', 'upload\\app\\', 'Chrysanthemum.jpg20171022145351', '879394', null, null, 'app', '2017-10-22 14:53:54', '1', null, '2017-10-22 14:53:54', '0');
INSERT INTO `sys_file` VALUES ('97', 'Penguins.jpg', 'upload\\app\\', 'Penguins.jpg20171022145404', '777835', null, null, 'app', '2017-10-22 14:54:06', '1', null, '2017-10-22 14:54:06', '0');
INSERT INTO `sys_file` VALUES ('98', 'Tulips.jpg', 'upload\\app\\', 'Tulips.jpg20171022145436', '620888', null, null, 'app', '2017-10-22 14:54:38', '1', null, '2017-10-22 14:54:38', '0');
INSERT INTO `sys_file` VALUES ('99', 'Penguins.jpg', 'upload\\app\\', 'Penguins.jpg20171022145646', '777835', null, null, 'app', '2017-10-22 14:56:49', '1', null, '2017-10-22 14:56:49', '0');
INSERT INTO `sys_file` VALUES ('100', 'Lighthouse.jpg', 'upload\\app\\', 'Lighthouse.jpg20171022145655', '561276', null, null, 'app', '2017-10-22 14:56:57', '1', null, '2017-10-22 14:56:57', '0');
INSERT INTO `sys_file` VALUES ('101', 'Koala.jpg', 'upload\\app\\', 'Koala.jpg20171022145755', '780831', null, null, 'app', '2017-10-22 14:57:57', '1', null, '2017-10-22 14:57:57', '0');
INSERT INTO `sys_file` VALUES ('102', 'Tulips.jpg', 'upload\\app\\', 'Tulips.jpg20171022145931', '620888', null, null, 'app', '2017-10-22 14:59:32', '1', null, '2017-10-22 14:59:32', '0');
INSERT INTO `sys_file` VALUES ('103', 'Desert.jpg', 'upload\\app\\', 'Desert.jpg20171022150852', '845941', null, null, 'app', '2017-10-22 15:08:55', '1', null, '2017-10-22 15:08:55', '0');
INSERT INTO `sys_file` VALUES ('104', 'Penguins.jpg', 'upload\\app\\', 'Penguins.jpg20171022151331', '777835', null, null, 'app', '2017-10-22 15:13:33', '1', null, '2017-10-22 15:13:33', '0');
INSERT INTO `sys_file` VALUES ('105', 'Jellyfish.jpg', 'upload\\app\\', 'Jellyfish.jpg20171022151336', '775702', null, null, 'app', '2017-10-22 15:13:38', '1', null, '2017-10-22 15:13:38', '0');
INSERT INTO `sys_file` VALUES ('106', 'Jellyfish.jpg', 'upload\\app\\', 'Jellyfish.jpg20171022151353', '775702', null, null, 'app', '2017-10-22 15:13:56', '1', null, '2017-10-22 15:13:56', '0');
INSERT INTO `sys_file` VALUES ('107', 'Penguins.jpg', 'upload\\app\\', 'Penguins.jpg20171022153443', '777835', null, null, 'app', '2017-10-22 15:34:46', '1', null, '2017-10-22 15:34:46', '0');
INSERT INTO `sys_file` VALUES ('108', 'Tulips.jpg', 'upload\\app\\', 'Tulips.jpg20171022153450', '620888', null, null, 'app', '2017-10-22 15:34:52', '1', null, '2017-10-22 15:34:52', '0');
INSERT INTO `sys_file` VALUES ('109', 'Koala.jpg', 'upload\\app\\', 'Koala.jpg20171022153933', '780831', null, null, 'app', '2017-10-22 15:39:35', '1', null, '2017-10-22 15:39:35', '0');
INSERT INTO `sys_file` VALUES ('110', 'Koala.jpg', 'upload\\app\\', 'Koala.jpg20171022154047', '780831', null, null, 'app', '2017-10-22 15:40:49', '1', null, '2017-10-22 15:40:49', '0');
INSERT INTO `sys_file` VALUES ('111', 'Lighthouse.jpg', 'upload\\app\\', 'Lighthouse.jpg20171022154145', '561276', null, null, 'app', '2017-10-22 15:41:47', '1', null, '2017-10-22 15:41:47', '0');
INSERT INTO `sys_file` VALUES ('112', '1508681830790.jpg', 'upload/app/', '1508681830790.jpg20171022221718', '6581432', null, null, 'app', '2017-10-22 22:17:30', '1', null, '2017-10-22 22:17:30', '0');
INSERT INTO `sys_file` VALUES ('113', '1508682321759.jpg', 'upload/app/', '1508682321759.jpg20171022222525', '3253337', null, null, 'app', '2017-10-22 22:25:31', '1', null, '2017-10-22 22:25:31', '0');
INSERT INTO `sys_file` VALUES ('114', '1508682365537.jpg', 'upload/app/', '1508682365537.jpg20171022222618', '8112955', null, null, 'app', '2017-10-22 22:26:32', '1', null, '2017-10-22 22:26:32', '0');
INSERT INTO `sys_file` VALUES ('115', '1508682409359.jpg', 'upload/app/', '1508682409359.jpg20171022222658', '6581432', null, null, 'app', '2017-10-22 22:27:10', '1', null, '2017-10-22 22:27:10', '0');
INSERT INTO `sys_file` VALUES ('116', '1508682717121.jpg', 'upload/app/', '1508682717121.jpg20171022223215', '6209998', null, null, 'app', '2017-10-22 22:32:26', '1', null, '2017-10-22 22:32:26', '0');
INSERT INTO `sys_file` VALUES ('117', '1508682752236.jpg', 'upload/app/', '1508682752236.jpg20171022223244', '8112955', null, null, 'app', '2017-10-22 22:32:58', '1', null, '2017-10-22 22:32:58', '0');
INSERT INTO `sys_file` VALUES ('118', '1508682783857.jpg', 'upload/app/', '1508682783857.jpg20171022223312', '6581432', null, null, 'app', '2017-10-22 22:33:24', '1', null, '2017-10-22 22:33:24', '0');
INSERT INTO `sys_file` VALUES ('119', '1508682906991.jpg', 'upload/app/', '1508682906991.jpg20171022223512', '6581432', null, null, 'app', '2017-10-22 22:35:24', '1', null, '2017-10-22 22:35:24', '0');
INSERT INTO `sys_file` VALUES ('120', '1508859992268.jpg', 'upload/app/', '1508859992268.jpg20171024234650', '5706951', null, null, 'app', '2017-10-24 23:47:00', '1', null, '2017-10-24 23:47:00', '0');
INSERT INTO `sys_file` VALUES ('121', '1508945270287.jpg', 'upload/app/', '1508945270287.jpg20171025232804', '6581432', null, null, 'app', '2017-10-25 23:28:16', '1', null, '2017-10-25 23:28:16', '0');
INSERT INTO `sys_file` VALUES ('122', '1509682595088.jpg', 'upload/app/', '1509682595088.jpg20171103121652', '2472807', null, null, 'app', '2017-11-03 12:16:57', '1', null, '2017-11-03 12:16:57', '0');
INSERT INTO `sys_file` VALUES ('123', '1509892392337.jpg', 'upload/app/', '1509892392337.jpg20171105223319', '5006492', null, null, 'app', '2017-11-05 22:33:28', '1', null, '2017-11-05 22:33:28', '0');
INSERT INTO `sys_file` VALUES ('124', '1509892416583.jpg', 'upload/app/', '1509892416583.jpg20171105223336', '186832', null, null, 'app', '2017-11-05 22:33:37', '1', null, '2017-11-05 22:33:37', '0');

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
INSERT INTO `sys_function` VALUES ('2', null, '0', '客户管理', '1', 'customer_manager', '#', null, '-1', '7', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('3', null, '0', '合同管理', '5', 'contrat_manager', '#', null, '-1', '3', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('4', null, '0', '运营服务', '4', '', '#', null, '-1', '4', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('5', null, '0', '设备管理', '2', 'device_manager', '#', null, '-1', '9', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('6', null, '0', '出入库管理', '3', null, '#', null, '-1', '2', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('7', null, '1', '用户管理', '1', null, '/user/index.html', null, '1', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('8', null, '1', '角色管理', '2', 'role_manager', '/role/index.html', null, '1', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('9', null, '1', '合同管理', '1', null, '/contract/index.html', null, '3', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('10', null, '1', '客户管理', '1', 'customer_manager', '/customer/index.html', null, '2', '1', '0', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('11', null, '1', '设备管理', '1', 'device_manager', '/device/index.html', null, '5', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('13', null, '1', '配件管理', '2', null, '/part/index.html', null, '5', '1', '0', null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('14', null, '1', '客户详情', '1', 'customer_manager', '/customer/info.html', null, '2', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('15', null, '1', '设备详情', '1', 'device_manager', '/device/info.html', null, '5', '1', '1', '1', null, null, null, '0');
INSERT INTO `sys_function` VALUES ('16', null, '0', '首页', '0', 'home_page', '/index.html', null, '-1', '6', '0', '1', null, '1', null, '0');
INSERT INTO `sys_function` VALUES ('17', null, '1', '入库管理', '1', 'repertory_in', '/repertory/in/index.html', null, '6', '6', '0', null, null, null, null, '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='图标定义表';

-- ----------------------------
-- Records of sys_icon
-- ----------------------------
INSERT INTO `sys_icon` VALUES ('1', null, 'menu-icon fa fa-calendar', null, '日历', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('2', null, 'menu-icon fa fa-picture-o', null, '图片', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('3', null, 'menu-icon fa fa-list-alt', null, '列表', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('4', null, 'menu-icon fa fa-pencil-square-o', null, '表单', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('5', null, 'menu-icon fa fa-desktop', null, '桌面', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('6', null, 'ace-icon fa fa-home home-icon', null, '首页', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('7', null, 'menu-icon fa fa-users', null, '用户', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('8', null, 'menu-icon fa fa-cogs', null, '配置管理', null, null, null, null, null, null, '0');
INSERT INTO `sys_icon` VALUES ('9', null, 'menu-icon fa fa-leaf', null, '叶子', null, null, null, null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '1', '7', null, null, '1', '2017-07-17 09:32:12', '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', '6', null, null, '1', '2017-07-17 09:33:06', '1', '2017-08-04 07:07:46', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', '5', null, null, '1', '2017-07-17 09:33:46', '1', '2017-08-04 07:07:55', '1');
INSERT INTO `sys_permission` VALUES ('4', '1', '4', null, null, '1', '2017-07-17 09:34:57', '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_permission` VALUES ('5', '1', '3', null, null, '1', '2017-07-17 09:35:06', '1', '2017-08-04 07:08:17', '1');
INSERT INTO `sys_permission` VALUES ('6', '1', '2', null, null, '1', '2017-07-17 09:35:16', '1', '2017-08-04 07:08:27', '1');
INSERT INTO `sys_permission` VALUES ('7', '1', '1', null, null, '1', '2017-07-17 09:36:53', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', '7', null, null, '1', '2017-08-04 07:07:30', '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', '6', null, null, '1', '2017-08-04 07:07:46', '1', '2017-08-04 07:07:46', '0');
INSERT INTO `sys_permission` VALUES ('10', '2', '5', null, null, '1', '2017-08-04 07:07:55', '1', '2017-08-04 07:07:55', '0');
INSERT INTO `sys_permission` VALUES ('11', '2', '4', null, null, '1', '2017-08-04 07:08:05', '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_permission` VALUES ('12', '2', '3', null, null, '1', '2017-08-04 07:08:17', '1', '2017-08-04 07:08:17', '0');
INSERT INTO `sys_permission` VALUES ('13', '2', '2', null, null, '1', '2017-08-04 07:08:27', '1', '2017-08-04 07:08:27', '0');
INSERT INTO `sys_permission` VALUES ('14', '1', '1', null, null, '1', '2017-08-04 07:08:46', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('15', '2', '7', null, null, '1', '2017-08-04 07:08:56', '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_permission` VALUES ('16', '2', '4', null, null, '1', '2017-08-25 08:40:06', '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_permission` VALUES ('17', '2', '7', null, null, '1', '2017-08-25 08:40:29', '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_permission` VALUES ('18', '2', '4', null, null, '1', '2017-08-25 15:56:07', '1', '2017-08-25 15:56:07', '0');
INSERT INTO `sys_permission` VALUES ('19', '2', '7', null, null, '1', '2017-09-10 20:24:11', '1', '2017-09-10 20:24:11', '0');
INSERT INTO `sys_permission` VALUES ('20', '1', '1', null, null, '1', '2017-10-08 17:15:58', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('21', '1', '1', null, null, '1', '2017-10-08 17:19:25', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('22', '1', '1', null, null, '1', '2017-10-08 17:20:15', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('23', '1', '1', null, null, '1', '2017-10-08 17:28:41', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('24', '1', '1', null, null, '1', '2017-10-08 17:29:39', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('25', '1', '1', null, null, '1', '2017-10-08 17:32:42', '1', '2017-10-08 17:40:35', '1');
INSERT INTO `sys_permission` VALUES ('26', '1', '1', null, null, '1', '2017-10-08 17:40:35', '1', '2017-10-08 17:40:35', '0');

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
  `role_code` varchar(10) DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名字',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'sys_admin', '管理员', '1', '2017-07-17 09:31:35', '1', '2017-08-03 06:11:12', '0');
INSERT INTO `sys_role` VALUES ('2', 'engineer', '服务工程师', '1', '2017-07-18 21:55:45', '1', '2017-07-18 21:55:45', '0');
INSERT INTO `sys_role` VALUES ('3', '3', '行政人员', '1', '2017-08-03 07:18:52', '1', '2017-08-03 07:20:15', '0');
INSERT INTO `sys_role` VALUES ('4', '4', '山西办', '1', '2017-08-26 22:00:58', '1', '2017-08-26 22:00:58', '0');

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
  `function_id` int(32) DEFAULT NULL COMMENT '菜单ID',
  `role_id` int(32) DEFAULT NULL COMMENT '角色ID',
  `data_rule` varchar(1000) DEFAULT NULL COMMENT '数据权限规则ID',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`role_func_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('1', null, '16', '1', null, '1', '2017-07-17 09:31:53', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('2', null, '2', '1', null, '1', '2017-07-17 09:31:53', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('3', null, '14', '1', null, '1', '2017-07-17 09:31:53', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('4', null, '10', '1', null, '1', '2017-07-17 09:31:54', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('5', null, '5', '1', null, '1', '2017-07-17 09:31:54', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('6', null, '11', '1', null, '1', '2017-07-17 09:31:54', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('7', null, '15', '1', null, '1', '2017-07-17 09:31:55', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('8', null, '13', '1', null, '1', '2017-07-17 09:31:55', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('9', null, '3', '1', null, '1', '2017-07-17 09:31:55', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('10', null, '9', '1', null, '1', '2017-07-17 09:31:56', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('11', null, '1', '1', null, '1', '2017-07-17 09:31:56', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('12', null, '7', '1', null, '1', '2017-07-17 09:31:56', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('13', null, '8', '1', null, '1', '2017-07-17 09:31:57', '1', '2017-08-02 08:19:22', '1');
INSERT INTO `sys_role_function` VALUES ('14', null, '16', '1', null, '1', '2017-08-02 08:19:22', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('15', null, '2', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('16', null, '14', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('17', null, '10', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('18', null, '5', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('19', null, '11', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('20', null, '15', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('21', null, '13', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('22', null, '6', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('23', null, '23', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('24', null, '17', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('25', null, '20', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('26', null, '22', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('27', null, '3', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('28', null, '9', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('29', null, '18', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('30', null, '1', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('31', null, '7', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('32', null, '8', '1', null, '1', '2017-08-02 08:19:23', '1', '2017-08-02 08:19:52', '1');
INSERT INTO `sys_role_function` VALUES ('33', null, '16', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('34', null, '2', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('35', null, '14', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('36', null, '10', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('37', null, '5', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('38', null, '15', '1', null, '1', '2017-08-02 08:19:52', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('39', null, '11', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('40', null, '13', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('41', null, '21', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('42', null, '6', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('43', null, '17', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('44', null, '23', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('45', null, '20', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('46', null, '22', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('47', null, '3', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('48', null, '9', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('49', null, '18', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('50', null, '1', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('51', null, '7', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('52', null, '8', '1', null, '1', '2017-08-02 08:19:53', '1', '2017-08-03 06:57:12', '1');
INSERT INTO `sys_role_function` VALUES ('53', null, '16', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('54', null, '2', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('55', null, '14', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('56', null, '10', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('57', null, '5', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('58', null, '11', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('59', null, '15', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('60', null, '13', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('61', null, '21', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('62', null, '6', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('63', null, '23', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('64', null, '17', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('65', null, '22', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('66', null, '3', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('67', null, '9', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('68', null, '18', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('69', null, '1', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('70', null, '7', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('71', null, '8', '1', null, '1', '2017-08-03 06:57:12', '1', '2017-08-03 07:21:47', '1');
INSERT INTO `sys_role_function` VALUES ('72', null, '5', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('73', null, '13', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('74', null, '21', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('75', null, '6', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('76', null, '17', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('77', null, '22', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('78', null, '3', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('79', null, '9', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('80', null, '18', '3', null, '1', '2017-08-03 07:19:41', '1', '2017-08-03 07:19:41', '0');
INSERT INTO `sys_role_function` VALUES ('81', null, '2', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('82', null, '14', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('83', null, '10', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('84', null, '5', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('85', null, '11', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('86', null, '15', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('87', null, '13', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('88', null, '21', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('89', null, '3', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('90', null, '9', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('91', null, '18', '2', null, '1', '2017-08-03 07:20:05', '1', '2017-08-03 07:20:05', '0');
INSERT INTO `sys_role_function` VALUES ('92', null, '16', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('93', null, '2', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('94', null, '10', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('95', null, '14', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('96', null, '5', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('97', null, '15', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('98', null, '11', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('99', null, '13', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('100', null, '21', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('101', null, '6', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('102', null, '23', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('103', null, '17', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('104', null, '20', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('105', null, '22', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('106', null, '3', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('107', null, '9', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('108', null, '18', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('109', null, '1', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('110', null, '7', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('111', null, '8', '1', null, '1', '2017-08-03 07:21:47', '1', '2017-08-03 07:22:12', '1');
INSERT INTO `sys_role_function` VALUES ('112', null, '16', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('113', null, '2', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('114', null, '14', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('115', null, '10', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('116', null, '5', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('117', null, '11', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('118', null, '15', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('119', null, '13', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('120', null, '21', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('121', null, '6', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('122', null, '23', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('123', null, '17', '1', null, '1', '2017-08-03 07:22:12', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('124', null, '22', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('125', null, '3', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('126', null, '9', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('127', null, '18', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('128', null, '1', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('129', null, '7', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('130', null, '8', '1', null, '1', '2017-08-03 07:22:13', '1', '2017-08-08 08:27:43', '1');
INSERT INTO `sys_role_function` VALUES ('131', null, '16', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('132', null, '2', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('133', null, '10', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('134', null, '14', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('135', null, '5', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('136', null, '11', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('137', null, '15', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('138', null, '13', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('139', null, '21', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('140', null, '6', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('141', null, '23', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('142', null, '17', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('143', null, '20', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('144', null, '22', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('145', null, '4', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('146', null, '3', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('147', null, '9', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('148', null, '18', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('149', null, '1', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('150', null, '7', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('151', null, '8', '1', null, '1', '2017-08-08 08:27:43', '1', '2017-08-20 21:24:07', '1');
INSERT INTO `sys_role_function` VALUES ('152', null, '16', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('153', null, '2', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('154', null, '10', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('155', null, '14', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('156', null, '5', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('157', null, '15', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('158', null, '11', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('159', null, '13', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('160', null, '21', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('161', null, '6', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('162', null, '17', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('163', null, '26', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('164', null, '23', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('165', null, '27', '1', null, '1', '2017-08-20 21:24:07', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('166', null, '20', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('167', null, '22', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('168', null, '25', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('169', null, '4', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('170', null, '24', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('171', null, '31', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('172', null, '33', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('173', null, '32', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('174', null, '29', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('175', null, '30', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('176', null, '3', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('177', null, '9', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('178', null, '18', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('179', null, '1', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('180', null, '7', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('181', null, '8', '1', null, '1', '2017-08-20 21:24:08', '1', '2017-09-24 22:57:09', '1');
INSERT INTO `sys_role_function` VALUES ('182', null, '16', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('183', null, '2', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('184', null, '14', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('185', null, '10', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('186', null, '5', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('187', null, '15', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('188', null, '11', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('189', null, '13', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('190', null, '21', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('191', null, '6', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('192', null, '17', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('193', null, '23', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('194', null, '26', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('195', null, '27', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('196', null, '20', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('197', null, '25', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('198', null, '22', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('199', null, '4', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('200', null, '24', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('201', null, '31', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('202', null, '33', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('203', null, '32', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('204', null, '29', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('205', null, '30', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('206', null, '3', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('207', null, '9', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('208', null, '18', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('209', null, '1', '1', null, '1', '2017-09-24 22:57:09', '1', '2017-09-24 22:57:09', '0');
INSERT INTO `sys_role_function` VALUES ('210', null, '7', '1', null, '1', '2017-09-24 22:57:10', '1', '2017-09-24 22:57:10', '0');
INSERT INTO `sys_role_function` VALUES ('211', null, '8', '1', null, '1', '2017-09-24 22:57:10', '1', '2017-09-24 22:57:10', '0');
INSERT INTO `sys_role_function` VALUES ('212', null, '28', '1', null, '1', '2017-09-24 22:57:10', '1', '2017-09-24 22:57:10', '0');

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
  `email` varchar(32) DEFAULT NULL,
  `office_phone` varchar(32) DEFAULT NULL,
  `status` smallint(6) NOT NULL COMMENT '有效状态 1-待审核 2-审核通过 3-审核未通过',
  `telephone` varchar(32) DEFAULT NULL,
  `user_key` varchar(200) DEFAULT NULL COMMENT '用户KEY',
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
INSERT INTO `sys_user` VALUES ('1', 'admin', 'c44b01947c9e6e3f', '管理员', null, '33', '222', '1', '12', '402881e75d442f83015d442f83a60000', '1', '2017-05-30 09:49:14', '1', '2017-10-08 17:40:34', '0');
INSERT INTO `sys_user` VALUES ('2', 'zhurongzhu', '17815d211ce112dc8ffc8461d640d282', '朱荣主', null, '', '', '1', '', '402881e75d442f83015d442f83a60001', '1', '2017-07-10 00:37:52', '1', '2017-08-04 07:08:27', '0');
INSERT INTO `sys_user` VALUES ('3', 'mashunli', '0314b79a8f28cb0b1eb5d4a452f7163c', '马顺利', null, '', '', '1', '', '402881e75d442f83015d442f83a60002', '1', null, '1', '2017-08-04 07:08:17', '0');
INSERT INTO `sys_user` VALUES ('4', 'shigang', 'e9b6a53d94fab594', '石岗', null, '', '', '1', '13601313557', '402881e75d442f83015d442f83a60003', '1', null, '1', '2017-08-25 15:56:07', '0');
INSERT INTO `sys_user` VALUES ('5', 'panyuli', 'f480fb6f29b31d41', '潘玉利', null, '', '', '1', '', '402881e75d442f83015d442f83a60004', '1', null, '1', '2017-08-04 07:07:55', '0');
INSERT INTO `sys_user` VALUES ('6', 'zhangyafeng', 'f789779f50f112e49e8a746cebaccd69', '张亚峰', null, '', '', '1', '', '402881e75d442f83015d442f83a60005', '1', null, '1', '2017-08-04 07:07:46', '0');
INSERT INTO `sys_user` VALUES ('7', 'guhongbao', 'c51a50c220307d7e57f35b4caaac5912', '顾宏豹', null, '', '', '1', '', '402881e75d442f83015d442f83a60006', '1', null, '1', '2017-09-10 20:24:11', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of sys_user_data_right
-- ----------------------------
INSERT INTO `sys_user_data_right` VALUES ('8', '1', '1', null, '1', '2017-10-08 17:20:16', '1', '2017-10-08 17:40:35', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='用户与部门关系表';

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('1', null, null, null, null, null, null, null);
INSERT INTO `sys_user_depart` VALUES ('2', '7', '1', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('3', '6', '1', '1', null, '1', '2017-08-04 07:07:46', '1');
INSERT INTO `sys_user_depart` VALUES ('4', '5', '1', '1', null, '1', '2017-08-04 07:07:55', '1');
INSERT INTO `sys_user_depart` VALUES ('5', '4', '1', '1', null, '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_user_depart` VALUES ('6', '3', '1', '1', null, '1', '2017-08-04 07:08:17', '1');
INSERT INTO `sys_user_depart` VALUES ('7', '2', '1', '1', null, '1', '2017-08-04 07:08:27', '1');
INSERT INTO `sys_user_depart` VALUES ('8', '1', '1', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('9', '7', '4', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('10', '6', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('11', '5', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('12', '4', '4', '1', null, '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_user_depart` VALUES ('13', '3', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('14', '2', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('15', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('16', '7', '4', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('17', '7', '2', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('18', '7', '4', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('19', '4', '4', '1', null, '1', '2017-08-25 15:56:07', '1');
INSERT INTO `sys_user_depart` VALUES ('20', '7', '4', '1', null, '1', '2017-09-10 20:24:11', '1');
INSERT INTO `sys_user_depart` VALUES ('21', '4', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('22', '7', '4', '1', null, '1', null, '0');
INSERT INTO `sys_user_depart` VALUES ('23', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('24', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('25', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('26', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('27', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('28', '1', '3', '1', null, '1', '2017-10-08 17:40:34', '1');
INSERT INTO `sys_user_depart` VALUES ('29', '1', '3', '1', null, '1', null, '0');

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
  `note` varchar(512) DEFAULT NULL COMMENT '备注',
  `open_invoice_date` date DEFAULT NULL COMMENT '开票时间',
  `creator` int(11) DEFAULT NULL COMMENT '创建人(当前登录用户ID)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人（当前登录用户ID）',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Records of tb_contract
-- ----------------------------
INSERT INTO `tb_contract` VALUES ('46', 'testa', 'testb', '0', '64', '3333333333333', '0', null, null, '0', null, '0', null, null, '1', '2017-07-18 17:31:51', '1', '2017-07-18 17:48:26', '1', null);
INSERT INTO `tb_contract` VALUES ('47', '44', '44', '0', '70', '444', '0', null, null, '0', null, '0', null, null, '1', '2017-07-18 21:22:17', '1', '2017-07-18 21:22:24', '1', null);
INSERT INTO `tb_contract` VALUES ('48', '11', '111', '0', '70', '222', '0', null, null, '0', null, '0', null, null, '1', '2017-07-18 21:43:37', '1', '2017-07-20 15:32:32', '1', null);
INSERT INTO `tb_contract` VALUES ('49', '233', '333', '0', '70', '33', '0', null, null, '0', null, '0', null, null, '1', '2017-07-18 21:44:44', '1', '2017-07-20 15:32:28', '1', null);
INSERT INTO `tb_contract` VALUES ('50', '444', '444', '0', '69', '34', '0', null, null, '0', null, '0', null, null, '1', '2017-07-18 21:45:07', '1', '2017-07-20 15:32:57', '1', null);
INSERT INTO `tb_contract` VALUES ('51', 'BJJT2017070019', 'BJJT2017070019', '0', '71', '314', '0', '0', null, '0', null, '0', null, null, '1', '2017-07-20 15:37:28', '1', '2017-07-20 15:42:19', '0', '4');
INSERT INTO `tb_contract` VALUES ('52', 'BJJT2017070018', 'BJJT2017070018', '0', '72', '3477.24', '0', null, null, '1', '2017-07-20', '0', null, null, '1', '2017-07-20 15:57:54', '1', '2017-07-21 14:49:32', '1', '5');
INSERT INTO `tb_contract` VALUES ('53', 'BJJT2017070017', 'HT1-GYC20170718015', '0', '64', '3760', '0', null, null, '0', null, '0', null, null, '1', '2017-07-20 16:02:07', null, null, '0', '6');
INSERT INTO `tb_contract` VALUES ('54', 'BJJT2017070016', 'HT1-GYC20170713007', '0', '64', '2480', '0', null, null, '1', '2017-07-13', '0', null, null, '1', '2017-07-20 19:54:14', null, null, '0', '7');
INSERT INTO `tb_contract` VALUES ('55', 'BJJT2017070015', 'HT1-GYC20170712008', '0', '64', '5630', '0', null, null, '0', null, '0', null, null, '1', '2017-07-20 20:32:26', null, null, '0', '8');
INSERT INTO `tb_contract` VALUES ('56', 'BJJT2017070014', 'BJJT2017070014', '0', '73', '6688', '0', null, null, '0', '2017-07-06', '0', null, null, '1', '2017-07-20 20:43:13', null, null, '0', '9');
INSERT INTO `tb_contract` VALUES ('57', 'BJJT2017070020', 'ZX-GYC20170721001', '0', '64', '79962', '0', null, null, '0', null, '0', null, null, '1', '2017-07-21 13:52:54', null, null, '0', '10');
INSERT INTO `tb_contract` VALUES ('58', 'BJJT2017070021', 'HT1-GYC20170721007', '0', '64', '33000', '0', null, null, '0', null, '0', null, null, '1', '2017-07-21 13:57:28', null, null, '0', '11');
INSERT INTO `tb_contract` VALUES ('59', 'BJJT2017070013', 'BJJT2017070013', '0', '74', '137200', '1', '137200', '2017-07-12', '1', '2017-07-12', '0', null, null, '1', '2017-07-21 14:44:35', '1', '2017-07-21 14:44:55', '0', '13');
INSERT INTO `tb_contract` VALUES ('60', 'BJJT2017070018', '4502646338', '0', '72', '3477.24', '0', null, null, '1', '2017-07-20', '0', null, null, '1', '2017-07-21 14:50:21', null, null, '0', '17');
INSERT INTO `tb_contract` VALUES ('61', 'BJJT2017070012', 'BJJT2017070012', '0', '74', '100000', '1', '100000', '2017-07-12', '1', '2017-07-12', '0', null, null, '1', '2017-07-21 14:56:16', null, null, '0', '18');
INSERT INTO `tb_contract` VALUES ('62', 'BJJT2017070011', 'BJJT2017070011', '0', '75', '41000', '1', '41000', '2017-07-12', '1', '2017-07-12', '0', null, null, '1', '2017-07-21 15:22:42', null, null, '0', '19');
INSERT INTO `tb_contract` VALUES ('63', 'BJJT2017070010', 'BJJT2017070010', '0', '76', '179550', '0', null, null, '1', '2017-07-07', '0', null, null, '1', '2017-07-21 15:26:51', null, null, '0', '20');
INSERT INTO `tb_contract` VALUES ('64', 'BJJT2017070009', 'BJJT2017070009', '0', '77', '12186.28', '0', null, null, '1', '2017-07-10', '1', null, '2017-07-10', '1', '2017-07-21 15:31:17', null, null, '0', '21');
INSERT INTO `tb_contract` VALUES ('65', 'BJJT2017070022', '1700094414', '0', '78', '952', '0', null, null, '0', null, '0', null, null, '1', '2017-07-21 17:06:31', null, null, '0', '22');
INSERT INTO `tb_contract` VALUES ('66', 'BJJT2017070023', 'MD1700349', '0', '78', '56145', '0', null, null, '0', null, '0', null, null, '1', '2017-07-21 19:29:58', null, null, '0', '23');
INSERT INTO `tb_contract` VALUES ('67', 'BJJT2017070024', 'BJJT2017070024', '0', '79', '1184', '0', null, null, '1', '2017-07-05', '0', null, null, '1', '2017-07-24 07:53:30', null, null, '0', '24');
INSERT INTO `tb_contract` VALUES ('68', 'BJJT2017070008', '40829369', '0', '80', '720', '0', null, null, '1', '2017-07-07', '0', null, null, '1', '2017-07-24 08:16:26', null, null, '0', '25');
INSERT INTO `tb_contract` VALUES ('69', 'BJJT2017070007', 'ZX-GYC201707001', '0', '64', '33340', '0', null, null, '1', '2017-07-11', '0', null, null, '1', '2017-07-24 08:23:09', null, null, '0', '26');
INSERT INTO `tb_contract` VALUES ('70', 'BJJT2017070006', 'HT1-GYC20170705007', '0', '64', '14108.12', '0', null, null, '0', null, '0', null, null, '1', '2017-07-24 08:26:57', null, null, '0', '27');
INSERT INTO `tb_contract` VALUES ('71', 'BJJT2017070005', 'S11739', '0', '59', '15452', '0', '0', null, '1', '2017-07-11', '0', '', null, '1', '2017-07-24 08:30:06', '1', '2017-08-21 08:40:30', '0', '28');
INSERT INTO `tb_contract` VALUES ('72', 'sss', '123', '0', '80', '123', '0', null, null, '0', null, '0', '12312', null, '1', '2017-08-02 00:33:01', '4', '2017-08-25 15:58:12', '1', '31');
INSERT INTO `tb_contract` VALUES ('73', 'eeeeee', '1232333', '0', '104', '123', '0', '0', null, '0', null, '0', '', null, '1', '2017-08-03 06:13:06', '4', '2017-08-25 15:57:58', '1', '35');
INSERT INTO `tb_contract` VALUES ('74', 'asdfsdfsd', '阿萨斯大所多', '0', '104', '1231232', '0', '0', null, '0', null, '0', '123123', null, '1', '2017-08-03 06:17:31', '4', '2017-08-25 15:57:49', '1', '38');
INSERT INTO `tb_contract` VALUES ('75', 'jiafanghetong', 'yifanghetong', '0', '104', '45', '1', '450', '2017-08-07', '1', '2017-08-04', '1', '', null, '1', '2017-08-03 06:43:29', '1', '2017-08-21 08:39:51', '1', null);
INSERT INTO `tb_contract` VALUES ('76', '11111111', '222222222', '0', '100', '780', '0', '0', null, '0', null, '0', '', null, '1', '2017-08-21 08:00:47', '4', '2017-08-25 15:57:54', '1', '51');
INSERT INTO `tb_contract` VALUES ('77', '777', '8888', '0', '109', '8989', '0', null, null, '0', null, '0', '', null, '1', '2017-08-26 21:31:12', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('78', 'asdasdasd', 'asdasd', '0', '109', '0.01212', '0', '0', null, '0', null, '0', '1212', null, '1', '2017-08-28 00:22:41', '1', '2017-08-28 00:22:50', '0', null);
INSERT INTO `tb_contract` VALUES ('79', 'test20193919192', '', '0', '110', '12', '0', null, null, '0', null, '0', '', null, '1', '2017-08-28 00:29:58', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('80', 'test2000000', '', '1', '110', '2000000', '0', null, null, '0', null, '0', '', null, '1', '2017-08-28 00:30:13', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('81', '1111111111', '12222', '0', '109', null, '0', null, null, '0', null, '0', '', null, '1', '2017-08-29 19:48:38', null, null, '0', null);
INSERT INTO `tb_contract` VALUES ('82', 'testAaA', 'testBBB', '0', '118', '12', '0', '0', null, '0', null, '0', '', null, '1', '2017-10-22 15:39:21', '1', '2017-10-22 15:40:51', '0', '107,109,110');

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `c_code` varchar(500) DEFAULT NULL COMMENT '客户编码',
  `c_name` varchar(128) NOT NULL COMMENT '客户名称',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
  `pay_acct` varchar(100) DEFAULT NULL COMMENT '付款账号',
  `service_engineer` varchar(100) DEFAULT NULL COMMENT '服务工程师',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(1000) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `tax_num` varchar(200) DEFAULT NULL COMMENT '税号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `creator` int(11) NOT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) NOT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) NOT NULL DEFAULT '0' COMMENT '删除标示',
  `file_ids` varchar(256) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('38', 'FSKH1499605226525', '百度中国有限公司', '张经理', '11111', '1', '', '上帝华北电力大学', '189709999', '11111', '', '1', '2017-07-09 21:00:26', '1', '2017-07-18 07:27:10', '1', null);
INSERT INTO `tb_customer` VALUES ('39', 'FSKH1499606616586', '北京风控有限公司', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:23:36', '1', '2017-07-18 07:27:14', '1', null);
INSERT INTO `tb_customer` VALUES ('40', 'FSKH1499606626080', '北京风控有限公司2', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:23:46', '1', '2017-07-10 08:21:56', '1', null);
INSERT INTO `tb_customer` VALUES ('41', 'FSKH1499606634688', '北京风控有限公司', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:23:54', '1', '2017-07-09 21:26:59', '1', null);
INSERT INTO `tb_customer` VALUES ('42', 'FSKH1499607347477', 'wwww', 'www', '22222', '1', '222', 'wwwww', '1233333', '22222', '', '1', '2017-07-09 21:35:47', '1', '2017-07-18 07:27:17', '1', null);
INSERT INTO `tb_customer` VALUES ('43', 'FSKH1499607383253', 'wwww1', 'wwww', 'wwww', '1', '', 'wwww', 'wwww', 'wwww', '', '1', '2017-07-09 21:36:23', '1', '2017-07-09 21:58:22', '1', null);
INSERT INTO `tb_customer` VALUES ('44', 'FSKH1499607448563', '北京风控有限公司', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:37:28', '1', '2017-07-09 21:58:29', '1', null);
INSERT INTO `tb_customer` VALUES ('45', 'FSKH1499607448618', '北京风控有限公司1', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:37:28', '1', '2017-07-10 08:18:03', '1', null);
INSERT INTO `tb_customer` VALUES ('46', 'FSKH1499607461272', '北京风控有限公司', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:37:41', '1', '2017-07-09 21:58:10', '1', null);
INSERT INTO `tb_customer` VALUES ('47', 'FSKH1499607467334', '北京风控有限公司', '北京市海淀区', '张三', '1.89100101E8', '1.010101E7', '1.010101E7', '李四', '010-101001', '1.0101001E7', '1', '2017-07-09 21:37:47', '1', '2017-07-09 21:38:40', '1', null);
INSERT INTO `tb_customer` VALUES ('48', 'FSKH1499646127457', '北京风控有限公司11', '张三1', '1.010101E7', '2', '1.0101001E7', '北京市海淀区', '1.89100101E8', '1.010101E7', '010-101001', '1', '2017-07-10 08:22:07', '1', '2017-07-10 09:10:47', '1', null);
INSERT INTO `tb_customer` VALUES ('49', 'FSKH1499646127528', '北京风控有限公司12', '张三2', '1.010101E7', '5', '1.0101001E7', '北京市海淀区', '1.89100101E8', '1.010101E7', '010-101001', '1', '2017-07-10 08:22:07', '1', '2017-07-10 09:10:44', '1', null);
INSERT INTO `tb_customer` VALUES ('50', 'FSKH1499646127541', '北京风控有限公司13', '张三3', '1.010101E7', '5', '1.0101001E7', '北京市海淀区', '1.89100101E8', '1.010101E7', '010-101001', '1', '2017-07-10 08:22:07', '1', '2017-07-10 09:10:41', '1', null);
INSERT INTO `tb_customer` VALUES ('51', 'FSKH1499648428258', '北京xxxx公司', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-07-10 09:00:28', '1', '2017-07-18 07:27:20', '1', null);
INSERT INTO `tb_customer` VALUES ('52', 'FSKH1499649018904', '北京xxxx公司1', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-07-10 09:10:18', '1', '2017-07-18 07:27:23', '1', null);
INSERT INTO `tb_customer` VALUES ('53', 'FSKH1499649018918', '北京xxxx公司2', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-07-10 09:10:18', '1', '2017-07-18 07:27:26', '1', null);
INSERT INTO `tb_customer` VALUES ('54', 'FSKH1499649018931', '北京xxxx公司3', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-07-10 09:10:18', '1', '2017-07-18 07:22:38', '1', null);
INSERT INTO `tb_customer` VALUES ('55', 'FSKH1499649018941', '北京xxxx公司4', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-07-10 09:10:18', '1', '2017-07-18 07:27:30', '1', null);
INSERT INTO `tb_customer` VALUES ('56', 'FSKH1500283372798', '北京市朝阳区使馆清洁运输管理处', '张明浩', '', '2', '', '北京市朝阳区东辛店', '15621826663', '', '', '1', '2017-07-17 17:22:52', '1', '2017-08-25 17:13:15', '0', null);
INSERT INTO `tb_customer` VALUES ('57', 'FSKH1500284047408', '张家口龙源供水公司', '施志刚', '', '2', '', '张家口赤城县', '15801221365', '', '', '1', '2017-07-17 17:34:07', '1', '2017-08-25 17:12:58', '0', null);
INSERT INTO `tb_customer` VALUES ('58', 'FSKH1500333769810', '中石油管道联合有限公司西部分公司酒泉输油气分公司', '张银香', '', '4', '', '甘肃省酒泉市世纪大道', '13689358107', '', '', '1', '2017-07-18 07:22:49', '1', '2017-08-25 16:03:10', '0', null);
INSERT INTO `tb_customer` VALUES ('59', 'FSKH1500335393288', '河北华澳矿业发展有限公司', '宋晓宇', '', '3', '', '河北省张家口市张北县三号乡', '13831336636', '', '', '1', '2017-07-18 07:49:53', '1', '2017-08-25 17:13:46', '0', null);
INSERT INTO `tb_customer` VALUES ('60', 'FSKH1500335745939', '香河第一城酒业有限公司', '闫立军', '', '2', '', '河北省廊坊市香河县新兴产业示范区', '13832616482', '', '', '1', '2017-07-18 07:55:45', '1', '2017-08-25 17:14:00', '0', null);
INSERT INTO `tb_customer` VALUES ('61', 'FSKH1500336314453', '中石油京唐液化天然气有限公司', '谭通', '', '2', '', '河北省唐山市曹妃甸工业区', '18612077154', '', '', '1', '2017-07-18 08:05:14', '1', '2017-08-25 17:13:30', '0', null);
INSERT INTO `tb_customer` VALUES ('62', 'FSKH1500336778819', '北京雁西湖污水处理厂', '杨光', '', '2', '', '北京市怀柔区雁西湖环镇路', '13811713722', '', '', '1', '2017-07-18 08:12:58', '1', '2017-08-25 17:14:43', '0', null);
INSERT INTO `tb_customer` VALUES ('63', 'FSKH1500337377232', '南宫生物质有限公司（南宫垃圾电厂）', '陈伟利', '', '3', '', '北京市大兴区南宫', '17743568951', '', '', '1', '2017-07-18 08:22:57', '1', '2017-08-25 17:14:32', '0', null);
INSERT INTO `tb_customer` VALUES ('64', 'FSKH1500367713805', '潞安新疆煤化工（集团）有限公司供应处', '杨春蓉', '', '4', '', '新疆哈密市三道岭镇', '18690221812', '', '', '1', '2017-07-18 16:48:33', '1', '2017-08-25 16:02:50', '0', null);
INSERT INTO `tb_customer` VALUES ('65', 'FSKH1500372605141', '北京市朝阳区高安屯垃圾焚烧发电厂', '郭海涛', '', '2', '', '北京市朝阳区高安屯南街', '18210004061', '', '', '1', '2017-07-18 18:10:05', '1', '2017-08-25 17:14:14', '0', null);
INSERT INTO `tb_customer` VALUES ('66', 'FSKH1500372793749', '西气东输衢州站', '苗文伟', '', '2', '', '浙江省衢州市浮石街道', '13482019341', '', '', '1', '2017-07-18 18:13:13', '1', '2017-08-25 17:12:29', '0', null);
INSERT INTO `tb_customer` VALUES ('67', 'FSKH1500372865805', '南车二七车辆厂有限公司', '张信华', '', '1', '', '北京丰台长辛店', '13520223661', '', '', '1', '2017-07-18 18:14:25', '1', '2017-07-18 18:14:25', '0', null);
INSERT INTO `tb_customer` VALUES ('68', 'FSKH1500373071330', '北京北排装备产业有限公司', '楚国贤', '', '1', '', '北京市通州区次渠', '13713929969', '', '', '1', '2017-07-18 18:17:51', '1', '2017-07-18 18:17:51', '0', null);
INSERT INTO `tb_customer` VALUES ('69', 'FSKH1500373211288', '潞安新疆煤化工（集团）有限公司砂墩矿选煤厂', '冯建疆', '', '4', '', '新疆哈密市三道岭镇', '13899363777', '', '', '1', '2017-07-18 18:20:11', '1', '2017-08-25 16:02:00', '0', null);
INSERT INTO `tb_customer` VALUES ('70', 'FSKH1500384027418', 'ceshi', 'sunzhimei', '123456778', '1', '', 'kkkkkk', '18701360250', 'eeee', '', '1', '2017-07-18 21:20:27', '1', '2017-07-20 15:33:27', '1', null);
INSERT INTO `tb_customer` VALUES ('71', 'FSKH1500536157126', '上海惠尔自动化仪表工程有限公司', '吴磊', '', '1', '', '江苏南通市如东县南市路新开五交化商城', '13917219316', '', '', '1', '2017-07-20 15:35:57', '1', '2017-07-20 15:35:57', '0', null);
INSERT INTO `tb_customer` VALUES ('72', 'FSKH1500537176727', '颇尔过滤器（北京）制造厂', '连镇宇', '', '2', '', '北京市亦庄经济技术开发区宏达南路12号', '18610110969', '', '', '1', '2017-07-20 15:52:56', '1', '2017-08-25 17:11:28', '0', null);
INSERT INTO `tb_customer` VALUES ('73', 'FSKH1500554353352', '北京正东电子动力南厂', '王彪', '', '2', '', '北京市酒仙桥', '13051853590', '', '', '1', '2017-07-20 20:39:13', '1', '2017-08-25 17:11:15', '0', null);
INSERT INTO `tb_customer` VALUES ('74', 'FSKH1500554767957', '山西德铭智能科技有限公司', '李长江', '0505009509200063948', '6', '', '山西长治屯留康庄工业园区', '0355-7586976', '91140400578468697U', '', '1', '2017-07-20 20:46:07', '1', '2017-08-25 16:02:28', '0', null);
INSERT INTO `tb_customer` VALUES ('75', 'FSKH1500621285165', '长治市顺昌源科技有限公司', '何利军', '', '6', '', '山西省临汾市', '0101', '', '', '1', '2017-07-21 15:14:45', '1', '2017-08-25 16:02:16', '0', null);
INSERT INTO `tb_customer` VALUES ('76', 'FSKH1500621418117', '中油管道物资装备有限公司', '栗祥', '', '1', '', '辽宁省锦州市', '04163343329', '', '', '1', '2017-07-21 15:16:58', '1', '2017-07-21 15:16:58', '0', null);
INSERT INTO `tb_customer` VALUES ('77', 'FSKH1500621525488', '河北三河天龙物流新型建筑材料有限公司', '赵营', '', '2', '', '河北省三河市', '13833600131', '', '', '1', '2017-07-21 15:18:45', '1', '2017-08-25 17:11:48', '0', null);
INSERT INTO `tb_customer` VALUES ('78', 'FSKH1500627396617', '长城汽车保定曼德汽车配件有限公司', '丁旭康', '', '3', '', '保定市徐水县', '13463122519', '', '', '1', '2017-07-21 16:56:36', '1', '2017-09-04 14:36:37', '0', null);
INSERT INTO `tb_customer` VALUES ('79', 'FSKH1500853778864', '北京东方万峰机械有限公司', '赵文表', '', '1', '', '北京市通州区北苑155号院西楼330室', '13511003527', '', '', '1', '2017-07-24 07:49:38', '1', '2017-07-24 07:49:38', '0', null);
INSERT INTO `tb_customer` VALUES ('80', 'FSKH1500854278060', '北京京港地铁有限公司', '李荣智', '', '2', '', '北京市丰台区嘉园路地铁4号线马家堡车辆段', '010-88646951', '', '', '1', '2017-07-24 07:57:58', '1', '2017-08-25 17:11:57', '0', null);
INSERT INTO `tb_customer` VALUES ('81', 'FSKH1501541615023', '金1', '12345.0', '1.0', '30568.0', '3.0', '111111111111111', '1234456.0', '1.0', '0.0', '1', '2017-08-01 06:53:35', '1', '2017-08-01 06:54:40', '1', null);
INSERT INTO `tb_customer` VALUES ('82', 'FSKH1501541615035', '金2', '12345.0', '1.0', '30568.0', '3.0', '222222222222', '1234456.0', '1.0', '0.0', '1', '2017-08-01 06:53:35', '1', '2017-08-01 06:54:36', '1', null);
INSERT INTO `tb_customer` VALUES ('83', 'FSKH1501541615046', '金3', '12345.0', '1.0', '30568.0', '3.0', '111111111111111', '1234456.0', '1.0', '0.0', '1', '2017-08-01 06:53:35', '1', '2017-08-01 06:54:31', '1', null);
INSERT INTO `tb_customer` VALUES ('84', 'FSKH1501541615057', '金4', '12345.0', '1.0', '30568.0', '3.0', '222222222222', '1234456.0', '1.0', '0.0', '1', '2017-08-01 06:53:35', '1', '2017-08-01 06:54:26', '1', null);
INSERT INTO `tb_customer` VALUES ('85', 'FSKH1501541786839', '北京xxxx公司1', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-08-01 06:56:26', '1', '2017-08-01 07:01:09', '1', null);
INSERT INTO `tb_customer` VALUES ('86', 'FSKH1501541786851', '北京xxxx公司2', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-08-01 06:56:26', '1', '2017-08-01 07:01:05', '1', null);
INSERT INTO `tb_customer` VALUES ('87', 'FSKH1501541786864', '北京xxxx公司3', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-08-01 06:56:26', '1', '2017-08-01 07:00:48', '1', null);
INSERT INTO `tb_customer` VALUES ('88', 'FSKH1501541786875', '北京xxxx公司4', '张三', '301010108888', '7', '10101001', '北京市海淀区', '189100100001', '201010108888888888', '010-101001', '1', '2017-08-01 06:56:26', '1', '2017-08-01 07:00:45', '1', null);
INSERT INTO `tb_customer` VALUES ('89', 'FSKH1501542077287', '北京xxxx公司11', '张三', '3010101055555555555', '管理员2', '10101001', '北京市海淀区', '189100100001', '201010101232435345', '010-101001', '1', '2017-08-01 07:01:17', '1', '2017-08-01 07:03:06', '1', null);
INSERT INTO `tb_customer` VALUES ('90', 'FSKH1501542077301', '北京xxxx公司22', '张三', '301010105555', '管理员3', '10101001', '北京市海淀区', '189100100001', '2010101044444444444', '010-101001', '1', '2017-08-01 07:01:17', '1', '2017-08-01 07:03:03', '1', null);
INSERT INTO `tb_customer` VALUES ('91', 'FSKH1501542077312', '北京xxxx公司33', '张三', '301010105555', '管理员4', '10101001', '北京市海淀区', '189100100001', '201010104444444444444', '010-101001', '1', '2017-08-01 07:01:17', '1', '2017-08-01 07:03:00', '1', null);
INSERT INTO `tb_customer` VALUES ('92', 'FSKH1501542077323', '北京xxxx公司44', '张三', '301010107777777777777', '管理员4', '10101001', '北京市海淀区', '189100100001', '20101010454444444444444', '010-101001', '1', '2017-08-01 07:01:17', '1', '2017-08-01 07:02:57', '1', null);
INSERT INTO `tb_customer` VALUES ('93', 'FSKH1501542198671', '北京xxxx公司11', '张三', '3010101055555555555', '管理员2', '10101001', '北京市海淀区', '189100100001', '201010101232435345', '010-101001', '1', '2017-08-01 07:03:18', '1', '2017-08-01 07:03:32', '1', null);
INSERT INTO `tb_customer` VALUES ('94', 'FSKH1501542198683', '北京xxxx公司22', '张三', '301010105555', '管理员3', '10101001', '北京市海淀区', '189100100001', '2010101044444444444', '010-101001', '1', '2017-08-01 07:03:18', '1', '2017-08-01 07:03:30', '1', null);
INSERT INTO `tb_customer` VALUES ('95', 'FSKH1501542198694', '北京xxxx公司33', '张三', '301010105555', '管理员4', '10101001', '北京市海淀区', '189100100001', '201010104444444444444', '010-101001', '1', '2017-08-01 07:03:18', '1', '2017-08-01 07:03:27', '1', null);
INSERT INTO `tb_customer` VALUES ('96', 'FSKH1501542198705', '北京xxxx公司44', '张三', '301010107777777777777', '管理员4', '10101001', '北京市海淀区', '189100100001', '20101010454444444444444', '010-101001', '1', '2017-08-01 07:03:18', '1', '2017-08-01 07:03:24', '1', null);
INSERT INTO `tb_customer` VALUES ('97', 'FSKH1501542288019', '北京xxxx公司11', '张三', '3010101055555555555', '潘顺', '10101001', '北京市海淀区', '189100100001', '201010101232435345', '010-101001', '1', '2017-08-01 07:04:48', '1', '2017-08-25 17:10:43', '1', null);
INSERT INTO `tb_customer` VALUES ('98', 'FSKH1501542288031', '北京xxxx公司22', '张三', '301010105555', '潘顺', '10101001', '北京市海淀区', '189100100001', '2010101044444444444', '010-101001', '1', '2017-08-01 07:04:48', '1', '2017-08-25 17:10:47', '1', null);
INSERT INTO `tb_customer` VALUES ('99', 'FSKH1501542288041', '北京xxxx公司33', '张三', '301010105555', '潘顺', '10101001', '北京市海淀区', '189100100001', '201010104444444444444', '010-101001', '1', '2017-08-01 07:04:48', '1', '2017-08-25 17:10:37', '1', null);
INSERT INTO `tb_customer` VALUES ('100', 'FSKH1501542288052', '测试客户may', '秘密', '301010107777777777777', '7', '10101001', '北京市海淀区', '189100100001', '20101010454444444444444', '010-101001', '1', '2017-08-01 07:04:48', '1', '2017-08-25 08:17:25', '1', null);
INSERT INTO `tb_customer` VALUES ('101', 'FSKH1501542530464', 'kehu1', '孙志楷', '333333', '6', '', '北京市场', '333', '33333333333333', '', '1', '2017-08-01 07:08:50', '1', '2017-08-21 07:39:34', '1', null);
INSERT INTO `tb_customer` VALUES ('102', 'FSKH1501634453080', '测试客户', 'yyy', '123456', '7', '123456', 'yyy', '123456', '123456', '123456', '1', '2017-08-02 08:40:53', '1', '2017-08-02 08:41:41', '1', null);
INSERT INTO `tb_customer` VALUES ('103', 'FSKH1501634537141', 'testttttttttttttttttttt', 'hhhh', '', '7', '', 'hhhh', '', '', '', '1', '2017-08-02 08:42:17', '1', '2017-08-21 07:39:29', '1', null);
INSERT INTO `tb_customer` VALUES ('104', 'FSKH1501709367146', '测试客户里', '田', '4444', '1', '4444', '品', '4444', '4444', '444', '1', '2017-08-03 05:29:27', '1', '2017-08-21 07:39:18', '1', null);
INSERT INTO `tb_customer` VALUES ('105', 'FSKH1501711687405', '北京ABC公司', '张三', '123123', '3', '通天塔', '北京市海淀区XXX', '1212312', '驱蚊器翁群无', '通天塔', '1', '2017-08-03 06:08:07', '1', '2017-08-08 08:28:55', '1', null);
INSERT INTO `tb_customer` VALUES ('106', 'FSKH1501711958717', '北京xxxx公司112', '张三', '30101010', '2', '10101001', '北京市海淀区12', '189100100001', '20101010', '010-101001', '1', '2017-08-03 06:12:38', '1', '2017-08-08 08:28:49', '1', null);
INSERT INTO `tb_customer` VALUES ('107', 'FSKH1501715014121', '北京xxxx公司', '张三', '30101010', '7', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-08-03 07:03:34', '1', '2017-08-08 08:28:45', '1', null);
INSERT INTO `tb_customer` VALUES ('108', 'FSKH1503648446044', '潞安新疆煤化工（集团）有限公司砂墩子矿', '芦俊文', '', '4', '', '新疆哈密市三道岭镇', '13677570270', '', '', '1', '2017-08-25 16:07:26', '1', '2017-08-25 16:07:26', '0', null);
INSERT INTO `tb_customer` VALUES ('109', 'FSKH1503753777428', '测试客户may', '', '', '2', '', '上帝华北电力大学', '', '', '', '1', '2017-08-26 21:22:57', '1', '2017-11-03 15:28:44', '1', null);
INSERT INTO `tb_customer` VALUES ('110', 'FSKH1503841725340', '测试工程师12', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿萨2', '6', 'asda 2', '测试工程师1啊啊啊啊啊啊啊啊啊3', '阿斯达岁的2', 'Asdasdqq2', 'rwar2', '1', '2017-08-27 21:48:46', '1', '2017-08-27 21:49:08', '0', null);
INSERT INTO `tb_customer` VALUES ('111', 'FSKH1503841849063', ' ', null, null, '1', null, null, null, null, null, '1', '2017-08-27 21:50:50', '1', '2017-08-27 21:53:14', '1', null);
INSERT INTO `tb_customer` VALUES ('112', 'FSKH1505052941560', '测试客户may2', '', '', '5', '', '', '', '', '', '1', '2017-09-10 22:15:41', '1', '2017-09-10 22:15:41', '0', null);
INSERT INTO `tb_customer` VALUES ('113', 'FSKH1505091230052', '北京xxxx公司1', '张三', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-09-11 08:53:50', '1', '2017-09-11 08:53:50', '0', null);
INSERT INTO `tb_customer` VALUES ('114', 'FSKH1505091230064', '北京xxxx公司2', '张四', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-09-11 08:53:50', '1', '2017-09-11 08:53:50', '0', null);
INSERT INTO `tb_customer` VALUES ('115', 'FSKH1505091230090', '北京xxxx公司3', '张五', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-09-11 08:53:50', '1', '2017-09-11 08:53:50', '0', null);
INSERT INTO `tb_customer` VALUES ('116', 'FSKH1505091230102', '北京xxxx公司4', '张六', '30101010', '1', '10101001', '北京市海淀区', '189100100001', '20101010', '010-101001', '1', '2017-09-11 08:53:50', '1', '2017-11-03 15:28:38', '1', null);
INSERT INTO `tb_customer` VALUES ('117', 'FSKH1506222399413', 'DE公司', '', '', '5', '', '通州区', '11111111', '', '', '1', '2017-09-24 11:06:36', '1', '2017-09-24 11:06:48', '0', null);
INSERT INTO `tb_customer` VALUES ('118', 'FSKH1508655142482', 'TT_天蓝测试客户', '李四', '123', '4', '212', '顺义区城区', '1888888889', '12', '43', '1', '2017-10-22 14:52:22', '1', '2017-10-22 14:52:57', '0', null);
INSERT INTO `tb_customer` VALUES ('119', 'FSKH1513214709281', '怀柔雁栖污水处理厂', '董工', '', '1', '', '怀柔雁栖湖东侧', '18801486961', '', '010-84310111', '1', '2017-12-14 09:25:09', '1', '2017-12-14 09:25:09', '0', null);
INSERT INTO `tb_customer` VALUES ('120', 'FSKH1513215539819', '同方环境垃圾焚烧厂', '张栓平', '', '1', '', '北京市大兴区南宫镇', '13838187364', '', '', '1', '2017-12-14 09:38:59', '1', '2017-12-14 09:38:59', '0', null);
INSERT INTO `tb_customer` VALUES ('121', 'FSKH1513217906057', '泰戈特（北京）工程技术有限公司', '孙良波', '', '1', '', '哈密市三道岭', '15719045518', '', '', '1', '2017-12-14 10:18:26', '1', '2017-12-14 10:18:26', '0', null);
INSERT INTO `tb_customer` VALUES ('122', 'FSKH1513218276352', '新疆博海水泥有限公司', '渝挺刚', '', '1', '', '新疆博乐市王台工业园', '18509099984', '', '0909-2299663', '1', '2017-12-14 10:24:36', '1', '2017-12-14 10:24:36', '0', null);
INSERT INTO `tb_customer` VALUES ('123', 'FSKH1513219105831', '天津长城汽车物流中心', '李朝阳', '', '1', '', '天津市经济开发区', '18531222209', '', '', '1', '2017-12-14 10:38:25', '1', '2017-12-14 10:38:25', '0', null);
INSERT INTO `tb_customer` VALUES ('124', 'FSKH1513219370040', '中煤北京煤矿业械有限责任公司', '安彩英', '', '1', '', '房山', '13522117930', '', '', '1', '2017-12-14 10:42:50', '1', '2017-12-14 10:42:50', '0', null);
INSERT INTO `tb_customer` VALUES ('125', 'FSKH1513219764642', '帕鲁特金矿冶炼厂', '杜景峰', '', '1', '', '塔吉克斯坦杜尚别瓦赫达', '0092939000845', '', '', '1', '2017-12-14 10:49:24', '1', '2017-12-14 10:49:24', '0', null);
INSERT INTO `tb_customer` VALUES ('126', 'FSKH1513301516080', '辽南集团有限公司', '何绍山', '', '1', '', '辽宁省盘锦市欢喜岭采油厂辽南集团有限公司', '15827839898', '', '', '1', '2017-12-15 09:31:56', '1', '2017-12-15 09:31:56', '0', null);
INSERT INTO `tb_customer` VALUES ('127', 'FSKH1513302003136', '北京天越门窗制造有限公司', '王文立', '', '1', '', '北京市通州区张家湾镇', '18610822318', '', '', '1', '2017-12-15 09:40:03', '1', '2017-12-15 09:40:03', '0', null);
INSERT INTO `tb_customer` VALUES ('128', 'FSKH1513302337905', '同方环境股份有限公司高碑店项目', '张晓辉', '', '1', '', '北京市朝阳区高碑店', '18600886135', '', '', '1', '2017-12-15 09:45:37', '1', '2017-12-15 09:45:37', '0', null);
INSERT INTO `tb_customer` VALUES ('129', 'FSKH1513302802681', '中油辽河工程有限公司', '梁学川', '', '1', '', '辽宁省盘锦市大洼县新兴镇', '18609879048', '', '', '1', '2017-12-15 09:53:22', '1', '2017-12-15 09:53:22', '0', null);
INSERT INTO `tb_customer` VALUES ('130', 'FSKH1513303236573', '唐山百川智能机器有限公司', '刘长志', '', '1', '', '唐山市高科技开发区', '13223313084', '', '', '1', '2017-12-15 10:00:36', '1', '2017-12-15 10:00:36', '0', null);
INSERT INTO `tb_customer` VALUES ('131', 'FSKH1513304362086', '石家庄电力机务段', '靳飞', '', '1', '', '河北省石家庄市铁路南站', '13981118085', '', '', '1', '2017-12-15 10:19:22', '1', '2017-12-15 10:19:22', '0', null);
INSERT INTO `tb_customer` VALUES ('132', 'FSKH1513305384604', '诺博橡胶制品有限公司', '李文豪', '', '1', '', '徐水大王店', '15194881286', '', '', '1', '2017-12-15 10:36:24', '1', '2017-12-15 10:36:24', '0', null);
INSERT INTO `tb_customer` VALUES ('133', 'FSKH1513306758232', '北京华宇新疆屯宝项目部', '孙挺博', '', '1', '', '新疆昌吉硫磺沟共青团村屯宝洗煤厂', '18237556388', '', '', '1', '2017-12-15 10:59:18', '1', '2017-12-15 10:59:18', '0', null);
INSERT INTO `tb_customer` VALUES ('134', 'FSKH1513307714483', '天津振津工程设计咨询有限公司', '石工', '', '1', '', '天津宝坻东工业区', '13781332686', '', '', '1', '2017-12-15 11:15:14', '1', '2017-12-15 11:15:14', '0', null);
INSERT INTO `tb_customer` VALUES ('135', 'FSKH1513308021878', '华刚矿业股份有限公司', '张桂华', '', '1', '', '刚果（金）', '+243-977969811', '', '', '1', '2017-12-15 11:20:21', '1', '2017-12-15 11:20:21', '0', null);
INSERT INTO `tb_customer` VALUES ('136', 'FSKH1513308672163', '大连地铁南关岭车辆段', '任会杰', '', '1', '', '辽宁省大连市南关岭姚工街', '15081906631', '', '', '1', '2017-12-15 11:31:12', '1', '2017-12-15 11:31:12', '0', null);
INSERT INTO `tb_customer` VALUES ('137', 'FSKH1513308995896', '辽河油田曙光采油厂', '艾博文', '', '1', '', '辽宁省盘锦市辽河油田曙光采油厂', '18204269691', '', '', '1', '2017-12-15 11:36:35', '1', '2017-12-15 11:36:35', '0', null);
INSERT INTO `tb_customer` VALUES ('138', 'FSKH1513309435884', '北京建华轴承厂', '张宏伟', '', '1', '', '北京市顺义区后沙峪沙子营村', '13241263977', '', '', '1', '2017-12-15 11:43:55', '1', '2017-12-15 11:43:55', '0', null);
INSERT INTO `tb_customer` VALUES ('139', 'FSKH1513309753811', '潞安新疆煤化工（集团）有限公司  二矿', '丁金相', '', '1', '', '新疆哈密市三道岭', '13899330953', '', '', '1', '2017-12-15 11:49:13', '1', '2017-12-15 11:49:13', '0', null);
INSERT INTO `tb_customer` VALUES ('140', 'FSKH1513310402301', '潞安新疆煤化工（集团）有限公司  一矿', '曹新亮', '', '1', '', '新疆哈密市三道岭', '13999689843', '', '', '1', '2017-12-15 12:00:02', '1', '2017-12-15 12:02:23', '0', null);
INSERT INTO `tb_customer` VALUES ('141', 'FSKH1513312599458', '中国华电工程（集团）有限公司（哈密项目部）', '马吉辉', '', '1', '', '新疆哈密市  哈密二电厂', '13899349321', '', '', '1', '2017-12-15 12:36:39', '1', '2017-12-15 12:42:15', '1', null);
INSERT INTO `tb_customer` VALUES ('142', 'FSKH1513313060216', '潞安安太机械有限公司', '田国庆', '', '1', '', '山西省长治县工业园区', '13935502566', '', '', '1', '2017-12-15 12:44:20', '1', '2017-12-15 12:44:20', '0', null);
INSERT INTO `tb_customer` VALUES ('143', 'FSKH1513313548309', '山西霍尔辛赫洗煤厂', '李强', '', '1', '', '山西省长治市长子县丹朱镇南鲍村北', '18734497198', '', '', '1', '2017-12-15 12:52:28', '1', '2017-12-15 12:52:28', '0', null);
INSERT INTO `tb_customer` VALUES ('144', 'FSKH1513313830198', '首钢京唐钢铁联合责任有限公司', '贾晓东', '', '1', '', '唐山曹妃甸工业区', '15032988599', '', '', '1', '2017-12-15 12:57:10', '1', '2017-12-15 12:57:10', '0', null);
INSERT INTO `tb_customer` VALUES ('145', 'FSKH1513314206749', '长城汽车股份有限公司徐水哈弗分公司冲焊事业部', '王淑宁', '', '1', '', '河北保定市徐水分公司', '18531224553', '', '', '1', '2017-12-15 13:03:26', '1', '2017-12-15 13:03:26', '0', null);
INSERT INTO `tb_customer` VALUES ('146', 'FSKH1513314426342', '北京精诚博桑科技有限公司', '马骏河', '', '1', '', '北京市亦庄开发区万源路', '15510067865', '', '', '1', '2017-12-15 13:07:06', '1', '2017-12-15 13:07:06', '0', null);
INSERT INTO `tb_customer` VALUES ('147', 'FSKH1513314703740', '华油惠博普科技有限公司', '黄永康', '', '1', '', '辽宁省葫芦岛市北港工业区黄山路', '13321193157', '', '', '1', '2017-12-15 13:11:43', '1', '2017-12-15 13:11:43', '0', null);
INSERT INTO `tb_customer` VALUES ('148', 'FSKH1513314999648', '河北香河龙合盛古典家具厂', '肖传辉', '', '1', '', '香河安头屯镇', '13831633168', '', '', '1', '2017-12-15 13:16:39', '1', '2017-12-15 13:16:39', '0', null);
INSERT INTO `tb_customer` VALUES ('149', 'FSKH1513315412356', '长安汽车北京公司', '杨洋', '', '1', '', '北京窦店工业园', '18618218199', '', '', '1', '2017-12-15 13:23:32', '1', '2017-12-15 13:23:32', '0', null);
INSERT INTO `tb_customer` VALUES ('150', 'FSKH1513317069464', '北京飞达捷能气体分离技术有限公司', '李红利', '', '1', '', '北京市通州区马驹桥', '13716711379', '', '', '1', '2017-12-15 13:51:09', '1', '2017-12-15 13:51:09', '0', null);
INSERT INTO `tb_customer` VALUES ('151', 'FSKH1513317294929', '首钢迁安钢铁有限责任公司', '李晓辉', '', '1', '', '河北唐山迁安市杨子店镇滨河村', '15031506938', '', '', '1', '2017-12-15 13:54:54', '1', '2017-12-15 13:54:54', '0', null);
INSERT INTO `tb_customer` VALUES ('152', 'FSKH1513317543854', '三河远望创新电子技术有限公司', '方海升', '', '1', '', '河北省三河市燕郊经济开发区', '13930653906', '', '', '1', '2017-12-15 13:59:03', '1', '2017-12-15 13:59:03', '0', null);
INSERT INTO `tb_customer` VALUES ('153', 'FSKH1513318196294', '天津机务段', '魏振华', '', '1', '', '天津市河北区榆关道3号', '13832511519', '', '', '1', '2017-12-15 14:09:56', '1', '2017-12-15 14:09:56', '0', null);
INSERT INTO `tb_customer` VALUES ('154', 'FSKH1513319827132', '山西潞安漳村矿', '吴卫平', '', '1', '', '山西长治', '0355-5939461', '', '', '1', '2017-12-15 14:37:07', '1', '2017-12-15 14:37:07', '0', null);
INSERT INTO `tb_customer` VALUES ('155', 'FSKH1513320237356', '首钢京唐钢铁联合公司（北京市丰台区锅炉辅机）', '张先生', '', '1', '', '河北曹妃甸', '18631555970', '', '', '1', '2017-12-15 14:43:57', '1', '2017-12-15 14:43:57', '0', null);
INSERT INTO `tb_customer` VALUES ('156', 'FSKH1513322500893', '古城煤矿二十九工程处', '范工', '', '1', '', '山西长治古城煤矿', '18805571808', '', '', '1', '2017-12-15 15:21:40', '1', '2017-12-15 15:21:40', '0', null);
INSERT INTO `tb_customer` VALUES ('157', 'FSKH1513322834935', '山西潞安温庄煤业公司（五一煤矿）', '施熊杰', '', '1', '', '山西武乡', '0355-5944679', '', '', '1', '2017-12-15 15:27:14', '1', '2017-12-15 15:27:14', '0', null);
INSERT INTO `tb_customer` VALUES ('158', 'FSKH1513323065892', '兰州输气分公司乌兰站', '李亮', '', '1', '', '青海乌兰', '0977-8243371', '', '', '1', '2017-12-15 15:31:05', '1', '2017-12-15 15:31:05', '0', null);
INSERT INTO `tb_customer` VALUES ('159', 'FSKH1513323187414', '兰州输气分公司涩北站', '李广增', '', '1', '', '青海涩北', '', '', '', '1', '2017-12-15 15:33:07', '1', '2017-12-15 15:33:07', '0', null);
INSERT INTO `tb_customer` VALUES ('160', 'FSKH1513323276578', '兰州输气分公司湖东站', '陈文军', '', '1', '', '青海湖东', '0974-8519609', '', '', '1', '2017-12-15 15:34:36', '1', '2017-12-15 15:34:36', '0', null);
INSERT INTO `tb_customer` VALUES ('161', 'FSKH1513323379242', '兰州输气分公司青海', '章波', '', '1', '', '青海羊肠子沟', '0931-7666555', '', '', '1', '2017-12-15 15:36:19', '1', '2017-12-15 15:36:19', '0', null);
INSERT INTO `tb_customer` VALUES ('162', 'FSKH1513323471762', '山西潞安集团漳村矿', '郭文正', '', '1', '', '山西长治', '13008078020', '', '', '1', '2017-12-15 15:37:51', '1', '2017-12-22 15:15:47', '0', null);
INSERT INTO `tb_customer` VALUES ('163', 'FSKH1513323572781', '连云港欧亚气体有限公司', '章总', '', '1', '', '江苏连云港', '13355965555', '', '', '1', '2017-12-15 15:39:32', '1', '2017-12-15 15:39:32', '0', null);
INSERT INTO `tb_customer` VALUES ('164', 'FSKH1513323675962', '中城航宇空分设备有限公司', '万玉飞', '', '1', '', '河北固安', '13611126510', '', '', '1', '2017-12-15 15:41:15', '1', '2017-12-15 15:41:15', '0', null);
INSERT INTO `tb_customer` VALUES ('165', 'FSKH1513326050187', '金堆城铜业股份公司矿业公司', '周斌', '', '1', '', '陕西渭南市华县莲花市镇', '0913-4086299', '', '', '1', '2017-12-15 16:20:50', '1', '2017-12-15 16:20:50', '0', null);
INSERT INTO `tb_customer` VALUES ('166', 'FSKH1513927815222', '吉亚半导体材料有限公司', '李银生', '', '1', '', '山西河津', '0359-5042847', '', '', '1', '2017-12-22 15:30:15', '1', '2017-12-22 15:30:15', '0', null);
INSERT INTO `tb_customer` VALUES ('167', 'FSKH1514162605540', '内蒙古塔然高勒煤矿', '王保泉', '', '1', '', '内蒙古鄂尔多斯市马审旗', '13948570719', '', '', '1', '2017-12-25 08:43:25', '1', '2017-12-25 08:47:58', '1', null);
INSERT INTO `tb_customer` VALUES ('168', 'FSKH1514163066136', '西气东输邳州站', '张硕', '', '1', '', '江苏徐州市邳州县', '0215-8849591', '', '', '1', '2017-12-25 08:51:06', '1', '2017-12-25 08:51:06', '0', null);
INSERT INTO `tb_customer` VALUES ('169', 'FSKH1514164408775', '华北油田第四计量站', '孙卫民', '', '1', '', '任丘市章中驿', '13833721753', '', '', '1', '2017-12-25 09:13:28', '1', '2017-12-25 09:13:28', '0', null);
INSERT INTO `tb_customer` VALUES ('170', 'FSKH1514164672248', '北京天恒弘混凝土公司', '张标广', '', '1', '', '北京市朝阳区黄港乡顺黄路518号', '13960428150', '', '', '1', '2017-12-25 09:17:52', '1', '2017-12-25 09:17:52', '0', null);
INSERT INTO `tb_customer` VALUES ('171', 'FSKH1514165494795', '北京地铁四号线检修厂', '王建光', '', '1', '', '北京市丰台区马家堡', '13121207011', '', '', '1', '2017-12-25 09:31:34', '1', '2017-12-25 09:31:34', '0', null);
INSERT INTO `tb_customer` VALUES ('172', 'FSKH1514165725559', '潞安集团王庄矿', '王中', '', '1', '', '山西长治', '13935524622', '', '', '1', '2017-12-25 09:35:25', '1', '2017-12-25 09:35:25', '0', null);
INSERT INTO `tb_customer` VALUES ('173', 'FSKH1514166391905', '长城汽车股份有限公司', '柴造林', '', '1', '', '保定市', '15227094031', '', '', '1', '2017-12-25 09:46:31', '1', '2017-12-25 09:46:31', '0', null);
INSERT INTO `tb_customer` VALUES ('174', 'FSKH1514167065969', '北京首钢股份有限公司铁材深加工项目部', '刘虹', '', '1', '', '北京市顺义区李桥镇', '81470135', '', '', '1', '2017-12-25 09:57:45', '1', '2017-12-25 09:57:45', '0', null);
INSERT INTO `tb_customer` VALUES ('175', 'FSKH1514167556247', '北京京铁列车服务有限公司', '原作亮', '', '1', '', '北京市大兴区廊垡', '13520394604', '', '', '1', '2017-12-25 10:05:56', '1', '2017-12-25 10:05:56', '0', null);
INSERT INTO `tb_customer` VALUES ('176', 'FSKH1514167763659', '凌源钢铁有限责任公司', '杨海峰', '', '1', '', '凌源市钢铁路3号', '13050932583', '', '', '1', '2017-12-25 10:09:23', '1', '2017-12-25 10:09:23', '0', null);
INSERT INTO `tb_customer` VALUES ('177', 'FSKH1514168007606', '海南海然高新能源有限公司', '陈焕森', '', '1', '', '新疆轮南', '13518822092', '', '', '1', '2017-12-25 10:13:27', '1', '2017-12-25 10:13:27', '0', null);
INSERT INTO `tb_customer` VALUES ('178', 'FSKH1514168370338', '山西高河能源有限公司', '马保峰', '', '1', '', '山西长治', '0355-5950218', '', '', '1', '2017-12-25 10:19:30', '1', '2017-12-25 10:19:30', '0', null);
INSERT INTO `tb_customer` VALUES ('179', 'FSKH1514168928256', '西气东输泰安压气站', '李正强', '', '1', '', '山东泰安市', '13685487245', '', '', '1', '2017-12-25 10:28:48', '1', '2017-12-25 10:28:48', '0', null);
INSERT INTO `tb_customer` VALUES ('180', 'FSKH1514170231441', '北京富勤食用菌科技有限公司', '蔡钦星', '', '1', '', '通州永乐镇店', '69569138', '', '', '1', '2017-12-25 10:50:31', '1', '2017-12-25 10:50:31', '0', null);
INSERT INTO `tb_customer` VALUES ('181', 'FSKH1514170610366', '山西潞安环能王庄风井', '王中', '', '1', '', '山西长治', '13935524622', '', '', '1', '2017-12-25 10:56:50', '1', '2017-12-25 10:56:50', '0', null);
INSERT INTO `tb_customer` VALUES ('182', 'FSKH1514171041461', '江苏水利建设工程有限公司', '耿建国', '', '1', '', '北京', '13910874454', '', '', '1', '2017-12-25 11:04:01', '1', '2017-12-25 11:04:01', '0', null);
INSERT INTO `tb_customer` VALUES ('183', 'FSKH1514171250211', '北京溯源管道设备安装有限公司', '耿建国', '', '1', '', '北京丰台区', '13910874454', '', '', '1', '2017-12-25 11:07:30', '1', '2017-12-25 11:07:30', '0', null);
INSERT INTO `tb_customer` VALUES ('184', 'FSKH1514171597146', '原子能院放化大楼工程', '龙昌勉', '', '1', '', '房山区新镇', '69358686', '', '', '1', '2017-12-25 11:13:17', '1', '2017-12-25 11:13:17', '0', null);
INSERT INTO `tb_customer` VALUES ('185', 'FSKH1514171854498', '江苏LNG接收站', '梅丽', '', '1', '', '南通市如东县', '15962718786', '', '', '1', '2017-12-25 11:17:34', '1', '2017-12-25 11:17:34', '0', null);
INSERT INTO `tb_customer` VALUES ('186', 'FSKH1514172377924', '潞安新疆伊犁煤化工山鑫煤矿', '武永磐', '', '1', '', '新疆伊宁', '13779562959', '', '', '1', '2017-12-25 11:26:17', '1', '2017-12-25 11:26:17', '0', null);
INSERT INTO `tb_customer` VALUES ('187', 'FSKH1514173787484', '廊坊市管道局维抢修分司', '冯成龙', '', '1', '', '河北省廊坊市开发区四海路18号', '13868176098', '', '', '1', '2017-12-25 11:49:47', '1', '2017-12-25 11:49:47', '0', null);
INSERT INTO `tb_customer` VALUES ('188', 'FSKH1514173984789', '廊坊市管道局科技中心', '张立新', '', '1', '', '河北省廊坊市爱民路', '13931668187', '', '', '1', '2017-12-25 11:53:04', '1', '2017-12-25 11:53:04', '0', null);
INSERT INTO `tb_customer` VALUES ('189', 'FSKH1514174233152', '首钢京唐钢铁联合有限公司球团厂', '黄文斌', '', '1', '', '河北唐山曹妃甸', '15832551065', '', '', '1', '2017-12-25 11:57:13', '1', '2017-12-25 11:57:13', '0', null);
INSERT INTO `tb_customer` VALUES ('190', 'FSKH1514174840040', '北京首钢冷轧薄钢厂', '黄建明', '', '1', '', '顺义李桥', '13693698643', '', '', '1', '2017-12-25 12:07:20', '1', '2017-12-25 12:07:20', '0', null);
INSERT INTO `tb_customer` VALUES ('191', 'FSKH1514178108578', '采油三厂河间二区西四七站', '范红星', '', '1', '', '河间西村', '15720226047', '', '', '1', '2017-12-25 13:01:48', '1', '2017-12-25 13:01:48', '0', null);
INSERT INTO `tb_customer` VALUES ('192', 'FSKH1514178792361', '阳泉金隅通达高温材料有限公司', '张国贞', '', '1', '', '山西阳泉', '18703533095', '', '', '1', '2017-12-25 13:13:12', '1', '2017-12-25 13:13:12', '0', null);
INSERT INTO `tb_customer` VALUES ('193', 'FSKH1514179624358', '宜钢球团二期100吨项目', '杜小军', '', '1', '', '宜化', '13933995582', '', '', '1', '2017-12-25 13:27:04', '1', '2017-12-25 13:27:04', '0', null);
INSERT INTO `tb_customer` VALUES ('194', 'FSKH1514179984162', '河北威利邦木业有限公司', '温学民', '', '1', '', '河北邱县', '0310-8369963', '', '', '1', '2017-12-25 13:33:04', '1', '2017-12-25 13:33:04', '0', null);
INSERT INTO `tb_customer` VALUES ('195', 'FSKH1514180182140', '北京大学老校医院', '徐鹏亮', '', '1', '', '北京大学', '15810799563', '', '', '1', '2017-12-25 13:36:22', '1', '2017-12-25 13:36:22', '0', null);
INSERT INTO `tb_customer` VALUES ('196', 'FSKH1514181280712', '北京清泉市政工程有限公司', '赵京宇', '', '1', '', '北京大兴黄村', '010-51011143', '', '', '1', '2017-12-25 13:54:40', '1', '2017-12-25 13:54:40', '0', null);
INSERT INTO `tb_customer` VALUES ('197', 'FSKH1514181471626', '九元活性炭有限公司', '赵杰', '', '1', '', '山西长治', '0355-6984333', '', '', '1', '2017-12-25 13:57:51', '1', '2017-12-25 13:57:51', '0', null);
INSERT INTO `tb_customer` VALUES ('198', 'FSKH1514188398885', '中油管道机械制造有限责任公司', '孟强', '', '1', '', '宁夏银川市中宁县空石镇', '13703160099', '', '', '1', '2017-12-25 15:53:18', '1', '2017-12-25 15:53:18', '0', null);
INSERT INTO `tb_customer` VALUES ('199', 'FSKH1514189202812', '北京京西重工有限公司', '戚成玉', '', '1', '', '北京市房山区窦店', '13717794093', '', '', '1', '2017-12-25 16:06:42', '1', '2017-12-25 16:06:42', '0', null);
INSERT INTO `tb_customer` VALUES ('200', 'FSKH1514189489020', '中核821低放废液处理18子项', '李顺龙', '', '1', '', '四川省广元市', '18981234021', '', '', '1', '2017-12-25 16:11:29', '1', '2017-12-25 16:11:29', '0', null);
INSERT INTO `tb_customer` VALUES ('201', 'FSKH1514189809280', '航天赛德科技发展有限公司', '刘洋', '', '1', '', '云岗', '13552845299', '', '', '1', '2017-12-25 16:16:49', '1', '2017-12-25 16:16:49', '0', null);
INSERT INTO `tb_customer` VALUES ('202', 'FSKH1514190120389', '新疆潞新煤化工有限公司', '陈金庆', '', '1', '', '新疆哈密三道岭', '13565813009', '', '', '1', '2017-12-25 16:22:00', '1', '2017-12-25 16:22:00', '0', null);
INSERT INTO `tb_customer` VALUES ('203', 'FSKH1514190425200', '北京国电瑞丰电气', '冯经理', '', '1', '', '北京密云', '15801108869', '', '', '1', '2017-12-25 16:27:05', '1', '2017-12-25 16:27:05', '0', null);
INSERT INTO `tb_customer` VALUES ('204', 'FSKH1514190763098', '育鸣矿业', '陈光军', '', '1', '', '河北省涿鹿县', '15247978655', '', '', '1', '2017-12-25 16:32:43', '1', '2017-12-25 16:32:43', '0', null);
INSERT INTO `tb_customer` VALUES ('205', 'FSKH1514249098886', '山西潞安集团蒲县新良友煤业', '张育英', '', '1', '', '山西省临汾市蒲县', '15103477096', '', '', '1', '2017-12-26 08:44:58', '1', '2017-12-26 08:44:58', '0', null);
INSERT INTO `tb_customer` VALUES ('206', 'FSKH1514249345022', '中煤北京煤矿机械有限公司', '何成龙', '', '1', '', '北京市房山区矿机路', '13716703582', '', '', '1', '2017-12-26 08:49:05', '1', '2017-12-26 08:49:05', '0', null);
INSERT INTO `tb_customer` VALUES ('207', 'FSKH1514249715395', '黄冈矿业有限公司（温二井下作业）', '林武', '', '1', '', '克什克腾旗', '15004893555', '', '', '1', '2017-12-26 08:55:15', '1', '2017-12-26 08:55:15', '0', null);
INSERT INTO `tb_customer` VALUES ('208', 'FSKH1514250082376', '山西潞安集团蒲县黑龙关煤业', '李文刚', '', '1', '', '山西蒲县黑龙关', '0357-5370868', '', '', '1', '2017-12-26 09:01:22', '1', '2017-12-26 09:01:22', '0', null);
INSERT INTO `tb_customer` VALUES ('209', 'FSKH1514250319754', '常兴煤业松树岭煤矿', '李明', '', '1', '', '山西克城松树岭', '15235719069', '', '', '1', '2017-12-26 09:05:19', '1', '2017-12-26 09:05:19', '0', null);
INSERT INTO `tb_customer` VALUES ('210', 'FSKH1514250479354', '中国石油西气东输柳园压气站', '张强', '', '1', '', '甘肃柳园', '0937-5949751', '', '', '1', '2017-12-26 09:07:59', '1', '2017-12-26 09:07:59', '0', null);
INSERT INTO `tb_customer` VALUES ('211', 'FSKH1514250962515', '中国石油西气东输鄯善压气站', '秦站长', '', '1', '', '新疆鄯善', '18719944196', '', '', '1', '2017-12-26 09:16:02', '1', '2017-12-26 09:16:02', '0', null);
INSERT INTO `tb_customer` VALUES ('212', 'FSKH1514251479345', '内蒙古黄冈矿业（赤城京昌矿业有限公司）', '遽美进', '', '1', '', '河北赤城县', '15230331666', '', '', '1', '2017-12-26 09:24:39', '1', '2017-12-26 09:24:39', '0', null);
INSERT INTO `tb_customer` VALUES ('213', 'FSKH1514251758002', '滦平金慧丰矿业（原承德老龙潭矿）', '胡立平', '', '1', '', '滦平县马营子乡牡丹春沟', '15097805122', '', '', '1', '2017-12-26 09:29:18', '1', '2017-12-26 09:29:18', '0', null);
INSERT INTO `tb_customer` VALUES ('214', 'FSKH1514252053899', '北京市朝阳无油润滑建华轴承厂', '白宝良', '', '1', '', '朝阳区孙河乡沙子营', '13552065020', '', '', '1', '2017-12-26 09:34:13', '1', '2017-12-26 09:34:13', '0', null);
INSERT INTO `tb_customer` VALUES ('215', 'FSKH1514252388787', '山西临汾蒲县伊田煤业有限公司', '王青森', '', '1', '', '山西临汾蒲县黑龙关县', '0523-5730847', '', '', '1', '2017-12-26 09:39:48', '1', '2017-12-26 09:39:48', '0', null);
INSERT INTO `tb_customer` VALUES ('216', 'FSKH1514252877745', '内蒙古巴彦淖尔华油天然气有限责任公司', '', '', '1', '', '内蒙古巴彦淖尔市', '13518822092', '', '', '1', '2017-12-26 09:47:57', '1', '2017-12-26 09:47:57', '0', null);
INSERT INTO `tb_customer` VALUES ('217', 'FSKH1514253312319', '三河亮客威泽工业涂料有限公司', '赵立山', '', '1', '', '三河燕郊工业园', '13810588943', '', '', '1', '2017-12-26 09:55:12', '1', '2017-12-26 09:55:12', '0', null);
INSERT INTO `tb_customer` VALUES ('218', 'FSKH1514253638047', '陕西金堆城钼业有限公司', '韩佳峰', '', '1', '', '陕西华阴市华县莲花寺镇', '0913-4086202', '', '', '1', '2017-12-26 10:00:38', '1', '2017-12-26 10:00:38', '0', null);
INSERT INTO `tb_customer` VALUES ('219', 'FSKH1514253873300', '北京卫星制造厂', '李光明', '', '1', '', '知春路63号', '13811582170', '', '', '1', '2017-12-26 10:04:33', '1', '2017-12-26 10:04:33', '0', null);
INSERT INTO `tb_customer` VALUES ('220', 'FSKH1514255009015', '河北天怡公司', '郑国国', '', '1', '', '河间市诗经村乡', '18651579531', '', '', '1', '2017-12-26 10:23:29', '1', '2017-12-26 10:23:29', '0', null);
INSERT INTO `tb_customer` VALUES ('221', 'FSKH1514508041962', '印尼INDRAMAYU电站', '刘庆', '', '1', '', '印尼', '69217907', '', '', '1', '2017-12-29 08:40:41', '1', '2017-12-29 08:40:41', '0', null);
INSERT INTO `tb_customer` VALUES ('222', 'FSKH1514508821998', '北京恒合佳电子有限公司', '卢建鸿', '', '1', '', '北京市大兴区青云店镇兆辛屯', '90217685', '', '', '1', '2017-12-29 08:53:42', '1', '2017-12-29 08:53:42', '0', null);
INSERT INTO `tb_customer` VALUES ('223', 'FSKH1514509156505', '宁夏危险废物和医疗废物处理中心', '杨立宏', '', '1', '', '宁夏银川宁武', '0951-4510169', '', '', '1', '2017-12-29 08:59:16', '1', '2017-12-29 08:59:16', '0', null);
INSERT INTO `tb_customer` VALUES ('224', 'FSKH1514509436806', '西气东输沁水压气站', '唐亮', '', '1', '', '山西沁水', '13834876873', '', '', '1', '2017-12-29 09:03:56', '1', '2017-12-29 09:03:56', '0', null);
INSERT INTO `tb_customer` VALUES ('225', 'FSKH1514509999502', '敦化金城实业有限公司', '周起海', '', '1', '', '吉林敦化', '13596547599', '', '', '1', '2017-12-29 09:13:19', '1', '2017-12-29 09:13:19', '0', null);
INSERT INTO `tb_customer` VALUES ('226', 'FSKH1514510320157', '华北油田第二采油厂文西工区', '凌建伟', '', '1', '', '河北文安', '15076687171', '', '', '1', '2017-12-29 09:18:40', '1', '2017-12-29 09:18:40', '0', null);
INSERT INTO `tb_customer` VALUES ('227', 'FSKH1514511317724', '内蒙古黄岗梁矿（温二井下作业）', '林武', '', '1', '', '赤峰', '15004893555', '', '', '1', '2017-12-29 09:35:17', '1', '2017-12-29 09:35:17', '0', null);
INSERT INTO `tb_customer` VALUES ('228', 'FSKH1514511507160', '滦平县鑫鑫白云岩矿（承德老龙潭矿）', '田正学', '', '1', '', '滦平县', '13253188802', '', '', '1', '2017-12-29 09:38:27', '1', '2017-12-29 09:38:27', '0', null);
INSERT INTO `tb_customer` VALUES ('229', 'FSKH1514511666952', '山西潞安环能常村矿', '郭正东', '', '1', '', '长治', '0355-5945048', '', '', '1', '2017-12-29 09:41:06', '1', '2017-12-29 09:41:06', '0', null);
INSERT INTO `tb_customer` VALUES ('230', 'FSKH1514511826333', '安徽同利防腐安装公司', '周晋贵', '', '1', '', '香河开发区', '13722659332', '', '', '1', '2017-12-29 09:43:46', '1', '2017-12-29 09:43:46', '0', null);
INSERT INTO `tb_customer` VALUES ('231', 'FSKH1514512758763', '乌兰陶勒盖矿业有限公司', '钱富宽', '', '1', '', '内蒙古白云呼布苏木', '15947293511', '', '', '1', '2017-12-29 09:59:18', '1', '2017-12-29 09:59:18', '0', null);
INSERT INTO `tb_customer` VALUES ('232', 'FSKH1514512919533', '利丰雅高包装印刷（北京）有限公司', '马良', '', '1', '', '北京亦庄', '13520245787', '', '', '1', '2017-12-29 10:01:59', '1', '2017-12-29 10:01:59', '0', null);
INSERT INTO `tb_customer` VALUES ('233', 'FSKH1514513555818', '准格尔旗窑沟乡厅子堰煤矿有限公司', '郭玉庆', '', '1', '', '内蒙古准格尔旗窑沟乡厅子堰煤矿', '0477-4884060', '', '', '1', '2017-12-29 10:12:35', '1', '2017-12-29 10:12:35', '0', null);
INSERT INTO `tb_customer` VALUES ('234', 'FSKH1514514196496', '北京自来水集团锦州工贸公司', '宋国启', '', '1', '', '北京大兴黄村', '13501366266', '', '', '1', '2017-12-29 10:23:16', '1', '2017-12-29 10:23:16', '0', null);
INSERT INTO `tb_customer` VALUES ('235', 'FSKH1514514603510', '华北油田采油三厂路44号（留西工区）', '苏爱民', '', '1', '', '河间', '0317-2580415', '', '', '1', '2017-12-29 10:30:03', '1', '2017-12-29 10:30:03', '0', null);
INSERT INTO `tb_customer` VALUES ('236', 'FSKH1514515085114', '西气东输轮南庄气站', '', '', '1', '', '', '', '', '', '1', '2017-12-29 10:38:05', '1', '2017-12-29 10:38:05', '0', null);
INSERT INTO `tb_customer` VALUES ('237', 'FSKH1514515553239', '三河天龙新型建材有限公司', '岳德江', '', '1', '', '河北省三河市', '15100366988', '', '', '1', '2017-12-29 10:45:53', '1', '2017-12-29 10:45:53', '0', null);
INSERT INTO `tb_customer` VALUES ('238', 'FSKH1514515865612', '潞安伊田肥煤有限公司', '郭斌', '', '1', '', '山西省蒲县黑龙关镇', '15235739631', '', '', '1', '2017-12-29 10:51:05', '1', '2017-12-29 10:51:05', '0', null);
INSERT INTO `tb_customer` VALUES ('239', 'FSKH1514517288714', '保定长城汽车华北公司', '王建良', '', '1', '', '保定市顺平县', '0312-7681013', '', '', '1', '2017-12-29 11:14:48', '1', '2017-12-29 11:14:48', '0', null);
INSERT INTO `tb_customer` VALUES ('240', 'FSKH1514517676705', '河北华油石油工程建设有限公司', '赵建武', '', '1', '', '河北任丘市', '0317-2596351', '', '', '1', '2017-12-29 11:21:16', '1', '2017-12-29 11:21:16', '0', null);
INSERT INTO `tb_customer` VALUES ('241', 'FSKH1514517941942', '山西潞安环保能源开发股份有限公司', '杨锋', '', '1', '', '山西常村矿西坡风井', '13935533951', '', '', '1', '2017-12-29 11:25:41', '1', '2017-12-29 11:25:41', '0', null);
INSERT INTO `tb_customer` VALUES ('242', 'FSKH1514518159375', '保定长城精工铸造有限公司', '秦明哲', '', '1', '', '保定市顺平县', '13633225855', '', '', '1', '2017-12-29 11:29:19', '1', '2017-12-29 11:29:19', '0', null);
INSERT INTO `tb_customer` VALUES ('243', 'FSKH1514518473778', '永清嘉美印铁制罐有限公司', '陈章武', '', '1', '', '河北省永清县半截河', '13785582952', '', '', '1', '2017-12-29 11:34:33', '1', '2017-12-29 11:34:33', '0', null);
INSERT INTO `tb_customer` VALUES ('244', 'FSKH1514518651133', '中油管道物资装备', '赵建武', '', '1', '', '任丘', '0317-2594534', '', '', '1', '2017-12-29 11:37:31', '1', '2017-12-29 11:37:31', '0', null);
INSERT INTO `tb_customer` VALUES ('245', 'FSKH1514519302181', '首钢股份有限公司第一线材厂', '孙建霞', '', '1', '', '北京昌平', '13693597895', '', '', '1', '2017-12-29 11:48:22', '1', '2017-12-29 11:48:22', '0', null);
INSERT INTO `tb_customer` VALUES ('246', 'FSKH1514519889827', '北京松下电子部品有限公司', '毕培德', '', '1', '', '朝阳区', '010-64392345', '', '', '1', '2017-12-29 11:58:09', '1', '2017-12-29 11:58:09', '0', null);
INSERT INTO `tb_customer` VALUES ('247', 'FSKH1514520136520', '北京曙光国朝机电有限公司', '朱亚勋', '', '1', '', '顺义马坡', '69404051', '', '', '1', '2017-12-29 12:02:16', '1', '2017-12-29 12:02:16', '0', null);
INSERT INTO `tb_customer` VALUES ('248', 'FSKH1514520324054', '北京富帛股份有限公司', '王长礼', '', '1', '', '密云', '890988', '', '', '1', '2017-12-29 12:05:24', '1', '2017-12-29 12:05:24', '0', null);

-- ----------------------------
-- Table structure for tb_equ_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_equ_part`;
CREATE TABLE `tb_equ_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配件设备关系ID',
  `p_id` varchar(500) NOT NULL COMMENT '配件ID',
  `e_id` varchar(128) NOT NULL COMMENT '设备Id',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='配件表';

-- ----------------------------
-- Records of tb_equ_part
-- ----------------------------
INSERT INTO `tb_equ_part` VALUES ('16', '13', '470', null, '1', '2018-01-03 00:00:24', '1', '2018-01-03 00:10:00', '1');
INSERT INTO `tb_equ_part` VALUES ('17', '11', '470', null, '1', '2018-01-03 00:00:24', '1', '2018-01-03 00:10:00', '1');
INSERT INTO `tb_equ_part` VALUES ('18', '4', '470', null, '1', '2018-01-03 00:00:48', '1', '2018-01-03 00:00:48', '0');
INSERT INTO `tb_equ_part` VALUES ('19', '14', '470', null, '1', '2018-01-03 00:00:48', '1', '2018-01-03 00:09:54', '1');
INSERT INTO `tb_equ_part` VALUES ('20', '15', '470', null, '1', '2018-01-03 00:01:21', '1', '2018-01-03 00:09:50', '1');
INSERT INTO `tb_equ_part` VALUES ('21', '15', '470', null, '1', '2018-01-03 00:10:10', '1', '2018-01-03 00:10:10', '0');
INSERT INTO `tb_equ_part` VALUES ('22', '14', '470', null, '1', '2018-01-03 00:10:10', '1', '2018-01-03 00:10:10', '0');
INSERT INTO `tb_equ_part` VALUES ('23', '13', '470', null, '1', '2018-01-03 00:10:10', '1', '2018-01-03 00:11:36', '1');
INSERT INTO `tb_equ_part` VALUES ('24', '11', '470', null, '1', '2018-01-03 00:11:32', '1', '2018-01-03 00:11:40', '1');

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
  `elec_pan_model` varchar(100) DEFAULT NULL COMMENT '电控盘型号',
  `motor_make_date` date DEFAULT NULL COMMENT '电机制造日期',
  `machinery_number` varchar(128) DEFAULT NULL COMMENT '电机出厂编号',
  `motor_model` varchar(128) DEFAULT NULL COMMENT '电机型号',
  `make_date` varchar(255) DEFAULT NULL COMMENT '制造日期',
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
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8 COMMENT='设备表';

-- ----------------------------
-- Records of tb_equipment
-- ----------------------------
INSERT INTO `tb_equipment` VALUES ('39', 'FSEQ1499605513556', null, '38', 'kjk', 'i8888', '1233434', '8888', '2017-07-18', null, null, null, null, '1', '1', '7777', '123456', '1', '', '2017-07-09 21:05:13', '1', '2017-07-09 21:05:13', '1', null);
INSERT INTO `tb_equipment` VALUES ('40', 'FSEQ1499609100244', null, '45', '机型1', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-09 22:05:00', '1', '2017-07-09 22:05:00', '1', null);
INSERT INTO `tb_equipment` VALUES ('41', 'FSEQ1499609100257', null, '45', '机型12', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-09 22:05:00', '1', '2017-07-09 22:05:00', '1', null);
INSERT INTO `tb_equipment` VALUES ('42', 'FSEQ1499609100266', null, '45', '机型13', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-09 22:05:00', '1', '2017-07-09 22:05:00', '1', null);
INSERT INTO `tb_equipment` VALUES ('43', 'FSEQ1499609100277', null, '45', '机型14', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-09 22:05:00', '1', '2017-07-09 22:05:00', '1', null);
INSERT INTO `tb_equipment` VALUES ('44', 'FSEQ1499609355770', null, '45', '12', '1111111111111111111111111', '11111111111', '111111111111111111', '2017-07-11', null, null, null, null, '1', '1', '1111111111111111111111111', '11111111111111111111', '1', '', '2017-07-09 22:09:15', '1', '2017-07-09 22:09:15', '1', null);
INSERT INTO `tb_equipment` VALUES ('45', 'FSEQ1499645930518', null, '42', 'fff', 'qqq', 'fffff', 'qq', '2017-07-24', null, null, null, null, '1', '3', 'qqq', 'qqq', '1', '  ', '2017-07-10 08:18:50', '1', '2017-07-10 08:18:50', '1', null);
INSERT INTO `tb_equipment` VALUES ('46', 'FSEQ1499646734035', null, '50', '机型1', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '0', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-10 08:32:14', '1', '2017-07-10 08:32:14', '1', null);
INSERT INTO `tb_equipment` VALUES ('47', 'FSEQ1499646734079', null, '50', '机型12', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-10 08:32:14', '1', '2017-07-10 08:32:14', '1', null);
INSERT INTO `tb_equipment` VALUES ('48', 'FSEQ1499646734147', null, '50', '机型13', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-10 08:32:14', '1', '2017-07-10 08:32:14', '1', null);
INSERT INTO `tb_equipment` VALUES ('49', 'FSEQ1499646734155', null, '50', '机型14', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-07-10 08:32:14', '1', '2017-07-10 08:32:14', '1', null);
INSERT INTO `tb_equipment` VALUES ('50', 'FSEQ1499649661982', null, '54', '金1', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:21:01', '1', '2017-07-10 09:21:01', '1', null);
INSERT INTO `tb_equipment` VALUES ('51', 'FSEQ1499649661999', null, '54', '金2', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:21:02', '1', '2017-07-10 09:21:02', '1', null);
INSERT INTO `tb_equipment` VALUES ('52', 'FSEQ1499649662006', null, '54', '金3', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:21:02', '1', '2017-07-10 09:21:02', '1', null);
INSERT INTO `tb_equipment` VALUES ('53', 'FSEQ1499649662014', null, '54', '金4', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:21:02', '1', '2017-07-10 09:21:02', '1', null);
INSERT INTO `tb_equipment` VALUES ('54', 'FSEQ1499649743283', null, '54', '金1', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:23', '1', '2017-07-10 09:22:23', '1', null);
INSERT INTO `tb_equipment` VALUES ('55', 'FSEQ1499649743293', null, '54', '金2', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:23', '1', '2017-07-10 09:22:23', '1', null);
INSERT INTO `tb_equipment` VALUES ('56', 'FSEQ1499649743301', null, '54', '金3', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:23', '1', '2017-07-10 09:22:23', '1', null);
INSERT INTO `tb_equipment` VALUES ('57', 'FSEQ1499649743313', null, '54', '金4', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:23', '1', '2017-07-10 09:22:23', '1', null);
INSERT INTO `tb_equipment` VALUES ('58', 'FSEQ1499649761209', null, '55', '金1', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:41', '1', '2017-07-10 09:22:41', '0', null);
INSERT INTO `tb_equipment` VALUES ('59', 'FSEQ1499649761224', null, '55', '金2', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:41', '1', '2017-07-10 09:22:41', '0', null);
INSERT INTO `tb_equipment` VALUES ('60', 'FSEQ1499649761231', null, '55', '金3', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:41', '1', '2017-07-10 09:22:41', '0', null);
INSERT INTO `tb_equipment` VALUES ('61', 'FSEQ1499649761238', null, '55', '金4', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:41', '1', '2017-07-10 09:22:41', '0', null);
INSERT INTO `tb_equipment` VALUES ('62', 'FSEQ1499649766942', null, '54', '金1', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:46', '1', '2017-07-10 09:22:46', '0', null);
INSERT INTO `tb_equipment` VALUES ('63', 'FSEQ1499649766989', null, '54', '金2', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:46', '1', '2017-07-10 09:22:46', '0', null);
INSERT INTO `tb_equipment` VALUES ('64', 'FSEQ1499649766996', null, '54', '金3', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:46', '1', '2017-07-10 09:22:46', '0', null);
INSERT INTO `tb_equipment` VALUES ('65', 'FSEQ1499649767003', null, '54', '金4', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-07-10 09:22:47', '1', '2017-07-10 09:22:47', '0', null);
INSERT INTO `tb_equipment` VALUES ('66', 'FSEQ1500283761882', null, '56', 'SA45A', '卧龙 YE3-225M-4   320468', 'SS8160108', '2107050371', '2016-05-10', null, null, null, null, '1', '3', 'ES61060529', 'ES6160529', '1', '', '2017-07-17 17:29:21', '1', '2017-07-17 17:29:21', '0', null);
INSERT INTO `tb_equipment` VALUES ('67', 'FSEQ1500284279101', null, '57', 'SA08AR-8', '江天          YJT160M-2          182', 'FS9130152', 'SA08A       0813072539', '2013-08-05', null, null, null, null, '1', '3', 'ES9130187', 'ES9130187', '1', '', '2017-07-17 17:37:59', '1', '2017-07-17 17:37:59', '0', null);
INSERT INTO `tb_equipment` VALUES ('68', 'FSEQ1500284411839', null, '57', 'SA08AR-8', '江天          YJT160M-2         G-145', 'FS9130142', 'SA08A       0813072734', '2013-08-05', null, null, null, null, '1', '3', 'ES9130186', 'ES9130186', '1', '', '2017-07-17 17:40:11', '1', '2017-07-17 17:40:11', '0', null);
INSERT INTO `tb_equipment` VALUES ('69', 'FSEQ1500334517743', null, '57', 'SA08AR-8', '江天          YJT160M-2          176', 'FS9130143', 'SA08A       0813083328', '2013-07-05', null, null, null, null, '1', '3', 'ES9130377', 'ES9130377', '1', '', '2017-07-18 07:35:17', '1', '2017-07-18 07:35:17', '0', null);
INSERT INTO `tb_equipment` VALUES ('70', 'FSEQ1500334625117', null, '57', 'SA08AR-8', '江天          YJT160M-2          180', 'FS9130157', 'SA08A       0813072741', '2013-08-05', null, null, null, null, '1', '3', 'ES9130375', 'ES9130375', '1', '', '2017-07-18 07:37:05', '1', '2017-07-18 07:37:05', '0', null);
INSERT INTO `tb_equipment` VALUES ('71', 'FSEQ1500334766658', null, '57', 'SA08AR-8', '江天          YJT160M-2          194', 'FS9130151', 'SA08A       0813072745', '2013-08-05', null, null, null, null, '1', '3', 'ES9130490', 'ES9130490', '1', '', '2017-07-18 07:39:26', '1', '2017-07-18 07:39:26', '0', null);
INSERT INTO `tb_equipment` VALUES ('72', 'FSEQ1500334891313', null, '57', 'SA08AR-8', '江天          YJT160M-2          G-154', 'FS9130155', 'SA08A       0813072744', '2013-08-05', null, null, null, null, '1', '3', 'ES9130484', 'ES9130484', '1', '', '2017-07-18 07:41:31', '1', '2017-07-18 07:41:31', '0', null);
INSERT INTO `tb_equipment` VALUES ('73', 'FSEQ1500335004707', null, '57', 'SA08AR-8', '江天          YJT160M-2         199', 'FS9130154', 'SA08A       0813083334', '2013-08-05', null, null, null, null, '1', '3', 'ES9130195', 'ES9130195', '1', '', '2017-07-18 07:43:24', '1', '2017-07-18 07:43:24', '0', null);
INSERT INTO `tb_equipment` VALUES ('74', 'FSEQ1500335125685', null, '57', 'SA08AR-8', '江天          YJT160M-2          186', 'FS9130156', 'SA08A       0813072742', '2013-08-05', null, null, null, null, '1', '3', 'ES9130370', 'ES9130370', '1', '', '2017-07-18 07:45:25', '1', '2017-07-18 07:45:25', '0', null);
INSERT INTO `tb_equipment` VALUES ('75', 'FSEQ1500335209965', null, '57', 'SA08AR-8', '江天          YJT160M-2          192', 'FS9130144', 'SA08A       08', '2013-08-05', null, null, null, null, '1', '3', 'ES9130376', 'ES9130376', '1', '', '2017-07-18 07:46:49', '1', '2017-07-18 07:46:49', '0', null);
INSERT INTO `tb_equipment` VALUES ('76', 'FSEQ1500335279104', null, '57', 'SA08AR-8', '江天          YJT160M-2          184', 'FS9130153', 'SA08A       0813072731', '2013-08-05', null, null, null, null, '1', '3', 'ES9130485', 'ES9130485', '1', '', '2017-07-18 07:47:59', '1', '2017-07-18 07:47:59', '0', null);
INSERT INTO `tb_equipment` VALUES ('77', 'FSEQ1500335598238', null, '59', 'SA60A-8', '清江 YE3-250M-2  J0105', 'SSA160150', 'HS202-0816080666       2107050861', '2017-07-18', null, null, null, null, '1', '3', 'ES9160402', 'ES9160402', '1', '', '2017-07-18 07:53:18', '1', '2017-07-18 07:53:18', '0', null);
INSERT INTO `tb_equipment` VALUES ('78', 'FSEQ1500335907934', null, '60', 'ZW375W-7', '中达 YE3-200L-2    160406006-2', 'SZ5160103', 'BPJ0022        2107040476', '2017-07-18', null, null, null, null, '1', '3', 'M306160328', 'M306160328', '1', '', '2017-07-18 07:58:27', '1', '2017-07-18 07:58:27', '0', null);
INSERT INTO `tb_equipment` VALUES ('79', 'FSEQ1500336055697', null, '60', 'ZW375W-7', '中达 YE3-200L-2    160321030-1', 'SZ5160104', 'HS202-0316050021        2107040476', '2017-07-18', null, null, null, null, '1', '3', 'M306151217', 'M306151217', '1', '', '2017-07-18 08:00:55', '1', '2017-07-18 08:00:55', '0', null);
INSERT INTO `tb_equipment` VALUES ('80', 'FSEQ1500336176621', null, '60', 'ZW375W-7', '中达 YE3-200L-2    160406006-1', 'SZ5160105', 'HS202-034070035        2107040476', '2017-07-18', null, null, null, null, '1', '3', 'M306151216', 'M306151216', '1', '', '2017-07-18 08:02:56', '1', '2017-07-18 08:02:56', '0', null);
INSERT INTO `tb_equipment` VALUES ('81', 'FSEQ1500336511510', null, '61', 'SA75A-10', '中达YE3-280S   160625010-5', 'SS8160191', 'HS202-0816050367    2107051555', '2017-07-18', null, null, null, null, '1', '3', 'ES8160160', 'ES8160160', '1', '  ', '2017-07-18 08:08:31', '1', '2017-07-18 08:08:31', '0', null);
INSERT INTO `tb_equipment` VALUES ('82', 'FSEQ1500336989838', null, '62', 'SA04A', '江天 YE3-1325-4    EK0024', 'SS5160107A', '316030375', '2017-07-18', null, null, null, null, '1', '3', 'ES4160677', 'ES4160677', '1', '', '2017-07-18 08:16:29', '1', '2017-07-18 08:16:29', '0', null);
INSERT INTO `tb_equipment` VALUES ('83', 'FSEQ1500337589901', null, '63', 'SA132A', '清江YQ315M-4   J0331', 'HS8140234', '0814810228', '2017-07-18', null, null, null, null, '1', '3', 'ES3140308', 'ES3140308', '1', '', '2017-07-18 08:26:29', '1', '2017-07-18 08:26:29', '0', null);
INSERT INTO `tb_equipment` VALUES ('84', 'FSEQ1500337729649', null, '63', 'SA132A', '清江 YE3-250M-2  J0332', 'HS8140235', '0814020503', '2017-07-18', null, null, null, null, '1', '3', 'ES4140559', 'ES4140559', '1', '', '2017-07-18 08:28:49', '1', '2017-07-18 08:28:49', '0', null);
INSERT INTO `tb_equipment` VALUES ('85', 'FSEQ1500337899184', null, '63', 'SA132A', '清江YQ315M-4   J0333', 'HS8140236', '0814020500', '2017-07-18', null, null, null, null, '1', '3', 'ES4140599', 'ES4140599', '1', '', '2017-07-18 08:31:39', '1', '2017-07-18 08:31:39', '0', null);
INSERT INTO `tb_equipment` VALUES ('86', 'FSEQ1500384053377', null, '70', 'r', 'r', 'r', 'r', '2017-07-07', null, null, null, null, '1', '1', 'r', 'r', '1', '', '2017-07-18 21:20:53', '1', '2017-07-18 21:20:53', '1', null);
INSERT INTO `tb_equipment` VALUES ('87', 'FSEQ1501542883900', null, '101', '44', '44', '444', '4', '2017-08-01', null, null, null, null, '1', '1', '44', '444', '1', '', '2017-08-01 07:14:43', '1', '2017-08-01 07:14:43', '1', null);
INSERT INTO `tb_equipment` VALUES ('88', 'FSEQ1501543087342', null, '101', '金1', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-08-01 07:18:07', '1', '2017-08-01 07:18:07', '1', null);
INSERT INTO `tb_equipment` VALUES ('89', 'FSEQ1501543087355', null, '101', '金2', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-08-01 07:18:07', '1', '2017-08-01 07:18:07', '1', null);
INSERT INTO `tb_equipment` VALUES ('90', 'FSEQ1501543087364', null, '101', '金3', '1.0', '111111111111111', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-08-01 07:18:07', '1', '2017-08-01 07:18:07', '1', null);
INSERT INTO `tb_equipment` VALUES ('91', 'FSEQ1501543087373', null, '101', '金4', '1.0', '222222222222', '1.0', '1983-09-09', null, null, null, null, '0', '3', '12345.0', '1234456.0', '1', '记录点什么', '2017-08-01 07:18:07', '1', '2017-08-01 07:18:07', '1', null);
INSERT INTO `tb_equipment` VALUES ('92', 'FSEQ1501632729895', null, '80', 'f', 'fff', 'f', 'fff', '2017-08-04', null, null, '', null, '1', '1', 'ffff', 'fff', '1', '', '2017-08-02 08:12:09', '1', '2017-08-02 08:12:09', '1', null);
INSERT INTO `tb_equipment` VALUES ('93', 'FSEQ1501709387019', null, '104', '机型1', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '0', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-08-03 05:29:47', '1', '2017-08-03 05:29:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('94', 'FSEQ1501709387046', null, '104', '机型12', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-08-03 05:29:47', '1', '2017-08-03 05:29:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('95', 'FSEQ1501709387057', null, '104', '机型13', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-08-03 05:29:47', '1', '2017-08-03 05:29:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('96', 'FSEQ1501709387090', null, '104', '机型14', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '1', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-08-03 05:29:47', '1', '2017-08-03 05:29:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('97', 'FSEQ1501709387102', null, '104', '', '', '', '', null, null, null, null, null, '0', '0', '', '', '1', '', '2017-08-03 05:29:47', '1', '2017-08-03 05:29:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('98', 'FSEQ1501710422849', null, '104', '你都看到0', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:02', '1', '2017-08-03 05:47:02', '0', null);
INSERT INTO `tb_equipment` VALUES ('99', 'FSEQ1501710422964', null, '104', '你都看到1', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:02', '1', '2017-08-03 05:47:02', '0', null);
INSERT INTO `tb_equipment` VALUES ('100', 'FSEQ1501710423010', null, '104', '你都看到2', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('101', 'FSEQ1501710423027', null, '104', '你都看到3', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('102', 'FSEQ1501710423037', null, '104', '你都看到4', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('103', 'FSEQ1501710423049', null, '104', '你都看到5', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('104', 'FSEQ1501710423063', null, '104', '你都看到6', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '0', null);
INSERT INTO `tb_equipment` VALUES ('105', 'FSEQ1501710423075', null, '104', '你都看到7', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, null, null, '0', '3', 'addddd', 'xxxxx123', '1', '记录点什么', '2017-08-03 05:47:03', '1', '2017-08-03 05:47:03', '1', null);
INSERT INTO `tb_equipment` VALUES ('106', 'FSEQ1501710423085', null, '104', '你都看到8', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, '2017-08-23', null, '1', '1', 'addddd', 'addddd', '1', '    记录点什么    ', '2017-08-03 05:47:03', '1', '2017-08-03 05:58:45', '0', '33');
INSERT INTO `tb_equipment` VALUES ('107', 'FSEQ1501710423095', null, '104', '你都看到9', 'ff', 'HS8140236', 'fff', '2016-09-07', null, null, '', null, '0', '3', 'addddd', 'addddd', '1', ' 记录点什么 ', '2017-08-03 05:47:03', '1', '2017-08-03 05:50:33', '1', null);
INSERT INTO `tb_equipment` VALUES ('108', 'FSEQ1501712036574', null, '106', '设备A', '胜多负少', 'testAA', '实打实地方', '2017-08-23', null, null, '2017-08-17', null, '1', '3', '通天塔', '通天塔', '1', ' hhhh ', '2017-08-03 06:13:56', '1', '2017-08-03 06:14:15', '1', null);
INSERT INTO `tb_equipment` VALUES ('109', 'FSEQ1501808315782', null, '107', 'i', '999', '999', '999', '2017-08-22', null, null, '2017-08-29', null, '1', '1', 'oooo', '8888', '1', '', '2017-08-04 08:58:35', '1', '2017-08-04 08:58:35', '1', null);
INSERT INTO `tb_equipment` VALUES ('110', 'FSEQ1502151923946', null, '107', '5', '5', '5', '5', '2017-08-08', null, null, '', null, '0', null, '5', '55', '1', '', '2017-08-08 08:25:23', '1', '2017-08-08 08:25:23', '1', null);
INSERT INTO `tb_equipment` VALUES ('111', 'FSEQ1503272465804', null, '100', '竖立机型', 'DIANJICHANGPAI', '制造号码', 'DIANKONGPANXINGHAO', '2017-08-14', null, null, '2017-08-23', null, '0', null, 'XIANZHUJIHAOMA32333', 'XIANZHUJIHAOMA32333', '1', '    ', '2017-08-21 07:41:05', '1', '2017-08-21 21:38:22', '1', null);
INSERT INTO `tb_equipment` VALUES ('112', 'FSEQ1503323199829', null, '100', '机型2', '点击唱盘2', '制造号码2', '点空盘行2', '2017-08-16', null, null, '2017-08-22', null, '0', null, '先主机号码2', '先主机号码2', '1', '  ', '2017-08-21 21:46:40', '1', '2017-08-21 21:47:49', '1', null);
INSERT INTO `tb_equipment` VALUES ('113', 'FSEQ1503323383268', null, '100', '设备机型:3', '电机厂牌3', '制造号码:3', '电控盘型号3', '2017-08-23', null, null, '2017-08-23', null, '0', null, '先主机号码3', '先主机号码3', '1', '    ', '2017-08-21 21:49:43', '1', '2017-08-21 21:59:55', '1', null);
INSERT INTO `tb_equipment` VALUES ('114', 'FSEQ1503358587099', null, '99', 'sdasdasd', 'asdasd32', 'asdasd', 'asdad3', '2017-08-15', null, null, '2017-08-15', null, '0', null, 'asd2', 'asdasd1', '1', '', '2017-08-22 07:36:27', '1', '2017-08-22 07:36:27', '1', null);
INSERT INTO `tb_equipment` VALUES ('115', 'FSEQ1503358601277', null, '99', 'asdasd', '12', 'aaaa', '12', '2017-08-23', null, null, '2017-08-15', null, '0', null, '12', '12', '1', '', '2017-08-22 07:36:41', '1', '2017-08-22 07:36:41', '1', null);
INSERT INTO `tb_equipment` VALUES ('116', 'FSEQ1503648848764', null, '108', 'SA250A-10K', '卧龙   Y400-4     031217601', 'FS7170140B', 'HS202-0417060054      260533S17050101', '2017-06-06', null, null, '2017-07-07', null, '1', '3', '1', '', '1', '', '2017-08-25 16:14:08', '1', '2017-08-25 16:14:08', '0', null);
INSERT INTO `tb_equipment` VALUES ('117', 'FSEQ1503649112961', null, '108', 'SA250A-10K', '卧龙   Y400-4     011615401', 'FS7170141B', 'HS202-0417060055     260533S17050101', '2017-06-06', null, null, '2017-07-07', null, '0', '3', '2', '', '1', '  ', '2017-08-25 16:18:32', '1', '2017-08-25 16:19:17', '0', null);
INSERT INTO `tb_equipment` VALUES ('118', 'FSEQ1503649260886', null, '108', 'SA250A-10K', '卧龙   Y400-4     035016802', 'FS7170142B', 'HS202-0417060053      260533S17050101', '2017-06-05', null, null, '2017-07-07', null, '1', '3', '3', '', '1', '', '2017-08-25 16:21:00', '1', '2017-08-25 16:21:00', '0', null);
INSERT INTO `tb_equipment` VALUES ('119', 'FSEQ1503649335448', null, '108', 'SA250A-10K', '卧龙   Y400-4     035016801', 'FS7170143B', 'HS202-0417060052      260533S17050101', '2017-06-06', null, null, '2017-07-07', null, '1', '3', '4', '', '1', '', '2017-08-25 16:22:15', '1', '2017-08-25 16:22:15', '0', null);
INSERT INTO `tb_equipment` VALUES ('120', 'FSEQ1503755708114', null, '109', 'r', '22222222222222222', 'rrrrrrrrrrrrrrrr', '222222222222222', '2017-09-05', null, null, '2017-08-08', null, '0', null, '22222222222222222', '2', '1', '', '2017-08-26 21:55:08', '1', '2017-08-26 21:55:08', '1', null);
INSERT INTO `tb_equipment` VALUES ('121', 'FSEQ1503842925735', null, '110', '测试设备1', 'ABC2201020010212', 'ABC22010200102', 'ABC22010200104', '2017-08-24', null, null, '2017-08-29', null, '0', null, 'ABC220102001023', 'ABC220102001021', '1', '阿萨斯阿萨斯大所多', '2017-08-27 22:08:47', '1', '2017-08-27 22:08:47', '1', null);
INSERT INTO `tb_equipment` VALUES ('122', 'FSEQ1503842968111', null, '110', '测试设备21', 'ABC2010201200141', 'ABC2010201200121', 'ABC2010201200141', '2017-08-09', null, null, '2018-03-21', null, '0', '2', 'ABC2010201200141', 'ABC2010201200131', '1', ' 阿萨斯 111', '2017-08-27 22:09:29', '1', '2017-08-27 22:09:46', '0', '63');
INSERT INTO `tb_equipment` VALUES ('123', 'FSEQ1503843003563', null, '110', '压缩机一号', '北京xxxx', 'XFS0001', '123', '2017-10-10', null, null, '', null, '0', '3', '123dfdfd45', '121213', '1', ' 测试信息 ', '2017-08-27 22:10:05', '1', '2017-08-27 22:10:20', '0', null);
INSERT INTO `tb_equipment` VALUES ('124', 'FSEQ1505052962827', null, '112', '机型1', '电机厂牌', '11111.0', '电机厂牌', '2017-09-09', null, null, null, null, '0', '3', '12222.0', '1234456.0', '1', '记录点什么', '2017-09-10 22:16:02', '1', '2017-09-10 22:16:02', '0', null);
INSERT INTO `tb_equipment` VALUES ('125', 'FSEQ1505053201614', null, '112', 'rrr', '点击唱盘2', '1233', 'fffffffff', '2017-09-19', null, null, '', null, '1', null, '1111111', '', '1', '', '2017-09-10 22:20:01', '1', '2017-09-10 22:20:01', '0', '73');
INSERT INTO `tb_equipment` VALUES ('126', 'FSEQ1506222543488', null, '117', '设备A', '测试', 'A100001', 'A', '2017-09-26', null, null, '2017-09-19', null, '0', null, 'A100005', 'A100002', '1', '', '2017-09-24 11:09:00', '1', '2017-09-24 11:09:00', '0', null);
INSERT INTO `tb_equipment` VALUES ('127', 'FSEQ1507450655226', null, '116', 'testaaa', 'testaaa', 'testaaa', '', '2017-10-05', 'testaaa', '', '', null, '0', null, 'testaaa', 'testaaa', '1', '', '2017-10-08 16:18:36', '1', '2017-10-08 16:18:36', '1', null);
INSERT INTO `tb_equipment` VALUES ('128', 'FSEQ1507450766726', null, '116', 'testaaa', '', 'testaaa', '', null, '', '', '', null, '0', null, 'testaaa', '', '1', '    ', '2017-10-08 16:20:27', '1', '2017-10-09 07:19:56', '0', '76,77,78');
INSERT INTO `tb_equipment` VALUES ('129', 'FSEQ1508655250236', null, '118', '大黄蜂', '', 'TQ_10001', '', null, '', '', '2017-10-03', null, '0', null, 'TQ_20171022', 'TQ_20171024', '1', ' test ', '2017-10-22 14:54:09', '1', '2017-10-22 14:54:40', '0', '96,97');
INSERT INTO `tb_equipment` VALUES ('130', 'FSEQ1513213458326', null, '60', 'ZW375W-7', '', 'SZ5160103', '', null, '', '', '', null, '0', null, 'M306160328', '', '1', '', '2017-12-14 09:04:18', '1', '2017-12-14 09:04:18', '0', '');
INSERT INTO `tb_equipment` VALUES ('131', 'FSEQ1513213610873', null, '60', 'SW375W-7', '', 'SZ5160104', '', null, '', '', '', null, '0', null, 'M306151217', '', '1', '', '2017-12-14 09:06:50', '1', '2017-12-14 09:06:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('132', 'FSEQ1513213728550', null, '60', 'SW375W-7', '', 'SZ5160105', '', null, '', '', '', null, '0', null, 'M306151216', '', '1', '', '2017-12-14 09:08:48', '1', '2017-12-14 09:08:48', '0', '');
INSERT INTO `tb_equipment` VALUES ('133', 'FSEQ1513214152226', null, '61', 'SA75A-10', '', 'SS8160191', '', null, '', '', '', null, '0', null, 'ES8160160', '', '1', '', '2017-12-14 09:15:52', '1', '2017-12-14 09:15:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('134', 'FSEQ1513215071306', null, '119', 'SA04A/7', '', 'SS5160127A', '', null, '', '', '', null, '0', null, 'ES4160679', '', '1', '', '2017-12-14 09:31:11', '1', '2017-12-14 09:31:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('135', 'FSEQ1513215659543', null, '120', 'SA132A', '', 'HS8140234', '', null, '', '', '', null, '0', null, 'ES3140308', '', '1', '', '2017-12-14 09:40:59', '1', '2017-12-14 09:40:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('136', 'FSEQ1513215741560', null, '120', 'SA132A', '', 'HS8140235', '', null, '', '', '', null, '0', null, 'ES4140559', '', '1', '', '2017-12-14 09:42:21', '1', '2017-12-14 09:42:21', '0', '');
INSERT INTO `tb_equipment` VALUES ('137', 'FSEQ1513215806429', null, '120', 'SA132A', '', 'HS8140236', '', null, '', '', '', null, '0', null, 'ES4140599', '', '1', '', '2017-12-14 09:43:26', '1', '2017-12-14 09:43:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('138', 'FSEQ1513215922413', null, '119', 'SA04A', '', 'SS5160107A', '', null, '', '', '', null, '0', null, 'ES4160677', '', '1', '', '2017-12-14 09:45:22', '1', '2017-12-14 09:45:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('139', 'FSEQ1513216173194', null, '65', 'SA220W-8', '', 'FS3150107B', '', null, '', '', '', null, '0', null, 'ES3150124', '', '1', '', '2017-12-14 09:49:33', '1', '2017-12-14 09:49:33', '0', '');
INSERT INTO `tb_equipment` VALUES ('140', 'FSEQ1513216406342', null, '65', 'SA220W-8', '', 'FS3150106B', '', null, '', '', '', null, '0', null, 'ES3150117', '', '1', '', '2017-12-14 09:53:26', '1', '2017-12-14 09:53:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('141', 'FSEQ1513216734188', null, '65', 'SA220W-8', '', 'FS3150108B', '', null, '', '', '', null, '0', null, 'ES3150118', '', '1', '', '2017-12-14 09:58:54', '1', '2017-12-14 09:58:54', '0', '');
INSERT INTO `tb_equipment` VALUES ('142', 'FSEQ1513216834625', null, '65', 'SAV220W-8', '', 'FS3150109B', '', null, '', '', '', null, '0', null, 'ES1130285', '', '1', '', '2017-12-14 10:00:34', '1', '2017-12-14 10:00:34', '0', '');
INSERT INTO `tb_equipment` VALUES ('143', 'FSEQ1513217053114', null, '66', 'SA90A-10', '', 'FS5150148', '', null, '', '', '', null, '0', null, 'ES5150375', '', '1', '', '2017-12-14 10:04:13', '1', '2017-12-14 10:04:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('144', 'FSEQ1513217132122', null, '66', 'SA90A-10', '', 'FS5150149', '', null, '', '', '', null, '0', null, 'ES5150376', '', '1', '', '2017-12-14 10:05:32', '1', '2017-12-14 10:05:32', '0', '');
INSERT INTO `tb_equipment` VALUES ('145', 'FSEQ1513217584431', null, '67', 'SA250W-8-6K', '', 'SS9150147B', '', null, '', '', '', null, '0', null, 'ES9150086', '', '1', '', '2017-12-14 10:13:04', '1', '2017-12-14 10:13:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('146', 'FSEQ1513217706623', null, '68', 'SA06A', '', 'SS9150153A', '', null, '', '', '', null, '0', null, 'ES8150377', '', '1', '', '2017-12-14 10:15:06', '1', '2017-12-14 10:15:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('147', 'FSEQ1513217771685', null, '68', 'SA06A', '', 'SS9150154A', '', null, '', '', '', null, '0', null, 'ES8150370', '', '1', '', '2017-12-14 10:16:11', '1', '2017-12-14 10:16:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('148', 'FSEQ1513217991326', null, '121', 'SA250A-66V', '', 'BS6140005', '', null, '', '', '', null, '0', null, 'ES6140437', '', '1', '', '2017-12-14 10:19:51', '1', '2017-12-14 10:19:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('149', 'FSEQ1513218439473', null, '122', 'SA132W-8', '', 'HSA130043', '', null, '', '', '', null, '0', null, 'ES8130727', '', '1', '', '2017-12-14 10:27:19', '1', '2017-12-14 10:27:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('150', 'FSEQ1513218568698', null, '122', 'SA132W-8', '', 'HSA130044', '', null, '', '', '', null, '0', null, 'ES8130726', '', '1', '  ', '2017-12-14 10:29:28', '1', '2017-12-14 10:33:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('151', 'FSEQ1513218645458', null, '122', 'SA132W-8', '', 'HSA130045', '', null, '', '', '', null, '0', null, 'ES9130440', '', '1', '', '2017-12-14 10:30:45', '1', '2017-12-14 10:30:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('152', 'FSEQ1513218731203', null, '122', 'SA132W-8', '', 'HSA130046', '', null, '', '', '', null, '0', null, 'ES9130389', '', '1', '', '2017-12-14 10:32:11', '1', '2017-12-14 10:32:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('153', 'FSEQ1513218950787', null, '122', 'SA22A-7', '', 'SS8130067', '', null, '', '', '', null, '0', null, '单子上没有', '', '1', '', '2017-12-14 10:35:50', '1', '2017-12-14 10:35:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('154', 'FSEQ1513219177847', null, '123', 'SA45A-8', '', 'SS2150112', '', null, '', '', '', null, '0', null, 'ES1150447', '', '1', '', '2017-12-14 10:39:37', '1', '2017-12-14 10:39:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('155', 'FSEQ1513219235896', null, '123', 'SA45A-8', '', 'SS3150562', '', null, '', '', '', null, '0', null, 'ES2150324', '', '1', '', '2017-12-14 10:40:35', '1', '2017-12-14 10:40:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('156', 'FSEQ1513219427030', null, '124', 'SA11A', '', 'SS9150001A', '', null, '', '', '', null, '0', null, 'ES6150625', '', '1', '', '2017-12-14 10:43:47', '1', '2017-12-14 10:43:47', '0', '');
INSERT INTO `tb_equipment` VALUES ('157', 'FSEQ1513219833645', null, '125', 'SA120A', '', 'BS3140115', '', null, '', '', '', null, '0', null, 'ES2140698', '', '1', '', '2017-12-14 10:50:33', '1', '2017-12-14 10:50:33', '0', '');
INSERT INTO `tb_equipment` VALUES ('158', 'FSEQ1513219895973', null, '125', 'SA120A', '', 'BS3140108', '', null, '', '', '', null, '0', null, 'ES2140693', '', '1', '', '2017-12-14 10:51:35', '1', '2017-12-14 10:51:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('159', 'FSEQ1513219956918', null, '125', 'SA120A', '', 'BS3140109', '', null, '', '', '', null, '0', null, 'ES2140248', '', '1', '', '2017-12-14 10:52:36', '1', '2017-12-14 10:52:36', '0', '');
INSERT INTO `tb_equipment` VALUES ('160', 'FSEQ1513220007282', null, '125', 'SA120A/7', '', 'BS1150221', '', null, '', '', '', null, '0', null, 'ESA140126', '', '1', '', '2017-12-14 10:53:27', '1', '2017-12-14 10:53:27', '0', '');
INSERT INTO `tb_equipment` VALUES ('161', 'FSEQ1513220067663', null, '125', 'SA120A/7', '', 'BS1150222', '', null, '', '', '', null, '0', null, 'ES9140047', '', '1', '', '2017-12-14 10:54:27', '1', '2017-12-14 10:54:27', '0', '');
INSERT INTO `tb_equipment` VALUES ('162', 'FSEQ1513220143877', null, '125', 'SA120A', '', 'BS3140110', '', null, '', '', '', null, '0', null, 'ES2140696', '', '1', '', '2017-12-14 10:55:43', '1', '2017-12-14 10:55:43', '0', '');
INSERT INTO `tb_equipment` VALUES ('163', 'FSEQ1513220271098', null, '123', 'SA45A-8', '', 'SS2150330', '', null, '', '', '', null, '0', null, 'ES2150351', '', '1', '', '2017-12-14 10:57:51', '1', '2017-12-14 10:57:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('164', 'FSEQ1513301587924', null, '126', 'SA160A/1.25', '', 'HS2150202', '', null, '', '', '', null, '0', null, 'ESC140513', '', '1', '', '2017-12-15 09:33:07', '1', '2017-12-15 09:33:07', '0', '');
INSERT INTO `tb_equipment` VALUES ('165', 'FSEQ1513301635554', null, '126', 'SA160A/1.25', '', 'HS2150201', '', null, '', '', '', null, '0', null, 'ESC140518', '', '1', '', '2017-12-15 09:33:55', '1', '2017-12-15 09:33:55', '0', '');
INSERT INTO `tb_equipment` VALUES ('166', 'FSEQ1513301708487', null, '126', 'SA160A/1.25', '', 'HS2150204', '', null, '', '', '', null, '0', null, 'ES1150362', '', '1', '', '2017-12-15 09:35:08', '1', '2017-12-15 09:35:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('167', 'FSEQ1513301815404', null, '126', 'SA160A/1.25', '', 'HS2150203', '', null, '', '', '', null, '0', null, 'ES0140516', '', '1', '', '2017-12-15 09:36:55', '1', '2017-12-15 09:36:55', '0', '');
INSERT INTO `tb_equipment` VALUES ('168', 'FSEQ1513302075075', null, '127', 'SF22A', '', 'SS2150224', '', null, '', '', '', null, '0', null, 'ES1150596', '', '1', '', '2017-12-15 09:41:15', '1', '2017-12-15 09:41:15', '0', '');
INSERT INTO `tb_equipment` VALUES ('169', 'FSEQ1513302155305', null, '127', 'SF37A', '', 'SS3150562', '', null, '', '', '', null, '0', null, 'ES2150324', '', '1', '', '2017-12-15 09:42:35', '1', '2017-12-15 09:42:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('170', 'FSEQ1513302411139', null, '128', 'SA15A/8S', '', 'SS9140294', '', null, '', '', '', null, '0', null, 'ES914127', '', '1', '', '2017-12-15 09:46:51', '1', '2017-12-15 09:46:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('171', 'FSEQ1513302449420', null, '128', 'SA15A/8S', '', 'SS9140295', '', null, '', '', '', null, '0', null, 'ES914219', '', '1', '', '2017-12-15 09:47:29', '1', '2017-12-15 09:47:29', '0', '');
INSERT INTO `tb_equipment` VALUES ('172', 'FSEQ1513302487681', null, '128', 'SA15A/8S', '', 'SS9140296', '', null, '', '', '', null, '0', null, 'ES9140214', '', '1', '', '2017-12-15 09:48:07', '1', '2017-12-15 09:48:07', '0', '');
INSERT INTO `tb_equipment` VALUES ('173', 'FSEQ1513302536336', null, '128', 'SA15A/8S', '', 'SS9140297', '', null, '', '', '', null, '0', null, 'ES9140216', '', '1', '', '2017-12-15 09:48:56', '1', '2017-12-15 09:48:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('174', 'FSEQ1513302862300', null, '129', 'SA120A', '', 'BS3150108', '', null, '', '', '', null, '0', null, 'ES1150776', '', '1', '', '2017-12-15 09:54:22', '1', '2017-12-15 09:54:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('175', 'FSEQ1513302914121', null, '129', 'SA120A', '', 'BS3150107', '', null, '', '', '', null, '0', null, 'ES2150040', '', '1', '', '2017-12-15 09:55:14', '1', '2017-12-15 09:55:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('176', 'FSEQ1513303021916', null, '67', 'SA11A-8', '', 'SS7140466', '', null, '', '', '', null, '0', null, 'ES714040G', '', '1', '', '2017-12-15 09:57:01', '1', '2017-12-15 09:57:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('177', 'FSEQ1513303081728', null, '127', 'SF22A', '', 'SS4140163', '', null, '', '', '', null, '0', null, 'ES3140721', '', '1', '', '2017-12-15 09:58:01', '1', '2017-12-15 09:58:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('178', 'FSEQ1513303302610', null, '130', 'SA18A/7', '', 'SS5160364A', '', null, '', '', '', null, '0', null, 'ES5160821', '', '1', '', '2017-12-15 10:01:42', '1', '2017-12-15 10:01:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('179', 'FSEQ1513303359152', null, '127', 'SF37A', '', 'SS3150558', '', null, '', '', '', null, '0', null, 'ES3150486', '', '1', '', '2017-12-15 10:02:39', '1', '2017-12-15 10:02:39', '0', '');
INSERT INTO `tb_equipment` VALUES ('180', 'FSEQ1513303488135', null, '80', 'SA11AF-12', '', 'SSB140244', '', null, '', '', '', null, '0', null, 'ESB140409', '', '1', '', '2017-12-15 10:04:48', '1', '2017-12-15 10:04:48', '0', '');
INSERT INTO `tb_equipment` VALUES ('181', 'FSEQ1513305093940', null, '131', 'SA08AF-7', '', 'SS8130208', '', null, '', '', '', null, '0', null, 'ES9100801', '', '1', '', '2017-12-15 10:31:33', '1', '2017-12-15 10:31:33', '0', '');
INSERT INTO `tb_equipment` VALUES ('182', 'FSEQ1513305158504', null, '131', 'SA08AF-7', '', 'SSB130205', '', null, '', '', '', null, '0', null, 'ES9136804', '', '1', '', '2017-12-15 10:32:38', '1', '2017-12-15 10:32:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('183', 'FSEQ1513305235417', null, '131', 'SA08AF-7', '', 'SSB130448', '', null, '', '', '', null, '0', null, 'ESB130412', '', '1', '', '2017-12-15 10:33:55', '1', '2017-12-15 10:33:55', '0', '');
INSERT INTO `tb_equipment` VALUES ('184', 'FSEQ1513305452606', null, '132', 'SAV132A', '', 'BS6150210', '', null, '', '', '', null, '0', null, 'ES6150289', '', '1', '', '2017-12-15 10:37:32', '1', '2017-12-15 10:37:32', '0', '');
INSERT INTO `tb_equipment` VALUES ('185', 'FSEQ1513305554235', null, '122', 'SA22A-7', '', 'SS813067', '', null, '', '', '', null, '0', null, 'ES7130871', '', '1', '', '2017-12-15 10:39:14', '1', '2017-12-15 10:39:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('186', 'FSEQ1513306831535', null, '133', 'SF75A', '', 'WS9140071S', '', null, '', '', '', null, '0', null, '2014-0851', '', '1', '', '2017-12-15 11:00:31', '1', '2017-12-15 11:00:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('187', 'FSEQ1513306906931', null, '122', 'SA132W-8', '', 'HSA130048', '', null, '', '', '', null, '0', null, 'ES9130441', '', '1', '', '2017-12-15 11:01:46', '1', '2017-12-15 11:01:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('188', 'FSEQ1513306958675', null, '122', 'SA132W-8', '', 'HSA130047', '', null, '', '', '', null, '0', null, 'ES9130384', '', '1', '', '2017-12-15 11:02:38', '1', '2017-12-15 11:02:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('189', 'FSEQ1513307018618', null, '122', 'SA132W-8', '', 'HSA130050', '', null, '', '', '', null, '0', null, 'ES9130385', '', '1', '', '2017-12-15 11:03:38', '1', '2017-12-15 11:03:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('190', 'FSEQ1513307077746', null, '122', 'SA132W-8', '', 'HSA130049', '', null, '', '', '', null, '0', null, 'ES9130383', '', '1', '', '2017-12-15 11:04:37', '1', '2017-12-15 11:04:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('191', 'FSEQ1513307814980', null, '134', 'SFV37A-8', '', 'SS3150180', '', null, '', '', '', null, '0', null, 'ES1150075', '', '1', '', '2017-12-15 11:16:54', '1', '2017-12-15 11:16:54', '0', '');
INSERT INTO `tb_equipment` VALUES ('192', 'FSEQ1513307884772', null, '134', 'SFV37A-8', '', 'SS1150451', '', null, '', '', '', null, '0', null, 'ES2150332', '', '1', '', '2017-12-15 11:18:04', '1', '2017-12-15 11:18:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('193', 'FSEQ1513308105102', null, '135', 'SA250A-10-10K', '', 'SS7130370B', '', null, '', '', '', null, '0', null, 'ES7130423', '', '1', '', '2017-12-15 11:21:45', '1', '2017-12-15 11:21:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('194', 'FSEQ1513308177773', null, '135', 'SL75A', '', 'WS5140038S', '', null, '', '', '', null, '0', null, 'ES3140665', '', '1', '', '2017-12-15 11:22:57', '1', '2017-12-15 11:22:57', '0', '');
INSERT INTO `tb_equipment` VALUES ('195', 'FSEQ1513308246125', null, '135', 'SA250A-10-10K', '', 'SS7130369B', '', null, '', '', '', null, '0', null, 'ES1130422', '', '1', '  ', '2017-12-15 11:24:06', '1', '2017-12-15 11:24:29', '0', '');
INSERT INTO `tb_equipment` VALUES ('196', 'FSEQ1513308333919', null, '135', 'SA250A-10-10K', '', 'SS7130370B', '', null, '', '', '', null, '0', null, 'ES7130423', '', '1', '', '2017-12-15 11:25:33', '1', '2017-12-15 11:25:33', '0', '');
INSERT INTO `tb_equipment` VALUES ('197', 'FSEQ1513308398795', null, '135', 'SL75A', '', 'WS5140038S', '', null, '', '', '', null, '0', null, 'ES3140665', '', '1', '', '2017-12-15 11:26:38', '1', '2017-12-15 11:26:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('198', 'FSEQ1513308502781', null, '135', 'SA250A-10-10K', '', 'SS7130369B', '', null, '', '', '', null, '0', null, 'ES1130422', '', '1', '', '2017-12-15 11:28:22', '1', '2017-12-15 11:28:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('199', 'FSEQ1513308728947', null, '136', 'SA75A-10', '', 'SS8140493', '', null, '', '', '', null, '0', null, 'ES81400545', '', '1', '', '2017-12-15 11:32:08', '1', '2017-12-15 11:32:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('200', 'FSEQ1513308794796', null, '136', 'SA75A-10', '', 'SS8140375', '', null, '', '', '', null, '0', null, 'ES8140181', '', '1', '', '2017-12-15 11:33:14', '1', '2017-12-15 11:33:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('201', 'FSEQ1513309064275', null, '137', 'SA08A-8', '', 'SS9140334', '', null, '', '', '', null, '0', null, 'ES8140156', '', '1', '', '2017-12-15 11:37:44', '1', '2017-12-15 11:37:44', '0', '');
INSERT INTO `tb_equipment` VALUES ('202', 'FSEQ1513309114625', null, '137', 'SA08A-8', '', 'SSB140134', '', null, '', '', '', null, '0', null, 'ES9140373', '', '1', '', '2017-12-15 11:38:34', '1', '2017-12-15 11:38:34', '0', '');
INSERT INTO `tb_equipment` VALUES ('203', 'FSEQ1513309513273', null, '138', 'SA18A-8', '', 'SS7140423', '', null, '', '', '', null, '0', null, 'ES7140271', '', '1', '', '2017-12-15 11:45:13', '1', '2017-12-15 11:45:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('204', 'FSEQ1513309845703', null, '139', 'SA250A-10-6KV/10KV', '', 'BSB140012', '', null, '', '', '', null, '0', null, 'ESB140037', '', '1', '', '2017-12-15 11:50:45', '1', '2017-12-15 11:50:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('205', 'FSEQ1513309902752', null, '139', 'SA250A', '', 'BSB140014', '', null, '', '', '', null, '0', null, 'ESB140194', '', '1', '', '2017-12-15 11:51:42', '1', '2017-12-15 11:51:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('206', 'FSEQ1513309985708', null, '139', 'SA250A-10-6KV/10KV', '', 'BSB140015', '', null, '', '', '', null, '0', null, 'ESB140327', '', '1', '', '2017-12-15 11:53:05', '1', '2017-12-15 11:53:05', '0', '');
INSERT INTO `tb_equipment` VALUES ('207', 'FSEQ1513310081865', null, '139', 'SA250A-10-6KV/10KV', '', 'BSB140017', '', null, '', '', '', null, '0', null, 'ESB140325', '', '1', '', '2017-12-15 11:54:41', '1', '2017-12-15 11:54:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('208', 'FSEQ1513310138390', null, '139', 'SA250A-10-6KV/10KV', '', 'BSB140016', '', null, '', '', '', null, '0', null, 'ESB140175', '', '1', '', '2017-12-15 11:55:38', '1', '2017-12-15 11:55:38', '1', '');
INSERT INTO `tb_equipment` VALUES ('209', 'FSEQ1513310220101', null, '139', 'SA250A-10-6KV/10KV', '', 'BSB140018', '', null, '', '', '', null, '0', null, 'ESB140038', '', '1', '', '2017-12-15 11:57:00', '1', '2017-12-15 11:57:00', '1', '');
INSERT INTO `tb_equipment` VALUES ('210', 'FSEQ1513310511420', null, '140', 'SA250', '', 'BSB140016', '', null, '', '', '', null, '0', null, 'ESB140195', '', '1', '', '2017-12-15 12:01:51', '1', '2017-12-15 12:01:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('211', 'FSEQ1513310600626', null, '140', 'SA250A-10-6KV/10KV', '', 'BSB140018', '', null, '', '', '', null, '0', null, 'ESB140038', '', '1', '', '2017-12-15 12:03:20', '1', '2017-12-15 12:03:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('212', 'FSEQ1513310658188', null, '140', 'SA250A-10-6KV/10KV', '', 'BSB140013', '', null, '', '', '', null, '0', null, 'ESB140396', '', '1', '', '2017-12-15 12:04:18', '1', '2017-12-15 12:04:18', '0', '');
INSERT INTO `tb_equipment` VALUES ('213', 'FSEQ1513310746221', null, '140', 'SA250A-10-6KV/10KV', '', 'BSB140019', '', null, '', '', '', null, '0', null, 'ES9130155', '', '1', '', '2017-12-15 12:05:46', '1', '2017-12-15 12:05:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('214', 'FSEQ1513310826585', null, '135', 'SA120A', '', 'BS5140134', '', null, '', '', '', null, '0', null, 'ES2140691', '', '1', '', '2017-12-15 12:07:06', '1', '2017-12-15 12:07:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('215', 'FSEQ1513310872241', null, '135', 'SA120A', '', 'BS5140135', '', null, '', '', '', null, '0', null, 'ES2140692', '', '1', '', '2017-12-15 12:07:52', '1', '2017-12-15 12:07:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('216', 'FSEQ1513312679091', null, '141', 'SA200W', '', 'HS6140207', '', null, '', '', '', null, '0', null, 'ES5140355', '', '1', '', '2017-12-15 12:37:59', '1', '2017-12-15 12:37:59', '1', '');
INSERT INTO `tb_equipment` VALUES ('217', 'FSEQ1513313114784', null, '142', 'SA11AF', '', 'SS7140602', '', null, '', '', '', null, '0', null, 'ES7140542', '', '1', '', '2017-12-15 12:45:14', '1', '2017-12-15 12:45:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('218', 'FSEQ1513313159386', null, '142', 'SA08AF', '', 'SS7140301', '', null, '', '', '', null, '0', null, 'ES7140162', '', '1', '', '2017-12-15 12:45:59', '1', '2017-12-15 12:45:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('219', 'FSEQ1513313621505', null, '143', 'SA132A', '', 'BS8140229', '', null, '', '', '', null, '0', null, 'FS7140065', '', '1', '', '2017-12-15 12:53:41', '1', '2017-12-15 12:53:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('220', 'FSEQ1513313893980', null, '144', 'SA11AT-12', '', 'SSA140148', '', null, '', '', '', null, '0', null, '14U732', '', '1', '', '2017-12-15 12:58:13', '1', '2017-12-15 12:58:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('221', 'FSEQ1513313947009', null, '144', 'SA11AT-12', '', 'SSA140147', '', null, '', '', '', null, '0', null, '14U726', '', '1', '', '2017-12-15 12:59:07', '1', '2017-12-15 12:59:07', '0', '');
INSERT INTO `tb_equipment` VALUES ('222', 'FSEQ1513314037149', null, '67', 'SA250W-8-6K', '', 'SS4140645', '', null, '', '', '', null, '0', null, 'ES4140677', '', '1', '', '2017-12-15 13:00:37', '1', '2017-12-15 13:00:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('223', 'FSEQ1513314289374', null, '145', 'SA315W', '', 'BS6140004', '', null, '', '', '', null, '0', null, 'ES6140435', '', '1', '', '2017-12-15 13:04:49', '1', '2017-12-15 13:04:49', '0', '');
INSERT INTO `tb_equipment` VALUES ('224', 'FSEQ1513314484300', null, '146', 'SF22A-7', '', 'SS4140447', '', null, '', '', '', null, '0', null, 'ES4140287', '', '1', '', '2017-12-15 13:08:04', '1', '2017-12-15 13:08:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('225', 'FSEQ1513314525713', null, '146', 'SF22A-7', '', 'SS4140478', '', null, '', '', '', null, '0', null, 'ES4140199', '', '1', '', '2017-12-15 13:08:45', '1', '2017-12-15 13:08:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('226', 'FSEQ1513314755906', null, '147', 'SA11AF', '', 'SS7130427', '', null, '', '', '', null, '0', null, 'ES7130458', '', '1', '', '2017-12-15 13:12:35', '1', '2017-12-15 13:12:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('227', 'FSEQ1513315080824', null, '148', 'SA37A-8', '', 'SS6140592', '', null, '', '', '', null, '0', null, 'ES6140896', '', '1', '', '2017-12-15 13:18:00', '1', '2017-12-15 13:18:00', '0', '');
INSERT INTO `tb_equipment` VALUES ('228', 'FSEQ1513315251464', null, '130', 'SF18-8', '', 'SS4140186', '', null, '', '', '', null, '0', null, '没有主机号', '', '1', '', '2017-12-15 13:20:51', '1', '2017-12-15 13:20:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('229', 'FSEQ1513315640679', null, '149', 'SA60A', '', 'ES4110030S', '', null, '', '', '', null, '0', null, 'ES2110684F', '', '1', '', '2017-12-15 13:27:20', '1', '2017-12-15 13:27:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('230', 'FSEQ1513315855919', null, '145', 'SA220W', '', 'BSC120042', '', null, '', '', '', null, '0', null, 'ESB120617', '', '1', '  ', '2017-12-15 13:30:55', '1', '2017-12-15 13:32:53', '0', '');
INSERT INTO `tb_equipment` VALUES ('231', 'FSEQ1513316037429', null, '145', 'SA220W', '', 'BSC120043', '', null, '', '', '', null, '0', null, 'ESC120145', '', '1', '', '2017-12-15 13:33:57', '1', '2017-12-15 13:33:57', '0', '');
INSERT INTO `tb_equipment` VALUES ('232', 'FSEQ1513316083805', null, '145', 'SA120W', '', 'BSA120011', '', null, '', '', '', null, '0', null, 'ES8113513', '', '1', '', '2017-12-15 13:34:43', '1', '2017-12-15 13:34:43', '0', '');
INSERT INTO `tb_equipment` VALUES ('233', 'FSEQ1513316125343', null, '145', 'SA55A', '', 'SS5140525', '', null, '', '', '', null, '0', null, 'ES5140955', '', '1', '', '2017-12-15 13:35:25', '1', '2017-12-15 13:35:25', '0', '');
INSERT INTO `tb_equipment` VALUES ('234', 'FSEQ1513316200999', null, '145', 'SA55A', '', 'BS5140524', '', null, '', '', '', null, '0', null, 'ES5140954', '', '1', '', '2017-12-15 13:36:41', '1', '2017-12-15 13:36:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('235', 'FSEQ1513316299322', null, '68', 'SL75A', '', 'WS3140048S', '', null, '', '', '', null, '0', null, 'ES3140663', '', '1', '', '2017-12-15 13:38:19', '1', '2017-12-15 13:38:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('236', 'FSEQ1513316526194', null, '68', 'SL75A', '', 'WS3140047S', '', null, '', '', '', null, '0', null, 'ES2140067', '', '1', '', '2017-12-15 13:42:06', '1', '2017-12-15 13:42:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('237', 'FSEQ1513316659450', null, '139', 'SM5185W', '', 'HMB130005', '', null, '', '', '', null, '0', null, 'ESA130406', '', '1', '', '2017-12-15 13:44:19', '1', '2017-12-15 13:44:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('238', 'FSEQ1513316701467', null, '139', 'SM5185W', '', 'HMB130006', '', null, '', '', '', null, '0', null, 'ESA130398', '', '1', '', '2017-12-15 13:45:01', '1', '2017-12-15 13:45:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('239', 'FSEQ1513316917557', null, '144', 'SA75A-7', '', 'SSC130140', '', null, '', '', '', null, '0', null, 'ESB130777', '', '1', '', '2017-12-15 13:48:37', '1', '2017-12-15 13:48:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('240', 'FSEQ1513317116338', null, '150', 'SAC132A', '', 'HM1140202', '', null, '', '', '', null, '0', null, 'ESB130368', '', '1', '', '2017-12-15 13:51:56', '1', '2017-12-15 13:51:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('241', 'FSEQ1513317360331', null, '151', 'SA75W-8', '', 'SS7130702', '', null, '', '', '', null, '0', null, 'ES7130742', '', '1', '', '2017-12-15 13:56:00', '1', '2017-12-15 13:56:00', '0', '');
INSERT INTO `tb_equipment` VALUES ('242', 'FSEQ1513317398129', null, '151', 'SA75W-8', '', 'SS7130381', '', null, '', '', '', null, '0', null, 'ES6130130', '', '1', '', '2017-12-15 13:56:38', '1', '2017-12-15 13:56:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('243', 'FSEQ1513317603978', null, '152', 'SA37A-8', '', 'SS9130386', '', null, '', '', '', null, '0', null, 'ES9130456', '', '1', '', '2017-12-15 14:00:03', '1', '2017-12-15 14:00:03', '0', '');
INSERT INTO `tb_equipment` VALUES ('244', 'FSEQ1513317727930', null, '60', 'ZW375W-7', '', 'SZ9130100B', '', null, '', '', '', null, '0', null, '8W3', '', '1', '', '2017-12-15 14:02:07', '1', '2017-12-15 14:02:07', '0', '');
INSERT INTO `tb_equipment` VALUES ('245', 'FSEQ1513317830353', null, '60', 'ZW375W-7', '', 'SZ8130111B', '', null, '', '', '', null, '0', null, '8W4', '', '1', '', '2017-12-15 14:03:50', '1', '2017-12-15 14:03:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('246', 'FSEQ1513317878530', null, '60', 'ZW375W-7', '', 'SZ8130108B', '', null, '', '', '', null, '0', null, '7W3', '', '1', '', '2017-12-15 14:04:38', '1', '2017-12-15 14:04:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('247', 'FSEQ1513317931717', null, '60', 'ZW375W-7', '', 'SZ8130110B', '', null, '', '', '', null, '0', null, '8W6', '', '1', '', '2017-12-15 14:05:31', '1', '2017-12-15 14:05:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('248', 'FSEQ1513318024612', null, '60', 'ZW375W-8', '', 'SZA130106B', '', null, '', '', '', null, '0', null, '8W15', '', '1', '', '2017-12-15 14:07:04', '1', '2017-12-15 14:07:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('249', 'FSEQ1513318082181', null, '60', 'ZW155A-8', '', 'SZ9130102', '', null, '', '', '', null, '0', null, '7W7E', '', '1', '', '2017-12-15 14:08:02', '1', '2017-12-15 14:08:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('250', 'FSEQ1513318292435', null, '153', 'SA08AF-7', '', 'SSB130206', '', null, '', '', '', null, '0', null, 'ESB130210', '', '1', '', '2017-12-15 14:11:32', '1', '2017-12-15 14:11:32', '0', '');
INSERT INTO `tb_equipment` VALUES ('251', 'FSEQ1513318344109', null, '153', 'SA08AF-7', '', 'SSB130450', '', null, '', '', '', null, '0', null, 'ESB130164', '', '1', '', '2017-12-15 14:12:24', '1', '2017-12-15 14:12:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('252', 'FSEQ1513318392763', null, '153', 'SA08AF-7', '', 'SSB130451', '', null, '', '', '', null, '0', null, 'ESB130349', '', '1', '', '2017-12-15 14:13:12', '1', '2017-12-15 14:13:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('253', 'FSEQ1513318433690', null, '153', 'SA08AF-7', '', 'SSB130207', '', null, '', '', '', null, '0', null, 'ES8130805', '', '1', '', '2017-12-15 14:13:53', '1', '2017-12-15 14:13:53', '0', '');
INSERT INTO `tb_equipment` VALUES ('254', 'FSEQ1513319697269', null, '150', 'MLGF25.5/8-160G', '', 'HM9110015', '', null, '', '', '', null, '0', null, 'ES8112159', '', '1', '', '2017-12-15 14:34:57', '1', '2017-12-15 14:34:57', '0', '');
INSERT INTO `tb_equipment` VALUES ('255', 'FSEQ1513319962928', null, '154', 'SA250A-6K', '', 'SZ9B3061', '', null, '', '', '', null, '0', null, 'S313301', '', '1', '', '2017-12-15 14:39:22', '1', '2017-12-15 14:39:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('256', 'FSEQ1513320019691', null, '154', 'SA250A-6K', '', 'SZ9B3057', '', null, '', '', '', null, '0', null, 'S313297', '', '1', '', '2017-12-15 14:40:19', '1', '2017-12-15 14:40:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('257', 'FSEQ1513320289807', null, '155', 'SA-22', '', 'SZ853019', '', null, '', '', '', null, '0', null, 'S834091', '', '1', '', '2017-12-15 14:44:49', '1', '2017-12-15 14:44:49', '0', '');
INSERT INTO `tb_equipment` VALUES ('258', 'FSEQ1513322583422', null, '156', 'SA250A', '', 'P810143H', '', null, '', '', '', null, '0', null, 'S314666', '', '1', '', '2017-12-15 15:23:03', '1', '2017-12-15 15:23:03', '0', '');
INSERT INTO `tb_equipment` VALUES ('259', 'FSEQ1513322625570', null, '156', 'SA250A', '', 'P704211', '', null, '', '', '', null, '0', null, 'S254940', '', '1', '', '2017-12-15 15:23:45', '1', '2017-12-15 15:23:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('260', 'FSEQ1513322901293', null, '157', 'SA250A', '', 'ES8111617', '', null, '', '', '', null, '0', null, 'BS8110100', '', '1', '', '2017-12-15 15:28:21', '1', '2017-12-15 15:28:21', '0', '');
INSERT INTO `tb_equipment` VALUES ('261', 'FSEQ1513323785060', null, '158', 'SA30A', '', 'SS610078BE', '', null, '', '', '', null, '0', null, 'ES51000313E', '', '1', '', '2017-12-15 15:43:05', '1', '2017-12-15 15:43:05', '0', '');
INSERT INTO `tb_equipment` VALUES ('262', 'FSEQ1513323870796', null, '159', 'SA30A', '', 'SS610077BE', '', null, '', '', '', null, '0', null, 'BS1100516E', '', '1', '', '2017-12-15 15:44:30', '1', '2017-12-15 15:44:30', '0', '');
INSERT INTO `tb_equipment` VALUES ('263', 'FSEQ1513323965154', null, '160', 'SA30A', '', 'SS610079BE', '', null, '', '', '', null, '0', null, 'ES5100510', '', '1', '  ', '2017-12-15 15:46:05', '1', '2017-12-15 15:47:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('264', 'FSEQ1513324018805', null, '161', 'SA30A', '', 'SS610076BF', '', null, '', '', '', null, '0', null, 'ES510051E', '', '1', '  ', '2017-12-15 15:46:58', '1', '2017-12-15 15:47:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('265', 'FSEQ1513324180280', null, '162', 'SA120A', '', 'BS8110061', '', null, '', '', '', null, '0', null, 'ES7111473', '', '1', '', '2017-12-15 15:49:40', '1', '2017-12-15 15:49:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('266', 'FSEQ1513324250089', null, '163', 'SA250A', '', 'SS411159B', '', null, '', '', '', null, '0', null, 'S348813', '', '1', '', '2017-12-15 15:50:50', '1', '2017-12-15 15:50:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('267', 'FSEQ1513324335720', null, '163', 'SA250', '', 'SS7110133B', '', null, '', '', '', null, '0', null, 'S352351', '', '1', '', '2017-12-15 15:52:15', '1', '2017-12-15 15:52:15', '0', '');
INSERT INTO `tb_equipment` VALUES ('268', 'FSEQ1513325134369', null, '164', 'SA90A', '', 'ZS81100271B', '', null, '', '', '', null, '0', null, 'ES811859', '', '1', '', '2017-12-15 16:05:34', '1', '2017-12-15 16:05:34', '0', '');
INSERT INTO `tb_equipment` VALUES ('269', 'FSEQ1513325184396', null, '164', 'SA90A', '', 'ZS81100273B', '', null, '', '', '', null, '0', null, 'ES8111980', '', '1', '', '2017-12-15 16:06:24', '1', '2017-12-15 16:06:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('270', 'FSEQ1513325764445', null, '164', 'SM222A', '', 'HM8110016', '', null, '', '', '', null, '0', null, 'ES511659D', '', '1', '', '2017-12-15 16:16:04', '1', '2017-12-15 16:16:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('271', 'FSEQ1513326127869', null, '165', 'SA250W', '', 'SS111097B', '', null, '', '', '', null, '0', null, 'S339666', '', '1', '', '2017-12-15 16:22:07', '1', '2017-12-15 16:22:07', '0', '');
INSERT INTO `tb_equipment` VALUES ('272', 'FSEQ1513927880002', null, '166', 'SF37A', '', 'SF11035052', '', null, '', '', '', null, '0', null, 'CY100010', '', '1', '', '2017-12-22 15:31:20', '1', '2017-12-22 15:31:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('273', 'FSEQ1514162066880', null, '166', 'SF37A', '', 'SF1103053', '', null, '', '', '', null, '0', null, 'CY100811', '', '1', '', '2017-12-25 08:34:26', '1', '2017-12-25 08:34:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('274', 'FSEQ1514162706847', null, '167', 'SA250A', '', 'P704211', '', null, '', '', '', null, '0', null, 'S254940', '', '1', '', '2017-12-25 08:45:06', '1', '2017-12-25 08:45:06', '1', '');
INSERT INTO `tb_equipment` VALUES ('275', 'FSEQ1514163128878', null, '168', 'SA-75A', '', 'ZS2110053B', '', null, '', '', '', null, '0', null, 'ES1111210G', '', '1', '', '2017-12-25 08:52:08', '1', '2017-12-25 08:52:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('276', 'FSEQ1514163429237', null, '168', 'SA75A撬装', '', 'HS4110039Q', '', null, '', '', '', null, '0', null, '单子上没写', '', '1', '', '2017-12-25 08:57:09', '1', '2017-12-25 08:57:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('277', 'FSEQ1514163494704', null, '168', 'SA-75A', '', 'ZS2110052B', '', null, '', '', '', null, '0', null, 'ES1111224G', '', '1', '', '2017-12-25 08:58:14', '1', '2017-12-25 08:58:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('278', 'FSEQ1514163590519', null, '168', 'SA75A', '', 'ZS2110053B', '', null, '', '', '', null, '0', null, 'ES1111210G', '', '1', '', '2017-12-25 08:59:50', '1', '2017-12-25 08:59:50', '1', '');
INSERT INTO `tb_equipment` VALUES ('279', 'FSEQ1514164022199', null, '164', 'SM490A', '', 'HM6110018', '', null, '', '', '', null, '0', null, 'ES5111567G', '', '1', '', '2017-12-25 09:07:02', '1', '2017-12-25 09:07:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('280', 'FSEQ1514164106634', null, '164', 'SM490A', '', 'HM6110012', '', null, '', '', '', null, '0', null, 'ES5111569G', '', '1', '', '2017-12-25 09:08:26', '1', '2017-12-25 09:08:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('281', 'FSEQ1514164174152', null, '164', 'SM490A', '', 'HM5110029', '', null, '', '', '', null, '0', null, 'ES4111492G', '', '1', '', '2017-12-25 09:09:34', '1', '2017-12-25 09:09:34', '0', '');
INSERT INTO `tb_equipment` VALUES ('282', 'FSEQ1514164477113', null, '169', 'SA22A', '', 'SZ943014P', '', null, '', '', '', null, '0', null, 'S935764', '', '1', '', '2017-12-25 09:14:37', '1', '2017-12-25 09:14:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('283', 'FSEQ1514164736719', null, '170', 'SAV37A', '', 'SS6110014', '', null, '', '', '', null, '0', null, 'ES5111528E', '', '1', '  ', '2017-12-25 09:18:56', '1', '2017-12-25 09:20:58', '0', '');
INSERT INTO `tb_equipment` VALUES ('284', 'FSEQ1514165352847', null, '149', 'SA-60A', '', 'ZS4110033S', '', null, '', '', '', null, '0', null, 'ES2110683F', '', '1', '', '2017-12-25 09:29:12', '1', '2017-12-25 09:29:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('285', 'FSEQ1514165561386', null, '171', 'SA75A-10', '', 'SA911063', '', null, '', '', '', null, '0', null, 'S978043', '', '1', '', '2017-12-25 09:32:41', '1', '2017-12-25 09:32:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('286', 'FSEQ1514165622748', null, '171', 'SA75A-10', '', 'SA911064', '', null, '', '', '', null, '0', null, 'S978044', '', '1', '', '2017-12-25 09:33:42', '1', '2017-12-25 09:33:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('287', 'FSEQ1514166206503', null, '172', 'MGF7.2/7-45G', '', 'BM4110003', '', null, '', '', '', null, '0', null, 'ES5100366F', '', '1', '', '2017-12-25 09:43:26', '1', '2017-12-25 09:43:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('288', 'FSEQ1514166274914', null, '172', 'MGF9.6/8-55G', '', 'BM1110020', '', null, '', '', '', null, '0', null, 'ES1111161G', '', '1', '', '2017-12-25 09:44:34', '1', '2017-12-25 09:44:34', '0', '');
INSERT INTO `tb_equipment` VALUES ('289', 'FSEQ1514166486522', null, '173', 'SA220W', '', 'SS311118BL', '', null, '', '', '', null, '0', null, 'ES3110149V', '', '1', '', '2017-12-25 09:48:06', '1', '2017-12-25 09:48:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('290', 'FSEQ1514166542546', null, '173', 'SA220W', '', 'SS311095BL', '', null, '', '', '', null, '0', null, 'ES3110145V', '', '1', '', '2017-12-25 09:49:02', '1', '2017-12-25 09:49:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('291', 'FSEQ1514166645008', null, '164', 'SM490A', '', 'HM6110012', '', null, '', '', '', null, '0', null, 'ES5111569G', '', '1', '', '2017-12-25 09:50:45', '1', '2017-12-25 09:50:45', '1', '');
INSERT INTO `tb_equipment` VALUES ('292', 'FSEQ1514167139578', null, '174', 'SF55A', '', 'SF1104016', '', null, '', '', '', null, '0', null, '211-0348', '', '1', '', '2017-12-25 09:58:59', '1', '2017-12-25 09:58:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('293', 'FSEQ1514167256419', null, '164', 'SM490A', '', 'HM4110003', '', null, '', '', '', null, '0', null, 'ESA100960G', '', '1', '', '2017-12-25 10:00:56', '1', '2017-12-25 10:00:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('294', 'FSEQ1514167618396', null, '175', 'SA08AR', '', 'SS211169B', '', null, '', '', '', null, '0', null, 'SC139039-1', '', '1', '', '2017-12-25 10:06:58', '1', '2017-12-25 10:06:58', '0', '');
INSERT INTO `tb_equipment` VALUES ('295', 'FSEQ1514167821793', null, '176', 'SA-250A', '', 'SZ7B3024', '', null, '', '', '', null, '0', null, 'S268069', '', '1', '', '2017-12-25 10:10:21', '1', '2017-12-25 10:10:21', '0', '');
INSERT INTO `tb_equipment` VALUES ('296', 'FSEQ1514167870652', null, '176', 'SA-250A', '', 'SZ7B3025', '', null, '', '', '', null, '0', null, 'S268797', '', '1', '', '2017-12-25 10:11:10', '1', '2017-12-25 10:11:10', '0', '');
INSERT INTO `tb_equipment` VALUES ('297', 'FSEQ1514168053662', null, '177', 'SA-90A', '', 'ZSC100098B', '', null, '', '', '', null, '0', null, 'ESC101075G', '', '1', '', '2017-12-25 10:14:13', '1', '2017-12-25 10:14:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('298', 'FSEQ1514168109253', null, '177', 'SA-90A', '', 'LSC100107B', '', null, '', '', '', null, '0', null, 'ESC101084G', '', '1', '', '2017-12-25 10:15:09', '1', '2017-12-25 10:15:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('299', 'FSEQ1514168442578', null, '178', 'SA22A-T', '', 'P901027H', '', null, '', '', '', null, '0', null, 'S835006', '', '1', '', '2017-12-25 10:20:42', '1', '2017-12-25 10:20:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('300', 'FSEQ1514168497934', null, '178', 'SA22A-T', '', 'P901029H', '', null, '', '', '', null, '0', null, 'S834987', '', '1', '', '2017-12-25 10:21:37', '1', '2017-12-25 10:21:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('301', 'FSEQ1514168568478', null, '178', 'SA-22A-T', '', 'P901028H', '', null, '', '', '', null, '0', null, 'S835027', '', '1', '', '2017-12-25 10:22:48', '1', '2017-12-25 10:22:48', '0', '');
INSERT INTO `tb_equipment` VALUES ('302', 'FSEQ1514168701060', null, '80', 'SA11AR-T', '', 'SZ953045', '', null, '', '', '', null, '0', null, '69606', '', '1', '', '2017-12-25 10:25:01', '1', '2017-12-25 10:25:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('303', 'FSEQ1514168763786', null, '80', 'SA11AR-T', '', 'SZ953046', '', null, '', '', '', null, '0', null, '69603', '', '1', '', '2017-12-25 10:26:03', '1', '2017-12-25 10:26:03', '0', '');
INSERT INTO `tb_equipment` VALUES ('304', 'FSEQ1514168815218', null, '80', 'SA11AR-T', '', 'SZ953052', '', null, '', '', '', null, '0', null, '69605', '', '1', '', '2017-12-25 10:26:55', '1', '2017-12-25 10:26:55', '0', '');
INSERT INTO `tb_equipment` VALUES ('305', 'FSEQ1514169022763', null, '179', 'SA-75A', '', 'ZSB10022B', '', null, '', '', '', null, '0', null, 'ES8100730G', '', '1', '', '2017-12-25 10:30:22', '1', '2017-12-25 10:30:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('306', 'FSEQ1514169079269', null, '179', 'SA-75A', '', 'ZS9100116B', '', null, '', '', '', null, '0', null, 'ES8100742G', '', '1', '', '2017-12-25 10:31:19', '1', '2017-12-25 10:31:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('307', 'FSEQ1514169172188', null, '179', 'SA-37A', '', 'SS910258BF', '', null, '', '', '', null, '0', null, 'ES9100815E', '', '1', '', '2017-12-25 10:32:52', '1', '2017-12-25 10:32:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('308', 'FSEQ1514169226842', null, '179', 'SA-37A', '', 'SS10011BF', '', null, '', '', '', null, '0', null, 'ES9100814E', '', '1', '', '2017-12-25 10:33:46', '1', '2017-12-25 10:33:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('309', 'FSEQ1514169297437', null, '179', 'SA-37A', '', 'BS110022S', '', null, '', '', '', null, '0', null, 'ES1100023E', '', '1', '', '2017-12-25 10:34:57', '1', '2017-12-25 10:34:57', '0', '');
INSERT INTO `tb_equipment` VALUES ('310', 'FSEQ1514169353185', null, '179', 'SA-37A', '', 'BS110021S', '', null, '', '', '', null, '0', null, 'ES1100026E', '', '1', '', '2017-12-25 10:35:53', '1', '2017-12-25 10:35:53', '0', '');
INSERT INTO `tb_equipment` VALUES ('311', 'FSEQ1514170286603', null, '180', 'SA22A', '', 'SS111222B', '', null, '', '', '', null, '0', null, 'ES11113200', '', '1', '', '2017-12-25 10:51:26', '1', '2017-12-25 10:51:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('312', 'FSEQ1514170706932', null, '181', 'SA250A-6K-T', '', 'SZ9B3068', '', null, '', '', '', null, '0', null, 'S313339', '', '1', '', '2017-12-25 10:58:26', '1', '2017-12-25 10:58:26', '0', '');
INSERT INTO `tb_equipment` VALUES ('313', 'FSEQ1514170818360', null, '181', 'SA250A-6K-T', '', 'SZ9B3067', '', null, '', '', '', null, '0', null, 'S313292', '', '1', '', '2017-12-25 11:00:18', '1', '2017-12-25 11:00:18', '0', '');
INSERT INTO `tb_equipment` VALUES ('314', 'FSEQ1514170863766', null, '181', 'SA250A-6K-T', '', 'SZ9B3065', '', null, '', '', '', null, '0', null, 'S313295', '', '1', '', '2017-12-25 11:01:03', '1', '2017-12-25 11:01:03', '0', '');
INSERT INTO `tb_equipment` VALUES ('315', 'FSEQ1514171108248', null, '182', 'PDSG750', '', 'A1103103165', '', null, '', '', '', null, '0', null, '335783', '', '1', '', '2017-12-25 11:05:08', '1', '2017-12-25 11:05:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('316', 'FSEQ1514171359639', null, '183', 'PDSF830S', '', '89-4B10421', '', null, '', '', '', null, '0', null, '89-4B10421', '', '1', '', '2017-12-25 11:09:19', '1', '2017-12-25 11:09:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('317', 'FSEQ1514171672562', null, '184', 'SF45A', '', 'SF0908055', '', null, '', '', '', null, '0', null, 'EU45', '', '1', '', '2017-12-25 11:14:32', '1', '2017-12-25 11:14:32', '0', '');
INSERT INTO `tb_equipment` VALUES ('318', 'FSEQ1514171724435', null, '184', 'SF45A', '', 'SF0908024', '', null, '', '', '', null, '0', null, 'EU43', '', '1', '', '2017-12-25 11:15:24', '1', '2017-12-25 11:15:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('319', 'FSEQ1514171921504', null, '185', 'SA75A-10', '', 'BS1100062Z', '', null, '', '', '', null, '0', null, 'S977946', '', '1', '', '2017-12-25 11:18:41', '1', '2017-12-25 11:18:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('320', 'FSEQ1514171985352', null, '185', 'SA75A-10', '', 'BS1100061Z', '', null, '', '', '', null, '0', null, 'S978198', '', '1', '', '2017-12-25 11:19:45', '1', '2017-12-25 11:19:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('321', 'FSEQ1514172031224', null, '185', 'SA75A-10', '', 'BS1100060Z', '', null, '', '', '', null, '0', null, 'S977940', '', '1', '', '2017-12-25 11:20:31', '1', '2017-12-25 11:20:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('322', 'FSEQ1514172437351', null, '186', 'SA250A-10K', '', 'SSB70087B', '', null, '', '', '', null, '0', null, 'S332549', '', '1', '', '2017-12-25 11:27:17', '1', '2017-12-25 11:27:17', '0', '');
INSERT INTO `tb_equipment` VALUES ('323', 'FSEQ1514173870385', null, '187', 'SM455A', '', 'HM2100009', '', null, '', '', '', null, '0', null, 'FS11000229', '', '1', '', '2017-12-25 11:51:10', '1', '2017-12-25 11:51:10', '0', '');
INSERT INTO `tb_equipment` VALUES ('324', 'FSEQ1514174041705', null, '188', 'SA-185A', '', 'HS6080061', '', null, '', '', '', null, '0', null, 'S8927253', '', '1', '', '2017-12-25 11:54:01', '1', '2017-12-25 11:54:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('325', 'FSEQ1514174293922', null, '189', 'SA-250W', '', 'SZ9A3015', '', null, '', '', '', null, '0', null, 'S311706', '', '1', '', '2017-12-25 11:58:13', '1', '2017-12-25 11:58:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('326', 'FSEQ1514174365605', null, '189', 'SA-250W', '', 'SZ9A3026', '', null, '', '', '', null, '0', null, 'S311514', '', '1', '  ', '2017-12-25 11:59:25', '1', '2017-12-25 11:59:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('327', 'FSEQ1514174443886', null, '189', 'SA-250W', '', 'SZ90A3019', '', null, '', '', '', null, '0', null, 'S311615', '', '1', '', '2017-12-25 12:00:43', '1', '2017-12-25 12:00:43', '0', '');
INSERT INTO `tb_equipment` VALUES ('328', 'FSEQ1514174530339', null, '189', 'SA-250W', '', 'SZ9A3017', '', null, '', '', '', null, '0', null, 'S311623', '', '1', '', '2017-12-25 12:02:10', '1', '2017-12-25 12:02:10', '0', '');
INSERT INTO `tb_equipment` VALUES ('329', 'FSEQ1514174897215', null, '190', 'SF-15A', '', 'SF0907031', '', null, '', '', '', null, '0', null, '2009-1165', '', '1', '', '2017-12-25 12:08:17', '1', '2017-12-25 12:08:17', '0', '');
INSERT INTO `tb_equipment` VALUES ('330', 'FSEQ1514174948332', null, '190', 'SF-15A', '', 'SF0907032', '', null, '', '', '', null, '0', null, '2009-866', '', '1', '', '2017-12-25 12:09:08', '1', '2017-12-25 12:09:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('331', 'FSEQ1514175012458', null, '190', 'SF-15A', '', 'SF0906031', '', null, '', '', '', null, '0', null, '2009-993', '', '1', '', '2017-12-25 12:10:12', '1', '2017-12-25 12:10:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('332', 'FSEQ1514178279306', null, '191', 'SF22L', '', 'SF1006118', '', null, '', '', '', null, '0', null, 'ES6100319M', '', '1', '', '2017-12-25 13:04:39', '1', '2017-12-25 13:04:39', '0', '');
INSERT INTO `tb_equipment` VALUES ('333', 'FSEQ1514178472102', null, '127', 'SF37A', '', 'SF1007024', '', null, '', '', '', null, '0', null, 'ES7100246N', '', '1', '', '2017-12-25 13:07:52', '1', '2017-12-25 13:07:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('334', 'FSEQ1514178942131', null, '192', 'SA-90A', '', 'ES7100116B', '', null, '', '', '', null, '0', null, 'ES61004726', '', '1', '', '2017-12-25 13:15:42', '1', '2017-12-25 13:15:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('335', 'FSEQ1514179032723', null, '192', 'SF37A', '', 'SF1006132', '', null, '', '', '', null, '0', null, 'ES4100117N', '', '1', '', '2017-12-25 13:17:12', '1', '2017-12-25 13:17:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('336', 'FSEQ1514179148586', null, '192', 'SA90A', '', 'ES7100120B', '', null, '', '', '', null, '0', null, 'ES61004696', '', '1', '', '2017-12-25 13:19:08', '1', '2017-12-25 13:19:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('337', 'FSEQ1514179696544', null, '193', 'SA200W-10KW', '', 'HS6100012', '', null, '', '', '', null, '0', null, 'ES5100223J', '', '1', '', '2017-12-25 13:28:16', '1', '2017-12-25 13:28:16', '0', '');
INSERT INTO `tb_equipment` VALUES ('338', 'FSEQ1514179756296', null, '193', 'SA200W-10KW', '', 'HS6100013', '', null, '', '', '', null, '0', null, 'ES5100223J', '', '1', '', '2017-12-25 13:29:16', '1', '2017-12-25 13:29:16', '0', '');
INSERT INTO `tb_equipment` VALUES ('339', 'FSEQ1514180070800', null, '194', 'SF22L', '', 'SF1006129', '', null, '', '', '', null, '0', null, 'ES6100324M', '', '1', '', '2017-12-25 13:34:30', '1', '2017-12-25 13:34:30', '0', '');
INSERT INTO `tb_equipment` VALUES ('340', 'FSEQ1514181123756', null, '195', 'G-75A', '', 'ZSB100032', '', null, '', '', '', null, '0', null, '91226', '', '1', '', '2017-12-25 13:52:03', '1', '2017-12-25 13:52:03', '0', '');
INSERT INTO `tb_equipment` VALUES ('341', 'FSEQ1514181371588', null, '196', 'PDSF830S', '', '89-4B10424', '', null, '', '', '', null, '0', null, '89-4B10424', '', '1', '', '2017-12-25 13:56:11', '1', '2017-12-25 13:56:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('342', 'FSEQ1514181544001', null, '197', 'SA75A', '', 'ES8100066B', '', null, '', '', '', null, '0', null, 'S7100619G', '', '1', '', '2017-12-25 13:59:04', '1', '2017-12-25 13:59:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('343', 'FSEQ1514189029728', null, '198', 'SF22L', '', 'SF1002075', '', null, '', '', '', null, '0', null, 'ES210047M', '', '1', '', '2017-12-25 16:03:49', '1', '2017-12-25 16:03:49', '0', '');
INSERT INTO `tb_equipment` VALUES ('344', 'FSEQ1514189265514', null, '199', 'SA250W', '', 'SS810214B', '', null, '', '', '', null, '0', null, 'S328508', '', '1', '', '2017-12-25 16:07:45', '1', '2017-12-25 16:07:45', '0', '');
INSERT INTO `tb_equipment` VALUES ('345', 'FSEQ1514189346389', null, '199', 'SA250W', '', 'SS810215B', '', null, '', '', '', null, '0', null, 'S328514', '', '1', '', '2017-12-25 16:09:06', '1', '2017-12-25 16:09:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('346', 'FSEQ1514189576992', null, '200', 'SAV90A-T', '', 'BS110016S', '', null, '', '', '', null, '0', null, 'ES1100012G', '', '1', '', '2017-12-25 16:12:56', '1', '2017-12-25 16:12:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('347', 'FSEQ1514189628004', null, '200', 'SAV90A-T', '', 'BS110012S', '', null, '', '', '', null, '0', null, 'ES1100011G', '', '1', '', '2017-12-25 16:13:48', '1', '2017-12-25 16:13:48', '0', '');
INSERT INTO `tb_equipment` VALUES ('348', 'FSEQ1514189911270', null, '201', 'SA120A-10', '', 'BSB100108', '', null, '', '', '', null, '0', null, 'ESB100818H', '', '1', '', '2017-12-25 16:18:31', '1', '2017-12-25 16:18:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('349', 'FSEQ1514189961938', null, '201', 'SA120A-10', '', 'BSB100107', '', null, '', '', '', null, '0', null, 'ESB100831H', '', '1', '', '2017-12-25 16:19:21', '1', '2017-12-25 16:19:21', '0', '');
INSERT INTO `tb_equipment` VALUES ('350', 'FSEQ1514190240980', null, '202', 'SM5160W', '', 'HM9100043', '', null, '', '', '', null, '0', null, 'ES8100441J', '', '1', '', '2017-12-25 16:24:00', '1', '2017-12-25 16:24:00', '0', '');
INSERT INTO `tb_equipment` VALUES ('351', 'FSEQ1514190296009', null, '202', 'SM5160W', '', 'HM9100044', '', null, '', '', '', null, '0', null, 'ES8100435J', '', '1', '', '2017-12-25 16:24:56', '1', '2017-12-25 16:24:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('352', 'FSEQ1514190481688', null, '203', 'SF15L', '', 'SF1008064', '', null, '', '', '', null, '0', null, 'ES8100453', '', '1', '', '2017-12-25 16:28:01', '1', '2017-12-25 16:28:01', '0', '');
INSERT INTO `tb_equipment` VALUES ('353', 'FSEQ1514190817469', null, '204', 'SA120A', '', 'BSA100068', '', null, '', '', '', null, '0', null, 'ESA100719H', '', '1', '', '2017-12-25 16:33:37', '1', '2017-12-25 16:33:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('354', 'FSEQ1514248635625', null, '164', 'SM457A', '', 'HM8100016', '', null, '', '', '', null, '0', null, 'ES7100582G', '', '1', '  ', '2017-12-26 08:37:15', '1', '2017-12-26 08:41:54', '0', '');
INSERT INTO `tb_equipment` VALUES ('355', 'FSEQ1514248715457', null, '164', 'SM475A', '', 'HM8100017', '', null, '', '', '', null, '0', null, 'ES7100586G', '', '1', '  ', '2017-12-26 08:38:35', '1', '2017-12-26 08:42:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('356', 'FSEQ1514248806630', null, '164', 'SM475A', '', 'HM8100018', '', null, '', '', '', null, '0', null, 'ES2100585G', '', '1', '', '2017-12-26 08:40:06', '1', '2017-12-26 08:40:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('357', 'FSEQ1514248880942', null, '164', 'SM475A', '', 'HM8100010', '', null, '', '', '', null, '0', null, 'ES7100564G', '', '1', '  ', '2017-12-26 08:41:20', '1', '2017-12-26 08:42:32', '0', '');
INSERT INTO `tb_equipment` VALUES ('358', 'FSEQ1514249180703', null, '205', 'SA-185A', '', 'HS6100014', '', null, '', '', '', null, '0', null, 'ES5100238J', '', '1', '', '2017-12-26 08:46:20', '1', '2017-12-26 08:46:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('359', 'FSEQ1514249229674', null, '205', 'SA-185A', '', 'HS6100014', '', null, '', '', '', null, '0', null, 'ES3100141J', '', '1', '', '2017-12-26 08:47:09', '1', '2017-12-26 08:47:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('360', 'FSEQ1514249414578', null, '206', 'SF37A', '', 'SF1007069', '', null, '', '', '', null, '0', null, 'ES7100259', '', '1', '', '2017-12-26 08:50:14', '1', '2017-12-26 08:50:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('361', 'FSEQ1514249511308', null, '180', 'SA22A', '', 'SS810054HP', '', null, '', '', '', null, '0', null, 'ES71007830', '', '1', '', '2017-12-26 08:51:51', '1', '2017-12-26 08:51:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('362', 'FSEQ1514249598054', null, '180', 'SA22A', '', 'SS810009HP', '', null, '', '', '', null, '0', null, 'ES8100816D', '', '1', '', '2017-12-26 08:53:18', '1', '2017-12-26 08:53:18', '0', '');
INSERT INTO `tb_equipment` VALUES ('363', 'FSEQ1514249777330', null, '207', 'SA250A', '', 'SS710055B', '', null, '', '', '', null, '0', null, 'S326850', '', '1', '', '2017-12-26 08:56:17', '1', '2017-12-26 08:56:17', '0', '');
INSERT INTO `tb_equipment` VALUES ('364', 'FSEQ1514249863085', null, '59', 'SA-22A', '', 'SZ873122', '', null, '', '', '', null, '0', null, 'S834555', '', '1', '', '2017-12-26 08:57:43', '1', '2017-12-26 08:57:43', '0', '');
INSERT INTO `tb_equipment` VALUES ('365', 'FSEQ1514249956517', null, '144', 'SA08A', '', 'SS710081B', '', null, '', '', '', null, '0', null, 'SC122425', '', '1', '', '2017-12-26 08:59:16', '1', '2017-12-26 08:59:16', '0', '');
INSERT INTO `tb_equipment` VALUES ('366', 'FSEQ1514250143597', null, '208', 'SA-250A', '', 'BS210035S', '', null, '', '', '', null, '0', null, 'S815570', '', '1', '', '2017-12-26 09:02:23', '1', '2017-12-26 09:02:23', '0', '');
INSERT INTO `tb_equipment` VALUES ('367', 'FSEQ1514250382623', null, '209', 'SA-120A', '', 'BS4100023', '', null, '', '', '', null, '0', null, 'ES3100181H', '', '1', '', '2017-12-26 09:06:22', '1', '2017-12-26 09:06:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('368', 'FSEQ1514250560565', null, '210', 'SA-75A', '', 'BS4100014Z', '', null, '', '', '', null, '0', null, 'ES3100181G', '', '1', '', '2017-12-26 09:09:20', '1', '2017-12-26 09:09:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('369', 'FSEQ1514250818920', null, '210', 'SA-75A', '', 'BS4100013Z', '', null, '', '', '', null, '0', null, 'ES3100140G', '', '1', '', '2017-12-26 09:13:38', '1', '2017-12-26 09:13:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('370', 'FSEQ1514251029553', null, '211', 'SA-75A', '', 'BS4100011Z', '', null, '', '', '', null, '0', null, 'ES3100183G', '', '1', '', '2017-12-26 09:17:09', '1', '2017-12-26 09:17:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('371', 'FSEQ1514251074854', null, '211', 'SA-75A', '', 'BS4100012Z', '', null, '', '', '', null, '0', null, 'ES1100052G', '', '1', '', '2017-12-26 09:17:54', '1', '2017-12-26 09:17:54', '0', '');
INSERT INTO `tb_equipment` VALUES ('372', 'FSEQ1514251529633', null, '212', 'SA120A', '', 'BS4100088', '', null, '', '', '', null, '0', null, 'ES4100233H', '', '1', '', '2017-12-26 09:25:29', '1', '2017-12-26 09:25:29', '0', '');
INSERT INTO `tb_equipment` VALUES ('373', 'FSEQ1514251812968', null, '213', 'SA-60A-8', '', 'SA908080', '', null, '', '', '', null, '0', null, 'S9A3167', '', '1', '', '2017-12-26 09:30:12', '1', '2017-12-26 09:30:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('374', 'FSEQ1514252115121', null, '214', 'SF18A', '', 'SF1006043', '', null, '', '', '', null, '0', null, '1048', '', '1', '', '2017-12-26 09:35:15', '1', '2017-12-26 09:35:15', '0', '');
INSERT INTO `tb_equipment` VALUES ('375', 'FSEQ1514252462384', null, '215', 'MGF13/7-75G', '', 'BM7090020', '', null, '', '', '', null, '0', null, 'S977784', '', '1', '', '2017-12-26 09:41:02', '1', '2017-12-26 09:41:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('376', 'FSEQ1514252967613', null, '216', 'SA90', '', 'ZS610005313', '', null, '', '', '', null, '0', null, 'ES51004196', '', '1', '', '2017-12-26 09:49:27', '1', '2017-12-26 09:49:27', '0', '');
INSERT INTO `tb_equipment` VALUES ('377', 'FSEQ1514253012317', null, '216', 'SA90', '', 'ZS610005410', '', null, '', '', '', null, '0', null, 'ES51003916', '', '1', '', '2017-12-26 09:50:12', '1', '2017-12-26 09:50:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('378', 'FSEQ1514253084302', null, '208', 'SA-250A', '', 'BS2100355', '', null, '', '', '', null, '0', null, 'S815570', '', '1', '', '2017-12-26 09:51:24', '1', '2017-12-26 09:51:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('379', 'FSEQ1514253428437', null, '217', 'SA22A', '', 'SS610174HP', '', null, '', '', '', null, '0', null, 'ES610056817', '', '1', '', '2017-12-26 09:57:08', '1', '2017-12-26 09:57:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('380', 'FSEQ1514253698393', null, '218', 'SA-250W', '', 'SZ9B3052', '', null, '', '', '', null, '0', null, 'S313343', '', '1', '', '2017-12-26 10:01:38', '1', '2017-12-26 10:01:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('381', 'FSEQ1514253972572', null, '219', 'SF22A', '', 'SF1007001', '', null, '', '', '', null, '0', null, 'ES610032M', '', '1', '', '2017-12-26 10:06:12', '1', '2017-12-26 10:06:12', '0', '');
INSERT INTO `tb_equipment` VALUES ('382', 'FSEQ1514255091296', null, '220', 'SA18A', '', 'SS410108HP', '', null, '', '', '', null, '0', null, 'ES41003040', '', '1', '', '2017-12-26 10:24:51', '1', '2017-12-26 10:24:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('383', 'FSEQ1514255159403', null, '220', 'SA30A', '', 'SS510065HP', '', null, '', '', '', null, '0', null, 'ES5100336E', '', '1', '', '2017-12-26 10:25:59', '1', '2017-12-26 10:25:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('384', 'FSEQ1514255249155', null, '164', 'SM475A', '', 'HM8100011', '', null, '', '', '', null, '0', null, 'ES6100495G', '', '1', '', '2017-12-26 10:27:29', '1', '2017-12-26 10:27:29', '0', '');
INSERT INTO `tb_equipment` VALUES ('385', 'FSEQ1514255327831', null, '172', 'SM475A', '', 'BM7090026', '', null, '', '', '', null, '0', null, 'S877290', '', '1', '', '2017-12-26 10:28:47', '1', '2017-12-26 10:28:47', '0', '');
INSERT INTO `tb_equipment` VALUES ('386', 'FSEQ1514255864973', null, '172', 'SM455A', '', 'BM7090031', '', null, '', '', '', null, '0', null, 'P0803382', '', '1', '', '2017-12-26 10:37:44', '1', '2017-12-26 10:37:44', '0', '');
INSERT INTO `tb_equipment` VALUES ('387', 'FSEQ1514508144171', null, '221', 'SA220W', '', 'SZ853070', '', null, '', '', '', null, '0', null, 'S280909', '', '1', '', '2017-12-29 08:42:24', '1', '2017-12-29 08:42:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('388', 'FSEQ1514508204975', null, '221', 'SA220W', '', 'SZ853057', '', null, '', '', '', null, '0', null, 'S279343', '', '1', '', '2017-12-29 08:43:24', '1', '2017-12-29 08:43:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('389', 'FSEQ1514508251207', null, '221', 'SA220W', '', 'SZ853058', '', null, '', '', '', null, '0', null, 'S279344', '', '1', '', '2017-12-29 08:44:11', '1', '2017-12-29 08:44:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('390', 'FSEQ1514508299384', null, '221', 'SA220W', '', 'SZ853054', '', null, '', '', '', null, '0', null, 'S280880', '', '1', '', '2017-12-29 08:44:59', '1', '2017-12-29 08:44:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('391', 'FSEQ1514508390124', null, '221', 'SA250A', '', 'SZ853039', '', null, '', '', '', null, '0', null, 'S280874(新S315568)', '', '1', '', '2017-12-29 08:46:30', '1', '2017-12-29 08:46:30', '0', '');
INSERT INTO `tb_equipment` VALUES ('392', 'FSEQ1514508896231', null, '222', 'SF18A', '', 'SF0909048', '', null, '', '', '', null, '0', null, '2009-1557', '', '1', '', '2017-12-29 08:54:56', '1', '2017-12-29 08:54:56', '0', '');
INSERT INTO `tb_equipment` VALUES ('393', 'FSEQ1514509311285', null, '223', 'SA-60W', '', 'SA707034', '', null, '', '', '', null, '0', null, '无', '', '1', '', '2017-12-29 09:01:51', '1', '2017-12-29 09:01:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('394', 'FSEQ1514509879089', null, '224', 'SA-75A', '', 'SA605095', '', null, '', '', '', null, '0', null, 'S674607', '', '1', '', '2017-12-29 09:11:19', '1', '2017-12-29 09:11:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('395', 'FSEQ1514510063640', null, '225', 'SA-230', '', 'ZZ063024', '', null, '', '', '', null, '0', null, 'S021592', '', '1', '', '2017-12-29 09:14:23', '1', '2017-12-29 09:14:23', '0', '');
INSERT INTO `tb_equipment` VALUES ('396', 'FSEQ1514510142919', null, '225', 'SA-15A-0.85', '', 'SZ3A3063', '', null, '', '', '', null, '0', null, 'S326430', '', '1', '', '2017-12-29 09:15:42', '1', '2017-12-29 09:15:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('397', 'FSEQ1514510202558', null, '225', 'SA-220A', '', '97B004', '', null, '', '', '', null, '0', null, '723799', '', '1', '', '2017-12-29 09:16:42', '1', '2017-12-29 09:16:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('398', 'FSEQ1514510436139', null, '226', 'SA-18A(10.5K)Ⅱ', '', 'SZ8C3044', '', null, '', '', '', null, '0', null, 'S935031', '', '1', '', '2017-12-29 09:20:36', '1', '2017-12-29 09:20:36', '0', '');
INSERT INTO `tb_equipment` VALUES ('399', 'FSEQ1514510502314', null, '226', 'SA-18A(10.5K)Ⅱ', '', 'SZ8C3045', '', null, '', '', '', null, '0', null, 'S935040', '', '1', '', '2017-12-29 09:21:42', '1', '2017-12-29 09:21:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('400', 'FSEQ1514510586457', null, '201', 'SA-120W', '', 'BS9090030', '', null, '', '', '', null, '0', null, 'S904093', '', '1', '', '2017-12-29 09:23:06', '1', '2017-12-29 09:23:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('401', 'FSEQ1514510662780', null, '201', 'SM457A', '', 'BM7090020', '', null, '', '', '', null, '0', null, 'S977784', '', '1', '', '2017-12-29 09:24:22', '1', '2017-12-29 09:24:22', '0', '');
INSERT INTO `tb_equipment` VALUES ('402', 'FSEQ1514511379539', null, '227', 'SA-250A', '', 'SZ963035', '', null, '', '', '', null, '0', null, 'S385579', '', '1', '', '2017-12-29 09:36:19', '1', '2017-12-29 09:36:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('403', 'FSEQ1514511580422', null, '228', 'SA120A-8.5', '', 'BS6090015', '', null, '', '', '', null, '0', null, 'S9C3894', '', '1', '', '2017-12-29 09:39:40', '1', '2017-12-29 09:39:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('404', 'FSEQ1514511715126', null, '229', 'SA-120A', '', 'BS7090005', '', null, '', '', '', null, '0', null, 'S903963', '', '1', '', '2017-12-29 09:41:55', '1', '2017-12-29 09:41:55', '0', '');
INSERT INTO `tb_equipment` VALUES ('405', 'FSEQ1514511871622', null, '230', 'SF37A', '', 'P806011E', '', null, '', '', '', null, '0', null, '397', '', '1', '', '2017-12-29 09:44:31', '1', '2017-12-29 09:44:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('406', 'FSEQ1514511909642', null, '230', 'SA90A-7', '', 'SA905047', '', null, '', '', '', null, '0', null, 'S977579', '', '1', '', '2017-12-29 09:45:09', '1', '2017-12-29 09:45:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('407', 'FSEQ1514512022841', null, '162', 'SA-250A-6K-T', '', 'SZ8C3059S', '', null, '', '', '', null, '0', null, 'S297107', '', '1', '', '2017-12-29 09:47:02', '1', '2017-12-29 09:47:02', '0', '');
INSERT INTO `tb_equipment` VALUES ('408', 'FSEQ1514512154989', null, '172', 'MLGF96/8-55G', '', 'BM2090002', '', null, '', '', '', null, '0', null, 'S977509', '', '1', '', '2017-12-29 09:49:14', '1', '2017-12-29 09:49:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('409', 'FSEQ1514512259132', null, '183', 'PDSF830S', '', '819-4B10336', '', null, '', '', '', null, '0', null, '无', '', '1', '', '2017-12-29 09:50:59', '1', '2017-12-29 09:50:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('410', 'FSEQ1514512333032', null, '206', 'SF37A', '', 'SF08110015', '', null, '', '', '', null, '0', null, '2008-387', '', '1', '', '2017-12-29 09:52:13', '1', '2017-12-29 09:52:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('411', 'FSEQ1514512426720', null, '172', 'SA-250A-6K', '', 'SZ873165', '', null, '', '', '', null, '0', null, 'S277738', '', '1', '', '2017-12-29 09:53:46', '1', '2017-12-29 09:53:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('412', 'FSEQ1514512480268', null, '227', 'SA-120A', '', 'BS5090034', '', null, '', '', '', null, '0', null, 'S9C3827', '', '1', '', '2017-12-29 09:54:40', '1', '2017-12-29 09:54:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('413', 'FSEQ1514512549278', null, '186', 'SA-250A-10', '', 'SZ863059', '', null, '', '', '', null, '0', null, 'SSU005R', '', '1', '', '2017-12-29 09:55:49', '1', '2017-12-29 09:55:49', '0', '');
INSERT INTO `tb_equipment` VALUES ('414', 'FSEQ1514512809947', null, '231', 'SA-75A', '', 'SA810013', '', null, '', '', '', null, '0', null, 'S877305', '', '1', '', '2017-12-29 10:00:09', '1', '2017-12-29 10:00:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('415', 'FSEQ1514512966662', null, '232', 'SA-90A', '', 'SA802058', '', null, '', '', '', null, '0', null, 'S776484', '', '1', '', '2017-12-29 10:02:46', '1', '2017-12-29 10:02:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('416', 'FSEQ1514513029234', null, '232', 'SA-90A', '', 'SA804084', '', null, '', '', '', null, '0', null, 'S876704', '', '1', '', '2017-12-29 10:03:49', '1', '2017-12-29 10:03:49', '0', '');
INSERT INTO `tb_equipment` VALUES ('417', 'FSEQ1514513092157', null, '232', 'SAV-90A', '', 'P805113E', '', null, '', '', '', null, '0', null, 'S876774', '', '1', '', '2017-12-29 10:04:52', '1', '2017-12-29 10:04:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('418', 'FSEQ1514513617572', null, '233', 'SA60A-7', '', 'SA808117', '', null, '', '', '', null, '0', null, 'S8A2781', '', '1', '', '2017-12-29 10:13:37', '1', '2017-12-29 10:13:37', '0', '');
INSERT INTO `tb_equipment` VALUES ('419', 'FSEQ1514513654629', null, '233', 'SA60A-8', '', 'SA808156', '', null, '', '', '', null, '0', null, 'S8A2765', '', '1', '', '2017-12-29 10:14:14', '1', '2017-12-29 10:14:14', '0', '');
INSERT INTO `tb_equipment` VALUES ('420', 'FSEQ1514514270843', null, '234', 'PDSF830S', '', '89-4B10268', '', null, '', '', '', null, '0', null, '无', '', '1', '', '2017-12-29 10:24:30', '1', '2017-12-29 10:24:30', '0', '');
INSERT INTO `tb_equipment` VALUES ('421', 'FSEQ1514514376241', null, '108', 'SA250A-6K', '', 'P807215', '', null, '', '', '', null, '0', null, '无', '', '1', '', '2017-12-29 10:26:16', '1', '2017-12-29 10:26:16', '0', '');
INSERT INTO `tb_equipment` VALUES ('422', 'FSEQ1514514438913', null, '180', 'SA-15A', '', 'SZ8C3015', '', null, '', '', '', null, '0', null, 'S834956', '', '1', '  ', '2017-12-29 10:27:18', '1', '2017-12-29 10:33:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('423', 'FSEQ1514514482265', null, '180', 'SA-15A', '', 'SZ8C3014', '', null, '', '', '', null, '0', null, 'S834944', '', '1', '  ', '2017-12-29 10:28:02', '1', '2017-12-29 10:33:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('424', 'FSEQ1514514640266', null, '235', 'SA-22A', '', 'SZ773067', '', null, '', '', '', null, '0', null, 'S732785', '', '1', '  ', '2017-12-29 10:30:40', '1', '2017-12-29 10:35:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('425', 'FSEQ1514514694395', null, '172', 'SM345', '', 'MB7080022', '', null, '', '', '', null, '0', null, 'S8498183', '', '1', '  ', '2017-12-29 10:31:34', '1', '2017-12-29 10:32:15', '0', '');
INSERT INTO `tb_equipment` VALUES ('426', 'FSEQ1514514886495', null, '180', 'SA22A', '', 'SZ873110', '', null, '', '', '', null, '0', null, 'S834600', '', '1', '', '2017-12-29 10:34:46', '1', '2017-12-29 10:34:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('427', 'FSEQ1514515130175', null, '236', 'SA-75A-10', '', 'SA507053', '', null, '', '', '', null, '0', null, 'S573938', '', '1', '', '2017-12-29 10:38:50', '1', '2017-12-29 10:38:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('428', 'FSEQ1514515192432', null, '236', 'SA-75A-10', '', 'SA507054', '', null, '', '', '', null, '0', null, 'S573989', '', '1', '', '2017-12-29 10:39:52', '1', '2017-12-29 10:39:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('429', 'FSEQ1514515295595', null, '224', 'SA-75A', '', 'SA605096', '', null, '', '', '', null, '0', null, 'S674632', '', '1', '', '2017-12-29 10:41:35', '1', '2017-12-29 10:41:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('430', 'FSEQ1514515384643', null, '211', 'SA-55A-10', '', 'SA603106', '', null, '', '', '', null, '0', null, 'ES51003456', '', '1', '', '2017-12-29 10:43:04', '1', '2017-12-29 10:43:04', '0', '');
INSERT INTO `tb_equipment` VALUES ('431', 'FSEQ1514515626311', null, '237', 'SA-60A', '', 'BS2100086Z', '', null, '', '', '', null, '0', null, 'ES210079F', '', '1', '  ', '2017-12-29 10:47:06', '1', '2017-12-29 10:48:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('432', 'FSEQ1514515721664', null, '237', 'SA-60A', '', 'BS2100022Z', '', null, '', '', '', null, '0', null, 'ES1100051F', '', '1', '', '2017-12-29 10:48:41', '1', '2017-12-29 10:48:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('433', 'FSEQ1514515925458', null, '238', 'MLGF13/7-75G', '', 'BM1100014', '', null, '', '', '', null, '0', null, 'S978220', '', '1', '', '2017-12-29 10:52:05', '1', '2017-12-29 10:52:05', '0', '');
INSERT INTO `tb_equipment` VALUES ('434', 'FSEQ1514516368469', null, '221', 'SA250W-6K', '', 'SZ853043', '', null, '', '', '', null, '0', null, 'S277757', '', '1', '', '2017-12-29 10:59:28', '1', '2017-12-29 10:59:28', '0', '');
INSERT INTO `tb_equipment` VALUES ('435', 'FSEQ1514516441409', null, '221', 'SA250W', '', 'SZ853039', '', null, '', '', '', null, '0', null, 'S280874', '', '1', '', '2017-12-29 11:00:41', '1', '2017-12-29 11:00:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('436', 'FSEQ1514516491244', null, '221', 'SA250W-6K', '', 'SZ853040', '', null, '', '', '', null, '0', null, 'S280910', '', '1', '', '2017-12-29 11:01:31', '1', '2017-12-29 11:01:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('437', 'FSEQ1514516559229', null, '221', 'SA-250W', '', 'SZ853078', '', null, '', '', '', null, '0', null, 'S280870', '', '1', '', '2017-12-29 11:02:39', '1', '2017-12-29 11:02:39', '0', '');
INSERT INTO `tb_equipment` VALUES ('438', 'FSEQ1514516620566', null, '221', 'SA250W-6K', '', 'SZ853036', '', null, '', '', '', null, '0', null, 'S280908', '', '1', '', '2017-12-29 11:03:40', '1', '2017-12-29 11:03:40', '0', '');
INSERT INTO `tb_equipment` VALUES ('439', 'FSEQ1514516688972', null, '209', 'SA-120A', '', 'BS4100023', '', null, '', '', '', null, '0', null, 'ES3100181H', '', '1', '', '2017-12-29 11:04:48', '1', '2017-12-29 11:04:48', '0', '');
INSERT INTO `tb_equipment` VALUES ('440', 'FSEQ1514516778543', null, '181', 'SA250W全套', '', 'SZ973088', '', null, '', '', '', null, '0', null, 'S307874', '', '1', '', '2017-12-29 11:06:18', '1', '2017-12-29 11:06:18', '0', '');
INSERT INTO `tb_equipment` VALUES ('441', 'FSEQ1514516948855', null, '181', 'SA250A-6K-T', '', 'SZ973081', '', null, '', '', '', null, '0', null, 'S308024', '', '1', '', '2017-12-29 11:09:08', '1', '2017-12-29 11:09:08', '0', '');
INSERT INTO `tb_equipment` VALUES ('442', 'FSEQ1514517111623', null, '180', 'SF22L', '', 'SF0912079', '', null, '', '', '', null, '0', null, '670', '', '1', '', '2017-12-29 11:11:51', '1', '2017-12-29 11:11:51', '0', '');
INSERT INTO `tb_equipment` VALUES ('443', 'FSEQ1514517158359', null, '180', 'SF22L', '', 'SF0912080', '', null, '', '', '', null, '0', null, '679', '', '1', '', '2017-12-29 11:12:38', '1', '2017-12-29 11:12:38', '0', '');
INSERT INTO `tb_equipment` VALUES ('444', 'FSEQ1514517343794', null, '239', 'SA-250A-T', '', 'BS210017S', '', null, '', '', '', null, '0', null, 'S313344', '', '1', '', '2017-12-29 11:15:43', '1', '2017-12-29 11:15:43', '0', '');
INSERT INTO `tb_equipment` VALUES ('445', 'FSEQ1514517461858', null, '64', 'MLG20/8-132', '', 'BMB090010', '', null, '', '', '', null, '0', null, 'S9C4225', '', '1', '', '2017-12-29 11:17:41', '1', '2017-12-29 11:17:41', '0', '');
INSERT INTO `tb_equipment` VALUES ('446', 'FSEQ1514517519154', null, '64', 'MLG20/8-132', '', 'BMB090009', '', null, '', '', '', null, '0', null, 'S9C4213', '', '1', '', '2017-12-29 11:18:39', '1', '2017-12-29 11:18:39', '0', '');
INSERT INTO `tb_equipment` VALUES ('447', 'FSEQ1514517733660', null, '240', 'PDS400S', '', '0911000139', '', null, '', '', '', null, '0', null, '329765', '', '1', '', '2017-12-29 11:22:13', '1', '2017-12-29 11:22:13', '0', '');
INSERT INTO `tb_equipment` VALUES ('448', 'FSEQ1514518044515', null, '241', 'SA250W全套', '', 'SZ973081', '', null, '', '', '', null, '0', null, 'S308024', '', '1', '', '2017-12-29 11:27:24', '1', '2017-12-29 11:27:24', '0', '');
INSERT INTO `tb_equipment` VALUES ('449', 'FSEQ1514518271556', null, '242', 'SA-132A', '', 'BSC090052', '', null, '', '', '', null, '0', null, 'S993651', '', '1', '', '2017-12-29 11:31:11', '1', '2017-12-29 11:31:11', '0', '');
INSERT INTO `tb_equipment` VALUES ('450', 'FSEQ1514518542879', null, '243', 'SF37L', '', 'SF0910076', '', null, '', '', '', null, '0', null, 'S93A092', '', '1', '', '2017-12-29 11:35:42', '1', '2017-12-29 11:35:42', '0', '');
INSERT INTO `tb_equipment` VALUES ('451', 'FSEQ1514518732172', null, '244', 'PDS400整机', '', '091100039', '', null, '', '', '', null, '0', null, '329765', '', '1', '', '2017-12-29 11:38:52', '1', '2017-12-29 11:38:52', '0', '');
INSERT INTO `tb_equipment` VALUES ('452', 'FSEQ1514518759841', null, '244', 'PDS400整机', '', '091100040', '', null, '', '', '', null, '0', null, '330125', '', '1', '', '2017-12-29 11:39:19', '1', '2017-12-29 11:39:19', '0', '');
INSERT INTO `tb_equipment` VALUES ('453', 'FSEQ1514518787156', null, '244', 'PDS400整机', '', '091100041', '', null, '', '', '', null, '0', null, '330162', '', '1', '', '2017-12-29 11:39:47', '1', '2017-12-29 11:39:47', '0', '');
INSERT INTO `tb_equipment` VALUES ('454', 'FSEQ1514518809874', null, '244', 'PDS400整机', '', '091100042', '', null, '', '', '', null, '0', null, '330177', '', '1', '', '2017-12-29 11:40:09', '1', '2017-12-29 11:40:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('455', 'FSEQ1514518906874', null, '240', 'PDS400S', '', '0911000142', '', null, '', '', '', null, '0', null, '330177', '', '1', '', '2017-12-29 11:41:46', '1', '2017-12-29 11:41:46', '0', '');
INSERT INTO `tb_equipment` VALUES ('456', 'FSEQ1514518951247', null, '240', 'PDS400S', '', '0911000141', '', null, '', '', '', null, '0', null, '330162', '', '1', '', '2017-12-29 11:42:31', '1', '2017-12-29 11:42:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('457', 'FSEQ1514519005227', null, '240', 'PDS400S', '', '0911000140', '', null, '', '', '', null, '0', null, '330125', '', '1', '  ', '2017-12-29 11:43:25', '1', '2017-12-29 11:44:31', '0', '');
INSERT INTO `tb_equipment` VALUES ('458', 'FSEQ1514519060437', null, '240', 'PDS400S', '', '0911000139', '', null, '', '', '', null, '0', null, '329765', '', '1', '', '2017-12-29 11:44:20', '1', '2017-12-29 11:44:20', '0', '');
INSERT INTO `tb_equipment` VALUES ('459', 'FSEQ1514519356354', null, '245', 'SA-185W', '', 'HS9090042', '', null, '', '', '', null, '0', null, 'S993482', '', '1', '', '2017-12-29 11:49:16', '1', '2017-12-29 11:49:16', '0', '');
INSERT INTO `tb_equipment` VALUES ('460', 'FSEQ1514519465947', null, '229', 'SA-250W', '', 'SZ993054', '', null, '', '', '', null, '0', null, 'S310152', '', '1', '', '2017-12-29 11:51:05', '1', '2017-12-29 11:51:05', '0', '');
INSERT INTO `tb_equipment` VALUES ('461', 'FSEQ1514519518667', null, '229', 'SA-250W', '', 'SZ993055', '', null, '', '', '', null, '0', null, 'S310150', '', '1', '', '2017-12-29 11:51:58', '1', '2017-12-29 11:51:58', '0', '');
INSERT INTO `tb_equipment` VALUES ('462', 'FSEQ1514519639437', null, '178', 'SA22A-T', '', 'P901027H', '', null, '', '', '', null, '0', null, 'S835006', '', '1', '', '2017-12-29 11:53:59', '1', '2017-12-29 11:53:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('463', 'FSEQ1514519699813', null, '178', 'SA22A-T', '', 'P901028H', '', null, '', '', '', null, '0', null, 'S835027', '', '1', '', '2017-12-29 11:54:59', '1', '2017-12-29 11:54:59', '0', '');
INSERT INTO `tb_equipment` VALUES ('464', 'FSEQ1514519760889', null, '178', 'SA22A-T', '', 'P901029H', '', null, '', '', '', null, '0', null, 'S834987', '', '1', '', '2017-12-29 11:56:00', '1', '2017-12-29 11:56:00', '0', '');
INSERT INTO `tb_equipment` VALUES ('465', 'FSEQ1514519946281', null, '246', 'SA-20W', '', 'ZZ043001', '', null, '', '', '', null, '0', null, '07A045', '', '1', '', '2017-12-29 11:59:06', '1', '2017-12-29 11:59:06', '0', '');
INSERT INTO `tb_equipment` VALUES ('466', 'FSEQ1514519990268', null, '246', 'SA-5175W', '', 'ZZ997003', '', null, '', '', '', null, '0', null, '790302', '', '1', '', '2017-12-29 11:59:50', '1', '2017-12-29 11:59:50', '0', '');
INSERT INTO `tb_equipment` VALUES ('467', 'FSEQ1514520178086', null, '247', 'SA-30A', '', 'SZ3A3029', '', null, '', '', '', null, '0', null, 'S343733', '', '1', '', '2017-12-29 12:02:58', '1', '2017-12-29 12:02:58', '0', '');
INSERT INTO `tb_equipment` VALUES ('468', 'FSEQ1514520215258', null, '247', 'SA-230A', '', 'ZZ933019', '', null, '', '', '', null, '0', null, 'S24462', '', '1', '', '2017-12-29 12:03:35', '1', '2017-12-29 12:03:35', '0', '');
INSERT INTO `tb_equipment` VALUES ('469', 'FSEQ1514520369070', null, '248', 'SA-475A', '', 'ZZ1A3003', '', null, '', '', '', null, '0', null, 'S171075', '', '1', '', '2017-12-29 12:06:09', '1', '2017-12-29 12:06:09', '0', '');
INSERT INTO `tb_equipment` VALUES ('470', 'FSEQ1514520405410', null, '248', 'SA-475A', '', 'ZZ1A3002', '', null, '', '', '', null, '0', null, 'S171115', '', '1', '', '2017-12-29 12:06:45', '1', '2017-12-29 12:06:45', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='配件表';

-- ----------------------------
-- Records of tb_part
-- ----------------------------
INSERT INTO `tb_part` VALUES ('1', 'test1', 'test1', '222222', '', '', '0', '1', '2017-07-18 17:23:37', '1', '2017-07-18 17:49:59', '1', null);
INSERT INTO `tb_part` VALUES ('2', '122', '工大磊磊', '222', '', '', '0', '1', '2017-07-18 21:50:36', '1', '2017-07-31 17:09:42', '1', null);
INSERT INTO `tb_part` VALUES ('3', '2100050232', '螺杆机专用高级冷却液', '1480', '', '20L/桶', '0', '1', '2017-07-31 17:11:35', '1', '2017-08-21 08:08:58', '1', null);
INSERT INTO `tb_part` VALUES ('4', '2100050233', '螺杆机专用高级冷却液205L', '14500', '', '205L/桶', '0', '1', '2017-07-31 17:13:01', null, null, '0', null);
INSERT INTO `tb_part` VALUES ('5', 'kkk', 'jjjjjjjjjjjjjjjjjjjj', '89', '', '', '0', '1', '2017-08-02 08:43:39', '1', '2017-08-02 22:02:16', '1', null);
INSERT INTO `tb_part` VALUES ('6', '1222', '222222', '6777.898999', '', '', '0', '1', '2017-08-03 06:00:37', '1', '2017-08-21 08:08:50', '1', null);
INSERT INTO `tb_part` VALUES ('7', '1223', '磊水1223', '333', '', '', '0', '1', '2017-08-03 06:01:27', '1', '2017-08-04 06:27:54', '1', null);
INSERT INTO `tb_part` VALUES ('8', '1224', '磊水1223', '3', '39', '', '0', '1', '2017-08-04 06:27:38', '1', '2017-08-04 06:27:50', '1', '39');
INSERT INTO `tb_part` VALUES ('9', '777', '蜂鸣器9', '0', '', '', '0', '1', '2017-08-04 06:31:48', '1', '2017-08-04 06:33:34', '1', null);
INSERT INTO `tb_part` VALUES ('10', '回骂', '水冷冰冰冰水水水水水水水水', '8999', '42', '', '0', '1', '2017-08-04 06:34:43', '1', '2017-08-21 08:08:47', '1', '42');
INSERT INTO `tb_part` VALUES ('11', 'xxxx12233', '底座轴承', '56', '52', '止 ', '0', '1', '2017-08-21 08:09:50', '1', '2017-08-21 08:10:08', '0', '52');
INSERT INTO `tb_part` VALUES ('12', 'Asdasd', 'Asdasd', '12', '69', '', '0', '1', '2017-08-27 22:55:34', '1', '2017-08-27 22:57:44', '1', '69');
INSERT INTO `tb_part` VALUES ('13', 'qwqw1', '1212322', '11111.113', '79,80,81', '2124', null, '1', '2017-08-27 22:57:24', '1', '2017-10-09 07:23:48', '0', '79,80,81');
INSERT INTO `tb_part` VALUES ('14', 'TAAD121212', '电机齿轮', '10', '82,83', '测试', '0', '1', '2017-10-09 22:21:27', null, null, '0', '82,83');
INSERT INTO `tb_part` VALUES ('15', 'Test20171010', '测试配件AAA', '10', '', '通天塔', '0', '1', '2017-10-10 07:18:02', null, null, '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='配件库存表';

-- ----------------------------
-- Records of tb_part_repertory
-- ----------------------------
INSERT INTO `tb_part_repertory` VALUES ('1', 'sdsfdfs', '2', '1', '10', '1', null, '1', '2017-07-30 12:27:21', '0');
INSERT INTO `tb_part_repertory` VALUES ('44', null, '22', '1', '0', '1', '2017-07-30 17:03:42', '1', '2017-07-30 17:38:53', '0');
INSERT INTO `tb_part_repertory` VALUES ('45', null, '23', '1', '91', '1', '2017-07-30 17:09:18', '1', '2017-08-03 06:03:44', '0');
INSERT INTO `tb_part_repertory` VALUES ('46', null, '21', '2', '0', '1', '2017-07-30 17:10:32', '1', '2017-07-30 17:43:15', '0');
INSERT INTO `tb_part_repertory` VALUES ('47', 'FSPR1501406449626', '12', '2', '0', '1', '2017-07-30 17:20:53', '1', '2017-07-30 17:36:38', '0');
INSERT INTO `tb_part_repertory` VALUES ('48', 'FSPR1501406732285', '21', '1', '32', '1', '2017-07-30 17:26:01', '1', '2017-07-30 17:57:14', '0');
INSERT INTO `tb_part_repertory` VALUES ('49', 'FSPR1501408642829', '14', '2', '150', '1', '2017-07-30 17:57:26', '1', '2017-10-09 22:23:07', '0');
INSERT INTO `tb_part_repertory` VALUES ('50', 'FSPR1501633286251', '4', '1', '3', '1', '2017-08-02 08:21:26', '1', '2017-08-28 00:14:46', '0');
INSERT INTO `tb_part_repertory` VALUES ('51', 'FSPR1501711467025', '7', '1', '0', '1', '2017-08-03 06:04:27', '1', '2017-08-04 06:34:19', '0');
INSERT INTO `tb_part_repertory` VALUES ('52', 'FSPR1501711915098', '7', '2', '0', '1', '2017-08-03 06:11:55', '1', '2017-08-04 06:34:15', '0');
INSERT INTO `tb_part_repertory` VALUES ('53', 'FSPR1501799564196', '9', '1', '0', '1', '2017-08-04 06:32:44', '1', '2017-08-04 06:33:53', '0');
INSERT INTO `tb_part_repertory` VALUES ('54', 'FSPR1501799701744', '10', '1', '0', '1', '2017-08-04 06:35:01', '1', '2017-08-21 08:02:46', '0');
INSERT INTO `tb_part_repertory` VALUES ('55', 'FSPR1503274228194', '11', '1', '372', '1', '2017-08-21 08:10:28', '1', '2017-09-24 11:54:47', '0');
INSERT INTO `tb_part_repertory` VALUES ('56', 'FSPR1503846191171', '13', '1', '99', '1', '2017-08-27 23:03:12', '1', '2017-08-29 19:49:46', '0');
INSERT INTO `tb_part_repertory` VALUES ('57', 'FSPR1503848554503', '11', '2', '0', '1', '2017-08-27 23:42:36', '1', '2017-08-27 23:42:36', '0');
INSERT INTO `tb_part_repertory` VALUES ('58', 'FSPR1507530149267', '14', '1', '190', '1', '2017-10-09 22:22:29', '1', '2017-10-10 07:15:33', '0');
INSERT INTO `tb_part_repertory` VALUES ('59', 'FSPR1507591209497', '15', '1', '10', '1', '2017-10-10 07:20:16', '1', '2017-10-10 07:33:35', '0');
INSERT INTO `tb_part_repertory` VALUES ('60', 'FSPR1507591272538', '15', '2', '1495', '1', '2017-10-10 07:21:18', '1', '2017-11-26 22:25:47', '0');

-- ----------------------------
-- Table structure for tb_part_repertory_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_part_repertory_record`;
CREATE TABLE `tb_part_repertory_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `code` varchar(32) DEFAULT NULL COMMENT '库存编码',
  `storage_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `repertory_type` tinyint(2) DEFAULT NULL COMMENT '出入库方式 1-入库 2-出库',
  `record_date` varchar(32) DEFAULT NULL COMMENT '操作时间,入库为入库时间 出库 为出库时间',
  `note` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 1-正常 2-撤回',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='出入库记录表';

-- ----------------------------
-- Records of tb_part_repertory_record
-- ----------------------------
INSERT INTO `tb_part_repertory_record` VALUES ('44', null, '2', '1', null, '123123', '1', '1', '2017-07-30 16:58:20', '1', '2017-07-30 16:58:20', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('45', null, '2', '1', null, '123123', '1', '1', '2017-07-30 16:59:48', '1', '2017-07-30 16:59:48', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('46', null, '1', '1', null, '12312', '2', '1', '2017-07-30 17:01:52', '1', '2017-08-03 06:03:44', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('47', null, '1', '1', null, '123123', '1', '1', '2017-07-30 17:03:40', '1', '2017-07-30 17:03:40', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('48', null, '1', '1', null, '123123', '1', '1', '2017-07-30 17:06:13', '1', '2017-07-30 17:06:13', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('49', null, '2', '1', null, '123123', '2', '1', '2017-07-30 17:10:25', '1', '2017-07-30 17:43:15', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('50', 'FSRR1501406197440', '1', '1', null, '123123', '2', '1', '2017-07-30 17:16:41', '1', '2017-07-30 17:38:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('51', 'FSRR1501406447044', '2', '1', null, '123123', '1', '1', '2017-07-30 17:20:50', '1', '2017-07-30 17:36:38', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('52', 'FSRR1501406700797', '1', '1', null, '12312', '1', '1', '2017-07-30 17:25:04', '1', '2017-07-30 17:25:04', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('53', 'FSRR1501408629832', '1', '1', null, '12312', '1', '1', '2017-07-30 17:57:13', '1', '2017-07-30 17:57:13', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('54', 'FSRR1501408642453', '2', '1', null, '12312', '2', '1', '2017-07-30 17:57:26', '1', '2017-08-04 06:34:01', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('55', 'FSRR1501633286192', '1', '1', null, '123123', '2', '1', '2017-08-02 08:21:26', '1', '2017-08-08 08:26:59', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('56', 'FSRR1501711467002', '1', '1', null, '', '2', '1', '2017-08-03 06:04:27', '1', '2017-08-03 06:06:52', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('57', 'FSRR1501711866022', '1', '1', null, '', '2', '1', '2017-08-03 06:11:06', '1', '2017-08-04 06:34:19', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('58', 'FSRR1501711915068', '2', '1', null, '', '2', '1', '2017-08-03 06:11:55', '1', '2017-08-04 06:34:15', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('59', 'FSRR1501713855126', '1', '1', null, '', '2', '1', '2017-08-03 06:44:15', '1', '2017-08-04 06:34:06', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('60', 'FSRR1501798426267', '1', '1', null, '', '2', '1', '2017-08-04 06:13:46', '1', '2017-08-04 06:28:10', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('61', 'FSRR1501798641048', '1', '1', null, '', '2', '1', '2017-08-04 06:17:21', '1', '2017-08-04 06:18:02', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('62', 'FSRR1501799564173', '1', '1', null, '', '2', '1', '2017-08-04 06:32:44', '1', '2017-08-04 06:33:53', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('63', 'FSRR1501799701726', '1', '1', null, '', '2', '1', '2017-08-04 06:35:01', '1', '2017-08-04 09:00:22', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('64', 'FSRR1502151960340', '1', '1', null, '', '2', '1', '2017-08-08 08:26:00', '1', '2017-08-08 08:26:55', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('65', 'FSRR1502152209288', '1', '1', '2017-08-31', 'dsd', '1', '1', '2017-08-08 08:30:09', '1', '2017-08-28 00:14:46', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('66', 'FSRR1502592605871', '1', '2', null, '12', '1', '1', '2017-08-13 10:50:05', '1', '2017-08-13 10:50:05', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('67', 'FSRR1502978757673', '1', '1', null, '', '2', '1', '2017-08-17 22:05:57', '1', '2017-08-21 08:02:46', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('68', 'FSRR1503274228168', '1', '1', '2017-08-16', '32323', null, '1', '2017-08-21 08:10:28', '1', '2017-08-27 23:43:49', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('69', 'FSRR1503274329937', '1', '1', null, '', '2', '1', '2017-08-21 08:12:09', '1', '2017-08-22 07:35:56', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('70', 'FSRR1503753427293', '1', '2', null, '1200000', '1', '1', '2017-08-26 21:17:07', '1', '2017-08-26 21:17:07', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('71', 'FSRR1503758969494', '1', '1', '2017-08-15', '2121212', '1', '1', '2017-08-26 22:49:29', '1', '2017-08-28 00:14:36', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('72', 'FSRR1503846189986', '1', '1', '2017-08-29', '121212', '1', '1', '2017-08-27 23:03:11', '1', '2017-08-27 23:55:35', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('73', 'FSRR1503846937829', '1', '1', '2017-08-16', 'sdsfdsdf', '1', '1', '2017-08-27 23:15:39', '1', '2017-08-28 00:14:24', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('74', 'FSRR1503847699480', '2', '1', '2017-08-16', 'sdsfdsdf', null, '1', '2017-08-27 23:28:21', '1', '2017-08-27 23:48:05', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('75', 'FSRR1503852276866', '1', '2', null, 'test', '1', '1', '2017-08-28 00:44:38', '1', '2017-08-28 00:44:38', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('76', 'FSRR1503852394316', '1', '2', null, 'AAAA', '1', '1', '2017-08-28 00:46:35', '1', '2017-08-28 01:15:01', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('77', 'FSRR1503853692972', '1', '2', null, 'AAAA', '1', '1', '2017-08-28 01:08:14', '1', '2017-08-28 01:08:14', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('78', 'FSRR1504007386759', '1', '2', null, '', '1', '1', '2017-08-29 19:49:46', '1', '2017-08-29 19:49:46', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('79', 'FSRR1506223699491', '1', '1', '2017-09-20', 'test', '1', '1', '2017-09-24 11:28:16', '1', '2017-09-24 11:28:16', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('80', 'FSRR1506225290096', '1', '2', null, '测试', '1', '1', '2017-09-24 11:54:47', '1', '2017-09-24 11:54:47', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('81', 'FSRR1507530148922', '1', '1', '2017-10-02', '121212', '1', '1', '2017-10-09 22:22:29', '1', '2017-10-09 22:22:29', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('82', 'FSRR1507530187202', '2', '1', '2017-10-26', '·1', '1', '1', '2017-10-09 22:23:07', '1', '2017-10-09 22:23:07', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('83', 'FSRR1507530235915', '1', '1', '2017-10-26', '是是是', '1', '1', '2017-10-09 22:23:56', '1', '2017-10-09 22:23:56', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('84', 'FSRR1507531523847', '1', '2', null, '', '1', '1', '2017-10-09 22:45:24', '1', '2017-10-09 22:45:24', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('85', 'FSRR1507590680427', '1', '1', '2017-10-20', '是是是', '1', '1', '2017-10-10 07:11:26', '1', '2017-10-10 07:11:26', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('86', 'FSRR1507591168253', '1', '1', '2017-10-19', '对对对', '1', '1', '2017-10-10 07:19:34', '1', '2017-10-10 07:19:34', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('87', 'FSRR1507591254400', '2', '1', '2017-10-28', '21212', '1', '1', '2017-10-10 07:21:00', '1', '2017-10-10 07:21:00', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('88', 'FSRR1507591347694', '1', '1', '2017-10-25', '1212', '2', '1', '2017-10-10 07:22:33', '1', '2017-10-10 07:33:35', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('89', 'FSRR1507591445672', '2', '2', null, '', '2', '1', '2017-10-10 07:24:11', '1', '2017-10-10 07:34:21', '0');
INSERT INTO `tb_part_repertory_record` VALUES ('90', 'FSRR1507591893360', '2', '2', null, 'asdas', '1', '1', '2017-10-10 07:31:39', '1', '2017-11-26 22:25:45', '0');

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
  `unit` varchar(64) DEFAULT NULL COMMENT '单位',
  `tax_amt` double DEFAULT NULL COMMENT '含税金额:价格的17%自动计算',
  `total_amt` double DEFAULT NULL COMMENT '总价',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int(2) DEFAULT NULL COMMENT '删除标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='出入库明细表';

-- ----------------------------
-- Records of tb_part_repertory_record_bill
-- ----------------------------
INSERT INTO `tb_part_repertory_record_bill` VALUES ('1', null, '1', '12', 'Xsdfsdfsdf', '空气压缩机', '京东', '10', '100', '1', '0.5', '500', '测试一下', '1', '2017-05-30 09:49:14', '1', '2017-05-30 09:49:16', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('2', null, '44', '22', 'a13', '新增配件113', null, '12', '132', null, null, null, '123123', '1', '2017-07-30 16:58:20', '1', '2017-07-30 16:58:20', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('3', null, '45', '22', 'a13', '新增配件113', null, '12', '132', null, null, null, '123123', '1', '2017-07-30 17:00:10', '1', '2017-07-30 17:00:10', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('4', null, '46', '23', '11111', 'maytest', null, '12', '32', null, null, null, '12312', '1', '2017-07-30 17:01:56', '1', '2017-07-30 17:01:56', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('5', null, '47', '22', 'a13', '新增配件113', null, '123', '213', null, null, null, '123123', '1', '2017-07-30 17:03:42', '1', '2017-07-30 17:03:42', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('6', null, '48', '23', '11111', 'maytest', null, '1231', '123', null, null, null, '123123', '1', '2017-07-30 17:09:18', '1', '2017-07-30 17:09:18', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('7', null, '49', '21', 'a12', '新增配件12', null, '123', '312', null, null, null, '123123', '1', '2017-07-30 17:10:30', '1', '2017-07-30 17:10:30', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('8', null, '50', '22', 'a13', '新增配件113', null, '12312', '123', null, null, null, '123123', '1', '2017-07-30 17:16:44', '1', '2017-07-30 17:16:44', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('9', null, '51', '12', 'a9', '新增配件9', null, '123', '22', null, null, null, '123123', '1', '2017-07-30 17:20:53', '1', '2017-07-30 17:20:53', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('10', null, '52', '21', 'a12', '新增配件12', null, '123', '12', null, null, null, '12312', '1', '2017-07-30 17:25:04', '1', '2017-07-30 17:25:04', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('11', null, '53', '21', 'a12', '新增配件12', null, '12', '32', null, null, null, '12312', '1', '2017-07-30 17:57:13', '1', '2017-07-30 17:57:13', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('12', null, '54', '14', 'a10', '新增配件10', null, '21', '32', null, null, null, '12312', '1', '2017-07-30 17:57:26', '1', '2017-07-30 17:57:26', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('13', null, '55', '4', '2100050233', '螺杆机专用高级冷却液205L', null, '12312', '12', null, null, null, '123123', '1', '2017-08-02 08:21:26', '1', '2017-08-02 08:21:26', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('14', null, '56', '7', '1223', '磊水1223', null, '123', '23', null, null, null, '', '1', '2017-08-03 06:04:27', '1', '2017-08-03 06:04:27', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('15', null, '57', '7', '1223', '磊水1223', null, '34', '44', null, null, null, '', '1', '2017-08-03 06:11:06', '1', '2017-08-03 06:11:06', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('16', null, '58', '7', '1223', '磊水1223', null, '24', '4', null, null, null, '', '1', '2017-08-03 06:11:55', '1', '2017-08-03 06:11:55', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('17', null, '59', '7', '1223', '磊水1223', null, '5000', '12', null, null, null, '', '1', '2017-08-03 06:44:15', '1', '2017-08-03 06:44:15', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('18', null, '60', '7', '1223', '磊水1223', null, '89', '9', null, null, null, '', '1', '2017-08-04 06:13:46', '1', '2017-08-04 06:13:46', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('19', null, '61', '7', '1223', '磊水1223', null, '67.9', '8', null, null, null, '', '1', '2017-08-04 06:17:21', '1', '2017-08-04 06:17:21', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('20', null, '62', '9', '777', '蜂鸣器9', null, '89', '99', null, null, null, '', '1', '2017-08-04 06:32:44', '1', '2017-08-04 06:32:44', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('21', null, '63', '10', '回骂', '水冷冰冰冰', null, '89', '9', null, null, null, '', '1', '2017-08-04 06:35:01', '1', '2017-08-04 06:35:01', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('22', null, '64', '10', '回骂', '水冷冰冰冰水水水水水水水水', null, '67.9', '6', null, null, null, '', '1', '2017-08-08 08:26:00', '1', '2017-08-08 08:26:00', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('23', null, '65', '4', '2100050233', '螺杆机专用高级冷却液205L', null, '12', '2', null, null, null, '', '1', '2017-08-08 08:30:09', '1', '2017-08-28 00:14:46', '1');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('24', null, '1', '4', '2100050233', '螺杆机专用高级冷却液205L', null, '14500', '1', '2', '3', '12', null, '1', '2017-08-13 10:50:06', '1', '2017-08-13 10:50:06', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('25', null, '67', '10', '回骂', '水冷冰冰冰水水水水水水水水', null, '12', '12', null, null, null, '', '1', '2017-08-17 22:05:57', '1', '2017-08-17 22:05:57', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('26', null, null, '11', 'xxxx12233', '底座轴承', '323', '45', '10', null, null, null, '32323', '1', '2017-08-21 08:10:28', '1', '2017-08-27 23:43:50', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('27', null, '69', '11', 'xxxx12233', '底座轴承', null, '400', '4', null, null, null, '', '1', '2017-08-21 08:12:09', '1', '2017-08-21 08:12:09', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('28', null, '70', '4', '2100050233', '螺杆机专用高级冷却液205L', null, '14500', '1', '件', '293', '14500', null, '1', '2017-08-26 21:17:07', '1', '2017-08-26 21:17:07', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('29', null, '70', '11', 'xxxx12233', '底座轴承', null, '56', '5', '件', '12', '280', null, '1', '2017-08-26 21:17:07', '1', '2017-08-26 21:17:07', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('30', null, null, '4', '2100050233', '螺杆机专用高级冷却液205L', '121212', '3', '3', null, null, null, '2121212', '1', '2017-08-26 22:49:29', '1', '2017-08-27 23:43:36', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('31', null, null, '13', 'qwqw1', '1212322', '121232', '12322', '312', null, null, null, '121212', '1', '2017-08-27 23:03:11', '1', '2017-08-27 23:42:59', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('32', null, null, '11', 'xxxx12233', '底座轴承', '1测试一下', null, '123', null, null, null, 'sdsfdsdf', '1', '2017-08-27 23:15:39', '1', '2017-08-27 23:42:35', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('33', null, null, '11', 'xxxx12233', '底座轴承', '1测试一下', '1212', '123', null, null, null, 'sdsfdsdf', '1', '2017-08-27 23:28:21', '1', '2017-08-27 23:42:25', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('34', null, '73', '13', 'qwqw1', '1212322', '12', '12', '32', null, null, null, 'sdsfdsdf', '1', '2017-08-27 23:53:14', '1', '2017-08-28 00:14:24', '1');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('35', null, '72', '11', 'xxxx12233', '底座轴承', '1212', '12312', '323232', null, null, null, '121212', '1', '2017-08-27 23:57:49', '1', '2017-08-27 23:57:49', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('36', null, '73', '13', '', 'qwqw1', '12', '12', '32', null, null, null, 'sdsfdsdf', '1', '2017-08-28 00:04:29', '1', '2017-08-28 00:14:24', '1');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('37', null, '73', '13', '', '', '测试供货商', '12', '32', null, null, null, 'sdsfdsdf', '1', '2017-08-28 00:05:12', '1', '2017-08-28 00:14:24', '1');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('38', null, '73', '13', '', 'qwqw1', '测试供货商', '12', '32', null, null, null, 'sdsfdsdf', '1', '2017-08-28 00:14:10', '1', '2017-08-28 00:14:24', '1');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('39', null, '73', '13', '', 'qwqw1', '测试供货商', '12', '32', null, null, null, 'sdsfdsdf', '1', '2017-08-28 00:14:24', '1', '2017-08-28 00:14:24', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('40', null, '71', '11', 'xxxx12233', '底座轴承', '32', '12', '32', null, null, null, '2121212', '1', '2017-08-28 00:14:36', '1', '2017-08-28 00:14:36', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('41', null, '65', '4', '', '2100050233', 'sds', '12', '2', null, null, null, 'dsd', '1', '2017-08-28 00:14:46', '1', '2017-08-28 00:14:46', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('42', null, '75', '13', 'qwqw1', '1212322', null, null, '12', 'as', null, null, null, '1', '2017-08-28 00:44:38', '1', '2017-08-28 00:44:38', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('43', null, '76', '11', 'xxxx12233', '底座轴承', null, '100', '200', '件', null, '20000', null, '1', '2017-08-28 00:46:36', '1', '2017-08-28 00:46:36', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('44', null, '76', '13', 'qwqw1', '1212322', null, null, '100', '件', null, null, null, '1', '2017-08-28 00:46:36', '1', '2017-08-28 00:46:36', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('45', null, '77', '13', 'qwqw1', '1212322', null, null, '100', '件', null, null, null, '1', '2017-08-28 01:08:14', '1', '2017-08-28 01:08:14', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('46', null, '77', '11', 'xxxx12233', '底座轴承', null, null, '200', '件', null, '20000', null, '1', '2017-08-28 01:08:15', '1', '2017-08-28 01:08:15', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('47', null, '76', '13', 'qwqw1', '1212322', null, null, '100', '件', null, null, null, '1', '2017-08-28 01:15:13', '1', '2017-08-28 01:15:13', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('48', null, '76', '11', 'xxxx12233', '底座轴承', null, null, '12', '件', null, '384', null, '1', '2017-08-28 01:15:16', '1', '2017-08-28 01:15:16', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('49', null, '78', '13', 'qwqw1', '1212322', null, null, '1', 'fff', null, null, null, '1', '2017-08-29 19:49:46', '1', '2017-08-29 19:49:46', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('50', null, '79', '11', 'xxxx12233', '底座轴承', 'A公司 ', '123123', '111', null, null, null, 'test', '1', '2017-09-24 11:28:16', '1', '2017-09-24 11:28:16', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('51', null, '80', '11', 'xxxx12233', '底座轴承', null, '1231', '10', '件', null, '12310', null, '1', '2017-09-24 11:54:47', '1', '2017-09-24 11:54:47', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('52', null, '81', '14', 'TAAD121212', '电机齿轮', '京东', '100', '200', null, null, null, '121212', '1', '2017-10-09 22:22:29', '1', '2017-10-09 22:22:29', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('53', null, '82', '14', 'TAAD121212', '电机齿轮', '腾讯', '200', '150', null, null, null, '·1', '1', '2017-10-09 22:23:07', '1', '2017-10-09 22:23:07', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('54', null, '83', '14', 'TAAD121212', '电机齿轮', '阿里', '100', '50', null, null, null, '是是是', '1', '2017-10-09 22:23:56', '1', '2017-10-09 22:23:56', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('55', null, '84', '14', 'TAAD121212', '电机齿轮', null, '10', '10', '个', null, '100', null, '1', '2017-10-09 22:45:24', '1', '2017-10-09 22:45:24', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('56', null, '84', '14', 'TAAD121212', '电机齿轮', null, '100', '150', '个', null, '15000', null, '1', '2017-10-09 22:45:24', '1', '2017-10-09 22:45:24', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('57', null, '85', '14', 'TAAD121212', '电机齿轮', '百度', '1000', '100', null, null, null, '是是是', '1', '2017-10-10 07:11:26', '1', '2017-10-10 07:11:26', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('58', null, '86', '15', 'Test20171010', '测试配件AAA', '京东', '100', '10', null, null, null, '对对对', '1', '2017-10-10 07:19:34', '1', '2017-10-10 07:19:34', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('59', null, '87', '15', 'Test20171010', '测试配件AAA', '10', '100', '2000', null, null, null, '21212', '1', '2017-10-10 07:21:00', '1', '2017-10-10 07:21:00', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('60', null, '88', '15', 'Test20171010', '测试配件AAA', '测试', '200', '100', null, null, null, '1212', '1', '2017-10-10 07:22:33', '1', '2017-10-10 07:22:33', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('61', null, '89', '15', 'Test20171010', '测试配件AAA', null, '100', '500', '个', null, '50000', null, '1', '2017-10-10 07:24:11', '1', '2017-10-10 07:24:11', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('62', null, '90', '15', 'Test20171010', '测试配件AAA', null, '199', '200', '100', null, '39800', null, '1', '2017-10-10 07:31:39', '1', '2017-10-10 07:31:39', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('63', null, '90', '15', 'Test20171010', '测试配件AAA', null, '300', '300', 'cc ', null, '90000', null, '1', '2017-10-10 07:31:57', '1', '2017-10-10 07:31:57', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('64', null, '90', '15', 'Test20171010', '测试配件AAA', null, '2', '3', '件', null, '6', null, '1', '2017-11-26 22:25:45', '1', '2017-11-26 22:25:45', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('65', null, '90', '15', 'Test20171010', '测试配件AAA', null, '1', '2', '件', null, '2', null, '1', '2017-11-26 22:25:46', '1', '2017-11-26 22:25:46', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('66', null, '90', '15', 'Test20171010', '测试配件AAA', null, null, '300', 'cc ', null, '90000', null, '1', '2017-11-26 22:25:46', '1', '2017-11-26 22:25:46', '0');
INSERT INTO `tb_part_repertory_record_bill` VALUES ('67', null, '90', '15', 'Test20171010', '测试配件AAA', null, null, '200', '100', null, '39800', null, '1', '2017-11-26 22:25:46', '1', '2017-11-26 22:25:46', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='出入库记录表-出库扩展表';

-- ----------------------------
-- Records of tb_part_repertory_record_out
-- ----------------------------
INSERT INTO `tb_part_repertory_record_out` VALUES ('1', '66', '104', '104', '3', '田', '4444', '444', null, '12', '品', '12', '1', '2017-08-13 10:50:05', '1', '2017-08-13 10:50:05', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('2', '70', '79', '67', '4', '赵文表', '13511003527', '1200000', null, '1200000', '北京市通州区北苑155号院西楼330室', '马泽国', '1', '2017-08-26 21:17:07', '1', '2017-08-26 21:17:07', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('3', '75', '110', '79', '3', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, 'test', '测试工程师1啊啊啊啊啊啊啊啊啊3', 'test', '1', '2017-08-28 00:44:38', '1', '2017-08-28 00:44:38', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('4', '76', '110', '79', '3', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, 'AAAA', '测试工程师1啊啊啊啊啊啊啊啊啊3', 'AAAA', '1', '2017-08-28 00:46:36', '1', '2017-08-28 01:15:04', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('5', '77', '110', '79', '3', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, 'AAAA', '测试工程师1啊啊啊啊啊啊啊啊啊3', 'AAAA', '1', '2017-08-28 01:08:14', '1', '2017-08-28 01:08:14', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('6', '78', '109', '81', '3', '', '', '', null, '', '上帝华北电力大学', '', '1', '2017-08-29 19:49:46', '1', '2017-08-29 19:49:46', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('7', '80', '110', '79', '5', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, '', '测试工程师1啊啊啊啊啊啊啊啊啊3', '测试', '1', '2017-09-24 11:54:47', '1', '2017-09-24 11:54:47', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('8', '84', '110', '79', '4', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, '', '测试工程师1啊啊啊啊啊啊啊啊啊3', '', '1', '2017-10-09 22:45:24', '1', '2017-10-09 22:45:24', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('9', '89', '110', '79', '3', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, '', '测试工程师1啊啊啊啊啊啊啊啊啊3', '阿达', '1', '2017-10-10 07:24:11', '1', '2017-10-10 07:24:11', '0');
INSERT INTO `tb_part_repertory_record_out` VALUES ('10', '90', '110', '79', '3', '测试工程师1啊啊啊啊啊啊啊啊啊2', '阿斯达岁的2', 'rwar2', null, '', '测试工程师1啊啊啊啊啊啊啊啊啊3', 'aaaasda', '1', '2017-10-10 07:31:39', '1', '2017-11-26 22:25:45', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='调试服务单表';

-- ----------------------------
-- Records of tb_serve_debug
-- ----------------------------
INSERT INTO `tb_serve_debug` VALUES ('2', 'DEBUG1503201585432', '47', '46', '5', '2017-08-21', '1', '2017-08-20 11:59:45', '1', '2017-08-21 07:53:18', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('3', 'DEBUG1503202855807', '48', '49', '7', '2017-08-31', '1', '2017-08-20 12:20:55', '1', '2017-08-20 21:28:34', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('4', 'DEBUG1503206039045', '47', '46', '7', '2017-08-31', '1', '2017-08-20 13:14:00', '1', '2017-08-20 21:28:31', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('5', 'DEBUG1503232425862', '50', '50', '7', '2017-08-16', '1', '2017-08-20 20:33:53', '1', '2017-08-20 20:34:58', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('6', 'DEBUG1503232431371', '50', '50', '7', '2017-08-16', '1', '2017-08-20 20:33:53', '1', '2017-08-20 20:34:32', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('7', 'DEBUG1503232598069', '50', '50', '7', '2017-08-23', '1', '2017-08-20 20:36:40', '1', '2017-08-20 21:28:16', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('8', 'DEBUG1503235708050', '104', '105', '6', '2017-08-09', '1', '2017-08-20 21:28:28', '1', '2017-08-21 07:53:13', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('9', 'DEBUG1503272349611', '104', '106', '7', '2017-08-21', '1', '2017-08-21 07:39:09', '1', '2017-08-21 07:53:09', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('10', 'DEBUG1503273003260', '100', '111', '7', '2017-08-16', '1', '2017-08-21 07:50:03', '1', '2017-08-21 08:39:32', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('11', 'DEBUG1503273032730', '100', '111', '7', '2017-08-08', '1', '2017-08-21 07:50:32', '1', '2017-08-21 07:50:57', '0', '47,48');
INSERT INTO `tb_serve_debug` VALUES ('12', 'DEBUG1503273514200', '100', '111', '4', '2017-08-31', '1', '2017-08-21 07:58:34', '1', '2017-08-21 07:58:34', '0', null);
INSERT INTO `tb_serve_debug` VALUES ('13', 'DEBUG1503273536900', '100', '111', '3', '2017-08-22', '1', '2017-08-21 07:58:56', '1', '2017-08-21 07:58:56', '0', '50');
INSERT INTO `tb_serve_debug` VALUES ('14', 'DEBUG1503276133984', '100', '111', '7', '2017-08-25', '1', '2017-08-21 08:42:13', '1', '2017-08-21 08:42:37', '1', null);
INSERT INTO `tb_serve_debug` VALUES ('15', 'DEBUG1503323950987', '100', '113', '7', '2017-08-30', '1', '2017-08-21 21:59:10', '1', '2017-08-21 21:59:10', '0', null);
INSERT INTO `tb_serve_debug` VALUES ('16', 'DEBUG1503845606456', '110', '122', '6', '2017-08-15', '1', '2017-08-27 22:53:28', '1', '2017-08-27 22:55:05', '1', '66,67');
INSERT INTO `tb_serve_debug` VALUES ('17', 'DEBUG1503845698850', '110', '122', '3,1,7', '2017-08-08', '1', '2017-08-27 22:55:00', '1', '2017-10-08 18:26:04', '0', '68');
INSERT INTO `tb_serve_debug` VALUES ('18', 'DEBUG1505052881800', '109', '120', '7', '2017-09-06', '1', '2017-09-10 22:14:41', '1', '2017-09-10 22:14:41', '0', '72');
INSERT INTO `tb_serve_debug` VALUES ('19', 'DEBUG1506223497235', '117', '126', '5', '2017-09-13', '1', '2017-09-24 11:24:54', '1', '2017-09-24 11:24:54', '0', '75');
INSERT INTO `tb_serve_debug` VALUES ('20', 'DEBUG1507451356745', '116', '128', '6', '2017-10-12', '1', '2017-10-08 16:30:17', '1', '2017-10-15 22:54:35', '0', '86,87,88');
INSERT INTO `tb_serve_debug` VALUES ('21', 'DEBUG1508656420784', '118', '129', '7,6', '2017-09-29', '1', '2017-10-22 15:13:40', '1', '2017-10-22 15:14:03', '0', '104,106');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_serve_maintenance
-- ----------------------------
INSERT INTO `tb_serve_maintenance` VALUES ('11', '', '100', '111', 'nnnn', '7', '2017-08-15', '4', '4', '4', '12', '4', '4', '4', '4', '444', '44', null, '444', '4', '', '4', '1', '2017-08-21 07:45:45', '1', '2017-08-21 08:38:12', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('12', '', '100', '111', 'jjj', '7', '2017-08-23', '0', '0', '0', '0', '0', '0', '0', '0', '', '', null, '', '0', '', '', '1', '2017-08-21 08:41:33', '1', '2017-08-21 22:02:02', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('13', '', '100', '113', '保修内容1 保修内容2 保修内容3 保修内容4', '7', '2017-08-15', '0', '0', '0', '0', '0', '0', '0', '0', '', '', null, '', '0', '', '', '1', '2017-08-21 22:01:53', '1', '2017-08-21 22:03:28', '0', '54');
INSERT INTO `tb_serve_maintenance` VALUES ('14', '', '100', '113', '禾禾禾禾禾禾禾禾禾禾', '7', '2017-08-14', '4555', '55', '55', '5', '5', '5', '55', '5', '55555555', '55555555', null, '55555555555555555555555555555555555555555555555555555555555555', '555555', '', '', '1', '2017-08-21 22:04:36', '1', '2017-08-21 22:04:51', '0', '55');
INSERT INTO `tb_serve_maintenance` VALUES ('15', '', '100', '113', 'ddddddddddddddddd', '7', '2017-07-31', '3', '3', '3', '3', '3', '3', '3', '3', 'deeeeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeee', null, 'eeeeeeeeeeeeeeeeeeeeeeee', '0', '', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '1', '2017-08-21 22:12:19', '1', '2017-08-21 22:19:39', '1', null);
INSERT INTO `tb_serve_maintenance` VALUES ('16', 'MAINT1503358502734', '100', '112', 'asasdasd', '3', '2017-08-22', '123', '123', '312', '123', null, null, '123', null, '212', '131231', null, '12312', '12', null, '23123', '1', '2017-08-22 07:35:02', null, null, '0', '58');
INSERT INTO `tb_serve_maintenance` VALUES ('17', 'MAINT1503358615506', '99', '115', 'asdasd', '2', '2017-08-23', '12', null, null, null, null, null, null, null, '', '', null, '', null, null, '', '1', '2017-08-22 07:36:55', null, null, '0', '59');
INSERT INTO `tb_serve_maintenance` VALUES ('18', 'MAINT1503843854989', '110', '122', 'asas', '5', '2017-08-08', '123', '1233', '12', '23', '23', '23', '32', '32', '2323', 'sdas', null, 'sdasd', null, null, 'dasd', '1', '2017-08-27 22:24:16', '1', '2017-08-27 22:27:03', '0', '64');
INSERT INTO `tb_serve_maintenance` VALUES ('19', 'MAINT1503844294435', '110', '122', 'dsdsssd', '6', '2017-08-15', '1212', '1212', '1212', '1212', '33', '222', '12', '12', '3323', '7,8,-1', 'aaaa', '23235', '8', '7', '23236', '1', '2017-08-27 22:31:35', '1', '2017-10-08 20:40:39', '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('20', 'MAINT1504007500551', '109', '120', 'dddddddd', '7', '2017-08-15', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-08-29 19:51:40', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('21', 'MAINT1504007655745', '109', '120', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '7', '2017-08-15', null, null, null, null, null, null, null, null, 'dddddddddddddddddddddddddddddddddddddddddddddddd', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', null, 'dddddddddddddddddddddddddddddddddddddddddddddddd', null, 'dddddddddddddddddddddddddddddddddddddddddddddddd', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '1', '2017-08-29 19:54:15', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('22', 'MAINT1506222863745', '117', '126', '惺惺惜惺惺想寻寻寻寻寻寻寻寻 ', '4', '2017-09-06', '12', '11', '111', '11', '11', '11', '111', '11', '131', '123', null, '123', '121', '12222222', '123', '1', '2017-09-24 11:14:20', null, null, '0', '74');
INSERT INTO `tb_serve_maintenance` VALUES ('23', 'MAINT1507451050901', '116', '128', 'sssssssssssssssssss', '6', '2017-10-11', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-08 16:25:12', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('24', 'MAINT1507451087272', '116', '128', 'sdfsfsdfsdf', '1,6,2', '2017-10-25', null, null, null, null, null, null, null, null, '', '6,7,8,-1', 'asadasd', '', null, '', '', '1', '2017-10-08 16:25:48', '1', '2017-10-08 20:37:24', '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('25', 'MAINT1507823733890', '117', '126', 'Terriblegg', '2', '2017-10-12', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-12 23:55:33', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('26', 'MAINT1507824281366', '117', '126', 'Dgdx', '2', '2017-10-13', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-13 00:04:41', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('27', 'MAINT1507824284813', '117', '126', 'Dgdx', '2', '2017-10-13', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-13 00:04:44', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('28', 'MAINT1507824287026', '117', '126', 'Dgdx', '2', '2017-10-13', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-13 00:04:47', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('29', 'MAINT1507824287667', '117', '126', 'DgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdx', '2', '2017-10-13', null, null, null, null, null, null, null, null, 'DgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdx', '6', '', 'DgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdx', null, 'DgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdx', 'DgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdxDgdx', '1', '2017-10-13 00:04:47', '1', '2017-10-15 22:38:48', '0', '84,85');
INSERT INTO `tb_serve_maintenance` VALUES ('30', 'MAINT1508250994795', '117', '126', 'Tian his nap could', '2', '2017-10-17', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-17 22:36:34', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('31', 'MAINT1508251001756', '117', '126', 'Tian his nap could', '2', '2017-10-17', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-17 22:36:41', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('32', 'MAINT1508655427527', '118', '129', '今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了今天不转了', '4,3', '2017-10-12', '1', '212', '22', '33', '444', '22222', '12', '333', '不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道不知道', '6,7,-1', '无法开机', '换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的换新的', '100000', '那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的那就换新的', '无法修了\n无法修了\n无法修了\n无法修了\n无法修了\n无法修了\n无法修了\n无法修了无法修了\n无法修了\n无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了无法修了\n\n', '1', '2017-10-22 14:57:07', '1', '2017-10-22 15:41:49', '0', '99,103,111');
INSERT INTO `tb_serve_maintenance` VALUES ('33', 'MAINT1508657434858', '117', '126', 'baoxiuneirong—\0—\0—\0—\0—\0baoxiuneirong—\0—\0—\0—baoxiuneirong—\0—\0—\0—\0—baoxiuneitonghhhhhhhhh\n\n\n—\0\n—\n—\n', '3', '2017-10-22', '30', '31', '32', '33', '37', '36', '34', '35', 'Guess\nguzhang\nguzhang\nguzhang guzhang guzhang guzhang guzhang guzhang', 'fuwuneirong guwuneirong fuweineitong fuwuneirong\nfuwuneirong ', null, 'jianyi \\\\\\\\ fuwurenyuan jianyi \n\n\n\njaidf ', '3', 'yijian====—\0-yijian\n\nasjdif a', 'beizhu —\0- remark—\0-beizhu-  remark—\0—\0beizhu', '1', '2017-10-22 15:30:34', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('34', 'MAINT1508682436636', '117', '126', 'dfasdfasdfadfadfasdFASDFADFASDFAFDADFADFASDFASDFASDASDF\n\nADFASDFASDFASDFADFADFAFADSFASDFADSF\n', '3,5,4', '2017-10-22', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-22 22:27:16', null, null, '0', null);
INSERT INTO `tb_serve_maintenance` VALUES ('35', 'MAINT1508682926017', '117', '126', 'mmmm', '2,4', '2017-10-22', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-22 22:35:26', null, null, '0', '119');
INSERT INTO `tb_serve_maintenance` VALUES ('36', 'MAINT1508804743870', '116', '128', 'Jjjj', '4', '2017-10-24', null, null, null, null, null, null, null, null, '', '7', null, '', null, '', '', '1', '2017-10-24 08:25:43', null, null, '0', '');
INSERT INTO `tb_serve_maintenance` VALUES ('37', 'MAINT1508804802917', '117', '126', 'Mmmm,,,', '3', '2017-10-24', null, null, null, null, null, null, null, null, '', '8', null, '', null, '', '', '1', '2017-10-24 08:26:42', null, null, '0', '');
INSERT INTO `tb_serve_maintenance` VALUES ('38', 'MAINT1508804886912', '117', '126', 'Nnnnmmm', '3', '2017-10-24', null, null, null, null, null, null, null, null, '', '8,7', null, '', null, '', '', '1', '2017-10-24 08:28:06', null, null, '0', '');
INSERT INTO `tb_serve_maintenance` VALUES ('39', 'MAINT1508945306793', '117', '126', 'Vvvv', '2', '2017-10-25', null, null, null, null, null, null, null, null, '', '', null, '', null, '', '', '1', '2017-10-25 23:28:26', null, null, '0', '121');
INSERT INTO `tb_serve_maintenance` VALUES ('40', 'MAINT1509682682588', '63', '85', '排气高温', '5', '2017-11-03', '1.4', '4647', '0.66', '23', '0.45', '98', '376', '231', '由于油细分离器受潮分离效果不佳，导致空压机耗油，开机后观油镜无法观察到油位。', '', null, '请更换新品油细分离器，加注螺杆冷却液', null, '11月20日之前会上报采购计划，请提前备货，订单到后带货到现场保养', '', '1', '2017-11-03 12:18:02', null, null, '0', '122');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='出库配件单表';

-- ----------------------------
-- Records of tb_serve_polling
-- ----------------------------
INSERT INTO `tb_serve_polling` VALUES ('2', 'POLLING1503223330565', '47', '46', '1', '2017-08-20 18:02:10', '1', '2017-08-21 07:59:35', '1', '122', '323', '1233', '1232', '1234', '1231', '123', '132', '123', '322', '122', '132', '0', '0', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', 'mainContenter13', 'mainContenter24', '5', '1', '2017-08-29', null);
INSERT INTO `tb_serve_polling` VALUES ('3', 'POLLING1503231734732', '50', '50', '1', '2017-08-20 20:22:17', '1', '2017-08-21 07:59:31', '1', '12', '312', '12333', '12312', '123', '123', '12', '12', '12', '2', '12', '321', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '12', '7', '1', '2017-08-22', null);
INSERT INTO `tb_serve_polling` VALUES ('4', 'POLLING1503272315293', null, null, '1', '2017-08-21 07:38:35', '1', '2017-08-21 07:59:28', '1', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '6', null, '2017-08-08', null);
INSERT INTO `tb_serve_polling` VALUES ('5', 'POLLING1503273477695', '100', '111', '1', '2017-08-21 07:57:57', '1', '2017-08-21 07:57:57', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '1', null, '2017-08-28', null);
INSERT INTO `tb_serve_polling` VALUES ('6', 'POLLING1503273496808', '100', '111', '1', '2017-08-21 07:58:16', '1', '2017-08-21 08:39:19', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '1', null, '2017-08-31', null);
INSERT INTO `tb_serve_polling` VALUES ('7', 'POLLING1503276116290', '100', '111', '1', '2017-08-21 08:41:56', '1', '2017-08-21 08:42:28', '1', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '7', null, '2017-08-07', null);
INSERT INTO `tb_serve_polling` VALUES ('8', 'POLLING1503320928881', '100', '111', '1', '2017-08-21 21:08:48', '1', '2017-08-21 22:27:00', '0', '6', '6', '6', '6', '6', '6', '6', '6', '6', '7', '7', '7', '1', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', 'd', 'dddd', '7', '0', '2017-08-30', null);
INSERT INTO `tb_serve_polling` VALUES ('9', 'POLLING1503320954517', null, null, '1', '2017-08-21 21:09:14', '1', '2017-08-21 21:58:30', '1', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '7', null, '2017-08-03', null);
INSERT INTO `tb_serve_polling` VALUES ('10', 'POLLING1503321833870', null, null, '1', '2017-08-21 21:23:54', '1', '2017-08-21 21:58:27', '1', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '7', null, '2017-08-03', null);
INSERT INTO `tb_serve_polling` VALUES ('11', 'POLLING1503755867972', '109', '120', '1', '2017-08-26 21:57:47', '1', '2017-08-26 21:57:47', '0', '', '', '', '', '', '', '', '', '', '', '', '', '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, '1', null, 'gg', 'gggggggggggggggggg', '7', '1', '2017-08-08', null);
INSERT INTO `tb_serve_polling` VALUES ('12', 'POLLING1503758551617', '109', '120', '1', '2017-08-26 22:42:31', '1', '2017-08-26 22:43:50', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1evvvvvvvvvvvvvvvvvvvvvvvvvv\n2vvvvvvvvvvvvvvvvvvvvvvvv\n3vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n4vvvvvvvvvv', '1vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n2vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n3vvvvvvvvvvvvvvvvvvv', '3', '1', '2017-08-14', null);
INSERT INTO `tb_serve_polling` VALUES ('13', 'POLLING1503845044677', '110', '122', '1', '2017-08-27 22:44:06', '1', '2017-08-27 22:49:23', '1', '32', '10', '12', '9', '3', '8', '21', '3', '4', '5', '6', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '期望', '去问问', '2', null, '2017-08-08', null);
INSERT INTO `tb_serve_polling` VALUES ('14', 'POLLING1503845355960', '110', '122', '1', '2017-08-27 22:49:17', '1', '2017-08-27 22:49:17', '0', '1212', '', '123312', '', '12', '', '12', '2', '2', '2', '12', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2', null, '2017-08-29', null);
INSERT INTO `tb_serve_polling` VALUES ('15', 'POLLING1506223284654', '117', '126', '1', '2017-09-24 11:21:21', '1', '2017-09-24 11:21:21', '0', '1', '1', '', '1', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, '1', '111', '2', null, '2017-09-11', null);
INSERT INTO `tb_serve_polling` VALUES ('16', 'POLLING1507451131677', '116', '128', '1', '2017-10-08 16:26:32', '1', '2017-10-08 18:25:45', '0', '', '12', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '7,3,1', null, '2017-10-25', null);
INSERT INTO `tb_serve_polling` VALUES ('17', 'POLLING1507451142812', '116', '128', '1', '2017-10-08 16:26:43', '1', '2017-10-08 16:26:43', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '1', null, '2017-10-27', null);
INSERT INTO `tb_serve_polling` VALUES ('18', 'POLLING1508595912410', '117', '126', '1', '2017-10-21 22:25:12', '1', '2017-10-21 22:25:12', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '4', '1', '2017-10-18', null);
INSERT INTO `tb_serve_polling` VALUES ('19', 'POLLING1508596221268', '117', '126', '1', '2017-10-21 22:30:21', '1', '2017-10-21 22:30:21', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '3', null, '2016-09-21', null);
INSERT INTO `tb_serve_polling` VALUES ('20', 'POLLING1508656397949', '118', '129', '1', '2017-10-22 15:13:17', '1', '2017-10-22 15:13:17', '0', '312', '12', '12', '123', '123', '12', '2', '3', '32', '12', '12', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '1222222222', '1231231', '2,3', '1', '2017-10-20', null);
INSERT INTO `tb_serve_polling` VALUES ('21', 'POLLING1508685085985', '117', '126', '1', '2017-10-22 23:11:25', '1', '2017-10-22 23:11:25', '0', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '', '', '3', null, '2017-10-22', null);
INSERT INTO `tb_serve_polling` VALUES ('22', 'POLLING1508685940148', '117', '126', '1', '2017-10-22 23:25:40', '1', '2017-10-22 23:25:40', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '0', 'FAJDSFHAKJSDFASDFASDFASDFASDFAASDFASDFASDFSDF', 'ZCXVZXCVZXCVZXCVZXCZXCVZXCVZXCVZCXVZCV\n\n', '2,3,4,5,6,7', '1', '2017-10-22', null);
INSERT INTO `tb_serve_polling` VALUES ('23', 'POLLING1509596853770', '116', '128', '1', '2017-11-02 12:27:33', '1', '2017-11-02 12:27:33', '0', '37', '81', '0', '10178', '0.8', '0.54', '391', '391', '391', '113', '118', '115', '1', '1', '1', '0', '1', '1', '1', '1', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '请使用正常配件', '', '5', '1', '2017-11-02', null);
INSERT INTO `tb_serve_polling` VALUES ('24', 'POLLING1509597130387', '116', '128', '1', '2017-11-02 12:32:10', '1', '2017-11-02 12:32:10', '0', '37', '47', '0.45', '19219', '0.82', 'o', '392', '392', '392', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2万小时请提前做大修计划', '', '5', '1', '2017-11-02', null);
INSERT INTO `tb_serve_polling` VALUES ('25', 'POLLING1509681336343', '63', '84', '1', '2017-11-03 11:55:36', '1', '2017-11-03 11:55:36', '0', '13', '72', '0', '4794', '0.56', '0.45', '376', '376', '376', '227', '236', '230', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', null, '1', '1', '1', '1', '1', '1', '1', '', '', '5', '1', '2017-11-03', null);
INSERT INTO `tb_serve_polling` VALUES ('26', 'POLLING1509681935553', '63', '83', '1', '2017-11-03 12:05:35', '1', '2017-11-03 12:05:35', '0', '31', '82', '0', '4536', '0.74', '0.55', '366', '366', '366', '248', '253', '251', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', null, '1', null, '1', '1', '1', '1', '1', '1', '1', '1', '', '', '5', '1', '2017-11-03', null);
