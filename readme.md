## SLPlat项目简介

- SLPlat基于开源项目ibase4j调整而得的，专注于本科院校实践类课程的教学与考试服务的平台
- 该平台是Java语言的分布式系统架构，使用Spring整合开源框架。
- 使用Maven对项目进行模块化管理，提高项目的易开发性、扩展性。

## 主要功能
 1. 数据库：Druid数据库连接池，监控数据库访问性能，统计SQL的执行性能。
 2. 持久层：mybatis持久化，使用MyBatis-Plus优化，减少sql开发量；aop切换数据库实现读写分离。Transtraction注解事务。
 3. MVC： 基于spring mvc注解,Rest风格Controller。Exception统一管理。
 4. 调度：Spring+quartz, 可以查询、修改周期、暂停、删除、新增、立即执行，查询执行记录等。
 5. 基于session的国际化提示信息，职责链模式的本地语言拦截器,Shiro登录、URL权限管理。会话管理，强制结束会话。
 6. 缓存和Session：注解redis缓存数据；shiro实现redis分布式session同步，重启服务会话不丢失。
 7. 多系统交互：Dubbo,ActiveMQ多系统交互，ftp/sftp/fastdafs发送文件到独立服务器，使文件服务分离。
 8. 前后端分离：没有权限的文件只用nginx代理即可。
 9. 日志：log4j2打印日志，业务日志和调试日志分开打印。同时基于时间和文件大小分割日志文件。
 10. QQ、微信、新浪微博第三方登录。
 11. 工具类：excel导入导出，汉字转拼音，身份证号码验证，数字转大写人民币，FTP/SFTP/fastDFS上传下载，发送邮件，redis缓存，加密等等。

## 技术选型
    ● 核心框架：Spring Framework + Dubbo
    ● 安全框架：Apache Shiro
    ● 任务调度：Spring + Quartz
    ● 持久层框架：MyBatis + MyBatis-Plus
    ● 数据库连接池：Alibaba Druid
    ● 缓存框架：Redis
    ● 会话管理：Spring-Shiro + redis
    ● 日志管理：SLF4J、Log4j2
    ● 前端框架：Angular JS + Bootstrap + Jquery

## 启动说明
    * 项目依赖activemq、Redis和ZooKeeper服务。
    * 使用nginx代理UI：修改配置里的UI目录后重启nginx。
    * 启动命令：
    	 clean package -P build tomcat7:run-war -f pom-sys-service-server.xml
    	 clean package -P build tomcat7:run-war -f pom-sys-web-server.xml
    * 打包命令：
    	 clean package -P build -f pom-sys-service-server.xml
    	 clean package -P build -f pom-sys-service-server.xml
    * 生产环境打包命令：
    	 clean package -P product -f pom-sys-service-server.xml
    	 clean package -P product -f pom-sys-service-server.xml
    
## 版权声明
SLPlat使用 [Apache License 2.0][] 协议.

## License
SLPlat is released under version 2.0 of the [Apache License][].

[Apache License 2.0]: http://www.apache.org/licenses/LICENSE-2.0
[Apache License]: http://www.apache.org/licenses/LICENSE-2.0