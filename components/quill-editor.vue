<template>
	<div>
		<quill-editor ref="myTextEditor"
              :content="content"
              :options="editorOption"
              @change="onEditorChange($event)"
              class="quill">
    </quill-editor>
	</div>
</template>
<script>
	  
	import config from '../config'
    import {quillEditor,Quill} from 'vue-quill-editor'
    import {container, ImageExtend, QuillWatch} from 'quill-image-extend-module'

    Quill.register('modules/ImageExtend', ImageExtend)
    export default{
         components:{
            quillEditor
         },
         data () {
            return {
              content: '<h2>I am Example</h2>',
              editorOption: {
                theme: 'snow',
                placeholder: "输入任何内容，支持html",
                modules: {
                   ImageExtend: {
                    loading: true,
                    name: 'img',
                    // action: 'http://localhost:8080/fanshu/api/upload.php',
                    action:`${config.api}/upload.php`,
                    response: (res) => {
                      return res.data
                    },
                    success: () => {
                      console.log('aa')
                    },  
                  },
                 
                  toolbar: {
                    container: [
                      ['bold', 'italic'],                  
                      [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                      [{ 'align': [] }],
                      [ 'image'],
                    ],
                    handlers: {
                      'image': function () {
                        QuillWatch.emit(this.quill.id)
                      }
                    }
                  }
                }
              }
            }
          },
         
          // 如果需要手动控制数据同步，父组件需要显式地处理changed事件
          methods: {
            onEditorBlur(editor) {
              console.log('editor blur!', editor)
            },
            onEditorFocus(editor) {
              console.log('editor focus!', editor)
            },
            onEditorReady(editor) {
              console.log('editor ready!', editor)
            },
            onEditorChange({ editor, html, text }) {
              // console.log('editor change!', editor, html, text)
              this.content = html
            },
            
          },
          
          // 如果你需要得到当前的editor对象来做一些事情，你可以像下面这样定义一个方法属性来获取当前的editor对象，实际上这里的$refs对应的是当前组件内所有关联了ref属性的组件元素对象
          watch:{
          	content:function(val){
          		this.$emit('on-change',val)
          	},

          	
          },
          computed: {  
            editor() {
              return this.$refs.myTextEditor.quillEditor
            },
          },
          mounted() {
            // you can use current editor object to do something(editor methods)
            console.log('this is my editor', this.editor)
            // this.editor to do something...
          }
    }

</script>
<style scoped>
	.quill{
        width:98%;
        height:500px;
        margin:0 auto;
        background:#fff;
        border-top:1px solid #ccc;
    }
      
</style>