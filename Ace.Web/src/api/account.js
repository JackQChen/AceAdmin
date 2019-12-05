import request from '@/utils/request'

export function login(data) {
  return request({
    url: 'TokenAuth/Authenticate',
    method: 'post',
    data
  })
}

export function getInfo() {
  return request({
    url: 'Session/GetCurrentLoginInformations',
    method: 'get'
  })
}

export function getPermission() {
  return request({
    url: 'Configuration/GetMenuTree',
    method: 'get'
  })
}

export function logout() {
  return request({
    url: 'TokenAuth/Reset',
    method: 'post'
  })
}
