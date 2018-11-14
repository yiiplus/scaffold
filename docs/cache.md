# 缓存手册

## 配置规范

```
// 开发环境
// 配置文件地址: environments/dev/common/config/main-local.php
return [
    'components' => [
        'cache' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 0,
            ],
        ],
        'cache_user' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 1,
            ],
        ],
        ......
    ],
];

// 测试环境
// 配置文件地址: environments/test/common/config/main-local.php
return [
    'components' => [
        'cache' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 0,
            ],
        ],
        'cache_user' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 1,
            ],
        ],
        ......
    ],
];

// 生产环境
// 配置文件地址: environments/prod/common/config/main-local.php
return [
    'components' => [
        'cache' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'password' => '',
                'database' => 0,
            ],
        ],
        'cache_user' => [
            'class' => 'yii\redis\Connection',
            'redis' => [
                'hostname' => 'localhost',
                'port' => 6379,
                'password' => '',
                'database' => 1,
            ],
        ],
        ......
    ],
];
```

## 操作规范
* 如无生命周期，则表示用途为非关系型数据库，相反如有生命周期则表示KeyValue缓存
* 不同的业务数据要分开存储
* 对于必须要存储的大文本数据一定要压缩后存储

## 常用字段约定
* ADMIN – 后台
* USER – 用户
* CATEGORY – 分类
* GOODS – 商品、产品等一切可交易网站的物品都用此命名
* ARTICLE – 文章、新闻、帮助中心等以文章形式出现的，一般都用此命名
* CART – 购物车
* ORDER – 订单
* 待补充...

## 字段命名规范
* 使用大写英文单词，如果有多个单词使用下划线隔开；
* 使用简单单词，避免生僻词；
* 具备统一前缀，对相关功能的字段应当使用相同前缀，如0_USER_, 0_ADMIN_, 1_ORDER_, 1_CART；

## 缓存字典

| 数据库 | 缓存字段  | 生命周期(毫秒) | 说明 |
| --- | --- | --- | --- |
| 0:全局 | - | - | - |
| 0:全局 | 0_GROUP_TOP10 | 3600000 |  |
| 0:全局 | 0_VIP_TOP10 | 3600000 |  |
| 0:全局 | 0_COMMON_CITY | 0 |  |
| 1:用户 | - | - | - |
| 1:用户 | 1_USER_DATA_{$uid} | 600000 | 用户数据 |
| 1:用户 | 1_USER_ADDRESS_{$uid} | 600000 | 用户收货地址 |
| 1:用户 | 1_USER_CART_{$uid} | 600000 | 用户购物车 |
| 1:用户 | 1_OAUTH_INFO_{$uid} | 3600000 |  |
| 1:用户 | 1_OAUTH_ITEM_{$uid} | 3600000 |  |
| 2:订单 | - | - | - |
| 2:订单 | 2_ORDER_{$order_id} | 86400000 | 订单详情 |
| 2:订单 | 2_ORDER_GOODS_{$order_id}_{$goods_id} | 86400000 | 订单商品 |
| 2:订单 | 2_ORDER_FEEDBACK_{$order_id} | 86400000 | 订单用户反馈 |
