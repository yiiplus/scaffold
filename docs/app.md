# App接口文档

## 序言
和Web应用不同，App请求通常是无状态的， 也就意味着不应使用sessions 或 cookies， 因此每个请求应附带某种授权凭证，因为用户授权状态可能没通过sessions 或 cookies维护， 常用的做法是每个请求都发送一个秘密的access token来认证用户， 由于access token可以唯一识别和认证用户， App请求应通过HTTPS来防止man-in-the-middle (MitM) 中间人攻击.

## 约定
* 接口请求地址 - https://app.example.com/v1/
* 请求方式 - POST
* 系统级参数
	* access-token - 用户会话信息
	* timestamp - Unix时间戳，到秒
* 参数约定 - data

## 功能特点
* [JWT](https://tools.ietf.org/html/rfc7519)( JSON Web Token (JWT))组件
* 签名验证过滤
* 防重防攻击过滤
* 速率限制
* 字段内特殊字符过滤说明
* Response组件，Json结构化相应

## 签名算法说明
* slep1. 
* slep2.
* slep3.
//TODO 周康补充

## 请求方式举例

* 正式环境（POST）注意：不是GET参数形式

```
https://app.example.com/v1/user/show?data=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ
```

* 调试环境（GET）

```
https://app.example.com/user/show?access_token=xxxxxxxx&timestamp=1522245761&uid=1&debug=1
```

## App接口字典
关于详细接口文档，参见 [App接口字典](app/v1/)