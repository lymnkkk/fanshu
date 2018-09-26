<template>
	<div class="login-show">
		<div class="logo-holder">
			<img src="../assets/logo.png">
		</div>
		<div class="login-holder">
			<input type="text" name="account" class="account" placeholder="手机/邮箱" v-model="account">
			<input type="password" name="password" class="password" placeholder="登录密码" v-model="password">
			<div class="register-holder">
				<router-link :to="'/register/'">
					<span>立即注册</span>
				</router-link>
			</div>
			<div class="button">
				<button @click="submitFormat">立即登录</button>
			</div>
		</div>
		
		<div class="shade" v-show="isError">
			
		</div>
		<div class="error-info" v-show="isError">
			<div class="info-occu">
				<span class="tip">提示</span>
				<p v-if="error">账号或密码错误</p>
				<p v-if="lack">信息不完整</p>
			</div>
			<div class="button-cancel" @click="cancelShade">确定</div>
		</div>
	</div>
</template>
<script>
	import config from '../config'
	export default{
		data(){
			return{
				account:'',
				password:'',
				height:0,
				lack:false,
				error:false,
				isError:false
			}
		},

		methods:{
			setHeight(){
				this.height=window.screen.height
				document.querySelector('.login-show').style.height=(this.height-40)+'px'
			},
			cancelShade(){
				this.isError=false
				if(this.error===true){
					this.error=false
				}else{
					this.lack=false
				}
			},
			submitFormat(){
				let _this=this

				if(this.account === ''||this.password === ''){
					this.isError = true
					this.lack = true
				}else{

					this.$ajax({
						method:'post',
						// url:'http://localhost:8080/fanshu/api/login.php',
						url:`${config.api}/login.php`,
						data:{
							account:this.account,
							password:this.password
						},
						transformRequest:[function(data){
							let ret=''
							for(let it in data){
								ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
							}
							return ret
						}]
					}).then(function(response){
						if(response.data !== 0){
							_this.$router.push('/index/')
							_this.$store.commit('getId',response.data.id)
							_this.$store.commit('getUsername',response.data.userName)
							console.log(_this.$store.state.userId)
						}else{
							_this.isError=true
							_this.error=true
						}
					}).catch(function(error){
						console.log(error)
					})
				}
			}
				
		},
		mounted(){
			this.setHeight()
		}
	}
</script>
<style scoped>
	.login-show{
		width:100%;
		
		background:#fff;

	}
	.logo-holder{
		width:100%;
		height:100px;
		
		padding:40px 0;
		text-align:center;
	}
	.logo-holder img{
		width:200px;
		height:auto;
	}
	.account{
		display:block;
		width:82%;
		margin:0 auto 20px auto;
		height:30px;
		border:none;
		border-bottom:1px solid #ccc;
		text-indent:2px;
		outline:none;
	}
	.password{
		display:block;
		width:82%;
		margin:20px auto 20px auto;
		height:30px;
		border:none;
		border-bottom:1px solid #ccc;
		text-indent:2px;
		outline:none;
	}
	.register-holder{
		width:82%;
		height:20px;
		
		margin:0 auto;
		text-align:right;
	}
	.register-holder span{
		color:#954b58;
	}
	.tip{
		width:82%;
		margin:10px auto;
		text-align:right;
	}
	.tip span{
		color:#954b58;
	}
	button{
		display:block;
		width:82%;
		height:40px;
		color:#fff;
		background:#954b58;
		border:none;
		border-radius:4px;
		margin:20px auto;
	}
	.shade{
		width:100%;
		height:100%;
		background:#000;
		opacity:0.5;
		position:absolute;
		top:0;
		left:0;
		z-index:4;
	}

	.error-info{
		width:200px;
		height:90px;
		background:#fff;
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-100px,-75px);
		z-index:5;
		border-radius:4px;
	}
	
	.info-occu{
		margin:0;
		width:100%;
		height:60px;
		border-bottom:1px solid #954b58;
		text-align:center;
	}

	.info-occu span{
		line-height:30px;
		font-size:16px;
	}
	.info-occu p{
		line-height:30px;
		font-size:12px;
	}
	.button-cancel{
		text-align:center;
		font-size:16px;
		color:#954b58;
		line-height:30px;
	}
	
</style>