import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'Document/GetAll',
    method: 'get',
    params
  })
}
