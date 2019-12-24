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
import { getList } from '@/api/upload'
export default {
  data() {
    return {
      url: process.env.BASE_API + 'File/UploadFile',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      fileList: null
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    handleRemove(file, fileList) {
      console.log('remove', file, fileList)
    },
    fetchData() {
      getList({ 'pagedType': 1 }).then(data => {
        this.fileList = data.items
      })
    }
  }
}
</script>
