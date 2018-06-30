<template>
	<div class="edit-show">
		<div class="title">
	        <input type="text" placeholder="请输入标题（40字以内）" maxlength="40"
	        	v-model="title">
	    </div>
	    <div 
	    	v-for="(item,index) in voteOption"
	    	class="option"
	    	@click="setOption"
	    	:value="index">
	    		<div class="img-holder">
	    			<img :src="item.img">
	    		</div>
	    		<div class="option-value">
	    			{{item.value}}
	    		</div>
	    		<div :class="{'delete-holder':setNo == index}">
	    		</div>
	    		<i :class="{'fa fa-trash-o align-right':setNo == index}"
	    		   @click.stop="deleteOption" :value="index"></i>
	    </div>

	    <div class="option-holder">
	    	<h2>添加选项</h2>
	    	<div class="upload-holder">
	    		<img-upload :method="method" ref="voteUpload"></img-upload>	  
	    	</div>  	
	    	<input type="text" maxlength="12" placeholder="请输入选项名称"
	    	v-model="value"></input>
	    	<button class="button" @click="addVote">+</button>
	    </div>
	    <div class="submit-holder">
	    	<p v-show="tip" class="pub-tip">信息不完整，请完善信息</p>
	    	<button class="submit" @click="submitFormat">提交投票</button>
	    </div>


	    <div class="pub-shade" v-show="isSuccess">
        </div>
        <div class="pub-success" v-show="isSuccess">

            <p>发表成功</p>
        </div>
	</div>
</template>
<script>
	import imgUpload from '../components/img-upload.vue'

	export default{
		data(){
			return{
				method:'vote',
				value:'',
				voteOption:[],
				setNo:-1,
				title:'',
				tip:false,
				isSuccess:false
			}
		},
		components:{
			imgUpload
		},
		methods:{
			addVote(){
				if(this.$refs.voteUpload.imageUrl=='' || this.value==''){
					
				}else{
					this.voteOption.push(
						{ 
							'img': this.$refs.voteUpload.imageUrl ,
							'value':this.value
						}
					 )
					 this.value=''
					  this.$refs.voteUpload.imageUrl=''
				}
			},
			setOption(event){
				var el=event.currentTarget
				if(this.setNo === el.getAttribute('value')){
					this.setNo=-1
					console.log(this.setNo)
				}else{
					this.setNo=el.getAttribute('value')
					console.log(this.setNo)
				}
			},
			deleteOption(event){
				var el=event.currentTarget
				var index=parseInt(el.getAttribute('value'))
				console.log(index)
				this.voteOption.splice(index,1)
				this.setNo=-1
				console.log(this.voteOption)
			},
			submitFormat(){
				let _this=this

				if(this.voteOption.length < 2 || this.title === ''){
					this.tip=true
				}else{
					this.tip=false
					_this.$ajax({
						url:'http://localhost:80/fanshu/api/add_vote1.php',
						method:'post',
						data:{
							title:_this.title,
							userId:_this.$store.state.userId,
							voteCat:1,
							voteArr:_this.voteOption
						},
						headers: {
						    'Content-Type': 'application/x-www-form-urlencoded'
						},
						transformRequest:[function(data){
							let ret=JSON.stringify(data)
							
							/*
							for(let it in data){
								ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
							}
							*/
							return ret
						}]
					}).then(function(){
						_this.isSuccess=true
                        setTimeout(()=>{
                          _this.isSuccess=false
                          _this.$router.push('/select/')

                       },1000)
					}).catch(function(error){
						console.log(error)
					})
				}
			}
		}
	}
</script>
<style scoped>
.edit-show{
	width:98%;
	height:100%;
	margin:0 auto;
	
}
.title{
    width:100%;
    padding:0 0;
    margin:0 auto 0 auto;
}
.title input{
  	width:100%;
  	outline:none;
  	height:35px;
  	line-height:35px;
  	text-indent:5px;
  	border:none;
  	border-bottom:1px solid #954b58;
}
.option-holder{
	width:100%;
	margin:0 auto;
	background:#fff;
	text-align:center;
	padding:10px 0;
}

.option-holder h2{
	font-size:14px;
	font-weight:normal;
	width:80%;
	margin:10px auto;
}

.option-holder input{
	display:block;
	width:80%;
	margin:0 auto;
  	outline:none;
  	height:35px;
  	line-height:35px;
  	text-indent:5px;
  	border:none;
  	border-bottom:1px solid #954b58;
  	display:inline-block;

}
.button{
	display:block;
	width:40px;
	height:40px;
	border-radius:50%;
	border:none;
	background:#954b58;
	color:#fff;
	margin:10px auto;
	font-size:20px;
}
.option{
	display:inline-block;
	width:48%;
	text-align:center;
	background:#fff;
	margin:10px 1%;
	border-radius:4px;
	position:relative;
}
.img-holder{
	width:97%;
	height:120px;
	overflow:hidden;
	margin:3px auto;
}
.option img{
	width:100%;
}
.option-value{
	margin:10px auto;
	text-align:center;
	height:20px;
	line-height:20px;
}
.delete-holder{
	width:100%;
	height:100%;
	background:#954b58;
	position:absolute;
	top:0;
	left:0;
	z-index:5;
	opacity:0.7;
}
.align-right{
	position:absolute;
	color:red;
	top:0;
	right:10px;
	z-index:6;
	font-size:30px;
	line-height:40px;
	color:#fff;
}
.submit-holder{
	background:#fff;
	margin:10px auto;
	text-align:center;
}
.submit{
  	background:#954b58;
  	width:100px;
  	height:40px;
  	color:#fff;
  	border:none;
  	border-radius:4px;
  	margin:10px auto;
}
</style>