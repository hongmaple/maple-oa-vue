import request from '@/utils/request'

// 查询节假日列表
export function listHoliday(query) {
  return request({
    url: '/oa/holiday/list',
    method: 'get',
    params: query
  })
}

// 查询节假日详细
export function getHoliday(id) {
  return request({
    url: '/oa/holiday/' + id,
    method: 'get'
  })
}

// 新增节假日
export function addHoliday(data) {
  return request({
    url: '/oa/holiday',
    method: 'post',
    data: data
  })
}

// 修改节假日
export function updateHoliday(data) {
  return request({
    url: '/oa/holiday',
    method: 'put',
    data: data
  })
}

// 删除节假日
export function delHoliday(id) {
  return request({
    url: '/oa/holiday/' + id,
    method: 'delete'
  })
}
