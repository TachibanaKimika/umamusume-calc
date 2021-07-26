<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:46
 * @LastEditTime: 2021-07-26 20:03:49
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \umamusume-databaseh:\Electron\electron-vue\umamusume-calc\README.md
-->
# umamusume-calc

## 开发
```
npm install
npm run electron:serve 
# 不能使用npm run serve, 因为mysql模块为服务端使用
npm run electron:build
```
## 使用
将本项目中的`database\umamusume-pbl@21.06.28.sql`同步至你的数据库中,将`package.json`中的`config.sqldomain`改为你sql服务器所在的地址,运行以下命令即可
```
npm install
npm run electron:build
```


## 功能概述
### 主页
hp

### 练习模拟
使用6张支援卡, 可以模拟单次或若干次练习次数最后生成盒须图查看结果的数值以及分布情况.

### 单卡分析
对比支援卡数据(如果有的话), 并且可以对任意练习进行单次模拟比较数据

### 数据统计
统计我自己插入的🐎的数据

### 🐎更新(admin)
更新🐎, 需要管理员权限

包括数值及其配置等

### 插入, 修改支援卡数据
可以选择插入到数据库(管理员), 也可以选择将数据更新到本地(Vuex)

### 更新技能(admin)
更新技能

### TODOLIST
<!-- - [ ] 加入用户注册, 登录等功能.
- [ ] 获取🐎头像, 支援卡卡面等.
- [ ] 脱离数据库进行全部操作(新出的卡和🐎还是要手动导) -->
