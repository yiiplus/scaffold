/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3308
 Source Schema         : moego

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 29/09/2018 17:06:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acgn_drama_alias
-- ----------------------------
DROP TABLE IF EXISTS `acgn_drama_alias`;
CREATE TABLE `acgn_drama_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(64) NOT NULL COMMENT '别名',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除：0-正常；1-删除',
  `created_at` int(11) DEFAULT '0' COMMENT '添加时间',
  `updated_at` int(11) DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT '0' COMMENT '删除时间',
  `drama_id` int(11) NOT NULL COMMENT '番剧 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT=' 番剧别名';

SET FOREIGN_KEY_CHECKS = 1;
