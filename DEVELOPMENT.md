# 访客管理系统开发文档

## 1. 项目概述

### 1.1 项目简介
访客管理系统（openedu-visitor）是一个基于Spring Boot和Vue.js开发的访客管理平台，提供Web端管理后台和H5端访客应用，实现访客预约、审批、记录管理等功能。

### 1.2 项目结构
```
openedu-visitor/
├── smart-admin-api/        # 后端API服务
├── visitor-h5/             # H5前端应用
├── visitor-web/            # Web前端管理后台
├── README.md               # 项目部署说明
└── pom.xml                 # Maven父项目配置
```

## 2. 技术栈

### 2.1 后端技术栈
| 技术 | 版本 | 用途 |
|------|------|------|
| Spring Boot | 2.x | 应用框架 |
| MyBatis Plus | 3.x | ORM框架 |
| MySQL | 5.7+ | 数据库 |
| Redis | 5.x+ | 缓存 |
| Swagger/Knife4j | 2.x | API文档 |
| JWT | - | 身份认证 |
| Quartz | 2.x | 定时任务 |
| Lombok | 1.x | 简化Java代码 |
| FastJSON | 1.x | JSON处理 |
| Alibaba Cloud OSS | - | 对象存储 |
| Google ZXing | 3.x | 二维码生成 |

### 2.2 H5前端技术栈
| 技术 | 版本 | 用途 |
|------|------|------|
| Vue | 2.6.x | 前端框架 |
| Vant | 2.11.x | UI组件库 |
| Vue Router | 3.4.x | 路由管理 |
| Vuex | 3.6.x | 状态管理 |
| Axios | 0.19.x | HTTP客户端 |
| lib-flexible | 0.3.x | 移动端适配 |
| postcss-pxtorem | 5.1.x | 像素转rem |
| Moment.js | 2.29.x | 时间处理 |
| Sentry | 5.13.x | 错误监控 |

### 2.3 Web前端技术栈
| 技术 | 用途 |
|------|------|
| Vue | 前端框架 |
| Element UI | UI组件库（推测） |
| Vue Router | 路由管理 |
| Vuex | 状态管理 |
| Axios | HTTP客户端 |

## 3. 核心功能模块

### 3.1 访客管理模块
- **功能描述**：实现访客预约、审批、记录管理等核心功能
- **主要接口**：
  - 访客预约提交
  - 访客记录查询
  - 访客状态更新
  - 访客记录导出
- **数据模型**：`VisitorsRecordEntity`
- **服务类**：`VisitorsRecordService`
- **控制器**：`VisitorsRecordController`

### 3.2 审批人管理模块
- **功能描述**：管理访客审批人员信息
- **主要接口**：
  - 审批人列表查询
  - 审批人添加/编辑
  - 审批人状态管理
- **数据模型**：`ReviewerEntity`
- **服务类**：`ReviewerService`
- **控制器**：`ReviewerController`

### 3.3 系统管理模块
- **用户管理**：员工信息管理、权限分配
- **部门管理**：部门组织结构管理
- **角色管理**：角色定义和权限分配
- **权限管理**：菜单和功能权限管理
- **日志管理**：操作日志、登录日志记录
- **通知管理**：系统通知发布和接收

### 3.4 文件管理模块
- **功能描述**：实现文件上传、下载、管理等功能
- **支持存储方式**：
  - 本地存储
  - 阿里云OSS
  - 七牛云存储
- **服务类**：`FileService`

### 3.5 定时任务模块
- **功能描述**：基于Quartz实现定时任务管理
- **主要功能**：
  - 任务调度
  - 任务日志记录
  - 任务状态监控

## 4. 开发环境搭建

### 4.1 后端开发环境
1. **开发工具**：IntelliJ IDEA 2020+、Maven 3.6+
2. **JDK版本**：JDK 1.8
3. **数据库**：MySQL 5.7+
4. **缓存**：Redis 5.0+

### 4.2 前端开发环境
1. **开发工具**：VS Code、Node.js 12+
2. **包管理工具**：npm 6+
3. **构建工具**：Vue CLI 4.5+

## 5. 数据库配置

### 5.1 数据库初始化
1. 创建数据库：`visitor`
2. 导入SQL文件：`smart-admin-api/src/main/resources/sql/visitor.sql`

### 5.2 数据库连接配置
配置文件路径：`smart-admin-api/src/main/resources/{profile}/application.properties`

```properties
# 数据库连接配置
spring.datasource.url=jdbc:p6spy:mysql://127.0.0.1:3306/visitor?autoReconnect=true&useServerPreparedStmts=false&rewriteBatchedStatements=true&characterEncoding=UTF-8&useSSL=false&allowMultiQueries=true&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=123456
```

### 5.3 微信公号配置
游客认证模式，默认使用UUID生成器生成，保存到用户浏览器localStorage，可自行修改为微信认证

微信公号配置文件路径：`smart-admin-api/src/main/resources/{profile}/application.properties`

```properties
# 是否启用微信公众号
visitor.wechat.enabled=false
# 系统域名
visitor.wechat.host=www.xxx.com
visitor.wechat.appid=wxecac1489859e70c6
visitor.wechat.secret=a9c2c3f5e2fabf3a64e58b0dc739a3b5
# 申请消息模板ID
visitor.wechat.visitorApplyTemplateId=INDbswunUiReh_z0WYWLQ-N146HLzs93YXbiC80994o
# 审核消息模板ID
visitor.wechat.visitorApplyShTemplateId=G9RABtkaa4WsbBFH5VbwZp88Q6cprHmobXnzvtbAtYY
# 通知消息模板ID
visitor.wechat.visitorNoticeTemplateId=1dLPZFHuK1j_7I_EJujobaaMXyFDkg1AJzaXXt5fl5E
```

## 6. 项目启动

### 6.1 后端服务启动
1. 启动Redis服务
2. 在IntelliJ IDEA中运行`SmartAdminApplication`类
3. 访问API文档：http://localhost:10086/visitor-api/doc.html

### 6.2 H5前端启动
```bash
# 进入H5项目目录
cd visitor-h5

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

### 6.3 Web前端启动
```bash
# 进入Web项目目录
cd visitor-web

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

## 7. 开发规范

### 7.1 后端开发规范
1. **代码结构**：采用分层架构
   - Controller：处理HTTP请求
   - Service：业务逻辑层
   - Dao：数据访问层
   - Domain：实体类和DTO/VO

2. **命名规范**：
   - 类名：大驼峰命名法
   - 方法名：小驼峰命名法
   - 变量名：小驼峰命名法
   - 常量：全大写，下划线分隔

3. **接口设计**：
   - RESTful风格
   - 统一响应格式：`ResponseDTO`
   - 分页统一格式：`PageResultDTO`

### 7.2 前端开发规范
1. **代码结构**：
   - 组件化开发
   - 按功能模块组织代码
   - API请求统一管理

2. **命名规范**：
   - 组件名：大驼峰命名法
   - 方法名：小驼峰命名法
   - 变量名：小驼峰命名法

3. **样式规范**：
   - 使用SCSS预处理器
   - 采用BEM命名规范
   - 移动端使用rem单位

## 8. 部署说明

### 8.1 后端部署
1. 打包：`mvn clean package -DskipTests`
2. 运行：`java -jar smart-admin-api/target/smart-admin-api-1.0.0.jar --spring.profiles.active=prod`

### 8.2 前端部署
1. 打包：
   ```bash
   # H5打包
   npm run build:prod
   
   # Web打包
   npm run build:prod
   ```
2. 将打包后的dist目录部署到Nginx或其他Web服务器

### 8.3 Nginx配置示例
```nginx
server {
    listen 80;
    server_name visitor.example.com;
    
    # Web管理后台
    location / {
        root /path/to/visitor-web/dist;
        index index.html;
        try_files $uri $uri/ /index.html;
    }
    
    # H5应用
    location /h5 {
        root /path/to/visitor-h5/dist;
        index index.html;
        try_files $uri $uri/ /h5/index.html;
    }
    
    # API代理
    location /visitor-api {
        proxy_pass http://localhost:10086;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## 9. 常见问题与解决方案

### 9.1 数据库连接失败
- 检查数据库服务是否启动
- 检查数据库连接配置是否正确
- 检查数据库用户权限

### 9.2 前端跨域问题
- 确保后端配置了CORS允许跨域访问
- 开发环境可通过Vue CLI的proxy配置解决

### 9.3 Redis连接失败
- 检查Redis服务是否启动
- 检查Redis连接配置是否正确
- 检查Redis密码是否正确

## 10. 监控与日志

### 10.1 后端日志
- 日志框架：Log4j2
- 日志级别：DEBUG、INFO、WARN、ERROR
- 日志文件路径：配置在application.properties中的`server.tomcat.basedir`

### 10.2 前端监控
- H5应用集成了Sentry错误监控
- 配置文件：`visitor-h5/src/plugins/smart-sentry.js`

## 11. 版本管理

### 11.1 Git分支管理
- master：主分支，用于发布稳定版本
- develop：开发分支，用于集成开发
- feature/*：功能分支，用于开发新功能
- hotfix/*：修复分支，用于修复生产环境问题

### 11.2 版本号规则
- 格式：主版本号.次版本号.修订号
- 主版本号：重大功能变更
- 次版本号：新功能添加
- 修订号：bug修复

## 12. 联系方式

- 项目维护者：zhuoluodada@qq.com
- 技术支持：请提交Issue到项目仓库

## 13. 附录

### 13.1 核心API列表

#### 访客管理
- `POST /visitor-api/visitor/record/add` - 添加访客记录
- `GET /visitor-api/visitor/record/page` - 分页查询访客记录
- `PUT /visitor-api/visitor/record/update` - 更新访客记录
- `PUT /visitor-api/visitor/record/confirm` - 确认访客
- `GET /visitor-api/visitor/record/detail/{id}` - 获取访客详情

#### 审批人管理
- `POST /visitor-api/reviewer/add` - 添加审批人
- `GET /visitor-api/reviewer/page` - 分页查询审批人
- `PUT /visitor-api/reviewer/update` - 更新审批人
- `DELETE /visitor-api/reviewer/delete/{id}` - 删除审批人

### 13.2 核心实体关系

```
访客记录(VisitorsRecord) ── 1:N ── 审批人(Reviewer)
访客记录 ── N:1 ── 部门(Department)
访客记录 ── N:1 ── 员工(Employee)
```

### 13.3 系统流程图

#### 访客预约流程
1. 访客在H5端填写预约信息
2. 系统保存访客记录，状态为"待审批"
3. 审批人在Web端收到审批通知
4. 审批人审批通过或拒绝
5. 系统更新访客记录状态
6. 访客在H5端查看审批结果

#### 访客确认流程
1. 访客到达现场
2. 管理员在Web端确认访客
3. 系统更新访客记录状态为"已确认"
4. 生成访客二维码
5. 访客通过二维码进出

---

**文档版本**：v1.0.0  
**更新日期**：2025-11-26  
**编写人**：AI Assistant
