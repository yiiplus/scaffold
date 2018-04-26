# 数据库手册
数据库SQL信息，参见 [Database Schema](dbschema.sql)

## 配置规范

```
// 开发环境
// 配置文件地址: environments/dev/common/config/main-local.php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=example',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        ......
    ],
];

// 测试环境
// 配置文件地址: environments/test/common/config/main-local.php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=example',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        ......
    ],
];

// 生产环境
// 配置文件地址: environments/prod/common/config/main-local.php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=example',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        ......
    ],
];
```

## 操作规范
* 如无备注，则表中的第一个id字段一定是主键且为自动增长；
* 如无备注，则数值类型的字段请使用UNSIGNED属性；
* 如无备注，排序字段order_id在程序中默认使用降序排列；
* 如无备注，所有字段都设置NOT NULL，并设置默认值；
* 如无备注，所有的布尔值字段，如is_hot、is_deleted，都必须设置一个默认值，并设为0；
* 所有的数字类型字段，都必须设置一个默认值，并设为0；
* 针对varchar类型字段的程序处理，请验证用户输入，不要超出其预设的长度；
* 建表时将数据字典中的字段中文名和属性备注写入数据表的备注中(“PK、自动增长”不用写)；
* 如无说明，建表时一律采用innodb引擎；

## 常用表名约定
* user – 用户
* category – 分类
* goods – 商品、产品等一切可交易网站的物品都用此命名
* good_gallery – 物品的相册
* good_cate – 物品的分类，除了单独作为表名，其他地方分类单词一律用缩写cate
* attr – 属性
* article – 文章、新闻、帮助中心等以文章形式出现的，一般都用此命名
* cart – 购物车
* feedback – 用户反馈
* order – 订单
* site_nav – 包括页头和页尾导航
* site_config – 系统配置表
* admin_user – 后台用户
* admin_menu – 后台菜单
* auth_rule – 【RBAC标准表】
* auth_item – 【RBAC标准表】
* auth_item_child – 【RBAC标准表】
* auth_assignment – 【RBAC标准表】
* 待补充...

说明：表前缀用项目名称首字母缩写；所以表名都小写，单词之间用下划线分开，单词都用单数形式

## 常用列名约定
* id
    * SQL：``` `id` int(11) NOT NULL AUTO_INCREMENT, ```
    * 描述：主键ID
* 表名_id
    * SQL：``` `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID', ```
    * 描述：通常用作外键命名
* cid
    * SQL：``` `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类编号', ```
    * 描述：特殊的编号，带有元数据，方便关联查询，你可以把它理解成类别(层次)编号。举个例子，产品在分类时，往往需要将其归类到子分类下，相应的字段中也一般只记录子分类的id，这时若需要知道该产品属于哪个主分类，就需要通过子分类信息再查询到主分类信息，这是比较麻烦的，cid字段就是要解决这个问题。一般的站点几十个分类肯定是够用了，所以这里假设某一主分类的cid为11，则子分类的cid从1101开始编号，处理时只需截取前两位数值便可知道该产品属于哪一个主分类了。
* add_time
    * SQL：``` `add_time` int(11) NOT NULL COMMENT '添加时间', ```
    * 描述：添加时间、上架时间等
* last_time
    * SQL：``` `last_time` int(11) NOT NULL COMMENT '最后操作时间', ```
    * 描述：最后操作时间，如登录、修改记录
* expire_time
    * SQL：``` `expire_time` int(11) NOT NULL COMMENT '过期时间', ```
    * 描述：过期时间
* status
    * SQL：``` `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型(0创建; 1失败; 2成功)', ```
    * 描述：
* name
    * SQL：``` `name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称', ```
    * 描述： 商品名称、商家名称等，不要跟title混用，title只用于文章标题、职称等  
* price
    * SQL：``` `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格', ```
    * 描述：价格，必须以货币最小值保存
* thumb
    * SQL：``` `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图', ```
    * 描述： 只要是列表页面中的窗口图，一律用此命名   
* image_src
    * SQL：``` `image_src` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址', ```
    * 描述： 相册中的图片地址一律用此命名，不要出现各种img,image,img_url,thumb_url等   
* head_thumb
    * SQL：``` `head_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像', ```
    * 描述：  用户头像， 虽然有点长，一定要遵守。  
* image_alt
    * SQL：``` `image_alt` varchar(60) NOT NULL DEFAULT '' COMMENT '相册中图片的alt属性', ```
    * 描述：  相册中图片的alt属性  
* desc
    * SQL：``` `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简介', ```
    * 描述：描述、简介
* details
    * SQL：``` `details` text NOT NULL DEFAULT '' COMMENT '章内容', ```
    * 描述：详情、文章内容等
* sort
    * SQL：``` `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序', ```
    * 描述：排序
* telephone
    * SQL：``` `telephone` varchar(30) NOT NULL DEFAULT '' COMMENT '座机号码', ```
    * 描述：座机号码
* mobile
    * SQL：``` `telephone` varchar(mobile) NOT NULL DEFAULT '' COMMENT '手机号码', ```
    * 描述： 手机号码   
* phone
    * SQL：``` `phone` varchar(30) NOT NULL DEFAULT '' COMMENT '电话号', ```
    * 描述：当不区分手机和座机时，请用phone命名
* address
    * SQL：``` address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址', ```
    * 描述：地址，单独出现不要用addr缩写，组合出现时需用缩写，比如mac地址，mac_addr
* zipcode
    * SQL：``` `zipcode` int(6) NOT NULL DEFAULT '0' COMMENT '邮编', ```
    * 描述：邮编
* region
    * SQL：``` `region` varchar(30) NOT NULL DEFAULT '' COMMENT '地区', ```
    * 描述：地区，大的区域，比如记录杭州市、温州市等  
* area
    * SQL：``` `area` varchar(30) NOT NULL DEFAULT '' COMMENT '区域', ```
    * 描述：区域，小的，比如上城区，江干区等  
* 待补充...

## 表命名规范
* 具备统一前缀，对相关功能的表应当使用相同前缀，如acl_xxx，house_xxx,ppc_xxx；其中前缀通常为这个表的模块或依赖主实体对象的名字，通常来讲表名为：业务_动作_类型，或是业务_类型；
* 表名使用英文小写单词，如果有多个单词则使用下划线隔开；
* 表名简介，使用常见单词，避免使用长单词和生僻词；
* 表引擎取决于实际应用场景及当前数据库中的已经存在的存储引擎；日志及报表类表建议用myisam，与交易，审核，金额相关的表建议用innodb引擎。总体来讲数据库默认innodb；
* 数据表必须有主键，且建议均使用auto_increment的id作为主键（与业务无关）,和业务相关的要做为唯一索引；
* 默认使用utf8字符集（由于数据库定义使用了默认，数据表可以不再定义，但为保险起见，建议都写上）；
* 所有的表都必须有备注，写明白这个表中存放的数据内容；
* 预估表数据量，如果数据量较大（超过500w）则需要考虑分表策略。可以等量均衡分表或根据业务规则分表均可。要分表的数据表必须与DBA商量分表策略；
* 职责相近的表，命名规则应该相同；如合同申请，账户信息，交友相关等；

举个例子，一张在线冲值记录表：user_bank_deposit这个就非常符合标准，如果叫做userBankDeposit或是user_chongzhi，就非常不友好。

## 字段命名规范
* 数据库字段命名与表名命名类似：
* 使用小写英文单词，如果有多个单词使用下划线隔开；
* 使用简单单词，避免生僻词；
* 字段应当有注释，描述该字段的用途及可能存储的内容，如枚举值则建议将该字段中使用的内容都定义出来；
* 是别的表的外键均使用xxx_id的方式来表明；
* 表的主键一般都约定成为id，自增类型；
* 时间字段，除特殊情况一律采用int来记录unix_timestamp；
* 网络IP字段，除特殊情况一律用bigint来记录inet_aton值；
* 所有字段，均为非空，最好显示指定默认值；
* 有些驱动对tinyint支持不够好，通常建义按容量来选择字段；
* text字段尽量少用，或是拆到冗余表中；

## Example

```
CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类编号',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价值',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记(0未删除; 1已删除)', 
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型(0创建; 1失败; 2成功)',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `last_time` int(11) NOT NULL COMMENT '最后操作时间',
  `refresh_time` int(11) NOT NULL COMMENT '刷新时间',
  `expire_time` int(11) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `category_id_index` (`cid`),
  KEY `is_deleted_index` (`is_deleted`),
  KEY `status_index` (`status`),
  KEY `last_time_index` (`last_time`),
  KEY `add_time_index` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户日志表'
```