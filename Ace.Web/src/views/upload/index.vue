<template>
  <div class="app-container">
    <el-button type="primary" class="upload">
      <input type="file" accept="image/*" @change="uploadFile">
      <div>上传文件</div>
    </el-button>
    <el-divider/>
    <div>
      <el-image-viewer
        v-if="isShowPreview"
        :on-close="closePreview"
        :url-list="previewList" />
      <el-table
        v-loading="isLoading"
        ref="multipleTable"
        :data="dataList"
        :default-sort = "{prop: 'id', order: 'ascending'}"
        :max-height="tableHeight"
        element-loading-text="加载中..."
        highlight-current-row
        @row-click="selectRow"
      >
        <el-table-column type="selection" width="60" align="center"/>
        <el-table-column align="center" label="" width="100">
          <template slot-scope="scope">
            <el-image
              :src="scope.row.url"
              style="width:50px;height:50px;cursor:pointer"
              fit="scale-down"
              @click="handlePreview(scope.$index)"
            >
              <div slot="error">
                <i class="el-icon-picture-outline"/>
              </div>
            </el-image>
          </template>
        </el-table-column>
        <el-table-column label="文件名">
          <template slot-scope="scope">{{ scope.row.originalName }}</template>
        </el-table-column>
        <el-table-column label="文件大小" width="200">
          <template slot-scope="scope">
            <span>{{ scope.row.id }}</span>
          </template>
        </el-table-column>
        <el-table-column label="创建时间" width="200">
          <template slot-scope="scope">{{ scope.row.creationTime }}</template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="handlePreview(scope.$index)">预览</el-button>
            <a :href="scope.row.url" :download="scope.row.originalName" >
              <el-button>下载</el-button>
            </a>
            <el-button type="danger" @click="handleRemove(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import ElImageViewer from 'element-ui/packages/image/src/image-viewer'
import { getList, createDocument, getDocument, deleteDocument } from '@/api/upload'
export default {
  components: { ElImageViewer },
  data() {
    return {
      tableHeight: window.innerHeight - 155,
      isLoading: true,
      dataList: null,
      previewList: [],
      listQuery: {
        pagedType: 1
      },
      isShowPreview: false
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    selectRow(row) {
      this.$refs.multipleTable.clearSelection()
      this.$refs.multipleTable.toggleRowSelection(row, true)
    },
    createUrl(obj, index) {
      getDocument({ id: obj.id }).then(url => {
        obj.url = url
        this.$set(this.dataList, index, obj)
      })
    },
    fetchData() {
      this.isLoading = true
      getList(this.listQuery).then(data => {
        const that = this
        this.dataList = data.items
        this.dataList.forEach(function(obj, index) {
          that.createUrl(obj, index)
        })
        this.isLoading = false
      })
    },
    uploadFile(e) {
      this.isLoading = true
      const file = e.target.files[0]
      const param = new FormData()
      param.append('file', file)
      createDocument(param).then(data => {
        e.target.value = ''
        this.fetchData()
      })
    },
    closePreview() {
      this.isShowPreview = false
    },
    handlePreview(index) {
      this.previewList.length = 0
      for (let i = 0; i < this.dataList.length; i++) {
        const d = this.dataList.length - index
        this.previewList.push(this.dataList[ i < d ? index + i : i - d ].url)
      }
      this.isShowPreview = true
    },
    handleRemove(id) {
      this.isLoading = true
      deleteDocument({ id }).then(data => {
        this.fetchData()
      })
    }
  }
}
</script>
<style lang="scss" scoped>
.upload{
  width: 90px;
  height: 40px;
  padding: 0px;
  input{
  width: 100%;
  height:100%;
  opacity: 0;
  }
  div{
    margin-top: -25px;
    padding-bottom: 20px;
  }
}
</style>
