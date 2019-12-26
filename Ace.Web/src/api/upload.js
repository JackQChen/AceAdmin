import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'Document/GetAll',
    method: 'get',
    params
  })
}

export function createDocument(data) {
  return request({
    url: 'Document/CreateDocument',
    method: 'post',
    data
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

export function deleteDocument(params) {
  return request({
    url: 'Document/DeleteDocument',
    method: 'delete',
    params
  })
}
