package com.ruoyi.oa.mapper;

import java.util.List;
import com.ruoyi.oa.domain.OaHoliday;
import org.apache.ibatis.annotations.Param;

/**
 * 节假日Mapper接口
 * 
 * @author maple
 * @date 2024-04-22
 */
public interface OaHolidayMapper 
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
     * 删除节假日
     * 
     * @param id 节假日主键
     * @return 结果
     */
    public int deleteOaHolidayById(Long id);

    /**
     * 批量删除节假日
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOaHolidayByIds(Long[] ids);

    int insertOaHolidayList(@Param("holidays") List<OaHoliday> holidays);
}
