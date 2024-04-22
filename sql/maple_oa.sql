/*
Navicat MySQL Data Transfer

Source Server         : maple5.7
Source Server Version : 50744
Source Host           : localhost:3307
Source Database       : maple_oa

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2024-04-23 00:42:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'oa_approval', '审批', null, null, 'OaApproval', 'crud', 'element-ui', 'com.ruoyi.oa', 'oa', 'approval', '审批', 'maple', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24', null);
INSERT INTO `gen_table` VALUES ('2', 'oa_attendance_record', '打卡记录', null, null, 'OaAttendanceRecord', 'crud', 'element-ui', 'com.ruoyi.oa', 'oa', 'record', '打卡记录', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29', null);
INSERT INTO `gen_table` VALUES ('3', 'oa_attendance_rule', '打卡规则', null, null, 'OaAttendanceRule', 'crud', 'element-ui', 'com.ruoyi.oa', 'oa', 'rule', '打卡规则', 'maple', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56', null);
INSERT INTO `gen_table` VALUES ('4', 'oa_holiday', '节假日表', null, null, 'OaHoliday', 'crud', 'element-ui', 'com.ruoyi.oa', 'oa', 'holiday', '节假日', 'maple', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', null, '1', null, 'EQ', 'input', '', '2', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'type', '审批类型（0补卡 1请假）', 'char(1)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'approval_type', '3', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'status', '审批状态（0待审核 1通过，2：拒绝）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'approval_status', '4', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, '1', null, 'EQ', 'datetime', '', '5', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', null, 'EQ', 'input', '', '6', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', null, 'EQ', 'datetime', '', '7', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', '8', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('10', '1', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', null, 'EQ', 'textarea', '', '10', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 00:57:24');
INSERT INTO `gen_table_column` VALUES ('11', '2', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('12', '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', null, '1', null, 'EQ', 'input', '', '2', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'attendance_time', '打卡时间', 'datetime', 'Date', 'attendanceTime', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '3', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, '1', null, 'EQ', 'datetime', '', '4', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', null, 'EQ', 'datetime', '', '6', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', null, 'EQ', 'textarea', '', '7', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:29');
INSERT INTO `gen_table_column` VALUES ('18', '3', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('19', '3', 'weekday', '工作日', 'varchar(64)', 'String', 'weekday', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', '2', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('20', '3', 'rest_day', '休息日', 'varchar(64)', 'String', 'restDay', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', '3', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', null, '1', null, 'EQ', 'input', '', '4', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('22', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, '1', null, 'EQ', 'datetime', '', '5', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('23', '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', null, 'EQ', 'input', '', '6', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('24', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', null, 'EQ', 'datetime', '', '7', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'start_time', '上班时间', 'time', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', '8', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'end_time', '下班时间', 'time', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', '9', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', null, 'EQ', 'textarea', '', '10', 'admin', '2024-04-22 00:54:30', '', '2024-04-22 01:16:56');
INSERT INTO `gen_table_column` VALUES ('28', '4', 'id', null, 'bigint(20)', 'Long', 'id', '1', '0', '0', '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('29', '4', 'date', null, 'date', 'Date', 'date', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '2', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('30', '4', 'type', null, 'tinyint(10)', 'Integer', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'holiday_type', '3', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('31', '4', 'type_des', null, 'varchar(255)', 'String', 'typeDes', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('32', '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', null, '1', null, 'EQ', 'input', '', '5', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('33', '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', null, '1', null, 'EQ', 'datetime', '', '6', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('34', '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', null, 'EQ', 'input', '', '7', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '1', null, 'EQ', 'datetime', '', '8', 'admin', '2024-04-22 00:55:14', '', '2024-04-22 01:21:38');

-- ----------------------------
-- Table structure for oa_approval
-- ----------------------------
DROP TABLE IF EXISTS `oa_approval`;
CREATE TABLE `oa_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `type` char(1) DEFAULT '0' COMMENT '审批类型（0补卡 1请假）',
  `status` char(1) DEFAULT '0' COMMENT '审批状态（0待审核 1通过，2：拒绝）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批';

-- ----------------------------
-- Records of oa_approval
-- ----------------------------

-- ----------------------------
-- Table structure for oa_attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance_record`;
CREATE TABLE `oa_attendance_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `attendance_time` datetime DEFAULT NULL COMMENT '打卡时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `start_time` time DEFAULT NULL COMMENT '上班时间',
  `end_time` time DEFAULT NULL COMMENT '下班时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='打卡记录';

-- ----------------------------
-- Records of oa_attendance_record
-- ----------------------------

-- ----------------------------
-- Table structure for oa_attendance_rule
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance_rule`;
CREATE TABLE `oa_attendance_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `weekday` varchar(64) DEFAULT '1,2,3,4,5' COMMENT '工作日',
  `rest_day` varchar(64) DEFAULT '6,7' COMMENT '休息日',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `start_time` time DEFAULT NULL COMMENT '上班时间',
  `end_time` time DEFAULT NULL COMMENT '下班时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='打卡规则';

-- ----------------------------
-- Records of oa_attendance_rule
-- ----------------------------
INSERT INTO `oa_attendance_rule` VALUES ('1', '1,2,3,4,5', '6,7', 'admin', '2024-04-23 00:27:04', '', null, '09:30:00', '18:30:00', '测试打卡');

-- ----------------------------
-- Table structure for oa_holiday
-- ----------------------------
DROP TABLE IF EXISTS `oa_holiday`;
CREATE TABLE `oa_holiday` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `type` tinyint(10) DEFAULT NULL,
  `type_des` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='节假日表';

-- ----------------------------
-- Records of oa_holiday
-- ----------------------------
INSERT INTO `oa_holiday` VALUES ('1', '2024-01-01', '2', '元旦', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('2', '2024-01-06', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('3', '2024-01-07', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('4', '2024-01-13', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('5', '2024-01-14', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('6', '2024-01-20', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('7', '2024-01-21', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('8', '2024-01-27', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('9', '2024-01-28', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('10', '2024-02-03', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('11', '2024-02-10', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('12', '2024-02-11', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('13', '2024-02-12', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('14', '2024-02-13', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('15', '2024-02-14', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('16', '2024-02-15', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('17', '2024-02-16', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('18', '2024-02-17', '2', '春节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('19', '2024-02-24', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('20', '2024-02-25', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('21', '2024-03-02', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('22', '2024-03-03', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('23', '2024-03-09', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('24', '2024-03-10', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('25', '2024-03-16', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('26', '2024-03-17', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('27', '2024-03-23', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('28', '2024-03-24', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('29', '2024-03-30', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('30', '2024-03-31', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('31', '2024-04-04', '2', '清明节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('32', '2024-04-05', '2', '清明节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('33', '2024-04-06', '2', '清明节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('34', '2024-04-13', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('35', '2024-04-14', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('36', '2024-04-20', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('37', '2024-04-21', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('38', '2024-04-27', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('39', '2024-05-01', '2', '劳动节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('40', '2024-05-02', '2', '劳动节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('41', '2024-05-03', '2', '劳动节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('42', '2024-05-04', '2', '劳动节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('43', '2024-05-05', '2', '劳动节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('44', '2024-05-12', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('45', '2024-05-18', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('46', '2024-05-19', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('47', '2024-05-25', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('48', '2024-05-26', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('49', '2024-06-01', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('50', '2024-06-02', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('51', '2024-06-08', '2', '端午节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('52', '2024-06-09', '2', '端午节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('53', '2024-06-10', '2', '端午节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('54', '2024-06-15', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('55', '2024-06-16', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('56', '2024-06-22', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('57', '2024-06-23', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('58', '2024-06-29', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('59', '2024-06-30', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('60', '2024-07-06', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('61', '2024-07-07', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('62', '2024-07-13', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('63', '2024-07-14', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('64', '2024-07-20', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('65', '2024-07-21', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('66', '2024-07-27', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('67', '2024-07-28', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('68', '2024-08-03', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('69', '2024-08-04', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('70', '2024-08-10', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('71', '2024-08-11', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('72', '2024-08-17', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('73', '2024-08-18', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('74', '2024-08-24', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('75', '2024-08-25', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('76', '2024-08-31', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('77', '2024-09-01', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('78', '2024-09-07', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('79', '2024-09-08', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('80', '2024-09-15', '2', '中秋节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('81', '2024-09-16', '2', '中秋节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('82', '2024-09-17', '2', '中秋节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('83', '2024-09-21', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('84', '2024-09-22', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('85', '2024-09-28', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('86', '2024-10-01', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('87', '2024-10-02', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('88', '2024-10-03', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('89', '2024-10-04', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('90', '2024-10-05', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('91', '2024-10-06', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('92', '2024-10-07', '2', '国庆节', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('93', '2024-10-13', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('94', '2024-10-19', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('95', '2024-10-20', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('96', '2024-10-26', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('97', '2024-10-27', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('98', '2024-11-02', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('99', '2024-11-03', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('100', '2024-11-09', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('101', '2024-11-10', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('102', '2024-11-16', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('103', '2024-11-17', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('104', '2024-11-23', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('105', '2024-11-24', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('106', '2024-11-30', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('107', '2024-12-01', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('108', '2024-12-07', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('109', '2024-12-08', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('110', '2024-12-14', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('111', '2024-12-15', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('112', '2024-12-21', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('113', '2024-12-22', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('114', '2024-12-28', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);
INSERT INTO `oa_holiday` VALUES ('115', '2024-12-29', '1', '休息日', 'admin', '2024-04-22 12:55:49', '', null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-21 22:15:38', '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-21 22:15:38', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-21 22:15:38', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-21 22:15:38', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('30', '0', '补卡', '0', 'approval_type', null, null, 'Y', '0', 'admin', '2024-04-21 09:58:53', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '请假', '1', 'approval_type', null, null, 'N', '0', 'admin', '2024-04-21 09:59:14', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '0', '待审核', '0', 'approval_status', null, null, 'Y', '0', 'admin', '2024-04-21 10:03:23', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('33', '0', '通过', '1', 'approval_status', null, null, 'N', '0', 'admin', '2024-04-21 10:03:33', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('34', '0', '拒绝', '2', 'approval_status', null, null, 'N', '0', 'admin', '2024-04-21 10:03:45', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('100', '0', '工作日', '0', 'holiday_type', null, 'default', 'N', '0', 'admin', '2024-04-22 01:20:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '休息日', '1', 'holiday_type', null, 'default', 'N', '0', 'admin', '2024-04-22 01:20:53', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '节假日', '2', 'holiday_type', null, 'default', 'N', '0', 'admin', '2024-04-22 01:21:13', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-21 22:15:38', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-21 22:15:38', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-21 22:15:38', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2024-04-21 22:15:38', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2024-04-21 22:15:38', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-21 22:15:38', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-21 22:15:38', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-21 22:15:38', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-21 22:15:38', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2024-04-12 22:06:26', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '审批类型', 'approval_type', '0', 'admin', '2024-04-21 09:58:07', '', null, '审批类型（0补卡 1请假）');
INSERT INTO `sys_dict_type` VALUES ('12', '审批状态', 'approval_status', '0', 'admin', '2024-04-21 10:02:15', '', null, '审批状态（0待审核 1通过，2：拒绝）');
INSERT INTO `sys_dict_type` VALUES ('100', '节假日类型', 'holiday_type', '0', 'admin', '2024-04-22 01:19:59', '', null, '0:工作日 1：休息日 2：节假日');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-21 22:15:38', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-22 00:20:32');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 00:20:43');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-22 02:08:40');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 02:08:50');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 02:15:31');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 02:19:05');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-22 15:59:04');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 15:59:19');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 21:24:47');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 22:05:03');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 23:59:18');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-23 00:04:08');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 00:04:22');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-23 00:22:19');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-23 00:22:43');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-23 00:22:55');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 00:23:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-04-21 22:15:38', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2024-04-21 22:15:38', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-04-21 22:15:38', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-21 22:15:38', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-21 22:15:38', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-21 22:15:38', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-21 22:15:38', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-21 22:15:38', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-21 22:15:38', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-21 22:15:38', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-21 22:15:38', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2024-04-21 22:15:38', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-21 22:15:38', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-21 22:15:38', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-04-21 22:15:38', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-21 22:15:38', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-21 22:15:38', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-21 22:15:38', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-21 22:15:38', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-21 22:15:38', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-21 22:15:38', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-21 22:15:38', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-21 22:15:38', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', 'oa', '0', '4', 'oa', null, null, '1', '0', 'M', '0', '0', null, 'education', 'admin', '2024-04-22 00:33:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '审批', '2000', '1', 'approval', 'oa/approval/index', null, '1', '0', 'C', '0', '0', 'oa:approval:list', '#', 'admin', '2024-04-22 02:05:24', '', null, '审批菜单');
INSERT INTO `sys_menu` VALUES ('2002', '审批查询', '2001', '1', '#', '', null, '1', '0', 'F', '0', '0', 'oa:approval:query', '#', 'admin', '2024-04-22 02:05:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '审批新增', '2001', '2', '#', '', null, '1', '0', 'F', '0', '0', 'oa:approval:add', '#', 'admin', '2024-04-22 02:05:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '审批修改', '2001', '3', '#', '', null, '1', '0', 'F', '0', '0', 'oa:approval:edit', '#', 'admin', '2024-04-22 02:05:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '审批删除', '2001', '4', '#', '', null, '1', '0', 'F', '0', '0', 'oa:approval:remove', '#', 'admin', '2024-04-22 02:05:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '审批导出', '2001', '5', '#', '', null, '1', '0', 'F', '0', '0', 'oa:approval:export', '#', 'admin', '2024-04-22 02:05:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '节假日', '2000', '1', 'holiday', 'oa/holiday/index', null, '1', '0', 'C', '0', '0', 'oa:holiday:list', '#', 'admin', '2024-04-22 02:05:34', '', null, '节假日菜单');
INSERT INTO `sys_menu` VALUES ('2008', '节假日查询', '2007', '1', '#', '', null, '1', '0', 'F', '0', '0', 'oa:holiday:query', '#', 'admin', '2024-04-22 02:05:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '节假日新增', '2007', '2', '#', '', null, '1', '0', 'F', '0', '0', 'oa:holiday:add', '#', 'admin', '2024-04-22 02:05:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '节假日修改', '2007', '3', '#', '', null, '1', '0', 'F', '0', '0', 'oa:holiday:edit', '#', 'admin', '2024-04-22 02:05:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '节假日删除', '2007', '4', '#', '', null, '1', '0', 'F', '0', '0', 'oa:holiday:remove', '#', 'admin', '2024-04-22 02:05:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '节假日导出', '2007', '5', '#', '', null, '1', '0', 'F', '0', '0', 'oa:holiday:export', '#', 'admin', '2024-04-22 02:05:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '打卡记录', '2000', '1', 'record', 'oa/record/index', null, '1', '0', 'C', '0', '0', 'oa:record:list', '#', 'admin', '2024-04-22 02:05:44', '', null, '打卡记录菜单');
INSERT INTO `sys_menu` VALUES ('2014', '打卡记录查询', '2013', '1', '#', '', null, '1', '0', 'F', '0', '0', 'oa:record:query', '#', 'admin', '2024-04-22 02:05:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '打卡记录新增', '2013', '2', '#', '', null, '1', '0', 'F', '0', '0', 'oa:record:add', '#', 'admin', '2024-04-22 02:05:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '打卡记录修改', '2013', '3', '#', '', null, '1', '0', 'F', '0', '0', 'oa:record:edit', '#', 'admin', '2024-04-22 02:05:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '打卡记录删除', '2013', '4', '#', '', null, '1', '0', 'F', '0', '0', 'oa:record:remove', '#', 'admin', '2024-04-22 02:05:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '打卡记录导出', '2013', '5', '#', '', null, '1', '0', 'F', '0', '0', 'oa:record:export', '#', 'admin', '2024-04-22 02:05:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '打卡规则', '2000', '1', 'rule', 'oa/rule/index', null, '1', '0', 'C', '0', '0', 'oa:rule:list', '#', 'admin', '2024-04-22 02:05:54', '', null, '打卡规则菜单');
INSERT INTO `sys_menu` VALUES ('2020', '打卡规则查询', '2019', '1', '#', '', null, '1', '0', 'F', '0', '0', 'oa:rule:query', '#', 'admin', '2024-04-22 02:05:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '打卡规则新增', '2019', '2', '#', '', null, '1', '0', 'F', '0', '0', 'oa:rule:add', '#', 'admin', '2024-04-22 02:05:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '打卡规则修改', '2019', '3', '#', '', null, '1', '0', 'F', '0', '0', 'oa:rule:edit', '#', 'admin', '2024-04-22 02:05:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '打卡规则删除', '2019', '4', '#', '', null, '1', '0', 'F', '0', '0', 'oa:rule:remove', '#', 'admin', '2024-04-22 02:05:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '打卡规则导出', '2019', '5', '#', '', null, '1', '0', 'F', '0', '0', 'oa:rule:export', '#', 'admin', '2024-04-22 02:05:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '我的考勤', '2000', '5', 'myRecord', 'oa/myRecord/index', null, '1', '0', 'C', '0', '0', 'oa:record:myList', '#', 'admin', '2024-04-22 16:00:09', 'admin', '2024-04-23 00:06:55', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-21 22:15:38', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-21 22:15:38', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-21 22:15:38\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:25:17', '129');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:25:23', '25');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"oa\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"oa\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:33:22', '31');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"oa_approval,oa_attendance_rule,oa_attendance_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:54:30', '246');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"oa_holiday\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:55:14', '77');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"approval\",\"className\":\"OaApproval\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":2,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"审批类型（0补卡 1请假）\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"approval_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"审批状态（0待审核 1通过，2：拒绝）\",\"columnId\":4,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"approval_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaF', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 00:57:24', '82');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"OaAttendanceRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":12,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttendanceTime\",\"columnComment\":\"打卡时间\",\"columnId\":13,\"columnName\":\"attendance_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"attendanceTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":14,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:00:21', '65');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"rule\",\"className\":\"OaAttendanceRule\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":18,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Weekday\",\"columnComment\":\"工作日\",\"columnId\":19,\"columnName\":\"weekday\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"weekday\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RestDay\",\"columnComment\":\"休息日\",\"columnId\":20,\"columnName\":\"rest_day\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"restDay\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":21,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:02:03', '38');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"OaAttendanceRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:00:21\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":12,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:00:21\",\"usableColumn\":false},{\"capJavaField\":\"AttendanceTime\",\"columnComment\":\"打卡时间\",\"columnId\":13,\"columnName\":\"attendance_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"attendanceTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:00:21\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":14,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:16:29', '44');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"rule\",\"className\":\"OaAttendanceRule\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":18,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:02:03\",\"usableColumn\":false},{\"capJavaField\":\"Weekday\",\"columnComment\":\"工作日\",\"columnId\":19,\"columnName\":\"weekday\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"weekday\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:02:03\",\"usableColumn\":false},{\"capJavaField\":\"RestDay\",\"columnComment\":\"休息日\",\"columnId\":20,\"columnName\":\"rest_day\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"restDay\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:02:03\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":21,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:54:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:16:56', '81');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"holiday\",\"className\":\"OaHoliday\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":28,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnId\":29,\"columnName\":\"date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"date\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnId\":30,\"columnName\":\"type\",\"columnType\":\"tinyint(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeDes\",\"columnId\":31,\"columnName\":\"type_des\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"typeDes\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":f', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:17:58', '34');
INSERT INTO `sys_oper_log` VALUES ('111', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"节假日类型\",\"dictType\":\"holiday_type\",\"params\":{},\"remark\":\"0:工作日 1：休息日 2：节假日\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:19:59', '32');
INSERT INTO `sys_oper_log` VALUES ('112', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"工作日\",\"dictSort\":0,\"dictType\":\"holiday_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:20:40', '29');
INSERT INTO `sys_oper_log` VALUES ('113', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"休息日\",\"dictSort\":0,\"dictType\":\"holiday_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:20:54', '29');
INSERT INTO `sys_oper_log` VALUES ('114', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"节假日\",\"dictSort\":0,\"dictType\":\"holiday_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:21:13', '29');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"holiday\",\"className\":\"OaHoliday\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":28,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:17:58\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnId\":29,\"columnName\":\"date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"date\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:17:58\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnId\":30,\"columnName\":\"type\",\"columnType\":\"tinyint(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"holiday_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-22 01:17:58\",\"usableColumn\":false},{\"capJavaField\":\"TypeDes\",\"columnId\":31,\"columnName\":\"type_des\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-22 00:55:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 01:21:38', '188');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"oa_approval,oa_attendance_record,oa_attendance_rule,oa_holiday\"}', null, '0', null, '2024-04-22 01:21:45', '686');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的考勤\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"oa\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 16:00:09', '40');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"oa/record/myindex\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 21:25:28', '14');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"oa/record/myindex\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 21:26:20', '19');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"oa/record/myindex\",\"perms\":\"oa:record:myList\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 21:26:42', '22');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oa/record/myindex\",\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"record\",\"perms\":\"oa:record:myList\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 21:27:26', '17');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oa/record/myindex\",\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"myRecord\",\"perms\":\"oa:record:myList\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-22 21:28:43', '19');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oa/record/myindex\",\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"MyRecord\",\"perms\":\"oa:record:myList\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-23 00:01:02', '34');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oa/myRecord/index\",\"createTime\":\"2024-04-22 16:00:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"我的考勤\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"myRecord\",\"perms\":\"oa:record:myList\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-23 00:06:55', '24');
INSERT INTO `sys_oper_log` VALUES ('125', '打卡记录', '1', 'com.ruoyi.oa.controller.OaAttendanceRecordController.add()', 'POST', '1', 'admin', '研发部门', '/oa/record', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"没有打卡规则\",\"code\":500}', '0', null, '2024-04-23 00:11:42', '50');
INSERT INTO `sys_oper_log` VALUES ('126', '打卡记录', '1', 'com.ruoyi.oa.controller.OaAttendanceRecordController.add()', 'POST', '1', 'admin', '研发部门', '/oa/record', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"没有打卡规则\",\"code\":500}', '0', null, '2024-04-23 00:23:16', '5');
INSERT INTO `sys_oper_log` VALUES ('127', '打卡规则', '1', 'com.ruoyi.oa.controller.OaAttendanceRuleController.add()', 'POST', '1', 'admin', '研发部门', '/oa/rule', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-23 00:27:04\",\"endTime\":\"06:30\",\"id\":1,\"params\":{},\"remark\":\"测试打卡\",\"startTime\":\"09:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-23 00:27:04', '118');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2024-04-21 22:15:38', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2024-04-21 22:15:38', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2024-04-21 22:15:38', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2024-04-21 22:15:38', 'admin', '2024-04-22 00:25:17', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-23 00:23:02', 'admin', '2024-04-21 22:15:38', '', '2024-04-23 00:23:01', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-21 22:15:38', 'admin', '2024-04-21 22:15:38', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
