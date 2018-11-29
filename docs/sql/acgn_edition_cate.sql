# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 10.0.72.117 (MySQL 5.6.40)
# Database: moego
# Generation Time: 2018-07-25 03:14:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table acgn_edition_cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acgn_edition_cate`;

CREATE TABLE `acgn_edition_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` int(11) DEFAULT '0' COMMENT '一级标签ID',
  `name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '分类类型；0普通分类，1我的关注分类，2番剧类型分类',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版区分类';

LOCK TABLES `acgn_edition_cate` WRITE;
/*!40000 ALTER TABLE `acgn_edition_cate` DISABLE KEYS */;

INSERT INTO `acgn_edition_cate` (`id`, `parent_id`, `name`, `type`, `is_del`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,0,'关注',1,0,0,0,NULL),
	(2,0,'热门',0,0,0,0,NULL),
	(3,0,'番剧',2,0,0,0,NULL),
	(4,0,'次元',0,0,0,0,NULL),
	(5,0,'日常',0,1,0,0,NULL),
	(7,2,'当前最热',0,0,0,0,NULL),
	(8,2,'热门番剧',0,0,0,0,NULL),
	(9,2,'上升最快',0,0,0,0,NULL),
	(10,4,'国漫',0,0,1,0,NULL),
	(11,4,'装扮',0,0,3,0,NULL),
	(12,4,'美漫',0,0,2,0,NULL),
	(13,4,'日漫',0,0,0,0,NULL),
	(14,5,'交友聊天',0,0,0,0,NULL),
	(15,5,'日常娱乐',0,0,0,0,NULL),
	(1000,0,'推荐',0,0,0,0,NULL);

/*!40000 ALTER TABLE `acgn_edition_cate` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
