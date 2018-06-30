<template>
	<div class="login-show">
		<div class="logo-holder">
			<img src="../assets/logo.png">
		</div>
		<div class="register-holder">
			<div class="select">
				<div class="mobile"
					:class="{'mobile-on':reg === 'mobile'}"
					@click="selectMobile">
					手机注册
				</div>
				<div class="email"
					:class="{'email-on':reg === 'email'}"
					@click="selectEmail">
					邮箱注册
				</div>
			</div>
			<div class="info">
				<div class="mobile-reg" v-show="reg === 'mobile'">
					<span>手机号码</span>
					<input type="number" placeholder="请输入手机号" v-model="account">
				</div>
				<div class="email-reg" v-show="reg === 'email'">
					<span>邮箱账号</span>
					<input type="email" placeholder="请输入邮箱地址" v-model="account">
				</div>
				<div class="pass-reg">
					<span>登录密码</span>
					<input type="password" placeholder="请输入登录密码" v-model="password">
				</div>
				<div class="login-holder">
					<router-link :to="'/login/'">
						<span>已有账号，去登录</span>
					</router-link>
				</div>
			</div>
			<button class="button-reg" @click="submitFormat">立即注册</button>
		</div>

		<div class="shade" v-show="isError">
			
		</div>
		<div class="error-info" v-show="isError">
			<div class="info-occu">
				<span class="tip">提示</span>
				<p v-if="occu">该手机号码已注册</p>
				<p v-if="lack">信息不完整</p>
			</div>
			<div class="button-cancel" @click="cancelShade">确定</div>
		</div>
	</div>
</template>
<script>
	export default{
		data(){
			return{
				reg:'mobile',
				account:'',
				password:'',
				height:0,
				isError:false,
				occu:false,
				lack:false
			}
		},
		methods:{
			setHeight(){
				this.height=window.screen.height
				document.querySelector('.login-show').style.height=(this.height-40)+'px'
			},
			selectMobile(){
				this.reg='mobile'
			},
			selectEmail(){
				this.reg='email'
			},
			cancelShade(){
				this.isError=false
				if(this.occu===true){
					this.occu=false
				}else{
					this.lack=false
				}
			},
			submitFormat(){
				let _this=this

				if(this.account === '' || this.password === ''){

					this.lack = true
					this.isError=true

				}else{

					this.$ajax({
						method:'post',
						url:'http://localhost:80/fanshu/api/register.php',
						headers: {
						    'Content-Type': 'application/x-www-form-urlencoded'
						},
						data:{
							account:this.account,
							password:this.password
						},
						transformRequest: [function (data) {
						    // Do whatever you want to transform the data
						    let ret = ''
						    for (let it in data) {
						      ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						    }
						    return ret
						}],
					}).then(function(response){
						if(response.data === 0){
							console.log('手机号码已被占用')
							_this.isError=true
							_this.occu=true
							console.log(_this.isError)
						}else{
							_this.$router.push('/index/')
							_this.$store.commit('getId',response.data.id)
							_this.$store.commit('getUsername',response.data.userName)
							
						}
					}).catch(function(error){
						console.log(error);
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
		overflow:hidden;

	}
	.logo-holder{
		width:100%;
		height:100px;
		
		padding:30px 0;
		text-align:center;
	}
	.logo-holder img{
		width:200px;
		height:auto;
	}
	.register-holder{
		width:96%;
		margin:0 auto;
		
	}
	.select{
		width:70%;
		height:30px;
		margin:0 auto;
		background:#fff;
		border:1px solid #954b58;
		border-radius:15px;
	}
	.mobile{
		width:50%;
		float:left;
		text-align:center;
		height:30px;
		line-height:30px;
		border-top-left-radius:15px;
		border-bottom-left-radius:15px;
	}
	.mobile-on{
		background:#954b58;
		color:#fff;
	}
	.email{
		width:50%;
		float:left;
		background:#fff;
		text-align:center;
		height:30px;
		line-height:30px;
		border-top-right-radius:15px;
		border-bottom-right-radius:15px;
	}
	.email-on{
		background:#954b58;
		color:#fff;
	}
	.info{
		margin:30px auto;
		width:96%;
	}
	.mobile-reg,.email-reg{
		width:100%;
		border-bottom:1px solid #ccc;
		height:30px;
		margin-bottom:10px;
	}
	.mobile-reg input,.email-reg input{
		margin-left:10px;
		width:70%;
		outline:none;
		border:none;
	}
	.pass-reg{
		width:100%;
		border-bottom:1px solid #ccc;
		height:30px;
		margin-bottom:10px;
	}
	.pass-reg input{
		margin-left:10px;
		width:70%;
		outline:none;
		border:none;
	}
	.login-holder{
		width:100%;
		height:20px;
		
		margin:0 auto;
		text-align:right;
	}
	.login-holder span{
		color:#954b58;
	}
	.button-reg{
		display:block;
		border:none;
		border-radius:4px;
		background:#954b58;
		width:70%;
		height:40px;
		margin:10px auto;
		color:#fff;
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
		fonr-size:12px;
	}
	.button-cancel{
		text-align:center;
		font-size:16px;
		color:#954b58;
		line-height:30px;
	}
	
</style>