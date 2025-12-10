# 访客管理系统

## 项目简介

校园访客预约（openedu-visitor）是一个基于Spring Boot和Vue.js开发的访客管理平台，提供Web端管理后台和H5端访客应用，实现访客预约、审批、记录管理等功能。

## 技术栈

### 后端技术栈
- Spring Boot 2.x
- MyBatis Plus 3.x
- MySQL 5.7+
- Redis 5.x+
- Swagger/Knife4j 2.x
- JWT
- Quartz 2.x
- Lombok 1.x

### 前端技术栈
- **Web端**：Vue 2.x + Element UI
- **H5端**：Vue 2.x + Vant 2.x

## 项目结构

```
openedu-visitor/
├── smart-admin-api/        # 后端API服务
├── visitor-h5/             # H5前端应用
├── visitor-web/            # Web前端管理后台
├── DEVELOPMENT.md          # 开发文档
├── README.md               # 项目说明文档
└── pom.xml                 # Maven父项目配置
```

## 快速开始

### 环境要求

- JDK 1.8+
- Maven 3.6+
- Node.js 12+
- MySQL 5.7+
- Redis 5.0+

### 数据库配置

1. 创建数据库：`visitor`
2. 导入SQL文件：`smart-admin-api/src/main/resources/sql/visitor.sql`

### 项目启动

#### 1. 后端服务启动

```bash
# 启动Redis服务
redis-server

# 在IntelliJ IDEA中运行
# 主类：net.lab1024.smartadmin.SmartAdminApplication
# 访问API文档：http://localhost:10086/visitor-api/doc.html
```

#### 2. Web前端启动

```bash
cd visitor-web
npm install
npm run dev
```

#### 3. H5前端启动

```bash
cd visitor-h5
npm install
npm run dev
```
默认页面是游客页面，可以提交申请，查看申请记录。

管理员登录地址： /login

用户名：admin, 密码：123456

## 核心功能

### 访客管理
- 访客预约提交
- 访客记录查询
- 访客状态更新
- 访客记录导出

### 审批人管理
- 审批人列表查询
- 审批人添加/编辑
- 审批人状态管理

### 系统管理
- 用户管理
- 部门管理
- 角色管理
- 权限管理
- 日志管理
- 通知管理

## 开发规范

详细开发规范请参考：[DEVELOPMENT.md](DEVELOPMENT.md)

## 部署说明

### 后端部署

```bash
# 打包
mvn clean package -DskipTests

# 运行
java -jar smart-admin-api/target/smart-admin-api-1.0.0.jar --spring.profiles.active=prod
```

### 前端部署

```bash
# Web端打包
cd visitor-web
npm run build:prod

# H5端打包
cd visitor-h5
npm run build:prod
```

将打包后的`dist`目录部署到Nginx或其他Web服务器。

## 版本管理

- **master**：主分支，用于发布稳定版本
- **develop**：开发分支，用于集成开发
- **feature/*：功能分支，用于开发新功能
- **hotfix/*：修复分支，用于修复生产环境问题

## 联系方式

- 项目维护者：zhuoluodada@qq.com
- 技术支持：请提交Issue到项目仓库

## 许可证

[MIT](LICENSE)
