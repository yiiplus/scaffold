# 团队编码规范

## 简要说明
   项目需遵循惯例优先原则(convention over configuration), 对于很多项目来说，遵从已有的惯例和使用合理的缺省选项大概是最合情合理的做法. 这样要优于屁大点事情都要通过配置文件进行配置.

## 敏捷开发流程图
    持续集成工作流、Git工作流、敏捷开发流程图

## Git工作流

分支模型采用 Github flow工作流程，发布方式采用持续集成。它只有一个长期分支，就是master，因此用起来非常简单。官方推荐的流程如下：
![](_media/15342999793615.png)

* 第一步：根据需求，从master拉出新分支。
* 第二步：功能分支合并进master分支，必须通过Pull Request（Gitlab里面叫做 Merge Request）。
* 第三步：Pull Request既是一个通知，让别人注意到你的请求，又是一种对话机制，大家一起评审和讨论你的代码。对话过程中，你还可以不断提交代码。
* 第四步：你的Pull Request被接受，合并进master，重新部署后，原来你拉出来的那个分支就被删除。

### 第一步：新建分支
首先，每次开发新功能，都应该新建一个单独的分支。
##### 分支命名规范
| 分支 | 命名 | 说明 |
| --- | --- | --- |
| 主分支 | master | 永远是可用的、稳定的、可直接发布的版本，不能直接在该分支上开发 |
| 功能分支 | feature-xxx | 以自己开发功能模块命名，功能测试正常后合并到master分支 |
| 热修分支 | hotfix-xxx | 项目上线之后可以会遇到一些环境问题需要紧急修复 |

```bash
# 获取主干最新代码
$ git checkout master
$ git pull

# 新建一个开发分支myfeature
$ git checkout -b myfeature
```

### 第二步：提交分支commit
分支修改后，就可以提交commit了。

```bash
$ git add --all #git add 命令的all参数，表示保存所有变化（包括新建、修改和删除）。从Git 2.0开始，all是 git add 的默认参数，所以也可以用 git add . 代替
$ git status #git status 命令，用来查看发生变动的文件
$ git commit --verbose #git commit 命令的verbose参数，会列出 diff 的结果
```

### 第三步：撰写提交信息
提交commit时，必须给出完整扼要的提交信息，下面是一个范本。

```bash
fix(view): Present-tense summary under 50 characters

* More information about commit (under 72 characters).
* More information about commit (under 72 characters).

http://project.example.com/ticket/123

########## 第一行提交信息规范 ##########
# <type>(<scope>): <subject>
# type:
# 1. feat: 新功能 (feature)
# 2. fix: 修复bug
# 3. docs: 文档 (documentation)
# 4. style: 格式 (不影响代码运行的变动)
# 5. refactor: 重构 (即不是新增功能，也不是修改bug的代码变动)
# 6. test: 增加测试
# 7. chore: 构建过程或者辅助工具的变动
#
# scope:
# 用于说明commit影响的范围，比如数据层、控制层、视图层等等，视项目不同而不同。
#
# subject:
# 是commit目的的简短描述，不超过50个字符。
# 1. 已动词开头，使用第一人称现在时。
# 2. 结尾不加句号
```

### 第四步：与主干同步
分支的开发过程中，要经常与主干保持同步。

```bash
$ git fetch origin
$ git rebase origin/master
```

### 第五步：推送到远程仓库

推送当前分支到远程仓库

```bash
$ git push --force origin myfeature
```

### 第六步：发出Pull Request
提交到远程仓库以后，就可以发出 Pull Request 到master分支，然后请求别人进行代码review，确认可以合并到master。

---

## 团队编码规范
* [通用编码规范](../README.md)
* 前端编码规范
    * [Android 编码规范](../README.md)
    * [iOS 编码规范](../README.md)
    * [HTML 编码规范](../README.md)
    * [CSS 编码规范](../README.md)
    * [Javascript 编码规范](../README.md)
    * [JQuery 编码规范](../README.md)
    * [Smarty 编码规范](../README.md)
* 后端编码规范
    * [PHP 编码规范](https://github.com/PizzaLiu/PHP-FIG)
    * [Java 编码规范](../README.md)
    * [Database 编码规范](database.md)