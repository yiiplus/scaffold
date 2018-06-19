# scaffold

易加-脚手架(scaffold)是一个基于[Yii2高级项目模版](https://github.com/yiisoft/yii2-app-advanced)工程化实现的应用程序，它将更加高效、规范和工程化的满足项目开发的需求。

scaffold 包含五层：app、pc、h5、admin和console，每个层次都是独立的Yii应用程序。并且同样Out of the box。

此外，scaffold还完美融合了Cloud Native、Sentry、fis前端工程化等技术。

[![Yii2](https://img.shields.io/badge/Powered_by-Yii_Framework-green.svg?style=flat)](http://www.yiiframework.com/)
[![Apache--2.0](https://img.shields.io/badge/LICENSE-Apache--2.0-blue.svg)](https://github.com/yiiplus/scaffold/blob/master/LICENSE)
![Jenkins](https://img.shields.io/jenkins/s/https/jenkins.qa.ubuntu.com/view/Precise/view/All%20Precise/job/precise-desktop-amd64_default.svg)
[![DOCS](https://img.shields.io/badge/docs-passing-orange.svg)](https://github.com/yiiplus/scaffold/tree/master/docs)

## 目录结构
```$xslt
common
    config/              包含common配置
    mail/                包含电子邮件的查看文件
    models/              包含在admin、app、h5和pc中使用的模型类
    tests/               包含常见类的测试   
console
    config/              包含console配置
    controllers/         包含console controllers (commands)
    migrations/          包含数据库迁移
    models/              包含特定于console的模型类
    runtime/             包含运行时生成的文件
app
    assets/              包含应用程序资源，如JavaScript和CSS
    config/              包含app配置
    modules/             包含app模块
        v1/              包含app的v1版本模块
        v2/              包含app的v2版本模块
    runtime/             包含运行时生成的文件
    tests/               包含app应用程序的测试
    web/                 包含app入口脚本和资源
admin
    assets/              包含应用程序资源，如JavaScript和CSS
    config/              包含admin配置
    controllers/         包含admin controllers (commands)
    models/              包含特定于admin的模型类
    runtime/             包含运行时生成的文件
    tests/               包含test应用程序的测试
    views/               包含admin应用程序的视图文件
    web/                 包含admin入口脚本和资源
h5
    assets/              包含应用程序资源，如JavaScript和CSS
    config/              包含h5配置
    controllers/         包含h5 controllers (commands)
    fis3/                包含h5Fis3前端模块
    models/              包含特定于h5的模型类
    runtime/             包含运行时生成的文件
    tests/               包含test应用程序的测试
    views/               包含h5应用程序的视图文件
    web/                 包含h5入口脚本和资源
pc
    assets/              包含应用程序资源，如JavaScript和CSS
    config/              包含pc配置
    controllers/         包含pc controllers (commands)
    fis3/                包含pcFis3前端模块
    models/              包含特定于pc的模型类
    runtime/             包含运行时生成的文件
    tests/               包含test应用程序的测试
    views/               包含pc应用程序的视图文件
    web/                 包含pc入口脚本和资源
docker
    project/             容器项目层(基于环境部署)
        dev/             开发环境
        test/            测试环境
        prod/            生产环境
    service/             容器服务层
vendor/                  包含相关的第三方软件包
environments/            包含基于环境的覆盖
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