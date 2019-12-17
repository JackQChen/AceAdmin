import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'AuditLog/GetAll',
    method: 'get',
    params
  })
}
