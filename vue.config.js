/*
 * @Author: Akarichan
 * @LastEditors: Akarichan
 */
module.exports = {
    lintOnSave:false,
    publicPath: '',
    pluginOptions: {
      electronBuilder: {
        nodeIntegration: true, // 启用fs
        builderOptions: {
          win:{
            target:[
              "nsis"
            ],
            icon: './icons/icon_256.ico'
          },
          extraResources:  { // 拷贝dll等静态文件到指定位置
            from: "./public",
            to: "./public"
          },
          asar: false,
        },  
      }
    }
  } 