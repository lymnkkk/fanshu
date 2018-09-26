<template>
	<div>
		<arti :arti="articleList"></arti>
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
				articleList:null
			}
		},
		methods:{
			getArticle(){
				console.log(this.$store.state.userId)
				let _this=this
				this.$ajax({
					// url:'http://localhost:8080/fanshu/api/perArticle.php',
					url:`${config.api}/perArticle.php`,
					method:'post',
					data:{
						userId:_this.$store.state.userId
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){
					_this.articleList=response.data
				}).catch(function(error){
					console.log(error)
				})
				
			}
		},
		mounted(){
			this.getArticle()
		}
	}
</script>
<style scoped>
	
</style>