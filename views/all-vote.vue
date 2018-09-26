<template>	
	<div>
		<div class="vote">
			<p>更多投票</p>
		</div>
		<div class="vote-list" >
			<ul>
				<li v-for="voteItem in vote" :value="voteItem.id">
					<div class="vote-item" @click="skip" :value="voteItem.id">
						<p>{{voteItem.title}}</p>
					</div>
				</li>
			</ul>
		</div>
		<div class="load" @click="load" v-if="isFull === false">
			加载更多
		</div>
		<div class="data" v-if="isFull === true">
			已经没有更多数据了
		</div>
	</div>
</template>
<script>
	import config from '../config'
	export default{
		data(){
			return{
				start:0,
				end:10,
				vote:null,
				isFull:false
			}
		},
		methods:{
			getVoteList(){
				let _this=this
				this.$ajax({
					// url:'http://localhost:8080/fanshu/api/get_voteList.php',
					url:`${config.api}/getVoteList.php`,
					method:'post',
					data:{
						start:_this.start,
						end:_this.end
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){

					if(_this.vote===null){
						_this.vote=response.data
						if(_this.end>=response.data[0]['length']){
							console.log('1')
							_this.isFull=true
						}
					}else{
						let index=response.data.length
						let i=0
						for(i;i<index;i++){
							_this.vote.push(response.data[i])
						}
						if(_this.end>=response.data[i-1]['length']){
							console.log('1')
							_this.isFull=true
						}
						console.log(_this.vote)
					}
					/*
					for(let i in _this.vote){
						console.log(_this.vote[i])
					}
					*/
					
				}).catch(function(error){
					console.log(error)
				})
			},
			load(){
				this.start+=10
				this.end+=10
				this.getVoteList()
			},
			skip(event){
				if(this.$store.state.userId>0){
					let _this=this
					let el=event.currentTarget
					let voteId=el.getAttribute('value')
					let userId=this.$store.state.userId

					this.$ajax({
						// url:'http://localhost:8080/fanshu/api/voteUser.php',
						url:`${config.api}/voteUser.php`,
						method:'post',
						data:{
							userId:userId,
							voteId:voteId
						},
						transformRequest:[function(data){
							let ret=''
							for(let it in data){
								ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
							}
							return ret
						}]
					}).then(function(response){

						//console.log(response.data)
						if(response.data===1){
							_this.$router.push('/result/'+voteId)
						}else{
							_this.$router.push('/vote/'+voteId)
						}
					}).catch(function(error){
						console.log(error)
					})
				}else{
					this.$router.push('/login/')
				}
			}
		},
		mounted(){
			this.getVoteList()
		}
	}
</script>
<style scoped>
	.load{
		width:100px;
		height:30px;
		line-height:30px;
		border:1px solid #ccc;
		border-radius:5px;
		background:#fff;
		text-align:center;
		margin:10px auto;
	}
	.data{
		width:100%;
		height:30px;
		line-height:30px;
		text-align:center;
		margin:10px auto;
	}
</style>