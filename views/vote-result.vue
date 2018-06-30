<template>
	<div class="result-show">

		<h2>{{results.title}}</h2>
		
		<div class="option-holder" v-for="(item,index) in results.optionArr">
			<span>{{item.item}}</span>
			
			<div class="data">
				<transition
					v-on:before-enter="beforeEnter"
	    			v-on:enter="enter"
					>
					<div class="width" :value="width[index]" v-if="show">
						<p>{{item.voteNum}}</p>
					</div>

				</transition>
			</div>
		</div>
	</div>
	
</template>
<script>
	import vote_data from '../vote.js'

	export default{
		data(){
			return{
				id:this.$route.params.id,
				Item:null,
				options:[],
				sum:0,
				//每个选项所占的比例
				per:[],
				allWidth:0,
				//每个选项的宽度
				width:[],
				show:false,
				results:null
			}	
		},
		methods:{
			getContent(){
				this.Item=vote_data[0]
				this.options=this.Item.option.split(',')
				//console.log(this.options)
			},
			calcuData(){
				for(var i=0;i<this.results.optionArr.length;i++){
					this.sum+=parseInt(this.results.optionArr[i].voteNum)
				}

				console.log(this.sum)

			},
			calcuPer(){
				for(var i=0;i<this.results.optionArr.length;i++){
					this.per.push((this.results.optionArr[i].voteNum)/this.sum)
				}
				
				console.log(this.per)
			},
			calcuAllWidth(){
				this.$nextTick(function(){
					let el=document.querySelector('.data')
					let style=window.getComputedStyle(el,null)
					this.allWidth=style.width
					console.log(this.allWidth)

					//计算每个选项的宽度
					this.calcuPerWidth()
					this.show=true
				})
				
			},
			calcuPerWidth(){
				for(var i=0;i<this.Item.voteNum;i++){
					this.width.push(parseInt(this.allWidth)*this.per[i])
				}		
				console.log(this.width)
			},
			beforeEnter: function (el) {
		      el.style.opacity = 0
		      el.style.transformOrigin = 'left'
		      el.style.width=0
		      el.firstChild.style.fontSize=0
		      el.firstChild.style.left=0;
		    },
		    enter: function (el, done) {
		      Velocity(el, { opacity: 1 ,width:el.getAttribute('value')}, { duration: 1000 },{ complete: done })
		      Velocity(el.firstChild, { fontSize: '1em' ,left:(parseInt(el.getAttribute('value'))+2)+'px'}, { duration: 1000 },{ complete: done })

		    },
		    getVoteResult(){
		    	let _this=this
		    	this.$ajax({
		    		url:'http://localhost:80/fanshu/api/get_voteResult.php',
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
		    		_this.results=response.data
		    		_this.calcuData()
					_this.calcuPer()
					_this.calcuAllWidth()
		    	}).catch(function(error){
		    		console.log(error)
		    	})
		    }
		    
		},
		created(){
			this.getContent()
			setTimeout(()=>{
				
			})
		},
		mounted(){
			this.getVoteResult()
		}
	}
</script>
<style scoped>
	.fade-enter{
		width:0;
		background:red;
	}
	.fade-enter-active{
		width:100px;
		background:red;
		transition:width .5s;
	}
	.result-show{
		width:100%;
		height:auto;
		margin:0 auto;
		background:#fff;
	}
	h2{
		width:96%;
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
	.number{
		float:right;
	}
	.option-holder{
		width:90%;
		margin:20px auto;
	}
	.option-holder span{
		color:#954b58;
	}
	.data{
		width:100%;
		height:20px;
		position:relative;
	}
	.width{
		height:20px;
		background:#954b58;

		position:absolute;
		top:0;
		left:0;
	}
	.width p{
		position:absolute;
		top:0;
		line-height:20px;
		color:#954b58;
	}

</style>