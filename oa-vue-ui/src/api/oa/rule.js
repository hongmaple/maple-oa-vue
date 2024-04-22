import request from '@/utils/request'

// 查询打卡规则列表
export function listRule(query) {
  return request({
    url: '/oa/rule/list',
    method: 'get',
    params: query
  })
}

// 查询打卡规则详细
export function getRule(id) {
  return request({
    url: '/oa/rule/' + id,
    method: 'get'
  })
}

// 新增打卡规则
export function addRule(data) {
  return request({
    url: '/oa/rule',
    method: 'post',
    data: data
  })
}

// 修改打卡规则
export function updateRule(data) {
  return request({
    url: '/oa/rule',
    method: 'put',
    data: data
  })
}

// 删除打卡规则
export function delRule(id) {
  return request({
    url: '/oa/rule/' + id,
    method: 'delete'
  })
}
