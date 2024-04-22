package com.ruoyi.oa.service;

import java.util.List;
import com.ruoyi.oa.domain.OaHoliday;

/**
 * 节假日Service接口
 * 
 * @author maple
 * @date 2024-04-22
 */
public interface IOaHolidayService 
{
    /**
     * 查询节假日
     * 
     * @param id 节假日主键
     * @return 节假日
     */
    public OaHoliday selectOaHolidayById(Long id);

    /**
     * 查询节假日列表
     * 
     * @param oaHoliday 节假日
     * @return 节假日集合
     */
    public List<OaHoliday> selectOaHolidayList(OaHoliday oaHoliday);

    /**
     * 新增节假日
     * 
     * @param oaHoliday 节假日
     * @return 结果
     */
    public int insertOaHoliday(OaHoliday oaHoliday);

    /**
     * 修改节假日
     * 
     * @param oaHoliday 节假日
     * @return 结果
     */
    public int updateOaHoliday(OaHoliday oaHoliday);

    /**
     * 批量删除节假日
     * 
     * @param ids 需要删除的节假日主键集合
     * @return 结果
     */
    public int deleteOaHolidayByIds(Long[] ids);

    /**
     * 删除节假日信息
     * 
     * @param id 节假日主键
     * @return 结果
     */
    public int deleteOaHolidayById(Long id);

    int insertOaHolidayList(List<OaHoliday> holidays);

    int autoAdd(String year);
}
