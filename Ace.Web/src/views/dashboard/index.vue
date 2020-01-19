<template>
  <div class="dashboard">
    <el-row :gutter="10">
      <el-col :md="12">
        <el-card>
          <div slot="header">
            <span>
              <svg-icon icon-class="info-circle"/>
              <span>系统信息</span>
            </span>
          </div>
          <el-form :model="systemInfo.OSInfo" label-width="90px">
            <el-form-item label="启动时间">
              <el-input v-model="systemInfo.OSInfo.startTime"/>
            </el-form-item>
            <el-form-item label="操作系统">
              <el-input v-model="systemInfo.OSInfo.osDescription"/>
            </el-form-item>
            <el-form-item label="系统架构">
              <el-input v-model="systemInfo.OSInfo.osArchitecture"/>
            </el-form-item>
            <el-form-item label="框架版本">
              <el-input v-model="frameworkVersion"/>
            </el-form-item>
            <el-form-item label="机器名">
              <el-input v-model="systemInfo.OSInfo.machineName"/>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
      <el-col :md="12">
        <el-card>
          <div slot="header">
            <span>
              <svg-icon icon-class="monitoring"/>
              <span>实时信息</span>
            </span>
          </div>
          <el-form :model="systemInfo.RealTimeInfo" label-width="90px">
            <el-form-item label="CPU温度">
              <el-input v-model="systemInfo.RealTimeInfo.Temperature"/>
            </el-form-item>
            <el-form-item label="内存使用">
              <el-input v-model="memoryUse"/>
            </el-form-item>
            <el-form-item label="内存使用率">
              <el-progress :text-inside="true" :stroke-width="24" :percentage="systemInfo.RealTimeInfo.MemUsage" status="success"/>
            </el-form-item>
            <el-form-item label="磁盘使用">
              <el-input v-model="diskUse"/>
            </el-form-item>
            <el-form-item label="磁盘使用率">
              <el-progress :text-inside="true" :stroke-width="24" :percentage="systemInfo.RealTimeInfo.DiskUsage"/>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { getSystemInfo } from '@/api/dashboard'

export default {
  name: 'Dashboard',
  data() {
    return {
      systemInfo: {
        OSInfo: {},
        RealTimeInfo: {}
      },
      frameworkVersion: '.NET Core 2.2.1',
      memoryUse: '',
      diskUse: ''
    }
  },
  computed: {
    ...mapGetters(['name'])
  },
  created() {
    this.fetchData()
    this.$nextTick(() => {
      setInterval(this.fetchData, 10000)
    })
  },
  methods: {
    fetchData() {
      getSystemInfo().then(data => {
        this.systemInfo.OSInfo = data.systemInfo
        this.systemInfo.RealTimeInfo = data.realTimeInfo
        this.systemInfo.RealTimeInfo.MemUsage = parseFloat(this.systemInfo.RealTimeInfo.MemUsage)
        this.systemInfo.RealTimeInfo.DiskUsage = parseFloat(this.systemInfo.RealTimeInfo.DiskUsage)
        this.memoryUse = this.systemInfo.RealTimeInfo.MemUsed + ' / ' + this.systemInfo.RealTimeInfo.MemTotal
        this.diskUse = this.systemInfo.RealTimeInfo.DiskUsed + ' / ' + this.systemInfo.RealTimeInfo.DiskTotal
      })
    }
  }
}
</script>
<style scoped>
.dashboard{
  padding:0 20px
}
.el-card
{
  margin: 20px 0 0 0
}
.el-progress
{
  margin-top: 8px
}
</style>
