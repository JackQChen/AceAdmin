<template>
  <div class="app-container">
    <input type="file" accept="image/png,image/gif,image/jpeg" @change="upload">
    <div>
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
              :alt="scope.row.id"
              fit="scale-down"
              src="https://img-blog.csdnimg.cn/2019122522221147.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2pjbGlhbjkx,size_16,color_FFFFFF,t_70"
            />
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
        </el-table-column> <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="handlePreview(scope.row.id)">预览</el-button>
            <el-button @click="handleDownload(scope.$index, scope.row)">下载</el-button>
            <el-button type="danger" @click="handleRemove(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <!-- Form -->
    <el-dialog :visible.sync="isFormShow" title="图片预览">
      <el-image
        fit="fill"
        src="https://img-blog.csdnimg.cn/2019122522221147.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2pjbGlhbjkx,size_16,color_FFFFFF,t_70"
      />
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="isFormShow = false">确 定</el-button>
        <el-button @click="isFormShow = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { getList } from '@/api/upload'
export default {
  data() {
    return {
      tableHeight: window.innerHeight - 155,
      isLoading: true,
      dataList: null,
      listQuery: {
        pagedType: 1
      },
      isFormShow: false
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
    fetchData() {
      this.isLoading = true
      getList(this.listQuery).then(data => {
        this.dataList = data.items
        this.isLoading = false
      })
    },
    upload(e) {
      const file = e.target.files[0]
      const param = new FormData() // 创建form对象
      param.append('file', file)// 通过append向form对象添加数据
      console.log(param.get('file')) // FormData私有类对象，访问不到，可以通过get判断值是否传进去
      const config = {
        headers: { 'Content-Type': 'multipart/form-data' }
      } // 添加请求头
      this.$http.post('http://127.0.0.1:8081/upload', param, config)
        .then(response => {
          console.log(response.data)
        })
    },
    handlePreview(file) {
      this.isFormShow = true
    },
    handleDownload(file) {
      console.log(file)
    },
    handleRemove(file, fileList) {
      console.log('remove', file, fileList)
    }
  }
}
</script>
