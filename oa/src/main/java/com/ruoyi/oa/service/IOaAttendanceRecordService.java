package com.ruoyi.oa.service;

import java.util.List;
import com.ruoyi.oa.domain.OaAttendanceRecord;
import com.ruoyi.oa.dto.vo.AttendanceStatisticsVo;

/**
 * 打卡记录Service接口
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
public interface IOaAttendanceRecordService 
{
    /**
     * 查询打卡记录
     * 
     * @param id 打卡记录主键
     * @return 打卡记录
     */
    public OaAttendanceRecord selectOaAttendanceRecordById(Long id);

    /**
     * 查询打卡记录列表
     * 
     * @param oaAttendanceRecord 打卡记录
     * @return 打卡记录集合
     */
    public List<OaAttendanceRecord> selectOaAttendanceRecordList(OaAttendanceRecord oaAttendanceRecord);

    /**
     * 新增打卡记录
     * 
     * @param oaAttendanceRecord 打卡记录
     * @return 结果
     */
    public int insertOaAttendanceRecord(OaAttendanceRecord oaAttendanceRecord);

    /**
     * 修改打卡记录
     * 
     * @param oaAttendanceRecord 打卡记录
     * @return 结果
     */
    public int updateOaAttendanceRecord(OaAttendanceRecord oaAttendanceRecord);

    /**
     * 批量删除打卡记录
     * 
     * @param ids 需要删除的打卡记录主键集合
     * @return 结果
     */
    public int deleteOaAttendanceRecordByIds(Long[] ids);

    /**
     * 删除打卡记录信息
     * 
     * @param id 打卡记录主键
     * @return 结果
     */
    public int deleteOaAttendanceRecordById(Long id);

    AttendanceStatisticsVo attendanceStatistics(OaAttendanceRecord oaAttendanceRecord);
}
