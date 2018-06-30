<template>
	<div class="arti-show">

		<div v-for="(article,index) in arti">
			<router-link :to="'/detail/'+article.id">
				<div class="article">
				
					<h2>{{article.title}}</h2>
					<div class="img-holder">
						<img :src="article.headerImg">
					</div>
					
					<div class="arti-desc">
						
					</div>
					
					<div class="arti-state">
						<!--
						<span class="tag">{{arti.tag}}</span>
						<span class="read">{{arti.read}}阅读</span>
						<span class="like"><i class="fa fa-heart-o"></i>{{arti.like}}</span>
						<span class="comment"><i class="fa fa-comment-o"></i>{{arti.comment}}</span>
						-->
					</div>

				</div>
			</router-link>
		</div>
		
	</div>
</template>
<script>
	export default{
		props:{
			arti:{
				type:Array,
				default:[]
			}
		},
		methods:{
			
		},
		mounted(){
			
			
		}
	}
</script>
<style scoped>
	.arti-show{
		width:100%;
	
		
	}
	.article{
		width:96% ;
		margin:5px auto 20px auto;
		background:#fff;
		border-radius:4px;
		color:#000;
	}
	.arti-show h2{
		line-height:1.5;
		font-size:18px;
		margin:0 10px;
		padding:5px 0;
	}
	.img-holder{
		width:100%;
		height:100px;
		overflow:hidden;
	}
	.arti-show img{
		width:100%;
	}
	.arti-desc{
		display:-webkit-box !important;
		overflow:hidden;
		text-overflow:ellipsis;

		word-break:break-all;
		-webkit-box-orient:vertical;
		-webkit-line-clamp:2;
		margin:10px 10px;
		overflow:hidden;
	}
	.arti-state{
		margin:5px 10px;
		overflow:hidden;
		line-height:30px;
		font-size:12px;
	}
	.tag,.read{
		float:left;
		margin-right:15px;
	}
	.comment,.like{
		float:right;
		margin-left:15px;
	}
	i{
		margin-right:3px;
	}
	
</style>