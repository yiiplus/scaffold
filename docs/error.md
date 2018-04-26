# 错误对照表

## 错误代码说明

### 错误返回值格式

JSON
```
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/vnd.api+json

{
  "errors": [
    {
      "status": "205002",
      "source": { "pointer": "/data/attributes/first-name" },
      "title":  "Invalid Attribute",
      "detail": "First name must contain at least three characters."
    }
  ]
}
```

### 错误代码说明

例：205002

| 2 | 05 | 002 |
| --- | --- | --- |
| 服务级错误（1为系统级错误） | 服务模块代码 | 具体错误代码  |

## 错误代码对照表

### 系统级错误代码

| 错误代码 | 错误信息 | 详细描述 |
| --- | --- | --- |
|  |  |  |

### 服务级错误代码

| 错误代码 | 错误信息 | 详细描述 |
| --- | --- | --- |
|  |  |  |