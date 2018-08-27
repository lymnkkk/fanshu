# 番属

番属是一个Web App，番属致力于给热爱动漫的同好们提供一个友好交流，发表看法，互动参与的地方，用于可以发表专栏文章，文章分为动漫资讯、动漫杂谈，同人创作三个板块，用户还可以发起投票及参与投票。番属的灵感来源是bilibili的专栏专区，在此基础上添加投票的功能。

### 开发环境：
* Sublime
* Node 
* MySQL

### 技术栈：
前端：
* 单页面应用Vue2
* 状态管理Vuex
* 前端路由Vue-Router
* 通信库axios
* 构建工具webpack
* 富文本编辑器vue-quill-editor
* UI框架element-ui

后端：
* 后台语言PHP
* 数据库MySQL

### 安装依赖
```
npm install
```

### 运行
服务端配置
```
/api/config.php
header('Content-Type:text/html;charset=utf-8');

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PWD', 'root');
define('DB_NAME', 'fanshuapp');

$conn = @mysql_connect(DB_HOST,DB_USER,DB_PWD) or die ('数据库连接错误！'.mysql_error());

@mysql_select_db(DB_NAME) or die ('数据库错误！'.mysql_error());

@mysql_query('SET NAMES UTF8') or die ('字符集错误！'.mysql_error());
```

运行客户端
```
npm run dev
```