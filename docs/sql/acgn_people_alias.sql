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

 Date: 29/09/2018 17:07:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acgn_people_alias
-- ----------------------------
DROP TABLE IF EXISTS `acgn_people_alias`;
CREATE TABLE `acgn_people_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(64) NOT NULL COMMENT '别名',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除：0-正常；1-删除',
  `created_at` int(11) DEFAULT '0' COMMENT '添加时间',
  `updated_at` int(11) DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT '0' COMMENT '删除时间',
  `people_id` int(11) NOT NULL COMMENT '番剧人物 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT=' 二次元人物别名';

SET FOREIGN_KEY_CHECKS = 1;
