package com.ruoyi.oa.service;

import java.util.List;
import com.ruoyi.oa.domain.OaAttendanceRule;

/**
 * 打卡规则Service接口
 * 
 * @author maple
 * @date 2024-04-22
 */
public interface IOaAttendanceRuleService 
{
    /**
     * 查询打卡规则
     * 
     * @param id 打卡规则主键
     * @return 打卡规则
     */
    public OaAttendanceRule selectOaAttendanceRuleById(Long id);

    /**
     * 查询打卡规则列表
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 打卡规则集合
     */
    public List<OaAttendanceRule> selectOaAttendanceRuleList(OaAttendanceRule oaAttendanceRule);

    /**
     * 新增打卡规则
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 结果
     */
    public int insertOaAttendanceRule(OaAttendanceRule oaAttendanceRule);

    /**
     * 修改打卡规则
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 结果
     */
    public int updateOaAttendanceRule(OaAttendanceRule oaAttendanceRule);

    /**
     * 批量删除打卡规则
     * 
     * @param ids 需要删除的打卡规则主键集合
     * @return 结果
     */
    public int deleteOaAttendanceRuleByIds(Long[] ids);

    /**
     * 删除打卡规则信息
     * 
     * @param id 打卡规则主键
     * @return 结果
     */
    public int deleteOaAttendanceRuleById(Long id);
}
