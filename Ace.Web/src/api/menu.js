import request from '@/utils/request'

export function getMenuTree(params) {
  return request({
    url: 'Menu/GetMenuTree',
    method: 'get',
    params
  })
}
