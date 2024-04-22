package com.ruoyi.oa.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.oa.mapper.OaApprovalMapper;
import com.ruoyi.oa.domain.OaApproval;
import com.ruoyi.oa.service.IOaApprovalService;

/**
 * 审批Service业务层处理
 * 
 * @author maple
 * @date 2024-04-22
 */
@Service
public class OaApprovalServiceImpl implements IOaApprovalService 
{
    @Autowired
    private OaApprovalMapper oaApprovalMapper;

    /**
     * 查询审批
     * 
     * @param id 审批主键
     * @return 审批
     */
    @Override
    public OaApproval selectOaApprovalById(Long id)
    {
        return oaApprovalMapper.selectOaApprovalById(id);
    }

    /**
     * 查询审批列表
     * 
     * @param oaApproval 审批
     * @return 审批
     */
    @Override
    public List<OaApproval> selectOaApprovalList(OaApproval oaApproval)
    {
        return oaApprovalMapper.selectOaApprovalList(oaApproval);
    }

    /**
     * 新增审批
     * 
     * @param oaApproval 审批
     * @return 结果
     */
    @Override
    public int insertOaApproval(OaApproval oaApproval)
    {
        oaApproval.setCreateTime(DateUtils.getNowDate());
        return oaApprovalMapper.insertOaApproval(oaApproval);
    }

    /**
     * 修改审批
     * 
     * @param oaApproval 审批
     * @return 结果
     */
    @Override
    public int updateOaApproval(OaApproval oaApproval)
    {
        oaApproval.setUpdateTime(DateUtils.getNowDate());
        return oaApprovalMapper.updateOaApproval(oaApproval);
    }

    /**
     * 批量删除审批
     * 
     * @param ids 需要删除的审批主键
     * @return 结果
     */
    @Override
    public int deleteOaApprovalByIds(Long[] ids)
    {
        return oaApprovalMapper.deleteOaApprovalByIds(ids);
    }

    /**
     * 删除审批信息
     * 
     * @param id 审批主键
     * @return 结果
     */
    @Override
    public int deleteOaApprovalById(Long id)
    {
        return oaApprovalMapper.deleteOaApprovalById(id);
    }
}
