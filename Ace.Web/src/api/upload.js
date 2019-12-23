import request from '@/utils/request'

export function getList(data) {
  return request({
    url: 'UploadFile/GetAll',
    method: 'post',
    data
  })
}
