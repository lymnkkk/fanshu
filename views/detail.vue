<template>
	<div class="detail-show">
		
		
		<div class="headerImg-holder">
			<img :src="article.headerImg">
			<div class="shade"></div>
		</div>
		<div class="title-holder">
			<h2>{{article.title}}</h2>
			<div class="info">
				<span>{{article.cat}}</span>
				<span>{{article.userName}}发表于</span>
				<span>{{article.createdAt}}</span>
			</div>
		</div>
		<div class="content-holder content-holder-mod">
			
		</div>
		
	</div>
</template>
<script>
	

	export default{
		data(){
			return{
				id:parseInt(this.$route.params.id),
				content:'aa',
				article:null,
				detail:[],

			}
		},
		methods:{
			
			
		},
		computed:{
	
		},
		methods:{
			getArticle(){
				let _this=this
				this.$ajax({
					url:'http://localhost:80/fanshu/api/get_article.php',
					method:'post',
					data:{
						articleId:_this.id
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){
					_this.article=response.data
					//console.log(response.data)
					_this.$nextTick(function(){
						document.querySelector('.content-holder').innerHTML=response.data.content
					})
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
	.detail-show{
		width:100%;
		height:100%;
		background:#fff;
	}
	.headerImg-holder{
		width:100%;
		height:200px;
		overflow:hidden;
		position:relative;
	}
	.headerImg-holder img{
		width:100%;
		height:auto;
	}
	.shade{
		width:100%;
		height:100%;
		background:#000;
		opacity:0.1;
		position:absolute;
		top:0;
		left:0;
		z-index:5;
	}
	.title-holder{
		width:94%;
		margin:10px auto;
	}
	.info{
		margin:5px 0;
		font-size:12px;
		color:#bbb;
	}
	.content-holder{
		width:94%;
		margin:0 auto;
		overflow:hidden;
	}
	
</style>