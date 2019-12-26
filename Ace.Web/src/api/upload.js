import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'Document/GetAll',
    method: 'get',
    params
  })
}

export function getDocument(params) {
  return request({
    url: 'Document/GetDocument',
    method: 'get',
    responseType: 'blob',
    params
  })
}
