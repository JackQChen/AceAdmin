import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'Module/GetAll',
    method: 'get',
    params
  })
}
