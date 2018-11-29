# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.2.31 (MySQL 5.6.40)
# Database: megeo
# Generation Time: 2018-07-05 06:49:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table acgn_drama_style
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acgn_drama_style`;

CREATE TABLE `acgn_drama_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='番剧风格表';

LOCK TABLES `acgn_drama_style` WRITE;
/*!40000 ALTER TABLE `acgn_drama_style` DISABLE KEYS */;

INSERT INTO `acgn_drama_style` (`id`, `name`, `sort`, `is_del`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(5,'后宫',6,0,1528354606,0,NULL),
	(6,'百合',10,0,1528354606,0,NULL),
	(9,'少女',21,0,1528354606,0,NULL),
	(16,'日常',25,0,1528354606,0,NULL),
	(20,'热血',4,0,1528354606,0,NULL),
	(21,'治愈',27,0,1528354606,0,NULL),
	(22,'致郁',32,0,1528354606,0,NULL),
	(23,'运动',20,0,1528354606,0,NULL),
	(24,'少儿',35,0,1528354606,0,NULL),
	(44,'泡面',29,0,1528354606,0,NULL),
	(57,'奇幻',14,0,1528354606,0,NULL),
	(67,'历史',30,0,1528354606,0,NULL),
	(70,'搞笑',3,0,1528354606,0,NULL),
	(71,'科幻',12,0,1528354606,0,NULL),
	(72,'音乐',16,0,1528354606,0,NULL),
	(81,'萌系',2,0,1528354606,0,NULL),
	(82,'基腐',8,0,1528354606,0,NULL),
	(87,'猎奇',31,0,1528354606,0,NULL),
	(88,'时泪',33,0,1528354606,0,NULL),
	(93,'校园',17,0,1528354606,0,NULL),
	(94,'装逼',22,0,1528354606,0,NULL),
	(95,'战斗',24,0,1528354606,0,NULL),
	(98,'声控',28,0,1528354606,0,NULL),
	(103,'智斗',23,0,1528354606,0,NULL),
	(104,'催泪',5,0,1528354606,0,NULL),
	(105,'机战',7,0,1528354606,0,NULL),
	(106,'美食',34,0,1528354606,0,NULL),
	(110,'恋爱',9,0,1528354606,0,NULL),
	(115,'乙女',13,0,1528354606,0,NULL),
	(117,'轻改',1,0,1528354606,0,NULL),
	(121,'偶像',18,0,1528354606,0,NULL),
	(122,'魔法',26,0,1528354606,0,NULL),
	(124,'推理',15,0,1528354606,0,NULL),
	(125,'伪娘',11,0,1528354606,0,NULL),
	(127,'社团',19,0,1528354606,0,NULL),
	(135,'漫改',39,0,1528354606,0,NULL),
	(136,'游戏改',41,0,1528354606,0,NULL),
	(137,'原创',40,0,1528354606,0,NULL),
	(138,'励志',36,0,1528354606,0,NULL),
	(139,'神魔',38,0,1528354606,0,NULL),
	(140,'职场',37,0,1528354606,0,NULL),
	(1000,'推荐',100,0,0,0,NULL);

/*!40000 ALTER TABLE `acgn_drama_style` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
