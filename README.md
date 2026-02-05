# 平台介绍

## 🏠【关于我们】

![天天开源](https://open.tntlinking.com/assets/logo-b-BzFUYaRU.png) 

天天开源致力于构建开放共赢的平台，推动安全高效的开源应用普及。我们始终秉持“开源、众包、共享”的理念，致力于为医疗、教育、中小企业等行业提供优质的开源解决方案。

天天开源聚焦医疗、企业、教育三大行业信息化市场，现已发布OpenHIS、OpenCOM、OpenEDU系列开源软件产品。我们通过建立开源生态，联合生态伙伴共同打造创新行业协作模式，让数字化普惠、可信、安全。

天天开源的前身是新致开源，最早于2022年6月发布OpenHIS开源医疗，于2023年6月发布OpenCOM开源企业。2025年7月，新致开源品牌升级为天天开源。我们将持续践行开源精神，期待成为全球开源生态的引领者。

了解我们：https://open.tntlinking.com/about?site=gitee

## 💾【部署包下载】

请访问官网产品中心下载部署包：https://open.tntlinking.com/resource/productCenter?site=gitee

## 📚【支持文档】

技术文档：https://open.tntlinking.com/resource/openProductDoc?site=gitee
（含演示环境、操作手册、部署手册、开发手册、常见问题等）

产品介绍：https://open.tntlinking.com/resource/productPresentation?site=gitee

操作教程：https://open.tntlinking.com/resource/operationTutorial?site=gitee

沙龙回顾：https://open.tntlinking.com/resource/openSourceSalon#23?site=gitee

## 🤝【合作方式】

产品服务价格：https://open.tntlinking.com/cost?site=gitee

加入生态伙伴：https://open.tntlinking.com/ecology/becomePartner?site=gitee

## 🤗【技术社区】

请访问官网扫码加入技术社区交流：https://open.tntlinking.com/ecology/joinCommunity?site=gitee

请关注公众号【天天开源软件】以便获得最新产品更新信息。


# 项目介绍

## 项目简介

OpenEDU校园访客预约系统是一款规范校外人员入校流程的数字化工具，适用于所有学校及教研机构。系统支持访客通过二维码或链接登录并提交预约申请、管理员移动端审核、审核结果实时通知访客、门卫扫描入校全流程。系统还提供访客统计、部门及审核人维护功能，从而实现全流程线上化管理，提升入校效率与校园安全管控水平。

如需要其他产品源码，可访问天天开源官网。

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
