<template>
  <split-pane :min-percent="20" :default-percent="30" split="vertical">
    <template slot="paneL">
      <el-card class="box-card">
        <div slot="header">
          <span>菜单结构</span>
        </div>
        <div class="fill">
          <el-tree
            v-loading="loading"
            :data="menuTree"
            :props="defaultProps"
            default-expand-all
            @node-click="handleNodeClick">
            <span slot-scope="{ data }" class="custom-tree-node">
              <svg-icon :icon-class="data.icon?data.icon:'menu'" />
              <span>{{ data.name }}</span>
            </span>
          </el-tree>
        </div>
      </el-card>
    </template>
    <template slot="paneR">
      <el-card class="box-card">
        <div slot="header">
          <span>菜单信息</span>
        </div>
        <el-form ref="form" :model="menu" label-width="100px" style="width:500px">
          <el-form-item label="菜单名称">
            <el-input v-model="menu.name"/>
          </el-form-item>
          <el-form-item label="上级菜单">
            <el-input v-model="menu.parentId"/>
          </el-form-item>
          <el-form-item label="图标">
            <el-input v-model="menu.icon">
              <template slot="prepend"><svg-icon :icon-class="menu.icon?menu.icon:'menu'" /></template>
            </el-input>
          </el-form-item>
          <el-form-item label="排序">
            <el-input v-model="menu.order"/>
          </el-form-item>
          <el-form-item label="启用">
            <el-switch v-model="menu.isActive"/>
          </el-form-item>
          <el-form-item>
            <el-button type="primary">保存</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </template>
  </split-pane>
</template>

<script>
import SplitPane from 'vue-splitpane'
import { getMenuTree } from '@/api/menu'

export default {
  components: { SplitPane },
  data() {
    return {
      loading: true,
      menuTree: [],
      menu: {},
      defaultProps: {
        children: 'children',
        label: 'name'
      }
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      getMenuTree(this.listQuery).then(data => {
        this.menuTree = data
        this.loading = false
      })
    },
    handleNodeClick(data) {
      this.menu = data
    }
  }
}
</script>
<style>
.el-tree-node__content
{
  height: 36px;
}
</style>
<style lang="scss" scoped>
.fill
{
  margin: -20px;
}
.el-card
{
  height: 100%;
}
</style>
