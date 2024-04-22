package com.ruoyi.oa.service;

import java.util.List;
import com.ruoyi.oa.domain.OaApproval;

/**
 * 审批Service接口
 * 
 * @author maple
 * @date 2024-04-22
 */
public interface IOaApprovalService 
{
    /**
     * 查询审批
     * 
     * @param id 审批主键
     * @return 审批
     */
    public OaApproval selectOaApprovalById(Long id);

    /**
     * 查询审批列表
     * 
     * @param oaApproval 审批
     * @return 审批集合
     */
    public List<OaApproval> selectOaApprovalList(OaApproval oaApproval);

    /**
     * 新增审批
     * 
     * @param oaApproval 审批
     * @return 结果
     */
    public int insertOaApproval(OaApproval oaApproval);

    /**
     * 修改审批
     * 
     * @param oaApproval 审批
     * @return 结果
     */
    public int updateOaApproval(OaApproval oaApproval);

    /**
     * 批量删除审批
     * 
     * @param ids 需要删除的审批主键集合
     * @return 结果
     */
    public int deleteOaApprovalByIds(Long[] ids);

    /**
     * 删除审批信息
     * 
     * @param id 审批主键
     * @return 结果
     */
    public int deleteOaApprovalById(Long id);
}
