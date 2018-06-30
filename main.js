//导入Vue框架
import Vue from 'vue';
import VueRouter from 'vue-router';
import Routers from './router';
import Vuex from 'vuex';
//导入app.vue组件
import App from './app.vue';
import './style.css';
import './zh_CN.js';
import { Upload } from 'element-ui';
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

import axios from 'axios'
Vue.prototype.$ajax=axios;

Vue.use(Upload);

var VueTouch=require('vue-touch');
Vue.use(VueTouch,{name:'v-touch'});

Vue.use(VueRouter)

const RouterConfig={
	//使用HTML5 的 History 路由模式
	mode:'history',
	routes:Routers
};

const router = new VueRouter(RouterConfig);

router.beforeEach((to, from, next) => {
    window.document.title = to.meta.title;
    next();
});

router.afterEach((to, from, next) => {
    window.scrollTo(0, 0);
});

Vue.use(Vuex)

const store=new Vuex.Store({
	//vuex的配置
	state:{
		userId:0,
		userName:'',
		voteList:[],
		articleList:[],
		voteResult:[],
	},
	mutations:{
		//获取用户的id
		getId(state,n){
			state.userId=n
		},
		getUsername(state,name){
			state.userName=name
		}
	},
	actions:{
		
		
	}
})



//创建Vue根实例
new Vue({
	el:'#app',
	router:router,
	store:store,
	render:h => h(App)
})
