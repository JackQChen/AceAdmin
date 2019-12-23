<template>
  <div class="app-container">
    <el-upload
      :on-preview="handlePreview"
      :on-remove="handleRemove"
      :file-list="fileList"
      :action="url"
      :headers="headers"
      list-type="picture">
      <el-button size="small" type="primary">点击上传</el-button>
      <div slot="tip" class="el-upload__tip">文件大小不超过10Mb</div>
    </el-upload>
  </div>
</template>
<script>
import { getToken } from '@/utils/auth'
export default {
  data() {
    return {
      url: process.env.BASE_API + 'File/UploadFile',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      fileList: [{ name: 'food.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100' }, { name: 'food2.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100' }]
    }
  },
  methods: {
    handleRemove(file, fileList) {
      console.log('remove', file, fileList)
    },
    handlePreview(file) {
      console.log(file)
    }
  }
}
</script>
