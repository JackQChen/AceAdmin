import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'Menu/GetAll',
    method: 'get',
    params
  })
}
