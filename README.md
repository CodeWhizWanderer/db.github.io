# db.github.io

# 仿豆瓣app

## 项目页面演示

https://blog.csdn.net/qq_46036316/article/details/132304493

![image-20230815175334615](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175334615.png)

![image-20230815175501782](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175501782.png)

![image-20230815175522181](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175522181.png)

![image-20230815175550115](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175550115.png)

![image-20230815175409735](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175409735.png)

![image-20230815175635949](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175635949.png)

![image-20230815175653278](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175653278.png)

![image-20230815175618949](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815175618949.png)



## 项目目录结构介绍

```te
├── node_modules/      # 依赖的 Node.js 模块
├── public/            # 公共资源，不会被 webpack 处理
│   ├── index.html     # 入口 HTML 文件
│   ├── ...
├── src/               # 项目源码
│   ├── assets/        # 静态资源，如图片、字体等
│   ├── components/    # 可复用的 Vue 组件
│   ├── views/         # 页面级组件，通常由多个组件组成
│   ├── router/        # Vue Router 路由配置
│   ├── store/         # Vuex 状态管理
│   ├── styles/        # 全局样式
│   ├── main.js        # 项目入口文件
│   ├── App.vue        # 根组件
├── www/               # PHP web 根目录，此目录放在wamp64软件目录下
├── .gitignore          # Git 忽略文件配置
├── babel.config.js     # Babel 配置
├── mo.sql        		# 项目数据库
├── package.json        # 项目配置和依赖
├── README.md           # 项目说明文档
```

## 使用步骤

### 把**WWW**文件夹下文件放到**wamp64**软件WWW内

![image-20230815173105430](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815173105430.png)

<center>图 1.1 wamp64软件目录</center>



### npm i安装项目依赖

```bash
npm i           # 安装所有项目依赖
```

![image-20230815173815314](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815173815314.png)

<center>图 1.2 安装所有项目依赖</center>

### 将mo.sql导入**wamp64**软件自带mysql

![image-20230815174230363](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815174230363.png)

<center>图 1.3 导入数据库</center>

### 启动wamp64软件PHP+apache+MySQL服务

![image-20230815174506713](C:\Users\59321\AppData\Roaming\Typora\typora-user-images\image-20230815174506713.png)

<center>图 1.3 启动Wampserver64服务</center>

### 启动vue项目

```ba
npm run serve
```

