<template>
  <div>
    <el-table
      v-loading="listLoading"
      :data="list"
      :default-sort = "{prop: 'id', order: 'ascending'}"
      :cell-style="{padding:'0px'}"
      :height="tableHeight"
      element-loading-text="加载中..."
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="ID" sortable="custom" width="100">
        <template slot-scope="scope">{{ scope.row.id }}</template>
      </el-table-column>
      <el-table-column label="ServiceName">
        <template slot-scope="scope">{{ scope.row.serviceName }}</template>
      </el-table-column>
      <el-table-column label="MethodName">
        <template slot-scope="scope">{{ scope.row.methodName }}</template>
      </el-table-column>
      <el-table-column label="ExecutionTime">
        <template slot-scope="scope">{{ scope.row.executionTime }}</template>
      </el-table-column>
      <el-table-column label="ExecutionDuration">
        <template slot-scope="scope">{{ scope.row.executionDuration }}</template>
      </el-table-column>
      <el-table-column label="Exception" align="center">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <div>{{ scope.row.exception }}</div>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.exception }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="created_at" label="Display_time" width="200">
        <template slot-scope="scope">
          <i class="el-icon-time" />
          <span>{{ scope.row.display_time }}</span>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      :page-sizes="[10,20,50]"
      :page-size="listQuery.pageSize"
      :total="totalCount"
      background
      layout="total,sizes,prev,pager,next,jumper"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />
  </div>
</template>

<script>
import { getList } from '@/api/auditlog'

export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      list: null,
      listLoading: true,
      listQuery: {
        pageNumber: 1,
        pageSize: 10
      },
      totalCount: 0,
      tableHeight: window.innerHeight - 155
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    handleSizeChange(val) {
      this.listQuery.pageSize = val
      this.fetchData()
    },
    handleCurrentChange(val) {
      this.listQuery.pageNumber = val
      this.fetchData()
    },
    fetchData() {
      this.listLoading = true
      getList(this.listQuery).then(data => {
        this.list = data.items
        this.totalCount = data.totalCount
        this.listLoading = false
      })
    }
  }
}
</script>

<style scoped>
.el-pagination{
  padding:20px 40px
}
</style>
