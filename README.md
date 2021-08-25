<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:46
 * @LastEditTime: 2021-08-25 13:37:18
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\README.md
-->
# umamusume-calc

dev分支不一定能用, master可以直接打包使用

主要用于赛🐎娘的练习模拟计算, 也支持其他的一些小功能, 具体请看下面的使用说明


# 使用文档

## 开发

```bash
npm install

npm run electron:serve

# 不能使用npm run serve, 因为nodejs中的mysql模块为服务端使用

npm run electron:build
```

将本项目中的`database\umamusume-pbl@date.sql`同步至你的数据库中,将`config.json`中的`sqlcon.sqldomain` 改为你sql服务器所在的地址,运行以下命令即可

```bash
npm install

npm run electron:build
```

## 使用说明

### **练习模拟**

使用6张支援卡, 可以模拟单次或若干次练习次数最后生成盒须图查看结果的数值以及分布情况.

### **单卡分析**

对比支援卡数据(如果有的话), 并且可以对任意练习进行单次模拟比较数据

### **数据统计**

统计🐎的数据

### **单体🐎更新**

更新🐎, 🐎会更新到用户自己的账户数据中(表)

包括数值及其配置等

### **插入, 修改支援卡数据**

可以选择插入到数据库(管理员), 若无管理员账号, 会将🐎更新到表 `supportcard_stu_user`中, 也可以选择将数据更新到本地(Vuex)

### **更新技能**

更新技能, 需要用户具有管理员权限

# TODO LIST

- [x]  新增登录功能

    通过uuid或用户名登录, 返回用户的uuid, 用户名, 用户组, 其中只有用户组为`admin`的用户可以直接更改各种信息, 注册时用户组为`user` , 密码通过sha256加密

- [x]  将初始数据导入到vuex中, 实现数据形式的统一
- [x]  技能选择模块
- [x]  根据技能的属性修改技能的icon, 背景色等.
- [x]  在成品🐎增加各种适性

    具体格式 db: json

    ```json
    {
    	"逃げ":"A",
    	"ダート":"G",
    	"中距離":"B",
    	...
    }
    ```

- [x]  在成品🐎中增加技能

    格式 db: json, js: Array, 第一个技能默认为固有,使用属性`id`为技能id, `level`为技能等级
    - [x] 添加了除固有外的技能模块
    ```json
    [{"id":"1", "level":"3"},"4",...]
    ```
    - [x] 添加了固有, 没有加等级
