import request from '@/utils/request'

// 查询打卡记录列表
export function listRecord(query) {
  return request({
    url: '/oa/record/list',
    method: 'get',
    params: query
  })
}

// 查询打卡记录列表
export function myListRecord(query) {
  return request({
    url: '/oa/record/myList',
    method: 'get',
    params: query
  })
}

// 查询打卡统计
export function myAttendanceStatistics(query) {
  return request({
    url: '/oa/record/myAttendanceStatistics',
    method: 'get',
    params: query
  })
}


// 查询打卡记录详细
export function getRecord(id) {
  return request({
    url: '/oa/record/' + id,
    method: 'get'
  })
}

// 新增打卡记录
export function addRecord(data) {
  return request({
    url: '/oa/record',
    method: 'post',
    data: data
  })
}

// 修改打卡记录
export function updateRecord(data) {
  return request({
    url: '/oa/record',
    method: 'put',
    data: data
  })
}

// 删除打卡记录
export function delRecord(id) {
  return request({
    url: '/oa/record/' + id,
    method: 'delete'
  })
}
