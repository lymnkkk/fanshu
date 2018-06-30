<template>
	<div>
		<div class="header">
			<router-link :to="'/index/'">
				<div class="header-title">番属</div>
			</router-link>
			<div class="header-right">
				
					<div class="header-adver">
						<router-link :to="'/personal/'">
							<p v-if="checkIn === true">{{getName}}</p>
						</router-link>
						<router-link :to="'/login/'">
							<p v-if="checkIn === false">登录</p>
						</router-link>
					</div>
				
				<router-link :to="check">
					<div class="header-editor">
						<i class="fa fa-pencil-square-o" ></i> 
					</div>
				</router-link>
			</div>	
		</div>
		<router-view></router-view>
	</div>
</template>
<script>
	export default {
		data(){
			return {
				userName:'',
				userId:0,
				userIn:false,

				
			}
		},
		watch:{
			
		},
		computed:{
			checkIn(){
				this.userId=this.$store.state.userId
				if(this.userId>0){
					return true
				}else{
					return false
				}
			},
			getName(){
				return this.$store.state.userName
			},
			check(){
				this.userId=this.$store.state.userId
				if(this.userId>0){
					return '/select/'
				}else{
					return '/login/'
				}
			}
		},
		methods:{
			
			
		},
		mounted(){
			
		}	
	}
</script>
