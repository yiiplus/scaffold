# 入门学习

## 脚手架的基本原则
* 公共别名在`common/config/bootstarp.php`中定义，使用`Yii::getAlias()`访问；
* 所有自定义助手函数都放在 `common\helpers\` 且方法都未`static`方法；
* 所有公共模型放在 `common\models` 下;
* 每个应用下面应有一个`Controller`控制器，做为该应用的父控制器，方便做一些公共操作；

-------

TODO
* 多语言配置在`/common/config/main.php`中“i18n”项中，源语言设置的是中文，具体可自行查看；
* 超级管理员在`\admin\comfig\params.php`的“admin”项中定义其UID，超级管理员不需要进行RBAC权限检查；
* gii生成的模型统一放在 `common\modelsgii`下，模型统一继承 `common\core\BaseActiveRecord` 方便扩展yii核心；
* 关于后台中的配置项目，实际是经过转化后(通常在BaseController控制器的init构造函数中转化)，变为`Yii::$app->params['web']`中；
```php
Yii::$app->params['web'] = Config::lists();
```
* 在后台的`BaseController`中有一些通用的方法，例如`saveRow`（添加或编辑一行）、`delRow`（删除一行）、`error`（错误提示）、`success`（成功提示）、`setForward`（标记当前列表url，通常在列表中标记）、`getForward`（获取列表url方便跳转，通常结合error或success使用）；


## 快速入门

### 阶段1 茫然无序
* [Yii Framework 2.0 权威指南](http://www.yiichina.com/doc/guide/2.0)
    * [安装 Yii（Installing Yii）](https://github.com/PizzaLiu/PHP-FIGhttp://www.yiichina.com/doc/guide/2.0/start-installation)
    * [运行应用（Running Applications）](http://www.yiichina.com/doc/guide/2.0/start-workflow)
    * [第一次问候（Saying Hello）](http://www.yiichina.com/doc/guide/2.0/start-hello)
    * [使用 Forms（Working with Forms）](http://www.yiichina.com/doc/guide/2.0/start-forms)
    * [玩转 Databases（Working with Databases）](http://www.yiichina.com/doc/guide/2.0/start-databases)
* [FIS3前端工程化指南](http://fis.baidu.com/fis3/index.html)
    * [FIS3介绍](http://fis.baidu.com/fis3/docs/beginning/intro.html)
    * [安装](http://fis.baidu.com/fis3/docs/beginning/install.html)
    * [构建](http://fis.baidu.com/fis3/docs/beginning/release.html)
    * [调试](http://fis.baidu.com/fis3/docs/beginning/debug.html)
    * [内置语法](http://fis.baidu.com/fis3/docs/user-dev/extlang.html)
    * [工作原理](http://fis.baidu.com/fis3/docs/build.html)
    * [初级使用](http://fis.baidu.com/fis3/docs/lv1.html)
    * [中级使用](http://fis.baidu.com/fis3/docs/lv2.html)
    * [高级使用](http://fis.baidu.com/fis3/docs/lv3.html)
* [Docker快速配置开发环境](docker.md#开发环境部署)

> 目标：基础文档阅读，理解当中用到的第三方工程

### 阶段2 初窥门径(进阶)
* pc进阶
    * 数据库设计用户信息表
    * fis搭建登录页面,列表页,了解fis目录结构划分
    * c 层接收参数
    * m 层验证参数 && 数据库查询
    * v 层 smarty 展示页面、分页信息
    
* H5进阶
    * fis搭建表单提交页
    * 服务端实现:
        * 验证码验证
        * oss图片上传存储
        * 短信发送
        * 邮件通知
        * cache 读写
        * 分页展示
        
* app进阶
    * 加密规则了解
        * access_token 获取
        * JWT授权认证
        * token生成原理
    * api接口按照restful方式实现
        * 接口参数规则
        * 返回数据格式规范
        * 返回数据注释规范
        * debug调试方法
        
* Admin进阶
    * adminlte 基础配置讲解
    * 一个权限配置的流程
    * 用户表的增、删、改
    * 分页、搜索
    * html 小部件基础使用
    
> 目标：实现一个简单的PC网页、实现一个简单的H5网页、实现一个简单的App接口、实现一个简单的Admin后台功能

### 阶段3 运用自如
* 持续集成工作流

* 数据库主从
    * 单主从数据库配置
    * 多主从数据库配置
    * 使用案例
    
* 队列
    * MQ配置
    * MQ使用规则
 
* Git工作流
    * 团队协作流程
    
* 敏捷开发流程图
    *流程图（持续集成工作流、数据库主从、队列、Git工作流、敏捷开发流程图）

> 目标：完全掌握公司要求的一系列工作标准，达到上手项目开发标准；