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
      url: process.env.BASE_API + 'Document/CreateDocument',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      fileList: []
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    handlePreview(file) {
      console.log(file)
    },
    handleRemove(file, fileList) {
      console.log('remove', file, fileList)
    },
    fetchData() {
      getList({ 'pagedType': 1 }).then(data => {
        this.fileList.length = 0
        for (const item of data.items) {
          this.fileList.push({
            name: item.displayName,
            url: process.env.BASE_API + 'Document/GetDocument?Id=' + item.id
          })
        }
      })
    }
  }
}
</script>
