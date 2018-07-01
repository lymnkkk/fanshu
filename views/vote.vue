<template>
	<div class="vote-show">	
		<h2>{{vote.title}}</h2>
		
		<div v-for="(option,index) in vote.optionArr" 
			class="vote-item"
			:class="{'vote2': vote['voteCat']=== '2'}"
			@click="voteOne"
			:name="index"
			:value="[option.item,vote.id,vote.voteCat]"
			>	
				<div class="img-holder" v-show="vote['voteCat'] === '1'">
					<img :src="option['img']">
				</div>
				<div class="option-holder" >
					{{option.item}}
				</div>
				<div :class="{'shade':checkNo == index}">	
				</div>
				<div :class="{'check':checkNo == index,'small': vote['voteCat']=== '2'}">
				</div>
				
		</div>

		<router-link :to="'/result/'+parseInt(vote.id)">
			<button class="button" @click="voteIn">投票</button>
		</router-link>
		
	</div>
</template>
<script>

	export default{
		data(){
			return{
				id: parseInt(this.$route.params.id),
				Item:null,
				options:{
					type:Array,
					default:[]
				},
				checkNo:-1,
				vote:null,
				voteId:0,
				voteItem:'',
				voteCat:0,
			}
		},
		computed:{
		
		},
		
		methods:{
			
			voteOne(event){
				var el=event.currentTarget
				if(this.checkNo === el.getAttribute('name')){
					this.checkNo=-1
					this.voteId=0
					this.voteItem=''
				}else{
					this.checkNo = el.getAttribute('name')
					let arr=el.getAttribute('value').split(',')
					this.voteItem=arr[0]
					this.voteId=arr[1]
					this.voteCat=arr[2]
					
				}
			}, 
			voteIn(){
				let _this=this

				if(this.checkNo === -1){
					
				}else{

					this.$ajax({
						url:'http://localhost:80/fanshu/api/vote.php',
						method:'post',
						data:{
							voteId:_this.voteId,
							voteItem:_this.voteItem,
							voteCat:_this.voteCat,
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
						
					}).catch(function(error){
						console.log(error)
					})
				}
			},
			getVote(){
				let _this=this
				_this.$ajax({
					url:'http://localhost:80/fanshu/api/get_vote.php',
					method:'post',
					data:{
						voteId:_this.id
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){

					_this.vote=response.data
					console.log(response.data)

				}).catch(function(error){

				})
			}
		},
		
		
		mounted (){
			this.getVote()
			
		}
	}
	
</script>
<style scoped>
	.vote-show{
		width:98%;
		height:auto;
		margin:10px auto;
	}
	h2{
		width:98%;
		margin:0 auto;
		font-size:18px;
		padding:10px 0;
		border-bottom:1px solid #954b58;
		color:#954b58;
		text-indent:20px;
		position:relative;
		line-height:20px;
	}
	h2:before{
		content:'';
		width:20px;
		height:20px;
		background:url(../assets/vote-in.png) no-repeat left; 
		background-size:20px;
		position:absolute;
		left:0;
	}
	.vote-item{
	   display:inline-block;
	   width:48%;
	   border-radius:4px;
	   background:#fff;
	   margin:10px auto;
	   margin-left:1%;
	   margin-right:1%;
	   background:#fff;
	   position:relative;
	}
	.vote-item img{
		width:100%;
		
	}
	.vote2{
		width:100% !important;
		
	}
	.option-holder{
		margin:10px auto;
		text-align:center;
		height:20px;
		line-height:20px;
	}
	.img-holder{
		width:97%;
		margin:3px auto;
		height:150px;
		overflow:hidden;
		
	}
	.shade{
		width:100%;
		height:100%;
		background:#954b58;
		position:absolute;
		top:0;
		left:0;
		border-radius:4px;
		opacity:0.6;
		z-index:4;
	}
	.check{
		width:100%;
		height:100%;
		background:url(../assets/check.png) no-repeat center;
		background-size:50px;
		position:absolute;
		top:0;
		left:0;
		z-index:5;
		margin:0 auto;
	}
	.small{
		background-size:40px;
	}
	.button{
		display:block;
		width:40%;
		margin:10px auto 50px auto;
		height:30px;
		line-height:30px;
		border:none;
		background:#954b58;
		font-size:14px;
		color:#fff;
		border-radius:4px;
	}
</style>