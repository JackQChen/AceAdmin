import request from '@/utils/request'

export function getMenuTree(params) {
  return request({
    url: 'Menu/GetMenuTree',
    method: 'get',
    params
  })
}

export function createMenu(data) {
  return request({
    url: 'Menu/Create',
    method: 'post',
    data
  })
}

export function updateMenu(data) {
  return request({
    url: 'Menu/Update',
    method: 'put',
    data
  })
}

export function deleteMenu(params) {
  return request({
    url: 'Menu/Delete',
    method: 'delete',
    params
  })
}
