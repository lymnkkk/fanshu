<template>
	<div class="list">
		<div class="article-reco">
			<p>更多文章</p>
		</div>
		
		<arti :arti="getList"></arti>
			
		<div class="load" @click="load" v-if="isFull === false">
			加载更多
		</div>
		<div class="data" v-if="isFull === true">
			已经没有更多数据了
		</div>
	</div>
</template>
<script>
	import config from '../config'
	import arti from '../components/article.vue'
	export default{
		components:{
			arti
		},
		data(){
			return{
				start:0,
				article:null,
				isFull:false
			}
		},
		methods:{
			getArticleList(){
				let _this=this
				this.$ajax({
					//url:`${config.api}/get_articleList.php`'http://localhost:8080/fanshu/api/get_articleList.php',
					url:`${config.api}/getArticleList.php`,
					method:'post',
					data:{
						start:_this.start,
						end:3
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){
					if(_this.article===null){
						_this.article=response.data

					}else{
						let index=response.data.length
						let i=0
						for(i;i<index;i++){
							_this.article.push(response.data[i])
						}
						if(_this.article.length>=response.data[i-1].length){
							console.log('1')
							_this.isFull=true
						}

					}
					

					/*
					console.log(typeof response.data)
					console.log(response.data instanceof Array)
					console.log(_this.$store.state.articleList)
					*/
				}).catch(function(error){
					console.log(error)
				})
			},

			load(){
				this.start+=3
				this.getArticleList()
			}
		},
		computed:{
			getList(){
				return this.article
			}
		},
		mounted(){
			this.getArticleList()		
			let $list=this.$refs.list
		}
	}
</script>
<style scoped>

	.load{
		width:100px;
		height:30px;
		line-height:30px;
		border:1px solid #ccc;
		border-radius:5px;
		background:#fff;
		text-align:center;
		margin:10px auto;
	}
	.data{
		width:100%;
		height:30px;
		line-height:30px;
		text-align:center;
		margin:10px auto;
	}
</style>