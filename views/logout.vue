<template>
	<div class="">
		<div class="logout" @click="logout">
			退出登录
		</div>
	</div>
</template>
<script>
	export default{
		methods:{
			logout(){
				this.$store.state.userId=0
				this.$store.state.userName=''
				this.$router.push('/index/')
			}
		}
	}
</script>
<style scoped>
	.logout{
		margin:10px auto;
		width:98%;
		height:30px;
		border-radius:4px;
		text-align:center;
		line-height:30px;
		background:#fff;
		color:#954b58;
	}
</style>