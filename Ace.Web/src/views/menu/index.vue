<template>
  <split-pane :min-percent="20" :default-percent="30" split="vertical">
    <template slot="paneL">
      <el-card class="box-card">
        <div slot="header">
          <span>菜单结构</span>
          <el-button-group style="float:right;margin-top:-8px;">
            <el-button type="primary" size="small" icon="el-icon-plus" @click="addMenu"/>
            <el-button type="primary" size="small" icon="el-icon-delete" @click="removeMenu"/>
          </el-button-group>
        </div>
        <div class="fill">
          <el-tree
            v-loading="loading"
            :data="menuTree"
            :props="defaultProps"
            :expand-on-click-node="false"
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
          <el-form-item label="菜单ID">
            <el-input v-model="menu.id" :disabled="true"/>
          </el-form-item>
          <el-form-item label="菜单名称">
            <el-input v-model="menu.name"/>
          </el-form-item>
          <el-form-item label="上级菜单">
            <el-cascader
              ref="parentMenu"
              :options="menuTree"
              :props="defaultProps"
              :value="parentPath"
              placeholder="请选择上级菜单"
              clearable
              style="width:100%"
              @change="parentChange">
              <template slot-scope="{ data }">
                <svg-icon :icon-class="data.icon?data.icon:'menu'" />
                <span>{{ data.name }}</span>
              </template>
            </el-cascader>
          </el-form-item>
          <el-form-item label="图标">
            <el-input v-model="menu.icon">
              <template slot="prepend"><svg-icon :icon-class="menu.icon?menu.icon:'menu'" /></template>
            </el-input>
          </el-form-item>
          <el-form-item label="模块">
            <el-cascader
              :props="defaultProps"
              clearable
              style="width:100%">
              <template slot-scope="{ data }">
                <svg-icon :icon-class="data.icon?data.icon:'menu'"/>
                <span>{{ data.name }}</span>
              </template>
            </el-cascader>
          </el-form-item>
          <el-form-item label="排序">
            <el-input-number v-model="menu.order" :min="0" />
          </el-form-item>
          <el-form-item label="启用">
            <el-switch v-model="menu.isActive"/>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="save">保存</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </template>
  </split-pane>
</template>
<script>
import SplitPane from 'vue-splitpane'
import Message from 'element-ui'
import { getMenuTree, createMenu, updateMenu, deleteMenu } from '@/api/menu'

export default {
  components: { SplitPane, Message },
  data() {
    return {
      loading: true,
      menuTree: [],
      menu: {},
      parentPath: [],
      defaultProps: {
        children: 'children',
        value: 'id',
        label: 'name',
        expandTrigger: 'hover',
        checkStrictly: true
      }
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      getMenuTree(this.listQuery).then(data => {
        this.menuTree = this.removeEmptyNode(data)
        this.loading = false
      })
    },
    removeEmptyNode(data) {
      for (var i = 0; i < data.length; i++) {
        if (data[i].children.length === 0) {
          data[i].children = null
        } else {
          this.removeEmptyNode(data[i].children)
        }
      }
      return data
    },
    handleNodeClick(data, node) {
      this.menu = data
      const path = []
      this.getParentPath(path, node.parent)
      path.reverse()
      this.parentPath = path
    },
    getParentPath(path, node) {
      if (node.data.id) {
        path.push(node.data.id)
        this.getParentPath(path, node.parent)
      }
    },
    parentChange() {
      this.menu.parentId = this.parentPath[this.parentPath.length - 1]
      this.$refs.parentMenu.toggleDropDownVisible()
    },
    addMenu() {},
    removeMenu() {
      deleteMenu()
    },
    save() {
      if (this.menu.id) {
        updateMenu(this.menu).then(data => {
          Message({
            message: 'done'
          })
        })
      } else {
        createMenu(this.menu)
      }
    }
  }
}
</script>
<style>
.el-tree-node__content
{
  height: 36px;
}
.el-cascader-menu__hover-zone
{
    display: none;
}
.el-cascader-panel .el-radio
{
  width: 100%;
  height: 100%;
  z-index: 10;
  position: absolute;
  left: 0;
}
.el-cascader-panel .el-radio__input
{
  visibility: hidden;
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
