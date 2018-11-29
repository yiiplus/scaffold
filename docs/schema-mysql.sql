/**
 * Database Schema
 */

SET FOREIGN_KEY_CHECKS=0;

/* 创建数据库 */
DROP DATABASE IF EXISTS `moego`;
CREATE DATABASE `moego`;
USE `moego`;

/************ RBAC ***************/
DROP TABLE IF EXISTS `auth_assignment`;
DROP TABLE IF EXISTS `auth_item_child`;
DROP TABLE IF EXISTS `auth_item`;
DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule`
(
   `name`                 varchar(64) not null,
   `data`                 blob,
   `created_at`           integer,
   `updated_at`           integer,
    primary key (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC-rule';

CREATE TABLE `auth_item`
(
   `name`                 varchar(64) not null,
   `type`                 smallint not null,
   `description`          text,
   `rule_name`            varchar(64),
   `data`                 blob,
   `created_at`           integer,
   `updated_at`           integer,
   primary key (`name`),
   foreign key (`rule_name`) references `auth_rule` (`name`) on delete set null on update cascade,
   key `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC-item';

CREATE TABLE `auth_item_child`
(
   `parent`               varchar(64) not null,
   `child`                varchar(64) not null,
   primary key (`parent`, `child`),
   foreign key (`parent`) references `auth_item` (`name`) on delete cascade on update cascade,
   foreign key (`child`) references `auth_item` (`name`) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC-itemChild';

CREATE TABLE `auth_assignment`
(
   `item_name`            varchar(64) not null,
   `user_id`              varchar(64) not null,
   `created_at`           integer,
   primary key (`item_name`, `user_id`),
   foreign key (`item_name`) references `auth_item` (`name`) on delete cascade on update cascade,
   key `auth_assignment_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC-assignment';

-- ----------------------------
-- Records of auth_assignment 
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('超级管理员', '1', '1487817340');

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1487816675', '1487816675');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/create', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/update', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/inactive', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1487816732', '1487816732');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', null, null, null, '1487817275', '1487817275');

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/inactive');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/site/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/site/error');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/site/index');


/************ AdminLTE ***************/
DROP TABLE IF EXISTS `admin_user`;
DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_user` (
  `id`                   int(11) NOT NULL AUTO_INCREMENT,
  `username`             varchar(255) NOT NULL,
  `auth_key`             varchar(32) NOT NULL,
  `password_hash`        varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email`                varchar(255) NOT NULL,
  `status`               smallint(6) NOT NULL DEFAULT '10',
  `created_at`           int(11) NOT NULL,
  `updated_at`           int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员用户';

CREATE TABLE `admin_menu` (
 `id`                    int(11) NOT NULL AUTO_INCREMENT,
 `name`                  varchar(128) NOT NULL,
 `parent`                int(11) DEFAULT NULL,
 `route`                 varchar(256) DEFAULT NULL,
 `order`                 int(11) DEFAULT NULL,
 `data`                  text,
 PRIMARY KEY (`id`),
 KEY `parent` (`parent`),
 CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `admin_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员菜单';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES (1,'webmaster','UKpH8-7IxZXSLzcOU7ooSaUHwPYq9BLp','$2y$13$HylJs5OBsNBcnI4DCVQuqeGeIvr1/JqXrkOnhRtDKJsRoGGAfRu5e',NULL,'webmaster@example.com',10,1504106471,1504106471);

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '仪表盘', null, '/', '100', '{"icon":"dashboard"}');
INSERT INTO `admin_menu` VALUES ('2', '系统设置', null, null, '200', '{"icon":"cog"}');
INSERT INTO `admin_menu` VALUES ('3', '菜单列表', '2', '/admin/menu/index', '1', '{"icon":"list"}');
INSERT INTO `admin_menu` VALUES ('4', '用户管理', '2', '/admin/user/index', '2', '{"icon":"user"}');
INSERT INTO `admin_menu` VALUES ('5', '角色列表', '2', '/admin/role/index', '3', '{"icon":"users"}');
INSERT INTO `admin_menu` VALUES ('6', '访问控制', '2', null, '4', '{"icon":"laptop"}');
INSERT INTO `admin_menu` VALUES ('7', '路由列表', '6', '/admin/route/index', '61', '{"icon":"circle"}');
INSERT INTO `admin_menu` VALUES ('8', '规则列表', '6', '/admin/rule/index', '62', '{"icon":"circle"}');
INSERT INTO `admin_menu` VALUES ('9', '权限列表', '6', '/admin/permission/index', '63', '{"icon":"circle"}');

/************ 二次元模块 ***************/
CREATE TABLE `acgn_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '关联类型；0二次元人物ID，1番剧ID，2版区ID',
  `related_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `url` varchar(300) DEFAULT NULL COMMENT 'banner地址',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发现banner';

CREATE TABLE `acgn_edition_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `parent_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '分类类型；0普通分类，1我的关注分类，2番剧类型分类',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版区分类';

CREATE TABLE `acgn_edition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '版区类型，0番剧版区，1非番剧版区',
  `cover` text COMMENT '封面',
  `cate_id` int(11) NOT NULL COMMENT '热门标签（版区分类type为0的分类）',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_cateID_isDel` (`cate_id`, `is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版区';

CREATE TABLE `acgn_edition_cate_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `edition_id` int(11) NOT NULL COMMENT '版区ID',
  `cate_id` int(11) NOT NULL COMMENT '版区分类ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_editionId_cateId` (`edition_id`,`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版区版区分类关联表';

CREATE TABLE `acgn_edition_drama_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `edition_id` int(11) NOT NULL COMMENT '版区ID',
  `drama_id` int(11) NOT NULL COMMENT '番剧ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_editionID_dramaId_isDel` (`edition_id`, `drama_id`, `is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版区番剧关联表';

CREATE TABLE `acgn_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `head_thumb` text COMMENT '头像',
  `data` text COMMENT '人物资料',
  `popular` tinyint(1) unsigned DEFAULT '0' COMMENT '热门；0非热门，1热门',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_new_people` tinyint(1) NOT NULL COMMENT '是否是新人，0非新人，1是新人',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_isNewPeople_isDel` (`is_new_people`, `is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='二次元人物库';

CREATE TABLE `acgn_people_data_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `url` varchar(300) DEFAULT NULL COMMENT '图片url',
  `width` varchar(20) DEFAULT NULL COMMENT '宽度',
  `height` varchar(20) DEFAULT NULL COMMENT '高度',
  `people_id` int(11) NOT NULL COMMENT '番剧人物Id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_peopleId_isDel` (`people_id`, `is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='二次元人物资料图片表';

CREATE TABLE `acgn_drama` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `cover` text COMMENT '封面',
  `address` varchar(32) DEFAULT NULL COMMENT '地区',
  `start_time` int(11) DEFAULT NULL COMMENT '开播时间',
  `desc` text COMMENT '番剧资料',
  `play_connection` text COMMENT '播放连接',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0：连载，1：完结',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `other_id` int(11) DEFAULT '0' COMMENT '第三方平台Id',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '数据来源',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_name_isDel` (`name`, `is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='番剧库';

CREATE TABLE acgn_drama_style (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `name` varchar(32) NOT NULL COMMENT '名称',
 `sort` int(11) DEFAULT '0' COMMENT '排序',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) DEFAULT null COMMENT '创建时间',
 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
 PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='番剧风格表';

CREATE TABLE `acgn_drama_style_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `drama_id` int(11) NOT NULL COMMENT '番剧ID',
  `style_id` int(11) NOT NULL COMMENT '风格ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT null COMMENT '创建时间',
  `updated_at` int(11) DEFAULT null COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_drama_id` (`drama_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='番剧风格关联表';

CREATE TABLE acgn_drama_people_related (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `people_id` int(11) NOT NULL COMMENT '人物ID',
 `drama_id` int(11) NOT NULL COMMENT '番剧ID',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `drama_with_people` (`drama_id`, `people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人物番剧关联表';

/************ 股票模块 ***************/
CREATE TABLE stock (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `people_id` int(11) NOT NULL COMMENT '二次元人物ID',
 `crowdfunding_id` int(11) DEFAULT null COMMENT '众筹ID',
 `listing_status` tinyint(1) DEFAULT '0' COMMENT '上市状态，0：未上市，1：上市中，2：已退市',
 `listing_channel` tinyint(1) DEFAULT '0' COMMENT '上市渠道，0：官方上市，1：集资上市',
 `price` double(10,3) COMMENT '股价',
 `quote_change` varchar(32) DEFAULT 0 COMMENT '涨跌幅（跟凌晨4点做对比）',
 `number_mcg` varchar(10) COMMENT '股票次数维持累计涨幅 X%',
 `community_heat_mcg` varchar(10) COMMENT 'App热度维持累计涨幅',
 `dividend_day` tinyint(1) COMMENT '分红日，1代表周一以此类推',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `start_at` int(11) DEFAULT NULL COMMENT '起始时间',
 `end_at` int(11) DEFAULT NULL COMMENT '结束时间',
 `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
 `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (`id`),
 KEY `people` (`people_id`),
 KEY `index_del_listing_status` (`is_del`,`listing_status`),
 KEY `index_dividend_day_is_del` (`dividend_day`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股票表';

CREATE TABLE `stock_user_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `stock_id` int(11) NOT NULL DEFAULT '0' COMMENT '股票id',
  `stock_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '股票类型；0代表正常股，1代表黑股',
  `stock_listing_channel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上市渠道；0：官方上市，1：集资上市',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投资类型，0筹码，1金币',
  `chips` int(11) DEFAULT '0' COMMENT '投资筹码',
  `gold` double(10,3) DEFAULT '0.00' COMMENT '投资金币',
  `stock_numbers` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '股票数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除(冻结)；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_uid_stock_type_stock_id` (`uid`,`stock_type`,`stock_id`),
  KEY `index_del_uid` (`is_del`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户股票表';

CREATE TABLE `stock_user_allocation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `stock_id` int(11) NOT NULL DEFAULT '0' COMMENT '股票id',
  `stock_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''股票类型；0代表正常股，1代表黑股''',
  `stock_listing_channel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上市渠道；0：官方上市，1：集资上市',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投资类型；0代表普通投资，1代表超级投资',
  `chips` int(11) DEFAULT '0' COMMENT '投资筹码',
  `gold` double(10,3) DEFAULT '0' COMMENT '投资金币',
  `stock_numbers` varchar(20) NOT NULL DEFAULT '0' COMMENT '股票数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COMMENT='股票分配表';

CREATE TABLE stock_crowdfunding_config (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `people_id`  int(11) NOT NULL COMMENT '人物ID',
 `need_crowdfunding` int(11) NOT NULL COMMENT '需要众筹的资金 M',
 `open_crowdfunding` int(11) NOT NULL COMMENT '开启众筹资金',
 `number`  int(11) NOT NULL COMMENT '众筹次数',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `people` (`people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='众筹配置表';

CREATE TABLE stock_price_manage (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `stock_id`  int(11) NOT NULL COMMENT '股票ID',
 `desc` text NOT NULL COMMENT '说明',
 `gd` varchar(10) NOT NULL COMMENT '涨跌幅',
 `effective_time` int(11) NOT NULL COMMENT '生效时间',
 `status` tinyint(1) DEFAULT '0' COMMENT '状态，0代表未被执行，1代表已被执行，3代表被撤销',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `stock_with_effective_time_select_gd` (`stock_id`, `gd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='外界客观资讯涨跌表';

CREATE TABLE stock_dividend_activity (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `stock_id`  int(11) NOT NULL COMMENT '股票ID',
 `desc` text NOT NULL COMMENT '说明',
 `gold` double(10,3) NOT NULL COMMENT '金币',
 `investment_type` tinyint(1) DEFAULT '0' COMMENT '投资类型，0代表正常股，1代表黑股',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `stock` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动分红表';

CREATE TABLE `stock_user_investment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sn` bigint(30) NOT NULL COMMENT '投资单号',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `stock_id` int(11) NOT NULL COMMENT '股票ID',
  `stock_type` tinyint(1) DEFAULT '0' COMMENT '股票类型；0代表正常股，1代表黑股',
  `stock_listing_channel` tinyint(1) DEFAULT '0' COMMENT '上市渠道；0：官方上市，1：集资上市',
  `type` tinyint(1) DEFAULT '0' COMMENT '投资类型；0代表普通投资，1代表超级投资',
  `chips` int(11) DEFAULT '0' COMMENT '投资筹码',
  `gold` double(10,3) DEFAULT '0' COMMENT '投资金币',
  `weights` int(11) DEFAULT NULL COMMENT '权重',
  `numbers` int(11) DEFAULT NULL COMMENT '次数',
  `stock_numbers` int(11) DEFAULT NULL COMMENT '股票数',
  `investment_at` int(11) NOT NULL COMMENT '投资时间',
  `is_allocation` tinyint(1) DEFAULT '0' COMMENT '是否已经分配股票；0未分配；1已分配',
  `is_dividend` tinyint(1) DEFAULT '0' COMMENT '是否已经进入分红池；0未进入；1已进入',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user` (`uid`),
  KEY `stock_with_user_investment_at` (`stock_id`,`uid`,`investment_at`),
  KEY `is_del_stock_id_investment_at_idx` (`stock_id`,`is_del`,`stock_type`,`investment_at`),
  KEY `index_is_dividend_is_allocation_is_del_investment_at` (`is_dividend`,`is_allocation`,`is_del`,`investment_at`),
  KEY `index_investment_at_del` (`investment_at`,`is_del`),
  KEY `index_stock_id_del_investment_at_stock_type` (`stock_id`,`is_del`,`investment_at`,`stock_type`),
  KEY `index_del_investment_at_stock_id` (`is_del`,`investment_at`,`stock_id`),
  KEY `index_id_stock_id_investment_at` (`id`,`stock_id`,`investment_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股票用户投资表';

CREATE TABLE stock_user_dividend_today_logs (
	 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	 `sn` bigint(50) NOT NULL COMMENT '分红单号',
	 `uid` int(11) NOT NULL COMMENT '用户ID',
	 `stock_id` int(11) NOT NULL COMMENT '股票ID',
	 `gold` int(11) NOT NULL COMMENT '分红金额',
	 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
	 `stock_type` tinyint(1) DEFAULT '0' COMMENT '分红类型，0为正常股分红，1为黑股分红',
	 `created_at` int(11) NOT NULL COMMENT '创建时间',
	 `updated_at` int(11) NOT NULL COMMENT '更新时间',
	 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
	 PRIMARY KEY (id),
	 KEY `user_with_stock` (`uid`, `stock_id`),
	 KEY `index_del_stock_id_created_at_stock_type` (`is_del`,`stock_id`,`created_at`,`stock_type`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分红日记录表';

	CREATE TABLE `stock_user_dividend_week_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `sn` int(11) NOT NULL COMMENT '分红单号',
  `stock_id` int(11) NOT NULL COMMENT '股票ID',
  `gold` double(10,3) NOT NULL COMMENT '金币股息',
  `stock_type` tinyint(1) DEFAULT '0' COMMENT '分红类型，0为正常股分红，1为黑股分红',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_with_stock` (`stock_id`),
  KEY `index_uid_stock_id_created_at` (`uid`,`stock_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分红周记录表';

CREATE TABLE stock_crowdfunding_bonus (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `stock_id` int(11) NOT NULL COMMENT '股票ID',
 `number` int(11) NOT NULL COMMENT '集资上市次数',
 `pbs` int(11) NOT NULL COMMENT '永久加成',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `stock` (`stock_id`, `number`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='众筹加成表';

CREATE TABLE stock_price (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `stock_id` int(11) NOT NULL COMMENT '股票ID',
 `price` double(10,3) NOT NULL COMMENT '实时股价',
 `time` int(11) NOT NULL COMMENT '变动时间',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `stock_with_time_select_price` (`stock_id`, `time`, `price`),
 KEY `index_time_stock_id` (`time`,`stock_id`),
 KEY `index_del_stock_id_time` (`is_del`,`stock_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股价表';

CREATE TABLE `stock_price_rise_fall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL DEFAULT '0' COMMENT '股票id',
  `quote_change` double(10,3) NOT NULL DEFAULT '0.000' COMMENT '涨跌幅',
  `is_del` tinyint(4) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_stock_id_id` (`stock_id`,`id`),
  KEY `index_del_stock_id` (`is_del`,`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股价变动涨跌幅表';

CREATE TABLE `stock_crowdfunding` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sn` bigint(50) NOT NULL COMMENT '众筹单号',
  `stock_id` int(11) DEFAULT NULL COMMENT '股票ID',
  `people_id` int(11) NOT NULL COMMENT '二次元人物ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `min_funding_limit` int(11) NOT NULL COMMENT '最小募捐限制',
  `crowdfunding_days` int(11) NOT NULL COMMENT '众筹天数',
  `need_crowdfunding` int(11) NOT NULL COMMENT '需要众筹的资金 M',
  `open_crowdfunding` int(11) NOT NULL COMMENT '开启众筹资金',
  `open_crowdfunding_time` int(11) DEFAULT NULL COMMENT '开启众筹时间',
  `end_crowdfunding_time` int(11) DEFAULT NULL COMMENT '结束众筹时间',
  `already_raised_funds` int(11) NOT NULL COMMENT '以众筹资金',
  `lock_version` bigint(11) DEFAULT '0' COMMENT '锁（悲观锁）版本号',
  `status` tinyint(1) DEFAULT '0' COMMENT '众筹状态，状态，0代表等待开启众筹，1代表正在进行众筹，2代表众筹成功已上市',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `people_with_status` (`people_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='众筹表';

CREATE TABLE stock_crowdfunding_transactions (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `sn` bigint(50) NOT NULL COMMENT '交易单号',
 `uid` int(11) NOT NULL COMMENT '用户ID',
 `crowdfunding_id` int(11) NOT NULL COMMENT '众筹ID',
 `price` double(10,3) NOT NULL COMMENT '众筹金额',
 `type` tinyint(1) DEFAULT '0' COMMENT '众筹类型；0真爱粉，1黑粉',
 `status` tinyint(1) NOT NULL COMMENT '状态',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `crowdfunding_with_user` (`crowdfunding_id`, `uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='众筹交易表';

CREATE TABLE stock_crowdfunding_directors (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `stock_id` int(11) NOT NULL COMMENT '股票ID',
 `crowdfunding_id` int(11) NOT NULL COMMENT '众筹ID',
 `people_id` int(11) NOT NULL COMMENT '二次元人物ID',
 `uid` int(11) NOT NULL COMMENT '用户ID',
 `level_id` int(11) COMMENT '董事级别',
 `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
 PRIMARY KEY (id),
 KEY `crowdfunding_select_user` (`crowdfunding_id`, `uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='众筹董事席';

CREATE TABLE stock_crowdfunding_directors_level (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `level`  varchar(32) NOT NULL COMMENT '董事级别',
 `free_gift` int(11) NOT NULL COMMENT '赠送股票数',
 `created_at` int(11) NOT NULL COMMENT '创建时间',
 `updated_at` int(11) NOT NULL COMMENT '更新时间',
 PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='董事级别表';

/************ 用户模块 ***************/
CREATE TABLE user (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `username` varchar(255) NOT NULL COMMENT '登陆用户名',
 `moego_code` varchar(255) NOT NULL COMMENT '萌股号',
 `auth_key` varchar(32) NOT NULL COMMENT 'AUTH KEY',
 `password_hash` varchar(60) NOT NULL COMMENT '密码hash',
 `password_reset_token` varchar(60)  DEFAULT NULL COMMENT '重置密码token',
 `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
 `avatar` text DEFAULT NULL COMMENT '头像',
 `age` varchar(32) DEFAULT NULL COMMENT '年龄',
 `background_picture` text DEFAULT NULL COMMENT '背景图片',
 `photo_walls` text DEFAULT NULL COMMENT '用户照片墙',
 `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
 `sex` tinyint(1) DEFAULT 2 COMMENT '性别，0:女，1:男，2:未设置性别',
 `area` varchar(32) DEFAULT NULL COMMENT '地区',
 `signature` varchar(60) DEFAULT NULL COMMENT '个性签名',
 `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
 `birthday` varchar(32) DEFAULT NULL COMMENT '生日',
 `qq_openid` varchar(60) DEFAULT NULL COMMENT 'qq互联唯一标志',
 `wechat_unionid` varchar(60) DEFAULT NULL COMMENT '微信登录唯一标志',
 `role_id` int(11) DEFAULT 0 COMMENT '用户角色ID',
 `status` smallint(6)  DEFAULT '10' COMMENT '状态码',
 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) DEFAULT 0 COMMENT '创建时间',
 `updated_at` int(11) DEFAULT 0 COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT 00 COMMENT '删除时间',
 PRIMARY KEY (`id`),
 UNIQUE KEY `phone` (`phone`),
 KEY `index_phone_isDel` (`phone`,`is_del`),
 KEY `index_nickname_isDel` (`nickname`,`is_del`),
 KEY `index_qqOpenid_isDel` (`qq_openid`,`is_del`),
 KEY `index_wechatUnionid_isDel` (`wechat_unionid`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE user_assets (
	 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	 `uid`  int(11) NOT NULL COMMENT '用户ID',
	 `gold` double(10,3) DEFAULT 0 COMMENT '持有金币',
	 `diamond` double(10,3) DEFAULT 0 COMMENT '持有钻石',
	 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
	 `created_at` int(11) DEFAULT null COMMENT '创建时间',
	 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
	 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
	 PRIMARY KEY (`id`),
	 KEY `index_uid_isDel` (`uid`,`is_del`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户资产表';

CREATE TABLE user_follow (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `uid`  int(11) NOT NULL COMMENT '用户ID',
 `follow_id` int(11) NOT NULL COMMENT '关注ID',
 `type` tinyint(1) DEFAULT 0 COMMENT '关注类型，0人物，1番剧，2版区',
 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) DEFAULT null COMMENT '创建时间',
 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
 PRIMARY KEY (`id`),
 KEY `index_uid_followId_type_isDel` (`uid`,`follow_id`,`type`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人物关注关系表';

CREATE TABLE user_relation (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `from_user_id` int(11) NOT NULL COMMENT '发起用户ID',
 `to_user_id` int(11) NOT NULL COMMENT '接受用户ID',
 `rel_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '事情类型，0:关注，1:拉黑',
 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
 `created_at` int(11) DEFAULT null COMMENT '创建时间',
 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
 PRIMARY KEY (`id`),
 KEY `index_fromUserId_toUserId_relType_isDel` (`from_user_id`, `to_user_id`, `rel_type`, `is_del`),
 KEY `index_toUserId_fromUserId_relType_isDel` (`to_user_id`, `from_user_id`, `rel_type`, `is_del`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户间关系表';

CREATE TABLE user_tag (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `uid`  int(11) NOT NULL COMMENT '用户ID',
 `acgn_people_id` int(11) NOT NULL COMMENT '二次元人物ID',
 `type` tinyint(1) DEFAULT 0 COMMENT '标签类型，0等级标签，1董事标签，2榜首标签',
 `type_val` tinyint(1) DEFAULT 0 COMMENT '类型值，等级标签为等级，董事标签 0董事会 1董事长，榜首标签为0榜首',
 `is_show` tinyint(1) DEFAULT 0 COMMENT '是否展示；0不展示；1展示',
 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
 `tag_type` tinyint(1) DEFAULT 0 COMMENT '状态；0普通股；1黑股',
 `created_at` int(11) DEFAULT null COMMENT '创建时间',
 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
 PRIMARY KEY (`id`),
 KEY `index_uid_isDel` (`uid`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户标签表';

CREATE TABLE user_task (
	 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	 `title`  varchar(50) NOT NULL COMMENT '标题',
	 `desc` text NOT NULL COMMENT '简介',
	 `button_content` varchar(32) NOT NULL COMMENT '按钮内容',
	 `gold` double(10,3) DEFAULT 0 COMMENT '奖励金币数',
	 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
	 `function` varchar(32) NOT NULL COMMENT '任务方法名',
	 `created_at` int(11) DEFAULT null COMMENT '创建时间',
	 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
	 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
	 PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户任务表';

-- ----------------------------
-- 添加现有任务
-- ----------------------------
INSERT INTO `user_task` VALUES (1,'签到', '签到','签到','50.00',0,'signAddGlod','','','');
INSERT INTO `user_task` VALUES (2,'点赞', '点赞','去点赞','100.00',0,'likeAddGlod','','','');
INSERT INTO `user_task` VALUES (3,'用硬币投资', '用硬币投资','去投资','150.00',0,'chipInvestmentAddGlod','','','');
INSERT INTO `user_task` VALUES (4,'用萌币投资', '用萌币投资','去投资','150.00',0,'goldnvestmentAddGlod','','','');
INSERT INTO `user_task` VALUES (5,'发帖', '发帖','去发帖','200.00',0,'postAddGlod','','','');
INSERT INTO `user_task` VALUES (6,'评论', '评论','去评论','100.00',0,'commentAddGlod','','','');
INSERT INTO `user_task` VALUES (7,'分享', '分享','去分享','150.00',0,'shareAddGlod','','','');

CREATE TABLE user_task_related (
	 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	 `uid`  int(11) NOT NULL COMMENT '用户ID',
	 `task_id`  int(11) NOT NULL COMMENT '任务ID',
	 `status` tinyint(1) DEFAULT 0 COMMENT '完成状态，0为未完成，1为已完成',
	 `is_del` tinyint(1) DEFAULT 0 COMMENT '状态；0正常；1主动删除；2后台删除',
	 `created_at` int(11) DEFAULT null COMMENT '创建时间',
	 `updated_at` int(11) DEFAULT null COMMENT '更新时间',
	 `finish_time` int(11) NOT NULL COMMENT '签到时间',
	 `deleted_at` int(11) DEFAULT null COMMENT '删除时间',
	 PRIMARY KEY (`id`),
	 KEY `index_uid_isDel` (`uid`,`is_del`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户任务关联关系表';

CREATE TABLE `user_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `related_id` int(11) NOT NULL COMMENT '关联ID',
  `type` tinyint(1) DEFAULT '0' COMMENT '关注类型；0帖子，1资讯，3版区',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常，1主动删除，2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `browsed_at` int(11) NOT NULL COMMENT '浏览时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_with_type_select_attention_id` (`uid`,`type`,`related_id`),
  KEY `attention_id_with_type_select_user` (`related_id`,`type`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户浏览历史表';

/************ 社区模块 ***************/
CREATE TABLE `bbs_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(30) COMMENT '帖子标题',
  `content` varchar(2600) NOT NULL COMMENT '帖子内容@好友',
  `label` varchar(50) NOT NULL COMMENT '帖子标签',
  `edition_id` int(11) NOT NULL COMMENT '版区id',
  `lat` varchar(50) DEFAULT '0' COMMENT '纬度',
  `lng` varchar(50) DEFAULT '0' COMMENT '经度',
  `location` varchar(200) DEFAULT NULL COMMENT '发帖地址',
  `examin` int(11) DEFAULT '0' COMMENT '后台审核人',
  `operating_time` int(11) DEFAULT NULL COMMENT '审核时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶状态；0取消置顶；1添加置顶',
  `topped_at` int(11) DEFAULT '0' COMMENT '置顶时间',
  `is_essence` tinyint(1) DEFAULT '0' COMMENT '精华状态；0取消精华；1添加精华',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_id_isDel` (`id`,`is_del`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "帖子表";

CREATE TABLE `bbs_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '0帖子 1资讯',
  `name` varchar(30) NOT NULL COMMENT '名字',
  `is_hot` tinyint(1) NOT NULL COMMENT '热门；0自定义；1热门',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_id_isDel` (`id`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "标签表";

CREATE TABLE `bbs_picture` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `related_id` int(20) NOT NULL COMMENT '关联id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0帖子，1评论',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0图片，1语音',
  `url` varchar(320) NOT NULL COMMENT '资源路径',
  `examin` int(20) NOT NULL DEFAULT '0' COMMENT '后台审核人',
  `operating_time` int(11) NOT NULL COMMENT '审核时间',
  `is_del` int(11) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relatedid_type_is_del_index` (`related_id`,`type`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片音频表';

CREATE TABLE `bbs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '帖子/资讯id',
  `type` tinyint(1) NOT NULL COMMENT '0帖子 1资讯',
  `initiator_uid` int(10) NOT NULL COMMENT '发起人用户id',
  `receiver_uid` int(10) DEFAULT NULL COMMENT '接收人用户id',
  `content` text DEFAULT NULL COMMENT '评论内容@好友',
  `parent_id` int(11) DEFAULT '0' COMMENT '回复父级id',
  `floor` int(10) DEFAULT '0' COMMENT '楼层id',
  `examin` int(11) DEFAULT '0' COMMENT '后台审核人',
  `operating_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `index_type_pid_parentId_isDel_initiatorUid` (`type`,`pid`,`parent_id`,`is_del`,`initiator_uid`),
  KEY `index_floor` (`floor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "评论表";

CREATE TABLE `bbs_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '帖子/资讯id',
  `type` tinyint(1) NOT NULL COMMENT '0帖子 1资讯',
  `initiator_uid` int(10) NOT NULL COMMENT '发起人用户id',
  `receiver_uid` int(10) DEFAULT NULL COMMENT '接收人用户id',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_id_isDel` (`id`,`is_del`),
  KEY `index_pid_type_initiatorUid` (`pid`,`type`,`initiator_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "点赞表";

CREATE TABLE `bbs_forwarding` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子/资讯id',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '0帖子 1资讯',
  `initiator_uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `receiver_uid` int(10) NOT NULL DEFAULT '0' COMMENT '接收人用户id',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "转发表";

CREATE TABLE `bbs_post_redpack` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `pid` int(10) NOT NULL COMMENT '关联帖子id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包类型；0等额红包；1随机红包',
  `redpack_num` int(10) NOT NULL DEFAULT '0' COMMENT '红包个数',
  `auger_num` int(10) NOT NULL DEFAULT '0' COMMENT '钻石个数',
  `end_time` int(10) NOT NULL COMMENT '截止时间',
  `figure` int(10) NOT NULL COMMENT '关联人物id',
  `stock_type` int(10) NOT NULL DEFAULT '0' COMMENT '股票类型；0正常股；1黑股',
  `stock_num` int(10) NOT NULL COMMENT '持有股票数量',
  `invest_conditions` int(10) COMMENT '投资条件',
  `back_amount` varchar(100) NOT NULL DEFAULT '0' COMMENT '过期退还红包金额',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态；0创建成功;1已领光;2已过期',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "红包表";

CREATE TABLE `bbs_redpack_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rid` int(11) NOT NULL COMMENT '红包关联id',
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `amount` varchar(50) NOT NULL DEFAULT '0' COMMENT '领取钻石',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取状态；0待开奖；1已中奖；2未中奖',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "红包记录表";

CREATE TABLE `bbs_hot_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_id` int(11) NOT NULL COMMENT '版区ID，帖子ID，资讯分类id',
  `current_id` int(11) NOT NULL COMMENT '帖子/评论/资讯id',
  `type` int(10) NOT NULL COMMENT '0帖子 1评论 2资讯',
  `like_num` int(10) DEFAULT '0' COMMENT '点赞数',
  `forward_num` int(10) DEFAULT '0' COMMENT '转发数',
  `comment_num` int(10) DEFAULT '0' COMMENT '评论数',
  `depart_comment_num` int(10) DEFAULT '0' COMMENT '楼层回复数',
  `score` int(12) DEFAULT '0' COMMENT '总分值',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_type_score` (`type`,`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "热度分值表";

CREATE TABLE `bbs_post_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `initiator_uid` int(10) NOT NULL COMMENT '发起人用户id',
  `receiver_uid` int(10) NOT NULL COMMENT '接收人用户id',
  `content` varchar(2600) NOT NULL COMMENT '评论内容@好友',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '回复父级id',
  `examin` varchar(20) COMMENT '后台审核人',
  `operating_time` int(11) NOT NULL COMMENT '审核时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `deleted_at` int(11) COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `id_is_del_index` (`id`,`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "评论表";

CREATE TABLE `bbs_post_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `initiator_uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `receiver_uid` int(10) NOT NULL DEFAULT '0' COMMENT '接收人用户id',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "点赞表";

CREATE TABLE `bbs_post_forwarding` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `initiator_uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `receiver_uid` int(10) NOT NULL DEFAULT '0' COMMENT '接收人用户id',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "转发表";

CREATE TABLE `bbs_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `content` varchar(2600) NOT NULL COMMENT '内容',
  `label` varchar(50) NOT NULL COMMENT '标签',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1删除',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶状态；0取消置顶；1添加置顶',
  `is_essence` tinyint(1) DEFAULT '0' COMMENT '精华状态；0取消精华；1添加精华',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `id_is_del_index` (`id`,`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "资讯表";

/************ 公共模块 ***************/
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` int(11) NOT NULL COMMENT '父ID',
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_range` varchar(255) NOT NULL,
  `store_dir` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT '50',
  `value` varchar(255) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

-- ----------------------------
-- 添加配置数据
-- ----------------------------
INSERT INTO `setting` VALUES ('11', '0', 'stockConfiguration', 'group', '', '', '50', '', '股票配置'),
 ('21', '0', 'dividendConfiguration', 'group', '', '', '50', '', '分红配置'),
 ('31', '0', 'stockPriceInfluences', 'group', '', '', '50', '', '股价影响参数'),
 ('41', '0', 'frontEndDatabaseVersion', 'group', '', '', '50', '', '前端数据库版本'),
 ('51', '0', 'Instructions', 'group', '', '', '50', '', '说明配置'),
 ('1111', '11', 'initialStockPrice', 'text', '', '', '20', '20', '初始股价'),
 ('1112', '11', 'dailyAdditionalBonuses', 'text', '', '', '50', '0', '每天股数额外加成'),
 ('1113', '11', 'dailyLimit', 'text', '', '', '50', '4', '每天涨跌限制(股价)'),
 ('1114', '11', 'minFundingLimit', 'text', '', '', '50', '1000', '最小募捐限制'),
 ('1115', '11', 'ordinaryInvestmentChips', 'text', '', '', '50', '1', '普通投资所需筹码'),
 ('1116', '11', 'ordinaryInvestmentGold', 'text', '', '', '50', '1000', '普通投资所需金币'),
 ('1117', '11', 'ordinaryInvestmentWWO', 'text', '', '', '50', '1', '普通投资权重(官方上市)'),
 ('1118', '11', 'ordinaryInvestmentNWO', 'text', '', '', '50', '1', '普通投资次数(官方上市)'),
 ('1119', '11', 'ordinaryInvestmentWWC', 'text', '', '', '50', '1', '普通投资权重(众筹上市)'),
 ('1120', '11', 'ordinaryInvestmentNWC', 'text', '', '', '50', '1', '普通投资次数(众筹上市)'),
 ('1121', '11', 'advancedInvestmentChips', 'text', '', '', '50', '3', '高级投资所需筹码'),
 ('1122', '11', 'advancedInvestmentGold', 'text', '', '', '50', '3000', '高级投资所需金币'),
 ('1123', '11', 'advancedInvestmentWWO', 'text', '', '', '50', '2', '高级投资权重(官方上市)'),
 ('1124', '11', 'advancedInvestmentNWO', 'text', '', '', '50', '2', '高级投资次数(官方上市)'),
 ('1125', '11', 'advancedInvestmentWWC', 'text', '', '', '50', '2', '高级投资权重(众筹上市)'),
 ('1126', '11', 'advancedInvestmentNWC', 'text', '', '', '50', '2', '高级投资次数(众筹上市)'),
 ('1127', '11', 'dailyInvestmentChipsMax', 'text', '', '', '50', '3', '每天投资筹码上限'),
 ('1128', '11', 'dailyInvestmentGoldMax', 'text', '', '', '50', '3000', '每天投资金币上限'),
 ('1129', '11', 'crowdfundingDays', 'text', '', '', '7', '7', '众筹天数'),
 ('2111', '21', 'goldCoinBase', 'text', '', '', '50', '500', '金币基数'),
 ('2112', '21', 'minParameterInvestment', 'text', '', '', '50', '1', '最低参数投资次数'),
 ('3111', '31', 'stocksRise', 'text', '', '', '50', '0', '股票排行涨幅 B%'),
 ('3112', '31', 'lowPoint', 'text', '', '', '50', '0.04', '股票变动维持的低点值 C%'),
 ('3113', '31', 'stackedGains', 'text', '', '', '50', '0.01', '每次浮动（跌/涨） D%'),
 ('3114', '31', 'accumulatedMaxG', 'text', '', '', '50', '1', '累计最大涨幅度 E%'),
 ('3115', '31', 'accumulatedMinD', 'text', '', '', '50', '-1', '累计最低跌幅度 F%'),
 ('3116', '31', 'communityHeatD', 'text', '', '', '50', '0.01', '社区热度跌幅 G%'),
 ('3117', '31', 'communityHeatAddition', 'text', '', '', '50', '0', '社区热度加成(六上5)'),
 ('4111', '41', 'PeopleFdbVersion', 'text', '', '', '50', '1', '前端人物版本'),
 ('5000', '51', 'investmentChip', 'text', '', '', '50', '说明：每天最多投 %s 个硬币，每天4:00根据所投硬币总量和股价涨跌情况产生萌股股票和分红萌币。', '硬币投资说明'),
 ('5001', '51', 'loveInvestment', 'text', '', '', '50', '真爱投资：两倍股票产出，更能影响股价。', '真爱投资说明'),
 ('5002', '51', 'advancedBlack', 'text', '', '', '50', '高级黑投资：两倍股票产出，更能影响股价。', '高级黑投资说明'),
 ('5003', '51', 'openCrowdfunding', 'text', '', '', '50', '说明：开启众筹后可发动大家一起将该人物众筹上市并参与排行，该人物众筹时间%s天。%s天后若众筹失败则返还参与众筹的萌币，开启众筹的萌币不返还。', '开启众筹说明'),
 ('5004', '51', 'getOnCrowdfunding', 'text', '', '', '50', '说明：该人物众筹上市后可投资并参与排行，该人物众筹上市共需50000萌币，众筹时间%s天。%s天后若众筹失败则返还参与众筹的萌币。众筹成功后出资最高的玩家会变成董事长，出资排名前10位玩家会变成董事会成员。', '进行众筹说明'),
 ('5006', '51', 'investmentNormalGold', 'text', '', '', '50', '说明：每天最多投%s萌币，每天4:00根据股价涨跌情况和所投萌币数量产生萌股股票和分红萌币。', '正常股萌币投资'),
 ('5007', '51', 'investmentBlackGold', 'text', '', '', '50', '说明：每天最多投%s萌币，每天4:00根据股价涨跌情况和所投萌币数量产生黑股股票和分红萌币。', '黑股萌币投资'),
 ('5008', '51', 'Stock', 'text', '', '', '50', '每个二次元人物有两种股票：正常股和黑股，两种股票的投资次数对应该人物的股价，投资正常股股票的次数多则该人物股价上涨，投资黑股股票的次数多则该人物股价下跌。
股票由投资获得，投资正常股或黑股会获得对应的正常股或黑股以及对应的萌币分红，股票越多对应的分红萌币就越多。', '股票说明'),
 ('5009', '51', 'Chips', 'text', '', '', '50', '1.只有官方上市的角色（新人）可以用硬币进行投资，官方上市的角色一定是当季正在热播的番剧的主要角色。
2.每天登陆即可获得3个硬币，每天4:00清零。
3.每天4:00点根据投资情况返利给投资者所投人物的股票和萌币。
4.二次元人物当天被投的硬币总数越多返利的萌币越多。
5.投资行为分为两种：普通投资和真爱投资，真爱投资会获得两倍股票产出和萌币分红，更能影响股价。', '硬币说明'),
 ('5010', '51', 'Gold', 'text', '', '', '50', '1.集资上市的角色只可以用萌币进行投资，包括投资正常股和黑股。
2.每天用户可以投资的萌币数量有上限。
3.每天4:00点根据投资情况返利给投资者所投人物的股票和萌币。
4.二次元人物当天被投的正常股或黑股萌币总数越多则对应正常股或黑股股票的返利萌币越多。
5.投资行为分为两种：普通投资和真爱投资，真爱投资会获得两倍股票产出和萌币分红，更能影响股价。', '萌币说明'),
 ('5011', '51', 'Diamond', 'text', '', '', '50', '', '钻石说明'),
 ('5012', '21', 'goldCoinBaseTwo', 'text', '', '', '50', '1', '金币基数2'),
 ('5013', '21', 'goldCoinBaseThree', 'text', '', '', '50', '2', '金币基数3'),
 ('5014', '11', 'todayStockTotal', 'text', '', '', '50', '500', '每天股票分配总数'),
 ('5015', '11', 'allocationLimits', 'text', '', '', '50', '1', '每权重分配股票限制'),
 ('5016', '11', 'stockPriceRiseFallLimit', 'text', '', '', '50', '0.01', '股价每五分钟涨跌幅度限制'),
 ('5017', '51', 'dayChips', 'text', '', '', '50', '1.每天登录即可获得3个硬币，次日4:00清零。
2.硬币可用于投资热播番剧的人物。
3.次日4:00点根据投资情况返利给投资者所投人物的股票和萌币。
4.人物当天被投的硬币总数越多返利的萌币越多。', '每日弹窗硬币说明');

CREATE TABLE `system_app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_version_code` int(11) NOT NULL COMMENT 'app的等级',
  `app_version` varchar(20) NOT NULL COMMENT 'app的真实版本',
  `platform` tinyint(1) DEFAULT 0 COMMENT '平台；0IOS，1Android',
  `update_intro` text NOT NULL COMMENT '更新说明',
  `size` int(11) DEFAULT NULL COMMENT '包大小',
  `download_url` varchar(255) DEFAULT NULL COMMENT '下载链接',
  `is_need_force` tinyint(1) DEFAULT 0 COMMENT 'is_need_force；0否，1是',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app版本表';

CREATE TABLE `system_assets_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `operator_id` varchar(20) NOT NULL COMMENT '后台操作用户ID',
  `desc` varchar(255) NOT NULL COMMENT '操作原因',
  `gold` double(10,3) DEFAULT NULL COMMENT '增加萌币数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新增资产记录表';

CREATE TABLE `system_statics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `distributor` VARCHAR(32) NOT NULL COMMENT '渠道',
  `phone_register` int(11) DEFAULT 0 COMMENT 'phone注册数',
  `qq_register` int(11) DEFAULT 0 COMMENT 'qq注册数',
  `wechat_register` int(11) DEFAULT 0 COMMENT '微信注册数',
  `weibo_register` int(11) DEFAULT 0 COMMENT '微博注册数',
  `down_num` int(11) DEFAULT 0 COMMENT '下载数',
  `platform_down` int(11) DEFAULT 0 COMMENT '渠道激活数',
  `open_num` int(11) DEFAULT 0 COMMENT '总激活',
  `ip_num` int(11) DEFAULT 0 COMMENT '同ip激活',
  `device_num` int(11) DEFAULT 0 COMMENT '同设备激活',
  `click_num` int(11) DEFAULT 0 COMMENT '点击数',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  `is_operate` int(11) DEFAULT 0 COMMENT '是否操作',
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app统计表';

CREATE TABLE `system_statics_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `distributor` varchar(32) DEFAULT 0 COMMENT '推广平台名字',
  `type` tinyint(1) DEFAULT 0 COMMENT '客户端平台；0ios；1android',
  `name` varchar(32) DEFAULT NULL COMMENT '平台名称',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='推广渠道表';

CREATE TABLE `bbs_post_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '帖子id',
  `uid` int(10) NOT NULL COMMENT '转发人id',
  `num` int(10) NOT NULL COMMENT '分享次数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_id_isDel` (`id`,`is_del`),
  KEY `index_pid_uid_isDel` (`pid`,`uid`,`is_del`),
  KEY `index_uid_pid_isDel` (`uid`,`pid`,`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT "转发表";


CREATE TABLE `operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) NOT NULL  COMMENT '物料ID',
  `operator_id` varchar(20) NOT NULL COMMENT '后台操作用户ID',
  `desc` varchar(255) NOT NULL COMMENT '操作描述',
  `type` tinyint(1) DEFAULT 0 COMMENT '内容类型 0帖子 1番剧 2人物 3版区',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='后台操作日志';

CREATE TABLE `bbs_post_report` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `device_id` VARCHAR (64) NOT NULL DEFAULT '0' COMMENT '未登录设备号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid_is_del_index` (`pid`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "帖子举报表";

CREATE TABLE `bbs_post_unlike` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `device_id` VARCHAR (64) NOT NULL DEFAULT '0' COMMENT '未登录设备号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid_is_del_index` (`pid`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "踩帖子表";

CREATE TABLE `acgn_drama_unlike` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '发起人用户id',
  `device_id` VARCHAR (64) NOT NULL DEFAULT '0' COMMENT '未登录设备号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态；0正常；1主动删除；2后台删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid_is_del_index` (`pid`,`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "踩番剧表";
