ALTER TABLE `tb_serve_polling`
MODIFY COLUMN `service_engineer`  varchar(256)  DEFAULT NULL COMMENT '服务工程师';

ALTER TABLE `tb_serve_maintenance`
MODIFY COLUMN `service_engineer`  varchar(256)  DEFAULT NULL COMMENT '服务工程师';

ALTER TABLE `tb_serve_debug`
MODIFY COLUMN `service_engineer`  varchar(256)  DEFAULT NULL COMMENT '服务工程师';


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


INSERT INTO `fusheng_test`.`sys_attr_group` (`attr_group_id`, `group_name`, `group_code`, `group_desc`, `creator`, `created`, `modifier`, `modified`, `deleted`) VALUES ('3', '维保服务单-服务内容', 'server.maintenance.serverContents', '维保服务单-服务内容', NULL, NULL, NULL, NULL, '0');

ALTER TABLE `tb_serve_maintenance`
ADD COLUMN `service_other_content`  varchar(256) NULL COMMENT '其他服务内容' AFTER `service_content`;

