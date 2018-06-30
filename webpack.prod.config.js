var webpack=require('webpack')
var htmlWebpackPlugin=require('html-webpack-plugin')
var ExtractTextPlugin=require('extract-text-webpack-plugin')
var merge=require('webpack-merge')
var webpackBaseConfig =require('./webpack.config.js')
var UglifyJsPlugin=require('uglifyjs-webpack-plugin')


//清空基本配置的插件列表
webpackBaseConfig.plugins=[]

module.exports=merge(webpackBaseConfig,{
	output:{
		publicPath:'/dist/',
		//将入口文件重命名为带有20位hash值的文件
		//更新上线后一般都希望用户能及时地看到内容，所以给打包后的css和js文件的名称都加了20位的hash值，
		//这样文件名就唯一了，主要不对html文件设置缓存，上线后立即就可以加载最新的静态资源
		filename:'[name].[hash].js'
	},
	plugins:[
		new ExtractTextPlugin({
			//提取css，并重命名为带有20位hash值的唯一文件
			filename:'[name].[hash].css',
			allChunks:true
		}),
		//定义当前node环境为生产环境
		new webpack.DefinePlugin({
			'process.env':{
				NODE_ENV:'"production"'
			}
		}),
		//压缩js
		/*
		new webpack.optimize.UglifyJsPlugin({
			compress:{
				warnings:false
			}
		}),
		*/
		//提取模板，并保存入口html文件
		//这是用来生成html文件的，他通过template选项来读取指定的模板index.ejs，
		//然后输出到filename指定的目录，也就是demo/index_prod.html
		new htmlWebpackPlugin({
			filename:'../index_prod.html',
			template:'./index.ejs',
			chunks:["index_prod"],
			inject:false
		})
	],
	//压缩js
	optimization: {
        minimizer: [
            new UglifyJsPlugin({
                uglifyOptions: {
                    compress: false
                }
            })
        ]
    },
})