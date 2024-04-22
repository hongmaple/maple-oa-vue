package com.ruoyi.oa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.dto.HolidayData;
import com.ruoyi.common.dto.HolidayVo;
import com.ruoyi.common.utils.HolidayUtil;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.data.domain.Example;
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
import com.ruoyi.oa.domain.OaHoliday;
import com.ruoyi.oa.service.IOaHolidayService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 节假日Controller
 * 
 * @author maple
 * @date 2024-04-22
 */
@RestController
@RequestMapping("/oa/holiday")
public class OaHolidayController extends BaseController
{
    @Autowired
    private IOaHolidayService oaHolidayService;

    @Autowired
    private HolidayUtil holidayUtil;


    /**
     * 查询节假日列表
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:list')")
    @GetMapping("/list")
    public TableDataInfo list(OaHoliday oaHoliday)
    {
        startPage();
        List<OaHoliday> list = oaHolidayService.selectOaHolidayList(oaHoliday);
        return getDataTable(list);
    }

    /**
     * 导出节假日列表
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:export')")
    @Log(title = "节假日", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OaHoliday oaHoliday)
    {
        List<OaHoliday> list = oaHolidayService.selectOaHolidayList(oaHoliday);
        ExcelUtil<OaHoliday> util = new ExcelUtil<OaHoliday>(OaHoliday.class);
        util.exportExcel(response, list, "节假日数据");
    }

    /**
     * 获取节假日详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(oaHolidayService.selectOaHolidayById(id));
    }

    /**
     * 新增节假日
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:add')")
    @Log(title = "节假日", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OaHoliday oaHoliday)
    {
        return toAjax(oaHolidayService.insertOaHoliday(oaHoliday));
    }

    /**
     * 修改节假日
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:edit')")
    @Log(title = "节假日", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OaHoliday oaHoliday)
    {
        return toAjax(oaHolidayService.updateOaHoliday(oaHoliday));
    }

    /**
     * 删除节假日
     */
    @PreAuthorize("@ss.hasPermi('oa:holiday:remove')")
    @Log(title = "节假日", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(oaHolidayService.deleteOaHolidayByIds(ids));
    }

    /**
     * 掉接口自动保存节假日休息日
     * @param year 年份
     */
    public void autoAdd(String year) {
        oaHolidayService.autoAdd(year);
    }

}
