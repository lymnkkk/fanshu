<template>
	<div>
		<carousel :imgs="imgArray" :time="carTime"></carousel>
		<div class="vote">
			<p>投票</p>
			<router-link :to="'/allVote/'">
				<span>更多 ></span>
			</router-link>
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
		<div class="article-reco">
			<p>推荐文章</p>
			<router-link :to="'/allArticle/'">
				<span>更多 ></span>
			</router-link>
		</div>
		<arti :arti="article"></arti>
	</div>
</template>
<script>
	import config from '../config'
	import carousel from '../components/carousel.vue'
	import arti from '../components/article.vue'
	export default{
		components:{
			carousel,
			arti
		},
		data(){
			return {
				//接口返回的vote数据
				vote:null,
				article:null,
				id:parseInt(this.$route.params.id),
				articleId:0,
				carTime:2000,
				voteUserRelated:0,
				artiStart:0,
				artiEnd:3,
				voteStart:0,
				voteEnd:3,
				imgArray:[
					{
						src:'../assets/carousel-pic1.jpg',
						title:'父亲节'
					},
					{
						src:'../assets/carousel-pic2.jpg',
						title:'国风游戏了解一下'
					},
					{
						src:'../assets/carousel-pic3.jpg',
						title:'985211'
					},
					{
						src:'../assets/carousel-pic4.jpg',
						title:'《赛博朋克2077》闭门演示讲了什么？'
					}
				],			
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
						start:_this.voteStart,
						end:_this.voteEnd
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){

					_this.$store.state.voteList=response.data
					_this.vote=response.data

					/*
					for(let i in _this.vote){
						console.log(_this.vote[i])
					}
					*/
					
				}).catch(function(error){
					console.log(error)
				})
			},
			getArticleList(){
				let _this=this
				this.$ajax({
					// url:'http://localhost:8080/fanshu/api/get_articleList.php',
					url:`${config.api}/getArticleList.php`,
					method:'post',
					data:{
						start:_this.artiStart,
						end:_this.artiEnd
					},
					transformRequest:[function(data){
						let ret=''
						for(let it in data){
							ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
						}
						return ret
					}]
				}).then(function(response){
					_this.$store.state.articleList=response.data
					_this.article=response.data
					/*
					console.log(typeof response.data)
					console.log(response.data instanceof Array)
					console.log(_this.$store.state.articleList)
					*/
				}).catch(function(error){
					console.log(error)
				})
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
			this.getArticleList()
		}
		
	}
</script>
