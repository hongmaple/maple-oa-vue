package com.ruoyi.oa.service.impl;

import java.util.List;

import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.oa.mapper.OaAttendanceRuleMapper;
import com.ruoyi.oa.domain.OaAttendanceRule;
import com.ruoyi.oa.service.IOaAttendanceRuleService;

/**
 * 打卡规则Service业务层处理
 * 
 * @author maple
 * @date 2024-04-22
 */
@Service
public class OaAttendanceRuleServiceImpl implements IOaAttendanceRuleService 
{
    @Autowired
    private OaAttendanceRuleMapper oaAttendanceRuleMapper;

    /**
     * 查询打卡规则
     * 
     * @param id 打卡规则主键
     * @return 打卡规则
     */
    @Override
    public OaAttendanceRule selectOaAttendanceRuleById(Long id)
    {
        return oaAttendanceRuleMapper.selectOaAttendanceRuleById(id);
    }

    /**
     * 查询打卡规则列表
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 打卡规则
     */
    @Override
    public List<OaAttendanceRule> selectOaAttendanceRuleList(OaAttendanceRule oaAttendanceRule)
    {
        return oaAttendanceRuleMapper.selectOaAttendanceRuleList(oaAttendanceRule);
    }

    /**
     * 新增打卡规则
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 结果
     */
    @Override
    public int insertOaAttendanceRule(OaAttendanceRule oaAttendanceRule)
    {
        List<OaAttendanceRule> oaAttendanceRules = selectOaAttendanceRuleList(new OaAttendanceRule());
        if (CollectionUtil.isNotEmpty(oaAttendanceRules)) {
            OaAttendanceRule update = oaAttendanceRules.get(0);
            update.setStartTime(oaAttendanceRule.getStartTime());
            update.setEndTime(oaAttendanceRule.getEndTime());
            return updateOaAttendanceRule(update);
        }
        oaAttendanceRule.setCreateTime(DateUtils.getNowDate());
        return oaAttendanceRuleMapper.insertOaAttendanceRule(oaAttendanceRule);
    }

    /**
     * 修改打卡规则
     * 
     * @param oaAttendanceRule 打卡规则
     * @return 结果
     */
    @Override
    public int updateOaAttendanceRule(OaAttendanceRule oaAttendanceRule)
    {
        oaAttendanceRule.setUpdateTime(DateUtils.getNowDate());
        return oaAttendanceRuleMapper.updateOaAttendanceRule(oaAttendanceRule);
    }

    /**
     * 批量删除打卡规则
     * 
     * @param ids 需要删除的打卡规则主键
     * @return 结果
     */
    @Override
    public int deleteOaAttendanceRuleByIds(Long[] ids)
    {
        return oaAttendanceRuleMapper.deleteOaAttendanceRuleByIds(ids);
    }

    /**
     * 删除打卡规则信息
     * 
     * @param id 打卡规则主键
     * @return 结果
     */
    @Override
    public int deleteOaAttendanceRuleById(Long id)
    {
        return oaAttendanceRuleMapper.deleteOaAttendanceRuleById(id);
    }
}
