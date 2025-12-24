const path = require('path');
// const CompressionWebpackPlugin = require('compression-webpack-plugin');
// const UglifyjsWebpackPlugin = require('uglifyjs-webpack-plugin');
// const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer');
// const ScriptExtHtmlWebpackPlugin = require('script-ext-html-webpack-plugin');
// const SentryPlugin = require('@sentry/webpack-plugin');
const resolve = dir => path.join(__dirname, dir);

// 项目配置
const projectConfig = require('./src/config/index.js');

// 生产环境，测试和正式
const isProductionEnv = ['production'].includes(process.env.NODE_ENV);
const isProductionAppEnv = ['prod', 'pre'].includes(process.env.VUE_APP_ENV);

module.exports = {
  publicPath: projectConfig.publicPath,
  // 生产环境构建文件的目录
  outputDir: 'dist',
  // outputDir的静态资源(js、css、img、fonts)目录
  assetsDir: 'static',
  // eslint检测 按需开启
  lintOnSave: !isProductionEnv,
  // 如果你不需要生产环境的 source map，可以将其设置为 false 以加速生产环境构建。
  productionSourceMap: false,
  devServer: {
    // 设置主机地址
    host: '0.0.0.0',
    // 设置默认端口
    port: 5678,
    // 禁用host验证
    disableHostCheck: true,
    // 启动后打开浏览器
    open: true,
    overlay: {
      //  当出现编译器错误或警告时，在浏览器中显示全屏覆盖层
      warnings: false,
      errors: true
    }
    // proxy: {
    //   //配置跨域
    //   '/api': {
    //       // 接口前缀
    //       target: "https://sit.smart-h5.1024lab.net/api",
    //       // ws:true,
    //       changOrigin:true,
    //       // 改写规则，把/api 替换为/
    //       pathRewrite:{
    //           '^/api':'/'
    //       }
    //   }
    // }
  },
  css: {
    // 是否使用css分离插件 ExtractTextPlugin 是否将组件中的 CSS 提取至一个独立的 CSS 文件中 (而不是动态注入到 JavaScript 中的 inline 代码)。
    extract: isProductionEnv,
    // 开启 CSS source maps
    sourceMap: false,
    // 使用vw布局去掉这个
    requireModuleExtension: true,
    loaderOptions: {
      // 引入全局变量
      scss: {
        additionalData: `@import "@/assets/css/index";` // 全局引入
      }
    }
  },
  configureWebpack: config => {
    config.name = projectConfig.title;
    
    // 配置优化选项，暂时禁用Terser压缩，解决打包错误
    if (process.env.NODE_ENV === 'production') {
      config.optimization = {
        ...config.optimization,
        minimizer: []
      };
    }
  },

  chainWebpack: config => {
    // 移除资源预加载(路由懒加载才能正常使用)
    config.plugins.delete('preload');
    config.plugins.delete('prefetch');

    // 别名 alias
    config.resolve.alias
      .set('@', resolve('src'))
      .set('assets', resolve('src/assets'))
      .set('api', resolve('src/api'))
      .set('views', resolve('src/views'))
      .set('components', resolve('src/components'));

    // 应用名字
    config.plugin('html').tap(args => {
      args[0].title = projectConfig.title;
      return args;
    });

    // 设置保留空格
    config.module
      .rule('vue')
      .use('vue-loader')
      .loader('vue-loader')
      .tap(options => {
        options.compilerOptions.preserveWhitespace = true;
        return options;
      })
      .end();

    // 确保webpack使用浏览器兼容的配置
    config.target('web');

    // 修复浏览器环境中process对象不可用的问题
    config.plugin('define').tap(args => {
      // 只设置必要的环境变量，避免替换整个process.env对象导致的语法错误
      const envVars = {};
      for (const key in process.env) {
        if (process.env.hasOwnProperty(key)) {
          envVars[`process.env.${key}`] = JSON.stringify(process.env[key]);
        }
      }
      return [{
        ...args[0],
        ...envVars,
        'global': 'window'
      }];
    });

    // 配置node选项，让webpack知道这些是Node.js内置模块，提供空对象
    config.node
      .set('module', 'empty')
      .set('fs', 'empty')
      .set('path', 'empty')
      .set('os', 'empty')
      .set('crypto', 'empty')
      .set('child_process', 'empty')
      .set('console', true);

    // ==================== 生产环境配置 begin ====================
    if (isProductionEnv) {
      const TerserWebpackPlugin = require('terser-webpack-plugin');
      const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer');
      const ScriptExtHtmlWebpackPlugin = require('script-ext-html-webpack-plugin');
      const SentryPlugin = require('@sentry/webpack-plugin');
      const CompressionWebpackPlugin = require('compression-webpack-plugin');

      // 打包分析
      config.plugin('webpack-report').use(BundleAnalyzerPlugin, [
        {
          analyzerMode: 'static'
        }
      ]);
      // 不显示源码
      config.devtool('cheap-source-map');

      // cdn
      config.plugin('html').tap(args => {
        args[0].cdn = projectConfig.cdn.cdnResource;
        // 压缩html中的css
        args[0].minify.minifyCSS = true;
        return args;
      });
      // 指定资源加载cdn
      config.externals(projectConfig.cdn.externals);

      // 开启gzip , Nginx上也需要配置gzip才会生效
      config
        .plugin('compression')
        .use(CompressionWebpackPlugin)
        .tap(() => [
          {
            // 压缩 js 与 css
            test: new RegExp(
              '\\.(js|css)$'
            ),
            // 资源文件大于10240B=10kB时会被压缩
            threshold: 10240,
            // 最小压缩比达到0.8时才会被压缩
            minRatio: 0.8
          }
        ]);

      // sentry - 暂时禁用，解决构建错误
      // if (isProductionAppEnv) {
      //   config.plugin('sentry').use(SentryPlugin, [{
      //     ignore: ['node_modules'],
      //     include: './dist', // 上传dist文件的js
      //     configFile: './.sentryclirc' // 配置文件地址
      //   }]);
      // }

      // 暂时移除Terser配置，解决打包错误
      // config.optimization.minimizer = [
      //   new TerserWebpackPlugin({
      //     // 生产环境推荐关闭 sourcemap 防止源码泄漏
      //     // 服务端通过前端发送的行列，根据 sourcemap 转为源文件位置
      //     sourceMap: false,
      //     terserOptions: {
      //       warnings: false,
      //       compress: {
      //         drop_console: true,
      //         drop_debugger: true
      //       }
      //     }
      //   })
      // ];

      config
        .plugin('ScriptExtHtmlWebpackPlugin')
        .after('html')
        .use(ScriptExtHtmlWebpackPlugin, [
          {
            // 将 runtime 作为内联引入不单独存在
            inline: /runtime\..*\.js$/
          }
        ])
        .end();

      config.optimization.splitChunks({
        chunks: 'all',
        cacheGroups: {
          commons: {
            name: 'chunk-commons',
            test: resolve('src/components'),
            minChunks: 3, //  模块至少使用次数
            priority: 5,
            reuseExistingChunk: true // 模块嵌套引入时，判断是否复用已经被打包的模块
          },
          node_vendors: {
            name: 'chunk-libs',
            chunks: 'initial',
            test: /[\\/]node_modules[\\/]/,
            priority: 10
          },
          vantUI: {
            name: 'chunk-vantUI',
            priority: 20,
            test: /[\\/]node_modules[\\/]_?vant(.*)/
          }
        }
      });
    }
    // ==================== 生产环境配置 end ====================
  }
};
