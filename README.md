<!--
 * @Author: your name
 * @Date: 2021-06-15 17:31:46
 * @LastEditTime: 2021-06-30 14:41:48
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
仿官方hp

### 练习模拟模块
使用6张支援卡, 可以模拟单次或若干次练习次数最后生成盒须图查看结果的数值以及分布情况.

### 数据分析模块
查看导入到库中各种支援卡的使用数量等统计

### 🐎更新模块
更新自己的🐎.

包括数值及其配置等(未来加入马场适性之类的)

### 更新支援卡数据(admin)
便捷更新支援卡数据

### 更新技能(admin)
更新技能

### TODOLIST
- [ ] 加入用户注册, 登录等功能.
- [ ] 获取🐎头像, 支援卡卡面等.
- [ ] 脱离数据库进行全部操作(新出的卡和🐎还是要手动导)

