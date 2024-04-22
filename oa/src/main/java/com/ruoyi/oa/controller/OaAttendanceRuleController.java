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
import com.ruoyi.oa.domain.OaAttendanceRule;
import com.ruoyi.oa.service.IOaAttendanceRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 打卡规则Controller
 * 
 * @author maple
 * @date 2024-04-22
 */
@RestController
@RequestMapping("/oa/rule")
public class OaAttendanceRuleController extends BaseController
{
    @Autowired
    private IOaAttendanceRuleService oaAttendanceRuleService;

    /**
     * 查询打卡规则列表
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:list')")
    @GetMapping("/list")
    public TableDataInfo list(OaAttendanceRule oaAttendanceRule)
    {
        startPage();
        List<OaAttendanceRule> list = oaAttendanceRuleService.selectOaAttendanceRuleList(oaAttendanceRule);
        return getDataTable(list);
    }

    /**
     * 导出打卡规则列表
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:export')")
    @Log(title = "打卡规则", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OaAttendanceRule oaAttendanceRule)
    {
        List<OaAttendanceRule> list = oaAttendanceRuleService.selectOaAttendanceRuleList(oaAttendanceRule);
        ExcelUtil<OaAttendanceRule> util = new ExcelUtil<OaAttendanceRule>(OaAttendanceRule.class);
        util.exportExcel(response, list, "打卡规则数据");
    }

    /**
     * 获取打卡规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(oaAttendanceRuleService.selectOaAttendanceRuleById(id));
    }

    /**
     * 新增打卡规则
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:add')")
    @Log(title = "打卡规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OaAttendanceRule oaAttendanceRule)
    {
        oaAttendanceRule.setCreateBy(getUsername());
        return toAjax(oaAttendanceRuleService.insertOaAttendanceRule(oaAttendanceRule));
    }

    /**
     * 修改打卡规则
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:edit')")
    @Log(title = "打卡规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OaAttendanceRule oaAttendanceRule)
    {
        oaAttendanceRule.setUpdateBy(getUsername());
        return toAjax(oaAttendanceRuleService.updateOaAttendanceRule(oaAttendanceRule));
    }

    /**
     * 删除打卡规则
     */
    @PreAuthorize("@ss.hasPermi('oa:rule:remove')")
    @Log(title = "打卡规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(oaAttendanceRuleService.deleteOaAttendanceRuleByIds(ids));
    }
}
