<template>
  <div>
    <el-table
      v-loading="listLoading"
      :data="list"
      :default-sort = "{prop: 'id', order: 'ascending'}"
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
      <el-table-column prop="name" label="模块名称">
        <template slot-scope="scope">{{ scope.row.name }}</template>
      </el-table-column>
      <el-table-column prop="parentId" label="父节点ID">
        <template slot-scope="scope">{{ scope.row.parentId }}</template>
      </el-table-column>
      <el-table-column prop="url" label="Url">
        <template slot-scope="scope">{{ scope.row.url }}</template>
      </el-table-column>
      <el-table-column prop="permissionName" label="权限名称" >
        <template slot-scope="scope">{{ scope.row.permissionName }}</template>
      </el-table-column>
      <el-table-column prop="creationTime" label="创建时间" >
        <template slot-scope="scope">{{ scope.row.creationTime }}</template>
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
import { getList } from '@/api/module'

export default {
  data() {
    return {
      list: null,
      listLoading: true,
      listQuery: {
        pageNumber: 1,
        pageSize: 10,
        sort: [],
        sorting: 'id asc'
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
