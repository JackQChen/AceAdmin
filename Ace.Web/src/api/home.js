import request from '@/utils/request'

export function getSystemInfo() {
  return request({
    url: 'Configuration/GetSystemInfo',
    method: 'get'
  })
}
