<template>
  <div>
    <el-table
      v-loading="listLoading"
      :data="list"
      :default-sort = "{prop: 'executionTime', order: 'descending'}"
      :cell-style="{padding:'0px'}"
      :height="tableHeight"
      element-loading-text="加载中..."
      border
      fit
      highlight-current-row
      @sort-change="sortChange"
    >
      <el-table-column prop="id" align="center" label="ID" sortable="custom" width="100">
        <template slot-scope="scope">{{ scope.row.id }}</template>
      </el-table-column>
      <el-table-column prop="serviceName" label="ServiceName">
        <template slot-scope="scope">{{ scope.row.serviceName }}</template>
      </el-table-column>
      <el-table-column prop="methodName" label="MethodName">
        <template slot-scope="scope">{{ scope.row.methodName }}</template>
      </el-table-column>
      <el-table-column prop="executionTime" label="ExecutionTime" sortable="custom" >
        <template slot-scope="scope">{{ scope.row.executionTime }}</template>
      </el-table-column>
      <el-table-column prop="executionDuration" label="ExecutionDuration">
        <template slot-scope="scope">{{ scope.row.executionDuration }}</template>
      </el-table-column>
      <el-table-column prop="exception" label="Exception" align="center">
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
      @size-change="sizeChange"
      @current-change="currentChange"
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
        pageSize: 10,
        sort: [],
        sorting: 'executionTime desc'
      },
      totalCount: 0,
      tableHeight: window.innerHeight - 155
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    sortChange(column) {
      if (column.order) {
        this.listQuery.sort[column.prop] = column.order
      } else {
        delete this.listQuery.sort[column.prop]
      }
      var sortString = ''
      for (var key in this.listQuery.sort) {
        sortString += key + ' ' + this.listQuery.sort[key] + ','
      }
      var reg = /,$/gi
      this.listQuery.sorting = sortString.replace(reg, '')
      this.fetchData()
    },
    sizeChange(val) {
      this.listQuery.pageSize = val
      this.fetchData()
    },
    currentChange(val) {
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
