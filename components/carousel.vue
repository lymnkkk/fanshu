<template>
	<div class="slide-show">
		<div class="slide-img">
			<transition-group tag="ul" v-bind:name="transitionName" class=".group"> 
				<v-touch  tag="li" 
						  @swipeleft="onSwipeLeft" 
						  @swiperight="onSwipeRight"
						  v-for="(img, index) in imgs" 
						  v-show="index===nowIndex" 
						  :key="index"
						  class="imgs-list"> 

					<img :src="img.src">
		
				</v-touch>
			</transition-group>	
			<div class="slide-items">
				<span v-for="(img, index) in imgs" 
					  :class="{'active':index === nowIndex}">
				</span>
			</div>
		</div>
		<h2></h2>
	</div>
</template>
<script>
	export default{
		props:{
			imgs:{
				type:Array,
				default:[]
			},
			time:{
				type:Number,
				default:1000
			}
		},
		data(){
			return {
				nowIndex:0,
				transitionName:'slide-trans',
				isSwipe:true
			}
		},
		computed:{
			prevIndex(){
				if(this.nowIndex === 0){
					return this.imgs.length-1
				} else{
					return this.nowIndex-1
				}
			},
			nextIndex(){
				if(this.nowIndex === this.imgs.length-1){
					return 0
				}else{
					return this.nowIndex+1
				}
			}
		},
		methods:{
			autorun(){
				
				this.run=setInterval(()=>{
					this.transitionName='slide-trans'
					this.nowIndex=this.nextIndex
				},this.time)

			},
			
			onSwipeLeft(){
				clearInterval(this.run)
				this.transitionName='slide-trans'
				this.nowIndex = this.nextIndex
				var _this=this
				
				this.autorun()
			},
			onSwipeRight(){
				clearInterval(this.run)	
				this.transitionName='slide-trans-right'			
				this.nowIndex = this.prevIndex
				var _this=this
				this.autorun()
			}
		},
		
		created() {
		    //在DOM加载完成后，下个tick中开始轮播
		    this.$nextTick(() => {
		        this.autorun()
		    })
		}
	}
</script>
<style scoped>
	.slide-trans-enter-active {  
		transform: translateX(0);  
		transition: all .3s ease;  
	}  
	.slide-trans-leave-active {  
		transform: translateX(-100%);  
		transition: all .3s ease;  
	}  
	.slide-trans-enter {  
		transform: translateX(100%);  
	}  
	.slide-trans-leave {  
		transform: translateX(0);  
	}  
	.slide-trans-right-enter-active{
		transform:translateX(0);
		transition:all .3s ease;
	}
	.slide-trans-right-leave-active{
		transform:translateX(100%);
		transition:all .3s ease;
	}
	.slide-trans-right-leave{
		transform:translateX(0);
	}
	.slide-trans-right-enter{
		transform:translateX(-100%);
	}
	.slide-show{
		width:96%;
		height:100px;
		margin:10px auto;
		overflow:hidden;
		position:relative;
		border-radius:4px;
	}
	.slide-img li{
		position:absolute;
		top:0;
		left:0;
	}
	.slide-img img{
		width:100%;	
	}
	.slide-items{
		position:absolute;
		bottom:2px;
		right:2px;
		width:70px;
		text-align:right;
	}
	.slide-items span{
		display:inline-block;
		width:8px;
		height:8px;
		border-radius:50%;
		background:#fff;
		margin-right:5px;
	}
	.slide-items span.active{
		background:#954b58;
	}
	
</style>