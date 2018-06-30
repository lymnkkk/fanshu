const routers=[
	{
		path:'/index',
		component: (resolve) => require(['./views/index.vue'], resolve)
	},
	{
		path:'/index/:id',
		component: (resolve) => require(['./views/index.vue'], resolve)
	},
	{
		path:'/vote/:id',
		component: (resolve) => require(['./views/vote.vue'],resolve)
	},
	{
		path:'/select/',
		component: (resolve) => require(['./views/select.vue'],resolve)
	},
	{
		path:'/edit/',
		component: (resolve) => require(['./views/edit-article.vue'],resolve)
	},
	{
		path:'/vote1/',
		component: (resolve) => require(['./views/edit-vote1.vue'],resolve) 
	},
	{
		path:'/vote2/',
		component: (resolve) => require(['./views/edit-vote2.vue'],resolve) 
	},
	{
		path:'/detail/:id',
		component: (resolve) => require(['./views/detail.vue'],resolve)
	},
	{
		path:'/login/',
		component: (resolve) => require(['./views/login.vue'],resolve)
	},
	{
		path:'/register/',
		component: (resolve) => require(['./views/register.vue'],resolve)
	},
	{
		path:'/personal/',
		component: (resolve) => require(['./views/personal.vue'],resolve)
	},
	{
		path:'/result/:id',
		component: (resolve) => require(['./views/vote-result.vue'],resolve)
	},
	{	
		path:'/perArticle/',
		component: (resolve) => require(['./views/perArticle.vue'],resolve)
	},
	{	
		path:'/perVote/',
		component: (resolve) => require(['./views/perVote.vue'],resolve)
	},
	{
		path:'/allArticle/',
		component:(resolve) => require(['./views/all-article.vue'],resolve)
	},
	{
		path:'/allVote/',
		component:(resolve) => require(['./views/all-vote.vue'],resolve)
	},

	{
		path:'*',
		redirect:'/index'
	}
]
export default routers;