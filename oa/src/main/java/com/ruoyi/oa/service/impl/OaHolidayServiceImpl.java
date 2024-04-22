package com.ruoyi.oa.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.dto.HolidayData;
import com.ruoyi.common.dto.HolidayVo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.HolidayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.oa.mapper.OaHolidayMapper;
import com.ruoyi.oa.domain.OaHoliday;
import com.ruoyi.oa.service.IOaHolidayService;

import javax.annotation.Resource;

/**
 * 节假日Service业务层处理
 * 
 * @author maple
 * @date 2024-04-22
 */
@Service
public class OaHolidayServiceImpl implements IOaHolidayService 
{
    @Autowired
    private OaHolidayMapper oaHolidayMapper;

    @Autowired
    private HolidayUtil holidayUtil;
//
//    @Resource(name = "dataSource")
//    private DataSource dataSource;

    /**
     * 查询节假日
     * 
     * @param id 节假日主键
     * @return 节假日
     */
    @Override
    public OaHoliday selectOaHolidayById(Long id)
    {
        return oaHolidayMapper.selectOaHolidayById(id);
    }

    /**
     * 查询节假日列表
     * 
     * @param oaHoliday 节假日
     * @return 节假日
     */
    @Override
    public List<OaHoliday> selectOaHolidayList(OaHoliday oaHoliday)
    {
        return oaHolidayMapper.selectOaHolidayList(oaHoliday);
    }

    /**
     * 新增节假日
     * 
     * @param oaHoliday 节假日
     * @return 结果
     */
    @Override
    public int insertOaHoliday(OaHoliday oaHoliday)
    {
        oaHoliday.setCreateTime(DateUtils.getNowDate());
        return oaHolidayMapper.insertOaHoliday(oaHoliday);
    }

    /**
     * 修改节假日
     * 
     * @param oaHoliday 节假日
     * @return 结果
     */
    @Override
    public int updateOaHoliday(OaHoliday oaHoliday)
    {
        oaHoliday.setUpdateTime(DateUtils.getNowDate());
        return oaHolidayMapper.updateOaHoliday(oaHoliday);
    }

    /**
     * 批量删除节假日
     * 
     * @param ids 需要删除的节假日主键
     * @return 结果
     */
    @Override
    public int deleteOaHolidayByIds(Long[] ids)
    {
        return oaHolidayMapper.deleteOaHolidayByIds(ids);
    }

    /**
     * 删除节假日信息
     * 
     * @param id 节假日主键
     * @return 结果
     */
    @Override
    public int deleteOaHolidayById(Long id)
    {
        return oaHolidayMapper.deleteOaHolidayById(id);
    }

    @Override
    public int insertOaHolidayList(List<OaHoliday> holidays) {
        return oaHolidayMapper.insertOaHolidayList(holidays);
//        Connection connection = null;
//        PreparedStatement statement = null;
//        try {
//            connection = dataSource.getConnection();
//            connection.setAutoCommit(false);
//            String sql = "INSERT INTO `user` (`username`, `address`, `remark`, `age`, `create_time`) " +
//                    "VALUES (?,?,?,?,now()) ";
//            statement = connection.prepareStatement(sql);
//            for (OaHoliday holiday : holidays) {
//                statement.setString(1, holiday.getUsername());
//                statement.setString(2, holiday.getAddress());
//                statement.setString(3, holiday.getRemark());
//                statement.setInt(4, holiday.getAge());
//                statement.addBatch();
//            }
//            statement.executeBatch();
//            connection.commit();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        } finally {
//            statement.close();
//            connection.close();
//        }
    }

    @Override
    public int autoAdd(String year) {
        List<HolidayData> holidayData = holidayUtil.getDay(year);
        List<HolidayVo> holidayVos = new ArrayList<>();
        holidayData.stream().map(HolidayData::getDays).collect(Collectors.toList()).forEach(d ->
                holidayVos.addAll(d.stream().filter(h -> h.getType()!=0).collect(Collectors.toList())));
        List<OaHoliday> holidays = new ArrayList<>();
        holidayVos.forEach(holidayVo -> {
            OaHoliday oaHoliday = new OaHoliday();
            oaHoliday.setDate(holidayVo.getDate());
            oaHoliday.setType(holidayVo.getType());
            oaHoliday.setTypeDes(holidayVo.getTypeDes());
            oaHoliday.setCreateBy("admin");
            holidays.add(oaHoliday);
        });
        return insertOaHolidayList(holidays);
    }
}
