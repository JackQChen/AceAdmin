import request from '@/utils/request'

export function getList(params) {
  return request({
    url: 'UploadFile/GetAll',
    method: 'get',
    params
  })
}
