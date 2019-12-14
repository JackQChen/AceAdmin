<template>
  <div class="menu-wrapper">
    <template v-if="item.children.length===0">
      <app-link :to="item.url">
        <el-menu-item :index="String(item.id)" :class="{'submenu-title-noDropdown':!isNest}">
          <item :icon="item.icon?item.icon:'menu'" :title="item.name"/>
        </el-menu-item>
      </app-link>
    </template>
    <el-submenu v-else :index="String(item.id)">
      <template slot="title">
        <item :icon="item.icon?item.icon:'menu'" :title="item.name"/>
      </template>
      <sidebar-item
        v-for="child in item.children"
        :key="child.id"
        :is-nest="true"
        :item="child"
        class="nest-menu"
      />
    </el-submenu>
  </div>
</template>

<script>
import Item from './Item'
import AppLink from './Link'
import FixiOSBug from './FixiOSBug'

export default {
  name: 'SidebarItem',
  components: { Item, AppLink },
  mixins: [FixiOSBug],
  props: {
    // route object
    item: {
      type: Object,
      required: true
    },
    isNest: {
      type: Boolean,
      default: false
    }
  }
}
</script>
