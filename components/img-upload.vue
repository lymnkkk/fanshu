<template>
  <div>
      <el-upload
        class="avatar-uploader"
        :class="{'vote-format': format === method}"
        action="http://localhost:80/fanshu/api/upload-avatar.php"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"    
         >
        <div class="cut" v-if="imageUrl">
           <img :src="imageUrl" class="avatar">
        </div>
        <div v-else class="tip">
          <i class="el-icon-plus avatar-uploader-icon"></i>
          <p>请添加专栏头图</p>
          <span>(支持2MB以内)</span>
        </div>
        
      </el-upload>
  </div>
</template>
<script>
  export default {
    props:{
      method:''
    },
    data() {
      return {
        imageUrl: '',
        format: 'vote'
      };
    },
    methods: {
      handleAvatarSuccess(res, file) {

      //  this.imageUrl = URL.createObjectURL(file.raw);
        this.imageUrl = res.data
        
      },
      beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      }
    }
  }
</script scoped>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    width:100%;
    height:200px;

  }
  .avatar-uploader.vote-format .el-upload{
    width:50%;
    height:120px;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .cut{
    width:100%;
    height:200px;
    overflow:hidden;
  }
  .avatar {
    width: 100%;
    height: auto;
    display: block;
  }
  .tip{
      width:100%;
      height:auto;
      margin:0 auto;
      position:absolute;
      top:50%;
      transform:translateY(-50%);
  }
  .avatar-uploader-icon {
    font-size: 40px;
    color: #8c939d;
    width: 40px;
    height: 40px;
    margin:0 auto;
    text-align: center;
  }
  
  
  span{
    font-size:12px;
  }
</style>