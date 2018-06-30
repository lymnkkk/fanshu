<template>
	<div>
		
		<div class="title">
			我参与的投票
		</div >
		
		<div class="vote-list" >
			<ul>
			
				<li v-for="voteItem in vote" :value="voteItem.id">
					<router-link :to="'/result/'+voteItem.id">
						<div class="vote-item" :value="voteItem.id">
							<p>{{voteItem.title}}</p>
						</div>
					</router-link>
				</li>
			
			</ul>
		</div>
		

	</div>
</template>
<script>
	export default{
		data(){
			return{
				vote:null
			}
		},
		methods:{
			getVoteList(){
				let _this=this
				this.$ajax({
					url:'http://localhost:80/fanshu/api/perVote.php',
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

					
					
					_this.vote=response.data
					console.log(_this.vote)

					/*
					for(let i in _this.vote){
						console.log(_this.vote[i])
					}
					*/
					
				}).catch(function(error){
					console.log(error)
				})
			}
		},
		computed:{
			getVote(){
				return this.vote
			}
		},
		mounted(){
			this.getVoteList()
		}
	}
</script>
<style scoped>
	.title{
		color:#000;
		font-weight:bold;
		width:92%;
		height:30px;
		margin:10px auto 0 auto;
	}
	.vote-list{
		
	}
</style>