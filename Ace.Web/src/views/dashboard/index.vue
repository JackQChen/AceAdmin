<template>
  <div class="dashboard-container">
    <div class="dashboard-text">name:{{ name }}</div>
    <div class="dashboard-text">OSInfo:{{ systemInfo.OSInfo }}</div>
    <div class="dashboard-text">RealTimeInfo:{{ systemInfo.RealTimeInfo }}</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { getSystemInfo } from '@/api/home'

export default {
  name: 'Dashboard',
  data() {
    return {
      systemInfo: {
        OSInfo: {},
        RealTimeInfo: {}
      }
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
      })
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
</style>
