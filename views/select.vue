<template>
	<div class="select-show"> 
		<router-link :to="'/edit/'">
			<div class="edit-article">发表文章</div>
		</router-link>
		<router-link :to="'/vote1/'">
			<div class="edit-vote bottom">发起投票(图文结合)</div>
		</router-link>
		<router-link :to="'/vote2/'">
			<div class="edit-vote">发起投票(纯文本)</div>
		</router-link>

	</div>
	
</template>
<script>
	export default{
		data(){
			return{
				occu:true
			}
		},
		methods:{
			
			cancelShade(){
				this.occu=false
				
			},
		},
		mounted(){
			
		}
		
	}
</script>
<style scoped>
	.select-show{
		width:98%;
		border-radius:4px;
		margin:0 auto;
		background:#fff;
	}	
	.edit-article,.edit-vote{
		width:98%;
		margin:0 auto;
		font-size:14px;
		color:#954b58;
		font-weight:bold;
		background:#fff;
		padding:10px 0;
	}
	.edit-article,.bottom{
		border-bottom:1px solid #954b58;
	}
	.edit-article{
		margin-top:10px;
	}
</style>