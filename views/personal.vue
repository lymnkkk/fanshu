<template>
	<div class="personal-show">
		<div class="basic-holder">
			<router-link :to="'/logout/'">
				<span class="set">设置</span>
			</router-link>
			<div class="avatar">
				<img :src="avatar">
			</div>
			<div class="name" @click="editName">
				{{userName}}<i class="fa fa-pencil"></i>
			</div>
		</div>
		<router-link :to="'/perArticle/'">
			<div class="pub-article">
				<i class="fa fa-file-text-o"></i>
				<span>我发表的文章</span>
			</div>
		</router-link>
		
		<router-link :to="'/perPubVote/'">
			<div class="part-vote">
				<i class="fa fa-list"></i>
				<span>我发表的投票</span>
			</div>
		</router-link>

		<router-link :to="'/perVote/'">
			<div class="part-vote">
				<i class="fa fa-bar-chart-o"></i>
				<span>我参与的投票</span>
			</div>
		</router-link>

		<div class="shade" v-show="shadeShow">
			
		</div>
		<div class="info" v-show="shadeShow">
			<div class="info-occu">
				<p>修改昵称</p>
				<input type="text" maxlength="10" v-model="newName">
			</div>
			<div class="button-cancel" @click="cancelShade">保存</div>
		</div>
	</div>
</template>
<script>
	export default{
		data(){
			return{
				userId:0,
				avatar:'../assets/avatar.png',
				userName:'',
				shadeShow:false,
				newName:''
			}
		},
		methods:{
			setHeight(){
              this.height=window.screen.height
              document.querySelector('.personal-show').style.height=(this.height-40)+'px'
            },
			getInfo(){
				let _this=this
				this.userId=this.$store.state.userId
				console.log(this.userId)
				if(this.userId>0){
					//获取用户信息
					this.$ajax({
						method:'post',
						url:'http://localhost:80/fanshu/api/getInfo.php',
						data:{
							userId:_this.userId
						},
						transformRequest:[function(data){
							let ret=''
							for(let it in data){
								ret+=encodeURIComponent(it)+'='+
										encodeURIComponent(data[it])+'&'
							}
							return ret
						}]
					}).then(function(response){
						_this.userName=response.data.name
						_this.newName=response.data.name
						_this.avatar=response.data.avatar
						console.log(response.data.name+'<br>'+response.data.avatar)
					}).catch(function(error){
						console.log(error)
					})
				}else{
					console.log(this.userId)
				}
			},
			cancelShade(){
				this.shadeShow=false
				let _this=this
				this.$ajax({
					url:'http://localhost:80/fanshu/api/edit_name.php',
					method:'post',
					data:{
						userName:_this.newName,
						userId:_this.$store.state.userId
					},
					transformRequest:[function(data){
                      let ret=''
                      for(let it in data){
                          ret+=encodeURIComponent(it)+'='
                              +encodeURIComponent(data[it])+'&'
                      } 
                      return ret
                    }]
				}).then(function(response){
					_this.userName=response.data
					_this.$store.state.userName=response.data
				}).catch(function(error){
					console.log(error)
				})
			},
			editName(){
				
				this.shadeShow=true
				
			}
		},
		mounted(){
			this.getInfo()
			this.setHeight()
		}
	}
</script>
<style scoped>
	.personal-show{
		width:100%;
		height:100%;
	}
	.basic-holder{
		width:100%;
		text-align:center;
		position:relative;
		background:#fff;
		
		overflow:hidden;
	}
	.basic-holder span{
		position:absolute;
		top:10px;
		right:20px;
	}
	.avatar{
		width:80px;
		height:80px;
		margin:20px auto;
		text-align:center;
		border-radius:50%;
		overflow:hidden;
		border:1px solid #954b58;
	}	
	.avatar img{
		width:80px;
	}
	.name{
		font-size:18px;
		color:#954b58;
		font-weight:bold;
		margin-bottom:20px;

	}
	.pub-article,.part-vote{
		width:100%;
		height:40px;
		line-height:40px;
		margin-top:5px;
		background:#fff;
		text-indent:10px;
	}
	.pub-article span{
		margin-left:20px;
		color:#000;
	}
	.part-vote span{
		margin-left:18px;
		color:#000;
	}
	.fa-pencil{
		text-indent:5px;
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

	.info{
		width:200px;
		height:110x;
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
		height:80px;
		border-bottom:1px solid #954b58;
		text-align:center;
	}
	.info-occu input{
		width:80%;
		height:30px;
		outline:none;
		border:none;
		border-bottom:1px solid #ccc;
	}
	.info-occu span{
		line-height:30px;
		font-size:16px;
	}
	.info-occu p{
		line-height:40px;
		fonr-size:12px;
	}
	.button-cancel{
		text-align:center;
		font-size:16px;
		color:#954b58;
		line-height:30px;
	}
	.set{
		color:#000;
	}
</style>