# scaffold

易加-脚手架(scaffold)是一个基于[Yii2高级项目模版](https://github.com/yiisoft/yii2-app-advanced)工程化实现的应用程序，它将更加高效、规范和工程化的满足项目开发的需求。

[开发模式] 
[测试模式] 
[仿真模式]
[生产模式] 

[![Latest Stable Version](https://img.shields.io/packagist/v/yiiplus/scaffold.svg)](https://packagist.org/packages/yiiplus/scaffold)
[![Total Downloads](https://img.shields.io/packagist/dt/yiiplus/scaffold.svg)](https://packagist.org/packages/yiiplus/scaffold)
[![Build Status](https://travis-ci.org/yiiplus/scaffold.svg?branch=master)](https://travis-ci.org/yiiplus/scaffold)
[![Yii2](https://img.shields.io/badge/Powered_by-Yii_Framework-green.svg?style=flat)](http://www.yiiframework.com/)
[![Apache--2.0](https://img.shields.io/badge/LICENSE-Apache--2.0-blue.svg)](https://github.com/yiiplus/scaffold/blob/master/LICENSE)
![Jenkins](https://img.shields.io/jenkins/s/https/jenkins.qa.ubuntu.com/view/Precise/view/All%20Precise/job/precise-desktop-amd64_default.svg)
[![DOCS](https://img.shields.io/badge/docs-passing-orange.svg)](https://github.com/yiiplus/scaffold/tree/master/docs)

DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    tests/               contains tests for common classes    
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for frontend application
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
```


## 快速安装

- 安装 Composer 依赖管理
	- [MacOS/Linux/Unix](http://docs.phpcomposer.com/00-intro.html#Installation-*nix)
	- [Windows](http://docs.phpcomposer.com/00-intro.html#Installation-Windows)
- 安装 Docker 应用容器引擎
    - [MacOS](https://store.docker.com/editions/community/docker-ce-desktop-mac)
    - [Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
    - [CentOS](https://store.docker.com/editions/community/docker-ce-server-centos)
    - [Ubuntu](https://store.docker.com/editions/community/docker-ce-server-ubuntu)
    - [AWS](https://store.docker.com/editions/community/docker-ce-aws)
    - [Fedora](https://store.docker.com/editions/community/docker-ce-server-fedora)
    - [Debian](https://store.docker.com/editions/community/docker-ce-server-debian)
- 基于容器化环境部署

    ```bash
    # 首先，确认您安装了最新版本的 Composer 资源插件
    composer global require fxp/composer-asset-plugin ^1.4.2 -vvv
    
    # 并开启多进程并行下载，加快下载效率
    composer global require hirak/prestissimo -vvv

    # 克隆代码
    git clone https://github.com/yiiplus/scaffold.git
    
    # 进入项目目录
    cd scaffold
    
    # 设置Git配置
    git config user.name "yourname"
    git config user.email "your email" 
    
    # 编译环境
    # 如果安装失败请尝试添加 GitHub 密钥：
    # 进入 https://github.com/settings/tokens 点击 「Generate new token」 新建一个 Token;
    # 编辑 vim composer.json
    #    "config": {
    #        "github-oauth": {
    #            "github.com": "<token>"
    #        }
    #    }
    composer run-script dev:install
    
    # 初始化数据库
    docker exec -it mysql mysql --default-character-set=utf8 -uroot -p -e 'source /schema-mysql.sql'
    ```    

- 访问地址
    - Admin: http://admin.scaffold.local   用户名:webmaster 密码:111111
    - PC: http://www.scaffold.local
    - H5: http://h5.scaffold.local
    - App: http://app.scaffold.local
    - FIS3: http://fis3.scaffold.local
    - phpMyAdmin: http://pma.scaffold.local 服务器:mysql 用户名:root 密码:root

## [文档中心](docs/README.md)
- [入门学习](docs/quickstart.md)
- [Docker手册](docs/docker.md)
- [团队编码规范](docs/coding.md)
- 接口文档
    - [App接口文档](docs/app.md)
    - [开放数据接口(openapi)](docs/openapi.md)
    - [内部数据接口(innerapi)](docs/innerapi.md)
- 数据字典
    - [数据库手册](docs/database.md)
    - [缓存手册](docs/cache.md)
    - [邮件和短信](docs/mail.md)
- 服务文档
    - [日志服务](docs/logs.md)
    - [队列服务](docs/queue.md)
    - [定时任务](docs/crontab.md)
    - [监控报警](docs/monitor.md)
- 异常解决
    - [错误对照表](docs/error.md)
    - [调试及调试工具](docs/debug.md)
- [技术白皮书](docs/develop.md)
- [FAQ](docs/faq.md)