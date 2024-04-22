package com.ruoyi.oa.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.oa.domain.OaApproval;
import com.ruoyi.oa.service.IOaApprovalService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 审批Controller
 * 
 * @author maple
 * @date 2024-04-22
 */
@RestController
@RequestMapping("/oa/approval")
public class OaApprovalController extends BaseController
{
    @Autowired
    private IOaApprovalService oaApprovalService;

    /**
     * 查询审批列表
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:list')")
    @GetMapping("/list")
    public TableDataInfo list(OaApproval oaApproval)
    {
        startPage();
        List<OaApproval> list = oaApprovalService.selectOaApprovalList(oaApproval);
        return getDataTable(list);
    }

    /**
     * 查询审批列表
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:myList')")
    @GetMapping("/myList")
    public TableDataInfo myList(OaApproval oaApproval)
    {
        startPage();
        oaApproval.setCreateBy(getUsername());
        List<OaApproval> list = oaApprovalService.selectOaApprovalList(oaApproval);
        return getDataTable(list);
    }

    /**
     * 导出审批列表
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:export')")
    @Log(title = "审批", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OaApproval oaApproval)
    {
        List<OaApproval> list = oaApprovalService.selectOaApprovalList(oaApproval);
        ExcelUtil<OaApproval> util = new ExcelUtil<OaApproval>(OaApproval.class);
        util.exportExcel(response, list, "审批数据");
    }

    /**
     * 获取审批详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(oaApprovalService.selectOaApprovalById(id));
    }

    /**
     * 新增审批
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:add')")
    @Log(title = "审批", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OaApproval oaApproval)
    {
        oaApproval.setCreateBy(getUsername());
        return toAjax(oaApprovalService.insertOaApproval(oaApproval));
    }

    /**
     * 修改审批
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:edit')")
    @Log(title = "审批", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OaApproval oaApproval)
    {
        oaApproval.setUpdateBy(getUsername());
        return toAjax(oaApprovalService.updateOaApproval(oaApproval));
    }

    /**
     * 删除审批
     */
    @PreAuthorize("@ss.hasPermi('oa:approval:remove')")
    @Log(title = "审批", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(oaApprovalService.deleteOaApprovalByIds(ids));
    }
}
