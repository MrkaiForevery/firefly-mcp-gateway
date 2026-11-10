# 单体式 MCP Gateway 使用说明书

| 项目         | 内容                                                         |
| :----------- | :----------------------------------------------------------- |
| **文档版本** | v5.0（最终落地详尽版）                                       |
| **架构名称** | Monolithic MCP Gateway（单体聚合型 MCP 服务）                |
| **技术栈**   | JDK 21 + Spring Boot 4.1.2 + Spring AI 2.0.2 + MCP SDK 2.1.0 + PostgreSQL + MyBatis-Plus 3.5.18+ |
| **核心决策** | 拒绝服务发现与独立上游 MCP 服务；采用**策略模式**解析客户端身份；**纵深防御**（列表过滤 + AOP 拦截）；利用 **JSONB 包含（`@>`）** 进行权限匹配。 |


## 概述

### 核心设计原则
*   **单体聚合**：单一 Spring Boot 进程同时承载 MCP 协议服务端与业务路由，组件最少，心智负担最低。
*   **确定性可见性**：不提供开放式 `search_tools`。可见性完全由数据库中的策略矩阵在 `tools/list` 时静态推导。
*   **纵深防御体系**：
    *   **列表层（防君子）**：`addToolFilter` 负责 `tools/list` 的“广告过滤”，隐藏无权工具。
    *   **执行层（防小人）**：AOP 切面在 `tools/call` 时进行强制二次鉴权，作为最终安全门禁。
*   **彻底解耦**：`Handler` 只负责翻译 HTTP 请求，`Resolver` 只负责查库鉴权。

## 初始化鉴权数据设计

### 鉴权表结构设计
*   **直接看ddl**：mysql_init_ddl.sql
### 鉴权表test数据
*   **直接看dmj**：mysql_init_dml.sql

## 启动mcp-gateway服务
*   **application.yml配置准备**：请配置datasource配置项，并执行上述mysql_init_ddl.sql和mysql_init_dml.sql脚本
*   **以dev配置启动**：本地启动配置触发键active:dev ,后续其他环境可自行配置


## 测试方式
### 测试工具：mcp debug tool 一款专门测试mcp server的客户端
*   **安装mcp debug tool脚本**：
```bash
#poweshell以管理员执行
# windows下升级node.js版本 -> LTS 版本(版本需高于22.xxx)
winget install -e --id OpenJS.NodeJS.LTS
node -v
#安装并启动
npx mcp-debug-tool --bind 0.0.0.0 --allowed-host 192.168.166.54
#安装后会自动打开默认浏览器，并访问网址:http://127.0.0.1:3333/
```
*   **使用mcp debug tool连接本地mcp-gateway服务**：
```bash
## ui界面配置-选择http配置
## server url填写
#【无状态服务】
http://127.0.0.1:20110/monitor/stateless/mcp
#【有状态服务】
http://127.0.0.1:20110/monitor/streamable/mcp
## Headers配置
{
  "The-Client-Type": "dify_agent_client_type",
  "DF-Agent-ID": "code-agent-id-950925",
  "DF-SSO-Token": "2a-56-sa-dsauijdsad"
}
```





