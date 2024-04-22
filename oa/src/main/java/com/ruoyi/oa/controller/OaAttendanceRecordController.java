package com.ruoyi.oa.controller;

import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.utils.MyCalendar;
import com.ruoyi.oa.domain.OaAttendanceRule;
import com.ruoyi.oa.service.IOaAttendanceRuleService;
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
import com.ruoyi.oa.domain.OaAttendanceRecord;
import com.ruoyi.oa.service.IOaAttendanceRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 打卡记录Controller
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
@RestController
@RequestMapping("/oa/record")
public class OaAttendanceRecordController extends BaseController
{
    @Autowired
    private IOaAttendanceRecordService oaAttendanceRecordService;

    @Autowired
    private IOaAttendanceRuleService oaAttendanceRuleService;

    /**
     * 查询打卡记录列表
     */
    @PreAuthorize("@ss.hasPermi('oa:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(OaAttendanceRecord oaAttendanceRecord)
    {
        startPage();
        List<OaAttendanceRecord> list = oaAttendanceRecordService.selectOaAttendanceRecordList(oaAttendanceRecord);
        return getDataTable(list);
    }

    /**
     * 查询打卡记录列表
     */
    @PreAuthorize("@ss.hasPermi('oa:record:myList')")
    @GetMapping("/myList")
    public TableDataInfo myList(OaAttendanceRecord oaAttendanceRecord)
    {
        startPage();
        oaAttendanceRecord.setCreateBy(getUsername());
        List<OaAttendanceRecord> list = oaAttendanceRecordService.selectOaAttendanceRecordList(oaAttendanceRecord);
        return getDataTable(list);
    }

    /**
     * 导出打卡记录列表
     */
    @PreAuthorize("@ss.hasPermi('oa:record:export')")
    @Log(title = "打卡记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OaAttendanceRecord oaAttendanceRecord)
    {
        List<OaAttendanceRecord> list = oaAttendanceRecordService.selectOaAttendanceRecordList(oaAttendanceRecord);
        ExcelUtil<OaAttendanceRecord> util = new ExcelUtil<OaAttendanceRecord>(OaAttendanceRecord.class);
        util.exportExcel(response, list, "打卡记录数据");
    }

    /**
     * 获取打卡记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(oaAttendanceRecordService.selectOaAttendanceRecordById(id));
    }

    /**
     * 新增打卡记录
     */
    @RepeatSubmit(interval = 10000, message = "请求过于频繁")
    @PreAuthorize("@ss.hasPermi('oa:record:add')")
    @Log(title = "打卡记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OaAttendanceRecord oaAttendanceRecord)
    {
        oaAttendanceRecord.setCreateBy(getUsername());
        List<OaAttendanceRule> oaAttendanceRules = oaAttendanceRuleService.selectOaAttendanceRuleList(new OaAttendanceRule());
        if (CollectionUtil.isNotEmpty(oaAttendanceRules)) {
            oaAttendanceRecord.setStartTime(oaAttendanceRules.get(0).getStartTime());
            oaAttendanceRecord.setEndTime(oaAttendanceRules.get(0).getEndTime());
        } else {
            return AjaxResult.error("没有打卡规则");
        }
        return toAjax(oaAttendanceRecordService.insertOaAttendanceRecord(oaAttendanceRecord));
    }

    /**
     * 修改打卡记录
     */
    @PreAuthorize("@ss.hasPermi('oa:record:edit')")
    @Log(title = "打卡记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OaAttendanceRecord oaAttendanceRecord)
    {
        oaAttendanceRecord.setUpdateBy(getUsername());
        return toAjax(oaAttendanceRecordService.updateOaAttendanceRecord(oaAttendanceRecord));
    }

    /**
     * 删除打卡记录
     */
    @PreAuthorize("@ss.hasPermi('oa:record:remove')")
    @Log(title = "打卡记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(oaAttendanceRecordService.deleteOaAttendanceRecordByIds(ids));
    }

    /**
     * 我的考勤统计
     */
    @PreAuthorize("@ss.hasPermi('oa:record:myList')")
    @GetMapping("/myAttendanceStatistics")
    public AjaxResult myAttendanceStatistics(@RequestBody OaAttendanceRecord oaAttendanceRecord) {
        List<OaAttendanceRule> oaAttendanceRules = oaAttendanceRuleService.selectOaAttendanceRuleList(new OaAttendanceRule());
        if (CollectionUtil.isNotEmpty(oaAttendanceRules)) {
            oaAttendanceRecord.setStartTime(oaAttendanceRules.get(0).getStartTime());
            oaAttendanceRecord.setEndTime(oaAttendanceRules.get(0).getEndTime());
        } else {
            return AjaxResult.error("没有打卡规则");
        }
        oaAttendanceRecord.setCreateBy(getUsername());
        return AjaxResult.success(oaAttendanceRecordService.attendanceStatistics(oaAttendanceRecord));
    }
}
