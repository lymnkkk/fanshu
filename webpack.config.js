var path=require('path');
var ExtractTextPlugin=require('extract-text-webpack-plugin');
// const {VueLoaderPlugin}=require('vue-loader');

var config={

	mode: "development",
	
	entry:{
		main:'./main'
	},
	output:{
		path:path.join(__dirname,'./dist'),
		publicPath:'/dist/',
		filename:'main.js'
	},
	module:{
		rules:[
			{
				test:/\.vue$/,
				loader:'vue-loader',
				options:{
					loaders:{
						css:ExtractTextPlugin.extract({
							use:'css-loader',
							fallback:'vue-style-loader'
						})
					}
				}
			},
			{
				test:/\.js$/,
				loader:'babel-loader',
				exclude:/node_modules/
			},
			{
				//当webpack编译过程中遇到require()或import语句导入一个后缀名为.css的文件，
				//先将它通过css-loader转换，再通过style-loader转换
				test:/\.css$/,
				use:ExtractTextPlugin.extract({
					use:'css-loader',
					fallback:'style-loader'	
				})
			},
			{
				test:/\.(gif|jpg|png|woff|svg|eot|ttf)\??.*$/,
				loader:'url-loader?limit=1024'
			}
		]
	},
	plugins:[
		//重命名提取后的css文件
		new ExtractTextPlugin("main.css"),
		// new VueLoaderPlugin()
	]
}

module.exports = config;