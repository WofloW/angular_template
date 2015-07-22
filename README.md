# 1. 开发流程

	npm install
	bower install

	随意使用js coffee,
	html(templateUrl: "app/home/home.html")
	jade(template: require '../home/home.jade')

# 2. 部署方式

	Gulp develop

# 3. 链接过程

## gulp develop触发webpack
	打包所有js到tmp/app/app.js

## webpack找到client/app/entry.coffee开始加载
	coffee 	用coffee loader转换成js
	html 		用"html?attrs=false"防止js内嵌base64图片
	jade 		用jade loader转换成html

## client/entry.coffee初始化angular
	加载core/entry.coffee和home/entry.coffee

## core/entry.coffee
	加载route.config.coffee (ui_router比原生angular router多state功能)
		route里的state和url都能成为入口,第一次是会用otherwise的/进入home.jade
	加载example.service.coffee (跟model一样干累活的,可能会重复使用的功能)
		两种写法，
			写法1，
			function写法
			var ExampleService = function() {
			  this.name = "World";
			  this.getPrefix = function(){
			    return "The"
			  }
			};

			module.exports = ExampleService;
			如果写成jade，要记得在function最后return @

			写法2，
			class写法
			class ExampleService
			  constructor: ->
			    @name = 'DKT'
			  getPrefix: ->
			    'SB'
			module.exports = ExampleService

	进入/后触发home.jade，并且加载controller

## home/entry.coffee
	定义HomeController
		controller注入service，并且定义@name和@getPrefix


## home.jade里调用controller缩写vm
	使用controller定义的@name和@getPrefix

## index.html
	自动加载bower的css和js，并不会对npm的自动加载，所以需要手动调用
	bower:css到endbower是加载bower css
	inject:lib:css是加载vendor里的css

## www是执行入口
	负责创建http server和加载server/app.js

## app.js
	加载一堆express组件
	定义api routing，始终sendFile index.html（single page）做法
