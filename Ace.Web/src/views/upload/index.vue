<template>
  <div class="app-container">
    <el-upload
      :on-preview="handlePreview"
      :on-remove="handleRemove"
      :file-list="fileList"
      :action="url"
      :headers="headers"
      list-type="picture">
      <el-button size="small" type="primary">
        <i slot="default" class="el-icon-plus"/>
        点击上传
      </el-button>
      <div slot="tip" class="el-upload__tip">文件大小不超过10Mb</div>
      <el-row slot="file" slot-scope="{file}" type="flex" align="middle">
        <img class="el-upload-list__item-thumbnail" alt="" >
        <el-col :span="12">
          <div class="fileInfo">
            <p v-text="file.originalName"/>
            <p v-text="file.id"/>
          </div>
        </el-col>
        <el-col :span="12"><p v-text="file.creationTime"/></el-col>
      </el-row>
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
        this.fileList = data.items
      })
    }
  }
}
</script>
<style lang="scss" scoped>
.fileInfo {
  padding-left: 20px;
  p {
    margin: 2px;
  }
  p:not(:first-child) {
    color: #999;
  }
}
</style>
