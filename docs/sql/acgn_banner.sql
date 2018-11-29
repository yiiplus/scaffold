/*
 Navicat Premium Data Transfer

 Source Server         : mego-php
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost
 Source Database       : megeo

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : utf-8

 Date: 07/25/2018 16:35:13 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `acgn_banner`
-- ----------------------------
DROP TABLE IF EXISTS `acgn_banner`;
CREATE TABLE `acgn_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '关联类型；1二次元人物ID，2番剧ID，3版区ID，4榜首人物，5其他，6帖子',
  `related_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `name` varchar(32) DEFAULT NULL COMMENT '其他类型banner的名称',
  `url` varchar(300) DEFAULT NULL COMMENT 'banner地址',
  `jump_address` varchar(300) DEFAULT NULL COMMENT '跳转地址',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='发现banner';

-- ----------------------------
--  Records of `acgn_banner`
-- ----------------------------
BEGIN;
INSERT INTO `acgn_banner` VALUES ('1', '6', '10859', '', 'http://moego-prod-1256467324.file.myqcloud.com/picture/drama/fd583565-7eab-4d2f-aadf-15621bb57d75.jpg', '', '1', '0', null, null, null), ('2', '1', '2267', '', 'http://moego-prod-1256467324.file.myqcloud.com/picture/drama/1366939d-86b0-4de7-a6eb-b290b9d279cd.jpg', null, '2', '0', null, null, null), ('4', '3', '7212', '', 'http://moego-prod-1256467324.file.myqcloud.com/picture/drama/975a2723-c7d5-47e3-8e8a-20d22fec1126.jpg', null, '3', '0', null, null, null), ('5', '6', '10860', '', 'http://moego-prod-1256467324.file.myqcloud.com/picture/drama/294eeacd-075b-48e2-b016-249a25d372f8.jpg', null, '4', '0', null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
