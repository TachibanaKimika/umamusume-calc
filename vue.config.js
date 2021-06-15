module.exports = {
    lintOnSave:false,
    pluginOptions: {
      electronBuilder: {
        nodeIntegration: true, // 启用fs
        builderOptions: {
          win:{
            target:'nsis',
          }
        },  
      }
    }
  }