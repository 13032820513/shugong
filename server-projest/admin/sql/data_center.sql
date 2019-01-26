/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-12-10 11:34:35
*/

DROP DATABASE IF EXISTS data_cneter_flowable;
CREATE DATABASE IF NOT EXISTS data_cneter_flowable DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

DROP DATABASE IF EXISTS data_center;
CREATE DATABASE IF NOT EXISTS data_center DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE data_center;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('24', '1', '0', '[0],', '总公司', '总公司', '', null);
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', '', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('16', '0', '0', '状态', null);
INSERT INTO `sys_dict` VALUES ('17', '1', '16', '启用', null);
INSERT INTO `sys_dict` VALUES ('18', '2', '16', '禁用', null);
INSERT INTO `sys_dict` VALUES ('29', '0', '0', '性别', null);
INSERT INTO `sys_dict` VALUES ('30', '1', '29', '男', null);
INSERT INTO `sys_dict` VALUES ('31', '2', '29', '女', null);
INSERT INTO `sys_dict` VALUES ('35', '0', '0', '账号状态', null);
INSERT INTO `sys_dict` VALUES ('36', '1', '35', '启用', null);
INSERT INTO `sys_dict` VALUES ('37', '2', '35', '冻结', null);
INSERT INTO `sys_dict` VALUES ('38', '3', '35', '已删除', null);

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`  VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-user', '#', '4', '1', '1', NULL, '1', '1');
INSERT INTO `sys_menu`  VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', '3', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', '4', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', '5', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', '6', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', '7', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', '2', '2', '1', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', '3', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', '4', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', '4', '2', '1', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', '3', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', '6', '2', '1', NULL, '1', '0');
INSERT INTO `sys_menu`  VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', '7', '2', '1', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', '3', '2', '1', NULL, '0', NULL);
INSERT INTO `sys_menu`  VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', NULL, '/dict', '4', '2', '1', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', '6', '2', '1', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', '1', '3', '0', NULL, '0', NULL);
INSERT INTO `sys_menu`  VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', '1', '3', '0', NULL, '0', NULL);
INSERT INTO `sys_menu`  VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', '1', '3', '0', NULL, '0', NULL);
INSERT INTO `sys_menu`  VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', '9', '2', '1', NULL, '0', '0');
INSERT INTO `sys_menu`  VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', NULL, '0', NULL);
INSERT INTO `sys_menu`  VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu`  VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', NULL, '1', NULL);
INSERT INTO `sys_menu` VALUES ('168', 'data_center', '0', '[0],', '数据中心管理', 'fa-bar-chart', '#', '2', '1', '1', NULL, '1', '1');
INSERT INTO `sys_menu` VALUES ('169', 'data_center_updata', 'data_center', '[0],[data_center],', '数据修改管理', NULL, '/datacenter/updata', '1', '3', '0', NULL, '1', '0');
INSERT INTO `sys_menu` VALUES ('171', 'data_center_list', 'data_center', '[0],[data_center],', '数据中心列表', '', '/datacenter', '1', '2', '1', NULL, '1', NULL);
INSERT INTO `sys_menu` VALUES ('172', 'season_list', 'data_center', '[0],[data_center],', '季节管理', '', '/season', '3', '2', '1', NULL, '1', NULL);
INSERT INTO `sys_menu` VALUES ('173', 'season_updata', 'data_center', '[0],[data_center],', '季节修改', '', '/season/updata', '4', '3', '0', NULL, '1', NULL);





-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '世界', '10', '欢迎使用后台管理系统', '2017-01-11 08:53:20', '1');
INSERT INTO `sys_notice` VALUES ('8', '你好', null, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('1', '105', '5');
INSERT INTO `sys_relation` VALUES ('2', '114', '5');
INSERT INTO `sys_relation` VALUES ('3', '115', '5');
INSERT INTO `sys_relation` VALUES ('4', '116', '5');
INSERT INTO `sys_relation` VALUES ('5', '117', '5');
INSERT INTO `sys_relation` VALUES ('6', '118', '5');
INSERT INTO `sys_relation` VALUES ('7', '119', '5');
INSERT INTO `sys_relation` VALUES ('8', '106', '5');
INSERT INTO `sys_relation` VALUES ('9', '107', '5');
INSERT INTO `sys_relation` VALUES ('10', '108', '5');
INSERT INTO `sys_relation` VALUES ('11', '109', '5');
INSERT INTO `sys_relation` VALUES ('12', '110', '5');
INSERT INTO `sys_relation` VALUES ('13', '111', '5');
INSERT INTO `sys_relation` VALUES ('14', '112', '5');
INSERT INTO `sys_relation` VALUES ('15', '113', '5');
INSERT INTO `sys_relation` VALUES ('16', '120', '5');
INSERT INTO `sys_relation` VALUES ('17', '121', '5');
INSERT INTO `sys_relation` VALUES ('18', '122', '5');
INSERT INTO `sys_relation` VALUES ('19', '150', '5');
INSERT INTO `sys_relation` VALUES ('20', '151', '5');
INSERT INTO `sys_relation` VALUES ('51', '105', '1');
INSERT INTO `sys_relation` VALUES ('52', '106', '1');
INSERT INTO `sys_relation` VALUES ('53', '107', '1');
INSERT INTO `sys_relation` VALUES ('54', '108', '1');
INSERT INTO `sys_relation` VALUES ('55', '109', '1');
INSERT INTO `sys_relation` VALUES ('56', '110', '1');
INSERT INTO `sys_relation` VALUES ('57', '111', '1');
INSERT INTO `sys_relation` VALUES ('58', '112', '1');
INSERT INTO `sys_relation` VALUES ('59', '113', '1');
INSERT INTO `sys_relation` VALUES ('60', '165', '1');
INSERT INTO `sys_relation` VALUES ('61', '166', '1');
INSERT INTO `sys_relation` VALUES ('62', '167', '1');
INSERT INTO `sys_relation` VALUES ('63', '114', '1');
INSERT INTO `sys_relation` VALUES ('64', '115', '1');
INSERT INTO `sys_relation` VALUES ('65', '116', '1');
INSERT INTO `sys_relation` VALUES ('66', '117', '1');
INSERT INTO `sys_relation` VALUES ('67', '118', '1');
INSERT INTO `sys_relation` VALUES ('68', '162', '1');
INSERT INTO `sys_relation` VALUES ('69', '163', '1');
INSERT INTO `sys_relation` VALUES ('70', '164', '1');
INSERT INTO `sys_relation` VALUES ('71', '119', '1');
INSERT INTO `sys_relation` VALUES ('72', '120', '1');
INSERT INTO `sys_relation` VALUES ('73', '121', '1');
INSERT INTO `sys_relation` VALUES ('74', '122', '1');
INSERT INTO `sys_relation` VALUES ('75', '150', '1');
INSERT INTO `sys_relation` VALUES ('76', '151', '1');
INSERT INTO `sys_relation` VALUES ('77', '128', '1');
INSERT INTO `sys_relation` VALUES ('78', '134', '1');
INSERT INTO `sys_relation` VALUES ('79', '158', '1');
INSERT INTO `sys_relation` VALUES ('80', '159', '1');
INSERT INTO `sys_relation` VALUES ('81', '130', '1');
INSERT INTO `sys_relation` VALUES ('82', '145', '1');
INSERT INTO `sys_relation` VALUES ('83', '149', '1');
INSERT INTO `sys_relation` VALUES ('84', '168', '1');
INSERT INTO `sys_relation` VALUES ('85', '169', '1');
INSERT INTO `sys_relation` VALUES ('86', '171', '1');
INSERT INTO `sys_relation` VALUES ('87', '172', '1');
INSERT INTO `sys_relation` VALUES ('88', '173', '1');


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO `sys_role` VALUES ('5', '2', '1', '临时', '26', 'temp', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'sn93@qq.com', '18200000000', '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('44', null, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', '1', 'abc@123.com', '', '5', '26', '3', '2017-05-16 20:33:37', null);
INSERT INTO `sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:24', null);
