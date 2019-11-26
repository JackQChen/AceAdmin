import request from '@/utils/request'

export function login(username, password) {
  return request({
    url: 'TokenAuth/Authenticate',
    method: 'post',
    data: {
      username,
      password
    }
  })
}

export function getInfo(token) {
  return request({
    url: 'Session/GetCurrentLoginInformations',
    method: 'get'
  })
}

export function logout() {
  return request({
    url: '/user/logout',
    method: 'post'
  })
}
