<template>
    <div class="edit-show">
        <img-upload ref="headerImg">
            
        </img-upload>
        <div class="title">
          <input type="text" placeholder="请输入标题（45字以内）" maxlength="45"
          v-model="title">
        </div>
        <quill-editor ref="editor">

        </quill-editor>
        <div class="cat-holder">
          <p>请选择专栏分类</p>
          <div class="cat">
            <div v-for="(item,index) in cat" 
                :value="index"  
                :class="{'on': catNo == index}"
                @click="checkItem">
                  {{item}}
            </div>
          </div>
        </div>
        <div class="button">
          <p v-show="tip" class="pub-tip">信息不完整，请完善信息</p>
          <button @click="submitFormat">提交文章</button>
          
        </div>

        <div class="pub-shade" v-show="isSuccess">
        </div>
        <div class="pub-success" v-show="isSuccess">

            <p>发表成功</p>
        </div>
    </div>
</template>
<script>
	import config from '../config'
    import imgUpload from '../components/img-upload.vue'
    import quillEditor from '../components/quill-editor.vue'
    
    export default{
         components:{
            imgUpload,
            quillEditor,
         },
         data () {
            return {
              data:'',
              cat:['动漫杂谈','动漫资讯','同人创作'],
              catNo:-1,
              title:'',
              tip:false,
              isSuccess:false
            }
          },
         
          // 如果需要手动控制数据同步，父组件需要显式地处理changed事件
          methods: {
            checkItem(event){
              var el=event.currentTarget
              if(this.catNo === el.getAttribute('value')){
                this.catNo=-1
              }else{
                this.catNo=el.getAttribute('value')
                console.log(this.catNo)
              }
            },         
            getContent(){
              alert(this.$refs.editor.content)
            },
            submitFormat(){
              let _this=this

              //alert(this.title+'<br>'+this.cat[this.catNo])
              //alert(this.$refs.headerImg.imageUrl+'<br>'+this.$refs.editor.content)
              if(this.title===''||this.catNo === -1
                  || this.$refs.headerImg.imageUrl ===''
                  || this.$refs.editor.content === ''){

                    this.tip=true

                  }else{
                    this.tip=false
                    this.$ajax({
                        // url:'http://localhost:8080/fanshu/api/add_article.php',
                        url:`${config.api}/addArticle.php`,
                        method:'post',
                        data:{
                           headerImg:_this.$refs.headerImg.imageUrl,
                           title:_this.title,
                           content:_this.$refs.editor.content,
                           cat:_this.cat[_this.catNo],
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
          },
          
    }
</script>
<style scoped>
    .edit-show{
      background:#fff;
      width:100%;
      height:100%;
    }
    .title{
      width:98%;
      padding:10px 0;
      margin:0 auto 10px auto;

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
    .button{
      width:98%;
      margin:20px auto;
      text-align:center;
    }
    .button button{
      background:#954b58;
      width:200px;
      height:40px;
      color:#fff;
      border:none;
      border-radius:4px;
    }
    .cat-holder{
      width:98%;
      margin:60px auto 20px auto;
      background:#fff;
      border-radius:4px;
    }
    .cat-holder .cat{
      margin:10px 0;
    }
    .cat div{
      display:inline-block;
      padding:3px 7px;
      border:1px solid #954b58;
      border-radius:4px;
      color:#954b58;
      margin-right:5px;
    }
    .cat .on{
      background:#954b58;
      color:#fff;
    }
    .tip{
      color:red
    }
</style>